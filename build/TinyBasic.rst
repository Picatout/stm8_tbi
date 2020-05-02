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
                                                ; bits 7:6  always 0 
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
                           000028    43     PAD_SIZE=40
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
      00000F                         72 tmp16: .blkb 1 ; 16 bit temporary storage high-byte 
      000010                         73 tmp8:  .blkb 1 ; 8 bit temporary storage, tmp16 low-byte 
      000011                         74 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000013                         75 timer: .blkw 1 ;  milliseconds count down timer 
      000015                         76 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000017                         77 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000019                         78 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      00001A                         79 ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001B                         80 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001C                         81 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001F                         82 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000021                         83 txtend: .blkw 1 ; tokenized BASIC text end address 
      000023                         84 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000024                         85 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000026                         86 flags: .blkb 1 ; various boolean flags
      000027                         87 tab_width: .blkb 1 ; print colon width (default 4)
      000028                         88 rx_char: .blkb 1 ; last received character from UART1 
      000029                         89 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     90 ; keep 'free_ram' as last variable 
      00005D                         91 free_ram: ; from here RAM free for BASIC text 
                                     92 
                                     93 ;;-----------------------------------
                                     94     .area SSEG (ABS)
                                     95 ;; working buffers and stack at end of RAM. 	
                                     96 ;;-----------------------------------
      0016E8                         97     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      0016E8                         98 tib: .ds TIB_SIZE             ; transaction input buffer
      001738                         99 pad: .ds PAD_SIZE             ; working buffer
      001760                        100 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        101 stack_unf: ; stack underflow ; control_stack bottom 
                                    102 
                                    103 ;;--------------------------------------
                                    104     .area HOME 
                                    105 ;; interrupt vector table at 0x8000
                                    106 ;;--------------------------------------
      008000 82 00 85 6D            107     int cold_start			; RESET vector 
                           000000   108 .if DEBUG
                                    109 	int TrapHandler 		;TRAP  software interrupt
                           000001   110 .else
      008004 82 00 80 80            111 	int NonHandledInterrupt ;TRAP  software interrupt
                                    112 .endif
      008008 82 00 80 80            113 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            114 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            115 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            116 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            117 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            118 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            119 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 CD            120 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            121 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            122 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            123 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            124 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            125 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            126 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            127 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            128 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            129 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            130 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            131 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            132 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            133 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            134 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            135 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 B7            136 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            137 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      00806C 82 00 80 80            138 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            139 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            140 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            141 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            142 	int NonHandledInterrupt ;int29  not used
                                    143 
                                    144 ;---------------------------------------
                                    145     .area CODE
                                    146 ;---------------------------------------
                           000000   147 .if DEBUG
                                    148 .asciz "STM8_TBI" ; I like to put module name here.
                                    149 .endif 
                                    150 
                                    151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    152 ; non handled interrupt 
                                    153 ; reset MCU
                                    154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        155 NonHandledInterrupt:
      008080 71                     156     .byte 0x71  ; invalid opcode reinitialize MCU
                                    157 
                                    158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    159 ; auto wakeup from halt
                                    160 ; at iret, program continue 
                                    161 ; after hatl instruction
                                    162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        163 AWUHandler:
      008081 72 19 50 F0      [ 1]  164 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  165 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  166 	clr AWU_TBR 
      00808E 80               [11]  167 	iret
                                    168 
                                    169 ;--------------------------
                                    170 ; UART1 receive character
                                    171 ; CTRL-C (ASCII 3)
                                    172 ; cancel program execution
                                    173 ; and fall back to command line
                                    174 ;--------------------------
      00808F                        175 Uart1RxHandler:
      00808F 72 0B 52 30 FB   [ 2]  176 	btjf UART1_SR,#UART_SR_RXNE,.
      008094 C6 52 31         [ 1]  177 	ld a,UART1_DR 
      008097 A1 03            [ 1]  178 	cp a,#CTRL_C 
      008099 26 07            [ 1]  179 	jrne 1$
      00809B 72 5F 00 28      [ 1]  180 	clr rx_char 
      00809F CC 80 E0         [ 2]  181 	jp user_interrupted
      0080A2                        182 1$:
      0080A2 A1 18            [ 1]  183 	cp a,#CAN 
      0080A4 26 03            [ 1]  184 	jrne 2$
      0080A6 CC 85 6D         [ 2]  185 	jp cold_start 	
      0080A9                        186 2$: 
      0080A9 A1 1A            [ 1]  187 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  188 	jrne 3$
      0080AD CD 86 32         [ 4]  189 	call cancel_autorun 
      0080B0 CC 85 6D         [ 2]  190 	jp cold_start 
      0080B3 C7 00 28         [ 1]  191 3$:	ld rx_char,a 	
      0080B6 80               [11]  192 	iret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    193 
                                    194 ;------------------------------------
                                    195 ; software interrupt handler  
                                    196 ;------------------------------------
                           000000   197 .if DEBUG 
                                    198 TrapHandler:
                                    199 	bset flags,#FTRAP 
                                    200 	call print_registers
                                    201 	call cmd_itf
                                    202 	bres flags,#FTRAP 	
                                    203 	iret
                                    204 .endif 
                                    205 
                                    206 ;------------------------------
                                    207 ; TIMER 4 is used to maintain 
                                    208 ; a milliseconds 'ticks' counter
                                    209 ; and decrement 'timer' varaiable
                                    210 ;--------------------------------
      0080B7                        211 Timer4UpdateHandler:
      0080B7 72 5F 53 42      [ 1]  212 	clr TIM4_SR 
      0080BB CE 00 11         [ 2]  213 	ldw x,ticks
      0080BE 5C               [ 2]  214 	incw x
      0080BF CF 00 11         [ 2]  215 	ldw ticks,x 
      0080C2 CE 00 13         [ 2]  216 	ldw x,timer
      0080C5 5D               [ 2]  217 	tnzw x 
      0080C6 27 04            [ 1]  218 	jreq 1$
      0080C8 5A               [ 2]  219 	decw x 
      0080C9 CF 00 13         [ 2]  220 	ldw timer,x 
      0080CC                        221 1$:	
      0080CC 80               [11]  222 	iret 
                                    223 
                                    224 
                                    225 ;------------------------------------
                                    226 ; Triggered by pressing USER UserButton 
                                    227 ; on NUCLEO card.
                                    228 ; This is used to abort a progam lock 
                                    229 ; in infinite loop. 
                                    230 ;------------------------------------
      0080CD                        231 UserButtonHandler:
                                    232 ; wait button release
      0080CD 5F               [ 1]  233 	clrw x
      0080CE 5A               [ 2]  234 1$: decw x 
      0080CF 26 FD            [ 1]  235 	jrne 1$
      0080D1 72 09 50 15 F8   [ 2]  236 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    237 ; if MCU suspended by SLEEP resume program
      0080D6 72 07 00 26 05   [ 2]  238     btjf flags,#FSLEEP,2$
      0080DB 72 17 00 26      [ 1]  239 	bres flags,#FSLEEP 
      0080DF 80               [11]  240 	iret
      0080E0                        241 2$:	
      0080E0                        242 user_interrupted:
      0080E0 72 00 00 26 02   [ 2]  243     btjt flags,#FRUN,4$
      0080E5 20 13            [ 2]  244 	jra UBTN_Handler_exit 
      0080E7                        245 4$:	; program interrupted by user 
      0080E7 72 11 00 26      [ 1]  246 	bres flags,#FRUN 
      0080EB AE 81 02         [ 2]  247 	ldw x,#USER_ABORT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080EE CD 82 57         [ 4]  248 	call puts 
      0080F1 CE 00 05         [ 2]  249 	ldw x,basicptr 
      0080F4 C6 00 02         [ 1]  250 	ld a,in 
      0080F7 CD 92 DA         [ 4]  251 	call prt_basic_line
      0080FA                        252 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  253     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  254     ldw sp,x
      0080FE 9A               [ 1]  255 	rim 
      0080FF CC 88 2D         [ 2]  256 	jp warm_start
                                    257 
      008102 0A 50 72 6F 67 72 61   258 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    259 
                                    260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    261 ;    peripherals initialization
                                    262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    263 
                                    264 ;----------------------------------------
                                    265 ; inialize MCU clock 
                                    266 ; input:
                                    267 ;   A 		source  HSI | 1 HSE 
                                    268 ;   XL      CLK_CKDIVR , clock divisor 
                                    269 ; output:
                                    270 ;   none 
                                    271 ;----------------------------------------
      00811D                        272 clock_init:	
      00811D C1 50 C3         [ 1]  273 	cp a,CLK_CMSR 
      008120 27 0C            [ 1]  274 	jreq 2$ ; no switching required 
                                    275 ; select clock source 
      008122 72 12 50 C5      [ 1]  276 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008126 C7 50 C4         [ 1]  277 	ld CLK_SWR,a
      008129 C1 50 C3         [ 1]  278 1$:	cp a,CLK_CMSR
      00812C 26 FB            [ 1]  279 	jrne 1$
      00812E                        280 2$: 	
                                    281 ; HSI and cpu clock divisor 
      00812E 9F               [ 1]  282 	ld a,xl 
      00812F C7 50 C6         [ 1]  283 	ld CLK_CKDIVR,a  
      008132 81               [ 4]  284 	ret
                                    285 
                                    286 ;----------------------------------
                                    287 ; TIMER2 used as audio tone output 
                                    288 ; on port D:5.
                                    289 ; channel 1 configured as PWM mode 1 
                                    290 ;-----------------------------------  
                           00F424   291 TIM2_CLK_FREQ=62500
      008133                        292 timer2_init:
      008133 72 1A 50 C7      [ 1]  293 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008137 35 60 53 05      [ 1]  294  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00813B 35 08 53 0C      [ 1]  295 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00813F 81               [ 4]  296 	ret 
                                    297 
                                    298 ;---------------------------------
                                    299 ; TIM4 is configured to generate an 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    300 ; interrupt every millisecond 
                                    301 ;----------------------------------
      008140                        302 timer4_init:
      008140 72 18 50 C7      [ 1]  303 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008144 35 07 53 45      [ 1]  304 	mov TIM4_PSCR,#7 ; prescale 128  
      008148 35 7D 53 46      [ 1]  305 	mov TIM4_ARR,#125 ; set for 1msec.
      00814C 35 05 53 40      [ 1]  306 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008150 72 10 53 41      [ 1]  307 	bset TIM4_IER,#TIM4_IER_UIE
      008154 81               [ 4]  308 	ret
                                    309 
                                    310 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    311 ;  routines to write to FLASH, EEPROM 
                                    312 ;  and OPTION 
                                    313 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    314 
                                    315 ;----------------------------------
                                    316 ; unlock EEPROM/OPT for writing/erasing
                                    317 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    318 ; input:
                                    319 ;  none
                                    320 ; output:
                                    321 ;  none 
                                    322 ;----------------------------------
      008155                        323 unlock_eeprom:
      008155 35 AE 50 64      [ 1]  324 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008159 35 56 50 64      [ 1]  325     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00815D 72 07 50 5F FB   [ 2]  326 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008162 81               [ 4]  327 	ret
                                    328 
                                    329 ;----------------------------------
                                    330 ; unlock FLASH for writing/erasing
                                    331 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    332 ; input:
                                    333 ;  none
                                    334 ; output:
                                    335 ;  none
                                    336 ;----------------------------------
      008163                        337 unlock_flash:
      008163 35 56 50 62      [ 1]  338 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008167 35 AE 50 62      [ 1]  339 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00816B 72 03 50 5F FB   [ 2]  340 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008170 81               [ 4]  341 	ret
                                    342 
                           000000   343 USE_BLOCK_ERASE=0 
                           000000   344 .if USE_BLOCK_ERASE 
                                    345 ; this code is copied to RAM 
                                    346 
                                    347 ;----------------------------
                                    348 ; erase block code must be 
                                    349 ; executed from RAM
                                    350 ;-----------------------------
                                    351 erase_start:
                                    352 	clr a 
                                    353     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    354     bres FLASH_NCR2,#FLASH_CR2_ERASE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    355 	ldf [farptr],a
                                    356     inc farptr+2 
                                    357     ldf [farptr],a
                                    358     inc farptr+2 
                                    359     ldf [farptr],a
                                    360     inc farptr+2 
                                    361     ldf [farptr],a
                                    362 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    363 	ret
                                    364 erase_end:
                                    365 
                                    366 ; copy erase_start in RAM 
                                    367 move_code_in_ram:
                                    368 	ldw x,#erase_end 
                                    369 	subw x,#erase_start
                                    370 	ldw acc16,x 
                                    371 	ldw x,#pad 
                                    372 	ldw y,#erase_start 
                                    373 	call move 
                                    374 	ret 
                                    375 
                                    376 ;-----------------------------------
                                    377 ; erase flash or EEPROM block 
                                    378 ; a block is 128 bytes 
                                    379 ; input:
                                    380 ;   farptr  address block begin
                                    381 ; output:
                                    382 ;   none
                                    383 ;--------------------------------------
                                    384 erase_block:
                                    385 	ldw x,farptr+1 
                                    386 	pushw x 
                                    387 	call move_code_in_ram 
                                    388 	popw x 
                                    389 	ldw farptr+1,x 
                                    390 	tnz farptr
                                    391 	jrne erase_flash 
                                    392 	ldw x,#FLASH_BASE 
                                    393 	cpw x,farptr+1 
                                    394 	jrpl erase_flash 
                                    395 ; erase eeprom block
                                    396 	call unlock_eeprom 
                                    397 	sim 
                                    398 	call pad   
                                    399 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    400 	rim 
                                    401 	ret 
                                    402 ; erase flash block:
                                    403 erase_flash:
                                    404 	call unlock_flash 
                                    405 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    406 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    407 	clr a 
                                    408 	sim 
                                    409 	call pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    410     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    411 	rim 
                                    412 	ret 
                                    413 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    414 
                                    415 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    416 ; write a byte to FLASH or EEPROM/OPTION  
                                    417 ; input:
                                    418 ;    a  		byte to write
                                    419 ;    farptr  	address
                                    420 ;    x          farptr[x]
                                    421 ; output:
                                    422 ;    none
                                    423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    424 	; variables locales
                           000001   425 	BTW = 1   ; byte to write offset on stack
                           000002   426 	OPT = 2   ; OPTION flag offset on stack
                           000002   427 	VSIZE = 2
      008171                        428 write_byte:
      008171 90 89            [ 2]  429 	pushw y
      0000F3                        430 	_vars VSIZE
      008173 52 02            [ 2]    1     sub sp,#VSIZE 
      008175 6B 01            [ 1]  431 	ld (BTW,sp),a ; byte to write 
      008177 0F 02            [ 1]  432 	clr (OPT,sp)  ; OPTION flag
                                    433 ; put addr[15:0] in Y, for bounds check.
      008179 90 CE 00 1A      [ 2]  434 	ldw y,farptr+1   ; Y=addr15:0
                                    435 ; check addr[23:16], if <> 0 then it is extened flash memory
      00817D 72 5D 00 19      [ 1]  436 	tnz farptr 
      008181 26 14            [ 1]  437 	jrne write_flash
      008183 90 A3 A6 80      [ 2]  438     cpw y,#user_space
      008187 24 0E            [ 1]  439     jruge write_flash
      008189 90 A3 40 00      [ 2]  440 	cpw y,#EEPROM_BASE  
      00818D 25 52            [ 1]  441     jrult write_exit
      00818F 90 A3 48 7F      [ 2]  442 	cpw y,#OPTION_END 
      008193 22 4C            [ 1]  443 	jrugt write_exit
      008195 20 16            [ 2]  444 	jra write_eeprom 
                                    445 ; write program memory
      008197                        446 write_flash:
      008197 CD 81 63         [ 4]  447 	call unlock_flash 
      00819A 9B               [ 1]  448 1$:	sim 
      00819B 7B 01            [ 1]  449 	ld a,(BTW,sp)
      00819D 92 A7 00 19      [ 4]  450 	ldf ([farptr],x),a ; farptr[x]=A
      0081A1 72 05 50 5F FB   [ 2]  451 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081A6 9A               [ 1]  452     rim 
      0081A7 72 13 50 5F      [ 1]  453     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081AB 20 34            [ 2]  454     jra write_exit
                                    455 ; write eeprom and option
      0081AD                        456 write_eeprom:
      0081AD CD 81 55         [ 4]  457 	call unlock_eeprom
                                    458 	; check for data eeprom or option eeprom
      0081B0 90 A3 48 00      [ 2]  459 	cpw y,#OPTION_BASE
      0081B4 2B 08            [ 1]  460 	jrmi 1$
      0081B6 90 A3 48 80      [ 2]  461 	cpw y,#OPTION_END+1
      0081BA 2A 02            [ 1]  462 	jrpl 1$
      0081BC 03 02            [ 1]  463 	cpl (OPT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081BE                        464 1$: 
      0081BE 0D 02            [ 1]  465     tnz (OPT,sp)
      0081C0 27 08            [ 1]  466     jreq 2$
                                    467 	; pour modifier une option il faut modifier ces 2 bits
      0081C2 72 1E 50 5B      [ 1]  468     bset FLASH_CR2,#FLASH_CR2_OPT
      0081C6 72 1F 50 5C      [ 1]  469     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081CA                        470 2$: 
      0081CA 7B 01            [ 1]  471     ld a,(BTW,sp)
      0081CC 92 A7 00 19      [ 4]  472     ldf ([farptr],x),a
      0081D0 0D 02            [ 1]  473     tnz (OPT,sp)
      0081D2 27 08            [ 1]  474     jreq 3$
      0081D4 5C               [ 2]  475     incw x
      0081D5 7B 01            [ 1]  476     ld a,(BTW,sp)
      0081D7 43               [ 1]  477     cpl a
      0081D8 92 A7 00 19      [ 4]  478     ldf ([farptr],x),a
      0081DC 72 05 50 5F FB   [ 2]  479 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E1                        480 write_exit:
      000161                        481 	_drop VSIZE 
      0081E1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081E3 90 85            [ 2]  482 	popw y
      0081E5 81               [ 4]  483     ret
                                    484 
                                    485 ;--------------------------------------------
                                    486 ; write a data block to eeprom or flash 
                                    487 ; input:
                                    488 ;   Y        source address   
                                    489 ;   X        array index  destination  farptr[x]
                                    490 ;   BSIZE    block size bytes 
                                    491 ;   farptr   write address , byte* 
                                    492 ; output:
                                    493 ;	X 		after last byte written 
                                    494 ;   Y 		after last byte read 
                                    495 ;  farptr   point after block
                                    496 ;---------------------------------------------
      0081E6                        497 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000166                        498 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    499 	; local var 
                           000001   500 	XSAVE=1 
                           000002   501 	VSIZE=2 
      000166                        502 write_block:
      000166                        503 	_vars VSIZE
      0081E6 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E8 1F 01            [ 2]  504 	ldw (XSAVE,sp),x 
      0081EA 1E 05            [ 2]  505 	ldw x,(BSIZE,sp) 
      0081EC 27 13            [ 1]  506 	jreq 9$
      0081EE 1E 01            [ 2]  507 1$:	ldw x,(XSAVE,sp)
      0081F0 90 F6            [ 1]  508 	ld a,(y)
      0081F2 CD 81 71         [ 4]  509 	call write_byte 
      0081F5 5C               [ 2]  510 	incw x 
      0081F6 90 5C            [ 2]  511 	incw y 
      0081F8 1F 01            [ 2]  512 	ldw (XSAVE,sp),x
      0081FA 1E 05            [ 2]  513 	ldw x,(BSIZE,sp)
      0081FC 5A               [ 2]  514 	decw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FD 1F 05            [ 2]  515 	ldw (BSIZE,sp),x 
      0081FF 26 ED            [ 1]  516 	jrne 1$
      008201                        517 9$:
      008201 1E 01            [ 2]  518 	ldw x,(XSAVE,sp)
      008203 CD 99 21         [ 4]  519 	call incr_farptr
      000186                        520 	_drop VSIZE
      008206 5B 02            [ 2]    1     addw sp,#VSIZE 
      008208 81               [ 4]  521 	ret 
                                    522 
                                    523 
                                    524 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    525 ;;   UART1 subroutines
                                    526 ;;   used for user interface 
                                    527 ;;   communication channel.
                                    528 ;;   settings: 
                                    529 ;;		115200 8N1 no flow control
                                    530 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    531 
                                    532 ;---------------------------------------------
                                    533 ; initialize UART1, 115200 8N1
                                    534 ; input:
                                    535 ;	none
                                    536 ; output:
                                    537 ;   none
                                    538 ;---------------------------------------------
      008209                        539 uart1_init:
      008209 72 1A 50 02      [ 1]  540     bset PA_DDR,#UART1_TX_PIN
      00820D 72 1A 50 03      [ 1]  541     bset PA_CR1,#UART1_TX_PIN 
      008211 72 1A 50 04      [ 1]  542     bset PA_CR2,#UART1_TX_PIN 
                                    543 ; enable UART1 clock
      008215 72 14 50 C7      [ 1]  544 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008219                        545 uart1_set_baud: 
                                    546 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    547 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008219 A6 E1            [ 1]  548 	ld a,#CLK_SWR_HSI
      00821B C1 50 C3         [ 1]  549 	cp a,CLK_CMSR 
      00821E 27 0A            [ 1]  550 	jreq 2$ 
      008220                        551 1$: ; 8 Mhz 	
      008220 35 05 52 33      [ 1]  552 	mov UART1_BRR2,#0x05 ; must be loaded first
      008224 35 04 52 32      [ 1]  553 	mov UART1_BRR1,#0x4
      008228 20 08            [ 2]  554 	jra 3$
      00822A                        555 2$: ; 16 Mhz 	
      00822A 35 0B 52 33      [ 1]  556 	mov UART1_BRR2,#0x0b ; must be loaded first
      00822E 35 08 52 32      [ 1]  557 	mov UART1_BRR1,#0x08
      008232                        558 3$:
      008232 72 5F 52 31      [ 1]  559     clr UART1_DR
      008236 35 2C 52 35      [ 1]  560 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00823A 72 10 52 35      [ 1]  561 	bset UART1_CR2,#UART_CR2_SBK
      00823E 72 0D 52 30 FB   [ 2]  562     btjf UART1_SR,#UART_SR_TC,.
      008243 81               [ 4]  563     ret
                                    564 
                                    565 ;---------------------------------
                                    566 ; send character to UART1 
                                    567 ; input:
                                    568 ;   A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    569 ; output:
                                    570 ;   none 
                                    571 ;--------------------------------	
      008244                        572 putc:
      008244 72 0F 52 30 FB   [ 2]  573 	btjf UART1_SR,#UART_SR_TXE,.
      008249 C7 52 31         [ 1]  574 	ld UART1_DR,a 
      00824C 81               [ 4]  575 	ret 
                                    576 
                                    577 ;---------------------------------
                                    578 ; wait character from UART1 
                                    579 ; input:
                                    580 ;   none
                                    581 ; output:
                                    582 ;   A 			char  
                                    583 ;--------------------------------	
      00824D                        584 getc:
      00824D C6 00 28         [ 1]  585 	ld a,rx_char 
      008250 27 FB            [ 1]  586 	jreq getc 
      008252 72 5F 00 28      [ 1]  587 	clr rx_char 
      008256 81               [ 4]  588 	ret 
                                    589 
                                    590 ;-----------------------------
                                    591 ; send an ASCIZ string to UART1 
                                    592 ; input: 
                                    593 ;   x 		char * 
                                    594 ; output:
                                    595 ;   none 
                                    596 ;-------------------------------
      008257                        597 puts:
      008257 F6               [ 1]  598     ld a,(x)
      008258 27 06            [ 1]  599 	jreq 1$
      00825A CD 82 44         [ 4]  600 	call putc 
      00825D 5C               [ 2]  601 	incw x 
      00825E 20 F7            [ 2]  602 	jra puts 
      008260 81               [ 4]  603 1$:	ret 
                                    604 
                                    605 
                                    606 ;---------------------------
                                    607 ; delete character at left 
                                    608 ; of cursor on terminal 
                                    609 ; input:
                                    610 ;   none 
                                    611 ; output:
                                    612 ;	none 
                                    613 ;---------------------------
      008261                        614 bksp:
      008261 A6 08            [ 1]  615 	ld a,#BS 
      008263 CD 82 44         [ 4]  616 	call putc 
      008266 A6 20            [ 1]  617 	ld a,#SPACE 
      008268 CD 82 44         [ 4]  618 	call putc 
      00826B A6 08            [ 1]  619 	ld a,#BS 
      00826D CD 82 44         [ 4]  620 	call putc 
      008270 81               [ 4]  621 	ret 
                                    622 ;---------------------------
                                    623 ; delete n character left of cursor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    624 ; at terminal.
                                    625 ; input: 
                                    626 ;   A   number of characters to delete.
                                    627 ; output:
                                    628 ;    none 
                                    629 ;--------------------------	
      008271                        630 delete:
      008271 88               [ 1]  631 	push a 
      008272 0D 01            [ 1]  632 0$:	tnz (1,sp)
      008274 27 07            [ 1]  633 	jreq 1$
      008276 CD 82 61         [ 4]  634 	call bksp 
      008279 0A 01            [ 1]  635 	dec (1,sp)
      00827B 20 F5            [ 2]  636 	jra 0$
      00827D 84               [ 1]  637 1$:	pop a 
      00827E 81               [ 4]  638 	ret
                                    639 
                                    640 ;--------------------------
                                    641 ; print n spaces on terminal
                                    642 ; input:
                                    643 ;  X 		number of spaces 
                                    644 ; output:
                                    645 ;	none 
                                    646 ;---------------------------
      00827F                        647 spaces:
      00827F A6 20            [ 1]  648 	ld a,#SPACE 
      008281 5D               [ 2]  649 1$:	tnzw x
      008282 27 06            [ 1]  650 	jreq 9$
      008284 CD 82 44         [ 4]  651 	call putc 
      008287 5A               [ 2]  652 	decw x
      008288 20 F7            [ 2]  653 	jra 1$
      00828A                        654 9$: 
      00828A 81               [ 4]  655 	ret 
                                    656 
                                    657 ;;;;;;;;;;;;;
                           000000   658 .if DEBUG 
                                    659 ;---------------------------------
                                    660 ;; print actual registers states 
                                    661 ;; as pushed on stack 
                                    662 ;; {Y,X,CC,A}
                                    663 ;---------------------------------
                                    664 	_argofs 0  
                                    665 	_arg R_Y 1 
                                    666 	_arg R_X 3
                                    667 	_arg R_A 5
                                    668 	_arg R_CC 6
                                    669 prt_regs:
                                    670 	ldw x,#regs_state 
                                    671 	call puts
                                    672 ; register PC
                                    673 	ldw y,(1,sp)
                                    674 	ldw x,#REG_EPC 
                                    675 	call prt_reg16 
                                    676 ; register CC 
                                    677 	ld a,(R_CC,sp)
                                    678 	ldw x,#REG_CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    679 	call prt_reg8 
                                    680 ; register A 
                                    681 	ld a,(R_A,sp)
                                    682 	ldw x,#REG_A 
                                    683 	call prt_reg8 
                                    684 ; register X 
                                    685 	ldw y,(R_X,sp)
                                    686 	ldw x,#REG_X 
                                    687 	call prt_reg16 
                                    688 ; register Y 
                                    689 	ldw y,(R_Y,sp)
                                    690 	ldw x,#REG_Y 
                                    691 	call prt_reg16 
                                    692 ; register SP 
                                    693 	ldw y,sp
                                    694 	addw y,#6+ARG_OFS  
                                    695 	ldw x,#REG_SP
                                    696 	call prt_reg16
                                    697 	ld a,#CR 
                                    698 	call putc
                                    699 	call putc   
                                    700 	ret 
                                    701 
                                    702 regs_state: .asciz "\nregisters state\n--------------------\n"
                                    703 
                                    704 
                                    705 ;--------------------
                                    706 ; print content at address in hex.
                                    707 ; input:
                                    708 ;   X 	address to peek 
                                    709 ; output:
                                    710 ;	none 
                                    711 ;--------------------	
                                    712 prt_peek:
                                    713 	pushw x 
                                    714 	ldw acc16,x 
                                    715 	clr acc24 
                                    716 	clrw x 
                                    717 	ld a,#16 
                                    718 	call prti24 
                                    719 	ld a,#': 
                                    720 	call putc 
                                    721 	ld a,#SPACE 
                                    722 	call putc 
                                    723 	popw x 
                                    724 	ld a,(x)
                                    725 	ld acc8,a 
                                    726 	clrw x 
                                    727 	ld a,#16 
                                    728 	call prti24
                                    729 	ret 
                                    730 .endif ; DEBUG  
                                    731 ;;;;;;;;;;;;;;;;;;;;	
                                    732 
                                    733 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    734 ; retrun string length
                                    735 ; input:
                                    736 ;   X         .asciz  pointer 
                                    737 ; output:
                                    738 ;   X         length 
                                    739 ;-------------------------------------
      00828B                        740 strlen:
      00828B 90 93            [ 1]  741 	ldw y,x 
      00828D 5F               [ 1]  742 	clrw x 
      00828E 90 7D            [ 1]  743 1$:	tnz (y) 
      008290 27 05            [ 1]  744 	jreq 9$ 
      008292 5C               [ 2]  745 	incw x
      008293 90 5C            [ 2]  746 	incw y 
      008295 20 F7            [ 2]  747 	jra 1$ 
      008297 81               [ 4]  748 9$: ret 
                                    749 
                                    750 ;------------------------------------
                                    751 ; compare 2 strings
                                    752 ; input:
                                    753 ;   X 		char* first string 
                                    754 ;   Y       char* second string 
                                    755 ; output:
                                    756 ;   A 		0|1 
                                    757 ;-------------------------------------
      008298                        758 strcmp:
      008298 F6               [ 1]  759 	ld a,(x)
      008299 27 0B            [ 1]  760 	jreq 5$ 
      00829B 90 F1            [ 1]  761 	cp a,(y) 
      00829D 26 05            [ 1]  762 	jrne 4$ 
      00829F 5C               [ 2]  763 	incw x 
      0082A0 90 5C            [ 2]  764 	incw y 
      0082A2 20 F4            [ 2]  765 	jra strcmp 
      0082A4                        766 4$: ; not same  
      0082A4 4F               [ 1]  767 	clr a 
      0082A5 81               [ 4]  768 	ret 
      0082A6                        769 5$: ; same 
      0082A6 A6 01            [ 1]  770 	ld a,#1 
      0082A8 81               [ 4]  771 	ret 
                                    772 
                                    773 
                                    774 ;---------------------------------------
                                    775 ;  copy src to dest 
                                    776 ; input:
                                    777 ;   X 		dest 
                                    778 ;   Y 		src 
                                    779 ; output: 
                                    780 ;   X 		dest 
                                    781 ;----------------------------------
      0082A9                        782 strcpy:
      0082A9 89               [ 2]  783 	pushw x 
      0082AA 90 F6            [ 1]  784 1$: ld a,(y)
      0082AC 27 06            [ 1]  785 	jreq 9$ 
      0082AE F7               [ 1]  786 	ld (x),a 
      0082AF 5C               [ 2]  787 	incw x 
      0082B0 90 5C            [ 2]  788 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0082B2 20 F6            [ 2]  789 	jra 1$ 
      0082B4 7F               [ 1]  790 9$:	clr (x)
      0082B5 85               [ 2]  791 	popw x 
      0082B6 81               [ 4]  792 	ret 
                                    793 
                                    794 ;---------------------------------------
                                    795 ; move memory block 
                                    796 ; input:
                                    797 ;   X 		destination 
                                    798 ;   Y 	    source 
                                    799 ;   acc16	bytes count 
                                    800 ; output:
                                    801 ;   none 
                                    802 ;--------------------------------------
                           000001   803 	INCR=1 ; increament high byte 
                           000002   804 	LB=2 ; increament low byte 
                           000002   805 	VSIZE=2
      0082B7                        806 move:
      000237                        807 	_vars VSIZE 
      0082B7 52 02            [ 2]    1     sub sp,#VSIZE 
      0082B9 0F 01            [ 1]  808 	clr (INCR,sp)
      0082BB 0F 02            [ 1]  809 	clr (LB,sp)
      0082BD 90 89            [ 2]  810 	pushw y 
      0082BF 13 01            [ 2]  811 	cpw x,(1,sp) ; compare DEST to SRC 
      0082C1 90 85            [ 2]  812 	popw y 
      0082C3 27 31            [ 1]  813 	jreq move_exit ; x==y 
      0082C5 2B 0E            [ 1]  814 	jrmi move_down
      0082C7                        815 move_up: ; start from top address with incr=-1
      0082C7 72 BB 00 0D      [ 2]  816 	addw x,acc16
      0082CB 72 B9 00 0D      [ 2]  817 	addw y,acc16
      0082CF 03 01            [ 1]  818 	cpl (INCR,sp)
      0082D1 03 02            [ 1]  819 	cpl (LB,sp)   ; increment = -1 
      0082D3 20 05            [ 2]  820 	jra move_loop  
      0082D5                        821 move_down: ; start from bottom address with incr=1 
      0082D5 5A               [ 2]  822     decw x 
      0082D6 90 5A            [ 2]  823 	decw y
      0082D8 0C 02            [ 1]  824 	inc (LB,sp) ; incr=1 
      0082DA                        825 move_loop:	
      0082DA C6 00 0D         [ 1]  826     ld a, acc16 
      0082DD CA 00 0E         [ 1]  827 	or a, acc8
      0082E0 27 14            [ 1]  828 	jreq move_exit 
      0082E2 72 FB 01         [ 2]  829 	addw x,(INCR,sp)
      0082E5 72 F9 01         [ 2]  830 	addw y,(INCR,sp) 
      0082E8 90 F6            [ 1]  831 	ld a,(y)
      0082EA F7               [ 1]  832 	ld (x),a 
      0082EB 89               [ 2]  833 	pushw x 
      0082EC CE 00 0D         [ 2]  834 	ldw x,acc16 
      0082EF 5A               [ 2]  835 	decw x 
      0082F0 CF 00 0D         [ 2]  836 	ldw acc16,x 
      0082F3 85               [ 2]  837 	popw x 
      0082F4 20 E4            [ 2]  838 	jra move_loop
      0082F6                        839 move_exit:
      000276                        840 	_drop VSIZE
      0082F6 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082F8 81               [ 4]  841 	ret 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    842 
                                    843 ;-------------------------------------
                                    844 ; search text area for a line#
                                    845 ; input:
                                    846 ;	X 			line# 
                                    847 ; output:
                                    848 ;   X 			addr of line | 0 
                                    849 ;   Y           line#|insert address if not found  
                                    850 ;-------------------------------------
                           000001   851 	LL=1 ; line length 
                           000002   852 	LB=2 ; line length low byte 
                           000002   853 	VSIZE=2 
      0082F9                        854 search_lineno:
      000279                        855 	_vars VSIZE
      0082F9 52 02            [ 2]    1     sub sp,#VSIZE 
      0082FB 0F 01            [ 1]  856 	clr (LL,sp)
      0082FD 90 CE 00 1F      [ 2]  857 	ldw y,txtbgn
      008301                        858 search_ln_loop:
      008301 90 C3 00 21      [ 2]  859 	cpw y,txtend 
      008305 2A 10            [ 1]  860 	jrpl 8$
      008307 90 F3            [ 1]  861 	cpw x,(y)
      008309 27 0E            [ 1]  862 	jreq 9$
      00830B 2B 0A            [ 1]  863 	jrmi 8$ 
      00830D 90 E6 02         [ 1]  864 	ld a,(2,y)
      008310 6B 02            [ 1]  865 	ld (LB,sp),a 
      008312 72 F9 01         [ 2]  866 	addw y,(LL,sp)
      008315 20 EA            [ 2]  867 	jra search_ln_loop 
      008317                        868 8$: 
      008317 5F               [ 1]  869 	clrw x 	
      008318 51               [ 1]  870 	exgw x,y 
      000299                        871 9$: _drop VSIZE
      008319 5B 02            [ 2]    1     addw sp,#VSIZE 
      00831B 51               [ 1]  872 	exgw x,y   
      00831C 81               [ 4]  873 	ret 
                                    874 
                                    875 ;-------------------------------------
                                    876 ; delete line at addr
                                    877 ; move new line to insert with end of text 
                                    878 ; otherwise it would be overwritten.
                                    879 ; input:
                                    880 ;   X 		addr of line i.e DEST for move 
                                    881 ;-------------------------------------
                           000001   882 	LLEN=1
                           000003   883 	SRC=3
                           000004   884 	VSIZE=4
      00831D                        885 del_line: 
      00029D                        886 	_vars VSIZE 
      00831D 52 04            [ 2]    1     sub sp,#VSIZE 
      00831F E6 02            [ 1]  887 	ld a,(2,x) ; line length
      008321 6B 02            [ 1]  888 	ld (LLEN+1,sp),a 
      008323 0F 01            [ 1]  889 	clr (LLEN,sp)
      008325 90 93            [ 1]  890 	ldw y,x  
      008327 72 F9 01         [ 2]  891 	addw y,(LLEN,sp) ;SRC  
      00832A 17 03            [ 2]  892 	ldw (SRC,sp),y  ;save source 
      00832C 90 CE 00 21      [ 2]  893 	ldw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008330 90 E6 02         [ 1]  894 	ld a,(2,y)
      008333 90 5F            [ 1]  895 	clrw y 
      008335 90 97            [ 1]  896 	ld yl,a  
      008337 72 B9 00 21      [ 2]  897 	addw y,txtend
      00833B 72 F2 03         [ 2]  898 	subw y,(SRC,sp) ; y=count 
      00833E 90 CF 00 0D      [ 2]  899 	ldw acc16,y 
      008342 16 03            [ 2]  900 	ldw y,(SRC,sp)    ; source
      008344 CD 82 B7         [ 4]  901 	call move
      008347 90 CE 00 21      [ 2]  902 	ldw y,txtend 
      00834B 72 F2 01         [ 2]  903 	subw y,(LLEN,sp)
      00834E 90 CF 00 21      [ 2]  904 	ldw txtend,y  
      0002D2                        905 	_drop VSIZE     
      008352 5B 04            [ 2]    1     addw sp,#VSIZE 
      008354 81               [ 4]  906 	ret 
                                    907 
                                    908 ;---------------------------------------------
                                    909 ; create a gap in text area 
                                    910 ; move new line to insert in gap with end of text
                                    911 ; otherwise it would be overwritten.
                                    912 ; input:
                                    913 ;    X 			addr gap start 
                                    914 ;    Y 			gap length 
                                    915 ; output:
                                    916 ;    X 			addr gap start 
                                    917 ;--------------------------------------------
                           000001   918 	DEST=1
                           000003   919 	SRC=3
                           000005   920 	LEN=5
                           000006   921 	VSIZE=6 
      008355                        922 create_gap:
      0002D5                        923 	_vars VSIZE
      008355 52 06            [ 2]    1     sub sp,#VSIZE 
      008357 1F 03            [ 2]  924 	ldw (SRC,sp),x 
      008359 17 05            [ 2]  925 	ldw (LEN,sp),y 
      00835B 90 CF 00 0D      [ 2]  926 	ldw acc16,y 
      00835F 90 93            [ 1]  927 	ldw y,x ; SRC
      008361 72 BB 00 0D      [ 2]  928 	addw x,acc16  
      008365 1F 01            [ 2]  929 	ldw (DEST,sp),x 
                                    930 ;compute size to move 	
      008367 CE 00 21         [ 2]  931 	ldw x,txtend 
      00836A E6 02            [ 1]  932 	ld a,(2,x) ; pending line length 
      00836C C7 00 0E         [ 1]  933 	ld acc8,a 
      00836F 72 5F 00 0D      [ 1]  934 	clr acc16 
      008373 72 BB 00 0D      [ 2]  935 	addw x,acc16 
      008377 72 F0 03         [ 2]  936 	subw x,(SRC,sp)
      00837A CF 00 0D         [ 2]  937 	ldw acc16,x ; size to move
      00837D 1E 01            [ 2]  938 	ldw x,(DEST,sp) 
      00837F CD 82 B7         [ 4]  939 	call move
      008382 CE 00 21         [ 2]  940 	ldw x,txtend
      008385 72 FB 05         [ 2]  941 	addw x,(LEN,sp)
      008388 CF 00 21         [ 2]  942 	ldw txtend,x
      00030B                        943 9$:	_drop VSIZE 
      00838B 5B 06            [ 2]    1     addw sp,#VSIZE 
      00838D 81               [ 4]  944 	ret 
                                    945 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    946 
                                    947 ;--------------------------------------------
                                    948 ; insert line in tib into text area 
                                    949 ; first search for already existing 
                                    950 ; replace existing 
                                    951 ; if strlen(tib)==0 delete existing line
                                    952 ; input:
                                    953 ;   ptr16 				pointer to tokenized line  
                                    954 ; output:
                                    955 ;   none
                                    956 ;---------------------------------------------
                           000001   957 	DEST=1  ; text area insertion address 
                           000003   958 	SRC=3   ; str to insert address 
                           000005   959 	LINENO=5 ; line number 
                           000007   960 	LLEN=7 ; line length 
                           000008   961 	VSIZE=8  
      00838E                        962 insert_line:
      00030E                        963 	_vars VSIZE 
      00838E 52 08            [ 2]    1     sub sp,#VSIZE 
      008390 CE 00 1A         [ 2]  964 	ldw x,ptr16  
      008393 C3 00 1F         [ 2]  965 	cpw x,txtbgn 
      008396 26 0D            [ 1]  966 	jrne 0$
                                    967 ;first text line 
      008398 AE 00 02         [ 2]  968 	ldw x,#2 
      00839B 72 D6 00 1A      [ 4]  969 	ld a,([ptr16],x)
      00839F 5F               [ 1]  970 	clrw x 
      0083A0 97               [ 1]  971 	ld xl,a
      0083A1 1F 07            [ 2]  972 	ldw (LLEN,sp),x  
      0083A3 20 45            [ 2]  973 	jra 5$
      0083A5 72 CE 00 1A      [ 5]  974 0$:	ldw x,[ptr16]
                                    975 ; new line number
      0083A9 1F 05            [ 2]  976 	ldw (LINENO,sp),x 
      0083AB AE 00 02         [ 2]  977 	ldw x,#2 
      0083AE 72 D6 00 1A      [ 4]  978 	ld a,([ptr16],x)
      0083B2 97               [ 1]  979 	ld xl,a
                                    980 ; new line length
      0083B3 1F 07            [ 2]  981 	ldw (LLEN,sp),x
                                    982 ; check if that line number already exit 	
      0083B5 1E 05            [ 2]  983 	ldw x,(LINENO,sp)
      0083B7 CD 82 F9         [ 4]  984 	call search_lineno 
      0083BA 5D               [ 2]  985 	tnzw x 
      0083BB 26 04            [ 1]  986 	jrne 2$
                                    987 ; line doesn't exit
                                    988 ; it will be inserted at this point.  	
      0083BD 17 01            [ 2]  989 	ldw (DEST,sp),y 
      0083BF 20 05            [ 2]  990 	jra 3$
                                    991 ; line exit delete it.
                                    992 ; it will be replaced by new one 	
      0083C1 1F 01            [ 2]  993 2$: ldw (DEST,sp),x 
      0083C3 CD 83 1D         [ 4]  994 	call del_line
      0083C6                        995 3$: 
                                    996 ; insert new line or leave if LLEN==3
                                    997 ; LLEN==3 means empty line 
      0083C6 A6 03            [ 1]  998 	ld a,#3
      0083C8 11 08            [ 1]  999 	cp a,(LLEN+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0083CA 27 27            [ 1] 1000 	jreq insert_ln_exit ; empty line exit.
                                   1001 ; if insertion point at txtend 
                                   1002 ; no move required 
      0083CC 1E 01            [ 2] 1003 	ldw x,(DEST,sp)
      0083CE C3 00 21         [ 2] 1004 	cpw x,txtend 
      0083D1 2A 17            [ 1] 1005 	jrpl 5$ 
                                   1006 ; must create a gap
                                   1007 ; at insertion point  
      0083D3 1E 01            [ 2] 1008 	ldw x,(DEST,sp)
      0083D5 16 07            [ 2] 1009 	ldw y,(LLEN,sp)
      0083D7 CD 83 55         [ 4] 1010 	call create_gap 
                                   1011 ; move new line in gap 
      0083DA 1E 07            [ 2] 1012 	ldw x,(LLEN,sp)
      0083DC CF 00 0D         [ 2] 1013 	ldw acc16,x 
      0083DF 90 CE 00 21      [ 2] 1014 	ldw y,txtend ;SRC 
      0083E3 1E 01            [ 2] 1015 	ldw x,(DEST,sp) ; dest address 
      0083E5 CD 82 B7         [ 4] 1016 	call move 
      0083E8 20 09            [ 2] 1017 	jra insert_ln_exit  
      0083EA                       1018 5$: ; no move required 
      0083EA 1E 07            [ 2] 1019 	ldw x,(LLEN,sp) 
      0083EC 72 BB 00 21      [ 2] 1020 	addw x,txtend 
      0083F0 CF 00 21         [ 2] 1021 	ldw txtend,x 
      0083F3                       1022 insert_ln_exit:	
      000373                       1023 	_drop VSIZE
      0083F3 5B 08            [ 2]    1     addw sp,#VSIZE 
      0083F5 81               [ 4] 1024 	ret
                                   1025 
                                   1026 
                                   1027 ;-----------------------------
                                   1028 ; check if text buffer full
                                   1029 ; input:
                                   1030 ;   ptr16     addr start tokenize line 
                                   1031 ;   X         buffer index 
                                   1032 ; output:
                                   1033 ;   none 
                                   1034 ;-----------------------------------
      0083F6                       1035 check_full:
      0083F6 72 BB 00 1A      [ 2] 1036 	addw x,ptr16 
      0083FA A3 16 E8         [ 2] 1037 	cpw x,#tib 
      0083FD 25 05            [ 1] 1038 	jrult 1$
      0083FF A6 01            [ 1] 1039 	ld a,#ERR_MEM_FULL
      008401 CC 87 E4         [ 2] 1040 	jp tb_error 
      008404 81               [ 4] 1041 1$: ret 
                                   1042 
                                   1043 ;-----------------------------------
                                   1044 ; create token list fromm text line 
                                   1045 ; save this list in text area
                                   1046 ;  compiled line format: 
                                   1047 ;    line_no  2 bytes {0...32767}
                                   1048 ;    count    1 byte  
                                   1049 ;    tokens   variable length 
                                   1050 ;   
                                   1051 ; input:
                                   1052 ;   none
                                   1053 ; modified variables:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1054 ;   basicptr     token list buffer address 
                                   1055 ;   in.w  		 3|count, i.e. index in buffer
                                   1056 ;   count        length of line | 0  
                                   1057 ;-----------------------------------
                           000001  1058 	XSAVE=1
                           000003  1059 	BUFIDX=3
                           000004  1060 	VSIZE=4
      008405                       1061 compile:
      000385                       1062 	_vars VSIZE 
      008405 52 04            [ 2]    1     sub sp,#VSIZE 
      008407 72 1A 00 26      [ 1] 1063 	bset flags,#FCOMP 
      00840B CE 00 21         [ 2] 1064 	ldw x,txtend
      00840E CF 00 1A         [ 2] 1065 	ldw ptr16,x ; code buffer start address 
      008411 AE 00 03         [ 2] 1066 	ldw x,#3
      008414 1F 03            [ 2] 1067 	ldw (BUFIDX,sp),X  
      008416 CD 83 F6         [ 4] 1068 	call check_full
      008419 5F               [ 1] 1069 	clrw x 
      00841A 72 CF 00 1A      [ 5] 1070 	ldw [ptr16],x ; initialize line# to zero 
      00841E CD 8B E3         [ 4] 1071 	call get_token
      008421 1F 01            [ 2] 1072 	ldw (XSAVE,sp),x 
      008423 A1 04            [ 1] 1073 	cp a,#TK_INTGR 
      008425 26 13            [ 1] 1074 	jrne 3$
      008427 A3 00 00         [ 2] 1075 	cpw x,#0 
      00842A 2C 05            [ 1] 1076 	jrsgt 1$
      00842C A6 0A            [ 1] 1077 	ld a,#ERR_BAD_VALUE 
      00842E CC 87 E4         [ 2] 1078 	jp tb_error ; line number must be in range {1..32767}
      008431 72 CF 00 1A      [ 5] 1079 1$:	ldw [ptr16],x; line number
      008435 CD 8B E3         [ 4] 1080 2$:	call get_token
      008438 1F 01            [ 2] 1081 	ldw (XSAVE,sp),x 
      00843A A1 00            [ 1] 1082 3$:	cp a,#TK_NONE 
      00843C 26 03            [ 1] 1083 	jrne 30$
      00843E CC 84 CF         [ 2] 1084 	jp 9$ ; end of line. 
      008441                       1085 30$: 	 
      008441 1E 03            [ 2] 1086 	ldw x,(BUFIDX,sp)
      008443 CD 83 F6         [ 4] 1087 	call check_full 
      008446 16 03            [ 2] 1088 	ldw y,(BUFIDX,sp) 
      008448 91 D7 1A         [ 4] 1089 	ld ([ptr16],y),a ; token attribute 
      00844B 90 5C            [ 2] 1090 	incw y
      00844D 17 03            [ 2] 1091 	ldw (BUFIDX,sp),y
      00844F A1 01            [ 1] 1092 	cp a,#TK_COLON 
      008451 26 02            [ 1] 1093 	jrne 31$
      008453 20 E0            [ 2] 1094 	jra 2$ ; loop for next token 
      008455                       1095 31$: ; check for token type 
                                   1096 ; character token have 1 byte attribute, i.e. ASCII character 
      008455 A1 03            [ 1] 1097 	cp a,#TK_CHAR
      008457 26 0C            [ 1] 1098 	jrne 32$ 
      008459 1E 01            [ 2] 1099 	ldw x,(XSAVE,sp)
      00845B 9F               [ 1] 1100 	ld a,xl 
      00845C 91 D7 1A         [ 4] 1101 	ld ([ptr16],y),a
      00845F 90 5C            [ 2] 1102 	incw y 
      008461 17 03            [ 2] 1103 	ldw (BUFIDX,sp),y 
      008463 20 D0            [ 2] 1104 	jra 2$ 
      008465                       1105 32$:
      008465 A1 0A            [ 1] 1106 	cp a,#TK_ARRAY 
                                   1107 ; this token have no attribute. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008467 27 CC            [ 1] 1108 	jreq 2$ 
      008469 A1 02            [ 1] 1109 	cp a,#TK_QSTR 
      00846B 26 25            [ 1] 1110 	jrne 4$
                                   1111 ; copy string as .asciz 	
      00846D AE 17 38         [ 2] 1112 	ldw x,#pad 
      008470 CD 82 8B         [ 4] 1113 	call strlen
      008473 5C               [ 2] 1114 	incw x  
      008474 CD 83 F6         [ 4] 1115 	call check_full 
      008477 90 AE 17 38      [ 2] 1116 	ldw y,#pad 
      00847B CE 00 1A         [ 2] 1117 	ldw x,ptr16
      00847E 72 FB 03         [ 2] 1118 	addw x,(BUFIDX,sp)	
      008481 CD 82 A9         [ 4] 1119 	call strcpy 
      008484 AE 17 38         [ 2] 1120 	ldw x,#pad 
      008487 CD 82 8B         [ 4] 1121 	call strlen 
      00848A 5C               [ 2] 1122 	incw x
      00848B 72 FB 03         [ 2] 1123 	addw x,(BUFIDX,sp) 
      00848E 1F 03            [ 2] 1124 	ldw (BUFIDX,sp),x
      008490 20 A3            [ 2] 1125 	jra 2$  
      008492 A1 04            [ 1] 1126 4$: cp a,#TK_INTGR
      008494 25 9F            [ 1] 1127 	jrult 2$ ; 
      008496 A1 08            [ 1] 1128 	cp a,#TK_CFUNC 
      008498 22 9B            [ 1] 1129 	Jrugt 2$ ; those tokens have no attributes 
      00849A 1E 01            [ 2] 1130 	ldw x,(XSAVE,sp) 
      00849C 16 03            [ 2] 1131 	ldw y,(BUFIDX,sp)
      00849E 91 DF 1A         [ 5] 1132 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      0084A1 A3 95 45         [ 2] 1133 	cpw x,#remark ; is this a comment? 
      0084A4 27 09            [ 1] 1134 	jreq 5$	
      0084A6 72 A9 00 02      [ 2] 1135 	addw y,#2 
      0084AA 17 03            [ 2] 1136 	ldw (BUFIDX,sp),y 
      0084AC CC 84 35         [ 2] 1137 	jp 2$
      0084AF                       1138 5$:
                                   1139 ; copy commment in code buffer and
                                   1140 ; skip to end of line.  
      0084AF 72 A9 00 02      [ 2] 1141 	addw y,#2 ; skip exec address 
      0084B3 17 03            [ 2] 1142 	ldw (BUFIDX,sp),y 
      0084B5 CE 00 1A         [ 2] 1143 	ldw x,ptr16 
      0084B8 72 FB 03         [ 2] 1144 	addw x,(BUFIDX,sp)
      0084BB 90 CE 00 01      [ 2] 1145 	ldw y,in.w 
      0084BF 72 A9 16 E8      [ 2] 1146 	addw y,#tib 
      0084C3 CD 82 A9         [ 4] 1147 	call strcpy 	
      0084C6 CD 82 8B         [ 4] 1148 	call strlen 
      0084C9 5C               [ 2] 1149 	incw x ; skip string 0. 
      0084CA 72 FB 03         [ 2] 1150 	addw x,(BUFIDX,sp)
      0084CD 1F 03            [ 2] 1151 	ldw (BUFIDX,sp),x 
      0084CF                       1152 9$: 
      0084CF AE 00 02         [ 2] 1153 	ldw x,#2
      0084D2 16 03            [ 2] 1154 	ldw y,(BUFIDX,sp)
      0084D4 90 9F            [ 1] 1155 	ld a,yl 
      0084D6 72 D7 00 1A      [ 4] 1156 	ld ([ptr16],x),a ; bytes count   	
      0084DA 72 CE 00 1A      [ 5] 1157 	ldw x,[ptr16]
      0084DE 27 09            [ 1] 1158 	jreq 10$
      0084E0 CD 83 8E         [ 4] 1159 	call insert_line
      0084E3 72 5F 00 04      [ 1] 1160 	clr  count 
      0084E7 20 0F            [ 2] 1161 	jra  11$ 
      0084E9                       1162 10$: ; line# is zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0084E9 CE 00 1A         [ 2] 1163 	ldw x,ptr16 
      0084EC CF 00 05         [ 2] 1164 	ldw basicptr,x 
      0084EF E6 02            [ 1] 1165 	ld a,(2,x)
      0084F1 C7 00 04         [ 1] 1166 	ld count,a 
      0084F4 35 03 00 02      [ 1] 1167 	mov in,#3 
      0084F8                       1168 11$:
      000478                       1169 	_drop VSIZE 
      0084F8 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084FA 72 1B 00 26      [ 1] 1170 	bres flags,#FCOMP 
      0084FE 81               [ 4] 1171 	ret 
                                   1172 
                                   1173 ;------------------------------------
                                   1174 ;  set all variables to zero 
                                   1175 ; input:
                                   1176 ;   none 
                                   1177 ; output:
                                   1178 ;	none
                                   1179 ;------------------------------------
      0084FF                       1180 clear_vars:
      0084FF AE 00 29         [ 2] 1181 	ldw x,#vars 
      008502 90 AE 00 34      [ 2] 1182 	ldw y,#2*26 
      008506 7F               [ 1] 1183 1$:	clr (x)
      008507 5C               [ 2] 1184 	incw x 
      008508 90 5A            [ 2] 1185 	decw y 
      00850A 26 FA            [ 1] 1186 	jrne 1$
      00850C 81               [ 4] 1187 	ret 
                                   1188 
                                   1189 ;-------------------------------------
                                   1190 ; check if A is a letter 
                                   1191 ; input:
                                   1192 ;   A 			character to test 
                                   1193 ; output:
                                   1194 ;   C flag      1 true, 0 false 
                                   1195 ;-------------------------------------
      00850D                       1196 is_alpha:
      00850D A1 41            [ 1] 1197 	cp a,#'A 
      00850F 8C               [ 1] 1198 	ccf
      008510 24 0B            [ 1] 1199 	jrnc 9$ 
      008512 A1 5B            [ 1] 1200 	cp a,#'Z+1 
      008514 25 07            [ 1] 1201 	jrc 9$ 
      008516 A1 61            [ 1] 1202 	cp a,#'a 
      008518 8C               [ 1] 1203 	ccf 
      008519 24 02            [ 1] 1204 	jrnc 9$
      00851B A1 7B            [ 1] 1205 	cp a,#'z+1   
      00851D 81               [ 4] 1206 9$: ret 	
                                   1207 
                                   1208 ;------------------------------------
                                   1209 ; check if character in {'0'..'9'}
                                   1210 ; input:
                                   1211 ;    A  character to test
                                   1212 ; output:
                                   1213 ;    Carry  0 not digit | 1 digit
                                   1214 ;------------------------------------
      00851E                       1215 is_digit:
      00851E A1 30            [ 1] 1216 	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008520 25 03            [ 1] 1217 	jrc 1$
      008522 A1 3A            [ 1] 1218     cp a,#'9+1
      008524 8C               [ 1] 1219 	ccf 
      008525 8C               [ 1] 1220 1$:	ccf 
      008526 81               [ 4] 1221     ret
                                   1222 
                                   1223 ;-------------------------------------
                                   1224 ;  program initialization entry point 
                                   1225 ;-------------------------------------
                           000001  1226 	MAJOR=1
                           000000  1227 	MINOR=0
      008527 0A 0A 54 69 6E 79 20  1228 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00856D                       1229 cold_start:
                                   1230 ;set stack 
      00856D AE 17 FF         [ 2] 1231 	ldw x,#STACK_EMPTY
      008570 94               [ 1] 1232 	ldw sp,x   
                                   1233 ; clear all ram 
      008571 7F               [ 1] 1234 0$: clr (x)
      008572 5A               [ 2] 1235 	decw x 
      008573 26 FC            [ 1] 1236 	jrne 0$
                                   1237 ; activate pull up on all inputs 
      008575 A6 FF            [ 1] 1238 	ld a,#255 
      008577 C7 50 03         [ 1] 1239 	ld PA_CR1,a 
      00857A C7 50 08         [ 1] 1240 	ld PB_CR1,a 
      00857D C7 50 0D         [ 1] 1241 	ld PC_CR1,a 
      008580 C7 50 12         [ 1] 1242 	ld PD_CR1,a 
      008583 C7 50 17         [ 1] 1243 	ld PE_CR1,a 
      008586 C7 50 1C         [ 1] 1244 	ld PF_CR1,a 
      008589 C7 50 21         [ 1] 1245 	ld PG_CR1,a 
      00858C C7 50 2B         [ 1] 1246 	ld PI_CR1,a
                                   1247 ; set LD2 pin as output and turn it on
      00858F 72 1A 50 0D      [ 1] 1248     bset PC_CR1,#LED2_BIT
      008593 72 1A 50 0E      [ 1] 1249     bset PC_CR2,#LED2_BIT
      008597 72 1A 50 0C      [ 1] 1250     bset PC_DDR,#LED2_BIT
      00859B 72 1A 50 0A      [ 1] 1251 	bset PC_ODR,#LED2_BIT 
                                   1252 ; disable schmitt triggers on Arduino CN4 analog inputs
      00859F 55 00 3F 54 07   [ 1] 1253 	mov ADC_TDRL,0x3f
                                   1254 ; disable peripherals clocks
                                   1255 ;	clr CLK_PCKENR1 
                                   1256 ;	clr CLK_PCKENR2
      0085A4 72 5F 50 F2      [ 1] 1257 	clr AWU_TBR 
      0085A8 72 14 50 CA      [ 1] 1258 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1259 ; select internal clock no divisor: 16 Mhz 	
      0085AC A6 E1            [ 1] 1260 	ld a,#CLK_SWR_HSI 
      0085AE 5F               [ 1] 1261 	clrw x  
      0085AF CD 81 1D         [ 4] 1262     call clock_init 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085B2 CD 81 40         [ 4] 1263 	call timer4_init
      0085B5 CD 81 33         [ 4] 1264 	call timer2_init
                                   1265 ; UART1 at 115200 BAUD
      0085B8 CD 82 09         [ 4] 1266 	call uart1_init
                                   1267 ; activate PE_4 (user button interrupt)
      0085BB 72 18 50 18      [ 1] 1268     bset PE_CR2,#USR_BTN_BIT 
                                   1269 ; display system information
      0085BF AE 85 27         [ 2] 1270 	ldw x,#software 
      0085C2 CD 82 57         [ 4] 1271 	call puts 
      0085C5 A6 01            [ 1] 1272 	ld a,#MAJOR 
      0085C7 C7 00 0E         [ 1] 1273 	ld acc8,a 
      0085CA 5F               [ 1] 1274 	clrw x 
      0085CB CF 00 0C         [ 2] 1275 	ldw acc24,x 
      0085CE A6 0A            [ 1] 1276 	ld a,#10 
      0085D0 CD 88 F2         [ 4] 1277 	call prti24 
      0085D3 A6 2E            [ 1] 1278 	ld a,#'.
      0085D5 CD 82 44         [ 4] 1279 	call putc 
      0085D8 A6 00            [ 1] 1280 	ld a,#MINOR 
      0085DA C7 00 0E         [ 1] 1281 	ld acc8,a 
      0085DD 5F               [ 1] 1282 	clrw x 
      0085DE CF 00 0C         [ 2] 1283 	ldw acc24,x 
      0085E1 A6 0A            [ 1] 1284 	ld a,#10 
      0085E3 CD 88 F2         [ 4] 1285 	call prti24 
      0085E6 A6 0D            [ 1] 1286 	ld a,#CR 
      0085E8 CD 82 44         [ 4] 1287 	call putc 
      0085EB CD 99 2F         [ 4] 1288 	call seek_fdrive 
      0085EE 9A               [ 1] 1289 	rim 
      0085EF 72 5C 00 18      [ 1] 1290 	inc seedy+1 
      0085F3 72 5C 00 16      [ 1] 1291 	inc seedx+1 
      0085F7 CD 86 7F         [ 4] 1292 	call clear_basic
      0085FA CD 91 C8         [ 4] 1293 	call ubound 
                                   1294 ;	jra 2$	
                                   1295 ; 150 msec beep 
      0085FD AE 00 96         [ 2] 1296 	ldw x,#150 
      008600 90 AE 03 E6      [ 2] 1297 	ldw y,#998 
      008604 CD 97 B3         [ 4] 1298 	call beep  
      008607 72 1B 50 0A      [ 1] 1299 2$:	bres PC_ODR,#LED2_BIT	
      00860B CD 86 14         [ 4] 1300 	call warm_init
      00860E CD 86 41         [ 4] 1301 	call load_autorun
      008611 CC 88 30         [ 2] 1302     jp cmd_line  
                                   1303 
      008614                       1304 warm_init:
      008614 72 5F 00 26      [ 1] 1305 	clr flags 
      008618 72 5F 00 23      [ 1] 1306 	clr loop_depth 
      00861C 35 04 00 27      [ 1] 1307 	mov tab_width,#TAB_WIDTH 
      008620 35 0A 00 0B      [ 1] 1308 	mov base,#10 
      008624 AE 00 00         [ 2] 1309 	ldw x,#0 
      008627 CF 00 05         [ 2] 1310 	ldw basicptr,x 
      00862A CF 00 01         [ 2] 1311 	ldw in.w,x 
      00862D 72 5F 00 04      [ 1] 1312 	clr count 
      008631 81               [ 4] 1313 	ret 
                                   1314 
                                   1315 ;--------------------------
                                   1316 ; called by tb_error when
                                   1317 ; flag FAUTORUN is set.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1318 ; There is a bug in autorun 
                                   1319 ; program so cancel it.
                                   1320 ;---------------------------
      008632                       1321 cancel_autorun:
      008632 AE 40 00         [ 2] 1322 	ldw x,#AUTORUN_NAME 
      008635 CF 00 1A         [ 2] 1323 	ldw farptr+1,x 
      008638 4F               [ 1] 1324 	clr a
      008639 5F               [ 1] 1325 	clrw x  
      00863A C7 00 19         [ 1] 1326 	ld farptr,a 
      00863D CD 81 71         [ 4] 1327 	call write_byte 
      008640 81               [ 4] 1328 	ret 
                                   1329 
                                   1330 
                                   1331 ;--------------------------
                                   1332 ; if autorun file defined 
                                   1333 ; in eeprom address AUTORUN_NAME 
                                   1334 ; load and run it.
                                   1335 ;-------------------------
      008641                       1336 load_autorun:
      008641 90 AE 40 00      [ 2] 1337 	ldw y,#AUTORUN_NAME
      008645 90 F6            [ 1] 1338 	ld a,(y)
      008647 27 20            [ 1] 1339 	jreq 9$
      008649 CD 99 8D         [ 4] 1340 	call search_file
      00864C 25 05            [ 1] 1341 	jrc 2$ 
                                   1342 ; if file doesn't exit
      00864E CD 86 32         [ 4] 1343 	call cancel_autorun
      008651 20 16            [ 2] 1344 	jra 9$ 
      008653 CD 9A 97         [ 4] 1345 2$:	call load_file
      008656 AE 40 00         [ 2] 1346 	ldw x,#AUTORUN_NAME 
      008659 CD 82 57         [ 4] 1347 	call puts
      00865C AE 86 6A         [ 2] 1348 	ldw x,#autorun_msg 
      00865F CD 82 57         [ 4] 1349 	call puts 
      008662 72 1C 00 26      [ 1] 1350 	bset flags,#FAUTORUN 
      008666 CC 97 7C         [ 2] 1351 	jp run_it    
      008669 81               [ 4] 1352 9$: ret 	
                                   1353 
      00866A 20 6C 6F 61 64 65 64  1354 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1355 ;---------------------------
                                   1356 ; reset BASIC text variables 
                                   1357 ; and clear variables 
                                   1358 ;---------------------------
      00867F                       1359 clear_basic:
      00867F 72 5F 00 04      [ 1] 1360 	clr count 
      008683 AE 00 5D         [ 2] 1361 	ldw x,#free_ram 
      008686 CF 00 1F         [ 2] 1362 	ldw txtbgn,x 
      008689 CF 00 21         [ 2] 1363 	ldw txtend,x 
      00868C CD 84 FF         [ 4] 1364 	call clear_vars 
      00868F 81               [ 4] 1365 	ret 
                                   1366 
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1368 ;;   Tiny BASIC error messages     ;;
                                   1369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008690                       1370 err_msg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008690 00 00 86 AE 86 BC 86  1371 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             CB 86 E5 86 F5
      00869C 87 0C 87 23 87 3E 87  1372 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             50 87 62
      0086A6 87 6F 87 A3 87 B9 87  1373 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace    
             CE
                                   1374 
      0086AE 0A 4D 65 6D 6F 72 79  1375 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086BC 0A 73 79 6E 74 61 78  1376 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086CB 0A 6D 61 74 68 20 6F  1377 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086E5 0A 64 69 76 69 73 69  1378 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086F5 0A 69 6E 76 61 6C 69  1379 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      00870C 0A 72 75 6E 20 74 69  1380 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      008723 0A 63 6F 6D 6D 61 6E  1381 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00873E 0A 64 75 70 6C 69 63  1382 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      008750 0A 46 69 6C 65 20 6E  1383 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      008762 0A 62 61 64 20 76 61  1384 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      00876F 0A 46 69 6C 65 20 69  1385 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
      0087A3 0A 4E 6F 20 64 61 74  1386 err_no_data: .asciz "\nNo data line found.\n"
             61 20 6C 69 6E 65 20
             66 6F 75 6E 64 2E 0A
             00
      0087B9 0A 4E 6F 20 70 72 6F  1387 err_no_prog: .asciz "\nNo program in RAM!\n"
             67 72 61 6D 20 69 6E
             20 52 41 4D 21 0A 00
      0087CE 0A 46 69 6C 65 20 73  1388 err_no_fspace: .asciz "\nFile system full.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  79-Bits]



             79 73 74 65 6D 20 66
             75 6C 6C 2E 0A 00
                                   1389 
                                   1390 ;rt_msg: .asciz "last token id: "
                                   1391 
      000762                       1392 syntax_error:
      0087D6 73 74            [ 1] 1393 	ld a,#ERR_SYNTAX 
                                   1394 
      000764                       1395 tb_error:
      0087D8 65 6D 20         [ 2] 1396 	ldw x, #err_msg 
      0087DB 66 75 6C 6C      [ 1] 1397 	clr acc16 
      0087DF 2E               [ 1] 1398 	sll a
      0087E0 0A 00 00 0C      [ 1] 1399 	rlc acc16  
      0087E2 C7 00 0D         [ 1] 1400 	ld acc8, a 
      0087E2 A6 02 00 0C      [ 2] 1401 	addw x,acc16 
      0087E4 FE               [ 2] 1402 	ldw x,(x)
      0087E4 AE 86 90         [ 4] 1403 	call puts
      0087E7 72 5F 00 0D 48   [ 2] 1404 	btjf flags,#FCOMP, 1$
      0087EC 72 59 00         [ 2] 1405 	ldw x,#tib
      0087EF 0D C7 00         [ 4] 1406 	call puts 
      0087F2 0E 72            [ 1] 1407 	ld a,#CR 
      0087F4 BB 00 0D         [ 4] 1408 	call putc
      0087F7 FE CD 82         [ 2] 1409 	ldw x,in.w
      0087FA 57 72 0B         [ 4] 1410 	call spaces
      0087FD 00 26            [ 1] 1411 	ld a,#'^
      0087FF 18 AE 16         [ 4] 1412 	call putc 
      008802 E8 CD            [ 2] 1413 	jra 6$
      008804 82 57 A6         [ 2] 1414 1$:	ldw x,basicptr
      008807 0D CD 82         [ 1] 1415 	ld a,in 
      00880A 44 CE 00         [ 4] 1416 	call prt_basic_line
      00880D 01 CD 82 7F A6   [ 2] 1417 	btjf flags,#FAUTORUN ,2$
      008812 5E CD 82         [ 4] 1418 	call cancel_autorun  
      0007A9                       1419 2$:
                                   1420 ;	ldw x,#rt_msg 
                                   1421 ;	call puts 
                                   1422 ;	clrw x 
                                   1423 ;	ld a,in.saved 
                                   1424 ;	ld xl,a 
                                   1425 ;	ld a,([basicptr],x)
                                   1426 ;	clrw x 
                                   1427 ;	ld xl,a 
                                   1428 ;	call print_int 
      008815 44 20 11         [ 2] 1429 6$: ldw x,#STACK_EMPTY 
      008818 CE               [ 1] 1430     ldw sp,x
      0007AD                       1431 warm_start:
      008819 00 05 C6         [ 4] 1432 	call warm_init
                                   1433 ;----------------------------
                                   1434 ;   BASIC interpreter
                                   1435 ;----------------------------
      0007B0                       1436 cmd_line: ; user interface 
      00881C 00 02 CD 92      [ 1] 1437 	clr in 
      008820 DA 72            [ 1] 1438 	ld a,#CR 
      008822 0D 00 26         [ 4] 1439 	call putc 
      008825 03 CD            [ 1] 1440 	ld a,#'> 
      008827 86 32 C4         [ 4] 1441 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008829 CD 09 E4         [ 4] 1442 	call readln
      008829 AE 17 FF         [ 4] 1443 	call compile
                                   1444 ; if text begin with a line number
                                   1445 ; the compiler set count to zero    
                                   1446 ; so code is not interpreted
      00882C 94 5D 00 03      [ 1] 1447 	tnz count 
      00882D 27 E6            [ 1] 1448 	jreq cmd_line
                                   1449 ; if direct command 
                                   1450 ; it's ready to interpret 
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1452 ;; This is the interpreter loop
                                   1453 ;; for each BASIC code line. 
                                   1454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0007CA                       1455 interpreter: 
      00882D CD 86 14         [ 1] 1456 	ld a,in 
      008830 C1 00 03         [ 1] 1457 	cp a,count 
      008830 72 5F            [ 1] 1458 	jrmi 0$
      008832 00 02 A6 0D CD   [ 2] 1459 	btjf flags, #FRUN, cmd_line
                                   1460 ;next BASIC line
      008837 82 44 A6         [ 2] 1461 	ldw x,basicptr
      00883A 3E CD            [ 1] 1462 	ld a,(2,x) ; line length 
      00883C 82 44 CD         [ 1] 1463 	ld acc8,a 
      00883F 8A 64 CD 84      [ 1] 1464 	clr acc16 
      008843 05 72 5D 00      [ 2] 1465 	addw x,acc16
      008847 04 27 E6         [ 2] 1466 	cpw x,txtend 
      00884A 2A C1            [ 1] 1467 	jrpl warm_start
      00884A C6 00 02         [ 2] 1468 	ldw basicptr,x ; start of next line  
      00884D C1 00            [ 1] 1469 	ld a,(2,x)
      00884F 04 2B 26         [ 1] 1470 	ld count,a 
      008852 72 01 00 26      [ 1] 1471 	mov in,#3 ; skip first 3 bytes of line 
      0007F8                       1472 0$: 
      008856 D9 CE 00         [ 4] 1473 	call next_token
      008859 05               [ 2] 1474 	tnzw x 
      00885A E6 02            [ 1] 1475 	jrmi 4$ 
      00885C C7 00            [ 1] 1476 	cp a,#TK_COLON 
      00885E 0E 72            [ 1] 1477 	jreq interpreter 
      008860 5F 00            [ 1] 1478 	cp a,#TK_VAR
      008862 0D 72            [ 1] 1479 	jrne 2$
      008864 BB 00 0D         [ 4] 1480 	call let02  
      008867 C3 00            [ 2] 1481 	jra interpreter 
      00080B                       1482 2$:	
      008869 21 2A            [ 1] 1483 	cp a,#TK_ARRAY 
      00886B C1 CF            [ 1] 1484 	jrne 3$
      00886D 00 05 E6         [ 4] 1485 	call get_array_element
      008870 02 C7 00         [ 4] 1486 	call let02 
      008873 04 35            [ 2] 1487 	jra interpreter 
      000817                       1488 3$:	
      008875 03 00 02         [ 2] 1489 	jp syntax_error 
      008878                       1490 4$:
      008878 CD 88            [ 1] 1491 	cp a,#TK_CMD
      00887A A1 5D            [ 1] 1492 	jrne 3$
      00887C 2B               [ 4] 1493 	call (x) 
      00887D 1C A1            [ 2] 1494 	jra interpreter 
                                   1495 
                                   1496 		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1497 ;--------------------------
                                   1498 ; extract next token from
                                   1499 ; token list 
                                   1500 ; basicptr -> base address 
                                   1501 ; in  -> offset in list array 
                                   1502 ; output:
                                   1503 ;   A 		token attribute
                                   1504 ;   X 		token value if there is one
                                   1505 ;----------------------------------------
      000821                       1506 next_token:
      00887F 01               [ 1] 1507 	clrw x 
      008880 27 C8 A1         [ 1] 1508 	ld a,in 
      008883 05 26 05         [ 1] 1509 	sub a,count ; don't replace sub by cp.  
      008886 CD 91            [ 1] 1510 	jrmi 0$
      008888 F4               [ 4] 1511 	ret  ; end of BASIC line 
      00082B                       1512 0$: 
      008889 20 BF 01 00 02   [ 1] 1513 	mov in.saved,in 
      00888B 90 CE 00 04      [ 2] 1514 	ldw y,basicptr 
      00888B A1 0A 26 08      [ 2] 1515 	addw y,in.w 
      00888F CD 8F            [ 1] 1516 	ld a,(y)
      008891 A9 CD            [ 2] 1517 	incw y  
      008893 91 F4            [ 1] 1518 	cp a,#TK_ARRAY
      008895 20 B3            [ 1] 1519 	jrpl 9$  ; no attribute for these
      008897 A1 04            [ 1] 1520 	cp a,#TK_INTGR
      008897 CC 87            [ 1] 1521 	jrmi 1$
                                   1522 ; attribute type WORD 	
      008899 E2               [ 1] 1523 	ldw x,y 
      00889A FE               [ 2] 1524 	ldw x,(x)
      00889A A1 06 26 F9      [ 2] 1525 	addw y,#2  
      00889E FD 20            [ 2] 1526 	jra 9$
      00084C                       1527 1$: ; 
      0088A0 A9 03            [ 1] 1528 	cp a,#TK_CHAR
      0088A1 26 0A            [ 1] 1529 	jrne 2$
      0088A1 5F C6            [ 1] 1530 	ld a,(y)
      0088A3 00 02            [ 2] 1531 	incw y
      0088A5 C0               [ 1] 1532 	clrw x 
      0088A6 00               [ 1] 1533 	ld xl,a 
      0088A7 04 2B            [ 1] 1534 	ld a,#TK_CHAR
      0088A9 01 81            [ 2] 1535 	jra 9$ 
      0088AB A1 02            [ 1] 1536 2$:	cp a,#TK_QSTR 
      0088AB 55 00            [ 1] 1537 	jrne 9$
      0088AD 02               [ 1] 1538 	ldw x,y 
                                   1539 ; move pointer after string 
      0088AE 00 03            [ 1] 1540 3$:	tnz (y)
      0088B0 90 CE            [ 1] 1541 	jreq 4$
      0088B2 00 05            [ 2] 1542 	incw y
      0088B4 72 B9            [ 2] 1543 	jra 3$ 
      0088B6 00 01            [ 2] 1544 4$:	incw y 
      0088B8 90 F6 90 5C      [ 2] 1545 9$: subw y,basicptr 
      0088BC A1 0A 2A 29      [ 2] 1546     ldw in.w,y 
      0088C0 A1               [ 4] 1547 	ret	
                                   1548 
                                   1549 
                                   1550 ;----------------------------------------
                                   1551 ;   DEBUG support functions
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1552 ;----------------------------------------
                           000000  1553 .if DEBUG 
                                   1554 
                                   1555 ; turn LED on 
                                   1556 ledon:
                                   1557     bset PC_ODR,#LED2_BIT
                                   1558     ret 
                                   1559 
                                   1560 ; turn LED off 
                                   1561 ledoff:
                                   1562     bres PC_ODR,#LED2_BIT 
                                   1563     ret 
                                   1564 
                                   1565 ; invert LED status 
                                   1566 ledtoggle:
                                   1567     ld a,#LED2_MASK
                                   1568     xor a,PC_ODR
                                   1569     ld PC_ODR,a
                                   1570     ret 
                                   1571 
                                   1572 left_paren:
                                   1573 	ld a,#SPACE 
                                   1574 	call putc
                                   1575 	ld a,#'( 
                                   1576 	call putc 	
                                   1577 	ret 
                                   1578 
                                   1579 ;------------------------------
                                   1580 ; print 8 bit register 
                                   1581 ; input:
                                   1582 ;   X  point to register name 
                                   1583 ;   A  register value to print 
                                   1584 ; output:
                                   1585 ;   none
                                   1586 ;------------------------------- 
                                   1587 prt_reg8:
                                   1588 	push a 
                                   1589 	call puts 
                                   1590 	ld a,(1,sp) 
                                   1591 	ld acc8,a 
                                   1592 	clrw x 
                                   1593 	ld xl,a 
                                   1594 	mov base,#16
                                   1595 	call print_int 
                                   1596 	call left_paren 
                                   1597 	pop a 
                                   1598 	clrw x 
                                   1599 	ld xl,a 
                                   1600 	mov base,#10 
                                   1601 	call print_int  
                                   1602 	ld a,#') 
                                   1603 	call putc
                                   1604 	ret
                                   1605 
                                   1606 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1607 ; print 16 bits register 
                                   1608 ; input:
                                   1609 ;   X   point register name 
                                   1610 ;   Y   register value to print 
                                   1611 ; output:
                                   1612 ;  none
                                   1613 ;--------------------------------
                                   1614 prt_reg16: 
                                   1615 	pushw y 
                                   1616 	call puts 
                                   1617 	ldw x,(1,sp) 
                                   1618 	mov base,#16 
                                   1619 	call print_int  
                                   1620 	call left_paren 
                                   1621 	popw x 
                                   1622 	mov base,#10 
                                   1623 	call print_int  
                                   1624 	ld a,#') 
                                   1625 	call putc
                                   1626 	ret 
                                   1627 
                                   1628 ;------------------------------------
                                   1629 ; print registers contents saved on
                                   1630 ; stack by trap interrupt.
                                   1631 ;------------------------------------
                                   1632 print_registers:
                                   1633 	ldw x,#STATES
                                   1634 	call puts
                                   1635 ; print EPC 
                                   1636 	ldw x, #REG_EPC
                                   1637 	call puts 
                                   1638 	ld a, (11,sp)
                                   1639 	ld acc8,a 
                                   1640 	ld a, (10,sp) 
                                   1641 	ld acc16,a 
                                   1642 	ld a,(9,sp) 
                                   1643 	ld acc24,a
                                   1644 	clrw x  
                                   1645 	ld a,#16
                                   1646 	call prti24  
                                   1647 ; print X
                                   1648 	ldw x,#REG_X
                                   1649 	ldw y,(5,sp)
                                   1650 	call prt_reg16  
                                   1651 ; print Y 
                                   1652 	ldw x,#REG_Y
                                   1653 	ldw y, (7,sp)
                                   1654 	call prt_reg16  
                                   1655 ; print A 
                                   1656 	ldw x,#REG_A
                                   1657 	ld a, (4,sp) 
                                   1658 	call prt_reg8
                                   1659 ; print CC 
                                   1660 	ldw x,#REG_CC 
                                   1661 	ld a, (3,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1662 	call prt_reg8 
                                   1663 ; print SP 
                                   1664 	ldw x,#REG_SP
                                   1665 	ldw y,sp 
                                   1666 	addw y,#12
                                   1667 	call prt_reg16  
                                   1668 	ld a,#'\n' 
                                   1669 	call putc
                                   1670 	ret
                                   1671 
                                   1672 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1673 REG_EPC: .asciz "EPC:"
                                   1674 REG_Y:   .asciz "\nY:" 
                                   1675 REG_X:   .asciz "\nX:"
                                   1676 REG_A:   .asciz "\nA:" 
                                   1677 REG_CC:  .asciz "\nCC:"
                                   1678 REG_SP:  .asciz "\nSP:"
                                   1679 
                                   1680 .endif ; DEBUG 
                                   1681 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1682 
                                   1683 
                                   1684 ;------------------------------------
                                   1685 ; print integer in acc24 
                                   1686 ; input:
                                   1687 ;	acc24 		integer to print 
                                   1688 ;	A 			numerical base for conversion 
                                   1689 ;               if bit 7 is set add a space at print end.
                                   1690 ;   XL 			field width, 0 -> no fill.
                                   1691 ;  output:
                                   1692 ;    none 
                                   1693 ;------------------------------------
                           000001  1694 	WIDTH = 1
                           000002  1695 	BASE = 2
                           000003  1696 	ADD_SPACE=3 ; add a space after number 
                           000003  1697 	VSIZE = 3
      000872                       1698 prti24:
      000872                       1699 	_vars VSIZE 
      0088C1 04 2B            [ 2]    1     sub sp,#VSIZE 
      0088C3 08 93            [ 1] 1700 	clr (ADD_SPACE,sp)
      0088C5 FE 72            [ 1] 1701 	bcp a,#0x80 
      0088C7 A9 00            [ 1] 1702 	jreq 0$ 
      0088C9 02 20            [ 1] 1703 	cpl (ADD_SPACE,sp)
      0088CB 1D 1F            [ 1] 1704 0$:	and a,#31 
      0088CC 6B 02            [ 1] 1705 	ld (BASE,sp),a
      0088CC A1               [ 1] 1706 	ld a,xl
      0088CD 03 26            [ 1] 1707 	ld (WIDTH,sp),a 
      0088CF 0A 90            [ 1] 1708 	ld a, (BASE,sp)  
      0088D1 F6 90 5C         [ 4] 1709     call itoa  ; conversion entier en  .asciz
      0088D4 5F 97            [ 1] 1710 1$: ld a,(WIDTH,sp)
      0088D6 A6 03            [ 1] 1711 	jreq 4$
      0088D8 20 0F A1         [ 1] 1712 	ld acc8,a 
      0088DB 02               [ 2] 1713 	pushw x 
      0088DC 26 0B 93         [ 4] 1714 	call strlen 
      0088DF 90               [ 1] 1715 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088E0 7D               [ 2] 1716 	popw x 
      0088E1 27 04 90         [ 3] 1717 	exg a,acc8 
      0088E4 5C 20 F8         [ 1] 1718 	sub a,acc8 
      0088E7 90 5C            [ 1] 1719 	jrmi 4$
      0088E9 72 B2            [ 1] 1720 	ld (WIDTH,sp),a 
      0088EB 00 05            [ 1] 1721 	ld  a,#SPACE
      0088ED 90 CF            [ 1] 1722 3$: tnz (WIDTH,sp)
      0088EF 00 01            [ 1] 1723 	jreq 4$
      0088F1 81               [ 2] 1724 	decw x 
      0088F2 F7               [ 1] 1725 	ld (x),a 
      0088F2 52 03            [ 1] 1726 	dec (WIDTH,sp) 
      0088F4 0F 03            [ 2] 1727 	jra 3$
      0008AB                       1728 4$: 
      0088F6 A5 80 27         [ 4] 1729 	call puts 
      0088F9 02 03            [ 1] 1730 	tnz (ADD_SPACE,sp)
      0088FB 03 A4            [ 1] 1731 	jreq 5$
      0088FD 1F 6B            [ 1] 1732     ld a,#SPACE 
      0088FF 02 9F 6B         [ 4] 1733 	call putc 
      0008B7                       1734 5$: _drop VSIZE 
      008902 01 7B            [ 2]    1     addw sp,#VSIZE 
      008904 02               [ 4] 1735     ret	
                                   1736 
                                   1737 ;-----------------------------------
                                   1738 ; print a 16 bit integer 
                                   1739 ; using variable 'base' as conversion
                                   1740 ; format.
                                   1741 ; input:
                                   1742 ;   X       integer to print 
                                   1743 ;   base    conversion base 
                                   1744 ; output:
                                   1745 ;   none 
                                   1746 ;-----------------------------------
                           000001  1747 	SIGN=1
                           000001  1748 	VSIZE=1
      0008BA                       1749 print_int: 
      0008BA                       1750 	_vars VSIZE 
      008905 CD 89            [ 2]    1     sub sp,#VSIZE 
      008907 98 7B            [ 1] 1751 	clr (SIGN,sp)
      008909 01 27 1F C7      [ 2] 1752 	ldw y,#pad+PAD_SIZE-1 
      00890D 00 0E            [ 1] 1753 	clr (y)
      00890F 89 CD 82         [ 1] 1754 	ld a,base  
      008912 8B 9F            [ 1] 1755 	cp a,#10 
      008914 85 31            [ 1] 1756 	jrne 1$ 
      008916 00               [ 2] 1757 	tnzw x 
      008917 0E C0            [ 1] 1758 	jrpl 1$ 
      008919 00 0E            [ 1] 1759 	cpl (SIGN,sp)
      00891B 2B               [ 2] 1760 	negw x 	 
      0008D1                       1761 1$:	
      00891C 0E 6B 01         [ 1] 1762 	ld a,base 
      00891F A6               [ 2] 1763 	div x,a 
      008920 20 0D            [ 1] 1764 	add a,#'0 
      008922 01 27            [ 1] 1765 	cp a,#'9+1 
      008924 06 5A            [ 1] 1766 	jrmi 2$ 
      008926 F7 0A            [ 1] 1767 	add a,#7 
      008928 01 20            [ 2] 1768 2$: decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      00892A F6 F7            [ 1] 1769 	ld (y),a 
      00892B 5D               [ 2] 1770 	tnzw x 
      00892B CD 82            [ 1] 1771 	jrne 1$ 
      00892D 57 0D            [ 1] 1772 	ld a,#16 
      00892F 03 27 05         [ 1] 1773 	cp a,base 
      008932 A6 20            [ 1] 1774 	jrne 3$
      008934 CD 82            [ 1] 1775 	ld a,#'$
      008936 44 5B            [ 2] 1776 	decw y  
      008938 03 81            [ 1] 1777 	ld (y),a
      00893A 20 0A            [ 2] 1778 	jra 9$ 
      00893A 52 01            [ 1] 1779 3$: tnz (SIGN,sp)
      00893C 0F 01            [ 1] 1780 	jreq 9$ 
      00893E 90 AE            [ 1] 1781 	ld a,#'-
      008940 17 5F            [ 2] 1782 	decw y  
      008942 90 7F            [ 1] 1783 	ld (y),a
      0008FD                       1784 9$:	
      008944 C6               [ 1] 1785 	ldw x,y 
      008945 00 0B A1         [ 2] 1786 	subw x,#pad+PAD_SIZE-1 
      008948 0A               [ 2] 1787 	negw x  
      000902                       1788 10$:
      008949 26               [ 1] 1789 	ld a,xl 
      00894A 06 5D 2A         [ 1] 1790 	cp a,tab_width
      00894D 03 03            [ 1] 1791 	jruge 12$
      00894F 01 50            [ 2] 1792 	decw y 
      008951 A6 20            [ 1] 1793 	ld a,#SPACE 
      008951 C6 00            [ 1] 1794 	ld (y),a
      008953 0B               [ 2] 1795 	incw x 
      008954 62 AB            [ 2] 1796 	jra 10$ 
      000911                       1797 12$:
      008956 30               [ 1] 1798     ldw x,y 
      008957 A1 3A 2B         [ 4] 1799 	call puts  
      000915                       1800 	_drop VSIZE 
      00895A 02 AB            [ 2]    1     addw sp,#VSIZE 
      00895C 07               [ 4] 1801 	ret 
                                   1802 
                                   1803 ;------------------------------------
                                   1804 ; convert integer in acc24 to string
                                   1805 ; input:
                                   1806 ;   A	  	base
                                   1807 ;	acc24	integer to convert
                                   1808 ; output:
                                   1809 ;   X  		pointer to string
                                   1810 ;------------------------------------
                           000001  1811 	SIGN=1  ; integer sign 
                           000002  1812 	BASE=2  ; numeric base 
                           000002  1813 	VSIZE=2  ;locals size
      000918                       1814 itoa:
      00895D 90 5A            [ 2] 1815 	sub sp,#VSIZE
      00895F 90 F7            [ 1] 1816 	ld (BASE,sp), a  ; base
      008961 5D 26            [ 1] 1817 	clr (SIGN,sp)    ; sign
      008963 ED A6            [ 1] 1818 	cp a,#10
      008965 10 C1            [ 1] 1819 	jrne 1$
                                   1820 	; base 10 string display with negative sign if bit 23==1
      008967 00 0B 26 08 A6   [ 2] 1821 	btjf acc24,#7,1$
      00896C 24 90            [ 1] 1822 	cpl (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00896E 5A 90 F7         [ 4] 1823 	call neg_acc24
      00092C                       1824 1$:
                                   1825 ; initialize string pointer 
      008971 20 0A 0D         [ 2] 1826 	ldw x,#pad+PAD_SIZE-1
      008974 01               [ 1] 1827 	clr (x)
      000930                       1828 itoa_loop:
      008975 27 06            [ 1] 1829     ld a,(BASE,sp)
      008977 A6 2D 90         [ 4] 1830     call divu24_8 ; acc24/A 
      00897A 5A 90            [ 1] 1831     add a,#'0  ; remainder of division
      00897C F7 3A            [ 1] 1832     cp a,#'9+1
      00897D 2B 02            [ 1] 1833     jrmi 2$
      00897D 93 1D            [ 1] 1834     add a,#7 
      00897F 17               [ 2] 1835 2$: decw x
      008980 5F               [ 1] 1836     ld (x),a
                                   1837 	; if acc24==0 conversion done
      008981 50 00 0B         [ 1] 1838 	ld a,acc24
      008982 CA 00 0C         [ 1] 1839 	or a,acc16
      008982 9F C1 00         [ 1] 1840 	or a,acc8
      008985 27 24            [ 1] 1841     jrne itoa_loop
                                   1842 	;conversion done, next add '$' or '-' as required
      008987 09 90            [ 1] 1843 	ld a,(BASE,sp)
      008989 5A A6            [ 1] 1844 	cp a,#16
      00898B 20 90            [ 1] 1845 	jreq 8$
      00898D F7 5C            [ 1] 1846 	ld a,(SIGN,sp)
      00898F 20 F1            [ 1] 1847     jreq 10$
      008991 A6 2D            [ 1] 1848     ld a,#'-
      008991 93 CD            [ 2] 1849 	jra 9$ 
      008993 82 57            [ 1] 1850 8$: ld a,#'$ 
      008995 5B               [ 2] 1851 9$: decw x
      008996 01               [ 1] 1852     ld (x),a
      00095C                       1853 10$:
      008997 81 02            [ 2] 1854 	addw sp,#VSIZE
      008998 81               [ 4] 1855 	ret
                                   1856 
                                   1857 ;-------------------------------------
                                   1858 ; divide uint24_t by uint8_t
                                   1859 ; used to convert uint24_t to string
                                   1860 ; input:
                                   1861 ;	acc24	dividend
                                   1862 ;   A 		divisor
                                   1863 ; output:
                                   1864 ;   acc24	quotient
                                   1865 ;   A		remainder
                                   1866 ;------------------------------------- 
                                   1867 ; offset  on sp of arguments and locals
                           000001  1868 	U8   = 1   ; divisor on stack
                           000001  1869 	VSIZE =1
      00095F                       1870 divu24_8:
      008998 52               [ 2] 1871 	pushw x ; save x
      008999 02               [ 1] 1872 	push a 
                                   1873 	; ld dividend UU:MM bytes in X
      00899A 6B 02 0F         [ 1] 1874 	ld a, acc24
      00899D 01               [ 1] 1875 	ld xh,a
      00899E A1 0A 26         [ 1] 1876 	ld a,acc24+1
      0089A1 0A               [ 1] 1877 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089A2 72 0F            [ 1] 1878 	ld a,(U8,SP) ; divisor
      0089A4 00               [ 2] 1879 	div x,a ; UU:MM/U8
      0089A5 0C               [ 1] 1880 	push a  ;save remainder
      0089A6 05               [ 1] 1881 	ld a,xh
      0089A7 03 01 CD         [ 1] 1882 	ld acc24,a
      0089AA 8A               [ 1] 1883 	ld a,xl
      0089AB 41 00 0C         [ 1] 1884 	ld acc24+1,a
      0089AC 84               [ 1] 1885 	pop a
      0089AC AE               [ 1] 1886 	ld xh,a
      0089AD 17 5F 7F         [ 1] 1887 	ld a,acc24+2
      0089B0 97               [ 1] 1888 	ld xl,a
      0089B0 7B 02            [ 1] 1889 	ld a,(U8,sp) ; divisor
      0089B2 CD               [ 2] 1890 	div x,a  ; R:LL/U8
      0089B3 89 DF            [ 1] 1891 	ld (U8,sp),a ; save remainder
      0089B5 AB               [ 1] 1892 	ld a,xl
      0089B6 30 A1 3A         [ 1] 1893 	ld acc24+2,a
      0089B9 2B               [ 1] 1894 	pop a
      0089BA 02               [ 2] 1895 	popw x
      0089BB AB               [ 4] 1896 	ret
                                   1897 
                                   1898 ;--------------------------------------
                                   1899 ; unsigned multiply uint24_t by uint8_t
                                   1900 ; use to convert numerical string to uint24_t
                                   1901 ; input:
                                   1902 ;	acc24	uint24_t 
                                   1903 ;   A		uint8_t
                                   1904 ; output:
                                   1905 ;   acc24   A*acc24
                                   1906 ;-------------------------------------
                                   1907 ; local variables offset  on sp
                           000003  1908 	U8   = 3   ; A pushed on stack
                           000002  1909 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1910 	OVFH = 1  ; multiplication overflow high byte
                           000003  1911 	VSIZE = 3
      000987                       1912 mulu24_8:
      0089BC 07               [ 2] 1913 	pushw x    ; save X
                                   1914 	; local variables
      0089BD 5A               [ 1] 1915 	push a     ; U8
      0089BE F7               [ 1] 1916 	clrw x     ; initialize overflow to 0
      0089BF C6               [ 2] 1917 	pushw x    ; multiplication overflow
                                   1918 ; multiply low byte.
      0089C0 00 0C CA         [ 1] 1919 	ld a,acc24+2
      0089C3 00               [ 1] 1920 	ld xl,a
      0089C4 0D CA            [ 1] 1921 	ld a,(U8,sp)
      0089C6 00               [ 4] 1922 	mul x,a
      0089C7 0E               [ 1] 1923 	ld a,xl
      0089C8 26 E6 7B         [ 1] 1924 	ld acc24+2,a
      0089CB 02               [ 1] 1925 	ld a, xh
      0089CC A1 10            [ 1] 1926 	ld (OVFL,sp),a
                                   1927 ; multipy middle byte
      0089CE 27 08 7B         [ 1] 1928 	ld a,acc24+1
      0089D1 01               [ 1] 1929 	ld xl,a
      0089D2 27 08            [ 1] 1930 	ld a, (U8,sp)
      0089D4 A6               [ 4] 1931 	mul x,a
                                   1932 ; add overflow to this partial product
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089D5 2D 20 02         [ 2] 1933 	addw x,(OVFH,sp)
      0089D8 A6               [ 1] 1934 	ld a,xl
      0089D9 24 5A F7         [ 1] 1935 	ld acc24+1,a
      0089DC 4F               [ 1] 1936 	clr a
      0089DC 5B 02            [ 1] 1937 	adc a,#0
      0089DE 81 01            [ 1] 1938 	ld (OVFH,sp),a
      0089DF 9E               [ 1] 1939 	ld a,xh
      0089DF 89 88            [ 1] 1940 	ld (OVFL,sp),a
                                   1941 ; multiply most signficant byte	
      0089E1 C6 00 0C         [ 1] 1942 	ld a, acc24
      0089E4 95               [ 1] 1943 	ld xl, a
      0089E5 C6 00            [ 1] 1944 	ld a, (U8,sp)
      0089E7 0D               [ 4] 1945 	mul x,a
      0089E8 97 7B 01         [ 2] 1946 	addw x, (OVFH,sp)
      0089EB 62               [ 1] 1947 	ld a, xl
      0089EC 88 9E C7         [ 1] 1948 	ld acc24,a
      0089EF 00 0C            [ 2] 1949     addw sp,#VSIZE
      0089F1 9F               [ 2] 1950 	popw x
      0089F2 C7               [ 4] 1951 	ret
                                   1952 
                                   1953 ;------------------------------------
                                   1954 ;  two's complement acc24
                                   1955 ;  input:
                                   1956 ;		acc24 variable
                                   1957 ;  output:
                                   1958 ;		acc24 variable
                                   1959 ;-------------------------------------
      0009C1                       1960 neg_acc24:
      0089F3 00 0D 84 95      [ 1] 1961 	cpl acc24+2
      0089F7 C6 00 0E 97      [ 1] 1962 	cpl acc24+1
      0089FB 7B 01 62 6B      [ 1] 1963 	cpl acc24
      0089FF 01 9F            [ 1] 1964 	ld a,#1
      008A01 C7 00 0E         [ 1] 1965 	add a,acc24+2
      008A04 84 85 81         [ 1] 1966 	ld acc24+2,a
      008A07 4F               [ 1] 1967 	clr a
      008A07 89 88 5F         [ 1] 1968 	adc a,acc24+1
      008A0A 89 C6 00         [ 1] 1969 	ld acc24+1,a 
      008A0D 0E               [ 1] 1970 	clr a 
      008A0E 97 7B 03         [ 1] 1971 	adc a,acc24 
      008A11 42 9F C7         [ 1] 1972 	ld acc24,a 
      008A14 00               [ 4] 1973 	ret
                                   1974 
                                   1975 
                                   1976 ;------------------------------------
                                   1977 ; read a line of text from terminal
                                   1978 ; input:
                                   1979 ;	none
                                   1980 ; local variable on stack:
                                   1981 ;	LL  line length
                                   1982 ;   RXCHAR last received chaaracte 
                                   1983 ; output:
                                   1984 ;   text in tib  buffer
                                   1985 ;------------------------------------
                                   1986 	; local variables
                           000001  1987 	LL_HB=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           000001  1988 	RXCHAR = 1 ; last char received
                           000002  1989 	LL = 2  ; accepted line length
                           000002  1990 	VSIZE=2 
      0009E4                       1991 readln:
      008A15 0E               [ 1] 1992 	clrw x 
      008A16 9E               [ 2] 1993 	pushw x 
      008A17 6B 02 C6 00      [ 2] 1994  	ldw y,#tib ; input buffer
      0009EA                       1995 readln_loop:
      008A1B 0D 97 7B         [ 4] 1996 	call getc
      008A1E 03 42            [ 1] 1997 	ld (RXCHAR,sp),a
      008A20 72 FB            [ 1] 1998 	cp a,#CR
      008A22 01 9F            [ 1] 1999 	jrne 1$
      008A24 C7 00 0D         [ 2] 2000 	jp readln_quit
      008A27 4F A9            [ 1] 2001 1$:	cp a,#LF 
      008A29 00 6B            [ 1] 2002 	jreq readln_quit
      008A2B 01 9E            [ 1] 2003 	cp a,#BS
      008A2D 6B 02            [ 1] 2004 	jreq del_back
      008A2F C6 00            [ 1] 2005 	cp a,#CTRL_D
      008A31 0C 97            [ 1] 2006 	jreq del_ln
      008A33 7B 03            [ 1] 2007 	cp a,#CTRL_R 
      008A35 42 72            [ 1] 2008 	jreq reprint 
                                   2009 ;	cp a,#'[
                                   2010 ;	jreq ansi_seq
      000A06                       2011 final_test:
      008A37 FB 01            [ 1] 2012 	cp a,#SPACE
      008A39 9F C7            [ 1] 2013 	jrpl accept_char
      008A3B 00 0C            [ 2] 2014 	jra readln_loop
      000A0C                       2015 ansi_seq:
                                   2016 ;	call getc
                                   2017 ;	cp a,#'C 
                                   2018 ;	jreq rigth_arrow
                                   2019 ;	cp a,#'D 
                                   2020 ;	jreq left_arrow 
                                   2021 ;	jra final_test
      000A0C                       2022 right_arrow:
                                   2023 ;	ld a,#BSP 
                                   2024 ;	call putc 
                                   2025 ;	jra realn_loop 
      000A0C                       2026 left_arrow:
                                   2027 ;	jra readln_loop
      000A0C                       2028 reprint: 
      008A3D 5B 03            [ 1] 2029 	tnz (LL,sp)
      008A3F 85 81            [ 1] 2030 	jrne readln_loop
      008A41 AE 16 E8         [ 2] 2031 	ldw x,#tib 
      008A41 72 53 00         [ 4] 2032 	call strlen 
      008A44 0E 72 53 00      [ 2] 2033 	ldw y,#tib 
      008A48 0D               [ 1] 2034 	ld a,xl
      008A49 72 53            [ 1] 2035 	jreq readln_loop
      008A4B 00 0C            [ 1] 2036 	ld (LL,sp),a 
      008A4D A6 01 CB         [ 2] 2037 	ldw x,#tib 
      008A50 00 0E C7         [ 4] 2038 	call puts
      008A53 00 0E            [ 1] 2039 	clr (LL_HB,sp)
      008A55 4F C9 00         [ 2] 2040 	addw y,(LL_HB,sp)
      008A58 0D C7            [ 2] 2041 	jra readln_loop 
      000A2C                       2042 del_ln:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008A5A 00 0D            [ 1] 2043 	ld a,(LL,sp)
      008A5C 4F C9 00         [ 4] 2044 	call delete
      008A5F 0C C7 00 0C      [ 2] 2045 	ldw y,#tib
      008A63 81 7F            [ 1] 2046 	clr (y)
      008A64 0F 02            [ 1] 2047 	clr (LL,sp)
      008A64 5F 89            [ 2] 2048 	jra readln_loop
      000A3B                       2049 del_back:
      008A66 90 AE            [ 1] 2050     tnz (LL,sp)
      008A68 16 E8            [ 1] 2051     jreq readln_loop
      008A6A 0A 02            [ 1] 2052     dec (LL,sp)
      008A6A CD 82            [ 2] 2053     decw y
      008A6C 4D 6B            [ 1] 2054     clr  (y)
      008A6E 01 A1 0D         [ 4] 2055     call bksp 
      008A71 26 03            [ 2] 2056     jra readln_loop	
      000A4A                       2057 accept_char:
      008A73 CC 8A            [ 1] 2058 	ld a,#TIB_SIZE-1
      008A75 DF A1            [ 1] 2059 	cp a, (LL,sp)
      008A77 0A 27            [ 1] 2060 	jreq readln_loop
      008A79 65 A1            [ 1] 2061 	ld a,(RXCHAR,sp)
      008A7B 08 27            [ 1] 2062 	ld (y),a
      008A7D 3D A1            [ 1] 2063 	inc (LL,sp)
      008A7F 04 27            [ 2] 2064 	incw y
      008A81 2A A1            [ 1] 2065 	clr (y)
      008A83 12 27 06         [ 4] 2066 	call putc 
      008A86 20 8B            [ 2] 2067 	jra readln_loop
      000A5F                       2068 readln_quit:
      008A86 A1 20            [ 1] 2069 	clr (y)
      008A88 2A 40            [ 1] 2070 	ld a,(LL,sp)
      008A8A 20 DE 03         [ 1] 2071 	ld count,a 
      008A8C                       2072 	_drop VSIZE 
      008A8C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A8C A6 0D            [ 1] 2073 	ld a,#CR
      008A8C CD 01 C4         [ 4] 2074 	call putc
      008A8C 0D               [ 4] 2075 	ret
                                   2076 
                                   2077 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           000000  2078 .if DEBUG 	
                                   2079 ;----------------------------
                                   2080 ; command interface
                                   2081 ; only 3 commands:
                                   2082 ;  'q' to resume application
                                   2083 ;  'p [addr]' to print memory values 
                                   2084 ;  's addr' to print string 
                                   2085 ;----------------------------
                                   2086 ;local variable 
                                   2087 	PSIZE=1
                                   2088 	VSIZE=1 
                                   2089 cmd_itf:
                                   2090 	sub sp,#VSIZE 
                                   2091 	clr farptr 
                                   2092 	clr farptr+1 
                                   2093 	clr farptr+2  
                                   2094 repl:
                                   2095 	ld a,#CR 
                                   2096 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2097 	ld a,#'? 
                                   2098 	call putc
                                   2099 	clr in.w 
                                   2100 	clr in 
                                   2101 	call readln
                                   2102 	ldw y,#tib  
                                   2103 	ld a,(y)
                                   2104 	jreq repl  
                                   2105 	inc in 
                                   2106 	call to_upper 
                                   2107 	cp a,#'Q 
                                   2108 	jrne test_p
                                   2109 repl_exit:
                                   2110 	clr tib 
                                   2111 	clr count 
                                   2112 	clr in 
                                   2113 	_drop #VSIZE 	
                                   2114 	ret  
                                   2115 invalid:
                                   2116 	ldw x,#invalid_cmd 
                                   2117 	call puts 
                                   2118 	jra repl 
                                   2119 test_p:	
                                   2120     cp a,#'P 
                                   2121 	jreq mem_peek
                                   2122     cp a,#'S 
                                   2123 	jrne invalid 
                                   2124 print_string:	
                                   2125 	call get_token
                                   2126 	cp a,#TK_INTGR 
                                   2127 	jrne invalid 
                                   2128 	call puts
                                   2129 	jp repl 	
                                   2130 mem_peek:
                                   2131 	ld a,#SPACE 
                                   2132 	call skip  	 
                                   2133 	addw y,in.w 
                                   2134 	ldw x,#pad 
                                   2135 	call strcpy
                                   2136 	call atoi24 	
                                   2137 	ld a, acc24 
                                   2138 	or a,acc16 
                                   2139 	or a,acc8 
                                   2140 	jrne 1$ 
                                   2141 	jra peek_byte  
                                   2142 1$:	ldw x,acc24 
                                   2143 	ldw farptr,x 
                                   2144 	ld a,acc8 
                                   2145 	ld farptr+2,a 
                                   2146 peek_byte:
                                   2147 	call print_farptr 
                                   2148 	ld a,#8 
                                   2149 	ld (PSIZE,sp),a 
                                   2150 	clrw x 
                                   2151 1$:	call fetchc  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2152 	pushw x 
                                   2153 	ld acc8,a 
                                   2154 	clrw x 
                                   2155 	ldw acc24,x 
                                   2156 	ld a,#16+128
                                   2157 	call prti24
                                   2158 	popw x 
                                   2159 	dec (PSIZE,sp)
                                   2160 	jrne 1$ 
                                   2161 	ld a,#8 
                                   2162 	add a,farptr+2 
                                   2163 	ld farptr+2,a
                                   2164 	clr a 
                                   2165 	adc a,farptr+1 
                                   2166 	ld farptr+1,a 
                                   2167 	clr a 
                                   2168 	adc a,farptr 
                                   2169 	ld farptr,a 
                                   2170 	jp repl  
                                   2171 
                                   2172 invalid_cmd: .asciz "not a command\n" 
                                   2173 
                                   2174 ;----------------------------
                                   2175 ; display farptr address
                                   2176 ;----------------------------
                                   2177 print_farptr:
                                   2178 	ld a ,farptr+2 
                                   2179 	ld acc8,a 
                                   2180 	ldw x,farptr 
                                   2181 	ldw acc24,x 
                                   2182 	clrw x 
                                   2183 	ld a,#16 
                                   2184 	call prti24
                                   2185 	ld a,#SPACE 
                                   2186 	call putc 
                                   2187 	call putc 
                                   2188 	ret
                                   2189 
                                   2190 ;------------------------------------
                                   2191 ; get byte at address farptr[X]
                                   2192 ; input:
                                   2193 ;	 farptr   address to peek
                                   2194 ;    X		  farptr index 	
                                   2195 ; output:
                                   2196 ;	 A 		  byte from memory  
                                   2197 ;    x		  incremented by 1
                                   2198 ;------------------------------------
                                   2199 fetchc: ; @C
                                   2200 	ldf a,([farptr],x)
                                   2201 	incw x
                                   2202 	ret
                                   2203 
                                   2204 
                                   2205 ;------------------------------------
                                   2206 ; expect a number from command line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2207 ; next argument
                                   2208 ;  input:
                                   2209 ;	  none
                                   2210 ;  output:
                                   2211 ;    acc24   int24_t 
                                   2212 ;------------------------------------
                                   2213 number::
                                   2214 	call get_token
                                   2215 	call atoi24
                                   2216 	ret
                                   2217 .endif ; DEBUG 
                                   2218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2219 
                                   2220 
                                   2221 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2222 ;; compiler routines        ;;
                                   2223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2224 ;------------------------------------
                                   2225 ; parse quoted string 
                                   2226 ; input:
                                   2227 ;   Y 	pointer to tib 
                                   2228 ;   X   pointer to pad
                                   2229 ; output:
                                   2230 ;	pad   parsed string
                                   2231 ;   TOS  char* to pad  
                                   2232 ;------------------------------------
                           000001  2233 	PREV = 1
                           000002  2234 	CURR =2 
                           000002  2235 	VSIZE=2 
      000A6E                       2236 parse_quote: ; { -- addr }
      000A6E                       2237 	_vars VSIZE 
      008A8D 02 26            [ 2]    1     sub sp,#VSIZE 
      008A8F DA               [ 1] 2238 	clr a
      008A90 AE 16            [ 1] 2239 1$:	ld (PREV,sp),a 
      008A92 E8 CD 82 8B      [ 1] 2240 2$:	inc in
      008A96 90 AE 16         [ 4] 2241 	ld a,([in.w],y)
      008A99 E8 9F            [ 1] 2242 	jreq 6$
      008A9B 27 CD            [ 1] 2243 	ld (CURR,sp),a 
      008A9D 6B 02            [ 1] 2244 	ld a,#'\
      008A9F AE 16            [ 1] 2245 	cp a, (PREV,sp)
      008AA1 E8 CD            [ 1] 2246 	jrne 3$
      008AA3 82 57            [ 1] 2247 	clr (PREV,sp)
      008AA5 0F 01            [ 1] 2248 	ld a,(CURR,sp)
      008AA7 72 F9            [ 4] 2249 	callr convert_escape
      008AA9 01               [ 1] 2250 	ld (x),a 
      008AAA 20               [ 2] 2251 	incw x 
      008AAB BE E5            [ 2] 2252 	jra 2$
      008AAC                       2253 3$:
      008AAC 7B 02            [ 1] 2254 	ld a,(CURR,sp)
      008AAE CD 82            [ 1] 2255 	cp a,#'\'
      008AB0 71 90            [ 1] 2256 	jreq 1$
      008AB2 AE 16            [ 1] 2257 	cp a,#'"
      008AB4 E8 90            [ 1] 2258 	jreq 5$ 
      008AB6 7F               [ 1] 2259 	ld (x),a 
      008AB7 0F               [ 2] 2260 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008AB8 02 20            [ 2] 2261 	jra 2$
      008ABA AF 5C 00 01      [ 1] 2262 5$:	inc in 
      008ABB 7F               [ 1] 2263 6$: clr (x)
      008ABB 0D 02 27         [ 2] 2264 	ldw x,#pad 
      000AA4                       2265 	_drop VSIZE
      008ABE AB 0A            [ 2]    1     addw sp,#VSIZE 
      008AC0 02 90            [ 1] 2266 	ld a,#TK_QSTR  
      008AC2 5A               [ 4] 2267 	ret 
                                   2268 
                                   2269 ;---------------------------------------
                                   2270 ; called by parse_quote
                                   2271 ; subtitute escaped character 
                                   2272 ; by their ASCII value .
                                   2273 ; input:
                                   2274 ;   A  character following '\'
                                   2275 ; output:
                                   2276 ;   A  substitued char or same if not valid.
                                   2277 ;---------------------------------------
      000AA9                       2278 convert_escape:
      008AC3 90               [ 2] 2279 	pushw x 
      008AC4 7F CD 82         [ 2] 2280 	ldw x,#escaped 
      008AC7 61               [ 1] 2281 1$:	cp a,(x)
      008AC8 20 A0            [ 1] 2282 	jreq 2$
      008ACA 7D               [ 1] 2283 	tnz (x)
      008ACA A6 4F            [ 1] 2284 	jreq 3$
      008ACC 11               [ 2] 2285 	incw x 
      008ACD 02 27            [ 2] 2286 	jra 1$
      008ACF 9A 7B 01         [ 2] 2287 2$: subw x,#escaped 
      008AD2 90               [ 1] 2288 	ld a,xl 
      008AD3 F7 0C            [ 1] 2289 	add a,#7
      008AD5 02               [ 2] 2290 3$:	popw x 
      008AD6 90               [ 4] 2291 	ret 
                                   2292 
      008AD7 5C 90 7F CD 82 44 20  2293 escaped: .asciz "abtnvfr"
             8B
                                   2294 
                                   2295 ;-------------------------
                                   2296 ; integer parser 
                                   2297 ; input:
                                   2298 ;   X 		point to pad 
                                   2299 ;   Y 		point to tib 
                                   2300 ;   A 	    first digit|'$' 
                                   2301 ; output:  
                                   2302 ;   pad     number string 
                                   2303 ;   X 		integer 
                                   2304 ;   A 		TK_INTGR
                                   2305 ;-------------------------
                           000001  2306 	BASE=1
                           000002  2307 	TCHAR=2 
                           000002  2308 	VSIZE=2 
      008ADF                       2309 parse_integer: ; { -- n }
      008ADF 90 7F            [ 1] 2310 	push #0 ; TCHAR 
      008AE1 7B 02            [ 1] 2311 	cp a,#'$
      008AE3 C7 00            [ 1] 2312 	jreq 1$ 
      008AE5 04 5B            [ 1] 2313 	push #10 ; BASE=10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008AE7 02 A6            [ 2] 2314 	jra 2$ 
      008AE9 0D CD            [ 1] 2315 1$: push #16  ; BASE=16
      008AEB 82               [ 1] 2316 2$:	ld (x),a 
      008AEC 44               [ 2] 2317 	incw x 
      008AED 81 5C 00 01      [ 1] 2318 	inc in 
      008AEE 91 D6 00         [ 4] 2319 	ld a,([in.w],y)
      008AEE 52 02 4F         [ 4] 2320 	call to_upper 
      008AF1 6B 01            [ 1] 2321 	ld (TCHAR,sp),a 
      008AF3 72 5C 00         [ 4] 2322 	call is_digit 
      008AF6 02 91            [ 1] 2323 	jrc 2$
      008AF8 D6 01            [ 1] 2324 	ld a,#16 
      008AFA 27 24            [ 1] 2325 	cp a,(BASE,sp)
      008AFC 6B 02            [ 1] 2326 	jrne 3$ 
      008AFE A6 5C            [ 1] 2327 	ld a,(TCHAR,sp)
      008B00 11 01            [ 1] 2328 	cp a,#'A 
      008B02 26 0A            [ 1] 2329 	jrmi 3$ 
      008B04 0F 01            [ 1] 2330 	cp a,#'G 
      008B06 7B 02            [ 1] 2331 	jrmi 2$ 
      008B08 AD               [ 1] 2332 3$:	clr (x)
      008B09 1F F7 5C         [ 4] 2333 	call atoi24
      008B0C 20 E5 0C         [ 2] 2334 	ldw x,acc16 
      008B0E A6 04            [ 1] 2335 	ld a,#TK_INTGR
      000AFE                       2336 	_drop VSIZE  
      008B0E 7B 02            [ 2]    1     addw sp,#VSIZE 
      008B10 A1               [ 4] 2337 	ret 	
                                   2338 
                                   2339 ;-------------------------
                                   2340 ; binary integer parser 
                                   2341 ; input:
                                   2342 ;   X 		point to pad 
                                   2343 ;   Y 		point to tib 
                                   2344 ;   A 	    '%' 
                                   2345 ; output:  
                                   2346 ;   pad     number string 
                                   2347 ;   X 		integer 
                                   2348 ;   A 		TK_INTGR
                                   2349 ;   TOS     integer 
                                   2350 ;-------------------------
                           000001  2351 	BINARY=1
                           000002  2352 	VSIZE=2
      000B01                       2353 parse_binary: ; { -- n }
      008B11 5C 27            [ 1] 2354 	push #0
      008B13 DD A1            [ 1] 2355 	push #0
      008B15 22               [ 1] 2356 1$: ld (x),a 
      008B16 27               [ 2] 2357 	incw x 
      008B17 04 F7 5C 20      [ 1] 2358 	inc in 
      008B1B D7 72 5C         [ 4] 2359 	ld a,([in.w],y)
      008B1E 00 02            [ 1] 2360 	cp a,#'0 
      008B20 7F AE            [ 1] 2361 	jreq 2$
      008B22 17 38            [ 1] 2362 	cp a,#'1 
      008B24 5B 02            [ 1] 2363 	jreq 2$ 
      008B26 A6 02            [ 2] 2364 	jra bin_exit 
      008B28 81 30            [ 1] 2365 2$: sub a,#'0	
      008B29 46               [ 1] 2366 	rrc a 
      008B29 89 AE            [ 1] 2367 	rlc (BINARY+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008B2B 8B 3E            [ 1] 2368 	rlc (BINARY,sp)
      008B2D F1 27            [ 2] 2369 	jra 1$  
      000B21                       2370 bin_exit:
      008B2F 06               [ 1] 2371 	clr (x)
      008B30 7D 27            [ 2] 2372 	ldw x,(BINARY,sp)
      008B32 09 5C            [ 1] 2373 	ld a,#TK_INTGR 	
      000B26                       2374 	_drop VSIZE 
      008B34 20 F7            [ 2]    1     addw sp,#VSIZE 
      008B36 1D               [ 4] 2375 	ret
                                   2376 
                                   2377 ;---------------------------
                                   2378 ;  token begin with a letter,
                                   2379 ;  is keyword or variable. 	
                                   2380 ; input:
                                   2381 ;   X 		point to pad 
                                   2382 ;   Y 		point to text
                                   2383 ;   A 	    first letter  
                                   2384 ; output:
                                   2385 ;   X		exec_addr|var_addr 
                                   2386 ;   A 		TK_CMD 
                                   2387 ;   pad 	keyword|var_name  
                                   2388 ;   TOS     exec_addr|var_addr 
                                   2389 ;--------------------------  
      000B29                       2390 parse_keyword: ; { -- exec_addr|var_addr}
      008B37 8B 3E 9F         [ 4] 2391 	call to_upper 
      008B3A AB               [ 1] 2392 	ld (x),a 
      008B3B 07               [ 2] 2393 	incw x 
      008B3C 85 81 61 62      [ 1] 2394 	inc in 
      008B40 74 6E 76         [ 4] 2395 	ld a,([in.w],y)
      008B43 66 72 00         [ 4] 2396 	call is_alpha 
      008B46 25 EF            [ 1] 2397 	jrc parse_keyword 
      008B46 4B               [ 1] 2398 1$: clr (x)
      008B47 00 A1 24 27      [ 1] 2399 	tnz pad+1 
      008B4B 04 4B            [ 1] 2400 	jrne 2$
                                   2401 ; one letter variable name 
      008B4D 0A 20 02         [ 1] 2402 	ld a,pad 
      008B50 4B 10            [ 1] 2403 	sub a,#'A 
      008B52 F7               [ 1] 2404 	sll a 
      008B53 5C               [ 1] 2405 	push a 
      008B54 72 5C            [ 1] 2406 	push #0
      008B56 00 02 91         [ 2] 2407 	ldw x,#vars 
      008B59 D6 01 CD         [ 2] 2408 	addw x,(1,sp) ; X=var address 
      000B50                       2409 	_drop 2 
      008B5C 8D 9B            [ 2]    1     addw sp,#2 
      008B5E 6B 02            [ 1] 2410 	ld a,#TK_VAR 
      008B60 CD 85            [ 2] 2411 	jra 4$ 
      000B56                       2412 2$: ; check for keyword, otherwise syntax error.
      000B56                       2413 	_ldx_dict kword_dict
      008B62 1E 25 ED         [ 2]    1     ldw x,#kword_dict+2
      008B65 A6 10 11         [ 4] 2414 	call search_dict
      008B68 01               [ 1] 2415 	tnz a
      008B69 26 0A            [ 1] 2416 	jrne 4$ 
      008B6B 7B 02 A1         [ 2] 2417 	jp syntax_error
      008B6E 41               [ 4] 2418 4$:	ret  	
                                   2419 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2420 
                                   2421 ;------------------------------------
                                   2422 ; scan text for next token
                                   2423 ; move token in 'pad'
                                   2424 ; input: 
      000B63                       2425 	none: 
                                   2426 ; use:
                                   2427 ;	Y   pointer to text
                                   2428 ;   X	pointer to pad 
                                   2429 ;   in.w   index in text buffer
                                   2430 ; output:
                                   2431 ;   A       token attribute 
                                   2432 ;   pad 	token as .asciz
                                   2433 ;   X 		token value   
                                   2434 ;------------------------------------
                                   2435 	; use to check special character 
                                   2436 	.macro _case c t  
                                   2437 	ld a,#c 
                                   2438 	cp a,(TCHAR,sp) 
                                   2439 	jrne t
                                   2440 	.endm 
                                   2441 
                           000001  2442 	TCHAR=1
                           000002  2443 	ATTRIB=2 
                           000002  2444 	VSIZE=2
      000B63                       2445 get_token: 
      008B6F 2B 04 A1 47      [ 2] 2446 	ldw y,#tib    	
      008B73 2B DD 7F         [ 1] 2447 	ld a,in 
      008B76 CD 8D A7         [ 1] 2448 	cp a,count 
      008B79 CE 00            [ 1] 2449 	jrmi 1$
      008B7B 0D A6            [ 1] 2450 	ld a,#TK_NONE 
      008B7D 04               [ 4] 2451 	ret 
      000B72                       2452 1$:	
      000B72                       2453 	_vars VSIZE
      008B7E 5B 02            [ 2]    1     sub sp,#VSIZE 
      008B80 81 17 38         [ 2] 2454 	ldw x, #pad
      008B81 A6 20            [ 1] 2455 	ld a,#SPACE
      008B81 4B 00 4B         [ 4] 2456 	call skip
      008B84 00 F7 5C 72 5C   [ 1] 2457 	mov in.saved,in 
      008B89 00 02 91         [ 4] 2458 	ld a,([in.w],y)
      008B8C D6 01            [ 1] 2459 	jrne str_tst
      008B8E A1 30 27 06      [ 1] 2460 	clr pad 
      008B92 A1 31 27         [ 2] 2461 	jp token_exit ; end of line 
                                   2462 
      000B8D                       2463 str_tst: ; check for quoted string  	
      008B95 02 20 09         [ 4] 2464 	call to_upper 
      008B98 A0 30            [ 1] 2465 	ld (TCHAR,sp),a 
      000B92                       2466 	_case '"' nbr_tst
      008B9A 46 09            [ 1]    1 	ld a,#'"' 
      008B9C 02 09            [ 1]    2 	cp a,(TCHAR,sp) 
      008B9E 01 20            [ 1]    3 	jrne nbr_tst
      008BA0 E4 0A 6E         [ 4] 2467 	call parse_quote
      008BA1 CC 0D 18         [ 2] 2468 	jp token_exit
      000B9E                       2469 nbr_tst: ; check for number 
      008BA1 7F 1E            [ 1] 2470 	ld a,#'$'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008BA3 01 A6            [ 1] 2471 	cp a,(TCHAR,sp) 
      008BA5 04 5B            [ 1] 2472 	jreq 1$
      008BA7 02 81            [ 1] 2473 	ld a,#'&
      008BA9 11 01            [ 1] 2474 	cp a,(TCHAR,sp)
      008BA9 CD 8D            [ 1] 2475 	jrne 0$
      008BAB 9B F7 5C         [ 4] 2476 	call parse_binary ; expect binary integer 
      008BAE 72 5C 00         [ 2] 2477 	jp token_exit 
      008BB1 02 91            [ 1] 2478 0$:	ld a,(TCHAR,sp)
      008BB3 D6 01 CD         [ 4] 2479 	call is_digit
      008BB6 85 0D            [ 1] 2480 	jrnc 3$
      008BB8 25 EF 7F         [ 4] 2481 1$:	call parse_integer 
      008BBB 72 5D 17         [ 2] 2482 	jp token_exit 
      000BBD                       2483 3$: 
      000BBD                       2484 	_case '(' bkslsh_tst 
      008BBE 39 26            [ 1]    1 	ld a,#'(' 
      008BC0 15 C6            [ 1]    2 	cp a,(TCHAR,sp) 
      008BC2 17 38            [ 1]    3 	jrne bkslsh_tst
      008BC4 A0 41            [ 1] 2485 	ld a,#TK_LPAREN
      008BC6 48 88 4B         [ 2] 2486 	jp token_char   	
      000BC8                       2487 bkslsh_tst: ; character token 
      000BC8                       2488 	_case '\',rparnt_tst
      008BC9 00 AE            [ 1]    1 	ld a,#'\' 
      008BCB 00 29            [ 1]    2 	cp a,(TCHAR,sp) 
      008BCD 72 FB            [ 1]    3 	jrne rparnt_tst
      008BCF 01 5B            [ 1] 2489 	ld a,(TCHAR,sp)
      008BD1 02               [ 1] 2490 	ld (x),a 
      008BD2 A6               [ 2] 2491 	incw x 
      008BD3 05 20 0C 01      [ 1] 2492 	inc in 
      008BD6 91 D6 00         [ 4] 2493 	ld a,([in.w],y)
      008BD6 AE               [ 1] 2494 	ld (x),a 
      008BD7 A6               [ 2] 2495 	incw x 
      008BD8 03 CD 8F 09      [ 1] 2496 	inc in  
      008BDC 4D               [ 1] 2497 	clr (x) 
      008BDD 26               [ 1] 2498 	ld xl,a 
      008BDE 03 CC            [ 1] 2499 	ld a,#TK_CHAR 
      008BE0 87 E2 81         [ 2] 2500 	jp token_exit 
      008BE3                       2501 rparnt_tst:		
      008BE3                       2502 	_case ')' colon_tst 
      008BE3 90 AE            [ 1]    1 	ld a,#')' 
      008BE5 16 E8            [ 1]    2 	cp a,(TCHAR,sp) 
      008BE7 C6 00            [ 1]    3 	jrne colon_tst
      008BE9 02 C1            [ 1] 2503 	ld a,#TK_RPAREN 
      008BEB 00 04 2B         [ 2] 2504 	jp token_char 
      000BF1                       2505 colon_tst:
      000BF1                       2506 	_case ':' comma_tst 
      008BEE 03 A6            [ 1]    1 	ld a,#':' 
      008BF0 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF2 26 05            [ 1]    3 	jrne comma_tst
      008BF2 52 02            [ 1] 2507 	ld a,#TK_COLON 
      008BF4 AE 17 38         [ 2] 2508 	jp token_char 
      000BFC                       2509 comma_tst:
      000BFC                       2510 	_case COMMA sharp_tst 
      008BF7 A6 20            [ 1]    1 	ld a,#COMMA 
      008BF9 CD 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008BFB 19 55            [ 1]    3 	jrne sharp_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BFD 00 02            [ 1] 2511 	ld a,#TK_COMMA
      008BFF 00 03 91         [ 2] 2512 	jp token_char
      000C07                       2513 sharp_tst:
      000C07                       2514 	_case SHARP dash_tst 
      008C02 D6 01            [ 1]    1 	ld a,#SHARP 
      008C04 26 07            [ 1]    2 	cp a,(TCHAR,sp) 
      008C06 72 5F            [ 1]    3 	jrne dash_tst
      008C08 17 38            [ 1] 2515 	ld a,#TK_SHARP
      008C0A CC 8D 98         [ 2] 2516 	jp token_char  	 	 
      008C0D                       2517 dash_tst: 	
      000C12                       2518 	_case '-' at_tst 
      008C0D CD 8D            [ 1]    1 	ld a,#'-' 
      008C0F 9B 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C11 01 A6            [ 1]    3 	jrne at_tst
      008C13 22 11            [ 1] 2519 	ld a,#TK_MINUS  
      008C15 01 26 06         [ 2] 2520 	jp token_char 
      000C1D                       2521 at_tst:
      000C1D                       2522 	_case '@' qmark_tst 
      008C18 CD 8A            [ 1]    1 	ld a,#'@' 
      008C1A EE CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008C1C 8D 98            [ 1]    3 	jrne qmark_tst
      008C1E A6 0A            [ 1] 2523 	ld a,#TK_ARRAY 
      008C1E A6 24 11         [ 2] 2524 	jp token_char
      000C28                       2525 qmark_tst:
      000C28                       2526 	_case '?' tick_tst 
      008C21 01 27            [ 1]    1 	ld a,#'?' 
      008C23 13 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C25 26 11            [ 1]    3 	jrne tick_tst
      008C27 01 26            [ 1] 2527 	ld a,(TCHAR,sp)
      008C29 06               [ 1] 2528 	ld (x),a 
      008C2A CD               [ 2] 2529 	incw x 
      008C2B 8B               [ 1] 2530 	clr (x)
      008C2C 81 CC 8D 98      [ 1] 2531 	inc in 
      008C30 7B 01            [ 1] 2532 	ld a,#TK_CMD 
      008C32 CD 85 1E         [ 2] 2533 	ldw x,#print 
      008C35 24 06 CD         [ 2] 2534 	jp token_exit
      000C3F                       2535 tick_tst: ; ignore comment 
      000C3F                       2536 	_case TICK plus_tst 
      008C38 8B 46            [ 1]    1 	ld a,#TICK 
      008C3A CC 8D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3C 98 0C            [ 1]    3 	jrne plus_tst
      008C3D 72 5C 00 01      [ 1] 2537 	inc in 
      008C3D A6 28            [ 1] 2538 	ld a,#TK_CMD 
      008C3F 11 01 26         [ 2] 2539 	ldw x,#remark  
      008C42 05 A6 0B         [ 2] 2540 	jp token_exit 
      000C51                       2541 plus_tst:
      000C51                       2542 	_case '+' star_tst 
      008C45 CC 8D            [ 1]    1 	ld a,#'+' 
      008C47 88 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C48 26 05            [ 1]    3 	jrne star_tst
      008C48 A6 5C            [ 1] 2543 	ld a,#TK_PLUS  
      008C4A 11 01 26         [ 2] 2544 	jp token_char 
      000C5C                       2545 star_tst:
      000C5C                       2546 	_case '*' slash_tst 
      008C4D 18 7B            [ 1]    1 	ld a,#'*' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008C4F 01 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C51 5C 72            [ 1]    3 	jrne slash_tst
      008C53 5C 00            [ 1] 2547 	ld a,#TK_MULT 
      008C55 02 91 D6         [ 2] 2548 	jp token_char 
      000C67                       2549 slash_tst: 
      000C67                       2550 	_case '/' prcnt_tst 
      008C58 01 F7            [ 1]    1 	ld a,#'/' 
      008C5A 5C 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5C 5C 00            [ 1]    3 	jrne prcnt_tst
      008C5E 02 7F            [ 1] 2551 	ld a,#TK_DIV 
      008C60 97 A6 03         [ 2] 2552 	jp token_char 
      000C72                       2553 prcnt_tst:
      000C72                       2554 	_case '%' eql_tst 
      008C63 CC 8D            [ 1]    1 	ld a,#'%' 
      008C65 98 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C66 26 05            [ 1]    3 	jrne eql_tst
      008C66 A6 29            [ 1] 2555 	ld a,#TK_MOD
      008C68 11 01 26         [ 2] 2556 	jp token_char  
                                   2557 ; 1 or 2 character tokens 	
      000C7D                       2558 eql_tst:
      000C7D                       2559 	_case '=' gt_tst 		
      008C6B 05 A6            [ 1]    1 	ld a,#'=' 
      008C6D 0C CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6F 8D 88            [ 1]    3 	jrne gt_tst
      008C71 A6 32            [ 1] 2560 	ld a,#TK_EQUAL
      008C71 A6 3A 11         [ 2] 2561 	jp token_char 
      000C88                       2562 gt_tst:
      000C88                       2563 	_case '>' lt_tst 
      008C74 01 26            [ 1]    1 	ld a,#'>' 
      008C76 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C78 01 CC            [ 1]    3 	jrne lt_tst
      008C7A 8D 88            [ 1] 2564 	ld a,#TK_GT 
      008C7C 6B 02            [ 1] 2565 	ld (ATTRIB,sp),a 
      008C7C A6 2C 11 01      [ 1] 2566 	inc in 
      008C80 26 05 A6         [ 4] 2567 	ld a,([in.w],y)
      008C83 0D CC            [ 1] 2568 	cp a,#'=
      008C85 8D 88            [ 1] 2569 	jrne 1$
      008C87 7B 01            [ 1] 2570 	ld a,(TCHAR,sp)
      008C87 A6               [ 1] 2571 	ld (x),a
      008C88 23               [ 2] 2572 	incw x 
      008C89 11 01            [ 1] 2573 	ld a,#'=
      008C8B 26 05            [ 1] 2574 	ld (TCHAR,sp),a 
      008C8D A6 0E            [ 1] 2575 	ld a,#TK_GE 
      008C8F CC 8D            [ 2] 2576 	jra token_char  
      008C91 88 3C            [ 1] 2577 1$: cp a,#'<
      008C92 26 0C            [ 1] 2578 	jrne 2$
      008C92 A6 2D            [ 1] 2579 	ld a,(TCHAR,sp)
      008C94 11               [ 1] 2580 	ld (x),a
      008C95 01               [ 2] 2581 	incw x 
      008C96 26 05            [ 1] 2582 	ld a,#'<	
      008C98 A6 11            [ 1] 2583 	ld (TCHAR,sp),a 
      008C9A CC 8D            [ 1] 2584 	ld a,#TK_NE 
      008C9C 88 4F            [ 2] 2585 	jra token_char 
      008C9D 72 5A 00 01      [ 1] 2586 2$: dec in
      008C9D A6 40            [ 1] 2587 	ld a,(ATTRIB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C9F 11 01            [ 2] 2588 	jra token_char 
      000CC1                       2589 lt_tst:
      000CC1                       2590 	_case '<' other
      008CA1 26 05            [ 1]    1 	ld a,#'<' 
      008CA3 A6 0A            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA5 CC 8D            [ 1]    3 	jrne other
      008CA7 88 34            [ 1] 2591 	ld a,#TK_LT 
      008CA8 6B 02            [ 1] 2592 	ld (ATTRIB,sp),a 
      008CA8 A6 3F 11 01      [ 1] 2593 	inc in 
      008CAC 26 11 7B         [ 4] 2594 	ld a,([in.w],y)
      008CAF 01 F7            [ 1] 2595 	cp a,#'=
      008CB1 5C 7F            [ 1] 2596 	jrne 1$
      008CB3 72 5C            [ 1] 2597 	ld a,(TCHAR,sp)
      008CB5 00               [ 1] 2598 	ld (x),a 
      008CB6 02 A6            [ 1] 2599 	ld a,#'=
      008CB8 06 AE            [ 1] 2600 	ld (TCHAR,sp),a 
      008CBA 94 55            [ 1] 2601 	ld a,#TK_LE 
      008CBC CC 8D            [ 2] 2602 	jra token_char 
      008CBE 98 3E            [ 1] 2603 1$: cp a,#'>
      008CBF 26 0C            [ 1] 2604 	jrne 2$
      008CBF A6 27            [ 1] 2605 	ld a,(TCHAR,sp)
      008CC1 11               [ 1] 2606 	ld (x),a 
      008CC2 01               [ 2] 2607 	incw x 
      008CC3 26 0C            [ 1] 2608 	ld a,#'>
      008CC5 72 5C            [ 1] 2609 	ld (TCHAR,sp),a 
      008CC7 00 02            [ 1] 2610 	ld a,#TK_NE 
      008CC9 A6 06            [ 2] 2611 	jra token_char 
      008CCB AE 95 45 CC      [ 1] 2612 2$: dec in 
      008CCF 8D 98            [ 1] 2613 	ld a,(ATTRIB,sp)
      008CD1 20 0F            [ 2] 2614 	jra token_char 	
      000CF9                       2615 other: ; not a special character 	 
      008CD1 A6 2B            [ 1] 2616 	ld a,(TCHAR,sp)
      008CD3 11 01 26         [ 4] 2617 	call is_alpha 
      008CD6 05 A6            [ 1] 2618 	jrc 30$ 
      008CD8 10 CC 8D         [ 2] 2619 	jp syntax_error 
      000D03                       2620 30$: 
      008CDB 88 0B 29         [ 4] 2621 	call parse_keyword
      008CDC 20 10            [ 2] 2622 	jra token_exit 
      000D08                       2623 token_char:
      008CDC A6 2A            [ 1] 2624 	ld (ATTRIB,sp),a 
      008CDE 11 01            [ 1] 2625 	ld a,(TCHAR,sp)
      008CE0 26               [ 1] 2626 	ld (x),a 
      008CE1 05               [ 2] 2627 	incw x 
      008CE2 A6               [ 1] 2628 	clr(x)
      008CE3 20 CC 8D 88      [ 1] 2629 	inc in 
      008CE7 7B 02            [ 1] 2630 	ld a,(ATTRIB,sp)
      008CE7 A6 2F 11         [ 2] 2631 	ldw x,#pad 
      000D18                       2632 token_exit:
      000D18                       2633 	_drop VSIZE 
      008CEA 01 26            [ 2]    1     addw sp,#VSIZE 
      008CEC 05               [ 4] 2634 	ret
                                   2635 
                                   2636 
                                   2637 ;------------------------------------
                                   2638 ; convert alpha to uppercase
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2639 ; input:
                                   2640 ;    a  character to convert
                                   2641 ; output:
                                   2642 ;    a  uppercase character
                                   2643 ;------------------------------------
      000D1B                       2644 to_upper::
      008CED A6 21            [ 1] 2645 	cp a,#'a
      008CEF CC 8D            [ 1] 2646 	jrpl 1$
      008CF1 88               [ 4] 2647 0$:	ret
      008CF2 A1 7A            [ 1] 2648 1$: cp a,#'z	
      008CF2 A6 25            [ 1] 2649 	jrugt 0$
      008CF4 11 01            [ 1] 2650 	sub a,#32
      008CF6 26               [ 4] 2651 	ret
                                   2652 	
                                   2653 ;------------------------------------
                                   2654 ; convert pad content in integer
                                   2655 ; input:
                                   2656 ;    pad		.asciz to convert
                                   2657 ; output:
                                   2658 ;    acc24      int24_t
                                   2659 ;------------------------------------
                                   2660 	; local variables
                           000001  2661 	SIGN=1 ; 1 byte, 
                           000002  2662 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2663 	TEMP=3 ; 1 byte, temporary storage
                           000003  2664 	VSIZE=3 ; 3 bytes reserved for local storage
      000D27                       2665 atoi24:
      008CF7 05               [ 2] 2666 	pushw x ;save x
      008CF8 A6 22            [ 2] 2667 	sub sp,#VSIZE
                                   2668 	; acc24=0 
      008CFA CC 8D 88 0B      [ 1] 2669 	clr acc24    
      008CFD 72 5F 00 0C      [ 1] 2670 	clr acc16
      008CFD A6 3D 11 01      [ 1] 2671 	clr acc8 
      008D01 26 05 A6         [ 1] 2672 	ld a, pad 
      008D04 32 CC            [ 1] 2673 	jreq atoi_exit
      008D06 8D 88            [ 1] 2674 	clr (SIGN,sp)
      008D08 A6 0A            [ 1] 2675 	ld a,#10
      008D08 A6 3E            [ 1] 2676 	ld (BASE,sp),a ; default base decimal
      008D0A 11 01 26         [ 2] 2677 	ldw x,#pad ; pointer to string to convert
      008D0D 33               [ 1] 2678 	ld a,(x)
      008D0E A6 31            [ 1] 2679 	jreq 9$  ; completed if 0
      008D10 6B 02            [ 1] 2680 	cp a,#'-
      008D12 72 5C            [ 1] 2681 	jrne 1$
      008D14 00 02            [ 1] 2682 	cpl (SIGN,sp)
      008D16 91 D6            [ 2] 2683 	jra 2$
      008D18 01 A1            [ 1] 2684 1$: cp a,#'$
      008D1A 3D 26            [ 1] 2685 	jrne 3$
      008D1C 0C 7B            [ 1] 2686 	ld a,#16
      008D1E 01 F7            [ 1] 2687 	ld (BASE,sp),a
      008D20 5C               [ 2] 2688 2$:	incw x
      008D21 A6               [ 1] 2689 	ld a,(x)
      000D59                       2690 3$:	
      008D22 3D 6B            [ 1] 2691 	cp a,#'a
      008D24 01 A6            [ 1] 2692 	jrmi 4$
      008D26 33 20            [ 1] 2693 	sub a,#32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D28 5F A1            [ 1] 2694 4$:	cp a,#'0
      008D2A 3C 26            [ 1] 2695 	jrmi 9$
      008D2C 0C 7B            [ 1] 2696 	sub a,#'0
      008D2E 01 F7            [ 1] 2697 	cp a,#10
      008D30 5C A6            [ 1] 2698 	jrmi 5$
      008D32 3C 6B            [ 1] 2699 	sub a,#7
      008D34 01 A6            [ 1] 2700 	cp a,(BASE,sp)
      008D36 35 20            [ 1] 2701 	jrpl 9$
      008D38 4F 72            [ 1] 2702 5$:	ld (TEMP,sp),a
      008D3A 5A 00            [ 1] 2703 	ld a,(BASE,sp)
      008D3C 02 7B 02         [ 4] 2704 	call mulu24_8
      008D3F 20 47            [ 1] 2705 	ld a,(TEMP,sp)
      008D41 CB 00 0D         [ 1] 2706 	add a,acc24+2
      008D41 A6 3C 11         [ 1] 2707 	ld acc24+2,a
      008D44 01               [ 1] 2708 	clr a
      008D45 26 32 A6         [ 1] 2709 	adc a,acc24+1
      008D48 34 6B 02         [ 1] 2710 	ld acc24+1,a
      008D4B 72               [ 1] 2711 	clr a
      008D4C 5C 00 02         [ 1] 2712 	adc a,acc24
      008D4F 91 D6 01         [ 1] 2713 	ld acc24,a
      008D52 A1 3D            [ 2] 2714 	jra 2$
      008D54 26 0B            [ 1] 2715 9$:	tnz (SIGN,sp)
      008D56 7B 01            [ 1] 2716     jreq atoi_exit
      008D58 F7 A6 3D         [ 4] 2717     call neg_acc24
      000D95                       2718 atoi_exit: 
      008D5B 6B 01            [ 2] 2719 	addw sp,#VSIZE
      008D5D A6               [ 2] 2720 	popw x ; restore x
      008D5E 36               [ 4] 2721 	ret
                                   2722 
                                   2723 
                                   2724 ;------------------------------------
                                   2725 ; skip character c in text starting from 'in'
                                   2726 ; input:
                                   2727 ;	 y 		point to text buffer
                                   2728 ;    a 		character to skip
                                   2729 ; output:  
                                   2730 ;	'in' ajusted to new position
                                   2731 ;------------------------------------
                           000001  2732 	C = 1 ; local var
      000D99                       2733 skip:
      008D5F 20               [ 1] 2734 	push a
      008D60 27 A1 3E         [ 4] 2735 1$:	ld a,([in.w],y)
      008D63 26 0C            [ 1] 2736 	jreq 2$
      008D65 7B 01            [ 1] 2737 	cp a,(C,sp)
      008D67 F7 5C            [ 1] 2738 	jrne 2$
      008D69 A6 3E 6B 01      [ 1] 2739 	inc in
      008D6D A6 35            [ 2] 2740 	jra 1$
      000DA9                       2741 2$: _drop 1 
      008D6F 20 17            [ 2]    1     addw sp,#1 
      008D71 72               [ 4] 2742 	ret
                                   2743 	
                                   2744 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2745 ;;   TINY BASIC  operators,
                                   2746 ;;   commands and functions 
                                   2747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2748 
                                   2749 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2750 ;;  Arithmetic operators
                                   2751 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2752 
                                   2753 ;--------------------------------
                                   2754 ;  add 2 integers
                                   2755 ;  input:
                                   2756 ;    N1     on cstack 
                                   2757 ;    N2     on cstack 
                                   2758 ;  output:
                                   2759 ;    X 		n2+n1 
                                   2760 ;--------------------------------
                                   2761 	;arugments on cstack 
      000DAC                       2762 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000DAC                       2763 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000DAC                       2764 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000DAC                       2765 add:
      008D72 5A 00            [ 2] 2766 	ldw x ,(N2,sp)
      008D74 02 7B 02         [ 2] 2767 	addw x,(N1,sp)
      008D77 20 0F            [ 2] 2768 	ldw (N1,sp),x 
      008D79 81               [ 4] 2769 	ret 
                                   2770 
                                   2771 ;--------------------------------
                                   2772 ;  substract 2 ntegers
                                   2773 ;  input:
                                   2774 ;    N1     on cstack 
                                   2775 ;    N2     on cstack 
                                   2776 ;  output:
                                   2777 ;    X 		n2+n1 
                                   2778 ;--------------------------------
      000DB4                       2779 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000DB4                       2780 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000DB4                       2781 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000DB4                       2782 substract:
      008D79 7B 01            [ 2] 2783 	ldw x,(N2,sp)
      008D7B CD 85 0D         [ 2] 2784 	subw x,(N1,sp)
      008D7E 25               [ 4] 2785 	ret 
                                   2786 
                                   2787 ;-------------------------------------
                                   2788 ; multiply 2 integers
                                   2789 ; product overflow is ignored unless
                                   2790 ; MATH_OVF assembler flag is set to 1
                                   2791 ; input:
                                   2792 ;  	N1      on cstack
                                   2793 ;   N2 		on cstack 
                                   2794 ; output:
                                   2795 ;	X        N1*N2 
                                   2796 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2797 	;arguments 
      000DBA                       2798 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000DBA                       2799 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000DBA                       2800 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000DBA                       2801 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000DBA                       2802 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2803    ; local variables 
                           000001  2804 	SIGN=1
                           000002  2805 	PROD=2
                           000003  2806 	VSIZE=3
      000DBA                       2807 multiply:
      000DBA                       2808 	_vars VSIZE 
      008D7F 03 CC            [ 2]    1     sub sp,#VSIZE 
      008D81 87 E2            [ 1] 2809 	clr (SIGN,sp)
      008D83 1E 06            [ 2] 2810 	ldw x,(N1_HB,sp)
      008D83 CD               [ 1] 2811 	ld a,xh  
      008D84 8B A9            [ 1] 2812 	bcp a,#0x80 
      008D86 20 10            [ 1] 2813 	jreq 2$
      008D88 03 01            [ 1] 2814 	cpl (SIGN,sp)
      008D88 6B               [ 2] 2815 	negw x 
      008D89 02 7B            [ 2] 2816 	ldw (N1_HB,sp),x 
      008D8B 01 F7            [ 2] 2817 2$: ldw x,(N2_HB,sp)
      008D8D 5C               [ 1] 2818 	ld a,xh  
      008D8E 7F 72            [ 1] 2819 	bcp a,#0x80 
      008D90 5C 00            [ 1] 2820 	jreq 3$
      008D92 02 7B            [ 1] 2821 	cpl (SIGN,sp)
      008D94 02               [ 2] 2822 	negw x 
      008D95 AE 17            [ 2] 2823 	ldw (N2_HB,sp),x 
                                   2824 ; N1_LB * N2_LB 	
      008D97 38 07            [ 1] 2825 3$:	ld a,(N1_LB,sp)
      008D98 97               [ 1] 2826 	ld xl,a 
      008D98 5B 02            [ 1] 2827 	ld a,(N2_LB,sp) 
      008D9A 81               [ 4] 2828 	mul x,a 
                           000000  2829 .if MATH_OVF 	
                                   2830 	ld a,xh 
                                   2831 	bcp a,#0x80 
                                   2832 	jreq 4$ 
                                   2833 	ld a,#ERR_MATH_OVF 
                                   2834 	jp tb_error
                                   2835 .endif 	 
      008D9B 1F 02            [ 2] 2836 4$:	ldw (PROD,sp),x
                                   2837 ; N1_LB * N2_HB	 
      008D9B A1 61            [ 1] 2838 	ld a,(N1_LB,sp) 
      008D9D 2A               [ 1] 2839 	ld xl,a 
      008D9E 01 81            [ 1] 2840 	ld a,(N2_HB,sp)
      008DA0 A1               [ 4] 2841 	mul x,a
      008DA1 7A               [ 1] 2842 	ld a,xl 
      008DA2 22 FB            [ 1] 2843 	add a,(PROD,sp)
                           000000  2844 .if MATH_OVF 	
                                   2845 	bcp a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2846 	jreq 5$ 
                                   2847 	ld a,#ERR_MATH_OVF 
                                   2848 	jp tb_error
                                   2849 .endif 	 
      008DA4 A0 20            [ 1] 2850 5$:	ld (PROD,sp),a 
                                   2851 ; N1_HB * N2_LB 
      008DA6 81 06            [ 1] 2852 	ld a,(N1_HB,sp)
      008DA7 97               [ 1] 2853 	ld xl,a 
      008DA7 89 52            [ 1] 2854 	ld a,(N2_LB,sp)
      008DA9 03               [ 4] 2855 	mul x,a 
      008DAA 72               [ 1] 2856 	ld a,xl 
      008DAB 5F 00            [ 1] 2857 	add a,(PROD,sp)
                           000000  2858 .if MATH_OVF 	
                                   2859 	bcp a,#0x80 
                                   2860 	jreq 6$ 
                                   2861 	ld a,#ERR_MATH_OVF 
                                   2862 	jp tb_error
                                   2863 .endif 	 
      008DAD 0C 72            [ 1] 2864 6$:	ld (PROD,sp),a 
                                   2865 ; N1_HB * N2_HB 	
                                   2866 ; it is pointless to multiply N1_HB*N2_HB 
                                   2867 ; as this product is over 65535 or 0 
                                   2868 ;
                                   2869 ; sign adjust product
      008DAF 5F 00            [ 1] 2870 	tnz (SIGN,sp)
      008DB1 0D 72            [ 1] 2871 	jreq 7$
      008DB3 5F 00            [ 2] 2872 	ldw x, (PROD,sp)
      008DB5 0E               [ 2] 2873 	negw x
      008DB6 C6 17            [ 2] 2874 	ldw (PROD,sp),x  
      000DFD                       2875 7$: 
      008DB8 38 27            [ 2] 2876 	ldw x,(PROD,sp) 
      000DFF                       2877 	_drop VSIZE 
      008DBA 5A 0F            [ 2]    1     addw sp,#VSIZE 
      008DBC 01               [ 4] 2878 	ret
                                   2879 
                                   2880 ;----------------------------------
                                   2881 ;  euclidian divide n2/n1 
                                   2882 ; input:
                                   2883 ;    N2 	on cstack
                                   2884 ;    N1 	on cstack
                                   2885 ; output:
                                   2886 ;    X      n2/n1 
                                   2887 ;    Y      remainder 
                                   2888 ;----------------------------------
      000E02                       2889 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000E02                       2890 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000E02                       2891 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2892 	; local variables
                           000001  2893 	SQUOT=1 ; sign quotient
                           000002  2894 	SDIVD=2 ; sign dividend  
                           000002  2895 	VSIZE=2
      000E02                       2896 divide:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000E02                       2897 	_vars VSIZE 
      008DBD A6 0A            [ 2]    1     sub sp,#VSIZE 
      008DBF 6B 02            [ 1] 2898 	clr (SQUOT,sp)
      008DC1 AE 17            [ 1] 2899 	clr (SDIVD,sp)
                                   2900 ; check for 0 divisor
      008DC3 38 F6            [ 2] 2901 	ldw x,(DIVISR,sp)
      008DC5 27               [ 2] 2902 	tnzw x 
      008DC6 47 A1            [ 1] 2903     jrne 0$
      008DC8 2D 26            [ 1] 2904 	ld a,#ERR_DIV0 
      008DCA 04 03 01         [ 2] 2905 	jp tb_error 
                                   2906 ; check divisor sign 	
      008DCD 20               [ 1] 2907 0$:	ld a,xh 
      008DCE 08 A1            [ 1] 2908 	bcp a,#0x80 
      008DD0 24 26            [ 1] 2909 	jreq 1$
      008DD2 06 A6            [ 1] 2910 	cpl (SQUOT,sp)
      008DD4 10               [ 2] 2911 	negw x 
      008DD5 6B 02            [ 2] 2912 1$:	ldw (DIVISR,sp),x
                                   2913 ; check dividend sign 	 
      008DD7 5C F6            [ 2] 2914     ldw x,(DIVIDND,sp)
      008DD9 9E               [ 1] 2915 	ld a,xh 
      008DD9 A1 61            [ 1] 2916 	bcp a,#0x80 
      008DDB 2B 02            [ 1] 2917 	jreq 2$ 
      008DDD A0 20            [ 1] 2918 	cpl (SQUOT,sp)
      008DDF A1 30            [ 1] 2919 	cpl (SDIVD,sp)
      008DE1 2B               [ 2] 2920 	negw x 
      008DE2 2B A0            [ 2] 2921 2$:	ldw y,(DIVISR,sp)
      008DE4 30               [ 2] 2922 	divw x,y
      008DE5 A1 0A 2B 06      [ 2] 2923 	ldw acc16,y 
                                   2924 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008DE9 A0 07            [ 1] 2925 	tnz (SDIVD,sp)
      008DEB 11 02            [ 1] 2926 	jreq 7$
      008DED 2A 1F            [ 2] 2927 	tnzw y 
      008DEF 6B 03            [ 1] 2928 	jreq 7$
      008DF1 7B               [ 2] 2929 	incw x
      008DF2 02 CD            [ 2] 2930 	ldw y,(DIVISR,sp)
      008DF4 8A 07 7B 03      [ 2] 2931 	subw y,acc16
      008DF8 CB 00            [ 1] 2932 7$: tnz (SQUOT,sp)
      008DFA 0E C7            [ 1] 2933 	jreq 9$ 	 
      008DFC 00               [ 2] 2934 8$:	negw x 
      000E43                       2935 9$: 
      000E43                       2936 	_drop VSIZE 
      008DFD 0E 4F            [ 2]    1     addw sp,#VSIZE 
      008DFF C9               [ 4] 2937 	ret 
                                   2938 
                                   2939 
                                   2940 ;----------------------------------
                                   2941 ;  remainder resulting from euclidian 
                                   2942 ;  division of n2/n1 
                                   2943 ; input:
                                   2944 ;   N1 		cstack 
                                   2945 ;   N2      cstack
                                   2946 ; output:
                                   2947 ;   X       N2%N1 
                                   2948 ;----------------------------------
                           000003  2949 	N1=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000005  2950 	N2=5
                           000004  2951 	VSIZE=4
      000E46                       2952 modulo:
      008E00 00 0D            [ 2] 2953 	Ldw x,(N1,sp)
      008E02 C7 00            [ 2] 2954 	ldw y,(N2,sp)
      000E4A                       2955 	_vars VSIZE 
      008E04 0D 4F            [ 2]    1     sub sp,#VSIZE 
      008E06 C9 00            [ 2] 2956 	ldw (1,sp),x 
      008E08 0C C7            [ 2] 2957 	ldw (3,sp),y 
      008E0A 00 0C 20         [ 4] 2958 	call divide 
      008E0D C9               [ 1] 2959 	ldw x,y
      000E54                       2960 	_drop VSIZE 
      008E0E 0D 01            [ 2]    1     addw sp,#VSIZE 
      008E10 27               [ 4] 2961 	ret 
                                   2962 
                                   2963 
                                   2964 ;----------------------------------
                                   2965 ; search in kword_dict name
                                   2966 ; from its execution address 
                                   2967 ; input:
                                   2968 ;   X       	execution address 
                                   2969 ; output:
                                   2970 ;   X 			cstr*  | 0 
                                   2971 ;--------------------------------
                           000001  2972 	XADR=1 
                           000003  2973 	LINK=3 
                           000004  2974 	VSIZE=4
      000E57                       2975 cmd_name:
      000E57                       2976 	_vars VSIZE 
      008E11 03 CD            [ 2]    1     sub sp,#VSIZE 
      008E13 8A 41 00 0C      [ 1] 2977 	clr acc16 
      008E15 1F 01            [ 2] 2978 	ldw (XADR,sp),x  
      008E15 5B 03 85         [ 2] 2979 	ldw x,#kword_dict	
      008E18 81 03            [ 2] 2980 1$:	ldw (LINK,sp),x
      008E19 E6 02            [ 1] 2981 	ld a,(2,x)
      008E19 88 91            [ 1] 2982 	and a,#15 
      008E1B D6 01 27         [ 1] 2983 	ld acc8,a 
      008E1E 0A 11 01         [ 2] 2984 	addw x,#3
      008E21 26 06 72 5C      [ 2] 2985 	addw x,acc16
      008E25 00               [ 2] 2986 	ldw x,(x) ; execution address 
      008E26 02 20            [ 2] 2987 	cpw x,(XADR,sp)
      008E28 F1 5B            [ 1] 2988 	jreq 2$
      008E2A 01 81            [ 2] 2989 	ldw x,(LINK,sp)
      008E2C FE               [ 2] 2990 	ldw x,(x) 
      008E2C 1E 05 72         [ 2] 2991 	subw x,#2  
      008E2F FB 03            [ 1] 2992 	jrne 1$
      008E31 1F 03            [ 2] 2993 	jra 9$
      008E33 81 03            [ 2] 2994 2$: ldw x,(LINK,sp)
      008E34 1C 00 02         [ 2] 2995 	addw x,#2 	
      000E86                       2996 9$:	_drop VSIZE
      008E34 1E 05            [ 2]    1     addw sp,#VSIZE 
      008E36 72               [ 4] 2997 	ret
                                   2998 
                                   2999 
                                   3000 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3001 ; dictionary search 
                                   3002 ; input:
                                   3003 ;	X 		dictionary entry point 
                                   3004 ;  pad		.asciz name to search 
                                   3005 ; output:
                                   3006 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3007 ;  X		execution address | 0 
                                   3008 ;---------------------------------
                           000001  3009 	NLEN=1 ; cmd length 
                           000002  3010 	YSAVE=2
                           000003  3011 	VSIZE=3 
      000E89                       3012 search_dict:
      000E89                       3013 	_vars VSIZE 
      008E37 F0 03            [ 2]    1     sub sp,#VSIZE 
      008E39 81 93            [ 1] 3014 	ldw y,x 
      008E3A                       3015 search_next:	
      008E3A 52 03            [ 1] 3016 	ld a,(y)
      008E3C 0F 01            [ 1] 3017 	and a,#0xf 
      008E3E 1E 06            [ 1] 3018 	ld (NLEN,sp),a  
      008E40 9E A5 80         [ 2] 3019 	ldw x,#pad 
      008E43 27 05            [ 2] 3020 	ldw (YSAVE,sp),y
      008E45 03 01            [ 2] 3021 	incw y  
      000E9A                       3022 cp_loop:
      008E47 50               [ 1] 3023 	ld a,(x)
      008E48 1F 06            [ 1] 3024 	jreq str_match 
      008E4A 1E 08            [ 1] 3025 	tnz (NLEN,sp)
      008E4C 9E A5            [ 1] 3026 	jreq no_match  
      008E4E 80 27            [ 1] 3027 	cp a,(y)
      008E50 05 03            [ 1] 3028 	jrne no_match 
      008E52 01 50            [ 2] 3029 	incw y 
      008E54 1F               [ 2] 3030 	incw x
      008E55 08 7B            [ 1] 3031 	dec (NLEN,sp)
      008E57 07 97            [ 2] 3032 	jra cp_loop 
      000EAC                       3033 no_match:
      008E59 7B 09            [ 2] 3034 	ldw y,(YSAVE,sp) 
      008E5B 42 1F 02 7B      [ 2] 3035 	subw y,#2 ; move Y to link field
      008E5F 07 97            [ 1] 3036 	push #TK_NONE 
      008E61 7B 08            [ 2] 3037 	ldw y,(y) ; next word link 
      008E63 42               [ 1] 3038 	pop a ; TK_NONE 
      008E64 9F 1B            [ 1] 3039 	jreq search_exit  ; not found  
                                   3040 ;try next 
      008E66 02 6B            [ 2] 3041 	jra search_next
      000EBB                       3042 str_match:
      008E68 02 7B            [ 2] 3043 	ldw y,(YSAVE,sp)
      008E6A 06 97            [ 1] 3044 	ld a,(y)
      008E6C 7B 09            [ 1] 3045 	ld (NLEN,sp),a ; needed to test keyword type  
      008E6E 42 9F            [ 1] 3046 	and a,#0xf 
                                   3047 ; move y to procedure address field 	
      008E70 1B               [ 1] 3048 	inc a 
      008E71 02 6B 02         [ 1] 3049 	ld acc8,a 
      008E74 0D 01 27 05      [ 1] 3050 	clr acc16 
      008E78 1E 02 50 1F      [ 2] 3051 	addw y,acc16 
      008E7C 02 FE            [ 2] 3052 	ldw y,(y) ; routine entry point 
                                   3053 ;determine keyword type bits 7:6 
      008E7D 7B 01            [ 1] 3054 	ld a,(NLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E7D 1E               [ 1] 3055 	swap a 
      008E7E 02 5B            [ 1] 3056 	and a,#0xc
      008E80 03               [ 1] 3057 	srl a
      008E81 81               [ 1] 3058 	srl a 
      008E82 AB 06            [ 1] 3059 	add a,#6
      000EDA                       3060 search_exit: 
      008E82 52               [ 1] 3061 	ldw x,y ; x=routine address 
      000EDB                       3062 	_drop VSIZE 	 
      008E83 02 0F            [ 2]    1     addw sp,#VSIZE 
      008E85 01               [ 4] 3063 	ret 
                                   3064 
                                   3065 ;---------------------
                                   3066 ; check if next token
                                   3067 ;  is of expected type 
                                   3068 ; input:
                                   3069 ;   A 		 expected token attribute
                                   3070 ;  ouput:
                                   3071 ;   none     if fail call syntax_error 
                                   3072 ;--------------------
      000EDE                       3073 expect:
      008E86 0F               [ 1] 3074 	push a 
      008E87 02 1E 05         [ 4] 3075 	call next_token 
      008E8A 5D 26            [ 1] 3076 	cp a,(1,sp)
      008E8C 05 A6            [ 1] 3077 	jreq 1$
      008E8E 04 CC 87         [ 2] 3078 	jp syntax_error
      008E91 E4               [ 1] 3079 1$: pop a 
      008E92 9E               [ 4] 3080 	ret 
                                   3081 
                                   3082 
                                   3083 ;-------------------------------
                                   3084 ; parse embedded BASIC routines 
                                   3085 ; arguments list.
                                   3086 ; arg_list::=  rel[','rel]*
                                   3087 ; all arguments are of integer type
                                   3088 ; and pushed on stack 
                                   3089 ; input:
                                   3090 ;   none
                                   3091 ; output:
                                   3092 ;   stack{n}   arguments pushed on stack
                                   3093 ;   A 	number of arguments pushed on stack  
                                   3094 ;--------------------------------
      000EEB                       3095 arg_list:
      008E93 A5 80            [ 1] 3096 	push #0  
      008E95 27 03 03         [ 4] 3097 1$: call relation
      008E98 01 50            [ 1] 3098 	cp a,#TK_NONE 
      008E9A 1F 05            [ 1] 3099 	jreq 5$
      008E9C 1E 07            [ 1] 3100 	cp a,#TK_INTGR
      008E9E 9E A5            [ 1] 3101 	jrne 4$
      000EF8                       3102 3$: 
                                   3103 ; swap return address with argument
      008EA0 80               [ 1] 3104 	pop a 
      008EA1 27 05            [ 2] 3105 	popw y 
      008EA3 03               [ 2] 3106 	pushw x 
      008EA4 01 03            [ 2] 3107 	pushw y 
      008EA6 02               [ 1] 3108     inc a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008EA7 50               [ 1] 3109 	push a 
      008EA8 16 05 65         [ 4] 3110 	call next_token 
      008EAB 90 CF            [ 1] 3111 	cp a,#TK_COMMA 
      008EAD 00 0D            [ 1] 3112 	jreq 1$ 
      008EAF 0D 02            [ 1] 3113 	cp a,#TK_NONE 
      008EB1 27 0B            [ 1] 3114 	jreq 5$ 
      000F0B                       3115 4$:	_unget_token 
      008EB3 90 5D 27 07 5C   [ 1]    1     mov in,in.saved
      008EB8 16               [ 1] 3116 5$:	pop a  
      008EB9 05               [ 4] 3117 	ret 
                                   3118 
                                   3119 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3120 ; parse arguments list 
                                   3121 ; between ()
                                   3122 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F12                       3123 func_args:
      008EBA 72               [ 2] 3124 	popw x
      008EBB B2 00 0D         [ 2] 3125 	ldw tmp16,x  
      008EBE 0D 01            [ 1] 3126 	ld a,#TK_LPAREN 
      008EC0 27 01 50         [ 4] 3127 	call expect 
      008EC3 CD 0E EB         [ 4] 3128 	call arg_list 
      008EC3 5B               [ 1] 3129 	push a 
      008EC4 02 81            [ 1] 3130 	ld a,#TK_RPAREN 
      008EC6 CD 0E DE         [ 4] 3131 	call expect 
      008EC6 1E               [ 1] 3132 	pop a 
      008EC7 03 16 05 52      [ 5] 3133 	jp [tmp16]
                                   3134 
                                   3135 ;--------------------------------
                                   3136 ;   BASIC commnands 
                                   3137 ;--------------------------------
                                   3138 
                                   3139 ;--------------------------------
                                   3140 ;  arithmetic and relational 
                                   3141 ;  routines
                                   3142 ;  operators precedence
                                   3143 ;  highest to lowest
                                   3144 ;  operators on same row have 
                                   3145 ;  same precedence and are executed
                                   3146 ;  from left to right.
                                   3147 ;	'*','/','%'
                                   3148 ;   '-','+'
                                   3149 ;   '=','>','<','>=','<=','<>','><'
                                   3150 ;   '<>' and '><' are equivalent for not equal.
                                   3151 ;--------------------------------
                                   3152 
                                   3153 ;---------------------
                                   3154 ; return array element
                                   3155 ; address from @(expr)
                                   3156 ; input:
                                   3157 ;   A 		TK_ARRAY
                                   3158 ; output:
                                   3159 ;   A 		TK_INTGR
                                   3160 ;	X 		element address 
                                   3161 ;----------------------
      000F29                       3162 get_array_element:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008ECB 04 1F 01         [ 4] 3163 	call func_args 
      008ECE 17 03            [ 1] 3164 	cp a,#1
      008ED0 CD 8E            [ 1] 3165 	jreq 1$
      008ED2 82 93 5B         [ 2] 3166 	jp syntax_error
      008ED5 04               [ 2] 3167 1$: popw x 
                                   3168 	; check for bounds 
      008ED6 81 00 23         [ 2] 3169 	cpw x,array_size 
      008ED7 23 05            [ 2] 3170 	jrule 3$
                                   3171 ; bounds {1..array_size}	
      008ED7 52 04            [ 1] 3172 2$: ld a,#ERR_BAD_VALUE 
      008ED9 72 5F 00         [ 2] 3173 	jp tb_error 
      008EDC 0D               [ 2] 3174 3$: tnzw  x
      008EDD 1F 01            [ 1] 3175 	jreq 2$ 
      008EDF AE               [ 2] 3176 	sllw x 
      008EE0 A6               [ 2] 3177 	pushw x 
      008EE1 01 1F 03         [ 2] 3178 	ldw x,#tib
      008EE4 E6 02 A4         [ 2] 3179 	subw x,(1,sp)
      000F49                       3180 	_drop 2   
      008EE7 0F C7            [ 2]    1     addw sp,#2 
      008EE9 00 0E            [ 1] 3181 	ld a,#TK_INTGR
      008EEB 1C               [ 4] 3182 	ret 
                                   3183 
                                   3184 ;***********************************
                                   3185 ;   expression parse,execute 
                                   3186 ;***********************************
                                   3187 ;-----------------------------------
                                   3188 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3189 ;			 integer | function |
                                   3190 ;			 '('relation')' 
                                   3191 ; output:
                                   3192 ;   A    token attribute 
                                   3193 ;   X 	 integer
                                   3194 ; ---------------------------------
                           000001  3195 	NEG=1
                           000001  3196 	VSIZE=1
      000F4E                       3197 factor:
      000F4E                       3198 	_vars VSIZE 
      008EEC 00 03            [ 2]    1     sub sp,#VSIZE 
      008EEE 72 BB 00         [ 4] 3199 	call next_token
      008EF1 0D FE            [ 1] 3200 	cp a,#CMD_END 
      008EF3 13 01            [ 1] 3201 	jrmi 20$
      008EF5 27 0A            [ 1] 3202 1$:	ld (NEG,sp),a 
      008EF7 1E 03            [ 1] 3203 	and a,#TK_GRP_MASK
      008EF9 FE 1D            [ 1] 3204 	cp a,#TK_GRP_ADD 
      008EFB 00 02            [ 1] 3205 	jreq 2$
      008EFD 26 E3            [ 1] 3206 	ld a,(NEG,sp)
      008EFF 20 05            [ 2] 3207 	jra 4$  
      000F63                       3208 2$:	
      008F01 1E 03 1C         [ 4] 3209 	call next_token 
      000F66                       3210 4$:	
      008F04 00 02            [ 1] 3211 	cp a,#TK_IFUNC 
      008F06 5B 04            [ 1] 3212 	jrne 5$ 
      008F08 81               [ 4] 3213 	call (x) 
      008F09 20 2F            [ 2] 3214 	jra 18$ 
      000F6D                       3215 5$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F09 52 03            [ 1] 3216 	cp a,#TK_INTGR
      008F0B 90 93            [ 1] 3217 	jrne 6$
      008F0D 20 29            [ 2] 3218 	jra 18$
      000F73                       3219 6$:
      008F0D 90 F6            [ 1] 3220 	cp a,#TK_ARRAY
      008F0F A4 0F            [ 1] 3221 	jrne 10$
      008F11 6B 01 AE         [ 4] 3222 	call get_array_element
      008F14 17               [ 2] 3223 	ldw x,(x)
      008F15 38 17            [ 2] 3224 	jra 18$ 
      000F7D                       3225 10$:
      008F17 02 90            [ 1] 3226 	cp a,#TK_VAR 
      008F19 5C 03            [ 1] 3227 	jrne 12$
      008F1A FE               [ 2] 3228 	ldw x,(x)
      008F1A F6 27            [ 2] 3229 	jra 18$
      000F84                       3230 12$:			
      008F1C 1E 0D            [ 1] 3231 	cp a,#TK_LPAREN
      008F1E 01 27            [ 1] 3232 	jrne 16$
      008F20 0B 90 F1         [ 4] 3233 	call relation
      008F23 26               [ 2] 3234 	pushw x 
      008F24 07 90            [ 1] 3235 	ld a,#TK_RPAREN 
      008F26 5C 5C 0A         [ 4] 3236 	call expect
      008F29 01               [ 2] 3237 	popw x 
      008F2A 20 EE            [ 2] 3238 	jra 18$	
      008F2C                       3239 16$:
      000F94                       3240 	_unget_token
      008F2C 16 02 72 A2 00   [ 1]    1     mov in,in.saved
      008F31 02               [ 1] 3241 	clr a 
      008F32 4B 00            [ 2] 3242 	jra 20$ 
      000F9C                       3243 18$: 
      008F34 90 FE            [ 1] 3244 	ld a,#TK_MINUS 
      008F36 84 27            [ 1] 3245 	cp a,(NEG,sp)
      008F38 21 20            [ 1] 3246 	jrne 19$
      008F3A D2               [ 2] 3247 	negw x
      008F3B                       3248 19$:
      008F3B 16 02            [ 1] 3249 	ld a,#TK_INTGR
      000FA5                       3250 20$:
      000FA5                       3251 	_drop VSIZE
      008F3D 90 F6            [ 2]    1     addw sp,#VSIZE 
      008F3F 6B               [ 4] 3252 	ret
                                   3253 
                                   3254 ;-----------------------------------
                                   3255 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3256 ; output:
                                   3257 ;   A    	token attribute 
                                   3258 ;	X		integer
                                   3259 ;-----------------------------------
                           000001  3260 	N1=1
                           000003  3261 	N2=3
                           000005  3262 	MULOP=5
                           000005  3263 	VSIZE=5
      000FA8                       3264 term:
      000FA8                       3265 	_vars VSIZE
      008F40 01 A4            [ 2]    1     sub sp,#VSIZE 
      008F42 0F 4C C7         [ 4] 3266 	call factor
      008F45 00 0E            [ 1] 3267 	cp a,#CMD_END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F47 72 5F            [ 1] 3268 	jrmi term_exit
      000FB1                       3269 term01:	 ; check for  operator 
      008F49 00 0D            [ 2] 3270 	ldw (N2,sp),x  ; save first factor 
      008F4B 72 B9 00         [ 4] 3271 	call next_token
      008F4E 0D 90            [ 1] 3272 	cp a,#CMD_END
      008F50 FE 7B            [ 1] 3273 	jrmi 9$
      008F52 01 4E            [ 1] 3274 0$:	ld (MULOP,sp),a
      008F54 A4 0C            [ 1] 3275 	and a,#TK_GRP_MASK
      008F56 44 44            [ 1] 3276 	cp a,#TK_GRP_MULT
      008F58 AB 06            [ 1] 3277 	jreq 1$
      008F5A 7B 05            [ 1] 3278 	ld a,(MULOP,sp) 
      000FC4                       3279 	_unget_token 
      008F5A 93 5B 03 81 01   [ 1]    1     mov in,in.saved
      008F5E 20 25            [ 2] 3280 	jra 9$
      000FCB                       3281 1$:	; got *|/|%
      008F5E 88 CD 88         [ 4] 3282 	call factor
      008F61 A1 11            [ 1] 3283 	cp a,#TK_INTGR
      008F63 01 27            [ 1] 3284 	jreq 2$ 
      008F65 03 CC 87         [ 2] 3285 	jp syntax_error
      008F68 E2 84            [ 2] 3286 2$:	ldw (N1,sp),x  
      008F6A 81 05            [ 1] 3287 	ld a,(MULOP,sp) 
      008F6B A1 20            [ 1] 3288 	cp a,#TK_MULT 
      008F6B 4B 00            [ 1] 3289 	jrne 3$
      008F6D CD 90 BB         [ 4] 3290 	call multiply 
      008F70 A1 00            [ 2] 3291 	jra term01
      008F72 27 1C            [ 1] 3292 3$: cp a,#TK_DIV 
      008F74 A1 04            [ 1] 3293 	jrne 4$ 
      008F76 26 13 02         [ 4] 3294 	call divide 
      008F78 20 C6            [ 2] 3295 	jra term01 
      008F78 84 90 85         [ 4] 3296 4$: call modulo
      008F7B 89 90            [ 2] 3297 	jra term01 
      008F7D 89 4C            [ 2] 3298 9$: ldw x,(N2,sp)  
      008F7F 88 CD            [ 1] 3299 	ld a,#TK_INTGR 	
      000FF4                       3300 term_exit:
      000FF4                       3301 	_drop VSIZE 
      008F81 88 A1            [ 2]    1     addw sp,#VSIZE 
      008F83 A1               [ 4] 3302 	ret 
                                   3303 
                                   3304 ;-------------------------------
                                   3305 ;  expr ::= term [['+'|'-'] term]*
                                   3306 ;  result range {-32768..32767}
                                   3307 ;  output:
                                   3308 ;   A    token attribute 
                                   3309 ;   X	 integer   
                                   3310 ;-------------------------------
                           000001  3311 	N1=1 
                           000003  3312 	N2=3
                           000005  3313 	OP=5 
                           000005  3314 	VSIZE=5 
      000FF7                       3315 expression:
      000FF7                       3316 	_vars VSIZE 
      008F84 0D 27            [ 2]    1     sub sp,#VSIZE 
      008F86 E6 A1 00         [ 4] 3317 	call term
      008F89 27 05            [ 1] 3318 	cp a,#CMD_END 
      008F8B 55 00            [ 1] 3319 	jrmi expr_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008F8D 03 00            [ 2] 3320 0$:	ldw (N2,sp),x 
      008F8F 02 84 81         [ 4] 3321 	call next_token
      008F92 A1 02            [ 1] 3322 	cp a,#CMD_END 
      008F92 85 CF            [ 1] 3323 	jrmi 9$ 
      008F94 00 0F            [ 1] 3324 1$:	ld (OP,sp),a  
      008F96 A6 0B            [ 1] 3325 	and a,#TK_GRP_MASK
      008F98 CD 8F            [ 1] 3326 	cp a,#TK_GRP_ADD 
      008F9A 5E CD            [ 1] 3327 	jreq 2$ 
      001011                       3328 	_unget_token
      008F9C 8F 6B 88 A6 0C   [ 1]    1     mov in,in.saved
      008FA1 CD 8F            [ 2] 3329 	jra 9$
      001018                       3330 2$: 
      008FA3 5E 84 72         [ 4] 3331 	call term
      008FA6 CC 00            [ 1] 3332 	cp a,#TK_INTGR 
      008FA8 0F 03            [ 1] 3333 	jreq 3$
      008FA9 CC 07 62         [ 2] 3334 	jp syntax_error
      008FA9 CD 8F            [ 2] 3335 3$:	ldw (N1,sp),x 
      008FAB 92 A1            [ 1] 3336 	ld a,(OP,sp)
      008FAD 01 27            [ 1] 3337 	cp a,#TK_PLUS 
      008FAF 03 CC            [ 1] 3338 	jrne 4$
      008FB1 87 E2 85         [ 4] 3339 	call add 
      008FB4 C3 00            [ 2] 3340 	jra 0$ 
      008FB6 24 23 05         [ 4] 3341 4$:	call substract
      008FB9 A6 0A            [ 2] 3342 	jra 0$
      008FBB CC 87            [ 2] 3343 9$: ldw x,(N2,sp)
      008FBD E4 5D            [ 1] 3344 	ld a,#TK_INTGR	
      001038                       3345 expr_exit:
      001038                       3346 	_drop VSIZE 
      008FBF 27 F8            [ 2]    1     addw sp,#VSIZE 
      008FC1 58               [ 4] 3347 	ret 
                                   3348 
                                   3349 ;---------------------------------------------
                                   3350 ; rel ::= expr rel_op expr
                                   3351 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3352 ;  relation return 1 | 0  for true | false 
                                   3353 ;  output:
                                   3354 ;    A 		token attribute  
                                   3355 ;	 X		1|0
                                   3356 ;---------------------------------------------
                           000001  3357 	N1=1
                           000003  3358 	N2=3
                           000005  3359 	RELOP=5
                           000005  3360 	VSIZE=5 
      00103B                       3361 relation: 
      00103B                       3362 	_vars VSIZE
      008FC2 89 AE            [ 2]    1     sub sp,#VSIZE 
      008FC4 16 E8 72         [ 4] 3363 	call expression
      008FC7 F0 01            [ 1] 3364 	cp a,#CMD_END  
      008FC9 5B 02            [ 1] 3365 	jrmi rel_exit 
                                   3366 	; expect rel_op or leave 
      008FCB A6 04            [ 2] 3367 	ldw (N2,sp),x 
      008FCD 81 08 21         [ 4] 3368 	call next_token 
      008FCE A1 02            [ 1] 3369 	cp a,#CMD_END 
      008FCE 52 01            [ 1] 3370 	jrmi 9$
      00104D                       3371 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008FD0 CD 88            [ 1] 3372 	ld (RELOP,sp),a 
      008FD2 A1 A1            [ 1] 3373 	and a,#TK_GRP_MASK
      008FD4 02 2B            [ 1] 3374 	cp a,#TK_GRP_RELOP 
      008FD6 4E 6B            [ 1] 3375 	jreq 2$
      001055                       3376 	_unget_token  
      008FD8 01 A4 30 A1 10   [ 1]    1     mov in,in.saved
      008FDD 27 04            [ 2] 3377 	jra 9$
      00105C                       3378 2$:	; expect another expression or error 
      008FDF 7B 01 20         [ 4] 3379 	call expression
      008FE2 03 04            [ 1] 3380 	cp a,#TK_INTGR 
      008FE3 27 03            [ 1] 3381 	jreq 3$
      008FE3 CD 88 A1         [ 2] 3382 	jp syntax_error 
      008FE6 1F 01            [ 2] 3383 3$:	ldw (N1,sp),x 
      008FE6 A1 07 26         [ 4] 3384 	call substract
      008FE9 03 FD            [ 1] 3385 	jrne 4$
      008FEB 20 2F 00 0D      [ 1] 3386 	mov acc8,#2 ; n1==n2
      008FED 20 0C            [ 2] 3387 	jra 6$ 
      001073                       3388 4$: 
      008FED A1 04            [ 1] 3389 	jrsgt 5$  
      008FEF 26 02 20 29      [ 1] 3390 	mov acc8,#4 ; n1<2 
      008FF3 20 04            [ 2] 3391 	jra 6$
      00107B                       3392 5$:
      008FF3 A1 0A 26 06      [ 1] 3393 	mov acc8,#1 ; n1>n2 
      00107F                       3394 6$:
      008FF7 CD               [ 1] 3395 	clrw x 
      008FF8 8F A9 FE         [ 1] 3396 	ld a, acc8  
      008FFB 20 1F            [ 1] 3397 	and a,(RELOP,sp)
      008FFD 4D               [ 1] 3398 	tnz a 
      008FFD A1 05            [ 1] 3399 	jreq 10$
      008FFF 26               [ 2] 3400 	incw x 
      001089                       3401 7$:	 
      009000 03 FE            [ 2] 3402 	jra 10$  	
      009002 20 18            [ 2] 3403 9$: ldw x,(N2,sp)
      009004                       3404 10$:
      009004 A1 0B            [ 1] 3405 	ld a,#TK_INTGR
      00108F                       3406 rel_exit: 	 
      00108F                       3407 	_drop VSIZE
      009006 26 0C            [ 2]    1     addw sp,#VSIZE 
      009008 CD               [ 4] 3408 	ret 
                                   3409 
                                   3410 ;--------------------------------
                                   3411 ; BASIC: SHOW 
                                   3412 ; print stack content in hexadecimal bytes 
                                   3413 ; 16 bytes per row 
                                   3414 ;--------------------------------
                           000001  3415 	TWSAVE=1
                           000002  3416 	BSAVE=2
                           000003  3417 	ADDR=3
                           000004  3418 	VSIZE=4 
      001092                       3419 show:
      001092                       3420 	_vars VSIZE
      009009 90 BB            [ 2]    1     sub sp,#VSIZE 
      00900B 89 A6 0C         [ 1] 3421 	ld a,base 
      00900E CD 8F            [ 1] 3422 	ld (BSAVE,sp),a
      009010 5E 85 20         [ 1] 3423 	ld a,tab_width
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009013 08 01            [ 1] 3424 	ld (TWSAVE,sp),a
      009014 35 10 00 0A      [ 1] 3425 	mov base,#16   
      009014 55 00 03         [ 2] 3426 	ldw x,#cstk_prompt
      009017 00 02 4F         [ 4] 3427 	call puts 
      00901A 20               [ 1] 3428 	ldw x,sp 
      00901B 09 00 05         [ 2] 3429 	addw x,#VSIZE+1 ; ignore local vars and return address
      00901C 1F 03            [ 2] 3430 	ldw (ADDR,sp),x 
      0010AE                       3431 dotr_loop:
      00901C A6 11 11         [ 2] 3432 	cpw x,#RAM_SIZE 
      00901F 01 26            [ 1] 3433 	jruge 9$
      009021 01 50            [ 1] 3434 	ld a,#16 
      009023 90 AE 18 00      [ 2] 3435 	ldw y,#RAM_SIZE  
      009023 A6 04 03         [ 2] 3436 	subw y,(ADDR,sp)
      009025 90 A3 00 10      [ 2] 3437 	cpw y,#16 
      009025 5B 01            [ 1] 3438 	jruge 2$
      009027 81 9F            [ 1] 3439 	ld a,yl  
      009028                       3440 2$:  
      009028 52 05 CD         [ 4] 3441 	call show_row 
      00902B 8F CE            [ 2] 3442 	ldw (ADDR,sp),x 
      00902D A1 02            [ 2] 3443 	jra dotr_loop 
      00902F 2B 43            [ 1] 3444 9$:	ld a,#CR 
      009031 CD 01 C4         [ 4] 3445 	call putc 
      009031 1F 03            [ 1] 3446 	ld a,(BSAVE,sp)
      009033 CD 88 A1         [ 1] 3447 	ld base,a 
      009036 A1 02            [ 1] 3448 	ld a,(TWSAVE,sp)
      009038 2B 36 6B         [ 1] 3449 	ld tab_width,a 
      0010DA                       3450 	_drop VSIZE 
      00903B 05 A4            [ 2]    1     addw sp,#VSIZE 
      00903D 30               [ 1] 3451 	clr a 
      00903E A1               [ 4] 3452 	ret
                                   3453 
      00903F 20 27 09 7B 05 55 00  3454 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             03 00 02 20 25 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3455 
                                   3456 ;---------------------
                                   3457 ; display n bytes row 
                                   3458 ; from memory.
                                   3459 ; input:
                                   3460 ;   A   bytes to print 
                                   3461 ;	X   start address 
                                   3462 ; output:
                                   3463 ;   X   address after last shown  
                                   3464 ;---------------------
                           000001  3465 	CNT=1 
                           000002  3466 	ADR=2 
                           000003  3467 	VSIZE=3 
      00904B                       3468 show_row:
      00904B CD               [ 1] 3469 	tnz a 
      00904C 8F CE            [ 1] 3470 	jrne 1$
      00904E A1               [ 4] 3471 	ret 
      001109                       3472 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00904F 04               [ 2] 3473 	pushw x  
      009050 27               [ 1] 3474 	push a 
      009051 03 CC 87 E2      [ 1] 3475 	mov tab_width,#4 
      009055 1F 01 7B         [ 4] 3476 	call print_int 
      009058 05 A1            [ 1] 3477 	ld a,#SPACE  
      00905A 20 26 05         [ 4] 3478 	call putc
      001117                       3479 row_loop:
      00905D CD 8E            [ 2] 3480 	ldw x,(ADR,sp)
      00905F 3A               [ 1] 3481 	ld a,(x)
      009060 20               [ 1] 3482 	clrw x 
      009061 CF               [ 1] 3483 	ld xl,a 
      009062 A1 21 26         [ 4] 3484 	call print_int 
      009065 05 CD            [ 2] 3485 	ldw x,(ADR,sp)
      009067 8E               [ 2] 3486 	incw x 
      009068 82 20            [ 2] 3487 	ldw (ADR,sp),x 
      00906A C6 CD            [ 1] 3488 	dec (CNT,sp)
      00906C 8E C6            [ 1] 3489 	jrne row_loop
      001128                       3490 	_drop VSIZE  		
      00906E 20 C1            [ 2]    1     addw sp,#VSIZE 
      009070 1E 03 A6 04      [ 1] 3491 	mov tab_width,#4
      009074 A6 0D            [ 1] 3492 	ld a,#CR 
      009074 5B 05 81         [ 4] 3493 	call putc 
      009077 81               [ 4] 3494 	ret 
                                   3495 
                                   3496 ;--------------------------------------------
                                   3497 ; BASIC: HEX 
                                   3498 ; select hexadecimal base for integer print
                                   3499 ;---------------------------------------------
      001134                       3500 hex_base:
      009077 52 05 CD 90      [ 1] 3501 	mov base,#16 
      00907B 28               [ 4] 3502 	ret 
                                   3503 
                                   3504 ;--------------------------------------------
                                   3505 ; BASIC: DEC 
                                   3506 ; select decimal base for integer print
                                   3507 ;---------------------------------------------
      001139                       3508 dec_base:
      00907C A1 02 2B 38      [ 1] 3509 	mov base,#10
      009080 1F               [ 4] 3510 	ret 
                                   3511 
                                   3512 ;------------------------
                                   3513 ; BASIC: SIZE 
                                   3514 ; return free size in text area
                                   3515 ; output:
                                   3516 ;   A 		TK_INTGR
                                   3517 ;   X 	    size integer
                                   3518 ;--------------------------
      00113E                       3519 size:
      009081 03 CD 88         [ 2] 3520 	ldw x,#tib 
      009084 A1 A1 02 2B      [ 2] 3521 	subw x,txtend 
      009088 2B 6B            [ 1] 3522 	ld a,#TK_INTGR
      00908A 05               [ 4] 3523 	ret 
                                   3524 
                                   3525 
                                   3526 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3527 ; BASIC: UBOUND  
                                   3528 ; return array variable size 
                                   3529 ; output:
                                   3530 ;   A 		TK_INTGR
                                   3531 ;   X 	    array size 
                                   3532 ;--------------------------
      001148                       3533 ubound:
      00908B A4 30 A1         [ 2] 3534 	ldw x,#tib
      00908E 10 27 07 55      [ 2] 3535 	subw x,txtend 
      009092 00 03 00 02      [ 2] 3536 	ldw y,basicptr 
      009096 20 1C 00 20      [ 2] 3537 	cpw y,txtend 
      009098 25 0A            [ 1] 3538 	jrult 1$
      009098 CD 90 28         [ 1] 3539 	push count 
      00909B A1 04            [ 1] 3540 	push #0 
      00909D 27 03 CC         [ 2] 3541 	subw x,(1,sp)
      001161                       3542 	_drop 2 
      0090A0 87 E2            [ 2]    1     addw sp,#2 
      0090A2 1F               [ 2] 3543 1$:	srlw x 
      0090A3 01 7B 05         [ 2] 3544 	ldw array_size,x
      0090A6 A1 10            [ 1] 3545 	ld a,#TK_INTGR
      0090A8 26               [ 4] 3546 	ret 
                                   3547 
                                   3548 ;-----------------------------
                                   3549 ; BASIC: LET var=expr 
                                   3550 ; variable assignement 
                                   3551 ; output:
                                   3552 ;   A 		TK_NONE 
                                   3553 ;-----------------------------
      00116A                       3554 let:
      0090A9 05 CD 8E         [ 4] 3555 	call next_token 
      0090AC 2C 20            [ 1] 3556 	cp a,#TK_VAR 
      0090AE D1 CD            [ 1] 3557 	jreq let02
      0090B0 8E 34 20         [ 2] 3558 	jp syntax_error
      001174                       3559 let02:
      0090B3 CC               [ 2] 3560 	pushw x  
      0090B4 1E 03 A6         [ 4] 3561 	call next_token 
      0090B7 04 32            [ 1] 3562 	cp a,#TK_EQUAL
      0090B8 27 03            [ 1] 3563 	jreq 1$
      0090B8 5B 05 81         [ 2] 3564 	jp syntax_error
      0090BB                       3565 1$:	
      0090BB 52 05 CD         [ 4] 3566 	call relation   
      0090BE 90 77            [ 1] 3567 	cp a,#TK_INTGR 
      0090C0 A1 02            [ 1] 3568 	jreq 2$
      0090C2 2B 4B 1F         [ 2] 3569 	jp syntax_error
      001189                       3570 2$:	
      0090C5 03 CD            [ 1] 3571 	ldw y,x 
      0090C7 88               [ 2] 3572 	popw x   
      0090C8 A1               [ 2] 3573 	ldw (x),y   
      0090C9 A1               [ 4] 3574 	ret 
                                   3575 
                                   3576 ;----------------------------
                                   3577 ; BASIC: LIST [[start][,end]]
                                   3578 ; list program lines 
                                   3579 ; form start to end 
                                   3580 ; if empty argument list then 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3581 ; list all.
                                   3582 ;----------------------------
                           000001  3583 	FIRST=1
                           000003  3584 	LAST=3 
                           000005  3585 	LN_PTR=5
                           000006  3586 	VSIZE=6 
      00118E                       3587 list:
      00118E                       3588 	_vars VSIZE
      0090CA 02 2B            [ 2]    1     sub sp,#VSIZE 
      0090CC 3E 00 1E         [ 2] 3589 	ldw x,txtbgn 
      0090CD C3 00 20         [ 2] 3590 	cpw x,txtend 
      0090CD 6B 05            [ 1] 3591 	jrmi 1$
      0090CF A4 30            [ 1] 3592 	ld a,#ERR_NO_PROG 
      0090D1 A1 30 27         [ 2] 3593 	jp tb_error ; nothing to list 
      0090D4 07 55            [ 2] 3594 1$:	ldw (LN_PTR,sp),x 
      0090D6 00               [ 2] 3595 	ldw x,(x) 
      0090D7 03 00            [ 2] 3596 	ldw (FIRST,sp),x ; list from first line 
      0090D9 02 20 2F         [ 2] 3597 	ldw x,#MAX_LINENO ; biggest line number 
      0090DC 1F 03            [ 2] 3598 	ldw (LAST,sp),x 
      0090DC CD 90 77         [ 4] 3599 	call arg_list
      0090DF A1               [ 1] 3600 	tnz a
      0090E0 04 27            [ 1] 3601 	jreq list_start 
      0090E2 03 CC            [ 1] 3602 	cp a,#2 
      0090E4 87 E2            [ 1] 3603 	jreq 4$
      0090E6 1F 01            [ 1] 3604 	cp a,#1 
      0090E8 CD 8E            [ 1] 3605 	jreq first_line 
      0090EA 34 26 06         [ 2] 3606 	jp syntax_error 
      0090ED 35               [ 2] 3607 4$:	popw x 
      0090EE 02 00            [ 2] 3608 	ldw (LAST,sp),x 
      0011BB                       3609 first_line:
      0090F0 0E               [ 2] 3610 	popw x 
      0090F1 20 0C            [ 2] 3611 	ldw (FIRST,sp),x 
      0090F3                       3612 lines_skip:
      0090F3 2C 06 35         [ 2] 3613 	ldw x,txtbgn
      0090F6 04 00            [ 2] 3614 2$:	ldw (LN_PTR,sp),x 
      0090F8 0E 20 04         [ 2] 3615 	cpw x,txtend 
      0090FB 2A 3F            [ 1] 3616 	jrpl list_exit 
      0090FB 35               [ 2] 3617 	ldw x,(x) ;line# 
      0090FC 01 00            [ 2] 3618 	cpw x,(FIRST,sp)
      0090FE 0E 14            [ 1] 3619 	jrpl list_start 
      0090FF 1E 05            [ 2] 3620 	ldw x,(LN_PTR,sp) 
      0090FF 5F C6 00         [ 2] 3621 	addw x,#2 
      009102 0E               [ 1] 3622 	ld a,(x)
      009103 14               [ 2] 3623 	incw x 
      009104 05 4D 27         [ 1] 3624 	ld acc8,a 
      009107 05 5C 00 0C      [ 1] 3625 	clr acc16 
      009109 72 BB 00 0C      [ 2] 3626 	addw x,acc16
      009109 20 02            [ 2] 3627 	jra 2$ 
                                   3628 ; print loop
      0011E1                       3629 list_start:
      00910B 1E 03            [ 2] 3630 	ldw x,(LN_PTR,sp)
      00910D E6 02            [ 1] 3631 3$:	ld a,(2,x) 
      00910D A6 04 5A         [ 4] 3632 	call prt_basic_line
      00910F 1E 05            [ 2] 3633 	ldw x,(LN_PTR,sp)
      00910F 5B 05            [ 1] 3634 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009111 81 00 0D         [ 1] 3635 	ld acc8,a 
      009112 72 5F 00 0C      [ 1] 3636 	clr acc16 
      009112 52 04 C6 00      [ 2] 3637 	addw x,acc16
      009116 0B 6B 02         [ 2] 3638 	cpw x,txtend 
      009119 C6 00            [ 1] 3639 	jrpl list_exit
      00911B 27 6B            [ 2] 3640 	ldw (LN_PTR,sp),x
      00911D 01               [ 2] 3641 	ldw x,(x)
      00911E 35 10            [ 2] 3642 	cpw x,(LAST,sp)  
      009120 00 0B            [ 1] 3643 	jrsgt list_exit 
      009122 AE 91            [ 2] 3644 	ldw x,(LN_PTR,sp)
      009124 5E CD            [ 2] 3645 	jra 3$
      001207                       3646 list_exit:
      001207                       3647 	_drop VSIZE 
      009126 82 57            [ 2]    1     addw sp,#VSIZE 
      009128 96               [ 4] 3648 	ret
                                   3649 
                                   3650 ;-------------------------
                                   3651 ; print counted string 
                                   3652 ; input:
                                   3653 ;   X 	address of string
                                   3654 ;--------------------------
      00120A                       3655 prt_cmd_name:
      009129 1C               [ 1] 3656 	ld a,(x)
      00912A 00               [ 2] 3657 	incw x
      00912B 05 1F            [ 1] 3658 	and a,#15  
      00912D 03               [ 1] 3659 	push a 
      00912E 0D 01            [ 1] 3660 1$: tnz (1,sp) 
      00912E A3 18            [ 1] 3661 	jreq 9$
      009130 00               [ 1] 3662 	ld a,(x)
      009131 24 18 A6         [ 4] 3663 	call putc 
      009134 10               [ 2] 3664 	incw x
      009135 90 AE            [ 1] 3665 	dec (1,sp)	 
      009137 18 00            [ 2] 3666 	jra 1$
      009139 72               [ 1] 3667 9$: pop a 
      00913A F2               [ 4] 3668 	ret	
                                   3669 
                                   3670 ;--------------------------
                                   3671 ; print TK_QSTR
                                   3672 ; converting control character
                                   3673 ; to backslash sequence
                                   3674 ; input:
                                   3675 ;   X        char *
                                   3676 ;-----------------------------
      00121E                       3677 prt_quote:
      00913B 03 90            [ 1] 3678 	ld a,#'"
      00913D A3 00 10         [ 4] 3679 	call putc 
      009140 24               [ 1] 3680 1$:	ld a,(x)
      009141 02 90            [ 1] 3681 	jreq 9$
      009143 9F               [ 2] 3682 	incw x 
      009144 A1 20            [ 1] 3683 	cp a,#SPACE 
      009144 CD 91            [ 1] 3684 	jrult 3$
      009146 85 1F 03         [ 4] 3685 	call putc
      009149 20 E3            [ 1] 3686 	cp a,#'\ 
      00914B A6 0D            [ 1] 3687 	jrne 1$ 
      001232                       3688 2$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00914D CD 82 44         [ 4] 3689 	call putc 
      009150 7B 02            [ 2] 3690 	jra 1$
      009152 C7               [ 1] 3691 3$: push a 
      009153 00 0B            [ 1] 3692 	ld a,#'\
      009155 7B 01 C7         [ 4] 3693 	call putc 
      009158 00               [ 1] 3694 	pop a 
      009159 27 5B            [ 1] 3695 	sub a,#7
      00915B 04 4F 81         [ 1] 3696 	ld acc8,a 
      00915E 0A 63 6F 6E      [ 1] 3697 	clr acc16
      009162 74 65 6E 74      [ 2] 3698 	ldw y,#escaped 
      009166 20 6F 66 20      [ 2] 3699 	addw y,acc16 
      00916A 73 74            [ 1] 3700 	ld a,(y)
      00916C 61 63            [ 2] 3701 	jra 2$
      00916E 6B 20            [ 1] 3702 9$: ld a,#'"
      009170 66 72 6F         [ 4] 3703 	call putc 
      009173 6D               [ 2] 3704 	incw x 
      009174 20               [ 4] 3705 	ret
                                   3706 
                                   3707 
                                   3708 ;--------------------------
                                   3709 ; decompile line from token list 
                                   3710 ; input:
                                   3711 ;   A       stop at this position 
                                   3712 ;   X 		pointer at line
                                   3713 ; output:
                                   3714 ;   none 
                                   3715 ;--------------------------	
                           000001  3716 	BASE_SAV=1
                           000002  3717 	WIDTH_SAV=2
                           000003  3718 	XSAVE=3
                           000005  3719 	LLEN=5
                           000005  3720 	VSIZE=5 
      00125A                       3721 prt_basic_line:
      00125A                       3722 	_vars VSIZE
      009175 74 6F            [ 2]    1     sub sp,#VSIZE 
      009177 70 20            [ 1] 3723 	ld (LLEN,sp),a  
      009179 74 6F 20         [ 1] 3724 	ld a,base
      00917C 62 6F            [ 1] 3725 	ld (BASE_SAV,sp),a  
      00917E 74 74 6F         [ 1] 3726 	ld a,tab_width 
      009181 6D 3A            [ 1] 3727 	ld (WIDTH_SAV,sp),a 
      009183 0A 00 19         [ 2] 3728 	ldw ptr16,x
      009185 FE               [ 2] 3729 	ldw x,(x)
      009185 4D 26 01 81      [ 1] 3730 	mov base,#10
      009189 35 05 00 26      [ 1] 3731 	mov tab_width,#5
      009189 89 88 35         [ 4] 3732 	call print_int ; print line number 
      00918C 04 00            [ 1] 3733 	ld a,#SPACE 
      00918E 27 CD 89         [ 4] 3734 	call putc 
      009191 3A A6 20 CD      [ 1] 3735 	clr tab_width
      009195 82 44 03         [ 2] 3736 	ldw x,#3
      009197 9F               [ 1] 3737 1$:	ld a,xl 
      009197 1E 02            [ 1] 3738 	cp a,(LLEN,sp)
      009199 F6 5F            [ 1] 3739 	jrmi 20$
      00919B 97 CD 89         [ 2] 3740 	jp 90$
      00128B                       3741 20$:	 
      00919E 3A 1E 02 5C      [ 4] 3742 	ld a,([ptr16],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0091A2 1F               [ 2] 3743 	incw x 
      0091A3 02 0A            [ 2] 3744 	ldw (XSAVE,sp),x 
      0091A5 01 26            [ 1] 3745 	cp a,#TK_CMD 
      0091A7 EF 5B            [ 1] 3746 	jrmi 4$
      0091A9 03 35            [ 1] 3747 	cp a,#TK_CFUNC 
      0091AB 04 00            [ 1] 3748 	jrugt 4$
      00129A                       3749 2$:	
      0091AD 27 A6 0D CD      [ 5] 3750 	ldw x,([ptr16],x)
      0091B1 82 44 81         [ 2] 3751 	cpw x,#remark 
      0091B4 26 14            [ 1] 3752 	jrne 3$
      0091B4 35 10            [ 1] 3753 	ld a,#''
      0091B6 00 0B 81         [ 4] 3754 	call putc 
      0091B9 1E 03            [ 2] 3755 	ldw x,(XSAVE,sp)
      0091B9 35 0A 00         [ 2] 3756 	addw x,#2
      0091BC 0B 81 00 19      [ 2] 3757 	addw x,ptr16  
      0091BE CD 01 D7         [ 4] 3758 	call puts 
      0091BE AE 16 E8         [ 2] 3759 	jp 90$ 
      0012B7                       3760 3$:	
      0091C1 72 B0 00         [ 4] 3761 	call cmd_name
      0091C4 21 A6 04         [ 4] 3762 	call prt_cmd_name
      0091C7 81 20            [ 1] 3763 	ld a,#SPACE 
      0091C8 CD 01 C4         [ 4] 3764 	call putc 
      0091C8 AE 16            [ 2] 3765 	ldw x,(XSAVE,sp)
      0091CA E8 72 B0         [ 2] 3766 	addw x,#2
      0091CD 00 21            [ 2] 3767 	jra 1$
      0091CF 90 CE            [ 1] 3768 4$: cp a,#TK_QSTR 
      0091D1 00 05            [ 1] 3769 	jrne 5$
      0091D3 90 C3 00 21      [ 2] 3770 	addw x,ptr16
      0091D7 25 0A 3B         [ 4] 3771 	call prt_quote  
      0091DA 00 04 4B 00      [ 2] 3772 	subw x,ptr16  
      0091DE 72 F0            [ 2] 3773 	jra 1$
      0091E0 01 5B            [ 1] 3774 5$:	cp a,#TK_CHAR 
      0091E2 02 54            [ 1] 3775 	jrne 51$
      0091E4 CF 00            [ 1] 3776 	ld a,#'\ 
      0091E6 24 A6 04         [ 4] 3777 	call putc 
      0091E9 81 D6 00 19      [ 4] 3778 	ld a,([ptr16],x)
      0091EA 5C               [ 2] 3779 	incw x 
      0091EA CD 88 A1         [ 4] 3780 	call putc 
      0091ED A1 05            [ 2] 3781 	jra 1$ 
      0012ED                       3782 51$:	
      0091EF 27 03            [ 1] 3783 	cp a,#TK_VAR
      0091F1 CC 87            [ 1] 3784 	jrne 6$ 
      0091F3 E2 DE 00 19      [ 5] 3785 	ldw x,([ptr16],x)
      0091F4 1D 00 28         [ 2] 3786 	subw x,#vars 
      0091F4 89               [ 1] 3787 	ld a,xl
      0091F5 CD               [ 1] 3788 	srl a 
      0091F6 88 A1            [ 1] 3789 	add a,#'A 
      0091F8 A1 32 27         [ 4] 3790 	call putc 
      0091FB 03 CC            [ 1] 3791 	ld a,#SPACE 
      0091FD 87 E2 C4         [ 4] 3792 	call putc 
      0091FF 1E 03            [ 2] 3793 	ldw x,(XSAVE,sp)
      0091FF CD 90 BB         [ 2] 3794 	addw x,#2 
      009202 A1 04 27         [ 2] 3795 	jp  1$ 
      009205 03 CC            [ 1] 3796 6$: cp a,#TK_ARRAY 
      009207 87 E2            [ 1] 3797 	jrne 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009209 A6 40            [ 1] 3798 	ld a,#'@ 
      009209 90 93 85         [ 4] 3799 	call putc 
      00920C FF 81            [ 2] 3800 	ldw x,(XSAVE,sp)
      00920E CC 12 83         [ 2] 3801 	jp 1$ 
      00920E 52 06            [ 1] 3802 7$: cp a,#TK_INTGR 
      009210 CE 00            [ 1] 3803 	jrne 8$
      009212 1F C3 00 21      [ 5] 3804 	ldw x,([ptr16],x)
      009216 2B 05 A6         [ 4] 3805 	call print_int
                                   3806 ;	ld a,#SPACE 
                                   3807 ;	call putc 
      009219 0D CC            [ 2] 3808 	ldw x,(XSAVE,sp)
      00921B 87 E4 1F         [ 2] 3809 	addw x,#2 
      00921E 05 FE 1F         [ 2] 3810 	jp 1$
      009221 01 AE            [ 1] 3811 8$: cp a,#TK_GT 
      009223 7F FF            [ 1] 3812 	jrmi 9$
      009225 1F 03            [ 1] 3813 	cp a,#TK_NE 
      009227 CD 8F            [ 1] 3814 	jrugt 9$
      009229 6B 4D            [ 1] 3815 	sub a,#TK_GT  
      00922B 27               [ 1] 3816 	sll a 
      00922C 34 A1            [ 1] 3817 	clrw y 
      00922E 02 27            [ 1] 3818 	ld yl,a 
      009230 07 A1 01 27      [ 2] 3819 	addw y,#relop_str 
      009234 06 CC            [ 2] 3820 	ldw y,(y)
      009236 87               [ 1] 3821 	ldw x,y 
      009237 E2 85 1F         [ 4] 3822 	call puts 
      00923A 03 03            [ 2] 3823 	ldw x,(XSAVE,sp)
      00923B CC 12 83         [ 2] 3824 	jp 1$
      00923B 85 1F            [ 1] 3825 9$: cp a,#TK_PLUS 
      00923D 01 04            [ 1] 3826 	jrne 10$
      00923E A6 2B            [ 1] 3827 	ld a,#'+
      00923E CE 00            [ 2] 3828 	jra 80$ 
      009240 1F 1F            [ 1] 3829 10$: cp a,#TK_MINUS
      009242 05 C3            [ 1] 3830 	jrne 11$
      009244 00 21            [ 1] 3831 	ld a,#'-
      009246 2A 3F            [ 2] 3832 	jra 80$
      009248 FE 13            [ 1] 3833 11$: cp a,#TK_MULT 
      00924A 01 2A            [ 1] 3834 	jrmi 12$
      00924C 14 1E            [ 1] 3835 	cp a,#TK_MOD 
      00924E 05 1C            [ 1] 3836 	jrugt 12$
      009250 00 02            [ 1] 3837 	sub a,#0x20
      009252 F6               [ 1] 3838 	clrw x 
      009253 5C               [ 1] 3839 	ld xl,a 
      009254 C7 00 0E         [ 2] 3840 	addw x,#mul_char 
      009257 72               [ 1] 3841 	ld a,(x)
      009258 5F 00            [ 2] 3842 	jra 80$ 
      00925A 0D 72            [ 1] 3843 12$: cp a,#TK_LPAREN 
      00925C BB 00            [ 1] 3844 	jrmi 13$
      00925E 0D 20            [ 1] 3845 	cp a,#TK_SHARP 
      009260 E0 0A            [ 1] 3846 	jrugt 13$
      009261 A0 0B            [ 1] 3847 	sub a,#TK_LPAREN
      009261 1E               [ 1] 3848 	clrw x 
      009262 05               [ 1] 3849 	ld xl,a 
      009263 E6 02 CD         [ 2] 3850 	addw x,#single_char 
      009266 92               [ 1] 3851 	ld a,(x)
      009267 DA 1E            [ 2] 3852 	jra 80$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009269 05 E6            [ 1] 3853 13$: cp a,#TK_CHAR 
      00926B 02 C7            [ 1] 3854 	jrne 14$
      00926D 00 0E            [ 1] 3855 	ld a,#'\
      00926F 72 5F 00         [ 4] 3856 	call putc 
      009272 0D 72            [ 2] 3857 	ldw x,(XSAVE,sp)
      009274 BB 00 0D C3      [ 4] 3858 	ld a,([ptr16],x)
      009278 00               [ 2] 3859 	incw x 
      009279 21 2A            [ 2] 3860 	ldw (XSAVE,sp),x 
      00927B 0B 1F 05         [ 4] 3861 	call putc 
      00927E FE 13 03         [ 2] 3862 	jp 1$ 
      009281 2C 04            [ 1] 3863 14$: ld a,#':
      009283 1E 05 20         [ 4] 3864 80$: call putc 
      009286 DC 03            [ 2] 3865 	ldw x,(XSAVE,sp)
      009287 CC 12 83         [ 2] 3866 	jp 1$ 
      0013A1                       3867 90$: 
      009287 5B 06            [ 1] 3868 	ld a,#CR 
      009289 81 01 C4         [ 4] 3869 	call putc
      00928A 7B 02            [ 1] 3870 	ld a,(WIDTH_SAV,sp) 
      00928A F6 5C A4         [ 1] 3871 	ld tab_width,a 
      00928D 0F 88            [ 1] 3872 	ld a,(BASE_SAV,sp) 
      00928F 0D 01 27         [ 1] 3873 	ld base,a
      0013B0                       3874 	_drop VSIZE 
      009292 09 F6            [ 2]    1     addw sp,#VSIZE 
      009294 CD               [ 4] 3875 	ret 	
      009295 82 44 5C 0A           3876 single_char: .byte '(',')',',','#'
      009299 01 20 F3              3877 mul_char: .byte '*','/','%'
      00929C 84 81 13 C8 13 CA 13  3878 relop_str: .word gt,equal,ge,lt,le,ne 
             CD 13 CF 13 D2
      00929E 3E 00                 3879 gt: .asciz ">"
      00929E A6 22                 3880 equal: .asciz "="
      0092A0 CD 82 44              3881 ge: .asciz ">="
      0092A3 F6 27                 3882 lt: .asciz "<"
      0092A5 2D 5C A1              3883 le: .asciz "<="
      0092A8 20 25 0C              3884 ne:  .asciz "<>"
                                   3885 
                                   3886 
                                   3887 ;---------------------------------
                                   3888 ; BASIC: PRINT|? arg_list 
                                   3889 ; print values from argument list
                                   3890 ;----------------------------------
                           000001  3891 	COMMA=1
                           000001  3892 	VSIZE=1
      0013D5                       3893 print:
      0092AB CD 82            [ 1] 3894 push #0 ; local variable COMMA 
      0013D7                       3895 reset_comma:
      0092AD 44 A1            [ 1] 3896 	clr (COMMA,sp)
      0013D9                       3897 prt_loop:
      0092AF 5C 26 F1         [ 4] 3898 	call next_token
      0092B2 A1 02            [ 1] 3899 	cp a,#CMD_END 
      0092B2 CD 82            [ 1] 3900 	jrmi print_exit ; colon or end of line 
      0092B4 44 20            [ 1] 3901 	cp a,#TK_QSTR
      0092B6 EC 88            [ 1] 3902 	jreq 1$
      0092B8 A6 5C            [ 1] 3903 	cp a,#TK_CHAR 
      0092BA CD 82            [ 1] 3904 	jreq 2$ 
      0092BC 44 84            [ 1] 3905 	cp a,#TK_CFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0092BE A0 07            [ 1] 3906 	jreq 3$
      0092C0 C7 00            [ 1] 3907 	cp a,#TK_COMMA 
      0092C2 0E 72            [ 1] 3908 	jreq 4$
      0092C4 5F 00            [ 1] 3909 	cp a,#TK_SHARP 
      0092C6 0D 90            [ 1] 3910 	jreq 5$
      0092C8 AE 8B            [ 2] 3911 	jra 7$ 
      0013F6                       3912 1$:	; print string 
      0092CA 3E 72 B9         [ 4] 3913 	call puts
      0092CD 00 0D            [ 2] 3914 	jra reset_comma
      0013FB                       3915 2$:	; print character 
      0092CF 90               [ 1] 3916 	ld a,xl 
      0092D0 F6 20 DF         [ 4] 3917 	call putc 
      0092D3 A6 22            [ 2] 3918 	jra reset_comma 
      001401                       3919 3$: ; print character function value  	
      0092D5 CD               [ 4] 3920 	call (x)
      0092D6 82               [ 1] 3921 	ld a,xl 
      0092D7 44 5C 81         [ 4] 3922 	call putc
      0092DA 20 CF            [ 2] 3923 	jra reset_comma 
      001408                       3924 4$: ; set comma state 
      0092DA 52 05            [ 1] 3925 	ld a,#255 
      0092DC 6B 05            [ 1] 3926 	ld (COMMA,sp),a  
      0092DE C6 00 0B         [ 2] 3927 	jp prt_loop   
      00140F                       3928 5$: ; # character must be followed by an integer   
      0092E1 6B 01 C6         [ 4] 3929 	call next_token
      0092E4 00 27            [ 1] 3930 	cp a,#TK_INTGR 
      0092E6 6B 02            [ 1] 3931 	jreq 6$
      0092E8 CF 00 1A         [ 2] 3932 	jp syntax_error 
      001419                       3933 6$: ; set tab width
      0092EB FE               [ 1] 3934 	ld a,xl 
      0092EC 35 0A            [ 1] 3935 	and a,#15 
      0092EE 00 0B 35         [ 1] 3936 	ld tab_width,a 
      0092F1 05 00            [ 2] 3937 	jra reset_comma 
      001421                       3938 7$:	
      001421                       3939 	_unget_token
      0092F3 27 CD 89 3A A6   [ 1]    1     mov in,in.saved
      0092F8 20 CD 82         [ 4] 3940 	call relation 
      0092FB 44 72            [ 1] 3941 	cp a,#TK_INTGR
      0092FD 5F 00            [ 1] 3942 	jreq 8$
      0092FF 27 AE 00         [ 2] 3943 	jp print_exit 
      009302 03 9F 11         [ 4] 3944 8$: call print_int 
      009305 05 2B            [ 2] 3945 	jra reset_comma 
      001435                       3946 print_exit:
      009307 03 CC            [ 1] 3947 	tnz (COMMA,sp)
      009309 94 21            [ 1] 3948 	jrne 9$
      00930B A6 0D            [ 1] 3949 	ld a,#CR 
      00930B 72 D6 00         [ 4] 3950     call putc 
      00143E                       3951 9$:	_drop VSIZE 
      00930E 1A 5C            [ 2]    1     addw sp,#VSIZE 
      009310 1F               [ 4] 3952 	ret 
                                   3953 
      001441                       3954 print_type: 
                                   3955 
                                   3956 ;----------------------
                                   3957 ; 'save_context' and
                                   3958 ; 'rest_context' must be 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3959 ; called at the same 
                                   3960 ; call stack depth 
                                   3961 ; i.e. SP must have the 
                                   3962 ; save value at  
                                   3963 ; entry point of both 
                                   3964 ; routine. 
                                   3965 ;---------------------
                           000004  3966 	CTXT_SIZE=4 ; size of saved data 
                                   3967 ;--------------------
                                   3968 ; save current BASIC
                                   3969 ; interpreter context 
                                   3970 ; on stack 
                                   3971 ;--------------------
      001441                       3972 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001441                       3973 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001441                       3974 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001441                       3975 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001441                       3976 save_context:
      009311 03 A1 06         [ 2] 3977 	ldw x,basicptr 
      009314 2B 33            [ 2] 3978 	ldw (BPTR,sp),x
      009316 A1 08 22         [ 1] 3979 	ld a,in 
      009319 2F 05            [ 1] 3980 	ld (IN,sp),a
      00931A C6 00 03         [ 1] 3981 	ld a,count 
      00931A 72 DE            [ 1] 3982 	ld (CNT,sp),a  
      00931C 00               [ 4] 3983 	ret
                                   3984 
                                   3985 ;-----------------------
                                   3986 ; restore previously saved 
                                   3987 ; BASIC interpreter context 
                                   3988 ; from stack 
                                   3989 ;-------------------------
      001451                       3990 rest_context:
      00931D 1A A3            [ 2] 3991 	ldw x,(BPTR,sp)
      00931F 95 45 26         [ 2] 3992 	ldw basicptr,x 
      009322 14 A6            [ 1] 3993 	ld a,(IN,sp)
      009324 27 CD 82         [ 1] 3994 	ld in,a
      009327 44 1E            [ 1] 3995 	ld a,(CNT,sp)
      009329 03 1C 00         [ 1] 3996 	ld count,a  
      00932C 02               [ 4] 3997 	ret
                                   3998 
                                   3999 ;------------------------------------------
                                   4000 ; BASIC: INPUT [string],var[,[string],var]
                                   4001 ; input value in variables 
                                   4002 ; [string] optionally can be used as prompt 
                                   4003 ;-----------------------------------------
                           000001  4004 	CX_BPTR=1
                           000003  4005 	CX_IN=3
                           000004  4006 	CX_CNT=4
                           000005  4007 	SKIP=5
                           000006  4008 	VAR_ADDR=6 
                           000007  4009 	VSIZE=7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      001461                       4010 input_var:
      001461                       4011 	_vars VSIZE 
      00932D 72 BB            [ 2]    1     sub sp,#VSIZE 
      001463                       4012 input_loop:
      00932F 00 1A            [ 1] 4013 	clr (SKIP,sp)
      009331 CD 82 57         [ 4] 4014 	call next_token 
      009334 CC 94            [ 1] 4015 	cp a,#TK_QSTR 
      009336 21 08            [ 1] 4016 	jrne 1$ 
      009337 CD 12 1E         [ 4] 4017 	call prt_quote 
      009337 CD 8E            [ 1] 4018 	cpl (SKIP,sp)
      009339 D7 CD 92         [ 4] 4019 	call next_token 
      00933C 8A A6            [ 1] 4020 1$: cp a,#TK_VAR  
      00933E 20 CD            [ 1] 4021 	jreq 2$ 
      009340 82 44 1E         [ 2] 4022 	jp syntax_error
      009343 03 1C            [ 2] 4023 2$:	ldw (VAR_ADDR,sp),x 
      009345 00 02            [ 1] 4024 	tnz (SKIP,sp)
      009347 20 BA            [ 1] 4025 	jrne 21$ 
                                   4026 ;	clr pad+2
      009349 A1 02 26         [ 2] 4027 	ldw x,#pad 
      00934C 0D 72 BB         [ 4] 4028 	call puts   
      001487                       4029 21$:
      00934F 00 1A            [ 1] 4030 	ld a,#':
      009351 CD 92 9E         [ 4] 4031 	call putc 
      009354 72 B0 00         [ 4] 4032 	call save_context 
      009357 1A 20 A9 A1      [ 1] 4033 	clr count  
      00935B 03 26 0F         [ 4] 4034 	call readln 
      00935E A6 5C CD         [ 2] 4035 	ldw x,#tib 
      009361 82 44 72         [ 2] 4036 	ldw basicptr,x  
      009364 D6 00 1A 5C      [ 1] 4037 	clr in 
      009368 CD 82 44         [ 4] 4038 	call get_token
      00936B 20 96            [ 1] 4039 	cp a,#TK_INTGR
      00936D 27 06            [ 1] 4040 	jreq 3$ 
      00936D A1 05 26         [ 4] 4041 	call rest_context 
      009370 1B 72 DE         [ 2] 4042 	jp syntax_error
      009373 00 1A            [ 2] 4043 3$: popw y 
      009375 1D 00            [ 2] 4044 	ldw (y),x 
      009377 29 9F 44         [ 4] 4045 	call rest_context
      00937A AB 41 CD         [ 4] 4046 	call next_token 
      00937D 82 44            [ 1] 4047 	cp a,#TK_COMMA 
      00937F A6 20            [ 1] 4048 	jreq input_loop 
      009381 CD 82            [ 1] 4049 	cp a,#TK_COLON 
      009383 44 1E            [ 2] 4050     jrule input_exit 
      009385 03 1C 00         [ 2] 4051 	jp syntax_error 
      0014C2                       4052 input_exit:
      0014C2                       4053 	_drop VSIZE 
      009388 02 CC            [ 2]    1     addw sp,#VSIZE 
      00938A 93               [ 4] 4054 	ret 
                                   4055 
                                   4056 
                                   4057 ;---------------------
                                   4058 ; BASIC: REMARK | ' 
                                   4059 ; skip comment to end of line 
                                   4060 ;---------------------- 
      0014C5                       4061 remark:
      00938B 03 A1 0A 26 0A   [ 1] 4062 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009390 A6               [ 4] 4063  	ret 
                                   4064 
                                   4065 
                                   4066 ;---------------------
                                   4067 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4068 ; read in loop 'addr'  
                                   4069 ; apply & 'mask' to value 
                                   4070 ; loop while result==0.  
                                   4071 ; if 'xor_mask' given 
                                   4072 ; apply ^ in second  
                                   4073 ; loop while result==0 
                                   4074 ;---------------------
                           000001  4075 	XMASK=1 
                           000002  4076 	MASK=2
                           000003  4077 	ADDR=3
                           000004  4078 	VSIZE=4
      0014CB                       4079 wait: 
      0014CB                       4080 	_vars VSIZE
      009391 40 CD            [ 2]    1     sub sp,#VSIZE 
      009393 82 44            [ 1] 4081 	clr (XMASK,sp) 
      009395 1E 03 CC         [ 4] 4082 	call arg_list 
      009398 93 03            [ 1] 4083 	cp a,#2
      00939A A1 04            [ 1] 4084 	jruge 0$
      00939C 26 0F 72         [ 2] 4085 	jp syntax_error 
      00939F DE 00            [ 1] 4086 0$:	cp a,#3
      0093A1 1A CD            [ 1] 4087 	jrult 1$
      0093A3 89               [ 2] 4088 	popw x 
      0093A4 3A               [ 1] 4089 	ld a,xl
      0093A5 1E 03            [ 1] 4090 	ld (XMASK,sp),a 
      0093A7 1C               [ 2] 4091 1$: popw x ; mask 
      0093A8 00               [ 1] 4092 	ld a,xl 
      0093A9 02 CC            [ 1] 4093 	ld (MASK,sp),a 
      0093AB 93               [ 2] 4094 	popw x ; address 
      0093AC 03               [ 1] 4095 2$:	ld a,(x)
      0093AD A1 31            [ 1] 4096 	and a,(MASK,sp)
      0093AF 2B 1A            [ 1] 4097 	xor a,(XMASK,sp)
      0093B1 A1 35            [ 1] 4098 	jreq 2$ 
      0014ED                       4099 	_drop VSIZE 
      0093B3 22 16            [ 2]    1     addw sp,#VSIZE 
      0093B5 A0               [ 4] 4100 	ret 
                                   4101 
                                   4102 ;---------------------
                                   4103 ; BASIC: BSET addr,mask
                                   4104 ; set bits at 'addr' corresponding 
                                   4105 ; to those of 'mask' that are at 1.
                                   4106 ; arguments:
                                   4107 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4108 ;   mask        mask|addr
                                   4109 ; output:
                                   4110 ;	none 
                                   4111 ;--------------------------
      0014F0                       4112 bit_set:
      0093B6 31 48 90         [ 4] 4113 	call arg_list 
      0093B9 5F 90            [ 1] 4114 	cp a,#2	 
      0093BB 97 72            [ 1] 4115 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0093BD A9 94 3A         [ 2] 4116 	jp syntax_error
      0014FA                       4117 1$: 
      0093C0 90               [ 2] 4118 	popw x ; mask 
      0093C1 FE               [ 1] 4119 	ld a,xl 
      0093C2 93               [ 2] 4120 	popw x ; addr  
      0093C3 CD               [ 1] 4121 	or a,(x)
      0093C4 82               [ 1] 4122 	ld (x),a
      0093C5 57               [ 4] 4123 	ret 
                                   4124 
                                   4125 ;---------------------
                                   4126 ; BASIC: BRES addr,mask
                                   4127 ; reset bits at 'addr' corresponding 
                                   4128 ; to those of 'mask' that are at 1.
                                   4129 ; arguments:
                                   4130 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4131 ;   mask	    ~mask&*addr  
                                   4132 ; output:
                                   4133 ;	none 
                                   4134 ;--------------------------
      001500                       4135 bit_reset:
      0093C6 1E 03 CC         [ 4] 4136 	call arg_list 
      0093C9 93 03            [ 1] 4137 	cp a,#2  
      0093CB A1 10            [ 1] 4138 	jreq 1$ 
      0093CD 26 04 A6         [ 2] 4139 	jp syntax_error
      00150A                       4140 1$: 
      0093D0 2B               [ 2] 4141 	popw x ; mask 
      0093D1 20               [ 1] 4142 	ld a,xl 
      0093D2 46               [ 1] 4143 	cpl a 
      0093D3 A1               [ 2] 4144 	popw x ; addr  
      0093D4 11               [ 1] 4145 	and a,(x)
      0093D5 26               [ 1] 4146 	ld (x),a 
      0093D6 04               [ 4] 4147 	ret 
                                   4148 
                                   4149 ;---------------------
                                   4150 ; BASIC: BTOGL addr,mask
                                   4151 ; toggle bits at 'addr' corresponding 
                                   4152 ; to those of 'mask' that are at 1.
                                   4153 ; arguments:
                                   4154 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4155 ;   mask	    mask^*addr  
                                   4156 ; output:
                                   4157 ;	none 
                                   4158 ;--------------------------
      001511                       4159 bit_toggle:
      0093D7 A6 2D 20         [ 4] 4160 	call arg_list 
      0093DA 3E A1            [ 1] 4161 	cp a,#2 
      0093DC 20 2B            [ 1] 4162 	jreq 1$ 
      0093DE 0E A1 22         [ 2] 4163 	jp syntax_error
      0093E1 22               [ 2] 4164 1$: popw x ; mask 
      0093E2 0A               [ 1] 4165 	ld a,xl 
      0093E3 A0               [ 2] 4166 	popw x ; addr  
      0093E4 20               [ 1] 4167 	xor a,(x)
      0093E5 5F               [ 1] 4168 	ld (x),a 
      0093E6 97               [ 4] 4169 	ret 
                                   4170 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4171 
                                   4172 ;---------------------
                                   4173 ; BASIC: BTEST(addr,bit)
                                   4174 ; return bit value at 'addr' 
                                   4175 ; bit is in range {0..7}.
                                   4176 ; arguments:
                                   4177 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4178 ;   bit 	    bit position {0..7}  
                                   4179 ; output:
                                   4180 ;	none 
                                   4181 ;--------------------------
      001521                       4182 bit_test:
      0093E7 1C 94 37         [ 4] 4183 	call func_args 
      0093EA F6 20            [ 1] 4184 	cp a,#2
      0093EC 2C A1            [ 1] 4185 	jreq 0$
      0093EE 0B 2B 0E         [ 2] 4186 	jp syntax_error
      00152B                       4187 0$:	
      0093F1 A1               [ 2] 4188 	popw x 
      0093F2 0E               [ 1] 4189 	ld a,xl 
      0093F3 22 0A            [ 1] 4190 	and a,#7
      0093F5 A0               [ 1] 4191 	push a   
      0093F6 0B 5F            [ 1] 4192 	ld a,#1 
      0093F8 97 1C            [ 1] 4193 1$: tnz (1,sp)
      0093FA 94 33            [ 1] 4194 	jreq 2$
      0093FC F6               [ 1] 4195 	sll a 
      0093FD 20 1A            [ 1] 4196 	dec (1,sp)
      0093FF A1 03            [ 2] 4197 	jra 1$
      00153B                       4198 2$: _drop 1 
      009401 26 14            [ 2]    1     addw sp,#1 
      009403 A6               [ 2] 4199 	popw x 
      009404 5C               [ 1] 4200 	and a,(x)
      009405 CD 82            [ 1] 4201 	jreq 3$
      009407 44 1E            [ 1] 4202 	ld a,#1 
      009409 03               [ 1] 4203 3$:	clrw x 
      00940A 72               [ 1] 4204 	ld xl,a 
      00940B D6 00            [ 1] 4205 	ld a,#TK_INTGR
      00940D 1A               [ 4] 4206 	ret
                                   4207 
                                   4208 
                                   4209 ;--------------------
                                   4210 ; BASIC: POKE addr,byte
                                   4211 ; put a byte at addr 
                                   4212 ;--------------------
      001548                       4213 poke:
      00940E 5C 1F 03         [ 4] 4214 	call arg_list 
      009411 CD 82            [ 1] 4215 	cp a,#2
      009413 44 CC            [ 1] 4216 	jreq 1$
      009415 93 03 A6         [ 2] 4217 	jp syntax_error
      001552                       4218 1$:	
      009418 3A               [ 2] 4219 	popw x  
      009419 CD               [ 1] 4220     ld a,xl 
      00941A 82               [ 2] 4221 	popw x 
      00941B 44               [ 1] 4222 	ld (x),a 
      00941C 1E               [ 4] 4223 	ret 
                                   4224 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4225 ;-----------------------
                                   4226 ; BASIC: PEEK(addr)
                                   4227 ; get the byte at addr 
                                   4228 ; input:
                                   4229 ;	none 
                                   4230 ; output:
                                   4231 ;	X 		value 
                                   4232 ;-----------------------
      001557                       4233 peek:
      00941D 03 CC 93         [ 4] 4234 	call func_args
      009420 03 01            [ 1] 4235 	cp a,#1
      009421 27 03            [ 1] 4236 	jreq 1$
      009421 A6 0D CD         [ 2] 4237 	jp syntax_error
      009424 82               [ 2] 4238 1$:	popw x 
      009425 44               [ 1] 4239 	ld a,(x)
      009426 7B               [ 1] 4240 	clrw x 
      009427 02               [ 1] 4241 	ld xl,a 
      009428 C7 00            [ 1] 4242 	ld a,#TK_INTGR
      00942A 27               [ 4] 4243 	ret 
                                   4244 
                                   4245 ;----------------------------
                                   4246 ; BASIC: XPEEK(page,addr)
                                   4247 ; read extended memory byte
                                   4248 ; page in range {0,1,2}
                                   4249 ;----------------------------
      001568                       4250 xpeek:
      00942B 7B 01 C7         [ 4] 4251 	call func_args 
      00942E 00 0B            [ 1] 4252 	cp a,#2 
      009430 5B 05            [ 1] 4253 	jreq 1$
      009432 81 28 29         [ 2] 4254 	jp syntax_error
      001572                       4255 1$: 
      009435 2C               [ 2] 4256 	popw x  
      009436 23 2A 2F         [ 2] 4257 	ldw farptr+1,x 
      009439 25               [ 2] 4258 	popw x 
      00943A 94               [ 1] 4259 	ld a,xl 
      00943B 46 94 48         [ 1] 4260 	ld farptr,a 
      00943E 94               [ 1] 4261 	clrw x
      00943F 4A 94 4D 94      [ 5] 4262 	ldf a,[farptr]
      009443 4F               [ 1] 4263 	ld xl,a 
      009444 94 52            [ 1] 4264 	ld a,#TK_INTGR 
      009446 3E               [ 4] 4265 	ret 
                                   4266 
                                   4267 ;---------------------------
                                   4268 ; BASIC IF expr : instructions
                                   4269 ; evaluate expr and if true 
                                   4270 ; execute instructions on same line. 
                                   4271 ;----------------------------
      001584                       4272 if: 
      009447 00 3D 00         [ 4] 4273 	call relation 
      00944A 3E 3D            [ 1] 4274 	cp a,#TK_INTGR
      00944C 00 3C            [ 1] 4275 	jreq 1$ 
      00944E 00 3C 3D         [ 2] 4276 	jp syntax_error
      009451 00               [ 1] 4277 1$:	clr a 
      009452 3C               [ 2] 4278 	tnzw x 
      009453 3E 00            [ 1] 4279 	jrne 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4280 ;skip to next line
      009455 55 00 03 00 01   [ 1] 4281 	mov in,count
      009455 4B               [ 4] 4282 9$:	ret 
                                   4283 
                                   4284 ;------------------------
                                   4285 ; BASIC: FOR var=expr 
                                   4286 ; set variable to expression 
                                   4287 ; leave variable address 
                                   4288 ; on stack and set
                                   4289 ; FLOOP bit in 'flags'
                                   4290 ;-----------------
                           000001  4291 	RETL1=1 ; return address  
                           000003  4292 	FSTEP=3  ; variable increment
                           000005  4293 	LIMIT=5 ; loop limit 
                           000007  4294 	CVAR=7   ; control variable 
                           000009  4295 	INW=9   ;  in.w saved
                           00000B  4296 	BPTR=11 ; baseptr saved
                           00000A  4297 	VSIZE=10  
      001598                       4298 for: ; { -- var_addr }
      009456 00               [ 2] 4299 	popw x ; call return address 
      009457                       4300 	_vars VSIZE 
      009457 0F 01            [ 2]    1     sub sp,#VSIZE 
      009459 89               [ 2] 4301 	pushw x  ; RETL1 
      009459 CD 88            [ 1] 4302 	ld a,#TK_VAR 
      00945B A1 A1 02         [ 4] 4303 	call expect
      00945E 2B 55            [ 2] 4304 	ldw (CVAR,sp),x  ; control variable 
      009460 A1 02 27         [ 4] 4305 	call let02 
      009463 12 A1 03 27      [ 1] 4306 	bset flags,#FLOOP 
                                   4307 ; open space on stack for loop data 
      009467 13               [ 1] 4308 	clrw x 
      009468 A1 08            [ 2] 4309 	ldw (BPTR,sp),x 
      00946A 27 15            [ 2] 4310 	ldw (INW,sp),x 
      00946C A1 0D 27         [ 4] 4311 	call next_token 
      00946F 18 A1            [ 1] 4312 	cp a,#TK_CMD 
      009471 0E 27            [ 1] 4313 	jreq 1$
      009473 1B 20 2B         [ 2] 4314 	jp syntax_error
      009476                       4315 1$:  
      009476 CD 82 57         [ 2] 4316 	cpw x,#to 
      009479 20 DC            [ 1] 4317 	jreq to
      00947B CC 07 62         [ 2] 4318 	jp syntax_error 
                                   4319 
                                   4320 ;-----------------------------------
                                   4321 ; BASIC: TO expr 
                                   4322 ; second part of FOR loop initilization
                                   4323 ; leave limit on stack and set 
                                   4324 ; FTO bit in 'flags'
                                   4325 ;-----------------------------------
      0015C1                       4326 to: ; { var_addr -- var_addr limit step }
      00947B 9F CD 82 44 20   [ 2] 4327 	btjt flags,#FLOOP,1$
      009480 D6 07 62         [ 2] 4328 	jp syntax_error
      009481 CD 10 3B         [ 4] 4329 1$: call relation  
      009481 FD 9F            [ 1] 4330 	cp a,#TK_INTGR 
      009483 CD 82            [ 1] 4331 	jreq 2$ 
      009485 44 20 CF         [ 2] 4332 	jp syntax_error
      009488 1F 05            [ 2] 4333 2$: ldw (LIMIT,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4334 ;	ldw x,in.w 
      009488 A6 FF 6B         [ 4] 4335 	call next_token
      00948B 01 CC            [ 1] 4336 	cp a,#TK_NONE  
      00948D 94 59            [ 1] 4337 	jreq 4$ 
      00948F A1 06            [ 1] 4338 	cp a,#TK_CMD
      00948F CD 88            [ 1] 4339 	jrne 3$
      009491 A1 A1 04         [ 2] 4340 	cpw x,#step 
      009494 27 03            [ 1] 4341 	jreq step
      0015E5                       4342 3$:	
      0015E5                       4343 	_unget_token   	 
      009496 CC 87 E2 00 01   [ 1]    1     mov in,in.saved
      009499                       4344 4$:	
      009499 9F A4 0F         [ 2] 4345 	ldw x,#1   ; default step  
      00949C C7 00            [ 2] 4346 	ldw (FSTEP,sp),x 
      00949E 27 20            [ 2] 4347 	jra store_loop_addr 
                                   4348 
                                   4349 
                                   4350 ;----------------------------------
                                   4351 ; BASIC: STEP expr 
                                   4352 ; optional third par of FOR loop
                                   4353 ; initialization. 	
                                   4354 ;------------------------------------
      0015F1                       4355 step: ; {var limit -- var limit step}
      0094A0 B6 04 00 25 03   [ 2] 4356 	btjt flags,#FLOOP,1$
      0094A1 CC 07 62         [ 2] 4357 	jp syntax_error
      0094A1 55 00 03         [ 4] 4358 1$: call relation
      0094A4 00 02            [ 1] 4359 	cp a,#TK_INTGR
      0094A6 CD 90            [ 1] 4360 	jreq 2$
      0094A8 BB A1 04         [ 2] 4361 	jp syntax_error
      0094AB 27 03            [ 2] 4362 2$:	ldw (FSTEP,sp),x ; step
                                   4363 ; leave loop back entry point on cstack 
                                   4364 ; cstack is 1 call deep from interpreter
      001605                       4365 store_loop_addr:
      0094AD CC 94 B5         [ 2] 4366 	ldw x,basicptr  
      0094B0 CD 89            [ 2] 4367 	ldw (BPTR,sp),x 
      0094B2 3A 20 A2         [ 2] 4368 	ldw x,in.w 
      0094B5 1F 09            [ 2] 4369 	ldw (INW,sp),x   
      0094B5 0D 01 26 05      [ 1] 4370 	bres flags,#FLOOP 
      0094B9 A6 0D CD 82      [ 1] 4371 	inc loop_depth  
      0094BD 44               [ 4] 4372 	ret 
                                   4373 
                                   4374 ;--------------------------------
                                   4375 ; BASIC: NEXT var 
                                   4376 ; FOR loop control 
                                   4377 ; increment variable with step 
                                   4378 ; and compare with limit 
                                   4379 ; loop if threshold not crossed.
                                   4380 ; else stack. 
                                   4381 ; and decrement 'loop_depth' 
                                   4382 ;--------------------------------
      001618                       4383 next: ; {var limit step retl1 -- [var limit step ] }
      0094BE 5B 01 81 22      [ 1] 4384 	tnz loop_depth 
      0094C1 26 03            [ 1] 4385 	jrne 1$ 
      0094C1 CC 07 62         [ 2] 4386 	jp syntax_error 
      001621                       4387 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0094C1 CE 00            [ 1] 4388 	ld a,#TK_VAR 
      0094C3 05 1F 03         [ 4] 4389 	call expect
                                   4390 ; check for good variable after NEXT 	 
      0094C6 C6 00            [ 2] 4391 	cpw x,(CVAR,sp)
      0094C8 02 6B            [ 1] 4392 	jreq 2$  
      0094CA 05 C6 00         [ 2] 4393 	jp syntax_error ; not the good one 
      00162D                       4394 2$: ; increment variable 
      0094CD 04               [ 2] 4395 	ldw x,(x)  ; get var value 
      0094CE 6B 06 81         [ 2] 4396 	addw x,(FSTEP,sp) ; var+step 
      0094D1 16 07            [ 2] 4397 	ldw y,(CVAR,sp)
      0094D1 1E 03            [ 2] 4398 	ldw (y),x ; save var new value 
                                   4399 ; check sign of STEP  
      0094D3 CF 00            [ 1] 4400 	ld a,#0x80
      0094D5 05 7B            [ 1] 4401 	bcp a,(FSTEP,sp)
      0094D7 05 C7            [ 1] 4402 	jrpl 4$
                                   4403 ;negative step 
      0094D9 00 02            [ 2] 4404 	cpw x,(LIMIT,sp)
      0094DB 7B 06            [ 1] 4405 	jrslt loop_done
      0094DD C7 00            [ 2] 4406 	jra loop_back 
      001641                       4407 4$: ; positive step
      0094DF 04 81            [ 2] 4408 	cpw x,(LIMIT,sp)
      0094E1 2C 15            [ 1] 4409 	jrsgt loop_done
      001645                       4410 loop_back:
      0094E1 52 07            [ 2] 4411 	ldw x,(BPTR,sp)
      0094E3 CF 00 04         [ 2] 4412 	ldw basicptr,x 
      0094E3 0F 05 CD 88 A1   [ 2] 4413 	btjf flags,#FRUN,1$ 
      0094E8 A1 02            [ 1] 4414 	ld a,(2,x)
      0094EA 26 08 CD         [ 1] 4415 	ld count,a
      0094ED 92 9E            [ 2] 4416 1$:	ldw x,(INW,sp)
      0094EF 03 05 CD         [ 2] 4417 	ldw in.w,x 
      0094F2 88               [ 4] 4418 	ret 
      00165A                       4419 loop_done:
                                   4420 	; remove loop data from stack  
      0094F3 A1               [ 2] 4421 	popw x
      00165B                       4422 	_drop VSIZE 
      0094F4 A1 05            [ 2]    1     addw sp,#VSIZE 
      0094F6 27 03 CC 87      [ 1] 4423 	dec loop_depth 
                                   4424 ;	pushw x 
                                   4425 ;	ret 
      0094FA E2               [ 2] 4426 	jp (x)
                                   4427 
                                   4428 ;----------------------------
                                   4429 ; called by goto/gosub
                                   4430 ; to get target line number 
                                   4431 ;---------------------------
      001662                       4432 get_target_line:
      0094FB 1F 06 0D         [ 4] 4433 	call relation 
      0094FE 05 26            [ 1] 4434 	cp a,#TK_INTGR
      009500 06 AE            [ 1] 4435 	jreq 1$
      009502 17 38 CD         [ 2] 4436 	jp syntax_error
      009505 82 57 79         [ 4] 4437 1$:	call search_lineno  
      009507 5D               [ 2] 4438 	tnzw x 
      009507 A6 3A            [ 1] 4439 	jrne 2$ 
      009509 CD 82            [ 1] 4440 	ld a,#ERR_NO_LINE 
      00950B 44 CD 94         [ 2] 4441 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00950E C1               [ 4] 4442 2$:	ret 
                                   4443 
                                   4444 ;------------------------
                                   4445 ; BASIC: GOTO line# 
                                   4446 ; jump to line# 
                                   4447 ; here cstack is 2 call deep from interpreter 
                                   4448 ;------------------------
      001678                       4449 goto:
      00950F 72 5F 00 04 CD   [ 2] 4450 	btjt flags,#FRUN,0$ 
      009514 8A 64            [ 1] 4451 	ld a,#ERR_RUN_ONLY
      009516 AE 16 E8         [ 2] 4452 	jp tb_error 
      009519 CF               [ 4] 4453 	ret 
      00951A 00 05 72         [ 4] 4454 0$:	call get_target_line
      001686                       4455 jp_to_target:
      00951D 5F 00 02         [ 2] 4456 	ldw basicptr,x 
      009520 CD 8B            [ 1] 4457 	ld a,(2,x)
      009522 E3 A1 04         [ 1] 4458 	ld count,a 
      009525 27 06 CD 94      [ 1] 4459 	mov in,#3 
      009529 D1               [ 4] 4460 	ret 
                                   4461 
                                   4462 
                                   4463 ;--------------------
                                   4464 ; BASIC: GOSUB line#
                                   4465 ; basic subroutine call
                                   4466 ; actual line# and basicptr 
                                   4467 ; are saved on cstack
                                   4468 ; here cstack is 2 call deep from interpreter 
                                   4469 ;--------------------
                           000003  4470 	RET_ADDR=3
                           000005  4471 	RET_INW=5
                           000004  4472 	VSIZE=4  
      001693                       4473 gosub:
      00952A CC 87 E2 90 85   [ 2] 4474 	btjt flags,#FRUN,0$ 
      00952F 90 FF            [ 1] 4475 	ld a,#ERR_RUN_ONLY
      009531 CD 94 D1         [ 2] 4476 	jp tb_error 
      009534 CD               [ 4] 4477 	ret 
      009535 88               [ 2] 4478 0$:	popw x 
      00169F                       4479 	_vars VSIZE  
      009536 A1 A1            [ 2]    1     sub sp,#VSIZE 
      009538 0D               [ 2] 4480 	pushw x 
      009539 27 A8 A1         [ 2] 4481 	ldw x,basicptr
      00953C 01 23            [ 2] 4482 	ldw (RET_ADDR,sp),x 
      00953E 03 CC 87         [ 4] 4483 	call get_target_line  
      009541 E2               [ 2] 4484 	pushw x 
      009542 CE 00 00         [ 2] 4485 	ldw x,in.w 
      009542 5B 07            [ 2] 4486 	ldw (RET_INW+2,sp),x
      009544 81               [ 2] 4487 	popw x 
      009545 20 D3            [ 2] 4488 	jra jp_to_target
                                   4489 
                                   4490 ;------------------------
                                   4491 ; BASIC: RETURN 
                                   4492 ; exit from a subroutine 
                                   4493 ; 
                                   4494 ;------------------------
      0016B3                       4495 return:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009545 55 00 04 00 02   [ 2] 4496 	btjt flags,#FRUN,0$ 
      00954A 81 06            [ 1] 4497 	ld a,#ERR_RUN_ONLY
      00954B CC 07 64         [ 2] 4498 	jp tb_error 
      0016BD                       4499 0$:	
      00954B 52 04            [ 2] 4500 	ldw x,(RET_ADDR,sp) 
      00954D 0F 01 CD         [ 2] 4501 	ldw basicptr,x
      009550 8F 6B            [ 1] 4502 	ld a,(2,x)
      009552 A1 02 24         [ 1] 4503 	ld count,a  
      009555 03 CC            [ 2] 4504 	ldw x,(RET_INW,sp)
      009557 87 E2 A1         [ 2] 4505 	ldw in.w,x 
      00955A 03               [ 2] 4506 	popw x 
      0016CD                       4507 	_drop VSIZE 
      00955B 25 04            [ 2]    1     addw sp,#VSIZE 
      00955D 85               [ 2] 4508 	pushw x
      00955E 9F               [ 4] 4509 	ret  
                                   4510 
                                   4511 
                                   4512 ;----------------------------------
                                   4513 ; BASIC: RUN
                                   4514 ; run BASIC program in RAM
                                   4515 ;----------------------------------- 
      0016D1                       4516 run: 
      00955F 6B 01 85 9F 6B   [ 2] 4517 	btjf flags,#FRUN,0$  
      009564 02               [ 1] 4518 	clr a 
      009565 85               [ 4] 4519 	ret
      0016D8                       4520 0$: 
      009566 F6 14 02 18 01   [ 2] 4521 	btjf flags,#FBREAK,1$
      0016DD                       4522 	_drop 2 
      00956B 27 F9            [ 2]    1     addw sp,#2 
      00956D 5B 04 81         [ 4] 4523 	call rest_context
      009570                       4524 	_drop CTXT_SIZE 
      009570 CD 8F            [ 2]    1     addw sp,#CTXT_SIZE 
      009572 6B A1 02 27      [ 1] 4525 	bres flags,#FBREAK 
      009576 03 CC 87 E2      [ 1] 4526 	bset flags,#FRUN 
      00957A CC 07 CA         [ 2] 4527 	jp interpreter 
      00957A 85 9F 85         [ 2] 4528 1$:	ldw x,txtbgn
      00957D FA F7 81         [ 2] 4529 	cpw x,txtend 
      009580 2B 05            [ 1] 4530 	jrmi run_it 
      009580 CD 8F            [ 1] 4531 	ld a,#ERR_NO_PROG
      009582 6B A1 02         [ 2] 4532 	jp tb_error
                                   4533 
      0016FC                       4534 run_it:	 
      009585 27 03 CC         [ 4] 4535     call ubound 
      0016FF                       4536 	_drop 2 ; drop return address 
      009588 87 E2            [ 2]    1     addw sp,#2 
                                   4537 ; clear data pointer 
      00958A 5F               [ 1] 4538 	clrw x 
      00958A 85 9F 43         [ 2] 4539 	ldw data_ptr,x 
      00958D 85 F4 F7 81      [ 1] 4540 	clr data_ofs 
      009591 72 5F 00 09      [ 1] 4541 	clr data_len 
                                   4542 ; initialize BASIC pointer 
      009591 CD 8F 6B         [ 2] 4543 	ldw x,txtbgn 
      009594 A1 02 27         [ 2] 4544 	ldw basicptr,x 
      009597 03 CC            [ 1] 4545 	ld a,(2,x)
      009599 87 E2 85         [ 1] 4546 	ld count,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00959C 9F 85 F8 F7      [ 1] 4547 	mov in,#3	
      0095A0 81 10 00 25      [ 1] 4548 	bset flags,#FRUN 
      0095A1 CC 07 CA         [ 2] 4549 	jp interpreter 
                                   4550 
                                   4551 
                                   4552 ;----------------------
                                   4553 ; BASIC: END
                                   4554 ; end running program
                                   4555 ;---------------------- 
      001723                       4556 cmd_end: 
                                   4557 ; clean stack 
      0095A1 CD 8F 92         [ 2] 4558 	jp warm_start
                                   4559 
                                   4560 
                                   4561 ;-----------------------
                                   4562 ; BASIC: TONE expr1,expr2
                                   4563 ; used TIMER2 channel 1
                                   4564 ; to produce a tone 
                                   4565 ; arguments:
                                   4566 ;    expr1   frequency 
                                   4567 ;    expr2   duration msec.
                                   4568 ;---------------------------
      001726                       4569 tone:
      0095A4 A1 02 27         [ 4] 4570 	call arg_list 
      0095A7 03 CC            [ 1] 4571 	cp a,#2 
      0095A9 87 E2            [ 1] 4572 	jreq 1$
      0095AB CC 07 62         [ 2] 4573 	jp syntax_error 
      001730                       4574 1$: 
      0095AB 85               [ 2] 4575 	popw x ; duration
      0095AC 9F A4            [ 2] 4576 	popw y ; frequency 
      001733                       4577 beep:  
      0095AE 07               [ 2] 4578 	pushw x 
      0095AF 88 A6 01         [ 2] 4579 	ldw x,#TIM2_CLK_FREQ
      0095B2 0D               [ 2] 4580 	divw x,y 
                                   4581 ; round to nearest integer 
      0095B3 01 27 05 48      [ 2] 4582 	cpw y,#TIM2_CLK_FREQ/2
      0095B7 0A 01            [ 1] 4583 	jrmi 2$
      0095B9 20               [ 2] 4584 	incw x 
      00173F                       4585 2$:	 
      0095BA F7               [ 1] 4586 	ld a,xh 
      0095BB 5B 01 85         [ 1] 4587 	ld TIM2_ARRH,a 
      0095BE F4               [ 1] 4588 	ld a,xl 
      0095BF 27 02 A6         [ 1] 4589 	ld TIM2_ARRL,a 
                                   4590 ; 50% duty cycle 
      0095C2 01               [ 1] 4591 	ccf 
      0095C3 5F               [ 2] 4592 	rrcw x 
      0095C4 97               [ 1] 4593 	ld a,xh 
      0095C5 A6 04 81         [ 1] 4594 	ld TIM2_CCR1H,a 
      0095C8 9F               [ 1] 4595 	ld a,xl
      0095C8 CD 8F 6B         [ 1] 4596 	ld TIM2_CCR1L,a
      0095CB A1 02 27 03      [ 1] 4597 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0095CF CC 87 E2 00      [ 1] 4598 	bset TIM2_CR1,#TIM2_CR1_CEN
      0095D2 72 10 53 04      [ 1] 4599 	bset TIM2_EGR,#TIM2_EGR_UG
      0095D2 85               [ 2] 4600 	popw x 
      0095D3 9F 85 F7         [ 2] 4601 	ldw timer,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0095D6 81 00 12         [ 2] 4602 3$: ldw x,timer 	
      0095D7 26 FB            [ 1] 4603 	jrne 3$ 
      0095D7 CD 8F 92 A1      [ 1] 4604 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0095DB 01 27 03 CC      [ 1] 4605 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0095DF 87               [ 4] 4606 	ret 
                                   4607 
                                   4608 ;-------------------------------
                                   4609 ; BASIC: ADCON 0|1 [,divisor]  
                                   4610 ; disable/enanble ADC 
                                   4611 ;-------------------------------
                           000003  4612 	ONOFF=3 
                           000001  4613 	DIVSOR=1
                           000004  4614 	VSIZE=4 
      00176F                       4615 power_adc:
      0095E0 E2 85 F6         [ 4] 4616 	call arg_list 
      0095E3 5F 97            [ 1] 4617 	cp a,#2	
      0095E5 A6 04            [ 1] 4618 	jreq 1$
      0095E7 81 01            [ 1] 4619 	cp a,#1 
      0095E8 27 03            [ 1] 4620 	jreq 0$ 
      0095E8 CD 8F 92         [ 2] 4621 	jp syntax_error 
      0095EB A1 02 27         [ 2] 4622 0$: ldw x,#0
      0095EE 03               [ 2] 4623 	pushw x  ; divisor 
      0095EF CC 87            [ 2] 4624 1$: ldw x,(ONOFF,sp)
      0095F1 E2               [ 2] 4625 	tnzw x 
      0095F2 27 1A            [ 1] 4626 	jreq 2$ 
      0095F2 85 CF            [ 2] 4627 	ldw x,(DIVSOR,sp) ; divisor 
      0095F4 00               [ 1] 4628 	ld a,xl
      0095F5 1A 85            [ 1] 4629 	and a,#7
      0095F7 9F               [ 1] 4630 	swap a 
      0095F8 C7 00 19         [ 1] 4631 	ld ADC_CR1,a
      0095FB 5F 92 BC 00      [ 1] 4632 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0095FF 19 97 A6 04      [ 1] 4633 	bset ADC_CR1,#ADC_CR1_ADON 
      001797                       4634 	_usec_dly 7 
      009603 81 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009604 5A               [ 2]    2     decw x
      009604 CD               [ 1]    3     nop 
      009605 90 BB            [ 1]    4     jrne .-4
      009607 A1 04            [ 2] 4635 	jra 3$
      009609 27 03 CC 87      [ 1] 4636 2$: bres ADC_CR1,#ADC_CR1_ADON
      00960D E2 4F 5D 26      [ 1] 4637 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0017A8                       4638 3$:	_drop VSIZE 
      009611 05 55            [ 2]    1     addw sp,#VSIZE 
      009613 00               [ 4] 4639 	ret
                                   4640 
                                   4641 ;-----------------------------
                                   4642 ; BASIC: ADCREAD (channel)
                                   4643 ; read adc channel {0..5}
                                   4644 ; output:
                                   4645 ;   A 		TK_INTGR 
                                   4646 ;   X 		value 
                                   4647 ;-----------------------------
      0017AB                       4648 analog_read:
      009614 04 00 02         [ 4] 4649 	call func_args 
      009617 81 01            [ 1] 4650 	cp a,#1 
      009618 27 03            [ 1] 4651 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009618 85 52 0A         [ 2] 4652 	jp syntax_error
      00961B 89               [ 2] 4653 1$: popw x 
      00961C A6 05 CD         [ 2] 4654 	cpw x,#5 
      00961F 8F 5E            [ 2] 4655 	jrule 2$
      009621 1F 07            [ 1] 4656 	ld a,#ERR_BAD_VALUE
      009623 CD 91 F4         [ 2] 4657 	jp tb_error 
      009626 72               [ 1] 4658 2$: ld a,xl
      009627 14 00 26         [ 1] 4659 	ld acc8,a 
      00962A 5F 1F            [ 1] 4660 	ld a,#5
      00962C 0B 1F 09         [ 1] 4661 	sub a,acc8 
      00962F CD 88 A1         [ 1] 4662 	ld ADC_CSR,a
      009632 A1 06 27 03      [ 1] 4663 	bset ADC_CR2,#ADC_CR2_ALIGN
      009636 CC 87 E2 01      [ 1] 4664 	bset ADC_CR1,#ADC_CR1_ADON
      009639 72 0F 54 00 FB   [ 2] 4665 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009639 A3 96 41         [ 2] 4666 	ldw x,ADC_DRH
      00963C 27 03            [ 1] 4667 	ld a,#TK_INTGR
      00963E CC               [ 4] 4668 	ret 
                                   4669 
                                   4670 ;-----------------------
                                   4671 ; BASIC: DREAD(pin)
                                   4672 ; Arduino pins 
                                   4673 ; read state of a digital pin 
                                   4674 ; pin# {0..15}
                                   4675 ; output:
                                   4676 ;    A 		TK_INTGR
                                   4677 ;    X      0|1 
                                   4678 ;-------------------------
                           000001  4679 	PINNO=1
                           000001  4680 	VSIZE=1
      0017DF                       4681 digital_read:
      0017DF                       4682 	_vars VSIZE 
      00963F 87 E2            [ 2]    1     sub sp,#VSIZE 
      009641 CD 0F 12         [ 4] 4683 	call func_args
      009641 72 04            [ 1] 4684 	cp a,#1
      009643 00 26            [ 1] 4685 	jreq 1$
      009645 03 CC 87         [ 2] 4686 	jp syntax_error
      009648 E2               [ 2] 4687 1$: popw x 
      009649 CD 90 BB         [ 2] 4688 	cpw x,#15 
      00964C A1 04            [ 2] 4689 	jrule 2$
      00964E 27 03            [ 1] 4690 	ld a,#ERR_BAD_VALUE
      009650 CC 87 E2         [ 2] 4691 	jp tb_error 
      009653 1F 05 CD         [ 4] 4692 2$:	call select_pin 
      009656 88 A1            [ 1] 4693 	ld (PINNO,sp),a
      009658 A1 00            [ 1] 4694 	ld a,(GPIO_IDR,x)
      00965A 27 0E            [ 1] 4695 	tnz (PINNO,sp)
      00965C A1 06            [ 1] 4696 	jreq 8$
      00965E 26               [ 1] 4697 3$: srl a 
      00965F 05 A3            [ 1] 4698 	dec (PINNO,sp)
      009661 96 71            [ 1] 4699 	jrne 3$ 
      009663 27 0C            [ 1] 4700 8$: and a,#1 
      009665 5F               [ 1] 4701 	clrw x 
      009665 55               [ 1] 4702 	ld xl,a 
      009666 00 03            [ 1] 4703 	ld a,#TK_INTGR
      00180C                       4704 	_drop VSIZE
      009668 00 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00966A 81               [ 4] 4705 	ret
                                   4706 
                                   4707 ;-----------------------
                                   4708 ; BASIC: DWRITE pin,0|1
                                   4709 ; Arduino pins 
                                   4710 ; write to a digital pin 
                                   4711 ; pin# {0..15}
                                   4712 ; output:
                                   4713 ;    A 		TK_INTGR
                                   4714 ;    X      0|1 
                                   4715 ;-------------------------
                           000001  4716 	PINNO=1
                           000002  4717 	PINVAL=2
                           000002  4718 	VSIZE=2
      00180F                       4719 digital_write:
      00180F                       4720 	_vars VSIZE 
      00966A AE 00            [ 2]    1     sub sp,#VSIZE 
      00966C 01 1F 03         [ 4] 4721 	call arg_list  
      00966F 20 14            [ 1] 4722 	cp a,#2 
      009671 27 03            [ 1] 4723 	jreq 1$
      009671 72 04 00         [ 2] 4724 	jp syntax_error
      009674 26               [ 2] 4725 1$: popw x 
      009675 03               [ 1] 4726 	ld a,xl 
      009676 CC 87            [ 1] 4727 	ld (PINVAL,sp),a
      009678 E2               [ 2] 4728 	popw x 
      009679 CD 90 BB         [ 2] 4729 	cpw x,#15 
      00967C A1 04            [ 2] 4730 	jrule 2$
      00967E 27 03            [ 1] 4731 	ld a,#ERR_BAD_VALUE
      009680 CC 87 E2         [ 2] 4732 	jp tb_error 
      009683 1F 03 C9         [ 4] 4733 2$:	call select_pin 
      009685 6B 01            [ 1] 4734 	ld (PINNO,sp),a 
      009685 CE 00            [ 1] 4735 	ld a,#1
      009687 05 1F            [ 1] 4736 	tnz (PINNO,sp)
      009689 0B CE            [ 1] 4737 	jreq 4$
      00968B 00               [ 1] 4738 3$: sll a
      00968C 01 1F            [ 1] 4739 	dec (PINNO,sp)
      00968E 09 72            [ 1] 4740 	jrne 3$
      009690 15 00            [ 1] 4741 4$: tnz (PINVAL,sp)
      009692 26 72            [ 1] 4742 	jrne 5$
      009694 5C               [ 1] 4743 	cpl a 
      009695 00 23            [ 1] 4744 	and a,(GPIO_ODR,x)
      009697 81 02            [ 2] 4745 	jra 8$
      009698 EA 00            [ 1] 4746 5$: or a,(GPIO_ODR,x)
      009698 72 5D            [ 1] 4747 8$: ld (GPIO_ODR,x),a 
      001847                       4748 	_drop VSIZE 
      00969A 00 23            [ 2]    1     addw sp,#VSIZE 
      00969C 26               [ 4] 4749 	ret
                                   4750 
                                   4751 
                                   4752 ;-----------------------
                                   4753 ; BASIC: STOP
                                   4754 ; stop progam execution  
                                   4755 ; without resetting pointers 
                                   4756 ; the program is resumed
                                   4757 ; with RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4758 ;-------------------------
      00184A                       4759 stop:
      00969D 03 CC 87 E2 02   [ 2] 4760 	btjt flags,#FRUN,2$
      0096A1 4F               [ 1] 4761 	clr a
      0096A1 A6               [ 4] 4762 	ret 
      001851                       4763 2$:	 
                                   4764 ; create space on cstack to save context 
      0096A2 05 CD 8F         [ 2] 4765 	ldw x,#break_point 
      0096A5 5E 13 07         [ 4] 4766 	call puts 
      001857                       4767 	_drop 2 ;drop return address 
      0096A8 27 03            [ 2]    1     addw sp,#2 
      001859                       4768 	_vars CTXT_SIZE ; context size 
      0096AA CC 87            [ 2]    1     sub sp,#CTXT_SIZE 
      0096AC E2 14 41         [ 4] 4769 	call save_context 
      0096AD AE 16 E8         [ 2] 4770 	ldw x,#tib 
      0096AD FE 72 FB         [ 2] 4771 	ldw basicptr,x
      0096B0 03               [ 1] 4772 	clr (x)
      0096B1 16 07 90 FF      [ 1] 4773 	clr count  
      0096B5 A6               [ 1] 4774 	clrw x 
      0096B6 80 15 03         [ 2] 4775 	ldw in.w,x
      0096B9 2A 06 13 05      [ 1] 4776 	bres flags,#FRUN 
      0096BD 2F 1B 20 04      [ 1] 4777 	bset flags,#FBREAK
      0096C1 CC 07 CA         [ 2] 4778 	jp interpreter 
      0096C1 13 05 2C 15 61 6B 20  4779 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4780 
                                   4781 ;-----------------------
                                   4782 ; BASIC: NEW
                                   4783 ; from command line only 
                                   4784 ; free program memory
                                   4785 ; and clear variables 
                                   4786 ;------------------------
      0096C5                       4787 new: 
      0096C5 1E 0B CF 00 05   [ 2] 4788 	btjf flags,#FRUN,0$ 
      0096CA 72               [ 1] 4789 	clr a 
      0096CB 01               [ 4] 4790 	ret 
      00189D                       4791 0$:	
      0096CC 00 26 05         [ 4] 4792 	call clear_basic 
      0096CF E6               [ 4] 4793 	ret 
                                   4794 	 
                                   4795 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4796 ;  file system routines
                                   4797 ;  MCU flash memory from
                                   4798 ;  0x10000-0x27fff is 
                                   4799 ;  used to store BASIC 
                                   4800 ;  program files. 
                                   4801 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4802 
                                   4803 ;--------------------
                                   4804 ; input:
                                   4805 ;   X     increment 
                                   4806 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4807 ;   farptr  incremented 
                                   4808 ;---------------------
      0018A1                       4809 incr_farptr:
      0096D0 02 C7 00 04      [ 2] 4810 	addw x,farptr+1 
      0096D4 1E 09            [ 1] 4811 	jrnc 1$
      0096D6 CF 00 01 81      [ 1] 4812 	inc farptr 
      0096DA CF 00 19         [ 2] 4813 1$:	ldw farptr+1,x  
      0096DA 85               [ 4] 4814 	ret 
                                   4815 
                                   4816 ;------------------------------
                                   4817 ; extended flash memory used as FLASH_DRIVE 
                                   4818 ; seek end of used flash drive   
                                   4819 ; starting at 0x10000 address.
                                   4820 ; 4 consecutives 0 bytes signal free space. 
                                   4821 ; input:
                                   4822 ;	none
                                   4823 ; output:
                                   4824 ;   ffree     free_addr| 0 if memory full.
                                   4825 ;------------------------------
      0018AF                       4826 seek_fdrive:
                                   4827 ; start scan at 0x10000 address 
      0096DB 5B 0A            [ 1] 4828 	ld a,#1
      0096DD 72 5A 00         [ 1] 4829 	ld farptr,a 
      0096E0 23               [ 1] 4830 	clrw x 
      0096E1 FC 00 19         [ 2] 4831 	ldw farptr+1,x 
      0096E2                       4832 1$:
      0096E2 CD 90 BB         [ 2] 4833 	ldw x,#3  
      0096E5 A1 04 27 03      [ 5] 4834 2$:	ldf a,([farptr],x) 
      0096E9 CC 87            [ 1] 4835 	jrne 3$
      0096EB E2               [ 2] 4836 	decw x
      0096EC CD 82            [ 1] 4837 	jrpl 2$
      0096EE F9 5D            [ 2] 4838 	jra 4$ 
      0096F0 26               [ 2] 4839 3$:	incw x 
      0096F1 05 A6 05         [ 4] 4840 	call incr_farptr
      0096F4 CC 87 E4         [ 2] 4841 	ldw x,#0x27f 
      0096F7 81 00 18         [ 2] 4842 	cpw x,farptr
      0096F8 2A E6            [ 1] 4843 	jrpl 1$
                                   4844 ; drive full 
      0096F8 72 00 00 26      [ 1] 4845 	clr ffree 
      0096FC 06 A6 06 CC      [ 1] 4846 	clr ffree+1 
      009700 87 E4 81 CD      [ 1] 4847 	clr ffree+2 
      009704 96               [ 4] 4848 	ret
      0018DF                       4849 4$: ; copy farptr to ffree	 
      009705 E2 00 18         [ 2] 4850 	ldw x,farptr 
      009706 C6 00 1A         [ 1] 4851 	ld a,farptr+2 
      009706 CF 00 05         [ 2] 4852 	ldw ffree,x 
      009709 E6 02 C7         [ 1] 4853 	ld ffree+2,a  
      00970C 00               [ 4] 4854 	ret 
                                   4855 
                                   4856 ;-----------------------
                                   4857 ; compare file name 
                                   4858 ; with name pointed by Y  
                                   4859 ; input:
                                   4860 ;   farptr   file name 
                                   4861 ;   Y        target name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4862 ; output:
                                   4863 ;   farptr 	 at file_name
                                   4864 ;   X 		 farptr[x] point at size field  
                                   4865 ;   Carry    0|1 no match|match  
                                   4866 ;----------------------
      0018EC                       4867 cmp_name:
      00970D 04               [ 1] 4868 	clrw x
      00970E 35 03 00 02      [ 5] 4869 1$:	ldf a,([farptr],x)
      009712 81 F1            [ 1] 4870 	cp a,(y)
      009713 26 08            [ 1] 4871 	jrne 4$
      009713 72               [ 1] 4872 	tnz a 
      009714 00 00            [ 1] 4873 	jreq 9$ 
      009716 26               [ 2] 4874     incw x 
      009717 06 A6            [ 2] 4875 	incw y 
      009719 06 CC            [ 2] 4876 	jra 1$
      0018FD                       4877 4$: ;no match 
      00971B 87               [ 1] 4878 	tnz a 
      00971C E4 81            [ 1] 4879 	jreq 5$
      00971E 85               [ 2] 4880 	incw x 
      00971F 52 04 89 CE      [ 5] 4881 	ldf a,([farptr],x)
      009723 00 05            [ 2] 4882 	jra 4$  
      009725 1F               [ 2] 4883 5$:	incw x ; farptr[x] point at 'size' field 
      009726 03               [ 1] 4884 	rcf 
      009727 CD               [ 4] 4885 	ret
      00190A                       4886 9$: ; match  
      009728 96               [ 2] 4887 	incw x  ; farptr[x] at 'size' field 
      009729 E2               [ 1] 4888 	scf 
      00972A 89               [ 4] 4889 	ret 
                                   4890 
                                   4891 ;-----------------------
                                   4892 ; search file in 
                                   4893 ; flash memory 
                                   4894 ; input:
                                   4895 ;   Y       file name  
                                   4896 ; output:
                                   4897 ;   farptr  addr at name|0
                                   4898 ;-----------------------
                           000001  4899 	FSIZE=1
                           000003  4900 	YSAVE=3
                           000004  4901 	VSIZE=4 
      00190D                       4902 search_file: 
      00190D                       4903 	_vars VSIZE
      00972B CE 00            [ 2]    1     sub sp,#VSIZE 
      00972D 01 1F            [ 2] 4904 	ldw (YSAVE,sp),y  
      00972F 07               [ 1] 4905 	clrw x 
      009730 85 20 D3         [ 2] 4906 	ldw farptr+1,x 
      009733 35 01 00 18      [ 1] 4907 	mov farptr,#1
      001919                       4908 1$:	
                                   4909 ; check if farptr is after any file 
                                   4910 ; if  0 then so.
      009733 72 00 00 26      [ 5] 4911 	ldf a,[farptr]
      009737 05 A6            [ 1] 4912 	jreq 6$
      009739 06               [ 1] 4913 2$: clrw x 	
      00973A CC 87            [ 2] 4914 	ldw y,(YSAVE,sp) 
      00973C E4 18 EC         [ 4] 4915 	call cmp_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00973D 25 2D            [ 1] 4916 	jrc 9$
      00973D 1E 03 CF 00      [ 5] 4917 	ldf a,([farptr],x)
      009741 05 E6            [ 1] 4918 	ld (FSIZE,sp),a 
      009743 02               [ 2] 4919 	incw x 
      009744 C7 00 04 1E      [ 5] 4920 	ldf a,([farptr],x)
      009748 05 CF            [ 1] 4921 	ld (FSIZE+1,sp),a 
      00974A 00               [ 2] 4922 	incw x 
      00974B 01 85 5B         [ 2] 4923 	addw x,(FSIZE,sp) ; count to skip 
      00974E 04               [ 2] 4924 	incw x ; skip over EOF marker 
      00974F 89 81 A1         [ 4] 4925 	call incr_farptr ; now at next file 'name_field'
      009751 AE 02 80         [ 2] 4926 	ldw x,#0x280
      009751 72 01 00         [ 2] 4927 	cpw x,farptr 
      009754 26 02            [ 1] 4928 	jrpl 1$
      001944                       4929 6$: ; file not found 
      009756 4F 81 00 18      [ 1] 4930 	clr farptr
      009758 72 5F 00 19      [ 1] 4931 	clr farptr+1 
      009758 72 09 00 26      [ 1] 4932 	clr farptr+2 
      001950                       4933 	_drop VSIZE 
      00975C 12 5B            [ 2]    1     addw sp,#VSIZE 
      00975E 02               [ 1] 4934 	rcf
      00975F CD               [ 4] 4935 	ret
      001954                       4936 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001954                       4937 	_drop VSIZE 
      009760 94 D1            [ 2]    1     addw sp,#VSIZE 
      009762 5B               [ 1] 4938 	scf 	
      009763 04               [ 4] 4939 	ret
                                   4940 
                                   4941 
                                   4942 ;--------------------------------
                                   4943 ; BASIC: SAVE "name" 
                                   4944 ; save text program in 
                                   4945 ; flash memory used as 
                                   4946 ;--------------------------------
                           000001  4947 	BSIZE=1
                           000003  4948 	NAMEPTR=3
                           000004  4949 	VSIZE=4
      001958                       4950 save:
      009764 72 19 00 26 72   [ 2] 4951 	btjf flags,#FRUN,0$ 
      009769 10 00            [ 1] 4952 	ld a,#ERR_CMD_ONLY 
      00976B 26 CC 88         [ 2] 4953 	jp tb_error
      001962                       4954 0$:	 
      00976E 4A CE 00         [ 2] 4955 	ldw x,txtend 
      009771 1F C3 00 21      [ 2] 4956 	subw x,txtbgn
      009775 2B 05            [ 1] 4957 	jrne 1$
                                   4958 ; nothing to save 
      009777 A6 0D            [ 1] 4959 	ld a,#ERR_NO_PROG
      009779 CC 87 E4         [ 2] 4960 	jp tb_error 	
      00977C                       4961 1$:	
      001970                       4962 	_vars VSIZE 
      00977C CD 91            [ 2]    1     sub sp,#VSIZE 
      00977E C8 5B            [ 2] 4963 	ldw (BSIZE,sp),x 
      009780 02 5F CF         [ 4] 4964 	call next_token	
      009783 00 07            [ 1] 4965 	cp a,#TK_QSTR
      009785 72 5F            [ 1] 4966 	jreq 2$
      009787 00 09 72         [ 2] 4967 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      00197E                       4968 2$: 
      00978A 5F 00            [ 2] 4969 	ldw (NAMEPTR,sp),x  
      00978C 0A CE 00 1F CF   [ 1] 4970 	mov in,count 
                                   4971 ; check if enough free space 
      009791 00 05 E6         [ 4] 4972 	call strlen 
      009794 02 C7 00         [ 2] 4973 	addw x,#3 
      009797 04 35 03         [ 2] 4974 	addw x,(BSIZE,sp)
      00979A 00 02 72 10      [ 1] 4975 	tnz ffree 
      00979E 00 26            [ 1] 4976 	jrne 21$
      0097A0 CC 88 4A 1C      [ 2] 4977 	subw x,ffree+1 
      0097A3 23 05            [ 2] 4978 	jrule 21$
      0097A3 CC 88            [ 1] 4979 	ld a,#ERR_NO_FSPACE  
      0097A5 2D 07 64         [ 2] 4980 	jp tb_error
      0097A6                       4981 21$: 
                                   4982 ; check for existing file of that name 
      0097A6 CD 8F            [ 2] 4983 	ldw y,(NAMEPTR,sp)	
      0097A8 6B A1 02         [ 4] 4984 	call search_file 
      0097AB 27 03            [ 1] 4985 	jrnc 3$ 
      0097AD CC 87            [ 1] 4986 	ld a,#ERR_DUPLICATE 
      0097AF E2 07 64         [ 2] 4987 	jp tb_error 
      0097B0                       4988 3$:	;** write file name to flash **
      0097B0 85 90 85         [ 2] 4989 	ldw x,ffree 
      0097B3 C6 00 1D         [ 1] 4990 	ld a,ffree+2 
      0097B3 89 AE F4         [ 2] 4991 	ldw farptr,x 
      0097B6 24 65 90         [ 1] 4992 	ld farptr+2,a 
      0097B9 A3 7A            [ 2] 4993 	ldw x,(NAMEPTR,sp)  
      0097BB 12 2B 01         [ 4] 4994 	call strlen 
      0097BE 5C               [ 2] 4995 	incw  x
      0097BF 1F 01            [ 2] 4996 	ldw (BSIZE,sp),x  
      0097BF 9E               [ 1] 4997 	clrw x   
      0097C0 C7 53            [ 2] 4998 	ldw y,(NAMEPTR,sp)
      0097C2 0D 9F C7         [ 4] 4999 	call write_block  
                                   5000 ;** write file length after name **
      0097C5 53 0E 8C         [ 2] 5001 	ldw x,txtend 
      0097C8 56 9E C7 53      [ 2] 5002 	subw x,txtbgn
      0097CC 0F 9F            [ 2] 5003 	ldw (BSIZE,sp),x 
      0097CE C7               [ 1] 5004 	clrw x 
      0097CF 53 10            [ 1] 5005 	ld a,(BSIZE,sp)
      0097D1 72 10 53         [ 4] 5006 	call write_byte 
      0097D4 08               [ 2] 5007 	incw x 
      0097D5 72 10            [ 1] 5008 	ld a,(BSIZE+1,sp)
      0097D7 53 00 72         [ 4] 5009 	call write_byte
      0097DA 10               [ 2] 5010 	incw x  
      0097DB 53 04 85         [ 4] 5011 	call incr_farptr ; move farptr after SIZE field 
                                   5012 ;** write BASIC text **
                                   5013 ; copy BSIZE, stack:{... bsize -- ... bsize bsize }	
      0097DE CF 00            [ 2] 5014 	ldw x,(BSIZE,sp)
      0097E0 13               [ 2] 5015 	pushw x ; write_block argument 
      0097E1 CE               [ 1] 5016 	clrw x 
      0097E2 00 13 26 FB      [ 2] 5017 	ldw y,txtbgn  ; BASIC text to save 
      0097E6 72 11 53         [ 4] 5018 	call write_block 
      0019E9                       5019 	_drop 2 ;  drop write_block argument  
      0097E9 08 72            [ 2]    1     addw sp,#2 
                                   5020 ; write end of file marker 
      0097EB 11 53 00         [ 2] 5021 	ldw x,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0097EE 81 FF            [ 1] 5022 	ld a,#EOF  
      0097EF CD 00 F1         [ 4] 5023 	call write_byte 
      0097EF CD 8F 6B         [ 4] 5024 	call incr_farptr
                                   5025 ; save farptr in ffree
      0097F2 A1 02 27         [ 2] 5026 	ldw x,farptr 
      0097F5 0B A1 01         [ 1] 5027 	ld a,farptr+2 
      0097F8 27 03 CC         [ 2] 5028 	ldw ffree,x 
      0097FB 87 E2 AE         [ 1] 5029 	ld ffree+2,a
                                   5030 ;write 4 zero bytes as an end of all files marker 
      0097FE 00               [ 1] 5031     clrw x 
      0097FF 00 89            [ 1] 5032 	push #4 
      001A05                       5033 4$:
      009801 1E               [ 1] 5034 	clr a 
      009802 03 5D 27         [ 4] 5035 	call write_byte 
      009805 1A               [ 2] 5036 	incw x 
      009806 1E 01            [ 1] 5037 	dec (1,sp)
      009808 9F A4            [ 1] 5038 	jrne 4$
      00980A 07               [ 1] 5039 5$: pop a 
                                   5040 ; display saved size  
      00980B 4E C7            [ 2] 5041 	ldw x,(BSIZE,sp) 
      00980D 54 01 72         [ 4] 5042 	call print_int 
      001A14                       5043 	_drop VSIZE 
      009810 16 50            [ 2]    1     addw sp,#VSIZE 
      009812 CA               [ 4] 5044 	ret 
                                   5045 
                                   5046 ;----------------------
                                   5047 ; load file in RAM memory
                                   5048 ; input:
                                   5049 ;    farptr point at file size 
                                   5050 ; output:
                                   5051 ;   y point after BASIC program in RAM.
                                   5052 ;------------------------
      001A17                       5053 load_file:
      009813 72 10 54         [ 4] 5054 	call incr_farptr  
      009816 01 AE 00         [ 4] 5055 	call clear_basic  
      009819 1B               [ 1] 5056 	clrw x
      00981A 5A 9D 26 FA      [ 5] 5057 	ldf a,([farptr],x)
      00981E 20 08            [ 1] 5058 	ld yh,a 
      009820 72               [ 2] 5059 	incw x  
      009821 11 54 01 72      [ 5] 5060 	ldf a,([farptr],x)
      009825 17               [ 2] 5061 	incw x 
      009826 50 CA            [ 1] 5062 	ld yl,a 
      009828 5B 04 81 1E      [ 2] 5063 	addw y,txtbgn
      00982B 90 CF 00 20      [ 2] 5064 	ldw txtend,y
      00982B CD 8F 92 A1      [ 2] 5065 	ldw y,txtbgn
      001A38                       5066 3$:	; load BASIC text 	
      00982F 01 27 03 CC      [ 5] 5067 	ldf a,([farptr],x)
      009833 87 E2            [ 1] 5068 	ld (y),a 
      009835 85               [ 2] 5069 	incw x 
      009836 A3 00            [ 2] 5070 	incw y 
      009838 05 23 05 A6      [ 2] 5071 	cpw y,txtend 
      00983C 0A CC            [ 1] 5072 	jrmi 3$
      00983E 87               [ 4] 5073 	ret 
                                   5074 
                                   5075 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5076 ; BASIC: LOAD "file" 
                                   5077 ; load file to RAM 
                                   5078 ; for execution 
                                   5079 ;------------------------
      001A48                       5080 load:
      00983F E4 9F C7 00 0E   [ 2] 5081 	btjf flags,#FRUN,0$ 
      009844 A6 05            [ 1] 5082 	jreq 0$ 
      009846 C0 00            [ 1] 5083 	ld a,#ERR_CMD_ONLY 
      009848 0E C7 54         [ 2] 5084 	jp tb_error 
      001A54                       5085 0$:	
      00984B 00 72 16         [ 4] 5086 	call next_token 
      00984E 54 02            [ 1] 5087 	cp a,#TK_QSTR
      009850 72 10            [ 1] 5088 	jreq 1$
      009852 54 01 72         [ 2] 5089 	jp syntax_error 
      009855 0F 54            [ 1] 5090 1$:	ldw y,x 
      009857 00 FB CE 54 04   [ 1] 5091 	mov in,count 
      00985C A6 04 81         [ 4] 5092 	call search_file 
      00985F 25 05            [ 1] 5093 	jrc 2$ 
      00985F 52 01            [ 1] 5094 	ld a,#ERR_NOT_FILE
      009861 CD 8F 92         [ 2] 5095 	jp tb_error  
      001A6F                       5096 2$:
      009864 A1 01 27         [ 4] 5097 	call load_file
                                   5098 ; print loaded size 	 
      009867 03 CC 87         [ 2] 5099 	ldw x,txtend 
      00986A E2 85 A3 00      [ 2] 5100 	subw x,txtbgn
      00986E 0F 23 05         [ 4] 5101 	call print_int 
      009871 A6               [ 4] 5102 	ret 
                                   5103 
                                   5104 ;-----------------------------------
                                   5105 ; BASIC: FORGET ["file_name"] 
                                   5106 ; erase file_name and all others 
                                   5107 ; after it. 
                                   5108 ; without argument erase all files 
                                   5109 ;-----------------------------------
      001A7D                       5110 forget:
      009872 0A CC 87         [ 4] 5111 	call next_token 
      009875 E4 CD            [ 1] 5112 	cp a,#TK_NONE 
      009877 9E 49            [ 1] 5113 	jreq 3$ 
      009879 6B 01            [ 1] 5114 	cp a,#TK_QSTR
      00987B E6 01            [ 1] 5115 	jreq 1$
      00987D 0D 01 27         [ 2] 5116 	jp syntax_error
      009880 05 44            [ 1] 5117 1$: ldw y,x 
      009882 0A 01 26 FB A4   [ 1] 5118 	mov in,count 
      009887 01 5F 97         [ 4] 5119 	call search_file
      00988A A6 04            [ 1] 5120 	jrc 2$
      00988C 5B 01            [ 1] 5121 	ld a,#ERR_NOT_FILE 
      00988E 81 07 64         [ 2] 5122 	jp tb_error 
      00988F                       5123 2$: 
      00988F 52 02 CD         [ 2] 5124 	ldw x,farptr
      009892 8F 6B A1         [ 1] 5125 	ld a,farptr+2
      009895 02 27            [ 2] 5126 	jra 4$ 
      001AA4                       5127 3$: ; forget all files 
      009897 03 CC 87         [ 2] 5128 	ldw x,#0x100
      00989A E2               [ 1] 5129 	clr a 
      00989B 85 9F 6B         [ 2] 5130 	ldw farptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      00989E 02 85 A3         [ 1] 5131 	ld farptr+2,a 
      001AAE                       5132 4$:
      0098A1 00 0F 23         [ 2] 5133 	ldw ffree,x 
      0098A4 05 A6 0A         [ 1] 5134 	ld ffree+2,a 
      0098A7 CC 87            [ 1] 5135 	push #4
      0098A9 E4               [ 1] 5136 	clrw x 
      001AB7                       5137 5$: 
      0098AA CD               [ 1] 5138 	clr a  
      0098AB 9E 49 6B         [ 4] 5139 	call write_byte 
      0098AE 01               [ 2] 5140 	incw x 
      0098AF A6 01            [ 1] 5141 	dec (1,sp)
      0098B1 0D 01            [ 1] 5142 	jrne 5$	
      0098B3 27               [ 1] 5143 6$: pop a 
      0098B4 05               [ 4] 5144 	ret 
                                   5145 
                                   5146 ;----------------------
                                   5147 ; BASIC: DIR 
                                   5148 ; list saved files 
                                   5149 ;----------------------
                           000001  5150 	COUNT=1 ; files counter 
                           000002  5151 	VSIZE=2 
      001AC2                       5152 directory:
      001AC2                       5153 	_vars VSIZE 
      0098B5 48 0A            [ 2]    1     sub sp,#VSIZE 
      0098B7 01               [ 1] 5154 	clrw x 
      0098B8 26 FB            [ 2] 5155 	ldw (COUNT,sp),x 
      0098BA 0D 02 26         [ 2] 5156 	ldw farptr+1,x 
      0098BD 05 43 E4 00      [ 1] 5157 	mov farptr,#1 
      001ACE                       5158 dir_loop:
      0098C1 20               [ 1] 5159 	clrw x 
      0098C2 02 EA 00 E7      [ 5] 5160 	ldf a,([farptr],x)
      0098C6 00 5B            [ 1] 5161 	jreq 8$ 
      001AD5                       5162 1$: ;name loop 	
      0098C8 02 81 00 18      [ 5] 5163 	ldf a,([farptr],x)
      0098CA 27 06            [ 1] 5164 	jreq 2$ 
      0098CA 72 00 00         [ 4] 5165 	call putc 
      0098CD 26               [ 2] 5166 	incw x 
      0098CE 02 4F            [ 2] 5167 	jra 1$
      0098D0 81               [ 2] 5168 2$: incw x ; skip ending 0. 
      0098D1 A6 20            [ 1] 5169 	ld a,#SPACE 
      0098D1 AE 98 F8         [ 4] 5170 	call putc 
                                   5171 ; get file size 	
      0098D4 CD 82 57 5B      [ 5] 5172 	ldf a,([farptr],x)
      0098D8 02 52            [ 1] 5173 	ld yh,a 
      0098DA 04               [ 2] 5174 	incw x 
      0098DB CD 94 C1 AE      [ 5] 5175 	ldf a,([farptr],x)
      0098DF 16               [ 2] 5176 	incw x 
      0098E0 E8 CF            [ 1] 5177 	ld yl,a 
      0098E2 00 05            [ 2] 5178 	pushw y 
      0098E4 7F 72 5F         [ 2] 5179 	addw x,(1,sp)
      0098E7 00               [ 2] 5180 	incw x ; skip EOF marker 
                                   5181 ; skip to next file 
      0098E8 04 5F CF         [ 4] 5182 	call incr_farptr 
                                   5183 ; print file size 
      0098EB 00               [ 2] 5184 	popw x ; file size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      0098EC 01 72 11         [ 4] 5185 	call print_int 
      0098EF 00 26            [ 1] 5186 	ld a,#CR 
      0098F1 72 18 00         [ 4] 5187 	call putc
      0098F4 26 CC            [ 2] 5188 	ldw x,(COUNT,sp)
      0098F6 88               [ 2] 5189 	incw x
      0098F7 4A 0A            [ 2] 5190 	ldw (COUNT,sp),x  
      0098F9 62 72            [ 2] 5191 	jra dir_loop 
      001B0E                       5192 8$: ; print number of files 
      0098FB 65 61            [ 2] 5193 	ldw x,(COUNT,sp)
      0098FD 6B 20 70         [ 4] 5194 	call print_int 
      009900 6F 69 6E         [ 2] 5195 	ldw x,#file_count 
      009903 74 2C 20         [ 4] 5196 	call puts  
                                   5197 ; print drive free space 	
      009906 52 55            [ 1] 5198 	ld a,#0xff 
      009908 4E 20 74         [ 1] 5199 	sub a,ffree+2 
      00990B 6F 20 72         [ 1] 5200 	ld acc8,a 
      00990E 65 73            [ 1] 5201 	ld a,#0x7f 
      009910 75 6D 65         [ 1] 5202 	sbc a,ffree+1 
      009913 2E 0A 00         [ 1] 5203 	ld acc16,a 
      009916 A6 02            [ 1] 5204 	ld a,#2 
      009916 72 01 00         [ 1] 5205 	sbc a,ffree 
      009919 26 02 4F         [ 1] 5206 	ld acc24,a 
      00991C 81               [ 1] 5207 	clrw x  
      00991D A6 06            [ 1] 5208 	ld a,#6 
      00991D CD               [ 1] 5209 	ld xl,a 
      00991E 86 7F            [ 1] 5210 	ld a,#10 
      009920 81 08 72         [ 4] 5211 	call prti24 
      009921 AE 1B 4B         [ 2] 5212 	ldw x,#drive_free
      009921 72 BB 00         [ 4] 5213 	call puts 
      001B40                       5214 	_drop VSIZE 
      009924 1A 24            [ 2]    1     addw sp,#VSIZE 
      009926 04               [ 4] 5215 	ret
      009927 72 5C 00 19 CF 00 1A  5216 file_count: .asciz " files\n"
             81
      00992F 20 62 79 74 65 73 20  5217 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5218 
                                   5219 ;---------------------
                                   5220 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5221 ; write 1 or more byte to FLASH or EEPROM
                                   5222 ; starting at address  
                                   5223 ; input:
                                   5224 ;   expr1  	is address 
                                   5225 ;   expr2,...,exprn   are bytes to write
                                   5226 ; output:
                                   5227 ;   none 
                                   5228 ;---------------------
                           000001  5229 	ADDR=1
                           000002  5230 	VSIZ=2 
      001B58                       5231 write:
      001B58                       5232 	_vars VSIZE 
      00992F A6 01            [ 2]    1     sub sp,#VSIZE 
      009931 C7 00 19 5F      [ 1] 5233 	clr farptr ; expect 16 bits address 
      009935 CF 00 1A         [ 4] 5234 	call expression
      009938 A1 04            [ 1] 5235 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009938 AE 00            [ 1] 5236 	jreq 0$
      00993A 03 92 AF         [ 2] 5237 	jp syntax_error
      00993D 00 19            [ 2] 5238 0$: ldw (ADDR,sp),x 
      00993F 26 05 5A         [ 4] 5239 	call next_token 
      009942 2A F7            [ 1] 5240 	cp a,#TK_COMMA 
      009944 20 19            [ 1] 5241 	jreq 1$ 
      009946 5C CD            [ 2] 5242 	jra 9$ 
      009948 99 21 AE         [ 4] 5243 1$:	call expression
      00994B 02 7F            [ 1] 5244 	cp a,#TK_INTGR
      00994D C3 00            [ 1] 5245 	jreq 2$
      00994F 19 2A E6         [ 2] 5246 	jp syntax_error
      009952 72               [ 1] 5247 2$:	ld a,xl 
      009953 5F 00            [ 2] 5248 	ldw x,(ADDR,sp) 
      009955 1C 72 5F         [ 2] 5249 	ldw farptr+1,x 
      009958 00               [ 1] 5250 	clrw x 
      009959 1D 72 5F         [ 4] 5251 	call write_byte
      00995C 00 1E            [ 2] 5252 	ldw x,(ADDR,sp)
      00995E 81               [ 2] 5253 	incw x 
      00995F 20 DC            [ 2] 5254 	jra 0$ 
      001B8C                       5255 9$:
      001B8C                       5256 	_drop VSIZE
      00995F CE 00            [ 2]    1     addw sp,#VSIZE 
      009961 19               [ 4] 5257 	ret 
                                   5258 
                                   5259 
                                   5260 ;---------------------
                                   5261 ;BASIC: CHAR(expr)
                                   5262 ; évaluate expression 
                                   5263 ; and take the 7 least 
                                   5264 ; bits as ASCII character
                                   5265 ;---------------------
      001B8F                       5266 char:
      009962 C6 00 1B         [ 4] 5267 	call func_args 
      009965 CF 00            [ 1] 5268 	cp a,#1
      009967 1C C7            [ 1] 5269 	jreq 1$
      009969 00 1E 81         [ 2] 5270 	jp syntax_error
      00996C 85               [ 2] 5271 1$:	popw x 
      00996C 5F               [ 1] 5272 	ld a,xl 
      00996D 92 AF            [ 1] 5273 	and a,#0x7f 
      00996F 00               [ 1] 5274 	ld xl,a
      009970 19 90            [ 1] 5275 	ld a,#TK_CHAR
      009972 F1               [ 4] 5276 	ret
                                   5277 
                                   5278 ;---------------------
                                   5279 ; BASIC: ASC(string|char)
                                   5280 ; extract first character 
                                   5281 ; of string argument 
                                   5282 ; return it as TK_INTGR 
                                   5283 ;---------------------
      001BA1                       5284 ascii:
      009973 26 08            [ 1] 5285 	ld a,#TK_LPAREN
      009975 4D 27 12         [ 4] 5286 	call expect 
      009978 5C 90 5C         [ 4] 5287 	call next_token 
      00997B 20 F0            [ 1] 5288 	cp a,#TK_QSTR 
      00997D 27 07            [ 1] 5289 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      00997D 4D 27            [ 1] 5290 	cp a,#TK_CHAR 
      00997F 07 5C            [ 1] 5291 	jreq 2$ 
      009981 92 AF 00         [ 2] 5292 	jp syntax_error
      001BB4                       5293 1$: 
      009984 19               [ 1] 5294 	ld a,(x) 
      009985 20               [ 1] 5295 	clrw x
      009986 F6               [ 1] 5296 	ld xl,a 
      001BB7                       5297 2$: 
      009987 5C               [ 2] 5298 	pushw x 
      009988 98 81            [ 1] 5299 	ld a,#TK_RPAREN 
      00998A CD 0E DE         [ 4] 5300 	call expect
      00998A 5C               [ 2] 5301 	popw x 
      00998B 99 81            [ 1] 5302 	ld a,#TK_INTGR 
      00998D 81               [ 4] 5303 	ret 
                                   5304 
                                   5305 ;---------------------
                                   5306 ;BASIC: KEY
                                   5307 ; wait for a character 
                                   5308 ; received from STDIN 
                                   5309 ; input:
                                   5310 ;	none 
                                   5311 ; output:
                                   5312 ;	X 		ASCII character 
                                   5313 ;---------------------
      001BC1                       5314 key:
      00998D 52 04 17         [ 4] 5315 	call getc 
      009990 03               [ 1] 5316 	clrw x 
      009991 5F               [ 1] 5317 	ld xl,a 
      009992 CF 00            [ 1] 5318 	ld a,#TK_INTGR
      009994 1A               [ 4] 5319 	ret
                                   5320 
                                   5321 ;----------------------
                                   5322 ; BASIC: QKEY
                                   5323 ; Return true if there 
                                   5324 ; is a character in 
                                   5325 ; waiting in STDIN 
                                   5326 ; input:
                                   5327 ;  none 
                                   5328 ; output:
                                   5329 ;   X 		0|-1 
                                   5330 ;-----------------------
      001BC9                       5331 qkey:: 
      009995 35               [ 1] 5332 	clrw x 
      009996 01 00 19 27      [ 1] 5333 	tnz rx_char
      009999 27 01            [ 1] 5334 	jreq 9$ 
      009999 92               [ 2] 5335 	cplw x 
      00999A BC 00            [ 1] 5336 9$: ld a,#TK_INTGR
      00999C 19               [ 4] 5337 	ret 
                                   5338 
                                   5339 ;---------------------
                                   5340 ; BASIC: GPIO(expr,reg)
                                   5341 ; return gpio address 
                                   5342 ; expr {0..8}
                                   5343 ; input:
                                   5344 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5345 ; output:
                                   5346 ;   X 		gpio register address
                                   5347 ;----------------------------
                           000003  5348 	PORT=3
                           000001  5349 	REG=1 
                           000004  5350 	VSIZE=4 
      001BD4                       5351 gpio:
      00999D 27 25 5F         [ 4] 5352 	call func_args 
      0099A0 16 03            [ 1] 5353 	cp a,#2
      0099A2 CD 99            [ 1] 5354 	jreq 1$
      0099A4 6C 25 2D         [ 2] 5355 	jp syntax_error  
      001BDE                       5356 1$:	
      0099A7 92 AF            [ 2] 5357 	ldw x,(PORT,sp)
      0099A9 00 19            [ 1] 5358 	jrmi bad_port
      0099AB 6B 01 5C         [ 2] 5359 	cpw x,#9
      0099AE 92 AF            [ 1] 5360 	jrpl bad_port
      0099B0 00 19            [ 1] 5361 	ld a,#5
      0099B2 6B               [ 4] 5362 	mul x,a
      0099B3 02 5C 72         [ 2] 5363 	addw x,#GPIO_BASE 
      0099B6 FB 01            [ 2] 5364 	ldw (PORT,sp),x  
      0099B8 5C CD            [ 2] 5365 	ldw x,(REG,sp) 
      0099BA 99 21 AE         [ 2] 5366 	addw x,(PORT,sp)
      0099BD 02 80            [ 1] 5367 	ld a,#TK_INTGR
      001BF6                       5368 	_drop VSIZE 
      0099BF C3 00            [ 2]    1     addw sp,#VSIZE 
      0099C1 19               [ 4] 5369 	ret
      001BF9                       5370 bad_port:
      0099C2 2A D5            [ 1] 5371 	ld a,#ERR_BAD_VALUE
      0099C4 CC 07 64         [ 2] 5372 	jp tb_error
                                   5373 
                                   5374 
                                   5375 ;-------------------------
                                   5376 ; BASIC: UFLASH 
                                   5377 ; return user flash address
                                   5378 ; input:
                                   5379 ;  none 
                                   5380 ; output:
                                   5381 ;	A		TK_INTGR
                                   5382 ;   X 		user address 
                                   5383 ;---------------------------
      001BFE                       5384 uflash:
      0099C4 72 5F 00         [ 2] 5385 	ldw x,#user_space 
      0099C7 19 72            [ 1] 5386 	ld a,#TK_INTGR 
      0099C9 5F               [ 4] 5387 	ret 
                                   5388 
                                   5389 
                                   5390 ;---------------------
                                   5391 ; BASIC: USR(addr[,arg])
                                   5392 ; execute a function written 
                                   5393 ; in binary code.
                                   5394 ; binary fonction should 
                                   5395 ; return token attribute in A 
                                   5396 ; and value in X. 
                                   5397 ; input:
                                   5398 ;   addr	routine address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5399 ;   arg 	is an optional argument 
                                   5400 ; output:
                                   5401 ;   A 		token attribute 
                                   5402 ;   X       returned value 
                                   5403 ;---------------------
      001C04                       5404 usr:
      0099CA 00 1A            [ 2] 5405 	pushw y 	
      0099CC 72 5F 00         [ 4] 5406 	call func_args 
      0099CF 1B 5B            [ 1] 5407 	cp a,#1 
      0099D1 04 98            [ 1] 5408 	jreq 2$
      0099D3 81 02            [ 1] 5409 	cp a,#2
      0099D4 27 03            [ 1] 5410 	jreq 2$  
      0099D4 5B 04 99         [ 2] 5411 	jp syntax_error 
      0099D7 81 85            [ 2] 5412 2$: popw y  ; arg|addr 
      0099D8 A1 01            [ 1] 5413 	cp a,#1
      0099D8 72 01            [ 1] 5414 	jreq 3$
      0099DA 00               [ 2] 5415 	popw x ; addr
      0099DB 26               [ 1] 5416 	exgw x,y 
      0099DC 05 A6            [ 4] 5417 3$: call (y)
      0099DE 07 CC            [ 2] 5418 	popw y 
      0099E0 87               [ 4] 5419 	ret 
                                   5420 
                                   5421 ;------------------------------
                                   5422 ; BASIC: BYE 
                                   5423 ; halt mcu in its lowest power mode 
                                   5424 ; wait for reset or external interrupt
                                   5425 ; do a cold start on wakeup.
                                   5426 ;------------------------------
      001C21                       5427 bye:
      0099E1 E4 0D 52 30 FB   [ 2] 5428 	btjf UART1_SR,#UART_SR_TC,.
      0099E2 8E               [10] 5429 	halt
      0099E2 CE 00 21         [ 2] 5430 	jp cold_start  
                                   5431 
                                   5432 ;----------------------------------
                                   5433 ; BASIC: AUTORUN ["file_name"] 
                                   5434 ; record in eeprom at adrress AUTORUN_NAME
                                   5435 ; the name of file to load and execute
                                   5436 ; at startup. 
                                   5437 ; empty string delete autorun name 
                                   5438 ; no argument display autorun name  
                                   5439 ; input:
                                   5440 ;   file_name   file to execute 
                                   5441 ; output:
                                   5442 ;   none
                                   5443 ;-----------------------------------
      001C2A                       5444 autorun: 
      0099E5 72 B0 00 1F 26   [ 2] 5445 	btjf flags,#FRUN,0$ 
      0099EA 05 A6            [ 1] 5446 	jreq 0$ 
      0099EC 0D CC            [ 1] 5447 	ld a,#ERR_CMD_ONLY 
      0099EE 87 E4 64         [ 2] 5448 	jp tb_error 
      0099F0                       5449 0$:	
      0099F0 52 04 1F         [ 4] 5450 	call next_token
      0099F3 01 CD            [ 1] 5451 	jrne 1$
      0099F5 88 A1 A1         [ 2] 5452 	ldw x,#AUTORUN_NAME
      0099F8 02 27 03         [ 4] 5453 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      0099FB CC               [ 1] 5454 	clr a 
      0099FC 87               [ 4] 5455 	ret 
      001C43                       5456 1$:
      0099FD E2 02            [ 1] 5457 	cp a,#TK_QSTR
      0099FE 27 03            [ 1] 5458 	jreq 2$
      0099FE 1F 03 55         [ 2] 5459 	jp syntax_error 
      001C4A                       5460 2$:	
      009A01 00               [ 1] 5461 	tnz (x) 
      009A02 04 00            [ 1] 5462 	jrne 3$
                                   5463 ; empty string, delete autorun 	
      009A04 02 CD 82         [ 4] 5464 	call cancel_autorun
      009A07 8B 1C 00 03      [ 1] 5465 	clr count 
      009A0B 72               [ 4] 5466 	ret 
      009A0C FB               [ 2] 5467 3$:	pushw x 
      009A0D 01 72            [ 1] 5468 	ldw y,x  
      009A0F 5D 00 1C         [ 4] 5469 	call search_file 
      009A12 26 0B            [ 1] 5470 	jrc 4$ 
      009A14 72 B0            [ 1] 5471 	ld a,#ERR_NOT_FILE
      009A16 00 1D 23         [ 2] 5472 	jp tb_error  
      001C62                       5473 4$: 
      009A19 05 A6 0E CC 87   [ 1] 5474 	mov in,count 
      009A1E E4 5F 00 18      [ 1] 5475 	clr farptr 
      009A1F AE 40 00         [ 2] 5476 	ldw x,#AUTORUN_NAME
      009A1F 16 03 CD         [ 2] 5477 	ldw farptr+1,x 
      009A22 99 8D            [ 2] 5478 	ldw x,(1,sp)  
      009A24 24 05 A6         [ 4] 5479 	call strlen  ; return length in X 
      009A27 08               [ 2] 5480 	incw x 
      009A28 CC 87            [ 2] 5481 	popw y 
      009A2A E4               [ 2] 5482 	pushw x 
      009A2B 5F               [ 1] 5483 	clrw x 
      009A2B CE 00 1C         [ 4] 5484 	call write_block 
      001C7E                       5485 	_drop 2 
      009A2E C6 00            [ 2]    1     addw sp,#2 
      009A30 1E               [ 4] 5486 	ret 
                                   5487 
                                   5488 ;----------------------------------
                                   5489 ; BASIC: SLEEP 
                                   5490 ; halt mcu until reset or external
                                   5491 ; interrupt.
                                   5492 ; Resume progam after SLEEP command
                                   5493 ;----------------------------------
      001C81                       5494 sleep:
      009A31 CF 00 19 C7 00   [ 2] 5495 	btjf UART1_SR,#UART_SR_TC,.
      009A36 1B 1E 03 CD      [ 1] 5496 	bset flags,#FSLEEP
      009A3A 82               [10] 5497 	halt 
      009A3B 8B               [ 4] 5498 	ret 
                                   5499 
                                   5500 ;-------------------------------
                                   5501 ; BASIC: PAUSE expr 
                                   5502 ; suspend execution for n msec.
                                   5503 ; input:
                                   5504 ;	none
                                   5505 ; output:
                                   5506 ;	none 
                                   5507 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001C8C                       5508 pause:
      009A3C 5C 1F 01         [ 4] 5509 	call expression
      009A3F 5F 16            [ 1] 5510 	cp a,#TK_INTGR
      009A41 03 CD            [ 1] 5511 	jreq pause02 
      009A43 81 E6 CE         [ 2] 5512 	jp syntax_error
      001C96                       5513 pause02: 
      009A46 00               [ 2] 5514 1$: tnzw x 
      009A47 21 72            [ 1] 5515 	jreq 2$
      009A49 B0               [10] 5516 	wfi 
      009A4A 00               [ 2] 5517 	decw x 
      009A4B 1F 1F            [ 1] 5518 	jrne 1$
      009A4D 01               [ 1] 5519 2$:	clr a 
      009A4E 5F               [ 4] 5520 	ret 
                                   5521 
                                   5522 ;------------------------------
                                   5523 ; BASIC: AWU expr
                                   5524 ; halt mcu for 'expr' milliseconds
                                   5525 ; use Auto wakeup peripheral
                                   5526 ; all oscillators stopped except LSI
                                   5527 ; range: 1ms - 511ms
                                   5528 ; input:
                                   5529 ;  none
                                   5530 ; output:
                                   5531 ;  none:
                                   5532 ;------------------------------
      001C9F                       5533 awu:
      009A4F 7B 01 CD         [ 4] 5534   call expression
      009A52 81 71            [ 1] 5535   cp a,#TK_INTGR
      009A54 5C 7B            [ 1] 5536   jreq awu02
      009A56 02 CD 81         [ 2] 5537   jp syntax_error
      001CA9                       5538 awu02:
      009A59 71 5C CD         [ 2] 5539   cpw x,#5120
      009A5C 99 21            [ 1] 5540   jrmi 1$ 
      009A5E 1E 01 89 5F      [ 1] 5541   mov AWU_TBR,#15 
      009A62 90 CE            [ 1] 5542   ld a,#30
      009A64 00               [ 2] 5543   div x,a
      009A65 1F CD            [ 1] 5544   ld a,#16
      009A67 81               [ 2] 5545   div x,a 
      009A68 E6 5B            [ 2] 5546   jra 4$
      001CBA                       5547 1$: 
      009A6A 02 AE 00         [ 2] 5548   cpw x,#2048
      009A6D 01 A6            [ 1] 5549   jrmi 2$ 
      009A6F FF CD 81 71      [ 1] 5550   mov AWU_TBR,#14
      009A73 CD 99            [ 1] 5551   ld a,#80
      009A75 21               [ 2] 5552   div x,a 
      009A76 CE 00            [ 2] 5553   jra 4$   
      001CC8                       5554 2$:
      009A78 19 C6 00 1B      [ 1] 5555   mov AWU_TBR,#7
      001CCC                       5556 3$:  
                                   5557 ; while X > 64  divide by 2 and increment AWU_TBR 
      009A7C CF 00 1C         [ 2] 5558   cpw x,#64 
      009A7F C7 00            [ 2] 5559   jrule 4$ 
      009A81 1E 5F 4B 04      [ 1] 5560   inc AWU_TBR 
      009A85 54               [ 2] 5561   srlw x 
      009A85 4F CD            [ 2] 5562   jra 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001CD8                       5563 4$:
      009A87 81               [ 1] 5564   ld a, xl
      009A88 71               [ 1] 5565   dec a 
      009A89 5C 0A            [ 1] 5566   jreq 5$
      009A8B 01               [ 1] 5567   dec a 	
      001CDD                       5568 5$: 
      009A8C 26 F7            [ 1] 5569   and a,#0x3e 
      009A8E 84 1E 01         [ 1] 5570   ld AWU_APR,a 
      009A91 CD 89 3A 5B      [ 1] 5571   bset AWU_CSR,#AWU_CSR_AWUEN
      009A95 04               [10] 5572   halt 
                                   5573 
      009A96 81               [ 4] 5574   ret 
                                   5575 
                                   5576 ;------------------------------
                                   5577 ; BASIC: TICKS
                                   5578 ; return msec ticks counter value 
                                   5579 ; input:
                                   5580 ; 	none 
                                   5581 ; output:
                                   5582 ;	X 		TK_INTGR
                                   5583 ;-------------------------------
      009A97                       5584 get_ticks:
      009A97 CD 99 21         [ 2] 5585 	ldw x,ticks 
      009A9A CD 86            [ 1] 5586 	ld a,#TK_INTGR
      009A9C 7F               [ 4] 5587 	ret 
                                   5588 
                                   5589 
                                   5590 
                                   5591 ;------------------------------
                                   5592 ; BASIC: ABS(expr)
                                   5593 ; return absolute value of expr.
                                   5594 ; input:
                                   5595 ;   none
                                   5596 ; output:
                                   5597 ;   X     	positive integer
                                   5598 ;-------------------------------
      001CEE                       5599 abs:
      009A9D 5F 92 AF         [ 4] 5600 	call func_args 
      009AA0 00 19            [ 1] 5601 	cp a,#1 
      009AA2 90 95            [ 1] 5602 	jreq 0$ 
      009AA4 5C 92 AF         [ 2] 5603 	jp syntax_error
      001CF8                       5604 0$:  
      009AA7 00               [ 2] 5605     popw x   
      009AA8 19               [ 1] 5606 	ld a,xh 
      009AA9 5C 90            [ 1] 5607 	bcp a,#0x80 
      009AAB 97 72            [ 1] 5608 	jreq 2$ 
      009AAD B9               [ 2] 5609 	negw x 
      009AAE 00 1F            [ 1] 5610 2$: ld a,#TK_INTGR 
      009AB0 90               [ 4] 5611 	ret 
                                   5612 
                                   5613 ;------------------------------
                                   5614 ; BASIC: AND(expr1,expr2)
                                   5615 ; Apply bit AND relation between
                                   5616 ; the 2 arguments, i.e expr1 & expr2 
                                   5617 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5618 ; 	A 		TK_INTGR
                                   5619 ;   X 		result 
                                   5620 ;------------------------------
      001D02                       5621 bit_and:
      009AB1 CF 00 21         [ 4] 5622 	call func_args 
      009AB4 90 CE            [ 1] 5623 	cp a,#2
      009AB6 00 1F            [ 1] 5624 	jreq 1$
      009AB8 CC 07 62         [ 2] 5625 	jp syntax_error 
      009AB8 92               [ 2] 5626 1$:	popw x 
      009AB9 AF               [ 1] 5627 	ld a,xh 
      009ABA 00 19            [ 1] 5628 	and a,(1,sp)
      009ABC 90               [ 1] 5629 	ld xh,a 
      009ABD F7               [ 1] 5630 	ld a,xl
      009ABE 5C 90            [ 1] 5631 	and a,(2,sp)
      009AC0 5C               [ 1] 5632 	ld xl,a 
      001D15                       5633 	_drop 2 
      009AC1 90 C3            [ 2]    1     addw sp,#2 
      009AC3 00 21            [ 1] 5634 	ld a,#TK_INTGR
      009AC5 2B               [ 4] 5635 	ret
                                   5636 
                                   5637 ;------------------------------
                                   5638 ; BASIC: OR(expr1,expr2)
                                   5639 ; Apply bit OR relation between
                                   5640 ; the 2 arguments, i.e expr1 | expr2 
                                   5641 ; output:
                                   5642 ; 	A 		TK_INTGR
                                   5643 ;   X 		result 
                                   5644 ;------------------------------
      001D1A                       5645 bit_or:
      009AC6 F1 81 12         [ 4] 5646 	call func_args 
      009AC8 A1 02            [ 1] 5647 	cp a,#2
      009AC8 72 01            [ 1] 5648 	jreq 1$
      009ACA 00 26 07         [ 2] 5649 	jp syntax_error 
      001D24                       5650 1$: 
      009ACD 27               [ 2] 5651 	popw x 
      009ACE 05               [ 1] 5652 	ld a,xh 
      009ACF A6 07            [ 1] 5653 	or a,(1,sp)
      009AD1 CC               [ 1] 5654 	ld xh,a 
      009AD2 87               [ 1] 5655 	ld a,xl 
      009AD3 E4 02            [ 1] 5656 	or a,(2,sp)
      009AD4 97               [ 1] 5657 	ld xl,a 
      001D2D                       5658 	_drop 2 
      009AD4 CD 88            [ 2]    1     addw sp,#2 
      009AD6 A1 A1            [ 1] 5659 	ld a,#TK_INTGR 
      009AD8 02               [ 4] 5660 	ret
                                   5661 
                                   5662 ;------------------------------
                                   5663 ; BASIC: XOR(expr1,expr2)
                                   5664 ; Apply bit XOR relation between
                                   5665 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5666 ; output:
                                   5667 ; 	A 		TK_INTGR
                                   5668 ;   X 		result 
                                   5669 ;------------------------------
      001D32                       5670 bit_xor:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009AD9 27 03 CC         [ 4] 5671 	call func_args 
      009ADC 87 E2            [ 1] 5672 	cp a,#2
      009ADE 90 93            [ 1] 5673 	jreq 1$
      009AE0 55 00 04         [ 2] 5674 	jp syntax_error 
      001D3C                       5675 1$: 
      009AE3 00               [ 2] 5676 	popw x 
      009AE4 02               [ 1] 5677 	ld a,xh 
      009AE5 CD 99            [ 1] 5678 	xor a,(1,sp)
      009AE7 8D               [ 1] 5679 	ld xh,a 
      009AE8 25               [ 1] 5680 	ld a,xl 
      009AE9 05 A6            [ 1] 5681 	xor a,(2,sp)
      009AEB 09               [ 1] 5682 	ld xl,a 
      001D45                       5683 	_drop 2 
      009AEC CC 87            [ 2]    1     addw sp,#2 
      009AEE E4 04            [ 1] 5684 	ld a,#TK_INTGR 
      009AEF 81               [ 4] 5685 	ret 
                                   5686 
                                   5687 ;------------------------------
                                   5688 ; BASIC: LSHIFT(expr1,expr2)
                                   5689 ; logical shift left expr1 by 
                                   5690 ; expr2 bits 
                                   5691 ; output:
                                   5692 ; 	A 		TK_INTGR
                                   5693 ;   X 		result 
                                   5694 ;------------------------------
      001D4A                       5695 lshift:
      009AEF CD 9A 97         [ 4] 5696 	call func_args
      009AF2 CE 00            [ 1] 5697 	cp a,#2 
      009AF4 21 72            [ 1] 5698 	jreq 1$
      009AF6 B0 00 1F         [ 2] 5699 	jp syntax_error
      009AF9 CD 89            [ 2] 5700 1$: popw y   
      009AFB 3A               [ 2] 5701 	popw x 
      009AFC 81 5D            [ 2] 5702 	tnzw y 
      009AFD 27 05            [ 1] 5703 	jreq 4$
      009AFD CD               [ 2] 5704 2$:	sllw x 
      009AFE 88 A1            [ 2] 5705 	decw y 
      009B00 A1 00            [ 1] 5706 	jrne 2$
      001D60                       5707 4$:  
      009B02 27 20            [ 1] 5708 	ld a,#TK_INTGR
      009B04 A1               [ 4] 5709 	ret
                                   5710 
                                   5711 ;------------------------------
                                   5712 ; BASIC: RSHIFT(expr1,expr2)
                                   5713 ; logical shift right expr1 by 
                                   5714 ; expr2 bits.
                                   5715 ; output:
                                   5716 ; 	A 		TK_INTGR
                                   5717 ;   X 		result 
                                   5718 ;------------------------------
      001D63                       5719 rshift:
      009B05 02 27 03         [ 4] 5720 	call func_args
      009B08 CC 87            [ 1] 5721 	cp a,#2 
      009B0A E2 90            [ 1] 5722 	jreq 1$
      009B0C 93 55 00         [ 2] 5723 	jp syntax_error
      009B0F 04 00            [ 2] 5724 1$: popw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009B11 02               [ 2] 5725 	popw x
      009B12 CD 99            [ 2] 5726 	tnzw y 
      009B14 8D 25            [ 1] 5727 	jreq 4$
      009B16 05               [ 2] 5728 2$:	srlw x 
      009B17 A6 09            [ 2] 5729 	decw y 
      009B19 CC 87            [ 1] 5730 	jrne 2$
      001D79                       5731 4$:  
      009B1B E4 04            [ 1] 5732 	ld a,#TK_INTGR
      009B1C 81               [ 4] 5733 	ret
                                   5734 
                                   5735 ;--------------------------
                                   5736 ; BASIC: FCPU integer
                                   5737 ; set CPU frequency 
                                   5738 ;-------------------------- 
                                   5739 
      001D7C                       5740 fcpu:
      009B1C CE 00            [ 1] 5741 	ld a,#TK_INTGR
      009B1E 19 C6 00         [ 4] 5742 	call expect 
      009B21 1B               [ 1] 5743 	ld a,xl 
      009B22 20 0A            [ 1] 5744 	and a,#7 
      009B24 C7 50 C6         [ 1] 5745 	ld CLK_CKDIVR,a 
      009B24 AE               [ 4] 5746 	ret 
                                   5747 
                                   5748 ;------------------------------
                                   5749 ; BASIC: PMODE pin#, mode 
                                   5750 ; Arduino pin. 
                                   5751 ; define pin as input or output
                                   5752 ; pin#: {0..15}
                                   5753 ; mode: INPUT|OUTPUT  
                                   5754 ;------------------------------
                           000001  5755 	PINNO=1
                           000001  5756 	VSIZE=1
      001D88                       5757 pin_mode:
      001D88                       5758 	_vars VSIZE 
      009B25 01 00            [ 2]    1     sub sp,#VSIZE 
      009B27 4F CF 00         [ 4] 5759 	call arg_list 
      009B2A 19 C7            [ 1] 5760 	cp a,#2 
      009B2C 00 1B            [ 1] 5761 	jreq 1$
      009B2E CC 07 62         [ 2] 5762 	jp syntax_error 
      009B2E CF 00            [ 2] 5763 1$: popw y ; mode 
      009B30 1C               [ 2] 5764 	popw x ; Dx pin 
      009B31 C7 00 1E         [ 4] 5765 	call select_pin 
      009B34 4B 04            [ 1] 5766 	ld (PINNO,sp),a  
      009B36 5F 01            [ 1] 5767 	ld a,#1 
      009B37 0D 01            [ 1] 5768 	tnz (PINNO,sp)
      009B37 4F CD            [ 1] 5769 	jreq 4$
      009B39 81               [ 1] 5770 2$:	sll a 
      009B3A 71 5C            [ 1] 5771 	dec (PINNO,sp)
      009B3C 0A 01            [ 1] 5772 	jrne 2$ 
      009B3E 26 F7            [ 1] 5773 	ld (PINNO,sp),a
      009B40 84 81            [ 1] 5774 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009B42 E7 03            [ 1] 5775 	ld (GPIO_CR1,x),a 
      009B42 52 02 5F 1F      [ 2] 5776 4$:	cpw y,#OUTP 
      009B46 01 CF            [ 1] 5777 	jreq 6$
                                   5778 ; input mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009B48 00 1A            [ 1] 5779 	ld a,(PINNO,sp)
      009B4A 35               [ 1] 5780 	cpl a 
      009B4B 01 00            [ 1] 5781 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009B4D 19 0A            [ 2] 5782 	jra 9$
      009B4E                       5783 6$: ;output mode  
      009B4E 5F 92            [ 1] 5784 	ld a,(PINNO,sp)
      009B50 AF 00            [ 1] 5785 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009B52 19 27            [ 1] 5786 	ld (GPIO_CR2,x),a 
      009B54 39 01            [ 1] 5787 	ld a,(PINNO,sp)
      009B55 EA 02            [ 1] 5788 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009B55 92 AF            [ 1] 5789 9$:	ld (GPIO_DDR,x),a 
      001DC6                       5790 	_drop VSIZE 
      009B57 00 19            [ 2]    1     addw sp,#VSIZE 
      009B59 27               [ 4] 5791 	ret
                                   5792 
                                   5793 ;------------------------
                                   5794 ; select Arduino pin 
                                   5795 ; input:
                                   5796 ;   X 	 {0..15} Arduino Dx 
                                   5797 ; output:
                                   5798 ;   A     stm8s208 pin 
                                   5799 ;   X     base address s208 GPIO port 
                                   5800 ;---------------------------
      001DC9                       5801 select_pin:
      009B5A 06               [ 2] 5802 	sllw x 
      009B5B CD 82 44         [ 2] 5803 	addw x,#arduino_to_8s208 
      009B5E 5C               [ 2] 5804 	ldw x,(x)
      009B5F 20               [ 1] 5805 	ld a,xl 
      009B60 F4               [ 1] 5806 	push a 
      009B61 5C               [ 1] 5807 	swapw x 
      009B62 A6 20            [ 1] 5808 	ld a,#5 
      009B64 CD               [ 4] 5809 	mul x,a 
      009B65 82 44 92         [ 2] 5810 	addw x,#GPIO_BASE 
      009B68 AF               [ 1] 5811 	pop a 
      009B69 00               [ 4] 5812 	ret 
                                   5813 ; translation from Arduino D0..D15 to stm8s208rb 
      001DD9                       5814 arduino_to_8s208:
      009B6A 19 90                 5815 .byte 3,6 ; D0 
      009B6C 95 5C                 5816 .byte 3,5 ; D1 
      009B6E 92 AF                 5817 .byte 4,0 ; D2 
      009B70 00 19                 5818 .byte 2,1 ; D3
      009B72 5C 90                 5819 .byte 6,0 ; D4
      009B74 97 90                 5820 .byte 2,2 ; D5
      009B76 89 72                 5821 .byte 2,3 ; D6
      009B78 FB 01                 5822 .byte 3,1 ; D7
      009B7A 5C CD                 5823 .byte 3,3 ; D8
      009B7C 99 21                 5824 .byte 2,4 ; D9
      009B7E 85 CD                 5825 .byte 4,5 ; D10
      009B80 89 3A                 5826 .byte 2,6 ; D11
      009B82 A6 0D                 5827 .byte 2,7 ; D12
      009B84 CD 82                 5828 .byte 2,5 ; D13
      009B86 44 1E                 5829 .byte 4,2 ; D14
      009B88 01 5C                 5830 .byte 4,1 ; D15
                                   5831 
                                   5832 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5833 ;------------------------------
                                   5834 ; BASIC: RND(expr)
                                   5835 ; return random number 
                                   5836 ; between 1 and expr inclusive
                                   5837 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5838 ; input:
                                   5839 ; 	none 
                                   5840 ; output:
                                   5841 ;	X 		random positive integer 
                                   5842 ;------------------------------
      001DF9                       5843 random:
      009B8A 1F 01 20         [ 4] 5844 	call func_args 
      009B8D C0 01            [ 1] 5845 	cp a,#1
      009B8E 27 03            [ 1] 5846 	jreq 1$
      009B8E 1E 01 CD         [ 2] 5847 	jp syntax_error
      001E03                       5848 1$:  
      009B91 89 3A            [ 1] 5849 	ld a,#0x80 
      009B93 AE 9B            [ 1] 5850 	bcp a,(1,sp)
      009B95 C3 CD            [ 1] 5851 	jreq 2$
      009B97 82 57            [ 1] 5852 	ld a,#ERR_BAD_VALUE
      009B99 A6 FF C0         [ 2] 5853 	jp tb_error
      001E0E                       5854 2$: 
                                   5855 ; acc16=(x<<5)^x 
      009B9C 00 1E C7         [ 2] 5856 	ldw x,seedx 
      009B9F 00               [ 2] 5857 	sllw x 
      009BA0 0E               [ 2] 5858 	sllw x 
      009BA1 A6               [ 2] 5859 	sllw x 
      009BA2 7F               [ 2] 5860 	sllw x 
      009BA3 C2               [ 2] 5861 	sllw x 
      009BA4 00               [ 1] 5862 	ld a,xh 
      009BA5 1D C7 00         [ 1] 5863 	xor a,seedx 
      009BA8 0D A6 02         [ 1] 5864 	ld acc16,a 
      009BAB C2               [ 1] 5865 	ld a,xl 
      009BAC 00 1C C7         [ 1] 5866 	xor a,seedx+1 
      009BAF 00 0C 5F         [ 1] 5867 	ld acc8,a 
                                   5868 ; seedx=seedy 
      009BB2 A6 06 97         [ 2] 5869 	ldw x,seedy 
      009BB5 A6 0A CD         [ 2] 5870 	ldw seedx,x  
                                   5871 ; seedy=seedy^(seedy>>1)
      009BB8 88 F2            [ 2] 5872 	srlw y 
      009BBA AE 9B            [ 1] 5873 	ld a,yh 
      009BBC CB CD 82         [ 1] 5874 	xor a,seedy 
      009BBF 57 5B 02         [ 1] 5875 	ld seedy,a  
      009BC2 81 20            [ 1] 5876 	ld a,yl 
      009BC4 66 69 6C         [ 1] 5877 	xor a,seedy+1 
      009BC7 65 73 0A         [ 1] 5878 	ld seedy+1,a 
                                   5879 ; acc16>>3 
      009BCA 00 20 62         [ 2] 5880 	ldw x,acc16 
      009BCD 79               [ 2] 5881 	srlw x 
      009BCE 74               [ 2] 5882 	srlw x 
      009BCF 65               [ 2] 5883 	srlw x 
                                   5884 ; x=acc16^x 
      009BD0 73               [ 1] 5885 	ld a,xh 
      009BD1 20 66 72         [ 1] 5886 	xor a,acc16 
      009BD4 65               [ 1] 5887 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009BD5 65               [ 1] 5888 	ld a,xl 
      009BD6 0A 00 0D         [ 1] 5889 	xor a,acc8 
      009BD8 97               [ 1] 5890 	ld xl,a 
                                   5891 ; seedy=x^seedy 
      009BD8 52 02 72         [ 1] 5892 	xor a,seedy+1
      009BDB 5F               [ 1] 5893 	ld xl,a 
      009BDC 00               [ 1] 5894 	ld a,xh 
      009BDD 19 CD 90         [ 1] 5895 	xor a,seedy
      009BE0 77               [ 1] 5896 	ld xh,a 
      009BE1 A1 04 27         [ 2] 5897 	ldw seedy,x 
                                   5898 ; return seedy modulo expr + 1 
      009BE4 03 CC            [ 2] 5899 	popw y 
      009BE6 87               [ 2] 5900 	divw x,y 
      009BE7 E2               [ 1] 5901 	ldw x,y 
      009BE8 1F               [ 2] 5902 	incw x 
      001E5D                       5903 10$:
      009BE9 01 CD            [ 1] 5904 	ld a,#TK_INTGR
      009BEB 88               [ 4] 5905 	ret 
                                   5906 
                                   5907 ;---------------------------------
                                   5908 ; BASIC: WORDS 
                                   5909 ; affiche la listes des mots du
                                   5910 ; dictionnaire ainsi que le nombre
                                   5911 ; de mots.
                                   5912 ;---------------------------------
                           000001  5913 	WLEN=1 ; word length
                           000002  5914 	LLEN=2 ; character sent to console
                           000003  5915 	WCNT=3 ; count words printed 
                           000003  5916 	VSIZE=3 
      001E60                       5917 words:
      001E60                       5918 	_vars VSIZE
      009BEC A1 A1            [ 2]    1     sub sp,#VSIZE 
      009BEE 0D 27            [ 1] 5919 	clr (LLEN,sp)
      009BF0 02 20            [ 1] 5920 	clr (WCNT,sp)
      009BF2 19 CD 90 77      [ 2] 5921 	ldw y,#kword_dict+2
      009BF6 A1               [ 1] 5922 0$:	ldw x,y
      009BF7 04               [ 1] 5923 	ld a,(x)
      009BF8 27 03            [ 1] 5924 	and a,#15 
      009BFA CC 87            [ 1] 5925 	ld (WLEN,sp),a 
      009BFC E2 9F            [ 1] 5926 	inc (WCNT,sp)
      009BFE 1E               [ 2] 5927 1$:	incw x 
      009BFF 01               [ 1] 5928 	ld a,(x)
      009C00 CF 00 1A         [ 4] 5929 	call putc 
      009C03 5F CD            [ 1] 5930 	inc (LLEN,sp)
      009C05 81 71            [ 1] 5931 	dec (WLEN,sp)
      009C07 1E 01            [ 1] 5932 	jrne 1$
      009C09 5C 20            [ 1] 5933 	ld a,#70
      009C0B DC 02            [ 1] 5934 	cp a,(LLEN,sp)
      009C0C 2B 09            [ 1] 5935 	jrmi 2$   
      009C0C 5B 02            [ 1] 5936 	ld a,#SPACE 
      009C0E 81 01 C4         [ 4] 5937 	call putc 
      009C0F 0C 02            [ 1] 5938 	inc (LLEN,sp) 
      009C0F CD 8F            [ 2] 5939 	jra 3$
      009C11 92 A1            [ 1] 5940 2$: ld a,#CR 
      009C13 01 27 03         [ 4] 5941 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009C16 CC 87            [ 1] 5942 	clr (LLEN,sp)
      009C18 E2 85 9F A4      [ 2] 5943 3$:	subw y,#2 
      009C1C 7F 97            [ 2] 5944 	ldw y,(y)
      009C1E A6 03            [ 1] 5945 	jrne 0$ 
      009C20 81 0D            [ 1] 5946 	ld a,#CR 
      009C21 CD 01 C4         [ 4] 5947 	call putc  
      009C21 A6               [ 1] 5948 	clrw x 
      009C22 0B CD            [ 1] 5949 	ld a,(WCNT,sp)
      009C24 8F               [ 1] 5950 	ld xl,a 
      009C25 5E CD 88         [ 4] 5951 	call print_int 
      009C28 A1 A1 02         [ 2] 5952 	ldw x,#words_count_msg
      009C2B 27 07 A1         [ 4] 5953 	call puts 
      001EAD                       5954 	_drop VSIZE 
      009C2E 03 27            [ 2]    1     addw sp,#VSIZE 
      009C30 06               [ 4] 5955 	ret 
      009C31 CC 87 E2 72 64 73 20  5956 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5957 
                                   5958 
                                   5959 ;-----------------------------
                                   5960 ; BASIC: TIMER expr 
                                   5961 ; initialize count down timer 
                                   5962 ;-----------------------------
      009C34                       5963 set_timer:
      009C34 F6 5F 97         [ 4] 5964 	call arg_list
      009C37 A1 01            [ 1] 5965 	cp a,#1 
      009C37 89 A6            [ 1] 5966 	jreq 1$
      009C39 0C CD 8F         [ 2] 5967 	jp syntax_error
      001ED0                       5968 1$: 
      009C3C 5E               [ 2] 5969 	popw x 
      009C3D 85 A6 04         [ 2] 5970 	ldw timer,x 
      009C40 81               [ 4] 5971 	ret 
                                   5972 
                                   5973 ;------------------------------
                                   5974 ; BASIC: TIMEOUT 
                                   5975 ; return state of timer 
                                   5976 ;------------------------------
      009C41                       5977 timeout:
      009C41 CD 82 4D         [ 2] 5978 	ldw x,timer 
      001ED8                       5979 logical_complement:
      009C44 5F               [ 2] 5980 	cplw x 
      009C45 97 A6 04         [ 2] 5981 	cpw x,#-1
      009C48 81 01            [ 1] 5982 	jreq 2$
      009C49 5F               [ 1] 5983 	clrw x 
      009C49 5F 72            [ 1] 5984 2$:	ld a,#TK_INTGR
      009C4B 5D               [ 4] 5985 	ret 
                                   5986 
                                   5987 ;--------------------------------
                                   5988 ; BASIC NOT(expr) 
                                   5989 ; return logical complement of expr
                                   5990 ;--------------------------------
      001EE2                       5991 func_not:
      009C4C 00 28 27         [ 4] 5992 	call func_args  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009C4F 01 53            [ 1] 5993 	cp a,#1
      009C51 A6 04            [ 1] 5994 	jreq 1$
      009C53 81 07 62         [ 2] 5995 	jp syntax_error
      009C54 85               [ 2] 5996 1$:	popw x 
      009C54 CD 8F            [ 2] 5997 	jra logical_complement
                                   5998 
                                   5999 
                                   6000 
                                   6001 ;-----------------------------------
                                   6002 ; BASIC: IWDGEN expr1 
                                   6003 ; enable independant watchdog timer
                                   6004 ; expr1 is delay in multiple of 62.5µsec
                                   6005 ; expr1 -> {1..16383}
                                   6006 ;-----------------------------------
      001EEF                       6007 enable_iwdg:
      009C56 92 A1 02         [ 4] 6008 	call arg_list
      009C59 27 03            [ 1] 6009 	cp a,#1 
      009C5B CC 87            [ 1] 6010 	jreq 1$
      009C5D E2 07 62         [ 2] 6011 	jp syntax_error 
      009C5E 85               [ 2] 6012 1$: popw x 
      009C5E 1E 03            [ 1] 6013 	push #0
      009C60 2B 17 A3 00      [ 1] 6014 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009C64 09               [ 1] 6015 	ld a,xh 
      009C65 2A 12            [ 1] 6016 	and a,#0x3f
      009C67 A6               [ 1] 6017 	ld xh,a  
      009C68 05 42 1C         [ 2] 6018 2$:	cpw x,#255
      009C6B 50 00            [ 2] 6019 	jrule 3$
      009C6D 1F 03            [ 1] 6020 	inc (1,sp)
      009C6F 1E               [ 1] 6021 	rcf 
      009C70 01               [ 2] 6022 	rrcw x 
      009C71 72 FB            [ 2] 6023 	jra 2$
      009C73 03 A6 04 5B      [ 1] 6024 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C77 04               [ 1] 6025 	pop a  
      009C78 81 50 E1         [ 1] 6026 	ld IWDG_PR,a 
      009C79 9F               [ 1] 6027 	ld a,xl
      009C79 A6               [ 1] 6028 	dec a 
      009C7A 0A CC 87 E4      [ 1] 6029 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C7E C7 50 E2         [ 1] 6030 	ld IWDG_RLR,a 
      009C7E AE A6 80 A6      [ 1] 6031 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009C82 04               [ 4] 6032 	ret 
                                   6033 
                                   6034 
                                   6035 ;-----------------------------------
                                   6036 ; BASIC: IWDGREF  
                                   6037 ; refresh independant watchdog count down 
                                   6038 ; timer before it reset MCU. 
                                   6039 ;-----------------------------------
      001F25                       6040 refresh_iwdg:
      009C83 81 AA 50 E0      [ 1] 6041 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009C84 81               [ 4] 6042 	ret 
                                   6043 
                                   6044 
                                   6045 ;-------------------------------------
                                   6046 ; BASIC: LOG(expr)
                                   6047 ; return logarithm base 2 of expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6048 ; this is the position of most significant
                                   6049 ; bit set. 
                                   6050 ; input: 
                                   6051 ; output:
                                   6052 ;   X     log2 
                                   6053 ;   A     TK_INTGR 
                                   6054 ;*********************************
      001F2A                       6055 log2:
      009C84 90 89 CD         [ 4] 6056 	call func_args 
      009C87 8F 92            [ 1] 6057 	cp a,#1 
      009C89 A1 01            [ 1] 6058 	jreq 1$
      009C8B 27 07 A1         [ 2] 6059 	jp syntax_error 
      009C8E 02               [ 2] 6060 1$: popw x 
      001F35                       6061 leading_one:
      009C8F 27               [ 2] 6062 	tnzw x 
      009C90 03 CC            [ 1] 6063 	jreq 4$
      009C92 87 E2            [ 1] 6064 	ld a,#15 
      009C94 90               [ 2] 6065 2$: rlcw x 
      009C95 85 A1            [ 1] 6066     jrc 3$
      009C97 01               [ 1] 6067 	dec a 
      009C98 27 02            [ 2] 6068 	jra 2$
      009C9A 85               [ 1] 6069 3$: clrw x 
      009C9B 51               [ 1] 6070     ld xl,a
      009C9C 90 FD            [ 1] 6071 4$:	ld a,#TK_INTGR
      009C9E 90               [ 4] 6072 	ret 
                                   6073 
                                   6074 ;-----------------------------------
                                   6075 ; BASIC: BIT(expr) 
                                   6076 ; expr ->{0..15}
                                   6077 ; return 2^expr 
                                   6078 ; output:
                                   6079 ;    x    2^expr 
                                   6080 ;-----------------------------------
      001F45                       6081 bitmask:
      009C9F 85 81 12         [ 4] 6082     call func_args 
      009CA1 A1 01            [ 1] 6083 	cp a,#1
      009CA1 72 0D            [ 1] 6084 	jreq 1$
      009CA3 52 30 FB         [ 2] 6085 	jp syntax_error 
      009CA6 8E               [ 2] 6086 1$: popw x 
      009CA7 CC               [ 1] 6087 	ld a,xl 
      009CA8 85 6D            [ 1] 6088 	and a,#15
      009CAA 5F               [ 1] 6089 	clrw x 
      009CAA 72               [ 2] 6090 	incw x 
      009CAB 01               [ 1] 6091 2$: tnz a 
      009CAC 00 26            [ 1] 6092 	jreq 3$
      009CAE 07               [ 2] 6093 	slaw x 
      009CAF 27               [ 1] 6094 	dec a 
      009CB0 05 A6            [ 2] 6095 	jra 2$ 
      009CB2 07 CC            [ 1] 6096 3$: ld a,#TK_INTGR
      009CB4 87               [ 4] 6097 	ret 
                                   6098 
                                   6099 ;------------------------------
                                   6100 ; BASIC: INVERT(expr)
                                   6101 ; 1's complement 
                                   6102 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      001F5F                       6103 invert:
      009CB5 E4 0F 12         [ 4] 6104 	call func_args
      009CB6 A1 01            [ 1] 6105 	cp a,#1 
      009CB6 CD 88            [ 1] 6106 	jreq 1$
      009CB8 A1 26 08         [ 2] 6107 	jp syntax_error
      009CBB AE               [ 2] 6108 1$: popw x  
      009CBC 40               [ 2] 6109 	cplw x 
      009CBD 00 CD            [ 1] 6110 	ld a,#TK_INTGR 
      009CBF 82               [ 4] 6111 	ret 
                                   6112 
                                   6113 ;------------------------------
                                   6114 ; BASIC: DO 
                                   6115 ; initiate a DO ... UNTIL loop 
                                   6116 ;------------------------------
                           000003  6117 	DOLP_ADR=3 
                           000005  6118 	DOLP_INW=5
                           000004  6119 	VSIZE=4 
      001F6E                       6120 do_loop:
      009CC0 57               [ 2] 6121 	popw x 
      001F6F                       6122 	_vars VSIZE 
      009CC1 4F 81            [ 2]    1     sub sp,#VSIZE 
      009CC3 89               [ 2] 6123 	pushw x 
      009CC3 A1 02 27 03      [ 2] 6124 	ldw y,basicptr 
      009CC7 CC 87            [ 2] 6125 	ldw (DOLP_ADR,sp),y
      009CC9 E2 CE 00 00      [ 2] 6126 	ldw y,in.w 
      009CCA 17 05            [ 2] 6127 	ldw (DOLP_INW,sp),y
      009CCA 7D 26 08 CD      [ 1] 6128 	inc loop_depth 
      009CCE 86               [ 4] 6129 	ret 
                                   6130 
                                   6131 ;--------------------------------
                                   6132 ; BASIC: UNTIL expr 
                                   6133 ; loop if exprssion is false 
                                   6134 ; else terminate loop
                                   6135 ;--------------------------------
      001F83                       6136 until: 
      009CCF 32 72 5F 00      [ 1] 6137 	tnz loop_depth 
      009CD3 04 81            [ 1] 6138 	jrne 1$ 
      009CD5 89 90 93         [ 2] 6139 	jp syntax_error 
      001F8C                       6140 1$: 
      009CD8 CD 99 8D         [ 4] 6141 	call relation 
      009CDB 25 05            [ 1] 6142 	cp a,#TK_INTGR
      009CDD A6 09            [ 1] 6143 	jreq 2$
      009CDF CC 87 E4         [ 2] 6144 	jp syntax_error
      009CE2                       6145 2$: 
      009CE2 55               [ 2] 6146 	tnzw x 
      009CE3 00 04            [ 1] 6147 	jrne 9$
      009CE5 00 02            [ 2] 6148 	ldw x,(DOLP_ADR,sp)
      009CE7 72 5F 00         [ 2] 6149 	ldw basicptr,x 
      009CEA 19 AE            [ 1] 6150 	ld a,(2,x)
      009CEC 40 00 CF         [ 1] 6151 	ld count,a 
      009CEF 00 1A            [ 2] 6152 	ldw x,(DOLP_INW,sp)
      009CF1 1E 01 CD         [ 2] 6153 	ldw in.w,x 
      009CF4 82               [ 4] 6154 	ret 
      001FA9                       6155 9$:	; remove loop data from stack  
      009CF5 8B               [ 2] 6156 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      001FAA                       6157 	_drop VSIZE
      009CF6 5C 90            [ 2]    1     addw sp,#VSIZE 
      009CF8 85 89 5F CD      [ 1] 6158 	dec loop_depth 
      009CFC 81               [ 2] 6159 	jp (x)
                                   6160 
                                   6161 ;--------------------------
                                   6162 ; BASIC: PRTA...PRTI  
                                   6163 ;  return constant value 
                                   6164 ;  PORT  offset in GPIO
                                   6165 ;  array
                                   6166 ;---------------------------
      001FB1                       6167 const_porta:
      009CFD E6 5B 02         [ 2] 6168 	ldw x,#0
      009D00 81 04            [ 1] 6169 	ld a,#TK_INTGR 
      009D01 81               [ 4] 6170 	ret 
      001FB7                       6171 const_portb:
      009D01 72 0D 52         [ 2] 6172 	ldw x,#1
      009D04 30 FB            [ 1] 6173 	ld a,#TK_INTGR 
      009D06 72               [ 4] 6174 	ret 
      001FBD                       6175 const_portc:
      009D07 16 00 26         [ 2] 6176 	ldw x,#2
      009D0A 8E 81            [ 1] 6177 	ld a,#TK_INTGR 
      009D0C 81               [ 4] 6178 	ret 
      001FC3                       6179 const_portd:
      009D0C CD 90 77         [ 2] 6180 	ldw x,#3
      009D0F A1 04            [ 1] 6181 	ld a,#TK_INTGR 
      009D11 27               [ 4] 6182 	ret 
      001FC9                       6183 const_porte:
      009D12 03 CC 87         [ 2] 6184 	ldw x,#4
      009D15 E2 04            [ 1] 6185 	ld a,#TK_INTGR 
      009D16 81               [ 4] 6186 	ret 
      001FCF                       6187 const_portf:
      009D16 5D 27 04         [ 2] 6188 	ldw x,#5
      009D19 8F 5A            [ 1] 6189 	ld a,#TK_INTGR 
      009D1B 26               [ 4] 6190 	ret 
      001FD5                       6191 const_portg:
      009D1C F9 4F 81         [ 2] 6192 	ldw x,#6
      009D1F A6 04            [ 1] 6193 	ld a,#TK_INTGR 
      009D1F CD               [ 4] 6194 	ret 
      001FDB                       6195 const_porth:
      009D20 90 77 A1         [ 2] 6196 	ldw x,#7
      009D23 04 27            [ 1] 6197 	ld a,#TK_INTGR 
      009D25 03               [ 4] 6198 	ret 
      001FE1                       6199 const_porti:
      009D26 CC 87 E2         [ 2] 6200 	ldw x,#8
      009D29 A6 04            [ 1] 6201 	ld a,#TK_INTGR 
      009D29 A3               [ 4] 6202 	ret 
                                   6203 
                                   6204 ;-------------------------------
                                   6205 ; following return constant 
                                   6206 ; related to GPIO register offset 
                                   6207 ;---------------------------------
      001FE7                       6208 const_odr:
      009D2A 14 00            [ 1] 6209 	ld a,#TK_INTGR 
      009D2C 2B 0C 35         [ 2] 6210 	ldw x,#GPIO_ODR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009D2F 0F               [ 4] 6211 	ret 
      001FED                       6212 const_idr:
      009D30 50 F2            [ 1] 6213 	ld a,#TK_INTGR 
      009D32 A6 1E 62         [ 2] 6214 	ldw x,#GPIO_IDR
      009D35 A6               [ 4] 6215 	ret 
      001FF3                       6216 const_ddr:
      009D36 10 62            [ 1] 6217 	ld a,#TK_INTGR 
      009D38 20 1E 02         [ 2] 6218 	ldw x,#GPIO_DDR
      009D3A 81               [ 4] 6219 	ret 
      001FF9                       6220 const_cr1:
      009D3A A3 08            [ 1] 6221 	ld a,#TK_INTGR 
      009D3C 00 2B 09         [ 2] 6222 	ldw x,#GPIO_CR1
      009D3F 35               [ 4] 6223 	ret 
      001FFF                       6224 const_cr2:
      009D40 0E 50            [ 1] 6225 	ld a,#TK_INTGR 
      009D42 F2 A6 50         [ 2] 6226 	ldw x,#GPIO_CR2
      009D45 62               [ 4] 6227 	ret 
                                   6228 ;-------------------------
                                   6229 ;  constant for port mode
                                   6230 ;  used by PMODE 
                                   6231 ;  input or output
                                   6232 ;------------------------
      002005                       6233 const_output:
      009D46 20 10            [ 1] 6234 	ld a,#TK_INTGR 
      009D48 AE 00 01         [ 2] 6235 	ldw x,#OUTP
      009D48 35               [ 4] 6236 	ret 
      00200B                       6237 const_input:
      009D49 07 50            [ 1] 6238 	ld a,#TK_INTGR 
      009D4B F2 00 00         [ 2] 6239 	ldw x,#INP 
      009D4C 81               [ 4] 6240 	ret 
                                   6241 ;-----------------------
                                   6242 ; memory area constants
                                   6243 ;-----------------------
      002011                       6244 const_eeprom_base:
      009D4C A3 00            [ 1] 6245 	ld a,#TK_INTGR 
      009D4E 40 23 07         [ 2] 6246 	ldw x,#EEPROM_BASE 
      009D51 72               [ 4] 6247 	ret 
                                   6248 
                                   6249 ;---------------------------
                                   6250 ; BASIC: DATA 
                                   6251 ; when the interpreter find 
                                   6252 ; a DATA line it skip it.
                                   6253 ;---------------------------
      002017                       6254 data:
      009D52 5C 50 F2 54 20   [ 1] 6255 	mov in,count 
      009D57 F4               [ 4] 6256 	ret 
                                   6257 
                                   6258 ;---------------------------
                                   6259 ; BASIC: DATLN  *expr*
                                   6260 ; set DATA pointer at line# 
                                   6261 ; specified by *expr* 
                                   6262 ;---------------------------
      009D58                       6263 data_line:
      009D58 9F 4A 27         [ 4] 6264 	call expression
      009D5B 01 4A            [ 1] 6265 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009D5D 27 03            [ 1] 6266 	jreq 1$
      009D5D A4 3E C7         [ 2] 6267 	jp syntax_error 
      009D60 50 F1 72         [ 4] 6268 1$: call search_lineno
      009D63 18               [ 2] 6269 	tnzw x 
      009D64 50 F0            [ 1] 6270 	jrne 3$
      009D66 8E 81            [ 1] 6271 2$:	ld a,#ERR_NO_LINE 
      009D68 CC 07 64         [ 2] 6272 	jp tb_error
      002032                       6273 3$: ; check if valid data line 
      009D68 CE 00            [ 1] 6274     ldw y,x 
      009D6A 11 A6            [ 2] 6275 	ldw x,(4,x)
      009D6C 04 81 17         [ 2] 6276 	cpw x,#data 
      009D6E 26 F2            [ 1] 6277 	jrne 2$ 
      009D6E CD 8F 92 A1      [ 2] 6278 	ldw data_ptr,y
      009D72 01 27 03         [ 1] 6279 	ld a,(2,y)
      009D75 CC 87 E2         [ 1] 6280 	ld data_len,a 
      009D78 35 06 00 08      [ 1] 6281 	mov data_ofs,#FIRST_DATA_ITEM 
      009D78 85               [ 4] 6282 	ret
                                   6283 
                                   6284 ;---------------------------------
                                   6285 ; BASIC: RESTORE 
                                   6286 ; set data_ptr to first data line
                                   6287 ; if not DATA found pointer set to
                                   6288 ; zero 
                                   6289 ;---------------------------------
      00204A                       6290 restore:
      009D79 9E A5 80 27      [ 1] 6291 	clr data_ptr 
      009D7D 01 50 A6 04      [ 1] 6292 	clr data_ptr+1
      009D81 81 5F 00 08      [ 1] 6293 	clr data_ofs 
      009D82 72 5F 00 09      [ 1] 6294 	clr data_len
      009D82 CD 8F 92         [ 2] 6295 	ldw x,txtbgn
      00205D                       6296 data_search_loop: 	
      009D85 A1 02 27         [ 2] 6297 	cpw x,txtend
      009D88 03 CC            [ 1] 6298 	jruge 9$
      009D8A 87 E2            [ 1] 6299 	ldw y,x 
      009D8C 85 9E            [ 2] 6300 	ldw x,(4,x)
      009D8E 14 01 95         [ 2] 6301 	cpw x,#data 
      009D91 9F 14            [ 1] 6302 	jrne try_next_line 
      009D93 02 97 5B 02      [ 2] 6303 	ldw data_ptr,y 
      009D97 A6 04 81         [ 1] 6304 	ld a,(2,y)
      009D9A C7 00 09         [ 1] 6305 	ld data_len,a 
      009D9A CD 8F 92 A1      [ 1] 6306 	mov data_ofs,#FIRST_DATA_ITEM
      009D9E 02 27 03 CC      [ 1] 6307 9$:	tnz data_len 
      009DA2 87 E2            [ 1] 6308     jrne 10$
      009DA4 A6 0C            [ 1] 6309 	ld a,#ERR_NO_DATA 
      009DA4 85 9E 1A         [ 2] 6310 	jp tb_error 
      009DA7 01               [ 4] 6311 10$:ret
      002085                       6312 try_next_line:
      009DA8 95               [ 1] 6313 	ldw x,y 
      009DA9 9F 1A            [ 1] 6314 	ld a,(2,x)
      009DAB 02 97 5B         [ 1] 6315 	ld acc8,a 
      009DAE 02 A6 04 81      [ 1] 6316 	clr acc16 
      009DB2 72 BB 00 0C      [ 2] 6317 	addw x,acc16 
      009DB2 CD 8F            [ 2] 6318 	jra data_search_loop
                                   6319 
                                   6320 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6321 ;---------------------------------
                                   6322 ; BASIC: READ 
                                   6323 ; return next data item | 0 
                                   6324 ;---------------------------------
                           000001  6325 	CTX_BPTR=1 
                           000003  6326 	CTX_IN=3 
                           000004  6327 	CTX_COUNT=4 
                           000005  6328 	XSAVE=5
                           000006  6329 	VSIZE=6
      002095                       6330 read:
      002095                       6331 	_vars  VSIZE 
      009DB4 92 A1            [ 2]    1     sub sp,#VSIZE 
      002097                       6332 read01:	
      009DB6 02 27 03         [ 1] 6333 	ld a,data_ofs
      009DB9 CC 87 E2         [ 1] 6334 	cp a,data_len 
      009DBC 27 37            [ 1] 6335 	jreq 2$ ; end of line  
      009DBC 85 9E 18         [ 4] 6336 	call save_context
      009DBF 01 95 9F         [ 2] 6337 	ldw x,data_ptr 
      009DC2 18 02 97         [ 2] 6338 	ldw basicptr,x 
      009DC5 5B 02 A6 04 81   [ 1] 6339 	mov in,data_ofs 
      009DCA 55 00 09 00 03   [ 1] 6340 	mov count,data_len  
      009DCA CD 8F 92         [ 4] 6341 	call expression 
      009DCD A1 02            [ 1] 6342 	cp a,#TK_INTGR 
      009DCF 27 03            [ 1] 6343 	jreq 1$ 
      009DD1 CC 87 E2         [ 2] 6344 	jp syntax_error 
      0020BC                       6345 1$:
      009DD4 90 85            [ 2] 6346 	ldw (XSAVE,SP),x
      009DD6 85 90 5D         [ 4] 6347 	call next_token ; skip comma
      009DD9 27 05 58         [ 2] 6348 	ldw x,basicptr 
      009DDC 90 5A 26         [ 2] 6349 	ldw data_ptr,x 
      009DDF FB 00 01 00 08   [ 1] 6350 	mov data_ofs,in 
      009DE0 CD 14 51         [ 4] 6351 	call rest_context
      009DE0 A6 04            [ 2] 6352 	ldw x,(XSAVE,sp)
      009DE2 81 04            [ 1] 6353 	ld a,#TK_INTGR
      009DE3                       6354 	_drop VSIZE 
      009DE3 CD 8F            [ 2]    1     addw sp,#VSIZE 
      009DE5 92               [ 4] 6355 	ret 
      0020D6                       6356 2$: ; end of line reached 
      009DE6 A1 02 27 03      [ 2] 6357 	ldw y, data_ptr 
      009DEA CC 87 E2 90      [ 1] 6358 	clr data_ptr
      009DEE 85 85 90 5D      [ 1] 6359 	clr data_ptr+1   
      009DF2 27 05 54 90      [ 1] 6360 	clr data_ofs 
      009DF6 5A 26 FB 09      [ 1] 6361 	clr data_len 
      009DF9 CD 20 85         [ 4] 6362 	call try_next_line 
      009DF9 A6 04            [ 2] 6363 	jra read01
                                   6364 
                                   6365 
                                   6366 ;---------------------------------
                                   6367 ; BASIC: SPIEN clkdiv, 0|1  
                                   6368 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6369 ; if clkdiv==-1 disable SPI
                                   6370 ; 0|1 -> disable|enable  
                                   6371 ;--------------------------------- 
                           000005  6372 SPI_CS_BIT=5
      0020EF                       6373 spi_enable:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009DFB 81 0E EB         [ 4] 6374 	call arg_list 
      009DFC A1 02            [ 1] 6375 	cp a,#2
      009DFC A6 04            [ 1] 6376 	jreq 1$
      009DFE CD 8F 5E         [ 2] 6377 	jp syntax_error 
      0020F9                       6378 1$: 
      009E01 9F A4 07 C7      [ 1] 6379 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009E05 50               [ 2] 6380 	popw x  
      009E06 C6 81            [ 1] 6381 	jreq spi_disable 
      009E08 85               [ 2] 6382 	popw x 
      009E08 52 01            [ 1] 6383 	ld a,#(1<<SPI_CR1_BR)
      009E0A CD               [ 4] 6384 	mul x,a 
      009E0B 8F               [ 1] 6385 	ld a,xl 
      009E0C 6B A1 02         [ 1] 6386 	ld SPI_CR1,a 
                                   6387 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009E0F 27 03 CC 87      [ 1] 6388 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009E13 E2 90 85 85      [ 1] 6389 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6390 ; configure SPI as master mode 0.	
      009E17 CD 9E 49 6B      [ 1] 6391 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6392 ; ~CS line controlled by sofware 	
      009E1B 01 A6 01 0D      [ 1] 6393 	bset SPI_CR2,#SPI_CR2_SSM 
      009E1F 01 27 0B 48      [ 1] 6394     bset SPI_CR2,#SPI_CR2_SSI 
                                   6395 ; enable SPI
      009E23 0A 01 26 FB      [ 1] 6396 	bset SPI_CR1,#SPI_CR1_SPE 	
      009E27 6B               [ 4] 6397 	ret 
      002121                       6398 spi_disable:
      002121                       6399 	_drop #2; throw first argument.
      009E28 01 EA            [ 2]    1     addw sp,##2 
                                   6400 ; wait spi idle 
      009E2A 03 E7            [ 1] 6401 1$:	ld a,#0x82 
      009E2C 03 90 A3         [ 1] 6402 	and a,SPI_SR
      009E2F 00 01            [ 1] 6403 	cp a,#2 
      009E31 27 07            [ 1] 6404 	jrne 1$
      009E33 7B 01 43 E4      [ 1] 6405 	bres SPI_CR1,#SPI_CR1_SPE
      009E37 02 20 0A C7      [ 1] 6406 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009E3A 72 1B 50 16      [ 1] 6407 	bres PE_DDR,#SPI_CS_BIT 
      009E3A 7B               [ 4] 6408 	ret 
                                   6409 
      002139                       6410 spi_clear_error:
      009E3B 01 EA            [ 1] 6411 	ld a,#0x78 
      009E3D 04 E7 04         [ 1] 6412 	bcp a,SPI_SR 
      009E40 7B 01            [ 1] 6413 	jreq 1$
      009E42 EA 02 E7 02      [ 1] 6414 	clr SPI_SR 
      009E46 5B               [ 4] 6415 1$: ret 
                                   6416 
      002145                       6417 spi_send_byte:
      009E47 01               [ 1] 6418 	push a 
      009E48 81 21 39         [ 4] 6419 	call spi_clear_error
      009E49 84               [ 1] 6420 	pop a 
      009E49 58 1C 9E 59 FE   [ 2] 6421 	btjf SPI_SR,#SPI_SR_TXE,.
      009E4E 9F 88 5E         [ 1] 6422 	ld SPI_DR,a
      009E51 A6 05 42 1C 50   [ 2] 6423 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009E56 00 84 81         [ 1] 6424 	ld a,SPI_DR 
      009E59 81               [ 4] 6425 	ret 
                                   6426 
      00215B                       6427 spi_rcv_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009E59 03 06            [ 1] 6428 	ld a,#255
      009E5B 03 05 04 00 02   [ 2] 6429 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009E60 01 06 00         [ 1] 6430 	ld a,SPI_DR 
      009E63 02               [ 4] 6431 	ret
                                   6432 
                                   6433 ;------------------------------
                                   6434 ; BASIC: SPIWR byte [,byte]
                                   6435 ; write 1 or more byte
                                   6436 ;------------------------------
      002166                       6437 spi_write:
      009E64 02 02 03         [ 4] 6438 	call expression
      009E67 03 01            [ 1] 6439 	cp a,#TK_INTGR 
      009E69 03 03            [ 1] 6440 	jreq 1$
      009E6B 02 04 04         [ 2] 6441 	jp syntax_error 
      002170                       6442 1$:	
      009E6E 05               [ 1] 6443 	ld a,xl 
      009E6F 02 06 02         [ 4] 6444 	call spi_send_byte 
      009E72 07 02 05         [ 4] 6445 	call next_token 
      009E75 04 02            [ 1] 6446 	cp a,#TK_COMMA 
      009E77 04 01            [ 1] 6447 	jrne 2$ 
      009E79 20 E9            [ 2] 6448 	jra spi_write 
      009E79 CD               [ 1] 6449 2$:	tnz a 
      009E7A 8F 92            [ 1] 6450 	jreq 3$
      002180                       6451 	_unget_token  
      009E7C A1 01 27 03 CC   [ 1]    1     mov in,in.saved
      009E81 87               [ 4] 6452 3$:	ret 
                                   6453 
                                   6454 
                                   6455 ;-------------------------------
                                   6456 ; BASIC: SPIRD 	
                                   6457 ; read one byte from SPI 
                                   6458 ;-------------------------------
      002186                       6459 spi_read:
      009E82 E2 21 5B         [ 4] 6460 	call spi_rcv_byte 
      009E83 5F               [ 1] 6461 	clrw x 
      009E83 A6               [ 1] 6462 	ld xl,a 
      009E84 80 15            [ 1] 6463 	ld a,#TK_INTGR 
      009E86 01               [ 4] 6464 	ret 
                                   6465 
                                   6466 ;------------------------------
                                   6467 ; BASIC: SPISEL 0|1 
                                   6468 ; set state of ~CS line
                                   6469 ; 0|1 deselect|select  
                                   6470 ;------------------------------
      00218E                       6471 spi_select:
      009E87 27 05 A6         [ 4] 6472 	call next_token 
      009E8A 0A CC            [ 1] 6473 	cp a,#TK_INTGR 
      009E8C 87 E4            [ 1] 6474 	jreq 1$
      009E8E CC 07 62         [ 2] 6475 	jp syntax_error 
      009E8E CE               [ 2] 6476 1$: tnzw x  
      009E8F 00 15            [ 1] 6477 	jreq cs_high 
      009E91 58 58 58 58      [ 1] 6478 	bres PE_ODR,#SPI_CS_BIT
      009E95 58               [ 4] 6479 	ret 
      0021A0                       6480 cs_high: 
      009E96 9E C8 00 15      [ 1] 6481 	bset PE_ODR,#SPI_CS_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009E9A C7               [ 4] 6482 	ret 
                                   6483 
                                   6484 
                                   6485 ;------------------------------
                                   6486 ; BASIC: FILERX
                                   6487 ; Use to receive a BASIC program
                                   6488 ; from the PC using XMODEM 
                                   6489 ; protocol. The file is store in
                                   6490 ; Each line received is compiled
                                   6491 ; then stored in RAM. When reception 
                                   6492 ; is completed with success  the 
                                   6493 ; program is ready to be executed 
                                   6494 ; or save as local file.
                                   6495 ;--------------------------------
      0021A5                       6496 file_receive:
      009E9B 00 0D 9F C8 00   [ 2] 6497 	btjf flags,#FRUN,1$
      009EA0 16 C7            [ 1] 6498 	ld a,#ERR_CMD_ONLY
      009EA2 00 0E CE         [ 2] 6499 	jp tb_error 
      0021AF                       6500 1$:	
      009EA5 00 17 CF         [ 4] 6501 	call clear_basic
      009EA8 00 15 90         [ 2] 6502 	ldw x, txtbgn
      009EAB 54 90 9E         [ 4] 6503 	call xreceive 
      009EAE C8 00 17 C7      [ 2] 6504 	addw x,txtbgn 
      009EB2 00 17 90         [ 2] 6505 	ldw txtend,x 
      009EB5 9F C8 00         [ 4] 6506 	call print_int 
      009EB8 18 C7 00         [ 2] 6507 	ldw x,#fsize_msg 
      009EBB 18 CE 00         [ 4] 6508 	call puts 
      009EBE 0D               [ 4] 6509 	ret 
      009EBF 54 54 54 9E C8 00 0D  6510 fsize_msg: .asciz " bytes received\n"
             95 9F C8 00 0E 97 C8
             00 18 97
                                   6511 
                                   6512 ;------------------------------
                                   6513 ; BASIC: FILETX "file_name" 
                                   6514 ; Transmit the program in RAM 
                                   6515 ; To the PC using XMODEM protocol.
                                   6516 ; The file transmitted as source 
                                   6517 ; file not tokenized. 
                                   6518 ;-------------------------------
      0021DA                       6519 file_transmit:
                                   6520 
      009ED0 9E               [ 4] 6521 	ret 
                                   6522 
                                   6523 
                                   6524 ;------------------------------
                                   6525 ;      dictionary 
                                   6526 ; format:
                                   6527 ;   link:   2 bytes 
                                   6528 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6529 ;   cmd_name: 16 byte max 
                                   6530 ;   code_address: 2 bytes 
                                   6531 ;------------------------------
                                   6532 	.macro _dict_entry len,name,cmd 
                                   6533 	.word LINK 
                                   6534 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   6535 name:
                                   6536 	.byte len 	
                                   6537 	.ascii "name"
                                   6538 	.word cmd 
                                   6539 	.endm 
                                   6540 
                           000000  6541 	LINK=0
                                   6542 ; respect alphabetic order for BASIC names from Z-A
                                   6543 ; this sort order is for a cleaner WORDS cmd output. 	
      0021DB                       6544 kword_end:
      0021DB                       6545 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009ED1 C8 00                    1 	.word LINK 
                           0021DD     2 	LINK=.
      0021DD                          3 XPEEK:
      009ED3 17                       4 	.byte 5+F_IFUNC 	
      009ED4 95 CF 00 17 90           5 	.ascii "XPEEK"
      009ED9 85 65                    6 	.word xpeek 
      0021E5                       6546 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009EDB 93 5C                    1 	.word LINK 
                           0021E7     2 	LINK=.
      009EDD                          3 XOR:
      009EDD A6                       4 	.byte 3+F_IFUNC 	
      009EDE 04 81 52                 5 	.ascii "XOR"
      009EE0 1D 32                    6 	.word bit_xor 
      0021ED                       6547 	_dict_entry,5,WRITE,write  
      009EE0 52 03                    1 	.word LINK 
                           0021EF     2 	LINK=.
      0021EF                          3 WRITE:
      009EE2 0F                       4 	.byte 5 	
      009EE3 02 0F 03 90 AE           5 	.ascii "WRITE"
      009EE8 A6 03                    6 	.word write 
      0021F7                       6548 	_dict_entry,5,WORDS,words 
      009EEA 93 F6                    1 	.word LINK 
                           0021F9     2 	LINK=.
      0021F9                          3 WORDS:
      009EEC A4                       4 	.byte 5 	
      009EED 0F 6B 01 0C 03           5 	.ascii "WORDS"
      009EF2 5C F6                    6 	.word words 
      002201                       6549 	_dict_entry 4,WAIT,wait 
      009EF4 CD 82                    1 	.word LINK 
                           002203     2 	LINK=.
      002203                          3 WAIT:
      009EF6 44                       4 	.byte 4 	
      009EF7 0C 02 0A 01              5 	.ascii "WAIT"
      009EFB 26 F5                    6 	.word wait 
      00220A                       6550 	_dict_entry,3+F_IFUNC,USR,usr
      009EFD A6 46                    1 	.word LINK 
                           00220C     2 	LINK=.
      00220C                          3 USR:
      009EFF 11                       4 	.byte 3+F_IFUNC 	
      009F00 02 2B 09                 5 	.ascii "USR"
      009F03 A6 20                    6 	.word usr 
      002212                       6551 	_dict_entry,5,UNTIL,until 
      009F05 CD 82                    1 	.word LINK 
                           002214     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      002214                          3 UNTIL:
      009F07 44                       4 	.byte 5 	
      009F08 0C 02 20 07 A6           5 	.ascii "UNTIL"
      009F0D 0D CD                    6 	.word until 
      00221C                       6552 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009F0F 82 44                    1 	.word LINK 
                           00221E     2 	LINK=.
      00221E                          3 UFLASH:
      009F11 0F                       4 	.byte 6+F_IFUNC 	
      009F12 02 72 A2 00 02 90        5 	.ascii "UFLASH"
      009F18 FE 26                    6 	.word uflash 
      002227                       6553 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009F1A CF A6                    1 	.word LINK 
                           002229     2 	LINK=.
      002229                          3 UBOUND:
      009F1C 0D                       4 	.byte 6+F_IFUNC 	
      009F1D CD 82 44 5F 7B 03        5 	.ascii "UBOUND"
      009F23 97 CD                    6 	.word ubound 
      002232                       6554 	_dict_entry,4,TONE,tone  
      009F25 89 3A                    1 	.word LINK 
                           002234     2 	LINK=.
      002234                          3 TONE:
      009F27 AE                       4 	.byte 4 	
      009F28 9F 30 CD 82              5 	.ascii "TONE"
      009F2C 57 5B                    6 	.word tone 
      00223B                       6555 	_dict_entry,2,TO,to
      009F2E 03 81                    1 	.word LINK 
                           00223D     2 	LINK=.
      00223D                          3 TO:
      009F30 20                       4 	.byte 2 	
      009F31 77 6F                    5 	.ascii "TO"
      009F33 72 64                    6 	.word to 
      002242                       6556 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009F35 73 20                    1 	.word LINK 
                           002244     2 	LINK=.
      002244                          3 TIMEOUT:
      009F37 69                       4 	.byte 7+F_IFUNC 	
      009F38 6E 20 64 69 63 74 69     5 	.ascii "TIMEOUT"
      009F3F 6F 6E                    6 	.word timeout 
      00224E                       6557 	_dict_entry,5,TIMER,set_timer
      009F41 61 72                    1 	.word LINK 
                           002250     2 	LINK=.
      002250                          3 TIMER:
      009F43 79                       4 	.byte 5 	
      009F44 0A 00 4D 45 52           5 	.ascii "TIMER"
      009F46 1E C6                    6 	.word set_timer 
      002258                       6558 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009F46 CD 8F                    1 	.word LINK 
                           00225A     2 	LINK=.
      00225A                          3 TICKS:
      009F48 6B                       4 	.byte 5+F_IFUNC 	
      009F49 A1 01 27 03 CC           5 	.ascii "TICKS"
      009F4E 87 E2                    6 	.word get_ticks 
      009F50                       6559 	_dict_entry,4,STOP,stop 
      009F50 85 CF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



                           002264     2 	LINK=.
      002264                          3 STOP:
      009F52 00                       4 	.byte 4 	
      009F53 13 81 4F 50              5 	.ascii "STOP"
      009F55 18 4A                    6 	.word stop 
      00226B                       6560 	_dict_entry,4,STEP,step 
      009F55 CE 00                    1 	.word LINK 
                           00226D     2 	LINK=.
      00226D                          3 STEP:
      009F57 13                       4 	.byte 4 	
      009F58 53 54 45 50              5 	.ascii "STEP"
      009F58 53 A3                    6 	.word step 
      002274                       6561 	_dict_entry,5,SPIWR,spi_write
      009F5A FF FF                    1 	.word LINK 
                           002276     2 	LINK=.
      002276                          3 SPIWR:
      009F5C 27                       4 	.byte 5 	
      009F5D 01 5F A6 04 81           5 	.ascii "SPIWR"
      009F62 21 66                    6 	.word spi_write 
      00227E                       6562 	_dict_entry,6,SPISEL,spi_select
      009F62 CD 8F                    1 	.word LINK 
                           002280     2 	LINK=.
      002280                          3 SPISEL:
      009F64 92                       4 	.byte 6 	
      009F65 A1 01 27 03 CC 87        5 	.ascii "SPISEL"
      009F6B E2 85                    6 	.word spi_select 
      002289                       6563 	_dict_entry,5,SPIEN,spi_enable 
      009F6D 20 E9                    1 	.word LINK 
                           00228B     2 	LINK=.
      009F6F                          3 SPIEN:
      009F6F CD                       4 	.byte 5 	
      009F70 8F 6B A1 01 27           5 	.ascii "SPIEN"
      009F75 03 CC                    6 	.word spi_enable 
      002293                       6564 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      009F77 87 E2                    1 	.word LINK 
                           002295     2 	LINK=.
      002295                          3 SPIRD:
      009F79 85                       4 	.byte 5+F_IFUNC 	
      009F7A 4B 00 35 CC 50           5 	.ascii "SPIRD"
      009F7F E0 9E                    6 	.word spi_read 
      00229D                       6565 	_dict_entry,5,SLEEP,sleep 
      009F81 A4 3F                    1 	.word LINK 
                           00229F     2 	LINK=.
      00229F                          3 SLEEP:
      009F83 95                       4 	.byte 5 	
      009F84 A3 00 FF 23 06           5 	.ascii "SLEEP"
      009F89 0C 01                    6 	.word sleep 
      0022A7                       6566 	_dict_entry,4+F_IFUNC,SIZE,size
      009F8B 98 56                    1 	.word LINK 
                           0022A9     2 	LINK=.
      0022A9                          3 SIZE:
      009F8D 20                       4 	.byte 4+F_IFUNC 	
      009F8E F5 35 55 50              5 	.ascii "SIZE"
      009F92 E0 84                    6 	.word size 
      0022B0                       6567     _dict_entry,4,SHOW,show 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009F94 C7 50                    1 	.word LINK 
                           0022B2     2 	LINK=.
      0022B2                          3 SHOW:
      009F96 E1                       4 	.byte 4 	
      009F97 9F 4A 35 55              5 	.ascii "SHOW"
      009F9B 50 E0                    6 	.word show 
      0022B9                       6568 	_dict_entry,4,SAVE,save
      009F9D C7 50                    1 	.word LINK 
                           0022BB     2 	LINK=.
      0022BB                          3 SAVE:
      009F9F E2                       4 	.byte 4 	
      009FA0 35 AA 50 E0              5 	.ascii "SAVE"
      009FA4 81 58                    6 	.word save 
      009FA5                       6569 	_dict_entry 3,RUN,run
      009FA5 35 AA                    1 	.word LINK 
                           0022C4     2 	LINK=.
      0022C4                          3 RUN:
      009FA7 50                       4 	.byte 3 	
      009FA8 E0 81 4E                 5 	.ascii "RUN"
      009FAA 16 D1                    6 	.word run 
      0022CA                       6570 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009FAA CD 8F                    1 	.word LINK 
                           0022CC     2 	LINK=.
      0022CC                          3 RSHIFT:
      009FAC 92                       4 	.byte 6+F_IFUNC 	
      009FAD A1 01 27 03 CC 87        5 	.ascii "RSHIFT"
      009FB3 E2 85                    6 	.word rshift 
      009FB5                       6571 	_dict_entry,3+F_IFUNC,RND,random 
      009FB5 5D 27                    1 	.word LINK 
                           0022D7     2 	LINK=.
      0022D7                          3 RND:
      009FB7 0A                       4 	.byte 3+F_IFUNC 	
      009FB8 A6 0F 59                 5 	.ascii "RND"
      009FBB 25 03                    6 	.word random 
      0022DD                       6572 	_dict_entry,6,RETURN,return 
      009FBD 4A 20                    1 	.word LINK 
                           0022DF     2 	LINK=.
      0022DF                          3 RETURN:
      009FBF FA                       4 	.byte 6 	
      009FC0 5F 97 A6 04 81 4E        5 	.ascii "RETURN"
      009FC5 16 B3                    6 	.word return 
      0022E8                       6573 	_dict_entry,7,RESTORE,restore 
      009FC5 CD 8F                    1 	.word LINK 
                           0022EA     2 	LINK=.
      0022EA                          3 RESTORE:
      009FC7 92                       4 	.byte 7 	
      009FC8 A1 01 27 03 CC 87 E2     5 	.ascii "RESTORE"
      009FCF 85 9F                    6 	.word restore 
      0022F4                       6574 	_dict_entry 6,REMARK,remark 
      009FD1 A4 0F                    1 	.word LINK 
                           0022F6     2 	LINK=.
      0022F6                          3 REMARK:
      009FD3 5F                       4 	.byte 6 	
      009FD4 5C 4D 27 04 58 4A        5 	.ascii "REMARK"
      009FDA 20 F9                    6 	.word remark 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0022FF                       6575 	_dict_entry,6,REBOOT,cold_start
      009FDC A6 04                    1 	.word LINK 
                           002301     2 	LINK=.
      002301                          3 REBOOT:
      009FDE 81                       4 	.byte 6 	
      009FDF 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      009FDF CD 8F                    6 	.word cold_start 
      00230A                       6576 	_dict_entry,4+F_IFUNC,READ,read  
      009FE1 92 A1                    1 	.word LINK 
                           00230C     2 	LINK=.
      00230C                          3 READ:
      009FE3 01                       4 	.byte 4+F_IFUNC 	
      009FE4 27 03 CC 87              5 	.ascii "READ"
      009FE8 E2 85                    6 	.word read 
      002313                       6577 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009FEA 53 A6                    1 	.word LINK 
                           002315     2 	LINK=.
      002315                          3 QKEY:
      009FEC 04                       4 	.byte 4+F_IFUNC 	
      009FED 81 4B 45 59              5 	.ascii "QKEY"
      009FEE 1B C9                    6 	.word qkey 
      00231C                       6578 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      009FEE 85 52                    1 	.word LINK 
                           00231E     2 	LINK=.
      00231E                          3 PRTI:
      009FF0 04                       4 	.byte 4+F_IFUNC 	
      009FF1 89 90 CE 00              5 	.ascii "PRTI"
      009FF5 05 17                    6 	.word const_porti 
      002325                       6579 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      009FF7 03 90                    1 	.word LINK 
                           002327     2 	LINK=.
      002327                          3 PRTH:
      009FF9 CE                       4 	.byte 4+F_IFUNC 	
      009FFA 00 01 17 05              5 	.ascii "PRTH"
      009FFE 72 5C                    6 	.word const_porth 
      00232E                       6580 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A000 00 23                    1 	.word LINK 
                           002330     2 	LINK=.
      002330                          3 PRTG:
      00A002 81                       4 	.byte 4+F_IFUNC 	
      00A003 50 52 54 47              5 	.ascii "PRTG"
      00A003 72 5D                    6 	.word const_portg 
      002337                       6581 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A005 00 23                    1 	.word LINK 
                           002339     2 	LINK=.
      002339                          3 PRTF:
      00A007 26                       4 	.byte 4+F_IFUNC 	
      00A008 03 CC 87 E2              5 	.ascii "PRTF"
      00A00C 1F CF                    6 	.word const_portf 
      002340                       6582 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A00C CD 90                    1 	.word LINK 
                           002342     2 	LINK=.
      002342                          3 PRTE:
      00A00E BB                       4 	.byte 4+F_IFUNC 	
      00A00F A1 04 27 03              5 	.ascii "PRTE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A013 CC 87                    6 	.word const_porte 
      002349                       6583 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A015 E2 42                    1 	.word LINK 
                           00234B     2 	LINK=.
      00A016                          3 PRTD:
      00A016 5D                       4 	.byte 4+F_IFUNC 	
      00A017 26 10 1E 03              5 	.ascii "PRTD"
      00A01B CF 00                    6 	.word const_portd 
      002352                       6584 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A01D 05 E6                    1 	.word LINK 
                           002354     2 	LINK=.
      002354                          3 PRTC:
      00A01F 02                       4 	.byte 4+F_IFUNC 	
      00A020 C7 00 04 1E              5 	.ascii "PRTC"
      00A024 05 CF                    6 	.word const_portc 
      00235B                       6585 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A026 00 01                    1 	.word LINK 
                           00235D     2 	LINK=.
      00235D                          3 PRTB:
      00A028 81                       4 	.byte 4+F_IFUNC 	
      00A029 50 52 54 42              5 	.ascii "PRTB"
      00A029 85 5B                    6 	.word const_portb 
      002364                       6586 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A02B 04 72                    1 	.word LINK 
                           002366     2 	LINK=.
      002366                          3 PRTA:
      00A02D 5A                       4 	.byte 4+F_IFUNC 	
      00A02E 00 23 FC 41              5 	.ascii "PRTA"
      00A031 1F B1                    6 	.word const_porta 
      00236D                       6587 	_dict_entry 5,PRINT,print 
      00A031 AE 00                    1 	.word LINK 
                           00236F     2 	LINK=.
      00236F                          3 PRINT:
      00A033 00                       4 	.byte 5 	
      00A034 A6 04 81 4E 54           5 	.ascii "PRINT"
      00A037 13 D5                    6 	.word print 
      002377                       6588 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A037 AE 00                    1 	.word LINK 
                           002379     2 	LINK=.
      002379                          3 POUT:
      00A039 01                       4 	.byte 4+F_IFUNC 	
      00A03A A6 04 81 54              5 	.ascii "POUT"
      00A03D 20 05                    6 	.word const_output 
      002380                       6589 	_dict_entry,4,POKE,poke 
      00A03D AE 00                    1 	.word LINK 
                           002382     2 	LINK=.
      002382                          3 POKE:
      00A03F 02                       4 	.byte 4 	
      00A040 A6 04 81 45              5 	.ascii "POKE"
      00A043 15 48                    6 	.word poke 
      002389                       6590 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A043 AE 00                    1 	.word LINK 
                           00238B     2 	LINK=.
      00238B                          3 PINP:
      00A045 03                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A046 A6 04 81 50              5 	.ascii "PINP"
      00A049 20 0B                    6 	.word const_input 
      002392                       6591 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A049 AE 00                    1 	.word LINK 
                           002394     2 	LINK=.
      002394                          3 PEEK:
      00A04B 04                       4 	.byte 4+F_IFUNC 	
      00A04C A6 04 81 4B              5 	.ascii "PEEK"
      00A04F 15 57                    6 	.word peek 
      00239B                       6592 	_dict_entry,5,PMODE,pin_mode 
      00A04F AE 00                    1 	.word LINK 
                           00239D     2 	LINK=.
      00239D                          3 PMODE:
      00A051 05                       4 	.byte 5 	
      00A052 A6 04 81 44 45           5 	.ascii "PMODE"
      00A055 1D 88                    6 	.word pin_mode 
      0023A5                       6593 	_dict_entry,5,PAUSE,pause 
      00A055 AE 00                    1 	.word LINK 
                           0023A7     2 	LINK=.
      0023A7                          3 PAUSE:
      00A057 06                       4 	.byte 5 	
      00A058 A6 04 81 53 45           5 	.ascii "PAUSE"
      00A05B 1C 8C                    6 	.word pause 
      0023AF                       6594 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A05B AE 00                    1 	.word LINK 
                           0023B1     2 	LINK=.
      0023B1                          3 OR:
      00A05D 07                       4 	.byte 2+F_IFUNC 	
      00A05E A6 04                    5 	.ascii "OR"
      00A060 81 1A                    6 	.word bit_or 
      00A061                       6595 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A061 AE 00                    1 	.word LINK 
                           0023B8     2 	LINK=.
      0023B8                          3 ODR:
      00A063 08                       4 	.byte 3+F_IFUNC 	
      00A064 A6 04 81                 5 	.ascii "ODR"
      00A067 1F E7                    6 	.word const_odr 
      0023BE                       6596 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A067 A6 04                    1 	.word LINK 
                           0023C0     2 	LINK=.
      0023C0                          3 NOT:
      00A069 AE                       4 	.byte 3+F_IFUNC 	
      00A06A 00 00 81                 5 	.ascii "NOT"
      00A06D 1E E2                    6 	.word func_not 
      0023C6                       6597 	_dict_entry,3,NEW,new
      00A06D A6 04                    1 	.word LINK 
                           0023C8     2 	LINK=.
      0023C8                          3 NEW:
      00A06F AE                       4 	.byte 3 	
      00A070 00 01 81                 5 	.ascii "NEW"
      00A073 18 96                    6 	.word new 
      0023CE                       6598 	_dict_entry,4,NEXT,next 
      00A073 A6 04                    1 	.word LINK 
                           0023D0     2 	LINK=.
      0023D0                          3 NEXT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A075 AE                       4 	.byte 4 	
      00A076 00 02 81 54              5 	.ascii "NEXT"
      00A079 16 18                    6 	.word next 
      0023D7                       6599 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A079 A6 04                    1 	.word LINK 
                           0023D9     2 	LINK=.
      0023D9                          3 LSHIFT:
      00A07B AE                       4 	.byte 6+F_IFUNC 	
      00A07C 00 03 81 49 46 54        5 	.ascii "LSHIFT"
      00A07F 1D 4A                    6 	.word lshift 
      0023E2                       6600 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A07F A6 04                    1 	.word LINK 
                           0023E4     2 	LINK=.
      0023E4                          3 LOG:
      00A081 AE                       4 	.byte 3+F_IFUNC 	
      00A082 00 04 81                 5 	.ascii "LOG"
      00A085 1F 2A                    6 	.word log2 
      0023EA                       6601 	_dict_entry,4,LOAD,load 
      00A085 A6 04                    1 	.word LINK 
                           0023EC     2 	LINK=.
      0023EC                          3 LOAD:
      00A087 AE                       4 	.byte 4 	
      00A088 00 01 81 44              5 	.ascii "LOAD"
      00A08B 1A 48                    6 	.word load 
      0023F3                       6602 	_dict_entry 4,LIST,list
      00A08B A6 04                    1 	.word LINK 
                           0023F5     2 	LINK=.
      0023F5                          3 LIST:
      00A08D AE                       4 	.byte 4 	
      00A08E 00 00 81 54              5 	.ascii "LIST"
      00A091 11 8E                    6 	.word list 
      0023FC                       6603 	_dict_entry 3,LET,let 
      00A091 A6 04                    1 	.word LINK 
                           0023FE     2 	LINK=.
      0023FE                          3 LET:
      00A093 AE                       4 	.byte 3 	
      00A094 40 00 81                 5 	.ascii "LET"
      00A097 11 6A                    6 	.word let 
      002404                       6604 	_dict_entry,3+F_IFUNC,KEY,key 
      00A097 55 00                    1 	.word LINK 
                           002406     2 	LINK=.
      002406                          3 KEY:
      00A099 04                       4 	.byte 3+F_IFUNC 	
      00A09A 00 02 81                 5 	.ascii "KEY"
      00A09D 1B C1                    6 	.word key 
      00240C                       6605 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A09D CD 90                    1 	.word LINK 
                           00240E     2 	LINK=.
      00240E                          3 IWDGREF:
      00A09F 77                       4 	.byte 7 	
      00A0A0 A1 04 27 03 CC 87 E2     5 	.ascii "IWDGREF"
      00A0A7 CD 82                    6 	.word refresh_iwdg 
      002418                       6606 	_dict_entry,6,IWDGEN,enable_iwdg
      00A0A9 F9 5D                    1 	.word LINK 
                           00241A     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00241A                          3 IWDGEN:
      00A0AB 26                       4 	.byte 6 	
      00A0AC 05 A6 05 CC 87 E4        5 	.ascii "IWDGEN"
      00A0B2 1E EF                    6 	.word enable_iwdg 
      002423                       6607 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A0B2 90 93                    1 	.word LINK 
                           002425     2 	LINK=.
      002425                          3 INVERT:
      00A0B4 EE                       4 	.byte 6+F_IFUNC 	
      00A0B5 04 A3 A0 97 26 F2        5 	.ascii "INVERT"
      00A0BB 90 CF                    6 	.word invert 
      00242E                       6608 	_dict_entry,5,INPUT,input_var  
      00A0BD 00 07                    1 	.word LINK 
                           002430     2 	LINK=.
      002430                          3 INPUT:
      00A0BF 90                       4 	.byte 5 	
      00A0C0 E6 02 C7 00 0A           5 	.ascii "INPUT"
      00A0C5 35 06                    6 	.word input_var 
      002438                       6609 	_dict_entry,2,IF,if 
      00A0C7 00 09                    1 	.word LINK 
                           00243A     2 	LINK=.
      00243A                          3 IF:
      00A0C9 81                       4 	.byte 2 	
      00A0CA 49 46                    5 	.ascii "IF"
      00A0CA 72 5F                    6 	.word if 
      00243F                       6610 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A0CC 00 07                    1 	.word LINK 
                           002441     2 	LINK=.
      002441                          3 IDR:
      00A0CE 72                       4 	.byte 3+F_IFUNC 	
      00A0CF 5F 00 08                 5 	.ascii "IDR"
      00A0D2 72 5F                    6 	.word const_idr 
      002447                       6611 	_dict_entry,3,HEX,hex_base
      00A0D4 00 09                    1 	.word LINK 
                           002449     2 	LINK=.
      002449                          3 HEX:
      00A0D6 72                       4 	.byte 3 	
      00A0D7 5F 00 0A                 5 	.ascii "HEX"
      00A0DA CE 00                    6 	.word hex_base 
      00244F                       6612 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A0DC 1F 49                    1 	.word LINK 
                           002451     2 	LINK=.
      00A0DD                          3 GPIO:
      00A0DD C3                       4 	.byte 4+F_IFUNC 	
      00A0DE 00 21 24 17              5 	.ascii "GPIO"
      00A0E2 90 93                    6 	.word gpio 
      002458                       6613 	_dict_entry,4,GOTO,goto 
      00A0E4 EE 04                    1 	.word LINK 
                           00245A     2 	LINK=.
      00245A                          3 GOTO:
      00A0E6 A3                       4 	.byte 4 	
      00A0E7 A0 97 26 1A              5 	.ascii "GOTO"
      00A0EB 90 CF                    6 	.word goto 
      002461                       6614 	_dict_entry,5,GOSUB,gosub 
      00A0ED 00 07                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



                           002463     2 	LINK=.
      002463                          3 GOSUB:
      00A0EF 90                       4 	.byte 5 	
      00A0F0 E6 02 C7 00 0A           5 	.ascii "GOSUB"
      00A0F5 35 06                    6 	.word gosub 
      00246B                       6615 	_dict_entry,6,FORGET,forget 
      00A0F7 00 09                    1 	.word LINK 
                           00246D     2 	LINK=.
      00246D                          3 FORGET:
      00A0F9 72                       4 	.byte 6 	
      00A0FA 5D 00 0A 26 05 A6        5 	.ascii "FORGET"
      00A100 0C CC                    6 	.word forget 
      002476                       6616 	_dict_entry,3,FOR,for 
      00A102 87 E4                    1 	.word LINK 
                           002478     2 	LINK=.
      002478                          3 FOR:
      00A104 81                       4 	.byte 3 	
      00A105 46 4F 52                 5 	.ascii "FOR"
      00A105 93 E6                    6 	.word for 
      00247E                       6617 	_dict_entry,6,FILETX,file_transmit
      00A107 02 C7                    1 	.word LINK 
                           002480     2 	LINK=.
      002480                          3 FILETX:
      00A109 00                       4 	.byte 6 	
      00A10A 0E 72 5F 00 0D 72        5 	.ascii "FILETX"
      00A110 BB 00                    6 	.word file_transmit 
      002489                       6618 	_dict_entry,6,FILERX,file_receive 
      00A112 0D 20                    1 	.word LINK 
                           00248B     2 	LINK=.
      00248B                          3 FILERX:
      00A114 C8                       4 	.byte 6 	
      00A115 46 49 4C 45 52 58        5 	.ascii "FILERX"
      00A115 52 06                    6 	.word file_receive 
      00A117                       6619 	_dict_entry,4,FCPU,fcpu 
      00A117 C6 00                    1 	.word LINK 
                           002496     2 	LINK=.
      002496                          3 FCPU:
      00A119 09                       4 	.byte 4 	
      00A11A C1 00 0A 27              5 	.ascii "FCPU"
      00A11E 37 CD                    6 	.word fcpu 
      00249D                       6620 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A120 94 C1                    1 	.word LINK 
                           00249F     2 	LINK=.
      00249F                          3 EEPROM:
      00A122 CE                       4 	.byte 6+F_IFUNC 	
      00A123 00 07 CF 00 05 55        5 	.ascii "EEPROM"
      00A129 00 09                    6 	.word const_eeprom_base 
      0024A8                       6621 	_dict_entry,3,END,cmd_end  
      00A12B 00 02                    1 	.word LINK 
                           0024AA     2 	LINK=.
      0024AA                          3 END:
      00A12D 55                       4 	.byte 3 	
      00A12E 00 0A 00                 5 	.ascii "END"
      00A131 04 CD                    6 	.word cmd_end 
      0024B0                       6622 	_dict_entry,6+F_CMD,DWRITE,digital_write
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A133 90 77                    1 	.word LINK 
                           0024B2     2 	LINK=.
      0024B2                          3 DWRITE:
      00A135 A1                       4 	.byte 6+F_CMD 	
      00A136 04 27 03 CC 87 E2        5 	.ascii "DWRITE"
      00A13C 18 0F                    6 	.word digital_write 
      0024BB                       6623 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A13C 1F 05                    1 	.word LINK 
                           0024BD     2 	LINK=.
      0024BD                          3 DREAD:
      00A13E CD                       4 	.byte 5+F_IFUNC 	
      00A13F 88 A1 CE 00 05           5 	.ascii "DREAD"
      00A144 CF 00                    6 	.word digital_read 
      0024C5                       6624 	_dict_entry,2,DO,do_loop
      00A146 07 55                    1 	.word LINK 
                           0024C7     2 	LINK=.
      0024C7                          3 DO:
      00A148 00                       4 	.byte 2 	
      00A149 02 00                    5 	.ascii "DO"
      00A14B 09 CD                    6 	.word do_loop 
      0024CC                       6625 	_dict_entry,3,DIR,directory 
      00A14D 94 D1                    1 	.word LINK 
                           0024CE     2 	LINK=.
      0024CE                          3 DIR:
      00A14F 1E                       4 	.byte 3 	
      00A150 05 A6 04                 5 	.ascii "DIR"
      00A153 5B 06                    6 	.word directory 
      0024D4                       6626 	_dict_entry,3,DEC,dec_base
      00A155 81 CE                    1 	.word LINK 
                           0024D6     2 	LINK=.
      00A156                          3 DEC:
      00A156 90                       4 	.byte 3 	
      00A157 CE 00 07                 5 	.ascii "DEC"
      00A15A 72 5F                    6 	.word dec_base 
      0024DC                       6627 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A15C 00 07                    1 	.word LINK 
                           0024DE     2 	LINK=.
      0024DE                          3 DDR:
      00A15E 72                       4 	.byte 3+F_IFUNC 	
      00A15F 5F 00 08                 5 	.ascii "DDR"
      00A162 72 5F                    6 	.word const_ddr 
      0024E4                       6628 	_dict_entry,6,DATALN,data_line  
      00A164 00 09                    1 	.word LINK 
                           0024E6     2 	LINK=.
      0024E6                          3 DATALN:
      00A166 72                       4 	.byte 6 	
      00A167 5F 00 0A CD A1 05        5 	.ascii "DATALN"
      00A16D 20 A8                    6 	.word data_line 
      00A16F                       6629 	_dict_entry,4,DATA,data  
      00A16F CD 8F                    1 	.word LINK 
                           0024F1     2 	LINK=.
      0024F1                          3 DATA:
      00A171 6B                       4 	.byte 4 	
      00A172 A1 02 27 03              5 	.ascii "DATA"
      00A176 CC 87                    6 	.word data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0024F8                       6630 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A178 E2 F1                    1 	.word LINK 
                           0024FA     2 	LINK=.
      00A179                          3 CRL:
      00A179 72                       4 	.byte 3+F_IFUNC 	
      00A17A 12 50 C7                 5 	.ascii "CRL"
      00A17D 85 27                    6 	.word const_cr1 
      002500                       6631 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A17F 21 85                    1 	.word LINK 
                           002502     2 	LINK=.
      002502                          3 CRH:
      00A181 A6                       4 	.byte 3+F_IFUNC 	
      00A182 08 42 9F                 5 	.ascii "CRH"
      00A185 C7 52                    6 	.word const_cr2 
      002508                       6632 	_dict_entry,4+F_CFUNC,CHAR,char
      00A187 00 72                    1 	.word LINK 
                           00250A     2 	LINK=.
      00250A                          3 CHAR:
      00A189 1A                       4 	.byte 4+F_CFUNC 	
      00A18A 50 14 72 1A              5 	.ascii "CHAR"
      00A18E 50 16                    6 	.word char 
      002511                       6633 	_dict_entry,3,BYE,bye 
      00A190 72 14                    1 	.word LINK 
                           002513     2 	LINK=.
      002513                          3 BYE:
      00A192 52                       4 	.byte 3 	
      00A193 00 72 12                 5 	.ascii "BYE"
      00A196 52 01                    6 	.word bye 
      002519                       6634 	_dict_entry,5,BTOGL,bit_toggle
      00A198 72 10                    1 	.word LINK 
                           00251B     2 	LINK=.
      00251B                          3 BTOGL:
      00A19A 52                       4 	.byte 5 	
      00A19B 01 72 1C 52 00           5 	.ascii "BTOGL"
      00A1A0 81 11                    6 	.word bit_toggle 
      00A1A1                       6635 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A1A1 5B 02                    1 	.word LINK 
                           002525     2 	LINK=.
      002525                          3 BTEST:
      00A1A3 A6                       4 	.byte 5+F_IFUNC 	
      00A1A4 82 C4 52 03 A1           5 	.ascii "BTEST"
      00A1A9 02 26                    6 	.word bit_test 
      00252D                       6636 	_dict_entry,4,BSET,bit_set 
      00A1AB F7 72                    1 	.word LINK 
                           00252F     2 	LINK=.
      00252F                          3 BSET:
      00A1AD 1D                       4 	.byte 4 	
      00A1AE 52 00 72 13              5 	.ascii "BSET"
      00A1B2 50 C7                    6 	.word bit_set 
      002536                       6637 	_dict_entry,4,BRES,bit_reset
      00A1B4 72 1B                    1 	.word LINK 
                           002538     2 	LINK=.
      002538                          3 BRES:
      00A1B6 50                       4 	.byte 4 	
      00A1B7 16 81 45 53              5 	.ascii "BRES"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A1B9 15 00                    6 	.word bit_reset 
      00253F                       6638 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A1B9 A6 78                    1 	.word LINK 
                           002541     2 	LINK=.
      002541                          3 BIT:
      00A1BB C5                       4 	.byte 3+F_IFUNC 	
      00A1BC 52 03 27                 5 	.ascii "BIT"
      00A1BF 04 72                    6 	.word bitmask 
      002547                       6639 	_dict_entry,3,AWU,awu 
      00A1C1 5F 52                    1 	.word LINK 
                           002549     2 	LINK=.
      002549                          3 AWU:
      00A1C3 03                       4 	.byte 3 	
      00A1C4 81 57 55                 5 	.ascii "AWU"
      00A1C5 1C 9F                    6 	.word awu 
      00254F                       6640 	_dict_entry,7,AUTORUN,autorun
      00A1C5 88 CD                    1 	.word LINK 
                           002551     2 	LINK=.
      002551                          3 AUTORUN:
      00A1C7 A1                       4 	.byte 7 	
      00A1C8 B9 84 72 03 52 03 FB     5 	.ascii "AUTORUN"
      00A1CF C7 52                    6 	.word autorun 
      00255B                       6641 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A1D1 04 72                    1 	.word LINK 
                           00255D     2 	LINK=.
      00255D                          3 ASC:
      00A1D3 01                       4 	.byte 3+F_IFUNC 	
      00A1D4 52 03 FB                 5 	.ascii "ASC"
      00A1D7 C6 52                    6 	.word ascii 
      002563                       6642 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A1D9 04 81                    1 	.word LINK 
                           002565     2 	LINK=.
      00A1DB                          3 AND:
      00A1DB A6                       4 	.byte 3+F_IFUNC 	
      00A1DC FF 72 01                 5 	.ascii "AND"
      00A1DF 52 03                    6 	.word bit_and 
      00256B                       6643 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A1E1 E3 C6                    1 	.word LINK 
                           00256D     2 	LINK=.
      00256D                          3 ADCREAD:
      00A1E3 52                       4 	.byte 7+F_IFUNC 	
      00A1E4 04 81 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A1E6 17 AB                    6 	.word analog_read 
      002577                       6644 	_dict_entry,5,ADCON,power_adc 
      00A1E6 CD 90                    1 	.word LINK 
                           002579     2 	LINK=.
      002579                          3 ADCON:
      00A1E8 77                       4 	.byte 5 	
      00A1E9 A1 04 27 03 CC           5 	.ascii "ADCON"
      00A1EE 87 E2                    6 	.word power_adc 
      00A1F0                       6645 kword_dict:
      002581                       6646 	_dict_entry,3+F_IFUNC,ABS,abs
      00A1F0 9F CD                    1 	.word LINK 
                           002583     2 	LINK=.
      002583                          3 ABS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A1F2 A1                       4 	.byte 3+F_IFUNC 	
      00A1F3 C5 CD 88                 5 	.ascii "ABS"
      00A1F6 A1 A1                    6 	.word abs 
                                   6647 	
                                   6648 
      002600                       6649 	.bndry 128 ; align on FLASH block.
                                   6650 ; free space for user application  
      002600                       6651 user_space:
                                   6652 ; USR() function test
      00A1F8 0D               [ 2] 6653 	pushw x 
      00A1F9 26 02 20 E9      [ 1] 6654 	bset PC_ODR,#5 
      00A1FD 4D               [ 2] 6655 	popw x 
      00A1FE 27 05 55         [ 4] 6656 	call pause02 
      00A201 00 03 00 02      [ 1] 6657 	bres PC_ODR,#5 
      00A205 81               [ 4] 6658 	ret
                                   6659 
                                   6660 	.area FLASH_DRIVE (ABS)
      00A206                       6661 	.org 0x10000
      010000                       6662 fdrive:
                                   6663 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002583 R   |     ACK     =  000006 
  5 ADCON      002579 R   |   5 ADCREAD    00256D R   |     ADC_CR1 =  005401 
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
  5 AND        002565 R   |     ARG_OFS =  000002     |   5 ASC        00255D R
    ATTRIB  =  000002     |   5 AUTORUN    002551 R   |     AUTORUN_=  004000 
  5 AWU        002549 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        002541 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       002538 R   |     BS      =  000008     |     BSAVE   =  000002 
  5 BSET       00252F R   |     BSIZE   =  000001     |   5 BTEST      002525 R
  5 BTOGL      00251B R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        002513 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       00250A R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
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
    CMD_END =  000002     |     CNT     =  000006     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        002502 R   |   5 CRL        0024FA R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       0024F1 R
  5 DATALN     0024E6 R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        0024DE R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        0024D6 R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0024CE R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0024C7 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0024BD R   |   5 DWRITE     0024B2 R   |   5 EEPROM     00249F R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        0024AA R   |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    FCOMP   =  000005     |   5 FCPU       002496 R   |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |   5 FILERX     00248B R
  5 FILETX     002480 R   |     FIRST   =  000001     |     FIRST_DA=  000006 
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        002478 R
  5 FORGET     00246D R   |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002463 R
  5 GOTO       00245A R   |   5 GPIO       002451 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        002449 R   |     HSECNT  =  004809 
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
    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        002441 R   |   5 IF         00243A R   |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002430 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     002425 R
    INW     =  000009     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     00241A R   |   5 IWDGREF    00240E R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        002406 R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0023FE R   |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  002583 R   |   5 LIST       0023F5 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   5 LOAD       0023EC R   |   5 LOG        0023E4 R
  5 LSHIFT     0023D9 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0023C8 R   |   5 NEXT       0023D0 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0023C0 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0023B8 R   |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         0023B1 R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      0023A7 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002394 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       00238B R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      00239D R   |   5 POKE       002382 R   |     PORT    =  000003 
  5 POUT       002379 R   |     PREV    =  000001     |   5 PRINT      00236F R
    PROD    =  000002     |   5 PRTA       002366 R   |   5 PRTB       00235D R
  5 PRTC       002354 R   |   5 PRTD       00234B R   |   5 PRTE       002342 R
  5 PRTF       002339 R   |   5 PRTG       002330 R   |   5 PRTH       002327 R
  5 PRTI       00231E R   |   5 QKEY       002315 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       00230C R
  5 REBOOT     002301 R   |     REG     =  000001     |     RELOP   =  000005 
  5 REMARK     0022F6 R   |   5 RESTORE    0022EA R   |     RETL1   =  000001 
  5 RETURN     0022DF R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0022D7 R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     0022CC R   |     RST_SR  =  0050B3     |   5 RUN        0022C4 R
    RXCHAR  =  000001     |   5 SAVE       0022BB R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0022B2 R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       0022A9 R   |     SKIP    =  000005     |   5 SLEEP      00229F R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      00228B R   |   5 SPIRD      002295 R   |   5 SPISEL     002280 R
  5 SPIWR      002276 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
    SPI_CR1_=  000000     |     SPI_CR1_=  000001     |     SPI_CR1_=  000007 
    SPI_CR1_=  000002     |     SPI_CR1_=  000006     |     SPI_CR2 =  005201 
    SPI_CR2_=  000007     |     SPI_CR2_=  000006     |     SPI_CR2_=  000005 
    SPI_CR2_=  000004     |     SPI_CR2_=  000002     |     SPI_CR2_=  000000 
    SPI_CR2_=  000001     |     SPI_CRCP=  005205     |     SPI_CS_B=  000005 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_SR_B=  000007     |     SPI_SR_C=  000004 
    SPI_SR_M=  000005     |     SPI_SR_O=  000006     |     SPI_SR_R=  000000 
    SPI_SR_T=  000001     |     SPI_SR_W=  000003     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  0000A0     |   5 STEP       00226D R   |   5 STOP       002264 R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      00225A R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    002244 R   |   5 TIMER      002250 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  00000A     |     TK_CFUNC=  000008 
    TK_CHAR =  000003     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000D     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000007     |     TK_INTGR=  000004 
    TK_LE   =  000036     |     TK_LPARE=  00000B     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  00000C     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         00223D R   |   5 TONE       002234 R
    TWSAVE  =  000001     |   5 Timer4Up   000037 R   |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002229 R
  5 UBTN_Han   00007A R   |   5 UFLASH     00221E R   |   5 UNTIL      002214 R
    US      =  00001F     |   5 USER_ABO   000082 R   |     USE_BLOC=  000000 
  5 USR        00220C R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 Uart1RxH   00000F R   |   5 UserButt   00004D R
    VAR_ADDR=  000006     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       002203 R   |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      0021F9 R
  5 WRITE      0021EF R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        0021E7 R   |   5 XPEEK      0021DD R
    XSAVE   =  000005     |     YSAVE   =  000003     |   5 abs        001CEE R
  1 acc16      00000C R   |   1 acc24      00000B R   |   1 acc8       00000D R
  5 accept_c   000A4A R   |   5 add        000DAC R   |   5 analog_r   0017AB R
  5 ansi_seq   000A0C R   |   5 arduino_   001DD9 R   |   5 arg_list   000EEB R
  1 array_si   000023 R   |   5 ascii      001BA1 R   |   5 at_tst     000C1D R
  5 atoi24     000D27 R   |   5 atoi_exi   000D95 R   |   5 autorun    001C2A R
  5 autorun_   0005EA R   |   5 awu        001C9F R   |   5 awu02      001CA9 R
  5 bad_port   001BF9 R   |   1 base       00000A R   |   1 basicptr   000004 R
  5 beep       001733 R   |   5 bin_exit   000B21 R   |   5 bit_and    001D02 R
  5 bit_or     001D1A R   |   5 bit_rese   001500 R   |   5 bit_set    0014F0 R
  5 bit_test   001521 R   |   5 bit_togg   001511 R   |   5 bit_xor    001D32 R
  5 bitmask    001F45 R   |   5 bkslsh_t   000BC8 R   |   5 bksp       0001E1 R
  5 break_po   001878 R   |   5 bye        001C21 R   |   5 cancel_a   0005B2 R
  5 char       001B8F R   |   5 check_fu   000376 R   |   5 clear_ba   0005FF R
  5 clear_va   00047F R   |   5 clock_in   00009D R   |   5 cmd_end    001723 R
  5 cmd_line   0007B0 R   |   5 cmd_name   000E57 R   |   5 cmp_name   0018EC R
  5 cold_sta   0004ED R   |   5 colon_ts   000BF1 R   |   5 comma_ts   000BFC R
  5 compile    000385 R   |   5 const_cr   001FF9 R   |   5 const_cr   001FFF R
  5 const_dd   001FF3 R   |   5 const_ee   002011 R   |   5 const_id   001FED R
  5 const_in   00200B R   |   5 const_od   001FE7 R   |   5 const_ou   002005 R
  5 const_po   001FB1 R   |   5 const_po   001FB7 R   |   5 const_po   001FBD R
  5 const_po   001FC3 R   |   5 const_po   001FC9 R   |   5 const_po   001FCF R
  5 const_po   001FD5 R   |   5 const_po   001FDB R   |   5 const_po   001FE1 R
  5 convert_   000AA9 R   |   1 count      000003 R   |   5 cp_loop    000E9A R
  5 create_g   0002D5 R   |   5 cs_high    0021A0 R   |   5 cstk_pro   0010DE R
  5 dash_tst   000C12 R   |   5 data       002017 R   |   1 data_len   000009 R
  5 data_lin   00201D R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   00205D R   |   5 dec_base   001139 R   |   5 del_back   000A3B R
  5 del_line   00029D R   |   5 del_ln     000A2C R   |   5 delete     0001F1 R
  5 digital_   0017DF R   |   5 digital_   00180F R   |   5 dir_loop   001ACE R
  5 director   001AC2 R   |   5 divide     000E02 R   |   5 divu24_8   00095F R
  5 do_loop    001F6E R   |   5 dotr_loo   0010AE R   |   5 drive_fr   001B4B R
  5 enable_i   001EEF R   |   5 eql_tst    000C7D R   |   5 equal      0013C8 R
  5 err_bad_   0006E2 R   |   5 err_cmd_   0006A3 R   |   5 err_div0   000665 R
  5 err_dupl   0006BE R   |   5 err_math   00064B R   |   5 err_mem_   00062E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  5 err_msg    000610 R   |   5 err_no_a   0006EF R   |   5 err_no_d   000723 R
  5 err_no_f   00074E R   |   5 err_no_l   000675 R   |   5 err_no_p   000739 R
  5 err_not_   0006D0 R   |   5 err_run_   00068C R   |   5 err_synt   00063C R
  5 escaped    000ABE R   |   5 expect     000EDE R   |   5 expr_exi   001038 R
  5 expressi   000FF7 R   |   5 factor     000F4E R   |   1 farptr     000018 R
  5 fcpu       001D7C R   |   7 fdrive     010000 R   |   1 ffree      00001B R
  5 file_cou   001B43 R   |   5 file_rec   0021A5 R   |   5 file_tra   0021DA R
  5 final_te   000A06 R   |   5 first_li   0011BB R   |   1 flags      000025 R
  5 for        001598 R   |   5 forget     001A7D R   |   1 free_ram   00005C R
  5 fsize_ms   0021C9 R   |   5 func_arg   000F12 R   |   5 func_not   001EE2 R
  5 ge         0013CA R   |   5 get_arra   000F29 R   |   5 get_targ   001662 R
  5 get_tick   001CE8 R   |   5 get_toke   000B63 R   |   5 getc       0001CD R
  5 gosub      001693 R   |   5 goto       001678 R   |   5 gpio       001BD4 R
  5 gt         0013C6 R   |   5 gt_tst     000C88 R   |   5 hex_base   001134 R
  5 if         001584 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   0018A1 R   |   5 input_ex   0014C2 R
  5 input_lo   001463 R   |   5 input_va   001461 R   |   5 insert_l   00030E R
  5 insert_l   000373 R   |   5 interpre   0007CA R   |   5 invert     001F5F R
  5 is_alpha   00048D R   |   5 is_digit   00049E R   |   5 itoa       000918 R
  5 itoa_loo   000930 R   |   5 jp_to_ta   001686 R   |   5 key        001BC1 R
  5 kword_di   002581 R   |   5 kword_en   0021DB R   |   5 le         0013CF R
  5 leading_   001F35 R   |   5 left_arr   000A0C R   |   5 let        00116A R
  5 let02      001174 R   |   5 lines_sk   0011BE R   |   5 list       00118E R
  5 list_exi   001207 R   |   5 list_sta   0011E1 R   |   5 load       001A48 R
  5 load_aut   0005C1 R   |   5 load_fil   001A17 R   |   5 log2       001F2A R
  5 logical_   001ED8 R   |   5 loop_bac   001645 R   |   1 loop_dep   000022 R
  5 loop_don   00165A R   |   5 lshift     001D4A R   |   5 lt         0013CD R
  5 lt_tst     000CC1 R   |   5 modulo     000E46 R   |   5 move       000237 R
  5 move_dow   000255 R   |   5 move_exi   000276 R   |   5 move_loo   00025A R
  5 move_up    000247 R   |   5 mul_char   0013B7 R   |   5 multiply   000DBA R
  5 mulu24_8   000987 R   |   5 nbr_tst    000B9E R   |   5 ne         0013D2 R
  5 neg_acc2   0009C1 R   |   5 new        001896 R   |   5 next       001618 R
  5 next_tok   000821 R   |   5 no_match   000EAC R   |   5 none       000B63 R
  5 other      000CF9 R   |   3 pad        001738 R   |   5 parse_bi   000B01 R
  5 parse_in   000AC6 R   |   5 parse_ke   000B29 R   |   5 parse_qu   000A6E R
  5 pause      001C8C R   |   5 pause02    001C96 R   |   5 peek       001557 R
  5 pin_mode   001D88 R   |   5 plus_tst   000C51 R   |   5 poke       001548 R
  5 power_ad   00176F R   |   5 prcnt_ts   000C72 R   |   5 print      0013D5 R
  5 print_ex   001435 R   |   5 print_in   0008BA R   |   5 print_ty   001441 R
  5 prt_basi   00125A R   |   5 prt_cmd_   00120A R   |   5 prt_loop   0013D9 R
  5 prt_quot   00121E R   |   5 prti24     000872 R   |   1 ptr16      000019 R
  1 ptr8       00001A R   |   5 putc       0001C4 R   |   5 puts       0001D7 R
  5 qkey       001BC9 GR  |   5 qmark_ts   000C28 R   |   5 random     001DF9 R
  5 read       002095 R   |   5 read01     002097 R   |   5 readln     0009E4 R
  5 readln_l   0009EA R   |   5 readln_q   000A5F R   |   5 refresh_   001F25 R
  5 rel_exit   00108F R   |   5 relation   00103B R   |   5 relop_st   0013BA R
  5 remark     0014C5 R   |   5 reprint    000A0C R   |   5 reset_co   0013D7 R
  5 rest_con   001451 R   |   5 restore    00204A R   |   5 return     0016B3 R
  5 right_ar   000A0C R   |   5 row_loop   001117 R   |   5 rparnt_t   000BE6 R
  5 rshift     001D63 R   |   5 run        0016D1 R   |   5 run_it     0016FC R
  1 rx_char    000027 R   |   5 save       001958 R   |   5 save_con   001441 R
  5 search_d   000E89 R   |   5 search_e   000EDA R   |   5 search_f   00190D R
  5 search_l   000279 R   |   5 search_l   000281 R   |   5 search_n   000E8D R
  1 seedx      000014 R   |   1 seedy      000016 R   |   5 seek_fdr   0018AF R
  5 select_p   001DC9 R   |   5 set_time   001EC6 R   |   5 sharp_ts   000C07 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

  5 show       001092 R   |   5 show_row   001105 R   |   5 single_c   0013B3 R
  5 size       00113E R   |   5 skip       000D99 R   |   5 slash_ts   000C67 R
  5 sleep      001C81 R   |   5 software   0004A7 R   |   5 spaces     0001FF R
  5 spi_clea   002139 R   |   5 spi_disa   002121 R   |   5 spi_enab   0020EF R
  5 spi_rcv_   00215B R   |   5 spi_read   002186 R   |   5 spi_sele   00218E R
  5 spi_send   002145 R   |   5 spi_writ   002166 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000C5C R   |   5 step       0015F1 R
  5 stop       00184A R   |   5 store_lo   001605 R   |   5 str_matc   000EBB R
  5 str_tst    000B8D R   |   5 strcmp     000218 R   |   5 strcpy     000229 R
  5 strlen     00020B R   |   5 substrac   000DB4 R   |   5 syntax_e   000762 R
  1 tab_widt   000026 R   |   5 tb_error   000764 R   |   5 term       000FA8 R
  5 term01     000FB1 R   |   5 term_exi   000FF4 R   |   3 tib        0016E8 R
  5 tick_tst   000C3F R   |   1 ticks      000010 R   |   5 timeout    001ED5 R
  1 timer      000012 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  1 tmp16      00000E R   |   1 tmp8       00000F R   |   5 to         0015C1 R
  5 to_upper   000D1B GR  |   5 token_ch   000D08 R   |   5 token_ex   000D18 R
  5 tone       001726 R   |   5 try_next   002085 R   |   1 txtbgn     00001E R
  1 txtend     000020 R   |   5 uart1_in   000189 R   |   5 uart1_se   000199 R
  5 ubound     001148 R   |   5 uflash     001BFE R   |   5 unlock_e   0000D5 R
  5 unlock_f   0000E3 R   |   5 until      001F83 R   |   5 user_int   000060 R
  5 user_spa   002600 R   |   5 usr        001C04 R   |   1 vars       000028 R
  5 wait       0014CB R   |   5 warm_ini   000594 R   |   5 warm_sta   0007AD R
  5 words      001E60 R   |   5 words_co   001EB0 R   |   5 write      001B58 R
  5 write_bl   000166 R   |   5 write_by   0000F1 R   |   5 write_ee   00012D R
  5 write_ex   000161 R   |   5 write_fl   000117 R   |   5 xpeek      001568 R
    xreceive   ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5C   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    118   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   260E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

