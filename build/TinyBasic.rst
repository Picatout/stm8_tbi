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
      008000 82 00 86 58            109     int cold_start			; RESET vector 
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
      0080AA CC 86 58         [ 2]  188 	jp cold_start 	
      0080AD                        189 2$: 
      0080AD A1 1A            [ 1]  190 	cp a,#CTRL_Z
      0080AF 26 06            [ 1]  191 	jrne 3$
      0080B1 CD 87 1A         [ 4]  192 	call cancel_autorun 
      0080B4 CC 86 58         [ 2]  193 	jp cold_start 
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
      00810F CD 95 5C         [ 4]  264 	call prt_basic_line
      008112                        265 UBTN_Handler_exit:
      008112 AE 17 FF         [ 2]  266     ldw x,#STACK_EMPTY 
      008115 94               [ 1]  267     ldw sp,x
      008116 9A               [ 1]  268 	rim 
      008117 CC 89 82         [ 2]  269 	jp warm_start
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
      0081D0 CD 84 42         [ 4]  388 	call move 
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
      008204 CD 84 42         [ 4]  432 	call move 
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
      0082F7 CD 9A 6D         [ 4]  604 	call incr_farptr
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
      008384 CD 8A 4A         [ 4]  712 	call print_int 
      008387 A6 20            [ 1]  713 	ld a,#SPACE
      008389 CD 83 40         [ 4]  714 	call putc 
      00838C 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      00838E CD 8A 4A         [ 4]  716 	call print_int 
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
      0083B4 CD 8A 4A         [ 4]  748 	call print_int 
      0083B7 A6 20            [ 1]  749 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  750 	call putc
      0083BC                        751 row_loop:
      0083BC 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  753 	ld a,(x)
      0083BF 5F               [ 1]  754 	clrw x 
      0083C0 97               [ 1]  755 	ld xl,a 
      0083C1 CD 8A 4A         [ 4]  756 	call print_int 
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
                                    811 ;   X         length 
                                    812 ;-------------------------------------
      008416                        813 strlen::
      008416 90 93            [ 1]  814 	ldw y,x 
      008418 5F               [ 1]  815 	clrw x 
      008419 90 7D            [ 1]  816 1$:	tnz (y) 
      00841B 27 05            [ 1]  817 	jreq 9$ 
      00841D 5C               [ 2]  818 	incw x
      00841E 90 5C            [ 2]  819 	incw y 
      008420 20 F7            [ 2]  820 	jra 1$ 
      008422 81               [ 4]  821 9$: ret 
                                    822 
                                    823 ;------------------------------------
                                    824 ; compare 2 strings
                                    825 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    826 ;   X 		char* first string 
                                    827 ;   Y       char* second string 
                                    828 ; output:
                                    829 ;   A 		0|1 
                                    830 ;-------------------------------------
      008423                        831 strcmp:
      008423 F6               [ 1]  832 	ld a,(x)
      008424 27 0B            [ 1]  833 	jreq 5$ 
      008426 90 F1            [ 1]  834 	cp a,(y) 
      008428 26 05            [ 1]  835 	jrne 4$ 
      00842A 5C               [ 2]  836 	incw x 
      00842B 90 5C            [ 2]  837 	incw y 
      00842D 20 F4            [ 2]  838 	jra strcmp 
      00842F                        839 4$: ; not same  
      00842F 4F               [ 1]  840 	clr a 
      008430 81               [ 4]  841 	ret 
      008431                        842 5$: ; same 
      008431 A6 01            [ 1]  843 	ld a,#1 
      008433 81               [ 4]  844 	ret 
                                    845 
                                    846 
                                    847 ;---------------------------------------
                                    848 ;  copy src to dest 
                                    849 ; input:
                                    850 ;   X 		dest 
                                    851 ;   Y 		src 
                                    852 ; output: 
                                    853 ;   X 		dest 
                                    854 ;----------------------------------
      008434                        855 strcpy:
      008434 89               [ 2]  856 	pushw x 
      008435 90 F6            [ 1]  857 1$: ld a,(y)
      008437 27 06            [ 1]  858 	jreq 9$ 
      008439 F7               [ 1]  859 	ld (x),a 
      00843A 5C               [ 2]  860 	incw x 
      00843B 90 5C            [ 2]  861 	incw y 
      00843D 20 F6            [ 2]  862 	jra 1$ 
      00843F 7F               [ 1]  863 9$:	clr (x)
      008440 85               [ 2]  864 	popw x 
      008441 81               [ 4]  865 	ret 
                                    866 
                                    867 ;---------------------------------------
                                    868 ; move memory block 
                                    869 ; input:
                                    870 ;   X 		destination 
                                    871 ;   Y 	    source 
                                    872 ;   acc16	bytes count 
                                    873 ; output:
                                    874 ;   none 
                                    875 ;--------------------------------------
                           000001   876 	INCR=1 ; increament high byte 
                           000002   877 	LB=2 ; increament low byte 
                           000002   878 	VSIZE=2
      008442                        879 move::
      0003C2                        880 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008442 52 02            [ 2]    1     sub sp,#VSIZE 
      008444 0F 01            [ 1]  881 	clr (INCR,sp)
      008446 0F 02            [ 1]  882 	clr (LB,sp)
      008448 90 89            [ 2]  883 	pushw y 
      00844A 13 01            [ 2]  884 	cpw x,(1,sp) ; compare DEST to SRC 
      00844C 90 85            [ 2]  885 	popw y 
      00844E 27 31            [ 1]  886 	jreq move_exit ; x==y 
      008450 2B 0E            [ 1]  887 	jrmi move_down
      008452                        888 move_up: ; start from top address with incr=-1
      008452 72 BB 00 0D      [ 2]  889 	addw x,acc16
      008456 72 B9 00 0D      [ 2]  890 	addw y,acc16
      00845A 03 01            [ 1]  891 	cpl (INCR,sp)
      00845C 03 02            [ 1]  892 	cpl (LB,sp)   ; increment = -1 
      00845E 20 05            [ 2]  893 	jra move_loop  
      008460                        894 move_down: ; start from bottom address with incr=1 
      008460 5A               [ 2]  895     decw x 
      008461 90 5A            [ 2]  896 	decw y
      008463 0C 02            [ 1]  897 	inc (LB,sp) ; incr=1 
      008465                        898 move_loop:	
      008465 C6 00 0D         [ 1]  899     ld a, acc16 
      008468 CA 00 0E         [ 1]  900 	or a, acc8
      00846B 27 14            [ 1]  901 	jreq move_exit 
      00846D 72 FB 01         [ 2]  902 	addw x,(INCR,sp)
      008470 72 F9 01         [ 2]  903 	addw y,(INCR,sp) 
      008473 90 F6            [ 1]  904 	ld a,(y)
      008475 F7               [ 1]  905 	ld (x),a 
      008476 89               [ 2]  906 	pushw x 
      008477 CE 00 0D         [ 2]  907 	ldw x,acc16 
      00847A 5A               [ 2]  908 	decw x 
      00847B CF 00 0D         [ 2]  909 	ldw acc16,x 
      00847E 85               [ 2]  910 	popw x 
      00847F 20 E4            [ 2]  911 	jra move_loop
      008481                        912 move_exit:
      000401                        913 	_drop VSIZE
      008481 5B 02            [ 2]    1     addw sp,#VSIZE 
      008483 81               [ 4]  914 	ret 	
                                    915 
                                    916 ;-------------------------------------
                                    917 ; search text area for a line#
                                    918 ; input:
                                    919 ;	X 			line# 
                                    920 ; output:
                                    921 ;   X 			addr of line | 0 
                                    922 ;   Y           line#|insert address if not found  
                                    923 ;-------------------------------------
                           000001   924 	LL=1 ; line length 
                           000002   925 	LB=2 ; line length low byte 
                           000002   926 	VSIZE=2 
      008484                        927 search_lineno::
      000404                        928 	_vars VSIZE
      008484 52 02            [ 2]    1     sub sp,#VSIZE 
      008486 0F 01            [ 1]  929 	clr (LL,sp)
      008488 90 CE 00 1D      [ 2]  930 	ldw y,txtbgn
      00848C                        931 search_ln_loop:
      00848C 90 C3 00 1F      [ 2]  932 	cpw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008490 2A 10            [ 1]  933 	jrpl 8$
      008492 90 F3            [ 1]  934 	cpw x,(y)
      008494 27 0E            [ 1]  935 	jreq 9$
      008496 2B 0A            [ 1]  936 	jrmi 8$ 
      008498 90 E6 02         [ 1]  937 	ld a,(2,y)
      00849B 6B 02            [ 1]  938 	ld (LB,sp),a 
      00849D 72 F9 01         [ 2]  939 	addw y,(LL,sp)
      0084A0 20 EA            [ 2]  940 	jra search_ln_loop 
      0084A2                        941 8$: 
      0084A2 5F               [ 1]  942 	clrw x 	
      0084A3 51               [ 1]  943 	exgw x,y 
      000424                        944 9$: _drop VSIZE
      0084A4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084A6 51               [ 1]  945 	exgw x,y   
      0084A7 81               [ 4]  946 	ret 
                                    947 
                                    948 ;-------------------------------------
                                    949 ; delete line at addr
                                    950 ; input:
                                    951 ;   X 		addr of line i.e DEST for move 
                                    952 ;-------------------------------------
                           000001   953 	LLEN=1
                           000003   954 	SRC=3
                           000004   955 	VSIZE=4
      0084A8                        956 del_line: 
      000428                        957 	_vars VSIZE 
      0084A8 52 04            [ 2]    1     sub sp,#VSIZE 
      0084AA E6 02            [ 1]  958 	ld a,(2,x) ; line length
      0084AC 6B 02            [ 1]  959 	ld (LLEN+1,sp),a 
      0084AE 0F 01            [ 1]  960 	clr (LLEN,sp)
      0084B0 90 93            [ 1]  961 	ldw y,x  
      0084B2 72 F9 01         [ 2]  962 	addw y,(LLEN,sp) ;SRC  
      0084B5 17 03            [ 2]  963 	ldw (SRC,sp),y  ;save source 
      0084B7 90 CE 00 1F      [ 2]  964 	ldw y,txtend 
      0084BB 72 F2 03         [ 2]  965 	subw y,(SRC,sp) ; y=count 
      0084BE 90 CF 00 0D      [ 2]  966 	ldw acc16,y 
      0084C2 16 03            [ 2]  967 	ldw y,(SRC,sp)    ; source
      0084C4 CD 84 42         [ 4]  968 	call move
      0084C7 90 CE 00 1F      [ 2]  969 	ldw y,txtend 
      0084CB 72 F2 01         [ 2]  970 	subw y,(LLEN,sp)
      0084CE 90 CF 00 1F      [ 2]  971 	ldw txtend,y  
      000452                        972 	_drop VSIZE     
      0084D2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084D4 81               [ 4]  973 	ret 
                                    974 
                                    975 ;---------------------------------------------
                                    976 ; create a gap in text area to 
                                    977 ; move new line in this gap
                                    978 ; input:
                                    979 ;    X 			addr gap start 
                                    980 ;    Y 			gap length 
                                    981 ; output:
                                    982 ;    X 			addr gap start 
                                    983 ;--------------------------------------------
                           000001   984 	DEST=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                           000003   985 	SRC=3
                           000005   986 	LEN=5
                           000006   987 	VSIZE=6 
      0084D5                        988 create_gap:
      000455                        989 	_vars VSIZE
      0084D5 52 06            [ 2]    1     sub sp,#VSIZE 
      0084D7 1F 03            [ 2]  990 	ldw (SRC,sp),x 
      0084D9 17 05            [ 2]  991 	ldw (LEN,sp),y 
      0084DB 90 CF 00 0D      [ 2]  992 	ldw acc16,y 
      0084DF 90 93            [ 1]  993 	ldw y,x ; SRC
      0084E1 72 BB 00 0D      [ 2]  994 	addw x,acc16  
      0084E5 1F 01            [ 2]  995 	ldw (DEST,sp),x 
                                    996 ;compute size to move 	
      0084E7 CE 00 1F         [ 2]  997 	ldw x,txtend 
      0084EA 72 F0 03         [ 2]  998 	subw x,(SRC,sp)
      0084ED CF 00 0D         [ 2]  999 	ldw acc16,x ; size to move
      0084F0 1E 01            [ 2] 1000 	ldw x,(DEST,sp) 
      0084F2 CD 84 42         [ 4] 1001 	call move
      0084F5 CE 00 1F         [ 2] 1002 	ldw x,txtend
      0084F8 72 FB 05         [ 2] 1003 	addw x,(LEN,sp)
      0084FB CF 00 1F         [ 2] 1004 	ldw txtend,x
      00047E                       1005 9$:	_drop VSIZE 
      0084FE 5B 06            [ 2]    1     addw sp,#VSIZE 
      008500 81               [ 4] 1006 	ret 
                                   1007 
                                   1008 ;--------------------------------------------
                                   1009 ; insert line in pad into text area 
                                   1010 ; first search for already existing 
                                   1011 ; replace existing 
                                   1012 ; if new line empty delete existing one. 
                                   1013 ; input:
                                   1014 ;   ptr16		pointer to tokenized line  
                                   1015 ; output:
                                   1016 ;   none
                                   1017 ;---------------------------------------------
                           000001  1018 	DEST=1  ; text area insertion address 
                           000003  1019 	SRC=3   ; str to insert address 
                           000005  1020 	LINENO=5 ; line number 
                           000007  1021 	LLEN=7 ; line length 
                           000008  1022 	VSIZE=8  
      008501                       1023 insert_line:
      000481                       1024 	_vars VSIZE 
      008501 52 08            [ 2]    1     sub sp,#VSIZE 
      008503 CE 00 1F         [ 2] 1025 	ldw x,txtend  
      008506 C3 00 1D         [ 2] 1026 	cpw x,txtbgn 
      008509 26 15            [ 1] 1027 	jrne 0$
                                   1028 ;first text line 
      00850B AE 00 02         [ 2] 1029 	ldw x,#2 
      00850E 72 D6 00 18      [ 4] 1030 	ld a,([ptr16],x)
      008512 5F               [ 1] 1031 	clrw x 
      008513 97               [ 1] 1032 	ld xl,a
      008514 1F 07            [ 2] 1033 	ldw (LLEN,sp),x 
      008516 CE 00 1D         [ 2] 1034 	ldw x,txtbgn
      008519 1F 01            [ 2] 1035 	ldw (DEST,sp),x 
      00851B CE 00 1F         [ 2] 1036 	ldw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00851E 20 37            [ 2] 1037 	jra 4$
      008520 72 CE 00 18      [ 5] 1038 0$:	ldw x,[ptr16]
                                   1039 ; line number
      008524 1F 05            [ 2] 1040 	ldw (LINENO,sp),x 
      008526 AE 00 02         [ 2] 1041 	ldw x,#2 
      008529 72 D6 00 18      [ 4] 1042 	ld a,([ptr16],x)
      00852D 97               [ 1] 1043 	ld xl,a
                                   1044 ; line length
      00852E 1F 07            [ 2] 1045 	ldw (LLEN,sp),x
                                   1046 ; check if that line number already exit 	
      008530 1E 05            [ 2] 1047 	ldw x,(LINENO,sp)
      008532 CD 84 84         [ 4] 1048 	call search_lineno 
      008535 5D               [ 2] 1049 	tnzw x 
      008536 26 04            [ 1] 1050 	jrne 2$
                                   1051 ; line doesn't exit
                                   1052 ; it will be inserted at this point.  	
      008538 17 01            [ 2] 1053 	ldw (DEST,sp),y 
      00853A 20 05            [ 2] 1054 	jra 3$
                                   1055 ; line exit delete it.
                                   1056 ; it will be replaced by new one 	
      00853C 1F 01            [ 2] 1057 2$: ldw (DEST,sp),x 
      00853E CD 84 A8         [ 4] 1058 	call del_line
      008541                       1059 3$: 
                                   1060 ; insert new line or leave if LLEN==3
                                   1061 ; LLEN==3 means empty line 
      008541 A6 03            [ 1] 1062 	ld a,#3
      008543 11 08            [ 1] 1063 	cp a,(LLEN+1,sp)
      008545 27 24            [ 1] 1064 	jreq insert_ln_exit ; empty line exit.
                                   1065 ; if insertion point at txtend 
                                   1066 ; move no need to create a gap 
      008547 1E 01            [ 2] 1067 	ldw x,(DEST,sp)
      008549 C3 00 1F         [ 2] 1068 	cpw x,txtend 
      00854C 27 09            [ 1] 1069 	jreq 4$ 
                                   1070 ; must create a gap
                                   1071 ; at insertion point  
      00854E 1E 01            [ 2] 1072 	ldw x,(DEST,sp)
      008550 16 07            [ 2] 1073 	ldw y,(LLEN,sp)
      008552 CD 84 D5         [ 4] 1074 	call create_gap
      008555 20 06            [ 2] 1075 	jra 5$
      008557                       1076 4$: 
      008557 72 FB 07         [ 2] 1077 	addw x,(LLEN,sp)
      00855A CF 00 1F         [ 2] 1078 	ldw txtend,x 	 
                                   1079 ; move new line in gap 
      00855D 1E 07            [ 2] 1080 5$:	ldw x,(LLEN,sp)
      00855F CF 00 0D         [ 2] 1081 	ldw acc16,x 
      008562 90 AE 16 E0      [ 2] 1082 	ldw y,#pad ;SRC 
      008566 1E 01            [ 2] 1083 	ldw x,(DEST,sp) ; dest address 
      008568 CD 84 42         [ 4] 1084 	call move 
      00856B                       1085 insert_ln_exit:	
      0004EB                       1086 	_drop VSIZE
      00856B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00856D 81               [ 4] 1087 	ret
                                   1088 
                                   1089 ;-----------------------------------
                                   1090 ; create token list fromm text line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1091 ; save this list in pad buffer 
                                   1092 ;  compiled line format: 
                                   1093 ;    line_no  2 bytes {0...32767}
                                   1094 ;    count    1 byte  
                                   1095 ;    tokens   variable length 
                                   1096 ;   
                                   1097 ; input:
                                   1098 ;   none
                                   1099 ; modified variables:
                                   1100 ;   basicptr     token list buffer address 
                                   1101 ;   in.w  		 3|count, i.e. index in buffer
                                   1102 ;   count        length of line | 0  
                                   1103 ;-----------------------------------
                           000001  1104 	XSAVE=1
                           000002  1105 	VSIZE=2
      00856E                       1106 compile:
      0004EE                       1107 	_vars VSIZE 
      00856E 52 02            [ 2]    1     sub sp,#VSIZE 
      008570 72 1A 00 24      [ 1] 1108 	bset flags,#FCOMP 
      008574 A6 00            [ 1] 1109 	ld a,#0
      008576 AE 00 00         [ 2] 1110 	ldw x,#0
      008579 CF 16 E0         [ 2] 1111 	ldw pad,x ; destination buffer 
      00857C C7 16 E2         [ 1] 1112 	ld pad+2,a ; count 
      00857F AE 16 E3         [ 2] 1113 	ldw x,#pad+3
      008582 72 5F 00 02      [ 1] 1114 	clr in 
      008586 CD 8C 6E         [ 4] 1115 	call get_token
      008589 A1 84            [ 1] 1116 	cp a,#TK_INTGR
      00858B 26 11            [ 1] 1117 	jrne 2$
      00858D A3 00 01         [ 2] 1118 	cpw x,#1 
      008590 2A 05            [ 1] 1119 	jrpl 1$
      008592 A6 0A            [ 1] 1120 	ld a,#ERR_BAD_VALUE
      008594 CC 88 FD         [ 2] 1121 	jp tb_error
      008597 CF 16 E0         [ 2] 1122 1$:	ldw pad,x 
      00859A 90 AE 16 E3      [ 2] 1123 	ldw y,#pad+3 
      00859E 90 A3 17 60      [ 2] 1124 2$:	cpw y,#stack_full 
      0085A2 25 05            [ 1] 1125 	jrult 3$
      0085A4 A6 0F            [ 1] 1126 	ld a,#ERR_BUF_FULL 
      0085A6 CC 88 FD         [ 2] 1127 	jp tb_error 
      0085A9                       1128 3$:	
      0085A9 93               [ 1] 1129 	ldw x,y 
      0085AA CD 8C 6E         [ 4] 1130 	call get_token 
      0085AD A1 00            [ 1] 1131 	cp a,#TK_NONE 
      0085AF 26 ED            [ 1] 1132 	jrne 2$ 
                                   1133 ; compilation completed  
      0085B1 72 A2 16 E0      [ 2] 1134 	subw y,#pad
      0085B5 90 9F            [ 1] 1135     ld a,yl
      0085B7 AE 16 E0         [ 2] 1136 	ldw x,#pad 
      0085BA CF 00 18         [ 2] 1137 	ldw ptr16,x 
      0085BD E7 02            [ 1] 1138 	ld (2,x),a 
      0085BF FE               [ 2] 1139 	ldw x,(x)
      0085C0 27 09            [ 1] 1140 	jreq 10$
      0085C2 CD 85 01         [ 4] 1141 	call insert_line
      0085C5 72 5F 00 04      [ 1] 1142 	clr  count 
      0085C9 20 0F            [ 2] 1143 	jra  11$ 
      0085CB                       1144 10$: ; line# is zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085CB CE 00 18         [ 2] 1145 	ldw x,ptr16  
      0085CE CF 00 05         [ 2] 1146 	ldw basicptr,x 
      0085D1 E6 02            [ 1] 1147 	ld a,(2,x)
      0085D3 C7 00 04         [ 1] 1148 	ld count,a 
      0085D6 35 03 00 02      [ 1] 1149 	mov in,#3 
      0085DA                       1150 11$:
      00055A                       1151 	_drop VSIZE 
      0085DA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085DC 72 1B 00 24      [ 1] 1152 	bres flags,#FCOMP 
      0085E0 81               [ 4] 1153 	ret 
                                   1154 
                                   1155 ;------------------------------------
                                   1156 ;  set all variables to zero 
                                   1157 ; input:
                                   1158 ;   none 
                                   1159 ; output:
                                   1160 ;	none
                                   1161 ;------------------------------------
      0085E1                       1162 clear_vars:
      0085E1 AE 00 30         [ 2] 1163 	ldw x,#vars 
      0085E4 90 AE 00 34      [ 2] 1164 	ldw y,#2*26 
      0085E8 7F               [ 1] 1165 1$:	clr (x)
      0085E9 5C               [ 2] 1166 	incw x 
      0085EA 90 5A            [ 2] 1167 	decw y 
      0085EC 26 FA            [ 1] 1168 	jrne 1$
      0085EE 81               [ 4] 1169 	ret 
                                   1170 
                                   1171 ;-------------------------------------
                                   1172 ; check if A is a letter 
                                   1173 ; input:
                                   1174 ;   A 			character to test 
                                   1175 ; output:
                                   1176 ;   C flag      1 true, 0 false 
                                   1177 ;-------------------------------------
      0085EF                       1178 is_alpha:
      0085EF A1 41            [ 1] 1179 	cp a,#'A 
      0085F1 8C               [ 1] 1180 	ccf 
      0085F2 24 0B            [ 1] 1181 	jrnc 9$ 
      0085F4 A1 5B            [ 1] 1182 	cp a,#'Z+1 
      0085F6 25 07            [ 1] 1183 	jrc 9$ 
      0085F8 A1 61            [ 1] 1184 	cp a,#'a 
      0085FA 8C               [ 1] 1185 	ccf 
      0085FB 24 02            [ 1] 1186 	jrnc 9$
      0085FD A1 7B            [ 1] 1187 	cp a,#'z+1
      0085FF 81               [ 4] 1188 9$: ret 	
                                   1189 
                                   1190 ;------------------------------------
                                   1191 ; check if character in {'0'..'9'}
                                   1192 ; input:
                                   1193 ;    A  character to test
                                   1194 ; output:
                                   1195 ;    Carry  0 not digit | 1 digit
                                   1196 ;------------------------------------
      008600                       1197 is_digit:
      008600 A1 30            [ 1] 1198 	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008602 25 03            [ 1] 1199 	jrc 1$
      008604 A1 3A            [ 1] 1200     cp a,#'9+1
      008606 8C               [ 1] 1201 	ccf 
      008607 8C               [ 1] 1202 1$:	ccf 
      008608 81               [ 4] 1203     ret
                                   1204 
                                   1205 ;-------------------------------------
                                   1206 ; return true if character in  A 
                                   1207 ; is letter or digit.
                                   1208 ; input:
                                   1209 ;   A     ASCII character 
                                   1210 ; output:
                                   1211 ;   A     no change 
                                   1212 ;   Carry    0 false| 1 true 
                                   1213 ;--------------------------------------
      008609                       1214 is_alnum:
      008609 CD 86 00         [ 4] 1215 	call is_digit
      00860C 25 03            [ 1] 1216 	jrc 1$ 
      00860E CD 85 EF         [ 4] 1217 	call is_alpha
      008611 81               [ 4] 1218 1$:	ret 
                                   1219 
                                   1220 
                                   1221 ;-------------------------------------
                                   1222 ;  program initialization entry point 
                                   1223 ;-------------------------------------
                           000001  1224 	MAJOR=1
                           000000  1225 	MINOR=0
      008612 0A 0A 54 69 6E 79 20  1226 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008658                       1227 cold_start:
                                   1228 ;set stack 
      008658 AE 17 FF         [ 2] 1229 	ldw x,#STACK_EMPTY
      00865B 94               [ 1] 1230 	ldw sp,x   
                                   1231 ; clear all ram 
      00865C 7F               [ 1] 1232 0$: clr (x)
      00865D 5A               [ 2] 1233 	decw x 
      00865E 26 FC            [ 1] 1234 	jrne 0$
                                   1235 ; activate pull up on all inputs 
      008660 A6 FF            [ 1] 1236 	ld a,#255 
      008662 C7 50 03         [ 1] 1237 	ld PA_CR1,a 
      008665 C7 50 08         [ 1] 1238 	ld PB_CR1,a 
      008668 C7 50 0D         [ 1] 1239 	ld PC_CR1,a 
      00866B C7 50 12         [ 1] 1240 	ld PD_CR1,a 
      00866E C7 50 17         [ 1] 1241 	ld PE_CR1,a 
      008671 C7 50 1C         [ 1] 1242 	ld PF_CR1,a 
      008674 C7 50 21         [ 1] 1243 	ld PG_CR1,a 
      008677 C7 50 2B         [ 1] 1244 	ld PI_CR1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1245 ; set LD2 pin as output and turn it on
      00867A 72 1A 50 0D      [ 1] 1246     bset PC_CR1,#LED2_BIT
      00867E 72 1A 50 0E      [ 1] 1247     bset PC_CR2,#LED2_BIT
      008682 72 1A 50 0C      [ 1] 1248     bset PC_DDR,#LED2_BIT
      008686 72 1A 50 0A      [ 1] 1249 	bset PC_ODR,#LED2_BIT 
                                   1250 ; disable schmitt triggers on Arduino CN4 analog inputs
      00868A 55 00 3F 54 07   [ 1] 1251 	mov ADC_TDRL,0x3f
                                   1252 ; disable peripherals clocks
                                   1253 ;	clr CLK_PCKENR1 
                                   1254 ;	clr CLK_PCKENR2
      00868F 72 5F 50 F2      [ 1] 1255 	clr AWU_TBR 
      008693 72 14 50 CA      [ 1] 1256 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1257 ; select internal clock no divisor: 16 Mhz 	
      008697 A6 E1            [ 1] 1258 	ld a,#CLK_SWR_HSI 
      008699 5F               [ 1] 1259 	clrw x  
      00869A CD 81 35         [ 4] 1260     call clock_init 
      00869D CD 81 58         [ 4] 1261 	call timer4_init
      0086A0 CD 81 4B         [ 4] 1262 	call timer2_init
                                   1263 ; UART1 at 115200 BAUD
      0086A3 CD 82 FD         [ 4] 1264 	call uart1_init
                                   1265 ; activate PE_4 (user button interrupt)
      0086A6 72 18 50 18      [ 1] 1266     bset PE_CR2,#USR_BTN_BIT 
                                   1267 ; display system information
      0086AA AE 86 12         [ 2] 1268 	ldw x,#software 
      0086AD CD A8 C0         [ 4] 1269 	call puts 
      0086B0 A6 01            [ 1] 1270 	ld a,#MAJOR 
      0086B2 C7 00 0E         [ 1] 1271 	ld acc8,a 
      0086B5 5F               [ 1] 1272 	clrw x 
      0086B6 CF 00 0C         [ 2] 1273 	ldw acc24,x
      0086B9 72 5F 00 25      [ 1] 1274 	clr tab_width  
      0086BD 35 0A 00 0B      [ 1] 1275 	mov base, #10 
      0086C1 CD 8A 5A         [ 4] 1276 	call prti24 
      0086C4 A6 2E            [ 1] 1277 	ld a,#'.
      0086C6 CD 83 40         [ 4] 1278 	call putc 
      0086C9 A6 00            [ 1] 1279 	ld a,#MINOR 
      0086CB C7 00 0E         [ 1] 1280 	ld acc8,a 
      0086CE 5F               [ 1] 1281 	clrw x 
      0086CF CF 00 0C         [ 2] 1282 	ldw acc24,x 
      0086D2 CD 8A 5A         [ 4] 1283 	call prti24
      0086D5 A6 0D            [ 1] 1284 	ld a,#CR 
      0086D7 CD 83 40         [ 4] 1285 	call putc
      0086DA CD 9A 7B         [ 4] 1286 	call seek_fdrive 
      0086DD 9A               [ 1] 1287 	rim 
      0086DE 72 5C 00 16      [ 1] 1288 	inc seedy+1 
      0086E2 72 5C 00 14      [ 1] 1289 	inc seedx+1 
      0086E6 CD 87 67         [ 4] 1290 	call clear_basic
      0086E9 CD 92 88         [ 4] 1291 	call ubound 
                                   1292 ;	jra 2$	
      0086EC CD 98 C9         [ 4] 1293 	call beep_1khz  
      0086EF 72 1B 50 0A      [ 1] 1294 2$:	bres PC_ODR,#LED2_BIT	
      0086F3 CD 86 FC         [ 4] 1295 	call warm_init
      0086F6 CD 87 29         [ 4] 1296 	call load_autorun
      0086F9 CC 89 85         [ 2] 1297     jp cmd_line  
                                   1298 
      0086FC                       1299 warm_init:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086FC 72 5F 00 24      [ 1] 1300 	clr flags 
      008700 72 5F 00 21      [ 1] 1301 	clr loop_depth 
      008704 35 04 00 25      [ 1] 1302 	mov tab_width,#TAB_WIDTH 
      008708 35 0A 00 0B      [ 1] 1303 	mov base,#10 
      00870C AE 00 00         [ 2] 1304 	ldw x,#0 
      00870F CF 00 05         [ 2] 1305 	ldw basicptr,x 
      008712 CF 00 01         [ 2] 1306 	ldw in.w,x 
      008715 72 5F 00 04      [ 1] 1307 	clr count
      008719 81               [ 4] 1308 	ret 
                                   1309 
                                   1310 ;--------------------------
                                   1311 ; called by tb_error when
                                   1312 ; flag FAUTORUN is set.
                                   1313 ; There is a bug in autorun 
                                   1314 ; program so cancel it.
                                   1315 ;---------------------------
      00871A                       1316 cancel_autorun:
      00871A AE 40 00         [ 2] 1317 	ldw x,#AUTORUN_NAME 
      00871D CF 00 18         [ 2] 1318 	ldw farptr+1,x 
      008720 4F               [ 1] 1319 	clr a
      008721 5F               [ 1] 1320 	clrw x  
      008722 C7 00 17         [ 1] 1321 	ld farptr,a 
      008725 CD 82 65         [ 4] 1322 	call write_byte 
      008728 81               [ 4] 1323 	ret 
                                   1324 
                                   1325 
                                   1326 ;--------------------------
                                   1327 ; if autorun file defined 
                                   1328 ; in eeprom address AUTORUN_NAME 
                                   1329 ; load and run it.
                                   1330 ;-------------------------
      008729                       1331 load_autorun:
      008729 90 AE 40 00      [ 2] 1332 	ldw y,#AUTORUN_NAME
      00872D 90 F6            [ 1] 1333 	ld a,(y)
      00872F 27 20            [ 1] 1334 	jreq 9$
      008731 CD 9A E1         [ 4] 1335 	call search_file
      008734 25 05            [ 1] 1336 	jrc 2$ 
                                   1337 ; if file doesn't exit
      008736 CD 87 1A         [ 4] 1338 	call cancel_autorun
      008739 20 16            [ 2] 1339 	jra 9$ 
      00873B CD 9B F7         [ 4] 1340 2$:	call load_file
      00873E AE 40 00         [ 2] 1341 	ldw x,#AUTORUN_NAME 
      008741 CD A8 C0         [ 4] 1342 	call puts
      008744 AE 87 52         [ 2] 1343 	ldw x,#autorun_msg 
      008747 CD A8 C0         [ 4] 1344 	call puts 
      00874A 72 1C 00 24      [ 1] 1345 	bset flags,#FAUTORUN 
      00874E CC 98 9B         [ 2] 1346 	jp run_it    
      008751 81               [ 4] 1347 9$: ret 	
                                   1348 
      008752 20 6C 6F 61 64 65 64  1349 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1350 ;---------------------------
                                   1351 ; reset BASIC text variables 
                                   1352 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1353 ;---------------------------
      008767                       1354 clear_basic:
      008767 72 5F 00 04      [ 1] 1355 	clr count
      00876B 72 5F 00 02      [ 1] 1356 	clr in  
      00876F AE 00 64         [ 2] 1357 	ldw x,#free_ram 
      008772 CF 00 1D         [ 2] 1358 	ldw txtbgn,x 
      008775 CF 00 1F         [ 2] 1359 	ldw txtend,x 
      008778 CD 85 E1         [ 4] 1360 	call clear_vars 
      00877B 81               [ 4] 1361 	ret 
                                   1362 
                                   1363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1364 ;;   Tiny BASIC error messages     ;;
                                   1365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00877C                       1366 err_msg:
      00877C 00 00 87 9C 87 A9 87  1367 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B7 87 D0 87 DF
      008788 87 F5 88 0B 88 25 88  1368 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             36 88 47
      008792 88 53 88 86 88 96 88  1369 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             AA 88 BD
                                   1370 
      00879C 4D 65 6D 6F 72 79 20  1371 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0087A9 73 79 6E 74 61 78 20  1372 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0087B7 6D 61 74 68 20 6F 70  1373 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0087D0 64 69 76 69 73 69 6F  1374 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0087DF 69 6E 76 61 6C 69 64  1375 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087F5 72 75 6E 20 74 69 6D  1376 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00880B 63 6F 6D 6D 61 6E 64  1377 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      008825 64 75 70 6C 69 63 61  1378 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      008836 46 69 6C 65 20 6E 6F  1379 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008847 62 61 64 20 76 61 6C  1380 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      008853 46 69 6C 65 20 69 6E  1381 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  72-Bits]



             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008869 79 2C 20 63 61 6E 27  1382 err_no_data: .asciz "No data found.\n"
             74 20 62 65 20 72 75
             6E 20
      008879 66 72 6F 6D 20 74 68  1383 err_no_prog: .asciz "No program in RAM!\n"
             65 72 65 2E 0A 00 4E
             6F 20 64 61 74 61
      00888D 20 66 6F 75 6E 64 2E  1384 err_no_fspace: .asciz "File system full.\n" 
             0A 00 4E 6F 20 70 72
             6F 67 72 61 6D
      0088A0 20 69 6E 20 52 41 4D  1385 err_buf_full: .asciz "Buffer full\n"
             21 0A 00 46 69 6C
                                   1386 
      0088AD 65 20 73 79 73 74 65  1387 rt_msg: .asciz "run time error, "
             6D 20 66 75 6C 6C 2E
             0A 00 42
      0088BE 75 66 66 65 72 20 66  1388 comp_msg: .asciz "compile error, "
             75 6C 6C 0A 00 72 75
             6E 20
      0088CE 74 69 6D 65 20 65 72  1389 tk_id: .asciz "last token id: "
             72 6F 72 2C 20 00 63
             6F 6D
                                   1390 
      00087B                       1391 syntax_error:
      0088DE 70 69            [ 1] 1392 	ld a,#ERR_SYNTAX 
                                   1393 
      00087D                       1394 tb_error:
      0088E0 6C 65 20 65 72   [ 2] 1395 	btjt flags,#FCOMP,1$
      0088E5 72               [ 1] 1396 	push a 
      0088E6 6F 72 2C         [ 2] 1397 	ldw x, #rt_msg 
      0088E9 20 00 6C         [ 4] 1398 	call puts 
      0088EC 61               [ 1] 1399 	pop a 
      0088ED 73 74 20         [ 2] 1400 	ldw x, #err_msg 
      0088F0 74 6F 6B 65      [ 1] 1401 	clr acc16 
      0088F4 6E               [ 1] 1402 	sll a
      0088F5 20 69 64 3A      [ 1] 1403 	rlc acc16  
      0088F9 20 00 0D         [ 1] 1404 	ld acc8, a 
      0088FB 72 BB 00 0C      [ 2] 1405 	addw x,acc16 
      0088FB A6               [ 2] 1406 	ldw x,(x)
      0088FC 02 00 00         [ 4] 1407 	call puts
      0088FD CE 00 04         [ 2] 1408 	ldw x,basicptr
      0088FD 72 0A 00         [ 1] 1409 	ld a,in 
      008900 24 47 88         [ 4] 1410 	call prt_basic_line
      008903 AE 88 CA         [ 2] 1411 	ldw x,#tk_id 
      008906 CD A8 C0         [ 4] 1412 	call puts 
      008909 84 AE 87         [ 1] 1413 	ld a,in.saved 
      00890C 7C               [ 1] 1414 	clrw x 
      00890D 72               [ 1] 1415 	ld xl,a 
      00890E 5F 00 0D 48      [ 2] 1416 	addw x,basicptr 
      008912 72               [ 1] 1417 	ld a,(x)
      008913 59               [ 1] 1418 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008914 00               [ 1] 1419 	ld xl,a 
      008915 0D C7 00         [ 4] 1420 	call print_int
      008918 0E 72 BB 00 0D   [ 2] 1421 	btjf flags,#FAUTORUN ,6$
      00891D FE CD A8         [ 4] 1422 	call cancel_autorun  
      008920 C0 CE            [ 2] 1423 	jra 6$
      0008C9                       1424 1$:	
      008922 00               [ 1] 1425 	push a 
      008923 05 C6 00         [ 2] 1426 	ldw x,#comp_msg
      008926 02 CD 95         [ 4] 1427 	call puts 
      008929 5C               [ 1] 1428 	pop a 
      00892A AE 88 EB         [ 2] 1429 	ldw x, #err_msg 
      00892D CD A8 C0 C6      [ 1] 1430 	clr acc16 
      008931 00               [ 1] 1431 	sll a
      008932 03 5F 97 72      [ 1] 1432 	rlc acc16  
      008936 BB 00 05         [ 1] 1433 	ld acc8, a 
      008939 F6 5F 97 CD      [ 2] 1434 	addw x,acc16 
      00893D 8A               [ 2] 1435 	ldw x,(x)
      00893E 4A 72 0D         [ 4] 1436 	call puts
      008941 00 24 3A         [ 2] 1437 	ldw x,#tib
      008944 CD 87 1A         [ 4] 1438 	call puts 
      008947 20 35            [ 1] 1439 	ld a,#CR 
      008949 CD 02 C0         [ 4] 1440 	call putc
      008949 88 AE 88         [ 2] 1441 	ldw x,in.w
      00894C DB CD A8         [ 4] 1442 	call spaces
      00894F C0 84            [ 1] 1443 	ld a,#'^
      008951 AE 87 7C         [ 4] 1444 	call putc 
      008954 72 5F 00         [ 2] 1445 6$: ldw x,#STACK_EMPTY 
      008957 0D               [ 1] 1446     ldw sp,x
      000902                       1447 warm_start:
      008958 48 72 59         [ 4] 1448 	call warm_init
                                   1449 ;----------------------------
                                   1450 ;   BASIC interpreter
                                   1451 ;----------------------------
      000905                       1452 cmd_line: ; user interface 
      00895B 00 0D            [ 1] 1453 	ld a,#CR 
      00895D C7 00 0E         [ 4] 1454 	call putc 
      008960 72 BB            [ 1] 1455 	ld a,#'> 
      008962 00 0D FE         [ 4] 1456 	call putc
      008965 CD A8 C0         [ 4] 1457 	call readln
      008968 AE 16 90 CD      [ 1] 1458 	tnz count 
      00896C A8 C0            [ 1] 1459 	jreq cmd_line
      00896E A6 0D CD         [ 4] 1460 	call compile
                                   1461 ; if text begin with a line number
                                   1462 ; the compiler set count to zero    
                                   1463 ; so code is not interpreted
      008971 83 40 CE 00      [ 1] 1464 	tnz count 
      008975 01 CD            [ 1] 1465 	jreq cmd_line
                                   1466 
                                   1467 ; if direct command 
                                   1468 ; it's ready to interpret 
                                   1469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1470 ;; This is the interpreter loop
                                   1471 ;; for each BASIC code line. 
                                   1472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000921                       1473 interpreter: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008977 A9 2D A6         [ 1] 1474 	ld a,in 
      00897A 5E CD 83         [ 1] 1475 	cp a,count 
      00897D 40 AE            [ 1] 1476 	jrmi interp_loop
      000929                       1477 next_line:
      00897F 17 FF 94 23 D7   [ 2] 1478 	btjf flags, #FRUN, cmd_line
      008982 CE 00 04         [ 2] 1479 	ldw x,basicptr
      008982 CD 86 FC 00      [ 2] 1480 	addw x,in.w 
      008985 C3 00 1E         [ 2] 1481 	cpw x,txtend 
      008985 A6 0D            [ 1] 1482 	jrpl warm_start
      008987 CD 83 40         [ 2] 1483 	ldw basicptr,x ; start of next line  
      00898A A6 3E            [ 1] 1484 	ld a,(2,x)
      00898C CD 83 40         [ 1] 1485 	ld count,a 
      00898F CD A9 C5 72      [ 1] 1486 	mov in,#3 ; skip first 3 bytes of line 
      000946                       1487 interp_loop: 
      008993 5D 00 04         [ 4] 1488 	call next_token
      008996 27 ED            [ 1] 1489 	cp a,#TK_NONE 
      008998 CD 85            [ 1] 1490 	jreq next_line 
      00899A 6E 72            [ 1] 1491 	cp a,#TK_CMD
      00899C 5D 00            [ 1] 1492 	jrne 1$
      00899E 04               [ 4] 1493 	call (x) 
      00899F 27 E4            [ 2] 1494 	jra interp_loop 
      0089A1                       1495 1$:	 
      0089A1 C6 00            [ 1] 1496 	cp a,#TK_VAR
      0089A3 02 C1            [ 1] 1497 	jrne 2$
      0089A5 00 04 2B         [ 4] 1498 	call let_var  
      0089A8 1D E9            [ 2] 1499 	jra interp_loop 
      0089A9                       1500 2$:	
      0089A9 72 01            [ 1] 1501 	cp a,#TK_ARRAY 
      0089AB 00 24            [ 1] 1502 	jrne 3$
      0089AD D7 CE 00         [ 4] 1503 	call let_array 
      0089B0 05 72            [ 2] 1504 	jra interp_loop
      000966                       1505 3$:	
      0089B2 BB 00            [ 1] 1506 	cp a,#TK_COLON 
      0089B4 01 C3            [ 1] 1507 	jreq interp_loop 
      0089B6 00 1F 2A         [ 2] 1508 	jp syntax_error 
                                   1509 
                                   1510 		
                                   1511 ;--------------------------
                                   1512 ; extract next token from
                                   1513 ; token list 
                                   1514 ; basicptr -> base address 
                                   1515 ; in  -> offset in list array 
                                   1516 ; output:
                                   1517 ;   A 		token attribute
                                   1518 ;   X 		token value if there is one
                                   1519 ;----------------------------------------
      00096D                       1520 next_token:
      0089B9 C8               [ 1] 1521 	clrw x 
      0089BA CF 00 05         [ 1] 1522 	ld a,in 
      0089BD E6 02 C7         [ 1] 1523 	sub a,count ; don't replace sub by cp!  
      0089C0 00 04            [ 1] 1524 	jrmi 0$
      0089C2 35               [ 4] 1525 	ret  ; end of BASIC line 
      000977                       1526 0$: 
      0089C3 03 00 02 00 02   [ 1] 1527 	mov in.saved,in 
      0089C6 90 CE 00 04      [ 2] 1528 	ldw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089C6 CD 89 ED         [ 4] 1529 	ld a,([in.w],y)
      0089C9 A1 00 27 DC      [ 1] 1530 	inc in  
      0089CD A1               [ 1] 1531 	tnz a 
      0089CE 80 26            [ 1] 1532 	jrmi 6$
      0089D0 03 FD            [ 1] 1533 	cp a,#TK_ARRAY
      0089D2 20 F2            [ 1] 1534 	jrpl 9$  ; no attribute for these
      0089D4 A1 01            [ 1] 1535 	cp a,#TK_COLON
      0089D4 A1 85            [ 1] 1536 	jreq 9$  
      000992                       1537 1$: ; 
      0089D6 26 05            [ 1] 1538 	cp a,#TK_CHAR
      0089D8 CD 92            [ 1] 1539 	jrne 2$
      0089DA BB 20 E9         [ 4] 1540 	ld a,([in.w],y)
      0089DD 72 5C 00 01      [ 1] 1541 	inc in 
      0089DD A1               [ 1] 1542 	exg a,xl  
      0089DE 06 26            [ 1] 1543 	ld a,#TK_CHAR
      0089E0 05               [ 4] 1544 	ret
      0089E1 CD 92            [ 1] 1545 2$:	cp a,#TK_QSTR 
      0089E3 B8 20            [ 1] 1546 	jrne 9$
      0089E5 E0               [ 1] 1547 	ldw x,y 
      0089E6 72 BB 00 00      [ 2] 1548 	addw x,in.w ; pointer to string 
                                   1549 ; move pointer after string 
      0089E6 A1 01 27         [ 4] 1550 3$:	tnz ([in.w],y)
      0089E9 DC CC            [ 1] 1551 	jreq 8$
      0089EB 88 FB 00 01      [ 1] 1552 	inc in 
      0089ED 20 F5            [ 2] 1553 	jra 3$
      0009B5                       1554 6$: 
      0089ED 5F C6 00         [ 5] 1555 	ldw y,([in.w],y)
      0089F0 02               [ 1] 1556 	exgw x,y
      0089F1 C0 00            [ 1] 1557 	cp a,#TK_INTGR
      0089F3 04 2B            [ 1] 1558 	jrpl 7$
      0089F5 01 81 B9         [ 2] 1559 	addw x,#code_addr
      0089F7 FE               [ 2] 1560 	ldw x,(x) 
      0089F7 55 00 02 00      [ 1] 1561 7$:	inc in
      0089FB 03 90 CE 00      [ 1] 1562 8$:	inc in 
      0009C9                       1563 9$: 
      0089FF 05               [ 4] 1564 	ret	
                                   1565 
                                   1566 ;-----------------------------------
                                   1567 ; print a 16 bit integer 
                                   1568 ; using variable 'base' as conversion
                                   1569 ; format.
                                   1570 ; input:
                                   1571 ;   X       integer to print 
                                   1572 ;   'base'    conversion base 
                                   1573 ; output:
                                   1574 ;   none 
                                   1575 ;-----------------------------------
      0009CA                       1576 print_int:
      008A00 91 D6 01 72      [ 1] 1577 	clr acc24 
      008A04 5C 00 02         [ 2] 1578 	ldw acc16,x 
      008A07 4D 2B 2B A1 06   [ 2] 1579 	btjf acc16,#7,prti24
      008A0C 2A 3B A1 01      [ 1] 1580 	cpl acc24 
                                   1581 
                                   1582 ;------------------------------------
                                   1583 ; print integer in acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1584 ; input:
                                   1585 ;	acc24 		integer to print 
                                   1586 ;	'base' 		numerical base for conversion 
                                   1587 ;   'tab_width' field width 
                                   1588 ;  output:
                                   1589 ;    A          string length
                                   1590 ;------------------------------------
      0009DA                       1591 prti24:
      008A10 27 37 E6         [ 4] 1592     call itoa  ; conversion entier en  .asciz
      008A12 CD 12 F8         [ 4] 1593 	call right_align  
      008A12 A1               [ 1] 1594 	push a 
      008A13 03 26 0B         [ 4] 1595 	call puts
      008A16 91               [ 1] 1596 	pop a 
      008A17 D6               [ 4] 1597     ret	
                                   1598 
                                   1599 ;------------------------------------
                                   1600 ; convert integer in acc24 to string
                                   1601 ; input:
                                   1602 ;   'base'	conversion base 
                                   1603 ;	acc24	integer to convert
                                   1604 ; output:
                                   1605 ;   X  		pointer to first char of string
                                   1606 ;   A       string length
                                   1607 ;------------------------------------
                           000001  1608 	SIGN=1  ; integer sign 
                           000002  1609 	LEN=2 
                           000003  1610 	PSTR=3
                           000004  1611 	VSIZE=4 ;locals size
      0009E6                       1612 itoa:
      0009E6                       1613 	_vars VSIZE
      008A18 01 72            [ 2]    1     sub sp,#VSIZE 
      008A1A 5C 00            [ 1] 1614 	clr (LEN,sp) ; string length  
      008A1C 02 41            [ 1] 1615 	clr (SIGN,sp)    ; sign
      008A1E A6 03 81         [ 1] 1616 	ld a,base 
      008A21 A1 02            [ 1] 1617 	cp a,#10
      008A23 26 24            [ 1] 1618 	jrne 1$
                                   1619 	; base 10 string display with negative sign if bit 23==1
      008A25 93 72 BB 00 01   [ 2] 1620 	btjf acc24,#7,1$
      008A2A 91 6D            [ 1] 1621 	cpl (SIGN,sp)
      008A2C 01 27 16         [ 4] 1622 	call neg_acc24
      0009FD                       1623 1$:
                                   1624 ; initialize string pointer 
      008A2F 72 5C 00         [ 2] 1625 	ldw x,#tib 
      008A32 02 20 F5         [ 2] 1626 	addw x,#TIB_SIZE
      008A35 5A               [ 2] 1627 	decw x 
      008A35 91               [ 1] 1628 	clr (x)
      000A05                       1629 itoa_loop:
      008A36 DE 01 51         [ 1] 1630     ld a,base
      008A39 A1 84            [ 2] 1631 	ldw (PSTR,sp),x 
      008A3B 2A 04 1C         [ 4] 1632     call divu24_8 ; acc24/A 
      008A3E A7 39            [ 2] 1633 	ldw x,(PSTR,sp)
      008A40 FE 72            [ 1] 1634     add a,#'0  ; remainder of division
      008A42 5C 00            [ 1] 1635     cp a,#'9+1
      008A44 02 72            [ 1] 1636     jrmi 2$
      008A46 5C 00            [ 1] 1637     add a,#7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      000A17                       1638 2$:	
      008A48 02               [ 2] 1639 	decw x
      008A49 F7               [ 1] 1640     ld (x),a
      008A49 81 02            [ 1] 1641 	inc (LEN,sp)
                                   1642 	; if acc24==0 conversion done
      008A4A C6 00 0B         [ 1] 1643 	ld a,acc24
      008A4A 72 5F 00         [ 1] 1644 	or a,acc16
      008A4D 0C CF 00         [ 1] 1645 	or a,acc8
      008A50 0D 72            [ 1] 1646     jrne itoa_loop
                                   1647 	;conversion done, next add '$' or '-' as required
      008A52 0F 00 0D         [ 1] 1648 	ld a,base 
      008A55 04 72            [ 1] 1649 	cp a,#16
      008A57 53 00            [ 1] 1650 	jreq 8$
      008A59 0C 01            [ 1] 1651 	ld a,(SIGN,sp)
      008A5A 27 0A            [ 1] 1652     jreq 10$
      008A5A CD 8A            [ 1] 1653     ld a,#'-
      008A5C 66 CD            [ 2] 1654 	jra 9$ 
      008A5E 93 78            [ 1] 1655 8$: ld a,#'$ 
      008A60 88               [ 2] 1656 9$: decw x
      008A61 CD               [ 1] 1657     ld (x),a
      008A62 A8 C0            [ 1] 1658 	inc (LEN,sp)
      000A3B                       1659 10$:
      008A64 84 81            [ 1] 1660 	ld a,(LEN,sp)
      008A66                       1661 	_drop VSIZE
      008A66 52 04            [ 2]    1     addw sp,#VSIZE 
      008A68 0F               [ 4] 1662 	ret
                                   1663 
                                   1664 ;-------------------------------------
                                   1665 ; divide uint24_t by uint8_t
                                   1666 ; used to convert uint24_t to string
                                   1667 ; input:
                                   1668 ;	acc24	dividend
                                   1669 ;   A 		divisor
                                   1670 ; output:
                                   1671 ;   acc24	quotient
                                   1672 ;   A		remainder
                                   1673 ;------------------------------------- 
                                   1674 ; offset  on sp of arguments and locals
                           000001  1675 	U8   = 1   ; divisor on stack
                           000001  1676 	VSIZE =1
      000A40                       1677 divu24_8:
      008A69 02               [ 2] 1678 	pushw x ; save x
      008A6A 0F               [ 1] 1679 	push a 
                                   1680 	; ld dividend UU:MM bytes in X
      008A6B 01 C6 00         [ 1] 1681 	ld a, acc24
      008A6E 0B               [ 1] 1682 	ld xh,a
      008A6F A1 0A 26         [ 1] 1683 	ld a,acc24+1
      008A72 0A               [ 1] 1684 	ld xl,a
      008A73 72 0F            [ 1] 1685 	ld a,(U8,SP) ; divisor
      008A75 00               [ 2] 1686 	div x,a ; UU:MM/U8
      008A76 0C               [ 1] 1687 	push a  ;save remainder
      008A77 05               [ 1] 1688 	ld a,xh
      008A78 03 01 CD         [ 1] 1689 	ld acc24,a
      008A7B 8B               [ 1] 1690 	ld a,xl
      008A7C 22 00 0C         [ 1] 1691 	ld acc24+1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A7D 84               [ 1] 1692 	pop a
      008A7D AE               [ 1] 1693 	ld xh,a
      008A7E 16 90 1C         [ 1] 1694 	ld a,acc24+2
      008A81 00               [ 1] 1695 	ld xl,a
      008A82 50 5A            [ 1] 1696 	ld a,(U8,sp) ; divisor
      008A84 7F               [ 2] 1697 	div x,a  ; R:LL/U8
      008A85 6B 01            [ 1] 1698 	ld (U8,sp),a ; save remainder
      008A85 C6               [ 1] 1699 	ld a,xl
      008A86 00 0B 1F         [ 1] 1700 	ld acc24+2,a
      008A89 03               [ 1] 1701 	pop a
      008A8A CD               [ 2] 1702 	popw x
      008A8B 8A               [ 4] 1703 	ret
                                   1704 
                                   1705 ;--------------------------------------
                                   1706 ; unsigned multiply uint24_t by uint8_t
                                   1707 ; use to convert numerical string to uint24_t
                                   1708 ; input:
                                   1709 ;	acc24	uint24_t 
                                   1710 ;   A		uint8_t
                                   1711 ; output:
                                   1712 ;   acc24   A*acc24
                                   1713 ;-------------------------------------
                                   1714 ; local variables offset  on sp
                           000003  1715 	U8   = 3   ; A pushed on stack
                           000002  1716 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1717 	OVFH = 1  ; multiplication overflow high byte
                           000003  1718 	VSIZE = 3
      000A68                       1719 mulu24_8:
      008A8C C0               [ 2] 1720 	pushw x    ; save X
                                   1721 	; local variables
      008A8D 1E               [ 1] 1722 	push a     ; U8
      008A8E 03               [ 1] 1723 	clrw x     ; initialize overflow to 0
      008A8F AB               [ 2] 1724 	pushw x    ; multiplication overflow
                                   1725 ; multiply low byte.
      008A90 30 A1 3A         [ 1] 1726 	ld a,acc24+2
      008A93 2B               [ 1] 1727 	ld xl,a
      008A94 02 AB            [ 1] 1728 	ld a,(U8,sp)
      008A96 07               [ 4] 1729 	mul x,a
      008A97 9F               [ 1] 1730 	ld a,xl
      008A97 5A F7 0C         [ 1] 1731 	ld acc24+2,a
      008A9A 02               [ 1] 1732 	ld a, xh
      008A9B C6 00            [ 1] 1733 	ld (OVFL,sp),a
                                   1734 ; multipy middle byte
      008A9D 0C CA 00         [ 1] 1735 	ld a,acc24+1
      008AA0 0D               [ 1] 1736 	ld xl,a
      008AA1 CA 00            [ 1] 1737 	ld a, (U8,sp)
      008AA3 0E               [ 4] 1738 	mul x,a
                                   1739 ; add overflow to this partial product
      008AA4 26 DF C6         [ 2] 1740 	addw x,(OVFH,sp)
      008AA7 00               [ 1] 1741 	ld a,xl
      008AA8 0B A1 10         [ 1] 1742 	ld acc24+1,a
      008AAB 27               [ 1] 1743 	clr a
      008AAC 08 7B            [ 1] 1744 	adc a,#0
      008AAE 01 27            [ 1] 1745 	ld (OVFH,sp),a
      008AB0 0A               [ 1] 1746 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AB1 A6 2D            [ 1] 1747 	ld (OVFL,sp),a
                                   1748 ; multiply most signficant byte	
      008AB3 20 02 A6         [ 1] 1749 	ld a, acc24
      008AB6 24               [ 1] 1750 	ld xl, a
      008AB7 5A F7            [ 1] 1751 	ld a, (U8,sp)
      008AB9 0C               [ 4] 1752 	mul x,a
      008ABA 02 FB 01         [ 2] 1753 	addw x, (OVFH,sp)
      008ABB 9F               [ 1] 1754 	ld a, xl
      008ABB 7B 02 5B         [ 1] 1755 	ld acc24,a
      008ABE 04 81            [ 2] 1756     addw sp,#VSIZE
      008AC0 85               [ 2] 1757 	popw x
      008AC0 89               [ 4] 1758 	ret
                                   1759 
                                   1760 ;------------------------------------
                                   1761 ;  two's complement acc24
                                   1762 ;  input:
                                   1763 ;		acc24 variable
                                   1764 ;  output:
                                   1765 ;		acc24 variable
                                   1766 ;-------------------------------------
      000AA2                       1767 neg_acc24:
      008AC1 88 C6 00 0C      [ 1] 1768 	cpl acc24+2
      008AC5 95 C6 00 0D      [ 1] 1769 	cpl acc24+1
      008AC9 97 7B 01 62      [ 1] 1770 	cpl acc24
      008ACD 88 9E            [ 1] 1771 	ld a,#1
      008ACF C7 00 0C         [ 1] 1772 	add a,acc24+2
      008AD2 9F C7 00         [ 1] 1773 	ld acc24+2,a
      008AD5 0D               [ 1] 1774 	clr a
      008AD6 84 95 C6         [ 1] 1775 	adc a,acc24+1
      008AD9 00 0E 97         [ 1] 1776 	ld acc24+1,a 
      008ADC 7B               [ 1] 1777 	clr a 
      008ADD 01 62 6B         [ 1] 1778 	adc a,acc24 
      008AE0 01 9F C7         [ 1] 1779 	ld acc24,a 
      008AE3 00               [ 4] 1780 	ret
                                   1781 
                                   1782 
                                   1783 
                                   1784 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1785 ;; compiler routines        ;;
                                   1786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1787 ;------------------------------------
                                   1788 ; parse quoted string 
                                   1789 ; input:
                                   1790 ;   Y 	pointer to tib 
                                   1791 ;   X   pointer to output buffer 
                                   1792 ; output:
                                   1793 ;	buffer   parsed string
                                   1794 ;------------------------------------
                           000001  1795 	PREV = 1
                           000002  1796 	CURR =2
                           000002  1797 	VSIZE=2
      000AC5                       1798 parse_quote: 
      000AC5                       1799 	_vars VSIZE 
      008AE4 0E 84            [ 2]    1     sub sp,#VSIZE 
      008AE6 85               [ 1] 1800 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AE7 81 01            [ 1] 1801 1$:	ld (PREV,sp),a 
      008AE8                       1802 2$:	
      008AE8 89 88 5F         [ 4] 1803 	ld a,([in.w],y)
      008AEB 89 C6            [ 1] 1804 	jreq 6$
      008AED 00 0E 97 7B      [ 1] 1805 	inc in 
      008AF1 03 42            [ 1] 1806 	ld (CURR,sp),a 
      008AF3 9F C7            [ 1] 1807 	ld a,#'\
      008AF5 00 0E            [ 1] 1808 	cp a, (PREV,sp)
      008AF7 9E 6B            [ 1] 1809 	jrne 3$
      008AF9 02 C6            [ 1] 1810 	clr (PREV,sp)
      008AFB 00 0D            [ 1] 1811 	ld a,(CURR,sp)
      008AFD 97 7B            [ 4] 1812 	callr convert_escape
      008AFF 03               [ 1] 1813 	ld (x),a 
      008B00 42               [ 2] 1814 	incw x 
      008B01 72 FB            [ 2] 1815 	jra 2$
      000AE5                       1816 3$:
      008B03 01 9F            [ 1] 1817 	ld a,(CURR,sp)
      008B05 C7 00            [ 1] 1818 	cp a,#'\'
      008B07 0D 4F            [ 1] 1819 	jreq 1$
      008B09 A9 00            [ 1] 1820 	cp a,#'"
      008B0B 6B 01            [ 1] 1821 	jreq 6$ 
      008B0D 9E               [ 1] 1822 	ld (x),a 
      008B0E 6B               [ 2] 1823 	incw x 
      008B0F 02 C6            [ 2] 1824 	jra 2$
      000AF3                       1825 6$:
      008B11 00               [ 1] 1826 	clr (x)
      008B12 0C               [ 2] 1827 	incw x 
      008B13 97 7B            [ 1] 1828 	ldw y,x 
      008B15 03               [ 1] 1829 	clrw x 
      008B16 42 72            [ 1] 1830 	ld a,#TK_QSTR  
      000AFA                       1831 	_drop VSIZE
      008B18 FB 01            [ 2]    1     addw sp,#VSIZE 
      008B1A 9F               [ 4] 1832 	ret 
                                   1833 
                                   1834 ;---------------------------------------
                                   1835 ; called by parse_quote
                                   1836 ; subtitute escaped character 
                                   1837 ; by their ASCII value .
                                   1838 ; input:
                                   1839 ;   A  character following '\'
                                   1840 ; output:
                                   1841 ;   A  substitued char or same if not valid.
                                   1842 ;---------------------------------------
      000AFD                       1843 convert_escape:
      008B1B C7               [ 2] 1844 	pushw x 
      008B1C 00 0C 5B         [ 2] 1845 	ldw x,#escaped 
      008B1F 03               [ 1] 1846 1$:	cp a,(x)
      008B20 85 81            [ 1] 1847 	jreq 2$
      008B22 7D               [ 1] 1848 	tnz (x)
      008B22 72 53            [ 1] 1849 	jreq 3$
      008B24 00               [ 2] 1850 	incw x 
      008B25 0E 72            [ 2] 1851 	jra 1$
      008B27 53 00 0D         [ 2] 1852 2$: subw x,#escaped 
      008B2A 72               [ 1] 1853 	ld a,xl 
      008B2B 53 00            [ 1] 1854 	add a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B2D 0C               [ 2] 1855 3$:	popw x 
      008B2E A6               [ 4] 1856 	ret 
                                   1857 
      008B2F 01 CB 00 0E C7 00 0E  1858 escaped: .asciz "abtnvfr"
             4F
                                   1859 
                                   1860 ;-------------------------
                                   1861 ; integer parser 
                                   1862 ; input:
                                   1863 ;   X 		point to output buffer  
                                   1864 ;   Y 		point to tib 
                                   1865 ;   A 	    first digit|'$' 
                                   1866 ; output:  
                                   1867 ;   X 		integer 
                                   1868 ;   A 		TK_INTGR
                                   1869 ;   acc24   24 bits integer 
                                   1870 ;-------------------------
                           000001  1871 	BASE=1
                           000002  1872 	TCHAR=2 
                           000003  1873 	XSAVE=3
                           000004  1874 	VSIZE=4 
      000B1A                       1875 parse_integer: ; { -- n }
      008B37 C9               [ 2] 1876 	pushw x 	
      008B38 00 0D            [ 1] 1877 	push #0 ; TCHAR
      008B3A C7 00            [ 1] 1878 	push #10 ; BASE=10
      008B3C 0D 4F            [ 1] 1879 	cp a,#'$
      008B3E C9 00            [ 1] 1880 	jrne 2$ 
      000B23                       1881     _drop #1
      008B40 0C C7            [ 2]    1     addw sp,##1 
      008B42 00 0C            [ 1] 1882 	push #16  ; BASE=16
      008B44 81               [ 1] 1883 2$:	ld (x),a 
      008B45 5C               [ 2] 1884 	incw x 
      008B45 52 02 4F         [ 4] 1885 	ld a,([in.w],y)
      008B48 6B 01 00 01      [ 1] 1886 	inc in 
      008B4A CD 0D AD         [ 4] 1887 	call to_upper 
      008B4A 91 D6            [ 1] 1888 	ld (TCHAR,sp),a 
      008B4C 01 27 24         [ 4] 1889 	call is_digit 
      008B4F 72 5C            [ 1] 1890 	jrc 2$
      008B51 00 02            [ 1] 1891 	ld a,#16 
      008B53 6B 02            [ 1] 1892 	cp a,(BASE,sp)
      008B55 A6 5C            [ 1] 1893 	jrne 3$ 
      008B57 11 01            [ 1] 1894 	ld a,(TCHAR,sp)
      008B59 26 0A            [ 1] 1895 	cp a,#'A 
      008B5B 0F 01            [ 1] 1896 	jrmi 3$ 
      008B5D 7B 02            [ 1] 1897 	cp a,#'G 
      008B5F AD 1C            [ 1] 1898 	jrmi 2$ 
      008B61 F7 5C 20 E5      [ 1] 1899 3$: dec in 	
      008B65 7F               [ 1] 1900     clr (x)
      008B65 7B 02            [ 2] 1901 	ldw x,(XSAVE,sp)
      008B67 A1 5C 27         [ 4] 1902 	call atoi24
      008B6A DD A1            [ 1] 1903 	ldw y,x 
      008B6C 22 27 04         [ 2] 1904 	ldw x,acc16 
      008B6F F7 5C            [ 1] 1905 	ld a,#TK_INTGR
      008B71 20 D7            [ 2] 1906 	ldw (y),x 
      008B73 72 A9 00 02      [ 2] 1907 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      000B61                       1908 	_drop VSIZE  
      008B73 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008B75 90               [ 4] 1909 	ret 	
                                   1910 
                                   1911 ;-------------------------
                                   1912 ; binary integer parser
                                   1913 ; build integer in acc24  
                                   1914 ; input:
                                   1915 ;   X 		point to output buffer  
                                   1916 ;   Y 		point to tib 
                                   1917 ;   A 	    '&' 
                                   1918 ; output:  
                                   1919 ;   buffer  TK_INTGR integer  
                                   1920 ;   X 		int16 
                                   1921 ;   A 		TK_INTGR
                                   1922 ;   acc24    int24 
                                   1923 ;-------------------------
                           000001  1924 	BINARY=1 ; 24 bits integer 
                           000003  1925 	VSIZE=3
      000B64                       1926 parse_binary: ; { -- n }
      008B76 93 5F            [ 1] 1927 	push #0
      008B78 A6 02            [ 1] 1928 	push #0
      008B7A 5B 02            [ 1] 1929 	push #0
      000B6A                       1930 2$:	
      008B7C 81 D6 00         [ 4] 1931 	ld a,([in.w],y)
      008B7D 72 5C 00 01      [ 1] 1932 	inc in 
      008B7D 89 AE            [ 1] 1933 	cp a,#'0 
      008B7F 8B 92            [ 1] 1934 	jreq 3$
      008B81 F1 27            [ 1] 1935 	cp a,#'1 
      008B83 06 7D            [ 1] 1936 	jreq 3$ 
      008B85 27 09            [ 2] 1937 	jra bin_exit 
      008B87 5C 20            [ 1] 1938 3$: sub a,#'0 
      008B89 F7               [ 1] 1939 	rrc a
      008B8A 1D 8B            [ 1] 1940 	rlc (BINARY+2,sp) 
      008B8C 92 9F            [ 1] 1941 	rlc (BINARY+1,sp)
      008B8E AB 07            [ 1] 1942 	rlc (BINARY,sp) 
      008B90 85 81            [ 2] 1943 	jra 2$  
      000B86                       1944 bin_exit:
      008B92 61 62 74 6E      [ 1] 1945 	dec in 
      008B96 76 66            [ 1] 1946 	ldw y,x
      008B98 72 00            [ 1] 1947 	ld a,(BINARY,sp)
      008B9A C7 00 0B         [ 1] 1948 	ld acc24,a 
      008B9A 89 4B            [ 2] 1949 	ldw x,(BINARY+1,sp)
      008B9C 00 4B 0A         [ 2] 1950 	ldw acc16,x
      008B9F A1 24            [ 2] 1951 	ldw (y),x 
      008BA1 26 04 5B 01      [ 2] 1952 	addw y,#2  
      008BA5 4B 10            [ 1] 1953 	ld a,#TK_INTGR 	
      000B9E                       1954 	_drop VSIZE 
      008BA7 F7 5C            [ 2]    1     addw sp,#VSIZE 
      008BA9 91               [ 4] 1955 	ret
                                   1956 
                                   1957 ;---------------------------
                                   1958 ;  token begin with a letter,
                                   1959 ;  is keyword or variable. 	
                                   1960 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1961 ;   X 		point to pad 
                                   1962 ;   Y 		point to text
                                   1963 ;   A 	    first letter  
                                   1964 ; output:
                                   1965 ;   X		exec_addr|var_addr 
                                   1966 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1967 ;   pad 	keyword|var_name  
                                   1968 ;--------------------------  
                           000001  1969 	XFIRST=1
                           000002  1970 	VSIZE=2
      000BA1                       1971 parse_keyword: 
      008BAA D6               [ 2] 1972 	pushw x 
      000BA2                       1973 kw_loop:	
      008BAB 01 72 5C         [ 4] 1974 	call to_upper 
      008BAE 00               [ 1] 1975 	ld (x),a 
      008BAF 02               [ 2] 1976 	incw x 
      008BB0 CD 8E 2D         [ 4] 1977 	ld a,([in.w],y)
      008BB3 6B 02 CD 86      [ 1] 1978 	inc in 
      008BB7 00 25 ED         [ 4] 1979 	call is_alpha 
      008BBA A6 10            [ 1] 1980 	jrc kw_loop
      008BBC 11 01 26 0A      [ 1] 1981 	dec in   
      008BC0 7B               [ 1] 1982 1$: clr (x)
      008BC1 02 A1            [ 2] 1983 	ldw x,(XFIRST,sp) 
      008BC3 41 2B            [ 1] 1984 	ld a,(1,x)
      008BC5 04 A1            [ 1] 1985 	jrne 2$
                                   1986 ; one letter variable name 
      008BC7 47               [ 1] 1987 	ld a,(x) 
      008BC8 2B DD            [ 1] 1988 	sub a,#'A 
      008BCA 72               [ 1] 1989 	sll a 
      008BCB 5A               [ 1] 1990 	push a 
      008BCC 00 02            [ 1] 1991 	push #0
      008BCE 7F 1E 03         [ 2] 1992 	ldw x,#vars 
      008BD1 CD 8E 39         [ 2] 1993 	addw x,(1,sp) ; X=var address 
      000BCB                       1994 	_drop 2 
      008BD4 90 93            [ 2]    1     addw sp,#2 
      008BD6 CE 00            [ 1] 1995 	ld a,#TK_VAR 
      008BD8 0D A6            [ 2] 1996 	jra 4$ 
      000BD1                       1997 2$: ; check for keyword, otherwise syntax error.
      000BD1                       1998 	_ldx_dict kword_dict ; dictionary entry point
      008BDA 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008BDD 72 A9            [ 2] 1999 	ldw y,(XFIRST,sp) ; name to search for
      008BDF 00 02 5B         [ 4] 2000 	call search_dict
      008BE2 04               [ 1] 2001 	tnz a
      008BE3 81 03            [ 1] 2002 	jrne 4$ 
      008BE4 CC 08 7B         [ 2] 2003 	jp syntax_error
      000BDF                       2004 4$:	
      008BE4 4B 00            [ 2] 2005 	ldw y,(XFIRST,sp)
      008BE6 4B 00            [ 1] 2006 	ld (y),a 
      008BE8 4B 00            [ 2] 2007 	incw y 
      008BEA 90 FF            [ 2] 2008 	ldw (y),x
      008BEA 91 D6 01 72      [ 2] 2009 	addw y,#2  
      000BEB                       2010 	_drop VSIZE 
      008BEE 5C 00            [ 2]    1     addw sp,#VSIZE 
      008BF0 02               [ 4] 2011 	ret  	
                                   2012 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2013 
                                   2014 ;------------------------------------
                                   2015 ; scan text for next token
                                   2016 ; input: 
                                   2017 ;	X 		pointer to buffer where 
                                   2018 ;	        token id and value are copied 
                                   2019 ; use:
                                   2020 ;	Y   pointer to text in tib 
                                   2021 ; output:
                                   2022 ;   A       token attribute 
                                   2023 ;   X 		token value
                                   2024 ;   Y       updated position in output buffer   
                                   2025 ;------------------------------------
                                   2026 	; use to check special character 
                                   2027 	.macro _case c t  
                                   2028 	ld a,#c 
                                   2029 	cp a,(TCHAR,sp) 
                                   2030 	jrne t
                                   2031 	.endm 
                                   2032 
                           000001  2033 	TCHAR=1
                           000002  2034 	ATTRIB=2
                           000002  2035 	VSIZE=2
      000BEE                       2036 get_token: 
      000BEE                       2037 	_vars VSIZE
      008BF1 A1 30            [ 2]    1     sub sp,#VSIZE 
                                   2038 ;	ld a,in 
                                   2039 ;	sub a,count
                                   2040 ;   jrmi 0$
                                   2041 ;	clr a 
                                   2042 ;	ret 
      000BF0                       2043 0$: 
      008BF3 27 06 A1 31      [ 2] 2044 	ldw y,#tib    	
      008BF7 27 02            [ 1] 2045 	ld a,#SPACE
      008BF9 20 0B A0         [ 4] 2046 	call skip
      008BFC 30 46 09 03 09   [ 1] 2047 	mov in.saved,in 
      008C01 02 09 01         [ 4] 2048 	ld a,([in.w],y)
      008C04 20 E4            [ 1] 2049 	jrne 1$
      008C06 90 93            [ 1] 2050 	ldw y,x 
      008C06 72 5A 00         [ 2] 2051 	jp token_exit ; end of line 
      008C09 02 90 93 7B      [ 1] 2052 1$:	inc in 
      008C0D 01 C7 00         [ 4] 2053 	call to_upper 
      008C10 0C 1E            [ 1] 2054 	ld (TCHAR,sp),a 
                                   2055 ; check for quoted string
      000C11                       2056 str_tst:  	
      000C11                       2057 	_case '"' nbr_tst
      008C12 02 CF            [ 1]    1 	ld a,#'"' 
      008C14 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C16 90 FF            [ 1]    3 	jrne nbr_tst
      008C18 72 A9            [ 1] 2058 	ld a,#TK_QSTR
      008C1A 00               [ 1] 2059 	ld (x),a 
      008C1B 02               [ 2] 2060 	incw x 
      008C1C A6 84 5B         [ 4] 2061 	call parse_quote
      008C1F 03 81 AA         [ 2] 2062 	jp token_exit
      008C21                       2063 nbr_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2064 ; check for hexadecimal number 
      008C21 89 24            [ 1] 2065 	ld a,#'$'
      008C22 11 01            [ 1] 2066 	cp a,(TCHAR,sp) 
      008C22 CD 8E            [ 1] 2067 	jreq 1$
                                   2068 ;check for binary number 
      008C24 2D F7            [ 1] 2069 	ld a,#'&
      008C26 5C 91            [ 1] 2070 	cp a,(TCHAR,sp)
      008C28 D6 01            [ 1] 2071 	jrne 0$
      008C2A 72 5C            [ 1] 2072 	ld a,#TK_INTGR
      008C2C 00               [ 1] 2073 	ld (x),a 
      008C2D 02               [ 2] 2074 	incw x 
      008C2E CD 85 EF         [ 4] 2075 	call parse_binary ; expect binary integer 
      008C31 25 EF 72         [ 2] 2076 	jp token_exit 
                                   2077 ; check for decimal number 	
      008C34 5A 00            [ 1] 2078 0$:	ld a,(TCHAR,sp)
      008C36 02 7F 1E         [ 4] 2079 	call is_digit
      008C39 01 E6            [ 1] 2080 	jrnc 3$
      008C3B 01 26            [ 1] 2081 1$:	ld a,#TK_INTGR 
      008C3D 13               [ 1] 2082 	ld (x),a 
      008C3E F6               [ 2] 2083 	incw x 
      008C3F A0 41            [ 1] 2084 	ld a,(TCHAR,sp)
      008C41 48 88 4B         [ 4] 2085 	call parse_integer 
      008C44 00 AE 00         [ 2] 2086 	jp token_exit 
      000C4A                       2087 3$: 
      000C4A                       2088 	_case '(' bkslsh_tst 
      008C47 30 72            [ 1]    1 	ld a,#'(' 
      008C49 FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4B 5B 02            [ 1]    3 	jrne bkslsh_tst
      008C4D A6 85            [ 1] 2089 	ld a,#TK_LPAREN
      008C4F 20 0E A6         [ 2] 2090 	jp token_char   	
      008C51                       2091 bkslsh_tst: ; character token 
      000C55                       2092 	_case '\',rparnt_tst
      008C51 AE A7            [ 1]    1 	ld a,#'\' 
      008C53 33 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008C55 01 CD            [ 1]    3 	jrne rparnt_tst
      008C57 90 37            [ 1] 2093 	ld a,#TK_CHAR 
      008C59 4D               [ 1] 2094 	ld (x),a 
      008C5A 26               [ 2] 2095 	incw x 
      008C5B 03 CC 88         [ 4] 2096 	ld a,([in.w],y)
      008C5E FB               [ 1] 2097 	ld (x),a 
      008C5F 5C               [ 2] 2098 	incw x
      008C5F 16 01            [ 1] 2099 	ldw y,x 	 
      008C61 90 F7 90 5C      [ 1] 2100 	inc in  
      008C65 90               [ 1] 2101 	clrw x 
      008C66 FF               [ 1] 2102 	ld xl,a 
      008C67 72 A9            [ 1] 2103 	ld a,#TK_CHAR 
      008C69 00 02 5B         [ 2] 2104 	jp token_exit 
      000C71                       2105 rparnt_tst:		
      000C71                       2106 	_case ')' colon_tst 
      008C6C 02 81            [ 1]    1 	ld a,#')' 
      008C6E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6E 52 02            [ 1]    3 	jrne colon_tst
      008C70 A6 08            [ 1] 2107 	ld a,#TK_RPAREN 
      008C70 90 AE 16         [ 2] 2108 	jp token_char
      000C7C                       2109 colon_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      000C7C                       2110 	_case ':' comma_tst 
      008C73 90 A6            [ 1]    1 	ld a,#':' 
      008C75 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C77 8E A3            [ 1]    3 	jrne comma_tst
      008C79 55 00            [ 1] 2111 	ld a,#TK_COLON 
      008C7B 02 00 03         [ 2] 2112 	jp token_char  
      000C87                       2113 comma_tst:
      000C87                       2114 	_case COMMA sharp_tst 
      008C7E 91 D6            [ 1]    1 	ld a,#COMMA 
      008C80 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008C82 05 90            [ 1]    3 	jrne sharp_tst
      008C84 93 CC            [ 1] 2115 	ld a,#TK_COMMA
      008C86 8E 2A 72         [ 2] 2116 	jp token_char
      000C92                       2117 sharp_tst:
      000C92                       2118 	_case SHARP dash_tst 
      008C89 5C 00            [ 1]    1 	ld a,#SHARP 
      008C8B 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8D 8E 2D            [ 1]    3 	jrne dash_tst
      008C8F 6B 01            [ 1] 2119 	ld a,#TK_SHARP
      008C91 CC 0D A6         [ 2] 2120 	jp token_char  	 	 
      000C9D                       2121 dash_tst: 	
      000C9D                       2122 	_case '-' at_tst 
      008C91 A6 22            [ 1]    1 	ld a,#'-' 
      008C93 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C95 26 0A            [ 1]    3 	jrne at_tst
      008C97 A6 02            [ 1] 2123 	ld a,#TK_MINUS  
      008C99 F7 5C CD         [ 2] 2124 	jp token_char 
      000CA8                       2125 at_tst:
      000CA8                       2126 	_case '@' qmark_tst 
      008C9C 8B 45            [ 1]    1 	ld a,#'@' 
      008C9E CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA0 2A 05            [ 1]    3 	jrne qmark_tst
      008CA1 A6 06            [ 1] 2127 	ld a,#TK_ARRAY 
      008CA1 A6 24 11         [ 2] 2128 	jp token_char
      000CB3                       2129 qmark_tst:
      000CB3                       2130 	_case '?' tick_tst 
      008CA4 01 27            [ 1]    1 	ld a,#'?' 
      008CA6 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA8 26 11            [ 1]    3 	jrne tick_tst
      008CAA 01 26            [ 1] 2131 	ld a,#TK_CMD  
      008CAC 0A               [ 1] 2132 	ld (x),a 
      008CAD A6               [ 2] 2133 	incw x 
      008CAE 84 F7            [ 1] 2134 	ldw y,x 
      008CB0 5C CD 8B         [ 2] 2135 	ldw x,#PRT_IDX 
      008CB3 E4 CC            [ 2] 2136 	ldw (y),x 
      008CB5 8E 2A 7B 01      [ 2] 2137 	addw y,#2
      008CB9 CD 86 00         [ 2] 2138 	jp token_exit
      000CCB                       2139 tick_tst: ; comment 
      000CCB                       2140 	_case TICK plus_tst 
      008CBC 24 0C            [ 1]    1 	ld a,#TICK 
      008CBE A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC0 F7 5C            [ 1]    3 	jrne plus_tst
      008CC2 7B 01            [ 1] 2141 	ld a,#TK_CMD
      008CC4 CD               [ 1] 2142 	ld (x),a 
      008CC5 8B               [ 2] 2143 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CC6 9A CC 8E 2A      [ 2] 2144 	ldw y,#REM_IDX
      008CCA FF               [ 2] 2145 	ldw (x),y 
      008CCA A6 28 11         [ 2] 2146 	addw x,#2  
      000CDD                       2147 copy_comment:
      008CCD 01 26 05 A6      [ 2] 2148 	ldw y,#tib 
      008CD1 07 CC 8E 26      [ 2] 2149 	addw y,in.w
      008CD5 90 89            [ 2] 2150 	pushw y
      008CD5 A6 5C 11         [ 4] 2151 	call strcpy
      008CD8 01 26 16         [ 2] 2152     subw y,(1,sp)
      008CDB A6 03            [ 1] 2153 	ld a,yl 
      008CDD F7 5C 91         [ 1] 2154 	add a,in
      008CE0 D6 01 F7         [ 1] 2155 	ld in,a 
      008CE3 5C 90            [ 2] 2156 	ldw (1,sp),x
      008CE5 93 72 5C         [ 2] 2157 	addw y,(1,sp)
      008CE8 00 02            [ 2] 2158 	incw y 
      000CFC                       2159 	_drop 2 
      008CEA 5F 97            [ 2]    1     addw sp,#2 
      008CEC A6 03 CC         [ 2] 2160 	ldw x,#REM_IDX 
      008CEF 8E 2A            [ 1] 2161 	ld a,#TK_CMD 
      008CF1 CC 0D AA         [ 2] 2162 	jp token_exit 
      000D06                       2163 plus_tst:
      000D06                       2164 	_case '+' star_tst 
      008CF1 A6 29            [ 1]    1 	ld a,#'+' 
      008CF3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF5 26 05            [ 1]    3 	jrne star_tst
      008CF7 A6 08            [ 1] 2165 	ld a,#TK_PLUS  
      008CF9 CC 8E 26         [ 2] 2166 	jp token_char 
      008CFC                       2167 star_tst:
      000D11                       2168 	_case '*' slash_tst 
      008CFC A6 3A            [ 1]    1 	ld a,#'*' 
      008CFE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D00 26 05            [ 1]    3 	jrne slash_tst
      008D02 A6 01            [ 1] 2169 	ld a,#TK_MULT 
      008D04 CC 8E 26         [ 2] 2170 	jp token_char 
      008D07                       2171 slash_tst: 
      000D1C                       2172 	_case '/' prcnt_tst 
      008D07 A6 2C            [ 1]    1 	ld a,#'/' 
      008D09 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0B 26 05            [ 1]    3 	jrne prcnt_tst
      008D0D A6 09            [ 1] 2173 	ld a,#TK_DIV 
      008D0F CC 8E 26         [ 2] 2174 	jp token_char 
      008D12                       2175 prcnt_tst:
      000D27                       2176 	_case '%' eql_tst 
      008D12 A6 23            [ 1]    1 	ld a,#'%' 
      008D14 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D16 26 05            [ 1]    3 	jrne eql_tst
      008D18 A6 0A            [ 1] 2177 	ld a,#TK_MOD
      008D1A CC 8E 26         [ 2] 2178 	jp token_char  
                                   2179 ; 1 or 2 character tokens 	
      008D1D                       2180 eql_tst:
      000D32                       2181 	_case '=' gt_tst 		
      008D1D A6 2D            [ 1]    1 	ld a,#'=' 
      008D1F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D21 26 05            [ 1]    3 	jrne gt_tst
      008D23 A6 11            [ 1] 2182 	ld a,#TK_EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D25 CC 8E 26         [ 2] 2183 	jp token_char 
      008D28                       2184 gt_tst:
      000D3D                       2185 	_case '>' lt_tst 
      008D28 A6 40            [ 1]    1 	ld a,#'>' 
      008D2A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2C 26 05            [ 1]    3 	jrne lt_tst
      008D2E A6 06            [ 1] 2186 	ld a,#TK_GT 
      008D30 CC 8E            [ 1] 2187 	ld (ATTRIB,sp),a 
      008D32 26 5C 00 01      [ 1] 2188 	inc in 
      008D33 91 D6 00         [ 4] 2189 	ld a,([in.w],y)
      008D33 A6 3F            [ 1] 2190 	cp a,#'=
      008D35 11 01            [ 1] 2191 	jrne 1$
      008D37 26 12            [ 1] 2192 	ld a,#TK_GE 
      008D39 A6 80            [ 2] 2193 	jra token_char  
      008D3B F7 5C            [ 1] 2194 1$: cp a,#'<
      008D3D 90 93            [ 1] 2195 	jrne 2$
      008D3F AE 00            [ 1] 2196 	ld a,#TK_NE 
      008D41 74 90            [ 2] 2197 	jra token_char 
      008D43 FF 72 A9 00      [ 1] 2198 2$: dec in
      008D47 02 CC            [ 1] 2199 	ld a,(ATTRIB,sp)
      008D49 8E 2A            [ 2] 2200 	jra token_char 	 
      008D4B                       2201 lt_tst:
      000D66                       2202 	_case '<' other
      008D4B A6 27            [ 1]    1 	ld a,#'<' 
      008D4D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4F 26 35            [ 1]    3 	jrne other
      008D51 A6 80            [ 1] 2203 	ld a,#TK_LT 
      008D53 F7 5C            [ 1] 2204 	ld (ATTRIB,sp),a 
      008D55 90 AE 00 8E      [ 1] 2205 	inc in 
      008D59 FF 1C 00         [ 4] 2206 	ld a,([in.w],y)
      008D5C 02 3D            [ 1] 2207 	cp a,#'=
      008D5D 26 04            [ 1] 2208 	jrne 1$
      008D5D 90 AE            [ 1] 2209 	ld a,#TK_LE 
      008D5F 16 90            [ 2] 2210 	jra token_char 
      008D61 72 B9            [ 1] 2211 1$: cp a,#'>
      008D63 00 01            [ 1] 2212 	jrne 2$
      008D65 90 89            [ 1] 2213 	ld a,#TK_NE 
      008D67 CD 84            [ 2] 2214 	jra token_char 
      008D69 34 72 F2 01      [ 1] 2215 2$: dec in 
      008D6D 90 9F            [ 1] 2216 	ld a,(ATTRIB,sp)
      008D6F CB 00            [ 2] 2217 	jra token_char 	
      000D8F                       2218 other: ; not a special character 	 
      008D71 02 C7            [ 1] 2219 	ld a,(TCHAR,sp)
      008D73 00 02 1F         [ 4] 2220 	call is_alpha 
      008D76 01 72            [ 1] 2221 	jrc 30$ 
      008D78 F9 01 90         [ 2] 2222 	jp syntax_error 
      000D99                       2223 30$: 
      008D7B 5C 5B 02         [ 4] 2224 	call parse_keyword
      008D7E AE 00 8E         [ 2] 2225 	cpw x,#remark 
      008D81 A6 80            [ 1] 2226 	jrne token_exit 
      008D83 CC 8E            [ 1] 2227 	ldw y,x 
      008D85 2A 0C DD         [ 2] 2228 	jp copy_comment 
      008D86                       2229 token_char:
      008D86 A6               [ 1] 2230 	ld (x),a 
      008D87 2B               [ 2] 2231 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D88 11 01            [ 1] 2232 	ldw y,x 
      000DAA                       2233 token_exit:
      000DAA                       2234 	_drop VSIZE 
      008D8A 26 05            [ 2]    1     addw sp,#VSIZE 
      008D8C A6               [ 4] 2235 	ret
                                   2236 
                                   2237 
                                   2238 ;------------------------------------
                                   2239 ; convert alpha to uppercase
                                   2240 ; input:
                                   2241 ;    a  character to convert
                                   2242 ; output:
                                   2243 ;    a  uppercase character
                                   2244 ;------------------------------------
      000DAD                       2245 to_upper::
      008D8D 10 CC            [ 1] 2246 	cp a,#'a
      008D8F 8E 26            [ 1] 2247 	jrpl 1$
      008D91 81               [ 4] 2248 0$:	ret
      008D91 A6 2A            [ 1] 2249 1$: cp a,#'z	
      008D93 11 01            [ 1] 2250 	jrugt 0$
      008D95 26 05            [ 1] 2251 	sub a,#32
      008D97 A6               [ 4] 2252 	ret
                                   2253 	
                                   2254 ;------------------------------------
                                   2255 ; convert pad content in integer
                                   2256 ; input:
                                   2257 ;    x		.asciz to convert
                                   2258 ; output:
                                   2259 ;    acc24      int24_t
                                   2260 ;------------------------------------
                                   2261 	; local variables
                           000001  2262 	SIGN=1 ; 1 byte, 
                           000002  2263 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2264 	TEMP=3 ; 1 byte, temporary storage
                           000003  2265 	VSIZE=3 ; 3 bytes reserved for local storage
      000DB9                       2266 atoi24::
      008D98 20               [ 2] 2267 	pushw x 
      000DBA                       2268 	_vars VSIZE
      008D99 CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2269 	; acc24=0 
      008D9B 26 5F 00 0B      [ 1] 2270 	clr acc24    
      008D9C 72 5F 00 0C      [ 1] 2271 	clr acc16
      008D9C A6 2F 11 01      [ 1] 2272 	clr acc8 
      008DA0 26 05            [ 1] 2273 	clr (SIGN,sp)
      008DA2 A6 21            [ 1] 2274 	ld a,#10
      008DA4 CC 8E            [ 1] 2275 	ld (BASE,sp),a ; default base decimal
      008DA6 26               [ 1] 2276 	ld a,(x)
      008DA7 27 47            [ 1] 2277 	jreq 9$  ; completed if 0
      008DA7 A6 25            [ 1] 2278 	cp a,#'-
      008DA9 11 01            [ 1] 2279 	jrne 1$
      008DAB 26 05            [ 1] 2280 	cpl (SIGN,sp)
      008DAD A6 22            [ 2] 2281 	jra 2$
      008DAF CC 8E            [ 1] 2282 1$: cp a,#'$
      008DB1 26 06            [ 1] 2283 	jrne 3$
      008DB2 A6 10            [ 1] 2284 	ld a,#16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DB2 A6 3D            [ 1] 2285 	ld (BASE,sp),a
      008DB4 11               [ 2] 2286 2$:	incw x
      008DB5 01               [ 1] 2287 	ld a,(x)
      000DE3                       2288 3$:	
      008DB6 26 05            [ 1] 2289 	cp a,#'a
      008DB8 A6 32            [ 1] 2290 	jrmi 4$
      008DBA CC 8E            [ 1] 2291 	sub a,#32
      008DBC 26 30            [ 1] 2292 4$:	cp a,#'0
      008DBD 2B 2B            [ 1] 2293 	jrmi 9$
      008DBD A6 3E            [ 1] 2294 	sub a,#'0
      008DBF 11 01            [ 1] 2295 	cp a,#10
      008DC1 26 23            [ 1] 2296 	jrmi 5$
      008DC3 A6 31            [ 1] 2297 	sub a,#7
      008DC5 6B 02            [ 1] 2298 	cp a,(BASE,sp)
      008DC7 72 5C            [ 1] 2299 	jrpl 9$
      008DC9 00 02            [ 1] 2300 5$:	ld (TEMP,sp),a
      008DCB 91 D6            [ 1] 2301 	ld a,(BASE,sp)
      008DCD 01 A1 3D         [ 4] 2302 	call mulu24_8
      008DD0 26 04            [ 1] 2303 	ld a,(TEMP,sp)
      008DD2 A6 33 20         [ 1] 2304 	add a,acc24+2
      008DD5 50 A1 3C         [ 1] 2305 	ld acc24+2,a
      008DD8 26               [ 1] 2306 	clr a
      008DD9 04 A6 35         [ 1] 2307 	adc a,acc24+1
      008DDC 20 48 72         [ 1] 2308 	ld acc24+1,a
      008DDF 5A               [ 1] 2309 	clr a
      008DE0 00 02 7B         [ 1] 2310 	adc a,acc24
      008DE3 02 20 40         [ 1] 2311 	ld acc24,a
      008DE6 20 C9            [ 2] 2312 	jra 2$
      008DE6 A6 3C            [ 1] 2313 9$:	tnz (SIGN,sp)
      008DE8 11 01            [ 1] 2314     jreq atoi_exit
      008DEA 26 23 A6         [ 4] 2315     call neg_acc24
      000E1F                       2316 atoi_exit: 
      000E1F                       2317 	_drop VSIZE
      008DED 34 6B            [ 2]    1     addw sp,#VSIZE 
      008DEF 02               [ 2] 2318 	popw x ; restore x
      008DF0 72               [ 4] 2319 	ret
                                   2320 
                                   2321 
                                   2322 ;------------------------------------
                                   2323 ; skip character c in text starting from 'in'
                                   2324 ; input:
                                   2325 ;	 y 		point to text buffer
                                   2326 ;    a 		character to skip
                                   2327 ; output:  
                                   2328 ;	'in' ajusted to new position
                                   2329 ;------------------------------------
                           000001  2330 	C = 1 ; local var
      000E23                       2331 skip:
      008DF1 5C               [ 1] 2332 	push a
      008DF2 00 02 91         [ 4] 2333 1$:	ld a,([in.w],y)
      008DF5 D6 01            [ 1] 2334 	jreq 2$
      008DF7 A1 3D            [ 1] 2335 	cp a,(C,sp)
      008DF9 26 04            [ 1] 2336 	jrne 2$
      008DFB A6 36 20 27      [ 1] 2337 	inc in
      008DFF A1 3E            [ 2] 2338 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E33                       2339 2$: _drop 1 
      008E01 26 04            [ 2]    1     addw sp,#1 
      008E03 A6               [ 4] 2340 	ret
                                   2341 	
                                   2342 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2343 ;;   TINY BASIC  operators,
                                   2344 ;;   commands and functions 
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2346 
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2348 ;;  Arithmetic operators
                                   2349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2350 
                                   2351 ;debug support
                           000001  2352 DEBUG_PRT=1
                           000001  2353 .if DEBUG_PRT 
      000E36                       2354 printxy:
      008E04 35 20 1F         [ 1] 2355 	ld a,base 
      008E07 72               [ 1] 2356 	push a 
      008E08 5A               [ 2] 2357 	pushw x 
      008E09 00 02            [ 2] 2358 	pushw y
      008E0B 7B 02 20 17      [ 1] 2359 	mov base,#16 
      008E0F CD 09 CA         [ 4] 2360 	call print_int
      008E0F 7B 01            [ 1] 2361 	ld a,#SPACE 
      008E11 CD 85 EF         [ 4] 2362 	call putc  
      008E14 25 03            [ 2] 2363 	ldw x,(1,sp)
      008E16 CC 88 FB         [ 4] 2364 	call print_int 
      008E19 A6 0D            [ 1] 2365 	ld a,#CR 
      008E19 CD 8C 21         [ 4] 2366 	call putc 
      008E1C A3 96            [ 2] 2367 	popw y 
      008E1E 79               [ 2] 2368 	popw x 
      008E1F 26               [ 1] 2369 	pop a 
      008E20 09 90 93         [ 1] 2370 	ld base,a 
      008E23 CC               [ 4] 2371 	ret 
                                   2372 .endif 
                                   2373 
                                   2374 
                                   2375 ;--------------------------------------
                                   2376 ;  multiply 2 uint16_t return uint32_t
                                   2377 ;  input:
                                   2378 ;     x       uint16_t 
                                   2379 ;     y       uint16_t 
                                   2380 ;  output:
                                   2381 ;     x       product bits 15..0
                                   2382 ;     y       product bits 31..16 
                                   2383 ;---------------------------------------
                           000001  2384 		U1=1  ; uint16_t 
                           000003  2385 		DBL=3 ; uint32_t
                           000006  2386 		VSIZE=6
      000E5B                       2387 umstar:
      000E5B                       2388 	_vars VSIZE 
      008E24 8D 5D            [ 2]    1     sub sp,#VSIZE 
      008E26 1F 01            [ 2] 2389 	ldw (U1,sp),x 
                                   2390 ;initialize bits 31..16 of 
                                   2391 ;product to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E26 F7 5C            [ 1] 2392 	clr (DBL,sp)
      008E28 90 93            [ 1] 2393 	clr (DBL+1,sp)
                                   2394 ; produc U1L*U2L 
      008E2A 90 9F            [ 1] 2395 	ld a,yl 
      008E2A 5B               [ 4] 2396 	mul x,a 
      008E2B 02 81            [ 2] 2397 	ldw (DBL+2,sp),x
                                   2398 ; product U1H*U2L 
      008E2D 7B 01            [ 1] 2399 	ld a,(U1,sp) ; xh 
      008E2D A1               [ 1] 2400 	ldw x,y
      008E2E 61               [ 4] 2401 	mul x,a 
      008E2F 2A               [ 1] 2402 	clr a 
      008E30 01 81 A1         [ 2] 2403 	addw x,(DBL+1,sp) 
      008E33 7A               [ 1] 2404 	clr a 
      008E34 22 FB            [ 1] 2405 	adc a,(DBL,sp) 
      008E36 A0 20            [ 1] 2406 	ld (DBL,sp),a ; bits 23..17 
      008E38 81 04            [ 2] 2407 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2408 ; product U1L*U2H
      008E39 90 5E            [ 1] 2409 	swapw y 
      008E39 89               [ 1] 2410 	ldw x,y
      008E3A 52 03            [ 1] 2411 	ld a,(U1+1,sp)
      008E3C 72               [ 4] 2412 	mul x,a
      008E3D 5F 00 0C         [ 2] 2413 	addw x,(DBL+1,sp)
      008E40 72               [ 1] 2414 	clr a 
      008E41 5F 00            [ 1] 2415 	adc a,(DBL,sp)
      008E43 0D 72            [ 1] 2416 	ld (DBL,sp),a 
      008E45 5F 00            [ 2] 2417 	ldw (DBL+1,sp),x 
                                   2418 ; product U1H*U2H 	
      008E47 0E 0F            [ 1] 2419 	ld a,(U1,sp)
      008E49 01               [ 1] 2420 	ldw x,y  
      008E4A A6               [ 4] 2421 	mul x,a 
      008E4B 0A 6B 02         [ 2] 2422 	addw x,(DBL,sp)
      008E4E F6 27            [ 1] 2423 	ldw y,x 
      008E50 47 A1            [ 2] 2424 	ldw x,(DBL+2,sp)
      000E92                       2425 	_drop VSIZE 
      008E52 2D 26            [ 2]    1     addw sp,#VSIZE 
      008E54 04               [ 4] 2426 	ret
                                   2427 
                                   2428 
                                   2429 ;-------------------------------------
                                   2430 ; multiply 2 integers
                                   2431 ; input:
                                   2432 ;  	x       n1 
                                   2433 ;   y 		n2 
                                   2434 ; output:
                                   2435 ;	X        N1*N2 bits 15..0
                                   2436 ;   Y        N1*N2 bits 31..16 
                                   2437 ;-------------------------------------
                           000001  2438 	SIGN=1
                           000001  2439 	VSIZE=1
      000E95                       2440 multiply:
      000E95                       2441 	_vars VSIZE 
      008E55 03 01            [ 2]    1     sub sp,#VSIZE 
      008E57 20 08            [ 1] 2442 	clr (SIGN,sp)
      008E59 A1               [ 1] 2443 	ld a,xh 
      008E5A 24 26            [ 1] 2444 	and a,#0x80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E5C 06 A6            [ 1] 2445 	jrpl 1$
      008E5E 10 6B            [ 1] 2446 	cpl (SIGN,sp)
      008E60 02               [ 2] 2447 	negw x 
      000EA1                       2448 1$:	
      008E61 5C F6            [ 1] 2449 	ld a,yh
      008E63 A4 80            [ 1] 2450 	and a,#0x80  
      008E63 A1 61            [ 1] 2451 	jrpl 2$ 
      008E65 2B 02            [ 1] 2452 	cpl (SIGN,sp)
      008E67 A0 20            [ 2] 2453 	negw y 
      000EAB                       2454 2$:	
      008E69 A1 30 2B         [ 4] 2455 	call umstar
      008E6C 2B A0            [ 1] 2456 	ld a,(SIGN,sp)
      008E6E 30 A1            [ 1] 2457 	jreq 3$
      008E70 0A 2B 06         [ 4] 2458 	call dneg 
      000EB5                       2459 3$:	
      000EB5                       2460 	_drop VSIZE 
      008E73 A0 07            [ 2]    1     addw sp,#VSIZE 
      008E75 11               [ 4] 2461 	ret
                                   2462 
                                   2463 ;--------------------------------------
                                   2464 ; divide uint32_t/uint16_t
                                   2465 ; return:  quotient and remainder 
                                   2466 ; quotient expected to be uint16_t 
                                   2467 ; input:
                                   2468 ;   DBLDIVDND    on stack 
                                   2469 ;   X            divisor 
                                   2470 ; output:
                                   2471 ;   X            quotient 
                                   2472 ;   Y            remainder 
                                   2473 ;---------------------------------------
                           000003  2474 	VSIZE=3
      000EB8                       2475 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EB8                       2476 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2477 	; local variables 
                           000001  2478 	DIVISOR=1 
                           000003  2479 	CNTR=3 
      000EB8                       2480 udiv32_16:
      000EB8                       2481 	_vars VSIZE 
      008E76 02 2A            [ 2]    1     sub sp,#VSIZE 
      008E78 1F 6B            [ 2] 2482 	ldw (DIVISOR,sp),x	; save divisor 
      008E7A 03 7B            [ 2] 2483 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008E7C 02 CD            [ 2] 2484 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008E7E 8A E8            [ 2] 2485 	tnzw y
      008E80 7B 03            [ 1] 2486 	jrne long_division 
      008E82 CB 00            [ 2] 2487 	ldw y,(DIVISOR,sp)
      008E84 0E               [ 2] 2488 	divw x,y
      000EC7                       2489 	_drop VSIZE 
      008E85 C7 00            [ 2]    1     addw sp,#VSIZE 
      008E87 0E               [ 4] 2490 	ret
      000ECA                       2491 long_division:
      008E88 4F               [ 1] 2492 	exgw x,y ; hi in x, lo in y 
      008E89 C9 00            [ 1] 2493 	ld a,#17 
      008E8B 0D C7            [ 1] 2494 	ld (CNTR,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000ECF                       2495 1$:
      008E8D 00 0D            [ 2] 2496 	cpw x,(DIVISOR,sp)
      008E8F 4F C9            [ 1] 2497 	jrmi 2$
      008E91 00 0C C7         [ 2] 2498 	subw x,(DIVISOR,sp)
      008E94 00               [ 1] 2499 2$:	ccf 
      008E95 0C 20            [ 2] 2500 	rlcw y 
      008E97 C9               [ 2] 2501 	rlcw x 
      008E98 0D 01            [ 1] 2502 	dec (CNTR,sp)
      008E9A 27 03            [ 1] 2503 	jrne 1$
      008E9C CD               [ 1] 2504 	exgw x,y 
      000EDF                       2505 	_drop VSIZE 
      008E9D 8B 22            [ 2]    1     addw sp,#VSIZE 
      008E9F 81               [ 4] 2506 	ret
                                   2507 
                                   2508 ;-----------------------------
                                   2509 ; negate double int.
                                   2510 ; input:
                                   2511 ;   x     bits 15..0
                                   2512 ;   y     bits 31..16
                                   2513 ; output: 
                                   2514 ;   x     bits 15..0
                                   2515 ;   y     bits 31..16
                                   2516 ;-----------------------------
      000EE2                       2517 dneg:
      008E9F 5B               [ 2] 2518 	cplw x 
      008EA0 03 85            [ 2] 2519 	cplw y 
      008EA2 81 00 01         [ 2] 2520 	addw x,#1 
      008EA3 24 02            [ 1] 2521 	jrnc 1$
      008EA3 88 91            [ 2] 2522 	incw y 
      008EA5 D6               [ 4] 2523 1$: ret 
                                   2524 
                                   2525 
                                   2526 ;--------------------------------
                                   2527 ; sign extend single to double
                                   2528 ; input:
                                   2529 ;   x    int16_t
                                   2530 ; output:
                                   2531 ;   x    int32_t bits 15..0
                                   2532 ;   y    int32_t bits 31..16
                                   2533 ;--------------------------------
      000EED                       2534 dbl_sign_extend:
      008EA6 01 27            [ 1] 2535 	clrw y
      008EA8 0A               [ 1] 2536 	ld a,xh 
      008EA9 11 01            [ 1] 2537 	and a,#0x80 
      008EAB 26 06            [ 1] 2538 	jreq 1$
      008EAD 72 5C            [ 2] 2539 	cplw y
      008EAF 00               [ 4] 2540 1$: ret 	
                                   2541 
                                   2542 
                                   2543 ;----------------------------------
                                   2544 ;  euclidian divide dbl/n1 
                                   2545 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2546 ; input:
                                   2547 ;    dbl    int32_t on stack 
                                   2548 ;    x 		n1   int16_t  disivor  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2549 ; output:
                                   2550 ;    X      dbl/x  int16_t 
                                   2551 ;    Y      remainder int16_t 
                                   2552 ;----------------------------------
                           000008  2553 	VSIZE=8
      000EF7                       2554 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000EF7                       2555 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000EF7                       2556 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2557 	; local variables
                           000001  2558 	DBLHI=1
                           000003  2559 	DBLLO=3 
                           000005  2560 	SDIVSR=5 ; sign divisor
                           000006  2561 	SQUOT=6 ; sign dividend 
                           000007  2562 	DIVISR=7 ; divisor 
      000EF7                       2563 div32_16:
      000EF7                       2564 	_vars VSIZE 
      008EB0 02 20            [ 2]    1     sub sp,#VSIZE 
      008EB2 F1 5B            [ 1] 2565 	clr (SDIVSR,sp)
      008EB4 01 81            [ 1] 2566 	clr (SQUOT,sp)
                                   2567 ; copy arguments 
      008EB6 16 0B            [ 2] 2568 	ldw y,(DIVDNDHI,sp)
      008EB6 C6 00            [ 2] 2569 	ldw (DBLHI,sp),y
      008EB8 0B 88            [ 2] 2570 	ldw y,(DIVDNDLO,sp)
      008EBA 89 90            [ 2] 2571 	ldw (DBLLO,sp),y 
                                   2572 ; check for 0 divisor
      008EBC 89               [ 2] 2573 	tnzw x 
      008EBD 35 10            [ 1] 2574     jrne 0$
      008EBF 00 0B            [ 1] 2575 	ld a,#ERR_DIV0 
      008EC1 CD 8A 4A         [ 2] 2576 	jp tb_error 
                                   2577 ; check divisor sign 	
      008EC4 A6               [ 1] 2578 0$:	ld a,xh 
      008EC5 20 CD            [ 1] 2579 	and a,#0x80 
      008EC7 83 40            [ 1] 2580 	jreq 1$
      008EC9 1E 01            [ 1] 2581 	cpl (SDIVSR,sp)
      008ECB CD 8A            [ 1] 2582 	cpl (SQUOT,sp)
      008ECD 4A               [ 2] 2583 	negw x
      008ECE A6 0D            [ 2] 2584 1$:	ldw (DIVISR,sp),x
                                   2585 ; check dividend sign 	 
      008ED0 CD 83            [ 1] 2586  	ld a,(DBLHI,sp) 
      008ED2 40 90            [ 1] 2587 	and a,#0x80 
      008ED4 85 85            [ 1] 2588 	jreq 2$ 
      008ED6 84 C7            [ 1] 2589 	cpl (SQUOT,sp)
      008ED8 00 0B            [ 2] 2590 	ldw x,(DBLLO,sp)
      008EDA 81 01            [ 2] 2591 	ldw y,(DBLHI,sp)
      008EDB CD 0E E2         [ 4] 2592 	call dneg 
      008EDB 52 06            [ 2] 2593 	ldw (DBLLO,sp),x 
      008EDD 1F 01            [ 2] 2594 	ldw (DBLHI,sp),y 
      008EDF 0F 03            [ 2] 2595 2$:	ldw x,(DIVISR,sp)
      008EE1 0F 04 90         [ 4] 2596 	call udiv32_16
      008EE4 9F 42            [ 2] 2597 	tnzw y 
      008EE6 1F 05            [ 1] 2598 	jreq 3$ 
                                   2599 ; x=quotient 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2600 ; y=remainder 
                                   2601 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008EE8 7B 01            [ 1] 2602 	ld a,(SQUOT,sp)
      008EEA 93 42            [ 1] 2603 	xor a,(SDIVSR,sp)
      008EEC 4F 72            [ 1] 2604 	jreq 3$
      008EEE FB               [ 2] 2605 	incw x 
      008EEF 04 4F 19 03      [ 2] 2606 	ldw acc16,y 
      008EF3 6B 03            [ 2] 2607 	ldw y,(DIVISR,sp)
      008EF5 1F 04 90 5E      [ 2] 2608 	subw y,acc16
                                   2609 ; sign quotient
      008EF9 93 7B            [ 1] 2610 3$:	ld a,(SQUOT,sp)
      008EFB 02 42            [ 1] 2611 	jreq 4$
      008EFD 72               [ 2] 2612 	negw x 
      000F4B                       2613 4$:	
      000F4B                       2614 	_drop VSIZE 
      008EFE FB 04            [ 2]    1     addw sp,#VSIZE 
      008F00 4F               [ 4] 2615 	ret 
                                   2616 
                                   2617 
                                   2618 
                                   2619 ;----------------------------------
                                   2620 ; division x/y 
                                   2621 ; input:
                                   2622 ;    X       dividend
                                   2623 ;    Y       divisor 
                                   2624 ; output:
                                   2625 ;    X       quotient
                                   2626 ;    Y       remainder 
                                   2627 ;-----------------------------------
                           000004  2628 	VSIZE=4 
                                   2629 	; local variables 
                           000001  2630 	DBLHI=1
                           000003  2631 	DBLLO=3
      000F4E                       2632 divide: 
      000F4E                       2633 	_vars VSIZE 
      008F01 19 03            [ 2]    1     sub sp,#VSIZE 
      008F03 6B 03 1F 04      [ 2] 2634 	ldw acc16,y
      008F07 7B 01 93         [ 4] 2635 	call dbl_sign_extend
      008F0A 42 72            [ 2] 2636 	ldw (DBLLO,sp),x 
      008F0C FB 03            [ 2] 2637 	ldw (DBLHI,sp),y 
      008F0E 90 93 1E         [ 2] 2638 	ldw x,acc16 
      008F11 05 5B 06         [ 4] 2639 	call div32_16 
      000F61                       2640 	_drop VSIZE 
      008F14 81 04            [ 2]    1     addw sp,#VSIZE 
      008F15 81               [ 4] 2641 	ret
                                   2642 
                                   2643 
                                   2644 ;----------------------------------
                                   2645 ;  remainder resulting from euclidian 
                                   2646 ;  division of x/y 
                                   2647 ; input:
                                   2648 ;   x   	dividend int16_t 
                                   2649 ;   y 		divisor int16_t
                                   2650 ; output:
                                   2651 ;   X       n1%n2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2652 ;----------------------------------
      000F64                       2653 modulo:
      008F15 52 01 0F         [ 4] 2654 	call divide
      008F18 01               [ 1] 2655 	ldw x,y 
      008F19 9E               [ 4] 2656 	ret 
                                   2657 
                                   2658 ;----------------------------------
                                   2659 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2660 ; return expr1*expr2/expr3 
                                   2661 ; product result is int32_t and 
                                   2662 ; divisiont is int32_t/int16_t
                                   2663 ;----------------------------------
                           000004  2664 	DBL_SIZE=4 
      000F69                       2665 muldiv:
      008F1A A4 80 2A         [ 4] 2666 	call func_args 
      008F1D 03 03            [ 1] 2667 	cp a,#3 
      008F1F 01 50            [ 1] 2668 	jreq 1$
      008F21 CC 08 7B         [ 2] 2669 	jp syntax_error
      000F73                       2670 1$: 
      008F21 90 9E            [ 2] 2671 	ldw x,(5,sp) ; expr1
      008F23 A4 80            [ 2] 2672 	ldw y,(3,sp) ; expr2
      008F25 2A 04 03         [ 4] 2673 	call multiply 
      008F28 01 90            [ 2] 2674 	ldw (5,sp),x  ;int32_t 15..0
      008F2A 50 03            [ 2] 2675 	ldw (3,sp),y  ;int32_t 31..16
      008F2B 85               [ 2] 2676 	popw x        ; expr3 
      008F2B CD 8E DB         [ 4] 2677 	call div32_16 ; int32_t/expr3 
      000F82                       2678 	_drop DBL_SIZE
      008F2E 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      008F30 27               [ 4] 2679 	ret 
                                   2680 
                                   2681 
                                   2682 ;----------------------------------
                                   2683 ; search in kword_dict name
                                   2684 ; from its execution address 
                                   2685 ; input:
                                   2686 ;   X       	cmd_index 
                                   2687 ; output:
                                   2688 ;   X 			cstr*  | 0 
                                   2689 ;--------------------------------
                           000001  2690 	CMDX=1 
                           000003  2691 	LINK=3 
                           000004  2692 	VSIZE=4
      000F85                       2693 cmd_name:
      000F85                       2694 	_vars VSIZE 
      008F31 03 CD            [ 2]    1     sub sp,#VSIZE 
      008F33 8F 62 00 0C      [ 1] 2695 	clr acc16 
      008F35 1F 01            [ 2] 2696 	ldw (CMDX,sp),x  
      008F35 5B 01 81         [ 2] 2697 	ldw x,#kword_dict	
      008F38 1F 03            [ 2] 2698 1$:	ldw (LINK,sp),x
      008F38 52 03            [ 1] 2699 	ld a,(2,x)
      008F3A 1F 01            [ 1] 2700 	and a,#15 
      008F3C 1E 08 16         [ 1] 2701 	ld acc8,a 
      008F3F 06 90 5D         [ 2] 2702 	addw x,#3
      008F42 26 06 16 01      [ 2] 2703 	addw x,acc16
      008F46 65               [ 2] 2704 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F47 5B 03            [ 2] 2705 	cpw x,(CMDX,sp)
      008F49 81 0A            [ 1] 2706 	jreq 2$
      008F4A 1E 03            [ 2] 2707 	ldw x,(LINK,sp)
      008F4A 51               [ 2] 2708 	ldw x,(x) 
      008F4B A6 11 6B         [ 2] 2709 	subw x,#2  
      008F4E 03 E3            [ 1] 2710 	jrne 1$
      008F4F 20 05            [ 2] 2711 	jra 9$
      008F4F 13 01            [ 2] 2712 2$: ldw x,(LINK,sp)
      008F51 2B 03 72         [ 2] 2713 	addw x,#2 	
      000FB4                       2714 9$:	_drop VSIZE
      008F54 F0 01            [ 2]    1     addw sp,#VSIZE 
      008F56 8C               [ 4] 2715 	ret
                                   2716 
                                   2717 
                                   2718 ;---------------------------------
                                   2719 ; dictionary search 
                                   2720 ; input:
                                   2721 ;	X 		dictionary entry point, name field  
                                   2722 ;   y		.asciz name to search 
                                   2723 ; output:
                                   2724 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2725 ;  X		cmd_index ; execution address | 0 
                                   2726 ;---------------------------------
                           000001  2727 	NLEN=1 ; cmd length 
                           000002  2728 	XSAVE=2
                           000004  2729 	YSAVE=4
                           000005  2730 	VSIZE=5 
      000FB7                       2731 search_dict:
      000FB7                       2732 	_vars VSIZE 
      008F57 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2733 
      008F59 59 0A            [ 2] 2734 	ldw (YSAVE,sp),y 
      000FBB                       2735 search_next:
      008F5B 03 26            [ 2] 2736 	ldw (XSAVE,sp),x 
                                   2737 ; get name length in dictionary	
      008F5D F1               [ 1] 2738 	ld a,(x)
      008F5E 51 5B            [ 1] 2739 	and a,#0xf 
      008F60 03 81            [ 1] 2740 	ld (NLEN,sp),a  
      008F62 16 04            [ 2] 2741 	ldw y,(YSAVE,sp) ; name pointer 
      008F62 53               [ 2] 2742 	incw x 
      000FC5                       2743 cp_loop:
      008F63 90 53            [ 1] 2744 	ld a,(y)
      008F65 1C 00            [ 1] 2745 	jreq str_match 
      008F67 01 24            [ 1] 2746 	tnz (NLEN,sp)
      008F69 02 90            [ 1] 2747 	jreq no_match  
      008F6B 5C               [ 1] 2748 	cp a,(x)
      008F6C 81 07            [ 1] 2749 	jrne no_match 
      008F6D 90 5C            [ 2] 2750 	incw y 
      008F6D 90               [ 2] 2751 	incw x
      008F6E 5F 9E            [ 1] 2752 	dec (NLEN,sp)
      008F70 A4 80            [ 2] 2753 	jra cp_loop 
      000FD7                       2754 no_match:
      008F72 27 02            [ 2] 2755 	ldw x,(XSAVE,sp) 
      008F74 90 53 81         [ 2] 2756 	subw x,#2 ; move X to link field
      008F77 4B 00            [ 1] 2757 	push #TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F77 52               [ 2] 2758 	ldw x,(x) ; next word link 
      008F78 08               [ 1] 2759 	pop a ; TK_NONE 
      008F79 0F 05            [ 1] 2760 	jreq search_exit  ; not found  
                                   2761 ;try next 
      008F7B 0F 06            [ 2] 2762 	jra search_next
      000FE4                       2763 str_match:
      008F7D 16 0B            [ 2] 2764 	ldw x,(XSAVE,sp)
      008F7F 17               [ 1] 2765 	ld a,(X)
      008F80 01 16            [ 1] 2766 	ld (NLEN,sp),a ; needed to test keyword type  
      008F82 0D 17            [ 1] 2767 	and a,#0xf 
                                   2768 ; move x to procedure address field 	
      008F84 03               [ 1] 2769 	inc a 
      008F85 5D 26 05         [ 1] 2770 	ld acc8,a 
      008F88 A6 04 CC 88      [ 1] 2771 	clr acc16 
      008F8C FD 9E A4 80      [ 2] 2772 	addw x,acc16 
      008F90 27               [ 2] 2773 	ldw x,(x) ; routine index  
                                   2774 ;determine keyword type bits 7:6 
      008F91 05 03            [ 1] 2775 	ld a,(NLEN,sp)
      008F93 05               [ 1] 2776 	swap a 
      008F94 03 06            [ 1] 2777 	and a,#0xc
      008F96 50               [ 1] 2778 	srl a
      008F97 1F               [ 1] 2779 	srl a 
      008F98 07 7B            [ 1] 2780 	add a,#128
      001001                       2781 search_exit: 
      001001                       2782 	_drop VSIZE 	 
      008F9A 01 A4            [ 2]    1     addw sp,#VSIZE 
      008F9C 80               [ 4] 2783 	ret 
                                   2784 
                                   2785 ;---------------------
                                   2786 ; check if next token
                                   2787 ;  is of expected type 
                                   2788 ; input:
                                   2789 ;   A 		 expected token attribute
                                   2790 ;  ouput:
                                   2791 ;   none     if fail call syntax_error 
                                   2792 ;--------------------
      001004                       2793 expect:
      008F9D 27               [ 1] 2794 	push a 
      008F9E 0D 03 06         [ 4] 2795 	call next_token 
      008FA1 1E 03            [ 1] 2796 	cp a,(1,sp)
      008FA3 16 01            [ 1] 2797 	jreq 1$
      008FA5 CD 8F 62         [ 2] 2798 	jp syntax_error
      008FA8 1F               [ 1] 2799 1$: pop a 
      008FA9 03               [ 4] 2800 	ret 
                                   2801 
                                   2802 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2803 ; parse arguments list 
                                   2804 ; between ()
                                   2805 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001011                       2806 func_args:
      008FAA 17 01            [ 1] 2807 	ld a,#TK_LPAREN 
      008FAC 1E 07 CD         [ 4] 2808 	call expect 
                                   2809 ; expected to continue in arg_list 
                                   2810 ; caller must check for TK_RPAREN 
                                   2811 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2812 ;-------------------------------
                                   2813 ; parse embedded BASIC routines 
                                   2814 ; arguments list.
                                   2815 ; arg_list::=  rel[','rel]*
                                   2816 ; all arguments are of integer type
                                   2817 ; and pushed on stack 
                                   2818 ; input:
                                   2819 ;   none
                                   2820 ; output:
                                   2821 ;   stack{n}   arguments pushed on stack
                                   2822 ;   A 	number of arguments pushed on stack  
                                   2823 ;--------------------------------
      001016                       2824 arg_list:
      008FAF 8F 38            [ 1] 2825 	push #0  
      008FB1 90 5D 27         [ 4] 2826 1$: call relation
      008FB4 11 7B            [ 1] 2827 	cp a,#TK_NONE 
      008FB6 06 18            [ 1] 2828 	jreq 5$
      008FB8 05 27            [ 1] 2829 	cp a,#TK_INTGR
      008FBA 0B 5C            [ 1] 2830 	jrne 4$
      001023                       2831 3$: 
                                   2832 ; swap return address with argument
      008FBC 90               [ 1] 2833 	pop a ; arg_count
      008FBD CF 00            [ 2] 2834 	popw y ; return address 
      008FBF 0D               [ 2] 2835 	pushw x ; new argument 
      008FC0 16 07            [ 2] 2836 	pushw y 
      008FC2 72               [ 1] 2837     inc a
      008FC3 B2               [ 1] 2838 	push a 
      008FC4 00 0D 7B         [ 4] 2839 	call next_token 
      008FC7 06 27            [ 1] 2840 	cp a,#TK_COMMA 
      008FC9 01 50            [ 1] 2841 	jreq 1$ 
      008FCB A1 00            [ 1] 2842 	cp a,#TK_NONE 
      008FCB 5B 08            [ 1] 2843 	jreq 5$ 
      008FCD 81 08            [ 1] 2844 4$:	cp a,#TK_RPAREN 
      008FCE 27 05            [ 1] 2845 	jreq 5$
      00103A                       2846 	_unget_token 
      008FCE 52 04 90 CF 00   [ 1]    1     mov in,in.saved
      008FD3 0D               [ 1] 2847 5$:	pop a  
      008FD4 CD               [ 4] 2848 	ret 
                                   2849 
                                   2850 ;--------------------------------
                                   2851 ;   BASIC commnands 
                                   2852 ;--------------------------------
                                   2853 
                                   2854 ;--------------------------------
                                   2855 ;  arithmetic and relational 
                                   2856 ;  routines
                                   2857 ;  operators precedence
                                   2858 ;  highest to lowest
                                   2859 ;  operators on same row have 
                                   2860 ;  same precedence and are executed
                                   2861 ;  from left to right.
                                   2862 ;	'*','/','%'
                                   2863 ;   '-','+'
                                   2864 ;   '=','>','<','>=','<=','<>','><'
                                   2865 ;   '<>' and '><' are equivalent for not equal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2866 ;--------------------------------
                                   2867 
                                   2868 ;---------------------
                                   2869 ; return array element
                                   2870 ; address from @(expr)
                                   2871 ; input:
                                   2872 ;   A 		TK_ARRAY
                                   2873 ; output:
                                   2874 ;   A 		TK_INTGR
                                   2875 ;	X 		element address 
                                   2876 ;----------------------
      001041                       2877 get_array_element:
      008FD5 8F 6D 1F         [ 4] 2878 	call func_args 
      008FD8 03 17            [ 1] 2879 	cp a,#1
      008FDA 01 CE            [ 1] 2880 	jreq 1$
      008FDC 00 0D CD         [ 2] 2881 	jp syntax_error
      008FDF 8F               [ 2] 2882 1$: popw x 
                                   2883 	; check for bounds 
      008FE0 77 5B 04         [ 2] 2884 	cpw x,array_size 
      008FE3 81 05            [ 2] 2885 	jrule 3$
                                   2886 ; bounds {1..array_size}	
      008FE4 A6 0A            [ 1] 2887 2$: ld a,#ERR_BAD_VALUE 
      008FE4 CD 8F CE         [ 2] 2888 	jp tb_error 
      008FE7 93               [ 2] 2889 3$: tnzw  x
      008FE8 81 F8            [ 1] 2890 	jreq 2$ 
      008FE9 58               [ 2] 2891 	sllw x 
      008FE9 CD               [ 2] 2892 	pushw x 
      008FEA 90 91 A1         [ 2] 2893 	ldw x,#tib
      008FED 03 27 03         [ 2] 2894 	subw x,(1,sp)
      001061                       2895 	_drop 2   
      008FF0 CC 88            [ 2]    1     addw sp,#2 
      008FF2 FB 84            [ 1] 2896 	ld a,#TK_INTGR
      008FF3 81               [ 4] 2897 	ret 
                                   2898 
                                   2899 
                                   2900 ;***********************************
                                   2901 ;   expression parse,execute 
                                   2902 ;***********************************
                                   2903 ;-----------------------------------
                                   2904 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2905 ;			 integer | function |
                                   2906 ;			 '('relation')' 
                                   2907 ; output:
                                   2908 ;   A    token attribute 
                                   2909 ;   X 	 integer
                                   2910 ; ---------------------------------
                           000001  2911 	NEG=1
                           000001  2912 	VSIZE=1
      001066                       2913 factor:
      001066                       2914 	_vars VSIZE 
      008FF3 1E 05            [ 2]    1     sub sp,#VSIZE 
      008FF5 16 03 CD         [ 4] 2915 	call next_token
      008FF8 8F 15            [ 1] 2916 	cp a,#CMD_END 
      008FFA 1F 05            [ 1] 2917 	jrult 20$
      008FFC 17 03            [ 1] 2918 1$:	ld (NEG,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FFE 85 CD            [ 1] 2919 	and a,#TK_GRP_MASK
      009000 8F 77            [ 1] 2920 	cp a,#TK_GRP_ADD 
      009002 5B 04            [ 1] 2921 	jreq 2$
      009004 81 01            [ 1] 2922 	ld a,(NEG,sp)
      009005 20 03            [ 2] 2923 	jra 4$  
      00107B                       2924 2$:	
      009005 52 04 72         [ 4] 2925 	call next_token 
      00107E                       2926 4$:	
      009008 5F 00            [ 1] 2927 	cp a,#TK_IFUNC 
      00900A 0D 1F            [ 1] 2928 	jrne 5$ 
      00900C 01               [ 4] 2929 	call (x) 
      00900D AE A7            [ 2] 2930 	jra 18$ 
      001085                       2931 5$:
      00900F 31 1F            [ 1] 2932 	cp a,#TK_INTGR
      009011 03 E6            [ 1] 2933 	jrne 6$
      009013 02 A4            [ 2] 2934 	jra 18$
      00108B                       2935 6$:
      009015 0F C7            [ 1] 2936 	cp a,#TK_ARRAY
      009017 00 0E            [ 1] 2937 	jrne 10$
      009019 1C 00 03         [ 4] 2938 	call get_array_element
      00901C 72               [ 2] 2939 	ldw x,(x)
      00901D BB 00            [ 2] 2940 	jra 18$ 
      001095                       2941 10$:
      00901F 0D FE            [ 1] 2942 	cp a,#TK_VAR 
      009021 13 01            [ 1] 2943 	jrne 12$
      009023 27               [ 2] 2944 	ldw x,(x)
      009024 0A 1E            [ 2] 2945 	jra 18$
      00109C                       2946 12$:			
      009026 03 FE            [ 1] 2947 	cp a,#TK_LPAREN
      009028 1D 00            [ 1] 2948 	jrne 16$
      00902A 02 26 E3         [ 4] 2949 	call relation
      00902D 20               [ 2] 2950 	pushw x 
      00902E 05 1E            [ 1] 2951 	ld a,#TK_RPAREN 
      009030 03 1C 00         [ 4] 2952 	call expect
      009033 02               [ 2] 2953 	popw x 
      009034 5B 04            [ 2] 2954 	jra 18$	
      0010AC                       2955 16$:
      0010AC                       2956 	_unget_token
      009036 81 00 02 00 01   [ 1]    1     mov in,in.saved
      009037 4F               [ 1] 2957 	clr a 
      009037 52 05            [ 2] 2958 	jra 20$ 
      0010B4                       2959 18$: 
      009039 17 04            [ 1] 2960 	ld a,#TK_MINUS 
      00903B 11 01            [ 1] 2961 	cp a,(NEG,sp)
      00903B 1F 02            [ 1] 2962 	jrne 19$
      00903D F6               [ 2] 2963 	negw x
      0010BB                       2964 19$:
      00903E A4 0F            [ 1] 2965 	ld a,#TK_INTGR
      0010BD                       2966 20$:
      0010BD                       2967 	_drop VSIZE
      009040 6B 01            [ 2]    1     addw sp,#VSIZE 
      009042 16               [ 4] 2968 	ret
                                   2969 
                                   2970 ;-----------------------------------
                                   2971 ; term ::= factor [['*'|'/'|'%'] factor]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2972 ; output:
                                   2973 ;   A    	token attribute 
                                   2974 ;	X		integer
                                   2975 ;-----------------------------------
                           000001  2976 	N1=1   ; int16_t
                           000003  2977 	MULOP=3
                           000003  2978 	VSIZE=3
      0010C0                       2979 term:
      0010C0                       2980 	_vars VSIZE
      009043 04 5C            [ 2]    1     sub sp,#VSIZE 
      009045 CD 10 66         [ 4] 2981 	call factor
      009045 90 F6            [ 1] 2982 	cp a,#CMD_END
      009047 27 1B            [ 1] 2983 	jrult term_exit
      0010C9                       2984 term01:	 ; check for  operator 
      009049 0D 01            [ 2] 2985 	ldw (N1,sp),x  ; save first factor 
      00904B 27 0A F1         [ 4] 2986 	call next_token
      00904E 26 07            [ 1] 2987 	cp a,#CMD_END
      009050 90 5C            [ 1] 2988 	jrult 9$
      009052 5C 0A            [ 1] 2989 0$:	ld (MULOP,sp),a
      009054 01 20            [ 1] 2990 	and a,#TK_GRP_MASK
      009056 EE 20            [ 1] 2991 	cp a,#TK_GRP_MULT
      009057 27 07            [ 1] 2992 	jreq 1$
      0010DA                       2993 	_unget_token 
      009057 1E 02 1D 00 02   [ 1]    1     mov in,in.saved
      00905C 4B 00            [ 2] 2994 	jra 9$
      0010E1                       2995 1$:	; got *|/|%
      00905E FE 84 27         [ 4] 2996 	call factor
      009061 1F 20            [ 1] 2997 	cp a,#TK_INTGR
      009063 D7 03            [ 1] 2998 	jreq 2$ 
      009064 CC 08 7B         [ 2] 2999 	jp syntax_error
      009064 1E 02            [ 1] 3000 2$:	ldw y,x 
      009066 F6 6B            [ 2] 3001 	ldw x,(N1,sp)
      009068 01 A4            [ 1] 3002 	ld a,(MULOP,sp) 
      00906A 0F 4C            [ 1] 3003 	cp a,#TK_MULT 
      00906C C7 00            [ 1] 3004 	jrne 3$
      00906E 0E 72 5F         [ 4] 3005 	call multiply 
      009071 00 0D            [ 2] 3006 	jra term01
      009073 72 BB            [ 1] 3007 3$: cp a,#TK_DIV 
      009075 00 0D            [ 1] 3008 	jrne 4$ 
      009077 FE 7B 01         [ 4] 3009 	call divide 
      00907A 4E A4            [ 2] 3010 	jra term01 
      00907C 0C 44 44         [ 4] 3011 4$: call modulo
      00907F AB 80            [ 2] 3012 	jra term01 
      009081 1E 01            [ 2] 3013 9$: ldw x,(N1,sp)
      009081 5B 05            [ 1] 3014 	ld a,#TK_INTGR 	
      00110C                       3015 term_exit:
      00110C                       3016 	_drop VSIZE 
      009083 81 03            [ 2]    1     addw sp,#VSIZE 
      009084 81               [ 4] 3017 	ret 
                                   3018 
                                   3019 ;-------------------------------
                                   3020 ;  expr ::= term [['+'|'-'] term]*
                                   3021 ;  result range {-32768..32767}
                                   3022 ;  output:
                                   3023 ;   A    token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3024 ;   X	 integer   
                                   3025 ;-------------------------------
                           000001  3026 	N1=1 
                           000003  3027 	OP=3 
                           000003  3028 	VSIZE=3 
      00110F                       3029 expression:
      00110F                       3030 	_vars VSIZE 
      009084 88 CD            [ 2]    1     sub sp,#VSIZE 
      009086 89 ED 11         [ 4] 3031 	call term
      009089 01 27            [ 1] 3032 	cp a,#CMD_END 
      00908B 03 CC            [ 1] 3033 	jrult expr_exit 
      00908D 88 FB            [ 2] 3034 0$:	ldw (N1,sp),x 
      00908F 84 81 6D         [ 4] 3035 	call next_token
      009091 A1 02            [ 1] 3036 	cp a,#CMD_END 
      009091 A6 07            [ 1] 3037 	jrult 9$ 
      009093 CD 90            [ 1] 3038 1$:	ld (OP,sp),a  
      009095 84 30            [ 1] 3039 	and a,#TK_GRP_MASK
      009096 A1 10            [ 1] 3040 	cp a,#TK_GRP_ADD 
      009096 4B 00            [ 1] 3041 	jreq 2$ 
      001129                       3042 	_unget_token
      009098 CD 91 D8 A1 00   [ 1]    1     mov in,in.saved
      00909D 27 20            [ 2] 3043 	jra 9$
      001130                       3044 2$: 
      00909F A1 84 26         [ 4] 3045 	call term
      0090A2 13 84            [ 1] 3046 	cp a,#TK_INTGR 
      0090A3 27 03            [ 1] 3047 	jreq 3$
      0090A3 84 90 85         [ 2] 3048 	jp syntax_error
      0090A6 89 90 89         [ 2] 3049 3$:	ldw acc16,x 
      0090A9 4C 88            [ 2] 3050 	ldw x,(N1,sp)
      0090AB CD 89            [ 1] 3051 	ld a,(OP,sp)
      0090AD ED A1            [ 1] 3052 	cp a,#TK_PLUS 
      0090AF 09 27            [ 1] 3053 	jrne 4$
      0090B1 E6 A1 00 27      [ 2] 3054 	addw x,acc16
      0090B5 09 A1            [ 2] 3055 	jra 0$ 
      0090B7 08 27 05 55      [ 2] 3056 4$:	subw x,acc16
      0090BB 00 03            [ 2] 3057 	jra 0$
      0090BD 00 02            [ 2] 3058 9$: ldw x,(N1,sp)
      0090BF 84 81            [ 1] 3059 	ld a,#TK_INTGR	
      0090C1                       3060 expr_exit:
      001155                       3061 	_drop VSIZE 
      0090C1 CD 90            [ 2]    1     addw sp,#VSIZE 
      0090C3 91               [ 4] 3062 	ret 
                                   3063 
                                   3064 ;---------------------------------------------
                                   3065 ; rel ::= expr rel_op expr
                                   3066 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3067 ;  relation return  integer , zero is false 
                                   3068 ;  output:
                                   3069 ;    A 		token attribute  
                                   3070 ;	 X		integer 
                                   3071 ;---------------------------------------------
                           000001  3072 	N1=1
                           000003  3073 	RELOP=3
                           000003  3074 	VSIZE=3 
      001158                       3075 relation: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      001158                       3076 	_vars VSIZE
      0090C4 A1 01            [ 2]    1     sub sp,#VSIZE 
      0090C6 27 03 CC         [ 4] 3077 	call expression
      0090C9 88 FB            [ 1] 3078 	cp a,#CMD_END  
      0090CB 85 C3            [ 1] 3079 	jrult rel_exit 
                                   3080 	; expect rel_op or leave 
      0090CD 00 22            [ 2] 3081 	ldw (N1,sp),x 
      0090CF 23 05 A6         [ 4] 3082 	call next_token 
      0090D2 0A CC            [ 1] 3083 	cp a,#CMD_END 
      0090D4 88 FD            [ 1] 3084 	jrult 9$
      00116A                       3085 1$:	
      0090D6 5D 27            [ 1] 3086 	ld (RELOP,sp),a 
      0090D8 F8 58            [ 1] 3087 	and a,#TK_GRP_MASK
      0090DA 89 AE            [ 1] 3088 	cp a,#TK_GRP_RELOP 
      0090DC 16 90            [ 1] 3089 	jreq 2$
      001172                       3090 	_unget_token  
      0090DE 72 F0 01 5B 02   [ 1]    1     mov in,in.saved
      0090E3 A6 84            [ 2] 3091 	jra 9$
      001179                       3092 2$:	; expect another expression or error 
      0090E5 81 11 0F         [ 4] 3093 	call expression
      0090E6 A1 84            [ 1] 3094 	cp a,#TK_INTGR 
      0090E6 52 01            [ 1] 3095 	jreq 3$
      0090E8 CD 89 ED         [ 2] 3096 	jp syntax_error 
      0090EB A1 02 25         [ 2] 3097 3$:	ldw acc16,x 
      0090EE 4E 6B            [ 2] 3098 	ldw x,(N1,sp) 
      0090F0 01 A4 30 A1      [ 2] 3099 	subw x,acc16
      0090F4 10 27            [ 1] 3100 	jrne 4$
      0090F6 04 7B 01 20      [ 1] 3101 	mov acc8,#2 ; n1==n2
      0090FA 03 0C            [ 2] 3102 	jra 6$ 
      0090FB                       3103 4$: 
      0090FB CD 89            [ 1] 3104 	jrsgt 5$  
      0090FD ED 04 00 0D      [ 1] 3105 	mov acc8,#4 ; n1<2 
      0090FE 20 04            [ 2] 3106 	jra 6$
      00119C                       3107 5$:
      0090FE A1 81 26 03      [ 1] 3108 	mov acc8,#1 ; n1>n2 
      0011A0                       3109 6$:
      009102 FD               [ 1] 3110 	clrw x 
      009103 20 2F 0D         [ 1] 3111 	ld a, acc8  
      009105 14 03            [ 1] 3112 	and a,(RELOP,sp)
      009105 A1               [ 1] 3113 	tnz a 
      009106 84 26            [ 1] 3114 	jreq 10$
      009108 02               [ 2] 3115 	incw x 
      0011AA                       3116 7$:	 
      009109 20 29            [ 2] 3117 	jra 10$  	
      00910B 1E 01            [ 2] 3118 9$: ldw x,(N1,sp)
      0011AE                       3119 10$:
      00910B A1 06            [ 1] 3120 	ld a,#TK_INTGR
      0011B0                       3121 rel_exit: 	 
      0011B0                       3122 	_drop VSIZE
      00910D 26 06            [ 2]    1     addw sp,#VSIZE 
      00910F CD               [ 4] 3123 	ret 
                                   3124 
                                   3125 ;--------------------------------
                                   3126 ; BASIC: SHOW 
                                   3127 ; print stack content in hexadecimal bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3128 ; 16 bytes per row 
                                   3129 ;--------------------------------
      0011B3                       3130 show:
      009110 90 C1 FE         [ 2] 3131 	ldw x,#cstk_prompt
      009113 20 1F 00         [ 4] 3132 	call puts 
      009115 96               [ 1] 3133 	ldw x,sp 
      009115 A1 85 26         [ 2] 3134 	addw x,#3 ; ignore return address
      009118 03 FE 20 18      [ 2] 3135 	ldw y,#RAM_SIZE  
      00911C CF 00 0C         [ 2] 3136 	ldw acc16,x 
      00911C A1 07 26 0C      [ 2] 3137 	subw y,acc16
      009120 CD 91 D8         [ 4] 3138 	call hex_dump
      009123 89               [ 1] 3139 	clr a 
      009124 A6               [ 4] 3140 	ret
                                   3141 
      009125 08 CD 90 84 85 20 08  3142 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3143 
                                   3144 
                                   3145 ;--------------------------------------------
                                   3146 ; BASIC: HEX 
                                   3147 ; select hexadecimal base for integer print
                                   3148 ;---------------------------------------------
      00912C                       3149 hex_base:
      00912C 55 00 03 00      [ 1] 3150 	mov base,#16 
      009130 02               [ 4] 3151 	ret 
                                   3152 
                                   3153 ;--------------------------------------------
                                   3154 ; BASIC: DEC 
                                   3155 ; select decimal base for integer print
                                   3156 ;---------------------------------------------
      0011F9                       3157 dec_base:
      009131 4F 20 09 0A      [ 1] 3158 	mov base,#10
      009134 81               [ 4] 3159 	ret 
                                   3160 
                                   3161 ;------------------------
                                   3162 ; BASIC: SIZE 
                                   3163 ; return free size in text area
                                   3164 ; output:
                                   3165 ;   A 		TK_INTGR
                                   3166 ;   X 	    size integer
                                   3167 ;--------------------------
      0011FE                       3168 size:
      009134 A6 11 11         [ 2] 3169 	ldw x,#tib 
      009137 01 26 01 50      [ 2] 3170 	subw x,txtend 
      00913B A6 84            [ 1] 3171 	ld a,#TK_INTGR
      00913B A6               [ 4] 3172 	ret 
                                   3173 
                                   3174 
                                   3175 ;------------------------
                                   3176 ; BASIC: UBOUND  
                                   3177 ; return array variable size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3178 ; output:
                                   3179 ;   A 		TK_INTGR
                                   3180 ;   X 	    array size 
                                   3181 ;--------------------------
      001208                       3182 ubound:
      00913C 84 16 90         [ 2] 3183 	ldw x,#tib
      00913D 72 B0 00 1E      [ 2] 3184 	subw x,txtend 
      00913D 5B 01 81 04      [ 2] 3185 	ldw y,basicptr 
      009140 90 C3 00 1E      [ 2] 3186 	cpw y,txtend 
      009140 52 03            [ 1] 3187 	jrult 1$
      009142 CD 90 E6         [ 1] 3188 	push count 
      009145 A1 02            [ 1] 3189 	push #0 
      009147 25 43 01         [ 2] 3190 	subw x,(1,sp)
      009149                       3191 	_drop 2 
      009149 1F 01            [ 2]    1     addw sp,#2 
      00914B CD               [ 2] 3192 1$:	srlw x 
      00914C 89 ED A1         [ 2] 3193 	ldw array_size,x
      00914F 02 25            [ 1] 3194 	ld a,#TK_INTGR
      009151 36               [ 4] 3195 	ret 
                                   3196 
                                   3197 ;-----------------------------
                                   3198 ; BASIC: LET var=expr 
                                   3199 ; variable assignement 
                                   3200 ; output:
                                   3201 ;   A 		TK_NONE 
                                   3202 ;-----------------------------
      00122A                       3203 let:
      009152 6B 03 A4         [ 4] 3204 	call next_token 
      009155 30 A1            [ 1] 3205 	cp a,#TK_VAR 
      009157 20 27            [ 1] 3206 	jreq let_var
      009159 07 55            [ 1] 3207 	cp a,#TK_ARRAY 
      00915B 00 03            [ 1] 3208 	jreq  let_array
      00915D 00 02 20         [ 2] 3209 	jp syntax_error
      001238                       3210 let_array:
      009160 27 10 41         [ 4] 3211 	call get_array_element
      009161                       3212 let_var:
      009161 CD               [ 2] 3213 	pushw x  
      009162 90 E6 A1         [ 4] 3214 	call next_token 
      009165 84 27            [ 1] 3215 	cp a,#TK_EQUAL
      009167 03 CC            [ 1] 3216 	jreq 1$
      009169 88 FB 90         [ 2] 3217 	jp syntax_error
      001246                       3218 1$:	
      00916C 93 1E 01         [ 4] 3219 	call relation   
      00916F 7B 03            [ 1] 3220 	cp a,#TK_INTGR 
      009171 A1 20            [ 1] 3221 	jreq 2$
      009173 26 05 CD         [ 2] 3222 	jp syntax_error
      001250                       3223 2$:	
      009176 8F 15            [ 1] 3224 	ldw y,x 
      009178 20               [ 2] 3225 	popw x   
      009179 CF               [ 2] 3226 	ldw (x),y   
      00917A A1               [ 4] 3227 	ret 
                                   3228 
                                   3229 ;----------------------------
                                   3230 ; BASIC: LIST [[start][,end]]
                                   3231 ; list program lines 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3232 ; form start to end 
                                   3233 ; if empty argument list then 
                                   3234 ; list all.
                                   3235 ;----------------------------
                           000001  3236 	FIRST=1
                           000003  3237 	LAST=3 
                           000005  3238 	LN_PTR=5
                           000006  3239 	VSIZE=6 
      001255                       3240 list:
      00917B 21 26 05         [ 2] 3241 	ldw x,txtbgn 
      00917E CD 8F CE         [ 2] 3242 	cpw x,txtend 
      009181 20 C6            [ 1] 3243 	jrmi 1$
      009183 CD               [ 4] 3244 	ret 
      00125E                       3245 1$:	
      00125E                       3246 	_vars VSIZE
      009184 8F E4            [ 2]    1     sub sp,#VSIZE 
      009186 20 C1            [ 2] 3247 	ldw (LN_PTR,sp),x 
      009188 1E               [ 2] 3248 	ldw x,(x) 
      009189 01 A6            [ 2] 3249 	ldw (FIRST,sp),x ; list from first line 
      00918B 84 7F FF         [ 2] 3250 	ldw x,#MAX_LINENO ; biggest line number 
      00918C 1F 03            [ 2] 3251 	ldw (LAST,sp),x 
      00918C 5B 03 81         [ 4] 3252 	call arg_list
      00918F 4D               [ 1] 3253 	tnz a
      00918F 52 03            [ 1] 3254 	jreq list_loop 
      009191 CD 91            [ 1] 3255 	cp a,#2 
      009193 40 A1            [ 1] 3256 	jreq 4$
      009195 02 25            [ 1] 3257 	cp a,#1 
      009197 3D 1F            [ 1] 3258 	jreq first_line 
      009199 01 CD 89         [ 2] 3259 	jp syntax_error 
      00919C ED               [ 2] 3260 4$:	popw x 
      00919D A1 02            [ 2] 3261 	ldw (LAST+2,sp),x 
      00127E                       3262 first_line:
      00919F 25               [ 2] 3263 	popw x
      0091A0 30 6B            [ 2] 3264 	ldw (FIRST,sp),x 
      001281                       3265 lines_skip:
      0091A2 03 A4 30         [ 2] 3266 	ldw x,txtbgn
      0091A5 A1 10            [ 2] 3267 2$:	ldw (LN_PTR,sp),x 
      0091A7 27 07 55         [ 2] 3268 	cpw x,txtend 
      0091AA 00 03            [ 1] 3269 	jrpl list_exit 
      0091AC 00               [ 2] 3270 	ldw x,(x) ;line# 
      0091AD 02 20            [ 2] 3271 	cpw x,(FIRST,sp)
      0091AF 21 11            [ 1] 3272 	jrpl list_loop 
      0091B0 1E 05            [ 2] 3273 	ldw x,(LN_PTR,sp) 
      0091B0 CD 91            [ 1] 3274 	ld a,(2,x)
      0091B2 40 A1 84         [ 1] 3275 	ld acc8,a 
      0091B5 27 03 CC 88      [ 1] 3276 	clr acc16 
      0091B9 FB CF 00 0D      [ 2] 3277 	addw x,acc16
      0091BD 1E 01            [ 2] 3278 	jra 2$ 
                                   3279 ; print loop
      0012A1                       3280 list_loop:
      0091BF 7B 03            [ 2] 3281 	ldw x,(LN_PTR,sp)
      0091C1 A1 10            [ 1] 3282 	ld a,(2,x) 
      0091C3 26 06 72         [ 4] 3283 	call prt_basic_line
      0091C6 BB 00            [ 2] 3284 	ldw x,(LN_PTR,sp)
      0091C8 0D 20            [ 1] 3285 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091CA CD 72 B0         [ 1] 3286 	ld acc8,a 
      0091CD 00 0D 20 C7      [ 1] 3287 	clr acc16 
      0091D1 1E 01 A6 84      [ 2] 3288 	addw x,acc16
      0091D5 C3 00 1E         [ 2] 3289 	cpw x,txtend 
      0091D5 5B 03            [ 1] 3290 	jrpl list_exit
      0091D7 81 05            [ 2] 3291 	ldw (LN_PTR,sp),x
      0091D8 FE               [ 2] 3292 	ldw x,(x)
      0091D8 52 03            [ 2] 3293 	cpw x,(LAST,sp)  
      0091DA CD 91            [ 1] 3294 	jrslt list_loop
      0012C3                       3295 list_exit:
      0091DC 8F A1 02 25 4F   [ 1] 3296 	mov in,count 
      0091E1 1F 01 CD         [ 2] 3297 	ldw x,#pad 
      0091E4 89 ED A1         [ 2] 3298 	ldw basicptr,x 
      0012CE                       3299 	_drop VSIZE 
      0091E7 02 25            [ 2]    1     addw sp,#VSIZE 
      0091E9 42               [ 4] 3300 	ret
                                   3301 
                                   3302 ;-------------------------
                                   3303 ; copy command name to buffer  
                                   3304 ; input:
                                   3305 ;   X 	name address 
                                   3306 ;   Y   destination buffer 
                                   3307 ; output:
                                   3308 ;   Y   point after name  
                                   3309 ;--------------------------
      0091EA                       3310 cpy_cmd_name:
      0091EA 6B               [ 1] 3311 	ld a,(x)
      0091EB 03               [ 2] 3312 	incw x
      0091EC A4 30            [ 1] 3313 	and a,#15  
      0091EE A1               [ 1] 3314 	push a 
      0091EF 30 27            [ 1] 3315     tnz (1,sp) 
      0091F1 07 55            [ 1] 3316 	jreq 9$
      0091F3 00               [ 1] 3317 1$:	ld a,(x)
      0091F4 03 00            [ 1] 3318 	ld (y),a  
      0091F6 02               [ 2] 3319 	incw x
      0091F7 20 33            [ 2] 3320 	incw y 
      0091F9 0A 01            [ 1] 3321 	dec (1,sp)	 
      0091F9 CD 91            [ 1] 3322 	jrne 1$
      0091FB 8F               [ 1] 3323 9$: pop a 
      0091FC A1               [ 4] 3324 	ret	
                                   3325 
                                   3326 ;--------------------------
                                   3327 ; add a space after letter or 
                                   3328 ; digit.
                                   3329 ; input:
                                   3330 ;   Y     pointer to buffer 
                                   3331 ; output:
                                   3332 ;   Y    moved to end 
                                   3333 ;--------------------------
      0012E6                       3334 add_space:
      0091FD 84 27            [ 2] 3335 	decw y 
      0091FF 03 CC            [ 1] 3336 	ld a,(y)
      009201 88 FB            [ 2] 3337 	incw y
      009203 CF 00 0D         [ 4] 3338 	call is_alnum 
      009206 1E 01            [ 1] 3339 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009208 72 B0            [ 1] 3340 	ld a,#SPACE 
      00920A 00 0D            [ 1] 3341 	ld (y),a 
      00920C 26 06            [ 2] 3342 	incw y 
      00920E 35               [ 4] 3343 1$: ret 
                                   3344 
                                   3345 ;--------------------------
                                   3346 ;  align text in buffer 
                                   3347 ;  to tab_width padding 
                                   3348 ;  left with  SPACE 
                                   3349 ; input:
                                   3350 ;   X      str*
                                   3351 ;   A      str_length 
                                   3352 ; output:
                                   3353 ;   X      ajusted
                                   3354 ;--------------------------
      0012F8                       3355 right_align:
      00920F 02               [ 1] 3356 	push a 
      009210 00 0E            [ 1] 3357 0$: ld a,(1,sp)
      009212 20 0C 24         [ 1] 3358 	cp a,tab_width 
      009214 2A 08            [ 1] 3359 	jrpl 1$
      009214 2C 06            [ 1] 3360 	ld a,#SPACE 
      009216 35               [ 2] 3361 	decw x
      009217 04               [ 1] 3362 	ld (x),a  
      009218 00 0E            [ 1] 3363 	inc (1,sp)
      00921A 20 04            [ 2] 3364 	jra 0$ 
      00921C 84               [ 1] 3365 1$: pop a 	
      00921C 35               [ 4] 3366 	ret 
                                   3367 
                                   3368 ;--------------------------
                                   3369 ; print TK_QSTR
                                   3370 ; converting control character
                                   3371 ; to backslash sequence
                                   3372 ; input:
                                   3373 ;   X        char *
                                   3374 ;   Y        dest. buffer 
                                   3375 ; output:
                                   3376 ;   X        moved forward 
                                   3377 ;   Y        moved forward 
                                   3378 ;-----------------------------
      00130A                       3379 cpy_quote:
      00921D 01 00            [ 1] 3380 	ld a,#'"
      00921F 0E F7            [ 1] 3381 	ld (y),a 
      009220 90 5C            [ 2] 3382 	incw y 
      009220 5F               [ 1] 3383 1$:	ld a,(x)
      009221 C6 00            [ 1] 3384 	jreq 9$
      009223 0E               [ 2] 3385 	incw x 
      009224 14 03            [ 1] 3386 	cp a,#SPACE 
      009226 4D 27            [ 1] 3387 	jrult 3$
      009228 05 5C            [ 1] 3388 	ld (y),a
      00922A 90 5C            [ 2] 3389 	incw y 
      00922A 20 02            [ 1] 3390 	cp a,#'\ 
      00922C 1E 01            [ 1] 3391 	jrne 1$ 
      00922E                       3392 2$:
      00922E A6 84            [ 1] 3393 	ld (y),a
      009230 90 5C            [ 2] 3394 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009230 5B 03            [ 2] 3395 	jra 1$
      009232 81               [ 1] 3396 3$: push a 
      009233 A6 5C            [ 1] 3397 	ld a,#'\
      009233 AE 92            [ 1] 3398 	ld (y),a 
      009235 4D CD            [ 2] 3399 	incw y  
      009237 A8               [ 1] 3400 	pop a 
      009238 C0 96            [ 1] 3401 	sub a,#7
      00923A 1C 00 03         [ 1] 3402 	ld acc8,a 
      00923D 90 AE 18 00      [ 1] 3403 	clr acc16
      009241 CF               [ 2] 3404 	pushw x
      009242 00 0D 72         [ 2] 3405 	ldw x,#escaped 
      009245 B2 00 0D CD      [ 2] 3406 	addw x,acc16 
      009249 83               [ 1] 3407 	ld a,(x)
      00924A D9               [ 2] 3408 	popw x
      00924B 4F 81            [ 2] 3409 	jra 2$
      00924D 0A 63            [ 1] 3410 9$: ld a,#'"
      00924F 6F 6E            [ 1] 3411 	ld (y),a 
      009251 74 65            [ 2] 3412 	incw y  
      009253 6E               [ 2] 3413 	incw x 
      009254 74               [ 4] 3414 	ret
                                   3415 
                                   3416 ;--------------------------
                                   3417 ; return variable name 
                                   3418 ; from its address.
                                   3419 ; input:
                                   3420 ;   X    variable address
                                   3421 ; output:
                                   3422 ;   A     variable letter
                                   3423 ;--------------------------
      00134B                       3424 var_name:
      009255 20 6F 66         [ 2] 3425 		subw x,#vars 
      009258 20               [ 1] 3426 		ld a,xl 
      009259 73               [ 1] 3427 		srl a 
      00925A 74 61            [ 1] 3428 		add a,#'A 
      00925C 63               [ 4] 3429 		ret 
                                   3430 
                                   3431 ;-----------------------------
                                   3432 ; return cmd  idx from its 
                                   3433 ; code address 
                                   3434 ; input:
                                   3435 ;   X      code address 
                                   3436 ; output:
                                   3437 ;   X      cmd_idx
                                   3438 ;-----------------------------
      001353                       3439 get_cmd_idx:
      00925D 6B 20            [ 2] 3440 	pushw y
      00925F 66 72 6F 6D      [ 2] 3441 	ldw y,#code_addr 
      009263 20 74 6F 70      [ 2] 3442 	ldw ptr16,y 
      009267 20 74            [ 1] 3443 	clrw y 
      009269 6F 20 62         [ 5] 3444 1$:	cpw x,([ptr16],y)
      00926C 6F 74            [ 1] 3445 	jreq 3$ 
      00926E 74 6F            [ 2] 3446 	incw y 
      009270 6D 3A 0A         [ 4] 3447 	ld a,([ptr16],y)
      009273 00 5C            [ 2] 3448 	incw y
      009274 91 DA 17         [ 4] 3449 	or a,([ptr16],y)	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009274 35 10            [ 1] 3450 	jrne 1$
      009276 00               [ 1] 3451 3$: ldw x,y 
      009277 0B 81            [ 2] 3452 	popw y 
      009279 81               [ 4] 3453 	ret
                                   3454 
                                   3455 ;-------------------------------------
                                   3456 ; decompile tokens list 
                                   3457 ; to original text line 
                                   3458 ; input:
                                   3459 ;   [basicptr]  pointer at line 
                                   3460 ;   Y           destination buffer
                                   3461 ; output:
                                   3462 ;   A           length 
                                   3463 ;   Y           after string  
                                   3464 ;------------------------------------
                           000001  3465 	BASE_SAV=1
                           000002  3466 	WIDTH_SAV=2
                           000003  3467 	STR=3
                           000004  3468 	VSIZE=4 
      001374                       3469 decompile::
      001374                       3470 	_vars VSIZE
      009279 35 0A            [ 2]    1     sub sp,#VSIZE 
      00927B 00 0B 81         [ 1] 3471 	ld a,base
      00927E 6B 01            [ 1] 3472 	ld (BASE_SAV,sp),a  
      00927E AE 16 90         [ 1] 3473 	ld a,tab_width 
      009281 72 B0            [ 1] 3474 	ld (WIDTH_SAV,sp),a 
      009283 00 1F            [ 2] 3475 	ldw (STR,sp),y   
      009285 A6 84 81 04      [ 5] 3476 	ldw x,[basicptr] ; line number 
      009288 35 0A 00 0A      [ 1] 3477 	mov base,#10
      009288 AE 16 90 72      [ 1] 3478 	mov tab_width,#5
      00928C B0 00 1F 90      [ 1] 3479 	clr acc24 
      009290 CE 00 05         [ 2] 3480 	ldw acc16,x
      009293 90 C3 00         [ 4] 3481 	call itoa  
      009296 1F 25 0A         [ 4] 3482 	call right_align 
      009299 3B               [ 1] 3483 	push a 
      00929A 00 04            [ 1] 3484 1$:	ldw y,x ; source
      00929C 4B 00            [ 2] 3485 	ldw x,(STR+1,sp) ; destination
      00929E 72 F0 01         [ 4] 3486 	call strcpy 
      0092A1 5B 02            [ 1] 3487 	clrw y 
      0092A3 54               [ 1] 3488 	pop a 
      0092A4 CF 00            [ 1] 3489 	ld yl,a 
      0092A6 22 A6 84         [ 2] 3490 	addw y,(STR,sp)
      0092A9 81 20            [ 1] 3491 	ld a,#SPACE 
      0092AA 90 F7            [ 1] 3492 	ld (y),a 
      0092AA CD 89            [ 2] 3493 	incw y 
      0092AC ED A1 85 27      [ 1] 3494 	clr tab_width
      0092B0 0A A1 06         [ 2] 3495 	ldw x,#3
      0092B3 27 03 CC         [ 2] 3496 	ldw in.w,x 
      0013BB                       3497 decomp_loop:
      0092B6 88 FB            [ 2] 3498 	pushw y
      0092B8 CD 09 6D         [ 4] 3499 	call next_token 
      0092B8 CD 90            [ 2] 3500 	popw y 
      0092BA C1               [ 1] 3501 	tnz a  
      0092BB 26 03            [ 1] 3502 	jrne 1$
      0092BB 89 CD 89         [ 2] 3503 	jp 20$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092BE ED A1            [ 1] 3504 1$:	jrpl 6$
                                   3505 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      0092C0 32 27            [ 1] 3506 	cp a,#TK_VAR 
      0092C2 03 CC            [ 1] 3507 	jrne 3$
                                   3508 ;; TK_VAR 
      0092C4 88 FB E6         [ 4] 3509 	call add_space  
      0092C6 CD 13 4B         [ 4] 3510 	call var_name
      0092C6 CD 91            [ 1] 3511 	ld (y),a 
      0092C8 D8 A1            [ 2] 3512 	incw y  
      0092CA 84 27            [ 2] 3513 	jra decomp_loop
      0013DA                       3514 3$:
      0092CC 03 CC            [ 1] 3515 	cp a,#TK_INTGR
      0092CE 88 FB            [ 1] 3516 	jrne 4$
                                   3517 ;; TK_INTGR
      0092D0 CD 12 E6         [ 4] 3518 	call add_space
      0092D0 90 93 85 FF      [ 1] 3519 	clr acc24 
      0092D4 81 00 0C         [ 2] 3520 	ldw acc16,x 
      0092D5 90 89            [ 2] 3521 	pushw y 
      0092D5 CE 00 1D         [ 4] 3522 	call itoa  
      0092D8 C3 00            [ 2] 3523 	ldw y,(1,sp) 
      0092DA 1F               [ 1] 3524 	push a 
      0092DB 2B               [ 1] 3525 	exgw x,y 
      0092DC 01 81 B4         [ 4] 3526 	call strcpy 
      0092DE 90 5F            [ 1] 3527 	clrw y
      0092DE 52               [ 1] 3528 	pop a  
      0092DF 06 1F            [ 1] 3529 	ld yl,a 
      0092E1 05 FE 1F         [ 2] 3530 	addw y,(1,sp)
      0013FC                       3531 	_drop 2 
      0092E4 01 AE            [ 2]    1     addw sp,#2 
      0092E6 7F FF            [ 2] 3532 	jra decomp_loop
                                   3533 ;; dictionary keyword 
      001400                       3534 4$:	
      0092E8 1F 03 CD         [ 4] 3535 	call get_cmd_idx 
      0092EB 90 96 4D         [ 2] 3536 	cpw x,#REM_IDX
      0092EE 27 31            [ 1] 3537 	jrne 5$
      0092F0 A1 02 27         [ 2] 3538 	ldw x,basicptr 
                                   3539 ; copy comment to buffer 
      0092F3 07 A1 01         [ 4] 3540 	call add_space
      0092F6 27 06            [ 1] 3541 	ld a,#''
      0092F8 CC 88            [ 1] 3542 	ld (y),a 
      0092FA FB 85            [ 2] 3543 	incw y 
      001414                       3544 41$:
      0092FC 1F 05 00 00      [ 4] 3545 	ld a,([in.w],x)
      0092FE 72 5C 00 01      [ 1] 3546 	inc in  
      0092FE 85 1F            [ 1] 3547 	ld (y),a 
      009300 01 5C            [ 2] 3548 	incw y 
      009301 C6 00 01         [ 1] 3549 	ld a,in 
      009301 CE 00 1D         [ 1] 3550 	cp a,count 
      009304 1F 05            [ 1] 3551 	jrmi 41$
      009306 C3 00            [ 2] 3552 	jra 20$  
                                   3553 ; insert command name 
      00142A                       3554 5$:
      009308 1F 2A 38         [ 4] 3555 	call add_space  
      00930B FE 13            [ 2] 3556 	pushw y
      00930D 01 2A 11         [ 4] 3557 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009310 1E 05            [ 2] 3558 	popw y 
      009312 E6 02 C7         [ 4] 3559 	call cpy_cmd_name
      009315 00 0E            [ 2] 3560 	jra decomp_loop 
      001439                       3561 6$:
      009317 72 5F            [ 1] 3562 	cp a,#TK_QSTR 
      009319 00 0D            [ 1] 3563 	jrne 7$
                                   3564 ;; TK_QSTR
      00931B 72 BB 00         [ 4] 3565 	call cpy_quote  
      00931E 0D 20 E3         [ 2] 3566 	jp decomp_loop
      009321                       3567 7$:
      009321 1E 05            [ 1] 3568 	cp a,#TK_CHAR 
      009323 E6 02            [ 1] 3569 	jrne 8$
                                   3570 ;; TK_CHAR 
      009325 CD 95            [ 1] 3571 	ld a,#'\ 
      009327 5C 1E            [ 1] 3572 	ld (y),a 
      009329 05 E6            [ 2] 3573 	incw y 
      00932B 02               [ 1] 3574 	ld a,xl 
      00932C C7 00            [ 1] 3575 	ld (y),a 
      00932E 0E 72            [ 2] 3576 	incw y 
      009330 5F 00 0D         [ 2] 3577 	jp decomp_loop
      009333 72 BB            [ 1] 3578 8$: cp a,#TK_COLON 
      009335 00 0D            [ 1] 3579 	jrne 9$
      009337 C3 00            [ 1] 3580 	ld a,#':
      00145B                       3581 81$:
      009339 1F 2A            [ 1] 3582 	ld (y),a 
      00933B 07 1F            [ 2] 3583 	incw y 
      00145F                       3584 82$:
      00933D 05 FE 13         [ 2] 3585 	jp decomp_loop
      001462                       3586 9$: 
      009340 03 2F            [ 1] 3587 	cp a,#TK_SHARP
      009342 DE 0A            [ 1] 3588 	jrugt 10$ 
      009343 A0 06            [ 1] 3589 	sub a,#TK_ARRAY 
      009343 55               [ 1] 3590 	clrw x 
      009344 00               [ 1] 3591 	ld xl,a
      009345 04 00 02         [ 2] 3592 	addw x,#single_char 
      009348 AE               [ 1] 3593 	ld a,(x)
      009349 16 E0            [ 2] 3594 	jra 81$ 
      001470                       3595 10$: 
      00934B CF 00            [ 1] 3596 	cp a,#TK_MINUS 
      00934D 05 5B            [ 1] 3597 	jrugt 11$
      00934F 06 81            [ 1] 3598 	sub a,#TK_PLUS 
      009351 5F               [ 1] 3599 	clrw x 
      009351 F6               [ 1] 3600 	ld xl,a 
      009352 5C A4 0F         [ 2] 3601 	addw x,#add_char 
      009355 88               [ 1] 3602 	ld a,(x)
      009356 0D 01            [ 2] 3603 	jra 81$
      00147E                       3604 11$:
      009358 27 0A            [ 1] 3605     cp a,#TK_MOD 
      00935A F6 90            [ 1] 3606 	jrugt 12$
      00935C F7 5C            [ 1] 3607 	sub a,#TK_MULT
      00935E 90               [ 1] 3608 	clrw x 
      00935F 5C               [ 1] 3609 	ld xl,a 
      009360 0A 01 26         [ 2] 3610 	addw x,#mul_char
      009363 F6               [ 1] 3611 	ld a,(x)
      009364 84 81            [ 2] 3612 	jra 81$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009366                       3613 12$:
      009366 90 5A            [ 1] 3614 	sub a,#TK_GT  
      009368 90               [ 1] 3615 	sll a 
      009369 F6               [ 1] 3616 	clrw x 
      00936A 90               [ 1] 3617 	ld xl,a 
      00936B 5C CD 86         [ 2] 3618 	addw x,#relop_str 
      00936E 09               [ 2] 3619 	ldw x,(x)
      00936F 24               [ 1] 3620 	ld a,(x)
      009370 06               [ 2] 3621 	incw x 
      009371 A6 20            [ 1] 3622 	ld (y),a
      009373 90 F7            [ 2] 3623 	incw y 
      009375 90               [ 1] 3624 	ld a,(x)
      009376 5C 81            [ 1] 3625 	jrne 81$
      009378 CC 13 BB         [ 2] 3626 	jp decomp_loop 
      0014A1                       3627 20$: 
      009378 88 7B            [ 1] 3628 	clr (y)
      00937A 01 C1            [ 2] 3629 	ldw x,(STR,sp)
      00937C 00 25            [ 1] 3630 	ld a,(BASE_SAV,sp)
      00937E 2A 08 A6         [ 1] 3631 	ld base,a 
      009381 20 5A            [ 1] 3632 	ld a,(WIDTH_SAV,sp)
      009383 F7 0C 01         [ 1] 3633 	ld tab_width,a
      009386 20 F1 84         [ 2] 3634 	subw y,(STR,sp) 
      009389 81 9F            [ 1] 3635 	ld a,yl 
      00938A                       3636 	_drop VSIZE 
      00938A A6 22            [ 2]    1     addw sp,#VSIZE 
      00938C 90               [ 4] 3637 	ret 
                                   3638 
      00938D F7 90 5C F6 27        3639 single_char: .byte '@','(',')',',','#'
      009392 30 5C                 3640 add_char: .byte '+','-'
      009394 A1 20 25              3641 mul_char: .byte '*','/','%'
      009397 0E 90 F7 90 5C A1 5C  3642 relop_str: .word gt,equal,ge,lt,le,ne 
             26 F0 D6 14 D9
      0093A0 3E 00                 3643 gt: .asciz ">"
      0093A0 90 F7                 3644 equal: .asciz "="
      0093A2 90 5C 20              3645 ge: .asciz ">="
      0093A5 EA 88                 3646 lt: .asciz "<"
      0093A7 A6 5C 90              3647 le: .asciz "<="
      0093AA F7 90 5C              3648 ne:  .asciz "<>"
                                   3649 
                                   3650 
                                   3651 ;--------------------------
                                   3652 ; decompile line from token list
                                   3653 ; and print it. 
                                   3654 ; input:
                                   3655 ;   A       stop at this position 
                                   3656 ;   X 		pointer at line
                                   3657 ; output:
                                   3658 ;   none 
                                   3659 ;--------------------------	
      0014DC                       3660 prt_basic_line:
      0093AD 84 A0 07         [ 1] 3661 	ld count,a 
      0093B0 C7 00            [ 1] 3662 	ld a,(2,x)
      0093B2 0E 72 5F         [ 1] 3663 	cp a,count 
      0093B5 00 0D            [ 1] 3664 	jrpl 1$ 
      0093B7 89 AE 8B         [ 1] 3665 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093BA 92 72 BB         [ 2] 3666 1$:	ldw basicptr,x 
      0093BD 00 0D F6 85      [ 2] 3667 	ldw y,#tib  
      0093C1 20 DD A6         [ 4] 3668 	call decompile 
      0093C4 22 90 F7         [ 4] 3669 	call puts 
      0093C7 90 5C            [ 1] 3670 	ld a,#CR 
      0093C9 5C 81 C0         [ 4] 3671 	call putc 
      0093CB 81               [ 4] 3672 	ret 
                                   3673 
                                   3674 
                                   3675 
                                   3676 ;---------------------------------
                                   3677 ; BASIC: PRINT|? arg_list 
                                   3678 ; print values from argument list
                                   3679 ;----------------------------------
                           000001  3680 	COMMA=1
                           000001  3681 	VSIZE=1
      0014FC                       3682 print:
      0093CB 1D 00            [ 1] 3683 push #0 ; local variable COMMA 
      0014FE                       3684 reset_comma:
      0093CD 30 9F            [ 1] 3685 	clr (COMMA,sp)
      001500                       3686 prt_loop:
      0093CF 44 AB 41         [ 4] 3687 	call next_token
      0093D2 81 02            [ 1] 3688 	cp a,#CMD_END 
      0093D3 25 5A            [ 1] 3689 	jrult print_exit ; colon or end of line 
      0093D3 90 89            [ 1] 3690 	cp a,#TK_QSTR
      0093D5 90 AE            [ 1] 3691 	jreq 1$
      0093D7 A7 39            [ 1] 3692 	cp a,#TK_CHAR 
      0093D9 90 CF            [ 1] 3693 	jreq 2$ 
      0093DB 00 18            [ 1] 3694 	cp a,#TK_CFUNC 
      0093DD 90 5F            [ 1] 3695 	jreq 3$
      0093DF 91 D3            [ 1] 3696 	cp a,#TK_COMMA 
      0093E1 18 27            [ 1] 3697 	jreq 4$
      0093E3 0C 90            [ 1] 3698 	cp a,#TK_SHARP 
      0093E5 5C 91            [ 1] 3699 	jreq 5$
      0093E7 D6 18            [ 2] 3700 	jra 7$ 
      00151D                       3701 1$:	; print string 
      0093E9 90 5C 91         [ 4] 3702 	call puts
      0093EC DA 18            [ 2] 3703 	jra reset_comma
      001522                       3704 2$:	; print character 
      0093EE 26               [ 1] 3705 	ld a,xl 
      0093EF EF 93 90         [ 4] 3706 	call putc 
      0093F2 85 81            [ 2] 3707 	jra reset_comma 
      0093F4                       3708 3$: ; print character function value  	
      0093F4 52               [ 4] 3709 	call (x)
      0093F5 04               [ 1] 3710 	ld a,xl 
      0093F6 C6 00 0B         [ 4] 3711 	call putc
      0093F9 6B 01            [ 2] 3712 	jra reset_comma 
      00152F                       3713 4$: ; set comma state 
      0093FB C6 00            [ 1] 3714 	ld a,#255 
      0093FD 25 6B            [ 1] 3715 	ld (COMMA,sp),a  
      0093FF 02 17 03         [ 2] 3716 	jp prt_loop   
      001536                       3717 5$: ; # character must be followed by an integer   
      009402 72 CE 00         [ 4] 3718 	call next_token
      009405 05 35            [ 1] 3719 	cp a,#TK_INTGR 
      009407 0A 00            [ 1] 3720 	jreq 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009409 0B 35 05         [ 2] 3721 	jp syntax_error 
      001540                       3722 6$: ; set tab width
      00940C 00               [ 1] 3723 	ld a,xl 
      00940D 25 72            [ 1] 3724 	and a,#15 
      00940F 5F 00 0C         [ 1] 3725 	ld tab_width,a 
      009412 CF 00            [ 2] 3726 	jra reset_comma 
      001548                       3727 7$:	
      001548                       3728 	_unget_token
      009414 0D CD 8A 66 CD   [ 1]    1     mov in,in.saved
      009419 93 78 88         [ 4] 3729 	call relation 
      00941C 90 93            [ 1] 3730 	cp a,#TK_INTGR
      00941E 1E 04            [ 1] 3731 	jreq 8$
      001554                       3732 	_unget_token
      009420 CD 84 34 90 5F   [ 1]    1     mov in,in.saved
      009425 84 90 97         [ 2] 3733 	jp print_exit 
      009428 72 F9 03         [ 4] 3734 8$: call print_int 
      00942B A6 20            [ 2] 3735 	jra reset_comma 
      001561                       3736 print_exit:
      00942D 90 F7            [ 1] 3737 	tnz (COMMA,sp)
      00942F 90 5C            [ 1] 3738 	jrne 9$
      009431 72 5F            [ 1] 3739 	ld a,#CR 
      009433 00 25 AE         [ 4] 3740     call putc 
      00156A                       3741 9$:	_drop VSIZE 
      009436 00 03            [ 2]    1     addw sp,#VSIZE 
      009438 CF               [ 4] 3742 	ret 
                                   3743 
                                   3744 ;----------------------
                                   3745 ; 'save_context' and
                                   3746 ; 'rest_context' must be 
                                   3747 ; called at the same 
                                   3748 ; call stack depth 
                                   3749 ; i.e. SP must have the 
                                   3750 ; save value at  
                                   3751 ; entry point of both 
                                   3752 ; routine. 
                                   3753 ;---------------------
                           000004  3754 	CTXT_SIZE=4 ; size of saved data 
                                   3755 ;--------------------
                                   3756 ; save current BASIC
                                   3757 ; interpreter context 
                                   3758 ; on stack 
                                   3759 ;--------------------
      00156D                       3760 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00156D                       3761 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00156D                       3762 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00156D                       3763 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00156D                       3764 save_context:
      009439 00 01 04         [ 2] 3765 	ldw x,basicptr 
      00943B 1F 03            [ 2] 3766 	ldw (BPTR,sp),x
      00943B 90 89 CD         [ 1] 3767 	ld a,in 
      00943E 89 ED            [ 1] 3768 	ld (IN,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009440 90 85 4D         [ 1] 3769 	ld a,count 
      009443 26 03            [ 1] 3770 	ld (CNT,sp),a  
      009445 CC               [ 4] 3771 	ret
                                   3772 
                                   3773 ;-----------------------
                                   3774 ; restore previously saved 
                                   3775 ; BASIC interpreter context 
                                   3776 ; from stack 
                                   3777 ;-------------------------
      00157D                       3778 rest_context:
      009446 95 21            [ 2] 3779 	ldw x,(BPTR,sp)
      009448 2A 6F A1         [ 2] 3780 	ldw basicptr,x 
      00944B 85 26            [ 1] 3781 	ld a,(IN,sp)
      00944D 0C CD 93         [ 1] 3782 	ld in,a
      009450 66 CD            [ 1] 3783 	ld a,(CNT,sp)
      009452 93 CB 90         [ 1] 3784 	ld count,a  
      009455 F7               [ 4] 3785 	ret
                                   3786 
                                   3787 
                                   3788 
                                   3789 ;------------------------------------------
                                   3790 ; BASIC: INPUT [string]var[,[string]var]
                                   3791 ; input value in variables 
                                   3792 ; [string] optionally can be used as prompt 
                                   3793 ;-----------------------------------------
                           000001  3794 	CX_BPTR=1
                           000003  3795 	CX_IN=3
                           000004  3796 	CX_CNT=4
                           000005  3797 	SKIP=5
                           000006  3798 	VAR_ADDR=6
                           000007  3799 	VSIZE=7
      00158D                       3800 input_var:
      00158D                       3801 	_vars VSIZE 
      009456 90 5C            [ 2]    1     sub sp,#VSIZE 
      00158F                       3802 input_loop:
      009458 20 E1            [ 1] 3803 	clr (SKIP,sp)
      00945A CD 09 6D         [ 4] 3804 	call next_token 
      00945A A1 84            [ 1] 3805 	cp a,#TK_QSTR 
      00945C 26 22            [ 1] 3806 	jrne 1$ 
      00945E CD 93 66         [ 4] 3807 	call puts 
      009461 72 5F            [ 1] 3808 	cpl (SKIP,sp)
      009463 00 0C CF         [ 4] 3809 	call next_token 
      009466 00 0D            [ 1] 3810 1$: cp a,#TK_VAR  
      009468 90 89            [ 1] 3811 	jreq 2$ 
      00946A CD 8A 66         [ 2] 3812 	jp syntax_error
      00946D 16 01            [ 2] 3813 2$:	ldw (VAR_ADDR,sp),x 
      00946F 88 51            [ 1] 3814 	tnz (SKIP,sp)
      009471 CD 84            [ 1] 3815 	jrne 21$ 
      009473 34 90 5F         [ 4] 3816 	call var_name 
      009476 84 90 97         [ 4] 3817 	call putc   
      0015B3                       3818 21$:
      009479 72 F9            [ 1] 3819 	ld a,#':
      00947B 01 5B 02         [ 4] 3820 	call putc 
      00947E 20 BB 6D         [ 4] 3821 	call save_context 
      009480 72 5F 00 03      [ 1] 3822 	clr count  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009480 CD 93 D3         [ 4] 3823 	call readln 
      009483 A3 00 8E         [ 2] 3824 	ldw x,#tib 
      009486 26 22 CE         [ 1] 3825 	push count
      009489 00 05            [ 1] 3826 	push #0 
      00948B CD 93 66         [ 2] 3827 	addw x,(1,sp)
      00948E A6               [ 2] 3828 	incw x 
      0015CE                       3829 	_drop 2 
      00948F 27 90            [ 2]    1     addw sp,#2 
      009491 F7 90 5C 01      [ 1] 3830 	clr in 
      009494 CD 0B EE         [ 4] 3831 	call get_token
      009494 72 D6            [ 1] 3832 	cp a,#TK_INTGR
      009496 00 01            [ 1] 3833 	jreq 3$ 
      009498 72 5C 00         [ 4] 3834 	call rest_context 
      00949B 02 90 F7         [ 2] 3835 	jp syntax_error
      00949E 90 5C            [ 2] 3836 3$: ldw y,(VAR_ADDR,sp) 
      0094A0 C6 00            [ 2] 3837 	ldw (y),x 
      0094A2 02 C1 00         [ 4] 3838 	call rest_context
      0094A5 04 2B EC         [ 4] 3839 	call next_token 
      0094A8 20 77            [ 1] 3840 	cp a,#TK_COMMA 
      0094AA 27 A0            [ 1] 3841 	jreq input_loop 
      0094AA CD 93            [ 1] 3842 	cp a,#TK_COLON 
      0094AC 66 90            [ 2] 3843     jrule input_exit 
      0094AE 89 CD 90         [ 2] 3844 	jp syntax_error 
      0015F6                       3845 input_exit:
      0015F6                       3846 	_drop VSIZE 
      0094B1 05 90            [ 2]    1     addw sp,#VSIZE 
      0094B3 85               [ 4] 3847 	ret 
                                   3848 
                                   3849 
                                   3850 ;---------------------
                                   3851 ; BASIC: REMARK | ' 
                                   3852 ; skip comment to end of line 
                                   3853 ;---------------------- 
      0015F9                       3854 remark:
      0094B4 CD 93 51 20 82   [ 1] 3855 	mov in,count 
      0094B9 81               [ 4] 3856  	ret 
                                   3857 
                                   3858 
                                   3859 ;---------------------
                                   3860 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3861 ; read in loop 'addr'  
                                   3862 ; apply & 'mask' to value 
                                   3863 ; loop while result==0.  
                                   3864 ; 'xor_mask' is used to 
                                   3865 ; invert the wait logic.
                                   3866 ; i.e. loop while not 0.
                                   3867 ;---------------------
                           000001  3868 	XMASK=1 
                           000002  3869 	MASK=2
                           000003  3870 	ADDR=3
                           000004  3871 	VSIZE=4
      0015FF                       3872 wait: 
      0015FF                       3873 	_vars VSIZE
      0094B9 A1 02            [ 2]    1     sub sp,#VSIZE 
      0094BB 26 06            [ 1] 3874 	clr (XMASK,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094BD CD 93 8A         [ 4] 3875 	call arg_list 
      0094C0 CC 94            [ 1] 3876 	cp a,#2
      0094C2 3B 03            [ 1] 3877 	jruge 0$
      0094C3 CC 08 7B         [ 2] 3878 	jp syntax_error 
      0094C3 A1 03            [ 1] 3879 0$:	cp a,#3
      0094C5 26 0E            [ 1] 3880 	jrult 1$
      0094C7 A6               [ 2] 3881 	popw x 
      0094C8 5C               [ 1] 3882 	ld a,xl
      0094C9 90 F7            [ 1] 3883 	ld (XMASK,sp),a 
      0094CB 90               [ 2] 3884 1$: popw x ; mask 
      0094CC 5C               [ 1] 3885 	ld a,xl 
      0094CD 9F 90            [ 1] 3886 	ld (MASK,sp),a 
      0094CF F7               [ 2] 3887 	popw x ; address 
      0094D0 90               [ 1] 3888 2$:	ld a,(x)
      0094D1 5C CC            [ 1] 3889 	and a,(MASK,sp)
      0094D3 94 3B            [ 1] 3890 	xor a,(XMASK,sp)
      0094D5 A1 01            [ 1] 3891 	jreq 2$ 
      001621                       3892 	_drop VSIZE 
      0094D7 26 09            [ 2]    1     addw sp,#VSIZE 
      0094D9 A6               [ 4] 3893 	ret 
                                   3894 
                                   3895 ;---------------------
                                   3896 ; BASIC: BSET addr,mask
                                   3897 ; set bits at 'addr' corresponding 
                                   3898 ; to those of 'mask' that are at 1.
                                   3899 ; arguments:
                                   3900 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3901 ;   mask        mask|addr
                                   3902 ; output:
                                   3903 ;	none 
                                   3904 ;--------------------------
      001624                       3905 bit_set:
      0094DA 3A 10 16         [ 4] 3906 	call arg_list 
      0094DB A1 02            [ 1] 3907 	cp a,#2	 
      0094DB 90 F7            [ 1] 3908 	jreq 1$ 
      0094DD 90 5C 7B         [ 2] 3909 	jp syntax_error
      0094DF                       3910 1$: 
      0094DF CC               [ 2] 3911 	popw x ; mask 
      0094E0 94               [ 1] 3912 	ld a,xl 
      0094E1 3B               [ 2] 3913 	popw x ; addr  
      0094E2 FA               [ 1] 3914 	or a,(x)
      0094E2 A1               [ 1] 3915 	ld (x),a
      0094E3 0A               [ 4] 3916 	ret 
                                   3917 
                                   3918 ;---------------------
                                   3919 ; BASIC: BRES addr,mask
                                   3920 ; reset bits at 'addr' corresponding 
                                   3921 ; to those of 'mask' that are at 1.
                                   3922 ; arguments:
                                   3923 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3924 ;   mask	    ~mask&*addr  
                                   3925 ; output:
                                   3926 ;	none 
                                   3927 ;--------------------------
      001634                       3928 bit_reset:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094E4 22 0A A0         [ 4] 3929 	call arg_list 
      0094E7 06 5F            [ 1] 3930 	cp a,#2  
      0094E9 97 1C            [ 1] 3931 	jreq 1$ 
      0094EB 95 37 F6         [ 2] 3932 	jp syntax_error
      00163E                       3933 1$: 
      0094EE 20               [ 2] 3934 	popw x ; mask 
      0094EF EB               [ 1] 3935 	ld a,xl 
      0094F0 43               [ 1] 3936 	cpl a 
      0094F0 A1               [ 2] 3937 	popw x ; addr  
      0094F1 11               [ 1] 3938 	and a,(x)
      0094F2 22               [ 1] 3939 	ld (x),a 
      0094F3 0A               [ 4] 3940 	ret 
                                   3941 
                                   3942 ;---------------------
                                   3943 ; BASIC: BTOGL addr,mask
                                   3944 ; toggle bits at 'addr' corresponding 
                                   3945 ; to those of 'mask' that are at 1.
                                   3946 ; arguments:
                                   3947 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3948 ;   mask	    mask^*addr  
                                   3949 ; output:
                                   3950 ;	none 
                                   3951 ;--------------------------
      001645                       3952 bit_toggle:
      0094F4 A0 10 5F         [ 4] 3953 	call arg_list 
      0094F7 97 1C            [ 1] 3954 	cp a,#2 
      0094F9 95 3C            [ 1] 3955 	jreq 1$ 
      0094FB F6 20 DD         [ 2] 3956 	jp syntax_error
      0094FE 85               [ 2] 3957 1$: popw x ; mask 
      0094FE A1               [ 1] 3958 	ld a,xl 
      0094FF 22               [ 2] 3959 	popw x ; addr  
      009500 22               [ 1] 3960 	xor a,(x)
      009501 0A               [ 1] 3961 	ld (x),a 
      009502 A0               [ 4] 3962 	ret 
                                   3963 
                                   3964 
                                   3965 ;---------------------
                                   3966 ; BASIC: BTEST(addr,bit)
                                   3967 ; return bit value at 'addr' 
                                   3968 ; bit is in range {0..7}.
                                   3969 ; arguments:
                                   3970 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3971 ;   bit 	    bit position {0..7}  
                                   3972 ; output:
                                   3973 ;	none 
                                   3974 ;--------------------------
      001655                       3975 bit_test:
      009503 20 5F 97         [ 4] 3976 	call func_args 
      009506 1C 95            [ 1] 3977 	cp a,#2
      009508 3E F6            [ 1] 3978 	jreq 0$
      00950A 20 CF 7B         [ 2] 3979 	jp syntax_error
      00950C                       3980 0$:	
      00950C A0               [ 2] 3981 	popw x 
      00950D 31               [ 1] 3982 	ld a,xl 
      00950E 48 5F            [ 1] 3983 	and a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009510 97               [ 1] 3984 	push a   
      009511 1C 95            [ 1] 3985 	ld a,#1 
      009513 41 FE            [ 1] 3986 1$: tnz (1,sp)
      009515 F6 5C            [ 1] 3987 	jreq 2$
      009517 90               [ 1] 3988 	sll a 
      009518 F7 90            [ 1] 3989 	dec (1,sp)
      00951A 5C F6            [ 2] 3990 	jra 1$
      00166F                       3991 2$: _drop 1 
      00951C 26 BD            [ 2]    1     addw sp,#1 
      00951E CC               [ 2] 3992 	popw x 
      00951F 94               [ 1] 3993 	and a,(x)
      009520 3B 02            [ 1] 3994 	jreq 3$
      009521 A6 01            [ 1] 3995 	ld a,#1 
      009521 90               [ 1] 3996 3$:	clrw x 
      009522 7F               [ 1] 3997 	ld xl,a 
      009523 1E 03            [ 1] 3998 	ld a,#TK_INTGR
      009525 7B               [ 4] 3999 	ret
                                   4000 
                                   4001 
                                   4002 ;--------------------
                                   4003 ; BASIC: POKE addr,byte
                                   4004 ; put a byte at addr 
                                   4005 ;--------------------
      00167C                       4006 poke:
      009526 01 C7 00         [ 4] 4007 	call arg_list 
      009529 0B 7B            [ 1] 4008 	cp a,#2
      00952B 02 C7            [ 1] 4009 	jreq 1$
      00952D 00 25 72         [ 2] 4010 	jp syntax_error
      001686                       4011 1$:	
      009530 F2               [ 2] 4012 	popw x  
      009531 03               [ 1] 4013     ld a,xl 
      009532 90               [ 2] 4014 	popw x 
      009533 9F               [ 1] 4015 	ld (x),a 
      009534 5B               [ 4] 4016 	ret 
                                   4017 
                                   4018 ;-----------------------
                                   4019 ; BASIC: PEEK(addr)
                                   4020 ; get the byte at addr 
                                   4021 ; input:
                                   4022 ;	none 
                                   4023 ; output:
                                   4024 ;	X 		value 
                                   4025 ;-----------------------
      00168B                       4026 peek:
      009535 04 81 40         [ 4] 4027 	call func_args
      009538 28 29            [ 1] 4028 	cp a,#1 
      00953A 2C 23            [ 1] 4029 	jreq 1$
      00953C 2B 2D 2A         [ 2] 4030 	jp syntax_error
      00953F 2F               [ 2] 4031 1$: popw x 
      009540 25               [ 1] 4032 	ld a,(x)
      009541 95               [ 1] 4033 	clrw x 
      009542 4D               [ 1] 4034 	ld xl,a 
      009543 95 4F            [ 1] 4035 	ld a,#TK_INTGR
      009545 95               [ 4] 4036 	ret 
                                   4037 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4038 ;---------------------------
                                   4039 ; BASIC IF expr : instructions
                                   4040 ; evaluate expr and if true 
                                   4041 ; execute instructions on same line. 
                                   4042 ;----------------------------
      00169C                       4043 if: 
      009546 51 95 54         [ 4] 4044 	call relation 
      009549 95 56            [ 1] 4045 	cp a,#TK_INTGR
      00954B 95 59            [ 1] 4046 	jreq 1$ 
      00954D 3E 00 3D         [ 2] 4047 	jp syntax_error
      009550 00               [ 1] 4048 1$:	clr a 
      009551 3E               [ 2] 4049 	tnzw x 
      009552 3D 00            [ 1] 4050 	jrne 9$  
                                   4051 ;skip to next line
      009554 3C 00 3C 3D 00   [ 1] 4052 	mov in,count
      009559 3C               [ 4] 4053 9$:	ret 
                                   4054 
                                   4055 ;------------------------
                                   4056 ; BASIC: FOR var=expr 
                                   4057 ; set variable to expression 
                                   4058 ; leave variable address 
                                   4059 ; on stack and set
                                   4060 ; FLOOP bit in 'flags'
                                   4061 ;-----------------
                           000001  4062 	RETL1=1 ; return address  
                           000003  4063 	FSTEP=3  ; variable increment
                           000005  4064 	LIMIT=5 ; loop limit 
                           000007  4065 	CVAR=7   ; control variable 
                           000009  4066 	INW=9   ;  in.w saved
                           00000B  4067 	BPTR=11 ; baseptr saved
                           00000A  4068 	VSIZE=10  
      0016B0                       4069 for: ; { -- var_addr }
      00955A 3E               [ 2] 4070 	popw x ; call return address 
      0016B1                       4071 	_vars VSIZE 
      00955B 00 0A            [ 2]    1     sub sp,#VSIZE 
      00955C 89               [ 2] 4072 	pushw x  ; RETL1 
      00955C C7 00            [ 1] 4073 	ld a,#TK_VAR 
      00955E 04 E6 02         [ 4] 4074 	call expect
      009561 C1 00            [ 2] 4075 	ldw (CVAR,sp),x  ; control variable 
      009563 04 2A 03         [ 4] 4076 	call let_var 
      009566 C7 00 04 CF      [ 1] 4077 	bset flags,#FLOOP 
                                   4078 ; open space on stack for loop data 
      00956A 00               [ 1] 4079 	clrw x 
      00956B 05 90            [ 2] 4080 	ldw (BPTR,sp),x 
      00956D AE 16            [ 2] 4081 	ldw (INW,sp),x 
      00956F 90 CD 93         [ 4] 4082 	call next_token 
      009572 F4 CD            [ 1] 4083 	cp a,#TK_CMD 
      009574 A8 C0            [ 1] 4084 	jreq 1$
      009576 A6 0D CD         [ 2] 4085 	jp syntax_error
      0016D1                       4086 1$:  
      009579 83 40 81         [ 2] 4087 	cpw x,#to 
      00957C 27 03            [ 1] 4088 	jreq to
      00957C 4B 00 7B         [ 2] 4089 	jp syntax_error 
                                   4090 
                                   4091 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4092 ; BASIC: TO expr 
                                   4093 ; second part of FOR loop initilization
                                   4094 ; leave limit on stack and set 
                                   4095 ; FTO bit in 'flags'
                                   4096 ;-----------------------------------
      00957E                       4097 to: ; { var_addr -- var_addr limit step }
      00957E 0F 01 00 23 03   [ 2] 4098 	btjt flags,#FLOOP,1$
      009580 CC 08 7B         [ 2] 4099 	jp syntax_error
      009580 CD 89 ED         [ 4] 4100 1$: call relation  
      009583 A1 02            [ 1] 4101 	cp a,#TK_INTGR 
      009585 25 5A            [ 1] 4102 	jreq 2$ 
      009587 A1 02 27         [ 2] 4103 	jp syntax_error
      00958A 12 A1            [ 2] 4104 2$: ldw (LIMIT,sp),x
                                   4105 ;	ldw x,in.w 
      00958C 03 27 13         [ 4] 4106 	call next_token
      00958F A1 82            [ 1] 4107 	cp a,#TK_NONE  
      009591 27 15            [ 1] 4108 	jreq 4$ 
      009593 A1 09            [ 1] 4109 	cp a,#TK_CMD
      009595 27 18            [ 1] 4110 	jrne 3$
      009597 A1 0A 27         [ 2] 4111 	cpw x,#step 
      00959A 1B 20            [ 1] 4112 	jreq step
      0016FD                       4113 3$:	
      0016FD                       4114 	_unget_token   	 
      00959C 2B 00 02 00 01   [ 1]    1     mov in,in.saved
      00959D                       4115 4$:	
      00959D CD A8 C0         [ 2] 4116 	ldw x,#1   ; default step  
      0095A0 20 DC            [ 2] 4117 	ldw (FSTEP,sp),x 
      0095A2 20 14            [ 2] 4118 	jra store_loop_addr 
                                   4119 
                                   4120 
                                   4121 ;----------------------------------
                                   4122 ; BASIC: STEP expr 
                                   4123 ; optional third par of FOR loop
                                   4124 ; initialization. 	
                                   4125 ;------------------------------------
      001709                       4126 step: ; {var limit -- var limit step}
      0095A2 9F CD 83 40 20   [ 2] 4127 	btjt flags,#FLOOP,1$
      0095A7 D6 08 7B         [ 2] 4128 	jp syntax_error
      0095A8 CD 11 58         [ 4] 4129 1$: call relation
      0095A8 FD 9F            [ 1] 4130 	cp a,#TK_INTGR
      0095AA CD 83            [ 1] 4131 	jreq 2$
      0095AC 40 20 CF         [ 2] 4132 	jp syntax_error
      0095AF 1F 03            [ 2] 4133 2$:	ldw (FSTEP,sp),x ; step
                                   4134 ; leave loop back entry point on cstack 
                                   4135 ; cstack is 1 call deep from interpreter
      00171D                       4136 store_loop_addr:
      0095AF A6 FF 6B         [ 2] 4137 	ldw x,basicptr  
      0095B2 01 CC            [ 2] 4138 	ldw (BPTR,sp),x 
      0095B4 95 80 00         [ 2] 4139 	ldw x,in.w 
      0095B6 1F 09            [ 2] 4140 	ldw (INW,sp),x   
      0095B6 CD 89 ED A1      [ 1] 4141 	bres flags,#FLOOP 
      0095BA 84 27 03 CC      [ 1] 4142 	inc loop_depth  
      0095BE 88               [ 4] 4143 	ret 
                                   4144 
                                   4145 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4146 ; BASIC: NEXT var 
                                   4147 ; FOR loop control 
                                   4148 ; increment variable with step 
                                   4149 ; and compare with limit 
                                   4150 ; loop if threshold not crossed.
                                   4151 ; else stack. 
                                   4152 ; and decrement 'loop_depth' 
                                   4153 ;--------------------------------
      001730                       4154 next: ; {var limit step retl1 -- [var limit step ] }
      0095BF FB 5D 00 20      [ 1] 4155 	tnz loop_depth 
      0095C0 26 03            [ 1] 4156 	jrne 1$ 
      0095C0 9F A4 0F         [ 2] 4157 	jp syntax_error 
      001739                       4158 1$: 
      0095C3 C7 00            [ 1] 4159 	ld a,#TK_VAR 
      0095C5 25 20 B6         [ 4] 4160 	call expect
                                   4161 ; check for good variable after NEXT 	 
      0095C8 13 07            [ 2] 4162 	cpw x,(CVAR,sp)
      0095C8 55 00            [ 1] 4163 	jreq 2$  
      0095CA 03 00 02         [ 2] 4164 	jp syntax_error ; not the good one 
      001745                       4165 2$: ; increment variable 
      0095CD CD               [ 2] 4166 	ldw x,(x)  ; get var value 
      0095CE 91 D8 A1         [ 2] 4167 	addw x,(FSTEP,sp) ; var+step 
      0095D1 84 27            [ 2] 4168 	ldw y,(CVAR,sp)
      0095D3 08 55            [ 2] 4169 	ldw (y),x ; save var new value 
                                   4170 ; check sign of STEP  
      0095D5 00 03            [ 1] 4171 	ld a,#0x80
      0095D7 00 02            [ 1] 4172 	bcp a,(FSTEP,sp)
      0095D9 CC 95            [ 1] 4173 	jrpl 4$
                                   4174 ;negative step 
      0095DB E1 CD            [ 2] 4175 	cpw x,(LIMIT,sp)
      0095DD 8A 4A            [ 1] 4176 	jrslt loop_done
      0095DF 20 9D            [ 2] 4177 	jra loop_back 
      0095E1                       4178 4$: ; positive step
      0095E1 0D 01            [ 2] 4179 	cpw x,(LIMIT,sp)
      0095E3 26 05            [ 1] 4180 	jrsgt loop_done
      00175D                       4181 loop_back:
      0095E5 A6 0D            [ 2] 4182 	ldw x,(BPTR,sp)
      0095E7 CD 83 40         [ 2] 4183 	ldw basicptr,x 
      0095EA 5B 01 81 23 05   [ 2] 4184 	btjf flags,#FRUN,1$ 
      0095ED E6 02            [ 1] 4185 	ld a,(2,x)
      0095ED CE 00 05         [ 1] 4186 	ld count,a
      0095F0 1F 03            [ 2] 4187 1$:	ldw x,(INW,sp)
      0095F2 C6 00 02         [ 2] 4188 	ldw in.w,x 
      0095F5 6B               [ 4] 4189 	ret 
      001772                       4190 loop_done:
                                   4191 	; remove loop data from stack  
      0095F6 05               [ 2] 4192 	popw x
      001773                       4193 	_drop VSIZE 
      0095F7 C6 00            [ 2]    1     addw sp,#VSIZE 
      0095F9 04 6B 06 81      [ 1] 4194 	dec loop_depth 
                                   4195 ;	pushw x 
                                   4196 ;	ret 
      0095FD FC               [ 2] 4197 	jp (x)
                                   4198 
                                   4199 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4200 ; called by goto/gosub
                                   4201 ; to get target line number 
                                   4202 ;---------------------------
      00177A                       4203 get_target_line:
      0095FD 1E 03 CF         [ 4] 4204 	call relation 
      009600 00 05            [ 1] 4205 	cp a,#TK_INTGR
      009602 7B 05            [ 1] 4206 	jreq 1$
      009604 C7 00 02         [ 2] 4207 	jp syntax_error
      009607 7B 06 C7         [ 4] 4208 1$:	call search_lineno  
      00960A 00               [ 2] 4209 	tnzw x 
      00960B 04 81            [ 1] 4210 	jrne 2$ 
      00960D A6 05            [ 1] 4211 	ld a,#ERR_NO_LINE 
      00960D 52 07 7D         [ 2] 4212 	jp tb_error 
      00960F 81               [ 4] 4213 2$:	ret 
                                   4214 
                                   4215 ;------------------------
                                   4216 ; BASIC: GOTO line# 
                                   4217 ; jump to line# 
                                   4218 ; here cstack is 2 call deep from interpreter 
                                   4219 ;------------------------
      001790                       4220 goto:
      00960F 0F 05 CD 89 ED   [ 2] 4221 	btjt flags,#FRUN,0$ 
      009614 A1 02            [ 1] 4222 	ld a,#ERR_RUN_ONLY
      009616 26 08 CD         [ 2] 4223 	jp tb_error 
      009619 A8               [ 4] 4224 	ret 
      00961A C0 03 05         [ 4] 4225 0$:	call get_target_line
      00179E                       4226 jp_to_target:
      00961D CD 89 ED         [ 2] 4227 	ldw basicptr,x 
      009620 A1 85            [ 1] 4228 	ld a,(2,x)
      009622 27 03 CC         [ 1] 4229 	ld count,a 
      009625 88 FB 1F 06      [ 1] 4230 	mov in,#3 
      009629 0D               [ 4] 4231 	ret 
                                   4232 
                                   4233 
                                   4234 ;--------------------
                                   4235 ; BASIC: GOSUB line#
                                   4236 ; basic subroutine call
                                   4237 ; actual line# and basicptr 
                                   4238 ; are saved on cstack
                                   4239 ; here cstack is 2 call deep from interpreter 
                                   4240 ;--------------------
                           000003  4241 	RET_ADDR=3
                           000005  4242 	RET_INW=5
                           000004  4243 	VSIZE=4  
      0017AB                       4244 gosub:
      00962A 05 26 06 CD 93   [ 2] 4245 	btjt flags,#FRUN,0$ 
      00962F CB CD            [ 1] 4246 	ld a,#ERR_RUN_ONLY
      009631 83 40 7D         [ 2] 4247 	jp tb_error 
      009633 81               [ 4] 4248 	ret 
      009633 A6               [ 2] 4249 0$:	popw x 
      0017B7                       4250 	_vars VSIZE  
      009634 3A CD            [ 2]    1     sub sp,#VSIZE 
      009636 83               [ 2] 4251 	pushw x 
      009637 40 CD 95         [ 2] 4252 	ldw x,basicptr
      00963A ED 72            [ 2] 4253 	ldw (RET_ADDR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00963C 5F 00 04         [ 4] 4254 	call get_target_line  
      00963F CD               [ 2] 4255 	pushw x 
      009640 A9 C5 AE         [ 2] 4256 	ldw x,in.w 
      009643 16 90            [ 2] 4257 	ldw (RET_INW+2,sp),x
      009645 3B               [ 2] 4258 	popw x 
      009646 00 04            [ 2] 4259 	jra jp_to_target
                                   4260 
                                   4261 ;------------------------
                                   4262 ; BASIC: RETURN 
                                   4263 ; exit from a subroutine 
                                   4264 ; 
                                   4265 ;------------------------
      0017CB                       4266 return:
      009648 4B 00 72 FB 01   [ 2] 4267 	btjt flags,#FRUN,0$ 
      00964D 5C 5B            [ 1] 4268 	ld a,#ERR_RUN_ONLY
      00964F 02 72 5F         [ 2] 4269 	jp tb_error 
      0017D5                       4270 0$:	
      009652 00 02            [ 2] 4271 	ldw x,(RET_ADDR,sp) 
      009654 CD 8C 6E         [ 2] 4272 	ldw basicptr,x
      009657 A1 84            [ 1] 4273 	ld a,(2,x)
      009659 27 06 CD         [ 1] 4274 	ld count,a  
      00965C 95 FD            [ 2] 4275 	ldw x,(RET_INW,sp)
      00965E CC 88 FB         [ 2] 4276 	ldw in.w,x 
      009661 16               [ 2] 4277 	popw x 
      0017E5                       4278 	_drop VSIZE 
      009662 06 90            [ 2]    1     addw sp,#VSIZE 
      009664 FF               [ 2] 4279 	pushw x
      009665 CD               [ 4] 4280 	ret  
                                   4281 
                                   4282 
                                   4283 ;----------------------------------
                                   4284 ; BASIC: RUN
                                   4285 ; run BASIC program in RAM
                                   4286 ;----------------------------------- 
      0017E9                       4287 run: 
      009666 95 FD CD 89 ED   [ 2] 4288 	btjf flags,#FRUN,0$  
      00966B A1               [ 1] 4289 	clr a 
      00966C 09               [ 4] 4290 	ret
      0017F0                       4291 0$: 
      00966D 27 A0 A1 01 23   [ 2] 4292 	btjf flags,#FBREAK,1$
      0017F5                       4293 	_drop 2 
      009672 03 CC            [ 2]    1     addw sp,#2 
      009674 88 FB 7D         [ 4] 4294 	call rest_context
      009676                       4295 	_drop CTXT_SIZE 
      009676 5B 07            [ 2]    1     addw sp,#CTXT_SIZE 
      009678 81 19 00 23      [ 1] 4296 	bres flags,#FBREAK 
      009679 72 10 00 23      [ 1] 4297 	bset flags,#FRUN 
      009679 55 00 04         [ 2] 4298 	jp interpreter 
      00967C 00 02 81         [ 2] 4299 1$:	ldw x,txtbgn
      00967F C3 00 1E         [ 2] 4300 	cpw x,txtend 
      00967F 52 04            [ 1] 4301 	jrmi run_it 
      009681 0F 01 CD         [ 2] 4302 	ldw x,#err_no_prog
      009684 90 96 A1         [ 4] 4303 	call puts 
      009687 02 24 03 CC 88   [ 1] 4304 	mov in,count
      00968C FB               [ 4] 4305 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00181B                       4306 run_it:	 
      00968D A1 03 25         [ 4] 4307     call ubound 
      00181E                       4308 	_drop 2 ; drop return address 
      009690 04 85            [ 2]    1     addw sp,#2 
                                   4309 ; clear data pointer 
      009692 9F               [ 1] 4310 	clrw x 
      009693 6B 01 85         [ 2] 4311 	ldw data_ptr,x 
      009696 9F 6B 02 85      [ 1] 4312 	clr data_ofs 
      00969A F6 14 02 18      [ 1] 4313 	clr data_len 
                                   4314 ; initialize BASIC pointer 
      00969E 01 27 F9         [ 2] 4315 	ldw x,txtbgn 
      0096A1 5B 04 81         [ 2] 4316 	ldw basicptr,x 
      0096A4 E6 02            [ 1] 4317 	ld a,(2,x)
      0096A4 CD 90 96         [ 1] 4318 	ld count,a
      0096A7 A1 02 27 03      [ 1] 4319 	mov in,#3	
      0096AB CC 88 FB 23      [ 1] 4320 	bset flags,#FRUN 
      0096AE CC 09 21         [ 2] 4321 	jp interpreter 
                                   4322 
                                   4323 
                                   4324 ;----------------------
                                   4325 ; BASIC: END
                                   4326 ; end running program
                                   4327 ;---------------------- 
      001842                       4328 cmd_end: 
                                   4329 ; clean stack 
      0096AE 85 9F 85         [ 2] 4330 	ldw x,#STACK_EMPTY
      0096B1 FA               [ 1] 4331 	ldw sp,x 
      0096B2 F7 81 02         [ 2] 4332 	jp warm_start
                                   4333 
                                   4334 ;-----------------
                                   4335 ; 1 Khz beep 
                                   4336 ;-----------------
      0096B4                       4337 beep_1khz:: 
      0096B4 CD 90 96         [ 2] 4338 	ldw x,#100
      0096B7 A1 02 27 03      [ 2] 4339 	ldw y,#1000
      0096BB CC 88            [ 2] 4340 	jra beep
                                   4341 
                                   4342 ;-----------------------
                                   4343 ; BASIC: TONE expr1,expr2
                                   4344 ; used TIMER2 channel 1
                                   4345 ; to produce a tone 
                                   4346 ; arguments:
                                   4347 ;    expr1   frequency 
                                   4348 ;    expr2   duration msec.
                                   4349 ;---------------------------
      001852                       4350 tone:
      0096BD FB 10 16         [ 4] 4351 	call arg_list 
      0096BE A1 02            [ 1] 4352 	cp a,#2 
      0096BE 85 9F            [ 1] 4353 	jreq 1$
      0096C0 43 85 F4         [ 2] 4354 	jp syntax_error 
      00185C                       4355 1$: 
      0096C3 F7               [ 2] 4356 	popw x ; duration
      0096C4 81 85            [ 2] 4357 	popw y ; frequency 
      0096C5                       4358 beep:  
      0096C5 CD               [ 2] 4359 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096C6 90 96 A1         [ 2] 4360 	ldw x,#TIM2_CLK_FREQ
      0096C9 02               [ 2] 4361 	divw x,y 
                                   4362 ; round to nearest integer 
      0096CA 27 03 CC 88      [ 2] 4363 	cpw y,#TIM2_CLK_FREQ/2
      0096CE FB 85            [ 1] 4364 	jrmi 2$
      0096D0 9F               [ 2] 4365 	incw x 
      00186B                       4366 2$:	 
      0096D1 85               [ 1] 4367 	ld a,xh 
      0096D2 F8 F7 81         [ 1] 4368 	ld TIM2_ARRH,a 
      0096D5 9F               [ 1] 4369 	ld a,xl 
      0096D5 CD 90 91         [ 1] 4370 	ld TIM2_ARRL,a 
                                   4371 ; 50% duty cycle 
      0096D8 A1               [ 1] 4372 	ccf 
      0096D9 02               [ 2] 4373 	rrcw x 
      0096DA 27               [ 1] 4374 	ld a,xh 
      0096DB 03 CC 88         [ 1] 4375 	ld TIM2_CCR1H,a 
      0096DE FB               [ 1] 4376 	ld a,xl
      0096DF C7 53 10         [ 1] 4377 	ld TIM2_CCR1L,a
      0096DF 85 9F A4 07      [ 1] 4378 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0096E3 88 A6 01 0D      [ 1] 4379 	bset TIM2_CR1,#TIM2_CR1_CEN
      0096E7 01 27 05 48      [ 1] 4380 	bset TIM2_EGR,#TIM2_EGR_UG
      0096EB 0A               [ 2] 4381 	popw x 
      0096EC 01 20 F7         [ 4] 4382 	call pause02
      0096EF 5B 01 85 F4      [ 1] 4383 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0096F3 27 02 A6 01      [ 1] 4384 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0096F7 5F               [ 4] 4385 	ret 
                                   4386 
                                   4387 ;-------------------------------
                                   4388 ; BASIC: ADCON 0|1 [,divisor]  
                                   4389 ; disable/enanble ADC 
                                   4390 ;-------------------------------
                           000003  4391 	ONOFF=3 
                           000001  4392 	DIVSOR=1
                           000004  4393 	VSIZE=4 
      001896                       4394 power_adc:
      0096F8 97 A6 84         [ 4] 4395 	call arg_list 
      0096FB 81 02            [ 1] 4396 	cp a,#2	
      0096FC 27 0B            [ 1] 4397 	jreq 1$
      0096FC CD 90            [ 1] 4398 	cp a,#1 
      0096FE 96 A1            [ 1] 4399 	jreq 0$ 
      009700 02 27 03         [ 2] 4400 	jp syntax_error 
      009703 CC 88 FB         [ 2] 4401 0$: ldw x,#0
      009706 89               [ 2] 4402 	pushw x  ; divisor 
      009706 85 9F            [ 2] 4403 1$: ldw x,(ONOFF,sp)
      009708 85               [ 2] 4404 	tnzw x 
      009709 F7 81            [ 1] 4405 	jreq 2$ 
      00970B 1E 01            [ 2] 4406 	ldw x,(DIVSOR,sp) ; divisor 
      00970B CD               [ 1] 4407 	ld a,xl
      00970C 90 91            [ 1] 4408 	and a,#7
      00970E A1               [ 1] 4409 	swap a 
      00970F 01 27 03         [ 1] 4410 	ld ADC_CR1,a
      009712 CC 88 FB 85      [ 1] 4411 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009716 F6 5F 97 A6      [ 1] 4412 	bset ADC_CR1,#ADC_CR1_ADON 
      0018BE                       4413 	_usec_dly 7 
      00971A 84 81 1B         [ 2]    1     ldw x,#(16*7-2)/4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00971C 5A               [ 2]    2     decw x
      00971C CD               [ 1]    3     nop 
      00971D 91 D8            [ 1]    4     jrne .-4
      00971F A1 84            [ 2] 4414 	jra 3$
      009721 27 03 CC 88      [ 1] 4415 2$: bres ADC_CR1,#ADC_CR1_ADON
      009725 FB 4F 5D 26      [ 1] 4416 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0018CF                       4417 3$:	_drop VSIZE 
      009729 05 55            [ 2]    1     addw sp,#VSIZE 
      00972B 00               [ 4] 4418 	ret
                                   4419 
                                   4420 ;-----------------------------
                                   4421 ; BASIC: ADCREAD (channel)
                                   4422 ; read adc channel {0..5}
                                   4423 ; output:
                                   4424 ;   A 		TK_INTGR 
                                   4425 ;   X 		value 
                                   4426 ;-----------------------------
      0018D2                       4427 analog_read:
      00972C 04 00 02         [ 4] 4428 	call func_args 
      00972F 81 01            [ 1] 4429 	cp a,#1 
      009730 27 03            [ 1] 4430 	jreq 1$
      009730 85 52 0A         [ 2] 4431 	jp syntax_error
      009733 89               [ 2] 4432 1$: popw x 
      009734 A6 85 CD         [ 2] 4433 	cpw x,#5 
      009737 90 84            [ 2] 4434 	jrule 2$
      009739 1F 07            [ 1] 4435 	ld a,#ERR_BAD_VALUE
      00973B CD 92 BB         [ 2] 4436 	jp tb_error 
      00973E 72               [ 1] 4437 2$: ld a,xl
      00973F 14 00 24         [ 1] 4438 	ld acc8,a 
      009742 5F 1F            [ 1] 4439 	ld a,#5
      009744 0B 1F 09         [ 1] 4440 	sub a,acc8 
      009747 CD 89 ED         [ 1] 4441 	ld ADC_CSR,a
      00974A A1 80 27 03      [ 1] 4442 	bset ADC_CR2,#ADC_CR2_ALIGN
      00974E CC 88 FB 01      [ 1] 4443 	bset ADC_CR1,#ADC_CR1_ADON
      009751 72 0F 54 00 FB   [ 2] 4444 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009751 A3 97 59         [ 2] 4445 	ldw x,ADC_DRH
      009754 27 03            [ 1] 4446 	ld a,#TK_INTGR
      009756 CC               [ 4] 4447 	ret 
                                   4448 
                                   4449 ;-----------------------
                                   4450 ; BASIC: DREAD(pin)
                                   4451 ; Arduino pins 
                                   4452 ; read state of a digital pin 
                                   4453 ; pin# {0..15}
                                   4454 ; output:
                                   4455 ;    A 		TK_INTGR
                                   4456 ;    X      0|1 
                                   4457 ;-------------------------
                           000001  4458 	PINNO=1
                           000001  4459 	VSIZE=1
      001906                       4460 digital_read:
      001906                       4461 	_vars VSIZE 
      009757 88 FB            [ 2]    1     sub sp,#VSIZE 
      009759 CD 10 11         [ 4] 4462 	call func_args
      009759 72 04            [ 1] 4463 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00975B 00 24            [ 1] 4464 	jreq 1$
      00975D 03 CC 88         [ 2] 4465 	jp syntax_error
      009760 FB               [ 2] 4466 1$: popw x 
      009761 CD 91 D8         [ 2] 4467 	cpw x,#15 
      009764 A1 84            [ 2] 4468 	jrule 2$
      009766 27 03            [ 1] 4469 	ld a,#ERR_BAD_VALUE
      009768 CC 88 FB         [ 2] 4470 	jp tb_error 
      00976B 1F 05 CD         [ 4] 4471 2$:	call select_pin 
      00976E 89 ED            [ 1] 4472 	ld (PINNO,sp),a
      009770 A1 00            [ 1] 4473 	ld a,(GPIO_IDR,x)
      009772 27 0E            [ 1] 4474 	tnz (PINNO,sp)
      009774 A1 80            [ 1] 4475 	jreq 8$
      009776 26               [ 1] 4476 3$: srl a 
      009777 05 A3            [ 1] 4477 	dec (PINNO,sp)
      009779 97 89            [ 1] 4478 	jrne 3$ 
      00977B 27 0C            [ 1] 4479 8$: and a,#1 
      00977D 5F               [ 1] 4480 	clrw x 
      00977D 55               [ 1] 4481 	ld xl,a 
      00977E 00 03            [ 1] 4482 	ld a,#TK_INTGR
      001933                       4483 	_drop VSIZE
      009780 00 02            [ 2]    1     addw sp,#VSIZE 
      009782 81               [ 4] 4484 	ret
                                   4485 
                                   4486 ;-----------------------
                                   4487 ; BASIC: DWRITE pin,0|1
                                   4488 ; Arduino pins 
                                   4489 ; write to a digital pin 
                                   4490 ; pin# {0..15}
                                   4491 ; output:
                                   4492 ;    A 		TK_INTGR
                                   4493 ;    X      0|1 
                                   4494 ;-------------------------
                           000001  4495 	PINNO=1
                           000002  4496 	PINVAL=2
                           000002  4497 	VSIZE=2
      001936                       4498 digital_write:
      001936                       4499 	_vars VSIZE 
      009782 AE 00            [ 2]    1     sub sp,#VSIZE 
      009784 01 1F 03         [ 4] 4500 	call arg_list  
      009787 20 14            [ 1] 4501 	cp a,#2 
      009789 27 03            [ 1] 4502 	jreq 1$
      009789 72 04 00         [ 2] 4503 	jp syntax_error
      00978C 24               [ 2] 4504 1$: popw x 
      00978D 03               [ 1] 4505 	ld a,xl 
      00978E CC 88            [ 1] 4506 	ld (PINVAL,sp),a
      009790 FB               [ 2] 4507 	popw x 
      009791 CD 91 D8         [ 2] 4508 	cpw x,#15 
      009794 A1 84            [ 2] 4509 	jrule 2$
      009796 27 03            [ 1] 4510 	ld a,#ERR_BAD_VALUE
      009798 CC 88 FB         [ 2] 4511 	jp tb_error 
      00979B 1F 03 35         [ 4] 4512 2$:	call select_pin 
      00979D 6B 01            [ 1] 4513 	ld (PINNO,sp),a 
      00979D CE 00            [ 1] 4514 	ld a,#1
      00979F 05 1F            [ 1] 4515 	tnz (PINNO,sp)
      0097A1 0B CE            [ 1] 4516 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0097A3 00               [ 1] 4517 3$: sll a
      0097A4 01 1F            [ 1] 4518 	dec (PINNO,sp)
      0097A6 09 72            [ 1] 4519 	jrne 3$
      0097A8 15 00            [ 1] 4520 4$: tnz (PINVAL,sp)
      0097AA 24 72            [ 1] 4521 	jrne 5$
      0097AC 5C               [ 1] 4522 	cpl a 
      0097AD 00 21            [ 1] 4523 	and a,(GPIO_ODR,x)
      0097AF 81 02            [ 2] 4524 	jra 8$
      0097B0 EA 00            [ 1] 4525 5$: or a,(GPIO_ODR,x)
      0097B0 72 5D            [ 1] 4526 8$: ld (GPIO_ODR,x),a 
      00196E                       4527 	_drop VSIZE 
      0097B2 00 21            [ 2]    1     addw sp,#VSIZE 
      0097B4 26               [ 4] 4528 	ret
                                   4529 
                                   4530 
                                   4531 ;-----------------------
                                   4532 ; BASIC: STOP
                                   4533 ; stop progam execution  
                                   4534 ; without resetting pointers 
                                   4535 ; the program is resumed
                                   4536 ; with RUN 
                                   4537 ;-------------------------
      001971                       4538 stop:
      0097B5 03 CC 88 FB 02   [ 2] 4539 	btjt flags,#FRUN,2$
      0097B9 4F               [ 1] 4540 	clr a
      0097B9 A6               [ 4] 4541 	ret 
      001978                       4542 2$:	 
                                   4543 ; create space on cstack to save context 
      0097BA 85 CD 90         [ 2] 4544 	ldw x,#break_point 
      0097BD 84 13 07         [ 4] 4545 	call puts 
      00197E                       4546 	_drop 2 ;drop return address 
      0097C0 27 03            [ 2]    1     addw sp,#2 
      001980                       4547 	_vars CTXT_SIZE ; context size 
      0097C2 CC 88            [ 2]    1     sub sp,#CTXT_SIZE 
      0097C4 FB 15 6D         [ 4] 4548 	call save_context 
      0097C5 AE 16 90         [ 2] 4549 	ldw x,#tib 
      0097C5 FE 72 FB         [ 2] 4550 	ldw basicptr,x
      0097C8 03               [ 1] 4551 	clr (x)
      0097C9 16 07 90 FF      [ 1] 4552 	clr count  
      0097CD A6               [ 1] 4553 	clrw x 
      0097CE 80 15 03         [ 2] 4554 	ldw in.w,x
      0097D1 2A 06 13 05      [ 1] 4555 	bres flags,#FRUN 
      0097D5 2F 1B 20 04      [ 1] 4556 	bset flags,#FBREAK
      0097D9 CC 09 21         [ 2] 4557 	jp interpreter 
      0097D9 13 05 2C 15 61 6B 20  4558 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4559 
                                   4560 ;-----------------------
                                   4561 ; BASIC: NEW
                                   4562 ; from command line only 
                                   4563 ; free program memory
                                   4564 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4565 ;------------------------
      0097DD                       4566 new: 
      0097DD 1E 0B CF 00 05   [ 2] 4567 	btjf flags,#FRUN,0$ 
      0097E2 72               [ 4] 4568 	ret 
      0019C3                       4569 0$:	
      0097E3 01 00 24         [ 4] 4570 	call clear_basic 
      0097E6 05               [ 4] 4571 	ret 
                                   4572 	 
                                   4573 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4574 ;  file system routines
                                   4575 ;  MCU flash memory from
                                   4576 ;  0x10000-0x27fff is 
                                   4577 ;  used to store BASIC 
                                   4578 ;  program files. 
                                   4579 ;  use 128 bytes sectors
                                   4580 ;  because this is the MCU 
                                   4581 ;  row size.
                                   4582 ;  file entry aligned to row
                                   4583 ;  	name  variable length
                                   4584 ;  	size  2 bytes  
                                   4585 ; 	data  variable length 
                                   4586 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4587 
                                   4588 ;---------------------------
                                   4589 ; fill pad with zeros 
                                   4590 ;--------------------------
      0019C7                       4591 zero_pad:
      0097E7 E6 02 C7         [ 2] 4592 	ldw x,#pad 
      0097EA 00 04            [ 1] 4593 	ld a,#PAD_SIZE 
      0097EC 1E               [ 1] 4594 1$:	clr (x)
      0097ED 09               [ 2] 4595 	incw x 
      0097EE CF               [ 1] 4596 	dec a 
      0097EF 00 01            [ 1] 4597 	jrne 1$
      0097F1 81               [ 4] 4598 	ret 
                                   4599 
                                   4600 ;--------------------------
                                   4601 ; align farptr to BLOCK_SIZE 
                                   4602 ;---------------------------
      0097F2                       4603 row_align:
      0097F2 85 5B            [ 1] 4604 	ld a,#0x7f 
      0097F4 0A 72 5A         [ 1] 4605 	and a,farptr+2 
      0097F7 00 21            [ 1] 4606 	jreq 1$ 
      0097F9 FC 00 17         [ 2] 4607 	ldw x,farptr+1 
      0097FA 1C 00 80         [ 2] 4608 	addw x,#BLOCK_SIZE 
      0097FA CD 91            [ 1] 4609 	jrnc 0$
      0097FC D8 A1 84 27      [ 1] 4610 	inc farptr 
      009800 03               [ 1] 4611 0$: ld a,xl 
      009801 CC 88            [ 1] 4612 	and a,#0x80
      009803 FB               [ 1] 4613 	ld xl,a
      009804 CD 84 84         [ 2] 4614 	ldw farptr+1,x  	
      009807 5D               [ 4] 4615 1$:	ret
                                   4616 
                                   4617 ;--------------------
                                   4618 ; input:
                                   4619 ;   X     increment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4620 ; output:
                                   4621 ;   farptr  incremented 
                                   4622 ;---------------------
      0019ED                       4623 incr_farptr:
      009808 26 05 A6 05      [ 2] 4624 	addw x,farptr+1 
      00980C CC 88            [ 1] 4625 	jrnc 1$
      00980E FD 81 00 16      [ 1] 4626 	inc farptr 
      009810 CF 00 17         [ 2] 4627 1$:	ldw farptr+1,x  
      009810 72               [ 4] 4628 	ret 
                                   4629 
                                   4630 ;------------------------------
                                   4631 ; extended flash memory used as FLASH_DRIVE 
                                   4632 ; seek end of used flash drive   
                                   4633 ; starting at 0x10000 address.
                                   4634 ; 4 consecutives 0 bytes signal free space. 
                                   4635 ; input:
                                   4636 ;	none
                                   4637 ; output:
                                   4638 ;   ffree     free_addr| 0 if memory full.
                                   4639 ;------------------------------
      0019FB                       4640 seek_fdrive:
                                   4641 ; start scan at 0x10000 address 
      009811 00 00            [ 1] 4642 	ld a,#1
      009813 24 06 A6         [ 1] 4643 	ld farptr,a 
      009816 06               [ 1] 4644 	clrw x 
      009817 CC 88 FD         [ 2] 4645 	ldw farptr+1,x 
      001A04                       4646 1$:
      00981A 81 CD 97         [ 2] 4647 	ldw x,#3  
      00981D FA AF 00 16      [ 5] 4648 2$:	ldf a,([farptr],x) 
      00981E 26 05            [ 1] 4649 	jrne 3$
      00981E CF               [ 2] 4650 	decw x
      00981F 00 05            [ 1] 4651 	jrpl 2$
      009821 E6 02            [ 2] 4652 	jra 4$ 
      009823 C7 00 04         [ 2] 4653 3$:	ldw x,#BLOCK_SIZE 
      009826 35 03 00         [ 4] 4654 	call incr_farptr
      009829 02 81 80         [ 2] 4655 	ldw x,#0x280  
      00982B C3 00 16         [ 2] 4656 	cpw x,farptr
      00982B 72 00            [ 1] 4657 	jrmi 1$
      001A20                       4658 4$: ; copy farptr to ffree	 
      00982D 00 24 06         [ 2] 4659 	ldw x,farptr 
      009830 A6 06 CC         [ 1] 4660 	ld a,farptr+2 
      009833 88 FD 81         [ 2] 4661 	ldw ffree,x 
      009836 85 52 04         [ 1] 4662 	ld ffree+2,a  
      009839 89               [ 4] 4663 	ret 
                                   4664 
                                   4665 ;-----------------------
                                   4666 ; return amount of free 
                                   4667 ; space on flash drive
                                   4668 ; input:
                                   4669 ;   none
                                   4670 ; output:
                                   4671 ;   acc24   free space 
                                   4672 ;-----------------------
      001A2D                       4673 disk_free:
      00983A CE 00 05         [ 2] 4674 	ldw x,#0x8000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00983D 1F 03 CD 97      [ 2] 4675 	subw x,ffree+1
      009841 FA 89            [ 1] 4676 	ld a,#2
      009843 CE 00 01         [ 1] 4677 	sbc a,ffree 
      009846 1F 07 85         [ 1] 4678 	ld acc24,a 
      009849 20 D3 0C         [ 2] 4679 	ldw acc16,x 
      00984B 81               [ 4] 4680 	ret 
                                   4681 
                                   4682 ;-----------------------
                                   4683 ; compare file name 
                                   4684 ; with name pointed by Y  
                                   4685 ; input:
                                   4686 ;   farptr   file name 
                                   4687 ;   Y        target name 
                                   4688 ; output:
                                   4689 ;   farptr 	 at file_name
                                   4690 ;   X 		 farptr[x] point at size field  
                                   4691 ;   Carry    0|1 no match|match  
                                   4692 ;----------------------
      001A40                       4693 cmp_name:
      00984B 72               [ 1] 4694 	clrw x
      00984C 00 00 24 05      [ 5] 4695 1$:	ldf a,([farptr],x)
      009850 A6 06            [ 1] 4696 	cp a,(y)
      009852 CC 88            [ 1] 4697 	jrne 4$
      009854 FD               [ 1] 4698 	tnz a 
      009855 27 12            [ 1] 4699 	jreq 9$ 
      009855 1E               [ 2] 4700     incw x 
      009856 03 CF            [ 2] 4701 	incw y 
      009858 00 05            [ 2] 4702 	jra 1$
      001A51                       4703 4$: ;no match 
      00985A E6               [ 1] 4704 	tnz a 
      00985B 02 C7            [ 1] 4705 	jreq 5$
      00985D 00               [ 2] 4706 	incw x 
      00985E 04 1E 05 CF      [ 5] 4707 	ldf a,([farptr],x)
      009862 00 01            [ 2] 4708 	jra 4$  
      009864 85               [ 2] 4709 5$:	incw x ; farptr[x] point at 'size' field 
      009865 5B               [ 1] 4710 	rcf 
      009866 04               [ 4] 4711 	ret
      001A5E                       4712 9$: ; match  
      009867 89               [ 2] 4713 	incw x  ; farptr[x] at 'size' field 
      009868 81               [ 1] 4714 	scf 
      009869 81               [ 4] 4715 	ret 
                                   4716 
                                   4717 ;-----------------------
                                   4718 ; search file in 
                                   4719 ; flash memory 
                                   4720 ; input:
                                   4721 ;   Y       file name  
                                   4722 ; output:
                                   4723 ;   farptr  addr at name|0
                                   4724 ;   X       offset to size field
                                   4725 ;-----------------------
                           000001  4726 	FSIZE=1
                           000003  4727 	YSAVE=3
                           000004  4728 	VSIZE=4 
      001A61                       4729 search_file: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001A61                       4730 	_vars VSIZE
      009869 72 01            [ 2]    1     sub sp,#VSIZE 
      00986B 00 24            [ 2] 4731 	ldw (YSAVE,sp),y  
      00986D 02               [ 1] 4732 	clrw x 
      00986E 4F 81 17         [ 2] 4733 	ldw farptr+1,x 
      009870 35 01 00 16      [ 1] 4734 	mov farptr,#1
      001A6D                       4735 1$:	
                                   4736 ; check if farptr is after any file 
                                   4737 ; if  0 then so.
      009870 72 09 00 24      [ 5] 4738 	ldf a,[farptr]
      009874 12 5B            [ 1] 4739 	jreq 6$
      009876 02               [ 1] 4740 2$: clrw x 	
      009877 CD 95            [ 2] 4741 	ldw y,(YSAVE,sp) 
      009879 FD 5B 04         [ 4] 4742 	call cmp_name
      00987C 72 19            [ 1] 4743 	jrc 9$
      00987E 00 24 72 10      [ 5] 4744 	ldf a,([farptr],x)
      009882 00 24            [ 1] 4745 	ld (FSIZE,sp),a 
      009884 CC               [ 2] 4746 	incw x 
      009885 89 A1 CE 00      [ 5] 4747 	ldf a,([farptr],x)
      009889 1D C3            [ 1] 4748 	ld (FSIZE+1,sp),a 
      00988B 00               [ 2] 4749 	incw x 
      00988C 1F 2B 0C         [ 2] 4750 	addw x,(FSIZE,sp) ; skip over file data
      00988F AE 88 96         [ 4] 4751 	call incr_farptr
      009892 CD A8 C0         [ 4] 4752 	call row_align  
      009895 55 00 04         [ 2] 4753 	ldw x,#0x280
      009898 00 02 81         [ 2] 4754 	cpw x,farptr 
      00989B 2A D3            [ 1] 4755 	jrpl 1$
      001A9A                       4756 6$: ; file not found 
      00989B CD 92 88 5B      [ 1] 4757 	clr farptr
      00989F 02 5F CF 00      [ 1] 4758 	clr farptr+1 
      0098A3 07 72 5F 00      [ 1] 4759 	clr farptr+2 
      001AA6                       4760 	_drop VSIZE 
      0098A7 09 72            [ 2]    1     addw sp,#VSIZE 
      0098A9 5F               [ 1] 4761 	rcf
      0098AA 00               [ 4] 4762 	ret
      001AAA                       4763 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AAA                       4764 	_drop VSIZE 
      0098AB 0A CE            [ 2]    1     addw sp,#VSIZE 
      0098AD 00               [ 1] 4765 	scf 	
      0098AE 1D               [ 4] 4766 	ret
                                   4767 
                                   4768 ;--------------------------------
                                   4769 ; BASIC: SAVE "name" 
                                   4770 ; save text program in 
                                   4771 ; flash memory used as permanent
                                   4772 ; storage from address 0x10000-0x27fff 
                                   4773 ;--------------------------------
                           000001  4774 	BSIZE=1
                           000003  4775 	NAMEPTR=3
                           000005  4776 	XSAVE=5
                           000007  4777 	YSAVE=7
                           000008  4778 	VSIZE=8 
      001AAE                       4779 save:
      0098AF CF 00 05 E6 02   [ 2] 4780 	btjf flags,#FRUN,0$ 
      0098B4 C7 00            [ 1] 4781 	ld a,#ERR_CMD_ONLY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098B6 04 35 03         [ 2] 4782 	jp tb_error
      001AB8                       4783 0$:	 
      0098B9 00 02 72         [ 2] 4784 	ldw x,txtend 
      0098BC 10 00 24 CC      [ 2] 4785 	subw x,txtbgn
      0098C0 89 A1            [ 1] 4786 	jrne 1$
                                   4787 ; nothing to save 
      0098C2 AE 08 16         [ 2] 4788 	ldw x,#err_no_prog 
      0098C2 AE 17 FF         [ 4] 4789 	call puts 
      0098C5 94 CC 89 82 01   [ 1] 4790 	mov in,count 
      0098C9 81               [ 4] 4791 	ret  	
      001ACD                       4792 1$:	
      001ACD                       4793 	_vars VSIZE 
      0098C9 AE 00            [ 2]    1     sub sp,#VSIZE 
      0098CB 64 90            [ 2] 4794 	ldw (BSIZE,sp),x 
      0098CD AE 03 E8         [ 4] 4795 	call next_token	
      0098D0 20 0D            [ 1] 4796 	cp a,#TK_QSTR
      0098D2 27 03            [ 1] 4797 	jreq 2$
      0098D2 CD 90 96         [ 2] 4798 	jp syntax_error
      001ADB                       4799 2$: 
      0098D5 A1 02            [ 2] 4800 	ldw (NAMEPTR,sp),x  
      0098D7 27 03 CC         [ 4] 4801 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4802 ; check if enough free space 
      0098DA 88 FB 96         [ 4] 4803 	call strlen 
      0098DC 1C 00 03         [ 2] 4804 	addw x,#3 
      0098DC 85 90 85         [ 2] 4805 	addw x,(BSIZE,sp)
      0098DF 4F               [ 1] 4806 	clr a 
      0098DF 89 AE F4 24      [ 2] 4807 	addw x,ffree+1 
      0098E3 65 90 A3         [ 1] 4808 	adc a,ffree 
      0098E6 7A 12            [ 1] 4809 	cp a,#2
      0098E8 2B 01            [ 1] 4810 	jrmi 21$
      0098EA 5C 80 00         [ 2] 4811 	cpw x,#0x8000
      0098EB 2B 05            [ 1] 4812 	jrmi 21$
      0098EB 9E C7            [ 1] 4813 	ld a,#ERR_NO_FSPACE  
      0098ED 53 0D 9F         [ 2] 4814 	jp tb_error
      001AFF                       4815 21$: 
                                   4816 ; check for existing file of that name 
      0098F0 C7 53            [ 2] 4817 	ldw y,(NAMEPTR,sp)	
      0098F2 0E 8C 56         [ 4] 4818 	call search_file 
      0098F5 9E C7            [ 1] 4819 	jrnc 3$ 
      0098F7 53 0F            [ 1] 4820 	ld a,#ERR_DUPLICATE 
      0098F9 9F C7 53         [ 2] 4821 	jp tb_error 
      001B0B                       4822 3$:	; initialize farptr 
      0098FC 10 72 10         [ 2] 4823 	ldw x,ffree 
      0098FF 53 08 72         [ 1] 4824 	ld a,ffree+2 
      009902 10 53 00         [ 2] 4825 	ldw farptr,x 
      009905 72 10 53         [ 1] 4826 	ld farptr+2,a 
                                   4827 ;** write file name to row buffer **	
      009908 04 85            [ 2] 4828 	ldw y,(NAMEPTR,sp)  
      00990A CD 9E 82         [ 2] 4829 	ldw x,#pad 
      00990D 72 11 53         [ 4] 4830 	call strcpy
      009910 08 72 11         [ 4] 4831 	call strlen 
      009913 53               [ 2] 4832 	incw  x
      009914 00 81 E0         [ 2] 4833 	addw x,#pad 
                                   4834 ; ** write file size to row buffer 
      009916 16 01            [ 2] 4835 	ldw y,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009916 CD               [ 2] 4836 	ldw (x),y 
      009917 90 96 A1         [ 2] 4837 	addw x,#2 
                                   4838 ; ** write file data to row buffer 
      00991A 02 27 0B A1      [ 2] 4839 	ldw y,txtbgn 
      00991E 01 27            [ 1] 4840 6$:	ld a,(y)
      009920 03 CC            [ 2] 4841 	incw y
      009922 88               [ 1] 4842 	ld (x),a 
      009923 FB               [ 2] 4843 	incw x
      009924 AE 00 00 89      [ 2] 4844 	cpw y,txtend 
      009928 1E 03            [ 1] 4845 	jreq 12$
      00992A 5D 27 1A         [ 2] 4846 	cpw x,#stack_full 
      00992D 1E 01            [ 1] 4847 	jrmi 6$
      001B41                       4848 12$:
      00992F 9F A4            [ 2] 4849 	ldw (YSAVE,sp),y 
      001B43                       4850 14$: ; zero buffer end 
      009931 07 4E C7         [ 2] 4851 	cpw x,#stack_full
      009934 54 01            [ 1] 4852 	jreq 16$
      009936 72               [ 1] 4853 	clr (x)
      009937 16               [ 2] 4854 	incw x 
      009938 50 CA            [ 2] 4855 	jra 14$
      001B4C                       4856 16$:
      00993A 72 10 54         [ 2] 4857 	ldw x,#pad 
      00993D 01 AE 00         [ 4] 4858 	call write_row 
      009940 1B 5A 9D         [ 2] 4859 	ldw x,#BLOCK_SIZE 
      009943 26 FA 20         [ 4] 4860 	call incr_farptr
      009946 08 72 11         [ 2] 4861 	ldw x,#pad 
      009949 54 01            [ 2] 4862 	ldw y,(YSAVE,sp)
      00994B 72 17 50 CA      [ 2] 4863 	cpw y,txtend 
      00994F 5B 04            [ 1] 4864 	jrmi 6$
                                   4865 ; save farptr in ffree
      009951 81 00 16         [ 2] 4866 	ldw x,farptr 
      009952 C6 00 18         [ 1] 4867 	ld a,farptr+2 
      009952 CD 90 91         [ 2] 4868 	ldw ffree,x 
      009955 A1 01 27         [ 1] 4869 	ld ffree+2,a
                                   4870 ; print file size 	
      009958 03 CC            [ 2] 4871 	ldw x,(BSIZE,sp) 
      00995A 88 FB 85         [ 4] 4872 	call print_int 
      001B74                       4873 	_drop VSIZE 
      00995D A3 00            [ 2]    1     addw sp,#VSIZE 
      00995F 05               [ 4] 4874 	ret 
                                   4875 
                                   4876 ;----------------------
                                   4877 ; load file in RAM memory
                                   4878 ; input:
                                   4879 ;    farptr point at file size 
                                   4880 ; output:
                                   4881 ;   y point after BASIC program in RAM.
                                   4882 ;------------------------
      001B77                       4883 load_file:
      009960 23 05 A6         [ 4] 4884 	call incr_farptr  
      009963 0A CC 88         [ 4] 4885 	call clear_basic  
      009966 FD               [ 1] 4886 	clrw x
      009967 9F C7 00 0E      [ 5] 4887 	ldf a,([farptr],x)
      00996B A6 05            [ 1] 4888 	ld yh,a 
      00996D C0               [ 2] 4889 	incw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00996E 00 0E C7 54      [ 5] 4890 	ldf a,([farptr],x)
      009972 00               [ 2] 4891 	incw x 
      009973 72 16            [ 1] 4892 	ld yl,a 
      009975 54 02 72 10      [ 2] 4893 	addw y,txtbgn
      009979 54 01 72 0F      [ 2] 4894 	ldw txtend,y
      00997D 54 00 FB CE      [ 2] 4895 	ldw y,txtbgn
      001B98                       4896 3$:	; load BASIC text 	
      009981 54 04 A6 84      [ 5] 4897 	ldf a,([farptr],x)
      009985 81 F7            [ 1] 4898 	ld (y),a 
      009986 5C               [ 2] 4899 	incw x 
      009986 52 01            [ 2] 4900 	incw y 
      009988 CD 90 91 A1      [ 2] 4901 	cpw y,txtend 
      00998C 01 27            [ 1] 4902 	jrmi 3$
      00998E 03               [ 4] 4903 	ret 
                                   4904 
                                   4905 ;------------------------
                                   4906 ; BASIC: LOAD "file" 
                                   4907 ; load file to RAM 
                                   4908 ; for execution 
                                   4909 ;------------------------
      001BA8                       4910 load:
      00998F CC 88 FB 85 A3   [ 2] 4911 	btjf flags,#FRUN,0$ 
      009994 00 0F            [ 1] 4912 	jreq 0$ 
      009996 23 05            [ 1] 4913 	ld a,#ERR_CMD_ONLY 
      009998 A6 0A CC         [ 2] 4914 	jp tb_error 
      001BB4                       4915 0$:	
      00999B 88 FD CD         [ 4] 4916 	call next_token 
      00999E 9F B5            [ 1] 4917 	cp a,#TK_QSTR
      0099A0 6B 01            [ 1] 4918 	jreq 1$
      0099A2 E6 01 0D         [ 2] 4919 	jp syntax_error 
      0099A5 01 27            [ 1] 4920 1$:	ldw y,x 
      0099A7 05 44 0A         [ 4] 4921 	call search_file 
      0099AA 01 26            [ 1] 4922 	jrc 2$ 
      0099AC FB A4            [ 1] 4923 	ld a,#ERR_NOT_FILE
      0099AE 01 5F 97         [ 2] 4924 	jp tb_error  
      001BCA                       4925 2$:
      0099B1 A6 84 5B         [ 4] 4926 	call load_file
                                   4927 ; print loaded size 	 
      0099B4 01 81 1E         [ 2] 4928 	ldw x,txtend 
      0099B6 72 B0 00 1C      [ 2] 4929 	subw x,txtbgn
      0099B6 52 02 CD         [ 4] 4930 	call print_int 
      0099B9 90               [ 4] 4931 	ret 
                                   4932 
                                   4933 ;-----------------------------------
                                   4934 ; BASIC: FORGET ["file_name"] 
                                   4935 ; erase file_name and all others 
                                   4936 ; after it. 
                                   4937 ; without argument erase all files 
                                   4938 ;-----------------------------------
                           000001  4939 	NEW_FREE=1 
                           000003  4940 	VSIZE=3 
      001BD8                       4941 forget:
      001BD8                       4942 	_vars VSIZE 
      0099BA 96 A1            [ 2]    1     sub sp,#VSIZE 
      0099BC 02 27 03         [ 4] 4943 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099BF CC 88            [ 1] 4944 	cp a,#TK_NONE 
      0099C1 FB 85            [ 1] 4945 	jreq 3$ 
      0099C3 9F 6B            [ 1] 4946 	cp a,#TK_QSTR
      0099C5 02 85            [ 1] 4947 	jreq 1$
      0099C7 A3 00 0F         [ 2] 4948 	jp syntax_error
      0099CA 23 05            [ 1] 4949 1$: ldw y,x 
      0099CC A6 0A CC 88 FD   [ 1] 4950 	mov in,count 
      0099D1 CD 9F B5         [ 4] 4951 	call search_file
      0099D4 6B 01            [ 1] 4952 	jrc 2$
      0099D6 A6 01            [ 1] 4953 	ld a,#ERR_NOT_FILE 
      0099D8 0D 01 27         [ 2] 4954 	jp tb_error 
      001BF9                       4955 2$: 
      0099DB 05 48 0A         [ 2] 4956 	ldw x,farptr
      0099DE 01 26 FB         [ 1] 4957 	ld a,farptr+2
      0099E1 0D 02            [ 2] 4958 	jra 4$ 
      001C01                       4959 3$: ; forget all files 
      0099E3 26 05 43         [ 2] 4960 	ldw x,#0x100
      0099E6 E4               [ 1] 4961 	clr a 
      0099E7 00 20 02         [ 2] 4962 	ldw farptr,x 
      0099EA EA 00 E7         [ 1] 4963 	ld farptr+2,a 
      001C0B                       4964 4$:	; save new free address 
      0099ED 00 5B            [ 2] 4965 	ldw (NEW_FREE,sp),x
      0099EF 02 81            [ 1] 4966 	ld (NEW_FREE+2,sp),a 
      0099F1 CD 01 40         [ 4] 4967 	call move_erase_to_ram
      0099F1 72 00 00         [ 4] 4968 5$: call block_erase 
      0099F4 24 02 4F         [ 2] 4969 	ldw x,#BLOCK_SIZE 
      0099F7 81 19 ED         [ 4] 4970 	call incr_farptr 
      0099F8 CD 19 D2         [ 4] 4971 	call row_align 
                                   4972 ; check if all blocks erased
      0099F8 AE 9A 1F         [ 1] 4973 	ld a,farptr+2  
      0099FB CD A8 C0         [ 1] 4974 	sub a,ffree+2
      0099FE 5B 02 52         [ 1] 4975 	ld a,farptr+1 
      009A01 04 CD 95         [ 1] 4976 	sbc a,ffree+1 
      009A04 ED AE 16         [ 1] 4977 	ld a,farptr 
      009A07 90 CF 00         [ 1] 4978 	sbc a,ffree 
      009A0A 05 7F            [ 1] 4979 	jrmi 5$ 
      009A0C 72 5F            [ 1] 4980 	ld a,(NEW_FREE+2,sp)
      009A0E 00 04            [ 2] 4981 	ldw x,(NEW_FREE,sp)
      009A10 5F CF 00         [ 1] 4982 	ld ffree+2,a 
      009A13 01 72 11         [ 2] 4983 	ldw ffree,x 
      001C3C                       4984 	_drop VSIZE 
      009A16 00 24            [ 2]    1     addw sp,#VSIZE 
      009A18 72               [ 4] 4985 	ret 
                                   4986 
                                   4987 ;----------------------
                                   4988 ; BASIC: DIR 
                                   4989 ; list saved files 
                                   4990 ;----------------------
                           000001  4991 	COUNT=1 ; files counter 
                           000002  4992 	VSIZE=2 
      001C3F                       4993 directory:
      001C3F                       4994 	_vars VSIZE 
      009A19 18 00            [ 2]    1     sub sp,#VSIZE 
      009A1B 24               [ 1] 4995 	clrw x 
      009A1C CC 89            [ 2] 4996 	ldw (COUNT,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A1E A1 0A 62         [ 2] 4997 	ldw farptr+1,x 
      009A21 72 65 61 6B      [ 1] 4998 	mov farptr,#1 
      001C4B                       4999 dir_loop:
      009A25 20               [ 1] 5000 	clrw x 
      009A26 70 6F 69 6E      [ 5] 5001 	ldf a,([farptr],x)
      009A2A 74 2C            [ 1] 5002 	jreq 8$ 
      001C52                       5003 1$: ;name loop 	
      009A2C 20 52 55 4E      [ 5] 5004 	ldf a,([farptr],x)
      009A30 20 74            [ 1] 5005 	jreq 2$ 
      009A32 6F 20 72         [ 4] 5006 	call putc 
      009A35 65               [ 2] 5007 	incw x 
      009A36 73 75            [ 2] 5008 	jra 1$
      009A38 6D               [ 2] 5009 2$: incw x ; skip ending 0. 
      009A39 65 2E            [ 1] 5010 	ld a,#SPACE 
      009A3B 0A 00 C0         [ 4] 5011 	call putc 
                                   5012 ; get file size 	
      009A3D 92 AF 00 16      [ 5] 5013 	ldf a,([farptr],x)
      009A3D 72 01            [ 1] 5014 	ld yh,a 
      009A3F 00               [ 2] 5015 	incw x 
      009A40 24 01 81 16      [ 5] 5016 	ldf a,([farptr],x)
      009A43 5C               [ 2] 5017 	incw x 
      009A43 CD 87            [ 1] 5018 	ld yl,a 
      009A45 67 81            [ 2] 5019 	pushw y 
      009A47 72 FB 01         [ 2] 5020 	addw x,(1,sp)
                                   5021 ; skip to next file 
      009A47 AE 16 E0         [ 4] 5022 	call incr_farptr
      009A4A A6 80 7F         [ 4] 5023 	call row_align
                                   5024 ; print file size 
      009A4D 5C               [ 2] 5025 	popw x ; file size 
      009A4E 4A 26 FB         [ 4] 5026 	call print_int 
      009A51 81 0D            [ 1] 5027 	ld a,#CR 
      009A52 CD 02 C0         [ 4] 5028 	call putc
      009A52 A6 7F            [ 2] 5029 	ldw x,(COUNT,sp)
      009A54 C4               [ 2] 5030 	incw x
      009A55 00 19            [ 2] 5031 	ldw (COUNT,sp),x  
      009A57 27 13            [ 2] 5032 	jra dir_loop
      001C8D                       5033 8$: ; print number of files 
      009A59 CE 00            [ 2] 5034 	ldw x,(COUNT,sp)
      009A5B 18 1C 00         [ 4] 5035 	call print_int 
      009A5E 80 24 04         [ 2] 5036 	ldw x,#file_count 
      009A61 72 5C 00         [ 4] 5037 	call puts  
                                   5038 ; print drive free space 	
      009A64 17 9F A4         [ 4] 5039 	call disk_free
      009A67 80               [ 1] 5040 	clrw x  
      009A68 97 CF 00 18      [ 1] 5041 	mov base,#10 
      009A6C 81 09 DA         [ 4] 5042 	call prti24 
      009A6D AE 1C B4         [ 2] 5043 	ldw x,#drive_free
      009A6D 72 BB 00         [ 4] 5044 	call puts 
      001CA9                       5045 	_drop VSIZE 
      009A70 18 24            [ 2]    1     addw sp,#VSIZE 
      009A72 04               [ 4] 5046 	ret
      009A73 72 5C 00 17 CF 00 18  5047 file_count: .asciz " files\n"
             81
      009A7B 20 62 79 74 65 73 20  5048 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5049 
                                   5050 ;---------------------
                                   5051 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5052 ; write 1 or more byte to FLASH or EEPROM
                                   5053 ; starting at address  
                                   5054 ; input:
                                   5055 ;   expr1  	is address 
                                   5056 ;   expr2,...,exprn   are bytes to write
                                   5057 ; output:
                                   5058 ;   none 
                                   5059 ;---------------------
                           000001  5060 	ADDR=1
                           000002  5061 	VSIZ=2 
      001CC1                       5062 write:
      001CC1                       5063 	_vars VSIZE 
      009A7B A6 01            [ 2]    1     sub sp,#VSIZE 
      009A7D C7 00 17 5F      [ 1] 5064 	clr farptr ; expect 16 bits address 
      009A81 CF 00 18         [ 4] 5065 	call expression
      009A84 A1 84            [ 1] 5066 	cp a,#TK_INTGR 
      009A84 AE 00            [ 1] 5067 	jreq 0$
      009A86 03 92 AF         [ 2] 5068 	jp syntax_error
      009A89 00 17            [ 2] 5069 0$: ldw (ADDR,sp),x 
      009A8B 26 05 5A         [ 4] 5070 	call next_token 
      009A8E 2A F7            [ 1] 5071 	cp a,#TK_COMMA 
      009A90 20 0E            [ 1] 5072 	jreq 1$ 
      009A92 AE 00            [ 2] 5073 	jra 9$ 
      009A94 80 CD 9A         [ 4] 5074 1$:	call expression
      009A97 6D AE            [ 1] 5075 	cp a,#TK_INTGR
      009A99 02 80            [ 1] 5076 	jreq 2$
      009A9B C3 00 17         [ 2] 5077 	jp syntax_error
      009A9E 2B               [ 1] 5078 2$:	ld a,xl 
      009A9F E4 01            [ 2] 5079 	ldw x,(ADDR,sp) 
      009AA0 CF 00 17         [ 2] 5080 	ldw farptr+1,x 
      009AA0 CE               [ 1] 5081 	clrw x 
      009AA1 00 17 C6         [ 4] 5082 	call write_byte
      009AA4 00 19            [ 2] 5083 	ldw x,(ADDR,sp)
      009AA6 CF               [ 2] 5084 	incw x 
      009AA7 00 1A            [ 2] 5085 	jra 0$ 
      001CF5                       5086 9$:
      001CF5                       5087 	_drop VSIZE
      009AA9 C7 00            [ 2]    1     addw sp,#VSIZE 
      009AAB 1C               [ 4] 5088 	ret 
                                   5089 
                                   5090 
                                   5091 ;---------------------
                                   5092 ;BASIC: CHAR(expr)
                                   5093 ; évaluate expression 
                                   5094 ; and take the 7 least 
                                   5095 ; bits as ASCII character
                                   5096 ;---------------------
      001CF8                       5097 char:
      009AAC 81 10 11         [ 4] 5098 	call func_args 
      009AAD A1 01            [ 1] 5099 	cp a,#1
      009AAD AE 80            [ 1] 5100 	jreq 1$
      009AAF 00 72 B0         [ 2] 5101 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AB2 00               [ 2] 5102 1$:	popw x 
      009AB3 1B               [ 1] 5103 	ld a,xl 
      009AB4 A6 02            [ 1] 5104 	and a,#0x7f 
      009AB6 C2               [ 1] 5105 	ld xl,a
      009AB7 00 1A            [ 1] 5106 	ld a,#TK_CHAR
      009AB9 C7               [ 4] 5107 	ret
                                   5108 
                                   5109 ;---------------------
                                   5110 ; BASIC: ASC(string|char)
                                   5111 ; extract first character 
                                   5112 ; of string argument 
                                   5113 ; return it as TK_INTGR 
                                   5114 ;---------------------
      001D0A                       5115 ascii:
      009ABA 00 0C            [ 1] 5116 	ld a,#TK_LPAREN
      009ABC CF 00 0D         [ 4] 5117 	call expect 
      009ABF 81 09 6D         [ 4] 5118 	call next_token 
      009AC0 A1 02            [ 1] 5119 	cp a,#TK_QSTR 
      009AC0 5F 92            [ 1] 5120 	jreq 1$
      009AC2 AF 00            [ 1] 5121 	cp a,#TK_CHAR 
      009AC4 17 90            [ 1] 5122 	jreq 2$ 
      009AC6 F1 26 08         [ 2] 5123 	jp syntax_error
      001D1D                       5124 1$: 
      009AC9 4D               [ 1] 5125 	ld a,(x) 
      009ACA 27               [ 1] 5126 	clrw x
      009ACB 12               [ 1] 5127 	ld xl,a 
      001D20                       5128 2$: 
      009ACC 5C               [ 2] 5129 	pushw x 
      009ACD 90 5C            [ 1] 5130 	ld a,#TK_RPAREN 
      009ACF 20 F0 04         [ 4] 5131 	call expect
      009AD1 85               [ 2] 5132 	popw x 
      009AD1 4D 27            [ 1] 5133 	ld a,#TK_INTGR 
      009AD3 07               [ 4] 5134 	ret 
                                   5135 
                                   5136 ;---------------------
                                   5137 ;BASIC: KEY
                                   5138 ; wait for a character 
                                   5139 ; received from STDIN 
                                   5140 ; input:
                                   5141 ;	none 
                                   5142 ; output:
                                   5143 ;	X 		ASCII character 
                                   5144 ;---------------------
      001D2A                       5145 key:
      009AD4 5C 92 AF         [ 4] 5146 	call getc 
      009AD7 00               [ 1] 5147 	clrw x 
      009AD8 17               [ 1] 5148 	ld xl,a 
      009AD9 20 F6            [ 1] 5149 	ld a,#TK_INTGR
      009ADB 5C               [ 4] 5150 	ret
                                   5151 
                                   5152 ;----------------------
                                   5153 ; BASIC: QKEY
                                   5154 ; Return true if there 
                                   5155 ; is a character in 
                                   5156 ; waiting in STDIN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5157 ; input:
                                   5158 ;  none 
                                   5159 ; output:
                                   5160 ;   X 		0|-1 
                                   5161 ;-----------------------
      001D32                       5162 qkey:: 
      009ADC 98               [ 1] 5163 	clrw x 
      009ADD 81 00 2D         [ 1] 5164 	ld a,rx_head
      009ADE C1 00 2E         [ 1] 5165 	cp a,rx_tail 
      009ADE 5C 99            [ 1] 5166 	jreq 9$ 
      009AE0 81               [ 2] 5167 	cplw x 
      009AE1 A6 84            [ 1] 5168 9$: ld a,#TK_INTGR
      009AE1 52               [ 4] 5169 	ret 
                                   5170 
                                   5171 ;---------------------
                                   5172 ; BASIC: GPIO(expr,reg)
                                   5173 ; return gpio address 
                                   5174 ; expr {0..8}
                                   5175 ; input:
                                   5176 ;   none 
                                   5177 ; output:
                                   5178 ;   X 		gpio register address
                                   5179 ;----------------------------
                           000003  5180 	PORT=3
                           000001  5181 	REG=1 
                           000004  5182 	VSIZE=4 
      001D3F                       5183 gpio:
      009AE2 04 17 03         [ 4] 5184 	call func_args 
      009AE5 5F CF            [ 1] 5185 	cp a,#2
      009AE7 00 18            [ 1] 5186 	jreq 1$
      009AE9 35 01 00         [ 2] 5187 	jp syntax_error  
      001D49                       5188 1$:	
      009AEC 17 03            [ 2] 5189 	ldw x,(PORT,sp)
      009AED 2B 17            [ 1] 5190 	jrmi bad_port
      009AED 92 BC 00         [ 2] 5191 	cpw x,#9
      009AF0 17 27            [ 1] 5192 	jrpl bad_port
      009AF2 27 5F            [ 1] 5193 	ld a,#5
      009AF4 16               [ 4] 5194 	mul x,a
      009AF5 03 CD 9A         [ 2] 5195 	addw x,#GPIO_BASE 
      009AF8 C0 25            [ 2] 5196 	ldw (PORT,sp),x  
      009AFA 2F 92            [ 2] 5197 	ldw x,(REG,sp) 
      009AFC AF 00 17         [ 2] 5198 	addw x,(PORT,sp)
      009AFF 6B 01            [ 1] 5199 	ld a,#TK_INTGR
      001D61                       5200 	_drop VSIZE 
      009B01 5C 92            [ 2]    1     addw sp,#VSIZE 
      009B03 AF               [ 4] 5201 	ret
      001D64                       5202 bad_port:
      009B04 00 17            [ 1] 5203 	ld a,#ERR_BAD_VALUE
      009B06 6B 02 5C         [ 2] 5204 	jp tb_error
                                   5205 
                                   5206 
                                   5207 ;-------------------------
                                   5208 ; BASIC: UFLASH 
                                   5209 ; return user flash address
                                   5210 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5211 ;  none 
                                   5212 ; output:
                                   5213 ;	A		TK_INTGR
                                   5214 ;   X 		user address 
                                   5215 ;---------------------------
      001D69                       5216 uflash:
      009B09 72 FB 01         [ 2] 5217 	ldw x,#user_space 
      009B0C CD 9A            [ 1] 5218 	ld a,#TK_INTGR 
      009B0E 6D               [ 4] 5219 	ret 
                                   5220 
                                   5221 
                                   5222 ;---------------------
                                   5223 ; BASIC: USR(addr[,arg])
                                   5224 ; execute a function written 
                                   5225 ; in binary code.
                                   5226 ; binary fonction should 
                                   5227 ; return token attribute in A 
                                   5228 ; and value in X. 
                                   5229 ; input:
                                   5230 ;   addr	routine address 
                                   5231 ;   arg 	is an optional argument 
                                   5232 ; output:
                                   5233 ;   A 		token attribute 
                                   5234 ;   X       returned value 
                                   5235 ;---------------------
      001D6F                       5236 usr:
      009B0F CD 9A            [ 2] 5237 	pushw y 	
      009B11 52 AE 02         [ 4] 5238 	call func_args 
      009B14 80 C3            [ 1] 5239 	cp a,#1 
      009B16 00 17            [ 1] 5240 	jreq 2$
      009B18 2A D3            [ 1] 5241 	cp a,#2
      009B1A 27 03            [ 1] 5242 	jreq 2$  
      009B1A 72 5F 00         [ 2] 5243 	jp syntax_error 
      009B1D 17 72            [ 2] 5244 2$: popw y  ; arg|addr 
      009B1F 5F 00            [ 1] 5245 	cp a,#1
      009B21 18 72            [ 1] 5246 	jreq 3$
      009B23 5F               [ 2] 5247 	popw x ; addr
      009B24 00               [ 1] 5248 	exgw x,y 
      009B25 19 5B            [ 4] 5249 3$: call (y)
      009B27 04 98            [ 2] 5250 	popw y 
      009B29 81               [ 4] 5251 	ret 
                                   5252 
                                   5253 ;------------------------------
                                   5254 ; BASIC: BYE 
                                   5255 ; halt mcu in its lowest power mode 
                                   5256 ; wait for reset or external interrupt
                                   5257 ; do a cold start on wakeup.
                                   5258 ;------------------------------
      009B2A                       5259 bye:
      009B2A 5B 04 99 81 FB   [ 2] 5260 	btjf UART1_SR,#UART_SR_TC,.
      009B2E 8E               [10] 5261 	halt
      009B2E 72 01 00         [ 2] 5262 	jp cold_start  
                                   5263 
                                   5264 ;----------------------------------
                                   5265 ; BASIC: AUTORUN ["file_name"] 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5266 ; record in eeprom at adrress AUTORUN_NAME
                                   5267 ; the name of file to load and execute
                                   5268 ; at startup. 
                                   5269 ; empty string delete autorun name 
                                   5270 ; no argument display autorun name  
                                   5271 ; input:
                                   5272 ;   file_name   file to execute 
                                   5273 ; output:
                                   5274 ;   none
                                   5275 ;-----------------------------------
      001D95                       5276 autorun: 
      009B31 24 05 A6 07 CC   [ 2] 5277 	btjf flags,#FRUN,0$ 
      009B36 88 FD            [ 1] 5278 	jreq 0$ 
      009B38 A6 07            [ 1] 5279 	ld a,#ERR_CMD_ONLY 
      009B38 CE 00 1F         [ 2] 5280 	jp tb_error 
      001DA1                       5281 0$:	
      009B3B 72 B0 00         [ 4] 5282 	call next_token
      009B3E 1D 26            [ 1] 5283 	jrne 1$
      009B40 0C AE 88         [ 2] 5284 	ldw x,#AUTORUN_NAME
      009B43 96 CD A8         [ 4] 5285 	call puts 
      009B46 C0               [ 1] 5286 	clr a 
      009B47 55               [ 4] 5287 	ret 
      001DAE                       5288 1$:
      009B48 00 04            [ 1] 5289 	cp a,#TK_QSTR
      009B4A 00 02            [ 1] 5290 	jreq 2$
      009B4C 81 08 7B         [ 2] 5291 	jp syntax_error 
      009B4D                       5292 2$:	
      009B4D 52               [ 1] 5293 	tnz (x) 
      009B4E 08 1F            [ 1] 5294 	jrne 3$
                                   5295 ; empty string, delete autorun 	
      009B50 01 CD 89         [ 4] 5296 	call cancel_autorun
      009B53 ED A1 02 27 03   [ 1] 5297 	mov in,count 
      009B58 CC               [ 4] 5298 	ret 
      009B59 88               [ 2] 5299 3$:	pushw x 
      009B5A FB 93            [ 1] 5300 	ldw y,x  
      009B5B CD 1A 61         [ 4] 5301 	call search_file 
      009B5B 1F 03            [ 1] 5302 	jrc 4$ 
      009B5D CD 81            [ 1] 5303 	ld a,#ERR_NOT_FILE
      009B5F F4 CD 84         [ 2] 5304 	jp tb_error  
      001DCE                       5305 4$: 
      009B62 16 1C 00 03 72   [ 1] 5306 	mov in,count 
      009B67 FB 01 4F 72      [ 1] 5307 	clr farptr 
      009B6B BB 00 1B         [ 2] 5308 	ldw x,#AUTORUN_NAME
      009B6E C9 00 1A         [ 2] 5309 	ldw farptr+1,x 
      009B71 A1 02            [ 2] 5310 	ldw x,(1,sp)  
      009B73 2B 0A A3         [ 4] 5311 	call strlen  ; return length in X 
      009B76 80               [ 2] 5312 	incw x 
      009B77 00 2B            [ 2] 5313 	popw y 
      009B79 05               [ 2] 5314 	pushw x 
      009B7A A6               [ 1] 5315 	clrw x 
      009B7B 0E CC 88         [ 4] 5316 	call write_block 
      001DEA                       5317 	_drop 2 
      009B7E FD 02            [ 2]    1     addw sp,#2 
      009B7F 81               [ 4] 5318 	ret 
                                   5319 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5320 ;----------------------------------
                                   5321 ; BASIC: SLEEP 
                                   5322 ; halt mcu until reset or external
                                   5323 ; interrupt.
                                   5324 ; Resume progam after SLEEP command
                                   5325 ;----------------------------------
      001DED                       5326 sleep:
      009B7F 16 03 CD 9A E1   [ 2] 5327 	btjf UART1_SR,#UART_SR_TC,.
      009B84 24 05 A6 08      [ 1] 5328 	bset flags,#FSLEEP
      009B88 CC               [10] 5329 	halt 
      009B89 88               [ 4] 5330 	ret 
                                   5331 
                                   5332 ;-------------------------------
                                   5333 ; BASIC: PAUSE expr 
                                   5334 ; suspend execution for n msec.
                                   5335 ; input:
                                   5336 ;	none
                                   5337 ; output:
                                   5338 ;	none 
                                   5339 ;------------------------------
      001DF8                       5340 pause:
      009B8A FD 11 0F         [ 4] 5341 	call expression
      009B8B A1 84            [ 1] 5342 	cp a,#TK_INTGR
      009B8B CE 00            [ 1] 5343 	jreq pause02 
      009B8D 1A C6 00         [ 2] 5344 	jp syntax_error
      001E02                       5345 pause02: 
      009B90 1C               [ 2] 5346 1$: tnzw x 
      009B91 CF 00            [ 1] 5347 	jreq 2$
      009B93 17               [10] 5348 	wfi 
      009B94 C7               [ 2] 5349 	decw x 
      009B95 00 19            [ 1] 5350 	jrne 1$
      009B97 16               [ 1] 5351 2$:	clr a 
      009B98 03               [ 4] 5352 	ret 
                                   5353 
                                   5354 ;------------------------------
                                   5355 ; BASIC: AWU expr
                                   5356 ; halt mcu for 'expr' milliseconds
                                   5357 ; use Auto wakeup peripheral
                                   5358 ; all oscillators stopped except LSI
                                   5359 ; range: 1ms - 511ms
                                   5360 ; input:
                                   5361 ;  none
                                   5362 ; output:
                                   5363 ;  none:
                                   5364 ;------------------------------
      001E0B                       5365 awu:
      009B99 AE 16 E0         [ 4] 5366   call expression
      009B9C CD 84            [ 1] 5367   cp a,#TK_INTGR
      009B9E 34 CD            [ 1] 5368   jreq awu02
      009BA0 84 16 5C         [ 2] 5369   jp syntax_error
      001E15                       5370 awu02:
      009BA3 1C 16 E0         [ 2] 5371   cpw x,#5120
      009BA6 16 01            [ 1] 5372   jrmi 1$ 
      009BA8 FF 1C 00 02      [ 1] 5373   mov AWU_TBR,#15 
      009BAC 90 CE            [ 1] 5374   ld a,#30
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009BAE 00               [ 2] 5375   div x,a
      009BAF 1D 90            [ 1] 5376   ld a,#16
      009BB1 F6               [ 2] 5377   div x,a 
      009BB2 90 5C            [ 2] 5378   jra 4$
      001E26                       5379 1$: 
      009BB4 F7 5C 90         [ 2] 5380   cpw x,#2048
      009BB7 C3 00            [ 1] 5381   jrmi 2$ 
      009BB9 1F 27 05 A3      [ 1] 5382   mov AWU_TBR,#14
      009BBD 17 60            [ 1] 5383   ld a,#80
      009BBF 2B               [ 2] 5384   div x,a 
      009BC0 EF 10            [ 2] 5385   jra 4$   
      009BC1                       5386 2$:
      009BC1 17 07 50 F2      [ 1] 5387   mov AWU_TBR,#7
      009BC3                       5388 3$:  
                                   5389 ; while X > 64  divide by 2 and increment AWU_TBR 
      009BC3 A3 17 60         [ 2] 5390   cpw x,#64 
      009BC6 27 04            [ 2] 5391   jrule 4$ 
      009BC8 7F 5C 20 F7      [ 1] 5392   inc AWU_TBR 
      009BCC 54               [ 2] 5393   srlw x 
      009BCC AE 16            [ 2] 5394   jra 3$ 
      001E44                       5395 4$:
      009BCE E0               [ 1] 5396   ld a, xl
      009BCF CD               [ 1] 5397   dec a 
      009BD0 82 08            [ 1] 5398   jreq 5$
      009BD2 AE               [ 1] 5399   dec a 	
      001E49                       5400 5$: 
      009BD3 00 80            [ 1] 5401   and a,#0x3e 
      009BD5 CD 9A 6D         [ 1] 5402   ld AWU_APR,a 
      009BD8 AE 16 E0 16      [ 1] 5403   bset AWU_CSR,#AWU_CSR_AWUEN
      009BDC 07               [10] 5404   halt 
                                   5405 
      009BDD 90               [ 4] 5406   ret 
                                   5407 
                                   5408 ;------------------------------
                                   5409 ; BASIC: TICKS
                                   5410 ; return msec ticks counter value 
                                   5411 ; input:
                                   5412 ; 	none 
                                   5413 ; output:
                                   5414 ;	X 		TK_INTGR
                                   5415 ;-------------------------------
      001E54                       5416 get_ticks:
      009BDE C3 00 1F         [ 2] 5417 	ldw x,ticks 
      009BE1 2B CD            [ 1] 5418 	ld a,#TK_INTGR
      009BE3 CE               [ 4] 5419 	ret 
                                   5420 
                                   5421 
                                   5422 
                                   5423 ;------------------------------
                                   5424 ; BASIC: ABS(expr)
                                   5425 ; return absolute value of expr.
                                   5426 ; input:
                                   5427 ;   none
                                   5428 ; output:
                                   5429 ;   X     	positive integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5430 ;-------------------------------
      001E5A                       5431 abs:
      009BE4 00 17 C6         [ 4] 5432 	call func_args 
      009BE7 00 19            [ 1] 5433 	cp a,#1 
      009BE9 CF 00            [ 1] 5434 	jreq 0$ 
      009BEB 1A C7 00         [ 2] 5435 	jp syntax_error
      001E64                       5436 0$:  
      009BEE 1C               [ 2] 5437     popw x   
      009BEF 1E               [ 1] 5438 	ld a,xh 
      009BF0 01 CD            [ 1] 5439 	bcp a,#0x80 
      009BF2 8A 4A            [ 1] 5440 	jreq 2$ 
      009BF4 5B               [ 2] 5441 	negw x 
      009BF5 08 81            [ 1] 5442 2$: ld a,#TK_INTGR 
      009BF7 81               [ 4] 5443 	ret 
                                   5444 
                                   5445 ;------------------------------
                                   5446 ; BASIC: AND(expr1,expr2)
                                   5447 ; Apply bit AND relation between
                                   5448 ; the 2 arguments, i.e expr1 & expr2 
                                   5449 ; output:
                                   5450 ; 	A 		TK_INTGR
                                   5451 ;   X 		result 
                                   5452 ;------------------------------
      001E6E                       5453 bit_and:
      009BF7 CD 9A 6D         [ 4] 5454 	call func_args 
      009BFA CD 87            [ 1] 5455 	cp a,#2
      009BFC 67 5F            [ 1] 5456 	jreq 1$
      009BFE 92 AF 00         [ 2] 5457 	jp syntax_error 
      009C01 17               [ 2] 5458 1$:	popw x 
      009C02 90               [ 1] 5459 	ld a,xh 
      009C03 95 5C            [ 1] 5460 	and a,(1,sp)
      009C05 92               [ 1] 5461 	ld xh,a 
      009C06 AF               [ 1] 5462 	ld a,xl
      009C07 00 17            [ 1] 5463 	and a,(2,sp)
      009C09 5C               [ 1] 5464 	ld xl,a 
      001E81                       5465 	_drop 2 
      009C0A 90 97            [ 2]    1     addw sp,#2 
      009C0C 72 B9            [ 1] 5466 	ld a,#TK_INTGR
      009C0E 00               [ 4] 5467 	ret
                                   5468 
                                   5469 ;------------------------------
                                   5470 ; BASIC: OR(expr1,expr2)
                                   5471 ; Apply bit OR relation between
                                   5472 ; the 2 arguments, i.e expr1 | expr2 
                                   5473 ; output:
                                   5474 ; 	A 		TK_INTGR
                                   5475 ;   X 		result 
                                   5476 ;------------------------------
      001E86                       5477 bit_or:
      009C0F 1D 90 CF         [ 4] 5478 	call func_args 
      009C12 00 1F            [ 1] 5479 	cp a,#2
      009C14 90 CE            [ 1] 5480 	jreq 1$
      009C16 00 1D 7B         [ 2] 5481 	jp syntax_error 
      009C18                       5482 1$: 
      009C18 92               [ 2] 5483 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C19 AF               [ 1] 5484 	ld a,xh 
      009C1A 00 17            [ 1] 5485 	or a,(1,sp)
      009C1C 90               [ 1] 5486 	ld xh,a 
      009C1D F7               [ 1] 5487 	ld a,xl 
      009C1E 5C 90            [ 1] 5488 	or a,(2,sp)
      009C20 5C               [ 1] 5489 	ld xl,a 
      001E99                       5490 	_drop 2 
      009C21 90 C3            [ 2]    1     addw sp,#2 
      009C23 00 1F            [ 1] 5491 	ld a,#TK_INTGR 
      009C25 2B               [ 4] 5492 	ret
                                   5493 
                                   5494 ;------------------------------
                                   5495 ; BASIC: XOR(expr1,expr2)
                                   5496 ; Apply bit XOR relation between
                                   5497 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5498 ; output:
                                   5499 ; 	A 		TK_INTGR
                                   5500 ;   X 		result 
                                   5501 ;------------------------------
      001E9E                       5502 bit_xor:
      009C26 F1 81 11         [ 4] 5503 	call func_args 
      009C28 A1 02            [ 1] 5504 	cp a,#2
      009C28 72 01            [ 1] 5505 	jreq 1$
      009C2A 00 24 07         [ 2] 5506 	jp syntax_error 
      001EA8                       5507 1$: 
      009C2D 27               [ 2] 5508 	popw x 
      009C2E 05               [ 1] 5509 	ld a,xh 
      009C2F A6 07            [ 1] 5510 	xor a,(1,sp)
      009C31 CC               [ 1] 5511 	ld xh,a 
      009C32 88               [ 1] 5512 	ld a,xl 
      009C33 FD 02            [ 1] 5513 	xor a,(2,sp)
      009C34 97               [ 1] 5514 	ld xl,a 
      001EB1                       5515 	_drop 2 
      009C34 CD 89            [ 2]    1     addw sp,#2 
      009C36 ED A1            [ 1] 5516 	ld a,#TK_INTGR 
      009C38 02               [ 4] 5517 	ret 
                                   5518 
                                   5519 ;------------------------------
                                   5520 ; BASIC: LSHIFT(expr1,expr2)
                                   5521 ; logical shift left expr1 by 
                                   5522 ; expr2 bits 
                                   5523 ; output:
                                   5524 ; 	A 		TK_INTGR
                                   5525 ;   X 		result 
                                   5526 ;------------------------------
      001EB6                       5527 lshift:
      009C39 27 03 CC         [ 4] 5528 	call func_args
      009C3C 88 FB            [ 1] 5529 	cp a,#2 
      009C3E 90 93            [ 1] 5530 	jreq 1$
      009C40 CD 9A E1         [ 2] 5531 	jp syntax_error
      009C43 25 05            [ 2] 5532 1$: popw y   
      009C45 A6               [ 2] 5533 	popw x 
      009C46 09 CC            [ 2] 5534 	tnzw y 
      009C48 88 FD            [ 1] 5535 	jreq 4$
      009C4A 58               [ 2] 5536 2$:	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C4A CD 9B            [ 2] 5537 	decw y 
      009C4C F7 CE            [ 1] 5538 	jrne 2$
      001ECC                       5539 4$:  
      009C4E 00 1F            [ 1] 5540 	ld a,#TK_INTGR
      009C50 72               [ 4] 5541 	ret
                                   5542 
                                   5543 ;------------------------------
                                   5544 ; BASIC: RSHIFT(expr1,expr2)
                                   5545 ; logical shift right expr1 by 
                                   5546 ; expr2 bits.
                                   5547 ; output:
                                   5548 ; 	A 		TK_INTGR
                                   5549 ;   X 		result 
                                   5550 ;------------------------------
      001ECF                       5551 rshift:
      009C51 B0 00 1D         [ 4] 5552 	call func_args
      009C54 CD 8A            [ 1] 5553 	cp a,#2 
      009C56 4A 81            [ 1] 5554 	jreq 1$
      009C58 CC 08 7B         [ 2] 5555 	jp syntax_error
      009C58 52 03            [ 2] 5556 1$: popw y  
      009C5A CD               [ 2] 5557 	popw x
      009C5B 89 ED            [ 2] 5558 	tnzw y 
      009C5D A1 00            [ 1] 5559 	jreq 4$
      009C5F 27               [ 2] 5560 2$:	srlw x 
      009C60 20 A1            [ 2] 5561 	decw y 
      009C62 02 27            [ 1] 5562 	jrne 2$
      001EE5                       5563 4$:  
      009C64 03 CC            [ 1] 5564 	ld a,#TK_INTGR
      009C66 88               [ 4] 5565 	ret
                                   5566 
                                   5567 ;--------------------------
                                   5568 ; BASIC: FCPU integer
                                   5569 ; set CPU frequency 
                                   5570 ;-------------------------- 
                                   5571 
      001EE8                       5572 fcpu:
      009C67 FB 90            [ 1] 5573 	ld a,#TK_INTGR
      009C69 93 55 00         [ 4] 5574 	call expect 
      009C6C 04               [ 1] 5575 	ld a,xl 
      009C6D 00 02            [ 1] 5576 	and a,#7 
      009C6F CD 9A E1         [ 1] 5577 	ld CLK_CKDIVR,a 
      009C72 25               [ 4] 5578 	ret 
                                   5579 
                                   5580 ;------------------------------
                                   5581 ; BASIC: PMODE pin#, mode 
                                   5582 ; Arduino pin. 
                                   5583 ; define pin as input or output
                                   5584 ; pin#: {0..15}
                                   5585 ; mode: INPUT|OUTPUT  
                                   5586 ;------------------------------
                           000001  5587 	PINNO=1
                           000001  5588 	VSIZE=1
      001EF4                       5589 pin_mode:
      001EF4                       5590 	_vars VSIZE 
      009C73 05 A6            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C75 09 CC 88         [ 4] 5591 	call arg_list 
      009C78 FD 02            [ 1] 5592 	cp a,#2 
      009C79 27 03            [ 1] 5593 	jreq 1$
      009C79 CE 00 17         [ 2] 5594 	jp syntax_error 
      009C7C C6 00            [ 2] 5595 1$: popw y ; mode 
      009C7E 19               [ 2] 5596 	popw x ; Dx pin 
      009C7F 20 0A 35         [ 4] 5597 	call select_pin 
      009C81 6B 01            [ 1] 5598 	ld (PINNO,sp),a  
      009C81 AE 01            [ 1] 5599 	ld a,#1 
      009C83 00 4F            [ 1] 5600 	tnz (PINNO,sp)
      009C85 CF 00            [ 1] 5601 	jreq 4$
      009C87 17               [ 1] 5602 2$:	sll a 
      009C88 C7 00            [ 1] 5603 	dec (PINNO,sp)
      009C8A 19 FB            [ 1] 5604 	jrne 2$ 
      009C8B 6B 01            [ 1] 5605 	ld (PINNO,sp),a
      009C8B 1F 01            [ 1] 5606 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C8D 6B 03            [ 1] 5607 	ld (GPIO_CR1,x),a 
      009C8F CD 81 C0 CD      [ 2] 5608 4$:	cpw y,#OUTP 
      009C93 82 3B            [ 1] 5609 	jreq 6$
                                   5610 ; input mode
      009C95 AE 00            [ 1] 5611 	ld a,(PINNO,sp)
      009C97 80               [ 1] 5612 	cpl a 
      009C98 CD 9A            [ 1] 5613 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C9A 6D CD            [ 2] 5614 	jra 9$
      001F26                       5615 6$: ;output mode  
      009C9C 9A 52            [ 1] 5616 	ld a,(PINNO,sp)
      009C9E C6 00            [ 1] 5617 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009CA0 19 C0            [ 1] 5618 	ld (GPIO_CR2,x),a 
      009CA2 00 1C            [ 1] 5619 	ld a,(PINNO,sp)
      009CA4 C6 00            [ 1] 5620 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009CA6 18 C2            [ 1] 5621 9$:	ld (GPIO_DDR,x),a 
      001F32                       5622 	_drop VSIZE 
      009CA8 00 1B            [ 2]    1     addw sp,#VSIZE 
      009CAA C6               [ 4] 5623 	ret
                                   5624 
                                   5625 ;------------------------
                                   5626 ; select Arduino pin 
                                   5627 ; input:
                                   5628 ;   X 	 {0..15} Arduino Dx 
                                   5629 ; output:
                                   5630 ;   A     stm8s208 pin 
                                   5631 ;   X     base address s208 GPIO port 
                                   5632 ;---------------------------
      001F35                       5633 select_pin:
      009CAB 00               [ 2] 5634 	sllw x 
      009CAC 17 C2 00         [ 2] 5635 	addw x,#arduino_to_8s208 
      009CAF 1A               [ 2] 5636 	ldw x,(x)
      009CB0 2B               [ 1] 5637 	ld a,xl 
      009CB1 E0               [ 1] 5638 	push a 
      009CB2 7B               [ 1] 5639 	swapw x 
      009CB3 03 1E            [ 1] 5640 	ld a,#5 
      009CB5 01               [ 4] 5641 	mul x,a 
      009CB6 C7 00 1C         [ 2] 5642 	addw x,#GPIO_BASE 
      009CB9 CF               [ 1] 5643 	pop a 
      009CBA 00               [ 4] 5644 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5645 ; translation from Arduino D0..D15 to stm8s208rb 
      001F45                       5646 arduino_to_8s208:
      009CBB 1A 5B                 5647 .byte 3,6 ; D0 
      009CBD 03 81                 5648 .byte 3,5 ; D1 
      009CBF 04 00                 5649 .byte 4,0 ; D2 
      009CBF 52 02                 5650 .byte 2,1 ; D3
      009CC1 5F 1F                 5651 .byte 6,0 ; D4
      009CC3 01 CF                 5652 .byte 2,2 ; D5
      009CC5 00 18                 5653 .byte 2,3 ; D6
      009CC7 35 01                 5654 .byte 3,1 ; D7
      009CC9 00 17                 5655 .byte 3,3 ; D8
      009CCB 02 04                 5656 .byte 2,4 ; D9
      009CCB 5F 92                 5657 .byte 4,5 ; D10
      009CCD AF 00                 5658 .byte 2,6 ; D11
      009CCF 17 27                 5659 .byte 2,7 ; D12
      009CD1 3B 05                 5660 .byte 2,5 ; D13
      009CD2 04 02                 5661 .byte 4,2 ; D14
      009CD2 92 AF                 5662 .byte 4,1 ; D15
                                   5663 
                                   5664 
                                   5665 ;------------------------------
                                   5666 ; BASIC: RND(expr)
                                   5667 ; return random number 
                                   5668 ; between 1 and expr inclusive
                                   5669 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5670 ; input:
                                   5671 ; 	none 
                                   5672 ; output:
                                   5673 ;	X 		random positive integer 
                                   5674 ;------------------------------
      001F65                       5675 random:
      009CD4 00 17 27         [ 4] 5676 	call func_args 
      009CD7 06 CD            [ 1] 5677 	cp a,#1
      009CD9 83 40            [ 1] 5678 	jreq 1$
      009CDB 5C 20 F4         [ 2] 5679 	jp syntax_error
      001F6F                       5680 1$:  
      009CDE 5C A6            [ 1] 5681 	ld a,#0x80 
      009CE0 20 CD            [ 1] 5682 	bcp a,(1,sp)
      009CE2 83 40            [ 1] 5683 	jreq 2$
      009CE4 92 AF            [ 1] 5684 	ld a,#ERR_BAD_VALUE
      009CE6 00 17 90         [ 2] 5685 	jp tb_error
      001F7A                       5686 2$: 
                                   5687 ; acc16=(x<<5)^x 
      009CE9 95 5C 92         [ 2] 5688 	ldw x,seedx 
      009CEC AF               [ 2] 5689 	sllw x 
      009CED 00               [ 2] 5690 	sllw x 
      009CEE 17               [ 2] 5691 	sllw x 
      009CEF 5C               [ 2] 5692 	sllw x 
      009CF0 90               [ 2] 5693 	sllw x 
      009CF1 97               [ 1] 5694 	ld a,xh 
      009CF2 90 89 72         [ 1] 5695 	xor a,seedx 
      009CF5 FB 01 CD         [ 1] 5696 	ld acc16,a 
      009CF8 9A               [ 1] 5697 	ld a,xl 
      009CF9 6D CD 9A         [ 1] 5698 	xor a,seedx+1 
      009CFC 52 85 CD         [ 1] 5699 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5700 ; seedx=seedy 
      009CFF 8A 4A A6         [ 2] 5701 	ldw x,seedy 
      009D02 0D CD 83         [ 2] 5702 	ldw seedx,x  
                                   5703 ; seedy=seedy^(seedy>>1)
      009D05 40 1E            [ 2] 5704 	srlw y 
      009D07 01 5C            [ 1] 5705 	ld a,yh 
      009D09 1F 01 20         [ 1] 5706 	xor a,seedy 
      009D0C BE 00 14         [ 1] 5707 	ld seedy,a  
      009D0D 90 9F            [ 1] 5708 	ld a,yl 
      009D0D 1E 01 CD         [ 1] 5709 	xor a,seedy+1 
      009D10 8A 4A AE         [ 1] 5710 	ld seedy+1,a 
                                   5711 ; acc16>>3 
      009D13 9D 2C CD         [ 2] 5712 	ldw x,acc16 
      009D16 A8               [ 2] 5713 	srlw x 
      009D17 C0               [ 2] 5714 	srlw x 
      009D18 CD               [ 2] 5715 	srlw x 
                                   5716 ; x=acc16^x 
      009D19 9A               [ 1] 5717 	ld a,xh 
      009D1A AD 5F 35         [ 1] 5718 	xor a,acc16 
      009D1D 0A               [ 1] 5719 	ld xh,a 
      009D1E 00               [ 1] 5720 	ld a,xl 
      009D1F 0B CD 8A         [ 1] 5721 	xor a,acc8 
      009D22 5A               [ 1] 5722 	ld xl,a 
                                   5723 ; seedy=x^seedy 
      009D23 AE 9D 34         [ 1] 5724 	xor a,seedy+1
      009D26 CD               [ 1] 5725 	ld xl,a 
      009D27 A8               [ 1] 5726 	ld a,xh 
      009D28 C0 5B 02         [ 1] 5727 	xor a,seedy
      009D2B 81               [ 1] 5728 	ld xh,a 
      009D2C 20 66 69         [ 2] 5729 	ldw seedy,x 
                                   5730 ; return seedy modulo expr + 1 
      009D2F 6C 65            [ 2] 5731 	popw y 
      009D31 73               [ 2] 5732 	divw x,y 
      009D32 0A               [ 1] 5733 	ldw x,y 
      009D33 00               [ 2] 5734 	incw x 
      001FC9                       5735 10$:
      009D34 20 62            [ 1] 5736 	ld a,#TK_INTGR
      009D36 79               [ 4] 5737 	ret 
                                   5738 
                                   5739 ;---------------------------------
                                   5740 ; BASIC: WORDS 
                                   5741 ; affiche la listes des mots du
                                   5742 ; dictionnaire ainsi que le nombre
                                   5743 ; de mots.
                                   5744 ;---------------------------------
                           000001  5745 	WLEN=1 ; word length
                           000002  5746 	LLEN=2 ; character sent to console
                           000003  5747 	WCNT=3 ; count words printed 
                           000003  5748 	VSIZE=3 
      001FCC                       5749 words:
      001FCC                       5750 	_vars VSIZE
      009D37 74 65            [ 2]    1     sub sp,#VSIZE 
      009D39 73 20            [ 1] 5751 	clr (LLEN,sp)
      009D3B 66 72            [ 1] 5752 	clr (WCNT,sp)
      009D3D 65 65 0A 00      [ 2] 5753 	ldw y,#kword_dict+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D41 93               [ 1] 5754 0$:	ldw x,y
      009D41 52               [ 1] 5755 	ld a,(x)
      009D42 02 72            [ 1] 5756 	and a,#15 
      009D44 5F 00            [ 1] 5757 	ld (WLEN,sp),a 
      009D46 17 CD            [ 1] 5758 	inc (WCNT,sp)
      009D48 91               [ 2] 5759 1$:	incw x 
      009D49 8F               [ 1] 5760 	ld a,(x)
      009D4A A1 84 27         [ 4] 5761 	call putc 
      009D4D 03 CC            [ 1] 5762 	inc (LLEN,sp)
      009D4F 88 FB            [ 1] 5763 	dec (WLEN,sp)
      009D51 1F 01            [ 1] 5764 	jrne 1$
      009D53 CD 89            [ 1] 5765 	ld a,#70
      009D55 ED A1            [ 1] 5766 	cp a,(LLEN,sp)
      009D57 09 27            [ 1] 5767 	jrmi 2$   
      009D59 02 20            [ 1] 5768 	ld a,#SPACE 
      009D5B 19 CD 91         [ 4] 5769 	call putc 
      009D5E 8F A1            [ 1] 5770 	inc (LLEN,sp) 
      009D60 84 27            [ 2] 5771 	jra 3$
      009D62 03 CC            [ 1] 5772 2$: ld a,#CR 
      009D64 88 FB 9F         [ 4] 5773 	call putc 
      009D67 1E 01            [ 1] 5774 	clr (LLEN,sp)
      009D69 CF 00 18 5F      [ 2] 5775 3$:	subw y,#2 
      009D6D CD 82            [ 2] 5776 	ldw y,(y)
      009D6F 65 1E            [ 1] 5777 	jrne 0$ 
      009D71 01 5C            [ 1] 5778 	ld a,#CR 
      009D73 20 DC C0         [ 4] 5779 	call putc  
      009D75 5F               [ 1] 5780 	clrw x 
      009D75 5B 02            [ 1] 5781 	ld a,(WCNT,sp)
      009D77 81               [ 1] 5782 	ld xl,a 
      009D78 CD 09 CA         [ 4] 5783 	call print_int 
      009D78 CD 90 91         [ 2] 5784 	ldw x,#words_count_msg
      009D7B A1 01 27         [ 4] 5785 	call puts 
      002019                       5786 	_drop VSIZE 
      009D7E 03 CC            [ 2]    1     addw sp,#VSIZE 
      009D80 88               [ 4] 5787 	ret 
      009D81 FB 85 9F A4 7F 97 A6  5788 words_count_msg: .asciz " words in dictionary\n"
             03 81 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5789 
                                   5790 
                                   5791 ;-----------------------------
                                   5792 ; BASIC: TIMER expr 
                                   5793 ; initialize count down timer 
                                   5794 ;-----------------------------
      009D8A                       5795 set_timer:
      009D8A A6 07 CD         [ 4] 5796 	call arg_list
      009D8D 90 84            [ 1] 5797 	cp a,#1 
      009D8F CD 89            [ 1] 5798 	jreq 1$
      009D91 ED A1 02         [ 2] 5799 	jp syntax_error
      00203C                       5800 1$: 
      009D94 27               [ 2] 5801 	popw x 
      009D95 07 A1 03         [ 2] 5802 	ldw timer,x 
      009D98 27               [ 4] 5803 	ret 
                                   5804 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5805 ;------------------------------
                                   5806 ; BASIC: TIMEOUT 
                                   5807 ; return state of timer 
                                   5808 ;------------------------------
      002041                       5809 timeout:
      009D99 06 CC 88         [ 2] 5810 	ldw x,timer 
      002044                       5811 logical_complement:
      009D9C FB               [ 2] 5812 	cplw x 
      009D9D A3 FF FF         [ 2] 5813 	cpw x,#-1
      009D9D F6 5F            [ 1] 5814 	jreq 2$
      009D9F 97               [ 1] 5815 	clrw x 
      009DA0 A6 84            [ 1] 5816 2$:	ld a,#TK_INTGR
      009DA0 89               [ 4] 5817 	ret 
                                   5818 
                                   5819 ;--------------------------------
                                   5820 ; BASIC NOT(expr) 
                                   5821 ; return logical complement of expr
                                   5822 ;--------------------------------
      00204E                       5823 func_not:
      009DA1 A6 08 CD         [ 4] 5824 	call func_args  
      009DA4 90 84            [ 1] 5825 	cp a,#1
      009DA6 85 A6            [ 1] 5826 	jreq 1$
      009DA8 84 81 7B         [ 2] 5827 	jp syntax_error
      009DAA 85               [ 2] 5828 1$:	popw x 
      009DAA CD 83            [ 2] 5829 	jra logical_complement
                                   5830 
                                   5831 
                                   5832 
                                   5833 ;-----------------------------------
                                   5834 ; BASIC: IWDGEN expr1 
                                   5835 ; enable independant watchdog timer
                                   5836 ; expr1 is delay in multiple of 62.5µsec
                                   5837 ; expr1 -> {1..16383}
                                   5838 ;-----------------------------------
      00205B                       5839 enable_iwdg:
      009DAC 49 5F 97         [ 4] 5840 	call arg_list
      009DAF A6 84            [ 1] 5841 	cp a,#1 
      009DB1 81 03            [ 1] 5842 	jreq 1$
      009DB2 CC 08 7B         [ 2] 5843 	jp syntax_error 
      009DB2 5F               [ 2] 5844 1$: popw x 
      009DB3 C6 00            [ 1] 5845 	push #0
      009DB5 2E C1 00 2F      [ 1] 5846 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009DB9 27               [ 1] 5847 	ld a,xh 
      009DBA 01 53            [ 1] 5848 	and a,#0x3f
      009DBC A6               [ 1] 5849 	ld xh,a  
      009DBD 84 81 FF         [ 2] 5850 2$:	cpw x,#255
      009DBF 23 06            [ 2] 5851 	jrule 3$
      009DBF CD 90            [ 1] 5852 	inc (1,sp)
      009DC1 91               [ 1] 5853 	rcf 
      009DC2 A1               [ 2] 5854 	rrcw x 
      009DC3 02 27            [ 2] 5855 	jra 2$
      009DC5 03 CC 88 FB      [ 1] 5856 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DC9 84               [ 1] 5857 	pop a  
      009DC9 1E 03 2B         [ 1] 5858 	ld IWDG_PR,a 
      009DCC 17               [ 1] 5859 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DCD A3               [ 1] 5860 	dec a 
      009DCE 00 09 2A 12      [ 1] 5861 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DD2 A6 05 42         [ 1] 5862 	ld IWDG_RLR,a 
      009DD5 1C 50 00 1F      [ 1] 5863 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009DD9 03               [ 4] 5864 	ret 
                                   5865 
                                   5866 
                                   5867 ;-----------------------------------
                                   5868 ; BASIC: IWDGREF  
                                   5869 ; refresh independant watchdog count down 
                                   5870 ; timer before it reset MCU. 
                                   5871 ;-----------------------------------
      002091                       5872 refresh_iwdg:
      009DDA 1E 01 72 FB      [ 1] 5873 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009DDE 03               [ 4] 5874 	ret 
                                   5875 
                                   5876 
                                   5877 ;-------------------------------------
                                   5878 ; BASIC: LOG(expr)
                                   5879 ; return logarithm base 2 of expr 
                                   5880 ; this is the position of most significant
                                   5881 ; bit set. 
                                   5882 ; input: 
                                   5883 ; output:
                                   5884 ;   X     log2 
                                   5885 ;   A     TK_INTGR 
                                   5886 ;*********************************
      002096                       5887 log2:
      009DDF A6 84 5B         [ 4] 5888 	call func_args 
      009DE2 04 81            [ 1] 5889 	cp a,#1 
      009DE4 27 03            [ 1] 5890 	jreq 1$
      009DE4 A6 0A CC         [ 2] 5891 	jp syntax_error 
      009DE7 88               [ 2] 5892 1$: popw x 
      0020A1                       5893 leading_one:
      009DE8 FD               [ 2] 5894 	tnzw x 
      009DE9 27 0A            [ 1] 5895 	jreq 4$
      009DE9 AE A8            [ 1] 5896 	ld a,#15 
      009DEB 80               [ 2] 5897 2$: rlcw x 
      009DEC A6 84            [ 1] 5898     jrc 3$
      009DEE 81               [ 1] 5899 	dec a 
      009DEF 20 FA            [ 2] 5900 	jra 2$
      009DEF 90               [ 1] 5901 3$: clrw x 
      009DF0 89               [ 1] 5902     ld xl,a
      009DF1 CD 90            [ 1] 5903 4$:	ld a,#TK_INTGR
      009DF3 91               [ 4] 5904 	ret 
                                   5905 
                                   5906 ;-----------------------------------
                                   5907 ; BASIC: BIT(expr) 
                                   5908 ; expr ->{0..15}
                                   5909 ; return 2^expr 
                                   5910 ; output:
                                   5911 ;    x    2^expr 
                                   5912 ;-----------------------------------
      0020B1                       5913 bitmask:
      009DF4 A1 01 27         [ 4] 5914     call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009DF7 07 A1            [ 1] 5915 	cp a,#1
      009DF9 02 27            [ 1] 5916 	jreq 1$
      009DFB 03 CC 88         [ 2] 5917 	jp syntax_error 
      009DFE FB               [ 2] 5918 1$: popw x 
      009DFF 90               [ 1] 5919 	ld a,xl 
      009E00 85 A1            [ 1] 5920 	and a,#15
      009E02 01               [ 1] 5921 	clrw x 
      009E03 27               [ 2] 5922 	incw x 
      009E04 02               [ 1] 5923 2$: tnz a 
      009E05 85 51            [ 1] 5924 	jreq 3$
      009E07 90               [ 2] 5925 	slaw x 
      009E08 FD               [ 1] 5926 	dec a 
      009E09 90 85            [ 2] 5927 	jra 2$ 
      009E0B 81 84            [ 1] 5928 3$: ld a,#TK_INTGR
      009E0C 81               [ 4] 5929 	ret 
                                   5930 
                                   5931 ;------------------------------
                                   5932 ; BASIC: INVERT(expr)
                                   5933 ; 1's complement 
                                   5934 ;--------------------------------
      0020CB                       5935 invert:
      009E0C 72 0D 52         [ 4] 5936 	call func_args
      009E0F 30 FB            [ 1] 5937 	cp a,#1 
      009E11 8E CC            [ 1] 5938 	jreq 1$
      009E13 86 58 7B         [ 2] 5939 	jp syntax_error
      009E15 85               [ 2] 5940 1$: popw x  
      009E15 72               [ 2] 5941 	cplw x 
      009E16 01 00            [ 1] 5942 	ld a,#TK_INTGR 
      009E18 24               [ 4] 5943 	ret 
                                   5944 
                                   5945 ;------------------------------
                                   5946 ; BASIC: DO 
                                   5947 ; initiate a DO ... UNTIL loop 
                                   5948 ;------------------------------
                           000003  5949 	DOLP_ADR=3 
                           000005  5950 	DOLP_INW=5
                           000004  5951 	VSIZE=4 
      0020DA                       5952 do_loop:
      009E19 07               [ 2] 5953 	popw x 
      0020DB                       5954 	_vars VSIZE 
      009E1A 27 05            [ 2]    1     sub sp,#VSIZE 
      009E1C A6               [ 2] 5955 	pushw x 
      009E1D 07 CC 88 FD      [ 2] 5956 	ldw y,basicptr 
      009E21 17 03            [ 2] 5957 	ldw (DOLP_ADR,sp),y
      009E21 CD 89 ED 26      [ 2] 5958 	ldw y,in.w 
      009E25 08 AE            [ 2] 5959 	ldw (DOLP_INW,sp),y
      009E27 40 00 CD A8      [ 1] 5960 	inc loop_depth 
      009E2B C0               [ 4] 5961 	ret 
                                   5962 
                                   5963 ;--------------------------------
                                   5964 ; BASIC: UNTIL expr 
                                   5965 ; loop if exprssion is false 
                                   5966 ; else terminate loop
                                   5967 ;--------------------------------
      0020EF                       5968 until: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E2C 4F 81 00 20      [ 1] 5969 	tnz loop_depth 
      009E2E 26 03            [ 1] 5970 	jrne 1$ 
      009E2E A1 02 27         [ 2] 5971 	jp syntax_error 
      0020F8                       5972 1$: 
      009E31 03 CC 88         [ 4] 5973 	call relation 
      009E34 FB 84            [ 1] 5974 	cp a,#TK_INTGR
      009E35 27 03            [ 1] 5975 	jreq 2$
      009E35 7D 26 09         [ 2] 5976 	jp syntax_error
      002102                       5977 2$: 
      009E38 CD               [ 2] 5978 	tnzw x 
      009E39 87 1A            [ 1] 5979 	jrne 9$
      009E3B 55 00            [ 2] 5980 	ldw x,(DOLP_ADR,sp)
      009E3D 04 00 02         [ 2] 5981 	ldw basicptr,x 
      009E40 81 89            [ 1] 5982 	ld a,(2,x)
      009E42 90 93 CD         [ 1] 5983 	ld count,a 
      009E45 9A E1            [ 2] 5984 	ldw x,(DOLP_INW,sp)
      009E47 25 05 A6         [ 2] 5985 	ldw in.w,x 
      009E4A 09               [ 4] 5986 	ret 
      002115                       5987 9$:	; remove loop data from stack  
      009E4B CC               [ 2] 5988 	popw x
      002116                       5989 	_drop VSIZE
      009E4C 88 FD            [ 2]    1     addw sp,#VSIZE 
      009E4E 72 5A 00 20      [ 1] 5990 	dec loop_depth 
      009E4E 55               [ 2] 5991 	jp (x)
                                   5992 
                                   5993 ;--------------------------
                                   5994 ; BASIC: PRTA...PRTI  
                                   5995 ;  return constant value 
                                   5996 ;  PORT  offset in GPIO
                                   5997 ;  array
                                   5998 ;---------------------------
      00211D                       5999 const_porta:
      009E4F 00 04 00         [ 2] 6000 	ldw x,#0
      009E52 02 72            [ 1] 6001 	ld a,#TK_INTGR 
      009E54 5F               [ 4] 6002 	ret 
      002123                       6003 const_portb:
      009E55 00 17 AE         [ 2] 6004 	ldw x,#1
      009E58 40 00            [ 1] 6005 	ld a,#TK_INTGR 
      009E5A CF               [ 4] 6006 	ret 
      002129                       6007 const_portc:
      009E5B 00 18 1E         [ 2] 6008 	ldw x,#2
      009E5E 01 CD            [ 1] 6009 	ld a,#TK_INTGR 
      009E60 84               [ 4] 6010 	ret 
      00212F                       6011 const_portd:
      009E61 16 5C 90         [ 2] 6012 	ldw x,#3
      009E64 85 89            [ 1] 6013 	ld a,#TK_INTGR 
      009E66 5F               [ 4] 6014 	ret 
      002135                       6015 const_porte:
      009E67 CD 82 DA         [ 2] 6016 	ldw x,#4
      009E6A 5B 02            [ 1] 6017 	ld a,#TK_INTGR 
      009E6C 81               [ 4] 6018 	ret 
      009E6D                       6019 const_portf:
      009E6D 72 0D 52         [ 2] 6020 	ldw x,#5
      009E70 30 FB            [ 1] 6021 	ld a,#TK_INTGR 
      009E72 72               [ 4] 6022 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      002141                       6023 const_portg:
      009E73 16 00 24         [ 2] 6024 	ldw x,#6
      009E76 8E 81            [ 1] 6025 	ld a,#TK_INTGR 
      009E78 81               [ 4] 6026 	ret 
      002147                       6027 const_porth:
      009E78 CD 91 8F         [ 2] 6028 	ldw x,#7
      009E7B A1 84            [ 1] 6029 	ld a,#TK_INTGR 
      009E7D 27               [ 4] 6030 	ret 
      00214D                       6031 const_porti:
      009E7E 03 CC 88         [ 2] 6032 	ldw x,#8
      009E81 FB 84            [ 1] 6033 	ld a,#TK_INTGR 
      009E82 81               [ 4] 6034 	ret 
                                   6035 
                                   6036 ;-------------------------------
                                   6037 ; following return constant 
                                   6038 ; related to GPIO register offset 
                                   6039 ;---------------------------------
      002153                       6040 const_odr:
      009E82 5D 27            [ 1] 6041 	ld a,#TK_INTGR 
      009E84 04 8F 5A         [ 2] 6042 	ldw x,#GPIO_ODR
      009E87 26               [ 4] 6043 	ret 
      002159                       6044 const_idr:
      009E88 F9 4F            [ 1] 6045 	ld a,#TK_INTGR 
      009E8A 81 00 01         [ 2] 6046 	ldw x,#GPIO_IDR
      009E8B 81               [ 4] 6047 	ret 
      00215F                       6048 const_ddr:
      009E8B CD 91            [ 1] 6049 	ld a,#TK_INTGR 
      009E8D 8F A1 84         [ 2] 6050 	ldw x,#GPIO_DDR
      009E90 27               [ 4] 6051 	ret 
      002165                       6052 const_cr1:
      009E91 03 CC            [ 1] 6053 	ld a,#TK_INTGR 
      009E93 88 FB 03         [ 2] 6054 	ldw x,#GPIO_CR1
      009E95 81               [ 4] 6055 	ret 
      00216B                       6056 const_cr2:
      009E95 A3 14            [ 1] 6057 	ld a,#TK_INTGR 
      009E97 00 2B 0C         [ 2] 6058 	ldw x,#GPIO_CR2
      009E9A 35               [ 4] 6059 	ret 
                                   6060 ;-------------------------
                                   6061 ;  constant for port mode
                                   6062 ;  used by PMODE 
                                   6063 ;  input or output
                                   6064 ;------------------------
      002171                       6065 const_output:
      009E9B 0F 50            [ 1] 6066 	ld a,#TK_INTGR 
      009E9D F2 A6 1E         [ 2] 6067 	ldw x,#OUTP
      009EA0 62               [ 4] 6068 	ret 
      002177                       6069 const_input:
      009EA1 A6 10            [ 1] 6070 	ld a,#TK_INTGR 
      009EA3 62 20 1E         [ 2] 6071 	ldw x,#INP 
      009EA6 81               [ 4] 6072 	ret 
                                   6073 ;-----------------------
                                   6074 ; memory area constants
                                   6075 ;-----------------------
      00217D                       6076 const_eeprom_base:
      009EA6 A3 08            [ 1] 6077 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EA8 00 2B 09         [ 2] 6078 	ldw x,#EEPROM_BASE 
      009EAB 35               [ 4] 6079 	ret 
                                   6080 
                                   6081 ;---------------------------
                                   6082 ; BASIC: DATA 
                                   6083 ; when the interpreter find 
                                   6084 ; a DATA line it skip it.
                                   6085 ;---------------------------
      002183                       6086 data:
      009EAC 0E 50 F2 A6 50   [ 1] 6087 	mov in,count 
      009EB1 62               [ 4] 6088 	ret 
                                   6089 
                                   6090 ;---------------------------
                                   6091 ; BASIC: DATLN  *expr*
                                   6092 ; set DATA pointer at line# 
                                   6093 ; specified by *expr* 
                                   6094 ;---------------------------
      002189                       6095 data_line:
      009EB2 20 10 0F         [ 4] 6096 	call expression
      009EB4 A1 84            [ 1] 6097 	cp a,#TK_INTGR
      009EB4 35 07            [ 1] 6098 	jreq 1$
      009EB6 50 F2 7B         [ 2] 6099 	jp syntax_error 
      009EB8 CD 04 04         [ 4] 6100 1$: call search_lineno
      009EB8 A3               [ 2] 6101 	tnzw x 
      009EB9 00 40            [ 1] 6102 	jrne 3$
      009EBB 23 07            [ 1] 6103 2$:	ld a,#ERR_NO_LINE 
      009EBD 72 5C 50         [ 2] 6104 	jp tb_error
      00219E                       6105 3$: ; check if valid data line 
      009EC0 F2 54            [ 1] 6106     ldw y,x 
      009EC2 20 F4            [ 2] 6107 	ldw x,(4,x)
      009EC4 A3 21 83         [ 2] 6108 	cpw x,#data 
      009EC4 9F 4A            [ 1] 6109 	jrne 2$ 
      009EC6 27 01 4A 06      [ 2] 6110 	ldw data_ptr,y
      009EC9 90 E6 02         [ 1] 6111 	ld a,(2,y)
      009EC9 A4 3E C7         [ 1] 6112 	ld data_len,a 
      009ECC 50 F1 72 18      [ 1] 6113 	mov data_ofs,#FIRST_DATA_ITEM 
      009ED0 50               [ 4] 6114 	ret
                                   6115 
                                   6116 ;---------------------------------
                                   6117 ; BASIC: RESTORE 
                                   6118 ; set data_ptr to first data line
                                   6119 ; if not DATA found pointer set to
                                   6120 ; zero 
                                   6121 ;---------------------------------
      0021B6                       6122 restore:
      009ED1 F0 8E 81 06      [ 1] 6123 	clr data_ptr 
      009ED4 72 5F 00 07      [ 1] 6124 	clr data_ptr+1
      009ED4 CE 00 0F A6      [ 1] 6125 	clr data_ofs 
      009ED8 84 81 00 09      [ 1] 6126 	clr data_len
      009EDA CE 00 1C         [ 2] 6127 	ldw x,txtbgn
      0021C9                       6128 data_search_loop: 	
      009EDA CD 90 91         [ 2] 6129 	cpw x,txtend
      009EDD A1 01            [ 1] 6130 	jruge 9$
      009EDF 27 03            [ 1] 6131 	ldw y,x 
      009EE1 CC 88            [ 2] 6132 	ldw x,(4,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EE3 FB 21 83         [ 2] 6133 	cpw x,#data 
      009EE4 26 1A            [ 1] 6134 	jrne try_next_line 
      009EE4 85 9E A5 80      [ 2] 6135 	ldw data_ptr,y 
      009EE8 27 01 50         [ 1] 6136 	ld a,(2,y)
      009EEB A6 84 81         [ 1] 6137 	ld data_len,a 
      009EEE 35 06 00 08      [ 1] 6138 	mov data_ofs,#FIRST_DATA_ITEM
      009EEE CD 90 91 A1      [ 1] 6139 9$:	tnz data_len 
      009EF2 02 27            [ 1] 6140     jrne 10$
      009EF4 03 CC            [ 1] 6141 	ld a,#ERR_NO_DATA 
      009EF6 88 FB 85         [ 2] 6142 	jp tb_error 
      009EF9 9E               [ 4] 6143 10$:ret
      0021F1                       6144 try_next_line:
      009EFA 14               [ 1] 6145 	ldw x,y 
      009EFB 01 95            [ 1] 6146 	ld a,(2,x)
      009EFD 9F 14 02         [ 1] 6147 	ld acc8,a 
      009F00 97 5B 02 A6      [ 1] 6148 	clr acc16 
      009F04 84 81 00 0C      [ 2] 6149 	addw x,acc16 
      009F06 20 C8            [ 2] 6150 	jra data_search_loop
                                   6151 
                                   6152 
                                   6153 ;---------------------------------
                                   6154 ; BASIC: READ 
                                   6155 ; return next data item | 0 
                                   6156 ;---------------------------------
                           000001  6157 	CTX_BPTR=1 
                           000003  6158 	CTX_IN=3 
                           000004  6159 	CTX_COUNT=4 
                           000005  6160 	XSAVE=5
                           000006  6161 	VSIZE=6
      002201                       6162 read:
      002201                       6163 	_vars  VSIZE 
      009F06 CD 90            [ 2]    1     sub sp,#VSIZE 
      002203                       6164 read01:	
      009F08 91 A1 02         [ 1] 6165 	ld a,data_ofs
      009F0B 27 03 CC         [ 1] 6166 	cp a,data_len 
      009F0E 88 FB            [ 1] 6167 	jreq 2$ ; end of line  
      009F10 CD 15 6D         [ 4] 6168 	call save_context
      009F10 85 9E 1A         [ 2] 6169 	ldw x,data_ptr 
      009F13 01 95 9F         [ 2] 6170 	ldw basicptr,x 
      009F16 1A 02 97 5B 02   [ 1] 6171 	mov in,data_ofs 
      009F1B A6 84 81 00 03   [ 1] 6172 	mov count,data_len  
      009F1E CD 11 0F         [ 4] 6173 	call expression 
      009F1E CD 90            [ 1] 6174 	cp a,#TK_INTGR 
      009F20 91 A1            [ 1] 6175 	jreq 1$ 
      009F22 02 27 03         [ 2] 6176 	jp syntax_error 
      002228                       6177 1$:
      009F25 CC 88            [ 2] 6178 	ldw (XSAVE,SP),x
      009F27 FB 09 6D         [ 4] 6179 	call next_token ; skip comma
      009F28 CE 00 04         [ 2] 6180 	ldw x,basicptr 
      009F28 85 9E 18         [ 2] 6181 	ldw data_ptr,x 
      009F2B 01 95 9F 18 02   [ 1] 6182 	mov data_ofs,in 
      009F30 97 5B 02         [ 4] 6183 	call rest_context
      009F33 A6 84            [ 2] 6184 	ldw x,(XSAVE,sp)
      009F35 81 84            [ 1] 6185 	ld a,#TK_INTGR
      009F36                       6186 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F36 CD 90            [ 2]    1     addw sp,#VSIZE 
      009F38 91               [ 4] 6187 	ret 
      002242                       6188 2$: ; end of line reached 
      009F39 A1 02 27 03      [ 2] 6189 	ldw y, data_ptr 
      009F3D CC 88 FB 90      [ 1] 6190 	clr data_ptr
      009F41 85 85 90 5D      [ 1] 6191 	clr data_ptr+1   
      009F45 27 05 58 90      [ 1] 6192 	clr data_ofs 
      009F49 5A 26 FB 09      [ 1] 6193 	clr data_len 
      009F4C CD 21 F1         [ 4] 6194 	call try_next_line 
      009F4C A6 84            [ 2] 6195 	jra read01
                                   6196 
                                   6197 
                                   6198 ;---------------------------------
                                   6199 ; BASIC: SPIEN clkdiv, 0|1  
                                   6200 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6201 ; if clkdiv==-1 disable SPI
                                   6202 ; 0|1 -> disable|enable  
                                   6203 ;--------------------------------- 
                           000005  6204 SPI_CS_BIT=5
      00225B                       6205 spi_enable:
      009F4E 81 10 16         [ 4] 6206 	call arg_list 
      009F4F A1 02            [ 1] 6207 	cp a,#2
      009F4F CD 90            [ 1] 6208 	jreq 1$
      009F51 91 A1 02         [ 2] 6209 	jp syntax_error 
      002265                       6210 1$: 
      009F54 27 03 CC 88      [ 1] 6211 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F58 FB               [ 2] 6212 	popw x  
      009F59 90               [ 2] 6213 	tnzw x 
      009F5A 85 85            [ 1] 6214 	jreq spi_disable 
      009F5C 90               [ 2] 6215 	popw x 
      009F5D 5D 27            [ 1] 6216 	ld a,#(1<<SPI_CR1_BR)
      009F5F 05               [ 4] 6217 	mul x,a 
      009F60 54               [ 1] 6218 	ld a,xl 
      009F61 90 5A 26         [ 1] 6219 	ld SPI_CR1,a 
                                   6220 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F64 FB 1A 50 14      [ 1] 6221 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F65 72 1A 50 16      [ 1] 6222 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6223 ; configure SPI as master mode 0.	
      009F65 A6 84 81 00      [ 1] 6224 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6225 ; ~CS line controlled by sofware 	
      009F68 72 12 52 01      [ 1] 6226 	bset SPI_CR2,#SPI_CR2_SSM 
      009F68 A6 84 CD 90      [ 1] 6227     bset SPI_CR2,#SPI_CR2_SSI 
                                   6228 ; enable SPI
      009F6C 84 9F A4 07      [ 1] 6229 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F70 C7               [ 4] 6230 	ret 
      00228E                       6231 spi_disable:
      00228E                       6232 	_drop #2; throw first argument.
      009F71 50 C6            [ 2]    1     addw sp,##2 
                                   6233 ; wait spi idle 
      009F73 81 82            [ 1] 6234 1$:	ld a,#0x82 
      009F74 C4 52 03         [ 1] 6235 	and a,SPI_SR
      009F74 52 01            [ 1] 6236 	cp a,#2 
      009F76 CD 90            [ 1] 6237 	jrne 1$
      009F78 96 A1 02 27      [ 1] 6238 	bres SPI_CR1,#SPI_CR1_SPE
      009F7C 03 CC 88 FB      [ 1] 6239 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F80 90 85 85 CD      [ 1] 6240 	bres PE_DDR,#SPI_CS_BIT 
      009F84 9F               [ 4] 6241 	ret 
                                   6242 
      0022A6                       6243 spi_clear_error:
      009F85 B5 6B            [ 1] 6244 	ld a,#0x78 
      009F87 01 A6 01         [ 1] 6245 	bcp a,SPI_SR 
      009F8A 0D 01            [ 1] 6246 	jreq 1$
      009F8C 27 0B 48 0A      [ 1] 6247 	clr SPI_SR 
      009F90 01               [ 4] 6248 1$: ret 
                                   6249 
      0022B2                       6250 spi_send_byte:
      009F91 26               [ 1] 6251 	push a 
      009F92 FB 6B 01         [ 4] 6252 	call spi_clear_error
      009F95 EA               [ 1] 6253 	pop a 
      009F96 03 E7 03 90 A3   [ 2] 6254 	btjf SPI_SR,#SPI_SR_TXE,.
      009F9B 00 01 27         [ 1] 6255 	ld SPI_DR,a
      009F9E 07 7B 01 43 E4   [ 2] 6256 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009FA3 02 20 0A         [ 1] 6257 	ld a,SPI_DR 
      009FA6 81               [ 4] 6258 	ret 
                                   6259 
      0022C8                       6260 spi_rcv_byte:
      009FA6 7B 01            [ 1] 6261 	ld a,#255
      009FA8 EA 04 E7 04 7B   [ 2] 6262 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009FAD 01 EA 02         [ 1] 6263 	ld a,SPI_DR 
      009FB0 E7               [ 4] 6264 	ret
                                   6265 
                                   6266 ;------------------------------
                                   6267 ; BASIC: SPIWR byte [,byte]
                                   6268 ; write 1 or more byte
                                   6269 ;------------------------------
      0022D3                       6270 spi_write:
      009FB1 02 5B 01         [ 4] 6271 	call expression
      009FB4 81 84            [ 1] 6272 	cp a,#TK_INTGR 
      009FB5 27 03            [ 1] 6273 	jreq 1$
      009FB5 58 1C 9F         [ 2] 6274 	jp syntax_error 
      0022DD                       6275 1$:	
      009FB8 C5               [ 1] 6276 	ld a,xl 
      009FB9 FE 9F 88         [ 4] 6277 	call spi_send_byte 
      009FBC 5E A6 05         [ 4] 6278 	call next_token 
      009FBF 42 1C            [ 1] 6279 	cp a,#TK_COMMA 
      009FC1 50 00            [ 1] 6280 	jrne 2$ 
      009FC3 84 81            [ 2] 6281 	jra spi_write 
      009FC5 4D               [ 1] 6282 2$:	tnz a 
      009FC5 03 06            [ 1] 6283 	jreq 3$
      0022ED                       6284 	_unget_token  
      009FC7 03 05 04 00 02   [ 1]    1     mov in,in.saved
      009FCC 01               [ 4] 6285 3$:	ret 
                                   6286 
                                   6287 
                                   6288 ;-------------------------------
                                   6289 ; BASIC: SPIRD 	
                                   6290 ; read one byte from SPI 
                                   6291 ;-------------------------------
      0022F3                       6292 spi_read:
      009FCD 06 00 02         [ 4] 6293 	call spi_rcv_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FD0 02               [ 1] 6294 	clrw x 
      009FD1 02               [ 1] 6295 	ld xl,a 
      009FD2 03 03            [ 1] 6296 	ld a,#TK_INTGR 
      009FD4 01               [ 4] 6297 	ret 
                                   6298 
                                   6299 ;------------------------------
                                   6300 ; BASIC: SPISEL 0|1 
                                   6301 ; set state of ~CS line
                                   6302 ; 0|1 deselect|select  
                                   6303 ;------------------------------
      0022FB                       6304 spi_select:
      009FD5 03 03 02         [ 4] 6305 	call next_token 
      009FD8 04 04            [ 1] 6306 	cp a,#TK_INTGR 
      009FDA 05 02            [ 1] 6307 	jreq 1$
      009FDC 06 02 07         [ 2] 6308 	jp syntax_error 
      009FDF 02               [ 2] 6309 1$: tnzw x  
      009FE0 05 04            [ 1] 6310 	jreq cs_high 
      009FE2 02 04 01 14      [ 1] 6311 	bres PE_ODR,#SPI_CS_BIT
      009FE5 81               [ 4] 6312 	ret 
      00230D                       6313 cs_high: 
      009FE5 CD 90 91 A1      [ 1] 6314 	bset PE_ODR,#SPI_CS_BIT
      009FE9 01               [ 4] 6315 	ret 
                                   6316 
                                   6317 
                                   6318 ;-------------------------------
                                   6319 ; BASIC: PAD 
                                   6320 ; Return pad buffer address.
                                   6321 ;------------------------------
      002312                       6322 pad_ref:
      009FEA 27 03 CC         [ 2] 6323 	ldw x,#pad 
      009FED 88 FB            [ 1] 6324 	ld a,TK_INTGR
      009FEF 81               [ 4] 6325 	ret 
                                   6326 
                                   6327 ;------------------------------
                                   6328 ;      dictionary 
                                   6329 ; format:
                                   6330 ;   link:   2 bytes 
                                   6331 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6332 ;   cmd_name: 16 byte max 
                                   6333 ;   cmd_index: 2 bytes 
                                   6334 ;------------------------------
                                   6335 	.macro _dict_entry len,name,cmd_idx 
                                   6336 	.word LINK 
                                   6337 	LINK=.
                                   6338 name:
                                   6339 	.byte len 	
                                   6340 	.ascii "name"
                                   6341 	.word cmd_idx 
                                   6342 	.endm 
                                   6343 
                           000000  6344 	LINK=0
                                   6345 ; respect alphabetic order for BASIC names from Z-A
                                   6346 ; this sort order is for a cleaner WORDS cmd output. 	
      002318                       6347 kword_end:
      002318                       6348 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FEF A6 80                    1 	.word LINK 
                           00231A     2 	LINK=.
      00231A                          3 XOR:
      009FF1 15                       4 	.byte 3+F_IFUNC 	
      009FF2 01 27 05                 5 	.ascii "XOR"
      009FF5 A6 0A                    6 	.word XOR_IDX 
      002320                       6349 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009FF7 CC 88                    1 	.word LINK 
                           002322     2 	LINK=.
      002322                          3 WRITE:
      009FF9 FD                       4 	.byte 5 	
      009FFA 57 52 49 54 45           5 	.ascii "WRITE"
      009FFA CE 00                    6 	.word WRITE_IDX 
      00232A                       6350 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009FFC 13 58                    1 	.word LINK 
                           00232C     2 	LINK=.
      00232C                          3 WORDS:
      009FFE 58                       4 	.byte 5 	
      009FFF 58 58 58 9E C8           5 	.ascii "WORDS"
      00A004 00 13                    6 	.word WORDS_IDX 
      002334                       6351 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A006 C7 00                    1 	.word LINK 
                           002336     2 	LINK=.
      002336                          3 WAIT:
      00A008 0D                       4 	.byte 4 	
      00A009 9F C8 00 14              5 	.ascii "WAIT"
      00A00D C7 00                    6 	.word WAIT_IDX 
      00233D                       6352 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A00F 0E CE                    1 	.word LINK 
                           00233F     2 	LINK=.
      00233F                          3 USR:
      00A011 00                       4 	.byte 3+F_IFUNC 	
      00A012 15 CF 00                 5 	.ascii "USR"
      00A015 13 90                    6 	.word USR_IDX 
      002345                       6353 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A017 54 90                    1 	.word LINK 
                           002347     2 	LINK=.
      002347                          3 UNTIL:
      00A019 9E                       4 	.byte 5 	
      00A01A C8 00 15 C7 00           5 	.ascii "UNTIL"
      00A01F 15 90                    6 	.word UNTIL_IDX 
      00234F                       6354 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A021 9F C8                    1 	.word LINK 
                           002351     2 	LINK=.
      002351                          3 UFLASH:
      00A023 00                       4 	.byte 6+F_IFUNC 	
      00A024 16 C7 00 16 CE 00        5 	.ascii "UFLASH"
      00A02A 0D 54                    6 	.word UFLASH_IDX 
      00235A                       6355 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound 
      00A02C 54 54                    1 	.word LINK 
                           00235C     2 	LINK=.
      00235C                          3 UBOUND:
      00A02E 9E                       4 	.byte 6+F_IFUNC 	
      00A02F C8 00 0D 95 9F C8        5 	.ascii "UBOUND"
      00A035 00 0E                    6 	.word UBOUND_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      002365                       6356 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A037 97 C8                    1 	.word LINK 
                           002367     2 	LINK=.
      002367                          3 TONE:
      00A039 00                       4 	.byte 4 	
      00A03A 16 97 9E C8              5 	.ascii "TONE"
      00A03E 00 15                    6 	.word TONE_IDX 
      00236E                       6357 	_dict_entry,2,TO,TO_IDX;to
      00A040 95 CF                    1 	.word LINK 
                           002370     2 	LINK=.
      002370                          3 TO:
      00A042 00                       4 	.byte 2 	
      00A043 15 90                    5 	.ascii "TO"
      00A045 85 65                    6 	.word TO_IDX 
      002375                       6358 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A047 93 5C                    1 	.word LINK 
                           002377     2 	LINK=.
      00A049                          3 TIMEOUT:
      00A049 A6                       4 	.byte 7+F_IFUNC 	
      00A04A 84 81 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A04C 00 B2                    6 	.word TMROUT_IDX 
      002381                       6359 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A04C 52 03                    1 	.word LINK 
                           002383     2 	LINK=.
      002383                          3 TIMER:
      00A04E 0F                       4 	.byte 5 	
      00A04F 02 0F 03 90 AE           5 	.ascii "TIMER"
      00A054 A7 33                    6 	.word TIMER_IDX 
      00238B                       6360 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A056 93 F6                    1 	.word LINK 
                           00238D     2 	LINK=.
      00238D                          3 TICKS:
      00A058 A4                       4 	.byte 5+F_IFUNC 	
      00A059 0F 6B 01 0C 03           5 	.ascii "TICKS"
      00A05E 5C F6                    6 	.word TICKS_IDX 
      002395                       6361 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A060 CD 83                    1 	.word LINK 
                           002397     2 	LINK=.
      002397                          3 STOP:
      00A062 40                       4 	.byte 4 	
      00A063 0C 02 0A 01              5 	.ascii "STOP"
      00A067 26 F5                    6 	.word STOP_IDX 
      00239E                       6362 	_dict_entry,4,STEP,STEP_IDX;step 
      00A069 A6 46                    1 	.word LINK 
                           0023A0     2 	LINK=.
      0023A0                          3 STEP:
      00A06B 11                       4 	.byte 4 	
      00A06C 02 2B 09 A6              5 	.ascii "STEP"
      00A070 20 CD                    6 	.word STEP_IDX 
      0023A7                       6363 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A072 83 40                    1 	.word LINK 
                           0023A9     2 	LINK=.
      0023A9                          3 SPIWR:
      00A074 0C                       4 	.byte 5 	
      00A075 02 20 07 A6 0D           5 	.ascii "SPIWR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A07A CD 83                    6 	.word SPIWR_IDX 
      0023B1                       6364 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A07C 40 0F                    1 	.word LINK 
                           0023B3     2 	LINK=.
      0023B3                          3 SPISEL:
      00A07E 02                       4 	.byte 6 	
      00A07F 72 A2 00 02 90 FE        5 	.ascii "SPISEL"
      00A085 26 CF                    6 	.word SPISEL_IDX 
      0023BC                       6365 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A087 A6 0D                    1 	.word LINK 
                           0023BE     2 	LINK=.
      0023BE                          3 SPIEN:
      00A089 CD                       4 	.byte 5 	
      00A08A 83 40 5F 7B 03           5 	.ascii "SPIEN"
      00A08F 97 CD                    6 	.word SPIEN_IDX 
      0023C6                       6366 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A091 8A 4A                    1 	.word LINK 
                           0023C8     2 	LINK=.
      0023C8                          3 SPIRD:
      00A093 AE                       4 	.byte 5+F_IFUNC 	
      00A094 A0 9C CD A8 C0           5 	.ascii "SPIRD"
      00A099 5B 03                    6 	.word SPIRD_IDX 
      0023D0                       6367 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A09B 81 20                    1 	.word LINK 
                           0023D2     2 	LINK=.
      0023D2                          3 SLEEP:
      00A09D 77                       4 	.byte 5 	
      00A09E 6F 72 64 73 20           5 	.ascii "SLEEP"
      00A0A3 69 6E                    6 	.word SLEEP_IDX 
      0023DA                       6368 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A0A5 20 64                    1 	.word LINK 
                           0023DC     2 	LINK=.
      0023DC                          3 SIZE:
      00A0A7 69                       4 	.byte 4+F_IFUNC 	
      00A0A8 63 74 69 6F              5 	.ascii "SIZE"
      00A0AC 6E 61                    6 	.word SIZE_IDX 
      0023E3                       6369     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A0AE 72 79                    1 	.word LINK 
                           0023E5     2 	LINK=.
      0023E5                          3 SHOW:
      00A0B0 0A                       4 	.byte 4 	
      00A0B1 00 48 4F 57              5 	.ascii "SHOW"
      00A0B2 00 9C                    6 	.word SHOW_IDX 
      0023EC                       6370 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A0B2 CD 90                    1 	.word LINK 
                           0023EE     2 	LINK=.
      0023EE                          3 SAVE:
      00A0B4 96                       4 	.byte 4 	
      00A0B5 A1 01 27 03              5 	.ascii "SAVE"
      00A0B9 CC 88                    6 	.word SAVE_IDX 
      0023F5                       6371 	_dict_entry 3,RUN,RUN_IDX;run
      00A0BB FB EE                    1 	.word LINK 
                           0023F7     2 	LINK=.
      00A0BC                          3 RUN:
      00A0BC 85                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A0BD CF 00 11                 5 	.ascii "RUN"
      00A0C0 81 98                    6 	.word RUN_IDX 
      00A0C1                       6372 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A0C1 CE 00                    1 	.word LINK 
                           0023FF     2 	LINK=.
      0023FF                          3 RSHIFT:
      00A0C3 11                       4 	.byte 6+F_IFUNC 	
      00A0C4 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A0C4 53 A3                    6 	.word RSHIFT_IDX 
      002408                       6373 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A0C6 FF FF                    1 	.word LINK 
                           00240A     2 	LINK=.
      00240A                          3 RND:
      00A0C8 27                       4 	.byte 3+F_IFUNC 	
      00A0C9 01 5F A6                 5 	.ascii "RND"
      00A0CC 84 81                    6 	.word RND_IDX 
      00A0CE                       6374 	_dict_entry,6,RETURN,RET_IDX;return 
      00A0CE CD 90                    1 	.word LINK 
                           002412     2 	LINK=.
      002412                          3 RETURN:
      00A0D0 91                       4 	.byte 6 	
      00A0D1 A1 01 27 03 CC 88        5 	.ascii "RETURN"
      00A0D7 FB 85                    6 	.word RET_IDX 
      00241B                       6375 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A0D9 20 E9                    1 	.word LINK 
                           00241D     2 	LINK=.
      00A0DB                          3 RESTORE:
      00A0DB CD                       4 	.byte 7 	
      00A0DC 90 96 A1 01 27 03 CC     5 	.ascii "RESTORE"
      00A0E3 88 FB                    6 	.word REST_IDX 
      002427                       6376 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A0E5 85 4B                    1 	.word LINK 
                           002429     2 	LINK=.
      002429                          3 REMARK:
      00A0E7 00                       4 	.byte 6 	
      00A0E8 35 CC 50 E0 9E A4        5 	.ascii "REMARK"
      00A0EE 3F 95                    6 	.word REM_IDX 
      002432                       6377 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A0F0 A3 00                    1 	.word LINK 
                           002434     2 	LINK=.
      002434                          3 REBOOT:
      00A0F2 FF                       4 	.byte 6 	
      00A0F3 23 06 0C 01 98 56        5 	.ascii "REBOOT"
      00A0F9 20 F5                    6 	.word RBT_IDX 
      00243D                       6378 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A0FB 35 55                    1 	.word LINK 
                           00243F     2 	LINK=.
      00243F                          3 READ:
      00A0FD 50                       4 	.byte 4+F_IFUNC 	
      00A0FE E0 84 C7 50              5 	.ascii "READ"
      00A102 E1 9F                    6 	.word READ_IDX 
      002446                       6379 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A104 4A 35                    1 	.word LINK 
                           002448     2 	LINK=.
      002448                          3 QKEY:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A106 55                       4 	.byte 4+F_IFUNC 	
      00A107 50 E0 C7 50              5 	.ascii "QKEY"
      00A10B E2 35                    6 	.word QKEY_IDX 
      00244F                       6380 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A10D AA 50                    1 	.word LINK 
                           002451     2 	LINK=.
      002451                          3 PRTI:
      00A10F E0                       4 	.byte 4+F_IFUNC 	
      00A110 81 52 54 49              5 	.ascii "PRTI"
      00A111 00 86                    6 	.word PRTI_IDX 
      002458                       6381 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A111 35 AA                    1 	.word LINK 
                           00245A     2 	LINK=.
      00245A                          3 PRTH:
      00A113 50                       4 	.byte 4+F_IFUNC 	
      00A114 E0 81 54 48              5 	.ascii "PRTH"
      00A116 00 84                    6 	.word PRTH_IDX 
      002461                       6382 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A116 CD 90                    1 	.word LINK 
                           002463     2 	LINK=.
      002463                          3 PRTG:
      00A118 91                       4 	.byte 4+F_IFUNC 	
      00A119 A1 01 27 03              5 	.ascii "PRTG"
      00A11D CC 88                    6 	.word PRTG_IDX 
      00246A                       6383 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A11F FB 85                    1 	.word LINK 
                           00246C     2 	LINK=.
      00A121                          3 PRTF:
      00A121 5D                       4 	.byte 4+F_IFUNC 	
      00A122 27 0A A6 0F              5 	.ascii "PRTF"
      00A126 59 25                    6 	.word PRTF_IDX 
      002473                       6384 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A128 03 4A                    1 	.word LINK 
                           002475     2 	LINK=.
      002475                          3 PRTE:
      00A12A 20                       4 	.byte 4+F_IFUNC 	
      00A12B FA 5F 97 A6              5 	.ascii "PRTE"
      00A12F 84 81                    6 	.word PRTE_IDX 
      00A131                       6385 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A131 CD 90                    1 	.word LINK 
                           00247E     2 	LINK=.
      00247E                          3 PRTD:
      00A133 91                       4 	.byte 4+F_IFUNC 	
      00A134 A1 01 27 03              5 	.ascii "PRTD"
      00A138 CC 88                    6 	.word PRTD_IDX 
      002485                       6386 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A13A FB 85                    1 	.word LINK 
                           002487     2 	LINK=.
      002487                          3 PRTC:
      00A13C 9F                       4 	.byte 4+F_IFUNC 	
      00A13D A4 0F 5F 5C              5 	.ascii "PRTC"
      00A141 4D 27                    6 	.word PRTC_IDX 
      00248E                       6387 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A143 04 58                    1 	.word LINK 
                           002490     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      002490                          3 PRTB:
      00A145 4A                       4 	.byte 4+F_IFUNC 	
      00A146 20 F9 A6 84              5 	.ascii "PRTB"
      00A14A 81 78                    6 	.word PRTB_IDX 
      00A14B                       6388 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A14B CD 90                    1 	.word LINK 
                           002499     2 	LINK=.
      002499                          3 PRTA:
      00A14D 91                       4 	.byte 4+F_IFUNC 	
      00A14E A1 01 27 03              5 	.ascii "PRTA"
      00A152 CC 88                    6 	.word PRTA_IDX 
      0024A0                       6389 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A154 FB 85                    1 	.word LINK 
                           0024A2     2 	LINK=.
      0024A2                          3 PRINT:
      00A156 53                       4 	.byte 5 	
      00A157 A6 84 81 4E 54           5 	.ascii "PRINT"
      00A15A 00 74                    6 	.word PRT_IDX 
      0024AA                       6390 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A15A 85 52                    1 	.word LINK 
                           0024AC     2 	LINK=.
      0024AC                          3 POUT:
      00A15C 04                       4 	.byte 4+F_IFUNC 	
      00A15D 89 90 CE 00              5 	.ascii "POUT"
      00A161 05 17                    6 	.word POUT_IDX 
      0024B3                       6391 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A163 03 90                    1 	.word LINK 
                           0024B5     2 	LINK=.
      0024B5                          3 POKE:
      00A165 CE                       4 	.byte 4 	
      00A166 00 01 17 05              5 	.ascii "POKE"
      00A16A 72 5C                    6 	.word POKE_IDX 
      0024BC                       6392 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A16C 00 21                    1 	.word LINK 
                           0024BE     2 	LINK=.
      0024BE                          3 PINP:
      00A16E 81                       4 	.byte 4+F_IFUNC 	
      00A16F 50 49 4E 50              5 	.ascii "PINP"
      00A16F 72 5D                    6 	.word PINP_IDX 
      0024C5                       6393 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A171 00 21                    1 	.word LINK 
                           0024C7     2 	LINK=.
      0024C7                          3 PEEK:
      00A173 26                       4 	.byte 4+F_IFUNC 	
      00A174 03 CC 88 FB              5 	.ascii "PEEK"
      00A178 00 6C                    6 	.word PEEK_IDX 
      0024CE                       6394 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A178 CD 91                    1 	.word LINK 
                           0024D0     2 	LINK=.
      0024D0                          3 PMODE:
      00A17A D8                       4 	.byte 5 	
      00A17B A1 84 27 03 CC           5 	.ascii "PMODE"
      00A180 88 FB                    6 	.word PMODE_IDX 
      00A182                       6395 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A182 5D 26                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                           0024DA     2 	LINK=.
      0024DA                          3 PAUSE:
      00A184 10                       4 	.byte 5 	
      00A185 1E 03 CF 00 05           5 	.ascii "PAUSE"
      00A18A E6 02                    6 	.word PAUSE_IDX 
      0024E2                       6396 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A18C C7 00                    1 	.word LINK 
                           0024E4     2 	LINK=.
      0024E4                          3 PAD:
      00A18E 04                       4 	.byte 3+F_IFUNC 	
      00A18F 1E 05 CF                 5 	.ascii "PAD"
      00A192 00 01                    6 	.word PAD_IDX 
      0024EA                       6397 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A194 81 E4                    1 	.word LINK 
                           0024EC     2 	LINK=.
      00A195                          3 OR:
      00A195 85                       4 	.byte 2+F_IFUNC 	
      00A196 5B 04                    5 	.ascii "OR"
      00A198 72 5A                    6 	.word OR_IDX 
      0024F1                       6398 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A19A 00 21                    1 	.word LINK 
                           0024F3     2 	LINK=.
      0024F3                          3 ODR:
      00A19C FC                       4 	.byte 3+F_IFUNC 	
      00A19D 4F 44 52                 5 	.ascii "ODR"
      00A19D AE 00                    6 	.word ODR_IDX 
      0024F9                       6399 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A19F 00 A6                    1 	.word LINK 
                           0024FB     2 	LINK=.
      0024FB                          3 NOT:
      00A1A1 84                       4 	.byte 3+F_IFUNC 	
      00A1A2 81 4F 54                 5 	.ascii "NOT"
      00A1A3 00 60                    6 	.word NOT_IDX 
      002501                       6400 	_dict_entry,3,NEW,NEW_IDX;new
      00A1A3 AE 00                    1 	.word LINK 
                           002503     2 	LINK=.
      002503                          3 NEW:
      00A1A5 01                       4 	.byte 3 	
      00A1A6 A6 84 81                 5 	.ascii "NEW"
      00A1A9 00 5E                    6 	.word NEW_IDX 
      002509                       6401 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A1A9 AE 00                    1 	.word LINK 
                           00250B     2 	LINK=.
      00250B                          3 NEXT:
      00A1AB 02                       4 	.byte 4 	
      00A1AC A6 84 81 54              5 	.ascii "NEXT"
      00A1AF 00 5C                    6 	.word NEXT_IDX 
      002512                       6402 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A1AF AE 00                    1 	.word LINK 
                           002514     2 	LINK=.
      002514                          3 MULDIV:
      00A1B1 03                       4 	.byte 6+F_IFUNC 	
      00A1B2 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A1B5 00 5A                    6 	.word MULDIV_IDX 
      00251D                       6403 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1B5 AE 00                    1 	.word LINK 
                           00251F     2 	LINK=.
      00251F                          3 LSHIFT:
      00A1B7 04                       4 	.byte 6+F_IFUNC 	
      00A1B8 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A1BB 00 58                    6 	.word LSHIFT_IDX 
      002528                       6404 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A1BB AE 00                    1 	.word LINK 
                           00252A     2 	LINK=.
      00252A                          3 LOG:
      00A1BD 05                       4 	.byte 3+F_IFUNC 	
      00A1BE A6 84 81                 5 	.ascii "LOG"
      00A1C1 00 56                    6 	.word LOG_IDX 
      002530                       6405 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A1C1 AE 00                    1 	.word LINK 
                           002532     2 	LINK=.
      002532                          3 LOAD:
      00A1C3 06                       4 	.byte 4 	
      00A1C4 A6 84 81 44              5 	.ascii "LOAD"
      00A1C7 00 54                    6 	.word LOAD_IDX 
      002539                       6406 	_dict_entry 4,LIST,LIST_IDX;list
      00A1C7 AE 00                    1 	.word LINK 
                           00253B     2 	LINK=.
      00253B                          3 LIST:
      00A1C9 07                       4 	.byte 4 	
      00A1CA A6 84 81 54              5 	.ascii "LIST"
      00A1CD 00 52                    6 	.word LIST_IDX 
      002542                       6407 	_dict_entry 3,LET,LET_IDX;let 
      00A1CD AE 00                    1 	.word LINK 
                           002544     2 	LINK=.
      002544                          3 LET:
      00A1CF 08                       4 	.byte 3 	
      00A1D0 A6 84 81                 5 	.ascii "LET"
      00A1D3 00 50                    6 	.word LET_IDX 
      00254A                       6408 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A1D3 A6 84                    1 	.word LINK 
                           00254C     2 	LINK=.
      00254C                          3 KEY:
      00A1D5 AE                       4 	.byte 3+F_IFUNC 	
      00A1D6 00 00 81                 5 	.ascii "KEY"
      00A1D9 00 4E                    6 	.word KEY_IDX 
      002552                       6409 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A1D9 A6 84                    1 	.word LINK 
                           002554     2 	LINK=.
      002554                          3 IWDGREF:
      00A1DB AE                       4 	.byte 7 	
      00A1DC 00 01 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1DF 00 4C                    6 	.word IWDGREF_IDX 
      00255E                       6410 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A1DF A6 84                    1 	.word LINK 
                           002560     2 	LINK=.
      002560                          3 IWDGEN:
      00A1E1 AE                       4 	.byte 6 	
      00A1E2 00 02 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1E5 00 4A                    6 	.word IWDGEN_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      002569                       6411 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A1E5 A6 84                    1 	.word LINK 
                           00256B     2 	LINK=.
      00256B                          3 INVERT:
      00A1E7 AE                       4 	.byte 6+F_IFUNC 	
      00A1E8 00 03 81 45 52 54        5 	.ascii "INVERT"
      00A1EB 00 48                    6 	.word INVERT_IDX 
      002574                       6412 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A1EB A6 84                    1 	.word LINK 
                           002576     2 	LINK=.
      002576                          3 INPUT:
      00A1ED AE                       4 	.byte 5 	
      00A1EE 00 04 81 55 54           5 	.ascii "INPUT"
      00A1F1 00 46                    6 	.word INPUT_IDX 
      00257E                       6413 	_dict_entry,2,IF,IF_IDX;if 
      00A1F1 A6 84                    1 	.word LINK 
                           002580     2 	LINK=.
      002580                          3 IF:
      00A1F3 AE                       4 	.byte 2 	
      00A1F4 00 01                    5 	.ascii "IF"
      00A1F6 81 44                    6 	.word IF_IDX 
      00A1F7                       6414 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A1F7 A6 84                    1 	.word LINK 
                           002587     2 	LINK=.
      002587                          3 IDR:
      00A1F9 AE                       4 	.byte 3+F_IFUNC 	
      00A1FA 00 00 81                 5 	.ascii "IDR"
      00A1FD 00 42                    6 	.word IDR_IDX 
      00258D                       6415 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A1FD A6 84                    1 	.word LINK 
                           00258F     2 	LINK=.
      00258F                          3 HEX:
      00A1FF AE                       4 	.byte 3 	
      00A200 40 00 81                 5 	.ascii "HEX"
      00A203 00 40                    6 	.word HEX_IDX 
      002595                       6416 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A203 55 00                    1 	.word LINK 
                           002597     2 	LINK=.
      002597                          3 GPIO:
      00A205 04                       4 	.byte 4+F_IFUNC 	
      00A206 00 02 81 4F              5 	.ascii "GPIO"
      00A209 00 3E                    6 	.word GPIO_IDX 
      00259E                       6417 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A209 CD 91                    1 	.word LINK 
                           0025A0     2 	LINK=.
      0025A0                          3 GOTO:
      00A20B 8F                       4 	.byte 4 	
      00A20C A1 84 27 03              5 	.ascii "GOTO"
      00A210 CC 88                    6 	.word GOTO_IDX 
      0025A7                       6418 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A212 FB CD                    1 	.word LINK 
                           0025A9     2 	LINK=.
      0025A9                          3 GOSUB:
      00A214 84                       4 	.byte 5 	
      00A215 84 5D 26 05 A6           5 	.ascii "GOSUB"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A21A 05 CC                    6 	.word GOSUB_IDX 
      0025B1                       6419 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A21C 88 FD                    1 	.word LINK 
                           0025B3     2 	LINK=.
      00A21E                          3 FORGET:
      00A21E 90                       4 	.byte 6 	
      00A21F 93 EE 04 A3 A2 03        5 	.ascii "FORGET"
      00A225 26 F2                    6 	.word FORGET_IDX 
      0025BC                       6420 	_dict_entry,3,FOR,FOR_IDX;for 
      00A227 90 CF                    1 	.word LINK 
                           0025BE     2 	LINK=.
      0025BE                          3 FOR:
      00A229 00                       4 	.byte 3 	
      00A22A 07 90 E6                 5 	.ascii "FOR"
      00A22D 02 C7                    6 	.word FOR_IDX 
      0025C4                       6421 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A22F 00 0A                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 FCPU:
      00A231 35                       4 	.byte 4 	
      00A232 06 00 09 81              5 	.ascii "FCPU"
      00A236 00 34                    6 	.word FCPU_IDX 
      0025CD                       6422 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A236 72 5F                    1 	.word LINK 
                           0025CF     2 	LINK=.
      0025CF                          3 EEPROM:
      00A238 00                       4 	.byte 6+F_IFUNC 	
      00A239 07 72 5F 00 08 72        5 	.ascii "EEPROM"
      00A23F 5F 00                    6 	.word EEPROM_IDX 
      0025D8                       6423 	_dict_entry,3,END,END_IDX;cmd_end  
      00A241 09 72                    1 	.word LINK 
                           0025DA     2 	LINK=.
      0025DA                          3 END:
      00A243 5F                       4 	.byte 3 	
      00A244 00 0A CE                 5 	.ascii "END"
      00A247 00 1D                    6 	.word END_IDX 
      00A249                       6424 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A249 C3 00                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 DWRITE:
      00A24B 1F                       4 	.byte 6+F_CMD 	
      00A24C 24 17 90 93 EE 04        5 	.ascii "DWRITE"
      00A252 A3 A2                    6 	.word DWRITE_IDX 
      0025EB                       6425 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A254 03 26                    1 	.word LINK 
                           0025ED     2 	LINK=.
      0025ED                          3 DREAD:
      00A256 1A                       4 	.byte 5+F_IFUNC 	
      00A257 90 CF 00 07 90           5 	.ascii "DREAD"
      00A25C E6 02                    6 	.word DREAD_IDX 
      0025F5                       6426 	_dict_entry,2,DO,DO_IDX;do_loop
      00A25E C7 00                    1 	.word LINK 
                           0025F7     2 	LINK=.
      0025F7                          3 DO:
      00A260 0A                       4 	.byte 2 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A261 35 06                    5 	.ascii "DO"
      00A263 00 09                    6 	.word DO_IDX 
      0025FC                       6427 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A265 72 5D                    1 	.word LINK 
                           0025FE     2 	LINK=.
      0025FE                          3 DIR:
      00A267 00                       4 	.byte 3 	
      00A268 0A 26 05                 5 	.ascii "DIR"
      00A26B A6 0C                    6 	.word DIR_IDX 
      002604                       6428 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A26D CC 88                    1 	.word LINK 
                           002606     2 	LINK=.
      002606                          3 DEC:
      00A26F FD                       4 	.byte 3 	
      00A270 81 45 43                 5 	.ascii "DEC"
      00A271 00 26                    6 	.word DEC_IDX 
      00260C                       6429 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A271 93 E6                    1 	.word LINK 
                           00260E     2 	LINK=.
      00260E                          3 DDR:
      00A273 02                       4 	.byte 3+F_IFUNC 	
      00A274 C7 00 0E                 5 	.ascii "DDR"
      00A277 72 5F                    6 	.word DDR_IDX 
      002614                       6430 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A279 00 0D                    1 	.word LINK 
                           002616     2 	LINK=.
      002616                          3 DATALN:
      00A27B 72                       4 	.byte 6 	
      00A27C BB 00 0D 20 C8 4E        5 	.ascii "DATALN"
      00A281 00 22                    6 	.word DATALN_IDX 
      00261F                       6431 	_dict_entry,4,DATA,DATA_IDX;data  
      00A281 52 06                    1 	.word LINK 
                           002621     2 	LINK=.
      00A283                          3 DATA:
      00A283 C6                       4 	.byte 4 	
      00A284 00 09 C1 00              5 	.ascii "DATA"
      00A288 0A 27                    6 	.word DATA_IDX 
      002628                       6432 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A28A 37 CD                    1 	.word LINK 
                           00262A     2 	LINK=.
      00262A                          3 CRL:
      00A28C 95                       4 	.byte 3+F_IFUNC 	
      00A28D ED CE 00                 5 	.ascii "CRL"
      00A290 07 CF                    6 	.word CRL_IDX 
      002630                       6433 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A292 00 05                    1 	.word LINK 
                           002632     2 	LINK=.
      002632                          3 CRH:
      00A294 55                       4 	.byte 3+F_IFUNC 	
      00A295 00 09 00                 5 	.ascii "CRH"
      00A298 02 55                    6 	.word CRH_IDX 
      002638                       6434 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A29A 00 0A                    1 	.word LINK 
                           00263A     2 	LINK=.
      00263A                          3 CHAR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A29C 00                       4 	.byte 4+F_CFUNC 	
      00A29D 04 CD 91 8F              5 	.ascii "CHAR"
      00A2A1 A1 84                    6 	.word CHAR_IDX 
      002641                       6435 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A2A3 27 03                    1 	.word LINK 
                           002643     2 	LINK=.
      002643                          3 BYE:
      00A2A5 CC                       4 	.byte 3 	
      00A2A6 88 FB 45                 5 	.ascii "BYE"
      00A2A8 00 18                    6 	.word BYE_IDX 
      002649                       6436 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A2A8 1F 05                    1 	.word LINK 
                           00264B     2 	LINK=.
      00264B                          3 BTOGL:
      00A2AA CD                       4 	.byte 5 	
      00A2AB 89 ED CE 00 05           5 	.ascii "BTOGL"
      00A2B0 CF 00                    6 	.word BTOGL_IDX 
      002653                       6437 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A2B2 07 55                    1 	.word LINK 
                           002655     2 	LINK=.
      002655                          3 BTEST:
      00A2B4 00                       4 	.byte 5+F_IFUNC 	
      00A2B5 02 00 09 CD 95           5 	.ascii "BTEST"
      00A2BA FD 1E                    6 	.word BTEST_IDX 
      00265D                       6438 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A2BC 05 A6                    1 	.word LINK 
                           00265F     2 	LINK=.
      00265F                          3 BSET:
      00A2BE 84                       4 	.byte 4 	
      00A2BF 5B 06 81 54              5 	.ascii "BSET"
      00A2C2 00 12                    6 	.word BSET_IDX 
      002666                       6439 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A2C2 90 CE                    1 	.word LINK 
                           002668     2 	LINK=.
      002668                          3 BRES:
      00A2C4 00                       4 	.byte 4 	
      00A2C5 07 72 5F 00              5 	.ascii "BRES"
      00A2C9 07 72                    6 	.word BRES_IDX 
      00266F                       6440 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A2CB 5F 00                    1 	.word LINK 
                           002671     2 	LINK=.
      002671                          3 BIT:
      00A2CD 08                       4 	.byte 3+F_IFUNC 	
      00A2CE 72 5F 00                 5 	.ascii "BIT"
      00A2D1 09 72                    6 	.word BIT_IDX 
      002677                       6441 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A2D3 5F 00                    1 	.word LINK 
                           002679     2 	LINK=.
      002679                          3 AWU:
      00A2D5 0A                       4 	.byte 3 	
      00A2D6 CD A2 71                 5 	.ascii "AWU"
      00A2D9 20 A8                    6 	.word AWU_IDX 
      00A2DB                       6442 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A2DB CD 90                    1 	.word LINK 
                           002681     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002681                          3 AUTORUN:
      00A2DD 96                       4 	.byte 7 	
      00A2DE A1 02 27 03 CC 88 FB     5 	.ascii "AUTORUN"
      00A2E5 00 0A                    6 	.word AUTORUN_IDX 
      00268B                       6443 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A2E5 72 12                    1 	.word LINK 
                           00268D     2 	LINK=.
      00268D                          3 ASC:
      00A2E7 50                       4 	.byte 3+F_IFUNC 	
      00A2E8 C7 85 5D                 5 	.ascii "ASC"
      00A2EB 27 21                    6 	.word ASC_IDX 
      002693                       6444 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A2ED 85 A6                    1 	.word LINK 
                           002695     2 	LINK=.
      002695                          3 AND:
      00A2EF 08                       4 	.byte 3+F_IFUNC 	
      00A2F0 42 9F C7                 5 	.ascii "AND"
      00A2F3 52 00                    6 	.word AND_IDX 
      00269B                       6445 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A2F5 72 1A                    1 	.word LINK 
                           00269D     2 	LINK=.
      00269D                          3 ADCREAD:
      00A2F7 50                       4 	.byte 7+F_IFUNC 	
      00A2F8 14 72 1A 50 16 72 14     5 	.ascii "ADCREAD"
      00A2FF 52 00                    6 	.word ADCREAD_IDX 
      0026A7                       6446 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A301 72 12                    1 	.word LINK 
                           0026A9     2 	LINK=.
      0026A9                          3 ADCON:
      00A303 52                       4 	.byte 5 	
      00A304 01 72 10 52 01           5 	.ascii "ADCON"
      00A309 72 1C                    6 	.word ADCON_IDX 
      0026B1                       6447 kword_dict:
      0026B1                       6448 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A30B 52 00                    1 	.word LINK 
                           0026B3     2 	LINK=.
      0026B3                          3 ABS:
      00A30D 81                       4 	.byte 3+F_IFUNC 	
      00A30E 41 42 53                 5 	.ascii "ABS"
      00A30E 5B 02                    6 	.word ABS_IDX 
                                   6449 
                                   6450 ;comands and fonctions address table 	
      0026B9                       6451 code_addr:
      00A310 A6 82 C4 52 03 A1 02  6452 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             26 F7 72 1D 52 00 72
             13 50
      00A320 C7 72 1B 50 16 81 16  6453 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             45 1D 8C 1C F8 21 6B
      00A326 21 65 21 83 21 89 21  6454 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             5F 11 F9 1C 3F 20 DA
             19 06 19 36
      00A326 A6 78 C5 52 03 27 04  6455 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             72 5F 52 03 81 17 90
             1D 3F
      00A332 11 F4 21 59 16 9C 15  6456 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



             8D 20 CB 20 5B 20 91
             1D 2A
      00A332 88 CD A3 26 84 72 03  6457 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             52 03 FB C7 52 04 72
             01 52
      00A342 03 FB C6 52 04 81 23  6458 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             12 1D F8 1E F4 16 8B
             21 77
      00A348 16 7C 21 71 14 FC 21  6459 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             1D 21 23 21 29 21 2F
             21 35
      00A348 A6 FF 72 01 52 03 E3  6460 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             C6 52 04 81 01 05 D8
             15 F9
      00A353 21 B6 17 CB 1F 65 1E  6461 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             CF 17 E9 1A AE 11 B3
             11 FE
      00A353 CD 91 8F A1 84 27 03  6462 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             CC 88 FB 17 09 19 71
             1E 54
      00A35D 20 32 20 41 16 D9 18  6463 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             52 12 08 1D 69 20 EF
             1D 6F
      00A35D 9F CD A3 32 CD 89 ED  6464 	.word wait,words,write,bit_xor ; 96..103 
             A1
      00A365 09 26                 6465 	.word 0 
                                   6466 
      002800                       6467 	.bndry 128 ; align on FLASH block.
                                   6468 ; free space for user application  
      002800                       6469 user_space:
                                   6470 ; USR() function test
      00A367 02               [ 2] 6471 	pushw x 
      00A368 20 E9 4D 27      [ 1] 6472 	bset PC_ODR,#5 
      00A36C 05               [ 2] 6473 	popw x 
      00A36D 55 00 03         [ 4] 6474 	call pause02 
      00A370 00 02 81 0A      [ 1] 6475 	bres PC_ODR,#5 
      00A373 81               [ 4] 6476 	ret
                                   6477 
                                   6478 	.area FLASH_DRIVE (ABS)
      010000                       6479 	.org 0x10000
      010000                       6480 fdrive:
                                   6481 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026B3 R   |     ABS_IDX =  000000 
    ACK     =  000006     |   5 ADCON      0026A9 R   |     ADCON_ID=  000002 
  5 ADCREAD    00269D R   |     ADCREAD_=  000004     |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002695 R
    AND_IDX =  000006     |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        00268D R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
  5 AUTORUN    002681 R   |     AUTORUN_=  00000A     |     AUTORUN_=  004000 
  5 AWU        002679 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000C 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   5 BIT        002671 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000E     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       002668 R   |     BRES_IDX=  000010     |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       00265F R   |     BSET_IDX=  000012 
    BSIZE   =  000001     |   5 BTEST      002655 R   |     BTEST_ID=  000014 
  5 BTOGL      00264B R   |     BTOGL_ID=  000016     |     BTW     =  000001 
  5 BYE        002643 R   |     BYE_IDX =  000018     |     C       =  000001 
    CAN     =  000018     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
    CAN_IER =  005425     |     CAN_MCR =  005420     |     CAN_MSR =  005421 
    CAN_P0  =  005428     |     CAN_P1  =  005429     |     CAN_P2  =  00542A 
    CAN_P3  =  00542B     |     CAN_P4  =  00542C     |     CAN_P5  =  00542D 
    CAN_P6  =  00542E     |     CAN_P7  =  00542F     |     CAN_P8  =  005430 
    CAN_P9  =  005431     |     CAN_PA  =  005432     |     CAN_PB  =  005433 
    CAN_PC  =  005434     |     CAN_PD  =  005435     |     CAN_PE  =  005436 
    CAN_PF  =  005437     |     CAN_RFR =  005424     |     CAN_TPR =  005423 
    CAN_TSR =  005422     |     CC_C    =  000000     |     CC_H    =  000004 
    CC_I0   =  000003     |     CC_I1   =  000005     |     CC_N    =  000002 
    CC_V    =  000007     |     CC_Z    =  000001     |     CELL_SIZ=  000002 
    CFG_GCR =  007F60     |     CFG_GCR_=  000001     |     CFG_GCR_=  000000 
  5 CHAR       00263A R   |     CHAR_IDX=  00001A     |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

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
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002632 R
    CRH_IDX =  00001C     |   5 CRL        00262A R   |     CRL_IDX =  00001E 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       002621 R
  5 DATALN     002616 R   |     DATALN_I=  000022     |     DATA_IDX=  000020 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        00260E R   |     DDR_IDX =  000024 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   5 DEC        002606 R   |     DEC_IDX =  000026 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0025FE R   |     DIR_IDX =  000028     |     DIVDNDHI=  00000B 
    DIVDNDLO=  00000D     |     DIVISOR =  000001     |     DIVISR  =  000007 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0025F7 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  00002A     |   5 DREAD      0025ED R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    DREAD_ID=  00002C     |   5 DWRITE     0025E2 R   |     DWRITE_I=  00002E 
  5 EEPROM     0025CF R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  000032     |     EEPROM_S=  000800     |     EM      =  000019 
  5 END        0025DA R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025C6 R
    FCPU_IDX=  000034     |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FIRST_DA=  000006 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        0025BE R
  5 FORGET     0025B3 R   |     FORGET_I=  000038     |     FOR_IDX =  000036 
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      0025A9 R   |     GOSUB_ID=  00003A 
  5 GOTO       0025A0 R   |     GOTO_IDX=  00003C     |   5 GPIO       002597 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        00258F R   |     HEX_IDX =  000040     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000006     |     I2C_SR1_=  000000     |     I2C_SR1_=  000004 
    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        002587 R   |     IDR_IDX =  000042     |   5 IF         002580 R
    IF_IDX  =  000044     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002576 R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     00256B R
    INVERT_I=  000048     |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     002560 R   |     IWDGEN_I=  00004A 
  5 IWDGREF    002554 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        00254C R
    KEY_IDX =  00004E     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        002544 R   |     LET_IDX =  000050 
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  0026B3 R   |   5 LIST       00253B R   |     LIST_IDX=  000052 
    LL      =  000001     |     LLEN    =  000002     |     LN_PTR  =  000005 
  5 LOAD       002532 R   |     LOAD_IDX=  000054     |   5 LOG        00252A R
    LOG_IDX =  000056     |   5 LSHIFT     00251F R   |     LSHIFT_I=  000058 
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   5 MULDIV     002514 R
    MULDIV_I=  00005A     |     MULOP   =  000003     |     N1      =  000001 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        002503 R
    NEW_FREE=  000001     |     NEW_IDX =  00005E     |   5 NEXT       00250B R
    NEXT_IDX=  00005C     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

  5 NOT        0024FB R   |     NOT_IDX =  000060     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0024F3 R   |     ODR_IDX =  000062     |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024EC R
    OR_IDX  =  000064     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
  5 PAD        0024E4 R   |     PAD_IDX =  000066     |     PAD_SIZE=  000080 
  5 PAUSE      0024DA R   |     PAUSE_ID=  000068     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0024C7 R   |     PEEK_IDX=  00006C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       0024BE R   |     PINP_IDX=  00006E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 PMODE      0024D0 R   |     PMODE_ID=  00006A 
  5 POKE       0024B5 R   |     POKE_IDX=  000070     |     PORT    =  000003 
  5 POUT       0024AC R   |     POUT_IDX=  000072     |     PREV    =  000001 
  5 PRINT      0024A2 R   |   5 PRTA       002499 R   |     PRTA_IDX=  000076 
  5 PRTB       002490 R   |     PRTB_IDX=  000078     |   5 PRTC       002487 R
    PRTC_IDX=  00007A     |   5 PRTD       00247E R   |     PRTD_IDX=  00007C 
  5 PRTE       002475 R   |     PRTE_IDX=  00007E     |   5 PRTF       00246C R
    PRTF_IDX=  000080     |   5 PRTG       002463 R   |     PRTG_IDX=  000082 
  5 PRTH       00245A R   |     PRTH_IDX=  000084     |   5 PRTI       002451 R
    PRTI_IDX=  000086     |     PRT_IDX =  000074     |     PSTR    =  000003 
  5 QKEY       002448 R   |     QKEY_IDX=  000088     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     RBT_IDX =  00008C 
  5 READ       00243F R   |     READ_IDX=  00008A     |   5 REBOOT     002434 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     002429 R
    REM_IDX =  00008E     |   5 RESTORE    00241D R   |     REST_IDX=  000090 
    RETL1   =  000001     |   5 RETURN     002412 R   |     RET_ADDR=  000003 
    RET_IDX =  000092     |     RET_INW =  000005     |   5 RND        00240A R
    RND_IDX =  000094     |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     0023FF R   |     RSHIFT_I=  000096     |     RST_SR  =  0050B3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 RUN        0023F7 R   |     RUN_IDX =  000098     |     RX_QUEUE=  000008 
  5 SAVE       0023EE R   |     SAVE_IDX=  00009A     |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023E5 R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       0023DC R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      0023D2 R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0023BE R   |     SPIEN_ID=  0000A4     |   5 SPIRD      0023C8 R
    SPIRD_ID=  0000A2     |   5 SPISEL     0023B3 R   |     SPISEL_I=  0000A6 
  5 SPIWR      0023A9 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       0023A0 R
    STEP_IDX=  0000AA     |   5 STOP       002397 R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      00238D R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    002377 R   |   5 TIMER      002383 R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000006 
    TK_CFUNC=  000082     |     TK_CHAR =  000003     |     TK_CMD  =  000080 
    TK_COLON=  000001     |     TK_COMMA=  000009     |     TK_CONST=  000083 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LE   =  000036 
    TK_LPARE=  000007     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000008     |     TK_SHARP=  00000A     |     TK_VAR  =  000085 
    TMROUT_I=  0000B2     |   5 TO         002370 R   |   5 TONE       002367 R
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |   5 Timer4Up   00004F R
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
    UBC     =  004801     |   5 UBOUND     00235C R   |     UBOUND_I=  0000B8 
  5 UBTN_Han   000092 R   |   5 UFLASH     002351 R   |     UFLASH_I=  0000BA 
  5 UNTIL      002347 R   |     UNTIL_ID=  0000BC     |     US      =  00001F 
  5 USER_ABO   00009A R   |   5 USR        00233F R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BE 
  5 Uart1RxH   00000F R   |   5 UserButt   000065 R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       002336 R   |     WAIT_IDX=  0000C0     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      00232C R   |     WORDS_ID=  0000C2 
  5 WRITE      002322 R   |     WRITE_ID=  0000C4     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        00231A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    XOR_IDX =  0000C6     |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        001E5A R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   0014BC R
  5 add_spac   0012E6 R   |   5 analog_r   0018D2 R   |   5 arduino_   001F45 R
  5 arg_list   001016 R   |   1 array_si   000021 R   |   5 ascii      001D0A R
  5 at_tst     000CA8 R   |   5 atoi24     000DB9 GR  |   5 atoi_exi   000E1F R
  5 autorun    001D95 R   |   5 autorun_   0006D2 R   |   5 awu        001E0B R
  5 awu02      001E15 R   |   5 bad_port   001D64 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       00185F R   |   5 beep_1kh   001849 GR
  5 bin_exit   000B86 R   |   5 bit_and    001E6E R   |   5 bit_or     001E86 R
  5 bit_rese   001634 R   |   5 bit_set    001624 R   |   5 bit_test   001655 R
  5 bit_togg   001645 R   |   5 bit_xor    001E9E R   |   5 bitmask    0020B1 R
  5 bkslsh_t   000C55 R   |   5 block_er   0001BB R   |   5 break_po   00199F R
  5 bye        001D8C R   |   5 cancel_a   00069A R   |   5 char       001CF8 R
  5 clear_ba   0006E7 R   |   5 clear_va   000561 R   |   5 clock_in   0000B5 R
  5 cmd_end    001842 R   |   5 cmd_line   000905 R   |   5 cmd_name   000F85 R
  5 cmp_name   001A40 R   |   5 code_add   0026B9 R   |   5 cold_sta   0005D8 R
  5 colon_ts   000C7C R   |   5 comma_ts   000C87 R   |   5 comp_msg   00085B R
  5 compile    0004EE R   |   5 const_cr   002165 R   |   5 const_cr   00216B R
  5 const_dd   00215F R   |   5 const_ee   00217D R   |   5 const_id   002159 R
  5 const_in   002177 R   |   5 const_od   002153 R   |   5 const_ou   002171 R
  5 const_po   00211D R   |   5 const_po   002123 R   |   5 const_po   002129 R
  5 const_po   00212F R   |   5 const_po   002135 R   |   5 const_po   00213B R
  5 const_po   002141 R   |   5 const_po   002147 R   |   5 const_po   00214D R
  5 convert_   000AFD R   |   5 copy_com   000CDD R   |   1 count      000003 GR
  5 cp_loop    000FC5 R   |   5 cpy_cmd_   0012D1 R   |   5 cpy_quot   00130A R
  5 create_g   000455 R   |   5 cs_high    00230D R   |   5 cstk_pro   0011CD R
  5 dash_tst   000C9D R   |   5 data       002183 R   |   1 data_len   000009 R
  5 data_lin   002189 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   0021C9 R   |   5 dbl_sign   000EED R   |   5 dec_base   0011F9 R
  5 decomp_l   0013BB R   |   5 decompil   001374 GR  |   5 del_line   000428 R
  5 digital_   001906 R   |   5 digital_   001936 R   |   5 dir_loop   001C4B R
  5 director   001C3F R   |   5 disk_fre   001A2D R   |   5 div32_16   000EF7 R
  5 divide     000F4E R   |   5 divu24_8   000A40 R   |   5 dneg       000EE2 R
  5 do_loop    0020DA R   |   5 do_progr   0001AE R   |   5 drive_fr   001CB4 R
  5 enable_i   00205B R   |   5 eql_tst    000D32 R   |   5 equal      0014CF R
  5 erase_fl   0001DA R   |   5 err_bad_   0007C7 R   |   5 err_buf_   00083D R
  5 err_cmd_   00078B R   |   5 err_div0   000750 R   |   5 err_dupl   0007A5 R
  5 err_math   000737 R   |   5 err_mem_   00071C R   |   5 err_msg    0006FC R
  5 err_no_a   0007D3 R   |   5 err_no_d   000806 R   |   5 err_no_f   00082A R
  5 err_no_l   00075F R   |   5 err_no_p   000816 R   |   5 err_not_   0007B6 R
  5 err_run_   000775 R   |   5 err_synt   000729 R   |   5 escaped    000B12 R
  5 expect     001004 R   |   5 expr_exi   001155 R   |   5 expressi   00110F R
  5 factor     001066 R   |   1 farptr     000016 R   |   5 fcpu       001EE8 R
  7 fdrive     010000 R   |   1 ffree      000019 R   |   5 file_cou   001CAC R
  5 first_li   00127E R   |   1 flags      000023 R   |   5 for        0016B0 R
  5 forget     001BD8 R   |   1 free_ram   000063 R   |   5 func_arg   001011 R
  5 func_not   00204E R   |   5 ge         0014D1 R   |   5 get_arra   001041 R
  5 get_cmd_   001353 R   |   5 get_targ   00177A R   |   5 get_tick   001E54 R
  5 get_toke   000BEE R   |   5 getc       0002C9 GR  |   5 gosub      0017AB R
  5 goto       001790 R   |   5 gpio       001D3F R   |   5 gt         0014CD R
  5 gt_tst     000D3D R   |   5 hex_base   0011F4 R   |   5 hex_dump   000359 R
  5 if         00169C R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   0019ED R   |   5 input_ex   0015F6 R
  5 input_lo   00158F R   |   5 input_va   00158D R   |   5 insert_l   000481 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 insert_l   0004EB R   |   5 interp_l   000946 R   |   5 interpre   000921 R
  5 invert     0020CB R   |   5 is_alnum   000589 R   |   5 is_alpha   00056F R
  5 is_digit   000580 R   |   5 itoa       0009E6 R   |   5 itoa_loo   000A05 R
  5 jp_to_ta   00179E R   |   5 key        001D2A R   |   5 kw_loop    000BA2 R
  5 kword_di   0026B1 R   |   5 kword_en   002318 R   |   5 le         0014D6 R
  5 leading_   0020A1 R   |   5 let        00122A R   |   5 let_arra   001238 R
  5 let_var    00123B R   |   5 lines_sk   001281 R   |   5 list       001255 R
  5 list_exi   0012C3 R   |   5 list_loo   0012A1 R   |   5 load       001BA8 R
  5 load_aut   0006A9 R   |   5 load_fil   001B77 R   |   5 log2       002096 R
  5 logical_   002044 R   |   5 long_div   000ECA R   |   5 loop_bac   00175D R
  1 loop_dep   000020 R   |   5 loop_don   001772 R   |   5 lshift     001EB6 R
  5 lt         0014D4 R   |   5 lt_tst     000D66 R   |   5 modulo     000F64 R
  5 move       0003C2 GR  |   5 move_dow   0003E0 R   |   5 move_era   000140 R
  5 move_exi   000401 R   |   5 move_loo   0003E5 R   |   5 move_prg   000174 R
  5 move_up    0003D2 R   |   5 mul_char   0014BE R   |   5 muldiv     000F69 R
  5 multiply   000E95 R   |   5 mulu24_8   000A68 R   |   5 nbr_tst    000C21 R
  5 ne         0014D9 R   |   5 neg_acc2   000AA2 R   |   5 new        0019BD R
  5 next       001730 R   |   5 next_lin   000929 R   |   5 next_tok   00096D R
  5 no_match   000FD7 R   |   5 other      000D8F R   |   3 pad        0016E0 R
  5 pad_ref    002312 R   |   5 parse_bi   000B64 R   |   5 parse_in   000B1A R
  5 parse_ke   000BA1 R   |   5 parse_qu   000AC5 R   |   5 pause      001DF8 R
  5 pause02    001E02 R   |   5 peek       00168B R   |   5 pin_mode   001EF4 R
  5 plus_tst   000D06 R   |   5 poke       00167C R   |   5 power_ad   001896 R
  5 prcnt_ts   000D27 R   |   5 print      0014FC R   |   5 print_ex   001561 R
  5 print_in   0009CA R   |   5 printxy    000E36 R   |   5 program_   000154 R
  5 program_   000174 R   |   5 prt_basi   0014DC R   |   5 prt_loop   001500 R
  5 prt_tok    0002EB R   |   5 prti24     0009DA R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002C0 GR  |     puts       ****** GX
  5 qkey       001D32 GR  |   5 qmark_ts   000CB3 R   |   5 random     001F65 R
  5 read       002201 R   |   5 read01     002203 R   |     readln     ****** GX
  5 refresh_   002091 R   |   5 rel_exit   0011B0 R   |   5 relation   001158 R
  5 relop_st   0014C1 R   |   5 remark     0015F9 R   |   5 reset_co   0014FE R
  5 rest_con   00157D R   |   5 restore    0021B6 R   |   5 return     0017CB R
  5 right_al   0012F8 R   |   5 row_alig   0019D2 R   |   5 row_eras   000119 R
  5 row_eras   000140 R   |   5 row_loop   00033C R   |   5 rparnt_t   000C71 R
  5 rshift     001ECF R   |   5 rt_msg     00084A R   |   5 run        0017E9 R
  5 run_it     00181B R   |   1 rx_head    00002D R   |   1 rx_queue   000025 R
  1 rx_tail    00002E R   |   5 save       001AAE R   |   5 save_con   00156D R
  5 search_d   000FB7 R   |   5 search_e   001001 R   |   5 search_f   001A61 R
  5 search_l   000404 GR  |   5 search_l   00040C R   |   5 search_n   000FBB R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   0019FB R
  5 select_p   001F35 R   |   5 set_time   002032 R   |   5 sharp_ts   000C92 R
  5 show       0011B3 R   |   5 show_row   00032A R   |   5 single_c   0014B7 R
  5 size       0011FE R   |   5 skip       000E23 R   |   5 slash_ts   000D1C R
  5 sleep      001DED R   |   5 software   000592 R   |     spaces     ****** GX
  5 spi_clea   0022A6 R   |   5 spi_disa   00228E R   |   5 spi_enab   00225B R
  5 spi_rcv_   0022C8 R   |   5 spi_read   0022F3 R   |   5 spi_sele   0022FB R
  5 spi_send   0022B2 R   |   5 spi_writ   0022D3 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D11 R   |   5 step       001709 R
  5 stop       001971 R   |   5 store_lo   00171D R   |   5 str_matc   000FE4 R
  5 str_tst    000C11 R   |   5 strcmp     0003A3 R   |   5 strcpy     0003B4 R
  5 strlen     000396 GR  |   5 syntax_e   00087B R   |   1 tab_widt   000024 R
  5 tb_error   00087D R   |   5 term       0010C0 R   |   5 term01     0010C9 R
  5 term_exi   00110C R   |   3 tib        001690 GR  |   5 tick_tst   000CCB R
  1 ticks      00000E R   |   5 timeout    002041 R   |   1 timer      000010 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 timer2_i   0000CB R   |   5 timer4_i   0000D8 R   |   5 tk_id      00086B R
  5 to         0016D9 R   |   5 to_eepro   000197 R   |   5 to_flash   0001AB R
  5 to_upper   000DAD GR  |   5 token_ch   000DA6 R   |   5 token_ex   000DAA R
  5 token_ms   000322 R   |   5 tone       001852 R   |   5 try_next   0021F1 R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart1_in   00027D R
  5 uart1_se   00028D R   |   5 ubound     001208 R   |   5 udiv32_1   000EB8 R
  5 uflash     001D69 R   |   5 umstar     000E5B R   |   5 unlock_e   0000ED R
  5 unlock_f   000103 R   |   5 until      0020EF R   |   5 user_int   000078 R
  5 user_spa   002800 R   |   5 usr        001D6F R   |   5 var_name   00134B R
  1 vars       00002F R   |   5 wait       0015FF R   |   5 warm_ini   00067C R
  5 warm_sta   000902 R   |   5 words      001FCC R   |   5 words_co   00201C R
  5 write      001CC1 R   |   5 write_bl   00025A R   |   5 write_by   0001E5 R
  5 write_ee   000221 R   |   5 write_ex   000255 R   |   5 write_fl   00020B R
  5 write_ro   000188 R   |   5 zero_pad   0019C7 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
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

