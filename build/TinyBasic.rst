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
      00001A                         79 ffree: .blkb 3 ; flash free address ; file system free space pointer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      008000 82 00 85 6F            105     int cold_start			; RESET vector 
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
      008064 82 00 80 B7            134 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



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
      0080A6 CC 85 6F         [ 2]  183 	jp cold_start 	
      0080A9                        184 2$: 
      0080A9 A1 1A            [ 1]  185 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  186 	jrne 3$
      0080AD CD 86 34         [ 4]  187 	call cancel_autorun 
      0080B0 CC 85 6F         [ 2]  188 	jp cold_start 
      0080B3 C7 00 26         [ 1]  189 3$:	ld rx_char,a 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



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
      0080E7 72 11 00 24      [ 1]  244 	bres flags,#FRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080EB AE 81 02         [ 2]  245 	ldw x,#USER_ABORT
      0080EE CD 82 57         [ 4]  246 	call puts 
      0080F1 CE 00 05         [ 2]  247 	ldw x,basicptr 
      0080F4 C6 00 02         [ 1]  248 	ld a,in 
      0080F7 CD 93 11         [ 4]  249 	call prt_basic_line
      0080FA                        250 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  251     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  252     ldw sp,x
      0080FE 9A               [ 1]  253 	rim 
      0080FF CC 88 9C         [ 2]  254 	jp warm_start
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
                                    296 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



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
      008155 35 AE 50 64      [ 1]  322 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008159 35 56 50 64      [ 1]  323     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00815D 72 07 50 5F FB   [ 2]  324 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008162 81               [ 4]  325 	ret
                                    326 
                                    327 ;----------------------------------
                                    328 ; unlock FLASH for writing/erasing
                                    329 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    330 ; input:
                                    331 ;  none
                                    332 ; output:
                                    333 ;  none
                                    334 ;----------------------------------
      008163                        335 unlock_flash:
      008163 35 56 50 62      [ 1]  336 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008167 35 AE 50 62      [ 1]  337 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00816B 72 03 50 5F FB   [ 2]  338 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008170 81               [ 4]  339 	ret
                                    340 
                           000000   341 USE_BLOCK_ERASE=0 
                           000000   342 .if USE_BLOCK_ERASE 
                                    343 ; this code is copied to RAM 
                                    344 
                                    345 ;----------------------------
                                    346 ; erase block code must be 
                                    347 ; executed from RAM
                                    348 ;-----------------------------
                                    349 erase_start:
                                    350 	clr a 
                                    351     bset FLASH_CR2,#FLASH_CR2_ERASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    352     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    353 	ldf [farptr],a
                                    354     inc farptr+2 
                                    355     ldf [farptr],a
                                    356     inc farptr+2 
                                    357     ldf [farptr],a
                                    358     inc farptr+2 
                                    359     ldf [farptr],a
                                    360 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    361 	ret
                                    362 erase_end:
                                    363 
                                    364 ; copy erase_start in RAM 
                                    365 move_code_in_ram:
                                    366 	ldw x,#erase_end 
                                    367 	subw x,#erase_start
                                    368 	ldw acc16,x 
                                    369 	ldw x,#pad 
                                    370 	ldw y,#erase_start 
                                    371 	call move 
                                    372 	ret 
                                    373 
                                    374 ;-----------------------------------
                                    375 ; erase flash or EEPROM block 
                                    376 ; a block is 128 bytes 
                                    377 ; input:
                                    378 ;   farptr  address block begin
                                    379 ; output:
                                    380 ;   none
                                    381 ;--------------------------------------
                                    382 erase_block:
                                    383 	ldw x,farptr+1 
                                    384 	pushw x 
                                    385 	call move_code_in_ram 
                                    386 	popw x 
                                    387 	ldw farptr+1,x 
                                    388 	tnz farptr
                                    389 	jrne erase_flash 
                                    390 	ldw x,#FLASH_BASE 
                                    391 	cpw x,farptr+1 
                                    392 	jrpl erase_flash 
                                    393 ; erase eeprom block
                                    394 	call unlock_eeprom 
                                    395 	sim 
                                    396 	call pad   
                                    397 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    398 	rim 
                                    399 	ret 
                                    400 ; erase flash block:
                                    401 erase_flash:
                                    402 	call unlock_flash 
                                    403 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    404 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    405 	clr a 
                                    406 	sim 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    407 	call pad 
                                    408     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    409 	rim 
                                    410 	ret 
                                    411 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    412 
                                    413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    414 ; write a byte to FLASH or EEPROM/OPTION  
                                    415 ; input:
                                    416 ;    a  		byte to write
                                    417 ;    farptr  	address
                                    418 ;    x          farptr[x]
                                    419 ; output:
                                    420 ;    none
                                    421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    422 	; variables locales
                           000001   423 	BTW = 1   ; byte to write offset on stack
                           000002   424 	OPT = 2   ; OPTION flag offset on stack
                           000002   425 	VSIZE = 2
      008171                        426 write_byte:
      008171 90 89            [ 2]  427 	pushw y
      0000F3                        428 	_vars VSIZE
      008173 52 02            [ 2]    1     sub sp,#VSIZE 
      008175 6B 01            [ 1]  429 	ld (BTW,sp),a ; byte to write 
      008177 0F 02            [ 1]  430 	clr (OPT,sp)  ; OPTION flag
                                    431 ; put addr[15:0] in Y, for bounds check.
      008179 90 CE 00 18      [ 2]  432 	ldw y,farptr+1   ; Y=addr15:0
                                    433 ; check addr[23:16], if <> 0 then it is extened flash memory
      00817D 72 5D 00 17      [ 1]  434 	tnz farptr 
      008181 26 14            [ 1]  435 	jrne write_flash
      008183 90 A3 A6 80      [ 2]  436     cpw y,#user_space
      008187 24 0E            [ 1]  437     jruge write_flash
      008189 90 A3 40 00      [ 2]  438 	cpw y,#EEPROM_BASE  
      00818D 25 52            [ 1]  439     jrult write_exit
      00818F 90 A3 48 7F      [ 2]  440 	cpw y,#OPTION_END 
      008193 22 4C            [ 1]  441 	jrugt write_exit
      008195 20 16            [ 2]  442 	jra write_eeprom 
                                    443 ; write program memory
      008197                        444 write_flash:
      008197 CD 81 63         [ 4]  445 	call unlock_flash 
      00819A 9B               [ 1]  446 1$:	sim 
      00819B 7B 01            [ 1]  447 	ld a,(BTW,sp)
      00819D 92 A7 00 17      [ 4]  448 	ldf ([farptr],x),a ; farptr[x]=A
      0081A1 72 05 50 5F FB   [ 2]  449 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081A6 9A               [ 1]  450     rim 
      0081A7 72 13 50 5F      [ 1]  451     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081AB 20 34            [ 2]  452     jra write_exit
                                    453 ; write eeprom and option
      0081AD                        454 write_eeprom:
      0081AD CD 81 55         [ 4]  455 	call unlock_eeprom
                                    456 	; check for data eeprom or option eeprom
      0081B0 90 A3 48 00      [ 2]  457 	cpw y,#OPTION_BASE
      0081B4 2B 08            [ 1]  458 	jrmi 1$
      0081B6 90 A3 48 80      [ 2]  459 	cpw y,#OPTION_END+1
      0081BA 2A 02            [ 1]  460 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081BC 03 02            [ 1]  461 	cpl (OPT,sp)
      0081BE                        462 1$: 
      0081BE 0D 02            [ 1]  463     tnz (OPT,sp)
      0081C0 27 08            [ 1]  464     jreq 2$
                                    465 	; pour modifier une option il faut modifier ces 2 bits
      0081C2 72 1E 50 5B      [ 1]  466     bset FLASH_CR2,#FLASH_CR2_OPT
      0081C6 72 1F 50 5C      [ 1]  467     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081CA                        468 2$: 
      0081CA 7B 01            [ 1]  469     ld a,(BTW,sp)
      0081CC 92 A7 00 17      [ 4]  470     ldf ([farptr],x),a
      0081D0 0D 02            [ 1]  471     tnz (OPT,sp)
      0081D2 27 08            [ 1]  472     jreq 3$
      0081D4 5C               [ 2]  473     incw x
      0081D5 7B 01            [ 1]  474     ld a,(BTW,sp)
      0081D7 43               [ 1]  475     cpl a
      0081D8 92 A7 00 17      [ 4]  476     ldf ([farptr],x),a
      0081DC 72 05 50 5F FB   [ 2]  477 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E1                        478 write_exit:
      000161                        479 	_drop VSIZE 
      0081E1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081E3 90 85            [ 2]  480 	popw y
      0081E5 81               [ 4]  481     ret
                                    482 
                                    483 ;--------------------------------------------
                                    484 ; write a data block to eeprom or flash 
                                    485 ; input:
                                    486 ;   Y        source address   
                                    487 ;   X        array index  destination  farptr[x]
                                    488 ;   BSIZE    block size bytes 
                                    489 ;   farptr   write address , byte* 
                                    490 ; output:
                                    491 ;	X 		after last byte written 
                                    492 ;   Y 		after last byte read 
                                    493 ;  farptr   point after block
                                    494 ;---------------------------------------------
      0081E6                        495 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000166                        496 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    497 	; local var 
                           000001   498 	XSAVE=1 
                           000002   499 	VSIZE=2 
      000166                        500 write_block:
      000166                        501 	_vars VSIZE
      0081E6 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E8 1F 01            [ 2]  502 	ldw (XSAVE,sp),x 
      0081EA 1E 05            [ 2]  503 	ldw x,(BSIZE,sp) 
      0081EC 27 13            [ 1]  504 	jreq 9$
      0081EE 1E 01            [ 2]  505 1$:	ldw x,(XSAVE,sp)
      0081F0 90 F6            [ 1]  506 	ld a,(y)
      0081F2 CD 81 71         [ 4]  507 	call write_byte 
      0081F5 5C               [ 2]  508 	incw x 
      0081F6 90 5C            [ 2]  509 	incw y 
      0081F8 1F 01            [ 2]  510 	ldw (XSAVE,sp),x
      0081FA 1E 05            [ 2]  511 	ldw x,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FC 5A               [ 2]  512 	decw x
      0081FD 1F 05            [ 2]  513 	ldw (BSIZE,sp),x 
      0081FF 26 ED            [ 1]  514 	jrne 1$
      008201                        515 9$:
      008201 1E 01            [ 2]  516 	ldw x,(XSAVE,sp)
      008203 CD 99 23         [ 4]  517 	call incr_farptr
      000186                        518 	_drop VSIZE
      008206 5B 02            [ 2]    1     addw sp,#VSIZE 
      008208 81               [ 4]  519 	ret 
                                    520 
                                    521 
                                    522 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    523 ;;   UART1 subroutines
                                    524 ;;   used for user interface 
                                    525 ;;   communication channel.
                                    526 ;;   settings: 
                                    527 ;;		115200 8N1 no flow control
                                    528 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    529 
                                    530 ;---------------------------------------------
                                    531 ; initialize UART1, 115200 8N1
                                    532 ; input:
                                    533 ;	none
                                    534 ; output:
                                    535 ;   none
                                    536 ;---------------------------------------------
      008209                        537 uart1_init:
      008209 72 1A 50 02      [ 1]  538     bset PA_DDR,#UART1_TX_PIN
      00820D 72 1A 50 03      [ 1]  539     bset PA_CR1,#UART1_TX_PIN 
      008211 72 1A 50 04      [ 1]  540     bset PA_CR2,#UART1_TX_PIN 
                                    541 ; enable UART1 clock
      008215 72 14 50 C7      [ 1]  542 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008219                        543 uart1_set_baud: 
                                    544 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    545 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008219 A6 E1            [ 1]  546 	ld a,#CLK_SWR_HSI
      00821B C1 50 C3         [ 1]  547 	cp a,CLK_CMSR 
      00821E 27 0A            [ 1]  548 	jreq 2$ 
      008220                        549 1$: ; 8 Mhz 	
      008220 35 05 52 33      [ 1]  550 	mov UART1_BRR2,#0x05 ; must be loaded first
      008224 35 04 52 32      [ 1]  551 	mov UART1_BRR1,#0x4
      008228 20 08            [ 2]  552 	jra 3$
      00822A                        553 2$: ; 16 Mhz 	
      00822A 35 0B 52 33      [ 1]  554 	mov UART1_BRR2,#0x0b ; must be loaded first
      00822E 35 08 52 32      [ 1]  555 	mov UART1_BRR1,#0x08
      008232                        556 3$:
      008232 72 5F 52 31      [ 1]  557     clr UART1_DR
      008236 35 2C 52 35      [ 1]  558 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00823A 72 10 52 35      [ 1]  559 	bset UART1_CR2,#UART_CR2_SBK
      00823E 72 0D 52 30 FB   [ 2]  560     btjf UART1_SR,#UART_SR_TC,.
      008243 81               [ 4]  561     ret
                                    562 
                                    563 ;---------------------------------
                                    564 ; send character to UART1 
                                    565 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    566 ;   A 
                                    567 ; output:
                                    568 ;   none 
                                    569 ;--------------------------------	
      008244                        570 putc:
      008244 72 0F 52 30 FB   [ 2]  571 	btjf UART1_SR,#UART_SR_TXE,.
      008249 C7 52 31         [ 1]  572 	ld UART1_DR,a 
      00824C 81               [ 4]  573 	ret 
                                    574 
                                    575 ;---------------------------------
                                    576 ; wait character from UART1 
                                    577 ; input:
                                    578 ;   none
                                    579 ; output:
                                    580 ;   A 			char  
                                    581 ;--------------------------------	
      00824D                        582 getc:
      00824D C6 00 26         [ 1]  583 	ld a,rx_char 
      008250 27 FB            [ 1]  584 	jreq getc 
      008252 72 5F 00 26      [ 1]  585 	clr rx_char 
      008256 81               [ 4]  586 	ret 
                                    587 
                                    588 ;-----------------------------
                                    589 ; send an ASCIZ string to UART1 
                                    590 ; input: 
                                    591 ;   x 		char * 
                                    592 ; output:
                                    593 ;   none 
                                    594 ;-------------------------------
      008257                        595 puts:
      008257 F6               [ 1]  596     ld a,(x)
      008258 27 06            [ 1]  597 	jreq 1$
      00825A CD 82 44         [ 4]  598 	call putc 
      00825D 5C               [ 2]  599 	incw x 
      00825E 20 F7            [ 2]  600 	jra puts 
      008260 81               [ 4]  601 1$:	ret 
                                    602 
                                    603 
                                    604 ;---------------------------
                                    605 ; delete character at left 
                                    606 ; of cursor on terminal 
                                    607 ; input:
                                    608 ;   none 
                                    609 ; output:
                                    610 ;	none 
                                    611 ;---------------------------
      008261                        612 bksp:
      008261 A6 08            [ 1]  613 	ld a,#BS 
      008263 CD 82 44         [ 4]  614 	call putc 
      008266 A6 20            [ 1]  615 	ld a,#SPACE 
      008268 CD 82 44         [ 4]  616 	call putc 
      00826B A6 08            [ 1]  617 	ld a,#BS 
      00826D CD 82 44         [ 4]  618 	call putc 
      008270 81               [ 4]  619 	ret 
                                    620 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    621 ; delete n character left of cursor 
                                    622 ; at terminal.
                                    623 ; input: 
                                    624 ;   A   number of characters to delete.
                                    625 ; output:
                                    626 ;    none 
                                    627 ;--------------------------	
      008271                        628 delete:
      008271 88               [ 1]  629 	push a 
      008272 0D 01            [ 1]  630 0$:	tnz (1,sp)
      008274 27 07            [ 1]  631 	jreq 1$
      008276 CD 82 61         [ 4]  632 	call bksp 
      008279 0A 01            [ 1]  633 	dec (1,sp)
      00827B 20 F5            [ 2]  634 	jra 0$
      00827D 84               [ 1]  635 1$:	pop a 
      00827E 81               [ 4]  636 	ret
                                    637 
                                    638 ;--------------------------
                                    639 ; print n spaces on terminal
                                    640 ; input:
                                    641 ;  X 		number of spaces 
                                    642 ; output:
                                    643 ;	none 
                                    644 ;---------------------------
      00827F                        645 spaces:
      00827F A6 20            [ 1]  646 	ld a,#SPACE 
      008281 5D               [ 2]  647 1$:	tnzw x
      008282 27 06            [ 1]  648 	jreq 9$
      008284 CD 82 44         [ 4]  649 	call putc 
      008287 5A               [ 2]  650 	decw x
      008288 20 F7            [ 2]  651 	jra 1$
      00828A                        652 9$: 
      00828A 81               [ 4]  653 	ret 
                                    654 
                                    655 ;----------------------
                                    656 ; print token id && value
                                    657 ; input:
                                    658 ;   A     token id 
                                    659 ;   X     token value 
                                    660 ;---------------------
                           000001   661 	BSAVE=1
                           000002   662 	AREG=2
                           000003   663 	XREG=3
                           000004   664 	VSIZE=4
      00828B                        665 prt_tok:
      00020B                        666 	_vars VSIZE 
      00828B 52 04            [ 2]    1     sub sp,#VSIZE 
      00828D 6B 02            [ 1]  667 	ld (AREG,sp),a 
      00828F 1F 03            [ 2]  668 	ldw (XREG,sp),x 
      008291 C6 00 0B         [ 1]  669 	ld a, base
      008294 6B 01            [ 1]  670 	ld (BSAVE,sp),a 
      008296 35 10 00 0B      [ 1]  671 	mov base,#16  
      00829A AE 82 C2         [ 2]  672 	ldw x,#token_msg
      00829D CD 82 57         [ 4]  673 	call puts 
      0082A0 5F               [ 1]  674 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082A1 7B 02            [ 1]  675 	ld a,(AREG,sp)
      0082A3 97               [ 1]  676 	ld xl,a 
      0082A4 CD 89 A4         [ 4]  677 	call print_int 
      0082A7 A6 20            [ 1]  678 	ld a,#SPACE
      0082A9 CD 82 44         [ 4]  679 	call putc 
      0082AC 1E 03            [ 2]  680 	ldw x,(XREG,sp)
      0082AE CD 89 A4         [ 4]  681 	call print_int 
      0082B1 A6 0D            [ 1]  682 	ld a,#CR 
      0082B3 CD 82 44         [ 4]  683 	call putc 
      0082B6 7B 01            [ 1]  684 	ld a,(BSAVE,sp)
      0082B8 C7 00 0B         [ 1]  685 	ld base,a 
      0082BB 7B 02            [ 1]  686 	ld a,(AREG,sp)
      0082BD 1E 03            [ 2]  687 	ldw x,(XREG,sp)
      00023F                        688 	_drop VSIZE 
      0082BF 5B 04            [ 2]    1     addw sp,#VSIZE 
      0082C1 81               [ 4]  689 	ret 
      0082C2 74 6F 6B 65 6E 3A 20   690 token_msg: .asciz "token: "
             00
                                    691 
                                    692 
                                    693 ;---------------------
                                    694 ; display n bytes row 
                                    695 ; from memory.
                                    696 ; input:
                                    697 ;   A   bytes to print 
                                    698 ;	X   start address 
                                    699 ; output:
                                    700 ;   X   address after last shown  
                                    701 ;---------------------
                           000001   702 	CNT=1 
                           000002   703 	ADR=2 
                           000003   704 	VSIZE=3 
      0082CA                        705 show_row:
      0082CA 4D               [ 1]  706 	tnz a 
      0082CB 26 01            [ 1]  707 	jrne 1$
      0082CD 81               [ 4]  708 	ret 
      0082CE                        709 1$:	
      0082CE 89               [ 2]  710 	pushw x  
      0082CF 88               [ 1]  711 	push a 
      0082D0 35 04 00 25      [ 1]  712 	mov tab_width,#4 
      0082D4 CD 89 A4         [ 4]  713 	call print_int 
      0082D7 A6 20            [ 1]  714 	ld a,#SPACE  
      0082D9 CD 82 44         [ 4]  715 	call putc
      0082DC                        716 row_loop:
      0082DC 1E 02            [ 2]  717 	ldw x,(ADR,sp)
      0082DE F6               [ 1]  718 	ld a,(x)
      0082DF 5F               [ 1]  719 	clrw x 
      0082E0 97               [ 1]  720 	ld xl,a 
      0082E1 CD 89 A4         [ 4]  721 	call print_int 
      0082E4 1E 02            [ 2]  722 	ldw x,(ADR,sp)
      0082E6 5C               [ 2]  723 	incw x 
      0082E7 1F 02            [ 2]  724 	ldw (ADR,sp),x 
      0082E9 0A 01            [ 1]  725 	dec (CNT,sp)
      0082EB 26 EF            [ 1]  726 	jrne row_loop
      00026D                        727 	_drop VSIZE  		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      0082ED 5B 03            [ 2]    1     addw sp,#VSIZE 
      0082EF 35 04 00 25      [ 1]  728 	mov tab_width,#4
      0082F3 A6 0D            [ 1]  729 	ld a,#CR 
      0082F5 CD 82 44         [ 4]  730 	call putc 
      0082F8 81               [ 4]  731 	ret 
                                    732 
                                    733 ;--------------------------
                                    734 ; print memory content 
                                    735 ; in hexadecimal format
                                    736 ;  input:
                                    737 ;    X    start address 
                                    738 ;    Y    count 
                                    739 ;--------------------------
                           000001   740 	BCNT=1
                           000003   741 	BASE=3
                           000004   742 	TABW=4
                           000004   743 	VSIZE=4   
      0082F9                        744 hex_dump:
      000279                        745 	_vars VSIZE
      0082F9 52 04            [ 2]    1     sub sp,#VSIZE 
      0082FB C6 00 0B         [ 1]  746 	ld a,base
      0082FE 6B 03            [ 1]  747 	ld (BASE,sp),a 
      008300 35 10 00 0B      [ 1]  748 	mov base,#16
      008304 C6 00 25         [ 1]  749 	ld a,tab_width 
      008307 6B 04            [ 1]  750 	ld (TABW,sp),a
      008309 A6 0D            [ 1]  751 	ld a,#CR 
      00830B CD 82 44         [ 4]  752 	call putc 
      00830E 17 01            [ 2]  753 1$: ldw (BCNT,sp),y
      008310 A6 10            [ 1]  754 	ld a,#16
      008312 90 A3 00 10      [ 2]  755 	cpw y,#16
      008316 2A 02            [ 1]  756 	jrpl 2$
      008318 90 9F            [ 1]  757 	ld a,yl
      00831A                        758 2$: 	
      00831A CD 82 CA         [ 4]  759 	call show_row 
      00831D 16 01            [ 2]  760 	ldw y,(BCNT,sp) 
      00831F 72 A2 00 10      [ 2]  761 	subw y,#16 
      008323 90 A3 00 01      [ 2]  762 	cpw y,#1
      008327 2A E5            [ 1]  763 	jrpl 1$
      008329 7B 03            [ 1]  764 	ld a,(BASE,sp)
      00832B C7 00 0B         [ 1]  765 	ld base,a
      00832E 7B 04            [ 1]  766 	ld a,(TABW,sp)
      008330 C7 00 25         [ 1]  767 	ld tab_width,a 
      0002B3                        768 	_drop VSIZE
      008333 5B 04            [ 2]    1     addw sp,#VSIZE 
      008335 81               [ 4]  769 	ret 
                                    770 
                                    771 ;-------------------------------------
                                    772 ; retrun string length
                                    773 ; input:
                                    774 ;   X         .asciz  pointer 
                                    775 ; output:
                                    776 ;   X         length 
                                    777 ;-------------------------------------
      008336                        778 strlen:
      008336 90 93            [ 1]  779 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008338 5F               [ 1]  780 	clrw x 
      008339 90 7D            [ 1]  781 1$:	tnz (y) 
      00833B 27 05            [ 1]  782 	jreq 9$ 
      00833D 5C               [ 2]  783 	incw x
      00833E 90 5C            [ 2]  784 	incw y 
      008340 20 F7            [ 2]  785 	jra 1$ 
      008342 81               [ 4]  786 9$: ret 
                                    787 
                                    788 ;------------------------------------
                                    789 ; compare 2 strings
                                    790 ; input:
                                    791 ;   X 		char* first string 
                                    792 ;   Y       char* second string 
                                    793 ; output:
                                    794 ;   A 		0|1 
                                    795 ;-------------------------------------
      008343                        796 strcmp:
      008343 F6               [ 1]  797 	ld a,(x)
      008344 27 0B            [ 1]  798 	jreq 5$ 
      008346 90 F1            [ 1]  799 	cp a,(y) 
      008348 26 05            [ 1]  800 	jrne 4$ 
      00834A 5C               [ 2]  801 	incw x 
      00834B 90 5C            [ 2]  802 	incw y 
      00834D 20 F4            [ 2]  803 	jra strcmp 
      00834F                        804 4$: ; not same  
      00834F 4F               [ 1]  805 	clr a 
      008350 81               [ 4]  806 	ret 
      008351                        807 5$: ; same 
      008351 A6 01            [ 1]  808 	ld a,#1 
      008353 81               [ 4]  809 	ret 
                                    810 
                                    811 
                                    812 ;---------------------------------------
                                    813 ;  copy src to dest 
                                    814 ; input:
                                    815 ;   X 		dest 
                                    816 ;   Y 		src 
                                    817 ; output: 
                                    818 ;   X 		dest 
                                    819 ;----------------------------------
      008354                        820 strcpy:
      008354 89               [ 2]  821 	pushw x 
      008355 90 F6            [ 1]  822 1$: ld a,(y)
      008357 27 06            [ 1]  823 	jreq 9$ 
      008359 F7               [ 1]  824 	ld (x),a 
      00835A 5C               [ 2]  825 	incw x 
      00835B 90 5C            [ 2]  826 	incw y 
      00835D 20 F6            [ 2]  827 	jra 1$ 
      00835F 7F               [ 1]  828 9$:	clr (x)
      008360 85               [ 2]  829 	popw x 
      008361 81               [ 4]  830 	ret 
                                    831 
                                    832 ;---------------------------------------
                                    833 ; move memory block 
                                    834 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    835 ;   X 		destination 
                                    836 ;   Y 	    source 
                                    837 ;   acc16	bytes count 
                                    838 ; output:
                                    839 ;   none 
                                    840 ;--------------------------------------
                           000001   841 	INCR=1 ; increament high byte 
                           000002   842 	LB=2 ; increament low byte 
                           000002   843 	VSIZE=2
      008362                        844 move:
      0002E2                        845 	_vars VSIZE 
      008362 52 02            [ 2]    1     sub sp,#VSIZE 
      008364 0F 01            [ 1]  846 	clr (INCR,sp)
      008366 0F 02            [ 1]  847 	clr (LB,sp)
      008368 90 89            [ 2]  848 	pushw y 
      00836A 13 01            [ 2]  849 	cpw x,(1,sp) ; compare DEST to SRC 
      00836C 90 85            [ 2]  850 	popw y 
      00836E 27 31            [ 1]  851 	jreq move_exit ; x==y 
      008370 2B 0E            [ 1]  852 	jrmi move_down
      008372                        853 move_up: ; start from top address with incr=-1
      008372 72 BB 00 0D      [ 2]  854 	addw x,acc16
      008376 72 B9 00 0D      [ 2]  855 	addw y,acc16
      00837A 03 01            [ 1]  856 	cpl (INCR,sp)
      00837C 03 02            [ 1]  857 	cpl (LB,sp)   ; increment = -1 
      00837E 20 05            [ 2]  858 	jra move_loop  
      008380                        859 move_down: ; start from bottom address with incr=1 
      008380 5A               [ 2]  860     decw x 
      008381 90 5A            [ 2]  861 	decw y
      008383 0C 02            [ 1]  862 	inc (LB,sp) ; incr=1 
      008385                        863 move_loop:	
      008385 C6 00 0D         [ 1]  864     ld a, acc16 
      008388 CA 00 0E         [ 1]  865 	or a, acc8
      00838B 27 14            [ 1]  866 	jreq move_exit 
      00838D 72 FB 01         [ 2]  867 	addw x,(INCR,sp)
      008390 72 F9 01         [ 2]  868 	addw y,(INCR,sp) 
      008393 90 F6            [ 1]  869 	ld a,(y)
      008395 F7               [ 1]  870 	ld (x),a 
      008396 89               [ 2]  871 	pushw x 
      008397 CE 00 0D         [ 2]  872 	ldw x,acc16 
      00839A 5A               [ 2]  873 	decw x 
      00839B CF 00 0D         [ 2]  874 	ldw acc16,x 
      00839E 85               [ 2]  875 	popw x 
      00839F 20 E4            [ 2]  876 	jra move_loop
      0083A1                        877 move_exit:
      000321                        878 	_drop VSIZE
      0083A1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083A3 81               [ 4]  879 	ret 	
                                    880 
                                    881 ;-------------------------------------
                                    882 ; search text area for a line#
                                    883 ; input:
                                    884 ;	X 			line# 
                                    885 ; output:
                                    886 ;   X 			addr of line | 0 
                                    887 ;   Y           line#|insert address if not found  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    888 ;-------------------------------------
                           000001   889 	LL=1 ; line length 
                           000002   890 	LB=2 ; line length low byte 
                           000002   891 	VSIZE=2 
      0083A4                        892 search_lineno:
      000324                        893 	_vars VSIZE
      0083A4 52 02            [ 2]    1     sub sp,#VSIZE 
      0083A6 0F 01            [ 1]  894 	clr (LL,sp)
      0083A8 90 CE 00 1D      [ 2]  895 	ldw y,txtbgn
      0083AC                        896 search_ln_loop:
      0083AC 90 C3 00 1F      [ 2]  897 	cpw y,txtend 
      0083B0 2A 10            [ 1]  898 	jrpl 8$
      0083B2 90 F3            [ 1]  899 	cpw x,(y)
      0083B4 27 0E            [ 1]  900 	jreq 9$
      0083B6 2B 0A            [ 1]  901 	jrmi 8$ 
      0083B8 90 E6 02         [ 1]  902 	ld a,(2,y)
      0083BB 6B 02            [ 1]  903 	ld (LB,sp),a 
      0083BD 72 F9 01         [ 2]  904 	addw y,(LL,sp)
      0083C0 20 EA            [ 2]  905 	jra search_ln_loop 
      0083C2                        906 8$: 
      0083C2 5F               [ 1]  907 	clrw x 	
      0083C3 51               [ 1]  908 	exgw x,y 
      000344                        909 9$: _drop VSIZE
      0083C4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083C6 51               [ 1]  910 	exgw x,y   
      0083C7 81               [ 4]  911 	ret 
                                    912 
                                    913 ;-------------------------------------
                                    914 ; delete line at addr
                                    915 ; input:
                                    916 ;   X 		addr of line i.e DEST for move 
                                    917 ;-------------------------------------
                           000001   918 	LLEN=1
                           000003   919 	SRC=3
                           000004   920 	VSIZE=4
      0083C8                        921 del_line: 
      000348                        922 	_vars VSIZE 
      0083C8 52 04            [ 2]    1     sub sp,#VSIZE 
      0083CA E6 02            [ 1]  923 	ld a,(2,x) ; line length
      0083CC 6B 02            [ 1]  924 	ld (LLEN+1,sp),a 
      0083CE 0F 01            [ 1]  925 	clr (LLEN,sp)
      0083D0 90 93            [ 1]  926 	ldw y,x  
      0083D2 72 F9 01         [ 2]  927 	addw y,(LLEN,sp) ;SRC  
      0083D5 17 03            [ 2]  928 	ldw (SRC,sp),y  ;save source 
      0083D7 90 CE 00 1F      [ 2]  929 	ldw y,txtend 
      0083DB 72 F2 03         [ 2]  930 	subw y,(SRC,sp) ; y=count 
      0083DE 90 CF 00 0D      [ 2]  931 	ldw acc16,y 
      0083E2 16 03            [ 2]  932 	ldw y,(SRC,sp)    ; source
      0083E4 CD 83 62         [ 4]  933 	call move
      0083E7 90 CE 00 1F      [ 2]  934 	ldw y,txtend 
      0083EB 72 F2 01         [ 2]  935 	subw y,(LLEN,sp)
      0083EE 90 CF 00 1F      [ 2]  936 	ldw txtend,y  
      000372                        937 	_drop VSIZE     
      0083F2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083F4 81               [ 4]  938 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    939 
                                    940 ;---------------------------------------------
                                    941 ; create a gap in text area to 
                                    942 ; move new line in this gap
                                    943 ; input:
                                    944 ;    X 			addr gap start 
                                    945 ;    Y 			gap length 
                                    946 ; output:
                                    947 ;    X 			addr gap start 
                                    948 ;--------------------------------------------
                           000001   949 	DEST=1
                           000003   950 	SRC=3
                           000005   951 	LEN=5
                           000006   952 	VSIZE=6 
      0083F5                        953 create_gap:
      000375                        954 	_vars VSIZE
      0083F5 52 06            [ 2]    1     sub sp,#VSIZE 
      0083F7 1F 03            [ 2]  955 	ldw (SRC,sp),x 
      0083F9 17 05            [ 2]  956 	ldw (LEN,sp),y 
      0083FB 90 CF 00 0D      [ 2]  957 	ldw acc16,y 
      0083FF 90 93            [ 1]  958 	ldw y,x ; SRC
      008401 72 BB 00 0D      [ 2]  959 	addw x,acc16  
      008405 1F 01            [ 2]  960 	ldw (DEST,sp),x 
                                    961 ;compute size to move 	
      008407 CE 00 1F         [ 2]  962 	ldw x,txtend 
      00840A 72 F0 03         [ 2]  963 	subw x,(SRC,sp)
      00840D CF 00 0D         [ 2]  964 	ldw acc16,x ; size to move
      008410 1E 01            [ 2]  965 	ldw x,(DEST,sp) 
      008412 CD 83 62         [ 4]  966 	call move
      008415 CE 00 1F         [ 2]  967 	ldw x,txtend
      008418 72 FB 05         [ 2]  968 	addw x,(LEN,sp)
      00841B CF 00 1F         [ 2]  969 	ldw txtend,x
      00039E                        970 9$:	_drop VSIZE 
      00841E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008420 81               [ 4]  971 	ret 
                                    972 
                                    973 ;--------------------------------------------
                                    974 ; insert line in pad into text area 
                                    975 ; first search for already existing 
                                    976 ; replace existing 
                                    977 ; if new line empty delete existing one. 
                                    978 ; input:
                                    979 ;   ptr16		pointer to tokenized line  
                                    980 ; output:
                                    981 ;   none
                                    982 ;---------------------------------------------
                           000001   983 	DEST=1  ; text area insertion address 
                           000003   984 	SRC=3   ; str to insert address 
                           000005   985 	LINENO=5 ; line number 
                           000007   986 	LLEN=7 ; line length 
                           000008   987 	VSIZE=8  
      008421                        988 insert_line:
      0003A1                        989 	_vars VSIZE 
      008421 52 08            [ 2]    1     sub sp,#VSIZE 
      008423 CE 00 1F         [ 2]  990 	ldw x,txtend  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008426 C3 00 1D         [ 2]  991 	cpw x,txtbgn 
      008429 26 15            [ 1]  992 	jrne 0$
                                    993 ;first text line 
      00842B AE 00 02         [ 2]  994 	ldw x,#2 
      00842E 72 D6 00 18      [ 4]  995 	ld a,([ptr16],x)
      008432 5F               [ 1]  996 	clrw x 
      008433 97               [ 1]  997 	ld xl,a
      008434 1F 07            [ 2]  998 	ldw (LLEN,sp),x 
      008436 CE 00 1D         [ 2]  999 	ldw x,txtbgn
      008439 1F 01            [ 2] 1000 	ldw (DEST,sp),x 
      00843B CE 00 1F         [ 2] 1001 	ldw x,txtend 
      00843E 20 37            [ 2] 1002 	jra 4$
      008440 72 CE 00 18      [ 5] 1003 0$:	ldw x,[ptr16]
                                   1004 ; line number
      008444 1F 05            [ 2] 1005 	ldw (LINENO,sp),x 
      008446 AE 00 02         [ 2] 1006 	ldw x,#2 
      008449 72 D6 00 18      [ 4] 1007 	ld a,([ptr16],x)
      00844D 97               [ 1] 1008 	ld xl,a
                                   1009 ; line length
      00844E 1F 07            [ 2] 1010 	ldw (LLEN,sp),x
                                   1011 ; check if that line number already exit 	
      008450 1E 05            [ 2] 1012 	ldw x,(LINENO,sp)
      008452 CD 83 A4         [ 4] 1013 	call search_lineno 
      008455 5D               [ 2] 1014 	tnzw x 
      008456 26 04            [ 1] 1015 	jrne 2$
                                   1016 ; line doesn't exit
                                   1017 ; it will be inserted at this point.  	
      008458 17 01            [ 2] 1018 	ldw (DEST,sp),y 
      00845A 20 05            [ 2] 1019 	jra 3$
                                   1020 ; line exit delete it.
                                   1021 ; it will be replaced by new one 	
      00845C 1F 01            [ 2] 1022 2$: ldw (DEST,sp),x 
      00845E CD 83 C8         [ 4] 1023 	call del_line
      008461                       1024 3$: 
                                   1025 ; insert new line or leave if LLEN==3
                                   1026 ; LLEN==3 means empty line 
      008461 A6 03            [ 1] 1027 	ld a,#3
      008463 11 08            [ 1] 1028 	cp a,(LLEN+1,sp)
      008465 27 24            [ 1] 1029 	jreq insert_ln_exit ; empty line exit.
                                   1030 ; if insertion point at txtend 
                                   1031 ; move no need to create a gap 
      008467 1E 01            [ 2] 1032 	ldw x,(DEST,sp)
      008469 C3 00 1F         [ 2] 1033 	cpw x,txtend 
      00846C 27 09            [ 1] 1034 	jreq 4$ 
                                   1035 ; must create a gap
                                   1036 ; at insertion point  
      00846E 1E 01            [ 2] 1037 	ldw x,(DEST,sp)
      008470 16 07            [ 2] 1038 	ldw y,(LLEN,sp)
      008472 CD 83 F5         [ 4] 1039 	call create_gap
      008475 20 06            [ 2] 1040 	jra 5$
      008477                       1041 4$: 
      008477 72 FB 07         [ 2] 1042 	addw x,(LLEN,sp)
      00847A CF 00 1F         [ 2] 1043 	ldw txtend,x 	 
                                   1044 ; move new line in gap 
      00847D 1E 07            [ 2] 1045 5$:	ldw x,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00847F CF 00 0D         [ 2] 1046 	ldw acc16,x 
      008482 90 AE 16 E0      [ 2] 1047 	ldw y,#pad ;SRC 
      008486 1E 01            [ 2] 1048 	ldw x,(DEST,sp) ; dest address 
      008488 CD 83 62         [ 4] 1049 	call move 
      00848B                       1050 insert_ln_exit:	
      00040B                       1051 	_drop VSIZE
      00848B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00848D 81               [ 4] 1052 	ret
                                   1053 
                                   1054 ;-----------------------------------
                                   1055 ; create token list fromm text line 
                                   1056 ; save this list in pad buffer 
                                   1057 ;  compiled line format: 
                                   1058 ;    line_no  2 bytes {0...32767}
                                   1059 ;    count    1 byte  
                                   1060 ;    tokens   variable length 
                                   1061 ;   
                                   1062 ; input:
                                   1063 ;   none
                                   1064 ; modified variables:
                                   1065 ;   basicptr     token list buffer address 
                                   1066 ;   in.w  		 3|count, i.e. index in buffer
                                   1067 ;   count        length of line | 0  
                                   1068 ;-----------------------------------
                           000001  1069 	XSAVE=1
                           000002  1070 	VSIZE=2
      00848E                       1071 compile:
      00040E                       1072 	_vars VSIZE 
      00848E 52 02            [ 2]    1     sub sp,#VSIZE 
      008490 72 1A 00 24      [ 1] 1073 	bset flags,#FCOMP 
      008494 A6 00            [ 1] 1074 	ld a,#0
      008496 AE 00 00         [ 2] 1075 	ldw x,#0
      008499 CF 16 E0         [ 2] 1076 	ldw pad,x ; destination buffer 
      00849C C7 16 E2         [ 1] 1077 	ld pad+2,a ; count 
      00849F AE 16 E3         [ 2] 1078 	ldw x,#pad+3
      0084A2 72 5F 00 02      [ 1] 1079 	clr in 
      0084A6 CD 8C 8A         [ 4] 1080 	call get_token
      0084A9 A1 84            [ 1] 1081 	cp a,#TK_INTGR
      0084AB 26 11            [ 1] 1082 	jrne 2$
      0084AD A3 00 01         [ 2] 1083 	cpw x,#1 
      0084B0 2A 05            [ 1] 1084 	jrpl 1$
      0084B2 A6 0A            [ 1] 1085 	ld a,#ERR_BAD_VALUE
      0084B4 CC 88 17         [ 2] 1086 	jp tb_error
      0084B7 CF 16 E0         [ 2] 1087 1$:	ldw pad,x 
      0084BA 90 AE 16 E3      [ 2] 1088 	ldw y,#pad+3 
      0084BE 90 A3 17 60      [ 2] 1089 2$:	cpw y,#stack_full 
      0084C2 25 05            [ 1] 1090 	jrult 3$
      0084C4 A6 0F            [ 1] 1091 	ld a,#ERR_BUF_FULL 
      0084C6 CC 88 17         [ 2] 1092 	jp tb_error 
      0084C9                       1093 3$:	
      0084C9 93               [ 1] 1094 	ldw x,y 
      0084CA CD 8C 8A         [ 4] 1095 	call get_token 
      0084CD A1 00            [ 1] 1096 	cp a,#TK_NONE 
      0084CF 26 ED            [ 1] 1097 	jrne 2$ 
                                   1098 ; compilation completed  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084D1 72 A2 16 E0      [ 2] 1099 	subw y,#pad
      0084D5 90 9F            [ 1] 1100     ld a,yl
      0084D7 AE 16 E0         [ 2] 1101 	ldw x,#pad 
      0084DA CF 00 18         [ 2] 1102 	ldw ptr16,x 
      0084DD E7 02            [ 1] 1103 	ld (2,x),a 
      0084DF FE               [ 2] 1104 	ldw x,(x)
      0084E0 27 09            [ 1] 1105 	jreq 10$
      0084E2 CD 84 21         [ 4] 1106 	call insert_line
      0084E5 72 5F 00 04      [ 1] 1107 	clr  count 
      0084E9 20 0F            [ 2] 1108 	jra  11$ 
      0084EB                       1109 10$: ; line# is zero 
      0084EB CE 00 18         [ 2] 1110 	ldw x,ptr16  
      0084EE CF 00 05         [ 2] 1111 	ldw basicptr,x 
      0084F1 E6 02            [ 1] 1112 	ld a,(2,x)
      0084F3 C7 00 04         [ 1] 1113 	ld count,a 
      0084F6 35 03 00 02      [ 1] 1114 	mov in,#3 
      0084FA                       1115 11$:
      00047A                       1116 	_drop VSIZE 
      0084FA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084FC 72 1B 00 24      [ 1] 1117 	bres flags,#FCOMP 
      008500 81               [ 4] 1118 	ret 
                                   1119 
                                   1120 ;------------------------------------
                                   1121 ;  set all variables to zero 
                                   1122 ; input:
                                   1123 ;   none 
                                   1124 ; output:
                                   1125 ;	none
                                   1126 ;------------------------------------
      008501                       1127 clear_vars:
      008501 AE 00 27         [ 2] 1128 	ldw x,#vars 
      008504 90 AE 00 34      [ 2] 1129 	ldw y,#2*26 
      008508 7F               [ 1] 1130 1$:	clr (x)
      008509 5C               [ 2] 1131 	incw x 
      00850A 90 5A            [ 2] 1132 	decw y 
      00850C 26 FA            [ 1] 1133 	jrne 1$
      00850E 81               [ 4] 1134 	ret 
                                   1135 
                                   1136 ;-------------------------------------
                                   1137 ; check if A is a letter 
                                   1138 ; input:
                                   1139 ;   A 			character to test 
                                   1140 ; output:
                                   1141 ;   C flag      1 true, 0 false 
                                   1142 ;-------------------------------------
      00850F                       1143 is_alpha:
      00850F A1 41            [ 1] 1144 	cp a,#'A 
      008511 8C               [ 1] 1145 	ccf
      008512 24 0B            [ 1] 1146 	jrnc 9$ 
      008514 A1 5B            [ 1] 1147 	cp a,#'Z+1 
      008516 25 07            [ 1] 1148 	jrc 9$ 
      008518 A1 61            [ 1] 1149 	cp a,#'a 
      00851A 8C               [ 1] 1150 	ccf 
      00851B 24 02            [ 1] 1151 	jrnc 9$
      00851D A1 7B            [ 1] 1152 	cp a,#'z+1   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00851F 81               [ 4] 1153 9$: ret 	
                                   1154 
                                   1155 ;------------------------------------
                                   1156 ; check if character in {'0'..'9'}
                                   1157 ; input:
                                   1158 ;    A  character to test
                                   1159 ; output:
                                   1160 ;    Carry  0 not digit | 1 digit
                                   1161 ;------------------------------------
      008520                       1162 is_digit:
      008520 A1 30            [ 1] 1163 	cp a,#'0
      008522 25 03            [ 1] 1164 	jrc 1$
      008524 A1 3A            [ 1] 1165     cp a,#'9+1
      008526 8C               [ 1] 1166 	ccf 
      008527 8C               [ 1] 1167 1$:	ccf 
      008528 81               [ 4] 1168     ret
                                   1169 
                                   1170 ;-------------------------------------
                                   1171 ;  program initialization entry point 
                                   1172 ;-------------------------------------
                           000001  1173 	MAJOR=1
                           000000  1174 	MINOR=0
      008529 0A 0A 54 69 6E 79 20  1175 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00856F                       1176 cold_start:
                                   1177 ;set stack 
      00856F AE 17 FF         [ 2] 1178 	ldw x,#STACK_EMPTY
      008572 94               [ 1] 1179 	ldw sp,x   
                                   1180 ; clear all ram 
      008573 7F               [ 1] 1181 0$: clr (x)
      008574 5A               [ 2] 1182 	decw x 
      008575 26 FC            [ 1] 1183 	jrne 0$
                                   1184 ; activate pull up on all inputs 
      008577 A6 FF            [ 1] 1185 	ld a,#255 
      008579 C7 50 03         [ 1] 1186 	ld PA_CR1,a 
      00857C C7 50 08         [ 1] 1187 	ld PB_CR1,a 
      00857F C7 50 0D         [ 1] 1188 	ld PC_CR1,a 
      008582 C7 50 12         [ 1] 1189 	ld PD_CR1,a 
      008585 C7 50 17         [ 1] 1190 	ld PE_CR1,a 
      008588 C7 50 1C         [ 1] 1191 	ld PF_CR1,a 
      00858B C7 50 21         [ 1] 1192 	ld PG_CR1,a 
      00858E C7 50 2B         [ 1] 1193 	ld PI_CR1,a
                                   1194 ; set LD2 pin as output and turn it on
      008591 72 1A 50 0D      [ 1] 1195     bset PC_CR1,#LED2_BIT
      008595 72 1A 50 0E      [ 1] 1196     bset PC_CR2,#LED2_BIT
      008599 72 1A 50 0C      [ 1] 1197     bset PC_DDR,#LED2_BIT
      00859D 72 1A 50 0A      [ 1] 1198 	bset PC_ODR,#LED2_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1199 ; disable schmitt triggers on Arduino CN4 analog inputs
      0085A1 55 00 3F 54 07   [ 1] 1200 	mov ADC_TDRL,0x3f
                                   1201 ; disable peripherals clocks
                                   1202 ;	clr CLK_PCKENR1 
                                   1203 ;	clr CLK_PCKENR2
      0085A6 72 5F 50 F2      [ 1] 1204 	clr AWU_TBR 
      0085AA 72 14 50 CA      [ 1] 1205 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1206 ; select internal clock no divisor: 16 Mhz 	
      0085AE A6 E1            [ 1] 1207 	ld a,#CLK_SWR_HSI 
      0085B0 5F               [ 1] 1208 	clrw x  
      0085B1 CD 81 1D         [ 4] 1209     call clock_init 
      0085B4 CD 81 40         [ 4] 1210 	call timer4_init
      0085B7 CD 81 33         [ 4] 1211 	call timer2_init
                                   1212 ; UART1 at 115200 BAUD
      0085BA CD 82 09         [ 4] 1213 	call uart1_init
                                   1214 ; activate PE_4 (user button interrupt)
      0085BD 72 18 50 18      [ 1] 1215     bset PE_CR2,#USR_BTN_BIT 
                                   1216 ; display system information
      0085C1 AE 85 29         [ 2] 1217 	ldw x,#software 
      0085C4 CD 82 57         [ 4] 1218 	call puts 
      0085C7 A6 01            [ 1] 1219 	ld a,#MAJOR 
      0085C9 C7 00 0E         [ 1] 1220 	ld acc8,a 
      0085CC 5F               [ 1] 1221 	clrw x 
      0085CD CF 00 0C         [ 2] 1222 	ldw acc24,x 
      0085D0 A6 0A            [ 1] 1223 	ld a,#10 
      0085D2 CD 89 5C         [ 4] 1224 	call prti24 
      0085D5 A6 2E            [ 1] 1225 	ld a,#'.
      0085D7 CD 82 44         [ 4] 1226 	call putc 
      0085DA A6 00            [ 1] 1227 	ld a,#MINOR 
      0085DC C7 00 0E         [ 1] 1228 	ld acc8,a 
      0085DF 5F               [ 1] 1229 	clrw x 
      0085E0 CF 00 0C         [ 2] 1230 	ldw acc24,x 
      0085E3 A6 0A            [ 1] 1231 	ld a,#10 
      0085E5 CD 89 5C         [ 4] 1232 	call prti24 
      0085E8 A6 0D            [ 1] 1233 	ld a,#CR 
      0085EA CD 82 44         [ 4] 1234 	call putc 
      0085ED CD 99 31         [ 4] 1235 	call seek_fdrive 
      0085F0 9A               [ 1] 1236 	rim 
      0085F1 72 5C 00 16      [ 1] 1237 	inc seedy+1 
      0085F5 72 5C 00 14      [ 1] 1238 	inc seedx+1 
      0085F9 CD 86 81         [ 4] 1239 	call clear_basic
      0085FC CD 91 F7         [ 4] 1240 	call ubound 
                                   1241 ;	jra 2$	
                                   1242 ; 150 msec beep 
      0085FF AE 00 96         [ 2] 1243 	ldw x,#150 
      008602 90 AE 03 E6      [ 2] 1244 	ldw y,#998 
      008606 CD 97 B6         [ 4] 1245 	call beep  
      008609 72 1B 50 0A      [ 1] 1246 2$:	bres PC_ODR,#LED2_BIT	
      00860D CD 86 16         [ 4] 1247 	call warm_init
      008610 CD 86 43         [ 4] 1248 	call load_autorun
      008613 CC 88 9F         [ 2] 1249     jp cmd_line  
                                   1250 
      008616                       1251 warm_init:
      008616 72 5F 00 24      [ 1] 1252 	clr flags 
      00861A 72 5F 00 21      [ 1] 1253 	clr loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00861E 35 04 00 25      [ 1] 1254 	mov tab_width,#TAB_WIDTH 
      008622 35 0A 00 0B      [ 1] 1255 	mov base,#10 
      008626 AE 00 00         [ 2] 1256 	ldw x,#0 
      008629 CF 00 05         [ 2] 1257 	ldw basicptr,x 
      00862C CF 00 01         [ 2] 1258 	ldw in.w,x 
      00862F 72 5F 00 04      [ 1] 1259 	clr count
      008633 81               [ 4] 1260 	ret 
                                   1261 
                                   1262 ;--------------------------
                                   1263 ; called by tb_error when
                                   1264 ; flag FAUTORUN is set.
                                   1265 ; There is a bug in autorun 
                                   1266 ; program so cancel it.
                                   1267 ;---------------------------
      008634                       1268 cancel_autorun:
      008634 AE 40 00         [ 2] 1269 	ldw x,#AUTORUN_NAME 
      008637 CF 00 18         [ 2] 1270 	ldw farptr+1,x 
      00863A 4F               [ 1] 1271 	clr a
      00863B 5F               [ 1] 1272 	clrw x  
      00863C C7 00 17         [ 1] 1273 	ld farptr,a 
      00863F CD 81 71         [ 4] 1274 	call write_byte 
      008642 81               [ 4] 1275 	ret 
                                   1276 
                                   1277 
                                   1278 ;--------------------------
                                   1279 ; if autorun file defined 
                                   1280 ; in eeprom address AUTORUN_NAME 
                                   1281 ; load and run it.
                                   1282 ;-------------------------
      008643                       1283 load_autorun:
      008643 90 AE 40 00      [ 2] 1284 	ldw y,#AUTORUN_NAME
      008647 90 F6            [ 1] 1285 	ld a,(y)
      008649 27 20            [ 1] 1286 	jreq 9$
      00864B CD 99 8F         [ 4] 1287 	call search_file
      00864E 25 05            [ 1] 1288 	jrc 2$ 
                                   1289 ; if file doesn't exit
      008650 CD 86 34         [ 4] 1290 	call cancel_autorun
      008653 20 16            [ 2] 1291 	jra 9$ 
      008655 CD 9A 99         [ 4] 1292 2$:	call load_file
      008658 AE 40 00         [ 2] 1293 	ldw x,#AUTORUN_NAME 
      00865B CD 82 57         [ 4] 1294 	call puts
      00865E AE 86 6C         [ 2] 1295 	ldw x,#autorun_msg 
      008661 CD 82 57         [ 4] 1296 	call puts 
      008664 72 1C 00 24      [ 1] 1297 	bset flags,#FAUTORUN 
      008668 CC 97 7B         [ 2] 1298 	jp run_it    
      00866B 81               [ 4] 1299 9$: ret 	
                                   1300 
      00866C 20 6C 6F 61 64 65 64  1301 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1302 ;---------------------------
                                   1303 ; reset BASIC text variables 
                                   1304 ; and clear variables 
                                   1305 ;---------------------------
      008681                       1306 clear_basic:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008681 72 5F 00 04      [ 1] 1307 	clr count
      008685 72 5F 00 02      [ 1] 1308 	clr in  
      008689 AE 00 5B         [ 2] 1309 	ldw x,#free_ram 
      00868C CF 00 1D         [ 2] 1310 	ldw txtbgn,x 
      00868F CF 00 1F         [ 2] 1311 	ldw txtend,x 
      008692 CD 85 01         [ 4] 1312 	call clear_vars 
      008695 81               [ 4] 1313 	ret 
                                   1314 
                                   1315 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1316 ;;   Tiny BASIC error messages     ;;
                                   1317 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008696                       1318 err_msg:
      008696 00 00 86 B6 86 C3 86  1319 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             D1 86 EA 86 F9
      0086A2 87 0F 87 25 87 3F 87  1320 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             50 87 61
      0086AC 87 6D 87 A0 87 B0 87  1321 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             C4 87 D7
                                   1322 
      0086B6 4D 65 6D 6F 72 79 20  1323 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0086C3 73 79 6E 74 61 78 20  1324 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0086D1 6D 61 74 68 20 6F 70  1325 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0086EA 64 69 76 69 73 69 6F  1326 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0086F9 69 6E 76 61 6C 69 64  1327 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00870F 72 75 6E 20 74 69 6D  1328 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008725 63 6F 6D 6D 61 6E 64  1329 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      00873F 64 75 70 6C 69 63 61  1330 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      008750 46 69 6C 65 20 6E 6F  1331 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008761 62 61 64 20 76 61 6C  1332 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      00876D 46 69 6C 65 20 69 6E  1333 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  75-Bits]



             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008791 6E 20 66 72 6F 6D 20  1334 err_no_data: .asciz "No data found.\n"
             74 68 65 72 65 2E 0A
             00 4E
      0087A1 6F 20 64 61 74 61 20  1335 err_no_prog: .asciz "No program in RAM!\n"
             66 6F 75 6E 64 2E 0A
             00 4E 6F 20 70 72
      0087B5 6F 67 72 61 6D 20 69  1336 err_no_fspace: .asciz "File system full.\n" 
             6E 20 52 41 4D 21 0A
             00 46 69 6C 65
      0087C8 20 73 79 73 74 65 6D  1337 err_buf_full: .asciz "Buffer full\n"
             20 66 75 6C 6C 2E
                                   1338 
      0087D5 0A 00 42 75 66 66 65  1339 rt_msg: .asciz "run time error, "
             72 20 66 75 6C 6C 0A
             00 72 75
      0087E6 6E 20 74 69 6D 65 20  1340 comp_msg: .asciz "compile error, "
             65 72 72 6F 72 2C 20
             00 63
      0087F6 6F 6D 70 69 6C 65 20  1341 tk_id: .asciz "last token id: "
             65 72 72 6F 72 2C 20
             00 6C
                                   1342 
      000795                       1343 syntax_error:
      008806 61 73            [ 1] 1344 	ld a,#ERR_SYNTAX 
                                   1345 
      000797                       1346 tb_error:
      008808 74 20 74 6F 6B   [ 2] 1347 	btjt flags,#FCOMP,1$
      00880D 65               [ 1] 1348 	push a 
      00880E 6E 20 69         [ 2] 1349 	ldw x, #rt_msg 
      008811 64 3A 20         [ 4] 1350 	call puts 
      008814 00               [ 1] 1351 	pop a 
      008815 AE 06 16         [ 2] 1352 	ldw x, #err_msg 
      008815 A6 02 00 0C      [ 1] 1353 	clr acc16 
      008817 48               [ 1] 1354 	sll a
      008817 72 0A 00 24      [ 1] 1355 	rlc acc16  
      00881B 47 88 AE         [ 1] 1356 	ld acc8, a 
      00881E 87 E4 CD 82      [ 2] 1357 	addw x,acc16 
      008822 57               [ 2] 1358 	ldw x,(x)
      008823 84 AE 86         [ 4] 1359 	call puts
      008826 96 72 5F         [ 2] 1360 	ldw x,basicptr
      008829 00 0D 48         [ 1] 1361 	ld a,in 
      00882C 72 59 00         [ 4] 1362 	call prt_basic_line
      00882F 0D C7 00         [ 2] 1363 	ldw x,#tk_id 
      008832 0E 72 BB         [ 4] 1364 	call puts 
      008835 00 0D FE         [ 1] 1365 	ld a,in.saved 
      008838 CD               [ 1] 1366 	clrw x 
      008839 82               [ 1] 1367 	ld xl,a 
      00883A 57 CE 00 05      [ 2] 1368 	addw x,basicptr 
      00883E C6               [ 1] 1369 	ld a,(x)
      00883F 00               [ 1] 1370 	clrw x 
      008840 02               [ 1] 1371 	ld xl,a 
      008841 CD 93 11         [ 4] 1372 	call print_int
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008844 AE 88 05 CD 82   [ 2] 1373 	btjf flags,#FAUTORUN ,6$
      008849 57 C6 00         [ 4] 1374 	call cancel_autorun  
      00884C 03 5F            [ 2] 1375 	jra 6$
      0007E3                       1376 1$:	
      00884E 97               [ 1] 1377 	push a 
      00884F 72 BB 00         [ 2] 1378 	ldw x,#comp_msg
      008852 05 F6 5F         [ 4] 1379 	call puts 
      008855 97               [ 1] 1380 	pop a 
      008856 CD 89 A4         [ 2] 1381 	ldw x, #err_msg 
      008859 72 0D 00 24      [ 1] 1382 	clr acc16 
      00885D 3A               [ 1] 1383 	sll a
      00885E CD 86 34 20      [ 1] 1384 	rlc acc16  
      008862 35 00 0D         [ 1] 1385 	ld acc8, a 
      008863 72 BB 00 0C      [ 2] 1386 	addw x,acc16 
      008863 88               [ 2] 1387 	ldw x,(x)
      008864 AE 87 F5         [ 4] 1388 	call puts
      008867 CD 82 57         [ 2] 1389 	ldw x,#tib
      00886A 84 AE 86         [ 4] 1390 	call puts 
      00886D 96 72            [ 1] 1391 	ld a,#CR 
      00886F 5F 00 0D         [ 4] 1392 	call putc
      008872 48 72 59         [ 2] 1393 	ldw x,in.w
      008875 00 0D C7         [ 4] 1394 	call spaces
      008878 00 0E            [ 1] 1395 	ld a,#'^
      00887A 72 BB 00         [ 4] 1396 	call putc 
      00887D 0D FE CD         [ 2] 1397 6$: ldw x,#STACK_EMPTY 
      008880 82               [ 1] 1398     ldw sp,x
      00081C                       1399 warm_start:
      008881 57 AE 16         [ 4] 1400 	call warm_init
                                   1401 ;----------------------------
                                   1402 ;   BASIC interpreter
                                   1403 ;----------------------------
      00081F                       1404 cmd_line: ; user interface 
      008884 90 CD            [ 1] 1405 	ld a,#CR 
      008886 82 57 A6         [ 4] 1406 	call putc 
      008889 0D CD            [ 1] 1407 	ld a,#'> 
      00888B 82 44 CE         [ 4] 1408 	call putc
      00888E 00 01 CD         [ 4] 1409 	call readln
      008891 82 7F A6 5E      [ 1] 1410 	tnz count 
      008895 CD 82            [ 1] 1411 	jreq cmd_line
      008897 44 AE 17         [ 4] 1412 	call compile
                                   1413 ; if text begin with a line number
                                   1414 ; the compiler set count to zero    
                                   1415 ; so code is not interpreted
      00889A FF 94 00 03      [ 1] 1416 	tnz count 
      00889C 27 E4            [ 1] 1417 	jreq cmd_line
                                   1418 
                                   1419 ; if direct command 
                                   1420 ; it's ready to interpret 
                                   1421 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1422 ;; This is the interpreter loop
                                   1423 ;; for each BASIC code line. 
                                   1424 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00083B                       1425 interpreter: 
      00889C CD 86 16         [ 1] 1426 	ld a,in 
      00889F C1 00 03         [ 1] 1427 	cp a,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00889F A6 0D            [ 1] 1428 	jrmi interp_loop
      000843                       1429 next_line:
      0088A1 CD 82 44 A6 3E   [ 2] 1430 	btjf flags, #FRUN, cmd_line
      0088A6 CD 82 44         [ 2] 1431 	ldw x,basicptr
      0088A9 CD 8A D5 72      [ 2] 1432 	addw x,in.w 
      0088AD 5D 00 04         [ 2] 1433 	cpw x,txtend 
      0088B0 27 ED            [ 1] 1434 	jrpl warm_start
      0088B2 CD 84 8E         [ 2] 1435 	ldw basicptr,x ; start of next line  
      0088B5 72 5D            [ 1] 1436 	ld a,(2,x)
      0088B7 00 04 27         [ 1] 1437 	ld count,a 
      0088BA E4 03 00 01      [ 1] 1438 	mov in,#3 ; skip first 3 bytes of line 
      0088BB                       1439 interp_loop: 
      0088BB C6 00 02         [ 4] 1440 	call next_token
      0088BE C1 00            [ 1] 1441 	cp a,#TK_NONE 
      0088C0 04 2B            [ 1] 1442 	jreq next_line 
      0088C2 1D 80            [ 1] 1443 	cp a,#TK_CMD
      0088C3 26 03            [ 1] 1444 	jrne 1$
      0088C3 72               [ 4] 1445 	call (x) 
      0088C4 01 00            [ 2] 1446 	jra interp_loop 
      00086E                       1447 1$:	 
      0088C6 24 D7            [ 1] 1448 	cp a,#TK_VAR
      0088C8 CE 00            [ 1] 1449 	jrne 2$
      0088CA 05 72 BB         [ 4] 1450 	call let_var  
      0088CD 00 01            [ 2] 1451 	jra interp_loop 
      000877                       1452 2$:	
      0088CF C3 00            [ 1] 1453 	cp a,#TK_ARRAY 
      0088D1 1F 2A            [ 1] 1454 	jrne 3$
      0088D3 C8 CF 00         [ 4] 1455 	call let_array 
      0088D6 05 E6            [ 2] 1456 	jra interp_loop
      000880                       1457 3$:	
      0088D8 02 C7            [ 1] 1458 	cp a,#TK_COLON 
      0088DA 00 04            [ 1] 1459 	jreq interp_loop 
      0088DC 35 03 00         [ 2] 1460 	jp syntax_error 
                                   1461 
                                   1462 		
                                   1463 ;--------------------------
                                   1464 ; extract next token from
                                   1465 ; token list 
                                   1466 ; basicptr -> base address 
                                   1467 ; in  -> offset in list array 
                                   1468 ; output:
                                   1469 ;   A 		token attribute
                                   1470 ;   X 		token value if there is one
                                   1471 ;----------------------------------------
      000887                       1472 next_token:
      0088DF 02               [ 1] 1473 	clrw x 
      0088E0 C6 00 01         [ 1] 1474 	ld a,in 
      0088E0 CD 89 07         [ 1] 1475 	sub a,count ; don't replace sub by cp!  
      0088E3 A1 00            [ 1] 1476 	jrmi 0$
      0088E5 27               [ 4] 1477 	ret  ; end of BASIC line 
      000891                       1478 0$: 
      0088E6 DC A1 80 26 03   [ 1] 1479 	mov in.saved,in 
      0088EB FD 20 F2 04      [ 2] 1480 	ldw y,basicptr 
      0088EE 91 D6 00         [ 4] 1481 	ld a,([in.w],y)
                                   1482 ;	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088EE A1 85 26 05      [ 1] 1483 	inc in  
      0088F2 CD               [ 1] 1484 	tnz a 
      0088F3 92 2A            [ 1] 1485 	jrmi 6$
      0088F5 20 E9            [ 1] 1486 	cp a,#TK_ARRAY
      0088F7 2A 33            [ 1] 1487 	jrpl 9$  ; no attribute for these
      0088F7 A1 06            [ 1] 1488 	cp a,#TK_COLON
      0088F9 26 05            [ 1] 1489 	jreq 9$  
      0008AC                       1490 1$: ; 
      0088FB CD 92            [ 1] 1491 	cp a,#TK_CHAR
      0088FD 27 20            [ 1] 1492 	jrne 2$
      0088FF E0 D6 00         [ 4] 1493 	ld a,([in.w],y)
      008900 72 5C 00 01      [ 1] 1494 	inc in 
      008900 A1               [ 1] 1495 	exg a,xl  
      008901 01 27            [ 1] 1496 	ld a,#TK_CHAR
      008903 DC               [ 4] 1497 	ret
      008904 CC 88            [ 1] 1498 2$:	cp a,#TK_QSTR 
      008906 15 1C            [ 1] 1499 	jrne 9$
      008907 93               [ 1] 1500 	ldw x,y 
      008907 5F C6 00 02      [ 2] 1501 	addw x,in.w ; pointer to string 
                                   1502 ; move pointer after string 
      00890B C0 00 04         [ 4] 1503 3$:	tnz ([in.w],y)
      00890E 2B 01            [ 1] 1504 	jreq 8$
      008910 81 5C 00 01      [ 1] 1505 	inc in 
      008911 20 F5            [ 2] 1506 	jra 3$
      0008CF                       1507 6$: 
      008911 55 00 02         [ 5] 1508 	ldw y,([in.w],y)
      008914 00               [ 1] 1509 	exgw x,y 
      008915 03 90 CE 00      [ 1] 1510 	inc in
      008919 05 91 D6 01      [ 1] 1511 8$:	inc in 
      0008DB                       1512 9$: 
      00891D 72               [ 4] 1513 	ret	
                                   1514 
                                   1515 
                                   1516 
                                   1517 
                                   1518 ;------------------------------------
                                   1519 ; print integer in acc24 
                                   1520 ; input:
                                   1521 ;	acc24 		integer to print 
                                   1522 ;	A 			numerical base for conversion 
                                   1523 ;               if bit 7 is set add a space at print end.
                                   1524 ;   XL 			field width, 0 -> no fill.
                                   1525 ;  output:
                                   1526 ;    none 
                                   1527 ;------------------------------------
                           000001  1528 	WIDTH = 1
                           000002  1529 	BASE = 2
                           000003  1530 	ADD_SPACE=3 ; add a space after number 
                           000003  1531 	VSIZE = 3
      0008DC                       1532 prti24:
      0008DC                       1533 	_vars VSIZE 
      00891E 5C 00            [ 2]    1     sub sp,#VSIZE 
      008920 02 4D            [ 1] 1534 	clr (ADD_SPACE,sp)
      008922 2B 2B            [ 1] 1535 	bcp a,#0x80 
      008924 A1 06            [ 1] 1536 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008926 2A 33            [ 1] 1537 	cpl (ADD_SPACE,sp)
      008928 A1 01            [ 1] 1538 0$:	and a,#31 
      00892A 27 2F            [ 1] 1539 	ld (BASE,sp),a
      00892C 9F               [ 1] 1540 	ld a,xl
      00892C A1 03            [ 1] 1541 	ld (WIDTH,sp),a 
      00892E 26 0B            [ 1] 1542 	ld a, (BASE,sp)  
      008930 91 D6 01         [ 4] 1543     call itoa  ; conversion entier en  .asciz
      008933 72 5C            [ 1] 1544 1$: ld a,(WIDTH,sp)
      008935 00 02            [ 1] 1545 	jreq 4$
      008937 41 A6 03         [ 1] 1546 	ld acc8,a 
      00893A 81               [ 2] 1547 	pushw x 
      00893B A1 02 26         [ 4] 1548 	call strlen 
      00893E 1C               [ 1] 1549 	ld a,xl 
      00893F 93               [ 2] 1550 	popw x 
      008940 72 BB 00         [ 3] 1551 	exg a,acc8 
      008943 01 91 6D         [ 1] 1552 	sub a,acc8 
      008946 01 27            [ 1] 1553 	jrmi 4$
      008948 0E 72            [ 1] 1554 	ld (WIDTH,sp),a 
      00894A 5C 00            [ 1] 1555 	ld  a,#SPACE
      00894C 02 20            [ 1] 1556 3$: tnz (WIDTH,sp)
      00894E F5 06            [ 1] 1557 	jreq 4$
      00894F 5A               [ 2] 1558 	decw x 
      00894F 91               [ 1] 1559 	ld (x),a 
      008950 DE 01            [ 1] 1560 	dec (WIDTH,sp) 
      008952 51 72            [ 2] 1561 	jra 3$
      000915                       1562 4$: 
      008954 5C 00 02         [ 4] 1563 	call puts 
      008957 72 5C            [ 1] 1564 	tnz (ADD_SPACE,sp)
      008959 00 02            [ 1] 1565 	jreq 5$
      00895B A6 20            [ 1] 1566     ld a,#SPACE 
      00895B 81 01 C4         [ 4] 1567 	call putc 
      00895C                       1568 5$: _drop VSIZE 
      00895C 52 03            [ 2]    1     addw sp,#VSIZE 
      00895E 0F               [ 4] 1569     ret	
                                   1570 
                                   1571 ;-----------------------------------
                                   1572 ; print a 16 bit integer 
                                   1573 ; using variable 'base' as conversion
                                   1574 ; format.
                                   1575 ; input:
                                   1576 ;   X       integer to print 
                                   1577 ;   base    conversion base 
                                   1578 ; output:
                                   1579 ;   none 
                                   1580 ;-----------------------------------
                           000001  1581 	SIGN=1
                           000002  1582 	STRING=2
                                   1583 ;; 9 char on stack for string buffer	
                           00000A  1584 	STREND=2+8 
                           00000A  1585 	VSIZE=10
      000924                       1586 print_int: 
      000924                       1587 	_vars VSIZE 
      00895F 03 A5            [ 2]    1     sub sp,#VSIZE 
      008961 80 27            [ 1] 1588 	clr (SIGN,sp)
      008963 02 03            [ 1] 1589 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008965 03 A4 1F 6B      [ 2] 1590 	addw y,#STREND  
      008969 02 9F            [ 1] 1591 	clr (y)
      00896B 6B 01 7B         [ 1] 1592 	ld a,base  
      00896E 02 CD            [ 1] 1593 	cp a,#10 
      008970 8A 09            [ 1] 1594 	jrne 1$ 
      008972 7B               [ 2] 1595 	tnzw x 
      008973 01 27            [ 1] 1596 	jrpl 1$ 
      008975 1F C7            [ 1] 1597 	cpl (SIGN,sp)
      008977 00               [ 2] 1598 	negw x 	 
      00093D                       1599 1$:	
      008978 0E 89 CD         [ 1] 1600 	ld a,base 
      00897B 83               [ 2] 1601 	div x,a 
      00897C 36 9F            [ 1] 1602 	add a,#'0 
      00897E 85 31            [ 1] 1603 	cp a,#'9+1 
      008980 00 0E            [ 1] 1604 	jrmi 2$ 
      008982 C0 00            [ 1] 1605 	add a,#7 
      008984 0E 2B            [ 2] 1606 2$: decw y 
      008986 0E 6B            [ 1] 1607 	ld (y),a 
      008988 01               [ 2] 1608 	tnzw x 
      008989 A6 20            [ 1] 1609 	jrne 1$ 
      00898B 0D 01            [ 1] 1610 	ld a,#16 
      00898D 27 06 5A         [ 1] 1611 	cp a,base 
      008990 F7 0A            [ 1] 1612 	jrne 3$
      008992 01 20            [ 1] 1613 	ld a,#'$
      008994 F6 5A            [ 2] 1614 	decw y  
      008995 90 F7            [ 1] 1615 	ld (y),a
      008995 CD 82            [ 2] 1616 	jra 9$ 
      008997 57 0D            [ 1] 1617 3$: tnz (SIGN,sp)
      008999 03 27            [ 1] 1618 	jreq 9$ 
      00899B 05 A6            [ 1] 1619 	ld a,#'-
      00899D 20 CD            [ 2] 1620 	decw y  
      00899F 82 44            [ 1] 1621 	ld (y),a
      000969                       1622 9$:	
      0089A1 5B               [ 1] 1623 	ldw x,sp 
      0089A2 03 81 0A         [ 2] 1624 	addw x,#STREND  
      0089A4 90 89            [ 2] 1625 	pushw y
      0089A4 52 0A 0F         [ 2] 1626 	subw x,(1,sp)
      000972                       1627 	_drop 2 
      0089A7 01 90            [ 2]    1     addw sp,#2 
      000974                       1628 10$:
      0089A9 96               [ 1] 1629 	ld a,xl 
      0089AA 72 A9 00         [ 1] 1630 	cp a,tab_width
      0089AD 0A 90            [ 1] 1631 	jruge 12$
      0089AF 7F C6            [ 1] 1632 	ld a,#SPACE 
      0089B1 00 0B A1         [ 4] 1633 	call putc 
      0089B4 0A               [ 2] 1634 	incw x 
      0089B5 26 06            [ 2] 1635 	jra 10$ 
      000982                       1636 12$:
      0089B7 5D               [ 1] 1637     ldw x,y 
      0089B8 2A 03 03         [ 4] 1638 	call puts  
      000986                       1639 	_drop VSIZE 
      0089BB 01 50            [ 2]    1     addw sp,#VSIZE 
      0089BD 81               [ 4] 1640 	ret 
                                   1641 
                                   1642 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1643 ; convert integer in acc24 to string
                                   1644 ; input:
                                   1645 ;   A	  	base
                                   1646 ;	acc24	integer to convert
                                   1647 ; output:
                                   1648 ;   X  		pointer to string
                                   1649 ;------------------------------------
                           000001  1650 	SIGN=1  ; integer sign 
                           000002  1651 	BASE=2  ; numeric base 
                           000002  1652 	VSIZE=2  ;locals size
      000989                       1653 itoa:
      0089BD C6 00            [ 2] 1654 	sub sp,#VSIZE
      0089BF 0B 62            [ 1] 1655 	ld (BASE,sp), a  ; base
      0089C1 AB 30            [ 1] 1656 	clr (SIGN,sp)    ; sign
      0089C3 A1 3A            [ 1] 1657 	cp a,#10
      0089C5 2B 02            [ 1] 1658 	jrne 1$
                                   1659 	; base 10 string display with negative sign if bit 23==1
      0089C7 AB 07 90 5A 90   [ 2] 1660 	btjf acc24,#7,1$
      0089CC F7 5D            [ 1] 1661 	cpl (SIGN,sp)
      0089CE 26 ED A6         [ 4] 1662 	call neg_acc24
      00099D                       1663 1$:
                                   1664 ; initialize string pointer 
      0089D1 10 C1 00         [ 2] 1665 	ldw x,#pad+PAD_SIZE-1
      0089D4 0B               [ 1] 1666 	clr (x)
      0009A1                       1667 itoa_loop:
      0089D5 26 08            [ 1] 1668     ld a,(BASE,sp)
      0089D7 A6 24 90         [ 4] 1669     call divu24_8 ; acc24/A 
      0089DA 5A 90            [ 1] 1670     add a,#'0  ; remainder of division
      0089DC F7 20            [ 1] 1671     cp a,#'9+1
      0089DE 0A 0D            [ 1] 1672     jrmi 2$
      0089E0 01 27            [ 1] 1673     add a,#7 
      0089E2 06               [ 2] 1674 2$: decw x
      0089E3 A6               [ 1] 1675     ld (x),a
                                   1676 	; if acc24==0 conversion done
      0089E4 2D 90 5A         [ 1] 1677 	ld a,acc24
      0089E7 90 F7 0C         [ 1] 1678 	or a,acc16
      0089E9 CA 00 0D         [ 1] 1679 	or a,acc8
      0089E9 96 1C            [ 1] 1680     jrne itoa_loop
                                   1681 	;conversion done, next add '$' or '-' as required
      0089EB 00 0A            [ 1] 1682 	ld a,(BASE,sp)
      0089ED 90 89            [ 1] 1683 	cp a,#16
      0089EF 72 F0            [ 1] 1684 	jreq 8$
      0089F1 01 5B            [ 1] 1685 	ld a,(SIGN,sp)
      0089F3 02 08            [ 1] 1686     jreq 10$
      0089F4 A6 2D            [ 1] 1687     ld a,#'-
      0089F4 9F C1            [ 2] 1688 	jra 9$ 
      0089F6 00 25            [ 1] 1689 8$: ld a,#'$ 
      0089F8 24               [ 2] 1690 9$: decw x
      0089F9 08               [ 1] 1691     ld (x),a
      0009CD                       1692 10$:
      0089FA A6 20            [ 2] 1693 	addw sp,#VSIZE
      0089FC CD               [ 4] 1694 	ret
                                   1695 
                                   1696 ;-------------------------------------
                                   1697 ; divide uint24_t by uint8_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



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
      0009D0                       1709 divu24_8:
      0089FD 82               [ 2] 1710 	pushw x ; save x
      0089FE 44               [ 1] 1711 	push a 
                                   1712 	; ld dividend UU:MM bytes in X
      0089FF 5C 20 F2         [ 1] 1713 	ld a, acc24
      008A02 95               [ 1] 1714 	ld xh,a
      008A02 93 CD 82         [ 1] 1715 	ld a,acc24+1
      008A05 57               [ 1] 1716 	ld xl,a
      008A06 5B 0A            [ 1] 1717 	ld a,(U8,SP) ; divisor
      008A08 81               [ 2] 1718 	div x,a ; UU:MM/U8
      008A09 88               [ 1] 1719 	push a  ;save remainder
      008A09 52               [ 1] 1720 	ld a,xh
      008A0A 02 6B 02         [ 1] 1721 	ld acc24,a
      008A0D 0F               [ 1] 1722 	ld a,xl
      008A0E 01 A1 0A         [ 1] 1723 	ld acc24+1,a
      008A11 26               [ 1] 1724 	pop a
      008A12 0A               [ 1] 1725 	ld xh,a
      008A13 72 0F 00         [ 1] 1726 	ld a,acc24+2
      008A16 0C               [ 1] 1727 	ld xl,a
      008A17 05 03            [ 1] 1728 	ld a,(U8,sp) ; divisor
      008A19 01               [ 2] 1729 	div x,a  ; R:LL/U8
      008A1A CD 8A            [ 1] 1730 	ld (U8,sp),a ; save remainder
      008A1C B2               [ 1] 1731 	ld a,xl
      008A1D C7 00 0D         [ 1] 1732 	ld acc24+2,a
      008A1D AE               [ 1] 1733 	pop a
      008A1E 17               [ 2] 1734 	popw x
      008A1F 5F               [ 4] 1735 	ret
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
      0009F8                       1751 mulu24_8:
      008A20 7F               [ 2] 1752 	pushw x    ; save X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1753 	; local variables
      008A21 88               [ 1] 1754 	push a     ; U8
      008A21 7B               [ 1] 1755 	clrw x     ; initialize overflow to 0
      008A22 02               [ 2] 1756 	pushw x    ; multiplication overflow
                                   1757 ; multiply low byte.
      008A23 CD 8A 50         [ 1] 1758 	ld a,acc24+2
      008A26 AB               [ 1] 1759 	ld xl,a
      008A27 30 A1            [ 1] 1760 	ld a,(U8,sp)
      008A29 3A               [ 4] 1761 	mul x,a
      008A2A 2B               [ 1] 1762 	ld a,xl
      008A2B 02 AB 07         [ 1] 1763 	ld acc24+2,a
      008A2E 5A               [ 1] 1764 	ld a, xh
      008A2F F7 C6            [ 1] 1765 	ld (OVFL,sp),a
                                   1766 ; multipy middle byte
      008A31 00 0C CA         [ 1] 1767 	ld a,acc24+1
      008A34 00               [ 1] 1768 	ld xl,a
      008A35 0D CA            [ 1] 1769 	ld a, (U8,sp)
      008A37 00               [ 4] 1770 	mul x,a
                                   1771 ; add overflow to this partial product
      008A38 0E 26 E6         [ 2] 1772 	addw x,(OVFH,sp)
      008A3B 7B               [ 1] 1773 	ld a,xl
      008A3C 02 A1 10         [ 1] 1774 	ld acc24+1,a
      008A3F 27               [ 1] 1775 	clr a
      008A40 08 7B            [ 1] 1776 	adc a,#0
      008A42 01 27            [ 1] 1777 	ld (OVFH,sp),a
      008A44 08               [ 1] 1778 	ld a,xh
      008A45 A6 2D            [ 1] 1779 	ld (OVFL,sp),a
                                   1780 ; multiply most signficant byte	
      008A47 20 02 A6         [ 1] 1781 	ld a, acc24
      008A4A 24               [ 1] 1782 	ld xl, a
      008A4B 5A F7            [ 1] 1783 	ld a, (U8,sp)
      008A4D 42               [ 4] 1784 	mul x,a
      008A4D 5B 02 81         [ 2] 1785 	addw x, (OVFH,sp)
      008A50 9F               [ 1] 1786 	ld a, xl
      008A50 89 88 C6         [ 1] 1787 	ld acc24,a
      008A53 00 0C            [ 2] 1788     addw sp,#VSIZE
      008A55 95               [ 2] 1789 	popw x
      008A56 C6               [ 4] 1790 	ret
                                   1791 
                                   1792 ;------------------------------------
                                   1793 ;  two's complement acc24
                                   1794 ;  input:
                                   1795 ;		acc24 variable
                                   1796 ;  output:
                                   1797 ;		acc24 variable
                                   1798 ;-------------------------------------
      000A32                       1799 neg_acc24:
      008A57 00 0D 97 7B      [ 1] 1800 	cpl acc24+2
      008A5B 01 62 88 9E      [ 1] 1801 	cpl acc24+1
      008A5F C7 00 0C 9F      [ 1] 1802 	cpl acc24
      008A63 C7 00            [ 1] 1803 	ld a,#1
      008A65 0D 84 95         [ 1] 1804 	add a,acc24+2
      008A68 C6 00 0E         [ 1] 1805 	ld acc24+2,a
      008A6B 97               [ 1] 1806 	clr a
      008A6C 7B 01 62         [ 1] 1807 	adc a,acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008A6F 6B 01 9F         [ 1] 1808 	ld acc24+1,a 
      008A72 C7               [ 1] 1809 	clr a 
      008A73 00 0E 84         [ 1] 1810 	adc a,acc24 
      008A76 85 81 0B         [ 1] 1811 	ld acc24,a 
      008A78 81               [ 4] 1812 	ret
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
      000A55                       1831 readln:
      008A78 89 88            [ 1] 1832 	push #0
      008A7A 5F 89            [ 1] 1833 	push #0  
      008A7C C6 00 0E 97      [ 2] 1834  	ldw y,#tib ; input buffer
      000A5D                       1835 readln_loop:
      008A80 7B 03 42         [ 4] 1836 	call getc
      008A83 9F C7            [ 1] 1837 	ld (RXCHAR,sp),a
      008A85 00 0E            [ 1] 1838 	cp a,#CR
      008A87 9E 6B            [ 1] 1839 	jrne 1$
      008A89 02 C6 00         [ 2] 1840 	jp readln_quit
      008A8C 0D 97            [ 1] 1841 1$:	cp a,#LF 
      008A8E 7B 03            [ 1] 1842 	jreq readln_quit
      008A90 42 72            [ 1] 1843 	cp a,#BS
      008A92 FB 01            [ 1] 1844 	jreq del_back
      008A94 9F C7            [ 1] 1845 	cp a,#CTRL_D
      008A96 00 0D            [ 1] 1846 	jreq del_ln
      008A98 4F A9            [ 1] 1847 	cp a,#CTRL_R 
      008A9A 00 6B            [ 1] 1848 	jreq reprint 
                                   1849 ;	cp a,#'[
                                   1850 ;	jreq ansi_seq
      000A79                       1851 final_test:
      008A9C 01 9E            [ 1] 1852 	cp a,#SPACE
      008A9E 6B 02            [ 1] 1853 	jrpl accept_char
      008AA0 C6 00            [ 2] 1854 	jra readln_loop
      000A7F                       1855 ansi_seq:
                                   1856 ;	call getc
                                   1857 ;	cp a,#'C 
                                   1858 ;	jreq rigth_arrow
                                   1859 ;	cp a,#'D 
                                   1860 ;	jreq left_arrow 
                                   1861 ;	jra final_test
      000A7F                       1862 right_arrow:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1863 ;	ld a,#BSP 
                                   1864 ;	call putc 
                                   1865 ;	jra realn_loop 
      000A7F                       1866 left_arrow:
                                   1867 ;	jra readln_loop
      000A7F                       1868 reprint: 
      008AA2 0C 97            [ 1] 1869 	tnz (LL,sp)
      008AA4 7B 03            [ 1] 1870 	jrne readln_loop
      008AA6 42 72 FB         [ 2] 1871 	ldw x,#tib 
      008AA9 01 9F C7         [ 4] 1872 	call strlen 
      008AAC 00 0C 5B 03      [ 2] 1873 	ldw y,#tib 
      008AB0 85               [ 1] 1874 	ld a,xl
      008AB1 81 CD            [ 1] 1875 	jreq readln_loop
      008AB2 6B 02            [ 1] 1876 	ld (LL,sp),a 
      008AB2 72 53 00         [ 2] 1877 	ldw x,#tib 
      008AB5 0E 72 53         [ 4] 1878 	call puts
      008AB8 00 0D            [ 1] 1879 	clr (LL_HB,sp)
      008ABA 72 53 00         [ 2] 1880 	addw y,(LL_HB,sp)
      008ABD 0C A6            [ 2] 1881 	jra readln_loop 
      000A9F                       1882 del_ln:
      008ABF 01 CB            [ 1] 1883 	ld a,(LL,sp)
      008AC1 00 0E C7         [ 4] 1884 	call delete
      008AC4 00 0E 4F C9      [ 2] 1885 	ldw y,#tib
      008AC8 00 0D            [ 1] 1886 	clr (y)
      008ACA C7 00            [ 1] 1887 	clr (LL,sp)
      008ACC 0D 4F            [ 2] 1888 	jra readln_loop
      000AAE                       1889 del_back:
      008ACE C9 00            [ 1] 1890     tnz (LL,sp)
      008AD0 0C C7            [ 1] 1891     jreq readln_loop
      008AD2 00 0C            [ 1] 1892     dec (LL,sp)
      008AD4 81 5A            [ 2] 1893     decw y
      008AD5 90 7F            [ 1] 1894     clr  (y)
      008AD5 4B 00 4B         [ 4] 1895     call bksp 
      008AD8 00 90            [ 2] 1896     jra readln_loop	
      000ABD                       1897 accept_char:
      008ADA AE 16            [ 1] 1898 	ld a,#TIB_SIZE-1
      008ADC 90 02            [ 1] 1899 	cp a, (LL,sp)
      008ADD 27 9A            [ 1] 1900 	jreq readln_loop
      008ADD CD 82            [ 1] 1901 	ld a,(RXCHAR,sp)
      008ADF 4D 6B            [ 1] 1902 	ld (y),a
      008AE1 01 A1            [ 1] 1903 	inc (LL,sp)
      008AE3 0D 26            [ 2] 1904 	incw y
      008AE5 03 CC            [ 1] 1905 	clr (y)
      008AE7 8B 52 A1         [ 4] 1906 	call putc 
      008AEA 0A 27            [ 2] 1907 	jra readln_loop
      000AD2                       1908 readln_quit:
      008AEC 65 A1            [ 1] 1909 	clr (y)
      008AEE 08 27            [ 1] 1910 	ld a,(LL,sp)
      008AF0 3D A1 04         [ 1] 1911 	ld count,a 
      008AF3 27 2A            [ 1] 1912 	ld a,#CR
      008AF5 A1 12 27         [ 4] 1913 	call putc
      000ADE                       1914 	_drop VSIZE 
      008AF8 06 02            [ 2]    1     addw sp,#VSIZE 
      008AF9 81               [ 4] 1915 	ret
                                   1916 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



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
      000AE1                       1932 parse_quote: 
      000AE1                       1933 	_vars VSIZE 
      008AF9 A1 20            [ 2]    1     sub sp,#VSIZE 
      008AFB 2A               [ 1] 1934 	clr a
      008AFC 40 20            [ 1] 1935 1$:	ld (PREV,sp),a 
      000AE6                       1936 2$:	
      008AFE DE D6 00         [ 4] 1937 	ld a,([in.w],y)
      008AFF 27 24            [ 1] 1938 	jreq 6$
      008AFF 72 5C 00 01      [ 1] 1939 	inc in 
      008AFF 6B 02            [ 1] 1940 	ld (CURR,sp),a 
      008AFF A6 5C            [ 1] 1941 	ld a,#'\
      008AFF 0D 02            [ 1] 1942 	cp a, (PREV,sp)
      008B01 26 DA            [ 1] 1943 	jrne 3$
      008B03 AE 16            [ 1] 1944 	clr (PREV,sp)
      008B05 90 CD            [ 1] 1945 	ld a,(CURR,sp)
      008B07 83 36            [ 4] 1946 	callr convert_escape
      008B09 90               [ 1] 1947 	ld (x),a 
      008B0A AE               [ 2] 1948 	incw x 
      008B0B 16 90            [ 2] 1949 	jra 2$
      000B01                       1950 3$:
      008B0D 9F 27            [ 1] 1951 	ld a,(CURR,sp)
      008B0F CD 6B            [ 1] 1952 	cp a,#'\'
      008B11 02 AE            [ 1] 1953 	jreq 1$
      008B13 16 90            [ 1] 1954 	cp a,#'"
      008B15 CD 82            [ 1] 1955 	jreq 6$ 
      008B17 57               [ 1] 1956 	ld (x),a 
      008B18 0F               [ 2] 1957 	incw x 
      008B19 01 72            [ 2] 1958 	jra 2$
      000B0F                       1959 6$:
      008B1B F9               [ 1] 1960 	clr (x)
      008B1C 01               [ 2] 1961 	incw x 
      008B1D 20 BE            [ 1] 1962 	ldw y,x 
      008B1F 5F               [ 1] 1963 	clrw x 
      008B1F 7B 02            [ 1] 1964 	ld a,#TK_QSTR  
      000B16                       1965 	_drop VSIZE
      008B21 CD 82            [ 2]    1     addw sp,#VSIZE 
      008B23 71               [ 4] 1966 	ret 
                                   1967 
                                   1968 ;---------------------------------------
                                   1969 ; called by parse_quote
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1970 ; subtitute escaped character 
                                   1971 ; by their ASCII value .
                                   1972 ; input:
                                   1973 ;   A  character following '\'
                                   1974 ; output:
                                   1975 ;   A  substitued char or same if not valid.
                                   1976 ;---------------------------------------
      000B19                       1977 convert_escape:
      008B24 90               [ 2] 1978 	pushw x 
      008B25 AE 16 90         [ 2] 1979 	ldw x,#escaped 
      008B28 90               [ 1] 1980 1$:	cp a,(x)
      008B29 7F 0F            [ 1] 1981 	jreq 2$
      008B2B 02               [ 1] 1982 	tnz (x)
      008B2C 20 AF            [ 1] 1983 	jreq 3$
      008B2E 5C               [ 2] 1984 	incw x 
      008B2E 0D 02            [ 2] 1985 	jra 1$
      008B30 27 AB 0A         [ 2] 1986 2$: subw x,#escaped 
      008B33 02               [ 1] 1987 	ld a,xl 
      008B34 90 5A            [ 1] 1988 	add a,#7
      008B36 90               [ 2] 1989 3$:	popw x 
      008B37 7F               [ 4] 1990 	ret 
                                   1991 
      008B38 CD 82 61 20 A0 66 72  1992 escaped: .asciz "abtnvfr"
             00
                                   1993 
                                   1994 ;-------------------------
                                   1995 ; integer parser 
                                   1996 ; input:
                                   1997 ;   X 		point to output buffer  
                                   1998 ;   Y 		point to tib 
                                   1999 ;   A 	    first digit|'$' 
                                   2000 ; output:  
                                   2001 ;   pad     number string 
                                   2002 ;   X 		integer 
                                   2003 ;   A 		TK_INTGR
                                   2004 ;-------------------------
                           000001  2005 	BASE=1
                           000002  2006 	TCHAR=2 
                           000003  2007 	XSAVE=3
                           000004  2008 	VSIZE=4 
      008B3D                       2009 parse_integer: ; { -- n }
      008B3D A6               [ 2] 2010 	pushw x 	
      008B3E 4F 11            [ 1] 2011 	push #0 ; TCHAR
      008B40 02 27            [ 1] 2012 	push #10 ; BASE=10
      008B42 9A 7B            [ 1] 2013 	cp a,#'$
      008B44 01 90            [ 1] 2014 	jrne 2$ 
      000B3F                       2015     _drop #1
      008B46 F7 0C            [ 2]    1     addw sp,##1 
      008B48 02 90            [ 1] 2016 	push #16  ; BASE=16
      008B4A 5C               [ 1] 2017 2$:	ld (x),a 
      008B4B 90               [ 2] 2018 	incw x 
      008B4C 7F CD 82         [ 4] 2019 	ld a,([in.w],y)
      008B4F 44 20 8B 01      [ 1] 2020 	inc in 
      008B52 CD 0D C9         [ 4] 2021 	call to_upper 
      008B52 90 7F            [ 1] 2022 	ld (TCHAR,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B54 7B 02 C7         [ 4] 2023 	call is_digit 
      008B57 00 04            [ 1] 2024 	jrc 2$
      008B59 A6 0D            [ 1] 2025 	ld a,#16 
      008B5B CD 82            [ 1] 2026 	cp a,(BASE,sp)
      008B5D 44 5B            [ 1] 2027 	jrne 3$ 
      008B5F 02 81            [ 1] 2028 	ld a,(TCHAR,sp)
      008B61 A1 41            [ 1] 2029 	cp a,#'A 
      008B61 52 02            [ 1] 2030 	jrmi 3$ 
      008B63 4F 6B            [ 1] 2031 	cp a,#'G 
      008B65 01 DD            [ 1] 2032 	jrmi 2$ 
      008B66 72 5A 00 01      [ 1] 2033 3$: dec in 	
      008B66 91               [ 1] 2034     clr (x)
      008B67 D6 01            [ 2] 2035 	ldw x,(XSAVE,sp)
      008B69 27 24 72         [ 4] 2036 	call atoi24
      008B6C 5C 00            [ 1] 2037 	ldw y,x 
      008B6E 02 6B 02         [ 2] 2038 	ldw x,acc16 
      008B71 A6 5C            [ 1] 2039 	ld a,#TK_INTGR
      008B73 11 01            [ 2] 2040 	ldw (y),x 
      008B75 26 0A 0F 01      [ 2] 2041 	addw y,#2
      000B7D                       2042 	_drop VSIZE  
      008B79 7B 02            [ 2]    1     addw sp,#VSIZE 
      008B7B AD               [ 4] 2043 	ret 	
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
      000B80                       2060 parse_binary: ; { -- n }
      008B7C 1C F7            [ 1] 2061 	push #0
      008B7E 5C 20            [ 1] 2062 	push #0
      008B80 E5 00            [ 1] 2063 	push #0
      008B81                       2064 2$:	
      008B81 7B 02 A1         [ 4] 2065 	ld a,([in.w],y)
      008B84 5C 27 DD A1      [ 1] 2066 	inc in 
      008B88 22 27            [ 1] 2067 	cp a,#'0 
      008B8A 04 F7            [ 1] 2068 	jreq 3$
      008B8C 5C 20            [ 1] 2069 	cp a,#'1 
      008B8E D7 02            [ 1] 2070 	jreq 3$ 
      008B8F 20 0B            [ 2] 2071 	jra bin_exit 
      008B8F 7F 5C            [ 1] 2072 3$: sub a,#'0 
      008B91 90               [ 1] 2073 	rrc a
      008B92 93 5F            [ 1] 2074 	rlc (BINARY+2,sp) 
      008B94 A6 02            [ 1] 2075 	rlc (BINARY+1,sp)
      008B96 5B 02            [ 1] 2076 	rlc (BINARY,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B98 81 E4            [ 2] 2077 	jra 2$  
      008B99                       2078 bin_exit:
      008B99 89 AE 8B AE      [ 1] 2079 	dec in 
      008B9D F1 27            [ 1] 2080 	ldw y,x
      008B9F 06 7D            [ 1] 2081 	ld a,(BINARY,sp)
      008BA1 27 09 5C         [ 1] 2082 	ld acc24,a 
      008BA4 20 F7            [ 2] 2083 	ldw x,(BINARY+1,sp)
      008BA6 1D 8B AE         [ 2] 2084 	ldw acc16,x
      008BA9 9F AB            [ 2] 2085 	ldw (y),x 
      008BAB 07 85 81 61      [ 2] 2086 	addw y,#2  
      008BAF 62 74            [ 1] 2087 	ld a,#TK_INTGR 	
      000BBA                       2088 	_drop VSIZE 
      008BB1 6E 76            [ 2]    1     addw sp,#VSIZE 
      008BB3 66               [ 4] 2089 	ret
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
      000BBD                       2105 parse_keyword: 
      008BB4 72               [ 2] 2106 	pushw x 
      000BBE                       2107 kw_loop:	
      008BB5 00 0D C9         [ 4] 2108 	call to_upper 
      008BB6 F7               [ 1] 2109 	ld (x),a 
      008BB6 89               [ 2] 2110 	incw x 
      008BB7 4B 00 4B         [ 4] 2111 	ld a,([in.w],y)
      008BBA 0A A1 24 26      [ 1] 2112 	inc in 
      008BBE 04 5B 01         [ 4] 2113 	call is_alpha 
      008BC1 4B 10            [ 1] 2114 	jrc kw_loop
      008BC3 F7 5C 91 D6      [ 1] 2115 	dec in   
      008BC7 01               [ 1] 2116 1$: clr (x)
      008BC8 72 5C            [ 2] 2117 	ldw x,(XFIRST,sp) 
      008BCA 00 02            [ 1] 2118 	ld a,(1,x)
      008BCC CD 8E            [ 1] 2119 	jrne 2$
                                   2120 ; one letter variable name 
      008BCE 49               [ 1] 2121 	ld a,(x) 
      008BCF 6B 02            [ 1] 2122 	sub a,#'A 
      008BD1 CD               [ 1] 2123 	sll a 
      008BD2 85               [ 1] 2124 	push a 
      008BD3 20 25            [ 1] 2125 	push #0
      008BD5 ED A6 10         [ 2] 2126 	ldw x,#vars 
      008BD8 11 01 26         [ 2] 2127 	addw x,(1,sp) ; X=var address 
      000BE7                       2128 	_drop 2 
      008BDB 0A 7B            [ 2]    1     addw sp,#2 
      008BDD 02 A1            [ 1] 2129 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008BDF 41 2B            [ 2] 2130 	jra 4$ 
      000BED                       2131 2$: ; check for keyword, otherwise syntax error.
      000BED                       2132 	_ldx_dict kword_dict ; dictionary entry point
      008BE1 04 A1 47         [ 2]    1     ldw x,#kword_dict+2
      008BE4 2B DD            [ 2] 2133 	ldw y,(XFIRST,sp) ; name to search for
      008BE6 72 5A 00         [ 4] 2134 	call search_dict
      008BE9 02               [ 1] 2135 	tnz a
      008BEA 7F 1E            [ 1] 2136 	jrne 4$ 
      008BEC 03 CD 8E         [ 2] 2137 	jp syntax_error
      000BFB                       2138 4$:	
      008BEF 55 90            [ 2] 2139 	ldw y,(XFIRST,sp)
      008BF1 93 CE            [ 1] 2140 	ld (y),a 
      008BF3 00 0D            [ 2] 2141 	incw y 
      008BF5 A6 84            [ 2] 2142 	ldw (y),x
      008BF7 90 FF 72 A9      [ 2] 2143 	addw y,#2  
      000C07                       2144 	_drop VSIZE 
      008BFB 00 02            [ 2]    1     addw sp,#VSIZE 
      008BFD 5B               [ 4] 2145 	ret  	
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
      000C0A                       2170 get_token: 
      000C0A                       2171 	_vars VSIZE
      008BFE 04 81            [ 2]    1     sub sp,#VSIZE 
                                   2172 ;	ld a,in 
                                   2173 ;	sub a,count
                                   2174 ;   jrmi 0$
                                   2175 ;	clr a 
                                   2176 ;	ret 
      008C00                       2177 0$: 
      008C00 4B 00 4B 00      [ 2] 2178 	ldw y,#tib    	
      008C04 4B 00            [ 1] 2179 	ld a,#SPACE
      008C06 CD 0E 3F         [ 4] 2180 	call skip
      008C06 91 D6 01 72 5C   [ 1] 2181 	mov in.saved,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008C0B 00 02 A1         [ 4] 2182 	ld a,([in.w],y)
      008C0E 30 27            [ 1] 2183 	jrne 1$
      008C10 06 A1            [ 1] 2184 	ldw y,x 
      008C12 31 27 02         [ 2] 2185 	jp token_exit ; end of line 
      008C15 20 0B A0 30      [ 1] 2186 1$:	inc in 
      008C19 46 09 03         [ 4] 2187 	call to_upper 
      008C1C 09 02            [ 1] 2188 	ld (TCHAR,sp),a 
                                   2189 ; check for quoted string
      000C2D                       2190 str_tst:  	
      000C2D                       2191 	_case '"' nbr_tst
      008C1E 09 01            [ 1]    1 	ld a,#'"' 
      008C20 20 E4            [ 1]    2 	cp a,(TCHAR,sp) 
      008C22 26 0A            [ 1]    3 	jrne nbr_tst
      008C22 72 5A            [ 1] 2192 	ld a,#TK_QSTR
      008C24 00               [ 1] 2193 	ld (x),a 
      008C25 02               [ 2] 2194 	incw x 
      008C26 90 93 7B         [ 4] 2195 	call parse_quote
      008C29 01 C7 00         [ 2] 2196 	jp token_exit
      000C3D                       2197 nbr_tst:
                                   2198 ; check for hexadecimal number 
      008C2C 0C 1E            [ 1] 2199 	ld a,#'$'
      008C2E 02 CF            [ 1] 2200 	cp a,(TCHAR,sp) 
      008C30 00 0D            [ 1] 2201 	jreq 1$
                                   2202 ;check for binary number 
      008C32 90 FF            [ 1] 2203 	ld a,#'&
      008C34 72 A9            [ 1] 2204 	cp a,(TCHAR,sp)
      008C36 00 02            [ 1] 2205 	jrne 0$
      008C38 A6 84            [ 1] 2206 	ld a,#TK_INTGR
      008C3A 5B               [ 1] 2207 	ld (x),a 
      008C3B 03               [ 2] 2208 	incw x 
      008C3C 81 0B 80         [ 4] 2209 	call parse_binary ; expect binary integer 
      008C3D CC 0D C6         [ 2] 2210 	jp token_exit 
                                   2211 ; check for decimal number 	
      008C3D 89 01            [ 1] 2212 0$:	ld a,(TCHAR,sp)
      008C3E CD 04 A0         [ 4] 2213 	call is_digit
      008C3E CD 8E            [ 1] 2214 	jrnc 3$
      008C40 49 F7            [ 1] 2215 1$:	ld a,#TK_INTGR 
      008C42 5C               [ 1] 2216 	ld (x),a 
      008C43 91               [ 2] 2217 	incw x 
      008C44 D6 01            [ 1] 2218 	ld a,(TCHAR,sp)
      008C46 72 5C 00         [ 4] 2219 	call parse_integer 
      008C49 02 CD 85         [ 2] 2220 	jp token_exit 
      000C66                       2221 3$: 
      000C66                       2222 	_case '(' bkslsh_tst 
      008C4C 0F 25            [ 1]    1 	ld a,#'(' 
      008C4E EF 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008C50 5A 00            [ 1]    3 	jrne bkslsh_tst
      008C52 02 7F            [ 1] 2223 	ld a,#TK_LPAREN
      008C54 1E 01 E6         [ 2] 2224 	jp token_char   	
      000C71                       2225 bkslsh_tst: ; character token 
      000C71                       2226 	_case '\',rparnt_tst
      008C57 01 26            [ 1]    1 	ld a,#'\' 
      008C59 13 F6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5B A0 41            [ 1]    3 	jrne rparnt_tst
      008C5D 48 88            [ 1] 2227 	ld a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008C5F 4B               [ 1] 2228 	ld (x),a 
      008C60 00               [ 2] 2229 	incw x 
      008C61 AE 00 27         [ 4] 2230 	ld a,([in.w],y)
      008C64 72               [ 1] 2231 	ld (x),a 
      008C65 FB               [ 2] 2232 	incw x
      008C66 01 5B            [ 1] 2233 	ldw y,x 	 
      008C68 02 A6 85 20      [ 1] 2234 	inc in  
      008C6C 0E               [ 1] 2235 	clrw x 
      008C6D 97               [ 1] 2236 	ld xl,a 
      008C6D AE A6            [ 1] 2237 	ld a,#TK_CHAR 
      008C6F 02 16 01         [ 2] 2238 	jp token_exit 
      000C8D                       2239 rparnt_tst:		
      000C8D                       2240 	_case ')' colon_tst 
      008C72 CD 8F            [ 1]    1 	ld a,#')' 
      008C74 AF 4D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C76 26 03            [ 1]    3 	jrne colon_tst
      008C78 CC 88            [ 1] 2241 	ld a,#TK_RPAREN 
      008C7A 15 0D C2         [ 2] 2242 	jp token_char
      008C7B                       2243 colon_tst:
      000C98                       2244 	_case ':' comma_tst 
      008C7B 16 01            [ 1]    1 	ld a,#':' 
      008C7D 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7F 90 5C            [ 1]    3 	jrne comma_tst
      008C81 90 FF            [ 1] 2245 	ld a,#TK_COLON 
      008C83 72 A9 00         [ 2] 2246 	jp token_char  
      000CA3                       2247 comma_tst:
      000CA3                       2248 	_case COMMA sharp_tst 
      008C86 02 5B            [ 1]    1 	ld a,#COMMA 
      008C88 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8A 26 05            [ 1]    3 	jrne sharp_tst
      008C8A 52 02            [ 1] 2249 	ld a,#TK_COMMA
      008C8C CC 0D C2         [ 2] 2250 	jp token_char
      000CAE                       2251 sharp_tst:
      000CAE                       2252 	_case SHARP dash_tst 
      008C8C 90 AE            [ 1]    1 	ld a,#SHARP 
      008C8E 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008C90 A6 20            [ 1]    3 	jrne dash_tst
      008C92 CD 8E            [ 1] 2253 	ld a,#TK_SHARP
      008C94 BF 55 00         [ 2] 2254 	jp token_char  	 	 
      000CB9                       2255 dash_tst: 	
      000CB9                       2256 	_case '-' at_tst 
      008C97 02 00            [ 1]    1 	ld a,#'-' 
      008C99 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9B D6 01            [ 1]    3 	jrne at_tst
      008C9D 26 05            [ 1] 2257 	ld a,#TK_MINUS  
      008C9F 90 93 CC         [ 2] 2258 	jp token_char 
      000CC4                       2259 at_tst:
      000CC4                       2260 	_case '@' qmark_tst 
      008CA2 8E 46            [ 1]    1 	ld a,#'@' 
      008CA4 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA6 00 02            [ 1]    3 	jrne qmark_tst
      008CA8 CD 8E            [ 1] 2261 	ld a,#TK_ARRAY 
      008CAA 49 6B 01         [ 2] 2262 	jp token_char
      008CAD                       2263 qmark_tst:
      000CCF                       2264 	_case '?' tick_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008CAD A6 22            [ 1]    1 	ld a,#'?' 
      008CAF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB1 26 0A            [ 1]    3 	jrne tick_tst
      008CB3 A6 02            [ 1] 2265 	ld a,#TK_CMD  
      008CB5 F7               [ 1] 2266 	ld (x),a 
      008CB6 5C               [ 2] 2267 	incw x 
      008CB7 CD 8B            [ 1] 2268 	ldw y,x 
      008CB9 61 CC 8E         [ 2] 2269 	ldw x,#print 
      008CBC 46 FF            [ 2] 2270 	ldw (y),x 
      008CBD 72 A9 00 02      [ 2] 2271 	addw y,#2
      008CBD A6 24 11         [ 2] 2272 	jp token_exit
      000CE7                       2273 tick_tst: ; comment 
      000CE7                       2274 	_case TICK plus_tst 
      008CC0 01 27            [ 1]    1 	ld a,#TICK 
      008CC2 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC4 26 11            [ 1]    3 	jrne plus_tst
      008CC6 01 26            [ 1] 2275 	ld a,#TK_CMD
      008CC8 0A               [ 1] 2276 	ld (x),a 
      008CC9 A6               [ 2] 2277 	incw x
      008CCA 84 F7 5C CD      [ 2] 2278 	ldw y,#remark
      008CCE 8C               [ 2] 2279 	ldw (x),y 
      008CCF 00 CC 8E         [ 2] 2280 	addw x,#2  
      000CF9                       2281 copy_comment:
      008CD2 46 7B 01 CD      [ 2] 2282 	ldw y,#tib 
      008CD6 85 20 24 0C      [ 2] 2283 	addw y,in.w
      008CDA A6 84            [ 2] 2284 	pushw y
      008CDC F7 5C 7B         [ 4] 2285 	call strcpy
      008CDF 01 CD 8B         [ 2] 2286     subw y,(1,sp)
      008CE2 B6 CC            [ 1] 2287 	ld a,yl 
      008CE4 8E 46 01         [ 1] 2288 	add a,in
      008CE6 C7 00 01         [ 1] 2289 	ld in,a 
      008CE6 A6 28            [ 2] 2290 	ldw (1,sp),x
      008CE8 11 01 26         [ 2] 2291 	addw y,(1,sp)
      008CEB 05 A6            [ 2] 2292 	incw y 
      000D18                       2293 	_drop 2 
      008CED 07 CC            [ 2]    1     addw sp,#2 
      008CEF 8E 42 C4         [ 2] 2294 	ldw x,#remark 
      008CF1 A6 80            [ 1] 2295 	ld a,#TK_CMD 
      008CF1 A6 5C 11         [ 2] 2296 	jp token_exit 
      000D22                       2297 plus_tst:
      000D22                       2298 	_case '+' star_tst 
      008CF4 01 26            [ 1]    1 	ld a,#'+' 
      008CF6 16 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF8 03 F7            [ 1]    3 	jrne star_tst
      008CFA 5C 91            [ 1] 2299 	ld a,#TK_PLUS  
      008CFC D6 01 F7         [ 2] 2300 	jp token_char 
      000D2D                       2301 star_tst:
      000D2D                       2302 	_case '*' slash_tst 
      008CFF 5C 90            [ 1]    1 	ld a,#'*' 
      008D01 93 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D03 5C 00            [ 1]    3 	jrne slash_tst
      008D05 02 5F            [ 1] 2303 	ld a,#TK_MULT 
      008D07 97 A6 03         [ 2] 2304 	jp token_char 
      000D38                       2305 slash_tst: 
      000D38                       2306 	_case '/' prcnt_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D0A CC 8E            [ 1]    1 	ld a,#'/' 
      008D0C 46 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0D 26 05            [ 1]    3 	jrne prcnt_tst
      008D0D A6 29            [ 1] 2307 	ld a,#TK_DIV 
      008D0F 11 01 26         [ 2] 2308 	jp token_char 
      000D43                       2309 prcnt_tst:
      000D43                       2310 	_case '%' eql_tst 
      008D12 05 A6            [ 1]    1 	ld a,#'%' 
      008D14 08 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008D16 8E 42            [ 1]    3 	jrne eql_tst
      008D18 A6 22            [ 1] 2311 	ld a,#TK_MOD
      008D18 A6 3A 11         [ 2] 2312 	jp token_char  
                                   2313 ; 1 or 2 character tokens 	
      000D4E                       2314 eql_tst:
      000D4E                       2315 	_case '=' gt_tst 		
      008D1B 01 26            [ 1]    1 	ld a,#'=' 
      008D1D 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1F 01 CC            [ 1]    3 	jrne gt_tst
      008D21 8E 42            [ 1] 2316 	ld a,#TK_EQUAL
      008D23 CC 0D C2         [ 2] 2317 	jp token_char 
      000D59                       2318 gt_tst:
      000D59                       2319 	_case '>' lt_tst 
      008D23 A6 2C            [ 1]    1 	ld a,#'>' 
      008D25 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D27 26 05            [ 1]    3 	jrne lt_tst
      008D29 A6 09            [ 1] 2320 	ld a,#TK_GT 
      008D2B CC 8E            [ 1] 2321 	ld (ATTRIB,sp),a 
      008D2D 42 5C 00 01      [ 1] 2322 	inc in 
      008D2E 91 D6 00         [ 4] 2323 	ld a,([in.w],y)
      008D2E A6 23            [ 1] 2324 	cp a,#'=
      008D30 11 01            [ 1] 2325 	jrne 1$
      008D32 26 05            [ 1] 2326 	ld a,#TK_GE 
      008D34 A6 0A            [ 2] 2327 	jra token_char  
      008D36 CC 8E            [ 1] 2328 1$: cp a,#'<
      008D38 42 04            [ 1] 2329 	jrne 2$
      008D39 A6 35            [ 1] 2330 	ld a,#TK_NE 
      008D39 A6 2D            [ 2] 2331 	jra token_char 
      008D3B 11 01 26 05      [ 1] 2332 2$: dec in
      008D3F A6 11            [ 1] 2333 	ld a,(ATTRIB,sp)
      008D41 CC 8E            [ 2] 2334 	jra token_char 	 
      000D82                       2335 lt_tst:
      000D82                       2336 	_case '<' other
      008D43 42 3C            [ 1]    1 	ld a,#'<' 
      008D44 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D44 A6 40            [ 1]    3 	jrne other
      008D46 11 01            [ 1] 2337 	ld a,#TK_LT 
      008D48 26 05            [ 1] 2338 	ld (ATTRIB,sp),a 
      008D4A A6 06 CC 8E      [ 1] 2339 	inc in 
      008D4E 42 D6 00         [ 4] 2340 	ld a,([in.w],y)
      008D4F A1 3D            [ 1] 2341 	cp a,#'=
      008D4F A6 3F            [ 1] 2342 	jrne 1$
      008D51 11 01            [ 1] 2343 	ld a,#TK_LE 
      008D53 26 12            [ 2] 2344 	jra token_char 
      008D55 A6 80            [ 1] 2345 1$: cp a,#'>
      008D57 F7 5C            [ 1] 2346 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D59 90 93            [ 1] 2347 	ld a,#TK_NE 
      008D5B AE 94            [ 2] 2348 	jra token_char 
      008D5D 47 90 FF 72      [ 1] 2349 2$: dec in 
      008D61 A9 00            [ 1] 2350 	ld a,(ATTRIB,sp)
      008D63 02 CC            [ 2] 2351 	jra token_char 	
      000DAB                       2352 other: ; not a special character 	 
      008D65 8E 46            [ 1] 2353 	ld a,(TCHAR,sp)
      008D67 CD 04 8F         [ 4] 2354 	call is_alpha 
      008D67 A6 27            [ 1] 2355 	jrc 30$ 
      008D69 11 01 26         [ 2] 2356 	jp syntax_error 
      000DB5                       2357 30$: 
      008D6C 35 A6 80         [ 4] 2358 	call parse_keyword
      008D6F F7 5C 90         [ 2] 2359 	cpw x,#remark 
      008D72 AE 95            [ 1] 2360 	jrne token_exit 
      008D74 44 FF            [ 1] 2361 	ldw y,x 
      008D76 1C 00 02         [ 2] 2362 	jp copy_comment 
      008D79                       2363 token_char:
      008D79 90               [ 1] 2364 	ld (x),a 
      008D7A AE               [ 2] 2365 	incw x
      008D7B 16 90            [ 1] 2366 	ldw y,x 
      000DC6                       2367 token_exit:
      000DC6                       2368 	_drop VSIZE 
      008D7D 72 B9            [ 2]    1     addw sp,#VSIZE 
      008D7F 00               [ 4] 2369 	ret
                                   2370 
                                   2371 
                                   2372 ;------------------------------------
                                   2373 ; convert alpha to uppercase
                                   2374 ; input:
                                   2375 ;    a  character to convert
                                   2376 ; output:
                                   2377 ;    a  uppercase character
                                   2378 ;------------------------------------
      000DC9                       2379 to_upper::
      008D80 01 90            [ 1] 2380 	cp a,#'a
      008D82 89 CD            [ 1] 2381 	jrpl 1$
      008D84 83               [ 4] 2382 0$:	ret
      008D85 54 72            [ 1] 2383 1$: cp a,#'z	
      008D87 F2 01            [ 1] 2384 	jrugt 0$
      008D89 90 9F            [ 1] 2385 	sub a,#32
      008D8B CB               [ 4] 2386 	ret
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
      000DD5                       2400 atoi24:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D8C 00               [ 2] 2401 	pushw x 
      000DD6                       2402 	_vars VSIZE
      008D8D 02 C7            [ 2]    1     sub sp,#VSIZE 
                                   2403 	; acc24=0 
      008D8F 00 02 1F 01      [ 1] 2404 	clr acc24    
      008D93 72 F9 01 90      [ 1] 2405 	clr acc16
      008D97 5C 5B 02 AE      [ 1] 2406 	clr acc8 
      008D9B 95 44            [ 1] 2407 	clr (SIGN,sp)
      008D9D A6 80            [ 1] 2408 	ld a,#10
      008D9F CC 8E            [ 1] 2409 	ld (BASE,sp),a ; default base decimal
      008DA1 46               [ 1] 2410 	ld a,(x)
      008DA2 27 47            [ 1] 2411 	jreq 9$  ; completed if 0
      008DA2 A6 2B            [ 1] 2412 	cp a,#'-
      008DA4 11 01            [ 1] 2413 	jrne 1$
      008DA6 26 05            [ 1] 2414 	cpl (SIGN,sp)
      008DA8 A6 10            [ 2] 2415 	jra 2$
      008DAA CC 8E            [ 1] 2416 1$: cp a,#'$
      008DAC 42 06            [ 1] 2417 	jrne 3$
      008DAD A6 10            [ 1] 2418 	ld a,#16
      008DAD A6 2A            [ 1] 2419 	ld (BASE,sp),a
      008DAF 11               [ 2] 2420 2$:	incw x
      008DB0 01               [ 1] 2421 	ld a,(x)
      000DFF                       2422 3$:	
      008DB1 26 05            [ 1] 2423 	cp a,#'a
      008DB3 A6 20            [ 1] 2424 	jrmi 4$
      008DB5 CC 8E            [ 1] 2425 	sub a,#32
      008DB7 42 30            [ 1] 2426 4$:	cp a,#'0
      008DB8 2B 2B            [ 1] 2427 	jrmi 9$
      008DB8 A6 2F            [ 1] 2428 	sub a,#'0
      008DBA 11 01            [ 1] 2429 	cp a,#10
      008DBC 26 05            [ 1] 2430 	jrmi 5$
      008DBE A6 21            [ 1] 2431 	sub a,#7
      008DC0 CC 8E            [ 1] 2432 	cp a,(BASE,sp)
      008DC2 42 1F            [ 1] 2433 	jrpl 9$
      008DC3 6B 03            [ 1] 2434 5$:	ld (TEMP,sp),a
      008DC3 A6 25            [ 1] 2435 	ld a,(BASE,sp)
      008DC5 11 01 26         [ 4] 2436 	call mulu24_8
      008DC8 05 A6            [ 1] 2437 	ld a,(TEMP,sp)
      008DCA 22 CC 8E         [ 1] 2438 	add a,acc24+2
      008DCD 42 00 0D         [ 1] 2439 	ld acc24+2,a
      008DCE 4F               [ 1] 2440 	clr a
      008DCE A6 3D 11         [ 1] 2441 	adc a,acc24+1
      008DD1 01 26 05         [ 1] 2442 	ld acc24+1,a
      008DD4 A6               [ 1] 2443 	clr a
      008DD5 32 CC 8E         [ 1] 2444 	adc a,acc24
      008DD8 42 00 0B         [ 1] 2445 	ld acc24,a
      008DD9 20 C9            [ 2] 2446 	jra 2$
      008DD9 A6 3E            [ 1] 2447 9$:	tnz (SIGN,sp)
      008DDB 11 01            [ 1] 2448     jreq atoi_exit
      008DDD 26 23 A6         [ 4] 2449     call neg_acc24
      000E3B                       2450 atoi_exit: 
      000E3B                       2451 	_drop VSIZE
      008DE0 31 6B            [ 2]    1     addw sp,#VSIZE 
      008DE2 02               [ 2] 2452 	popw x ; restore x
      008DE3 72               [ 4] 2453 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



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
      000E3F                       2465 skip:
      008DE4 5C               [ 1] 2466 	push a
      008DE5 00 02 91         [ 4] 2467 1$:	ld a,([in.w],y)
      008DE8 D6 01            [ 1] 2468 	jreq 2$
      008DEA A1 3D            [ 1] 2469 	cp a,(C,sp)
      008DEC 26 04            [ 1] 2470 	jrne 2$
      008DEE A6 33 20 50      [ 1] 2471 	inc in
      008DF2 A1 3C            [ 2] 2472 	jra 1$
      000E4F                       2473 2$: _drop 1 
      008DF4 26 04            [ 2]    1     addw sp,#1 
      008DF6 A6               [ 4] 2474 	ret
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
                                   2485 ;--------------------------------
                                   2486 ;  add 2 integers
                                   2487 ;  input:
                                   2488 ;    N1     on cstack 
                                   2489 ;    N2     on cstack 
                                   2490 ;  output:
                                   2491 ;    X 		n2+n1 
                                   2492 ;--------------------------------
                                   2493 	;arugments on cstack 
      000E52                       2494 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E52                       2495 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E52                       2496 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E52                       2497 add:
      008DF7 35 20            [ 2] 2498 	ldw x ,(N2,sp)
      008DF9 48 72 5A         [ 2] 2499 	addw x,(N1,sp)
      008DFC 00 02            [ 2] 2500 	ldw (N1,sp),x 
      008DFE 7B               [ 4] 2501 	ret 
                                   2502 
                                   2503 ;--------------------------------
                                   2504 ;  substract 2 ntegers
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2505 ;  input:
                                   2506 ;    N1     on cstack 
                                   2507 ;    N2     on cstack 
                                   2508 ;  output:
                                   2509 ;    X 		n2+n1 
                                   2510 ;--------------------------------
      000E5A                       2511 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E5A                       2512 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E5A                       2513 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E5A                       2514 substract:
      008DFF 02 20            [ 2] 2515 	ldw x,(N2,sp)
      008E01 40 F0 03         [ 2] 2516 	subw x,(N1,sp)
      008E02 81               [ 4] 2517 	ret 
                                   2518 
                                   2519 ;-------------------------------------
                                   2520 ; multiply 2 integers
                                   2521 ; product overflow is ignored unless
                                   2522 ; MATH_OVF assembler flag is set to 1
                                   2523 ; input:
                                   2524 ;  	N1      on cstack
                                   2525 ;   N2 		on cstack 
                                   2526 ; output:
                                   2527 ;	X        N1*N2 
                                   2528 ;-------------------------------------
                                   2529 	;arguments 
      000E60                       2530 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000E60                       2531 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000E60                       2532 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000E60                       2533 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000E60                       2534 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2535    ; local variables 
                           000001  2536 	SIGN=1
                           000002  2537 	PROD=2
                           000003  2538 	VSIZE=3
      000E60                       2539 multiply:
      000E60                       2540 	_vars VSIZE 
      008E02 A6 3C            [ 2]    1     sub sp,#VSIZE 
      008E04 11 01            [ 1] 2541 	clr (SIGN,sp)
      008E06 26 23            [ 2] 2542 	ldw x,(N1_HB,sp)
      008E08 A6               [ 1] 2543 	ld a,xh  
      008E09 34 6B            [ 1] 2544 	bcp a,#0x80 
      008E0B 02 72            [ 1] 2545 	jreq 2$
      008E0D 5C 00            [ 1] 2546 	cpl (SIGN,sp)
      008E0F 02               [ 2] 2547 	negw x 
      008E10 91 D6            [ 2] 2548 	ldw (N1_HB,sp),x 
      008E12 01 A1            [ 2] 2549 2$: ldw x,(N2_HB,sp)
      008E14 3D               [ 1] 2550 	ld a,xh  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E15 26 04            [ 1] 2551 	bcp a,#0x80 
      008E17 A6 36            [ 1] 2552 	jreq 3$
      008E19 20 27            [ 1] 2553 	cpl (SIGN,sp)
      008E1B A1               [ 2] 2554 	negw x 
      008E1C 3E 26            [ 2] 2555 	ldw (N2_HB,sp),x 
                                   2556 ; N1_LB * N2_LB 	
      008E1E 04 A6            [ 1] 2557 3$:	ld a,(N1_LB,sp)
      008E20 35               [ 1] 2558 	ld xl,a 
      008E21 20 1F            [ 1] 2559 	ld a,(N2_LB,sp) 
      008E23 72               [ 4] 2560 	mul x,a 
                           000000  2561 .if MATH_OVF 	
                                   2562 	ld a,xh 
                                   2563 	bcp a,#0x80 
                                   2564 	jreq 4$ 
                                   2565 	ld a,#ERR_MATH_OVF 
                                   2566 	jp tb_error
                                   2567 .endif 	 
      008E24 5A 00            [ 2] 2568 4$:	ldw (PROD,sp),x
                                   2569 ; N1_LB * N2_HB	 
      008E26 02 7B            [ 1] 2570 	ld a,(N1_LB,sp) 
      008E28 02               [ 1] 2571 	ld xl,a 
      008E29 20 17            [ 1] 2572 	ld a,(N2_HB,sp)
      008E2B 42               [ 4] 2573 	mul x,a
      008E2B 7B               [ 1] 2574 	ld a,xl 
      008E2C 01 CD            [ 1] 2575 	add a,(PROD,sp)
                           000000  2576 .if MATH_OVF 	
                                   2577 	bcp a,#0x80 
                                   2578 	jreq 5$ 
                                   2579 	ld a,#ERR_MATH_OVF 
                                   2580 	jp tb_error
                                   2581 .endif 	 
      008E2E 85 0F            [ 1] 2582 5$:	ld (PROD,sp),a 
                                   2583 ; N1_HB * N2_LB 
      008E30 25 03            [ 1] 2584 	ld a,(N1_HB,sp)
      008E32 CC               [ 1] 2585 	ld xl,a 
      008E33 88 15            [ 1] 2586 	ld a,(N2_LB,sp)
      008E35 42               [ 4] 2587 	mul x,a 
      008E35 CD               [ 1] 2588 	ld a,xl 
      008E36 8C 3D            [ 1] 2589 	add a,(PROD,sp)
                           000000  2590 .if MATH_OVF 	
                                   2591 	bcp a,#0x80 
                                   2592 	jreq 6$ 
                                   2593 	ld a,#ERR_MATH_OVF 
                                   2594 	jp tb_error
                                   2595 .endif 	 
      008E38 A3 95            [ 1] 2596 6$:	ld (PROD,sp),a 
                                   2597 ; N1_HB * N2_HB 	
                                   2598 ; it is pointless to multiply N1_HB*N2_HB 
                                   2599 ; as this product is over 65535 or 0 
                                   2600 ;
                                   2601 ; sign adjust product
      008E3A 44 26            [ 1] 2602 	tnz (SIGN,sp)
      008E3C 09 90            [ 1] 2603 	jreq 7$
      008E3E 93 CC            [ 2] 2604 	ldw x, (PROD,sp)
      008E40 8D               [ 2] 2605 	negw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E41 79 02            [ 2] 2606 	ldw (PROD,sp),x  
      008E42                       2607 7$: 
      008E42 F7 5C            [ 2] 2608 	ldw x,(PROD,sp) 
      000EA5                       2609 	_drop VSIZE 
      008E44 90 93            [ 2]    1     addw sp,#VSIZE 
      008E46 81               [ 4] 2610 	ret
                                   2611 
                                   2612 ;----------------------------------
                                   2613 ;  euclidian divide n2/n1 
                                   2614 ; input:
                                   2615 ;    N2 	on cstack
                                   2616 ;    N1 	on cstack
                                   2617 ; output:
                                   2618 ;    X      n2/n1 
                                   2619 ;    Y      remainder 
                                   2620 ;----------------------------------
      000EA8                       2621 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000EA8                       2622 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000EA8                       2623 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2624 	; local variables
                           000001  2625 	SQUOT=1 ; sign quotient
                           000002  2626 	SDIVD=2 ; sign dividend  
                           000002  2627 	VSIZE=2
      000EA8                       2628 divide:
      000EA8                       2629 	_vars VSIZE 
      008E46 5B 02            [ 2]    1     sub sp,#VSIZE 
      008E48 81 01            [ 1] 2630 	clr (SQUOT,sp)
      008E49 0F 02            [ 1] 2631 	clr (SDIVD,sp)
                                   2632 ; check for 0 divisor
      008E49 A1 61            [ 2] 2633 	ldw x,(DIVISR,sp)
      008E4B 2A               [ 2] 2634 	tnzw x 
      008E4C 01 81            [ 1] 2635     jrne 0$
      008E4E A1 7A            [ 1] 2636 	ld a,#ERR_DIV0 
      008E50 22 FB A0         [ 2] 2637 	jp tb_error 
                                   2638 ; check divisor sign 	
      008E53 20               [ 1] 2639 0$:	ld a,xh 
      008E54 81 80            [ 1] 2640 	bcp a,#0x80 
      008E55 27 03            [ 1] 2641 	jreq 1$
      008E55 89 52            [ 1] 2642 	cpl (SQUOT,sp)
      008E57 03               [ 2] 2643 	negw x 
      008E58 72 5F            [ 2] 2644 1$:	ldw (DIVISR,sp),x
                                   2645 ; check dividend sign 	 
      008E5A 00 0C            [ 2] 2646     ldw x,(DIVIDND,sp)
      008E5C 72               [ 1] 2647 	ld a,xh 
      008E5D 5F 00            [ 1] 2648 	bcp a,#0x80 
      008E5F 0D 72            [ 1] 2649 	jreq 2$ 
      008E61 5F 00            [ 1] 2650 	cpl (SQUOT,sp)
      008E63 0E 0F            [ 1] 2651 	cpl (SDIVD,sp)
      008E65 01               [ 2] 2652 	negw x 
      008E66 A6 0A            [ 2] 2653 2$:	ldw y,(DIVISR,sp)
      008E68 6B               [ 2] 2654 	divw x,y
      008E69 02 F6 27 47      [ 2] 2655 	ldw acc16,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2656 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008E6D A1 2D            [ 1] 2657 	tnz (SDIVD,sp)
      008E6F 26 04            [ 1] 2658 	jreq 7$
      008E71 03 01            [ 2] 2659 	tnzw y 
      008E73 20 08            [ 1] 2660 	jreq 7$
      008E75 A1               [ 2] 2661 	incw x
      008E76 24 26            [ 2] 2662 	ldw y,(DIVISR,sp)
      008E78 06 A6 10 6B      [ 2] 2663 	subw y,acc16
      008E7C 02 5C            [ 1] 2664 7$: tnz (SQUOT,sp)
      008E7E F6 01            [ 1] 2665 	jreq 9$ 	 
      008E7F 50               [ 2] 2666 8$:	negw x 
      000EE9                       2667 9$: 
      000EE9                       2668 	_drop VSIZE 
      008E7F A1 61            [ 2]    1     addw sp,#VSIZE 
      008E81 2B               [ 4] 2669 	ret 
                                   2670 
                                   2671 
                                   2672 ;----------------------------------
                                   2673 ;  remainder resulting from euclidian 
                                   2674 ;  division of n2/n1 
                                   2675 ; input:
                                   2676 ;   N1 		cstack 
                                   2677 ;   N2      cstack
                                   2678 ; output:
                                   2679 ;   X       N2%N1 
                                   2680 ;----------------------------------
                           000003  2681 	N1=3
                           000005  2682 	N2=5
                           000004  2683 	VSIZE=4
      000EEC                       2684 modulo:
      008E82 02 A0            [ 2] 2685 	Ldw x,(N1,sp)
      008E84 20 A1            [ 2] 2686 	ldw y,(N2,sp)
      000EF0                       2687 	_vars VSIZE 
      008E86 30 2B            [ 2]    1     sub sp,#VSIZE 
      008E88 2B A0            [ 2] 2688 	ldw (1,sp),x 
      008E8A 30 A1            [ 2] 2689 	ldw (3,sp),y 
      008E8C 0A 2B 06         [ 4] 2690 	call divide 
      008E8F A0               [ 1] 2691 	ldw x,y
      000EFA                       2692 	_drop VSIZE 
      008E90 07 11            [ 2]    1     addw sp,#VSIZE 
      008E92 02               [ 4] 2693 	ret 
                                   2694 
                                   2695 
                                   2696 ;----------------------------------
                                   2697 ; search in kword_dict name
                                   2698 ; from its execution address 
                                   2699 ; input:
                                   2700 ;   X       	execution address 
                                   2701 ; output:
                                   2702 ;   X 			cstr*  | 0 
                                   2703 ;--------------------------------
                           000001  2704 	XADR=1 
                           000003  2705 	LINK=3 
                           000004  2706 	VSIZE=4
      000EFD                       2707 cmd_name:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      000EFD                       2708 	_vars VSIZE 
      008E93 2A 1F            [ 2]    1     sub sp,#VSIZE 
      008E95 6B 03 7B 02      [ 1] 2709 	clr acc16 
      008E99 CD 8A            [ 2] 2710 	ldw (XADR,sp),x  
      008E9B 78 7B 03         [ 2] 2711 	ldw x,#kword_dict	
      008E9E CB 00            [ 2] 2712 1$:	ldw (LINK,sp),x
      008EA0 0E C7            [ 1] 2713 	ld a,(2,x)
      008EA2 00 0E            [ 1] 2714 	and a,#15 
      008EA4 4F C9 00         [ 1] 2715 	ld acc8,a 
      008EA7 0D C7 00         [ 2] 2716 	addw x,#3
      008EAA 0D 4F C9 00      [ 2] 2717 	addw x,acc16
      008EAE 0C               [ 2] 2718 	ldw x,(x) ; execution address 
      008EAF C7 00            [ 2] 2719 	cpw x,(XADR,sp)
      008EB1 0C 20            [ 1] 2720 	jreq 2$
      008EB3 C9 0D            [ 2] 2721 	ldw x,(LINK,sp)
      008EB5 01               [ 2] 2722 	ldw x,(x) 
      008EB6 27 03 CD         [ 2] 2723 	subw x,#2  
      008EB9 8A B2            [ 1] 2724 	jrne 1$
      008EBB 20 05            [ 2] 2725 	jra 9$
      008EBB 5B 03            [ 2] 2726 2$: ldw x,(LINK,sp)
      008EBD 85 81 02         [ 2] 2727 	addw x,#2 	
      008EBF                       2728 9$:	_drop VSIZE
      008EBF 88 91            [ 2]    1     addw sp,#VSIZE 
      008EC1 D6               [ 4] 2729 	ret
                                   2730 
                                   2731 
                                   2732 ;---------------------------------
                                   2733 ; dictionary search 
                                   2734 ; input:
                                   2735 ;	X 		dictionary entry point, name field  
                                   2736 ;   y		.asciz name to search 
                                   2737 ; output:
                                   2738 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2739 ;  X		execution address | 0 
                                   2740 ;---------------------------------
                           000001  2741 	NLEN=1 ; cmd length 
                           000002  2742 	XSAVE=2
                           000004  2743 	YSAVE=4
                           000005  2744 	VSIZE=5 
      000F2F                       2745 search_dict:
      000F2F                       2746 	_vars VSIZE 
      008EC2 01 27            [ 2]    1     sub sp,#VSIZE 
                                   2747 
      008EC4 0A 11            [ 2] 2748 	ldw (YSAVE,sp),y 
      000F33                       2749 search_next:
      008EC6 01 26            [ 2] 2750 	ldw (XSAVE,sp),x 
                                   2751 ; get name length in dictionary	
      008EC8 06               [ 1] 2752 	ld a,(x)
      008EC9 72 5C            [ 1] 2753 	and a,#0xf 
      008ECB 00 02            [ 1] 2754 	ld (NLEN,sp),a  
      008ECD 20 F1            [ 2] 2755 	ldw y,(YSAVE,sp) ; name pointer 
      008ECF 5B               [ 2] 2756 	incw x 
      000F3D                       2757 cp_loop:
      008ED0 01 81            [ 1] 2758 	ld a,(y)
      008ED2 27 1B            [ 1] 2759 	jreq str_match 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008ED2 1E 05            [ 1] 2760 	tnz (NLEN,sp)
      008ED4 72 FB            [ 1] 2761 	jreq no_match  
      008ED6 03               [ 1] 2762 	cp a,(x)
      008ED7 1F 03            [ 1] 2763 	jrne no_match 
      008ED9 81 5C            [ 2] 2764 	incw y 
      008EDA 5C               [ 2] 2765 	incw x
      008EDA 1E 05            [ 1] 2766 	dec (NLEN,sp)
      008EDC 72 F0            [ 2] 2767 	jra cp_loop 
      000F4F                       2768 no_match:
      008EDE 03 81            [ 2] 2769 	ldw x,(XSAVE,sp) 
      008EE0 1D 00 02         [ 2] 2770 	subw x,#2 ; move X to link field
      008EE0 52 03            [ 1] 2771 	push #TK_NONE 
      008EE2 0F               [ 2] 2772 	ldw x,(x) ; next word link 
      008EE3 01               [ 1] 2773 	pop a ; TK_NONE 
      008EE4 1E 06            [ 1] 2774 	jreq search_exit  ; not found  
                                   2775 ;try next 
      008EE6 9E A5            [ 2] 2776 	jra search_next
      000F5C                       2777 str_match:
      008EE8 80 27            [ 2] 2778 	ldw x,(XSAVE,sp)
      008EEA 05               [ 1] 2779 	ld a,(X)
      008EEB 03 01            [ 1] 2780 	ld (NLEN,sp),a ; needed to test keyword type  
      008EED 50 1F            [ 1] 2781 	and a,#0xf 
                                   2782 ; move x to procedure address field 	
      008EEF 06               [ 1] 2783 	inc a 
      008EF0 1E 08 9E         [ 1] 2784 	ld acc8,a 
      008EF3 A5 80 27 05      [ 1] 2785 	clr acc16 
      008EF7 03 01 50 1F      [ 2] 2786 	addw x,acc16 
      008EFB 08               [ 2] 2787 	ldw x,(x) ; routine entry point 
                                   2788 ;determine keyword type bits 7:6 
      008EFC 7B 07            [ 1] 2789 	ld a,(NLEN,sp)
      008EFE 97               [ 1] 2790 	swap a 
      008EFF 7B 09            [ 1] 2791 	and a,#0xc
      008F01 42               [ 1] 2792 	srl a
      008F02 1F               [ 1] 2793 	srl a 
      008F03 02 7B            [ 1] 2794 	add a,#128
      000F79                       2795 search_exit: 
      000F79                       2796 	_drop VSIZE 	 
      008F05 07 97            [ 2]    1     addw sp,#VSIZE 
      008F07 7B               [ 4] 2797 	ret 
                                   2798 
                                   2799 ;---------------------
                                   2800 ; check if next token
                                   2801 ;  is of expected type 
                                   2802 ; input:
                                   2803 ;   A 		 expected token attribute
                                   2804 ;  ouput:
                                   2805 ;   none     if fail call syntax_error 
                                   2806 ;--------------------
      000F7C                       2807 expect:
      008F08 08               [ 1] 2808 	push a 
      008F09 42 9F 1B         [ 4] 2809 	call next_token 
      008F0C 02 6B            [ 1] 2810 	cp a,(1,sp)
      008F0E 02 7B            [ 1] 2811 	jreq 1$
      008F10 06 97 7B         [ 2] 2812 	jp syntax_error
      008F13 09               [ 1] 2813 1$: pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008F14 42               [ 4] 2814 	ret 
                                   2815 
                                   2816 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2817 ; parse arguments list 
                                   2818 ; between ()
                                   2819 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F89                       2820 func_args:
      008F15 9F 1B            [ 1] 2821 	ld a,#TK_LPAREN 
      008F17 02 6B 02         [ 4] 2822 	call expect 
                                   2823 ; expected to continue in arg_list 
                                   2824 ; caller must check for TK_RPAREN 
                                   2825 
                                   2826 ;-------------------------------
                                   2827 ; parse embedded BASIC routines 
                                   2828 ; arguments list.
                                   2829 ; arg_list::=  rel[','rel]*
                                   2830 ; all arguments are of integer type
                                   2831 ; and pushed on stack 
                                   2832 ; input:
                                   2833 ;   none
                                   2834 ; output:
                                   2835 ;   stack{n}   arguments pushed on stack
                                   2836 ;   A 	number of arguments pushed on stack  
                                   2837 ;--------------------------------
      000F8E                       2838 arg_list:
      008F1A 0D 01            [ 1] 2839 	push #0  
      008F1C 27 05 1E         [ 4] 2840 1$: call relation
      008F1F 02 50            [ 1] 2841 	cp a,#TK_NONE 
      008F21 1F 02            [ 1] 2842 	jreq 5$
      008F23 A1 84            [ 1] 2843 	cp a,#TK_INTGR
      008F23 1E 02            [ 1] 2844 	jrne 4$
      000F9B                       2845 3$: 
                                   2846 ; swap return address with argument
      008F25 5B               [ 1] 2847 	pop a ; arg_count
      008F26 03 81            [ 2] 2848 	popw y ; return address 
      008F28 89               [ 2] 2849 	pushw x ; new argument 
      008F28 52 02            [ 2] 2850 	pushw y 
      008F2A 0F               [ 1] 2851     inc a
      008F2B 01               [ 1] 2852 	push a 
      008F2C 0F 02 1E         [ 4] 2853 	call next_token 
      008F2F 05 5D            [ 1] 2854 	cp a,#TK_COMMA 
      008F31 26 05            [ 1] 2855 	jreq 1$ 
      008F33 A6 04            [ 1] 2856 	cp a,#TK_NONE 
      008F35 CC 88            [ 1] 2857 	jreq 5$ 
      008F37 17 9E            [ 1] 2858 4$:	cp a,#TK_RPAREN 
      008F39 A5 80            [ 1] 2859 	jreq 5$
      000FB2                       2860 	_unget_token 
      008F3B 27 03 03 01 50   [ 1]    1     mov in,in.saved
      008F40 1F               [ 1] 2861 5$:	pop a  
      008F41 05               [ 4] 2862 	ret 
                                   2863 
                                   2864 ;--------------------------------
                                   2865 ;   BASIC commnands 
                                   2866 ;--------------------------------
                                   2867 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2868 ;--------------------------------
                                   2869 ;  arithmetic and relational 
                                   2870 ;  routines
                                   2871 ;  operators precedence
                                   2872 ;  highest to lowest
                                   2873 ;  operators on same row have 
                                   2874 ;  same precedence and are executed
                                   2875 ;  from left to right.
                                   2876 ;	'*','/','%'
                                   2877 ;   '-','+'
                                   2878 ;   '=','>','<','>=','<=','<>','><'
                                   2879 ;   '<>' and '><' are equivalent for not equal.
                                   2880 ;--------------------------------
                                   2881 
                                   2882 ;---------------------
                                   2883 ; return array element
                                   2884 ; address from @(expr)
                                   2885 ; input:
                                   2886 ;   A 		TK_ARRAY
                                   2887 ; output:
                                   2888 ;   A 		TK_INTGR
                                   2889 ;	X 		element address 
                                   2890 ;----------------------
      000FB9                       2891 get_array_element:
      008F42 1E 07 9E         [ 4] 2892 	call func_args 
      008F45 A5 80            [ 1] 2893 	cp a,#1
      008F47 27 05            [ 1] 2894 	jreq 1$
      008F49 03 01 03         [ 2] 2895 	jp syntax_error
      008F4C 02               [ 2] 2896 1$: popw x 
                                   2897 	; check for bounds 
      008F4D 50 16 05         [ 2] 2898 	cpw x,array_size 
      008F50 65 90            [ 2] 2899 	jrule 3$
                                   2900 ; bounds {1..array_size}	
      008F52 CF 00            [ 1] 2901 2$: ld a,#ERR_BAD_VALUE 
      008F54 0D 0D 02         [ 2] 2902 	jp tb_error 
      008F57 27               [ 2] 2903 3$: tnzw  x
      008F58 0B 90            [ 1] 2904 	jreq 2$ 
      008F5A 5D               [ 2] 2905 	sllw x 
      008F5B 27               [ 2] 2906 	pushw x 
      008F5C 07 5C 16         [ 2] 2907 	ldw x,#tib
      008F5F 05 72 B2         [ 2] 2908 	subw x,(1,sp)
      000FD9                       2909 	_drop 2   
      008F62 00 0D            [ 2]    1     addw sp,#2 
      008F64 0D 01            [ 1] 2910 	ld a,#TK_INTGR
      008F66 27               [ 4] 2911 	ret 
                                   2912 
                                   2913 ;***********************************
                                   2914 ;   expression parse,execute 
                                   2915 ;***********************************
                                   2916 ;-----------------------------------
                                   2917 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2918 ;			 integer | function |
                                   2919 ;			 '('relation')' 
                                   2920 ; output:
                                   2921 ;   A    token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2922 ;   X 	 integer
                                   2923 ; ---------------------------------
                           000001  2924 	NEG=1
                           000001  2925 	VSIZE=1
      000FDE                       2926 factor:
      000FDE                       2927 	_vars VSIZE 
      008F67 01 50            [ 2]    1     sub sp,#VSIZE 
      008F69 CD 08 87         [ 4] 2928 	call next_token
      008F69 5B 02            [ 1] 2929 	cp a,#CMD_END 
      008F6B 81 4E            [ 1] 2930 	jrult 20$
      008F6C 6B 01            [ 1] 2931 1$:	ld (NEG,sp),a 
      008F6C 1E 03            [ 1] 2932 	and a,#TK_GRP_MASK
      008F6E 16 05            [ 1] 2933 	cp a,#TK_GRP_ADD 
      008F70 52 04            [ 1] 2934 	jreq 2$
      008F72 1F 01            [ 1] 2935 	ld a,(NEG,sp)
      008F74 17 03            [ 2] 2936 	jra 4$  
      000FF3                       2937 2$:	
      008F76 CD 8F 28         [ 4] 2938 	call next_token 
      000FF6                       2939 4$:	
      008F79 93 5B            [ 1] 2940 	cp a,#TK_IFUNC 
      008F7B 04 81            [ 1] 2941 	jrne 5$ 
      008F7D FD               [ 4] 2942 	call (x) 
      008F7D 52 04            [ 2] 2943 	jra 18$ 
      000FFD                       2944 5$:
      008F7F 72 5F            [ 1] 2945 	cp a,#TK_INTGR
      008F81 00 0D            [ 1] 2946 	jrne 6$
      008F83 1F 01            [ 2] 2947 	jra 18$
      001003                       2948 6$:
      008F85 AE A6            [ 1] 2949 	cp a,#TK_ARRAY
      008F87 00 1F            [ 1] 2950 	jrne 10$
      008F89 03 E6 02         [ 4] 2951 	call get_array_element
      008F8C A4               [ 2] 2952 	ldw x,(x)
      008F8D 0F C7            [ 2] 2953 	jra 18$ 
      00100D                       2954 10$:
      008F8F 00 0E            [ 1] 2955 	cp a,#TK_VAR 
      008F91 1C 00            [ 1] 2956 	jrne 12$
      008F93 03               [ 2] 2957 	ldw x,(x)
      008F94 72 BB            [ 2] 2958 	jra 18$
      001014                       2959 12$:			
      008F96 00 0D            [ 1] 2960 	cp a,#TK_LPAREN
      008F98 FE 13            [ 1] 2961 	jrne 16$
      008F9A 01 27 0A         [ 4] 2962 	call relation
      008F9D 1E               [ 2] 2963 	pushw x 
      008F9E 03 FE            [ 1] 2964 	ld a,#TK_RPAREN 
      008FA0 1D 00 02         [ 4] 2965 	call expect
      008FA3 26               [ 2] 2966 	popw x 
      008FA4 E3 20            [ 2] 2967 	jra 18$	
      001024                       2968 16$:
      001024                       2969 	_unget_token
      008FA6 05 1E 03 1C 00   [ 1]    1     mov in,in.saved
      008FAB 02               [ 1] 2970 	clr a 
      008FAC 5B 04            [ 2] 2971 	jra 20$ 
      00102C                       2972 18$: 
      008FAE 81 11            [ 1] 2973 	ld a,#TK_MINUS 
      008FAF 11 01            [ 1] 2974 	cp a,(NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008FAF 52 05            [ 1] 2975 	jrne 19$
      008FB1 17               [ 2] 2976 	negw x
      001033                       2977 19$:
      008FB2 04 84            [ 1] 2978 	ld a,#TK_INTGR
      008FB3                       2979 20$:
      001035                       2980 	_drop VSIZE
      008FB3 1F 02            [ 2]    1     addw sp,#VSIZE 
      008FB5 F6               [ 4] 2981 	ret
                                   2982 
                                   2983 ;-----------------------------------
                                   2984 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2985 ; output:
                                   2986 ;   A    	token attribute 
                                   2987 ;	X		integer
                                   2988 ;-----------------------------------
                           000001  2989 	N1=1
                           000003  2990 	N2=3
                           000005  2991 	MULOP=5
                           000005  2992 	VSIZE=5
      001038                       2993 term:
      001038                       2994 	_vars VSIZE
      008FB6 A4 0F            [ 2]    1     sub sp,#VSIZE 
      008FB8 6B 01 16         [ 4] 2995 	call factor
      008FBB 04 5C            [ 1] 2996 	cp a,#CMD_END
      008FBD 25 43            [ 1] 2997 	jrult term_exit
      001041                       2998 term01:	 ; check for  operator 
      008FBD 90 F6            [ 2] 2999 	ldw (N2,sp),x  ; save first factor 
      008FBF 27 1B 0D         [ 4] 3000 	call next_token
      008FC2 01 27            [ 1] 3001 	cp a,#CMD_END
      008FC4 0A F1            [ 1] 3002 	jrult 9$
      008FC6 26 07            [ 1] 3003 0$:	ld (MULOP,sp),a
      008FC8 90 5C            [ 1] 3004 	and a,#TK_GRP_MASK
      008FCA 5C 0A            [ 1] 3005 	cp a,#TK_GRP_MULT
      008FCC 01 20            [ 1] 3006 	jreq 1$
      008FCE EE 05            [ 1] 3007 	ld a,(MULOP,sp) 
      008FCF                       3008 	_unget_token 
      008FCF 1E 02 1D 00 02   [ 1]    1     mov in,in.saved
      008FD4 4B 00            [ 2] 3009 	jra 9$
      00105B                       3010 1$:	; got *|/|%
      008FD6 FE 84 27         [ 4] 3011 	call factor
      008FD9 1F 20            [ 1] 3012 	cp a,#TK_INTGR
      008FDB D7 03            [ 1] 3013 	jreq 2$ 
      008FDC CC 07 95         [ 2] 3014 	jp syntax_error
      008FDC 1E 02            [ 2] 3015 2$:	ldw (N1,sp),x  
      008FDE F6 6B            [ 1] 3016 	ld a,(MULOP,sp) 
      008FE0 01 A4            [ 1] 3017 	cp a,#TK_MULT 
      008FE2 0F 4C            [ 1] 3018 	jrne 3$
      008FE4 C7 00 0E         [ 4] 3019 	call multiply 
      008FE7 72 5F            [ 2] 3020 	jra term01
      008FE9 00 0D            [ 1] 3021 3$: cp a,#TK_DIV 
      008FEB 72 BB            [ 1] 3022 	jrne 4$ 
      008FED 00 0D FE         [ 4] 3023 	call divide 
      008FF0 7B 01            [ 2] 3024 	jra term01 
      008FF2 4E A4 0C         [ 4] 3025 4$: call modulo
      008FF5 44 44            [ 2] 3026 	jra term01 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008FF7 AB 80            [ 2] 3027 9$: ldw x,(N2,sp)  
      008FF9 A6 84            [ 1] 3028 	ld a,#TK_INTGR 	
      001084                       3029 term_exit:
      001084                       3030 	_drop VSIZE 
      008FF9 5B 05            [ 2]    1     addw sp,#VSIZE 
      008FFB 81               [ 4] 3031 	ret 
                                   3032 
                                   3033 ;-------------------------------
                                   3034 ;  expr ::= term [['+'|'-'] term]*
                                   3035 ;  result range {-32768..32767}
                                   3036 ;  output:
                                   3037 ;   A    token attribute 
                                   3038 ;   X	 integer   
                                   3039 ;-------------------------------
                           000001  3040 	N1=1 
                           000003  3041 	N2=3
                           000005  3042 	OP=5 
                           000005  3043 	VSIZE=5 
      008FFC                       3044 expression:
      001087                       3045 	_vars VSIZE 
      008FFC 88 CD            [ 2]    1     sub sp,#VSIZE 
      008FFE 89 07 11         [ 4] 3046 	call term
      009001 01 27            [ 1] 3047 	cp a,#CMD_END 
      009003 03 CC            [ 1] 3048 	jrult expr_exit 
      009005 88 15            [ 2] 3049 0$:	ldw (N2,sp),x 
      009007 84 81 87         [ 4] 3050 	call next_token
      009009 A1 02            [ 1] 3051 	cp a,#CMD_END 
      009009 A6 07            [ 1] 3052 	jrult 9$ 
      00900B CD 8F            [ 1] 3053 1$:	ld (OP,sp),a  
      00900D FC 30            [ 1] 3054 	and a,#TK_GRP_MASK
      00900E A1 10            [ 1] 3055 	cp a,#TK_GRP_ADD 
      00900E 4B 00            [ 1] 3056 	jreq 2$ 
      0010A1                       3057 	_unget_token
      009010 CD 91 4B A1 00   [ 1]    1     mov in,in.saved
      009015 27 20            [ 2] 3058 	jra 9$
      0010A8                       3059 2$: 
      009017 A1 84 26         [ 4] 3060 	call term
      00901A 13 84            [ 1] 3061 	cp a,#TK_INTGR 
      00901B 27 03            [ 1] 3062 	jreq 3$
      00901B 84 90 85         [ 2] 3063 	jp syntax_error
      00901E 89 90            [ 2] 3064 3$:	ldw (N1,sp),x 
      009020 89 4C            [ 1] 3065 	ld a,(OP,sp)
      009022 88 CD            [ 1] 3066 	cp a,#TK_PLUS 
      009024 89 07            [ 1] 3067 	jrne 4$
      009026 A1 09 27         [ 4] 3068 	call add 
      009029 E6 A1            [ 2] 3069 	jra 0$ 
      00902B 00 27 09         [ 4] 3070 4$:	call substract
      00902E A1 08            [ 2] 3071 	jra 0$
      009030 27 05            [ 2] 3072 9$: ldw x,(N2,sp)
      009032 55 00            [ 1] 3073 	ld a,#TK_INTGR	
      0010C8                       3074 expr_exit:
      0010C8                       3075 	_drop VSIZE 
      009034 03 00            [ 2]    1     addw sp,#VSIZE 
      009036 02               [ 4] 3076 	ret 
                                   3077 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3078 ;---------------------------------------------
                                   3079 ; rel ::= expr rel_op expr
                                   3080 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3081 ;  relation return 1 | 0  for true | false 
                                   3082 ;  output:
                                   3083 ;    A 		token attribute  
                                   3084 ;	 X		1|0
                                   3085 ;---------------------------------------------
                           000001  3086 	N1=1
                           000003  3087 	N2=3
                           000005  3088 	RELOP=5
                           000005  3089 	VSIZE=5 
      0010CB                       3090 relation: 
      0010CB                       3091 	_vars VSIZE
      009037 84 81            [ 2]    1     sub sp,#VSIZE 
      009039 CD 10 87         [ 4] 3092 	call expression
      009039 CD 90            [ 1] 3093 	cp a,#CMD_END  
      00903B 09 A1            [ 1] 3094 	jrult rel_exit 
                                   3095 	; expect rel_op or leave 
      00903D 01 27            [ 2] 3096 	ldw (N2,sp),x 
      00903F 03 CC 88         [ 4] 3097 	call next_token 
      009042 15 85            [ 1] 3098 	cp a,#CMD_END 
      009044 C3 00            [ 1] 3099 	jrult 9$
      0010DD                       3100 1$:	
      009046 22 23            [ 1] 3101 	ld (RELOP,sp),a 
      009048 05 A6            [ 1] 3102 	and a,#TK_GRP_MASK
      00904A 0A CC            [ 1] 3103 	cp a,#TK_GRP_RELOP 
      00904C 88 17            [ 1] 3104 	jreq 2$
      0010E5                       3105 	_unget_token  
      00904E 5D 27 F8 58 89   [ 1]    1     mov in,in.saved
      009053 AE 16            [ 2] 3106 	jra 9$
      0010EC                       3107 2$:	; expect another expression or error 
      009055 90 72 F0         [ 4] 3108 	call expression
      009058 01 5B            [ 1] 3109 	cp a,#TK_INTGR 
      00905A 02 A6            [ 1] 3110 	jreq 3$
      00905C 84 81 95         [ 2] 3111 	jp syntax_error 
      00905E 1F 01            [ 2] 3112 3$:	ldw (N1,sp),x 
      00905E 52 01 CD         [ 4] 3113 	call substract
      009061 89 07            [ 1] 3114 	jrne 4$
      009063 A1 02 25 4E      [ 1] 3115 	mov acc8,#2 ; n1==n2
      009067 6B 01            [ 2] 3116 	jra 6$ 
      001103                       3117 4$: 
      009069 A4 30            [ 1] 3118 	jrsgt 5$  
      00906B A1 10 27 04      [ 1] 3119 	mov acc8,#4 ; n1<2 
      00906F 7B 01            [ 2] 3120 	jra 6$
      00110B                       3121 5$:
      009071 20 03 00 0D      [ 1] 3122 	mov acc8,#1 ; n1>n2 
      009073                       3123 6$:
      009073 CD               [ 1] 3124 	clrw x 
      009074 89 07 0D         [ 1] 3125 	ld a, acc8  
      009076 14 05            [ 1] 3126 	and a,(RELOP,sp)
      009076 A1               [ 1] 3127 	tnz a 
      009077 81 26            [ 1] 3128 	jreq 10$
      009079 03               [ 2] 3129 	incw x 
      001119                       3130 7$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00907A FD 20            [ 2] 3131 	jra 10$  	
      00907C 2F 03            [ 2] 3132 9$: ldw x,(N2,sp)
      00907D                       3133 10$:
      00907D A1 84            [ 1] 3134 	ld a,#TK_INTGR
      00111F                       3135 rel_exit: 	 
      00111F                       3136 	_drop VSIZE
      00907F 26 02            [ 2]    1     addw sp,#VSIZE 
      009081 20               [ 4] 3137 	ret 
                                   3138 
                                   3139 ;--------------------------------
                                   3140 ; BASIC: SHOW 
                                   3141 ; print stack content in hexadecimal bytes 
                                   3142 ; 16 bytes per row 
                                   3143 ;--------------------------------
      001122                       3144 show:
      009082 29 11 3C         [ 2] 3145 	ldw x,#cstk_prompt
      009083 CD 01 D7         [ 4] 3146 	call puts 
      009083 A1               [ 1] 3147 	ldw x,sp 
      009084 06 26 06         [ 2] 3148 	addw x,#3 ; ignore return address
      009087 CD 90 39 FE      [ 2] 3149 	ldw y,#RAM_SIZE  
      00908B 20 1F 0C         [ 2] 3150 	ldw acc16,x 
      00908D 72 B2 00 0C      [ 2] 3151 	subw y,acc16
      00908D A1 85 26         [ 4] 3152 	call hex_dump
      009090 03               [ 1] 3153 	clr a 
      009091 FE               [ 4] 3154 	ret
                                   3155 
      009092 20 18 6F 6E 74 65 6E  3156 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3157 
                                   3158 
                                   3159 ;--------------------------------------------
                                   3160 ; BASIC: HEX 
                                   3161 ; select hexadecimal base for integer print
                                   3162 ;---------------------------------------------
      009094                       3163 hex_base:
      009094 A1 07 26 0C      [ 1] 3164 	mov base,#16 
      009098 CD               [ 4] 3165 	ret 
                                   3166 
                                   3167 ;--------------------------------------------
                                   3168 ; BASIC: DEC 
                                   3169 ; select decimal base for integer print
                                   3170 ;---------------------------------------------
      001168                       3171 dec_base:
      009099 91 4B 89 A6      [ 1] 3172 	mov base,#10
      00909D 08               [ 4] 3173 	ret 
                                   3174 
                                   3175 ;------------------------
                                   3176 ; BASIC: SIZE 
                                   3177 ; return free size in text area
                                   3178 ; output:
                                   3179 ;   A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3180 ;   X 	    size integer
                                   3181 ;--------------------------
      00116D                       3182 size:
      00909E CD 8F FC         [ 2] 3183 	ldw x,#tib 
      0090A1 85 20 08 1E      [ 2] 3184 	subw x,txtend 
      0090A4 A6 84            [ 1] 3185 	ld a,#TK_INTGR
      0090A4 55               [ 4] 3186 	ret 
                                   3187 
                                   3188 
                                   3189 ;------------------------
                                   3190 ; BASIC: UBOUND  
                                   3191 ; return array variable size 
                                   3192 ; output:
                                   3193 ;   A 		TK_INTGR
                                   3194 ;   X 	    array size 
                                   3195 ;--------------------------
      001177                       3196 ubound:
      0090A5 00 03 00         [ 2] 3197 	ldw x,#tib
      0090A8 02 4F 20 09      [ 2] 3198 	subw x,txtend 
      0090AC 90 CE 00 04      [ 2] 3199 	ldw y,basicptr 
      0090AC A6 11 11 01      [ 2] 3200 	cpw y,txtend 
      0090B0 26 01            [ 1] 3201 	jrult 1$
      0090B2 50 00 03         [ 1] 3202 	push count 
      0090B3 4B 00            [ 1] 3203 	push #0 
      0090B3 A6 84 01         [ 2] 3204 	subw x,(1,sp)
      0090B5                       3205 	_drop 2 
      0090B5 5B 01            [ 2]    1     addw sp,#2 
      0090B7 81               [ 2] 3206 1$:	srlw x 
      0090B8 CF 00 21         [ 2] 3207 	ldw array_size,x
      0090B8 52 05            [ 1] 3208 	ld a,#TK_INTGR
      0090BA CD               [ 4] 3209 	ret 
                                   3210 
                                   3211 ;-----------------------------
                                   3212 ; BASIC: LET var=expr 
                                   3213 ; variable assignement 
                                   3214 ; output:
                                   3215 ;   A 		TK_NONE 
                                   3216 ;-----------------------------
      001199                       3217 let:
      0090BB 90 5E A1         [ 4] 3218 	call next_token 
      0090BE 02 25            [ 1] 3219 	cp a,#TK_VAR 
      0090C0 43 0A            [ 1] 3220 	jreq let_var
      0090C1 A1 06            [ 1] 3221 	cp a,#TK_ARRAY 
      0090C1 1F 03            [ 1] 3222 	jreq  let_array
      0090C3 CD 89 07         [ 2] 3223 	jp syntax_error
      0011A7                       3224 let_array:
      0090C6 A1 02 25         [ 4] 3225 	call get_array_element
      0011AA                       3226 let_var:
      0090C9 36               [ 2] 3227 	pushw x  
      0090CA 6B 05 A4         [ 4] 3228 	call next_token 
      0090CD 30 A1            [ 1] 3229 	cp a,#TK_EQUAL
      0090CF 20 27            [ 1] 3230 	jreq 1$
      0090D1 09 7B 05         [ 2] 3231 	jp syntax_error
      0011B5                       3232 1$:	
      0090D4 55 00 03         [ 4] 3233 	call relation   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0090D7 00 02            [ 1] 3234 	cp a,#TK_INTGR 
      0090D9 20 25            [ 1] 3235 	jreq 2$
      0090DB CC 07 95         [ 2] 3236 	jp syntax_error
      0011BF                       3237 2$:	
      0090DB CD 90            [ 1] 3238 	ldw y,x 
      0090DD 5E               [ 2] 3239 	popw x   
      0090DE A1               [ 2] 3240 	ldw (x),y   
      0090DF 84               [ 4] 3241 	ret 
                                   3242 
                                   3243 ;----------------------------
                                   3244 ; BASIC: LIST [[start][,end]]
                                   3245 ; list program lines 
                                   3246 ; form start to end 
                                   3247 ; if empty argument list then 
                                   3248 ; list all.
                                   3249 ;----------------------------
                           000001  3250 	FIRST=1
                           000003  3251 	LAST=3 
                           000005  3252 	LN_PTR=5
                           000006  3253 	VSIZE=6 
      0011C4                       3254 list:
      0090E0 27 03 CC         [ 2] 3255 	ldw x,txtbgn 
      0090E3 88 15 1F         [ 2] 3256 	cpw x,txtend 
      0090E6 01 7B            [ 1] 3257 	jrmi 1$
      0090E8 05               [ 4] 3258 	ret 
      0011CD                       3259 1$:	
      0011CD                       3260 	_vars VSIZE
      0090E9 A1 20            [ 2]    1     sub sp,#VSIZE 
      0090EB 26 05            [ 2] 3261 	ldw (LN_PTR,sp),x 
      0090ED CD               [ 2] 3262 	ldw x,(x) 
      0090EE 8E E0            [ 2] 3263 	ldw (FIRST,sp),x ; list from first line 
      0090F0 20 CF A1         [ 2] 3264 	ldw x,#MAX_LINENO ; biggest line number 
      0090F3 21 26            [ 2] 3265 	ldw (LAST,sp),x 
      0090F5 05 CD 8F         [ 4] 3266 	call arg_list
      0090F8 28               [ 1] 3267 	tnz a
      0090F9 20 C6            [ 1] 3268 	jreq list_start 
      0090FB CD 8F            [ 1] 3269 	cp a,#2 
      0090FD 6C 20            [ 1] 3270 	jreq 4$
      0090FF C1 1E            [ 1] 3271 	cp a,#1 
      009101 03 A6            [ 1] 3272 	jreq first_line 
      009103 84 07 95         [ 2] 3273 	jp syntax_error 
      009104 85               [ 2] 3274 4$:	popw x 
      009104 5B 05            [ 2] 3275 	ldw (LAST+2,sp),x 
      0011ED                       3276 first_line:
      009106 81               [ 2] 3277 	popw x
      009107 1F 01            [ 2] 3278 	ldw (FIRST,sp),x 
      0011F0                       3279 lines_skip:
      009107 52 05 CD         [ 2] 3280 	ldw x,txtbgn
      00910A 90 B8            [ 2] 3281 2$:	ldw (LN_PTR,sp),x 
      00910C A1 02 25         [ 2] 3282 	cpw x,txtend 
      00910F 38 1F            [ 1] 3283 	jrpl list_exit 
      009111 03               [ 2] 3284 	ldw x,(x) ;line# 
      009112 CD 89            [ 2] 3285 	cpw x,(FIRST,sp)
      009114 07 A1            [ 1] 3286 	jrpl list_start 
      009116 02 25            [ 2] 3287 	ldw x,(LN_PTR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009118 2B 6B            [ 1] 3288 	ld a,(2,x)
      00911A 05 A4 30         [ 1] 3289 	ld acc8,a 
      00911D A1 10 27 07      [ 1] 3290 	clr acc16 
      009121 55 00 03 00      [ 2] 3291 	addw x,acc16
      009125 02 20            [ 2] 3292 	jra 2$ 
                                   3293 ; print loop
      001210                       3294 list_start:
      009127 1C 05            [ 2] 3295 	ldw x,(LN_PTR,sp)
      009128 E6 02            [ 1] 3296 3$:	ld a,(2,x) 
      009128 CD 90 B8         [ 4] 3297 	call prt_basic_line
      00912B A1 84            [ 2] 3298 	ldw x,(LN_PTR,sp)
      00912D 27 03            [ 1] 3299 	ld a,(2,x)
      00912F CC 88 15         [ 1] 3300 	ld acc8,a 
      009132 1F 01 7B 05      [ 1] 3301 	clr acc16 
      009136 A1 10 26 05      [ 2] 3302 	addw x,acc16
      00913A CD 8E D2         [ 2] 3303 	cpw x,txtend 
      00913D 20 D1            [ 1] 3304 	jrpl list_exit
      00913F CD 8E            [ 2] 3305 	ldw (LN_PTR,sp),x
      009141 DA               [ 2] 3306 	ldw x,(x)
      009142 20 CC            [ 2] 3307 	cpw x,(LAST,sp)  
      009144 1E 03            [ 1] 3308 	jrsgt list_exit 
      009146 A6 84            [ 2] 3309 	ldw x,(LN_PTR,sp)
      009148 20 DC            [ 2] 3310 	jra 3$
      001236                       3311 list_exit:
      001236                       3312 	_drop VSIZE 
      009148 5B 05            [ 2]    1     addw sp,#VSIZE 
      00914A 81               [ 4] 3313 	ret
                                   3314 
                                   3315 ;-------------------------
                                   3316 ; print counted string 
                                   3317 ; input:
                                   3318 ;   X 	address of string
                                   3319 ;--------------------------
      00914B                       3320 prt_cmd_name:
      00914B 52               [ 1] 3321 	ld a,(x)
      00914C 05               [ 2] 3322 	incw x
      00914D CD 91            [ 1] 3323 	and a,#15  
      00914F 07               [ 1] 3324 	push a 
      009150 A1 02            [ 1] 3325 1$: tnz (1,sp) 
      009152 25 4B            [ 1] 3326 	jreq 9$
      009154 1F               [ 1] 3327 	ld a,(x)
      009155 03 CD 89         [ 4] 3328 	call putc 
      009158 07               [ 2] 3329 	incw x
      009159 A1 02            [ 1] 3330 	dec (1,sp)	 
      00915B 25 3E            [ 2] 3331 	jra 1$
      00915D 84               [ 1] 3332 9$: pop a 
      00915D 6B               [ 4] 3333 	ret	
                                   3334 
                                   3335 ;--------------------------
                                   3336 ; print TK_QSTR
                                   3337 ; converting control character
                                   3338 ; to backslash sequence
                                   3339 ; input:
                                   3340 ;   X        char *
                                   3341 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00124D                       3342 prt_quote:
      00915E 05 A4            [ 1] 3343 	ld a,#'"
      009160 30 A1 30         [ 4] 3344 	call putc 
      009163 27               [ 1] 3345 1$:	ld a,(x)
      009164 07 55            [ 1] 3346 	jreq 9$
      009166 00               [ 2] 3347 	incw x 
      009167 03 00            [ 1] 3348 	cp a,#SPACE 
      009169 02 20            [ 1] 3349 	jrult 3$
      00916B 2F 01 C4         [ 4] 3350 	call putc
      00916C A1 5C            [ 1] 3351 	cp a,#'\ 
      00916C CD 91            [ 1] 3352 	jrne 1$ 
      001261                       3353 2$:
      00916E 07 A1 84         [ 4] 3354 	call putc 
      009171 27 03            [ 2] 3355 	jra 1$
      009173 CC               [ 1] 3356 3$: push a 
      009174 88 15            [ 1] 3357 	ld a,#'\
      009176 1F 01 CD         [ 4] 3358 	call putc 
      009179 8E               [ 1] 3359 	pop a 
      00917A DA 26            [ 1] 3360 	sub a,#7
      00917C 06 35 02         [ 1] 3361 	ld acc8,a 
      00917F 00 0E 20 0C      [ 1] 3362 	clr acc16
      009183 90 AE 0B 2E      [ 2] 3363 	ldw y,#escaped 
      009183 2C 06 35 04      [ 2] 3364 	addw y,acc16 
      009187 00 0E            [ 1] 3365 	ld a,(y)
      009189 20 04            [ 2] 3366 	jra 2$
      00918B A6 22            [ 1] 3367 9$: ld a,#'"
      00918B 35 01 00         [ 4] 3368 	call putc 
      00918E 0E               [ 2] 3369 	incw x 
      00918F 81               [ 4] 3370 	ret
                                   3371 
                                   3372 ;--------------------------
                                   3373 ; return variable name 
                                   3374 ; from its address.
                                   3375 ; input:
                                   3376 ;   X    variable address
                                   3377 ; output:
                                   3378 ;   A     variable letter
                                   3379 ;--------------------------
      001289                       3380 var_name:
      00918F 5F C6 00         [ 2] 3381 		subw x,#vars 
      009192 0E               [ 1] 3382 		ld a,xl 
      009193 14               [ 1] 3383 		srl a 
      009194 05 4D            [ 1] 3384 		add a,#'A 
      009196 27               [ 4] 3385 		ret 
                                   3386 
                                   3387 
                                   3388 ;--------------------------
                                   3389 ; decompile line from token list 
                                   3390 ; input:
                                   3391 ;   A       stop at this position 
                                   3392 ;   X 		pointer at line
                                   3393 ; output:
                                   3394 ;   none 
                                   3395 ;--------------------------	
                           000001  3396 	BASE_SAV=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                           000002  3397 	WIDTH_SAV=2
                           000003  3398 	XSAVE=3
                           000005  3399 	LLEN=5
                           000005  3400 	VSIZE=5 
      001291                       3401 prt_basic_line:
      001291                       3402 	_vars VSIZE
      009197 05 5C            [ 2]    1     sub sp,#VSIZE 
      009199 6B 05            [ 1] 3403 	ld (LLEN,sp),a  
      009199 20 02 1E         [ 1] 3404 	ld a,base
      00919C 03 01            [ 1] 3405 	ld (BASE_SAV,sp),a  
      00919D C6 00 24         [ 1] 3406 	ld a,tab_width 
      00919D A6 84            [ 1] 3407 	ld (WIDTH_SAV,sp),a 
      00919F CF 00 17         [ 2] 3408 	ldw ptr16,x
      00919F 5B               [ 2] 3409 	ldw x,(x)
      0091A0 05 81 00 0A      [ 1] 3410 	mov base,#10
      0091A2 35 05 00 24      [ 1] 3411 	mov tab_width,#5
      0091A2 AE 91 BC         [ 4] 3412 	call print_int ; print line number 
      0091A5 CD 82            [ 1] 3413 	ld a,#SPACE 
      0091A7 57 96 1C         [ 4] 3414 	call putc 
      0091AA 00 03 90 AE      [ 1] 3415 	clr tab_width
      0091AE 18 00 CF         [ 2] 3416 	ldw x,#3
      0091B1 00               [ 1] 3417 1$:	ld a,xl 
      0091B2 0D 72            [ 1] 3418 	cp a,(LLEN,sp)
      0091B4 B2 00            [ 1] 3419 	jrmi 2$
      0091B6 0D CD 82         [ 2] 3420 	jp 20$
      0012C2                       3421 2$:	 
      0091B9 F9 4F 81 0A      [ 4] 3422 	ld a,([ptr16],x)
      0091BD 63               [ 2] 3423 	incw x 
      0091BE 6F 6E            [ 2] 3424 	ldw (XSAVE,sp),x 
      0091C0 74 65 6E 74      [ 5] 3425 	ldw x,([ptr16],x)
      0091C4 20               [ 1] 3426 	tnz a 
      0091C5 6F 66            [ 1] 3427 	jrmi 3$
      0091C7 20 73            [ 1] 3428 	cp a,#TK_QSTR 
      0091C9 74 61            [ 1] 3429 	jreq 6$
      0091CB 63 6B            [ 1] 3430 	cp a,#TK_CHAR 
      0091CD 20 66            [ 1] 3431 	jreq 7$
      0091CF 72 6F            [ 2] 3432 	jra 8$
                                   3433 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0012DA                       3434 3$:	
      0091D1 6D 20            [ 1] 3435 	cp a,#TK_VAR 
      0091D3 74 6F            [ 1] 3436 	jreq 4$
      0091D5 70 20            [ 1] 3437 	cp a,#TK_INTGR
      0091D7 74 6F            [ 1] 3438 	jreq 5$
      0091D9 20 62 6F         [ 2] 3439 	cpw x,#remark 
      0091DC 74 74            [ 1] 3440 	jrne 30$
      0091DE 6F 6D            [ 1] 3441 	ld a,#''
      0091E0 3A 0A 00         [ 4] 3442 	call putc 
      0091E3 1E 03            [ 2] 3443 	ldw x,(XSAVE,sp)
      0091E3 35 10 00         [ 2] 3444 	addw x,#2
      0091E6 0B 81 00 17      [ 2] 3445 	addw x,ptr16  
      0091E8 CD 01 D7         [ 4] 3446 	call puts 
      0091E8 35 0A 00         [ 2] 3447 	jp 20$ 
      0012FB                       3448 30$:
      0091EB 0B 81            [ 1] 3449 	ld a,#SPACE 
      0091ED CD 01 C4         [ 4] 3450 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0091ED AE 16 90         [ 4] 3451 	call cmd_name
      0091F0 72 B0 00         [ 4] 3452 	call prt_cmd_name
      0091F3 1F A6            [ 1] 3453 	ld a,#SPACE 
      0091F5 84 81 C4         [ 4] 3454 	call putc 
      0091F7                       3455 31$:
      0091F7 AE 16            [ 2] 3456 	ldw x,(XSAVE,sp)
      0091F9 90 72 B0         [ 2] 3457 	addw x,#2
      0091FC 00 1F            [ 2] 3458 	jra 1$
                                   3459 ;; TK_VAR 
      001312                       3460 4$:
                                   3461 ;	ld a,#SPACE 
                                   3462 ;	call putc 
      0091FE 90 CE 00         [ 4] 3463 	call var_name
      009201 05 90 C3         [ 4] 3464 	call putc 
      009204 00 1F            [ 2] 3465 	jra 31$
                                   3466 ;; TK_INTGR
      00131A                       3467 5$:
                                   3468 ;	ld a,#SPACE 
                                   3469 ;	call putc
      009206 25 0A 3B         [ 4] 3470 	call print_int 
      009209 00 04            [ 2] 3471 	jra 31$
                                   3472 ;; TK_QSTR
      00131F                       3473 6$:
      00920B 4B 00            [ 2] 3474 	ldw x,(XSAVE,sp)
      00920D 72 F0 01 5B      [ 2] 3475 	addw x,ptr16 
      009211 02 54 CF         [ 4] 3476 	call prt_quote  
      009214 00 22 A6 84      [ 2] 3477 	subw x,ptr16  
      009218 81 12 BA         [ 2] 3478 	jp 1$
                                   3479 ;; TK_CHAR 
      009219                       3480 7$:
      009219 CD 89            [ 1] 3481 	ld a,#'\ 
      00921B 07 A1 85         [ 4] 3482 	call putc 
      00921E 27               [ 1] 3483 	ld a,xh 
      00921F 0A A1 06         [ 4] 3484 	call putc 
      009222 27 03            [ 2] 3485 	ldw x,(XSAVE,sp)
      009224 CC               [ 2] 3486 	incw x 
      009225 88 15 BA         [ 2] 3487 	jp 1$ 
      009227 A1 01            [ 1] 3488 8$: cp a,#TK_COLON 
      009227 CD 90            [ 1] 3489 	jrne 9$
      009229 39 3A            [ 1] 3490 	ld a,#':
      00922A                       3491 81$:
      00922A 89 CD 89         [ 4] 3492 	call putc
      001347                       3493 82$:
      00922D 07 A1            [ 2] 3494 	ldw x,(XSAVE,sp)
      00922F 32 27 03         [ 2] 3495 	jp 1$ 
      00134C                       3496 9$: 
      009232 CC 88            [ 1] 3497 	cp a,#TK_SHARP
      009234 15 0E            [ 1] 3498 	jrugt 10$ 
      009235 A0 06            [ 1] 3499 	sub a,#TK_ARRAY 
      009235 CD 91            [ 1] 3500 	clrw y 
      009237 4B A1            [ 1] 3501 	ld yl,a
      009239 84 27 03 CC      [ 2] 3502 	addw y,#single_char 
      00923D 88 15            [ 1] 3503 	ld a,(y)
      00923F 20 E6            [ 2] 3504 	jra 81$ 
      00135E                       3505 10$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00923F 90 93            [ 1] 3506 	cp a,#TK_MINUS 
      009241 85 FF            [ 1] 3507 	jrugt 11$
      009243 81 10            [ 1] 3508 	sub a,#TK_PLUS 
      009244 90 5F            [ 1] 3509 	clrw y 
      009244 CE 00            [ 1] 3510 	ld yl,a 
      009246 1D C3 00 1F      [ 2] 3511 	addw y,#add_char 
      00924A 2B 01            [ 1] 3512 	ld a,(y)
      00924C 81 D4            [ 2] 3513 	jra 81$
      00924D                       3514 11$:
      00924D 52 06            [ 1] 3515     cp a,#TK_MOD 
      00924F 1F 05            [ 1] 3516 	jrugt 12$
      009251 FE 1F            [ 1] 3517 	sub a,#TK_MULT
      009253 01 AE            [ 1] 3518 	clrw y 
      009255 7F FF            [ 1] 3519 	ld yl,a 
      009257 1F 03 CD 90      [ 2] 3520 	addw y,#mul_char
      00925B 0E 4D            [ 1] 3521 	ld a,(y)
      00925D 27 31            [ 2] 3522 	jra 81$
      001382                       3523 12$:
      00925F A1 02            [ 1] 3524 	sub a,#TK_GT  
      009261 27               [ 1] 3525 	sll a 
      009262 07               [ 1] 3526 	clrw x 
      009263 A1               [ 1] 3527 	ld xl,a 
      009264 01 27 06         [ 2] 3528 	addw x,#relop_str 
      009267 CC               [ 2] 3529 	ldw x,(x)
      009268 88 15 85         [ 4] 3530 	call puts 
      00926B 1F 05            [ 2] 3531 	jra 82$
      00926D                       3532 20$: 
      00926D 85 1F            [ 1] 3533 	ld a,#CR 
      00926F 01 01 C4         [ 4] 3534 	call putc
      009270 7B 02            [ 1] 3535 	ld a,(WIDTH_SAV,sp) 
      009270 CE 00 1D         [ 1] 3536 	ld tab_width,a 
      009273 1F 05            [ 1] 3537 	ld a,(BASE_SAV,sp) 
      009275 C3 00 1F         [ 1] 3538 	ld base,a
      00139F                       3539 	_drop VSIZE 
      009278 2A 3C            [ 2]    1     addw sp,#VSIZE 
      00927A FE               [ 4] 3540 	ret 
                                   3541 
      00927B 13 01 2A 11 1E        3542 single_char: .byte '@','(',')',',','#'
      009280 05 E6                 3543 add_char: .byte '+','-'
      009282 02 C7 00              3544 mul_char: .byte '*','/','%'
      009285 0E 72 5F 00 0D 72 BB  3545 relop_str: .word gt,equal,ge,lt,le,ne 
             00 0D 20 E3 C4
      009290 3E 00                 3546 gt: .asciz ">"
      009290 1E 05                 3547 equal: .asciz "="
      009292 E6 02 CD              3548 ge: .asciz ">="
      009295 93 11                 3549 lt: .asciz "<"
      009297 1E 05 E6              3550 le: .asciz "<="
      00929A 02 C7 00              3551 ne:  .asciz "<>"
                                   3552 
                                   3553 
                                   3554 ;---------------------------------
                                   3555 ; BASIC: PRINT|? arg_list 
                                   3556 ; print values from argument list
                                   3557 ;----------------------------------
                           000001  3558 	COMMA=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                           000001  3559 	VSIZE=1
      0013C7                       3560 print:
      00929D 0E 72            [ 1] 3561 push #0 ; local variable COMMA 
      0013C9                       3562 reset_comma:
      00929F 5F 00            [ 1] 3563 	clr (COMMA,sp)
      0013CB                       3564 prt_loop:
      0092A1 0D 72 BB         [ 4] 3565 	call next_token
      0092A4 00 0D            [ 1] 3566 	cp a,#CMD_END 
      0092A6 C3 00            [ 1] 3567 	jrult print_exit ; colon or end of line 
      0092A8 1F 2A            [ 1] 3568 	cp a,#TK_QSTR
      0092AA 0B 1F            [ 1] 3569 	jreq 1$
      0092AC 05 FE            [ 1] 3570 	cp a,#TK_CHAR 
      0092AE 13 03            [ 1] 3571 	jreq 2$ 
      0092B0 2C 04            [ 1] 3572 	cp a,#TK_CFUNC 
      0092B2 1E 05            [ 1] 3573 	jreq 3$
      0092B4 20 DC            [ 1] 3574 	cp a,#TK_COMMA 
      0092B6 27 18            [ 1] 3575 	jreq 4$
      0092B6 5B 06            [ 1] 3576 	cp a,#TK_SHARP 
      0092B8 81 1B            [ 1] 3577 	jreq 5$
      0092B9 20 2B            [ 2] 3578 	jra 7$ 
      0013E8                       3579 1$:	; print string 
      0092B9 F6 5C A4         [ 4] 3580 	call puts
      0092BC 0F 88            [ 2] 3581 	jra reset_comma
      0013ED                       3582 2$:	; print character 
      0092BE 0D               [ 1] 3583 	ld a,xl 
      0092BF 01 27 09         [ 4] 3584 	call putc 
      0092C2 F6 CD            [ 2] 3585 	jra reset_comma 
      0013F3                       3586 3$: ; print character function value  	
      0092C4 82               [ 4] 3587 	call (x)
      0092C5 44               [ 1] 3588 	ld a,xl 
      0092C6 5C 0A 01         [ 4] 3589 	call putc
      0092C9 20 F3            [ 2] 3590 	jra reset_comma 
      0013FA                       3591 4$: ; set comma state 
      0092CB 84 81            [ 1] 3592 	ld a,#255 
      0092CD 6B 01            [ 1] 3593 	ld (COMMA,sp),a  
      0092CD A6 22 CD         [ 2] 3594 	jp prt_loop   
      001401                       3595 5$: ; # character must be followed by an integer   
      0092D0 82 44 F6         [ 4] 3596 	call next_token
      0092D3 27 2D            [ 1] 3597 	cp a,#TK_INTGR 
      0092D5 5C A1            [ 1] 3598 	jreq 6$
      0092D7 20 25 0C         [ 2] 3599 	jp syntax_error 
      00140B                       3600 6$: ; set tab width
      0092DA CD               [ 1] 3601 	ld a,xl 
      0092DB 82 44            [ 1] 3602 	and a,#15 
      0092DD A1 5C 26         [ 1] 3603 	ld tab_width,a 
      0092E0 F1 B6            [ 2] 3604 	jra reset_comma 
      0092E1                       3605 7$:	
      001413                       3606 	_unget_token
      0092E1 CD 82 44 20 EC   [ 1]    1     mov in,in.saved
      0092E6 88 A6 5C         [ 4] 3607 	call relation 
      0092E9 CD 82            [ 1] 3608 	cp a,#TK_INTGR
      0092EB 44 84            [ 1] 3609 	jreq 8$
      00141F                       3610 	_unget_token
      0092ED A0 07 C7 00 0E   [ 1]    1     mov in,in.saved
      0092F2 72 5F 00         [ 2] 3611 	jp print_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0092F5 0D 90 AE         [ 4] 3612 8$: call print_int 
      0092F8 8B AE            [ 2] 3613 	jra reset_comma 
      00142C                       3614 print_exit:
      0092FA 72 B9            [ 1] 3615 	tnz (COMMA,sp)
      0092FC 00 0D            [ 1] 3616 	jrne 9$
      0092FE 90 F6            [ 1] 3617 	ld a,#CR 
      009300 20 DF A6         [ 4] 3618     call putc 
      001435                       3619 9$:	_drop VSIZE 
      009303 22 CD            [ 2]    1     addw sp,#VSIZE 
      009305 82               [ 4] 3620 	ret 
                                   3621 
      001438                       3622 print_type: 
                                   3623 
                                   3624 ;----------------------
                                   3625 ; 'save_context' and
                                   3626 ; 'rest_context' must be 
                                   3627 ; called at the same 
                                   3628 ; call stack depth 
                                   3629 ; i.e. SP must have the 
                                   3630 ; save value at  
                                   3631 ; entry point of both 
                                   3632 ; routine. 
                                   3633 ;---------------------
                           000004  3634 	CTXT_SIZE=4 ; size of saved data 
                                   3635 ;--------------------
                                   3636 ; save current BASIC
                                   3637 ; interpreter context 
                                   3638 ; on stack 
                                   3639 ;--------------------
      001438                       3640 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001438                       3641 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001438                       3642 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001438                       3643 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001438                       3644 save_context:
      009306 44 5C 81         [ 2] 3645 	ldw x,basicptr 
      009309 1F 03            [ 2] 3646 	ldw (BPTR,sp),x
      009309 1D 00 27         [ 1] 3647 	ld a,in 
      00930C 9F 44            [ 1] 3648 	ld (IN,sp),a
      00930E AB 41 81         [ 1] 3649 	ld a,count 
      009311 6B 06            [ 1] 3650 	ld (CNT,sp),a  
      009311 52               [ 4] 3651 	ret
                                   3652 
                                   3653 ;-----------------------
                                   3654 ; restore previously saved 
                                   3655 ; BASIC interpreter context 
                                   3656 ; from stack 
                                   3657 ;-------------------------
      001448                       3658 rest_context:
      009312 05 6B            [ 2] 3659 	ldw x,(BPTR,sp)
      009314 05 C6 00         [ 2] 3660 	ldw basicptr,x 
      009317 0B 6B            [ 1] 3661 	ld a,(IN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009319 01 C6 00         [ 1] 3662 	ld in,a
      00931C 25 6B            [ 1] 3663 	ld a,(CNT,sp)
      00931E 02 CF 00         [ 1] 3664 	ld count,a  
      009321 18               [ 4] 3665 	ret
                                   3666 
                                   3667 
                                   3668 
                                   3669 ;------------------------------------------
                                   3670 ; BASIC: INPUT [string]var[,[string]var]
                                   3671 ; input value in variables 
                                   3672 ; [string] optionally can be used as prompt 
                                   3673 ;-----------------------------------------
                           000001  3674 	CX_BPTR=1
                           000003  3675 	CX_IN=3
                           000004  3676 	CX_CNT=4
                           000005  3677 	SKIP=5
                           000006  3678 	VAR_ADDR=6
                           000007  3679 	VSIZE=7
      001458                       3680 input_var:
      001458                       3681 	_vars VSIZE 
      009322 FE 35            [ 2]    1     sub sp,#VSIZE 
      00145A                       3682 input_loop:
      009324 0A 00            [ 1] 3683 	clr (SKIP,sp)
      009326 0B 35 05         [ 4] 3684 	call next_token 
      009329 00 25            [ 1] 3685 	cp a,#TK_QSTR 
      00932B CD 89            [ 1] 3686 	jrne 1$ 
      00932D A4 A6 20         [ 4] 3687 	call puts 
      009330 CD 82            [ 1] 3688 	cpl (SKIP,sp)
      009332 44 72 5F         [ 4] 3689 	call next_token 
      009335 00 25            [ 1] 3690 1$: cp a,#TK_VAR  
      009337 AE 00            [ 1] 3691 	jreq 2$ 
      009339 03 9F 11         [ 2] 3692 	jp syntax_error
      00933C 05 2B            [ 2] 3693 2$:	ldw (VAR_ADDR,sp),x 
      00933E 03 CC            [ 1] 3694 	tnz (SKIP,sp)
      009340 94 10            [ 1] 3695 	jrne 21$ 
      009342 CD 12 89         [ 4] 3696 	call var_name 
      009342 72 D6 00         [ 4] 3697 	call putc   
      00147E                       3698 21$:
      009345 18 5C            [ 1] 3699 	ld a,#':
      009347 1F 03 72         [ 4] 3700 	call putc 
      00934A DE 00 18         [ 4] 3701 	call save_context 
      00934D 4D 2B 0A A1      [ 1] 3702 	clr count  
      009351 02 27 4B         [ 4] 3703 	call readln 
      009354 A1 03 27         [ 2] 3704 	ldw x,#tib 
      009357 57 20 64         [ 1] 3705 	push count
      00935A 4B 00            [ 1] 3706 	push #0 
      00935A A1 85 27         [ 2] 3707 	addw x,(1,sp)
      00935D 34               [ 2] 3708 	incw x 
      001499                       3709 	_drop 2 
      00935E A1 84            [ 2]    1     addw sp,#2 
      009360 27 38 A3 95      [ 1] 3710 	clr in 
      009364 44 26 14         [ 4] 3711 	call get_token
      009367 A6 27            [ 1] 3712 	cp a,#TK_INTGR
      009369 CD 82            [ 1] 3713 	jreq 3$ 
      00936B 44 1E 03         [ 4] 3714 	call rest_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00936E 1C 00 02         [ 2] 3715 	jp syntax_error
      009371 72 BB            [ 2] 3716 3$: ldw y,(VAR_ADDR,sp) 
      009373 00 18            [ 2] 3717 	ldw (y),x 
      009375 CD 82 57         [ 4] 3718 	call rest_context
      009378 CC 94 10         [ 4] 3719 	call next_token 
      00937B A1 09            [ 1] 3720 	cp a,#TK_COMMA 
      00937B A6 20            [ 1] 3721 	jreq input_loop 
      00937D CD 82            [ 1] 3722 	cp a,#TK_COLON 
      00937F 44 CD            [ 2] 3723     jrule input_exit 
      009381 8F 7D CD         [ 2] 3724 	jp syntax_error 
      0014C1                       3725 input_exit:
      0014C1                       3726 	_drop VSIZE 
      009384 92 B9            [ 2]    1     addw sp,#VSIZE 
      009386 A6               [ 4] 3727 	ret 
                                   3728 
                                   3729 
                                   3730 ;---------------------
                                   3731 ; BASIC: REMARK | ' 
                                   3732 ; skip comment to end of line 
                                   3733 ;---------------------- 
      0014C4                       3734 remark:
      009387 20 CD 82 44 01   [ 1] 3735 	mov in,count 
      00938B 81               [ 4] 3736  	ret 
                                   3737 
                                   3738 
                                   3739 ;---------------------
                                   3740 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3741 ; read in loop 'addr'  
                                   3742 ; apply & 'mask' to value 
                                   3743 ; loop while result==0.  
                                   3744 ; 'xor_mask' is used to 
                                   3745 ; invert the wait logic.
                                   3746 ; i.e. loop while not 0.
                                   3747 ;---------------------
                           000001  3748 	XMASK=1 
                           000002  3749 	MASK=2
                           000003  3750 	ADDR=3
                           000004  3751 	VSIZE=4
      0014CA                       3752 wait: 
      0014CA                       3753 	_vars VSIZE
      00938B 1E 03            [ 2]    1     sub sp,#VSIZE 
      00938D 1C 00            [ 1] 3754 	clr (XMASK,sp) 
      00938F 02 20 A8         [ 4] 3755 	call arg_list 
      009392 A1 02            [ 1] 3756 	cp a,#2
      009392 CD 93            [ 1] 3757 	jruge 0$
      009394 09 CD 82         [ 2] 3758 	jp syntax_error 
      009397 44 20            [ 1] 3759 0$:	cp a,#3
      009399 F1 04            [ 1] 3760 	jrult 1$
      00939A 85               [ 2] 3761 	popw x 
      00939A CD               [ 1] 3762 	ld a,xl
      00939B 89 A4            [ 1] 3763 	ld (XMASK,sp),a 
      00939D 20               [ 2] 3764 1$: popw x ; mask 
      00939E EC               [ 1] 3765 	ld a,xl 
      00939F 6B 02            [ 1] 3766 	ld (MASK,sp),a 
      00939F 1E               [ 2] 3767 	popw x ; address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093A0 03               [ 1] 3768 2$:	ld a,(x)
      0093A1 72 BB            [ 1] 3769 	and a,(MASK,sp)
      0093A3 00 18            [ 1] 3770 	xor a,(XMASK,sp)
      0093A5 CD 92            [ 1] 3771 	jreq 2$ 
      0014EC                       3772 	_drop VSIZE 
      0093A7 CD 72            [ 2]    1     addw sp,#VSIZE 
      0093A9 B0               [ 4] 3773 	ret 
                                   3774 
                                   3775 ;---------------------
                                   3776 ; BASIC: BSET addr,mask
                                   3777 ; set bits at 'addr' corresponding 
                                   3778 ; to those of 'mask' that are at 1.
                                   3779 ; arguments:
                                   3780 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3781 ;   mask        mask|addr
                                   3782 ; output:
                                   3783 ;	none 
                                   3784 ;--------------------------
      0014EF                       3785 bit_set:
      0093AA 00 18 CC         [ 4] 3786 	call arg_list 
      0093AD 93 3A            [ 1] 3787 	cp a,#2	 
      0093AF 27 03            [ 1] 3788 	jreq 1$ 
      0093AF A6 5C CD         [ 2] 3789 	jp syntax_error
      0014F9                       3790 1$: 
      0093B2 82               [ 2] 3791 	popw x ; mask 
      0093B3 44               [ 1] 3792 	ld a,xl 
      0093B4 9E               [ 2] 3793 	popw x ; addr  
      0093B5 CD               [ 1] 3794 	or a,(x)
      0093B6 82               [ 1] 3795 	ld (x),a
      0093B7 44               [ 4] 3796 	ret 
                                   3797 
                                   3798 ;---------------------
                                   3799 ; BASIC: BRES addr,mask
                                   3800 ; reset bits at 'addr' corresponding 
                                   3801 ; to those of 'mask' that are at 1.
                                   3802 ; arguments:
                                   3803 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3804 ;   mask	    ~mask&*addr  
                                   3805 ; output:
                                   3806 ;	none 
                                   3807 ;--------------------------
      0014FF                       3808 bit_reset:
      0093B8 1E 03 5C         [ 4] 3809 	call arg_list 
      0093BB CC 93            [ 1] 3810 	cp a,#2  
      0093BD 3A A1            [ 1] 3811 	jreq 1$ 
      0093BF 01 26 0A         [ 2] 3812 	jp syntax_error
      001509                       3813 1$: 
      0093C2 A6               [ 2] 3814 	popw x ; mask 
      0093C3 3A               [ 1] 3815 	ld a,xl 
      0093C4 43               [ 1] 3816 	cpl a 
      0093C4 CD               [ 2] 3817 	popw x ; addr  
      0093C5 82               [ 1] 3818 	and a,(x)
      0093C6 44               [ 1] 3819 	ld (x),a 
      0093C7 81               [ 4] 3820 	ret 
                                   3821 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3822 ;---------------------
                                   3823 ; BASIC: BTOGL addr,mask
                                   3824 ; toggle bits at 'addr' corresponding 
                                   3825 ; to those of 'mask' that are at 1.
                                   3826 ; arguments:
                                   3827 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3828 ;   mask	    mask^*addr  
                                   3829 ; output:
                                   3830 ;	none 
                                   3831 ;--------------------------
      001510                       3832 bit_toggle:
      0093C7 1E 03 CC         [ 4] 3833 	call arg_list 
      0093CA 93 3A            [ 1] 3834 	cp a,#2 
      0093CC 27 03            [ 1] 3835 	jreq 1$ 
      0093CC A1 0A 22         [ 2] 3836 	jp syntax_error
      0093CF 0E               [ 2] 3837 1$: popw x ; mask 
      0093D0 A0               [ 1] 3838 	ld a,xl 
      0093D1 06               [ 2] 3839 	popw x ; addr  
      0093D2 90               [ 1] 3840 	xor a,(x)
      0093D3 5F               [ 1] 3841 	ld (x),a 
      0093D4 90               [ 4] 3842 	ret 
                                   3843 
                                   3844 
                                   3845 ;---------------------
                                   3846 ; BASIC: BTEST(addr,bit)
                                   3847 ; return bit value at 'addr' 
                                   3848 ; bit is in range {0..7}.
                                   3849 ; arguments:
                                   3850 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3851 ;   bit 	    bit position {0..7}  
                                   3852 ; output:
                                   3853 ;	none 
                                   3854 ;--------------------------
      001520                       3855 bit_test:
      0093D5 97 72 A9         [ 4] 3856 	call func_args 
      0093D8 94 22            [ 1] 3857 	cp a,#2
      0093DA 90 F6            [ 1] 3858 	jreq 0$
      0093DC 20 E6 95         [ 2] 3859 	jp syntax_error
      0093DE                       3860 0$:	
      0093DE A1               [ 2] 3861 	popw x 
      0093DF 11               [ 1] 3862 	ld a,xl 
      0093E0 22 0E            [ 1] 3863 	and a,#7
      0093E2 A0               [ 1] 3864 	push a   
      0093E3 10 90            [ 1] 3865 	ld a,#1 
      0093E5 5F 90            [ 1] 3866 1$: tnz (1,sp)
      0093E7 97 72            [ 1] 3867 	jreq 2$
      0093E9 A9               [ 1] 3868 	sll a 
      0093EA 94 27            [ 1] 3869 	dec (1,sp)
      0093EC 90 F6            [ 2] 3870 	jra 1$
      00153A                       3871 2$: _drop 1 
      0093EE 20 D4            [ 2]    1     addw sp,#1 
      0093F0 85               [ 2] 3872 	popw x 
      0093F0 A1               [ 1] 3873 	and a,(x)
      0093F1 22 22            [ 1] 3874 	jreq 3$
      0093F3 0E A0            [ 1] 3875 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0093F5 20               [ 1] 3876 3$:	clrw x 
      0093F6 90               [ 1] 3877 	ld xl,a 
      0093F7 5F 90            [ 1] 3878 	ld a,#TK_INTGR
      0093F9 97               [ 4] 3879 	ret
                                   3880 
                                   3881 
                                   3882 ;--------------------
                                   3883 ; BASIC: POKE addr,byte
                                   3884 ; put a byte at addr 
                                   3885 ;--------------------
      001547                       3886 poke:
      0093FA 72 A9 94         [ 4] 3887 	call arg_list 
      0093FD 29 90            [ 1] 3888 	cp a,#2
      0093FF F6 20            [ 1] 3889 	jreq 1$
      009401 C2 07 95         [ 2] 3890 	jp syntax_error
      009402                       3891 1$:	
      009402 A0               [ 2] 3892 	popw x  
      009403 31               [ 1] 3893     ld a,xl 
      009404 48               [ 2] 3894 	popw x 
      009405 5F               [ 1] 3895 	ld (x),a 
      009406 97               [ 4] 3896 	ret 
                                   3897 
                                   3898 ;-----------------------
                                   3899 ; BASIC: PEEK(addr)
                                   3900 ; get the byte at addr 
                                   3901 ; input:
                                   3902 ;	none 
                                   3903 ; output:
                                   3904 ;	X 		value 
                                   3905 ;-----------------------
      001556                       3906 peek:
      009407 1C 94 2C         [ 4] 3907 	call func_args
      00940A FE CD            [ 1] 3908 	cp a,#1
      00940C 82 57            [ 1] 3909 	jreq 1$
      00940E 20 B7 95         [ 2] 3910 	jp syntax_error
      009410 85               [ 2] 3911 1$:	popw x 
      009410 A6               [ 1] 3912 	ld a,(x)
      009411 0D               [ 1] 3913 	clrw x 
      009412 CD               [ 1] 3914 	ld xl,a 
      009413 82 44            [ 1] 3915 	ld a,#TK_INTGR
      009415 7B               [ 4] 3916 	ret 
                                   3917 
                                   3918 ;----------------------------
                                   3919 ; BASIC: XPEEK(page,addr)
                                   3920 ; read extended memory byte
                                   3921 ; page in range {0,1,2}
                                   3922 ;----------------------------
      001567                       3923 xpeek:
      009416 02 C7 00         [ 4] 3924 	call func_args 
      009419 25 7B            [ 1] 3925 	cp a,#2 
      00941B 01 C7            [ 1] 3926 	jreq 1$
      00941D 00 0B 5B         [ 2] 3927 	jp syntax_error
      001571                       3928 1$: 
      009420 05               [ 2] 3929 	popw x  
      009421 81 40 28         [ 2] 3930 	ldw farptr+1,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009424 29               [ 2] 3931 	popw x 
      009425 2C               [ 1] 3932 	ld a,xl 
      009426 23 2B 2D         [ 1] 3933 	ld farptr,a 
      009429 2A               [ 1] 3934 	clrw x
      00942A 2F 25 94 38      [ 5] 3935 	ldf a,[farptr]
      00942E 94               [ 1] 3936 	ld xl,a 
      00942F 3A 94            [ 1] 3937 	ld a,#TK_INTGR 
      009431 3C               [ 4] 3938 	ret 
                                   3939 
                                   3940 ;---------------------------
                                   3941 ; BASIC IF expr : instructions
                                   3942 ; evaluate expr and if true 
                                   3943 ; execute instructions on same line. 
                                   3944 ;----------------------------
      001583                       3945 if: 
      009432 94 3F 94         [ 4] 3946 	call relation 
      009435 41 94            [ 1] 3947 	cp a,#TK_INTGR
      009437 44 3E            [ 1] 3948 	jreq 1$ 
      009439 00 3D 00         [ 2] 3949 	jp syntax_error
      00943C 3E               [ 1] 3950 1$:	clr a 
      00943D 3D               [ 2] 3951 	tnzw x 
      00943E 00 3C            [ 1] 3952 	jrne 9$  
                                   3953 ;skip to next line
      009440 00 3C 3D 00 3C   [ 1] 3954 	mov in,count
      009445 3E               [ 4] 3955 9$:	ret 
                                   3956 
                                   3957 ;------------------------
                                   3958 ; BASIC: FOR var=expr 
                                   3959 ; set variable to expression 
                                   3960 ; leave variable address 
                                   3961 ; on stack and set
                                   3962 ; FLOOP bit in 'flags'
                                   3963 ;-----------------
                           000001  3964 	RETL1=1 ; return address  
                           000003  3965 	FSTEP=3  ; variable increment
                           000005  3966 	LIMIT=5 ; loop limit 
                           000007  3967 	CVAR=7   ; control variable 
                           000009  3968 	INW=9   ;  in.w saved
                           00000B  3969 	BPTR=11 ; baseptr saved
                           00000A  3970 	VSIZE=10  
      001597                       3971 for: ; { -- var_addr }
      009446 00               [ 2] 3972 	popw x ; call return address 
      009447                       3973 	_vars VSIZE 
      009447 4B 00            [ 2]    1     sub sp,#VSIZE 
      009449 89               [ 2] 3974 	pushw x  ; RETL1 
      009449 0F 01            [ 1] 3975 	ld a,#TK_VAR 
      00944B CD 0F 7C         [ 4] 3976 	call expect
      00944B CD 89            [ 2] 3977 	ldw (CVAR,sp),x  ; control variable 
      00944D 07 A1 02         [ 4] 3978 	call let_var 
      009450 25 5A A1 02      [ 1] 3979 	bset flags,#FLOOP 
                                   3980 ; open space on stack for loop data 
      009454 27               [ 1] 3981 	clrw x 
      009455 12 A1            [ 2] 3982 	ldw (BPTR,sp),x 
      009457 03 27            [ 2] 3983 	ldw (INW,sp),x 
      009459 13 A1 82         [ 4] 3984 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00945C 27 15            [ 1] 3985 	cp a,#TK_CMD 
      00945E A1 09            [ 1] 3986 	jreq 1$
      009460 27 18 A1         [ 2] 3987 	jp syntax_error
      0015B8                       3988 1$:  
      009463 0A 27 1B         [ 2] 3989 	cpw x,#to 
      009466 20 2B            [ 1] 3990 	jreq to
      009468 CC 07 95         [ 2] 3991 	jp syntax_error 
                                   3992 
                                   3993 ;-----------------------------------
                                   3994 ; BASIC: TO expr 
                                   3995 ; second part of FOR loop initilization
                                   3996 ; leave limit on stack and set 
                                   3997 ; FTO bit in 'flags'
                                   3998 ;-----------------------------------
      0015C0                       3999 to: ; { var_addr -- var_addr limit step }
      009468 CD 82 57 20 DC   [ 2] 4000 	btjt flags,#FLOOP,1$
      00946D CC 07 95         [ 2] 4001 	jp syntax_error
      00946D 9F CD 82         [ 4] 4002 1$: call relation  
      009470 44 20            [ 1] 4003 	cp a,#TK_INTGR 
      009472 D6 03            [ 1] 4004 	jreq 2$ 
      009473 CC 07 95         [ 2] 4005 	jp syntax_error
      009473 FD 9F            [ 2] 4006 2$: ldw (LIMIT,sp),x
                                   4007 ;	ldw x,in.w 
      009475 CD 82 44         [ 4] 4008 	call next_token
      009478 20 CF            [ 1] 4009 	cp a,#TK_NONE  
      00947A 27 0E            [ 1] 4010 	jreq 4$ 
      00947A A6 FF            [ 1] 4011 	cp a,#TK_CMD
      00947C 6B 01            [ 1] 4012 	jrne 3$
      00947E CC 94 4B         [ 2] 4013 	cpw x,#step 
      009481 27 0C            [ 1] 4014 	jreq step
      0015E4                       4015 3$:	
      0015E4                       4016 	_unget_token   	 
      009481 CD 89 07 A1 84   [ 1]    1     mov in,in.saved
      0015E9                       4017 4$:	
      009486 27 03 CC         [ 2] 4018 	ldw x,#1   ; default step  
      009489 88 15            [ 2] 4019 	ldw (FSTEP,sp),x 
      00948B 20 14            [ 2] 4020 	jra store_loop_addr 
                                   4021 
                                   4022 
                                   4023 ;----------------------------------
                                   4024 ; BASIC: STEP expr 
                                   4025 ; optional third par of FOR loop
                                   4026 ; initialization. 	
                                   4027 ;------------------------------------
      0015F0                       4028 step: ; {var limit -- var limit step}
      00948B 9F A4 0F C7 00   [ 2] 4029 	btjt flags,#FLOOP,1$
      009490 25 20 B6         [ 2] 4030 	jp syntax_error
      009493 CD 10 CB         [ 4] 4031 1$: call relation
      009493 55 00            [ 1] 4032 	cp a,#TK_INTGR
      009495 03 00            [ 1] 4033 	jreq 2$
      009497 02 CD 91         [ 2] 4034 	jp syntax_error
      00949A 4B A1            [ 2] 4035 2$:	ldw (FSTEP,sp),x ; step
                                   4036 ; leave loop back entry point on cstack 
                                   4037 ; cstack is 1 call deep from interpreter
      001604                       4038 store_loop_addr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00949C 84 27 08         [ 2] 4039 	ldw x,basicptr  
      00949F 55 00            [ 2] 4040 	ldw (BPTR,sp),x 
      0094A1 03 00 02         [ 2] 4041 	ldw x,in.w 
      0094A4 CC 94            [ 2] 4042 	ldw (INW,sp),x   
      0094A6 AC CD 89 A4      [ 1] 4043 	bres flags,#FLOOP 
      0094AA 20 9D 00 20      [ 1] 4044 	inc loop_depth  
      0094AC 81               [ 4] 4045 	ret 
                                   4046 
                                   4047 ;--------------------------------
                                   4048 ; BASIC: NEXT var 
                                   4049 ; FOR loop control 
                                   4050 ; increment variable with step 
                                   4051 ; and compare with limit 
                                   4052 ; loop if threshold not crossed.
                                   4053 ; else stack. 
                                   4054 ; and decrement 'loop_depth' 
                                   4055 ;--------------------------------
      001617                       4056 next: ; {var limit step retl1 -- [var limit step ] }
      0094AC 0D 01 26 05      [ 1] 4057 	tnz loop_depth 
      0094B0 A6 0D            [ 1] 4058 	jrne 1$ 
      0094B2 CD 82 44         [ 2] 4059 	jp syntax_error 
      001620                       4060 1$: 
      0094B5 5B 01            [ 1] 4061 	ld a,#TK_VAR 
      0094B7 81 0F 7C         [ 4] 4062 	call expect
                                   4063 ; check for good variable after NEXT 	 
      0094B8 13 07            [ 2] 4064 	cpw x,(CVAR,sp)
      0094B8 27 03            [ 1] 4065 	jreq 2$  
      0094B8 CE 00 05         [ 2] 4066 	jp syntax_error ; not the good one 
      00162C                       4067 2$: ; increment variable 
      0094BB 1F               [ 2] 4068 	ldw x,(x)  ; get var value 
      0094BC 03 C6 00         [ 2] 4069 	addw x,(FSTEP,sp) ; var+step 
      0094BF 02 6B            [ 2] 4070 	ldw y,(CVAR,sp)
      0094C1 05 C6            [ 2] 4071 	ldw (y),x ; save var new value 
                                   4072 ; check sign of STEP  
      0094C3 00 04            [ 1] 4073 	ld a,#0x80
      0094C5 6B 06            [ 1] 4074 	bcp a,(FSTEP,sp)
      0094C7 81 06            [ 1] 4075 	jrpl 4$
                                   4076 ;negative step 
      0094C8 13 05            [ 2] 4077 	cpw x,(LIMIT,sp)
      0094C8 1E 03            [ 1] 4078 	jrslt loop_done
      0094CA CF 00            [ 2] 4079 	jra loop_back 
      001640                       4080 4$: ; positive step
      0094CC 05 7B            [ 2] 4081 	cpw x,(LIMIT,sp)
      0094CE 05 C7            [ 1] 4082 	jrsgt loop_done
      001644                       4083 loop_back:
      0094D0 00 02            [ 2] 4084 	ldw x,(BPTR,sp)
      0094D2 7B 06 C7         [ 2] 4085 	ldw basicptr,x 
      0094D5 00 04 81 23 05   [ 2] 4086 	btjf flags,#FRUN,1$ 
      0094D8 E6 02            [ 1] 4087 	ld a,(2,x)
      0094D8 52 07 03         [ 1] 4088 	ld count,a
      0094DA 1E 09            [ 2] 4089 1$:	ldw x,(INW,sp)
      0094DA 0F 05 CD         [ 2] 4090 	ldw in.w,x 
      0094DD 89               [ 4] 4091 	ret 
      001659                       4092 loop_done:
                                   4093 	; remove loop data from stack  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094DE 07               [ 2] 4094 	popw x
      00165A                       4095 	_drop VSIZE 
      0094DF A1 02            [ 2]    1     addw sp,#VSIZE 
      0094E1 26 08 CD 82      [ 1] 4096 	dec loop_depth 
                                   4097 ;	pushw x 
                                   4098 ;	ret 
      0094E5 57               [ 2] 4099 	jp (x)
                                   4100 
                                   4101 ;----------------------------
                                   4102 ; called by goto/gosub
                                   4103 ; to get target line number 
                                   4104 ;---------------------------
      001661                       4105 get_target_line:
      0094E6 03 05 CD         [ 4] 4106 	call relation 
      0094E9 89 07            [ 1] 4107 	cp a,#TK_INTGR
      0094EB A1 85            [ 1] 4108 	jreq 1$
      0094ED 27 03 CC         [ 2] 4109 	jp syntax_error
      0094F0 88 15 1F         [ 4] 4110 1$:	call search_lineno  
      0094F3 06               [ 2] 4111 	tnzw x 
      0094F4 0D 05            [ 1] 4112 	jrne 2$ 
      0094F6 26 06            [ 1] 4113 	ld a,#ERR_NO_LINE 
      0094F8 CD 93 09         [ 2] 4114 	jp tb_error 
      0094FB CD               [ 4] 4115 2$:	ret 
                                   4116 
                                   4117 ;------------------------
                                   4118 ; BASIC: GOTO line# 
                                   4119 ; jump to line# 
                                   4120 ; here cstack is 2 call deep from interpreter 
                                   4121 ;------------------------
      001677                       4122 goto:
      0094FC 82 44 00 23 06   [ 2] 4123 	btjt flags,#FRUN,0$ 
      0094FE A6 06            [ 1] 4124 	ld a,#ERR_RUN_ONLY
      0094FE A6 3A CD         [ 2] 4125 	jp tb_error 
      009501 82               [ 4] 4126 	ret 
      009502 44 CD 94         [ 4] 4127 0$:	call get_target_line
      001685                       4128 jp_to_target:
      009505 B8 72 5F         [ 2] 4129 	ldw basicptr,x 
      009508 00 04            [ 1] 4130 	ld a,(2,x)
      00950A CD 8A D5         [ 1] 4131 	ld count,a 
      00950D AE 16 90 3B      [ 1] 4132 	mov in,#3 
      009511 00               [ 4] 4133 	ret 
                                   4134 
                                   4135 
                                   4136 ;--------------------
                                   4137 ; BASIC: GOSUB line#
                                   4138 ; basic subroutine call
                                   4139 ; actual line# and basicptr 
                                   4140 ; are saved on cstack
                                   4141 ; here cstack is 2 call deep from interpreter 
                                   4142 ;--------------------
                           000003  4143 	RET_ADDR=3
                           000005  4144 	RET_INW=5
                           000004  4145 	VSIZE=4  
      001692                       4146 gosub:
      009512 04 4B 00 72 FB   [ 2] 4147 	btjt flags,#FRUN,0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009517 01 5C            [ 1] 4148 	ld a,#ERR_RUN_ONLY
      009519 5B 02 72         [ 2] 4149 	jp tb_error 
      00951C 5F               [ 4] 4150 	ret 
      00951D 00               [ 2] 4151 0$:	popw x 
      00169E                       4152 	_vars VSIZE  
      00951E 02 CD            [ 2]    1     sub sp,#VSIZE 
      009520 8C               [ 2] 4153 	pushw x 
      009521 8A A1 84         [ 2] 4154 	ldw x,basicptr
      009524 27 06            [ 2] 4155 	ldw (RET_ADDR,sp),x 
      009526 CD 94 C8         [ 4] 4156 	call get_target_line  
      009529 CC               [ 2] 4157 	pushw x 
      00952A 88 15 16         [ 2] 4158 	ldw x,in.w 
      00952D 06 90            [ 2] 4159 	ldw (RET_INW+2,sp),x
      00952F FF               [ 2] 4160 	popw x 
      009530 CD 94            [ 2] 4161 	jra jp_to_target
                                   4162 
                                   4163 ;------------------------
                                   4164 ; BASIC: RETURN 
                                   4165 ; exit from a subroutine 
                                   4166 ; 
                                   4167 ;------------------------
      0016B2                       4168 return:
      009532 C8 CD 89 07 A1   [ 2] 4169 	btjt flags,#FRUN,0$ 
      009537 09 27            [ 1] 4170 	ld a,#ERR_RUN_ONLY
      009539 A0 A1 01         [ 2] 4171 	jp tb_error 
      0016BC                       4172 0$:	
      00953C 23 03            [ 2] 4173 	ldw x,(RET_ADDR,sp) 
      00953E CC 88 15         [ 2] 4174 	ldw basicptr,x
      009541 E6 02            [ 1] 4175 	ld a,(2,x)
      009541 5B 07 81         [ 1] 4176 	ld count,a  
      009544 1E 05            [ 2] 4177 	ldw x,(RET_INW,sp)
      009544 55 00 04         [ 2] 4178 	ldw in.w,x 
      009547 00               [ 2] 4179 	popw x 
      0016CC                       4180 	_drop VSIZE 
      009548 02 81            [ 2]    1     addw sp,#VSIZE 
      00954A 89               [ 2] 4181 	pushw x
      00954A 52               [ 4] 4182 	ret  
                                   4183 
                                   4184 
                                   4185 ;----------------------------------
                                   4186 ; BASIC: RUN
                                   4187 ; run BASIC program in RAM
                                   4188 ;----------------------------------- 
      0016D0                       4189 run: 
      00954B 04 0F 01 CD 90   [ 2] 4190 	btjf flags,#FRUN,0$  
      009550 0E               [ 1] 4191 	clr a 
      009551 A1               [ 4] 4192 	ret
      0016D7                       4193 0$: 
      009552 02 24 03 CC 88   [ 2] 4194 	btjf flags,#FBREAK,1$
      0016DC                       4195 	_drop 2 
      009557 15 A1            [ 2]    1     addw sp,#2 
      009559 03 25 04         [ 4] 4196 	call rest_context
      0016E1                       4197 	_drop CTXT_SIZE 
      00955C 85 9F            [ 2]    1     addw sp,#CTXT_SIZE 
      00955E 6B 01 85 9F      [ 1] 4198 	bres flags,#FBREAK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009562 6B 02 85 F6      [ 1] 4199 	bset flags,#FRUN 
      009566 14 02 18         [ 2] 4200 	jp interpreter 
      009569 01 27 F9         [ 2] 4201 1$:	ldw x,txtbgn
      00956C 5B 04 81         [ 2] 4202 	cpw x,txtend 
      00956F 2B 05            [ 1] 4203 	jrmi run_it 
      00956F CD 90            [ 1] 4204 	ld a,#ERR_NO_PROG
      009571 0E A1 02         [ 2] 4205 	jp tb_error
                                   4206 
      0016FB                       4207 run_it:	 
      009574 27 03 CC         [ 4] 4208     call ubound 
      0016FE                       4209 	_drop 2 ; drop return address 
      009577 88 15            [ 2]    1     addw sp,#2 
                                   4210 ; clear data pointer 
      009579 5F               [ 1] 4211 	clrw x 
      009579 85 9F 85         [ 2] 4212 	ldw data_ptr,x 
      00957C FA F7 81 08      [ 1] 4213 	clr data_ofs 
      00957F 72 5F 00 09      [ 1] 4214 	clr data_len 
                                   4215 ; initialize BASIC pointer 
      00957F CD 90 0E         [ 2] 4216 	ldw x,txtbgn 
      009582 A1 02 27         [ 2] 4217 	ldw basicptr,x 
      009585 03 CC            [ 1] 4218 	ld a,(2,x)
      009587 88 15 03         [ 1] 4219 	ld count,a
      009589 35 03 00 01      [ 1] 4220 	mov in,#3	
      009589 85 9F 43 85      [ 1] 4221 	bset flags,#FRUN 
      00958D F4 F7 81         [ 2] 4222 	jp interpreter 
                                   4223 
                                   4224 
                                   4225 ;----------------------
                                   4226 ; BASIC: END
                                   4227 ; end running program
                                   4228 ;---------------------- 
      009590                       4229 cmd_end: 
                                   4230 ; clean stack 
      009590 CD 90 0E         [ 2] 4231 	ldw x,#STACK_EMPTY
      009593 A1               [ 1] 4232 	ldw sp,x 
      009594 02 27 03         [ 2] 4233 	jp warm_start
                                   4234 
                                   4235 
                                   4236 ;-----------------------
                                   4237 ; BASIC: TONE expr1,expr2
                                   4238 ; used TIMER2 channel 1
                                   4239 ; to produce a tone 
                                   4240 ; arguments:
                                   4241 ;    expr1   frequency 
                                   4242 ;    expr2   duration msec.
                                   4243 ;---------------------------
      001729                       4244 tone:
      009597 CC 88 15         [ 4] 4245 	call arg_list 
      00959A 85 9F            [ 1] 4246 	cp a,#2 
      00959C 85 F8            [ 1] 4247 	jreq 1$
      00959E F7 81 95         [ 2] 4248 	jp syntax_error 
      0095A0                       4249 1$: 
      0095A0 CD               [ 2] 4250 	popw x ; duration
      0095A1 90 09            [ 2] 4251 	popw y ; frequency 
      001736                       4252 beep:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095A3 A1               [ 2] 4253 	pushw x 
      0095A4 02 27 03         [ 2] 4254 	ldw x,#TIM2_CLK_FREQ
      0095A7 CC               [ 2] 4255 	divw x,y 
                                   4256 ; round to nearest integer 
      0095A8 88 15 7A 12      [ 2] 4257 	cpw y,#TIM2_CLK_FREQ/2
      0095AA 2B 01            [ 1] 4258 	jrmi 2$
      0095AA 85               [ 2] 4259 	incw x 
      001742                       4260 2$:	 
      0095AB 9F               [ 1] 4261 	ld a,xh 
      0095AC A4 07 88         [ 1] 4262 	ld TIM2_ARRH,a 
      0095AF A6               [ 1] 4263 	ld a,xl 
      0095B0 01 0D 01         [ 1] 4264 	ld TIM2_ARRL,a 
                                   4265 ; 50% duty cycle 
      0095B3 27               [ 1] 4266 	ccf 
      0095B4 05               [ 2] 4267 	rrcw x 
      0095B5 48               [ 1] 4268 	ld a,xh 
      0095B6 0A 01 20         [ 1] 4269 	ld TIM2_CCR1H,a 
      0095B9 F7               [ 1] 4270 	ld a,xl
      0095BA 5B 01 85         [ 1] 4271 	ld TIM2_CCR1L,a
      0095BD F4 27 02 A6      [ 1] 4272 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0095C1 01 5F 97 A6      [ 1] 4273 	bset TIM2_CR1,#TIM2_CR1_CEN
      0095C5 84 81 53 04      [ 1] 4274 	bset TIM2_EGR,#TIM2_EGR_UG
      0095C7 85               [ 2] 4275 	popw x 
      0095C7 CD 90 0E         [ 2] 4276 	ldw timer,x 
      0095CA A1 02 27         [ 2] 4277 3$: ldw x,timer 	
      0095CD 03 CC            [ 1] 4278 	jrne 3$ 
      0095CF 88 15 53 08      [ 1] 4279 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0095D1 72 11 53 00      [ 1] 4280 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0095D1 85               [ 4] 4281 	ret 
                                   4282 
                                   4283 ;-------------------------------
                                   4284 ; BASIC: ADCON 0|1 [,divisor]  
                                   4285 ; disable/enanble ADC 
                                   4286 ;-------------------------------
                           000003  4287 	ONOFF=3 
                           000001  4288 	DIVSOR=1
                           000004  4289 	VSIZE=4 
      001772                       4290 power_adc:
      0095D2 9F 85 F7         [ 4] 4291 	call arg_list 
      0095D5 81 02            [ 1] 4292 	cp a,#2	
      0095D6 27 0B            [ 1] 4293 	jreq 1$
      0095D6 CD 90            [ 1] 4294 	cp a,#1 
      0095D8 09 A1            [ 1] 4295 	jreq 0$ 
      0095DA 01 27 03         [ 2] 4296 	jp syntax_error 
      0095DD CC 88 15         [ 2] 4297 0$: ldw x,#0
      0095E0 85               [ 2] 4298 	pushw x  ; divisor 
      0095E1 F6 5F            [ 2] 4299 1$: ldw x,(ONOFF,sp)
      0095E3 97               [ 2] 4300 	tnzw x 
      0095E4 A6 84            [ 1] 4301 	jreq 2$ 
      0095E6 81 01            [ 2] 4302 	ldw x,(DIVSOR,sp) ; divisor 
      0095E7 9F               [ 1] 4303 	ld a,xl
      0095E7 CD 90            [ 1] 4304 	and a,#7
      0095E9 09               [ 1] 4305 	swap a 
      0095EA A1 02 27         [ 1] 4306 	ld ADC_CR1,a
      0095ED 03 CC 88 15      [ 1] 4307 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095F1 72 10 54 01      [ 1] 4308 	bset ADC_CR1,#ADC_CR1_ADON 
      00179A                       4309 	_usec_dly 7 
      0095F1 85 CF 00         [ 2]    1     ldw x,#(16*7-2)/4
      0095F4 18               [ 2]    2     decw x
      0095F5 85               [ 1]    3     nop 
      0095F6 9F C7            [ 1]    4     jrne .-4
      0095F8 00 17            [ 2] 4310 	jra 3$
      0095FA 5F 92 BC 00      [ 1] 4311 2$: bres ADC_CR1,#ADC_CR1_ADON
      0095FE 17 97 A6 84      [ 1] 4312 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0017AB                       4313 3$:	_drop VSIZE 
      009602 81 04            [ 2]    1     addw sp,#VSIZE 
      009603 81               [ 4] 4314 	ret
                                   4315 
                                   4316 ;-----------------------------
                                   4317 ; BASIC: ADCREAD (channel)
                                   4318 ; read adc channel {0..5}
                                   4319 ; output:
                                   4320 ;   A 		TK_INTGR 
                                   4321 ;   X 		value 
                                   4322 ;-----------------------------
      0017AE                       4323 analog_read:
      009603 CD 91 4B         [ 4] 4324 	call func_args 
      009606 A1 84            [ 1] 4325 	cp a,#1 
      009608 27 03            [ 1] 4326 	jreq 1$
      00960A CC 88 15         [ 2] 4327 	jp syntax_error
      00960D 4F               [ 2] 4328 1$: popw x 
      00960E 5D 26 05         [ 2] 4329 	cpw x,#5 
      009611 55 00            [ 2] 4330 	jrule 2$
      009613 04 00            [ 1] 4331 	ld a,#ERR_BAD_VALUE
      009615 02 81 97         [ 2] 4332 	jp tb_error 
      009617 9F               [ 1] 4333 2$: ld a,xl
      009617 85 52 0A         [ 1] 4334 	ld acc8,a 
      00961A 89 A6            [ 1] 4335 	ld a,#5
      00961C 85 CD 8F         [ 1] 4336 	sub a,acc8 
      00961F FC 1F 07         [ 1] 4337 	ld ADC_CSR,a
      009622 CD 92 2A 72      [ 1] 4338 	bset ADC_CR2,#ADC_CR2_ALIGN
      009626 14 00 24 5F      [ 1] 4339 	bset ADC_CR1,#ADC_CR1_ADON
      00962A 1F 0B 1F 09 CD   [ 2] 4340 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00962F 89 07 A1         [ 2] 4341 	ldw x,ADC_DRH
      009632 80 27            [ 1] 4342 	ld a,#TK_INTGR
      009634 03               [ 4] 4343 	ret 
                                   4344 
                                   4345 ;-----------------------
                                   4346 ; BASIC: DREAD(pin)
                                   4347 ; Arduino pins 
                                   4348 ; read state of a digital pin 
                                   4349 ; pin# {0..15}
                                   4350 ; output:
                                   4351 ;    A 		TK_INTGR
                                   4352 ;    X      0|1 
                                   4353 ;-------------------------
                           000001  4354 	PINNO=1
                           000001  4355 	VSIZE=1
      0017E2                       4356 digital_read:
      0017E2                       4357 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009635 CC 88            [ 2]    1     sub sp,#VSIZE 
      009637 15 0F 89         [ 4] 4358 	call func_args
      009638 A1 01            [ 1] 4359 	cp a,#1
      009638 A3 96            [ 1] 4360 	jreq 1$
      00963A 40 27 03         [ 2] 4361 	jp syntax_error
      00963D CC               [ 2] 4362 1$: popw x 
      00963E 88 15 0F         [ 2] 4363 	cpw x,#15 
      009640 23 05            [ 2] 4364 	jrule 2$
      009640 72 04            [ 1] 4365 	ld a,#ERR_BAD_VALUE
      009642 00 24 03         [ 2] 4366 	jp tb_error 
      009645 CC 88 15         [ 4] 4367 2$:	call select_pin 
      009648 CD 91            [ 1] 4368 	ld (PINNO,sp),a
      00964A 4B A1            [ 1] 4369 	ld a,(GPIO_IDR,x)
      00964C 84 27            [ 1] 4370 	tnz (PINNO,sp)
      00964E 03 CC            [ 1] 4371 	jreq 8$
      009650 88               [ 1] 4372 3$: srl a 
      009651 15 1F            [ 1] 4373 	dec (PINNO,sp)
      009653 05 CD            [ 1] 4374 	jrne 3$ 
      009655 89 07            [ 1] 4375 8$: and a,#1 
      009657 A1               [ 1] 4376 	clrw x 
      009658 00               [ 1] 4377 	ld xl,a 
      009659 27 0E            [ 1] 4378 	ld a,#TK_INTGR
      00180F                       4379 	_drop VSIZE
      00965B A1 80            [ 2]    1     addw sp,#VSIZE 
      00965D 26               [ 4] 4380 	ret
                                   4381 
                                   4382 ;-----------------------
                                   4383 ; BASIC: DWRITE pin,0|1
                                   4384 ; Arduino pins 
                                   4385 ; write to a digital pin 
                                   4386 ; pin# {0..15}
                                   4387 ; output:
                                   4388 ;    A 		TK_INTGR
                                   4389 ;    X      0|1 
                                   4390 ;-------------------------
                           000001  4391 	PINNO=1
                           000002  4392 	PINVAL=2
                           000002  4393 	VSIZE=2
      001812                       4394 digital_write:
      001812                       4395 	_vars VSIZE 
      00965E 05 A3            [ 2]    1     sub sp,#VSIZE 
      009660 96 70 27         [ 4] 4396 	call arg_list  
      009663 0C 02            [ 1] 4397 	cp a,#2 
      009664 27 03            [ 1] 4398 	jreq 1$
      009664 55 00 03         [ 2] 4399 	jp syntax_error
      009667 00               [ 2] 4400 1$: popw x 
      009668 02               [ 1] 4401 	ld a,xl 
      009669 6B 02            [ 1] 4402 	ld (PINVAL,sp),a
      009669 AE               [ 2] 4403 	popw x 
      00966A 00 01 1F         [ 2] 4404 	cpw x,#15 
      00966D 03 20            [ 2] 4405 	jrule 2$
      00966F 14 0A            [ 1] 4406 	ld a,#ERR_BAD_VALUE
      009670 CC 07 97         [ 2] 4407 	jp tb_error 
      009670 72 04 00         [ 4] 4408 2$:	call select_pin 
      009673 24 03            [ 1] 4409 	ld (PINNO,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009675 CC 88            [ 1] 4410 	ld a,#1
      009677 15 CD            [ 1] 4411 	tnz (PINNO,sp)
      009679 91 4B            [ 1] 4412 	jreq 4$
      00967B A1               [ 1] 4413 3$: sll a
      00967C 84 27            [ 1] 4414 	dec (PINNO,sp)
      00967E 03 CC            [ 1] 4415 	jrne 3$
      009680 88 15            [ 1] 4416 4$: tnz (PINVAL,sp)
      009682 1F 03            [ 1] 4417 	jrne 5$
      009684 43               [ 1] 4418 	cpl a 
      009684 CE 00            [ 1] 4419 	and a,(GPIO_ODR,x)
      009686 05 1F            [ 2] 4420 	jra 8$
      009688 0B CE            [ 1] 4421 5$: or a,(GPIO_ODR,x)
      00968A 00 01            [ 1] 4422 8$: ld (GPIO_ODR,x),a 
      00184A                       4423 	_drop VSIZE 
      00968C 1F 09            [ 2]    1     addw sp,#VSIZE 
      00968E 72               [ 4] 4424 	ret
                                   4425 
                                   4426 
                                   4427 ;-----------------------
                                   4428 ; BASIC: STOP
                                   4429 ; stop progam execution  
                                   4430 ; without resetting pointers 
                                   4431 ; the program is resumed
                                   4432 ; with RUN 
                                   4433 ;-------------------------
      00184D                       4434 stop:
      00968F 15 00 24 72 5C   [ 2] 4435 	btjt flags,#FRUN,2$
      009694 00               [ 1] 4436 	clr a
      009695 21               [ 4] 4437 	ret 
      001854                       4438 2$:	 
                                   4439 ; create space on cstack to save context 
      009696 81 18 7B         [ 2] 4440 	ldw x,#break_point 
      009697 CD 01 D7         [ 4] 4441 	call puts 
      00185A                       4442 	_drop 2 ;drop return address 
      009697 72 5D            [ 2]    1     addw sp,#2 
      00185C                       4443 	_vars CTXT_SIZE ; context size 
      009699 00 21            [ 2]    1     sub sp,#CTXT_SIZE 
      00969B 26 03 CC         [ 4] 4444 	call save_context 
      00969E 88 15 90         [ 2] 4445 	ldw x,#tib 
      0096A0 CF 00 04         [ 2] 4446 	ldw basicptr,x
      0096A0 A6               [ 1] 4447 	clr (x)
      0096A1 85 CD 8F FC      [ 1] 4448 	clr count  
      0096A5 13               [ 1] 4449 	clrw x 
      0096A6 07 27 03         [ 2] 4450 	ldw in.w,x
      0096A9 CC 88 15 23      [ 1] 4451 	bres flags,#FRUN 
      0096AC 72 18 00 23      [ 1] 4452 	bset flags,#FBREAK
      0096AC FE 72 FB         [ 2] 4453 	jp interpreter 
      0096AF 03 16 07 90 FF A6 80  4454 break_point: .asciz "\nbreak point, RUN to resume.\n"
             15 03 2A 06 13 05 2F
             1B 20 04 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4455 
                                   4456 ;-----------------------
                                   4457 ; BASIC: NEW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4458 ; from command line only 
                                   4459 ; free program memory
                                   4460 ; and clear variables 
                                   4461 ;------------------------
      0096C0                       4462 new: 
      0096C0 13 05 2C 15 01   [ 2] 4463 	btjf flags,#FRUN,0$ 
      0096C4 81               [ 4] 4464 	ret 
      00189F                       4465 0$:	
      0096C4 1E 0B CF         [ 4] 4466 	call clear_basic 
      0096C7 00               [ 4] 4467 	ret 
                                   4468 	 
                                   4469 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4470 ;  file system routines
                                   4471 ;  MCU flash memory from
                                   4472 ;  0x10000-0x27fff is 
                                   4473 ;  used to store BASIC 
                                   4474 ;  program files. 
                                   4475 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4476 
                                   4477 ;--------------------
                                   4478 ; input:
                                   4479 ;   X     increment 
                                   4480 ; output:
                                   4481 ;   farptr  incremented 
                                   4482 ;---------------------
      0018A3                       4483 incr_farptr:
      0096C8 05 72 01 00      [ 2] 4484 	addw x,farptr+1 
      0096CC 24 05            [ 1] 4485 	jrnc 1$
      0096CE E6 02 C7 00      [ 1] 4486 	inc farptr 
      0096D2 04 1E 09         [ 2] 4487 1$:	ldw farptr+1,x  
      0096D5 CF               [ 4] 4488 	ret 
                                   4489 
                                   4490 ;------------------------------
                                   4491 ; extended flash memory used as FLASH_DRIVE 
                                   4492 ; seek end of used flash drive   
                                   4493 ; starting at 0x10000 address.
                                   4494 ; 4 consecutives 0 bytes signal free space. 
                                   4495 ; input:
                                   4496 ;	none
                                   4497 ; output:
                                   4498 ;   ffree     free_addr| 0 if memory full.
                                   4499 ;------------------------------
      0018B1                       4500 seek_fdrive:
                                   4501 ; start scan at 0x10000 address 
      0096D6 00 01            [ 1] 4502 	ld a,#1
      0096D8 81 00 16         [ 1] 4503 	ld farptr,a 
      0096D9 5F               [ 1] 4504 	clrw x 
      0096D9 85 5B 0A         [ 2] 4505 	ldw farptr+1,x 
      0018BA                       4506 1$:
      0096DC 72 5A 00         [ 2] 4507 	ldw x,#3  
      0096DF 21 FC 00 16      [ 5] 4508 2$:	ldf a,([farptr],x) 
      0096E1 26 05            [ 1] 4509 	jrne 3$
      0096E1 CD               [ 2] 4510 	decw x
      0096E2 91 4B            [ 1] 4511 	jrpl 2$
      0096E4 A1 84            [ 2] 4512 	jra 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096E6 27               [ 2] 4513 3$:	incw x 
      0096E7 03 CC 88         [ 4] 4514 	call incr_farptr
      0096EA 15 CD 83         [ 2] 4515 	ldw x,#0x27f 
      0096ED A4 5D 26         [ 2] 4516 	cpw x,farptr
      0096F0 05 A6            [ 1] 4517 	jrpl 1$
                                   4518 ; drive full 
      0096F2 05 CC 88 17      [ 1] 4519 	clr ffree 
      0096F6 81 5F 00 1A      [ 1] 4520 	clr ffree+1 
      0096F7 72 5F 00 1B      [ 1] 4521 	clr ffree+2 
      0096F7 72               [ 4] 4522 	ret
      0018E1                       4523 4$: ; copy farptr to ffree	 
      0096F8 00 00 24         [ 2] 4524 	ldw x,farptr 
      0096FB 06 A6 06         [ 1] 4525 	ld a,farptr+2 
      0096FE CC 88 17         [ 2] 4526 	ldw ffree,x 
      009701 81 CD 96         [ 1] 4527 	ld ffree+2,a  
      009704 E1               [ 4] 4528 	ret 
                                   4529 
                                   4530 ;-----------------------
                                   4531 ; compare file name 
                                   4532 ; with name pointed by Y  
                                   4533 ; input:
                                   4534 ;   farptr   file name 
                                   4535 ;   Y        target name 
                                   4536 ; output:
                                   4537 ;   farptr 	 at file_name
                                   4538 ;   X 		 farptr[x] point at size field  
                                   4539 ;   Carry    0|1 no match|match  
                                   4540 ;----------------------
      009705                       4541 cmp_name:
      009705 CF               [ 1] 4542 	clrw x
      009706 00 05 E6 02      [ 5] 4543 1$:	ldf a,([farptr],x)
      00970A C7 00            [ 1] 4544 	cp a,(y)
      00970C 04 35            [ 1] 4545 	jrne 4$
      00970E 03               [ 1] 4546 	tnz a 
      00970F 00 02            [ 1] 4547 	jreq 9$ 
      009711 81               [ 2] 4548     incw x 
      009712 90 5C            [ 2] 4549 	incw y 
      009712 72 00            [ 2] 4550 	jra 1$
      0018FF                       4551 4$: ;no match 
      009714 00               [ 1] 4552 	tnz a 
      009715 24 06            [ 1] 4553 	jreq 5$
      009717 A6               [ 2] 4554 	incw x 
      009718 06 CC 88 17      [ 5] 4555 	ldf a,([farptr],x)
      00971C 81 85            [ 2] 4556 	jra 4$  
      00971E 52               [ 2] 4557 5$:	incw x ; farptr[x] point at 'size' field 
      00971F 04               [ 1] 4558 	rcf 
      009720 89               [ 4] 4559 	ret
      00190C                       4560 9$: ; match  
      009721 CE               [ 2] 4561 	incw x  ; farptr[x] at 'size' field 
      009722 00               [ 1] 4562 	scf 
      009723 05               [ 4] 4563 	ret 
                                   4564 
                                   4565 ;-----------------------
                                   4566 ; search file in 
                                   4567 ; flash memory 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4568 ; input:
                                   4569 ;   Y       file name  
                                   4570 ; output:
                                   4571 ;   farptr  addr at name|0
                                   4572 ;-----------------------
                           000001  4573 	FSIZE=1
                           000003  4574 	YSAVE=3
                           000004  4575 	VSIZE=4 
      00190F                       4576 search_file: 
      00190F                       4577 	_vars VSIZE
      009724 1F 03            [ 2]    1     sub sp,#VSIZE 
      009726 CD 96            [ 2] 4578 	ldw (YSAVE,sp),y  
      009728 E1               [ 1] 4579 	clrw x 
      009729 89 CE 00         [ 2] 4580 	ldw farptr+1,x 
      00972C 01 1F 07 85      [ 1] 4581 	mov farptr,#1
      00191B                       4582 1$:	
                                   4583 ; check if farptr is after any file 
                                   4584 ; if  0 then so.
      009730 20 D3 00 16      [ 5] 4585 	ldf a,[farptr]
      009732 27 25            [ 1] 4586 	jreq 6$
      009732 72               [ 1] 4587 2$: clrw x 	
      009733 00 00            [ 2] 4588 	ldw y,(YSAVE,sp) 
      009735 24 05 A6         [ 4] 4589 	call cmp_name
      009738 06 CC            [ 1] 4590 	jrc 9$
      00973A 88 17 00 16      [ 5] 4591 	ldf a,([farptr],x)
      00973C 6B 01            [ 1] 4592 	ld (FSIZE,sp),a 
      00973C 1E               [ 2] 4593 	incw x 
      00973D 03 CF 00 05      [ 5] 4594 	ldf a,([farptr],x)
      009741 E6 02            [ 1] 4595 	ld (FSIZE+1,sp),a 
      009743 C7               [ 2] 4596 	incw x 
      009744 00 04 1E         [ 2] 4597 	addw x,(FSIZE,sp) ; count to skip 
      009747 05               [ 2] 4598 	incw x ; skip over EOF marker 
      009748 CF 00 01         [ 4] 4599 	call incr_farptr ; now at next file 'name_field'
      00974B 85 5B 04         [ 2] 4600 	ldw x,#0x280
      00974E 89 81 16         [ 2] 4601 	cpw x,farptr 
      009750 2A D5            [ 1] 4602 	jrpl 1$
      001946                       4603 6$: ; file not found 
      009750 72 01 00 24      [ 1] 4604 	clr farptr
      009754 02 4F 81 17      [ 1] 4605 	clr farptr+1 
      009757 72 5F 00 18      [ 1] 4606 	clr farptr+2 
      001952                       4607 	_drop VSIZE 
      009757 72 09            [ 2]    1     addw sp,#VSIZE 
      009759 00               [ 1] 4608 	rcf
      00975A 24               [ 4] 4609 	ret
      001956                       4610 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001956                       4611 	_drop VSIZE 
      00975B 12 5B            [ 2]    1     addw sp,#VSIZE 
      00975D 02               [ 1] 4612 	scf 	
      00975E CD               [ 4] 4613 	ret
                                   4614 
                                   4615 
                                   4616 ;--------------------------------
                                   4617 ; BASIC: SAVE "name" 
                                   4618 ; save text program in 
                                   4619 ; flash memory used as 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4620 ;--------------------------------
                           000001  4621 	BSIZE=1
                           000003  4622 	NAMEPTR=3
                           000004  4623 	VSIZE=4
      00195A                       4624 save:
      00975F 94 C8 5B 04 72   [ 2] 4625 	btjf flags,#FRUN,0$ 
      009764 19 00            [ 1] 4626 	ld a,#ERR_CMD_ONLY 
      009766 24 72 10         [ 2] 4627 	jp tb_error
      001964                       4628 0$:	 
      009769 00 24 CC         [ 2] 4629 	ldw x,txtend 
      00976C 88 BB CE 00      [ 2] 4630 	subw x,txtbgn
      009770 1D C3            [ 1] 4631 	jrne 1$
                                   4632 ; nothing to save 
      009772 00 1F            [ 1] 4633 	ld a,#ERR_NO_PROG
      009774 2B 05 A6         [ 2] 4634 	jp tb_error 	
      001972                       4635 1$:	
      001972                       4636 	_vars VSIZE 
      009777 0D CC            [ 2]    1     sub sp,#VSIZE 
      009779 88 17            [ 2] 4637 	ldw (BSIZE,sp),x 
      00977B CD 08 87         [ 4] 4638 	call next_token	
      00977B CD 91            [ 1] 4639 	cp a,#TK_QSTR
      00977D F7 5B            [ 1] 4640 	jreq 2$
      00977F 02 5F CF         [ 2] 4641 	jp syntax_error
      001980                       4642 2$: 
      009782 00 07            [ 2] 4643 	ldw (NAMEPTR,sp),x  
      009784 72 5F 00 09 72   [ 1] 4644 	mov in,count 
                                   4645 ; check if enough free space 
      009789 5F 00 0A         [ 4] 4646 	call strlen 
      00978C CE 00 1D         [ 2] 4647 	addw x,#3 
      00978F CF 00 05         [ 2] 4648 	addw x,(BSIZE,sp)
      009792 E6 02 C7 00      [ 1] 4649 	tnz ffree 
      009796 04 35            [ 1] 4650 	jrne 21$
      009798 03 00 02 72      [ 2] 4651 	subw x,ffree+1 
      00979C 10 00            [ 2] 4652 	jrule 21$
      00979E 24 CC            [ 1] 4653 	ld a,#ERR_NO_FSPACE  
      0097A0 88 BB 97         [ 2] 4654 	jp tb_error
      0097A2                       4655 21$: 
                                   4656 ; check for existing file of that name 
      0097A2 AE 17            [ 2] 4657 	ldw y,(NAMEPTR,sp)	
      0097A4 FF 94 CC         [ 4] 4658 	call search_file 
      0097A7 88 9C            [ 1] 4659 	jrnc 3$ 
      0097A9 A6 08            [ 1] 4660 	ld a,#ERR_DUPLICATE 
      0097A9 CD 90 0E         [ 2] 4661 	jp tb_error 
      0019AD                       4662 3$:	;** write file name to flash **
      0097AC A1 02 27         [ 2] 4663 	ldw x,ffree 
      0097AF 03 CC 88         [ 1] 4664 	ld a,ffree+2 
      0097B2 15 00 16         [ 2] 4665 	ldw farptr,x 
      0097B3 C7 00 18         [ 1] 4666 	ld farptr+2,a 
      0097B3 85 90            [ 2] 4667 	ldw x,(NAMEPTR,sp)  
      0097B5 85 02 B6         [ 4] 4668 	call strlen 
      0097B6 5C               [ 2] 4669 	incw  x
      0097B6 89 AE            [ 2] 4670 	ldw (BSIZE,sp),x  
      0097B8 F4               [ 1] 4671 	clrw x   
      0097B9 24 65            [ 2] 4672 	ldw y,(NAMEPTR,sp)
      0097BB 90 A3 7A         [ 4] 4673 	call write_block  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4674 ;** write file length after name **
      0097BE 12 2B 01         [ 2] 4675 	ldw x,txtend 
      0097C1 5C B0 00 1C      [ 2] 4676 	subw x,txtbgn
      0097C2 1F 01            [ 2] 4677 	ldw (BSIZE,sp),x 
      0097C2 9E               [ 1] 4678 	clrw x 
      0097C3 C7 53            [ 1] 4679 	ld a,(BSIZE,sp)
      0097C5 0D 9F C7         [ 4] 4680 	call write_byte 
      0097C8 53               [ 2] 4681 	incw x 
      0097C9 0E 8C            [ 1] 4682 	ld a,(BSIZE+1,sp)
      0097CB 56 9E C7         [ 4] 4683 	call write_byte
      0097CE 53               [ 2] 4684 	incw x  
      0097CF 0F 9F C7         [ 4] 4685 	call incr_farptr ; move farptr after SIZE field 
                                   4686 ;** write BASIC text **
                                   4687 ; copy BSIZE, stack:{... bsize -- ... bsize bsize }	
      0097D2 53 10            [ 2] 4688 	ldw x,(BSIZE,sp)
      0097D4 72               [ 2] 4689 	pushw x ; write_block argument 
      0097D5 10               [ 1] 4690 	clrw x 
      0097D6 53 08 72 10      [ 2] 4691 	ldw y,txtbgn  ; BASIC text to save 
      0097DA 53 00 72         [ 4] 4692 	call write_block 
      0019EB                       4693 	_drop 2 ;  drop write_block argument  
      0097DD 10 53            [ 2]    1     addw sp,#2 
                                   4694 ; write end of file marker 
      0097DF 04 85 CF         [ 2] 4695 	ldw x,#1
      0097E2 00 11            [ 1] 4696 	ld a,#EOF  
      0097E4 CE 00 11         [ 4] 4697 	call write_byte 
      0097E7 26 FB 72         [ 4] 4698 	call incr_farptr
                                   4699 ; save farptr in ffree
      0097EA 11 53 08         [ 2] 4700 	ldw x,farptr 
      0097ED 72 11 53         [ 1] 4701 	ld a,farptr+2 
      0097F0 00 81 19         [ 2] 4702 	ldw ffree,x 
      0097F2 C7 00 1B         [ 1] 4703 	ld ffree+2,a
                                   4704 ;write 4 zero bytes as an end of all files marker 
      0097F2 CD               [ 1] 4705     clrw x 
      0097F3 90 0E            [ 1] 4706 	push #4 
      001A07                       4707 4$:
      0097F5 A1               [ 1] 4708 	clr a 
      0097F6 02 27 0B         [ 4] 4709 	call write_byte 
      0097F9 A1               [ 2] 4710 	incw x 
      0097FA 01 27            [ 1] 4711 	dec (1,sp)
      0097FC 03 CC            [ 1] 4712 	jrne 4$
      0097FE 88               [ 1] 4713 5$: pop a 
                                   4714 ; display saved size  
      0097FF 15 AE            [ 2] 4715 	ldw x,(BSIZE,sp) 
      009801 00 00 89         [ 4] 4716 	call print_int 
      001A16                       4717 	_drop VSIZE 
      009804 1E 03            [ 2]    1     addw sp,#VSIZE 
      009806 5D               [ 4] 4718 	ret 
                                   4719 
                                   4720 ;----------------------
                                   4721 ; load file in RAM memory
                                   4722 ; input:
                                   4723 ;    farptr point at file size 
                                   4724 ; output:
                                   4725 ;   y point after BASIC program in RAM.
                                   4726 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001A19                       4727 load_file:
      009807 27 1A 1E         [ 4] 4728 	call incr_farptr  
      00980A 01 9F A4         [ 4] 4729 	call clear_basic  
      00980D 07               [ 1] 4730 	clrw x
      00980E 4E C7 54 01      [ 5] 4731 	ldf a,([farptr],x)
      009812 72 16            [ 1] 4732 	ld yh,a 
      009814 50               [ 2] 4733 	incw x  
      009815 CA 72 10 54      [ 5] 4734 	ldf a,([farptr],x)
      009819 01               [ 2] 4735 	incw x 
      00981A AE 00            [ 1] 4736 	ld yl,a 
      00981C 1B 5A 9D 26      [ 2] 4737 	addw y,txtbgn
      009820 FA 20 08 72      [ 2] 4738 	ldw txtend,y
      009824 11 54 01 72      [ 2] 4739 	ldw y,txtbgn
      001A3A                       4740 3$:	; load BASIC text 	
      009828 17 50 CA 5B      [ 5] 4741 	ldf a,([farptr],x)
      00982C 04 81            [ 1] 4742 	ld (y),a 
      00982E 5C               [ 2] 4743 	incw x 
      00982E CD 90            [ 2] 4744 	incw y 
      009830 09 A1 01 27      [ 2] 4745 	cpw y,txtend 
      009834 03 CC            [ 1] 4746 	jrmi 3$
      009836 88               [ 4] 4747 	ret 
                                   4748 
                                   4749 ;------------------------
                                   4750 ; BASIC: LOAD "file" 
                                   4751 ; load file to RAM 
                                   4752 ; for execution 
                                   4753 ;------------------------
      001A4A                       4754 load:
      009837 15 85 A3 00 05   [ 2] 4755 	btjf flags,#FRUN,0$ 
      00983C 23 05            [ 1] 4756 	jreq 0$ 
      00983E A6 0A            [ 1] 4757 	ld a,#ERR_CMD_ONLY 
      009840 CC 88 17         [ 2] 4758 	jp tb_error 
      001A56                       4759 0$:	
      009843 9F C7 00         [ 4] 4760 	call next_token 
      009846 0E A6            [ 1] 4761 	cp a,#TK_QSTR
      009848 05 C0            [ 1] 4762 	jreq 1$
      00984A 00 0E C7         [ 2] 4763 	jp syntax_error 
      00984D 54 00            [ 1] 4764 1$:	ldw y,x 
      00984F 72 16 54         [ 4] 4765 	call search_file 
      009852 02 72            [ 1] 4766 	jrc 2$ 
      009854 10 54            [ 1] 4767 	ld a,#ERR_NOT_FILE
      009856 01 72 0F         [ 2] 4768 	jp tb_error  
      001A6C                       4769 2$:
      009859 54 00 FB         [ 4] 4770 	call load_file
                                   4771 ; print loaded size 	 
      00985C CE 54 04         [ 2] 4772 	ldw x,txtend 
      00985F A6 84 81 1C      [ 2] 4773 	subw x,txtbgn
      009862 CD 09 24         [ 4] 4774 	call print_int 
      009862 52               [ 4] 4775 	ret 
                                   4776 
                                   4777 ;-----------------------------------
                                   4778 ; BASIC: FORGET ["file_name"] 
                                   4779 ; erase file_name and all others 
                                   4780 ; after it. 
                                   4781 ; without argument erase all files 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4782 ;-----------------------------------
      001A7A                       4783 forget:
      009863 01 CD 90         [ 4] 4784 	call next_token 
      009866 09 A1            [ 1] 4785 	cp a,#TK_NONE 
      009868 01 27            [ 1] 4786 	jreq 3$ 
      00986A 03 CC            [ 1] 4787 	cp a,#TK_QSTR
      00986C 88 15            [ 1] 4788 	jreq 1$
      00986E 85 A3 00         [ 2] 4789 	jp syntax_error
      009871 0F 23            [ 1] 4790 1$: ldw y,x 
      009873 05 A6 0A CC 88   [ 1] 4791 	mov in,count 
      009878 17 CD 9E         [ 4] 4792 	call search_file
      00987B 47 6B            [ 1] 4793 	jrc 2$
      00987D 01 E6            [ 1] 4794 	ld a,#ERR_NOT_FILE 
      00987F 01 0D 01         [ 2] 4795 	jp tb_error 
      001A99                       4796 2$: 
      009882 27 05 44         [ 2] 4797 	ldw x,farptr
      009885 0A 01 26         [ 1] 4798 	ld a,farptr+2
      009888 FB A4            [ 2] 4799 	jra 4$ 
      001AA1                       4800 3$: ; forget all files 
      00988A 01 5F 97         [ 2] 4801 	ldw x,#0x100
      00988D A6               [ 1] 4802 	clr a 
      00988E 84 5B 01         [ 2] 4803 	ldw farptr,x 
      009891 81 00 18         [ 1] 4804 	ld farptr+2,a 
      009892                       4805 4$:
      009892 52 02 CD         [ 2] 4806 	ldw ffree,x 
      009895 90 0E A1         [ 1] 4807 	ld ffree+2,a 
      009898 02 27            [ 1] 4808 	push #4
      00989A 03               [ 1] 4809 	clrw x 
      001AB4                       4810 5$: 
      00989B CC               [ 1] 4811 	clr a  
      00989C 88 15 85         [ 4] 4812 	call write_byte 
      00989F 9F               [ 2] 4813 	incw x 
      0098A0 6B 02            [ 1] 4814 	dec (1,sp)
      0098A2 85 A3            [ 1] 4815 	jrne 5$	
      0098A4 00               [ 1] 4816 6$: pop a 
      0098A5 0F               [ 4] 4817 	ret 
                                   4818 
                                   4819 ;----------------------
                                   4820 ; BASIC: DIR 
                                   4821 ; list saved files 
                                   4822 ;----------------------
                           000001  4823 	COUNT=1 ; files counter 
                           000002  4824 	VSIZE=2 
      001ABF                       4825 directory:
      001ABF                       4826 	_vars VSIZE 
      0098A6 23 05            [ 2]    1     sub sp,#VSIZE 
      0098A8 A6               [ 1] 4827 	clrw x 
      0098A9 0A CC            [ 2] 4828 	ldw (COUNT,sp),x 
      0098AB 88 17 CD         [ 2] 4829 	ldw farptr+1,x 
      0098AE 9E 47 6B 01      [ 1] 4830 	mov farptr,#1 
      001ACB                       4831 dir_loop:
      0098B2 A6               [ 1] 4832 	clrw x 
      0098B3 01 0D 01 27      [ 5] 4833 	ldf a,([farptr],x)
      0098B7 05 48            [ 1] 4834 	jreq 8$ 
      001AD2                       4835 1$: ;name loop 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098B9 0A 01 26 FB      [ 5] 4836 	ldf a,([farptr],x)
      0098BD 0D 02            [ 1] 4837 	jreq 2$ 
      0098BF 26 05 43         [ 4] 4838 	call putc 
      0098C2 E4               [ 2] 4839 	incw x 
      0098C3 00 20            [ 2] 4840 	jra 1$
      0098C5 02               [ 2] 4841 2$: incw x ; skip ending 0. 
      0098C6 EA 00            [ 1] 4842 	ld a,#SPACE 
      0098C8 E7 00 5B         [ 4] 4843 	call putc 
                                   4844 ; get file size 	
      0098CB 02 81 00 16      [ 5] 4845 	ldf a,([farptr],x)
      0098CD 90 95            [ 1] 4846 	ld yh,a 
      0098CD 72               [ 2] 4847 	incw x 
      0098CE 00 00 24 02      [ 5] 4848 	ldf a,([farptr],x)
      0098D2 4F               [ 2] 4849 	incw x 
      0098D3 81 97            [ 1] 4850 	ld yl,a 
      0098D4 90 89            [ 2] 4851 	pushw y 
      0098D4 AE 98 FB         [ 2] 4852 	addw x,(1,sp)
      0098D7 CD               [ 2] 4853 	incw x ; skip EOF marker 
                                   4854 ; skip to next file 
      0098D8 82 57 5B         [ 4] 4855 	call incr_farptr 
                                   4856 ; print file size 
      0098DB 02               [ 2] 4857 	popw x ; file size 
      0098DC 52 04 CD         [ 4] 4858 	call print_int 
      0098DF 94 B8            [ 1] 4859 	ld a,#CR 
      0098E1 AE 16 90         [ 4] 4860 	call putc
      0098E4 CF 00            [ 2] 4861 	ldw x,(COUNT,sp)
      0098E6 05               [ 2] 4862 	incw x
      0098E7 7F 72            [ 2] 4863 	ldw (COUNT,sp),x  
      0098E9 5F 00            [ 2] 4864 	jra dir_loop 
      001B0B                       4865 8$: ; print number of files 
      0098EB 04 5F            [ 2] 4866 	ldw x,(COUNT,sp)
      0098ED CF 00 01         [ 4] 4867 	call print_int 
      0098F0 72 11 00         [ 2] 4868 	ldw x,#file_count 
      0098F3 24 72 18         [ 4] 4869 	call puts  
                                   4870 ; print drive free space 	
      0098F6 00 24            [ 1] 4871 	ld a,#0xff 
      0098F8 CC 88 BB         [ 1] 4872 	sub a,ffree+2 
      0098FB 0A 62 72         [ 1] 4873 	ld acc8,a 
      0098FE 65 61            [ 1] 4874 	ld a,#0x7f 
      009900 6B 20 70         [ 1] 4875 	sbc a,ffree+1 
      009903 6F 69 6E         [ 1] 4876 	ld acc16,a 
      009906 74 2C            [ 1] 4877 	ld a,#2 
      009908 20 52 55         [ 1] 4878 	sbc a,ffree 
      00990B 4E 20 74         [ 1] 4879 	ld acc24,a 
      00990E 6F               [ 1] 4880 	clrw x  
      00990F 20 72            [ 1] 4881 	ld a,#6 
      009911 65               [ 1] 4882 	ld xl,a 
      009912 73 75            [ 1] 4883 	ld a,#10 
      009914 6D 65 2E         [ 4] 4884 	call prti24 
      009917 0A 00 48         [ 2] 4885 	ldw x,#drive_free
      009919 CD 01 D7         [ 4] 4886 	call puts 
      001B3D                       4887 	_drop VSIZE 
      009919 72 01            [ 2]    1     addw sp,#VSIZE 
      00991B 00               [ 4] 4888 	ret
      00991C 24 01 81 6C 65 73 0A  4889 file_count: .asciz " files\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



             00
      00991F 20 62 79 74 65 73 20  4890 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4891 
                                   4892 ;---------------------
                                   4893 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4894 ; write 1 or more byte to FLASH or EEPROM
                                   4895 ; starting at address  
                                   4896 ; input:
                                   4897 ;   expr1  	is address 
                                   4898 ;   expr2,...,exprn   are bytes to write
                                   4899 ; output:
                                   4900 ;   none 
                                   4901 ;---------------------
                           000001  4902 	ADDR=1
                           000002  4903 	VSIZ=2 
      001B55                       4904 write:
      001B55                       4905 	_vars VSIZE 
      00991F CD 86            [ 2]    1     sub sp,#VSIZE 
      009921 81 81 00 16      [ 1] 4906 	clr farptr ; expect 16 bits address 
      009923 CD 10 87         [ 4] 4907 	call expression
      009923 72 BB            [ 1] 4908 	cp a,#TK_INTGR 
      009925 00 18            [ 1] 4909 	jreq 0$
      009927 24 04 72         [ 2] 4910 	jp syntax_error
      00992A 5C 00            [ 2] 4911 0$: ldw (ADDR,sp),x 
      00992C 17 CF 00         [ 4] 4912 	call next_token 
      00992F 18 81            [ 1] 4913 	cp a,#TK_COMMA 
      009931 27 02            [ 1] 4914 	jreq 1$ 
      009931 A6 01            [ 2] 4915 	jra 9$ 
      009933 C7 00 17         [ 4] 4916 1$:	call expression
      009936 5F CF            [ 1] 4917 	cp a,#TK_INTGR
      009938 00 18            [ 1] 4918 	jreq 2$
      00993A CC 07 95         [ 2] 4919 	jp syntax_error
      00993A AE               [ 1] 4920 2$:	ld a,xl 
      00993B 00 03            [ 2] 4921 	ldw x,(ADDR,sp) 
      00993D 92 AF 00         [ 2] 4922 	ldw farptr+1,x 
      009940 17               [ 1] 4923 	clrw x 
      009941 26 05 5A         [ 4] 4924 	call write_byte
      009944 2A F7            [ 2] 4925 	ldw x,(ADDR,sp)
      009946 20               [ 2] 4926 	incw x 
      009947 19 5C            [ 2] 4927 	jra 0$ 
      001B89                       4928 9$:
      001B89                       4929 	_drop VSIZE
      009949 CD 99            [ 2]    1     addw sp,#VSIZE 
      00994B 23               [ 4] 4930 	ret 
                                   4931 
                                   4932 
                                   4933 ;---------------------
                                   4934 ;BASIC: CHAR(expr)
                                   4935 ; évaluate expression 
                                   4936 ; and take the 7 least 
                                   4937 ; bits as ASCII character
                                   4938 ;---------------------
      001B8C                       4939 char:
      00994C AE 02 7F         [ 4] 4940 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      00994F C3 00            [ 1] 4941 	cp a,#1
      009951 17 2A            [ 1] 4942 	jreq 1$
      009953 E6 72 5F         [ 2] 4943 	jp syntax_error
      009956 00               [ 2] 4944 1$:	popw x 
      009957 1A               [ 1] 4945 	ld a,xl 
      009958 72 5F            [ 1] 4946 	and a,#0x7f 
      00995A 00               [ 1] 4947 	ld xl,a
      00995B 1B 72            [ 1] 4948 	ld a,#TK_CHAR
      00995D 5F               [ 4] 4949 	ret
                                   4950 
                                   4951 ;---------------------
                                   4952 ; BASIC: ASC(string|char)
                                   4953 ; extract first character 
                                   4954 ; of string argument 
                                   4955 ; return it as TK_INTGR 
                                   4956 ;---------------------
      001B9E                       4957 ascii:
      00995E 00 1C            [ 1] 4958 	ld a,#TK_LPAREN
      009960 81 0F 7C         [ 4] 4959 	call expect 
      009961 CD 08 87         [ 4] 4960 	call next_token 
      009961 CE 00            [ 1] 4961 	cp a,#TK_QSTR 
      009963 17 C6            [ 1] 4962 	jreq 1$
      009965 00 19            [ 1] 4963 	cp a,#TK_CHAR 
      009967 CF 00            [ 1] 4964 	jreq 2$ 
      009969 1A C7 00         [ 2] 4965 	jp syntax_error
      001BB1                       4966 1$: 
      00996C 1C               [ 1] 4967 	ld a,(x) 
      00996D 81               [ 1] 4968 	clrw x
      00996E 97               [ 1] 4969 	ld xl,a 
      001BB4                       4970 2$: 
      00996E 5F               [ 2] 4971 	pushw x 
      00996F 92 AF            [ 1] 4972 	ld a,#TK_RPAREN 
      009971 00 17 90         [ 4] 4973 	call expect
      009974 F1               [ 2] 4974 	popw x 
      009975 26 08            [ 1] 4975 	ld a,#TK_INTGR 
      009977 4D               [ 4] 4976 	ret 
                                   4977 
                                   4978 ;---------------------
                                   4979 ;BASIC: KEY
                                   4980 ; wait for a character 
                                   4981 ; received from STDIN 
                                   4982 ; input:
                                   4983 ;	none 
                                   4984 ; output:
                                   4985 ;	X 		ASCII character 
                                   4986 ;---------------------
      001BBE                       4987 key:
      009978 27 12 5C         [ 4] 4988 	call getc 
      00997B 90               [ 1] 4989 	clrw x 
      00997C 5C               [ 1] 4990 	ld xl,a 
      00997D 20 F0            [ 1] 4991 	ld a,#TK_INTGR
      00997F 81               [ 4] 4992 	ret
                                   4993 
                                   4994 ;----------------------
                                   4995 ; BASIC: QKEY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4996 ; Return true if there 
                                   4997 ; is a character in 
                                   4998 ; waiting in STDIN 
                                   4999 ; input:
                                   5000 ;  none 
                                   5001 ; output:
                                   5002 ;   X 		0|-1 
                                   5003 ;-----------------------
      001BC6                       5004 qkey:: 
      00997F 4D               [ 1] 5005 	clrw x 
      009980 27 07 5C 92      [ 1] 5006 	tnz rx_char
      009984 AF 00            [ 1] 5007 	jreq 9$ 
      009986 17               [ 2] 5008 	cplw x 
      009987 20 F6            [ 1] 5009 9$: ld a,#TK_INTGR
      009989 5C               [ 4] 5010 	ret 
                                   5011 
                                   5012 ;---------------------
                                   5013 ; BASIC: GPIO(expr,reg)
                                   5014 ; return gpio address 
                                   5015 ; expr {0..8}
                                   5016 ; input:
                                   5017 ;   none 
                                   5018 ; output:
                                   5019 ;   X 		gpio register address
                                   5020 ;----------------------------
                           000003  5021 	PORT=3
                           000001  5022 	REG=1 
                           000004  5023 	VSIZE=4 
      001BD1                       5024 gpio:
      00998A 98 81 89         [ 4] 5025 	call func_args 
      00998C A1 02            [ 1] 5026 	cp a,#2
      00998C 5C 99            [ 1] 5027 	jreq 1$
      00998E 81 07 95         [ 2] 5028 	jp syntax_error  
      00998F                       5029 1$:	
      00998F 52 04            [ 2] 5030 	ldw x,(PORT,sp)
      009991 17 03            [ 1] 5031 	jrmi bad_port
      009993 5F CF 00         [ 2] 5032 	cpw x,#9
      009996 18 35            [ 1] 5033 	jrpl bad_port
      009998 01 00            [ 1] 5034 	ld a,#5
      00999A 17               [ 4] 5035 	mul x,a
      00999B 1C 50 00         [ 2] 5036 	addw x,#GPIO_BASE 
      00999B 92 BC            [ 2] 5037 	ldw (PORT,sp),x  
      00999D 00 17            [ 2] 5038 	ldw x,(REG,sp) 
      00999F 27 25 5F         [ 2] 5039 	addw x,(PORT,sp)
      0099A2 16 03            [ 1] 5040 	ld a,#TK_INTGR
      001BF3                       5041 	_drop VSIZE 
      0099A4 CD 99            [ 2]    1     addw sp,#VSIZE 
      0099A6 6E               [ 4] 5042 	ret
      001BF6                       5043 bad_port:
      0099A7 25 2D            [ 1] 5044 	ld a,#ERR_BAD_VALUE
      0099A9 92 AF 00         [ 2] 5045 	jp tb_error
                                   5046 
                                   5047 
                                   5048 ;-------------------------
                                   5049 ; BASIC: UFLASH 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5050 ; return user flash address
                                   5051 ; input:
                                   5052 ;  none 
                                   5053 ; output:
                                   5054 ;	A		TK_INTGR
                                   5055 ;   X 		user address 
                                   5056 ;---------------------------
      001BFB                       5057 uflash:
      0099AC 17 6B 01         [ 2] 5058 	ldw x,#user_space 
      0099AF 5C 92            [ 1] 5059 	ld a,#TK_INTGR 
      0099B1 AF               [ 4] 5060 	ret 
                                   5061 
                                   5062 
                                   5063 ;---------------------
                                   5064 ; BASIC: USR(addr[,arg])
                                   5065 ; execute a function written 
                                   5066 ; in binary code.
                                   5067 ; binary fonction should 
                                   5068 ; return token attribute in A 
                                   5069 ; and value in X. 
                                   5070 ; input:
                                   5071 ;   addr	routine address 
                                   5072 ;   arg 	is an optional argument 
                                   5073 ; output:
                                   5074 ;   A 		token attribute 
                                   5075 ;   X       returned value 
                                   5076 ;---------------------
      001C01                       5077 usr:
      0099B2 00 17            [ 2] 5078 	pushw y 	
      0099B4 6B 02 5C         [ 4] 5079 	call func_args 
      0099B7 72 FB            [ 1] 5080 	cp a,#1 
      0099B9 01 5C            [ 1] 5081 	jreq 2$
      0099BB CD 99            [ 1] 5082 	cp a,#2
      0099BD 23 AE            [ 1] 5083 	jreq 2$  
      0099BF 02 80 C3         [ 2] 5084 	jp syntax_error 
      0099C2 00 17            [ 2] 5085 2$: popw y  ; arg|addr 
      0099C4 2A D5            [ 1] 5086 	cp a,#1
      0099C6 27 02            [ 1] 5087 	jreq 3$
      0099C6 72               [ 2] 5088 	popw x ; addr
      0099C7 5F               [ 1] 5089 	exgw x,y 
      0099C8 00 17            [ 4] 5090 3$: call (y)
      0099CA 72 5F            [ 2] 5091 	popw y 
      0099CC 00               [ 4] 5092 	ret 
                                   5093 
                                   5094 ;------------------------------
                                   5095 ; BASIC: BYE 
                                   5096 ; halt mcu in its lowest power mode 
                                   5097 ; wait for reset or external interrupt
                                   5098 ; do a cold start on wakeup.
                                   5099 ;------------------------------
      001C1E                       5100 bye:
      0099CD 18 72 5F 00 19   [ 2] 5101 	btjf UART1_SR,#UART_SR_TC,.
      0099D2 5B               [10] 5102 	halt
      0099D3 04 98 81         [ 2] 5103 	jp cold_start  
                                   5104 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5105 ;----------------------------------
                                   5106 ; BASIC: AUTORUN ["file_name"] 
                                   5107 ; record in eeprom at adrress AUTORUN_NAME
                                   5108 ; the name of file to load and execute
                                   5109 ; at startup. 
                                   5110 ; empty string delete autorun name 
                                   5111 ; no argument display autorun name  
                                   5112 ; input:
                                   5113 ;   file_name   file to execute 
                                   5114 ; output:
                                   5115 ;   none
                                   5116 ;-----------------------------------
      0099D6                       5117 autorun: 
      0099D6 5B 04 99 81 07   [ 2] 5118 	btjf flags,#FRUN,0$ 
      0099DA 27 05            [ 1] 5119 	jreq 0$ 
      0099DA 72 01            [ 1] 5120 	ld a,#ERR_CMD_ONLY 
      0099DC 00 24 05         [ 2] 5121 	jp tb_error 
      001C33                       5122 0$:	
      0099DF A6 07 CC         [ 4] 5123 	call next_token
      0099E2 88 17            [ 1] 5124 	jrne 1$
      0099E4 AE 40 00         [ 2] 5125 	ldw x,#AUTORUN_NAME
      0099E4 CE 00 1F         [ 4] 5126 	call puts 
      0099E7 72               [ 1] 5127 	clr a 
      0099E8 B0               [ 4] 5128 	ret 
      001C40                       5129 1$:
      0099E9 00 1D            [ 1] 5130 	cp a,#TK_QSTR
      0099EB 26 05            [ 1] 5131 	jreq 2$
      0099ED A6 0D CC         [ 2] 5132 	jp syntax_error 
      001C47                       5133 2$:	
      0099F0 88               [ 1] 5134 	tnz (x) 
      0099F1 17 09            [ 1] 5135 	jrne 3$
                                   5136 ; empty string, delete autorun 	
      0099F2 CD 05 B4         [ 4] 5137 	call cancel_autorun
      0099F2 52 04 1F 01 CD   [ 1] 5138 	mov in,count 
      0099F7 89               [ 4] 5139 	ret 
      0099F8 07               [ 2] 5140 3$:	pushw x 
      0099F9 A1 02            [ 1] 5141 	ldw y,x  
      0099FB 27 03 CC         [ 4] 5142 	call search_file 
      0099FE 88 15            [ 1] 5143 	jrc 4$ 
      009A00 A6 09            [ 1] 5144 	ld a,#ERR_NOT_FILE
      009A00 1F 03 55         [ 2] 5145 	jp tb_error  
      001C60                       5146 4$: 
      009A03 00 04 00 02 CD   [ 1] 5147 	mov in,count 
      009A08 83 36 1C 00      [ 1] 5148 	clr farptr 
      009A0C 03 72 FB         [ 2] 5149 	ldw x,#AUTORUN_NAME
      009A0F 01 72 5D         [ 2] 5150 	ldw farptr+1,x 
      009A12 00 1A            [ 2] 5151 	ldw x,(1,sp)  
      009A14 26 0B 72         [ 4] 5152 	call strlen  ; return length in X 
      009A17 B0               [ 2] 5153 	incw x 
      009A18 00 1B            [ 2] 5154 	popw y 
      009A1A 23               [ 2] 5155 	pushw x 
      009A1B 05               [ 1] 5156 	clrw x 
      009A1C A6 0E CC         [ 4] 5157 	call write_block 
      001C7C                       5158 	_drop 2 
      009A1F 88 17            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009A21 81               [ 4] 5159 	ret 
                                   5160 
                                   5161 ;----------------------------------
                                   5162 ; BASIC: SLEEP 
                                   5163 ; halt mcu until reset or external
                                   5164 ; interrupt.
                                   5165 ; Resume progam after SLEEP command
                                   5166 ;----------------------------------
      001C7F                       5167 sleep:
      009A21 16 03 CD 99 8F   [ 2] 5168 	btjf UART1_SR,#UART_SR_TC,.
      009A26 24 05 A6 08      [ 1] 5169 	bset flags,#FSLEEP
      009A2A CC               [10] 5170 	halt 
      009A2B 88               [ 4] 5171 	ret 
                                   5172 
                                   5173 ;-------------------------------
                                   5174 ; BASIC: PAUSE expr 
                                   5175 ; suspend execution for n msec.
                                   5176 ; input:
                                   5177 ;	none
                                   5178 ; output:
                                   5179 ;	none 
                                   5180 ;------------------------------
      001C8A                       5181 pause:
      009A2C 17 10 87         [ 4] 5182 	call expression
      009A2D A1 84            [ 1] 5183 	cp a,#TK_INTGR
      009A2D CE 00            [ 1] 5184 	jreq pause02 
      009A2F 1A C6 00         [ 2] 5185 	jp syntax_error
      001C94                       5186 pause02: 
      009A32 1C               [ 2] 5187 1$: tnzw x 
      009A33 CF 00            [ 1] 5188 	jreq 2$
      009A35 17               [10] 5189 	wfi 
      009A36 C7               [ 2] 5190 	decw x 
      009A37 00 19            [ 1] 5191 	jrne 1$
      009A39 1E               [ 1] 5192 2$:	clr a 
      009A3A 03               [ 4] 5193 	ret 
                                   5194 
                                   5195 ;------------------------------
                                   5196 ; BASIC: AWU expr
                                   5197 ; halt mcu for 'expr' milliseconds
                                   5198 ; use Auto wakeup peripheral
                                   5199 ; all oscillators stopped except LSI
                                   5200 ; range: 1ms - 511ms
                                   5201 ; input:
                                   5202 ;  none
                                   5203 ; output:
                                   5204 ;  none:
                                   5205 ;------------------------------
      001C9D                       5206 awu:
      009A3B CD 83 36         [ 4] 5207   call expression
      009A3E 5C 1F            [ 1] 5208   cp a,#TK_INTGR
      009A40 01 5F            [ 1] 5209   jreq awu02
      009A42 16 03 CD         [ 2] 5210   jp syntax_error
      001CA7                       5211 awu02:
      009A45 81 E6 CE         [ 2] 5212   cpw x,#5120
      009A48 00 1F            [ 1] 5213   jrmi 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A4A 72 B0 00 1D      [ 1] 5214   mov AWU_TBR,#15 
      009A4E 1F 01            [ 1] 5215   ld a,#30
      009A50 5F               [ 2] 5216   div x,a
      009A51 7B 01            [ 1] 5217   ld a,#16
      009A53 CD               [ 2] 5218   div x,a 
      009A54 81 71            [ 2] 5219   jra 4$
      001CB8                       5220 1$: 
      009A56 5C 7B 02         [ 2] 5221   cpw x,#2048
      009A59 CD 81            [ 1] 5222   jrmi 2$ 
      009A5B 71 5C CD 99      [ 1] 5223   mov AWU_TBR,#14
      009A5F 23 1E            [ 1] 5224   ld a,#80
      009A61 01               [ 2] 5225   div x,a 
      009A62 89 5F            [ 2] 5226   jra 4$   
      001CC6                       5227 2$:
      009A64 90 CE 00 1D      [ 1] 5228   mov AWU_TBR,#7
      001CCA                       5229 3$:  
                                   5230 ; while X > 64  divide by 2 and increment AWU_TBR 
      009A68 CD 81 E6         [ 2] 5231   cpw x,#64 
      009A6B 5B 02            [ 2] 5232   jrule 4$ 
      009A6D AE 00 01 A6      [ 1] 5233   inc AWU_TBR 
      009A71 FF               [ 2] 5234   srlw x 
      009A72 CD 81            [ 2] 5235   jra 3$ 
      001CD6                       5236 4$:
      009A74 71               [ 1] 5237   ld a, xl
      009A75 CD               [ 1] 5238   dec a 
      009A76 99 23            [ 1] 5239   jreq 5$
      009A78 CE               [ 1] 5240   dec a 	
      001CDB                       5241 5$: 
      009A79 00 17            [ 1] 5242   and a,#0x3e 
      009A7B C6 00 19         [ 1] 5243   ld AWU_APR,a 
      009A7E CF 00 1A C7      [ 1] 5244   bset AWU_CSR,#AWU_CSR_AWUEN
      009A82 00               [10] 5245   halt 
                                   5246 
      009A83 1C               [ 4] 5247   ret 
                                   5248 
                                   5249 ;------------------------------
                                   5250 ; BASIC: TICKS
                                   5251 ; return msec ticks counter value 
                                   5252 ; input:
                                   5253 ; 	none 
                                   5254 ; output:
                                   5255 ;	X 		TK_INTGR
                                   5256 ;-------------------------------
      001CE6                       5257 get_ticks:
      009A84 5F 4B 04         [ 2] 5258 	ldw x,ticks 
      009A87 A6 84            [ 1] 5259 	ld a,#TK_INTGR
      009A87 4F               [ 4] 5260 	ret 
                                   5261 
                                   5262 
                                   5263 
                                   5264 ;------------------------------
                                   5265 ; BASIC: ABS(expr)
                                   5266 ; return absolute value of expr.
                                   5267 ; input:
                                   5268 ;   none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5269 ; output:
                                   5270 ;   X     	positive integer
                                   5271 ;-------------------------------
      001CEC                       5272 abs:
      009A88 CD 81 71         [ 4] 5273 	call func_args 
      009A8B 5C 0A            [ 1] 5274 	cp a,#1 
      009A8D 01 26            [ 1] 5275 	jreq 0$ 
      009A8F F7 84 1E         [ 2] 5276 	jp syntax_error
      001CF6                       5277 0$:  
      009A92 01               [ 2] 5278     popw x   
      009A93 CD               [ 1] 5279 	ld a,xh 
      009A94 89 A4            [ 1] 5280 	bcp a,#0x80 
      009A96 5B 04            [ 1] 5281 	jreq 2$ 
      009A98 81               [ 2] 5282 	negw x 
      009A99 A6 84            [ 1] 5283 2$: ld a,#TK_INTGR 
      009A99 CD               [ 4] 5284 	ret 
                                   5285 
                                   5286 ;------------------------------
                                   5287 ; BASIC: AND(expr1,expr2)
                                   5288 ; Apply bit AND relation between
                                   5289 ; the 2 arguments, i.e expr1 & expr2 
                                   5290 ; output:
                                   5291 ; 	A 		TK_INTGR
                                   5292 ;   X 		result 
                                   5293 ;------------------------------
      001D00                       5294 bit_and:
      009A9A 99 23 CD         [ 4] 5295 	call func_args 
      009A9D 86 81            [ 1] 5296 	cp a,#2
      009A9F 5F 92            [ 1] 5297 	jreq 1$
      009AA1 AF 00 17         [ 2] 5298 	jp syntax_error 
      009AA4 90               [ 2] 5299 1$:	popw x 
      009AA5 95               [ 1] 5300 	ld a,xh 
      009AA6 5C 92            [ 1] 5301 	and a,(1,sp)
      009AA8 AF               [ 1] 5302 	ld xh,a 
      009AA9 00               [ 1] 5303 	ld a,xl
      009AAA 17 5C            [ 1] 5304 	and a,(2,sp)
      009AAC 90               [ 1] 5305 	ld xl,a 
      001D13                       5306 	_drop 2 
      009AAD 97 72            [ 2]    1     addw sp,#2 
      009AAF B9 00            [ 1] 5307 	ld a,#TK_INTGR
      009AB1 1D               [ 4] 5308 	ret
                                   5309 
                                   5310 ;------------------------------
                                   5311 ; BASIC: OR(expr1,expr2)
                                   5312 ; Apply bit OR relation between
                                   5313 ; the 2 arguments, i.e expr1 | expr2 
                                   5314 ; output:
                                   5315 ; 	A 		TK_INTGR
                                   5316 ;   X 		result 
                                   5317 ;------------------------------
      001D18                       5318 bit_or:
      009AB2 90 CF 00         [ 4] 5319 	call func_args 
      009AB5 1F 90            [ 1] 5320 	cp a,#2
      009AB7 CE 00            [ 1] 5321 	jreq 1$
      009AB9 1D 07 95         [ 2] 5322 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009ABA                       5323 1$: 
      009ABA 92               [ 2] 5324 	popw x 
      009ABB AF               [ 1] 5325 	ld a,xh 
      009ABC 00 17            [ 1] 5326 	or a,(1,sp)
      009ABE 90               [ 1] 5327 	ld xh,a 
      009ABF F7               [ 1] 5328 	ld a,xl 
      009AC0 5C 90            [ 1] 5329 	or a,(2,sp)
      009AC2 5C               [ 1] 5330 	ld xl,a 
      001D2B                       5331 	_drop 2 
      009AC3 90 C3            [ 2]    1     addw sp,#2 
      009AC5 00 1F            [ 1] 5332 	ld a,#TK_INTGR 
      009AC7 2B               [ 4] 5333 	ret
                                   5334 
                                   5335 ;------------------------------
                                   5336 ; BASIC: XOR(expr1,expr2)
                                   5337 ; Apply bit XOR relation between
                                   5338 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5339 ; output:
                                   5340 ; 	A 		TK_INTGR
                                   5341 ;   X 		result 
                                   5342 ;------------------------------
      001D30                       5343 bit_xor:
      009AC8 F1 81 89         [ 4] 5344 	call func_args 
      009ACA A1 02            [ 1] 5345 	cp a,#2
      009ACA 72 01            [ 1] 5346 	jreq 1$
      009ACC 00 24 07         [ 2] 5347 	jp syntax_error 
      001D3A                       5348 1$: 
      009ACF 27               [ 2] 5349 	popw x 
      009AD0 05               [ 1] 5350 	ld a,xh 
      009AD1 A6 07            [ 1] 5351 	xor a,(1,sp)
      009AD3 CC               [ 1] 5352 	ld xh,a 
      009AD4 88               [ 1] 5353 	ld a,xl 
      009AD5 17 02            [ 1] 5354 	xor a,(2,sp)
      009AD6 97               [ 1] 5355 	ld xl,a 
      001D43                       5356 	_drop 2 
      009AD6 CD 89            [ 2]    1     addw sp,#2 
      009AD8 07 A1            [ 1] 5357 	ld a,#TK_INTGR 
      009ADA 02               [ 4] 5358 	ret 
                                   5359 
                                   5360 ;------------------------------
                                   5361 ; BASIC: LSHIFT(expr1,expr2)
                                   5362 ; logical shift left expr1 by 
                                   5363 ; expr2 bits 
                                   5364 ; output:
                                   5365 ; 	A 		TK_INTGR
                                   5366 ;   X 		result 
                                   5367 ;------------------------------
      001D48                       5368 lshift:
      009ADB 27 03 CC         [ 4] 5369 	call func_args
      009ADE 88 15            [ 1] 5370 	cp a,#2 
      009AE0 90 93            [ 1] 5371 	jreq 1$
      009AE2 CD 99 8F         [ 2] 5372 	jp syntax_error
      009AE5 25 05            [ 2] 5373 1$: popw y   
      009AE7 A6               [ 2] 5374 	popw x 
      009AE8 09 CC            [ 2] 5375 	tnzw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009AEA 88 17            [ 1] 5376 	jreq 4$
      009AEC 58               [ 2] 5377 2$:	sllw x 
      009AEC CD 9A            [ 2] 5378 	decw y 
      009AEE 99 CE            [ 1] 5379 	jrne 2$
      001D5E                       5380 4$:  
      009AF0 00 1F            [ 1] 5381 	ld a,#TK_INTGR
      009AF2 72               [ 4] 5382 	ret
                                   5383 
                                   5384 ;------------------------------
                                   5385 ; BASIC: RSHIFT(expr1,expr2)
                                   5386 ; logical shift right expr1 by 
                                   5387 ; expr2 bits.
                                   5388 ; output:
                                   5389 ; 	A 		TK_INTGR
                                   5390 ;   X 		result 
                                   5391 ;------------------------------
      001D61                       5392 rshift:
      009AF3 B0 00 1D         [ 4] 5393 	call func_args
      009AF6 CD 89            [ 1] 5394 	cp a,#2 
      009AF8 A4 81            [ 1] 5395 	jreq 1$
      009AFA CC 07 95         [ 2] 5396 	jp syntax_error
      009AFA CD 89            [ 2] 5397 1$: popw y  
      009AFC 07               [ 2] 5398 	popw x
      009AFD A1 00            [ 2] 5399 	tnzw y 
      009AFF 27 20            [ 1] 5400 	jreq 4$
      009B01 A1               [ 2] 5401 2$:	srlw x 
      009B02 02 27            [ 2] 5402 	decw y 
      009B04 03 CC            [ 1] 5403 	jrne 2$
      001D77                       5404 4$:  
      009B06 88 15            [ 1] 5405 	ld a,#TK_INTGR
      009B08 90               [ 4] 5406 	ret
                                   5407 
                                   5408 ;--------------------------
                                   5409 ; BASIC: FCPU integer
                                   5410 ; set CPU frequency 
                                   5411 ;-------------------------- 
                                   5412 
      001D7A                       5413 fcpu:
      009B09 93 55            [ 1] 5414 	ld a,#TK_INTGR
      009B0B 00 04 00         [ 4] 5415 	call expect 
      009B0E 02               [ 1] 5416 	ld a,xl 
      009B0F CD 99            [ 1] 5417 	and a,#7 
      009B11 8F 25 05         [ 1] 5418 	ld CLK_CKDIVR,a 
      009B14 A6               [ 4] 5419 	ret 
                                   5420 
                                   5421 ;------------------------------
                                   5422 ; BASIC: PMODE pin#, mode 
                                   5423 ; Arduino pin. 
                                   5424 ; define pin as input or output
                                   5425 ; pin#: {0..15}
                                   5426 ; mode: INPUT|OUTPUT  
                                   5427 ;------------------------------
                           000001  5428 	PINNO=1
                           000001  5429 	VSIZE=1
      001D86                       5430 pin_mode:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      001D86                       5431 	_vars VSIZE 
      009B15 09 CC            [ 2]    1     sub sp,#VSIZE 
      009B17 88 17 8E         [ 4] 5432 	call arg_list 
      009B19 A1 02            [ 1] 5433 	cp a,#2 
      009B19 CE 00            [ 1] 5434 	jreq 1$
      009B1B 17 C6 00         [ 2] 5435 	jp syntax_error 
      009B1E 19 20            [ 2] 5436 1$: popw y ; mode 
      009B20 0A               [ 2] 5437 	popw x ; Dx pin 
      009B21 CD 1D C7         [ 4] 5438 	call select_pin 
      009B21 AE 01            [ 1] 5439 	ld (PINNO,sp),a  
      009B23 00 4F            [ 1] 5440 	ld a,#1 
      009B25 CF 00            [ 1] 5441 	tnz (PINNO,sp)
      009B27 17 C7            [ 1] 5442 	jreq 4$
      009B29 00               [ 1] 5443 2$:	sll a 
      009B2A 19 01            [ 1] 5444 	dec (PINNO,sp)
      009B2B 26 FB            [ 1] 5445 	jrne 2$ 
      009B2B CF 00            [ 1] 5446 	ld (PINNO,sp),a
      009B2D 1A C7            [ 1] 5447 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009B2F 00 1C            [ 1] 5448 	ld (GPIO_CR1,x),a 
      009B31 4B 04 5F 01      [ 2] 5449 4$:	cpw y,#OUTP 
      009B34 27 07            [ 1] 5450 	jreq 6$
                                   5451 ; input mode
      009B34 4F CD            [ 1] 5452 	ld a,(PINNO,sp)
      009B36 81               [ 1] 5453 	cpl a 
      009B37 71 5C            [ 1] 5454 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009B39 0A 01            [ 2] 5455 	jra 9$
      001DB8                       5456 6$: ;output mode  
      009B3B 26 F7            [ 1] 5457 	ld a,(PINNO,sp)
      009B3D 84 81            [ 1] 5458 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009B3F E7 04            [ 1] 5459 	ld (GPIO_CR2,x),a 
      009B3F 52 02            [ 1] 5460 	ld a,(PINNO,sp)
      009B41 5F 1F            [ 1] 5461 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009B43 01 CF            [ 1] 5462 9$:	ld (GPIO_DDR,x),a 
      001DC4                       5463 	_drop VSIZE 
      009B45 00 18            [ 2]    1     addw sp,#VSIZE 
      009B47 35               [ 4] 5464 	ret
                                   5465 
                                   5466 ;------------------------
                                   5467 ; select Arduino pin 
                                   5468 ; input:
                                   5469 ;   X 	 {0..15} Arduino Dx 
                                   5470 ; output:
                                   5471 ;   A     stm8s208 pin 
                                   5472 ;   X     base address s208 GPIO port 
                                   5473 ;---------------------------
      001DC7                       5474 select_pin:
      009B48 01               [ 2] 5475 	sllw x 
      009B49 00 17 D7         [ 2] 5476 	addw x,#arduino_to_8s208 
      009B4B FE               [ 2] 5477 	ldw x,(x)
      009B4B 5F               [ 1] 5478 	ld a,xl 
      009B4C 92               [ 1] 5479 	push a 
      009B4D AF               [ 1] 5480 	swapw x 
      009B4E 00 17            [ 1] 5481 	ld a,#5 
      009B50 27               [ 4] 5482 	mul x,a 
      009B51 39 50 00         [ 2] 5483 	addw x,#GPIO_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009B52 84               [ 1] 5484 	pop a 
      009B52 92               [ 4] 5485 	ret 
                                   5486 ; translation from Arduino D0..D15 to stm8s208rb 
      001DD7                       5487 arduino_to_8s208:
      009B53 AF 00                 5488 .byte 3,6 ; D0 
      009B55 17 27                 5489 .byte 3,5 ; D1 
      009B57 06 CD                 5490 .byte 4,0 ; D2 
      009B59 82 44                 5491 .byte 2,1 ; D3
      009B5B 5C 20                 5492 .byte 6,0 ; D4
      009B5D F4 5C                 5493 .byte 2,2 ; D5
      009B5F A6 20                 5494 .byte 2,3 ; D6
      009B61 CD 82                 5495 .byte 3,1 ; D7
      009B63 44 92                 5496 .byte 3,3 ; D8
      009B65 AF 00                 5497 .byte 2,4 ; D9
      009B67 17 90                 5498 .byte 4,5 ; D10
      009B69 95 5C                 5499 .byte 2,6 ; D11
      009B6B 92 AF                 5500 .byte 2,7 ; D12
      009B6D 00 17                 5501 .byte 2,5 ; D13
      009B6F 5C 90                 5502 .byte 4,2 ; D14
      009B71 97 90                 5503 .byte 4,1 ; D15
                                   5504 
                                   5505 
                                   5506 ;------------------------------
                                   5507 ; BASIC: RND(expr)
                                   5508 ; return random number 
                                   5509 ; between 1 and expr inclusive
                                   5510 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5511 ; input:
                                   5512 ; 	none 
                                   5513 ; output:
                                   5514 ;	X 		random positive integer 
                                   5515 ;------------------------------
      001DF7                       5516 random:
      009B73 89 72 FB         [ 4] 5517 	call func_args 
      009B76 01 5C            [ 1] 5518 	cp a,#1
      009B78 CD 99            [ 1] 5519 	jreq 1$
      009B7A 23 85 CD         [ 2] 5520 	jp syntax_error
      001E01                       5521 1$:  
      009B7D 89 A4            [ 1] 5522 	ld a,#0x80 
      009B7F A6 0D            [ 1] 5523 	bcp a,(1,sp)
      009B81 CD 82            [ 1] 5524 	jreq 2$
      009B83 44 1E            [ 1] 5525 	ld a,#ERR_BAD_VALUE
      009B85 01 5C 1F         [ 2] 5526 	jp tb_error
      001E0C                       5527 2$: 
                                   5528 ; acc16=(x<<5)^x 
      009B88 01 20 C0         [ 2] 5529 	ldw x,seedx 
      009B8B 58               [ 2] 5530 	sllw x 
      009B8B 1E               [ 2] 5531 	sllw x 
      009B8C 01               [ 2] 5532 	sllw x 
      009B8D CD               [ 2] 5533 	sllw x 
      009B8E 89               [ 2] 5534 	sllw x 
      009B8F A4               [ 1] 5535 	ld a,xh 
      009B90 AE 9B C0         [ 1] 5536 	xor a,seedx 
      009B93 CD 82 57         [ 1] 5537 	ld acc16,a 
      009B96 A6               [ 1] 5538 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009B97 FF C0 00         [ 1] 5539 	xor a,seedx+1 
      009B9A 1C C7 00         [ 1] 5540 	ld acc8,a 
                                   5541 ; seedx=seedy 
      009B9D 0E A6 7F         [ 2] 5542 	ldw x,seedy 
      009BA0 C2 00 1B         [ 2] 5543 	ldw seedx,x  
                                   5544 ; seedy=seedy^(seedy>>1)
      009BA3 C7 00            [ 2] 5545 	srlw y 
      009BA5 0D A6            [ 1] 5546 	ld a,yh 
      009BA7 02 C2 00         [ 1] 5547 	xor a,seedy 
      009BAA 1A C7 00         [ 1] 5548 	ld seedy,a  
      009BAD 0C 5F            [ 1] 5549 	ld a,yl 
      009BAF A6 06 97         [ 1] 5550 	xor a,seedy+1 
      009BB2 A6 0A CD         [ 1] 5551 	ld seedy+1,a 
                                   5552 ; acc16>>3 
      009BB5 89 5C AE         [ 2] 5553 	ldw x,acc16 
      009BB8 9B               [ 2] 5554 	srlw x 
      009BB9 C8               [ 2] 5555 	srlw x 
      009BBA CD               [ 2] 5556 	srlw x 
                                   5557 ; x=acc16^x 
      009BBB 82               [ 1] 5558 	ld a,xh 
      009BBC 57 5B 02         [ 1] 5559 	xor a,acc16 
      009BBF 81               [ 1] 5560 	ld xh,a 
      009BC0 20               [ 1] 5561 	ld a,xl 
      009BC1 66 69 6C         [ 1] 5562 	xor a,acc8 
      009BC4 65               [ 1] 5563 	ld xl,a 
                                   5564 ; seedy=x^seedy 
      009BC5 73 0A 00         [ 1] 5565 	xor a,seedy+1
      009BC8 20               [ 1] 5566 	ld xl,a 
      009BC9 62               [ 1] 5567 	ld a,xh 
      009BCA 79 74 65         [ 1] 5568 	xor a,seedy
      009BCD 73               [ 1] 5569 	ld xh,a 
      009BCE 20 66 72         [ 2] 5570 	ldw seedy,x 
                                   5571 ; return seedy modulo expr + 1 
      009BD1 65 65            [ 2] 5572 	popw y 
      009BD3 0A               [ 2] 5573 	divw x,y 
      009BD4 00               [ 1] 5574 	ldw x,y 
      009BD5 5C               [ 2] 5575 	incw x 
      001E5B                       5576 10$:
      009BD5 52 02            [ 1] 5577 	ld a,#TK_INTGR
      009BD7 72               [ 4] 5578 	ret 
                                   5579 
                                   5580 ;---------------------------------
                                   5581 ; BASIC: WORDS 
                                   5582 ; affiche la listes des mots du
                                   5583 ; dictionnaire ainsi que le nombre
                                   5584 ; de mots.
                                   5585 ;---------------------------------
                           000001  5586 	WLEN=1 ; word length
                           000002  5587 	LLEN=2 ; character sent to console
                           000003  5588 	WCNT=3 ; count words printed 
                           000003  5589 	VSIZE=3 
      001E5E                       5590 words:
      001E5E                       5591 	_vars VSIZE
      009BD8 5F 00            [ 2]    1     sub sp,#VSIZE 
      009BDA 17 CD            [ 1] 5592 	clr (LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009BDC 91 07            [ 1] 5593 	clr (WCNT,sp)
      009BDE A1 84 27 03      [ 2] 5594 	ldw y,#kword_dict+2
      009BE2 CC               [ 1] 5595 0$:	ldw x,y
      009BE3 88               [ 1] 5596 	ld a,(x)
      009BE4 15 1F            [ 1] 5597 	and a,#15 
      009BE6 01 CD            [ 1] 5598 	ld (WLEN,sp),a 
      009BE8 89 07            [ 1] 5599 	inc (WCNT,sp)
      009BEA A1               [ 2] 5600 1$:	incw x 
      009BEB 09               [ 1] 5601 	ld a,(x)
      009BEC 27 02 20         [ 4] 5602 	call putc 
      009BEF 19 CD            [ 1] 5603 	inc (LLEN,sp)
      009BF1 91 07            [ 1] 5604 	dec (WLEN,sp)
      009BF3 A1 84            [ 1] 5605 	jrne 1$
      009BF5 27 03            [ 1] 5606 	ld a,#70
      009BF7 CC 88            [ 1] 5607 	cp a,(LLEN,sp)
      009BF9 15 9F            [ 1] 5608 	jrmi 2$   
      009BFB 1E 01            [ 1] 5609 	ld a,#SPACE 
      009BFD CF 00 18         [ 4] 5610 	call putc 
      009C00 5F CD            [ 1] 5611 	inc (LLEN,sp) 
      009C02 81 71            [ 2] 5612 	jra 3$
      009C04 1E 01            [ 1] 5613 2$: ld a,#CR 
      009C06 5C 20 DC         [ 4] 5614 	call putc 
      009C09 0F 02            [ 1] 5615 	clr (LLEN,sp)
      009C09 5B 02 81 02      [ 2] 5616 3$:	subw y,#2 
      009C0C 90 FE            [ 2] 5617 	ldw y,(y)
      009C0C CD 90            [ 1] 5618 	jrne 0$ 
      009C0E 09 A1            [ 1] 5619 	ld a,#CR 
      009C10 01 27 03         [ 4] 5620 	call putc  
      009C13 CC               [ 1] 5621 	clrw x 
      009C14 88 15            [ 1] 5622 	ld a,(WCNT,sp)
      009C16 85               [ 1] 5623 	ld xl,a 
      009C17 9F A4 7F         [ 4] 5624 	call print_int 
      009C1A 97 A6 03         [ 2] 5625 	ldw x,#words_count_msg
      009C1D 81 01 D7         [ 4] 5626 	call puts 
      009C1E                       5627 	_drop VSIZE 
      009C1E A6 07            [ 2]    1     addw sp,#VSIZE 
      009C20 CD               [ 4] 5628 	ret 
      009C21 8F FC CD 89 07 A1 02  5629 words_count_msg: .asciz " words in dictionary\n"
             27 07 A1 03 27 06 CC
             88 15 6E 61 72 79 0A
             00
                                   5630 
                                   5631 
                                   5632 ;-----------------------------
                                   5633 ; BASIC: TIMER expr 
                                   5634 ; initialize count down timer 
                                   5635 ;-----------------------------
      009C31                       5636 set_timer:
      009C31 F6 5F 97         [ 4] 5637 	call arg_list
      009C34 A1 01            [ 1] 5638 	cp a,#1 
      009C34 89 A6            [ 1] 5639 	jreq 1$
      009C36 08 CD 8F         [ 2] 5640 	jp syntax_error
      001ECE                       5641 1$: 
      009C39 FC               [ 2] 5642 	popw x 
      009C3A 85 A6 84         [ 2] 5643 	ldw timer,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C3D 81               [ 4] 5644 	ret 
                                   5645 
                                   5646 ;------------------------------
                                   5647 ; BASIC: TIMEOUT 
                                   5648 ; return state of timer 
                                   5649 ;------------------------------
      009C3E                       5650 timeout:
      009C3E CD 82 4D         [ 2] 5651 	ldw x,timer 
      001ED6                       5652 logical_complement:
      009C41 5F               [ 2] 5653 	cplw x 
      009C42 97 A6 84         [ 2] 5654 	cpw x,#-1
      009C45 81 01            [ 1] 5655 	jreq 2$
      009C46 5F               [ 1] 5656 	clrw x 
      009C46 5F 72            [ 1] 5657 2$:	ld a,#TK_INTGR
      009C48 5D               [ 4] 5658 	ret 
                                   5659 
                                   5660 ;--------------------------------
                                   5661 ; BASIC NOT(expr) 
                                   5662 ; return logical complement of expr
                                   5663 ;--------------------------------
      001EE0                       5664 func_not:
      009C49 00 26 27         [ 4] 5665 	call func_args  
      009C4C 01 53            [ 1] 5666 	cp a,#1
      009C4E A6 84            [ 1] 5667 	jreq 1$
      009C50 81 07 95         [ 2] 5668 	jp syntax_error
      009C51 85               [ 2] 5669 1$:	popw x 
      009C51 CD 90            [ 2] 5670 	jra logical_complement
                                   5671 
                                   5672 
                                   5673 
                                   5674 ;-----------------------------------
                                   5675 ; BASIC: IWDGEN expr1 
                                   5676 ; enable independant watchdog timer
                                   5677 ; expr1 is delay in multiple of 62.5µsec
                                   5678 ; expr1 -> {1..16383}
                                   5679 ;-----------------------------------
      001EED                       5680 enable_iwdg:
      009C53 09 A1 02         [ 4] 5681 	call arg_list
      009C56 27 03            [ 1] 5682 	cp a,#1 
      009C58 CC 88            [ 1] 5683 	jreq 1$
      009C5A 15 07 95         [ 2] 5684 	jp syntax_error 
      009C5B 85               [ 2] 5685 1$: popw x 
      009C5B 1E 03            [ 1] 5686 	push #0
      009C5D 2B 17 A3 00      [ 1] 5687 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009C61 09               [ 1] 5688 	ld a,xh 
      009C62 2A 12            [ 1] 5689 	and a,#0x3f
      009C64 A6               [ 1] 5690 	ld xh,a  
      009C65 05 42 1C         [ 2] 5691 2$:	cpw x,#255
      009C68 50 00            [ 2] 5692 	jrule 3$
      009C6A 1F 03            [ 1] 5693 	inc (1,sp)
      009C6C 1E               [ 1] 5694 	rcf 
      009C6D 01               [ 2] 5695 	rrcw x 
      009C6E 72 FB            [ 2] 5696 	jra 2$
      009C70 03 A6 84 5B      [ 1] 5697 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C74 04               [ 1] 5698 	pop a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009C75 81 50 E1         [ 1] 5699 	ld IWDG_PR,a 
      009C76 9F               [ 1] 5700 	ld a,xl
      009C76 A6               [ 1] 5701 	dec a 
      009C77 0A CC 88 17      [ 1] 5702 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C7B C7 50 E2         [ 1] 5703 	ld IWDG_RLR,a 
      009C7B AE A6 80 A6      [ 1] 5704 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009C7F 84               [ 4] 5705 	ret 
                                   5706 
                                   5707 
                                   5708 ;-----------------------------------
                                   5709 ; BASIC: IWDGREF  
                                   5710 ; refresh independant watchdog count down 
                                   5711 ; timer before it reset MCU. 
                                   5712 ;-----------------------------------
      001F23                       5713 refresh_iwdg:
      009C80 81 AA 50 E0      [ 1] 5714 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009C81 81               [ 4] 5715 	ret 
                                   5716 
                                   5717 
                                   5718 ;-------------------------------------
                                   5719 ; BASIC: LOG(expr)
                                   5720 ; return logarithm base 2 of expr 
                                   5721 ; this is the position of most significant
                                   5722 ; bit set. 
                                   5723 ; input: 
                                   5724 ; output:
                                   5725 ;   X     log2 
                                   5726 ;   A     TK_INTGR 
                                   5727 ;*********************************
      001F28                       5728 log2:
      009C81 90 89 CD         [ 4] 5729 	call func_args 
      009C84 90 09            [ 1] 5730 	cp a,#1 
      009C86 A1 01            [ 1] 5731 	jreq 1$
      009C88 27 07 A1         [ 2] 5732 	jp syntax_error 
      009C8B 02               [ 2] 5733 1$: popw x 
      001F33                       5734 leading_one:
      009C8C 27               [ 2] 5735 	tnzw x 
      009C8D 03 CC            [ 1] 5736 	jreq 4$
      009C8F 88 15            [ 1] 5737 	ld a,#15 
      009C91 90               [ 2] 5738 2$: rlcw x 
      009C92 85 A1            [ 1] 5739     jrc 3$
      009C94 01               [ 1] 5740 	dec a 
      009C95 27 02            [ 2] 5741 	jra 2$
      009C97 85               [ 1] 5742 3$: clrw x 
      009C98 51               [ 1] 5743     ld xl,a
      009C99 90 FD            [ 1] 5744 4$:	ld a,#TK_INTGR
      009C9B 90               [ 4] 5745 	ret 
                                   5746 
                                   5747 ;-----------------------------------
                                   5748 ; BASIC: BIT(expr) 
                                   5749 ; expr ->{0..15}
                                   5750 ; return 2^expr 
                                   5751 ; output:
                                   5752 ;    x    2^expr 
                                   5753 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      001F43                       5754 bitmask:
      009C9C 85 81 89         [ 4] 5755     call func_args 
      009C9E A1 01            [ 1] 5756 	cp a,#1
      009C9E 72 0D            [ 1] 5757 	jreq 1$
      009CA0 52 30 FB         [ 2] 5758 	jp syntax_error 
      009CA3 8E               [ 2] 5759 1$: popw x 
      009CA4 CC               [ 1] 5760 	ld a,xl 
      009CA5 85 6F            [ 1] 5761 	and a,#15
      009CA7 5F               [ 1] 5762 	clrw x 
      009CA7 72               [ 2] 5763 	incw x 
      009CA8 01               [ 1] 5764 2$: tnz a 
      009CA9 00 24            [ 1] 5765 	jreq 3$
      009CAB 07               [ 2] 5766 	slaw x 
      009CAC 27               [ 1] 5767 	dec a 
      009CAD 05 A6            [ 2] 5768 	jra 2$ 
      009CAF 07 CC            [ 1] 5769 3$: ld a,#TK_INTGR
      009CB1 88               [ 4] 5770 	ret 
                                   5771 
                                   5772 ;------------------------------
                                   5773 ; BASIC: INVERT(expr)
                                   5774 ; 1's complement 
                                   5775 ;--------------------------------
      001F5D                       5776 invert:
      009CB2 17 0F 89         [ 4] 5777 	call func_args
      009CB3 A1 01            [ 1] 5778 	cp a,#1 
      009CB3 CD 89            [ 1] 5779 	jreq 1$
      009CB5 07 26 08         [ 2] 5780 	jp syntax_error
      009CB8 AE               [ 2] 5781 1$: popw x  
      009CB9 40               [ 2] 5782 	cplw x 
      009CBA 00 CD            [ 1] 5783 	ld a,#TK_INTGR 
      009CBC 82               [ 4] 5784 	ret 
                                   5785 
                                   5786 ;------------------------------
                                   5787 ; BASIC: DO 
                                   5788 ; initiate a DO ... UNTIL loop 
                                   5789 ;------------------------------
                           000003  5790 	DOLP_ADR=3 
                           000005  5791 	DOLP_INW=5
                           000004  5792 	VSIZE=4 
      001F6C                       5793 do_loop:
      009CBD 57               [ 2] 5794 	popw x 
      001F6D                       5795 	_vars VSIZE 
      009CBE 4F 81            [ 2]    1     sub sp,#VSIZE 
      009CC0 89               [ 2] 5796 	pushw x 
      009CC0 A1 02 27 03      [ 2] 5797 	ldw y,basicptr 
      009CC4 CC 88            [ 2] 5798 	ldw (DOLP_ADR,sp),y
      009CC6 15 CE 00 00      [ 2] 5799 	ldw y,in.w 
      009CC7 17 05            [ 2] 5800 	ldw (DOLP_INW,sp),y
      009CC7 7D 26 09 CD      [ 1] 5801 	inc loop_depth 
      009CCB 86               [ 4] 5802 	ret 
                                   5803 
                                   5804 ;--------------------------------
                                   5805 ; BASIC: UNTIL expr 
                                   5806 ; loop if exprssion is false 
                                   5807 ; else terminate loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5808 ;--------------------------------
      001F81                       5809 until: 
      009CCC 34 55 00 04      [ 1] 5810 	tnz loop_depth 
      009CD0 00 02            [ 1] 5811 	jrne 1$ 
      009CD2 81 89 90         [ 2] 5812 	jp syntax_error 
      001F8A                       5813 1$: 
      009CD5 93 CD 99         [ 4] 5814 	call relation 
      009CD8 8F 25            [ 1] 5815 	cp a,#TK_INTGR
      009CDA 05 A6            [ 1] 5816 	jreq 2$
      009CDC 09 CC 88         [ 2] 5817 	jp syntax_error
      001F94                       5818 2$: 
      009CDF 17               [ 2] 5819 	tnzw x 
      009CE0 26 10            [ 1] 5820 	jrne 9$
      009CE0 55 00            [ 2] 5821 	ldw x,(DOLP_ADR,sp)
      009CE2 04 00 02         [ 2] 5822 	ldw basicptr,x 
      009CE5 72 5F            [ 1] 5823 	ld a,(2,x)
      009CE7 00 17 AE         [ 1] 5824 	ld count,a 
      009CEA 40 00            [ 2] 5825 	ldw x,(DOLP_INW,sp)
      009CEC CF 00 18         [ 2] 5826 	ldw in.w,x 
      009CEF 1E               [ 4] 5827 	ret 
      001FA7                       5828 9$:	; remove loop data from stack  
      009CF0 01               [ 2] 5829 	popw x
      001FA8                       5830 	_drop VSIZE
      009CF1 CD 83            [ 2]    1     addw sp,#VSIZE 
      009CF3 36 5C 90 85      [ 1] 5831 	dec loop_depth 
      009CF7 89               [ 2] 5832 	jp (x)
                                   5833 
                                   5834 ;--------------------------
                                   5835 ; BASIC: PRTA...PRTI  
                                   5836 ;  return constant value 
                                   5837 ;  PORT  offset in GPIO
                                   5838 ;  array
                                   5839 ;---------------------------
      001FAF                       5840 const_porta:
      009CF8 5F CD 81         [ 2] 5841 	ldw x,#0
      009CFB E6 5B            [ 1] 5842 	ld a,#TK_INTGR 
      009CFD 02               [ 4] 5843 	ret 
      001FB5                       5844 const_portb:
      009CFE 81 00 01         [ 2] 5845 	ldw x,#1
      009CFF A6 84            [ 1] 5846 	ld a,#TK_INTGR 
      009CFF 72               [ 4] 5847 	ret 
      001FBB                       5848 const_portc:
      009D00 0D 52 30         [ 2] 5849 	ldw x,#2
      009D03 FB 72            [ 1] 5850 	ld a,#TK_INTGR 
      009D05 16               [ 4] 5851 	ret 
      001FC1                       5852 const_portd:
      009D06 00 24 8E         [ 2] 5853 	ldw x,#3
      009D09 81 84            [ 1] 5854 	ld a,#TK_INTGR 
      009D0A 81               [ 4] 5855 	ret 
      001FC7                       5856 const_porte:
      009D0A CD 91 07         [ 2] 5857 	ldw x,#4
      009D0D A1 84            [ 1] 5858 	ld a,#TK_INTGR 
      009D0F 27               [ 4] 5859 	ret 
      001FCD                       5860 const_portf:
      009D10 03 CC 88         [ 2] 5861 	ldw x,#5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D13 15 84            [ 1] 5862 	ld a,#TK_INTGR 
      009D14 81               [ 4] 5863 	ret 
      001FD3                       5864 const_portg:
      009D14 5D 27 04         [ 2] 5865 	ldw x,#6
      009D17 8F 5A            [ 1] 5866 	ld a,#TK_INTGR 
      009D19 26               [ 4] 5867 	ret 
      001FD9                       5868 const_porth:
      009D1A F9 4F 81         [ 2] 5869 	ldw x,#7
      009D1D A6 84            [ 1] 5870 	ld a,#TK_INTGR 
      009D1D CD               [ 4] 5871 	ret 
      001FDF                       5872 const_porti:
      009D1E 91 07 A1         [ 2] 5873 	ldw x,#8
      009D21 84 27            [ 1] 5874 	ld a,#TK_INTGR 
      009D23 03               [ 4] 5875 	ret 
                                   5876 
                                   5877 ;-------------------------------
                                   5878 ; following return constant 
                                   5879 ; related to GPIO register offset 
                                   5880 ;---------------------------------
      001FE5                       5881 const_odr:
      009D24 CC 88            [ 1] 5882 	ld a,#TK_INTGR 
      009D26 15 00 00         [ 2] 5883 	ldw x,#GPIO_ODR
      009D27 81               [ 4] 5884 	ret 
      001FEB                       5885 const_idr:
      009D27 A3 14            [ 1] 5886 	ld a,#TK_INTGR 
      009D29 00 2B 0C         [ 2] 5887 	ldw x,#GPIO_IDR
      009D2C 35               [ 4] 5888 	ret 
      001FF1                       5889 const_ddr:
      009D2D 0F 50            [ 1] 5890 	ld a,#TK_INTGR 
      009D2F F2 A6 1E         [ 2] 5891 	ldw x,#GPIO_DDR
      009D32 62               [ 4] 5892 	ret 
      001FF7                       5893 const_cr1:
      009D33 A6 10            [ 1] 5894 	ld a,#TK_INTGR 
      009D35 62 20 1E         [ 2] 5895 	ldw x,#GPIO_CR1
      009D38 81               [ 4] 5896 	ret 
      001FFD                       5897 const_cr2:
      009D38 A3 08            [ 1] 5898 	ld a,#TK_INTGR 
      009D3A 00 2B 09         [ 2] 5899 	ldw x,#GPIO_CR2
      009D3D 35               [ 4] 5900 	ret 
                                   5901 ;-------------------------
                                   5902 ;  constant for port mode
                                   5903 ;  used by PMODE 
                                   5904 ;  input or output
                                   5905 ;------------------------
      002003                       5906 const_output:
      009D3E 0E 50            [ 1] 5907 	ld a,#TK_INTGR 
      009D40 F2 A6 50         [ 2] 5908 	ldw x,#OUTP
      009D43 62               [ 4] 5909 	ret 
      002009                       5910 const_input:
      009D44 20 10            [ 1] 5911 	ld a,#TK_INTGR 
      009D46 AE 00 00         [ 2] 5912 	ldw x,#INP 
      009D46 35               [ 4] 5913 	ret 
                                   5914 ;-----------------------
                                   5915 ; memory area constants
                                   5916 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00200F                       5917 const_eeprom_base:
      009D47 07 50            [ 1] 5918 	ld a,#TK_INTGR 
      009D49 F2 40 00         [ 2] 5919 	ldw x,#EEPROM_BASE 
      009D4A 81               [ 4] 5920 	ret 
                                   5921 
                                   5922 ;---------------------------
                                   5923 ; BASIC: DATA 
                                   5924 ; when the interpreter find 
                                   5925 ; a DATA line it skip it.
                                   5926 ;---------------------------
      002015                       5927 data:
      009D4A A3 00 40 23 07   [ 1] 5928 	mov in,count 
      009D4F 72               [ 4] 5929 	ret 
                                   5930 
                                   5931 ;---------------------------
                                   5932 ; BASIC: DATLN  *expr*
                                   5933 ; set DATA pointer at line# 
                                   5934 ; specified by *expr* 
                                   5935 ;---------------------------
      00201B                       5936 data_line:
      009D50 5C 50 F2         [ 4] 5937 	call expression
      009D53 54 20            [ 1] 5938 	cp a,#TK_INTGR
      009D55 F4 03            [ 1] 5939 	jreq 1$
      009D56 CC 07 95         [ 2] 5940 	jp syntax_error 
      009D56 9F 4A 27         [ 4] 5941 1$: call search_lineno
      009D59 01               [ 2] 5942 	tnzw x 
      009D5A 4A 05            [ 1] 5943 	jrne 3$
      009D5B A6 05            [ 1] 5944 2$:	ld a,#ERR_NO_LINE 
      009D5B A4 3E C7         [ 2] 5945 	jp tb_error
      002030                       5946 3$: ; check if valid data line 
      009D5E 50 F1            [ 1] 5947     ldw y,x 
      009D60 72 18            [ 2] 5948 	ldw x,(4,x)
      009D62 50 F0 8E         [ 2] 5949 	cpw x,#data 
      009D65 81 F2            [ 1] 5950 	jrne 2$ 
      009D66 90 CF 00 06      [ 2] 5951 	ldw data_ptr,y
      009D66 CE 00 0F         [ 1] 5952 	ld a,(2,y)
      009D69 A6 84 81         [ 1] 5953 	ld data_len,a 
      009D6C 35 06 00 08      [ 1] 5954 	mov data_ofs,#FIRST_DATA_ITEM 
      009D6C CD               [ 4] 5955 	ret
                                   5956 
                                   5957 ;---------------------------------
                                   5958 ; BASIC: RESTORE 
                                   5959 ; set data_ptr to first data line
                                   5960 ; if not DATA found pointer set to
                                   5961 ; zero 
                                   5962 ;---------------------------------
      002048                       5963 restore:
      009D6D 90 09 A1 01      [ 1] 5964 	clr data_ptr 
      009D71 27 03 CC 88      [ 1] 5965 	clr data_ptr+1
      009D75 15 5F 00 08      [ 1] 5966 	clr data_ofs 
      009D76 72 5F 00 09      [ 1] 5967 	clr data_len
      009D76 85 9E A5         [ 2] 5968 	ldw x,txtbgn
      00205B                       5969 data_search_loop: 	
      009D79 80 27 01         [ 2] 5970 	cpw x,txtend
      009D7C 50 A6            [ 1] 5971 	jruge 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009D7E 84 81            [ 1] 5972 	ldw y,x 
      009D80 EE 04            [ 2] 5973 	ldw x,(4,x)
      009D80 CD 90 09         [ 2] 5974 	cpw x,#data 
      009D83 A1 02            [ 1] 5975 	jrne try_next_line 
      009D85 27 03 CC 88      [ 2] 5976 	ldw data_ptr,y 
      009D89 15 85 9E         [ 1] 5977 	ld a,(2,y)
      009D8C 14 01 95         [ 1] 5978 	ld data_len,a 
      009D8F 9F 14 02 97      [ 1] 5979 	mov data_ofs,#FIRST_DATA_ITEM
      009D93 5B 02 A6 84      [ 1] 5980 9$:	tnz data_len 
      009D97 81 05            [ 1] 5981     jrne 10$
      009D98 A6 0C            [ 1] 5982 	ld a,#ERR_NO_DATA 
      009D98 CD 90 09         [ 2] 5983 	jp tb_error 
      009D9B A1               [ 4] 5984 10$:ret
      002083                       5985 try_next_line:
      009D9C 02               [ 1] 5986 	ldw x,y 
      009D9D 27 03            [ 1] 5987 	ld a,(2,x)
      009D9F CC 88 15         [ 1] 5988 	ld acc8,a 
      009DA2 72 5F 00 0C      [ 1] 5989 	clr acc16 
      009DA2 85 9E 1A 01      [ 2] 5990 	addw x,acc16 
      009DA6 95 9F            [ 2] 5991 	jra data_search_loop
                                   5992 
                                   5993 
                                   5994 ;---------------------------------
                                   5995 ; BASIC: READ 
                                   5996 ; return next data item | 0 
                                   5997 ;---------------------------------
                           000001  5998 	CTX_BPTR=1 
                           000003  5999 	CTX_IN=3 
                           000004  6000 	CTX_COUNT=4 
                           000005  6001 	XSAVE=5
                           000006  6002 	VSIZE=6
      002093                       6003 read:
      002093                       6004 	_vars  VSIZE 
      009DA8 1A 02            [ 2]    1     sub sp,#VSIZE 
      002095                       6005 read01:	
      009DAA 97 5B 02         [ 1] 6006 	ld a,data_ofs
      009DAD A6 84 81         [ 1] 6007 	cp a,data_len 
      009DB0 27 37            [ 1] 6008 	jreq 2$ ; end of line  
      009DB0 CD 90 09         [ 4] 6009 	call save_context
      009DB3 A1 02 27         [ 2] 6010 	ldw x,data_ptr 
      009DB6 03 CC 88         [ 2] 6011 	ldw basicptr,x 
      009DB9 15 00 08 00 01   [ 1] 6012 	mov in,data_ofs 
      009DBA 55 00 09 00 03   [ 1] 6013 	mov count,data_len  
      009DBA 85 9E 18         [ 4] 6014 	call expression 
      009DBD 01 95            [ 1] 6015 	cp a,#TK_INTGR 
      009DBF 9F 18            [ 1] 6016 	jreq 1$ 
      009DC1 02 97 5B         [ 2] 6017 	jp syntax_error 
      0020BA                       6018 1$:
      009DC4 02 A6            [ 2] 6019 	ldw (XSAVE,SP),x
      009DC6 84 81 87         [ 4] 6020 	call next_token ; skip comma
      009DC8 CE 00 04         [ 2] 6021 	ldw x,basicptr 
      009DC8 CD 90 09         [ 2] 6022 	ldw data_ptr,x 
      009DCB A1 02 27 03 CC   [ 1] 6023 	mov data_ofs,in 
      009DD0 88 15 90         [ 4] 6024 	call rest_context
      009DD3 85 85            [ 2] 6025 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009DD5 90 5D            [ 1] 6026 	ld a,#TK_INTGR
      0020D1                       6027 	_drop VSIZE 
      009DD7 27 05            [ 2]    1     addw sp,#VSIZE 
      009DD9 58               [ 4] 6028 	ret 
      0020D4                       6029 2$: ; end of line reached 
      009DDA 90 5A 26 FB      [ 2] 6030 	ldw y, data_ptr 
      009DDE 72 5F 00 06      [ 1] 6031 	clr data_ptr
      009DDE A6 84 81 07      [ 1] 6032 	clr data_ptr+1   
      009DE1 72 5F 00 08      [ 1] 6033 	clr data_ofs 
      009DE1 CD 90 09 A1      [ 1] 6034 	clr data_len 
      009DE5 02 27 03         [ 4] 6035 	call try_next_line 
      009DE8 CC 88            [ 2] 6036 	jra read01
                                   6037 
                                   6038 
                                   6039 ;---------------------------------
                                   6040 ; BASIC: SPIEN clkdiv, 0|1  
                                   6041 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6042 ; if clkdiv==-1 disable SPI
                                   6043 ; 0|1 -> disable|enable  
                                   6044 ;--------------------------------- 
                           000005  6045 SPI_CS_BIT=5
      0020ED                       6046 spi_enable:
      009DEA 15 90 85         [ 4] 6047 	call arg_list 
      009DED 85 90            [ 1] 6048 	cp a,#2
      009DEF 5D 27            [ 1] 6049 	jreq 1$
      009DF1 05 54 90         [ 2] 6050 	jp syntax_error 
      0020F7                       6051 1$: 
      009DF4 5A 26 FB C7      [ 1] 6052 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009DF7 85               [ 2] 6053 	popw x  
      009DF7 A6               [ 2] 6054 	tnzw x 
      009DF8 84 81            [ 1] 6055 	jreq spi_disable 
      009DFA 85               [ 2] 6056 	popw x 
      009DFA A6 84            [ 1] 6057 	ld a,#(1<<SPI_CR1_BR)
      009DFC CD               [ 4] 6058 	mul x,a 
      009DFD 8F               [ 1] 6059 	ld a,xl 
      009DFE FC 9F A4         [ 1] 6060 	ld SPI_CR1,a 
                                   6061 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009E01 07 C7 50 C6      [ 1] 6062 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009E05 81 1A 50 16      [ 1] 6063 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6064 ; configure SPI as master mode 0.	
      009E06 72 14 52 00      [ 1] 6065 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6066 ; ~CS line controlled by sofware 	
      009E06 52 01 CD 90      [ 1] 6067 	bset SPI_CR2,#SPI_CR2_SSM 
      009E0A 0E A1 02 27      [ 1] 6068     bset SPI_CR2,#SPI_CR2_SSI 
                                   6069 ; enable SPI
      009E0E 03 CC 88 15      [ 1] 6070 	bset SPI_CR1,#SPI_CR1_SPE 	
      009E12 90               [ 4] 6071 	ret 
      002120                       6072 spi_disable:
      002120                       6073 	_drop #2; throw first argument.
      009E13 85 85            [ 2]    1     addw sp,##2 
                                   6074 ; wait spi idle 
      009E15 CD 9E            [ 1] 6075 1$:	ld a,#0x82 
      009E17 47 6B 01         [ 1] 6076 	and a,SPI_SR
      009E1A A6 01            [ 1] 6077 	cp a,#2 
      009E1C 0D 01            [ 1] 6078 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E1E 27 0B 48 0A      [ 1] 6079 	bres SPI_CR1,#SPI_CR1_SPE
      009E22 01 26 FB 6B      [ 1] 6080 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009E26 01 EA 03 E7      [ 1] 6081 	bres PE_DDR,#SPI_CS_BIT 
      009E2A 03               [ 4] 6082 	ret 
                                   6083 
      002138                       6084 spi_clear_error:
      009E2B 90 A3            [ 1] 6085 	ld a,#0x78 
      009E2D 00 01 27         [ 1] 6086 	bcp a,SPI_SR 
      009E30 07 7B            [ 1] 6087 	jreq 1$
      009E32 01 43 E4 02      [ 1] 6088 	clr SPI_SR 
      009E36 20               [ 4] 6089 1$: ret 
                                   6090 
      002144                       6091 spi_send_byte:
      009E37 0A               [ 1] 6092 	push a 
      009E38 CD 21 38         [ 4] 6093 	call spi_clear_error
      009E38 7B               [ 1] 6094 	pop a 
      009E39 01 EA 04 E7 04   [ 2] 6095 	btjf SPI_SR,#SPI_SR_TXE,.
      009E3E 7B 01 EA         [ 1] 6096 	ld SPI_DR,a
      009E41 02 E7 02 5B 01   [ 2] 6097 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009E46 81 52 04         [ 1] 6098 	ld a,SPI_DR 
      009E47 81               [ 4] 6099 	ret 
                                   6100 
      00215A                       6101 spi_rcv_byte:
      009E47 58 1C            [ 1] 6102 	ld a,#255
      009E49 9E 57 FE 9F 88   [ 2] 6103 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009E4E 5E A6 05         [ 1] 6104 	ld a,SPI_DR 
      009E51 42               [ 4] 6105 	ret
                                   6106 
                                   6107 ;------------------------------
                                   6108 ; BASIC: SPIWR byte [,byte]
                                   6109 ; write 1 or more byte
                                   6110 ;------------------------------
      002165                       6111 spi_write:
      009E52 1C 50 00         [ 4] 6112 	call expression
      009E55 84 81            [ 1] 6113 	cp a,#TK_INTGR 
      009E57 27 03            [ 1] 6114 	jreq 1$
      009E57 03 06 03         [ 2] 6115 	jp syntax_error 
      00216F                       6116 1$:	
      009E5A 05               [ 1] 6117 	ld a,xl 
      009E5B 04 00 02         [ 4] 6118 	call spi_send_byte 
      009E5E 01 06 00         [ 4] 6119 	call next_token 
      009E61 02 02            [ 1] 6120 	cp a,#TK_COMMA 
      009E63 02 03            [ 1] 6121 	jrne 2$ 
      009E65 03 01            [ 2] 6122 	jra spi_write 
      009E67 03               [ 1] 6123 2$:	tnz a 
      009E68 03 02            [ 1] 6124 	jreq 3$
      00217F                       6125 	_unget_token  
      009E6A 04 04 05 02 06   [ 1]    1     mov in,in.saved
      009E6F 02               [ 4] 6126 3$:	ret 
                                   6127 
                                   6128 
                                   6129 ;-------------------------------
                                   6130 ; BASIC: SPIRD 	
                                   6131 ; read one byte from SPI 
                                   6132 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      002185                       6133 spi_read:
      009E70 07 02 05         [ 4] 6134 	call spi_rcv_byte 
      009E73 04               [ 1] 6135 	clrw x 
      009E74 02               [ 1] 6136 	ld xl,a 
      009E75 04 01            [ 1] 6137 	ld a,#TK_INTGR 
      009E77 81               [ 4] 6138 	ret 
                                   6139 
                                   6140 ;------------------------------
                                   6141 ; BASIC: SPISEL 0|1 
                                   6142 ; set state of ~CS line
                                   6143 ; 0|1 deselect|select  
                                   6144 ;------------------------------
      00218D                       6145 spi_select:
      009E77 CD 90 09         [ 4] 6146 	call next_token 
      009E7A A1 01            [ 1] 6147 	cp a,#TK_INTGR 
      009E7C 27 03            [ 1] 6148 	jreq 1$
      009E7E CC 88 15         [ 2] 6149 	jp syntax_error 
      009E81 5D               [ 2] 6150 1$: tnzw x  
      009E81 A6 80            [ 1] 6151 	jreq cs_high 
      009E83 15 01 27 05      [ 1] 6152 	bres PE_ODR,#SPI_CS_BIT
      009E87 A6               [ 4] 6153 	ret 
      00219F                       6154 cs_high: 
      009E88 0A CC 88 17      [ 1] 6155 	bset PE_ODR,#SPI_CS_BIT
      009E8C 81               [ 4] 6156 	ret 
                                   6157 
                                   6158 
                                   6159 ;------------------------------
                                   6160 ; BASIC: FILERX
                                   6161 ; Use to receive a BASIC program
                                   6162 ; from the PC using XMODEM 
                                   6163 ; protocol. The file is store in
                                   6164 ; Each line received is compiled
                                   6165 ; then stored in RAM. When reception 
                                   6166 ; is completed with success  the 
                                   6167 ; program is ready to be executed 
                                   6168 ; or save as local file.
                                   6169 ;--------------------------------
      0021A4                       6170 file_receive:
      009E8C CE 00 13 58 58   [ 2] 6171 	btjf flags,#FRUN,1$
      009E91 58 58            [ 1] 6172 	ld a,#ERR_CMD_ONLY
      009E93 58 9E C8         [ 2] 6173 	jp tb_error 
      0021AE                       6174 1$:	
      009E96 00 13 C7         [ 4] 6175 	call clear_basic
      009E99 00 0D 9F         [ 2] 6176 	ldw x, txtbgn
      009E9C C8 00 14         [ 4] 6177 	call xreceive 
      009E9F C7 00 0E CE      [ 2] 6178 	addw x,txtbgn 
      009EA3 00 15 CF         [ 2] 6179 	ldw txtend,x 
      009EA6 00 13 90         [ 4] 6180 	call print_int 
      009EA9 54 90 9E         [ 2] 6181 	ldw x,#fsize_msg 
      009EAC C8 00 15         [ 4] 6182 	call puts 
      009EAF C7               [ 4] 6183 	ret 
      009EB0 00 15 90 9F C8 00 16  6184 fsize_msg: .asciz " bytes received\n"
             C7 00 16 CE 00 0D 54
             54 54 9E
                                   6185 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6186 ;------------------------------
                                   6187 ; BASIC: FILETX "file_name" 
                                   6188 ; Transmit the program in RAM 
                                   6189 ; To the PC using XMODEM protocol.
                                   6190 ; The file transmitted as source 
                                   6191 ; file not tokenized. 
                                   6192 ;-------------------------------
      0021D9                       6193 file_transmit:
                                   6194 
      009EC1 C8               [ 4] 6195 	ret 
                                   6196 
                                   6197 
                                   6198 ;------------------------------
                                   6199 ;      dictionary 
                                   6200 ; format:
                                   6201 ;   link:   2 bytes 
                                   6202 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6203 ;   cmd_name: 16 byte max 
                                   6204 ;   code_address: 2 bytes 
                                   6205 ;------------------------------
                                   6206 	.macro _dict_entry len,name,cmd 
                                   6207 	.word LINK 
                                   6208 	LINK=.
                                   6209 name:
                                   6210 	.byte len 	
                                   6211 	.ascii "name"
                                   6212 	.word cmd 
                                   6213 	.endm 
                                   6214 
                           000000  6215 	LINK=0
                                   6216 ; respect alphabetic order for BASIC names from Z-A
                                   6217 ; this sort order is for a cleaner WORDS cmd output. 	
      0021DA                       6218 kword_end:
      0021DA                       6219 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009EC2 00 0D                    1 	.word LINK 
                           0021DC     2 	LINK=.
      0021DC                          3 XPEEK:
      009EC4 95                       4 	.byte 5+F_IFUNC 	
      009EC5 9F C8 00 0E 97           5 	.ascii "XPEEK"
      009ECA C8 00                    6 	.word xpeek 
      0021E4                       6220 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009ECC 16 97                    1 	.word LINK 
                           0021E6     2 	LINK=.
      0021E6                          3 XOR:
      009ECE 9E                       4 	.byte 3+F_IFUNC 	
      009ECF C8 00 15                 5 	.ascii "XOR"
      009ED2 95 CF                    6 	.word bit_xor 
      0021EC                       6221 	_dict_entry,5,WRITE,write  
      009ED4 00 15                    1 	.word LINK 
                           0021EE     2 	LINK=.
      0021EE                          3 WRITE:
      009ED6 90                       4 	.byte 5 	
      009ED7 85 65 93 5C 45           5 	.ascii "WRITE"
      009EDB 1B 55                    6 	.word write 
      0021F6                       6222 	_dict_entry,5,WORDS,words 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009EDB A6 84                    1 	.word LINK 
                           0021F8     2 	LINK=.
      0021F8                          3 WORDS:
      009EDD 81                       4 	.byte 5 	
      009EDE 57 4F 52 44 53           5 	.ascii "WORDS"
      009EDE 52 03                    6 	.word words 
      002200                       6223 	_dict_entry 4,WAIT,wait 
      009EE0 0F 02                    1 	.word LINK 
                           002202     2 	LINK=.
      002202                          3 WAIT:
      009EE2 0F                       4 	.byte 4 	
      009EE3 03 90 AE A6              5 	.ascii "WAIT"
      009EE7 02 93                    6 	.word wait 
      002209                       6224 	_dict_entry,3+F_IFUNC,USR,usr
      009EE9 F6 A4                    1 	.word LINK 
                           00220B     2 	LINK=.
      00220B                          3 USR:
      009EEB 0F                       4 	.byte 3+F_IFUNC 	
      009EEC 6B 01 0C                 5 	.ascii "USR"
      009EEF 03 5C                    6 	.word usr 
      002211                       6225 	_dict_entry,5,UNTIL,until 
      009EF1 F6 CD                    1 	.word LINK 
                           002213     2 	LINK=.
      002213                          3 UNTIL:
      009EF3 82                       4 	.byte 5 	
      009EF4 44 0C 02 0A 01           5 	.ascii "UNTIL"
      009EF9 26 F5                    6 	.word until 
      00221B                       6226 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009EFB A6 46                    1 	.word LINK 
                           00221D     2 	LINK=.
      00221D                          3 UFLASH:
      009EFD 11                       4 	.byte 6+F_IFUNC 	
      009EFE 02 2B 09 A6 20 CD        5 	.ascii "UFLASH"
      009F04 82 44                    6 	.word uflash 
      002226                       6227 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009F06 0C 02                    1 	.word LINK 
                           002228     2 	LINK=.
      002228                          3 UBOUND:
      009F08 20                       4 	.byte 6+F_IFUNC 	
      009F09 07 A6 0D CD 82 44        5 	.ascii "UBOUND"
      009F0F 0F 02                    6 	.word ubound 
      002231                       6228 	_dict_entry,4,TONE,tone  
      009F11 72 A2                    1 	.word LINK 
                           002233     2 	LINK=.
      002233                          3 TONE:
      009F13 00                       4 	.byte 4 	
      009F14 02 90 FE 26              5 	.ascii "TONE"
      009F18 CF A6                    6 	.word tone 
      00223A                       6229 	_dict_entry,2,TO,to
      009F1A 0D CD                    1 	.word LINK 
                           00223C     2 	LINK=.
      00223C                          3 TO:
      009F1C 82                       4 	.byte 2 	
      009F1D 44 5F                    5 	.ascii "TO"
      009F1F 7B 03                    6 	.word to 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      002241                       6230 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009F21 97 CD                    1 	.word LINK 
                           002243     2 	LINK=.
      002243                          3 TIMEOUT:
      009F23 89                       4 	.byte 7+F_IFUNC 	
      009F24 A4 AE 9F 2E CD 82 57     5 	.ascii "TIMEOUT"
      009F2B 5B 03                    6 	.word timeout 
      00224D                       6231 	_dict_entry,5,TIMER,set_timer
      009F2D 81 20                    1 	.word LINK 
                           00224F     2 	LINK=.
      00224F                          3 TIMER:
      009F2F 77                       4 	.byte 5 	
      009F30 6F 72 64 73 20           5 	.ascii "TIMER"
      009F35 69 6E                    6 	.word set_timer 
      002257                       6232 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009F37 20 64                    1 	.word LINK 
                           002259     2 	LINK=.
      002259                          3 TICKS:
      009F39 69                       4 	.byte 5+F_IFUNC 	
      009F3A 63 74 69 6F 6E           5 	.ascii "TICKS"
      009F3F 61 72                    6 	.word get_ticks 
      002261                       6233 	_dict_entry,4,STOP,stop 
      009F41 79 0A                    1 	.word LINK 
                           002263     2 	LINK=.
      002263                          3 STOP:
      009F43 00                       4 	.byte 4 	
      009F44 53 54 4F 50              5 	.ascii "STOP"
      009F44 CD 90                    6 	.word stop 
      00226A                       6234 	_dict_entry,4,STEP,step 
      009F46 0E A1                    1 	.word LINK 
                           00226C     2 	LINK=.
      00226C                          3 STEP:
      009F48 01                       4 	.byte 4 	
      009F49 27 03 CC 88              5 	.ascii "STEP"
      009F4D 15 F0                    6 	.word step 
      009F4E                       6235 	_dict_entry,5,SPIWR,spi_write
      009F4E 85 CF                    1 	.word LINK 
                           002275     2 	LINK=.
      002275                          3 SPIWR:
      009F50 00                       4 	.byte 5 	
      009F51 11 81 49 57 52           5 	.ascii "SPIWR"
      009F53 21 65                    6 	.word spi_write 
      00227D                       6236 	_dict_entry,6,SPISEL,spi_select
      009F53 CE 00                    1 	.word LINK 
                           00227F     2 	LINK=.
      00227F                          3 SPISEL:
      009F55 11                       4 	.byte 6 	
      009F56 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      009F56 53 A3                    6 	.word spi_select 
      002288                       6237 	_dict_entry,5,SPIEN,spi_enable 
      009F58 FF FF                    1 	.word LINK 
                           00228A     2 	LINK=.
      00228A                          3 SPIEN:
      009F5A 27                       4 	.byte 5 	
      009F5B 01 5F A6 84 81           5 	.ascii "SPIEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009F60 20 ED                    6 	.word spi_enable 
      002292                       6238 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      009F60 CD 90                    1 	.word LINK 
                           002294     2 	LINK=.
      002294                          3 SPIRD:
      009F62 09                       4 	.byte 5+F_IFUNC 	
      009F63 A1 01 27 03 CC           5 	.ascii "SPIRD"
      009F68 88 15                    6 	.word spi_read 
      00229C                       6239 	_dict_entry,5,SLEEP,sleep 
      009F6A 85 20                    1 	.word LINK 
                           00229E     2 	LINK=.
      00229E                          3 SLEEP:
      009F6C E9                       4 	.byte 5 	
      009F6D 53 4C 45 45 50           5 	.ascii "SLEEP"
      009F6D CD 90                    6 	.word sleep 
      0022A6                       6240 	_dict_entry,4+F_IFUNC,SIZE,size
      009F6F 0E A1                    1 	.word LINK 
                           0022A8     2 	LINK=.
      0022A8                          3 SIZE:
      009F71 01                       4 	.byte 4+F_IFUNC 	
      009F72 27 03 CC 88              5 	.ascii "SIZE"
      009F76 15 85                    6 	.word size 
      0022AF                       6241     _dict_entry,4,SHOW,show 
      009F78 4B 00                    1 	.word LINK 
                           0022B1     2 	LINK=.
      0022B1                          3 SHOW:
      009F7A 35                       4 	.byte 4 	
      009F7B CC 50 E0 9E              5 	.ascii "SHOW"
      009F7F A4 3F                    6 	.word show 
      0022B8                       6242 	_dict_entry,4,SAVE,save
      009F81 95 A3                    1 	.word LINK 
                           0022BA     2 	LINK=.
      0022BA                          3 SAVE:
      009F83 00                       4 	.byte 4 	
      009F84 FF 23 06 0C              5 	.ascii "SAVE"
      009F88 01 98                    6 	.word save 
      0022C1                       6243 	_dict_entry 3,RUN,run
      009F8A 56 20                    1 	.word LINK 
                           0022C3     2 	LINK=.
      0022C3                          3 RUN:
      009F8C F5                       4 	.byte 3 	
      009F8D 35 55 50                 5 	.ascii "RUN"
      009F90 E0 84                    6 	.word run 
      0022C9                       6244 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009F92 C7 50                    1 	.word LINK 
                           0022CB     2 	LINK=.
      0022CB                          3 RSHIFT:
      009F94 E1                       4 	.byte 6+F_IFUNC 	
      009F95 9F 4A 35 55 50 E0        5 	.ascii "RSHIFT"
      009F9B C7 50                    6 	.word rshift 
      0022D4                       6245 	_dict_entry,3+F_IFUNC,RND,random 
      009F9D E2 35                    1 	.word LINK 
                           0022D6     2 	LINK=.
      0022D6                          3 RND:
      009F9F AA                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009FA0 50 E0 81                 5 	.ascii "RND"
      009FA3 1D F7                    6 	.word random 
      0022DC                       6246 	_dict_entry,6,RETURN,return 
      009FA3 35 AA                    1 	.word LINK 
                           0022DE     2 	LINK=.
      0022DE                          3 RETURN:
      009FA5 50                       4 	.byte 6 	
      009FA6 E0 81 54 55 52 4E        5 	.ascii "RETURN"
      009FA8 16 B2                    6 	.word return 
      0022E7                       6247 	_dict_entry,7,RESTORE,restore 
      009FA8 CD 90                    1 	.word LINK 
                           0022E9     2 	LINK=.
      0022E9                          3 RESTORE:
      009FAA 09                       4 	.byte 7 	
      009FAB A1 01 27 03 CC 88 15     5 	.ascii "RESTORE"
      009FB2 85 48                    6 	.word restore 
      009FB3                       6248 	_dict_entry 6,REMARK,remark 
      009FB3 5D 27                    1 	.word LINK 
                           0022F5     2 	LINK=.
      0022F5                          3 REMARK:
      009FB5 0A                       4 	.byte 6 	
      009FB6 A6 0F 59 25 03 4A        5 	.ascii "REMARK"
      009FBC 20 FA                    6 	.word remark 
      0022FE                       6249 	_dict_entry,6,REBOOT,cold_start
      009FBE 5F 97                    1 	.word LINK 
                           002300     2 	LINK=.
      002300                          3 REBOOT:
      009FC0 A6                       4 	.byte 6 	
      009FC1 84 81 42 4F 4F 54        5 	.ascii "REBOOT"
      009FC3 04 EF                    6 	.word cold_start 
      002309                       6250 	_dict_entry,4+F_IFUNC,READ,read  
      009FC3 CD 90                    1 	.word LINK 
                           00230B     2 	LINK=.
      00230B                          3 READ:
      009FC5 09                       4 	.byte 4+F_IFUNC 	
      009FC6 A1 01 27 03              5 	.ascii "READ"
      009FCA CC 88                    6 	.word read 
      002312                       6251 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009FCC 15 85                    1 	.word LINK 
                           002314     2 	LINK=.
      002314                          3 QKEY:
      009FCE 9F                       4 	.byte 4+F_IFUNC 	
      009FCF A4 0F 5F 5C              5 	.ascii "QKEY"
      009FD3 4D 27                    6 	.word qkey 
      00231B                       6252 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      009FD5 04 58                    1 	.word LINK 
                           00231D     2 	LINK=.
      00231D                          3 PRTI:
      009FD7 4A                       4 	.byte 4+F_IFUNC 	
      009FD8 20 F9 A6 84              5 	.ascii "PRTI"
      009FDC 81 DF                    6 	.word const_porti 
      009FDD                       6253 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      009FDD CD 90                    1 	.word LINK 
                           002326     2 	LINK=.
      002326                          3 PRTH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009FDF 09                       4 	.byte 4+F_IFUNC 	
      009FE0 A1 01 27 03              5 	.ascii "PRTH"
      009FE4 CC 88                    6 	.word const_porth 
      00232D                       6254 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      009FE6 15 85                    1 	.word LINK 
                           00232F     2 	LINK=.
      00232F                          3 PRTG:
      009FE8 53                       4 	.byte 4+F_IFUNC 	
      009FE9 A6 84 81 47              5 	.ascii "PRTG"
      009FEC 1F D3                    6 	.word const_portg 
      002336                       6255 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      009FEC 85 52                    1 	.word LINK 
                           002338     2 	LINK=.
      002338                          3 PRTF:
      009FEE 04                       4 	.byte 4+F_IFUNC 	
      009FEF 89 90 CE 00              5 	.ascii "PRTF"
      009FF3 05 17                    6 	.word const_portf 
      00233F                       6256 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      009FF5 03 90                    1 	.word LINK 
                           002341     2 	LINK=.
      002341                          3 PRTE:
      009FF7 CE                       4 	.byte 4+F_IFUNC 	
      009FF8 00 01 17 05              5 	.ascii "PRTE"
      009FFC 72 5C                    6 	.word const_porte 
      002348                       6257 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      009FFE 00 21                    1 	.word LINK 
                           00234A     2 	LINK=.
      00234A                          3 PRTD:
      00A000 81                       4 	.byte 4+F_IFUNC 	
      00A001 50 52 54 44              5 	.ascii "PRTD"
      00A001 72 5D                    6 	.word const_portd 
      002351                       6258 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A003 00 21                    1 	.word LINK 
                           002353     2 	LINK=.
      002353                          3 PRTC:
      00A005 26                       4 	.byte 4+F_IFUNC 	
      00A006 03 CC 88 15              5 	.ascii "PRTC"
      00A00A 1F BB                    6 	.word const_portc 
      00235A                       6259 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A00A CD 91                    1 	.word LINK 
                           00235C     2 	LINK=.
      00235C                          3 PRTB:
      00A00C 4B                       4 	.byte 4+F_IFUNC 	
      00A00D A1 84 27 03              5 	.ascii "PRTB"
      00A011 CC 88                    6 	.word const_portb 
      002363                       6260 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A013 15 5C                    1 	.word LINK 
                           002365     2 	LINK=.
      00A014                          3 PRTA:
      00A014 5D                       4 	.byte 4+F_IFUNC 	
      00A015 26 10 1E 03              5 	.ascii "PRTA"
      00A019 CF 00                    6 	.word const_porta 
      00236C                       6261 	_dict_entry 5,PRINT,print 
      00A01B 05 E6                    1 	.word LINK 
                           00236E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00236E                          3 PRINT:
      00A01D 02                       4 	.byte 5 	
      00A01E C7 00 04 1E 05           5 	.ascii "PRINT"
      00A023 CF 00                    6 	.word print 
      002376                       6262 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A025 01 81                    1 	.word LINK 
                           002378     2 	LINK=.
      00A027                          3 POUT:
      00A027 85                       4 	.byte 4+F_IFUNC 	
      00A028 5B 04 72 5A              5 	.ascii "POUT"
      00A02C 00 21                    6 	.word const_output 
      00237F                       6263 	_dict_entry,4,POKE,poke 
      00A02E FC 78                    1 	.word LINK 
                           002381     2 	LINK=.
      00A02F                          3 POKE:
      00A02F AE                       4 	.byte 4 	
      00A030 00 00 A6 84              5 	.ascii "POKE"
      00A034 81 47                    6 	.word poke 
      00A035                       6264 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A035 AE 00                    1 	.word LINK 
                           00238A     2 	LINK=.
      00238A                          3 PINP:
      00A037 01                       4 	.byte 4+F_IFUNC 	
      00A038 A6 84 81 50              5 	.ascii "PINP"
      00A03B 20 09                    6 	.word const_input 
      002391                       6265 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A03B AE 00                    1 	.word LINK 
                           002393     2 	LINK=.
      002393                          3 PEEK:
      00A03D 02                       4 	.byte 4+F_IFUNC 	
      00A03E A6 84 81 4B              5 	.ascii "PEEK"
      00A041 15 56                    6 	.word peek 
      00239A                       6266 	_dict_entry,5,PMODE,pin_mode 
      00A041 AE 00                    1 	.word LINK 
                           00239C     2 	LINK=.
      00239C                          3 PMODE:
      00A043 03                       4 	.byte 5 	
      00A044 A6 84 81 44 45           5 	.ascii "PMODE"
      00A047 1D 86                    6 	.word pin_mode 
      0023A4                       6267 	_dict_entry,5,PAUSE,pause 
      00A047 AE 00                    1 	.word LINK 
                           0023A6     2 	LINK=.
      0023A6                          3 PAUSE:
      00A049 04                       4 	.byte 5 	
      00A04A A6 84 81 53 45           5 	.ascii "PAUSE"
      00A04D 1C 8A                    6 	.word pause 
      0023AE                       6268 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A04D AE 00                    1 	.word LINK 
                           0023B0     2 	LINK=.
      0023B0                          3 OR:
      00A04F 05                       4 	.byte 2+F_IFUNC 	
      00A050 A6 84                    5 	.ascii "OR"
      00A052 81 18                    6 	.word bit_or 
      00A053                       6269 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A053 AE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           0023B7     2 	LINK=.
      0023B7                          3 ODR:
      00A055 06                       4 	.byte 3+F_IFUNC 	
      00A056 A6 84 81                 5 	.ascii "ODR"
      00A059 1F E5                    6 	.word const_odr 
      0023BD                       6270 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A059 AE 00                    1 	.word LINK 
                           0023BF     2 	LINK=.
      0023BF                          3 NOT:
      00A05B 07                       4 	.byte 3+F_IFUNC 	
      00A05C A6 84 81                 5 	.ascii "NOT"
      00A05F 1E E0                    6 	.word func_not 
      0023C5                       6271 	_dict_entry,3,NEW,new
      00A05F AE 00                    1 	.word LINK 
                           0023C7     2 	LINK=.
      0023C7                          3 NEW:
      00A061 08                       4 	.byte 3 	
      00A062 A6 84 81                 5 	.ascii "NEW"
      00A065 18 99                    6 	.word new 
      0023CD                       6272 	_dict_entry,4,NEXT,next 
      00A065 A6 84                    1 	.word LINK 
                           0023CF     2 	LINK=.
      0023CF                          3 NEXT:
      00A067 AE                       4 	.byte 4 	
      00A068 00 00 81 54              5 	.ascii "NEXT"
      00A06B 16 17                    6 	.word next 
      0023D6                       6273 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A06B A6 84                    1 	.word LINK 
                           0023D8     2 	LINK=.
      0023D8                          3 LSHIFT:
      00A06D AE                       4 	.byte 6+F_IFUNC 	
      00A06E 00 01 81 49 46 54        5 	.ascii "LSHIFT"
      00A071 1D 48                    6 	.word lshift 
      0023E1                       6274 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A071 A6 84                    1 	.word LINK 
                           0023E3     2 	LINK=.
      0023E3                          3 LOG:
      00A073 AE                       4 	.byte 3+F_IFUNC 	
      00A074 00 02 81                 5 	.ascii "LOG"
      00A077 1F 28                    6 	.word log2 
      0023E9                       6275 	_dict_entry,4,LOAD,load 
      00A077 A6 84                    1 	.word LINK 
                           0023EB     2 	LINK=.
      0023EB                          3 LOAD:
      00A079 AE                       4 	.byte 4 	
      00A07A 00 03 81 44              5 	.ascii "LOAD"
      00A07D 1A 4A                    6 	.word load 
      0023F2                       6276 	_dict_entry 4,LIST,list
      00A07D A6 84                    1 	.word LINK 
                           0023F4     2 	LINK=.
      0023F4                          3 LIST:
      00A07F AE                       4 	.byte 4 	
      00A080 00 04 81 54              5 	.ascii "LIST"
      00A083 11 C4                    6 	.word list 
      0023FB                       6277 	_dict_entry 3,LET,let 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A083 A6 84                    1 	.word LINK 
                           0023FD     2 	LINK=.
      0023FD                          3 LET:
      00A085 AE                       4 	.byte 3 	
      00A086 00 01 81                 5 	.ascii "LET"
      00A089 11 99                    6 	.word let 
      002403                       6278 	_dict_entry,3+F_IFUNC,KEY,key 
      00A089 A6 84                    1 	.word LINK 
                           002405     2 	LINK=.
      002405                          3 KEY:
      00A08B AE                       4 	.byte 3+F_IFUNC 	
      00A08C 00 00 81                 5 	.ascii "KEY"
      00A08F 1B BE                    6 	.word key 
      00240B                       6279 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A08F A6 84                    1 	.word LINK 
                           00240D     2 	LINK=.
      00240D                          3 IWDGREF:
      00A091 AE                       4 	.byte 7 	
      00A092 40 00 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A095 1F 23                    6 	.word refresh_iwdg 
      002417                       6280 	_dict_entry,6,IWDGEN,enable_iwdg
      00A095 55 00                    1 	.word LINK 
                           002419     2 	LINK=.
      002419                          3 IWDGEN:
      00A097 04                       4 	.byte 6 	
      00A098 00 02 81 47 45 4E        5 	.ascii "IWDGEN"
      00A09B 1E ED                    6 	.word enable_iwdg 
      002422                       6281 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A09B CD 91                    1 	.word LINK 
                           002424     2 	LINK=.
      002424                          3 INVERT:
      00A09D 07                       4 	.byte 6+F_IFUNC 	
      00A09E A1 84 27 03 CC 88        5 	.ascii "INVERT"
      00A0A4 15 CD                    6 	.word invert 
      00242D                       6282 	_dict_entry,5,INPUT,input_var  
      00A0A6 83 A4                    1 	.word LINK 
                           00242F     2 	LINK=.
      00242F                          3 INPUT:
      00A0A8 5D                       4 	.byte 5 	
      00A0A9 26 05 A6 05 CC           5 	.ascii "INPUT"
      00A0AE 88 17                    6 	.word input_var 
      00A0B0                       6283 	_dict_entry,2,IF,if 
      00A0B0 90 93                    1 	.word LINK 
                           002439     2 	LINK=.
      002439                          3 IF:
      00A0B2 EE                       4 	.byte 2 	
      00A0B3 04 A3                    5 	.ascii "IF"
      00A0B5 A0 95                    6 	.word if 
      00243E                       6284 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A0B7 26 F2                    1 	.word LINK 
                           002440     2 	LINK=.
      002440                          3 IDR:
      00A0B9 90                       4 	.byte 3+F_IFUNC 	
      00A0BA CF 00 07                 5 	.ascii "IDR"
      00A0BD 90 E6                    6 	.word const_idr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      002446                       6285 	_dict_entry,3,HEX,hex_base
      00A0BF 02 C7                    1 	.word LINK 
                           002448     2 	LINK=.
      002448                          3 HEX:
      00A0C1 00                       4 	.byte 3 	
      00A0C2 0A 35 06                 5 	.ascii "HEX"
      00A0C5 00 09                    6 	.word hex_base 
      00244E                       6286 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A0C7 81 48                    1 	.word LINK 
                           002450     2 	LINK=.
      00A0C8                          3 GPIO:
      00A0C8 72                       4 	.byte 4+F_IFUNC 	
      00A0C9 5F 00 07 72              5 	.ascii "GPIO"
      00A0CD 5F 00                    6 	.word gpio 
      002457                       6287 	_dict_entry,4,GOTO,goto 
      00A0CF 08 72                    1 	.word LINK 
                           002459     2 	LINK=.
      002459                          3 GOTO:
      00A0D1 5F                       4 	.byte 4 	
      00A0D2 00 09 72 5F              5 	.ascii "GOTO"
      00A0D6 00 0A                    6 	.word goto 
      002460                       6288 	_dict_entry,5,GOSUB,gosub 
      00A0D8 CE 00                    1 	.word LINK 
                           002462     2 	LINK=.
      002462                          3 GOSUB:
      00A0DA 1D                       4 	.byte 5 	
      00A0DB 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A0DB C3 00                    6 	.word gosub 
      00246A                       6289 	_dict_entry,6,FORGET,forget 
      00A0DD 1F 24                    1 	.word LINK 
                           00246C     2 	LINK=.
      00246C                          3 FORGET:
      00A0DF 17                       4 	.byte 6 	
      00A0E0 90 93 EE 04 A3 A0        5 	.ascii "FORGET"
      00A0E6 95 26                    6 	.word forget 
      002475                       6290 	_dict_entry,3,FOR,for 
      00A0E8 1A 90                    1 	.word LINK 
                           002477     2 	LINK=.
      002477                          3 FOR:
      00A0EA CF                       4 	.byte 3 	
      00A0EB 00 07 90                 5 	.ascii "FOR"
      00A0EE E6 02                    6 	.word for 
      00247D                       6291 	_dict_entry,6,FILETX,file_transmit
      00A0F0 C7 00                    1 	.word LINK 
                           00247F     2 	LINK=.
      00247F                          3 FILETX:
      00A0F2 0A                       4 	.byte 6 	
      00A0F3 35 06 00 09 72 5D        5 	.ascii "FILETX"
      00A0F9 00 0A                    6 	.word file_transmit 
      002488                       6292 	_dict_entry,6,FILERX,file_receive 
      00A0FB 26 05                    1 	.word LINK 
                           00248A     2 	LINK=.
      00248A                          3 FILERX:
      00A0FD A6                       4 	.byte 6 	
      00A0FE 0C CC 88 17 81 58        5 	.ascii "FILERX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A103 21 A4                    6 	.word file_receive 
      002493                       6293 	_dict_entry,4,FCPU,fcpu 
      00A103 93 E6                    1 	.word LINK 
                           002495     2 	LINK=.
      002495                          3 FCPU:
      00A105 02                       4 	.byte 4 	
      00A106 C7 00 0E 72              5 	.ascii "FCPU"
      00A10A 5F 00                    6 	.word fcpu 
      00249C                       6294 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A10C 0D 72                    1 	.word LINK 
                           00249E     2 	LINK=.
      00249E                          3 EEPROM:
      00A10E BB                       4 	.byte 6+F_IFUNC 	
      00A10F 00 0D 20 C8 4F 4D        5 	.ascii "EEPROM"
      00A113 20 0F                    6 	.word const_eeprom_base 
      0024A7                       6295 	_dict_entry,3,END,cmd_end  
      00A113 52 06                    1 	.word LINK 
                           0024A9     2 	LINK=.
      00A115                          3 END:
      00A115 C6                       4 	.byte 3 	
      00A116 00 09 C1                 5 	.ascii "END"
      00A119 00 0A                    6 	.word cmd_end 
      0024AF                       6296 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A11B 27 37                    1 	.word LINK 
                           0024B1     2 	LINK=.
      0024B1                          3 DWRITE:
      00A11D CD                       4 	.byte 6+F_CMD 	
      00A11E 94 B8 CE 00 07 CF        5 	.ascii "DWRITE"
      00A124 00 05                    6 	.word digital_write 
      0024BA                       6297 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A126 55 00                    1 	.word LINK 
                           0024BC     2 	LINK=.
      0024BC                          3 DREAD:
      00A128 09                       4 	.byte 5+F_IFUNC 	
      00A129 00 02 55 00 0A           5 	.ascii "DREAD"
      00A12E 00 04                    6 	.word digital_read 
      0024C4                       6298 	_dict_entry,2,DO,do_loop
      00A130 CD 91                    1 	.word LINK 
                           0024C6     2 	LINK=.
      0024C6                          3 DO:
      00A132 07                       4 	.byte 2 	
      00A133 A1 84                    5 	.ascii "DO"
      00A135 27 03                    6 	.word do_loop 
      0024CB                       6299 	_dict_entry,3,DIR,directory 
      00A137 CC 88                    1 	.word LINK 
                           0024CD     2 	LINK=.
      0024CD                          3 DIR:
      00A139 15                       4 	.byte 3 	
      00A13A 44 49 52                 5 	.ascii "DIR"
      00A13A 1F 05                    6 	.word directory 
      0024D3                       6300 	_dict_entry,3,DEC,dec_base
      00A13C CD 89                    1 	.word LINK 
                           0024D5     2 	LINK=.
      0024D5                          3 DEC:
      00A13E 07                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A13F CE 00 05                 5 	.ascii "DEC"
      00A142 CF 00                    6 	.word dec_base 
      0024DB                       6301 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A144 07 55                    1 	.word LINK 
                           0024DD     2 	LINK=.
      0024DD                          3 DDR:
      00A146 00                       4 	.byte 3+F_IFUNC 	
      00A147 02 00 09                 5 	.ascii "DDR"
      00A14A CD 94                    6 	.word const_ddr 
      0024E3                       6302 	_dict_entry,6,DATALN,data_line  
      00A14C C8 1E                    1 	.word LINK 
                           0024E5     2 	LINK=.
      0024E5                          3 DATALN:
      00A14E 05                       4 	.byte 6 	
      00A14F A6 84 5B 06 81 4E        5 	.ascii "DATALN"
      00A154 20 1B                    6 	.word data_line 
      0024EE                       6303 	_dict_entry,4,DATA,data  
      00A154 90 CE                    1 	.word LINK 
                           0024F0     2 	LINK=.
      0024F0                          3 DATA:
      00A156 00                       4 	.byte 4 	
      00A157 07 72 5F 00              5 	.ascii "DATA"
      00A15B 07 72                    6 	.word data 
      0024F7                       6304 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A15D 5F 00                    1 	.word LINK 
                           0024F9     2 	LINK=.
      0024F9                          3 CRL:
      00A15F 08                       4 	.byte 3+F_IFUNC 	
      00A160 72 5F 00                 5 	.ascii "CRL"
      00A163 09 72                    6 	.word const_cr1 
      0024FF                       6305 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A165 5F 00                    1 	.word LINK 
                           002501     2 	LINK=.
      002501                          3 CRH:
      00A167 0A                       4 	.byte 3+F_IFUNC 	
      00A168 CD A1 03                 5 	.ascii "CRH"
      00A16B 20 A8                    6 	.word const_cr2 
      00A16D                       6306 	_dict_entry,4+F_CFUNC,CHAR,char
      00A16D CD 90                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 CHAR:
      00A16F 0E                       4 	.byte 4+F_CFUNC 	
      00A170 A1 02 27 03              5 	.ascii "CHAR"
      00A174 CC 88                    6 	.word char 
      002510                       6307 	_dict_entry,3,BYE,bye 
      00A176 15 09                    1 	.word LINK 
                           002512     2 	LINK=.
      00A177                          3 BYE:
      00A177 72                       4 	.byte 3 	
      00A178 12 50 C7                 5 	.ascii "BYE"
      00A17B 85 5D                    6 	.word bye 
      002518                       6308 	_dict_entry,5,BTOGL,bit_toggle
      00A17D 27 21                    1 	.word LINK 
                           00251A     2 	LINK=.
      00251A                          3 BTOGL:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A17F 85                       4 	.byte 5 	
      00A180 A6 08 42 9F C7           5 	.ascii "BTOGL"
      00A185 52 00                    6 	.word bit_toggle 
      002522                       6309 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A187 72 1A                    1 	.word LINK 
                           002524     2 	LINK=.
      002524                          3 BTEST:
      00A189 50                       4 	.byte 5+F_IFUNC 	
      00A18A 14 72 1A 50 16           5 	.ascii "BTEST"
      00A18F 72 14                    6 	.word bit_test 
      00252C                       6310 	_dict_entry,4,BSET,bit_set 
      00A191 52 00                    1 	.word LINK 
                           00252E     2 	LINK=.
      00252E                          3 BSET:
      00A193 72                       4 	.byte 4 	
      00A194 12 52 01 72              5 	.ascii "BSET"
      00A198 10 52                    6 	.word bit_set 
      002535                       6311 	_dict_entry,4,BRES,bit_reset
      00A19A 01 72                    1 	.word LINK 
                           002537     2 	LINK=.
      002537                          3 BRES:
      00A19C 1C                       4 	.byte 4 	
      00A19D 52 00 81 53              5 	.ascii "BRES"
      00A1A0 14 FF                    6 	.word bit_reset 
      00253E                       6312 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A1A0 5B 02                    1 	.word LINK 
                           002540     2 	LINK=.
      002540                          3 BIT:
      00A1A2 A6                       4 	.byte 3+F_IFUNC 	
      00A1A3 82 C4 52                 5 	.ascii "BIT"
      00A1A6 03 A1                    6 	.word bitmask 
      002546                       6313 	_dict_entry,3,AWU,awu 
      00A1A8 02 26                    1 	.word LINK 
                           002548     2 	LINK=.
      002548                          3 AWU:
      00A1AA F7                       4 	.byte 3 	
      00A1AB 72 1D 52                 5 	.ascii "AWU"
      00A1AE 00 72                    6 	.word awu 
      00254E                       6314 	_dict_entry,7,AUTORUN,autorun
      00A1B0 13 50                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 AUTORUN:
      00A1B2 C7                       4 	.byte 7 	
      00A1B3 72 1B 50 16 81 55 4E     5 	.ascii "AUTORUN"
      00A1B8 1C 27                    6 	.word autorun 
      00255A                       6315 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A1B8 A6 78                    1 	.word LINK 
                           00255C     2 	LINK=.
      00255C                          3 ASC:
      00A1BA C5                       4 	.byte 3+F_IFUNC 	
      00A1BB 52 03 27                 5 	.ascii "ASC"
      00A1BE 04 72                    6 	.word ascii 
      002562                       6316 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A1C0 5F 52                    1 	.word LINK 
                           002564     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      002564                          3 AND:
      00A1C2 03                       4 	.byte 3+F_IFUNC 	
      00A1C3 81 4E 44                 5 	.ascii "AND"
      00A1C4 1D 00                    6 	.word bit_and 
      00256A                       6317 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A1C4 88 CD                    1 	.word LINK 
                           00256C     2 	LINK=.
      00256C                          3 ADCREAD:
      00A1C6 A1                       4 	.byte 7+F_IFUNC 	
      00A1C7 B8 84 72 03 52 03 FB     5 	.ascii "ADCREAD"
      00A1CE C7 52                    6 	.word analog_read 
      002576                       6318 	_dict_entry,5,ADCON,power_adc 
      00A1D0 04 72                    1 	.word LINK 
                           002578     2 	LINK=.
      002578                          3 ADCON:
      00A1D2 01                       4 	.byte 5 	
      00A1D3 52 03 FB C6 52           5 	.ascii "ADCON"
      00A1D8 04 81                    6 	.word power_adc 
      00A1DA                       6319 kword_dict:
      002580                       6320 	_dict_entry,3+F_IFUNC,ABS,abs
      00A1DA A6 FF                    1 	.word LINK 
                           002582     2 	LINK=.
      002582                          3 ABS:
      00A1DC 72                       4 	.byte 3+F_IFUNC 	
      00A1DD 01 52 03                 5 	.ascii "ABS"
      00A1E0 E3 C6                    6 	.word abs 
                                   6321 	
                                   6322 
      002600                       6323 	.bndry 128 ; align on FLASH block.
                                   6324 ; free space for user application  
      002600                       6325 user_space:
                                   6326 ; USR() function test
      00A1E2 52               [ 2] 6327 	pushw x 
      00A1E3 04 81 50 0A      [ 1] 6328 	bset PC_ODR,#5 
      00A1E5 85               [ 2] 6329 	popw x 
      00A1E5 CD 91 07         [ 4] 6330 	call pause02 
      00A1E8 A1 84 27 03      [ 1] 6331 	bres PC_ODR,#5 
      00A1EC CC               [ 4] 6332 	ret
                                   6333 
                                   6334 	.area FLASH_DRIVE (ABS)
      010000                       6335 	.org 0x10000
      010000                       6336 fdrive:
                                   6337 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002582 R   |     ACK     =  000006 
  5 ADCON      002578 R   |   5 ADCREAD    00256C R   |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    ADDR    =  000001     |     ADD_SPAC=  000003     |     ADR     =  000002 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  5 AND        002564 R   |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        00255C R   |     ATTRIB  =  000002     |   5 AUTORUN    002550 R
    AUTORUN_=  004000     |   5 AWU        002548 R   |   5 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   5 BIT        002540 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       002537 R
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       00252E R
    BSIZE   =  000001     |   5 BTEST      002524 R   |   5 BTOGL      00251A R
    BTW     =  000001     |   5 BYE        002512 R   |     C       =  000001 
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
  5 CHAR       002509 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]

Symbol Table

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
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002501 R
  5 CRL        0024F9 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       0024F0 R   |   5 DATALN     0024E5 R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        0024DD R   |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        0024D5 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0024CD R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0024C6 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |   5 DREAD      0024BC R   |   5 DWRITE     0024B1 R
  5 EEPROM     00249E R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EM      =  000019     |   5 END        0024A9 R
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002495 R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |   5 FILERX     00248A R   |   5 FILETX     00247F R
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
    FLSI    =  01F400     |   5 FOR        002477 R   |   5 FORGET     00246C R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002462 R   |   5 GOTO       002459 R
  5 GPIO       002450 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002448 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002440 R
  5 IF         002439 R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00242F R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

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
    INT_VECT=  008058     |   5 INVERT     002424 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002419 R
  5 IWDGREF    00240D R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002405 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        0023FD R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  002582 R   |   5 LIST       0023F4 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOAD       0023EB R   |   5 LOG        0023E3 R   |   5 LSHIFT     0023D8 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0023C7 R
  5 NEXT       0023CF R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  5 NOT        0023BF R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        0023B7 R
    ONOFF   =  000003     |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0023B0 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000080     |   5 PAUSE      0023A6 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002393 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       00238A R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00239C R
  5 POKE       002381 R   |     PORT    =  000003     |   5 POUT       002378 R
    PREV    =  000001     |   5 PRINT      00236E R   |     PROD    =  000002 
  5 PRTA       002365 R   |   5 PRTB       00235C R   |   5 PRTC       002353 R
  5 PRTD       00234A R   |   5 PRTE       002341 R   |   5 PRTF       002338 R
  5 PRTG       00232F R   |   5 PRTH       002326 R   |   5 PRTI       00231D R
  5 QKEY       002314 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       00230B R   |   5 REBOOT     002300 R
    REG     =  000001     |     RELOP   =  000005     |   5 REMARK     0022F5 R
  5 RESTORE    0022E9 R   |     RETL1   =  000001     |   5 RETURN     0022DE R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0022D6 R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0022CB R
    RST_SR  =  0050B3     |   5 RUN        0022C3 R   |     RXCHAR  =  000001 
  5 SAVE       0022BA R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0022B1 R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0022A8 R
    SKIP    =  000005     |   5 SLEEP      00229E R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      00228A R
  5 SPIRD      002294 R   |   5 SPISEL     00227F R   |   5 SPIWR      002275 R
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_CS_B=  000005     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_SR_B=  000007     |     SPI_SR_C=  000004     |     SPI_SR_M=  000005 
    SPI_SR_O=  000006     |     SPI_SR_R=  000000     |     SPI_SR_T=  000001 
    SPI_SR_W=  000003     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  0000A0 
  5 STEP       00226C R   |   5 STOP       002263 R   |     STREND  =  00000A 
    STRING  =  000002     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002259 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    002243 R
  5 TIMER      00224F R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_ARRAY=  000006     |     TK_CFUNC=  000082     |     TK_CHAR =  000003 
    TK_CMD  =  000080     |     TK_COLON=  000001     |     TK_COMMA=  000009 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LE   =  000036     |     TK_LPARE=  000007     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000008     |     TK_SHARP=  00000A 
    TK_VAR  =  000085     |   5 TO         00223C R   |   5 TONE       002233 R
  5 Timer4Up   000037 R   |     U8      =  000003     |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR4=  000006     |     UART_CR4=  000005     |     UART_CR5=  000008 
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   5 UBOUND     002228 R   |   5 UBTN_Han   00007A R
  5 UFLASH     00221D R   |   5 UNTIL      002213 R   |     US      =  00001F 
  5 USER_ABO   000082 R   |     USE_BLOC=  000000     |   5 USR        00220B R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00004D R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       002202 R   |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH   =  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      0021F8 R   |   5 WRITE      0021EE R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XADR    =  000001 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        0021E6 R   |   5 XPEEK      0021DC R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000003 
  5 abs        001CEC R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   000ABD R   |   5 add        000E52 R
  5 add_char   0013A7 R   |   5 analog_r   0017AE R   |   5 ansi_seq   000A7F R
  5 arduino_   001DD7 R   |   5 arg_list   000F8E R   |   1 array_si   000021 R
  5 ascii      001B9E R   |   5 at_tst     000CC4 R   |   5 atoi24     000DD5 R
  5 atoi_exi   000E3B R   |   5 autorun    001C27 R   |   5 autorun_   0005EC R
  5 awu        001C9D R   |   5 awu02      001CA7 R   |   5 bad_port   001BF6 R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       001736 R
  5 bin_exit   000BA2 R   |   5 bit_and    001D00 R   |   5 bit_or     001D18 R
  5 bit_rese   0014FF R   |   5 bit_set    0014EF R   |   5 bit_test   001520 R
  5 bit_togg   001510 R   |   5 bit_xor    001D30 R   |   5 bitmask    001F43 R
  5 bkslsh_t   000C71 R   |   5 bksp       0001E1 R   |   5 break_po   00187B R
  5 bye        001C1E R   |   5 cancel_a   0005B4 R   |   5 char       001B8C R
  5 clear_ba   000601 R   |   5 clear_va   000481 R   |   5 clock_in   00009D R
  5 cmd_end    001722 R   |   5 cmd_line   00081F R   |   5 cmd_name   000EFD R
  5 cmp_name   0018EE R   |   5 cold_sta   0004EF R   |   5 colon_ts   000C98 R
  5 comma_ts   000CA3 R   |   5 comp_msg   000775 R   |   5 compile    00040E R
  5 const_cr   001FF7 R   |   5 const_cr   001FFD R   |   5 const_dd   001FF1 R
  5 const_ee   00200F R   |   5 const_id   001FEB R   |   5 const_in   002009 R
  5 const_od   001FE5 R   |   5 const_ou   002003 R   |   5 const_po   001FAF R
  5 const_po   001FB5 R   |   5 const_po   001FBB R   |   5 const_po   001FC1 R
  5 const_po   001FC7 R   |   5 const_po   001FCD R   |   5 const_po   001FD3 R
  5 const_po   001FD9 R   |   5 const_po   001FDF R   |   5 convert_   000B19 R
  5 copy_com   000CF9 R   |   1 count      000003 R   |   5 cp_loop    000F3D R
  5 create_g   000375 R   |   5 cs_high    00219F R   |   5 cstk_pro   00113C R
  5 dash_tst   000CB9 R   |   5 data       002015 R   |   1 data_len   000009 R
  5 data_lin   00201B R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   00205B R   |   5 dec_base   001168 R   |   5 del_back   000AAE R
  5 del_line   000348 R   |   5 del_ln     000A9F R   |   5 delete     0001F1 R
  5 digital_   0017E2 R   |   5 digital_   001812 R   |   5 dir_loop   001ACB R
  5 director   001ABF R   |   5 divide     000EA8 R   |   5 divu24_8   0009D0 R
  5 do_loop    001F6C R   |   5 drive_fr   001B48 R   |   5 enable_i   001EED R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 eql_tst    000D4E R   |   5 equal      0013BA R   |   5 err_bad_   0006E1 R
  5 err_buf_   000757 R   |   5 err_cmd_   0006A5 R   |   5 err_div0   00066A R
  5 err_dupl   0006BF R   |   5 err_math   000651 R   |   5 err_mem_   000636 R
  5 err_msg    000616 R   |   5 err_no_a   0006ED R   |   5 err_no_d   000720 R
  5 err_no_f   000744 R   |   5 err_no_l   000679 R   |   5 err_no_p   000730 R
  5 err_not_   0006D0 R   |   5 err_run_   00068F R   |   5 err_synt   000643 R
  5 escaped    000B2E R   |   5 expect     000F7C R   |   5 expr_exi   0010C8 R
  5 expressi   001087 R   |   5 factor     000FDE R   |   1 farptr     000016 R
  5 fcpu       001D7A R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001B40 R   |   5 file_rec   0021A4 R   |   5 file_tra   0021D9 R
  5 final_te   000A79 R   |   5 first_li   0011ED R   |   1 flags      000023 R
  5 for        001597 R   |   5 forget     001A7A R   |   1 free_ram   00005A R
  5 fsize_ms   0021C8 R   |   5 func_arg   000F89 R   |   5 func_not   001EE0 R
  5 ge         0013BC R   |   5 get_arra   000FB9 R   |   5 get_targ   001661 R
  5 get_tick   001CE6 R   |   5 get_toke   000C0A R   |   5 getc       0001CD R
  5 gosub      001692 R   |   5 goto       001677 R   |   5 gpio       001BD1 R
  5 gt         0013B8 R   |   5 gt_tst     000D59 R   |   5 hex_base   001163 R
  5 hex_dump   000279 R   |   5 if         001583 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   0018A3 R
  5 input_ex   0014C1 R   |   5 input_lo   00145A R   |   5 input_va   001458 R
  5 insert_l   0003A1 R   |   5 insert_l   00040B R   |   5 interp_l   000860 R
  5 interpre   00083B R   |   5 invert     001F5D R   |   5 is_alpha   00048F R
  5 is_digit   0004A0 R   |   5 itoa       000989 R   |   5 itoa_loo   0009A1 R
  5 jp_to_ta   001685 R   |   5 key        001BBE R   |   5 kw_loop    000BBE R
  5 kword_di   002580 R   |   5 kword_en   0021DA R   |   5 le         0013C1 R
  5 leading_   001F33 R   |   5 left_arr   000A7F R   |   5 let        001199 R
  5 let_arra   0011A7 R   |   5 let_var    0011AA R   |   5 lines_sk   0011F0 R
  5 list       0011C4 R   |   5 list_exi   001236 R   |   5 list_sta   001210 R
  5 load       001A4A R   |   5 load_aut   0005C3 R   |   5 load_fil   001A19 R
  5 log2       001F28 R   |   5 logical_   001ED6 R   |   5 loop_bac   001644 R
  1 loop_dep   000020 R   |   5 loop_don   001659 R   |   5 lshift     001D48 R
  5 lt         0013BF R   |   5 lt_tst     000D82 R   |   5 modulo     000EEC R
  5 move       0002E2 R   |   5 move_dow   000300 R   |   5 move_exi   000321 R
  5 move_loo   000305 R   |   5 move_up    0002F2 R   |   5 mul_char   0013A9 R
  5 multiply   000E60 R   |   5 mulu24_8   0009F8 R   |   5 nbr_tst    000C3D R
  5 ne         0013C4 R   |   5 neg_acc2   000A32 R   |   5 new        001899 R
  5 next       001617 R   |   5 next_lin   000843 R   |   5 next_tok   000887 R
  5 no_match   000F4F R   |   5 other      000DAB R   |   3 pad        0016E0 R
  5 parse_bi   000B80 R   |   5 parse_in   000B36 R   |   5 parse_ke   000BBD R
  5 parse_qu   000AE1 R   |   5 pause      001C8A R   |   5 pause02    001C94 R
  5 peek       001556 R   |   5 pin_mode   001D86 R   |   5 plus_tst   000D22 R
  5 poke       001547 R   |   5 power_ad   001772 R   |   5 prcnt_ts   000D43 R
  5 print      0013C7 R   |   5 print_ex   00142C R   |   5 print_in   000924 R
  5 print_ty   001438 R   |   5 prt_basi   001291 R   |   5 prt_cmd_   001239 R
  5 prt_loop   0013CB R   |   5 prt_quot   00124D R   |   5 prt_tok    00020B R
  5 prti24     0008DC R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       0001C4 R   |   5 puts       0001D7 R   |   5 qkey       001BC6 GR
  5 qmark_ts   000CCF R   |   5 random     001DF7 R   |   5 read       002093 R
  5 read01     002095 R   |   5 readln     000A55 R   |   5 readln_l   000A5D R
  5 readln_q   000AD2 R   |   5 refresh_   001F23 R   |   5 rel_exit   00111F R
  5 relation   0010CB R   |   5 relop_st   0013AC R   |   5 remark     0014C4 R
  5 reprint    000A7F R   |   5 reset_co   0013C9 R   |   5 rest_con   001448 R
  5 restore    002048 R   |   5 return     0016B2 R   |   5 right_ar   000A7F R
  5 row_loop   00025C R   |   5 rparnt_t   000C8D R   |   5 rshift     001D61 R
  5 rt_msg     000764 R   |   5 run        0016D0 R   |   5 run_it     0016FB R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

  1 rx_char    000025 R   |   5 save       00195A R   |   5 save_con   001438 R
  5 search_d   000F2F R   |   5 search_e   000F79 R   |   5 search_f   00190F R
  5 search_l   000324 R   |   5 search_l   00032C R   |   5 search_n   000F33 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   0018B1 R
  5 select_p   001DC7 R   |   5 set_time   001EC4 R   |   5 sharp_ts   000CAE R
  5 show       001122 R   |   5 show_row   00024A R   |   5 single_c   0013A2 R
  5 size       00116D R   |   5 skip       000E3F R   |   5 slash_ts   000D38 R
  5 sleep      001C7F R   |   5 software   0004A9 R   |   5 spaces     0001FF R
  5 spi_clea   002138 R   |   5 spi_disa   002120 R   |   5 spi_enab   0020ED R
  5 spi_rcv_   00215A R   |   5 spi_read   002185 R   |   5 spi_sele   00218D R
  5 spi_send   002144 R   |   5 spi_writ   002165 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D2D R   |   5 step       0015F0 R
  5 stop       00184D R   |   5 store_lo   001604 R   |   5 str_matc   000F5C R
  5 str_tst    000C2D R   |   5 strcmp     0002C3 R   |   5 strcpy     0002D4 R
  5 strlen     0002B6 R   |   5 substrac   000E5A R   |   5 syntax_e   000795 R
  1 tab_widt   000024 R   |   5 tb_error   000797 R   |   5 term       001038 R
  5 term01     001041 R   |   5 term_exi   001084 R   |   3 tib        001690 R
  5 tick_tst   000CE7 R   |   1 ticks      00000E R   |   5 timeout    001ED3 R
  1 timer      000010 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  5 tk_id      000785 R   |   5 to         0015C0 R   |   5 to_upper   000DC9 GR
  5 token_ch   000DC2 R   |   5 token_ex   000DC6 R   |   5 token_ms   000242 R
  5 tone       001729 R   |   5 try_next   002083 R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   000189 R   |   5 uart1_se   000199 R
  5 ubound     001177 R   |   5 uflash     001BFB R   |   5 unlock_e   0000D5 R
  5 unlock_f   0000E3 R   |   5 until      001F81 R   |   5 user_int   000060 R
  5 user_spa   002600 R   |   5 usr        001C01 R   |   5 var_name   001289 R
  1 vars       000026 R   |   5 wait       0014CA R   |   5 warm_ini   000596 R
  5 warm_sta   00081C R   |   5 words      001E5E R   |   5 words_co   001EAE R
  5 write      001B55 R   |   5 write_bl   000166 R   |   5 write_by   0000F1 R
  5 write_ee   00012D R   |   5 write_ex   000161 R   |   5 write_fl   000117 R
  5 xpeek      001567 R   |     xreceive   ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   260E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

