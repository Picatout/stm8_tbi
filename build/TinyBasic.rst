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
      0080F7 CD 93 F4         [ 4]  249 	call prt_basic_line
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
      0082DF CD 9A 12         [ 4]  589 	call incr_farptr
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



      0086CD CD 9A 20         [ 4] 1307 	call seek_fdrive 
      0086D0 9A               [ 1] 1308 	rim 
      0086D1 72 5C 00 16      [ 1] 1309 	inc seedy+1 
      0086D5 72 5C 00 14      [ 1] 1310 	inc seedx+1 
      0086D9 CD 87 61         [ 4] 1311 	call clear_basic
      0086DC CD 92 DA         [ 4] 1312 	call ubound 
                                   1313 ;	jra 2$	
                                   1314 ; 150 msec beep 
      0086DF AE 00 96         [ 2] 1315 	ldw x,#150 
      0086E2 90 AE 03 E6      [ 2] 1316 	ldw y,#998 
      0086E6 CD 98 84         [ 4] 1317 	call beep  
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
      00872B CD 9A 86         [ 4] 1359 	call search_file
      00872E 25 05            [ 1] 1360 	jrc 2$ 
                                   1361 ; if file doesn't exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008730 CD 87 14         [ 4] 1362 	call cancel_autorun
      008733 20 16            [ 2] 1363 	jra 9$ 
      008735 CD 9B 9C         [ 4] 1364 2$:	call load_file
      008738 AE 40 00         [ 2] 1365 	ldw x,#AUTORUN_NAME 
      00873B CD 83 33         [ 4] 1366 	call puts
      00873E AE 87 4C         [ 2] 1367 	ldw x,#autorun_msg 
      008741 CD 83 33         [ 4] 1368 	call puts 
      008744 72 1C 00 24      [ 1] 1369 	bset flags,#FAUTORUN 
      008748 CC 98 49         [ 2] 1370 	jp run_it    
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
      008922 93               [ 1] 1439 	ld xl,a 
      008923 F4 AE 88 E5      [ 2] 1440 	addw x,basicptr 
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
      0089D1 05 CD 93 0D      [ 1] 1554 	inc in  
      0089D5 20               [ 1] 1555 	tnz a 
      0089D6 E9 2B            [ 1] 1556 	jrmi 6$
      0089D7 A1 06            [ 1] 1557 	cp a,#TK_ARRAY
      0089D7 A1 06            [ 1] 1558 	jrpl 9$  ; no attribute for these
      0089D9 26 05            [ 1] 1559 	cp a,#TK_COLON
      0089DB CD 93            [ 1] 1560 	jreq 9$  
      00098C                       1561 1$: ; 
      0089DD 0A 20            [ 1] 1562 	cp a,#TK_CHAR
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
      008CE3 17 16            [ 1] 2248 	ld a,#TK_COLON 
      008CE5 01 CD 90         [ 2] 2249 	jp token_char  
      000D17                       2250 comma_tst:
      000D17                       2251 	_case COMMA sharp_tst 
      008CE8 89 4D            [ 1]    1 	ld a,#COMMA 
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
      008DD0 95 2A            [ 1] 2358 	jrc 30$ 
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
      008DE7 96 27            [ 1] 2383 	cp a,#'a
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
      008E10 27 A6            [ 1] 2419 1$: cp a,#'$
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
      008EAE 27 26 09         [ 2] 2572 	addw x,#1
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
                                   2759 ;----------------------------------
                                   2760 ;  remainder resulting from euclidian 
                                   2761 ;  division of x/y 
                                   2762 ; input:
                                   2763 ;   x   	dividend int16_t 
                                   2764 ;   y 		divisor int16_t
                                   2765 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2766 ;   X       n1%n2 
                                   2767 ;----------------------------------
      000FD2                       2768 modulo:
      008F51 1F 05 7B         [ 4] 2769 	call divide
      008F54 01               [ 1] 2770 	ldw x,y 
      008F55 93               [ 4] 2771 	ret 
                                   2772 
                                   2773 
                                   2774 ;----------------------------------
                                   2775 ; search in kword_dict name
                                   2776 ; from its execution address 
                                   2777 ; input:
                                   2778 ;   X       	execution address 
                                   2779 ; output:
                                   2780 ;   X 			cstr*  | 0 
                                   2781 ;--------------------------------
                           000001  2782 	XADR=1 
                           000003  2783 	LINK=3 
                           000004  2784 	VSIZE=4
      000FD7                       2785 cmd_name:
      000FD7                       2786 	_vars VSIZE 
      008F56 42 4F            [ 2]    1     sub sp,#VSIZE 
      008F58 72 FB 04 4F      [ 1] 2787 	clr acc16 
      008F5C 19 03            [ 2] 2788 	ldw (XADR,sp),x  
      008F5E 6B 03 1F         [ 2] 2789 	ldw x,#kword_dict	
      008F61 04 90            [ 2] 2790 1$:	ldw (LINK,sp),x
      008F63 5E 93            [ 1] 2791 	ld a,(2,x)
      008F65 7B 02            [ 1] 2792 	and a,#15 
      008F67 42 72 FB         [ 1] 2793 	ld acc8,a 
      008F6A 04 4F 19         [ 2] 2794 	addw x,#3
      008F6D 03 6B 03 1F      [ 2] 2795 	addw x,acc16
      008F71 04               [ 2] 2796 	ldw x,(x) ; execution address 
      008F72 7B 01            [ 2] 2797 	cpw x,(XADR,sp)
      008F74 93 42            [ 1] 2798 	jreq 2$
      008F76 72 FB            [ 2] 2799 	ldw x,(LINK,sp)
      008F78 03               [ 2] 2800 	ldw x,(x) 
      008F79 90 93 1E         [ 2] 2801 	subw x,#2  
      008F7C 05 5B            [ 1] 2802 	jrne 1$
      008F7E 06 81            [ 2] 2803 	jra 9$
      008F80 1E 03            [ 2] 2804 2$: ldw x,(LINK,sp)
      008F80 52 01 0F         [ 2] 2805 	addw x,#2 	
      001006                       2806 9$:	_drop VSIZE
      008F83 01 9E            [ 2]    1     addw sp,#VSIZE 
      008F85 2A               [ 4] 2807 	ret
                                   2808 
                                   2809 
                                   2810 ;---------------------------------
                                   2811 ; dictionary search 
                                   2812 ; input:
                                   2813 ;	X 		dictionary entry point, name field  
                                   2814 ;   y		.asciz name to search 
                                   2815 ; output:
                                   2816 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2817 ;  X		execution address | 0 
                                   2818 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000001  2819 	NLEN=1 ; cmd length 
                           000002  2820 	XSAVE=2
                           000004  2821 	YSAVE=4
                           000005  2822 	VSIZE=5 
      001009                       2823 search_dict:
      001009                       2824 	_vars VSIZE 
      008F86 03 03            [ 2]    1     sub sp,#VSIZE 
                                   2825 
      008F88 01 50            [ 2] 2826 	ldw (YSAVE,sp),y 
      008F8A                       2827 search_next:
      008F8A 90 9E            [ 2] 2828 	ldw (XSAVE,sp),x 
                                   2829 ; get name length in dictionary	
      008F8C 2A               [ 1] 2830 	ld a,(x)
      008F8D 04 03            [ 1] 2831 	and a,#0xf 
      008F8F 01 90            [ 1] 2832 	ld (NLEN,sp),a  
      008F91 50 04            [ 2] 2833 	ldw y,(YSAVE,sp) ; name pointer 
      008F92 5C               [ 2] 2834 	incw x 
      001017                       2835 cp_loop:
      008F92 CD 8F            [ 1] 2836 	ld a,(y)
      008F94 46 7B            [ 1] 2837 	jreq str_match 
      008F96 01 27            [ 1] 2838 	tnz (NLEN,sp)
      008F98 0A 53            [ 1] 2839 	jreq no_match  
      008F9A 90               [ 1] 2840 	cp a,(x)
      008F9B 53 1C            [ 1] 2841 	jrne no_match 
      008F9D 00 01            [ 2] 2842 	incw y 
      008F9F 24               [ 2] 2843 	incw x
      008FA0 02 90            [ 1] 2844 	dec (NLEN,sp)
      008FA2 5C EE            [ 2] 2845 	jra cp_loop 
      008FA3                       2846 no_match:
      008FA3 5B 01            [ 2] 2847 	ldw x,(XSAVE,sp) 
      008FA5 81 00 02         [ 2] 2848 	subw x,#2 ; move X to link field
      008FA6 4B 00            [ 1] 2849 	push #TK_NONE 
      008FA6 52               [ 2] 2850 	ldw x,(x) ; next word link 
      008FA7 03               [ 1] 2851 	pop a ; TK_NONE 
      008FA8 1F 01            [ 1] 2852 	jreq search_exit  ; not found  
                                   2853 ;try next 
      008FAA 1E 08            [ 2] 2854 	jra search_next
      001036                       2855 str_match:
      008FAC 16 06            [ 2] 2856 	ldw x,(XSAVE,sp)
      008FAE 90               [ 1] 2857 	ld a,(X)
      008FAF 5D 26            [ 1] 2858 	ld (NLEN,sp),a ; needed to test keyword type  
      008FB1 06 16            [ 1] 2859 	and a,#0xf 
                                   2860 ; move x to procedure address field 	
      008FB3 01               [ 1] 2861 	inc a 
      008FB4 65 5B 03         [ 1] 2862 	ld acc8,a 
      008FB7 81 5F 00 0C      [ 1] 2863 	clr acc16 
      008FB8 72 BB 00 0C      [ 2] 2864 	addw x,acc16 
      008FB8 51               [ 2] 2865 	ldw x,(x) ; routine entry point 
                                   2866 ;determine keyword type bits 7:6 
      008FB9 A6 11            [ 1] 2867 	ld a,(NLEN,sp)
      008FBB 6B               [ 1] 2868 	swap a 
      008FBC 03 0C            [ 1] 2869 	and a,#0xc
      008FBD 44               [ 1] 2870 	srl a
      008FBD 13               [ 1] 2871 	srl a 
      008FBE 01 2B            [ 1] 2872 	add a,#128
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      001053                       2873 search_exit: 
      001053                       2874 	_drop VSIZE 	 
      008FC0 03 72            [ 2]    1     addw sp,#VSIZE 
      008FC2 F0               [ 4] 2875 	ret 
                                   2876 
                                   2877 ;---------------------
                                   2878 ; check if next token
                                   2879 ;  is of expected type 
                                   2880 ; input:
                                   2881 ;   A 		 expected token attribute
                                   2882 ;  ouput:
                                   2883 ;   none     if fail call syntax_error 
                                   2884 ;--------------------
      001056                       2885 expect:
      008FC3 01               [ 1] 2886 	push a 
      008FC4 8C 90 59         [ 4] 2887 	call next_token 
      008FC7 59 0A            [ 1] 2888 	cp a,(1,sp)
      008FC9 03 26            [ 1] 2889 	jreq 1$
      008FCB F1 51 5B         [ 2] 2890 	jp syntax_error
      008FCE 03               [ 1] 2891 1$: pop a 
      008FCF 81               [ 4] 2892 	ret 
                                   2893 
                                   2894 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2895 ; parse arguments list 
                                   2896 ; between ()
                                   2897 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008FD0                       2898 func_args:
      008FD0 53 90            [ 1] 2899 	ld a,#TK_LPAREN 
      008FD2 53 1C 00         [ 4] 2900 	call expect 
                                   2901 ; expected to continue in arg_list 
                                   2902 ; caller must check for TK_RPAREN 
                                   2903 
                                   2904 ;-------------------------------
                                   2905 ; parse embedded BASIC routines 
                                   2906 ; arguments list.
                                   2907 ; arg_list::=  rel[','rel]*
                                   2908 ; all arguments are of integer type
                                   2909 ; and pushed on stack 
                                   2910 ; input:
                                   2911 ;   none
                                   2912 ; output:
                                   2913 ;   stack{n}   arguments pushed on stack
                                   2914 ;   A 	number of arguments pushed on stack  
                                   2915 ;--------------------------------
      001068                       2916 arg_list:
      008FD5 01 24            [ 1] 2917 	push #0  
      008FD7 02 90 5C         [ 4] 2918 1$: call relation
      008FDA 81 00            [ 1] 2919 	cp a,#TK_NONE 
      008FDB 27 20            [ 1] 2920 	jreq 5$
      008FDB 90 5F            [ 1] 2921 	cp a,#TK_INTGR
      008FDD 9E A4            [ 1] 2922 	jrne 4$
      001075                       2923 3$: 
                                   2924 ; swap return address with argument
      008FDF 80               [ 1] 2925 	pop a ; arg_count
      008FE0 27 02            [ 2] 2926 	popw y ; return address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FE2 90               [ 2] 2927 	pushw x ; new argument 
      008FE3 53 81            [ 2] 2928 	pushw y 
      008FE5 4C               [ 1] 2929     inc a
      008FE5 52               [ 1] 2930 	push a 
      008FE6 08 0F 05         [ 4] 2931 	call next_token 
      008FE9 0F 06            [ 1] 2932 	cp a,#TK_COMMA 
      008FEB 16 0B            [ 1] 2933 	jreq 1$ 
      008FED 17 01            [ 1] 2934 	cp a,#TK_NONE 
      008FEF 16 0D            [ 1] 2935 	jreq 5$ 
      008FF1 17 03            [ 1] 2936 4$:	cp a,#TK_RPAREN 
      008FF3 5D 26            [ 1] 2937 	jreq 5$
      00108C                       2938 	_unget_token 
      008FF5 05 A6 04 CC 88   [ 1]    1     mov in,in.saved
      008FFA F7               [ 1] 2939 5$:	pop a  
      008FFB 9E               [ 4] 2940 	ret 
                                   2941 
                                   2942 ;--------------------------------
                                   2943 ;   BASIC commnands 
                                   2944 ;--------------------------------
                                   2945 
                                   2946 ;--------------------------------
                                   2947 ;  arithmetic and relational 
                                   2948 ;  routines
                                   2949 ;  operators precedence
                                   2950 ;  highest to lowest
                                   2951 ;  operators on same row have 
                                   2952 ;  same precedence and are executed
                                   2953 ;  from left to right.
                                   2954 ;	'*','/','%'
                                   2955 ;   '-','+'
                                   2956 ;   '=','>','<','>=','<=','<>','><'
                                   2957 ;   '<>' and '><' are equivalent for not equal.
                                   2958 ;--------------------------------
                                   2959 
                                   2960 ;---------------------
                                   2961 ; return array element
                                   2962 ; address from @(expr)
                                   2963 ; input:
                                   2964 ;   A 		TK_ARRAY
                                   2965 ; output:
                                   2966 ;   A 		TK_INTGR
                                   2967 ;	X 		element address 
                                   2968 ;----------------------
      001093                       2969 get_array_element:
      008FFC A4 80 27         [ 4] 2970 	call func_args 
      008FFF 05 03            [ 1] 2971 	cp a,#1
      009001 05 03            [ 1] 2972 	jreq 1$
      009003 06 50 1F         [ 2] 2973 	jp syntax_error
      009006 07               [ 2] 2974 1$: popw x 
                                   2975 	; check for bounds 
      009007 7B 01 A4         [ 2] 2976 	cpw x,array_size 
      00900A 80 27            [ 2] 2977 	jrule 3$
                                   2978 ; bounds {1..array_size}	
      00900C 0D 03            [ 1] 2979 2$: ld a,#ERR_BAD_VALUE 
      00900E 06 1E 03         [ 2] 2980 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009011 16               [ 2] 2981 3$: tnzw  x
      009012 01 CD            [ 1] 2982 	jreq 2$ 
      009014 8F               [ 2] 2983 	sllw x 
      009015 D0               [ 2] 2984 	pushw x 
      009016 1F 03 17         [ 2] 2985 	ldw x,#tib
      009019 01 1E 07         [ 2] 2986 	subw x,(1,sp)
      0010B3                       2987 	_drop 2   
      00901C CD 8F            [ 2]    1     addw sp,#2 
      00901E A6 90            [ 1] 2988 	ld a,#TK_INTGR
      009020 5D               [ 4] 2989 	ret 
                                   2990 
                                   2991 
                                   2992 ;***********************************
                                   2993 ;   expression parse,execute 
                                   2994 ;***********************************
                                   2995 ;-----------------------------------
                                   2996 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2997 ;			 integer | function |
                                   2998 ;			 '('relation')' 
                                   2999 ; output:
                                   3000 ;   A    token attribute 
                                   3001 ;   X 	 integer
                                   3002 ; ---------------------------------
                           000001  3003 	NEG=1
                           000001  3004 	VSIZE=1
      0010B8                       3005 factor:
      0010B8                       3006 	_vars VSIZE 
      009021 27 11            [ 2]    1     sub sp,#VSIZE 
      009023 7B 06 18         [ 4] 3007 	call next_token
      009026 05 27            [ 1] 3008 	cp a,#CMD_END 
      009028 0B 5C            [ 1] 3009 	jrult 20$
      00902A 90 CF            [ 1] 3010 1$:	ld (NEG,sp),a 
      00902C 00 0D            [ 1] 3011 	and a,#TK_GRP_MASK
      00902E 16 07            [ 1] 3012 	cp a,#TK_GRP_ADD 
      009030 72 B2            [ 1] 3013 	jreq 2$
      009032 00 0D            [ 1] 3014 	ld a,(NEG,sp)
      009034 7B 06            [ 2] 3015 	jra 4$  
      0010CD                       3016 2$:	
      009036 27 01 50         [ 4] 3017 	call next_token 
      009039                       3018 4$:	
      009039 5B 08            [ 1] 3019 	cp a,#TK_IFUNC 
      00903B 81 03            [ 1] 3020 	jrne 5$ 
      00903C FD               [ 4] 3021 	call (x) 
      00903C 52 04            [ 2] 3022 	jra 18$ 
      0010D7                       3023 5$:
      00903E 90 CF            [ 1] 3024 	cp a,#TK_INTGR
      009040 00 0D            [ 1] 3025 	jrne 6$
      009042 CD 8F            [ 2] 3026 	jra 18$
      0010DD                       3027 6$:
      009044 DB 1F            [ 1] 3028 	cp a,#TK_ARRAY
      009046 03 17            [ 1] 3029 	jrne 10$
      009048 01 CE 00         [ 4] 3030 	call get_array_element
      00904B 0D               [ 2] 3031 	ldw x,(x)
      00904C CD 8F            [ 2] 3032 	jra 18$ 
      0010E7                       3033 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00904E E5 5B            [ 1] 3034 	cp a,#TK_VAR 
      009050 04 81            [ 1] 3035 	jrne 12$
      009052 FE               [ 2] 3036 	ldw x,(x)
      009052 CD 90            [ 2] 3037 	jra 18$
      0010EE                       3038 12$:			
      009054 3C 93            [ 1] 3039 	cp a,#TK_LPAREN
      009056 81 0C            [ 1] 3040 	jrne 16$
      009057 CD 11 AA         [ 4] 3041 	call relation
      009057 52               [ 2] 3042 	pushw x 
      009058 04 72            [ 1] 3043 	ld a,#TK_RPAREN 
      00905A 5F 00 0D         [ 4] 3044 	call expect
      00905D 1F               [ 2] 3045 	popw x 
      00905E 01 AE            [ 2] 3046 	jra 18$	
      0010FE                       3047 16$:
      0010FE                       3048 	_unget_token
      009060 A7 15 1F 03 E6   [ 1]    1     mov in,in.saved
      009065 02               [ 1] 3049 	clr a 
      009066 A4 0F            [ 2] 3050 	jra 20$ 
      001106                       3051 18$: 
      009068 C7 00            [ 1] 3052 	ld a,#TK_MINUS 
      00906A 0E 1C            [ 1] 3053 	cp a,(NEG,sp)
      00906C 00 03            [ 1] 3054 	jrne 19$
      00906E 72               [ 2] 3055 	negw x
      00110D                       3056 19$:
      00906F BB 00            [ 1] 3057 	ld a,#TK_INTGR
      00110F                       3058 20$:
      00110F                       3059 	_drop VSIZE
      009071 0D FE            [ 2]    1     addw sp,#VSIZE 
      009073 13               [ 4] 3060 	ret
                                   3061 
                                   3062 ;-----------------------------------
                                   3063 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3064 ; output:
                                   3065 ;   A    	token attribute 
                                   3066 ;	X		integer
                                   3067 ;-----------------------------------
                           000001  3068 	N1=1   ; int16_t
                           000003  3069 	MULOP=3
                           000003  3070 	VSIZE=3
      001112                       3071 term:
      001112                       3072 	_vars VSIZE
      009074 01 27            [ 2]    1     sub sp,#VSIZE 
      009076 0A 1E 03         [ 4] 3073 	call factor
      009079 FE 1D            [ 1] 3074 	cp a,#CMD_END
      00907B 00 02            [ 1] 3075 	jrult term_exit
      00111B                       3076 term01:	 ; check for  operator 
      00907D 26 E3            [ 2] 3077 	ldw (N1,sp),x  ; save first factor 
      00907F 20 05 1E         [ 4] 3078 	call next_token
      009082 03 1C            [ 1] 3079 	cp a,#CMD_END
      009084 00 02            [ 1] 3080 	jrult 9$
      009086 5B 04            [ 1] 3081 0$:	ld (MULOP,sp),a
      009088 81 30            [ 1] 3082 	and a,#TK_GRP_MASK
      009089 A1 20            [ 1] 3083 	cp a,#TK_GRP_MULT
      009089 52 05            [ 1] 3084 	jreq 1$
      00112C                       3085 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00908B 17 04 02 00 01   [ 1]    1     mov in,in.saved
      00908D 20 27            [ 2] 3086 	jra 9$
      001133                       3087 1$:	; got *|/|%
      00908D 1F 02 F6         [ 4] 3088 	call factor
      009090 A4 0F            [ 1] 3089 	cp a,#TK_INTGR
      009092 6B 01            [ 1] 3090 	jreq 2$ 
      009094 16 04 5C         [ 2] 3091 	jp syntax_error
      009097 90 93            [ 1] 3092 2$:	ldw y,x 
      009097 90 F6            [ 2] 3093 	ldw x,(N1,sp)
      009099 27 1B            [ 1] 3094 	ld a,(MULOP,sp) 
      00909B 0D 01            [ 1] 3095 	cp a,#TK_MULT 
      00909D 27 0A            [ 1] 3096 	jrne 3$
      00909F F1 26 07         [ 4] 3097 	call multiply 
      0090A2 90 5C            [ 2] 3098 	jra term01
      0090A4 5C 0A            [ 1] 3099 3$: cp a,#TK_DIV 
      0090A6 01 20            [ 1] 3100 	jrne 4$ 
      0090A8 EE 0F BC         [ 4] 3101 	call divide 
      0090A9 20 C6            [ 2] 3102 	jra term01 
      0090A9 1E 02 1D         [ 4] 3103 4$: call modulo
      0090AC 00 02            [ 2] 3104 	jra term01 
      0090AE 4B 00            [ 2] 3105 9$: ldw x,(N1,sp)
      0090B0 FE 84            [ 1] 3106 	ld a,#TK_INTGR 	
      00115E                       3107 term_exit:
      00115E                       3108 	_drop VSIZE 
      0090B2 27 1F            [ 2]    1     addw sp,#VSIZE 
      0090B4 20               [ 4] 3109 	ret 
                                   3110 
                                   3111 ;-------------------------------
                                   3112 ;  expr ::= term [['+'|'-'] term]*
                                   3113 ;  result range {-32768..32767}
                                   3114 ;  output:
                                   3115 ;   A    token attribute 
                                   3116 ;   X	 integer   
                                   3117 ;-------------------------------
                           000001  3118 	N1=1 
                           000003  3119 	OP=3 
                           000003  3120 	VSIZE=3 
      001161                       3121 expression:
      001161                       3122 	_vars VSIZE 
      0090B5 D7 03            [ 2]    1     sub sp,#VSIZE 
      0090B6 CD 11 12         [ 4] 3123 	call term
      0090B6 1E 02            [ 1] 3124 	cp a,#CMD_END 
      0090B8 F6 6B            [ 1] 3125 	jrult expr_exit 
      0090BA 01 A4            [ 2] 3126 0$:	ldw (N1,sp),x 
      0090BC 0F 4C C7         [ 4] 3127 	call next_token
      0090BF 00 0E            [ 1] 3128 	cp a,#CMD_END 
      0090C1 72 5F            [ 1] 3129 	jrult 9$ 
      0090C3 00 0D            [ 1] 3130 1$:	ld (OP,sp),a  
      0090C5 72 BB            [ 1] 3131 	and a,#TK_GRP_MASK
      0090C7 00 0D            [ 1] 3132 	cp a,#TK_GRP_ADD 
      0090C9 FE 7B            [ 1] 3133 	jreq 2$ 
      00117B                       3134 	_unget_token
      0090CB 01 4E A4 0C 44   [ 1]    1     mov in,in.saved
      0090D0 44 AB            [ 2] 3135 	jra 9$
      001182                       3136 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0090D2 80 11 12         [ 4] 3137 	call term
      0090D3 A1 84            [ 1] 3138 	cp a,#TK_INTGR 
      0090D3 5B 05            [ 1] 3139 	jreq 3$
      0090D5 81 08 75         [ 2] 3140 	jp syntax_error
      0090D6 CF 00 0C         [ 2] 3141 3$:	ldw acc16,x 
      0090D6 88 CD            [ 2] 3142 	ldw x,(N1,sp)
      0090D8 89 E7            [ 1] 3143 	ld a,(OP,sp)
      0090DA 11 01            [ 1] 3144 	cp a,#TK_PLUS 
      0090DC 27 03            [ 1] 3145 	jrne 4$
      0090DE CC 88 F5 84      [ 2] 3146 	addw x,acc16
      0090E2 81 CD            [ 2] 3147 	jra 0$ 
      0090E3 72 B0 00 0C      [ 2] 3148 4$:	subw x,acc16
      0090E3 A6 07            [ 2] 3149 	jra 0$
      0090E5 CD 90            [ 2] 3150 9$: ldw x,(N1,sp)
      0090E7 D6 84            [ 1] 3151 	ld a,#TK_INTGR	
      0090E8                       3152 expr_exit:
      0011A7                       3153 	_drop VSIZE 
      0090E8 4B 00            [ 2]    1     addw sp,#VSIZE 
      0090EA CD               [ 4] 3154 	ret 
                                   3155 
                                   3156 ;---------------------------------------------
                                   3157 ; rel ::= expr rel_op expr
                                   3158 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3159 ;  relation return  integer , zero is false 
                                   3160 ;  output:
                                   3161 ;    A 		token attribute  
                                   3162 ;	 X		integer 
                                   3163 ;---------------------------------------------
                           000001  3164 	N1=1
                           000003  3165 	RELOP=3
                           000003  3166 	VSIZE=3 
      0011AA                       3167 relation: 
      0011AA                       3168 	_vars VSIZE
      0090EB 92 2A            [ 2]    1     sub sp,#VSIZE 
      0090ED A1 00 27         [ 4] 3169 	call expression
      0090F0 20 A1            [ 1] 3170 	cp a,#CMD_END  
      0090F2 84 26            [ 1] 3171 	jrult rel_exit 
                                   3172 	; expect rel_op or leave 
      0090F4 13 01            [ 2] 3173 	ldw (N1,sp),x 
      0090F5 CD 09 67         [ 4] 3174 	call next_token 
      0090F5 84 90            [ 1] 3175 	cp a,#CMD_END 
      0090F7 85 89            [ 1] 3176 	jrult 9$
      0011BC                       3177 1$:	
      0090F9 90 89            [ 1] 3178 	ld (RELOP,sp),a 
      0090FB 4C 88            [ 1] 3179 	and a,#TK_GRP_MASK
      0090FD CD 89            [ 1] 3180 	cp a,#TK_GRP_RELOP 
      0090FF E7 A1            [ 1] 3181 	jreq 2$
      0011C4                       3182 	_unget_token  
      009101 09 27 E6 A1 00   [ 1]    1     mov in,in.saved
      009106 27 09            [ 2] 3183 	jra 9$
      0011CB                       3184 2$:	; expect another expression or error 
      009108 A1 08 27         [ 4] 3185 	call expression
      00910B 05 55            [ 1] 3186 	cp a,#TK_INTGR 
      00910D 00 03            [ 1] 3187 	jreq 3$
      00910F 00 02 84         [ 2] 3188 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009112 81 00 0C         [ 2] 3189 3$:	ldw acc16,x 
      009113 1E 01            [ 2] 3190 	ldw x,(N1,sp) 
      009113 CD 90 E3 A1      [ 2] 3191 	subw x,acc16
      009117 01 27            [ 1] 3192 	jrne 4$
      009119 03 CC 88 F5      [ 1] 3193 	mov acc8,#2 ; n1==n2
      00911D 85 C3            [ 2] 3194 	jra 6$ 
      0011E6                       3195 4$: 
      00911F 00 22            [ 1] 3196 	jrsgt 5$  
      009121 23 05 A6 0A      [ 1] 3197 	mov acc8,#4 ; n1<2 
      009125 CC 88            [ 2] 3198 	jra 6$
      0011EE                       3199 5$:
      009127 F7 5D 27 F8      [ 1] 3200 	mov acc8,#1 ; n1>n2 
      0011F2                       3201 6$:
      00912B 58               [ 1] 3202 	clrw x 
      00912C 89 AE 16         [ 1] 3203 	ld a, acc8  
      00912F 90 72            [ 1] 3204 	and a,(RELOP,sp)
      009131 F0               [ 1] 3205 	tnz a 
      009132 01 5B            [ 1] 3206 	jreq 10$
      009134 02               [ 2] 3207 	incw x 
      0011FC                       3208 7$:	 
      009135 A6 84            [ 2] 3209 	jra 10$  	
      009137 81 01            [ 2] 3210 9$: ldw x,(N1,sp)
      009138                       3211 10$:
      009138 52 01            [ 1] 3212 	ld a,#TK_INTGR
      001202                       3213 rel_exit: 	 
      001202                       3214 	_drop VSIZE
      00913A CD 89            [ 2]    1     addw sp,#VSIZE 
      00913C E7               [ 4] 3215 	ret 
                                   3216 
                                   3217 ;--------------------------------
                                   3218 ; BASIC: SHOW 
                                   3219 ; print stack content in hexadecimal bytes 
                                   3220 ; 16 bytes per row 
                                   3221 ;--------------------------------
      001205                       3222 show:
      00913D A1 02 25         [ 2] 3223 	ldw x,#cstk_prompt
      009140 4E 6B 01         [ 4] 3224 	call puts 
      009143 A4               [ 1] 3225 	ldw x,sp 
      009144 30 A1 10         [ 2] 3226 	addw x,#3 ; ignore return address
      009147 27 04 7B 01      [ 2] 3227 	ldw y,#RAM_SIZE  
      00914B 20 03 0C         [ 2] 3228 	ldw acc16,x 
      00914D 72 B2 00 0C      [ 2] 3229 	subw y,acc16
      00914D CD 89 E7         [ 4] 3230 	call hex_dump
      009150 4F               [ 1] 3231 	clr a 
      009150 A1               [ 4] 3232 	ret
                                   3233 
      009151 81 26 03 FD 20 2F 6E  3234 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3235 
                                   3236 
                                   3237 ;--------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3238 ; BASIC: HEX 
                                   3239 ; select hexadecimal base for integer print
                                   3240 ;---------------------------------------------
      009157                       3241 hex_base:
      009157 A1 84 26 02      [ 1] 3242 	mov base,#16 
      00915B 20               [ 4] 3243 	ret 
                                   3244 
                                   3245 ;--------------------------------------------
                                   3246 ; BASIC: DEC 
                                   3247 ; select decimal base for integer print
                                   3248 ;---------------------------------------------
      00124B                       3249 dec_base:
      00915C 29 0A 00 0A      [ 1] 3250 	mov base,#10
      00915D 81               [ 4] 3251 	ret 
                                   3252 
                                   3253 ;------------------------
                                   3254 ; BASIC: SIZE 
                                   3255 ; return free size in text area
                                   3256 ; output:
                                   3257 ;   A 		TK_INTGR
                                   3258 ;   X 	    size integer
                                   3259 ;--------------------------
      001250                       3260 size:
      00915D A1 06 26         [ 2] 3261 	ldw x,#tib 
      009160 06 CD 91 13      [ 2] 3262 	subw x,txtend 
      009164 FE 20            [ 1] 3263 	ld a,#TK_INTGR
      009166 1F               [ 4] 3264 	ret 
                                   3265 
                                   3266 
                                   3267 ;------------------------
                                   3268 ; BASIC: UBOUND  
                                   3269 ; return array variable size 
                                   3270 ; output:
                                   3271 ;   A 		TK_INTGR
                                   3272 ;   X 	    array size 
                                   3273 ;--------------------------
      009167                       3274 ubound:
      009167 A1 85 26         [ 2] 3275 	ldw x,#tib
      00916A 03 FE 20 18      [ 2] 3276 	subw x,txtend 
      00916E 90 CE 00 04      [ 2] 3277 	ldw y,basicptr 
      00916E A1 07 26 0C      [ 2] 3278 	cpw y,txtend 
      009172 CD 92            [ 1] 3279 	jrult 1$
      009174 2A 89 A6         [ 1] 3280 	push count 
      009177 08 CD            [ 1] 3281 	push #0 
      009179 90 D6 85         [ 2] 3282 	subw x,(1,sp)
      001273                       3283 	_drop 2 
      00917C 20 08            [ 2]    1     addw sp,#2 
      00917E 54               [ 2] 3284 1$:	srlw x 
      00917E 55 00 03         [ 2] 3285 	ldw array_size,x
      009181 00 02            [ 1] 3286 	ld a,#TK_INTGR
      009183 4F               [ 4] 3287 	ret 
                                   3288 
                                   3289 ;-----------------------------
                                   3290 ; BASIC: LET var=expr 
                                   3291 ; variable assignement 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3292 ; output:
                                   3293 ;   A 		TK_NONE 
                                   3294 ;-----------------------------
      00127C                       3295 let:
      009184 20 09 67         [ 4] 3296 	call next_token 
      009186 A1 85            [ 1] 3297 	cp a,#TK_VAR 
      009186 A6 11            [ 1] 3298 	jreq let_var
      009188 11 01            [ 1] 3299 	cp a,#TK_ARRAY 
      00918A 26 01            [ 1] 3300 	jreq  let_array
      00918C 50 08 75         [ 2] 3301 	jp syntax_error
      00918D                       3302 let_array:
      00918D A6 84 93         [ 4] 3303 	call get_array_element
      00918F                       3304 let_var:
      00918F 5B               [ 2] 3305 	pushw x  
      009190 01 81 67         [ 4] 3306 	call next_token 
      009192 A1 32            [ 1] 3307 	cp a,#TK_EQUAL
      009192 52 03            [ 1] 3308 	jreq 1$
      009194 CD 91 38         [ 2] 3309 	jp syntax_error
      001298                       3310 1$:	
      009197 A1 02 25         [ 4] 3311 	call relation   
      00919A 43 84            [ 1] 3312 	cp a,#TK_INTGR 
      00919B 27 03            [ 1] 3313 	jreq 2$
      00919B 1F 01 CD         [ 2] 3314 	jp syntax_error
      0012A2                       3315 2$:	
      00919E 89 E7            [ 1] 3316 	ldw y,x 
      0091A0 A1               [ 2] 3317 	popw x   
      0091A1 02               [ 2] 3318 	ldw (x),y   
      0091A2 25               [ 4] 3319 	ret 
                                   3320 
                                   3321 ;----------------------------
                                   3322 ; BASIC: LIST [[start][,end]]
                                   3323 ; list program lines 
                                   3324 ; form start to end 
                                   3325 ; if empty argument list then 
                                   3326 ; list all.
                                   3327 ;----------------------------
                           000001  3328 	FIRST=1
                           000003  3329 	LAST=3 
                           000005  3330 	LN_PTR=5
                           000006  3331 	VSIZE=6 
      0012A7                       3332 list:
      0091A3 36 6B 03         [ 2] 3333 	ldw x,txtbgn 
      0091A6 A4 30 A1         [ 2] 3334 	cpw x,txtend 
      0091A9 20 27            [ 1] 3335 	jrmi 1$
      0091AB 07               [ 4] 3336 	ret 
      0012B0                       3337 1$:	
      0012B0                       3338 	_vars VSIZE
      0091AC 55 00            [ 2]    1     sub sp,#VSIZE 
      0091AE 03 00            [ 2] 3339 	ldw (LN_PTR,sp),x 
      0091B0 02               [ 2] 3340 	ldw x,(x) 
      0091B1 20 27            [ 2] 3341 	ldw (FIRST,sp),x ; list from first line 
      0091B3 AE 7F FF         [ 2] 3342 	ldw x,#MAX_LINENO ; biggest line number 
      0091B3 CD 91            [ 2] 3343 	ldw (LAST,sp),x 
      0091B5 38 A1 84         [ 4] 3344 	call arg_list
      0091B8 27               [ 1] 3345 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091B9 03 CC            [ 1] 3346 	jreq list_start 
      0091BB 88 F5            [ 1] 3347 	cp a,#2 
      0091BD 90 93            [ 1] 3348 	jreq 4$
      0091BF 1E 01            [ 1] 3349 	cp a,#1 
      0091C1 7B 03            [ 1] 3350 	jreq first_line 
      0091C3 A1 20 26         [ 2] 3351 	jp syntax_error 
      0091C6 05               [ 2] 3352 4$:	popw x 
      0091C7 CD 8F            [ 2] 3353 	ldw (LAST+2,sp),x 
      0012D0                       3354 first_line:
      0091C9 80               [ 2] 3355 	popw x
      0091CA 20 CF            [ 2] 3356 	ldw (FIRST,sp),x 
      0012D3                       3357 lines_skip:
      0091CC A1 21 26         [ 2] 3358 	ldw x,txtbgn
      0091CF 05 CD            [ 2] 3359 2$:	ldw (LN_PTR,sp),x 
      0091D1 90 3C 20         [ 2] 3360 	cpw x,txtend 
      0091D4 C6 CD            [ 1] 3361 	jrpl list_exit 
      0091D6 90               [ 2] 3362 	ldw x,(x) ;line# 
      0091D7 52 20            [ 2] 3363 	cpw x,(FIRST,sp)
      0091D9 C1 1E            [ 1] 3364 	jrpl list_start 
      0091DB 01 A6            [ 2] 3365 	ldw x,(LN_PTR,sp) 
      0091DD 84 02            [ 1] 3366 	ld a,(2,x)
      0091DE C7 00 0D         [ 1] 3367 	ld acc8,a 
      0091DE 5B 03 81 0C      [ 1] 3368 	clr acc16 
      0091E1 72 BB 00 0C      [ 2] 3369 	addw x,acc16
      0091E1 52 03            [ 2] 3370 	jra 2$ 
                                   3371 ; print loop
      0012F3                       3372 list_start:
      0091E3 CD 91            [ 2] 3373 	ldw x,(LN_PTR,sp)
      0091E5 92 A1            [ 1] 3374 3$:	ld a,(2,x) 
      0091E7 02 25 3D         [ 4] 3375 	call prt_basic_line
      0091EA 1F 01            [ 2] 3376 	ldw x,(LN_PTR,sp)
      0091EC CD 89            [ 1] 3377 	ld a,(2,x)
      0091EE E7 A1 02         [ 1] 3378 	ld acc8,a 
      0091F1 25 30 6B 03      [ 1] 3379 	clr acc16 
      0091F5 A4 30 A1 10      [ 2] 3380 	addw x,acc16
      0091F9 27 07 55         [ 2] 3381 	cpw x,txtend 
      0091FC 00 03            [ 1] 3382 	jrpl list_exit
      0091FE 00 02            [ 2] 3383 	ldw (LN_PTR,sp),x
      009200 20               [ 2] 3384 	ldw x,(x)
      009201 21 03            [ 2] 3385 	cpw x,(LAST,sp)  
      009202 2C 04            [ 1] 3386 	jrsgt list_exit 
      009202 CD 91            [ 2] 3387 	ldw x,(LN_PTR,sp)
      009204 92 A1            [ 2] 3388 	jra 3$
      001319                       3389 list_exit:
      001319                       3390 	_drop VSIZE 
      009206 84 27            [ 2]    1     addw sp,#VSIZE 
      009208 03               [ 4] 3391 	ret
                                   3392 
                                   3393 ;-------------------------
                                   3394 ; print counted string 
                                   3395 ; input:
                                   3396 ;   X 	address of string
                                   3397 ;--------------------------
      00131C                       3398 prt_cmd_name:
      009209 CC               [ 1] 3399 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00920A 88               [ 2] 3400 	incw x
      00920B F5 CF            [ 1] 3401 	and a,#15  
      00920D 00               [ 1] 3402 	push a 
      00920E 0D 1E            [ 1] 3403 1$: tnz (1,sp) 
      009210 01 7B            [ 1] 3404 	jreq 9$
      009212 03               [ 1] 3405 	ld a,(x)
      009213 A1 10 26         [ 4] 3406 	call putc 
      009216 06               [ 2] 3407 	incw x
      009217 72 BB            [ 1] 3408 	dec (1,sp)	 
      009219 00 0D            [ 2] 3409 	jra 1$
      00921B 20               [ 1] 3410 9$: pop a 
      00921C CD               [ 4] 3411 	ret	
                                   3412 
                                   3413 ;--------------------------
                                   3414 ; print TK_QSTR
                                   3415 ; converting control character
                                   3416 ; to backslash sequence
                                   3417 ; input:
                                   3418 ;   X        char *
                                   3419 ;-----------------------------
      001330                       3420 prt_quote:
      00921D 72 B0            [ 1] 3421 	ld a,#'"
      00921F 00 0D 20         [ 4] 3422 	call putc 
      009222 C7               [ 1] 3423 1$:	ld a,(x)
      009223 1E 01            [ 1] 3424 	jreq 9$
      009225 A6               [ 2] 3425 	incw x 
      009226 84 20            [ 1] 3426 	cp a,#SPACE 
      009227 25 0C            [ 1] 3427 	jrult 3$
      009227 5B 03 81         [ 4] 3428 	call putc
      00922A A1 5C            [ 1] 3429 	cp a,#'\ 
      00922A 52 03            [ 1] 3430 	jrne 1$ 
      001344                       3431 2$:
      00922C CD 91 E1         [ 4] 3432 	call putc 
      00922F A1 02            [ 2] 3433 	jra 1$
      009231 25               [ 1] 3434 3$: push a 
      009232 4F 1F            [ 1] 3435 	ld a,#'\
      009234 01 CD 89         [ 4] 3436 	call putc 
      009237 E7               [ 1] 3437 	pop a 
      009238 A1 02            [ 1] 3438 	sub a,#7
      00923A 25 42 0D         [ 1] 3439 	ld acc8,a 
      00923C 72 5F 00 0C      [ 1] 3440 	clr acc16
      00923C 6B 03 A4 30      [ 2] 3441 	ldw y,#escaped 
      009240 A1 30 27 07      [ 2] 3442 	addw y,acc16 
      009244 55 00            [ 1] 3443 	ld a,(y)
      009246 03 00            [ 2] 3444 	jra 2$
      009248 02 20            [ 1] 3445 9$: ld a,#'"
      00924A 33 02 A0         [ 4] 3446 	call putc 
      00924B 5C               [ 2] 3447 	incw x 
      00924B CD               [ 4] 3448 	ret
                                   3449 
                                   3450 ;--------------------------
                                   3451 ; return variable name 
                                   3452 ; from its address.
                                   3453 ; input:
                                   3454 ;   X    variable address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3455 ; output:
                                   3456 ;   A     variable letter
                                   3457 ;--------------------------
      00136C                       3458 var_name:
      00924C 91 E1 A1         [ 2] 3459 		subw x,#vars 
      00924F 84               [ 1] 3460 		ld a,xl 
      009250 27               [ 1] 3461 		srl a 
      009251 03 CC            [ 1] 3462 		add a,#'A 
      009253 88               [ 4] 3463 		ret 
                                   3464 
                                   3465 
                                   3466 ;--------------------------
                                   3467 ; decompile line from token list 
                                   3468 ; input:
                                   3469 ;   A       stop at this position 
                                   3470 ;   X 		pointer at line
                                   3471 ; output:
                                   3472 ;   none 
                                   3473 ;--------------------------	
                           000001  3474 	BASE_SAV=1
                           000002  3475 	WIDTH_SAV=2
                           000003  3476 	XSAVE=3
                           000005  3477 	LLEN=5
                           000005  3478 	VSIZE=5 
      001374                       3479 prt_basic_line:
      001374                       3480 	_vars VSIZE
      009254 F5 CF            [ 2]    1     sub sp,#VSIZE 
      009256 00 0D            [ 1] 3481 	ld (LLEN,sp),a  
      009258 1E 01 72         [ 1] 3482 	ld a,base
      00925B B0 00            [ 1] 3483 	ld (BASE_SAV,sp),a  
      00925D 0D 26 06         [ 1] 3484 	ld a,tab_width 
      009260 35 02            [ 1] 3485 	ld (WIDTH_SAV,sp),a 
      009262 00 0E 20         [ 2] 3486 	ldw ptr16,x
      009265 0C               [ 2] 3487 	ldw x,(x)
      009266 35 0A 00 0A      [ 1] 3488 	mov base,#10
      009266 2C 06 35 04      [ 1] 3489 	mov tab_width,#5
      00926A 00 0E 20         [ 4] 3490 	call print_int ; print line number 
      00926D 04 20            [ 1] 3491 	ld a,#SPACE 
      00926E CD 02 A0         [ 4] 3492 	call putc 
      00926E 35 01 00 0E      [ 1] 3493 	clr tab_width
      009272 AE 00 03         [ 2] 3494 	ldw x,#3
      009272 5F               [ 1] 3495 1$:	ld a,xl 
      009273 C6 00            [ 1] 3496 	cp a,(LLEN,sp)
      009275 0E 14            [ 1] 3497 	jrmi 2$
      009277 03 4D 27         [ 2] 3498 	jp 20$
      0013A5                       3499 2$:	 
      00927A 05 5C 00 17      [ 4] 3500 	ld a,([ptr16],x)
      00927C 5C               [ 2] 3501 	incw x 
      00927C 20 02            [ 2] 3502 	ldw (XSAVE,sp),x 
      00927E 1E 01 00 17      [ 5] 3503 	ldw x,([ptr16],x)
      009280 4D               [ 1] 3504 	tnz a 
      009280 A6 84            [ 1] 3505 	jrmi 3$
      009282 A1 02            [ 1] 3506 	cp a,#TK_QSTR 
      009282 5B 03            [ 1] 3507 	jreq 6$
      009284 81 03            [ 1] 3508 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009285 27 57            [ 1] 3509 	jreq 7$
      009285 AE 92            [ 2] 3510 	jra 8$
                                   3511 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0013BD                       3512 3$:	
      009287 9F CD            [ 1] 3513 	cp a,#TK_VAR 
      009289 83 33            [ 1] 3514 	jreq 4$
      00928B 96 1C            [ 1] 3515 	cp a,#TK_INTGR
      00928D 00 03            [ 1] 3516 	jreq 5$
      00928F 90 AE 18         [ 2] 3517 	cpw x,#remark 
      009292 00 CF            [ 1] 3518 	jrne 30$
      009294 00 0D            [ 1] 3519 	ld a,#''
      009296 72 B2 00         [ 4] 3520 	call putc 
      009299 0D CD            [ 2] 3521 	ldw x,(XSAVE,sp)
      00929B 83 D5 4F         [ 2] 3522 	addw x,#2
      00929E 81 0A 63 6F      [ 2] 3523 	addw x,ptr16  
      0092A2 6E 74 65         [ 4] 3524 	call puts 
      0092A5 6E 74 20         [ 2] 3525 	jp 20$ 
      0013DE                       3526 30$:
      0092A8 6F 66            [ 1] 3527 	ld a,#SPACE 
      0092AA 20 73 74         [ 4] 3528 	call putc 
      0092AD 61 63 6B         [ 4] 3529 	call cmd_name
      0092B0 20 66 72         [ 4] 3530 	call prt_cmd_name
      0092B3 6F 6D            [ 1] 3531 	ld a,#SPACE 
      0092B5 20 74 6F         [ 4] 3532 	call putc 
      0013EE                       3533 31$:
      0092B8 70 20            [ 2] 3534 	ldw x,(XSAVE,sp)
      0092BA 74 6F 20         [ 2] 3535 	addw x,#2
      0092BD 62 6F            [ 2] 3536 	jra 1$
                                   3537 ;; TK_VAR 
      0013F5                       3538 4$:
                                   3539 ;	ld a,#SPACE 
                                   3540 ;	call putc 
      0092BF 74 74 6F         [ 4] 3541 	call var_name
      0092C2 6D 3A 0A         [ 4] 3542 	call putc 
      0092C5 00 F1            [ 2] 3543 	jra 31$
                                   3544 ;; TK_INTGR
      0092C6                       3545 5$:
                                   3546 ;	ld a,#SPACE 
                                   3547 ;	call putc
      0092C6 35 10 00         [ 4] 3548 	call print_int 
      0092C9 0B 81            [ 2] 3549 	jra 31$
                                   3550 ;; TK_QSTR
      0092CB                       3551 6$:
      0092CB 35 0A            [ 2] 3552 	ldw x,(XSAVE,sp)
      0092CD 00 0B 81 17      [ 2] 3553 	addw x,ptr16 
      0092D0 CD 13 30         [ 4] 3554 	call prt_quote  
      0092D0 AE 16 90 72      [ 2] 3555 	subw x,ptr16  
      0092D4 B0 00 1F         [ 2] 3556 	jp 1$
                                   3557 ;; TK_CHAR 
      001412                       3558 7$:
      0092D7 A6 84            [ 1] 3559 	ld a,#'\ 
      0092D9 81 02 A0         [ 4] 3560 	call putc 
      0092DA 9E               [ 1] 3561 	ld a,xh 
      0092DA AE 16 90         [ 4] 3562 	call putc 
      0092DD 72 B0            [ 2] 3563 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092DF 00               [ 2] 3564 	incw x 
      0092E0 1F 90 CE         [ 2] 3565 	jp 1$ 
      0092E3 00 05            [ 1] 3566 8$: cp a,#TK_COLON 
      0092E5 90 C3            [ 1] 3567 	jrne 9$
      0092E7 00 1F            [ 1] 3568 	ld a,#':
      001427                       3569 81$:
      0092E9 25 0A 3B         [ 4] 3570 	call putc
      00142A                       3571 82$:
      0092EC 00 04            [ 2] 3572 	ldw x,(XSAVE,sp)
      0092EE 4B 00 72         [ 2] 3573 	jp 1$ 
      00142F                       3574 9$: 
      0092F1 F0 01            [ 1] 3575 	cp a,#TK_SHARP
      0092F3 5B 02            [ 1] 3576 	jrugt 10$ 
      0092F5 54 CF            [ 1] 3577 	sub a,#TK_ARRAY 
      0092F7 00 22            [ 1] 3578 	clrw y 
      0092F9 A6 84            [ 1] 3579 	ld yl,a
      0092FB 81 A9 14 85      [ 2] 3580 	addw y,#single_char 
      0092FC 90 F6            [ 1] 3581 	ld a,(y)
      0092FC CD 89            [ 2] 3582 	jra 81$ 
      001441                       3583 10$: 
      0092FE E7 A1            [ 1] 3584 	cp a,#TK_MINUS 
      009300 85 27            [ 1] 3585 	jrugt 11$
      009302 0A A1            [ 1] 3586 	sub a,#TK_PLUS 
      009304 06 27            [ 1] 3587 	clrw y 
      009306 03 CC            [ 1] 3588 	ld yl,a 
      009308 88 F5 14 8A      [ 2] 3589 	addw y,#add_char 
      00930A 90 F6            [ 1] 3590 	ld a,(y)
      00930A CD 91            [ 2] 3591 	jra 81$
      001453                       3592 11$:
      00930C 13 22            [ 1] 3593     cp a,#TK_MOD 
      00930D 22 0E            [ 1] 3594 	jrugt 12$
      00930D 89 CD            [ 1] 3595 	sub a,#TK_MULT
      00930F 89 E7            [ 1] 3596 	clrw y 
      009311 A1 32            [ 1] 3597 	ld yl,a 
      009313 27 03 CC 88      [ 2] 3598 	addw y,#mul_char
      009317 F5 F6            [ 1] 3599 	ld a,(y)
      009318 20 C2            [ 2] 3600 	jra 81$
      001465                       3601 12$:
      009318 CD 92            [ 1] 3602 	sub a,#TK_GT  
      00931A 2A               [ 1] 3603 	sll a 
      00931B A1               [ 1] 3604 	clrw x 
      00931C 84               [ 1] 3605 	ld xl,a 
      00931D 27 03 CC         [ 2] 3606 	addw x,#relop_str 
      009320 88               [ 2] 3607 	ldw x,(x)
      009321 F5 02 B3         [ 4] 3608 	call puts 
      009322 20 B7            [ 2] 3609 	jra 82$
      001473                       3610 20$: 
      009322 90 93            [ 1] 3611 	ld a,#CR 
      009324 85 FF 81         [ 4] 3612 	call putc
      009327 7B 02            [ 1] 3613 	ld a,(WIDTH_SAV,sp) 
      009327 CE 00 1D         [ 1] 3614 	ld tab_width,a 
      00932A C3 00            [ 1] 3615 	ld a,(BASE_SAV,sp) 
      00932C 1F 2B 01         [ 1] 3616 	ld base,a
      001482                       3617 	_drop VSIZE 
      00932F 81 05            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009330 81               [ 4] 3618 	ret 
                                   3619 
      009330 52 06 1F 05 FE        3620 single_char: .byte '@','(',')',',','#'
      009335 1F 01                 3621 add_char: .byte '+','-'
      009337 AE 7F FF              3622 mul_char: .byte '*','/','%'
      00933A 1F 03 CD 90 E8 4D 27  3623 relop_str: .word gt,equal,ge,lt,le,ne 
             31 A1 02 27 07
      009346 A1 01                 3624 gt: .asciz ">"
      009348 27 06                 3625 equal: .asciz "="
      00934A CC 88 F5              3626 ge: .asciz ">="
      00934D 85 1F                 3627 lt: .asciz "<"
      00934F 05 3D 00              3628 le: .asciz "<="
      009350 3C 3E 00              3629 ne:  .asciz "<>"
                                   3630 
                                   3631 
                                   3632 ;---------------------------------
                                   3633 ; BASIC: PRINT|? arg_list 
                                   3634 ; print values from argument list
                                   3635 ;----------------------------------
                           000001  3636 	COMMA=1
                           000001  3637 	VSIZE=1
      0014AA                       3638 print:
      009350 85 1F            [ 1] 3639 push #0 ; local variable COMMA 
      0014AC                       3640 reset_comma:
      009352 01 01            [ 1] 3641 	clr (COMMA,sp)
      009353                       3642 prt_loop:
      009353 CE 00 1D         [ 4] 3643 	call next_token
      009356 1F 05            [ 1] 3644 	cp a,#CMD_END 
      009358 C3 00            [ 1] 3645 	jrult print_exit ; colon or end of line 
      00935A 1F 2A            [ 1] 3646 	cp a,#TK_QSTR
      00935C 3C FE            [ 1] 3647 	jreq 1$
      00935E 13 01            [ 1] 3648 	cp a,#TK_CHAR 
      009360 2A 11            [ 1] 3649 	jreq 2$ 
      009362 1E 05            [ 1] 3650 	cp a,#TK_CFUNC 
      009364 E6 02            [ 1] 3651 	jreq 3$
      009366 C7 00            [ 1] 3652 	cp a,#TK_COMMA 
      009368 0E 72            [ 1] 3653 	jreq 4$
      00936A 5F 00            [ 1] 3654 	cp a,#TK_SHARP 
      00936C 0D 72            [ 1] 3655 	jreq 5$
      00936E BB 00            [ 2] 3656 	jra 7$ 
      0014CB                       3657 1$:	; print string 
      009370 0D 20 E3         [ 4] 3658 	call puts
      009373 20 DC            [ 2] 3659 	jra reset_comma
      0014D0                       3660 2$:	; print character 
      009373 1E               [ 1] 3661 	ld a,xl 
      009374 05 E6 02         [ 4] 3662 	call putc 
      009377 CD 93            [ 2] 3663 	jra reset_comma 
      0014D6                       3664 3$: ; print character function value  	
      009379 F4               [ 4] 3665 	call (x)
      00937A 1E               [ 1] 3666 	ld a,xl 
      00937B 05 E6 02         [ 4] 3667 	call putc
      00937E C7 00            [ 2] 3668 	jra reset_comma 
      0014DD                       3669 4$: ; set comma state 
      009380 0E 72            [ 1] 3670 	ld a,#255 
      009382 5F 00            [ 1] 3671 	ld (COMMA,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009384 0D 72 BB         [ 2] 3672 	jp prt_loop   
      0014E4                       3673 5$: ; # character must be followed by an integer   
      009387 00 0D C3         [ 4] 3674 	call next_token
      00938A 00 1F            [ 1] 3675 	cp a,#TK_INTGR 
      00938C 2A 0B            [ 1] 3676 	jreq 6$
      00938E 1F 05 FE         [ 2] 3677 	jp syntax_error 
      0014EE                       3678 6$: ; set tab width
      009391 13               [ 1] 3679 	ld a,xl 
      009392 03 2C            [ 1] 3680 	and a,#15 
      009394 04 1E 05         [ 1] 3681 	ld tab_width,a 
      009397 20 DC            [ 2] 3682 	jra reset_comma 
      009399                       3683 7$:	
      0014F6                       3684 	_unget_token
      009399 5B 06 81 00 01   [ 1]    1     mov in,in.saved
      00939C CD 11 AA         [ 4] 3685 	call relation 
      00939C F6 5C            [ 1] 3686 	cp a,#TK_INTGR
      00939E A4 0F            [ 1] 3687 	jreq 8$
      001502                       3688 	_unget_token
      0093A0 88 0D 01 27 09   [ 1]    1     mov in,in.saved
      0093A5 F6 CD 83         [ 2] 3689 	jp print_exit 
      0093A8 20 5C 0A         [ 4] 3690 8$: call print_int 
      0093AB 01 20            [ 2] 3691 	jra reset_comma 
      00150F                       3692 print_exit:
      0093AD F3 84            [ 1] 3693 	tnz (COMMA,sp)
      0093AF 81 05            [ 1] 3694 	jrne 9$
      0093B0 A6 0D            [ 1] 3695 	ld a,#CR 
      0093B0 A6 22 CD         [ 4] 3696     call putc 
      001518                       3697 9$:	_drop VSIZE 
      0093B3 83 20            [ 2]    1     addw sp,#VSIZE 
      0093B5 F6               [ 4] 3698 	ret 
                                   3699 
      00151B                       3700 print_type: 
                                   3701 
                                   3702 ;----------------------
                                   3703 ; 'save_context' and
                                   3704 ; 'rest_context' must be 
                                   3705 ; called at the same 
                                   3706 ; call stack depth 
                                   3707 ; i.e. SP must have the 
                                   3708 ; save value at  
                                   3709 ; entry point of both 
                                   3710 ; routine. 
                                   3711 ;---------------------
                           000004  3712 	CTXT_SIZE=4 ; size of saved data 
                                   3713 ;--------------------
                                   3714 ; save current BASIC
                                   3715 ; interpreter context 
                                   3716 ; on stack 
                                   3717 ;--------------------
      00151B                       3718 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00151B                       3719 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00151B                       3720 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00151B                       3721 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00151B                       3722 save_context:
      0093B6 27 2D 5C         [ 2] 3723 	ldw x,basicptr 
      0093B9 A1 20            [ 2] 3724 	ldw (BPTR,sp),x
      0093BB 25 0C CD         [ 1] 3725 	ld a,in 
      0093BE 83 20            [ 1] 3726 	ld (IN,sp),a
      0093C0 A1 5C 26         [ 1] 3727 	ld a,count 
      0093C3 F1 06            [ 1] 3728 	ld (CNT,sp),a  
      0093C4 81               [ 4] 3729 	ret
                                   3730 
                                   3731 ;-----------------------
                                   3732 ; restore previously saved 
                                   3733 ; BASIC interpreter context 
                                   3734 ; from stack 
                                   3735 ;-------------------------
      00152B                       3736 rest_context:
      0093C4 CD 83            [ 2] 3737 	ldw x,(BPTR,sp)
      0093C6 20 20 EC         [ 2] 3738 	ldw basicptr,x 
      0093C9 88 A6            [ 1] 3739 	ld a,(IN,sp)
      0093CB 5C CD 83         [ 1] 3740 	ld in,a
      0093CE 20 84            [ 1] 3741 	ld a,(CNT,sp)
      0093D0 A0 07 C7         [ 1] 3742 	ld count,a  
      0093D3 00               [ 4] 3743 	ret
                                   3744 
                                   3745 
                                   3746 
                                   3747 ;------------------------------------------
                                   3748 ; BASIC: INPUT [string]var[,[string]var]
                                   3749 ; input value in variables 
                                   3750 ; [string] optionally can be used as prompt 
                                   3751 ;-----------------------------------------
                           000001  3752 	CX_BPTR=1
                           000003  3753 	CX_IN=3
                           000004  3754 	CX_CNT=4
                           000005  3755 	SKIP=5
                           000006  3756 	VAR_ADDR=6
                           000007  3757 	VSIZE=7
      00153B                       3758 input_var:
      00153B                       3759 	_vars VSIZE 
      0093D4 0E 72            [ 2]    1     sub sp,#VSIZE 
      00153D                       3760 input_loop:
      0093D6 5F 00            [ 1] 3761 	clr (SKIP,sp)
      0093D8 0D 90 AE         [ 4] 3762 	call next_token 
      0093DB 8C 22            [ 1] 3763 	cp a,#TK_QSTR 
      0093DD 72 B9            [ 1] 3764 	jrne 1$ 
      0093DF 00 0D 90         [ 4] 3765 	call puts 
      0093E2 F6 20            [ 1] 3766 	cpl (SKIP,sp)
      0093E4 DF A6 22         [ 4] 3767 	call next_token 
      0093E7 CD 83            [ 1] 3768 1$: cp a,#TK_VAR  
      0093E9 20 5C            [ 1] 3769 	jreq 2$ 
      0093EB 81 08 75         [ 2] 3770 	jp syntax_error
      0093EC 1F 06            [ 2] 3771 2$:	ldw (VAR_ADDR,sp),x 
      0093EC 1D 00            [ 1] 3772 	tnz (SKIP,sp)
      0093EE 27 9F            [ 1] 3773 	jrne 21$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093F0 44 AB 41         [ 4] 3774 	call var_name 
      0093F3 81 02 A0         [ 4] 3775 	call putc   
      0093F4                       3776 21$:
      0093F4 52 05            [ 1] 3777 	ld a,#':
      0093F6 6B 05 C6         [ 4] 3778 	call putc 
      0093F9 00 0B 6B         [ 4] 3779 	call save_context 
      0093FC 01 C6 00 25      [ 1] 3780 	clr count  
      009400 6B 02 CF         [ 4] 3781 	call readln 
      009403 00 18 FE         [ 2] 3782 	ldw x,#tib 
      009406 35 0A 00         [ 1] 3783 	push count
      009409 0B 35            [ 1] 3784 	push #0 
      00940B 05 00 25         [ 2] 3785 	addw x,(1,sp)
      00940E CD               [ 2] 3786 	incw x 
      00157C                       3787 	_drop 2 
      00940F 8A 3C            [ 2]    1     addw sp,#2 
      009411 A6 20 CD 83      [ 1] 3788 	clr in 
      009415 20 72 5F         [ 4] 3789 	call get_token
      009418 00 25            [ 1] 3790 	cp a,#TK_INTGR
      00941A AE 00            [ 1] 3791 	jreq 3$ 
      00941C 03 9F 11         [ 4] 3792 	call rest_context 
      00941F 05 2B 03         [ 2] 3793 	jp syntax_error
      009422 CC 94            [ 2] 3794 3$: ldw y,(VAR_ADDR,sp) 
      009424 F3 FF            [ 2] 3795 	ldw (y),x 
      009425 CD 15 2B         [ 4] 3796 	call rest_context
      009425 72 D6 00         [ 4] 3797 	call next_token 
      009428 18 5C            [ 1] 3798 	cp a,#TK_COMMA 
      00942A 1F 03            [ 1] 3799 	jreq input_loop 
      00942C 72 DE            [ 1] 3800 	cp a,#TK_COLON 
      00942E 00 18            [ 2] 3801     jrule input_exit 
      009430 4D 2B 0A         [ 2] 3802 	jp syntax_error 
      0015A4                       3803 input_exit:
      0015A4                       3804 	_drop VSIZE 
      009433 A1 02            [ 2]    1     addw sp,#VSIZE 
      009435 27               [ 4] 3805 	ret 
                                   3806 
                                   3807 
                                   3808 ;---------------------
                                   3809 ; BASIC: REMARK | ' 
                                   3810 ; skip comment to end of line 
                                   3811 ;---------------------- 
      0015A7                       3812 remark:
      009436 4B A1 03 27 57   [ 1] 3813 	mov in,count 
      00943B 20               [ 4] 3814  	ret 
                                   3815 
                                   3816 
                                   3817 ;---------------------
                                   3818 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3819 ; read in loop 'addr'  
                                   3820 ; apply & 'mask' to value 
                                   3821 ; loop while result==0.  
                                   3822 ; 'xor_mask' is used to 
                                   3823 ; invert the wait logic.
                                   3824 ; i.e. loop while not 0.
                                   3825 ;---------------------
                           000001  3826 	XMASK=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                           000002  3827 	MASK=2
                           000003  3828 	ADDR=3
                           000004  3829 	VSIZE=4
      0015AD                       3830 wait: 
      0015AD                       3831 	_vars VSIZE
      00943C 64 04            [ 2]    1     sub sp,#VSIZE 
      00943D 0F 01            [ 1] 3832 	clr (XMASK,sp) 
      00943D A1 85 27         [ 4] 3833 	call arg_list 
      009440 34 A1            [ 1] 3834 	cp a,#2
      009442 84 27            [ 1] 3835 	jruge 0$
      009444 38 A3 96         [ 2] 3836 	jp syntax_error 
      009447 27 26            [ 1] 3837 0$:	cp a,#3
      009449 14 A6            [ 1] 3838 	jrult 1$
      00944B 27               [ 2] 3839 	popw x 
      00944C CD               [ 1] 3840 	ld a,xl
      00944D 83 20            [ 1] 3841 	ld (XMASK,sp),a 
      00944F 1E               [ 2] 3842 1$: popw x ; mask 
      009450 03               [ 1] 3843 	ld a,xl 
      009451 1C 00            [ 1] 3844 	ld (MASK,sp),a 
      009453 02               [ 2] 3845 	popw x ; address 
      009454 72               [ 1] 3846 2$:	ld a,(x)
      009455 BB 00            [ 1] 3847 	and a,(MASK,sp)
      009457 18 CD            [ 1] 3848 	xor a,(XMASK,sp)
      009459 83 33            [ 1] 3849 	jreq 2$ 
      0015CF                       3850 	_drop VSIZE 
      00945B CC 94            [ 2]    1     addw sp,#VSIZE 
      00945D F3               [ 4] 3851 	ret 
                                   3852 
                                   3853 ;---------------------
                                   3854 ; BASIC: BSET addr,mask
                                   3855 ; set bits at 'addr' corresponding 
                                   3856 ; to those of 'mask' that are at 1.
                                   3857 ; arguments:
                                   3858 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3859 ;   mask        mask|addr
                                   3860 ; output:
                                   3861 ;	none 
                                   3862 ;--------------------------
      00945E                       3863 bit_set:
      00945E A6 20 CD         [ 4] 3864 	call arg_list 
      009461 83 20            [ 1] 3865 	cp a,#2	 
      009463 CD 90            [ 1] 3866 	jreq 1$ 
      009465 57 CD 93         [ 2] 3867 	jp syntax_error
      0015DC                       3868 1$: 
      009468 9C               [ 2] 3869 	popw x ; mask 
      009469 A6               [ 1] 3870 	ld a,xl 
      00946A 20               [ 2] 3871 	popw x ; addr  
      00946B CD               [ 1] 3872 	or a,(x)
      00946C 83               [ 1] 3873 	ld (x),a
      00946D 20               [ 4] 3874 	ret 
                                   3875 
                                   3876 ;---------------------
                                   3877 ; BASIC: BRES addr,mask
                                   3878 ; reset bits at 'addr' corresponding 
                                   3879 ; to those of 'mask' that are at 1.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3880 ; arguments:
                                   3881 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3882 ;   mask	    ~mask&*addr  
                                   3883 ; output:
                                   3884 ;	none 
                                   3885 ;--------------------------
      00946E                       3886 bit_reset:
      00946E 1E 03 1C         [ 4] 3887 	call arg_list 
      009471 00 02            [ 1] 3888 	cp a,#2  
      009473 20 A8            [ 1] 3889 	jreq 1$ 
      009475 CC 08 75         [ 2] 3890 	jp syntax_error
      0015EC                       3891 1$: 
      009475 CD               [ 2] 3892 	popw x ; mask 
      009476 93               [ 1] 3893 	ld a,xl 
      009477 EC               [ 1] 3894 	cpl a 
      009478 CD               [ 2] 3895 	popw x ; addr  
      009479 83               [ 1] 3896 	and a,(x)
      00947A 20               [ 1] 3897 	ld (x),a 
      00947B 20               [ 4] 3898 	ret 
                                   3899 
                                   3900 ;---------------------
                                   3901 ; BASIC: BTOGL addr,mask
                                   3902 ; toggle bits at 'addr' corresponding 
                                   3903 ; to those of 'mask' that are at 1.
                                   3904 ; arguments:
                                   3905 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3906 ;   mask	    mask^*addr  
                                   3907 ; output:
                                   3908 ;	none 
                                   3909 ;--------------------------
      0015F3                       3910 bit_toggle:
      00947C F1 10 68         [ 4] 3911 	call arg_list 
      00947D A1 02            [ 1] 3912 	cp a,#2 
      00947D CD 8A            [ 1] 3913 	jreq 1$ 
      00947F 3C 20 EC         [ 2] 3914 	jp syntax_error
      009482 85               [ 2] 3915 1$: popw x ; mask 
      009482 1E               [ 1] 3916 	ld a,xl 
      009483 03               [ 2] 3917 	popw x ; addr  
      009484 72               [ 1] 3918 	xor a,(x)
      009485 BB               [ 1] 3919 	ld (x),a 
      009486 00               [ 4] 3920 	ret 
                                   3921 
                                   3922 
                                   3923 ;---------------------
                                   3924 ; BASIC: BTEST(addr,bit)
                                   3925 ; return bit value at 'addr' 
                                   3926 ; bit is in range {0..7}.
                                   3927 ; arguments:
                                   3928 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3929 ;   bit 	    bit position {0..7}  
                                   3930 ; output:
                                   3931 ;	none 
                                   3932 ;--------------------------
      001603                       3933 bit_test:
      009487 18 CD 93         [ 4] 3934 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00948A B0 72            [ 1] 3935 	cp a,#2
      00948C B0 00            [ 1] 3936 	jreq 0$
      00948E 18 CC 94         [ 2] 3937 	jp syntax_error
      00160D                       3938 0$:	
      009491 1D               [ 2] 3939 	popw x 
      009492 9F               [ 1] 3940 	ld a,xl 
      009492 A6 5C            [ 1] 3941 	and a,#7
      009494 CD               [ 1] 3942 	push a   
      009495 83 20            [ 1] 3943 	ld a,#1 
      009497 9E CD            [ 1] 3944 1$: tnz (1,sp)
      009499 83 20            [ 1] 3945 	jreq 2$
      00949B 1E               [ 1] 3946 	sll a 
      00949C 03 5C            [ 1] 3947 	dec (1,sp)
      00949E CC 94            [ 2] 3948 	jra 1$
      00161D                       3949 2$: _drop 1 
      0094A0 1D A1            [ 2]    1     addw sp,#1 
      0094A2 01               [ 2] 3950 	popw x 
      0094A3 26               [ 1] 3951 	and a,(x)
      0094A4 0A A6            [ 1] 3952 	jreq 3$
      0094A6 3A 01            [ 1] 3953 	ld a,#1 
      0094A7 5F               [ 1] 3954 3$:	clrw x 
      0094A7 CD               [ 1] 3955 	ld xl,a 
      0094A8 83 20            [ 1] 3956 	ld a,#TK_INTGR
      0094AA 81               [ 4] 3957 	ret
                                   3958 
                                   3959 
                                   3960 ;--------------------
                                   3961 ; BASIC: POKE addr,byte
                                   3962 ; put a byte at addr 
                                   3963 ;--------------------
      00162A                       3964 poke:
      0094AA 1E 03 CC         [ 4] 3965 	call arg_list 
      0094AD 94 1D            [ 1] 3966 	cp a,#2
      0094AF 27 03            [ 1] 3967 	jreq 1$
      0094AF A1 0A 22         [ 2] 3968 	jp syntax_error
      001634                       3969 1$:	
      0094B2 0E               [ 2] 3970 	popw x  
      0094B3 A0               [ 1] 3971     ld a,xl 
      0094B4 06               [ 2] 3972 	popw x 
      0094B5 90               [ 1] 3973 	ld (x),a 
      0094B6 5F               [ 4] 3974 	ret 
                                   3975 
                                   3976 ;-----------------------
                                   3977 ; BASIC: PEEK(addr)
                                   3978 ; get the byte at addr 
                                   3979 ; input:
                                   3980 ;	none 
                                   3981 ; output:
                                   3982 ;	X 		value 
                                   3983 ;-----------------------
      001639                       3984 peek:
      0094B7 90 97 72         [ 4] 3985 	call func_args
      0094BA A9 95            [ 1] 3986 	cp a,#1 
      0094BC 05 90            [ 1] 3987 	jreq 1$
      0094BE F6 20 E6         [ 2] 3988 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094C1 85               [ 2] 3989 1$: popw x 
      0094C1 A1               [ 1] 3990 	ld a,(x)
      0094C2 11               [ 1] 3991 	clrw x 
      0094C3 22               [ 1] 3992 	ld xl,a 
      0094C4 0E A0            [ 1] 3993 	ld a,#TK_INTGR
      0094C6 10               [ 4] 3994 	ret 
                                   3995 
                                   3996 ;---------------------------
                                   3997 ; BASIC IF expr : instructions
                                   3998 ; evaluate expr and if true 
                                   3999 ; execute instructions on same line. 
                                   4000 ;----------------------------
      00164A                       4001 if: 
      0094C7 90 5F 90         [ 4] 4002 	call relation 
      0094CA 97 72            [ 1] 4003 	cp a,#TK_INTGR
      0094CC A9 95            [ 1] 4004 	jreq 1$ 
      0094CE 0A 90 F6         [ 2] 4005 	jp syntax_error
      0094D1 20               [ 1] 4006 1$:	clr a 
      0094D2 D4               [ 2] 4007 	tnzw x 
      0094D3 26 05            [ 1] 4008 	jrne 9$  
                                   4009 ;skip to next line
      0094D3 A1 22 22 0E A0   [ 1] 4010 	mov in,count
      0094D8 20               [ 4] 4011 9$:	ret 
                                   4012 
                                   4013 ;------------------------
                                   4014 ; BASIC: FOR var=expr 
                                   4015 ; set variable to expression 
                                   4016 ; leave variable address 
                                   4017 ; on stack and set
                                   4018 ; FLOOP bit in 'flags'
                                   4019 ;-----------------
                           000001  4020 	RETL1=1 ; return address  
                           000003  4021 	FSTEP=3  ; variable increment
                           000005  4022 	LIMIT=5 ; loop limit 
                           000007  4023 	CVAR=7   ; control variable 
                           000009  4024 	INW=9   ;  in.w saved
                           00000B  4025 	BPTR=11 ; baseptr saved
                           00000A  4026 	VSIZE=10  
      00165E                       4027 for: ; { -- var_addr }
      0094D9 90               [ 2] 4028 	popw x ; call return address 
      00165F                       4029 	_vars VSIZE 
      0094DA 5F 90            [ 2]    1     sub sp,#VSIZE 
      0094DC 97               [ 2] 4030 	pushw x  ; RETL1 
      0094DD 72 A9            [ 1] 4031 	ld a,#TK_VAR 
      0094DF 95 0C 90         [ 4] 4032 	call expect
      0094E2 F6 20            [ 2] 4033 	ldw (CVAR,sp),x  ; control variable 
      0094E4 C2 12 8D         [ 4] 4034 	call let_var 
      0094E5 72 14 00 23      [ 1] 4035 	bset flags,#FLOOP 
                                   4036 ; open space on stack for loop data 
      0094E5 A0               [ 1] 4037 	clrw x 
      0094E6 31 48            [ 2] 4038 	ldw (BPTR,sp),x 
      0094E8 5F 97            [ 2] 4039 	ldw (INW,sp),x 
      0094EA 1C 95 0F         [ 4] 4040 	call next_token 
      0094ED FE CD            [ 1] 4041 	cp a,#TK_CMD 
      0094EF 83 33            [ 1] 4042 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094F1 20 B7 75         [ 2] 4043 	jp syntax_error
      0094F3                       4044 1$:  
      0094F3 A6 0D CD         [ 2] 4045 	cpw x,#to 
      0094F6 83 20            [ 1] 4046 	jreq to
      0094F8 7B 02 C7         [ 2] 4047 	jp syntax_error 
                                   4048 
                                   4049 ;-----------------------------------
                                   4050 ; BASIC: TO expr 
                                   4051 ; second part of FOR loop initilization
                                   4052 ; leave limit on stack and set 
                                   4053 ; FTO bit in 'flags'
                                   4054 ;-----------------------------------
      001687                       4055 to: ; { var_addr -- var_addr limit step }
      0094FB 00 25 7B 01 C7   [ 2] 4056 	btjt flags,#FLOOP,1$
      009500 00 0B 5B         [ 2] 4057 	jp syntax_error
      009503 05 81 40         [ 4] 4058 1$: call relation  
      009506 28 29            [ 1] 4059 	cp a,#TK_INTGR 
      009508 2C 23            [ 1] 4060 	jreq 2$ 
      00950A 2B 2D 2A         [ 2] 4061 	jp syntax_error
      00950D 2F 25            [ 2] 4062 2$: ldw (LIMIT,sp),x
                                   4063 ;	ldw x,in.w 
      00950F 95 1B 95         [ 4] 4064 	call next_token
      009512 1D 95            [ 1] 4065 	cp a,#TK_NONE  
      009514 1F 95            [ 1] 4066 	jreq 4$ 
      009516 22 95            [ 1] 4067 	cp a,#TK_CMD
      009518 24 95            [ 1] 4068 	jrne 3$
      00951A 27 3E 00         [ 2] 4069 	cpw x,#step 
      00951D 3D 00            [ 1] 4070 	jreq step
      0016AB                       4071 3$:	
      0016AB                       4072 	_unget_token   	 
      00951F 3E 3D 00 3C 00   [ 1]    1     mov in,in.saved
      0016B0                       4073 4$:	
      009524 3C 3D 00         [ 2] 4074 	ldw x,#1   ; default step  
      009527 3C 3E            [ 2] 4075 	ldw (FSTEP,sp),x 
      009529 00 14            [ 2] 4076 	jra store_loop_addr 
                                   4077 
                                   4078 
                                   4079 ;----------------------------------
                                   4080 ; BASIC: STEP expr 
                                   4081 ; optional third par of FOR loop
                                   4082 ; initialization. 	
                                   4083 ;------------------------------------
      00952A                       4084 step: ; {var limit -- var limit step}
      00952A 4B 00 00 23 03   [ 2] 4085 	btjt flags,#FLOOP,1$
      00952C CC 08 75         [ 2] 4086 	jp syntax_error
      00952C 0F 01 AA         [ 4] 4087 1$: call relation
      00952E A1 84            [ 1] 4088 	cp a,#TK_INTGR
      00952E CD 89            [ 1] 4089 	jreq 2$
      009530 E7 A1 02         [ 2] 4090 	jp syntax_error
      009533 25 5A            [ 2] 4091 2$:	ldw (FSTEP,sp),x ; step
                                   4092 ; leave loop back entry point on cstack 
                                   4093 ; cstack is 1 call deep from interpreter
      0016CB                       4094 store_loop_addr:
      009535 A1 02 27         [ 2] 4095 	ldw x,basicptr  
      009538 12 A1            [ 2] 4096 	ldw (BPTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00953A 03 27 13         [ 2] 4097 	ldw x,in.w 
      00953D A1 82            [ 2] 4098 	ldw (INW,sp),x   
      00953F 27 15 A1 09      [ 1] 4099 	bres flags,#FLOOP 
      009543 27 18 A1 0A      [ 1] 4100 	inc loop_depth  
      009547 27               [ 4] 4101 	ret 
                                   4102 
                                   4103 ;--------------------------------
                                   4104 ; BASIC: NEXT var 
                                   4105 ; FOR loop control 
                                   4106 ; increment variable with step 
                                   4107 ; and compare with limit 
                                   4108 ; loop if threshold not crossed.
                                   4109 ; else stack. 
                                   4110 ; and decrement 'loop_depth' 
                                   4111 ;--------------------------------
      0016DE                       4112 next: ; {var limit step retl1 -- [var limit step ] }
      009548 1B 20 2B 20      [ 1] 4113 	tnz loop_depth 
      00954B 26 03            [ 1] 4114 	jrne 1$ 
      00954B CD 83 33         [ 2] 4115 	jp syntax_error 
      0016E7                       4116 1$: 
      00954E 20 DC            [ 1] 4117 	ld a,#TK_VAR 
      009550 CD 10 56         [ 4] 4118 	call expect
                                   4119 ; check for good variable after NEXT 	 
      009550 9F CD            [ 2] 4120 	cpw x,(CVAR,sp)
      009552 83 20            [ 1] 4121 	jreq 2$  
      009554 20 D6 75         [ 2] 4122 	jp syntax_error ; not the good one 
      009556                       4123 2$: ; increment variable 
      009556 FD               [ 2] 4124 	ldw x,(x)  ; get var value 
      009557 9F CD 83         [ 2] 4125 	addw x,(FSTEP,sp) ; var+step 
      00955A 20 20            [ 2] 4126 	ldw y,(CVAR,sp)
      00955C CF FF            [ 2] 4127 	ldw (y),x ; save var new value 
                                   4128 ; check sign of STEP  
      00955D A6 80            [ 1] 4129 	ld a,#0x80
      00955D A6 FF            [ 1] 4130 	bcp a,(FSTEP,sp)
      00955F 6B 01            [ 1] 4131 	jrpl 4$
                                   4132 ;negative step 
      009561 CC 95            [ 2] 4133 	cpw x,(LIMIT,sp)
      009563 2E 1B            [ 1] 4134 	jrslt loop_done
      009564 20 04            [ 2] 4135 	jra loop_back 
      001707                       4136 4$: ; positive step
      009564 CD 89            [ 2] 4137 	cpw x,(LIMIT,sp)
      009566 E7 A1            [ 1] 4138 	jrsgt loop_done
      00170B                       4139 loop_back:
      009568 84 27            [ 2] 4140 	ldw x,(BPTR,sp)
      00956A 03 CC 88         [ 2] 4141 	ldw basicptr,x 
      00956D F5 01 00 23 05   [ 2] 4142 	btjf flags,#FRUN,1$ 
      00956E E6 02            [ 1] 4143 	ld a,(2,x)
      00956E 9F A4 0F         [ 1] 4144 	ld count,a
      009571 C7 00            [ 2] 4145 1$:	ldw x,(INW,sp)
      009573 25 20 B6         [ 2] 4146 	ldw in.w,x 
      009576 81               [ 4] 4147 	ret 
      001720                       4148 loop_done:
                                   4149 	; remove loop data from stack  
      009576 55               [ 2] 4150 	popw x
      001721                       4151 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009577 00 03            [ 2]    1     addw sp,#VSIZE 
      009579 00 02 CD 92      [ 1] 4152 	dec loop_depth 
                                   4153 ;	pushw x 
                                   4154 ;	ret 
      00957D 2A               [ 2] 4155 	jp (x)
                                   4156 
                                   4157 ;----------------------------
                                   4158 ; called by goto/gosub
                                   4159 ; to get target line number 
                                   4160 ;---------------------------
      001728                       4161 get_target_line:
      00957E A1 84 27         [ 4] 4162 	call relation 
      009581 08 55            [ 1] 4163 	cp a,#TK_INTGR
      009583 00 03            [ 1] 4164 	jreq 1$
      009585 00 02 CC         [ 2] 4165 	jp syntax_error
      009588 95 8F CD         [ 4] 4166 1$:	call search_lineno  
      00958B 8A               [ 2] 4167 	tnzw x 
      00958C 3C 20            [ 1] 4168 	jrne 2$ 
      00958E 9D 05            [ 1] 4169 	ld a,#ERR_NO_LINE 
      00958F CC 08 77         [ 2] 4170 	jp tb_error 
      00958F 0D               [ 4] 4171 2$:	ret 
                                   4172 
                                   4173 ;------------------------
                                   4174 ; BASIC: GOTO line# 
                                   4175 ; jump to line# 
                                   4176 ; here cstack is 2 call deep from interpreter 
                                   4177 ;------------------------
      00173E                       4178 goto:
      009590 01 26 05 A6 0D   [ 2] 4179 	btjt flags,#FRUN,0$ 
      009595 CD 83            [ 1] 4180 	ld a,#ERR_RUN_ONLY
      009597 20 5B 01         [ 2] 4181 	jp tb_error 
      00959A 81               [ 4] 4182 	ret 
      00959B CD 17 28         [ 4] 4183 0$:	call get_target_line
      00959B                       4184 jp_to_target:
      00959B CE 00 05         [ 2] 4185 	ldw basicptr,x 
      00959E 1F 03            [ 1] 4186 	ld a,(2,x)
      0095A0 C6 00 02         [ 1] 4187 	ld count,a 
      0095A3 6B 05 C6 00      [ 1] 4188 	mov in,#3 
      0095A7 04               [ 4] 4189 	ret 
                                   4190 
                                   4191 
                                   4192 ;--------------------
                                   4193 ; BASIC: GOSUB line#
                                   4194 ; basic subroutine call
                                   4195 ; actual line# and basicptr 
                                   4196 ; are saved on cstack
                                   4197 ; here cstack is 2 call deep from interpreter 
                                   4198 ;--------------------
                           000003  4199 	RET_ADDR=3
                           000005  4200 	RET_INW=5
                           000004  4201 	VSIZE=4  
      001759                       4202 gosub:
      0095A8 6B 06 81 23 06   [ 2] 4203 	btjt flags,#FRUN,0$ 
      0095AB A6 06            [ 1] 4204 	ld a,#ERR_RUN_ONLY
      0095AB 1E 03 CF         [ 2] 4205 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095AE 00               [ 4] 4206 	ret 
      0095AF 05               [ 2] 4207 0$:	popw x 
      001765                       4208 	_vars VSIZE  
      0095B0 7B 05            [ 2]    1     sub sp,#VSIZE 
      0095B2 C7               [ 2] 4209 	pushw x 
      0095B3 00 02 7B         [ 2] 4210 	ldw x,basicptr
      0095B6 06 C7            [ 2] 4211 	ldw (RET_ADDR,sp),x 
      0095B8 00 04 81         [ 4] 4212 	call get_target_line  
      0095BB 89               [ 2] 4213 	pushw x 
      0095BB 52 07 00         [ 2] 4214 	ldw x,in.w 
      0095BD 1F 07            [ 2] 4215 	ldw (RET_INW+2,sp),x
      0095BD 0F               [ 2] 4216 	popw x 
      0095BE 05 CD            [ 2] 4217 	jra jp_to_target
                                   4218 
                                   4219 ;------------------------
                                   4220 ; BASIC: RETURN 
                                   4221 ; exit from a subroutine 
                                   4222 ; 
                                   4223 ;------------------------
      001779                       4224 return:
      0095C0 89 E7 A1 02 26   [ 2] 4225 	btjt flags,#FRUN,0$ 
      0095C5 08 CD            [ 1] 4226 	ld a,#ERR_RUN_ONLY
      0095C7 83 33 03         [ 2] 4227 	jp tb_error 
      001783                       4228 0$:	
      0095CA 05 CD            [ 2] 4229 	ldw x,(RET_ADDR,sp) 
      0095CC 89 E7 A1         [ 2] 4230 	ldw basicptr,x
      0095CF 85 27            [ 1] 4231 	ld a,(2,x)
      0095D1 03 CC 88         [ 1] 4232 	ld count,a  
      0095D4 F5 1F            [ 2] 4233 	ldw x,(RET_INW,sp)
      0095D6 06 0D 05         [ 2] 4234 	ldw in.w,x 
      0095D9 26               [ 2] 4235 	popw x 
      001793                       4236 	_drop VSIZE 
      0095DA 06 CD            [ 2]    1     addw sp,#VSIZE 
      0095DC 93               [ 2] 4237 	pushw x
      0095DD EC               [ 4] 4238 	ret  
                                   4239 
                                   4240 
                                   4241 ;----------------------------------
                                   4242 ; BASIC: RUN
                                   4243 ; run BASIC program in RAM
                                   4244 ;----------------------------------- 
      001797                       4245 run: 
      0095DE CD 83 20 23 02   [ 2] 4246 	btjf flags,#FRUN,0$  
      0095E1 4F               [ 1] 4247 	clr a 
      0095E1 A6               [ 4] 4248 	ret
      00179E                       4249 0$: 
      0095E2 3A CD 83 20 CD   [ 2] 4250 	btjf flags,#FBREAK,1$
      0017A3                       4251 	_drop 2 
      0095E7 95 9B            [ 2]    1     addw sp,#2 
      0095E9 72 5F 00         [ 4] 4252 	call rest_context
      0017A8                       4253 	_drop CTXT_SIZE 
      0095EC 04 CD            [ 2]    1     addw sp,#CTXT_SIZE 
      0095EE 8B 49 AE 16      [ 1] 4254 	bres flags,#FBREAK 
      0095F2 90 3B 00 04      [ 1] 4255 	bset flags,#FRUN 
      0095F6 4B 00 72         [ 2] 4256 	jp interpreter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095F9 FB 01 5C         [ 2] 4257 1$:	ldw x,txtbgn
      0095FC 5B 02 72         [ 2] 4258 	cpw x,txtend 
      0095FF 5F 00            [ 1] 4259 	jrmi run_it 
      009601 02 CD 8C         [ 2] 4260 	ldw x,#err_no_prog
      009604 FE A1 84         [ 4] 4261 	call puts 
      009607 27 06 CD 95 AB   [ 1] 4262 	mov in,count
      00960C CC               [ 4] 4263 	ret 
      0017C9                       4264 run_it:	 
      00960D 88 F5 16         [ 4] 4265     call ubound 
      0017CC                       4266 	_drop 2 ; drop return address 
      009610 06 90            [ 2]    1     addw sp,#2 
                                   4267 ; clear data pointer 
      009612 FF               [ 1] 4268 	clrw x 
      009613 CD 95 AB         [ 2] 4269 	ldw data_ptr,x 
      009616 CD 89 E7 A1      [ 1] 4270 	clr data_ofs 
      00961A 09 27 A0 A1      [ 1] 4271 	clr data_len 
                                   4272 ; initialize BASIC pointer 
      00961E 01 23 03         [ 2] 4273 	ldw x,txtbgn 
      009621 CC 88 F5         [ 2] 4274 	ldw basicptr,x 
      009624 E6 02            [ 1] 4275 	ld a,(2,x)
      009624 5B 07 81         [ 1] 4276 	ld count,a
      009627 35 03 00 01      [ 1] 4277 	mov in,#3	
      009627 55 00 04 00      [ 1] 4278 	bset flags,#FRUN 
      00962B 02 81 1B         [ 2] 4279 	jp interpreter 
                                   4280 
                                   4281 
                                   4282 ;----------------------
                                   4283 ; BASIC: END
                                   4284 ; end running program
                                   4285 ;---------------------- 
      00962D                       4286 cmd_end: 
                                   4287 ; clean stack 
      00962D 52 04 0F         [ 2] 4288 	ldw x,#STACK_EMPTY
      009630 01               [ 1] 4289 	ldw sp,x 
      009631 CD 90 E8         [ 2] 4290 	jp warm_start
                                   4291 
                                   4292 
                                   4293 ;-----------------------
                                   4294 ; BASIC: TONE expr1,expr2
                                   4295 ; used TIMER2 channel 1
                                   4296 ; to produce a tone 
                                   4297 ; arguments:
                                   4298 ;    expr1   frequency 
                                   4299 ;    expr2   duration msec.
                                   4300 ;---------------------------
      0017F7                       4301 tone:
      009634 A1 02 24         [ 4] 4302 	call arg_list 
      009637 03 CC            [ 1] 4303 	cp a,#2 
      009639 88 F5            [ 1] 4304 	jreq 1$
      00963B A1 03 25         [ 2] 4305 	jp syntax_error 
      001801                       4306 1$: 
      00963E 04               [ 2] 4307 	popw x ; duration
      00963F 85 9F            [ 2] 4308 	popw y ; frequency 
      001804                       4309 beep:  
      009641 6B               [ 2] 4310 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009642 01 85 9F         [ 2] 4311 	ldw x,#TIM2_CLK_FREQ
      009645 6B               [ 2] 4312 	divw x,y 
                                   4313 ; round to nearest integer 
      009646 02 85 F6 14      [ 2] 4314 	cpw y,#TIM2_CLK_FREQ/2
      00964A 02 18            [ 1] 4315 	jrmi 2$
      00964C 01               [ 2] 4316 	incw x 
      001810                       4317 2$:	 
      00964D 27               [ 1] 4318 	ld a,xh 
      00964E F9 5B 04         [ 1] 4319 	ld TIM2_ARRH,a 
      009651 81               [ 1] 4320 	ld a,xl 
      009652 C7 53 0E         [ 1] 4321 	ld TIM2_ARRL,a 
                                   4322 ; 50% duty cycle 
      009652 CD               [ 1] 4323 	ccf 
      009653 90               [ 2] 4324 	rrcw x 
      009654 E8               [ 1] 4325 	ld a,xh 
      009655 A1 02 27         [ 1] 4326 	ld TIM2_CCR1H,a 
      009658 03               [ 1] 4327 	ld a,xl
      009659 CC 88 F5         [ 1] 4328 	ld TIM2_CCR1L,a
      00965C 72 10 53 08      [ 1] 4329 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00965C 85 9F 85 FA      [ 1] 4330 	bset TIM2_CR1,#TIM2_CR1_CEN
      009660 F7 81 53 04      [ 1] 4331 	bset TIM2_EGR,#TIM2_EGR_UG
      009662 85               [ 2] 4332 	popw x 
      009662 CD 90 E8         [ 4] 4333 	call pause02
      009665 A1 02 27 03      [ 1] 4334 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009669 CC 88 F5 00      [ 1] 4335 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00966C 81               [ 4] 4336 	ret 
                                   4337 
                                   4338 ;-------------------------------
                                   4339 ; BASIC: ADCON 0|1 [,divisor]  
                                   4340 ; disable/enanble ADC 
                                   4341 ;-------------------------------
                           000003  4342 	ONOFF=3 
                           000001  4343 	DIVSOR=1
                           000004  4344 	VSIZE=4 
      00183B                       4345 power_adc:
      00966C 85 9F 43         [ 4] 4346 	call arg_list 
      00966F 85 F4            [ 1] 4347 	cp a,#2	
      009671 F7 81            [ 1] 4348 	jreq 1$
      009673 A1 01            [ 1] 4349 	cp a,#1 
      009673 CD 90            [ 1] 4350 	jreq 0$ 
      009675 E8 A1 02         [ 2] 4351 	jp syntax_error 
      009678 27 03 CC         [ 2] 4352 0$: ldw x,#0
      00967B 88               [ 2] 4353 	pushw x  ; divisor 
      00967C F5 85            [ 2] 4354 1$: ldw x,(ONOFF,sp)
      00967E 9F               [ 2] 4355 	tnzw x 
      00967F 85 F8            [ 1] 4356 	jreq 2$ 
      009681 F7 81            [ 2] 4357 	ldw x,(DIVSOR,sp) ; divisor 
      009683 9F               [ 1] 4358 	ld a,xl
      009683 CD 90            [ 1] 4359 	and a,#7
      009685 E3               [ 1] 4360 	swap a 
      009686 A1 02 27         [ 1] 4361 	ld ADC_CR1,a
      009689 03 CC 88 F5      [ 1] 4362 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00968D 72 10 54 01      [ 1] 4363 	bset ADC_CR1,#ADC_CR1_ADON 
      001863                       4364 	_usec_dly 7 
      00968D 85 9F A4         [ 2]    1     ldw x,#(16*7-2)/4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009690 07               [ 2]    2     decw x
      009691 88               [ 1]    3     nop 
      009692 A6 01            [ 1]    4     jrne .-4
      009694 0D 01            [ 2] 4365 	jra 3$
      009696 27 05 48 0A      [ 1] 4366 2$: bres ADC_CR1,#ADC_CR1_ADON
      00969A 01 20 F7 5B      [ 1] 4367 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001874                       4368 3$:	_drop VSIZE 
      00969E 01 85            [ 2]    1     addw sp,#VSIZE 
      0096A0 F4               [ 4] 4369 	ret
                                   4370 
                                   4371 ;-----------------------------
                                   4372 ; BASIC: ADCREAD (channel)
                                   4373 ; read adc channel {0..5}
                                   4374 ; output:
                                   4375 ;   A 		TK_INTGR 
                                   4376 ;   X 		value 
                                   4377 ;-----------------------------
      001877                       4378 analog_read:
      0096A1 27 02 A6         [ 4] 4379 	call func_args 
      0096A4 01 5F            [ 1] 4380 	cp a,#1 
      0096A6 97 A6            [ 1] 4381 	jreq 1$
      0096A8 84 81 75         [ 2] 4382 	jp syntax_error
      0096AA 85               [ 2] 4383 1$: popw x 
      0096AA CD 90 E8         [ 2] 4384 	cpw x,#5 
      0096AD A1 02            [ 2] 4385 	jrule 2$
      0096AF 27 03            [ 1] 4386 	ld a,#ERR_BAD_VALUE
      0096B1 CC 88 F5         [ 2] 4387 	jp tb_error 
      0096B4 9F               [ 1] 4388 2$: ld a,xl
      0096B4 85 9F 85         [ 1] 4389 	ld acc8,a 
      0096B7 F7 81            [ 1] 4390 	ld a,#5
      0096B9 C0 00 0D         [ 1] 4391 	sub a,acc8 
      0096B9 CD 90 E3         [ 1] 4392 	ld ADC_CSR,a
      0096BC A1 01 27 03      [ 1] 4393 	bset ADC_CR2,#ADC_CR2_ALIGN
      0096C0 CC 88 F5 85      [ 1] 4394 	bset ADC_CR1,#ADC_CR1_ADON
      0096C4 F6 5F 97 A6 84   [ 2] 4395 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0096C9 81 54 04         [ 2] 4396 	ldw x,ADC_DRH
      0096CA A6 84            [ 1] 4397 	ld a,#TK_INTGR
      0096CA CD               [ 4] 4398 	ret 
                                   4399 
                                   4400 ;-----------------------
                                   4401 ; BASIC: DREAD(pin)
                                   4402 ; Arduino pins 
                                   4403 ; read state of a digital pin 
                                   4404 ; pin# {0..15}
                                   4405 ; output:
                                   4406 ;    A 		TK_INTGR
                                   4407 ;    X      0|1 
                                   4408 ;-------------------------
                           000001  4409 	PINNO=1
                           000001  4410 	VSIZE=1
      0018AB                       4411 digital_read:
      0018AB                       4412 	_vars VSIZE 
      0096CB 92 2A            [ 2]    1     sub sp,#VSIZE 
      0096CD A1 84 27         [ 4] 4413 	call func_args
      0096D0 03 CC            [ 1] 4414 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0096D2 88 F5            [ 1] 4415 	jreq 1$
      0096D4 4F 5D 26         [ 2] 4416 	jp syntax_error
      0096D7 05               [ 2] 4417 1$: popw x 
      0096D8 55 00 04         [ 2] 4418 	cpw x,#15 
      0096DB 00 02            [ 2] 4419 	jrule 2$
      0096DD 81 0A            [ 1] 4420 	ld a,#ERR_BAD_VALUE
      0096DE CC 08 77         [ 2] 4421 	jp tb_error 
      0096DE 85 52 0A         [ 4] 4422 2$:	call select_pin 
      0096E1 89 A6            [ 1] 4423 	ld (PINNO,sp),a
      0096E3 85 CD            [ 1] 4424 	ld a,(GPIO_IDR,x)
      0096E5 90 D6            [ 1] 4425 	tnz (PINNO,sp)
      0096E7 1F 07            [ 1] 4426 	jreq 8$
      0096E9 CD               [ 1] 4427 3$: srl a 
      0096EA 93 0D            [ 1] 4428 	dec (PINNO,sp)
      0096EC 72 14            [ 1] 4429 	jrne 3$ 
      0096EE 00 24            [ 1] 4430 8$: and a,#1 
      0096F0 5F               [ 1] 4431 	clrw x 
      0096F1 1F               [ 1] 4432 	ld xl,a 
      0096F2 0B 1F            [ 1] 4433 	ld a,#TK_INTGR
      0018D8                       4434 	_drop VSIZE
      0096F4 09 CD            [ 2]    1     addw sp,#VSIZE 
      0096F6 89               [ 4] 4435 	ret
                                   4436 
                                   4437 ;-----------------------
                                   4438 ; BASIC: DWRITE pin,0|1
                                   4439 ; Arduino pins 
                                   4440 ; write to a digital pin 
                                   4441 ; pin# {0..15}
                                   4442 ; output:
                                   4443 ;    A 		TK_INTGR
                                   4444 ;    X      0|1 
                                   4445 ;-------------------------
                           000001  4446 	PINNO=1
                           000002  4447 	PINVAL=2
                           000002  4448 	VSIZE=2
      0018DB                       4449 digital_write:
      0018DB                       4450 	_vars VSIZE 
      0096F7 E7 A1            [ 2]    1     sub sp,#VSIZE 
      0096F9 80 27 03         [ 4] 4451 	call arg_list  
      0096FC CC 88            [ 1] 4452 	cp a,#2 
      0096FE F5 03            [ 1] 4453 	jreq 1$
      0096FF CC 08 75         [ 2] 4454 	jp syntax_error
      0096FF A3               [ 2] 4455 1$: popw x 
      009700 97               [ 1] 4456 	ld a,xl 
      009701 07 27            [ 1] 4457 	ld (PINVAL,sp),a
      009703 03               [ 2] 4458 	popw x 
      009704 CC 88 F5         [ 2] 4459 	cpw x,#15 
      009707 23 05            [ 2] 4460 	jrule 2$
      009707 72 04            [ 1] 4461 	ld a,#ERR_BAD_VALUE
      009709 00 24 03         [ 2] 4462 	jp tb_error 
      00970C CC 88 F5         [ 4] 4463 2$:	call select_pin 
      00970F CD 92            [ 1] 4464 	ld (PINNO,sp),a 
      009711 2A A1            [ 1] 4465 	ld a,#1
      009713 84 27            [ 1] 4466 	tnz (PINNO,sp)
      009715 03 CC            [ 1] 4467 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009717 88               [ 1] 4468 3$: sll a
      009718 F5 1F            [ 1] 4469 	dec (PINNO,sp)
      00971A 05 CD            [ 1] 4470 	jrne 3$
      00971C 89 E7            [ 1] 4471 4$: tnz (PINVAL,sp)
      00971E A1 00            [ 1] 4472 	jrne 5$
      009720 27               [ 1] 4473 	cpl a 
      009721 0E A1            [ 1] 4474 	and a,(GPIO_ODR,x)
      009723 80 26            [ 2] 4475 	jra 8$
      009725 05 A3            [ 1] 4476 5$: or a,(GPIO_ODR,x)
      009727 97 37            [ 1] 4477 8$: ld (GPIO_ODR,x),a 
      001913                       4478 	_drop VSIZE 
      009729 27 0C            [ 2]    1     addw sp,#VSIZE 
      00972B 81               [ 4] 4479 	ret
                                   4480 
                                   4481 
                                   4482 ;-----------------------
                                   4483 ; BASIC: STOP
                                   4484 ; stop progam execution  
                                   4485 ; without resetting pointers 
                                   4486 ; the program is resumed
                                   4487 ; with RUN 
                                   4488 ;-------------------------
      001916                       4489 stop:
      00972B 55 00 03 00 02   [ 2] 4490 	btjt flags,#FRUN,2$
      009730 4F               [ 1] 4491 	clr a
      009730 AE               [ 4] 4492 	ret 
      00191D                       4493 2$:	 
                                   4494 ; create space on cstack to save context 
      009731 00 01 1F         [ 2] 4495 	ldw x,#break_point 
      009734 03 20 14         [ 4] 4496 	call puts 
      009737                       4497 	_drop 2 ;drop return address 
      009737 72 04            [ 2]    1     addw sp,#2 
      001925                       4498 	_vars CTXT_SIZE ; context size 
      009739 00 24            [ 2]    1     sub sp,#CTXT_SIZE 
      00973B 03 CC 88         [ 4] 4499 	call save_context 
      00973E F5 CD 92         [ 2] 4500 	ldw x,#tib 
      009741 2A A1 84         [ 2] 4501 	ldw basicptr,x
      009744 27               [ 1] 4502 	clr (x)
      009745 03 CC 88 F5      [ 1] 4503 	clr count  
      009749 1F               [ 1] 4504 	clrw x 
      00974A 03 00 00         [ 2] 4505 	ldw in.w,x
      00974B 72 11 00 23      [ 1] 4506 	bres flags,#FRUN 
      00974B CE 00 05 1F      [ 1] 4507 	bset flags,#FBREAK
      00974F 0B CE 00         [ 2] 4508 	jp interpreter 
      009752 01 1F 09 72 15 00 24  4509 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 5C 00 21 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4510 
                                   4511 ;-----------------------
                                   4512 ; BASIC: NEW
                                   4513 ; from command line only 
                                   4514 ; free program memory
                                   4515 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4516 ;------------------------
      00975E                       4517 new: 
      00975E 72 5D 00 21 26   [ 2] 4518 	btjf flags,#FRUN,0$ 
      009763 03               [ 4] 4519 	ret 
      001968                       4520 0$:	
      009764 CC 88 F5         [ 4] 4521 	call clear_basic 
      009767 81               [ 4] 4522 	ret 
                                   4523 	 
                                   4524 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4525 ;  file system routines
                                   4526 ;  MCU flash memory from
                                   4527 ;  0x10000-0x27fff is 
                                   4528 ;  used to store BASIC 
                                   4529 ;  program files. 
                                   4530 ;  use 128 bytes sectors
                                   4531 ;  because this is the MCU 
                                   4532 ;  row size.
                                   4533 ;  file entry aligned to row
                                   4534 ;  	name  variable length
                                   4535 ;  	size  2 bytes  
                                   4536 ; 	data  variable length 
                                   4537 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4538 
                                   4539 ;---------------------------
                                   4540 ; fill pad with zeros 
                                   4541 ;--------------------------
      00196C                       4542 zero_pad:
      009767 A6 85 CD         [ 2] 4543 	ldw x,#pad 
      00976A 90 D6            [ 1] 4544 	ld a,#PAD_SIZE 
      00976C 13               [ 1] 4545 1$:	clr (x)
      00976D 07               [ 2] 4546 	incw x 
      00976E 27               [ 1] 4547 	dec a 
      00976F 03 CC            [ 1] 4548 	jrne 1$
      009771 88               [ 4] 4549 	ret 
                                   4550 
                                   4551 ;--------------------------
                                   4552 ; align farptr to BLOCK_SIZE 
                                   4553 ;---------------------------
      001977                       4554 row_align:
      009772 F5 7F            [ 1] 4555 	ld a,#0x7f 
      009773 C4 00 18         [ 1] 4556 	and a,farptr+2 
      009773 FE 72            [ 1] 4557 	jreq 1$ 
      009775 FB 03 16         [ 2] 4558 	ldw x,farptr+1 
      009778 07 90 FF         [ 2] 4559 	addw x,#BLOCK_SIZE 
      00977B A6 80            [ 1] 4560 	jrnc 0$
      00977D 15 03 2A 06      [ 1] 4561 	inc farptr 
      009781 13               [ 1] 4562 0$: ld a,xl 
      009782 05 2F            [ 1] 4563 	and a,#0x80
      009784 1B               [ 1] 4564 	ld xl,a
      009785 20 04 17         [ 2] 4565 	ldw farptr+1,x  	
      009787 81               [ 4] 4566 1$:	ret
                                   4567 
                                   4568 ;--------------------
                                   4569 ; input:
                                   4570 ;   X     increment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4571 ; output:
                                   4572 ;   farptr  incremented 
                                   4573 ;---------------------
      001992                       4574 incr_farptr:
      009787 13 05 2C 15      [ 2] 4575 	addw x,farptr+1 
      00978B 24 04            [ 1] 4576 	jrnc 1$
      00978B 1E 0B CF 00      [ 1] 4577 	inc farptr 
      00978F 05 72 01         [ 2] 4578 1$:	ldw farptr+1,x  
      009792 00               [ 4] 4579 	ret 
                                   4580 
                                   4581 ;------------------------------
                                   4582 ; extended flash memory used as FLASH_DRIVE 
                                   4583 ; seek end of used flash drive   
                                   4584 ; starting at 0x10000 address.
                                   4585 ; 4 consecutives 0 bytes signal free space. 
                                   4586 ; input:
                                   4587 ;	none
                                   4588 ; output:
                                   4589 ;   ffree     free_addr| 0 if memory full.
                                   4590 ;------------------------------
      0019A0                       4591 seek_fdrive:
                                   4592 ; start scan at 0x10000 address 
      009793 24 05            [ 1] 4593 	ld a,#1
      009795 E6 02 C7         [ 1] 4594 	ld farptr,a 
      009798 00               [ 1] 4595 	clrw x 
      009799 04 1E 09         [ 2] 4596 	ldw farptr+1,x 
      0019A9                       4597 1$:
      00979C CF 00 01         [ 2] 4598 	ldw x,#3  
      00979F 81 AF 00 16      [ 5] 4599 2$:	ldf a,([farptr],x) 
      0097A0 26 05            [ 1] 4600 	jrne 3$
      0097A0 85               [ 2] 4601 	decw x
      0097A1 5B 0A            [ 1] 4602 	jrpl 2$
      0097A3 72 5A            [ 2] 4603 	jra 4$ 
      0097A5 00 21 FC         [ 2] 4604 3$:	ldw x,#BLOCK_SIZE 
      0097A8 CD 19 92         [ 4] 4605 	call incr_farptr
      0097A8 CD 92 2A         [ 2] 4606 	ldw x,#0x280  
      0097AB A1 84 27         [ 2] 4607 	cpw x,farptr
      0097AE 03 CC            [ 1] 4608 	jrmi 1$
      0019C5                       4609 4$: ; copy farptr to ffree	 
      0097B0 88 F5 CD         [ 2] 4610 	ldw x,farptr 
      0097B3 84 80 5D         [ 1] 4611 	ld a,farptr+2 
      0097B6 26 05 A6         [ 2] 4612 	ldw ffree,x 
      0097B9 05 CC 88         [ 1] 4613 	ld ffree+2,a  
      0097BC F7               [ 4] 4614 	ret 
                                   4615 
                                   4616 ;-----------------------
                                   4617 ; return amount of free 
                                   4618 ; space on flash drive
                                   4619 ; input:
                                   4620 ;   none
                                   4621 ; output:
                                   4622 ;   acc24   free space 
                                   4623 ;-----------------------
      0019D2                       4624 disk_free:
      0097BD 81 80 00         [ 2] 4625 	ldw x,#0x8000
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097BE 72 B0 00 1A      [ 2] 4626 	subw x,ffree+1
      0097BE 72 00            [ 1] 4627 	ld a,#2
      0097C0 00 24 06         [ 1] 4628 	sbc a,ffree 
      0097C3 A6 06 CC         [ 1] 4629 	ld acc24,a 
      0097C6 88 F7 81         [ 2] 4630 	ldw acc16,x 
      0097C9 CD               [ 4] 4631 	ret 
                                   4632 
                                   4633 ;-----------------------
                                   4634 ; compare file name 
                                   4635 ; with name pointed by Y  
                                   4636 ; input:
                                   4637 ;   farptr   file name 
                                   4638 ;   Y        target name 
                                   4639 ; output:
                                   4640 ;   farptr 	 at file_name
                                   4641 ;   X 		 farptr[x] point at size field  
                                   4642 ;   Carry    0|1 no match|match  
                                   4643 ;----------------------
      0019E5                       4644 cmp_name:
      0097CA 97               [ 1] 4645 	clrw x
      0097CB A8 AF 00 16      [ 5] 4646 1$:	ldf a,([farptr],x)
      0097CC 90 F1            [ 1] 4647 	cp a,(y)
      0097CC CF 00            [ 1] 4648 	jrne 4$
      0097CE 05               [ 1] 4649 	tnz a 
      0097CF E6 02            [ 1] 4650 	jreq 9$ 
      0097D1 C7               [ 2] 4651     incw x 
      0097D2 00 04            [ 2] 4652 	incw y 
      0097D4 35 03            [ 2] 4653 	jra 1$
      0019F6                       4654 4$: ;no match 
      0097D6 00               [ 1] 4655 	tnz a 
      0097D7 02 81            [ 1] 4656 	jreq 5$
      0097D9 5C               [ 2] 4657 	incw x 
      0097D9 72 00 00 24      [ 5] 4658 	ldf a,([farptr],x)
      0097DD 06 A6            [ 2] 4659 	jra 4$  
      0097DF 06               [ 2] 4660 5$:	incw x ; farptr[x] point at 'size' field 
      0097E0 CC               [ 1] 4661 	rcf 
      0097E1 88               [ 4] 4662 	ret
      001A03                       4663 9$: ; match  
      0097E2 F7               [ 2] 4664 	incw x  ; farptr[x] at 'size' field 
      0097E3 81               [ 1] 4665 	scf 
      0097E4 85               [ 4] 4666 	ret 
                                   4667 
                                   4668 ;-----------------------
                                   4669 ; search file in 
                                   4670 ; flash memory 
                                   4671 ; input:
                                   4672 ;   Y       file name  
                                   4673 ; output:
                                   4674 ;   farptr  addr at name|0
                                   4675 ;   X       offset to size field
                                   4676 ;-----------------------
                           000001  4677 	FSIZE=1
                           000003  4678 	YSAVE=3
                           000004  4679 	VSIZE=4 
      001A06                       4680 search_file: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      001A06                       4681 	_vars VSIZE
      0097E5 52 04            [ 2]    1     sub sp,#VSIZE 
      0097E7 89 CE            [ 2] 4682 	ldw (YSAVE,sp),y  
      0097E9 00               [ 1] 4683 	clrw x 
      0097EA 05 1F 03         [ 2] 4684 	ldw farptr+1,x 
      0097ED CD 97 A8 89      [ 1] 4685 	mov farptr,#1
      001A12                       4686 1$:	
                                   4687 ; check if farptr is after any file 
                                   4688 ; if  0 then so.
      0097F1 CE 00 01 1F      [ 5] 4689 	ldf a,[farptr]
      0097F5 07 85            [ 1] 4690 	jreq 6$
      0097F7 20               [ 1] 4691 2$: clrw x 	
      0097F8 D3 03            [ 2] 4692 	ldw y,(YSAVE,sp) 
      0097F9 CD 19 E5         [ 4] 4693 	call cmp_name
      0097F9 72 00            [ 1] 4694 	jrc 9$
      0097FB 00 24 05 A6      [ 5] 4695 	ldf a,([farptr],x)
      0097FF 06 CC            [ 1] 4696 	ld (FSIZE,sp),a 
      009801 88               [ 2] 4697 	incw x 
      009802 F7 AF 00 16      [ 5] 4698 	ldf a,([farptr],x)
      009803 6B 02            [ 1] 4699 	ld (FSIZE+1,sp),a 
      009803 1E               [ 2] 4700 	incw x 
      009804 03 CF 00         [ 2] 4701 	addw x,(FSIZE,sp) ; skip over file data
      009807 05 E6 02         [ 4] 4702 	call incr_farptr
      00980A C7 00 04         [ 4] 4703 	call row_align  
      00980D 1E 05 CF         [ 2] 4704 	ldw x,#0x280
      009810 00 01 85         [ 2] 4705 	cpw x,farptr 
      009813 5B 04            [ 1] 4706 	jrpl 1$
      001A3F                       4707 6$: ; file not found 
      009815 89 81 00 16      [ 1] 4708 	clr farptr
      009817 72 5F 00 17      [ 1] 4709 	clr farptr+1 
      009817 72 01 00 24      [ 1] 4710 	clr farptr+2 
      001A4B                       4711 	_drop VSIZE 
      00981B 02 4F            [ 2]    1     addw sp,#VSIZE 
      00981D 81               [ 1] 4712 	rcf
      00981E 81               [ 4] 4713 	ret
      001A4F                       4714 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A4F                       4715 	_drop VSIZE 
      00981E 72 09            [ 2]    1     addw sp,#VSIZE 
      009820 00               [ 1] 4716 	scf 	
      009821 24               [ 4] 4717 	ret
                                   4718 
                                   4719 ;--------------------------------
                                   4720 ; BASIC: SAVE "name" 
                                   4721 ; save text program in 
                                   4722 ; flash memory used as permanent
                                   4723 ; storage from address 0x10000-0x27fff 
                                   4724 ;--------------------------------
                           000001  4725 	BSIZE=1
                           000003  4726 	NAMEPTR=3
                           000005  4727 	XSAVE=5
                           000007  4728 	YSAVE=7
                           000008  4729 	VSIZE=8 
      001A53                       4730 save:
      009822 12 5B 02 CD 95   [ 2] 4731 	btjf flags,#FRUN,0$ 
      009827 AB 5B            [ 1] 4732 	ld a,#ERR_CMD_ONLY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009829 04 72 19         [ 2] 4733 	jp tb_error
      001A5D                       4734 0$:	 
      00982C 00 24 72         [ 2] 4735 	ldw x,txtend 
      00982F 10 00 24 CC      [ 2] 4736 	subw x,txtbgn
      009833 89 9B            [ 1] 4737 	jrne 1$
                                   4738 ; nothing to save 
      009835 CE 00 1D         [ 2] 4739 	ldw x,#err_no_prog 
      009838 C3 00 1F         [ 4] 4740 	call puts 
      00983B 2B 0C AE 88 90   [ 1] 4741 	mov in,count 
      009840 CD               [ 4] 4742 	ret  	
      001A72                       4743 1$:	
      001A72                       4744 	_vars VSIZE 
      009841 83 33            [ 2]    1     sub sp,#VSIZE 
      009843 55 00            [ 2] 4745 	ldw (BSIZE,sp),x 
      009845 04 00 02         [ 4] 4746 	call next_token	
      009848 81 02            [ 1] 4747 	cp a,#TK_QSTR
      009849 27 03            [ 1] 4748 	jreq 2$
      009849 CD 92 DA         [ 2] 4749 	jp syntax_error
      001A80                       4750 2$: 
      00984C 5B 02            [ 2] 4751 	ldw (NAMEPTR,sp),x  
      00984E 5F CF 00         [ 4] 4752 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4753 ; check if enough free space 
      009851 07 72 5F         [ 4] 4754 	call strlen 
      009854 00 09 72         [ 2] 4755 	addw x,#3 
      009857 5F 00 0A         [ 2] 4756 	addw x,(BSIZE,sp)
      00985A CE               [ 1] 4757 	clr a 
      00985B 00 1D CF 00      [ 2] 4758 	addw x,ffree+1 
      00985F 05 E6 02         [ 1] 4759 	adc a,ffree 
      009862 C7 00            [ 1] 4760 	cp a,#2
      009864 04 35            [ 1] 4761 	jrmi 21$
      009866 03 00 02         [ 2] 4762 	cpw x,#0x8000
      009869 72 10            [ 1] 4763 	jrmi 21$
      00986B 00 24            [ 1] 4764 	ld a,#ERR_NO_FSPACE  
      00986D CC 89 9B         [ 2] 4765 	jp tb_error
      009870                       4766 21$: 
                                   4767 ; check for existing file of that name 
      009870 AE 17            [ 2] 4768 	ldw y,(NAMEPTR,sp)	
      009872 FF 94 CC         [ 4] 4769 	call search_file 
      009875 89 7C            [ 1] 4770 	jrnc 3$ 
      009877 A6 08            [ 1] 4771 	ld a,#ERR_DUPLICATE 
      009877 CD 90 E8         [ 2] 4772 	jp tb_error 
      001AB0                       4773 3$:	; initialize farptr 
      00987A A1 02 27         [ 2] 4774 	ldw x,ffree 
      00987D 03 CC 88         [ 1] 4775 	ld a,ffree+2 
      009880 F5 00 16         [ 2] 4776 	ldw farptr,x 
      009881 C7 00 18         [ 1] 4777 	ld farptr+2,a 
                                   4778 ;** write file name to row buffer **	
      009881 85 90            [ 2] 4779 	ldw y,(NAMEPTR,sp)  
      009883 85 16 E0         [ 2] 4780 	ldw x,#pad 
      009884 CD 03 B0         [ 4] 4781 	call strcpy
      009884 89 AE F4         [ 4] 4782 	call strlen 
      009887 24               [ 2] 4783 	incw  x
      009888 65 90 A3         [ 2] 4784 	addw x,#pad 
                                   4785 ; ** write file size to row buffer 
      00988B 7A 12            [ 2] 4786 	ldw y,(BSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00988D 2B               [ 2] 4787 	ldw (x),y 
      00988E 01 5C 02         [ 2] 4788 	addw x,#2 
                                   4789 ; ** write file data to row buffer 
      009890 90 CE 00 1C      [ 2] 4790 	ldw y,txtbgn 
      009890 9E C7            [ 1] 4791 6$:	ld a,(y)
      009892 53 0D            [ 2] 4792 	incw y
      009894 9F               [ 1] 4793 	ld (x),a 
      009895 C7               [ 2] 4794 	incw x
      009896 53 0E 8C 56      [ 2] 4795 	cpw y,txtend 
      00989A 9E C7            [ 1] 4796 	jreq 12$
      00989C 53 0F 9F         [ 2] 4797 	cpw x,#stack_full 
      00989F C7 53            [ 1] 4798 	jrmi 6$
      001AE6                       4799 12$:
      0098A1 10 72            [ 2] 4800 	ldw (YSAVE,sp),y 
      001AE8                       4801 14$: ; zero buffer end 
      0098A3 10 53 08         [ 2] 4802 	cpw x,#stack_full
      0098A6 72 10            [ 1] 4803 	jreq 16$
      0098A8 53               [ 1] 4804 	clr (x)
      0098A9 00               [ 2] 4805 	incw x 
      0098AA 72 10            [ 2] 4806 	jra 14$
      001AF1                       4807 16$:
      0098AC 53 04 85         [ 2] 4808 	ldw x,#pad 
      0098AF CD 9E 25         [ 4] 4809 	call write_row 
      0098B2 72 11 53         [ 2] 4810 	ldw x,#BLOCK_SIZE 
      0098B5 08 72 11         [ 4] 4811 	call incr_farptr
      0098B8 53 00 81         [ 2] 4812 	ldw x,#pad 
      0098BB 16 07            [ 2] 4813 	ldw y,(YSAVE,sp)
      0098BB CD 90 E8 A1      [ 2] 4814 	cpw y,txtend 
      0098BF 02 27            [ 1] 4815 	jrmi 6$
                                   4816 ; save farptr in ffree
      0098C1 0B A1 01         [ 2] 4817 	ldw x,farptr 
      0098C4 27 03 CC         [ 1] 4818 	ld a,farptr+2 
      0098C7 88 F5 AE         [ 2] 4819 	ldw ffree,x 
      0098CA 00 00 89         [ 1] 4820 	ld ffree+2,a
                                   4821 ; print file size 	
      0098CD 1E 03            [ 2] 4822 	ldw x,(BSIZE,sp) 
      0098CF 5D 27 1A         [ 4] 4823 	call print_int 
      001B19                       4824 	_drop VSIZE 
      0098D2 1E 01            [ 2]    1     addw sp,#VSIZE 
      0098D4 9F               [ 4] 4825 	ret 
                                   4826 
                                   4827 ;----------------------
                                   4828 ; load file in RAM memory
                                   4829 ; input:
                                   4830 ;    farptr point at file size 
                                   4831 ; output:
                                   4832 ;   y point after BASIC program in RAM.
                                   4833 ;------------------------
      001B1C                       4834 load_file:
      0098D5 A4 07 4E         [ 4] 4835 	call incr_farptr  
      0098D8 C7 54 01         [ 4] 4836 	call clear_basic  
      0098DB 72               [ 1] 4837 	clrw x
      0098DC 16 50 CA 72      [ 5] 4838 	ldf a,([farptr],x)
      0098E0 10 54            [ 1] 4839 	ld yh,a 
      0098E2 01               [ 2] 4840 	incw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098E3 AE 00 1B 5A      [ 5] 4841 	ldf a,([farptr],x)
      0098E7 9D               [ 2] 4842 	incw x 
      0098E8 26 FA            [ 1] 4843 	ld yl,a 
      0098EA 20 08 72 11      [ 2] 4844 	addw y,txtbgn
      0098EE 54 01 72 17      [ 2] 4845 	ldw txtend,y
      0098F2 50 CA 5B 04      [ 2] 4846 	ldw y,txtbgn
      001B3D                       4847 3$:	; load BASIC text 	
      0098F6 81 AF 00 16      [ 5] 4848 	ldf a,([farptr],x)
      0098F7 90 F7            [ 1] 4849 	ld (y),a 
      0098F7 CD               [ 2] 4850 	incw x 
      0098F8 90 E3            [ 2] 4851 	incw y 
      0098FA A1 01 27 03      [ 2] 4852 	cpw y,txtend 
      0098FE CC 88            [ 1] 4853 	jrmi 3$
      009900 F5               [ 4] 4854 	ret 
                                   4855 
                                   4856 ;------------------------
                                   4857 ; BASIC: LOAD "file" 
                                   4858 ; load file to RAM 
                                   4859 ; for execution 
                                   4860 ;------------------------
      001B4D                       4861 load:
      009901 85 A3 00 05 23   [ 2] 4862 	btjf flags,#FRUN,0$ 
      009906 05 A6            [ 1] 4863 	jreq 0$ 
      009908 0A CC            [ 1] 4864 	ld a,#ERR_CMD_ONLY 
      00990A 88 F7 9F         [ 2] 4865 	jp tb_error 
      001B59                       4866 0$:	
      00990D C7 00 0E         [ 4] 4867 	call next_token 
      009910 A6 05            [ 1] 4868 	cp a,#TK_QSTR
      009912 C0 00            [ 1] 4869 	jreq 1$
      009914 0E C7 54         [ 2] 4870 	jp syntax_error 
      009917 00 72            [ 1] 4871 1$:	ldw y,x 
      009919 16 54 02         [ 4] 4872 	call search_file 
      00991C 72 10            [ 1] 4873 	jrc 2$ 
      00991E 54 01            [ 1] 4874 	ld a,#ERR_NOT_FILE
      009920 72 0F 54         [ 2] 4875 	jp tb_error  
      001B6F                       4876 2$:
      009923 00 FB CE         [ 4] 4877 	call load_file
                                   4878 ; print loaded size 	 
      009926 54 04 A6         [ 2] 4879 	ldw x,txtend 
      009929 84 81 00 1C      [ 2] 4880 	subw x,txtbgn
      00992B CD 09 BC         [ 4] 4881 	call print_int 
      00992B 52               [ 4] 4882 	ret 
                                   4883 
                                   4884 ;-----------------------------------
                                   4885 ; BASIC: FORGET ["file_name"] 
                                   4886 ; erase file_name and all others 
                                   4887 ; after it. 
                                   4888 ; without argument erase all files 
                                   4889 ;-----------------------------------
                           000001  4890 	NEW_FREE=1 
                           000003  4891 	VSIZE=3 
      001B7D                       4892 forget:
      001B7D                       4893 	_vars VSIZE 
      00992C 01 CD            [ 2]    1     sub sp,#VSIZE 
      00992E 90 E3 A1         [ 4] 4894 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009931 01 27            [ 1] 4895 	cp a,#TK_NONE 
      009933 03 CC            [ 1] 4896 	jreq 3$ 
      009935 88 F5            [ 1] 4897 	cp a,#TK_QSTR
      009937 85 A3            [ 1] 4898 	jreq 1$
      009939 00 0F 23         [ 2] 4899 	jp syntax_error
      00993C 05 A6            [ 1] 4900 1$: ldw y,x 
      00993E 0A CC 88 F7 CD   [ 1] 4901 	mov in,count 
      009943 9F 58 6B         [ 4] 4902 	call search_file
      009946 01 E6            [ 1] 4903 	jrc 2$
      009948 01 0D            [ 1] 4904 	ld a,#ERR_NOT_FILE 
      00994A 01 27 05         [ 2] 4905 	jp tb_error 
      001B9E                       4906 2$: 
      00994D 44 0A 01         [ 2] 4907 	ldw x,farptr
      009950 26 FB A4         [ 1] 4908 	ld a,farptr+2
      009953 01 5F            [ 2] 4909 	jra 4$ 
      001BA6                       4910 3$: ; forget all files 
      009955 97 A6 84         [ 2] 4911 	ldw x,#0x100
      009958 5B               [ 1] 4912 	clr a 
      009959 01 81 16         [ 2] 4913 	ldw farptr,x 
      00995B C7 00 18         [ 1] 4914 	ld farptr+2,a 
      001BB0                       4915 4$:	; save new free address 
      00995B 52 02            [ 2] 4916 	ldw (NEW_FREE,sp),x
      00995D CD 90            [ 1] 4917 	ld (NEW_FREE+2,sp),a 
      00995F E8 A1 02         [ 4] 4918 	call move_erase_to_ram
      009962 27 03 CC         [ 4] 4919 5$: call block_erase 
      009965 88 F5 85         [ 2] 4920 	ldw x,#BLOCK_SIZE 
      009968 9F 6B 02         [ 4] 4921 	call incr_farptr 
      00996B 85 A3 00         [ 4] 4922 	call row_align 
                                   4923 ; check if all blocks erased
      00996E 0F 23 05         [ 1] 4924 	ld a,farptr+2  
      009971 A6 0A CC         [ 1] 4925 	sub a,ffree+2
      009974 88 F7 CD         [ 1] 4926 	ld a,farptr+1 
      009977 9F 58 6B         [ 1] 4927 	sbc a,ffree+1 
      00997A 01 A6 01         [ 1] 4928 	ld a,farptr 
      00997D 0D 01 27         [ 1] 4929 	sbc a,ffree 
      009980 05 48            [ 1] 4930 	jrmi 5$ 
      009982 0A 01            [ 1] 4931 	ld a,(NEW_FREE+2,sp)
      009984 26 FB            [ 2] 4932 	ldw x,(NEW_FREE,sp)
      009986 0D 02 26         [ 1] 4933 	ld ffree+2,a 
      009989 05 43 E4         [ 2] 4934 	ldw ffree,x 
      001BE1                       4935 	_drop VSIZE 
      00998C 00 20            [ 2]    1     addw sp,#VSIZE 
      00998E 02               [ 4] 4936 	ret 
                                   4937 
                                   4938 ;----------------------
                                   4939 ; BASIC: DIR 
                                   4940 ; list saved files 
                                   4941 ;----------------------
                           000001  4942 	COUNT=1 ; files counter 
                           000002  4943 	VSIZE=2 
      001BE4                       4944 directory:
      001BE4                       4945 	_vars VSIZE 
      00998F EA 00            [ 2]    1     sub sp,#VSIZE 
      009991 E7               [ 1] 4946 	clrw x 
      009992 00 5B            [ 2] 4947 	ldw (COUNT,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009994 02 81 17         [ 2] 4948 	ldw farptr+1,x 
      009996 35 01 00 16      [ 1] 4949 	mov farptr,#1 
      001BF0                       4950 dir_loop:
      009996 72               [ 1] 4951 	clrw x 
      009997 00 00 24 02      [ 5] 4952 	ldf a,([farptr],x)
      00999B 4F 81            [ 1] 4953 	jreq 8$ 
      00999D                       4954 1$: ;name loop 	
      00999D AE 99 C4 CD      [ 5] 4955 	ldf a,([farptr],x)
      0099A1 83 33            [ 1] 4956 	jreq 2$ 
      0099A3 5B 02 52         [ 4] 4957 	call putc 
      0099A6 04               [ 2] 4958 	incw x 
      0099A7 CD 95            [ 2] 4959 	jra 1$
      0099A9 9B               [ 2] 4960 2$: incw x ; skip ending 0. 
      0099AA AE 16            [ 1] 4961 	ld a,#SPACE 
      0099AC 90 CF 00         [ 4] 4962 	call putc 
                                   4963 ; get file size 	
      0099AF 05 7F 72 5F      [ 5] 4964 	ldf a,([farptr],x)
      0099B3 00 04            [ 1] 4965 	ld yh,a 
      0099B5 5F               [ 2] 4966 	incw x 
      0099B6 CF 00 01 72      [ 5] 4967 	ldf a,([farptr],x)
      0099BA 11               [ 2] 4968 	incw x 
      0099BB 00 24            [ 1] 4969 	ld yl,a 
      0099BD 72 18            [ 2] 4970 	pushw y 
      0099BF 00 24 CC         [ 2] 4971 	addw x,(1,sp)
                                   4972 ; skip to next file 
      0099C2 89 9B 0A         [ 4] 4973 	call incr_farptr
      0099C5 62 72 65         [ 4] 4974 	call row_align
                                   4975 ; print file size 
      0099C8 61               [ 2] 4976 	popw x ; file size 
      0099C9 6B 20 70         [ 4] 4977 	call print_int 
      0099CC 6F 69            [ 1] 4978 	ld a,#CR 
      0099CE 6E 74 2C         [ 4] 4979 	call putc
      0099D1 20 52            [ 2] 4980 	ldw x,(COUNT,sp)
      0099D3 55               [ 2] 4981 	incw x
      0099D4 4E 20            [ 2] 4982 	ldw (COUNT,sp),x  
      0099D6 74 6F            [ 2] 4983 	jra dir_loop
      001C32                       4984 8$: ; print number of files 
      0099D8 20 72            [ 2] 4985 	ldw x,(COUNT,sp)
      0099DA 65 73 75         [ 4] 4986 	call print_int 
      0099DD 6D 65 2E         [ 2] 4987 	ldw x,#file_count 
      0099E0 0A 00 B3         [ 4] 4988 	call puts  
                                   4989 ; print drive free space 	
      0099E2 CD 19 D2         [ 4] 4990 	call disk_free
      0099E2 72               [ 1] 4991 	clrw x  
      0099E3 01 00 24 01      [ 1] 4992 	mov base,#10 
      0099E7 81 09 CC         [ 4] 4993 	call prti24 
      0099E8 AE 1C 59         [ 2] 4994 	ldw x,#drive_free
      0099E8 CD 87 61         [ 4] 4995 	call puts 
      001C4E                       4996 	_drop VSIZE 
      0099EB 81 02            [ 2]    1     addw sp,#VSIZE 
      0099EC 81               [ 4] 4997 	ret
      0099EC AE 16 E0 A6 80 7F 5C  4998 file_count: .asciz " files\n"
             4A
      0099F4 26 FB 81 74 65 73 20  4999 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   5000 
                                   5001 ;---------------------
                                   5002 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5003 ; write 1 or more byte to FLASH or EEPROM
                                   5004 ; starting at address  
                                   5005 ; input:
                                   5006 ;   expr1  	is address 
                                   5007 ;   expr2,...,exprn   are bytes to write
                                   5008 ; output:
                                   5009 ;   none 
                                   5010 ;---------------------
                           000001  5011 	ADDR=1
                           000002  5012 	VSIZ=2 
      0099F7                       5013 write:
      001C66                       5014 	_vars VSIZE 
      0099F7 A6 7F            [ 2]    1     sub sp,#VSIZE 
      0099F9 C4 00 19 27      [ 1] 5015 	clr farptr ; expect 16 bits address 
      0099FD 13 CE 00         [ 4] 5016 	call expression
      009A00 18 1C            [ 1] 5017 	cp a,#TK_INTGR 
      009A02 00 80            [ 1] 5018 	jreq 0$
      009A04 24 04 72         [ 2] 5019 	jp syntax_error
      009A07 5C 00            [ 2] 5020 0$: ldw (ADDR,sp),x 
      009A09 17 9F A4         [ 4] 5021 	call next_token 
      009A0C 80 97            [ 1] 5022 	cp a,#TK_COMMA 
      009A0E CF 00            [ 1] 5023 	jreq 1$ 
      009A10 18 81            [ 2] 5024 	jra 9$ 
      009A12 CD 11 61         [ 4] 5025 1$:	call expression
      009A12 72 BB            [ 1] 5026 	cp a,#TK_INTGR
      009A14 00 18            [ 1] 5027 	jreq 2$
      009A16 24 04 72         [ 2] 5028 	jp syntax_error
      009A19 5C               [ 1] 5029 2$:	ld a,xl 
      009A1A 00 17            [ 2] 5030 	ldw x,(ADDR,sp) 
      009A1C CF 00 18         [ 2] 5031 	ldw farptr+1,x 
      009A1F 81               [ 1] 5032 	clrw x 
      009A20 CD 01 CD         [ 4] 5033 	call write_byte
      009A20 A6 01            [ 2] 5034 	ldw x,(ADDR,sp)
      009A22 C7               [ 2] 5035 	incw x 
      009A23 00 17            [ 2] 5036 	jra 0$ 
      001C9A                       5037 9$:
      001C9A                       5038 	_drop VSIZE
      009A25 5F CF            [ 2]    1     addw sp,#VSIZE 
      009A27 00               [ 4] 5039 	ret 
                                   5040 
                                   5041 
                                   5042 ;---------------------
                                   5043 ;BASIC: CHAR(expr)
                                   5044 ; évaluate expression 
                                   5045 ; and take the 7 least 
                                   5046 ; bits as ASCII character
                                   5047 ;---------------------
      001C9D                       5048 char:
      009A28 18 10 63         [ 4] 5049 	call func_args 
      009A29 A1 01            [ 1] 5050 	cp a,#1
      009A29 AE 00            [ 1] 5051 	jreq 1$
      009A2B 03 92 AF         [ 2] 5052 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A2E 00               [ 2] 5053 1$:	popw x 
      009A2F 17               [ 1] 5054 	ld a,xl 
      009A30 26 05            [ 1] 5055 	and a,#0x7f 
      009A32 5A               [ 1] 5056 	ld xl,a
      009A33 2A F7            [ 1] 5057 	ld a,#TK_CHAR
      009A35 20               [ 4] 5058 	ret
                                   5059 
                                   5060 ;---------------------
                                   5061 ; BASIC: ASC(string|char)
                                   5062 ; extract first character 
                                   5063 ; of string argument 
                                   5064 ; return it as TK_INTGR 
                                   5065 ;---------------------
      001CAF                       5066 ascii:
      009A36 0E AE            [ 1] 5067 	ld a,#TK_LPAREN
      009A38 00 80 CD         [ 4] 5068 	call expect 
      009A3B 9A 12 AE         [ 4] 5069 	call next_token 
      009A3E 02 80            [ 1] 5070 	cp a,#TK_QSTR 
      009A40 C3 00            [ 1] 5071 	jreq 1$
      009A42 17 2B            [ 1] 5072 	cp a,#TK_CHAR 
      009A44 E4 06            [ 1] 5073 	jreq 2$ 
      009A45 CC 08 75         [ 2] 5074 	jp syntax_error
      001CC2                       5075 1$: 
      009A45 CE               [ 1] 5076 	ld a,(x) 
      009A46 00               [ 1] 5077 	clrw x
      009A47 17               [ 1] 5078 	ld xl,a 
      001CC5                       5079 2$: 
      009A48 C6               [ 2] 5080 	pushw x 
      009A49 00 19            [ 1] 5081 	ld a,#TK_RPAREN 
      009A4B CF 00 1A         [ 4] 5082 	call expect
      009A4E C7               [ 2] 5083 	popw x 
      009A4F 00 1C            [ 1] 5084 	ld a,#TK_INTGR 
      009A51 81               [ 4] 5085 	ret 
                                   5086 
                                   5087 ;---------------------
                                   5088 ;BASIC: KEY
                                   5089 ; wait for a character 
                                   5090 ; received from STDIN 
                                   5091 ; input:
                                   5092 ;	none 
                                   5093 ; output:
                                   5094 ;	X 		ASCII character 
                                   5095 ;---------------------
      009A52                       5096 key:
      009A52 AE 80 00         [ 4] 5097 	call getc 
      009A55 72               [ 1] 5098 	clrw x 
      009A56 B0               [ 1] 5099 	ld xl,a 
      009A57 00 1B            [ 1] 5100 	ld a,#TK_INTGR
      009A59 A6               [ 4] 5101 	ret
                                   5102 
                                   5103 ;----------------------
                                   5104 ; BASIC: QKEY
                                   5105 ; Return true if there 
                                   5106 ; is a character in 
                                   5107 ; waiting in STDIN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5108 ; input:
                                   5109 ;  none 
                                   5110 ; output:
                                   5111 ;   X 		0|-1 
                                   5112 ;-----------------------
      001CD7                       5113 qkey:: 
      009A5A 02               [ 1] 5114 	clrw x 
      009A5B C2 00 1A C7      [ 1] 5115 	tnz rx_char
      009A5F 00 0C            [ 1] 5116 	jreq 9$ 
      009A61 CF               [ 2] 5117 	cplw x 
      009A62 00 0D            [ 1] 5118 9$: ld a,#TK_INTGR
      009A64 81               [ 4] 5119 	ret 
                                   5120 
                                   5121 ;---------------------
                                   5122 ; BASIC: GPIO(expr,reg)
                                   5123 ; return gpio address 
                                   5124 ; expr {0..8}
                                   5125 ; input:
                                   5126 ;   none 
                                   5127 ; output:
                                   5128 ;   X 		gpio register address
                                   5129 ;----------------------------
                           000003  5130 	PORT=3
                           000001  5131 	REG=1 
                           000004  5132 	VSIZE=4 
      009A65                       5133 gpio:
      009A65 5F 92 AF         [ 4] 5134 	call func_args 
      009A68 00 17            [ 1] 5135 	cp a,#2
      009A6A 90 F1            [ 1] 5136 	jreq 1$
      009A6C 26 08 4D         [ 2] 5137 	jp syntax_error  
      001CEC                       5138 1$:	
      009A6F 27 12            [ 2] 5139 	ldw x,(PORT,sp)
      009A71 5C 90            [ 1] 5140 	jrmi bad_port
      009A73 5C 20 F0         [ 2] 5141 	cpw x,#9
      009A76 2A 12            [ 1] 5142 	jrpl bad_port
      009A76 4D 27            [ 1] 5143 	ld a,#5
      009A78 07               [ 4] 5144 	mul x,a
      009A79 5C 92 AF         [ 2] 5145 	addw x,#GPIO_BASE 
      009A7C 00 17            [ 2] 5146 	ldw (PORT,sp),x  
      009A7E 20 F6            [ 2] 5147 	ldw x,(REG,sp) 
      009A80 5C 98 81         [ 2] 5148 	addw x,(PORT,sp)
      009A83 A6 84            [ 1] 5149 	ld a,#TK_INTGR
      001D04                       5150 	_drop VSIZE 
      009A83 5C 99            [ 2]    1     addw sp,#VSIZE 
      009A85 81               [ 4] 5151 	ret
      009A86                       5152 bad_port:
      009A86 52 04            [ 1] 5153 	ld a,#ERR_BAD_VALUE
      009A88 17 03 5F         [ 2] 5154 	jp tb_error
                                   5155 
                                   5156 
                                   5157 ;-------------------------
                                   5158 ; BASIC: UFLASH 
                                   5159 ; return user flash address
                                   5160 ; input:
                                   5161 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5162 ; output:
                                   5163 ;	A		TK_INTGR
                                   5164 ;   X 		user address 
                                   5165 ;---------------------------
      001D0C                       5166 uflash:
      009A8B CF 00 18         [ 2] 5167 	ldw x,#user_space 
      009A8E 35 01            [ 1] 5168 	ld a,#TK_INTGR 
      009A90 00               [ 4] 5169 	ret 
                                   5170 
                                   5171 
                                   5172 ;---------------------
                                   5173 ; BASIC: USR(addr[,arg])
                                   5174 ; execute a function written 
                                   5175 ; in binary code.
                                   5176 ; binary fonction should 
                                   5177 ; return token attribute in A 
                                   5178 ; and value in X. 
                                   5179 ; input:
                                   5180 ;   addr	routine address 
                                   5181 ;   arg 	is an optional argument 
                                   5182 ; output:
                                   5183 ;   A 		token attribute 
                                   5184 ;   X       returned value 
                                   5185 ;---------------------
      001D12                       5186 usr:
      009A91 17 89            [ 2] 5187 	pushw y 	
      009A92 CD 10 63         [ 4] 5188 	call func_args 
      009A92 92 BC            [ 1] 5189 	cp a,#1 
      009A94 00 17            [ 1] 5190 	jreq 2$
      009A96 27 27            [ 1] 5191 	cp a,#2
      009A98 5F 16            [ 1] 5192 	jreq 2$  
      009A9A 03 CD 9A         [ 2] 5193 	jp syntax_error 
      009A9D 65 25            [ 2] 5194 2$: popw y  ; arg|addr 
      009A9F 2F 92            [ 1] 5195 	cp a,#1
      009AA1 AF 00            [ 1] 5196 	jreq 3$
      009AA3 17               [ 2] 5197 	popw x ; addr
      009AA4 6B               [ 1] 5198 	exgw x,y 
      009AA5 01 5C            [ 4] 5199 3$: call (y)
      009AA7 92 AF            [ 2] 5200 	popw y 
      009AA9 00               [ 4] 5201 	ret 
                                   5202 
                                   5203 ;------------------------------
                                   5204 ; BASIC: BYE 
                                   5205 ; halt mcu in its lowest power mode 
                                   5206 ; wait for reset or external interrupt
                                   5207 ; do a cold start on wakeup.
                                   5208 ;------------------------------
      001D2F                       5209 bye:
      009AAA 17 6B 02 5C 72   [ 2] 5210 	btjf UART1_SR,#UART_SR_TC,.
      009AAF FB               [10] 5211 	halt
      009AB0 01 CD 9A         [ 2] 5212 	jp cold_start  
                                   5213 
                                   5214 ;----------------------------------
                                   5215 ; BASIC: AUTORUN ["file_name"] 
                                   5216 ; record in eeprom at adrress AUTORUN_NAME
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5217 ; the name of file to load and execute
                                   5218 ; at startup. 
                                   5219 ; empty string delete autorun name 
                                   5220 ; no argument display autorun name  
                                   5221 ; input:
                                   5222 ;   file_name   file to execute 
                                   5223 ; output:
                                   5224 ;   none
                                   5225 ;-----------------------------------
      001D38                       5226 autorun: 
      009AB3 12 CD 99 F7 AE   [ 2] 5227 	btjf flags,#FRUN,0$ 
      009AB8 02 80            [ 1] 5228 	jreq 0$ 
      009ABA C3 00            [ 1] 5229 	ld a,#ERR_CMD_ONLY 
      009ABC 17 2A D3         [ 2] 5230 	jp tb_error 
      009ABF                       5231 0$:	
      009ABF 72 5F 00         [ 4] 5232 	call next_token
      009AC2 17 72            [ 1] 5233 	jrne 1$
      009AC4 5F 00 18         [ 2] 5234 	ldw x,#AUTORUN_NAME
      009AC7 72 5F 00         [ 4] 5235 	call puts 
      009ACA 19               [ 1] 5236 	clr a 
      009ACB 5B               [ 4] 5237 	ret 
      001D51                       5238 1$:
      009ACC 04 98            [ 1] 5239 	cp a,#TK_QSTR
      009ACE 81 03            [ 1] 5240 	jreq 2$
      009ACF CC 08 75         [ 2] 5241 	jp syntax_error 
      001D58                       5242 2$:	
      009ACF 5B               [ 1] 5243 	tnz (x) 
      009AD0 04 99            [ 1] 5244 	jrne 3$
                                   5245 ; empty string, delete autorun 	
      009AD2 81 06 94         [ 4] 5246 	call cancel_autorun
      009AD3 55 00 03 00 01   [ 1] 5247 	mov in,count 
      009AD3 72               [ 4] 5248 	ret 
      009AD4 01               [ 2] 5249 3$:	pushw x 
      009AD5 00 24            [ 1] 5250 	ldw y,x  
      009AD7 05 A6 07         [ 4] 5251 	call search_file 
      009ADA CC 88            [ 1] 5252 	jrc 4$ 
      009ADC F7 09            [ 1] 5253 	ld a,#ERR_NOT_FILE
      009ADD CC 08 77         [ 2] 5254 	jp tb_error  
      001D71                       5255 4$: 
      009ADD CE 00 1F 72 B0   [ 1] 5256 	mov in,count 
      009AE2 00 1D 26 0C      [ 1] 5257 	clr farptr 
      009AE6 AE 88 90         [ 2] 5258 	ldw x,#AUTORUN_NAME
      009AE9 CD 83 33         [ 2] 5259 	ldw farptr+1,x 
      009AEC 55 00            [ 2] 5260 	ldw x,(1,sp)  
      009AEE 04 00 02         [ 4] 5261 	call strlen  ; return length in X 
      009AF1 81               [ 2] 5262 	incw x 
      009AF2 90 85            [ 2] 5263 	popw y 
      009AF2 52               [ 2] 5264 	pushw x 
      009AF3 08               [ 1] 5265 	clrw x 
      009AF4 1F 01 CD         [ 4] 5266 	call write_block 
      001D8D                       5267 	_drop 2 
      009AF7 89 E7            [ 2]    1     addw sp,#2 
      009AF9 A1               [ 4] 5268 	ret 
                                   5269 
                                   5270 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5271 ; BASIC: SLEEP 
                                   5272 ; halt mcu until reset or external
                                   5273 ; interrupt.
                                   5274 ; Resume progam after SLEEP command
                                   5275 ;----------------------------------
      001D90                       5276 sleep:
      009AFA 02 27 03 CC 88   [ 2] 5277 	btjf UART1_SR,#UART_SR_TC,.
      009AFF F5 16 00 23      [ 1] 5278 	bset flags,#FSLEEP
      009B00 8E               [10] 5279 	halt 
      009B00 1F               [ 4] 5280 	ret 
                                   5281 
                                   5282 ;-------------------------------
                                   5283 ; BASIC: PAUSE expr 
                                   5284 ; suspend execution for n msec.
                                   5285 ; input:
                                   5286 ;	none
                                   5287 ; output:
                                   5288 ;	none 
                                   5289 ;------------------------------
      001D9B                       5290 pause:
      009B01 03 CD 81         [ 4] 5291 	call expression
      009B04 DC CD            [ 1] 5292 	cp a,#TK_INTGR
      009B06 84 12            [ 1] 5293 	jreq pause02 
      009B08 1C 00 03         [ 2] 5294 	jp syntax_error
      001DA5                       5295 pause02: 
      009B0B 72               [ 2] 5296 1$: tnzw x 
      009B0C FB 01            [ 1] 5297 	jreq 2$
      009B0E 4F               [10] 5298 	wfi 
      009B0F 72               [ 2] 5299 	decw x 
      009B10 BB 00            [ 1] 5300 	jrne 1$
      009B12 1B               [ 1] 5301 2$:	clr a 
      009B13 C9               [ 4] 5302 	ret 
                                   5303 
                                   5304 ;------------------------------
                                   5305 ; BASIC: AWU expr
                                   5306 ; halt mcu for 'expr' milliseconds
                                   5307 ; use Auto wakeup peripheral
                                   5308 ; all oscillators stopped except LSI
                                   5309 ; range: 1ms - 511ms
                                   5310 ; input:
                                   5311 ;  none
                                   5312 ; output:
                                   5313 ;  none:
                                   5314 ;------------------------------
      001DAE                       5315 awu:
      009B14 00 1A A1         [ 4] 5316   call expression
      009B17 02 2B            [ 1] 5317   cp a,#TK_INTGR
      009B19 0A A3            [ 1] 5318   jreq awu02
      009B1B 80 00 2B         [ 2] 5319   jp syntax_error
      001DB8                       5320 awu02:
      009B1E 05 A6 0E         [ 2] 5321   cpw x,#5120
      009B21 CC 88            [ 1] 5322   jrmi 1$ 
      009B23 F7 0F 50 F2      [ 1] 5323   mov AWU_TBR,#15 
      009B24 A6 1E            [ 1] 5324   ld a,#30
      009B24 16               [ 2] 5325   div x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B25 03 CD            [ 1] 5326   ld a,#16
      009B27 9A               [ 2] 5327   div x,a 
      009B28 86 24            [ 2] 5328   jra 4$
      001DC9                       5329 1$: 
      009B2A 05 A6 08         [ 2] 5330   cpw x,#2048
      009B2D CC 88            [ 1] 5331   jrmi 2$ 
      009B2F F7 0E 50 F2      [ 1] 5332   mov AWU_TBR,#14
      009B30 A6 50            [ 1] 5333   ld a,#80
      009B30 CE               [ 2] 5334   div x,a 
      009B31 00 1A            [ 2] 5335   jra 4$   
      001DD7                       5336 2$:
      009B33 C6 00 1C CF      [ 1] 5337   mov AWU_TBR,#7
      001DDB                       5338 3$:  
                                   5339 ; while X > 64  divide by 2 and increment AWU_TBR 
      009B37 00 17 C7         [ 2] 5340   cpw x,#64 
      009B3A 00 19            [ 2] 5341   jrule 4$ 
      009B3C 16 03 AE 16      [ 1] 5342   inc AWU_TBR 
      009B40 E0               [ 2] 5343   srlw x 
      009B41 CD 84            [ 2] 5344   jra 3$ 
      001DE7                       5345 4$:
      009B43 30               [ 1] 5346   ld a, xl
      009B44 CD               [ 1] 5347   dec a 
      009B45 84 12            [ 1] 5348   jreq 5$
      009B47 5C               [ 1] 5349   dec a 	
      001DEC                       5350 5$: 
      009B48 1C 16            [ 1] 5351   and a,#0x3e 
      009B4A E0 16 01         [ 1] 5352   ld AWU_APR,a 
      009B4D FF 1C 00 02      [ 1] 5353   bset AWU_CSR,#AWU_CSR_AWUEN
      009B51 90               [10] 5354   halt 
                                   5355 
      009B52 CE               [ 4] 5356   ret 
                                   5357 
                                   5358 ;------------------------------
                                   5359 ; BASIC: TICKS
                                   5360 ; return msec ticks counter value 
                                   5361 ; input:
                                   5362 ; 	none 
                                   5363 ; output:
                                   5364 ;	X 		TK_INTGR
                                   5365 ;-------------------------------
      001DF7                       5366 get_ticks:
      009B53 00 1D 90         [ 2] 5367 	ldw x,ticks 
      009B56 F6 90            [ 1] 5368 	ld a,#TK_INTGR
      009B58 5C               [ 4] 5369 	ret 
                                   5370 
                                   5371 
                                   5372 
                                   5373 ;------------------------------
                                   5374 ; BASIC: ABS(expr)
                                   5375 ; return absolute value of expr.
                                   5376 ; input:
                                   5377 ;   none
                                   5378 ; output:
                                   5379 ;   X     	positive integer
                                   5380 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      001DFD                       5381 abs:
      009B59 F7 5C 90         [ 4] 5382 	call func_args 
      009B5C C3 00            [ 1] 5383 	cp a,#1 
      009B5E 1F 27            [ 1] 5384 	jreq 0$ 
      009B60 05 A3 17         [ 2] 5385 	jp syntax_error
      001E07                       5386 0$:  
      009B63 60               [ 2] 5387     popw x   
      009B64 2B               [ 1] 5388 	ld a,xh 
      009B65 EF 80            [ 1] 5389 	bcp a,#0x80 
      009B66 27 01            [ 1] 5390 	jreq 2$ 
      009B66 17               [ 2] 5391 	negw x 
      009B67 07 84            [ 1] 5392 2$: ld a,#TK_INTGR 
      009B68 81               [ 4] 5393 	ret 
                                   5394 
                                   5395 ;------------------------------
                                   5396 ; BASIC: AND(expr1,expr2)
                                   5397 ; Apply bit AND relation between
                                   5398 ; the 2 arguments, i.e expr1 & expr2 
                                   5399 ; output:
                                   5400 ; 	A 		TK_INTGR
                                   5401 ;   X 		result 
                                   5402 ;------------------------------
      001E11                       5403 bit_and:
      009B68 A3 17 60         [ 4] 5404 	call func_args 
      009B6B 27 04            [ 1] 5405 	cp a,#2
      009B6D 7F 5C            [ 1] 5406 	jreq 1$
      009B6F 20 F7 75         [ 2] 5407 	jp syntax_error 
      009B71 85               [ 2] 5408 1$:	popw x 
      009B71 AE               [ 1] 5409 	ld a,xh 
      009B72 16 E0            [ 1] 5410 	and a,(1,sp)
      009B74 CD               [ 1] 5411 	ld xh,a 
      009B75 81               [ 1] 5412 	ld a,xl
      009B76 F0 AE            [ 1] 5413 	and a,(2,sp)
      009B78 00               [ 1] 5414 	ld xl,a 
      001E24                       5415 	_drop 2 
      009B79 80 CD            [ 2]    1     addw sp,#2 
      009B7B 9A 12            [ 1] 5416 	ld a,#TK_INTGR
      009B7D AE               [ 4] 5417 	ret
                                   5418 
                                   5419 ;------------------------------
                                   5420 ; BASIC: OR(expr1,expr2)
                                   5421 ; Apply bit OR relation between
                                   5422 ; the 2 arguments, i.e expr1 | expr2 
                                   5423 ; output:
                                   5424 ; 	A 		TK_INTGR
                                   5425 ;   X 		result 
                                   5426 ;------------------------------
      001E29                       5427 bit_or:
      009B7E 16 E0 16         [ 4] 5428 	call func_args 
      009B81 07 90            [ 1] 5429 	cp a,#2
      009B83 C3 00            [ 1] 5430 	jreq 1$
      009B85 1F 2B CD         [ 2] 5431 	jp syntax_error 
      001E33                       5432 1$: 
      009B88 CE               [ 2] 5433 	popw x 
      009B89 00               [ 1] 5434 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B8A 17 C6            [ 1] 5435 	or a,(1,sp)
      009B8C 00               [ 1] 5436 	ld xh,a 
      009B8D 19               [ 1] 5437 	ld a,xl 
      009B8E CF 00            [ 1] 5438 	or a,(2,sp)
      009B90 1A               [ 1] 5439 	ld xl,a 
      001E3C                       5440 	_drop 2 
      009B91 C7 00            [ 2]    1     addw sp,#2 
      009B93 1C 1E            [ 1] 5441 	ld a,#TK_INTGR 
      009B95 01               [ 4] 5442 	ret
                                   5443 
                                   5444 ;------------------------------
                                   5445 ; BASIC: XOR(expr1,expr2)
                                   5446 ; Apply bit XOR relation between
                                   5447 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5448 ; output:
                                   5449 ; 	A 		TK_INTGR
                                   5450 ;   X 		result 
                                   5451 ;------------------------------
      001E41                       5452 bit_xor:
      009B96 CD 8A 3C         [ 4] 5453 	call func_args 
      009B99 5B 08            [ 1] 5454 	cp a,#2
      009B9B 81 03            [ 1] 5455 	jreq 1$
      009B9C CC 08 75         [ 2] 5456 	jp syntax_error 
      001E4B                       5457 1$: 
      009B9C CD               [ 2] 5458 	popw x 
      009B9D 9A               [ 1] 5459 	ld a,xh 
      009B9E 12 CD            [ 1] 5460 	xor a,(1,sp)
      009BA0 87               [ 1] 5461 	ld xh,a 
      009BA1 61               [ 1] 5462 	ld a,xl 
      009BA2 5F 92            [ 1] 5463 	xor a,(2,sp)
      009BA4 AF               [ 1] 5464 	ld xl,a 
      001E54                       5465 	_drop 2 
      009BA5 00 17            [ 2]    1     addw sp,#2 
      009BA7 90 95            [ 1] 5466 	ld a,#TK_INTGR 
      009BA9 5C               [ 4] 5467 	ret 
                                   5468 
                                   5469 ;------------------------------
                                   5470 ; BASIC: LSHIFT(expr1,expr2)
                                   5471 ; logical shift left expr1 by 
                                   5472 ; expr2 bits 
                                   5473 ; output:
                                   5474 ; 	A 		TK_INTGR
                                   5475 ;   X 		result 
                                   5476 ;------------------------------
      001E59                       5477 lshift:
      009BAA 92 AF 00         [ 4] 5478 	call func_args
      009BAD 17 5C            [ 1] 5479 	cp a,#2 
      009BAF 90 97            [ 1] 5480 	jreq 1$
      009BB1 72 B9 00         [ 2] 5481 	jp syntax_error
      009BB4 1D 90            [ 2] 5482 1$: popw y   
      009BB6 CF               [ 2] 5483 	popw x 
      009BB7 00 1F            [ 2] 5484 	tnzw y 
      009BB9 90 CE            [ 1] 5485 	jreq 4$
      009BBB 00               [ 2] 5486 2$:	sllw x 
      009BBC 1D 5A            [ 2] 5487 	decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BBD 26 FB            [ 1] 5488 	jrne 2$
      001E6F                       5489 4$:  
      009BBD 92 AF            [ 1] 5490 	ld a,#TK_INTGR
      009BBF 00               [ 4] 5491 	ret
                                   5492 
                                   5493 ;------------------------------
                                   5494 ; BASIC: RSHIFT(expr1,expr2)
                                   5495 ; logical shift right expr1 by 
                                   5496 ; expr2 bits.
                                   5497 ; output:
                                   5498 ; 	A 		TK_INTGR
                                   5499 ;   X 		result 
                                   5500 ;------------------------------
      001E72                       5501 rshift:
      009BC0 17 90 F7         [ 4] 5502 	call func_args
      009BC3 5C 90            [ 1] 5503 	cp a,#2 
      009BC5 5C 90            [ 1] 5504 	jreq 1$
      009BC7 C3 00 1F         [ 2] 5505 	jp syntax_error
      009BCA 2B F1            [ 2] 5506 1$: popw y  
      009BCC 81               [ 2] 5507 	popw x
      009BCD 90 5D            [ 2] 5508 	tnzw y 
      009BCD 72 01            [ 1] 5509 	jreq 4$
      009BCF 00               [ 2] 5510 2$:	srlw x 
      009BD0 24 07            [ 2] 5511 	decw y 
      009BD2 27 05            [ 1] 5512 	jrne 2$
      001E88                       5513 4$:  
      009BD4 A6 07            [ 1] 5514 	ld a,#TK_INTGR
      009BD6 CC               [ 4] 5515 	ret
                                   5516 
                                   5517 ;--------------------------
                                   5518 ; BASIC: FCPU integer
                                   5519 ; set CPU frequency 
                                   5520 ;-------------------------- 
                                   5521 
      001E8B                       5522 fcpu:
      009BD7 88 F7            [ 1] 5523 	ld a,#TK_INTGR
      009BD9 CD 10 56         [ 4] 5524 	call expect 
      009BD9 CD               [ 1] 5525 	ld a,xl 
      009BDA 89 E7            [ 1] 5526 	and a,#7 
      009BDC A1 02 27         [ 1] 5527 	ld CLK_CKDIVR,a 
      009BDF 03               [ 4] 5528 	ret 
                                   5529 
                                   5530 ;------------------------------
                                   5531 ; BASIC: PMODE pin#, mode 
                                   5532 ; Arduino pin. 
                                   5533 ; define pin as input or output
                                   5534 ; pin#: {0..15}
                                   5535 ; mode: INPUT|OUTPUT  
                                   5536 ;------------------------------
                           000001  5537 	PINNO=1
                           000001  5538 	VSIZE=1
      001E97                       5539 pin_mode:
      001E97                       5540 	_vars VSIZE 
      009BE0 CC 88            [ 2]    1     sub sp,#VSIZE 
      009BE2 F5 90 93         [ 4] 5541 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BE5 CD 9A            [ 1] 5542 	cp a,#2 
      009BE7 86 25            [ 1] 5543 	jreq 1$
      009BE9 05 A6 09         [ 2] 5544 	jp syntax_error 
      009BEC CC 88            [ 2] 5545 1$: popw y ; mode 
      009BEE F7               [ 2] 5546 	popw x ; Dx pin 
      009BEF CD 1E D8         [ 4] 5547 	call select_pin 
      009BEF CD 9B            [ 1] 5548 	ld (PINNO,sp),a  
      009BF1 9C CE            [ 1] 5549 	ld a,#1 
      009BF3 00 1F            [ 1] 5550 	tnz (PINNO,sp)
      009BF5 72 B0            [ 1] 5551 	jreq 4$
      009BF7 00               [ 1] 5552 2$:	sll a 
      009BF8 1D CD            [ 1] 5553 	dec (PINNO,sp)
      009BFA 8A 3C            [ 1] 5554 	jrne 2$ 
      009BFC 81 01            [ 1] 5555 	ld (PINNO,sp),a
      009BFD EA 03            [ 1] 5556 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009BFD 52 03            [ 1] 5557 	ld (GPIO_CR1,x),a 
      009BFF CD 89 E7 A1      [ 2] 5558 4$:	cpw y,#OUTP 
      009C03 00 27            [ 1] 5559 	jreq 6$
                                   5560 ; input mode
      009C05 20 A1            [ 1] 5561 	ld a,(PINNO,sp)
      009C07 02               [ 1] 5562 	cpl a 
      009C08 27 03            [ 1] 5563 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C0A CC 88            [ 2] 5564 	jra 9$
      001EC9                       5565 6$: ;output mode  
      009C0C F5 90            [ 1] 5566 	ld a,(PINNO,sp)
      009C0E 93 55            [ 1] 5567 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C10 00 04            [ 1] 5568 	ld (GPIO_CR2,x),a 
      009C12 00 02            [ 1] 5569 	ld a,(PINNO,sp)
      009C14 CD 9A            [ 1] 5570 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C16 86 25            [ 1] 5571 9$:	ld (GPIO_DDR,x),a 
      001ED5                       5572 	_drop VSIZE 
      009C18 05 A6            [ 2]    1     addw sp,#VSIZE 
      009C1A 09               [ 4] 5573 	ret
                                   5574 
                                   5575 ;------------------------
                                   5576 ; select Arduino pin 
                                   5577 ; input:
                                   5578 ;   X 	 {0..15} Arduino Dx 
                                   5579 ; output:
                                   5580 ;   A     stm8s208 pin 
                                   5581 ;   X     base address s208 GPIO port 
                                   5582 ;---------------------------
      001ED8                       5583 select_pin:
      009C1B CC               [ 2] 5584 	sllw x 
      009C1C 88 F7 E8         [ 2] 5585 	addw x,#arduino_to_8s208 
      009C1E FE               [ 2] 5586 	ldw x,(x)
      009C1E CE               [ 1] 5587 	ld a,xl 
      009C1F 00               [ 1] 5588 	push a 
      009C20 17               [ 1] 5589 	swapw x 
      009C21 C6 00            [ 1] 5590 	ld a,#5 
      009C23 19               [ 4] 5591 	mul x,a 
      009C24 20 0A 00         [ 2] 5592 	addw x,#GPIO_BASE 
      009C26 84               [ 1] 5593 	pop a 
      009C26 AE               [ 4] 5594 	ret 
                                   5595 ; translation from Arduino D0..D15 to stm8s208rb 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001EE8                       5596 arduino_to_8s208:
      009C27 01 00                 5597 .byte 3,6 ; D0 
      009C29 4F CF                 5598 .byte 3,5 ; D1 
      009C2B 00 17                 5599 .byte 4,0 ; D2 
      009C2D C7 00                 5600 .byte 2,1 ; D3
      009C2F 19 00                 5601 .byte 6,0 ; D4
      009C30 02 02                 5602 .byte 2,2 ; D5
      009C30 1F 01                 5603 .byte 2,3 ; D6
      009C32 6B 03                 5604 .byte 3,1 ; D7
      009C34 CD 81                 5605 .byte 3,3 ; D8
      009C36 A8 CD                 5606 .byte 2,4 ; D9
      009C38 82 23                 5607 .byte 4,5 ; D10
      009C3A AE 00                 5608 .byte 2,6 ; D11
      009C3C 80 CD                 5609 .byte 2,7 ; D12
      009C3E 9A 12                 5610 .byte 2,5 ; D13
      009C40 CD 99                 5611 .byte 4,2 ; D14
      009C42 F7 C6                 5612 .byte 4,1 ; D15
                                   5613 
                                   5614 
                                   5615 ;------------------------------
                                   5616 ; BASIC: RND(expr)
                                   5617 ; return random number 
                                   5618 ; between 1 and expr inclusive
                                   5619 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5620 ; input:
                                   5621 ; 	none 
                                   5622 ; output:
                                   5623 ;	X 		random positive integer 
                                   5624 ;------------------------------
      001F08                       5625 random:
      009C44 00 19 C0         [ 4] 5626 	call func_args 
      009C47 00 1C            [ 1] 5627 	cp a,#1
      009C49 C6 00            [ 1] 5628 	jreq 1$
      009C4B 18 C2 00         [ 2] 5629 	jp syntax_error
      001F12                       5630 1$:  
      009C4E 1B C6            [ 1] 5631 	ld a,#0x80 
      009C50 00 17            [ 1] 5632 	bcp a,(1,sp)
      009C52 C2 00            [ 1] 5633 	jreq 2$
      009C54 1A 2B            [ 1] 5634 	ld a,#ERR_BAD_VALUE
      009C56 E0 7B 03         [ 2] 5635 	jp tb_error
      001F1D                       5636 2$: 
                                   5637 ; acc16=(x<<5)^x 
      009C59 1E 01 C7         [ 2] 5638 	ldw x,seedx 
      009C5C 00               [ 2] 5639 	sllw x 
      009C5D 1C               [ 2] 5640 	sllw x 
      009C5E CF               [ 2] 5641 	sllw x 
      009C5F 00               [ 2] 5642 	sllw x 
      009C60 1A               [ 2] 5643 	sllw x 
      009C61 5B               [ 1] 5644 	ld a,xh 
      009C62 03 81 12         [ 1] 5645 	xor a,seedx 
      009C64 C7 00 0C         [ 1] 5646 	ld acc16,a 
      009C64 52               [ 1] 5647 	ld a,xl 
      009C65 02 5F 1F         [ 1] 5648 	xor a,seedx+1 
      009C68 01 CF 00         [ 1] 5649 	ld acc8,a 
                                   5650 ; seedx=seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C6B 18 35 01         [ 2] 5651 	ldw x,seedy 
      009C6E 00 17 12         [ 2] 5652 	ldw seedx,x  
                                   5653 ; seedy=seedy^(seedy>>1)
      009C70 90 54            [ 2] 5654 	srlw y 
      009C70 5F 92            [ 1] 5655 	ld a,yh 
      009C72 AF 00 17         [ 1] 5656 	xor a,seedy 
      009C75 27 3B 14         [ 1] 5657 	ld seedy,a  
      009C77 90 9F            [ 1] 5658 	ld a,yl 
      009C77 92 AF 00         [ 1] 5659 	xor a,seedy+1 
      009C7A 17 27 06         [ 1] 5660 	ld seedy+1,a 
                                   5661 ; acc16>>3 
      009C7D CD 83 20         [ 2] 5662 	ldw x,acc16 
      009C80 5C               [ 2] 5663 	srlw x 
      009C81 20               [ 2] 5664 	srlw x 
      009C82 F4               [ 2] 5665 	srlw x 
                                   5666 ; x=acc16^x 
      009C83 5C               [ 1] 5667 	ld a,xh 
      009C84 A6 20 CD         [ 1] 5668 	xor a,acc16 
      009C87 83               [ 1] 5669 	ld xh,a 
      009C88 20               [ 1] 5670 	ld a,xl 
      009C89 92 AF 00         [ 1] 5671 	xor a,acc8 
      009C8C 17               [ 1] 5672 	ld xl,a 
                                   5673 ; seedy=x^seedy 
      009C8D 90 95 5C         [ 1] 5674 	xor a,seedy+1
      009C90 92               [ 1] 5675 	ld xl,a 
      009C91 AF               [ 1] 5676 	ld a,xh 
      009C92 00 17 5C         [ 1] 5677 	xor a,seedy
      009C95 90               [ 1] 5678 	ld xh,a 
      009C96 97 90 89         [ 2] 5679 	ldw seedy,x 
                                   5680 ; return seedy modulo expr + 1 
      009C99 72 FB            [ 2] 5681 	popw y 
      009C9B 01               [ 2] 5682 	divw x,y 
      009C9C CD               [ 1] 5683 	ldw x,y 
      009C9D 9A               [ 2] 5684 	incw x 
      001F6C                       5685 10$:
      009C9E 12 CD            [ 1] 5686 	ld a,#TK_INTGR
      009CA0 99               [ 4] 5687 	ret 
                                   5688 
                                   5689 ;---------------------------------
                                   5690 ; BASIC: WORDS 
                                   5691 ; affiche la listes des mots du
                                   5692 ; dictionnaire ainsi que le nombre
                                   5693 ; de mots.
                                   5694 ;---------------------------------
                           000001  5695 	WLEN=1 ; word length
                           000002  5696 	LLEN=2 ; character sent to console
                           000003  5697 	WCNT=3 ; count words printed 
                           000003  5698 	VSIZE=3 
      001F6F                       5699 words:
      001F6F                       5700 	_vars VSIZE
      009CA1 F7 85            [ 2]    1     sub sp,#VSIZE 
      009CA3 CD 8A            [ 1] 5701 	clr (LLEN,sp)
      009CA5 3C A6            [ 1] 5702 	clr (WCNT,sp)
      009CA7 0D CD 83 20      [ 2] 5703 	ldw y,#kword_dict+2
      009CAB 1E               [ 1] 5704 0$:	ldw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CAC 01               [ 1] 5705 	ld a,(x)
      009CAD 5C 1F            [ 1] 5706 	and a,#15 
      009CAF 01 20            [ 1] 5707 	ld (WLEN,sp),a 
      009CB1 BE 03            [ 1] 5708 	inc (WCNT,sp)
      009CB2 5C               [ 2] 5709 1$:	incw x 
      009CB2 1E               [ 1] 5710 	ld a,(x)
      009CB3 01 CD 8A         [ 4] 5711 	call putc 
      009CB6 3C AE            [ 1] 5712 	inc (LLEN,sp)
      009CB8 9C D1            [ 1] 5713 	dec (WLEN,sp)
      009CBA CD 83            [ 1] 5714 	jrne 1$
      009CBC 33 CD            [ 1] 5715 	ld a,#70
      009CBE 9A 52            [ 1] 5716 	cp a,(LLEN,sp)
      009CC0 5F 35            [ 1] 5717 	jrmi 2$   
      009CC2 0A 00            [ 1] 5718 	ld a,#SPACE 
      009CC4 0B CD 8A         [ 4] 5719 	call putc 
      009CC7 4C AE            [ 1] 5720 	inc (LLEN,sp) 
      009CC9 9C D9            [ 2] 5721 	jra 3$
      009CCB CD 83            [ 1] 5722 2$: ld a,#CR 
      009CCD 33 5B 02         [ 4] 5723 	call putc 
      009CD0 81 20            [ 1] 5724 	clr (LLEN,sp)
      009CD2 66 69 6C 65      [ 2] 5725 3$:	subw y,#2 
      009CD6 73 0A            [ 2] 5726 	ldw y,(y)
      009CD8 00 20            [ 1] 5727 	jrne 0$ 
      009CDA 62 79            [ 1] 5728 	ld a,#CR 
      009CDC 74 65 73         [ 4] 5729 	call putc  
      009CDF 20               [ 1] 5730 	clrw x 
      009CE0 66 72            [ 1] 5731 	ld a,(WCNT,sp)
      009CE2 65               [ 1] 5732 	ld xl,a 
      009CE3 65 0A 00         [ 4] 5733 	call print_int 
      009CE6 AE 1F BF         [ 2] 5734 	ldw x,#words_count_msg
      009CE6 52 02 72         [ 4] 5735 	call puts 
      001FBC                       5736 	_drop VSIZE 
      009CE9 5F 00            [ 2]    1     addw sp,#VSIZE 
      009CEB 17               [ 4] 5737 	ret 
      009CEC CD 91 E1 A1 84 27 03  5738 words_count_msg: .asciz " words in dictionary\n"
             CC 88 F5 1F 01 CD 89
             E7 A1 09 27 02 20 19
             CD
                                   5739 
                                   5740 
                                   5741 ;-----------------------------
                                   5742 ; BASIC: TIMER expr 
                                   5743 ; initialize count down timer 
                                   5744 ;-----------------------------
      001FD5                       5745 set_timer:
      009D02 91 E1 A1         [ 4] 5746 	call arg_list
      009D05 84 27            [ 1] 5747 	cp a,#1 
      009D07 03 CC            [ 1] 5748 	jreq 1$
      009D09 88 F5 9F         [ 2] 5749 	jp syntax_error
      001FDF                       5750 1$: 
      009D0C 1E               [ 2] 5751 	popw x 
      009D0D 01 CF 00         [ 2] 5752 	ldw timer,x 
      009D10 18               [ 4] 5753 	ret 
                                   5754 
                                   5755 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5756 ; BASIC: TIMEOUT 
                                   5757 ; return state of timer 
                                   5758 ;------------------------------
      001FE4                       5759 timeout:
      009D11 5F CD 82         [ 2] 5760 	ldw x,timer 
      001FE7                       5761 logical_complement:
      009D14 4D               [ 2] 5762 	cplw x 
      009D15 1E 01 5C         [ 2] 5763 	cpw x,#-1
      009D18 20 DC            [ 1] 5764 	jreq 2$
      009D1A 5F               [ 1] 5765 	clrw x 
      009D1A 5B 02            [ 1] 5766 2$:	ld a,#TK_INTGR
      009D1C 81               [ 4] 5767 	ret 
                                   5768 
                                   5769 ;--------------------------------
                                   5770 ; BASIC NOT(expr) 
                                   5771 ; return logical complement of expr
                                   5772 ;--------------------------------
      009D1D                       5773 func_not:
      009D1D CD 90 E3         [ 4] 5774 	call func_args  
      009D20 A1 01            [ 1] 5775 	cp a,#1
      009D22 27 03            [ 1] 5776 	jreq 1$
      009D24 CC 88 F5         [ 2] 5777 	jp syntax_error
      009D27 85               [ 2] 5778 1$:	popw x 
      009D28 9F A4            [ 2] 5779 	jra logical_complement
                                   5780 
                                   5781 
                                   5782 
                                   5783 ;-----------------------------------
                                   5784 ; BASIC: IWDGEN expr1 
                                   5785 ; enable independant watchdog timer
                                   5786 ; expr1 is delay in multiple of 62.5µsec
                                   5787 ; expr1 -> {1..16383}
                                   5788 ;-----------------------------------
      001FFE                       5789 enable_iwdg:
      009D2A 7F 97 A6         [ 4] 5790 	call arg_list
      009D2D 03 81            [ 1] 5791 	cp a,#1 
      009D2F 27 03            [ 1] 5792 	jreq 1$
      009D2F A6 07 CD         [ 2] 5793 	jp syntax_error 
      009D32 90               [ 2] 5794 1$: popw x 
      009D33 D6 CD            [ 1] 5795 	push #0
      009D35 89 E7 A1 02      [ 1] 5796 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D39 27               [ 1] 5797 	ld a,xh 
      009D3A 07 A1            [ 1] 5798 	and a,#0x3f
      009D3C 03               [ 1] 5799 	ld xh,a  
      009D3D 27 06 CC         [ 2] 5800 2$:	cpw x,#255
      009D40 88 F5            [ 2] 5801 	jrule 3$
      009D42 0C 01            [ 1] 5802 	inc (1,sp)
      009D42 F6               [ 1] 5803 	rcf 
      009D43 5F               [ 2] 5804 	rrcw x 
      009D44 97 F5            [ 2] 5805 	jra 2$
      009D45 35 55 50 E0      [ 1] 5806 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D45 89               [ 1] 5807 	pop a  
      009D46 A6 08 CD         [ 1] 5808 	ld IWDG_PR,a 
      009D49 90               [ 1] 5809 	ld a,xl
      009D4A D6               [ 1] 5810 	dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D4B 85 A6 84 81      [ 1] 5811 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D4F C7 50 E2         [ 1] 5812 	ld IWDG_RLR,a 
      009D4F CD 83 29 5F      [ 1] 5813 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D53 97               [ 4] 5814 	ret 
                                   5815 
                                   5816 
                                   5817 ;-----------------------------------
                                   5818 ; BASIC: IWDGREF  
                                   5819 ; refresh independant watchdog count down 
                                   5820 ; timer before it reset MCU. 
                                   5821 ;-----------------------------------
      002034                       5822 refresh_iwdg:
      009D54 A6 84 81 E0      [ 1] 5823 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D57 81               [ 4] 5824 	ret 
                                   5825 
                                   5826 
                                   5827 ;-------------------------------------
                                   5828 ; BASIC: LOG(expr)
                                   5829 ; return logarithm base 2 of expr 
                                   5830 ; this is the position of most significant
                                   5831 ; bit set. 
                                   5832 ; input: 
                                   5833 ; output:
                                   5834 ;   X     log2 
                                   5835 ;   A     TK_INTGR 
                                   5836 ;*********************************
      002039                       5837 log2:
      009D57 5F 72 5D         [ 4] 5838 	call func_args 
      009D5A 00 26            [ 1] 5839 	cp a,#1 
      009D5C 27 01            [ 1] 5840 	jreq 1$
      009D5E 53 A6 84         [ 2] 5841 	jp syntax_error 
      009D61 81               [ 2] 5842 1$: popw x 
      009D62                       5843 leading_one:
      009D62 CD               [ 2] 5844 	tnzw x 
      009D63 90 E3            [ 1] 5845 	jreq 4$
      009D65 A1 02            [ 1] 5846 	ld a,#15 
      009D67 27               [ 2] 5847 2$: rlcw x 
      009D68 03 CC            [ 1] 5848     jrc 3$
      009D6A 88               [ 1] 5849 	dec a 
      009D6B F5 FA            [ 2] 5850 	jra 2$
      009D6C 5F               [ 1] 5851 3$: clrw x 
      009D6C 1E               [ 1] 5852     ld xl,a
      009D6D 03 2B            [ 1] 5853 4$:	ld a,#TK_INTGR
      009D6F 17               [ 4] 5854 	ret 
                                   5855 
                                   5856 ;-----------------------------------
                                   5857 ; BASIC: BIT(expr) 
                                   5858 ; expr ->{0..15}
                                   5859 ; return 2^expr 
                                   5860 ; output:
                                   5861 ;    x    2^expr 
                                   5862 ;-----------------------------------
      002054                       5863 bitmask:
      009D70 A3 00 09         [ 4] 5864     call func_args 
      009D73 2A 12            [ 1] 5865 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D75 A6 05            [ 1] 5866 	jreq 1$
      009D77 42 1C 50         [ 2] 5867 	jp syntax_error 
      009D7A 00               [ 2] 5868 1$: popw x 
      009D7B 1F               [ 1] 5869 	ld a,xl 
      009D7C 03 1E            [ 1] 5870 	and a,#15
      009D7E 01               [ 1] 5871 	clrw x 
      009D7F 72               [ 2] 5872 	incw x 
      009D80 FB               [ 1] 5873 2$: tnz a 
      009D81 03 A6            [ 1] 5874 	jreq 3$
      009D83 84               [ 2] 5875 	slaw x 
      009D84 5B               [ 1] 5876 	dec a 
      009D85 04 81            [ 2] 5877 	jra 2$ 
      009D87 A6 84            [ 1] 5878 3$: ld a,#TK_INTGR
      009D87 A6               [ 4] 5879 	ret 
                                   5880 
                                   5881 ;------------------------------
                                   5882 ; BASIC: INVERT(expr)
                                   5883 ; 1's complement 
                                   5884 ;--------------------------------
      00206E                       5885 invert:
      009D88 0A CC 88         [ 4] 5886 	call func_args
      009D8B F7 01            [ 1] 5887 	cp a,#1 
      009D8C 27 03            [ 1] 5888 	jreq 1$
      009D8C AE A7 80         [ 2] 5889 	jp syntax_error
      009D8F A6               [ 2] 5890 1$: popw x  
      009D90 84               [ 2] 5891 	cplw x 
      009D91 81 84            [ 1] 5892 	ld a,#TK_INTGR 
      009D92 81               [ 4] 5893 	ret 
                                   5894 
                                   5895 ;------------------------------
                                   5896 ; BASIC: DO 
                                   5897 ; initiate a DO ... UNTIL loop 
                                   5898 ;------------------------------
                           000003  5899 	DOLP_ADR=3 
                           000005  5900 	DOLP_INW=5
                           000004  5901 	VSIZE=4 
      00207D                       5902 do_loop:
      009D92 90               [ 2] 5903 	popw x 
      00207E                       5904 	_vars VSIZE 
      009D93 89 CD            [ 2]    1     sub sp,#VSIZE 
      009D95 90               [ 2] 5905 	pushw x 
      009D96 E3 A1 01 27      [ 2] 5906 	ldw y,basicptr 
      009D9A 07 A1            [ 2] 5907 	ldw (DOLP_ADR,sp),y
      009D9C 02 27 03 CC      [ 2] 5908 	ldw y,in.w 
      009DA0 88 F5            [ 2] 5909 	ldw (DOLP_INW,sp),y
      009DA2 90 85 A1 01      [ 1] 5910 	inc loop_depth 
      009DA6 27               [ 4] 5911 	ret 
                                   5912 
                                   5913 ;--------------------------------
                                   5914 ; BASIC: UNTIL expr 
                                   5915 ; loop if exprssion is false 
                                   5916 ; else terminate loop
                                   5917 ;--------------------------------
      002092                       5918 until: 
      009DA7 02 85 51 90      [ 1] 5919 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009DAB FD 90            [ 1] 5920 	jrne 1$ 
      009DAD 85 81 75         [ 2] 5921 	jp syntax_error 
      009DAF                       5922 1$: 
      009DAF 72 0D 52         [ 4] 5923 	call relation 
      009DB2 30 FB            [ 1] 5924 	cp a,#TK_INTGR
      009DB4 8E CC            [ 1] 5925 	jreq 2$
      009DB6 86 4B 75         [ 2] 5926 	jp syntax_error
      009DB8                       5927 2$: 
      009DB8 72               [ 2] 5928 	tnzw x 
      009DB9 01 00            [ 1] 5929 	jrne 9$
      009DBB 24 07            [ 2] 5930 	ldw x,(DOLP_ADR,sp)
      009DBD 27 05 A6         [ 2] 5931 	ldw basicptr,x 
      009DC0 07 CC            [ 1] 5932 	ld a,(2,x)
      009DC2 88 F7 03         [ 1] 5933 	ld count,a 
      009DC4 1E 05            [ 2] 5934 	ldw x,(DOLP_INW,sp)
      009DC4 CD 89 E7         [ 2] 5935 	ldw in.w,x 
      009DC7 26               [ 4] 5936 	ret 
      0020B8                       5937 9$:	; remove loop data from stack  
      009DC8 08               [ 2] 5938 	popw x
      0020B9                       5939 	_drop VSIZE
      009DC9 AE 40            [ 2]    1     addw sp,#VSIZE 
      009DCB 00 CD 83 33      [ 1] 5940 	dec loop_depth 
      009DCF 4F               [ 2] 5941 	jp (x)
                                   5942 
                                   5943 ;--------------------------
                                   5944 ; BASIC: PRTA...PRTI  
                                   5945 ;  return constant value 
                                   5946 ;  PORT  offset in GPIO
                                   5947 ;  array
                                   5948 ;---------------------------
      0020C0                       5949 const_porta:
      009DD0 81 00 00         [ 2] 5950 	ldw x,#0
      009DD1 A6 84            [ 1] 5951 	ld a,#TK_INTGR 
      009DD1 A1               [ 4] 5952 	ret 
      0020C6                       5953 const_portb:
      009DD2 02 27 03         [ 2] 5954 	ldw x,#1
      009DD5 CC 88            [ 1] 5955 	ld a,#TK_INTGR 
      009DD7 F5               [ 4] 5956 	ret 
      009DD8                       5957 const_portc:
      009DD8 7D 26 09         [ 2] 5958 	ldw x,#2
      009DDB CD 87            [ 1] 5959 	ld a,#TK_INTGR 
      009DDD 14               [ 4] 5960 	ret 
      0020D2                       5961 const_portd:
      009DDE 55 00 04         [ 2] 5962 	ldw x,#3
      009DE1 00 02            [ 1] 5963 	ld a,#TK_INTGR 
      009DE3 81               [ 4] 5964 	ret 
      0020D8                       5965 const_porte:
      009DE4 89 90 93         [ 2] 5966 	ldw x,#4
      009DE7 CD 9A            [ 1] 5967 	ld a,#TK_INTGR 
      009DE9 86               [ 4] 5968 	ret 
      0020DE                       5969 const_portf:
      009DEA 25 05 A6         [ 2] 5970 	ldw x,#5
      009DED 09 CC            [ 1] 5971 	ld a,#TK_INTGR 
      009DEF 88               [ 4] 5972 	ret 
      0020E4                       5973 const_portg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009DF0 F7 00 06         [ 2] 5974 	ldw x,#6
      009DF1 A6 84            [ 1] 5975 	ld a,#TK_INTGR 
      009DF1 55               [ 4] 5976 	ret 
      0020EA                       5977 const_porth:
      009DF2 00 04 00         [ 2] 5978 	ldw x,#7
      009DF5 02 72            [ 1] 5979 	ld a,#TK_INTGR 
      009DF7 5F               [ 4] 5980 	ret 
      0020F0                       5981 const_porti:
      009DF8 00 17 AE         [ 2] 5982 	ldw x,#8
      009DFB 40 00            [ 1] 5983 	ld a,#TK_INTGR 
      009DFD CF               [ 4] 5984 	ret 
                                   5985 
                                   5986 ;-------------------------------
                                   5987 ; following return constant 
                                   5988 ; related to GPIO register offset 
                                   5989 ;---------------------------------
      0020F6                       5990 const_odr:
      009DFE 00 18            [ 1] 5991 	ld a,#TK_INTGR 
      009E00 1E 01 CD         [ 2] 5992 	ldw x,#GPIO_ODR
      009E03 84               [ 4] 5993 	ret 
      0020FC                       5994 const_idr:
      009E04 12 5C            [ 1] 5995 	ld a,#TK_INTGR 
      009E06 90 85 89         [ 2] 5996 	ldw x,#GPIO_IDR
      009E09 5F               [ 4] 5997 	ret 
      002102                       5998 const_ddr:
      009E0A CD 82            [ 1] 5999 	ld a,#TK_INTGR 
      009E0C C2 5B 02         [ 2] 6000 	ldw x,#GPIO_DDR
      009E0F 81               [ 4] 6001 	ret 
      009E10                       6002 const_cr1:
      009E10 72 0D            [ 1] 6003 	ld a,#TK_INTGR 
      009E12 52 30 FB         [ 2] 6004 	ldw x,#GPIO_CR1
      009E15 72               [ 4] 6005 	ret 
      00210E                       6006 const_cr2:
      009E16 16 00            [ 1] 6007 	ld a,#TK_INTGR 
      009E18 24 8E 81         [ 2] 6008 	ldw x,#GPIO_CR2
      009E1B 81               [ 4] 6009 	ret 
                                   6010 ;-------------------------
                                   6011 ;  constant for port mode
                                   6012 ;  used by PMODE 
                                   6013 ;  input or output
                                   6014 ;------------------------
      002114                       6015 const_output:
      009E1B CD 91            [ 1] 6016 	ld a,#TK_INTGR 
      009E1D E1 A1 84         [ 2] 6017 	ldw x,#OUTP
      009E20 27               [ 4] 6018 	ret 
      00211A                       6019 const_input:
      009E21 03 CC            [ 1] 6020 	ld a,#TK_INTGR 
      009E23 88 F5 00         [ 2] 6021 	ldw x,#INP 
      009E25 81               [ 4] 6022 	ret 
                                   6023 ;-----------------------
                                   6024 ; memory area constants
                                   6025 ;-----------------------
      002120                       6026 const_eeprom_base:
      009E25 5D 27            [ 1] 6027 	ld a,#TK_INTGR 
      009E27 04 8F 5A         [ 2] 6028 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E2A 26               [ 4] 6029 	ret 
                                   6030 
                                   6031 ;---------------------------
                                   6032 ; BASIC: DATA 
                                   6033 ; when the interpreter find 
                                   6034 ; a DATA line it skip it.
                                   6035 ;---------------------------
      002126                       6036 data:
      009E2B F9 4F 81 00 01   [ 1] 6037 	mov in,count 
      009E2E 81               [ 4] 6038 	ret 
                                   6039 
                                   6040 ;---------------------------
                                   6041 ; BASIC: DATLN  *expr*
                                   6042 ; set DATA pointer at line# 
                                   6043 ; specified by *expr* 
                                   6044 ;---------------------------
      00212C                       6045 data_line:
      009E2E CD 91 E1         [ 4] 6046 	call expression
      009E31 A1 84            [ 1] 6047 	cp a,#TK_INTGR
      009E33 27 03            [ 1] 6048 	jreq 1$
      009E35 CC 88 F5         [ 2] 6049 	jp syntax_error 
      009E38 CD 04 00         [ 4] 6050 1$: call search_lineno
      009E38 A3               [ 2] 6051 	tnzw x 
      009E39 14 00            [ 1] 6052 	jrne 3$
      009E3B 2B 0C            [ 1] 6053 2$:	ld a,#ERR_NO_LINE 
      009E3D 35 0F 50         [ 2] 6054 	jp tb_error
      002141                       6055 3$: ; check if valid data line 
      009E40 F2 A6            [ 1] 6056     ldw y,x 
      009E42 1E 62            [ 2] 6057 	ldw x,(4,x)
      009E44 A6 10 62         [ 2] 6058 	cpw x,#data 
      009E47 20 1E            [ 1] 6059 	jrne 2$ 
      009E49 90 CF 00 06      [ 2] 6060 	ldw data_ptr,y
      009E49 A3 08 00         [ 1] 6061 	ld a,(2,y)
      009E4C 2B 09 35         [ 1] 6062 	ld data_len,a 
      009E4F 0E 50 F2 A6      [ 1] 6063 	mov data_ofs,#FIRST_DATA_ITEM 
      009E53 50               [ 4] 6064 	ret
                                   6065 
                                   6066 ;---------------------------------
                                   6067 ; BASIC: RESTORE 
                                   6068 ; set data_ptr to first data line
                                   6069 ; if not DATA found pointer set to
                                   6070 ; zero 
                                   6071 ;---------------------------------
      002159                       6072 restore:
      009E54 62 20 10 06      [ 1] 6073 	clr data_ptr 
      009E57 72 5F 00 07      [ 1] 6074 	clr data_ptr+1
      009E57 35 07 50 F2      [ 1] 6075 	clr data_ofs 
      009E5B 72 5F 00 09      [ 1] 6076 	clr data_len
      009E5B A3 00 40         [ 2] 6077 	ldw x,txtbgn
      00216C                       6078 data_search_loop: 	
      009E5E 23 07 72         [ 2] 6079 	cpw x,txtend
      009E61 5C 50            [ 1] 6080 	jruge 9$
      009E63 F2 54            [ 1] 6081 	ldw y,x 
      009E65 20 F4            [ 2] 6082 	ldw x,(4,x)
      009E67 A3 21 26         [ 2] 6083 	cpw x,#data 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E67 9F 4A            [ 1] 6084 	jrne try_next_line 
      009E69 27 01 4A 06      [ 2] 6085 	ldw data_ptr,y 
      009E6C 90 E6 02         [ 1] 6086 	ld a,(2,y)
      009E6C A4 3E C7         [ 1] 6087 	ld data_len,a 
      009E6F 50 F1 72 18      [ 1] 6088 	mov data_ofs,#FIRST_DATA_ITEM
      009E73 50 F0 8E 81      [ 1] 6089 9$:	tnz data_len 
      009E77 26 05            [ 1] 6090     jrne 10$
      009E77 CE 00            [ 1] 6091 	ld a,#ERR_NO_DATA 
      009E79 0F A6 84         [ 2] 6092 	jp tb_error 
      009E7C 81               [ 4] 6093 10$:ret
      009E7D                       6094 try_next_line:
      009E7D CD               [ 1] 6095 	ldw x,y 
      009E7E 90 E3            [ 1] 6096 	ld a,(2,x)
      009E80 A1 01 27         [ 1] 6097 	ld acc8,a 
      009E83 03 CC 88 F5      [ 1] 6098 	clr acc16 
      009E87 72 BB 00 0C      [ 2] 6099 	addw x,acc16 
      009E87 85 9E            [ 2] 6100 	jra data_search_loop
                                   6101 
                                   6102 
                                   6103 ;---------------------------------
                                   6104 ; BASIC: READ 
                                   6105 ; return next data item | 0 
                                   6106 ;---------------------------------
                           000001  6107 	CTX_BPTR=1 
                           000003  6108 	CTX_IN=3 
                           000004  6109 	CTX_COUNT=4 
                           000005  6110 	XSAVE=5
                           000006  6111 	VSIZE=6
      0021A4                       6112 read:
      0021A4                       6113 	_vars  VSIZE 
      009E89 A5 80            [ 2]    1     sub sp,#VSIZE 
      0021A6                       6114 read01:	
      009E8B 27 01 50         [ 1] 6115 	ld a,data_ofs
      009E8E A6 84 81         [ 1] 6116 	cp a,data_len 
      009E91 27 37            [ 1] 6117 	jreq 2$ ; end of line  
      009E91 CD 90 E3         [ 4] 6118 	call save_context
      009E94 A1 02 27         [ 2] 6119 	ldw x,data_ptr 
      009E97 03 CC 88         [ 2] 6120 	ldw basicptr,x 
      009E9A F5 85 9E 14 01   [ 1] 6121 	mov in,data_ofs 
      009E9F 95 9F 14 02 97   [ 1] 6122 	mov count,data_len  
      009EA4 5B 02 A6         [ 4] 6123 	call expression 
      009EA7 84 81            [ 1] 6124 	cp a,#TK_INTGR 
      009EA9 27 03            [ 1] 6125 	jreq 1$ 
      009EA9 CD 90 E3         [ 2] 6126 	jp syntax_error 
      0021CB                       6127 1$:
      009EAC A1 02            [ 2] 6128 	ldw (XSAVE,SP),x
      009EAE 27 03 CC         [ 4] 6129 	call next_token ; skip comma
      009EB1 88 F5 04         [ 2] 6130 	ldw x,basicptr 
      009EB3 CF 00 06         [ 2] 6131 	ldw data_ptr,x 
      009EB3 85 9E 1A 01 95   [ 1] 6132 	mov data_ofs,in 
      009EB8 9F 1A 02         [ 4] 6133 	call rest_context
      009EBB 97 5B            [ 2] 6134 	ldw x,(XSAVE,sp)
      009EBD 02 A6            [ 1] 6135 	ld a,#TK_INTGR
      0021E2                       6136 	_drop VSIZE 
      009EBF 84 81            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EC1 81               [ 4] 6137 	ret 
      0021E5                       6138 2$: ; end of line reached 
      009EC1 CD 90 E3 A1      [ 2] 6139 	ldw y, data_ptr 
      009EC5 02 27 03 CC      [ 1] 6140 	clr data_ptr
      009EC9 88 F5 00 07      [ 1] 6141 	clr data_ptr+1   
      009ECB 72 5F 00 08      [ 1] 6142 	clr data_ofs 
      009ECB 85 9E 18 01      [ 1] 6143 	clr data_len 
      009ECF 95 9F 18         [ 4] 6144 	call try_next_line 
      009ED2 02 97            [ 2] 6145 	jra read01
                                   6146 
                                   6147 
                                   6148 ;---------------------------------
                                   6149 ; BASIC: SPIEN clkdiv, 0|1  
                                   6150 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6151 ; if clkdiv==-1 disable SPI
                                   6152 ; 0|1 -> disable|enable  
                                   6153 ;--------------------------------- 
                           000005  6154 SPI_CS_BIT=5
      0021FE                       6155 spi_enable:
      009ED4 5B 02 A6         [ 4] 6156 	call arg_list 
      009ED7 84 81            [ 1] 6157 	cp a,#2
      009ED9 27 03            [ 1] 6158 	jreq 1$
      009ED9 CD 90 E3         [ 2] 6159 	jp syntax_error 
      002208                       6160 1$: 
      009EDC A1 02 27 03      [ 1] 6161 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009EE0 CC               [ 2] 6162 	popw x  
      009EE1 88               [ 2] 6163 	tnzw x 
      009EE2 F5 90            [ 1] 6164 	jreq spi_disable 
      009EE4 85               [ 2] 6165 	popw x 
      009EE5 85 90            [ 1] 6166 	ld a,#(1<<SPI_CR1_BR)
      009EE7 5D               [ 4] 6167 	mul x,a 
      009EE8 27               [ 1] 6168 	ld a,xl 
      009EE9 05 58 90         [ 1] 6169 	ld SPI_CR1,a 
                                   6170 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009EEC 5A 26 FB 14      [ 1] 6171 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009EEF 72 1A 50 16      [ 1] 6172 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6173 ; configure SPI as master mode 0.	
      009EEF A6 84 81 00      [ 1] 6174 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6175 ; ~CS line controlled by sofware 	
      009EF2 72 12 52 01      [ 1] 6176 	bset SPI_CR2,#SPI_CR2_SSM 
      009EF2 CD 90 E3 A1      [ 1] 6177     bset SPI_CR2,#SPI_CR2_SSI 
                                   6178 ; enable SPI
      009EF6 02 27 03 CC      [ 1] 6179 	bset SPI_CR1,#SPI_CR1_SPE 	
      009EFA 88               [ 4] 6180 	ret 
      002231                       6181 spi_disable:
      002231                       6182 	_drop #2; throw first argument.
      009EFB F5 90            [ 2]    1     addw sp,##2 
                                   6183 ; wait spi idle 
      009EFD 85 85            [ 1] 6184 1$:	ld a,#0x82 
      009EFF 90 5D 27         [ 1] 6185 	and a,SPI_SR
      009F02 05 54            [ 1] 6186 	cp a,#2 
      009F04 90 5A            [ 1] 6187 	jrne 1$
      009F06 26 FB 52 00      [ 1] 6188 	bres SPI_CR1,#SPI_CR1_SPE
      009F08 72 13 50 C7      [ 1] 6189 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F08 A6 84 81 16      [ 1] 6190 	bres PE_DDR,#SPI_CS_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F0B 81               [ 4] 6191 	ret 
                                   6192 
      002249                       6193 spi_clear_error:
      009F0B A6 84            [ 1] 6194 	ld a,#0x78 
      009F0D CD 90 D6         [ 1] 6195 	bcp a,SPI_SR 
      009F10 9F A4            [ 1] 6196 	jreq 1$
      009F12 07 C7 50 C6      [ 1] 6197 	clr SPI_SR 
      009F16 81               [ 4] 6198 1$: ret 
                                   6199 
      009F17                       6200 spi_send_byte:
      009F17 52               [ 1] 6201 	push a 
      009F18 01 CD 90         [ 4] 6202 	call spi_clear_error
      009F1B E8               [ 1] 6203 	pop a 
      009F1C A1 02 27 03 CC   [ 2] 6204 	btjf SPI_SR,#SPI_SR_TXE,.
      009F21 88 F5 90         [ 1] 6205 	ld SPI_DR,a
      009F24 85 85 CD 9F 58   [ 2] 6206 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F29 6B 01 A6         [ 1] 6207 	ld a,SPI_DR 
      009F2C 01               [ 4] 6208 	ret 
                                   6209 
      00226B                       6210 spi_rcv_byte:
      009F2D 0D 01            [ 1] 6211 	ld a,#255
      009F2F 27 0B 48 0A 01   [ 2] 6212 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F34 26 FB 6B         [ 1] 6213 	ld a,SPI_DR 
      009F37 01               [ 4] 6214 	ret
                                   6215 
                                   6216 ;------------------------------
                                   6217 ; BASIC: SPIWR byte [,byte]
                                   6218 ; write 1 or more byte
                                   6219 ;------------------------------
      002276                       6220 spi_write:
      009F38 EA 03 E7         [ 4] 6221 	call expression
      009F3B 03 90            [ 1] 6222 	cp a,#TK_INTGR 
      009F3D A3 00            [ 1] 6223 	jreq 1$
      009F3F 01 27 07         [ 2] 6224 	jp syntax_error 
      002280                       6225 1$:	
      009F42 7B               [ 1] 6226 	ld a,xl 
      009F43 01 43 E4         [ 4] 6227 	call spi_send_byte 
      009F46 02 20 0A         [ 4] 6228 	call next_token 
      009F49 A1 09            [ 1] 6229 	cp a,#TK_COMMA 
      009F49 7B 01            [ 1] 6230 	jrne 2$ 
      009F4B EA 04            [ 2] 6231 	jra spi_write 
      009F4D E7               [ 1] 6232 2$:	tnz a 
      009F4E 04 7B            [ 1] 6233 	jreq 3$
      002290                       6234 	_unget_token  
      009F50 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
      009F55 5B               [ 4] 6235 3$:	ret 
                                   6236 
                                   6237 
                                   6238 ;-------------------------------
                                   6239 ; BASIC: SPIRD 	
                                   6240 ; read one byte from SPI 
                                   6241 ;-------------------------------
      002296                       6242 spi_read:
      009F56 01 81 6B         [ 4] 6243 	call spi_rcv_byte 
      009F58 5F               [ 1] 6244 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F58 58               [ 1] 6245 	ld xl,a 
      009F59 1C 9F            [ 1] 6246 	ld a,#TK_INTGR 
      009F5B 68               [ 4] 6247 	ret 
                                   6248 
                                   6249 ;------------------------------
                                   6250 ; BASIC: SPISEL 0|1 
                                   6251 ; set state of ~CS line
                                   6252 ; 0|1 deselect|select  
                                   6253 ;------------------------------
      00229E                       6254 spi_select:
      009F5C FE 9F 88         [ 4] 6255 	call next_token 
      009F5F 5E A6            [ 1] 6256 	cp a,#TK_INTGR 
      009F61 05 42            [ 1] 6257 	jreq 1$
      009F63 1C 50 00         [ 2] 6258 	jp syntax_error 
      009F66 84               [ 2] 6259 1$: tnzw x  
      009F67 81 05            [ 1] 6260 	jreq cs_high 
      009F68 72 1B 50 14      [ 1] 6261 	bres PE_ODR,#SPI_CS_BIT
      009F68 03               [ 4] 6262 	ret 
      0022B0                       6263 cs_high: 
      009F69 06 03 05 04      [ 1] 6264 	bset PE_ODR,#SPI_CS_BIT
      009F6D 00               [ 4] 6265 	ret 
                                   6266 
                                   6267 
                                   6268 ;------------------------------
                                   6269 ; BASIC: FILERX
                                   6270 ; Use to receive a BASIC program
                                   6271 ; from the PC using XMODEM 
                                   6272 ; protocol. The file is store in
                                   6273 ; Each line received is compiled
                                   6274 ; then stored in RAM. When reception 
                                   6275 ; is completed with success  the 
                                   6276 ; program is ready to be executed 
                                   6277 ; or save as local file.
                                   6278 ;--------------------------------
      0022B5                       6279 file_receive:
      009F6E 02 01 06 00 02   [ 2] 6280 	btjf flags,#FRUN,1$
      009F73 02 02            [ 1] 6281 	ld a,#ERR_CMD_ONLY
      009F75 03 03 01         [ 2] 6282 	jp tb_error 
      0022BF                       6283 1$:	
      009F78 03 03 02         [ 4] 6284 	call clear_basic
      009F7B 04 04 05         [ 2] 6285 	ldw x, txtbgn
      009F7E 02 06 02         [ 4] 6286 	call xreceive 
      009F81 07 02 05 04      [ 2] 6287 	addw x,txtbgn 
      009F85 02 04 01         [ 2] 6288 	ldw txtend,x 
      009F88 CD 09 BC         [ 4] 6289 	call print_int 
      009F88 CD 90 E3         [ 2] 6290 	ldw x,#fsize_msg 
      009F8B A1 01 27         [ 4] 6291 	call puts 
      009F8E 03               [ 4] 6292 	ret 
      009F8F CC 88 F5 74 65 73 20  6293 fsize_msg: .asciz " bytes received\n"
             72 65 63 65 69 76 65
             64 0A 00
                                   6294 
                                   6295 ;------------------------------
                                   6296 ; BASIC: FILETX "file_name" 
                                   6297 ; Transmit the program in RAM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6298 ; To the PC using XMODEM protocol.
                                   6299 ; The file transmitted as source 
                                   6300 ; file not tokenized. 
                                   6301 ;-------------------------------
      009F92                       6302 file_transmit:
                                   6303 
      009F92 A6               [ 4] 6304 	ret 
                                   6305 
                                   6306 ;-------------------------------
                                   6307 ; BASIC: PAD 
                                   6308 ; Return pad buffer address.
                                   6309 ;------------------------------
      0022EB                       6310 pad_ref:
      009F93 80 15 01         [ 2] 6311 	ldw x,#pad 
      009F96 27 05            [ 1] 6312 	ld a,TK_INTGR
      009F98 A6               [ 4] 6313 	ret 
                                   6314 
                                   6315 ;------------------------------
                                   6316 ;      dictionary 
                                   6317 ; format:
                                   6318 ;   link:   2 bytes 
                                   6319 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6320 ;   cmd_name: 16 byte max 
                                   6321 ;   code_address: 2 bytes 
                                   6322 ;------------------------------
                                   6323 	.macro _dict_entry len,name,cmd 
                                   6324 	.word LINK 
                                   6325 	LINK=.
                                   6326 name:
                                   6327 	.byte len 	
                                   6328 	.ascii "name"
                                   6329 	.word cmd 
                                   6330 	.endm 
                                   6331 
                           000000  6332 	LINK=0
                                   6333 ; respect alphabetic order for BASIC names from Z-A
                                   6334 ; this sort order is for a cleaner WORDS cmd output. 	
      0022F1                       6335 kword_end:
      0022F1                       6336 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009F99 0A CC                    1 	.word LINK 
                           0022F3     2 	LINK=.
      0022F3                          3 XOR:
      009F9B 88                       4 	.byte 3+F_IFUNC 	
      009F9C F7 4F 52                 5 	.ascii "XOR"
      009F9D 1E 41                    6 	.word bit_xor 
      0022F9                       6337 	_dict_entry,5,WRITE,write  
      009F9D CE 00                    1 	.word LINK 
                           0022FB     2 	LINK=.
      0022FB                          3 WRITE:
      009F9F 13                       4 	.byte 5 	
      009FA0 58 58 58 58 58           5 	.ascii "WRITE"
      009FA5 9E C8                    6 	.word write 
      002303                       6338 	_dict_entry,5,WORDS,words 
      009FA7 00 13                    1 	.word LINK 
                           002305     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      002305                          3 WORDS:
      009FA9 C7                       4 	.byte 5 	
      009FAA 00 0D 9F C8 00           5 	.ascii "WORDS"
      009FAF 14 C7                    6 	.word words 
      00230D                       6339 	_dict_entry 4,WAIT,wait 
      009FB1 00 0E                    1 	.word LINK 
                           00230F     2 	LINK=.
      00230F                          3 WAIT:
      009FB3 CE                       4 	.byte 4 	
      009FB4 00 15 CF 00              5 	.ascii "WAIT"
      009FB8 13 90                    6 	.word wait 
      002316                       6340 	_dict_entry,3+F_IFUNC,USR,usr
      009FBA 54 90                    1 	.word LINK 
                           002318     2 	LINK=.
      002318                          3 USR:
      009FBC 9E                       4 	.byte 3+F_IFUNC 	
      009FBD C8 00 15                 5 	.ascii "USR"
      009FC0 C7 00                    6 	.word usr 
      00231E                       6341 	_dict_entry,5,UNTIL,until 
      009FC2 15 90                    1 	.word LINK 
                           002320     2 	LINK=.
      002320                          3 UNTIL:
      009FC4 9F                       4 	.byte 5 	
      009FC5 C8 00 16 C7 00           5 	.ascii "UNTIL"
      009FCA 16 CE                    6 	.word until 
      002328                       6342 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FCC 00 0D                    1 	.word LINK 
                           00232A     2 	LINK=.
      00232A                          3 UFLASH:
      009FCE 54                       4 	.byte 6+F_IFUNC 	
      009FCF 54 54 9E C8 00 0D        5 	.ascii "UFLASH"
      009FD5 95 9F                    6 	.word uflash 
      002333                       6343 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FD7 C8 00                    1 	.word LINK 
                           002335     2 	LINK=.
      002335                          3 UBOUND:
      009FD9 0E                       4 	.byte 6+F_IFUNC 	
      009FDA 97 C8 00 16 97 9E        5 	.ascii "UBOUND"
      009FE0 C8 00                    6 	.word ubound 
      00233E                       6344 	_dict_entry,4,TONE,tone  
      009FE2 15 95                    1 	.word LINK 
                           002340     2 	LINK=.
      002340                          3 TONE:
      009FE4 CF                       4 	.byte 4 	
      009FE5 00 15 90 85              5 	.ascii "TONE"
      009FE9 65 93                    6 	.word tone 
      002347                       6345 	_dict_entry,2,TO,to
      009FEB 5C 40                    1 	.word LINK 
                           002349     2 	LINK=.
      009FEC                          3 TO:
      009FEC A6                       4 	.byte 2 	
      009FED 84 81                    5 	.ascii "TO"
      009FEF 16 87                    6 	.word to 
      00234E                       6346 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009FEF 52 03                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                           002350     2 	LINK=.
      002350                          3 TIMEOUT:
      009FF1 0F                       4 	.byte 7+F_IFUNC 	
      009FF2 02 0F 03 90 AE A7 17     5 	.ascii "TIMEOUT"
      009FF9 93 F6                    6 	.word timeout 
      00235A                       6347 	_dict_entry,5,TIMER,set_timer
      009FFB A4 0F                    1 	.word LINK 
                           00235C     2 	LINK=.
      00235C                          3 TIMER:
      009FFD 6B                       4 	.byte 5 	
      009FFE 01 0C 03 5C F6           5 	.ascii "TIMER"
      00A003 CD 83                    6 	.word set_timer 
      002364                       6348 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A005 20 0C                    1 	.word LINK 
                           002366     2 	LINK=.
      002366                          3 TICKS:
      00A007 02                       4 	.byte 5+F_IFUNC 	
      00A008 0A 01 26 F5 A6           5 	.ascii "TICKS"
      00A00D 46 11                    6 	.word get_ticks 
      00236E                       6349 	_dict_entry,4,STOP,stop 
      00A00F 02 2B                    1 	.word LINK 
                           002370     2 	LINK=.
      002370                          3 STOP:
      00A011 09                       4 	.byte 4 	
      00A012 A6 20 CD 83              5 	.ascii "STOP"
      00A016 20 0C                    6 	.word stop 
      002377                       6350 	_dict_entry,4,STEP,step 
      00A018 02 20                    1 	.word LINK 
                           002379     2 	LINK=.
      002379                          3 STEP:
      00A01A 07                       4 	.byte 4 	
      00A01B A6 0D CD 83              5 	.ascii "STEP"
      00A01F 20 0F                    6 	.word step 
      002380                       6351 	_dict_entry,5,SPIWR,spi_write
      00A021 02 72                    1 	.word LINK 
                           002382     2 	LINK=.
      002382                          3 SPIWR:
      00A023 A2                       4 	.byte 5 	
      00A024 00 02 90 FE 26           5 	.ascii "SPIWR"
      00A029 CF A6                    6 	.word spi_write 
      00238A                       6352 	_dict_entry,6,SPISEL,spi_select
      00A02B 0D CD                    1 	.word LINK 
                           00238C     2 	LINK=.
      00238C                          3 SPISEL:
      00A02D 83                       4 	.byte 6 	
      00A02E 20 5F 7B 03 97 CD        5 	.ascii "SPISEL"
      00A034 8A 3C                    6 	.word spi_select 
      002395                       6353 	_dict_entry,5,SPIEN,spi_enable 
      00A036 AE A0                    1 	.word LINK 
                           002397     2 	LINK=.
      002397                          3 SPIEN:
      00A038 3F                       4 	.byte 5 	
      00A039 CD 83 33 5B 03           5 	.ascii "SPIEN"
      00A03E 81 20                    6 	.word spi_enable 
      00239F                       6354 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A040 77 6F                    1 	.word LINK 
                           0023A1     2 	LINK=.
      0023A1                          3 SPIRD:
      00A042 72                       4 	.byte 5+F_IFUNC 	
      00A043 64 73 20 69 6E           5 	.ascii "SPIRD"
      00A048 20 64                    6 	.word spi_read 
      0023A9                       6355 	_dict_entry,5,SLEEP,sleep 
      00A04A 69 63                    1 	.word LINK 
                           0023AB     2 	LINK=.
      0023AB                          3 SLEEP:
      00A04C 74                       4 	.byte 5 	
      00A04D 69 6F 6E 61 72           5 	.ascii "SLEEP"
      00A052 79 0A                    6 	.word sleep 
      0023B3                       6356 	_dict_entry,4+F_IFUNC,SIZE,size
      00A054 00 AB                    1 	.word LINK 
                           0023B5     2 	LINK=.
      00A055                          3 SIZE:
      00A055 CD                       4 	.byte 4+F_IFUNC 	
      00A056 90 E8 A1 01              5 	.ascii "SIZE"
      00A05A 27 03                    6 	.word size 
      0023BC                       6357     _dict_entry,4,SHOW,show 
      00A05C CC 88                    1 	.word LINK 
                           0023BE     2 	LINK=.
      0023BE                          3 SHOW:
      00A05E F5                       4 	.byte 4 	
      00A05F 53 48 4F 57              5 	.ascii "SHOW"
      00A05F 85 CF                    6 	.word show 
      0023C5                       6358 	_dict_entry,4,SAVE,save
      00A061 00 11                    1 	.word LINK 
                           0023C7     2 	LINK=.
      0023C7                          3 SAVE:
      00A063 81                       4 	.byte 4 	
      00A064 53 41 56 45              5 	.ascii "SAVE"
      00A064 CE 00                    6 	.word save 
      0023CE                       6359 	_dict_entry 3,RUN,run
      00A066 11 C7                    1 	.word LINK 
                           0023D0     2 	LINK=.
      00A067                          3 RUN:
      00A067 53                       4 	.byte 3 	
      00A068 A3 FF FF                 5 	.ascii "RUN"
      00A06B 27 01                    6 	.word run 
      0023D6                       6360 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A06D 5F A6                    1 	.word LINK 
                           0023D8     2 	LINK=.
      0023D8                          3 RSHIFT:
      00A06F 84                       4 	.byte 6+F_IFUNC 	
      00A070 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A071 1E 72                    6 	.word rshift 
      0023E1                       6361 	_dict_entry,3+F_IFUNC,RND,random 
      00A071 CD 90                    1 	.word LINK 
                           0023E3     2 	LINK=.
      0023E3                          3 RND:
      00A073 E3                       4 	.byte 3+F_IFUNC 	
      00A074 A1 01 27                 5 	.ascii "RND"
      00A077 03 CC                    6 	.word random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0023E9                       6362 	_dict_entry,6,RETURN,return 
      00A079 88 F5                    1 	.word LINK 
                           0023EB     2 	LINK=.
      0023EB                          3 RETURN:
      00A07B 85                       4 	.byte 6 	
      00A07C 20 E9 54 55 52 4E        5 	.ascii "RETURN"
      00A07E 17 79                    6 	.word return 
      0023F4                       6363 	_dict_entry,7,RESTORE,restore 
      00A07E CD 90                    1 	.word LINK 
                           0023F6     2 	LINK=.
      0023F6                          3 RESTORE:
      00A080 E8                       4 	.byte 7 	
      00A081 A1 01 27 03 CC 88 F5     5 	.ascii "RESTORE"
      00A088 85 4B                    6 	.word restore 
      002400                       6364 	_dict_entry 6,REMARK,remark 
      00A08A 00 35                    1 	.word LINK 
                           002402     2 	LINK=.
      002402                          3 REMARK:
      00A08C CC                       4 	.byte 6 	
      00A08D 50 E0 9E A4 3F 95        5 	.ascii "REMARK"
      00A093 A3 00                    6 	.word remark 
      00240B                       6365 	_dict_entry,6,REBOOT,cold_start
      00A095 FF 23                    1 	.word LINK 
                           00240D     2 	LINK=.
      00240D                          3 REBOOT:
      00A097 06                       4 	.byte 6 	
      00A098 0C 01 98 56 20 F5        5 	.ascii "REBOOT"
      00A09E 35 55                    6 	.word cold_start 
      002416                       6366 	_dict_entry,4+F_IFUNC,READ,read  
      00A0A0 50 E0                    1 	.word LINK 
                           002418     2 	LINK=.
      002418                          3 READ:
      00A0A2 84                       4 	.byte 4+F_IFUNC 	
      00A0A3 C7 50 E1 9F              5 	.ascii "READ"
      00A0A7 4A 35                    6 	.word read 
      00241F                       6367 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0A9 55 50                    1 	.word LINK 
                           002421     2 	LINK=.
      002421                          3 QKEY:
      00A0AB E0                       4 	.byte 4+F_IFUNC 	
      00A0AC C7 50 E2 35              5 	.ascii "QKEY"
      00A0B0 AA 50                    6 	.word qkey 
      002428                       6368 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0B2 E0 81                    1 	.word LINK 
                           00242A     2 	LINK=.
      00A0B4                          3 PRTI:
      00A0B4 35                       4 	.byte 4+F_IFUNC 	
      00A0B5 AA 50 E0 81              5 	.ascii "PRTI"
      00A0B9 20 F0                    6 	.word const_porti 
      002431                       6369 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0B9 CD 90                    1 	.word LINK 
                           002433     2 	LINK=.
      002433                          3 PRTH:
      00A0BB E3                       4 	.byte 4+F_IFUNC 	
      00A0BC A1 01 27 03              5 	.ascii "PRTH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0C0 CC 88                    6 	.word const_porth 
      00243A                       6370 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0C2 F5 85                    1 	.word LINK 
                           00243C     2 	LINK=.
      00A0C4                          3 PRTG:
      00A0C4 5D                       4 	.byte 4+F_IFUNC 	
      00A0C5 27 0A A6 0F              5 	.ascii "PRTG"
      00A0C9 59 25                    6 	.word const_portg 
      002443                       6371 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0CB 03 4A                    1 	.word LINK 
                           002445     2 	LINK=.
      002445                          3 PRTF:
      00A0CD 20                       4 	.byte 4+F_IFUNC 	
      00A0CE FA 5F 97 A6              5 	.ascii "PRTF"
      00A0D2 84 81                    6 	.word const_portf 
      00A0D4                       6372 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A0D4 CD 90                    1 	.word LINK 
                           00244E     2 	LINK=.
      00244E                          3 PRTE:
      00A0D6 E3                       4 	.byte 4+F_IFUNC 	
      00A0D7 A1 01 27 03              5 	.ascii "PRTE"
      00A0DB CC 88                    6 	.word const_porte 
      002455                       6373 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0DD F5 85                    1 	.word LINK 
                           002457     2 	LINK=.
      002457                          3 PRTD:
      00A0DF 9F                       4 	.byte 4+F_IFUNC 	
      00A0E0 A4 0F 5F 5C              5 	.ascii "PRTD"
      00A0E4 4D 27                    6 	.word const_portd 
      00245E                       6374 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A0E6 04 58                    1 	.word LINK 
                           002460     2 	LINK=.
      002460                          3 PRTC:
      00A0E8 4A                       4 	.byte 4+F_IFUNC 	
      00A0E9 20 F9 A6 84              5 	.ascii "PRTC"
      00A0ED 81 CC                    6 	.word const_portc 
      00A0EE                       6375 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A0EE CD 90                    1 	.word LINK 
                           002469     2 	LINK=.
      002469                          3 PRTB:
      00A0F0 E3                       4 	.byte 4+F_IFUNC 	
      00A0F1 A1 01 27 03              5 	.ascii "PRTB"
      00A0F5 CC 88                    6 	.word const_portb 
      002470                       6376 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A0F7 F5 85                    1 	.word LINK 
                           002472     2 	LINK=.
      002472                          3 PRTA:
      00A0F9 53                       4 	.byte 4+F_IFUNC 	
      00A0FA A6 84 81 41              5 	.ascii "PRTA"
      00A0FD 20 C0                    6 	.word const_porta 
      002479                       6377 	_dict_entry 5,PRINT,print 
      00A0FD 85 52                    1 	.word LINK 
                           00247B     2 	LINK=.
      00247B                          3 PRINT:
      00A0FF 04                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A100 89 90 CE 00 05           5 	.ascii "PRINT"
      00A105 17 03                    6 	.word print 
      002483                       6378 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A107 90 CE                    1 	.word LINK 
                           002485     2 	LINK=.
      002485                          3 POUT:
      00A109 00                       4 	.byte 4+F_IFUNC 	
      00A10A 01 17 05 72              5 	.ascii "POUT"
      00A10E 5C 00                    6 	.word const_output 
      00248C                       6379 	_dict_entry,4,POKE,poke 
      00A110 21 81                    1 	.word LINK 
                           00248E     2 	LINK=.
      00A112                          3 POKE:
      00A112 72                       4 	.byte 4 	
      00A113 5D 00 21 26              5 	.ascii "POKE"
      00A117 03 CC                    6 	.word poke 
      002495                       6380 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A119 88 F5                    1 	.word LINK 
                           002497     2 	LINK=.
      00A11B                          3 PINP:
      00A11B CD                       4 	.byte 4+F_IFUNC 	
      00A11C 92 2A A1 84              5 	.ascii "PINP"
      00A120 27 03                    6 	.word const_input 
      00249E                       6381 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A122 CC 88                    1 	.word LINK 
                           0024A0     2 	LINK=.
      0024A0                          3 PEEK:
      00A124 F5                       4 	.byte 4+F_IFUNC 	
      00A125 50 45 45 4B              5 	.ascii "PEEK"
      00A125 5D 26                    6 	.word peek 
      0024A7                       6382 	_dict_entry,5,PMODE,pin_mode 
      00A127 10 1E                    1 	.word LINK 
                           0024A9     2 	LINK=.
      0024A9                          3 PMODE:
      00A129 03                       4 	.byte 5 	
      00A12A CF 00 05 E6 02           5 	.ascii "PMODE"
      00A12F C7 00                    6 	.word pin_mode 
      0024B1                       6383 	_dict_entry,5,PAUSE,pause 
      00A131 04 1E                    1 	.word LINK 
                           0024B3     2 	LINK=.
      0024B3                          3 PAUSE:
      00A133 05                       4 	.byte 5 	
      00A134 CF 00 01 81 45           5 	.ascii "PAUSE"
      00A138 1D 9B                    6 	.word pause 
      0024BB                       6384 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A138 85 5B                    1 	.word LINK 
                           0024BD     2 	LINK=.
      0024BD                          3 PAD:
      00A13A 04                       4 	.byte 3+F_IFUNC 	
      00A13B 72 5A 00                 5 	.ascii "PAD"
      00A13E 21 FC                    6 	.word pad_ref 
      00A140                       6385 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A140 AE 00                    1 	.word LINK 
                           0024C5     2 	LINK=.
      0024C5                          3 OR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A142 00                       4 	.byte 2+F_IFUNC 	
      00A143 A6 84                    5 	.ascii "OR"
      00A145 81 29                    6 	.word bit_or 
      00A146                       6386 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A146 AE 00                    1 	.word LINK 
                           0024CC     2 	LINK=.
      0024CC                          3 ODR:
      00A148 01                       4 	.byte 3+F_IFUNC 	
      00A149 A6 84 81                 5 	.ascii "ODR"
      00A14C 20 F6                    6 	.word const_odr 
      0024D2                       6387 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A14C AE 00                    1 	.word LINK 
                           0024D4     2 	LINK=.
      0024D4                          3 NOT:
      00A14E 02                       4 	.byte 3+F_IFUNC 	
      00A14F A6 84 81                 5 	.ascii "NOT"
      00A152 1F F1                    6 	.word func_not 
      0024DA                       6388 	_dict_entry,3,NEW,new
      00A152 AE 00                    1 	.word LINK 
                           0024DC     2 	LINK=.
      0024DC                          3 NEW:
      00A154 03                       4 	.byte 3 	
      00A155 A6 84 81                 5 	.ascii "NEW"
      00A158 19 62                    6 	.word new 
      0024E2                       6389 	_dict_entry,4,NEXT,next 
      00A158 AE 00                    1 	.word LINK 
                           0024E4     2 	LINK=.
      0024E4                          3 NEXT:
      00A15A 04                       4 	.byte 4 	
      00A15B A6 84 81 54              5 	.ascii "NEXT"
      00A15E 16 DE                    6 	.word next 
      0024EB                       6390 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A15E AE 00                    1 	.word LINK 
                           0024ED     2 	LINK=.
      0024ED                          3 LSHIFT:
      00A160 05                       4 	.byte 6+F_IFUNC 	
      00A161 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A164 1E 59                    6 	.word lshift 
      0024F6                       6391 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A164 AE 00                    1 	.word LINK 
                           0024F8     2 	LINK=.
      0024F8                          3 LOG:
      00A166 06                       4 	.byte 3+F_IFUNC 	
      00A167 A6 84 81                 5 	.ascii "LOG"
      00A16A 20 39                    6 	.word log2 
      0024FE                       6392 	_dict_entry,4,LOAD,load 
      00A16A AE 00                    1 	.word LINK 
                           002500     2 	LINK=.
      002500                          3 LOAD:
      00A16C 07                       4 	.byte 4 	
      00A16D A6 84 81 44              5 	.ascii "LOAD"
      00A170 1B 4D                    6 	.word load 
      002507                       6393 	_dict_entry 4,LIST,list
      00A170 AE 00                    1 	.word LINK 
                           002509     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      002509                          3 LIST:
      00A172 08                       4 	.byte 4 	
      00A173 A6 84 81 54              5 	.ascii "LIST"
      00A176 12 A7                    6 	.word list 
      002510                       6394 	_dict_entry 3,LET,let 
      00A176 A6 84                    1 	.word LINK 
                           002512     2 	LINK=.
      002512                          3 LET:
      00A178 AE                       4 	.byte 3 	
      00A179 00 00 81                 5 	.ascii "LET"
      00A17C 12 7C                    6 	.word let 
      002518                       6395 	_dict_entry,3+F_IFUNC,KEY,key 
      00A17C A6 84                    1 	.word LINK 
                           00251A     2 	LINK=.
      00251A                          3 KEY:
      00A17E AE                       4 	.byte 3+F_IFUNC 	
      00A17F 00 01 81                 5 	.ascii "KEY"
      00A182 1C CF                    6 	.word key 
      002520                       6396 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A182 A6 84                    1 	.word LINK 
                           002522     2 	LINK=.
      002522                          3 IWDGREF:
      00A184 AE                       4 	.byte 7 	
      00A185 00 02 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A188 20 34                    6 	.word refresh_iwdg 
      00252C                       6397 	_dict_entry,6,IWDGEN,enable_iwdg
      00A188 A6 84                    1 	.word LINK 
                           00252E     2 	LINK=.
      00252E                          3 IWDGEN:
      00A18A AE                       4 	.byte 6 	
      00A18B 00 03 81 47 45 4E        5 	.ascii "IWDGEN"
      00A18E 1F FE                    6 	.word enable_iwdg 
      002537                       6398 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A18E A6 84                    1 	.word LINK 
                           002539     2 	LINK=.
      002539                          3 INVERT:
      00A190 AE                       4 	.byte 6+F_IFUNC 	
      00A191 00 04 81 45 52 54        5 	.ascii "INVERT"
      00A194 20 6E                    6 	.word invert 
      002542                       6399 	_dict_entry,5,INPUT,input_var  
      00A194 A6 84                    1 	.word LINK 
                           002544     2 	LINK=.
      002544                          3 INPUT:
      00A196 AE                       4 	.byte 5 	
      00A197 00 01 81 55 54           5 	.ascii "INPUT"
      00A19A 15 3B                    6 	.word input_var 
      00254C                       6400 	_dict_entry,2,IF,if 
      00A19A A6 84                    1 	.word LINK 
                           00254E     2 	LINK=.
      00254E                          3 IF:
      00A19C AE                       4 	.byte 2 	
      00A19D 00 00                    5 	.ascii "IF"
      00A19F 81 4A                    6 	.word if 
      00A1A0                       6401 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1A0 A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           002555     2 	LINK=.
      002555                          3 IDR:
      00A1A2 AE                       4 	.byte 3+F_IFUNC 	
      00A1A3 40 00 81                 5 	.ascii "IDR"
      00A1A6 20 FC                    6 	.word const_idr 
      00255B                       6402 	_dict_entry,3,HEX,hex_base
      00A1A6 55 00                    1 	.word LINK 
                           00255D     2 	LINK=.
      00255D                          3 HEX:
      00A1A8 04                       4 	.byte 3 	
      00A1A9 00 02 81                 5 	.ascii "HEX"
      00A1AC 12 46                    6 	.word hex_base 
      002563                       6403 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1AC CD 91                    1 	.word LINK 
                           002565     2 	LINK=.
      002565                          3 GPIO:
      00A1AE E1                       4 	.byte 4+F_IFUNC 	
      00A1AF A1 84 27 03              5 	.ascii "GPIO"
      00A1B3 CC 88                    6 	.word gpio 
      00256C                       6404 	_dict_entry,4,GOTO,goto 
      00A1B5 F5 CD                    1 	.word LINK 
                           00256E     2 	LINK=.
      00256E                          3 GOTO:
      00A1B7 84                       4 	.byte 4 	
      00A1B8 80 5D 26 05              5 	.ascii "GOTO"
      00A1BC A6 05                    6 	.word goto 
      002575                       6405 	_dict_entry,5,GOSUB,gosub 
      00A1BE CC 88                    1 	.word LINK 
                           002577     2 	LINK=.
      002577                          3 GOSUB:
      00A1C0 F7                       4 	.byte 5 	
      00A1C1 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A1C1 90 93                    6 	.word gosub 
      00257F                       6406 	_dict_entry,6,FORGET,forget 
      00A1C3 EE 04                    1 	.word LINK 
                           002581     2 	LINK=.
      002581                          3 FORGET:
      00A1C5 A3                       4 	.byte 6 	
      00A1C6 A1 A6 26 F2 90 CF        5 	.ascii "FORGET"
      00A1CC 00 07                    6 	.word forget 
      00258A                       6407 	_dict_entry,3,FOR,for 
      00A1CE 90 E6                    1 	.word LINK 
                           00258C     2 	LINK=.
      00258C                          3 FOR:
      00A1D0 02                       4 	.byte 3 	
      00A1D1 C7 00 0A                 5 	.ascii "FOR"
      00A1D4 35 06                    6 	.word for 
      002592                       6408 	_dict_entry,6,FILETX,file_transmit
      00A1D6 00 09                    1 	.word LINK 
                           002594     2 	LINK=.
      002594                          3 FILETX:
      00A1D8 81                       4 	.byte 6 	
      00A1D9 46 49 4C 45 54 58        5 	.ascii "FILETX"
      00A1D9 72 5F                    6 	.word file_transmit 
      00259D                       6409 	_dict_entry,6,FILERX,file_receive 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A1DB 00 07                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 FILERX:
      00A1DD 72                       4 	.byte 6 	
      00A1DE 5F 00 08 72 5F 00        5 	.ascii "FILERX"
      00A1E4 09 72                    6 	.word file_receive 
      0025A8                       6410 	_dict_entry,4,FCPU,fcpu 
      00A1E6 5F 00                    1 	.word LINK 
                           0025AA     2 	LINK=.
      0025AA                          3 FCPU:
      00A1E8 0A                       4 	.byte 4 	
      00A1E9 CE 00 1D 55              5 	.ascii "FCPU"
      00A1EC 1E 8B                    6 	.word fcpu 
      0025B1                       6411 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A1EC C3 00                    1 	.word LINK 
                           0025B3     2 	LINK=.
      0025B3                          3 EEPROM:
      00A1EE 1F                       4 	.byte 6+F_IFUNC 	
      00A1EF 24 17 90 93 EE 04        5 	.ascii "EEPROM"
      00A1F5 A3 A1                    6 	.word const_eeprom_base 
      0025BC                       6412 	_dict_entry,3,END,cmd_end  
      00A1F7 A6 26                    1 	.word LINK 
                           0025BE     2 	LINK=.
      0025BE                          3 END:
      00A1F9 1A                       4 	.byte 3 	
      00A1FA 90 CF 00                 5 	.ascii "END"
      00A1FD 07 90                    6 	.word cmd_end 
      0025C4                       6413 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A1FF E6 02                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 DWRITE:
      00A201 C7                       4 	.byte 6+F_CMD 	
      00A202 00 0A 35 06 00 09        5 	.ascii "DWRITE"
      00A208 72 5D                    6 	.word digital_write 
      0025CF                       6414 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A20A 00 0A                    1 	.word LINK 
                           0025D1     2 	LINK=.
      0025D1                          3 DREAD:
      00A20C 26                       4 	.byte 5+F_IFUNC 	
      00A20D 05 A6 0C CC 88           5 	.ascii "DREAD"
      00A212 F7 81                    6 	.word digital_read 
      00A214                       6415 	_dict_entry,2,DO,do_loop
      00A214 93 E6                    1 	.word LINK 
                           0025DB     2 	LINK=.
      0025DB                          3 DO:
      00A216 02                       4 	.byte 2 	
      00A217 C7 00                    5 	.ascii "DO"
      00A219 0E 72                    6 	.word do_loop 
      0025E0                       6416 	_dict_entry,3,DIR,directory 
      00A21B 5F 00                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 DIR:
      00A21D 0D                       4 	.byte 3 	
      00A21E 72 BB 00                 5 	.ascii "DIR"
      00A221 0D 20                    6 	.word directory 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0025E8                       6417 	_dict_entry,3,DEC,dec_base
      00A223 C8 E2                    1 	.word LINK 
                           0025EA     2 	LINK=.
      00A224                          3 DEC:
      00A224 52                       4 	.byte 3 	
      00A225 06 45 43                 5 	.ascii "DEC"
      00A226 12 4B                    6 	.word dec_base 
      0025F0                       6418 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A226 C6 00                    1 	.word LINK 
                           0025F2     2 	LINK=.
      0025F2                          3 DDR:
      00A228 09                       4 	.byte 3+F_IFUNC 	
      00A229 C1 00 0A                 5 	.ascii "DDR"
      00A22C 27 37                    6 	.word const_ddr 
      0025F8                       6419 	_dict_entry,6,DATALN,data_line  
      00A22E CD 95                    1 	.word LINK 
                           0025FA     2 	LINK=.
      0025FA                          3 DATALN:
      00A230 9B                       4 	.byte 6 	
      00A231 CE 00 07 CF 00 05        5 	.ascii "DATALN"
      00A237 55 00                    6 	.word data_line 
      002603                       6420 	_dict_entry,4,DATA,data  
      00A239 09 00                    1 	.word LINK 
                           002605     2 	LINK=.
      002605                          3 DATA:
      00A23B 02                       4 	.byte 4 	
      00A23C 55 00 0A 00              5 	.ascii "DATA"
      00A240 04 CD                    6 	.word data 
      00260C                       6421 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A242 91 E1                    1 	.word LINK 
                           00260E     2 	LINK=.
      00260E                          3 CRL:
      00A244 A1                       4 	.byte 3+F_IFUNC 	
      00A245 84 27 03                 5 	.ascii "CRL"
      00A248 CC 88                    6 	.word const_cr1 
      002614                       6422 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A24A F5 0E                    1 	.word LINK 
                           002616     2 	LINK=.
      00A24B                          3 CRH:
      00A24B 1F                       4 	.byte 3+F_IFUNC 	
      00A24C 05 CD 89                 5 	.ascii "CRH"
      00A24F E7 CE                    6 	.word const_cr2 
      00261C                       6423 	_dict_entry,4+F_CFUNC,CHAR,char
      00A251 00 05                    1 	.word LINK 
                           00261E     2 	LINK=.
      00261E                          3 CHAR:
      00A253 CF                       4 	.byte 4+F_CFUNC 	
      00A254 00 07 55 00              5 	.ascii "CHAR"
      00A258 02 00                    6 	.word char 
      002625                       6424 	_dict_entry,3,BYE,bye 
      00A25A 09 CD                    1 	.word LINK 
                           002627     2 	LINK=.
      002627                          3 BYE:
      00A25C 95                       4 	.byte 3 	
      00A25D AB 1E 05                 5 	.ascii "BYE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A260 A6 84                    6 	.word bye 
      00262D                       6425 	_dict_entry,5,BTOGL,bit_toggle
      00A262 5B 06                    1 	.word LINK 
                           00262F     2 	LINK=.
      00262F                          3 BTOGL:
      00A264 81                       4 	.byte 5 	
      00A265 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A265 90 CE                    6 	.word bit_toggle 
      002637                       6426 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A267 00 07                    1 	.word LINK 
                           002639     2 	LINK=.
      002639                          3 BTEST:
      00A269 72                       4 	.byte 5+F_IFUNC 	
      00A26A 5F 00 07 72 5F           5 	.ascii "BTEST"
      00A26F 00 08                    6 	.word bit_test 
      002641                       6427 	_dict_entry,4,BSET,bit_set 
      00A271 72 5F                    1 	.word LINK 
                           002643     2 	LINK=.
      002643                          3 BSET:
      00A273 00                       4 	.byte 4 	
      00A274 09 72 5F 00              5 	.ascii "BSET"
      00A278 0A CD                    6 	.word bit_set 
      00264A                       6428 	_dict_entry,4,BRES,bit_reset
      00A27A A2 14                    1 	.word LINK 
                           00264C     2 	LINK=.
      00264C                          3 BRES:
      00A27C 20                       4 	.byte 4 	
      00A27D A8 52 45 53              5 	.ascii "BRES"
      00A27E 15 E2                    6 	.word bit_reset 
      002653                       6429 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A27E CD 90                    1 	.word LINK 
                           002655     2 	LINK=.
      002655                          3 BIT:
      00A280 E8                       4 	.byte 3+F_IFUNC 	
      00A281 A1 02 27                 5 	.ascii "BIT"
      00A284 03 CC                    6 	.word bitmask 
      00265B                       6430 	_dict_entry,3,AWU,awu 
      00A286 88 F5                    1 	.word LINK 
                           00265D     2 	LINK=.
      00A288                          3 AWU:
      00A288 72                       4 	.byte 3 	
      00A289 12 50 C7                 5 	.ascii "AWU"
      00A28C 85 5D                    6 	.word awu 
      002663                       6431 	_dict_entry,7,AUTORUN,autorun
      00A28E 27 21                    1 	.word LINK 
                           002665     2 	LINK=.
      002665                          3 AUTORUN:
      00A290 85                       4 	.byte 7 	
      00A291 A6 08 42 9F C7 52 00     5 	.ascii "AUTORUN"
      00A298 72 1A                    6 	.word autorun 
      00266F                       6432 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A29A 50 14                    1 	.word LINK 
                           002671     2 	LINK=.
      002671                          3 ASC:
      00A29C 72                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A29D 1A 50 16                 5 	.ascii "ASC"
      00A2A0 72 14                    6 	.word ascii 
      002677                       6433 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2A2 52 00                    1 	.word LINK 
                           002679     2 	LINK=.
      002679                          3 AND:
      00A2A4 72                       4 	.byte 3+F_IFUNC 	
      00A2A5 12 52 01                 5 	.ascii "AND"
      00A2A8 72 10                    6 	.word bit_and 
      00267F                       6434 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2AA 52 01                    1 	.word LINK 
                           002681     2 	LINK=.
      002681                          3 ADCREAD:
      00A2AC 72                       4 	.byte 7+F_IFUNC 	
      00A2AD 1C 52 00 81 45 41 44     5 	.ascii "ADCREAD"
      00A2B1 18 77                    6 	.word analog_read 
      00268B                       6435 	_dict_entry,5,ADCON,power_adc 
      00A2B1 5B 02                    1 	.word LINK 
                           00268D     2 	LINK=.
      00268D                          3 ADCON:
      00A2B3 A6                       4 	.byte 5 	
      00A2B4 82 C4 52 03 A1           5 	.ascii "ADCON"
      00A2B9 02 26                    6 	.word power_adc 
      002695                       6436 kword_dict:
      002695                       6437 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2BB F7 72                    1 	.word LINK 
                           002697     2 	LINK=.
      002697                          3 ABS:
      00A2BD 1D                       4 	.byte 3+F_IFUNC 	
      00A2BE 52 00 72                 5 	.ascii "ABS"
      00A2C1 13 50                    6 	.word abs 
                                   6438 	
                                   6439 
      002700                       6440 	.bndry 128 ; align on FLASH block.
                                   6441 ; free space for user application  
      002700                       6442 user_space:
                                   6443 ; USR() function test
      00A2C3 C7               [ 2] 6444 	pushw x 
      00A2C4 72 1B 50 16      [ 1] 6445 	bset PC_ODR,#5 
      00A2C8 81               [ 2] 6446 	popw x 
      00A2C9 CD 1D A5         [ 4] 6447 	call pause02 
      00A2C9 A6 78 C5 52      [ 1] 6448 	bres PC_ODR,#5 
      00A2CD 03               [ 4] 6449 	ret
                                   6450 
                                   6451 	.area FLASH_DRIVE (ABS)
      010000                       6452 	.org 0x10000
      010000                       6453 fdrive:
                                   6454 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002697 R   |     ACK     =  000006 
  5 ADCON      00268D R   |   5 ADCREAD    002681 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002679 R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        002671 R
    ATTRIB  =  000002     |   5 AUTORUN    002665 R   |     AUTORUN_=  004000 
  5 AWU        00265D R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
  5 BIT        002655 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       00264C R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       002643 R   |     BSIZE   =  000001 
  5 BTEST      002639 R   |   5 BTOGL      00262F R   |     BTW     =  000001 
    BUFFER  =  000002     |     BUFF_LEN=  000010     |   5 BYE        002627 R
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
    CFG_GCR_=  000000     |   5 CHAR       00261E R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
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
    CR      =  00000D     |   5 CRH        002616 R   |   5 CRL        00260E R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       002605 R
  5 DATALN     0025FA R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        0025F2 R   |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        0025EA R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0025E2 R   |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0025DB R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0025D1 R   |   5 DWRITE     0025C6 R   |   5 EEPROM     0025B3 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        0025BE R   |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025AA R
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
  5 FILERX     00259F R   |   5 FILETX     002594 R   |     FIRST   =  000001 
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
  5 FOR        00258C R   |   5 FORGET     002581 R   |     FRUN    =  000000 
    FS      =  00001C     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002577 R   |   5 GOTO       00256E R   |   5 GPIO       002565 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   5 HEX        00255D R
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
    I2C_WRIT=  000000     |   5 IDR        002555 R   |   5 IF         00254E R
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      002544 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
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
  5 INVERT     002539 R   |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     00252E R   |   5 IWDGREF    002522 R
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00251A R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        002512 R   |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   5 LINK    =  002697 R
  5 LIST       002509 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       002500 R
  5 LOG        0024F8 R   |   5 LSHIFT     0024ED R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000003     |     N1      =  000001 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0024DC R
    NEW_FREE=  000001     |   5 NEXT       0024E4 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0024D4 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0024CC R   |     ONOFF   =  000003     |     OP      =  000003 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         0024C5 R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        0024BD R   |     PAD_SIZE=  000080 
  5 PAUSE      0024B3 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       0024A0 R
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       002497 R
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 PMODE      0024A9 R   |   5 POKE       00248E R
    PORT    =  000003     |   5 POUT       002485 R   |     PREV    =  000001 
  5 PRINT      00247B R   |   5 PRTA       002472 R   |   5 PRTB       002469 R
  5 PRTC       002460 R   |   5 PRTD       002457 R   |   5 PRTE       00244E R
  5 PRTF       002445 R   |   5 PRTG       00243C R   |   5 PRTH       002433 R
  5 PRTI       00242A R   |   5 QKEY       002421 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       002418 R
  5 REBOOT     00240D R   |     REG     =  000001     |     RELOP   =  000003 
  5 REMARK     002402 R   |   5 RESTORE    0023F6 R   |     RETL1   =  000001 
  5 RETURN     0023EB R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0023E3 R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     0023D8 R   |     RST_SR  =  0050B3     |   5 RUN        0023D0 R
    RXCHAR  =  000001     |   5 SAVE       0023C7 R   |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023BE R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       0023B5 R   |     SKIP    =  000005     |   5 SLEEP      0023AB R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
    SPCNT   =  000001     |   5 SPIEN      002397 R   |   5 SPIRD      0023A1 R
  5 SPISEL     00238C R   |   5 SPIWR      002382 R   |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       002379 R
  5 STOP       002370 R   |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002366 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    002350 R
  5 TIMER      00235C R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
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
    TK_VAR  =  000085     |   5 TO         002349 R   |   5 TONE       002340 R
  5 Timer4Up   000037 R   |     U1      =  000001     |     U8      =  000003 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002335 R
  5 UBTN_Han   00007A R   |   5 UFLASH     00232A R   |   5 UNTIL      002320 R
    US      =  00001F     |   5 USER_ABO   000082 R   |   5 USR        002318 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00004D R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       00230F R   |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002305 R   |   5 WRITE      0022FB R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  5 XOR        0022F3 R   |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        001DFD R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   000B31 R
  5 add_char   00148A R   |   5 analog_r   001877 R   |   5 ansi_seq   000AF3 R
  5 arduino_   001EE8 R   |   5 arg_list   001068 R   |   1 array_si   000021 R
  5 ascii      001CAF R   |   5 at_tst     000D38 R   |   5 atoi24     000E49 R
  5 atoi_exi   000EAF R   |   5 autorun    001D38 R   |   5 autorun_   0006CC R
  5 awu        001DAE R   |   5 awu02      001DB8 R   |   5 bad_port   001D07 R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       001804 R
  5 bin_exit   000C16 R   |   5 bit_and    001E11 R   |   5 bit_or     001E29 R
  5 bit_rese   0015E2 R   |   5 bit_set    0015D2 R   |   5 bit_test   001603 R
  5 bit_togg   0015F3 R   |   5 bit_xor    001E41 R   |   5 bitmask    002054 R
  5 bkslsh_t   000CE5 R   |   5 bksp       0002BD R   |   5 block_er   0001A3 R
  5 break_po   001944 R   |   5 bye        001D2F R   |   5 cancel_a   000694 R
  5 char       001C9D R   |   5 clear_ba   0006E1 R   |   5 clear_va   00055D R
  5 clock_in   00009D R   |   5 cmd_end    0017F0 R   |   5 cmd_line   0008FF R
  5 cmd_name   000FD7 R   |   5 cmp_name   0019E5 R   |   5 cold_sta   0005CB R
  5 colon_ts   000D0C R   |   5 comma_ts   000D17 R   |   5 comp_msg   000855 R
  5 compile    0004EA R   |   5 const_cr   002108 R   |   5 const_cr   00210E R
  5 const_dd   002102 R   |   5 const_ee   002120 R   |   5 const_id   0020FC R
  5 const_in   00211A R   |   5 const_od   0020F6 R   |   5 const_ou   002114 R
  5 const_po   0020C0 R   |   5 const_po   0020C6 R   |   5 const_po   0020CC R
  5 const_po   0020D2 R   |   5 const_po   0020D8 R   |   5 const_po   0020DE R
  5 const_po   0020E4 R   |   5 const_po   0020EA R   |   5 const_po   0020F0 R
  5 convert_   000B8D R   |   5 copy_com   000D6D R   |   1 count      000003 R
  5 cp_loop    001017 R   |   5 create_g   000451 R   |   5 cs_high    0022B0 R
  5 cstk_pro   00121F R   |   5 dash_tst   000D2D R   |   5 data       002126 R
  1 data_len   000009 R   |   5 data_lin   00212C R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   00216C R   |   5 dbl_sign   000F5B R
  5 dec_base   00124B R   |   5 del_back   000B22 R   |   5 del_line   000424 R
  5 del_ln     000B13 R   |   5 delete     0002CD R   |   5 digital_   0018AB R
  5 digital_   0018DB R   |   5 dir_loop   001BF0 R   |   5 director   001BE4 R
  5 disk_fre   0019D2 R   |   5 div32_16   000F65 R   |   5 divide     000FBC R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

  5 divu24_8   000A44 R   |   5 dneg       000F50 R   |   5 do_loop    00207D R
  5 do_progr   000196 R   |   5 drive_fr   001C59 R   |   5 enable_i   001FFE R
  5 eql_tst    000DC2 R   |   5 equal      00149D R   |   5 erase_fl   0001C2 R
  5 err_bad_   0007C1 R   |   5 err_buf_   000837 R   |   5 err_cmd_   000785 R
  5 err_div0   00074A R   |   5 err_dupl   00079F R   |   5 err_math   000731 R
  5 err_mem_   000716 R   |   5 err_msg    0006F6 R   |   5 err_no_a   0007CD R
  5 err_no_d   000800 R   |   5 err_no_f   000824 R   |   5 err_no_l   000759 R
  5 err_no_p   000810 R   |   5 err_not_   0007B0 R   |   5 err_run_   00076F R
  5 err_synt   000723 R   |   5 escaped    000BA2 R   |   5 expect     001056 R
  5 expr_exi   0011A7 R   |   5 expressi   001161 R   |   5 factor     0010B8 R
  1 farptr     000016 R   |   5 fcpu       001E8B R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001C51 R   |   5 file_rec   0022B5 R
  5 file_tra   0022EA R   |   5 final_te   000AED R   |   5 first_li   0012D0 R
  1 flags      000023 R   |   5 for        00165E R   |   5 forget     001B7D R
  1 free_ram   00005A R   |   5 fsize_ms   0022D9 R   |   5 func_arg   001063 R
  5 func_not   001FF1 R   |   5 ge         00149F R   |   5 get_arra   001093 R
  5 get_targ   001728 R   |   5 get_tick   001DF7 R   |   5 get_toke   000C7E R
  5 getc       0002A9 R   |   5 gosub      001759 R   |   5 goto       00173E R
  5 gpio       001CE2 R   |   5 gt         00149B R   |   5 gt_tst     000DCD R
  5 hex_base   001246 R   |   5 hex_dump   000355 R   |   5 if         00164A R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001992 R   |   5 input_ex   0015A4 R   |   5 input_lo   00153D R
  5 input_va   00153B R   |   5 insert_l   00047D R   |   5 insert_l   0004E7 R
  5 interp_l   000940 R   |   5 interpre   00091B R   |   5 invert     00206E R
  5 is_alpha   00056B R   |   5 is_digit   00057C R   |   5 itoa       0009F1 R
  5 itoa_loo   000A09 R   |   5 jp_to_ta   00174C R   |   5 key        001CCF R
  5 kw_loop    000C32 R   |   5 kword_di   002695 R   |   5 kword_en   0022F1 R
  5 le         0014A4 R   |   5 leading_   002044 R   |   5 left_arr   000AF3 R
  5 let        00127C R   |   5 let_arra   00128A R   |   5 let_var    00128D R
  5 lines_sk   0012D3 R   |   5 list       0012A7 R   |   5 list_exi   001319 R
  5 list_sta   0012F3 R   |   5 load       001B4D R   |   5 load_aut   0006A3 R
  5 load_fil   001B1C R   |   5 log2       002039 R   |   5 logical_   001FE7 R
  5 long_div   000F38 R   |   5 loop_bac   00170B R   |   1 loop_dep   000020 R
  5 loop_don   001720 R   |   5 lshift     001E59 R   |   5 lt         0014A2 R
  5 lt_tst     000DF6 R   |   5 modulo     000FD2 R   |   5 move       0003BE R
  5 move_dow   0003DC R   |   5 move_era   000128 R   |   5 move_exi   0003FD R
  5 move_loo   0003E1 R   |   5 move_prg   00015C R   |   5 move_up    0003CE R
  5 mul_char   00148C R   |   5 multiply   000F00 R   |   5 mulu24_8   000A6C R
  5 nbr_tst    000CB1 R   |   5 ne         0014A7 R   |   5 neg_acc2   000AA6 R
  5 new        001962 R   |   5 next       0016DE R   |   5 next_lin   000923 R
  5 next_tok   000967 R   |   5 no_match   001029 R   |   5 other      000E1F R
  3 pad        0016E0 R   |   5 pad_ref    0022EB R   |   5 parse_bi   000BF4 R
  5 parse_in   000BAA R   |   5 parse_ke   000C31 R   |   5 parse_qu   000B55 R
  5 pause      001D9B R   |   5 pause02    001DA5 R   |   5 peek       001639 R
  5 pin_mode   001E97 R   |   5 plus_tst   000D96 R   |   5 poke       00162A R
  5 power_ad   00183B R   |   5 prcnt_ts   000DB7 R   |   5 print      0014AA R
  5 print_ex   00150F R   |   5 print_in   0009BC R   |   5 print_ty   00151B R
  5 program_   00013C R   |   5 program_   00015C R   |   5 prt_basi   001374 R
  5 prt_cmd_   00131C R   |   5 prt_loop   0014AE R   |   5 prt_quot   001330 R
  5 prt_tok    0002E7 R   |   5 prti24     0009CC R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002A0 R   |   5 puts       0002B3 R
  5 qkey       001CD7 GR  |   5 qmark_ts   000D43 R   |   5 random     001F08 R
  5 read       0021A4 R   |   5 read01     0021A6 R   |   5 readln     000AC9 R
  5 readln_l   000AD1 R   |   5 readln_q   000B46 R   |   5 refresh_   002034 R
  5 rel_exit   001202 R   |   5 relation   0011AA R   |   5 relop_st   00148F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 remark     0015A7 R   |   5 reprint    000AF3 R   |   5 reset_co   0014AC R
  5 rest_con   00152B R   |   5 restore    002159 R   |   5 return     001779 R
  5 right_ar   000AF3 R   |   5 row_alig   001977 R   |   5 row_eras   000101 R
  5 row_eras   000128 R   |   5 row_loop   000338 R   |   5 rparnt_t   000D01 R
  5 rshift     001E72 R   |   5 rt_msg     000844 R   |   5 run        001797 R
  5 run_it     0017C9 R   |   1 rx_char    000025 R   |   5 save       001A53 R
  5 save_con   00151B R   |   5 search_d   001009 R   |   5 search_e   001053 R
  5 search_f   001A06 R   |   5 search_l   000400 R   |   5 search_l   000408 R
  5 search_n   00100D R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   0019A0 R   |   5 select_p   001ED8 R   |   5 set_time   001FD5 R
  5 sharp_ts   000D22 R   |   5 show       001205 R   |   5 show_row   000326 R
  5 single_c   001485 R   |   5 size       001250 R   |   5 skip       000EB3 R
  5 slash_ts   000DAC R   |   5 sleep      001D90 R   |   5 software   000585 R
  5 spaces     0002DB R   |   5 spi_clea   002249 R   |   5 spi_disa   002231 R
  5 spi_enab   0021FE R   |   5 spi_rcv_   00226B R   |   5 spi_read   002296 R
  5 spi_sele   00229E R   |   5 spi_send   002255 R   |   5 spi_writ   002276 R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000DA1 R
  5 step       0016B7 R   |   5 stop       001916 R   |   5 store_lo   0016CB R
  5 str_matc   001036 R   |   5 str_tst    000CA1 R   |   5 strcmp     00039F R
  5 strcpy     0003B0 R   |   5 strlen     000392 R   |   5 syntax_e   000875 R
  1 tab_widt   000024 R   |   5 tb_error   000877 R   |   5 term       001112 R
  5 term01     00111B R   |   5 term_exi   00115E R   |   3 tib        001690 R
  5 tick_tst   000D5B R   |   1 ticks      00000E R   |   5 timeout    001FE4 R
  1 timer      000010 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  5 tk_id      000865 R   |   5 to         001687 R   |   5 to_eepro   00017F R
  5 to_flash   000193 R   |   5 to_upper   000E3D GR  |   5 token_ch   000E36 R
  5 token_ex   000E3A R   |   5 token_ms   00031E R   |   5 tone       0017F7 R
  5 try_next   002194 R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_in   000265 R   |   5 uart1_se   000275 R   |   5 ubound     00125A R
  5 udiv32_1   000F26 R   |   5 uflash     001D0C R   |   5 umstar     000EC6 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R   |   5 until      002092 R
  5 user_int   000060 R   |   5 user_spa   002700 R   |   5 usr        001D12 R
  5 var_name   00136C R   |   1 vars       000026 R   |   5 wait       0015AD R
  5 warm_ini   000676 R   |   5 warm_sta   0008FC R   |   5 words      001F6F R
  5 words_co   001FBF R   |   5 write      001C66 R   |   5 write_bl   000242 R
  5 write_by   0001CD R   |   5 write_ee   000209 R   |   5 write_ex   00023D R
  5 write_fl   0001F3 R   |   5 write_ro   000170 R   |     xreceive   ****** GX
  5 zero_pad   00196C R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
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

