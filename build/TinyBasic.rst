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
      0080F7 CD 94 0B         [ 4]  249 	call prt_basic_line
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
      0082DF CD 9A 29         [ 4]  589 	call incr_farptr
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



      0086CD CD 9A 37         [ 4] 1307 	call seek_fdrive 
      0086D0 9A               [ 1] 1308 	rim 
      0086D1 72 5C 00 16      [ 1] 1309 	inc seedy+1 
      0086D5 72 5C 00 14      [ 1] 1310 	inc seedx+1 
      0086D9 CD 87 61         [ 4] 1311 	call clear_basic
      0086DC CD 92 F1         [ 4] 1312 	call ubound 
                                   1313 ;	jra 2$	
                                   1314 ; 150 msec beep 
      0086DF AE 00 96         [ 2] 1315 	ldw x,#150 
      0086E2 90 AE 03 E6      [ 2] 1316 	ldw y,#998 
      0086E6 CD 98 9B         [ 4] 1317 	call beep  
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
      00872B CD 9A 9D         [ 4] 1359 	call search_file
      00872E 25 05            [ 1] 1360 	jrc 2$ 
                                   1361 ; if file doesn't exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008730 CD 87 14         [ 4] 1362 	call cancel_autorun
      008733 20 16            [ 2] 1363 	jra 9$ 
      008735 CD 9B B3         [ 4] 1364 2$:	call load_file
      008738 AE 40 00         [ 2] 1365 	ldw x,#AUTORUN_NAME 
      00873B CD 83 33         [ 4] 1366 	call puts
      00873E AE 87 4C         [ 2] 1367 	ldw x,#autorun_msg 
      008741 CD 83 33         [ 4] 1368 	call puts 
      008744 72 1C 00 24      [ 1] 1369 	bset flags,#FAUTORUN 
      008748 CC 98 60         [ 2] 1370 	jp run_it    
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
      008923 0B AE 88 E5      [ 2] 1440 	addw x,basicptr 
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
      0089D1 05 CD 93 24      [ 1] 1554 	inc in  
      0089D5 20               [ 1] 1555 	tnz a 
      0089D6 E9 2B            [ 1] 1556 	jrmi 6$
      0089D7 A1 06            [ 1] 1557 	cp a,#TK_ARRAY
      0089D7 A1 06            [ 1] 1558 	jrpl 9$  ; no attribute for these
      0089D9 26 05            [ 1] 1559 	cp a,#TK_COLON
      0089DB CD 93            [ 1] 1560 	jreq 9$  
      00098C                       1561 1$: ; 
      0089DD 21 20            [ 1] 1562 	cp a,#TK_CHAR
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
      008CE1 39 16            [ 1] 2237 	ld a,#TK_CHAR 
      008CE3 01 CD 90         [ 2] 2238 	jp token_exit 
      000CFF                       2239 rparnt_tst:		
      000CFF                       2240 	_case ')' colon_tst 
      008CE6 A0 4D            [ 1]    1 	ld a,#')' 
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
      008D61 8E B4 BE         [ 2] 2294 	ldw x,#remark 
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
      008DCF 41 90 FF 72      [ 1] 2349 2$: dec in 
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
      008DE6 3E FF            [ 1] 2361 	ldw y,x 
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
      008E0D 96 3E            [ 1] 2407 	clr (SIGN,sp)
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
      008EAC 3E 26            [ 1] 2582 	and a,#0x80  
      008EAE 09 90            [ 1] 2583 	jrpl 2$ 
      008EB0 93 CC            [ 1] 2584 	cpl (SIGN,sp)
      008EB2 8D EB            [ 2] 2585 	negw y 
      008EB4                       2586 2$:	
      008EB4 F7 5C 90         [ 4] 2587 	call umstar
      008EB7 93 01            [ 1] 2588 	ld a,(SIGN,sp)
      008EB8 27 03            [ 1] 2589 	jreq 3$
      008EB8 5B 02 81         [ 4] 2590 	call dneg 
      008EBB                       2591 3$:	
      000F1E                       2592 	_drop VSIZE 
      008EBB A1 61            [ 2]    1     addw sp,#VSIZE 
      008EBD 2A               [ 4] 2593 	ret
                                   2594 
                                   2595 ;--------------------------------------
                                   2596 ; divide uint32_t/uint16_t
                                   2597 ; return:  quotient and remainder 
                                   2598 ; quotient expected to be uint16_t 
                                   2599 ; input:
                                   2600 ;   DBLDIVDND    on stack 
                                   2601 ;   X            divisor 
                                   2602 ; output:
                                   2603 ;   X            quotient 
                                   2604 ;   Y            remainder 
                                   2605 ;---------------------------------------
                           000003  2606 	VSIZE=3
      000F21                       2607 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F21                       2608 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2609 	; local variables 
                           000001  2610 	DIVISOR=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000003  2611 	CNTR=3 
      000F21                       2612 udiv32_16:
      000F21                       2613 	_vars VSIZE 
      008EBE 01 81            [ 2]    1     sub sp,#VSIZE 
      008EC0 A1 7A            [ 2] 2614 	ldw (DIVISOR,sp),x	; save divisor 
      008EC2 22 FB            [ 2] 2615 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008EC4 A0 20            [ 2] 2616 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008EC6 81 5D            [ 2] 2617 	tnzw y
      008EC7 26 06            [ 1] 2618 	jrne long_division 
      008EC7 89 52            [ 2] 2619 	ldw y,(DIVISOR,sp)
      008EC9 03               [ 2] 2620 	divw x,y
      000F30                       2621 	_drop VSIZE 
      008ECA 72 5F            [ 2]    1     addw sp,#VSIZE 
      008ECC 00               [ 4] 2622 	ret
      000F33                       2623 long_division:
      008ECD 0C               [ 1] 2624 	exgw x,y ; hi in x, lo in y 
      008ECE 72 5F            [ 1] 2625 	ld a,#17 
      008ED0 00 0D            [ 1] 2626 	ld (CNTR,sp),a
      000F38                       2627 1$:
      008ED2 72 5F            [ 2] 2628 	cpw x,(DIVISOR,sp)
      008ED4 00 0E            [ 1] 2629 	jrmi 2$
      008ED6 0F 01 A6         [ 2] 2630 	subw x,(DIVISOR,sp)
      008ED9 0A               [ 1] 2631 2$:	ccf 
      008EDA 6B 02            [ 2] 2632 	rlcw y 
      008EDC F6               [ 2] 2633 	rlcw x 
      008EDD 27 47            [ 1] 2634 	dec (CNTR,sp)
      008EDF A1 2D            [ 1] 2635 	jrne 1$
      008EE1 26               [ 1] 2636 	exgw x,y 
      000F48                       2637 	_drop VSIZE 
      008EE2 04 03            [ 2]    1     addw sp,#VSIZE 
      008EE4 01               [ 4] 2638 	ret
                                   2639 
                                   2640 ;-----------------------------
                                   2641 ; negate double int.
                                   2642 ; input:
                                   2643 ;   x     bits 15..0
                                   2644 ;   y     bits 31..16
                                   2645 ; output: 
                                   2646 ;   x     bits 15..0
                                   2647 ;   y     bits 31..16
                                   2648 ;-----------------------------
      000F4B                       2649 dneg:
      008EE5 20               [ 2] 2650 	cplw x 
      008EE6 08 A1            [ 2] 2651 	cplw y 
      008EE8 24 26 06         [ 2] 2652 	addw x,#1 
      008EEB A6 10            [ 1] 2653 	jrnc 1$
      008EED 6B 02            [ 2] 2654 	incw y 
      008EEF 5C               [ 4] 2655 1$: ret 
                                   2656 
                                   2657 
                                   2658 ;--------------------------------
                                   2659 ; sign extend single to double
                                   2660 ; input:
                                   2661 ;   x    int16_t
                                   2662 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2663 ;   x    int32_t bits 15..0
                                   2664 ;   y    int32_t bits 31..16
                                   2665 ;--------------------------------
      000F56                       2666 dbl_sign_extend:
      008EF0 F6 5F            [ 1] 2667 	clrw y
      008EF1 9E               [ 1] 2668 	ld a,xh 
      008EF1 A1 61            [ 1] 2669 	and a,#0x80 
      008EF3 2B 02            [ 1] 2670 	jreq 1$
      008EF5 A0 20            [ 2] 2671 	cplw y
      008EF7 A1               [ 4] 2672 1$: ret 	
                                   2673 
                                   2674 
                                   2675 ;----------------------------------
                                   2676 ;  euclidian divide dbl/n1 
                                   2677 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2678 ; input:
                                   2679 ;    dbl    int32_t on stack 
                                   2680 ;    x 		n1   int16_t  disivor  
                                   2681 ; output:
                                   2682 ;    X      dbl/x  int16_t 
                                   2683 ;    Y      remainder int16_t 
                                   2684 ;----------------------------------
                           000008  2685 	VSIZE=8
      000F60                       2686 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F60                       2687 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F60                       2688 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2689 	; local variables
                           000001  2690 	DBLHI=1
                           000003  2691 	DBLLO=3 
                           000005  2692 	SDIVSR=5 ; sign divisor
                           000006  2693 	SQUOT=6 ; sign dividend 
                           000007  2694 	DIVISR=7 ; divisor 
      000F60                       2695 div32_16:
      000F60                       2696 	_vars VSIZE 
      008EF8 30 2B            [ 2]    1     sub sp,#VSIZE 
      008EFA 2B A0            [ 1] 2697 	clr (SDIVSR,sp)
      008EFC 30 A1            [ 1] 2698 	clr (SQUOT,sp)
                                   2699 ; copy arguments 
      008EFE 0A 2B            [ 2] 2700 	ldw y,(DIVDNDHI,sp)
      008F00 06 A0            [ 2] 2701 	ldw (DBLHI,sp),y
      008F02 07 11            [ 2] 2702 	ldw y,(DIVDNDLO,sp)
      008F04 02 2A            [ 2] 2703 	ldw (DBLLO,sp),y 
                                   2704 ; check for 0 divisor
      008F06 1F               [ 2] 2705 	tnzw x 
      008F07 6B 03            [ 1] 2706     jrne 0$
      008F09 7B 02            [ 1] 2707 	ld a,#ERR_DIV0 
      008F0B CD 8A EA         [ 2] 2708 	jp tb_error 
                                   2709 ; check divisor sign 	
      008F0E 7B               [ 1] 2710 0$:	ld a,xh 
      008F0F 03 CB            [ 1] 2711 	and a,#0x80 
      008F11 00 0E            [ 1] 2712 	jreq 1$
      008F13 C7 00            [ 1] 2713 	cpl (SDIVSR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F15 0E 4F            [ 1] 2714 	cpl (SQUOT,sp)
      008F17 C9               [ 2] 2715 	negw x
      008F18 00 0D            [ 2] 2716 1$:	ldw (DIVISR,sp),x
                                   2717 ; check dividend sign 	 
      008F1A C7 00            [ 1] 2718  	ld a,(DBLHI,sp) 
      008F1C 0D 4F            [ 1] 2719 	and a,#0x80 
      008F1E C9 00            [ 1] 2720 	jreq 2$ 
      008F20 0C C7            [ 1] 2721 	cpl (SQUOT,sp)
      008F22 00 0C            [ 2] 2722 	ldw x,(DBLLO,sp)
      008F24 20 C9            [ 2] 2723 	ldw y,(DBLHI,sp)
      008F26 0D 01 27         [ 4] 2724 	call dneg 
      008F29 03 CD            [ 2] 2725 	ldw (DBLLO,sp),x 
      008F2B 8B 24            [ 2] 2726 	ldw (DBLHI,sp),y 
      008F2D 1E 07            [ 2] 2727 2$:	ldw x,(DIVISR,sp)
      008F2D 5B 03 85         [ 4] 2728 	call udiv32_16
      008F30 81 5D            [ 2] 2729 	tnzw y 
      008F31 27 11            [ 1] 2730 	jreq 3$ 
                                   2731 ; x=quotient 
                                   2732 ; y=remainder 
                                   2733 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F31 88 91            [ 1] 2734 	ld a,(SQUOT,sp)
      008F33 D6 01            [ 1] 2735 	xor a,(SDIVSR,sp)
      008F35 27 0A            [ 1] 2736 	jreq 3$
      008F37 11               [ 2] 2737 	incw x 
      008F38 01 26 06 72      [ 2] 2738 	ldw acc16,y 
      008F3C 5C 00            [ 2] 2739 	ldw y,(DIVISR,sp)
      008F3E 02 20 F1 5B      [ 2] 2740 	subw y,acc16
                                   2741 ; sign quotient
      008F42 01 81            [ 1] 2742 3$:	ld a,(SQUOT,sp)
      008F44 27 01            [ 1] 2743 	jreq 4$
      008F44 52               [ 2] 2744 	negw x 
      000FB4                       2745 4$:	
      000FB4                       2746 	_drop VSIZE 
      008F45 06 1F            [ 2]    1     addw sp,#VSIZE 
      008F47 01               [ 4] 2747 	ret 
                                   2748 
                                   2749 
                                   2750 
                                   2751 ;----------------------------------
                                   2752 ; division x/y 
                                   2753 ; input:
                                   2754 ;    X       dividend
                                   2755 ;    Y       divisor 
                                   2756 ; output:
                                   2757 ;    X       quotient
                                   2758 ;    Y       remainder 
                                   2759 ;-----------------------------------
                           000004  2760 	VSIZE=4 
                                   2761 	; local variables 
                           000001  2762 	DBLHI=1
                           000003  2763 	DBLLO=3
      000FB7                       2764 divide: 
      000FB7                       2765 	_vars VSIZE 
      008F48 0F 03            [ 2]    1     sub sp,#VSIZE 
      008F4A 0F 04 90 9F      [ 2] 2766 	ldw acc16,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F4E 42 1F 05         [ 4] 2767 	call dbl_sign_extend
      008F51 7B 01            [ 2] 2768 	ldw (DBLLO,sp),x 
      008F53 93 42            [ 2] 2769 	ldw (DBLHI,sp),y 
      008F55 4F 72 FB         [ 2] 2770 	ldw x,acc16 
      008F58 04 4F 19         [ 4] 2771 	call div32_16 
      000FCA                       2772 	_drop VSIZE 
      008F5B 03 6B            [ 2]    1     addw sp,#VSIZE 
      008F5D 03               [ 4] 2773 	ret
                                   2774 
                                   2775 
                                   2776 ;----------------------------------
                                   2777 ;  remainder resulting from euclidian 
                                   2778 ;  division of x/y 
                                   2779 ; input:
                                   2780 ;   x   	dividend int16_t 
                                   2781 ;   y 		divisor int16_t
                                   2782 ; output:
                                   2783 ;   X       n1%n2 
                                   2784 ;----------------------------------
      000FCD                       2785 modulo:
      008F5E 1F 04 90         [ 4] 2786 	call divide
      008F61 5E               [ 1] 2787 	ldw x,y 
      008F62 93               [ 4] 2788 	ret 
                                   2789 
                                   2790 ;----------------------------------
                                   2791 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2792 ; return expr1*expr2/expr3 
                                   2793 ; product result is int32_t and 
                                   2794 ; divisiont is int32_t/int16_t
                                   2795 ;----------------------------------
                           000004  2796 	DBL_SIZE=4 
      000FD2                       2797 muldiv:
      008F63 7B 02 42         [ 4] 2798 	call func_args 
      008F66 72 FB            [ 1] 2799 	cp a,#3 
      008F68 04 4F            [ 1] 2800 	jreq 1$
      008F6A 19 03 6B         [ 2] 2801 	jp syntax_error
      000FDC                       2802 1$: 
      008F6D 03 1F            [ 2] 2803 	ldw x,(5,sp) ; expr1
      008F6F 04 7B            [ 2] 2804 	ldw y,(3,sp) ; expr2
      008F71 01 93 42         [ 4] 2805 	call multiply 
      008F74 72 FB            [ 2] 2806 	ldw (5,sp),x  ;int32_t 15..0
      008F76 03 90            [ 2] 2807 	ldw (3,sp),y  ;int32_t 31..16
      008F78 93               [ 2] 2808 	popw x        ; expr3 
      008F79 1E 05 5B         [ 4] 2809 	call div32_16 ; int32_t/expr3 
      000FEB                       2810 	_drop DBL_SIZE
      008F7C 06 81            [ 2]    1     addw sp,#DBL_SIZE 
      008F7E 81               [ 4] 2811 	ret 
                                   2812 
                                   2813 
                                   2814 ;----------------------------------
                                   2815 ; search in kword_dict name
                                   2816 ; from its execution address 
                                   2817 ; input:
                                   2818 ;   X       	execution address 
                                   2819 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2820 ;   X 			cstr*  | 0 
                                   2821 ;--------------------------------
                           000001  2822 	XADR=1 
                           000003  2823 	LINK=3 
                           000004  2824 	VSIZE=4
      000FEE                       2825 cmd_name:
      000FEE                       2826 	_vars VSIZE 
      008F7E 52 01            [ 2]    1     sub sp,#VSIZE 
      008F80 0F 01 9E A4      [ 1] 2827 	clr acc16 
      008F84 80 2A            [ 2] 2828 	ldw (XADR,sp),x  
      008F86 03 03 01         [ 2] 2829 	ldw x,#kword_dict	
      008F89 50 03            [ 2] 2830 1$:	ldw (LINK,sp),x
      008F8A E6 02            [ 1] 2831 	ld a,(2,x)
      008F8A 90 9E            [ 1] 2832 	and a,#15 
      008F8C A4 80 2A         [ 1] 2833 	ld acc8,a 
      008F8F 04 03 01         [ 2] 2834 	addw x,#3
      008F92 90 50 00 0C      [ 2] 2835 	addw x,acc16
      008F94 FE               [ 2] 2836 	ldw x,(x) ; execution address 
      008F94 CD 8F            [ 2] 2837 	cpw x,(XADR,sp)
      008F96 44 7B            [ 1] 2838 	jreq 2$
      008F98 01 27            [ 2] 2839 	ldw x,(LINK,sp)
      008F9A 03               [ 2] 2840 	ldw x,(x) 
      008F9B CD 8F CB         [ 2] 2841 	subw x,#2  
      008F9E 26 E3            [ 1] 2842 	jrne 1$
      008F9E 5B 01            [ 2] 2843 	jra 9$
      008FA0 81 03            [ 2] 2844 2$: ldw x,(LINK,sp)
      008FA1 1C 00 02         [ 2] 2845 	addw x,#2 	
      00101D                       2846 9$:	_drop VSIZE
      008FA1 52 03            [ 2]    1     addw sp,#VSIZE 
      008FA3 1F               [ 4] 2847 	ret
                                   2848 
                                   2849 
                                   2850 ;---------------------------------
                                   2851 ; dictionary search 
                                   2852 ; input:
                                   2853 ;	X 		dictionary entry point, name field  
                                   2854 ;   y		.asciz name to search 
                                   2855 ; output:
                                   2856 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2857 ;  X		execution address | 0 
                                   2858 ;---------------------------------
                           000001  2859 	NLEN=1 ; cmd length 
                           000002  2860 	XSAVE=2
                           000004  2861 	YSAVE=4
                           000005  2862 	VSIZE=5 
      001020                       2863 search_dict:
      001020                       2864 	_vars VSIZE 
      008FA4 01 1E            [ 2]    1     sub sp,#VSIZE 
                                   2865 
      008FA6 08 16            [ 2] 2866 	ldw (YSAVE,sp),y 
      001024                       2867 search_next:
      008FA8 06 90            [ 2] 2868 	ldw (XSAVE,sp),x 
                                   2869 ; get name length in dictionary	
      008FAA 5D               [ 1] 2870 	ld a,(x)
      008FAB 26 06            [ 1] 2871 	and a,#0xf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FAD 16 01            [ 1] 2872 	ld (NLEN,sp),a  
      008FAF 65 5B            [ 2] 2873 	ldw y,(YSAVE,sp) ; name pointer 
      008FB1 03               [ 2] 2874 	incw x 
      00102E                       2875 cp_loop:
      008FB2 81 F6            [ 1] 2876 	ld a,(y)
      008FB3 27 1B            [ 1] 2877 	jreq str_match 
      008FB3 51 A6            [ 1] 2878 	tnz (NLEN,sp)
      008FB5 11 6B            [ 1] 2879 	jreq no_match  
      008FB7 03               [ 1] 2880 	cp a,(x)
      008FB8 26 07            [ 1] 2881 	jrne no_match 
      008FB8 13 01            [ 2] 2882 	incw y 
      008FBA 2B               [ 2] 2883 	incw x
      008FBB 03 72            [ 1] 2884 	dec (NLEN,sp)
      008FBD F0 01            [ 2] 2885 	jra cp_loop 
      001040                       2886 no_match:
      008FBF 8C 90            [ 2] 2887 	ldw x,(XSAVE,sp) 
      008FC1 59 59 0A         [ 2] 2888 	subw x,#2 ; move X to link field
      008FC4 03 26            [ 1] 2889 	push #TK_NONE 
      008FC6 F1               [ 2] 2890 	ldw x,(x) ; next word link 
      008FC7 51               [ 1] 2891 	pop a ; TK_NONE 
      008FC8 5B 03            [ 1] 2892 	jreq search_exit  ; not found  
                                   2893 ;try next 
      008FCA 81 D7            [ 2] 2894 	jra search_next
      008FCB                       2895 str_match:
      008FCB 53 90            [ 2] 2896 	ldw x,(XSAVE,sp)
      008FCD 53               [ 1] 2897 	ld a,(X)
      008FCE 1C 00            [ 1] 2898 	ld (NLEN,sp),a ; needed to test keyword type  
      008FD0 01 24            [ 1] 2899 	and a,#0xf 
                                   2900 ; move x to procedure address field 	
      008FD2 02               [ 1] 2901 	inc a 
      008FD3 90 5C 81         [ 1] 2902 	ld acc8,a 
      008FD6 72 5F 00 0C      [ 1] 2903 	clr acc16 
      008FD6 90 5F 9E A4      [ 2] 2904 	addw x,acc16 
      008FDA 80               [ 2] 2905 	ldw x,(x) ; routine entry point 
                                   2906 ;determine keyword type bits 7:6 
      008FDB 27 02            [ 1] 2907 	ld a,(NLEN,sp)
      008FDD 90               [ 1] 2908 	swap a 
      008FDE 53 81            [ 1] 2909 	and a,#0xc
      008FE0 44               [ 1] 2910 	srl a
      008FE0 52               [ 1] 2911 	srl a 
      008FE1 08 0F            [ 1] 2912 	add a,#128
      00106A                       2913 search_exit: 
      00106A                       2914 	_drop VSIZE 	 
      008FE3 05 0F            [ 2]    1     addw sp,#VSIZE 
      008FE5 06               [ 4] 2915 	ret 
                                   2916 
                                   2917 ;---------------------
                                   2918 ; check if next token
                                   2919 ;  is of expected type 
                                   2920 ; input:
                                   2921 ;   A 		 expected token attribute
                                   2922 ;  ouput:
                                   2923 ;   none     if fail call syntax_error 
                                   2924 ;--------------------
      00106D                       2925 expect:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FE6 16               [ 1] 2926 	push a 
      008FE7 0B 17 01         [ 4] 2927 	call next_token 
      008FEA 16 0D            [ 1] 2928 	cp a,(1,sp)
      008FEC 17 03            [ 1] 2929 	jreq 1$
      008FEE 5D 26 05         [ 2] 2930 	jp syntax_error
      008FF1 A6               [ 1] 2931 1$: pop a 
      008FF2 04               [ 4] 2932 	ret 
                                   2933 
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2935 ; parse arguments list 
                                   2936 ; between ()
                                   2937 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00107A                       2938 func_args:
      008FF3 CC 88            [ 1] 2939 	ld a,#TK_LPAREN 
      008FF5 F7 9E A4         [ 4] 2940 	call expect 
                                   2941 ; expected to continue in arg_list 
                                   2942 ; caller must check for TK_RPAREN 
                                   2943 
                                   2944 ;-------------------------------
                                   2945 ; parse embedded BASIC routines 
                                   2946 ; arguments list.
                                   2947 ; arg_list::=  rel[','rel]*
                                   2948 ; all arguments are of integer type
                                   2949 ; and pushed on stack 
                                   2950 ; input:
                                   2951 ;   none
                                   2952 ; output:
                                   2953 ;   stack{n}   arguments pushed on stack
                                   2954 ;   A 	number of arguments pushed on stack  
                                   2955 ;--------------------------------
      00107F                       2956 arg_list:
      008FF8 80 27            [ 1] 2957 	push #0  
      008FFA 05 03 05         [ 4] 2958 1$: call relation
      008FFD 03 06            [ 1] 2959 	cp a,#TK_NONE 
      008FFF 50 1F            [ 1] 2960 	jreq 5$
      009001 07 7B            [ 1] 2961 	cp a,#TK_INTGR
      009003 01 A4            [ 1] 2962 	jrne 4$
      00108C                       2963 3$: 
                                   2964 ; swap return address with argument
      009005 80               [ 1] 2965 	pop a ; arg_count
      009006 27 0D            [ 2] 2966 	popw y ; return address 
      009008 03               [ 2] 2967 	pushw x ; new argument 
      009009 06 1E            [ 2] 2968 	pushw y 
      00900B 03               [ 1] 2969     inc a
      00900C 16               [ 1] 2970 	push a 
      00900D 01 CD 8F         [ 4] 2971 	call next_token 
      009010 CB 1F            [ 1] 2972 	cp a,#TK_COMMA 
      009012 03 17            [ 1] 2973 	jreq 1$ 
      009014 01 1E            [ 1] 2974 	cp a,#TK_NONE 
      009016 07 CD            [ 1] 2975 	jreq 5$ 
      009018 8F A1            [ 1] 2976 4$:	cp a,#TK_RPAREN 
      00901A 90 5D            [ 1] 2977 	jreq 5$
      0010A3                       2978 	_unget_token 
      00901C 27 11 7B 06 18   [ 1]    1     mov in,in.saved
      009021 05               [ 1] 2979 5$:	pop a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009022 27               [ 4] 2980 	ret 
                                   2981 
                                   2982 ;--------------------------------
                                   2983 ;   BASIC commnands 
                                   2984 ;--------------------------------
                                   2985 
                                   2986 ;--------------------------------
                                   2987 ;  arithmetic and relational 
                                   2988 ;  routines
                                   2989 ;  operators precedence
                                   2990 ;  highest to lowest
                                   2991 ;  operators on same row have 
                                   2992 ;  same precedence and are executed
                                   2993 ;  from left to right.
                                   2994 ;	'*','/','%'
                                   2995 ;   '-','+'
                                   2996 ;   '=','>','<','>=','<=','<>','><'
                                   2997 ;   '<>' and '><' are equivalent for not equal.
                                   2998 ;--------------------------------
                                   2999 
                                   3000 ;---------------------
                                   3001 ; return array element
                                   3002 ; address from @(expr)
                                   3003 ; input:
                                   3004 ;   A 		TK_ARRAY
                                   3005 ; output:
                                   3006 ;   A 		TK_INTGR
                                   3007 ;	X 		element address 
                                   3008 ;----------------------
      0010AA                       3009 get_array_element:
      009023 0B 5C 90         [ 4] 3010 	call func_args 
      009026 CF 00            [ 1] 3011 	cp a,#1
      009028 0D 16            [ 1] 3012 	jreq 1$
      00902A 07 72 B2         [ 2] 3013 	jp syntax_error
      00902D 00               [ 2] 3014 1$: popw x 
                                   3015 	; check for bounds 
      00902E 0D 7B 06         [ 2] 3016 	cpw x,array_size 
      009031 27 01            [ 2] 3017 	jrule 3$
                                   3018 ; bounds {1..array_size}	
      009033 50 0A            [ 1] 3019 2$: ld a,#ERR_BAD_VALUE 
      009034 CC 08 77         [ 2] 3020 	jp tb_error 
      009034 5B               [ 2] 3021 3$: tnzw  x
      009035 08 81            [ 1] 3022 	jreq 2$ 
      009037 58               [ 2] 3023 	sllw x 
      009037 52               [ 2] 3024 	pushw x 
      009038 04 90 CF         [ 2] 3025 	ldw x,#tib
      00903B 00 0D CD         [ 2] 3026 	subw x,(1,sp)
      0010CA                       3027 	_drop 2   
      00903E 8F D6            [ 2]    1     addw sp,#2 
      009040 1F 03            [ 1] 3028 	ld a,#TK_INTGR
      009042 17               [ 4] 3029 	ret 
                                   3030 
                                   3031 
                                   3032 ;***********************************
                                   3033 ;   expression parse,execute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3034 ;***********************************
                                   3035 ;-----------------------------------
                                   3036 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3037 ;			 integer | function |
                                   3038 ;			 '('relation')' 
                                   3039 ; output:
                                   3040 ;   A    token attribute 
                                   3041 ;   X 	 integer
                                   3042 ; ---------------------------------
                           000001  3043 	NEG=1
                           000001  3044 	VSIZE=1
      0010CF                       3045 factor:
      0010CF                       3046 	_vars VSIZE 
      009043 01 CE            [ 2]    1     sub sp,#VSIZE 
      009045 00 0D CD         [ 4] 3047 	call next_token
      009048 8F E0            [ 1] 3048 	cp a,#CMD_END 
      00904A 5B 04            [ 1] 3049 	jrult 20$
      00904C 81 01            [ 1] 3050 1$:	ld (NEG,sp),a 
      00904D A4 30            [ 1] 3051 	and a,#TK_GRP_MASK
      00904D CD 90            [ 1] 3052 	cp a,#TK_GRP_ADD 
      00904F 37 93            [ 1] 3053 	jreq 2$
      009051 81 01            [ 1] 3054 	ld a,(NEG,sp)
      009052 20 03            [ 2] 3055 	jra 4$  
      0010E4                       3056 2$:	
      009052 CD 90 FA         [ 4] 3057 	call next_token 
      0010E7                       3058 4$:	
      009055 A1 03            [ 1] 3059 	cp a,#TK_IFUNC 
      009057 27 03            [ 1] 3060 	jrne 5$ 
      009059 CC               [ 4] 3061 	call (x) 
      00905A 88 F5            [ 2] 3062 	jra 18$ 
      00905C                       3063 5$:
      00905C 1E 05            [ 1] 3064 	cp a,#TK_INTGR
      00905E 16 03            [ 1] 3065 	jrne 6$
      009060 CD 8F            [ 2] 3066 	jra 18$
      0010F4                       3067 6$:
      009062 7E 1F            [ 1] 3068 	cp a,#TK_ARRAY
      009064 05 17            [ 1] 3069 	jrne 10$
      009066 03 85 CD         [ 4] 3070 	call get_array_element
      009069 8F               [ 2] 3071 	ldw x,(x)
      00906A E0 5B            [ 2] 3072 	jra 18$ 
      0010FE                       3073 10$:
      00906C 04 81            [ 1] 3074 	cp a,#TK_VAR 
      00906E 26 03            [ 1] 3075 	jrne 12$
      00906E 52               [ 2] 3076 	ldw x,(x)
      00906F 04 72            [ 2] 3077 	jra 18$
      001105                       3078 12$:			
      009071 5F 00            [ 1] 3079 	cp a,#TK_LPAREN
      009073 0D 1F            [ 1] 3080 	jrne 16$
      009075 01 AE A7         [ 4] 3081 	call relation
      009078 37               [ 2] 3082 	pushw x 
      009079 1F 03            [ 1] 3083 	ld a,#TK_RPAREN 
      00907B E6 02 A4         [ 4] 3084 	call expect
      00907E 0F               [ 2] 3085 	popw x 
      00907F C7 00            [ 2] 3086 	jra 18$	
      001115                       3087 16$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      001115                       3088 	_unget_token
      009081 0E 1C 00 03 72   [ 1]    1     mov in,in.saved
      009086 BB               [ 1] 3089 	clr a 
      009087 00 0D            [ 2] 3090 	jra 20$ 
      00111D                       3091 18$: 
      009089 FE 13            [ 1] 3092 	ld a,#TK_MINUS 
      00908B 01 27            [ 1] 3093 	cp a,(NEG,sp)
      00908D 0A 1E            [ 1] 3094 	jrne 19$
      00908F 03               [ 2] 3095 	negw x
      001124                       3096 19$:
      009090 FE 1D            [ 1] 3097 	ld a,#TK_INTGR
      001126                       3098 20$:
      001126                       3099 	_drop VSIZE
      009092 00 02            [ 2]    1     addw sp,#VSIZE 
      009094 26               [ 4] 3100 	ret
                                   3101 
                                   3102 ;-----------------------------------
                                   3103 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3104 ; output:
                                   3105 ;   A    	token attribute 
                                   3106 ;	X		integer
                                   3107 ;-----------------------------------
                           000001  3108 	N1=1   ; int16_t
                           000003  3109 	MULOP=3
                           000003  3110 	VSIZE=3
      001129                       3111 term:
      001129                       3112 	_vars VSIZE
      009095 E3 20            [ 2]    1     sub sp,#VSIZE 
      009097 05 1E 03         [ 4] 3113 	call factor
      00909A 1C 00            [ 1] 3114 	cp a,#CMD_END
      00909C 02 5B            [ 1] 3115 	jrult term_exit
      001132                       3116 term01:	 ; check for  operator 
      00909E 04 81            [ 2] 3117 	ldw (N1,sp),x  ; save first factor 
      0090A0 CD 09 67         [ 4] 3118 	call next_token
      0090A0 52 05            [ 1] 3119 	cp a,#CMD_END
      0090A2 17 04            [ 1] 3120 	jrult 9$
      0090A4 6B 03            [ 1] 3121 0$:	ld (MULOP,sp),a
      0090A4 1F 02            [ 1] 3122 	and a,#TK_GRP_MASK
      0090A6 F6 A4            [ 1] 3123 	cp a,#TK_GRP_MULT
      0090A8 0F 6B            [ 1] 3124 	jreq 1$
      001143                       3125 	_unget_token 
      0090AA 01 16 04 5C 01   [ 1]    1     mov in,in.saved
      0090AE 20 27            [ 2] 3126 	jra 9$
      00114A                       3127 1$:	; got *|/|%
      0090AE 90 F6 27         [ 4] 3128 	call factor
      0090B1 1B 0D            [ 1] 3129 	cp a,#TK_INTGR
      0090B3 01 27            [ 1] 3130 	jreq 2$ 
      0090B5 0A F1 26         [ 2] 3131 	jp syntax_error
      0090B8 07 90            [ 1] 3132 2$:	ldw y,x 
      0090BA 5C 5C            [ 2] 3133 	ldw x,(N1,sp)
      0090BC 0A 01            [ 1] 3134 	ld a,(MULOP,sp) 
      0090BE 20 EE            [ 1] 3135 	cp a,#TK_MULT 
      0090C0 26 05            [ 1] 3136 	jrne 3$
      0090C0 1E 02 1D         [ 4] 3137 	call multiply 
      0090C3 00 02            [ 2] 3138 	jra term01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0090C5 4B 00            [ 1] 3139 3$: cp a,#TK_DIV 
      0090C7 FE 84            [ 1] 3140 	jrne 4$ 
      0090C9 27 1F 20         [ 4] 3141 	call divide 
      0090CC D7 C6            [ 2] 3142 	jra term01 
      0090CD CD 0F CD         [ 4] 3143 4$: call modulo
      0090CD 1E 02            [ 2] 3144 	jra term01 
      0090CF F6 6B            [ 2] 3145 9$: ldw x,(N1,sp)
      0090D1 01 A4            [ 1] 3146 	ld a,#TK_INTGR 	
      001175                       3147 term_exit:
      001175                       3148 	_drop VSIZE 
      0090D3 0F 4C            [ 2]    1     addw sp,#VSIZE 
      0090D5 C7               [ 4] 3149 	ret 
                                   3150 
                                   3151 ;-------------------------------
                                   3152 ;  expr ::= term [['+'|'-'] term]*
                                   3153 ;  result range {-32768..32767}
                                   3154 ;  output:
                                   3155 ;   A    token attribute 
                                   3156 ;   X	 integer   
                                   3157 ;-------------------------------
                           000001  3158 	N1=1 
                           000003  3159 	OP=3 
                           000003  3160 	VSIZE=3 
      001178                       3161 expression:
      001178                       3162 	_vars VSIZE 
      0090D6 00 0E            [ 2]    1     sub sp,#VSIZE 
      0090D8 72 5F 00         [ 4] 3163 	call term
      0090DB 0D 72            [ 1] 3164 	cp a,#CMD_END 
      0090DD BB 00            [ 1] 3165 	jrult expr_exit 
      0090DF 0D FE            [ 2] 3166 0$:	ldw (N1,sp),x 
      0090E1 7B 01 4E         [ 4] 3167 	call next_token
      0090E4 A4 0C            [ 1] 3168 	cp a,#CMD_END 
      0090E6 44 44            [ 1] 3169 	jrult 9$ 
      0090E8 AB 80            [ 1] 3170 1$:	ld (OP,sp),a  
      0090EA A4 30            [ 1] 3171 	and a,#TK_GRP_MASK
      0090EA 5B 05            [ 1] 3172 	cp a,#TK_GRP_ADD 
      0090EC 81 07            [ 1] 3173 	jreq 2$ 
      0090ED                       3174 	_unget_token
      0090ED 88 CD 89 E7 11   [ 1]    1     mov in,in.saved
      0090F2 01 27            [ 2] 3175 	jra 9$
      001199                       3176 2$: 
      0090F4 03 CC 88         [ 4] 3177 	call term
      0090F7 F5 84            [ 1] 3178 	cp a,#TK_INTGR 
      0090F9 81 03            [ 1] 3179 	jreq 3$
      0090FA CC 08 75         [ 2] 3180 	jp syntax_error
      0090FA A6 07 CD         [ 2] 3181 3$:	ldw acc16,x 
      0090FD 90 ED            [ 2] 3182 	ldw x,(N1,sp)
      0090FF 7B 03            [ 1] 3183 	ld a,(OP,sp)
      0090FF 4B 00            [ 1] 3184 	cp a,#TK_PLUS 
      009101 CD 92            [ 1] 3185 	jrne 4$
      009103 41 A1 00 27      [ 2] 3186 	addw x,acc16
      009107 20 A1            [ 2] 3187 	jra 0$ 
      009109 84 26 13 0C      [ 2] 3188 4$:	subw x,acc16
      00910C 20 C7            [ 2] 3189 	jra 0$
      00910C 84 90            [ 2] 3190 9$: ldw x,(N1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00910E 85 89            [ 1] 3191 	ld a,#TK_INTGR	
      0011BE                       3192 expr_exit:
      0011BE                       3193 	_drop VSIZE 
      009110 90 89            [ 2]    1     addw sp,#VSIZE 
      009112 4C               [ 4] 3194 	ret 
                                   3195 
                                   3196 ;---------------------------------------------
                                   3197 ; rel ::= expr rel_op expr
                                   3198 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3199 ;  relation return  integer , zero is false 
                                   3200 ;  output:
                                   3201 ;    A 		token attribute  
                                   3202 ;	 X		integer 
                                   3203 ;---------------------------------------------
                           000001  3204 	N1=1
                           000003  3205 	RELOP=3
                           000003  3206 	VSIZE=3 
      0011C1                       3207 relation: 
      0011C1                       3208 	_vars VSIZE
      009113 88 CD            [ 2]    1     sub sp,#VSIZE 
      009115 89 E7 A1         [ 4] 3209 	call expression
      009118 09 27            [ 1] 3210 	cp a,#CMD_END  
      00911A E6 A1            [ 1] 3211 	jrult rel_exit 
                                   3212 	; expect rel_op or leave 
      00911C 00 27            [ 2] 3213 	ldw (N1,sp),x 
      00911E 09 A1 08         [ 4] 3214 	call next_token 
      009121 27 05            [ 1] 3215 	cp a,#CMD_END 
      009123 55 00            [ 1] 3216 	jrult 9$
      0011D3                       3217 1$:	
      009125 03 00            [ 1] 3218 	ld (RELOP,sp),a 
      009127 02 84            [ 1] 3219 	and a,#TK_GRP_MASK
      009129 81 30            [ 1] 3220 	cp a,#TK_GRP_RELOP 
      00912A 27 07            [ 1] 3221 	jreq 2$
      0011DB                       3222 	_unget_token  
      00912A CD 90 FA A1 01   [ 1]    1     mov in,in.saved
      00912F 27 03            [ 2] 3223 	jra 9$
      0011E2                       3224 2$:	; expect another expression or error 
      009131 CC 88 F5         [ 4] 3225 	call expression
      009134 85 C3            [ 1] 3226 	cp a,#TK_INTGR 
      009136 00 22            [ 1] 3227 	jreq 3$
      009138 23 05 A6         [ 2] 3228 	jp syntax_error 
      00913B 0A CC 88         [ 2] 3229 3$:	ldw acc16,x 
      00913E F7 5D            [ 2] 3230 	ldw x,(N1,sp) 
      009140 27 F8 58 89      [ 2] 3231 	subw x,acc16
      009144 AE 16            [ 1] 3232 	jrne 4$
      009146 90 72 F0 01      [ 1] 3233 	mov acc8,#2 ; n1==n2
      00914A 5B 02            [ 2] 3234 	jra 6$ 
      0011FD                       3235 4$: 
      00914C A6 84            [ 1] 3236 	jrsgt 5$  
      00914E 81 04 00 0D      [ 1] 3237 	mov acc8,#4 ; n1<2 
      00914F 20 04            [ 2] 3238 	jra 6$
      001205                       3239 5$:
      00914F 52 01 CD 89      [ 1] 3240 	mov acc8,#1 ; n1>n2 
      001209                       3241 6$:
      009153 E7               [ 1] 3242 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009154 A1 02 25         [ 1] 3243 	ld a, acc8  
      009157 4E 6B            [ 1] 3244 	and a,(RELOP,sp)
      009159 01               [ 1] 3245 	tnz a 
      00915A A4 30            [ 1] 3246 	jreq 10$
      00915C A1               [ 2] 3247 	incw x 
      001213                       3248 7$:	 
      00915D 10 27            [ 2] 3249 	jra 10$  	
      00915F 04 7B            [ 2] 3250 9$: ldw x,(N1,sp)
      001217                       3251 10$:
      009161 01 20            [ 1] 3252 	ld a,#TK_INTGR
      001219                       3253 rel_exit: 	 
      001219                       3254 	_drop VSIZE
      009163 03 03            [ 2]    1     addw sp,#VSIZE 
      009164 81               [ 4] 3255 	ret 
                                   3256 
                                   3257 ;--------------------------------
                                   3258 ; BASIC: SHOW 
                                   3259 ; print stack content in hexadecimal bytes 
                                   3260 ; 16 bytes per row 
                                   3261 ;--------------------------------
      00121C                       3262 show:
      009164 CD 89 E7         [ 2] 3263 	ldw x,#cstk_prompt
      009167 CD 02 B3         [ 4] 3264 	call puts 
      009167 A1               [ 1] 3265 	ldw x,sp 
      009168 81 26 03         [ 2] 3266 	addw x,#3 ; ignore return address
      00916B FD 20 2F 00      [ 2] 3267 	ldw y,#RAM_SIZE  
      00916E CF 00 0C         [ 2] 3268 	ldw acc16,x 
      00916E A1 84 26 02      [ 2] 3269 	subw y,acc16
      009172 20 29 55         [ 4] 3270 	call hex_dump
      009174 4F               [ 1] 3271 	clr a 
      009174 A1               [ 4] 3272 	ret
                                   3273 
      009175 06 26 06 CD 91 2A FE  3274 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             20 1F 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3275 
                                   3276 
                                   3277 ;--------------------------------------------
                                   3278 ; BASIC: HEX 
                                   3279 ; select hexadecimal base for integer print
                                   3280 ;---------------------------------------------
      00917E                       3281 hex_base:
      00917E A1 85 26 03      [ 1] 3282 	mov base,#16 
      009182 FE               [ 4] 3283 	ret 
                                   3284 
                                   3285 ;--------------------------------------------
                                   3286 ; BASIC: DEC 
                                   3287 ; select decimal base for integer print
                                   3288 ;---------------------------------------------
      001262                       3289 dec_base:
      009183 20 18 00 0A      [ 1] 3290 	mov base,#10
      009185 81               [ 4] 3291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3292 
                                   3293 ;------------------------
                                   3294 ; BASIC: SIZE 
                                   3295 ; return free size in text area
                                   3296 ; output:
                                   3297 ;   A 		TK_INTGR
                                   3298 ;   X 	    size integer
                                   3299 ;--------------------------
      001267                       3300 size:
      009185 A1 07 26         [ 2] 3301 	ldw x,#tib 
      009188 0C CD 92 41      [ 2] 3302 	subw x,txtend 
      00918C 89 A6            [ 1] 3303 	ld a,#TK_INTGR
      00918E 08               [ 4] 3304 	ret 
                                   3305 
                                   3306 
                                   3307 ;------------------------
                                   3308 ; BASIC: UBOUND  
                                   3309 ; return array variable size 
                                   3310 ; output:
                                   3311 ;   A 		TK_INTGR
                                   3312 ;   X 	    array size 
                                   3313 ;--------------------------
      001271                       3314 ubound:
      00918F CD 90 ED         [ 2] 3315 	ldw x,#tib
      009192 85 20 08 1E      [ 2] 3316 	subw x,txtend 
      009195 90 CE 00 04      [ 2] 3317 	ldw y,basicptr 
      009195 55 00 03 00      [ 2] 3318 	cpw y,txtend 
      009199 02 4F            [ 1] 3319 	jrult 1$
      00919B 20 09 03         [ 1] 3320 	push count 
      00919D 4B 00            [ 1] 3321 	push #0 
      00919D A6 11 11         [ 2] 3322 	subw x,(1,sp)
      00128A                       3323 	_drop 2 
      0091A0 01 26            [ 2]    1     addw sp,#2 
      0091A2 01               [ 2] 3324 1$:	srlw x 
      0091A3 50 00 21         [ 2] 3325 	ldw array_size,x
      0091A4 A6 84            [ 1] 3326 	ld a,#TK_INTGR
      0091A4 A6               [ 4] 3327 	ret 
                                   3328 
                                   3329 ;-----------------------------
                                   3330 ; BASIC: LET var=expr 
                                   3331 ; variable assignement 
                                   3332 ; output:
                                   3333 ;   A 		TK_NONE 
                                   3334 ;-----------------------------
      001293                       3335 let:
      0091A5 84 09 67         [ 4] 3336 	call next_token 
      0091A6 A1 85            [ 1] 3337 	cp a,#TK_VAR 
      0091A6 5B 01            [ 1] 3338 	jreq let_var
      0091A8 81 06            [ 1] 3339 	cp a,#TK_ARRAY 
      0091A9 27 03            [ 1] 3340 	jreq  let_array
      0091A9 52 03 CD         [ 2] 3341 	jp syntax_error
      0012A1                       3342 let_array:
      0091AC 91 4F A1         [ 4] 3343 	call get_array_element
      0012A4                       3344 let_var:
      0091AF 02               [ 2] 3345 	pushw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091B0 25 43 67         [ 4] 3346 	call next_token 
      0091B2 A1 32            [ 1] 3347 	cp a,#TK_EQUAL
      0091B2 1F 01            [ 1] 3348 	jreq 1$
      0091B4 CD 89 E7         [ 2] 3349 	jp syntax_error
      0012AF                       3350 1$:	
      0091B7 A1 02 25         [ 4] 3351 	call relation   
      0091BA 36 6B            [ 1] 3352 	cp a,#TK_INTGR 
      0091BC 03 A4            [ 1] 3353 	jreq 2$
      0091BE 30 A1 20         [ 2] 3354 	jp syntax_error
      0012B9                       3355 2$:	
      0091C1 27 07            [ 1] 3356 	ldw y,x 
      0091C3 55               [ 2] 3357 	popw x   
      0091C4 00               [ 2] 3358 	ldw (x),y   
      0091C5 03               [ 4] 3359 	ret 
                                   3360 
                                   3361 ;----------------------------
                                   3362 ; BASIC: LIST [[start][,end]]
                                   3363 ; list program lines 
                                   3364 ; form start to end 
                                   3365 ; if empty argument list then 
                                   3366 ; list all.
                                   3367 ;----------------------------
                           000001  3368 	FIRST=1
                           000003  3369 	LAST=3 
                           000005  3370 	LN_PTR=5
                           000006  3371 	VSIZE=6 
      0012BE                       3372 list:
      0091C6 00 02 20         [ 2] 3373 	ldw x,txtbgn 
      0091C9 27 00 1E         [ 2] 3374 	cpw x,txtend 
      0091CA 2B 01            [ 1] 3375 	jrmi 1$
      0091CA CD               [ 4] 3376 	ret 
      0012C7                       3377 1$:	
      0012C7                       3378 	_vars VSIZE
      0091CB 91 4F            [ 2]    1     sub sp,#VSIZE 
      0091CD A1 84            [ 2] 3379 	ldw (LN_PTR,sp),x 
      0091CF 27               [ 2] 3380 	ldw x,(x) 
      0091D0 03 CC            [ 2] 3381 	ldw (FIRST,sp),x ; list from first line 
      0091D2 88 F5 90         [ 2] 3382 	ldw x,#MAX_LINENO ; biggest line number 
      0091D5 93 1E            [ 2] 3383 	ldw (LAST,sp),x 
      0091D7 01 7B 03         [ 4] 3384 	call arg_list
      0091DA A1               [ 1] 3385 	tnz a
      0091DB 20 26            [ 1] 3386 	jreq list_start 
      0091DD 05 CD            [ 1] 3387 	cp a,#2 
      0091DF 8F 7E            [ 1] 3388 	jreq 4$
      0091E1 20 CF            [ 1] 3389 	cp a,#1 
      0091E3 A1 21            [ 1] 3390 	jreq first_line 
      0091E5 26 05 CD         [ 2] 3391 	jp syntax_error 
      0091E8 90               [ 2] 3392 4$:	popw x 
      0091E9 37 20            [ 2] 3393 	ldw (LAST+2,sp),x 
      0012E7                       3394 first_line:
      0091EB C6               [ 2] 3395 	popw x
      0091EC CD 90            [ 2] 3396 	ldw (FIRST,sp),x 
      0012EA                       3397 lines_skip:
      0091EE 4D 20 C1         [ 2] 3398 	ldw x,txtbgn
      0091F1 1E 01            [ 2] 3399 2$:	ldw (LN_PTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091F3 A6 84 1E         [ 2] 3400 	cpw x,txtend 
      0091F5 2A 3C            [ 1] 3401 	jrpl list_exit 
      0091F5 5B               [ 2] 3402 	ldw x,(x) ;line# 
      0091F6 03 81            [ 2] 3403 	cpw x,(FIRST,sp)
      0091F8 2A 11            [ 1] 3404 	jrpl list_start 
      0091F8 52 03            [ 2] 3405 	ldw x,(LN_PTR,sp) 
      0091FA CD 91            [ 1] 3406 	ld a,(2,x)
      0091FC A9 A1 02         [ 1] 3407 	ld acc8,a 
      0091FF 25 3D 1F 01      [ 1] 3408 	clr acc16 
      009203 CD 89 E7 A1      [ 2] 3409 	addw x,acc16
      009207 02 25            [ 2] 3410 	jra 2$ 
                                   3411 ; print loop
      00130A                       3412 list_start:
      009209 30 6B            [ 2] 3413 	ldw x,(LN_PTR,sp)
      00920B 03 A4            [ 1] 3414 3$:	ld a,(2,x) 
      00920D 30 A1 10         [ 4] 3415 	call prt_basic_line
      009210 27 07            [ 2] 3416 	ldw x,(LN_PTR,sp)
      009212 55 00            [ 1] 3417 	ld a,(2,x)
      009214 03 00 02         [ 1] 3418 	ld acc8,a 
      009217 20 21 00 0C      [ 1] 3419 	clr acc16 
      009219 72 BB 00 0C      [ 2] 3420 	addw x,acc16
      009219 CD 91 A9         [ 2] 3421 	cpw x,txtend 
      00921C A1 84            [ 1] 3422 	jrpl list_exit
      00921E 27 03            [ 2] 3423 	ldw (LN_PTR,sp),x
      009220 CC               [ 2] 3424 	ldw x,(x)
      009221 88 F5            [ 2] 3425 	cpw x,(LAST,sp)  
      009223 CF 00            [ 1] 3426 	jrsgt list_exit 
      009225 0D 1E            [ 2] 3427 	ldw x,(LN_PTR,sp)
      009227 01 7B            [ 2] 3428 	jra 3$
      001330                       3429 list_exit:
      001330                       3430 	_drop VSIZE 
      009229 03 A1            [ 2]    1     addw sp,#VSIZE 
      00922B 10               [ 4] 3431 	ret
                                   3432 
                                   3433 ;-------------------------
                                   3434 ; print counted string 
                                   3435 ; input:
                                   3436 ;   X 	address of string
                                   3437 ;--------------------------
      001333                       3438 prt_cmd_name:
      00922C 26               [ 1] 3439 	ld a,(x)
      00922D 06               [ 2] 3440 	incw x
      00922E 72 BB            [ 1] 3441 	and a,#15  
      009230 00               [ 1] 3442 	push a 
      009231 0D 20            [ 1] 3443 1$: tnz (1,sp) 
      009233 CD 72            [ 1] 3444 	jreq 9$
      009235 B0               [ 1] 3445 	ld a,(x)
      009236 00 0D 20         [ 4] 3446 	call putc 
      009239 C7               [ 2] 3447 	incw x
      00923A 1E 01            [ 1] 3448 	dec (1,sp)	 
      00923C A6 84            [ 2] 3449 	jra 1$
      00923E 84               [ 1] 3450 9$: pop a 
      00923E 5B               [ 4] 3451 	ret	
                                   3452 
                                   3453 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3454 ; print TK_QSTR
                                   3455 ; converting control character
                                   3456 ; to backslash sequence
                                   3457 ; input:
                                   3458 ;   X        char *
                                   3459 ;-----------------------------
      001347                       3460 prt_quote:
      00923F 03 81            [ 1] 3461 	ld a,#'"
      009241 CD 02 A0         [ 4] 3462 	call putc 
      009241 52               [ 1] 3463 1$:	ld a,(x)
      009242 03 CD            [ 1] 3464 	jreq 9$
      009244 91               [ 2] 3465 	incw x 
      009245 F8 A1            [ 1] 3466 	cp a,#SPACE 
      009247 02 25            [ 1] 3467 	jrult 3$
      009249 4F 1F 01         [ 4] 3468 	call putc
      00924C CD 89            [ 1] 3469 	cp a,#'\ 
      00924E E7 A1            [ 1] 3470 	jrne 1$ 
      00135B                       3471 2$:
      009250 02 25 42         [ 4] 3472 	call putc 
      009253 20 EC            [ 2] 3473 	jra 1$
      009253 6B               [ 1] 3474 3$: push a 
      009254 03 A4            [ 1] 3475 	ld a,#'\
      009256 30 A1 30         [ 4] 3476 	call putc 
      009259 27               [ 1] 3477 	pop a 
      00925A 07 55            [ 1] 3478 	sub a,#7
      00925C 00 03 00         [ 1] 3479 	ld acc8,a 
      00925F 02 20 33 0C      [ 1] 3480 	clr acc16
      009262 90 AE 0B A0      [ 2] 3481 	ldw y,#escaped 
      009262 CD 91 F8 A1      [ 2] 3482 	addw y,acc16 
      009266 84 27            [ 1] 3483 	ld a,(y)
      009268 03 CC            [ 2] 3484 	jra 2$
      00926A 88 F5            [ 1] 3485 9$: ld a,#'"
      00926C CF 00 0D         [ 4] 3486 	call putc 
      00926F 1E               [ 2] 3487 	incw x 
      009270 01               [ 4] 3488 	ret
                                   3489 
                                   3490 ;--------------------------
                                   3491 ; return variable name 
                                   3492 ; from its address.
                                   3493 ; input:
                                   3494 ;   X    variable address
                                   3495 ; output:
                                   3496 ;   A     variable letter
                                   3497 ;--------------------------
      001383                       3498 var_name:
      009271 72 B0 00         [ 2] 3499 		subw x,#vars 
      009274 0D               [ 1] 3500 		ld a,xl 
      009275 26               [ 1] 3501 		srl a 
      009276 06 35            [ 1] 3502 		add a,#'A 
      009278 02               [ 4] 3503 		ret 
                                   3504 
                                   3505 
                                   3506 ;--------------------------
                                   3507 ; decompile line from token list 
                                   3508 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3509 ;   A       stop at this position 
                                   3510 ;   X 		pointer at line
                                   3511 ; output:
                                   3512 ;   none 
                                   3513 ;--------------------------	
                           000001  3514 	BASE_SAV=1
                           000002  3515 	WIDTH_SAV=2
                           000003  3516 	XSAVE=3
                           000005  3517 	LLEN=5
                           000005  3518 	VSIZE=5 
      00138B                       3519 prt_basic_line:
      00138B                       3520 	_vars VSIZE
      009279 00 0E            [ 2]    1     sub sp,#VSIZE 
      00927B 20 0C            [ 1] 3521 	ld (LLEN,sp),a  
      00927D C6 00 0A         [ 1] 3522 	ld a,base
      00927D 2C 06            [ 1] 3523 	ld (BASE_SAV,sp),a  
      00927F 35 04 00         [ 1] 3524 	ld a,tab_width 
      009282 0E 20            [ 1] 3525 	ld (WIDTH_SAV,sp),a 
      009284 04 00 17         [ 2] 3526 	ldw ptr16,x
      009285 FE               [ 2] 3527 	ldw x,(x)
      009285 35 01 00 0E      [ 1] 3528 	mov base,#10
      009289 35 05 00 24      [ 1] 3529 	mov tab_width,#5
      009289 5F C6 00         [ 4] 3530 	call print_int ; print line number 
      00928C 0E 14            [ 1] 3531 	ld a,#SPACE 
      00928E 03 4D 27         [ 4] 3532 	call putc 
      009291 05 5C 00 24      [ 1] 3533 	clr tab_width
      009293 AE 00 03         [ 2] 3534 	ldw x,#3
      009293 20               [ 1] 3535 1$:	ld a,xl 
      009294 02 1E            [ 1] 3536 	cp a,(LLEN,sp)
      009296 01 03            [ 1] 3537 	jrmi 2$
      009297 CC 14 8A         [ 2] 3538 	jp 20$
      0013BC                       3539 2$:	 
      009297 A6 84 00 17      [ 4] 3540 	ld a,([ptr16],x)
      009299 5C               [ 2] 3541 	incw x 
      009299 5B 03            [ 2] 3542 	ldw (XSAVE,sp),x 
      00929B 81 DE 00 17      [ 5] 3543 	ldw x,([ptr16],x)
      00929C 4D               [ 1] 3544 	tnz a 
      00929C AE 92            [ 1] 3545 	jrmi 3$
      00929E B6 CD            [ 1] 3546 	cp a,#TK_QSTR 
      0092A0 83 33            [ 1] 3547 	jreq 6$
      0092A2 96 1C            [ 1] 3548 	cp a,#TK_CHAR 
      0092A4 00 03            [ 1] 3549 	jreq 7$
      0092A6 90 AE            [ 2] 3550 	jra 8$
                                   3551 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0013D4                       3552 3$:	
      0092A8 18 00            [ 1] 3553 	cp a,#TK_VAR 
      0092AA CF 00            [ 1] 3554 	jreq 4$
      0092AC 0D 72            [ 1] 3555 	cp a,#TK_INTGR
      0092AE B2 00            [ 1] 3556 	jreq 5$
      0092B0 0D CD 83         [ 2] 3557 	cpw x,#remark 
      0092B3 D5 4F            [ 1] 3558 	jrne 30$
      0092B5 81 0A            [ 1] 3559 	ld a,#''
      0092B7 63 6F 6E         [ 4] 3560 	call putc 
      0092BA 74 65            [ 2] 3561 	ldw x,(XSAVE,sp)
      0092BC 6E 74 20         [ 2] 3562 	addw x,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092BF 6F 66 20 73      [ 2] 3563 	addw x,ptr16  
      0092C3 74 61 63         [ 4] 3564 	call puts 
      0092C6 6B 20 66         [ 2] 3565 	jp 20$ 
      0013F5                       3566 30$:
      0092C9 72 6F            [ 1] 3567 	ld a,#SPACE 
      0092CB 6D 20 74         [ 4] 3568 	call putc 
      0092CE 6F 70 20         [ 4] 3569 	call cmd_name
      0092D1 74 6F 20         [ 4] 3570 	call prt_cmd_name
      0092D4 62 6F            [ 1] 3571 	ld a,#SPACE 
      0092D6 74 74 6F         [ 4] 3572 	call putc 
      001405                       3573 31$:
      0092D9 6D 3A            [ 2] 3574 	ldw x,(XSAVE,sp)
      0092DB 0A 00 02         [ 2] 3575 	addw x,#2
      0092DD 20 A8            [ 2] 3576 	jra 1$
                                   3577 ;; TK_VAR 
      00140C                       3578 4$:
                                   3579 ;	ld a,#SPACE 
                                   3580 ;	call putc 
      0092DD 35 10 00         [ 4] 3581 	call var_name
      0092E0 0B 81 A0         [ 4] 3582 	call putc 
      0092E2 20 F1            [ 2] 3583 	jra 31$
                                   3584 ;; TK_INTGR
      001414                       3585 5$:
                                   3586 ;	ld a,#SPACE 
                                   3587 ;	call putc
      0092E2 35 0A 00         [ 4] 3588 	call print_int 
      0092E5 0B 81            [ 2] 3589 	jra 31$
                                   3590 ;; TK_QSTR
      0092E7                       3591 6$:
      0092E7 AE 16            [ 2] 3592 	ldw x,(XSAVE,sp)
      0092E9 90 72 B0 00      [ 2] 3593 	addw x,ptr16 
      0092ED 1F A6 84         [ 4] 3594 	call prt_quote  
      0092F0 81 B0 00 17      [ 2] 3595 	subw x,ptr16  
      0092F1 CC 13 B4         [ 2] 3596 	jp 1$
                                   3597 ;; TK_CHAR 
      001429                       3598 7$:
      0092F1 AE 16            [ 1] 3599 	ld a,#'\ 
      0092F3 90 72 B0         [ 4] 3600 	call putc 
      0092F6 00               [ 1] 3601 	ld a,xh 
      0092F7 1F 90 CE         [ 4] 3602 	call putc 
      0092FA 00 05            [ 2] 3603 	ldw x,(XSAVE,sp)
      0092FC 90               [ 2] 3604 	incw x 
      0092FD C3 00 1F         [ 2] 3605 	jp 1$ 
      009300 25 0A            [ 1] 3606 8$: cp a,#TK_COLON 
      009302 3B 00            [ 1] 3607 	jrne 9$
      009304 04 4B            [ 1] 3608 	ld a,#':
      00143E                       3609 81$:
      009306 00 72 F0         [ 4] 3610 	call putc
      001441                       3611 82$:
      009309 01 5B            [ 2] 3612 	ldw x,(XSAVE,sp)
      00930B 02 54 CF         [ 2] 3613 	jp 1$ 
      001446                       3614 9$: 
      00930E 00 22            [ 1] 3615 	cp a,#TK_SHARP
      009310 A6 84            [ 1] 3616 	jrugt 10$ 
      009312 81 06            [ 1] 3617 	sub a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009313 90 5F            [ 1] 3618 	clrw y 
      009313 CD 89            [ 1] 3619 	ld yl,a
      009315 E7 A1 85 27      [ 2] 3620 	addw y,#single_char 
      009319 0A A1            [ 1] 3621 	ld a,(y)
      00931B 06 27            [ 2] 3622 	jra 81$ 
      001458                       3623 10$: 
      00931D 03 CC            [ 1] 3624 	cp a,#TK_MINUS 
      00931F 88 F5            [ 1] 3625 	jrugt 11$
      009321 A0 10            [ 1] 3626 	sub a,#TK_PLUS 
      009321 CD 91            [ 1] 3627 	clrw y 
      009323 2A 97            [ 1] 3628 	ld yl,a 
      009324 72 A9 14 A1      [ 2] 3629 	addw y,#add_char 
      009324 89 CD            [ 1] 3630 	ld a,(y)
      009326 89 E7            [ 2] 3631 	jra 81$
      00146A                       3632 11$:
      009328 A1 32            [ 1] 3633     cp a,#TK_MOD 
      00932A 27 03            [ 1] 3634 	jrugt 12$
      00932C CC 88            [ 1] 3635 	sub a,#TK_MULT
      00932E F5 5F            [ 1] 3636 	clrw y 
      00932F 90 97            [ 1] 3637 	ld yl,a 
      00932F CD 92 41 A1      [ 2] 3638 	addw y,#mul_char
      009333 84 27            [ 1] 3639 	ld a,(y)
      009335 03 CC            [ 2] 3640 	jra 81$
      00147C                       3641 12$:
      009337 88 F5            [ 1] 3642 	sub a,#TK_GT  
      009339 48               [ 1] 3643 	sll a 
      009339 90               [ 1] 3644 	clrw x 
      00933A 93               [ 1] 3645 	ld xl,a 
      00933B 85 FF 81         [ 2] 3646 	addw x,#relop_str 
      00933E FE               [ 2] 3647 	ldw x,(x)
      00933E CE 00 1D         [ 4] 3648 	call puts 
      009341 C3 00            [ 2] 3649 	jra 82$
      00148A                       3650 20$: 
      009343 1F 2B            [ 1] 3651 	ld a,#CR 
      009345 01 81 A0         [ 4] 3652 	call putc
      009347 7B 02            [ 1] 3653 	ld a,(WIDTH_SAV,sp) 
      009347 52 06 1F         [ 1] 3654 	ld tab_width,a 
      00934A 05 FE            [ 1] 3655 	ld a,(BASE_SAV,sp) 
      00934C 1F 01 AE         [ 1] 3656 	ld base,a
      001499                       3657 	_drop VSIZE 
      00934F 7F FF            [ 2]    1     addw sp,#VSIZE 
      009351 1F               [ 4] 3658 	ret 
                                   3659 
      009352 03 CD 90 FF 4D        3660 single_char: .byte '@','(',')',',','#'
      009357 27 31                 3661 add_char: .byte '+','-'
      009359 A1 02 27              3662 mul_char: .byte '*','/','%'
      00935C 07 A1 01 27 06 CC 88  3663 relop_str: .word gt,equal,ge,lt,le,ne 
             F5 85 1F 05 BE
      009367 3E 00                 3664 gt: .asciz ">"
      009367 85 1F                 3665 equal: .asciz "="
      009369 01 3D 00              3666 ge: .asciz ">="
      00936A 3C 00                 3667 lt: .asciz "<"
      00936A CE 00 1D              3668 le: .asciz "<="
      00936D 1F 05 C3              3669 ne:  .asciz "<>"
                                   3670 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3671 
                                   3672 ;---------------------------------
                                   3673 ; BASIC: PRINT|? arg_list 
                                   3674 ; print values from argument list
                                   3675 ;----------------------------------
                           000001  3676 	COMMA=1
                           000001  3677 	VSIZE=1
      0014C1                       3678 print:
      009370 00 1F            [ 1] 3679 push #0 ; local variable COMMA 
      0014C3                       3680 reset_comma:
      009372 2A 3C            [ 1] 3681 	clr (COMMA,sp)
      0014C5                       3682 prt_loop:
      009374 FE 13 01         [ 4] 3683 	call next_token
      009377 2A 11            [ 1] 3684 	cp a,#CMD_END 
      009379 1E 05            [ 1] 3685 	jrult print_exit ; colon or end of line 
      00937B E6 02            [ 1] 3686 	cp a,#TK_QSTR
      00937D C7 00            [ 1] 3687 	jreq 1$
      00937F 0E 72            [ 1] 3688 	cp a,#TK_CHAR 
      009381 5F 00            [ 1] 3689 	jreq 2$ 
      009383 0D 72            [ 1] 3690 	cp a,#TK_CFUNC 
      009385 BB 00            [ 1] 3691 	jreq 3$
      009387 0D 20            [ 1] 3692 	cp a,#TK_COMMA 
      009389 E3 18            [ 1] 3693 	jreq 4$
      00938A A1 0A            [ 1] 3694 	cp a,#TK_SHARP 
      00938A 1E 05            [ 1] 3695 	jreq 5$
      00938C E6 02            [ 2] 3696 	jra 7$ 
      0014E2                       3697 1$:	; print string 
      00938E CD 94 0B         [ 4] 3698 	call puts
      009391 1E 05            [ 2] 3699 	jra reset_comma
      0014E7                       3700 2$:	; print character 
      009393 E6               [ 1] 3701 	ld a,xl 
      009394 02 C7 00         [ 4] 3702 	call putc 
      009397 0E 72            [ 2] 3703 	jra reset_comma 
      0014ED                       3704 3$: ; print character function value  	
      009399 5F               [ 4] 3705 	call (x)
      00939A 00               [ 1] 3706 	ld a,xl 
      00939B 0D 72 BB         [ 4] 3707 	call putc
      00939E 00 0D            [ 2] 3708 	jra reset_comma 
      0014F4                       3709 4$: ; set comma state 
      0093A0 C3 00            [ 1] 3710 	ld a,#255 
      0093A2 1F 2A            [ 1] 3711 	ld (COMMA,sp),a  
      0093A4 0B 1F 05         [ 2] 3712 	jp prt_loop   
      0014FB                       3713 5$: ; # character must be followed by an integer   
      0093A7 FE 13 03         [ 4] 3714 	call next_token
      0093AA 2C 04            [ 1] 3715 	cp a,#TK_INTGR 
      0093AC 1E 05            [ 1] 3716 	jreq 6$
      0093AE 20 DC 75         [ 2] 3717 	jp syntax_error 
      0093B0                       3718 6$: ; set tab width
      0093B0 5B               [ 1] 3719 	ld a,xl 
      0093B1 06 81            [ 1] 3720 	and a,#15 
      0093B3 C7 00 24         [ 1] 3721 	ld tab_width,a 
      0093B3 F6 5C            [ 2] 3722 	jra reset_comma 
      00150D                       3723 7$:	
      00150D                       3724 	_unget_token
      0093B5 A4 0F 88 0D 01   [ 1]    1     mov in,in.saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093BA 27 09 F6         [ 4] 3725 	call relation 
      0093BD CD 83            [ 1] 3726 	cp a,#TK_INTGR
      0093BF 20 5C            [ 1] 3727 	jreq 8$
      001519                       3728 	_unget_token
      0093C1 0A 01 20 F3 84   [ 1]    1     mov in,in.saved
      0093C6 81 15 26         [ 2] 3729 	jp print_exit 
      0093C7 CD 09 BC         [ 4] 3730 8$: call print_int 
      0093C7 A6 22            [ 2] 3731 	jra reset_comma 
      001526                       3732 print_exit:
      0093C9 CD 83            [ 1] 3733 	tnz (COMMA,sp)
      0093CB 20 F6            [ 1] 3734 	jrne 9$
      0093CD 27 2D            [ 1] 3735 	ld a,#CR 
      0093CF 5C A1 20         [ 4] 3736     call putc 
      00152F                       3737 9$:	_drop VSIZE 
      0093D2 25 0C            [ 2]    1     addw sp,#VSIZE 
      0093D4 CD               [ 4] 3738 	ret 
                                   3739 
      001532                       3740 print_type: 
                                   3741 
                                   3742 ;----------------------
                                   3743 ; 'save_context' and
                                   3744 ; 'rest_context' must be 
                                   3745 ; called at the same 
                                   3746 ; call stack depth 
                                   3747 ; i.e. SP must have the 
                                   3748 ; save value at  
                                   3749 ; entry point of both 
                                   3750 ; routine. 
                                   3751 ;---------------------
                           000004  3752 	CTXT_SIZE=4 ; size of saved data 
                                   3753 ;--------------------
                                   3754 ; save current BASIC
                                   3755 ; interpreter context 
                                   3756 ; on stack 
                                   3757 ;--------------------
      001532                       3758 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001532                       3759 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001532                       3760 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001532                       3761 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001532                       3762 save_context:
      0093D5 83 20 A1         [ 2] 3763 	ldw x,basicptr 
      0093D8 5C 26            [ 2] 3764 	ldw (BPTR,sp),x
      0093DA F1 00 01         [ 1] 3765 	ld a,in 
      0093DB 6B 05            [ 1] 3766 	ld (IN,sp),a
      0093DB CD 83 20         [ 1] 3767 	ld a,count 
      0093DE 20 EC            [ 1] 3768 	ld (CNT,sp),a  
      0093E0 88               [ 4] 3769 	ret
                                   3770 
                                   3771 ;-----------------------
                                   3772 ; restore previously saved 
                                   3773 ; BASIC interpreter context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3774 ; from stack 
                                   3775 ;-------------------------
      001542                       3776 rest_context:
      0093E1 A6 5C            [ 2] 3777 	ldw x,(BPTR,sp)
      0093E3 CD 83 20         [ 2] 3778 	ldw basicptr,x 
      0093E6 84 A0            [ 1] 3779 	ld a,(IN,sp)
      0093E8 07 C7 00         [ 1] 3780 	ld in,a
      0093EB 0E 72            [ 1] 3781 	ld a,(CNT,sp)
      0093ED 5F 00 0D         [ 1] 3782 	ld count,a  
      0093F0 90               [ 4] 3783 	ret
                                   3784 
                                   3785 
                                   3786 
                                   3787 ;------------------------------------------
                                   3788 ; BASIC: INPUT [string]var[,[string]var]
                                   3789 ; input value in variables 
                                   3790 ; [string] optionally can be used as prompt 
                                   3791 ;-----------------------------------------
                           000001  3792 	CX_BPTR=1
                           000003  3793 	CX_IN=3
                           000004  3794 	CX_CNT=4
                           000005  3795 	SKIP=5
                           000006  3796 	VAR_ADDR=6
                           000007  3797 	VSIZE=7
      001552                       3798 input_var:
      001552                       3799 	_vars VSIZE 
      0093F1 AE 8C            [ 2]    1     sub sp,#VSIZE 
      001554                       3800 input_loop:
      0093F3 20 72            [ 1] 3801 	clr (SKIP,sp)
      0093F5 B9 00 0D         [ 4] 3802 	call next_token 
      0093F8 90 F6            [ 1] 3803 	cp a,#TK_QSTR 
      0093FA 20 DF            [ 1] 3804 	jrne 1$ 
      0093FC A6 22 CD         [ 4] 3805 	call puts 
      0093FF 83 20            [ 1] 3806 	cpl (SKIP,sp)
      009401 5C 81 67         [ 4] 3807 	call next_token 
      009403 A1 85            [ 1] 3808 1$: cp a,#TK_VAR  
      009403 1D 00            [ 1] 3809 	jreq 2$ 
      009405 27 9F 44         [ 2] 3810 	jp syntax_error
      009408 AB 41            [ 2] 3811 2$:	ldw (VAR_ADDR,sp),x 
      00940A 81 05            [ 1] 3812 	tnz (SKIP,sp)
      00940B 26 06            [ 1] 3813 	jrne 21$ 
      00940B 52 05 6B         [ 4] 3814 	call var_name 
      00940E 05 C6 00         [ 4] 3815 	call putc   
      001578                       3816 21$:
      009411 0B 6B            [ 1] 3817 	ld a,#':
      009413 01 C6 00         [ 4] 3818 	call putc 
      009416 25 6B 02         [ 4] 3819 	call save_context 
      009419 CF 00 18 FE      [ 1] 3820 	clr count  
      00941D 35 0A 00         [ 4] 3821 	call readln 
      009420 0B 35 05         [ 2] 3822 	ldw x,#tib 
      009423 00 25 CD         [ 1] 3823 	push count
      009426 8A 3C            [ 1] 3824 	push #0 
      009428 A6 20 CD         [ 2] 3825 	addw x,(1,sp)
      00942B 83               [ 2] 3826 	incw x 
      001593                       3827 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00942C 20 72            [ 2]    1     addw sp,#2 
      00942E 5F 00 25 AE      [ 1] 3828 	clr in 
      009432 00 03 9F         [ 4] 3829 	call get_token
      009435 11 05            [ 1] 3830 	cp a,#TK_INTGR
      009437 2B 03            [ 1] 3831 	jreq 3$ 
      009439 CC 95 0A         [ 4] 3832 	call rest_context 
      00943C CC 08 75         [ 2] 3833 	jp syntax_error
      00943C 72 D6            [ 2] 3834 3$: ldw y,(VAR_ADDR,sp) 
      00943E 00 18            [ 2] 3835 	ldw (y),x 
      009440 5C 1F 03         [ 4] 3836 	call rest_context
      009443 72 DE 00         [ 4] 3837 	call next_token 
      009446 18 4D            [ 1] 3838 	cp a,#TK_COMMA 
      009448 2B 0A            [ 1] 3839 	jreq input_loop 
      00944A A1 02            [ 1] 3840 	cp a,#TK_COLON 
      00944C 27 4B            [ 2] 3841     jrule input_exit 
      00944E A1 03 27         [ 2] 3842 	jp syntax_error 
      0015BB                       3843 input_exit:
      0015BB                       3844 	_drop VSIZE 
      009451 57 20            [ 2]    1     addw sp,#VSIZE 
      009453 64               [ 4] 3845 	ret 
                                   3846 
                                   3847 
                                   3848 ;---------------------
                                   3849 ; BASIC: REMARK | ' 
                                   3850 ; skip comment to end of line 
                                   3851 ;---------------------- 
      009454                       3852 remark:
      009454 A1 85 27 34 A1   [ 1] 3853 	mov in,count 
      009459 84               [ 4] 3854  	ret 
                                   3855 
                                   3856 
                                   3857 ;---------------------
                                   3858 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3859 ; read in loop 'addr'  
                                   3860 ; apply & 'mask' to value 
                                   3861 ; loop while result==0.  
                                   3862 ; 'xor_mask' is used to 
                                   3863 ; invert the wait logic.
                                   3864 ; i.e. loop while not 0.
                                   3865 ;---------------------
                           000001  3866 	XMASK=1 
                           000002  3867 	MASK=2
                           000003  3868 	ADDR=3
                           000004  3869 	VSIZE=4
      0015C4                       3870 wait: 
      0015C4                       3871 	_vars VSIZE
      00945A 27 38            [ 2]    1     sub sp,#VSIZE 
      00945C A3 96            [ 1] 3872 	clr (XMASK,sp) 
      00945E 3E 26 14         [ 4] 3873 	call arg_list 
      009461 A6 27            [ 1] 3874 	cp a,#2
      009463 CD 83            [ 1] 3875 	jruge 0$
      009465 20 1E 03         [ 2] 3876 	jp syntax_error 
      009468 1C 00            [ 1] 3877 0$:	cp a,#3
      00946A 02 72            [ 1] 3878 	jrult 1$
      00946C BB               [ 2] 3879 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00946D 00               [ 1] 3880 	ld a,xl
      00946E 18 CD            [ 1] 3881 	ld (XMASK,sp),a 
      009470 83               [ 2] 3882 1$: popw x ; mask 
      009471 33               [ 1] 3883 	ld a,xl 
      009472 CC 95            [ 1] 3884 	ld (MASK,sp),a 
      009474 0A               [ 2] 3885 	popw x ; address 
      009475 F6               [ 1] 3886 2$:	ld a,(x)
      009475 A6 20            [ 1] 3887 	and a,(MASK,sp)
      009477 CD 83            [ 1] 3888 	xor a,(XMASK,sp)
      009479 20 CD            [ 1] 3889 	jreq 2$ 
      0015E6                       3890 	_drop VSIZE 
      00947B 90 6E            [ 2]    1     addw sp,#VSIZE 
      00947D CD               [ 4] 3891 	ret 
                                   3892 
                                   3893 ;---------------------
                                   3894 ; BASIC: BSET addr,mask
                                   3895 ; set bits at 'addr' corresponding 
                                   3896 ; to those of 'mask' that are at 1.
                                   3897 ; arguments:
                                   3898 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3899 ;   mask        mask|addr
                                   3900 ; output:
                                   3901 ;	none 
                                   3902 ;--------------------------
      0015E9                       3903 bit_set:
      00947E 93 B3 A6         [ 4] 3904 	call arg_list 
      009481 20 CD            [ 1] 3905 	cp a,#2	 
      009483 83 20            [ 1] 3906 	jreq 1$ 
      009485 CC 08 75         [ 2] 3907 	jp syntax_error
      0015F3                       3908 1$: 
      009485 1E               [ 2] 3909 	popw x ; mask 
      009486 03               [ 1] 3910 	ld a,xl 
      009487 1C               [ 2] 3911 	popw x ; addr  
      009488 00               [ 1] 3912 	or a,(x)
      009489 02               [ 1] 3913 	ld (x),a
      00948A 20               [ 4] 3914 	ret 
                                   3915 
                                   3916 ;---------------------
                                   3917 ; BASIC: BRES addr,mask
                                   3918 ; reset bits at 'addr' corresponding 
                                   3919 ; to those of 'mask' that are at 1.
                                   3920 ; arguments:
                                   3921 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3922 ;   mask	    ~mask&*addr  
                                   3923 ; output:
                                   3924 ;	none 
                                   3925 ;--------------------------
      0015F9                       3926 bit_reset:
      00948B A8 10 7F         [ 4] 3927 	call arg_list 
      00948C A1 02            [ 1] 3928 	cp a,#2  
      00948C CD 94            [ 1] 3929 	jreq 1$ 
      00948E 03 CD 83         [ 2] 3930 	jp syntax_error
      001603                       3931 1$: 
      009491 20               [ 2] 3932 	popw x ; mask 
      009492 20               [ 1] 3933 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009493 F1               [ 1] 3934 	cpl a 
      009494 85               [ 2] 3935 	popw x ; addr  
      009494 CD               [ 1] 3936 	and a,(x)
      009495 8A               [ 1] 3937 	ld (x),a 
      009496 3C               [ 4] 3938 	ret 
                                   3939 
                                   3940 ;---------------------
                                   3941 ; BASIC: BTOGL addr,mask
                                   3942 ; toggle bits at 'addr' corresponding 
                                   3943 ; to those of 'mask' that are at 1.
                                   3944 ; arguments:
                                   3945 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3946 ;   mask	    mask^*addr  
                                   3947 ; output:
                                   3948 ;	none 
                                   3949 ;--------------------------
      00160A                       3950 bit_toggle:
      009497 20 EC 7F         [ 4] 3951 	call arg_list 
      009499 A1 02            [ 1] 3952 	cp a,#2 
      009499 1E 03            [ 1] 3953 	jreq 1$ 
      00949B 72 BB 00         [ 2] 3954 	jp syntax_error
      00949E 18               [ 2] 3955 1$: popw x ; mask 
      00949F CD               [ 1] 3956 	ld a,xl 
      0094A0 93               [ 2] 3957 	popw x ; addr  
      0094A1 C7               [ 1] 3958 	xor a,(x)
      0094A2 72               [ 1] 3959 	ld (x),a 
      0094A3 B0               [ 4] 3960 	ret 
                                   3961 
                                   3962 
                                   3963 ;---------------------
                                   3964 ; BASIC: BTEST(addr,bit)
                                   3965 ; return bit value at 'addr' 
                                   3966 ; bit is in range {0..7}.
                                   3967 ; arguments:
                                   3968 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3969 ;   bit 	    bit position {0..7}  
                                   3970 ; output:
                                   3971 ;	none 
                                   3972 ;--------------------------
      00161A                       3973 bit_test:
      0094A4 00 18 CC         [ 4] 3974 	call func_args 
      0094A7 94 34            [ 1] 3975 	cp a,#2
      0094A9 27 03            [ 1] 3976 	jreq 0$
      0094A9 A6 5C CD         [ 2] 3977 	jp syntax_error
      001624                       3978 0$:	
      0094AC 83               [ 2] 3979 	popw x 
      0094AD 20               [ 1] 3980 	ld a,xl 
      0094AE 9E CD            [ 1] 3981 	and a,#7
      0094B0 83               [ 1] 3982 	push a   
      0094B1 20 1E            [ 1] 3983 	ld a,#1 
      0094B3 03 5C            [ 1] 3984 1$: tnz (1,sp)
      0094B5 CC 94            [ 1] 3985 	jreq 2$
      0094B7 34               [ 1] 3986 	sll a 
      0094B8 A1 01            [ 1] 3987 	dec (1,sp)
      0094BA 26 0A            [ 2] 3988 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      001634                       3989 2$: _drop 1 
      0094BC A6 3A            [ 2]    1     addw sp,#1 
      0094BE 85               [ 2] 3990 	popw x 
      0094BE CD               [ 1] 3991 	and a,(x)
      0094BF 83 20            [ 1] 3992 	jreq 3$
      0094C1 A6 01            [ 1] 3993 	ld a,#1 
      0094C1 1E               [ 1] 3994 3$:	clrw x 
      0094C2 03               [ 1] 3995 	ld xl,a 
      0094C3 CC 94            [ 1] 3996 	ld a,#TK_INTGR
      0094C5 34               [ 4] 3997 	ret
                                   3998 
                                   3999 
                                   4000 ;--------------------
                                   4001 ; BASIC: POKE addr,byte
                                   4002 ; put a byte at addr 
                                   4003 ;--------------------
      0094C6                       4004 poke:
      0094C6 A1 0A 22         [ 4] 4005 	call arg_list 
      0094C9 0E A0            [ 1] 4006 	cp a,#2
      0094CB 06 90            [ 1] 4007 	jreq 1$
      0094CD 5F 90 97         [ 2] 4008 	jp syntax_error
      00164B                       4009 1$:	
      0094D0 72               [ 2] 4010 	popw x  
      0094D1 A9               [ 1] 4011     ld a,xl 
      0094D2 95               [ 2] 4012 	popw x 
      0094D3 1C               [ 1] 4013 	ld (x),a 
      0094D4 90               [ 4] 4014 	ret 
                                   4015 
                                   4016 ;-----------------------
                                   4017 ; BASIC: PEEK(addr)
                                   4018 ; get the byte at addr 
                                   4019 ; input:
                                   4020 ;	none 
                                   4021 ; output:
                                   4022 ;	X 		value 
                                   4023 ;-----------------------
      001650                       4024 peek:
      0094D5 F6 20 E6         [ 4] 4025 	call func_args
      0094D8 A1 01            [ 1] 4026 	cp a,#1 
      0094D8 A1 11            [ 1] 4027 	jreq 1$
      0094DA 22 0E A0         [ 2] 4028 	jp syntax_error
      0094DD 10               [ 2] 4029 1$: popw x 
      0094DE 90               [ 1] 4030 	ld a,(x)
      0094DF 5F               [ 1] 4031 	clrw x 
      0094E0 90               [ 1] 4032 	ld xl,a 
      0094E1 97 72            [ 1] 4033 	ld a,#TK_INTGR
      0094E3 A9               [ 4] 4034 	ret 
                                   4035 
                                   4036 ;---------------------------
                                   4037 ; BASIC IF expr : instructions
                                   4038 ; evaluate expr and if true 
                                   4039 ; execute instructions on same line. 
                                   4040 ;----------------------------
      001661                       4041 if: 
      0094E4 95 21 90         [ 4] 4042 	call relation 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094E7 F6 20            [ 1] 4043 	cp a,#TK_INTGR
      0094E9 D4 03            [ 1] 4044 	jreq 1$ 
      0094EA CC 08 75         [ 2] 4045 	jp syntax_error
      0094EA A1               [ 1] 4046 1$:	clr a 
      0094EB 22               [ 2] 4047 	tnzw x 
      0094EC 22 0E            [ 1] 4048 	jrne 9$  
                                   4049 ;skip to next line
      0094EE A0 20 90 5F 90   [ 1] 4050 	mov in,count
      0094F3 97               [ 4] 4051 9$:	ret 
                                   4052 
                                   4053 ;------------------------
                                   4054 ; BASIC: FOR var=expr 
                                   4055 ; set variable to expression 
                                   4056 ; leave variable address 
                                   4057 ; on stack and set
                                   4058 ; FLOOP bit in 'flags'
                                   4059 ;-----------------
                           000001  4060 	RETL1=1 ; return address  
                           000003  4061 	FSTEP=3  ; variable increment
                           000005  4062 	LIMIT=5 ; loop limit 
                           000007  4063 	CVAR=7   ; control variable 
                           000009  4064 	INW=9   ;  in.w saved
                           00000B  4065 	BPTR=11 ; baseptr saved
                           00000A  4066 	VSIZE=10  
      001675                       4067 for: ; { -- var_addr }
      0094F4 72               [ 2] 4068 	popw x ; call return address 
      001676                       4069 	_vars VSIZE 
      0094F5 A9 95            [ 2]    1     sub sp,#VSIZE 
      0094F7 23               [ 2] 4070 	pushw x  ; RETL1 
      0094F8 90 F6            [ 1] 4071 	ld a,#TK_VAR 
      0094FA 20 C2 6D         [ 4] 4072 	call expect
      0094FC 1F 07            [ 2] 4073 	ldw (CVAR,sp),x  ; control variable 
      0094FC A0 31 48         [ 4] 4074 	call let_var 
      0094FF 5F 97 1C 95      [ 1] 4075 	bset flags,#FLOOP 
                                   4076 ; open space on stack for loop data 
      009503 26               [ 1] 4077 	clrw x 
      009504 FE CD            [ 2] 4078 	ldw (BPTR,sp),x 
      009506 83 33            [ 2] 4079 	ldw (INW,sp),x 
      009508 20 B7 67         [ 4] 4080 	call next_token 
      00950A A1 80            [ 1] 4081 	cp a,#TK_CMD 
      00950A A6 0D            [ 1] 4082 	jreq 1$
      00950C CD 83 20         [ 2] 4083 	jp syntax_error
      001696                       4084 1$:  
      00950F 7B 02 C7         [ 2] 4085 	cpw x,#to 
      009512 00 25            [ 1] 4086 	jreq to
      009514 7B 01 C7         [ 2] 4087 	jp syntax_error 
                                   4088 
                                   4089 ;-----------------------------------
                                   4090 ; BASIC: TO expr 
                                   4091 ; second part of FOR loop initilization
                                   4092 ; leave limit on stack and set 
                                   4093 ; FTO bit in 'flags'
                                   4094 ;-----------------------------------
      00169E                       4095 to: ; { var_addr -- var_addr limit step }
      009517 00 0B 5B 05 81   [ 2] 4096 	btjt flags,#FLOOP,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00951C 40 28 29         [ 2] 4097 	jp syntax_error
      00951F 2C 23 2B         [ 4] 4098 1$: call relation  
      009522 2D 2A            [ 1] 4099 	cp a,#TK_INTGR 
      009524 2F 25            [ 1] 4100 	jreq 2$ 
      009526 95 32 95         [ 2] 4101 	jp syntax_error
      009529 34 95            [ 2] 4102 2$: ldw (LIMIT,sp),x
                                   4103 ;	ldw x,in.w 
      00952B 36 95 39         [ 4] 4104 	call next_token
      00952E 95 3B            [ 1] 4105 	cp a,#TK_NONE  
      009530 95 3E            [ 1] 4106 	jreq 4$ 
      009532 3E 00            [ 1] 4107 	cp a,#TK_CMD
      009534 3D 00            [ 1] 4108 	jrne 3$
      009536 3E 3D 00         [ 2] 4109 	cpw x,#step 
      009539 3C 00            [ 1] 4110 	jreq step
      0016C2                       4111 3$:	
      0016C2                       4112 	_unget_token   	 
      00953B 3C 3D 00 3C 3E   [ 1]    1     mov in,in.saved
      0016C7                       4113 4$:	
      009540 00 00 01         [ 2] 4114 	ldw x,#1   ; default step  
      009541 1F 03            [ 2] 4115 	ldw (FSTEP,sp),x 
      009541 4B 00            [ 2] 4116 	jra store_loop_addr 
                                   4117 
                                   4118 
                                   4119 ;----------------------------------
                                   4120 ; BASIC: STEP expr 
                                   4121 ; optional third par of FOR loop
                                   4122 ; initialization. 	
                                   4123 ;------------------------------------
      009543                       4124 step: ; {var limit -- var limit step}
      009543 0F 01 00 23 03   [ 2] 4125 	btjt flags,#FLOOP,1$
      009545 CC 08 75         [ 2] 4126 	jp syntax_error
      009545 CD 89 E7         [ 4] 4127 1$: call relation
      009548 A1 02            [ 1] 4128 	cp a,#TK_INTGR
      00954A 25 5A            [ 1] 4129 	jreq 2$
      00954C A1 02 27         [ 2] 4130 	jp syntax_error
      00954F 12 A1            [ 2] 4131 2$:	ldw (FSTEP,sp),x ; step
                                   4132 ; leave loop back entry point on cstack 
                                   4133 ; cstack is 1 call deep from interpreter
      0016E2                       4134 store_loop_addr:
      009551 03 27 13         [ 2] 4135 	ldw x,basicptr  
      009554 A1 82            [ 2] 4136 	ldw (BPTR,sp),x 
      009556 27 15 A1         [ 2] 4137 	ldw x,in.w 
      009559 09 27            [ 2] 4138 	ldw (INW,sp),x   
      00955B 18 A1 0A 27      [ 1] 4139 	bres flags,#FLOOP 
      00955F 1B 20 2B 20      [ 1] 4140 	inc loop_depth  
      009562 81               [ 4] 4141 	ret 
                                   4142 
                                   4143 ;--------------------------------
                                   4144 ; BASIC: NEXT var 
                                   4145 ; FOR loop control 
                                   4146 ; increment variable with step 
                                   4147 ; and compare with limit 
                                   4148 ; loop if threshold not crossed.
                                   4149 ; else stack. 
                                   4150 ; and decrement 'loop_depth' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4151 ;--------------------------------
      0016F5                       4152 next: ; {var limit step retl1 -- [var limit step ] }
      009562 CD 83 33 20      [ 1] 4153 	tnz loop_depth 
      009566 DC 03            [ 1] 4154 	jrne 1$ 
      009567 CC 08 75         [ 2] 4155 	jp syntax_error 
      0016FE                       4156 1$: 
      009567 9F CD            [ 1] 4157 	ld a,#TK_VAR 
      009569 83 20 20         [ 4] 4158 	call expect
                                   4159 ; check for good variable after NEXT 	 
      00956C D6 07            [ 2] 4160 	cpw x,(CVAR,sp)
      00956D 27 03            [ 1] 4161 	jreq 2$  
      00956D FD 9F CD         [ 2] 4162 	jp syntax_error ; not the good one 
      00170A                       4163 2$: ; increment variable 
      009570 83               [ 2] 4164 	ldw x,(x)  ; get var value 
      009571 20 20 CF         [ 2] 4165 	addw x,(FSTEP,sp) ; var+step 
      009574 16 07            [ 2] 4166 	ldw y,(CVAR,sp)
      009574 A6 FF            [ 2] 4167 	ldw (y),x ; save var new value 
                                   4168 ; check sign of STEP  
      009576 6B 01            [ 1] 4169 	ld a,#0x80
      009578 CC 95            [ 1] 4170 	bcp a,(FSTEP,sp)
      00957A 45 06            [ 1] 4171 	jrpl 4$
                                   4172 ;negative step 
      00957B 13 05            [ 2] 4173 	cpw x,(LIMIT,sp)
      00957B CD 89            [ 1] 4174 	jrslt loop_done
      00957D E7 A1            [ 2] 4175 	jra loop_back 
      00171E                       4176 4$: ; positive step
      00957F 84 27            [ 2] 4177 	cpw x,(LIMIT,sp)
      009581 03 CC            [ 1] 4178 	jrsgt loop_done
      001722                       4179 loop_back:
      009583 88 F5            [ 2] 4180 	ldw x,(BPTR,sp)
      009585 CF 00 04         [ 2] 4181 	ldw basicptr,x 
      009585 9F A4 0F C7 00   [ 2] 4182 	btjf flags,#FRUN,1$ 
      00958A 25 20            [ 1] 4183 	ld a,(2,x)
      00958C B6 00 03         [ 1] 4184 	ld count,a
      00958D 1E 09            [ 2] 4185 1$:	ldw x,(INW,sp)
      00958D 55 00 03         [ 2] 4186 	ldw in.w,x 
      009590 00               [ 4] 4187 	ret 
      001737                       4188 loop_done:
                                   4189 	; remove loop data from stack  
      009591 02               [ 2] 4190 	popw x
      001738                       4191 	_drop VSIZE 
      009592 CD 92            [ 2]    1     addw sp,#VSIZE 
      009594 41 A1 84 27      [ 1] 4192 	dec loop_depth 
                                   4193 ;	pushw x 
                                   4194 ;	ret 
      009598 08               [ 2] 4195 	jp (x)
                                   4196 
                                   4197 ;----------------------------
                                   4198 ; called by goto/gosub
                                   4199 ; to get target line number 
                                   4200 ;---------------------------
      00173F                       4201 get_target_line:
      009599 55 00 03         [ 4] 4202 	call relation 
      00959C 00 02            [ 1] 4203 	cp a,#TK_INTGR
      00959E CC 95            [ 1] 4204 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095A0 A6 CD 8A         [ 2] 4205 	jp syntax_error
      0095A3 3C 20 9D         [ 4] 4206 1$:	call search_lineno  
      0095A6 5D               [ 2] 4207 	tnzw x 
      0095A6 0D 01            [ 1] 4208 	jrne 2$ 
      0095A8 26 05            [ 1] 4209 	ld a,#ERR_NO_LINE 
      0095AA A6 0D CD         [ 2] 4210 	jp tb_error 
      0095AD 83               [ 4] 4211 2$:	ret 
                                   4212 
                                   4213 ;------------------------
                                   4214 ; BASIC: GOTO line# 
                                   4215 ; jump to line# 
                                   4216 ; here cstack is 2 call deep from interpreter 
                                   4217 ;------------------------
      001755                       4218 goto:
      0095AE 20 5B 01 81 06   [ 2] 4219 	btjt flags,#FRUN,0$ 
      0095B2 A6 06            [ 1] 4220 	ld a,#ERR_RUN_ONLY
      0095B2 CC 08 77         [ 2] 4221 	jp tb_error 
      0095B2 CE               [ 4] 4222 	ret 
      0095B3 00 05 1F         [ 4] 4223 0$:	call get_target_line
      001763                       4224 jp_to_target:
      0095B6 03 C6 00         [ 2] 4225 	ldw basicptr,x 
      0095B9 02 6B            [ 1] 4226 	ld a,(2,x)
      0095BB 05 C6 00         [ 1] 4227 	ld count,a 
      0095BE 04 6B 06 81      [ 1] 4228 	mov in,#3 
      0095C2 81               [ 4] 4229 	ret 
                                   4230 
                                   4231 
                                   4232 ;--------------------
                                   4233 ; BASIC: GOSUB line#
                                   4234 ; basic subroutine call
                                   4235 ; actual line# and basicptr 
                                   4236 ; are saved on cstack
                                   4237 ; here cstack is 2 call deep from interpreter 
                                   4238 ;--------------------
                           000003  4239 	RET_ADDR=3
                           000005  4240 	RET_INW=5
                           000004  4241 	VSIZE=4  
      001770                       4242 gosub:
      0095C2 1E 03 CF 00 05   [ 2] 4243 	btjt flags,#FRUN,0$ 
      0095C7 7B 05            [ 1] 4244 	ld a,#ERR_RUN_ONLY
      0095C9 C7 00 02         [ 2] 4245 	jp tb_error 
      0095CC 7B               [ 4] 4246 	ret 
      0095CD 06               [ 2] 4247 0$:	popw x 
      00177C                       4248 	_vars VSIZE  
      0095CE C7 00            [ 2]    1     sub sp,#VSIZE 
      0095D0 04               [ 2] 4249 	pushw x 
      0095D1 81 00 04         [ 2] 4250 	ldw x,basicptr
      0095D2 1F 03            [ 2] 4251 	ldw (RET_ADDR,sp),x 
      0095D2 52 07 3F         [ 4] 4252 	call get_target_line  
      0095D4 89               [ 2] 4253 	pushw x 
      0095D4 0F 05 CD         [ 2] 4254 	ldw x,in.w 
      0095D7 89 E7            [ 2] 4255 	ldw (RET_INW+2,sp),x
      0095D9 A1               [ 2] 4256 	popw x 
      0095DA 02 26            [ 2] 4257 	jra jp_to_target
                                   4258 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4259 ;------------------------
                                   4260 ; BASIC: RETURN 
                                   4261 ; exit from a subroutine 
                                   4262 ; 
                                   4263 ;------------------------
      001790                       4264 return:
      0095DC 08 CD 83 33 03   [ 2] 4265 	btjt flags,#FRUN,0$ 
      0095E1 05 CD            [ 1] 4266 	ld a,#ERR_RUN_ONLY
      0095E3 89 E7 A1         [ 2] 4267 	jp tb_error 
      00179A                       4268 0$:	
      0095E6 85 27            [ 2] 4269 	ldw x,(RET_ADDR,sp) 
      0095E8 03 CC 88         [ 2] 4270 	ldw basicptr,x
      0095EB F5 1F            [ 1] 4271 	ld a,(2,x)
      0095ED 06 0D 05         [ 1] 4272 	ld count,a  
      0095F0 26 06            [ 2] 4273 	ldw x,(RET_INW,sp)
      0095F2 CD 94 03         [ 2] 4274 	ldw in.w,x 
      0095F5 CD               [ 2] 4275 	popw x 
      0017AA                       4276 	_drop VSIZE 
      0095F6 83 20            [ 2]    1     addw sp,#VSIZE 
      0095F8 89               [ 2] 4277 	pushw x
      0095F8 A6               [ 4] 4278 	ret  
                                   4279 
                                   4280 
                                   4281 ;----------------------------------
                                   4282 ; BASIC: RUN
                                   4283 ; run BASIC program in RAM
                                   4284 ;----------------------------------- 
      0017AE                       4285 run: 
      0095F9 3A CD 83 20 CD   [ 2] 4286 	btjf flags,#FRUN,0$  
      0095FE 95               [ 1] 4287 	clr a 
      0095FF B2               [ 4] 4288 	ret
      0017B5                       4289 0$: 
      009600 72 5F 00 04 CD   [ 2] 4290 	btjf flags,#FBREAK,1$
      0017BA                       4291 	_drop 2 
      009605 8B 47            [ 2]    1     addw sp,#2 
      009607 AE 16 90         [ 4] 4292 	call rest_context
      0017BF                       4293 	_drop CTXT_SIZE 
      00960A 3B 00            [ 2]    1     addw sp,#CTXT_SIZE 
      00960C 04 4B 00 72      [ 1] 4294 	bres flags,#FBREAK 
      009610 FB 01 5C 5B      [ 1] 4295 	bset flags,#FRUN 
      009614 02 72 5F         [ 2] 4296 	jp interpreter 
      009617 00 02 CD         [ 2] 4297 1$:	ldw x,txtbgn
      00961A 8C FC A1         [ 2] 4298 	cpw x,txtend 
      00961D 84 27            [ 1] 4299 	jrmi run_it 
      00961F 06 CD 95         [ 2] 4300 	ldw x,#err_no_prog
      009622 C2 CC 88         [ 4] 4301 	call puts 
      009625 F5 16 06 90 FF   [ 1] 4302 	mov in,count
      00962A CD               [ 4] 4303 	ret 
      0017E0                       4304 run_it:	 
      00962B 95 C2 CD         [ 4] 4305     call ubound 
      0017E3                       4306 	_drop 2 ; drop return address 
      00962E 89 E7            [ 2]    1     addw sp,#2 
                                   4307 ; clear data pointer 
      009630 A1               [ 1] 4308 	clrw x 
      009631 09 27 A0         [ 2] 4309 	ldw data_ptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009634 A1 01 23 03      [ 1] 4310 	clr data_ofs 
      009638 CC 88 F5 09      [ 1] 4311 	clr data_len 
                                   4312 ; initialize BASIC pointer 
      00963B CE 00 1C         [ 2] 4313 	ldw x,txtbgn 
      00963B 5B 07 81         [ 2] 4314 	ldw basicptr,x 
      00963E E6 02            [ 1] 4315 	ld a,(2,x)
      00963E 55 00 04         [ 1] 4316 	ld count,a
      009641 00 02 81 01      [ 1] 4317 	mov in,#3	
      009644 72 10 00 23      [ 1] 4318 	bset flags,#FRUN 
      009644 52 04 0F         [ 2] 4319 	jp interpreter 
                                   4320 
                                   4321 
                                   4322 ;----------------------
                                   4323 ; BASIC: END
                                   4324 ; end running program
                                   4325 ;---------------------- 
      001807                       4326 cmd_end: 
                                   4327 ; clean stack 
      009647 01 CD 90         [ 2] 4328 	ldw x,#STACK_EMPTY
      00964A FF               [ 1] 4329 	ldw sp,x 
      00964B A1 02 24         [ 2] 4330 	jp warm_start
                                   4331 
                                   4332 
                                   4333 ;-----------------------
                                   4334 ; BASIC: TONE expr1,expr2
                                   4335 ; used TIMER2 channel 1
                                   4336 ; to produce a tone 
                                   4337 ; arguments:
                                   4338 ;    expr1   frequency 
                                   4339 ;    expr2   duration msec.
                                   4340 ;---------------------------
      00180E                       4341 tone:
      00964E 03 CC 88         [ 4] 4342 	call arg_list 
      009651 F5 A1            [ 1] 4343 	cp a,#2 
      009653 03 25            [ 1] 4344 	jreq 1$
      009655 04 85 9F         [ 2] 4345 	jp syntax_error 
      001818                       4346 1$: 
      009658 6B               [ 2] 4347 	popw x ; duration
      009659 01 85            [ 2] 4348 	popw y ; frequency 
      00181B                       4349 beep:  
      00965B 9F               [ 2] 4350 	pushw x 
      00965C 6B 02 85         [ 2] 4351 	ldw x,#TIM2_CLK_FREQ
      00965F F6               [ 2] 4352 	divw x,y 
                                   4353 ; round to nearest integer 
      009660 14 02 18 01      [ 2] 4354 	cpw y,#TIM2_CLK_FREQ/2
      009664 27 F9            [ 1] 4355 	jrmi 2$
      009666 5B               [ 2] 4356 	incw x 
      001827                       4357 2$:	 
      009667 04               [ 1] 4358 	ld a,xh 
      009668 81 53 0D         [ 1] 4359 	ld TIM2_ARRH,a 
      009669 9F               [ 1] 4360 	ld a,xl 
      009669 CD 90 FF         [ 1] 4361 	ld TIM2_ARRL,a 
                                   4362 ; 50% duty cycle 
      00966C A1               [ 1] 4363 	ccf 
      00966D 02               [ 2] 4364 	rrcw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00966E 27               [ 1] 4365 	ld a,xh 
      00966F 03 CC 88         [ 1] 4366 	ld TIM2_CCR1H,a 
      009672 F5               [ 1] 4367 	ld a,xl
      009673 C7 53 10         [ 1] 4368 	ld TIM2_CCR1L,a
      009673 85 9F 85 FA      [ 1] 4369 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009677 F7 81 53 00      [ 1] 4370 	bset TIM2_CR1,#TIM2_CR1_CEN
      009679 72 10 53 04      [ 1] 4371 	bset TIM2_EGR,#TIM2_EGR_UG
      009679 CD               [ 2] 4372 	popw x 
      00967A 90 FF A1         [ 4] 4373 	call pause02
      00967D 02 27 03 CC      [ 1] 4374 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009681 88 F5 53 00      [ 1] 4375 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009683 81               [ 4] 4376 	ret 
                                   4377 
                                   4378 ;-------------------------------
                                   4379 ; BASIC: ADCON 0|1 [,divisor]  
                                   4380 ; disable/enanble ADC 
                                   4381 ;-------------------------------
                           000003  4382 	ONOFF=3 
                           000001  4383 	DIVSOR=1
                           000004  4384 	VSIZE=4 
      001852                       4385 power_adc:
      009683 85 9F 43         [ 4] 4386 	call arg_list 
      009686 85 F4            [ 1] 4387 	cp a,#2	
      009688 F7 81            [ 1] 4388 	jreq 1$
      00968A A1 01            [ 1] 4389 	cp a,#1 
      00968A CD 90            [ 1] 4390 	jreq 0$ 
      00968C FF A1 02         [ 2] 4391 	jp syntax_error 
      00968F 27 03 CC         [ 2] 4392 0$: ldw x,#0
      009692 88               [ 2] 4393 	pushw x  ; divisor 
      009693 F5 85            [ 2] 4394 1$: ldw x,(ONOFF,sp)
      009695 9F               [ 2] 4395 	tnzw x 
      009696 85 F8            [ 1] 4396 	jreq 2$ 
      009698 F7 81            [ 2] 4397 	ldw x,(DIVSOR,sp) ; divisor 
      00969A 9F               [ 1] 4398 	ld a,xl
      00969A CD 90            [ 1] 4399 	and a,#7
      00969C FA               [ 1] 4400 	swap a 
      00969D A1 02 27         [ 1] 4401 	ld ADC_CR1,a
      0096A0 03 CC 88 F5      [ 1] 4402 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096A4 72 10 54 01      [ 1] 4403 	bset ADC_CR1,#ADC_CR1_ADON 
      00187A                       4404 	_usec_dly 7 
      0096A4 85 9F A4         [ 2]    1     ldw x,#(16*7-2)/4
      0096A7 07               [ 2]    2     decw x
      0096A8 88               [ 1]    3     nop 
      0096A9 A6 01            [ 1]    4     jrne .-4
      0096AB 0D 01            [ 2] 4405 	jra 3$
      0096AD 27 05 48 0A      [ 1] 4406 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096B1 01 20 F7 5B      [ 1] 4407 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00188B                       4408 3$:	_drop VSIZE 
      0096B5 01 85            [ 2]    1     addw sp,#VSIZE 
      0096B7 F4               [ 4] 4409 	ret
                                   4410 
                                   4411 ;-----------------------------
                                   4412 ; BASIC: ADCREAD (channel)
                                   4413 ; read adc channel {0..5}
                                   4414 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4415 ;   A 		TK_INTGR 
                                   4416 ;   X 		value 
                                   4417 ;-----------------------------
      00188E                       4418 analog_read:
      0096B8 27 02 A6         [ 4] 4419 	call func_args 
      0096BB 01 5F            [ 1] 4420 	cp a,#1 
      0096BD 97 A6            [ 1] 4421 	jreq 1$
      0096BF 84 81 75         [ 2] 4422 	jp syntax_error
      0096C1 85               [ 2] 4423 1$: popw x 
      0096C1 CD 90 FF         [ 2] 4424 	cpw x,#5 
      0096C4 A1 02            [ 2] 4425 	jrule 2$
      0096C6 27 03            [ 1] 4426 	ld a,#ERR_BAD_VALUE
      0096C8 CC 88 F5         [ 2] 4427 	jp tb_error 
      0096CB 9F               [ 1] 4428 2$: ld a,xl
      0096CB 85 9F 85         [ 1] 4429 	ld acc8,a 
      0096CE F7 81            [ 1] 4430 	ld a,#5
      0096D0 C0 00 0D         [ 1] 4431 	sub a,acc8 
      0096D0 CD 90 FA         [ 1] 4432 	ld ADC_CSR,a
      0096D3 A1 01 27 03      [ 1] 4433 	bset ADC_CR2,#ADC_CR2_ALIGN
      0096D7 CC 88 F5 85      [ 1] 4434 	bset ADC_CR1,#ADC_CR1_ADON
      0096DB F6 5F 97 A6 84   [ 2] 4435 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0096E0 81 54 04         [ 2] 4436 	ldw x,ADC_DRH
      0096E1 A6 84            [ 1] 4437 	ld a,#TK_INTGR
      0096E1 CD               [ 4] 4438 	ret 
                                   4439 
                                   4440 ;-----------------------
                                   4441 ; BASIC: DREAD(pin)
                                   4442 ; Arduino pins 
                                   4443 ; read state of a digital pin 
                                   4444 ; pin# {0..15}
                                   4445 ; output:
                                   4446 ;    A 		TK_INTGR
                                   4447 ;    X      0|1 
                                   4448 ;-------------------------
                           000001  4449 	PINNO=1
                           000001  4450 	VSIZE=1
      0018C2                       4451 digital_read:
      0018C2                       4452 	_vars VSIZE 
      0096E2 92 41            [ 2]    1     sub sp,#VSIZE 
      0096E4 A1 84 27         [ 4] 4453 	call func_args
      0096E7 03 CC            [ 1] 4454 	cp a,#1
      0096E9 88 F5            [ 1] 4455 	jreq 1$
      0096EB 4F 5D 26         [ 2] 4456 	jp syntax_error
      0096EE 05               [ 2] 4457 1$: popw x 
      0096EF 55 00 04         [ 2] 4458 	cpw x,#15 
      0096F2 00 02            [ 2] 4459 	jrule 2$
      0096F4 81 0A            [ 1] 4460 	ld a,#ERR_BAD_VALUE
      0096F5 CC 08 77         [ 2] 4461 	jp tb_error 
      0096F5 85 52 0A         [ 4] 4462 2$:	call select_pin 
      0096F8 89 A6            [ 1] 4463 	ld (PINNO,sp),a
      0096FA 85 CD            [ 1] 4464 	ld a,(GPIO_IDR,x)
      0096FC 90 ED            [ 1] 4465 	tnz (PINNO,sp)
      0096FE 1F 07            [ 1] 4466 	jreq 8$
      009700 CD               [ 1] 4467 3$: srl a 
      009701 93 24            [ 1] 4468 	dec (PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009703 72 14            [ 1] 4469 	jrne 3$ 
      009705 00 24            [ 1] 4470 8$: and a,#1 
      009707 5F               [ 1] 4471 	clrw x 
      009708 1F               [ 1] 4472 	ld xl,a 
      009709 0B 1F            [ 1] 4473 	ld a,#TK_INTGR
      0018EF                       4474 	_drop VSIZE
      00970B 09 CD            [ 2]    1     addw sp,#VSIZE 
      00970D 89               [ 4] 4475 	ret
                                   4476 
                                   4477 ;-----------------------
                                   4478 ; BASIC: DWRITE pin,0|1
                                   4479 ; Arduino pins 
                                   4480 ; write to a digital pin 
                                   4481 ; pin# {0..15}
                                   4482 ; output:
                                   4483 ;    A 		TK_INTGR
                                   4484 ;    X      0|1 
                                   4485 ;-------------------------
                           000001  4486 	PINNO=1
                           000002  4487 	PINVAL=2
                           000002  4488 	VSIZE=2
      0018F2                       4489 digital_write:
      0018F2                       4490 	_vars VSIZE 
      00970E E7 A1            [ 2]    1     sub sp,#VSIZE 
      009710 80 27 03         [ 4] 4491 	call arg_list  
      009713 CC 88            [ 1] 4492 	cp a,#2 
      009715 F5 03            [ 1] 4493 	jreq 1$
      009716 CC 08 75         [ 2] 4494 	jp syntax_error
      009716 A3               [ 2] 4495 1$: popw x 
      009717 97               [ 1] 4496 	ld a,xl 
      009718 1E 27            [ 1] 4497 	ld (PINVAL,sp),a
      00971A 03               [ 2] 4498 	popw x 
      00971B CC 88 F5         [ 2] 4499 	cpw x,#15 
      00971E 23 05            [ 2] 4500 	jrule 2$
      00971E 72 04            [ 1] 4501 	ld a,#ERR_BAD_VALUE
      009720 00 24 03         [ 2] 4502 	jp tb_error 
      009723 CC 88 F5         [ 4] 4503 2$:	call select_pin 
      009726 CD 92            [ 1] 4504 	ld (PINNO,sp),a 
      009728 41 A1            [ 1] 4505 	ld a,#1
      00972A 84 27            [ 1] 4506 	tnz (PINNO,sp)
      00972C 03 CC            [ 1] 4507 	jreq 4$
      00972E 88               [ 1] 4508 3$: sll a
      00972F F5 1F            [ 1] 4509 	dec (PINNO,sp)
      009731 05 CD            [ 1] 4510 	jrne 3$
      009733 89 E7            [ 1] 4511 4$: tnz (PINVAL,sp)
      009735 A1 00            [ 1] 4512 	jrne 5$
      009737 27               [ 1] 4513 	cpl a 
      009738 0E A1            [ 1] 4514 	and a,(GPIO_ODR,x)
      00973A 80 26            [ 2] 4515 	jra 8$
      00973C 05 A3            [ 1] 4516 5$: or a,(GPIO_ODR,x)
      00973E 97 4E            [ 1] 4517 8$: ld (GPIO_ODR,x),a 
      00192A                       4518 	_drop VSIZE 
      009740 27 0C            [ 2]    1     addw sp,#VSIZE 
      009742 81               [ 4] 4519 	ret
                                   4520 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4521 
                                   4522 ;-----------------------
                                   4523 ; BASIC: STOP
                                   4524 ; stop progam execution  
                                   4525 ; without resetting pointers 
                                   4526 ; the program is resumed
                                   4527 ; with RUN 
                                   4528 ;-------------------------
      00192D                       4529 stop:
      009742 55 00 03 00 02   [ 2] 4530 	btjt flags,#FRUN,2$
      009747 4F               [ 1] 4531 	clr a
      009747 AE               [ 4] 4532 	ret 
      001934                       4533 2$:	 
                                   4534 ; create space on cstack to save context 
      009748 00 01 1F         [ 2] 4535 	ldw x,#break_point 
      00974B 03 20 14         [ 4] 4536 	call puts 
      00974E                       4537 	_drop 2 ;drop return address 
      00974E 72 04            [ 2]    1     addw sp,#2 
      00193C                       4538 	_vars CTXT_SIZE ; context size 
      009750 00 24            [ 2]    1     sub sp,#CTXT_SIZE 
      009752 03 CC 88         [ 4] 4539 	call save_context 
      009755 F5 CD 92         [ 2] 4540 	ldw x,#tib 
      009758 41 A1 84         [ 2] 4541 	ldw basicptr,x
      00975B 27               [ 1] 4542 	clr (x)
      00975C 03 CC 88 F5      [ 1] 4543 	clr count  
      009760 1F               [ 1] 4544 	clrw x 
      009761 03 00 00         [ 2] 4545 	ldw in.w,x
      009762 72 11 00 23      [ 1] 4546 	bres flags,#FRUN 
      009762 CE 00 05 1F      [ 1] 4547 	bset flags,#FBREAK
      009766 0B CE 00         [ 2] 4548 	jp interpreter 
      009769 01 1F 09 72 15 00 24  4549 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 5C 00 21 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4550 
                                   4551 ;-----------------------
                                   4552 ; BASIC: NEW
                                   4553 ; from command line only 
                                   4554 ; free program memory
                                   4555 ; and clear variables 
                                   4556 ;------------------------
      009775                       4557 new: 
      009775 72 5D 00 21 26   [ 2] 4558 	btjf flags,#FRUN,0$ 
      00977A 03               [ 4] 4559 	ret 
      00197F                       4560 0$:	
      00977B CC 88 F5         [ 4] 4561 	call clear_basic 
      00977E 81               [ 4] 4562 	ret 
                                   4563 	 
                                   4564 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4565 ;  file system routines
                                   4566 ;  MCU flash memory from
                                   4567 ;  0x10000-0x27fff is 
                                   4568 ;  used to store BASIC 
                                   4569 ;  program files. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4570 ;  use 128 bytes sectors
                                   4571 ;  because this is the MCU 
                                   4572 ;  row size.
                                   4573 ;  file entry aligned to row
                                   4574 ;  	name  variable length
                                   4575 ;  	size  2 bytes  
                                   4576 ; 	data  variable length 
                                   4577 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4578 
                                   4579 ;---------------------------
                                   4580 ; fill pad with zeros 
                                   4581 ;--------------------------
      001983                       4582 zero_pad:
      00977E A6 85 CD         [ 2] 4583 	ldw x,#pad 
      009781 90 ED            [ 1] 4584 	ld a,#PAD_SIZE 
      009783 13               [ 1] 4585 1$:	clr (x)
      009784 07               [ 2] 4586 	incw x 
      009785 27               [ 1] 4587 	dec a 
      009786 03 CC            [ 1] 4588 	jrne 1$
      009788 88               [ 4] 4589 	ret 
                                   4590 
                                   4591 ;--------------------------
                                   4592 ; align farptr to BLOCK_SIZE 
                                   4593 ;---------------------------
      00198E                       4594 row_align:
      009789 F5 7F            [ 1] 4595 	ld a,#0x7f 
      00978A C4 00 18         [ 1] 4596 	and a,farptr+2 
      00978A FE 72            [ 1] 4597 	jreq 1$ 
      00978C FB 03 16         [ 2] 4598 	ldw x,farptr+1 
      00978F 07 90 FF         [ 2] 4599 	addw x,#BLOCK_SIZE 
      009792 A6 80            [ 1] 4600 	jrnc 0$
      009794 15 03 2A 06      [ 1] 4601 	inc farptr 
      009798 13               [ 1] 4602 0$: ld a,xl 
      009799 05 2F            [ 1] 4603 	and a,#0x80
      00979B 1B               [ 1] 4604 	ld xl,a
      00979C 20 04 17         [ 2] 4605 	ldw farptr+1,x  	
      00979E 81               [ 4] 4606 1$:	ret
                                   4607 
                                   4608 ;--------------------
                                   4609 ; input:
                                   4610 ;   X     increment 
                                   4611 ; output:
                                   4612 ;   farptr  incremented 
                                   4613 ;---------------------
      0019A9                       4614 incr_farptr:
      00979E 13 05 2C 15      [ 2] 4615 	addw x,farptr+1 
      0097A2 24 04            [ 1] 4616 	jrnc 1$
      0097A2 1E 0B CF 00      [ 1] 4617 	inc farptr 
      0097A6 05 72 01         [ 2] 4618 1$:	ldw farptr+1,x  
      0097A9 00               [ 4] 4619 	ret 
                                   4620 
                                   4621 ;------------------------------
                                   4622 ; extended flash memory used as FLASH_DRIVE 
                                   4623 ; seek end of used flash drive   
                                   4624 ; starting at 0x10000 address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4625 ; 4 consecutives 0 bytes signal free space. 
                                   4626 ; input:
                                   4627 ;	none
                                   4628 ; output:
                                   4629 ;   ffree     free_addr| 0 if memory full.
                                   4630 ;------------------------------
      0019B7                       4631 seek_fdrive:
                                   4632 ; start scan at 0x10000 address 
      0097AA 24 05            [ 1] 4633 	ld a,#1
      0097AC E6 02 C7         [ 1] 4634 	ld farptr,a 
      0097AF 00               [ 1] 4635 	clrw x 
      0097B0 04 1E 09         [ 2] 4636 	ldw farptr+1,x 
      0019C0                       4637 1$:
      0097B3 CF 00 01         [ 2] 4638 	ldw x,#3  
      0097B6 81 AF 00 16      [ 5] 4639 2$:	ldf a,([farptr],x) 
      0097B7 26 05            [ 1] 4640 	jrne 3$
      0097B7 85               [ 2] 4641 	decw x
      0097B8 5B 0A            [ 1] 4642 	jrpl 2$
      0097BA 72 5A            [ 2] 4643 	jra 4$ 
      0097BC 00 21 FC         [ 2] 4644 3$:	ldw x,#BLOCK_SIZE 
      0097BF CD 19 A9         [ 4] 4645 	call incr_farptr
      0097BF CD 92 41         [ 2] 4646 	ldw x,#0x280  
      0097C2 A1 84 27         [ 2] 4647 	cpw x,farptr
      0097C5 03 CC            [ 1] 4648 	jrmi 1$
      0019DC                       4649 4$: ; copy farptr to ffree	 
      0097C7 88 F5 CD         [ 2] 4650 	ldw x,farptr 
      0097CA 84 80 5D         [ 1] 4651 	ld a,farptr+2 
      0097CD 26 05 A6         [ 2] 4652 	ldw ffree,x 
      0097D0 05 CC 88         [ 1] 4653 	ld ffree+2,a  
      0097D3 F7               [ 4] 4654 	ret 
                                   4655 
                                   4656 ;-----------------------
                                   4657 ; return amount of free 
                                   4658 ; space on flash drive
                                   4659 ; input:
                                   4660 ;   none
                                   4661 ; output:
                                   4662 ;   acc24   free space 
                                   4663 ;-----------------------
      0019E9                       4664 disk_free:
      0097D4 81 80 00         [ 2] 4665 	ldw x,#0x8000
      0097D5 72 B0 00 1A      [ 2] 4666 	subw x,ffree+1
      0097D5 72 00            [ 1] 4667 	ld a,#2
      0097D7 00 24 06         [ 1] 4668 	sbc a,ffree 
      0097DA A6 06 CC         [ 1] 4669 	ld acc24,a 
      0097DD 88 F7 81         [ 2] 4670 	ldw acc16,x 
      0097E0 CD               [ 4] 4671 	ret 
                                   4672 
                                   4673 ;-----------------------
                                   4674 ; compare file name 
                                   4675 ; with name pointed by Y  
                                   4676 ; input:
                                   4677 ;   farptr   file name 
                                   4678 ;   Y        target name 
                                   4679 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4680 ;   farptr 	 at file_name
                                   4681 ;   X 		 farptr[x] point at size field  
                                   4682 ;   Carry    0|1 no match|match  
                                   4683 ;----------------------
      0019FC                       4684 cmp_name:
      0097E1 97               [ 1] 4685 	clrw x
      0097E2 BF AF 00 16      [ 5] 4686 1$:	ldf a,([farptr],x)
      0097E3 90 F1            [ 1] 4687 	cp a,(y)
      0097E3 CF 00            [ 1] 4688 	jrne 4$
      0097E5 05               [ 1] 4689 	tnz a 
      0097E6 E6 02            [ 1] 4690 	jreq 9$ 
      0097E8 C7               [ 2] 4691     incw x 
      0097E9 00 04            [ 2] 4692 	incw y 
      0097EB 35 03            [ 2] 4693 	jra 1$
      001A0D                       4694 4$: ;no match 
      0097ED 00               [ 1] 4695 	tnz a 
      0097EE 02 81            [ 1] 4696 	jreq 5$
      0097F0 5C               [ 2] 4697 	incw x 
      0097F0 72 00 00 24      [ 5] 4698 	ldf a,([farptr],x)
      0097F4 06 A6            [ 2] 4699 	jra 4$  
      0097F6 06               [ 2] 4700 5$:	incw x ; farptr[x] point at 'size' field 
      0097F7 CC               [ 1] 4701 	rcf 
      0097F8 88               [ 4] 4702 	ret
      001A1A                       4703 9$: ; match  
      0097F9 F7               [ 2] 4704 	incw x  ; farptr[x] at 'size' field 
      0097FA 81               [ 1] 4705 	scf 
      0097FB 85               [ 4] 4706 	ret 
                                   4707 
                                   4708 ;-----------------------
                                   4709 ; search file in 
                                   4710 ; flash memory 
                                   4711 ; input:
                                   4712 ;   Y       file name  
                                   4713 ; output:
                                   4714 ;   farptr  addr at name|0
                                   4715 ;   X       offset to size field
                                   4716 ;-----------------------
                           000001  4717 	FSIZE=1
                           000003  4718 	YSAVE=3
                           000004  4719 	VSIZE=4 
      001A1D                       4720 search_file: 
      001A1D                       4721 	_vars VSIZE
      0097FC 52 04            [ 2]    1     sub sp,#VSIZE 
      0097FE 89 CE            [ 2] 4722 	ldw (YSAVE,sp),y  
      009800 00               [ 1] 4723 	clrw x 
      009801 05 1F 03         [ 2] 4724 	ldw farptr+1,x 
      009804 CD 97 BF 89      [ 1] 4725 	mov farptr,#1
      001A29                       4726 1$:	
                                   4727 ; check if farptr is after any file 
                                   4728 ; if  0 then so.
      009808 CE 00 01 1F      [ 5] 4729 	ldf a,[farptr]
      00980C 07 85            [ 1] 4730 	jreq 6$
      00980E 20               [ 1] 4731 2$: clrw x 	
      00980F D3 03            [ 2] 4732 	ldw y,(YSAVE,sp) 
      009810 CD 19 FC         [ 4] 4733 	call cmp_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009810 72 00            [ 1] 4734 	jrc 9$
      009812 00 24 05 A6      [ 5] 4735 	ldf a,([farptr],x)
      009816 06 CC            [ 1] 4736 	ld (FSIZE,sp),a 
      009818 88               [ 2] 4737 	incw x 
      009819 F7 AF 00 16      [ 5] 4738 	ldf a,([farptr],x)
      00981A 6B 02            [ 1] 4739 	ld (FSIZE+1,sp),a 
      00981A 1E               [ 2] 4740 	incw x 
      00981B 03 CF 00         [ 2] 4741 	addw x,(FSIZE,sp) ; skip over file data
      00981E 05 E6 02         [ 4] 4742 	call incr_farptr
      009821 C7 00 04         [ 4] 4743 	call row_align  
      009824 1E 05 CF         [ 2] 4744 	ldw x,#0x280
      009827 00 01 85         [ 2] 4745 	cpw x,farptr 
      00982A 5B 04            [ 1] 4746 	jrpl 1$
      001A56                       4747 6$: ; file not found 
      00982C 89 81 00 16      [ 1] 4748 	clr farptr
      00982E 72 5F 00 17      [ 1] 4749 	clr farptr+1 
      00982E 72 01 00 24      [ 1] 4750 	clr farptr+2 
      001A62                       4751 	_drop VSIZE 
      009832 02 4F            [ 2]    1     addw sp,#VSIZE 
      009834 81               [ 1] 4752 	rcf
      009835 81               [ 4] 4753 	ret
      001A66                       4754 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A66                       4755 	_drop VSIZE 
      009835 72 09            [ 2]    1     addw sp,#VSIZE 
      009837 00               [ 1] 4756 	scf 	
      009838 24               [ 4] 4757 	ret
                                   4758 
                                   4759 ;--------------------------------
                                   4760 ; BASIC: SAVE "name" 
                                   4761 ; save text program in 
                                   4762 ; flash memory used as permanent
                                   4763 ; storage from address 0x10000-0x27fff 
                                   4764 ;--------------------------------
                           000001  4765 	BSIZE=1
                           000003  4766 	NAMEPTR=3
                           000005  4767 	XSAVE=5
                           000007  4768 	YSAVE=7
                           000008  4769 	VSIZE=8 
      001A6A                       4770 save:
      009839 12 5B 02 CD 95   [ 2] 4771 	btjf flags,#FRUN,0$ 
      00983E C2 5B            [ 1] 4772 	ld a,#ERR_CMD_ONLY 
      009840 04 72 19         [ 2] 4773 	jp tb_error
      001A74                       4774 0$:	 
      009843 00 24 72         [ 2] 4775 	ldw x,txtend 
      009846 10 00 24 CC      [ 2] 4776 	subw x,txtbgn
      00984A 89 9B            [ 1] 4777 	jrne 1$
                                   4778 ; nothing to save 
      00984C CE 00 1D         [ 2] 4779 	ldw x,#err_no_prog 
      00984F C3 00 1F         [ 4] 4780 	call puts 
      009852 2B 0C AE 88 90   [ 1] 4781 	mov in,count 
      009857 CD               [ 4] 4782 	ret  	
      001A89                       4783 1$:	
      001A89                       4784 	_vars VSIZE 
      009858 83 33            [ 2]    1     sub sp,#VSIZE 
      00985A 55 00            [ 2] 4785 	ldw (BSIZE,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00985C 04 00 02         [ 4] 4786 	call next_token	
      00985F 81 02            [ 1] 4787 	cp a,#TK_QSTR
      009860 27 03            [ 1] 4788 	jreq 2$
      009860 CD 92 F1         [ 2] 4789 	jp syntax_error
      001A97                       4790 2$: 
      009863 5B 02            [ 2] 4791 	ldw (NAMEPTR,sp),x  
      009865 5F CF 00         [ 4] 4792 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4793 ; check if enough free space 
      009868 07 72 5F         [ 4] 4794 	call strlen 
      00986B 00 09 72         [ 2] 4795 	addw x,#3 
      00986E 5F 00 0A         [ 2] 4796 	addw x,(BSIZE,sp)
      009871 CE               [ 1] 4797 	clr a 
      009872 00 1D CF 00      [ 2] 4798 	addw x,ffree+1 
      009876 05 E6 02         [ 1] 4799 	adc a,ffree 
      009879 C7 00            [ 1] 4800 	cp a,#2
      00987B 04 35            [ 1] 4801 	jrmi 21$
      00987D 03 00 02         [ 2] 4802 	cpw x,#0x8000
      009880 72 10            [ 1] 4803 	jrmi 21$
      009882 00 24            [ 1] 4804 	ld a,#ERR_NO_FSPACE  
      009884 CC 89 9B         [ 2] 4805 	jp tb_error
      009887                       4806 21$: 
                                   4807 ; check for existing file of that name 
      009887 AE 17            [ 2] 4808 	ldw y,(NAMEPTR,sp)	
      009889 FF 94 CC         [ 4] 4809 	call search_file 
      00988C 89 7C            [ 1] 4810 	jrnc 3$ 
      00988E A6 08            [ 1] 4811 	ld a,#ERR_DUPLICATE 
      00988E CD 90 FF         [ 2] 4812 	jp tb_error 
      001AC7                       4813 3$:	; initialize farptr 
      009891 A1 02 27         [ 2] 4814 	ldw x,ffree 
      009894 03 CC 88         [ 1] 4815 	ld a,ffree+2 
      009897 F5 00 16         [ 2] 4816 	ldw farptr,x 
      009898 C7 00 18         [ 1] 4817 	ld farptr+2,a 
                                   4818 ;** write file name to row buffer **	
      009898 85 90            [ 2] 4819 	ldw y,(NAMEPTR,sp)  
      00989A 85 16 E0         [ 2] 4820 	ldw x,#pad 
      00989B CD 03 B0         [ 4] 4821 	call strcpy
      00989B 89 AE F4         [ 4] 4822 	call strlen 
      00989E 24               [ 2] 4823 	incw  x
      00989F 65 90 A3         [ 2] 4824 	addw x,#pad 
                                   4825 ; ** write file size to row buffer 
      0098A2 7A 12            [ 2] 4826 	ldw y,(BSIZE,sp)
      0098A4 2B               [ 2] 4827 	ldw (x),y 
      0098A5 01 5C 02         [ 2] 4828 	addw x,#2 
                                   4829 ; ** write file data to row buffer 
      0098A7 90 CE 00 1C      [ 2] 4830 	ldw y,txtbgn 
      0098A7 9E C7            [ 1] 4831 6$:	ld a,(y)
      0098A9 53 0D            [ 2] 4832 	incw y
      0098AB 9F               [ 1] 4833 	ld (x),a 
      0098AC C7               [ 2] 4834 	incw x
      0098AD 53 0E 8C 56      [ 2] 4835 	cpw y,txtend 
      0098B1 9E C7            [ 1] 4836 	jreq 12$
      0098B3 53 0F 9F         [ 2] 4837 	cpw x,#stack_full 
      0098B6 C7 53            [ 1] 4838 	jrmi 6$
      001AFD                       4839 12$:
      0098B8 10 72            [ 2] 4840 	ldw (YSAVE,sp),y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001AFF                       4841 14$: ; zero buffer end 
      0098BA 10 53 08         [ 2] 4842 	cpw x,#stack_full
      0098BD 72 10            [ 1] 4843 	jreq 16$
      0098BF 53               [ 1] 4844 	clr (x)
      0098C0 00               [ 2] 4845 	incw x 
      0098C1 72 10            [ 2] 4846 	jra 14$
      001B08                       4847 16$:
      0098C3 53 04 85         [ 2] 4848 	ldw x,#pad 
      0098C6 CD 9E 3C         [ 4] 4849 	call write_row 
      0098C9 72 11 53         [ 2] 4850 	ldw x,#BLOCK_SIZE 
      0098CC 08 72 11         [ 4] 4851 	call incr_farptr
      0098CF 53 00 81         [ 2] 4852 	ldw x,#pad 
      0098D2 16 07            [ 2] 4853 	ldw y,(YSAVE,sp)
      0098D2 CD 90 FF A1      [ 2] 4854 	cpw y,txtend 
      0098D6 02 27            [ 1] 4855 	jrmi 6$
                                   4856 ; save farptr in ffree
      0098D8 0B A1 01         [ 2] 4857 	ldw x,farptr 
      0098DB 27 03 CC         [ 1] 4858 	ld a,farptr+2 
      0098DE 88 F5 AE         [ 2] 4859 	ldw ffree,x 
      0098E1 00 00 89         [ 1] 4860 	ld ffree+2,a
                                   4861 ; print file size 	
      0098E4 1E 03            [ 2] 4862 	ldw x,(BSIZE,sp) 
      0098E6 5D 27 1A         [ 4] 4863 	call print_int 
      001B30                       4864 	_drop VSIZE 
      0098E9 1E 01            [ 2]    1     addw sp,#VSIZE 
      0098EB 9F               [ 4] 4865 	ret 
                                   4866 
                                   4867 ;----------------------
                                   4868 ; load file in RAM memory
                                   4869 ; input:
                                   4870 ;    farptr point at file size 
                                   4871 ; output:
                                   4872 ;   y point after BASIC program in RAM.
                                   4873 ;------------------------
      001B33                       4874 load_file:
      0098EC A4 07 4E         [ 4] 4875 	call incr_farptr  
      0098EF C7 54 01         [ 4] 4876 	call clear_basic  
      0098F2 72               [ 1] 4877 	clrw x
      0098F3 16 50 CA 72      [ 5] 4878 	ldf a,([farptr],x)
      0098F7 10 54            [ 1] 4879 	ld yh,a 
      0098F9 01               [ 2] 4880 	incw x  
      0098FA AE 00 1B 5A      [ 5] 4881 	ldf a,([farptr],x)
      0098FE 9D               [ 2] 4882 	incw x 
      0098FF 26 FA            [ 1] 4883 	ld yl,a 
      009901 20 08 72 11      [ 2] 4884 	addw y,txtbgn
      009905 54 01 72 17      [ 2] 4885 	ldw txtend,y
      009909 50 CA 5B 04      [ 2] 4886 	ldw y,txtbgn
      001B54                       4887 3$:	; load BASIC text 	
      00990D 81 AF 00 16      [ 5] 4888 	ldf a,([farptr],x)
      00990E 90 F7            [ 1] 4889 	ld (y),a 
      00990E CD               [ 2] 4890 	incw x 
      00990F 90 FA            [ 2] 4891 	incw y 
      009911 A1 01 27 03      [ 2] 4892 	cpw y,txtend 
      009915 CC 88            [ 1] 4893 	jrmi 3$
      009917 F5               [ 4] 4894 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4895 
                                   4896 ;------------------------
                                   4897 ; BASIC: LOAD "file" 
                                   4898 ; load file to RAM 
                                   4899 ; for execution 
                                   4900 ;------------------------
      001B64                       4901 load:
      009918 85 A3 00 05 23   [ 2] 4902 	btjf flags,#FRUN,0$ 
      00991D 05 A6            [ 1] 4903 	jreq 0$ 
      00991F 0A CC            [ 1] 4904 	ld a,#ERR_CMD_ONLY 
      009921 88 F7 9F         [ 2] 4905 	jp tb_error 
      001B70                       4906 0$:	
      009924 C7 00 0E         [ 4] 4907 	call next_token 
      009927 A6 05            [ 1] 4908 	cp a,#TK_QSTR
      009929 C0 00            [ 1] 4909 	jreq 1$
      00992B 0E C7 54         [ 2] 4910 	jp syntax_error 
      00992E 00 72            [ 1] 4911 1$:	ldw y,x 
      009930 16 54 02         [ 4] 4912 	call search_file 
      009933 72 10            [ 1] 4913 	jrc 2$ 
      009935 54 01            [ 1] 4914 	ld a,#ERR_NOT_FILE
      009937 72 0F 54         [ 2] 4915 	jp tb_error  
      001B86                       4916 2$:
      00993A 00 FB CE         [ 4] 4917 	call load_file
                                   4918 ; print loaded size 	 
      00993D 54 04 A6         [ 2] 4919 	ldw x,txtend 
      009940 84 81 00 1C      [ 2] 4920 	subw x,txtbgn
      009942 CD 09 BC         [ 4] 4921 	call print_int 
      009942 52               [ 4] 4922 	ret 
                                   4923 
                                   4924 ;-----------------------------------
                                   4925 ; BASIC: FORGET ["file_name"] 
                                   4926 ; erase file_name and all others 
                                   4927 ; after it. 
                                   4928 ; without argument erase all files 
                                   4929 ;-----------------------------------
                           000001  4930 	NEW_FREE=1 
                           000003  4931 	VSIZE=3 
      001B94                       4932 forget:
      001B94                       4933 	_vars VSIZE 
      009943 01 CD            [ 2]    1     sub sp,#VSIZE 
      009945 90 FA A1         [ 4] 4934 	call next_token 
      009948 01 27            [ 1] 4935 	cp a,#TK_NONE 
      00994A 03 CC            [ 1] 4936 	jreq 3$ 
      00994C 88 F5            [ 1] 4937 	cp a,#TK_QSTR
      00994E 85 A3            [ 1] 4938 	jreq 1$
      009950 00 0F 23         [ 2] 4939 	jp syntax_error
      009953 05 A6            [ 1] 4940 1$: ldw y,x 
      009955 0A CC 88 F7 CD   [ 1] 4941 	mov in,count 
      00995A 9F 6F 6B         [ 4] 4942 	call search_file
      00995D 01 E6            [ 1] 4943 	jrc 2$
      00995F 01 0D            [ 1] 4944 	ld a,#ERR_NOT_FILE 
      009961 01 27 05         [ 2] 4945 	jp tb_error 
      001BB5                       4946 2$: 
      009964 44 0A 01         [ 2] 4947 	ldw x,farptr
      009967 26 FB A4         [ 1] 4948 	ld a,farptr+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      00996A 01 5F            [ 2] 4949 	jra 4$ 
      001BBD                       4950 3$: ; forget all files 
      00996C 97 A6 84         [ 2] 4951 	ldw x,#0x100
      00996F 5B               [ 1] 4952 	clr a 
      009970 01 81 16         [ 2] 4953 	ldw farptr,x 
      009972 C7 00 18         [ 1] 4954 	ld farptr+2,a 
      001BC7                       4955 4$:	; save new free address 
      009972 52 02            [ 2] 4956 	ldw (NEW_FREE,sp),x
      009974 CD 90            [ 1] 4957 	ld (NEW_FREE+2,sp),a 
      009976 FF A1 02         [ 4] 4958 	call move_erase_to_ram
      009979 27 03 CC         [ 4] 4959 5$: call block_erase 
      00997C 88 F5 85         [ 2] 4960 	ldw x,#BLOCK_SIZE 
      00997F 9F 6B 02         [ 4] 4961 	call incr_farptr 
      009982 85 A3 00         [ 4] 4962 	call row_align 
                                   4963 ; check if all blocks erased
      009985 0F 23 05         [ 1] 4964 	ld a,farptr+2  
      009988 A6 0A CC         [ 1] 4965 	sub a,ffree+2
      00998B 88 F7 CD         [ 1] 4966 	ld a,farptr+1 
      00998E 9F 6F 6B         [ 1] 4967 	sbc a,ffree+1 
      009991 01 A6 01         [ 1] 4968 	ld a,farptr 
      009994 0D 01 27         [ 1] 4969 	sbc a,ffree 
      009997 05 48            [ 1] 4970 	jrmi 5$ 
      009999 0A 01            [ 1] 4971 	ld a,(NEW_FREE+2,sp)
      00999B 26 FB            [ 2] 4972 	ldw x,(NEW_FREE,sp)
      00999D 0D 02 26         [ 1] 4973 	ld ffree+2,a 
      0099A0 05 43 E4         [ 2] 4974 	ldw ffree,x 
      001BF8                       4975 	_drop VSIZE 
      0099A3 00 20            [ 2]    1     addw sp,#VSIZE 
      0099A5 02               [ 4] 4976 	ret 
                                   4977 
                                   4978 ;----------------------
                                   4979 ; BASIC: DIR 
                                   4980 ; list saved files 
                                   4981 ;----------------------
                           000001  4982 	COUNT=1 ; files counter 
                           000002  4983 	VSIZE=2 
      001BFB                       4984 directory:
      001BFB                       4985 	_vars VSIZE 
      0099A6 EA 00            [ 2]    1     sub sp,#VSIZE 
      0099A8 E7               [ 1] 4986 	clrw x 
      0099A9 00 5B            [ 2] 4987 	ldw (COUNT,sp),x 
      0099AB 02 81 17         [ 2] 4988 	ldw farptr+1,x 
      0099AD 35 01 00 16      [ 1] 4989 	mov farptr,#1 
      001C07                       4990 dir_loop:
      0099AD 72               [ 1] 4991 	clrw x 
      0099AE 00 00 24 02      [ 5] 4992 	ldf a,([farptr],x)
      0099B2 4F 81            [ 1] 4993 	jreq 8$ 
      0099B4                       4994 1$: ;name loop 	
      0099B4 AE 99 DB CD      [ 5] 4995 	ldf a,([farptr],x)
      0099B8 83 33            [ 1] 4996 	jreq 2$ 
      0099BA 5B 02 52         [ 4] 4997 	call putc 
      0099BD 04               [ 2] 4998 	incw x 
      0099BE CD 95            [ 2] 4999 	jra 1$
      0099C0 B2               [ 2] 5000 2$: incw x ; skip ending 0. 
      0099C1 AE 16            [ 1] 5001 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099C3 90 CF 00         [ 4] 5002 	call putc 
                                   5003 ; get file size 	
      0099C6 05 7F 72 5F      [ 5] 5004 	ldf a,([farptr],x)
      0099CA 00 04            [ 1] 5005 	ld yh,a 
      0099CC 5F               [ 2] 5006 	incw x 
      0099CD CF 00 01 72      [ 5] 5007 	ldf a,([farptr],x)
      0099D1 11               [ 2] 5008 	incw x 
      0099D2 00 24            [ 1] 5009 	ld yl,a 
      0099D4 72 18            [ 2] 5010 	pushw y 
      0099D6 00 24 CC         [ 2] 5011 	addw x,(1,sp)
                                   5012 ; skip to next file 
      0099D9 89 9B 0A         [ 4] 5013 	call incr_farptr
      0099DC 62 72 65         [ 4] 5014 	call row_align
                                   5015 ; print file size 
      0099DF 61               [ 2] 5016 	popw x ; file size 
      0099E0 6B 20 70         [ 4] 5017 	call print_int 
      0099E3 6F 69            [ 1] 5018 	ld a,#CR 
      0099E5 6E 74 2C         [ 4] 5019 	call putc
      0099E8 20 52            [ 2] 5020 	ldw x,(COUNT,sp)
      0099EA 55               [ 2] 5021 	incw x
      0099EB 4E 20            [ 2] 5022 	ldw (COUNT,sp),x  
      0099ED 74 6F            [ 2] 5023 	jra dir_loop
      001C49                       5024 8$: ; print number of files 
      0099EF 20 72            [ 2] 5025 	ldw x,(COUNT,sp)
      0099F1 65 73 75         [ 4] 5026 	call print_int 
      0099F4 6D 65 2E         [ 2] 5027 	ldw x,#file_count 
      0099F7 0A 00 B3         [ 4] 5028 	call puts  
                                   5029 ; print drive free space 	
      0099F9 CD 19 E9         [ 4] 5030 	call disk_free
      0099F9 72               [ 1] 5031 	clrw x  
      0099FA 01 00 24 01      [ 1] 5032 	mov base,#10 
      0099FE 81 09 CC         [ 4] 5033 	call prti24 
      0099FF AE 1C 70         [ 2] 5034 	ldw x,#drive_free
      0099FF CD 87 61         [ 4] 5035 	call puts 
      001C65                       5036 	_drop VSIZE 
      009A02 81 02            [ 2]    1     addw sp,#VSIZE 
      009A03 81               [ 4] 5037 	ret
      009A03 AE 16 E0 A6 80 7F 5C  5038 file_count: .asciz " files\n"
             4A
      009A0B 26 FB 81 74 65 73 20  5039 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5040 
                                   5041 ;---------------------
                                   5042 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5043 ; write 1 or more byte to FLASH or EEPROM
                                   5044 ; starting at address  
                                   5045 ; input:
                                   5046 ;   expr1  	is address 
                                   5047 ;   expr2,...,exprn   are bytes to write
                                   5048 ; output:
                                   5049 ;   none 
                                   5050 ;---------------------
                           000001  5051 	ADDR=1
                           000002  5052 	VSIZ=2 
      009A0E                       5053 write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001C7D                       5054 	_vars VSIZE 
      009A0E A6 7F            [ 2]    1     sub sp,#VSIZE 
      009A10 C4 00 19 27      [ 1] 5055 	clr farptr ; expect 16 bits address 
      009A14 13 CE 00         [ 4] 5056 	call expression
      009A17 18 1C            [ 1] 5057 	cp a,#TK_INTGR 
      009A19 00 80            [ 1] 5058 	jreq 0$
      009A1B 24 04 72         [ 2] 5059 	jp syntax_error
      009A1E 5C 00            [ 2] 5060 0$: ldw (ADDR,sp),x 
      009A20 17 9F A4         [ 4] 5061 	call next_token 
      009A23 80 97            [ 1] 5062 	cp a,#TK_COMMA 
      009A25 CF 00            [ 1] 5063 	jreq 1$ 
      009A27 18 81            [ 2] 5064 	jra 9$ 
      009A29 CD 11 78         [ 4] 5065 1$:	call expression
      009A29 72 BB            [ 1] 5066 	cp a,#TK_INTGR
      009A2B 00 18            [ 1] 5067 	jreq 2$
      009A2D 24 04 72         [ 2] 5068 	jp syntax_error
      009A30 5C               [ 1] 5069 2$:	ld a,xl 
      009A31 00 17            [ 2] 5070 	ldw x,(ADDR,sp) 
      009A33 CF 00 18         [ 2] 5071 	ldw farptr+1,x 
      009A36 81               [ 1] 5072 	clrw x 
      009A37 CD 01 CD         [ 4] 5073 	call write_byte
      009A37 A6 01            [ 2] 5074 	ldw x,(ADDR,sp)
      009A39 C7               [ 2] 5075 	incw x 
      009A3A 00 17            [ 2] 5076 	jra 0$ 
      001CB1                       5077 9$:
      001CB1                       5078 	_drop VSIZE
      009A3C 5F CF            [ 2]    1     addw sp,#VSIZE 
      009A3E 00               [ 4] 5079 	ret 
                                   5080 
                                   5081 
                                   5082 ;---------------------
                                   5083 ;BASIC: CHAR(expr)
                                   5084 ; évaluate expression 
                                   5085 ; and take the 7 least 
                                   5086 ; bits as ASCII character
                                   5087 ;---------------------
      001CB4                       5088 char:
      009A3F 18 10 7A         [ 4] 5089 	call func_args 
      009A40 A1 01            [ 1] 5090 	cp a,#1
      009A40 AE 00            [ 1] 5091 	jreq 1$
      009A42 03 92 AF         [ 2] 5092 	jp syntax_error
      009A45 00               [ 2] 5093 1$:	popw x 
      009A46 17               [ 1] 5094 	ld a,xl 
      009A47 26 05            [ 1] 5095 	and a,#0x7f 
      009A49 5A               [ 1] 5096 	ld xl,a
      009A4A 2A F7            [ 1] 5097 	ld a,#TK_CHAR
      009A4C 20               [ 4] 5098 	ret
                                   5099 
                                   5100 ;---------------------
                                   5101 ; BASIC: ASC(string|char)
                                   5102 ; extract first character 
                                   5103 ; of string argument 
                                   5104 ; return it as TK_INTGR 
                                   5105 ;---------------------
      001CC6                       5106 ascii:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A4D 0E AE            [ 1] 5107 	ld a,#TK_LPAREN
      009A4F 00 80 CD         [ 4] 5108 	call expect 
      009A52 9A 29 AE         [ 4] 5109 	call next_token 
      009A55 02 80            [ 1] 5110 	cp a,#TK_QSTR 
      009A57 C3 00            [ 1] 5111 	jreq 1$
      009A59 17 2B            [ 1] 5112 	cp a,#TK_CHAR 
      009A5B E4 06            [ 1] 5113 	jreq 2$ 
      009A5C CC 08 75         [ 2] 5114 	jp syntax_error
      001CD9                       5115 1$: 
      009A5C CE               [ 1] 5116 	ld a,(x) 
      009A5D 00               [ 1] 5117 	clrw x
      009A5E 17               [ 1] 5118 	ld xl,a 
      001CDC                       5119 2$: 
      009A5F C6               [ 2] 5120 	pushw x 
      009A60 00 19            [ 1] 5121 	ld a,#TK_RPAREN 
      009A62 CF 00 1A         [ 4] 5122 	call expect
      009A65 C7               [ 2] 5123 	popw x 
      009A66 00 1C            [ 1] 5124 	ld a,#TK_INTGR 
      009A68 81               [ 4] 5125 	ret 
                                   5126 
                                   5127 ;---------------------
                                   5128 ;BASIC: KEY
                                   5129 ; wait for a character 
                                   5130 ; received from STDIN 
                                   5131 ; input:
                                   5132 ;	none 
                                   5133 ; output:
                                   5134 ;	X 		ASCII character 
                                   5135 ;---------------------
      009A69                       5136 key:
      009A69 AE 80 00         [ 4] 5137 	call getc 
      009A6C 72               [ 1] 5138 	clrw x 
      009A6D B0               [ 1] 5139 	ld xl,a 
      009A6E 00 1B            [ 1] 5140 	ld a,#TK_INTGR
      009A70 A6               [ 4] 5141 	ret
                                   5142 
                                   5143 ;----------------------
                                   5144 ; BASIC: QKEY
                                   5145 ; Return true if there 
                                   5146 ; is a character in 
                                   5147 ; waiting in STDIN 
                                   5148 ; input:
                                   5149 ;  none 
                                   5150 ; output:
                                   5151 ;   X 		0|-1 
                                   5152 ;-----------------------
      001CEE                       5153 qkey:: 
      009A71 02               [ 1] 5154 	clrw x 
      009A72 C2 00 1A C7      [ 1] 5155 	tnz rx_char
      009A76 00 0C            [ 1] 5156 	jreq 9$ 
      009A78 CF               [ 2] 5157 	cplw x 
      009A79 00 0D            [ 1] 5158 9$: ld a,#TK_INTGR
      009A7B 81               [ 4] 5159 	ret 
                                   5160 
                                   5161 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5162 ; BASIC: GPIO(expr,reg)
                                   5163 ; return gpio address 
                                   5164 ; expr {0..8}
                                   5165 ; input:
                                   5166 ;   none 
                                   5167 ; output:
                                   5168 ;   X 		gpio register address
                                   5169 ;----------------------------
                           000003  5170 	PORT=3
                           000001  5171 	REG=1 
                           000004  5172 	VSIZE=4 
      009A7C                       5173 gpio:
      009A7C 5F 92 AF         [ 4] 5174 	call func_args 
      009A7F 00 17            [ 1] 5175 	cp a,#2
      009A81 90 F1            [ 1] 5176 	jreq 1$
      009A83 26 08 4D         [ 2] 5177 	jp syntax_error  
      001D03                       5178 1$:	
      009A86 27 12            [ 2] 5179 	ldw x,(PORT,sp)
      009A88 5C 90            [ 1] 5180 	jrmi bad_port
      009A8A 5C 20 F0         [ 2] 5181 	cpw x,#9
      009A8D 2A 12            [ 1] 5182 	jrpl bad_port
      009A8D 4D 27            [ 1] 5183 	ld a,#5
      009A8F 07               [ 4] 5184 	mul x,a
      009A90 5C 92 AF         [ 2] 5185 	addw x,#GPIO_BASE 
      009A93 00 17            [ 2] 5186 	ldw (PORT,sp),x  
      009A95 20 F6            [ 2] 5187 	ldw x,(REG,sp) 
      009A97 5C 98 81         [ 2] 5188 	addw x,(PORT,sp)
      009A9A A6 84            [ 1] 5189 	ld a,#TK_INTGR
      001D1B                       5190 	_drop VSIZE 
      009A9A 5C 99            [ 2]    1     addw sp,#VSIZE 
      009A9C 81               [ 4] 5191 	ret
      009A9D                       5192 bad_port:
      009A9D 52 04            [ 1] 5193 	ld a,#ERR_BAD_VALUE
      009A9F 17 03 5F         [ 2] 5194 	jp tb_error
                                   5195 
                                   5196 
                                   5197 ;-------------------------
                                   5198 ; BASIC: UFLASH 
                                   5199 ; return user flash address
                                   5200 ; input:
                                   5201 ;  none 
                                   5202 ; output:
                                   5203 ;	A		TK_INTGR
                                   5204 ;   X 		user address 
                                   5205 ;---------------------------
      001D23                       5206 uflash:
      009AA2 CF 00 18         [ 2] 5207 	ldw x,#user_space 
      009AA5 35 01            [ 1] 5208 	ld a,#TK_INTGR 
      009AA7 00               [ 4] 5209 	ret 
                                   5210 
                                   5211 
                                   5212 ;---------------------
                                   5213 ; BASIC: USR(addr[,arg])
                                   5214 ; execute a function written 
                                   5215 ; in binary code.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5216 ; binary fonction should 
                                   5217 ; return token attribute in A 
                                   5218 ; and value in X. 
                                   5219 ; input:
                                   5220 ;   addr	routine address 
                                   5221 ;   arg 	is an optional argument 
                                   5222 ; output:
                                   5223 ;   A 		token attribute 
                                   5224 ;   X       returned value 
                                   5225 ;---------------------
      001D29                       5226 usr:
      009AA8 17 89            [ 2] 5227 	pushw y 	
      009AA9 CD 10 7A         [ 4] 5228 	call func_args 
      009AA9 92 BC            [ 1] 5229 	cp a,#1 
      009AAB 00 17            [ 1] 5230 	jreq 2$
      009AAD 27 27            [ 1] 5231 	cp a,#2
      009AAF 5F 16            [ 1] 5232 	jreq 2$  
      009AB1 03 CD 9A         [ 2] 5233 	jp syntax_error 
      009AB4 7C 25            [ 2] 5234 2$: popw y  ; arg|addr 
      009AB6 2F 92            [ 1] 5235 	cp a,#1
      009AB8 AF 00            [ 1] 5236 	jreq 3$
      009ABA 17               [ 2] 5237 	popw x ; addr
      009ABB 6B               [ 1] 5238 	exgw x,y 
      009ABC 01 5C            [ 4] 5239 3$: call (y)
      009ABE 92 AF            [ 2] 5240 	popw y 
      009AC0 00               [ 4] 5241 	ret 
                                   5242 
                                   5243 ;------------------------------
                                   5244 ; BASIC: BYE 
                                   5245 ; halt mcu in its lowest power mode 
                                   5246 ; wait for reset or external interrupt
                                   5247 ; do a cold start on wakeup.
                                   5248 ;------------------------------
      001D46                       5249 bye:
      009AC1 17 6B 02 5C 72   [ 2] 5250 	btjf UART1_SR,#UART_SR_TC,.
      009AC6 FB               [10] 5251 	halt
      009AC7 01 CD 9A         [ 2] 5252 	jp cold_start  
                                   5253 
                                   5254 ;----------------------------------
                                   5255 ; BASIC: AUTORUN ["file_name"] 
                                   5256 ; record in eeprom at adrress AUTORUN_NAME
                                   5257 ; the name of file to load and execute
                                   5258 ; at startup. 
                                   5259 ; empty string delete autorun name 
                                   5260 ; no argument display autorun name  
                                   5261 ; input:
                                   5262 ;   file_name   file to execute 
                                   5263 ; output:
                                   5264 ;   none
                                   5265 ;-----------------------------------
      001D4F                       5266 autorun: 
      009ACA 29 CD 9A 0E AE   [ 2] 5267 	btjf flags,#FRUN,0$ 
      009ACF 02 80            [ 1] 5268 	jreq 0$ 
      009AD1 C3 00            [ 1] 5269 	ld a,#ERR_CMD_ONLY 
      009AD3 17 2A D3         [ 2] 5270 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AD6                       5271 0$:	
      009AD6 72 5F 00         [ 4] 5272 	call next_token
      009AD9 17 72            [ 1] 5273 	jrne 1$
      009ADB 5F 00 18         [ 2] 5274 	ldw x,#AUTORUN_NAME
      009ADE 72 5F 00         [ 4] 5275 	call puts 
      009AE1 19               [ 1] 5276 	clr a 
      009AE2 5B               [ 4] 5277 	ret 
      001D68                       5278 1$:
      009AE3 04 98            [ 1] 5279 	cp a,#TK_QSTR
      009AE5 81 03            [ 1] 5280 	jreq 2$
      009AE6 CC 08 75         [ 2] 5281 	jp syntax_error 
      001D6F                       5282 2$:	
      009AE6 5B               [ 1] 5283 	tnz (x) 
      009AE7 04 99            [ 1] 5284 	jrne 3$
                                   5285 ; empty string, delete autorun 	
      009AE9 81 06 94         [ 4] 5286 	call cancel_autorun
      009AEA 55 00 03 00 01   [ 1] 5287 	mov in,count 
      009AEA 72               [ 4] 5288 	ret 
      009AEB 01               [ 2] 5289 3$:	pushw x 
      009AEC 00 24            [ 1] 5290 	ldw y,x  
      009AEE 05 A6 07         [ 4] 5291 	call search_file 
      009AF1 CC 88            [ 1] 5292 	jrc 4$ 
      009AF3 F7 09            [ 1] 5293 	ld a,#ERR_NOT_FILE
      009AF4 CC 08 77         [ 2] 5294 	jp tb_error  
      001D88                       5295 4$: 
      009AF4 CE 00 1F 72 B0   [ 1] 5296 	mov in,count 
      009AF9 00 1D 26 0C      [ 1] 5297 	clr farptr 
      009AFD AE 88 90         [ 2] 5298 	ldw x,#AUTORUN_NAME
      009B00 CD 83 33         [ 2] 5299 	ldw farptr+1,x 
      009B03 55 00            [ 2] 5300 	ldw x,(1,sp)  
      009B05 04 00 02         [ 4] 5301 	call strlen  ; return length in X 
      009B08 81               [ 2] 5302 	incw x 
      009B09 90 85            [ 2] 5303 	popw y 
      009B09 52               [ 2] 5304 	pushw x 
      009B0A 08               [ 1] 5305 	clrw x 
      009B0B 1F 01 CD         [ 4] 5306 	call write_block 
      001DA4                       5307 	_drop 2 
      009B0E 89 E7            [ 2]    1     addw sp,#2 
      009B10 A1               [ 4] 5308 	ret 
                                   5309 
                                   5310 ;----------------------------------
                                   5311 ; BASIC: SLEEP 
                                   5312 ; halt mcu until reset or external
                                   5313 ; interrupt.
                                   5314 ; Resume progam after SLEEP command
                                   5315 ;----------------------------------
      001DA7                       5316 sleep:
      009B11 02 27 03 CC 88   [ 2] 5317 	btjf UART1_SR,#UART_SR_TC,.
      009B16 F5 16 00 23      [ 1] 5318 	bset flags,#FSLEEP
      009B17 8E               [10] 5319 	halt 
      009B17 1F               [ 4] 5320 	ret 
                                   5321 
                                   5322 ;-------------------------------
                                   5323 ; BASIC: PAUSE expr 
                                   5324 ; suspend execution for n msec.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5325 ; input:
                                   5326 ;	none
                                   5327 ; output:
                                   5328 ;	none 
                                   5329 ;------------------------------
      001DB2                       5330 pause:
      009B18 03 CD 81         [ 4] 5331 	call expression
      009B1B DC CD            [ 1] 5332 	cp a,#TK_INTGR
      009B1D 84 12            [ 1] 5333 	jreq pause02 
      009B1F 1C 00 03         [ 2] 5334 	jp syntax_error
      001DBC                       5335 pause02: 
      009B22 72               [ 2] 5336 1$: tnzw x 
      009B23 FB 01            [ 1] 5337 	jreq 2$
      009B25 4F               [10] 5338 	wfi 
      009B26 72               [ 2] 5339 	decw x 
      009B27 BB 00            [ 1] 5340 	jrne 1$
      009B29 1B               [ 1] 5341 2$:	clr a 
      009B2A C9               [ 4] 5342 	ret 
                                   5343 
                                   5344 ;------------------------------
                                   5345 ; BASIC: AWU expr
                                   5346 ; halt mcu for 'expr' milliseconds
                                   5347 ; use Auto wakeup peripheral
                                   5348 ; all oscillators stopped except LSI
                                   5349 ; range: 1ms - 511ms
                                   5350 ; input:
                                   5351 ;  none
                                   5352 ; output:
                                   5353 ;  none:
                                   5354 ;------------------------------
      001DC5                       5355 awu:
      009B2B 00 1A A1         [ 4] 5356   call expression
      009B2E 02 2B            [ 1] 5357   cp a,#TK_INTGR
      009B30 0A A3            [ 1] 5358   jreq awu02
      009B32 80 00 2B         [ 2] 5359   jp syntax_error
      001DCF                       5360 awu02:
      009B35 05 A6 0E         [ 2] 5361   cpw x,#5120
      009B38 CC 88            [ 1] 5362   jrmi 1$ 
      009B3A F7 0F 50 F2      [ 1] 5363   mov AWU_TBR,#15 
      009B3B A6 1E            [ 1] 5364   ld a,#30
      009B3B 16               [ 2] 5365   div x,a
      009B3C 03 CD            [ 1] 5366   ld a,#16
      009B3E 9A               [ 2] 5367   div x,a 
      009B3F 9D 24            [ 2] 5368   jra 4$
      001DE0                       5369 1$: 
      009B41 05 A6 08         [ 2] 5370   cpw x,#2048
      009B44 CC 88            [ 1] 5371   jrmi 2$ 
      009B46 F7 0E 50 F2      [ 1] 5372   mov AWU_TBR,#14
      009B47 A6 50            [ 1] 5373   ld a,#80
      009B47 CE               [ 2] 5374   div x,a 
      009B48 00 1A            [ 2] 5375   jra 4$   
      001DEE                       5376 2$:
      009B4A C6 00 1C CF      [ 1] 5377   mov AWU_TBR,#7
      001DF2                       5378 3$:  
                                   5379 ; while X > 64  divide by 2 and increment AWU_TBR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B4E 00 17 C7         [ 2] 5380   cpw x,#64 
      009B51 00 19            [ 2] 5381   jrule 4$ 
      009B53 16 03 AE 16      [ 1] 5382   inc AWU_TBR 
      009B57 E0               [ 2] 5383   srlw x 
      009B58 CD 84            [ 2] 5384   jra 3$ 
      001DFE                       5385 4$:
      009B5A 30               [ 1] 5386   ld a, xl
      009B5B CD               [ 1] 5387   dec a 
      009B5C 84 12            [ 1] 5388   jreq 5$
      009B5E 5C               [ 1] 5389   dec a 	
      001E03                       5390 5$: 
      009B5F 1C 16            [ 1] 5391   and a,#0x3e 
      009B61 E0 16 01         [ 1] 5392   ld AWU_APR,a 
      009B64 FF 1C 00 02      [ 1] 5393   bset AWU_CSR,#AWU_CSR_AWUEN
      009B68 90               [10] 5394   halt 
                                   5395 
      009B69 CE               [ 4] 5396   ret 
                                   5397 
                                   5398 ;------------------------------
                                   5399 ; BASIC: TICKS
                                   5400 ; return msec ticks counter value 
                                   5401 ; input:
                                   5402 ; 	none 
                                   5403 ; output:
                                   5404 ;	X 		TK_INTGR
                                   5405 ;-------------------------------
      001E0E                       5406 get_ticks:
      009B6A 00 1D 90         [ 2] 5407 	ldw x,ticks 
      009B6D F6 90            [ 1] 5408 	ld a,#TK_INTGR
      009B6F 5C               [ 4] 5409 	ret 
                                   5410 
                                   5411 
                                   5412 
                                   5413 ;------------------------------
                                   5414 ; BASIC: ABS(expr)
                                   5415 ; return absolute value of expr.
                                   5416 ; input:
                                   5417 ;   none
                                   5418 ; output:
                                   5419 ;   X     	positive integer
                                   5420 ;-------------------------------
      001E14                       5421 abs:
      009B70 F7 5C 90         [ 4] 5422 	call func_args 
      009B73 C3 00            [ 1] 5423 	cp a,#1 
      009B75 1F 27            [ 1] 5424 	jreq 0$ 
      009B77 05 A3 17         [ 2] 5425 	jp syntax_error
      001E1E                       5426 0$:  
      009B7A 60               [ 2] 5427     popw x   
      009B7B 2B               [ 1] 5428 	ld a,xh 
      009B7C EF 80            [ 1] 5429 	bcp a,#0x80 
      009B7D 27 01            [ 1] 5430 	jreq 2$ 
      009B7D 17               [ 2] 5431 	negw x 
      009B7E 07 84            [ 1] 5432 2$: ld a,#TK_INTGR 
      009B7F 81               [ 4] 5433 	ret 
                                   5434 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5435 ;------------------------------
                                   5436 ; BASIC: AND(expr1,expr2)
                                   5437 ; Apply bit AND relation between
                                   5438 ; the 2 arguments, i.e expr1 & expr2 
                                   5439 ; output:
                                   5440 ; 	A 		TK_INTGR
                                   5441 ;   X 		result 
                                   5442 ;------------------------------
      001E28                       5443 bit_and:
      009B7F A3 17 60         [ 4] 5444 	call func_args 
      009B82 27 04            [ 1] 5445 	cp a,#2
      009B84 7F 5C            [ 1] 5446 	jreq 1$
      009B86 20 F7 75         [ 2] 5447 	jp syntax_error 
      009B88 85               [ 2] 5448 1$:	popw x 
      009B88 AE               [ 1] 5449 	ld a,xh 
      009B89 16 E0            [ 1] 5450 	and a,(1,sp)
      009B8B CD               [ 1] 5451 	ld xh,a 
      009B8C 81               [ 1] 5452 	ld a,xl
      009B8D F0 AE            [ 1] 5453 	and a,(2,sp)
      009B8F 00               [ 1] 5454 	ld xl,a 
      001E3B                       5455 	_drop 2 
      009B90 80 CD            [ 2]    1     addw sp,#2 
      009B92 9A 29            [ 1] 5456 	ld a,#TK_INTGR
      009B94 AE               [ 4] 5457 	ret
                                   5458 
                                   5459 ;------------------------------
                                   5460 ; BASIC: OR(expr1,expr2)
                                   5461 ; Apply bit OR relation between
                                   5462 ; the 2 arguments, i.e expr1 | expr2 
                                   5463 ; output:
                                   5464 ; 	A 		TK_INTGR
                                   5465 ;   X 		result 
                                   5466 ;------------------------------
      001E40                       5467 bit_or:
      009B95 16 E0 16         [ 4] 5468 	call func_args 
      009B98 07 90            [ 1] 5469 	cp a,#2
      009B9A C3 00            [ 1] 5470 	jreq 1$
      009B9C 1F 2B CD         [ 2] 5471 	jp syntax_error 
      001E4A                       5472 1$: 
      009B9F CE               [ 2] 5473 	popw x 
      009BA0 00               [ 1] 5474 	ld a,xh 
      009BA1 17 C6            [ 1] 5475 	or a,(1,sp)
      009BA3 00               [ 1] 5476 	ld xh,a 
      009BA4 19               [ 1] 5477 	ld a,xl 
      009BA5 CF 00            [ 1] 5478 	or a,(2,sp)
      009BA7 1A               [ 1] 5479 	ld xl,a 
      001E53                       5480 	_drop 2 
      009BA8 C7 00            [ 2]    1     addw sp,#2 
      009BAA 1C 1E            [ 1] 5481 	ld a,#TK_INTGR 
      009BAC 01               [ 4] 5482 	ret
                                   5483 
                                   5484 ;------------------------------
                                   5485 ; BASIC: XOR(expr1,expr2)
                                   5486 ; Apply bit XOR relation between
                                   5487 ; the 2 arguments, i.e expr1 ^ expr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5488 ; output:
                                   5489 ; 	A 		TK_INTGR
                                   5490 ;   X 		result 
                                   5491 ;------------------------------
      001E58                       5492 bit_xor:
      009BAD CD 8A 3C         [ 4] 5493 	call func_args 
      009BB0 5B 08            [ 1] 5494 	cp a,#2
      009BB2 81 03            [ 1] 5495 	jreq 1$
      009BB3 CC 08 75         [ 2] 5496 	jp syntax_error 
      001E62                       5497 1$: 
      009BB3 CD               [ 2] 5498 	popw x 
      009BB4 9A               [ 1] 5499 	ld a,xh 
      009BB5 29 CD            [ 1] 5500 	xor a,(1,sp)
      009BB7 87               [ 1] 5501 	ld xh,a 
      009BB8 61               [ 1] 5502 	ld a,xl 
      009BB9 5F 92            [ 1] 5503 	xor a,(2,sp)
      009BBB AF               [ 1] 5504 	ld xl,a 
      001E6B                       5505 	_drop 2 
      009BBC 00 17            [ 2]    1     addw sp,#2 
      009BBE 90 95            [ 1] 5506 	ld a,#TK_INTGR 
      009BC0 5C               [ 4] 5507 	ret 
                                   5508 
                                   5509 ;------------------------------
                                   5510 ; BASIC: LSHIFT(expr1,expr2)
                                   5511 ; logical shift left expr1 by 
                                   5512 ; expr2 bits 
                                   5513 ; output:
                                   5514 ; 	A 		TK_INTGR
                                   5515 ;   X 		result 
                                   5516 ;------------------------------
      001E70                       5517 lshift:
      009BC1 92 AF 00         [ 4] 5518 	call func_args
      009BC4 17 5C            [ 1] 5519 	cp a,#2 
      009BC6 90 97            [ 1] 5520 	jreq 1$
      009BC8 72 B9 00         [ 2] 5521 	jp syntax_error
      009BCB 1D 90            [ 2] 5522 1$: popw y   
      009BCD CF               [ 2] 5523 	popw x 
      009BCE 00 1F            [ 2] 5524 	tnzw y 
      009BD0 90 CE            [ 1] 5525 	jreq 4$
      009BD2 00               [ 2] 5526 2$:	sllw x 
      009BD3 1D 5A            [ 2] 5527 	decw y 
      009BD4 26 FB            [ 1] 5528 	jrne 2$
      001E86                       5529 4$:  
      009BD4 92 AF            [ 1] 5530 	ld a,#TK_INTGR
      009BD6 00               [ 4] 5531 	ret
                                   5532 
                                   5533 ;------------------------------
                                   5534 ; BASIC: RSHIFT(expr1,expr2)
                                   5535 ; logical shift right expr1 by 
                                   5536 ; expr2 bits.
                                   5537 ; output:
                                   5538 ; 	A 		TK_INTGR
                                   5539 ;   X 		result 
                                   5540 ;------------------------------
      001E89                       5541 rshift:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BD7 17 90 F7         [ 4] 5542 	call func_args
      009BDA 5C 90            [ 1] 5543 	cp a,#2 
      009BDC 5C 90            [ 1] 5544 	jreq 1$
      009BDE C3 00 1F         [ 2] 5545 	jp syntax_error
      009BE1 2B F1            [ 2] 5546 1$: popw y  
      009BE3 81               [ 2] 5547 	popw x
      009BE4 90 5D            [ 2] 5548 	tnzw y 
      009BE4 72 01            [ 1] 5549 	jreq 4$
      009BE6 00               [ 2] 5550 2$:	srlw x 
      009BE7 24 07            [ 2] 5551 	decw y 
      009BE9 27 05            [ 1] 5552 	jrne 2$
      001E9F                       5553 4$:  
      009BEB A6 07            [ 1] 5554 	ld a,#TK_INTGR
      009BED CC               [ 4] 5555 	ret
                                   5556 
                                   5557 ;--------------------------
                                   5558 ; BASIC: FCPU integer
                                   5559 ; set CPU frequency 
                                   5560 ;-------------------------- 
                                   5561 
      001EA2                       5562 fcpu:
      009BEE 88 F7            [ 1] 5563 	ld a,#TK_INTGR
      009BF0 CD 10 6D         [ 4] 5564 	call expect 
      009BF0 CD               [ 1] 5565 	ld a,xl 
      009BF1 89 E7            [ 1] 5566 	and a,#7 
      009BF3 A1 02 27         [ 1] 5567 	ld CLK_CKDIVR,a 
      009BF6 03               [ 4] 5568 	ret 
                                   5569 
                                   5570 ;------------------------------
                                   5571 ; BASIC: PMODE pin#, mode 
                                   5572 ; Arduino pin. 
                                   5573 ; define pin as input or output
                                   5574 ; pin#: {0..15}
                                   5575 ; mode: INPUT|OUTPUT  
                                   5576 ;------------------------------
                           000001  5577 	PINNO=1
                           000001  5578 	VSIZE=1
      001EAE                       5579 pin_mode:
      001EAE                       5580 	_vars VSIZE 
      009BF7 CC 88            [ 2]    1     sub sp,#VSIZE 
      009BF9 F5 90 93         [ 4] 5581 	call arg_list 
      009BFC CD 9A            [ 1] 5582 	cp a,#2 
      009BFE 9D 25            [ 1] 5583 	jreq 1$
      009C00 05 A6 09         [ 2] 5584 	jp syntax_error 
      009C03 CC 88            [ 2] 5585 1$: popw y ; mode 
      009C05 F7               [ 2] 5586 	popw x ; Dx pin 
      009C06 CD 1E EF         [ 4] 5587 	call select_pin 
      009C06 CD 9B            [ 1] 5588 	ld (PINNO,sp),a  
      009C08 B3 CE            [ 1] 5589 	ld a,#1 
      009C0A 00 1F            [ 1] 5590 	tnz (PINNO,sp)
      009C0C 72 B0            [ 1] 5591 	jreq 4$
      009C0E 00               [ 1] 5592 2$:	sll a 
      009C0F 1D CD            [ 1] 5593 	dec (PINNO,sp)
      009C11 8A 3C            [ 1] 5594 	jrne 2$ 
      009C13 81 01            [ 1] 5595 	ld (PINNO,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C14 EA 03            [ 1] 5596 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C14 52 03            [ 1] 5597 	ld (GPIO_CR1,x),a 
      009C16 CD 89 E7 A1      [ 2] 5598 4$:	cpw y,#OUTP 
      009C1A 00 27            [ 1] 5599 	jreq 6$
                                   5600 ; input mode
      009C1C 20 A1            [ 1] 5601 	ld a,(PINNO,sp)
      009C1E 02               [ 1] 5602 	cpl a 
      009C1F 27 03            [ 1] 5603 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C21 CC 88            [ 2] 5604 	jra 9$
      001EE0                       5605 6$: ;output mode  
      009C23 F5 90            [ 1] 5606 	ld a,(PINNO,sp)
      009C25 93 55            [ 1] 5607 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C27 00 04            [ 1] 5608 	ld (GPIO_CR2,x),a 
      009C29 00 02            [ 1] 5609 	ld a,(PINNO,sp)
      009C2B CD 9A            [ 1] 5610 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C2D 9D 25            [ 1] 5611 9$:	ld (GPIO_DDR,x),a 
      001EEC                       5612 	_drop VSIZE 
      009C2F 05 A6            [ 2]    1     addw sp,#VSIZE 
      009C31 09               [ 4] 5613 	ret
                                   5614 
                                   5615 ;------------------------
                                   5616 ; select Arduino pin 
                                   5617 ; input:
                                   5618 ;   X 	 {0..15} Arduino Dx 
                                   5619 ; output:
                                   5620 ;   A     stm8s208 pin 
                                   5621 ;   X     base address s208 GPIO port 
                                   5622 ;---------------------------
      001EEF                       5623 select_pin:
      009C32 CC               [ 2] 5624 	sllw x 
      009C33 88 F7 FF         [ 2] 5625 	addw x,#arduino_to_8s208 
      009C35 FE               [ 2] 5626 	ldw x,(x)
      009C35 CE               [ 1] 5627 	ld a,xl 
      009C36 00               [ 1] 5628 	push a 
      009C37 17               [ 1] 5629 	swapw x 
      009C38 C6 00            [ 1] 5630 	ld a,#5 
      009C3A 19               [ 4] 5631 	mul x,a 
      009C3B 20 0A 00         [ 2] 5632 	addw x,#GPIO_BASE 
      009C3D 84               [ 1] 5633 	pop a 
      009C3D AE               [ 4] 5634 	ret 
                                   5635 ; translation from Arduino D0..D15 to stm8s208rb 
      001EFF                       5636 arduino_to_8s208:
      009C3E 01 00                 5637 .byte 3,6 ; D0 
      009C40 4F CF                 5638 .byte 3,5 ; D1 
      009C42 00 17                 5639 .byte 4,0 ; D2 
      009C44 C7 00                 5640 .byte 2,1 ; D3
      009C46 19 00                 5641 .byte 6,0 ; D4
      009C47 02 02                 5642 .byte 2,2 ; D5
      009C47 1F 01                 5643 .byte 2,3 ; D6
      009C49 6B 03                 5644 .byte 3,1 ; D7
      009C4B CD 81                 5645 .byte 3,3 ; D8
      009C4D A8 CD                 5646 .byte 2,4 ; D9
      009C4F 82 23                 5647 .byte 4,5 ; D10
      009C51 AE 00                 5648 .byte 2,6 ; D11
      009C53 80 CD                 5649 .byte 2,7 ; D12
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C55 9A 29                 5650 .byte 2,5 ; D13
      009C57 CD 9A                 5651 .byte 4,2 ; D14
      009C59 0E C6                 5652 .byte 4,1 ; D15
                                   5653 
                                   5654 
                                   5655 ;------------------------------
                                   5656 ; BASIC: RND(expr)
                                   5657 ; return random number 
                                   5658 ; between 1 and expr inclusive
                                   5659 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5660 ; input:
                                   5661 ; 	none 
                                   5662 ; output:
                                   5663 ;	X 		random positive integer 
                                   5664 ;------------------------------
      001F1F                       5665 random:
      009C5B 00 19 C0         [ 4] 5666 	call func_args 
      009C5E 00 1C            [ 1] 5667 	cp a,#1
      009C60 C6 00            [ 1] 5668 	jreq 1$
      009C62 18 C2 00         [ 2] 5669 	jp syntax_error
      001F29                       5670 1$:  
      009C65 1B C6            [ 1] 5671 	ld a,#0x80 
      009C67 00 17            [ 1] 5672 	bcp a,(1,sp)
      009C69 C2 00            [ 1] 5673 	jreq 2$
      009C6B 1A 2B            [ 1] 5674 	ld a,#ERR_BAD_VALUE
      009C6D E0 7B 03         [ 2] 5675 	jp tb_error
      001F34                       5676 2$: 
                                   5677 ; acc16=(x<<5)^x 
      009C70 1E 01 C7         [ 2] 5678 	ldw x,seedx 
      009C73 00               [ 2] 5679 	sllw x 
      009C74 1C               [ 2] 5680 	sllw x 
      009C75 CF               [ 2] 5681 	sllw x 
      009C76 00               [ 2] 5682 	sllw x 
      009C77 1A               [ 2] 5683 	sllw x 
      009C78 5B               [ 1] 5684 	ld a,xh 
      009C79 03 81 12         [ 1] 5685 	xor a,seedx 
      009C7B C7 00 0C         [ 1] 5686 	ld acc16,a 
      009C7B 52               [ 1] 5687 	ld a,xl 
      009C7C 02 5F 1F         [ 1] 5688 	xor a,seedx+1 
      009C7F 01 CF 00         [ 1] 5689 	ld acc8,a 
                                   5690 ; seedx=seedy 
      009C82 18 35 01         [ 2] 5691 	ldw x,seedy 
      009C85 00 17 12         [ 2] 5692 	ldw seedx,x  
                                   5693 ; seedy=seedy^(seedy>>1)
      009C87 90 54            [ 2] 5694 	srlw y 
      009C87 5F 92            [ 1] 5695 	ld a,yh 
      009C89 AF 00 17         [ 1] 5696 	xor a,seedy 
      009C8C 27 3B 14         [ 1] 5697 	ld seedy,a  
      009C8E 90 9F            [ 1] 5698 	ld a,yl 
      009C8E 92 AF 00         [ 1] 5699 	xor a,seedy+1 
      009C91 17 27 06         [ 1] 5700 	ld seedy+1,a 
                                   5701 ; acc16>>3 
      009C94 CD 83 20         [ 2] 5702 	ldw x,acc16 
      009C97 5C               [ 2] 5703 	srlw x 
      009C98 20               [ 2] 5704 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009C99 F4               [ 2] 5705 	srlw x 
                                   5706 ; x=acc16^x 
      009C9A 5C               [ 1] 5707 	ld a,xh 
      009C9B A6 20 CD         [ 1] 5708 	xor a,acc16 
      009C9E 83               [ 1] 5709 	ld xh,a 
      009C9F 20               [ 1] 5710 	ld a,xl 
      009CA0 92 AF 00         [ 1] 5711 	xor a,acc8 
      009CA3 17               [ 1] 5712 	ld xl,a 
                                   5713 ; seedy=x^seedy 
      009CA4 90 95 5C         [ 1] 5714 	xor a,seedy+1
      009CA7 92               [ 1] 5715 	ld xl,a 
      009CA8 AF               [ 1] 5716 	ld a,xh 
      009CA9 00 17 5C         [ 1] 5717 	xor a,seedy
      009CAC 90               [ 1] 5718 	ld xh,a 
      009CAD 97 90 89         [ 2] 5719 	ldw seedy,x 
                                   5720 ; return seedy modulo expr + 1 
      009CB0 72 FB            [ 2] 5721 	popw y 
      009CB2 01               [ 2] 5722 	divw x,y 
      009CB3 CD               [ 1] 5723 	ldw x,y 
      009CB4 9A               [ 2] 5724 	incw x 
      001F83                       5725 10$:
      009CB5 29 CD            [ 1] 5726 	ld a,#TK_INTGR
      009CB7 9A               [ 4] 5727 	ret 
                                   5728 
                                   5729 ;---------------------------------
                                   5730 ; BASIC: WORDS 
                                   5731 ; affiche la listes des mots du
                                   5732 ; dictionnaire ainsi que le nombre
                                   5733 ; de mots.
                                   5734 ;---------------------------------
                           000001  5735 	WLEN=1 ; word length
                           000002  5736 	LLEN=2 ; character sent to console
                           000003  5737 	WCNT=3 ; count words printed 
                           000003  5738 	VSIZE=3 
      001F86                       5739 words:
      001F86                       5740 	_vars VSIZE
      009CB8 0E 85            [ 2]    1     sub sp,#VSIZE 
      009CBA CD 8A            [ 1] 5741 	clr (LLEN,sp)
      009CBC 3C A6            [ 1] 5742 	clr (WCNT,sp)
      009CBE 0D CD 83 20      [ 2] 5743 	ldw y,#kword_dict+2
      009CC2 1E               [ 1] 5744 0$:	ldw x,y
      009CC3 01               [ 1] 5745 	ld a,(x)
      009CC4 5C 1F            [ 1] 5746 	and a,#15 
      009CC6 01 20            [ 1] 5747 	ld (WLEN,sp),a 
      009CC8 BE 03            [ 1] 5748 	inc (WCNT,sp)
      009CC9 5C               [ 2] 5749 1$:	incw x 
      009CC9 1E               [ 1] 5750 	ld a,(x)
      009CCA 01 CD 8A         [ 4] 5751 	call putc 
      009CCD 3C AE            [ 1] 5752 	inc (LLEN,sp)
      009CCF 9C E8            [ 1] 5753 	dec (WLEN,sp)
      009CD1 CD 83            [ 1] 5754 	jrne 1$
      009CD3 33 CD            [ 1] 5755 	ld a,#70
      009CD5 9A 69            [ 1] 5756 	cp a,(LLEN,sp)
      009CD7 5F 35            [ 1] 5757 	jrmi 2$   
      009CD9 0A 00            [ 1] 5758 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009CDB 0B CD 8A         [ 4] 5759 	call putc 
      009CDE 4C AE            [ 1] 5760 	inc (LLEN,sp) 
      009CE0 9C F0            [ 2] 5761 	jra 3$
      009CE2 CD 83            [ 1] 5762 2$: ld a,#CR 
      009CE4 33 5B 02         [ 4] 5763 	call putc 
      009CE7 81 20            [ 1] 5764 	clr (LLEN,sp)
      009CE9 66 69 6C 65      [ 2] 5765 3$:	subw y,#2 
      009CED 73 0A            [ 2] 5766 	ldw y,(y)
      009CEF 00 20            [ 1] 5767 	jrne 0$ 
      009CF1 62 79            [ 1] 5768 	ld a,#CR 
      009CF3 74 65 73         [ 4] 5769 	call putc  
      009CF6 20               [ 1] 5770 	clrw x 
      009CF7 66 72            [ 1] 5771 	ld a,(WCNT,sp)
      009CF9 65               [ 1] 5772 	ld xl,a 
      009CFA 65 0A 00         [ 4] 5773 	call print_int 
      009CFD AE 1F D6         [ 2] 5774 	ldw x,#words_count_msg
      009CFD 52 02 72         [ 4] 5775 	call puts 
      001FD3                       5776 	_drop VSIZE 
      009D00 5F 00            [ 2]    1     addw sp,#VSIZE 
      009D02 17               [ 4] 5777 	ret 
      009D03 CD 91 F8 A1 84 27 03  5778 words_count_msg: .asciz " words in dictionary\n"
             CC 88 F5 1F 01 CD 89
             E7 A1 09 27 02 20 19
             CD
                                   5779 
                                   5780 
                                   5781 ;-----------------------------
                                   5782 ; BASIC: TIMER expr 
                                   5783 ; initialize count down timer 
                                   5784 ;-----------------------------
      001FEC                       5785 set_timer:
      009D19 91 F8 A1         [ 4] 5786 	call arg_list
      009D1C 84 27            [ 1] 5787 	cp a,#1 
      009D1E 03 CC            [ 1] 5788 	jreq 1$
      009D20 88 F5 9F         [ 2] 5789 	jp syntax_error
      001FF6                       5790 1$: 
      009D23 1E               [ 2] 5791 	popw x 
      009D24 01 CF 00         [ 2] 5792 	ldw timer,x 
      009D27 18               [ 4] 5793 	ret 
                                   5794 
                                   5795 ;------------------------------
                                   5796 ; BASIC: TIMEOUT 
                                   5797 ; return state of timer 
                                   5798 ;------------------------------
      001FFB                       5799 timeout:
      009D28 5F CD 82         [ 2] 5800 	ldw x,timer 
      001FFE                       5801 logical_complement:
      009D2B 4D               [ 2] 5802 	cplw x 
      009D2C 1E 01 5C         [ 2] 5803 	cpw x,#-1
      009D2F 20 DC            [ 1] 5804 	jreq 2$
      009D31 5F               [ 1] 5805 	clrw x 
      009D31 5B 02            [ 1] 5806 2$:	ld a,#TK_INTGR
      009D33 81               [ 4] 5807 	ret 
                                   5808 
                                   5809 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5810 ; BASIC NOT(expr) 
                                   5811 ; return logical complement of expr
                                   5812 ;--------------------------------
      009D34                       5813 func_not:
      009D34 CD 90 FA         [ 4] 5814 	call func_args  
      009D37 A1 01            [ 1] 5815 	cp a,#1
      009D39 27 03            [ 1] 5816 	jreq 1$
      009D3B CC 88 F5         [ 2] 5817 	jp syntax_error
      009D3E 85               [ 2] 5818 1$:	popw x 
      009D3F 9F A4            [ 2] 5819 	jra logical_complement
                                   5820 
                                   5821 
                                   5822 
                                   5823 ;-----------------------------------
                                   5824 ; BASIC: IWDGEN expr1 
                                   5825 ; enable independant watchdog timer
                                   5826 ; expr1 is delay in multiple of 62.5µsec
                                   5827 ; expr1 -> {1..16383}
                                   5828 ;-----------------------------------
      002015                       5829 enable_iwdg:
      009D41 7F 97 A6         [ 4] 5830 	call arg_list
      009D44 03 81            [ 1] 5831 	cp a,#1 
      009D46 27 03            [ 1] 5832 	jreq 1$
      009D46 A6 07 CD         [ 2] 5833 	jp syntax_error 
      009D49 90               [ 2] 5834 1$: popw x 
      009D4A ED CD            [ 1] 5835 	push #0
      009D4C 89 E7 A1 02      [ 1] 5836 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D50 27               [ 1] 5837 	ld a,xh 
      009D51 07 A1            [ 1] 5838 	and a,#0x3f
      009D53 03               [ 1] 5839 	ld xh,a  
      009D54 27 06 CC         [ 2] 5840 2$:	cpw x,#255
      009D57 88 F5            [ 2] 5841 	jrule 3$
      009D59 0C 01            [ 1] 5842 	inc (1,sp)
      009D59 F6               [ 1] 5843 	rcf 
      009D5A 5F               [ 2] 5844 	rrcw x 
      009D5B 97 F5            [ 2] 5845 	jra 2$
      009D5C 35 55 50 E0      [ 1] 5846 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D5C 89               [ 1] 5847 	pop a  
      009D5D A6 08 CD         [ 1] 5848 	ld IWDG_PR,a 
      009D60 90               [ 1] 5849 	ld a,xl
      009D61 ED               [ 1] 5850 	dec a 
      009D62 85 A6 84 81      [ 1] 5851 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D66 C7 50 E2         [ 1] 5852 	ld IWDG_RLR,a 
      009D66 CD 83 29 5F      [ 1] 5853 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D6A 97               [ 4] 5854 	ret 
                                   5855 
                                   5856 
                                   5857 ;-----------------------------------
                                   5858 ; BASIC: IWDGREF  
                                   5859 ; refresh independant watchdog count down 
                                   5860 ; timer before it reset MCU. 
                                   5861 ;-----------------------------------
      00204B                       5862 refresh_iwdg:
      009D6B A6 84 81 E0      [ 1] 5863 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D6E 81               [ 4] 5864 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5865 
                                   5866 
                                   5867 ;-------------------------------------
                                   5868 ; BASIC: LOG(expr)
                                   5869 ; return logarithm base 2 of expr 
                                   5870 ; this is the position of most significant
                                   5871 ; bit set. 
                                   5872 ; input: 
                                   5873 ; output:
                                   5874 ;   X     log2 
                                   5875 ;   A     TK_INTGR 
                                   5876 ;*********************************
      002050                       5877 log2:
      009D6E 5F 72 5D         [ 4] 5878 	call func_args 
      009D71 00 26            [ 1] 5879 	cp a,#1 
      009D73 27 01            [ 1] 5880 	jreq 1$
      009D75 53 A6 84         [ 2] 5881 	jp syntax_error 
      009D78 81               [ 2] 5882 1$: popw x 
      009D79                       5883 leading_one:
      009D79 CD               [ 2] 5884 	tnzw x 
      009D7A 90 FA            [ 1] 5885 	jreq 4$
      009D7C A1 02            [ 1] 5886 	ld a,#15 
      009D7E 27               [ 2] 5887 2$: rlcw x 
      009D7F 03 CC            [ 1] 5888     jrc 3$
      009D81 88               [ 1] 5889 	dec a 
      009D82 F5 FA            [ 2] 5890 	jra 2$
      009D83 5F               [ 1] 5891 3$: clrw x 
      009D83 1E               [ 1] 5892     ld xl,a
      009D84 03 2B            [ 1] 5893 4$:	ld a,#TK_INTGR
      009D86 17               [ 4] 5894 	ret 
                                   5895 
                                   5896 ;-----------------------------------
                                   5897 ; BASIC: BIT(expr) 
                                   5898 ; expr ->{0..15}
                                   5899 ; return 2^expr 
                                   5900 ; output:
                                   5901 ;    x    2^expr 
                                   5902 ;-----------------------------------
      00206B                       5903 bitmask:
      009D87 A3 00 09         [ 4] 5904     call func_args 
      009D8A 2A 12            [ 1] 5905 	cp a,#1
      009D8C A6 05            [ 1] 5906 	jreq 1$
      009D8E 42 1C 50         [ 2] 5907 	jp syntax_error 
      009D91 00               [ 2] 5908 1$: popw x 
      009D92 1F               [ 1] 5909 	ld a,xl 
      009D93 03 1E            [ 1] 5910 	and a,#15
      009D95 01               [ 1] 5911 	clrw x 
      009D96 72               [ 2] 5912 	incw x 
      009D97 FB               [ 1] 5913 2$: tnz a 
      009D98 03 A6            [ 1] 5914 	jreq 3$
      009D9A 84               [ 2] 5915 	slaw x 
      009D9B 5B               [ 1] 5916 	dec a 
      009D9C 04 81            [ 2] 5917 	jra 2$ 
      009D9E A6 84            [ 1] 5918 3$: ld a,#TK_INTGR
      009D9E A6               [ 4] 5919 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5920 
                                   5921 ;------------------------------
                                   5922 ; BASIC: INVERT(expr)
                                   5923 ; 1's complement 
                                   5924 ;--------------------------------
      002085                       5925 invert:
      009D9F 0A CC 88         [ 4] 5926 	call func_args
      009DA2 F7 01            [ 1] 5927 	cp a,#1 
      009DA3 27 03            [ 1] 5928 	jreq 1$
      009DA3 AE A7 80         [ 2] 5929 	jp syntax_error
      009DA6 A6               [ 2] 5930 1$: popw x  
      009DA7 84               [ 2] 5931 	cplw x 
      009DA8 81 84            [ 1] 5932 	ld a,#TK_INTGR 
      009DA9 81               [ 4] 5933 	ret 
                                   5934 
                                   5935 ;------------------------------
                                   5936 ; BASIC: DO 
                                   5937 ; initiate a DO ... UNTIL loop 
                                   5938 ;------------------------------
                           000003  5939 	DOLP_ADR=3 
                           000005  5940 	DOLP_INW=5
                           000004  5941 	VSIZE=4 
      002094                       5942 do_loop:
      009DA9 90               [ 2] 5943 	popw x 
      002095                       5944 	_vars VSIZE 
      009DAA 89 CD            [ 2]    1     sub sp,#VSIZE 
      009DAC 90               [ 2] 5945 	pushw x 
      009DAD FA A1 01 27      [ 2] 5946 	ldw y,basicptr 
      009DB1 07 A1            [ 2] 5947 	ldw (DOLP_ADR,sp),y
      009DB3 02 27 03 CC      [ 2] 5948 	ldw y,in.w 
      009DB7 88 F5            [ 2] 5949 	ldw (DOLP_INW,sp),y
      009DB9 90 85 A1 01      [ 1] 5950 	inc loop_depth 
      009DBD 27               [ 4] 5951 	ret 
                                   5952 
                                   5953 ;--------------------------------
                                   5954 ; BASIC: UNTIL expr 
                                   5955 ; loop if exprssion is false 
                                   5956 ; else terminate loop
                                   5957 ;--------------------------------
      0020A9                       5958 until: 
      009DBE 02 85 51 90      [ 1] 5959 	tnz loop_depth 
      009DC2 FD 90            [ 1] 5960 	jrne 1$ 
      009DC4 85 81 75         [ 2] 5961 	jp syntax_error 
      009DC6                       5962 1$: 
      009DC6 72 0D 52         [ 4] 5963 	call relation 
      009DC9 30 FB            [ 1] 5964 	cp a,#TK_INTGR
      009DCB 8E CC            [ 1] 5965 	jreq 2$
      009DCD 86 4B 75         [ 2] 5966 	jp syntax_error
      009DCF                       5967 2$: 
      009DCF 72               [ 2] 5968 	tnzw x 
      009DD0 01 00            [ 1] 5969 	jrne 9$
      009DD2 24 07            [ 2] 5970 	ldw x,(DOLP_ADR,sp)
      009DD4 27 05 A6         [ 2] 5971 	ldw basicptr,x 
      009DD7 07 CC            [ 1] 5972 	ld a,(2,x)
      009DD9 88 F7 03         [ 1] 5973 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009DDB 1E 05            [ 2] 5974 	ldw x,(DOLP_INW,sp)
      009DDB CD 89 E7         [ 2] 5975 	ldw in.w,x 
      009DDE 26               [ 4] 5976 	ret 
      0020CF                       5977 9$:	; remove loop data from stack  
      009DDF 08               [ 2] 5978 	popw x
      0020D0                       5979 	_drop VSIZE
      009DE0 AE 40            [ 2]    1     addw sp,#VSIZE 
      009DE2 00 CD 83 33      [ 1] 5980 	dec loop_depth 
      009DE6 4F               [ 2] 5981 	jp (x)
                                   5982 
                                   5983 ;--------------------------
                                   5984 ; BASIC: PRTA...PRTI  
                                   5985 ;  return constant value 
                                   5986 ;  PORT  offset in GPIO
                                   5987 ;  array
                                   5988 ;---------------------------
      0020D7                       5989 const_porta:
      009DE7 81 00 00         [ 2] 5990 	ldw x,#0
      009DE8 A6 84            [ 1] 5991 	ld a,#TK_INTGR 
      009DE8 A1               [ 4] 5992 	ret 
      0020DD                       5993 const_portb:
      009DE9 02 27 03         [ 2] 5994 	ldw x,#1
      009DEC CC 88            [ 1] 5995 	ld a,#TK_INTGR 
      009DEE F5               [ 4] 5996 	ret 
      009DEF                       5997 const_portc:
      009DEF 7D 26 09         [ 2] 5998 	ldw x,#2
      009DF2 CD 87            [ 1] 5999 	ld a,#TK_INTGR 
      009DF4 14               [ 4] 6000 	ret 
      0020E9                       6001 const_portd:
      009DF5 55 00 04         [ 2] 6002 	ldw x,#3
      009DF8 00 02            [ 1] 6003 	ld a,#TK_INTGR 
      009DFA 81               [ 4] 6004 	ret 
      0020EF                       6005 const_porte:
      009DFB 89 90 93         [ 2] 6006 	ldw x,#4
      009DFE CD 9A            [ 1] 6007 	ld a,#TK_INTGR 
      009E00 9D               [ 4] 6008 	ret 
      0020F5                       6009 const_portf:
      009E01 25 05 A6         [ 2] 6010 	ldw x,#5
      009E04 09 CC            [ 1] 6011 	ld a,#TK_INTGR 
      009E06 88               [ 4] 6012 	ret 
      0020FB                       6013 const_portg:
      009E07 F7 00 06         [ 2] 6014 	ldw x,#6
      009E08 A6 84            [ 1] 6015 	ld a,#TK_INTGR 
      009E08 55               [ 4] 6016 	ret 
      002101                       6017 const_porth:
      009E09 00 04 00         [ 2] 6018 	ldw x,#7
      009E0C 02 72            [ 1] 6019 	ld a,#TK_INTGR 
      009E0E 5F               [ 4] 6020 	ret 
      002107                       6021 const_porti:
      009E0F 00 17 AE         [ 2] 6022 	ldw x,#8
      009E12 40 00            [ 1] 6023 	ld a,#TK_INTGR 
      009E14 CF               [ 4] 6024 	ret 
                                   6025 
                                   6026 ;-------------------------------
                                   6027 ; following return constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6028 ; related to GPIO register offset 
                                   6029 ;---------------------------------
      00210D                       6030 const_odr:
      009E15 00 18            [ 1] 6031 	ld a,#TK_INTGR 
      009E17 1E 01 CD         [ 2] 6032 	ldw x,#GPIO_ODR
      009E1A 84               [ 4] 6033 	ret 
      002113                       6034 const_idr:
      009E1B 12 5C            [ 1] 6035 	ld a,#TK_INTGR 
      009E1D 90 85 89         [ 2] 6036 	ldw x,#GPIO_IDR
      009E20 5F               [ 4] 6037 	ret 
      002119                       6038 const_ddr:
      009E21 CD 82            [ 1] 6039 	ld a,#TK_INTGR 
      009E23 C2 5B 02         [ 2] 6040 	ldw x,#GPIO_DDR
      009E26 81               [ 4] 6041 	ret 
      009E27                       6042 const_cr1:
      009E27 72 0D            [ 1] 6043 	ld a,#TK_INTGR 
      009E29 52 30 FB         [ 2] 6044 	ldw x,#GPIO_CR1
      009E2C 72               [ 4] 6045 	ret 
      002125                       6046 const_cr2:
      009E2D 16 00            [ 1] 6047 	ld a,#TK_INTGR 
      009E2F 24 8E 81         [ 2] 6048 	ldw x,#GPIO_CR2
      009E32 81               [ 4] 6049 	ret 
                                   6050 ;-------------------------
                                   6051 ;  constant for port mode
                                   6052 ;  used by PMODE 
                                   6053 ;  input or output
                                   6054 ;------------------------
      00212B                       6055 const_output:
      009E32 CD 91            [ 1] 6056 	ld a,#TK_INTGR 
      009E34 F8 A1 84         [ 2] 6057 	ldw x,#OUTP
      009E37 27               [ 4] 6058 	ret 
      002131                       6059 const_input:
      009E38 03 CC            [ 1] 6060 	ld a,#TK_INTGR 
      009E3A 88 F5 00         [ 2] 6061 	ldw x,#INP 
      009E3C 81               [ 4] 6062 	ret 
                                   6063 ;-----------------------
                                   6064 ; memory area constants
                                   6065 ;-----------------------
      002137                       6066 const_eeprom_base:
      009E3C 5D 27            [ 1] 6067 	ld a,#TK_INTGR 
      009E3E 04 8F 5A         [ 2] 6068 	ldw x,#EEPROM_BASE 
      009E41 26               [ 4] 6069 	ret 
                                   6070 
                                   6071 ;---------------------------
                                   6072 ; BASIC: DATA 
                                   6073 ; when the interpreter find 
                                   6074 ; a DATA line it skip it.
                                   6075 ;---------------------------
      00213D                       6076 data:
      009E42 F9 4F 81 00 01   [ 1] 6077 	mov in,count 
      009E45 81               [ 4] 6078 	ret 
                                   6079 
                                   6080 ;---------------------------
                                   6081 ; BASIC: DATLN  *expr*
                                   6082 ; set DATA pointer at line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6083 ; specified by *expr* 
                                   6084 ;---------------------------
      002143                       6085 data_line:
      009E45 CD 91 F8         [ 4] 6086 	call expression
      009E48 A1 84            [ 1] 6087 	cp a,#TK_INTGR
      009E4A 27 03            [ 1] 6088 	jreq 1$
      009E4C CC 88 F5         [ 2] 6089 	jp syntax_error 
      009E4F CD 04 00         [ 4] 6090 1$: call search_lineno
      009E4F A3               [ 2] 6091 	tnzw x 
      009E50 14 00            [ 1] 6092 	jrne 3$
      009E52 2B 0C            [ 1] 6093 2$:	ld a,#ERR_NO_LINE 
      009E54 35 0F 50         [ 2] 6094 	jp tb_error
      002158                       6095 3$: ; check if valid data line 
      009E57 F2 A6            [ 1] 6096     ldw y,x 
      009E59 1E 62            [ 2] 6097 	ldw x,(4,x)
      009E5B A6 10 62         [ 2] 6098 	cpw x,#data 
      009E5E 20 1E            [ 1] 6099 	jrne 2$ 
      009E60 90 CF 00 06      [ 2] 6100 	ldw data_ptr,y
      009E60 A3 08 00         [ 1] 6101 	ld a,(2,y)
      009E63 2B 09 35         [ 1] 6102 	ld data_len,a 
      009E66 0E 50 F2 A6      [ 1] 6103 	mov data_ofs,#FIRST_DATA_ITEM 
      009E6A 50               [ 4] 6104 	ret
                                   6105 
                                   6106 ;---------------------------------
                                   6107 ; BASIC: RESTORE 
                                   6108 ; set data_ptr to first data line
                                   6109 ; if not DATA found pointer set to
                                   6110 ; zero 
                                   6111 ;---------------------------------
      002170                       6112 restore:
      009E6B 62 20 10 06      [ 1] 6113 	clr data_ptr 
      009E6E 72 5F 00 07      [ 1] 6114 	clr data_ptr+1
      009E6E 35 07 50 F2      [ 1] 6115 	clr data_ofs 
      009E72 72 5F 00 09      [ 1] 6116 	clr data_len
      009E72 A3 00 40         [ 2] 6117 	ldw x,txtbgn
      002183                       6118 data_search_loop: 	
      009E75 23 07 72         [ 2] 6119 	cpw x,txtend
      009E78 5C 50            [ 1] 6120 	jruge 9$
      009E7A F2 54            [ 1] 6121 	ldw y,x 
      009E7C 20 F4            [ 2] 6122 	ldw x,(4,x)
      009E7E A3 21 3D         [ 2] 6123 	cpw x,#data 
      009E7E 9F 4A            [ 1] 6124 	jrne try_next_line 
      009E80 27 01 4A 06      [ 2] 6125 	ldw data_ptr,y 
      009E83 90 E6 02         [ 1] 6126 	ld a,(2,y)
      009E83 A4 3E C7         [ 1] 6127 	ld data_len,a 
      009E86 50 F1 72 18      [ 1] 6128 	mov data_ofs,#FIRST_DATA_ITEM
      009E8A 50 F0 8E 81      [ 1] 6129 9$:	tnz data_len 
      009E8E 26 05            [ 1] 6130     jrne 10$
      009E8E CE 00            [ 1] 6131 	ld a,#ERR_NO_DATA 
      009E90 0F A6 84         [ 2] 6132 	jp tb_error 
      009E93 81               [ 4] 6133 10$:ret
      009E94                       6134 try_next_line:
      009E94 CD               [ 1] 6135 	ldw x,y 
      009E95 90 FA            [ 1] 6136 	ld a,(2,x)
      009E97 A1 01 27         [ 1] 6137 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009E9A 03 CC 88 F5      [ 1] 6138 	clr acc16 
      009E9E 72 BB 00 0C      [ 2] 6139 	addw x,acc16 
      009E9E 85 9E            [ 2] 6140 	jra data_search_loop
                                   6141 
                                   6142 
                                   6143 ;---------------------------------
                                   6144 ; BASIC: READ 
                                   6145 ; return next data item | 0 
                                   6146 ;---------------------------------
                           000001  6147 	CTX_BPTR=1 
                           000003  6148 	CTX_IN=3 
                           000004  6149 	CTX_COUNT=4 
                           000005  6150 	XSAVE=5
                           000006  6151 	VSIZE=6
      0021BB                       6152 read:
      0021BB                       6153 	_vars  VSIZE 
      009EA0 A5 80            [ 2]    1     sub sp,#VSIZE 
      0021BD                       6154 read01:	
      009EA2 27 01 50         [ 1] 6155 	ld a,data_ofs
      009EA5 A6 84 81         [ 1] 6156 	cp a,data_len 
      009EA8 27 37            [ 1] 6157 	jreq 2$ ; end of line  
      009EA8 CD 90 FA         [ 4] 6158 	call save_context
      009EAB A1 02 27         [ 2] 6159 	ldw x,data_ptr 
      009EAE 03 CC 88         [ 2] 6160 	ldw basicptr,x 
      009EB1 F5 85 9E 14 01   [ 1] 6161 	mov in,data_ofs 
      009EB6 95 9F 14 02 97   [ 1] 6162 	mov count,data_len  
      009EBB 5B 02 A6         [ 4] 6163 	call expression 
      009EBE 84 81            [ 1] 6164 	cp a,#TK_INTGR 
      009EC0 27 03            [ 1] 6165 	jreq 1$ 
      009EC0 CD 90 FA         [ 2] 6166 	jp syntax_error 
      0021E2                       6167 1$:
      009EC3 A1 02            [ 2] 6168 	ldw (XSAVE,SP),x
      009EC5 27 03 CC         [ 4] 6169 	call next_token ; skip comma
      009EC8 88 F5 04         [ 2] 6170 	ldw x,basicptr 
      009ECA CF 00 06         [ 2] 6171 	ldw data_ptr,x 
      009ECA 85 9E 1A 01 95   [ 1] 6172 	mov data_ofs,in 
      009ECF 9F 1A 02         [ 4] 6173 	call rest_context
      009ED2 97 5B            [ 2] 6174 	ldw x,(XSAVE,sp)
      009ED4 02 A6            [ 1] 6175 	ld a,#TK_INTGR
      0021F9                       6176 	_drop VSIZE 
      009ED6 84 81            [ 2]    1     addw sp,#VSIZE 
      009ED8 81               [ 4] 6177 	ret 
      0021FC                       6178 2$: ; end of line reached 
      009ED8 CD 90 FA A1      [ 2] 6179 	ldw y, data_ptr 
      009EDC 02 27 03 CC      [ 1] 6180 	clr data_ptr
      009EE0 88 F5 00 07      [ 1] 6181 	clr data_ptr+1   
      009EE2 72 5F 00 08      [ 1] 6182 	clr data_ofs 
      009EE2 85 9E 18 01      [ 1] 6183 	clr data_len 
      009EE6 95 9F 18         [ 4] 6184 	call try_next_line 
      009EE9 02 97            [ 2] 6185 	jra read01
                                   6186 
                                   6187 
                                   6188 ;---------------------------------
                                   6189 ; BASIC: SPIEN clkdiv, 0|1  
                                   6190 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6191 ; if clkdiv==-1 disable SPI
                                   6192 ; 0|1 -> disable|enable  
                                   6193 ;--------------------------------- 
                           000005  6194 SPI_CS_BIT=5
      002215                       6195 spi_enable:
      009EEB 5B 02 A6         [ 4] 6196 	call arg_list 
      009EEE 84 81            [ 1] 6197 	cp a,#2
      009EF0 27 03            [ 1] 6198 	jreq 1$
      009EF0 CD 90 FA         [ 2] 6199 	jp syntax_error 
      00221F                       6200 1$: 
      009EF3 A1 02 27 03      [ 1] 6201 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009EF7 CC               [ 2] 6202 	popw x  
      009EF8 88               [ 2] 6203 	tnzw x 
      009EF9 F5 90            [ 1] 6204 	jreq spi_disable 
      009EFB 85               [ 2] 6205 	popw x 
      009EFC 85 90            [ 1] 6206 	ld a,#(1<<SPI_CR1_BR)
      009EFE 5D               [ 4] 6207 	mul x,a 
      009EFF 27               [ 1] 6208 	ld a,xl 
      009F00 05 58 90         [ 1] 6209 	ld SPI_CR1,a 
                                   6210 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F03 5A 26 FB 14      [ 1] 6211 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F06 72 1A 50 16      [ 1] 6212 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6213 ; configure SPI as master mode 0.	
      009F06 A6 84 81 00      [ 1] 6214 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6215 ; ~CS line controlled by sofware 	
      009F09 72 12 52 01      [ 1] 6216 	bset SPI_CR2,#SPI_CR2_SSM 
      009F09 CD 90 FA A1      [ 1] 6217     bset SPI_CR2,#SPI_CR2_SSI 
                                   6218 ; enable SPI
      009F0D 02 27 03 CC      [ 1] 6219 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F11 88               [ 4] 6220 	ret 
      002248                       6221 spi_disable:
      002248                       6222 	_drop #2; throw first argument.
      009F12 F5 90            [ 2]    1     addw sp,##2 
                                   6223 ; wait spi idle 
      009F14 85 85            [ 1] 6224 1$:	ld a,#0x82 
      009F16 90 5D 27         [ 1] 6225 	and a,SPI_SR
      009F19 05 54            [ 1] 6226 	cp a,#2 
      009F1B 90 5A            [ 1] 6227 	jrne 1$
      009F1D 26 FB 52 00      [ 1] 6228 	bres SPI_CR1,#SPI_CR1_SPE
      009F1F 72 13 50 C7      [ 1] 6229 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F1F A6 84 81 16      [ 1] 6230 	bres PE_DDR,#SPI_CS_BIT 
      009F22 81               [ 4] 6231 	ret 
                                   6232 
      002260                       6233 spi_clear_error:
      009F22 A6 84            [ 1] 6234 	ld a,#0x78 
      009F24 CD 90 ED         [ 1] 6235 	bcp a,SPI_SR 
      009F27 9F A4            [ 1] 6236 	jreq 1$
      009F29 07 C7 50 C6      [ 1] 6237 	clr SPI_SR 
      009F2D 81               [ 4] 6238 1$: ret 
                                   6239 
      009F2E                       6240 spi_send_byte:
      009F2E 52               [ 1] 6241 	push a 
      009F2F 01 CD 90         [ 4] 6242 	call spi_clear_error
      009F32 FF               [ 1] 6243 	pop a 
      009F33 A1 02 27 03 CC   [ 2] 6244 	btjf SPI_SR,#SPI_SR_TXE,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F38 88 F5 90         [ 1] 6245 	ld SPI_DR,a
      009F3B 85 85 CD 9F 6F   [ 2] 6246 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F40 6B 01 A6         [ 1] 6247 	ld a,SPI_DR 
      009F43 01               [ 4] 6248 	ret 
                                   6249 
      002282                       6250 spi_rcv_byte:
      009F44 0D 01            [ 1] 6251 	ld a,#255
      009F46 27 0B 48 0A 01   [ 2] 6252 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F4B 26 FB 6B         [ 1] 6253 	ld a,SPI_DR 
      009F4E 01               [ 4] 6254 	ret
                                   6255 
                                   6256 ;------------------------------
                                   6257 ; BASIC: SPIWR byte [,byte]
                                   6258 ; write 1 or more byte
                                   6259 ;------------------------------
      00228D                       6260 spi_write:
      009F4F EA 03 E7         [ 4] 6261 	call expression
      009F52 03 90            [ 1] 6262 	cp a,#TK_INTGR 
      009F54 A3 00            [ 1] 6263 	jreq 1$
      009F56 01 27 07         [ 2] 6264 	jp syntax_error 
      002297                       6265 1$:	
      009F59 7B               [ 1] 6266 	ld a,xl 
      009F5A 01 43 E4         [ 4] 6267 	call spi_send_byte 
      009F5D 02 20 0A         [ 4] 6268 	call next_token 
      009F60 A1 09            [ 1] 6269 	cp a,#TK_COMMA 
      009F60 7B 01            [ 1] 6270 	jrne 2$ 
      009F62 EA 04            [ 2] 6271 	jra spi_write 
      009F64 E7               [ 1] 6272 2$:	tnz a 
      009F65 04 7B            [ 1] 6273 	jreq 3$
      0022A7                       6274 	_unget_token  
      009F67 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
      009F6C 5B               [ 4] 6275 3$:	ret 
                                   6276 
                                   6277 
                                   6278 ;-------------------------------
                                   6279 ; BASIC: SPIRD 	
                                   6280 ; read one byte from SPI 
                                   6281 ;-------------------------------
      0022AD                       6282 spi_read:
      009F6D 01 81 82         [ 4] 6283 	call spi_rcv_byte 
      009F6F 5F               [ 1] 6284 	clrw x 
      009F6F 58               [ 1] 6285 	ld xl,a 
      009F70 1C 9F            [ 1] 6286 	ld a,#TK_INTGR 
      009F72 7F               [ 4] 6287 	ret 
                                   6288 
                                   6289 ;------------------------------
                                   6290 ; BASIC: SPISEL 0|1 
                                   6291 ; set state of ~CS line
                                   6292 ; 0|1 deselect|select  
                                   6293 ;------------------------------
      0022B5                       6294 spi_select:
      009F73 FE 9F 88         [ 4] 6295 	call next_token 
      009F76 5E A6            [ 1] 6296 	cp a,#TK_INTGR 
      009F78 05 42            [ 1] 6297 	jreq 1$
      009F7A 1C 50 00         [ 2] 6298 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009F7D 84               [ 2] 6299 1$: tnzw x  
      009F7E 81 05            [ 1] 6300 	jreq cs_high 
      009F7F 72 1B 50 14      [ 1] 6301 	bres PE_ODR,#SPI_CS_BIT
      009F7F 03               [ 4] 6302 	ret 
      0022C7                       6303 cs_high: 
      009F80 06 03 05 04      [ 1] 6304 	bset PE_ODR,#SPI_CS_BIT
      009F84 00               [ 4] 6305 	ret 
                                   6306 
                                   6307 
                                   6308 ;------------------------------
                                   6309 ; BASIC: FILERX
                                   6310 ; Use to receive a BASIC program
                                   6311 ; from the PC using XMODEM 
                                   6312 ; protocol. The file is store in
                                   6313 ; Each line received is compiled
                                   6314 ; then stored in RAM. When reception 
                                   6315 ; is completed with success  the 
                                   6316 ; program is ready to be executed 
                                   6317 ; or save as local file.
                                   6318 ;--------------------------------
      0022CC                       6319 file_receive:
      009F85 02 01 06 00 02   [ 2] 6320 	btjf flags,#FRUN,1$
      009F8A 02 02            [ 1] 6321 	ld a,#ERR_CMD_ONLY
      009F8C 03 03 01         [ 2] 6322 	jp tb_error 
      0022D6                       6323 1$:	
      009F8F 03 03 02         [ 4] 6324 	call clear_basic
      009F92 04 04 05         [ 2] 6325 	ldw x, txtbgn
      009F95 02 06 02         [ 4] 6326 	call xreceive 
      009F98 07 02 05 04      [ 2] 6327 	addw x,txtbgn 
      009F9C 02 04 01         [ 2] 6328 	ldw txtend,x 
      009F9F CD 09 BC         [ 4] 6329 	call print_int 
      009F9F CD 90 FA         [ 2] 6330 	ldw x,#fsize_msg 
      009FA2 A1 01 27         [ 4] 6331 	call puts 
      009FA5 03               [ 4] 6332 	ret 
      009FA6 CC 88 F5 74 65 73 20  6333 fsize_msg: .asciz " bytes received\n"
             72 65 63 65 69 76 65
             64 0A 00
                                   6334 
                                   6335 ;------------------------------
                                   6336 ; BASIC: FILETX "file_name" 
                                   6337 ; Transmit the program in RAM 
                                   6338 ; To the PC using XMODEM protocol.
                                   6339 ; The file transmitted as source 
                                   6340 ; file not tokenized. 
                                   6341 ;-------------------------------
      009FA9                       6342 file_transmit:
                                   6343 
      009FA9 A6               [ 4] 6344 	ret 
                                   6345 
                                   6346 ;-------------------------------
                                   6347 ; BASIC: PAD 
                                   6348 ; Return pad buffer address.
                                   6349 ;------------------------------
      002302                       6350 pad_ref:
      009FAA 80 15 01         [ 2] 6351 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FAD 27 05            [ 1] 6352 	ld a,TK_INTGR
      009FAF A6               [ 4] 6353 	ret 
                                   6354 
                                   6355 ;------------------------------
                                   6356 ;      dictionary 
                                   6357 ; format:
                                   6358 ;   link:   2 bytes 
                                   6359 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6360 ;   cmd_name: 16 byte max 
                                   6361 ;   code_address: 2 bytes 
                                   6362 ;------------------------------
                                   6363 	.macro _dict_entry len,name,cmd 
                                   6364 	.word LINK 
                                   6365 	LINK=.
                                   6366 name:
                                   6367 	.byte len 	
                                   6368 	.ascii "name"
                                   6369 	.word cmd 
                                   6370 	.endm 
                                   6371 
                           000000  6372 	LINK=0
                                   6373 ; respect alphabetic order for BASIC names from Z-A
                                   6374 ; this sort order is for a cleaner WORDS cmd output. 	
      002308                       6375 kword_end:
      002308                       6376 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FB0 0A CC                    1 	.word LINK 
                           00230A     2 	LINK=.
      00230A                          3 XOR:
      009FB2 88                       4 	.byte 3+F_IFUNC 	
      009FB3 F7 4F 52                 5 	.ascii "XOR"
      009FB4 1E 58                    6 	.word bit_xor 
      002310                       6377 	_dict_entry,5,WRITE,write  
      009FB4 CE 00                    1 	.word LINK 
                           002312     2 	LINK=.
      002312                          3 WRITE:
      009FB6 13                       4 	.byte 5 	
      009FB7 58 58 58 58 58           5 	.ascii "WRITE"
      009FBC 9E C8                    6 	.word write 
      00231A                       6378 	_dict_entry,5,WORDS,words 
      009FBE 00 13                    1 	.word LINK 
                           00231C     2 	LINK=.
      00231C                          3 WORDS:
      009FC0 C7                       4 	.byte 5 	
      009FC1 00 0D 9F C8 00           5 	.ascii "WORDS"
      009FC6 14 C7                    6 	.word words 
      002324                       6379 	_dict_entry 4,WAIT,wait 
      009FC8 00 0E                    1 	.word LINK 
                           002326     2 	LINK=.
      002326                          3 WAIT:
      009FCA CE                       4 	.byte 4 	
      009FCB 00 15 CF 00              5 	.ascii "WAIT"
      009FCF 13 90                    6 	.word wait 
      00232D                       6380 	_dict_entry,3+F_IFUNC,USR,usr
      009FD1 54 90                    1 	.word LINK 
                           00232F     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00232F                          3 USR:
      009FD3 9E                       4 	.byte 3+F_IFUNC 	
      009FD4 C8 00 15                 5 	.ascii "USR"
      009FD7 C7 00                    6 	.word usr 
      002335                       6381 	_dict_entry,5,UNTIL,until 
      009FD9 15 90                    1 	.word LINK 
                           002337     2 	LINK=.
      002337                          3 UNTIL:
      009FDB 9F                       4 	.byte 5 	
      009FDC C8 00 16 C7 00           5 	.ascii "UNTIL"
      009FE1 16 CE                    6 	.word until 
      00233F                       6382 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FE3 00 0D                    1 	.word LINK 
                           002341     2 	LINK=.
      002341                          3 UFLASH:
      009FE5 54                       4 	.byte 6+F_IFUNC 	
      009FE6 54 54 9E C8 00 0D        5 	.ascii "UFLASH"
      009FEC 95 9F                    6 	.word uflash 
      00234A                       6383 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FEE C8 00                    1 	.word LINK 
                           00234C     2 	LINK=.
      00234C                          3 UBOUND:
      009FF0 0E                       4 	.byte 6+F_IFUNC 	
      009FF1 97 C8 00 16 97 9E        5 	.ascii "UBOUND"
      009FF7 C8 00                    6 	.word ubound 
      002355                       6384 	_dict_entry,4,TONE,tone  
      009FF9 15 95                    1 	.word LINK 
                           002357     2 	LINK=.
      002357                          3 TONE:
      009FFB CF                       4 	.byte 4 	
      009FFC 00 15 90 85              5 	.ascii "TONE"
      00A000 65 93                    6 	.word tone 
      00235E                       6385 	_dict_entry,2,TO,to
      00A002 5C 57                    1 	.word LINK 
                           002360     2 	LINK=.
      00A003                          3 TO:
      00A003 A6                       4 	.byte 2 	
      00A004 84 81                    5 	.ascii "TO"
      00A006 16 9E                    6 	.word to 
      002365                       6386 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A006 52 03                    1 	.word LINK 
                           002367     2 	LINK=.
      002367                          3 TIMEOUT:
      00A008 0F                       4 	.byte 7+F_IFUNC 	
      00A009 02 0F 03 90 AE A7 39     5 	.ascii "TIMEOUT"
      00A010 93 F6                    6 	.word timeout 
      002371                       6387 	_dict_entry,5,TIMER,set_timer
      00A012 A4 0F                    1 	.word LINK 
                           002373     2 	LINK=.
      002373                          3 TIMER:
      00A014 6B                       4 	.byte 5 	
      00A015 01 0C 03 5C F6           5 	.ascii "TIMER"
      00A01A CD 83                    6 	.word set_timer 
      00237B                       6388 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A01C 20 0C                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                           00237D     2 	LINK=.
      00237D                          3 TICKS:
      00A01E 02                       4 	.byte 5+F_IFUNC 	
      00A01F 0A 01 26 F5 A6           5 	.ascii "TICKS"
      00A024 46 11                    6 	.word get_ticks 
      002385                       6389 	_dict_entry,4,STOP,stop 
      00A026 02 2B                    1 	.word LINK 
                           002387     2 	LINK=.
      002387                          3 STOP:
      00A028 09                       4 	.byte 4 	
      00A029 A6 20 CD 83              5 	.ascii "STOP"
      00A02D 20 0C                    6 	.word stop 
      00238E                       6390 	_dict_entry,4,STEP,step 
      00A02F 02 20                    1 	.word LINK 
                           002390     2 	LINK=.
      002390                          3 STEP:
      00A031 07                       4 	.byte 4 	
      00A032 A6 0D CD 83              5 	.ascii "STEP"
      00A036 20 0F                    6 	.word step 
      002397                       6391 	_dict_entry,5,SPIWR,spi_write
      00A038 02 72                    1 	.word LINK 
                           002399     2 	LINK=.
      002399                          3 SPIWR:
      00A03A A2                       4 	.byte 5 	
      00A03B 00 02 90 FE 26           5 	.ascii "SPIWR"
      00A040 CF A6                    6 	.word spi_write 
      0023A1                       6392 	_dict_entry,6,SPISEL,spi_select
      00A042 0D CD                    1 	.word LINK 
                           0023A3     2 	LINK=.
      0023A3                          3 SPISEL:
      00A044 83                       4 	.byte 6 	
      00A045 20 5F 7B 03 97 CD        5 	.ascii "SPISEL"
      00A04B 8A 3C                    6 	.word spi_select 
      0023AC                       6393 	_dict_entry,5,SPIEN,spi_enable 
      00A04D AE A0                    1 	.word LINK 
                           0023AE     2 	LINK=.
      0023AE                          3 SPIEN:
      00A04F 56                       4 	.byte 5 	
      00A050 CD 83 33 5B 03           5 	.ascii "SPIEN"
      00A055 81 20                    6 	.word spi_enable 
      0023B6                       6394 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A057 77 6F                    1 	.word LINK 
                           0023B8     2 	LINK=.
      0023B8                          3 SPIRD:
      00A059 72                       4 	.byte 5+F_IFUNC 	
      00A05A 64 73 20 69 6E           5 	.ascii "SPIRD"
      00A05F 20 64                    6 	.word spi_read 
      0023C0                       6395 	_dict_entry,5,SLEEP,sleep 
      00A061 69 63                    1 	.word LINK 
                           0023C2     2 	LINK=.
      0023C2                          3 SLEEP:
      00A063 74                       4 	.byte 5 	
      00A064 69 6F 6E 61 72           5 	.ascii "SLEEP"
      00A069 79 0A                    6 	.word sleep 
      0023CA                       6396 	_dict_entry,4+F_IFUNC,SIZE,size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A06B 00 C2                    1 	.word LINK 
                           0023CC     2 	LINK=.
      00A06C                          3 SIZE:
      00A06C CD                       4 	.byte 4+F_IFUNC 	
      00A06D 90 FF A1 01              5 	.ascii "SIZE"
      00A071 27 03                    6 	.word size 
      0023D3                       6397     _dict_entry,4,SHOW,show 
      00A073 CC 88                    1 	.word LINK 
                           0023D5     2 	LINK=.
      0023D5                          3 SHOW:
      00A075 F5                       4 	.byte 4 	
      00A076 53 48 4F 57              5 	.ascii "SHOW"
      00A076 85 CF                    6 	.word show 
      0023DC                       6398 	_dict_entry,4,SAVE,save
      00A078 00 11                    1 	.word LINK 
                           0023DE     2 	LINK=.
      0023DE                          3 SAVE:
      00A07A 81                       4 	.byte 4 	
      00A07B 53 41 56 45              5 	.ascii "SAVE"
      00A07B CE 00                    6 	.word save 
      0023E5                       6399 	_dict_entry 3,RUN,run
      00A07D 11 DE                    1 	.word LINK 
                           0023E7     2 	LINK=.
      00A07E                          3 RUN:
      00A07E 53                       4 	.byte 3 	
      00A07F A3 FF FF                 5 	.ascii "RUN"
      00A082 27 01                    6 	.word run 
      0023ED                       6400 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A084 5F A6                    1 	.word LINK 
                           0023EF     2 	LINK=.
      0023EF                          3 RSHIFT:
      00A086 84                       4 	.byte 6+F_IFUNC 	
      00A087 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A088 1E 89                    6 	.word rshift 
      0023F8                       6401 	_dict_entry,3+F_IFUNC,RND,random 
      00A088 CD 90                    1 	.word LINK 
                           0023FA     2 	LINK=.
      0023FA                          3 RND:
      00A08A FA                       4 	.byte 3+F_IFUNC 	
      00A08B A1 01 27                 5 	.ascii "RND"
      00A08E 03 CC                    6 	.word random 
      002400                       6402 	_dict_entry,6,RETURN,return 
      00A090 88 F5                    1 	.word LINK 
                           002402     2 	LINK=.
      002402                          3 RETURN:
      00A092 85                       4 	.byte 6 	
      00A093 20 E9 54 55 52 4E        5 	.ascii "RETURN"
      00A095 17 90                    6 	.word return 
      00240B                       6403 	_dict_entry,7,RESTORE,restore 
      00A095 CD 90                    1 	.word LINK 
                           00240D     2 	LINK=.
      00240D                          3 RESTORE:
      00A097 FF                       4 	.byte 7 	
      00A098 A1 01 27 03 CC 88 F5     5 	.ascii "RESTORE"
      00A09F 85 4B                    6 	.word restore 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      002417                       6404 	_dict_entry 6,REMARK,remark 
      00A0A1 00 35                    1 	.word LINK 
                           002419     2 	LINK=.
      002419                          3 REMARK:
      00A0A3 CC                       4 	.byte 6 	
      00A0A4 50 E0 9E A4 3F 95        5 	.ascii "REMARK"
      00A0AA A3 00                    6 	.word remark 
      002422                       6405 	_dict_entry,6,REBOOT,cold_start
      00A0AC FF 23                    1 	.word LINK 
                           002424     2 	LINK=.
      002424                          3 REBOOT:
      00A0AE 06                       4 	.byte 6 	
      00A0AF 0C 01 98 56 20 F5        5 	.ascii "REBOOT"
      00A0B5 35 55                    6 	.word cold_start 
      00242D                       6406 	_dict_entry,4+F_IFUNC,READ,read  
      00A0B7 50 E0                    1 	.word LINK 
                           00242F     2 	LINK=.
      00242F                          3 READ:
      00A0B9 84                       4 	.byte 4+F_IFUNC 	
      00A0BA C7 50 E1 9F              5 	.ascii "READ"
      00A0BE 4A 35                    6 	.word read 
      002436                       6407 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0C0 55 50                    1 	.word LINK 
                           002438     2 	LINK=.
      002438                          3 QKEY:
      00A0C2 E0                       4 	.byte 4+F_IFUNC 	
      00A0C3 C7 50 E2 35              5 	.ascii "QKEY"
      00A0C7 AA 50                    6 	.word qkey 
      00243F                       6408 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0C9 E0 81                    1 	.word LINK 
                           002441     2 	LINK=.
      00A0CB                          3 PRTI:
      00A0CB 35                       4 	.byte 4+F_IFUNC 	
      00A0CC AA 50 E0 81              5 	.ascii "PRTI"
      00A0D0 21 07                    6 	.word const_porti 
      002448                       6409 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0D0 CD 90                    1 	.word LINK 
                           00244A     2 	LINK=.
      00244A                          3 PRTH:
      00A0D2 FA                       4 	.byte 4+F_IFUNC 	
      00A0D3 A1 01 27 03              5 	.ascii "PRTH"
      00A0D7 CC 88                    6 	.word const_porth 
      002451                       6410 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0D9 F5 85                    1 	.word LINK 
                           002453     2 	LINK=.
      00A0DB                          3 PRTG:
      00A0DB 5D                       4 	.byte 4+F_IFUNC 	
      00A0DC 27 0A A6 0F              5 	.ascii "PRTG"
      00A0E0 59 25                    6 	.word const_portg 
      00245A                       6411 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0E2 03 4A                    1 	.word LINK 
                           00245C     2 	LINK=.
      00245C                          3 PRTF:
      00A0E4 20                       4 	.byte 4+F_IFUNC 	
      00A0E5 FA 5F 97 A6              5 	.ascii "PRTF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A0E9 84 81                    6 	.word const_portf 
      00A0EB                       6412 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A0EB CD 90                    1 	.word LINK 
                           002465     2 	LINK=.
      002465                          3 PRTE:
      00A0ED FA                       4 	.byte 4+F_IFUNC 	
      00A0EE A1 01 27 03              5 	.ascii "PRTE"
      00A0F2 CC 88                    6 	.word const_porte 
      00246C                       6413 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0F4 F5 85                    1 	.word LINK 
                           00246E     2 	LINK=.
      00246E                          3 PRTD:
      00A0F6 9F                       4 	.byte 4+F_IFUNC 	
      00A0F7 A4 0F 5F 5C              5 	.ascii "PRTD"
      00A0FB 4D 27                    6 	.word const_portd 
      002475                       6414 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A0FD 04 58                    1 	.word LINK 
                           002477     2 	LINK=.
      002477                          3 PRTC:
      00A0FF 4A                       4 	.byte 4+F_IFUNC 	
      00A100 20 F9 A6 84              5 	.ascii "PRTC"
      00A104 81 E3                    6 	.word const_portc 
      00A105                       6415 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A105 CD 90                    1 	.word LINK 
                           002480     2 	LINK=.
      002480                          3 PRTB:
      00A107 FA                       4 	.byte 4+F_IFUNC 	
      00A108 A1 01 27 03              5 	.ascii "PRTB"
      00A10C CC 88                    6 	.word const_portb 
      002487                       6416 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A10E F5 85                    1 	.word LINK 
                           002489     2 	LINK=.
      002489                          3 PRTA:
      00A110 53                       4 	.byte 4+F_IFUNC 	
      00A111 A6 84 81 41              5 	.ascii "PRTA"
      00A114 20 D7                    6 	.word const_porta 
      002490                       6417 	_dict_entry 5,PRINT,print 
      00A114 85 52                    1 	.word LINK 
                           002492     2 	LINK=.
      002492                          3 PRINT:
      00A116 04                       4 	.byte 5 	
      00A117 89 90 CE 00 05           5 	.ascii "PRINT"
      00A11C 17 03                    6 	.word print 
      00249A                       6418 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A11E 90 CE                    1 	.word LINK 
                           00249C     2 	LINK=.
      00249C                          3 POUT:
      00A120 00                       4 	.byte 4+F_IFUNC 	
      00A121 01 17 05 72              5 	.ascii "POUT"
      00A125 5C 00                    6 	.word const_output 
      0024A3                       6419 	_dict_entry,4,POKE,poke 
      00A127 21 81                    1 	.word LINK 
                           0024A5     2 	LINK=.
      00A129                          3 POKE:
      00A129 72                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A12A 5D 00 21 26              5 	.ascii "POKE"
      00A12E 03 CC                    6 	.word poke 
      0024AC                       6420 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A130 88 F5                    1 	.word LINK 
                           0024AE     2 	LINK=.
      00A132                          3 PINP:
      00A132 CD                       4 	.byte 4+F_IFUNC 	
      00A133 92 41 A1 84              5 	.ascii "PINP"
      00A137 27 03                    6 	.word const_input 
      0024B5                       6421 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A139 CC 88                    1 	.word LINK 
                           0024B7     2 	LINK=.
      0024B7                          3 PEEK:
      00A13B F5                       4 	.byte 4+F_IFUNC 	
      00A13C 50 45 45 4B              5 	.ascii "PEEK"
      00A13C 5D 26                    6 	.word peek 
      0024BE                       6422 	_dict_entry,5,PMODE,pin_mode 
      00A13E 10 1E                    1 	.word LINK 
                           0024C0     2 	LINK=.
      0024C0                          3 PMODE:
      00A140 03                       4 	.byte 5 	
      00A141 CF 00 05 E6 02           5 	.ascii "PMODE"
      00A146 C7 00                    6 	.word pin_mode 
      0024C8                       6423 	_dict_entry,5,PAUSE,pause 
      00A148 04 1E                    1 	.word LINK 
                           0024CA     2 	LINK=.
      0024CA                          3 PAUSE:
      00A14A 05                       4 	.byte 5 	
      00A14B CF 00 01 81 45           5 	.ascii "PAUSE"
      00A14F 1D B2                    6 	.word pause 
      0024D2                       6424 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A14F 85 5B                    1 	.word LINK 
                           0024D4     2 	LINK=.
      0024D4                          3 PAD:
      00A151 04                       4 	.byte 3+F_IFUNC 	
      00A152 72 5A 00                 5 	.ascii "PAD"
      00A155 21 FC                    6 	.word pad_ref 
      00A157                       6425 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A157 AE 00                    1 	.word LINK 
                           0024DC     2 	LINK=.
      0024DC                          3 OR:
      00A159 00                       4 	.byte 2+F_IFUNC 	
      00A15A A6 84                    5 	.ascii "OR"
      00A15C 81 40                    6 	.word bit_or 
      00A15D                       6426 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A15D AE 00                    1 	.word LINK 
                           0024E3     2 	LINK=.
      0024E3                          3 ODR:
      00A15F 01                       4 	.byte 3+F_IFUNC 	
      00A160 A6 84 81                 5 	.ascii "ODR"
      00A163 21 0D                    6 	.word const_odr 
      0024E9                       6427 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A163 AE 00                    1 	.word LINK 
                           0024EB     2 	LINK=.
      0024EB                          3 NOT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A165 02                       4 	.byte 3+F_IFUNC 	
      00A166 A6 84 81                 5 	.ascii "NOT"
      00A169 20 08                    6 	.word func_not 
      0024F1                       6428 	_dict_entry,3,NEW,new
      00A169 AE 00                    1 	.word LINK 
                           0024F3     2 	LINK=.
      0024F3                          3 NEW:
      00A16B 03                       4 	.byte 3 	
      00A16C A6 84 81                 5 	.ascii "NEW"
      00A16F 19 79                    6 	.word new 
      0024F9                       6429 	_dict_entry,4,NEXT,next 
      00A16F AE 00                    1 	.word LINK 
                           0024FB     2 	LINK=.
      0024FB                          3 NEXT:
      00A171 04                       4 	.byte 4 	
      00A172 A6 84 81 54              5 	.ascii "NEXT"
      00A175 16 F5                    6 	.word next 
      002502                       6430 	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
      00A175 AE 00                    1 	.word LINK 
                           002504     2 	LINK=.
      002504                          3 MULDIV:
      00A177 05                       4 	.byte 6+F_IFUNC 	
      00A178 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A17B 0F D2                    6 	.word muldiv 
      00250D                       6431 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A17B AE 00                    1 	.word LINK 
                           00250F     2 	LINK=.
      00250F                          3 LSHIFT:
      00A17D 06                       4 	.byte 6+F_IFUNC 	
      00A17E A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A181 1E 70                    6 	.word lshift 
      002518                       6432 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A181 AE 00                    1 	.word LINK 
                           00251A     2 	LINK=.
      00251A                          3 LOG:
      00A183 07                       4 	.byte 3+F_IFUNC 	
      00A184 A6 84 81                 5 	.ascii "LOG"
      00A187 20 50                    6 	.word log2 
      002520                       6433 	_dict_entry,4,LOAD,load 
      00A187 AE 00                    1 	.word LINK 
                           002522     2 	LINK=.
      002522                          3 LOAD:
      00A189 08                       4 	.byte 4 	
      00A18A A6 84 81 44              5 	.ascii "LOAD"
      00A18D 1B 64                    6 	.word load 
      002529                       6434 	_dict_entry 4,LIST,list
      00A18D A6 84                    1 	.word LINK 
                           00252B     2 	LINK=.
      00252B                          3 LIST:
      00A18F AE                       4 	.byte 4 	
      00A190 00 00 81 54              5 	.ascii "LIST"
      00A193 12 BE                    6 	.word list 
      002532                       6435 	_dict_entry 3,LET,let 
      00A193 A6 84                    1 	.word LINK 
                           002534     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      002534                          3 LET:
      00A195 AE                       4 	.byte 3 	
      00A196 00 01 81                 5 	.ascii "LET"
      00A199 12 93                    6 	.word let 
      00253A                       6436 	_dict_entry,3+F_IFUNC,KEY,key 
      00A199 A6 84                    1 	.word LINK 
                           00253C     2 	LINK=.
      00253C                          3 KEY:
      00A19B AE                       4 	.byte 3+F_IFUNC 	
      00A19C 00 02 81                 5 	.ascii "KEY"
      00A19F 1C E6                    6 	.word key 
      002542                       6437 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A19F A6 84                    1 	.word LINK 
                           002544     2 	LINK=.
      002544                          3 IWDGREF:
      00A1A1 AE                       4 	.byte 7 	
      00A1A2 00 03 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1A5 20 4B                    6 	.word refresh_iwdg 
      00254E                       6438 	_dict_entry,6,IWDGEN,enable_iwdg
      00A1A5 A6 84                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 IWDGEN:
      00A1A7 AE                       4 	.byte 6 	
      00A1A8 00 04 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1AB 20 15                    6 	.word enable_iwdg 
      002559                       6439 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A1AB A6 84                    1 	.word LINK 
                           00255B     2 	LINK=.
      00255B                          3 INVERT:
      00A1AD AE                       4 	.byte 6+F_IFUNC 	
      00A1AE 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A1B1 20 85                    6 	.word invert 
      002564                       6440 	_dict_entry,5,INPUT,input_var  
      00A1B1 A6 84                    1 	.word LINK 
                           002566     2 	LINK=.
      002566                          3 INPUT:
      00A1B3 AE                       4 	.byte 5 	
      00A1B4 00 00 81 55 54           5 	.ascii "INPUT"
      00A1B7 15 52                    6 	.word input_var 
      00256E                       6441 	_dict_entry,2,IF,if 
      00A1B7 A6 84                    1 	.word LINK 
                           002570     2 	LINK=.
      002570                          3 IF:
      00A1B9 AE                       4 	.byte 2 	
      00A1BA 40 00                    5 	.ascii "IF"
      00A1BC 81 61                    6 	.word if 
      00A1BD                       6442 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1BD 55 00                    1 	.word LINK 
                           002577     2 	LINK=.
      002577                          3 IDR:
      00A1BF 04                       4 	.byte 3+F_IFUNC 	
      00A1C0 00 02 81                 5 	.ascii "IDR"
      00A1C3 21 13                    6 	.word const_idr 
      00257D                       6443 	_dict_entry,3,HEX,hex_base
      00A1C3 CD 91                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                           00257F     2 	LINK=.
      00257F                          3 HEX:
      00A1C5 F8                       4 	.byte 3 	
      00A1C6 A1 84 27                 5 	.ascii "HEX"
      00A1C9 03 CC                    6 	.word hex_base 
      002585                       6444 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1CB 88 F5                    1 	.word LINK 
                           002587     2 	LINK=.
      002587                          3 GPIO:
      00A1CD CD                       4 	.byte 4+F_IFUNC 	
      00A1CE 84 80 5D 26              5 	.ascii "GPIO"
      00A1D2 05 A6                    6 	.word gpio 
      00258E                       6445 	_dict_entry,4,GOTO,goto 
      00A1D4 05 CC                    1 	.word LINK 
                           002590     2 	LINK=.
      002590                          3 GOTO:
      00A1D6 88                       4 	.byte 4 	
      00A1D7 F7 4F 54 4F              5 	.ascii "GOTO"
      00A1D8 17 55                    6 	.word goto 
      002597                       6446 	_dict_entry,5,GOSUB,gosub 
      00A1D8 90 93                    1 	.word LINK 
                           002599     2 	LINK=.
      002599                          3 GOSUB:
      00A1DA EE                       4 	.byte 5 	
      00A1DB 04 A3 A1 BD 26           5 	.ascii "GOSUB"
      00A1E0 F2 90                    6 	.word gosub 
      0025A1                       6447 	_dict_entry,6,FORGET,forget 
      00A1E2 CF 00                    1 	.word LINK 
                           0025A3     2 	LINK=.
      0025A3                          3 FORGET:
      00A1E4 07                       4 	.byte 6 	
      00A1E5 90 E6 02 C7 00 0A        5 	.ascii "FORGET"
      00A1EB 35 06                    6 	.word forget 
      0025AC                       6448 	_dict_entry,3,FOR,for 
      00A1ED 00 09                    1 	.word LINK 
                           0025AE     2 	LINK=.
      0025AE                          3 FOR:
      00A1EF 81                       4 	.byte 3 	
      00A1F0 46 4F 52                 5 	.ascii "FOR"
      00A1F0 72 5F                    6 	.word for 
      0025B4                       6449 	_dict_entry,6,FILETX,file_transmit
      00A1F2 00 07                    1 	.word LINK 
                           0025B6     2 	LINK=.
      0025B6                          3 FILETX:
      00A1F4 72                       4 	.byte 6 	
      00A1F5 5F 00 08 72 5F 00        5 	.ascii "FILETX"
      00A1FB 09 72                    6 	.word file_transmit 
      0025BF                       6450 	_dict_entry,6,FILERX,file_receive 
      00A1FD 5F 00                    1 	.word LINK 
                           0025C1     2 	LINK=.
      0025C1                          3 FILERX:
      00A1FF 0A                       4 	.byte 6 	
      00A200 CE 00 1D 45 52 58        5 	.ascii "FILERX"
      00A203 22 CC                    6 	.word file_receive 
      0025CA                       6451 	_dict_entry,4,FCPU,fcpu 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A203 C3 00                    1 	.word LINK 
                           0025CC     2 	LINK=.
      0025CC                          3 FCPU:
      00A205 1F                       4 	.byte 4 	
      00A206 24 17 90 93              5 	.ascii "FCPU"
      00A20A EE 04                    6 	.word fcpu 
      0025D3                       6452 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A20C A3 A1                    1 	.word LINK 
                           0025D5     2 	LINK=.
      0025D5                          3 EEPROM:
      00A20E BD                       4 	.byte 6+F_IFUNC 	
      00A20F 26 1A 90 CF 00 07        5 	.ascii "EEPROM"
      00A215 90 E6                    6 	.word const_eeprom_base 
      0025DE                       6453 	_dict_entry,3,END,cmd_end  
      00A217 02 C7                    1 	.word LINK 
                           0025E0     2 	LINK=.
      0025E0                          3 END:
      00A219 00                       4 	.byte 3 	
      00A21A 0A 35 06                 5 	.ascii "END"
      00A21D 00 09                    6 	.word cmd_end 
      0025E6                       6454 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A21F 72 5D                    1 	.word LINK 
                           0025E8     2 	LINK=.
      0025E8                          3 DWRITE:
      00A221 00                       4 	.byte 6+F_CMD 	
      00A222 0A 26 05 A6 0C CC        5 	.ascii "DWRITE"
      00A228 88 F7                    6 	.word digital_write 
      0025F1                       6455 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A22A 81 E8                    1 	.word LINK 
                           0025F3     2 	LINK=.
      00A22B                          3 DREAD:
      00A22B 93                       4 	.byte 5+F_IFUNC 	
      00A22C E6 02 C7 00 0E           5 	.ascii "DREAD"
      00A231 72 5F                    6 	.word digital_read 
      0025FB                       6456 	_dict_entry,2,DO,do_loop
      00A233 00 0D                    1 	.word LINK 
                           0025FD     2 	LINK=.
      0025FD                          3 DO:
      00A235 72                       4 	.byte 2 	
      00A236 BB 00                    5 	.ascii "DO"
      00A238 0D 20                    6 	.word do_loop 
      002602                       6457 	_dict_entry,3,DIR,directory 
      00A23A C8 FD                    1 	.word LINK 
                           002604     2 	LINK=.
      00A23B                          3 DIR:
      00A23B 52                       4 	.byte 3 	
      00A23C 06 49 52                 5 	.ascii "DIR"
      00A23D 1B FB                    6 	.word directory 
      00260A                       6458 	_dict_entry,3,DEC,dec_base
      00A23D C6 00                    1 	.word LINK 
                           00260C     2 	LINK=.
      00260C                          3 DEC:
      00A23F 09                       4 	.byte 3 	
      00A240 C1 00 0A                 5 	.ascii "DEC"
      00A243 27 37                    6 	.word dec_base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      002612                       6459 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A245 CD 95                    1 	.word LINK 
                           002614     2 	LINK=.
      002614                          3 DDR:
      00A247 B2                       4 	.byte 3+F_IFUNC 	
      00A248 CE 00 07                 5 	.ascii "DDR"
      00A24B CF 00                    6 	.word const_ddr 
      00261A                       6460 	_dict_entry,6,DATALN,data_line  
      00A24D 05 55                    1 	.word LINK 
                           00261C     2 	LINK=.
      00261C                          3 DATALN:
      00A24F 00                       4 	.byte 6 	
      00A250 09 00 02 55 00 0A        5 	.ascii "DATALN"
      00A256 00 04                    6 	.word data_line 
      002625                       6461 	_dict_entry,4,DATA,data  
      00A258 CD 91                    1 	.word LINK 
                           002627     2 	LINK=.
      002627                          3 DATA:
      00A25A F8                       4 	.byte 4 	
      00A25B A1 84 27 03              5 	.ascii "DATA"
      00A25F CC 88                    6 	.word data 
      00262E                       6462 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A261 F5 27                    1 	.word LINK 
                           002630     2 	LINK=.
      00A262                          3 CRL:
      00A262 1F                       4 	.byte 3+F_IFUNC 	
      00A263 05 CD 89                 5 	.ascii "CRL"
      00A266 E7 CE                    6 	.word const_cr1 
      002636                       6463 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A268 00 05                    1 	.word LINK 
                           002638     2 	LINK=.
      002638                          3 CRH:
      00A26A CF                       4 	.byte 3+F_IFUNC 	
      00A26B 00 07 55                 5 	.ascii "CRH"
      00A26E 00 02                    6 	.word const_cr2 
      00263E                       6464 	_dict_entry,4+F_CFUNC,CHAR,char
      00A270 00 09                    1 	.word LINK 
                           002640     2 	LINK=.
      002640                          3 CHAR:
      00A272 CD                       4 	.byte 4+F_CFUNC 	
      00A273 95 C2 1E 05              5 	.ascii "CHAR"
      00A277 A6 84                    6 	.word char 
      002647                       6465 	_dict_entry,3,BYE,bye 
      00A279 5B 06                    1 	.word LINK 
                           002649     2 	LINK=.
      002649                          3 BYE:
      00A27B 81                       4 	.byte 3 	
      00A27C 42 59 45                 5 	.ascii "BYE"
      00A27C 90 CE                    6 	.word bye 
      00264F                       6466 	_dict_entry,5,BTOGL,bit_toggle
      00A27E 00 07                    1 	.word LINK 
                           002651     2 	LINK=.
      002651                          3 BTOGL:
      00A280 72                       4 	.byte 5 	
      00A281 5F 00 07 72 5F           5 	.ascii "BTOGL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A286 00 08                    6 	.word bit_toggle 
      002659                       6467 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A288 72 5F                    1 	.word LINK 
                           00265B     2 	LINK=.
      00265B                          3 BTEST:
      00A28A 00                       4 	.byte 5+F_IFUNC 	
      00A28B 09 72 5F 00 0A           5 	.ascii "BTEST"
      00A290 CD A2                    6 	.word bit_test 
      002663                       6468 	_dict_entry,4,BSET,bit_set 
      00A292 2B 20                    1 	.word LINK 
                           002665     2 	LINK=.
      002665                          3 BSET:
      00A294 A8                       4 	.byte 4 	
      00A295 42 53 45 54              5 	.ascii "BSET"
      00A295 CD 90                    6 	.word bit_set 
      00266C                       6469 	_dict_entry,4,BRES,bit_reset
      00A297 FF A1                    1 	.word LINK 
                           00266E     2 	LINK=.
      00266E                          3 BRES:
      00A299 02                       4 	.byte 4 	
      00A29A 27 03 CC 88              5 	.ascii "BRES"
      00A29E F5 F9                    6 	.word bit_reset 
      00A29F                       6470 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A29F 72 12                    1 	.word LINK 
                           002677     2 	LINK=.
      002677                          3 BIT:
      00A2A1 50                       4 	.byte 3+F_IFUNC 	
      00A2A2 C7 85 5D                 5 	.ascii "BIT"
      00A2A5 27 21                    6 	.word bitmask 
      00267D                       6471 	_dict_entry,3,AWU,awu 
      00A2A7 85 A6                    1 	.word LINK 
                           00267F     2 	LINK=.
      00267F                          3 AWU:
      00A2A9 08                       4 	.byte 3 	
      00A2AA 42 9F C7                 5 	.ascii "AWU"
      00A2AD 52 00                    6 	.word awu 
      002685                       6472 	_dict_entry,7,AUTORUN,autorun
      00A2AF 72 1A                    1 	.word LINK 
                           002687     2 	LINK=.
      002687                          3 AUTORUN:
      00A2B1 50                       4 	.byte 7 	
      00A2B2 14 72 1A 50 16 72 14     5 	.ascii "AUTORUN"
      00A2B9 52 00                    6 	.word autorun 
      002691                       6473 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A2BB 72 12                    1 	.word LINK 
                           002693     2 	LINK=.
      002693                          3 ASC:
      00A2BD 52                       4 	.byte 3+F_IFUNC 	
      00A2BE 01 72 10                 5 	.ascii "ASC"
      00A2C1 52 01                    6 	.word ascii 
      002699                       6474 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2C3 72 1C                    1 	.word LINK 
                           00269B     2 	LINK=.
      00269B                          3 AND:
      00A2C5 52                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A2C6 00 81 44                 5 	.ascii "AND"
      00A2C8 1E 28                    6 	.word bit_and 
      0026A1                       6475 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2C8 5B 02                    1 	.word LINK 
                           0026A3     2 	LINK=.
      0026A3                          3 ADCREAD:
      00A2CA A6                       4 	.byte 7+F_IFUNC 	
      00A2CB 82 C4 52 03 A1 02 26     5 	.ascii "ADCREAD"
      00A2D2 F7 72                    6 	.word analog_read 
      0026AD                       6476 	_dict_entry,5,ADCON,power_adc 
      00A2D4 1D 52                    1 	.word LINK 
                           0026AF     2 	LINK=.
      0026AF                          3 ADCON:
      00A2D6 00                       4 	.byte 5 	
      00A2D7 72 13 50 C7 72           5 	.ascii "ADCON"
      00A2DC 1B 50                    6 	.word power_adc 
      0026B7                       6477 kword_dict:
      0026B7                       6478 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2DE 16 81                    1 	.word LINK 
                           0026B9     2 	LINK=.
      00A2E0                          3 ABS:
      00A2E0 A6                       4 	.byte 3+F_IFUNC 	
      00A2E1 78 C5 52                 5 	.ascii "ABS"
      00A2E4 03 27                    6 	.word abs 
                                   6479 	
                                   6480 
      002700                       6481 	.bndry 128 ; align on FLASH block.
                                   6482 ; free space for user application  
      002700                       6483 user_space:
                                   6484 ; USR() function test
      00A2E6 04               [ 2] 6485 	pushw x 
      00A2E7 72 5F 52 03      [ 1] 6486 	bset PC_ODR,#5 
      00A2EB 81               [ 2] 6487 	popw x 
      00A2EC CD 1D BC         [ 4] 6488 	call pause02 
      00A2EC 88 CD A2 E0      [ 1] 6489 	bres PC_ODR,#5 
      00A2F0 84               [ 4] 6490 	ret
                                   6491 
                                   6492 	.area FLASH_DRIVE (ABS)
      010000                       6493 	.org 0x10000
      010000                       6494 fdrive:
                                   6495 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026B9 R   |     ACK     =  000006 
  5 ADCON      0026AF R   |   5 ADCREAD    0026A3 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        00269B R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        002693 R
    ATTRIB  =  000002     |   5 AUTORUN    002687 R   |     AUTORUN_=  004000 
  5 AWU        00267F R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
  5 BIT        002677 R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       00266E R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       002665 R   |     BSIZE   =  000001 
  5 BTEST      00265B R   |   5 BTOGL      002651 R   |     BTW     =  000001 
  5 BYE        002649 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       002640 R
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002638 R
  5 CRL        002630 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       002627 R   |   5 DATALN     00261C R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        002614 R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000000     |   5 DEC        00260C R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002604 R   |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0025FD R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0025F3 R   |   5 DWRITE     0025E8 R   |   5 EEPROM     0025D5 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        0025E0 R   |     ENQ     =  000005 
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
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025CC R
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
  5 FILERX     0025C1 R   |   5 FILETX     0025B6 R   |     FIRST   =  000001 
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
  5 FOR        0025AE R   |   5 FORGET     0025A3 R   |     FRUN    =  000000 
    FS      =  00001C     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002599 R   |   5 GOTO       002590 R   |   5 GPIO       002587 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   5 HEX        00257F R
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
    I2C_WRIT=  000000     |   5 IDR        002577 R   |   5 IF         002570 R
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      002566 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  5 INVERT     00255B R   |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     002550 R   |   5 IWDGREF    002544 R
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00253C R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        002534 R   |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   5 LINK    =  0026B9 R
  5 LIST       00252B R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       002522 R
  5 LOG        00251A R   |   5 LSHIFT     00250F R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   5 MULDIV     002504 R   |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0024F3 R   |     NEW_FREE=  000001     |   5 NEXT       0024FB R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        0024EB R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        0024E3 R   |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024DC R
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        0024D4 R
    PAD_SIZE=  000080     |   5 PAUSE      0024CA R   |     PA_BASE =  005000 
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
  5 PEEK       0024B7 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       0024AE R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0024C0 R
  5 POKE       0024A5 R   |     PORT    =  000003     |   5 POUT       00249C R
    PREV    =  000001     |   5 PRINT      002492 R   |   5 PRTA       002489 R
  5 PRTB       002480 R   |   5 PRTC       002477 R   |   5 PRTD       00246E R
  5 PRTE       002465 R   |   5 PRTF       00245C R   |   5 PRTG       002453 R
  5 PRTH       00244A R   |   5 PRTI       002441 R   |     PSTR    =  000003 
  5 QKEY       002438 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       00242F R   |   5 REBOOT     002424 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     002419 R
  5 RESTORE    00240D R   |     RETL1   =  000001     |   5 RETURN     002402 R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0023FA R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0023EF R
    RST_SR  =  0050B3     |   5 RUN        0023E7 R   |     RXCHAR  =  000001 
  5 SAVE       0023DE R   |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0023D5 R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0023CC R
    SKIP    =  000005     |   5 SLEEP      0023C2 R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |     SPCNT   =  000001 
  5 SPIEN      0023AE R   |   5 SPIRD      0023B8 R   |   5 SPISEL     0023A3 R
  5 SPIWR      002399 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002390 R   |   5 STOP       002387 R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      00237D R
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
    TIM4_SR_=  000000     |   5 TIMEOUT    002367 R   |   5 TIMER      002373 R
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
  5 TO         002360 R   |   5 TONE       002357 R   |   5 Timer4Up   000037 R
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
    UBC     =  004801     |   5 UBOUND     00234C R   |   5 UBTN_Han   00007A R
  5 UFLASH     002341 R   |   5 UNTIL      002337 R   |     US      =  00001F 
  5 USER_ABO   000082 R   |   5 USR        00232F R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 Uart1RxH   00000F R
  5 UserButt   00004D R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002326 R
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      00231C R
  5 WRITE      002312 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        00230A R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E14 R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   000B2F R   |   5 add_char   0014A1 R
  5 analog_r   00188E R   |   5 ansi_seq   000AF1 R   |   5 arduino_   001EFF R
  5 arg_list   00107F R   |   1 array_si   000021 R   |   5 ascii      001CC6 R
  5 at_tst     000D36 R   |   5 atoi24     000E47 R   |   5 atoi_exi   000EAD R
  5 autorun    001D4F R   |   5 autorun_   0006CC R   |   5 awu        001DC5 R
  5 awu02      001DCF R   |   5 bad_port   001D1E R   |   1 base       00000A R
  1 basicptr   000004 R   |   5 beep       00181B R   |   5 bin_exit   000C14 R
  5 bit_and    001E28 R   |   5 bit_or     001E40 R   |   5 bit_rese   0015F9 R
  5 bit_set    0015E9 R   |   5 bit_test   00161A R   |   5 bit_togg   00160A R
  5 bit_xor    001E58 R   |   5 bitmask    00206B R   |   5 bkslsh_t   000CE3 R
  5 bksp       0002BD R   |   5 block_er   0001A3 R   |   5 break_po   00195B R
  5 bye        001D46 R   |   5 cancel_a   000694 R   |   5 char       001CB4 R
  5 clear_ba   0006E1 R   |   5 clear_va   00055D R   |   5 clock_in   00009D R
  5 cmd_end    001807 R   |   5 cmd_line   0008FF R   |   5 cmd_name   000FEE R
  5 cmp_name   0019FC R   |   5 cold_sta   0005CB R   |   5 colon_ts   000D0A R
  5 comma_ts   000D15 R   |   5 comp_msg   000855 R   |   5 compile    0004EA R
  5 const_cr   00211F R   |   5 const_cr   002125 R   |   5 const_dd   002119 R
  5 const_ee   002137 R   |   5 const_id   002113 R   |   5 const_in   002131 R
  5 const_od   00210D R   |   5 const_ou   00212B R   |   5 const_po   0020D7 R
  5 const_po   0020DD R   |   5 const_po   0020E3 R   |   5 const_po   0020E9 R
  5 const_po   0020EF R   |   5 const_po   0020F5 R   |   5 const_po   0020FB R
  5 const_po   002101 R   |   5 const_po   002107 R   |   5 convert_   000B8B R
  5 copy_com   000D6B R   |   1 count      000003 R   |   5 cp_loop    00102E R
  5 create_g   000451 R   |   5 cs_high    0022C7 R   |   5 cstk_pro   001236 R
  5 dash_tst   000D2B R   |   5 data       00213D R   |   1 data_len   000009 R
  5 data_lin   002143 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002183 R   |   5 dbl_sign   000F56 R   |   5 dec_base   001262 R
  5 del_back   000B20 R   |   5 del_line   000424 R   |   5 del_ln     000B11 R
  5 delete     0002CD R   |   5 digital_   0018C2 R   |   5 digital_   0018F2 R
  5 dir_loop   001C07 R   |   5 director   001BFB R   |   5 disk_fre   0019E9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 div32_16   000F60 R   |   5 divide     000FB7 R   |   5 divu24_8   000A42 R
  5 dneg       000F4B R   |   5 do_loop    002094 R   |   5 do_progr   000196 R
  5 drive_fr   001C70 R   |   5 enable_i   002015 R   |   5 eql_tst    000DC0 R
  5 equal      0014B4 R   |   5 erase_fl   0001C2 R   |   5 err_bad_   0007C1 R
  5 err_buf_   000837 R   |   5 err_cmd_   000785 R   |   5 err_div0   00074A R
  5 err_dupl   00079F R   |   5 err_math   000731 R   |   5 err_mem_   000716 R
  5 err_msg    0006F6 R   |   5 err_no_a   0007CD R   |   5 err_no_d   000800 R
  5 err_no_f   000824 R   |   5 err_no_l   000759 R   |   5 err_no_p   000810 R
  5 err_not_   0007B0 R   |   5 err_run_   00076F R   |   5 err_synt   000723 R
  5 escaped    000BA0 R   |   5 expect     00106D R   |   5 expr_exi   0011BE R
  5 expressi   001178 R   |   5 factor     0010CF R   |   1 farptr     000016 R
  5 fcpu       001EA2 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001C68 R   |   5 file_rec   0022CC R   |   5 file_tra   002301 R
  5 final_te   000AEB R   |   5 first_li   0012E7 R   |   1 flags      000023 R
  5 for        001675 R   |   5 forget     001B94 R   |   1 free_ram   00005A R
  5 fsize_ms   0022F0 R   |   5 func_arg   00107A R   |   5 func_not   002008 R
  5 ge         0014B6 R   |   5 get_arra   0010AA R   |   5 get_targ   00173F R
  5 get_tick   001E0E R   |   5 get_toke   000C7C R   |   5 getc       0002A9 R
  5 gosub      001770 R   |   5 goto       001755 R   |   5 gpio       001CF9 R
  5 gt         0014B2 R   |   5 gt_tst     000DCB R   |   5 hex_base   00125D R
  5 hex_dump   000355 R   |   5 if         001661 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   0019A9 R
  5 input_ex   0015BB R   |   5 input_lo   001554 R   |   5 input_va   001552 R
  5 insert_l   00047D R   |   5 insert_l   0004E7 R   |   5 interp_l   000940 R
  5 interpre   00091B R   |   5 invert     002085 R   |   5 is_alpha   00056B R
  5 is_digit   00057C R   |   5 itoa       0009E8 R   |   5 itoa_loo   000A07 R
  5 jp_to_ta   001763 R   |   5 key        001CE6 R   |   5 kw_loop    000C30 R
  5 kword_di   0026B7 R   |   5 kword_en   002308 R   |   5 le         0014BB R
  5 leading_   00205B R   |   5 left_arr   000AF1 R   |   5 let        001293 R
  5 let_arra   0012A1 R   |   5 let_var    0012A4 R   |   5 lines_sk   0012EA R
  5 list       0012BE R   |   5 list_exi   001330 R   |   5 list_sta   00130A R
  5 load       001B64 R   |   5 load_aut   0006A3 R   |   5 load_fil   001B33 R
  5 log2       002050 R   |   5 logical_   001FFE R   |   5 long_div   000F33 R
  5 loop_bac   001722 R   |   1 loop_dep   000020 R   |   5 loop_don   001737 R
  5 lshift     001E70 R   |   5 lt         0014B9 R   |   5 lt_tst     000DF4 R
  5 modulo     000FCD R   |   5 move       0003BE R   |   5 move_dow   0003DC R
  5 move_era   000128 R   |   5 move_exi   0003FD R   |   5 move_loo   0003E1 R
  5 move_prg   00015C R   |   5 move_up    0003CE R   |   5 mul_char   0014A3 R
  5 muldiv     000FD2 R   |   5 multiply   000EFE R   |   5 mulu24_8   000A6A R
  5 nbr_tst    000CAF R   |   5 ne         0014BE R   |   5 neg_acc2   000AA4 R
  5 new        001979 R   |   5 next       0016F5 R   |   5 next_lin   000923 R
  5 next_tok   000967 R   |   5 no_match   001040 R   |   5 other      000E1D R
  3 pad        0016E0 R   |   5 pad_ref    002302 R   |   5 parse_bi   000BF2 R
  5 parse_in   000BA8 R   |   5 parse_ke   000C2F R   |   5 parse_qu   000B53 R
  5 pause      001DB2 R   |   5 pause02    001DBC R   |   5 peek       001650 R
  5 pin_mode   001EAE R   |   5 plus_tst   000D94 R   |   5 poke       001641 R
  5 power_ad   001852 R   |   5 prcnt_ts   000DB5 R   |   5 print      0014C1 R
  5 print_ex   001526 R   |   5 print_in   0009BC R   |   5 print_ty   001532 R
  5 program_   00013C R   |   5 program_   00015C R   |   5 prt_basi   00138B R
  5 prt_cmd_   001333 R   |   5 prt_loop   0014C5 R   |   5 prt_quot   001347 R
  5 prt_tok    0002E7 R   |   5 prti24     0009CC R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002A0 R   |   5 puts       0002B3 R
  5 qkey       001CEE GR  |   5 qmark_ts   000D41 R   |   5 random     001F1F R
  5 read       0021BB R   |   5 read01     0021BD R   |   5 readln     000AC7 R
  5 readln_l   000ACF R   |   5 readln_q   000B44 R   |   5 refresh_   00204B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 rel_exit   001219 R   |   5 relation   0011C1 R   |   5 relop_st   0014A6 R
  5 remark     0015BE R   |   5 reprint    000AF1 R   |   5 reset_co   0014C3 R
  5 rest_con   001542 R   |   5 restore    002170 R   |   5 return     001790 R
  5 right_ar   000AF1 R   |   5 row_alig   00198E R   |   5 row_eras   000101 R
  5 row_eras   000128 R   |   5 row_loop   000338 R   |   5 rparnt_t   000CFF R
  5 rshift     001E89 R   |   5 rt_msg     000844 R   |   5 run        0017AE R
  5 run_it     0017E0 R   |   1 rx_char    000025 R   |   5 save       001A6A R
  5 save_con   001532 R   |   5 search_d   001020 R   |   5 search_e   00106A R
  5 search_f   001A1D R   |   5 search_l   000400 R   |   5 search_l   000408 R
  5 search_n   001024 R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   0019B7 R   |   5 select_p   001EEF R   |   5 set_time   001FEC R
  5 sharp_ts   000D20 R   |   5 show       00121C R   |   5 show_row   000326 R
  5 single_c   00149C R   |   5 size       001267 R   |   5 skip       000EB1 R
  5 slash_ts   000DAA R   |   5 sleep      001DA7 R   |   5 software   000585 R
  5 spaces     0002DB R   |   5 spi_clea   002260 R   |   5 spi_disa   002248 R
  5 spi_enab   002215 R   |   5 spi_rcv_   002282 R   |   5 spi_read   0022AD R
  5 spi_sele   0022B5 R   |   5 spi_send   00226C R   |   5 spi_writ   00228D R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000D9F R
  5 step       0016CE R   |   5 stop       00192D R   |   5 store_lo   0016E2 R
  5 str_matc   00104D R   |   5 str_tst    000C9F R   |   5 strcmp     00039F R
  5 strcpy     0003B0 R   |   5 strlen     000392 R   |   5 syntax_e   000875 R
  1 tab_widt   000024 R   |   5 tb_error   000877 R   |   5 term       001129 R
  5 term01     001132 R   |   5 term_exi   001175 R   |   3 tib        001690 R
  5 tick_tst   000D59 R   |   1 ticks      00000E R   |   5 timeout    001FFB R
  1 timer      000010 R   |   5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R
  5 tk_id      000865 R   |   5 to         00169E R   |   5 to_eepro   00017F R
  5 to_flash   000193 R   |   5 to_upper   000E3B GR  |   5 token_ch   000E34 R
  5 token_ex   000E38 R   |   5 token_ms   00031E R   |   5 tone       00180E R
  5 try_next   0021AB R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_in   000265 R   |   5 uart1_se   000275 R   |   5 ubound     001271 R
  5 udiv32_1   000F21 R   |   5 uflash     001D23 R   |   5 umstar     000EC4 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R   |   5 until      0020A9 R
  5 user_int   000060 R   |   5 user_spa   002700 R   |   5 usr        001D29 R
  5 var_name   001383 R   |   1 vars       000026 R   |   5 wait       0015C4 R
  5 warm_ini   000676 R   |   5 warm_sta   0008FC R   |   5 words      001F86 R
  5 words_co   001FD6 R   |   5 write      001C7D R   |   5 write_bl   000242 R
  5 write_by   0001CD R   |   5 write_ee   000209 R   |   5 write_ex   00023D R
  5 write_fl   0001F3 R   |   5 write_ro   000170 R   |     xreceive   ****** GX
  5 zero_pad   001983 R

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

