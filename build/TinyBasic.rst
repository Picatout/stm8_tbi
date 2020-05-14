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
      008000 82 00 86 56            109     int cold_start			; RESET vector 
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
      0080AA CC 86 56         [ 2]  188 	jp cold_start 	
      0080AD                        189 2$: 
      0080AD A1 1A            [ 1]  190 	cp a,#CTRL_Z
      0080AF 26 06            [ 1]  191 	jrne 3$
      0080B1 CD 87 18         [ 4]  192 	call cancel_autorun 
      0080B4 CC 86 56         [ 2]  193 	jp cold_start 
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
      00810F CD 95 5E         [ 4]  264 	call prt_basic_line
      008112                        265 UBTN_Handler_exit:
      008112 AE 17 FF         [ 2]  266     ldw x,#STACK_EMPTY 
      008115 94               [ 1]  267     ldw sp,x
      008116 9A               [ 1]  268 	rim 
      008117 CC 89 80         [ 2]  269 	jp warm_start
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
      0082F7 CD 9A 6F         [ 4]  604 	call incr_farptr
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
      008384 CD 8A 4C         [ 4]  712 	call print_int 
      008387 A6 20            [ 1]  713 	ld a,#SPACE
      008389 CD 83 40         [ 4]  714 	call putc 
      00838C 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      00838E CD 8A 4C         [ 4]  716 	call print_int 
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
      0083B4 CD 8A 4C         [ 4]  748 	call print_int 
      0083B7 A6 20            [ 1]  749 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  750 	call putc
      0083BC                        751 row_loop:
      0083BC 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  753 	ld a,(x)
      0083BF 5F               [ 1]  754 	clrw x 
      0083C0 97               [ 1]  755 	ld xl,a 
      0083C1 CD 8A 4C         [ 4]  756 	call print_int 
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
      008507 26 15            [ 1] 1029 	jrne 0$
                                   1030 ;first text line 
      008509 AE 00 02         [ 2] 1031 	ldw x,#2 
      00850C 72 D6 00 18      [ 4] 1032 	ld a,([ptr16],x)
      008510 5F               [ 1] 1033 	clrw x 
      008511 97               [ 1] 1034 	ld xl,a
      008512 1F 07            [ 2] 1035 	ldw (LLEN,sp),x 
      008514 CE 00 1D         [ 2] 1036 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008517 1F 01            [ 2] 1037 	ldw (DEST,sp),x 
      008519 CE 00 1F         [ 2] 1038 	ldw x,txtend 
      00851C 20 37            [ 2] 1039 	jra 4$
      00851E 72 CE 00 18      [ 5] 1040 0$:	ldw x,[ptr16]
                                   1041 ; line number
      008522 1F 05            [ 2] 1042 	ldw (LINENO,sp),x 
      008524 AE 00 02         [ 2] 1043 	ldw x,#2 
      008527 72 D6 00 18      [ 4] 1044 	ld a,([ptr16],x)
      00852B 97               [ 1] 1045 	ld xl,a
                                   1046 ; line length
      00852C 1F 07            [ 2] 1047 	ldw (LLEN,sp),x
                                   1048 ; check if that line number already exit 	
      00852E 1E 05            [ 2] 1049 	ldw x,(LINENO,sp)
      008530 CD 84 82         [ 4] 1050 	call search_lineno 
      008533 5D               [ 2] 1051 	tnzw x 
      008534 26 04            [ 1] 1052 	jrne 2$
                                   1053 ; line doesn't exit
                                   1054 ; it will be inserted at this point.  	
      008536 17 01            [ 2] 1055 	ldw (DEST,sp),y 
      008538 20 05            [ 2] 1056 	jra 3$
                                   1057 ; line exit delete it.
                                   1058 ; it will be replaced by new one 	
      00853A 1F 01            [ 2] 1059 2$: ldw (DEST,sp),x 
      00853C CD 84 A6         [ 4] 1060 	call del_line
      00853F                       1061 3$: 
                                   1062 ; insert new line or leave if LLEN==3
                                   1063 ; LLEN==3 means empty line 
      00853F A6 03            [ 1] 1064 	ld a,#3
      008541 11 08            [ 1] 1065 	cp a,(LLEN+1,sp)
      008543 27 24            [ 1] 1066 	jreq insert_ln_exit ; empty line exit.
                                   1067 ; if insertion point at txtend 
                                   1068 ; move no need to create a gap 
      008545 1E 01            [ 2] 1069 	ldw x,(DEST,sp)
      008547 C3 00 1F         [ 2] 1070 	cpw x,txtend 
      00854A 27 09            [ 1] 1071 	jreq 4$ 
                                   1072 ; must create a gap
                                   1073 ; at insertion point  
      00854C 1E 01            [ 2] 1074 	ldw x,(DEST,sp)
      00854E 16 07            [ 2] 1075 	ldw y,(LLEN,sp)
      008550 CD 84 D3         [ 4] 1076 	call create_gap
      008553 20 06            [ 2] 1077 	jra 5$
      008555                       1078 4$: 
      008555 72 FB 07         [ 2] 1079 	addw x,(LLEN,sp)
      008558 CF 00 1F         [ 2] 1080 	ldw txtend,x 	 
                                   1081 ; move new line in gap 
      00855B 1E 07            [ 2] 1082 5$:	ldw x,(LLEN,sp)
      00855D CF 00 0D         [ 2] 1083 	ldw acc16,x 
      008560 90 AE 16 E0      [ 2] 1084 	ldw y,#pad ;SRC 
      008564 1E 01            [ 2] 1085 	ldw x,(DEST,sp) ; dest address 
      008566 CD 84 40         [ 4] 1086 	call move 
      008569                       1087 insert_ln_exit:	
      0004E9                       1088 	_drop VSIZE
      008569 5B 08            [ 2]    1     addw sp,#VSIZE 
      00856B 81               [ 4] 1089 	ret
                                   1090 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1091 ;-----------------------------------
                                   1092 ; create token list fromm text line 
                                   1093 ; save this list in pad buffer 
                                   1094 ;  compiled line format: 
                                   1095 ;    line_no  2 bytes {0...32767}
                                   1096 ;    count    1 byte  
                                   1097 ;    tokens   variable length 
                                   1098 ;   
                                   1099 ; input:
                                   1100 ;   none
                                   1101 ; modified variables:
                                   1102 ;   basicptr     token list buffer address 
                                   1103 ;   in.w  		 3|count, i.e. index in buffer
                                   1104 ;   count        length of line | 0  
                                   1105 ;-----------------------------------
                           000001  1106 	XSAVE=1
                           000002  1107 	VSIZE=2
      00856C                       1108 compile:
      0004EC                       1109 	_vars VSIZE 
      00856C 52 02            [ 2]    1     sub sp,#VSIZE 
      00856E 72 1A 00 24      [ 1] 1110 	bset flags,#FCOMP 
      008572 A6 00            [ 1] 1111 	ld a,#0
      008574 AE 00 00         [ 2] 1112 	ldw x,#0
      008577 CF 16 E0         [ 2] 1113 	ldw pad,x ; destination buffer 
      00857A C7 16 E2         [ 1] 1114 	ld pad+2,a ; count 
      00857D AE 16 E3         [ 2] 1115 	ldw x,#pad+3
      008580 72 5F 00 02      [ 1] 1116 	clr in 
      008584 CD 8C 70         [ 4] 1117 	call get_token
      008587 A1 84            [ 1] 1118 	cp a,#TK_INTGR
      008589 26 11            [ 1] 1119 	jrne 2$
      00858B A3 00 01         [ 2] 1120 	cpw x,#1 
      00858E 2A 05            [ 1] 1121 	jrpl 1$
      008590 A6 0A            [ 1] 1122 	ld a,#ERR_BAD_VALUE
      008592 CC 88 FB         [ 2] 1123 	jp tb_error
      008595 CF 16 E0         [ 2] 1124 1$:	ldw pad,x 
      008598 90 AE 16 E3      [ 2] 1125 	ldw y,#pad+3 
      00859C 90 A3 17 60      [ 2] 1126 2$:	cpw y,#stack_full 
      0085A0 25 05            [ 1] 1127 	jrult 3$
      0085A2 A6 0F            [ 1] 1128 	ld a,#ERR_BUF_FULL 
      0085A4 CC 88 FB         [ 2] 1129 	jp tb_error 
      0085A7                       1130 3$:	
      0085A7 93               [ 1] 1131 	ldw x,y 
      0085A8 CD 8C 70         [ 4] 1132 	call get_token 
      0085AB A1 00            [ 1] 1133 	cp a,#TK_NONE 
      0085AD 26 ED            [ 1] 1134 	jrne 2$ 
                                   1135 ; compilation completed  
      0085AF 72 A2 16 E0      [ 2] 1136 	subw y,#pad
      0085B3 90 9F            [ 1] 1137     ld a,yl
      0085B5 AE 16 E0         [ 2] 1138 	ldw x,#pad 
      0085B8 CF 00 18         [ 2] 1139 	ldw ptr16,x 
      0085BB E7 02            [ 1] 1140 	ld (2,x),a 
      0085BD FE               [ 2] 1141 	ldw x,(x)
      0085BE 27 09            [ 1] 1142 	jreq 10$
      0085C0 CD 84 FF         [ 4] 1143 	call insert_line
      0085C3 72 5F 00 04      [ 1] 1144 	clr  count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085C7 20 0F            [ 2] 1145 	jra  11$ 
      0085C9                       1146 10$: ; line# is zero 
      0085C9 CE 00 18         [ 2] 1147 	ldw x,ptr16  
      0085CC CF 00 05         [ 2] 1148 	ldw basicptr,x 
      0085CF E6 02            [ 1] 1149 	ld a,(2,x)
      0085D1 C7 00 04         [ 1] 1150 	ld count,a 
      0085D4 35 03 00 02      [ 1] 1151 	mov in,#3 
      0085D8                       1152 11$:
      000558                       1153 	_drop VSIZE 
      0085D8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085DA 72 1B 00 24      [ 1] 1154 	bres flags,#FCOMP 
      0085DE 81               [ 4] 1155 	ret 
                                   1156 
                                   1157 ;------------------------------------
                                   1158 ;  set all variables to zero 
                                   1159 ; input:
                                   1160 ;   none 
                                   1161 ; output:
                                   1162 ;	none
                                   1163 ;------------------------------------
      0085DF                       1164 clear_vars:
      0085DF AE 00 30         [ 2] 1165 	ldw x,#vars 
      0085E2 90 AE 00 34      [ 2] 1166 	ldw y,#2*26 
      0085E6 7F               [ 1] 1167 1$:	clr (x)
      0085E7 5C               [ 2] 1168 	incw x 
      0085E8 90 5A            [ 2] 1169 	decw y 
      0085EA 26 FA            [ 1] 1170 	jrne 1$
      0085EC 81               [ 4] 1171 	ret 
                                   1172 
                                   1173 ;-------------------------------------
                                   1174 ; check if A is a letter 
                                   1175 ; input:
                                   1176 ;   A 			character to test 
                                   1177 ; output:
                                   1178 ;   C flag      1 true, 0 false 
                                   1179 ;-------------------------------------
      0085ED                       1180 is_alpha:
      0085ED A1 41            [ 1] 1181 	cp a,#'A 
      0085EF 8C               [ 1] 1182 	ccf 
      0085F0 24 0B            [ 1] 1183 	jrnc 9$ 
      0085F2 A1 5B            [ 1] 1184 	cp a,#'Z+1 
      0085F4 25 07            [ 1] 1185 	jrc 9$ 
      0085F6 A1 61            [ 1] 1186 	cp a,#'a 
      0085F8 8C               [ 1] 1187 	ccf 
      0085F9 24 02            [ 1] 1188 	jrnc 9$
      0085FB A1 7B            [ 1] 1189 	cp a,#'z+1
      0085FD 81               [ 4] 1190 9$: ret 	
                                   1191 
                                   1192 ;------------------------------------
                                   1193 ; check if character in {'0'..'9'}
                                   1194 ; input:
                                   1195 ;    A  character to test
                                   1196 ; output:
                                   1197 ;    Carry  0 not digit | 1 digit
                                   1198 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085FE                       1199 is_digit:
      0085FE A1 30            [ 1] 1200 	cp a,#'0
      008600 25 03            [ 1] 1201 	jrc 1$
      008602 A1 3A            [ 1] 1202     cp a,#'9+1
      008604 8C               [ 1] 1203 	ccf 
      008605 8C               [ 1] 1204 1$:	ccf 
      008606 81               [ 4] 1205     ret
                                   1206 
                                   1207 ;-------------------------------------
                                   1208 ; return true if character in  A 
                                   1209 ; is letter or digit.
                                   1210 ; input:
                                   1211 ;   A     ASCII character 
                                   1212 ; output:
                                   1213 ;   A     no change 
                                   1214 ;   Carry    0 false| 1 true 
                                   1215 ;--------------------------------------
      008607                       1216 is_alnum:
      008607 CD 85 FE         [ 4] 1217 	call is_digit
      00860A 25 03            [ 1] 1218 	jrc 1$ 
      00860C CD 85 ED         [ 4] 1219 	call is_alpha
      00860F 81               [ 4] 1220 1$:	ret 
                                   1221 
                                   1222 
                                   1223 ;-------------------------------------
                                   1224 ;  program initialization entry point 
                                   1225 ;-------------------------------------
                           000001  1226 	MAJOR=1
                           000000  1227 	MINOR=0
      008610 0A 0A 54 69 6E 79 20  1228 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008656                       1229 cold_start:
                                   1230 ;set stack 
      008656 AE 17 FF         [ 2] 1231 	ldw x,#STACK_EMPTY
      008659 94               [ 1] 1232 	ldw sp,x   
                                   1233 ; clear all ram 
      00865A 7F               [ 1] 1234 0$: clr (x)
      00865B 5A               [ 2] 1235 	decw x 
      00865C 26 FC            [ 1] 1236 	jrne 0$
                                   1237 ; activate pull up on all inputs 
      00865E A6 FF            [ 1] 1238 	ld a,#255 
      008660 C7 50 03         [ 1] 1239 	ld PA_CR1,a 
      008663 C7 50 08         [ 1] 1240 	ld PB_CR1,a 
      008666 C7 50 0D         [ 1] 1241 	ld PC_CR1,a 
      008669 C7 50 12         [ 1] 1242 	ld PD_CR1,a 
      00866C C7 50 17         [ 1] 1243 	ld PE_CR1,a 
      00866F C7 50 1C         [ 1] 1244 	ld PF_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008672 C7 50 21         [ 1] 1245 	ld PG_CR1,a 
      008675 C7 50 2B         [ 1] 1246 	ld PI_CR1,a
                                   1247 ; set LD2 pin as output and turn it on
      008678 72 1A 50 0D      [ 1] 1248     bset PC_CR1,#LED2_BIT
      00867C 72 1A 50 0E      [ 1] 1249     bset PC_CR2,#LED2_BIT
      008680 72 1A 50 0C      [ 1] 1250     bset PC_DDR,#LED2_BIT
      008684 72 1A 50 0A      [ 1] 1251 	bset PC_ODR,#LED2_BIT 
                                   1252 ; disable schmitt triggers on Arduino CN4 analog inputs
      008688 55 00 3F 54 07   [ 1] 1253 	mov ADC_TDRL,0x3f
                                   1254 ; disable peripherals clocks
                                   1255 ;	clr CLK_PCKENR1 
                                   1256 ;	clr CLK_PCKENR2
      00868D 72 5F 50 F2      [ 1] 1257 	clr AWU_TBR 
      008691 72 14 50 CA      [ 1] 1258 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1259 ; select internal clock no divisor: 16 Mhz 	
      008695 A6 E1            [ 1] 1260 	ld a,#CLK_SWR_HSI 
      008697 5F               [ 1] 1261 	clrw x  
      008698 CD 81 35         [ 4] 1262     call clock_init 
      00869B CD 81 58         [ 4] 1263 	call timer4_init
      00869E CD 81 4B         [ 4] 1264 	call timer2_init
                                   1265 ; UART1 at 115200 BAUD
      0086A1 CD 82 FD         [ 4] 1266 	call uart1_init
                                   1267 ; activate PE_4 (user button interrupt)
      0086A4 72 18 50 18      [ 1] 1268     bset PE_CR2,#USR_BTN_BIT 
                                   1269 ; display system information
      0086A8 AE 86 10         [ 2] 1270 	ldw x,#software 
      0086AB CD A8 C0         [ 4] 1271 	call puts 
      0086AE A6 01            [ 1] 1272 	ld a,#MAJOR 
      0086B0 C7 00 0E         [ 1] 1273 	ld acc8,a 
      0086B3 5F               [ 1] 1274 	clrw x 
      0086B4 CF 00 0C         [ 2] 1275 	ldw acc24,x
      0086B7 72 5F 00 25      [ 1] 1276 	clr tab_width  
      0086BB 35 0A 00 0B      [ 1] 1277 	mov base, #10 
      0086BF CD 8A 5C         [ 4] 1278 	call prti24 
      0086C2 A6 2E            [ 1] 1279 	ld a,#'.
      0086C4 CD 83 40         [ 4] 1280 	call putc 
      0086C7 A6 00            [ 1] 1281 	ld a,#MINOR 
      0086C9 C7 00 0E         [ 1] 1282 	ld acc8,a 
      0086CC 5F               [ 1] 1283 	clrw x 
      0086CD CF 00 0C         [ 2] 1284 	ldw acc24,x 
      0086D0 CD 8A 5C         [ 4] 1285 	call prti24
      0086D3 A6 0D            [ 1] 1286 	ld a,#CR 
      0086D5 CD 83 40         [ 4] 1287 	call putc
      0086D8 CD 9A 7D         [ 4] 1288 	call seek_fdrive 
      0086DB 9A               [ 1] 1289 	rim 
      0086DC 72 5C 00 16      [ 1] 1290 	inc seedy+1 
      0086E0 72 5C 00 14      [ 1] 1291 	inc seedx+1 
      0086E4 CD 87 65         [ 4] 1292 	call clear_basic
      0086E7 CD 92 8A         [ 4] 1293 	call ubound 
                                   1294 ;	jra 2$	
      0086EA CD 98 CB         [ 4] 1295 	call beep_1khz  
      0086ED 72 1B 50 0A      [ 1] 1296 2$:	bres PC_ODR,#LED2_BIT	
      0086F1 CD 86 FA         [ 4] 1297 	call warm_init
      0086F4 CD 87 27         [ 4] 1298 	call load_autorun
      0086F7 CC 89 83         [ 2] 1299     jp cmd_line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1300 
      0086FA                       1301 warm_init:
      0086FA 72 5F 00 24      [ 1] 1302 	clr flags 
      0086FE 72 5F 00 21      [ 1] 1303 	clr loop_depth 
      008702 35 04 00 25      [ 1] 1304 	mov tab_width,#TAB_WIDTH 
      008706 35 0A 00 0B      [ 1] 1305 	mov base,#10 
      00870A AE 00 00         [ 2] 1306 	ldw x,#0 
      00870D CF 00 05         [ 2] 1307 	ldw basicptr,x 
      008710 CF 00 01         [ 2] 1308 	ldw in.w,x 
      008713 72 5F 00 04      [ 1] 1309 	clr count
      008717 81               [ 4] 1310 	ret 
                                   1311 
                                   1312 ;--------------------------
                                   1313 ; called by tb_error when
                                   1314 ; flag FAUTORUN is set.
                                   1315 ; There is a bug in autorun 
                                   1316 ; program so cancel it.
                                   1317 ;---------------------------
      008718                       1318 cancel_autorun:
      008718 AE 40 00         [ 2] 1319 	ldw x,#AUTORUN_NAME 
      00871B CF 00 18         [ 2] 1320 	ldw farptr+1,x 
      00871E 4F               [ 1] 1321 	clr a
      00871F 5F               [ 1] 1322 	clrw x  
      008720 C7 00 17         [ 1] 1323 	ld farptr,a 
      008723 CD 82 65         [ 4] 1324 	call write_byte 
      008726 81               [ 4] 1325 	ret 
                                   1326 
                                   1327 
                                   1328 ;--------------------------
                                   1329 ; if autorun file defined 
                                   1330 ; in eeprom address AUTORUN_NAME 
                                   1331 ; load and run it.
                                   1332 ;-------------------------
      008727                       1333 load_autorun:
      008727 90 AE 40 00      [ 2] 1334 	ldw y,#AUTORUN_NAME
      00872B 90 F6            [ 1] 1335 	ld a,(y)
      00872D 27 20            [ 1] 1336 	jreq 9$
      00872F CD 9A E3         [ 4] 1337 	call search_file
      008732 25 05            [ 1] 1338 	jrc 2$ 
                                   1339 ; if file doesn't exit
      008734 CD 87 18         [ 4] 1340 	call cancel_autorun
      008737 20 16            [ 2] 1341 	jra 9$ 
      008739 CD 9B FC         [ 4] 1342 2$:	call load_file
      00873C AE 40 00         [ 2] 1343 	ldw x,#AUTORUN_NAME 
      00873F CD A8 C0         [ 4] 1344 	call puts
      008742 AE 87 50         [ 2] 1345 	ldw x,#autorun_msg 
      008745 CD A8 C0         [ 4] 1346 	call puts 
      008748 72 1C 00 24      [ 1] 1347 	bset flags,#FAUTORUN 
      00874C CC 98 9D         [ 2] 1348 	jp run_it    
      00874F 81               [ 4] 1349 9$: ret 	
                                   1350 
      008750 20 6C 6F 61 64 65 64  1351 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1352 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1353 ; reset BASIC text variables 
                                   1354 ; and clear variables 
                                   1355 ;---------------------------
      008765                       1356 clear_basic:
      008765 72 5F 00 04      [ 1] 1357 	clr count
      008769 72 5F 00 02      [ 1] 1358 	clr in  
      00876D AE 00 64         [ 2] 1359 	ldw x,#free_ram 
      008770 CF 00 1D         [ 2] 1360 	ldw txtbgn,x 
      008773 CF 00 1F         [ 2] 1361 	ldw txtend,x 
      008776 CD 85 DF         [ 4] 1362 	call clear_vars 
      008779 81               [ 4] 1363 	ret 
                                   1364 
                                   1365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1366 ;;   Tiny BASIC error messages     ;;
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00877A                       1368 err_msg:
      00877A 00 00 87 9A 87 A7 87  1369 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B5 87 CE 87 DD
      008786 87 F3 88 09 88 23 88  1370 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             34 88 45
      008790 88 51 88 84 88 94 88  1371 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             A8 88 BB
                                   1372 
      00879A 4D 65 6D 6F 72 79 20  1373 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0087A7 73 79 6E 74 61 78 20  1374 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0087B5 6D 61 74 68 20 6F 70  1375 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0087CE 64 69 76 69 73 69 6F  1376 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0087DD 69 6E 76 61 6C 69 64  1377 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087F3 72 75 6E 20 74 69 6D  1378 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008809 63 6F 6D 6D 61 6E 64  1379 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      008823 64 75 70 6C 69 63 61  1380 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      008834 46 69 6C 65 20 6E 6F  1381 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008845 62 61 64 20 76 61 6C  1382 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      008851 46 69 6C 65 20 69 6E  1383 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  20-Bits]



             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008859 65 78 74 65 6E 64 65  1384 err_no_data: .asciz "No data found.\n"
             64 20 6D 65 6D 6F 72
             79 2C
      008869 20 63 61 6E 27 74 20  1385 err_no_prog: .asciz "No program in RAM!\n"
             62 65 20 72 75 6E 20
             66 72 6F 6D 20 74
      00887D 68 65 72 65 2E 0A 00  1386 err_no_fspace: .asciz "File system full.\n" 
             4E 6F 20 64 61 74 61
             20 66 6F 75 6E
      008890 64 2E 0A 00 4E 6F 20  1387 err_buf_full: .asciz "Buffer full\n"
             70 72 6F 67 72 61
                                   1388 
      00889D 6D 20 69 6E 20 52 41  1389 rt_msg: .asciz "run time error, "
             4D 21 0A 00 46 69 6C
             65 20 73
      0088AE 79 73 74 65 6D 20 66  1390 comp_msg: .asciz "compile error, "
             75 6C 6C 2E 0A 00 42
             75 66
      0088BE 66 65 72 20 66 75 6C  1391 tk_id: .asciz "last token id: "
             6C 0A 00 72 75 6E 20
             74 69
                                   1392 
      000879                       1393 syntax_error:
      0088CE 6D 65            [ 1] 1394 	ld a,#ERR_SYNTAX 
                                   1395 
      00087B                       1396 tb_error:
      0088D0 20 65 72 72 6F   [ 2] 1397 	btjt flags,#FCOMP,1$
      0088D5 72               [ 1] 1398 	push a 
      0088D6 2C 20 00         [ 2] 1399 	ldw x, #rt_msg 
      0088D9 63 6F 6D         [ 4] 1400 	call puts 
      0088DC 70               [ 1] 1401 	pop a 
      0088DD 69 6C 65         [ 2] 1402 	ldw x, #err_msg 
      0088E0 20 65 72 72      [ 1] 1403 	clr acc16 
      0088E4 6F               [ 1] 1404 	sll a
      0088E5 72 2C 20 00      [ 1] 1405 	rlc acc16  
      0088E9 6C 61 73         [ 1] 1406 	ld acc8, a 
      0088EC 74 20 74 6F      [ 2] 1407 	addw x,acc16 
      0088F0 6B               [ 2] 1408 	ldw x,(x)
      0088F1 65 6E 20         [ 4] 1409 	call puts
      0088F4 69 64 3A         [ 2] 1410 	ldw x,basicptr
      0088F7 20 00 01         [ 1] 1411 	ld a,in 
      0088F9 CD 14 DE         [ 4] 1412 	call prt_basic_line
      0088F9 A6 02 69         [ 2] 1413 	ldw x,#tk_id 
      0088FB CD 00 00         [ 4] 1414 	call puts 
      0088FB 72 0A 00         [ 1] 1415 	ld a,in.saved 
      0088FE 24               [ 1] 1416 	clrw x 
      0088FF 47               [ 1] 1417 	ld xl,a 
      008900 88 AE 88 C8      [ 2] 1418 	addw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008904 CD               [ 1] 1419 	ld a,(x)
      008905 A8               [ 1] 1420 	clrw x 
      008906 C0               [ 1] 1421 	ld xl,a 
      008907 84 AE 87         [ 4] 1422 	call print_int
      00890A 7A 72 5F 00 0D   [ 2] 1423 	btjf flags,#FAUTORUN ,6$
      00890F 48 72 59         [ 4] 1424 	call cancel_autorun  
      008912 00 0D            [ 2] 1425 	jra 6$
      0008C7                       1426 1$:	
      008914 C7               [ 1] 1427 	push a 
      008915 00 0E 72         [ 2] 1428 	ldw x,#comp_msg
      008918 BB 00 0D         [ 4] 1429 	call puts 
      00891B FE               [ 1] 1430 	pop a 
      00891C CD A8 C0         [ 2] 1431 	ldw x, #err_msg 
      00891F CE 00 05 C6      [ 1] 1432 	clr acc16 
      008923 00               [ 1] 1433 	sll a
      008924 02 CD 95 5E      [ 1] 1434 	rlc acc16  
      008928 AE 88 E9         [ 1] 1435 	ld acc8, a 
      00892B CD A8 C0 C6      [ 2] 1436 	addw x,acc16 
      00892F 00               [ 2] 1437 	ldw x,(x)
      008930 03 5F 97         [ 4] 1438 	call puts
      008933 72 BB 00         [ 2] 1439 	ldw x,#tib
      008936 05 F6 5F         [ 4] 1440 	call puts 
      008939 97 CD            [ 1] 1441 	ld a,#CR 
      00893B 8A 4C 72         [ 4] 1442 	call putc
      00893E 0D 00 24         [ 2] 1443 	ldw x,in.w
      008941 3A CD 87         [ 4] 1444 	call spaces
      008944 18 20            [ 1] 1445 	ld a,#'^
      008946 35 02 C0         [ 4] 1446 	call putc 
      008947 AE 17 FF         [ 2] 1447 6$: ldw x,#STACK_EMPTY 
      008947 88               [ 1] 1448     ldw sp,x
      000900                       1449 warm_start:
      008948 AE 88 D9         [ 4] 1450 	call warm_init
                                   1451 ;----------------------------
                                   1452 ;   BASIC interpreter
                                   1453 ;----------------------------
      000903                       1454 cmd_line: ; user interface 
      00894B CD A8            [ 1] 1455 	ld a,#CR 
      00894D C0 84 AE         [ 4] 1456 	call putc 
      008950 87 7A            [ 1] 1457 	ld a,#'> 
      008952 72 5F 00         [ 4] 1458 	call putc
      008955 0D 48 72         [ 4] 1459 	call readln
      008958 59 00 0D C7      [ 1] 1460 	tnz count 
      00895C 00 0E            [ 1] 1461 	jreq cmd_line
      00895E 72 BB 00         [ 4] 1462 	call compile
                                   1463 ; if text begin with a line number
                                   1464 ; the compiler set count to zero    
                                   1465 ; so code is not interpreted
      008961 0D FE CD A8      [ 1] 1466 	tnz count 
      008965 C0 AE            [ 1] 1467 	jreq cmd_line
                                   1468 
                                   1469 ; if direct command 
                                   1470 ; it's ready to interpret 
                                   1471 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1472 ;; This is the interpreter loop
                                   1473 ;; for each BASIC code line. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00091F                       1475 interpreter: 
      008967 16 90 CD         [ 1] 1476 	ld a,in 
      00896A A8 C0 A6         [ 1] 1477 	cp a,count 
      00896D 0D CD            [ 1] 1478 	jrmi interp_loop
      000927                       1479 next_line:
      00896F 83 40 CE 00 01   [ 2] 1480 	btjf flags, #FRUN, cmd_line
      008974 CD A9 2D         [ 2] 1481 	ldw x,basicptr
      008977 A6 5E CD 83      [ 2] 1482 	addw x,in.w 
      00897B 40 AE 17         [ 2] 1483 	cpw x,txtend 
      00897E FF 94            [ 1] 1484 	jrpl warm_start
      008980 CF 00 04         [ 2] 1485 	ldw basicptr,x ; start of next line  
      008980 CD 86            [ 1] 1486 	ld a,(2,x)
      008982 FA 00 03         [ 1] 1487 	ld count,a 
      008983 35 03 00 01      [ 1] 1488 	mov in,#3 ; skip first 3 bytes of line 
      000944                       1489 interp_loop: 
      008983 A6 0D CD         [ 4] 1490 	call next_token
      008986 83 40            [ 1] 1491 	cp a,#TK_NONE 
      008988 A6 3E            [ 1] 1492 	jreq next_line 
      00898A CD 83            [ 1] 1493 	cp a,#TK_CMD
      00898C 40 CD            [ 1] 1494 	jrne 1$
      00898E A9               [ 4] 1495 	call (x) 
      00898F C5 72            [ 2] 1496 	jra interp_loop 
      000952                       1497 1$:	 
      008991 5D 00            [ 1] 1498 	cp a,#TK_VAR
      008993 04 27            [ 1] 1499 	jrne 2$
      008995 ED CD 85         [ 4] 1500 	call let_var  
      008998 6C 72            [ 2] 1501 	jra interp_loop 
      00095B                       1502 2$:	
      00899A 5D 00            [ 1] 1503 	cp a,#TK_ARRAY 
      00899C 04 27            [ 1] 1504 	jrne 3$
      00899E E4 12 3A         [ 4] 1505 	call let_array 
      00899F 20 E0            [ 2] 1506 	jra interp_loop
      000964                       1507 3$:	
      00899F C6 00            [ 1] 1508 	cp a,#TK_COLON 
      0089A1 02 C1            [ 1] 1509 	jreq interp_loop 
      0089A3 00 04 2B         [ 2] 1510 	jp syntax_error 
                                   1511 
                                   1512 		
                                   1513 ;--------------------------
                                   1514 ; extract next token from
                                   1515 ; token list 
                                   1516 ; basicptr -> base address 
                                   1517 ; in  -> offset in list array 
                                   1518 ; output:
                                   1519 ;   A 		token attribute
                                   1520 ;   X 		token value if there is one
                                   1521 ;----------------------------------------
      00096B                       1522 next_token:
      0089A6 1D               [ 1] 1523 	clrw x 
      0089A7 C6 00 01         [ 1] 1524 	ld a,in 
      0089A7 72 01 00         [ 1] 1525 	sub a,count ; don't replace sub by cp!  
      0089AA 24 D7            [ 1] 1526 	jrmi 0$
      0089AC CE               [ 4] 1527 	ret  ; end of BASIC line 
      000975                       1528 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089AD 00 05 72 BB 00   [ 1] 1529 	mov in.saved,in 
      0089B2 01 C3 00 1F      [ 2] 1530 	ldw y,basicptr 
      0089B6 2A C8 CF         [ 4] 1531 	ld a,([in.w],y)
      0089B9 00 05 E6 02      [ 1] 1532 	inc in  
      0089BD C7               [ 1] 1533 	tnz a 
      0089BE 00 04            [ 1] 1534 	jrmi 6$
      0089C0 35 03            [ 1] 1535 	cp a,#TK_ARRAY
      0089C2 00 02            [ 1] 1536 	jrpl 9$  ; no attribute for these
      0089C4 A1 01            [ 1] 1537 	cp a,#TK_COLON
      0089C4 CD 89            [ 1] 1538 	jreq 9$  
      000990                       1539 1$: ; 
      0089C6 EB A1            [ 1] 1540 	cp a,#TK_CHAR
      0089C8 00 27            [ 1] 1541 	jrne 2$
      0089CA DC               [ 1] 1542 	exg a,xl
      0089CB A1 80 26         [ 4] 1543 	ld a,([in.w],y)
      0089CE 03 FD 20 F2      [ 1] 1544 	inc in 
      0089D2 41               [ 1] 1545 	exg a,xl  
      0089D2 A1               [ 4] 1546 	ret
      0089D3 85 26            [ 1] 1547 2$:	cp a,#TK_QSTR 
      0089D5 05 CD            [ 1] 1548 	jrne 9$
      0089D7 92               [ 1] 1549 	ldw x,y 
      0089D8 BD 20 E9 00      [ 2] 1550 	addw x,in.w ; pointer to string 
                                   1551 ; move pointer after string 
      0089DB 91 6D 00         [ 4] 1552 3$:	tnz ([in.w],y)
      0089DB A1 06            [ 1] 1553 	jreq 8$
      0089DD 26 05 CD 92      [ 1] 1554 	inc in 
      0089E1 BA 20            [ 2] 1555 	jra 3$
      0009B2                       1556 6$: 
      0089E3 E0 B9 00 00      [ 2] 1557 	addw y,in.w 
      0089E4 90 FE            [ 2] 1558 	ldw y,(y)
      0089E4 A1 01            [ 1] 1559 	cp a,#TK_INTGR
      0089E6 27 DC            [ 1] 1560 	jrpl 7$
      0089E8 CC 88 F9 C1      [ 2] 1561 	addw y,#code_addr
      0089EB 90 FE            [ 2] 1562 	ldw y,(y) 
      0089EB 5F               [ 1] 1563 7$:	exgw x,y 
      0089EC C6 00 02 C0      [ 1] 1564 	inc in
      0089F0 00 04 2B 01      [ 1] 1565 8$:	inc in 
      0009CB                       1566 9$: 
      0089F4 81               [ 4] 1567 	ret	
                                   1568 
                                   1569 ;-----------------------------------
                                   1570 ; print a 16 bit integer 
                                   1571 ; using variable 'base' as conversion
                                   1572 ; format.
                                   1573 ; input:
                                   1574 ;   X       integer to print 
                                   1575 ;   'base'    conversion base 
                                   1576 ; output:
                                   1577 ;   none 
                                   1578 ;-----------------------------------
      0089F5                       1579 print_int:
      0089F5 55 00 02 00      [ 1] 1580 	clr acc24 
      0089F9 03 90 CE         [ 2] 1581 	ldw acc16,x 
      0089FC 00 05 91 D6 01   [ 2] 1582 	btjf acc16,#7,prti24
      008A01 72 5C 00 02      [ 1] 1583 	cpl acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1584 
                                   1585 ;------------------------------------
                                   1586 ; print integer in acc24 
                                   1587 ; input:
                                   1588 ;	acc24 		integer to print 
                                   1589 ;	'base' 		numerical base for conversion 
                                   1590 ;   'tab_width' field width 
                                   1591 ;  output:
                                   1592 ;    A          string length
                                   1593 ;------------------------------------
      0009DC                       1594 prti24:
      008A05 4D 2B 2A         [ 4] 1595     call itoa  ; conversion entier en  .asciz
      008A08 A1 06 2A         [ 4] 1596 	call right_align  
      008A0B 3F               [ 1] 1597 	push a 
      008A0C A1 01 27         [ 4] 1598 	call puts
      008A0F 3B               [ 1] 1599 	pop a 
      008A10 81               [ 4] 1600     ret	
                                   1601 
                                   1602 ;------------------------------------
                                   1603 ; convert integer in acc24 to string
                                   1604 ; input:
                                   1605 ;   'base'	conversion base 
                                   1606 ;	acc24	integer to convert
                                   1607 ; output:
                                   1608 ;   X  		pointer to first char of string
                                   1609 ;   A       string length
                                   1610 ;------------------------------------
                           000001  1611 	SIGN=1  ; integer sign 
                           000002  1612 	LEN=2 
                           000003  1613 	PSTR=3
                           000004  1614 	VSIZE=4 ;locals size
      0009E8                       1615 itoa:
      0009E8                       1616 	_vars VSIZE
      008A10 A1 03            [ 2]    1     sub sp,#VSIZE 
      008A12 26 0A            [ 1] 1617 	clr (LEN,sp) ; string length  
      008A14 41 91            [ 1] 1618 	clr (SIGN,sp)    ; sign
      008A16 D6 01 72         [ 1] 1619 	ld a,base 
      008A19 5C 00            [ 1] 1620 	cp a,#10
      008A1B 02 41            [ 1] 1621 	jrne 1$
                                   1622 	; base 10 string display with negative sign if bit 23==1
      008A1D 81 A1 02 26 29   [ 2] 1623 	btjf acc24,#7,1$
      008A22 93 72            [ 1] 1624 	cpl (SIGN,sp)
      008A24 BB 00 01         [ 4] 1625 	call neg_acc24
      0009FF                       1626 1$:
                                   1627 ; initialize string pointer 
      008A27 91 6D 01         [ 2] 1628 	ldw x,#tib 
      008A2A 27 1B 72         [ 2] 1629 	addw x,#TIB_SIZE
      008A2D 5C               [ 2] 1630 	decw x 
      008A2E 00               [ 1] 1631 	clr (x)
      000A07                       1632 itoa_loop:
      008A2F 02 20 F5         [ 1] 1633     ld a,base
      008A32 1F 03            [ 2] 1634 	ldw (PSTR,sp),x 
      008A32 72 B9 00         [ 4] 1635     call divu24_8 ; acc24/A 
      008A35 01 90            [ 2] 1636 	ldw x,(PSTR,sp)
      008A37 FE A1            [ 1] 1637     add a,#'0  ; remainder of division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A39 84 2A            [ 1] 1638     cp a,#'9+1
      008A3B 06 72            [ 1] 1639     jrmi 2$
      008A3D A9 A7            [ 1] 1640     add a,#7 
      000A19                       1641 2$:	
      008A3F 41               [ 2] 1642 	decw x
      008A40 90               [ 1] 1643     ld (x),a
      008A41 FE 51            [ 1] 1644 	inc (LEN,sp)
                                   1645 	; if acc24==0 conversion done
      008A43 72 5C 00         [ 1] 1646 	ld a,acc24
      008A46 02 72 5C         [ 1] 1647 	or a,acc16
      008A49 00 02 0D         [ 1] 1648 	or a,acc8
      008A4B 26 DF            [ 1] 1649     jrne itoa_loop
                                   1650 	;conversion done, next add '$' or '-' as required
      008A4B 81 00 0A         [ 1] 1651 	ld a,base 
      008A4C A1 10            [ 1] 1652 	cp a,#16
      008A4C 72 5F            [ 1] 1653 	jreq 8$
      008A4E 00 0C            [ 1] 1654 	ld a,(SIGN,sp)
      008A50 CF 00            [ 1] 1655     jreq 10$
      008A52 0D 72            [ 1] 1656     ld a,#'-
      008A54 0F 00            [ 2] 1657 	jra 9$ 
      008A56 0D 04            [ 1] 1658 8$: ld a,#'$ 
      008A58 72               [ 2] 1659 9$: decw x
      008A59 53               [ 1] 1660     ld (x),a
      008A5A 00 0C            [ 1] 1661 	inc (LEN,sp)
      008A5C                       1662 10$:
      008A5C CD 8A            [ 1] 1663 	ld a,(LEN,sp)
      000A3F                       1664 	_drop VSIZE
      008A5E 68 CD            [ 2]    1     addw sp,#VSIZE 
      008A60 93               [ 4] 1665 	ret
                                   1666 
                                   1667 ;-------------------------------------
                                   1668 ; divide uint24_t by uint8_t
                                   1669 ; used to convert uint24_t to string
                                   1670 ; input:
                                   1671 ;	acc24	dividend
                                   1672 ;   A 		divisor
                                   1673 ; output:
                                   1674 ;   acc24	quotient
                                   1675 ;   A		remainder
                                   1676 ;------------------------------------- 
                                   1677 ; offset  on sp of arguments and locals
                           000001  1678 	U8   = 1   ; divisor on stack
                           000001  1679 	VSIZE =1
      000A42                       1680 divu24_8:
      008A61 7A               [ 2] 1681 	pushw x ; save x
      008A62 88               [ 1] 1682 	push a 
                                   1683 	; ld dividend UU:MM bytes in X
      008A63 CD A8 C0         [ 1] 1684 	ld a, acc24
      008A66 84               [ 1] 1685 	ld xh,a
      008A67 81 00 0C         [ 1] 1686 	ld a,acc24+1
      008A68 97               [ 1] 1687 	ld xl,a
      008A68 52 04            [ 1] 1688 	ld a,(U8,SP) ; divisor
      008A6A 0F               [ 2] 1689 	div x,a ; UU:MM/U8
      008A6B 02               [ 1] 1690 	push a  ;save remainder
      008A6C 0F               [ 1] 1691 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A6D 01 C6 00         [ 1] 1692 	ld acc24,a
      008A70 0B               [ 1] 1693 	ld a,xl
      008A71 A1 0A 26         [ 1] 1694 	ld acc24+1,a
      008A74 0A               [ 1] 1695 	pop a
      008A75 72               [ 1] 1696 	ld xh,a
      008A76 0F 00 0C         [ 1] 1697 	ld a,acc24+2
      008A79 05               [ 1] 1698 	ld xl,a
      008A7A 03 01            [ 1] 1699 	ld a,(U8,sp) ; divisor
      008A7C CD               [ 2] 1700 	div x,a  ; R:LL/U8
      008A7D 8B 24            [ 1] 1701 	ld (U8,sp),a ; save remainder
      008A7F 9F               [ 1] 1702 	ld a,xl
      008A7F AE 16 90         [ 1] 1703 	ld acc24+2,a
      008A82 1C               [ 1] 1704 	pop a
      008A83 00               [ 2] 1705 	popw x
      008A84 50               [ 4] 1706 	ret
                                   1707 
                                   1708 ;--------------------------------------
                                   1709 ; unsigned multiply uint24_t by uint8_t
                                   1710 ; use to convert numerical string to uint24_t
                                   1711 ; input:
                                   1712 ;	acc24	uint24_t 
                                   1713 ;   A		uint8_t
                                   1714 ; output:
                                   1715 ;   acc24   A*acc24
                                   1716 ;-------------------------------------
                                   1717 ; local variables offset  on sp
                           000003  1718 	U8   = 3   ; A pushed on stack
                           000002  1719 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1720 	OVFH = 1  ; multiplication overflow high byte
                           000003  1721 	VSIZE = 3
      000A6A                       1722 mulu24_8:
      008A85 5A               [ 2] 1723 	pushw x    ; save X
                                   1724 	; local variables
      008A86 7F               [ 1] 1725 	push a     ; U8
      008A87 5F               [ 1] 1726 	clrw x     ; initialize overflow to 0
      008A87 C6               [ 2] 1727 	pushw x    ; multiplication overflow
                                   1728 ; multiply low byte.
      008A88 00 0B 1F         [ 1] 1729 	ld a,acc24+2
      008A8B 03               [ 1] 1730 	ld xl,a
      008A8C CD 8A            [ 1] 1731 	ld a,(U8,sp)
      008A8E C2               [ 4] 1732 	mul x,a
      008A8F 1E               [ 1] 1733 	ld a,xl
      008A90 03 AB 30         [ 1] 1734 	ld acc24+2,a
      008A93 A1               [ 1] 1735 	ld a, xh
      008A94 3A 2B            [ 1] 1736 	ld (OVFL,sp),a
                                   1737 ; multipy middle byte
      008A96 02 AB 07         [ 1] 1738 	ld a,acc24+1
      008A99 97               [ 1] 1739 	ld xl,a
      008A99 5A F7            [ 1] 1740 	ld a, (U8,sp)
      008A9B 0C               [ 4] 1741 	mul x,a
                                   1742 ; add overflow to this partial product
      008A9C 02 C6 00         [ 2] 1743 	addw x,(OVFH,sp)
      008A9F 0C               [ 1] 1744 	ld a,xl
      008AA0 CA 00 0D         [ 1] 1745 	ld acc24+1,a
      008AA3 CA               [ 1] 1746 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AA4 00 0E            [ 1] 1747 	adc a,#0
      008AA6 26 DF            [ 1] 1748 	ld (OVFH,sp),a
      008AA8 C6               [ 1] 1749 	ld a,xh
      008AA9 00 0B            [ 1] 1750 	ld (OVFL,sp),a
                                   1751 ; multiply most signficant byte	
      008AAB A1 10 27         [ 1] 1752 	ld a, acc24
      008AAE 08               [ 1] 1753 	ld xl, a
      008AAF 7B 01            [ 1] 1754 	ld a, (U8,sp)
      008AB1 27               [ 4] 1755 	mul x,a
      008AB2 0A A6 2D         [ 2] 1756 	addw x, (OVFH,sp)
      008AB5 20               [ 1] 1757 	ld a, xl
      008AB6 02 A6 24         [ 1] 1758 	ld acc24,a
      008AB9 5A F7            [ 2] 1759     addw sp,#VSIZE
      008ABB 0C               [ 2] 1760 	popw x
      008ABC 02               [ 4] 1761 	ret
                                   1762 
                                   1763 ;------------------------------------
                                   1764 ;  two's complement acc24
                                   1765 ;  input:
                                   1766 ;		acc24 variable
                                   1767 ;  output:
                                   1768 ;		acc24 variable
                                   1769 ;-------------------------------------
      008ABD                       1770 neg_acc24:
      008ABD 7B 02 5B 04      [ 1] 1771 	cpl acc24+2
      008AC1 81 53 00 0C      [ 1] 1772 	cpl acc24+1
      008AC2 72 53 00 0B      [ 1] 1773 	cpl acc24
      008AC2 89 88            [ 1] 1774 	ld a,#1
      008AC4 C6 00 0C         [ 1] 1775 	add a,acc24+2
      008AC7 95 C6 00         [ 1] 1776 	ld acc24+2,a
      008ACA 0D               [ 1] 1777 	clr a
      008ACB 97 7B 01         [ 1] 1778 	adc a,acc24+1
      008ACE 62 88 9E         [ 1] 1779 	ld acc24+1,a 
      008AD1 C7               [ 1] 1780 	clr a 
      008AD2 00 0C 9F         [ 1] 1781 	adc a,acc24 
      008AD5 C7 00 0D         [ 1] 1782 	ld acc24,a 
      008AD8 84               [ 4] 1783 	ret
                                   1784 
                                   1785 
                                   1786 
                                   1787 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1788 ;; compiler routines        ;;
                                   1789 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1790 ;------------------------------------
                                   1791 ; parse quoted string 
                                   1792 ; input:
                                   1793 ;   Y 	pointer to tib 
                                   1794 ;   X   pointer to output buffer 
                                   1795 ; output:
                                   1796 ;	buffer   parsed string
                                   1797 ;------------------------------------
                           000001  1798 	PREV = 1
                           000002  1799 	CURR =2
                           000002  1800 	VSIZE=2
      000AC7                       1801 parse_quote: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      000AC7                       1802 	_vars VSIZE 
      008AD9 95 C6            [ 2]    1     sub sp,#VSIZE 
      008ADB 00               [ 1] 1803 	clr a
      008ADC 0E 97            [ 1] 1804 1$:	ld (PREV,sp),a 
      000ACC                       1805 2$:	
      008ADE 7B 01 62         [ 4] 1806 	ld a,([in.w],y)
      008AE1 6B 01            [ 1] 1807 	jreq 6$
      008AE3 9F C7 00 0E      [ 1] 1808 	inc in 
      008AE7 84 85            [ 1] 1809 	ld (CURR,sp),a 
      008AE9 81 5C            [ 1] 1810 	ld a,#'\
      008AEA 11 01            [ 1] 1811 	cp a, (PREV,sp)
      008AEA 89 88            [ 1] 1812 	jrne 3$
      008AEC 5F 89            [ 1] 1813 	clr (PREV,sp)
      008AEE C6 00            [ 1] 1814 	ld a,(CURR,sp)
      008AF0 0E 97            [ 4] 1815 	callr convert_escape
      008AF2 7B               [ 1] 1816 	ld (x),a 
      008AF3 03               [ 2] 1817 	incw x 
      008AF4 42 9F            [ 2] 1818 	jra 2$
      000AE7                       1819 3$:
      008AF6 C7 00            [ 1] 1820 	ld a,(CURR,sp)
      008AF8 0E 9E            [ 1] 1821 	cp a,#'\'
      008AFA 6B 02            [ 1] 1822 	jreq 1$
      008AFC C6 00            [ 1] 1823 	cp a,#'"
      008AFE 0D 97            [ 1] 1824 	jreq 6$ 
      008B00 7B               [ 1] 1825 	ld (x),a 
      008B01 03               [ 2] 1826 	incw x 
      008B02 42 72            [ 2] 1827 	jra 2$
      000AF5                       1828 6$:
      008B04 FB               [ 1] 1829 	clr (x)
      008B05 01               [ 2] 1830 	incw x 
      008B06 9F C7            [ 1] 1831 	ldw y,x 
      008B08 00               [ 1] 1832 	clrw x 
      008B09 0D 4F            [ 1] 1833 	ld a,#TK_QSTR  
      000AFC                       1834 	_drop VSIZE
      008B0B A9 00            [ 2]    1     addw sp,#VSIZE 
      008B0D 6B               [ 4] 1835 	ret 
                                   1836 
                                   1837 ;---------------------------------------
                                   1838 ; called by parse_quote
                                   1839 ; subtitute escaped character 
                                   1840 ; by their ASCII value .
                                   1841 ; input:
                                   1842 ;   A  character following '\'
                                   1843 ; output:
                                   1844 ;   A  substitued char or same if not valid.
                                   1845 ;---------------------------------------
      000AFF                       1846 convert_escape:
      008B0E 01               [ 2] 1847 	pushw x 
      008B0F 9E 6B 02         [ 2] 1848 	ldw x,#escaped 
      008B12 C6               [ 1] 1849 1$:	cp a,(x)
      008B13 00 0C            [ 1] 1850 	jreq 2$
      008B15 97               [ 1] 1851 	tnz (x)
      008B16 7B 03            [ 1] 1852 	jreq 3$
      008B18 42               [ 2] 1853 	incw x 
      008B19 72 FB            [ 2] 1854 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B1B 01 9F C7         [ 2] 1855 2$: subw x,#escaped 
      008B1E 00               [ 1] 1856 	ld a,xl 
      008B1F 0C 5B            [ 1] 1857 	add a,#7
      008B21 03               [ 2] 1858 3$:	popw x 
      008B22 85               [ 4] 1859 	ret 
                                   1860 
      008B23 81 62 74 6E 76 66 72  1861 escaped: .asciz "abtnvfr"
             00
                                   1862 
                                   1863 ;-------------------------
                                   1864 ; integer parser 
                                   1865 ; input:
                                   1866 ;   X 		point to output buffer  
                                   1867 ;   Y 		point to tib 
                                   1868 ;   A 	    first digit|'$' 
                                   1869 ; output:  
                                   1870 ;   X 		integer 
                                   1871 ;   A 		TK_INTGR
                                   1872 ;   acc24   24 bits integer 
                                   1873 ;-------------------------
                           000001  1874 	BASE=1
                           000002  1875 	TCHAR=2 
                           000003  1876 	XSAVE=3
                           000004  1877 	VSIZE=4 
      008B24                       1878 parse_integer: ; { -- n }
      008B24 72               [ 2] 1879 	pushw x 	
      008B25 53 00            [ 1] 1880 	push #0 ; TCHAR
      008B27 0E 72            [ 1] 1881 	push #10 ; BASE=10
      008B29 53 00            [ 1] 1882 	cp a,#'$
      008B2B 0D 72            [ 1] 1883 	jrne 2$ 
      000B25                       1884     _drop #1
      008B2D 53 00            [ 2]    1     addw sp,##1 
      008B2F 0C A6            [ 1] 1885 	push #16  ; BASE=16
      008B31 01               [ 1] 1886 2$:	ld (x),a 
      008B32 CB               [ 2] 1887 	incw x 
      008B33 00 0E C7         [ 4] 1888 	ld a,([in.w],y)
      008B36 00 0E 4F C9      [ 1] 1889 	inc in 
      008B3A 00 0D C7         [ 4] 1890 	call to_upper 
      008B3D 00 0D            [ 1] 1891 	ld (TCHAR,sp),a 
      008B3F 4F C9 00         [ 4] 1892 	call is_digit 
      008B42 0C C7            [ 1] 1893 	jrc 2$
      008B44 00 0C            [ 1] 1894 	ld a,#16 
      008B46 81 01            [ 1] 1895 	cp a,(BASE,sp)
      008B47 26 0A            [ 1] 1896 	jrne 3$ 
      008B47 52 02            [ 1] 1897 	ld a,(TCHAR,sp)
      008B49 4F 6B            [ 1] 1898 	cp a,#'A 
      008B4B 01 04            [ 1] 1899 	jrmi 3$ 
      008B4C A1 47            [ 1] 1900 	cp a,#'G 
      008B4C 91 D6            [ 1] 1901 	jrmi 2$ 
      008B4E 01 27 24 72      [ 1] 1902 3$: dec in 	
      008B52 5C               [ 1] 1903     clr (x)
      008B53 00 02            [ 2] 1904 	ldw x,(XSAVE,sp)
      008B55 6B 02 A6         [ 4] 1905 	call atoi24
      008B58 5C 11            [ 1] 1906 	ldw y,x 
      008B5A 01 26 0A         [ 2] 1907 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B5D 0F 01            [ 1] 1908 	ld a,#TK_INTGR
      008B5F 7B 02            [ 2] 1909 	ldw (y),x 
      008B61 AD 1C F7 5C      [ 2] 1910 	addw y,#2
      000B63                       1911 	_drop VSIZE  
      008B65 20 E5            [ 2]    1     addw sp,#VSIZE 
      008B67 81               [ 4] 1912 	ret 	
                                   1913 
                                   1914 ;-------------------------
                                   1915 ; binary integer parser
                                   1916 ; build integer in acc24  
                                   1917 ; input:
                                   1918 ;   X 		point to output buffer  
                                   1919 ;   Y 		point to tib 
                                   1920 ;   A 	    '&' 
                                   1921 ; output:  
                                   1922 ;   buffer  TK_INTGR integer  
                                   1923 ;   X 		int16 
                                   1924 ;   A 		TK_INTGR
                                   1925 ;   acc24    int24 
                                   1926 ;-------------------------
                           000001  1927 	BINARY=1 ; 24 bits integer 
                           000003  1928 	VSIZE=3
      000B66                       1929 parse_binary: ; { -- n }
      008B67 7B 02            [ 1] 1930 	push #0
      008B69 A1 5C            [ 1] 1931 	push #0
      008B6B 27 DD            [ 1] 1932 	push #0
      000B6C                       1933 2$:	
      008B6D A1 22 27         [ 4] 1934 	ld a,([in.w],y)
      008B70 04 F7 5C 20      [ 1] 1935 	inc in 
      008B74 D7 30            [ 1] 1936 	cp a,#'0 
      008B75 27 06            [ 1] 1937 	jreq 3$
      008B75 7F 5C            [ 1] 1938 	cp a,#'1 
      008B77 90 93            [ 1] 1939 	jreq 3$ 
      008B79 5F A6            [ 2] 1940 	jra bin_exit 
      008B7B 02 5B            [ 1] 1941 3$: sub a,#'0 
      008B7D 02               [ 1] 1942 	rrc a
      008B7E 81 03            [ 1] 1943 	rlc (BINARY+2,sp) 
      008B7F 09 02            [ 1] 1944 	rlc (BINARY+1,sp)
      008B7F 89 AE            [ 1] 1945 	rlc (BINARY,sp) 
      008B81 8B 94            [ 2] 1946 	jra 2$  
      000B88                       1947 bin_exit:
      008B83 F1 27 06 7D      [ 1] 1948 	dec in 
      008B87 27 09            [ 1] 1949 	ldw y,x
      008B89 5C 20            [ 1] 1950 	ld a,(BINARY,sp)
      008B8B F7 1D 8B         [ 1] 1951 	ld acc24,a 
      008B8E 94 9F            [ 2] 1952 	ldw x,(BINARY+1,sp)
      008B90 AB 07 85         [ 2] 1953 	ldw acc16,x
      008B93 81 61            [ 2] 1954 	ldw (y),x 
      008B95 62 74 6E 76      [ 2] 1955 	addw y,#2  
      008B99 66 72            [ 1] 1956 	ld a,#TK_INTGR 	
      000BA0                       1957 	_drop VSIZE 
      008B9B 00 03            [ 2]    1     addw sp,#VSIZE 
      008B9C 81               [ 4] 1958 	ret
                                   1959 
                                   1960 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1961 ;  token begin with a letter,
                                   1962 ;  is keyword or variable. 	
                                   1963 ; input:
                                   1964 ;   X 		point to pad 
                                   1965 ;   Y 		point to text
                                   1966 ;   A 	    first letter  
                                   1967 ; output:
                                   1968 ;   X		exec_addr|var_addr 
                                   1969 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1970 ;   pad 	keyword|var_name  
                                   1971 ;--------------------------  
                           000001  1972 	XFIRST=1
                           000002  1973 	VSIZE=2
      000BA3                       1974 parse_keyword: 
      008B9C 89               [ 2] 1975 	pushw x 
      000BA4                       1976 kw_loop:	
      008B9D 4B 00 4B         [ 4] 1977 	call to_upper 
      008BA0 0A               [ 1] 1978 	ld (x),a 
      008BA1 A1               [ 2] 1979 	incw x 
      008BA2 24 26 04         [ 4] 1980 	ld a,([in.w],y)
      008BA5 5B 01 4B 10      [ 1] 1981 	inc in 
      008BA9 F7 5C 91         [ 4] 1982 	call is_alpha 
      008BAC D6 01            [ 1] 1983 	jrc kw_loop
      008BAE 72 5C 00 02      [ 1] 1984 	dec in   
      008BB2 CD               [ 1] 1985 1$: clr (x)
      008BB3 8E 2F            [ 2] 1986 	ldw x,(XFIRST,sp) 
      008BB5 6B 02            [ 1] 1987 	ld a,(1,x)
      008BB7 CD 85            [ 1] 1988 	jrne 2$
                                   1989 ; one letter variable name 
      008BB9 FE               [ 1] 1990 	ld a,(x) 
      008BBA 25 ED            [ 1] 1991 	sub a,#'A 
      008BBC A6               [ 1] 1992 	sll a 
      008BBD 10               [ 1] 1993 	push a 
      008BBE 11 01            [ 1] 1994 	push #0
      008BC0 26 0A 7B         [ 2] 1995 	ldw x,#vars 
      008BC3 02 A1 41         [ 2] 1996 	addw x,(1,sp) ; X=var address 
      000BCD                       1997 	_drop 2 
      008BC6 2B 04            [ 2]    1     addw sp,#2 
      008BC8 A1 47            [ 1] 1998 	ld a,#TK_VAR 
      008BCA 2B DD            [ 2] 1999 	jra 4$ 
      000BD3                       2000 2$: ; check for keyword, otherwise syntax error.
      000BD3                       2001 	_ldx_dict kword_dict ; dictionary entry point
      008BCC 72 5A 00         [ 2]    1     ldw x,#kword_dict+2
      008BCF 02 7F            [ 2] 2002 	ldw y,(XFIRST,sp) ; name to search for
      008BD1 1E 03 CD         [ 4] 2003 	call search_dict
      008BD4 8E               [ 1] 2004 	tnz a
      008BD5 3B 90            [ 1] 2005 	jrne 4$ 
      008BD7 93 CE 00         [ 2] 2006 	jp syntax_error
      000BE1                       2007 4$:	
      008BDA 0D A6            [ 2] 2008 	ldw y,(XFIRST,sp)
      008BDC 84 90            [ 1] 2009 	ld (y),a 
      008BDE FF 72            [ 2] 2010 	incw y 
      008BE0 A9 00            [ 2] 2011 	ldw (y),x
      008BE2 02 5B 04 81      [ 2] 2012 	addw y,#2  
      008BE6                       2013 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BE6 4B 00            [ 2]    1     addw sp,#VSIZE 
      008BE8 4B               [ 4] 2014 	ret  	
                                   2015 
                                   2016 
                                   2017 ;------------------------------------
                                   2018 ; scan text for next token
                                   2019 ; input: 
                                   2020 ;	X 		pointer to buffer where 
                                   2021 ;	        token id and value are copied 
                                   2022 ; use:
                                   2023 ;	Y   pointer to text in tib 
                                   2024 ; output:
                                   2025 ;   A       token attribute 
                                   2026 ;   X 		token value
                                   2027 ;   Y       updated position in output buffer   
                                   2028 ;------------------------------------
                                   2029 	; use to check special character 
                                   2030 	.macro _case c t  
                                   2031 	ld a,#c 
                                   2032 	cp a,(TCHAR,sp) 
                                   2033 	jrne t
                                   2034 	.endm 
                                   2035 
                           000001  2036 	TCHAR=1
                           000002  2037 	ATTRIB=2
                           000002  2038 	VSIZE=2
      000BF0                       2039 get_token: 
      000BF0                       2040 	_vars VSIZE
      008BE9 00 4B            [ 2]    1     sub sp,#VSIZE 
                                   2041 ;	ld a,in 
                                   2042 ;	sub a,count
                                   2043 ;   jrmi 0$
                                   2044 ;	clr a 
                                   2045 ;	ret 
      000BF2                       2046 0$: 
      008BEB 00 AE 16 90      [ 2] 2047 	ldw y,#tib    	
      008BEC A6 20            [ 1] 2048 	ld a,#SPACE
      008BEC 91 D6 01         [ 4] 2049 	call skip
      008BEF 72 5C 00 02 A1   [ 1] 2050 	mov in.saved,in 
      008BF4 30 27 06         [ 4] 2051 	ld a,([in.w],y)
      008BF7 A1 31            [ 1] 2052 	jrne 1$
      008BF9 27 02            [ 1] 2053 	ldw y,x 
      008BFB 20 0B A0         [ 2] 2054 	jp token_exit ; end of line 
      008BFE 30 46 09 03      [ 1] 2055 1$:	inc in 
      008C02 09 02 09         [ 4] 2056 	call to_upper 
      008C05 01 20            [ 1] 2057 	ld (TCHAR,sp),a 
                                   2058 ; check for quoted string
      000C13                       2059 str_tst:  	
      000C13                       2060 	_case '"' nbr_tst
      008C07 E4 22            [ 1]    1 	ld a,#'"' 
      008C08 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C08 72 5A            [ 1]    3 	jrne nbr_tst
      008C0A 00 02            [ 1] 2061 	ld a,#TK_QSTR
      008C0C 90               [ 1] 2062 	ld (x),a 
      008C0D 93               [ 2] 2063 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C0E 7B 01 C7         [ 4] 2064 	call parse_quote
      008C11 00 0C 1E         [ 2] 2065 	jp token_exit
      000C23                       2066 nbr_tst:
                                   2067 ; check for hexadecimal number 
      008C14 02 CF            [ 1] 2068 	ld a,#'$'
      008C16 00 0D            [ 1] 2069 	cp a,(TCHAR,sp) 
      008C18 90 FF            [ 1] 2070 	jreq 1$
                                   2071 ;check for binary number 
      008C1A 72 A9            [ 1] 2072 	ld a,#'&
      008C1C 00 02            [ 1] 2073 	cp a,(TCHAR,sp)
      008C1E A6 84            [ 1] 2074 	jrne 0$
      008C20 5B 03            [ 1] 2075 	ld a,#TK_INTGR
      008C22 81               [ 1] 2076 	ld (x),a 
      008C23 5C               [ 2] 2077 	incw x 
      008C23 89 0B 66         [ 4] 2078 	call parse_binary ; expect binary integer 
      008C24 CC 0D AC         [ 2] 2079 	jp token_exit 
                                   2080 ; check for decimal number 	
      008C24 CD 8E            [ 1] 2081 0$:	ld a,(TCHAR,sp)
      008C26 2F F7 5C         [ 4] 2082 	call is_digit
      008C29 91 D6            [ 1] 2083 	jrnc 3$
      008C2B 01 72            [ 1] 2084 1$:	ld a,#TK_INTGR 
      008C2D 5C               [ 1] 2085 	ld (x),a 
      008C2E 00               [ 2] 2086 	incw x 
      008C2F 02 CD            [ 1] 2087 	ld a,(TCHAR,sp)
      008C31 85 ED 25         [ 4] 2088 	call parse_integer 
      008C34 EF 72 5A         [ 2] 2089 	jp token_exit 
      000C4C                       2090 3$: 
      000C4C                       2091 	_case '(' bkslsh_tst 
      008C37 00 02            [ 1]    1 	ld a,#'(' 
      008C39 7F 1E            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3B 01 E6            [ 1]    3 	jrne bkslsh_tst
      008C3D 01 26            [ 1] 2092 	ld a,#TK_LPAREN
      008C3F 13 F6 A0         [ 2] 2093 	jp token_char   	
      000C57                       2094 bkslsh_tst: ; character token 
      000C57                       2095 	_case '\',rparnt_tst
      008C42 41 48            [ 1]    1 	ld a,#'\' 
      008C44 88 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C46 00 AE            [ 1]    3 	jrne rparnt_tst
      008C48 00 30            [ 1] 2096 	ld a,#TK_CHAR 
      008C4A 72               [ 1] 2097 	ld (x),a 
      008C4B FB               [ 2] 2098 	incw x 
      008C4C 01 5B 02         [ 4] 2099 	ld a,([in.w],y)
      008C4F A6               [ 1] 2100 	ld (x),a 
      008C50 85               [ 2] 2101 	incw x
      008C51 20 0E            [ 1] 2102 	ldw y,x 	 
      008C53 72 5C 00 01      [ 1] 2103 	inc in  
      008C53 AE               [ 1] 2104 	clrw x 
      008C54 A7               [ 1] 2105 	ld xl,a 
      008C55 3B 16            [ 1] 2106 	ld a,#TK_CHAR 
      008C57 01 CD 90         [ 2] 2107 	jp token_exit 
      000C73                       2108 rparnt_tst:		
      000C73                       2109 	_case ')' colon_tst 
      008C5A 39 4D            [ 1]    1 	ld a,#')' 
      008C5C 26 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5E CC 88            [ 1]    3 	jrne colon_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C60 F9 08            [ 1] 2110 	ld a,#TK_RPAREN 
      008C61 CC 0D A8         [ 2] 2111 	jp token_char
      000C7E                       2112 colon_tst:
      000C7E                       2113 	_case ':' comma_tst 
      008C61 16 01            [ 1]    1 	ld a,#':' 
      008C63 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C65 90 5C            [ 1]    3 	jrne comma_tst
      008C67 90 FF            [ 1] 2114 	ld a,#TK_COLON 
      008C69 72 A9 00         [ 2] 2115 	jp token_char  
      000C89                       2116 comma_tst:
      000C89                       2117 	_case COMMA sharp_tst 
      008C6C 02 5B            [ 1]    1 	ld a,#COMMA 
      008C6E 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008C70 26 05            [ 1]    3 	jrne sharp_tst
      008C70 52 02            [ 1] 2118 	ld a,#TK_COMMA
      008C72 CC 0D A8         [ 2] 2119 	jp token_char
      000C94                       2120 sharp_tst:
      000C94                       2121 	_case SHARP dash_tst 
      008C72 90 AE            [ 1]    1 	ld a,#SHARP 
      008C74 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008C76 A6 20            [ 1]    3 	jrne dash_tst
      008C78 CD 8E            [ 1] 2122 	ld a,#TK_SHARP
      008C7A A5 55 00         [ 2] 2123 	jp token_char  	 	 
      000C9F                       2124 dash_tst: 	
      000C9F                       2125 	_case '-' at_tst 
      008C7D 02 00            [ 1]    1 	ld a,#'-' 
      008C7F 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008C81 D6 01            [ 1]    3 	jrne at_tst
      008C83 26 05            [ 1] 2126 	ld a,#TK_MINUS  
      008C85 90 93 CC         [ 2] 2127 	jp token_char 
      000CAA                       2128 at_tst:
      000CAA                       2129 	_case '@' qmark_tst 
      008C88 8E 2C            [ 1]    1 	ld a,#'@' 
      008C8A 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8C 00 02            [ 1]    3 	jrne qmark_tst
      008C8E CD 8E            [ 1] 2130 	ld a,#TK_ARRAY 
      008C90 2F 6B 01         [ 2] 2131 	jp token_char
      008C93                       2132 qmark_tst:
      000CB5                       2133 	_case '?' tick_tst 
      008C93 A6 22            [ 1]    1 	ld a,#'?' 
      008C95 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C97 26 0A            [ 1]    3 	jrne tick_tst
      008C99 A6 02            [ 1] 2134 	ld a,#TK_CMD  
      008C9B F7               [ 1] 2135 	ld (x),a 
      008C9C 5C               [ 2] 2136 	incw x 
      008C9D CD 8B            [ 1] 2137 	ldw y,x 
      008C9F 47 CC 8E         [ 2] 2138 	ldw x,#PRT_IDX 
      008CA2 2C FF            [ 2] 2139 	ldw (y),x 
      008CA3 72 A9 00 02      [ 2] 2140 	addw y,#2
      008CA3 A6 24 11         [ 2] 2141 	jp token_exit
      000CCD                       2142 tick_tst: ; comment 
      000CCD                       2143 	_case TICK plus_tst 
      008CA6 01 27            [ 1]    1 	ld a,#TICK 
      008CA8 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CAA 26 11            [ 1]    3 	jrne plus_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CAC 01 26            [ 1] 2144 	ld a,#TK_CMD
      008CAE 0A               [ 1] 2145 	ld (x),a 
      008CAF A6               [ 2] 2146 	incw x
      008CB0 84 F7 5C CD      [ 2] 2147 	ldw y,#REM_IDX
      008CB4 8B               [ 2] 2148 	ldw (x),y 
      008CB5 E6 CC 8E         [ 2] 2149 	addw x,#2  
      000CDF                       2150 copy_comment:
      008CB8 2C 7B 01 CD      [ 2] 2151 	ldw y,#tib 
      008CBC 85 FE 24 0C      [ 2] 2152 	addw y,in.w
      008CC0 A6 84            [ 2] 2153 	pushw y
      008CC2 F7 5C 7B         [ 4] 2154 	call strcpy
      008CC5 01 CD 8B         [ 2] 2155     subw y,(1,sp)
      008CC8 9C CC            [ 1] 2156 	ld a,yl 
      008CCA 8E 2C 01         [ 1] 2157 	add a,in
      008CCC C7 00 01         [ 1] 2158 	ld in,a 
      008CCC A6 28            [ 2] 2159 	ldw (1,sp),x
      008CCE 11 01 26         [ 2] 2160 	addw y,(1,sp)
      008CD1 05 A6            [ 2] 2161 	incw y 
      000CFE                       2162 	_drop 2 
      008CD3 07 CC            [ 2]    1     addw sp,#2 
      008CD5 8E 28 8E         [ 2] 2163 	ldw x,#REM_IDX 
      008CD7 A6 80            [ 1] 2164 	ld a,#TK_CMD 
      008CD7 A6 5C 11         [ 2] 2165 	jp token_exit 
      000D08                       2166 plus_tst:
      000D08                       2167 	_case '+' star_tst 
      008CDA 01 26            [ 1]    1 	ld a,#'+' 
      008CDC 16 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDE 03 F7            [ 1]    3 	jrne star_tst
      008CE0 5C 91            [ 1] 2168 	ld a,#TK_PLUS  
      008CE2 D6 01 F7         [ 2] 2169 	jp token_char 
      000D13                       2170 star_tst:
      000D13                       2171 	_case '*' slash_tst 
      008CE5 5C 90            [ 1]    1 	ld a,#'*' 
      008CE7 93 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE9 5C 00            [ 1]    3 	jrne slash_tst
      008CEB 02 5F            [ 1] 2172 	ld a,#TK_MULT 
      008CED 97 A6 03         [ 2] 2173 	jp token_char 
      000D1E                       2174 slash_tst: 
      000D1E                       2175 	_case '/' prcnt_tst 
      008CF0 CC 8E            [ 1]    1 	ld a,#'/' 
      008CF2 2C 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF3 26 05            [ 1]    3 	jrne prcnt_tst
      008CF3 A6 29            [ 1] 2176 	ld a,#TK_DIV 
      008CF5 11 01 26         [ 2] 2177 	jp token_char 
      000D29                       2178 prcnt_tst:
      000D29                       2179 	_case '%' eql_tst 
      008CF8 05 A6            [ 1]    1 	ld a,#'%' 
      008CFA 08 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFC 8E 28            [ 1]    3 	jrne eql_tst
      008CFE A6 22            [ 1] 2180 	ld a,#TK_MOD
      008CFE A6 3A 11         [ 2] 2181 	jp token_char  
                                   2182 ; 1 or 2 character tokens 	
      000D34                       2183 eql_tst:
      000D34                       2184 	_case '=' gt_tst 		
      008D01 01 26            [ 1]    1 	ld a,#'=' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D03 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D05 01 CC            [ 1]    3 	jrne gt_tst
      008D07 8E 28            [ 1] 2185 	ld a,#TK_EQUAL
      008D09 CC 0D A8         [ 2] 2186 	jp token_char 
      000D3F                       2187 gt_tst:
      000D3F                       2188 	_case '>' lt_tst 
      008D09 A6 2C            [ 1]    1 	ld a,#'>' 
      008D0B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0D 26 05            [ 1]    3 	jrne lt_tst
      008D0F A6 09            [ 1] 2189 	ld a,#TK_GT 
      008D11 CC 8E            [ 1] 2190 	ld (ATTRIB,sp),a 
      008D13 28 5C 00 01      [ 1] 2191 	inc in 
      008D14 91 D6 00         [ 4] 2192 	ld a,([in.w],y)
      008D14 A6 23            [ 1] 2193 	cp a,#'=
      008D16 11 01            [ 1] 2194 	jrne 1$
      008D18 26 05            [ 1] 2195 	ld a,#TK_GE 
      008D1A A6 0A            [ 2] 2196 	jra token_char  
      008D1C CC 8E            [ 1] 2197 1$: cp a,#'<
      008D1E 28 04            [ 1] 2198 	jrne 2$
      008D1F A6 35            [ 1] 2199 	ld a,#TK_NE 
      008D1F A6 2D            [ 2] 2200 	jra token_char 
      008D21 11 01 26 05      [ 1] 2201 2$: dec in
      008D25 A6 11            [ 1] 2202 	ld a,(ATTRIB,sp)
      008D27 CC 8E            [ 2] 2203 	jra token_char 	 
      000D68                       2204 lt_tst:
      000D68                       2205 	_case '<' other
      008D29 28 3C            [ 1]    1 	ld a,#'<' 
      008D2A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2A A6 40            [ 1]    3 	jrne other
      008D2C 11 01            [ 1] 2206 	ld a,#TK_LT 
      008D2E 26 05            [ 1] 2207 	ld (ATTRIB,sp),a 
      008D30 A6 06 CC 8E      [ 1] 2208 	inc in 
      008D34 28 D6 00         [ 4] 2209 	ld a,([in.w],y)
      008D35 A1 3D            [ 1] 2210 	cp a,#'=
      008D35 A6 3F            [ 1] 2211 	jrne 1$
      008D37 11 01            [ 1] 2212 	ld a,#TK_LE 
      008D39 26 12            [ 2] 2213 	jra token_char 
      008D3B A6 80            [ 1] 2214 1$: cp a,#'>
      008D3D F7 5C            [ 1] 2215 	jrne 2$
      008D3F 90 93            [ 1] 2216 	ld a,#TK_NE 
      008D41 AE 00            [ 2] 2217 	jra token_char 
      008D43 74 90 FF 72      [ 1] 2218 2$: dec in 
      008D47 A9 00            [ 1] 2219 	ld a,(ATTRIB,sp)
      008D49 02 CC            [ 2] 2220 	jra token_char 	
      000D91                       2221 other: ; not a special character 	 
      008D4B 8E 2C            [ 1] 2222 	ld a,(TCHAR,sp)
      008D4D CD 05 6D         [ 4] 2223 	call is_alpha 
      008D4D A6 27            [ 1] 2224 	jrc 30$ 
      008D4F 11 01 26         [ 2] 2225 	jp syntax_error 
      000D9B                       2226 30$: 
      008D52 35 A6 80         [ 4] 2227 	call parse_keyword
      008D55 F7 5C 90         [ 2] 2228 	cpw x,#remark 
      008D58 AE 00            [ 1] 2229 	jrne token_exit 
      008D5A 8E FF            [ 1] 2230 	ldw y,x 
      008D5C 1C 00 02         [ 2] 2231 	jp copy_comment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D5F                       2232 token_char:
      008D5F 90               [ 1] 2233 	ld (x),a 
      008D60 AE               [ 2] 2234 	incw x
      008D61 16 90            [ 1] 2235 	ldw y,x 
      000DAC                       2236 token_exit:
      000DAC                       2237 	_drop VSIZE 
      008D63 72 B9            [ 2]    1     addw sp,#VSIZE 
      008D65 00               [ 4] 2238 	ret
                                   2239 
                                   2240 
                                   2241 ;------------------------------------
                                   2242 ; convert alpha to uppercase
                                   2243 ; input:
                                   2244 ;    a  character to convert
                                   2245 ; output:
                                   2246 ;    a  uppercase character
                                   2247 ;------------------------------------
      000DAF                       2248 to_upper::
      008D66 01 90            [ 1] 2249 	cp a,#'a
      008D68 89 CD            [ 1] 2250 	jrpl 1$
      008D6A 84               [ 4] 2251 0$:	ret
      008D6B 32 72            [ 1] 2252 1$: cp a,#'z	
      008D6D F2 01            [ 1] 2253 	jrugt 0$
      008D6F 90 9F            [ 1] 2254 	sub a,#32
      008D71 CB               [ 4] 2255 	ret
                                   2256 	
                                   2257 ;------------------------------------
                                   2258 ; convert pad content in integer
                                   2259 ; input:
                                   2260 ;    x		.asciz to convert
                                   2261 ; output:
                                   2262 ;    acc24      int24_t
                                   2263 ;------------------------------------
                                   2264 	; local variables
                           000001  2265 	SIGN=1 ; 1 byte, 
                           000002  2266 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2267 	TEMP=3 ; 1 byte, temporary storage
                           000003  2268 	VSIZE=3 ; 3 bytes reserved for local storage
      000DBB                       2269 atoi24::
      008D72 00               [ 2] 2270 	pushw x 
      000DBC                       2271 	_vars VSIZE
      008D73 02 C7            [ 2]    1     sub sp,#VSIZE 
                                   2272 	; acc24=0 
      008D75 00 02 1F 01      [ 1] 2273 	clr acc24    
      008D79 72 F9 01 90      [ 1] 2274 	clr acc16
      008D7D 5C 5B 02 AE      [ 1] 2275 	clr acc8 
      008D81 00 8E            [ 1] 2276 	clr (SIGN,sp)
      008D83 A6 80            [ 1] 2277 	ld a,#10
      008D85 CC 8E            [ 1] 2278 	ld (BASE,sp),a ; default base decimal
      008D87 2C               [ 1] 2279 	ld a,(x)
      008D88 27 47            [ 1] 2280 	jreq 9$  ; completed if 0
      008D88 A6 2B            [ 1] 2281 	cp a,#'-
      008D8A 11 01            [ 1] 2282 	jrne 1$
      008D8C 26 05            [ 1] 2283 	cpl (SIGN,sp)
      008D8E A6 10            [ 2] 2284 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D90 CC 8E            [ 1] 2285 1$: cp a,#'$
      008D92 28 06            [ 1] 2286 	jrne 3$
      008D93 A6 10            [ 1] 2287 	ld a,#16
      008D93 A6 2A            [ 1] 2288 	ld (BASE,sp),a
      008D95 11               [ 2] 2289 2$:	incw x
      008D96 01               [ 1] 2290 	ld a,(x)
      000DE5                       2291 3$:	
      008D97 26 05            [ 1] 2292 	cp a,#'a
      008D99 A6 20            [ 1] 2293 	jrmi 4$
      008D9B CC 8E            [ 1] 2294 	sub a,#32
      008D9D 28 30            [ 1] 2295 4$:	cp a,#'0
      008D9E 2B 2B            [ 1] 2296 	jrmi 9$
      008D9E A6 2F            [ 1] 2297 	sub a,#'0
      008DA0 11 01            [ 1] 2298 	cp a,#10
      008DA2 26 05            [ 1] 2299 	jrmi 5$
      008DA4 A6 21            [ 1] 2300 	sub a,#7
      008DA6 CC 8E            [ 1] 2301 	cp a,(BASE,sp)
      008DA8 28 1F            [ 1] 2302 	jrpl 9$
      008DA9 6B 03            [ 1] 2303 5$:	ld (TEMP,sp),a
      008DA9 A6 25            [ 1] 2304 	ld a,(BASE,sp)
      008DAB 11 01 26         [ 4] 2305 	call mulu24_8
      008DAE 05 A6            [ 1] 2306 	ld a,(TEMP,sp)
      008DB0 22 CC 8E         [ 1] 2307 	add a,acc24+2
      008DB3 28 00 0D         [ 1] 2308 	ld acc24+2,a
      008DB4 4F               [ 1] 2309 	clr a
      008DB4 A6 3D 11         [ 1] 2310 	adc a,acc24+1
      008DB7 01 26 05         [ 1] 2311 	ld acc24+1,a
      008DBA A6               [ 1] 2312 	clr a
      008DBB 32 CC 8E         [ 1] 2313 	adc a,acc24
      008DBE 28 00 0B         [ 1] 2314 	ld acc24,a
      008DBF 20 C9            [ 2] 2315 	jra 2$
      008DBF A6 3E            [ 1] 2316 9$:	tnz (SIGN,sp)
      008DC1 11 01            [ 1] 2317     jreq atoi_exit
      008DC3 26 23 A6         [ 4] 2318     call neg_acc24
      000E21                       2319 atoi_exit: 
      000E21                       2320 	_drop VSIZE
      008DC6 31 6B            [ 2]    1     addw sp,#VSIZE 
      008DC8 02               [ 2] 2321 	popw x ; restore x
      008DC9 72               [ 4] 2322 	ret
                                   2323 
                                   2324 
                                   2325 ;------------------------------------
                                   2326 ; skip character c in text starting from 'in'
                                   2327 ; input:
                                   2328 ;	 y 		point to text buffer
                                   2329 ;    a 		character to skip
                                   2330 ; output:  
                                   2331 ;	'in' ajusted to new position
                                   2332 ;------------------------------------
                           000001  2333 	C = 1 ; local var
      000E25                       2334 skip:
      008DCA 5C               [ 1] 2335 	push a
      008DCB 00 02 91         [ 4] 2336 1$:	ld a,([in.w],y)
      008DCE D6 01            [ 1] 2337 	jreq 2$
      008DD0 A1 3D            [ 1] 2338 	cp a,(C,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DD2 26 04            [ 1] 2339 	jrne 2$
      008DD4 A6 33 20 50      [ 1] 2340 	inc in
      008DD8 A1 3C            [ 2] 2341 	jra 1$
      000E35                       2342 2$: _drop 1 
      008DDA 26 04            [ 2]    1     addw sp,#1 
      008DDC A6               [ 4] 2343 	ret
                                   2344 	
                                   2345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2346 ;;   TINY BASIC  operators,
                                   2347 ;;   commands and functions 
                                   2348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2349 
                                   2350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2351 ;;  Arithmetic operators
                                   2352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2353 
                                   2354 ;debug support
                           000001  2355 DEBUG_PRT=1
                           000001  2356 .if DEBUG_PRT 
      000E38                       2357 printxy:
      008DDD 35 20 48         [ 1] 2358 	ld a,base 
      008DE0 72               [ 1] 2359 	push a 
      008DE1 5A               [ 2] 2360 	pushw x 
      008DE2 00 02            [ 2] 2361 	pushw y
      008DE4 7B 02 20 40      [ 1] 2362 	mov base,#16 
      008DE8 CD 09 CC         [ 4] 2363 	call print_int
      008DE8 A6 3C            [ 1] 2364 	ld a,#SPACE 
      008DEA 11 01 26         [ 4] 2365 	call putc  
      008DED 23 A6            [ 2] 2366 	ldw x,(1,sp)
      008DEF 34 6B 02         [ 4] 2367 	call print_int 
      008DF2 72 5C            [ 1] 2368 	ld a,#CR 
      008DF4 00 02 91         [ 4] 2369 	call putc 
      008DF7 D6 01            [ 2] 2370 	popw y 
      008DF9 A1               [ 2] 2371 	popw x 
      008DFA 3D               [ 1] 2372 	pop a 
      008DFB 26 04 A6         [ 1] 2373 	ld base,a 
      008DFE 36               [ 4] 2374 	ret 
                                   2375 .endif 
                                   2376 
                                   2377 
                                   2378 ;--------------------------------------
                                   2379 ;  multiply 2 uint16_t return uint32_t
                                   2380 ;  input:
                                   2381 ;     x       uint16_t 
                                   2382 ;     y       uint16_t 
                                   2383 ;  output:
                                   2384 ;     x       product bits 15..0
                                   2385 ;     y       product bits 31..16 
                                   2386 ;---------------------------------------
                           000001  2387 		U1=1  ; uint16_t 
                           000003  2388 		DBL=3 ; uint32_t
                           000006  2389 		VSIZE=6
      000E5D                       2390 umstar:
      000E5D                       2391 	_vars VSIZE 
      008DFF 20 27            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E01 A1 3E            [ 2] 2392 	ldw (U1,sp),x 
                                   2393 ;initialize bits 31..16 of 
                                   2394 ;product to zero 
      008E03 26 04            [ 1] 2395 	clr (DBL,sp)
      008E05 A6 35            [ 1] 2396 	clr (DBL+1,sp)
                                   2397 ; produc U1L*U2L 
      008E07 20 1F            [ 1] 2398 	ld a,yl 
      008E09 72               [ 4] 2399 	mul x,a 
      008E0A 5A 00            [ 2] 2400 	ldw (DBL+2,sp),x
                                   2401 ; product U1H*U2L 
      008E0C 02 7B            [ 1] 2402 	ld a,(U1,sp) ; xh 
      008E0E 02               [ 1] 2403 	ldw x,y
      008E0F 20               [ 4] 2404 	mul x,a 
      008E10 17               [ 1] 2405 	clr a 
      008E11 72 FB 04         [ 2] 2406 	addw x,(DBL+1,sp) 
      008E11 7B               [ 1] 2407 	clr a 
      008E12 01 CD            [ 1] 2408 	adc a,(DBL,sp) 
      008E14 85 ED            [ 1] 2409 	ld (DBL,sp),a ; bits 23..17 
      008E16 25 03            [ 2] 2410 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2411 ; product U1L*U2H
      008E18 CC 88            [ 1] 2412 	swapw y 
      008E1A F9               [ 1] 2413 	ldw x,y
      008E1B 7B 02            [ 1] 2414 	ld a,(U1+1,sp)
      008E1B CD               [ 4] 2415 	mul x,a
      008E1C 8C 23 A3         [ 2] 2416 	addw x,(DBL+1,sp)
      008E1F 96               [ 1] 2417 	clr a 
      008E20 7B 26            [ 1] 2418 	adc a,(DBL,sp)
      008E22 09 90            [ 1] 2419 	ld (DBL,sp),a 
      008E24 93 CC            [ 2] 2420 	ldw (DBL+1,sp),x 
                                   2421 ; product U1H*U2H 	
      008E26 8D 5F            [ 1] 2422 	ld a,(U1,sp)
      008E28 93               [ 1] 2423 	ldw x,y  
      008E28 F7               [ 4] 2424 	mul x,a 
      008E29 5C 90 93         [ 2] 2425 	addw x,(DBL,sp)
      008E2C 90 93            [ 1] 2426 	ldw y,x 
      008E2C 5B 02            [ 2] 2427 	ldw x,(DBL+2,sp)
      000E94                       2428 	_drop VSIZE 
      008E2E 81 06            [ 2]    1     addw sp,#VSIZE 
      008E2F 81               [ 4] 2429 	ret
                                   2430 
                                   2431 
                                   2432 ;-------------------------------------
                                   2433 ; multiply 2 integers
                                   2434 ; input:
                                   2435 ;  	x       n1 
                                   2436 ;   y 		n2 
                                   2437 ; output:
                                   2438 ;	X        N1*N2 bits 15..0
                                   2439 ;   Y        N1*N2 bits 31..16 
                                   2440 ;-------------------------------------
                           000001  2441 	SIGN=1
                           000001  2442 	VSIZE=1
      000E97                       2443 multiply:
      000E97                       2444 	_vars VSIZE 
      008E2F A1 61            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E31 2A 01            [ 1] 2445 	clr (SIGN,sp)
      008E33 81               [ 1] 2446 	ld a,xh 
      008E34 A1 7A            [ 1] 2447 	and a,#0x80
      008E36 22 FB            [ 1] 2448 	jrpl 1$
      008E38 A0 20            [ 1] 2449 	cpl (SIGN,sp)
      008E3A 81               [ 2] 2450 	negw x 
      008E3B                       2451 1$:	
      008E3B 89 52            [ 1] 2452 	ld a,yh
      008E3D 03 72            [ 1] 2453 	and a,#0x80  
      008E3F 5F 00            [ 1] 2454 	jrpl 2$ 
      008E41 0C 72            [ 1] 2455 	cpl (SIGN,sp)
      008E43 5F 00            [ 2] 2456 	negw y 
      000EAD                       2457 2$:	
      008E45 0D 72 5F         [ 4] 2458 	call umstar
      008E48 00 0E            [ 1] 2459 	ld a,(SIGN,sp)
      008E4A 0F 01            [ 1] 2460 	jreq 3$
      008E4C A6 0A 6B         [ 4] 2461 	call dneg 
      000EB7                       2462 3$:	
      000EB7                       2463 	_drop VSIZE 
      008E4F 02 F6            [ 2]    1     addw sp,#VSIZE 
      008E51 27               [ 4] 2464 	ret
                                   2465 
                                   2466 ;--------------------------------------
                                   2467 ; divide uint32_t/uint16_t
                                   2468 ; return:  quotient and remainder 
                                   2469 ; quotient expected to be uint16_t 
                                   2470 ; input:
                                   2471 ;   DBLDIVDND    on stack 
                                   2472 ;   X            divisor 
                                   2473 ; output:
                                   2474 ;   X            quotient 
                                   2475 ;   Y            remainder 
                                   2476 ;---------------------------------------
                           000003  2477 	VSIZE=3
      000EBA                       2478 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EBA                       2479 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2480 	; local variables 
                           000001  2481 	DIVISOR=1 
                           000003  2482 	CNTR=3 
      000EBA                       2483 udiv32_16:
      000EBA                       2484 	_vars VSIZE 
      008E52 47 A1            [ 2]    1     sub sp,#VSIZE 
      008E54 2D 26            [ 2] 2485 	ldw (DIVISOR,sp),x	; save divisor 
      008E56 04 03            [ 2] 2486 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008E58 01 20            [ 2] 2487 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008E5A 08 A1            [ 2] 2488 	tnzw y
      008E5C 24 26            [ 1] 2489 	jrne long_division 
      008E5E 06 A6            [ 2] 2490 	ldw y,(DIVISOR,sp)
      008E60 10               [ 2] 2491 	divw x,y
      000EC9                       2492 	_drop VSIZE 
      008E61 6B 02            [ 2]    1     addw sp,#VSIZE 
      008E63 5C               [ 4] 2493 	ret
      000ECC                       2494 long_division:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E64 F6               [ 1] 2495 	exgw x,y ; hi in x, lo in y 
      008E65 A6 11            [ 1] 2496 	ld a,#17 
      008E65 A1 61            [ 1] 2497 	ld (CNTR,sp),a
      000ED1                       2498 1$:
      008E67 2B 02            [ 2] 2499 	cpw x,(DIVISOR,sp)
      008E69 A0 20            [ 1] 2500 	jrmi 2$
      008E6B A1 30 2B         [ 2] 2501 	subw x,(DIVISOR,sp)
      008E6E 2B               [ 1] 2502 2$:	ccf 
      008E6F A0 30            [ 2] 2503 	rlcw y 
      008E71 A1               [ 2] 2504 	rlcw x 
      008E72 0A 2B            [ 1] 2505 	dec (CNTR,sp)
      008E74 06 A0            [ 1] 2506 	jrne 1$
      008E76 07               [ 1] 2507 	exgw x,y 
      000EE1                       2508 	_drop VSIZE 
      008E77 11 02            [ 2]    1     addw sp,#VSIZE 
      008E79 2A               [ 4] 2509 	ret
                                   2510 
                                   2511 ;-----------------------------
                                   2512 ; negate double int.
                                   2513 ; input:
                                   2514 ;   x     bits 15..0
                                   2515 ;   y     bits 31..16
                                   2516 ; output: 
                                   2517 ;   x     bits 15..0
                                   2518 ;   y     bits 31..16
                                   2519 ;-----------------------------
      000EE4                       2520 dneg:
      008E7A 1F               [ 2] 2521 	cplw x 
      008E7B 6B 03            [ 2] 2522 	cplw y 
      008E7D 7B 02 CD         [ 2] 2523 	addw x,#1 
      008E80 8A EA            [ 1] 2524 	jrnc 1$
      008E82 7B 03            [ 2] 2525 	incw y 
      008E84 CB               [ 4] 2526 1$: ret 
                                   2527 
                                   2528 
                                   2529 ;--------------------------------
                                   2530 ; sign extend single to double
                                   2531 ; input:
                                   2532 ;   x    int16_t
                                   2533 ; output:
                                   2534 ;   x    int32_t bits 15..0
                                   2535 ;   y    int32_t bits 31..16
                                   2536 ;--------------------------------
      000EEF                       2537 dbl_sign_extend:
      008E85 00 0E            [ 1] 2538 	clrw y
      008E87 C7               [ 1] 2539 	ld a,xh 
      008E88 00 0E            [ 1] 2540 	and a,#0x80 
      008E8A 4F C9            [ 1] 2541 	jreq 1$
      008E8C 00 0D            [ 2] 2542 	cplw y
      008E8E C7               [ 4] 2543 1$: ret 	
                                   2544 
                                   2545 
                                   2546 ;----------------------------------
                                   2547 ;  euclidian divide dbl/n1 
                                   2548 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2549 ; input:
                                   2550 ;    dbl    int32_t on stack 
                                   2551 ;    x 		n1   int16_t  disivor  
                                   2552 ; output:
                                   2553 ;    X      dbl/x  int16_t 
                                   2554 ;    Y      remainder int16_t 
                                   2555 ;----------------------------------
                           000008  2556 	VSIZE=8
      000EF9                       2557 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000EF9                       2558 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000EF9                       2559 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2560 	; local variables
                           000001  2561 	DBLHI=1
                           000003  2562 	DBLLO=3 
                           000005  2563 	SDIVSR=5 ; sign divisor
                           000006  2564 	SQUOT=6 ; sign dividend 
                           000007  2565 	DIVISR=7 ; divisor 
      000EF9                       2566 div32_16:
      000EF9                       2567 	_vars VSIZE 
      008E8F 00 0D            [ 2]    1     sub sp,#VSIZE 
      008E91 4F C9            [ 1] 2568 	clr (SDIVSR,sp)
      008E93 00 0C            [ 1] 2569 	clr (SQUOT,sp)
                                   2570 ; copy arguments 
      008E95 C7 00            [ 2] 2571 	ldw y,(DIVDNDHI,sp)
      008E97 0C 20            [ 2] 2572 	ldw (DBLHI,sp),y
      008E99 C9 0D            [ 2] 2573 	ldw y,(DIVDNDLO,sp)
      008E9B 01 27            [ 2] 2574 	ldw (DBLLO,sp),y 
                                   2575 ; check for 0 divisor
      008E9D 03               [ 2] 2576 	tnzw x 
      008E9E CD 8B            [ 1] 2577     jrne 0$
      008EA0 24 04            [ 1] 2578 	ld a,#ERR_DIV0 
      008EA1 CC 08 7B         [ 2] 2579 	jp tb_error 
                                   2580 ; check divisor sign 	
      008EA1 5B               [ 1] 2581 0$:	ld a,xh 
      008EA2 03 85            [ 1] 2582 	and a,#0x80 
      008EA4 81 05            [ 1] 2583 	jreq 1$
      008EA5 03 05            [ 1] 2584 	cpl (SDIVSR,sp)
      008EA5 88 91            [ 1] 2585 	cpl (SQUOT,sp)
      008EA7 D6               [ 2] 2586 	negw x
      008EA8 01 27            [ 2] 2587 1$:	ldw (DIVISR,sp),x
                                   2588 ; check dividend sign 	 
      008EAA 0A 11            [ 1] 2589  	ld a,(DBLHI,sp) 
      008EAC 01 26            [ 1] 2590 	and a,#0x80 
      008EAE 06 72            [ 1] 2591 	jreq 2$ 
      008EB0 5C 00            [ 1] 2592 	cpl (SQUOT,sp)
      008EB2 02 20            [ 2] 2593 	ldw x,(DBLLO,sp)
      008EB4 F1 5B            [ 2] 2594 	ldw y,(DBLHI,sp)
      008EB6 01 81 E4         [ 4] 2595 	call dneg 
      008EB8 1F 03            [ 2] 2596 	ldw (DBLLO,sp),x 
      008EB8 C6 00            [ 2] 2597 	ldw (DBLHI,sp),y 
      008EBA 0B 88            [ 2] 2598 2$:	ldw x,(DIVISR,sp)
      008EBC 89 90 89         [ 4] 2599 	call udiv32_16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EBF 35 10            [ 2] 2600 	tnzw y 
      008EC1 00 0B            [ 1] 2601 	jreq 3$ 
                                   2602 ; x=quotient 
                                   2603 ; y=remainder 
                                   2604 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008EC3 CD 8A            [ 1] 2605 	ld a,(SQUOT,sp)
      008EC5 4C A6            [ 1] 2606 	xor a,(SDIVSR,sp)
      008EC7 20 CD            [ 1] 2607 	jreq 3$
      008EC9 83               [ 2] 2608 	incw x 
      008ECA 40 1E 01 CD      [ 2] 2609 	ldw acc16,y 
      008ECE 8A 4C            [ 2] 2610 	ldw y,(DIVISR,sp)
      008ED0 A6 0D CD 83      [ 2] 2611 	subw y,acc16
                                   2612 ; sign quotient
      008ED4 40 90            [ 1] 2613 3$:	ld a,(SQUOT,sp)
      008ED6 85 85            [ 1] 2614 	jreq 4$
      008ED8 84               [ 2] 2615 	negw x 
      000F4D                       2616 4$:	
      000F4D                       2617 	_drop VSIZE 
      008ED9 C7 00            [ 2]    1     addw sp,#VSIZE 
      008EDB 0B               [ 4] 2618 	ret 
                                   2619 
                                   2620 
                                   2621 
                                   2622 ;----------------------------------
                                   2623 ; division x/y 
                                   2624 ; input:
                                   2625 ;    X       dividend
                                   2626 ;    Y       divisor 
                                   2627 ; output:
                                   2628 ;    X       quotient
                                   2629 ;    Y       remainder 
                                   2630 ;-----------------------------------
                           000004  2631 	VSIZE=4 
                                   2632 	; local variables 
                           000001  2633 	DBLHI=1
                           000003  2634 	DBLLO=3
      000F50                       2635 divide: 
      000F50                       2636 	_vars VSIZE 
      008EDC 81 04            [ 2]    1     sub sp,#VSIZE 
      008EDD 90 CF 00 0C      [ 2] 2637 	ldw acc16,y
      008EDD 52 06 1F         [ 4] 2638 	call dbl_sign_extend
      008EE0 01 0F            [ 2] 2639 	ldw (DBLLO,sp),x 
      008EE2 03 0F            [ 2] 2640 	ldw (DBLHI,sp),y 
      008EE4 04 90 9F         [ 2] 2641 	ldw x,acc16 
      008EE7 42 1F 05         [ 4] 2642 	call div32_16 
      000F63                       2643 	_drop VSIZE 
      008EEA 7B 01            [ 2]    1     addw sp,#VSIZE 
      008EEC 93               [ 4] 2644 	ret
                                   2645 
                                   2646 
                                   2647 ;----------------------------------
                                   2648 ;  remainder resulting from euclidian 
                                   2649 ;  division of x/y 
                                   2650 ; input:
                                   2651 ;   x   	dividend int16_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2652 ;   y 		divisor int16_t
                                   2653 ; output:
                                   2654 ;   X       n1%n2 
                                   2655 ;----------------------------------
      000F66                       2656 modulo:
      008EED 42 4F 72         [ 4] 2657 	call divide
      008EF0 FB               [ 1] 2658 	ldw x,y 
      008EF1 04               [ 4] 2659 	ret 
                                   2660 
                                   2661 ;----------------------------------
                                   2662 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2663 ; return expr1*expr2/expr3 
                                   2664 ; product result is int32_t and 
                                   2665 ; divisiont is int32_t/int16_t
                                   2666 ;----------------------------------
                           000004  2667 	DBL_SIZE=4 
      000F6B                       2668 muldiv:
      008EF2 4F 19 03         [ 4] 2669 	call func_args 
      008EF5 6B 03            [ 1] 2670 	cp a,#3 
      008EF7 1F 04            [ 1] 2671 	jreq 1$
      008EF9 90 5E 93         [ 2] 2672 	jp syntax_error
      000F75                       2673 1$: 
      008EFC 7B 02            [ 2] 2674 	ldw x,(5,sp) ; expr1
      008EFE 42 72            [ 2] 2675 	ldw y,(3,sp) ; expr2
      008F00 FB 04 4F         [ 4] 2676 	call multiply 
      008F03 19 03            [ 2] 2677 	ldw (5,sp),x  ;int32_t 15..0
      008F05 6B 03            [ 2] 2678 	ldw (3,sp),y  ;int32_t 31..16
      008F07 1F               [ 2] 2679 	popw x        ; expr3 
      008F08 04 7B 01         [ 4] 2680 	call div32_16 ; int32_t/expr3 
      000F84                       2681 	_drop DBL_SIZE
      008F0B 93 42            [ 2]    1     addw sp,#DBL_SIZE 
      008F0D 72               [ 4] 2682 	ret 
                                   2683 
                                   2684 
                                   2685 ;----------------------------------
                                   2686 ; search in kword_dict name
                                   2687 ; from its execution address 
                                   2688 ; input:
                                   2689 ;   X       	cmd_index 
                                   2690 ; output:
                                   2691 ;   X 			cstr*  | 0 
                                   2692 ;--------------------------------
                           000001  2693 	CMDX=1 
                           000003  2694 	LINK=3 
                           000004  2695 	VSIZE=4
      000F87                       2696 cmd_name:
      000F87                       2697 	_vars VSIZE 
      008F0E FB 03            [ 2]    1     sub sp,#VSIZE 
      008F10 90 93 1E 05      [ 1] 2698 	clr acc16 
      008F14 5B 06            [ 2] 2699 	ldw (CMDX,sp),x  
      008F16 81 26 B9         [ 2] 2700 	ldw x,#kword_dict	
      008F17 1F 03            [ 2] 2701 1$:	ldw (LINK,sp),x
      008F17 52 01            [ 1] 2702 	ld a,(2,x)
      008F19 0F 01            [ 1] 2703 	and a,#15 
      008F1B 9E A4 80         [ 1] 2704 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F1E 2A 03 03         [ 2] 2705 	addw x,#3
      008F21 01 50 00 0C      [ 2] 2706 	addw x,acc16
      008F23 FE               [ 2] 2707 	ldw x,(x) ; command index  
      008F23 90 9E            [ 2] 2708 	cpw x,(CMDX,sp)
      008F25 A4 80            [ 1] 2709 	jreq 2$
      008F27 2A 04            [ 2] 2710 	ldw x,(LINK,sp)
      008F29 03               [ 2] 2711 	ldw x,(x) 
      008F2A 01 90 50         [ 2] 2712 	subw x,#2  
      008F2D 26 E3            [ 1] 2713 	jrne 1$
      008F2D CD 8E            [ 2] 2714 	jra 9$
      008F2F DD 7B            [ 2] 2715 2$: ldw x,(LINK,sp)
      008F31 01 27 03         [ 2] 2716 	addw x,#2 	
      000FB6                       2717 9$:	_drop VSIZE
      008F34 CD 8F            [ 2]    1     addw sp,#VSIZE 
      008F36 64               [ 4] 2718 	ret
                                   2719 
                                   2720 
                                   2721 ;---------------------------------
                                   2722 ; dictionary search 
                                   2723 ; input:
                                   2724 ;	X 		dictionary entry point, name field  
                                   2725 ;   y		.asciz name to search 
                                   2726 ; output:
                                   2727 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2728 ;  X		cmd_index ; execution address | 0 
                                   2729 ;---------------------------------
                           000001  2730 	NLEN=1 ; cmd length 
                           000002  2731 	XSAVE=2
                           000004  2732 	YSAVE=4
                           000005  2733 	VSIZE=5 
      008F37                       2734 search_dict:
      000FB9                       2735 	_vars VSIZE 
      008F37 5B 01            [ 2]    1     sub sp,#VSIZE 
                                   2736 
      008F39 81 04            [ 2] 2737 	ldw (YSAVE,sp),y 
      008F3A                       2738 search_next:
      008F3A 52 03            [ 2] 2739 	ldw (XSAVE,sp),x 
                                   2740 ; get name length in dictionary	
      008F3C 1F               [ 1] 2741 	ld a,(x)
      008F3D 01 1E            [ 1] 2742 	and a,#0xf 
      008F3F 08 16            [ 1] 2743 	ld (NLEN,sp),a  
      008F41 06 90            [ 2] 2744 	ldw y,(YSAVE,sp) ; name pointer 
      008F43 5D               [ 2] 2745 	incw x 
      000FC7                       2746 cp_loop:
      008F44 26 06            [ 1] 2747 	ld a,(y)
      008F46 16 01            [ 1] 2748 	jreq str_match 
      008F48 65 5B            [ 1] 2749 	tnz (NLEN,sp)
      008F4A 03 81            [ 1] 2750 	jreq no_match  
      008F4C F1               [ 1] 2751 	cp a,(x)
      008F4C 51 A6            [ 1] 2752 	jrne no_match 
      008F4E 11 6B            [ 2] 2753 	incw y 
      008F50 03               [ 2] 2754 	incw x
      008F51 0A 01            [ 1] 2755 	dec (NLEN,sp)
      008F51 13 01            [ 2] 2756 	jra cp_loop 
      000FD9                       2757 no_match:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F53 2B 03            [ 2] 2758 	ldw x,(XSAVE,sp) 
      008F55 72 F0 01         [ 2] 2759 	subw x,#2 ; move X to link field
      008F58 8C 90            [ 1] 2760 	push #TK_NONE 
      008F5A 59               [ 2] 2761 	ldw x,(x) ; next word link 
      008F5B 59               [ 1] 2762 	pop a ; TK_NONE 
      008F5C 0A 03            [ 1] 2763 	jreq search_exit  ; not found  
                                   2764 ;try next 
      008F5E 26 F1            [ 2] 2765 	jra search_next
      000FE6                       2766 str_match:
      008F60 51 5B            [ 2] 2767 	ldw x,(XSAVE,sp)
      008F62 03               [ 1] 2768 	ld a,(X)
      008F63 81 01            [ 1] 2769 	ld (NLEN,sp),a ; needed to test keyword type  
      008F64 A4 0F            [ 1] 2770 	and a,#0xf 
                                   2771 ; move x to procedure address field 	
      008F64 53               [ 1] 2772 	inc a 
      008F65 90 53 1C         [ 1] 2773 	ld acc8,a 
      008F68 00 01 24 02      [ 1] 2774 	clr acc16 
      008F6C 90 5C 81 0C      [ 2] 2775 	addw x,acc16 
      008F6F FE               [ 2] 2776 	ldw x,(x) ; routine index  
                                   2777 ;determine keyword type bits 7:6 
      008F6F 90 5F            [ 1] 2778 	ld a,(NLEN,sp)
      008F71 9E               [ 1] 2779 	swap a 
      008F72 A4 80            [ 1] 2780 	and a,#0xc
      008F74 27               [ 1] 2781 	srl a
      008F75 02               [ 1] 2782 	srl a 
      008F76 90 53            [ 1] 2783 	add a,#128
      001003                       2784 search_exit: 
      001003                       2785 	_drop VSIZE 	 
      008F78 81 05            [ 2]    1     addw sp,#VSIZE 
      008F79 81               [ 4] 2786 	ret 
                                   2787 
                                   2788 ;---------------------
                                   2789 ; check if next token
                                   2790 ;  is of expected type 
                                   2791 ; input:
                                   2792 ;   A 		 expected token attribute
                                   2793 ;  ouput:
                                   2794 ;   none     if fail call syntax_error 
                                   2795 ;--------------------
      001006                       2796 expect:
      008F79 52               [ 1] 2797 	push a 
      008F7A 08 0F 05         [ 4] 2798 	call next_token 
      008F7D 0F 06            [ 1] 2799 	cp a,(1,sp)
      008F7F 16 0B            [ 1] 2800 	jreq 1$
      008F81 17 01 16         [ 2] 2801 	jp syntax_error
      008F84 0D               [ 1] 2802 1$: pop a 
      008F85 17               [ 4] 2803 	ret 
                                   2804 
                                   2805 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2806 ; parse arguments list 
                                   2807 ; between ()
                                   2808 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001013                       2809 func_args:
      008F86 03 5D            [ 1] 2810 	ld a,#TK_LPAREN 
      008F88 26 05 A6         [ 4] 2811 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2812 ; expected to continue in arg_list 
                                   2813 ; caller must check for TK_RPAREN 
                                   2814 
                                   2815 ;-------------------------------
                                   2816 ; parse embedded BASIC routines 
                                   2817 ; arguments list.
                                   2818 ; arg_list::=  rel[','rel]*
                                   2819 ; all arguments are of integer type
                                   2820 ; and pushed on stack 
                                   2821 ; input:
                                   2822 ;   none
                                   2823 ; output:
                                   2824 ;   stack{n}   arguments pushed on stack
                                   2825 ;   A 	number of arguments pushed on stack  
                                   2826 ;--------------------------------
      001018                       2827 arg_list:
      008F8B 04 CC            [ 1] 2828 	push #0  
      008F8D 88 FB 9E         [ 4] 2829 1$: call relation
      008F90 A4 80            [ 1] 2830 	cp a,#TK_NONE 
      008F92 27 05            [ 1] 2831 	jreq 5$
      008F94 03 05            [ 1] 2832 	cp a,#TK_INTGR
      008F96 03 06            [ 1] 2833 	jrne 4$
      001025                       2834 3$: 
                                   2835 ; swap return address with argument
      008F98 50               [ 1] 2836 	pop a ; arg_count
      008F99 1F 07            [ 2] 2837 	popw y ; return address 
      008F9B 7B               [ 2] 2838 	pushw x ; new argument 
      008F9C 01 A4            [ 2] 2839 	pushw y 
      008F9E 80               [ 1] 2840     inc a
      008F9F 27               [ 1] 2841 	push a 
      008FA0 0D 03 06         [ 4] 2842 	call next_token 
      008FA3 1E 03            [ 1] 2843 	cp a,#TK_COMMA 
      008FA5 16 01            [ 1] 2844 	jreq 1$ 
      008FA7 CD 8F            [ 1] 2845 	cp a,#TK_NONE 
      008FA9 64 1F            [ 1] 2846 	jreq 5$ 
      008FAB 03 17            [ 1] 2847 4$:	cp a,#TK_RPAREN 
      008FAD 01 1E            [ 1] 2848 	jreq 5$
      00103C                       2849 	_unget_token 
      008FAF 07 CD 8F 3A 90   [ 1]    1     mov in,in.saved
      008FB4 5D               [ 1] 2850 5$:	pop a  
      008FB5 27               [ 4] 2851 	ret 
                                   2852 
                                   2853 ;--------------------------------
                                   2854 ;   BASIC commnands 
                                   2855 ;--------------------------------
                                   2856 
                                   2857 ;--------------------------------
                                   2858 ;  arithmetic and relational 
                                   2859 ;  routines
                                   2860 ;  operators precedence
                                   2861 ;  highest to lowest
                                   2862 ;  operators on same row have 
                                   2863 ;  same precedence and are executed
                                   2864 ;  from left to right.
                                   2865 ;	'*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2866 ;   '-','+'
                                   2867 ;   '=','>','<','>=','<=','<>','><'
                                   2868 ;   '<>' and '><' are equivalent for not equal.
                                   2869 ;--------------------------------
                                   2870 
                                   2871 ;---------------------
                                   2872 ; return array element
                                   2873 ; address from @(expr)
                                   2874 ; input:
                                   2875 ;   A 		TK_ARRAY
                                   2876 ; output:
                                   2877 ;   A 		TK_INTGR
                                   2878 ;	X 		element address 
                                   2879 ;----------------------
      001043                       2880 get_array_element:
      008FB6 11 7B 06         [ 4] 2881 	call func_args 
      008FB9 18 05            [ 1] 2882 	cp a,#1
      008FBB 27 0B            [ 1] 2883 	jreq 1$
      008FBD 5C 90 CF         [ 2] 2884 	jp syntax_error
      008FC0 00               [ 2] 2885 1$: popw x 
                                   2886 	; check for bounds 
      008FC1 0D 16 07         [ 2] 2887 	cpw x,array_size 
      008FC4 72 B2            [ 2] 2888 	jrule 3$
                                   2889 ; bounds {1..array_size}	
      008FC6 00 0D            [ 1] 2890 2$: ld a,#ERR_BAD_VALUE 
      008FC8 7B 06 27         [ 2] 2891 	jp tb_error 
      008FCB 01               [ 2] 2892 3$: tnzw  x
      008FCC 50 F8            [ 1] 2893 	jreq 2$ 
      008FCD 58               [ 2] 2894 	sllw x 
      008FCD 5B               [ 2] 2895 	pushw x 
      008FCE 08 81 90         [ 2] 2896 	ldw x,#tib
      008FD0 72 F0 01         [ 2] 2897 	subw x,(1,sp)
      001063                       2898 	_drop 2   
      008FD0 52 04            [ 2]    1     addw sp,#2 
      008FD2 90 CF            [ 1] 2899 	ld a,#TK_INTGR
      008FD4 00               [ 4] 2900 	ret 
                                   2901 
                                   2902 
                                   2903 ;***********************************
                                   2904 ;   expression parse,execute 
                                   2905 ;***********************************
                                   2906 ;-----------------------------------
                                   2907 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2908 ;			 integer | function |
                                   2909 ;			 '('relation')' 
                                   2910 ; output:
                                   2911 ;   A    token attribute 
                                   2912 ;   X 	 integer
                                   2913 ; ---------------------------------
                           000001  2914 	NEG=1
                           000001  2915 	VSIZE=1
      001068                       2916 factor:
      001068                       2917 	_vars VSIZE 
      008FD5 0D CD            [ 2]    1     sub sp,#VSIZE 
      008FD7 8F 6F 1F         [ 4] 2918 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FDA 03 17            [ 1] 2919 	cp a,#CMD_END 
      008FDC 01 CE            [ 1] 2920 	jrult 20$
      008FDE 00 0D            [ 1] 2921 1$:	ld (NEG,sp),a 
      008FE0 CD 8F            [ 1] 2922 	and a,#TK_GRP_MASK
      008FE2 79 5B            [ 1] 2923 	cp a,#TK_GRP_ADD 
      008FE4 04 81            [ 1] 2924 	jreq 2$
      008FE6 7B 01            [ 1] 2925 	ld a,(NEG,sp)
      008FE6 CD 8F            [ 2] 2926 	jra 4$  
      00107D                       2927 2$:	
      008FE8 D0 93 81         [ 4] 2928 	call next_token 
      008FEB                       2929 4$:	
      008FEB CD 90            [ 1] 2930 	cp a,#TK_IFUNC 
      008FED 93 A1            [ 1] 2931 	jrne 5$ 
      008FEF 03               [ 4] 2932 	call (x) 
      008FF0 27 03            [ 2] 2933 	jra 18$ 
      001087                       2934 5$:
      008FF2 CC 88            [ 1] 2935 	cp a,#TK_INTGR
      008FF4 F9 02            [ 1] 2936 	jrne 6$
      008FF5 20 29            [ 2] 2937 	jra 18$
      00108D                       2938 6$:
      008FF5 1E 05            [ 1] 2939 	cp a,#TK_ARRAY
      008FF7 16 03            [ 1] 2940 	jrne 10$
      008FF9 CD 8F 17         [ 4] 2941 	call get_array_element
      008FFC 1F               [ 2] 2942 	ldw x,(x)
      008FFD 05 17            [ 2] 2943 	jra 18$ 
      001097                       2944 10$:
      008FFF 03 85            [ 1] 2945 	cp a,#TK_VAR 
      009001 CD 8F            [ 1] 2946 	jrne 12$
      009003 79               [ 2] 2947 	ldw x,(x)
      009004 5B 04            [ 2] 2948 	jra 18$
      00109E                       2949 12$:			
      009006 81 07            [ 1] 2950 	cp a,#TK_LPAREN
      009007 26 0C            [ 1] 2951 	jrne 16$
      009007 52 04 72         [ 4] 2952 	call relation
      00900A 5F               [ 2] 2953 	pushw x 
      00900B 00 0D            [ 1] 2954 	ld a,#TK_RPAREN 
      00900D 1F 01 AE         [ 4] 2955 	call expect
      009010 A7               [ 2] 2956 	popw x 
      009011 39 1F            [ 2] 2957 	jra 18$	
      0010AE                       2958 16$:
      0010AE                       2959 	_unget_token
      009013 03 E6 02 A4 0F   [ 1]    1     mov in,in.saved
      009018 C7               [ 1] 2960 	clr a 
      009019 00 0E            [ 2] 2961 	jra 20$ 
      0010B6                       2962 18$: 
      00901B 1C 00            [ 1] 2963 	ld a,#TK_MINUS 
      00901D 03 72            [ 1] 2964 	cp a,(NEG,sp)
      00901F BB 00            [ 1] 2965 	jrne 19$
      009021 0D               [ 2] 2966 	negw x
      0010BD                       2967 19$:
      009022 FE 13            [ 1] 2968 	ld a,#TK_INTGR
      0010BF                       2969 20$:
      0010BF                       2970 	_drop VSIZE
      009024 01 27            [ 2]    1     addw sp,#VSIZE 
      009026 0A               [ 4] 2971 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2972 
                                   2973 ;-----------------------------------
                                   2974 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2975 ; output:
                                   2976 ;   A    	token attribute 
                                   2977 ;	X		integer
                                   2978 ;-----------------------------------
                           000001  2979 	N1=1   ; int16_t
                           000003  2980 	MULOP=3
                           000003  2981 	VSIZE=3
      0010C2                       2982 term:
      0010C2                       2983 	_vars VSIZE
      009027 1E 03            [ 2]    1     sub sp,#VSIZE 
      009029 FE 1D 00         [ 4] 2984 	call factor
      00902C 02 26            [ 1] 2985 	cp a,#CMD_END
      00902E E3 20            [ 1] 2986 	jrult term_exit
      0010CB                       2987 term01:	 ; check for  operator 
      009030 05 1E            [ 2] 2988 	ldw (N1,sp),x  ; save first factor 
      009032 03 1C 00         [ 4] 2989 	call next_token
      009035 02 5B            [ 1] 2990 	cp a,#CMD_END
      009037 04 81            [ 1] 2991 	jrult 9$
      009039 6B 03            [ 1] 2992 0$:	ld (MULOP,sp),a
      009039 52 05            [ 1] 2993 	and a,#TK_GRP_MASK
      00903B 17 04            [ 1] 2994 	cp a,#TK_GRP_MULT
      00903D 27 07            [ 1] 2995 	jreq 1$
      0010DC                       2996 	_unget_token 
      00903D 1F 02 F6 A4 0F   [ 1]    1     mov in,in.saved
      009042 6B 01            [ 2] 2997 	jra 9$
      0010E3                       2998 1$:	; got *|/|%
      009044 16 04 5C         [ 4] 2999 	call factor
      009047 A1 84            [ 1] 3000 	cp a,#TK_INTGR
      009047 90 F6            [ 1] 3001 	jreq 2$ 
      009049 27 1B 0D         [ 2] 3002 	jp syntax_error
      00904C 01 27            [ 1] 3003 2$:	ldw y,x 
      00904E 0A F1            [ 2] 3004 	ldw x,(N1,sp)
      009050 26 07            [ 1] 3005 	ld a,(MULOP,sp) 
      009052 90 5C            [ 1] 3006 	cp a,#TK_MULT 
      009054 5C 0A            [ 1] 3007 	jrne 3$
      009056 01 20 EE         [ 4] 3008 	call multiply 
      009059 20 CF            [ 2] 3009 	jra term01
      009059 1E 02            [ 1] 3010 3$: cp a,#TK_DIV 
      00905B 1D 00            [ 1] 3011 	jrne 4$ 
      00905D 02 4B 00         [ 4] 3012 	call divide 
      009060 FE 84            [ 2] 3013 	jra term01 
      009062 27 1F 20         [ 4] 3014 4$: call modulo
      009065 D7 C1            [ 2] 3015 	jra term01 
      009066 1E 01            [ 2] 3016 9$: ldw x,(N1,sp)
      009066 1E 02            [ 1] 3017 	ld a,#TK_INTGR 	
      00110E                       3018 term_exit:
      00110E                       3019 	_drop VSIZE 
      009068 F6 6B            [ 2]    1     addw sp,#VSIZE 
      00906A 01               [ 4] 3020 	ret 
                                   3021 
                                   3022 ;-------------------------------
                                   3023 ;  expr ::= term [['+'|'-'] term]*
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3024 ;  result range {-32768..32767}
                                   3025 ;  output:
                                   3026 ;   A    token attribute 
                                   3027 ;   X	 integer   
                                   3028 ;-------------------------------
                           000001  3029 	N1=1 
                           000003  3030 	OP=3 
                           000003  3031 	VSIZE=3 
      001111                       3032 expression:
      001111                       3033 	_vars VSIZE 
      00906B A4 0F            [ 2]    1     sub sp,#VSIZE 
      00906D 4C C7 00         [ 4] 3034 	call term
      009070 0E 72            [ 1] 3035 	cp a,#CMD_END 
      009072 5F 00            [ 1] 3036 	jrult expr_exit 
      009074 0D 72            [ 2] 3037 0$:	ldw (N1,sp),x 
      009076 BB 00 0D         [ 4] 3038 	call next_token
      009079 FE 7B            [ 1] 3039 	cp a,#CMD_END 
      00907B 01 4E            [ 1] 3040 	jrult 9$ 
      00907D A4 0C            [ 1] 3041 1$:	ld (OP,sp),a  
      00907F 44 44            [ 1] 3042 	and a,#TK_GRP_MASK
      009081 AB 80            [ 1] 3043 	cp a,#TK_GRP_ADD 
      009083 27 07            [ 1] 3044 	jreq 2$ 
      00112B                       3045 	_unget_token
      009083 5B 05 81 00 01   [ 1]    1     mov in,in.saved
      009086 20 21            [ 2] 3046 	jra 9$
      001132                       3047 2$: 
      009086 88 CD 89         [ 4] 3048 	call term
      009089 EB 11            [ 1] 3049 	cp a,#TK_INTGR 
      00908B 01 27            [ 1] 3050 	jreq 3$
      00908D 03 CC 88         [ 2] 3051 	jp syntax_error
      009090 F9 84 81         [ 2] 3052 3$:	ldw acc16,x 
      009093 1E 01            [ 2] 3053 	ldw x,(N1,sp)
      009093 A6 07            [ 1] 3054 	ld a,(OP,sp)
      009095 CD 90            [ 1] 3055 	cp a,#TK_PLUS 
      009097 86 06            [ 1] 3056 	jrne 4$
      009098 72 BB 00 0C      [ 2] 3057 	addw x,acc16
      009098 4B 00            [ 2] 3058 	jra 0$ 
      00909A CD 91 DA A1      [ 2] 3059 4$:	subw x,acc16
      00909E 00 27            [ 2] 3060 	jra 0$
      0090A0 20 A1            [ 2] 3061 9$: ldw x,(N1,sp)
      0090A2 84 26            [ 1] 3062 	ld a,#TK_INTGR	
      001157                       3063 expr_exit:
      001157                       3064 	_drop VSIZE 
      0090A4 13 03            [ 2]    1     addw sp,#VSIZE 
      0090A5 81               [ 4] 3065 	ret 
                                   3066 
                                   3067 ;---------------------------------------------
                                   3068 ; rel ::= expr rel_op expr
                                   3069 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3070 ;  relation return  integer , zero is false 
                                   3071 ;  output:
                                   3072 ;    A 		token attribute  
                                   3073 ;	 X		integer 
                                   3074 ;---------------------------------------------
                           000001  3075 	N1=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000003  3076 	RELOP=3
                           000003  3077 	VSIZE=3 
      00115A                       3078 relation: 
      00115A                       3079 	_vars VSIZE
      0090A5 84 90            [ 2]    1     sub sp,#VSIZE 
      0090A7 85 89 90         [ 4] 3080 	call expression
      0090AA 89 4C            [ 1] 3081 	cp a,#CMD_END  
      0090AC 88 CD            [ 1] 3082 	jrult rel_exit 
                                   3083 	; expect rel_op or leave 
      0090AE 89 EB            [ 2] 3084 	ldw (N1,sp),x 
      0090B0 A1 09 27         [ 4] 3085 	call next_token 
      0090B3 E6 A1            [ 1] 3086 	cp a,#CMD_END 
      0090B5 00 27            [ 1] 3087 	jrult 9$
      00116C                       3088 1$:	
      0090B7 09 A1            [ 1] 3089 	ld (RELOP,sp),a 
      0090B9 08 27            [ 1] 3090 	and a,#TK_GRP_MASK
      0090BB 05 55            [ 1] 3091 	cp a,#TK_GRP_RELOP 
      0090BD 00 03            [ 1] 3092 	jreq 2$
      001174                       3093 	_unget_token  
      0090BF 00 02 84 81 01   [ 1]    1     mov in,in.saved
      0090C3 20 33            [ 2] 3094 	jra 9$
      00117B                       3095 2$:	; expect another expression or error 
      0090C3 CD 90 93         [ 4] 3096 	call expression
      0090C6 A1 01            [ 1] 3097 	cp a,#TK_INTGR 
      0090C8 27 03            [ 1] 3098 	jreq 3$
      0090CA CC 88 F9         [ 2] 3099 	jp syntax_error 
      0090CD 85 C3 00         [ 2] 3100 3$:	ldw acc16,x 
      0090D0 22 23            [ 2] 3101 	ldw x,(N1,sp) 
      0090D2 05 A6 0A CC      [ 2] 3102 	subw x,acc16
      0090D6 88 FB            [ 1] 3103 	jrne 4$
      0090D8 5D 27 F8 58      [ 1] 3104 	mov acc8,#2 ; n1==n2
      0090DC 89 AE            [ 2] 3105 	jra 6$ 
      001196                       3106 4$: 
      0090DE 16 90            [ 1] 3107 	jrsgt 5$  
      0090E0 72 F0 01 5B      [ 1] 3108 	mov acc8,#4 ; n1<2 
      0090E4 02 A6            [ 2] 3109 	jra 6$
      00119E                       3110 5$:
      0090E6 84 81 00 0D      [ 1] 3111 	mov acc8,#1 ; n1>n2 
      0090E8                       3112 6$:
      0090E8 52               [ 1] 3113 	clrw x 
      0090E9 01 CD 89         [ 1] 3114 	ld a, acc8  
      0090EC EB A1            [ 1] 3115 	and a,(RELOP,sp)
      0090EE 02               [ 1] 3116 	tnz a 
      0090EF 25 4E            [ 1] 3117 	jreq 10$
      0090F1 6B               [ 2] 3118 	incw x 
      0011AC                       3119 7$:	 
      0090F2 01 A4            [ 2] 3120 	jra 10$  	
      0090F4 30 A1            [ 2] 3121 9$: ldw x,(N1,sp)
      0011B0                       3122 10$:
      0090F6 10 27            [ 1] 3123 	ld a,#TK_INTGR
      0011B2                       3124 rel_exit: 	 
      0011B2                       3125 	_drop VSIZE
      0090F8 04 7B            [ 2]    1     addw sp,#VSIZE 
      0090FA 01               [ 4] 3126 	ret 
                                   3127 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3128 ;--------------------------------
                                   3129 ; BASIC: SHOW 
                                   3130 ; print stack content in hexadecimal bytes 
                                   3131 ; 16 bytes per row 
                                   3132 ;--------------------------------
      0011B5                       3133 show:
      0090FB 20 03 CF         [ 2] 3134 	ldw x,#cstk_prompt
      0090FD CD 00 00         [ 4] 3135 	call puts 
      0090FD CD               [ 1] 3136 	ldw x,sp 
      0090FE 89 EB 03         [ 2] 3137 	addw x,#3 ; ignore return address
      009100 90 AE 18 00      [ 2] 3138 	ldw y,#RAM_SIZE  
      009100 A1 81 26         [ 2] 3139 	ldw acc16,x 
      009103 03 FD 20 2F      [ 2] 3140 	subw y,acc16
      009107 CD 03 59         [ 4] 3141 	call hex_dump
      009107 A1               [ 1] 3142 	clr a 
      009108 84               [ 4] 3143 	ret
                                   3144 
      009109 26 02 20 29 74 65 6E  3145 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3146 
                                   3147 
                                   3148 ;--------------------------------------------
                                   3149 ; BASIC: HEX 
                                   3150 ; select hexadecimal base for integer print
                                   3151 ;---------------------------------------------
      00910D                       3152 hex_base:
      00910D A1 06 26 06      [ 1] 3153 	mov base,#16 
      009111 CD               [ 4] 3154 	ret 
                                   3155 
                                   3156 ;--------------------------------------------
                                   3157 ; BASIC: DEC 
                                   3158 ; select decimal base for integer print
                                   3159 ;---------------------------------------------
      0011FB                       3160 dec_base:
      009112 90 C3 FE 20      [ 1] 3161 	mov base,#10
      009116 1F               [ 4] 3162 	ret 
                                   3163 
                                   3164 ;------------------------
                                   3165 ; BASIC: SIZE 
                                   3166 ; return free size in text area
                                   3167 ; output:
                                   3168 ;   A 		TK_INTGR
                                   3169 ;   X 	    size integer
                                   3170 ;--------------------------
      009117                       3171 size:
      009117 A1 85 26         [ 2] 3172 	ldw x,#tib 
      00911A 03 FE 20 18      [ 2] 3173 	subw x,txtend 
      00911E A6 84            [ 1] 3174 	ld a,#TK_INTGR
      00911E A1               [ 4] 3175 	ret 
                                   3176 
                                   3177 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3178 ;------------------------
                                   3179 ; BASIC: UBOUND  
                                   3180 ; return array variable size 
                                   3181 ; output:
                                   3182 ;   A 		TK_INTGR
                                   3183 ;   X 	    array size 
                                   3184 ;--------------------------
      00120A                       3185 ubound:
      00911F 07 26 0C         [ 2] 3186 	ldw x,#tib
      009122 CD 91 DA 89      [ 2] 3187 	subw x,txtend 
      009126 A6 08 CD 90      [ 2] 3188 	ldw y,basicptr 
      00912A 86 85 20 08      [ 2] 3189 	cpw y,txtend 
      00912E 25 0A            [ 1] 3190 	jrult 1$
      00912E 55 00 03         [ 1] 3191 	push count 
      009131 00 02            [ 1] 3192 	push #0 
      009133 4F 20 09         [ 2] 3193 	subw x,(1,sp)
      009136                       3194 	_drop 2 
      009136 A6 11            [ 2]    1     addw sp,#2 
      009138 11               [ 2] 3195 1$:	srlw x 
      009139 01 26 01         [ 2] 3196 	ldw array_size,x
      00913C 50 84            [ 1] 3197 	ld a,#TK_INTGR
      00913D 81               [ 4] 3198 	ret 
                                   3199 
                                   3200 ;-----------------------------
                                   3201 ; BASIC: LET var=expr 
                                   3202 ; variable assignement 
                                   3203 ; output:
                                   3204 ;   A 		TK_NONE 
                                   3205 ;-----------------------------
      00122C                       3206 let:
      00913D A6 84 6B         [ 4] 3207 	call next_token 
      00913F A1 85            [ 1] 3208 	cp a,#TK_VAR 
      00913F 5B 01            [ 1] 3209 	jreq let_var
      009141 81 06            [ 1] 3210 	cp a,#TK_ARRAY 
      009142 27 03            [ 1] 3211 	jreq  let_array
      009142 52 03 CD         [ 2] 3212 	jp syntax_error
      00123A                       3213 let_array:
      009145 90 E8 A1         [ 4] 3214 	call get_array_element
      00123D                       3215 let_var:
      009148 02               [ 2] 3216 	pushw x  
      009149 25 43 6B         [ 4] 3217 	call next_token 
      00914B A1 32            [ 1] 3218 	cp a,#TK_EQUAL
      00914B 1F 01            [ 1] 3219 	jreq 1$
      00914D CD 89 EB         [ 2] 3220 	jp syntax_error
      001248                       3221 1$:	
      009150 A1 02 25         [ 4] 3222 	call relation   
      009153 36 6B            [ 1] 3223 	cp a,#TK_INTGR 
      009155 03 A4            [ 1] 3224 	jreq 2$
      009157 30 A1 20         [ 2] 3225 	jp syntax_error
      001252                       3226 2$:	
      00915A 27 07            [ 1] 3227 	ldw y,x 
      00915C 55               [ 2] 3228 	popw x   
      00915D 00               [ 2] 3229 	ldw (x),y   
      00915E 03               [ 4] 3230 	ret 
                                   3231 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3232 ;----------------------------
                                   3233 ; BASIC: LIST [[start][,end]]
                                   3234 ; list program lines 
                                   3235 ; form start to end 
                                   3236 ; if empty argument list then 
                                   3237 ; list all.
                                   3238 ;----------------------------
                           000001  3239 	FIRST=1
                           000003  3240 	LAST=3 
                           000005  3241 	LN_PTR=5
                           000006  3242 	VSIZE=6 
      001257                       3243 list:
      00915F 00 02 20         [ 2] 3244 	ldw x,txtbgn 
      009162 27 00 1E         [ 2] 3245 	cpw x,txtend 
      009163 2B 01            [ 1] 3246 	jrmi 1$
      009163 CD               [ 4] 3247 	ret 
      001260                       3248 1$:	
      001260                       3249 	_vars VSIZE
      009164 90 E8            [ 2]    1     sub sp,#VSIZE 
      009166 A1 84            [ 2] 3250 	ldw (LN_PTR,sp),x 
      009168 27               [ 2] 3251 	ldw x,(x) 
      009169 03 CC            [ 2] 3252 	ldw (FIRST,sp),x ; list from first line 
      00916B 88 F9 90         [ 2] 3253 	ldw x,#MAX_LINENO ; biggest line number 
      00916E 93 1E            [ 2] 3254 	ldw (LAST,sp),x 
      009170 01 7B 03         [ 4] 3255 	call arg_list
      009173 A1               [ 1] 3256 	tnz a
      009174 20 26            [ 1] 3257 	jreq list_loop 
      009176 05 CD            [ 1] 3258 	cp a,#2 
      009178 8F 17            [ 1] 3259 	jreq 4$
      00917A 20 CF            [ 1] 3260 	cp a,#1 
      00917C A1 21            [ 1] 3261 	jreq first_line 
      00917E 26 05 CD         [ 2] 3262 	jp syntax_error 
      009181 8F               [ 2] 3263 4$:	popw x 
      009182 D0 20            [ 2] 3264 	ldw (LAST+2,sp),x 
      001280                       3265 first_line:
      009184 C6               [ 2] 3266 	popw x
      009185 CD 8F            [ 2] 3267 	ldw (FIRST,sp),x 
      001283                       3268 lines_skip:
      009187 E6 20 C1         [ 2] 3269 	ldw x,txtbgn
      00918A 1E 01            [ 2] 3270 2$:	ldw (LN_PTR,sp),x 
      00918C A6 84 1E         [ 2] 3271 	cpw x,txtend 
      00918E 2A 38            [ 1] 3272 	jrpl list_exit 
      00918E 5B               [ 2] 3273 	ldw x,(x) ;line# 
      00918F 03 81            [ 2] 3274 	cpw x,(FIRST,sp)
      009191 2A 11            [ 1] 3275 	jrpl list_loop 
      009191 52 03            [ 2] 3276 	ldw x,(LN_PTR,sp) 
      009193 CD 91            [ 1] 3277 	ld a,(2,x)
      009195 42 A1 02         [ 1] 3278 	ld acc8,a 
      009198 25 3D 1F 01      [ 1] 3279 	clr acc16 
      00919C CD 89 EB A1      [ 2] 3280 	addw x,acc16
      0091A0 02 25            [ 2] 3281 	jra 2$ 
                                   3282 ; print loop
      0012A3                       3283 list_loop:
      0091A2 30 6B            [ 2] 3284 	ldw x,(LN_PTR,sp)
      0091A4 03 A4            [ 1] 3285 	ld a,(2,x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091A6 30 A1 10         [ 4] 3286 	call prt_basic_line
      0091A9 27 07            [ 2] 3287 	ldw x,(LN_PTR,sp)
      0091AB 55 00            [ 1] 3288 	ld a,(2,x)
      0091AD 03 00 02         [ 1] 3289 	ld acc8,a 
      0091B0 20 21 00 0C      [ 1] 3290 	clr acc16 
      0091B2 72 BB 00 0C      [ 2] 3291 	addw x,acc16
      0091B2 CD 91 42         [ 2] 3292 	cpw x,txtend 
      0091B5 A1 84            [ 1] 3293 	jrpl list_exit
      0091B7 27 03            [ 2] 3294 	ldw (LN_PTR,sp),x
      0091B9 CC               [ 2] 3295 	ldw x,(x)
      0091BA 88 F9            [ 2] 3296 	cpw x,(LAST,sp)  
      0091BC CF 00            [ 1] 3297 	jrslt list_loop
      0012C5                       3298 list_exit:
      0091BE 0D 1E 01 7B 03   [ 1] 3299 	mov in,count 
      0091C3 A1 10 26         [ 2] 3300 	ldw x,#pad 
      0091C6 06 72 BB         [ 2] 3301 	ldw basicptr,x 
      0012D0                       3302 	_drop VSIZE 
      0091C9 00 0D            [ 2]    1     addw sp,#VSIZE 
      0091CB 20               [ 4] 3303 	ret
                                   3304 
                                   3305 ;-------------------------
                                   3306 ; copy command name to buffer  
                                   3307 ; input:
                                   3308 ;   X 	name address 
                                   3309 ;   Y   destination buffer 
                                   3310 ; output:
                                   3311 ;   Y   point after name  
                                   3312 ;--------------------------
      0012D3                       3313 cpy_cmd_name:
      0091CC CD               [ 1] 3314 	ld a,(x)
      0091CD 72               [ 2] 3315 	incw x
      0091CE B0 00            [ 1] 3316 	and a,#15  
      0091D0 0D               [ 1] 3317 	push a 
      0091D1 20 C7            [ 1] 3318     tnz (1,sp) 
      0091D3 1E 01            [ 1] 3319 	jreq 9$
      0091D5 A6               [ 1] 3320 1$:	ld a,(x)
      0091D6 84 F7            [ 1] 3321 	ld (y),a  
      0091D7 5C               [ 2] 3322 	incw x
      0091D7 5B 03            [ 2] 3323 	incw y 
      0091D9 81 01            [ 1] 3324 	dec (1,sp)	 
      0091DA 26 F6            [ 1] 3325 	jrne 1$
      0091DA 52               [ 1] 3326 9$: pop a 
      0091DB 03               [ 4] 3327 	ret	
                                   3328 
                                   3329 ;--------------------------
                                   3330 ; add a space after letter or 
                                   3331 ; digit.
                                   3332 ; input:
                                   3333 ;   Y     pointer to buffer 
                                   3334 ; output:
                                   3335 ;   Y    moved to end 
                                   3336 ;--------------------------
      0012E8                       3337 add_space:
      0091DC CD 91            [ 2] 3338 	decw y 
      0091DE 91 A1            [ 1] 3339 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091E0 02 25            [ 2] 3340 	incw y
      0091E2 4F 1F 01         [ 4] 3341 	call is_alnum 
      0091E5 CD 89            [ 1] 3342 	jrnc 1$
      0091E7 EB A1            [ 1] 3343 	ld a,#SPACE 
      0091E9 02 25            [ 1] 3344 	ld (y),a 
      0091EB 42 5C            [ 2] 3345 	incw y 
      0091EC 81               [ 4] 3346 1$: ret 
                                   3347 
                                   3348 ;--------------------------
                                   3349 ;  align text in buffer 
                                   3350 ;  to tab_width padding 
                                   3351 ;  left with  SPACE 
                                   3352 ; input:
                                   3353 ;   X      str*
                                   3354 ;   A      str_length 
                                   3355 ; output:
                                   3356 ;   X      ajusted
                                   3357 ;--------------------------
      0012FA                       3358 right_align:
      0091EC 6B               [ 1] 3359 	push a 
      0091ED 03 A4            [ 1] 3360 0$: ld a,(1,sp)
      0091EF 30 A1 30         [ 1] 3361 	cp a,tab_width 
      0091F2 27 07            [ 1] 3362 	jrpl 1$
      0091F4 55 00            [ 1] 3363 	ld a,#SPACE 
      0091F6 03               [ 2] 3364 	decw x
      0091F7 00               [ 1] 3365 	ld (x),a  
      0091F8 02 20            [ 1] 3366 	inc (1,sp)
      0091FA 33 F1            [ 2] 3367 	jra 0$ 
      0091FB 84               [ 1] 3368 1$: pop a 	
      0091FB CD               [ 4] 3369 	ret 
                                   3370 
                                   3371 ;--------------------------
                                   3372 ; print TK_QSTR
                                   3373 ; converting control character
                                   3374 ; to backslash sequence
                                   3375 ; input:
                                   3376 ;   X        char *
                                   3377 ;   Y        dest. buffer 
                                   3378 ; output:
                                   3379 ;   X        moved forward 
                                   3380 ;   Y        moved forward 
                                   3381 ;-----------------------------
      00130C                       3382 cpy_quote:
      0091FC 91 91            [ 1] 3383 	ld a,#'"
      0091FE A1 84            [ 1] 3384 	ld (y),a 
      009200 27 03            [ 2] 3385 	incw y 
      009202 CC               [ 1] 3386 1$:	ld a,(x)
      009203 88 F9            [ 1] 3387 	jreq 9$
      009205 CF               [ 2] 3388 	incw x 
      009206 00 0D            [ 1] 3389 	cp a,#SPACE 
      009208 1E 01            [ 1] 3390 	jrult 3$
      00920A 72 B0            [ 1] 3391 	ld (y),a
      00920C 00 0D            [ 2] 3392 	incw y 
      00920E 26 06            [ 1] 3393 	cp a,#'\ 
      009210 35 02            [ 1] 3394 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      001322                       3395 2$:
      009212 00 0E            [ 1] 3396 	ld (y),a
      009214 20 0C            [ 2] 3397 	incw y  
      009216 20 EA            [ 2] 3398 	jra 1$
      009216 2C               [ 1] 3399 3$: push a 
      009217 06 35            [ 1] 3400 	ld a,#'\
      009219 04 00            [ 1] 3401 	ld (y),a 
      00921B 0E 20            [ 2] 3402 	incw y  
      00921D 04               [ 1] 3403 	pop a 
      00921E A0 07            [ 1] 3404 	sub a,#7
      00921E 35 01 00         [ 1] 3405 	ld acc8,a 
      009221 0E 5F 00 0C      [ 1] 3406 	clr acc16
      009222 89               [ 2] 3407 	pushw x
      009222 5F C6 00         [ 2] 3408 	ldw x,#escaped 
      009225 0E 14 03 4D      [ 2] 3409 	addw x,acc16 
      009229 27               [ 1] 3410 	ld a,(x)
      00922A 05               [ 2] 3411 	popw x
      00922B 5C DD            [ 2] 3412 	jra 2$
      00922C A6 22            [ 1] 3413 9$: ld a,#'"
      00922C 20 02            [ 1] 3414 	ld (y),a 
      00922E 1E 01            [ 2] 3415 	incw y  
      009230 5C               [ 2] 3416 	incw x 
      009230 A6               [ 4] 3417 	ret
                                   3418 
                                   3419 ;--------------------------
                                   3420 ; return variable name 
                                   3421 ; from its address.
                                   3422 ; input:
                                   3423 ;   X    variable address
                                   3424 ; output:
                                   3425 ;   A     variable letter
                                   3426 ;--------------------------
      00134D                       3427 var_name:
      009231 84 00 2F         [ 2] 3428 		subw x,#vars 
      009232 9F               [ 1] 3429 		ld a,xl 
      009232 5B               [ 1] 3430 		srl a 
      009233 03 81            [ 1] 3431 		add a,#'A 
      009235 81               [ 4] 3432 		ret 
                                   3433 
                                   3434 ;-----------------------------
                                   3435 ; return cmd  idx from its 
                                   3436 ; code address 
                                   3437 ; input:
                                   3438 ;   X      code address 
                                   3439 ; output:
                                   3440 ;   X      cmd_idx
                                   3441 ;-----------------------------
      001355                       3442 get_cmd_idx:
      009235 AE 92            [ 2] 3443 	pushw y
      009237 4F CD A8 C0      [ 2] 3444 	ldw y,#code_addr 
      00923B 96 1C 00 03      [ 2] 3445 	ldw ptr16,y 
      00923F 90 AE            [ 1] 3446 	clrw y 
      009241 18 00 CF         [ 5] 3447 1$:	cpw x,([ptr16],y)
      009244 00 0D            [ 1] 3448 	jreq 3$ 
      009246 72 B2            [ 2] 3449 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009248 00 0D CD         [ 4] 3450 	ld a,([ptr16],y)
      00924B 83 D9            [ 2] 3451 	incw y
      00924D 4F 81 0A         [ 4] 3452 	or a,([ptr16],y)	
      009250 63 6F            [ 1] 3453 	jrne 1$
      009252 6E               [ 1] 3454 3$: ldw x,y 
      009253 74 65            [ 2] 3455 	popw y 
      009255 6E               [ 4] 3456 	ret
                                   3457 
                                   3458 ;-------------------------------------
                                   3459 ; decompile tokens list 
                                   3460 ; to original text line 
                                   3461 ; input:
                                   3462 ;   [basicptr]  pointer at line 
                                   3463 ;   Y           destination buffer
                                   3464 ; output:
                                   3465 ;   A           length 
                                   3466 ;   Y           after string  
                                   3467 ;------------------------------------
                           000001  3468 	BASE_SAV=1
                           000002  3469 	WIDTH_SAV=2
                           000003  3470 	STR=3
                           000004  3471 	VSIZE=4 
      001376                       3472 decompile::
      001376                       3473 	_vars VSIZE
      009256 74 20            [ 2]    1     sub sp,#VSIZE 
      009258 6F 66 20         [ 1] 3474 	ld a,base
      00925B 73 74            [ 1] 3475 	ld (BASE_SAV,sp),a  
      00925D 61 63 6B         [ 1] 3476 	ld a,tab_width 
      009260 20 66            [ 1] 3477 	ld (WIDTH_SAV,sp),a 
      009262 72 6F            [ 2] 3478 	ldw (STR,sp),y   
      009264 6D 20 74 6F      [ 5] 3479 	ldw x,[basicptr] ; line number 
      009268 70 20 74 6F      [ 1] 3480 	mov base,#10
      00926C 20 62 6F 74      [ 1] 3481 	mov tab_width,#5
      009270 74 6F 6D 3A      [ 1] 3482 	clr acc24 
      009274 0A 00 0C         [ 2] 3483 	ldw acc16,x
      009276 CD 09 E8         [ 4] 3484 	call itoa  
      009276 35 10 00         [ 4] 3485 	call right_align 
      009279 0B               [ 1] 3486 	push a 
      00927A 81 93            [ 1] 3487 1$:	ldw y,x ; source
      00927B 1E 04            [ 2] 3488 	ldw x,(STR+1,sp) ; destination
      00927B 35 0A 00         [ 4] 3489 	call strcpy 
      00927E 0B 81            [ 1] 3490 	clrw y 
      009280 84               [ 1] 3491 	pop a 
      009280 AE 16            [ 1] 3492 	ld yl,a 
      009282 90 72 B0         [ 2] 3493 	addw y,(STR,sp)
      009285 00 1F            [ 1] 3494 	ld a,#SPACE 
      009287 A6 84            [ 1] 3495 	ld (y),a 
      009289 81 5C            [ 2] 3496 	incw y 
      00928A 72 5F 00 24      [ 1] 3497 	clr tab_width
      00928A AE 16 90         [ 2] 3498 	ldw x,#3
      00928D 72 B0 00         [ 2] 3499 	ldw in.w,x 
      0013BD                       3500 decomp_loop:
      009290 1F 90            [ 2] 3501 	pushw y
      009292 CE 00 05         [ 4] 3502 	call next_token 
      009295 90 C3            [ 2] 3503 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009297 00               [ 1] 3504 	tnz a  
      009298 1F 25            [ 1] 3505 	jrne 1$
      00929A 0A 3B 00         [ 2] 3506 	jp 20$
      00929D 04 4B            [ 1] 3507 1$:	jrpl 6$
                                   3508 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00929F 00 72            [ 1] 3509 	cp a,#TK_VAR 
      0092A1 F0 01            [ 1] 3510 	jrne 3$
                                   3511 ;; TK_VAR 
      0092A3 5B 02 54         [ 4] 3512 	call add_space  
      0092A6 CF 00 22         [ 4] 3513 	call var_name
      0092A9 A6 84            [ 1] 3514 	ld (y),a 
      0092AB 81 5C            [ 2] 3515 	incw y  
      0092AC 20 E1            [ 2] 3516 	jra decomp_loop
      0013DC                       3517 3$:
      0092AC CD 89            [ 1] 3518 	cp a,#TK_INTGR
      0092AE EB A1            [ 1] 3519 	jrne 4$
                                   3520 ;; TK_INTGR
      0092B0 85 27 0A         [ 4] 3521 	call add_space
      0092B3 A1 06 27 03      [ 1] 3522 	clr acc24 
      0092B7 CC 88 F9         [ 2] 3523 	ldw acc16,x 
      0092BA 90 89            [ 2] 3524 	pushw y 
      0092BA CD 90 C3         [ 4] 3525 	call itoa  
      0092BD 16 01            [ 2] 3526 	ldw y,(1,sp) 
      0092BD 89               [ 1] 3527 	push a 
      0092BE CD               [ 1] 3528 	exgw x,y 
      0092BF 89 EB A1         [ 4] 3529 	call strcpy 
      0092C2 32 27            [ 1] 3530 	clrw y
      0092C4 03               [ 1] 3531 	pop a  
      0092C5 CC 88            [ 1] 3532 	ld yl,a 
      0092C7 F9 F9 01         [ 2] 3533 	addw y,(1,sp)
      0092C8                       3534 	_drop 2 
      0092C8 CD 91            [ 2]    1     addw sp,#2 
      0092CA DA A1            [ 2] 3535 	jra decomp_loop
                                   3536 ;; dictionary keyword 
      001402                       3537 4$:	
      0092CC 84 27 03         [ 4] 3538 	call get_cmd_idx 
      0092CF CC 88 F9         [ 2] 3539 	cpw x,#REM_IDX
      0092D2 26 22            [ 1] 3540 	jrne 5$
      0092D2 90 93 85         [ 2] 3541 	ldw x,basicptr 
                                   3542 ; copy comment to buffer 
      0092D5 FF 81 E8         [ 4] 3543 	call add_space
      0092D7 A6 27            [ 1] 3544 	ld a,#''
      0092D7 CE 00            [ 1] 3545 	ld (y),a 
      0092D9 1D C3            [ 2] 3546 	incw y 
      001416                       3547 41$:
      0092DB 00 1F 2B 01      [ 4] 3548 	ld a,([in.w],x)
      0092DF 81 5C 00 01      [ 1] 3549 	inc in  
      0092E0 90 F7            [ 1] 3550 	ld (y),a 
      0092E0 52 06            [ 2] 3551 	incw y 
      0092E2 1F 05 FE         [ 1] 3552 	ld a,in 
      0092E5 1F 01 AE         [ 1] 3553 	cp a,count 
      0092E8 7F FF            [ 1] 3554 	jrmi 41$
      0092EA 1F 03            [ 2] 3555 	jra 20$  
                                   3556 ; insert command name 
      00142C                       3557 5$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092EC CD 90 98         [ 4] 3558 	call add_space  
      0092EF 4D 27            [ 2] 3559 	pushw y
      0092F1 31 A1 02         [ 4] 3560 	call cmd_name
      0092F4 27 07            [ 2] 3561 	popw y 
      0092F6 A1 01 27         [ 4] 3562 	call cpy_cmd_name
      0092F9 06 CC            [ 2] 3563 	jra decomp_loop 
      00143B                       3564 6$:
      0092FB 88 F9            [ 1] 3565 	cp a,#TK_QSTR 
      0092FD 85 1F            [ 1] 3566 	jrne 7$
                                   3567 ;; TK_QSTR
      0092FF 05 13 0C         [ 4] 3568 	call cpy_quote  
      009300 CC 13 BD         [ 2] 3569 	jp decomp_loop
      001445                       3570 7$:
      009300 85 1F            [ 1] 3571 	cp a,#TK_CHAR 
      009302 01 0E            [ 1] 3572 	jrne 8$
                                   3573 ;; TK_CHAR 
      009303 A6 5C            [ 1] 3574 	ld a,#'\ 
      009303 CE 00            [ 1] 3575 	ld (y),a 
      009305 1D 1F            [ 2] 3576 	incw y 
      009307 05               [ 1] 3577 	ld a,xl 
      009308 C3 00            [ 1] 3578 	ld (y),a 
      00930A 1F 2A            [ 2] 3579 	incw y 
      00930C 38 FE 13         [ 2] 3580 	jp decomp_loop
      00930F 01 2A            [ 1] 3581 8$: cp a,#TK_COLON 
      009311 11 1E            [ 1] 3582 	jrne 9$
      009313 05 E6            [ 1] 3583 	ld a,#':
      00145D                       3584 81$:
      009315 02 C7            [ 1] 3585 	ld (y),a 
      009317 00 0E            [ 2] 3586 	incw y 
      001461                       3587 82$:
      009319 72 5F 00         [ 2] 3588 	jp decomp_loop
      001464                       3589 9$: 
      00931C 0D 72            [ 1] 3590 	cp a,#TK_SHARP
      00931E BB 00            [ 1] 3591 	jrugt 10$ 
      009320 0D 20            [ 1] 3592 	sub a,#TK_ARRAY 
      009322 E3               [ 1] 3593 	clrw x 
      009323 97               [ 1] 3594 	ld xl,a
      009323 1E 05 E6         [ 2] 3595 	addw x,#single_char 
      009326 02               [ 1] 3596 	ld a,(x)
      009327 CD 95            [ 2] 3597 	jra 81$ 
      001472                       3598 10$: 
      009329 5E 1E            [ 1] 3599 	cp a,#TK_MINUS 
      00932B 05 E6            [ 1] 3600 	jrugt 11$
      00932D 02 C7            [ 1] 3601 	sub a,#TK_PLUS 
      00932F 00               [ 1] 3602 	clrw x 
      009330 0E               [ 1] 3603 	ld xl,a 
      009331 72 5F 00         [ 2] 3604 	addw x,#add_char 
      009334 0D               [ 1] 3605 	ld a,(x)
      009335 72 BB            [ 2] 3606 	jra 81$
      001480                       3607 11$:
      009337 00 0D            [ 1] 3608     cp a,#TK_MOD 
      009339 C3 00            [ 1] 3609 	jrugt 12$
      00933B 1F 2A            [ 1] 3610 	sub a,#TK_MULT
      00933D 07               [ 1] 3611 	clrw x 
      00933E 1F               [ 1] 3612 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00933F 05 FE 13         [ 2] 3613 	addw x,#mul_char
      009342 03               [ 1] 3614 	ld a,(x)
      009343 2F DE            [ 2] 3615 	jra 81$
      009345                       3616 12$:
      009345 55 00            [ 1] 3617 	sub a,#TK_GT  
      009347 04               [ 1] 3618 	sll a 
      009348 00               [ 1] 3619 	clrw x 
      009349 02               [ 1] 3620 	ld xl,a 
      00934A AE 16 E0         [ 2] 3621 	addw x,#relop_str 
      00934D CF               [ 2] 3622 	ldw x,(x)
      00934E 00               [ 1] 3623 	ld a,(x)
      00934F 05               [ 2] 3624 	incw x 
      009350 5B 06            [ 1] 3625 	ld (y),a
      009352 81 5C            [ 2] 3626 	incw y 
      009353 F6               [ 1] 3627 	ld a,(x)
      009353 F6 5C            [ 1] 3628 	jrne 81$
      009355 A4 0F 88         [ 2] 3629 	jp decomp_loop 
      0014A3                       3630 20$: 
      009358 0D 01            [ 1] 3631 	clr (y)
      00935A 27 0A            [ 2] 3632 	ldw x,(STR,sp)
      00935C F6 90            [ 1] 3633 	ld a,(BASE_SAV,sp)
      00935E F7 5C 90         [ 1] 3634 	ld base,a 
      009361 5C 0A            [ 1] 3635 	ld a,(WIDTH_SAV,sp)
      009363 01 26 F6         [ 1] 3636 	ld tab_width,a
      009366 84 81 03         [ 2] 3637 	subw y,(STR,sp) 
      009368 90 9F            [ 1] 3638 	ld a,yl 
      0014B6                       3639 	_drop VSIZE 
      009368 90 5A            [ 2]    1     addw sp,#VSIZE 
      00936A 90               [ 4] 3640 	ret 
                                   3641 
      00936B F6 90 5C CD 86        3642 single_char: .byte '@','(',')',',','#'
      009370 07 24                 3643 add_char: .byte '+','-'
      009372 06 A6 20              3644 mul_char: .byte '*','/','%'
      009375 90 F7 90 5C 81 D3 14  3645 relop_str: .word gt,equal,ge,lt,le,ne 
             D6 14 D8 14 DB
      00937A 3E 00                 3646 gt: .asciz ">"
      00937A 88 7B                 3647 equal: .asciz "="
      00937C 01 C1 00              3648 ge: .asciz ">="
      00937F 25 2A                 3649 lt: .asciz "<"
      009381 08 A6 20              3650 le: .asciz "<="
      009384 5A F7 0C              3651 ne:  .asciz "<>"
                                   3652 
                                   3653 
                                   3654 ;--------------------------
                                   3655 ; decompile line from token list
                                   3656 ; and print it. 
                                   3657 ; input:
                                   3658 ;   A       stop at this position 
                                   3659 ;   X 		pointer at line
                                   3660 ; output:
                                   3661 ;   none 
                                   3662 ;--------------------------	
      0014DE                       3663 prt_basic_line:
      009387 01 20 F1         [ 1] 3664 	ld count,a 
      00938A 84 81            [ 1] 3665 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00938C C1 00 03         [ 1] 3666 	cp a,count 
      00938C A6 22            [ 1] 3667 	jrpl 1$ 
      00938E 90 F7 90         [ 1] 3668 	ld count,a 
      009391 5C F6 27         [ 2] 3669 1$:	ldw basicptr,x 
      009394 30 5C A1 20      [ 2] 3670 	ldw y,#tib  
      009398 25 0E 90         [ 4] 3671 	call decompile 
      00939B F7 90 5C         [ 4] 3672 	call puts 
      00939E A1 5C            [ 1] 3673 	ld a,#CR 
      0093A0 26 F0 C0         [ 4] 3674 	call putc 
      0093A2 81               [ 4] 3675 	ret 
                                   3676 
                                   3677 
                                   3678 
                                   3679 ;---------------------------------
                                   3680 ; BASIC: PRINT|? arg_list 
                                   3681 ; print values from argument list
                                   3682 ;----------------------------------
                           000001  3683 	COMMA=1
                           000001  3684 	VSIZE=1
      0014FE                       3685 print:
      0093A2 90 F7            [ 1] 3686 push #0 ; local variable COMMA 
      001500                       3687 reset_comma:
      0093A4 90 5C            [ 1] 3688 	clr (COMMA,sp)
      001502                       3689 prt_loop:
      0093A6 20 EA 88         [ 4] 3690 	call next_token
      0093A9 A6 5C            [ 1] 3691 	cp a,#CMD_END 
      0093AB 90 F7            [ 1] 3692 	jrult print_exit ; colon or end of line 
      0093AD 90 5C            [ 1] 3693 	cp a,#TK_QSTR
      0093AF 84 A0            [ 1] 3694 	jreq 1$
      0093B1 07 C7            [ 1] 3695 	cp a,#TK_CHAR 
      0093B3 00 0E            [ 1] 3696 	jreq 2$ 
      0093B5 72 5F            [ 1] 3697 	cp a,#TK_CFUNC 
      0093B7 00 0D            [ 1] 3698 	jreq 3$
      0093B9 89 AE            [ 1] 3699 	cp a,#TK_COMMA 
      0093BB 8B 94            [ 1] 3700 	jreq 4$
      0093BD 72 BB            [ 1] 3701 	cp a,#TK_SHARP 
      0093BF 00 0D            [ 1] 3702 	jreq 5$
      0093C1 F6 85            [ 2] 3703 	jra 7$ 
      00151F                       3704 1$:	; print string 
      0093C3 20 DD A6         [ 4] 3705 	call puts
      0093C6 22 90            [ 2] 3706 	jra reset_comma
      001524                       3707 2$:	; print character 
      0093C8 F7               [ 1] 3708 	ld a,xl 
      0093C9 90 5C 5C         [ 4] 3709 	call putc 
      0093CC 81 D6            [ 2] 3710 	jra reset_comma 
      0093CD                       3711 3$: ; print character function value  	
      0093CD 1D               [ 4] 3712 	call (x)
      0093CE 00               [ 1] 3713 	ld a,xl 
      0093CF 30 9F 44         [ 4] 3714 	call putc
      0093D2 AB 41            [ 2] 3715 	jra reset_comma 
      001531                       3716 4$: ; set comma state 
      0093D4 81 FF            [ 1] 3717 	ld a,#255 
      0093D5 6B 01            [ 1] 3718 	ld (COMMA,sp),a  
      0093D5 90 89 90         [ 2] 3719 	jp prt_loop   
      001538                       3720 5$: ; # character must be followed by an integer   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093D8 AE A7 41         [ 4] 3721 	call next_token
      0093DB 90 CF            [ 1] 3722 	cp a,#TK_INTGR 
      0093DD 00 18            [ 1] 3723 	jreq 6$
      0093DF 90 5F 91         [ 2] 3724 	jp syntax_error 
      001542                       3725 6$: ; set tab width
      0093E2 D3               [ 1] 3726 	ld a,xl 
      0093E3 18 27            [ 1] 3727 	and a,#15 
      0093E5 0C 90 5C         [ 1] 3728 	ld tab_width,a 
      0093E8 91 D6            [ 2] 3729 	jra reset_comma 
      00154A                       3730 7$:	
      00154A                       3731 	_unget_token
      0093EA 18 90 5C 91 DA   [ 1]    1     mov in,in.saved
      0093EF 18 26 EF         [ 4] 3732 	call relation 
      0093F2 93 90            [ 1] 3733 	cp a,#TK_INTGR
      0093F4 85 81            [ 1] 3734 	jreq 8$
      0093F6                       3735 	_unget_token
      0093F6 52 04 C6 00 0B   [ 1]    1     mov in,in.saved
      0093FB 6B 01 C6         [ 2] 3736 	jp print_exit 
      0093FE 00 25 6B         [ 4] 3737 8$: call print_int 
      009401 02 17            [ 2] 3738 	jra reset_comma 
      001563                       3739 print_exit:
      009403 03 72            [ 1] 3740 	tnz (COMMA,sp)
      009405 CE 00            [ 1] 3741 	jrne 9$
      009407 05 35            [ 1] 3742 	ld a,#CR 
      009409 0A 00 0B         [ 4] 3743     call putc 
      00156C                       3744 9$:	_drop VSIZE 
      00940C 35 05            [ 2]    1     addw sp,#VSIZE 
      00940E 00               [ 4] 3745 	ret 
                                   3746 
                                   3747 ;----------------------
                                   3748 ; 'save_context' and
                                   3749 ; 'rest_context' must be 
                                   3750 ; called at the same 
                                   3751 ; call stack depth 
                                   3752 ; i.e. SP must have the 
                                   3753 ; save value at  
                                   3754 ; entry point of both 
                                   3755 ; routine. 
                                   3756 ;---------------------
                           000004  3757 	CTXT_SIZE=4 ; size of saved data 
                                   3758 ;--------------------
                                   3759 ; save current BASIC
                                   3760 ; interpreter context 
                                   3761 ; on stack 
                                   3762 ;--------------------
      00156F                       3763 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00156F                       3764 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00156F                       3765 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00156F                       3766 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00156F                       3767 save_context:
      00940F 25 72 5F         [ 2] 3768 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009412 00 0C            [ 2] 3769 	ldw (BPTR,sp),x
      009414 CF 00 0D         [ 1] 3770 	ld a,in 
      009417 CD 8A            [ 1] 3771 	ld (IN,sp),a
      009419 68 CD 93         [ 1] 3772 	ld a,count 
      00941C 7A 88            [ 1] 3773 	ld (CNT,sp),a  
      00941E 90               [ 4] 3774 	ret
                                   3775 
                                   3776 ;-----------------------
                                   3777 ; restore previously saved 
                                   3778 ; BASIC interpreter context 
                                   3779 ; from stack 
                                   3780 ;-------------------------
      00157F                       3781 rest_context:
      00941F 93 1E            [ 2] 3782 	ldw x,(BPTR,sp)
      009421 04 CD 84         [ 2] 3783 	ldw basicptr,x 
      009424 32 90            [ 1] 3784 	ld a,(IN,sp)
      009426 5F 84 90         [ 1] 3785 	ld in,a
      009429 97 72            [ 1] 3786 	ld a,(CNT,sp)
      00942B F9 03 A6         [ 1] 3787 	ld count,a  
      00942E 20               [ 4] 3788 	ret
                                   3789 
                                   3790 
                                   3791 
                                   3792 ;------------------------------------------
                                   3793 ; BASIC: INPUT [string]var[,[string]var]
                                   3794 ; input value in variables 
                                   3795 ; [string] optionally can be used as prompt 
                                   3796 ;-----------------------------------------
                           000001  3797 	CX_BPTR=1
                           000003  3798 	CX_IN=3
                           000004  3799 	CX_CNT=4
                           000005  3800 	SKIP=5
                           000006  3801 	VAR_ADDR=6
                           000007  3802 	VSIZE=7
      00158F                       3803 input_var:
      00158F                       3804 	_vars VSIZE 
      00942F 90 F7            [ 2]    1     sub sp,#VSIZE 
      001591                       3805 input_loop:
      009431 90 5C            [ 1] 3806 	clr (SKIP,sp)
      009433 72 5F 00         [ 4] 3807 	call next_token 
      009436 25 AE            [ 1] 3808 	cp a,#TK_QSTR 
      009438 00 03            [ 1] 3809 	jrne 1$ 
      00943A CF 00 01         [ 4] 3810 	call puts 
      00943D 03 05            [ 1] 3811 	cpl (SKIP,sp)
      00943D 90 89 CD         [ 4] 3812 	call next_token 
      009440 89 EB            [ 1] 3813 1$: cp a,#TK_VAR  
      009442 90 85            [ 1] 3814 	jreq 2$ 
      009444 4D 26 03         [ 2] 3815 	jp syntax_error
      009447 CC 95            [ 2] 3816 2$:	ldw (VAR_ADDR,sp),x 
      009449 23 2A            [ 1] 3817 	tnz (SKIP,sp)
      00944B 6F A1            [ 1] 3818 	jrne 21$ 
      00944D 85 26 0C         [ 4] 3819 	call var_name 
      009450 CD 93 68         [ 4] 3820 	call putc   
      0015B5                       3821 21$:
      009453 CD 93            [ 1] 3822 	ld a,#':
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009455 CD 90 F7         [ 4] 3823 	call putc 
      009458 90 5C 20         [ 4] 3824 	call save_context 
      00945B E1 5F 00 03      [ 1] 3825 	clr count  
      00945C CD 00 00         [ 4] 3826 	call readln 
      00945C A1 84 26         [ 2] 3827 	ldw x,#tib 
      00945F 22 CD 93         [ 1] 3828 	push count
      009462 68 72            [ 1] 3829 	push #0 
      009464 5F 00 0C         [ 2] 3830 	addw x,(1,sp)
      009467 CF               [ 2] 3831 	incw x 
      0015D0                       3832 	_drop 2 
      009468 00 0D            [ 2]    1     addw sp,#2 
      00946A 90 89 CD 8A      [ 1] 3833 	clr in 
      00946E 68 16 01         [ 4] 3834 	call get_token
      009471 88 51            [ 1] 3835 	cp a,#TK_INTGR
      009473 CD 84            [ 1] 3836 	jreq 3$ 
      009475 32 90 5F         [ 4] 3837 	call rest_context 
      009478 84 90 97         [ 2] 3838 	jp syntax_error
      00947B 72 F9            [ 2] 3839 3$: ldw y,(VAR_ADDR,sp) 
      00947D 01 5B            [ 2] 3840 	ldw (y),x 
      00947F 02 20 BB         [ 4] 3841 	call rest_context
      009482 CD 09 6B         [ 4] 3842 	call next_token 
      009482 CD 93            [ 1] 3843 	cp a,#TK_COMMA 
      009484 D5 A3            [ 1] 3844 	jreq input_loop 
      009486 00 8E            [ 1] 3845 	cp a,#TK_COLON 
      009488 26 22            [ 2] 3846     jrule input_exit 
      00948A CE 00 05         [ 2] 3847 	jp syntax_error 
      0015F8                       3848 input_exit:
      0015F8                       3849 	_drop VSIZE 
      00948D CD 93            [ 2]    1     addw sp,#VSIZE 
      00948F 68               [ 4] 3850 	ret 
                                   3851 
                                   3852 
                                   3853 ;---------------------
                                   3854 ; BASIC: REMARK | ' 
                                   3855 ; skip comment to end of line 
                                   3856 ;---------------------- 
      0015FB                       3857 remark:
      009490 A6 27 90 F7 90   [ 1] 3858 	mov in,count 
      009495 5C               [ 4] 3859  	ret 
                                   3860 
                                   3861 
                                   3862 ;---------------------
                                   3863 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3864 ; read in loop 'addr'  
                                   3865 ; apply & 'mask' to value 
                                   3866 ; loop while result==0.  
                                   3867 ; 'xor_mask' is used to 
                                   3868 ; invert the wait logic.
                                   3869 ; i.e. loop while not 0.
                                   3870 ;---------------------
                           000001  3871 	XMASK=1 
                           000002  3872 	MASK=2
                           000003  3873 	ADDR=3
                           000004  3874 	VSIZE=4
      009496                       3875 wait: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      001601                       3876 	_vars VSIZE
      009496 72 D6            [ 2]    1     sub sp,#VSIZE 
      009498 00 01            [ 1] 3877 	clr (XMASK,sp) 
      00949A 72 5C 00         [ 4] 3878 	call arg_list 
      00949D 02 90            [ 1] 3879 	cp a,#2
      00949F F7 90            [ 1] 3880 	jruge 0$
      0094A1 5C C6 00         [ 2] 3881 	jp syntax_error 
      0094A4 02 C1            [ 1] 3882 0$:	cp a,#3
      0094A6 00 04            [ 1] 3883 	jrult 1$
      0094A8 2B               [ 2] 3884 	popw x 
      0094A9 EC               [ 1] 3885 	ld a,xl
      0094AA 20 77            [ 1] 3886 	ld (XMASK,sp),a 
      0094AC 85               [ 2] 3887 1$: popw x ; mask 
      0094AC CD               [ 1] 3888 	ld a,xl 
      0094AD 93 68            [ 1] 3889 	ld (MASK,sp),a 
      0094AF 90               [ 2] 3890 	popw x ; address 
      0094B0 89               [ 1] 3891 2$:	ld a,(x)
      0094B1 CD 90            [ 1] 3892 	and a,(MASK,sp)
      0094B3 07 90            [ 1] 3893 	xor a,(XMASK,sp)
      0094B5 85 CD            [ 1] 3894 	jreq 2$ 
      001623                       3895 	_drop VSIZE 
      0094B7 93 53            [ 2]    1     addw sp,#VSIZE 
      0094B9 20               [ 4] 3896 	ret 
                                   3897 
                                   3898 ;---------------------
                                   3899 ; BASIC: BSET addr,mask
                                   3900 ; set bits at 'addr' corresponding 
                                   3901 ; to those of 'mask' that are at 1.
                                   3902 ; arguments:
                                   3903 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3904 ;   mask        mask|addr
                                   3905 ; output:
                                   3906 ;	none 
                                   3907 ;--------------------------
      001626                       3908 bit_set:
      0094BA 82 10 18         [ 4] 3909 	call arg_list 
      0094BB A1 02            [ 1] 3910 	cp a,#2	 
      0094BB A1 02            [ 1] 3911 	jreq 1$ 
      0094BD 26 06 CD         [ 2] 3912 	jp syntax_error
      001630                       3913 1$: 
      0094C0 93               [ 2] 3914 	popw x ; mask 
      0094C1 8C               [ 1] 3915 	ld a,xl 
      0094C2 CC               [ 2] 3916 	popw x ; addr  
      0094C3 94               [ 1] 3917 	or a,(x)
      0094C4 3D               [ 1] 3918 	ld (x),a
      0094C5 81               [ 4] 3919 	ret 
                                   3920 
                                   3921 ;---------------------
                                   3922 ; BASIC: BRES addr,mask
                                   3923 ; reset bits at 'addr' corresponding 
                                   3924 ; to those of 'mask' that are at 1.
                                   3925 ; arguments:
                                   3926 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3927 ;   mask	    ~mask&*addr  
                                   3928 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3929 ;	none 
                                   3930 ;--------------------------
      001636                       3931 bit_reset:
      0094C5 A1 03 26         [ 4] 3932 	call arg_list 
      0094C8 0E A6            [ 1] 3933 	cp a,#2  
      0094CA 5C 90            [ 1] 3934 	jreq 1$ 
      0094CC F7 90 5C         [ 2] 3935 	jp syntax_error
      001640                       3936 1$: 
      0094CF 9F               [ 2] 3937 	popw x ; mask 
      0094D0 90               [ 1] 3938 	ld a,xl 
      0094D1 F7               [ 1] 3939 	cpl a 
      0094D2 90               [ 2] 3940 	popw x ; addr  
      0094D3 5C               [ 1] 3941 	and a,(x)
      0094D4 CC               [ 1] 3942 	ld (x),a 
      0094D5 94               [ 4] 3943 	ret 
                                   3944 
                                   3945 ;---------------------
                                   3946 ; BASIC: BTOGL addr,mask
                                   3947 ; toggle bits at 'addr' corresponding 
                                   3948 ; to those of 'mask' that are at 1.
                                   3949 ; arguments:
                                   3950 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3951 ;   mask	    mask^*addr  
                                   3952 ; output:
                                   3953 ;	none 
                                   3954 ;--------------------------
      001647                       3955 bit_toggle:
      0094D6 3D A1 01         [ 4] 3956 	call arg_list 
      0094D9 26 09            [ 1] 3957 	cp a,#2 
      0094DB A6 3A            [ 1] 3958 	jreq 1$ 
      0094DD CC 08 79         [ 2] 3959 	jp syntax_error
      0094DD 90               [ 2] 3960 1$: popw x ; mask 
      0094DE F7               [ 1] 3961 	ld a,xl 
      0094DF 90               [ 2] 3962 	popw x ; addr  
      0094E0 5C               [ 1] 3963 	xor a,(x)
      0094E1 F7               [ 1] 3964 	ld (x),a 
      0094E1 CC               [ 4] 3965 	ret 
                                   3966 
                                   3967 
                                   3968 ;---------------------
                                   3969 ; BASIC: BTEST(addr,bit)
                                   3970 ; return bit value at 'addr' 
                                   3971 ; bit is in range {0..7}.
                                   3972 ; arguments:
                                   3973 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3974 ;   bit 	    bit position {0..7}  
                                   3975 ; output:
                                   3976 ;	none 
                                   3977 ;--------------------------
      001657                       3978 bit_test:
      0094E2 94 3D 13         [ 4] 3979 	call func_args 
      0094E4 A1 02            [ 1] 3980 	cp a,#2
      0094E4 A1 0A            [ 1] 3981 	jreq 0$
      0094E6 22 0A A0         [ 2] 3982 	jp syntax_error
      001661                       3983 0$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094E9 06               [ 2] 3984 	popw x 
      0094EA 5F               [ 1] 3985 	ld a,xl 
      0094EB 97 1C            [ 1] 3986 	and a,#7
      0094ED 95               [ 1] 3987 	push a   
      0094EE 39 F6            [ 1] 3988 	ld a,#1 
      0094F0 20 EB            [ 1] 3989 1$: tnz (1,sp)
      0094F2 27 05            [ 1] 3990 	jreq 2$
      0094F2 A1               [ 1] 3991 	sll a 
      0094F3 11 22            [ 1] 3992 	dec (1,sp)
      0094F5 0A A0            [ 2] 3993 	jra 1$
      001671                       3994 2$: _drop 1 
      0094F7 10 5F            [ 2]    1     addw sp,#1 
      0094F9 97               [ 2] 3995 	popw x 
      0094FA 1C               [ 1] 3996 	and a,(x)
      0094FB 95 3E            [ 1] 3997 	jreq 3$
      0094FD F6 20            [ 1] 3998 	ld a,#1 
      0094FF DD               [ 1] 3999 3$:	clrw x 
      009500 97               [ 1] 4000 	ld xl,a 
      009500 A1 22            [ 1] 4001 	ld a,#TK_INTGR
      009502 22               [ 4] 4002 	ret
                                   4003 
                                   4004 
                                   4005 ;--------------------
                                   4006 ; BASIC: POKE addr,byte
                                   4007 ; put a byte at addr 
                                   4008 ;--------------------
      00167E                       4009 poke:
      009503 0A A0 20         [ 4] 4010 	call arg_list 
      009506 5F 97            [ 1] 4011 	cp a,#2
      009508 1C 95            [ 1] 4012 	jreq 1$
      00950A 40 F6 20         [ 2] 4013 	jp syntax_error
      001688                       4014 1$:	
      00950D CF               [ 2] 4015 	popw x  
      00950E 9F               [ 1] 4016     ld a,xl 
      00950E A0               [ 2] 4017 	popw x 
      00950F 31               [ 1] 4018 	ld (x),a 
      009510 48               [ 4] 4019 	ret 
                                   4020 
                                   4021 ;-----------------------
                                   4022 ; BASIC: PEEK(addr)
                                   4023 ; get the byte at addr 
                                   4024 ; input:
                                   4025 ;	none 
                                   4026 ; output:
                                   4027 ;	X 		value 
                                   4028 ;-----------------------
      00168D                       4029 peek:
      009511 5F 97 1C         [ 4] 4030 	call func_args
      009514 95 43            [ 1] 4031 	cp a,#1 
      009516 FE F6            [ 1] 4032 	jreq 1$
      009518 5C 90 F7         [ 2] 4033 	jp syntax_error
      00951B 90               [ 2] 4034 1$: popw x 
      00951C 5C               [ 1] 4035 	ld a,(x)
      00951D F6               [ 1] 4036 	clrw x 
      00951E 26               [ 1] 4037 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00951F BD CC            [ 1] 4038 	ld a,#TK_INTGR
      009521 94               [ 4] 4039 	ret 
                                   4040 
                                   4041 ;---------------------------
                                   4042 ; BASIC IF expr : instructions
                                   4043 ; evaluate expr and if true 
                                   4044 ; execute instructions on same line. 
                                   4045 ;----------------------------
      00169E                       4046 if: 
      009522 3D 11 5A         [ 4] 4047 	call relation 
      009523 A1 84            [ 1] 4048 	cp a,#TK_INTGR
      009523 90 7F            [ 1] 4049 	jreq 1$ 
      009525 1E 03 7B         [ 2] 4050 	jp syntax_error
      009528 01               [ 1] 4051 1$:	clr a 
      009529 C7               [ 2] 4052 	tnzw x 
      00952A 00 0B            [ 1] 4053 	jrne 9$  
                                   4054 ;skip to next line
      00952C 7B 02 C7 00 25   [ 1] 4055 	mov in,count
      009531 72               [ 4] 4056 9$:	ret 
                                   4057 
                                   4058 ;------------------------
                                   4059 ; BASIC: FOR var=expr 
                                   4060 ; set variable to expression 
                                   4061 ; leave variable address 
                                   4062 ; on stack and set
                                   4063 ; FLOOP bit in 'flags'
                                   4064 ;-----------------
                           000001  4065 	RETL1=1 ; return address  
                           000003  4066 	FSTEP=3  ; variable increment
                           000005  4067 	LIMIT=5 ; loop limit 
                           000007  4068 	CVAR=7   ; control variable 
                           000009  4069 	INW=9   ;  in.w saved
                           00000B  4070 	BPTR=11 ; baseptr saved
                           00000A  4071 	VSIZE=10  
      0016B2                       4072 for: ; { -- var_addr }
      009532 F2               [ 2] 4073 	popw x ; call return address 
      0016B3                       4074 	_vars VSIZE 
      009533 03 90            [ 2]    1     sub sp,#VSIZE 
      009535 9F               [ 2] 4075 	pushw x  ; RETL1 
      009536 5B 04            [ 1] 4076 	ld a,#TK_VAR 
      009538 81 40 28         [ 4] 4077 	call expect
      00953B 29 2C            [ 2] 4078 	ldw (CVAR,sp),x  ; control variable 
      00953D 23 2B 2D         [ 4] 4079 	call let_var 
      009540 2A 2F 25 95      [ 1] 4080 	bset flags,#FLOOP 
                                   4081 ; open space on stack for loop data 
      009544 4F               [ 1] 4082 	clrw x 
      009545 95 51            [ 2] 4083 	ldw (BPTR,sp),x 
      009547 95 53            [ 2] 4084 	ldw (INW,sp),x 
      009549 95 56 95         [ 4] 4085 	call next_token 
      00954C 58 95            [ 1] 4086 	cp a,#TK_CMD 
      00954E 5B 3E            [ 1] 4087 	jreq 1$
      009550 00 3D 00         [ 2] 4088 	jp syntax_error
      0016D3                       4089 1$:  
      009553 3E 3D 00         [ 2] 4090 	cpw x,#to 
      009556 3C 00            [ 1] 4091 	jreq to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009558 3C 3D 00         [ 2] 4092 	jp syntax_error 
                                   4093 
                                   4094 ;-----------------------------------
                                   4095 ; BASIC: TO expr 
                                   4096 ; second part of FOR loop initilization
                                   4097 ; leave limit on stack and set 
                                   4098 ; FTO bit in 'flags'
                                   4099 ;-----------------------------------
      0016DB                       4100 to: ; { var_addr -- var_addr limit step }
      00955B 3C 3E 00 23 03   [ 2] 4101 	btjt flags,#FLOOP,1$
      00955E CC 08 79         [ 2] 4102 	jp syntax_error
      00955E C7 00 04         [ 4] 4103 1$: call relation  
      009561 E6 02            [ 1] 4104 	cp a,#TK_INTGR 
      009563 C1 00            [ 1] 4105 	jreq 2$ 
      009565 04 2A 03         [ 2] 4106 	jp syntax_error
      009568 C7 00            [ 2] 4107 2$: ldw (LIMIT,sp),x
                                   4108 ;	ldw x,in.w 
      00956A 04 CF 00         [ 4] 4109 	call next_token
      00956D 05 90            [ 1] 4110 	cp a,#TK_NONE  
      00956F AE 16            [ 1] 4111 	jreq 4$ 
      009571 90 CD            [ 1] 4112 	cp a,#TK_CMD
      009573 93 F6            [ 1] 4113 	jrne 3$
      009575 CD A8 C0         [ 2] 4114 	cpw x,#step 
      009578 A6 0D            [ 1] 4115 	jreq step
      0016FF                       4116 3$:	
      0016FF                       4117 	_unget_token   	 
      00957A CD 83 40 81 01   [ 1]    1     mov in,in.saved
      00957E                       4118 4$:	
      00957E 4B 00 01         [ 2] 4119 	ldw x,#1   ; default step  
      009580 1F 03            [ 2] 4120 	ldw (FSTEP,sp),x 
      009580 0F 01            [ 2] 4121 	jra store_loop_addr 
                                   4122 
                                   4123 
                                   4124 ;----------------------------------
                                   4125 ; BASIC: STEP expr 
                                   4126 ; optional third par of FOR loop
                                   4127 ; initialization. 	
                                   4128 ;------------------------------------
      009582                       4129 step: ; {var limit -- var limit step}
      009582 CD 89 EB A1 02   [ 2] 4130 	btjt flags,#FLOOP,1$
      009587 25 5A A1         [ 2] 4131 	jp syntax_error
      00958A 02 27 12         [ 4] 4132 1$: call relation
      00958D A1 03            [ 1] 4133 	cp a,#TK_INTGR
      00958F 27 13            [ 1] 4134 	jreq 2$
      009591 A1 82 27         [ 2] 4135 	jp syntax_error
      009594 15 A1            [ 2] 4136 2$:	ldw (FSTEP,sp),x ; step
                                   4137 ; leave loop back entry point on cstack 
                                   4138 ; cstack is 1 call deep from interpreter
      00171F                       4139 store_loop_addr:
      009596 09 27 18         [ 2] 4140 	ldw x,basicptr  
      009599 A1 0A            [ 2] 4141 	ldw (BPTR,sp),x 
      00959B 27 1B 20         [ 2] 4142 	ldw x,in.w 
      00959E 2B 09            [ 2] 4143 	ldw (INW,sp),x   
      00959F 72 15 00 23      [ 1] 4144 	bres flags,#FLOOP 
      00959F CD A8 C0 20      [ 1] 4145 	inc loop_depth  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095A3 DC               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;--------------------------------
                                   4149 ; BASIC: NEXT var 
                                   4150 ; FOR loop control 
                                   4151 ; increment variable with step 
                                   4152 ; and compare with limit 
                                   4153 ; loop if threshold not crossed.
                                   4154 ; else stack. 
                                   4155 ; and decrement 'loop_depth' 
                                   4156 ;--------------------------------
      0095A4                       4157 next: ; {var limit step retl1 -- [var limit step ] }
      0095A4 9F CD 83 40      [ 1] 4158 	tnz loop_depth 
      0095A8 20 D6            [ 1] 4159 	jrne 1$ 
      0095AA CC 08 79         [ 2] 4160 	jp syntax_error 
      00173B                       4161 1$: 
      0095AA FD 9F            [ 1] 4162 	ld a,#TK_VAR 
      0095AC CD 83 40         [ 4] 4163 	call expect
                                   4164 ; check for good variable after NEXT 	 
      0095AF 20 CF            [ 2] 4165 	cpw x,(CVAR,sp)
      0095B1 27 03            [ 1] 4166 	jreq 2$  
      0095B1 A6 FF 6B         [ 2] 4167 	jp syntax_error ; not the good one 
      001747                       4168 2$: ; increment variable 
      0095B4 01               [ 2] 4169 	ldw x,(x)  ; get var value 
      0095B5 CC 95 82         [ 2] 4170 	addw x,(FSTEP,sp) ; var+step 
      0095B8 16 07            [ 2] 4171 	ldw y,(CVAR,sp)
      0095B8 CD 89            [ 2] 4172 	ldw (y),x ; save var new value 
                                   4173 ; check sign of STEP  
      0095BA EB A1            [ 1] 4174 	ld a,#0x80
      0095BC 84 27            [ 1] 4175 	bcp a,(FSTEP,sp)
      0095BE 03 CC            [ 1] 4176 	jrpl 4$
                                   4177 ;negative step 
      0095C0 88 F9            [ 2] 4178 	cpw x,(LIMIT,sp)
      0095C2 2F 1B            [ 1] 4179 	jrslt loop_done
      0095C2 9F A4            [ 2] 4180 	jra loop_back 
      00175B                       4181 4$: ; positive step
      0095C4 0F C7            [ 2] 4182 	cpw x,(LIMIT,sp)
      0095C6 00 25            [ 1] 4183 	jrsgt loop_done
      00175F                       4184 loop_back:
      0095C8 20 B6            [ 2] 4185 	ldw x,(BPTR,sp)
      0095CA CF 00 04         [ 2] 4186 	ldw basicptr,x 
      0095CA 55 00 03 00 02   [ 2] 4187 	btjf flags,#FRUN,1$ 
      0095CF CD 91            [ 1] 4188 	ld a,(2,x)
      0095D1 DA A1 84         [ 1] 4189 	ld count,a
      0095D4 27 08            [ 2] 4190 1$:	ldw x,(INW,sp)
      0095D6 55 00 03         [ 2] 4191 	ldw in.w,x 
      0095D9 00               [ 4] 4192 	ret 
      001774                       4193 loop_done:
                                   4194 	; remove loop data from stack  
      0095DA 02               [ 2] 4195 	popw x
      001775                       4196 	_drop VSIZE 
      0095DB CC 95            [ 2]    1     addw sp,#VSIZE 
      0095DD E3 CD 8A 4C      [ 1] 4197 	dec loop_depth 
                                   4198 ;	pushw x 
                                   4199 ;	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095E1 20               [ 2] 4200 	jp (x)
                                   4201 
                                   4202 ;----------------------------
                                   4203 ; called by goto/gosub
                                   4204 ; to get target line number 
                                   4205 ;---------------------------
      00177C                       4206 get_target_line:
      0095E2 9D 11 5A         [ 4] 4207 	call relation 
      0095E3 A1 84            [ 1] 4208 	cp a,#TK_INTGR
      0095E3 0D 01            [ 1] 4209 	jreq 1$
      0095E5 26 05 A6         [ 2] 4210 	jp syntax_error
      0095E8 0D CD 83         [ 4] 4211 1$:	call search_lineno  
      0095EB 40               [ 2] 4212 	tnzw x 
      0095EC 5B 01            [ 1] 4213 	jrne 2$ 
      0095EE 81 05            [ 1] 4214 	ld a,#ERR_NO_LINE 
      0095EF CC 08 7B         [ 2] 4215 	jp tb_error 
      0095EF CE               [ 4] 4216 2$:	ret 
                                   4217 
                                   4218 ;------------------------
                                   4219 ; BASIC: GOTO line# 
                                   4220 ; jump to line# 
                                   4221 ; here cstack is 2 call deep from interpreter 
                                   4222 ;------------------------
      001792                       4223 goto:
      0095F0 00 05 1F 03 C6   [ 2] 4224 	btjt flags,#FRUN,0$ 
      0095F5 00 02            [ 1] 4225 	ld a,#ERR_RUN_ONLY
      0095F7 6B 05 C6         [ 2] 4226 	jp tb_error 
      0095FA 00               [ 4] 4227 	ret 
      0095FB 04 6B 06         [ 4] 4228 0$:	call get_target_line
      0017A0                       4229 jp_to_target:
      0095FE 81 00 04         [ 2] 4230 	ldw basicptr,x 
      0095FF E6 02            [ 1] 4231 	ld a,(2,x)
      0095FF 1E 03 CF         [ 1] 4232 	ld count,a 
      009602 00 05 7B 05      [ 1] 4233 	mov in,#3 
      009606 C7               [ 4] 4234 	ret 
                                   4235 
                                   4236 
                                   4237 ;--------------------
                                   4238 ; BASIC: GOSUB line#
                                   4239 ; basic subroutine call
                                   4240 ; actual line# and basicptr 
                                   4241 ; are saved on cstack
                                   4242 ; here cstack is 2 call deep from interpreter 
                                   4243 ;--------------------
                           000003  4244 	RET_ADDR=3
                           000005  4245 	RET_INW=5
                           000004  4246 	VSIZE=4  
      0017AD                       4247 gosub:
      009607 00 02 7B 06 C7   [ 2] 4248 	btjt flags,#FRUN,0$ 
      00960C 00 04            [ 1] 4249 	ld a,#ERR_RUN_ONLY
      00960E 81 08 7B         [ 2] 4250 	jp tb_error 
      00960F 81               [ 4] 4251 	ret 
      00960F 52               [ 2] 4252 0$:	popw x 
      0017B9                       4253 	_vars VSIZE  
      009610 07 04            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009611 89               [ 2] 4254 	pushw x 
      009611 0F 05 CD         [ 2] 4255 	ldw x,basicptr
      009614 89 EB            [ 2] 4256 	ldw (RET_ADDR,sp),x 
      009616 A1 02 26         [ 4] 4257 	call get_target_line  
      009619 08               [ 2] 4258 	pushw x 
      00961A CD A8 C0         [ 2] 4259 	ldw x,in.w 
      00961D 03 05            [ 2] 4260 	ldw (RET_INW+2,sp),x
      00961F CD               [ 2] 4261 	popw x 
      009620 89 EB            [ 2] 4262 	jra jp_to_target
                                   4263 
                                   4264 ;------------------------
                                   4265 ; BASIC: RETURN 
                                   4266 ; exit from a subroutine 
                                   4267 ; 
                                   4268 ;------------------------
      0017CD                       4269 return:
      009622 A1 85 27 03 CC   [ 2] 4270 	btjt flags,#FRUN,0$ 
      009627 88 F9            [ 1] 4271 	ld a,#ERR_RUN_ONLY
      009629 1F 06 0D         [ 2] 4272 	jp tb_error 
      0017D7                       4273 0$:	
      00962C 05 26            [ 2] 4274 	ldw x,(RET_ADDR,sp) 
      00962E 06 CD 93         [ 2] 4275 	ldw basicptr,x
      009631 CD CD            [ 1] 4276 	ld a,(2,x)
      009633 83 40 03         [ 1] 4277 	ld count,a  
      009635 1E 05            [ 2] 4278 	ldw x,(RET_INW,sp)
      009635 A6 3A CD         [ 2] 4279 	ldw in.w,x 
      009638 83               [ 2] 4280 	popw x 
      0017E7                       4281 	_drop VSIZE 
      009639 40 CD            [ 2]    1     addw sp,#VSIZE 
      00963B 95               [ 2] 4282 	pushw x
      00963C EF               [ 4] 4283 	ret  
                                   4284 
                                   4285 
                                   4286 ;----------------------------------
                                   4287 ; BASIC: RUN
                                   4288 ; run BASIC program in RAM
                                   4289 ;----------------------------------- 
      0017EB                       4290 run: 
      00963D 72 5F 00 04 CD   [ 2] 4291 	btjf flags,#FRUN,0$  
      009642 A9               [ 1] 4292 	clr a 
      009643 C5               [ 4] 4293 	ret
      0017F2                       4294 0$: 
      009644 AE 16 90 3B 00   [ 2] 4295 	btjf flags,#FBREAK,1$
      0017F7                       4296 	_drop 2 
      009649 04 4B            [ 2]    1     addw sp,#2 
      00964B 00 72 FB         [ 4] 4297 	call rest_context
      0017FC                       4298 	_drop CTXT_SIZE 
      00964E 01 5C            [ 2]    1     addw sp,#CTXT_SIZE 
      009650 5B 02 72 5F      [ 1] 4299 	bres flags,#FBREAK 
      009654 00 02 CD 8C      [ 1] 4300 	bset flags,#FRUN 
      009658 70 A1 84         [ 2] 4301 	jp interpreter 
      00965B 27 06 CD         [ 2] 4302 1$:	ldw x,txtbgn
      00965E 95 FF CC         [ 2] 4303 	cpw x,txtend 
      009661 88 F9            [ 1] 4304 	jrmi run_it 
      009663 16 06 90         [ 2] 4305 	ldw x,#err_no_prog
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009666 FF CD 95         [ 4] 4306 	call puts 
      009669 FF CD 89 EB A1   [ 1] 4307 	mov in,count
      00966E 09               [ 4] 4308 	ret 
      00181D                       4309 run_it:	 
      00966F 27 A0 A1         [ 4] 4310     call ubound 
      001820                       4311 	_drop 2 ; drop return address 
      009672 01 23            [ 2]    1     addw sp,#2 
                                   4312 ; clear data pointer 
      009674 03               [ 1] 4313 	clrw x 
      009675 CC 88 F9         [ 2] 4314 	ldw data_ptr,x 
      009678 72 5F 00 08      [ 1] 4315 	clr data_ofs 
      009678 5B 07 81 09      [ 1] 4316 	clr data_len 
                                   4317 ; initialize BASIC pointer 
      00967B CE 00 1C         [ 2] 4318 	ldw x,txtbgn 
      00967B 55 00 04         [ 2] 4319 	ldw basicptr,x 
      00967E 00 02            [ 1] 4320 	ld a,(2,x)
      009680 81 00 03         [ 1] 4321 	ld count,a
      009681 35 03 00 01      [ 1] 4322 	mov in,#3	
      009681 52 04 0F 01      [ 1] 4323 	bset flags,#FRUN 
      009685 CD 90 98         [ 2] 4324 	jp interpreter 
                                   4325 
                                   4326 
                                   4327 ;----------------------
                                   4328 ; BASIC: END
                                   4329 ; end running program
                                   4330 ;---------------------- 
      001844                       4331 cmd_end: 
                                   4332 ; clean stack 
      009688 A1 02 24         [ 2] 4333 	ldw x,#STACK_EMPTY
      00968B 03               [ 1] 4334 	ldw sp,x 
      00968C CC 88 F9         [ 2] 4335 	jp warm_start
                                   4336 
                                   4337 ;-----------------
                                   4338 ; 1 Khz beep 
                                   4339 ;-----------------
      00184B                       4340 beep_1khz:: 
      00968F A1 03 25         [ 2] 4341 	ldw x,#100
      009692 04 85 9F 6B      [ 2] 4342 	ldw y,#1000
      009696 01 85            [ 2] 4343 	jra beep
                                   4344 
                                   4345 ;-----------------------
                                   4346 ; BASIC: TONE expr1,expr2
                                   4347 ; used TIMER2 channel 1
                                   4348 ; to produce a tone 
                                   4349 ; arguments:
                                   4350 ;    expr1   frequency 
                                   4351 ;    expr2   duration msec.
                                   4352 ;---------------------------
      001854                       4353 tone:
      009698 9F 6B 02         [ 4] 4354 	call arg_list 
      00969B 85 F6            [ 1] 4355 	cp a,#2 
      00969D 14 02            [ 1] 4356 	jreq 1$
      00969F 18 01 27         [ 2] 4357 	jp syntax_error 
      00185E                       4358 1$: 
      0096A2 F9               [ 2] 4359 	popw x ; duration
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096A3 5B 04            [ 2] 4360 	popw y ; frequency 
      001861                       4361 beep:  
      0096A5 81               [ 2] 4362 	pushw x 
      0096A6 AE F4 24         [ 2] 4363 	ldw x,#TIM2_CLK_FREQ
      0096A6 CD               [ 2] 4364 	divw x,y 
                                   4365 ; round to nearest integer 
      0096A7 90 98 A1 02      [ 2] 4366 	cpw y,#TIM2_CLK_FREQ/2
      0096AB 27 03            [ 1] 4367 	jrmi 2$
      0096AD CC               [ 2] 4368 	incw x 
      00186D                       4369 2$:	 
      0096AE 88               [ 1] 4370 	ld a,xh 
      0096AF F9 53 0D         [ 1] 4371 	ld TIM2_ARRH,a 
      0096B0 9F               [ 1] 4372 	ld a,xl 
      0096B0 85 9F 85         [ 1] 4373 	ld TIM2_ARRL,a 
                                   4374 ; 50% duty cycle 
      0096B3 FA               [ 1] 4375 	ccf 
      0096B4 F7               [ 2] 4376 	rrcw x 
      0096B5 81               [ 1] 4377 	ld a,xh 
      0096B6 C7 53 0F         [ 1] 4378 	ld TIM2_CCR1H,a 
      0096B6 CD               [ 1] 4379 	ld a,xl
      0096B7 90 98 A1         [ 1] 4380 	ld TIM2_CCR1L,a
      0096BA 02 27 03 CC      [ 1] 4381 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0096BE 88 F9 53 00      [ 1] 4382 	bset TIM2_CR1,#TIM2_CR1_CEN
      0096C0 72 10 53 04      [ 1] 4383 	bset TIM2_EGR,#TIM2_EGR_UG
      0096C0 85               [ 2] 4384 	popw x 
      0096C1 9F 43 85         [ 4] 4385 	call pause02
      0096C4 F4 F7 81 08      [ 1] 4386 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0096C7 72 11 53 00      [ 1] 4387 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0096C7 CD               [ 4] 4388 	ret 
                                   4389 
                                   4390 ;-------------------------------
                                   4391 ; BASIC: ADCON 0|1 [,divisor]  
                                   4392 ; disable/enanble ADC 
                                   4393 ;-------------------------------
                           000003  4394 	ONOFF=3 
                           000001  4395 	DIVSOR=1
                           000004  4396 	VSIZE=4 
      001898                       4397 power_adc:
      0096C8 90 98 A1         [ 4] 4398 	call arg_list 
      0096CB 02 27            [ 1] 4399 	cp a,#2	
      0096CD 03 CC            [ 1] 4400 	jreq 1$
      0096CF 88 F9            [ 1] 4401 	cp a,#1 
      0096D1 85 9F            [ 1] 4402 	jreq 0$ 
      0096D3 85 F8 F7         [ 2] 4403 	jp syntax_error 
      0096D6 81 00 00         [ 2] 4404 0$: ldw x,#0
      0096D7 89               [ 2] 4405 	pushw x  ; divisor 
      0096D7 CD 90            [ 2] 4406 1$: ldw x,(ONOFF,sp)
      0096D9 93               [ 2] 4407 	tnzw x 
      0096DA A1 02            [ 1] 4408 	jreq 2$ 
      0096DC 27 03            [ 2] 4409 	ldw x,(DIVSOR,sp) ; divisor 
      0096DE CC               [ 1] 4410 	ld a,xl
      0096DF 88 F9            [ 1] 4411 	and a,#7
      0096E1 4E               [ 1] 4412 	swap a 
      0096E1 85 9F A4         [ 1] 4413 	ld ADC_CR1,a
      0096E4 07 88 A6 01      [ 1] 4414 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0096E8 0D 01 27 05      [ 1] 4415 	bset ADC_CR1,#ADC_CR1_ADON 
      0018C0                       4416 	_usec_dly 7 
      0096EC 48 0A 01         [ 2]    1     ldw x,#(16*7-2)/4
      0096EF 20               [ 2]    2     decw x
      0096F0 F7               [ 1]    3     nop 
      0096F1 5B 01            [ 1]    4     jrne .-4
      0096F3 85 F4            [ 2] 4417 	jra 3$
      0096F5 27 02 A6 01      [ 1] 4418 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096F9 5F 97 A6 84      [ 1] 4419 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0018D1                       4420 3$:	_drop VSIZE 
      0096FD 81 04            [ 2]    1     addw sp,#VSIZE 
      0096FE 81               [ 4] 4421 	ret
                                   4422 
                                   4423 ;-----------------------------
                                   4424 ; BASIC: ADCREAD (channel)
                                   4425 ; read adc channel {0..5}
                                   4426 ; output:
                                   4427 ;   A 		TK_INTGR 
                                   4428 ;   X 		value 
                                   4429 ;-----------------------------
      0018D4                       4430 analog_read:
      0096FE CD 90 98         [ 4] 4431 	call func_args 
      009701 A1 02            [ 1] 4432 	cp a,#1 
      009703 27 03            [ 1] 4433 	jreq 1$
      009705 CC 88 F9         [ 2] 4434 	jp syntax_error
      009708 85               [ 2] 4435 1$: popw x 
      009708 85 9F 85         [ 2] 4436 	cpw x,#5 
      00970B F7 81            [ 2] 4437 	jrule 2$
      00970D A6 0A            [ 1] 4438 	ld a,#ERR_BAD_VALUE
      00970D CD 90 93         [ 2] 4439 	jp tb_error 
      009710 A1               [ 1] 4440 2$: ld a,xl
      009711 01 27 03         [ 1] 4441 	ld acc8,a 
      009714 CC 88            [ 1] 4442 	ld a,#5
      009716 F9 85 F6         [ 1] 4443 	sub a,acc8 
      009719 5F 97 A6         [ 1] 4444 	ld ADC_CSR,a
      00971C 84 81 54 02      [ 1] 4445 	bset ADC_CR2,#ADC_CR2_ALIGN
      00971E 72 10 54 01      [ 1] 4446 	bset ADC_CR1,#ADC_CR1_ADON
      00971E CD 91 DA A1 84   [ 2] 4447 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009723 27 03 CC         [ 2] 4448 	ldw x,ADC_DRH
      009726 88 F9            [ 1] 4449 	ld a,#TK_INTGR
      009728 4F               [ 4] 4450 	ret 
                                   4451 
                                   4452 ;-----------------------
                                   4453 ; BASIC: DREAD(pin)
                                   4454 ; Arduino pins 
                                   4455 ; read state of a digital pin 
                                   4456 ; pin# {0..15}
                                   4457 ; output:
                                   4458 ;    A 		TK_INTGR
                                   4459 ;    X      0|1 
                                   4460 ;-------------------------
                           000001  4461 	PINNO=1
                           000001  4462 	VSIZE=1
      001908                       4463 digital_read:
      001908                       4464 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009729 5D 26            [ 2]    1     sub sp,#VSIZE 
      00972B 05 55 00         [ 4] 4465 	call func_args
      00972E 04 00            [ 1] 4466 	cp a,#1
      009730 02 81            [ 1] 4467 	jreq 1$
      009732 CC 08 79         [ 2] 4468 	jp syntax_error
      009732 85               [ 2] 4469 1$: popw x 
      009733 52 0A 89         [ 2] 4470 	cpw x,#15 
      009736 A6 85            [ 2] 4471 	jrule 2$
      009738 CD 90            [ 1] 4472 	ld a,#ERR_BAD_VALUE
      00973A 86 1F 07         [ 2] 4473 	jp tb_error 
      00973D CD 92 BD         [ 4] 4474 2$:	call select_pin 
      009740 72 14            [ 1] 4475 	ld (PINNO,sp),a
      009742 00 24            [ 1] 4476 	ld a,(GPIO_IDR,x)
      009744 5F 1F            [ 1] 4477 	tnz (PINNO,sp)
      009746 0B 1F            [ 1] 4478 	jreq 8$
      009748 09               [ 1] 4479 3$: srl a 
      009749 CD 89            [ 1] 4480 	dec (PINNO,sp)
      00974B EB A1            [ 1] 4481 	jrne 3$ 
      00974D 80 27            [ 1] 4482 8$: and a,#1 
      00974F 03               [ 1] 4483 	clrw x 
      009750 CC               [ 1] 4484 	ld xl,a 
      009751 88 F9            [ 1] 4485 	ld a,#TK_INTGR
      009753                       4486 	_drop VSIZE
      009753 A3 97            [ 2]    1     addw sp,#VSIZE 
      009755 5B               [ 4] 4487 	ret
                                   4488 
                                   4489 ;-----------------------
                                   4490 ; BASIC: DWRITE pin,0|1
                                   4491 ; Arduino pins 
                                   4492 ; write to a digital pin 
                                   4493 ; pin# {0..15}
                                   4494 ; output:
                                   4495 ;    A 		TK_INTGR
                                   4496 ;    X      0|1 
                                   4497 ;-------------------------
                           000001  4498 	PINNO=1
                           000002  4499 	PINVAL=2
                           000002  4500 	VSIZE=2
      001938                       4501 digital_write:
      001938                       4502 	_vars VSIZE 
      009756 27 03            [ 2]    1     sub sp,#VSIZE 
      009758 CC 88 F9         [ 4] 4503 	call arg_list  
      00975B A1 02            [ 1] 4504 	cp a,#2 
      00975B 72 04            [ 1] 4505 	jreq 1$
      00975D 00 24 03         [ 2] 4506 	jp syntax_error
      009760 CC               [ 2] 4507 1$: popw x 
      009761 88               [ 1] 4508 	ld a,xl 
      009762 F9 CD            [ 1] 4509 	ld (PINVAL,sp),a
      009764 91               [ 2] 4510 	popw x 
      009765 DA A1 84         [ 2] 4511 	cpw x,#15 
      009768 27 03            [ 2] 4512 	jrule 2$
      00976A CC 88            [ 1] 4513 	ld a,#ERR_BAD_VALUE
      00976C F9 1F 05         [ 2] 4514 	jp tb_error 
      00976F CD 89 EB         [ 4] 4515 2$:	call select_pin 
      009772 A1 00            [ 1] 4516 	ld (PINNO,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009774 27 0E            [ 1] 4517 	ld a,#1
      009776 A1 80            [ 1] 4518 	tnz (PINNO,sp)
      009778 26 05            [ 1] 4519 	jreq 4$
      00977A A3               [ 1] 4520 3$: sll a
      00977B 97 8B            [ 1] 4521 	dec (PINNO,sp)
      00977D 27 0C            [ 1] 4522 	jrne 3$
      00977F 0D 02            [ 1] 4523 4$: tnz (PINVAL,sp)
      00977F 55 00            [ 1] 4524 	jrne 5$
      009781 03               [ 1] 4525 	cpl a 
      009782 00 02            [ 1] 4526 	and a,(GPIO_ODR,x)
      009784 20 02            [ 2] 4527 	jra 8$
      009784 AE 00            [ 1] 4528 5$: or a,(GPIO_ODR,x)
      009786 01 1F            [ 1] 4529 8$: ld (GPIO_ODR,x),a 
      001970                       4530 	_drop VSIZE 
      009788 03 20            [ 2]    1     addw sp,#VSIZE 
      00978A 14               [ 4] 4531 	ret
                                   4532 
                                   4533 
                                   4534 ;-----------------------
                                   4535 ; BASIC: STOP
                                   4536 ; stop progam execution  
                                   4537 ; without resetting pointers 
                                   4538 ; the program is resumed
                                   4539 ; with RUN 
                                   4540 ;-------------------------
      00978B                       4541 stop:
      00978B 72 04 00 24 03   [ 2] 4542 	btjt flags,#FRUN,2$
      009790 CC               [ 1] 4543 	clr a
      009791 88               [ 4] 4544 	ret 
      00197A                       4545 2$:	 
                                   4546 ; create space on cstack to save context 
      009792 F9 CD 91         [ 2] 4547 	ldw x,#break_point 
      009795 DA A1 84         [ 4] 4548 	call puts 
      001980                       4549 	_drop 2 ;drop return address 
      009798 27 03            [ 2]    1     addw sp,#2 
      001982                       4550 	_vars CTXT_SIZE ; context size 
      00979A CC 88            [ 2]    1     sub sp,#CTXT_SIZE 
      00979C F9 1F 03         [ 4] 4551 	call save_context 
      00979F AE 16 90         [ 2] 4552 	ldw x,#tib 
      00979F CE 00 05         [ 2] 4553 	ldw basicptr,x
      0097A2 1F               [ 1] 4554 	clr (x)
      0097A3 0B CE 00 01      [ 1] 4555 	clr count  
      0097A7 1F               [ 1] 4556 	clrw x 
      0097A8 09 72 15         [ 2] 4557 	ldw in.w,x
      0097AB 00 24 72 5C      [ 1] 4558 	bres flags,#FRUN 
      0097AF 00 21 81 23      [ 1] 4559 	bset flags,#FBREAK
      0097B2 CC 09 1F         [ 2] 4560 	jp interpreter 
      0097B2 72 5D 00 21 26 03 CC  4561 break_point: .asciz "\nbreak point, RUN to resume.\n"
             88 F9 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4562 
                                   4563 ;-----------------------
                                   4564 ; BASIC: NEW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4565 ; from command line only 
                                   4566 ; free program memory
                                   4567 ; and clear variables 
                                   4568 ;------------------------
      0097BB                       4569 new: 
      0097BB A6 85 CD 90 86   [ 2] 4570 	btjf flags,#FRUN,0$ 
      0097C0 13               [ 4] 4571 	ret 
      0019C5                       4572 0$:	
      0097C1 07 27 03         [ 4] 4573 	call clear_basic 
      0097C4 CC               [ 4] 4574 	ret 
                                   4575 	 
                                   4576 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4577 ;  file system routines
                                   4578 ;  MCU flash memory from
                                   4579 ;  0x10000-0x27fff is 
                                   4580 ;  used to store BASIC 
                                   4581 ;  program files. 
                                   4582 ;  use 128 bytes sectors
                                   4583 ;  because this is the MCU 
                                   4584 ;  row size.
                                   4585 ;  file entry aligned to row
                                   4586 ;  	name  variable length
                                   4587 ;  	size  2 bytes  
                                   4588 ; 	data  variable length 
                                   4589 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4590 
                                   4591 ;---------------------------
                                   4592 ; fill pad with zeros 
                                   4593 ;--------------------------
      0019C9                       4594 zero_pad:
      0097C5 88 F9 E0         [ 2] 4595 	ldw x,#pad 
      0097C7 A6 80            [ 1] 4596 	ld a,#PAD_SIZE 
      0097C7 FE               [ 1] 4597 1$:	clr (x)
      0097C8 72               [ 2] 4598 	incw x 
      0097C9 FB               [ 1] 4599 	dec a 
      0097CA 03 16            [ 1] 4600 	jrne 1$
      0097CC 07               [ 4] 4601 	ret 
                                   4602 
                                   4603 ;--------------------------
                                   4604 ; align farptr to BLOCK_SIZE 
                                   4605 ;---------------------------
      0019D4                       4606 row_align:
      0097CD 90 FF            [ 1] 4607 	ld a,#0x7f 
      0097CF A6 80 15         [ 1] 4608 	and a,farptr+2 
      0097D2 03 2A            [ 1] 4609 	jreq 1$ 
      0097D4 06 13 05         [ 2] 4610 	ldw x,farptr+1 
      0097D7 2F 1B 20         [ 2] 4611 	addw x,#BLOCK_SIZE 
      0097DA 04 04            [ 1] 4612 	jrnc 0$
      0097DB 72 5C 00 16      [ 1] 4613 	inc farptr 
      0097DB 13               [ 1] 4614 0$: ld a,xl 
      0097DC 05 2C            [ 1] 4615 	and a,#0x80
      0097DE 15               [ 1] 4616 	ld xl,a
      0097DF CF 00 17         [ 2] 4617 	ldw farptr+1,x  	
      0097DF 1E               [ 4] 4618 1$:	ret
                                   4619 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4620 ;--------------------
                                   4621 ; input:
                                   4622 ;   X     increment 
                                   4623 ; output:
                                   4624 ;   farptr  incremented 
                                   4625 ;---------------------
      0019EF                       4626 incr_farptr:
      0097E0 0B CF 00 05      [ 2] 4627 	addw x,farptr+1 
      0097E4 72 01            [ 1] 4628 	jrnc 1$
      0097E6 00 24 05 E6      [ 1] 4629 	inc farptr 
      0097EA 02 C7 00         [ 2] 4630 1$:	ldw farptr+1,x  
      0097ED 04               [ 4] 4631 	ret 
                                   4632 
                                   4633 ;------------------------------
                                   4634 ; extended flash memory used as FLASH_DRIVE 
                                   4635 ; seek end of used flash drive   
                                   4636 ; starting at 0x10000 address.
                                   4637 ; 4 consecutives 0 bytes signal free space. 
                                   4638 ; input:
                                   4639 ;	none
                                   4640 ; output:
                                   4641 ;   ffree     free_addr| 0 if memory full.
                                   4642 ;------------------------------
      0019FD                       4643 seek_fdrive:
                                   4644 ; start scan at 0x10000 address 
      0097EE 1E 09            [ 1] 4645 	ld a,#1
      0097F0 CF 00 01         [ 1] 4646 	ld farptr,a 
      0097F3 81               [ 1] 4647 	clrw x 
      0097F4 CF 00 17         [ 2] 4648 	ldw farptr+1,x 
      001A06                       4649 1$:
      0097F4 85 5B 0A         [ 2] 4650 	ldw x,#3  
      0097F7 72 5A 00 21      [ 5] 4651 2$:	ldf a,([farptr],x) 
      0097FB FC 05            [ 1] 4652 	jrne 3$
      0097FC 5A               [ 2] 4653 	decw x
      0097FC CD 91            [ 1] 4654 	jrpl 2$
      0097FE DA A1            [ 2] 4655 	jra 4$ 
      009800 84 27 03         [ 2] 4656 3$:	ldw x,#BLOCK_SIZE 
      009803 CC 88 F9         [ 4] 4657 	call incr_farptr
      009806 CD 84 82         [ 2] 4658 	ldw x,#0x280  
      009809 5D 26 05         [ 2] 4659 	cpw x,farptr
      00980C A6 05            [ 1] 4660 	jrmi 1$
      001A22                       4661 4$: ; copy farptr to ffree	 
      00980E CC 88 FB         [ 2] 4662 	ldw x,farptr 
      009811 81 00 18         [ 1] 4663 	ld a,farptr+2 
      009812 CF 00 19         [ 2] 4664 	ldw ffree,x 
      009812 72 00 00         [ 1] 4665 	ld ffree+2,a  
      009815 24               [ 4] 4666 	ret 
                                   4667 
                                   4668 ;-----------------------
                                   4669 ; return amount of free 
                                   4670 ; space on flash drive
                                   4671 ; input:
                                   4672 ;   none
                                   4673 ; output:
                                   4674 ;   acc24   free space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4675 ;-----------------------
      001A2F                       4676 disk_free:
      009816 06 A6 06         [ 2] 4677 	ldw x,#0x8000
      009819 CC 88 FB 81      [ 2] 4678 	subw x,ffree+1
      00981D CD 97            [ 1] 4679 	ld a,#2
      00981F FC 00 19         [ 1] 4680 	sbc a,ffree 
      009820 C7 00 0B         [ 1] 4681 	ld acc24,a 
      009820 CF 00 05         [ 2] 4682 	ldw acc16,x 
      009823 E6               [ 4] 4683 	ret 
                                   4684 
                                   4685 ;-----------------------
                                   4686 ; compare file name 
                                   4687 ; with name pointed by Y  
                                   4688 ; input:
                                   4689 ;   farptr   file name 
                                   4690 ;   Y        target name 
                                   4691 ; output:
                                   4692 ;   farptr 	 at file_name
                                   4693 ;   X 		 farptr[x] point at size field  
                                   4694 ;   Carry    0|1 no match|match  
                                   4695 ;----------------------
      001A42                       4696 cmp_name:
      009824 02               [ 1] 4697 	clrw x
      009825 C7 00 04 35      [ 5] 4698 1$:	ldf a,([farptr],x)
      009829 03 00            [ 1] 4699 	cp a,(y)
      00982B 02 81            [ 1] 4700 	jrne 4$
      00982D 4D               [ 1] 4701 	tnz a 
      00982D 72 00            [ 1] 4702 	jreq 9$ 
      00982F 00               [ 2] 4703     incw x 
      009830 24 06            [ 2] 4704 	incw y 
      009832 A6 06            [ 2] 4705 	jra 1$
      001A53                       4706 4$: ;no match 
      009834 CC               [ 1] 4707 	tnz a 
      009835 88 FB            [ 1] 4708 	jreq 5$
      009837 81               [ 2] 4709 	incw x 
      009838 85 52 04 89      [ 5] 4710 	ldf a,([farptr],x)
      00983C CE 00            [ 2] 4711 	jra 4$  
      00983E 05               [ 2] 4712 5$:	incw x ; farptr[x] point at 'size' field 
      00983F 1F               [ 1] 4713 	rcf 
      009840 03               [ 4] 4714 	ret
      001A60                       4715 9$: ; match  
      009841 CD               [ 2] 4716 	incw x  ; farptr[x] at 'size' field 
      009842 97               [ 1] 4717 	scf 
      009843 FC               [ 4] 4718 	ret 
                                   4719 
                                   4720 ;-----------------------
                                   4721 ; search file in 
                                   4722 ; flash memory 
                                   4723 ; input:
                                   4724 ;   Y       file name  
                                   4725 ; output:
                                   4726 ;   farptr  addr at name|0
                                   4727 ;   X       offset to size field
                                   4728 ;-----------------------
                           000001  4729 	FSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                           000003  4730 	YSAVE=3
                           000004  4731 	VSIZE=4 
      001A63                       4732 search_file: 
      001A63                       4733 	_vars VSIZE
      009844 89 CE            [ 2]    1     sub sp,#VSIZE 
      009846 00 01            [ 2] 4734 	ldw (YSAVE,sp),y  
      009848 1F               [ 1] 4735 	clrw x 
      009849 07 85 20         [ 2] 4736 	ldw farptr+1,x 
      00984C D3 01 00 16      [ 1] 4737 	mov farptr,#1
      00984D                       4738 1$:	
                                   4739 ; check if farptr is after any file 
                                   4740 ; if  0 then so.
      00984D 72 00 00 24      [ 5] 4741 	ldf a,[farptr]
      009851 05 A6            [ 1] 4742 	jreq 6$
      009853 06               [ 1] 4743 2$: clrw x 	
      009854 CC 88            [ 2] 4744 	ldw y,(YSAVE,sp) 
      009856 FB 1A 42         [ 4] 4745 	call cmp_name
      009857 25 2F            [ 1] 4746 	jrc 9$
      009857 1E 03 CF 00      [ 5] 4747 	ldf a,([farptr],x)
      00985B 05 E6            [ 1] 4748 	ld (FSIZE,sp),a 
      00985D 02               [ 2] 4749 	incw x 
      00985E C7 00 04 1E      [ 5] 4750 	ldf a,([farptr],x)
      009862 05 CF            [ 1] 4751 	ld (FSIZE+1,sp),a 
      009864 00               [ 2] 4752 	incw x 
      009865 01 85 5B         [ 2] 4753 	addw x,(FSIZE,sp) ; skip over file data
      009868 04 89 81         [ 4] 4754 	call incr_farptr
      00986B CD 19 D4         [ 4] 4755 	call row_align  
      00986B 72 01 00         [ 2] 4756 	ldw x,#0x280
      00986E 24 02 4F         [ 2] 4757 	cpw x,farptr 
      009871 81 D3            [ 1] 4758 	jrpl 1$
      009872                       4759 6$: ; file not found 
      009872 72 09 00 24      [ 1] 4760 	clr farptr
      009876 12 5B 02 CD      [ 1] 4761 	clr farptr+1 
      00987A 95 FF 5B 04      [ 1] 4762 	clr farptr+2 
      001AA8                       4763 	_drop VSIZE 
      00987E 72 19            [ 2]    1     addw sp,#VSIZE 
      009880 00               [ 1] 4764 	rcf
      009881 24               [ 4] 4765 	ret
      001AAC                       4766 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AAC                       4767 	_drop VSIZE 
      009882 72 10            [ 2]    1     addw sp,#VSIZE 
      009884 00               [ 1] 4768 	scf 	
      009885 24               [ 4] 4769 	ret
                                   4770 
                                   4771 ;--------------------------------
                                   4772 ; BASIC: SAVE "name" 
                                   4773 ; save text program in 
                                   4774 ; flash memory used as permanent
                                   4775 ; storage from address 0x10000-0x27fff 
                                   4776 ;--------------------------------
                           000001  4777 	BSIZE=1
                           000003  4778 	NAMEPTR=3
                           000005  4779 	XSAVE=5
                           000007  4780 	YSAVE=7
                           000008  4781 	VSIZE=8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001AB0                       4782 save:
      009886 CC 89 9F CE 00   [ 2] 4783 	btjf flags,#FRUN,0$ 
      00988B 1D C3            [ 1] 4784 	ld a,#ERR_CMD_ONLY 
      00988D 00 1F 2B         [ 2] 4785 	jp tb_error
      001ABA                       4786 0$:	 
      009890 0C AE 88         [ 2] 4787 	ldw x,txtend 
      009893 94 CD A8 C0      [ 2] 4788 	subw x,txtbgn
      009897 55 00            [ 1] 4789 	jrne 1$
                                   4790 ; nothing to save 
      009899 04 00 02         [ 2] 4791 	ldw x,#err_no_prog 
      00989C 81 00 00         [ 4] 4792 	call puts 
      00989D 55 00 03 00 01   [ 1] 4793 	mov in,count 
      00989D CD               [ 4] 4794 	ret  	
      001ACF                       4795 1$:	
      001ACF                       4796 	_vars VSIZE 
      00989E 92 8A            [ 2]    1     sub sp,#VSIZE 
      0098A0 5B 02            [ 2] 4797 	ldw (BSIZE,sp),x 
      0098A2 5F CF 00         [ 4] 4798 	call next_token	
      0098A5 07 72            [ 1] 4799 	cp a,#TK_QSTR
      0098A7 5F 00            [ 1] 4800 	jreq 2$
      0098A9 09 72 5F         [ 2] 4801 	jp syntax_error
      001ADD                       4802 2$: 
      0098AC 00 0A            [ 2] 4803 	ldw (NAMEPTR,sp),x  
      0098AE CE 00 1D         [ 4] 4804 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4805 ; check if enough free space 
      0098B1 CF 00 05         [ 4] 4806 	call strlen 
      0098B4 E6 02            [ 1] 4807 	add a,#3
      0098B6 C7               [ 1] 4808 	clrw x 
      0098B7 00               [ 1] 4809 	ld xl,a 
      0098B8 04 35 03         [ 2] 4810 	addw x,(BSIZE,sp)
      0098BB 00               [ 1] 4811 	clr a 
      0098BC 02 72 10 00      [ 2] 4812 	addw x,ffree+1 
      0098C0 24 CC 89         [ 1] 4813 	adc a,ffree 
      0098C3 9F 02            [ 1] 4814 	cp a,#2
      0098C4 2B 0A            [ 1] 4815 	jrmi 21$
      0098C4 AE 17 FF         [ 2] 4816 	cpw x,#0x8000
      0098C7 94 CC            [ 1] 4817 	jrmi 21$
      0098C9 89 80            [ 1] 4818 	ld a,#ERR_NO_FSPACE  
      0098CB CC 08 7B         [ 2] 4819 	jp tb_error
      001B02                       4820 21$: 
                                   4821 ; check for existing file of that name 
      0098CB AE 00            [ 2] 4822 	ldw y,(NAMEPTR,sp)	
      0098CD 64 90 AE         [ 4] 4823 	call search_file 
      0098D0 03 E8            [ 1] 4824 	jrnc 3$ 
      0098D2 20 0D            [ 1] 4825 	ld a,#ERR_DUPLICATE 
      0098D4 CC 08 7B         [ 2] 4826 	jp tb_error 
      001B0E                       4827 3$:	; initialize farptr 
      0098D4 CD 90 98         [ 2] 4828 	ldw x,ffree 
      0098D7 A1 02 27         [ 1] 4829 	ld a,ffree+2 
      0098DA 03 CC 88         [ 2] 4830 	ldw farptr,x 
      0098DD F9 00 18         [ 1] 4831 	ld farptr+2,a 
                                   4832 ;** write file name to row buffer **	
      0098DE 16 03            [ 2] 4833 	ldw y,(NAMEPTR,sp)  
      0098DE 85 90 85         [ 2] 4834 	ldw x,#pad 
      0098E1 CD 03 B2         [ 4] 4835 	call strcpy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098E1 89 AE F4         [ 4] 4836 	call strlen 
      0098E4 24               [ 1] 4837 	clrw x 
      0098E5 65               [ 1] 4838 	ld xl,a 
      0098E6 90               [ 2] 4839 	incw  x
      0098E7 A3 7A 12         [ 2] 4840 	addw x,#pad 
                                   4841 ; ** write file size to row buffer 
      0098EA 2B 01            [ 2] 4842 	ldw y,(BSIZE,sp)
      0098EC 5C               [ 2] 4843 	ldw (x),y 
      0098ED 1C 00 02         [ 2] 4844 	addw x,#2 
                                   4845 ; ** write file data to row buffer 
      0098ED 9E C7 53 0D      [ 2] 4846 	ldw y,txtbgn 
      0098F1 9F C7            [ 1] 4847 6$:	ld a,(y)
      0098F3 53 0E            [ 2] 4848 	incw y
      0098F5 8C               [ 1] 4849 	ld (x),a 
      0098F6 56               [ 2] 4850 	incw x
      0098F7 9E C7 53 0F      [ 2] 4851 	cpw y,txtend 
      0098FB 9F C7            [ 1] 4852 	jreq 12$
      0098FD 53 10 72         [ 2] 4853 	cpw x,#stack_full 
      009900 10 53            [ 1] 4854 	jrmi 6$
      001B46                       4855 12$:
      009902 08 72            [ 2] 4856 	ldw (YSAVE,sp),y 
      001B48                       4857 14$: ; zero buffer end 
      009904 10 53 00         [ 2] 4858 	cpw x,#stack_full
      009907 72 10            [ 1] 4859 	jreq 16$
      009909 53               [ 1] 4860 	clr (x)
      00990A 04               [ 2] 4861 	incw x 
      00990B 85 CD            [ 2] 4862 	jra 14$
      001B51                       4863 16$:
      00990D 9E 8A 72         [ 2] 4864 	ldw x,#pad 
      009910 11 53 08         [ 4] 4865 	call write_row 
      009913 72 11 53         [ 2] 4866 	ldw x,#BLOCK_SIZE 
      009916 00 81 EF         [ 4] 4867 	call incr_farptr
      009918 AE 16 E0         [ 2] 4868 	ldw x,#pad 
      009918 CD 90            [ 2] 4869 	ldw y,(YSAVE,sp)
      00991A 98 A1 02 27      [ 2] 4870 	cpw y,txtend 
      00991E 0B A1            [ 1] 4871 	jrmi 6$
                                   4872 ; save farptr in ffree
      009920 01 27 03         [ 2] 4873 	ldw x,farptr 
      009923 CC 88 F9         [ 1] 4874 	ld a,farptr+2 
      009926 AE 00 00         [ 2] 4875 	ldw ffree,x 
      009929 89 1E 03         [ 1] 4876 	ld ffree+2,a
                                   4877 ; print file size 	
      00992C 5D 27            [ 2] 4878 	ldw x,(BSIZE,sp) 
      00992E 1A 1E 01         [ 4] 4879 	call print_int 
      001B79                       4880 	_drop VSIZE 
      009931 9F A4            [ 2]    1     addw sp,#VSIZE 
      009933 07               [ 4] 4881 	ret 
                                   4882 
                                   4883 ;----------------------
                                   4884 ; load file in RAM memory
                                   4885 ; input:
                                   4886 ;    farptr point at file size 
                                   4887 ; output:
                                   4888 ;   y point after BASIC program in RAM.
                                   4889 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001B7C                       4890 load_file:
      009934 4E C7 54         [ 4] 4891 	call incr_farptr  
      009937 01 72 16         [ 4] 4892 	call clear_basic  
      00993A 50               [ 1] 4893 	clrw x
      00993B CA 72 10 54      [ 5] 4894 	ldf a,([farptr],x)
      00993F 01 AE            [ 1] 4895 	ld yh,a 
      009941 00               [ 2] 4896 	incw x  
      009942 1B 5A 9D 26      [ 5] 4897 	ldf a,([farptr],x)
      009946 FA               [ 2] 4898 	incw x 
      009947 20 08            [ 1] 4899 	ld yl,a 
      009949 72 11 54 01      [ 2] 4900 	addw y,txtbgn
      00994D 72 17 50 CA      [ 2] 4901 	ldw txtend,y
      009951 5B 04 81 1C      [ 2] 4902 	ldw y,txtbgn
      009954                       4903 3$:	; load BASIC text 	
      009954 CD 90 93 A1      [ 5] 4904 	ldf a,([farptr],x)
      009958 01 27            [ 1] 4905 	ld (y),a 
      00995A 03               [ 2] 4906 	incw x 
      00995B CC 88            [ 2] 4907 	incw y 
      00995D F9 85 A3 00      [ 2] 4908 	cpw y,txtend 
      009961 05 23            [ 1] 4909 	jrmi 3$
      009963 05               [ 4] 4910 	ret 
                                   4911 
                                   4912 ;------------------------
                                   4913 ; BASIC: LOAD "file" 
                                   4914 ; load file to RAM 
                                   4915 ; for execution 
                                   4916 ;------------------------
      001BAD                       4917 load:
      009964 A6 0A CC 88 FB   [ 2] 4918 	btjf flags,#FRUN,0$ 
      009969 9F C7            [ 1] 4919 	jreq 0$ 
      00996B 00 0E            [ 1] 4920 	ld a,#ERR_CMD_ONLY 
      00996D A6 05 C0         [ 2] 4921 	jp tb_error 
      001BB9                       4922 0$:	
      009970 00 0E C7         [ 4] 4923 	call next_token 
      009973 54 00            [ 1] 4924 	cp a,#TK_QSTR
      009975 72 16            [ 1] 4925 	jreq 1$
      009977 54 02 72         [ 2] 4926 	jp syntax_error 
      00997A 10 54            [ 1] 4927 1$:	ldw y,x 
      00997C 01 72 0F         [ 4] 4928 	call search_file 
      00997F 54 00            [ 1] 4929 	jrc 2$ 
      009981 FB CE            [ 1] 4930 	ld a,#ERR_NOT_FILE
      009983 54 04 A6         [ 2] 4931 	jp tb_error  
      001BCF                       4932 2$:
      009986 84 81 7C         [ 4] 4933 	call load_file
                                   4934 ; print loaded size 	 
      009988 CE 00 1E         [ 2] 4935 	ldw x,txtend 
      009988 52 01 CD 90      [ 2] 4936 	subw x,txtbgn
      00998C 93 A1 01         [ 4] 4937 	call print_int 
      00998F 27               [ 4] 4938 	ret 
                                   4939 
                                   4940 ;-----------------------------------
                                   4941 ; BASIC: FORGET ["file_name"] 
                                   4942 ; erase file_name and all others 
                                   4943 ; after it. 
                                   4944 ; without argument erase all files 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4945 ;-----------------------------------
                           000001  4946 	NEW_FREE=1 
                           000003  4947 	VSIZE=3 
      001BDD                       4948 forget:
      001BDD                       4949 	_vars VSIZE 
      009990 03 CC            [ 2]    1     sub sp,#VSIZE 
      009992 88 F9 85         [ 4] 4950 	call next_token 
      009995 A3 00            [ 1] 4951 	cp a,#TK_NONE 
      009997 0F 23            [ 1] 4952 	jreq 3$ 
      009999 05 A6            [ 1] 4953 	cp a,#TK_QSTR
      00999B 0A CC            [ 1] 4954 	jreq 1$
      00999D 88 FB CD         [ 2] 4955 	jp syntax_error
      0099A0 9F BD            [ 1] 4956 1$: ldw y,x 
      0099A2 6B 01 E6 01 0D   [ 1] 4957 	mov in,count 
      0099A7 01 27 05         [ 4] 4958 	call search_file
      0099AA 44 0A            [ 1] 4959 	jrc 2$
      0099AC 01 26            [ 1] 4960 	ld a,#ERR_NOT_FILE 
      0099AE FB A4 01         [ 2] 4961 	jp tb_error 
      001BFE                       4962 2$: 
      0099B1 5F 97 A6         [ 2] 4963 	ldw x,farptr
      0099B4 84 5B 01         [ 1] 4964 	ld a,farptr+2
      0099B7 81 0A            [ 2] 4965 	jra 4$ 
      0099B8                       4966 3$: ; forget all files 
      0099B8 52 02 CD         [ 2] 4967 	ldw x,#0x100
      0099BB 90               [ 1] 4968 	clr a 
      0099BC 98 A1 02         [ 2] 4969 	ldw farptr,x 
      0099BF 27 03 CC         [ 1] 4970 	ld farptr+2,a 
      001C10                       4971 4$:	; save new free address 
      0099C2 88 F9            [ 2] 4972 	ldw (NEW_FREE,sp),x
      0099C4 85 9F            [ 1] 4973 	ld (NEW_FREE+2,sp),a 
      0099C6 6B 02 85         [ 4] 4974 	call move_erase_to_ram
      0099C9 A3 00 0F         [ 4] 4975 5$: call block_erase 
      0099CC 23 05 A6         [ 2] 4976 	ldw x,#BLOCK_SIZE 
      0099CF 0A CC 88         [ 4] 4977 	call incr_farptr 
      0099D2 FB CD 9F         [ 4] 4978 	call row_align 
                                   4979 ; check if all blocks erased
      0099D5 BD 6B 01         [ 1] 4980 	ld a,farptr+2  
      0099D8 A6 01 0D         [ 1] 4981 	sub a,ffree+2
      0099DB 01 27 05         [ 1] 4982 	ld a,farptr+1 
      0099DE 48 0A 01         [ 1] 4983 	sbc a,ffree+1 
      0099E1 26 FB 0D         [ 1] 4984 	ld a,farptr 
      0099E4 02 26 05         [ 1] 4985 	sbc a,ffree 
      0099E7 43 E4            [ 1] 4986 	jrmi 5$ 
      0099E9 00 20            [ 1] 4987 	ld a,(NEW_FREE+2,sp)
      0099EB 02 EA            [ 2] 4988 	ldw x,(NEW_FREE,sp)
      0099ED 00 E7 00         [ 1] 4989 	ld ffree+2,a 
      0099F0 5B 02 81         [ 2] 4990 	ldw ffree,x 
      0099F3                       4991 	_drop VSIZE 
      0099F3 72 00            [ 2]    1     addw sp,#VSIZE 
      0099F5 00               [ 4] 4992 	ret 
                                   4993 
                                   4994 ;----------------------
                                   4995 ; BASIC: DIR 
                                   4996 ; list saved files 
                                   4997 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000001  4998 	COUNT=1 ; files counter 
                           000002  4999 	VSIZE=2 
      001C44                       5000 directory:
      001C44                       5001 	_vars VSIZE 
      0099F6 24 02            [ 2]    1     sub sp,#VSIZE 
      0099F8 4F               [ 1] 5002 	clrw x 
      0099F9 81 01            [ 2] 5003 	ldw (COUNT,sp),x 
      0099FA CF 00 17         [ 2] 5004 	ldw farptr+1,x 
      0099FA AE 9A 21 CD      [ 1] 5005 	mov farptr,#1 
      001C50                       5006 dir_loop:
      0099FE A8               [ 1] 5007 	clrw x 
      0099FF C0 5B 02 52      [ 5] 5008 	ldf a,([farptr],x)
      009A03 04 CD            [ 1] 5009 	jreq 8$ 
      001C57                       5010 1$: ;name loop 	
      009A05 95 EF AE 16      [ 5] 5011 	ldf a,([farptr],x)
      009A09 90 CF            [ 1] 5012 	jreq 2$ 
      009A0B 00 05 7F         [ 4] 5013 	call putc 
      009A0E 72               [ 2] 5014 	incw x 
      009A0F 5F 00            [ 2] 5015 	jra 1$
      009A11 04               [ 2] 5016 2$: incw x ; skip ending 0. 
      009A12 5F CF            [ 1] 5017 	ld a,#SPACE 
      009A14 00 01 72         [ 4] 5018 	call putc 
                                   5019 ; get file size 	
      009A17 11 00 24 72      [ 5] 5020 	ldf a,([farptr],x)
      009A1B 18 00            [ 1] 5021 	ld yh,a 
      009A1D 24               [ 2] 5022 	incw x 
      009A1E CC 89 9F 0A      [ 5] 5023 	ldf a,([farptr],x)
      009A22 62               [ 2] 5024 	incw x 
      009A23 72 65            [ 1] 5025 	ld yl,a 
      009A25 61 6B            [ 2] 5026 	pushw y 
      009A27 20 70 6F         [ 2] 5027 	addw x,(1,sp)
                                   5028 ; skip to next file 
      009A2A 69 6E 74         [ 4] 5029 	call incr_farptr
      009A2D 2C 20 52         [ 4] 5030 	call row_align
                                   5031 ; print file size 
      009A30 55               [ 2] 5032 	popw x ; file size 
      009A31 4E 20 74         [ 4] 5033 	call print_int 
      009A34 6F 20            [ 1] 5034 	ld a,#CR 
      009A36 72 65 73         [ 4] 5035 	call putc
      009A39 75 6D            [ 2] 5036 	ldw x,(COUNT,sp)
      009A3B 65               [ 2] 5037 	incw x
      009A3C 2E 0A            [ 2] 5038 	ldw (COUNT,sp),x  
      009A3E 00 BE            [ 2] 5039 	jra dir_loop
      009A3F                       5040 8$: ; print number of files 
      009A3F 72 01            [ 2] 5041 	ldw x,(COUNT,sp)
      009A41 00 24 01         [ 4] 5042 	call print_int 
      009A44 81 1C B1         [ 2] 5043 	ldw x,#file_count 
      009A45 CD 00 00         [ 4] 5044 	call puts  
                                   5045 ; print drive free space 	
      009A45 CD 87 65         [ 4] 5046 	call disk_free
      009A48 81               [ 1] 5047 	clrw x  
      009A49 35 0A 00 0A      [ 1] 5048 	mov base,#10 
      009A49 AE 16 E0         [ 4] 5049 	call prti24 
      009A4C A6 80 7F         [ 2] 5050 	ldw x,#drive_free
      009A4F 5C 4A 26         [ 4] 5051 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001CAE                       5052 	_drop VSIZE 
      009A52 FB 81            [ 2]    1     addw sp,#VSIZE 
      009A54 81               [ 4] 5053 	ret
      009A54 A6 7F C4 00 19 27 13  5054 file_count: .asciz " files\n"
             CE
      009A5C 00 18 1C 00 80 24 04  5055 drive_free: .asciz " bytes free\n" 
             72 5C 00 17 9F A4
                                   5056 
                                   5057 ;---------------------
                                   5058 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5059 ; write 1 or more byte to FLASH or EEPROM
                                   5060 ; starting at address  
                                   5061 ; input:
                                   5062 ;   expr1  	is address 
                                   5063 ;   expr2,...,exprn   are bytes to write
                                   5064 ; output:
                                   5065 ;   none 
                                   5066 ;---------------------
                           000001  5067 	ADDR=1
                           000002  5068 	VSIZ=2 
      001CC6                       5069 write:
      001CC6                       5070 	_vars VSIZE 
      009A69 80 97            [ 2]    1     sub sp,#VSIZE 
      009A6B CF 00 18 81      [ 1] 5071 	clr farptr ; expect 16 bits address 
      009A6F CD 11 11         [ 4] 5072 	call expression
      009A6F 72 BB            [ 1] 5073 	cp a,#TK_INTGR 
      009A71 00 18            [ 1] 5074 	jreq 0$
      009A73 24 04 72         [ 2] 5075 	jp syntax_error
      009A76 5C 00            [ 2] 5076 0$: ldw (ADDR,sp),x 
      009A78 17 CF 00         [ 4] 5077 	call next_token 
      009A7B 18 81            [ 1] 5078 	cp a,#TK_COMMA 
      009A7D 27 02            [ 1] 5079 	jreq 1$ 
      009A7D A6 01            [ 2] 5080 	jra 9$ 
      009A7F C7 00 17         [ 4] 5081 1$:	call expression
      009A82 5F CF            [ 1] 5082 	cp a,#TK_INTGR
      009A84 00 18            [ 1] 5083 	jreq 2$
      009A86 CC 08 79         [ 2] 5084 	jp syntax_error
      009A86 AE               [ 1] 5085 2$:	ld a,xl 
      009A87 00 03            [ 2] 5086 	ldw x,(ADDR,sp) 
      009A89 92 AF 00         [ 2] 5087 	ldw farptr+1,x 
      009A8C 17               [ 1] 5088 	clrw x 
      009A8D 26 05 5A         [ 4] 5089 	call write_byte
      009A90 2A F7            [ 2] 5090 	ldw x,(ADDR,sp)
      009A92 20               [ 2] 5091 	incw x 
      009A93 0E AE            [ 2] 5092 	jra 0$ 
      001CFA                       5093 9$:
      001CFA                       5094 	_drop VSIZE
      009A95 00 80            [ 2]    1     addw sp,#VSIZE 
      009A97 CD               [ 4] 5095 	ret 
                                   5096 
                                   5097 
                                   5098 ;---------------------
                                   5099 ;BASIC: CHAR(expr)
                                   5100 ; évaluate expression 
                                   5101 ; and take the 7 least 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5102 ; bits as ASCII character
                                   5103 ;---------------------
      001CFD                       5104 char:
      009A98 9A 6F AE         [ 4] 5105 	call func_args 
      009A9B 02 80            [ 1] 5106 	cp a,#1
      009A9D C3 00            [ 1] 5107 	jreq 1$
      009A9F 17 2B E4         [ 2] 5108 	jp syntax_error
      009AA2 85               [ 2] 5109 1$:	popw x 
      009AA2 CE               [ 1] 5110 	ld a,xl 
      009AA3 00 17            [ 1] 5111 	and a,#0x7f 
      009AA5 C6               [ 1] 5112 	ld xl,a
      009AA6 00 19            [ 1] 5113 	ld a,#TK_CHAR
      009AA8 CF               [ 4] 5114 	ret
                                   5115 
                                   5116 ;---------------------
                                   5117 ; BASIC: ASC(string|char)
                                   5118 ; extract first character 
                                   5119 ; of string argument 
                                   5120 ; return it as TK_INTGR 
                                   5121 ;---------------------
      001D0F                       5122 ascii:
      009AA9 00 1A            [ 1] 5123 	ld a,#TK_LPAREN
      009AAB C7 00 1C         [ 4] 5124 	call expect 
      009AAE 81 09 6B         [ 4] 5125 	call next_token 
      009AAF A1 02            [ 1] 5126 	cp a,#TK_QSTR 
      009AAF AE 80            [ 1] 5127 	jreq 1$
      009AB1 00 72            [ 1] 5128 	cp a,#TK_CHAR 
      009AB3 B0 00            [ 1] 5129 	jreq 2$ 
      009AB5 1B A6 02         [ 2] 5130 	jp syntax_error
      001D22                       5131 1$: 
      009AB8 C2               [ 1] 5132 	ld a,(x) 
      009AB9 00               [ 1] 5133 	clrw x
      009ABA 1A               [ 1] 5134 	ld xl,a 
      001D25                       5135 2$: 
      009ABB C7               [ 2] 5136 	pushw x 
      009ABC 00 0C            [ 1] 5137 	ld a,#TK_RPAREN 
      009ABE CF 00 0D         [ 4] 5138 	call expect
      009AC1 81               [ 2] 5139 	popw x 
      009AC2 A6 84            [ 1] 5140 	ld a,#TK_INTGR 
      009AC2 5F               [ 4] 5141 	ret 
                                   5142 
                                   5143 ;---------------------
                                   5144 ;BASIC: KEY
                                   5145 ; wait for a character 
                                   5146 ; received from STDIN 
                                   5147 ; input:
                                   5148 ;	none 
                                   5149 ; output:
                                   5150 ;	X 		ASCII character 
                                   5151 ;---------------------
      001D2F                       5152 key:
      009AC3 92 AF 00         [ 4] 5153 	call getc 
      009AC6 17               [ 1] 5154 	clrw x 
      009AC7 90               [ 1] 5155 	ld xl,a 
      009AC8 F1 26            [ 1] 5156 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009ACA 08               [ 4] 5157 	ret
                                   5158 
                                   5159 ;----------------------
                                   5160 ; BASIC: QKEY
                                   5161 ; Return true if there 
                                   5162 ; is a character in 
                                   5163 ; waiting in STDIN 
                                   5164 ; input:
                                   5165 ;  none 
                                   5166 ; output:
                                   5167 ;   X 		0|-1 
                                   5168 ;-----------------------
      001D37                       5169 qkey:: 
      009ACB 4D               [ 1] 5170 	clrw x 
      009ACC 27 12 5C         [ 1] 5171 	ld a,rx_head
      009ACF 90 5C 20         [ 1] 5172 	cp a,rx_tail 
      009AD2 F0 01            [ 1] 5173 	jreq 9$ 
      009AD3 53               [ 2] 5174 	cplw x 
      009AD3 4D 27            [ 1] 5175 9$: ld a,#TK_INTGR
      009AD5 07               [ 4] 5176 	ret 
                                   5177 
                                   5178 ;---------------------
                                   5179 ; BASIC: GPIO(expr,reg)
                                   5180 ; return gpio address 
                                   5181 ; expr {0..8}
                                   5182 ; input:
                                   5183 ;   none 
                                   5184 ; output:
                                   5185 ;   X 		gpio register address
                                   5186 ;----------------------------
                           000003  5187 	PORT=3
                           000001  5188 	REG=1 
                           000004  5189 	VSIZE=4 
      001D44                       5190 gpio:
      009AD6 5C 92 AF         [ 4] 5191 	call func_args 
      009AD9 00 17            [ 1] 5192 	cp a,#2
      009ADB 20 F6            [ 1] 5193 	jreq 1$
      009ADD 5C 98 81         [ 2] 5194 	jp syntax_error  
      009AE0                       5195 1$:	
      009AE0 5C 99            [ 2] 5196 	ldw x,(PORT,sp)
      009AE2 81 17            [ 1] 5197 	jrmi bad_port
      009AE3 A3 00 09         [ 2] 5198 	cpw x,#9
      009AE3 52 04            [ 1] 5199 	jrpl bad_port
      009AE5 17 03            [ 1] 5200 	ld a,#5
      009AE7 5F               [ 4] 5201 	mul x,a
      009AE8 CF 00 18         [ 2] 5202 	addw x,#GPIO_BASE 
      009AEB 35 01            [ 2] 5203 	ldw (PORT,sp),x  
      009AED 00 17            [ 2] 5204 	ldw x,(REG,sp) 
      009AEF 72 FB 03         [ 2] 5205 	addw x,(PORT,sp)
      009AEF 92 BC            [ 1] 5206 	ld a,#TK_INTGR
      001D66                       5207 	_drop VSIZE 
      009AF1 00 17            [ 2]    1     addw sp,#VSIZE 
      009AF3 27               [ 4] 5208 	ret
      001D69                       5209 bad_port:
      009AF4 27 5F            [ 1] 5210 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AF6 16 03 CD         [ 2] 5211 	jp tb_error
                                   5212 
                                   5213 
                                   5214 ;-------------------------
                                   5215 ; BASIC: UFLASH 
                                   5216 ; return user flash address
                                   5217 ; input:
                                   5218 ;  none 
                                   5219 ; output:
                                   5220 ;	A		TK_INTGR
                                   5221 ;   X 		user address 
                                   5222 ;---------------------------
      001D6E                       5223 uflash:
      009AF9 9A C2 25         [ 2] 5224 	ldw x,#user_space 
      009AFC 2F 92            [ 1] 5225 	ld a,#TK_INTGR 
      009AFE AF               [ 4] 5226 	ret 
                                   5227 
                                   5228 
                                   5229 ;---------------------
                                   5230 ; BASIC: USR(addr[,arg])
                                   5231 ; execute a function written 
                                   5232 ; in binary code.
                                   5233 ; binary fonction should 
                                   5234 ; return token attribute in A 
                                   5235 ; and value in X. 
                                   5236 ; input:
                                   5237 ;   addr	routine address 
                                   5238 ;   arg 	is an optional argument 
                                   5239 ; output:
                                   5240 ;   A 		token attribute 
                                   5241 ;   X       returned value 
                                   5242 ;---------------------
      001D74                       5243 usr:
      009AFF 00 17            [ 2] 5244 	pushw y 	
      009B01 6B 01 5C         [ 4] 5245 	call func_args 
      009B04 92 AF            [ 1] 5246 	cp a,#1 
      009B06 00 17            [ 1] 5247 	jreq 2$
      009B08 6B 02            [ 1] 5248 	cp a,#2
      009B0A 5C 72            [ 1] 5249 	jreq 2$  
      009B0C FB 01 CD         [ 2] 5250 	jp syntax_error 
      009B0F 9A 6F            [ 2] 5251 2$: popw y  ; arg|addr 
      009B11 CD 9A            [ 1] 5252 	cp a,#1
      009B13 54 AE            [ 1] 5253 	jreq 3$
      009B15 02               [ 2] 5254 	popw x ; addr
      009B16 80               [ 1] 5255 	exgw x,y 
      009B17 C3 00            [ 4] 5256 3$: call (y)
      009B19 17 2A            [ 2] 5257 	popw y 
      009B1B D3               [ 4] 5258 	ret 
                                   5259 
                                   5260 ;------------------------------
                                   5261 ; BASIC: BYE 
                                   5262 ; halt mcu in its lowest power mode 
                                   5263 ; wait for reset or external interrupt
                                   5264 ; do a cold start on wakeup.
                                   5265 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B1C                       5266 bye:
      009B1C 72 5F 00 17 72   [ 2] 5267 	btjf UART1_SR,#UART_SR_TC,.
      009B21 5F               [10] 5268 	halt
      009B22 00 18 72         [ 2] 5269 	jp cold_start  
                                   5270 
                                   5271 ;----------------------------------
                                   5272 ; BASIC: AUTORUN ["file_name"] 
                                   5273 ; record in eeprom at adrress AUTORUN_NAME
                                   5274 ; the name of file to load and execute
                                   5275 ; at startup. 
                                   5276 ; empty string delete autorun name 
                                   5277 ; no argument display autorun name  
                                   5278 ; input:
                                   5279 ;   file_name   file to execute 
                                   5280 ; output:
                                   5281 ;   none
                                   5282 ;-----------------------------------
      001D9A                       5283 autorun: 
      009B25 5F 00 19 5B 04   [ 2] 5284 	btjf flags,#FRUN,0$ 
      009B2A 98 81            [ 1] 5285 	jreq 0$ 
      009B2C A6 07            [ 1] 5286 	ld a,#ERR_CMD_ONLY 
      009B2C 5B 04 99         [ 2] 5287 	jp tb_error 
      001DA6                       5288 0$:	
      009B2F 81 09 6B         [ 4] 5289 	call next_token
      009B30 4D               [ 1] 5290 	tnz a 
      009B30 72 01            [ 1] 5291 	jrne 1$
      009B32 00 24 05         [ 2] 5292 	ldw x,#AUTORUN_NAME
      009B35 A6 07 CC         [ 4] 5293 	call puts 
      009B38 88               [ 1] 5294 	clr a 
      009B39 FB               [ 4] 5295 	ret 
      009B3A                       5296 1$:
      009B3A CE 00            [ 1] 5297 	cp a,#TK_QSTR
      009B3C 1F 72            [ 1] 5298 	jreq 2$
      009B3E B0 00 1D         [ 2] 5299 	jp syntax_error 
      001DBB                       5300 2$:	
      009B41 26               [ 1] 5301 	tnz (x) 
      009B42 0C AE            [ 1] 5302 	jrne 3$
                                   5303 ; empty string, delete autorun 	
      009B44 88 94 CD         [ 4] 5304 	call cancel_autorun
      009B47 A8 C0 55 00 04   [ 1] 5305 	mov in,count 
      009B4C 00               [ 4] 5306 	ret 
      009B4D 02               [ 2] 5307 3$:	pushw x 
      009B4E 81 93            [ 1] 5308 	ldw y,x  
      009B4F CD 1A 63         [ 4] 5309 	call search_file 
      009B4F 52 08            [ 1] 5310 	jrc 4$ 
      009B51 1F 01            [ 1] 5311 	ld a,#ERR_NOT_FILE
      009B53 CD 89 EB         [ 2] 5312 	jp tb_error  
      001DD4                       5313 4$: 
      009B56 A1 02 27 03 CC   [ 1] 5314 	mov in,count 
      009B5B 88 F9 00 16      [ 1] 5315 	clr farptr 
      009B5D AE 40 00         [ 2] 5316 	ldw x,#AUTORUN_NAME
      009B5D 1F 03 CD         [ 2] 5317 	ldw farptr+1,x 
      009B60 81 F4            [ 2] 5318 	ldw x,(1,sp)  
      009B62 CD 84 16         [ 4] 5319 	call strlen  ; return length in A 
      009B65 AB               [ 1] 5320 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B66 03               [ 1] 5321 	ld xl,a 
      009B67 5F               [ 2] 5322 	incw x 
      009B68 97 72            [ 2] 5323 	popw y 
      009B6A FB               [ 2] 5324 	pushw x 
      009B6B 01               [ 1] 5325 	clrw x 
      009B6C 4F 72 BB         [ 4] 5326 	call write_block 
      001DF2                       5327 	_drop 2 
      009B6F 00 1B            [ 2]    1     addw sp,#2 
      009B71 C9               [ 4] 5328 	ret 
                                   5329 
                                   5330 ;----------------------------------
                                   5331 ; BASIC: SLEEP 
                                   5332 ; halt mcu until reset or external
                                   5333 ; interrupt.
                                   5334 ; Resume progam after SLEEP command
                                   5335 ;----------------------------------
      001DF5                       5336 sleep:
      009B72 00 1A A1 02 2B   [ 2] 5337 	btjf UART1_SR,#UART_SR_TC,.
      009B77 0A A3 80 00      [ 1] 5338 	bset flags,#FSLEEP
      009B7B 2B               [10] 5339 	halt 
      009B7C 05               [ 4] 5340 	ret 
                                   5341 
                                   5342 ;-------------------------------
                                   5343 ; BASIC: PAUSE expr 
                                   5344 ; suspend execution for n msec.
                                   5345 ; input:
                                   5346 ;	none
                                   5347 ; output:
                                   5348 ;	none 
                                   5349 ;------------------------------
      001E00                       5350 pause:
      009B7D A6 0E CC         [ 4] 5351 	call expression
      009B80 88 FB            [ 1] 5352 	cp a,#TK_INTGR
      009B82 27 03            [ 1] 5353 	jreq pause02 
      009B82 16 03 CD         [ 2] 5354 	jp syntax_error
      001E0A                       5355 pause02: 
      009B85 9A               [ 2] 5356 1$: tnzw x 
      009B86 E3 24            [ 1] 5357 	jreq 2$
      009B88 05               [10] 5358 	wfi 
      009B89 A6               [ 2] 5359 	decw x 
      009B8A 08 CC            [ 1] 5360 	jrne 1$
      009B8C 88               [ 1] 5361 2$:	clr a 
      009B8D FB               [ 4] 5362 	ret 
                                   5363 
                                   5364 ;------------------------------
                                   5365 ; BASIC: AWU expr
                                   5366 ; halt mcu for 'expr' milliseconds
                                   5367 ; use Auto wakeup peripheral
                                   5368 ; all oscillators stopped except LSI
                                   5369 ; range: 1ms - 511ms
                                   5370 ; input:
                                   5371 ;  none
                                   5372 ; output:
                                   5373 ;  none:
                                   5374 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B8E                       5375 awu:
      009B8E CE 00 1A         [ 4] 5376   call expression
      009B91 C6 00            [ 1] 5377   cp a,#TK_INTGR
      009B93 1C CF            [ 1] 5378   jreq awu02
      009B95 00 17 C7         [ 2] 5379   jp syntax_error
      001E1D                       5380 awu02:
      009B98 00 19 16         [ 2] 5381   cpw x,#5120
      009B9B 03 AE            [ 1] 5382   jrmi 1$ 
      009B9D 16 E0 CD 84      [ 1] 5383   mov AWU_TBR,#15 
      009BA1 32 CD            [ 1] 5384   ld a,#30
      009BA3 84               [ 2] 5385   div x,a
      009BA4 16 5F            [ 1] 5386   ld a,#16
      009BA6 97               [ 2] 5387   div x,a 
      009BA7 5C 1C            [ 2] 5388   jra 4$
      001E2E                       5389 1$: 
      009BA9 16 E0 16         [ 2] 5390   cpw x,#2048
      009BAC 01 FF            [ 1] 5391   jrmi 2$ 
      009BAE 1C 00 02 90      [ 1] 5392   mov AWU_TBR,#14
      009BB2 CE 00            [ 1] 5393   ld a,#80
      009BB4 1D               [ 2] 5394   div x,a 
      009BB5 90 F6            [ 2] 5395   jra 4$   
      001E3C                       5396 2$:
      009BB7 90 5C F7 5C      [ 1] 5397   mov AWU_TBR,#7
      001E40                       5398 3$:  
                                   5399 ; while X > 64  divide by 2 and increment AWU_TBR 
      009BBB 90 C3 00         [ 2] 5400   cpw x,#64 
      009BBE 1F 27            [ 2] 5401   jrule 4$ 
      009BC0 05 A3 17 60      [ 1] 5402   inc AWU_TBR 
      009BC4 2B               [ 2] 5403   srlw x 
      009BC5 EF F4            [ 2] 5404   jra 3$ 
      009BC6                       5405 4$:
      009BC6 17               [ 1] 5406   ld a, xl
      009BC7 07               [ 1] 5407   dec a 
      009BC8 27 01            [ 1] 5408   jreq 5$
      009BC8 A3               [ 1] 5409   dec a 	
      001E51                       5410 5$: 
      009BC9 17 60            [ 1] 5411   and a,#0x3e 
      009BCB 27 04 7F         [ 1] 5412   ld AWU_APR,a 
      009BCE 5C 20 F7 F0      [ 1] 5413   bset AWU_CSR,#AWU_CSR_AWUEN
      009BD1 8E               [10] 5414   halt 
                                   5415 
      009BD1 AE               [ 4] 5416   ret 
                                   5417 
                                   5418 ;------------------------------
                                   5419 ; BASIC: TICKS
                                   5420 ; return msec ticks counter value 
                                   5421 ; input:
                                   5422 ; 	none 
                                   5423 ; output:
                                   5424 ;	X 		TK_INTGR
                                   5425 ;-------------------------------
      001E5C                       5426 get_ticks:
      009BD2 16 E0 CD         [ 2] 5427 	ldw x,ticks 
      009BD5 82 08            [ 1] 5428 	ld a,#TK_INTGR
      009BD7 AE               [ 4] 5429 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5430 
                                   5431 
                                   5432 
                                   5433 ;------------------------------
                                   5434 ; BASIC: ABS(expr)
                                   5435 ; return absolute value of expr.
                                   5436 ; input:
                                   5437 ;   none
                                   5438 ; output:
                                   5439 ;   X     	positive integer
                                   5440 ;-------------------------------
      001E62                       5441 abs:
      009BD8 00 80 CD         [ 4] 5442 	call func_args 
      009BDB 9A 6F            [ 1] 5443 	cp a,#1 
      009BDD AE 16            [ 1] 5444 	jreq 0$ 
      009BDF E0 16 07         [ 2] 5445 	jp syntax_error
      001E6C                       5446 0$:  
      009BE2 90               [ 2] 5447     popw x   
      009BE3 C3               [ 1] 5448 	ld a,xh 
      009BE4 00 1F            [ 1] 5449 	bcp a,#0x80 
      009BE6 2B CD            [ 1] 5450 	jreq 2$ 
      009BE8 CE               [ 2] 5451 	negw x 
      009BE9 00 17            [ 1] 5452 2$: ld a,#TK_INTGR 
      009BEB C6               [ 4] 5453 	ret 
                                   5454 
                                   5455 ;------------------------------
                                   5456 ; BASIC: AND(expr1,expr2)
                                   5457 ; Apply bit AND relation between
                                   5458 ; the 2 arguments, i.e expr1 & expr2 
                                   5459 ; output:
                                   5460 ; 	A 		TK_INTGR
                                   5461 ;   X 		result 
                                   5462 ;------------------------------
      001E76                       5463 bit_and:
      009BEC 00 19 CF         [ 4] 5464 	call func_args 
      009BEF 00 1A            [ 1] 5465 	cp a,#2
      009BF1 C7 00            [ 1] 5466 	jreq 1$
      009BF3 1C 1E 01         [ 2] 5467 	jp syntax_error 
      009BF6 CD               [ 2] 5468 1$:	popw x 
      009BF7 8A               [ 1] 5469 	ld a,xh 
      009BF8 4C 5B            [ 1] 5470 	and a,(1,sp)
      009BFA 08               [ 1] 5471 	ld xh,a 
      009BFB 81               [ 1] 5472 	ld a,xl
      009BFC 14 02            [ 1] 5473 	and a,(2,sp)
      009BFC CD               [ 1] 5474 	ld xl,a 
      001E89                       5475 	_drop 2 
      009BFD 9A 6F            [ 2]    1     addw sp,#2 
      009BFF CD 87            [ 1] 5476 	ld a,#TK_INTGR
      009C01 65               [ 4] 5477 	ret
                                   5478 
                                   5479 ;------------------------------
                                   5480 ; BASIC: OR(expr1,expr2)
                                   5481 ; Apply bit OR relation between
                                   5482 ; the 2 arguments, i.e expr1 | expr2 
                                   5483 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5484 ; 	A 		TK_INTGR
                                   5485 ;   X 		result 
                                   5486 ;------------------------------
      001E8E                       5487 bit_or:
      009C02 5F 92 AF         [ 4] 5488 	call func_args 
      009C05 00 17            [ 1] 5489 	cp a,#2
      009C07 90 95            [ 1] 5490 	jreq 1$
      009C09 5C 92 AF         [ 2] 5491 	jp syntax_error 
      001E98                       5492 1$: 
      009C0C 00               [ 2] 5493 	popw x 
      009C0D 17               [ 1] 5494 	ld a,xh 
      009C0E 5C 90            [ 1] 5495 	or a,(1,sp)
      009C10 97               [ 1] 5496 	ld xh,a 
      009C11 72               [ 1] 5497 	ld a,xl 
      009C12 B9 00            [ 1] 5498 	or a,(2,sp)
      009C14 1D               [ 1] 5499 	ld xl,a 
      001EA1                       5500 	_drop 2 
      009C15 90 CF            [ 2]    1     addw sp,#2 
      009C17 00 1F            [ 1] 5501 	ld a,#TK_INTGR 
      009C19 90               [ 4] 5502 	ret
                                   5503 
                                   5504 ;------------------------------
                                   5505 ; BASIC: XOR(expr1,expr2)
                                   5506 ; Apply bit XOR relation between
                                   5507 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5508 ; output:
                                   5509 ; 	A 		TK_INTGR
                                   5510 ;   X 		result 
                                   5511 ;------------------------------
      001EA6                       5512 bit_xor:
      009C1A CE 00 1D         [ 4] 5513 	call func_args 
      009C1D A1 02            [ 1] 5514 	cp a,#2
      009C1D 92 AF            [ 1] 5515 	jreq 1$
      009C1F 00 17 90         [ 2] 5516 	jp syntax_error 
      001EB0                       5517 1$: 
      009C22 F7               [ 2] 5518 	popw x 
      009C23 5C               [ 1] 5519 	ld a,xh 
      009C24 90 5C            [ 1] 5520 	xor a,(1,sp)
      009C26 90               [ 1] 5521 	ld xh,a 
      009C27 C3               [ 1] 5522 	ld a,xl 
      009C28 00 1F            [ 1] 5523 	xor a,(2,sp)
      009C2A 2B               [ 1] 5524 	ld xl,a 
      001EB9                       5525 	_drop 2 
      009C2B F1 81            [ 2]    1     addw sp,#2 
      009C2D A6 84            [ 1] 5526 	ld a,#TK_INTGR 
      009C2D 72               [ 4] 5527 	ret 
                                   5528 
                                   5529 ;------------------------------
                                   5530 ; BASIC: LSHIFT(expr1,expr2)
                                   5531 ; logical shift left expr1 by 
                                   5532 ; expr2 bits 
                                   5533 ; output:
                                   5534 ; 	A 		TK_INTGR
                                   5535 ;   X 		result 
                                   5536 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001EBE                       5537 lshift:
      009C2E 01 00 24         [ 4] 5538 	call func_args
      009C31 07 27            [ 1] 5539 	cp a,#2 
      009C33 05 A6            [ 1] 5540 	jreq 1$
      009C35 07 CC 88         [ 2] 5541 	jp syntax_error
      009C38 FB 85            [ 2] 5542 1$: popw y   
      009C39 85               [ 2] 5543 	popw x 
      009C39 CD 89            [ 2] 5544 	tnzw y 
      009C3B EB A1            [ 1] 5545 	jreq 4$
      009C3D 02               [ 2] 5546 2$:	sllw x 
      009C3E 27 03            [ 2] 5547 	decw y 
      009C40 CC 88            [ 1] 5548 	jrne 2$
      001ED4                       5549 4$:  
      009C42 F9 90            [ 1] 5550 	ld a,#TK_INTGR
      009C44 93               [ 4] 5551 	ret
                                   5552 
                                   5553 ;------------------------------
                                   5554 ; BASIC: RSHIFT(expr1,expr2)
                                   5555 ; logical shift right expr1 by 
                                   5556 ; expr2 bits.
                                   5557 ; output:
                                   5558 ; 	A 		TK_INTGR
                                   5559 ;   X 		result 
                                   5560 ;------------------------------
      001ED7                       5561 rshift:
      009C45 CD 9A E3         [ 4] 5562 	call func_args
      009C48 25 05            [ 1] 5563 	cp a,#2 
      009C4A A6 09            [ 1] 5564 	jreq 1$
      009C4C CC 88 FB         [ 2] 5565 	jp syntax_error
      009C4F 90 85            [ 2] 5566 1$: popw y  
      009C4F CD               [ 2] 5567 	popw x
      009C50 9B FC            [ 2] 5568 	tnzw y 
      009C52 CE 00            [ 1] 5569 	jreq 4$
      009C54 1F               [ 2] 5570 2$:	srlw x 
      009C55 72 B0            [ 2] 5571 	decw y 
      009C57 00 1D            [ 1] 5572 	jrne 2$
      001EED                       5573 4$:  
      009C59 CD 8A            [ 1] 5574 	ld a,#TK_INTGR
      009C5B 4C               [ 4] 5575 	ret
                                   5576 
                                   5577 ;--------------------------
                                   5578 ; BASIC: FCPU integer
                                   5579 ; set CPU frequency 
                                   5580 ;-------------------------- 
                                   5581 
      001EF0                       5582 fcpu:
      009C5C 81 84            [ 1] 5583 	ld a,#TK_INTGR
      009C5D CD 10 06         [ 4] 5584 	call expect 
      009C5D 52               [ 1] 5585 	ld a,xl 
      009C5E 03 CD            [ 1] 5586 	and a,#7 
      009C60 89 EB A1         [ 1] 5587 	ld CLK_CKDIVR,a 
      009C63 00               [ 4] 5588 	ret 
                                   5589 
                                   5590 ;------------------------------
                                   5591 ; BASIC: PMODE pin#, mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5592 ; Arduino pin. 
                                   5593 ; define pin as input or output
                                   5594 ; pin#: {0..15}
                                   5595 ; mode: INPUT|OUTPUT  
                                   5596 ;------------------------------
                           000001  5597 	PINNO=1
                           000001  5598 	VSIZE=1
      001EFC                       5599 pin_mode:
      001EFC                       5600 	_vars VSIZE 
      009C64 27 20            [ 2]    1     sub sp,#VSIZE 
      009C66 A1 02 27         [ 4] 5601 	call arg_list 
      009C69 03 CC            [ 1] 5602 	cp a,#2 
      009C6B 88 F9            [ 1] 5603 	jreq 1$
      009C6D 90 93 55         [ 2] 5604 	jp syntax_error 
      009C70 00 04            [ 2] 5605 1$: popw y ; mode 
      009C72 00               [ 2] 5606 	popw x ; Dx pin 
      009C73 02 CD 9A         [ 4] 5607 	call select_pin 
      009C76 E3 25            [ 1] 5608 	ld (PINNO,sp),a  
      009C78 05 A6            [ 1] 5609 	ld a,#1 
      009C7A 09 CC            [ 1] 5610 	tnz (PINNO,sp)
      009C7C 88 FB            [ 1] 5611 	jreq 4$
      009C7E 48               [ 1] 5612 2$:	sll a 
      009C7E CE 00            [ 1] 5613 	dec (PINNO,sp)
      009C80 17 C6            [ 1] 5614 	jrne 2$ 
      009C82 00 19            [ 1] 5615 	ld (PINNO,sp),a
      009C84 20 0A            [ 1] 5616 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C86 E7 03            [ 1] 5617 	ld (GPIO_CR1,x),a 
      009C86 AE 01 00 4F      [ 2] 5618 4$:	cpw y,#OUTP 
      009C8A CF 00            [ 1] 5619 	jreq 6$
                                   5620 ; input mode
      009C8C 17 C7            [ 1] 5621 	ld a,(PINNO,sp)
      009C8E 00               [ 1] 5622 	cpl a 
      009C8F 19 02            [ 1] 5623 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C90 20 0A            [ 2] 5624 	jra 9$
      001F2E                       5625 6$: ;output mode  
      009C90 1F 01            [ 1] 5626 	ld a,(PINNO,sp)
      009C92 6B 03            [ 1] 5627 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C94 CD 81            [ 1] 5628 	ld (GPIO_CR2,x),a 
      009C96 C0 CD            [ 1] 5629 	ld a,(PINNO,sp)
      009C98 82 3B            [ 1] 5630 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C9A AE 00            [ 1] 5631 9$:	ld (GPIO_DDR,x),a 
      001F3A                       5632 	_drop VSIZE 
      009C9C 80 CD            [ 2]    1     addw sp,#VSIZE 
      009C9E 9A               [ 4] 5633 	ret
                                   5634 
                                   5635 ;------------------------
                                   5636 ; select Arduino pin 
                                   5637 ; input:
                                   5638 ;   X 	 {0..15} Arduino Dx 
                                   5639 ; output:
                                   5640 ;   A     stm8s208 pin 
                                   5641 ;   X     base address s208 GPIO port 
                                   5642 ;---------------------------
      001F3D                       5643 select_pin:
      009C9F 6F               [ 2] 5644 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CA0 CD 9A 54         [ 2] 5645 	addw x,#arduino_to_8s208 
      009CA3 C6               [ 2] 5646 	ldw x,(x)
      009CA4 00               [ 1] 5647 	ld a,xl 
      009CA5 19               [ 1] 5648 	push a 
      009CA6 C0               [ 1] 5649 	swapw x 
      009CA7 00 1C            [ 1] 5650 	ld a,#5 
      009CA9 C6               [ 4] 5651 	mul x,a 
      009CAA 00 18 C2         [ 2] 5652 	addw x,#GPIO_BASE 
      009CAD 00               [ 1] 5653 	pop a 
      009CAE 1B               [ 4] 5654 	ret 
                                   5655 ; translation from Arduino D0..D15 to stm8s208rb 
      001F4D                       5656 arduino_to_8s208:
      009CAF C6 00                 5657 .byte 3,6 ; D0 
      009CB1 17 C2                 5658 .byte 3,5 ; D1 
      009CB3 00 1A                 5659 .byte 4,0 ; D2 
      009CB5 2B E0                 5660 .byte 2,1 ; D3
      009CB7 7B 03                 5661 .byte 6,0 ; D4
      009CB9 1E 01                 5662 .byte 2,2 ; D5
      009CBB C7 00                 5663 .byte 2,3 ; D6
      009CBD 1C CF                 5664 .byte 3,1 ; D7
      009CBF 00 1A                 5665 .byte 3,3 ; D8
      009CC1 5B 03                 5666 .byte 2,4 ; D9
      009CC3 81 05                 5667 .byte 4,5 ; D10
      009CC4 02 06                 5668 .byte 2,6 ; D11
      009CC4 52 02                 5669 .byte 2,7 ; D12
      009CC6 5F 1F                 5670 .byte 2,5 ; D13
      009CC8 01 CF                 5671 .byte 4,2 ; D14
      009CCA 00 18                 5672 .byte 4,1 ; D15
                                   5673 
                                   5674 
                                   5675 ;------------------------------
                                   5676 ; BASIC: RND(expr)
                                   5677 ; return random number 
                                   5678 ; between 1 and expr inclusive
                                   5679 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5680 ; input:
                                   5681 ; 	none 
                                   5682 ; output:
                                   5683 ;	X 		random positive integer 
                                   5684 ;------------------------------
      001F6D                       5685 random:
      009CCC 35 01 00         [ 4] 5686 	call func_args 
      009CCF 17 01            [ 1] 5687 	cp a,#1
      009CD0 27 03            [ 1] 5688 	jreq 1$
      009CD0 5F 92 AF         [ 2] 5689 	jp syntax_error
      001F77                       5690 1$:  
      009CD3 00 17            [ 1] 5691 	ld a,#0x80 
      009CD5 27 3B            [ 1] 5692 	bcp a,(1,sp)
      009CD7 27 05            [ 1] 5693 	jreq 2$
      009CD7 92 AF            [ 1] 5694 	ld a,#ERR_BAD_VALUE
      009CD9 00 17 27         [ 2] 5695 	jp tb_error
      001F82                       5696 2$: 
                                   5697 ; acc16=(x<<5)^x 
      009CDC 06 CD 83         [ 2] 5698 	ldw x,seedx 
      009CDF 40               [ 2] 5699 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CE0 5C               [ 2] 5700 	sllw x 
      009CE1 20               [ 2] 5701 	sllw x 
      009CE2 F4               [ 2] 5702 	sllw x 
      009CE3 5C               [ 2] 5703 	sllw x 
      009CE4 A6               [ 1] 5704 	ld a,xh 
      009CE5 20 CD 83         [ 1] 5705 	xor a,seedx 
      009CE8 40 92 AF         [ 1] 5706 	ld acc16,a 
      009CEB 00               [ 1] 5707 	ld a,xl 
      009CEC 17 90 95         [ 1] 5708 	xor a,seedx+1 
      009CEF 5C 92 AF         [ 1] 5709 	ld acc8,a 
                                   5710 ; seedx=seedy 
      009CF2 00 17 5C         [ 2] 5711 	ldw x,seedy 
      009CF5 90 97 90         [ 2] 5712 	ldw seedx,x  
                                   5713 ; seedy=seedy^(seedy>>1)
      009CF8 89 72            [ 2] 5714 	srlw y 
      009CFA FB 01            [ 1] 5715 	ld a,yh 
      009CFC CD 9A 6F         [ 1] 5716 	xor a,seedy 
      009CFF CD 9A 54         [ 1] 5717 	ld seedy,a  
      009D02 85 CD            [ 1] 5718 	ld a,yl 
      009D04 8A 4C A6         [ 1] 5719 	xor a,seedy+1 
      009D07 0D CD 83         [ 1] 5720 	ld seedy+1,a 
                                   5721 ; acc16>>3 
      009D0A 40 1E 01         [ 2] 5722 	ldw x,acc16 
      009D0D 5C               [ 2] 5723 	srlw x 
      009D0E 1F               [ 2] 5724 	srlw x 
      009D0F 01               [ 2] 5725 	srlw x 
                                   5726 ; x=acc16^x 
      009D10 20               [ 1] 5727 	ld a,xh 
      009D11 BE 00 0C         [ 1] 5728 	xor a,acc16 
      009D12 95               [ 1] 5729 	ld xh,a 
      009D12 1E               [ 1] 5730 	ld a,xl 
      009D13 01 CD 8A         [ 1] 5731 	xor a,acc8 
      009D16 4C               [ 1] 5732 	ld xl,a 
                                   5733 ; seedy=x^seedy 
      009D17 AE 9D 31         [ 1] 5734 	xor a,seedy+1
      009D1A CD               [ 1] 5735 	ld xl,a 
      009D1B A8               [ 1] 5736 	ld a,xh 
      009D1C C0 CD 9A         [ 1] 5737 	xor a,seedy
      009D1F AF               [ 1] 5738 	ld xh,a 
      009D20 5F 35 0A         [ 2] 5739 	ldw seedy,x 
                                   5740 ; return seedy modulo expr + 1 
      009D23 00 0B            [ 2] 5741 	popw y 
      009D25 CD               [ 2] 5742 	divw x,y 
      009D26 8A               [ 1] 5743 	ldw x,y 
      009D27 5C               [ 2] 5744 	incw x 
      001FD1                       5745 10$:
      009D28 AE 9D            [ 1] 5746 	ld a,#TK_INTGR
      009D2A 39               [ 4] 5747 	ret 
                                   5748 
                                   5749 ;---------------------------------
                                   5750 ; BASIC: WORDS 
                                   5751 ; affiche la listes des mots du
                                   5752 ; dictionnaire ainsi que le nombre
                                   5753 ; de mots.
                                   5754 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           000001  5755 	WLEN=1 ; word length
                           000002  5756 	LLEN=2 ; character sent to console
                           000003  5757 	WCNT=3 ; count words printed 
                           000003  5758 	VSIZE=3 
      001FD4                       5759 words:
      001FD4                       5760 	_vars VSIZE
      009D2B CD A8            [ 2]    1     sub sp,#VSIZE 
      009D2D C0 5B            [ 1] 5761 	clr (LLEN,sp)
      009D2F 02 81            [ 1] 5762 	clr (WCNT,sp)
      009D31 20 66 69 6C      [ 2] 5763 	ldw y,#kword_dict+2
      009D35 65               [ 1] 5764 0$:	ldw x,y
      009D36 73               [ 1] 5765 	ld a,(x)
      009D37 0A 00            [ 1] 5766 	and a,#15 
      009D39 20 62            [ 1] 5767 	ld (WLEN,sp),a 
      009D3B 79 74            [ 1] 5768 	inc (WCNT,sp)
      009D3D 65               [ 2] 5769 1$:	incw x 
      009D3E 73               [ 1] 5770 	ld a,(x)
      009D3F 20 66 72         [ 4] 5771 	call putc 
      009D42 65 65            [ 1] 5772 	inc (LLEN,sp)
      009D44 0A 00            [ 1] 5773 	dec (WLEN,sp)
      009D46 26 F5            [ 1] 5774 	jrne 1$
      009D46 52 02            [ 1] 5775 	ld a,#70
      009D48 72 5F            [ 1] 5776 	cp a,(LLEN,sp)
      009D4A 00 17            [ 1] 5777 	jrmi 2$   
      009D4C CD 91            [ 1] 5778 	ld a,#SPACE 
      009D4E 91 A1 84         [ 4] 5779 	call putc 
      009D51 27 03            [ 1] 5780 	inc (LLEN,sp) 
      009D53 CC 88            [ 2] 5781 	jra 3$
      009D55 F9 1F            [ 1] 5782 2$: ld a,#CR 
      009D57 01 CD 89         [ 4] 5783 	call putc 
      009D5A EB A1            [ 1] 5784 	clr (LLEN,sp)
      009D5C 09 27 02 20      [ 2] 5785 3$:	subw y,#2 
      009D60 19 CD            [ 2] 5786 	ldw y,(y)
      009D62 91 91            [ 1] 5787 	jrne 0$ 
      009D64 A1 84            [ 1] 5788 	ld a,#CR 
      009D66 27 03 CC         [ 4] 5789 	call putc  
      009D69 88               [ 1] 5790 	clrw x 
      009D6A F9 9F            [ 1] 5791 	ld a,(WCNT,sp)
      009D6C 1E               [ 1] 5792 	ld xl,a 
      009D6D 01 CF 00         [ 4] 5793 	call print_int 
      009D70 18 5F CD         [ 2] 5794 	ldw x,#words_count_msg
      009D73 82 65 1E         [ 4] 5795 	call puts 
      002021                       5796 	_drop VSIZE 
      009D76 01 5C            [ 2]    1     addw sp,#VSIZE 
      009D78 20               [ 4] 5797 	ret 
      009D79 DC 77 6F 72 64 73 20  5798 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5799 
                                   5800 
                                   5801 ;-----------------------------
                                   5802 ; BASIC: TIMER expr 
                                   5803 ; initialize count down timer 
                                   5804 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D7A                       5805 set_timer:
      009D7A 5B 02 81         [ 4] 5806 	call arg_list
      009D7D A1 01            [ 1] 5807 	cp a,#1 
      009D7D CD 90            [ 1] 5808 	jreq 1$
      009D7F 93 A1 01         [ 2] 5809 	jp syntax_error
      002044                       5810 1$: 
      009D82 27               [ 2] 5811 	popw x 
      009D83 03 CC 88         [ 2] 5812 	ldw timer,x 
      009D86 F9               [ 4] 5813 	ret 
                                   5814 
                                   5815 ;------------------------------
                                   5816 ; BASIC: TIMEOUT 
                                   5817 ; return state of timer 
                                   5818 ;------------------------------
      002049                       5819 timeout:
      009D87 85 9F A4         [ 2] 5820 	ldw x,timer 
      00204C                       5821 logical_complement:
      009D8A 7F               [ 2] 5822 	cplw x 
      009D8B 97 A6 03         [ 2] 5823 	cpw x,#-1
      009D8E 81 01            [ 1] 5824 	jreq 2$
      009D8F 5F               [ 1] 5825 	clrw x 
      009D8F A6 07            [ 1] 5826 2$:	ld a,#TK_INTGR
      009D91 CD               [ 4] 5827 	ret 
                                   5828 
                                   5829 ;--------------------------------
                                   5830 ; BASIC NOT(expr) 
                                   5831 ; return logical complement of expr
                                   5832 ;--------------------------------
      002056                       5833 func_not:
      009D92 90 86 CD         [ 4] 5834 	call func_args  
      009D95 89 EB            [ 1] 5835 	cp a,#1
      009D97 A1 02            [ 1] 5836 	jreq 1$
      009D99 27 07 A1         [ 2] 5837 	jp syntax_error
      009D9C 03               [ 2] 5838 1$:	popw x 
      009D9D 27 06            [ 2] 5839 	jra logical_complement
                                   5840 
                                   5841 
                                   5842 
                                   5843 ;-----------------------------------
                                   5844 ; BASIC: IWDGEN expr1 
                                   5845 ; enable independant watchdog timer
                                   5846 ; expr1 is delay in multiple of 62.5µsec
                                   5847 ; expr1 -> {1..16383}
                                   5848 ;-----------------------------------
      002063                       5849 enable_iwdg:
      009D9F CC 88 F9         [ 4] 5850 	call arg_list
      009DA2 A1 01            [ 1] 5851 	cp a,#1 
      009DA2 F6 5F            [ 1] 5852 	jreq 1$
      009DA4 97 08 79         [ 2] 5853 	jp syntax_error 
      009DA5 85               [ 2] 5854 1$: popw x 
      009DA5 89 A6            [ 1] 5855 	push #0
      009DA7 08 CD 90 86      [ 1] 5856 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009DAB 85               [ 1] 5857 	ld a,xh 
      009DAC A6 84            [ 1] 5858 	and a,#0x3f
      009DAE 81               [ 1] 5859 	ld xh,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DAF A3 00 FF         [ 2] 5860 2$:	cpw x,#255
      009DAF CD 83            [ 2] 5861 	jrule 3$
      009DB1 49 5F            [ 1] 5862 	inc (1,sp)
      009DB3 97               [ 1] 5863 	rcf 
      009DB4 A6               [ 2] 5864 	rrcw x 
      009DB5 84 81            [ 2] 5865 	jra 2$
      009DB7 35 55 50 E0      [ 1] 5866 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DB7 5F               [ 1] 5867 	pop a  
      009DB8 C6 00 2E         [ 1] 5868 	ld IWDG_PR,a 
      009DBB C1               [ 1] 5869 	ld a,xl
      009DBC 00               [ 1] 5870 	dec a 
      009DBD 2F 27 01 53      [ 1] 5871 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DC1 A6 84 81         [ 1] 5872 	ld IWDG_RLR,a 
      009DC4 35 AA 50 E0      [ 1] 5873 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009DC4 CD               [ 4] 5874 	ret 
                                   5875 
                                   5876 
                                   5877 ;-----------------------------------
                                   5878 ; BASIC: IWDGREF  
                                   5879 ; refresh independant watchdog count down 
                                   5880 ; timer before it reset MCU. 
                                   5881 ;-----------------------------------
      002099                       5882 refresh_iwdg:
      009DC5 90 93 A1 02      [ 1] 5883 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009DC9 27               [ 4] 5884 	ret 
                                   5885 
                                   5886 
                                   5887 ;-------------------------------------
                                   5888 ; BASIC: LOG(expr)
                                   5889 ; return logarithm base 2 of expr 
                                   5890 ; this is the position of most significant
                                   5891 ; bit set. 
                                   5892 ; input: 
                                   5893 ; output:
                                   5894 ;   X     log2 
                                   5895 ;   A     TK_INTGR 
                                   5896 ;*********************************
      00209E                       5897 log2:
      009DCA 03 CC 88         [ 4] 5898 	call func_args 
      009DCD F9 01            [ 1] 5899 	cp a,#1 
      009DCE 27 03            [ 1] 5900 	jreq 1$
      009DCE 1E 03 2B         [ 2] 5901 	jp syntax_error 
      009DD1 17               [ 2] 5902 1$: popw x 
      0020A9                       5903 leading_one:
      009DD2 A3               [ 2] 5904 	tnzw x 
      009DD3 00 09            [ 1] 5905 	jreq 4$
      009DD5 2A 12            [ 1] 5906 	ld a,#15 
      009DD7 A6               [ 2] 5907 2$: rlcw x 
      009DD8 05 42            [ 1] 5908     jrc 3$
      009DDA 1C               [ 1] 5909 	dec a 
      009DDB 50 00            [ 2] 5910 	jra 2$
      009DDD 1F               [ 1] 5911 3$: clrw x 
      009DDE 03               [ 1] 5912     ld xl,a
      009DDF 1E 01            [ 1] 5913 4$:	ld a,#TK_INTGR
      009DE1 72               [ 4] 5914 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5915 
                                   5916 ;-----------------------------------
                                   5917 ; BASIC: BIT(expr) 
                                   5918 ; expr ->{0..15}
                                   5919 ; return 2^expr 
                                   5920 ; output:
                                   5921 ;    x    2^expr 
                                   5922 ;-----------------------------------
      0020B9                       5923 bitmask:
      009DE2 FB 03 A6         [ 4] 5924     call func_args 
      009DE5 84 5B            [ 1] 5925 	cp a,#1
      009DE7 04 81            [ 1] 5926 	jreq 1$
      009DE9 CC 08 79         [ 2] 5927 	jp syntax_error 
      009DE9 A6               [ 2] 5928 1$: popw x 
      009DEA 0A               [ 1] 5929 	ld a,xl 
      009DEB CC 88            [ 1] 5930 	and a,#15
      009DED FB               [ 1] 5931 	clrw x 
      009DEE 5C               [ 2] 5932 	incw x 
      009DEE AE               [ 1] 5933 2$: tnz a 
      009DEF A8 80            [ 1] 5934 	jreq 3$
      009DF1 A6               [ 2] 5935 	slaw x 
      009DF2 84               [ 1] 5936 	dec a 
      009DF3 81 F9            [ 2] 5937 	jra 2$ 
      009DF4 A6 84            [ 1] 5938 3$: ld a,#TK_INTGR
      009DF4 90               [ 4] 5939 	ret 
                                   5940 
                                   5941 ;------------------------------
                                   5942 ; BASIC: INVERT(expr)
                                   5943 ; 1's complement 
                                   5944 ;--------------------------------
      0020D3                       5945 invert:
      009DF5 89 CD 90         [ 4] 5946 	call func_args
      009DF8 93 A1            [ 1] 5947 	cp a,#1 
      009DFA 01 27            [ 1] 5948 	jreq 1$
      009DFC 07 A1 02         [ 2] 5949 	jp syntax_error
      009DFF 27               [ 2] 5950 1$: popw x  
      009E00 03               [ 2] 5951 	cplw x 
      009E01 CC 88            [ 1] 5952 	ld a,#TK_INTGR 
      009E03 F9               [ 4] 5953 	ret 
                                   5954 
                                   5955 ;------------------------------
                                   5956 ; BASIC: DO 
                                   5957 ; initiate a DO ... UNTIL loop 
                                   5958 ;------------------------------
                           000003  5959 	DOLP_ADR=3 
                           000005  5960 	DOLP_INW=5
                           000004  5961 	VSIZE=4 
      0020E2                       5962 do_loop:
      009E04 90               [ 2] 5963 	popw x 
      0020E3                       5964 	_vars VSIZE 
      009E05 85 A1            [ 2]    1     sub sp,#VSIZE 
      009E07 01               [ 2] 5965 	pushw x 
      009E08 27 02 85 51      [ 2] 5966 	ldw y,basicptr 
      009E0C 90 FD            [ 2] 5967 	ldw (DOLP_ADR,sp),y
      009E0E 90 85 81 00      [ 2] 5968 	ldw y,in.w 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E11 17 05            [ 2] 5969 	ldw (DOLP_INW,sp),y
      009E11 72 0D 52 30      [ 1] 5970 	inc loop_depth 
      009E15 FB               [ 4] 5971 	ret 
                                   5972 
                                   5973 ;--------------------------------
                                   5974 ; BASIC: UNTIL expr 
                                   5975 ; loop if exprssion is false 
                                   5976 ; else terminate loop
                                   5977 ;--------------------------------
      0020F7                       5978 until: 
      009E16 8E CC 86 56      [ 1] 5979 	tnz loop_depth 
      009E1A 26 03            [ 1] 5980 	jrne 1$ 
      009E1A 72 01 00         [ 2] 5981 	jp syntax_error 
      002100                       5982 1$: 
      009E1D 24 07 27         [ 4] 5983 	call relation 
      009E20 05 A6            [ 1] 5984 	cp a,#TK_INTGR
      009E22 07 CC            [ 1] 5985 	jreq 2$
      009E24 88 FB 79         [ 2] 5986 	jp syntax_error
      009E26                       5987 2$: 
      009E26 CD               [ 2] 5988 	tnzw x 
      009E27 89 EB            [ 1] 5989 	jrne 9$
      009E29 4D 26            [ 2] 5990 	ldw x,(DOLP_ADR,sp)
      009E2B 08 AE 40         [ 2] 5991 	ldw basicptr,x 
      009E2E 00 CD            [ 1] 5992 	ld a,(2,x)
      009E30 A8 C0 4F         [ 1] 5993 	ld count,a 
      009E33 81 05            [ 2] 5994 	ldw x,(DOLP_INW,sp)
      009E34 CF 00 00         [ 2] 5995 	ldw in.w,x 
      009E34 A1               [ 4] 5996 	ret 
      00211D                       5997 9$:	; remove loop data from stack  
      009E35 02               [ 2] 5998 	popw x
      00211E                       5999 	_drop VSIZE
      009E36 27 03            [ 2]    1     addw sp,#VSIZE 
      009E38 CC 88 F9 20      [ 1] 6000 	dec loop_depth 
      009E3B FC               [ 2] 6001 	jp (x)
                                   6002 
                                   6003 ;--------------------------
                                   6004 ; BASIC: PRTA...PRTI  
                                   6005 ;  return constant value 
                                   6006 ;  PORT  offset in GPIO
                                   6007 ;  array
                                   6008 ;---------------------------
      002125                       6009 const_porta:
      009E3B 7D 26 09         [ 2] 6010 	ldw x,#0
      009E3E CD 87            [ 1] 6011 	ld a,#TK_INTGR 
      009E40 18               [ 4] 6012 	ret 
      00212B                       6013 const_portb:
      009E41 55 00 04         [ 2] 6014 	ldw x,#1
      009E44 00 02            [ 1] 6015 	ld a,#TK_INTGR 
      009E46 81               [ 4] 6016 	ret 
      002131                       6017 const_portc:
      009E47 89 90 93         [ 2] 6018 	ldw x,#2
      009E4A CD 9A            [ 1] 6019 	ld a,#TK_INTGR 
      009E4C E3               [ 4] 6020 	ret 
      002137                       6021 const_portd:
      009E4D 25 05 A6         [ 2] 6022 	ldw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E50 09 CC            [ 1] 6023 	ld a,#TK_INTGR 
      009E52 88               [ 4] 6024 	ret 
      00213D                       6025 const_porte:
      009E53 FB 00 04         [ 2] 6026 	ldw x,#4
      009E54 A6 84            [ 1] 6027 	ld a,#TK_INTGR 
      009E54 55               [ 4] 6028 	ret 
      002143                       6029 const_portf:
      009E55 00 04 00         [ 2] 6030 	ldw x,#5
      009E58 02 72            [ 1] 6031 	ld a,#TK_INTGR 
      009E5A 5F               [ 4] 6032 	ret 
      002149                       6033 const_portg:
      009E5B 00 17 AE         [ 2] 6034 	ldw x,#6
      009E5E 40 00            [ 1] 6035 	ld a,#TK_INTGR 
      009E60 CF               [ 4] 6036 	ret 
      00214F                       6037 const_porth:
      009E61 00 18 1E         [ 2] 6038 	ldw x,#7
      009E64 01 CD            [ 1] 6039 	ld a,#TK_INTGR 
      009E66 84               [ 4] 6040 	ret 
      002155                       6041 const_porti:
      009E67 16 5F 97         [ 2] 6042 	ldw x,#8
      009E6A 5C 90            [ 1] 6043 	ld a,#TK_INTGR 
      009E6C 85               [ 4] 6044 	ret 
                                   6045 
                                   6046 ;-------------------------------
                                   6047 ; following return constant 
                                   6048 ; related to GPIO register offset 
                                   6049 ;---------------------------------
      00215B                       6050 const_odr:
      009E6D 89 5F            [ 1] 6051 	ld a,#TK_INTGR 
      009E6F CD 82 DA         [ 2] 6052 	ldw x,#GPIO_ODR
      009E72 5B               [ 4] 6053 	ret 
      002161                       6054 const_idr:
      009E73 02 81            [ 1] 6055 	ld a,#TK_INTGR 
      009E75 AE 00 01         [ 2] 6056 	ldw x,#GPIO_IDR
      009E75 72               [ 4] 6057 	ret 
      002167                       6058 const_ddr:
      009E76 0D 52            [ 1] 6059 	ld a,#TK_INTGR 
      009E78 30 FB 72         [ 2] 6060 	ldw x,#GPIO_DDR
      009E7B 16               [ 4] 6061 	ret 
      00216D                       6062 const_cr1:
      009E7C 00 24            [ 1] 6063 	ld a,#TK_INTGR 
      009E7E 8E 81 03         [ 2] 6064 	ldw x,#GPIO_CR1
      009E80 81               [ 4] 6065 	ret 
      002173                       6066 const_cr2:
      009E80 CD 91            [ 1] 6067 	ld a,#TK_INTGR 
      009E82 91 A1 84         [ 2] 6068 	ldw x,#GPIO_CR2
      009E85 27               [ 4] 6069 	ret 
                                   6070 ;-------------------------
                                   6071 ;  constant for port mode
                                   6072 ;  used by PMODE 
                                   6073 ;  input or output
                                   6074 ;------------------------
      002179                       6075 const_output:
      009E86 03 CC            [ 1] 6076 	ld a,#TK_INTGR 
      009E88 88 F9 01         [ 2] 6077 	ldw x,#OUTP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E8A 81               [ 4] 6078 	ret 
      00217F                       6079 const_input:
      009E8A 5D 27            [ 1] 6080 	ld a,#TK_INTGR 
      009E8C 04 8F 5A         [ 2] 6081 	ldw x,#INP 
      009E8F 26               [ 4] 6082 	ret 
                                   6083 ;-----------------------
                                   6084 ; memory area constants
                                   6085 ;-----------------------
      002185                       6086 const_eeprom_base:
      009E90 F9 4F            [ 1] 6087 	ld a,#TK_INTGR 
      009E92 81 40 00         [ 2] 6088 	ldw x,#EEPROM_BASE 
      009E93 81               [ 4] 6089 	ret 
                                   6090 
                                   6091 ;---------------------------
                                   6092 ; BASIC: DATA 
                                   6093 ; when the interpreter find 
                                   6094 ; a DATA line it skip it.
                                   6095 ;---------------------------
      00218B                       6096 data:
      009E93 CD 91 91 A1 84   [ 1] 6097 	mov in,count 
      009E98 27               [ 4] 6098 	ret 
                                   6099 
                                   6100 ;---------------------------
                                   6101 ; BASIC: DATLN  *expr*
                                   6102 ; set DATA pointer at line# 
                                   6103 ; specified by *expr* 
                                   6104 ;---------------------------
      002191                       6105 data_line:
      009E99 03 CC 88         [ 4] 6106 	call expression
      009E9C F9 84            [ 1] 6107 	cp a,#TK_INTGR
      009E9D 27 03            [ 1] 6108 	jreq 1$
      009E9D A3 14 00         [ 2] 6109 	jp syntax_error 
      009EA0 2B 0C 35         [ 4] 6110 1$: call search_lineno
      009EA3 0F               [ 2] 6111 	tnzw x 
      009EA4 50 F2            [ 1] 6112 	jrne 3$
      009EA6 A6 1E            [ 1] 6113 2$:	ld a,#ERR_NO_LINE 
      009EA8 62 A6 10         [ 2] 6114 	jp tb_error
      0021A6                       6115 3$: ; check if valid data line 
      009EAB 62 20            [ 1] 6116     ldw y,x 
      009EAD 1E 04            [ 2] 6117 	ldw x,(4,x)
      009EAE A3 21 8B         [ 2] 6118 	cpw x,#data 
      009EAE A3 08            [ 1] 6119 	jrne 2$ 
      009EB0 00 2B 09 35      [ 2] 6120 	ldw data_ptr,y
      009EB4 0E 50 F2         [ 1] 6121 	ld a,(2,y)
      009EB7 A6 50 62         [ 1] 6122 	ld data_len,a 
      009EBA 20 10 00 08      [ 1] 6123 	mov data_ofs,#FIRST_DATA_ITEM 
      009EBC 81               [ 4] 6124 	ret
                                   6125 
                                   6126 ;---------------------------------
                                   6127 ; BASIC: RESTORE 
                                   6128 ; set data_ptr to first data line
                                   6129 ; if not DATA found pointer set to
                                   6130 ; zero 
                                   6131 ;---------------------------------
      0021BE                       6132 restore:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EBC 35 07 50 F2      [ 1] 6133 	clr data_ptr 
      009EC0 72 5F 00 07      [ 1] 6134 	clr data_ptr+1
      009EC0 A3 00 40 23      [ 1] 6135 	clr data_ofs 
      009EC4 07 72 5C 50      [ 1] 6136 	clr data_len
      009EC8 F2 54 20         [ 2] 6137 	ldw x,txtbgn
      0021D1                       6138 data_search_loop: 	
      009ECB F4 00 1E         [ 2] 6139 	cpw x,txtend
      009ECC 24 17            [ 1] 6140 	jruge 9$
      009ECC 9F 4A            [ 1] 6141 	ldw y,x 
      009ECE 27 01            [ 2] 6142 	ldw x,(4,x)
      009ED0 4A 21 8B         [ 2] 6143 	cpw x,#data 
      009ED1 26 1A            [ 1] 6144 	jrne try_next_line 
      009ED1 A4 3E C7 50      [ 2] 6145 	ldw data_ptr,y 
      009ED5 F1 72 18         [ 1] 6146 	ld a,(2,y)
      009ED8 50 F0 8E         [ 1] 6147 	ld data_len,a 
      009EDB 81 06 00 08      [ 1] 6148 	mov data_ofs,#FIRST_DATA_ITEM
      009EDC 72 5D 00 09      [ 1] 6149 9$:	tnz data_len 
      009EDC CE 00            [ 1] 6150     jrne 10$
      009EDE 0F A6            [ 1] 6151 	ld a,#ERR_NO_DATA 
      009EE0 84 81 7B         [ 2] 6152 	jp tb_error 
      009EE2 81               [ 4] 6153 10$:ret
      0021F9                       6154 try_next_line:
      009EE2 CD               [ 1] 6155 	ldw x,y 
      009EE3 90 93            [ 1] 6156 	ld a,(2,x)
      009EE5 A1 01 27         [ 1] 6157 	ld acc8,a 
      009EE8 03 CC 88 F9      [ 1] 6158 	clr acc16 
      009EEC 72 BB 00 0C      [ 2] 6159 	addw x,acc16 
      009EEC 85 9E            [ 2] 6160 	jra data_search_loop
                                   6161 
                                   6162 
                                   6163 ;---------------------------------
                                   6164 ; BASIC: READ 
                                   6165 ; return next data item | 0 
                                   6166 ;---------------------------------
                           000001  6167 	CTX_BPTR=1 
                           000003  6168 	CTX_IN=3 
                           000004  6169 	CTX_COUNT=4 
                           000005  6170 	XSAVE=5
                           000006  6171 	VSIZE=6
      002209                       6172 read:
      002209                       6173 	_vars  VSIZE 
      009EEE A5 80            [ 2]    1     sub sp,#VSIZE 
      00220B                       6174 read01:	
      009EF0 27 01 50         [ 1] 6175 	ld a,data_ofs
      009EF3 A6 84 81         [ 1] 6176 	cp a,data_len 
      009EF6 27 37            [ 1] 6177 	jreq 2$ ; end of line  
      009EF6 CD 90 93         [ 4] 6178 	call save_context
      009EF9 A1 02 27         [ 2] 6179 	ldw x,data_ptr 
      009EFC 03 CC 88         [ 2] 6180 	ldw basicptr,x 
      009EFF F9 85 9E 14 01   [ 1] 6181 	mov in,data_ofs 
      009F04 95 9F 14 02 97   [ 1] 6182 	mov count,data_len  
      009F09 5B 02 A6         [ 4] 6183 	call expression 
      009F0C 84 81            [ 1] 6184 	cp a,#TK_INTGR 
      009F0E 27 03            [ 1] 6185 	jreq 1$ 
      009F0E CD 90 93         [ 2] 6186 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      002230                       6187 1$:
      009F11 A1 02            [ 2] 6188 	ldw (XSAVE,SP),x
      009F13 27 03 CC         [ 4] 6189 	call next_token ; skip comma
      009F16 88 F9 04         [ 2] 6190 	ldw x,basicptr 
      009F18 CF 00 06         [ 2] 6191 	ldw data_ptr,x 
      009F18 85 9E 1A 01 95   [ 1] 6192 	mov data_ofs,in 
      009F1D 9F 1A 02         [ 4] 6193 	call rest_context
      009F20 97 5B            [ 2] 6194 	ldw x,(XSAVE,sp)
      009F22 02 A6            [ 1] 6195 	ld a,#TK_INTGR
      002247                       6196 	_drop VSIZE 
      009F24 84 81            [ 2]    1     addw sp,#VSIZE 
      009F26 81               [ 4] 6197 	ret 
      00224A                       6198 2$: ; end of line reached 
      009F26 CD 90 93 A1      [ 2] 6199 	ldw y, data_ptr 
      009F2A 02 27 03 CC      [ 1] 6200 	clr data_ptr
      009F2E 88 F9 00 07      [ 1] 6201 	clr data_ptr+1   
      009F30 72 5F 00 08      [ 1] 6202 	clr data_ofs 
      009F30 85 9E 18 01      [ 1] 6203 	clr data_len 
      009F34 95 9F 18         [ 4] 6204 	call try_next_line 
      009F37 02 97            [ 2] 6205 	jra read01
                                   6206 
                                   6207 
                                   6208 ;---------------------------------
                                   6209 ; BASIC: SPIEN clkdiv, 0|1  
                                   6210 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6211 ; if clkdiv==-1 disable SPI
                                   6212 ; 0|1 -> disable|enable  
                                   6213 ;--------------------------------- 
                           000005  6214 SPI_CS_BIT=5
      002263                       6215 spi_enable:
      009F39 5B 02 A6         [ 4] 6216 	call arg_list 
      009F3C 84 81            [ 1] 6217 	cp a,#2
      009F3E 27 03            [ 1] 6218 	jreq 1$
      009F3E CD 90 93         [ 2] 6219 	jp syntax_error 
      00226D                       6220 1$: 
      009F41 A1 02 27 03      [ 1] 6221 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F45 CC               [ 2] 6222 	popw x  
      009F46 88               [ 2] 6223 	tnzw x 
      009F47 F9 90            [ 1] 6224 	jreq spi_disable 
      009F49 85               [ 2] 6225 	popw x 
      009F4A 85 90            [ 1] 6226 	ld a,#(1<<SPI_CR1_BR)
      009F4C 5D               [ 4] 6227 	mul x,a 
      009F4D 27               [ 1] 6228 	ld a,xl 
      009F4E 05 58 90         [ 1] 6229 	ld SPI_CR1,a 
                                   6230 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F51 5A 26 FB 14      [ 1] 6231 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F54 72 1A 50 16      [ 1] 6232 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6233 ; configure SPI as master mode 0.	
      009F54 A6 84 81 00      [ 1] 6234 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6235 ; ~CS line controlled by sofware 	
      009F57 72 12 52 01      [ 1] 6236 	bset SPI_CR2,#SPI_CR2_SSM 
      009F57 CD 90 93 A1      [ 1] 6237     bset SPI_CR2,#SPI_CR2_SSI 
                                   6238 ; enable SPI
      009F5B 02 27 03 CC      [ 1] 6239 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F5F 88               [ 4] 6240 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      002296                       6241 spi_disable:
      002296                       6242 	_drop #2; throw first argument.
      009F60 F9 90            [ 2]    1     addw sp,##2 
                                   6243 ; wait spi idle 
      009F62 85 85            [ 1] 6244 1$:	ld a,#0x82 
      009F64 90 5D 27         [ 1] 6245 	and a,SPI_SR
      009F67 05 54            [ 1] 6246 	cp a,#2 
      009F69 90 5A            [ 1] 6247 	jrne 1$
      009F6B 26 FB 52 00      [ 1] 6248 	bres SPI_CR1,#SPI_CR1_SPE
      009F6D 72 13 50 C7      [ 1] 6249 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F6D A6 84 81 16      [ 1] 6250 	bres PE_DDR,#SPI_CS_BIT 
      009F70 81               [ 4] 6251 	ret 
                                   6252 
      0022AE                       6253 spi_clear_error:
      009F70 A6 84            [ 1] 6254 	ld a,#0x78 
      009F72 CD 90 86         [ 1] 6255 	bcp a,SPI_SR 
      009F75 9F A4            [ 1] 6256 	jreq 1$
      009F77 07 C7 50 C6      [ 1] 6257 	clr SPI_SR 
      009F7B 81               [ 4] 6258 1$: ret 
                                   6259 
      009F7C                       6260 spi_send_byte:
      009F7C 52               [ 1] 6261 	push a 
      009F7D 01 CD 90         [ 4] 6262 	call spi_clear_error
      009F80 98               [ 1] 6263 	pop a 
      009F81 A1 02 27 03 CC   [ 2] 6264 	btjf SPI_SR,#SPI_SR_TXE,.
      009F86 88 F9 90         [ 1] 6265 	ld SPI_DR,a
      009F89 85 85 CD 9F BD   [ 2] 6266 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F8E 6B 01 A6         [ 1] 6267 	ld a,SPI_DR 
      009F91 01               [ 4] 6268 	ret 
                                   6269 
      0022D0                       6270 spi_rcv_byte:
      009F92 0D 01            [ 1] 6271 	ld a,#255
      009F94 27 0B 48 0A 01   [ 2] 6272 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F99 26 FB 6B         [ 1] 6273 	ld a,SPI_DR 
      009F9C 01               [ 4] 6274 	ret
                                   6275 
                                   6276 ;------------------------------
                                   6277 ; BASIC: SPIWR byte [,byte]
                                   6278 ; write 1 or more byte
                                   6279 ;------------------------------
      0022DB                       6280 spi_write:
      009F9D EA 03 E7         [ 4] 6281 	call expression
      009FA0 03 90            [ 1] 6282 	cp a,#TK_INTGR 
      009FA2 A3 00            [ 1] 6283 	jreq 1$
      009FA4 01 27 07         [ 2] 6284 	jp syntax_error 
      0022E5                       6285 1$:	
      009FA7 7B               [ 1] 6286 	ld a,xl 
      009FA8 01 43 E4         [ 4] 6287 	call spi_send_byte 
      009FAB 02 20 0A         [ 4] 6288 	call next_token 
      009FAE A1 09            [ 1] 6289 	cp a,#TK_COMMA 
      009FAE 7B 01            [ 1] 6290 	jrne 2$ 
      009FB0 EA 04            [ 2] 6291 	jra spi_write 
      009FB2 E7               [ 1] 6292 2$:	tnz a 
      009FB3 04 7B            [ 1] 6293 	jreq 3$
      0022F5                       6294 	_unget_token  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FB5 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
      009FBA 5B               [ 4] 6295 3$:	ret 
                                   6296 
                                   6297 
                                   6298 ;-------------------------------
                                   6299 ; BASIC: SPIRD 	
                                   6300 ; read one byte from SPI 
                                   6301 ;-------------------------------
      0022FB                       6302 spi_read:
      009FBB 01 81 D0         [ 4] 6303 	call spi_rcv_byte 
      009FBD 5F               [ 1] 6304 	clrw x 
      009FBD 58               [ 1] 6305 	ld xl,a 
      009FBE 1C 9F            [ 1] 6306 	ld a,#TK_INTGR 
      009FC0 CD               [ 4] 6307 	ret 
                                   6308 
                                   6309 ;------------------------------
                                   6310 ; BASIC: SPISEL 0|1 
                                   6311 ; set state of ~CS line
                                   6312 ; 0|1 deselect|select  
                                   6313 ;------------------------------
      002303                       6314 spi_select:
      009FC1 FE 9F 88         [ 4] 6315 	call next_token 
      009FC4 5E A6            [ 1] 6316 	cp a,#TK_INTGR 
      009FC6 05 42            [ 1] 6317 	jreq 1$
      009FC8 1C 50 00         [ 2] 6318 	jp syntax_error 
      009FCB 84               [ 2] 6319 1$: tnzw x  
      009FCC 81 05            [ 1] 6320 	jreq cs_high 
      009FCD 72 1B 50 14      [ 1] 6321 	bres PE_ODR,#SPI_CS_BIT
      009FCD 03               [ 4] 6322 	ret 
      002315                       6323 cs_high: 
      009FCE 06 03 05 04      [ 1] 6324 	bset PE_ODR,#SPI_CS_BIT
      009FD2 00               [ 4] 6325 	ret 
                                   6326 
                                   6327 
                                   6328 ;-------------------------------
                                   6329 ; BASIC: PAD 
                                   6330 ; Return pad buffer address.
                                   6331 ;------------------------------
      00231A                       6332 pad_ref:
      009FD3 02 01 06         [ 2] 6333 	ldw x,#pad 
      009FD6 00 02            [ 1] 6334 	ld a,TK_INTGR
      009FD8 02               [ 4] 6335 	ret 
                                   6336 
                                   6337 ;------------------------------
                                   6338 ;      dictionary 
                                   6339 ; format:
                                   6340 ;   link:   2 bytes 
                                   6341 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6342 ;   cmd_name: 16 byte max 
                                   6343 ;   cmd_index: 2 bytes 
                                   6344 ;------------------------------
                                   6345 	.macro _dict_entry len,name,cmd_idx 
                                   6346 	.word LINK 
                                   6347 	LINK=.
                                   6348 name:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6349 	.byte len 	
                                   6350 	.ascii "name"
                                   6351 	.word cmd_idx 
                                   6352 	.endm 
                                   6353 
                           000000  6354 	LINK=0
                                   6355 ; respect alphabetic order for BASIC names from Z-A
                                   6356 ; this sort order is for a cleaner WORDS cmd output. 	
      002320                       6357 kword_end:
      002320                       6358 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009FD9 02 03                    1 	.word LINK 
                           002322     2 	LINK=.
      002322                          3 XOR:
      009FDB 03                       4 	.byte 3+F_IFUNC 	
      009FDC 01 03 03                 5 	.ascii "XOR"
      009FDF 02 04                    6 	.word XOR_IDX 
      002328                       6359 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009FE1 04 05                    1 	.word LINK 
                           00232A     2 	LINK=.
      00232A                          3 WRITE:
      009FE3 02                       4 	.byte 5 	
      009FE4 06 02 07 02 05           5 	.ascii "WRITE"
      009FE9 04 02                    6 	.word WRITE_IDX 
      002332                       6360 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009FEB 04 01                    1 	.word LINK 
                           002334     2 	LINK=.
      009FED                          3 WORDS:
      009FED CD                       4 	.byte 5 	
      009FEE 90 93 A1 01 27           5 	.ascii "WORDS"
      009FF3 03 CC                    6 	.word WORDS_IDX 
      00233C                       6361 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009FF5 88 F9                    1 	.word LINK 
                           00233E     2 	LINK=.
      009FF7                          3 WAIT:
      009FF7 A6                       4 	.byte 4 	
      009FF8 80 15 01 27              5 	.ascii "WAIT"
      009FFC 05 A6                    6 	.word WAIT_IDX 
      002345                       6362 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009FFE 0A CC                    1 	.word LINK 
                           002347     2 	LINK=.
      002347                          3 USR:
      00A000 88                       4 	.byte 3+F_IFUNC 	
      00A001 FB 53 52                 5 	.ascii "USR"
      00A002 00 BE                    6 	.word USR_IDX 
      00234D                       6363 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A002 CE 00                    1 	.word LINK 
                           00234F     2 	LINK=.
      00234F                          3 UNTIL:
      00A004 13                       4 	.byte 5 	
      00A005 58 58 58 58 58           5 	.ascii "UNTIL"
      00A00A 9E C8                    6 	.word UNTIL_IDX 
      002357                       6364 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A00C 00 13                    1 	.word LINK 
                           002359     2 	LINK=.
      002359                          3 UFLASH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A00E C7                       4 	.byte 6+F_IFUNC 	
      00A00F 00 0D 9F C8 00 14        5 	.ascii "UFLASH"
      00A015 C7 00                    6 	.word UFLASH_IDX 
      002362                       6365 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound 
      00A017 0E CE                    1 	.word LINK 
                           002364     2 	LINK=.
      002364                          3 UBOUND:
      00A019 00                       4 	.byte 6+F_IFUNC 	
      00A01A 15 CF 00 13 90 54        5 	.ascii "UBOUND"
      00A020 90 9E                    6 	.word UBOUND_IDX 
      00236D                       6366 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A022 C8 00                    1 	.word LINK 
                           00236F     2 	LINK=.
      00236F                          3 TONE:
      00A024 15                       4 	.byte 4 	
      00A025 C7 00 15 90              5 	.ascii "TONE"
      00A029 9F C8                    6 	.word TONE_IDX 
      002376                       6367 	_dict_entry,2,TO,TO_IDX;to
      00A02B 00 16                    1 	.word LINK 
                           002378     2 	LINK=.
      002378                          3 TO:
      00A02D C7                       4 	.byte 2 	
      00A02E 00 16                    5 	.ascii "TO"
      00A030 CE 00                    6 	.word TO_IDX 
      00237D                       6368 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A032 0D 54                    1 	.word LINK 
                           00237F     2 	LINK=.
      00237F                          3 TIMEOUT:
      00A034 54                       4 	.byte 7+F_IFUNC 	
      00A035 54 9E C8 00 0D 95 9F     5 	.ascii "TIMEOUT"
      00A03C C8 00                    6 	.word TMROUT_IDX 
      002389                       6369 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A03E 0E 97                    1 	.word LINK 
                           00238B     2 	LINK=.
      00238B                          3 TIMER:
      00A040 C8                       4 	.byte 5 	
      00A041 00 16 97 9E C8           5 	.ascii "TIMER"
      00A046 00 15                    6 	.word TIMER_IDX 
      002393                       6370 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A048 95 CF                    1 	.word LINK 
                           002395     2 	LINK=.
      002395                          3 TICKS:
      00A04A 00                       4 	.byte 5+F_IFUNC 	
      00A04B 15 90 85 65 93           5 	.ascii "TICKS"
      00A050 5C AE                    6 	.word TICKS_IDX 
      00A051                       6371 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A051 A6 84                    1 	.word LINK 
                           00239F     2 	LINK=.
      00239F                          3 STOP:
      00A053 81                       4 	.byte 4 	
      00A054 53 54 4F 50              5 	.ascii "STOP"
      00A054 52 03                    6 	.word STOP_IDX 
      0023A6                       6372 	_dict_entry,4,STEP,STEP_IDX;step 
      00A056 0F 02                    1 	.word LINK 
                           0023A8     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0023A8                          3 STEP:
      00A058 0F                       4 	.byte 4 	
      00A059 03 90 AE A7              5 	.ascii "STEP"
      00A05D 3B 93                    6 	.word STEP_IDX 
      0023AF                       6373 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A05F F6 A4                    1 	.word LINK 
                           0023B1     2 	LINK=.
      0023B1                          3 SPIWR:
      00A061 0F                       4 	.byte 5 	
      00A062 6B 01 0C 03 5C           5 	.ascii "SPIWR"
      00A067 F6 CD                    6 	.word SPIWR_IDX 
      0023B9                       6374 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A069 83 40                    1 	.word LINK 
                           0023BB     2 	LINK=.
      0023BB                          3 SPISEL:
      00A06B 0C                       4 	.byte 6 	
      00A06C 02 0A 01 26 F5 A6        5 	.ascii "SPISEL"
      00A072 46 11                    6 	.word SPISEL_IDX 
      0023C4                       6375 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A074 02 2B                    1 	.word LINK 
                           0023C6     2 	LINK=.
      0023C6                          3 SPIEN:
      00A076 09                       4 	.byte 5 	
      00A077 A6 20 CD 83 40           5 	.ascii "SPIEN"
      00A07C 0C 02                    6 	.word SPIEN_IDX 
      0023CE                       6376 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A07E 20 07                    1 	.word LINK 
                           0023D0     2 	LINK=.
      0023D0                          3 SPIRD:
      00A080 A6                       4 	.byte 5+F_IFUNC 	
      00A081 0D CD 83 40 0F           5 	.ascii "SPIRD"
      00A086 02 72                    6 	.word SPIRD_IDX 
      0023D8                       6377 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A088 A2 00                    1 	.word LINK 
                           0023DA     2 	LINK=.
      0023DA                          3 SLEEP:
      00A08A 02                       4 	.byte 5 	
      00A08B 90 FE 26 CF A6           5 	.ascii "SLEEP"
      00A090 0D CD                    6 	.word SLEEP_IDX 
      0023E2                       6378 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A092 83 40                    1 	.word LINK 
                           0023E4     2 	LINK=.
      0023E4                          3 SIZE:
      00A094 5F                       4 	.byte 4+F_IFUNC 	
      00A095 7B 03 97 CD              5 	.ascii "SIZE"
      00A099 8A 4C                    6 	.word SIZE_IDX 
      0023EB                       6379     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A09B AE A0                    1 	.word LINK 
                           0023ED     2 	LINK=.
      0023ED                          3 SHOW:
      00A09D A4                       4 	.byte 4 	
      00A09E CD A8 C0 5B              5 	.ascii "SHOW"
      00A0A2 03 81                    6 	.word SHOW_IDX 
      0023F4                       6380 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A0A4 20 77                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                           0023F6     2 	LINK=.
      0023F6                          3 SAVE:
      00A0A6 6F                       4 	.byte 4 	
      00A0A7 72 64 73 20              5 	.ascii "SAVE"
      00A0AB 69 6E                    6 	.word SAVE_IDX 
      0023FD                       6381 	_dict_entry 3,RUN,RUN_IDX;run
      00A0AD 20 64                    1 	.word LINK 
                           0023FF     2 	LINK=.
      0023FF                          3 RUN:
      00A0AF 69                       4 	.byte 3 	
      00A0B0 63 74 69                 5 	.ascii "RUN"
      00A0B3 6F 6E                    6 	.word RUN_IDX 
      002405                       6382 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A0B5 61 72                    1 	.word LINK 
                           002407     2 	LINK=.
      002407                          3 RSHIFT:
      00A0B7 79                       4 	.byte 6+F_IFUNC 	
      00A0B8 0A 00 48 49 46 54        5 	.ascii "RSHIFT"
      00A0BA 00 96                    6 	.word RSHIFT_IDX 
      002410                       6383 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A0BA CD 90                    1 	.word LINK 
                           002412     2 	LINK=.
      002412                          3 RND:
      00A0BC 98                       4 	.byte 3+F_IFUNC 	
      00A0BD A1 01 27                 5 	.ascii "RND"
      00A0C0 03 CC                    6 	.word RND_IDX 
      002418                       6384 	_dict_entry,6,RETURN,RET_IDX;return 
      00A0C2 88 F9                    1 	.word LINK 
                           00241A     2 	LINK=.
      00A0C4                          3 RETURN:
      00A0C4 85                       4 	.byte 6 	
      00A0C5 CF 00 11 81 52 4E        5 	.ascii "RETURN"
      00A0C9 00 92                    6 	.word RET_IDX 
      002423                       6385 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A0C9 CE 00                    1 	.word LINK 
                           002425     2 	LINK=.
      002425                          3 RESTORE:
      00A0CB 11                       4 	.byte 7 	
      00A0CC 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A0CC 53 A3                    6 	.word REST_IDX 
      00242F                       6386 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A0CE FF FF                    1 	.word LINK 
                           002431     2 	LINK=.
      002431                          3 REMARK:
      00A0D0 27                       4 	.byte 6 	
      00A0D1 01 5F A6 84 81 4B        5 	.ascii "REMARK"
      00A0D6 00 8E                    6 	.word REM_IDX 
      00243A                       6387 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A0D6 CD 90                    1 	.word LINK 
                           00243C     2 	LINK=.
      00243C                          3 REBOOT:
      00A0D8 93                       4 	.byte 6 	
      00A0D9 A1 01 27 03 CC 88        5 	.ascii "REBOOT"
      00A0DF F9 85                    6 	.word RBT_IDX 
      002445                       6388 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0E1 20 E9                    1 	.word LINK 
                           002447     2 	LINK=.
      00A0E3                          3 READ:
      00A0E3 CD                       4 	.byte 4+F_IFUNC 	
      00A0E4 90 98 A1 01              5 	.ascii "READ"
      00A0E8 27 03                    6 	.word READ_IDX 
      00244E                       6389 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A0EA CC 88                    1 	.word LINK 
                           002450     2 	LINK=.
      002450                          3 QKEY:
      00A0EC F9                       4 	.byte 4+F_IFUNC 	
      00A0ED 85 4B 00 35              5 	.ascii "QKEY"
      00A0F1 CC 50                    6 	.word QKEY_IDX 
      002457                       6390 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A0F3 E0 9E                    1 	.word LINK 
                           002459     2 	LINK=.
      002459                          3 PRTI:
      00A0F5 A4                       4 	.byte 4+F_IFUNC 	
      00A0F6 3F 95 A3 00              5 	.ascii "PRTI"
      00A0FA FF 23                    6 	.word PRTI_IDX 
      002460                       6391 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A0FC 06 0C                    1 	.word LINK 
                           002462     2 	LINK=.
      002462                          3 PRTH:
      00A0FE 01                       4 	.byte 4+F_IFUNC 	
      00A0FF 98 56 20 F5              5 	.ascii "PRTH"
      00A103 35 55                    6 	.word PRTH_IDX 
      002469                       6392 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A105 50 E0                    1 	.word LINK 
                           00246B     2 	LINK=.
      00246B                          3 PRTG:
      00A107 84                       4 	.byte 4+F_IFUNC 	
      00A108 C7 50 E1 9F              5 	.ascii "PRTG"
      00A10C 4A 35                    6 	.word PRTG_IDX 
      002472                       6393 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A10E 55 50                    1 	.word LINK 
                           002474     2 	LINK=.
      002474                          3 PRTF:
      00A110 E0                       4 	.byte 4+F_IFUNC 	
      00A111 C7 50 E2 35              5 	.ascii "PRTF"
      00A115 AA 50                    6 	.word PRTF_IDX 
      00247B                       6394 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A117 E0 81                    1 	.word LINK 
                           00247D     2 	LINK=.
      00A119                          3 PRTE:
      00A119 35                       4 	.byte 4+F_IFUNC 	
      00A11A AA 50 E0 81              5 	.ascii "PRTE"
      00A11E 00 7E                    6 	.word PRTE_IDX 
      002484                       6395 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A11E CD 90                    1 	.word LINK 
                           002486     2 	LINK=.
      002486                          3 PRTD:
      00A120 93                       4 	.byte 4+F_IFUNC 	
      00A121 A1 01 27 03              5 	.ascii "PRTD"
      00A125 CC 88                    6 	.word PRTD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00248D                       6396 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A127 F9 85                    1 	.word LINK 
                           00248F     2 	LINK=.
      00A129                          3 PRTC:
      00A129 5D                       4 	.byte 4+F_IFUNC 	
      00A12A 27 0A A6 0F              5 	.ascii "PRTC"
      00A12E 59 25                    6 	.word PRTC_IDX 
      002496                       6397 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A130 03 4A                    1 	.word LINK 
                           002498     2 	LINK=.
      002498                          3 PRTB:
      00A132 20                       4 	.byte 4+F_IFUNC 	
      00A133 FA 5F 97 A6              5 	.ascii "PRTB"
      00A137 84 81                    6 	.word PRTB_IDX 
      00A139                       6398 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A139 CD 90                    1 	.word LINK 
                           0024A1     2 	LINK=.
      0024A1                          3 PRTA:
      00A13B 93                       4 	.byte 4+F_IFUNC 	
      00A13C A1 01 27 03              5 	.ascii "PRTA"
      00A140 CC 88                    6 	.word PRTA_IDX 
      0024A8                       6399 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A142 F9 85                    1 	.word LINK 
                           0024AA     2 	LINK=.
      0024AA                          3 PRINT:
      00A144 9F                       4 	.byte 5 	
      00A145 A4 0F 5F 5C 4D           5 	.ascii "PRINT"
      00A14A 27 04                    6 	.word PRT_IDX 
      0024B2                       6400 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A14C 58 4A                    1 	.word LINK 
                           0024B4     2 	LINK=.
      0024B4                          3 POUT:
      00A14E 20                       4 	.byte 4+F_IFUNC 	
      00A14F F9 A6 84 81              5 	.ascii "POUT"
      00A153 00 72                    6 	.word POUT_IDX 
      0024BB                       6401 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A153 CD 90                    1 	.word LINK 
                           0024BD     2 	LINK=.
      0024BD                          3 POKE:
      00A155 93                       4 	.byte 4 	
      00A156 A1 01 27 03              5 	.ascii "POKE"
      00A15A CC 88                    6 	.word POKE_IDX 
      0024C4                       6402 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A15C F9 85                    1 	.word LINK 
                           0024C6     2 	LINK=.
      0024C6                          3 PINP:
      00A15E 53                       4 	.byte 4+F_IFUNC 	
      00A15F A6 84 81 50              5 	.ascii "PINP"
      00A162 00 6E                    6 	.word PINP_IDX 
      0024CD                       6403 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A162 85 52                    1 	.word LINK 
                           0024CF     2 	LINK=.
      0024CF                          3 PEEK:
      00A164 04                       4 	.byte 4+F_IFUNC 	
      00A165 89 90 CE 00              5 	.ascii "PEEK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A169 05 17                    6 	.word PEEK_IDX 
      0024D6                       6404 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A16B 03 90                    1 	.word LINK 
                           0024D8     2 	LINK=.
      0024D8                          3 PMODE:
      00A16D CE                       4 	.byte 5 	
      00A16E 00 01 17 05 72           5 	.ascii "PMODE"
      00A173 5C 00                    6 	.word PMODE_IDX 
      0024E0                       6405 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A175 21 81                    1 	.word LINK 
                           0024E2     2 	LINK=.
      00A177                          3 PAUSE:
      00A177 72                       4 	.byte 5 	
      00A178 5D 00 21 26 03           5 	.ascii "PAUSE"
      00A17D CC 88                    6 	.word PAUSE_IDX 
      0024EA                       6406 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A17F F9 E2                    1 	.word LINK 
                           0024EC     2 	LINK=.
      00A180                          3 PAD:
      00A180 CD                       4 	.byte 3+F_IFUNC 	
      00A181 91 DA A1                 5 	.ascii "PAD"
      00A184 84 27                    6 	.word PAD_IDX 
      0024F2                       6407 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A186 03 CC                    1 	.word LINK 
                           0024F4     2 	LINK=.
      0024F4                          3 OR:
      00A188 88                       4 	.byte 2+F_IFUNC 	
      00A189 F9 52                    5 	.ascii "OR"
      00A18A 00 64                    6 	.word OR_IDX 
      0024F9                       6408 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A18A 5D 26                    1 	.word LINK 
                           0024FB     2 	LINK=.
      0024FB                          3 ODR:
      00A18C 10                       4 	.byte 3+F_IFUNC 	
      00A18D 1E 03 CF                 5 	.ascii "ODR"
      00A190 00 05                    6 	.word ODR_IDX 
      002501                       6409 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A192 E6 02                    1 	.word LINK 
                           002503     2 	LINK=.
      002503                          3 NOT:
      00A194 C7                       4 	.byte 3+F_IFUNC 	
      00A195 00 04 1E                 5 	.ascii "NOT"
      00A198 05 CF                    6 	.word NOT_IDX 
      002509                       6410 	_dict_entry,3,NEW,NEW_IDX;new
      00A19A 00 01                    1 	.word LINK 
                           00250B     2 	LINK=.
      00250B                          3 NEW:
      00A19C 81                       4 	.byte 3 	
      00A19D 4E 45 57                 5 	.ascii "NEW"
      00A19D 85 5B                    6 	.word NEW_IDX 
      002511                       6411 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A19F 04 72                    1 	.word LINK 
                           002513     2 	LINK=.
      002513                          3 NEXT:
      00A1A1 5A                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1A2 00 21 FC 54              5 	.ascii "NEXT"
      00A1A5 00 5C                    6 	.word NEXT_IDX 
      00251A                       6412 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A1A5 AE 00                    1 	.word LINK 
                           00251C     2 	LINK=.
      00251C                          3 MULDIV:
      00A1A7 00                       4 	.byte 6+F_IFUNC 	
      00A1A8 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A1AB 00 5A                    6 	.word MULDIV_IDX 
      002525                       6413 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A1AB AE 00                    1 	.word LINK 
                           002527     2 	LINK=.
      002527                          3 LSHIFT:
      00A1AD 01                       4 	.byte 6+F_IFUNC 	
      00A1AE A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A1B1 00 58                    6 	.word LSHIFT_IDX 
      002530                       6414 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A1B1 AE 00                    1 	.word LINK 
                           002532     2 	LINK=.
      002532                          3 LOG:
      00A1B3 02                       4 	.byte 3+F_IFUNC 	
      00A1B4 A6 84 81                 5 	.ascii "LOG"
      00A1B7 00 56                    6 	.word LOG_IDX 
      002538                       6415 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A1B7 AE 00                    1 	.word LINK 
                           00253A     2 	LINK=.
      00253A                          3 LOAD:
      00A1B9 03                       4 	.byte 4 	
      00A1BA A6 84 81 44              5 	.ascii "LOAD"
      00A1BD 00 54                    6 	.word LOAD_IDX 
      002541                       6416 	_dict_entry 4,LIST,LIST_IDX;list
      00A1BD AE 00                    1 	.word LINK 
                           002543     2 	LINK=.
      002543                          3 LIST:
      00A1BF 04                       4 	.byte 4 	
      00A1C0 A6 84 81 54              5 	.ascii "LIST"
      00A1C3 00 52                    6 	.word LIST_IDX 
      00254A                       6417 	_dict_entry 3,LET,LET_IDX;let 
      00A1C3 AE 00                    1 	.word LINK 
                           00254C     2 	LINK=.
      00254C                          3 LET:
      00A1C5 05                       4 	.byte 3 	
      00A1C6 A6 84 81                 5 	.ascii "LET"
      00A1C9 00 50                    6 	.word LET_IDX 
      002552                       6418 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A1C9 AE 00                    1 	.word LINK 
                           002554     2 	LINK=.
      002554                          3 KEY:
      00A1CB 06                       4 	.byte 3+F_IFUNC 	
      00A1CC A6 84 81                 5 	.ascii "KEY"
      00A1CF 00 4E                    6 	.word KEY_IDX 
      00255A                       6419 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A1CF AE 00                    1 	.word LINK 
                           00255C     2 	LINK=.
      00255C                          3 IWDGREF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1D1 07                       4 	.byte 7 	
      00A1D2 A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1D5 00 4C                    6 	.word IWDGREF_IDX 
      002566                       6420 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A1D5 AE 00                    1 	.word LINK 
                           002568     2 	LINK=.
      002568                          3 IWDGEN:
      00A1D7 08                       4 	.byte 6 	
      00A1D8 A6 84 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1DB 00 4A                    6 	.word IWDGEN_IDX 
      002571                       6421 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A1DB A6 84                    1 	.word LINK 
                           002573     2 	LINK=.
      002573                          3 INVERT:
      00A1DD AE                       4 	.byte 6+F_IFUNC 	
      00A1DE 00 00 81 45 52 54        5 	.ascii "INVERT"
      00A1E1 00 48                    6 	.word INVERT_IDX 
      00257C                       6422 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A1E1 A6 84                    1 	.word LINK 
                           00257E     2 	LINK=.
      00257E                          3 INPUT:
      00A1E3 AE                       4 	.byte 5 	
      00A1E4 00 01 81 55 54           5 	.ascii "INPUT"
      00A1E7 00 46                    6 	.word INPUT_IDX 
      002586                       6423 	_dict_entry,2,IF,IF_IDX;if 
      00A1E7 A6 84                    1 	.word LINK 
                           002588     2 	LINK=.
      002588                          3 IF:
      00A1E9 AE                       4 	.byte 2 	
      00A1EA 00 02                    5 	.ascii "IF"
      00A1EC 81 44                    6 	.word IF_IDX 
      00A1ED                       6424 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A1ED A6 84                    1 	.word LINK 
                           00258F     2 	LINK=.
      00258F                          3 IDR:
      00A1EF AE                       4 	.byte 3+F_IFUNC 	
      00A1F0 00 03 81                 5 	.ascii "IDR"
      00A1F3 00 42                    6 	.word IDR_IDX 
      002595                       6425 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A1F3 A6 84                    1 	.word LINK 
                           002597     2 	LINK=.
      002597                          3 HEX:
      00A1F5 AE                       4 	.byte 3 	
      00A1F6 00 04 81                 5 	.ascii "HEX"
      00A1F9 00 40                    6 	.word HEX_IDX 
      00259D                       6426 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A1F9 A6 84                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 GPIO:
      00A1FB AE                       4 	.byte 4+F_IFUNC 	
      00A1FC 00 01 81 4F              5 	.ascii "GPIO"
      00A1FF 00 3E                    6 	.word GPIO_IDX 
      0025A6                       6427 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A1FF A6 84                    1 	.word LINK 
                           0025A8     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0025A8                          3 GOTO:
      00A201 AE                       4 	.byte 4 	
      00A202 00 00 81 4F              5 	.ascii "GOTO"
      00A205 00 3C                    6 	.word GOTO_IDX 
      0025AF                       6428 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A205 A6 84                    1 	.word LINK 
                           0025B1     2 	LINK=.
      0025B1                          3 GOSUB:
      00A207 AE                       4 	.byte 5 	
      00A208 40 00 81 55 42           5 	.ascii "GOSUB"
      00A20B 00 3A                    6 	.word GOSUB_IDX 
      0025B9                       6429 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A20B 55 00                    1 	.word LINK 
                           0025BB     2 	LINK=.
      0025BB                          3 FORGET:
      00A20D 04                       4 	.byte 6 	
      00A20E 00 02 81 47 45 54        5 	.ascii "FORGET"
      00A211 00 38                    6 	.word FORGET_IDX 
      0025C4                       6430 	_dict_entry,3,FOR,FOR_IDX;for 
      00A211 CD 91                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 FOR:
      00A213 91                       4 	.byte 3 	
      00A214 A1 84 27                 5 	.ascii "FOR"
      00A217 03 CC                    6 	.word FOR_IDX 
      0025CC                       6431 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A219 88 F9                    1 	.word LINK 
                           0025CE     2 	LINK=.
      0025CE                          3 FCPU:
      00A21B CD                       4 	.byte 4 	
      00A21C 84 82 5D 26              5 	.ascii "FCPU"
      00A220 05 A6                    6 	.word FCPU_IDX 
      0025D5                       6432 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A222 05 CC                    1 	.word LINK 
                           0025D7     2 	LINK=.
      0025D7                          3 EEPROM:
      00A224 88                       4 	.byte 6+F_IFUNC 	
      00A225 FB 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A226 00 32                    6 	.word EEPROM_IDX 
      0025E0                       6433 	_dict_entry,3,END,END_IDX;cmd_end  
      00A226 90 93                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 END:
      00A228 EE                       4 	.byte 3 	
      00A229 04 A3 A2                 5 	.ascii "END"
      00A22C 0B 26                    6 	.word END_IDX 
      0025E8                       6434 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A22E F2 90                    1 	.word LINK 
                           0025EA     2 	LINK=.
      0025EA                          3 DWRITE:
      00A230 CF                       4 	.byte 6+F_CMD 	
      00A231 00 07 90 E6 02 C7        5 	.ascii "DWRITE"
      00A237 00 0A                    6 	.word DWRITE_IDX 
      0025F3                       6435 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A239 35 06                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           0025F5     2 	LINK=.
      0025F5                          3 DREAD:
      00A23B 00                       4 	.byte 5+F_IFUNC 	
      00A23C 09 81 45 41 44           5 	.ascii "DREAD"
      00A23E 00 2C                    6 	.word DREAD_IDX 
      0025FD                       6436 	_dict_entry,2,DO,DO_IDX;do_loop
      00A23E 72 5F                    1 	.word LINK 
                           0025FF     2 	LINK=.
      0025FF                          3 DO:
      00A240 00                       4 	.byte 2 	
      00A241 07 72                    5 	.ascii "DO"
      00A243 5F 00                    6 	.word DO_IDX 
      002604                       6437 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A245 08 72                    1 	.word LINK 
                           002606     2 	LINK=.
      002606                          3 DIR:
      00A247 5F                       4 	.byte 3 	
      00A248 00 09 72                 5 	.ascii "DIR"
      00A24B 5F 00                    6 	.word DIR_IDX 
      00260C                       6438 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A24D 0A CE                    1 	.word LINK 
                           00260E     2 	LINK=.
      00260E                          3 DEC:
      00A24F 00                       4 	.byte 3 	
      00A250 1D 45 43                 5 	.ascii "DEC"
      00A251 00 26                    6 	.word DEC_IDX 
      002614                       6439 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A251 C3 00                    1 	.word LINK 
                           002616     2 	LINK=.
      002616                          3 DDR:
      00A253 1F                       4 	.byte 3+F_IFUNC 	
      00A254 24 17 90                 5 	.ascii "DDR"
      00A257 93 EE                    6 	.word DDR_IDX 
      00261C                       6440 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A259 04 A3                    1 	.word LINK 
                           00261E     2 	LINK=.
      00261E                          3 DATALN:
      00A25B A2                       4 	.byte 6 	
      00A25C 0B 26 1A 90 CF 00        5 	.ascii "DATALN"
      00A262 07 90                    6 	.word DATALN_IDX 
      002627                       6441 	_dict_entry,4,DATA,DATA_IDX;data  
      00A264 E6 02                    1 	.word LINK 
                           002629     2 	LINK=.
      002629                          3 DATA:
      00A266 C7                       4 	.byte 4 	
      00A267 00 0A 35 06              5 	.ascii "DATA"
      00A26B 00 09                    6 	.word DATA_IDX 
      002630                       6442 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A26D 72 5D                    1 	.word LINK 
                           002632     2 	LINK=.
      002632                          3 CRL:
      00A26F 00                       4 	.byte 3+F_IFUNC 	
      00A270 0A 26 05                 5 	.ascii "CRL"
      00A273 A6 0C                    6 	.word CRL_IDX 
      002638                       6443 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A275 CC 88                    1 	.word LINK 
                           00263A     2 	LINK=.
      00263A                          3 CRH:
      00A277 FB                       4 	.byte 3+F_IFUNC 	
      00A278 81 52 48                 5 	.ascii "CRH"
      00A279 00 1C                    6 	.word CRH_IDX 
      002640                       6444 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A279 93 E6                    1 	.word LINK 
                           002642     2 	LINK=.
      002642                          3 CHAR:
      00A27B 02                       4 	.byte 4+F_CFUNC 	
      00A27C C7 00 0E 72              5 	.ascii "CHAR"
      00A280 5F 00                    6 	.word CHAR_IDX 
      002649                       6445 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A282 0D 72                    1 	.word LINK 
                           00264B     2 	LINK=.
      00264B                          3 BYE:
      00A284 BB                       4 	.byte 3 	
      00A285 00 0D 20                 5 	.ascii "BYE"
      00A288 C8 18                    6 	.word BYE_IDX 
      00A289                       6446 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A289 52 06                    1 	.word LINK 
                           002653     2 	LINK=.
      00A28B                          3 BTOGL:
      00A28B C6                       4 	.byte 5 	
      00A28C 00 09 C1 00 0A           5 	.ascii "BTOGL"
      00A291 27 37                    6 	.word BTOGL_IDX 
      00265B                       6447 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A293 CD 95                    1 	.word LINK 
                           00265D     2 	LINK=.
      00265D                          3 BTEST:
      00A295 EF                       4 	.byte 5+F_IFUNC 	
      00A296 CE 00 07 CF 00           5 	.ascii "BTEST"
      00A29B 05 55                    6 	.word BTEST_IDX 
      002665                       6448 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A29D 00 09                    1 	.word LINK 
                           002667     2 	LINK=.
      002667                          3 BSET:
      00A29F 00                       4 	.byte 4 	
      00A2A0 02 55 00 0A              5 	.ascii "BSET"
      00A2A4 00 04                    6 	.word BSET_IDX 
      00266E                       6449 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A2A6 CD 91                    1 	.word LINK 
                           002670     2 	LINK=.
      002670                          3 BRES:
      00A2A8 91                       4 	.byte 4 	
      00A2A9 A1 84 27 03              5 	.ascii "BRES"
      00A2AD CC 88                    6 	.word BRES_IDX 
      002677                       6450 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A2AF F9 70                    1 	.word LINK 
                           002679     2 	LINK=.
      00A2B0                          3 BIT:
      00A2B0 1F                       4 	.byte 3+F_IFUNC 	
      00A2B1 05 CD 89                 5 	.ascii "BIT"
      00A2B4 EB CE                    6 	.word BIT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00267F                       6451 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A2B6 00 05                    1 	.word LINK 
                           002681     2 	LINK=.
      002681                          3 AWU:
      00A2B8 CF                       4 	.byte 3 	
      00A2B9 00 07 55                 5 	.ascii "AWU"
      00A2BC 00 02                    6 	.word AWU_IDX 
      002687                       6452 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A2BE 00 09                    1 	.word LINK 
                           002689     2 	LINK=.
      002689                          3 AUTORUN:
      00A2C0 CD                       4 	.byte 7 	
      00A2C1 95 FF 1E 05 A6 84 5B     5 	.ascii "AUTORUN"
      00A2C8 06 81                    6 	.word AUTORUN_IDX 
      00A2CA                       6453 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A2CA 90 CE                    1 	.word LINK 
                           002695     2 	LINK=.
      002695                          3 ASC:
      00A2CC 00                       4 	.byte 3+F_IFUNC 	
      00A2CD 07 72 5F                 5 	.ascii "ASC"
      00A2D0 00 07                    6 	.word ASC_IDX 
      00269B                       6454 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A2D2 72 5F                    1 	.word LINK 
                           00269D     2 	LINK=.
      00269D                          3 AND:
      00A2D4 00                       4 	.byte 3+F_IFUNC 	
      00A2D5 08 72 5F                 5 	.ascii "AND"
      00A2D8 00 09                    6 	.word AND_IDX 
      0026A3                       6455 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A2DA 72 5F                    1 	.word LINK 
                           0026A5     2 	LINK=.
      0026A5                          3 ADCREAD:
      00A2DC 00                       4 	.byte 7+F_IFUNC 	
      00A2DD 0A CD A2 79 20 A8 44     5 	.ascii "ADCREAD"
      00A2E3 00 04                    6 	.word ADCREAD_IDX 
      0026AF                       6456 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A2E3 CD 90                    1 	.word LINK 
                           0026B1     2 	LINK=.
      0026B1                          3 ADCON:
      00A2E5 98                       4 	.byte 5 	
      00A2E6 A1 02 27 03 CC           5 	.ascii "ADCON"
      00A2EB 88 F9                    6 	.word ADCON_IDX 
      00A2ED                       6457 kword_dict:
      0026B9                       6458 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A2ED 72 12                    1 	.word LINK 
                           0026BB     2 	LINK=.
      0026BB                          3 ABS:
      00A2EF 50                       4 	.byte 3+F_IFUNC 	
      00A2F0 C7 85 5D                 5 	.ascii "ABS"
      00A2F3 27 21                    6 	.word ABS_IDX 
                                   6459 
                                   6460 ;comands and fonctions address table 	
      0026C1                       6461 code_addr:
      00A2F5 85 A6 08 42 9F C7 52  6462 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             00 72 1A 50 14 72 1A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal  50-Bits]



             20 B9
      00A304 16 72 14 52 00 72 12  6463 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             52 01 72 10 52 01 72
      00A312 1C 52 00 81 21 91 21  6464 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             67 11 FB 1C 44 20 E2
             19 08 19 38
      00A316 18 44 21 85 1E F0 16  6465 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             B2 1B DD 17 AD 17 92
             1D 44
      00A316 5B 02 A6 82 C4 52 03  6466 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             A1 02 26 F7 72 1D 52
             00 72
      00A326 13 50 C7 72 1B 50 16  6467 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             81 1E BE 0F 6B 17 32
             19 BF
      00A32E 20 56 21 5B 1E 8E 23  6468 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             1A 1E 00 1E FC 16 8D
             21 7F
      00A32E A6 78 C5 52 03 27 04  6469 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             72 5F 52 03 81 21 37
             21 3D
      00A33A 21 43 21 49 21 4F 21  6470 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             55 1D 37 22 09 05 D6
             15 FB
      00A33A 88 CD A3 2E 84 72 03  6471 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             52 03 FB C7 52 04 72
             01 52
      00A34A 03 FB C6 52 04 81 23  6472 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             03 22 DB 17 0B 19 73
             1E 5C
      00A350 20 3A 20 49 16 DB 18  6473 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             54 12 0A 1D 6E 20 F7
             1D 74
      00A350 A6 FF 72 01 52 03 E3  6474 	.word wait,words,write,bit_xor ; 96..103 
             C6
      00A358 52 04                 6475 	.word 0 
                                   6476 
      002800                       6477 	.bndry 128 ; align on FLASH block.
                                   6478 ; free space for user application  
      002800                       6479 user_space:
                                   6480 ; USR() function test
      00A35A 81               [ 2] 6481 	pushw x 
      00A35B 72 1A 50 0A      [ 1] 6482 	bset PC_ODR,#5 
      00A35B CD               [ 2] 6483 	popw x 
      00A35C 91 91 A1         [ 4] 6484 	call pause02 
      00A35F 84 27 03 CC      [ 1] 6485 	bres PC_ODR,#5 
      00A363 88               [ 4] 6486 	ret
                                   6487 
                                   6488 	.area FLASH_DRIVE (ABS)
      010000                       6489 	.org 0x10000
      010000                       6490 fdrive:
                                   6491 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026BB R   |     ABS_IDX =  000000 
    ACK     =  000006     |   5 ADCON      0026B1 R   |     ADCON_ID=  000002 
  5 ADCREAD    0026A5 R   |     ADCREAD_=  000004     |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        00269D R
    AND_IDX =  000006     |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        002695 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
  5 AUTORUN    002689 R   |     AUTORUN_=  00000A     |     AUTORUN_=  004000 
  5 AWU        002681 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
    BINARY  =  000001     |   5 BIT        002679 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000E     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       002670 R   |     BRES_IDX=  000010     |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       002667 R   |     BSET_IDX=  000012 
    BSIZE   =  000001     |   5 BTEST      00265D R   |     BTEST_ID=  000014 
  5 BTOGL      002653 R   |     BTOGL_ID=  000016     |     BTW     =  000001 
  5 BYE        00264B R   |     BYE_IDX =  000018     |     C       =  000001 
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
  5 CHAR       002642 R   |     CHAR_IDX=  00001A     |     CLKOPT  =  004807 
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        00263A R
    CRH_IDX =  00001C     |   5 CRL        002632 R   |     CRL_IDX =  00001E 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       002629 R
  5 DATALN     00261E R   |     DATALN_I=  000022     |     DATA_IDX=  000020 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        002616 R   |     DDR_IDX =  000024 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   5 DEC        00260E R   |     DEC_IDX =  000026 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002606 R   |     DIR_IDX =  000028     |     DIVDNDHI=  00000B 
    DIVDNDLO=  00000D     |     DIVISOR =  000001     |     DIVISR  =  000007 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0025FF R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  00002A     |   5 DREAD      0025F5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    DREAD_ID=  00002C     |   5 DWRITE     0025EA R   |     DWRITE_I=  00002E 
  5 EEPROM     0025D7 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  000032     |     EEPROM_S=  000800     |     EM      =  000019 
  5 END        0025E2 R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025CE R
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        0025C6 R
  5 FORGET     0025BB R   |     FORGET_I=  000038     |     FOR_IDX =  000036 
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      0025B1 R   |     GOSUB_ID=  00003A 
  5 GOTO       0025A8 R   |     GOTO_IDX=  00003C     |   5 GPIO       00259F R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002597 R   |     HEX_IDX =  000040     |     HSECNT  =  004809 
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
  5 IDR        00258F R   |     IDR_IDX =  000042     |   5 IF         002588 R
    IF_IDX  =  000044     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00257E R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     002573 R
    INVERT_I=  000048     |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     002568 R   |     IWDGEN_I=  00004A 
  5 IWDGREF    00255C R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        002554 R
    KEY_IDX =  00004E     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        00254C R   |     LET_IDX =  000050 
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  0026BB R   |   5 LIST       002543 R   |     LIST_IDX=  000052 
    LL      =  000001     |     LLEN    =  000002     |     LN_PTR  =  000005 
  5 LOAD       00253A R   |     LOAD_IDX=  000054     |   5 LOG        002532 R
    LOG_IDX =  000056     |   5 LSHIFT     002527 R   |     LSHIFT_I=  000058 
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   5 MULDIV     00251C R
    MULDIV_I=  00005A     |     MULOP   =  000003     |     N1      =  000001 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        00250B R
    NEW_FREE=  000001     |     NEW_IDX =  00005E     |   5 NEXT       002513 R
    NEXT_IDX=  00005C     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

  5 NOT        002503 R   |     NOT_IDX =  000060     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0024FB R   |     ODR_IDX =  000062     |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024F4 R
    OR_IDX  =  000064     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
  5 PAD        0024EC R   |     PAD_IDX =  000066     |     PAD_SIZE=  000080 
  5 PAUSE      0024E2 R   |     PAUSE_ID=  000068     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0024CF R   |     PEEK_IDX=  00006C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       0024C6 R   |     PINP_IDX=  00006E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 PMODE      0024D8 R   |     PMODE_ID=  00006A 
  5 POKE       0024BD R   |     POKE_IDX=  000070     |     PORT    =  000003 
  5 POUT       0024B4 R   |     POUT_IDX=  000072     |     PREV    =  000001 
  5 PRINT      0024AA R   |   5 PRTA       0024A1 R   |     PRTA_IDX=  000076 
  5 PRTB       002498 R   |     PRTB_IDX=  000078     |   5 PRTC       00248F R
    PRTC_IDX=  00007A     |   5 PRTD       002486 R   |     PRTD_IDX=  00007C 
  5 PRTE       00247D R   |     PRTE_IDX=  00007E     |   5 PRTF       002474 R
    PRTF_IDX=  000080     |   5 PRTG       00246B R   |     PRTG_IDX=  000082 
  5 PRTH       002462 R   |     PRTH_IDX=  000084     |   5 PRTI       002459 R
    PRTI_IDX=  000086     |     PRT_IDX =  000074     |     PSTR    =  000003 
  5 QKEY       002450 R   |     QKEY_IDX=  000088     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     RBT_IDX =  00008C 
  5 READ       002447 R   |     READ_IDX=  00008A     |   5 REBOOT     00243C R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     002431 R
    REM_IDX =  00008E     |   5 RESTORE    002425 R   |     REST_IDX=  000090 
    RETL1   =  000001     |   5 RETURN     00241A R   |     RET_ADDR=  000003 
    RET_IDX =  000092     |     RET_INW =  000005     |   5 RND        002412 R
    RND_IDX =  000094     |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     002407 R   |     RSHIFT_I=  000096     |     RST_SR  =  0050B3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 RUN        0023FF R   |     RUN_IDX =  000098     |     RX_QUEUE=  000008 
  5 SAVE       0023F6 R   |     SAVE_IDX=  00009A     |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023ED R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       0023E4 R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      0023DA R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0023C6 R   |     SPIEN_ID=  0000A4     |   5 SPIRD      0023D0 R
    SPIRD_ID=  0000A2     |   5 SPISEL     0023BB R   |     SPISEL_I=  0000A6 
  5 SPIWR      0023B1 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       0023A8 R
    STEP_IDX=  0000AA     |   5 STOP       00239F R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002395 R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
  5 TIMEOUT    00237F R   |   5 TIMER      00238B R   |     TIMER_ID=  0000B0 
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
    TMROUT_I=  0000B2     |   5 TO         002378 R   |   5 TONE       00236F R
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
    UBC     =  004801     |   5 UBOUND     002364 R   |     UBOUND_I=  0000B8 
  5 UBTN_Han   000092 R   |   5 UFLASH     002359 R   |     UFLASH_I=  0000BA 
  5 UNTIL      00234F R   |     UNTIL_ID=  0000BC     |     US      =  00001F 
  5 USER_ABO   00009A R   |   5 USR        002347 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BE 
  5 Uart1RxH   00000F R   |   5 UserButt   000065 R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       00233E R   |     WAIT_IDX=  0000C0     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      002334 R   |     WORDS_ID=  0000C2 
  5 WRITE      00232A R   |     WRITE_ID=  0000C4     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        002322 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    XOR_IDX =  0000C6     |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        001E62 R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   0014BE R
  5 add_spac   0012E8 R   |   5 analog_r   0018D4 R   |   5 arduino_   001F4D R
  5 arg_list   001018 R   |   1 array_si   000021 R   |   5 ascii      001D0F R
  5 at_tst     000CAA R   |   5 atoi24     000DBB GR  |   5 atoi_exi   000E21 R
  5 autorun    001D9A R   |   5 autorun_   0006D0 R   |   5 awu        001E13 R
  5 awu02      001E1D R   |   5 bad_port   001D69 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       001861 R   |   5 beep_1kh   00184B GR
  5 bin_exit   000B88 R   |   5 bit_and    001E76 R   |   5 bit_or     001E8E R
  5 bit_rese   001636 R   |   5 bit_set    001626 R   |   5 bit_test   001657 R
  5 bit_togg   001647 R   |   5 bit_xor    001EA6 R   |   5 bitmask    0020B9 R
  5 bkslsh_t   000C57 R   |   5 block_er   0001BB R   |   5 break_po   0019A1 R
  5 bye        001D91 R   |   5 cancel_a   000698 R   |   5 char       001CFD R
  5 clear_ba   0006E5 R   |   5 clear_va   00055F R   |   5 clock_in   0000B5 R
  5 cmd_end    001844 R   |   5 cmd_line   000903 R   |   5 cmd_name   000F87 R
  5 cmp_name   001A42 R   |   5 code_add   0026C1 R   |   5 cold_sta   0005D6 R
  5 colon_ts   000C7E R   |   5 comma_ts   000C89 R   |   5 comp_msg   000859 R
  5 compile    0004EC R   |   5 const_cr   00216D R   |   5 const_cr   002173 R
  5 const_dd   002167 R   |   5 const_ee   002185 R   |   5 const_id   002161 R
  5 const_in   00217F R   |   5 const_od   00215B R   |   5 const_ou   002179 R
  5 const_po   002125 R   |   5 const_po   00212B R   |   5 const_po   002131 R
  5 const_po   002137 R   |   5 const_po   00213D R   |   5 const_po   002143 R
  5 const_po   002149 R   |   5 const_po   00214F R   |   5 const_po   002155 R
  5 convert_   000AFF R   |   5 copy_com   000CDF R   |   1 count      000003 GR
  5 cp_loop    000FC7 R   |   5 cpy_cmd_   0012D3 R   |   5 cpy_quot   00130C R
  5 create_g   000453 R   |   5 cs_high    002315 R   |   5 cstk_pro   0011CF R
  5 dash_tst   000C9F R   |   5 data       00218B R   |   1 data_len   000009 R
  5 data_lin   002191 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   0021D1 R   |   5 dbl_sign   000EEF R   |   5 dec_base   0011FB R
  5 decomp_l   0013BD R   |   5 decompil   001376 GR  |   5 del_line   000426 R
  5 digital_   001908 R   |   5 digital_   001938 R   |   5 dir_loop   001C50 R
  5 director   001C44 R   |   5 disk_fre   001A2F R   |   5 div32_16   000EF9 R
  5 divide     000F50 R   |   5 divu24_8   000A42 R   |   5 dneg       000EE4 R
  5 do_loop    0020E2 R   |   5 do_progr   0001AE R   |   5 drive_fr   001CB9 R
  5 enable_i   002063 R   |   5 eql_tst    000D34 R   |   5 equal      0014D1 R
  5 erase_fl   0001DA R   |   5 err_bad_   0007C5 R   |   5 err_buf_   00083B R
  5 err_cmd_   000789 R   |   5 err_div0   00074E R   |   5 err_dupl   0007A3 R
  5 err_math   000735 R   |   5 err_mem_   00071A R   |   5 err_msg    0006FA R
  5 err_no_a   0007D1 R   |   5 err_no_d   000804 R   |   5 err_no_f   000828 R
  5 err_no_l   00075D R   |   5 err_no_p   000814 R   |   5 err_not_   0007B4 R
  5 err_run_   000773 R   |   5 err_synt   000727 R   |   5 escaped    000B14 R
  5 expect     001006 R   |   5 expr_exi   001157 R   |   5 expressi   001111 R
  5 factor     001068 R   |   1 farptr     000016 R   |   5 fcpu       001EF0 R
  7 fdrive     010000 R   |   1 ffree      000019 R   |   5 file_cou   001CB1 R
  5 first_li   001280 R   |   1 flags      000023 R   |   5 for        0016B2 R
  5 forget     001BDD R   |   1 free_ram   000063 R   |   5 func_arg   001013 R
  5 func_not   002056 R   |   5 ge         0014D3 R   |   5 get_arra   001043 R
  5 get_cmd_   001355 R   |   5 get_targ   00177C R   |   5 get_tick   001E5C R
  5 get_toke   000BF0 R   |   5 getc       0002C9 GR  |   5 gosub      0017AD R
  5 goto       001792 R   |   5 gpio       001D44 R   |   5 gt         0014CF R
  5 gt_tst     000D3F R   |   5 hex_base   0011F6 R   |   5 hex_dump   000359 R
  5 if         00169E R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   0019EF R   |   5 input_ex   0015F8 R
  5 input_lo   001591 R   |   5 input_va   00158F R   |   5 insert_l   00047F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 insert_l   0004E9 R   |   5 interp_l   000944 R   |   5 interpre   00091F R
  5 invert     0020D3 R   |   5 is_alnum   000587 R   |   5 is_alpha   00056D R
  5 is_digit   00057E R   |   5 itoa       0009E8 R   |   5 itoa_loo   000A07 R
  5 jp_to_ta   0017A0 R   |   5 key        001D2F R   |   5 kw_loop    000BA4 R
  5 kword_di   0026B9 R   |   5 kword_en   002320 R   |   5 le         0014D8 R
  5 leading_   0020A9 R   |   5 let        00122C R   |   5 let_arra   00123A R
  5 let_var    00123D R   |   5 lines_sk   001283 R   |   5 list       001257 R
  5 list_exi   0012C5 R   |   5 list_loo   0012A3 R   |   5 load       001BAD R
  5 load_aut   0006A7 R   |   5 load_fil   001B7C R   |   5 log2       00209E R
  5 logical_   00204C R   |   5 long_div   000ECC R   |   5 loop_bac   00175F R
  1 loop_dep   000020 R   |   5 loop_don   001774 R   |   5 lshift     001EBE R
  5 lt         0014D6 R   |   5 lt_tst     000D68 R   |   5 modulo     000F66 R
  5 move       0003C0 GR  |   5 move_dow   0003DE R   |   5 move_era   000140 R
  5 move_exi   0003FF R   |   5 move_loo   0003E3 R   |   5 move_prg   000174 R
  5 move_up    0003D0 R   |   5 mul_char   0014C0 R   |   5 muldiv     000F6B R
  5 multiply   000E97 R   |   5 mulu24_8   000A6A R   |   5 nbr_tst    000C23 R
  5 ne         0014DB R   |   5 neg_acc2   000AA4 R   |   5 new        0019BF R
  5 next       001732 R   |   5 next_lin   000927 R   |   5 next_tok   00096B R
  5 no_match   000FD9 R   |   5 other      000D91 R   |   3 pad        0016E0 R
  5 pad_ref    00231A R   |   5 parse_bi   000B66 R   |   5 parse_in   000B1C R
  5 parse_ke   000BA3 R   |   5 parse_qu   000AC7 R   |   5 pause      001E00 R
  5 pause02    001E0A R   |   5 peek       00168D R   |   5 pin_mode   001EFC R
  5 plus_tst   000D08 R   |   5 poke       00167E R   |   5 power_ad   001898 R
  5 prcnt_ts   000D29 R   |   5 print      0014FE R   |   5 print_ex   001563 R
  5 print_in   0009CC R   |   5 printxy    000E38 R   |   5 program_   000154 R
  5 program_   000174 R   |   5 prt_basi   0014DE R   |   5 prt_loop   001502 R
  5 prt_tok    0002EB R   |   5 prti24     0009DC R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002C0 GR  |     puts       ****** GX
  5 qkey       001D37 GR  |   5 qmark_ts   000CB5 R   |   5 random     001F6D R
  5 read       002209 R   |   5 read01     00220B R   |     readln     ****** GX
  5 refresh_   002099 R   |   5 rel_exit   0011B2 R   |   5 relation   00115A R
  5 relop_st   0014C3 R   |   5 remark     0015FB R   |   5 reset_co   001500 R
  5 rest_con   00157F R   |   5 restore    0021BE R   |   5 return     0017CD R
  5 right_al   0012FA R   |   5 row_alig   0019D4 R   |   5 row_eras   000119 R
  5 row_eras   000140 R   |   5 row_loop   00033C R   |   5 rparnt_t   000C73 R
  5 rshift     001ED7 R   |   5 rt_msg     000848 R   |   5 run        0017EB R
  5 run_it     00181D R   |   1 rx_head    00002D R   |   1 rx_queue   000025 R
  1 rx_tail    00002E R   |   5 save       001AB0 R   |   5 save_con   00156F R
  5 search_d   000FB9 R   |   5 search_e   001003 R   |   5 search_f   001A63 R
  5 search_l   000402 GR  |   5 search_l   00040A R   |   5 search_n   000FBD R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   0019FD R
  5 select_p   001F3D R   |   5 set_time   00203A R   |   5 sharp_ts   000C94 R
  5 show       0011B5 R   |   5 show_row   00032A R   |   5 single_c   0014B9 R
  5 size       001200 R   |   5 skip       000E25 R   |   5 slash_ts   000D1E R
  5 sleep      001DF5 R   |   5 software   000590 R   |     spaces     ****** GX
  5 spi_clea   0022AE R   |   5 spi_disa   002296 R   |   5 spi_enab   002263 R
  5 spi_rcv_   0022D0 R   |   5 spi_read   0022FB R   |   5 spi_sele   002303 R
  5 spi_send   0022BA R   |   5 spi_writ   0022DB R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D13 R   |   5 step       00170B R
  5 stop       001973 R   |   5 store_lo   00171F R   |   5 str_matc   000FE6 R
  5 str_tst    000C13 R   |   5 strcmp     0003A1 R   |   5 strcpy     0003B2 R
  5 strlen     000396 GR  |   5 syntax_e   000879 R   |   1 tab_widt   000024 R
  5 tb_error   00087B R   |   5 term       0010C2 R   |   5 term01     0010CB R
  5 term_exi   00110E R   |   3 tib        001690 GR  |   5 tick_tst   000CCD R
  1 ticks      00000E R   |   5 timeout    002049 R   |   1 timer      000010 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 timer2_i   0000CB R   |   5 timer4_i   0000D8 R   |   5 tk_id      000869 R
  5 to         0016DB R   |   5 to_eepro   000197 R   |   5 to_flash   0001AB R
  5 to_upper   000DAF GR  |   5 token_ch   000DA8 R   |   5 token_ex   000DAC R
  5 token_ms   000322 R   |   5 tone       001854 R   |   5 try_next   0021F9 R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart1_in   00027D R
  5 uart1_se   00028D R   |   5 ubound     00120A R   |   5 udiv32_1   000EBA R
  5 uflash     001D6E R   |   5 umstar     000E5D R   |   5 unlock_e   0000ED R
  5 unlock_f   000103 R   |   5 until      0020F7 R   |   5 user_int   000078 R
  5 user_spa   002800 R   |   5 usr        001D74 R   |   5 var_name   00134D R
  1 vars       00002F R   |   5 wait       001601 R   |   5 warm_ini   00067A R
  5 warm_sta   000900 R   |   5 words      001FD4 R   |   5 words_co   002024 R
  5 write      001CC6 R   |   5 write_bl   00025A R   |   5 write_by   0001E5 R
  5 write_ee   000221 R   |   5 write_ex   000255 R   |   5 write_fl   00020B R
  5 write_ro   000188 R   |   5 zero_pad   0019C9 R

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

