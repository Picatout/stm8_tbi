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
      0080F7 CD 94 09         [ 4]  249 	call prt_basic_line
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
      0082DF CD 9A 27         [ 4]  589 	call incr_farptr
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



      008582 CD 8C FC         [ 4] 1152 	call get_token
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
      0085A6 CD 8C FC         [ 4] 1167 	call get_token 
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



      0086CD CD 9A 35         [ 4] 1307 	call seek_fdrive 
      0086D0 9A               [ 1] 1308 	rim 
      0086D1 72 5C 00 16      [ 1] 1309 	inc seedy+1 
      0086D5 72 5C 00 14      [ 1] 1310 	inc seedx+1 
      0086D9 CD 87 61         [ 4] 1311 	call clear_basic
      0086DC CD 92 EF         [ 4] 1312 	call ubound 
                                   1313 ;	jra 2$	
                                   1314 ; 150 msec beep 
      0086DF AE 00 96         [ 2] 1315 	ldw x,#150 
      0086E2 90 AE 03 E6      [ 2] 1316 	ldw y,#998 
      0086E6 CD 98 99         [ 4] 1317 	call beep  
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
      00872B CD 9A 9B         [ 4] 1359 	call search_file
      00872E 25 05            [ 1] 1360 	jrc 2$ 
                                   1361 ; if file doesn't exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008730 CD 87 14         [ 4] 1362 	call cancel_autorun
      008733 20 16            [ 2] 1363 	jra 9$ 
      008735 CD 9B B1         [ 4] 1364 2$:	call load_file
      008738 AE 40 00         [ 2] 1365 	ldw x,#AUTORUN_NAME 
      00873B CD 83 33         [ 4] 1366 	call puts
      00873E AE 87 4C         [ 2] 1367 	ldw x,#autorun_msg 
      008741 CD 83 33         [ 4] 1368 	call puts 
      008744 72 1C 00 24      [ 1] 1369 	bset flags,#FAUTORUN 
      008748 CC 98 5E         [ 2] 1370 	jp run_it    
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
      008923 09 AE 88 E5      [ 2] 1440 	addw x,basicptr 
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
      008989 CD 8B 47 72 5D   [ 2] 1502 	btjf flags, #FRUN, cmd_line
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
      0089D1 05 CD 93 22      [ 1] 1554 	inc in  
      0089D5 20               [ 1] 1555 	tnz a 
      0089D6 E9 2B            [ 1] 1556 	jrmi 6$
      0089D7 A1 06            [ 1] 1557 	cp a,#TK_ARRAY
      0089D7 A1 06            [ 1] 1558 	jrpl 9$  ; no attribute for these
      0089D9 26 05            [ 1] 1559 	cp a,#TK_COLON
      0089DB CD 93            [ 1] 1560 	jreq 9$  
      00098C                       1561 1$: ; 
      0089DD 1F 20            [ 1] 1562 	cp a,#TK_CHAR
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
                                   1609 ;   A          string length
                                   1610 ;    X          pointer to string  
                                   1611 ;------------------------------------
                           000001  1612 	SPCNT=1
                           000011  1613 	VSIZE=17 
      0009CC                       1614 prti24:
      0009CC                       1615 	_vars VSIZE 
      008A0C A1 03            [ 2]    1     sub sp,#VSIZE 
      008A0E 26 0B 91         [ 4] 1616     call itoa  ; conversion entier en  .asciz
      008A11 D6 01            [ 1] 1617 	ld (SPCNT,sp),a 
      008A13 72 5C            [ 1] 1618 1$: ld a,(SPCNT,sp)
      008A15 00 02 41         [ 1] 1619 	cp a,tab_width
      008A18 A6 03            [ 1] 1620 	jruge 4$
      008A1A 81 A1            [ 1] 1621 	ld  a,#SPACE
      008A1C 02               [ 2] 1622 	decw x
      008A1D 26               [ 1] 1623     ld (x),a 
      008A1E 1C 93            [ 1] 1624 	inc (SPCNT,sp)
      008A20 72 BB            [ 2] 1625 	jra 1$ 
      0009E2                       1626 4$: 
      008A22 00 01 91         [ 4] 1627 	call puts 
      0009E5                       1628 5$: _drop VSIZE 
      008A25 6D 01            [ 2]    1     addw sp,#VSIZE 
      008A27 27               [ 4] 1629     ret	
                                   1630 
                                   1631 ;------------------------------------
                                   1632 ; convert integer in acc24 to string
                                   1633 ; input:
                                   1634 ;   'base'	conversion base 
                                   1635 ;	acc24	integer to convert
                                   1636 ; output:
                                   1637 ;   X  		pointer to first char of string
                                   1638 ;   A       string length
                                   1639 ;------------------------------------
                           000001  1640 	SIGN=1  ; integer sign 
                           000002  1641 	LEN=2 
                           000003  1642 	PSTR=3
                           000004  1643 	VSIZE=4 ;locals size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0009E8                       1644 itoa:
      0009E8                       1645 	_vars VSIZE
      008A28 0E 72            [ 2]    1     sub sp,#VSIZE 
      008A2A 5C 00            [ 1] 1646 	clr (LEN,sp) ; string length  
      008A2C 02 20            [ 1] 1647 	clr (SIGN,sp)    ; sign
      008A2E F5 00 0A         [ 1] 1648 	ld a,base 
      008A2F A1 0A            [ 1] 1649 	cp a,#10
      008A2F 91 DE            [ 1] 1650 	jrne 1$
                                   1651 	; base 10 string display with negative sign if bit 23==1
      008A31 01 51 72 5C 00   [ 2] 1652 	btjf acc24,#7,1$
      008A36 02 72            [ 1] 1653 	cpl (SIGN,sp)
      008A38 5C 00 02         [ 4] 1654 	call neg_acc24
      008A3B                       1655 1$:
                                   1656 ; initialize string pointer 
      008A3B 81 16 90         [ 2] 1657 	ldw x,#tib 
      008A3C 1C 00 50         [ 2] 1658 	addw x,#TIB_SIZE
      008A3C 72               [ 2] 1659 	decw x 
      008A3D 5F               [ 1] 1660 	clr (x)
      000A07                       1661 itoa_loop:
      008A3E 00 0C CF         [ 1] 1662     ld a,base
      008A41 00 0D            [ 2] 1663 	ldw (PSTR,sp),x 
      008A43 72 0F 00         [ 4] 1664     call divu24_8 ; acc24/A 
      008A46 0D 04            [ 2] 1665 	ldw x,(PSTR,sp)
      008A48 72 53            [ 1] 1666     add a,#'0  ; remainder of division
      008A4A 00 0C            [ 1] 1667     cp a,#'9+1
      008A4C 2B 02            [ 1] 1668     jrmi 2$
      008A4C 52 11            [ 1] 1669     add a,#7 
      000A19                       1670 2$:	
      008A4E CD               [ 2] 1671 	decw x
      008A4F 8A               [ 1] 1672     ld (x),a
      008A50 68 6B            [ 1] 1673 	inc (LEN,sp)
                                   1674 	; if acc24==0 conversion done
      008A52 01 7B 01         [ 1] 1675 	ld a,acc24
      008A55 C1 00 25         [ 1] 1676 	or a,acc16
      008A58 24 08 A6         [ 1] 1677 	or a,acc8
      008A5B 20 5A            [ 1] 1678     jrne itoa_loop
                                   1679 	;conversion done, next add '$' or '-' as required
      008A5D F7 0C 01         [ 1] 1680 	ld a,base 
      008A60 20 F1            [ 1] 1681 	cp a,#16
      008A62 27 08            [ 1] 1682 	jreq 8$
      008A62 CD 83            [ 1] 1683 	ld a,(SIGN,sp)
      008A64 33 5B            [ 1] 1684     jreq 10$
      008A66 11 81            [ 1] 1685     ld a,#'-
      008A68 20 02            [ 2] 1686 	jra 9$ 
      008A68 52 04            [ 1] 1687 8$: ld a,#'$ 
      008A6A 0F               [ 2] 1688 9$: decw x
      008A6B 02               [ 1] 1689     ld (x),a
      008A6C 0F 01            [ 1] 1690 	inc (LEN,sp)
      000A3D                       1691 10$:
      008A6E C6 00            [ 1] 1692 	ld a,(LEN,sp)
      000A3F                       1693 	_drop VSIZE
      008A70 0B A1            [ 2]    1     addw sp,#VSIZE 
      008A72 0A               [ 4] 1694 	ret
                                   1695 
                                   1696 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1697 ; divide uint24_t by uint8_t
                                   1698 ; used to convert uint24_t to string
                                   1699 ; input:
                                   1700 ;	acc24	dividend
                                   1701 ;   A 		divisor
                                   1702 ; output:
                                   1703 ;   acc24	quotient
                                   1704 ;   A		remainder
                                   1705 ;------------------------------------- 
                                   1706 ; offset  on sp of arguments and locals
                           000001  1707 	U8   = 1   ; divisor on stack
                           000001  1708 	VSIZE =1
      000A42                       1709 divu24_8:
      008A73 26               [ 2] 1710 	pushw x ; save x
      008A74 0A               [ 1] 1711 	push a 
                                   1712 	; ld dividend UU:MM bytes in X
      008A75 72 0F 00         [ 1] 1713 	ld a, acc24
      008A78 0C               [ 1] 1714 	ld xh,a
      008A79 05 03 01         [ 1] 1715 	ld a,acc24+1
      008A7C CD               [ 1] 1716 	ld xl,a
      008A7D 8B 24            [ 1] 1717 	ld a,(U8,SP) ; divisor
      008A7F 62               [ 2] 1718 	div x,a ; UU:MM/U8
      008A7F AE               [ 1] 1719 	push a  ;save remainder
      008A80 16               [ 1] 1720 	ld a,xh
      008A81 90 1C 00         [ 1] 1721 	ld acc24,a
      008A84 50               [ 1] 1722 	ld a,xl
      008A85 5A 7F 0C         [ 1] 1723 	ld acc24+1,a
      008A87 84               [ 1] 1724 	pop a
      008A87 C6               [ 1] 1725 	ld xh,a
      008A88 00 0B 1F         [ 1] 1726 	ld a,acc24+2
      008A8B 03               [ 1] 1727 	ld xl,a
      008A8C CD 8A            [ 1] 1728 	ld a,(U8,sp) ; divisor
      008A8E C2               [ 2] 1729 	div x,a  ; R:LL/U8
      008A8F 1E 03            [ 1] 1730 	ld (U8,sp),a ; save remainder
      008A91 AB               [ 1] 1731 	ld a,xl
      008A92 30 A1 3A         [ 1] 1732 	ld acc24+2,a
      008A95 2B               [ 1] 1733 	pop a
      008A96 02               [ 2] 1734 	popw x
      008A97 AB               [ 4] 1735 	ret
                                   1736 
                                   1737 ;--------------------------------------
                                   1738 ; unsigned multiply uint24_t by uint8_t
                                   1739 ; use to convert numerical string to uint24_t
                                   1740 ; input:
                                   1741 ;	acc24	uint24_t 
                                   1742 ;   A		uint8_t
                                   1743 ; output:
                                   1744 ;   acc24   A*acc24
                                   1745 ;-------------------------------------
                                   1746 ; local variables offset  on sp
                           000003  1747 	U8   = 3   ; A pushed on stack
                           000002  1748 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1749 	OVFH = 1  ; multiplication overflow high byte
                           000003  1750 	VSIZE = 3
      000A6A                       1751 mulu24_8:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A98 07               [ 2] 1752 	pushw x    ; save X
                                   1753 	; local variables
      008A99 88               [ 1] 1754 	push a     ; U8
      008A99 5A               [ 1] 1755 	clrw x     ; initialize overflow to 0
      008A9A F7               [ 2] 1756 	pushw x    ; multiplication overflow
                                   1757 ; multiply low byte.
      008A9B 0C 02 C6         [ 1] 1758 	ld a,acc24+2
      008A9E 00               [ 1] 1759 	ld xl,a
      008A9F 0C CA            [ 1] 1760 	ld a,(U8,sp)
      008AA1 00               [ 4] 1761 	mul x,a
      008AA2 0D               [ 1] 1762 	ld a,xl
      008AA3 CA 00 0E         [ 1] 1763 	ld acc24+2,a
      008AA6 26               [ 1] 1764 	ld a, xh
      008AA7 DF C6            [ 1] 1765 	ld (OVFL,sp),a
                                   1766 ; multipy middle byte
      008AA9 00 0B A1         [ 1] 1767 	ld a,acc24+1
      008AAC 10               [ 1] 1768 	ld xl,a
      008AAD 27 08            [ 1] 1769 	ld a, (U8,sp)
      008AAF 7B               [ 4] 1770 	mul x,a
                                   1771 ; add overflow to this partial product
      008AB0 01 27 0A         [ 2] 1772 	addw x,(OVFH,sp)
      008AB3 A6               [ 1] 1773 	ld a,xl
      008AB4 2D 20 02         [ 1] 1774 	ld acc24+1,a
      008AB7 A6               [ 1] 1775 	clr a
      008AB8 24 5A            [ 1] 1776 	adc a,#0
      008ABA F7 0C            [ 1] 1777 	ld (OVFH,sp),a
      008ABC 02               [ 1] 1778 	ld a,xh
      008ABD 6B 02            [ 1] 1779 	ld (OVFL,sp),a
                                   1780 ; multiply most signficant byte	
      008ABD 7B 02 5B         [ 1] 1781 	ld a, acc24
      008AC0 04               [ 1] 1782 	ld xl, a
      008AC1 81 03            [ 1] 1783 	ld a, (U8,sp)
      008AC2 42               [ 4] 1784 	mul x,a
      008AC2 89 88 C6         [ 2] 1785 	addw x, (OVFH,sp)
      008AC5 00               [ 1] 1786 	ld a, xl
      008AC6 0C 95 C6         [ 1] 1787 	ld acc24,a
      008AC9 00 0D            [ 2] 1788     addw sp,#VSIZE
      008ACB 97               [ 2] 1789 	popw x
      008ACC 7B               [ 4] 1790 	ret
                                   1791 
                                   1792 ;------------------------------------
                                   1793 ;  two's complement acc24
                                   1794 ;  input:
                                   1795 ;		acc24 variable
                                   1796 ;  output:
                                   1797 ;		acc24 variable
                                   1798 ;-------------------------------------
      000AA4                       1799 neg_acc24:
      008ACD 01 62 88 9E      [ 1] 1800 	cpl acc24+2
      008AD1 C7 00 0C 9F      [ 1] 1801 	cpl acc24+1
      008AD5 C7 00 0D 84      [ 1] 1802 	cpl acc24
      008AD9 95 C6            [ 1] 1803 	ld a,#1
      008ADB 00 0E 97         [ 1] 1804 	add a,acc24+2
      008ADE 7B 01 62         [ 1] 1805 	ld acc24+2,a
      008AE1 6B               [ 1] 1806 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AE2 01 9F C7         [ 1] 1807 	adc a,acc24+1
      008AE5 00 0E 84         [ 1] 1808 	ld acc24+1,a 
      008AE8 85               [ 1] 1809 	clr a 
      008AE9 81 00 0B         [ 1] 1810 	adc a,acc24 
      008AEA C7 00 0B         [ 1] 1811 	ld acc24,a 
      008AEA 89               [ 4] 1812 	ret
                                   1813 
                                   1814 
                                   1815 ;------------------------------------
                                   1816 ; read a line of text from terminal
                                   1817 ; input:
                                   1818 ;	none
                                   1819 ; local variable on stack:
                                   1820 ;	LL  line length
                                   1821 ;   RXCHAR last received character 
                                   1822 ; output:
                                   1823 ;   text in tib  buffer
                                   1824 ;   count  line length 
                                   1825 ;------------------------------------
                                   1826 	; local variables
                           000001  1827 	LL_HB=1
                           000001  1828 	RXCHAR = 1 ; last char received
                           000002  1829 	LL = 2  ; accepted line length
                           000002  1830 	VSIZE=2 
      000AC7                       1831 readln:
      008AEB 88 5F            [ 1] 1832 	push #0
      008AED 89 C6            [ 1] 1833 	push #0  
      008AEF 00 0E 97 7B      [ 2] 1834  	ldw y,#tib ; input buffer
      000ACF                       1835 readln_loop:
      008AF3 03 42 9F         [ 4] 1836 	call getc
      008AF6 C7 00            [ 1] 1837 	ld (RXCHAR,sp),a
      008AF8 0E 9E            [ 1] 1838 	cp a,#CR
      008AFA 6B 02            [ 1] 1839 	jrne 1$
      008AFC C6 00 0D         [ 2] 1840 	jp readln_quit
      008AFF 97 7B            [ 1] 1841 1$:	cp a,#LF 
      008B01 03 42            [ 1] 1842 	jreq readln_quit
      008B03 72 FB            [ 1] 1843 	cp a,#BS
      008B05 01 9F            [ 1] 1844 	jreq del_back
      008B07 C7 00            [ 1] 1845 	cp a,#CTRL_D
      008B09 0D 4F            [ 1] 1846 	jreq del_ln
      008B0B A9 00            [ 1] 1847 	cp a,#CTRL_R 
      008B0D 6B 01            [ 1] 1848 	jreq reprint 
                                   1849 ;	cp a,#'[
                                   1850 ;	jreq ansi_seq
      000AEB                       1851 final_test:
      008B0F 9E 6B            [ 1] 1852 	cp a,#SPACE
      008B11 02 C6            [ 1] 1853 	jrpl accept_char
      008B13 00 0C            [ 2] 1854 	jra readln_loop
      000AF1                       1855 ansi_seq:
                                   1856 ;	call getc
                                   1857 ;	cp a,#'C 
                                   1858 ;	jreq rigth_arrow
                                   1859 ;	cp a,#'D 
                                   1860 ;	jreq left_arrow 
                                   1861 ;	jra final_test
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      000AF1                       1862 right_arrow:
                                   1863 ;	ld a,#BSP 
                                   1864 ;	call putc 
                                   1865 ;	jra realn_loop 
      000AF1                       1866 left_arrow:
                                   1867 ;	jra readln_loop
      000AF1                       1868 reprint: 
      008B15 97 7B            [ 1] 1869 	tnz (LL,sp)
      008B17 03 42            [ 1] 1870 	jrne readln_loop
      008B19 72 FB 01         [ 2] 1871 	ldw x,#tib 
      008B1C 9F C7 00         [ 4] 1872 	call strlen 
      008B1F 0C 5B 03 85      [ 2] 1873 	ldw y,#tib 
      008B23 81               [ 1] 1874 	ld a,xl
      008B24 27 CD            [ 1] 1875 	jreq readln_loop
      008B24 72 53            [ 1] 1876 	ld (LL,sp),a 
      008B26 00 0E 72         [ 2] 1877 	ldw x,#tib 
      008B29 53 00 0D         [ 4] 1878 	call puts
      008B2C 72 53            [ 1] 1879 	clr (LL_HB,sp)
      008B2E 00 0C A6         [ 2] 1880 	addw y,(LL_HB,sp)
      008B31 01 CB            [ 2] 1881 	jra readln_loop 
      000B11                       1882 del_ln:
      008B33 00 0E            [ 1] 1883 	ld a,(LL,sp)
      008B35 C7 00 0E         [ 4] 1884 	call delete
      008B38 4F C9 00 0D      [ 2] 1885 	ldw y,#tib
      008B3C C7 00            [ 1] 1886 	clr (y)
      008B3E 0D 4F            [ 1] 1887 	clr (LL,sp)
      008B40 C9 00            [ 2] 1888 	jra readln_loop
      000B20                       1889 del_back:
      008B42 0C C7            [ 1] 1890     tnz (LL,sp)
      008B44 00 0C            [ 1] 1891     jreq readln_loop
      008B46 81 02            [ 1] 1892     dec (LL,sp)
      008B47 90 5A            [ 2] 1893     decw y
      008B47 4B 00            [ 1] 1894     clr  (y)
      008B49 4B 00 90         [ 4] 1895     call bksp 
      008B4C AE 16            [ 2] 1896     jra readln_loop	
      000B2F                       1897 accept_char:
      008B4E 90 4F            [ 1] 1898 	ld a,#TIB_SIZE-1
      008B4F 11 02            [ 1] 1899 	cp a, (LL,sp)
      008B4F CD 83            [ 1] 1900 	jreq readln_loop
      008B51 29 6B            [ 1] 1901 	ld a,(RXCHAR,sp)
      008B53 01 A1            [ 1] 1902 	ld (y),a
      008B55 0D 26            [ 1] 1903 	inc (LL,sp)
      008B57 03 CC            [ 2] 1904 	incw y
      008B59 8B C4            [ 1] 1905 	clr (y)
      008B5B A1 0A 27         [ 4] 1906 	call putc 
      008B5E 65 A1            [ 2] 1907 	jra readln_loop
      000B44                       1908 readln_quit:
      008B60 08 27            [ 1] 1909 	clr (y)
      008B62 3D A1            [ 1] 1910 	ld a,(LL,sp)
      008B64 04 27 2A         [ 1] 1911 	ld count,a 
      008B67 A1 12            [ 1] 1912 	ld a,#CR
      008B69 27 06 A0         [ 4] 1913 	call putc
      008B6B                       1914 	_drop VSIZE 
      008B6B A1 20            [ 2]    1     addw sp,#VSIZE 
      008B6D 2A               [ 4] 1915 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1916 
                                   1917 
                                   1918 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1919 ;; compiler routines        ;;
                                   1920 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1921 ;------------------------------------
                                   1922 ; parse quoted string 
                                   1923 ; input:
                                   1924 ;   Y 	pointer to tib 
                                   1925 ;   X   pointer to output buffer 
                                   1926 ; output:
                                   1927 ;	buffer   parsed string
                                   1928 ;------------------------------------
                           000001  1929 	PREV = 1
                           000002  1930 	CURR =2
                           000002  1931 	VSIZE=2
      000B53                       1932 parse_quote: 
      000B53                       1933 	_vars VSIZE 
      008B6E 40 20            [ 2]    1     sub sp,#VSIZE 
      008B70 DE               [ 1] 1934 	clr a
      008B71 6B 01            [ 1] 1935 1$:	ld (PREV,sp),a 
      008B71                       1936 2$:	
      008B71 91 D6 00         [ 4] 1937 	ld a,([in.w],y)
      008B71 27 24            [ 1] 1938 	jreq 6$
      008B71 0D 02 26 DA      [ 1] 1939 	inc in 
      008B75 AE 16            [ 1] 1940 	ld (CURR,sp),a 
      008B77 90 CD            [ 1] 1941 	ld a,#'\
      008B79 84 12            [ 1] 1942 	cp a, (PREV,sp)
      008B7B 90 AE            [ 1] 1943 	jrne 3$
      008B7D 16 90            [ 1] 1944 	clr (PREV,sp)
      008B7F 9F 27            [ 1] 1945 	ld a,(CURR,sp)
      008B81 CD 6B            [ 4] 1946 	callr convert_escape
      008B83 02               [ 1] 1947 	ld (x),a 
      008B84 AE               [ 2] 1948 	incw x 
      008B85 16 90            [ 2] 1949 	jra 2$
      000B73                       1950 3$:
      008B87 CD 83            [ 1] 1951 	ld a,(CURR,sp)
      008B89 33 0F            [ 1] 1952 	cp a,#'\'
      008B8B 01 72            [ 1] 1953 	jreq 1$
      008B8D F9 01            [ 1] 1954 	cp a,#'"
      008B8F 20 BE            [ 1] 1955 	jreq 6$ 
      008B91 F7               [ 1] 1956 	ld (x),a 
      008B91 7B               [ 2] 1957 	incw x 
      008B92 02 CD            [ 2] 1958 	jra 2$
      000B81                       1959 6$:
      008B94 83               [ 1] 1960 	clr (x)
      008B95 4D               [ 2] 1961 	incw x 
      008B96 90 AE            [ 1] 1962 	ldw y,x 
      008B98 16               [ 1] 1963 	clrw x 
      008B99 90 90            [ 1] 1964 	ld a,#TK_QSTR  
      000B88                       1965 	_drop VSIZE
      008B9B 7F 0F            [ 2]    1     addw sp,#VSIZE 
      008B9D 02               [ 4] 1966 	ret 
                                   1967 
                                   1968 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1969 ; called by parse_quote
                                   1970 ; subtitute escaped character 
                                   1971 ; by their ASCII value .
                                   1972 ; input:
                                   1973 ;   A  character following '\'
                                   1974 ; output:
                                   1975 ;   A  substitued char or same if not valid.
                                   1976 ;---------------------------------------
      000B8B                       1977 convert_escape:
      008B9E 20               [ 2] 1978 	pushw x 
      008B9F AF 0B A0         [ 2] 1979 	ldw x,#escaped 
      008BA0 F1               [ 1] 1980 1$:	cp a,(x)
      008BA0 0D 02            [ 1] 1981 	jreq 2$
      008BA2 27               [ 1] 1982 	tnz (x)
      008BA3 AB 0A            [ 1] 1983 	jreq 3$
      008BA5 02               [ 2] 1984 	incw x 
      008BA6 90 5A            [ 2] 1985 	jra 1$
      008BA8 90 7F CD         [ 2] 1986 2$: subw x,#escaped 
      008BAB 83               [ 1] 1987 	ld a,xl 
      008BAC 3D 20            [ 1] 1988 	add a,#7
      008BAE A0               [ 2] 1989 3$:	popw x 
      008BAF 81               [ 4] 1990 	ret 
                                   1991 
      008BAF A6 4F 11 02 27 9A 7B  1992 escaped: .asciz "abtnvfr"
             01
                                   1993 
                                   1994 ;-------------------------
                                   1995 ; integer parser 
                                   1996 ; input:
                                   1997 ;   X 		point to output buffer  
                                   1998 ;   Y 		point to tib 
                                   1999 ;   A 	    first digit|'$' 
                                   2000 ; output:  
                                   2001 ;   X 		integer 
                                   2002 ;   A 		TK_INTGR
                                   2003 ;   acc24   24 bits integer 
                                   2004 ;-------------------------
                           000001  2005 	BASE=1
                           000002  2006 	TCHAR=2 
                           000003  2007 	XSAVE=3
                           000004  2008 	VSIZE=4 
      000BA8                       2009 parse_integer: ; { -- n }
      008BB7 90               [ 2] 2010 	pushw x 	
      008BB8 F7 0C            [ 1] 2011 	push #0 ; TCHAR
      008BBA 02 90            [ 1] 2012 	push #10 ; BASE=10
      008BBC 5C 90            [ 1] 2013 	cp a,#'$
      008BBE 7F CD            [ 1] 2014 	jrne 2$ 
      000BB1                       2015     _drop #1
      008BC0 83 20            [ 2]    1     addw sp,##1 
      008BC2 20 8B            [ 1] 2016 	push #16  ; BASE=16
      008BC4 F7               [ 1] 2017 2$:	ld (x),a 
      008BC4 90               [ 2] 2018 	incw x 
      008BC5 7F 7B 02         [ 4] 2019 	ld a,([in.w],y)
      008BC8 C7 00 04 A6      [ 1] 2020 	inc in 
      008BCC 0D CD 83         [ 4] 2021 	call to_upper 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BCF 20 5B            [ 1] 2022 	ld (TCHAR,sp),a 
      008BD1 02 81 7C         [ 4] 2023 	call is_digit 
      008BD3 25 ED            [ 1] 2024 	jrc 2$
      008BD3 52 02            [ 1] 2025 	ld a,#16 
      008BD5 4F 6B            [ 1] 2026 	cp a,(BASE,sp)
      008BD7 01 0A            [ 1] 2027 	jrne 3$ 
      008BD8 7B 02            [ 1] 2028 	ld a,(TCHAR,sp)
      008BD8 91 D6            [ 1] 2029 	cp a,#'A 
      008BDA 01 27            [ 1] 2030 	jrmi 3$ 
      008BDC 24 72            [ 1] 2031 	cp a,#'G 
      008BDE 5C 00            [ 1] 2032 	jrmi 2$ 
      008BE0 02 6B 02 A6      [ 1] 2033 3$: dec in 	
      008BE4 5C               [ 1] 2034     clr (x)
      008BE5 11 01            [ 2] 2035 	ldw x,(XSAVE,sp)
      008BE7 26 0A 0F         [ 4] 2036 	call atoi24
      008BEA 01 7B            [ 1] 2037 	ldw y,x 
      008BEC 02 AD 1C         [ 2] 2038 	ldw x,acc16 
      008BEF F7 5C            [ 1] 2039 	ld a,#TK_INTGR
      008BF1 20 E5            [ 2] 2040 	ldw (y),x 
      008BF3 72 A9 00 02      [ 2] 2041 	addw y,#2
      000BEF                       2042 	_drop VSIZE  
      008BF3 7B 02            [ 2]    1     addw sp,#VSIZE 
      008BF5 A1               [ 4] 2043 	ret 	
                                   2044 
                                   2045 ;-------------------------
                                   2046 ; binary integer parser
                                   2047 ; build integer in acc24  
                                   2048 ; input:
                                   2049 ;   X 		point to output buffer  
                                   2050 ;   Y 		point to tib 
                                   2051 ;   A 	    '&' 
                                   2052 ; output:  
                                   2053 ;   buffer  TK_INTGR integer  
                                   2054 ;   X 		int16 
                                   2055 ;   A 		TK_INTGR
                                   2056 ;   acc24    int24 
                                   2057 ;-------------------------
                           000001  2058 	BINARY=1 ; 24 bits integer 
                           000003  2059 	VSIZE=3
      000BF2                       2060 parse_binary: ; { -- n }
      008BF6 5C 27            [ 1] 2061 	push #0
      008BF8 DD A1            [ 1] 2062 	push #0
      008BFA 22 27            [ 1] 2063 	push #0
      000BF8                       2064 2$:	
      008BFC 04 F7 5C         [ 4] 2065 	ld a,([in.w],y)
      008BFF 20 D7 00 01      [ 1] 2066 	inc in 
      008C01 A1 30            [ 1] 2067 	cp a,#'0 
      008C01 7F 5C            [ 1] 2068 	jreq 3$
      008C03 90 93            [ 1] 2069 	cp a,#'1 
      008C05 5F A6            [ 1] 2070 	jreq 3$ 
      008C07 02 5B            [ 2] 2071 	jra bin_exit 
      008C09 02 81            [ 1] 2072 3$: sub a,#'0 
      008C0B 46               [ 1] 2073 	rrc a
      008C0B 89 AE            [ 1] 2074 	rlc (BINARY+2,sp) 
      008C0D 8C 20            [ 1] 2075 	rlc (BINARY+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C0F F1 27            [ 1] 2076 	rlc (BINARY,sp) 
      008C11 06 7D            [ 2] 2077 	jra 2$  
      000C14                       2078 bin_exit:
      008C13 27 09 5C 20      [ 1] 2079 	dec in 
      008C17 F7 1D            [ 1] 2080 	ldw y,x
      008C19 8C 20            [ 1] 2081 	ld a,(BINARY,sp)
      008C1B 9F AB 07         [ 1] 2082 	ld acc24,a 
      008C1E 85 81            [ 2] 2083 	ldw x,(BINARY+1,sp)
      008C20 61 62 74         [ 2] 2084 	ldw acc16,x
      008C23 6E 76            [ 2] 2085 	ldw (y),x 
      008C25 66 72 00 02      [ 2] 2086 	addw y,#2  
      008C28 A6 84            [ 1] 2087 	ld a,#TK_INTGR 	
      000C2C                       2088 	_drop VSIZE 
      008C28 89 4B            [ 2]    1     addw sp,#VSIZE 
      008C2A 00               [ 4] 2089 	ret
                                   2090 
                                   2091 ;---------------------------
                                   2092 ;  token begin with a letter,
                                   2093 ;  is keyword or variable. 	
                                   2094 ; input:
                                   2095 ;   X 		point to pad 
                                   2096 ;   Y 		point to text
                                   2097 ;   A 	    first letter  
                                   2098 ; output:
                                   2099 ;   X		exec_addr|var_addr 
                                   2100 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2101 ;   pad 	keyword|var_name  
                                   2102 ;--------------------------  
                           000001  2103 	XFIRST=1
                           000002  2104 	VSIZE=2
      000C2F                       2105 parse_keyword: 
      008C2B 4B               [ 2] 2106 	pushw x 
      000C30                       2107 kw_loop:	
      008C2C 0A A1 24         [ 4] 2108 	call to_upper 
      008C2F 26               [ 1] 2109 	ld (x),a 
      008C30 04               [ 2] 2110 	incw x 
      008C31 5B 01 4B         [ 4] 2111 	ld a,([in.w],y)
      008C34 10 F7 5C 91      [ 1] 2112 	inc in 
      008C38 D6 01 72         [ 4] 2113 	call is_alpha 
      008C3B 5C 00            [ 1] 2114 	jrc kw_loop
      008C3D 02 CD 8E BB      [ 1] 2115 	dec in   
      008C41 6B               [ 1] 2116 1$: clr (x)
      008C42 02 CD            [ 2] 2117 	ldw x,(XFIRST,sp) 
      008C44 85 FC            [ 1] 2118 	ld a,(1,x)
      008C46 25 ED            [ 1] 2119 	jrne 2$
                                   2120 ; one letter variable name 
      008C48 A6               [ 1] 2121 	ld a,(x) 
      008C49 10 11            [ 1] 2122 	sub a,#'A 
      008C4B 01               [ 1] 2123 	sll a 
      008C4C 26               [ 1] 2124 	push a 
      008C4D 0A 7B            [ 1] 2125 	push #0
      008C4F 02 A1 41         [ 2] 2126 	ldw x,#vars 
      008C52 2B 04 A1         [ 2] 2127 	addw x,(1,sp) ; X=var address 
      000C59                       2128 	_drop 2 
      008C55 47 2B            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C57 DD 72            [ 1] 2129 	ld a,#TK_VAR 
      008C59 5A 00            [ 2] 2130 	jra 4$ 
      000C5F                       2131 2$: ; check for keyword, otherwise syntax error.
      000C5F                       2132 	_ldx_dict kword_dict ; dictionary entry point
      008C5B 02 7F 1E         [ 2]    1     ldw x,#kword_dict+2
      008C5E 03 CD            [ 2] 2133 	ldw y,(XFIRST,sp) ; name to search for
      008C60 8E C7 90         [ 4] 2134 	call search_dict
      008C63 93               [ 1] 2135 	tnz a
      008C64 CE 00            [ 1] 2136 	jrne 4$ 
      008C66 0D A6 84         [ 2] 2137 	jp syntax_error
      000C6D                       2138 4$:	
      008C69 90 FF            [ 2] 2139 	ldw y,(XFIRST,sp)
      008C6B 72 A9            [ 1] 2140 	ld (y),a 
      008C6D 00 02            [ 2] 2141 	incw y 
      008C6F 5B 04            [ 2] 2142 	ldw (y),x
      008C71 81 A9 00 02      [ 2] 2143 	addw y,#2  
      008C72                       2144 	_drop VSIZE 
      008C72 4B 00            [ 2]    1     addw sp,#VSIZE 
      008C74 4B               [ 4] 2145 	ret  	
                                   2146 
                                   2147 
                                   2148 ;------------------------------------
                                   2149 ; scan text for next token
                                   2150 ; input: 
                                   2151 ;	X 		pointer to buffer where 
                                   2152 ;	        token id and value are copied 
                                   2153 ; use:
                                   2154 ;	Y   pointer to text in tib 
                                   2155 ; output:
                                   2156 ;   A       token attribute 
                                   2157 ;   X 		token value
                                   2158 ;   Y       updated position in output buffer   
                                   2159 ;------------------------------------
                                   2160 	; use to check special character 
                                   2161 	.macro _case c t  
                                   2162 	ld a,#c 
                                   2163 	cp a,(TCHAR,sp) 
                                   2164 	jrne t
                                   2165 	.endm 
                                   2166 
                           000001  2167 	TCHAR=1
                           000002  2168 	ATTRIB=2
                           000002  2169 	VSIZE=2
      000C7C                       2170 get_token: 
      000C7C                       2171 	_vars VSIZE
      008C75 00 4B            [ 2]    1     sub sp,#VSIZE 
                                   2172 ;	ld a,in 
                                   2173 ;	sub a,count
                                   2174 ;   jrmi 0$
                                   2175 ;	clr a 
                                   2176 ;	ret 
      000C7E                       2177 0$: 
      008C77 00 AE 16 90      [ 2] 2178 	ldw y,#tib    	
      008C78 A6 20            [ 1] 2179 	ld a,#SPACE
      008C78 91 D6 01         [ 4] 2180 	call skip
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008C7B 72 5C 00 02 A1   [ 1] 2181 	mov in.saved,in 
      008C80 30 27 06         [ 4] 2182 	ld a,([in.w],y)
      008C83 A1 31            [ 1] 2183 	jrne 1$
      008C85 27 02            [ 1] 2184 	ldw y,x 
      008C87 20 0B A0         [ 2] 2185 	jp token_exit ; end of line 
      008C8A 30 46 09 03      [ 1] 2186 1$:	inc in 
      008C8E 09 02 09         [ 4] 2187 	call to_upper 
      008C91 01 20            [ 1] 2188 	ld (TCHAR,sp),a 
                                   2189 ; check for quoted string
      000C9F                       2190 str_tst:  	
      000C9F                       2191 	_case '"' nbr_tst
      008C93 E4 22            [ 1]    1 	ld a,#'"' 
      008C94 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C94 72 5A            [ 1]    3 	jrne nbr_tst
      008C96 00 02            [ 1] 2192 	ld a,#TK_QSTR
      008C98 90               [ 1] 2193 	ld (x),a 
      008C99 93               [ 2] 2194 	incw x 
      008C9A 7B 01 C7         [ 4] 2195 	call parse_quote
      008C9D 00 0C 1E         [ 2] 2196 	jp token_exit
      000CAF                       2197 nbr_tst:
                                   2198 ; check for hexadecimal number 
      008CA0 02 CF            [ 1] 2199 	ld a,#'$'
      008CA2 00 0D            [ 1] 2200 	cp a,(TCHAR,sp) 
      008CA4 90 FF            [ 1] 2201 	jreq 1$
                                   2202 ;check for binary number 
      008CA6 72 A9            [ 1] 2203 	ld a,#'&
      008CA8 00 02            [ 1] 2204 	cp a,(TCHAR,sp)
      008CAA A6 84            [ 1] 2205 	jrne 0$
      008CAC 5B 03            [ 1] 2206 	ld a,#TK_INTGR
      008CAE 81               [ 1] 2207 	ld (x),a 
      008CAF 5C               [ 2] 2208 	incw x 
      008CAF 89 0B F2         [ 4] 2209 	call parse_binary ; expect binary integer 
      008CB0 CC 0E 38         [ 2] 2210 	jp token_exit 
                                   2211 ; check for decimal number 	
      008CB0 CD 8E            [ 1] 2212 0$:	ld a,(TCHAR,sp)
      008CB2 BB F7 5C         [ 4] 2213 	call is_digit
      008CB5 91 D6            [ 1] 2214 	jrnc 3$
      008CB7 01 72            [ 1] 2215 1$:	ld a,#TK_INTGR 
      008CB9 5C               [ 1] 2216 	ld (x),a 
      008CBA 00               [ 2] 2217 	incw x 
      008CBB 02 CD            [ 1] 2218 	ld a,(TCHAR,sp)
      008CBD 85 EB 25         [ 4] 2219 	call parse_integer 
      008CC0 EF 72 5A         [ 2] 2220 	jp token_exit 
      000CD8                       2221 3$: 
      000CD8                       2222 	_case '(' bkslsh_tst 
      008CC3 00 02            [ 1]    1 	ld a,#'(' 
      008CC5 7F 1E            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC7 01 E6            [ 1]    3 	jrne bkslsh_tst
      008CC9 01 26            [ 1] 2223 	ld a,#TK_LPAREN
      008CCB 13 F6 A0         [ 2] 2224 	jp token_char   	
      000CE3                       2225 bkslsh_tst: ; character token 
      000CE3                       2226 	_case '\',rparnt_tst
      008CCE 41 48            [ 1]    1 	ld a,#'\' 
      008CD0 88 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD2 00 AE            [ 1]    3 	jrne rparnt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CD4 00 27            [ 1] 2227 	ld a,#TK_CHAR 
      008CD6 72               [ 1] 2228 	ld (x),a 
      008CD7 FB               [ 2] 2229 	incw x 
      008CD8 01 5B 02         [ 4] 2230 	ld a,([in.w],y)
      008CDB A6               [ 1] 2231 	ld (x),a 
      008CDC 85               [ 2] 2232 	incw x
      008CDD 20 0E            [ 1] 2233 	ldw y,x 	 
      008CDF 72 5C 00 01      [ 1] 2234 	inc in  
      008CDF AE               [ 1] 2235 	clrw x 
      008CE0 A7               [ 1] 2236 	ld xl,a 
      008CE1 37 16            [ 1] 2237 	ld a,#TK_CHAR 
      008CE3 01 CD 90         [ 2] 2238 	jp token_exit 
      000CFF                       2239 rparnt_tst:		
      000CFF                       2240 	_case ')' colon_tst 
      008CE6 9E 4D            [ 1]    1 	ld a,#')' 
      008CE8 26 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEA CC 88            [ 1]    3 	jrne colon_tst
      008CEC F5 08            [ 1] 2241 	ld a,#TK_RPAREN 
      008CED CC 0E 34         [ 2] 2242 	jp token_char
      000D0A                       2243 colon_tst:
      000D0A                       2244 	_case ':' comma_tst 
      008CED 16 01            [ 1]    1 	ld a,#':' 
      008CEF 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF1 90 5C            [ 1]    3 	jrne comma_tst
      008CF3 90 FF            [ 1] 2245 	ld a,#TK_COLON 
      008CF5 72 A9 00         [ 2] 2246 	jp token_char  
      000D15                       2247 comma_tst:
      000D15                       2248 	_case COMMA sharp_tst 
      008CF8 02 5B            [ 1]    1 	ld a,#COMMA 
      008CFA 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFC 26 05            [ 1]    3 	jrne sharp_tst
      008CFC 52 02            [ 1] 2249 	ld a,#TK_COMMA
      008CFE CC 0E 34         [ 2] 2250 	jp token_char
      000D20                       2251 sharp_tst:
      000D20                       2252 	_case SHARP dash_tst 
      008CFE 90 AE            [ 1]    1 	ld a,#SHARP 
      008D00 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008D02 A6 20            [ 1]    3 	jrne dash_tst
      008D04 CD 8F            [ 1] 2253 	ld a,#TK_SHARP
      008D06 31 55 00         [ 2] 2254 	jp token_char  	 	 
      000D2B                       2255 dash_tst: 	
      000D2B                       2256 	_case '-' at_tst 
      008D09 02 00            [ 1]    1 	ld a,#'-' 
      008D0B 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0D D6 01            [ 1]    3 	jrne at_tst
      008D0F 26 05            [ 1] 2257 	ld a,#TK_MINUS  
      008D11 90 93 CC         [ 2] 2258 	jp token_char 
      000D36                       2259 at_tst:
      000D36                       2260 	_case '@' qmark_tst 
      008D14 8E B8            [ 1]    1 	ld a,#'@' 
      008D16 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008D18 00 02            [ 1]    3 	jrne qmark_tst
      008D1A CD 8E            [ 1] 2261 	ld a,#TK_ARRAY 
      008D1C BB 6B 01         [ 2] 2262 	jp token_char
      008D1F                       2263 qmark_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      000D41                       2264 	_case '?' tick_tst 
      008D1F A6 22            [ 1]    1 	ld a,#'?' 
      008D21 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D23 26 0A            [ 1]    3 	jrne tick_tst
      008D25 A6 02            [ 1] 2265 	ld a,#TK_CMD  
      008D27 F7               [ 1] 2266 	ld (x),a 
      008D28 5C               [ 2] 2267 	incw x 
      008D29 CD 8B            [ 1] 2268 	ldw y,x 
      008D2B D3 CC 8E         [ 2] 2269 	ldw x,#print 
      008D2E B8 FF            [ 2] 2270 	ldw (y),x 
      008D2F 72 A9 00 02      [ 2] 2271 	addw y,#2
      008D2F A6 24 11         [ 2] 2272 	jp token_exit
      000D59                       2273 tick_tst: ; comment 
      000D59                       2274 	_case TICK plus_tst 
      008D32 01 27            [ 1]    1 	ld a,#TICK 
      008D34 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D36 26 11            [ 1]    3 	jrne plus_tst
      008D38 01 26            [ 1] 2275 	ld a,#TK_CMD
      008D3A 0A               [ 1] 2276 	ld (x),a 
      008D3B A6               [ 2] 2277 	incw x
      008D3C 84 F7 5C CD      [ 2] 2278 	ldw y,#remark
      008D40 8C               [ 2] 2279 	ldw (x),y 
      008D41 72 CC 8E         [ 2] 2280 	addw x,#2  
      000D6B                       2281 copy_comment:
      008D44 B8 7B 01 CD      [ 2] 2282 	ldw y,#tib 
      008D48 85 FC 24 0C      [ 2] 2283 	addw y,in.w
      008D4C A6 84            [ 2] 2284 	pushw y
      008D4E F7 5C 7B         [ 4] 2285 	call strcpy
      008D51 01 CD 8C         [ 2] 2286     subw y,(1,sp)
      008D54 28 CC            [ 1] 2287 	ld a,yl 
      008D56 8E B8 01         [ 1] 2288 	add a,in
      008D58 C7 00 01         [ 1] 2289 	ld in,a 
      008D58 A6 28            [ 2] 2290 	ldw (1,sp),x
      008D5A 11 01 26         [ 2] 2291 	addw y,(1,sp)
      008D5D 05 A6            [ 2] 2292 	incw y 
      000D8A                       2293 	_drop 2 
      008D5F 07 CC            [ 2]    1     addw sp,#2 
      008D61 8E B4 BC         [ 2] 2294 	ldw x,#remark 
      008D63 A6 80            [ 1] 2295 	ld a,#TK_CMD 
      008D63 A6 5C 11         [ 2] 2296 	jp token_exit 
      000D94                       2297 plus_tst:
      000D94                       2298 	_case '+' star_tst 
      008D66 01 26            [ 1]    1 	ld a,#'+' 
      008D68 16 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6A 03 F7            [ 1]    3 	jrne star_tst
      008D6C 5C 91            [ 1] 2299 	ld a,#TK_PLUS  
      008D6E D6 01 F7         [ 2] 2300 	jp token_char 
      000D9F                       2301 star_tst:
      000D9F                       2302 	_case '*' slash_tst 
      008D71 5C 90            [ 1]    1 	ld a,#'*' 
      008D73 93 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D75 5C 00            [ 1]    3 	jrne slash_tst
      008D77 02 5F            [ 1] 2303 	ld a,#TK_MULT 
      008D79 97 A6 03         [ 2] 2304 	jp token_char 
      000DAA                       2305 slash_tst: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      000DAA                       2306 	_case '/' prcnt_tst 
      008D7C CC 8E            [ 1]    1 	ld a,#'/' 
      008D7E B8 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7F 26 05            [ 1]    3 	jrne prcnt_tst
      008D7F A6 29            [ 1] 2307 	ld a,#TK_DIV 
      008D81 11 01 26         [ 2] 2308 	jp token_char 
      000DB5                       2309 prcnt_tst:
      000DB5                       2310 	_case '%' eql_tst 
      008D84 05 A6            [ 1]    1 	ld a,#'%' 
      008D86 08 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008D88 8E B4            [ 1]    3 	jrne eql_tst
      008D8A A6 22            [ 1] 2311 	ld a,#TK_MOD
      008D8A A6 3A 11         [ 2] 2312 	jp token_char  
                                   2313 ; 1 or 2 character tokens 	
      000DC0                       2314 eql_tst:
      000DC0                       2315 	_case '=' gt_tst 		
      008D8D 01 26            [ 1]    1 	ld a,#'=' 
      008D8F 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D91 01 CC            [ 1]    3 	jrne gt_tst
      008D93 8E B4            [ 1] 2316 	ld a,#TK_EQUAL
      008D95 CC 0E 34         [ 2] 2317 	jp token_char 
      000DCB                       2318 gt_tst:
      000DCB                       2319 	_case '>' lt_tst 
      008D95 A6 2C            [ 1]    1 	ld a,#'>' 
      008D97 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D99 26 05            [ 1]    3 	jrne lt_tst
      008D9B A6 09            [ 1] 2320 	ld a,#TK_GT 
      008D9D CC 8E            [ 1] 2321 	ld (ATTRIB,sp),a 
      008D9F B4 5C 00 01      [ 1] 2322 	inc in 
      008DA0 91 D6 00         [ 4] 2323 	ld a,([in.w],y)
      008DA0 A6 23            [ 1] 2324 	cp a,#'=
      008DA2 11 01            [ 1] 2325 	jrne 1$
      008DA4 26 05            [ 1] 2326 	ld a,#TK_GE 
      008DA6 A6 0A            [ 2] 2327 	jra token_char  
      008DA8 CC 8E            [ 1] 2328 1$: cp a,#'<
      008DAA B4 04            [ 1] 2329 	jrne 2$
      008DAB A6 35            [ 1] 2330 	ld a,#TK_NE 
      008DAB A6 2D            [ 2] 2331 	jra token_char 
      008DAD 11 01 26 05      [ 1] 2332 2$: dec in
      008DB1 A6 11            [ 1] 2333 	ld a,(ATTRIB,sp)
      008DB3 CC 8E            [ 2] 2334 	jra token_char 	 
      000DF4                       2335 lt_tst:
      000DF4                       2336 	_case '<' other
      008DB5 B4 3C            [ 1]    1 	ld a,#'<' 
      008DB6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB6 A6 40            [ 1]    3 	jrne other
      008DB8 11 01            [ 1] 2337 	ld a,#TK_LT 
      008DBA 26 05            [ 1] 2338 	ld (ATTRIB,sp),a 
      008DBC A6 06 CC 8E      [ 1] 2339 	inc in 
      008DC0 B4 D6 00         [ 4] 2340 	ld a,([in.w],y)
      008DC1 A1 3D            [ 1] 2341 	cp a,#'=
      008DC1 A6 3F            [ 1] 2342 	jrne 1$
      008DC3 11 01            [ 1] 2343 	ld a,#TK_LE 
      008DC5 26 12            [ 2] 2344 	jra token_char 
      008DC7 A6 80            [ 1] 2345 1$: cp a,#'>
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DC9 F7 5C            [ 1] 2346 	jrne 2$
      008DCB 90 93            [ 1] 2347 	ld a,#TK_NE 
      008DCD AE 95            [ 2] 2348 	jra token_char 
      008DCF 3F 90 FF 72      [ 1] 2349 2$: dec in 
      008DD3 A9 00            [ 1] 2350 	ld a,(ATTRIB,sp)
      008DD5 02 CC            [ 2] 2351 	jra token_char 	
      000E1D                       2352 other: ; not a special character 	 
      008DD7 8E B8            [ 1] 2353 	ld a,(TCHAR,sp)
      008DD9 CD 05 6B         [ 4] 2354 	call is_alpha 
      008DD9 A6 27            [ 1] 2355 	jrc 30$ 
      008DDB 11 01 26         [ 2] 2356 	jp syntax_error 
      000E27                       2357 30$: 
      008DDE 35 A6 80         [ 4] 2358 	call parse_keyword
      008DE1 F7 5C 90         [ 2] 2359 	cpw x,#remark 
      008DE4 AE 96            [ 1] 2360 	jrne token_exit 
      008DE6 3C FF            [ 1] 2361 	ldw y,x 
      008DE8 1C 00 02         [ 2] 2362 	jp copy_comment 
      008DEB                       2363 token_char:
      008DEB 90               [ 1] 2364 	ld (x),a 
      008DEC AE               [ 2] 2365 	incw x
      008DED 16 90            [ 1] 2366 	ldw y,x 
      000E38                       2367 token_exit:
      000E38                       2368 	_drop VSIZE 
      008DEF 72 B9            [ 2]    1     addw sp,#VSIZE 
      008DF1 00               [ 4] 2369 	ret
                                   2370 
                                   2371 
                                   2372 ;------------------------------------
                                   2373 ; convert alpha to uppercase
                                   2374 ; input:
                                   2375 ;    a  character to convert
                                   2376 ; output:
                                   2377 ;    a  uppercase character
                                   2378 ;------------------------------------
      000E3B                       2379 to_upper::
      008DF2 01 90            [ 1] 2380 	cp a,#'a
      008DF4 89 CD            [ 1] 2381 	jrpl 1$
      008DF6 84               [ 4] 2382 0$:	ret
      008DF7 30 72            [ 1] 2383 1$: cp a,#'z	
      008DF9 F2 01            [ 1] 2384 	jrugt 0$
      008DFB 90 9F            [ 1] 2385 	sub a,#32
      008DFD CB               [ 4] 2386 	ret
                                   2387 	
                                   2388 ;------------------------------------
                                   2389 ; convert pad content in integer
                                   2390 ; input:
                                   2391 ;    x		.asciz to convert
                                   2392 ; output:
                                   2393 ;    acc24      int24_t
                                   2394 ;------------------------------------
                                   2395 	; local variables
                           000001  2396 	SIGN=1 ; 1 byte, 
                           000002  2397 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2398 	TEMP=3 ; 1 byte, temporary storage
                           000003  2399 	VSIZE=3 ; 3 bytes reserved for local storage
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      000E47                       2400 atoi24:
      008DFE 00               [ 2] 2401 	pushw x 
      000E48                       2402 	_vars VSIZE
      008DFF 02 C7            [ 2]    1     sub sp,#VSIZE 
                                   2403 	; acc24=0 
      008E01 00 02 1F 01      [ 1] 2404 	clr acc24    
      008E05 72 F9 01 90      [ 1] 2405 	clr acc16
      008E09 5C 5B 02 AE      [ 1] 2406 	clr acc8 
      008E0D 96 3C            [ 1] 2407 	clr (SIGN,sp)
      008E0F A6 80            [ 1] 2408 	ld a,#10
      008E11 CC 8E            [ 1] 2409 	ld (BASE,sp),a ; default base decimal
      008E13 B8               [ 1] 2410 	ld a,(x)
      008E14 27 47            [ 1] 2411 	jreq 9$  ; completed if 0
      008E14 A6 2B            [ 1] 2412 	cp a,#'-
      008E16 11 01            [ 1] 2413 	jrne 1$
      008E18 26 05            [ 1] 2414 	cpl (SIGN,sp)
      008E1A A6 10            [ 2] 2415 	jra 2$
      008E1C CC 8E            [ 1] 2416 1$: cp a,#'$
      008E1E B4 06            [ 1] 2417 	jrne 3$
      008E1F A6 10            [ 1] 2418 	ld a,#16
      008E1F A6 2A            [ 1] 2419 	ld (BASE,sp),a
      008E21 11               [ 2] 2420 2$:	incw x
      008E22 01               [ 1] 2421 	ld a,(x)
      000E71                       2422 3$:	
      008E23 26 05            [ 1] 2423 	cp a,#'a
      008E25 A6 20            [ 1] 2424 	jrmi 4$
      008E27 CC 8E            [ 1] 2425 	sub a,#32
      008E29 B4 30            [ 1] 2426 4$:	cp a,#'0
      008E2A 2B 2B            [ 1] 2427 	jrmi 9$
      008E2A A6 2F            [ 1] 2428 	sub a,#'0
      008E2C 11 01            [ 1] 2429 	cp a,#10
      008E2E 26 05            [ 1] 2430 	jrmi 5$
      008E30 A6 21            [ 1] 2431 	sub a,#7
      008E32 CC 8E            [ 1] 2432 	cp a,(BASE,sp)
      008E34 B4 1F            [ 1] 2433 	jrpl 9$
      008E35 6B 03            [ 1] 2434 5$:	ld (TEMP,sp),a
      008E35 A6 25            [ 1] 2435 	ld a,(BASE,sp)
      008E37 11 01 26         [ 4] 2436 	call mulu24_8
      008E3A 05 A6            [ 1] 2437 	ld a,(TEMP,sp)
      008E3C 22 CC 8E         [ 1] 2438 	add a,acc24+2
      008E3F B4 00 0D         [ 1] 2439 	ld acc24+2,a
      008E40 4F               [ 1] 2440 	clr a
      008E40 A6 3D 11         [ 1] 2441 	adc a,acc24+1
      008E43 01 26 05         [ 1] 2442 	ld acc24+1,a
      008E46 A6               [ 1] 2443 	clr a
      008E47 32 CC 8E         [ 1] 2444 	adc a,acc24
      008E4A B4 00 0B         [ 1] 2445 	ld acc24,a
      008E4B 20 C9            [ 2] 2446 	jra 2$
      008E4B A6 3E            [ 1] 2447 9$:	tnz (SIGN,sp)
      008E4D 11 01            [ 1] 2448     jreq atoi_exit
      008E4F 26 23 A6         [ 4] 2449     call neg_acc24
      000EAD                       2450 atoi_exit: 
      000EAD                       2451 	_drop VSIZE
      008E52 31 6B            [ 2]    1     addw sp,#VSIZE 
      008E54 02               [ 2] 2452 	popw x ; restore x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E55 72               [ 4] 2453 	ret
                                   2454 
                                   2455 
                                   2456 ;------------------------------------
                                   2457 ; skip character c in text starting from 'in'
                                   2458 ; input:
                                   2459 ;	 y 		point to text buffer
                                   2460 ;    a 		character to skip
                                   2461 ; output:  
                                   2462 ;	'in' ajusted to new position
                                   2463 ;------------------------------------
                           000001  2464 	C = 1 ; local var
      000EB1                       2465 skip:
      008E56 5C               [ 1] 2466 	push a
      008E57 00 02 91         [ 4] 2467 1$:	ld a,([in.w],y)
      008E5A D6 01            [ 1] 2468 	jreq 2$
      008E5C A1 3D            [ 1] 2469 	cp a,(C,sp)
      008E5E 26 04            [ 1] 2470 	jrne 2$
      008E60 A6 33 20 50      [ 1] 2471 	inc in
      008E64 A1 3C            [ 2] 2472 	jra 1$
      000EC1                       2473 2$: _drop 1 
      008E66 26 04            [ 2]    1     addw sp,#1 
      008E68 A6               [ 4] 2474 	ret
                                   2475 	
                                   2476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2477 ;;   TINY BASIC  operators,
                                   2478 ;;   commands and functions 
                                   2479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2480 
                                   2481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2482 ;;  Arithmetic operators
                                   2483 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2484 
                                   2485 ;debug support
                           000000  2486 DEBUG_PRT=0
                           000000  2487 .if DEBUG_PRT 
                                   2488 printxy:
                                   2489 	ld a,base 
                                   2490 	push a 
                                   2491 	pushw x 
                                   2492 	pushw y
                                   2493 	mov base,#16 
                                   2494 	call print_int 
                                   2495 	ldw x,(1,sp)
                                   2496 	call print_int 
                                   2497 	ld a,#CR 
                                   2498 	call putc 
                                   2499 	popw y 
                                   2500 	popw x 
                                   2501 	pop a 
                                   2502 	ld base,a 
                                   2503 	ret 
                                   2504 .endif 
                                   2505 
                                   2506 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2507 ;--------------------------------------
                                   2508 ;  multiply 2 uint16_t return uint32_t
                                   2509 ;  input:
                                   2510 ;     x       uint16_t 
                                   2511 ;     y       uint16_t 
                                   2512 ;  output:
                                   2513 ;     x       product bits 15..0
                                   2514 ;     y       product bits 31..16 
                                   2515 ;---------------------------------------
                           000001  2516 		U1=1  ; uint16_t 
                           000003  2517 		DBL=3 ; uint32_t
                           000006  2518 		VSIZE=6
      000EC4                       2519 umstar:
      000EC4                       2520 	_vars VSIZE 
      008E69 35 20            [ 2]    1     sub sp,#VSIZE 
      008E6B 48 72            [ 2] 2521 	ldw (U1,sp),x 
                                   2522 ;initialize bits 31..16 of 
                                   2523 ;product to zero 
      008E6D 5A 00            [ 1] 2524 	clr (DBL,sp)
      008E6F 02 7B            [ 1] 2525 	clr (DBL+1,sp)
                                   2526 ; produc U1L*U2L 
      008E71 02 20            [ 1] 2527 	ld a,yl 
      008E73 40               [ 4] 2528 	mul x,a 
      008E74 1F 05            [ 2] 2529 	ldw (DBL+2,sp),x
                                   2530 ; product U1H*U2L 
      008E74 A6 3C            [ 1] 2531 	ld a,(U1,sp) ; xh 
      008E76 11               [ 1] 2532 	ldw x,y
      008E77 01               [ 4] 2533 	mul x,a 
      008E78 26               [ 1] 2534 	clr a 
      008E79 23 A6 34         [ 2] 2535 	addw x,(DBL+1,sp) 
      008E7C 6B               [ 1] 2536 	clr a 
      008E7D 02 72            [ 1] 2537 	adc a,(DBL,sp) 
      008E7F 5C 00            [ 1] 2538 	ld (DBL,sp),a ; bits 23..17 
      008E81 02 91            [ 2] 2539 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2540 ; product U1L*U2H
      008E83 D6 01            [ 1] 2541 	swapw y 
      008E85 A1               [ 1] 2542 	ldw x,y
      008E86 3D 26            [ 1] 2543 	ld a,(U1+1,sp)
      008E88 04               [ 4] 2544 	mul x,a
      008E89 A6 36 20         [ 2] 2545 	addw x,(DBL+1,sp)
      008E8C 27               [ 1] 2546 	clr a 
      008E8D A1 3E            [ 1] 2547 	adc a,(DBL,sp)
      008E8F 26 04            [ 1] 2548 	ld (DBL,sp),a 
      008E91 A6 35            [ 2] 2549 	ldw (DBL+1,sp),x 
                                   2550 ; product U1H*U2H 	
      008E93 20 1F            [ 1] 2551 	ld a,(U1,sp)
      008E95 72               [ 1] 2552 	ldw x,y  
      008E96 5A               [ 4] 2553 	mul x,a 
      008E97 00 02 7B         [ 2] 2554 	addw x,(DBL,sp)
      008E9A 02 20            [ 1] 2555 	ldw y,x 
      008E9C 17 05            [ 2] 2556 	ldw x,(DBL+2,sp)
      008E9D                       2557 	_drop VSIZE 
      008E9D 7B 01            [ 2]    1     addw sp,#VSIZE 
      008E9F CD               [ 4] 2558 	ret
                                   2559 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2560 
                                   2561 ;-------------------------------------
                                   2562 ; multiply 2 integers
                                   2563 ; input:
                                   2564 ;  	x       n1 
                                   2565 ;   y 		n2 
                                   2566 ; output:
                                   2567 ;	X        N1*N2 bits 15..0
                                   2568 ;   Y        N1*N2 bits 31..16 
                                   2569 ;-------------------------------------
                           000001  2570 	SIGN=1
                           000001  2571 	VSIZE=1
      000EFE                       2572 multiply:
      000EFE                       2573 	_vars VSIZE 
      008EA0 85 EB            [ 2]    1     sub sp,#VSIZE 
      008EA2 25 03            [ 1] 2574 	clr (SIGN,sp)
      008EA4 CC               [ 1] 2575 	ld a,xh 
      008EA5 88 F5            [ 1] 2576 	and a,#0x80
      008EA7 2A 03            [ 1] 2577 	jrpl 1$
      008EA7 CD 8C            [ 1] 2578 	cpl (SIGN,sp)
      008EA9 AF               [ 2] 2579 	negw x 
      000F0A                       2580 1$:	
      008EAA A3 96            [ 1] 2581 	ld a,yh 
      008EAC 3C 26            [ 1] 2582 	jrpl 2$ 
      008EAE 09 90            [ 1] 2583 	cpl (SIGN,sp)
      008EB0 93 CC            [ 2] 2584 	negw y 
      000F12                       2585 2$:	
      008EB2 8D EB C4         [ 4] 2586 	call umstar
      008EB4 7B 01            [ 1] 2587 	ld a,(SIGN,sp)
      008EB4 F7 5C            [ 1] 2588 	jreq 3$
      008EB6 90 93 49         [ 4] 2589 	call dneg 
      008EB8                       2590 3$:	
      000F1C                       2591 	_drop VSIZE 
      008EB8 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EBA 81               [ 4] 2592 	ret
                                   2593 
                                   2594 ;--------------------------------------
                                   2595 ; divide uint32_t/uint16_t
                                   2596 ; return:  quotient and remainder 
                                   2597 ; quotient expected to be uint16_t 
                                   2598 ; input:
                                   2599 ;   DBLDIVDND    on stack 
                                   2600 ;   X            divisor 
                                   2601 ; output:
                                   2602 ;   X            quotient 
                                   2603 ;   Y            remainder 
                                   2604 ;---------------------------------------
                           000003  2605 	VSIZE=3
      008EBB                       2606 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F1F                       2607 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2608 	; local variables 
                           000001  2609 	DIVISOR=1 
                           000003  2610 	CNTR=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000F1F                       2611 udiv32_16:
      000F1F                       2612 	_vars VSIZE 
      008EBB A1 61            [ 2]    1     sub sp,#VSIZE 
      008EBD 2A 01            [ 2] 2613 	ldw (DIVISOR,sp),x	; save divisor 
      008EBF 81 A1            [ 2] 2614 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008EC1 7A 22            [ 2] 2615 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008EC3 FB A0            [ 2] 2616 	tnzw y
      008EC5 20 81            [ 1] 2617 	jrne long_division 
      008EC7 16 01            [ 2] 2618 	ldw y,(DIVISOR,sp)
      008EC7 89               [ 2] 2619 	divw x,y
      000F2E                       2620 	_drop VSIZE 
      008EC8 52 03            [ 2]    1     addw sp,#VSIZE 
      008ECA 72               [ 4] 2621 	ret
      000F31                       2622 long_division:
      008ECB 5F               [ 1] 2623 	exgw x,y ; hi in x, lo in y 
      008ECC 00 0C            [ 1] 2624 	ld a,#17 
      008ECE 72 5F            [ 1] 2625 	ld (CNTR,sp),a
      000F36                       2626 1$:
      008ED0 00 0D            [ 2] 2627 	cpw x,(DIVISOR,sp)
      008ED2 72 5F            [ 1] 2628 	jrmi 2$
      008ED4 00 0E 0F         [ 2] 2629 	subw x,(DIVISOR,sp)
      008ED7 01               [ 1] 2630 2$:	ccf 
      008ED8 A6 0A            [ 2] 2631 	rlcw y 
      008EDA 6B               [ 2] 2632 	rlcw x 
      008EDB 02 F6            [ 1] 2633 	dec (CNTR,sp)
      008EDD 27 47            [ 1] 2634 	jrne 1$
      008EDF A1               [ 1] 2635 	exgw x,y 
      000F46                       2636 	_drop VSIZE 
      008EE0 2D 26            [ 2]    1     addw sp,#VSIZE 
      008EE2 04               [ 4] 2637 	ret
                                   2638 
                                   2639 ;-----------------------------
                                   2640 ; negate double int.
                                   2641 ; input:
                                   2642 ;   x     bits 15..0
                                   2643 ;   y     bits 31..16
                                   2644 ; output: 
                                   2645 ;   x     bits 15..0
                                   2646 ;   y     bits 31..16
                                   2647 ;-----------------------------
      000F49                       2648 dneg:
      008EE3 03               [ 2] 2649 	cplw x 
      008EE4 01 20            [ 2] 2650 	cplw y 
      008EE6 08 A1 24         [ 2] 2651 	addw x,#1 
      008EE9 26 06            [ 1] 2652 	jrnc 1$
      008EEB A6 10            [ 2] 2653 	incw y 
      008EED 6B               [ 4] 2654 1$: ret 
                                   2655 
                                   2656 
                                   2657 ;--------------------------------
                                   2658 ; sign extend single to double
                                   2659 ; input:
                                   2660 ;   x    int16_t
                                   2661 ; output:
                                   2662 ;   x    int32_t bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2663 ;   y    int32_t bits 31..16
                                   2664 ;--------------------------------
      000F54                       2665 dbl_sign_extend:
      008EEE 02 5C            [ 1] 2666 	clrw y
      008EF0 F6               [ 1] 2667 	ld a,xh 
      008EF1 A4 80            [ 1] 2668 	and a,#0x80 
      008EF1 A1 61            [ 1] 2669 	jreq 1$
      008EF3 2B 02            [ 2] 2670 	cplw y
      008EF5 A0               [ 4] 2671 1$: ret 	
                                   2672 
                                   2673 
                                   2674 ;----------------------------------
                                   2675 ;  euclidian divide dbl/n1 
                                   2676 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2677 ; input:
                                   2678 ;    dbl    int32_t on stack 
                                   2679 ;    x 		n1   int16_t  disivor  
                                   2680 ; output:
                                   2681 ;    X      dbl/x  int16_t 
                                   2682 ;    Y      remainder int16_t 
                                   2683 ;----------------------------------
                           000008  2684 	VSIZE=8
      000F5E                       2685 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F5E                       2686 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F5E                       2687 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2688 	; local variables
                           000001  2689 	DBLHI=1
                           000003  2690 	DBLLO=3 
                           000005  2691 	SDIVSR=5 ; sign divisor
                           000006  2692 	SQUOT=6 ; sign dividend 
                           000007  2693 	DIVISR=7 ; divisor 
      000F5E                       2694 div32_16:
      000F5E                       2695 	_vars VSIZE 
      008EF6 20 A1            [ 2]    1     sub sp,#VSIZE 
      008EF8 30 2B            [ 1] 2696 	clr (SDIVSR,sp)
      008EFA 2B A0            [ 1] 2697 	clr (SQUOT,sp)
                                   2698 ; copy arguments 
      008EFC 30 A1            [ 2] 2699 	ldw y,(DIVDNDHI,sp)
      008EFE 0A 2B            [ 2] 2700 	ldw (DBLHI,sp),y
      008F00 06 A0            [ 2] 2701 	ldw y,(DIVDNDLO,sp)
      008F02 07 11            [ 2] 2702 	ldw (DBLLO,sp),y 
                                   2703 ; check for 0 divisor
      008F04 02               [ 2] 2704 	tnzw x 
      008F05 2A 1F            [ 1] 2705     jrne 0$
      008F07 6B 03            [ 1] 2706 	ld a,#ERR_DIV0 
      008F09 7B 02 CD         [ 2] 2707 	jp tb_error 
                                   2708 ; check divisor sign 	
      008F0C 8A               [ 1] 2709 0$:	ld a,xh 
      008F0D EA 7B            [ 1] 2710 	and a,#0x80 
      008F0F 03 CB            [ 1] 2711 	jreq 1$
      008F11 00 0E            [ 1] 2712 	cpl (SDIVSR,sp)
      008F13 C7 00            [ 1] 2713 	cpl (SQUOT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F15 0E               [ 2] 2714 	negw x
      008F16 4F C9            [ 2] 2715 1$:	ldw (DIVISR,sp),x
                                   2716 ; check dividend sign 	 
      008F18 00 0D            [ 1] 2717  	ld a,(DBLHI,sp) 
      008F1A C7 00            [ 1] 2718 	and a,#0x80 
      008F1C 0D 4F            [ 1] 2719 	jreq 2$ 
      008F1E C9 00            [ 1] 2720 	cpl (SQUOT,sp)
      008F20 0C C7            [ 2] 2721 	ldw x,(DBLLO,sp)
      008F22 00 0C            [ 2] 2722 	ldw y,(DBLHI,sp)
      008F24 20 C9 0D         [ 4] 2723 	call dneg 
      008F27 01 27            [ 2] 2724 	ldw (DBLLO,sp),x 
      008F29 03 CD            [ 2] 2725 	ldw (DBLHI,sp),y 
      008F2B 8B 24            [ 2] 2726 2$:	ldw x,(DIVISR,sp)
      008F2D CD 0F 1F         [ 4] 2727 	call udiv32_16
      008F2D 5B 03            [ 2] 2728 	tnzw y 
      008F2F 85 81            [ 1] 2729 	jreq 3$ 
                                   2730 ; x=quotient 
                                   2731 ; y=remainder 
                                   2732 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F31 7B 06            [ 1] 2733 	ld a,(SQUOT,sp)
      008F31 88 91            [ 1] 2734 	xor a,(SDIVSR,sp)
      008F33 D6 01            [ 1] 2735 	jreq 3$
      008F35 27               [ 2] 2736 	incw x 
      008F36 0A 11 01 26      [ 2] 2737 	ldw acc16,y 
      008F3A 06 72            [ 2] 2738 	ldw y,(DIVISR,sp)
      008F3C 5C 00 02 20      [ 2] 2739 	subw y,acc16
                                   2740 ; sign quotient
      008F40 F1 5B            [ 1] 2741 3$:	ld a,(SQUOT,sp)
      008F42 01 81            [ 1] 2742 	jreq 4$
      008F44 50               [ 2] 2743 	negw x 
      000FB2                       2744 4$:	
      000FB2                       2745 	_drop VSIZE 
      008F44 52 06            [ 2]    1     addw sp,#VSIZE 
      008F46 1F               [ 4] 2746 	ret 
                                   2747 
                                   2748 
                                   2749 
                                   2750 ;----------------------------------
                                   2751 ; division x/y 
                                   2752 ; input:
                                   2753 ;    X       dividend
                                   2754 ;    Y       divisor 
                                   2755 ; output:
                                   2756 ;    X       quotient
                                   2757 ;    Y       remainder 
                                   2758 ;-----------------------------------
                           000004  2759 	VSIZE=4 
                                   2760 	; local variables 
                           000001  2761 	DBLHI=1
                           000003  2762 	DBLLO=3
      000FB5                       2763 divide: 
      000FB5                       2764 	_vars VSIZE 
      008F47 01 0F            [ 2]    1     sub sp,#VSIZE 
      008F49 03 0F 04 90      [ 2] 2765 	ldw acc16,y
      008F4D 9F 42 1F         [ 4] 2766 	call dbl_sign_extend
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F50 05 7B            [ 2] 2767 	ldw (DBLLO,sp),x 
      008F52 01 93            [ 2] 2768 	ldw (DBLHI,sp),y 
      008F54 42 4F 72         [ 2] 2769 	ldw x,acc16 
      008F57 FB 04 4F         [ 4] 2770 	call div32_16 
      000FC8                       2771 	_drop VSIZE 
      008F5A 19 03            [ 2]    1     addw sp,#VSIZE 
      008F5C 6B               [ 4] 2772 	ret
                                   2773 
                                   2774 
                                   2775 ;----------------------------------
                                   2776 ;  remainder resulting from euclidian 
                                   2777 ;  division of x/y 
                                   2778 ; input:
                                   2779 ;   x   	dividend int16_t 
                                   2780 ;   y 		divisor int16_t
                                   2781 ; output:
                                   2782 ;   X       n1%n2 
                                   2783 ;----------------------------------
      000FCB                       2784 modulo:
      008F5D 03 1F 04         [ 4] 2785 	call divide
      008F60 90               [ 1] 2786 	ldw x,y 
      008F61 5E               [ 4] 2787 	ret 
                                   2788 
                                   2789 ;----------------------------------
                                   2790 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2791 ; return expr1*expr2/expr3 
                                   2792 ; product result is int32_t and 
                                   2793 ; divisiont is int32_t/int16_t
                                   2794 ;----------------------------------
                           000004  2795 	DBL_SIZE=4 
      000FD0                       2796 muldiv:
      008F62 93 7B 02         [ 4] 2797 	call func_args 
      008F65 42 72            [ 1] 2798 	cp a,#3 
      008F67 FB 04            [ 1] 2799 	jreq 1$
      008F69 4F 19 03         [ 2] 2800 	jp syntax_error
      000FDA                       2801 1$: 
      008F6C 6B 03            [ 2] 2802 	ldw x,(5,sp) ; expr1
      008F6E 1F 04            [ 2] 2803 	ldw y,(3,sp) ; expr2
      008F70 7B 01 93         [ 4] 2804 	call multiply 
      008F73 42 72            [ 2] 2805 	ldw (5,sp),x  ;int32_t 15..0
      008F75 FB 03            [ 2] 2806 	ldw (3,sp),y  ;int32_t 31..16
      008F77 90               [ 2] 2807 	popw x        ; expr3 
      008F78 93 1E 05         [ 4] 2808 	call div32_16 ; int32_t/expr3 
      000FE9                       2809 	_drop DBL_SIZE
      008F7B 5B 06            [ 2]    1     addw sp,#DBL_SIZE 
      008F7D 81               [ 4] 2810 	ret 
                                   2811 
                                   2812 
                                   2813 ;----------------------------------
                                   2814 ; search in kword_dict name
                                   2815 ; from its execution address 
                                   2816 ; input:
                                   2817 ;   X       	execution address 
                                   2818 ; output:
                                   2819 ;   X 			cstr*  | 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2820 ;--------------------------------
                           000001  2821 	XADR=1 
                           000003  2822 	LINK=3 
                           000004  2823 	VSIZE=4
      008F7E                       2824 cmd_name:
      000FEC                       2825 	_vars VSIZE 
      008F7E 52 01            [ 2]    1     sub sp,#VSIZE 
      008F80 0F 01 9E A4      [ 1] 2826 	clr acc16 
      008F84 80 2A            [ 2] 2827 	ldw (XADR,sp),x  
      008F86 03 03 01         [ 2] 2828 	ldw x,#kword_dict	
      008F89 50 03            [ 2] 2829 1$:	ldw (LINK,sp),x
      008F8A E6 02            [ 1] 2830 	ld a,(2,x)
      008F8A 90 9E            [ 1] 2831 	and a,#15 
      008F8C 2A 04 03         [ 1] 2832 	ld acc8,a 
      008F8F 01 90 50         [ 2] 2833 	addw x,#3
      008F92 72 BB 00 0C      [ 2] 2834 	addw x,acc16
      008F92 CD               [ 2] 2835 	ldw x,(x) ; execution address 
      008F93 8F 44            [ 2] 2836 	cpw x,(XADR,sp)
      008F95 7B 01            [ 1] 2837 	jreq 2$
      008F97 27 03            [ 2] 2838 	ldw x,(LINK,sp)
      008F99 CD               [ 2] 2839 	ldw x,(x) 
      008F9A 8F C9 02         [ 2] 2840 	subw x,#2  
      008F9C 26 E3            [ 1] 2841 	jrne 1$
      008F9C 5B 01            [ 2] 2842 	jra 9$
      008F9E 81 03            [ 2] 2843 2$: ldw x,(LINK,sp)
      008F9F 1C 00 02         [ 2] 2844 	addw x,#2 	
      00101B                       2845 9$:	_drop VSIZE
      008F9F 52 03            [ 2]    1     addw sp,#VSIZE 
      008FA1 1F               [ 4] 2846 	ret
                                   2847 
                                   2848 
                                   2849 ;---------------------------------
                                   2850 ; dictionary search 
                                   2851 ; input:
                                   2852 ;	X 		dictionary entry point, name field  
                                   2853 ;   y		.asciz name to search 
                                   2854 ; output:
                                   2855 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2856 ;  X		execution address | 0 
                                   2857 ;---------------------------------
                           000001  2858 	NLEN=1 ; cmd length 
                           000002  2859 	XSAVE=2
                           000004  2860 	YSAVE=4
                           000005  2861 	VSIZE=5 
      00101E                       2862 search_dict:
      00101E                       2863 	_vars VSIZE 
      008FA2 01 1E            [ 2]    1     sub sp,#VSIZE 
                                   2864 
      008FA4 08 16            [ 2] 2865 	ldw (YSAVE,sp),y 
      001022                       2866 search_next:
      008FA6 06 90            [ 2] 2867 	ldw (XSAVE,sp),x 
                                   2868 ; get name length in dictionary	
      008FA8 5D               [ 1] 2869 	ld a,(x)
      008FA9 26 06            [ 1] 2870 	and a,#0xf 
      008FAB 16 01            [ 1] 2871 	ld (NLEN,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FAD 65 5B            [ 2] 2872 	ldw y,(YSAVE,sp) ; name pointer 
      008FAF 03               [ 2] 2873 	incw x 
      00102C                       2874 cp_loop:
      008FB0 81 F6            [ 1] 2875 	ld a,(y)
      008FB1 27 1B            [ 1] 2876 	jreq str_match 
      008FB1 51 A6            [ 1] 2877 	tnz (NLEN,sp)
      008FB3 11 6B            [ 1] 2878 	jreq no_match  
      008FB5 03               [ 1] 2879 	cp a,(x)
      008FB6 26 07            [ 1] 2880 	jrne no_match 
      008FB6 13 01            [ 2] 2881 	incw y 
      008FB8 2B               [ 2] 2882 	incw x
      008FB9 03 72            [ 1] 2883 	dec (NLEN,sp)
      008FBB F0 01            [ 2] 2884 	jra cp_loop 
      00103E                       2885 no_match:
      008FBD 8C 90            [ 2] 2886 	ldw x,(XSAVE,sp) 
      008FBF 59 59 0A         [ 2] 2887 	subw x,#2 ; move X to link field
      008FC2 03 26            [ 1] 2888 	push #TK_NONE 
      008FC4 F1               [ 2] 2889 	ldw x,(x) ; next word link 
      008FC5 51               [ 1] 2890 	pop a ; TK_NONE 
      008FC6 5B 03            [ 1] 2891 	jreq search_exit  ; not found  
                                   2892 ;try next 
      008FC8 81 D7            [ 2] 2893 	jra search_next
      008FC9                       2894 str_match:
      008FC9 53 90            [ 2] 2895 	ldw x,(XSAVE,sp)
      008FCB 53               [ 1] 2896 	ld a,(X)
      008FCC 1C 00            [ 1] 2897 	ld (NLEN,sp),a ; needed to test keyword type  
      008FCE 01 24            [ 1] 2898 	and a,#0xf 
                                   2899 ; move x to procedure address field 	
      008FD0 02               [ 1] 2900 	inc a 
      008FD1 90 5C 81         [ 1] 2901 	ld acc8,a 
      008FD4 72 5F 00 0C      [ 1] 2902 	clr acc16 
      008FD4 90 5F 9E A4      [ 2] 2903 	addw x,acc16 
      008FD8 80               [ 2] 2904 	ldw x,(x) ; routine entry point 
                                   2905 ;determine keyword type bits 7:6 
      008FD9 27 02            [ 1] 2906 	ld a,(NLEN,sp)
      008FDB 90               [ 1] 2907 	swap a 
      008FDC 53 81            [ 1] 2908 	and a,#0xc
      008FDE 44               [ 1] 2909 	srl a
      008FDE 52               [ 1] 2910 	srl a 
      008FDF 08 0F            [ 1] 2911 	add a,#128
      001068                       2912 search_exit: 
      001068                       2913 	_drop VSIZE 	 
      008FE1 05 0F            [ 2]    1     addw sp,#VSIZE 
      008FE3 06               [ 4] 2914 	ret 
                                   2915 
                                   2916 ;---------------------
                                   2917 ; check if next token
                                   2918 ;  is of expected type 
                                   2919 ; input:
                                   2920 ;   A 		 expected token attribute
                                   2921 ;  ouput:
                                   2922 ;   none     if fail call syntax_error 
                                   2923 ;--------------------
      00106B                       2924 expect:
      008FE4 16               [ 1] 2925 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FE5 0B 17 01         [ 4] 2926 	call next_token 
      008FE8 16 0D            [ 1] 2927 	cp a,(1,sp)
      008FEA 17 03            [ 1] 2928 	jreq 1$
      008FEC 5D 26 05         [ 2] 2929 	jp syntax_error
      008FEF A6               [ 1] 2930 1$: pop a 
      008FF0 04               [ 4] 2931 	ret 
                                   2932 
                                   2933 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2934 ; parse arguments list 
                                   2935 ; between ()
                                   2936 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001078                       2937 func_args:
      008FF1 CC 88            [ 1] 2938 	ld a,#TK_LPAREN 
      008FF3 F7 9E A4         [ 4] 2939 	call expect 
                                   2940 ; expected to continue in arg_list 
                                   2941 ; caller must check for TK_RPAREN 
                                   2942 
                                   2943 ;-------------------------------
                                   2944 ; parse embedded BASIC routines 
                                   2945 ; arguments list.
                                   2946 ; arg_list::=  rel[','rel]*
                                   2947 ; all arguments are of integer type
                                   2948 ; and pushed on stack 
                                   2949 ; input:
                                   2950 ;   none
                                   2951 ; output:
                                   2952 ;   stack{n}   arguments pushed on stack
                                   2953 ;   A 	number of arguments pushed on stack  
                                   2954 ;--------------------------------
      00107D                       2955 arg_list:
      008FF6 80 27            [ 1] 2956 	push #0  
      008FF8 05 03 05         [ 4] 2957 1$: call relation
      008FFB 03 06            [ 1] 2958 	cp a,#TK_NONE 
      008FFD 50 1F            [ 1] 2959 	jreq 5$
      008FFF 07 7B            [ 1] 2960 	cp a,#TK_INTGR
      009001 01 A4            [ 1] 2961 	jrne 4$
      00108A                       2962 3$: 
                                   2963 ; swap return address with argument
      009003 80               [ 1] 2964 	pop a ; arg_count
      009004 27 0D            [ 2] 2965 	popw y ; return address 
      009006 03               [ 2] 2966 	pushw x ; new argument 
      009007 06 1E            [ 2] 2967 	pushw y 
      009009 03               [ 1] 2968     inc a
      00900A 16               [ 1] 2969 	push a 
      00900B 01 CD 8F         [ 4] 2970 	call next_token 
      00900E C9 1F            [ 1] 2971 	cp a,#TK_COMMA 
      009010 03 17            [ 1] 2972 	jreq 1$ 
      009012 01 1E            [ 1] 2973 	cp a,#TK_NONE 
      009014 07 CD            [ 1] 2974 	jreq 5$ 
      009016 8F 9F            [ 1] 2975 4$:	cp a,#TK_RPAREN 
      009018 90 5D            [ 1] 2976 	jreq 5$
      0010A1                       2977 	_unget_token 
      00901A 27 11 7B 06 18   [ 1]    1     mov in,in.saved
      00901F 05               [ 1] 2978 5$:	pop a  
      009020 27               [ 4] 2979 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2980 
                                   2981 ;--------------------------------
                                   2982 ;   BASIC commnands 
                                   2983 ;--------------------------------
                                   2984 
                                   2985 ;--------------------------------
                                   2986 ;  arithmetic and relational 
                                   2987 ;  routines
                                   2988 ;  operators precedence
                                   2989 ;  highest to lowest
                                   2990 ;  operators on same row have 
                                   2991 ;  same precedence and are executed
                                   2992 ;  from left to right.
                                   2993 ;	'*','/','%'
                                   2994 ;   '-','+'
                                   2995 ;   '=','>','<','>=','<=','<>','><'
                                   2996 ;   '<>' and '><' are equivalent for not equal.
                                   2997 ;--------------------------------
                                   2998 
                                   2999 ;---------------------
                                   3000 ; return array element
                                   3001 ; address from @(expr)
                                   3002 ; input:
                                   3003 ;   A 		TK_ARRAY
                                   3004 ; output:
                                   3005 ;   A 		TK_INTGR
                                   3006 ;	X 		element address 
                                   3007 ;----------------------
      0010A8                       3008 get_array_element:
      009021 0B 5C 90         [ 4] 3009 	call func_args 
      009024 CF 00            [ 1] 3010 	cp a,#1
      009026 0D 16            [ 1] 3011 	jreq 1$
      009028 07 72 B2         [ 2] 3012 	jp syntax_error
      00902B 00               [ 2] 3013 1$: popw x 
                                   3014 	; check for bounds 
      00902C 0D 7B 06         [ 2] 3015 	cpw x,array_size 
      00902F 27 01            [ 2] 3016 	jrule 3$
                                   3017 ; bounds {1..array_size}	
      009031 50 0A            [ 1] 3018 2$: ld a,#ERR_BAD_VALUE 
      009032 CC 08 77         [ 2] 3019 	jp tb_error 
      009032 5B               [ 2] 3020 3$: tnzw  x
      009033 08 81            [ 1] 3021 	jreq 2$ 
      009035 58               [ 2] 3022 	sllw x 
      009035 52               [ 2] 3023 	pushw x 
      009036 04 90 CF         [ 2] 3024 	ldw x,#tib
      009039 00 0D CD         [ 2] 3025 	subw x,(1,sp)
      0010C8                       3026 	_drop 2   
      00903C 8F D4            [ 2]    1     addw sp,#2 
      00903E 1F 03            [ 1] 3027 	ld a,#TK_INTGR
      009040 17               [ 4] 3028 	ret 
                                   3029 
                                   3030 
                                   3031 ;***********************************
                                   3032 ;   expression parse,execute 
                                   3033 ;***********************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3034 ;-----------------------------------
                                   3035 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3036 ;			 integer | function |
                                   3037 ;			 '('relation')' 
                                   3038 ; output:
                                   3039 ;   A    token attribute 
                                   3040 ;   X 	 integer
                                   3041 ; ---------------------------------
                           000001  3042 	NEG=1
                           000001  3043 	VSIZE=1
      0010CD                       3044 factor:
      0010CD                       3045 	_vars VSIZE 
      009041 01 CE            [ 2]    1     sub sp,#VSIZE 
      009043 00 0D CD         [ 4] 3046 	call next_token
      009046 8F DE            [ 1] 3047 	cp a,#CMD_END 
      009048 5B 04            [ 1] 3048 	jrult 20$
      00904A 81 01            [ 1] 3049 1$:	ld (NEG,sp),a 
      00904B A4 30            [ 1] 3050 	and a,#TK_GRP_MASK
      00904B CD 90            [ 1] 3051 	cp a,#TK_GRP_ADD 
      00904D 35 93            [ 1] 3052 	jreq 2$
      00904F 81 01            [ 1] 3053 	ld a,(NEG,sp)
      009050 20 03            [ 2] 3054 	jra 4$  
      0010E2                       3055 2$:	
      009050 CD 90 F8         [ 4] 3056 	call next_token 
      0010E5                       3057 4$:	
      009053 A1 03            [ 1] 3058 	cp a,#TK_IFUNC 
      009055 27 03            [ 1] 3059 	jrne 5$ 
      009057 CC               [ 4] 3060 	call (x) 
      009058 88 F5            [ 2] 3061 	jra 18$ 
      00905A                       3062 5$:
      00905A 1E 05            [ 1] 3063 	cp a,#TK_INTGR
      00905C 16 03            [ 1] 3064 	jrne 6$
      00905E CD 8F            [ 2] 3065 	jra 18$
      0010F2                       3066 6$:
      009060 7E 1F            [ 1] 3067 	cp a,#TK_ARRAY
      009062 05 17            [ 1] 3068 	jrne 10$
      009064 03 85 CD         [ 4] 3069 	call get_array_element
      009067 8F               [ 2] 3070 	ldw x,(x)
      009068 DE 5B            [ 2] 3071 	jra 18$ 
      0010FC                       3072 10$:
      00906A 04 81            [ 1] 3073 	cp a,#TK_VAR 
      00906C 26 03            [ 1] 3074 	jrne 12$
      00906C 52               [ 2] 3075 	ldw x,(x)
      00906D 04 72            [ 2] 3076 	jra 18$
      001103                       3077 12$:			
      00906F 5F 00            [ 1] 3078 	cp a,#TK_LPAREN
      009071 0D 1F            [ 1] 3079 	jrne 16$
      009073 01 AE A7         [ 4] 3080 	call relation
      009076 35               [ 2] 3081 	pushw x 
      009077 1F 03            [ 1] 3082 	ld a,#TK_RPAREN 
      009079 E6 02 A4         [ 4] 3083 	call expect
      00907C 0F               [ 2] 3084 	popw x 
      00907D C7 00            [ 2] 3085 	jra 18$	
      001113                       3086 16$:
      001113                       3087 	_unget_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00907F 0E 1C 00 03 72   [ 1]    1     mov in,in.saved
      009084 BB               [ 1] 3088 	clr a 
      009085 00 0D            [ 2] 3089 	jra 20$ 
      00111B                       3090 18$: 
      009087 FE 13            [ 1] 3091 	ld a,#TK_MINUS 
      009089 01 27            [ 1] 3092 	cp a,(NEG,sp)
      00908B 0A 1E            [ 1] 3093 	jrne 19$
      00908D 03               [ 2] 3094 	negw x
      001122                       3095 19$:
      00908E FE 1D            [ 1] 3096 	ld a,#TK_INTGR
      001124                       3097 20$:
      001124                       3098 	_drop VSIZE
      009090 00 02            [ 2]    1     addw sp,#VSIZE 
      009092 26               [ 4] 3099 	ret
                                   3100 
                                   3101 ;-----------------------------------
                                   3102 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3103 ; output:
                                   3104 ;   A    	token attribute 
                                   3105 ;	X		integer
                                   3106 ;-----------------------------------
                           000001  3107 	N1=1   ; int16_t
                           000003  3108 	MULOP=3
                           000003  3109 	VSIZE=3
      001127                       3110 term:
      001127                       3111 	_vars VSIZE
      009093 E3 20            [ 2]    1     sub sp,#VSIZE 
      009095 05 1E 03         [ 4] 3112 	call factor
      009098 1C 00            [ 1] 3113 	cp a,#CMD_END
      00909A 02 5B            [ 1] 3114 	jrult term_exit
      001130                       3115 term01:	 ; check for  operator 
      00909C 04 81            [ 2] 3116 	ldw (N1,sp),x  ; save first factor 
      00909E CD 09 67         [ 4] 3117 	call next_token
      00909E 52 05            [ 1] 3118 	cp a,#CMD_END
      0090A0 17 04            [ 1] 3119 	jrult 9$
      0090A2 6B 03            [ 1] 3120 0$:	ld (MULOP,sp),a
      0090A2 1F 02            [ 1] 3121 	and a,#TK_GRP_MASK
      0090A4 F6 A4            [ 1] 3122 	cp a,#TK_GRP_MULT
      0090A6 0F 6B            [ 1] 3123 	jreq 1$
      001141                       3124 	_unget_token 
      0090A8 01 16 04 5C 01   [ 1]    1     mov in,in.saved
      0090AC 20 27            [ 2] 3125 	jra 9$
      001148                       3126 1$:	; got *|/|%
      0090AC 90 F6 27         [ 4] 3127 	call factor
      0090AF 1B 0D            [ 1] 3128 	cp a,#TK_INTGR
      0090B1 01 27            [ 1] 3129 	jreq 2$ 
      0090B3 0A F1 26         [ 2] 3130 	jp syntax_error
      0090B6 07 90            [ 1] 3131 2$:	ldw y,x 
      0090B8 5C 5C            [ 2] 3132 	ldw x,(N1,sp)
      0090BA 0A 01            [ 1] 3133 	ld a,(MULOP,sp) 
      0090BC 20 EE            [ 1] 3134 	cp a,#TK_MULT 
      0090BE 26 05            [ 1] 3135 	jrne 3$
      0090BE 1E 02 1D         [ 4] 3136 	call multiply 
      0090C1 00 02            [ 2] 3137 	jra term01
      0090C3 4B 00            [ 1] 3138 3$: cp a,#TK_DIV 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0090C5 FE 84            [ 1] 3139 	jrne 4$ 
      0090C7 27 1F 20         [ 4] 3140 	call divide 
      0090CA D7 C6            [ 2] 3141 	jra term01 
      0090CB CD 0F CB         [ 4] 3142 4$: call modulo
      0090CB 1E 02            [ 2] 3143 	jra term01 
      0090CD F6 6B            [ 2] 3144 9$: ldw x,(N1,sp)
      0090CF 01 A4            [ 1] 3145 	ld a,#TK_INTGR 	
      001173                       3146 term_exit:
      001173                       3147 	_drop VSIZE 
      0090D1 0F 4C            [ 2]    1     addw sp,#VSIZE 
      0090D3 C7               [ 4] 3148 	ret 
                                   3149 
                                   3150 ;-------------------------------
                                   3151 ;  expr ::= term [['+'|'-'] term]*
                                   3152 ;  result range {-32768..32767}
                                   3153 ;  output:
                                   3154 ;   A    token attribute 
                                   3155 ;   X	 integer   
                                   3156 ;-------------------------------
                           000001  3157 	N1=1 
                           000003  3158 	OP=3 
                           000003  3159 	VSIZE=3 
      001176                       3160 expression:
      001176                       3161 	_vars VSIZE 
      0090D4 00 0E            [ 2]    1     sub sp,#VSIZE 
      0090D6 72 5F 00         [ 4] 3162 	call term
      0090D9 0D 72            [ 1] 3163 	cp a,#CMD_END 
      0090DB BB 00            [ 1] 3164 	jrult expr_exit 
      0090DD 0D FE            [ 2] 3165 0$:	ldw (N1,sp),x 
      0090DF 7B 01 4E         [ 4] 3166 	call next_token
      0090E2 A4 0C            [ 1] 3167 	cp a,#CMD_END 
      0090E4 44 44            [ 1] 3168 	jrult 9$ 
      0090E6 AB 80            [ 1] 3169 1$:	ld (OP,sp),a  
      0090E8 A4 30            [ 1] 3170 	and a,#TK_GRP_MASK
      0090E8 5B 05            [ 1] 3171 	cp a,#TK_GRP_ADD 
      0090EA 81 07            [ 1] 3172 	jreq 2$ 
      0090EB                       3173 	_unget_token
      0090EB 88 CD 89 E7 11   [ 1]    1     mov in,in.saved
      0090F0 01 27            [ 2] 3174 	jra 9$
      001197                       3175 2$: 
      0090F2 03 CC 88         [ 4] 3176 	call term
      0090F5 F5 84            [ 1] 3177 	cp a,#TK_INTGR 
      0090F7 81 03            [ 1] 3178 	jreq 3$
      0090F8 CC 08 75         [ 2] 3179 	jp syntax_error
      0090F8 A6 07 CD         [ 2] 3180 3$:	ldw acc16,x 
      0090FB 90 EB            [ 2] 3181 	ldw x,(N1,sp)
      0090FD 7B 03            [ 1] 3182 	ld a,(OP,sp)
      0090FD 4B 00            [ 1] 3183 	cp a,#TK_PLUS 
      0090FF CD 92            [ 1] 3184 	jrne 4$
      009101 3F A1 00 27      [ 2] 3185 	addw x,acc16
      009105 20 A1            [ 2] 3186 	jra 0$ 
      009107 84 26 13 0C      [ 2] 3187 4$:	subw x,acc16
      00910A 20 C7            [ 2] 3188 	jra 0$
      00910A 84 90            [ 2] 3189 9$: ldw x,(N1,sp)
      00910C 85 89            [ 1] 3190 	ld a,#TK_INTGR	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0011BC                       3191 expr_exit:
      0011BC                       3192 	_drop VSIZE 
      00910E 90 89            [ 2]    1     addw sp,#VSIZE 
      009110 4C               [ 4] 3193 	ret 
                                   3194 
                                   3195 ;---------------------------------------------
                                   3196 ; rel ::= expr rel_op expr
                                   3197 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3198 ;  relation return  integer , zero is false 
                                   3199 ;  output:
                                   3200 ;    A 		token attribute  
                                   3201 ;	 X		integer 
                                   3202 ;---------------------------------------------
                           000001  3203 	N1=1
                           000003  3204 	RELOP=3
                           000003  3205 	VSIZE=3 
      0011BF                       3206 relation: 
      0011BF                       3207 	_vars VSIZE
      009111 88 CD            [ 2]    1     sub sp,#VSIZE 
      009113 89 E7 A1         [ 4] 3208 	call expression
      009116 09 27            [ 1] 3209 	cp a,#CMD_END  
      009118 E6 A1            [ 1] 3210 	jrult rel_exit 
                                   3211 	; expect rel_op or leave 
      00911A 00 27            [ 2] 3212 	ldw (N1,sp),x 
      00911C 09 A1 08         [ 4] 3213 	call next_token 
      00911F 27 05            [ 1] 3214 	cp a,#CMD_END 
      009121 55 00            [ 1] 3215 	jrult 9$
      0011D1                       3216 1$:	
      009123 03 00            [ 1] 3217 	ld (RELOP,sp),a 
      009125 02 84            [ 1] 3218 	and a,#TK_GRP_MASK
      009127 81 30            [ 1] 3219 	cp a,#TK_GRP_RELOP 
      009128 27 07            [ 1] 3220 	jreq 2$
      0011D9                       3221 	_unget_token  
      009128 CD 90 F8 A1 01   [ 1]    1     mov in,in.saved
      00912D 27 03            [ 2] 3222 	jra 9$
      0011E0                       3223 2$:	; expect another expression or error 
      00912F CC 88 F5         [ 4] 3224 	call expression
      009132 85 C3            [ 1] 3225 	cp a,#TK_INTGR 
      009134 00 22            [ 1] 3226 	jreq 3$
      009136 23 05 A6         [ 2] 3227 	jp syntax_error 
      009139 0A CC 88         [ 2] 3228 3$:	ldw acc16,x 
      00913C F7 5D            [ 2] 3229 	ldw x,(N1,sp) 
      00913E 27 F8 58 89      [ 2] 3230 	subw x,acc16
      009142 AE 16            [ 1] 3231 	jrne 4$
      009144 90 72 F0 01      [ 1] 3232 	mov acc8,#2 ; n1==n2
      009148 5B 02            [ 2] 3233 	jra 6$ 
      0011FB                       3234 4$: 
      00914A A6 84            [ 1] 3235 	jrsgt 5$  
      00914C 81 04 00 0D      [ 1] 3236 	mov acc8,#4 ; n1<2 
      00914D 20 04            [ 2] 3237 	jra 6$
      001203                       3238 5$:
      00914D 52 01 CD 89      [ 1] 3239 	mov acc8,#1 ; n1>n2 
      001207                       3240 6$:
      009151 E7               [ 1] 3241 	clrw x 
      009152 A1 02 25         [ 1] 3242 	ld a, acc8  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009155 4E 6B            [ 1] 3243 	and a,(RELOP,sp)
      009157 01               [ 1] 3244 	tnz a 
      009158 A4 30            [ 1] 3245 	jreq 10$
      00915A A1               [ 2] 3246 	incw x 
      001211                       3247 7$:	 
      00915B 10 27            [ 2] 3248 	jra 10$  	
      00915D 04 7B            [ 2] 3249 9$: ldw x,(N1,sp)
      001215                       3250 10$:
      00915F 01 20            [ 1] 3251 	ld a,#TK_INTGR
      001217                       3252 rel_exit: 	 
      001217                       3253 	_drop VSIZE
      009161 03 03            [ 2]    1     addw sp,#VSIZE 
      009162 81               [ 4] 3254 	ret 
                                   3255 
                                   3256 ;--------------------------------
                                   3257 ; BASIC: SHOW 
                                   3258 ; print stack content in hexadecimal bytes 
                                   3259 ; 16 bytes per row 
                                   3260 ;--------------------------------
      00121A                       3261 show:
      009162 CD 89 E7         [ 2] 3262 	ldw x,#cstk_prompt
      009165 CD 02 B3         [ 4] 3263 	call puts 
      009165 A1               [ 1] 3264 	ldw x,sp 
      009166 81 26 03         [ 2] 3265 	addw x,#3 ; ignore return address
      009169 FD 20 2F 00      [ 2] 3266 	ldw y,#RAM_SIZE  
      00916C CF 00 0C         [ 2] 3267 	ldw acc16,x 
      00916C A1 84 26 02      [ 2] 3268 	subw y,acc16
      009170 20 29 55         [ 4] 3269 	call hex_dump
      009172 4F               [ 1] 3270 	clr a 
      009172 A1               [ 4] 3271 	ret
                                   3272 
      009173 06 26 06 CD 91 28 FE  3273 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             20 1F 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3274 
                                   3275 
                                   3276 ;--------------------------------------------
                                   3277 ; BASIC: HEX 
                                   3278 ; select hexadecimal base for integer print
                                   3279 ;---------------------------------------------
      00917C                       3280 hex_base:
      00917C A1 85 26 03      [ 1] 3281 	mov base,#16 
      009180 FE               [ 4] 3282 	ret 
                                   3283 
                                   3284 ;--------------------------------------------
                                   3285 ; BASIC: DEC 
                                   3286 ; select decimal base for integer print
                                   3287 ;---------------------------------------------
      001260                       3288 dec_base:
      009181 20 18 00 0A      [ 1] 3289 	mov base,#10
      009183 81               [ 4] 3290 	ret 
                                   3291 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3292 ;------------------------
                                   3293 ; BASIC: SIZE 
                                   3294 ; return free size in text area
                                   3295 ; output:
                                   3296 ;   A 		TK_INTGR
                                   3297 ;   X 	    size integer
                                   3298 ;--------------------------
      001265                       3299 size:
      009183 A1 07 26         [ 2] 3300 	ldw x,#tib 
      009186 0C CD 92 3F      [ 2] 3301 	subw x,txtend 
      00918A 89 A6            [ 1] 3302 	ld a,#TK_INTGR
      00918C 08               [ 4] 3303 	ret 
                                   3304 
                                   3305 
                                   3306 ;------------------------
                                   3307 ; BASIC: UBOUND  
                                   3308 ; return array variable size 
                                   3309 ; output:
                                   3310 ;   A 		TK_INTGR
                                   3311 ;   X 	    array size 
                                   3312 ;--------------------------
      00126F                       3313 ubound:
      00918D CD 90 EB         [ 2] 3314 	ldw x,#tib
      009190 85 20 08 1E      [ 2] 3315 	subw x,txtend 
      009193 90 CE 00 04      [ 2] 3316 	ldw y,basicptr 
      009193 55 00 03 00      [ 2] 3317 	cpw y,txtend 
      009197 02 4F            [ 1] 3318 	jrult 1$
      009199 20 09 03         [ 1] 3319 	push count 
      00919B 4B 00            [ 1] 3320 	push #0 
      00919B A6 11 11         [ 2] 3321 	subw x,(1,sp)
      001288                       3322 	_drop 2 
      00919E 01 26            [ 2]    1     addw sp,#2 
      0091A0 01               [ 2] 3323 1$:	srlw x 
      0091A1 50 00 21         [ 2] 3324 	ldw array_size,x
      0091A2 A6 84            [ 1] 3325 	ld a,#TK_INTGR
      0091A2 A6               [ 4] 3326 	ret 
                                   3327 
                                   3328 ;-----------------------------
                                   3329 ; BASIC: LET var=expr 
                                   3330 ; variable assignement 
                                   3331 ; output:
                                   3332 ;   A 		TK_NONE 
                                   3333 ;-----------------------------
      001291                       3334 let:
      0091A3 84 09 67         [ 4] 3335 	call next_token 
      0091A4 A1 85            [ 1] 3336 	cp a,#TK_VAR 
      0091A4 5B 01            [ 1] 3337 	jreq let_var
      0091A6 81 06            [ 1] 3338 	cp a,#TK_ARRAY 
      0091A7 27 03            [ 1] 3339 	jreq  let_array
      0091A7 52 03 CD         [ 2] 3340 	jp syntax_error
      00129F                       3341 let_array:
      0091AA 91 4D A1         [ 4] 3342 	call get_array_element
      0012A2                       3343 let_var:
      0091AD 02               [ 2] 3344 	pushw x  
      0091AE 25 43 67         [ 4] 3345 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091B0 A1 32            [ 1] 3346 	cp a,#TK_EQUAL
      0091B0 1F 01            [ 1] 3347 	jreq 1$
      0091B2 CD 89 E7         [ 2] 3348 	jp syntax_error
      0012AD                       3349 1$:	
      0091B5 A1 02 25         [ 4] 3350 	call relation   
      0091B8 36 6B            [ 1] 3351 	cp a,#TK_INTGR 
      0091BA 03 A4            [ 1] 3352 	jreq 2$
      0091BC 30 A1 20         [ 2] 3353 	jp syntax_error
      0012B7                       3354 2$:	
      0091BF 27 07            [ 1] 3355 	ldw y,x 
      0091C1 55               [ 2] 3356 	popw x   
      0091C2 00               [ 2] 3357 	ldw (x),y   
      0091C3 03               [ 4] 3358 	ret 
                                   3359 
                                   3360 ;----------------------------
                                   3361 ; BASIC: LIST [[start][,end]]
                                   3362 ; list program lines 
                                   3363 ; form start to end 
                                   3364 ; if empty argument list then 
                                   3365 ; list all.
                                   3366 ;----------------------------
                           000001  3367 	FIRST=1
                           000003  3368 	LAST=3 
                           000005  3369 	LN_PTR=5
                           000006  3370 	VSIZE=6 
      0012BC                       3371 list:
      0091C4 00 02 20         [ 2] 3372 	ldw x,txtbgn 
      0091C7 27 00 1E         [ 2] 3373 	cpw x,txtend 
      0091C8 2B 01            [ 1] 3374 	jrmi 1$
      0091C8 CD               [ 4] 3375 	ret 
      0012C5                       3376 1$:	
      0012C5                       3377 	_vars VSIZE
      0091C9 91 4D            [ 2]    1     sub sp,#VSIZE 
      0091CB A1 84            [ 2] 3378 	ldw (LN_PTR,sp),x 
      0091CD 27               [ 2] 3379 	ldw x,(x) 
      0091CE 03 CC            [ 2] 3380 	ldw (FIRST,sp),x ; list from first line 
      0091D0 88 F5 90         [ 2] 3381 	ldw x,#MAX_LINENO ; biggest line number 
      0091D3 93 1E            [ 2] 3382 	ldw (LAST,sp),x 
      0091D5 01 7B 03         [ 4] 3383 	call arg_list
      0091D8 A1               [ 1] 3384 	tnz a
      0091D9 20 26            [ 1] 3385 	jreq list_start 
      0091DB 05 CD            [ 1] 3386 	cp a,#2 
      0091DD 8F 7E            [ 1] 3387 	jreq 4$
      0091DF 20 CF            [ 1] 3388 	cp a,#1 
      0091E1 A1 21            [ 1] 3389 	jreq first_line 
      0091E3 26 05 CD         [ 2] 3390 	jp syntax_error 
      0091E6 90               [ 2] 3391 4$:	popw x 
      0091E7 35 20            [ 2] 3392 	ldw (LAST+2,sp),x 
      0012E5                       3393 first_line:
      0091E9 C6               [ 2] 3394 	popw x
      0091EA CD 90            [ 2] 3395 	ldw (FIRST,sp),x 
      0012E8                       3396 lines_skip:
      0091EC 4B 20 C1         [ 2] 3397 	ldw x,txtbgn
      0091EF 1E 01            [ 2] 3398 2$:	ldw (LN_PTR,sp),x 
      0091F1 A6 84 1E         [ 2] 3399 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091F3 2A 3C            [ 1] 3400 	jrpl list_exit 
      0091F3 5B               [ 2] 3401 	ldw x,(x) ;line# 
      0091F4 03 81            [ 2] 3402 	cpw x,(FIRST,sp)
      0091F6 2A 11            [ 1] 3403 	jrpl list_start 
      0091F6 52 03            [ 2] 3404 	ldw x,(LN_PTR,sp) 
      0091F8 CD 91            [ 1] 3405 	ld a,(2,x)
      0091FA A7 A1 02         [ 1] 3406 	ld acc8,a 
      0091FD 25 3D 1F 01      [ 1] 3407 	clr acc16 
      009201 CD 89 E7 A1      [ 2] 3408 	addw x,acc16
      009205 02 25            [ 2] 3409 	jra 2$ 
                                   3410 ; print loop
      001308                       3411 list_start:
      009207 30 6B            [ 2] 3412 	ldw x,(LN_PTR,sp)
      009209 03 A4            [ 1] 3413 3$:	ld a,(2,x) 
      00920B 30 A1 10         [ 4] 3414 	call prt_basic_line
      00920E 27 07            [ 2] 3415 	ldw x,(LN_PTR,sp)
      009210 55 00            [ 1] 3416 	ld a,(2,x)
      009212 03 00 02         [ 1] 3417 	ld acc8,a 
      009215 20 21 00 0C      [ 1] 3418 	clr acc16 
      009217 72 BB 00 0C      [ 2] 3419 	addw x,acc16
      009217 CD 91 A7         [ 2] 3420 	cpw x,txtend 
      00921A A1 84            [ 1] 3421 	jrpl list_exit
      00921C 27 03            [ 2] 3422 	ldw (LN_PTR,sp),x
      00921E CC               [ 2] 3423 	ldw x,(x)
      00921F 88 F5            [ 2] 3424 	cpw x,(LAST,sp)  
      009221 CF 00            [ 1] 3425 	jrsgt list_exit 
      009223 0D 1E            [ 2] 3426 	ldw x,(LN_PTR,sp)
      009225 01 7B            [ 2] 3427 	jra 3$
      00132E                       3428 list_exit:
      00132E                       3429 	_drop VSIZE 
      009227 03 A1            [ 2]    1     addw sp,#VSIZE 
      009229 10               [ 4] 3430 	ret
                                   3431 
                                   3432 ;-------------------------
                                   3433 ; print counted string 
                                   3434 ; input:
                                   3435 ;   X 	address of string
                                   3436 ;--------------------------
      001331                       3437 prt_cmd_name:
      00922A 26               [ 1] 3438 	ld a,(x)
      00922B 06               [ 2] 3439 	incw x
      00922C 72 BB            [ 1] 3440 	and a,#15  
      00922E 00               [ 1] 3441 	push a 
      00922F 0D 20            [ 1] 3442 1$: tnz (1,sp) 
      009231 CD 72            [ 1] 3443 	jreq 9$
      009233 B0               [ 1] 3444 	ld a,(x)
      009234 00 0D 20         [ 4] 3445 	call putc 
      009237 C7               [ 2] 3446 	incw x
      009238 1E 01            [ 1] 3447 	dec (1,sp)	 
      00923A A6 84            [ 2] 3448 	jra 1$
      00923C 84               [ 1] 3449 9$: pop a 
      00923C 5B               [ 4] 3450 	ret	
                                   3451 
                                   3452 ;--------------------------
                                   3453 ; print TK_QSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3454 ; converting control character
                                   3455 ; to backslash sequence
                                   3456 ; input:
                                   3457 ;   X        char *
                                   3458 ;-----------------------------
      001345                       3459 prt_quote:
      00923D 03 81            [ 1] 3460 	ld a,#'"
      00923F CD 02 A0         [ 4] 3461 	call putc 
      00923F 52               [ 1] 3462 1$:	ld a,(x)
      009240 03 CD            [ 1] 3463 	jreq 9$
      009242 91               [ 2] 3464 	incw x 
      009243 F6 A1            [ 1] 3465 	cp a,#SPACE 
      009245 02 25            [ 1] 3466 	jrult 3$
      009247 4F 1F 01         [ 4] 3467 	call putc
      00924A CD 89            [ 1] 3468 	cp a,#'\ 
      00924C E7 A1            [ 1] 3469 	jrne 1$ 
      001359                       3470 2$:
      00924E 02 25 42         [ 4] 3471 	call putc 
      009251 20 EC            [ 2] 3472 	jra 1$
      009251 6B               [ 1] 3473 3$: push a 
      009252 03 A4            [ 1] 3474 	ld a,#'\
      009254 30 A1 30         [ 4] 3475 	call putc 
      009257 27               [ 1] 3476 	pop a 
      009258 07 55            [ 1] 3477 	sub a,#7
      00925A 00 03 00         [ 1] 3478 	ld acc8,a 
      00925D 02 20 33 0C      [ 1] 3479 	clr acc16
      009260 90 AE 0B A0      [ 2] 3480 	ldw y,#escaped 
      009260 CD 91 F6 A1      [ 2] 3481 	addw y,acc16 
      009264 84 27            [ 1] 3482 	ld a,(y)
      009266 03 CC            [ 2] 3483 	jra 2$
      009268 88 F5            [ 1] 3484 9$: ld a,#'"
      00926A CF 00 0D         [ 4] 3485 	call putc 
      00926D 1E               [ 2] 3486 	incw x 
      00926E 01               [ 4] 3487 	ret
                                   3488 
                                   3489 ;--------------------------
                                   3490 ; return variable name 
                                   3491 ; from its address.
                                   3492 ; input:
                                   3493 ;   X    variable address
                                   3494 ; output:
                                   3495 ;   A     variable letter
                                   3496 ;--------------------------
      001381                       3497 var_name:
      00926F 72 B0 00         [ 2] 3498 		subw x,#vars 
      009272 0D               [ 1] 3499 		ld a,xl 
      009273 26               [ 1] 3500 		srl a 
      009274 06 35            [ 1] 3501 		add a,#'A 
      009276 02               [ 4] 3502 		ret 
                                   3503 
                                   3504 
                                   3505 ;--------------------------
                                   3506 ; decompile line from token list 
                                   3507 ; input:
                                   3508 ;   A       stop at this position 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3509 ;   X 		pointer at line
                                   3510 ; output:
                                   3511 ;   none 
                                   3512 ;--------------------------	
                           000001  3513 	BASE_SAV=1
                           000002  3514 	WIDTH_SAV=2
                           000003  3515 	XSAVE=3
                           000005  3516 	LLEN=5
                           000005  3517 	VSIZE=5 
      001389                       3518 prt_basic_line:
      001389                       3519 	_vars VSIZE
      009277 00 0E            [ 2]    1     sub sp,#VSIZE 
      009279 20 0C            [ 1] 3520 	ld (LLEN,sp),a  
      00927B C6 00 0A         [ 1] 3521 	ld a,base
      00927B 2C 06            [ 1] 3522 	ld (BASE_SAV,sp),a  
      00927D 35 04 00         [ 1] 3523 	ld a,tab_width 
      009280 0E 20            [ 1] 3524 	ld (WIDTH_SAV,sp),a 
      009282 04 00 17         [ 2] 3525 	ldw ptr16,x
      009283 FE               [ 2] 3526 	ldw x,(x)
      009283 35 01 00 0E      [ 1] 3527 	mov base,#10
      009287 35 05 00 24      [ 1] 3528 	mov tab_width,#5
      009287 5F C6 00         [ 4] 3529 	call print_int ; print line number 
      00928A 0E 14            [ 1] 3530 	ld a,#SPACE 
      00928C 03 4D 27         [ 4] 3531 	call putc 
      00928F 05 5C 00 24      [ 1] 3532 	clr tab_width
      009291 AE 00 03         [ 2] 3533 	ldw x,#3
      009291 20               [ 1] 3534 1$:	ld a,xl 
      009292 02 1E            [ 1] 3535 	cp a,(LLEN,sp)
      009294 01 03            [ 1] 3536 	jrmi 2$
      009295 CC 14 88         [ 2] 3537 	jp 20$
      0013BA                       3538 2$:	 
      009295 A6 84 00 17      [ 4] 3539 	ld a,([ptr16],x)
      009297 5C               [ 2] 3540 	incw x 
      009297 5B 03            [ 2] 3541 	ldw (XSAVE,sp),x 
      009299 81 DE 00 17      [ 5] 3542 	ldw x,([ptr16],x)
      00929A 4D               [ 1] 3543 	tnz a 
      00929A AE 92            [ 1] 3544 	jrmi 3$
      00929C B4 CD            [ 1] 3545 	cp a,#TK_QSTR 
      00929E 83 33            [ 1] 3546 	jreq 6$
      0092A0 96 1C            [ 1] 3547 	cp a,#TK_CHAR 
      0092A2 00 03            [ 1] 3548 	jreq 7$
      0092A4 90 AE            [ 2] 3549 	jra 8$
                                   3550 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0013D2                       3551 3$:	
      0092A6 18 00            [ 1] 3552 	cp a,#TK_VAR 
      0092A8 CF 00            [ 1] 3553 	jreq 4$
      0092AA 0D 72            [ 1] 3554 	cp a,#TK_INTGR
      0092AC B2 00            [ 1] 3555 	jreq 5$
      0092AE 0D CD 83         [ 2] 3556 	cpw x,#remark 
      0092B1 D5 4F            [ 1] 3557 	jrne 30$
      0092B3 81 0A            [ 1] 3558 	ld a,#''
      0092B5 63 6F 6E         [ 4] 3559 	call putc 
      0092B8 74 65            [ 2] 3560 	ldw x,(XSAVE,sp)
      0092BA 6E 74 20         [ 2] 3561 	addw x,#2
      0092BD 6F 66 20 73      [ 2] 3562 	addw x,ptr16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092C1 74 61 63         [ 4] 3563 	call puts 
      0092C4 6B 20 66         [ 2] 3564 	jp 20$ 
      0013F3                       3565 30$:
      0092C7 72 6F            [ 1] 3566 	ld a,#SPACE 
      0092C9 6D 20 74         [ 4] 3567 	call putc 
      0092CC 6F 70 20         [ 4] 3568 	call cmd_name
      0092CF 74 6F 20         [ 4] 3569 	call prt_cmd_name
      0092D2 62 6F            [ 1] 3570 	ld a,#SPACE 
      0092D4 74 74 6F         [ 4] 3571 	call putc 
      001403                       3572 31$:
      0092D7 6D 3A            [ 2] 3573 	ldw x,(XSAVE,sp)
      0092D9 0A 00 02         [ 2] 3574 	addw x,#2
      0092DB 20 A8            [ 2] 3575 	jra 1$
                                   3576 ;; TK_VAR 
      00140A                       3577 4$:
                                   3578 ;	ld a,#SPACE 
                                   3579 ;	call putc 
      0092DB 35 10 00         [ 4] 3580 	call var_name
      0092DE 0B 81 A0         [ 4] 3581 	call putc 
      0092E0 20 F1            [ 2] 3582 	jra 31$
                                   3583 ;; TK_INTGR
      001412                       3584 5$:
                                   3585 ;	ld a,#SPACE 
                                   3586 ;	call putc
      0092E0 35 0A 00         [ 4] 3587 	call print_int 
      0092E3 0B 81            [ 2] 3588 	jra 31$
                                   3589 ;; TK_QSTR
      0092E5                       3590 6$:
      0092E5 AE 16            [ 2] 3591 	ldw x,(XSAVE,sp)
      0092E7 90 72 B0 00      [ 2] 3592 	addw x,ptr16 
      0092EB 1F A6 84         [ 4] 3593 	call prt_quote  
      0092EE 81 B0 00 17      [ 2] 3594 	subw x,ptr16  
      0092EF CC 13 B2         [ 2] 3595 	jp 1$
                                   3596 ;; TK_CHAR 
      001427                       3597 7$:
      0092EF AE 16            [ 1] 3598 	ld a,#'\ 
      0092F1 90 72 B0         [ 4] 3599 	call putc 
      0092F4 00               [ 1] 3600 	ld a,xh 
      0092F5 1F 90 CE         [ 4] 3601 	call putc 
      0092F8 00 05            [ 2] 3602 	ldw x,(XSAVE,sp)
      0092FA 90               [ 2] 3603 	incw x 
      0092FB C3 00 1F         [ 2] 3604 	jp 1$ 
      0092FE 25 0A            [ 1] 3605 8$: cp a,#TK_COLON 
      009300 3B 00            [ 1] 3606 	jrne 9$
      009302 04 4B            [ 1] 3607 	ld a,#':
      00143C                       3608 81$:
      009304 00 72 F0         [ 4] 3609 	call putc
      00143F                       3610 82$:
      009307 01 5B            [ 2] 3611 	ldw x,(XSAVE,sp)
      009309 02 54 CF         [ 2] 3612 	jp 1$ 
      001444                       3613 9$: 
      00930C 00 22            [ 1] 3614 	cp a,#TK_SHARP
      00930E A6 84            [ 1] 3615 	jrugt 10$ 
      009310 81 06            [ 1] 3616 	sub a,#TK_ARRAY 
      009311 90 5F            [ 1] 3617 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009311 CD 89            [ 1] 3618 	ld yl,a
      009313 E7 A1 85 27      [ 2] 3619 	addw y,#single_char 
      009317 0A A1            [ 1] 3620 	ld a,(y)
      009319 06 27            [ 2] 3621 	jra 81$ 
      001456                       3622 10$: 
      00931B 03 CC            [ 1] 3623 	cp a,#TK_MINUS 
      00931D 88 F5            [ 1] 3624 	jrugt 11$
      00931F A0 10            [ 1] 3625 	sub a,#TK_PLUS 
      00931F CD 91            [ 1] 3626 	clrw y 
      009321 28 97            [ 1] 3627 	ld yl,a 
      009322 72 A9 14 9F      [ 2] 3628 	addw y,#add_char 
      009322 89 CD            [ 1] 3629 	ld a,(y)
      009324 89 E7            [ 2] 3630 	jra 81$
      001468                       3631 11$:
      009326 A1 32            [ 1] 3632     cp a,#TK_MOD 
      009328 27 03            [ 1] 3633 	jrugt 12$
      00932A CC 88            [ 1] 3634 	sub a,#TK_MULT
      00932C F5 5F            [ 1] 3635 	clrw y 
      00932D 90 97            [ 1] 3636 	ld yl,a 
      00932D CD 92 3F A1      [ 2] 3637 	addw y,#mul_char
      009331 84 27            [ 1] 3638 	ld a,(y)
      009333 03 CC            [ 2] 3639 	jra 81$
      00147A                       3640 12$:
      009335 88 F5            [ 1] 3641 	sub a,#TK_GT  
      009337 48               [ 1] 3642 	sll a 
      009337 90               [ 1] 3643 	clrw x 
      009338 93               [ 1] 3644 	ld xl,a 
      009339 85 FF 81         [ 2] 3645 	addw x,#relop_str 
      00933C FE               [ 2] 3646 	ldw x,(x)
      00933C CE 00 1D         [ 4] 3647 	call puts 
      00933F C3 00            [ 2] 3648 	jra 82$
      001488                       3649 20$: 
      009341 1F 2B            [ 1] 3650 	ld a,#CR 
      009343 01 81 A0         [ 4] 3651 	call putc
      009345 7B 02            [ 1] 3652 	ld a,(WIDTH_SAV,sp) 
      009345 52 06 1F         [ 1] 3653 	ld tab_width,a 
      009348 05 FE            [ 1] 3654 	ld a,(BASE_SAV,sp) 
      00934A 1F 01 AE         [ 1] 3655 	ld base,a
      001497                       3656 	_drop VSIZE 
      00934D 7F FF            [ 2]    1     addw sp,#VSIZE 
      00934F 1F               [ 4] 3657 	ret 
                                   3658 
      009350 03 CD 90 FD 4D        3659 single_char: .byte '@','(',')',',','#'
      009355 27 31                 3660 add_char: .byte '+','-'
      009357 A1 02 27              3661 mul_char: .byte '*','/','%'
      00935A 07 A1 01 27 06 CC 88  3662 relop_str: .word gt,equal,ge,lt,le,ne 
             F5 85 1F 05 BC
      009365 3E 00                 3663 gt: .asciz ">"
      009365 85 1F                 3664 equal: .asciz "="
      009367 01 3D 00              3665 ge: .asciz ">="
      009368 3C 00                 3666 lt: .asciz "<"
      009368 CE 00 1D              3667 le: .asciz "<="
      00936B 1F 05 C3              3668 ne:  .asciz "<>"
                                   3669 
                                   3670 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3671 ;---------------------------------
                                   3672 ; BASIC: PRINT|? arg_list 
                                   3673 ; print values from argument list
                                   3674 ;----------------------------------
                           000001  3675 	COMMA=1
                           000001  3676 	VSIZE=1
      0014BF                       3677 print:
      00936E 00 1F            [ 1] 3678 push #0 ; local variable COMMA 
      0014C1                       3679 reset_comma:
      009370 2A 3C            [ 1] 3680 	clr (COMMA,sp)
      0014C3                       3681 prt_loop:
      009372 FE 13 01         [ 4] 3682 	call next_token
      009375 2A 11            [ 1] 3683 	cp a,#CMD_END 
      009377 1E 05            [ 1] 3684 	jrult print_exit ; colon or end of line 
      009379 E6 02            [ 1] 3685 	cp a,#TK_QSTR
      00937B C7 00            [ 1] 3686 	jreq 1$
      00937D 0E 72            [ 1] 3687 	cp a,#TK_CHAR 
      00937F 5F 00            [ 1] 3688 	jreq 2$ 
      009381 0D 72            [ 1] 3689 	cp a,#TK_CFUNC 
      009383 BB 00            [ 1] 3690 	jreq 3$
      009385 0D 20            [ 1] 3691 	cp a,#TK_COMMA 
      009387 E3 18            [ 1] 3692 	jreq 4$
      009388 A1 0A            [ 1] 3693 	cp a,#TK_SHARP 
      009388 1E 05            [ 1] 3694 	jreq 5$
      00938A E6 02            [ 2] 3695 	jra 7$ 
      0014E0                       3696 1$:	; print string 
      00938C CD 94 09         [ 4] 3697 	call puts
      00938F 1E 05            [ 2] 3698 	jra reset_comma
      0014E5                       3699 2$:	; print character 
      009391 E6               [ 1] 3700 	ld a,xl 
      009392 02 C7 00         [ 4] 3701 	call putc 
      009395 0E 72            [ 2] 3702 	jra reset_comma 
      0014EB                       3703 3$: ; print character function value  	
      009397 5F               [ 4] 3704 	call (x)
      009398 00               [ 1] 3705 	ld a,xl 
      009399 0D 72 BB         [ 4] 3706 	call putc
      00939C 00 0D            [ 2] 3707 	jra reset_comma 
      0014F2                       3708 4$: ; set comma state 
      00939E C3 00            [ 1] 3709 	ld a,#255 
      0093A0 1F 2A            [ 1] 3710 	ld (COMMA,sp),a  
      0093A2 0B 1F 05         [ 2] 3711 	jp prt_loop   
      0014F9                       3712 5$: ; # character must be followed by an integer   
      0093A5 FE 13 03         [ 4] 3713 	call next_token
      0093A8 2C 04            [ 1] 3714 	cp a,#TK_INTGR 
      0093AA 1E 05            [ 1] 3715 	jreq 6$
      0093AC 20 DC 75         [ 2] 3716 	jp syntax_error 
      0093AE                       3717 6$: ; set tab width
      0093AE 5B               [ 1] 3718 	ld a,xl 
      0093AF 06 81            [ 1] 3719 	and a,#15 
      0093B1 C7 00 24         [ 1] 3720 	ld tab_width,a 
      0093B1 F6 5C            [ 2] 3721 	jra reset_comma 
      00150B                       3722 7$:	
      00150B                       3723 	_unget_token
      0093B3 A4 0F 88 0D 01   [ 1]    1     mov in,in.saved
      0093B8 27 09 F6         [ 4] 3724 	call relation 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093BB CD 83            [ 1] 3725 	cp a,#TK_INTGR
      0093BD 20 5C            [ 1] 3726 	jreq 8$
      001517                       3727 	_unget_token
      0093BF 0A 01 20 F3 84   [ 1]    1     mov in,in.saved
      0093C4 81 15 24         [ 2] 3728 	jp print_exit 
      0093C5 CD 09 BC         [ 4] 3729 8$: call print_int 
      0093C5 A6 22            [ 2] 3730 	jra reset_comma 
      001524                       3731 print_exit:
      0093C7 CD 83            [ 1] 3732 	tnz (COMMA,sp)
      0093C9 20 F6            [ 1] 3733 	jrne 9$
      0093CB 27 2D            [ 1] 3734 	ld a,#CR 
      0093CD 5C A1 20         [ 4] 3735     call putc 
      00152D                       3736 9$:	_drop VSIZE 
      0093D0 25 0C            [ 2]    1     addw sp,#VSIZE 
      0093D2 CD               [ 4] 3737 	ret 
                                   3738 
      001530                       3739 print_type: 
                                   3740 
                                   3741 ;----------------------
                                   3742 ; 'save_context' and
                                   3743 ; 'rest_context' must be 
                                   3744 ; called at the same 
                                   3745 ; call stack depth 
                                   3746 ; i.e. SP must have the 
                                   3747 ; save value at  
                                   3748 ; entry point of both 
                                   3749 ; routine. 
                                   3750 ;---------------------
                           000004  3751 	CTXT_SIZE=4 ; size of saved data 
                                   3752 ;--------------------
                                   3753 ; save current BASIC
                                   3754 ; interpreter context 
                                   3755 ; on stack 
                                   3756 ;--------------------
      001530                       3757 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001530                       3758 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001530                       3759 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001530                       3760 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001530                       3761 save_context:
      0093D3 83 20 A1         [ 2] 3762 	ldw x,basicptr 
      0093D6 5C 26            [ 2] 3763 	ldw (BPTR,sp),x
      0093D8 F1 00 01         [ 1] 3764 	ld a,in 
      0093D9 6B 05            [ 1] 3765 	ld (IN,sp),a
      0093D9 CD 83 20         [ 1] 3766 	ld a,count 
      0093DC 20 EC            [ 1] 3767 	ld (CNT,sp),a  
      0093DE 88               [ 4] 3768 	ret
                                   3769 
                                   3770 ;-----------------------
                                   3771 ; restore previously saved 
                                   3772 ; BASIC interpreter context 
                                   3773 ; from stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3774 ;-------------------------
      001540                       3775 rest_context:
      0093DF A6 5C            [ 2] 3776 	ldw x,(BPTR,sp)
      0093E1 CD 83 20         [ 2] 3777 	ldw basicptr,x 
      0093E4 84 A0            [ 1] 3778 	ld a,(IN,sp)
      0093E6 07 C7 00         [ 1] 3779 	ld in,a
      0093E9 0E 72            [ 1] 3780 	ld a,(CNT,sp)
      0093EB 5F 00 0D         [ 1] 3781 	ld count,a  
      0093EE 90               [ 4] 3782 	ret
                                   3783 
                                   3784 
                                   3785 
                                   3786 ;------------------------------------------
                                   3787 ; BASIC: INPUT [string]var[,[string]var]
                                   3788 ; input value in variables 
                                   3789 ; [string] optionally can be used as prompt 
                                   3790 ;-----------------------------------------
                           000001  3791 	CX_BPTR=1
                           000003  3792 	CX_IN=3
                           000004  3793 	CX_CNT=4
                           000005  3794 	SKIP=5
                           000006  3795 	VAR_ADDR=6
                           000007  3796 	VSIZE=7
      001550                       3797 input_var:
      001550                       3798 	_vars VSIZE 
      0093EF AE 8C            [ 2]    1     sub sp,#VSIZE 
      001552                       3799 input_loop:
      0093F1 20 72            [ 1] 3800 	clr (SKIP,sp)
      0093F3 B9 00 0D         [ 4] 3801 	call next_token 
      0093F6 90 F6            [ 1] 3802 	cp a,#TK_QSTR 
      0093F8 20 DF            [ 1] 3803 	jrne 1$ 
      0093FA A6 22 CD         [ 4] 3804 	call puts 
      0093FD 83 20            [ 1] 3805 	cpl (SKIP,sp)
      0093FF 5C 81 67         [ 4] 3806 	call next_token 
      009401 A1 85            [ 1] 3807 1$: cp a,#TK_VAR  
      009401 1D 00            [ 1] 3808 	jreq 2$ 
      009403 27 9F 44         [ 2] 3809 	jp syntax_error
      009406 AB 41            [ 2] 3810 2$:	ldw (VAR_ADDR,sp),x 
      009408 81 05            [ 1] 3811 	tnz (SKIP,sp)
      009409 26 06            [ 1] 3812 	jrne 21$ 
      009409 52 05 6B         [ 4] 3813 	call var_name 
      00940C 05 C6 00         [ 4] 3814 	call putc   
      001576                       3815 21$:
      00940F 0B 6B            [ 1] 3816 	ld a,#':
      009411 01 C6 00         [ 4] 3817 	call putc 
      009414 25 6B 02         [ 4] 3818 	call save_context 
      009417 CF 00 18 FE      [ 1] 3819 	clr count  
      00941B 35 0A 00         [ 4] 3820 	call readln 
      00941E 0B 35 05         [ 2] 3821 	ldw x,#tib 
      009421 00 25 CD         [ 1] 3822 	push count
      009424 8A 3C            [ 1] 3823 	push #0 
      009426 A6 20 CD         [ 2] 3824 	addw x,(1,sp)
      009429 83               [ 2] 3825 	incw x 
      001591                       3826 	_drop 2 
      00942A 20 72            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00942C 5F 00 25 AE      [ 1] 3827 	clr in 
      009430 00 03 9F         [ 4] 3828 	call get_token
      009433 11 05            [ 1] 3829 	cp a,#TK_INTGR
      009435 2B 03            [ 1] 3830 	jreq 3$ 
      009437 CC 95 08         [ 4] 3831 	call rest_context 
      00943A CC 08 75         [ 2] 3832 	jp syntax_error
      00943A 72 D6            [ 2] 3833 3$: ldw y,(VAR_ADDR,sp) 
      00943C 00 18            [ 2] 3834 	ldw (y),x 
      00943E 5C 1F 03         [ 4] 3835 	call rest_context
      009441 72 DE 00         [ 4] 3836 	call next_token 
      009444 18 4D            [ 1] 3837 	cp a,#TK_COMMA 
      009446 2B 0A            [ 1] 3838 	jreq input_loop 
      009448 A1 02            [ 1] 3839 	cp a,#TK_COLON 
      00944A 27 4B            [ 2] 3840     jrule input_exit 
      00944C A1 03 27         [ 2] 3841 	jp syntax_error 
      0015B9                       3842 input_exit:
      0015B9                       3843 	_drop VSIZE 
      00944F 57 20            [ 2]    1     addw sp,#VSIZE 
      009451 64               [ 4] 3844 	ret 
                                   3845 
                                   3846 
                                   3847 ;---------------------
                                   3848 ; BASIC: REMARK | ' 
                                   3849 ; skip comment to end of line 
                                   3850 ;---------------------- 
      009452                       3851 remark:
      009452 A1 85 27 34 A1   [ 1] 3852 	mov in,count 
      009457 84               [ 4] 3853  	ret 
                                   3854 
                                   3855 
                                   3856 ;---------------------
                                   3857 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3858 ; read in loop 'addr'  
                                   3859 ; apply & 'mask' to value 
                                   3860 ; loop while result==0.  
                                   3861 ; 'xor_mask' is used to 
                                   3862 ; invert the wait logic.
                                   3863 ; i.e. loop while not 0.
                                   3864 ;---------------------
                           000001  3865 	XMASK=1 
                           000002  3866 	MASK=2
                           000003  3867 	ADDR=3
                           000004  3868 	VSIZE=4
      0015C2                       3869 wait: 
      0015C2                       3870 	_vars VSIZE
      009458 27 38            [ 2]    1     sub sp,#VSIZE 
      00945A A3 96            [ 1] 3871 	clr (XMASK,sp) 
      00945C 3C 26 14         [ 4] 3872 	call arg_list 
      00945F A6 27            [ 1] 3873 	cp a,#2
      009461 CD 83            [ 1] 3874 	jruge 0$
      009463 20 1E 03         [ 2] 3875 	jp syntax_error 
      009466 1C 00            [ 1] 3876 0$:	cp a,#3
      009468 02 72            [ 1] 3877 	jrult 1$
      00946A BB               [ 2] 3878 	popw x 
      00946B 00               [ 1] 3879 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00946C 18 CD            [ 1] 3880 	ld (XMASK,sp),a 
      00946E 83               [ 2] 3881 1$: popw x ; mask 
      00946F 33               [ 1] 3882 	ld a,xl 
      009470 CC 95            [ 1] 3883 	ld (MASK,sp),a 
      009472 08               [ 2] 3884 	popw x ; address 
      009473 F6               [ 1] 3885 2$:	ld a,(x)
      009473 A6 20            [ 1] 3886 	and a,(MASK,sp)
      009475 CD 83            [ 1] 3887 	xor a,(XMASK,sp)
      009477 20 CD            [ 1] 3888 	jreq 2$ 
      0015E4                       3889 	_drop VSIZE 
      009479 90 6C            [ 2]    1     addw sp,#VSIZE 
      00947B CD               [ 4] 3890 	ret 
                                   3891 
                                   3892 ;---------------------
                                   3893 ; BASIC: BSET addr,mask
                                   3894 ; set bits at 'addr' corresponding 
                                   3895 ; to those of 'mask' that are at 1.
                                   3896 ; arguments:
                                   3897 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3898 ;   mask        mask|addr
                                   3899 ; output:
                                   3900 ;	none 
                                   3901 ;--------------------------
      0015E7                       3902 bit_set:
      00947C 93 B1 A6         [ 4] 3903 	call arg_list 
      00947F 20 CD            [ 1] 3904 	cp a,#2	 
      009481 83 20            [ 1] 3905 	jreq 1$ 
      009483 CC 08 75         [ 2] 3906 	jp syntax_error
      0015F1                       3907 1$: 
      009483 1E               [ 2] 3908 	popw x ; mask 
      009484 03               [ 1] 3909 	ld a,xl 
      009485 1C               [ 2] 3910 	popw x ; addr  
      009486 00               [ 1] 3911 	or a,(x)
      009487 02               [ 1] 3912 	ld (x),a
      009488 20               [ 4] 3913 	ret 
                                   3914 
                                   3915 ;---------------------
                                   3916 ; BASIC: BRES addr,mask
                                   3917 ; reset bits at 'addr' corresponding 
                                   3918 ; to those of 'mask' that are at 1.
                                   3919 ; arguments:
                                   3920 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3921 ;   mask	    ~mask&*addr  
                                   3922 ; output:
                                   3923 ;	none 
                                   3924 ;--------------------------
      0015F7                       3925 bit_reset:
      009489 A8 10 7D         [ 4] 3926 	call arg_list 
      00948A A1 02            [ 1] 3927 	cp a,#2  
      00948A CD 94            [ 1] 3928 	jreq 1$ 
      00948C 01 CD 83         [ 2] 3929 	jp syntax_error
      001601                       3930 1$: 
      00948F 20               [ 2] 3931 	popw x ; mask 
      009490 20               [ 1] 3932 	ld a,xl 
      009491 F1               [ 1] 3933 	cpl a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009492 85               [ 2] 3934 	popw x ; addr  
      009492 CD               [ 1] 3935 	and a,(x)
      009493 8A               [ 1] 3936 	ld (x),a 
      009494 3C               [ 4] 3937 	ret 
                                   3938 
                                   3939 ;---------------------
                                   3940 ; BASIC: BTOGL addr,mask
                                   3941 ; toggle bits at 'addr' corresponding 
                                   3942 ; to those of 'mask' that are at 1.
                                   3943 ; arguments:
                                   3944 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3945 ;   mask	    mask^*addr  
                                   3946 ; output:
                                   3947 ;	none 
                                   3948 ;--------------------------
      001608                       3949 bit_toggle:
      009495 20 EC 7D         [ 4] 3950 	call arg_list 
      009497 A1 02            [ 1] 3951 	cp a,#2 
      009497 1E 03            [ 1] 3952 	jreq 1$ 
      009499 72 BB 00         [ 2] 3953 	jp syntax_error
      00949C 18               [ 2] 3954 1$: popw x ; mask 
      00949D CD               [ 1] 3955 	ld a,xl 
      00949E 93               [ 2] 3956 	popw x ; addr  
      00949F C5               [ 1] 3957 	xor a,(x)
      0094A0 72               [ 1] 3958 	ld (x),a 
      0094A1 B0               [ 4] 3959 	ret 
                                   3960 
                                   3961 
                                   3962 ;---------------------
                                   3963 ; BASIC: BTEST(addr,bit)
                                   3964 ; return bit value at 'addr' 
                                   3965 ; bit is in range {0..7}.
                                   3966 ; arguments:
                                   3967 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3968 ;   bit 	    bit position {0..7}  
                                   3969 ; output:
                                   3970 ;	none 
                                   3971 ;--------------------------
      001618                       3972 bit_test:
      0094A2 00 18 CC         [ 4] 3973 	call func_args 
      0094A5 94 32            [ 1] 3974 	cp a,#2
      0094A7 27 03            [ 1] 3975 	jreq 0$
      0094A7 A6 5C CD         [ 2] 3976 	jp syntax_error
      001622                       3977 0$:	
      0094AA 83               [ 2] 3978 	popw x 
      0094AB 20               [ 1] 3979 	ld a,xl 
      0094AC 9E CD            [ 1] 3980 	and a,#7
      0094AE 83               [ 1] 3981 	push a   
      0094AF 20 1E            [ 1] 3982 	ld a,#1 
      0094B1 03 5C            [ 1] 3983 1$: tnz (1,sp)
      0094B3 CC 94            [ 1] 3984 	jreq 2$
      0094B5 32               [ 1] 3985 	sll a 
      0094B6 A1 01            [ 1] 3986 	dec (1,sp)
      0094B8 26 0A            [ 2] 3987 	jra 1$
      001632                       3988 2$: _drop 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094BA A6 3A            [ 2]    1     addw sp,#1 
      0094BC 85               [ 2] 3989 	popw x 
      0094BC CD               [ 1] 3990 	and a,(x)
      0094BD 83 20            [ 1] 3991 	jreq 3$
      0094BF A6 01            [ 1] 3992 	ld a,#1 
      0094BF 1E               [ 1] 3993 3$:	clrw x 
      0094C0 03               [ 1] 3994 	ld xl,a 
      0094C1 CC 94            [ 1] 3995 	ld a,#TK_INTGR
      0094C3 32               [ 4] 3996 	ret
                                   3997 
                                   3998 
                                   3999 ;--------------------
                                   4000 ; BASIC: POKE addr,byte
                                   4001 ; put a byte at addr 
                                   4002 ;--------------------
      0094C4                       4003 poke:
      0094C4 A1 0A 22         [ 4] 4004 	call arg_list 
      0094C7 0E A0            [ 1] 4005 	cp a,#2
      0094C9 06 90            [ 1] 4006 	jreq 1$
      0094CB 5F 90 97         [ 2] 4007 	jp syntax_error
      001649                       4008 1$:	
      0094CE 72               [ 2] 4009 	popw x  
      0094CF A9               [ 1] 4010     ld a,xl 
      0094D0 95               [ 2] 4011 	popw x 
      0094D1 1A               [ 1] 4012 	ld (x),a 
      0094D2 90               [ 4] 4013 	ret 
                                   4014 
                                   4015 ;-----------------------
                                   4016 ; BASIC: PEEK(addr)
                                   4017 ; get the byte at addr 
                                   4018 ; input:
                                   4019 ;	none 
                                   4020 ; output:
                                   4021 ;	X 		value 
                                   4022 ;-----------------------
      00164E                       4023 peek:
      0094D3 F6 20 E6         [ 4] 4024 	call func_args
      0094D6 A1 01            [ 1] 4025 	cp a,#1 
      0094D6 A1 11            [ 1] 4026 	jreq 1$
      0094D8 22 0E A0         [ 2] 4027 	jp syntax_error
      0094DB 10               [ 2] 4028 1$: popw x 
      0094DC 90               [ 1] 4029 	ld a,(x)
      0094DD 5F               [ 1] 4030 	clrw x 
      0094DE 90               [ 1] 4031 	ld xl,a 
      0094DF 97 72            [ 1] 4032 	ld a,#TK_INTGR
      0094E1 A9               [ 4] 4033 	ret 
                                   4034 
                                   4035 ;---------------------------
                                   4036 ; BASIC IF expr : instructions
                                   4037 ; evaluate expr and if true 
                                   4038 ; execute instructions on same line. 
                                   4039 ;----------------------------
      00165F                       4040 if: 
      0094E2 95 1F 90         [ 4] 4041 	call relation 
      0094E5 F6 20            [ 1] 4042 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094E7 D4 03            [ 1] 4043 	jreq 1$ 
      0094E8 CC 08 75         [ 2] 4044 	jp syntax_error
      0094E8 A1               [ 1] 4045 1$:	clr a 
      0094E9 22               [ 2] 4046 	tnzw x 
      0094EA 22 0E            [ 1] 4047 	jrne 9$  
                                   4048 ;skip to next line
      0094EC A0 20 90 5F 90   [ 1] 4049 	mov in,count
      0094F1 97               [ 4] 4050 9$:	ret 
                                   4051 
                                   4052 ;------------------------
                                   4053 ; BASIC: FOR var=expr 
                                   4054 ; set variable to expression 
                                   4055 ; leave variable address 
                                   4056 ; on stack and set
                                   4057 ; FLOOP bit in 'flags'
                                   4058 ;-----------------
                           000001  4059 	RETL1=1 ; return address  
                           000003  4060 	FSTEP=3  ; variable increment
                           000005  4061 	LIMIT=5 ; loop limit 
                           000007  4062 	CVAR=7   ; control variable 
                           000009  4063 	INW=9   ;  in.w saved
                           00000B  4064 	BPTR=11 ; baseptr saved
                           00000A  4065 	VSIZE=10  
      001673                       4066 for: ; { -- var_addr }
      0094F2 72               [ 2] 4067 	popw x ; call return address 
      001674                       4068 	_vars VSIZE 
      0094F3 A9 95            [ 2]    1     sub sp,#VSIZE 
      0094F5 21               [ 2] 4069 	pushw x  ; RETL1 
      0094F6 90 F6            [ 1] 4070 	ld a,#TK_VAR 
      0094F8 20 C2 6B         [ 4] 4071 	call expect
      0094FA 1F 07            [ 2] 4072 	ldw (CVAR,sp),x  ; control variable 
      0094FA A0 31 48         [ 4] 4073 	call let_var 
      0094FD 5F 97 1C 95      [ 1] 4074 	bset flags,#FLOOP 
                                   4075 ; open space on stack for loop data 
      009501 24               [ 1] 4076 	clrw x 
      009502 FE CD            [ 2] 4077 	ldw (BPTR,sp),x 
      009504 83 33            [ 2] 4078 	ldw (INW,sp),x 
      009506 20 B7 67         [ 4] 4079 	call next_token 
      009508 A1 80            [ 1] 4080 	cp a,#TK_CMD 
      009508 A6 0D            [ 1] 4081 	jreq 1$
      00950A CD 83 20         [ 2] 4082 	jp syntax_error
      001694                       4083 1$:  
      00950D 7B 02 C7         [ 2] 4084 	cpw x,#to 
      009510 00 25            [ 1] 4085 	jreq to
      009512 7B 01 C7         [ 2] 4086 	jp syntax_error 
                                   4087 
                                   4088 ;-----------------------------------
                                   4089 ; BASIC: TO expr 
                                   4090 ; second part of FOR loop initilization
                                   4091 ; leave limit on stack and set 
                                   4092 ; FTO bit in 'flags'
                                   4093 ;-----------------------------------
      00169C                       4094 to: ; { var_addr -- var_addr limit step }
      009515 00 0B 5B 05 81   [ 2] 4095 	btjt flags,#FLOOP,1$
      00951A 40 28 29         [ 2] 4096 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00951D 2C 23 2B         [ 4] 4097 1$: call relation  
      009520 2D 2A            [ 1] 4098 	cp a,#TK_INTGR 
      009522 2F 25            [ 1] 4099 	jreq 2$ 
      009524 95 30 95         [ 2] 4100 	jp syntax_error
      009527 32 95            [ 2] 4101 2$: ldw (LIMIT,sp),x
                                   4102 ;	ldw x,in.w 
      009529 34 95 37         [ 4] 4103 	call next_token
      00952C 95 39            [ 1] 4104 	cp a,#TK_NONE  
      00952E 95 3C            [ 1] 4105 	jreq 4$ 
      009530 3E 00            [ 1] 4106 	cp a,#TK_CMD
      009532 3D 00            [ 1] 4107 	jrne 3$
      009534 3E 3D 00         [ 2] 4108 	cpw x,#step 
      009537 3C 00            [ 1] 4109 	jreq step
      0016C0                       4110 3$:	
      0016C0                       4111 	_unget_token   	 
      009539 3C 3D 00 3C 3E   [ 1]    1     mov in,in.saved
      0016C5                       4112 4$:	
      00953E 00 00 01         [ 2] 4113 	ldw x,#1   ; default step  
      00953F 1F 03            [ 2] 4114 	ldw (FSTEP,sp),x 
      00953F 4B 00            [ 2] 4115 	jra store_loop_addr 
                                   4116 
                                   4117 
                                   4118 ;----------------------------------
                                   4119 ; BASIC: STEP expr 
                                   4120 ; optional third par of FOR loop
                                   4121 ; initialization. 	
                                   4122 ;------------------------------------
      009541                       4123 step: ; {var limit -- var limit step}
      009541 0F 01 00 23 03   [ 2] 4124 	btjt flags,#FLOOP,1$
      009543 CC 08 75         [ 2] 4125 	jp syntax_error
      009543 CD 89 E7         [ 4] 4126 1$: call relation
      009546 A1 02            [ 1] 4127 	cp a,#TK_INTGR
      009548 25 5A            [ 1] 4128 	jreq 2$
      00954A A1 02 27         [ 2] 4129 	jp syntax_error
      00954D 12 A1            [ 2] 4130 2$:	ldw (FSTEP,sp),x ; step
                                   4131 ; leave loop back entry point on cstack 
                                   4132 ; cstack is 1 call deep from interpreter
      0016E0                       4133 store_loop_addr:
      00954F 03 27 13         [ 2] 4134 	ldw x,basicptr  
      009552 A1 82            [ 2] 4135 	ldw (BPTR,sp),x 
      009554 27 15 A1         [ 2] 4136 	ldw x,in.w 
      009557 09 27            [ 2] 4137 	ldw (INW,sp),x   
      009559 18 A1 0A 27      [ 1] 4138 	bres flags,#FLOOP 
      00955D 1B 20 2B 20      [ 1] 4139 	inc loop_depth  
      009560 81               [ 4] 4140 	ret 
                                   4141 
                                   4142 ;--------------------------------
                                   4143 ; BASIC: NEXT var 
                                   4144 ; FOR loop control 
                                   4145 ; increment variable with step 
                                   4146 ; and compare with limit 
                                   4147 ; loop if threshold not crossed.
                                   4148 ; else stack. 
                                   4149 ; and decrement 'loop_depth' 
                                   4150 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0016F3                       4151 next: ; {var limit step retl1 -- [var limit step ] }
      009560 CD 83 33 20      [ 1] 4152 	tnz loop_depth 
      009564 DC 03            [ 1] 4153 	jrne 1$ 
      009565 CC 08 75         [ 2] 4154 	jp syntax_error 
      0016FC                       4155 1$: 
      009565 9F CD            [ 1] 4156 	ld a,#TK_VAR 
      009567 83 20 20         [ 4] 4157 	call expect
                                   4158 ; check for good variable after NEXT 	 
      00956A D6 07            [ 2] 4159 	cpw x,(CVAR,sp)
      00956B 27 03            [ 1] 4160 	jreq 2$  
      00956B FD 9F CD         [ 2] 4161 	jp syntax_error ; not the good one 
      001708                       4162 2$: ; increment variable 
      00956E 83               [ 2] 4163 	ldw x,(x)  ; get var value 
      00956F 20 20 CF         [ 2] 4164 	addw x,(FSTEP,sp) ; var+step 
      009572 16 07            [ 2] 4165 	ldw y,(CVAR,sp)
      009572 A6 FF            [ 2] 4166 	ldw (y),x ; save var new value 
                                   4167 ; check sign of STEP  
      009574 6B 01            [ 1] 4168 	ld a,#0x80
      009576 CC 95            [ 1] 4169 	bcp a,(FSTEP,sp)
      009578 43 06            [ 1] 4170 	jrpl 4$
                                   4171 ;negative step 
      009579 13 05            [ 2] 4172 	cpw x,(LIMIT,sp)
      009579 CD 89            [ 1] 4173 	jrslt loop_done
      00957B E7 A1            [ 2] 4174 	jra loop_back 
      00171C                       4175 4$: ; positive step
      00957D 84 27            [ 2] 4176 	cpw x,(LIMIT,sp)
      00957F 03 CC            [ 1] 4177 	jrsgt loop_done
      001720                       4178 loop_back:
      009581 88 F5            [ 2] 4179 	ldw x,(BPTR,sp)
      009583 CF 00 04         [ 2] 4180 	ldw basicptr,x 
      009583 9F A4 0F C7 00   [ 2] 4181 	btjf flags,#FRUN,1$ 
      009588 25 20            [ 1] 4182 	ld a,(2,x)
      00958A B6 00 03         [ 1] 4183 	ld count,a
      00958B 1E 09            [ 2] 4184 1$:	ldw x,(INW,sp)
      00958B 55 00 03         [ 2] 4185 	ldw in.w,x 
      00958E 00               [ 4] 4186 	ret 
      001735                       4187 loop_done:
                                   4188 	; remove loop data from stack  
      00958F 02               [ 2] 4189 	popw x
      001736                       4190 	_drop VSIZE 
      009590 CD 92            [ 2]    1     addw sp,#VSIZE 
      009592 3F A1 84 27      [ 1] 4191 	dec loop_depth 
                                   4192 ;	pushw x 
                                   4193 ;	ret 
      009596 08               [ 2] 4194 	jp (x)
                                   4195 
                                   4196 ;----------------------------
                                   4197 ; called by goto/gosub
                                   4198 ; to get target line number 
                                   4199 ;---------------------------
      00173D                       4200 get_target_line:
      009597 55 00 03         [ 4] 4201 	call relation 
      00959A 00 02            [ 1] 4202 	cp a,#TK_INTGR
      00959C CC 95            [ 1] 4203 	jreq 1$
      00959E A4 CD 8A         [ 2] 4204 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095A1 3C 20 9D         [ 4] 4205 1$:	call search_lineno  
      0095A4 5D               [ 2] 4206 	tnzw x 
      0095A4 0D 01            [ 1] 4207 	jrne 2$ 
      0095A6 26 05            [ 1] 4208 	ld a,#ERR_NO_LINE 
      0095A8 A6 0D CD         [ 2] 4209 	jp tb_error 
      0095AB 83               [ 4] 4210 2$:	ret 
                                   4211 
                                   4212 ;------------------------
                                   4213 ; BASIC: GOTO line# 
                                   4214 ; jump to line# 
                                   4215 ; here cstack is 2 call deep from interpreter 
                                   4216 ;------------------------
      001753                       4217 goto:
      0095AC 20 5B 01 81 06   [ 2] 4218 	btjt flags,#FRUN,0$ 
      0095B0 A6 06            [ 1] 4219 	ld a,#ERR_RUN_ONLY
      0095B0 CC 08 77         [ 2] 4220 	jp tb_error 
      0095B0 CE               [ 4] 4221 	ret 
      0095B1 00 05 1F         [ 4] 4222 0$:	call get_target_line
      001761                       4223 jp_to_target:
      0095B4 03 C6 00         [ 2] 4224 	ldw basicptr,x 
      0095B7 02 6B            [ 1] 4225 	ld a,(2,x)
      0095B9 05 C6 00         [ 1] 4226 	ld count,a 
      0095BC 04 6B 06 81      [ 1] 4227 	mov in,#3 
      0095C0 81               [ 4] 4228 	ret 
                                   4229 
                                   4230 
                                   4231 ;--------------------
                                   4232 ; BASIC: GOSUB line#
                                   4233 ; basic subroutine call
                                   4234 ; actual line# and basicptr 
                                   4235 ; are saved on cstack
                                   4236 ; here cstack is 2 call deep from interpreter 
                                   4237 ;--------------------
                           000003  4238 	RET_ADDR=3
                           000005  4239 	RET_INW=5
                           000004  4240 	VSIZE=4  
      00176E                       4241 gosub:
      0095C0 1E 03 CF 00 05   [ 2] 4242 	btjt flags,#FRUN,0$ 
      0095C5 7B 05            [ 1] 4243 	ld a,#ERR_RUN_ONLY
      0095C7 C7 00 02         [ 2] 4244 	jp tb_error 
      0095CA 7B               [ 4] 4245 	ret 
      0095CB 06               [ 2] 4246 0$:	popw x 
      00177A                       4247 	_vars VSIZE  
      0095CC C7 00            [ 2]    1     sub sp,#VSIZE 
      0095CE 04               [ 2] 4248 	pushw x 
      0095CF 81 00 04         [ 2] 4249 	ldw x,basicptr
      0095D0 1F 03            [ 2] 4250 	ldw (RET_ADDR,sp),x 
      0095D0 52 07 3D         [ 4] 4251 	call get_target_line  
      0095D2 89               [ 2] 4252 	pushw x 
      0095D2 0F 05 CD         [ 2] 4253 	ldw x,in.w 
      0095D5 89 E7            [ 2] 4254 	ldw (RET_INW+2,sp),x
      0095D7 A1               [ 2] 4255 	popw x 
      0095D8 02 26            [ 2] 4256 	jra jp_to_target
                                   4257 
                                   4258 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4259 ; BASIC: RETURN 
                                   4260 ; exit from a subroutine 
                                   4261 ; 
                                   4262 ;------------------------
      00178E                       4263 return:
      0095DA 08 CD 83 33 03   [ 2] 4264 	btjt flags,#FRUN,0$ 
      0095DF 05 CD            [ 1] 4265 	ld a,#ERR_RUN_ONLY
      0095E1 89 E7 A1         [ 2] 4266 	jp tb_error 
      001798                       4267 0$:	
      0095E4 85 27            [ 2] 4268 	ldw x,(RET_ADDR,sp) 
      0095E6 03 CC 88         [ 2] 4269 	ldw basicptr,x
      0095E9 F5 1F            [ 1] 4270 	ld a,(2,x)
      0095EB 06 0D 05         [ 1] 4271 	ld count,a  
      0095EE 26 06            [ 2] 4272 	ldw x,(RET_INW,sp)
      0095F0 CD 94 01         [ 2] 4273 	ldw in.w,x 
      0095F3 CD               [ 2] 4274 	popw x 
      0017A8                       4275 	_drop VSIZE 
      0095F4 83 20            [ 2]    1     addw sp,#VSIZE 
      0095F6 89               [ 2] 4276 	pushw x
      0095F6 A6               [ 4] 4277 	ret  
                                   4278 
                                   4279 
                                   4280 ;----------------------------------
                                   4281 ; BASIC: RUN
                                   4282 ; run BASIC program in RAM
                                   4283 ;----------------------------------- 
      0017AC                       4284 run: 
      0095F7 3A CD 83 20 CD   [ 2] 4285 	btjf flags,#FRUN,0$  
      0095FC 95               [ 1] 4286 	clr a 
      0095FD B0               [ 4] 4287 	ret
      0017B3                       4288 0$: 
      0095FE 72 5F 00 04 CD   [ 2] 4289 	btjf flags,#FBREAK,1$
      0017B8                       4290 	_drop 2 
      009603 8B 47            [ 2]    1     addw sp,#2 
      009605 AE 16 90         [ 4] 4291 	call rest_context
      0017BD                       4292 	_drop CTXT_SIZE 
      009608 3B 00            [ 2]    1     addw sp,#CTXT_SIZE 
      00960A 04 4B 00 72      [ 1] 4293 	bres flags,#FBREAK 
      00960E FB 01 5C 5B      [ 1] 4294 	bset flags,#FRUN 
      009612 02 72 5F         [ 2] 4295 	jp interpreter 
      009615 00 02 CD         [ 2] 4296 1$:	ldw x,txtbgn
      009618 8C FC A1         [ 2] 4297 	cpw x,txtend 
      00961B 84 27            [ 1] 4298 	jrmi run_it 
      00961D 06 CD 95         [ 2] 4299 	ldw x,#err_no_prog
      009620 C0 CC 88         [ 4] 4300 	call puts 
      009623 F5 16 06 90 FF   [ 1] 4301 	mov in,count
      009628 CD               [ 4] 4302 	ret 
      0017DE                       4303 run_it:	 
      009629 95 C0 CD         [ 4] 4304     call ubound 
      0017E1                       4305 	_drop 2 ; drop return address 
      00962C 89 E7            [ 2]    1     addw sp,#2 
                                   4306 ; clear data pointer 
      00962E A1               [ 1] 4307 	clrw x 
      00962F 09 27 A0         [ 2] 4308 	ldw data_ptr,x 
      009632 A1 01 23 03      [ 1] 4309 	clr data_ofs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009636 CC 88 F5 09      [ 1] 4310 	clr data_len 
                                   4311 ; initialize BASIC pointer 
      009639 CE 00 1C         [ 2] 4312 	ldw x,txtbgn 
      009639 5B 07 81         [ 2] 4313 	ldw basicptr,x 
      00963C E6 02            [ 1] 4314 	ld a,(2,x)
      00963C 55 00 04         [ 1] 4315 	ld count,a
      00963F 00 02 81 01      [ 1] 4316 	mov in,#3	
      009642 72 10 00 23      [ 1] 4317 	bset flags,#FRUN 
      009642 52 04 0F         [ 2] 4318 	jp interpreter 
                                   4319 
                                   4320 
                                   4321 ;----------------------
                                   4322 ; BASIC: END
                                   4323 ; end running program
                                   4324 ;---------------------- 
      001805                       4325 cmd_end: 
                                   4326 ; clean stack 
      009645 01 CD 90         [ 2] 4327 	ldw x,#STACK_EMPTY
      009648 FD               [ 1] 4328 	ldw sp,x 
      009649 A1 02 24         [ 2] 4329 	jp warm_start
                                   4330 
                                   4331 
                                   4332 ;-----------------------
                                   4333 ; BASIC: TONE expr1,expr2
                                   4334 ; used TIMER2 channel 1
                                   4335 ; to produce a tone 
                                   4336 ; arguments:
                                   4337 ;    expr1   frequency 
                                   4338 ;    expr2   duration msec.
                                   4339 ;---------------------------
      00180C                       4340 tone:
      00964C 03 CC 88         [ 4] 4341 	call arg_list 
      00964F F5 A1            [ 1] 4342 	cp a,#2 
      009651 03 25            [ 1] 4343 	jreq 1$
      009653 04 85 9F         [ 2] 4344 	jp syntax_error 
      001816                       4345 1$: 
      009656 6B               [ 2] 4346 	popw x ; duration
      009657 01 85            [ 2] 4347 	popw y ; frequency 
      001819                       4348 beep:  
      009659 9F               [ 2] 4349 	pushw x 
      00965A 6B 02 85         [ 2] 4350 	ldw x,#TIM2_CLK_FREQ
      00965D F6               [ 2] 4351 	divw x,y 
                                   4352 ; round to nearest integer 
      00965E 14 02 18 01      [ 2] 4353 	cpw y,#TIM2_CLK_FREQ/2
      009662 27 F9            [ 1] 4354 	jrmi 2$
      009664 5B               [ 2] 4355 	incw x 
      001825                       4356 2$:	 
      009665 04               [ 1] 4357 	ld a,xh 
      009666 81 53 0D         [ 1] 4358 	ld TIM2_ARRH,a 
      009667 9F               [ 1] 4359 	ld a,xl 
      009667 CD 90 FD         [ 1] 4360 	ld TIM2_ARRL,a 
                                   4361 ; 50% duty cycle 
      00966A A1               [ 1] 4362 	ccf 
      00966B 02               [ 2] 4363 	rrcw x 
      00966C 27               [ 1] 4364 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00966D 03 CC 88         [ 1] 4365 	ld TIM2_CCR1H,a 
      009670 F5               [ 1] 4366 	ld a,xl
      009671 C7 53 10         [ 1] 4367 	ld TIM2_CCR1L,a
      009671 85 9F 85 FA      [ 1] 4368 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009675 F7 81 53 00      [ 1] 4369 	bset TIM2_CR1,#TIM2_CR1_CEN
      009677 72 10 53 04      [ 1] 4370 	bset TIM2_EGR,#TIM2_EGR_UG
      009677 CD               [ 2] 4371 	popw x 
      009678 90 FD A1         [ 4] 4372 	call pause02
      00967B 02 27 03 CC      [ 1] 4373 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00967F 88 F5 53 00      [ 1] 4374 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009681 81               [ 4] 4375 	ret 
                                   4376 
                                   4377 ;-------------------------------
                                   4378 ; BASIC: ADCON 0|1 [,divisor]  
                                   4379 ; disable/enanble ADC 
                                   4380 ;-------------------------------
                           000003  4381 	ONOFF=3 
                           000001  4382 	DIVSOR=1
                           000004  4383 	VSIZE=4 
      001850                       4384 power_adc:
      009681 85 9F 43         [ 4] 4385 	call arg_list 
      009684 85 F4            [ 1] 4386 	cp a,#2	
      009686 F7 81            [ 1] 4387 	jreq 1$
      009688 A1 01            [ 1] 4388 	cp a,#1 
      009688 CD 90            [ 1] 4389 	jreq 0$ 
      00968A FD A1 02         [ 2] 4390 	jp syntax_error 
      00968D 27 03 CC         [ 2] 4391 0$: ldw x,#0
      009690 88               [ 2] 4392 	pushw x  ; divisor 
      009691 F5 85            [ 2] 4393 1$: ldw x,(ONOFF,sp)
      009693 9F               [ 2] 4394 	tnzw x 
      009694 85 F8            [ 1] 4395 	jreq 2$ 
      009696 F7 81            [ 2] 4396 	ldw x,(DIVSOR,sp) ; divisor 
      009698 9F               [ 1] 4397 	ld a,xl
      009698 CD 90            [ 1] 4398 	and a,#7
      00969A F8               [ 1] 4399 	swap a 
      00969B A1 02 27         [ 1] 4400 	ld ADC_CR1,a
      00969E 03 CC 88 F5      [ 1] 4401 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096A2 72 10 54 01      [ 1] 4402 	bset ADC_CR1,#ADC_CR1_ADON 
      001878                       4403 	_usec_dly 7 
      0096A2 85 9F A4         [ 2]    1     ldw x,#(16*7-2)/4
      0096A5 07               [ 2]    2     decw x
      0096A6 88               [ 1]    3     nop 
      0096A7 A6 01            [ 1]    4     jrne .-4
      0096A9 0D 01            [ 2] 4404 	jra 3$
      0096AB 27 05 48 0A      [ 1] 4405 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096AF 01 20 F7 5B      [ 1] 4406 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001889                       4407 3$:	_drop VSIZE 
      0096B3 01 85            [ 2]    1     addw sp,#VSIZE 
      0096B5 F4               [ 4] 4408 	ret
                                   4409 
                                   4410 ;-----------------------------
                                   4411 ; BASIC: ADCREAD (channel)
                                   4412 ; read adc channel {0..5}
                                   4413 ; output:
                                   4414 ;   A 		TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4415 ;   X 		value 
                                   4416 ;-----------------------------
      00188C                       4417 analog_read:
      0096B6 27 02 A6         [ 4] 4418 	call func_args 
      0096B9 01 5F            [ 1] 4419 	cp a,#1 
      0096BB 97 A6            [ 1] 4420 	jreq 1$
      0096BD 84 81 75         [ 2] 4421 	jp syntax_error
      0096BF 85               [ 2] 4422 1$: popw x 
      0096BF CD 90 FD         [ 2] 4423 	cpw x,#5 
      0096C2 A1 02            [ 2] 4424 	jrule 2$
      0096C4 27 03            [ 1] 4425 	ld a,#ERR_BAD_VALUE
      0096C6 CC 88 F5         [ 2] 4426 	jp tb_error 
      0096C9 9F               [ 1] 4427 2$: ld a,xl
      0096C9 85 9F 85         [ 1] 4428 	ld acc8,a 
      0096CC F7 81            [ 1] 4429 	ld a,#5
      0096CE C0 00 0D         [ 1] 4430 	sub a,acc8 
      0096CE CD 90 F8         [ 1] 4431 	ld ADC_CSR,a
      0096D1 A1 01 27 03      [ 1] 4432 	bset ADC_CR2,#ADC_CR2_ALIGN
      0096D5 CC 88 F5 85      [ 1] 4433 	bset ADC_CR1,#ADC_CR1_ADON
      0096D9 F6 5F 97 A6 84   [ 2] 4434 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0096DE 81 54 04         [ 2] 4435 	ldw x,ADC_DRH
      0096DF A6 84            [ 1] 4436 	ld a,#TK_INTGR
      0096DF CD               [ 4] 4437 	ret 
                                   4438 
                                   4439 ;-----------------------
                                   4440 ; BASIC: DREAD(pin)
                                   4441 ; Arduino pins 
                                   4442 ; read state of a digital pin 
                                   4443 ; pin# {0..15}
                                   4444 ; output:
                                   4445 ;    A 		TK_INTGR
                                   4446 ;    X      0|1 
                                   4447 ;-------------------------
                           000001  4448 	PINNO=1
                           000001  4449 	VSIZE=1
      0018C0                       4450 digital_read:
      0018C0                       4451 	_vars VSIZE 
      0096E0 92 3F            [ 2]    1     sub sp,#VSIZE 
      0096E2 A1 84 27         [ 4] 4452 	call func_args
      0096E5 03 CC            [ 1] 4453 	cp a,#1
      0096E7 88 F5            [ 1] 4454 	jreq 1$
      0096E9 4F 5D 26         [ 2] 4455 	jp syntax_error
      0096EC 05               [ 2] 4456 1$: popw x 
      0096ED 55 00 04         [ 2] 4457 	cpw x,#15 
      0096F0 00 02            [ 2] 4458 	jrule 2$
      0096F2 81 0A            [ 1] 4459 	ld a,#ERR_BAD_VALUE
      0096F3 CC 08 77         [ 2] 4460 	jp tb_error 
      0096F3 85 52 0A         [ 4] 4461 2$:	call select_pin 
      0096F6 89 A6            [ 1] 4462 	ld (PINNO,sp),a
      0096F8 85 CD            [ 1] 4463 	ld a,(GPIO_IDR,x)
      0096FA 90 EB            [ 1] 4464 	tnz (PINNO,sp)
      0096FC 1F 07            [ 1] 4465 	jreq 8$
      0096FE CD               [ 1] 4466 3$: srl a 
      0096FF 93 22            [ 1] 4467 	dec (PINNO,sp)
      009701 72 14            [ 1] 4468 	jrne 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009703 00 24            [ 1] 4469 8$: and a,#1 
      009705 5F               [ 1] 4470 	clrw x 
      009706 1F               [ 1] 4471 	ld xl,a 
      009707 0B 1F            [ 1] 4472 	ld a,#TK_INTGR
      0018ED                       4473 	_drop VSIZE
      009709 09 CD            [ 2]    1     addw sp,#VSIZE 
      00970B 89               [ 4] 4474 	ret
                                   4475 
                                   4476 ;-----------------------
                                   4477 ; BASIC: DWRITE pin,0|1
                                   4478 ; Arduino pins 
                                   4479 ; write to a digital pin 
                                   4480 ; pin# {0..15}
                                   4481 ; output:
                                   4482 ;    A 		TK_INTGR
                                   4483 ;    X      0|1 
                                   4484 ;-------------------------
                           000001  4485 	PINNO=1
                           000002  4486 	PINVAL=2
                           000002  4487 	VSIZE=2
      0018F0                       4488 digital_write:
      0018F0                       4489 	_vars VSIZE 
      00970C E7 A1            [ 2]    1     sub sp,#VSIZE 
      00970E 80 27 03         [ 4] 4490 	call arg_list  
      009711 CC 88            [ 1] 4491 	cp a,#2 
      009713 F5 03            [ 1] 4492 	jreq 1$
      009714 CC 08 75         [ 2] 4493 	jp syntax_error
      009714 A3               [ 2] 4494 1$: popw x 
      009715 97               [ 1] 4495 	ld a,xl 
      009716 1C 27            [ 1] 4496 	ld (PINVAL,sp),a
      009718 03               [ 2] 4497 	popw x 
      009719 CC 88 F5         [ 2] 4498 	cpw x,#15 
      00971C 23 05            [ 2] 4499 	jrule 2$
      00971C 72 04            [ 1] 4500 	ld a,#ERR_BAD_VALUE
      00971E 00 24 03         [ 2] 4501 	jp tb_error 
      009721 CC 88 F5         [ 4] 4502 2$:	call select_pin 
      009724 CD 92            [ 1] 4503 	ld (PINNO,sp),a 
      009726 3F A1            [ 1] 4504 	ld a,#1
      009728 84 27            [ 1] 4505 	tnz (PINNO,sp)
      00972A 03 CC            [ 1] 4506 	jreq 4$
      00972C 88               [ 1] 4507 3$: sll a
      00972D F5 1F            [ 1] 4508 	dec (PINNO,sp)
      00972F 05 CD            [ 1] 4509 	jrne 3$
      009731 89 E7            [ 1] 4510 4$: tnz (PINVAL,sp)
      009733 A1 00            [ 1] 4511 	jrne 5$
      009735 27               [ 1] 4512 	cpl a 
      009736 0E A1            [ 1] 4513 	and a,(GPIO_ODR,x)
      009738 80 26            [ 2] 4514 	jra 8$
      00973A 05 A3            [ 1] 4515 5$: or a,(GPIO_ODR,x)
      00973C 97 4C            [ 1] 4516 8$: ld (GPIO_ODR,x),a 
      001928                       4517 	_drop VSIZE 
      00973E 27 0C            [ 2]    1     addw sp,#VSIZE 
      009740 81               [ 4] 4518 	ret
                                   4519 
                                   4520 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4521 ;-----------------------
                                   4522 ; BASIC: STOP
                                   4523 ; stop progam execution  
                                   4524 ; without resetting pointers 
                                   4525 ; the program is resumed
                                   4526 ; with RUN 
                                   4527 ;-------------------------
      00192B                       4528 stop:
      009740 55 00 03 00 02   [ 2] 4529 	btjt flags,#FRUN,2$
      009745 4F               [ 1] 4530 	clr a
      009745 AE               [ 4] 4531 	ret 
      001932                       4532 2$:	 
                                   4533 ; create space on cstack to save context 
      009746 00 01 1F         [ 2] 4534 	ldw x,#break_point 
      009749 03 20 14         [ 4] 4535 	call puts 
      00974C                       4536 	_drop 2 ;drop return address 
      00974C 72 04            [ 2]    1     addw sp,#2 
      00193A                       4537 	_vars CTXT_SIZE ; context size 
      00974E 00 24            [ 2]    1     sub sp,#CTXT_SIZE 
      009750 03 CC 88         [ 4] 4538 	call save_context 
      009753 F5 CD 92         [ 2] 4539 	ldw x,#tib 
      009756 3F A1 84         [ 2] 4540 	ldw basicptr,x
      009759 27               [ 1] 4541 	clr (x)
      00975A 03 CC 88 F5      [ 1] 4542 	clr count  
      00975E 1F               [ 1] 4543 	clrw x 
      00975F 03 00 00         [ 2] 4544 	ldw in.w,x
      009760 72 11 00 23      [ 1] 4545 	bres flags,#FRUN 
      009760 CE 00 05 1F      [ 1] 4546 	bset flags,#FBREAK
      009764 0B CE 00         [ 2] 4547 	jp interpreter 
      009767 01 1F 09 72 15 00 24  4548 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 5C 00 21 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4549 
                                   4550 ;-----------------------
                                   4551 ; BASIC: NEW
                                   4552 ; from command line only 
                                   4553 ; free program memory
                                   4554 ; and clear variables 
                                   4555 ;------------------------
      009773                       4556 new: 
      009773 72 5D 00 21 26   [ 2] 4557 	btjf flags,#FRUN,0$ 
      009778 03               [ 4] 4558 	ret 
      00197D                       4559 0$:	
      009779 CC 88 F5         [ 4] 4560 	call clear_basic 
      00977C 81               [ 4] 4561 	ret 
                                   4562 	 
                                   4563 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4564 ;  file system routines
                                   4565 ;  MCU flash memory from
                                   4566 ;  0x10000-0x27fff is 
                                   4567 ;  used to store BASIC 
                                   4568 ;  program files. 
                                   4569 ;  use 128 bytes sectors
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4570 ;  because this is the MCU 
                                   4571 ;  row size.
                                   4572 ;  file entry aligned to row
                                   4573 ;  	name  variable length
                                   4574 ;  	size  2 bytes  
                                   4575 ; 	data  variable length 
                                   4576 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4577 
                                   4578 ;---------------------------
                                   4579 ; fill pad with zeros 
                                   4580 ;--------------------------
      001981                       4581 zero_pad:
      00977C A6 85 CD         [ 2] 4582 	ldw x,#pad 
      00977F 90 EB            [ 1] 4583 	ld a,#PAD_SIZE 
      009781 13               [ 1] 4584 1$:	clr (x)
      009782 07               [ 2] 4585 	incw x 
      009783 27               [ 1] 4586 	dec a 
      009784 03 CC            [ 1] 4587 	jrne 1$
      009786 88               [ 4] 4588 	ret 
                                   4589 
                                   4590 ;--------------------------
                                   4591 ; align farptr to BLOCK_SIZE 
                                   4592 ;---------------------------
      00198C                       4593 row_align:
      009787 F5 7F            [ 1] 4594 	ld a,#0x7f 
      009788 C4 00 18         [ 1] 4595 	and a,farptr+2 
      009788 FE 72            [ 1] 4596 	jreq 1$ 
      00978A FB 03 16         [ 2] 4597 	ldw x,farptr+1 
      00978D 07 90 FF         [ 2] 4598 	addw x,#BLOCK_SIZE 
      009790 A6 80            [ 1] 4599 	jrnc 0$
      009792 15 03 2A 06      [ 1] 4600 	inc farptr 
      009796 13               [ 1] 4601 0$: ld a,xl 
      009797 05 2F            [ 1] 4602 	and a,#0x80
      009799 1B               [ 1] 4603 	ld xl,a
      00979A 20 04 17         [ 2] 4604 	ldw farptr+1,x  	
      00979C 81               [ 4] 4605 1$:	ret
                                   4606 
                                   4607 ;--------------------
                                   4608 ; input:
                                   4609 ;   X     increment 
                                   4610 ; output:
                                   4611 ;   farptr  incremented 
                                   4612 ;---------------------
      0019A7                       4613 incr_farptr:
      00979C 13 05 2C 15      [ 2] 4614 	addw x,farptr+1 
      0097A0 24 04            [ 1] 4615 	jrnc 1$
      0097A0 1E 0B CF 00      [ 1] 4616 	inc farptr 
      0097A4 05 72 01         [ 2] 4617 1$:	ldw farptr+1,x  
      0097A7 00               [ 4] 4618 	ret 
                                   4619 
                                   4620 ;------------------------------
                                   4621 ; extended flash memory used as FLASH_DRIVE 
                                   4622 ; seek end of used flash drive   
                                   4623 ; starting at 0x10000 address.
                                   4624 ; 4 consecutives 0 bytes signal free space. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4625 ; input:
                                   4626 ;	none
                                   4627 ; output:
                                   4628 ;   ffree     free_addr| 0 if memory full.
                                   4629 ;------------------------------
      0019B5                       4630 seek_fdrive:
                                   4631 ; start scan at 0x10000 address 
      0097A8 24 05            [ 1] 4632 	ld a,#1
      0097AA E6 02 C7         [ 1] 4633 	ld farptr,a 
      0097AD 00               [ 1] 4634 	clrw x 
      0097AE 04 1E 09         [ 2] 4635 	ldw farptr+1,x 
      0019BE                       4636 1$:
      0097B1 CF 00 01         [ 2] 4637 	ldw x,#3  
      0097B4 81 AF 00 16      [ 5] 4638 2$:	ldf a,([farptr],x) 
      0097B5 26 05            [ 1] 4639 	jrne 3$
      0097B5 85               [ 2] 4640 	decw x
      0097B6 5B 0A            [ 1] 4641 	jrpl 2$
      0097B8 72 5A            [ 2] 4642 	jra 4$ 
      0097BA 00 21 FC         [ 2] 4643 3$:	ldw x,#BLOCK_SIZE 
      0097BD CD 19 A7         [ 4] 4644 	call incr_farptr
      0097BD CD 92 3F         [ 2] 4645 	ldw x,#0x280  
      0097C0 A1 84 27         [ 2] 4646 	cpw x,farptr
      0097C3 03 CC            [ 1] 4647 	jrmi 1$
      0019DA                       4648 4$: ; copy farptr to ffree	 
      0097C5 88 F5 CD         [ 2] 4649 	ldw x,farptr 
      0097C8 84 80 5D         [ 1] 4650 	ld a,farptr+2 
      0097CB 26 05 A6         [ 2] 4651 	ldw ffree,x 
      0097CE 05 CC 88         [ 1] 4652 	ld ffree+2,a  
      0097D1 F7               [ 4] 4653 	ret 
                                   4654 
                                   4655 ;-----------------------
                                   4656 ; return amount of free 
                                   4657 ; space on flash drive
                                   4658 ; input:
                                   4659 ;   none
                                   4660 ; output:
                                   4661 ;   acc24   free space 
                                   4662 ;-----------------------
      0019E7                       4663 disk_free:
      0097D2 81 80 00         [ 2] 4664 	ldw x,#0x8000
      0097D3 72 B0 00 1A      [ 2] 4665 	subw x,ffree+1
      0097D3 72 00            [ 1] 4666 	ld a,#2
      0097D5 00 24 06         [ 1] 4667 	sbc a,ffree 
      0097D8 A6 06 CC         [ 1] 4668 	ld acc24,a 
      0097DB 88 F7 81         [ 2] 4669 	ldw acc16,x 
      0097DE CD               [ 4] 4670 	ret 
                                   4671 
                                   4672 ;-----------------------
                                   4673 ; compare file name 
                                   4674 ; with name pointed by Y  
                                   4675 ; input:
                                   4676 ;   farptr   file name 
                                   4677 ;   Y        target name 
                                   4678 ; output:
                                   4679 ;   farptr 	 at file_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4680 ;   X 		 farptr[x] point at size field  
                                   4681 ;   Carry    0|1 no match|match  
                                   4682 ;----------------------
      0019FA                       4683 cmp_name:
      0097DF 97               [ 1] 4684 	clrw x
      0097E0 BD AF 00 16      [ 5] 4685 1$:	ldf a,([farptr],x)
      0097E1 90 F1            [ 1] 4686 	cp a,(y)
      0097E1 CF 00            [ 1] 4687 	jrne 4$
      0097E3 05               [ 1] 4688 	tnz a 
      0097E4 E6 02            [ 1] 4689 	jreq 9$ 
      0097E6 C7               [ 2] 4690     incw x 
      0097E7 00 04            [ 2] 4691 	incw y 
      0097E9 35 03            [ 2] 4692 	jra 1$
      001A0B                       4693 4$: ;no match 
      0097EB 00               [ 1] 4694 	tnz a 
      0097EC 02 81            [ 1] 4695 	jreq 5$
      0097EE 5C               [ 2] 4696 	incw x 
      0097EE 72 00 00 24      [ 5] 4697 	ldf a,([farptr],x)
      0097F2 06 A6            [ 2] 4698 	jra 4$  
      0097F4 06               [ 2] 4699 5$:	incw x ; farptr[x] point at 'size' field 
      0097F5 CC               [ 1] 4700 	rcf 
      0097F6 88               [ 4] 4701 	ret
      001A18                       4702 9$: ; match  
      0097F7 F7               [ 2] 4703 	incw x  ; farptr[x] at 'size' field 
      0097F8 81               [ 1] 4704 	scf 
      0097F9 85               [ 4] 4705 	ret 
                                   4706 
                                   4707 ;-----------------------
                                   4708 ; search file in 
                                   4709 ; flash memory 
                                   4710 ; input:
                                   4711 ;   Y       file name  
                                   4712 ; output:
                                   4713 ;   farptr  addr at name|0
                                   4714 ;   X       offset to size field
                                   4715 ;-----------------------
                           000001  4716 	FSIZE=1
                           000003  4717 	YSAVE=3
                           000004  4718 	VSIZE=4 
      001A1B                       4719 search_file: 
      001A1B                       4720 	_vars VSIZE
      0097FA 52 04            [ 2]    1     sub sp,#VSIZE 
      0097FC 89 CE            [ 2] 4721 	ldw (YSAVE,sp),y  
      0097FE 00               [ 1] 4722 	clrw x 
      0097FF 05 1F 03         [ 2] 4723 	ldw farptr+1,x 
      009802 CD 97 BD 89      [ 1] 4724 	mov farptr,#1
      001A27                       4725 1$:	
                                   4726 ; check if farptr is after any file 
                                   4727 ; if  0 then so.
      009806 CE 00 01 1F      [ 5] 4728 	ldf a,[farptr]
      00980A 07 85            [ 1] 4729 	jreq 6$
      00980C 20               [ 1] 4730 2$: clrw x 	
      00980D D3 03            [ 2] 4731 	ldw y,(YSAVE,sp) 
      00980E CD 19 FA         [ 4] 4732 	call cmp_name
      00980E 72 00            [ 1] 4733 	jrc 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009810 00 24 05 A6      [ 5] 4734 	ldf a,([farptr],x)
      009814 06 CC            [ 1] 4735 	ld (FSIZE,sp),a 
      009816 88               [ 2] 4736 	incw x 
      009817 F7 AF 00 16      [ 5] 4737 	ldf a,([farptr],x)
      009818 6B 02            [ 1] 4738 	ld (FSIZE+1,sp),a 
      009818 1E               [ 2] 4739 	incw x 
      009819 03 CF 00         [ 2] 4740 	addw x,(FSIZE,sp) ; skip over file data
      00981C 05 E6 02         [ 4] 4741 	call incr_farptr
      00981F C7 00 04         [ 4] 4742 	call row_align  
      009822 1E 05 CF         [ 2] 4743 	ldw x,#0x280
      009825 00 01 85         [ 2] 4744 	cpw x,farptr 
      009828 5B 04            [ 1] 4745 	jrpl 1$
      001A54                       4746 6$: ; file not found 
      00982A 89 81 00 16      [ 1] 4747 	clr farptr
      00982C 72 5F 00 17      [ 1] 4748 	clr farptr+1 
      00982C 72 01 00 24      [ 1] 4749 	clr farptr+2 
      001A60                       4750 	_drop VSIZE 
      009830 02 4F            [ 2]    1     addw sp,#VSIZE 
      009832 81               [ 1] 4751 	rcf
      009833 81               [ 4] 4752 	ret
      001A64                       4753 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A64                       4754 	_drop VSIZE 
      009833 72 09            [ 2]    1     addw sp,#VSIZE 
      009835 00               [ 1] 4755 	scf 	
      009836 24               [ 4] 4756 	ret
                                   4757 
                                   4758 ;--------------------------------
                                   4759 ; BASIC: SAVE "name" 
                                   4760 ; save text program in 
                                   4761 ; flash memory used as permanent
                                   4762 ; storage from address 0x10000-0x27fff 
                                   4763 ;--------------------------------
                           000001  4764 	BSIZE=1
                           000003  4765 	NAMEPTR=3
                           000005  4766 	XSAVE=5
                           000007  4767 	YSAVE=7
                           000008  4768 	VSIZE=8 
      001A68                       4769 save:
      009837 12 5B 02 CD 95   [ 2] 4770 	btjf flags,#FRUN,0$ 
      00983C C0 5B            [ 1] 4771 	ld a,#ERR_CMD_ONLY 
      00983E 04 72 19         [ 2] 4772 	jp tb_error
      001A72                       4773 0$:	 
      009841 00 24 72         [ 2] 4774 	ldw x,txtend 
      009844 10 00 24 CC      [ 2] 4775 	subw x,txtbgn
      009848 89 9B            [ 1] 4776 	jrne 1$
                                   4777 ; nothing to save 
      00984A CE 00 1D         [ 2] 4778 	ldw x,#err_no_prog 
      00984D C3 00 1F         [ 4] 4779 	call puts 
      009850 2B 0C AE 88 90   [ 1] 4780 	mov in,count 
      009855 CD               [ 4] 4781 	ret  	
      001A87                       4782 1$:	
      001A87                       4783 	_vars VSIZE 
      009856 83 33            [ 2]    1     sub sp,#VSIZE 
      009858 55 00            [ 2] 4784 	ldw (BSIZE,sp),x 
      00985A 04 00 02         [ 4] 4785 	call next_token	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00985D 81 02            [ 1] 4786 	cp a,#TK_QSTR
      00985E 27 03            [ 1] 4787 	jreq 2$
      00985E CD 92 EF         [ 2] 4788 	jp syntax_error
      001A95                       4789 2$: 
      009861 5B 02            [ 2] 4790 	ldw (NAMEPTR,sp),x  
      009863 5F CF 00         [ 4] 4791 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4792 ; check if enough free space 
      009866 07 72 5F         [ 4] 4793 	call strlen 
      009869 00 09 72         [ 2] 4794 	addw x,#3 
      00986C 5F 00 0A         [ 2] 4795 	addw x,(BSIZE,sp)
      00986F CE               [ 1] 4796 	clr a 
      009870 00 1D CF 00      [ 2] 4797 	addw x,ffree+1 
      009874 05 E6 02         [ 1] 4798 	adc a,ffree 
      009877 C7 00            [ 1] 4799 	cp a,#2
      009879 04 35            [ 1] 4800 	jrmi 21$
      00987B 03 00 02         [ 2] 4801 	cpw x,#0x8000
      00987E 72 10            [ 1] 4802 	jrmi 21$
      009880 00 24            [ 1] 4803 	ld a,#ERR_NO_FSPACE  
      009882 CC 89 9B         [ 2] 4804 	jp tb_error
      009885                       4805 21$: 
                                   4806 ; check for existing file of that name 
      009885 AE 17            [ 2] 4807 	ldw y,(NAMEPTR,sp)	
      009887 FF 94 CC         [ 4] 4808 	call search_file 
      00988A 89 7C            [ 1] 4809 	jrnc 3$ 
      00988C A6 08            [ 1] 4810 	ld a,#ERR_DUPLICATE 
      00988C CD 90 FD         [ 2] 4811 	jp tb_error 
      001AC5                       4812 3$:	; initialize farptr 
      00988F A1 02 27         [ 2] 4813 	ldw x,ffree 
      009892 03 CC 88         [ 1] 4814 	ld a,ffree+2 
      009895 F5 00 16         [ 2] 4815 	ldw farptr,x 
      009896 C7 00 18         [ 1] 4816 	ld farptr+2,a 
                                   4817 ;** write file name to row buffer **	
      009896 85 90            [ 2] 4818 	ldw y,(NAMEPTR,sp)  
      009898 85 16 E0         [ 2] 4819 	ldw x,#pad 
      009899 CD 03 B0         [ 4] 4820 	call strcpy
      009899 89 AE F4         [ 4] 4821 	call strlen 
      00989C 24               [ 2] 4822 	incw  x
      00989D 65 90 A3         [ 2] 4823 	addw x,#pad 
                                   4824 ; ** write file size to row buffer 
      0098A0 7A 12            [ 2] 4825 	ldw y,(BSIZE,sp)
      0098A2 2B               [ 2] 4826 	ldw (x),y 
      0098A3 01 5C 02         [ 2] 4827 	addw x,#2 
                                   4828 ; ** write file data to row buffer 
      0098A5 90 CE 00 1C      [ 2] 4829 	ldw y,txtbgn 
      0098A5 9E C7            [ 1] 4830 6$:	ld a,(y)
      0098A7 53 0D            [ 2] 4831 	incw y
      0098A9 9F               [ 1] 4832 	ld (x),a 
      0098AA C7               [ 2] 4833 	incw x
      0098AB 53 0E 8C 56      [ 2] 4834 	cpw y,txtend 
      0098AF 9E C7            [ 1] 4835 	jreq 12$
      0098B1 53 0F 9F         [ 2] 4836 	cpw x,#stack_full 
      0098B4 C7 53            [ 1] 4837 	jrmi 6$
      001AFB                       4838 12$:
      0098B6 10 72            [ 2] 4839 	ldw (YSAVE,sp),y 
      001AFD                       4840 14$: ; zero buffer end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098B8 10 53 08         [ 2] 4841 	cpw x,#stack_full
      0098BB 72 10            [ 1] 4842 	jreq 16$
      0098BD 53               [ 1] 4843 	clr (x)
      0098BE 00               [ 2] 4844 	incw x 
      0098BF 72 10            [ 2] 4845 	jra 14$
      001B06                       4846 16$:
      0098C1 53 04 85         [ 2] 4847 	ldw x,#pad 
      0098C4 CD 9E 3A         [ 4] 4848 	call write_row 
      0098C7 72 11 53         [ 2] 4849 	ldw x,#BLOCK_SIZE 
      0098CA 08 72 11         [ 4] 4850 	call incr_farptr
      0098CD 53 00 81         [ 2] 4851 	ldw x,#pad 
      0098D0 16 07            [ 2] 4852 	ldw y,(YSAVE,sp)
      0098D0 CD 90 FD A1      [ 2] 4853 	cpw y,txtend 
      0098D4 02 27            [ 1] 4854 	jrmi 6$
                                   4855 ; save farptr in ffree
      0098D6 0B A1 01         [ 2] 4856 	ldw x,farptr 
      0098D9 27 03 CC         [ 1] 4857 	ld a,farptr+2 
      0098DC 88 F5 AE         [ 2] 4858 	ldw ffree,x 
      0098DF 00 00 89         [ 1] 4859 	ld ffree+2,a
                                   4860 ; print file size 	
      0098E2 1E 03            [ 2] 4861 	ldw x,(BSIZE,sp) 
      0098E4 5D 27 1A         [ 4] 4862 	call print_int 
      001B2E                       4863 	_drop VSIZE 
      0098E7 1E 01            [ 2]    1     addw sp,#VSIZE 
      0098E9 9F               [ 4] 4864 	ret 
                                   4865 
                                   4866 ;----------------------
                                   4867 ; load file in RAM memory
                                   4868 ; input:
                                   4869 ;    farptr point at file size 
                                   4870 ; output:
                                   4871 ;   y point after BASIC program in RAM.
                                   4872 ;------------------------
      001B31                       4873 load_file:
      0098EA A4 07 4E         [ 4] 4874 	call incr_farptr  
      0098ED C7 54 01         [ 4] 4875 	call clear_basic  
      0098F0 72               [ 1] 4876 	clrw x
      0098F1 16 50 CA 72      [ 5] 4877 	ldf a,([farptr],x)
      0098F5 10 54            [ 1] 4878 	ld yh,a 
      0098F7 01               [ 2] 4879 	incw x  
      0098F8 AE 00 1B 5A      [ 5] 4880 	ldf a,([farptr],x)
      0098FC 9D               [ 2] 4881 	incw x 
      0098FD 26 FA            [ 1] 4882 	ld yl,a 
      0098FF 20 08 72 11      [ 2] 4883 	addw y,txtbgn
      009903 54 01 72 17      [ 2] 4884 	ldw txtend,y
      009907 50 CA 5B 04      [ 2] 4885 	ldw y,txtbgn
      001B52                       4886 3$:	; load BASIC text 	
      00990B 81 AF 00 16      [ 5] 4887 	ldf a,([farptr],x)
      00990C 90 F7            [ 1] 4888 	ld (y),a 
      00990C CD               [ 2] 4889 	incw x 
      00990D 90 F8            [ 2] 4890 	incw y 
      00990F A1 01 27 03      [ 2] 4891 	cpw y,txtend 
      009913 CC 88            [ 1] 4892 	jrmi 3$
      009915 F5               [ 4] 4893 	ret 
                                   4894 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4895 ;------------------------
                                   4896 ; BASIC: LOAD "file" 
                                   4897 ; load file to RAM 
                                   4898 ; for execution 
                                   4899 ;------------------------
      001B62                       4900 load:
      009916 85 A3 00 05 23   [ 2] 4901 	btjf flags,#FRUN,0$ 
      00991B 05 A6            [ 1] 4902 	jreq 0$ 
      00991D 0A CC            [ 1] 4903 	ld a,#ERR_CMD_ONLY 
      00991F 88 F7 9F         [ 2] 4904 	jp tb_error 
      001B6E                       4905 0$:	
      009922 C7 00 0E         [ 4] 4906 	call next_token 
      009925 A6 05            [ 1] 4907 	cp a,#TK_QSTR
      009927 C0 00            [ 1] 4908 	jreq 1$
      009929 0E C7 54         [ 2] 4909 	jp syntax_error 
      00992C 00 72            [ 1] 4910 1$:	ldw y,x 
      00992E 16 54 02         [ 4] 4911 	call search_file 
      009931 72 10            [ 1] 4912 	jrc 2$ 
      009933 54 01            [ 1] 4913 	ld a,#ERR_NOT_FILE
      009935 72 0F 54         [ 2] 4914 	jp tb_error  
      001B84                       4915 2$:
      009938 00 FB CE         [ 4] 4916 	call load_file
                                   4917 ; print loaded size 	 
      00993B 54 04 A6         [ 2] 4918 	ldw x,txtend 
      00993E 84 81 00 1C      [ 2] 4919 	subw x,txtbgn
      009940 CD 09 BC         [ 4] 4920 	call print_int 
      009940 52               [ 4] 4921 	ret 
                                   4922 
                                   4923 ;-----------------------------------
                                   4924 ; BASIC: FORGET ["file_name"] 
                                   4925 ; erase file_name and all others 
                                   4926 ; after it. 
                                   4927 ; without argument erase all files 
                                   4928 ;-----------------------------------
                           000001  4929 	NEW_FREE=1 
                           000003  4930 	VSIZE=3 
      001B92                       4931 forget:
      001B92                       4932 	_vars VSIZE 
      009941 01 CD            [ 2]    1     sub sp,#VSIZE 
      009943 90 F8 A1         [ 4] 4933 	call next_token 
      009946 01 27            [ 1] 4934 	cp a,#TK_NONE 
      009948 03 CC            [ 1] 4935 	jreq 3$ 
      00994A 88 F5            [ 1] 4936 	cp a,#TK_QSTR
      00994C 85 A3            [ 1] 4937 	jreq 1$
      00994E 00 0F 23         [ 2] 4938 	jp syntax_error
      009951 05 A6            [ 1] 4939 1$: ldw y,x 
      009953 0A CC 88 F7 CD   [ 1] 4940 	mov in,count 
      009958 9F 6D 6B         [ 4] 4941 	call search_file
      00995B 01 E6            [ 1] 4942 	jrc 2$
      00995D 01 0D            [ 1] 4943 	ld a,#ERR_NOT_FILE 
      00995F 01 27 05         [ 2] 4944 	jp tb_error 
      001BB3                       4945 2$: 
      009962 44 0A 01         [ 2] 4946 	ldw x,farptr
      009965 26 FB A4         [ 1] 4947 	ld a,farptr+2
      009968 01 5F            [ 2] 4948 	jra 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001BBB                       4949 3$: ; forget all files 
      00996A 97 A6 84         [ 2] 4950 	ldw x,#0x100
      00996D 5B               [ 1] 4951 	clr a 
      00996E 01 81 16         [ 2] 4952 	ldw farptr,x 
      009970 C7 00 18         [ 1] 4953 	ld farptr+2,a 
      001BC5                       4954 4$:	; save new free address 
      009970 52 02            [ 2] 4955 	ldw (NEW_FREE,sp),x
      009972 CD 90            [ 1] 4956 	ld (NEW_FREE+2,sp),a 
      009974 FD A1 02         [ 4] 4957 	call move_erase_to_ram
      009977 27 03 CC         [ 4] 4958 5$: call block_erase 
      00997A 88 F5 85         [ 2] 4959 	ldw x,#BLOCK_SIZE 
      00997D 9F 6B 02         [ 4] 4960 	call incr_farptr 
      009980 85 A3 00         [ 4] 4961 	call row_align 
                                   4962 ; check if all blocks erased
      009983 0F 23 05         [ 1] 4963 	ld a,farptr+2  
      009986 A6 0A CC         [ 1] 4964 	sub a,ffree+2
      009989 88 F7 CD         [ 1] 4965 	ld a,farptr+1 
      00998C 9F 6D 6B         [ 1] 4966 	sbc a,ffree+1 
      00998F 01 A6 01         [ 1] 4967 	ld a,farptr 
      009992 0D 01 27         [ 1] 4968 	sbc a,ffree 
      009995 05 48            [ 1] 4969 	jrmi 5$ 
      009997 0A 01            [ 1] 4970 	ld a,(NEW_FREE+2,sp)
      009999 26 FB            [ 2] 4971 	ldw x,(NEW_FREE,sp)
      00999B 0D 02 26         [ 1] 4972 	ld ffree+2,a 
      00999E 05 43 E4         [ 2] 4973 	ldw ffree,x 
      001BF6                       4974 	_drop VSIZE 
      0099A1 00 20            [ 2]    1     addw sp,#VSIZE 
      0099A3 02               [ 4] 4975 	ret 
                                   4976 
                                   4977 ;----------------------
                                   4978 ; BASIC: DIR 
                                   4979 ; list saved files 
                                   4980 ;----------------------
                           000001  4981 	COUNT=1 ; files counter 
                           000002  4982 	VSIZE=2 
      001BF9                       4983 directory:
      001BF9                       4984 	_vars VSIZE 
      0099A4 EA 00            [ 2]    1     sub sp,#VSIZE 
      0099A6 E7               [ 1] 4985 	clrw x 
      0099A7 00 5B            [ 2] 4986 	ldw (COUNT,sp),x 
      0099A9 02 81 17         [ 2] 4987 	ldw farptr+1,x 
      0099AB 35 01 00 16      [ 1] 4988 	mov farptr,#1 
      001C05                       4989 dir_loop:
      0099AB 72               [ 1] 4990 	clrw x 
      0099AC 00 00 24 02      [ 5] 4991 	ldf a,([farptr],x)
      0099B0 4F 81            [ 1] 4992 	jreq 8$ 
      0099B2                       4993 1$: ;name loop 	
      0099B2 AE 99 D9 CD      [ 5] 4994 	ldf a,([farptr],x)
      0099B6 83 33            [ 1] 4995 	jreq 2$ 
      0099B8 5B 02 52         [ 4] 4996 	call putc 
      0099BB 04               [ 2] 4997 	incw x 
      0099BC CD 95            [ 2] 4998 	jra 1$
      0099BE B0               [ 2] 4999 2$: incw x ; skip ending 0. 
      0099BF AE 16            [ 1] 5000 	ld a,#SPACE 
      0099C1 90 CF 00         [ 4] 5001 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   5002 ; get file size 	
      0099C4 05 7F 72 5F      [ 5] 5003 	ldf a,([farptr],x)
      0099C8 00 04            [ 1] 5004 	ld yh,a 
      0099CA 5F               [ 2] 5005 	incw x 
      0099CB CF 00 01 72      [ 5] 5006 	ldf a,([farptr],x)
      0099CF 11               [ 2] 5007 	incw x 
      0099D0 00 24            [ 1] 5008 	ld yl,a 
      0099D2 72 18            [ 2] 5009 	pushw y 
      0099D4 00 24 CC         [ 2] 5010 	addw x,(1,sp)
                                   5011 ; skip to next file 
      0099D7 89 9B 0A         [ 4] 5012 	call incr_farptr
      0099DA 62 72 65         [ 4] 5013 	call row_align
                                   5014 ; print file size 
      0099DD 61               [ 2] 5015 	popw x ; file size 
      0099DE 6B 20 70         [ 4] 5016 	call print_int 
      0099E1 6F 69            [ 1] 5017 	ld a,#CR 
      0099E3 6E 74 2C         [ 4] 5018 	call putc
      0099E6 20 52            [ 2] 5019 	ldw x,(COUNT,sp)
      0099E8 55               [ 2] 5020 	incw x
      0099E9 4E 20            [ 2] 5021 	ldw (COUNT,sp),x  
      0099EB 74 6F            [ 2] 5022 	jra dir_loop
      001C47                       5023 8$: ; print number of files 
      0099ED 20 72            [ 2] 5024 	ldw x,(COUNT,sp)
      0099EF 65 73 75         [ 4] 5025 	call print_int 
      0099F2 6D 65 2E         [ 2] 5026 	ldw x,#file_count 
      0099F5 0A 00 B3         [ 4] 5027 	call puts  
                                   5028 ; print drive free space 	
      0099F7 CD 19 E7         [ 4] 5029 	call disk_free
      0099F7 72               [ 1] 5030 	clrw x  
      0099F8 01 00 24 01      [ 1] 5031 	mov base,#10 
      0099FC 81 09 CC         [ 4] 5032 	call prti24 
      0099FD AE 1C 6E         [ 2] 5033 	ldw x,#drive_free
      0099FD CD 87 61         [ 4] 5034 	call puts 
      001C63                       5035 	_drop VSIZE 
      009A00 81 02            [ 2]    1     addw sp,#VSIZE 
      009A01 81               [ 4] 5036 	ret
      009A01 AE 16 E0 A6 80 7F 5C  5037 file_count: .asciz " files\n"
             4A
      009A09 26 FB 81 74 65 73 20  5038 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5039 
                                   5040 ;---------------------
                                   5041 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5042 ; write 1 or more byte to FLASH or EEPROM
                                   5043 ; starting at address  
                                   5044 ; input:
                                   5045 ;   expr1  	is address 
                                   5046 ;   expr2,...,exprn   are bytes to write
                                   5047 ; output:
                                   5048 ;   none 
                                   5049 ;---------------------
                           000001  5050 	ADDR=1
                           000002  5051 	VSIZ=2 
      009A0C                       5052 write:
      001C7B                       5053 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A0C A6 7F            [ 2]    1     sub sp,#VSIZE 
      009A0E C4 00 19 27      [ 1] 5054 	clr farptr ; expect 16 bits address 
      009A12 13 CE 00         [ 4] 5055 	call expression
      009A15 18 1C            [ 1] 5056 	cp a,#TK_INTGR 
      009A17 00 80            [ 1] 5057 	jreq 0$
      009A19 24 04 72         [ 2] 5058 	jp syntax_error
      009A1C 5C 00            [ 2] 5059 0$: ldw (ADDR,sp),x 
      009A1E 17 9F A4         [ 4] 5060 	call next_token 
      009A21 80 97            [ 1] 5061 	cp a,#TK_COMMA 
      009A23 CF 00            [ 1] 5062 	jreq 1$ 
      009A25 18 81            [ 2] 5063 	jra 9$ 
      009A27 CD 11 76         [ 4] 5064 1$:	call expression
      009A27 72 BB            [ 1] 5065 	cp a,#TK_INTGR
      009A29 00 18            [ 1] 5066 	jreq 2$
      009A2B 24 04 72         [ 2] 5067 	jp syntax_error
      009A2E 5C               [ 1] 5068 2$:	ld a,xl 
      009A2F 00 17            [ 2] 5069 	ldw x,(ADDR,sp) 
      009A31 CF 00 18         [ 2] 5070 	ldw farptr+1,x 
      009A34 81               [ 1] 5071 	clrw x 
      009A35 CD 01 CD         [ 4] 5072 	call write_byte
      009A35 A6 01            [ 2] 5073 	ldw x,(ADDR,sp)
      009A37 C7               [ 2] 5074 	incw x 
      009A38 00 17            [ 2] 5075 	jra 0$ 
      001CAF                       5076 9$:
      001CAF                       5077 	_drop VSIZE
      009A3A 5F CF            [ 2]    1     addw sp,#VSIZE 
      009A3C 00               [ 4] 5078 	ret 
                                   5079 
                                   5080 
                                   5081 ;---------------------
                                   5082 ;BASIC: CHAR(expr)
                                   5083 ; évaluate expression 
                                   5084 ; and take the 7 least 
                                   5085 ; bits as ASCII character
                                   5086 ;---------------------
      001CB2                       5087 char:
      009A3D 18 10 78         [ 4] 5088 	call func_args 
      009A3E A1 01            [ 1] 5089 	cp a,#1
      009A3E AE 00            [ 1] 5090 	jreq 1$
      009A40 03 92 AF         [ 2] 5091 	jp syntax_error
      009A43 00               [ 2] 5092 1$:	popw x 
      009A44 17               [ 1] 5093 	ld a,xl 
      009A45 26 05            [ 1] 5094 	and a,#0x7f 
      009A47 5A               [ 1] 5095 	ld xl,a
      009A48 2A F7            [ 1] 5096 	ld a,#TK_CHAR
      009A4A 20               [ 4] 5097 	ret
                                   5098 
                                   5099 ;---------------------
                                   5100 ; BASIC: ASC(string|char)
                                   5101 ; extract first character 
                                   5102 ; of string argument 
                                   5103 ; return it as TK_INTGR 
                                   5104 ;---------------------
      001CC4                       5105 ascii:
      009A4B 0E AE            [ 1] 5106 	ld a,#TK_LPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A4D 00 80 CD         [ 4] 5107 	call expect 
      009A50 9A 27 AE         [ 4] 5108 	call next_token 
      009A53 02 80            [ 1] 5109 	cp a,#TK_QSTR 
      009A55 C3 00            [ 1] 5110 	jreq 1$
      009A57 17 2B            [ 1] 5111 	cp a,#TK_CHAR 
      009A59 E4 06            [ 1] 5112 	jreq 2$ 
      009A5A CC 08 75         [ 2] 5113 	jp syntax_error
      001CD7                       5114 1$: 
      009A5A CE               [ 1] 5115 	ld a,(x) 
      009A5B 00               [ 1] 5116 	clrw x
      009A5C 17               [ 1] 5117 	ld xl,a 
      001CDA                       5118 2$: 
      009A5D C6               [ 2] 5119 	pushw x 
      009A5E 00 19            [ 1] 5120 	ld a,#TK_RPAREN 
      009A60 CF 00 1A         [ 4] 5121 	call expect
      009A63 C7               [ 2] 5122 	popw x 
      009A64 00 1C            [ 1] 5123 	ld a,#TK_INTGR 
      009A66 81               [ 4] 5124 	ret 
                                   5125 
                                   5126 ;---------------------
                                   5127 ;BASIC: KEY
                                   5128 ; wait for a character 
                                   5129 ; received from STDIN 
                                   5130 ; input:
                                   5131 ;	none 
                                   5132 ; output:
                                   5133 ;	X 		ASCII character 
                                   5134 ;---------------------
      009A67                       5135 key:
      009A67 AE 80 00         [ 4] 5136 	call getc 
      009A6A 72               [ 1] 5137 	clrw x 
      009A6B B0               [ 1] 5138 	ld xl,a 
      009A6C 00 1B            [ 1] 5139 	ld a,#TK_INTGR
      009A6E A6               [ 4] 5140 	ret
                                   5141 
                                   5142 ;----------------------
                                   5143 ; BASIC: QKEY
                                   5144 ; Return true if there 
                                   5145 ; is a character in 
                                   5146 ; waiting in STDIN 
                                   5147 ; input:
                                   5148 ;  none 
                                   5149 ; output:
                                   5150 ;   X 		0|-1 
                                   5151 ;-----------------------
      001CEC                       5152 qkey:: 
      009A6F 02               [ 1] 5153 	clrw x 
      009A70 C2 00 1A C7      [ 1] 5154 	tnz rx_char
      009A74 00 0C            [ 1] 5155 	jreq 9$ 
      009A76 CF               [ 2] 5156 	cplw x 
      009A77 00 0D            [ 1] 5157 9$: ld a,#TK_INTGR
      009A79 81               [ 4] 5158 	ret 
                                   5159 
                                   5160 ;---------------------
                                   5161 ; BASIC: GPIO(expr,reg)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5162 ; return gpio address 
                                   5163 ; expr {0..8}
                                   5164 ; input:
                                   5165 ;   none 
                                   5166 ; output:
                                   5167 ;   X 		gpio register address
                                   5168 ;----------------------------
                           000003  5169 	PORT=3
                           000001  5170 	REG=1 
                           000004  5171 	VSIZE=4 
      009A7A                       5172 gpio:
      009A7A 5F 92 AF         [ 4] 5173 	call func_args 
      009A7D 00 17            [ 1] 5174 	cp a,#2
      009A7F 90 F1            [ 1] 5175 	jreq 1$
      009A81 26 08 4D         [ 2] 5176 	jp syntax_error  
      001D01                       5177 1$:	
      009A84 27 12            [ 2] 5178 	ldw x,(PORT,sp)
      009A86 5C 90            [ 1] 5179 	jrmi bad_port
      009A88 5C 20 F0         [ 2] 5180 	cpw x,#9
      009A8B 2A 12            [ 1] 5181 	jrpl bad_port
      009A8B 4D 27            [ 1] 5182 	ld a,#5
      009A8D 07               [ 4] 5183 	mul x,a
      009A8E 5C 92 AF         [ 2] 5184 	addw x,#GPIO_BASE 
      009A91 00 17            [ 2] 5185 	ldw (PORT,sp),x  
      009A93 20 F6            [ 2] 5186 	ldw x,(REG,sp) 
      009A95 5C 98 81         [ 2] 5187 	addw x,(PORT,sp)
      009A98 A6 84            [ 1] 5188 	ld a,#TK_INTGR
      001D19                       5189 	_drop VSIZE 
      009A98 5C 99            [ 2]    1     addw sp,#VSIZE 
      009A9A 81               [ 4] 5190 	ret
      009A9B                       5191 bad_port:
      009A9B 52 04            [ 1] 5192 	ld a,#ERR_BAD_VALUE
      009A9D 17 03 5F         [ 2] 5193 	jp tb_error
                                   5194 
                                   5195 
                                   5196 ;-------------------------
                                   5197 ; BASIC: UFLASH 
                                   5198 ; return user flash address
                                   5199 ; input:
                                   5200 ;  none 
                                   5201 ; output:
                                   5202 ;	A		TK_INTGR
                                   5203 ;   X 		user address 
                                   5204 ;---------------------------
      001D21                       5205 uflash:
      009AA0 CF 00 18         [ 2] 5206 	ldw x,#user_space 
      009AA3 35 01            [ 1] 5207 	ld a,#TK_INTGR 
      009AA5 00               [ 4] 5208 	ret 
                                   5209 
                                   5210 
                                   5211 ;---------------------
                                   5212 ; BASIC: USR(addr[,arg])
                                   5213 ; execute a function written 
                                   5214 ; in binary code.
                                   5215 ; binary fonction should 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5216 ; return token attribute in A 
                                   5217 ; and value in X. 
                                   5218 ; input:
                                   5219 ;   addr	routine address 
                                   5220 ;   arg 	is an optional argument 
                                   5221 ; output:
                                   5222 ;   A 		token attribute 
                                   5223 ;   X       returned value 
                                   5224 ;---------------------
      001D27                       5225 usr:
      009AA6 17 89            [ 2] 5226 	pushw y 	
      009AA7 CD 10 78         [ 4] 5227 	call func_args 
      009AA7 92 BC            [ 1] 5228 	cp a,#1 
      009AA9 00 17            [ 1] 5229 	jreq 2$
      009AAB 27 27            [ 1] 5230 	cp a,#2
      009AAD 5F 16            [ 1] 5231 	jreq 2$  
      009AAF 03 CD 9A         [ 2] 5232 	jp syntax_error 
      009AB2 7A 25            [ 2] 5233 2$: popw y  ; arg|addr 
      009AB4 2F 92            [ 1] 5234 	cp a,#1
      009AB6 AF 00            [ 1] 5235 	jreq 3$
      009AB8 17               [ 2] 5236 	popw x ; addr
      009AB9 6B               [ 1] 5237 	exgw x,y 
      009ABA 01 5C            [ 4] 5238 3$: call (y)
      009ABC 92 AF            [ 2] 5239 	popw y 
      009ABE 00               [ 4] 5240 	ret 
                                   5241 
                                   5242 ;------------------------------
                                   5243 ; BASIC: BYE 
                                   5244 ; halt mcu in its lowest power mode 
                                   5245 ; wait for reset or external interrupt
                                   5246 ; do a cold start on wakeup.
                                   5247 ;------------------------------
      001D44                       5248 bye:
      009ABF 17 6B 02 5C 72   [ 2] 5249 	btjf UART1_SR,#UART_SR_TC,.
      009AC4 FB               [10] 5250 	halt
      009AC5 01 CD 9A         [ 2] 5251 	jp cold_start  
                                   5252 
                                   5253 ;----------------------------------
                                   5254 ; BASIC: AUTORUN ["file_name"] 
                                   5255 ; record in eeprom at adrress AUTORUN_NAME
                                   5256 ; the name of file to load and execute
                                   5257 ; at startup. 
                                   5258 ; empty string delete autorun name 
                                   5259 ; no argument display autorun name  
                                   5260 ; input:
                                   5261 ;   file_name   file to execute 
                                   5262 ; output:
                                   5263 ;   none
                                   5264 ;-----------------------------------
      001D4D                       5265 autorun: 
      009AC8 27 CD 9A 0C AE   [ 2] 5266 	btjf flags,#FRUN,0$ 
      009ACD 02 80            [ 1] 5267 	jreq 0$ 
      009ACF C3 00            [ 1] 5268 	ld a,#ERR_CMD_ONLY 
      009AD1 17 2A D3         [ 2] 5269 	jp tb_error 
      009AD4                       5270 0$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AD4 72 5F 00         [ 4] 5271 	call next_token
      009AD7 17 72            [ 1] 5272 	jrne 1$
      009AD9 5F 00 18         [ 2] 5273 	ldw x,#AUTORUN_NAME
      009ADC 72 5F 00         [ 4] 5274 	call puts 
      009ADF 19               [ 1] 5275 	clr a 
      009AE0 5B               [ 4] 5276 	ret 
      001D66                       5277 1$:
      009AE1 04 98            [ 1] 5278 	cp a,#TK_QSTR
      009AE3 81 03            [ 1] 5279 	jreq 2$
      009AE4 CC 08 75         [ 2] 5280 	jp syntax_error 
      001D6D                       5281 2$:	
      009AE4 5B               [ 1] 5282 	tnz (x) 
      009AE5 04 99            [ 1] 5283 	jrne 3$
                                   5284 ; empty string, delete autorun 	
      009AE7 81 06 94         [ 4] 5285 	call cancel_autorun
      009AE8 55 00 03 00 01   [ 1] 5286 	mov in,count 
      009AE8 72               [ 4] 5287 	ret 
      009AE9 01               [ 2] 5288 3$:	pushw x 
      009AEA 00 24            [ 1] 5289 	ldw y,x  
      009AEC 05 A6 07         [ 4] 5290 	call search_file 
      009AEF CC 88            [ 1] 5291 	jrc 4$ 
      009AF1 F7 09            [ 1] 5292 	ld a,#ERR_NOT_FILE
      009AF2 CC 08 77         [ 2] 5293 	jp tb_error  
      001D86                       5294 4$: 
      009AF2 CE 00 1F 72 B0   [ 1] 5295 	mov in,count 
      009AF7 00 1D 26 0C      [ 1] 5296 	clr farptr 
      009AFB AE 88 90         [ 2] 5297 	ldw x,#AUTORUN_NAME
      009AFE CD 83 33         [ 2] 5298 	ldw farptr+1,x 
      009B01 55 00            [ 2] 5299 	ldw x,(1,sp)  
      009B03 04 00 02         [ 4] 5300 	call strlen  ; return length in X 
      009B06 81               [ 2] 5301 	incw x 
      009B07 90 85            [ 2] 5302 	popw y 
      009B07 52               [ 2] 5303 	pushw x 
      009B08 08               [ 1] 5304 	clrw x 
      009B09 1F 01 CD         [ 4] 5305 	call write_block 
      001DA2                       5306 	_drop 2 
      009B0C 89 E7            [ 2]    1     addw sp,#2 
      009B0E A1               [ 4] 5307 	ret 
                                   5308 
                                   5309 ;----------------------------------
                                   5310 ; BASIC: SLEEP 
                                   5311 ; halt mcu until reset or external
                                   5312 ; interrupt.
                                   5313 ; Resume progam after SLEEP command
                                   5314 ;----------------------------------
      001DA5                       5315 sleep:
      009B0F 02 27 03 CC 88   [ 2] 5316 	btjf UART1_SR,#UART_SR_TC,.
      009B14 F5 16 00 23      [ 1] 5317 	bset flags,#FSLEEP
      009B15 8E               [10] 5318 	halt 
      009B15 1F               [ 4] 5319 	ret 
                                   5320 
                                   5321 ;-------------------------------
                                   5322 ; BASIC: PAUSE expr 
                                   5323 ; suspend execution for n msec.
                                   5324 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5325 ;	none
                                   5326 ; output:
                                   5327 ;	none 
                                   5328 ;------------------------------
      001DB0                       5329 pause:
      009B16 03 CD 81         [ 4] 5330 	call expression
      009B19 DC CD            [ 1] 5331 	cp a,#TK_INTGR
      009B1B 84 12            [ 1] 5332 	jreq pause02 
      009B1D 1C 00 03         [ 2] 5333 	jp syntax_error
      001DBA                       5334 pause02: 
      009B20 72               [ 2] 5335 1$: tnzw x 
      009B21 FB 01            [ 1] 5336 	jreq 2$
      009B23 4F               [10] 5337 	wfi 
      009B24 72               [ 2] 5338 	decw x 
      009B25 BB 00            [ 1] 5339 	jrne 1$
      009B27 1B               [ 1] 5340 2$:	clr a 
      009B28 C9               [ 4] 5341 	ret 
                                   5342 
                                   5343 ;------------------------------
                                   5344 ; BASIC: AWU expr
                                   5345 ; halt mcu for 'expr' milliseconds
                                   5346 ; use Auto wakeup peripheral
                                   5347 ; all oscillators stopped except LSI
                                   5348 ; range: 1ms - 511ms
                                   5349 ; input:
                                   5350 ;  none
                                   5351 ; output:
                                   5352 ;  none:
                                   5353 ;------------------------------
      001DC3                       5354 awu:
      009B29 00 1A A1         [ 4] 5355   call expression
      009B2C 02 2B            [ 1] 5356   cp a,#TK_INTGR
      009B2E 0A A3            [ 1] 5357   jreq awu02
      009B30 80 00 2B         [ 2] 5358   jp syntax_error
      001DCD                       5359 awu02:
      009B33 05 A6 0E         [ 2] 5360   cpw x,#5120
      009B36 CC 88            [ 1] 5361   jrmi 1$ 
      009B38 F7 0F 50 F2      [ 1] 5362   mov AWU_TBR,#15 
      009B39 A6 1E            [ 1] 5363   ld a,#30
      009B39 16               [ 2] 5364   div x,a
      009B3A 03 CD            [ 1] 5365   ld a,#16
      009B3C 9A               [ 2] 5366   div x,a 
      009B3D 9B 24            [ 2] 5367   jra 4$
      001DDE                       5368 1$: 
      009B3F 05 A6 08         [ 2] 5369   cpw x,#2048
      009B42 CC 88            [ 1] 5370   jrmi 2$ 
      009B44 F7 0E 50 F2      [ 1] 5371   mov AWU_TBR,#14
      009B45 A6 50            [ 1] 5372   ld a,#80
      009B45 CE               [ 2] 5373   div x,a 
      009B46 00 1A            [ 2] 5374   jra 4$   
      001DEC                       5375 2$:
      009B48 C6 00 1C CF      [ 1] 5376   mov AWU_TBR,#7
      001DF0                       5377 3$:  
                                   5378 ; while X > 64  divide by 2 and increment AWU_TBR 
      009B4C 00 17 C7         [ 2] 5379   cpw x,#64 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B4F 00 19            [ 2] 5380   jrule 4$ 
      009B51 16 03 AE 16      [ 1] 5381   inc AWU_TBR 
      009B55 E0               [ 2] 5382   srlw x 
      009B56 CD 84            [ 2] 5383   jra 3$ 
      001DFC                       5384 4$:
      009B58 30               [ 1] 5385   ld a, xl
      009B59 CD               [ 1] 5386   dec a 
      009B5A 84 12            [ 1] 5387   jreq 5$
      009B5C 5C               [ 1] 5388   dec a 	
      001E01                       5389 5$: 
      009B5D 1C 16            [ 1] 5390   and a,#0x3e 
      009B5F E0 16 01         [ 1] 5391   ld AWU_APR,a 
      009B62 FF 1C 00 02      [ 1] 5392   bset AWU_CSR,#AWU_CSR_AWUEN
      009B66 90               [10] 5393   halt 
                                   5394 
      009B67 CE               [ 4] 5395   ret 
                                   5396 
                                   5397 ;------------------------------
                                   5398 ; BASIC: TICKS
                                   5399 ; return msec ticks counter value 
                                   5400 ; input:
                                   5401 ; 	none 
                                   5402 ; output:
                                   5403 ;	X 		TK_INTGR
                                   5404 ;-------------------------------
      001E0C                       5405 get_ticks:
      009B68 00 1D 90         [ 2] 5406 	ldw x,ticks 
      009B6B F6 90            [ 1] 5407 	ld a,#TK_INTGR
      009B6D 5C               [ 4] 5408 	ret 
                                   5409 
                                   5410 
                                   5411 
                                   5412 ;------------------------------
                                   5413 ; BASIC: ABS(expr)
                                   5414 ; return absolute value of expr.
                                   5415 ; input:
                                   5416 ;   none
                                   5417 ; output:
                                   5418 ;   X     	positive integer
                                   5419 ;-------------------------------
      001E12                       5420 abs:
      009B6E F7 5C 90         [ 4] 5421 	call func_args 
      009B71 C3 00            [ 1] 5422 	cp a,#1 
      009B73 1F 27            [ 1] 5423 	jreq 0$ 
      009B75 05 A3 17         [ 2] 5424 	jp syntax_error
      001E1C                       5425 0$:  
      009B78 60               [ 2] 5426     popw x   
      009B79 2B               [ 1] 5427 	ld a,xh 
      009B7A EF 80            [ 1] 5428 	bcp a,#0x80 
      009B7B 27 01            [ 1] 5429 	jreq 2$ 
      009B7B 17               [ 2] 5430 	negw x 
      009B7C 07 84            [ 1] 5431 2$: ld a,#TK_INTGR 
      009B7D 81               [ 4] 5432 	ret 
                                   5433 
                                   5434 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5435 ; BASIC: AND(expr1,expr2)
                                   5436 ; Apply bit AND relation between
                                   5437 ; the 2 arguments, i.e expr1 & expr2 
                                   5438 ; output:
                                   5439 ; 	A 		TK_INTGR
                                   5440 ;   X 		result 
                                   5441 ;------------------------------
      001E26                       5442 bit_and:
      009B7D A3 17 60         [ 4] 5443 	call func_args 
      009B80 27 04            [ 1] 5444 	cp a,#2
      009B82 7F 5C            [ 1] 5445 	jreq 1$
      009B84 20 F7 75         [ 2] 5446 	jp syntax_error 
      009B86 85               [ 2] 5447 1$:	popw x 
      009B86 AE               [ 1] 5448 	ld a,xh 
      009B87 16 E0            [ 1] 5449 	and a,(1,sp)
      009B89 CD               [ 1] 5450 	ld xh,a 
      009B8A 81               [ 1] 5451 	ld a,xl
      009B8B F0 AE            [ 1] 5452 	and a,(2,sp)
      009B8D 00               [ 1] 5453 	ld xl,a 
      001E39                       5454 	_drop 2 
      009B8E 80 CD            [ 2]    1     addw sp,#2 
      009B90 9A 27            [ 1] 5455 	ld a,#TK_INTGR
      009B92 AE               [ 4] 5456 	ret
                                   5457 
                                   5458 ;------------------------------
                                   5459 ; BASIC: OR(expr1,expr2)
                                   5460 ; Apply bit OR relation between
                                   5461 ; the 2 arguments, i.e expr1 | expr2 
                                   5462 ; output:
                                   5463 ; 	A 		TK_INTGR
                                   5464 ;   X 		result 
                                   5465 ;------------------------------
      001E3E                       5466 bit_or:
      009B93 16 E0 16         [ 4] 5467 	call func_args 
      009B96 07 90            [ 1] 5468 	cp a,#2
      009B98 C3 00            [ 1] 5469 	jreq 1$
      009B9A 1F 2B CD         [ 2] 5470 	jp syntax_error 
      001E48                       5471 1$: 
      009B9D CE               [ 2] 5472 	popw x 
      009B9E 00               [ 1] 5473 	ld a,xh 
      009B9F 17 C6            [ 1] 5474 	or a,(1,sp)
      009BA1 00               [ 1] 5475 	ld xh,a 
      009BA2 19               [ 1] 5476 	ld a,xl 
      009BA3 CF 00            [ 1] 5477 	or a,(2,sp)
      009BA5 1A               [ 1] 5478 	ld xl,a 
      001E51                       5479 	_drop 2 
      009BA6 C7 00            [ 2]    1     addw sp,#2 
      009BA8 1C 1E            [ 1] 5480 	ld a,#TK_INTGR 
      009BAA 01               [ 4] 5481 	ret
                                   5482 
                                   5483 ;------------------------------
                                   5484 ; BASIC: XOR(expr1,expr2)
                                   5485 ; Apply bit XOR relation between
                                   5486 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5487 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5488 ; 	A 		TK_INTGR
                                   5489 ;   X 		result 
                                   5490 ;------------------------------
      001E56                       5491 bit_xor:
      009BAB CD 8A 3C         [ 4] 5492 	call func_args 
      009BAE 5B 08            [ 1] 5493 	cp a,#2
      009BB0 81 03            [ 1] 5494 	jreq 1$
      009BB1 CC 08 75         [ 2] 5495 	jp syntax_error 
      001E60                       5496 1$: 
      009BB1 CD               [ 2] 5497 	popw x 
      009BB2 9A               [ 1] 5498 	ld a,xh 
      009BB3 27 CD            [ 1] 5499 	xor a,(1,sp)
      009BB5 87               [ 1] 5500 	ld xh,a 
      009BB6 61               [ 1] 5501 	ld a,xl 
      009BB7 5F 92            [ 1] 5502 	xor a,(2,sp)
      009BB9 AF               [ 1] 5503 	ld xl,a 
      001E69                       5504 	_drop 2 
      009BBA 00 17            [ 2]    1     addw sp,#2 
      009BBC 90 95            [ 1] 5505 	ld a,#TK_INTGR 
      009BBE 5C               [ 4] 5506 	ret 
                                   5507 
                                   5508 ;------------------------------
                                   5509 ; BASIC: LSHIFT(expr1,expr2)
                                   5510 ; logical shift left expr1 by 
                                   5511 ; expr2 bits 
                                   5512 ; output:
                                   5513 ; 	A 		TK_INTGR
                                   5514 ;   X 		result 
                                   5515 ;------------------------------
      001E6E                       5516 lshift:
      009BBF 92 AF 00         [ 4] 5517 	call func_args
      009BC2 17 5C            [ 1] 5518 	cp a,#2 
      009BC4 90 97            [ 1] 5519 	jreq 1$
      009BC6 72 B9 00         [ 2] 5520 	jp syntax_error
      009BC9 1D 90            [ 2] 5521 1$: popw y   
      009BCB CF               [ 2] 5522 	popw x 
      009BCC 00 1F            [ 2] 5523 	tnzw y 
      009BCE 90 CE            [ 1] 5524 	jreq 4$
      009BD0 00               [ 2] 5525 2$:	sllw x 
      009BD1 1D 5A            [ 2] 5526 	decw y 
      009BD2 26 FB            [ 1] 5527 	jrne 2$
      001E84                       5528 4$:  
      009BD2 92 AF            [ 1] 5529 	ld a,#TK_INTGR
      009BD4 00               [ 4] 5530 	ret
                                   5531 
                                   5532 ;------------------------------
                                   5533 ; BASIC: RSHIFT(expr1,expr2)
                                   5534 ; logical shift right expr1 by 
                                   5535 ; expr2 bits.
                                   5536 ; output:
                                   5537 ; 	A 		TK_INTGR
                                   5538 ;   X 		result 
                                   5539 ;------------------------------
      001E87                       5540 rshift:
      009BD5 17 90 F7         [ 4] 5541 	call func_args
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BD8 5C 90            [ 1] 5542 	cp a,#2 
      009BDA 5C 90            [ 1] 5543 	jreq 1$
      009BDC C3 00 1F         [ 2] 5544 	jp syntax_error
      009BDF 2B F1            [ 2] 5545 1$: popw y  
      009BE1 81               [ 2] 5546 	popw x
      009BE2 90 5D            [ 2] 5547 	tnzw y 
      009BE2 72 01            [ 1] 5548 	jreq 4$
      009BE4 00               [ 2] 5549 2$:	srlw x 
      009BE5 24 07            [ 2] 5550 	decw y 
      009BE7 27 05            [ 1] 5551 	jrne 2$
      001E9D                       5552 4$:  
      009BE9 A6 07            [ 1] 5553 	ld a,#TK_INTGR
      009BEB CC               [ 4] 5554 	ret
                                   5555 
                                   5556 ;--------------------------
                                   5557 ; BASIC: FCPU integer
                                   5558 ; set CPU frequency 
                                   5559 ;-------------------------- 
                                   5560 
      001EA0                       5561 fcpu:
      009BEC 88 F7            [ 1] 5562 	ld a,#TK_INTGR
      009BEE CD 10 6B         [ 4] 5563 	call expect 
      009BEE CD               [ 1] 5564 	ld a,xl 
      009BEF 89 E7            [ 1] 5565 	and a,#7 
      009BF1 A1 02 27         [ 1] 5566 	ld CLK_CKDIVR,a 
      009BF4 03               [ 4] 5567 	ret 
                                   5568 
                                   5569 ;------------------------------
                                   5570 ; BASIC: PMODE pin#, mode 
                                   5571 ; Arduino pin. 
                                   5572 ; define pin as input or output
                                   5573 ; pin#: {0..15}
                                   5574 ; mode: INPUT|OUTPUT  
                                   5575 ;------------------------------
                           000001  5576 	PINNO=1
                           000001  5577 	VSIZE=1
      001EAC                       5578 pin_mode:
      001EAC                       5579 	_vars VSIZE 
      009BF5 CC 88            [ 2]    1     sub sp,#VSIZE 
      009BF7 F5 90 93         [ 4] 5580 	call arg_list 
      009BFA CD 9A            [ 1] 5581 	cp a,#2 
      009BFC 9B 25            [ 1] 5582 	jreq 1$
      009BFE 05 A6 09         [ 2] 5583 	jp syntax_error 
      009C01 CC 88            [ 2] 5584 1$: popw y ; mode 
      009C03 F7               [ 2] 5585 	popw x ; Dx pin 
      009C04 CD 1E ED         [ 4] 5586 	call select_pin 
      009C04 CD 9B            [ 1] 5587 	ld (PINNO,sp),a  
      009C06 B1 CE            [ 1] 5588 	ld a,#1 
      009C08 00 1F            [ 1] 5589 	tnz (PINNO,sp)
      009C0A 72 B0            [ 1] 5590 	jreq 4$
      009C0C 00               [ 1] 5591 2$:	sll a 
      009C0D 1D CD            [ 1] 5592 	dec (PINNO,sp)
      009C0F 8A 3C            [ 1] 5593 	jrne 2$ 
      009C11 81 01            [ 1] 5594 	ld (PINNO,sp),a
      009C12 EA 03            [ 1] 5595 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C12 52 03            [ 1] 5596 	ld (GPIO_CR1,x),a 
      009C14 CD 89 E7 A1      [ 2] 5597 4$:	cpw y,#OUTP 
      009C18 00 27            [ 1] 5598 	jreq 6$
                                   5599 ; input mode
      009C1A 20 A1            [ 1] 5600 	ld a,(PINNO,sp)
      009C1C 02               [ 1] 5601 	cpl a 
      009C1D 27 03            [ 1] 5602 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C1F CC 88            [ 2] 5603 	jra 9$
      001EDE                       5604 6$: ;output mode  
      009C21 F5 90            [ 1] 5605 	ld a,(PINNO,sp)
      009C23 93 55            [ 1] 5606 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C25 00 04            [ 1] 5607 	ld (GPIO_CR2,x),a 
      009C27 00 02            [ 1] 5608 	ld a,(PINNO,sp)
      009C29 CD 9A            [ 1] 5609 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C2B 9B 25            [ 1] 5610 9$:	ld (GPIO_DDR,x),a 
      001EEA                       5611 	_drop VSIZE 
      009C2D 05 A6            [ 2]    1     addw sp,#VSIZE 
      009C2F 09               [ 4] 5612 	ret
                                   5613 
                                   5614 ;------------------------
                                   5615 ; select Arduino pin 
                                   5616 ; input:
                                   5617 ;   X 	 {0..15} Arduino Dx 
                                   5618 ; output:
                                   5619 ;   A     stm8s208 pin 
                                   5620 ;   X     base address s208 GPIO port 
                                   5621 ;---------------------------
      001EED                       5622 select_pin:
      009C30 CC               [ 2] 5623 	sllw x 
      009C31 88 F7 FD         [ 2] 5624 	addw x,#arduino_to_8s208 
      009C33 FE               [ 2] 5625 	ldw x,(x)
      009C33 CE               [ 1] 5626 	ld a,xl 
      009C34 00               [ 1] 5627 	push a 
      009C35 17               [ 1] 5628 	swapw x 
      009C36 C6 00            [ 1] 5629 	ld a,#5 
      009C38 19               [ 4] 5630 	mul x,a 
      009C39 20 0A 00         [ 2] 5631 	addw x,#GPIO_BASE 
      009C3B 84               [ 1] 5632 	pop a 
      009C3B AE               [ 4] 5633 	ret 
                                   5634 ; translation from Arduino D0..D15 to stm8s208rb 
      001EFD                       5635 arduino_to_8s208:
      009C3C 01 00                 5636 .byte 3,6 ; D0 
      009C3E 4F CF                 5637 .byte 3,5 ; D1 
      009C40 00 17                 5638 .byte 4,0 ; D2 
      009C42 C7 00                 5639 .byte 2,1 ; D3
      009C44 19 00                 5640 .byte 6,0 ; D4
      009C45 02 02                 5641 .byte 2,2 ; D5
      009C45 1F 01                 5642 .byte 2,3 ; D6
      009C47 6B 03                 5643 .byte 3,1 ; D7
      009C49 CD 81                 5644 .byte 3,3 ; D8
      009C4B A8 CD                 5645 .byte 2,4 ; D9
      009C4D 82 23                 5646 .byte 4,5 ; D10
      009C4F AE 00                 5647 .byte 2,6 ; D11
      009C51 80 CD                 5648 .byte 2,7 ; D12
      009C53 9A 27                 5649 .byte 2,5 ; D13
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C55 CD 9A                 5650 .byte 4,2 ; D14
      009C57 0C C6                 5651 .byte 4,1 ; D15
                                   5652 
                                   5653 
                                   5654 ;------------------------------
                                   5655 ; BASIC: RND(expr)
                                   5656 ; return random number 
                                   5657 ; between 1 and expr inclusive
                                   5658 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5659 ; input:
                                   5660 ; 	none 
                                   5661 ; output:
                                   5662 ;	X 		random positive integer 
                                   5663 ;------------------------------
      001F1D                       5664 random:
      009C59 00 19 C0         [ 4] 5665 	call func_args 
      009C5C 00 1C            [ 1] 5666 	cp a,#1
      009C5E C6 00            [ 1] 5667 	jreq 1$
      009C60 18 C2 00         [ 2] 5668 	jp syntax_error
      001F27                       5669 1$:  
      009C63 1B C6            [ 1] 5670 	ld a,#0x80 
      009C65 00 17            [ 1] 5671 	bcp a,(1,sp)
      009C67 C2 00            [ 1] 5672 	jreq 2$
      009C69 1A 2B            [ 1] 5673 	ld a,#ERR_BAD_VALUE
      009C6B E0 7B 03         [ 2] 5674 	jp tb_error
      001F32                       5675 2$: 
                                   5676 ; acc16=(x<<5)^x 
      009C6E 1E 01 C7         [ 2] 5677 	ldw x,seedx 
      009C71 00               [ 2] 5678 	sllw x 
      009C72 1C               [ 2] 5679 	sllw x 
      009C73 CF               [ 2] 5680 	sllw x 
      009C74 00               [ 2] 5681 	sllw x 
      009C75 1A               [ 2] 5682 	sllw x 
      009C76 5B               [ 1] 5683 	ld a,xh 
      009C77 03 81 12         [ 1] 5684 	xor a,seedx 
      009C79 C7 00 0C         [ 1] 5685 	ld acc16,a 
      009C79 52               [ 1] 5686 	ld a,xl 
      009C7A 02 5F 1F         [ 1] 5687 	xor a,seedx+1 
      009C7D 01 CF 00         [ 1] 5688 	ld acc8,a 
                                   5689 ; seedx=seedy 
      009C80 18 35 01         [ 2] 5690 	ldw x,seedy 
      009C83 00 17 12         [ 2] 5691 	ldw seedx,x  
                                   5692 ; seedy=seedy^(seedy>>1)
      009C85 90 54            [ 2] 5693 	srlw y 
      009C85 5F 92            [ 1] 5694 	ld a,yh 
      009C87 AF 00 17         [ 1] 5695 	xor a,seedy 
      009C8A 27 3B 14         [ 1] 5696 	ld seedy,a  
      009C8C 90 9F            [ 1] 5697 	ld a,yl 
      009C8C 92 AF 00         [ 1] 5698 	xor a,seedy+1 
      009C8F 17 27 06         [ 1] 5699 	ld seedy+1,a 
                                   5700 ; acc16>>3 
      009C92 CD 83 20         [ 2] 5701 	ldw x,acc16 
      009C95 5C               [ 2] 5702 	srlw x 
      009C96 20               [ 2] 5703 	srlw x 
      009C97 F4               [ 2] 5704 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5705 ; x=acc16^x 
      009C98 5C               [ 1] 5706 	ld a,xh 
      009C99 A6 20 CD         [ 1] 5707 	xor a,acc16 
      009C9C 83               [ 1] 5708 	ld xh,a 
      009C9D 20               [ 1] 5709 	ld a,xl 
      009C9E 92 AF 00         [ 1] 5710 	xor a,acc8 
      009CA1 17               [ 1] 5711 	ld xl,a 
                                   5712 ; seedy=x^seedy 
      009CA2 90 95 5C         [ 1] 5713 	xor a,seedy+1
      009CA5 92               [ 1] 5714 	ld xl,a 
      009CA6 AF               [ 1] 5715 	ld a,xh 
      009CA7 00 17 5C         [ 1] 5716 	xor a,seedy
      009CAA 90               [ 1] 5717 	ld xh,a 
      009CAB 97 90 89         [ 2] 5718 	ldw seedy,x 
                                   5719 ; return seedy modulo expr + 1 
      009CAE 72 FB            [ 2] 5720 	popw y 
      009CB0 01               [ 2] 5721 	divw x,y 
      009CB1 CD               [ 1] 5722 	ldw x,y 
      009CB2 9A               [ 2] 5723 	incw x 
      001F81                       5724 10$:
      009CB3 27 CD            [ 1] 5725 	ld a,#TK_INTGR
      009CB5 9A               [ 4] 5726 	ret 
                                   5727 
                                   5728 ;---------------------------------
                                   5729 ; BASIC: WORDS 
                                   5730 ; affiche la listes des mots du
                                   5731 ; dictionnaire ainsi que le nombre
                                   5732 ; de mots.
                                   5733 ;---------------------------------
                           000001  5734 	WLEN=1 ; word length
                           000002  5735 	LLEN=2 ; character sent to console
                           000003  5736 	WCNT=3 ; count words printed 
                           000003  5737 	VSIZE=3 
      001F84                       5738 words:
      001F84                       5739 	_vars VSIZE
      009CB6 0C 85            [ 2]    1     sub sp,#VSIZE 
      009CB8 CD 8A            [ 1] 5740 	clr (LLEN,sp)
      009CBA 3C A6            [ 1] 5741 	clr (WCNT,sp)
      009CBC 0D CD 83 20      [ 2] 5742 	ldw y,#kword_dict+2
      009CC0 1E               [ 1] 5743 0$:	ldw x,y
      009CC1 01               [ 1] 5744 	ld a,(x)
      009CC2 5C 1F            [ 1] 5745 	and a,#15 
      009CC4 01 20            [ 1] 5746 	ld (WLEN,sp),a 
      009CC6 BE 03            [ 1] 5747 	inc (WCNT,sp)
      009CC7 5C               [ 2] 5748 1$:	incw x 
      009CC7 1E               [ 1] 5749 	ld a,(x)
      009CC8 01 CD 8A         [ 4] 5750 	call putc 
      009CCB 3C AE            [ 1] 5751 	inc (LLEN,sp)
      009CCD 9C E6            [ 1] 5752 	dec (WLEN,sp)
      009CCF CD 83            [ 1] 5753 	jrne 1$
      009CD1 33 CD            [ 1] 5754 	ld a,#70
      009CD3 9A 67            [ 1] 5755 	cp a,(LLEN,sp)
      009CD5 5F 35            [ 1] 5756 	jrmi 2$   
      009CD7 0A 00            [ 1] 5757 	ld a,#SPACE 
      009CD9 0B CD 8A         [ 4] 5758 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009CDC 4C AE            [ 1] 5759 	inc (LLEN,sp) 
      009CDE 9C EE            [ 2] 5760 	jra 3$
      009CE0 CD 83            [ 1] 5761 2$: ld a,#CR 
      009CE2 33 5B 02         [ 4] 5762 	call putc 
      009CE5 81 20            [ 1] 5763 	clr (LLEN,sp)
      009CE7 66 69 6C 65      [ 2] 5764 3$:	subw y,#2 
      009CEB 73 0A            [ 2] 5765 	ldw y,(y)
      009CED 00 20            [ 1] 5766 	jrne 0$ 
      009CEF 62 79            [ 1] 5767 	ld a,#CR 
      009CF1 74 65 73         [ 4] 5768 	call putc  
      009CF4 20               [ 1] 5769 	clrw x 
      009CF5 66 72            [ 1] 5770 	ld a,(WCNT,sp)
      009CF7 65               [ 1] 5771 	ld xl,a 
      009CF8 65 0A 00         [ 4] 5772 	call print_int 
      009CFB AE 1F D4         [ 2] 5773 	ldw x,#words_count_msg
      009CFB 52 02 72         [ 4] 5774 	call puts 
      001FD1                       5775 	_drop VSIZE 
      009CFE 5F 00            [ 2]    1     addw sp,#VSIZE 
      009D00 17               [ 4] 5776 	ret 
      009D01 CD 91 F6 A1 84 27 03  5777 words_count_msg: .asciz " words in dictionary\n"
             CC 88 F5 1F 01 CD 89
             E7 A1 09 27 02 20 19
             CD
                                   5778 
                                   5779 
                                   5780 ;-----------------------------
                                   5781 ; BASIC: TIMER expr 
                                   5782 ; initialize count down timer 
                                   5783 ;-----------------------------
      001FEA                       5784 set_timer:
      009D17 91 F6 A1         [ 4] 5785 	call arg_list
      009D1A 84 27            [ 1] 5786 	cp a,#1 
      009D1C 03 CC            [ 1] 5787 	jreq 1$
      009D1E 88 F5 9F         [ 2] 5788 	jp syntax_error
      001FF4                       5789 1$: 
      009D21 1E               [ 2] 5790 	popw x 
      009D22 01 CF 00         [ 2] 5791 	ldw timer,x 
      009D25 18               [ 4] 5792 	ret 
                                   5793 
                                   5794 ;------------------------------
                                   5795 ; BASIC: TIMEOUT 
                                   5796 ; return state of timer 
                                   5797 ;------------------------------
      001FF9                       5798 timeout:
      009D26 5F CD 82         [ 2] 5799 	ldw x,timer 
      001FFC                       5800 logical_complement:
      009D29 4D               [ 2] 5801 	cplw x 
      009D2A 1E 01 5C         [ 2] 5802 	cpw x,#-1
      009D2D 20 DC            [ 1] 5803 	jreq 2$
      009D2F 5F               [ 1] 5804 	clrw x 
      009D2F 5B 02            [ 1] 5805 2$:	ld a,#TK_INTGR
      009D31 81               [ 4] 5806 	ret 
                                   5807 
                                   5808 ;--------------------------------
                                   5809 ; BASIC NOT(expr) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5810 ; return logical complement of expr
                                   5811 ;--------------------------------
      009D32                       5812 func_not:
      009D32 CD 90 F8         [ 4] 5813 	call func_args  
      009D35 A1 01            [ 1] 5814 	cp a,#1
      009D37 27 03            [ 1] 5815 	jreq 1$
      009D39 CC 88 F5         [ 2] 5816 	jp syntax_error
      009D3C 85               [ 2] 5817 1$:	popw x 
      009D3D 9F A4            [ 2] 5818 	jra logical_complement
                                   5819 
                                   5820 
                                   5821 
                                   5822 ;-----------------------------------
                                   5823 ; BASIC: IWDGEN expr1 
                                   5824 ; enable independant watchdog timer
                                   5825 ; expr1 is delay in multiple of 62.5µsec
                                   5826 ; expr1 -> {1..16383}
                                   5827 ;-----------------------------------
      002013                       5828 enable_iwdg:
      009D3F 7F 97 A6         [ 4] 5829 	call arg_list
      009D42 03 81            [ 1] 5830 	cp a,#1 
      009D44 27 03            [ 1] 5831 	jreq 1$
      009D44 A6 07 CD         [ 2] 5832 	jp syntax_error 
      009D47 90               [ 2] 5833 1$: popw x 
      009D48 EB CD            [ 1] 5834 	push #0
      009D4A 89 E7 A1 02      [ 1] 5835 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D4E 27               [ 1] 5836 	ld a,xh 
      009D4F 07 A1            [ 1] 5837 	and a,#0x3f
      009D51 03               [ 1] 5838 	ld xh,a  
      009D52 27 06 CC         [ 2] 5839 2$:	cpw x,#255
      009D55 88 F5            [ 2] 5840 	jrule 3$
      009D57 0C 01            [ 1] 5841 	inc (1,sp)
      009D57 F6               [ 1] 5842 	rcf 
      009D58 5F               [ 2] 5843 	rrcw x 
      009D59 97 F5            [ 2] 5844 	jra 2$
      009D5A 35 55 50 E0      [ 1] 5845 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D5A 89               [ 1] 5846 	pop a  
      009D5B A6 08 CD         [ 1] 5847 	ld IWDG_PR,a 
      009D5E 90               [ 1] 5848 	ld a,xl
      009D5F EB               [ 1] 5849 	dec a 
      009D60 85 A6 84 81      [ 1] 5850 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D64 C7 50 E2         [ 1] 5851 	ld IWDG_RLR,a 
      009D64 CD 83 29 5F      [ 1] 5852 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D68 97               [ 4] 5853 	ret 
                                   5854 
                                   5855 
                                   5856 ;-----------------------------------
                                   5857 ; BASIC: IWDGREF  
                                   5858 ; refresh independant watchdog count down 
                                   5859 ; timer before it reset MCU. 
                                   5860 ;-----------------------------------
      002049                       5861 refresh_iwdg:
      009D69 A6 84 81 E0      [ 1] 5862 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D6C 81               [ 4] 5863 	ret 
                                   5864 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5865 
                                   5866 ;-------------------------------------
                                   5867 ; BASIC: LOG(expr)
                                   5868 ; return logarithm base 2 of expr 
                                   5869 ; this is the position of most significant
                                   5870 ; bit set. 
                                   5871 ; input: 
                                   5872 ; output:
                                   5873 ;   X     log2 
                                   5874 ;   A     TK_INTGR 
                                   5875 ;*********************************
      00204E                       5876 log2:
      009D6C 5F 72 5D         [ 4] 5877 	call func_args 
      009D6F 00 26            [ 1] 5878 	cp a,#1 
      009D71 27 01            [ 1] 5879 	jreq 1$
      009D73 53 A6 84         [ 2] 5880 	jp syntax_error 
      009D76 81               [ 2] 5881 1$: popw x 
      009D77                       5882 leading_one:
      009D77 CD               [ 2] 5883 	tnzw x 
      009D78 90 F8            [ 1] 5884 	jreq 4$
      009D7A A1 02            [ 1] 5885 	ld a,#15 
      009D7C 27               [ 2] 5886 2$: rlcw x 
      009D7D 03 CC            [ 1] 5887     jrc 3$
      009D7F 88               [ 1] 5888 	dec a 
      009D80 F5 FA            [ 2] 5889 	jra 2$
      009D81 5F               [ 1] 5890 3$: clrw x 
      009D81 1E               [ 1] 5891     ld xl,a
      009D82 03 2B            [ 1] 5892 4$:	ld a,#TK_INTGR
      009D84 17               [ 4] 5893 	ret 
                                   5894 
                                   5895 ;-----------------------------------
                                   5896 ; BASIC: BIT(expr) 
                                   5897 ; expr ->{0..15}
                                   5898 ; return 2^expr 
                                   5899 ; output:
                                   5900 ;    x    2^expr 
                                   5901 ;-----------------------------------
      002069                       5902 bitmask:
      009D85 A3 00 09         [ 4] 5903     call func_args 
      009D88 2A 12            [ 1] 5904 	cp a,#1
      009D8A A6 05            [ 1] 5905 	jreq 1$
      009D8C 42 1C 50         [ 2] 5906 	jp syntax_error 
      009D8F 00               [ 2] 5907 1$: popw x 
      009D90 1F               [ 1] 5908 	ld a,xl 
      009D91 03 1E            [ 1] 5909 	and a,#15
      009D93 01               [ 1] 5910 	clrw x 
      009D94 72               [ 2] 5911 	incw x 
      009D95 FB               [ 1] 5912 2$: tnz a 
      009D96 03 A6            [ 1] 5913 	jreq 3$
      009D98 84               [ 2] 5914 	slaw x 
      009D99 5B               [ 1] 5915 	dec a 
      009D9A 04 81            [ 2] 5916 	jra 2$ 
      009D9C A6 84            [ 1] 5917 3$: ld a,#TK_INTGR
      009D9C A6               [ 4] 5918 	ret 
                                   5919 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5920 ;------------------------------
                                   5921 ; BASIC: INVERT(expr)
                                   5922 ; 1's complement 
                                   5923 ;--------------------------------
      002083                       5924 invert:
      009D9D 0A CC 88         [ 4] 5925 	call func_args
      009DA0 F7 01            [ 1] 5926 	cp a,#1 
      009DA1 27 03            [ 1] 5927 	jreq 1$
      009DA1 AE A7 80         [ 2] 5928 	jp syntax_error
      009DA4 A6               [ 2] 5929 1$: popw x  
      009DA5 84               [ 2] 5930 	cplw x 
      009DA6 81 84            [ 1] 5931 	ld a,#TK_INTGR 
      009DA7 81               [ 4] 5932 	ret 
                                   5933 
                                   5934 ;------------------------------
                                   5935 ; BASIC: DO 
                                   5936 ; initiate a DO ... UNTIL loop 
                                   5937 ;------------------------------
                           000003  5938 	DOLP_ADR=3 
                           000005  5939 	DOLP_INW=5
                           000004  5940 	VSIZE=4 
      002092                       5941 do_loop:
      009DA7 90               [ 2] 5942 	popw x 
      002093                       5943 	_vars VSIZE 
      009DA8 89 CD            [ 2]    1     sub sp,#VSIZE 
      009DAA 90               [ 2] 5944 	pushw x 
      009DAB F8 A1 01 27      [ 2] 5945 	ldw y,basicptr 
      009DAF 07 A1            [ 2] 5946 	ldw (DOLP_ADR,sp),y
      009DB1 02 27 03 CC      [ 2] 5947 	ldw y,in.w 
      009DB5 88 F5            [ 2] 5948 	ldw (DOLP_INW,sp),y
      009DB7 90 85 A1 01      [ 1] 5949 	inc loop_depth 
      009DBB 27               [ 4] 5950 	ret 
                                   5951 
                                   5952 ;--------------------------------
                                   5953 ; BASIC: UNTIL expr 
                                   5954 ; loop if exprssion is false 
                                   5955 ; else terminate loop
                                   5956 ;--------------------------------
      0020A7                       5957 until: 
      009DBC 02 85 51 90      [ 1] 5958 	tnz loop_depth 
      009DC0 FD 90            [ 1] 5959 	jrne 1$ 
      009DC2 85 81 75         [ 2] 5960 	jp syntax_error 
      009DC4                       5961 1$: 
      009DC4 72 0D 52         [ 4] 5962 	call relation 
      009DC7 30 FB            [ 1] 5963 	cp a,#TK_INTGR
      009DC9 8E CC            [ 1] 5964 	jreq 2$
      009DCB 86 4B 75         [ 2] 5965 	jp syntax_error
      009DCD                       5966 2$: 
      009DCD 72               [ 2] 5967 	tnzw x 
      009DCE 01 00            [ 1] 5968 	jrne 9$
      009DD0 24 07            [ 2] 5969 	ldw x,(DOLP_ADR,sp)
      009DD2 27 05 A6         [ 2] 5970 	ldw basicptr,x 
      009DD5 07 CC            [ 1] 5971 	ld a,(2,x)
      009DD7 88 F7 03         [ 1] 5972 	ld count,a 
      009DD9 1E 05            [ 2] 5973 	ldw x,(DOLP_INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009DD9 CD 89 E7         [ 2] 5974 	ldw in.w,x 
      009DDC 26               [ 4] 5975 	ret 
      0020CD                       5976 9$:	; remove loop data from stack  
      009DDD 08               [ 2] 5977 	popw x
      0020CE                       5978 	_drop VSIZE
      009DDE AE 40            [ 2]    1     addw sp,#VSIZE 
      009DE0 00 CD 83 33      [ 1] 5979 	dec loop_depth 
      009DE4 4F               [ 2] 5980 	jp (x)
                                   5981 
                                   5982 ;--------------------------
                                   5983 ; BASIC: PRTA...PRTI  
                                   5984 ;  return constant value 
                                   5985 ;  PORT  offset in GPIO
                                   5986 ;  array
                                   5987 ;---------------------------
      0020D5                       5988 const_porta:
      009DE5 81 00 00         [ 2] 5989 	ldw x,#0
      009DE6 A6 84            [ 1] 5990 	ld a,#TK_INTGR 
      009DE6 A1               [ 4] 5991 	ret 
      0020DB                       5992 const_portb:
      009DE7 02 27 03         [ 2] 5993 	ldw x,#1
      009DEA CC 88            [ 1] 5994 	ld a,#TK_INTGR 
      009DEC F5               [ 4] 5995 	ret 
      009DED                       5996 const_portc:
      009DED 7D 26 09         [ 2] 5997 	ldw x,#2
      009DF0 CD 87            [ 1] 5998 	ld a,#TK_INTGR 
      009DF2 14               [ 4] 5999 	ret 
      0020E7                       6000 const_portd:
      009DF3 55 00 04         [ 2] 6001 	ldw x,#3
      009DF6 00 02            [ 1] 6002 	ld a,#TK_INTGR 
      009DF8 81               [ 4] 6003 	ret 
      0020ED                       6004 const_porte:
      009DF9 89 90 93         [ 2] 6005 	ldw x,#4
      009DFC CD 9A            [ 1] 6006 	ld a,#TK_INTGR 
      009DFE 9B               [ 4] 6007 	ret 
      0020F3                       6008 const_portf:
      009DFF 25 05 A6         [ 2] 6009 	ldw x,#5
      009E02 09 CC            [ 1] 6010 	ld a,#TK_INTGR 
      009E04 88               [ 4] 6011 	ret 
      0020F9                       6012 const_portg:
      009E05 F7 00 06         [ 2] 6013 	ldw x,#6
      009E06 A6 84            [ 1] 6014 	ld a,#TK_INTGR 
      009E06 55               [ 4] 6015 	ret 
      0020FF                       6016 const_porth:
      009E07 00 04 00         [ 2] 6017 	ldw x,#7
      009E0A 02 72            [ 1] 6018 	ld a,#TK_INTGR 
      009E0C 5F               [ 4] 6019 	ret 
      002105                       6020 const_porti:
      009E0D 00 17 AE         [ 2] 6021 	ldw x,#8
      009E10 40 00            [ 1] 6022 	ld a,#TK_INTGR 
      009E12 CF               [ 4] 6023 	ret 
                                   6024 
                                   6025 ;-------------------------------
                                   6026 ; following return constant 
                                   6027 ; related to GPIO register offset 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6028 ;---------------------------------
      00210B                       6029 const_odr:
      009E13 00 18            [ 1] 6030 	ld a,#TK_INTGR 
      009E15 1E 01 CD         [ 2] 6031 	ldw x,#GPIO_ODR
      009E18 84               [ 4] 6032 	ret 
      002111                       6033 const_idr:
      009E19 12 5C            [ 1] 6034 	ld a,#TK_INTGR 
      009E1B 90 85 89         [ 2] 6035 	ldw x,#GPIO_IDR
      009E1E 5F               [ 4] 6036 	ret 
      002117                       6037 const_ddr:
      009E1F CD 82            [ 1] 6038 	ld a,#TK_INTGR 
      009E21 C2 5B 02         [ 2] 6039 	ldw x,#GPIO_DDR
      009E24 81               [ 4] 6040 	ret 
      009E25                       6041 const_cr1:
      009E25 72 0D            [ 1] 6042 	ld a,#TK_INTGR 
      009E27 52 30 FB         [ 2] 6043 	ldw x,#GPIO_CR1
      009E2A 72               [ 4] 6044 	ret 
      002123                       6045 const_cr2:
      009E2B 16 00            [ 1] 6046 	ld a,#TK_INTGR 
      009E2D 24 8E 81         [ 2] 6047 	ldw x,#GPIO_CR2
      009E30 81               [ 4] 6048 	ret 
                                   6049 ;-------------------------
                                   6050 ;  constant for port mode
                                   6051 ;  used by PMODE 
                                   6052 ;  input or output
                                   6053 ;------------------------
      002129                       6054 const_output:
      009E30 CD 91            [ 1] 6055 	ld a,#TK_INTGR 
      009E32 F6 A1 84         [ 2] 6056 	ldw x,#OUTP
      009E35 27               [ 4] 6057 	ret 
      00212F                       6058 const_input:
      009E36 03 CC            [ 1] 6059 	ld a,#TK_INTGR 
      009E38 88 F5 00         [ 2] 6060 	ldw x,#INP 
      009E3A 81               [ 4] 6061 	ret 
                                   6062 ;-----------------------
                                   6063 ; memory area constants
                                   6064 ;-----------------------
      002135                       6065 const_eeprom_base:
      009E3A 5D 27            [ 1] 6066 	ld a,#TK_INTGR 
      009E3C 04 8F 5A         [ 2] 6067 	ldw x,#EEPROM_BASE 
      009E3F 26               [ 4] 6068 	ret 
                                   6069 
                                   6070 ;---------------------------
                                   6071 ; BASIC: DATA 
                                   6072 ; when the interpreter find 
                                   6073 ; a DATA line it skip it.
                                   6074 ;---------------------------
      00213B                       6075 data:
      009E40 F9 4F 81 00 01   [ 1] 6076 	mov in,count 
      009E43 81               [ 4] 6077 	ret 
                                   6078 
                                   6079 ;---------------------------
                                   6080 ; BASIC: DATLN  *expr*
                                   6081 ; set DATA pointer at line# 
                                   6082 ; specified by *expr* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6083 ;---------------------------
      002141                       6084 data_line:
      009E43 CD 91 F6         [ 4] 6085 	call expression
      009E46 A1 84            [ 1] 6086 	cp a,#TK_INTGR
      009E48 27 03            [ 1] 6087 	jreq 1$
      009E4A CC 88 F5         [ 2] 6088 	jp syntax_error 
      009E4D CD 04 00         [ 4] 6089 1$: call search_lineno
      009E4D A3               [ 2] 6090 	tnzw x 
      009E4E 14 00            [ 1] 6091 	jrne 3$
      009E50 2B 0C            [ 1] 6092 2$:	ld a,#ERR_NO_LINE 
      009E52 35 0F 50         [ 2] 6093 	jp tb_error
      002156                       6094 3$: ; check if valid data line 
      009E55 F2 A6            [ 1] 6095     ldw y,x 
      009E57 1E 62            [ 2] 6096 	ldw x,(4,x)
      009E59 A6 10 62         [ 2] 6097 	cpw x,#data 
      009E5C 20 1E            [ 1] 6098 	jrne 2$ 
      009E5E 90 CF 00 06      [ 2] 6099 	ldw data_ptr,y
      009E5E A3 08 00         [ 1] 6100 	ld a,(2,y)
      009E61 2B 09 35         [ 1] 6101 	ld data_len,a 
      009E64 0E 50 F2 A6      [ 1] 6102 	mov data_ofs,#FIRST_DATA_ITEM 
      009E68 50               [ 4] 6103 	ret
                                   6104 
                                   6105 ;---------------------------------
                                   6106 ; BASIC: RESTORE 
                                   6107 ; set data_ptr to first data line
                                   6108 ; if not DATA found pointer set to
                                   6109 ; zero 
                                   6110 ;---------------------------------
      00216E                       6111 restore:
      009E69 62 20 10 06      [ 1] 6112 	clr data_ptr 
      009E6C 72 5F 00 07      [ 1] 6113 	clr data_ptr+1
      009E6C 35 07 50 F2      [ 1] 6114 	clr data_ofs 
      009E70 72 5F 00 09      [ 1] 6115 	clr data_len
      009E70 A3 00 40         [ 2] 6116 	ldw x,txtbgn
      002181                       6117 data_search_loop: 	
      009E73 23 07 72         [ 2] 6118 	cpw x,txtend
      009E76 5C 50            [ 1] 6119 	jruge 9$
      009E78 F2 54            [ 1] 6120 	ldw y,x 
      009E7A 20 F4            [ 2] 6121 	ldw x,(4,x)
      009E7C A3 21 3B         [ 2] 6122 	cpw x,#data 
      009E7C 9F 4A            [ 1] 6123 	jrne try_next_line 
      009E7E 27 01 4A 06      [ 2] 6124 	ldw data_ptr,y 
      009E81 90 E6 02         [ 1] 6125 	ld a,(2,y)
      009E81 A4 3E C7         [ 1] 6126 	ld data_len,a 
      009E84 50 F1 72 18      [ 1] 6127 	mov data_ofs,#FIRST_DATA_ITEM
      009E88 50 F0 8E 81      [ 1] 6128 9$:	tnz data_len 
      009E8C 26 05            [ 1] 6129     jrne 10$
      009E8C CE 00            [ 1] 6130 	ld a,#ERR_NO_DATA 
      009E8E 0F A6 84         [ 2] 6131 	jp tb_error 
      009E91 81               [ 4] 6132 10$:ret
      009E92                       6133 try_next_line:
      009E92 CD               [ 1] 6134 	ldw x,y 
      009E93 90 F8            [ 1] 6135 	ld a,(2,x)
      009E95 A1 01 27         [ 1] 6136 	ld acc8,a 
      009E98 03 CC 88 F5      [ 1] 6137 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009E9C 72 BB 00 0C      [ 2] 6138 	addw x,acc16 
      009E9C 85 9E            [ 2] 6139 	jra data_search_loop
                                   6140 
                                   6141 
                                   6142 ;---------------------------------
                                   6143 ; BASIC: READ 
                                   6144 ; return next data item | 0 
                                   6145 ;---------------------------------
                           000001  6146 	CTX_BPTR=1 
                           000003  6147 	CTX_IN=3 
                           000004  6148 	CTX_COUNT=4 
                           000005  6149 	XSAVE=5
                           000006  6150 	VSIZE=6
      0021B9                       6151 read:
      0021B9                       6152 	_vars  VSIZE 
      009E9E A5 80            [ 2]    1     sub sp,#VSIZE 
      0021BB                       6153 read01:	
      009EA0 27 01 50         [ 1] 6154 	ld a,data_ofs
      009EA3 A6 84 81         [ 1] 6155 	cp a,data_len 
      009EA6 27 37            [ 1] 6156 	jreq 2$ ; end of line  
      009EA6 CD 90 F8         [ 4] 6157 	call save_context
      009EA9 A1 02 27         [ 2] 6158 	ldw x,data_ptr 
      009EAC 03 CC 88         [ 2] 6159 	ldw basicptr,x 
      009EAF F5 85 9E 14 01   [ 1] 6160 	mov in,data_ofs 
      009EB4 95 9F 14 02 97   [ 1] 6161 	mov count,data_len  
      009EB9 5B 02 A6         [ 4] 6162 	call expression 
      009EBC 84 81            [ 1] 6163 	cp a,#TK_INTGR 
      009EBE 27 03            [ 1] 6164 	jreq 1$ 
      009EBE CD 90 F8         [ 2] 6165 	jp syntax_error 
      0021E0                       6166 1$:
      009EC1 A1 02            [ 2] 6167 	ldw (XSAVE,SP),x
      009EC3 27 03 CC         [ 4] 6168 	call next_token ; skip comma
      009EC6 88 F5 04         [ 2] 6169 	ldw x,basicptr 
      009EC8 CF 00 06         [ 2] 6170 	ldw data_ptr,x 
      009EC8 85 9E 1A 01 95   [ 1] 6171 	mov data_ofs,in 
      009ECD 9F 1A 02         [ 4] 6172 	call rest_context
      009ED0 97 5B            [ 2] 6173 	ldw x,(XSAVE,sp)
      009ED2 02 A6            [ 1] 6174 	ld a,#TK_INTGR
      0021F7                       6175 	_drop VSIZE 
      009ED4 84 81            [ 2]    1     addw sp,#VSIZE 
      009ED6 81               [ 4] 6176 	ret 
      0021FA                       6177 2$: ; end of line reached 
      009ED6 CD 90 F8 A1      [ 2] 6178 	ldw y, data_ptr 
      009EDA 02 27 03 CC      [ 1] 6179 	clr data_ptr
      009EDE 88 F5 00 07      [ 1] 6180 	clr data_ptr+1   
      009EE0 72 5F 00 08      [ 1] 6181 	clr data_ofs 
      009EE0 85 9E 18 01      [ 1] 6182 	clr data_len 
      009EE4 95 9F 18         [ 4] 6183 	call try_next_line 
      009EE7 02 97            [ 2] 6184 	jra read01
                                   6185 
                                   6186 
                                   6187 ;---------------------------------
                                   6188 ; BASIC: SPIEN clkdiv, 0|1  
                                   6189 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6190 ; if clkdiv==-1 disable SPI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6191 ; 0|1 -> disable|enable  
                                   6192 ;--------------------------------- 
                           000005  6193 SPI_CS_BIT=5
      002213                       6194 spi_enable:
      009EE9 5B 02 A6         [ 4] 6195 	call arg_list 
      009EEC 84 81            [ 1] 6196 	cp a,#2
      009EEE 27 03            [ 1] 6197 	jreq 1$
      009EEE CD 90 F8         [ 2] 6198 	jp syntax_error 
      00221D                       6199 1$: 
      009EF1 A1 02 27 03      [ 1] 6200 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009EF5 CC               [ 2] 6201 	popw x  
      009EF6 88               [ 2] 6202 	tnzw x 
      009EF7 F5 90            [ 1] 6203 	jreq spi_disable 
      009EF9 85               [ 2] 6204 	popw x 
      009EFA 85 90            [ 1] 6205 	ld a,#(1<<SPI_CR1_BR)
      009EFC 5D               [ 4] 6206 	mul x,a 
      009EFD 27               [ 1] 6207 	ld a,xl 
      009EFE 05 58 90         [ 1] 6208 	ld SPI_CR1,a 
                                   6209 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F01 5A 26 FB 14      [ 1] 6210 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F04 72 1A 50 16      [ 1] 6211 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6212 ; configure SPI as master mode 0.	
      009F04 A6 84 81 00      [ 1] 6213 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6214 ; ~CS line controlled by sofware 	
      009F07 72 12 52 01      [ 1] 6215 	bset SPI_CR2,#SPI_CR2_SSM 
      009F07 CD 90 F8 A1      [ 1] 6216     bset SPI_CR2,#SPI_CR2_SSI 
                                   6217 ; enable SPI
      009F0B 02 27 03 CC      [ 1] 6218 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F0F 88               [ 4] 6219 	ret 
      002246                       6220 spi_disable:
      002246                       6221 	_drop #2; throw first argument.
      009F10 F5 90            [ 2]    1     addw sp,##2 
                                   6222 ; wait spi idle 
      009F12 85 85            [ 1] 6223 1$:	ld a,#0x82 
      009F14 90 5D 27         [ 1] 6224 	and a,SPI_SR
      009F17 05 54            [ 1] 6225 	cp a,#2 
      009F19 90 5A            [ 1] 6226 	jrne 1$
      009F1B 26 FB 52 00      [ 1] 6227 	bres SPI_CR1,#SPI_CR1_SPE
      009F1D 72 13 50 C7      [ 1] 6228 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F1D A6 84 81 16      [ 1] 6229 	bres PE_DDR,#SPI_CS_BIT 
      009F20 81               [ 4] 6230 	ret 
                                   6231 
      00225E                       6232 spi_clear_error:
      009F20 A6 84            [ 1] 6233 	ld a,#0x78 
      009F22 CD 90 EB         [ 1] 6234 	bcp a,SPI_SR 
      009F25 9F A4            [ 1] 6235 	jreq 1$
      009F27 07 C7 50 C6      [ 1] 6236 	clr SPI_SR 
      009F2B 81               [ 4] 6237 1$: ret 
                                   6238 
      009F2C                       6239 spi_send_byte:
      009F2C 52               [ 1] 6240 	push a 
      009F2D 01 CD 90         [ 4] 6241 	call spi_clear_error
      009F30 FD               [ 1] 6242 	pop a 
      009F31 A1 02 27 03 CC   [ 2] 6243 	btjf SPI_SR,#SPI_SR_TXE,.
      009F36 88 F5 90         [ 1] 6244 	ld SPI_DR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F39 85 85 CD 9F 6D   [ 2] 6245 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F3E 6B 01 A6         [ 1] 6246 	ld a,SPI_DR 
      009F41 01               [ 4] 6247 	ret 
                                   6248 
      002280                       6249 spi_rcv_byte:
      009F42 0D 01            [ 1] 6250 	ld a,#255
      009F44 27 0B 48 0A 01   [ 2] 6251 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F49 26 FB 6B         [ 1] 6252 	ld a,SPI_DR 
      009F4C 01               [ 4] 6253 	ret
                                   6254 
                                   6255 ;------------------------------
                                   6256 ; BASIC: SPIWR byte [,byte]
                                   6257 ; write 1 or more byte
                                   6258 ;------------------------------
      00228B                       6259 spi_write:
      009F4D EA 03 E7         [ 4] 6260 	call expression
      009F50 03 90            [ 1] 6261 	cp a,#TK_INTGR 
      009F52 A3 00            [ 1] 6262 	jreq 1$
      009F54 01 27 07         [ 2] 6263 	jp syntax_error 
      002295                       6264 1$:	
      009F57 7B               [ 1] 6265 	ld a,xl 
      009F58 01 43 E4         [ 4] 6266 	call spi_send_byte 
      009F5B 02 20 0A         [ 4] 6267 	call next_token 
      009F5E A1 09            [ 1] 6268 	cp a,#TK_COMMA 
      009F5E 7B 01            [ 1] 6269 	jrne 2$ 
      009F60 EA 04            [ 2] 6270 	jra spi_write 
      009F62 E7               [ 1] 6271 2$:	tnz a 
      009F63 04 7B            [ 1] 6272 	jreq 3$
      0022A5                       6273 	_unget_token  
      009F65 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
      009F6A 5B               [ 4] 6274 3$:	ret 
                                   6275 
                                   6276 
                                   6277 ;-------------------------------
                                   6278 ; BASIC: SPIRD 	
                                   6279 ; read one byte from SPI 
                                   6280 ;-------------------------------
      0022AB                       6281 spi_read:
      009F6B 01 81 80         [ 4] 6282 	call spi_rcv_byte 
      009F6D 5F               [ 1] 6283 	clrw x 
      009F6D 58               [ 1] 6284 	ld xl,a 
      009F6E 1C 9F            [ 1] 6285 	ld a,#TK_INTGR 
      009F70 7D               [ 4] 6286 	ret 
                                   6287 
                                   6288 ;------------------------------
                                   6289 ; BASIC: SPISEL 0|1 
                                   6290 ; set state of ~CS line
                                   6291 ; 0|1 deselect|select  
                                   6292 ;------------------------------
      0022B3                       6293 spi_select:
      009F71 FE 9F 88         [ 4] 6294 	call next_token 
      009F74 5E A6            [ 1] 6295 	cp a,#TK_INTGR 
      009F76 05 42            [ 1] 6296 	jreq 1$
      009F78 1C 50 00         [ 2] 6297 	jp syntax_error 
      009F7B 84               [ 2] 6298 1$: tnzw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009F7C 81 05            [ 1] 6299 	jreq cs_high 
      009F7D 72 1B 50 14      [ 1] 6300 	bres PE_ODR,#SPI_CS_BIT
      009F7D 03               [ 4] 6301 	ret 
      0022C5                       6302 cs_high: 
      009F7E 06 03 05 04      [ 1] 6303 	bset PE_ODR,#SPI_CS_BIT
      009F82 00               [ 4] 6304 	ret 
                                   6305 
                                   6306 
                                   6307 ;------------------------------
                                   6308 ; BASIC: FILERX
                                   6309 ; Use to receive a BASIC program
                                   6310 ; from the PC using XMODEM 
                                   6311 ; protocol. The file is store in
                                   6312 ; Each line received is compiled
                                   6313 ; then stored in RAM. When reception 
                                   6314 ; is completed with success  the 
                                   6315 ; program is ready to be executed 
                                   6316 ; or save as local file.
                                   6317 ;--------------------------------
      0022CA                       6318 file_receive:
      009F83 02 01 06 00 02   [ 2] 6319 	btjf flags,#FRUN,1$
      009F88 02 02            [ 1] 6320 	ld a,#ERR_CMD_ONLY
      009F8A 03 03 01         [ 2] 6321 	jp tb_error 
      0022D4                       6322 1$:	
      009F8D 03 03 02         [ 4] 6323 	call clear_basic
      009F90 04 04 05         [ 2] 6324 	ldw x, txtbgn
      009F93 02 06 02         [ 4] 6325 	call xreceive 
      009F96 07 02 05 04      [ 2] 6326 	addw x,txtbgn 
      009F9A 02 04 01         [ 2] 6327 	ldw txtend,x 
      009F9D CD 09 BC         [ 4] 6328 	call print_int 
      009F9D CD 90 F8         [ 2] 6329 	ldw x,#fsize_msg 
      009FA0 A1 01 27         [ 4] 6330 	call puts 
      009FA3 03               [ 4] 6331 	ret 
      009FA4 CC 88 F5 74 65 73 20  6332 fsize_msg: .asciz " bytes received\n"
             72 65 63 65 69 76 65
             64 0A 00
                                   6333 
                                   6334 ;------------------------------
                                   6335 ; BASIC: FILETX "file_name" 
                                   6336 ; Transmit the program in RAM 
                                   6337 ; To the PC using XMODEM protocol.
                                   6338 ; The file transmitted as source 
                                   6339 ; file not tokenized. 
                                   6340 ;-------------------------------
      009FA7                       6341 file_transmit:
                                   6342 
      009FA7 A6               [ 4] 6343 	ret 
                                   6344 
                                   6345 ;-------------------------------
                                   6346 ; BASIC: PAD 
                                   6347 ; Return pad buffer address.
                                   6348 ;------------------------------
      002300                       6349 pad_ref:
      009FA8 80 15 01         [ 2] 6350 	ldw x,#pad 
      009FAB 27 05            [ 1] 6351 	ld a,TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FAD A6               [ 4] 6352 	ret 
                                   6353 
                                   6354 ;------------------------------
                                   6355 ;      dictionary 
                                   6356 ; format:
                                   6357 ;   link:   2 bytes 
                                   6358 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6359 ;   cmd_name: 16 byte max 
                                   6360 ;   code_address: 2 bytes 
                                   6361 ;------------------------------
                                   6362 	.macro _dict_entry len,name,cmd 
                                   6363 	.word LINK 
                                   6364 	LINK=.
                                   6365 name:
                                   6366 	.byte len 	
                                   6367 	.ascii "name"
                                   6368 	.word cmd 
                                   6369 	.endm 
                                   6370 
                           000000  6371 	LINK=0
                                   6372 ; respect alphabetic order for BASIC names from Z-A
                                   6373 ; this sort order is for a cleaner WORDS cmd output. 	
      002306                       6374 kword_end:
      002306                       6375 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FAE 0A CC                    1 	.word LINK 
                           002308     2 	LINK=.
      002308                          3 XOR:
      009FB0 88                       4 	.byte 3+F_IFUNC 	
      009FB1 F7 4F 52                 5 	.ascii "XOR"
      009FB2 1E 56                    6 	.word bit_xor 
      00230E                       6376 	_dict_entry,5,WRITE,write  
      009FB2 CE 00                    1 	.word LINK 
                           002310     2 	LINK=.
      002310                          3 WRITE:
      009FB4 13                       4 	.byte 5 	
      009FB5 58 58 58 58 58           5 	.ascii "WRITE"
      009FBA 9E C8                    6 	.word write 
      002318                       6377 	_dict_entry,5,WORDS,words 
      009FBC 00 13                    1 	.word LINK 
                           00231A     2 	LINK=.
      00231A                          3 WORDS:
      009FBE C7                       4 	.byte 5 	
      009FBF 00 0D 9F C8 00           5 	.ascii "WORDS"
      009FC4 14 C7                    6 	.word words 
      002322                       6378 	_dict_entry 4,WAIT,wait 
      009FC6 00 0E                    1 	.word LINK 
                           002324     2 	LINK=.
      002324                          3 WAIT:
      009FC8 CE                       4 	.byte 4 	
      009FC9 00 15 CF 00              5 	.ascii "WAIT"
      009FCD 13 90                    6 	.word wait 
      00232B                       6379 	_dict_entry,3+F_IFUNC,USR,usr
      009FCF 54 90                    1 	.word LINK 
                           00232D     2 	LINK=.
      00232D                          3 USR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009FD1 9E                       4 	.byte 3+F_IFUNC 	
      009FD2 C8 00 15                 5 	.ascii "USR"
      009FD5 C7 00                    6 	.word usr 
      002333                       6380 	_dict_entry,5,UNTIL,until 
      009FD7 15 90                    1 	.word LINK 
                           002335     2 	LINK=.
      002335                          3 UNTIL:
      009FD9 9F                       4 	.byte 5 	
      009FDA C8 00 16 C7 00           5 	.ascii "UNTIL"
      009FDF 16 CE                    6 	.word until 
      00233D                       6381 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FE1 00 0D                    1 	.word LINK 
                           00233F     2 	LINK=.
      00233F                          3 UFLASH:
      009FE3 54                       4 	.byte 6+F_IFUNC 	
      009FE4 54 54 9E C8 00 0D        5 	.ascii "UFLASH"
      009FEA 95 9F                    6 	.word uflash 
      002348                       6382 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FEC C8 00                    1 	.word LINK 
                           00234A     2 	LINK=.
      00234A                          3 UBOUND:
      009FEE 0E                       4 	.byte 6+F_IFUNC 	
      009FEF 97 C8 00 16 97 9E        5 	.ascii "UBOUND"
      009FF5 C8 00                    6 	.word ubound 
      002353                       6383 	_dict_entry,4,TONE,tone  
      009FF7 15 95                    1 	.word LINK 
                           002355     2 	LINK=.
      002355                          3 TONE:
      009FF9 CF                       4 	.byte 4 	
      009FFA 00 15 90 85              5 	.ascii "TONE"
      009FFE 65 93                    6 	.word tone 
      00235C                       6384 	_dict_entry,2,TO,to
      00A000 5C 55                    1 	.word LINK 
                           00235E     2 	LINK=.
      00A001                          3 TO:
      00A001 A6                       4 	.byte 2 	
      00A002 84 81                    5 	.ascii "TO"
      00A004 16 9C                    6 	.word to 
      002363                       6385 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A004 52 03                    1 	.word LINK 
                           002365     2 	LINK=.
      002365                          3 TIMEOUT:
      00A006 0F                       4 	.byte 7+F_IFUNC 	
      00A007 02 0F 03 90 AE A7 37     5 	.ascii "TIMEOUT"
      00A00E 93 F6                    6 	.word timeout 
      00236F                       6386 	_dict_entry,5,TIMER,set_timer
      00A010 A4 0F                    1 	.word LINK 
                           002371     2 	LINK=.
      002371                          3 TIMER:
      00A012 6B                       4 	.byte 5 	
      00A013 01 0C 03 5C F6           5 	.ascii "TIMER"
      00A018 CD 83                    6 	.word set_timer 
      002379                       6387 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A01A 20 0C                    1 	.word LINK 
                           00237B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00237B                          3 TICKS:
      00A01C 02                       4 	.byte 5+F_IFUNC 	
      00A01D 0A 01 26 F5 A6           5 	.ascii "TICKS"
      00A022 46 11                    6 	.word get_ticks 
      002383                       6388 	_dict_entry,4,STOP,stop 
      00A024 02 2B                    1 	.word LINK 
                           002385     2 	LINK=.
      002385                          3 STOP:
      00A026 09                       4 	.byte 4 	
      00A027 A6 20 CD 83              5 	.ascii "STOP"
      00A02B 20 0C                    6 	.word stop 
      00238C                       6389 	_dict_entry,4,STEP,step 
      00A02D 02 20                    1 	.word LINK 
                           00238E     2 	LINK=.
      00238E                          3 STEP:
      00A02F 07                       4 	.byte 4 	
      00A030 A6 0D CD 83              5 	.ascii "STEP"
      00A034 20 0F                    6 	.word step 
      002395                       6390 	_dict_entry,5,SPIWR,spi_write
      00A036 02 72                    1 	.word LINK 
                           002397     2 	LINK=.
      002397                          3 SPIWR:
      00A038 A2                       4 	.byte 5 	
      00A039 00 02 90 FE 26           5 	.ascii "SPIWR"
      00A03E CF A6                    6 	.word spi_write 
      00239F                       6391 	_dict_entry,6,SPISEL,spi_select
      00A040 0D CD                    1 	.word LINK 
                           0023A1     2 	LINK=.
      0023A1                          3 SPISEL:
      00A042 83                       4 	.byte 6 	
      00A043 20 5F 7B 03 97 CD        5 	.ascii "SPISEL"
      00A049 8A 3C                    6 	.word spi_select 
      0023AA                       6392 	_dict_entry,5,SPIEN,spi_enable 
      00A04B AE A0                    1 	.word LINK 
                           0023AC     2 	LINK=.
      0023AC                          3 SPIEN:
      00A04D 54                       4 	.byte 5 	
      00A04E CD 83 33 5B 03           5 	.ascii "SPIEN"
      00A053 81 20                    6 	.word spi_enable 
      0023B4                       6393 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A055 77 6F                    1 	.word LINK 
                           0023B6     2 	LINK=.
      0023B6                          3 SPIRD:
      00A057 72                       4 	.byte 5+F_IFUNC 	
      00A058 64 73 20 69 6E           5 	.ascii "SPIRD"
      00A05D 20 64                    6 	.word spi_read 
      0023BE                       6394 	_dict_entry,5,SLEEP,sleep 
      00A05F 69 63                    1 	.word LINK 
                           0023C0     2 	LINK=.
      0023C0                          3 SLEEP:
      00A061 74                       4 	.byte 5 	
      00A062 69 6F 6E 61 72           5 	.ascii "SLEEP"
      00A067 79 0A                    6 	.word sleep 
      0023C8                       6395 	_dict_entry,4+F_IFUNC,SIZE,size
      00A069 00 C0                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                           0023CA     2 	LINK=.
      00A06A                          3 SIZE:
      00A06A CD                       4 	.byte 4+F_IFUNC 	
      00A06B 90 FD A1 01              5 	.ascii "SIZE"
      00A06F 27 03                    6 	.word size 
      0023D1                       6396     _dict_entry,4,SHOW,show 
      00A071 CC 88                    1 	.word LINK 
                           0023D3     2 	LINK=.
      0023D3                          3 SHOW:
      00A073 F5                       4 	.byte 4 	
      00A074 53 48 4F 57              5 	.ascii "SHOW"
      00A074 85 CF                    6 	.word show 
      0023DA                       6397 	_dict_entry,4,SAVE,save
      00A076 00 11                    1 	.word LINK 
                           0023DC     2 	LINK=.
      0023DC                          3 SAVE:
      00A078 81                       4 	.byte 4 	
      00A079 53 41 56 45              5 	.ascii "SAVE"
      00A079 CE 00                    6 	.word save 
      0023E3                       6398 	_dict_entry 3,RUN,run
      00A07B 11 DC                    1 	.word LINK 
                           0023E5     2 	LINK=.
      00A07C                          3 RUN:
      00A07C 53                       4 	.byte 3 	
      00A07D A3 FF FF                 5 	.ascii "RUN"
      00A080 27 01                    6 	.word run 
      0023EB                       6399 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A082 5F A6                    1 	.word LINK 
                           0023ED     2 	LINK=.
      0023ED                          3 RSHIFT:
      00A084 84                       4 	.byte 6+F_IFUNC 	
      00A085 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A086 1E 87                    6 	.word rshift 
      0023F6                       6400 	_dict_entry,3+F_IFUNC,RND,random 
      00A086 CD 90                    1 	.word LINK 
                           0023F8     2 	LINK=.
      0023F8                          3 RND:
      00A088 F8                       4 	.byte 3+F_IFUNC 	
      00A089 A1 01 27                 5 	.ascii "RND"
      00A08C 03 CC                    6 	.word random 
      0023FE                       6401 	_dict_entry,6,RETURN,return 
      00A08E 88 F5                    1 	.word LINK 
                           002400     2 	LINK=.
      002400                          3 RETURN:
      00A090 85                       4 	.byte 6 	
      00A091 20 E9 54 55 52 4E        5 	.ascii "RETURN"
      00A093 17 8E                    6 	.word return 
      002409                       6402 	_dict_entry,7,RESTORE,restore 
      00A093 CD 90                    1 	.word LINK 
                           00240B     2 	LINK=.
      00240B                          3 RESTORE:
      00A095 FD                       4 	.byte 7 	
      00A096 A1 01 27 03 CC 88 F5     5 	.ascii "RESTORE"
      00A09D 85 4B                    6 	.word restore 
      002415                       6403 	_dict_entry 6,REMARK,remark 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A09F 00 35                    1 	.word LINK 
                           002417     2 	LINK=.
      002417                          3 REMARK:
      00A0A1 CC                       4 	.byte 6 	
      00A0A2 50 E0 9E A4 3F 95        5 	.ascii "REMARK"
      00A0A8 A3 00                    6 	.word remark 
      002420                       6404 	_dict_entry,6,REBOOT,cold_start
      00A0AA FF 23                    1 	.word LINK 
                           002422     2 	LINK=.
      002422                          3 REBOOT:
      00A0AC 06                       4 	.byte 6 	
      00A0AD 0C 01 98 56 20 F5        5 	.ascii "REBOOT"
      00A0B3 35 55                    6 	.word cold_start 
      00242B                       6405 	_dict_entry,4+F_IFUNC,READ,read  
      00A0B5 50 E0                    1 	.word LINK 
                           00242D     2 	LINK=.
      00242D                          3 READ:
      00A0B7 84                       4 	.byte 4+F_IFUNC 	
      00A0B8 C7 50 E1 9F              5 	.ascii "READ"
      00A0BC 4A 35                    6 	.word read 
      002434                       6406 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0BE 55 50                    1 	.word LINK 
                           002436     2 	LINK=.
      002436                          3 QKEY:
      00A0C0 E0                       4 	.byte 4+F_IFUNC 	
      00A0C1 C7 50 E2 35              5 	.ascii "QKEY"
      00A0C5 AA 50                    6 	.word qkey 
      00243D                       6407 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0C7 E0 81                    1 	.word LINK 
                           00243F     2 	LINK=.
      00A0C9                          3 PRTI:
      00A0C9 35                       4 	.byte 4+F_IFUNC 	
      00A0CA AA 50 E0 81              5 	.ascii "PRTI"
      00A0CE 21 05                    6 	.word const_porti 
      002446                       6408 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0CE CD 90                    1 	.word LINK 
                           002448     2 	LINK=.
      002448                          3 PRTH:
      00A0D0 F8                       4 	.byte 4+F_IFUNC 	
      00A0D1 A1 01 27 03              5 	.ascii "PRTH"
      00A0D5 CC 88                    6 	.word const_porth 
      00244F                       6409 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0D7 F5 85                    1 	.word LINK 
                           002451     2 	LINK=.
      00A0D9                          3 PRTG:
      00A0D9 5D                       4 	.byte 4+F_IFUNC 	
      00A0DA 27 0A A6 0F              5 	.ascii "PRTG"
      00A0DE 59 25                    6 	.word const_portg 
      002458                       6410 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0E0 03 4A                    1 	.word LINK 
                           00245A     2 	LINK=.
      00245A                          3 PRTF:
      00A0E2 20                       4 	.byte 4+F_IFUNC 	
      00A0E3 FA 5F 97 A6              5 	.ascii "PRTF"
      00A0E7 84 81                    6 	.word const_portf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A0E9                       6411 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A0E9 CD 90                    1 	.word LINK 
                           002463     2 	LINK=.
      002463                          3 PRTE:
      00A0EB F8                       4 	.byte 4+F_IFUNC 	
      00A0EC A1 01 27 03              5 	.ascii "PRTE"
      00A0F0 CC 88                    6 	.word const_porte 
      00246A                       6412 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0F2 F5 85                    1 	.word LINK 
                           00246C     2 	LINK=.
      00246C                          3 PRTD:
      00A0F4 9F                       4 	.byte 4+F_IFUNC 	
      00A0F5 A4 0F 5F 5C              5 	.ascii "PRTD"
      00A0F9 4D 27                    6 	.word const_portd 
      002473                       6413 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A0FB 04 58                    1 	.word LINK 
                           002475     2 	LINK=.
      002475                          3 PRTC:
      00A0FD 4A                       4 	.byte 4+F_IFUNC 	
      00A0FE 20 F9 A6 84              5 	.ascii "PRTC"
      00A102 81 E1                    6 	.word const_portc 
      00A103                       6414 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A103 CD 90                    1 	.word LINK 
                           00247E     2 	LINK=.
      00247E                          3 PRTB:
      00A105 F8                       4 	.byte 4+F_IFUNC 	
      00A106 A1 01 27 03              5 	.ascii "PRTB"
      00A10A CC 88                    6 	.word const_portb 
      002485                       6415 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A10C F5 85                    1 	.word LINK 
                           002487     2 	LINK=.
      002487                          3 PRTA:
      00A10E 53                       4 	.byte 4+F_IFUNC 	
      00A10F A6 84 81 41              5 	.ascii "PRTA"
      00A112 20 D5                    6 	.word const_porta 
      00248E                       6416 	_dict_entry 5,PRINT,print 
      00A112 85 52                    1 	.word LINK 
                           002490     2 	LINK=.
      002490                          3 PRINT:
      00A114 04                       4 	.byte 5 	
      00A115 89 90 CE 00 05           5 	.ascii "PRINT"
      00A11A 17 03                    6 	.word print 
      002498                       6417 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A11C 90 CE                    1 	.word LINK 
                           00249A     2 	LINK=.
      00249A                          3 POUT:
      00A11E 00                       4 	.byte 4+F_IFUNC 	
      00A11F 01 17 05 72              5 	.ascii "POUT"
      00A123 5C 00                    6 	.word const_output 
      0024A1                       6418 	_dict_entry,4,POKE,poke 
      00A125 21 81                    1 	.word LINK 
                           0024A3     2 	LINK=.
      00A127                          3 POKE:
      00A127 72                       4 	.byte 4 	
      00A128 5D 00 21 26              5 	.ascii "POKE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A12C 03 CC                    6 	.word poke 
      0024AA                       6419 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A12E 88 F5                    1 	.word LINK 
                           0024AC     2 	LINK=.
      00A130                          3 PINP:
      00A130 CD                       4 	.byte 4+F_IFUNC 	
      00A131 92 3F A1 84              5 	.ascii "PINP"
      00A135 27 03                    6 	.word const_input 
      0024B3                       6420 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A137 CC 88                    1 	.word LINK 
                           0024B5     2 	LINK=.
      0024B5                          3 PEEK:
      00A139 F5                       4 	.byte 4+F_IFUNC 	
      00A13A 50 45 45 4B              5 	.ascii "PEEK"
      00A13A 5D 26                    6 	.word peek 
      0024BC                       6421 	_dict_entry,5,PMODE,pin_mode 
      00A13C 10 1E                    1 	.word LINK 
                           0024BE     2 	LINK=.
      0024BE                          3 PMODE:
      00A13E 03                       4 	.byte 5 	
      00A13F CF 00 05 E6 02           5 	.ascii "PMODE"
      00A144 C7 00                    6 	.word pin_mode 
      0024C6                       6422 	_dict_entry,5,PAUSE,pause 
      00A146 04 1E                    1 	.word LINK 
                           0024C8     2 	LINK=.
      0024C8                          3 PAUSE:
      00A148 05                       4 	.byte 5 	
      00A149 CF 00 01 81 45           5 	.ascii "PAUSE"
      00A14D 1D B0                    6 	.word pause 
      0024D0                       6423 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A14D 85 5B                    1 	.word LINK 
                           0024D2     2 	LINK=.
      0024D2                          3 PAD:
      00A14F 04                       4 	.byte 3+F_IFUNC 	
      00A150 72 5A 00                 5 	.ascii "PAD"
      00A153 21 FC                    6 	.word pad_ref 
      00A155                       6424 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A155 AE 00                    1 	.word LINK 
                           0024DA     2 	LINK=.
      0024DA                          3 OR:
      00A157 00                       4 	.byte 2+F_IFUNC 	
      00A158 A6 84                    5 	.ascii "OR"
      00A15A 81 3E                    6 	.word bit_or 
      00A15B                       6425 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A15B AE 00                    1 	.word LINK 
                           0024E1     2 	LINK=.
      0024E1                          3 ODR:
      00A15D 01                       4 	.byte 3+F_IFUNC 	
      00A15E A6 84 81                 5 	.ascii "ODR"
      00A161 21 0B                    6 	.word const_odr 
      0024E7                       6426 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A161 AE 00                    1 	.word LINK 
                           0024E9     2 	LINK=.
      0024E9                          3 NOT:
      00A163 02                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A164 A6 84 81                 5 	.ascii "NOT"
      00A167 20 06                    6 	.word func_not 
      0024EF                       6427 	_dict_entry,3,NEW,new
      00A167 AE 00                    1 	.word LINK 
                           0024F1     2 	LINK=.
      0024F1                          3 NEW:
      00A169 03                       4 	.byte 3 	
      00A16A A6 84 81                 5 	.ascii "NEW"
      00A16D 19 77                    6 	.word new 
      0024F7                       6428 	_dict_entry,4,NEXT,next 
      00A16D AE 00                    1 	.word LINK 
                           0024F9     2 	LINK=.
      0024F9                          3 NEXT:
      00A16F 04                       4 	.byte 4 	
      00A170 A6 84 81 54              5 	.ascii "NEXT"
      00A173 16 F3                    6 	.word next 
      002500                       6429 	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
      00A173 AE 00                    1 	.word LINK 
                           002502     2 	LINK=.
      002502                          3 MULDIV:
      00A175 05                       4 	.byte 6+F_IFUNC 	
      00A176 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A179 0F D0                    6 	.word muldiv 
      00250B                       6430 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A179 AE 00                    1 	.word LINK 
                           00250D     2 	LINK=.
      00250D                          3 LSHIFT:
      00A17B 06                       4 	.byte 6+F_IFUNC 	
      00A17C A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A17F 1E 6E                    6 	.word lshift 
      002516                       6431 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A17F AE 00                    1 	.word LINK 
                           002518     2 	LINK=.
      002518                          3 LOG:
      00A181 07                       4 	.byte 3+F_IFUNC 	
      00A182 A6 84 81                 5 	.ascii "LOG"
      00A185 20 4E                    6 	.word log2 
      00251E                       6432 	_dict_entry,4,LOAD,load 
      00A185 AE 00                    1 	.word LINK 
                           002520     2 	LINK=.
      002520                          3 LOAD:
      00A187 08                       4 	.byte 4 	
      00A188 A6 84 81 44              5 	.ascii "LOAD"
      00A18B 1B 62                    6 	.word load 
      002527                       6433 	_dict_entry 4,LIST,list
      00A18B A6 84                    1 	.word LINK 
                           002529     2 	LINK=.
      002529                          3 LIST:
      00A18D AE                       4 	.byte 4 	
      00A18E 00 00 81 54              5 	.ascii "LIST"
      00A191 12 BC                    6 	.word list 
      002530                       6434 	_dict_entry 3,LET,let 
      00A191 A6 84                    1 	.word LINK 
                           002532     2 	LINK=.
      002532                          3 LET:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A193 AE                       4 	.byte 3 	
      00A194 00 01 81                 5 	.ascii "LET"
      00A197 12 91                    6 	.word let 
      002538                       6435 	_dict_entry,3+F_IFUNC,KEY,key 
      00A197 A6 84                    1 	.word LINK 
                           00253A     2 	LINK=.
      00253A                          3 KEY:
      00A199 AE                       4 	.byte 3+F_IFUNC 	
      00A19A 00 02 81                 5 	.ascii "KEY"
      00A19D 1C E4                    6 	.word key 
      002540                       6436 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A19D A6 84                    1 	.word LINK 
                           002542     2 	LINK=.
      002542                          3 IWDGREF:
      00A19F AE                       4 	.byte 7 	
      00A1A0 00 03 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1A3 20 49                    6 	.word refresh_iwdg 
      00254C                       6437 	_dict_entry,6,IWDGEN,enable_iwdg
      00A1A3 A6 84                    1 	.word LINK 
                           00254E     2 	LINK=.
      00254E                          3 IWDGEN:
      00A1A5 AE                       4 	.byte 6 	
      00A1A6 00 04 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1A9 20 13                    6 	.word enable_iwdg 
      002557                       6438 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A1A9 A6 84                    1 	.word LINK 
                           002559     2 	LINK=.
      002559                          3 INVERT:
      00A1AB AE                       4 	.byte 6+F_IFUNC 	
      00A1AC 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A1AF 20 83                    6 	.word invert 
      002562                       6439 	_dict_entry,5,INPUT,input_var  
      00A1AF A6 84                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 INPUT:
      00A1B1 AE                       4 	.byte 5 	
      00A1B2 00 00 81 55 54           5 	.ascii "INPUT"
      00A1B5 15 50                    6 	.word input_var 
      00256C                       6440 	_dict_entry,2,IF,if 
      00A1B5 A6 84                    1 	.word LINK 
                           00256E     2 	LINK=.
      00256E                          3 IF:
      00A1B7 AE                       4 	.byte 2 	
      00A1B8 40 00                    5 	.ascii "IF"
      00A1BA 81 5F                    6 	.word if 
      00A1BB                       6441 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1BB 55 00                    1 	.word LINK 
                           002575     2 	LINK=.
      002575                          3 IDR:
      00A1BD 04                       4 	.byte 3+F_IFUNC 	
      00A1BE 00 02 81                 5 	.ascii "IDR"
      00A1C1 21 11                    6 	.word const_idr 
      00257B                       6442 	_dict_entry,3,HEX,hex_base
      00A1C1 CD 91                    1 	.word LINK 
                           00257D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00257D                          3 HEX:
      00A1C3 F6                       4 	.byte 3 	
      00A1C4 A1 84 27                 5 	.ascii "HEX"
      00A1C7 03 CC                    6 	.word hex_base 
      002583                       6443 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1C9 88 F5                    1 	.word LINK 
                           002585     2 	LINK=.
      002585                          3 GPIO:
      00A1CB CD                       4 	.byte 4+F_IFUNC 	
      00A1CC 84 80 5D 26              5 	.ascii "GPIO"
      00A1D0 05 A6                    6 	.word gpio 
      00258C                       6444 	_dict_entry,4,GOTO,goto 
      00A1D2 05 CC                    1 	.word LINK 
                           00258E     2 	LINK=.
      00258E                          3 GOTO:
      00A1D4 88                       4 	.byte 4 	
      00A1D5 F7 4F 54 4F              5 	.ascii "GOTO"
      00A1D6 17 53                    6 	.word goto 
      002595                       6445 	_dict_entry,5,GOSUB,gosub 
      00A1D6 90 93                    1 	.word LINK 
                           002597     2 	LINK=.
      002597                          3 GOSUB:
      00A1D8 EE                       4 	.byte 5 	
      00A1D9 04 A3 A1 BB 26           5 	.ascii "GOSUB"
      00A1DE F2 90                    6 	.word gosub 
      00259F                       6446 	_dict_entry,6,FORGET,forget 
      00A1E0 CF 00                    1 	.word LINK 
                           0025A1     2 	LINK=.
      0025A1                          3 FORGET:
      00A1E2 07                       4 	.byte 6 	
      00A1E3 90 E6 02 C7 00 0A        5 	.ascii "FORGET"
      00A1E9 35 06                    6 	.word forget 
      0025AA                       6447 	_dict_entry,3,FOR,for 
      00A1EB 00 09                    1 	.word LINK 
                           0025AC     2 	LINK=.
      0025AC                          3 FOR:
      00A1ED 81                       4 	.byte 3 	
      00A1EE 46 4F 52                 5 	.ascii "FOR"
      00A1EE 72 5F                    6 	.word for 
      0025B2                       6448 	_dict_entry,6,FILETX,file_transmit
      00A1F0 00 07                    1 	.word LINK 
                           0025B4     2 	LINK=.
      0025B4                          3 FILETX:
      00A1F2 72                       4 	.byte 6 	
      00A1F3 5F 00 08 72 5F 00        5 	.ascii "FILETX"
      00A1F9 09 72                    6 	.word file_transmit 
      0025BD                       6449 	_dict_entry,6,FILERX,file_receive 
      00A1FB 5F 00                    1 	.word LINK 
                           0025BF     2 	LINK=.
      0025BF                          3 FILERX:
      00A1FD 0A                       4 	.byte 6 	
      00A1FE CE 00 1D 45 52 58        5 	.ascii "FILERX"
      00A201 22 CA                    6 	.word file_receive 
      0025C8                       6450 	_dict_entry,4,FCPU,fcpu 
      00A201 C3 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           0025CA     2 	LINK=.
      0025CA                          3 FCPU:
      00A203 1F                       4 	.byte 4 	
      00A204 24 17 90 93              5 	.ascii "FCPU"
      00A208 EE 04                    6 	.word fcpu 
      0025D1                       6451 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A20A A3 A1                    1 	.word LINK 
                           0025D3     2 	LINK=.
      0025D3                          3 EEPROM:
      00A20C BB                       4 	.byte 6+F_IFUNC 	
      00A20D 26 1A 90 CF 00 07        5 	.ascii "EEPROM"
      00A213 90 E6                    6 	.word const_eeprom_base 
      0025DC                       6452 	_dict_entry,3,END,cmd_end  
      00A215 02 C7                    1 	.word LINK 
                           0025DE     2 	LINK=.
      0025DE                          3 END:
      00A217 00                       4 	.byte 3 	
      00A218 0A 35 06                 5 	.ascii "END"
      00A21B 00 09                    6 	.word cmd_end 
      0025E4                       6453 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A21D 72 5D                    1 	.word LINK 
                           0025E6     2 	LINK=.
      0025E6                          3 DWRITE:
      00A21F 00                       4 	.byte 6+F_CMD 	
      00A220 0A 26 05 A6 0C CC        5 	.ascii "DWRITE"
      00A226 88 F7                    6 	.word digital_write 
      0025EF                       6454 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A228 81 E6                    1 	.word LINK 
                           0025F1     2 	LINK=.
      00A229                          3 DREAD:
      00A229 93                       4 	.byte 5+F_IFUNC 	
      00A22A E6 02 C7 00 0E           5 	.ascii "DREAD"
      00A22F 72 5F                    6 	.word digital_read 
      0025F9                       6455 	_dict_entry,2,DO,do_loop
      00A231 00 0D                    1 	.word LINK 
                           0025FB     2 	LINK=.
      0025FB                          3 DO:
      00A233 72                       4 	.byte 2 	
      00A234 BB 00                    5 	.ascii "DO"
      00A236 0D 20                    6 	.word do_loop 
      002600                       6456 	_dict_entry,3,DIR,directory 
      00A238 C8 FB                    1 	.word LINK 
                           002602     2 	LINK=.
      00A239                          3 DIR:
      00A239 52                       4 	.byte 3 	
      00A23A 06 49 52                 5 	.ascii "DIR"
      00A23B 1B F9                    6 	.word directory 
      002608                       6457 	_dict_entry,3,DEC,dec_base
      00A23B C6 00                    1 	.word LINK 
                           00260A     2 	LINK=.
      00260A                          3 DEC:
      00A23D 09                       4 	.byte 3 	
      00A23E C1 00 0A                 5 	.ascii "DEC"
      00A241 27 37                    6 	.word dec_base 
      002610                       6458 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A243 CD 95                    1 	.word LINK 
                           002612     2 	LINK=.
      002612                          3 DDR:
      00A245 B0                       4 	.byte 3+F_IFUNC 	
      00A246 CE 00 07                 5 	.ascii "DDR"
      00A249 CF 00                    6 	.word const_ddr 
      002618                       6459 	_dict_entry,6,DATALN,data_line  
      00A24B 05 55                    1 	.word LINK 
                           00261A     2 	LINK=.
      00261A                          3 DATALN:
      00A24D 00                       4 	.byte 6 	
      00A24E 09 00 02 55 00 0A        5 	.ascii "DATALN"
      00A254 00 04                    6 	.word data_line 
      002623                       6460 	_dict_entry,4,DATA,data  
      00A256 CD 91                    1 	.word LINK 
                           002625     2 	LINK=.
      002625                          3 DATA:
      00A258 F6                       4 	.byte 4 	
      00A259 A1 84 27 03              5 	.ascii "DATA"
      00A25D CC 88                    6 	.word data 
      00262C                       6461 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A25F F5 25                    1 	.word LINK 
                           00262E     2 	LINK=.
      00A260                          3 CRL:
      00A260 1F                       4 	.byte 3+F_IFUNC 	
      00A261 05 CD 89                 5 	.ascii "CRL"
      00A264 E7 CE                    6 	.word const_cr1 
      002634                       6462 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A266 00 05                    1 	.word LINK 
                           002636     2 	LINK=.
      002636                          3 CRH:
      00A268 CF                       4 	.byte 3+F_IFUNC 	
      00A269 00 07 55                 5 	.ascii "CRH"
      00A26C 00 02                    6 	.word const_cr2 
      00263C                       6463 	_dict_entry,4+F_CFUNC,CHAR,char
      00A26E 00 09                    1 	.word LINK 
                           00263E     2 	LINK=.
      00263E                          3 CHAR:
      00A270 CD                       4 	.byte 4+F_CFUNC 	
      00A271 95 C0 1E 05              5 	.ascii "CHAR"
      00A275 A6 84                    6 	.word char 
      002645                       6464 	_dict_entry,3,BYE,bye 
      00A277 5B 06                    1 	.word LINK 
                           002647     2 	LINK=.
      002647                          3 BYE:
      00A279 81                       4 	.byte 3 	
      00A27A 42 59 45                 5 	.ascii "BYE"
      00A27A 90 CE                    6 	.word bye 
      00264D                       6465 	_dict_entry,5,BTOGL,bit_toggle
      00A27C 00 07                    1 	.word LINK 
                           00264F     2 	LINK=.
      00264F                          3 BTOGL:
      00A27E 72                       4 	.byte 5 	
      00A27F 5F 00 07 72 5F           5 	.ascii "BTOGL"
      00A284 00 08                    6 	.word bit_toggle 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002657                       6466 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A286 72 5F                    1 	.word LINK 
                           002659     2 	LINK=.
      002659                          3 BTEST:
      00A288 00                       4 	.byte 5+F_IFUNC 	
      00A289 09 72 5F 00 0A           5 	.ascii "BTEST"
      00A28E CD A2                    6 	.word bit_test 
      002661                       6467 	_dict_entry,4,BSET,bit_set 
      00A290 29 20                    1 	.word LINK 
                           002663     2 	LINK=.
      002663                          3 BSET:
      00A292 A8                       4 	.byte 4 	
      00A293 42 53 45 54              5 	.ascii "BSET"
      00A293 CD 90                    6 	.word bit_set 
      00266A                       6468 	_dict_entry,4,BRES,bit_reset
      00A295 FD A1                    1 	.word LINK 
                           00266C     2 	LINK=.
      00266C                          3 BRES:
      00A297 02                       4 	.byte 4 	
      00A298 27 03 CC 88              5 	.ascii "BRES"
      00A29C F5 F7                    6 	.word bit_reset 
      00A29D                       6469 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A29D 72 12                    1 	.word LINK 
                           002675     2 	LINK=.
      002675                          3 BIT:
      00A29F 50                       4 	.byte 3+F_IFUNC 	
      00A2A0 C7 85 5D                 5 	.ascii "BIT"
      00A2A3 27 21                    6 	.word bitmask 
      00267B                       6470 	_dict_entry,3,AWU,awu 
      00A2A5 85 A6                    1 	.word LINK 
                           00267D     2 	LINK=.
      00267D                          3 AWU:
      00A2A7 08                       4 	.byte 3 	
      00A2A8 42 9F C7                 5 	.ascii "AWU"
      00A2AB 52 00                    6 	.word awu 
      002683                       6471 	_dict_entry,7,AUTORUN,autorun
      00A2AD 72 1A                    1 	.word LINK 
                           002685     2 	LINK=.
      002685                          3 AUTORUN:
      00A2AF 50                       4 	.byte 7 	
      00A2B0 14 72 1A 50 16 72 14     5 	.ascii "AUTORUN"
      00A2B7 52 00                    6 	.word autorun 
      00268F                       6472 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A2B9 72 12                    1 	.word LINK 
                           002691     2 	LINK=.
      002691                          3 ASC:
      00A2BB 52                       4 	.byte 3+F_IFUNC 	
      00A2BC 01 72 10                 5 	.ascii "ASC"
      00A2BF 52 01                    6 	.word ascii 
      002697                       6473 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2C1 72 1C                    1 	.word LINK 
                           002699     2 	LINK=.
      002699                          3 AND:
      00A2C3 52                       4 	.byte 3+F_IFUNC 	
      00A2C4 00 81 44                 5 	.ascii "AND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A2C6 1E 26                    6 	.word bit_and 
      00269F                       6474 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2C6 5B 02                    1 	.word LINK 
                           0026A1     2 	LINK=.
      0026A1                          3 ADCREAD:
      00A2C8 A6                       4 	.byte 7+F_IFUNC 	
      00A2C9 82 C4 52 03 A1 02 26     5 	.ascii "ADCREAD"
      00A2D0 F7 72                    6 	.word analog_read 
      0026AB                       6475 	_dict_entry,5,ADCON,power_adc 
      00A2D2 1D 52                    1 	.word LINK 
                           0026AD     2 	LINK=.
      0026AD                          3 ADCON:
      00A2D4 00                       4 	.byte 5 	
      00A2D5 72 13 50 C7 72           5 	.ascii "ADCON"
      00A2DA 1B 50                    6 	.word power_adc 
      0026B5                       6476 kword_dict:
      0026B5                       6477 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2DC 16 81                    1 	.word LINK 
                           0026B7     2 	LINK=.
      00A2DE                          3 ABS:
      00A2DE A6                       4 	.byte 3+F_IFUNC 	
      00A2DF 78 C5 52                 5 	.ascii "ABS"
      00A2E2 03 27                    6 	.word abs 
                                   6478 	
                                   6479 
      002700                       6480 	.bndry 128 ; align on FLASH block.
                                   6481 ; free space for user application  
      002700                       6482 user_space:
                                   6483 ; USR() function test
      00A2E4 04               [ 2] 6484 	pushw x 
      00A2E5 72 5F 52 03      [ 1] 6485 	bset PC_ODR,#5 
      00A2E9 81               [ 2] 6486 	popw x 
      00A2EA CD 1D BA         [ 4] 6487 	call pause02 
      00A2EA 88 CD A2 DE      [ 1] 6488 	bres PC_ODR,#5 
      00A2EE 84               [ 4] 6489 	ret
                                   6490 
                                   6491 	.area FLASH_DRIVE (ABS)
      010000                       6492 	.org 0x10000
      010000                       6493 fdrive:
                                   6494 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026B7 R   |     ACK     =  000006 
  5 ADCON      0026AD R   |   5 ADCREAD    0026A1 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002699 R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        002691 R
    ATTRIB  =  000002     |   5 AUTORUN    002685 R   |     AUTORUN_=  004000 
  5 AWU        00267D R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
  5 BIT        002675 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       00266C R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       002663 R   |     BSIZE   =  000001 
  5 BTEST      002659 R   |   5 BTOGL      00264F R   |     BTW     =  000001 
  5 BYE        002647 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       00263E R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002636 R
  5 CRL        00262E R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       002625 R   |   5 DATALN     00261A R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        002612 R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000000     |   5 DEC        00260A R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002602 R   |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0025FB R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0025F1 R   |   5 DWRITE     0025E6 R   |   5 EEPROM     0025D3 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        0025DE R   |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025CA R
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
  5 FILERX     0025BF R   |   5 FILETX     0025B4 R   |     FIRST   =  000001 
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
  5 FOR        0025AC R   |   5 FORGET     0025A1 R   |     FRUN    =  000000 
    FS      =  00001C     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002597 R   |   5 GOTO       00258E R   |   5 GPIO       002585 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   5 HEX        00257D R
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
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   5 IDR        002575 R   |   5 IF         00256E R
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      002564 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    INPUT_FL=  000000     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
  5 INVERT     002559 R   |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     00254E R   |   5 IWDGREF    002542 R
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00253A R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        002532 R   |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   5 LINK    =  0026B7 R
  5 LIST       002529 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       002520 R
  5 LOG        002518 R   |   5 LSHIFT     00250D R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   5 MULDIV     002502 R   |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0024F1 R   |     NEW_FREE=  000001     |   5 NEXT       0024F9 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        0024E9 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        0024E1 R   |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024DA R
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        0024D2 R
    PAD_SIZE=  000080     |   5 PAUSE      0024C8 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0024B5 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       0024AC R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0024BE R
  5 POKE       0024A3 R   |     PORT    =  000003     |   5 POUT       00249A R
    PREV    =  000001     |   5 PRINT      002490 R   |   5 PRTA       002487 R
  5 PRTB       00247E R   |   5 PRTC       002475 R   |   5 PRTD       00246C R
  5 PRTE       002463 R   |   5 PRTF       00245A R   |   5 PRTG       002451 R
  5 PRTH       002448 R   |   5 PRTI       00243F R   |     PSTR    =  000003 
  5 QKEY       002436 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       00242D R   |   5 REBOOT     002422 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     002417 R
  5 RESTORE    00240B R   |     RETL1   =  000001     |   5 RETURN     002400 R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0023F8 R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0023ED R
    RST_SR  =  0050B3     |   5 RUN        0023E5 R   |     RXCHAR  =  000001 
  5 SAVE       0023DC R   |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0023D3 R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0023CA R
    SKIP    =  000005     |   5 SLEEP      0023C0 R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |     SPCNT   =  000001 
  5 SPIEN      0023AC R   |   5 SPIRD      0023B6 R   |   5 SPISEL     0023A1 R
  5 SPIWR      002397 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       00238E R   |   5 STOP       002385 R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      00237B R
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
    TIM4_SR_=  000000     |   5 TIMEOUT    002365 R   |   5 TIMER      002371 R
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
  5 TO         00235E R   |   5 TONE       002355 R   |   5 Timer4Up   000037 R
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
    UBC     =  004801     |   5 UBOUND     00234A R   |   5 UBTN_Han   00007A R
  5 UFLASH     00233F R   |   5 UNTIL      002335 R   |     US      =  00001F 
  5 USER_ABO   000082 R   |   5 USR        00232D R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 Uart1RxH   00000F R
  5 UserButt   00004D R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002324 R
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      00231A R
  5 WRITE      002310 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        002308 R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E12 R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   000B2F R   |   5 add_char   00149F R
  5 analog_r   00188C R   |   5 ansi_seq   000AF1 R   |   5 arduino_   001EFD R
  5 arg_list   00107D R   |   1 array_si   000021 R   |   5 ascii      001CC4 R
  5 at_tst     000D36 R   |   5 atoi24     000E47 R   |   5 atoi_exi   000EAD R
  5 autorun    001D4D R   |   5 autorun_   0006CC R   |   5 awu        001DC3 R
  5 awu02      001DCD R   |   5 bad_port   001D1C R   |   1 base       00000A R
  1 basicptr   000004 R   |   5 beep       001819 R   |   5 bin_exit   000C14 R
  5 bit_and    001E26 R   |   5 bit_or     001E3E R   |   5 bit_rese   0015F7 R
  5 bit_set    0015E7 R   |   5 bit_test   001618 R   |   5 bit_togg   001608 R
  5 bit_xor    001E56 R   |   5 bitmask    002069 R   |   5 bkslsh_t   000CE3 R
  5 bksp       0002BD R   |   5 block_er   0001A3 R   |   5 break_po   001959 R
  5 bye        001D44 R   |   5 cancel_a   000694 R   |   5 char       001CB2 R
  5 clear_ba   0006E1 R   |   5 clear_va   00055D R   |   5 clock_in   00009D R
  5 cmd_end    001805 R   |   5 cmd_line   0008FF R   |   5 cmd_name   000FEC R
  5 cmp_name   0019FA R   |   5 cold_sta   0005CB R   |   5 colon_ts   000D0A R
  5 comma_ts   000D15 R   |   5 comp_msg   000855 R   |   5 compile    0004EA R
  5 const_cr   00211D R   |   5 const_cr   002123 R   |   5 const_dd   002117 R
  5 const_ee   002135 R   |   5 const_id   002111 R   |   5 const_in   00212F R
  5 const_od   00210B R   |   5 const_ou   002129 R   |   5 const_po   0020D5 R
  5 const_po   0020DB R   |   5 const_po   0020E1 R   |   5 const_po   0020E7 R
  5 const_po   0020ED R   |   5 const_po   0020F3 R   |   5 const_po   0020F9 R
  5 const_po   0020FF R   |   5 const_po   002105 R   |   5 convert_   000B8B R
  5 copy_com   000D6B R   |   1 count      000003 R   |   5 cp_loop    00102C R
  5 create_g   000451 R   |   5 cs_high    0022C5 R   |   5 cstk_pro   001234 R
  5 dash_tst   000D2B R   |   5 data       00213B R   |   1 data_len   000009 R
  5 data_lin   002141 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002181 R   |   5 dbl_sign   000F54 R   |   5 dec_base   001260 R
  5 del_back   000B20 R   |   5 del_line   000424 R   |   5 del_ln     000B11 R
  5 delete     0002CD R   |   5 digital_   0018C0 R   |   5 digital_   0018F0 R
  5 dir_loop   001C05 R   |   5 director   001BF9 R   |   5 disk_fre   0019E7 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 div32_16   000F5E R   |   5 divide     000FB5 R   |   5 divu24_8   000A42 R
  5 dneg       000F49 R   |   5 do_loop    002092 R   |   5 do_progr   000196 R
  5 drive_fr   001C6E R   |   5 enable_i   002013 R   |   5 eql_tst    000DC0 R
  5 equal      0014B2 R   |   5 erase_fl   0001C2 R   |   5 err_bad_   0007C1 R
  5 err_buf_   000837 R   |   5 err_cmd_   000785 R   |   5 err_div0   00074A R
  5 err_dupl   00079F R   |   5 err_math   000731 R   |   5 err_mem_   000716 R
  5 err_msg    0006F6 R   |   5 err_no_a   0007CD R   |   5 err_no_d   000800 R
  5 err_no_f   000824 R   |   5 err_no_l   000759 R   |   5 err_no_p   000810 R
  5 err_not_   0007B0 R   |   5 err_run_   00076F R   |   5 err_synt   000723 R
  5 escaped    000BA0 R   |   5 expect     00106B R   |   5 expr_exi   0011BC R
  5 expressi   001176 R   |   5 factor     0010CD R   |   1 farptr     000016 R
  5 fcpu       001EA0 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001C66 R   |   5 file_rec   0022CA R   |   5 file_tra   0022FF R
  5 final_te   000AEB R   |   5 first_li   0012E5 R   |   1 flags      000023 R
  5 for        001673 R   |   5 forget     001B92 R   |   1 free_ram   00005A R
  5 fsize_ms   0022EE R   |   5 func_arg   001078 R   |   5 func_not   002006 R
  5 ge         0014B4 R   |   5 get_arra   0010A8 R   |   5 get_targ   00173D R
  5 get_tick   001E0C R   |   5 get_toke   000C7C R   |   5 getc       0002A9 R
  5 gosub      00176E R   |   5 goto       001753 R   |   5 gpio       001CF7 R
  5 gt         0014B0 R   |   5 gt_tst     000DCB R   |   5 hex_base   00125B R
  5 hex_dump   000355 R   |   5 if         00165F R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   0019A7 R
  5 input_ex   0015B9 R   |   5 input_lo   001552 R   |   5 input_va   001550 R
  5 insert_l   00047D R   |   5 insert_l   0004E7 R   |   5 interp_l   000940 R
  5 interpre   00091B R   |   5 invert     002083 R   |   5 is_alpha   00056B R
  5 is_digit   00057C R   |   5 itoa       0009E8 R   |   5 itoa_loo   000A07 R
  5 jp_to_ta   001761 R   |   5 key        001CE4 R   |   5 kw_loop    000C30 R
  5 kword_di   0026B5 R   |   5 kword_en   002306 R   |   5 le         0014B9 R
  5 leading_   002059 R   |   5 left_arr   000AF1 R   |   5 let        001291 R
  5 let_arra   00129F R   |   5 let_var    0012A2 R   |   5 lines_sk   0012E8 R
  5 list       0012BC R   |   5 list_exi   00132E R   |   5 list_sta   001308 R
  5 load       001B62 R   |   5 load_aut   0006A3 R   |   5 load_fil   001B31 R
  5 log2       00204E R   |   5 logical_   001FFC R   |   5 long_div   000F31 R
  5 loop_bac   001720 R   |   1 loop_dep   000020 R   |   5 loop_don   001735 R
  5 lshift     001E6E R   |   5 lt         0014B7 R   |   5 lt_tst     000DF4 R
  5 modulo     000FCB R   |   5 move       0003BE R   |   5 move_dow   0003DC R
  5 move_era   000128 R   |   5 move_exi   0003FD R   |   5 move_loo   0003E1 R
  5 move_prg   00015C R   |   5 move_up    0003CE R   |   5 mul_char   0014A1 R
  5 muldiv     000FD0 R   |   5 multiply   000EFE R   |   5 mulu24_8   000A6A R
  5 nbr_tst    000CAF R   |   5 ne         0014BC R   |   5 neg_acc2   000AA4 R
  5 new        001977 R   |   5 next       0016F3 R   |   5 next_lin   000923 R
  5 next_tok   000967 R   |   5 no_match   00103E R   |   5 other      000E1D R
  3 pad        0016E0 R   |   5 pad_ref    002300 R   |   5 parse_bi   000BF2 R
  5 parse_in   000BA8 R   |   5 parse_ke   000C2F R   |   5 parse_qu   000B53 R
  5 pause      001DB0 R   |   5 pause02    001DBA R   |   5 peek       00164E R
  5 pin_mode   001EAC R   |   5 plus_tst   000D94 R   |   5 poke       00163F R
  5 power_ad   001850 R   |   5 prcnt_ts   000DB5 R   |   5 print      0014BF R
  5 print_ex   001524 R   |   5 print_in   0009BC R   |   5 print_ty   001530 R
  5 program_   00013C R   |   5 program_   00015C R   |   5 prt_basi   001389 R
  5 prt_cmd_   001331 R   |   5 prt_loop   0014C3 R   |   5 prt_quot   001345 R
  5 prt_tok    0002E7 R   |   5 prti24     0009CC R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002A0 R   |   5 puts       0002B3 R
  5 qkey       001CEC GR  |   5 qmark_ts   000D41 R   |   5 random     001F1D R
  5 read       0021B9 R   |   5 read01     0021BB R   |   5 readln     000AC7 R
  5 readln_l   000ACF R   |   5 readln_q   000B44 R   |   5 refresh_   002049 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 rel_exit   001217 R   |   5 relation   0011BF R   |   5 relop_st   0014A4 R
  5 remark     0015BC R   |   5 reprint    000AF1 R   |   5 reset_co   0014C1 R
  5 rest_con   001540 R   |   5 restore    00216E R   |   5 return     00178E R
  5 right_ar   000AF1 R   |   5 row_alig   00198C R   |   5 row_eras   000101 R
  5 row_eras   000128 R   |   5 row_loop   000338 R   |   5 rparnt_t   000CFF R
  5 rshift     001E87 R   |   5 rt_msg     000844 R   |   5 run        0017AC R
  5 run_it     0017DE R   |   1 rx_char    000025 R   |   5 save       001A68 R
  5 save_con   001530 R   |   5 search_d   00101E R   |   5 search_e   001068 R
  5 search_f   001A1B R   |   5 search_l   000400 R   |   5 search_l   000408 R
  5 search_n   001022 R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   0019B5 R   |   5 select_p   001EED R   |   5 set_time   001FEA R
  5 sharp_ts   000D20 R   |   5 show       00121A R   |   5 show_row   000326 R
  5 single_c   00149A R   |   5 size       001265 R   |   5 skip       000EB1 R
  5 slash_ts   000DAA R   |   5 sleep      001DA5 R   |   5 software   000585 R
  5 spaces     0002DB R   |   5 spi_clea   00225E R   |   5 spi_disa   002246 R
  5 spi_enab   002213 R   |   5 spi_rcv_   002280 R   |   5 spi_read   0022AB R
  5 spi_sele   0022B3 R   |   5 spi_send   00226A R   |   5 spi_writ   00228B R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000D9F R
  5 step       0016CC R   |   5 stop       00192B R   |   5 store_lo   0016E0 R
  5 str_matc   00104B R   |   5 str_tst    000C9F R   |   5 strcmp     00039F R
  5 strcpy     0003B0 R   |   5 strlen     000392 R   |   5 syntax_e   000875 R
  1 tab_widt   000024 R   |   5 tb_error   000877 R   |   5 term       001127 R
  5 term01     001130 R   |   5 term_exi   001173 R   |   3 tib        001690 R
  5 tick_tst   000D59 R   |   1 ticks      00000E R   |   5 timeout    001FF9 R
  1 timer      000010 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  5 tk_id      000865 R   |   5 to         00169C R   |   5 to_eepro   00017F R
  5 to_flash   000193 R   |   5 to_upper   000E3B GR  |   5 token_ch   000E34 R
  5 token_ex   000E38 R   |   5 token_ms   00031E R   |   5 tone       00180C R
  5 try_next   0021A9 R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_in   000265 R   |   5 uart1_se   000275 R   |   5 ubound     00126F R
  5 udiv32_1   000F1F R   |   5 uflash     001D21 R   |   5 umstar     000EC4 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R   |   5 until      0020A7 R
  5 user_int   000060 R   |   5 user_spa   002700 R   |   5 usr        001D27 R
  5 var_name   001381 R   |   1 vars       000026 R   |   5 wait       0015C2 R
  5 warm_ini   000676 R   |   5 warm_sta   0008FC R   |   5 words      001F84 R
  5 words_co   001FD4 R   |   5 write      001C7B R   |   5 write_bl   000242 R
  5 write_by   0001CD R   |   5 write_ee   000209 R   |   5 write_ex   00023D R
  5 write_fl   0001F3 R   |   5 write_ro   000170 R   |     xreceive   ****** GX
  5 zero_pad   001981 R

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

