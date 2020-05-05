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
      00000F                         72 par_level: .blkb 1 ; level of parenthesis in imbricated function callS
      000010                         73 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000012                         74 timer: .blkw 1 ;  milliseconds count down timer 
      000014                         75 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000016                         76 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000018                         77 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000019                         78 ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
      00001A                         79 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00001B                         80 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001E                         81 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      000020                         82 txtend: .blkw 1 ; tokenized BASIC text end address 
      000022                         83 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000023                         84 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000025                         85 flags: .blkb 1 ; various boolean flags
      000026                         86 tab_width: .blkb 1 ; print colon width (default 4)
      000027                         87 rx_char: .blkb 1 ; last received character from UART1 
      000028                         88 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     89 ; keep 'free_ram' as last variable 
      00005C                         90 free_ram: ; from here RAM free for BASIC text 
                                     91 
                                     92 ;;-----------------------------------
                                     93     .area SSEG (ABS)
                                     94 ;; working buffers and stack at end of RAM. 	
                                     95 ;;-----------------------------------
      001690                         96     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         97 tib: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         98 pad: .ds PAD_SIZE             ; working buffer
      001760                         99 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        100 stack_unf: ; stack underflow ; control_stack bottom 
                                    101 
                                    102 ;;--------------------------------------
                                    103     .area HOME 
                                    104 ;; interrupt vector table at 0x8000
                                    105 ;;--------------------------------------
      008000 82 00 85 6F            106     int cold_start			; RESET vector 
                           000000   107 .if DEBUG
                                    108 	int TrapHandler 		;TRAP  software interrupt
                           000001   109 .else
      008004 82 00 80 80            110 	int NonHandledInterrupt ;TRAP  software interrupt
                                    111 .endif
      008008 82 00 80 80            112 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            113 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            114 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            115 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            116 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            117 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            118 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 CD            119 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            120 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            121 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            122 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            123 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            124 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            125 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            126 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            127 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            128 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            129 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            130 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            131 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            132 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            133 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            134 	int NonHandledInterrupt ;int22 ADC2 end of conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008064 82 00 80 B7            135 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            136 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            137 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            138 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            139 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            140 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            141 	int NonHandledInterrupt ;int29  not used
                                    142 
                                    143 ;---------------------------------------
                                    144     .area CODE
                                    145 ;---------------------------------------
                           000000   146 .if DEBUG
                                    147 .asciz "STM8_TBI" ; I like to put module name here.
                                    148 .endif 
                                    149 
                                    150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    151 ; non handled interrupt 
                                    152 ; reset MCU
                                    153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        154 NonHandledInterrupt:
      008080 71                     155     .byte 0x71  ; invalid opcode reinitialize MCU
                                    156 
                                    157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    158 ; auto wakeup from halt
                                    159 ; at iret, program continue 
                                    160 ; after hatl instruction
                                    161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        162 AWUHandler:
      008081 72 19 50 F0      [ 1]  163 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  164 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  165 	clr AWU_TBR 
      00808E 80               [11]  166 	iret
                                    167 
                                    168 ;--------------------------
                                    169 ; UART1 receive character
                                    170 ; CTRL-C (ASCII 3)
                                    171 ; cancel program execution
                                    172 ; and fall back to command line
                                    173 ;--------------------------
      00808F                        174 Uart1RxHandler:
      00808F 72 0B 52 30 FB   [ 2]  175 	btjf UART1_SR,#UART_SR_RXNE,.
      008094 C6 52 31         [ 1]  176 	ld a,UART1_DR 
      008097 A1 03            [ 1]  177 	cp a,#CTRL_C 
      008099 26 07            [ 1]  178 	jrne 1$
      00809B 72 5F 00 27      [ 1]  179 	clr rx_char 
      00809F CC 80 E0         [ 2]  180 	jp user_interrupted
      0080A2                        181 1$:
      0080A2 A1 18            [ 1]  182 	cp a,#CAN ; CTRL_X 
      0080A4 26 03            [ 1]  183 	jrne 2$
      0080A6 CC 85 6F         [ 2]  184 	jp cold_start 	
      0080A9                        185 2$: 
      0080A9 A1 1A            [ 1]  186 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  187 	jrne 3$
      0080AD CD 86 34         [ 4]  188 	call cancel_autorun 
      0080B0 CC 85 6F         [ 2]  189 	jp cold_start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080B3 C7 00 27         [ 1]  190 3$:	ld rx_char,a 	
      0080B6 80               [11]  191 	iret 
                                    192 
                                    193 ;------------------------------------
                                    194 ; software interrupt handler  
                                    195 ;------------------------------------
                           000000   196 .if DEBUG 
                                    197 TrapHandler:
                                    198 	bset flags,#FTRAP 
                                    199 	call print_registers
                                    200 	call cmd_itf
                                    201 	bres flags,#FTRAP 	
                                    202 	iret
                                    203 .endif 
                                    204 
                                    205 ;------------------------------
                                    206 ; TIMER 4 is used to maintain 
                                    207 ; a milliseconds 'ticks' counter
                                    208 ; and decrement 'timer' varaiable
                                    209 ;--------------------------------
      0080B7                        210 Timer4UpdateHandler:
      0080B7 72 5F 53 42      [ 1]  211 	clr TIM4_SR 
      0080BB CE 00 10         [ 2]  212 	ldw x,ticks
      0080BE 5C               [ 2]  213 	incw x
      0080BF CF 00 10         [ 2]  214 	ldw ticks,x 
      0080C2 CE 00 12         [ 2]  215 	ldw x,timer
      0080C5 5D               [ 2]  216 	tnzw x 
      0080C6 27 04            [ 1]  217 	jreq 1$
      0080C8 5A               [ 2]  218 	decw x 
      0080C9 CF 00 12         [ 2]  219 	ldw timer,x 
      0080CC                        220 1$:	
      0080CC 80               [11]  221 	iret 
                                    222 
                                    223 
                                    224 ;------------------------------------
                                    225 ; Triggered by pressing USER UserButton 
                                    226 ; on NUCLEO card.
                                    227 ; This is used to abort a progam lock 
                                    228 ; in infinite loop. 
                                    229 ;------------------------------------
      0080CD                        230 UserButtonHandler:
                                    231 ; wait button release
      0080CD 5F               [ 1]  232 	clrw x
      0080CE 5A               [ 2]  233 1$: decw x 
      0080CF 26 FD            [ 1]  234 	jrne 1$
      0080D1 72 09 50 15 F8   [ 2]  235 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    236 ; if MCU suspended by SLEEP resume program
      0080D6 72 07 00 25 05   [ 2]  237     btjf flags,#FSLEEP,2$
      0080DB 72 17 00 25      [ 1]  238 	bres flags,#FSLEEP 
      0080DF 80               [11]  239 	iret
      0080E0                        240 2$:	
      0080E0                        241 user_interrupted:
      0080E0 72 00 00 25 02   [ 2]  242     btjt flags,#FRUN,4$
      0080E5 20 13            [ 2]  243 	jra UBTN_Handler_exit 
      0080E7                        244 4$:	; program interrupted by user 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080E7 72 11 00 25      [ 1]  245 	bres flags,#FRUN 
      0080EB AE 81 02         [ 2]  246 	ldw x,#USER_ABORT
      0080EE CD 82 57         [ 4]  247 	call puts 
      0080F1 CE 00 05         [ 2]  248 	ldw x,basicptr 
      0080F4 C6 00 02         [ 1]  249 	ld a,in 
      0080F7 CD 93 1A         [ 4]  250 	call prt_basic_line
      0080FA                        251 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  252     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  253     ldw sp,x
      0080FE 9A               [ 1]  254 	rim 
      0080FF CC 88 9C         [ 2]  255 	jp warm_start
                                    256 
      008102 0A 50 72 6F 67 72 61   257 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    258 
                                    259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    260 ;    peripherals initialization
                                    261 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    262 
                                    263 ;----------------------------------------
                                    264 ; inialize MCU clock 
                                    265 ; input:
                                    266 ;   A 		source  HSI | 1 HSE 
                                    267 ;   XL      CLK_CKDIVR , clock divisor 
                                    268 ; output:
                                    269 ;   none 
                                    270 ;----------------------------------------
      00811D                        271 clock_init:	
      00811D C1 50 C3         [ 1]  272 	cp a,CLK_CMSR 
      008120 27 0C            [ 1]  273 	jreq 2$ ; no switching required 
                                    274 ; select clock source 
      008122 72 12 50 C5      [ 1]  275 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008126 C7 50 C4         [ 1]  276 	ld CLK_SWR,a
      008129 C1 50 C3         [ 1]  277 1$:	cp a,CLK_CMSR
      00812C 26 FB            [ 1]  278 	jrne 1$
      00812E                        279 2$: 	
                                    280 ; HSI and cpu clock divisor 
      00812E 9F               [ 1]  281 	ld a,xl 
      00812F C7 50 C6         [ 1]  282 	ld CLK_CKDIVR,a  
      008132 81               [ 4]  283 	ret
                                    284 
                                    285 ;----------------------------------
                                    286 ; TIMER2 used as audio tone output 
                                    287 ; on port D:5.
                                    288 ; channel 1 configured as PWM mode 1 
                                    289 ;-----------------------------------  
                           00F424   290 TIM2_CLK_FREQ=62500
      008133                        291 timer2_init:
      008133 72 1A 50 C7      [ 1]  292 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008137 35 60 53 05      [ 1]  293  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00813B 35 08 53 0C      [ 1]  294 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00813F 81               [ 4]  295 	ret 
                                    296 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    297 ;---------------------------------
                                    298 ; TIM4 is configured to generate an 
                                    299 ; interrupt every millisecond 
                                    300 ;----------------------------------
      008140                        301 timer4_init:
      008140 72 18 50 C7      [ 1]  302 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008144 35 07 53 45      [ 1]  303 	mov TIM4_PSCR,#7 ; prescale 128  
      008148 35 7D 53 46      [ 1]  304 	mov TIM4_ARR,#125 ; set for 1msec.
      00814C 35 05 53 40      [ 1]  305 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008150 72 10 53 41      [ 1]  306 	bset TIM4_IER,#TIM4_IER_UIE
      008154 81               [ 4]  307 	ret
                                    308 
                                    309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    310 ;  routines to write to FLASH, EEPROM 
                                    311 ;  and OPTION 
                                    312 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    313 
                                    314 ;----------------------------------
                                    315 ; unlock EEPROM/OPT for writing/erasing
                                    316 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    317 ; input:
                                    318 ;  none
                                    319 ; output:
                                    320 ;  none 
                                    321 ;----------------------------------
      008155                        322 unlock_eeprom:
      008155 35 AE 50 64      [ 1]  323 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008159 35 56 50 64      [ 1]  324     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00815D 72 07 50 5F FB   [ 2]  325 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008162 81               [ 4]  326 	ret
                                    327 
                                    328 ;----------------------------------
                                    329 ; unlock FLASH for writing/erasing
                                    330 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    331 ; input:
                                    332 ;  none
                                    333 ; output:
                                    334 ;  none
                                    335 ;----------------------------------
      008163                        336 unlock_flash:
      008163 35 56 50 62      [ 1]  337 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008167 35 AE 50 62      [ 1]  338 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00816B 72 03 50 5F FB   [ 2]  339 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008170 81               [ 4]  340 	ret
                                    341 
                           000000   342 USE_BLOCK_ERASE=0 
                           000000   343 .if USE_BLOCK_ERASE 
                                    344 ; this code is copied to RAM 
                                    345 
                                    346 ;----------------------------
                                    347 ; erase block code must be 
                                    348 ; executed from RAM
                                    349 ;-----------------------------
                                    350 erase_start:
                                    351 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    352     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    353     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    354 	ldf [farptr],a
                                    355     inc farptr+2 
                                    356     ldf [farptr],a
                                    357     inc farptr+2 
                                    358     ldf [farptr],a
                                    359     inc farptr+2 
                                    360     ldf [farptr],a
                                    361 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    362 	ret
                                    363 erase_end:
                                    364 
                                    365 ; copy erase_start in RAM 
                                    366 move_code_in_ram:
                                    367 	ldw x,#erase_end 
                                    368 	subw x,#erase_start
                                    369 	ldw acc16,x 
                                    370 	ldw x,#pad 
                                    371 	ldw y,#erase_start 
                                    372 	call move 
                                    373 	ret 
                                    374 
                                    375 ;-----------------------------------
                                    376 ; erase flash or EEPROM block 
                                    377 ; a block is 128 bytes 
                                    378 ; input:
                                    379 ;   farptr  address block begin
                                    380 ; output:
                                    381 ;   none
                                    382 ;--------------------------------------
                                    383 erase_block:
                                    384 	ldw x,farptr+1 
                                    385 	pushw x 
                                    386 	call move_code_in_ram 
                                    387 	popw x 
                                    388 	ldw farptr+1,x 
                                    389 	tnz farptr
                                    390 	jrne erase_flash 
                                    391 	ldw x,#FLASH_BASE 
                                    392 	cpw x,farptr+1 
                                    393 	jrpl erase_flash 
                                    394 ; erase eeprom block
                                    395 	call unlock_eeprom 
                                    396 	sim 
                                    397 	call pad   
                                    398 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    399 	rim 
                                    400 	ret 
                                    401 ; erase flash block:
                                    402 erase_flash:
                                    403 	call unlock_flash 
                                    404 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    405 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    406 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    407 	sim 
                                    408 	call pad 
                                    409     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    410 	rim 
                                    411 	ret 
                                    412 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    413 
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    415 ; write a byte to FLASH or EEPROM/OPTION  
                                    416 ; input:
                                    417 ;    a  		byte to write
                                    418 ;    farptr  	address
                                    419 ;    x          farptr[x]
                                    420 ; output:
                                    421 ;    none
                                    422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    423 	; variables locales
                           000001   424 	BTW = 1   ; byte to write offset on stack
                           000002   425 	OPT = 2   ; OPTION flag offset on stack
                           000002   426 	VSIZE = 2
      008171                        427 write_byte:
      008171 90 89            [ 2]  428 	pushw y
      0000F3                        429 	_vars VSIZE
      008173 52 02            [ 2]    1     sub sp,#VSIZE 
      008175 6B 01            [ 1]  430 	ld (BTW,sp),a ; byte to write 
      008177 0F 02            [ 1]  431 	clr (OPT,sp)  ; OPTION flag
                                    432 ; put addr[15:0] in Y, for bounds check.
      008179 90 CE 00 19      [ 2]  433 	ldw y,farptr+1   ; Y=addr15:0
                                    434 ; check addr[23:16], if <> 0 then it is extened flash memory
      00817D 72 5D 00 18      [ 1]  435 	tnz farptr 
      008181 26 14            [ 1]  436 	jrne write_flash
      008183 90 A3 A6 80      [ 2]  437     cpw y,#user_space
      008187 24 0E            [ 1]  438     jruge write_flash
      008189 90 A3 40 00      [ 2]  439 	cpw y,#EEPROM_BASE  
      00818D 25 52            [ 1]  440     jrult write_exit
      00818F 90 A3 48 7F      [ 2]  441 	cpw y,#OPTION_END 
      008193 22 4C            [ 1]  442 	jrugt write_exit
      008195 20 16            [ 2]  443 	jra write_eeprom 
                                    444 ; write program memory
      008197                        445 write_flash:
      008197 CD 81 63         [ 4]  446 	call unlock_flash 
      00819A 9B               [ 1]  447 1$:	sim 
      00819B 7B 01            [ 1]  448 	ld a,(BTW,sp)
      00819D 92 A7 00 18      [ 4]  449 	ldf ([farptr],x),a ; farptr[x]=A
      0081A1 72 05 50 5F FB   [ 2]  450 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081A6 9A               [ 1]  451     rim 
      0081A7 72 13 50 5F      [ 1]  452     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081AB 20 34            [ 2]  453     jra write_exit
                                    454 ; write eeprom and option
      0081AD                        455 write_eeprom:
      0081AD CD 81 55         [ 4]  456 	call unlock_eeprom
                                    457 	; check for data eeprom or option eeprom
      0081B0 90 A3 48 00      [ 2]  458 	cpw y,#OPTION_BASE
      0081B4 2B 08            [ 1]  459 	jrmi 1$
      0081B6 90 A3 48 80      [ 2]  460 	cpw y,#OPTION_END+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081BA 2A 02            [ 1]  461 	jrpl 1$
      0081BC 03 02            [ 1]  462 	cpl (OPT,sp)
      0081BE                        463 1$: 
      0081BE 0D 02            [ 1]  464     tnz (OPT,sp)
      0081C0 27 08            [ 1]  465     jreq 2$
                                    466 	; pour modifier une option il faut modifier ces 2 bits
      0081C2 72 1E 50 5B      [ 1]  467     bset FLASH_CR2,#FLASH_CR2_OPT
      0081C6 72 1F 50 5C      [ 1]  468     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081CA                        469 2$: 
      0081CA 7B 01            [ 1]  470     ld a,(BTW,sp)
      0081CC 92 A7 00 18      [ 4]  471     ldf ([farptr],x),a
      0081D0 0D 02            [ 1]  472     tnz (OPT,sp)
      0081D2 27 08            [ 1]  473     jreq 3$
      0081D4 5C               [ 2]  474     incw x
      0081D5 7B 01            [ 1]  475     ld a,(BTW,sp)
      0081D7 43               [ 1]  476     cpl a
      0081D8 92 A7 00 18      [ 4]  477     ldf ([farptr],x),a
      0081DC 72 05 50 5F FB   [ 2]  478 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E1                        479 write_exit:
      000161                        480 	_drop VSIZE 
      0081E1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081E3 90 85            [ 2]  481 	popw y
      0081E5 81               [ 4]  482     ret
                                    483 
                                    484 ;--------------------------------------------
                                    485 ; write a data block to eeprom or flash 
                                    486 ; input:
                                    487 ;   Y        source address   
                                    488 ;   X        array index  destination  farptr[x]
                                    489 ;   BSIZE    block size bytes 
                                    490 ;   farptr   write address , byte* 
                                    491 ; output:
                                    492 ;	X 		after last byte written 
                                    493 ;   Y 		after last byte read 
                                    494 ;  farptr   point after block
                                    495 ;---------------------------------------------
      0081E6                        496 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000166                        497 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    498 	; local var 
                           000001   499 	XSAVE=1 
                           000002   500 	VSIZE=2 
      000166                        501 write_block:
      000166                        502 	_vars VSIZE
      0081E6 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E8 1F 01            [ 2]  503 	ldw (XSAVE,sp),x 
      0081EA 1E 05            [ 2]  504 	ldw x,(BSIZE,sp) 
      0081EC 27 13            [ 1]  505 	jreq 9$
      0081EE 1E 01            [ 2]  506 1$:	ldw x,(XSAVE,sp)
      0081F0 90 F6            [ 1]  507 	ld a,(y)
      0081F2 CD 81 71         [ 4]  508 	call write_byte 
      0081F5 5C               [ 2]  509 	incw x 
      0081F6 90 5C            [ 2]  510 	incw y 
      0081F8 1F 01            [ 2]  511 	ldw (XSAVE,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FA 1E 05            [ 2]  512 	ldw x,(BSIZE,sp)
      0081FC 5A               [ 2]  513 	decw x
      0081FD 1F 05            [ 2]  514 	ldw (BSIZE,sp),x 
      0081FF 26 ED            [ 1]  515 	jrne 1$
      008201                        516 9$:
      008201 1E 01            [ 2]  517 	ldw x,(XSAVE,sp)
      008203 CD 99 2C         [ 4]  518 	call incr_farptr
      000186                        519 	_drop VSIZE
      008206 5B 02            [ 2]    1     addw sp,#VSIZE 
      008208 81               [ 4]  520 	ret 
                                    521 
                                    522 
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 ;;   UART1 subroutines
                                    525 ;;   used for user interface 
                                    526 ;;   communication channel.
                                    527 ;;   settings: 
                                    528 ;;		115200 8N1 no flow control
                                    529 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    530 
                                    531 ;---------------------------------------------
                                    532 ; initialize UART1, 115200 8N1
                                    533 ; input:
                                    534 ;	none
                                    535 ; output:
                                    536 ;   none
                                    537 ;---------------------------------------------
      008209                        538 uart1_init:
      008209 72 1A 50 02      [ 1]  539     bset PA_DDR,#UART1_TX_PIN
      00820D 72 1A 50 03      [ 1]  540     bset PA_CR1,#UART1_TX_PIN 
      008211 72 1A 50 04      [ 1]  541     bset PA_CR2,#UART1_TX_PIN 
                                    542 ; enable UART1 clock
      008215 72 14 50 C7      [ 1]  543 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008219                        544 uart1_set_baud: 
                                    545 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    546 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008219 A6 E1            [ 1]  547 	ld a,#CLK_SWR_HSI
      00821B C1 50 C3         [ 1]  548 	cp a,CLK_CMSR 
      00821E 27 0A            [ 1]  549 	jreq 2$ 
      008220                        550 1$: ; 8 Mhz 	
      008220 35 05 52 33      [ 1]  551 	mov UART1_BRR2,#0x05 ; must be loaded first
      008224 35 04 52 32      [ 1]  552 	mov UART1_BRR1,#0x4
      008228 20 08            [ 2]  553 	jra 3$
      00822A                        554 2$: ; 16 Mhz 	
      00822A 35 0B 52 33      [ 1]  555 	mov UART1_BRR2,#0x0b ; must be loaded first
      00822E 35 08 52 32      [ 1]  556 	mov UART1_BRR1,#0x08
      008232                        557 3$:
      008232 72 5F 52 31      [ 1]  558     clr UART1_DR
      008236 35 2C 52 35      [ 1]  559 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00823A 72 10 52 35      [ 1]  560 	bset UART1_CR2,#UART_CR2_SBK
      00823E 72 0D 52 30 FB   [ 2]  561     btjf UART1_SR,#UART_SR_TC,.
      008243 81               [ 4]  562     ret
                                    563 
                                    564 ;---------------------------------
                                    565 ; send character to UART1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    566 ; input:
                                    567 ;   A 
                                    568 ; output:
                                    569 ;   none 
                                    570 ;--------------------------------	
      008244                        571 putc:
      008244 72 0F 52 30 FB   [ 2]  572 	btjf UART1_SR,#UART_SR_TXE,.
      008249 C7 52 31         [ 1]  573 	ld UART1_DR,a 
      00824C 81               [ 4]  574 	ret 
                                    575 
                                    576 ;---------------------------------
                                    577 ; wait character from UART1 
                                    578 ; input:
                                    579 ;   none
                                    580 ; output:
                                    581 ;   A 			char  
                                    582 ;--------------------------------	
      00824D                        583 getc:
      00824D C6 00 27         [ 1]  584 	ld a,rx_char 
      008250 27 FB            [ 1]  585 	jreq getc 
      008252 72 5F 00 27      [ 1]  586 	clr rx_char 
      008256 81               [ 4]  587 	ret 
                                    588 
                                    589 ;-----------------------------
                                    590 ; send an ASCIZ string to UART1 
                                    591 ; input: 
                                    592 ;   x 		char * 
                                    593 ; output:
                                    594 ;   none 
                                    595 ;-------------------------------
      008257                        596 puts:
      008257 F6               [ 1]  597     ld a,(x)
      008258 27 06            [ 1]  598 	jreq 1$
      00825A CD 82 44         [ 4]  599 	call putc 
      00825D 5C               [ 2]  600 	incw x 
      00825E 20 F7            [ 2]  601 	jra puts 
      008260 81               [ 4]  602 1$:	ret 
                                    603 
                                    604 
                                    605 ;---------------------------
                                    606 ; delete character at left 
                                    607 ; of cursor on terminal 
                                    608 ; input:
                                    609 ;   none 
                                    610 ; output:
                                    611 ;	none 
                                    612 ;---------------------------
      008261                        613 bksp:
      008261 A6 08            [ 1]  614 	ld a,#BS 
      008263 CD 82 44         [ 4]  615 	call putc 
      008266 A6 20            [ 1]  616 	ld a,#SPACE 
      008268 CD 82 44         [ 4]  617 	call putc 
      00826B A6 08            [ 1]  618 	ld a,#BS 
      00826D CD 82 44         [ 4]  619 	call putc 
      008270 81               [ 4]  620 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    621 ;---------------------------
                                    622 ; delete n character left of cursor 
                                    623 ; at terminal.
                                    624 ; input: 
                                    625 ;   A   number of characters to delete.
                                    626 ; output:
                                    627 ;    none 
                                    628 ;--------------------------	
      008271                        629 delete:
      008271 88               [ 1]  630 	push a 
      008272 0D 01            [ 1]  631 0$:	tnz (1,sp)
      008274 27 07            [ 1]  632 	jreq 1$
      008276 CD 82 61         [ 4]  633 	call bksp 
      008279 0A 01            [ 1]  634 	dec (1,sp)
      00827B 20 F5            [ 2]  635 	jra 0$
      00827D 84               [ 1]  636 1$:	pop a 
      00827E 81               [ 4]  637 	ret
                                    638 
                                    639 ;--------------------------
                                    640 ; print n spaces on terminal
                                    641 ; input:
                                    642 ;  X 		number of spaces 
                                    643 ; output:
                                    644 ;	none 
                                    645 ;---------------------------
      00827F                        646 spaces:
      00827F A6 20            [ 1]  647 	ld a,#SPACE 
      008281 5D               [ 2]  648 1$:	tnzw x
      008282 27 06            [ 1]  649 	jreq 9$
      008284 CD 82 44         [ 4]  650 	call putc 
      008287 5A               [ 2]  651 	decw x
      008288 20 F7            [ 2]  652 	jra 1$
      00828A                        653 9$: 
      00828A 81               [ 4]  654 	ret 
                                    655 
                                    656 ;;;;;;;;;;;;;
                           000000   657 .if DEBUG 
                                    658 ;---------------------------------
                                    659 ;; print actual registers states 
                                    660 ;; as pushed on stack 
                                    661 ;; {Y,X,CC,A}
                                    662 ;---------------------------------
                                    663 	_argofs 0  
                                    664 	_arg R_Y 1 
                                    665 	_arg R_X 3
                                    666 	_arg R_A 5
                                    667 	_arg R_CC 6
                                    668 prt_regs:
                                    669 	ldw x,#regs_state 
                                    670 	call puts
                                    671 ; register PC
                                    672 	ldw y,(1,sp)
                                    673 	ldw x,#REG_EPC 
                                    674 	call prt_reg16 
                                    675 ; register CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    676 	ld a,(R_CC,sp)
                                    677 	ldw x,#REG_CC 
                                    678 	call prt_reg8 
                                    679 ; register A 
                                    680 	ld a,(R_A,sp)
                                    681 	ldw x,#REG_A 
                                    682 	call prt_reg8 
                                    683 ; register X 
                                    684 	ldw y,(R_X,sp)
                                    685 	ldw x,#REG_X 
                                    686 	call prt_reg16 
                                    687 ; register Y 
                                    688 	ldw y,(R_Y,sp)
                                    689 	ldw x,#REG_Y 
                                    690 	call prt_reg16 
                                    691 ; register SP 
                                    692 	ldw y,sp
                                    693 	addw y,#6+ARG_OFS  
                                    694 	ldw x,#REG_SP
                                    695 	call prt_reg16
                                    696 	ld a,#CR 
                                    697 	call putc
                                    698 	call putc   
                                    699 	ret 
                                    700 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    731 ;;;;;;;;;;;;;;;;;;;;	
                                    732 
                                    733 ;----------------------
                                    734 ; print token id && value
                                    735 ; input:
                                    736 ;   A     token id 
                                    737 ;   X     token value 
                                    738 ;---------------------
                           000001   739 	BSAVE=1
                           000002   740 	AREG=2
                           000003   741 	XREG=3
                           000004   742 	VSIZE=4
      00828B                        743 prt_tok:
      00020B                        744 	_vars VSIZE 
      00828B 52 04            [ 2]    1     sub sp,#VSIZE 
      00828D 6B 02            [ 1]  745 	ld (AREG,sp),a 
      00828F 1F 03            [ 2]  746 	ldw (XREG,sp),x 
      008291 C6 00 0B         [ 1]  747 	ld a, base
      008294 6B 01            [ 1]  748 	ld (BSAVE,sp),a 
      008296 35 10 00 0B      [ 1]  749 	mov base,#16  
      00829A AE 82 C2         [ 2]  750 	ldw x,#token_msg
      00829D CD 82 57         [ 4]  751 	call puts 
      0082A0 5F               [ 1]  752 	clrw x 
      0082A1 7B 02            [ 1]  753 	ld a,(AREG,sp)
      0082A3 97               [ 1]  754 	ld xl,a 
      0082A4 CD 89 AD         [ 4]  755 	call print_int 
      0082A7 A6 20            [ 1]  756 	ld a,#SPACE
      0082A9 CD 82 44         [ 4]  757 	call putc 
      0082AC 1E 03            [ 2]  758 	ldw x,(XREG,sp)
      0082AE CD 89 AD         [ 4]  759 	call print_int 
      0082B1 A6 0D            [ 1]  760 	ld a,#CR 
      0082B3 CD 82 44         [ 4]  761 	call putc 
      0082B6 7B 01            [ 1]  762 	ld a,(BSAVE,sp)
      0082B8 C7 00 0B         [ 1]  763 	ld base,a 
      0082BB 7B 02            [ 1]  764 	ld a,(AREG,sp)
      0082BD 1E 03            [ 2]  765 	ldw x,(XREG,sp)
      00023F                        766 	_drop VSIZE 
      0082BF 5B 04            [ 2]    1     addw sp,#VSIZE 
      0082C1 81               [ 4]  767 	ret 
      0082C2 74 6F 6B 65 6E 3A 20   768 token_msg: .asciz "token: "
             00
                                    769 
                                    770 
                                    771 ;---------------------
                                    772 ; display n bytes row 
                                    773 ; from memory.
                                    774 ; input:
                                    775 ;   A   bytes to print 
                                    776 ;	X   start address 
                                    777 ; output:
                                    778 ;   X   address after last shown  
                                    779 ;---------------------
                           000001   780 	CNT=1 
                           000002   781 	ADR=2 
                           000003   782 	VSIZE=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0082CA                        783 show_row:
      0082CA 4D               [ 1]  784 	tnz a 
      0082CB 26 01            [ 1]  785 	jrne 1$
      0082CD 81               [ 4]  786 	ret 
      0082CE                        787 1$:	
      0082CE 89               [ 2]  788 	pushw x  
      0082CF 88               [ 1]  789 	push a 
      0082D0 35 04 00 26      [ 1]  790 	mov tab_width,#4 
      0082D4 CD 89 AD         [ 4]  791 	call print_int 
      0082D7 A6 20            [ 1]  792 	ld a,#SPACE  
      0082D9 CD 82 44         [ 4]  793 	call putc
      0082DC                        794 row_loop:
      0082DC 1E 02            [ 2]  795 	ldw x,(ADR,sp)
      0082DE F6               [ 1]  796 	ld a,(x)
      0082DF 5F               [ 1]  797 	clrw x 
      0082E0 97               [ 1]  798 	ld xl,a 
      0082E1 CD 89 AD         [ 4]  799 	call print_int 
      0082E4 1E 02            [ 2]  800 	ldw x,(ADR,sp)
      0082E6 5C               [ 2]  801 	incw x 
      0082E7 1F 02            [ 2]  802 	ldw (ADR,sp),x 
      0082E9 0A 01            [ 1]  803 	dec (CNT,sp)
      0082EB 26 EF            [ 1]  804 	jrne row_loop
      00026D                        805 	_drop VSIZE  		
      0082ED 5B 03            [ 2]    1     addw sp,#VSIZE 
      0082EF 35 04 00 26      [ 1]  806 	mov tab_width,#4
      0082F3 A6 0D            [ 1]  807 	ld a,#CR 
      0082F5 CD 82 44         [ 4]  808 	call putc 
      0082F8 81               [ 4]  809 	ret 
                                    810 
                                    811 ;--------------------------
                                    812 ; print memory content 
                                    813 ; in hexadecimal format
                                    814 ;  input:
                                    815 ;    X    start address 
                                    816 ;    Y    count 
                                    817 ;--------------------------
                           000001   818 	BCNT=1
                           000003   819 	BASE=3
                           000004   820 	TABW=4
                           000004   821 	VSIZE=4   
      0082F9                        822 hex_dump:
      000279                        823 	_vars VSIZE
      0082F9 52 04            [ 2]    1     sub sp,#VSIZE 
      0082FB C6 00 0B         [ 1]  824 	ld a,base
      0082FE 6B 03            [ 1]  825 	ld (BASE,sp),a 
      008300 35 10 00 0B      [ 1]  826 	mov base,#16
      008304 C6 00 26         [ 1]  827 	ld a,tab_width 
      008307 6B 04            [ 1]  828 	ld (TABW,sp),a
      008309 A6 0D            [ 1]  829 	ld a,#CR 
      00830B CD 82 44         [ 4]  830 	call putc 
      00830E 17 01            [ 2]  831 1$: ldw (BCNT,sp),y
      008310 A6 10            [ 1]  832 	ld a,#16
      008312 90 A3 00 10      [ 2]  833 	cpw y,#16
      008316 2A 02            [ 1]  834 	jrpl 2$
      008318 90 9F            [ 1]  835 	ld a,yl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00831A                        836 2$: 	
      00831A CD 82 CA         [ 4]  837 	call show_row 
      00831D 16 01            [ 2]  838 	ldw y,(BCNT,sp) 
      00831F 72 A2 00 10      [ 2]  839 	subw y,#16 
      008323 90 A3 00 01      [ 2]  840 	cpw y,#1
      008327 2A E5            [ 1]  841 	jrpl 1$
      008329 7B 03            [ 1]  842 	ld a,(BASE,sp)
      00832B C7 00 0B         [ 1]  843 	ld base,a
      00832E 7B 04            [ 1]  844 	ld a,(TABW,sp)
      008330 C7 00 26         [ 1]  845 	ld tab_width,a 
      0002B3                        846 	_drop VSIZE
      008333 5B 04            [ 2]    1     addw sp,#VSIZE 
      008335 81               [ 4]  847 	ret 
                                    848 
                                    849 ;-------------------------------------
                                    850 ; retrun string length
                                    851 ; input:
                                    852 ;   X         .asciz  pointer 
                                    853 ; output:
                                    854 ;   X         length 
                                    855 ;-------------------------------------
      008336                        856 strlen:
      008336 90 93            [ 1]  857 	ldw y,x 
      008338 5F               [ 1]  858 	clrw x 
      008339 90 7D            [ 1]  859 1$:	tnz (y) 
      00833B 27 05            [ 1]  860 	jreq 9$ 
      00833D 5C               [ 2]  861 	incw x
      00833E 90 5C            [ 2]  862 	incw y 
      008340 20 F7            [ 2]  863 	jra 1$ 
      008342 81               [ 4]  864 9$: ret 
                                    865 
                                    866 ;------------------------------------
                                    867 ; compare 2 strings
                                    868 ; input:
                                    869 ;   X 		char* first string 
                                    870 ;   Y       char* second string 
                                    871 ; output:
                                    872 ;   A 		0|1 
                                    873 ;-------------------------------------
      008343                        874 strcmp:
      008343 F6               [ 1]  875 	ld a,(x)
      008344 27 0B            [ 1]  876 	jreq 5$ 
      008346 90 F1            [ 1]  877 	cp a,(y) 
      008348 26 05            [ 1]  878 	jrne 4$ 
      00834A 5C               [ 2]  879 	incw x 
      00834B 90 5C            [ 2]  880 	incw y 
      00834D 20 F4            [ 2]  881 	jra strcmp 
      00834F                        882 4$: ; not same  
      00834F 4F               [ 1]  883 	clr a 
      008350 81               [ 4]  884 	ret 
      008351                        885 5$: ; same 
      008351 A6 01            [ 1]  886 	ld a,#1 
      008353 81               [ 4]  887 	ret 
                                    888 
                                    889 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    890 ;---------------------------------------
                                    891 ;  copy src to dest 
                                    892 ; input:
                                    893 ;   X 		dest 
                                    894 ;   Y 		src 
                                    895 ; output: 
                                    896 ;   X 		dest 
                                    897 ;----------------------------------
      008354                        898 strcpy:
      008354 89               [ 2]  899 	pushw x 
      008355 90 F6            [ 1]  900 1$: ld a,(y)
      008357 27 06            [ 1]  901 	jreq 9$ 
      008359 F7               [ 1]  902 	ld (x),a 
      00835A 5C               [ 2]  903 	incw x 
      00835B 90 5C            [ 2]  904 	incw y 
      00835D 20 F6            [ 2]  905 	jra 1$ 
      00835F 7F               [ 1]  906 9$:	clr (x)
      008360 85               [ 2]  907 	popw x 
      008361 81               [ 4]  908 	ret 
                                    909 
                                    910 ;---------------------------------------
                                    911 ; move memory block 
                                    912 ; input:
                                    913 ;   X 		destination 
                                    914 ;   Y 	    source 
                                    915 ;   acc16	bytes count 
                                    916 ; output:
                                    917 ;   none 
                                    918 ;--------------------------------------
                           000001   919 	INCR=1 ; increament high byte 
                           000002   920 	LB=2 ; increament low byte 
                           000002   921 	VSIZE=2
      008362                        922 move:
      0002E2                        923 	_vars VSIZE 
      008362 52 02            [ 2]    1     sub sp,#VSIZE 
      008364 0F 01            [ 1]  924 	clr (INCR,sp)
      008366 0F 02            [ 1]  925 	clr (LB,sp)
      008368 90 89            [ 2]  926 	pushw y 
      00836A 13 01            [ 2]  927 	cpw x,(1,sp) ; compare DEST to SRC 
      00836C 90 85            [ 2]  928 	popw y 
      00836E 27 31            [ 1]  929 	jreq move_exit ; x==y 
      008370 2B 0E            [ 1]  930 	jrmi move_down
      008372                        931 move_up: ; start from top address with incr=-1
      008372 72 BB 00 0D      [ 2]  932 	addw x,acc16
      008376 72 B9 00 0D      [ 2]  933 	addw y,acc16
      00837A 03 01            [ 1]  934 	cpl (INCR,sp)
      00837C 03 02            [ 1]  935 	cpl (LB,sp)   ; increment = -1 
      00837E 20 05            [ 2]  936 	jra move_loop  
      008380                        937 move_down: ; start from bottom address with incr=1 
      008380 5A               [ 2]  938     decw x 
      008381 90 5A            [ 2]  939 	decw y
      008383 0C 02            [ 1]  940 	inc (LB,sp) ; incr=1 
      008385                        941 move_loop:	
      008385 C6 00 0D         [ 1]  942     ld a, acc16 
      008388 CA 00 0E         [ 1]  943 	or a, acc8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00838B 27 14            [ 1]  944 	jreq move_exit 
      00838D 72 FB 01         [ 2]  945 	addw x,(INCR,sp)
      008390 72 F9 01         [ 2]  946 	addw y,(INCR,sp) 
      008393 90 F6            [ 1]  947 	ld a,(y)
      008395 F7               [ 1]  948 	ld (x),a 
      008396 89               [ 2]  949 	pushw x 
      008397 CE 00 0D         [ 2]  950 	ldw x,acc16 
      00839A 5A               [ 2]  951 	decw x 
      00839B CF 00 0D         [ 2]  952 	ldw acc16,x 
      00839E 85               [ 2]  953 	popw x 
      00839F 20 E4            [ 2]  954 	jra move_loop
      0083A1                        955 move_exit:
      000321                        956 	_drop VSIZE
      0083A1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083A3 81               [ 4]  957 	ret 	
                                    958 
                                    959 ;-------------------------------------
                                    960 ; search text area for a line#
                                    961 ; input:
                                    962 ;	X 			line# 
                                    963 ; output:
                                    964 ;   X 			addr of line | 0 
                                    965 ;   Y           line#|insert address if not found  
                                    966 ;-------------------------------------
                           000001   967 	LL=1 ; line length 
                           000002   968 	LB=2 ; line length low byte 
                           000002   969 	VSIZE=2 
      0083A4                        970 search_lineno:
      000324                        971 	_vars VSIZE
      0083A4 52 02            [ 2]    1     sub sp,#VSIZE 
      0083A6 0F 01            [ 1]  972 	clr (LL,sp)
      0083A8 90 CE 00 1E      [ 2]  973 	ldw y,txtbgn
      0083AC                        974 search_ln_loop:
      0083AC 90 C3 00 20      [ 2]  975 	cpw y,txtend 
      0083B0 2A 10            [ 1]  976 	jrpl 8$
      0083B2 90 F3            [ 1]  977 	cpw x,(y)
      0083B4 27 0E            [ 1]  978 	jreq 9$
      0083B6 2B 0A            [ 1]  979 	jrmi 8$ 
      0083B8 90 E6 02         [ 1]  980 	ld a,(2,y)
      0083BB 6B 02            [ 1]  981 	ld (LB,sp),a 
      0083BD 72 F9 01         [ 2]  982 	addw y,(LL,sp)
      0083C0 20 EA            [ 2]  983 	jra search_ln_loop 
      0083C2                        984 8$: 
      0083C2 5F               [ 1]  985 	clrw x 	
      0083C3 51               [ 1]  986 	exgw x,y 
      000344                        987 9$: _drop VSIZE
      0083C4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083C6 51               [ 1]  988 	exgw x,y   
      0083C7 81               [ 4]  989 	ret 
                                    990 
                                    991 ;-------------------------------------
                                    992 ; delete line at addr
                                    993 ; input:
                                    994 ;   X 		addr of line i.e DEST for move 
                                    995 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                           000001   996 	LLEN=1
                           000003   997 	SRC=3
                           000004   998 	VSIZE=4
      0083C8                        999 del_line: 
      000348                       1000 	_vars VSIZE 
      0083C8 52 04            [ 2]    1     sub sp,#VSIZE 
      0083CA E6 02            [ 1] 1001 	ld a,(2,x) ; line length
      0083CC 6B 02            [ 1] 1002 	ld (LLEN+1,sp),a 
      0083CE 0F 01            [ 1] 1003 	clr (LLEN,sp)
      0083D0 90 93            [ 1] 1004 	ldw y,x  
      0083D2 72 F9 01         [ 2] 1005 	addw y,(LLEN,sp) ;SRC  
      0083D5 17 03            [ 2] 1006 	ldw (SRC,sp),y  ;save source 
      0083D7 90 CE 00 20      [ 2] 1007 	ldw y,txtend 
      0083DB 72 F2 03         [ 2] 1008 	subw y,(SRC,sp) ; y=count 
      0083DE 90 CF 00 0D      [ 2] 1009 	ldw acc16,y 
      0083E2 16 03            [ 2] 1010 	ldw y,(SRC,sp)    ; source
      0083E4 CD 83 62         [ 4] 1011 	call move
      0083E7 90 CE 00 20      [ 2] 1012 	ldw y,txtend 
      0083EB 72 F2 01         [ 2] 1013 	subw y,(LLEN,sp)
      0083EE 90 CF 00 20      [ 2] 1014 	ldw txtend,y  
      000372                       1015 	_drop VSIZE     
      0083F2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083F4 81               [ 4] 1016 	ret 
                                   1017 
                                   1018 ;---------------------------------------------
                                   1019 ; create a gap in text area to 
                                   1020 ; move new line in this gap
                                   1021 ; input:
                                   1022 ;    X 			addr gap start 
                                   1023 ;    Y 			gap length 
                                   1024 ; output:
                                   1025 ;    X 			addr gap start 
                                   1026 ;--------------------------------------------
                           000001  1027 	DEST=1
                           000003  1028 	SRC=3
                           000005  1029 	LEN=5
                           000006  1030 	VSIZE=6 
      0083F5                       1031 create_gap:
      000375                       1032 	_vars VSIZE
      0083F5 52 06            [ 2]    1     sub sp,#VSIZE 
      0083F7 1F 03            [ 2] 1033 	ldw (SRC,sp),x 
      0083F9 17 05            [ 2] 1034 	ldw (LEN,sp),y 
      0083FB 90 CF 00 0D      [ 2] 1035 	ldw acc16,y 
      0083FF 90 93            [ 1] 1036 	ldw y,x ; SRC
      008401 72 BB 00 0D      [ 2] 1037 	addw x,acc16  
      008405 1F 01            [ 2] 1038 	ldw (DEST,sp),x 
                                   1039 ;compute size to move 	
      008407 CE 00 20         [ 2] 1040 	ldw x,txtend 
      00840A 72 F0 03         [ 2] 1041 	subw x,(SRC,sp)
      00840D CF 00 0D         [ 2] 1042 	ldw acc16,x ; size to move
      008410 1E 01            [ 2] 1043 	ldw x,(DEST,sp) 
      008412 CD 83 62         [ 4] 1044 	call move
      008415 CE 00 20         [ 2] 1045 	ldw x,txtend
      008418 72 FB 05         [ 2] 1046 	addw x,(LEN,sp)
      00841B CF 00 20         [ 2] 1047 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00039E                       1048 9$:	_drop VSIZE 
      00841E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008420 81               [ 4] 1049 	ret 
                                   1050 
                                   1051 ;--------------------------------------------
                                   1052 ; insert line in pad into text area 
                                   1053 ; first search for already existing 
                                   1054 ; replace existing 
                                   1055 ; if new line empty delete existing one. 
                                   1056 ; input:
                                   1057 ;   ptr16		pointer to tokenized line  
                                   1058 ; output:
                                   1059 ;   none
                                   1060 ;---------------------------------------------
                           000001  1061 	DEST=1  ; text area insertion address 
                           000003  1062 	SRC=3   ; str to insert address 
                           000005  1063 	LINENO=5 ; line number 
                           000007  1064 	LLEN=7 ; line length 
                           000008  1065 	VSIZE=8  
      008421                       1066 insert_line:
      0003A1                       1067 	_vars VSIZE 
      008421 52 08            [ 2]    1     sub sp,#VSIZE 
      008423 CE 00 20         [ 2] 1068 	ldw x,txtend  
      008426 C3 00 1E         [ 2] 1069 	cpw x,txtbgn 
      008429 26 15            [ 1] 1070 	jrne 0$
                                   1071 ;first text line 
      00842B AE 00 02         [ 2] 1072 	ldw x,#2 
      00842E 72 D6 00 19      [ 4] 1073 	ld a,([ptr16],x)
      008432 5F               [ 1] 1074 	clrw x 
      008433 97               [ 1] 1075 	ld xl,a
      008434 1F 07            [ 2] 1076 	ldw (LLEN,sp),x 
      008436 CE 00 1E         [ 2] 1077 	ldw x,txtbgn
      008439 1F 01            [ 2] 1078 	ldw (DEST,sp),x 
      00843B CE 00 20         [ 2] 1079 	ldw x,txtend 
      00843E 20 37            [ 2] 1080 	jra 4$
      008440 72 CE 00 19      [ 5] 1081 0$:	ldw x,[ptr16]
                                   1082 ; line number
      008444 1F 05            [ 2] 1083 	ldw (LINENO,sp),x 
      008446 AE 00 02         [ 2] 1084 	ldw x,#2 
      008449 72 D6 00 19      [ 4] 1085 	ld a,([ptr16],x)
      00844D 97               [ 1] 1086 	ld xl,a
                                   1087 ; line length
      00844E 1F 07            [ 2] 1088 	ldw (LLEN,sp),x
                                   1089 ; check if that line number already exit 	
      008450 1E 05            [ 2] 1090 	ldw x,(LINENO,sp)
      008452 CD 83 A4         [ 4] 1091 	call search_lineno 
      008455 5D               [ 2] 1092 	tnzw x 
      008456 26 04            [ 1] 1093 	jrne 2$
                                   1094 ; line doesn't exit
                                   1095 ; it will be inserted at this point.  	
      008458 17 01            [ 2] 1096 	ldw (DEST,sp),y 
      00845A 20 05            [ 2] 1097 	jra 3$
                                   1098 ; line exit delete it.
                                   1099 ; it will be replaced by new one 	
      00845C 1F 01            [ 2] 1100 2$: ldw (DEST,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00845E CD 83 C8         [ 4] 1101 	call del_line
      008461                       1102 3$: 
                                   1103 ; insert new line or leave if LLEN==3
                                   1104 ; LLEN==3 means empty line 
      008461 A6 03            [ 1] 1105 	ld a,#3
      008463 11 08            [ 1] 1106 	cp a,(LLEN+1,sp)
      008465 27 24            [ 1] 1107 	jreq insert_ln_exit ; empty line exit.
                                   1108 ; if insertion point at txtend 
                                   1109 ; move no need to create a gap 
      008467 1E 01            [ 2] 1110 	ldw x,(DEST,sp)
      008469 C3 00 20         [ 2] 1111 	cpw x,txtend 
      00846C 27 09            [ 1] 1112 	jreq 4$ 
                                   1113 ; must create a gap
                                   1114 ; at insertion point  
      00846E 1E 01            [ 2] 1115 	ldw x,(DEST,sp)
      008470 16 07            [ 2] 1116 	ldw y,(LLEN,sp)
      008472 CD 83 F5         [ 4] 1117 	call create_gap
      008475 20 06            [ 2] 1118 	jra 5$
      008477                       1119 4$: 
      008477 72 FB 07         [ 2] 1120 	addw x,(LLEN,sp)
      00847A CF 00 20         [ 2] 1121 	ldw txtend,x 	 
                                   1122 ; move new line in gap 
      00847D 1E 07            [ 2] 1123 5$:	ldw x,(LLEN,sp)
      00847F CF 00 0D         [ 2] 1124 	ldw acc16,x 
      008482 90 AE 16 E0      [ 2] 1125 	ldw y,#pad ;SRC 
      008486 1E 01            [ 2] 1126 	ldw x,(DEST,sp) ; dest address 
      008488 CD 83 62         [ 4] 1127 	call move 
      00848B                       1128 insert_ln_exit:	
      00040B                       1129 	_drop VSIZE
      00848B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00848D 81               [ 4] 1130 	ret
                                   1131 
                                   1132 ;-----------------------------------
                                   1133 ; create token list fromm text line 
                                   1134 ; save this list in pad buffer 
                                   1135 ;  compiled line format: 
                                   1136 ;    line_no  2 bytes {0...32767}
                                   1137 ;    count    1 byte  
                                   1138 ;    tokens   variable length 
                                   1139 ;   
                                   1140 ; input:
                                   1141 ;   none
                                   1142 ; modified variables:
                                   1143 ;   basicptr     token list buffer address 
                                   1144 ;   in.w  		 3|count, i.e. index in buffer
                                   1145 ;   count        length of line | 0  
                                   1146 ;-----------------------------------
                           000001  1147 	XSAVE=1
                           000002  1148 	VSIZE=2
      00848E                       1149 compile:
      00040E                       1150 	_vars VSIZE 
      00848E 52 02            [ 2]    1     sub sp,#VSIZE 
      008490 72 1A 00 25      [ 1] 1151 	bset flags,#FCOMP 
      008494 A6 00            [ 1] 1152 	ld a,#0
      008496 AE 00 00         [ 2] 1153 	ldw x,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008499 CF 16 E0         [ 2] 1154 	ldw pad,x ; destination buffer 
      00849C C7 16 E2         [ 1] 1155 	ld pad+2,a ; count 
      00849F AE 16 E3         [ 2] 1156 	ldw x,#pad+3
      0084A2 72 5F 00 02      [ 1] 1157 	clr in 
      0084A6 CD 8C 93         [ 4] 1158 	call get_token
      0084A9 A1 04            [ 1] 1159 	cp a,#TK_INTGR
      0084AB 26 11            [ 1] 1160 	jrne 2$
      0084AD A3 00 01         [ 2] 1161 	cpw x,#1 
      0084B0 2A 05            [ 1] 1162 	jrpl 1$
      0084B2 A6 0A            [ 1] 1163 	ld a,#ERR_BAD_VALUE
      0084B4 CC 88 17         [ 2] 1164 	jp tb_error
      0084B7 CF 16 E0         [ 2] 1165 1$:	ldw pad,x 
      0084BA 90 AE 16 E3      [ 2] 1166 	ldw y,#pad+3 
      0084BE 90 A3 17 60      [ 2] 1167 2$:	cpw y,#stack_full 
      0084C2 25 05            [ 1] 1168 	jrult 3$
      0084C4 A6 0F            [ 1] 1169 	ld a,#ERR_BUF_FULL 
      0084C6 CC 88 17         [ 2] 1170 	jp tb_error 
      0084C9                       1171 3$:	
      0084C9 93               [ 1] 1172 	ldw x,y 
      0084CA CD 8C 93         [ 4] 1173 	call get_token 
      0084CD A1 00            [ 1] 1174 	cp a,#TK_NONE 
      0084CF 26 ED            [ 1] 1175 	jrne 2$ 
                                   1176 ; compilation completed  
      0084D1 72 A2 16 E0      [ 2] 1177 	subw y,#pad
      0084D5 90 9F            [ 1] 1178     ld a,yl
      0084D7 AE 16 E0         [ 2] 1179 	ldw x,#pad 
      0084DA CF 00 19         [ 2] 1180 	ldw ptr16,x 
      0084DD E7 02            [ 1] 1181 	ld (2,x),a 
      0084DF FE               [ 2] 1182 	ldw x,(x)
      0084E0 27 09            [ 1] 1183 	jreq 10$
      0084E2 CD 84 21         [ 4] 1184 	call insert_line
      0084E5 72 5F 00 04      [ 1] 1185 	clr  count 
      0084E9 20 0F            [ 2] 1186 	jra  11$ 
      0084EB                       1187 10$: ; line# is zero 
      0084EB CE 00 19         [ 2] 1188 	ldw x,ptr16  
      0084EE CF 00 05         [ 2] 1189 	ldw basicptr,x 
      0084F1 E6 02            [ 1] 1190 	ld a,(2,x)
      0084F3 C7 00 04         [ 1] 1191 	ld count,a 
      0084F6 35 03 00 02      [ 1] 1192 	mov in,#3 
      0084FA                       1193 11$:
      00047A                       1194 	_drop VSIZE 
      0084FA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084FC 72 1B 00 25      [ 1] 1195 	bres flags,#FCOMP 
      008500 81               [ 4] 1196 	ret 
                                   1197 
                                   1198 ;------------------------------------
                                   1199 ;  set all variables to zero 
                                   1200 ; input:
                                   1201 ;   none 
                                   1202 ; output:
                                   1203 ;	none
                                   1204 ;------------------------------------
      008501                       1205 clear_vars:
      008501 AE 00 28         [ 2] 1206 	ldw x,#vars 
      008504 90 AE 00 34      [ 2] 1207 	ldw y,#2*26 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008508 7F               [ 1] 1208 1$:	clr (x)
      008509 5C               [ 2] 1209 	incw x 
      00850A 90 5A            [ 2] 1210 	decw y 
      00850C 26 FA            [ 1] 1211 	jrne 1$
      00850E 81               [ 4] 1212 	ret 
                                   1213 
                                   1214 ;-------------------------------------
                                   1215 ; check if A is a letter 
                                   1216 ; input:
                                   1217 ;   A 			character to test 
                                   1218 ; output:
                                   1219 ;   C flag      1 true, 0 false 
                                   1220 ;-------------------------------------
      00850F                       1221 is_alpha:
      00850F A1 41            [ 1] 1222 	cp a,#'A 
      008511 8C               [ 1] 1223 	ccf
      008512 24 0B            [ 1] 1224 	jrnc 9$ 
      008514 A1 5B            [ 1] 1225 	cp a,#'Z+1 
      008516 25 07            [ 1] 1226 	jrc 9$ 
      008518 A1 61            [ 1] 1227 	cp a,#'a 
      00851A 8C               [ 1] 1228 	ccf 
      00851B 24 02            [ 1] 1229 	jrnc 9$
      00851D A1 7B            [ 1] 1230 	cp a,#'z+1   
      00851F 81               [ 4] 1231 9$: ret 	
                                   1232 
                                   1233 ;------------------------------------
                                   1234 ; check if character in {'0'..'9'}
                                   1235 ; input:
                                   1236 ;    A  character to test
                                   1237 ; output:
                                   1238 ;    Carry  0 not digit | 1 digit
                                   1239 ;------------------------------------
      008520                       1240 is_digit:
      008520 A1 30            [ 1] 1241 	cp a,#'0
      008522 25 03            [ 1] 1242 	jrc 1$
      008524 A1 3A            [ 1] 1243     cp a,#'9+1
      008526 8C               [ 1] 1244 	ccf 
      008527 8C               [ 1] 1245 1$:	ccf 
      008528 81               [ 4] 1246     ret
                                   1247 
                                   1248 ;-------------------------------------
                                   1249 ;  program initialization entry point 
                                   1250 ;-------------------------------------
                           000001  1251 	MAJOR=1
                           000000  1252 	MINOR=0
      008529 0A 0A 54 69 6E 79 20  1253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00856F                       1254 cold_start:
                                   1255 ;set stack 
      00856F AE 17 FF         [ 2] 1256 	ldw x,#STACK_EMPTY
      008572 94               [ 1] 1257 	ldw sp,x   
                                   1258 ; clear all ram 
      008573 7F               [ 1] 1259 0$: clr (x)
      008574 5A               [ 2] 1260 	decw x 
      008575 26 FC            [ 1] 1261 	jrne 0$
                                   1262 ; activate pull up on all inputs 
      008577 A6 FF            [ 1] 1263 	ld a,#255 
      008579 C7 50 03         [ 1] 1264 	ld PA_CR1,a 
      00857C C7 50 08         [ 1] 1265 	ld PB_CR1,a 
      00857F C7 50 0D         [ 1] 1266 	ld PC_CR1,a 
      008582 C7 50 12         [ 1] 1267 	ld PD_CR1,a 
      008585 C7 50 17         [ 1] 1268 	ld PE_CR1,a 
      008588 C7 50 1C         [ 1] 1269 	ld PF_CR1,a 
      00858B C7 50 21         [ 1] 1270 	ld PG_CR1,a 
      00858E C7 50 2B         [ 1] 1271 	ld PI_CR1,a
                                   1272 ; set LD2 pin as output and turn it on
      008591 72 1A 50 0D      [ 1] 1273     bset PC_CR1,#LED2_BIT
      008595 72 1A 50 0E      [ 1] 1274     bset PC_CR2,#LED2_BIT
      008599 72 1A 50 0C      [ 1] 1275     bset PC_DDR,#LED2_BIT
      00859D 72 1A 50 0A      [ 1] 1276 	bset PC_ODR,#LED2_BIT 
                                   1277 ; disable schmitt triggers on Arduino CN4 analog inputs
      0085A1 55 00 3F 54 07   [ 1] 1278 	mov ADC_TDRL,0x3f
                                   1279 ; disable peripherals clocks
                                   1280 ;	clr CLK_PCKENR1 
                                   1281 ;	clr CLK_PCKENR2
      0085A6 72 5F 50 F2      [ 1] 1282 	clr AWU_TBR 
      0085AA 72 14 50 CA      [ 1] 1283 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1284 ; select internal clock no divisor: 16 Mhz 	
      0085AE A6 E1            [ 1] 1285 	ld a,#CLK_SWR_HSI 
      0085B0 5F               [ 1] 1286 	clrw x  
      0085B1 CD 81 1D         [ 4] 1287     call clock_init 
      0085B4 CD 81 40         [ 4] 1288 	call timer4_init
      0085B7 CD 81 33         [ 4] 1289 	call timer2_init
                                   1290 ; UART1 at 115200 BAUD
      0085BA CD 82 09         [ 4] 1291 	call uart1_init
                                   1292 ; activate PE_4 (user button interrupt)
      0085BD 72 18 50 18      [ 1] 1293     bset PE_CR2,#USR_BTN_BIT 
                                   1294 ; display system information
      0085C1 AE 85 29         [ 2] 1295 	ldw x,#software 
      0085C4 CD 82 57         [ 4] 1296 	call puts 
      0085C7 A6 01            [ 1] 1297 	ld a,#MAJOR 
      0085C9 C7 00 0E         [ 1] 1298 	ld acc8,a 
      0085CC 5F               [ 1] 1299 	clrw x 
      0085CD CF 00 0C         [ 2] 1300 	ldw acc24,x 
      0085D0 A6 0A            [ 1] 1301 	ld a,#10 
      0085D2 CD 89 65         [ 4] 1302 	call prti24 
      0085D5 A6 2E            [ 1] 1303 	ld a,#'.
      0085D7 CD 82 44         [ 4] 1304 	call putc 
      0085DA A6 00            [ 1] 1305 	ld a,#MINOR 
      0085DC C7 00 0E         [ 1] 1306 	ld acc8,a 
      0085DF 5F               [ 1] 1307 	clrw x 
      0085E0 CF 00 0C         [ 2] 1308 	ldw acc24,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085E3 A6 0A            [ 1] 1309 	ld a,#10 
      0085E5 CD 89 65         [ 4] 1310 	call prti24 
      0085E8 A6 0D            [ 1] 1311 	ld a,#CR 
      0085EA CD 82 44         [ 4] 1312 	call putc 
      0085ED CD 99 3A         [ 4] 1313 	call seek_fdrive 
      0085F0 9A               [ 1] 1314 	rim 
      0085F1 72 5C 00 17      [ 1] 1315 	inc seedy+1 
      0085F5 72 5C 00 15      [ 1] 1316 	inc seedx+1 
      0085F9 CD 86 81         [ 4] 1317 	call clear_basic
      0085FC CD 92 00         [ 4] 1318 	call ubound 
                                   1319 ;	jra 2$	
                                   1320 ; 150 msec beep 
      0085FF AE 00 96         [ 2] 1321 	ldw x,#150 
      008602 90 AE 03 E6      [ 2] 1322 	ldw y,#998 
      008606 CD 97 BF         [ 4] 1323 	call beep  
      008609 72 1B 50 0A      [ 1] 1324 2$:	bres PC_ODR,#LED2_BIT	
      00860D CD 86 16         [ 4] 1325 	call warm_init
      008610 CD 86 43         [ 4] 1326 	call load_autorun
      008613 CC 88 9F         [ 2] 1327     jp cmd_line  
                                   1328 
      008616                       1329 warm_init:
      008616 72 5F 00 25      [ 1] 1330 	clr flags 
      00861A 72 5F 00 22      [ 1] 1331 	clr loop_depth 
      00861E 35 04 00 26      [ 1] 1332 	mov tab_width,#TAB_WIDTH 
      008622 35 0A 00 0B      [ 1] 1333 	mov base,#10 
      008626 AE 00 00         [ 2] 1334 	ldw x,#0 
      008629 CF 00 05         [ 2] 1335 	ldw basicptr,x 
      00862C CF 00 01         [ 2] 1336 	ldw in.w,x 
      00862F 72 5F 00 04      [ 1] 1337 	clr count 
      008633 81               [ 4] 1338 	ret 
                                   1339 
                                   1340 ;--------------------------
                                   1341 ; called by tb_error when
                                   1342 ; flag FAUTORUN is set.
                                   1343 ; There is a bug in autorun 
                                   1344 ; program so cancel it.
                                   1345 ;---------------------------
      008634                       1346 cancel_autorun:
      008634 AE 40 00         [ 2] 1347 	ldw x,#AUTORUN_NAME 
      008637 CF 00 19         [ 2] 1348 	ldw farptr+1,x 
      00863A 4F               [ 1] 1349 	clr a
      00863B 5F               [ 1] 1350 	clrw x  
      00863C C7 00 18         [ 1] 1351 	ld farptr,a 
      00863F CD 81 71         [ 4] 1352 	call write_byte 
      008642 81               [ 4] 1353 	ret 
                                   1354 
                                   1355 
                                   1356 ;--------------------------
                                   1357 ; if autorun file defined 
                                   1358 ; in eeprom address AUTORUN_NAME 
                                   1359 ; load and run it.
                                   1360 ;-------------------------
      008643                       1361 load_autorun:
      008643 90 AE 40 00      [ 2] 1362 	ldw y,#AUTORUN_NAME
      008647 90 F6            [ 1] 1363 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008649 27 20            [ 1] 1364 	jreq 9$
      00864B CD 99 98         [ 4] 1365 	call search_file
      00864E 25 05            [ 1] 1366 	jrc 2$ 
                                   1367 ; if file doesn't exit
      008650 CD 86 34         [ 4] 1368 	call cancel_autorun
      008653 20 16            [ 2] 1369 	jra 9$ 
      008655 CD 9A A2         [ 4] 1370 2$:	call load_file
      008658 AE 40 00         [ 2] 1371 	ldw x,#AUTORUN_NAME 
      00865B CD 82 57         [ 4] 1372 	call puts
      00865E AE 86 6C         [ 2] 1373 	ldw x,#autorun_msg 
      008661 CD 82 57         [ 4] 1374 	call puts 
      008664 72 1C 00 25      [ 1] 1375 	bset flags,#FAUTORUN 
      008668 CC 97 84         [ 2] 1376 	jp run_it    
      00866B 81               [ 4] 1377 9$: ret 	
                                   1378 
      00866C 20 6C 6F 61 64 65 64  1379 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1380 ;---------------------------
                                   1381 ; reset BASIC text variables 
                                   1382 ; and clear variables 
                                   1383 ;---------------------------
      008681                       1384 clear_basic:
      008681 72 5F 00 04      [ 1] 1385 	clr count
      008685 72 5F 00 02      [ 1] 1386 	clr in  
      008689 AE 00 5C         [ 2] 1387 	ldw x,#free_ram 
      00868C CF 00 1E         [ 2] 1388 	ldw txtbgn,x 
      00868F CF 00 20         [ 2] 1389 	ldw txtend,x 
      008692 CD 85 01         [ 4] 1390 	call clear_vars 
      008695 81               [ 4] 1391 	ret 
                                   1392 
                                   1393 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1394 ;;   Tiny BASIC error messages     ;;
                                   1395 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008696                       1396 err_msg:
      008696 00 00 86 B6 86 C3 86  1397 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             D1 86 EA 86 F9
      0086A2 87 0F 87 25 87 3F 87  1398 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             50 87 61
      0086AC 87 6D 87 A0 87 B0 87  1399 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             C4 87 D7
                                   1400 
      0086B6 4D 65 6D 6F 72 79 20  1401 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0086C3 73 79 6E 74 61 78 20  1402 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0086D1 6D 61 74 68 20 6F 70  1403 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0086EA 64 69 76 69 73 69 6F  1404 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0086F9 69 6E 76 61 6C 69 64  1405 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  75-Bits]



             75 6D 62 65 72 2E 0A
             00
      008708 6D 62 65 72 2E 0A 00  1406 err_run_only: .asciz "run time only usage.\n" 
             72 75 6E 20 74 69 6D
             65 20 6F 6E 6C 79 20
             75
      00871E 73 61 67 65 2E 0A 00  1407 err_cmd_only: .asciz "command line only usage.\n"
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75
      008738 73 61 67 65 2E 0A 00  1408 err_duplicate: .asciz "duplicate name.\n"
             64 75 70 6C 69 63 61
             74 65 20
      008749 6E 61 6D 65 2E 0A 00  1409 err_not_file: .asciz "File not found.\n"
             46 69 6C 65 20 6E 6F
             74 20 66
      00875A 6F 75 6E 64 2E 0A 00  1410 err_bad_value: .asciz "bad value.\n"
             62 61 64 20 76
      008766 61 6C 75 65 2E 0A 00  1411 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74
      008799 68 65 72 65 2E 0A 00  1412 err_no_data: .asciz "No data found.\n"
             4E 6F 20 64 61 74 61
             20 66
      0087A9 6F 75 6E 64 2E 0A 00  1413 err_no_prog: .asciz "No program in RAM!\n"
             4E 6F 20 70 72 6F 67
             72 61 6D 20 69 6E
      0087BD 20 52 41 4D 21 0A 00  1414 err_no_fspace: .asciz "File system full.\n" 
             46 69 6C 65 20 73 79
             73 74 65 6D 20
      0087D0 66 75 6C 6C 2E 0A 00  1415 err_buf_full: .asciz "Buffer full\n"
             42 75 66 66 65 72
                                   1416 
      0087DD 20 66 75 6C 6C 0A 00  1417 rt_msg: .asciz "run time error, "
             72 75 6E 20 74 69 6D
             65 20 65
      0087EE 72 72 6F 72 2C 20 00  1418 comp_msg: .asciz "compile error, "
             63 6F 6D 70 69 6C 65
             20 65
      0087FE 72 72 6F 72 2C 20 00  1419 tk_id: .asciz "last token id: "
             6C 61 73 74 20 74 6F
             6B 65
                                   1420 
      000795                       1421 syntax_error:
      00880E 6E 20            [ 1] 1422 	ld a,#ERR_SYNTAX 
                                   1423 
      000797                       1424 tb_error:
      008810 69 64 3A 20 00   [ 2] 1425 	btjt flags,#FCOMP,1$
      008815 88               [ 1] 1426 	push a 
      008815 A6 02 64         [ 2] 1427 	ldw x, #rt_msg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008817 CD 01 D7         [ 4] 1428 	call puts 
      008817 72               [ 1] 1429 	pop a 
      008818 0A 00 25         [ 2] 1430 	ldw x, #err_msg 
      00881B 47 88 AE 87      [ 1] 1431 	clr acc16 
      00881F E4               [ 1] 1432 	sll a
      008820 CD 82 57 84      [ 1] 1433 	rlc acc16  
      008824 AE 86 96         [ 1] 1434 	ld acc8, a 
      008827 72 5F 00 0D      [ 2] 1435 	addw x,acc16 
      00882B 48               [ 2] 1436 	ldw x,(x)
      00882C 72 59 00         [ 4] 1437 	call puts
      00882F 0D C7 00         [ 2] 1438 	ldw x,basicptr
      008832 0E 72 BB         [ 1] 1439 	ld a,in 
      008835 00 0D FE         [ 4] 1440 	call prt_basic_line
      008838 CD 82 57         [ 2] 1441 	ldw x,#tk_id 
      00883B CE 00 05         [ 4] 1442 	call puts 
      00883E C6 00 02         [ 1] 1443 	ld a,in.saved 
      008841 CD               [ 1] 1444 	clrw x 
      008842 93               [ 1] 1445 	ld xl,a 
      008843 1A AE 88 05      [ 2] 1446 	addw x,basicptr 
      008847 CD               [ 1] 1447 	ld a,(x)
      008848 82               [ 1] 1448 	clrw x 
      008849 57               [ 1] 1449 	ld xl,a 
      00884A C6 00 03         [ 4] 1450 	call print_int
      00884D 5F 97 72 BB 00   [ 2] 1451 	btjf flags,#FAUTORUN ,6$
      008852 05 F6 5F         [ 4] 1452 	call cancel_autorun  
      008855 97 CD            [ 2] 1453 	jra 6$
      0007E3                       1454 1$:	
      008857 89               [ 1] 1455 	push a 
      008858 AD 72 0D         [ 2] 1456 	ldw x,#comp_msg
      00885B 00 25 3A         [ 4] 1457 	call puts 
      00885E CD               [ 1] 1458 	pop a 
      00885F 86 34 20         [ 2] 1459 	ldw x, #err_msg 
      008862 35 5F 00 0C      [ 1] 1460 	clr acc16 
      008863 48               [ 1] 1461 	sll a
      008863 88 AE 87 F5      [ 1] 1462 	rlc acc16  
      008867 CD 82 57         [ 1] 1463 	ld acc8, a 
      00886A 84 AE 86 96      [ 2] 1464 	addw x,acc16 
      00886E 72               [ 2] 1465 	ldw x,(x)
      00886F 5F 00 0D         [ 4] 1466 	call puts
      008872 48 72 59         [ 2] 1467 	ldw x,#tib
      008875 00 0D C7         [ 4] 1468 	call puts 
      008878 00 0E            [ 1] 1469 	ld a,#CR 
      00887A 72 BB 00         [ 4] 1470 	call putc
      00887D 0D FE CD         [ 2] 1471 	ldw x,in.w
      008880 82 57 AE         [ 4] 1472 	call spaces
      008883 16 90            [ 1] 1473 	ld a,#'^
      008885 CD 82 57         [ 4] 1474 	call putc 
      008888 A6 0D CD         [ 2] 1475 6$: ldw x,#STACK_EMPTY 
      00888B 82               [ 1] 1476     ldw sp,x
      00081C                       1477 warm_start:
      00888C 44 CE 00         [ 4] 1478 	call warm_init
                                   1479 ;----------------------------
                                   1480 ;   BASIC interpreter
                                   1481 ;----------------------------
      00081F                       1482 cmd_line: ; user interface 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00888F 01 CD            [ 1] 1483 	ld a,#CR 
      008891 82 7F A6         [ 4] 1484 	call putc 
      008894 5E CD            [ 1] 1485 	ld a,#'> 
      008896 82 44 AE         [ 4] 1486 	call putc
      008899 17 FF 94         [ 4] 1487 	call readln
      00889C 72 5D 00 03      [ 1] 1488 	tnz count 
      00889C CD 86            [ 1] 1489 	jreq cmd_line
      00889E 16 04 0E         [ 4] 1490 	call compile
                                   1491 ; if text begin with a line number
                                   1492 ; the compiler set count to zero    
                                   1493 ; so code is not interpreted
      00889F 72 5D 00 03      [ 1] 1494 	tnz count 
                                   1495 ;;--------------------
                                   1496 ;  test code 
                                   1497 ;;--------------------
                           000000  1498 TEST=0
                           000000  1499 .if TEST 
                                   1500 	ldw x, #pad 
                                   1501 	clrw y 
                                   1502 	ld a,(2,x) 
                                   1503 	ld yl,a 
                                   1504 	call hex_dump
                                   1505 .endif 
                                   1506 ;;; end test ----------
      00889F A6 0D            [ 1] 1507 	jreq cmd_line
                                   1508 
                                   1509 ; if direct command 
                                   1510 ; it's ready to interpret 
                                   1511 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1512 ;; This is the interpreter loop
                                   1513 ;; for each BASIC code line. 
                                   1514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00083B                       1515 interpreter: 
      0088A1 CD 82 44         [ 1] 1516 	ld a,in 
      0088A4 A6 3E CD         [ 1] 1517 	cp a,count 
      0088A7 82 44            [ 1] 1518 	jrmi interp_loop
      000843                       1519 next_line:
      0088A9 CD 8A DE 72 5D   [ 2] 1520 	btjf flags, #FRUN, cmd_line
      0088AE 00 04 27         [ 2] 1521 	ldw x,basicptr
      0088B1 ED CD 84 8E      [ 2] 1522 	addw x,in.w 
      0088B5 72 5D 00         [ 2] 1523 	cpw x,txtend 
      0088B8 04 27            [ 1] 1524 	jrpl warm_start
      0088BA E4 00 04         [ 2] 1525 	ldw basicptr,x ; start of next line  
      0088BB E6 02            [ 1] 1526 	ld a,(2,x)
      0088BB C6 00 02         [ 1] 1527 	ld count,a 
      0088BE C1 00 04 2B      [ 1] 1528 	mov in,#3 ; skip first 3 bytes of line 
      000860                       1529 interp_loop: 
      0088C2 1D 08 87         [ 4] 1530 	call next_token
      0088C3 A1 00            [ 1] 1531 	cp a,#TK_NONE 
      0088C3 72 01            [ 1] 1532 	jreq next_line 
      0088C5 00 25            [ 1] 1533 	cp a,#TK_CMD
      0088C7 D7 CE            [ 1] 1534 	jrne 1$
      0088C9 00               [ 4] 1535 	call (x) 
      0088CA 05 72            [ 2] 1536 	jra interp_loop 
      00086E                       1537 1$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0088CC BB 00            [ 1] 1538 	cp a,#TK_VAR
      0088CE 01 C3            [ 1] 1539 	jrne 2$
      0088D0 00 20 2A         [ 4] 1540 	call let_var  
      0088D3 C8 CF            [ 2] 1541 	jra interp_loop 
      000877                       1542 2$:	
      0088D5 00 05            [ 1] 1543 	cp a,#TK_ARRAY 
      0088D7 E6 02            [ 1] 1544 	jrne 3$
      0088D9 C7 00 04         [ 4] 1545 	call let_array 
      0088DC 35 03            [ 2] 1546 	jra interp_loop
      000880                       1547 3$:	
      0088DE 00 02            [ 1] 1548 	cp a,#TK_COLON 
      0088E0 27 DC            [ 1] 1549 	jreq interp_loop 
                           000000  1550 .if TEST
                                   1551 	clrw x 
                                   1552 	ld xl,a 
                                   1553 	call print_int 
                                   1554 	ld a,#'?
                                   1555 	call putc
                                   1556 	ld a,#CR 
                                   1557 	call putc  
                                   1558 .endif 
      0088E0 CD 89 07         [ 2] 1559 	jp syntax_error 
                                   1560 
                                   1561 		
                                   1562 ;--------------------------
                                   1563 ; extract next token from
                                   1564 ; token list 
                                   1565 ; basicptr -> base address 
                                   1566 ; in  -> offset in list array 
                                   1567 ; output:
                                   1568 ;   A 		token attribute
                                   1569 ;   X 		token value if there is one
                                   1570 ;----------------------------------------
      000887                       1571 next_token:
      0088E3 A1               [ 1] 1572 	clrw x 
      0088E4 00 27 DC         [ 1] 1573 	ld a,in 
      0088E7 A1 80 26         [ 1] 1574 	sub a,count ; don't replace sub by cp!  
      0088EA 03 FD            [ 1] 1575 	jrmi 0$
      0088EC 20               [ 4] 1576 	ret  ; end of BASIC line 
      000891                       1577 0$: 
      0088ED F2 00 01 00 02   [ 1] 1578 	mov in.saved,in 
      0088EE 90 CE 00 04      [ 2] 1579 	ldw y,basicptr 
      0088EE A1 05 26 05      [ 2] 1580 	addw y,in.w 
      0088F2 CD 92            [ 1] 1581 	ld a,(y)
      0088F4 33 20            [ 1] 1582 	jreq 9$ 
      0088F6 E9 5C            [ 2] 1583 	incw y 
      0088F7 4D               [ 1] 1584 	tnz a 
      0088F7 A1 06            [ 1] 1585 	jrmi 6$
      0088F9 26 05            [ 1] 1586 	cp a,#TK_ARRAY
      0088FB CD 92            [ 1] 1587 	jrpl 9$  ; no attribute for these
      0088FD 30 20            [ 1] 1588 	cp a,#TK_COLON
      0088FF E0 2D            [ 1] 1589 	jreq 9$ 
      008900 A1 04            [ 1] 1590 	cp a,#TK_INTGR
      008900 A1 01            [ 1] 1591 	jrmi 1$
                                   1592 ; attribute type WORD 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008902 27               [ 1] 1593 	ldw x,y 
      008903 DC               [ 2] 1594 	ldw x,(x)
      008904 CC 88 15 02      [ 2] 1595 	addw y,#2  
      008907 20 21            [ 2] 1596 	jra 9$
      0008BB                       1597 1$: ; 
      008907 5F C6            [ 1] 1598 	cp a,#TK_CHAR
      008909 00 02            [ 1] 1599 	jrne 2$
      00890B C0 00            [ 1] 1600 	ld a,(y)
      00890D 04 2B            [ 2] 1601 	incw y
      00890F 01               [ 1] 1602 	clrw x 
      008910 81               [ 1] 1603 	ld xl,a 
      008911 A6 03            [ 1] 1604 	ld a,#TK_CHAR
      008911 55 00            [ 2] 1605 	jra 9$ 
      008913 02 00            [ 1] 1606 2$:	cp a,#TK_QSTR 
      008915 03 90            [ 1] 1607 	jrne 9$
      008917 CE               [ 1] 1608 	ldw x,y 
                                   1609 ; move pointer after string 
      008918 00 05            [ 1] 1610 3$:	tnz (y)
      00891A 72 B9            [ 1] 1611 	jreq 8$
      00891C 00 01            [ 2] 1612 	incw y
      00891E 90 F6            [ 2] 1613 	jra 3$
      0008D6                       1614 6$: 
      008920 27               [ 1] 1615 	ldw x,y 
      008921 3A               [ 2] 1616 	ldw x,(x)
      008922 90 5C            [ 2] 1617 	incw y 	 
      008924 4D 2B            [ 2] 1618 8$:	incw y 
      008926 2F A1 06 2A      [ 2] 1619 9$: subw y,basicptr 
      00892A 31 A1 01 27      [ 2] 1620     ldw in.w,y 
      00892E 2D               [ 4] 1621 	ret	
                                   1622 
                                   1623 
                                   1624 ;----------------------------------------
                                   1625 ;   DEBUG support functions
                                   1626 ;----------------------------------------
                           000000  1627 .if DEBUG 
                                   1628 
                                   1629 ; turn LED on 
                                   1630 ledon:
                                   1631     bset PC_ODR,#LED2_BIT
                                   1632     ret 
                                   1633 
                                   1634 ; turn LED off 
                                   1635 ledoff:
                                   1636     bres PC_ODR,#LED2_BIT 
                                   1637     ret 
                                   1638 
                                   1639 ; invert LED status 
                                   1640 ledtoggle:
                                   1641     ld a,#LED2_MASK
                                   1642     xor a,PC_ODR
                                   1643     ld PC_ODR,a
                                   1644     ret 
                                   1645 
                                   1646 left_paren:
                                   1647 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1648 	call putc
                                   1649 	ld a,#'( 
                                   1650 	call putc 	
                                   1651 	ret 
                                   1652 
                                   1653 ;------------------------------
                                   1654 ; print 8 bit register 
                                   1655 ; input:
                                   1656 ;   X  point to register name 
                                   1657 ;   A  register value to print 
                                   1658 ; output:
                                   1659 ;   none
                                   1660 ;------------------------------- 
                                   1661 prt_reg8:
                                   1662 	push a 
                                   1663 	call puts 
                                   1664 	ld a,(1,sp) 
                                   1665 	ld acc8,a 
                                   1666 	clrw x 
                                   1667 	ld xl,a 
                                   1668 	mov base,#16
                                   1669 	call print_int 
                                   1670 	call left_paren 
                                   1671 	pop a 
                                   1672 	clrw x 
                                   1673 	ld xl,a 
                                   1674 	mov base,#10 
                                   1675 	call print_int  
                                   1676 	ld a,#') 
                                   1677 	call putc
                                   1678 	ret
                                   1679 
                                   1680 ;--------------------------------
                                   1681 ; print 16 bits register 
                                   1682 ; input:
                                   1683 ;   X   point register name 
                                   1684 ;   Y   register value to print 
                                   1685 ; output:
                                   1686 ;  none
                                   1687 ;--------------------------------
                                   1688 prt_reg16: 
                                   1689 	pushw y 
                                   1690 	call puts 
                                   1691 	ldw x,(1,sp) 
                                   1692 	mov base,#16 
                                   1693 	call print_int  
                                   1694 	call left_paren 
                                   1695 	popw x 
                                   1696 	mov base,#10 
                                   1697 	call print_int  
                                   1698 	ld a,#') 
                                   1699 	call putc
                                   1700 	ret 
                                   1701 
                                   1702 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1703 ; print registers contents saved on
                                   1704 ; stack by trap interrupt.
                                   1705 ;------------------------------------
                                   1706 print_registers:
                                   1707 	ldw x,#STATES
                                   1708 	call puts
                                   1709 ; print EPC 
                                   1710 	ldw x, #REG_EPC
                                   1711 	call puts 
                                   1712 	ld a, (11,sp)
                                   1713 	ld acc8,a 
                                   1714 	ld a, (10,sp) 
                                   1715 	ld acc16,a 
                                   1716 	ld a,(9,sp) 
                                   1717 	ld acc24,a
                                   1718 	clrw x  
                                   1719 	ld a,#16
                                   1720 	call prti24  
                                   1721 ; print X
                                   1722 	ldw x,#REG_X
                                   1723 	ldw y,(5,sp)
                                   1724 	call prt_reg16  
                                   1725 ; print Y 
                                   1726 	ldw x,#REG_Y
                                   1727 	ldw y, (7,sp)
                                   1728 	call prt_reg16  
                                   1729 ; print A 
                                   1730 	ldw x,#REG_A
                                   1731 	ld a, (4,sp) 
                                   1732 	call prt_reg8
                                   1733 ; print CC 
                                   1734 	ldw x,#REG_CC 
                                   1735 	ld a, (3,sp) 
                                   1736 	call prt_reg8 
                                   1737 ; print SP 
                                   1738 	ldw x,#REG_SP
                                   1739 	ldw y,sp 
                                   1740 	addw y,#12
                                   1741 	call prt_reg16  
                                   1742 	ld a,#'\n' 
                                   1743 	call putc
                                   1744 	ret
                                   1745 
                                   1746 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1747 REG_EPC: .asciz "EPC:"
                                   1748 REG_Y:   .asciz "\nY:" 
                                   1749 REG_X:   .asciz "\nX:"
                                   1750 REG_A:   .asciz "\nA:" 
                                   1751 REG_CC:  .asciz "\nCC:"
                                   1752 REG_SP:  .asciz "\nSP:"
                                   1753 
                                   1754 .endif ; DEBUG 
                                   1755 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1756 
                                   1757 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1758 ;------------------------------------
                                   1759 ; print integer in acc24 
                                   1760 ; input:
                                   1761 ;	acc24 		integer to print 
                                   1762 ;	A 			numerical base for conversion 
                                   1763 ;               if bit 7 is set add a space at print end.
                                   1764 ;   XL 			field width, 0 -> no fill.
                                   1765 ;  output:
                                   1766 ;    none 
                                   1767 ;------------------------------------
                           000001  1768 	WIDTH = 1
                           000002  1769 	BASE = 2
                           000003  1770 	ADD_SPACE=3 ; add a space after number 
                           000003  1771 	VSIZE = 3
      0008E5                       1772 prti24:
      0008E5                       1773 	_vars VSIZE 
      00892F A1 04            [ 2]    1     sub sp,#VSIZE 
      008931 2B 08            [ 1] 1774 	clr (ADD_SPACE,sp)
      008933 93 FE            [ 1] 1775 	bcp a,#0x80 
      008935 72 A9            [ 1] 1776 	jreq 0$ 
      008937 00 02            [ 1] 1777 	cpl (ADD_SPACE,sp)
      008939 20 21            [ 1] 1778 0$:	and a,#31 
      00893B 6B 02            [ 1] 1779 	ld (BASE,sp),a
      00893B A1               [ 1] 1780 	ld a,xl
      00893C 03 26            [ 1] 1781 	ld (WIDTH,sp),a 
      00893E 0A 90            [ 1] 1782 	ld a, (BASE,sp)  
      008940 F6 90 5C         [ 4] 1783     call itoa  ; conversion entier en  .asciz
      008943 5F 97            [ 1] 1784 1$: ld a,(WIDTH,sp)
      008945 A6 03            [ 1] 1785 	jreq 4$
      008947 20 13 A1         [ 1] 1786 	ld acc8,a 
      00894A 02               [ 2] 1787 	pushw x 
      00894B 26 0F 93         [ 4] 1788 	call strlen 
      00894E 90               [ 1] 1789 	ld a,xl 
      00894F 7D               [ 2] 1790 	popw x 
      008950 27 08 90         [ 3] 1791 	exg a,acc8 
      008953 5C 20 F8         [ 1] 1792 	sub a,acc8 
      008956 2B 0E            [ 1] 1793 	jrmi 4$
      008956 93 FE            [ 1] 1794 	ld (WIDTH,sp),a 
      008958 90 5C            [ 1] 1795 	ld  a,#SPACE
      00895A 90 5C            [ 1] 1796 3$: tnz (WIDTH,sp)
      00895C 72 B2            [ 1] 1797 	jreq 4$
      00895E 00               [ 2] 1798 	decw x 
      00895F 05               [ 1] 1799 	ld (x),a 
      008960 90 CF            [ 1] 1800 	dec (WIDTH,sp) 
      008962 00 01            [ 2] 1801 	jra 3$
      00091E                       1802 4$: 
      008964 81 01 D7         [ 4] 1803 	call puts 
      008965 0D 03            [ 1] 1804 	tnz (ADD_SPACE,sp)
      008965 52 03            [ 1] 1805 	jreq 5$
      008967 0F 03            [ 1] 1806     ld a,#SPACE 
      008969 A5 80 27         [ 4] 1807 	call putc 
      00092A                       1808 5$: _drop VSIZE 
      00896C 02 03            [ 2]    1     addw sp,#VSIZE 
      00896E 03               [ 4] 1809     ret	
                                   1810 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1811 ;-----------------------------------
                                   1812 ; print a 16 bit integer 
                                   1813 ; using variable 'base' as conversion
                                   1814 ; format.
                                   1815 ; input:
                                   1816 ;   X       integer to print 
                                   1817 ;   base    conversion base 
                                   1818 ; output:
                                   1819 ;   none 
                                   1820 ;-----------------------------------
                           000001  1821 	SIGN=1
                           000002  1822 	STRING=2
                                   1823 ;; 9 char on stack for string buffer	
                           00000A  1824 	STREND=2+8 
                           00000A  1825 	VSIZE=10
      00092D                       1826 print_int: 
      00092D                       1827 	_vars VSIZE 
      00896F A4 1F            [ 2]    1     sub sp,#VSIZE 
      008971 6B 02            [ 1] 1828 	clr (SIGN,sp)
      008973 9F 6B            [ 1] 1829 	ldw y,sp 
      008975 01 7B 02 CD      [ 2] 1830 	addw y,#STREND  
      008979 8A 12            [ 1] 1831 	clr (y)
      00897B 7B 01 27         [ 1] 1832 	ld a,base  
      00897E 1F C7            [ 1] 1833 	cp a,#10 
      008980 00 0E            [ 1] 1834 	jrne 1$ 
      008982 89               [ 2] 1835 	tnzw x 
      008983 CD 83            [ 1] 1836 	jrpl 1$ 
      008985 36 9F            [ 1] 1837 	cpl (SIGN,sp)
      008987 85               [ 2] 1838 	negw x 	 
      000946                       1839 1$:	
      008988 31 00 0E         [ 1] 1840 	ld a,base 
      00898B C0               [ 2] 1841 	div x,a 
      00898C 00 0E            [ 1] 1842 	add a,#'0 
      00898E 2B 0E            [ 1] 1843 	cp a,#'9+1 
      008990 6B 01            [ 1] 1844 	jrmi 2$ 
      008992 A6 20            [ 1] 1845 	add a,#7 
      008994 0D 01            [ 2] 1846 2$: decw y 
      008996 27 06            [ 1] 1847 	ld (y),a 
      008998 5A               [ 2] 1848 	tnzw x 
      008999 F7 0A            [ 1] 1849 	jrne 1$ 
      00899B 01 20            [ 1] 1850 	ld a,#16 
      00899D F6 00 0A         [ 1] 1851 	cp a,base 
      00899E 26 08            [ 1] 1852 	jrne 3$
      00899E CD 82            [ 1] 1853 	ld a,#'$
      0089A0 57 0D            [ 2] 1854 	decw y  
      0089A2 03 27            [ 1] 1855 	ld (y),a
      0089A4 05 A6            [ 2] 1856 	jra 9$ 
      0089A6 20 CD            [ 1] 1857 3$: tnz (SIGN,sp)
      0089A8 82 44            [ 1] 1858 	jreq 9$ 
      0089AA 5B 03            [ 1] 1859 	ld a,#'-
      0089AC 81 5A            [ 2] 1860 	decw y  
      0089AD 90 F7            [ 1] 1861 	ld (y),a
      000972                       1862 9$:	
      0089AD 52               [ 1] 1863 	ldw x,sp 
      0089AE 0A 0F 01         [ 2] 1864 	addw x,#STREND  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089B1 90 96            [ 2] 1865 	pushw y
      0089B3 72 A9 00         [ 2] 1866 	subw x,(1,sp)
      00097B                       1867 	_drop 2 
      0089B6 0A 90            [ 2]    1     addw sp,#2 
      00097D                       1868 10$:
      0089B8 7F               [ 1] 1869 	ld a,xl 
      0089B9 C6 00 0B         [ 1] 1870 	cp a,tab_width
      0089BC A1 0A            [ 1] 1871 	jruge 12$
      0089BE 26 06            [ 1] 1872 	ld a,#SPACE 
      0089C0 5D 2A 03         [ 4] 1873 	call putc 
      0089C3 03               [ 2] 1874 	incw x 
      0089C4 01 50            [ 2] 1875 	jra 10$ 
      0089C6                       1876 12$:
      0089C6 C6               [ 1] 1877     ldw x,y 
      0089C7 00 0B 62         [ 4] 1878 	call puts  
      00098F                       1879 	_drop VSIZE 
      0089CA AB 30            [ 2]    1     addw sp,#VSIZE 
      0089CC A1               [ 4] 1880 	ret 
                                   1881 
                                   1882 ;------------------------------------
                                   1883 ; convert integer in acc24 to string
                                   1884 ; input:
                                   1885 ;   A	  	base
                                   1886 ;	acc24	integer to convert
                                   1887 ; output:
                                   1888 ;   X  		pointer to string
                                   1889 ;------------------------------------
                           000001  1890 	SIGN=1  ; integer sign 
                           000002  1891 	BASE=2  ; numeric base 
                           000002  1892 	VSIZE=2  ;locals size
      000992                       1893 itoa:
      0089CD 3A 2B            [ 2] 1894 	sub sp,#VSIZE
      0089CF 02 AB            [ 1] 1895 	ld (BASE,sp), a  ; base
      0089D1 07 90            [ 1] 1896 	clr (SIGN,sp)    ; sign
      0089D3 5A 90            [ 1] 1897 	cp a,#10
      0089D5 F7 5D            [ 1] 1898 	jrne 1$
                                   1899 	; base 10 string display with negative sign if bit 23==1
      0089D7 26 ED A6 10 C1   [ 2] 1900 	btjf acc24,#7,1$
      0089DC 00 0B            [ 1] 1901 	cpl (SIGN,sp)
      0089DE 26 08 A6         [ 4] 1902 	call neg_acc24
      0009A6                       1903 1$:
                                   1904 ; initialize string pointer 
      0089E1 24 90 5A         [ 2] 1905 	ldw x,#pad+PAD_SIZE-1
      0089E4 90               [ 1] 1906 	clr (x)
      0009AA                       1907 itoa_loop:
      0089E5 F7 20            [ 1] 1908     ld a,(BASE,sp)
      0089E7 0A 0D 01         [ 4] 1909     call divu24_8 ; acc24/A 
      0089EA 27 06            [ 1] 1910     add a,#'0  ; remainder of division
      0089EC A6 2D            [ 1] 1911     cp a,#'9+1
      0089EE 90 5A            [ 1] 1912     jrmi 2$
      0089F0 90 F7            [ 1] 1913     add a,#7 
      0089F2 5A               [ 2] 1914 2$: decw x
      0089F2 96               [ 1] 1915     ld (x),a
                                   1916 	; if acc24==0 conversion done
      0089F3 1C 00 0A         [ 1] 1917 	ld a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089F6 90 89 72         [ 1] 1918 	or a,acc16
      0089F9 F0 01 5B         [ 1] 1919 	or a,acc8
      0089FC 02 E6            [ 1] 1920     jrne itoa_loop
                                   1921 	;conversion done, next add '$' or '-' as required
      0089FD 7B 02            [ 1] 1922 	ld a,(BASE,sp)
      0089FD 9F C1            [ 1] 1923 	cp a,#16
      0089FF 00 26            [ 1] 1924 	jreq 8$
      008A01 24 08            [ 1] 1925 	ld a,(SIGN,sp)
      008A03 A6 20            [ 1] 1926     jreq 10$
      008A05 CD 82            [ 1] 1927     ld a,#'-
      008A07 44 5C            [ 2] 1928 	jra 9$ 
      008A09 20 F2            [ 1] 1929 8$: ld a,#'$ 
      008A0B 5A               [ 2] 1930 9$: decw x
      008A0B 93               [ 1] 1931     ld (x),a
      0009D6                       1932 10$:
      008A0C CD 82            [ 2] 1933 	addw sp,#VSIZE
      008A0E 57               [ 4] 1934 	ret
                                   1935 
                                   1936 ;-------------------------------------
                                   1937 ; divide uint24_t by uint8_t
                                   1938 ; used to convert uint24_t to string
                                   1939 ; input:
                                   1940 ;	acc24	dividend
                                   1941 ;   A 		divisor
                                   1942 ; output:
                                   1943 ;   acc24	quotient
                                   1944 ;   A		remainder
                                   1945 ;------------------------------------- 
                                   1946 ; offset  on sp of arguments and locals
                           000001  1947 	U8   = 1   ; divisor on stack
                           000001  1948 	VSIZE =1
      0009D9                       1949 divu24_8:
      008A0F 5B               [ 2] 1950 	pushw x ; save x
      008A10 0A               [ 1] 1951 	push a 
                                   1952 	; ld dividend UU:MM bytes in X
      008A11 81 00 0B         [ 1] 1953 	ld a, acc24
      008A12 95               [ 1] 1954 	ld xh,a
      008A12 52 02 6B         [ 1] 1955 	ld a,acc24+1
      008A15 02               [ 1] 1956 	ld xl,a
      008A16 0F 01            [ 1] 1957 	ld a,(U8,SP) ; divisor
      008A18 A1               [ 2] 1958 	div x,a ; UU:MM/U8
      008A19 0A               [ 1] 1959 	push a  ;save remainder
      008A1A 26               [ 1] 1960 	ld a,xh
      008A1B 0A 72 0F         [ 1] 1961 	ld acc24,a
      008A1E 00               [ 1] 1962 	ld a,xl
      008A1F 0C 05 03         [ 1] 1963 	ld acc24+1,a
      008A22 01               [ 1] 1964 	pop a
      008A23 CD               [ 1] 1965 	ld xh,a
      008A24 8A BB 0D         [ 1] 1966 	ld a,acc24+2
      008A26 97               [ 1] 1967 	ld xl,a
      008A26 AE 17            [ 1] 1968 	ld a,(U8,sp) ; divisor
      008A28 5F               [ 2] 1969 	div x,a  ; R:LL/U8
      008A29 7F 01            [ 1] 1970 	ld (U8,sp),a ; save remainder
      008A2A 9F               [ 1] 1971 	ld a,xl
      008A2A 7B 02 CD         [ 1] 1972 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A2D 8A               [ 1] 1973 	pop a
      008A2E 59               [ 2] 1974 	popw x
      008A2F AB               [ 4] 1975 	ret
                                   1976 
                                   1977 ;--------------------------------------
                                   1978 ; unsigned multiply uint24_t by uint8_t
                                   1979 ; use to convert numerical string to uint24_t
                                   1980 ; input:
                                   1981 ;	acc24	uint24_t 
                                   1982 ;   A		uint8_t
                                   1983 ; output:
                                   1984 ;   acc24   A*acc24
                                   1985 ;-------------------------------------
                                   1986 ; local variables offset  on sp
                           000003  1987 	U8   = 3   ; A pushed on stack
                           000002  1988 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1989 	OVFH = 1  ; multiplication overflow high byte
                           000003  1990 	VSIZE = 3
      000A01                       1991 mulu24_8:
      008A30 30               [ 2] 1992 	pushw x    ; save X
                                   1993 	; local variables
      008A31 A1               [ 1] 1994 	push a     ; U8
      008A32 3A               [ 1] 1995 	clrw x     ; initialize overflow to 0
      008A33 2B               [ 2] 1996 	pushw x    ; multiplication overflow
                                   1997 ; multiply low byte.
      008A34 02 AB 07         [ 1] 1998 	ld a,acc24+2
      008A37 5A               [ 1] 1999 	ld xl,a
      008A38 F7 C6            [ 1] 2000 	ld a,(U8,sp)
      008A3A 00               [ 4] 2001 	mul x,a
      008A3B 0C               [ 1] 2002 	ld a,xl
      008A3C CA 00 0D         [ 1] 2003 	ld acc24+2,a
      008A3F CA               [ 1] 2004 	ld a, xh
      008A40 00 0E            [ 1] 2005 	ld (OVFL,sp),a
                                   2006 ; multipy middle byte
      008A42 26 E6 7B         [ 1] 2007 	ld a,acc24+1
      008A45 02               [ 1] 2008 	ld xl,a
      008A46 A1 10            [ 1] 2009 	ld a, (U8,sp)
      008A48 27               [ 4] 2010 	mul x,a
                                   2011 ; add overflow to this partial product
      008A49 08 7B 01         [ 2] 2012 	addw x,(OVFH,sp)
      008A4C 27               [ 1] 2013 	ld a,xl
      008A4D 08 A6 2D         [ 1] 2014 	ld acc24+1,a
      008A50 20               [ 1] 2015 	clr a
      008A51 02 A6            [ 1] 2016 	adc a,#0
      008A53 24 5A            [ 1] 2017 	ld (OVFH,sp),a
      008A55 F7               [ 1] 2018 	ld a,xh
      008A56 6B 02            [ 1] 2019 	ld (OVFL,sp),a
                                   2020 ; multiply most signficant byte	
      008A56 5B 02 81         [ 1] 2021 	ld a, acc24
      008A59 97               [ 1] 2022 	ld xl, a
      008A59 89 88            [ 1] 2023 	ld a, (U8,sp)
      008A5B C6               [ 4] 2024 	mul x,a
      008A5C 00 0C 95         [ 2] 2025 	addw x, (OVFH,sp)
      008A5F C6               [ 1] 2026 	ld a, xl
      008A60 00 0D 97         [ 1] 2027 	ld acc24,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008A63 7B 01            [ 2] 2028     addw sp,#VSIZE
      008A65 62               [ 2] 2029 	popw x
      008A66 88               [ 4] 2030 	ret
                                   2031 
                                   2032 ;------------------------------------
                                   2033 ;  two's complement acc24
                                   2034 ;  input:
                                   2035 ;		acc24 variable
                                   2036 ;  output:
                                   2037 ;		acc24 variable
                                   2038 ;-------------------------------------
      000A3B                       2039 neg_acc24:
      008A67 9E C7 00 0C      [ 1] 2040 	cpl acc24+2
      008A6B 9F C7 00 0D      [ 1] 2041 	cpl acc24+1
      008A6F 84 95 C6 00      [ 1] 2042 	cpl acc24
      008A73 0E 97            [ 1] 2043 	ld a,#1
      008A75 7B 01 62         [ 1] 2044 	add a,acc24+2
      008A78 6B 01 9F         [ 1] 2045 	ld acc24+2,a
      008A7B C7               [ 1] 2046 	clr a
      008A7C 00 0E 84         [ 1] 2047 	adc a,acc24+1
      008A7F 85 81 0C         [ 1] 2048 	ld acc24+1,a 
      008A81 4F               [ 1] 2049 	clr a 
      008A81 89 88 5F         [ 1] 2050 	adc a,acc24 
      008A84 89 C6 00         [ 1] 2051 	ld acc24,a 
      008A87 0E               [ 4] 2052 	ret
                                   2053 
                                   2054 
                                   2055 ;------------------------------------
                                   2056 ; read a line of text from terminal
                                   2057 ; input:
                                   2058 ;	none
                                   2059 ; local variable on stack:
                                   2060 ;	LL  line length
                                   2061 ;   RXCHAR last received character 
                                   2062 ; output:
                                   2063 ;   text in tib  buffer
                                   2064 ;   count  line length 
                                   2065 ;------------------------------------
                                   2066 	; local variables
                           000001  2067 	LL_HB=1
                           000001  2068 	RXCHAR = 1 ; last char received
                           000002  2069 	LL = 2  ; accepted line length
                           000002  2070 	VSIZE=2 
      000A5E                       2071 readln:
      008A88 97 7B            [ 1] 2072 	push #0
      008A8A 03 42            [ 1] 2073 	push #0  
      008A8C 9F C7 00 0E      [ 2] 2074  	ldw y,#tib ; input buffer
      000A66                       2075 readln_loop:
      008A90 9E 6B 02         [ 4] 2076 	call getc
      008A93 C6 00            [ 1] 2077 	ld (RXCHAR,sp),a
      008A95 0D 97            [ 1] 2078 	cp a,#CR
      008A97 7B 03            [ 1] 2079 	jrne 1$
      008A99 42 72 FB         [ 2] 2080 	jp readln_quit
      008A9C 01 9F            [ 1] 2081 1$:	cp a,#LF 
      008A9E C7 00            [ 1] 2082 	jreq readln_quit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008AA0 0D 4F            [ 1] 2083 	cp a,#BS
      008AA2 A9 00            [ 1] 2084 	jreq del_back
      008AA4 6B 01            [ 1] 2085 	cp a,#CTRL_D
      008AA6 9E 6B            [ 1] 2086 	jreq del_ln
      008AA8 02 C6            [ 1] 2087 	cp a,#CTRL_R 
      008AAA 00 0C            [ 1] 2088 	jreq reprint 
                                   2089 ;	cp a,#'[
                                   2090 ;	jreq ansi_seq
      000A82                       2091 final_test:
      008AAC 97 7B            [ 1] 2092 	cp a,#SPACE
      008AAE 03 42            [ 1] 2093 	jrpl accept_char
      008AB0 72 FB            [ 2] 2094 	jra readln_loop
      000A88                       2095 ansi_seq:
                                   2096 ;	call getc
                                   2097 ;	cp a,#'C 
                                   2098 ;	jreq rigth_arrow
                                   2099 ;	cp a,#'D 
                                   2100 ;	jreq left_arrow 
                                   2101 ;	jra final_test
      000A88                       2102 right_arrow:
                                   2103 ;	ld a,#BSP 
                                   2104 ;	call putc 
                                   2105 ;	jra realn_loop 
      000A88                       2106 left_arrow:
                                   2107 ;	jra readln_loop
      000A88                       2108 reprint: 
      008AB2 01 9F            [ 1] 2109 	tnz (LL,sp)
      008AB4 C7 00            [ 1] 2110 	jrne readln_loop
      008AB6 0C 5B 03         [ 2] 2111 	ldw x,#tib 
      008AB9 85 81 B6         [ 4] 2112 	call strlen 
      008ABB 90 AE 16 90      [ 2] 2113 	ldw y,#tib 
      008ABB 72               [ 1] 2114 	ld a,xl
      008ABC 53 00            [ 1] 2115 	jreq readln_loop
      008ABE 0E 72            [ 1] 2116 	ld (LL,sp),a 
      008AC0 53 00 0D         [ 2] 2117 	ldw x,#tib 
      008AC3 72 53 00         [ 4] 2118 	call puts
      008AC6 0C A6            [ 1] 2119 	clr (LL_HB,sp)
      008AC8 01 CB 00         [ 2] 2120 	addw y,(LL_HB,sp)
      008ACB 0E C7            [ 2] 2121 	jra readln_loop 
      000AA8                       2122 del_ln:
      008ACD 00 0E            [ 1] 2123 	ld a,(LL,sp)
      008ACF 4F C9 00         [ 4] 2124 	call delete
      008AD2 0D C7 00 0D      [ 2] 2125 	ldw y,#tib
      008AD6 4F C9            [ 1] 2126 	clr (y)
      008AD8 00 0C            [ 1] 2127 	clr (LL,sp)
      008ADA C7 00            [ 2] 2128 	jra readln_loop
      000AB7                       2129 del_back:
      008ADC 0C 81            [ 1] 2130     tnz (LL,sp)
      008ADE 27 AB            [ 1] 2131     jreq readln_loop
      008ADE 4B 00            [ 1] 2132     dec (LL,sp)
      008AE0 4B 00            [ 2] 2133     decw y
      008AE2 90 AE            [ 1] 2134     clr  (y)
      008AE4 16 90 E1         [ 4] 2135     call bksp 
      008AE6 20 A0            [ 2] 2136     jra readln_loop	
      000AC6                       2137 accept_char:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008AE6 CD 82            [ 1] 2138 	ld a,#TIB_SIZE-1
      008AE8 4D 6B            [ 1] 2139 	cp a, (LL,sp)
      008AEA 01 A1            [ 1] 2140 	jreq readln_loop
      008AEC 0D 26            [ 1] 2141 	ld a,(RXCHAR,sp)
      008AEE 03 CC            [ 1] 2142 	ld (y),a
      008AF0 8B 5B            [ 1] 2143 	inc (LL,sp)
      008AF2 A1 0A            [ 2] 2144 	incw y
      008AF4 27 65            [ 1] 2145 	clr (y)
      008AF6 A1 08 27         [ 4] 2146 	call putc 
      008AF9 3D A1            [ 2] 2147 	jra readln_loop
      000ADB                       2148 readln_quit:
      008AFB 04 27            [ 1] 2149 	clr (y)
      008AFD 2A A1            [ 1] 2150 	ld a,(LL,sp)
      008AFF 12 27 06         [ 1] 2151 	ld count,a 
      008B02 A6 0D            [ 1] 2152 	ld a,#CR
      008B02 A1 20 2A         [ 4] 2153 	call putc
      000AE7                       2154 	_drop VSIZE 
      008B05 40 20            [ 2]    1     addw sp,#VSIZE 
      008B07 DE               [ 4] 2155 	ret
                                   2156 
                                   2157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           000000  2158 .if DEBUG 	
                                   2159 ;----------------------------
                                   2160 ; command interface
                                   2161 ; only 3 commands:
                                   2162 ;  'q' to resume application
                                   2163 ;  'p [addr]' to print memory values 
                                   2164 ;  's addr' to print string 
                                   2165 ;----------------------------
                                   2166 ;local variable 
                                   2167 	PSIZE=1
                                   2168 	VSIZE=1 
                                   2169 cmd_itf:
                                   2170 	sub sp,#VSIZE 
                                   2171 	clr farptr 
                                   2172 	clr farptr+1 
                                   2173 	clr farptr+2  
                                   2174 repl:
                                   2175 	ld a,#CR 
                                   2176 	call putc 
                                   2177 	ld a,#'? 
                                   2178 	call putc
                                   2179 	clr in.w 
                                   2180 	clr in 
                                   2181 	call readln
                                   2182 	ldw y,#tib  
                                   2183 	ld a,(y)
                                   2184 	jreq repl  
                                   2185 	inc in 
                                   2186 	call to_upper 
                                   2187 	cp a,#'Q 
                                   2188 	jrne test_p
                                   2189 repl_exit:
                                   2190 	clr tib 
                                   2191 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2192 	clr in 
                                   2193 	_drop #VSIZE 	
                                   2194 	ret  
                                   2195 invalid:
                                   2196 	ldw x,#invalid_cmd 
                                   2197 	call puts 
                                   2198 	jra repl 
                                   2199 test_p:	
                                   2200     cp a,#'P 
                                   2201 	jreq mem_peek
                                   2202     cp a,#'S 
                                   2203 	jrne invalid 
                                   2204 print_string:	
                                   2205 	call get_token
                                   2206 	cp a,#TK_INTGR 
                                   2207 	jrne invalid 
                                   2208 	call puts
                                   2209 	jp repl 	
                                   2210 mem_peek:
                                   2211 	ld a,#SPACE 
                                   2212 	call skip  	 
                                   2213 	addw y,in.w 
                                   2214 	ldw x,#pad 
                                   2215 	call strcpy
                                   2216 	ldw x,#pad
                                   2217 	call atoi24 	
                                   2218 	ld a, acc24 
                                   2219 	or a,acc16 
                                   2220 	or a,acc8 
                                   2221 	jrne 1$ 
                                   2222 	jra peek_byte  
                                   2223 1$:	ldw x,acc24 
                                   2224 	ldw farptr,x 
                                   2225 	ld a,acc8 
                                   2226 	ld farptr+2,a 
                                   2227 peek_byte:
                                   2228 	call print_farptr 
                                   2229 	ld a,#8 
                                   2230 	ld (PSIZE,sp),a 
                                   2231 	clrw x 
                                   2232 1$:	call fetchc  
                                   2233 	pushw x 
                                   2234 	ld acc8,a 
                                   2235 	clrw x 
                                   2236 	ldw acc24,x 
                                   2237 	ld a,#16+128
                                   2238 	call prti24
                                   2239 	popw x 
                                   2240 	dec (PSIZE,sp)
                                   2241 	jrne 1$ 
                                   2242 	ld a,#8 
                                   2243 	add a,farptr+2 
                                   2244 	ld farptr+2,a
                                   2245 	clr a 
                                   2246 	adc a,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2247 	ld farptr+1,a 
                                   2248 	clr a 
                                   2249 	adc a,farptr 
                                   2250 	ld farptr,a 
                                   2251 	jp repl  
                                   2252 
                                   2253 invalid_cmd: .asciz "not a command\n" 
                                   2254 
                                   2255 ;----------------------------
                                   2256 ; display farptr address
                                   2257 ;----------------------------
                                   2258 print_farptr:
                                   2259 	ld a ,farptr+2 
                                   2260 	ld acc8,a 
                                   2261 	ldw x,farptr 
                                   2262 	ldw acc24,x 
                                   2263 	clrw x 
                                   2264 	ld a,#16 
                                   2265 	call prti24
                                   2266 	ld a,#SPACE 
                                   2267 	call putc 
                                   2268 	call putc 
                                   2269 	ret
                                   2270 
                                   2271 ;------------------------------------
                                   2272 ; get byte at address farptr[X]
                                   2273 ; input:
                                   2274 ;	 farptr   address to peek
                                   2275 ;    X		  farptr index 	
                                   2276 ; output:
                                   2277 ;	 A 		  byte from memory  
                                   2278 ;    x		  incremented by 1
                                   2279 ;------------------------------------
                                   2280 fetchc: ; @C
                                   2281 	ldf a,([farptr],x)
                                   2282 	incw x
                                   2283 	ret
                                   2284 
                                   2285 
                                   2286 ;------------------------------------
                                   2287 ; expect a number from command line 
                                   2288 ; next argument
                                   2289 ;  input:
                                   2290 ;	  none
                                   2291 ;  output:
                                   2292 ;    acc24   int24_t 
                                   2293 ;------------------------------------
                                   2294 number:
                                   2295 	call get_token
                                   2296 	cp a,#TK_INTGR
                                   2297 	jreq 1$
                                   2298 	jp syntax_error
                                   2299 1$:	ret
                                   2300 
                                   2301 .endif ; DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2303 
                                   2304 
                                   2305 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2306 ;; compiler routines        ;;
                                   2307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2308 ;------------------------------------
                                   2309 ; parse quoted string 
                                   2310 ; input:
                                   2311 ;   Y 	pointer to tib 
                                   2312 ;   X   pointer to output buffer 
                                   2313 ; output:
                                   2314 ;	buffer   parsed string
                                   2315 ;------------------------------------
                           000001  2316 	PREV = 1
                           000002  2317 	CURR =2
                           000002  2318 	VSIZE=2
      008B08                       2319 parse_quote: 
      008B08                       2320 	_vars VSIZE 
      008B08 52 02            [ 2]    1     sub sp,#VSIZE 
      008B08 4F               [ 1] 2321 	clr a
      008B08 0D 02            [ 1] 2322 1$:	ld (PREV,sp),a 
      000AEF                       2323 2$:	
      008B0A 26 DA AE         [ 4] 2324 	ld a,([in.w],y)
      008B0D 16 90            [ 1] 2325 	jreq 6$
      008B0F CD 83 36 90      [ 1] 2326 	inc in 
      008B13 AE 16            [ 1] 2327 	ld (CURR,sp),a 
      008B15 90 9F            [ 1] 2328 	ld a,#'\
      008B17 27 CD            [ 1] 2329 	cp a, (PREV,sp)
      008B19 6B 02            [ 1] 2330 	jrne 3$
      008B1B AE 16            [ 1] 2331 	clr (PREV,sp)
      008B1D 90 CD            [ 1] 2332 	ld a,(CURR,sp)
      008B1F 82 57            [ 4] 2333 	callr convert_escape
      008B21 0F               [ 1] 2334 	ld (x),a 
      008B22 01               [ 2] 2335 	incw x 
      008B23 72 F9            [ 2] 2336 	jra 2$
      000B0A                       2337 3$:
      008B25 01 20            [ 1] 2338 	ld a,(CURR,sp)
      008B27 BE 5C            [ 1] 2339 	cp a,#'\'
      008B28 27 DD            [ 1] 2340 	jreq 1$
      008B28 7B 02            [ 1] 2341 	cp a,#'"
      008B2A CD 82            [ 1] 2342 	jreq 6$ 
      008B2C 71               [ 1] 2343 	ld (x),a 
      008B2D 90               [ 2] 2344 	incw x 
      008B2E AE 16            [ 2] 2345 	jra 2$
      000B18                       2346 6$:
      008B30 90               [ 1] 2347 	clr (x)
      008B31 90               [ 2] 2348 	incw x 
      008B32 7F 0F            [ 1] 2349 	ldw y,x 
      008B34 02               [ 1] 2350 	clrw x 
      008B35 20 AF            [ 1] 2351 	ld a,#TK_QSTR  
      008B37                       2352 	_drop VSIZE
      008B37 0D 02            [ 2]    1     addw sp,#VSIZE 
      008B39 27               [ 4] 2353 	ret 
                                   2354 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2355 ;---------------------------------------
                                   2356 ; called by parse_quote
                                   2357 ; subtitute escaped character 
                                   2358 ; by their ASCII value .
                                   2359 ; input:
                                   2360 ;   A  character following '\'
                                   2361 ; output:
                                   2362 ;   A  substitued char or same if not valid.
                                   2363 ;---------------------------------------
      000B22                       2364 convert_escape:
      008B3A AB               [ 2] 2365 	pushw x 
      008B3B 0A 02 90         [ 2] 2366 	ldw x,#escaped 
      008B3E 5A               [ 1] 2367 1$:	cp a,(x)
      008B3F 90 7F            [ 1] 2368 	jreq 2$
      008B41 CD               [ 1] 2369 	tnz (x)
      008B42 82 61            [ 1] 2370 	jreq 3$
      008B44 20               [ 2] 2371 	incw x 
      008B45 A0 F7            [ 2] 2372 	jra 1$
      008B46 1D 0B 37         [ 2] 2373 2$: subw x,#escaped 
      008B46 A6               [ 1] 2374 	ld a,xl 
      008B47 4F 11            [ 1] 2375 	add a,#7
      008B49 02               [ 2] 2376 3$:	popw x 
      008B4A 27               [ 4] 2377 	ret 
                                   2378 
      008B4B 9A 7B 01 90 F7 0C 02  2379 escaped: .asciz "abtnvfr"
             90
                                   2380 
                                   2381 ;-------------------------
                                   2382 ; integer parser 
                                   2383 ; input:
                                   2384 ;   X 		point to output buffer  
                                   2385 ;   Y 		point to tib 
                                   2386 ;   A 	    first digit|'$' 
                                   2387 ; output:  
                                   2388 ;   pad     number string 
                                   2389 ;   X 		integer 
                                   2390 ;   A 		TK_INTGR
                                   2391 ;-------------------------
                           000001  2392 	BASE=1
                           000002  2393 	TCHAR=2 
                           000003  2394 	XSAVE=3
                           000004  2395 	VSIZE=4 
      000B3F                       2396 parse_integer: ; { -- n }
      008B53 5C               [ 2] 2397 	pushw x 	
      008B54 90 7F            [ 1] 2398 	push #0 ; TCHAR
      008B56 CD 82            [ 1] 2399 	push #10 ; BASE=10
      008B58 44 20            [ 1] 2400 	cp a,#'$
      008B5A 8B 04            [ 1] 2401 	jrne 2$ 
      008B5B                       2402     _drop #1
      008B5B 90 7F            [ 2]    1     addw sp,##1 
      008B5D 7B 02            [ 1] 2403 	push #16  ; BASE=16
      008B5F C7               [ 1] 2404 2$:	ld (x),a 
      008B60 00               [ 2] 2405 	incw x 
      008B61 04 A6 0D         [ 4] 2406 	ld a,([in.w],y)
      008B64 CD 82 44 5B      [ 1] 2407 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008B68 02 81 D2         [ 4] 2408 	call to_upper 
      008B6A 6B 02            [ 1] 2409 	ld (TCHAR,sp),a 
      008B6A 52 02 4F         [ 4] 2410 	call is_digit 
      008B6D 6B 01            [ 1] 2411 	jrc 2$
      008B6F A6 10            [ 1] 2412 	ld a,#16 
      008B6F 91 D6            [ 1] 2413 	cp a,(BASE,sp)
      008B71 01 27            [ 1] 2414 	jrne 3$ 
      008B73 24 72            [ 1] 2415 	ld a,(TCHAR,sp)
      008B75 5C 00            [ 1] 2416 	cp a,#'A 
      008B77 02 6B            [ 1] 2417 	jrmi 3$ 
      008B79 02 A6            [ 1] 2418 	cp a,#'G 
      008B7B 5C 11            [ 1] 2419 	jrmi 2$ 
      008B7D 01 26 0A 0F      [ 1] 2420 3$: dec in 	
      008B81 01               [ 1] 2421     clr (x)
      008B82 7B 02            [ 2] 2422 	ldw x,(XSAVE,sp)
      008B84 AD 1C F7         [ 4] 2423 	call atoi24
      008B87 5C 20            [ 1] 2424 	ldw y,x 
      008B89 E5 00 0C         [ 2] 2425 	ldw x,acc16 
      008B8A A6 04            [ 1] 2426 	ld a,#TK_INTGR
      008B8A 7B 02            [ 2] 2427 	ldw (y),x 
      008B8C A1 5C 27 DD      [ 2] 2428 	addw y,#2
      000B86                       2429 	_drop VSIZE  
      008B90 A1 22            [ 2]    1     addw sp,#VSIZE 
      008B92 27               [ 4] 2430 	ret 	
                                   2431 
                                   2432 ;-------------------------
                                   2433 ; binary integer parser
                                   2434 ; build integer in acc24  
                                   2435 ; input:
                                   2436 ;   X 		point to output buffer  
                                   2437 ;   Y 		point to tib 
                                   2438 ;   A 	    '&' 
                                   2439 ; output:  
                                   2440 ;   buffer  TK_INTGR integer  
                                   2441 ;   X 		int16 
                                   2442 ;   A 		TK_INTGR
                                   2443 ;   acc24    int24 
                                   2444 ;-------------------------
                           000001  2445 	BINARY=1 ; 24 bits integer 
                           000003  2446 	VSIZE=3
      000B89                       2447 parse_binary: ; { -- n }
      008B93 04 F7            [ 1] 2448 	push #0
      008B95 5C 20            [ 1] 2449 	push #0
      008B97 D7 00            [ 1] 2450 	push #0
      008B98                       2451 2$:	
      008B98 7F 5C 90         [ 4] 2452 	ld a,([in.w],y)
      008B9B 93 5F A6 02      [ 1] 2453 	inc in 
      008B9F 5B 02            [ 1] 2454 	cp a,#'0 
      008BA1 81 06            [ 1] 2455 	jreq 3$
      008BA2 A1 31            [ 1] 2456 	cp a,#'1 
      008BA2 89 AE            [ 1] 2457 	jreq 3$ 
      008BA4 8B B7            [ 2] 2458 	jra bin_exit 
      008BA6 F1 27            [ 1] 2459 3$: sub a,#'0 
      008BA8 06               [ 1] 2460 	rrc a
      008BA9 7D 27            [ 1] 2461 	rlc (BINARY+2,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008BAB 09 5C            [ 1] 2462 	rlc (BINARY+1,sp)
      008BAD 20 F7            [ 1] 2463 	rlc (BINARY,sp) 
      008BAF 1D 8B            [ 2] 2464 	jra 2$  
      000BAB                       2465 bin_exit:
      008BB1 B7 9F AB 07      [ 1] 2466 	dec in 
      008BB5 85 81            [ 1] 2467 	ldw y,x
      008BB7 61 62            [ 1] 2468 	ld a,(BINARY,sp)
      008BB9 74 6E 76         [ 1] 2469 	ld acc24,a 
      008BBC 66 72            [ 2] 2470 	ldw x,(BINARY+1,sp)
      008BBE 00 00 0C         [ 2] 2471 	ldw acc16,x
      008BBF 90 FF            [ 2] 2472 	ldw (y),x 
      008BBF 89 4B 00 4B      [ 2] 2473 	addw y,#2  
      008BC3 0A A1            [ 1] 2474 	ld a,#TK_INTGR 	
      000BC3                       2475 	_drop VSIZE 
      008BC5 24 26            [ 2]    1     addw sp,#VSIZE 
      008BC7 04               [ 4] 2476 	ret
                                   2477 
                                   2478 ;---------------------------
                                   2479 ;  token begin with a letter,
                                   2480 ;  is keyword or variable. 	
                                   2481 ; input:
                                   2482 ;   X 		point to pad 
                                   2483 ;   Y 		point to text
                                   2484 ;   A 	    first letter  
                                   2485 ; output:
                                   2486 ;   X		exec_addr|var_addr 
                                   2487 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2488 ;   pad 	keyword|var_name  
                                   2489 ;--------------------------  
                           000001  2490 	XFIRST=1
                           000002  2491 	VSIZE=2
      000BC6                       2492 parse_keyword: 
      008BC8 5B               [ 2] 2493 	pushw x 
      000BC7                       2494 kw_loop:	
      008BC9 01 4B 10         [ 4] 2495 	call to_upper 
      008BCC F7               [ 1] 2496 	ld (x),a 
      008BCD 5C               [ 2] 2497 	incw x 
      008BCE 91 D6 01         [ 4] 2498 	ld a,([in.w],y)
      008BD1 72 5C 00 02      [ 1] 2499 	inc in 
      008BD5 CD 8E 52         [ 4] 2500 	call is_alpha 
      008BD8 6B 02            [ 1] 2501 	jrc kw_loop
      008BDA CD 85 20 25      [ 1] 2502 	dec in   
      008BDE ED               [ 1] 2503 1$: clr (x)
      008BDF A6 10            [ 2] 2504 	ldw x,(XFIRST,sp) 
      008BE1 11 01            [ 1] 2505 	ld a,(1,x)
      008BE3 26 0A            [ 1] 2506 	jrne 2$
                                   2507 ; one letter variable name 
      008BE5 7B               [ 1] 2508 	ld a,(x) 
      008BE6 02 A1            [ 1] 2509 	sub a,#'A 
      008BE8 41               [ 1] 2510 	sll a 
      008BE9 2B               [ 1] 2511 	push a 
      008BEA 04 A1            [ 1] 2512 	push #0
      008BEC 47 2B DD         [ 2] 2513 	ldw x,#vars 
      008BEF 72 5A 00         [ 2] 2514 	addw x,(1,sp) ; X=var address 
      000BF0                       2515 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BF2 02 7F            [ 2]    1     addw sp,#2 
      008BF4 1E 03            [ 1] 2516 	ld a,#TK_VAR 
      008BF6 CD 8E            [ 2] 2517 	jra 4$ 
      000BF6                       2518 2$: ; check for keyword, otherwise syntax error.
      000BF6                       2519 	_ldx_dict kword_dict ; dictionary entry point
      008BF8 5E 90 93         [ 2]    1     ldw x,#kword_dict+2
      008BFB CE 00            [ 2] 2520 	ldw y,(XFIRST,sp) ; name to search for
      008BFD 0D A6 04         [ 4] 2521 	call search_dict
      008C00 90               [ 1] 2522 	tnz a
      008C01 FF 72            [ 1] 2523 	jrne 4$ 
      008C03 A9 00 02         [ 2] 2524 	jp syntax_error
      000C04                       2525 4$:	
      008C06 5B 04            [ 2] 2526 	ldw y,(XFIRST,sp)
      008C08 81 F7            [ 1] 2527 	ld (y),a 
      008C09 90 5C            [ 2] 2528 	incw y 
      008C09 4B 00            [ 2] 2529 	ldw (y),x
      008C0B 4B 00 4B 00      [ 2] 2530 	addw y,#2  
      008C0F                       2531 	_drop VSIZE 
      008C0F 91 D6            [ 2]    1     addw sp,#VSIZE 
      008C11 01               [ 4] 2532 	ret  	
                                   2533 
                                   2534 
                                   2535 ;------------------------------------
                                   2536 ; scan text for next token
                                   2537 ; input: 
                                   2538 ;	X 		pointer to buffer where 
                                   2539 ;	        token id and value are copied 
                                   2540 ; use:
                                   2541 ;	Y   pointer to text in tib 
                                   2542 ; output:
                                   2543 ;   A       token attribute 
                                   2544 ;   X 		token value
                                   2545 ;   Y       updated position in output buffer   
                                   2546 ;------------------------------------
                                   2547 	; use to check special character 
                                   2548 	.macro _case c t  
                                   2549 	ld a,#c 
                                   2550 	cp a,(TCHAR,sp) 
                                   2551 	jrne t
                                   2552 	.endm 
                                   2553 
                           000001  2554 	TCHAR=1
                           000002  2555 	ATTRIB=2
                           000002  2556 	VSIZE=2
      000C13                       2557 get_token: 
      000C13                       2558 	_vars VSIZE
      008C12 72 5C            [ 2]    1     sub sp,#VSIZE 
                                   2559 ;	ld a,in 
                                   2560 ;	sub a,count
                                   2561 ;   jrmi 0$
                                   2562 ;	clr a 
                                   2563 ;	ret 
      000C15                       2564 0$: 
      008C14 00 02 A1 30      [ 2] 2565 	ldw y,#tib    	
      008C18 27 06            [ 1] 2566 	ld a,#SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008C1A A1 31 27         [ 4] 2567 	call skip
      008C1D 02 20 0B A0 30   [ 1] 2568 	mov in.saved,in 
      008C22 46 09 03         [ 4] 2569 	ld a,([in.w],y)
      008C25 09 02            [ 1] 2570 	jrne 1$
      008C27 09 01            [ 1] 2571 	ldw y,x 
      008C29 20 E4 CF         [ 2] 2572 	jp token_exit ; end of line 
      008C2B 72 5C 00 01      [ 1] 2573 1$:	inc in 
      008C2B 72 5A 00         [ 4] 2574 	call to_upper 
      008C2E 02 90            [ 1] 2575 	ld (TCHAR,sp),a 
                                   2576 ; check for quoted string
      000C36                       2577 str_tst:  	
      000C36                       2578 	_case '"' nbr_tst
      008C30 93 7B            [ 1]    1 	ld a,#'"' 
      008C32 01 C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C34 00 0C            [ 1]    3 	jrne nbr_tst
      008C36 1E 02            [ 1] 2579 	ld a,#TK_QSTR
      008C38 CF               [ 1] 2580 	ld (x),a 
      008C39 00               [ 2] 2581 	incw x 
      008C3A 0D 90 FF         [ 4] 2582 	call parse_quote
      008C3D 72 A9 00         [ 2] 2583 	jp token_exit
      000C46                       2584 nbr_tst:
                                   2585 ; check for hexadecimal number 
      008C40 02 A6            [ 1] 2586 	ld a,#'$'
      008C42 04 5B            [ 1] 2587 	cp a,(TCHAR,sp) 
      008C44 03 81            [ 1] 2588 	jreq 1$
                                   2589 ;check for binary number 
      008C46 A6 26            [ 1] 2590 	ld a,#'&
      008C46 89 01            [ 1] 2591 	cp a,(TCHAR,sp)
      008C47 26 0A            [ 1] 2592 	jrne 0$
      008C47 CD 8E            [ 1] 2593 	ld a,#TK_INTGR
      008C49 52               [ 1] 2594 	ld (x),a 
      008C4A F7               [ 2] 2595 	incw x 
      008C4B 5C 91 D6         [ 4] 2596 	call parse_binary ; expect binary integer 
      008C4E 01 72 5C         [ 2] 2597 	jp token_exit 
                                   2598 ; check for decimal number 	
      008C51 00 02            [ 1] 2599 0$:	ld a,(TCHAR,sp)
      008C53 CD 85 0F         [ 4] 2600 	call is_digit
      008C56 25 EF            [ 1] 2601 	jrnc 3$
      008C58 72 5A            [ 1] 2602 1$:	ld a,#TK_INTGR 
      008C5A 00               [ 1] 2603 	ld (x),a 
      008C5B 02               [ 2] 2604 	incw x 
      008C5C 7F 1E            [ 1] 2605 	ld a,(TCHAR,sp)
      008C5E 01 E6 01         [ 4] 2606 	call parse_integer 
      008C61 26 13 F6         [ 2] 2607 	jp token_exit 
      000C6F                       2608 3$: 
      000C6F                       2609 	_case '(' bkslsh_tst 
      008C64 A0 41            [ 1]    1 	ld a,#'(' 
      008C66 48 88            [ 1]    2 	cp a,(TCHAR,sp) 
      008C68 4B 00            [ 1]    3 	jrne bkslsh_tst
      008C6A AE 00            [ 1] 2610 	ld a,#TK_LPAREN
      008C6C 28 72 FB         [ 2] 2611 	jp token_char   	
      000C7A                       2612 bkslsh_tst: ; character token 
      000C7A                       2613 	_case '\',rparnt_tst
      008C6F 01 5B            [ 1]    1 	ld a,#'\' 
      008C71 02 A6            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C73 05 20            [ 1]    3 	jrne rparnt_tst
      008C75 0E 03            [ 1] 2614 	ld a,#TK_CHAR 
      008C76 F7               [ 1] 2615 	ld (x),a 
      008C76 AE               [ 2] 2616 	incw x 
      008C77 A6 0A 16         [ 4] 2617 	ld a,([in.w],y)
      008C7A 01               [ 1] 2618 	ld (x),a 
      008C7B CD               [ 2] 2619 	incw x
      008C7C 8F B8            [ 1] 2620 	ldw y,x 	 
      008C7E 4D 26 03 CC      [ 1] 2621 	inc in  
      008C82 88               [ 1] 2622 	clrw x 
      008C83 15               [ 1] 2623 	ld xl,a 
      008C84 A6 03            [ 1] 2624 	ld a,#TK_CHAR 
      008C84 16 01 90         [ 2] 2625 	jp token_exit 
      000C96                       2626 rparnt_tst:		
      000C96                       2627 	_case ')' colon_tst 
      008C87 F7 90            [ 1]    1 	ld a,#')' 
      008C89 5C 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8B FF 72            [ 1]    3 	jrne colon_tst
      008C8D A9 00            [ 1] 2628 	ld a,#TK_RPAREN 
      008C8F 02 5B 02         [ 2] 2629 	jp token_char
      000CA1                       2630 colon_tst:
      000CA1                       2631 	_case ':' comma_tst 
      008C92 81 3A            [ 1]    1 	ld a,#':' 
      008C93 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C93 52 02            [ 1]    3 	jrne comma_tst
      008C95 A6 01            [ 1] 2632 	ld a,#TK_COLON 
      008C95 90 AE 16         [ 2] 2633 	jp token_char  
      000CAC                       2634 comma_tst:
      000CAC                       2635 	_case COMMA sharp_tst 
      008C98 90 A6            [ 1]    1 	ld a,#COMMA 
      008C9A 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9C 8E C8            [ 1]    3 	jrne sharp_tst
      008C9E 55 00            [ 1] 2636 	ld a,#TK_COMMA
      008CA0 02 00 03         [ 2] 2637 	jp token_char
      000CB7                       2638 sharp_tst:
      000CB7                       2639 	_case SHARP dash_tst 
      008CA3 91 D6            [ 1]    1 	ld a,#SHARP 
      008CA5 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA7 05 90            [ 1]    3 	jrne dash_tst
      008CA9 93 CC            [ 1] 2640 	ld a,#TK_SHARP
      008CAB 8E 4F 72         [ 2] 2641 	jp token_char  	 	 
      000CC2                       2642 dash_tst: 	
      000CC2                       2643 	_case '-' at_tst 
      008CAE 5C 00            [ 1]    1 	ld a,#'-' 
      008CB0 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB2 8E 52            [ 1]    3 	jrne at_tst
      008CB4 6B 01            [ 1] 2644 	ld a,#TK_MINUS  
      008CB6 CC 0D CB         [ 2] 2645 	jp token_char 
      000CCD                       2646 at_tst:
      000CCD                       2647 	_case '@' qmark_tst 
      008CB6 A6 22            [ 1]    1 	ld a,#'@' 
      008CB8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CBA 26 0A            [ 1]    3 	jrne qmark_tst
      008CBC A6 02            [ 1] 2648 	ld a,#TK_ARRAY 
      008CBE F7 5C CD         [ 2] 2649 	jp token_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000CD8                       2650 qmark_tst:
      000CD8                       2651 	_case '?' tick_tst 
      008CC1 8B 6A            [ 1]    1 	ld a,#'?' 
      008CC3 CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC5 4F 12            [ 1]    3 	jrne tick_tst
      008CC6 A6 80            [ 1] 2652 	ld a,#TK_CMD  
      008CC6 A6               [ 1] 2653 	ld (x),a 
      008CC7 24               [ 2] 2654 	incw x 
      008CC8 11 01            [ 1] 2655 	ldw y,x 
      008CCA 27 17 A6         [ 2] 2656 	ldw x,#print 
      008CCD 26 11            [ 2] 2657 	ldw (y),x 
      008CCF 01 26 0A A6      [ 2] 2658 	addw y,#2
      008CD3 04 F7 5C         [ 2] 2659 	jp token_exit
      000CF0                       2660 tick_tst: ; comment 
      000CF0                       2661 	_case TICK plus_tst 
      008CD6 CD 8C            [ 1]    1 	ld a,#TICK 
      008CD8 09 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDA 8E 4F            [ 1]    3 	jrne plus_tst
      008CDC 7B 01            [ 1] 2662 	ld a,#TK_CMD
      008CDE CD               [ 1] 2663 	ld (x),a 
      008CDF 85               [ 2] 2664 	incw x
      008CE0 20 24 0C A6      [ 2] 2665 	ldw y,#remark
      008CE4 04               [ 2] 2666 	ldw (x),y 
      008CE5 F7 5C 7B         [ 2] 2667 	addw x,#2  
      000D02                       2668 copy_comment:
      008CE8 01 CD 8B BF      [ 2] 2669 	ldw y,#tib 
      008CEC CC 8E 4F 00      [ 2] 2670 	addw y,in.w
      008CEF 90 89            [ 2] 2671 	pushw y
      008CEF A6 28 11         [ 4] 2672 	call strcpy
      008CF2 01 26 05         [ 2] 2673     subw y,(1,sp)
      008CF5 A6 07            [ 1] 2674 	ld a,yl 
      008CF7 CC 8E 4B         [ 1] 2675 	add a,in
      008CFA C7 00 01         [ 1] 2676 	ld in,a 
      008CFA A6 5C            [ 2] 2677 	ldw (1,sp),x
      008CFC 11 01 26         [ 2] 2678 	addw y,(1,sp)
      008CFF 16 A6            [ 2] 2679 	incw y 
      000D21                       2680 	_drop 2 
      008D01 03 F7            [ 2]    1     addw sp,#2 
      008D03 5C 91 D6         [ 2] 2681 	ldw x,#remark 
      008D06 01 F7            [ 1] 2682 	ld a,#TK_CMD 
      008D08 5C 90 93         [ 2] 2683 	jp token_exit 
      000D2B                       2684 plus_tst:
      000D2B                       2685 	_case '+' star_tst 
      008D0B 72 5C            [ 1]    1 	ld a,#'+' 
      008D0D 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0F 5F 97            [ 1]    3 	jrne star_tst
      008D11 A6 03            [ 1] 2686 	ld a,#TK_PLUS  
      008D13 CC 8E 4F         [ 2] 2687 	jp token_char 
      008D16                       2688 star_tst:
      000D36                       2689 	_case '*' slash_tst 
      008D16 A6 29            [ 1]    1 	ld a,#'*' 
      008D18 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1A 26 05            [ 1]    3 	jrne slash_tst
      008D1C A6 08            [ 1] 2690 	ld a,#TK_MULT 
      008D1E CC 8E 4B         [ 2] 2691 	jp token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D21                       2692 slash_tst: 
      000D41                       2693 	_case '/' prcnt_tst 
      008D21 A6 3A            [ 1]    1 	ld a,#'/' 
      008D23 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D25 26 05            [ 1]    3 	jrne prcnt_tst
      008D27 A6 01            [ 1] 2694 	ld a,#TK_DIV 
      008D29 CC 8E 4B         [ 2] 2695 	jp token_char 
      008D2C                       2696 prcnt_tst:
      000D4C                       2697 	_case '%' eql_tst 
      008D2C A6 2C            [ 1]    1 	ld a,#'%' 
      008D2E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D30 26 05            [ 1]    3 	jrne eql_tst
      008D32 A6 09            [ 1] 2698 	ld a,#TK_MOD
      008D34 CC 8E 4B         [ 2] 2699 	jp token_char  
                                   2700 ; 1 or 2 character tokens 	
      008D37                       2701 eql_tst:
      000D57                       2702 	_case '=' gt_tst 		
      008D37 A6 23            [ 1]    1 	ld a,#'=' 
      008D39 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3B 26 05            [ 1]    3 	jrne gt_tst
      008D3D A6 0A            [ 1] 2703 	ld a,#TK_EQUAL
      008D3F CC 8E 4B         [ 2] 2704 	jp token_char 
      008D42                       2705 gt_tst:
      000D62                       2706 	_case '>' lt_tst 
      008D42 A6 2D            [ 1]    1 	ld a,#'>' 
      008D44 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D46 26 05            [ 1]    3 	jrne lt_tst
      008D48 A6 11            [ 1] 2707 	ld a,#TK_GT 
      008D4A CC 8E            [ 1] 2708 	ld (ATTRIB,sp),a 
      008D4C 4B 5C 00 01      [ 1] 2709 	inc in 
      008D4D 91 D6 00         [ 4] 2710 	ld a,([in.w],y)
      008D4D A6 40            [ 1] 2711 	cp a,#'=
      008D4F 11 01            [ 1] 2712 	jrne 1$
      008D51 26 05            [ 1] 2713 	ld a,#TK_GE 
      008D53 A6 06            [ 2] 2714 	jra token_char  
      008D55 CC 8E            [ 1] 2715 1$: cp a,#'<
      008D57 4B 04            [ 1] 2716 	jrne 2$
      008D58 A6 35            [ 1] 2717 	ld a,#TK_NE 
      008D58 A6 3F            [ 2] 2718 	jra token_char 
      008D5A 11 01 26 12      [ 1] 2719 2$: dec in
      008D5E A6 80            [ 1] 2720 	ld a,(ATTRIB,sp)
      008D60 F7 5C            [ 2] 2721 	jra token_char 	 
      000D8B                       2722 lt_tst:
      000D8B                       2723 	_case '<' other
      008D62 90 93            [ 1]    1 	ld a,#'<' 
      008D64 AE 94            [ 1]    2 	cp a,(TCHAR,sp) 
      008D66 50 90            [ 1]    3 	jrne other
      008D68 FF 72            [ 1] 2724 	ld a,#TK_LT 
      008D6A A9 00            [ 1] 2725 	ld (ATTRIB,sp),a 
      008D6C 02 CC 8E 4F      [ 1] 2726 	inc in 
      008D70 91 D6 00         [ 4] 2727 	ld a,([in.w],y)
      008D70 A6 27            [ 1] 2728 	cp a,#'=
      008D72 11 01            [ 1] 2729 	jrne 1$
      008D74 26 35            [ 1] 2730 	ld a,#TK_LE 
      008D76 A6 80            [ 2] 2731 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008D78 F7 5C            [ 1] 2732 1$: cp a,#'>
      008D7A 90 AE            [ 1] 2733 	jrne 2$
      008D7C 95 4D            [ 1] 2734 	ld a,#TK_NE 
      008D7E FF 1C            [ 2] 2735 	jra token_char 
      008D80 00 02 00 01      [ 1] 2736 2$: dec in 
      008D82 7B 02            [ 1] 2737 	ld a,(ATTRIB,sp)
      008D82 90 AE            [ 2] 2738 	jra token_char 	
      000DB4                       2739 other: ; not a special character 	 
      008D84 16 90            [ 1] 2740 	ld a,(TCHAR,sp)
      008D86 72 B9 00         [ 4] 2741 	call is_alpha 
      008D89 01 90            [ 1] 2742 	jrc 30$ 
      008D8B 89 CD 83         [ 2] 2743 	jp syntax_error 
      000DBE                       2744 30$: 
      008D8E 54 72 F2         [ 4] 2745 	call parse_keyword
      008D91 01 90 9F         [ 2] 2746 	cpw x,#remark 
      008D94 CB 00            [ 1] 2747 	jrne token_exit 
      008D96 02 C7            [ 1] 2748 	ldw y,x 
      008D98 00 02 1F         [ 2] 2749 	jp copy_comment 
      000DCB                       2750 token_char:
      008D9B 01               [ 1] 2751 	ld (x),a 
      008D9C 72               [ 2] 2752 	incw x
      008D9D F9 01            [ 1] 2753 	ldw y,x 
      000DCF                       2754 token_exit:
      000DCF                       2755 	_drop VSIZE 
      008D9F 90 5C            [ 2]    1     addw sp,#VSIZE 
      008DA1 5B               [ 4] 2756 	ret
                                   2757 
                                   2758 
                                   2759 ;------------------------------------
                                   2760 ; convert alpha to uppercase
                                   2761 ; input:
                                   2762 ;    a  character to convert
                                   2763 ; output:
                                   2764 ;    a  uppercase character
                                   2765 ;------------------------------------
      000DD2                       2766 to_upper::
      008DA2 02 AE            [ 1] 2767 	cp a,#'a
      008DA4 95 4D            [ 1] 2768 	jrpl 1$
      008DA6 A6               [ 4] 2769 0$:	ret
      008DA7 80 CC            [ 1] 2770 1$: cp a,#'z	
      008DA9 8E 4F            [ 1] 2771 	jrugt 0$
      008DAB A0 20            [ 1] 2772 	sub a,#32
      008DAB A6               [ 4] 2773 	ret
                                   2774 	
                                   2775 ;------------------------------------
                                   2776 ; convert pad content in integer
                                   2777 ; input:
                                   2778 ;    x		.asciz to convert
                                   2779 ; output:
                                   2780 ;    acc24      int24_t
                                   2781 ;------------------------------------
                                   2782 	; local variables
                           000001  2783 	SIGN=1 ; 1 byte, 
                           000002  2784 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2785 	TEMP=3 ; 1 byte, temporary storage
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000003  2786 	VSIZE=3 ; 3 bytes reserved for local storage
      000DDE                       2787 atoi24:
      008DAC 2B               [ 2] 2788 	pushw x 
      000DDF                       2789 	_vars VSIZE
      008DAD 11 01            [ 2]    1     sub sp,#VSIZE 
                                   2790 	; acc24=0 
      008DAF 26 05 A6 10      [ 1] 2791 	clr acc24    
      008DB3 CC 8E 4B 0C      [ 1] 2792 	clr acc16
      008DB6 72 5F 00 0D      [ 1] 2793 	clr acc8 
      008DB6 A6 2A            [ 1] 2794 	clr (SIGN,sp)
      008DB8 11 01            [ 1] 2795 	ld a,#10
      008DBA 26 05            [ 1] 2796 	ld (BASE,sp),a ; default base decimal
      008DBC A6               [ 1] 2797 	ld a,(x)
      008DBD 20 CC            [ 1] 2798 	jreq 9$  ; completed if 0
      008DBF 8E 4B            [ 1] 2799 	cp a,#'-
      008DC1 26 04            [ 1] 2800 	jrne 1$
      008DC1 A6 2F            [ 1] 2801 	cpl (SIGN,sp)
      008DC3 11 01            [ 2] 2802 	jra 2$
      008DC5 26 05            [ 1] 2803 1$: cp a,#'$
      008DC7 A6 21            [ 1] 2804 	jrne 3$
      008DC9 CC 8E            [ 1] 2805 	ld a,#16
      008DCB 4B 02            [ 1] 2806 	ld (BASE,sp),a
      008DCC 5C               [ 2] 2807 2$:	incw x
      008DCC A6               [ 1] 2808 	ld a,(x)
      000E08                       2809 3$:	
      008DCD 25 11            [ 1] 2810 	cp a,#'a
      008DCF 01 26            [ 1] 2811 	jrmi 4$
      008DD1 05 A6            [ 1] 2812 	sub a,#32
      008DD3 22 CC            [ 1] 2813 4$:	cp a,#'0
      008DD5 8E 4B            [ 1] 2814 	jrmi 9$
      008DD7 A0 30            [ 1] 2815 	sub a,#'0
      008DD7 A6 3D            [ 1] 2816 	cp a,#10
      008DD9 11 01            [ 1] 2817 	jrmi 5$
      008DDB 26 05            [ 1] 2818 	sub a,#7
      008DDD A6 32            [ 1] 2819 	cp a,(BASE,sp)
      008DDF CC 8E            [ 1] 2820 	jrpl 9$
      008DE1 4B 03            [ 1] 2821 5$:	ld (TEMP,sp),a
      008DE2 7B 02            [ 1] 2822 	ld a,(BASE,sp)
      008DE2 A6 3E 11         [ 4] 2823 	call mulu24_8
      008DE5 01 26            [ 1] 2824 	ld a,(TEMP,sp)
      008DE7 23 A6 31         [ 1] 2825 	add a,acc24+2
      008DEA 6B 02 72         [ 1] 2826 	ld acc24+2,a
      008DED 5C               [ 1] 2827 	clr a
      008DEE 00 02 91         [ 1] 2828 	adc a,acc24+1
      008DF1 D6 01 A1         [ 1] 2829 	ld acc24+1,a
      008DF4 3D               [ 1] 2830 	clr a
      008DF5 26 04 A6         [ 1] 2831 	adc a,acc24
      008DF8 33 20 50         [ 1] 2832 	ld acc24,a
      008DFB A1 3C            [ 2] 2833 	jra 2$
      008DFD 26 04            [ 1] 2834 9$:	tnz (SIGN,sp)
      008DFF A6 35            [ 1] 2835     jreq atoi_exit
      008E01 20 48 72         [ 4] 2836     call neg_acc24
      000E44                       2837 atoi_exit: 
      000E44                       2838 	_drop VSIZE
      008E04 5A 00            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008E06 02               [ 2] 2839 	popw x ; restore x
      008E07 7B               [ 4] 2840 	ret
                                   2841 
                                   2842 
                                   2843 ;------------------------------------
                                   2844 ; skip character c in text starting from 'in'
                                   2845 ; input:
                                   2846 ;	 y 		point to text buffer
                                   2847 ;    a 		character to skip
                                   2848 ; output:  
                                   2849 ;	'in' ajusted to new position
                                   2850 ;------------------------------------
                           000001  2851 	C = 1 ; local var
      000E48                       2852 skip:
      008E08 02               [ 1] 2853 	push a
      008E09 20 40 00         [ 4] 2854 1$:	ld a,([in.w],y)
      008E0B 27 0A            [ 1] 2855 	jreq 2$
      008E0B A6 3C            [ 1] 2856 	cp a,(C,sp)
      008E0D 11 01            [ 1] 2857 	jrne 2$
      008E0F 26 23 A6 34      [ 1] 2858 	inc in
      008E13 6B 02            [ 2] 2859 	jra 1$
      000E58                       2860 2$: _drop 1 
      008E15 72 5C            [ 2]    1     addw sp,#1 
      008E17 00               [ 4] 2861 	ret
                                   2862 	
                                   2863 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2864 ;;   TINY BASIC  operators,
                                   2865 ;;   commands and functions 
                                   2866 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2867 
                                   2868 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2869 ;;  Arithmetic operators
                                   2870 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2871 
                                   2872 ;--------------------------------
                                   2873 ;  add 2 integers
                                   2874 ;  input:
                                   2875 ;    N1     on cstack 
                                   2876 ;    N2     on cstack 
                                   2877 ;  output:
                                   2878 ;    X 		n2+n1 
                                   2879 ;--------------------------------
                                   2880 	;arugments on cstack 
      000E5B                       2881 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E5B                       2882 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E5B                       2883 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E5B                       2884 add:
      008E18 02 91            [ 2] 2885 	ldw x ,(N2,sp)
      008E1A D6 01 A1         [ 2] 2886 	addw x,(N1,sp)
      008E1D 3D 26            [ 2] 2887 	ldw (N1,sp),x 
      008E1F 04               [ 4] 2888 	ret 
                                   2889 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2890 ;--------------------------------
                                   2891 ;  substract 2 ntegers
                                   2892 ;  input:
                                   2893 ;    N1     on cstack 
                                   2894 ;    N2     on cstack 
                                   2895 ;  output:
                                   2896 ;    X 		n2+n1 
                                   2897 ;--------------------------------
      000E63                       2898 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E63                       2899 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E63                       2900 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E63                       2901 substract:
      008E20 A6 36            [ 2] 2902 	ldw x,(N2,sp)
      008E22 20 27 A1         [ 2] 2903 	subw x,(N1,sp)
      008E25 3E               [ 4] 2904 	ret 
                                   2905 
                                   2906 ;-------------------------------------
                                   2907 ; multiply 2 integers
                                   2908 ; product overflow is ignored unless
                                   2909 ; MATH_OVF assembler flag is set to 1
                                   2910 ; input:
                                   2911 ;  	N1      on cstack
                                   2912 ;   N2 		on cstack 
                                   2913 ; output:
                                   2914 ;	X        N1*N2 
                                   2915 ;-------------------------------------
                                   2916 	;arguments 
      000E69                       2917 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000E69                       2918 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000E69                       2919 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000E69                       2920 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000E69                       2921 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2922    ; local variables 
                           000001  2923 	SIGN=1
                           000002  2924 	PROD=2
                           000003  2925 	VSIZE=3
      000E69                       2926 multiply:
      000E69                       2927 	_vars VSIZE 
      008E26 26 04            [ 2]    1     sub sp,#VSIZE 
      008E28 A6 35            [ 1] 2928 	clr (SIGN,sp)
      008E2A 20 1F            [ 2] 2929 	ldw x,(N1_HB,sp)
      008E2C 72               [ 1] 2930 	ld a,xh  
      008E2D 5A 00            [ 1] 2931 	bcp a,#0x80 
      008E2F 02 7B            [ 1] 2932 	jreq 2$
      008E31 02 20            [ 1] 2933 	cpl (SIGN,sp)
      008E33 17               [ 2] 2934 	negw x 
      008E34 1F 06            [ 2] 2935 	ldw (N1_HB,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008E34 7B 01            [ 2] 2936 2$: ldw x,(N2_HB,sp)
      008E36 CD               [ 1] 2937 	ld a,xh  
      008E37 85 0F            [ 1] 2938 	bcp a,#0x80 
      008E39 25 03            [ 1] 2939 	jreq 3$
      008E3B CC 88            [ 1] 2940 	cpl (SIGN,sp)
      008E3D 15               [ 2] 2941 	negw x 
      008E3E 1F 08            [ 2] 2942 	ldw (N2_HB,sp),x 
                                   2943 ; N1_LB * N2_LB 	
      008E3E CD 8C            [ 1] 2944 3$:	ld a,(N1_LB,sp)
      008E40 46               [ 1] 2945 	ld xl,a 
      008E41 A3 95            [ 1] 2946 	ld a,(N2_LB,sp) 
      008E43 4D               [ 4] 2947 	mul x,a 
                           000000  2948 .if MATH_OVF 	
                                   2949 	ld a,xh 
                                   2950 	bcp a,#0x80 
                                   2951 	jreq 4$ 
                                   2952 	ld a,#ERR_MATH_OVF 
                                   2953 	jp tb_error
                                   2954 .endif 	 
      008E44 26 09            [ 2] 2955 4$:	ldw (PROD,sp),x
                                   2956 ; N1_LB * N2_HB	 
      008E46 90 93            [ 1] 2957 	ld a,(N1_LB,sp) 
      008E48 CC               [ 1] 2958 	ld xl,a 
      008E49 8D 82            [ 1] 2959 	ld a,(N2_HB,sp)
      008E4B 42               [ 4] 2960 	mul x,a
      008E4B F7               [ 1] 2961 	ld a,xl 
      008E4C 5C 90            [ 1] 2962 	add a,(PROD,sp)
                           000000  2963 .if MATH_OVF 	
                                   2964 	bcp a,#0x80 
                                   2965 	jreq 5$ 
                                   2966 	ld a,#ERR_MATH_OVF 
                                   2967 	jp tb_error
                                   2968 .endif 	 
      008E4E 93 02            [ 1] 2969 5$:	ld (PROD,sp),a 
                                   2970 ; N1_HB * N2_LB 
      008E4F 7B 06            [ 1] 2971 	ld a,(N1_HB,sp)
      008E4F 5B               [ 1] 2972 	ld xl,a 
      008E50 02 81            [ 1] 2973 	ld a,(N2_LB,sp)
      008E52 42               [ 4] 2974 	mul x,a 
      008E52 A1               [ 1] 2975 	ld a,xl 
      008E53 61 2A            [ 1] 2976 	add a,(PROD,sp)
                           000000  2977 .if MATH_OVF 	
                                   2978 	bcp a,#0x80 
                                   2979 	jreq 6$ 
                                   2980 	ld a,#ERR_MATH_OVF 
                                   2981 	jp tb_error
                                   2982 .endif 	 
      008E55 01 81            [ 1] 2983 6$:	ld (PROD,sp),a 
                                   2984 ; N1_HB * N2_HB 	
                                   2985 ; it is pointless to multiply N1_HB*N2_HB 
                                   2986 ; as this product is over 65535 or 0 
                                   2987 ;
                                   2988 ; sign adjust product
      008E57 A1 7A            [ 1] 2989 	tnz (SIGN,sp)
      008E59 22 FB            [ 1] 2990 	jreq 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008E5B A0 20            [ 2] 2991 	ldw x, (PROD,sp)
      008E5D 81               [ 2] 2992 	negw x
      008E5E 1F 02            [ 2] 2993 	ldw (PROD,sp),x  
      000EAC                       2994 7$: 
      008E5E 89 52            [ 2] 2995 	ldw x,(PROD,sp) 
      000EAE                       2996 	_drop VSIZE 
      008E60 03 72            [ 2]    1     addw sp,#VSIZE 
      008E62 5F               [ 4] 2997 	ret
                                   2998 
                                   2999 ;----------------------------------
                                   3000 ;  euclidian divide n2/n1 
                                   3001 ; input:
                                   3002 ;    N2 	on cstack
                                   3003 ;    N1 	on cstack
                                   3004 ; output:
                                   3005 ;    X      n2/n1 
                                   3006 ;    Y      remainder 
                                   3007 ;----------------------------------
      000EB1                       3008 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000EB1                       3009 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000EB1                       3010 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   3011 	; local variables
                           000001  3012 	SQUOT=1 ; sign quotient
                           000002  3013 	SDIVD=2 ; sign dividend  
                           000002  3014 	VSIZE=2
      000EB1                       3015 divide:
      000EB1                       3016 	_vars VSIZE 
      008E63 00 0C            [ 2]    1     sub sp,#VSIZE 
      008E65 72 5F            [ 1] 3017 	clr (SQUOT,sp)
      008E67 00 0D            [ 1] 3018 	clr (SDIVD,sp)
                                   3019 ; check for 0 divisor
      008E69 72 5F            [ 2] 3020 	ldw x,(DIVISR,sp)
      008E6B 00               [ 2] 3021 	tnzw x 
      008E6C 0E 0F            [ 1] 3022     jrne 0$
      008E6E 01 A6            [ 1] 3023 	ld a,#ERR_DIV0 
      008E70 0A 6B 02         [ 2] 3024 	jp tb_error 
                                   3025 ; check divisor sign 	
      008E73 F6               [ 1] 3026 0$:	ld a,xh 
      008E74 27 47            [ 1] 3027 	bcp a,#0x80 
      008E76 A1 2D            [ 1] 3028 	jreq 1$
      008E78 26 04            [ 1] 3029 	cpl (SQUOT,sp)
      008E7A 03               [ 2] 3030 	negw x 
      008E7B 01 20            [ 2] 3031 1$:	ldw (DIVISR,sp),x
                                   3032 ; check dividend sign 	 
      008E7D 08 A1            [ 2] 3033     ldw x,(DIVIDND,sp)
      008E7F 24               [ 1] 3034 	ld a,xh 
      008E80 26 06            [ 1] 3035 	bcp a,#0x80 
      008E82 A6 10            [ 1] 3036 	jreq 2$ 
      008E84 6B 02            [ 1] 3037 	cpl (SQUOT,sp)
      008E86 5C F6            [ 1] 3038 	cpl (SDIVD,sp)
      008E88 50               [ 2] 3039 	negw x 
      008E88 A1 61            [ 2] 3040 2$:	ldw y,(DIVISR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008E8A 2B               [ 2] 3041 	divw x,y
      008E8B 02 A0 20 A1      [ 2] 3042 	ldw acc16,y 
                                   3043 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008E8F 30 2B            [ 1] 3044 	tnz (SDIVD,sp)
      008E91 2B A0            [ 1] 3045 	jreq 7$
      008E93 30 A1            [ 2] 3046 	tnzw y 
      008E95 0A 2B            [ 1] 3047 	jreq 7$
      008E97 06               [ 2] 3048 	incw x
      008E98 A0 07            [ 2] 3049 	ldw y,(DIVISR,sp)
      008E9A 11 02 2A 1F      [ 2] 3050 	subw y,acc16
      008E9E 6B 03            [ 1] 3051 7$: tnz (SQUOT,sp)
      008EA0 7B 02            [ 1] 3052 	jreq 9$ 	 
      008EA2 CD               [ 2] 3053 8$:	negw x 
      000EF2                       3054 9$: 
      000EF2                       3055 	_drop VSIZE 
      008EA3 8A 81            [ 2]    1     addw sp,#VSIZE 
      008EA5 7B               [ 4] 3056 	ret 
                                   3057 
                                   3058 
                                   3059 ;----------------------------------
                                   3060 ;  remainder resulting from euclidian 
                                   3061 ;  division of n2/n1 
                                   3062 ; input:
                                   3063 ;   N1 		cstack 
                                   3064 ;   N2      cstack
                                   3065 ; output:
                                   3066 ;   X       N2%N1 
                                   3067 ;----------------------------------
                           000003  3068 	N1=3
                           000005  3069 	N2=5
                           000004  3070 	VSIZE=4
      000EF5                       3071 modulo:
      008EA6 03 CB            [ 2] 3072 	Ldw x,(N1,sp)
      008EA8 00 0E            [ 2] 3073 	ldw y,(N2,sp)
      000EF9                       3074 	_vars VSIZE 
      008EAA C7 00            [ 2]    1     sub sp,#VSIZE 
      008EAC 0E 4F            [ 2] 3075 	ldw (1,sp),x 
      008EAE C9 00            [ 2] 3076 	ldw (3,sp),y 
      008EB0 0D C7 00         [ 4] 3077 	call divide 
      008EB3 0D               [ 1] 3078 	ldw x,y
      000F03                       3079 	_drop VSIZE 
      008EB4 4F C9            [ 2]    1     addw sp,#VSIZE 
      008EB6 00               [ 4] 3080 	ret 
                                   3081 
                                   3082 
                                   3083 ;----------------------------------
                                   3084 ; search in kword_dict name
                                   3085 ; from its execution address 
                                   3086 ; input:
                                   3087 ;   X       	execution address 
                                   3088 ; output:
                                   3089 ;   X 			cstr*  | 0 
                                   3090 ;--------------------------------
                           000001  3091 	XADR=1 
                           000003  3092 	LINK=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000004  3093 	VSIZE=4
      000F06                       3094 cmd_name:
      000F06                       3095 	_vars VSIZE 
      008EB7 0C C7            [ 2]    1     sub sp,#VSIZE 
      008EB9 00 0C 20 C9      [ 1] 3096 	clr acc16 
      008EBD 0D 01            [ 2] 3097 	ldw (XADR,sp),x  
      008EBF 27 03 CD         [ 2] 3098 	ldw x,#kword_dict	
      008EC2 8A BB            [ 2] 3099 1$:	ldw (LINK,sp),x
      008EC4 E6 02            [ 1] 3100 	ld a,(2,x)
      008EC4 5B 03            [ 1] 3101 	and a,#15 
      008EC6 85 81 0D         [ 1] 3102 	ld acc8,a 
      008EC8 1C 00 03         [ 2] 3103 	addw x,#3
      008EC8 88 91 D6 01      [ 2] 3104 	addw x,acc16
      008ECC 27               [ 2] 3105 	ldw x,(x) ; execution address 
      008ECD 0A 11            [ 2] 3106 	cpw x,(XADR,sp)
      008ECF 01 26            [ 1] 3107 	jreq 2$
      008ED1 06 72            [ 2] 3108 	ldw x,(LINK,sp)
      008ED3 5C               [ 2] 3109 	ldw x,(x) 
      008ED4 00 02 20         [ 2] 3110 	subw x,#2  
      008ED7 F1 5B            [ 1] 3111 	jrne 1$
      008ED9 01 81            [ 2] 3112 	jra 9$
      008EDB 1E 03            [ 2] 3113 2$: ldw x,(LINK,sp)
      008EDB 1E 05 72         [ 2] 3114 	addw x,#2 	
      000F35                       3115 9$:	_drop VSIZE
      008EDE FB 03            [ 2]    1     addw sp,#VSIZE 
      008EE0 1F               [ 4] 3116 	ret
                                   3117 
                                   3118 
                                   3119 ;---------------------------------
                                   3120 ; dictionary search 
                                   3121 ; input:
                                   3122 ;	X 		dictionary entry point, name field  
                                   3123 ;   y		.asciz name to search 
                                   3124 ; output:
                                   3125 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3126 ;  X		execution address | 0 
                                   3127 ;---------------------------------
                           000001  3128 	NLEN=1 ; cmd length 
                           000002  3129 	XSAVE=2
                           000004  3130 	YSAVE=4
                           000005  3131 	VSIZE=5 
      000F38                       3132 search_dict:
      000F38                       3133 	_vars VSIZE 
      008EE1 03 81            [ 2]    1     sub sp,#VSIZE 
                                   3134 
      008EE3 17 04            [ 2] 3135 	ldw (YSAVE,sp),y 
      000F3C                       3136 search_next:
      008EE3 1E 05            [ 2] 3137 	ldw (XSAVE,sp),x 
                                   3138 ; get name length in dictionary	
      008EE5 72               [ 1] 3139 	ld a,(x)
      008EE6 F0 03            [ 1] 3140 	and a,#0xf 
      008EE8 81 01            [ 1] 3141 	ld (NLEN,sp),a  
      008EE9 16 04            [ 2] 3142 	ldw y,(YSAVE,sp) ; name pointer 
      008EE9 52               [ 2] 3143 	incw x 
      000F46                       3144 cp_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008EEA 03 0F            [ 1] 3145 	ld a,(y)
      008EEC 01 1E            [ 1] 3146 	jreq str_match 
      008EEE 06 9E            [ 1] 3147 	tnz (NLEN,sp)
      008EF0 A5 80            [ 1] 3148 	jreq no_match  
      008EF2 27               [ 1] 3149 	cp a,(x)
      008EF3 05 03            [ 1] 3150 	jrne no_match 
      008EF5 01 50            [ 2] 3151 	incw y 
      008EF7 1F               [ 2] 3152 	incw x
      008EF8 06 1E            [ 1] 3153 	dec (NLEN,sp)
      008EFA 08 9E            [ 2] 3154 	jra cp_loop 
      000F58                       3155 no_match:
      008EFC A5 80            [ 2] 3156 	ldw x,(XSAVE,sp) 
      008EFE 27 05 03         [ 2] 3157 	subw x,#2 ; move X to link field
      008F01 01 50            [ 1] 3158 	push #TK_NONE 
      008F03 1F               [ 2] 3159 	ldw x,(x) ; next word link 
      008F04 08               [ 1] 3160 	pop a ; TK_NONE 
      008F05 7B 07            [ 1] 3161 	jreq search_exit  ; not found  
                                   3162 ;try next 
      008F07 97 7B            [ 2] 3163 	jra search_next
      000F65                       3164 str_match:
      008F09 09 42            [ 2] 3165 	ldw x,(XSAVE,sp)
      008F0B 1F               [ 1] 3166 	ld a,(X)
      008F0C 02 7B            [ 1] 3167 	ld (NLEN,sp),a ; needed to test keyword type  
      008F0E 07 97            [ 1] 3168 	and a,#0xf 
                                   3169 ; move x to procedure address field 	
      008F10 7B               [ 1] 3170 	inc a 
      008F11 08 42 9F         [ 1] 3171 	ld acc8,a 
      008F14 1B 02 6B 02      [ 1] 3172 	clr acc16 
      008F18 7B 06 97 7B      [ 2] 3173 	addw x,acc16 
      008F1C 09               [ 2] 3174 	ldw x,(x) ; routine entry point 
                                   3175 ;determine keyword type bits 7:6 
      008F1D 42 9F            [ 1] 3176 	ld a,(NLEN,sp)
      008F1F 1B               [ 1] 3177 	swap a 
      008F20 02 6B            [ 1] 3178 	and a,#0xc
      008F22 02               [ 1] 3179 	srl a
      008F23 0D               [ 1] 3180 	srl a 
      008F24 01 27            [ 1] 3181 	add a,#128
      000F82                       3182 search_exit: 
      000F82                       3183 	_drop VSIZE 	 
      008F26 05 1E            [ 2]    1     addw sp,#VSIZE 
      008F28 02               [ 4] 3184 	ret 
                                   3185 
                                   3186 ;---------------------
                                   3187 ; check if next token
                                   3188 ;  is of expected type 
                                   3189 ; input:
                                   3190 ;   A 		 expected token attribute
                                   3191 ;  ouput:
                                   3192 ;   none     if fail call syntax_error 
                                   3193 ;--------------------
      000F85                       3194 expect:
      008F29 50               [ 1] 3195 	push a 
      008F2A 1F 02 87         [ 4] 3196 	call next_token 
      008F2C 11 01            [ 1] 3197 	cp a,(1,sp)
      008F2C 1E 02            [ 1] 3198 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F2E 5B 03 81         [ 2] 3199 	jp syntax_error
      008F31 84               [ 1] 3200 1$: pop a 
      008F31 52               [ 4] 3201 	ret 
                                   3202 
                                   3203 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3204 ; parse arguments list 
                                   3205 ; between ()
                                   3206 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F92                       3207 func_args:
      008F32 02 0F            [ 1] 3208 	ld a,#TK_LPAREN 
      008F34 01 0F 02         [ 4] 3209 	call expect 
                                   3210 ; expected to continue in arg_list 
                                   3211 ; caller must check for TK_RPAREN 
                                   3212 
                                   3213 ;-------------------------------
                                   3214 ; parse embedded BASIC routines 
                                   3215 ; arguments list.
                                   3216 ; arg_list::=  rel[','rel]*
                                   3217 ; all arguments are of integer type
                                   3218 ; and pushed on stack 
                                   3219 ; input:
                                   3220 ;   none
                                   3221 ; output:
                                   3222 ;   stack{n}   arguments pushed on stack
                                   3223 ;   A 	number of arguments pushed on stack  
                                   3224 ;--------------------------------
      000F97                       3225 arg_list:
      008F37 1E 05            [ 1] 3226 	push #0  
      008F39 5D 26 05         [ 4] 3227 1$: call relation
      008F3C A6 04            [ 1] 3228 	cp a,#TK_NONE 
      008F3E CC 88            [ 1] 3229 	jreq 5$
      008F40 17 9E            [ 1] 3230 	cp a,#TK_INTGR
      008F42 A5 80            [ 1] 3231 	jrne 4$
      000FA4                       3232 3$: 
                                   3233 ; swap return address with argument
      008F44 27               [ 1] 3234 	pop a ; arg_count
      008F45 03 03            [ 2] 3235 	popw y ; return address 
      008F47 01               [ 2] 3236 	pushw x ; new argument 
      008F48 50 1F            [ 2] 3237 	pushw y 
      008F4A 05               [ 1] 3238     inc a
      008F4B 1E               [ 1] 3239 	push a 
      008F4C 07 9E A5         [ 4] 3240 	call next_token 
      008F4F 80 27            [ 1] 3241 	cp a,#TK_COMMA 
      008F51 05 03            [ 1] 3242 	jreq 1$ 
      008F53 01 03            [ 1] 3243 	cp a,#TK_NONE 
      008F55 02 50            [ 1] 3244 	jreq 5$ 
      008F57 16 05            [ 1] 3245 4$:	cp a,#TK_RPAREN 
      008F59 65 90            [ 1] 3246 	jreq 5$
      000FBB                       3247 	_unget_token 
      008F5B CF 00 0D 0D 02   [ 1]    1     mov in,in.saved
      008F60 27               [ 1] 3248 5$:	pop a  
      008F61 0B               [ 4] 3249 	ret 
                                   3250 
                                   3251 ;--------------------------------
                                   3252 ;   BASIC commnands 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3253 ;--------------------------------
                                   3254 
                                   3255 ;--------------------------------
                                   3256 ;  arithmetic and relational 
                                   3257 ;  routines
                                   3258 ;  operators precedence
                                   3259 ;  highest to lowest
                                   3260 ;  operators on same row have 
                                   3261 ;  same precedence and are executed
                                   3262 ;  from left to right.
                                   3263 ;	'*','/','%'
                                   3264 ;   '-','+'
                                   3265 ;   '=','>','<','>=','<=','<>','><'
                                   3266 ;   '<>' and '><' are equivalent for not equal.
                                   3267 ;--------------------------------
                                   3268 
                                   3269 ;---------------------
                                   3270 ; return array element
                                   3271 ; address from @(expr)
                                   3272 ; input:
                                   3273 ;   A 		TK_ARRAY
                                   3274 ; output:
                                   3275 ;   A 		TK_INTGR
                                   3276 ;	X 		element address 
                                   3277 ;----------------------
      000FC2                       3278 get_array_element:
      008F62 90 5D 27         [ 4] 3279 	call func_args 
      008F65 07 5C            [ 1] 3280 	cp a,#1
      008F67 16 05            [ 1] 3281 	jreq 1$
      008F69 72 B2 00         [ 2] 3282 	jp syntax_error
      008F6C 0D               [ 2] 3283 1$: popw x 
                                   3284 	; check for bounds 
      008F6D 0D 01 27         [ 2] 3285 	cpw x,array_size 
      008F70 01 50            [ 2] 3286 	jrule 3$
                                   3287 ; bounds {1..array_size}	
      008F72 A6 0A            [ 1] 3288 2$: ld a,#ERR_BAD_VALUE 
      008F72 5B 02 81         [ 2] 3289 	jp tb_error 
      008F75 5D               [ 2] 3290 3$: tnzw  x
      008F75 1E 03            [ 1] 3291 	jreq 2$ 
      008F77 16               [ 2] 3292 	sllw x 
      008F78 05               [ 2] 3293 	pushw x 
      008F79 52 04 1F         [ 2] 3294 	ldw x,#tib
      008F7C 01 17 03         [ 2] 3295 	subw x,(1,sp)
      000FE2                       3296 	_drop 2   
      008F7F CD 8F            [ 2]    1     addw sp,#2 
      008F81 31 93            [ 1] 3297 	ld a,#TK_INTGR
      008F83 5B               [ 4] 3298 	ret 
                                   3299 
                                   3300 ;***********************************
                                   3301 ;   expression parse,execute 
                                   3302 ;***********************************
                                   3303 ;-----------------------------------
                                   3304 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3305 ;			 integer | function |
                                   3306 ;			 '('relation')' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3307 ; output:
                                   3308 ;   A    token attribute 
                                   3309 ;   X 	 integer
                                   3310 ; ---------------------------------
                           000001  3311 	NEG=1
                           000001  3312 	VSIZE=1
      000FE7                       3313 factor:
      000FE7                       3314 	_vars VSIZE 
      008F84 04 81            [ 2]    1     sub sp,#VSIZE 
      008F86 CD 08 87         [ 4] 3315 	call next_token
      008F86 52 04            [ 1] 3316 	cp a,#CMD_END 
      008F88 72 5F            [ 1] 3317 	jrult 20$
      008F8A 00 0D            [ 1] 3318 1$:	ld (NEG,sp),a 
      008F8C 1F 01            [ 1] 3319 	and a,#TK_GRP_MASK
      008F8E AE A6            [ 1] 3320 	cp a,#TK_GRP_ADD 
      008F90 08 1F            [ 1] 3321 	jreq 2$
      008F92 03 E6            [ 1] 3322 	ld a,(NEG,sp)
      008F94 02 A4            [ 2] 3323 	jra 4$  
      000FFC                       3324 2$:	
      008F96 0F C7 00         [ 4] 3325 	call next_token 
      000FFF                       3326 4$:	
      008F99 0E 1C            [ 1] 3327 	cp a,#TK_IFUNC 
      008F9B 00 03            [ 1] 3328 	jrne 5$ 
      008F9D 72               [ 4] 3329 	call (x) 
      008F9E BB 00            [ 2] 3330 	jra 18$ 
      001006                       3331 5$:
      008FA0 0D FE            [ 1] 3332 	cp a,#TK_INTGR
      008FA2 13 01            [ 1] 3333 	jrne 6$
      008FA4 27 0A            [ 2] 3334 	jra 18$
      00100C                       3335 6$:
      008FA6 1E 03            [ 1] 3336 	cp a,#TK_ARRAY
      008FA8 FE 1D            [ 1] 3337 	jrne 10$
      008FAA 00 02 26         [ 4] 3338 	call get_array_element
      008FAD E3               [ 2] 3339 	ldw x,(x)
      008FAE 20 05            [ 2] 3340 	jra 18$ 
      001016                       3341 10$:
      008FB0 1E 03            [ 1] 3342 	cp a,#TK_VAR 
      008FB2 1C 00            [ 1] 3343 	jrne 12$
      008FB4 02               [ 2] 3344 	ldw x,(x)
      008FB5 5B 04            [ 2] 3345 	jra 18$
      00101D                       3346 12$:			
      008FB7 81 07            [ 1] 3347 	cp a,#TK_LPAREN
      008FB8 26 0C            [ 1] 3348 	jrne 16$
      008FB8 52 05 17         [ 4] 3349 	call relation
      008FBB 04               [ 2] 3350 	pushw x 
      008FBC A6 08            [ 1] 3351 	ld a,#TK_RPAREN 
      008FBC 1F 02 F6         [ 4] 3352 	call expect
      008FBF A4               [ 2] 3353 	popw x 
      008FC0 0F 6B            [ 2] 3354 	jra 18$	
      00102D                       3355 16$:
      00102D                       3356 	_unget_token
      008FC2 01 16 04 5C 01   [ 1]    1     mov in,in.saved
      008FC6 4F               [ 1] 3357 	clr a 
      008FC6 90 F6            [ 2] 3358 	jra 20$ 
      001035                       3359 18$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008FC8 27 1B            [ 1] 3360 	ld a,#TK_MINUS 
      008FCA 0D 01            [ 1] 3361 	cp a,(NEG,sp)
      008FCC 27 0A            [ 1] 3362 	jrne 19$
      008FCE F1               [ 2] 3363 	negw x
      00103C                       3364 19$:
      008FCF 26 07            [ 1] 3365 	ld a,#TK_INTGR
      00103E                       3366 20$:
      00103E                       3367 	_drop VSIZE
      008FD1 90 5C            [ 2]    1     addw sp,#VSIZE 
      008FD3 5C               [ 4] 3368 	ret
                                   3369 
                                   3370 ;-----------------------------------
                                   3371 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3372 ; output:
                                   3373 ;   A    	token attribute 
                                   3374 ;	X		integer
                                   3375 ;-----------------------------------
                           000001  3376 	N1=1
                           000003  3377 	N2=3
                           000005  3378 	MULOP=5
                           000005  3379 	VSIZE=5
      001041                       3380 term:
      001041                       3381 	_vars VSIZE
      008FD4 0A 01            [ 2]    1     sub sp,#VSIZE 
      008FD6 20 EE E7         [ 4] 3382 	call factor
      008FD8 A1 02            [ 1] 3383 	cp a,#CMD_END
      008FD8 1E 02            [ 1] 3384 	jrult term_exit
      00104A                       3385 term01:	 ; check for  operator 
      008FDA 1D 00            [ 2] 3386 	ldw (N2,sp),x  ; save first factor 
      008FDC 02 4B 00         [ 4] 3387 	call next_token
      008FDF FE 84            [ 1] 3388 	cp a,#CMD_END
      008FE1 27 1F            [ 1] 3389 	jrult 9$
      008FE3 20 D7            [ 1] 3390 0$:	ld (MULOP,sp),a
      008FE5 A4 30            [ 1] 3391 	and a,#TK_GRP_MASK
      008FE5 1E 02            [ 1] 3392 	cp a,#TK_GRP_MULT
      008FE7 F6 6B            [ 1] 3393 	jreq 1$
      008FE9 01 A4            [ 1] 3394 	ld a,(MULOP,sp) 
      00105D                       3395 	_unget_token 
      008FEB 0F 4C C7 00 0E   [ 1]    1     mov in,in.saved
      008FF0 72 5F            [ 2] 3396 	jra 9$
      001064                       3397 1$:	; got *|/|%
      008FF2 00 0D 72         [ 4] 3398 	call factor
      008FF5 BB 00            [ 1] 3399 	cp a,#TK_INTGR
      008FF7 0D FE            [ 1] 3400 	jreq 2$ 
      008FF9 7B 01 4E         [ 2] 3401 	jp syntax_error
      008FFC A4 0C            [ 2] 3402 2$:	ldw (N1,sp),x  
      008FFE 44 44            [ 1] 3403 	ld a,(MULOP,sp) 
      009000 AB 80            [ 1] 3404 	cp a,#TK_MULT 
      009002 26 05            [ 1] 3405 	jrne 3$
      009002 5B 05 81         [ 4] 3406 	call multiply 
      009005 20 CF            [ 2] 3407 	jra term01
      009005 88 CD            [ 1] 3408 3$: cp a,#TK_DIV 
      009007 89 07            [ 1] 3409 	jrne 4$ 
      009009 11 01 27         [ 4] 3410 	call divide 
      00900C 03 CC            [ 2] 3411 	jra term01 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00900E 88 15 84         [ 4] 3412 4$: call modulo
      009011 81 C1            [ 2] 3413 	jra term01 
      009012 1E 03            [ 2] 3414 9$: ldw x,(N2,sp)  
      009012 A6 07            [ 1] 3415 	ld a,#TK_INTGR 	
      00108D                       3416 term_exit:
      00108D                       3417 	_drop VSIZE 
      009014 CD 90            [ 2]    1     addw sp,#VSIZE 
      009016 05               [ 4] 3418 	ret 
                                   3419 
                                   3420 ;-------------------------------
                                   3421 ;  expr ::= term [['+'|'-'] term]*
                                   3422 ;  result range {-32768..32767}
                                   3423 ;  output:
                                   3424 ;   A    token attribute 
                                   3425 ;   X	 integer   
                                   3426 ;-------------------------------
                           000001  3427 	N1=1 
                           000003  3428 	N2=3
                           000005  3429 	OP=5 
                           000005  3430 	VSIZE=5 
      009017                       3431 expression:
      001090                       3432 	_vars VSIZE 
      009017 4B 00            [ 2]    1     sub sp,#VSIZE 
      009019 CD 91 54         [ 4] 3433 	call term
      00901C A1 00            [ 1] 3434 	cp a,#CMD_END 
      00901E 27 20            [ 1] 3435 	jrult expr_exit 
      009020 A1 04            [ 2] 3436 0$:	ldw (N2,sp),x 
      009022 26 13 87         [ 4] 3437 	call next_token
      009024 A1 02            [ 1] 3438 	cp a,#CMD_END 
      009024 84 90            [ 1] 3439 	jrult 9$ 
      009026 85 89            [ 1] 3440 1$:	ld (OP,sp),a  
      009028 90 89            [ 1] 3441 	and a,#TK_GRP_MASK
      00902A 4C 88            [ 1] 3442 	cp a,#TK_GRP_ADD 
      00902C CD 89            [ 1] 3443 	jreq 2$ 
      0010AA                       3444 	_unget_token
      00902E 07 A1 09 27 E6   [ 1]    1     mov in,in.saved
      009033 A1 00            [ 2] 3445 	jra 9$
      0010B1                       3446 2$: 
      009035 27 09 A1         [ 4] 3447 	call term
      009038 08 27            [ 1] 3448 	cp a,#TK_INTGR 
      00903A 05 55            [ 1] 3449 	jreq 3$
      00903C 00 03 00         [ 2] 3450 	jp syntax_error
      00903F 02 84            [ 2] 3451 3$:	ldw (N1,sp),x 
      009041 81 05            [ 1] 3452 	ld a,(OP,sp)
      009042 A1 10            [ 1] 3453 	cp a,#TK_PLUS 
      009042 CD 90            [ 1] 3454 	jrne 4$
      009044 12 A1 01         [ 4] 3455 	call add 
      009047 27 03            [ 2] 3456 	jra 0$ 
      009049 CC 88 15         [ 4] 3457 4$:	call substract
      00904C 85 C3            [ 2] 3458 	jra 0$
      00904E 00 23            [ 2] 3459 9$: ldw x,(N2,sp)
      009050 23 05            [ 1] 3460 	ld a,#TK_INTGR	
      0010D1                       3461 expr_exit:
      0010D1                       3462 	_drop VSIZE 
      009052 A6 0A            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009054 CC               [ 4] 3463 	ret 
                                   3464 
                                   3465 ;---------------------------------------------
                                   3466 ; rel ::= expr rel_op expr
                                   3467 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3468 ;  relation return 1 | 0  for true | false 
                                   3469 ;  output:
                                   3470 ;    A 		token attribute  
                                   3471 ;	 X		1|0
                                   3472 ;---------------------------------------------
                           000001  3473 	N1=1
                           000003  3474 	N2=3
                           000005  3475 	RELOP=5
                           000005  3476 	VSIZE=5 
      0010D4                       3477 relation: 
      0010D4                       3478 	_vars VSIZE
      009055 88 17            [ 2]    1     sub sp,#VSIZE 
      009057 5D 27 F8         [ 4] 3479 	call expression
      00905A 58 89            [ 1] 3480 	cp a,#CMD_END  
      00905C AE 16            [ 1] 3481 	jrult rel_exit 
                                   3482 	; expect rel_op or leave 
      00905E 90 72            [ 2] 3483 	ldw (N2,sp),x 
      009060 F0 01 5B         [ 4] 3484 	call next_token 
      009063 02 A6            [ 1] 3485 	cp a,#CMD_END 
      009065 04 81            [ 1] 3486 	jrult 9$
      009067                       3487 1$:	
      009067 52 01            [ 1] 3488 	ld (RELOP,sp),a 
      009069 CD 89            [ 1] 3489 	and a,#TK_GRP_MASK
      00906B 07 A1            [ 1] 3490 	cp a,#TK_GRP_RELOP 
      00906D 02 25            [ 1] 3491 	jreq 2$
      0010EE                       3492 	_unget_token  
      00906F 4E 6B 01 A4 30   [ 1]    1     mov in,in.saved
      009074 A1 10            [ 2] 3493 	jra 9$
      0010F5                       3494 2$:	; expect another expression or error 
      009076 27 04 7B         [ 4] 3495 	call expression
      009079 01 20            [ 1] 3496 	cp a,#TK_INTGR 
      00907B 03 03            [ 1] 3497 	jreq 3$
      00907C CC 07 95         [ 2] 3498 	jp syntax_error 
      00907C CD 89            [ 2] 3499 3$:	ldw (N1,sp),x 
      00907E 07 0E 63         [ 4] 3500 	call substract
      00907F 26 06            [ 1] 3501 	jrne 4$
      00907F A1 81 26 03      [ 1] 3502 	mov acc8,#2 ; n1==n2
      009083 FD 20            [ 2] 3503 	jra 6$ 
      00110C                       3504 4$: 
      009085 2F 06            [ 1] 3505 	jrsgt 5$  
      009086 35 04 00 0D      [ 1] 3506 	mov acc8,#4 ; n1<2 
      009086 A1 04            [ 2] 3507 	jra 6$
      001114                       3508 5$:
      009088 26 02 20 29      [ 1] 3509 	mov acc8,#1 ; n1>n2 
      00908C                       3510 6$:
      00908C A1               [ 1] 3511 	clrw x 
      00908D 06 26 06         [ 1] 3512 	ld a, acc8  
      009090 CD 90            [ 1] 3513 	and a,(RELOP,sp)
      009092 42               [ 1] 3514 	tnz a 
      009093 FE 20            [ 1] 3515 	jreq 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009095 1F               [ 2] 3516 	incw x 
      009096                       3517 7$:	 
      009096 A1 05            [ 2] 3518 	jra 10$  	
      009098 26 03            [ 2] 3519 9$: ldw x,(N2,sp)
      001126                       3520 10$:
      00909A FE 20            [ 1] 3521 	ld a,#TK_INTGR
      001128                       3522 rel_exit: 	 
      001128                       3523 	_drop VSIZE
      00909C 18 05            [ 2]    1     addw sp,#VSIZE 
      00909D 81               [ 4] 3524 	ret 
                                   3525 
                                   3526 ;--------------------------------
                                   3527 ; BASIC: SHOW 
                                   3528 ; print stack content in hexadecimal bytes 
                                   3529 ; 16 bytes per row 
                                   3530 ;--------------------------------
      00112B                       3531 show:
      00909D A1 07 26         [ 2] 3532 	ldw x,#cstk_prompt
      0090A0 0C CD 91         [ 4] 3533 	call puts 
      0090A3 54               [ 1] 3534 	ldw x,sp 
      0090A4 89 A6 08         [ 2] 3535 	addw x,#3 ; ignore return address
      0090A7 CD 90 05 85      [ 2] 3536 	ldw y,#RAM_SIZE  
      0090AB 20 08 0C         [ 2] 3537 	ldw acc16,x 
      0090AD 72 B2 00 0C      [ 2] 3538 	subw y,acc16
      0090AD 55 00 03         [ 4] 3539 	call hex_dump
      0090B0 00               [ 1] 3540 	clr a 
      0090B1 02               [ 4] 3541 	ret
                                   3542 
      0090B2 4F 20 09 6E 74 65 6E  3543 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3544 
                                   3545 
                                   3546 ;--------------------------------------------
                                   3547 ; BASIC: HEX 
                                   3548 ; select hexadecimal base for integer print
                                   3549 ;---------------------------------------------
      0090B5                       3550 hex_base:
      0090B5 A6 11 11 01      [ 1] 3551 	mov base,#16 
      0090B9 26               [ 4] 3552 	ret 
                                   3553 
                                   3554 ;--------------------------------------------
                                   3555 ; BASIC: DEC 
                                   3556 ; select decimal base for integer print
                                   3557 ;---------------------------------------------
      001171                       3558 dec_base:
      0090BA 01 50 00 0A      [ 1] 3559 	mov base,#10
      0090BC 81               [ 4] 3560 	ret 
                                   3561 
                                   3562 ;------------------------
                                   3563 ; BASIC: SIZE 
                                   3564 ; return free size in text area
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3565 ; output:
                                   3566 ;   A 		TK_INTGR
                                   3567 ;   X 	    size integer
                                   3568 ;--------------------------
      001176                       3569 size:
      0090BC A6 04 90         [ 2] 3570 	ldw x,#tib 
      0090BE 72 B0 00 1F      [ 2] 3571 	subw x,txtend 
      0090BE 5B 01            [ 1] 3572 	ld a,#TK_INTGR
      0090C0 81               [ 4] 3573 	ret 
                                   3574 
                                   3575 
                                   3576 ;------------------------
                                   3577 ; BASIC: UBOUND  
                                   3578 ; return array variable size 
                                   3579 ; output:
                                   3580 ;   A 		TK_INTGR
                                   3581 ;   X 	    array size 
                                   3582 ;--------------------------
      0090C1                       3583 ubound:
      0090C1 52 05 CD         [ 2] 3584 	ldw x,#tib
      0090C4 90 67 A1 02      [ 2] 3585 	subw x,txtend 
      0090C8 25 43 00 04      [ 2] 3586 	ldw y,basicptr 
      0090CA 90 C3 00 1F      [ 2] 3587 	cpw y,txtend 
      0090CA 1F 03            [ 1] 3588 	jrult 1$
      0090CC CD 89 07         [ 1] 3589 	push count 
      0090CF A1 02            [ 1] 3590 	push #0 
      0090D1 25 36 6B         [ 2] 3591 	subw x,(1,sp)
      001199                       3592 	_drop 2 
      0090D4 05 A4            [ 2]    1     addw sp,#2 
      0090D6 30               [ 2] 3593 1$:	srlw x 
      0090D7 A1 20 27         [ 2] 3594 	ldw array_size,x
      0090DA 09 7B            [ 1] 3595 	ld a,#TK_INTGR
      0090DC 05               [ 4] 3596 	ret 
                                   3597 
                                   3598 ;-----------------------------
                                   3599 ; BASIC: LET var=expr 
                                   3600 ; variable assignement 
                                   3601 ; output:
                                   3602 ;   A 		TK_NONE 
                                   3603 ;-----------------------------
      0011A2                       3604 let:
      0090DD 55 00 03         [ 4] 3605 	call next_token 
      0090E0 00 02            [ 1] 3606 	cp a,#TK_VAR 
      0090E2 20 25            [ 1] 3607 	jreq let_var
      0090E4 A1 06            [ 1] 3608 	cp a,#TK_ARRAY 
      0090E4 CD 90            [ 1] 3609 	jreq  let_array
      0090E6 67 A1 04         [ 2] 3610 	jp syntax_error
      0011B0                       3611 let_array:
      0090E9 27 03 CC         [ 4] 3612 	call get_array_element
      0011B3                       3613 let_var:
      0090EC 88               [ 2] 3614 	pushw x  
      0090ED 15 1F 01         [ 4] 3615 	call next_token 
      0090F0 7B 05            [ 1] 3616 	cp a,#TK_EQUAL
      0090F2 A1 20            [ 1] 3617 	jreq 1$
      0090F4 26 05 CD         [ 2] 3618 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0011BE                       3619 1$:	
      0090F7 8E E9 20         [ 4] 3620 	call relation   
      0090FA CF A1            [ 1] 3621 	cp a,#TK_INTGR 
      0090FC 21 26            [ 1] 3622 	jreq 2$
      0090FE 05 CD 8F         [ 2] 3623 	jp syntax_error
      0011C8                       3624 2$:	
      009101 31 20            [ 1] 3625 	ldw y,x 
      009103 C6               [ 2] 3626 	popw x   
      009104 CD               [ 2] 3627 	ldw (x),y   
      009105 8F               [ 4] 3628 	ret 
                                   3629 
                                   3630 ;----------------------------
                                   3631 ; BASIC: LIST [[start][,end]]
                                   3632 ; list program lines 
                                   3633 ; form start to end 
                                   3634 ; if empty argument list then 
                                   3635 ; list all.
                                   3636 ;----------------------------
                           000001  3637 	FIRST=1
                           000003  3638 	LAST=3 
                           000005  3639 	LN_PTR=5
                           000006  3640 	VSIZE=6 
      0011CD                       3641 list:
      009106 75 20 C1         [ 2] 3642 	ldw x,txtbgn 
      009109 1E 03 A6         [ 2] 3643 	cpw x,txtend 
      00910C 04 01            [ 1] 3644 	jrmi 1$
      00910D 81               [ 4] 3645 	ret 
      0011D6                       3646 1$:	
      0011D6                       3647 	_vars VSIZE
      00910D 5B 05            [ 2]    1     sub sp,#VSIZE 
      00910F 81 05            [ 2] 3648 	ldw (LN_PTR,sp),x 
      009110 FE               [ 2] 3649 	ldw x,(x) 
      009110 52 05            [ 2] 3650 	ldw (FIRST,sp),x ; list from first line 
      009112 CD 90 C1         [ 2] 3651 	ldw x,#MAX_LINENO ; biggest line number 
      009115 A1 02            [ 2] 3652 	ldw (LAST,sp),x 
      009117 25 38 1F         [ 4] 3653 	call arg_list
      00911A 03               [ 1] 3654 	tnz a
      00911B CD 89            [ 1] 3655 	jreq list_start 
      00911D 07 A1            [ 1] 3656 	cp a,#2 
      00911F 02 25            [ 1] 3657 	jreq 4$
      009121 2B 6B            [ 1] 3658 	cp a,#1 
      009123 05 A4            [ 1] 3659 	jreq first_line 
      009125 30 A1 10         [ 2] 3660 	jp syntax_error 
      009128 27               [ 2] 3661 4$:	popw x 
      009129 07 55            [ 2] 3662 	ldw (LAST+2,sp),x 
      0011F6                       3663 first_line:
      00912B 00               [ 2] 3664 	popw x
      00912C 03 00            [ 2] 3665 	ldw (FIRST,sp),x 
      0011F9                       3666 lines_skip:
      00912E 02 20 1C         [ 2] 3667 	ldw x,txtbgn
      009131 1F 05            [ 2] 3668 2$:	ldw (LN_PTR,sp),x 
      009131 CD 90 C1         [ 2] 3669 	cpw x,txtend 
      009134 A1 04            [ 1] 3670 	jrpl list_exit 
      009136 27               [ 2] 3671 	ldw x,(x) ;line# 
      009137 03 CC            [ 2] 3672 	cpw x,(FIRST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009139 88 15            [ 1] 3673 	jrpl list_start 
      00913B 1F 01            [ 2] 3674 	ldw x,(LN_PTR,sp) 
      00913D 7B 05            [ 1] 3675 	ld a,(2,x)
      00913F A1 10 26         [ 1] 3676 	ld acc8,a 
      009142 05 CD 8E DB      [ 1] 3677 	clr acc16 
      009146 20 D1 CD 8E      [ 2] 3678 	addw x,acc16
      00914A E3 20            [ 2] 3679 	jra 2$ 
                                   3680 ; print loop
      001219                       3681 list_start:
      00914C CC 1E            [ 2] 3682 	ldw x,(LN_PTR,sp)
      00914E 03 A6            [ 1] 3683 3$:	ld a,(2,x) 
      009150 04 12 9A         [ 4] 3684 	call prt_basic_line
      009151 1E 05            [ 2] 3685 	ldw x,(LN_PTR,sp)
      009151 5B 05            [ 1] 3686 	ld a,(2,x)
      009153 81 00 0D         [ 1] 3687 	ld acc8,a 
      009154 72 5F 00 0C      [ 1] 3688 	clr acc16 
      009154 52 05 CD 91      [ 2] 3689 	addw x,acc16
      009158 10 A1 02         [ 2] 3690 	cpw x,txtend 
      00915B 25 4B            [ 1] 3691 	jrpl list_exit
      00915D 1F 03            [ 2] 3692 	ldw (LN_PTR,sp),x
      00915F CD               [ 2] 3693 	ldw x,(x)
      009160 89 07            [ 2] 3694 	cpw x,(LAST,sp)  
      009162 A1 02            [ 1] 3695 	jrsgt list_exit 
      009164 25 3E            [ 2] 3696 	ldw x,(LN_PTR,sp)
      009166 20 DC            [ 2] 3697 	jra 3$
      00123F                       3698 list_exit:
      00123F                       3699 	_drop VSIZE 
      009166 6B 05            [ 2]    1     addw sp,#VSIZE 
      009168 A4               [ 4] 3700 	ret
                                   3701 
                                   3702 ;-------------------------
                                   3703 ; print counted string 
                                   3704 ; input:
                                   3705 ;   X 	address of string
                                   3706 ;--------------------------
      001242                       3707 prt_cmd_name:
      009169 30               [ 1] 3708 	ld a,(x)
      00916A A1               [ 2] 3709 	incw x
      00916B 30 27            [ 1] 3710 	and a,#15  
      00916D 07               [ 1] 3711 	push a 
      00916E 55 00            [ 1] 3712 1$: tnz (1,sp) 
      009170 03 00            [ 1] 3713 	jreq 9$
      009172 02               [ 1] 3714 	ld a,(x)
      009173 20 2F C4         [ 4] 3715 	call putc 
      009175 5C               [ 2] 3716 	incw x
      009175 CD 91            [ 1] 3717 	dec (1,sp)	 
      009177 10 A1            [ 2] 3718 	jra 1$
      009179 04               [ 1] 3719 9$: pop a 
      00917A 27               [ 4] 3720 	ret	
                                   3721 
                                   3722 ;--------------------------
                                   3723 ; print TK_QSTR
                                   3724 ; converting control character
                                   3725 ; to backslash sequence
                                   3726 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3727 ;   X        char *
                                   3728 ;-----------------------------
      001256                       3729 prt_quote:
      00917B 03 CC            [ 1] 3730 	ld a,#'"
      00917D 88 15 1F         [ 4] 3731 	call putc 
      009180 01               [ 1] 3732 1$:	ld a,(x)
      009181 CD 8E            [ 1] 3733 	jreq 9$
      009183 E3               [ 2] 3734 	incw x 
      009184 26 06            [ 1] 3735 	cp a,#SPACE 
      009186 35 02            [ 1] 3736 	jrult 3$
      009188 00 0E 20         [ 4] 3737 	call putc
      00918B 0C 5C            [ 1] 3738 	cp a,#'\ 
      00918C 26 F1            [ 1] 3739 	jrne 1$ 
      00126A                       3740 2$:
      00918C 2C 06 35         [ 4] 3741 	call putc 
      00918F 04 00            [ 2] 3742 	jra 1$
      009191 0E               [ 1] 3743 3$: push a 
      009192 20 04            [ 1] 3744 	ld a,#'\
      009194 CD 01 C4         [ 4] 3745 	call putc 
      009194 35               [ 1] 3746 	pop a 
      009195 01 00            [ 1] 3747 	sub a,#7
      009197 0E 00 0D         [ 1] 3748 	ld acc8,a 
      009198 72 5F 00 0C      [ 1] 3749 	clr acc16
      009198 5F C6 00 0E      [ 2] 3750 	ldw y,#escaped 
      00919C 14 05 4D 27      [ 2] 3751 	addw y,acc16 
      0091A0 05 5C            [ 1] 3752 	ld a,(y)
      0091A2 20 DF            [ 2] 3753 	jra 2$
      0091A2 20 02            [ 1] 3754 9$: ld a,#'"
      0091A4 1E 03 C4         [ 4] 3755 	call putc 
      0091A6 5C               [ 2] 3756 	incw x 
      0091A6 A6               [ 4] 3757 	ret
                                   3758 
                                   3759 ;--------------------------
                                   3760 ; return variable name 
                                   3761 ; from its address.
                                   3762 ; input:
                                   3763 ;   X    variable address
                                   3764 ; output:
                                   3765 ;   A     variable letter
                                   3766 ;--------------------------
      001292                       3767 var_name:
      0091A7 04 00 27         [ 2] 3768 		subw x,#vars 
      0091A8 9F               [ 1] 3769 		ld a,xl 
      0091A8 5B               [ 1] 3770 		srl a 
      0091A9 05 81            [ 1] 3771 		add a,#'A 
      0091AB 81               [ 4] 3772 		ret 
                                   3773 
                                   3774 
                                   3775 ;--------------------------
                                   3776 ; decompile line from token list 
                                   3777 ; input:
                                   3778 ;   A       stop at this position 
                                   3779 ;   X 		pointer at line
                                   3780 ; output:
                                   3781 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3782 ;--------------------------	
                           000001  3783 	BASE_SAV=1
                           000002  3784 	WIDTH_SAV=2
                           000003  3785 	XSAVE=3
                           000005  3786 	LLEN=5
                           000005  3787 	VSIZE=5 
      00129A                       3788 prt_basic_line:
      00129A                       3789 	_vars VSIZE
      0091AB AE 91            [ 2]    1     sub sp,#VSIZE 
      0091AD C5 CD            [ 1] 3790 	ld (LLEN,sp),a  
      0091AF 82 57 96         [ 1] 3791 	ld a,base
      0091B2 1C 00            [ 1] 3792 	ld (BASE_SAV,sp),a  
      0091B4 03 90 AE         [ 1] 3793 	ld a,tab_width 
      0091B7 18 00            [ 1] 3794 	ld (WIDTH_SAV,sp),a 
      0091B9 CF 00 0D         [ 2] 3795 	ldw ptr16,x
      0091BC 72               [ 2] 3796 	ldw x,(x)
      0091BD B2 00 0D CD      [ 1] 3797 	mov base,#10
      0091C1 82 F9 4F 81      [ 1] 3798 	mov tab_width,#5
      0091C5 0A 63 6F         [ 4] 3799 	call print_int ; print line number 
      0091C8 6E 74            [ 1] 3800 	ld a,#SPACE 
      0091CA 65 6E 74         [ 4] 3801 	call putc 
      0091CD 20 6F 66 20      [ 1] 3802 	clr tab_width
      0091D1 73 74 61         [ 2] 3803 	ldw x,#3
      0091D4 63               [ 1] 3804 1$:	ld a,xl 
      0091D5 6B 20            [ 1] 3805 	cp a,(LLEN,sp)
      0091D7 66 72            [ 1] 3806 	jrmi 2$
      0091D9 6F 6D 20         [ 2] 3807 	jp 20$
      0012CB                       3808 2$:	 
      0091DC 74 6F 70 20      [ 4] 3809 	ld a,([ptr16],x)
      0091E0 74               [ 2] 3810 	incw x 
      0091E1 6F 20            [ 2] 3811 	ldw (XSAVE,sp),x 
      0091E3 62 6F 74 74      [ 5] 3812 	ldw x,([ptr16],x)
      0091E7 6F               [ 1] 3813 	tnz a 
      0091E8 6D 3A            [ 1] 3814 	jrmi 3$
      0091EA 0A 00            [ 1] 3815 	cp a,#TK_VAR 
      0091EC 27 3E            [ 1] 3816 	jreq 4$
      0091EC 35 10            [ 1] 3817 	cp a,#TK_INTGR
      0091EE 00 0B            [ 1] 3818 	jreq 5$
      0091F0 81 02            [ 1] 3819 	cp a,#TK_QSTR 
      0091F1 27 43            [ 1] 3820 	jreq 6$
      0091F1 35 0A            [ 1] 3821 	cp a,#TK_CHAR 
      0091F3 00 0B            [ 1] 3822 	jreq 7$
      0091F5 81 5C            [ 2] 3823 	jra 8$
                                   3824 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0091F6                       3825 3$:	
      0091F6 AE 16 90         [ 2] 3826 	cpw x,#remark 
      0091F9 72 B0            [ 1] 3827 	jrne 30$
      0091FB 00 20            [ 1] 3828 	ld a,#''
      0091FD A6 04 81         [ 4] 3829 	call putc 
      009200 1E 03            [ 2] 3830 	ldw x,(XSAVE,sp)
      009200 AE 16 90         [ 2] 3831 	addw x,#2
      009203 72 B0 00 20      [ 2] 3832 	addw x,ptr16  
      009207 90 CE 00         [ 4] 3833 	call puts 
      00920A 05 90 C3         [ 2] 3834 	jp 20$ 
      001304                       3835 30$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00920D 00 20            [ 1] 3836 	ld a,#SPACE 
      00920F 25 0A 3B         [ 4] 3837 	call putc 
      009212 00 04 4B         [ 4] 3838 	call cmd_name
      009215 00 72 F0         [ 4] 3839 	call prt_cmd_name
      009218 01 5B            [ 1] 3840 	ld a,#SPACE 
      00921A 02 54 CF         [ 4] 3841 	call putc 
      001314                       3842 31$:
      00921D 00 23            [ 2] 3843 	ldw x,(XSAVE,sp)
      00921F A6 04 81         [ 2] 3844 	addw x,#2
      009222 20 A8            [ 2] 3845 	jra 1$
                                   3846 ;; TK_VAR 
      00131B                       3847 4$:
                                   3848 ;	ld a,#SPACE 
                                   3849 ;	call putc 
      009222 CD 89 07         [ 4] 3850 	call var_name
      009225 A1 05 27         [ 4] 3851 	call putc 
      009228 0A A1            [ 2] 3852 	jra 31$
                                   3853 ;; TK_INTGR
      001323                       3854 5$:
                                   3855 ;	ld a,#SPACE 
                                   3856 ;	call putc
      00922A 06 27 03         [ 4] 3857 	call print_int 
      00922D CC 88            [ 2] 3858 	jra 31$
                                   3859 ;; TK_QSTR
      001328                       3860 6$:
      00922F 15 03            [ 2] 3861 	ldw x,(XSAVE,sp)
      009230 72 BB 00 18      [ 2] 3862 	addw x,ptr16 
      009230 CD 90 42         [ 4] 3863 	call prt_quote  
      009233 72 B0 00 18      [ 2] 3864 	subw x,ptr16  
      009233 89 CD 89         [ 2] 3865 	jp 1$
                                   3866 ;; TK_CHAR 
      001338                       3867 7$:
      009236 07 A1            [ 1] 3868 	ld a,#'\ 
      009238 32 27 03         [ 4] 3869 	call putc 
      00923B CC               [ 1] 3870 	ld a,xh 
      00923C 88 15 C4         [ 4] 3871 	call putc 
      00923E 1E 03            [ 2] 3872 	ldw x,(XSAVE,sp)
      00923E CD               [ 2] 3873 	incw x 
      00923F 91 54 A1         [ 2] 3874 	jp 1$ 
      009242 04 27            [ 1] 3875 8$: cp a,#TK_COLON 
      009244 03 CC            [ 1] 3876 	jrne 9$
      009246 88 15            [ 1] 3877 	ld a,#':
      009248                       3878 81$:
      009248 90 93 85         [ 4] 3879 	call putc
      001350                       3880 82$:
      00924B FF 81            [ 2] 3881 	ldw x,(XSAVE,sp)
      00924D CC 12 C3         [ 2] 3882 	jp 1$ 
      001355                       3883 9$: 
      00924D CE 00            [ 1] 3884 	cp a,#TK_SHARP
      00924F 1E C3            [ 1] 3885 	jrugt 10$ 
      009251 00 20            [ 1] 3886 	sub a,#TK_ARRAY 
      009253 2B 01            [ 1] 3887 	clrw y 
      009255 81 97            [ 1] 3888 	ld yl,a
      009256 72 A9 13 AB      [ 2] 3889 	addw y,#single_char 
      009256 52 06            [ 1] 3890 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009258 1F 05            [ 2] 3891 	jra 81$ 
      001367                       3892 10$: 
      00925A FE 1F            [ 1] 3893 	cp a,#TK_MINUS 
      00925C 01 AE            [ 1] 3894 	jrugt 11$
      00925E 7F FF            [ 1] 3895 	sub a,#TK_PLUS 
      009260 1F 03            [ 1] 3896 	clrw y 
      009262 CD 90            [ 1] 3897 	ld yl,a 
      009264 17 4D 27 31      [ 2] 3898 	addw y,#add_char 
      009268 A1 02            [ 1] 3899 	ld a,(y)
      00926A 27 07            [ 2] 3900 	jra 81$
      001379                       3901 11$:
      00926C A1 01            [ 1] 3902     cp a,#TK_MOD 
      00926E 27 06            [ 1] 3903 	jrugt 12$
      009270 CC 88            [ 1] 3904 	sub a,#TK_MULT
      009272 15 85            [ 1] 3905 	clrw y 
      009274 1F 05            [ 1] 3906 	ld yl,a 
      009276 72 A9 13 B2      [ 2] 3907 	addw y,#mul_char
      009276 85 1F            [ 1] 3908 	ld a,(y)
      009278 01 C2            [ 2] 3909 	jra 81$
      009279                       3910 12$:
      009279 CE 00            [ 1] 3911 	sub a,#TK_GT  
      00927B 1E               [ 1] 3912 	sll a 
      00927C 1F               [ 1] 3913 	clrw x 
      00927D 05               [ 1] 3914 	ld xl,a 
      00927E C3 00 20         [ 2] 3915 	addw x,#relop_str 
      009281 2A               [ 2] 3916 	ldw x,(x)
      009282 3C FE 13         [ 4] 3917 	call puts 
      009285 01 2A            [ 2] 3918 	jra 82$
      001399                       3919 20$: 
      009287 11 1E            [ 1] 3920 	ld a,#CR 
      009289 05 E6 02         [ 4] 3921 	call putc
      00928C C7 00            [ 1] 3922 	ld a,(WIDTH_SAV,sp) 
      00928E 0E 72 5F         [ 1] 3923 	ld tab_width,a 
      009291 00 0D            [ 1] 3924 	ld a,(BASE_SAV,sp) 
      009293 72 BB 00         [ 1] 3925 	ld base,a
      0013A8                       3926 	_drop VSIZE 
      009296 0D 20            [ 2]    1     addw sp,#VSIZE 
      009298 E3               [ 4] 3927 	ret 
                                   3928 
      009299 40 28 29 2C 23        3929 single_char: .byte '@','(',')',',','#'
      009299 1E 05                 3930 add_char: .byte '+','-'
      00929B E6 02 CD              3931 mul_char: .byte '*','/','%'
      00929E 93 1A 1E 05 E6 02 C7  3932 relop_str: .word gt,equal,ge,lt,le,ne 
             00 0E 72 5F 00
      0092AA 0D 72                 3933 gt: .asciz ">"
      0092AC BB 00                 3934 equal: .asciz "="
      0092AE 0D C3 00              3935 ge: .asciz ">="
      0092B1 20 2A                 3936 lt: .asciz "<"
      0092B3 0B 1F 05              3937 le: .asciz "<="
      0092B6 FE 13 03              3938 ne:  .asciz "<>"
                                   3939 
                                   3940 
                                   3941 ;---------------------------------
                                   3942 ; BASIC: PRINT|? arg_list 
                                   3943 ; print values from argument list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3944 ;----------------------------------
                           000001  3945 	COMMA=1
                           000001  3946 	VSIZE=1
      0013D0                       3947 print:
      0092B9 2C 04            [ 1] 3948 push #0 ; local variable COMMA 
      0013D2                       3949 reset_comma:
      0092BB 1E 05            [ 1] 3950 	clr (COMMA,sp)
      0013D4                       3951 prt_loop:
      0092BD 20 DC 87         [ 4] 3952 	call next_token
      0092BF A1 02            [ 1] 3953 	cp a,#CMD_END 
      0092BF 5B 06            [ 1] 3954 	jrult print_exit ; colon or end of line 
      0092C1 81 02            [ 1] 3955 	cp a,#TK_QSTR
      0092C2 27 12            [ 1] 3956 	jreq 1$
      0092C2 F6 5C            [ 1] 3957 	cp a,#TK_CHAR 
      0092C4 A4 0F            [ 1] 3958 	jreq 2$ 
      0092C6 88 0D            [ 1] 3959 	cp a,#TK_CFUNC 
      0092C8 01 27            [ 1] 3960 	jreq 3$
      0092CA 09 F6            [ 1] 3961 	cp a,#TK_COMMA 
      0092CC CD 82            [ 1] 3962 	jreq 4$
      0092CE 44 5C            [ 1] 3963 	cp a,#TK_SHARP 
      0092D0 0A 01            [ 1] 3964 	jreq 5$
      0092D2 20 F3            [ 2] 3965 	jra 7$ 
      0013F1                       3966 1$:	; print string 
      0092D4 84 81 D7         [ 4] 3967 	call puts
      0092D6 20 DC            [ 2] 3968 	jra reset_comma
      0013F6                       3969 2$:	; print character 
      0092D6 A6               [ 1] 3970 	ld a,xl 
      0092D7 22 CD 82         [ 4] 3971 	call putc 
      0092DA 44 F6            [ 2] 3972 	jra reset_comma 
      0013FC                       3973 3$: ; print character function value  	
      0092DC 27               [ 4] 3974 	call (x)
      0092DD 2D               [ 1] 3975 	ld a,xl 
      0092DE 5C A1 20         [ 4] 3976 	call putc
      0092E1 25 0C            [ 2] 3977 	jra reset_comma 
      001403                       3978 4$: ; set comma state 
      0092E3 CD 82            [ 1] 3979 	ld a,#255 
      0092E5 44 A1            [ 1] 3980 	ld (COMMA,sp),a  
      0092E7 5C 26 F1         [ 2] 3981 	jp prt_loop   
      0092EA                       3982 5$: ; # character must be followed by an integer   
      0092EA CD 82 44         [ 4] 3983 	call next_token
      0092ED 20 EC            [ 1] 3984 	cp a,#TK_INTGR 
      0092EF 88 A6            [ 1] 3985 	jreq 6$
      0092F1 5C CD 82         [ 2] 3986 	jp syntax_error 
      001414                       3987 6$: ; set tab width
      0092F4 44               [ 1] 3988 	ld a,xl 
      0092F5 84 A0            [ 1] 3989 	and a,#15 
      0092F7 07 C7 00         [ 1] 3990 	ld tab_width,a 
      0092FA 0E 72            [ 2] 3991 	jra reset_comma 
      00141C                       3992 7$:	
      00141C                       3993 	_unget_token
      0092FC 5F 00 0D 90 AE   [ 1]    1     mov in,in.saved
      009301 8B B7 72         [ 4] 3994 	call relation 
      009304 B9 00            [ 1] 3995 	cp a,#TK_INTGR
      009306 0D 90            [ 1] 3996 	jreq 8$
      001428                       3997 	_unget_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009308 F6 20 DF A6 22   [ 1]    1     mov in,in.saved
      00930D CD 82 44         [ 2] 3998 	jp print_exit 
      009310 5C 81 2D         [ 4] 3999 8$: call print_int 
      009312 20 9D            [ 2] 4000 	jra reset_comma 
      001435                       4001 print_exit:
      009312 1D 00            [ 1] 4002 	tnz (COMMA,sp)
      009314 28 9F            [ 1] 4003 	jrne 9$
      009316 44 AB            [ 1] 4004 	ld a,#CR 
      009318 41 81 C4         [ 4] 4005     call putc 
      00931A                       4006 9$:	_drop VSIZE 
      00931A 52 05            [ 2]    1     addw sp,#VSIZE 
      00931C 6B               [ 4] 4007 	ret 
                                   4008 
      001441                       4009 print_type: 
                                   4010 
                                   4011 ;----------------------
                                   4012 ; 'save_context' and
                                   4013 ; 'rest_context' must be 
                                   4014 ; called at the same 
                                   4015 ; call stack depth 
                                   4016 ; i.e. SP must have the 
                                   4017 ; save value at  
                                   4018 ; entry point of both 
                                   4019 ; routine. 
                                   4020 ;---------------------
                           000004  4021 	CTXT_SIZE=4 ; size of saved data 
                                   4022 ;--------------------
                                   4023 ; save current BASIC
                                   4024 ; interpreter context 
                                   4025 ; on stack 
                                   4026 ;--------------------
      001441                       4027 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001441                       4028 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001441                       4029 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001441                       4030 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001441                       4031 save_context:
      00931D 05 C6 00         [ 2] 4032 	ldw x,basicptr 
      009320 0B 6B            [ 2] 4033 	ldw (BPTR,sp),x
      009322 01 C6 00         [ 1] 4034 	ld a,in 
      009325 26 6B            [ 1] 4035 	ld (IN,sp),a
      009327 02 CF 00         [ 1] 4036 	ld a,count 
      00932A 19 FE            [ 1] 4037 	ld (CNT,sp),a  
      00932C 35               [ 4] 4038 	ret
                                   4039 
                                   4040 ;-----------------------
                                   4041 ; restore previously saved 
                                   4042 ; BASIC interpreter context 
                                   4043 ; from stack 
                                   4044 ;-------------------------
      001451                       4045 rest_context:
      00932D 0A 00            [ 2] 4046 	ldw x,(BPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00932F 0B 35 05         [ 2] 4047 	ldw basicptr,x 
      009332 00 26            [ 1] 4048 	ld a,(IN,sp)
      009334 CD 89 AD         [ 1] 4049 	ld in,a
      009337 A6 20            [ 1] 4050 	ld a,(CNT,sp)
      009339 CD 82 44         [ 1] 4051 	ld count,a  
      00933C 72               [ 4] 4052 	ret
                                   4053 
                                   4054 
                                   4055 
                                   4056 ;------------------------------------------
                                   4057 ; BASIC: INPUT [string]var[,[string]var]
                                   4058 ; input value in variables 
                                   4059 ; [string] optionally can be used as prompt 
                                   4060 ;-----------------------------------------
                           000001  4061 	CX_BPTR=1
                           000003  4062 	CX_IN=3
                           000004  4063 	CX_CNT=4
                           000005  4064 	SKIP=5
                           000006  4065 	VAR_ADDR=6
                           000007  4066 	VSIZE=7
      001461                       4067 input_var:
      001461                       4068 	_vars VSIZE 
      00933D 5F 00            [ 2]    1     sub sp,#VSIZE 
      001463                       4069 input_loop:
      00933F 26 AE            [ 1] 4070 	clr (SKIP,sp)
      009341 00 03 9F         [ 4] 4071 	call next_token 
      009344 11 05            [ 1] 4072 	cp a,#TK_QSTR 
      009346 2B 03            [ 1] 4073 	jrne 1$ 
      009348 CC 94 19         [ 4] 4074 	call puts 
      00934B 03 05            [ 1] 4075 	cpl (SKIP,sp)
      00934B 72 D6 00         [ 4] 4076 	call next_token 
      00934E 19 5C            [ 1] 4077 1$: cp a,#TK_VAR  
      009350 1F 03            [ 1] 4078 	jreq 2$ 
      009352 72 DE 00         [ 2] 4079 	jp syntax_error
      009355 19 4D            [ 2] 4080 2$:	ldw (VAR_ADDR,sp),x 
      009357 2B 12            [ 1] 4081 	tnz (SKIP,sp)
      009359 A1 05            [ 1] 4082 	jrne 21$ 
      00935B 27 3E A1         [ 4] 4083 	call var_name 
      00935E 04 27 42         [ 4] 4084 	call putc   
      001487                       4085 21$:
      009361 A1 02            [ 1] 4086 	ld a,#':
      009363 27 43 A1         [ 4] 4087 	call putc 
      009366 03 27 4F         [ 4] 4088 	call save_context 
      009369 20 5C 00 03      [ 1] 4089 	clr count  
      00936B CD 0A 5E         [ 4] 4090 	call readln 
      00936B A3 95 4D         [ 2] 4091 	ldw x,#tib 
      00936E 26 14 A6         [ 1] 4092 	push count
      009371 27 CD            [ 1] 4093 	push #0 
      009373 82 44 1E         [ 2] 4094 	addw x,(1,sp)
      009376 03               [ 2] 4095 	incw x 
      0014A2                       4096 	_drop 2 
      009377 1C 00            [ 2]    1     addw sp,#2 
      009379 02 72 BB 00      [ 1] 4097 	clr in 
      00937D 19 CD 82         [ 4] 4098 	call get_token
      009380 57 CC            [ 1] 4099 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009382 94 19            [ 1] 4100 	jreq 3$ 
      009384 CD 14 51         [ 4] 4101 	call rest_context 
      009384 A6 20 CD         [ 2] 4102 	jp syntax_error
      009387 82 44            [ 2] 4103 3$: ldw y,(VAR_ADDR,sp) 
      009389 CD 8F            [ 2] 4104 	ldw (y),x 
      00938B 86 CD 92         [ 4] 4105 	call rest_context
      00938E C2 A6 20         [ 4] 4106 	call next_token 
      009391 CD 82            [ 1] 4107 	cp a,#TK_COMMA 
      009393 44 A0            [ 1] 4108 	jreq input_loop 
      009394 A1 01            [ 1] 4109 	cp a,#TK_COLON 
      009394 1E 03            [ 2] 4110     jrule input_exit 
      009396 1C 00 02         [ 2] 4111 	jp syntax_error 
      0014CA                       4112 input_exit:
      0014CA                       4113 	_drop VSIZE 
      009399 20 A8            [ 2]    1     addw sp,#VSIZE 
      00939B 81               [ 4] 4114 	ret 
                                   4115 
                                   4116 
                                   4117 ;---------------------
                                   4118 ; BASIC: REMARK | ' 
                                   4119 ; skip comment to end of line 
                                   4120 ;---------------------- 
      0014CD                       4121 remark:
      00939B CD 93 12 CD 82   [ 1] 4122 	mov in,count 
      0093A0 44               [ 4] 4123  	ret 
                                   4124 
                                   4125 
                                   4126 ;---------------------
                                   4127 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4128 ; read in loop 'addr'  
                                   4129 ; apply & 'mask' to value 
                                   4130 ; loop while result==0.  
                                   4131 ; 'xor_mask' is used to 
                                   4132 ; invert the wait logic.
                                   4133 ; i.e. loop while not 0.
                                   4134 ;---------------------
                           000001  4135 	XMASK=1 
                           000002  4136 	MASK=2
                           000003  4137 	ADDR=3
                           000004  4138 	VSIZE=4
      0014D3                       4139 wait: 
      0014D3                       4140 	_vars VSIZE
      0093A1 20 F1            [ 2]    1     sub sp,#VSIZE 
      0093A3 0F 01            [ 1] 4141 	clr (XMASK,sp) 
      0093A3 CD 89 AD         [ 4] 4142 	call arg_list 
      0093A6 20 EC            [ 1] 4143 	cp a,#2
      0093A8 24 03            [ 1] 4144 	jruge 0$
      0093A8 1E 03 72         [ 2] 4145 	jp syntax_error 
      0093AB BB 00            [ 1] 4146 0$:	cp a,#3
      0093AD 19 CD            [ 1] 4147 	jrult 1$
      0093AF 92               [ 2] 4148 	popw x 
      0093B0 D6               [ 1] 4149 	ld a,xl
      0093B1 72 B0            [ 1] 4150 	ld (XMASK,sp),a 
      0093B3 00               [ 2] 4151 1$: popw x ; mask 
      0093B4 19               [ 1] 4152 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0093B5 CC 93            [ 1] 4153 	ld (MASK,sp),a 
      0093B7 43               [ 2] 4154 	popw x ; address 
      0093B8 F6               [ 1] 4155 2$:	ld a,(x)
      0093B8 A6 5C            [ 1] 4156 	and a,(MASK,sp)
      0093BA CD 82            [ 1] 4157 	xor a,(XMASK,sp)
      0093BC 44 9E            [ 1] 4158 	jreq 2$ 
      0014F5                       4159 	_drop VSIZE 
      0093BE CD 82            [ 2]    1     addw sp,#VSIZE 
      0093C0 44               [ 4] 4160 	ret 
                                   4161 
                                   4162 ;---------------------
                                   4163 ; BASIC: BSET addr,mask
                                   4164 ; set bits at 'addr' corresponding 
                                   4165 ; to those of 'mask' that are at 1.
                                   4166 ; arguments:
                                   4167 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4168 ;   mask        mask|addr
                                   4169 ; output:
                                   4170 ;	none 
                                   4171 ;--------------------------
      0014F8                       4172 bit_set:
      0093C1 1E 03 5C         [ 4] 4173 	call arg_list 
      0093C4 CC 93            [ 1] 4174 	cp a,#2	 
      0093C6 43 A1            [ 1] 4175 	jreq 1$ 
      0093C8 01 26 0A         [ 2] 4176 	jp syntax_error
      001502                       4177 1$: 
      0093CB A6               [ 2] 4178 	popw x ; mask 
      0093CC 3A               [ 1] 4179 	ld a,xl 
      0093CD 85               [ 2] 4180 	popw x ; addr  
      0093CD CD               [ 1] 4181 	or a,(x)
      0093CE 82               [ 1] 4182 	ld (x),a
      0093CF 44               [ 4] 4183 	ret 
                                   4184 
                                   4185 ;---------------------
                                   4186 ; BASIC: BRES addr,mask
                                   4187 ; reset bits at 'addr' corresponding 
                                   4188 ; to those of 'mask' that are at 1.
                                   4189 ; arguments:
                                   4190 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4191 ;   mask	    ~mask&*addr  
                                   4192 ; output:
                                   4193 ;	none 
                                   4194 ;--------------------------
      0093D0                       4195 bit_reset:
      0093D0 1E 03 CC         [ 4] 4196 	call arg_list 
      0093D3 93 43            [ 1] 4197 	cp a,#2  
      0093D5 27 03            [ 1] 4198 	jreq 1$ 
      0093D5 A1 0A 22         [ 2] 4199 	jp syntax_error
      001512                       4200 1$: 
      0093D8 0E               [ 2] 4201 	popw x ; mask 
      0093D9 A0               [ 1] 4202 	ld a,xl 
      0093DA 06               [ 1] 4203 	cpl a 
      0093DB 90               [ 2] 4204 	popw x ; addr  
      0093DC 5F               [ 1] 4205 	and a,(x)
      0093DD 90               [ 1] 4206 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0093DE 97               [ 4] 4207 	ret 
                                   4208 
                                   4209 ;---------------------
                                   4210 ; BASIC: BTOGL addr,mask
                                   4211 ; toggle bits at 'addr' corresponding 
                                   4212 ; to those of 'mask' that are at 1.
                                   4213 ; arguments:
                                   4214 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4215 ;   mask	    mask^*addr  
                                   4216 ; output:
                                   4217 ;	none 
                                   4218 ;--------------------------
      001519                       4219 bit_toggle:
      0093DF 72 A9 94         [ 4] 4220 	call arg_list 
      0093E2 2B 90            [ 1] 4221 	cp a,#2 
      0093E4 F6 20            [ 1] 4222 	jreq 1$ 
      0093E6 E6 07 95         [ 2] 4223 	jp syntax_error
      0093E7 85               [ 2] 4224 1$: popw x ; mask 
      0093E7 A1               [ 1] 4225 	ld a,xl 
      0093E8 11               [ 2] 4226 	popw x ; addr  
      0093E9 22               [ 1] 4227 	xor a,(x)
      0093EA 0E               [ 1] 4228 	ld (x),a 
      0093EB A0               [ 4] 4229 	ret 
                                   4230 
                                   4231 
                                   4232 ;---------------------
                                   4233 ; BASIC: BTEST(addr,bit)
                                   4234 ; return bit value at 'addr' 
                                   4235 ; bit is in range {0..7}.
                                   4236 ; arguments:
                                   4237 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4238 ;   bit 	    bit position {0..7}  
                                   4239 ; output:
                                   4240 ;	none 
                                   4241 ;--------------------------
      001529                       4242 bit_test:
      0093EC 10 90 5F         [ 4] 4243 	call func_args 
      0093EF 90 97            [ 1] 4244 	cp a,#2
      0093F1 72 A9            [ 1] 4245 	jreq 0$
      0093F3 94 30 90         [ 2] 4246 	jp syntax_error
      001533                       4247 0$:	
      0093F6 F6               [ 2] 4248 	popw x 
      0093F7 20               [ 1] 4249 	ld a,xl 
      0093F8 D4 07            [ 1] 4250 	and a,#7
      0093F9 88               [ 1] 4251 	push a   
      0093F9 A1 22            [ 1] 4252 	ld a,#1 
      0093FB 22 0E            [ 1] 4253 1$: tnz (1,sp)
      0093FD A0 20            [ 1] 4254 	jreq 2$
      0093FF 90               [ 1] 4255 	sll a 
      009400 5F 90            [ 1] 4256 	dec (1,sp)
      009402 97 72            [ 2] 4257 	jra 1$
      001543                       4258 2$: _drop 1 
      009404 A9 94            [ 2]    1     addw sp,#1 
      009406 32               [ 2] 4259 	popw x 
      009407 90               [ 1] 4260 	and a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009408 F6 20            [ 1] 4261 	jreq 3$
      00940A C2 01            [ 1] 4262 	ld a,#1 
      00940B 5F               [ 1] 4263 3$:	clrw x 
      00940B A0               [ 1] 4264 	ld xl,a 
      00940C 31 48            [ 1] 4265 	ld a,#TK_INTGR
      00940E 5F               [ 4] 4266 	ret
                                   4267 
                                   4268 
                                   4269 ;--------------------
                                   4270 ; BASIC: POKE addr,byte
                                   4271 ; put a byte at addr 
                                   4272 ;--------------------
      001550                       4273 poke:
      00940F 97 1C 94         [ 4] 4274 	call arg_list 
      009412 35 FE            [ 1] 4275 	cp a,#2
      009414 CD 82            [ 1] 4276 	jreq 1$
      009416 57 20 B7         [ 2] 4277 	jp syntax_error
      009419                       4278 1$:	
      009419 A6               [ 2] 4279 	popw x  
      00941A 0D               [ 1] 4280     ld a,xl 
      00941B CD               [ 2] 4281 	popw x 
      00941C 82               [ 1] 4282 	ld (x),a 
      00941D 44               [ 4] 4283 	ret 
                                   4284 
                                   4285 ;-----------------------
                                   4286 ; BASIC: PEEK(addr)
                                   4287 ; get the byte at addr 
                                   4288 ; input:
                                   4289 ;	none 
                                   4290 ; output:
                                   4291 ;	X 		value 
                                   4292 ;-----------------------
      00155F                       4293 peek:
      00941E 7B 02 C7         [ 4] 4294 	call func_args
      009421 00 26            [ 1] 4295 	cp a,#1
      009423 7B 01            [ 1] 4296 	jreq 1$
      009425 C7 00 0B         [ 2] 4297 	jp syntax_error
      009428 5B               [ 2] 4298 1$:	popw x 
      009429 05               [ 1] 4299 	ld a,(x)
      00942A 81               [ 1] 4300 	clrw x 
      00942B 40               [ 1] 4301 	ld xl,a 
      00942C 28 29            [ 1] 4302 	ld a,#TK_INTGR
      00942E 2C               [ 4] 4303 	ret 
                                   4304 
                                   4305 ;----------------------------
                                   4306 ; BASIC: XPEEK(page,addr)
                                   4307 ; read extended memory byte
                                   4308 ; page in range {0,1,2}
                                   4309 ;----------------------------
      001570                       4310 xpeek:
      00942F 23 2B 2D         [ 4] 4311 	call func_args 
      009432 2A 2F            [ 1] 4312 	cp a,#2 
      009434 25 94            [ 1] 4313 	jreq 1$
      009436 41 94 43         [ 2] 4314 	jp syntax_error
      00157A                       4315 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009439 94               [ 2] 4316 	popw x  
      00943A 45 94 48         [ 2] 4317 	ldw farptr+1,x 
      00943D 94               [ 2] 4318 	popw x 
      00943E 4A               [ 1] 4319 	ld a,xl 
      00943F 94 4D 3E         [ 1] 4320 	ld farptr,a 
      009442 00               [ 1] 4321 	clrw x
      009443 3D 00 3E 3D      [ 5] 4322 	ldf a,[farptr]
      009447 00               [ 1] 4323 	ld xl,a 
      009448 3C 00            [ 1] 4324 	ld a,#TK_INTGR 
      00944A 3C               [ 4] 4325 	ret 
                                   4326 
                                   4327 ;---------------------------
                                   4328 ; BASIC IF expr : instructions
                                   4329 ; evaluate expr and if true 
                                   4330 ; execute instructions on same line. 
                                   4331 ;----------------------------
      00158C                       4332 if: 
      00944B 3D 00 3C         [ 4] 4333 	call relation 
      00944E 3E 00            [ 1] 4334 	cp a,#TK_INTGR
      009450 27 03            [ 1] 4335 	jreq 1$ 
      009450 4B 00 95         [ 2] 4336 	jp syntax_error
      009452 4F               [ 1] 4337 1$:	clr a 
      009452 0F               [ 2] 4338 	tnzw x 
      009453 01 05            [ 1] 4339 	jrne 9$  
                                   4340 ;skip to next line
      009454 55 00 03 00 01   [ 1] 4341 	mov in,count
      009454 CD               [ 4] 4342 9$:	ret 
                                   4343 
                                   4344 ;------------------------
                                   4345 ; BASIC: FOR var=expr 
                                   4346 ; set variable to expression 
                                   4347 ; leave variable address 
                                   4348 ; on stack and set
                                   4349 ; FLOOP bit in 'flags'
                                   4350 ;-----------------
                           000001  4351 	RETL1=1 ; return address  
                           000003  4352 	FSTEP=3  ; variable increment
                           000005  4353 	LIMIT=5 ; loop limit 
                           000007  4354 	CVAR=7   ; control variable 
                           000009  4355 	INW=9   ;  in.w saved
                           00000B  4356 	BPTR=11 ; baseptr saved
                           00000A  4357 	VSIZE=10  
      0015A0                       4358 for: ; { -- var_addr }
      009455 89               [ 2] 4359 	popw x ; call return address 
      0015A1                       4360 	_vars VSIZE 
      009456 07 A1            [ 2]    1     sub sp,#VSIZE 
      009458 02               [ 2] 4361 	pushw x  ; RETL1 
      009459 25 5A            [ 1] 4362 	ld a,#TK_VAR 
      00945B A1 02 27         [ 4] 4363 	call expect
      00945E 12 A1            [ 2] 4364 	ldw (CVAR,sp),x  ; control variable 
      009460 03 27 13         [ 4] 4365 	call let_var 
      009463 A1 82 27 15      [ 1] 4366 	bset flags,#FLOOP 
                                   4367 ; open space on stack for loop data 
      009467 A1               [ 1] 4368 	clrw x 
      009468 09 27            [ 2] 4369 	ldw (BPTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00946A 18 A1            [ 2] 4370 	ldw (INW,sp),x 
      00946C 0A 27 1B         [ 4] 4371 	call next_token 
      00946F 20 2B            [ 1] 4372 	cp a,#TK_CMD 
      009471 27 03            [ 1] 4373 	jreq 1$
      009471 CD 82 57         [ 2] 4374 	jp syntax_error
      0015C1                       4375 1$:  
      009474 20 DC C9         [ 2] 4376 	cpw x,#to 
      009476 27 03            [ 1] 4377 	jreq to
      009476 9F CD 82         [ 2] 4378 	jp syntax_error 
                                   4379 
                                   4380 ;-----------------------------------
                                   4381 ; BASIC: TO expr 
                                   4382 ; second part of FOR loop initilization
                                   4383 ; leave limit on stack and set 
                                   4384 ; FTO bit in 'flags'
                                   4385 ;-----------------------------------
      0015C9                       4386 to: ; { var_addr -- var_addr limit step }
      009479 44 20 D6 24 03   [ 2] 4387 	btjt flags,#FLOOP,1$
      00947C CC 07 95         [ 2] 4388 	jp syntax_error
      00947C FD 9F CD         [ 4] 4389 1$: call relation  
      00947F 82 44            [ 1] 4390 	cp a,#TK_INTGR 
      009481 20 CF            [ 1] 4391 	jreq 2$ 
      009483 CC 07 95         [ 2] 4392 	jp syntax_error
      009483 A6 FF            [ 2] 4393 2$: ldw (LIMIT,sp),x
                                   4394 ;	ldw x,in.w 
      009485 6B 01 CC         [ 4] 4395 	call next_token
      009488 94 54            [ 1] 4396 	cp a,#TK_NONE  
      00948A 27 0E            [ 1] 4397 	jreq 4$ 
      00948A CD 89            [ 1] 4398 	cp a,#TK_CMD
      00948C 07 A1            [ 1] 4399 	jrne 3$
      00948E 04 27 03         [ 2] 4400 	cpw x,#step 
      009491 CC 88            [ 1] 4401 	jreq step
      0015ED                       4402 3$:	
      0015ED                       4403 	_unget_token   	 
      009493 15 00 02 00 01   [ 1]    1     mov in,in.saved
      009494                       4404 4$:	
      009494 9F A4 0F         [ 2] 4405 	ldw x,#1   ; default step  
      009497 C7 00            [ 2] 4406 	ldw (FSTEP,sp),x 
      009499 26 20            [ 2] 4407 	jra store_loop_addr 
                                   4408 
                                   4409 
                                   4410 ;----------------------------------
                                   4411 ; BASIC: STEP expr 
                                   4412 ; optional third par of FOR loop
                                   4413 ; initialization. 	
                                   4414 ;------------------------------------
      0015F9                       4415 step: ; {var limit -- var limit step}
      00949B B6 04 00 24 03   [ 2] 4416 	btjt flags,#FLOOP,1$
      00949C CC 07 95         [ 2] 4417 	jp syntax_error
      00949C 55 00 03         [ 4] 4418 1$: call relation
      00949F 00 02            [ 1] 4419 	cp a,#TK_INTGR
      0094A1 CD 91            [ 1] 4420 	jreq 2$
      0094A3 54 A1 04         [ 2] 4421 	jp syntax_error
      0094A6 27 08            [ 2] 4422 2$:	ldw (FSTEP,sp),x ; step
                                   4423 ; leave loop back entry point on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4424 ; cstack is 1 call deep from interpreter
      00160D                       4425 store_loop_addr:
      0094A8 55 00 03         [ 2] 4426 	ldw x,basicptr  
      0094AB 00 02            [ 2] 4427 	ldw (BPTR,sp),x 
      0094AD CC 94 B5         [ 2] 4428 	ldw x,in.w 
      0094B0 CD 89            [ 2] 4429 	ldw (INW,sp),x   
      0094B2 AD 20 9D 24      [ 1] 4430 	bres flags,#FLOOP 
      0094B5 72 5C 00 21      [ 1] 4431 	inc loop_depth  
      0094B5 0D               [ 4] 4432 	ret 
                                   4433 
                                   4434 ;--------------------------------
                                   4435 ; BASIC: NEXT var 
                                   4436 ; FOR loop control 
                                   4437 ; increment variable with step 
                                   4438 ; and compare with limit 
                                   4439 ; loop if threshold not crossed.
                                   4440 ; else stack. 
                                   4441 ; and decrement 'loop_depth' 
                                   4442 ;--------------------------------
      001620                       4443 next: ; {var limit step retl1 -- [var limit step ] }
      0094B6 01 26 05 A6      [ 1] 4444 	tnz loop_depth 
      0094BA 0D CD            [ 1] 4445 	jrne 1$ 
      0094BC 82 44 5B         [ 2] 4446 	jp syntax_error 
      001629                       4447 1$: 
      0094BF 01 81            [ 1] 4448 	ld a,#TK_VAR 
      0094C1 CD 0F 85         [ 4] 4449 	call expect
                                   4450 ; check for good variable after NEXT 	 
      0094C1 13 07            [ 2] 4451 	cpw x,(CVAR,sp)
      0094C1 CE 00            [ 1] 4452 	jreq 2$  
      0094C3 05 1F 03         [ 2] 4453 	jp syntax_error ; not the good one 
      001635                       4454 2$: ; increment variable 
      0094C6 C6               [ 2] 4455 	ldw x,(x)  ; get var value 
      0094C7 00 02 6B         [ 2] 4456 	addw x,(FSTEP,sp) ; var+step 
      0094CA 05 C6            [ 2] 4457 	ldw y,(CVAR,sp)
      0094CC 00 04            [ 2] 4458 	ldw (y),x ; save var new value 
                                   4459 ; check sign of STEP  
      0094CE 6B 06            [ 1] 4460 	ld a,#0x80
      0094D0 81 03            [ 1] 4461 	bcp a,(FSTEP,sp)
      0094D1 2A 06            [ 1] 4462 	jrpl 4$
                                   4463 ;negative step 
      0094D1 1E 03            [ 2] 4464 	cpw x,(LIMIT,sp)
      0094D3 CF 00            [ 1] 4465 	jrslt loop_done
      0094D5 05 7B            [ 2] 4466 	jra loop_back 
      001649                       4467 4$: ; positive step
      0094D7 05 C7            [ 2] 4468 	cpw x,(LIMIT,sp)
      0094D9 00 02            [ 1] 4469 	jrsgt loop_done
      00164D                       4470 loop_back:
      0094DB 7B 06            [ 2] 4471 	ldw x,(BPTR,sp)
      0094DD C7 00 04         [ 2] 4472 	ldw basicptr,x 
      0094E0 81 01 00 24 05   [ 2] 4473 	btjf flags,#FRUN,1$ 
      0094E1 E6 02            [ 1] 4474 	ld a,(2,x)
      0094E1 52 07 03         [ 1] 4475 	ld count,a
      0094E3 1E 09            [ 2] 4476 1$:	ldw x,(INW,sp)
      0094E3 0F 05 CD         [ 2] 4477 	ldw in.w,x 
      0094E6 89               [ 4] 4478 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      001662                       4479 loop_done:
                                   4480 	; remove loop data from stack  
      0094E7 07               [ 2] 4481 	popw x
      001663                       4482 	_drop VSIZE 
      0094E8 A1 02            [ 2]    1     addw sp,#VSIZE 
      0094EA 26 08 CD 82      [ 1] 4483 	dec loop_depth 
                                   4484 ;	pushw x 
                                   4485 ;	ret 
      0094EE 57               [ 2] 4486 	jp (x)
                                   4487 
                                   4488 ;----------------------------
                                   4489 ; called by goto/gosub
                                   4490 ; to get target line number 
                                   4491 ;---------------------------
      00166A                       4492 get_target_line:
      0094EF 03 05 CD         [ 4] 4493 	call relation 
      0094F2 89 07            [ 1] 4494 	cp a,#TK_INTGR
      0094F4 A1 05            [ 1] 4495 	jreq 1$
      0094F6 27 03 CC         [ 2] 4496 	jp syntax_error
      0094F9 88 15 1F         [ 4] 4497 1$:	call search_lineno  
      0094FC 06               [ 2] 4498 	tnzw x 
      0094FD 0D 05            [ 1] 4499 	jrne 2$ 
      0094FF 26 06            [ 1] 4500 	ld a,#ERR_NO_LINE 
      009501 CD 93 12         [ 2] 4501 	jp tb_error 
      009504 CD               [ 4] 4502 2$:	ret 
                                   4503 
                                   4504 ;------------------------
                                   4505 ; BASIC: GOTO line# 
                                   4506 ; jump to line# 
                                   4507 ; here cstack is 2 call deep from interpreter 
                                   4508 ;------------------------
      001680                       4509 goto:
      009505 82 44 00 24 06   [ 2] 4510 	btjt flags,#FRUN,0$ 
      009507 A6 06            [ 1] 4511 	ld a,#ERR_RUN_ONLY
      009507 A6 3A CD         [ 2] 4512 	jp tb_error 
      00950A 82               [ 4] 4513 	ret 
      00950B 44 CD 94         [ 4] 4514 0$:	call get_target_line
      00168E                       4515 jp_to_target:
      00950E C1 72 5F         [ 2] 4516 	ldw basicptr,x 
      009511 00 04            [ 1] 4517 	ld a,(2,x)
      009513 CD 8A DE         [ 1] 4518 	ld count,a 
      009516 AE 16 90 3B      [ 1] 4519 	mov in,#3 
      00951A 00               [ 4] 4520 	ret 
                                   4521 
                                   4522 
                                   4523 ;--------------------
                                   4524 ; BASIC: GOSUB line#
                                   4525 ; basic subroutine call
                                   4526 ; actual line# and basicptr 
                                   4527 ; are saved on cstack
                                   4528 ; here cstack is 2 call deep from interpreter 
                                   4529 ;--------------------
                           000003  4530 	RET_ADDR=3
                           000005  4531 	RET_INW=5
                           000004  4532 	VSIZE=4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00169B                       4533 gosub:
      00951B 04 4B 00 72 FB   [ 2] 4534 	btjt flags,#FRUN,0$ 
      009520 01 5C            [ 1] 4535 	ld a,#ERR_RUN_ONLY
      009522 5B 02 72         [ 2] 4536 	jp tb_error 
      009525 5F               [ 4] 4537 	ret 
      009526 00               [ 2] 4538 0$:	popw x 
      0016A7                       4539 	_vars VSIZE  
      009527 02 CD            [ 2]    1     sub sp,#VSIZE 
      009529 8C               [ 2] 4540 	pushw x 
      00952A 93 A1 04         [ 2] 4541 	ldw x,basicptr
      00952D 27 06            [ 2] 4542 	ldw (RET_ADDR,sp),x 
      00952F CD 94 D1         [ 4] 4543 	call get_target_line  
      009532 CC               [ 2] 4544 	pushw x 
      009533 88 15 16         [ 2] 4545 	ldw x,in.w 
      009536 06 90            [ 2] 4546 	ldw (RET_INW+2,sp),x
      009538 FF               [ 2] 4547 	popw x 
      009539 CD 94            [ 2] 4548 	jra jp_to_target
                                   4549 
                                   4550 ;------------------------
                                   4551 ; BASIC: RETURN 
                                   4552 ; exit from a subroutine 
                                   4553 ; 
                                   4554 ;------------------------
      0016BB                       4555 return:
      00953B D1 CD 89 07 A1   [ 2] 4556 	btjt flags,#FRUN,0$ 
      009540 09 27            [ 1] 4557 	ld a,#ERR_RUN_ONLY
      009542 A0 A1 01         [ 2] 4558 	jp tb_error 
      0016C5                       4559 0$:	
      009545 23 03            [ 2] 4560 	ldw x,(RET_ADDR,sp) 
      009547 CC 88 15         [ 2] 4561 	ldw basicptr,x
      00954A E6 02            [ 1] 4562 	ld a,(2,x)
      00954A 5B 07 81         [ 1] 4563 	ld count,a  
      00954D 1E 05            [ 2] 4564 	ldw x,(RET_INW,sp)
      00954D 55 00 04         [ 2] 4565 	ldw in.w,x 
      009550 00               [ 2] 4566 	popw x 
      0016D5                       4567 	_drop VSIZE 
      009551 02 81            [ 2]    1     addw sp,#VSIZE 
      009553 89               [ 2] 4568 	pushw x
      009553 52               [ 4] 4569 	ret  
                                   4570 
                                   4571 
                                   4572 ;----------------------------------
                                   4573 ; BASIC: RUN
                                   4574 ; run BASIC program in RAM
                                   4575 ;----------------------------------- 
      0016D9                       4576 run: 
      009554 04 0F 01 CD 90   [ 2] 4577 	btjf flags,#FRUN,0$  
      009559 17               [ 1] 4578 	clr a 
      00955A A1               [ 4] 4579 	ret
      0016E0                       4580 0$: 
      00955B 02 24 03 CC 88   [ 2] 4581 	btjf flags,#FBREAK,1$
      0016E5                       4582 	_drop 2 
      009560 15 A1            [ 2]    1     addw sp,#2 
      009562 03 25 04         [ 4] 4583 	call rest_context
      0016EA                       4584 	_drop CTXT_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009565 85 9F            [ 2]    1     addw sp,#CTXT_SIZE 
      009567 6B 01 85 9F      [ 1] 4585 	bres flags,#FBREAK 
      00956B 6B 02 85 F6      [ 1] 4586 	bset flags,#FRUN 
      00956F 14 02 18         [ 2] 4587 	jp interpreter 
      009572 01 27 F9         [ 2] 4588 1$:	ldw x,txtbgn
      009575 5B 04 81         [ 2] 4589 	cpw x,txtend 
      009578 2B 05            [ 1] 4590 	jrmi run_it 
      009578 CD 90            [ 1] 4591 	ld a,#ERR_NO_PROG
      00957A 17 A1 02         [ 2] 4592 	jp tb_error
                                   4593 
      001704                       4594 run_it:	 
      00957D 27 03 CC         [ 4] 4595     call ubound 
      001707                       4596 	_drop 2 ; drop return address 
      009580 88 15            [ 2]    1     addw sp,#2 
                                   4597 ; clear data pointer 
      009582 5F               [ 1] 4598 	clrw x 
      009582 85 9F 85         [ 2] 4599 	ldw data_ptr,x 
      009585 FA F7 81 08      [ 1] 4600 	clr data_ofs 
      009588 72 5F 00 09      [ 1] 4601 	clr data_len 
                                   4602 ; initialize BASIC pointer 
      009588 CD 90 17         [ 2] 4603 	ldw x,txtbgn 
      00958B A1 02 27         [ 2] 4604 	ldw basicptr,x 
      00958E 03 CC            [ 1] 4605 	ld a,(2,x)
      009590 88 15 03         [ 1] 4606 	ld count,a
      009592 35 03 00 01      [ 1] 4607 	mov in,#3	
      009592 85 9F 43 85      [ 1] 4608 	bset flags,#FRUN 
      009596 F4 F7 81         [ 2] 4609 	jp interpreter 
                                   4610 
                                   4611 
                                   4612 ;----------------------
                                   4613 ; BASIC: END
                                   4614 ; end running program
                                   4615 ;---------------------- 
      009599                       4616 cmd_end: 
                                   4617 ; clean stack 
      009599 CD 90 17         [ 2] 4618 	ldw x,#STACK_EMPTY
      00959C A1               [ 1] 4619 	ldw sp,x 
      00959D 02 27 03         [ 2] 4620 	jp warm_start
                                   4621 
                                   4622 
                                   4623 ;-----------------------
                                   4624 ; BASIC: TONE expr1,expr2
                                   4625 ; used TIMER2 channel 1
                                   4626 ; to produce a tone 
                                   4627 ; arguments:
                                   4628 ;    expr1   frequency 
                                   4629 ;    expr2   duration msec.
                                   4630 ;---------------------------
      001732                       4631 tone:
      0095A0 CC 88 15         [ 4] 4632 	call arg_list 
      0095A3 85 9F            [ 1] 4633 	cp a,#2 
      0095A5 85 F8            [ 1] 4634 	jreq 1$
      0095A7 F7 81 95         [ 2] 4635 	jp syntax_error 
      0095A9                       4636 1$: 
      0095A9 CD               [ 2] 4637 	popw x ; duration
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0095AA 90 12            [ 2] 4638 	popw y ; frequency 
      00173F                       4639 beep:  
      0095AC A1               [ 2] 4640 	pushw x 
      0095AD 02 27 03         [ 2] 4641 	ldw x,#TIM2_CLK_FREQ
      0095B0 CC               [ 2] 4642 	divw x,y 
                                   4643 ; round to nearest integer 
      0095B1 88 15 7A 12      [ 2] 4644 	cpw y,#TIM2_CLK_FREQ/2
      0095B3 2B 01            [ 1] 4645 	jrmi 2$
      0095B3 85               [ 2] 4646 	incw x 
      00174B                       4647 2$:	 
      0095B4 9F               [ 1] 4648 	ld a,xh 
      0095B5 A4 07 88         [ 1] 4649 	ld TIM2_ARRH,a 
      0095B8 A6               [ 1] 4650 	ld a,xl 
      0095B9 01 0D 01         [ 1] 4651 	ld TIM2_ARRL,a 
                                   4652 ; 50% duty cycle 
      0095BC 27               [ 1] 4653 	ccf 
      0095BD 05               [ 2] 4654 	rrcw x 
      0095BE 48               [ 1] 4655 	ld a,xh 
      0095BF 0A 01 20         [ 1] 4656 	ld TIM2_CCR1H,a 
      0095C2 F7               [ 1] 4657 	ld a,xl
      0095C3 5B 01 85         [ 1] 4658 	ld TIM2_CCR1L,a
      0095C6 F4 27 02 A6      [ 1] 4659 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0095CA 01 5F 97 A6      [ 1] 4660 	bset TIM2_CR1,#TIM2_CR1_CEN
      0095CE 04 81 53 04      [ 1] 4661 	bset TIM2_EGR,#TIM2_EGR_UG
      0095D0 85               [ 2] 4662 	popw x 
      0095D0 CD 90 17         [ 2] 4663 	ldw timer,x 
      0095D3 A1 02 27         [ 2] 4664 3$: ldw x,timer 	
      0095D6 03 CC            [ 1] 4665 	jrne 3$ 
      0095D8 88 15 53 08      [ 1] 4666 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0095DA 72 11 53 00      [ 1] 4667 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0095DA 85               [ 4] 4668 	ret 
                                   4669 
                                   4670 ;-------------------------------
                                   4671 ; BASIC: ADCON 0|1 [,divisor]  
                                   4672 ; disable/enanble ADC 
                                   4673 ;-------------------------------
                           000003  4674 	ONOFF=3 
                           000001  4675 	DIVSOR=1
                           000004  4676 	VSIZE=4 
      00177B                       4677 power_adc:
      0095DB 9F 85 F7         [ 4] 4678 	call arg_list 
      0095DE 81 02            [ 1] 4679 	cp a,#2	
      0095DF 27 0B            [ 1] 4680 	jreq 1$
      0095DF CD 90            [ 1] 4681 	cp a,#1 
      0095E1 12 A1            [ 1] 4682 	jreq 0$ 
      0095E3 01 27 03         [ 2] 4683 	jp syntax_error 
      0095E6 CC 88 15         [ 2] 4684 0$: ldw x,#0
      0095E9 85               [ 2] 4685 	pushw x  ; divisor 
      0095EA F6 5F            [ 2] 4686 1$: ldw x,(ONOFF,sp)
      0095EC 97               [ 2] 4687 	tnzw x 
      0095ED A6 04            [ 1] 4688 	jreq 2$ 
      0095EF 81 01            [ 2] 4689 	ldw x,(DIVSOR,sp) ; divisor 
      0095F0 9F               [ 1] 4690 	ld a,xl
      0095F0 CD 90            [ 1] 4691 	and a,#7
      0095F2 12               [ 1] 4692 	swap a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0095F3 A1 02 27         [ 1] 4693 	ld ADC_CR1,a
      0095F6 03 CC 88 15      [ 1] 4694 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0095FA 72 10 54 01      [ 1] 4695 	bset ADC_CR1,#ADC_CR1_ADON 
      0017A3                       4696 	_usec_dly 7 
      0095FA 85 CF 00         [ 2]    1     ldw x,#(16*7-2)/4
      0095FD 19               [ 2]    2     decw x
      0095FE 85               [ 1]    3     nop 
      0095FF 9F C7            [ 1]    4     jrne .-4
      009601 00 18            [ 2] 4697 	jra 3$
      009603 5F 92 BC 00      [ 1] 4698 2$: bres ADC_CR1,#ADC_CR1_ADON
      009607 18 97 A6 04      [ 1] 4699 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0017B4                       4700 3$:	_drop VSIZE 
      00960B 81 04            [ 2]    1     addw sp,#VSIZE 
      00960C 81               [ 4] 4701 	ret
                                   4702 
                                   4703 ;-----------------------------
                                   4704 ; BASIC: ADCREAD (channel)
                                   4705 ; read adc channel {0..5}
                                   4706 ; output:
                                   4707 ;   A 		TK_INTGR 
                                   4708 ;   X 		value 
                                   4709 ;-----------------------------
      0017B7                       4710 analog_read:
      00960C CD 91 54         [ 4] 4711 	call func_args 
      00960F A1 04            [ 1] 4712 	cp a,#1 
      009611 27 03            [ 1] 4713 	jreq 1$
      009613 CC 88 15         [ 2] 4714 	jp syntax_error
      009616 4F               [ 2] 4715 1$: popw x 
      009617 5D 26 05         [ 2] 4716 	cpw x,#5 
      00961A 55 00            [ 2] 4717 	jrule 2$
      00961C 04 00            [ 1] 4718 	ld a,#ERR_BAD_VALUE
      00961E 02 81 97         [ 2] 4719 	jp tb_error 
      009620 9F               [ 1] 4720 2$: ld a,xl
      009620 85 52 0A         [ 1] 4721 	ld acc8,a 
      009623 89 A6            [ 1] 4722 	ld a,#5
      009625 05 CD 90         [ 1] 4723 	sub a,acc8 
      009628 05 1F 07         [ 1] 4724 	ld ADC_CSR,a
      00962B CD 92 33 72      [ 1] 4725 	bset ADC_CR2,#ADC_CR2_ALIGN
      00962F 14 00 25 5F      [ 1] 4726 	bset ADC_CR1,#ADC_CR1_ADON
      009633 1F 0B 1F 09 CD   [ 2] 4727 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009638 89 07 A1         [ 2] 4728 	ldw x,ADC_DRH
      00963B 80 27            [ 1] 4729 	ld a,#TK_INTGR
      00963D 03               [ 4] 4730 	ret 
                                   4731 
                                   4732 ;-----------------------
                                   4733 ; BASIC: DREAD(pin)
                                   4734 ; Arduino pins 
                                   4735 ; read state of a digital pin 
                                   4736 ; pin# {0..15}
                                   4737 ; output:
                                   4738 ;    A 		TK_INTGR
                                   4739 ;    X      0|1 
                                   4740 ;-------------------------
                           000001  4741 	PINNO=1
                           000001  4742 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0017EB                       4743 digital_read:
      0017EB                       4744 	_vars VSIZE 
      00963E CC 88            [ 2]    1     sub sp,#VSIZE 
      009640 15 0F 92         [ 4] 4745 	call func_args
      009641 A1 01            [ 1] 4746 	cp a,#1
      009641 A3 96            [ 1] 4747 	jreq 1$
      009643 49 27 03         [ 2] 4748 	jp syntax_error
      009646 CC               [ 2] 4749 1$: popw x 
      009647 88 15 0F         [ 2] 4750 	cpw x,#15 
      009649 23 05            [ 2] 4751 	jrule 2$
      009649 72 04            [ 1] 4752 	ld a,#ERR_BAD_VALUE
      00964B 00 25 03         [ 2] 4753 	jp tb_error 
      00964E CC 88 15         [ 4] 4754 2$:	call select_pin 
      009651 CD 91            [ 1] 4755 	ld (PINNO,sp),a
      009653 54 A1            [ 1] 4756 	ld a,(GPIO_IDR,x)
      009655 04 27            [ 1] 4757 	tnz (PINNO,sp)
      009657 03 CC            [ 1] 4758 	jreq 8$
      009659 88               [ 1] 4759 3$: srl a 
      00965A 15 1F            [ 1] 4760 	dec (PINNO,sp)
      00965C 05 CD            [ 1] 4761 	jrne 3$ 
      00965E 89 07            [ 1] 4762 8$: and a,#1 
      009660 A1               [ 1] 4763 	clrw x 
      009661 00               [ 1] 4764 	ld xl,a 
      009662 27 0E            [ 1] 4765 	ld a,#TK_INTGR
      001818                       4766 	_drop VSIZE
      009664 A1 80            [ 2]    1     addw sp,#VSIZE 
      009666 26               [ 4] 4767 	ret
                                   4768 
                                   4769 ;-----------------------
                                   4770 ; BASIC: DWRITE pin,0|1
                                   4771 ; Arduino pins 
                                   4772 ; write to a digital pin 
                                   4773 ; pin# {0..15}
                                   4774 ; output:
                                   4775 ;    A 		TK_INTGR
                                   4776 ;    X      0|1 
                                   4777 ;-------------------------
                           000001  4778 	PINNO=1
                           000002  4779 	PINVAL=2
                           000002  4780 	VSIZE=2
      00181B                       4781 digital_write:
      00181B                       4782 	_vars VSIZE 
      009667 05 A3            [ 2]    1     sub sp,#VSIZE 
      009669 96 79 27         [ 4] 4783 	call arg_list  
      00966C 0C 02            [ 1] 4784 	cp a,#2 
      00966D 27 03            [ 1] 4785 	jreq 1$
      00966D 55 00 03         [ 2] 4786 	jp syntax_error
      009670 00               [ 2] 4787 1$: popw x 
      009671 02               [ 1] 4788 	ld a,xl 
      009672 6B 02            [ 1] 4789 	ld (PINVAL,sp),a
      009672 AE               [ 2] 4790 	popw x 
      009673 00 01 1F         [ 2] 4791 	cpw x,#15 
      009676 03 20            [ 2] 4792 	jrule 2$
      009678 14 0A            [ 1] 4793 	ld a,#ERR_BAD_VALUE
      009679 CC 07 97         [ 2] 4794 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009679 72 04 00         [ 4] 4795 2$:	call select_pin 
      00967C 25 03            [ 1] 4796 	ld (PINNO,sp),a 
      00967E CC 88            [ 1] 4797 	ld a,#1
      009680 15 CD            [ 1] 4798 	tnz (PINNO,sp)
      009682 91 54            [ 1] 4799 	jreq 4$
      009684 A1               [ 1] 4800 3$: sll a
      009685 04 27            [ 1] 4801 	dec (PINNO,sp)
      009687 03 CC            [ 1] 4802 	jrne 3$
      009689 88 15            [ 1] 4803 4$: tnz (PINVAL,sp)
      00968B 1F 03            [ 1] 4804 	jrne 5$
      00968D 43               [ 1] 4805 	cpl a 
      00968D CE 00            [ 1] 4806 	and a,(GPIO_ODR,x)
      00968F 05 1F            [ 2] 4807 	jra 8$
      009691 0B CE            [ 1] 4808 5$: or a,(GPIO_ODR,x)
      009693 00 01            [ 1] 4809 8$: ld (GPIO_ODR,x),a 
      001853                       4810 	_drop VSIZE 
      009695 1F 09            [ 2]    1     addw sp,#VSIZE 
      009697 72               [ 4] 4811 	ret
                                   4812 
                                   4813 
                                   4814 ;-----------------------
                                   4815 ; BASIC: STOP
                                   4816 ; stop progam execution  
                                   4817 ; without resetting pointers 
                                   4818 ; the program is resumed
                                   4819 ; with RUN 
                                   4820 ;-------------------------
      001856                       4821 stop:
      009698 15 00 25 72 5C   [ 2] 4822 	btjt flags,#FRUN,2$
      00969D 00               [ 1] 4823 	clr a
      00969E 22               [ 4] 4824 	ret 
      00185D                       4825 2$:	 
                                   4826 ; create space on cstack to save context 
      00969F 81 18 84         [ 2] 4827 	ldw x,#break_point 
      0096A0 CD 01 D7         [ 4] 4828 	call puts 
      001863                       4829 	_drop 2 ;drop return address 
      0096A0 72 5D            [ 2]    1     addw sp,#2 
      001865                       4830 	_vars CTXT_SIZE ; context size 
      0096A2 00 22            [ 2]    1     sub sp,#CTXT_SIZE 
      0096A4 26 03 CC         [ 4] 4831 	call save_context 
      0096A7 88 15 90         [ 2] 4832 	ldw x,#tib 
      0096A9 CF 00 04         [ 2] 4833 	ldw basicptr,x
      0096A9 A6               [ 1] 4834 	clr (x)
      0096AA 05 CD 90 05      [ 1] 4835 	clr count  
      0096AE 13               [ 1] 4836 	clrw x 
      0096AF 07 27 03         [ 2] 4837 	ldw in.w,x
      0096B2 CC 88 15 24      [ 1] 4838 	bres flags,#FRUN 
      0096B5 72 18 00 24      [ 1] 4839 	bset flags,#FBREAK
      0096B5 FE 72 FB         [ 2] 4840 	jp interpreter 
      0096B8 03 16 07 90 FF A6 80  4841 break_point: .asciz "\nbreak point, RUN to resume.\n"
             15 03 2A 06 13 05 2F
             1B 20 04 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4842 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4843 ;-----------------------
                                   4844 ; BASIC: NEW
                                   4845 ; from command line only 
                                   4846 ; free program memory
                                   4847 ; and clear variables 
                                   4848 ;------------------------
      0096C9                       4849 new: 
      0096C9 13 05 2C 15 01   [ 2] 4850 	btjf flags,#FRUN,0$ 
      0096CD 81               [ 4] 4851 	ret 
      0018A8                       4852 0$:	
      0096CD 1E 0B CF         [ 4] 4853 	call clear_basic 
      0096D0 00               [ 4] 4854 	ret 
                                   4855 	 
                                   4856 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4857 ;  file system routines
                                   4858 ;  MCU flash memory from
                                   4859 ;  0x10000-0x27fff is 
                                   4860 ;  used to store BASIC 
                                   4861 ;  program files. 
                                   4862 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4863 
                                   4864 ;--------------------
                                   4865 ; input:
                                   4866 ;   X     increment 
                                   4867 ; output:
                                   4868 ;   farptr  incremented 
                                   4869 ;---------------------
      0018AC                       4870 incr_farptr:
      0096D1 05 72 01 00      [ 2] 4871 	addw x,farptr+1 
      0096D5 25 05            [ 1] 4872 	jrnc 1$
      0096D7 E6 02 C7 00      [ 1] 4873 	inc farptr 
      0096DB 04 1E 09         [ 2] 4874 1$:	ldw farptr+1,x  
      0096DE CF               [ 4] 4875 	ret 
                                   4876 
                                   4877 ;------------------------------
                                   4878 ; extended flash memory used as FLASH_DRIVE 
                                   4879 ; seek end of used flash drive   
                                   4880 ; starting at 0x10000 address.
                                   4881 ; 4 consecutives 0 bytes signal free space. 
                                   4882 ; input:
                                   4883 ;	none
                                   4884 ; output:
                                   4885 ;   ffree     free_addr| 0 if memory full.
                                   4886 ;------------------------------
      0018BA                       4887 seek_fdrive:
                                   4888 ; start scan at 0x10000 address 
      0096DF 00 01            [ 1] 4889 	ld a,#1
      0096E1 81 00 17         [ 1] 4890 	ld farptr,a 
      0096E2 5F               [ 1] 4891 	clrw x 
      0096E2 85 5B 0A         [ 2] 4892 	ldw farptr+1,x 
      0018C3                       4893 1$:
      0096E5 72 5A 00         [ 2] 4894 	ldw x,#3  
      0096E8 22 FC 00 17      [ 5] 4895 2$:	ldf a,([farptr],x) 
      0096EA 26 05            [ 1] 4896 	jrne 3$
      0096EA CD               [ 2] 4897 	decw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0096EB 91 54            [ 1] 4898 	jrpl 2$
      0096ED A1 04            [ 2] 4899 	jra 4$ 
      0096EF 27               [ 2] 4900 3$:	incw x 
      0096F0 03 CC 88         [ 4] 4901 	call incr_farptr
      0096F3 15 CD 83         [ 2] 4902 	ldw x,#0x27f 
      0096F6 A4 5D 26         [ 2] 4903 	cpw x,farptr
      0096F9 05 A6            [ 1] 4904 	jrpl 1$
                                   4905 ; drive full 
      0096FB 05 CC 88 17      [ 1] 4906 	clr ffree 
      0096FF 81 5F 00 1B      [ 1] 4907 	clr ffree+1 
      009700 72 5F 00 1C      [ 1] 4908 	clr ffree+2 
      009700 72               [ 4] 4909 	ret
      0018EA                       4910 4$: ; copy farptr to ffree	 
      009701 00 00 25         [ 2] 4911 	ldw x,farptr 
      009704 06 A6 06         [ 1] 4912 	ld a,farptr+2 
      009707 CC 88 17         [ 2] 4913 	ldw ffree,x 
      00970A 81 CD 96         [ 1] 4914 	ld ffree+2,a  
      00970D EA               [ 4] 4915 	ret 
                                   4916 
                                   4917 ;-----------------------
                                   4918 ; compare file name 
                                   4919 ; with name pointed by Y  
                                   4920 ; input:
                                   4921 ;   farptr   file name 
                                   4922 ;   Y        target name 
                                   4923 ; output:
                                   4924 ;   farptr 	 at file_name
                                   4925 ;   X 		 farptr[x] point at size field  
                                   4926 ;   Carry    0|1 no match|match  
                                   4927 ;----------------------
      00970E                       4928 cmp_name:
      00970E CF               [ 1] 4929 	clrw x
      00970F 00 05 E6 02      [ 5] 4930 1$:	ldf a,([farptr],x)
      009713 C7 00            [ 1] 4931 	cp a,(y)
      009715 04 35            [ 1] 4932 	jrne 4$
      009717 03               [ 1] 4933 	tnz a 
      009718 00 02            [ 1] 4934 	jreq 9$ 
      00971A 81               [ 2] 4935     incw x 
      00971B 90 5C            [ 2] 4936 	incw y 
      00971B 72 00            [ 2] 4937 	jra 1$
      001908                       4938 4$: ;no match 
      00971D 00               [ 1] 4939 	tnz a 
      00971E 25 06            [ 1] 4940 	jreq 5$
      009720 A6               [ 2] 4941 	incw x 
      009721 06 CC 88 17      [ 5] 4942 	ldf a,([farptr],x)
      009725 81 85            [ 2] 4943 	jra 4$  
      009727 52               [ 2] 4944 5$:	incw x ; farptr[x] point at 'size' field 
      009728 04               [ 1] 4945 	rcf 
      009729 89               [ 4] 4946 	ret
      001915                       4947 9$: ; match  
      00972A CE               [ 2] 4948 	incw x  ; farptr[x] at 'size' field 
      00972B 00               [ 1] 4949 	scf 
      00972C 05               [ 4] 4950 	ret 
                                   4951 
                                   4952 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4953 ; search file in 
                                   4954 ; flash memory 
                                   4955 ; input:
                                   4956 ;   Y       file name  
                                   4957 ; output:
                                   4958 ;   farptr  addr at name|0
                                   4959 ;-----------------------
                           000001  4960 	FSIZE=1
                           000003  4961 	YSAVE=3
                           000004  4962 	VSIZE=4 
      001918                       4963 search_file: 
      001918                       4964 	_vars VSIZE
      00972D 1F 03            [ 2]    1     sub sp,#VSIZE 
      00972F CD 96            [ 2] 4965 	ldw (YSAVE,sp),y  
      009731 EA               [ 1] 4966 	clrw x 
      009732 89 CE 00         [ 2] 4967 	ldw farptr+1,x 
      009735 01 1F 07 85      [ 1] 4968 	mov farptr,#1
      001924                       4969 1$:	
                                   4970 ; check if farptr is after any file 
                                   4971 ; if  0 then so.
      009739 20 D3 00 17      [ 5] 4972 	ldf a,[farptr]
      00973B 27 25            [ 1] 4973 	jreq 6$
      00973B 72               [ 1] 4974 2$: clrw x 	
      00973C 00 00            [ 2] 4975 	ldw y,(YSAVE,sp) 
      00973E 25 05 A6         [ 4] 4976 	call cmp_name
      009741 06 CC            [ 1] 4977 	jrc 9$
      009743 88 17 00 17      [ 5] 4978 	ldf a,([farptr],x)
      009745 6B 01            [ 1] 4979 	ld (FSIZE,sp),a 
      009745 1E               [ 2] 4980 	incw x 
      009746 03 CF 00 05      [ 5] 4981 	ldf a,([farptr],x)
      00974A E6 02            [ 1] 4982 	ld (FSIZE+1,sp),a 
      00974C C7               [ 2] 4983 	incw x 
      00974D 00 04 1E         [ 2] 4984 	addw x,(FSIZE,sp) ; count to skip 
      009750 05               [ 2] 4985 	incw x ; skip over EOF marker 
      009751 CF 00 01         [ 4] 4986 	call incr_farptr ; now at next file 'name_field'
      009754 85 5B 04         [ 2] 4987 	ldw x,#0x280
      009757 89 81 17         [ 2] 4988 	cpw x,farptr 
      009759 2A D5            [ 1] 4989 	jrpl 1$
      00194F                       4990 6$: ; file not found 
      009759 72 01 00 25      [ 1] 4991 	clr farptr
      00975D 02 4F 81 18      [ 1] 4992 	clr farptr+1 
      009760 72 5F 00 19      [ 1] 4993 	clr farptr+2 
      00195B                       4994 	_drop VSIZE 
      009760 72 09            [ 2]    1     addw sp,#VSIZE 
      009762 00               [ 1] 4995 	rcf
      009763 25               [ 4] 4996 	ret
      00195F                       4997 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00195F                       4998 	_drop VSIZE 
      009764 12 5B            [ 2]    1     addw sp,#VSIZE 
      009766 02               [ 1] 4999 	scf 	
      009767 CD               [ 4] 5000 	ret
                                   5001 
                                   5002 
                                   5003 ;--------------------------------
                                   5004 ; BASIC: SAVE "name" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   5005 ; save text program in 
                                   5006 ; flash memory used as 
                                   5007 ;--------------------------------
                           000001  5008 	BSIZE=1
                           000003  5009 	NAMEPTR=3
                           000004  5010 	VSIZE=4
      001963                       5011 save:
      009768 94 D1 5B 04 72   [ 2] 5012 	btjf flags,#FRUN,0$ 
      00976D 19 00            [ 1] 5013 	ld a,#ERR_CMD_ONLY 
      00976F 25 72 10         [ 2] 5014 	jp tb_error
      00196D                       5015 0$:	 
      009772 00 25 CC         [ 2] 5016 	ldw x,txtend 
      009775 88 BB CE 00      [ 2] 5017 	subw x,txtbgn
      009779 1E C3            [ 1] 5018 	jrne 1$
                                   5019 ; nothing to save 
      00977B 00 20            [ 1] 5020 	ld a,#ERR_NO_PROG
      00977D 2B 05 A6         [ 2] 5021 	jp tb_error 	
      00197B                       5022 1$:	
      00197B                       5023 	_vars VSIZE 
      009780 0D CC            [ 2]    1     sub sp,#VSIZE 
      009782 88 17            [ 2] 5024 	ldw (BSIZE,sp),x 
      009784 CD 08 87         [ 4] 5025 	call next_token	
      009784 CD 92            [ 1] 5026 	cp a,#TK_QSTR
      009786 00 5B            [ 1] 5027 	jreq 2$
      009788 02 5F CF         [ 2] 5028 	jp syntax_error
      001989                       5029 2$: 
      00978B 00 07            [ 2] 5030 	ldw (NAMEPTR,sp),x  
      00978D 72 5F 00 09 72   [ 1] 5031 	mov in,count 
                                   5032 ; check if enough free space 
      009792 5F 00 0A         [ 4] 5033 	call strlen 
      009795 CE 00 1E         [ 2] 5034 	addw x,#3 
      009798 CF 00 05         [ 2] 5035 	addw x,(BSIZE,sp)
      00979B E6 02 C7 00      [ 1] 5036 	tnz ffree 
      00979F 04 35            [ 1] 5037 	jrne 21$
      0097A1 03 00 02 72      [ 2] 5038 	subw x,ffree+1 
      0097A5 10 00            [ 2] 5039 	jrule 21$
      0097A7 25 CC            [ 1] 5040 	ld a,#ERR_NO_FSPACE  
      0097A9 88 BB 97         [ 2] 5041 	jp tb_error
      0097AB                       5042 21$: 
                                   5043 ; check for existing file of that name 
      0097AB AE 17            [ 2] 5044 	ldw y,(NAMEPTR,sp)	
      0097AD FF 94 CC         [ 4] 5045 	call search_file 
      0097B0 88 9C            [ 1] 5046 	jrnc 3$ 
      0097B2 A6 08            [ 1] 5047 	ld a,#ERR_DUPLICATE 
      0097B2 CD 90 17         [ 2] 5048 	jp tb_error 
      0019B6                       5049 3$:	;** write file name to flash **
      0097B5 A1 02 27         [ 2] 5050 	ldw x,ffree 
      0097B8 03 CC 88         [ 1] 5051 	ld a,ffree+2 
      0097BB 15 00 17         [ 2] 5052 	ldw farptr,x 
      0097BC C7 00 19         [ 1] 5053 	ld farptr+2,a 
      0097BC 85 90            [ 2] 5054 	ldw x,(NAMEPTR,sp)  
      0097BE 85 02 B6         [ 4] 5055 	call strlen 
      0097BF 5C               [ 2] 5056 	incw  x
      0097BF 89 AE            [ 2] 5057 	ldw (BSIZE,sp),x  
      0097C1 F4               [ 1] 5058 	clrw x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0097C2 24 65            [ 2] 5059 	ldw y,(NAMEPTR,sp)
      0097C4 90 A3 7A         [ 4] 5060 	call write_block  
                                   5061 ;** write file length after name **
      0097C7 12 2B 01         [ 2] 5062 	ldw x,txtend 
      0097CA 5C B0 00 1D      [ 2] 5063 	subw x,txtbgn
      0097CB 1F 01            [ 2] 5064 	ldw (BSIZE,sp),x 
      0097CB 9E               [ 1] 5065 	clrw x 
      0097CC C7 53            [ 1] 5066 	ld a,(BSIZE,sp)
      0097CE 0D 9F C7         [ 4] 5067 	call write_byte 
      0097D1 53               [ 2] 5068 	incw x 
      0097D2 0E 8C            [ 1] 5069 	ld a,(BSIZE+1,sp)
      0097D4 56 9E C7         [ 4] 5070 	call write_byte
      0097D7 53               [ 2] 5071 	incw x  
      0097D8 0F 9F C7         [ 4] 5072 	call incr_farptr ; move farptr after SIZE field 
                                   5073 ;** write BASIC text **
                                   5074 ; copy BSIZE, stack:{... bsize -- ... bsize bsize }	
      0097DB 53 10            [ 2] 5075 	ldw x,(BSIZE,sp)
      0097DD 72               [ 2] 5076 	pushw x ; write_block argument 
      0097DE 10               [ 1] 5077 	clrw x 
      0097DF 53 08 72 10      [ 2] 5078 	ldw y,txtbgn  ; BASIC text to save 
      0097E3 53 00 72         [ 4] 5079 	call write_block 
      0019F4                       5080 	_drop 2 ;  drop write_block argument  
      0097E6 10 53            [ 2]    1     addw sp,#2 
                                   5081 ; write end of file marker 
      0097E8 04 85 CF         [ 2] 5082 	ldw x,#1
      0097EB 00 12            [ 1] 5083 	ld a,#EOF  
      0097ED CE 00 12         [ 4] 5084 	call write_byte 
      0097F0 26 FB 72         [ 4] 5085 	call incr_farptr
                                   5086 ; save farptr in ffree
      0097F3 11 53 08         [ 2] 5087 	ldw x,farptr 
      0097F6 72 11 53         [ 1] 5088 	ld a,farptr+2 
      0097F9 00 81 1A         [ 2] 5089 	ldw ffree,x 
      0097FB C7 00 1C         [ 1] 5090 	ld ffree+2,a
                                   5091 ;write 4 zero bytes as an end of all files marker 
      0097FB CD               [ 1] 5092     clrw x 
      0097FC 90 17            [ 1] 5093 	push #4 
      001A10                       5094 4$:
      0097FE A1               [ 1] 5095 	clr a 
      0097FF 02 27 0B         [ 4] 5096 	call write_byte 
      009802 A1               [ 2] 5097 	incw x 
      009803 01 27            [ 1] 5098 	dec (1,sp)
      009805 03 CC            [ 1] 5099 	jrne 4$
      009807 88               [ 1] 5100 5$: pop a 
                                   5101 ; display saved size  
      009808 15 AE            [ 2] 5102 	ldw x,(BSIZE,sp) 
      00980A 00 00 89         [ 4] 5103 	call print_int 
      001A1F                       5104 	_drop VSIZE 
      00980D 1E 03            [ 2]    1     addw sp,#VSIZE 
      00980F 5D               [ 4] 5105 	ret 
                                   5106 
                                   5107 ;----------------------
                                   5108 ; load file in RAM memory
                                   5109 ; input:
                                   5110 ;    farptr point at file size 
                                   5111 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5112 ;   y point after BASIC program in RAM.
                                   5113 ;------------------------
      001A22                       5114 load_file:
      009810 27 1A 1E         [ 4] 5115 	call incr_farptr  
      009813 01 9F A4         [ 4] 5116 	call clear_basic  
      009816 07               [ 1] 5117 	clrw x
      009817 4E C7 54 01      [ 5] 5118 	ldf a,([farptr],x)
      00981B 72 16            [ 1] 5119 	ld yh,a 
      00981D 50               [ 2] 5120 	incw x  
      00981E CA 72 10 54      [ 5] 5121 	ldf a,([farptr],x)
      009822 01               [ 2] 5122 	incw x 
      009823 AE 00            [ 1] 5123 	ld yl,a 
      009825 1B 5A 9D 26      [ 2] 5124 	addw y,txtbgn
      009829 FA 20 08 72      [ 2] 5125 	ldw txtend,y
      00982D 11 54 01 72      [ 2] 5126 	ldw y,txtbgn
      001A43                       5127 3$:	; load BASIC text 	
      009831 17 50 CA 5B      [ 5] 5128 	ldf a,([farptr],x)
      009835 04 81            [ 1] 5129 	ld (y),a 
      009837 5C               [ 2] 5130 	incw x 
      009837 CD 90            [ 2] 5131 	incw y 
      009839 12 A1 01 27      [ 2] 5132 	cpw y,txtend 
      00983D 03 CC            [ 1] 5133 	jrmi 3$
      00983F 88               [ 4] 5134 	ret 
                                   5135 
                                   5136 ;------------------------
                                   5137 ; BASIC: LOAD "file" 
                                   5138 ; load file to RAM 
                                   5139 ; for execution 
                                   5140 ;------------------------
      001A53                       5141 load:
      009840 15 85 A3 00 05   [ 2] 5142 	btjf flags,#FRUN,0$ 
      009845 23 05            [ 1] 5143 	jreq 0$ 
      009847 A6 0A            [ 1] 5144 	ld a,#ERR_CMD_ONLY 
      009849 CC 88 17         [ 2] 5145 	jp tb_error 
      001A5F                       5146 0$:	
      00984C 9F C7 00         [ 4] 5147 	call next_token 
      00984F 0E A6            [ 1] 5148 	cp a,#TK_QSTR
      009851 05 C0            [ 1] 5149 	jreq 1$
      009853 00 0E C7         [ 2] 5150 	jp syntax_error 
      009856 54 00            [ 1] 5151 1$:	ldw y,x 
      009858 72 16 54         [ 4] 5152 	call search_file 
      00985B 02 72            [ 1] 5153 	jrc 2$ 
      00985D 10 54            [ 1] 5154 	ld a,#ERR_NOT_FILE
      00985F 01 72 0F         [ 2] 5155 	jp tb_error  
      001A75                       5156 2$:
      009862 54 00 FB         [ 4] 5157 	call load_file
                                   5158 ; print loaded size 	 
      009865 CE 54 04         [ 2] 5159 	ldw x,txtend 
      009868 A6 04 81 1D      [ 2] 5160 	subw x,txtbgn
      00986B CD 09 2D         [ 4] 5161 	call print_int 
      00986B 52               [ 4] 5162 	ret 
                                   5163 
                                   5164 ;-----------------------------------
                                   5165 ; BASIC: FORGET ["file_name"] 
                                   5166 ; erase file_name and all others 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5167 ; after it. 
                                   5168 ; without argument erase all files 
                                   5169 ;-----------------------------------
      001A83                       5170 forget:
      00986C 01 CD 90         [ 4] 5171 	call next_token 
      00986F 12 A1            [ 1] 5172 	cp a,#TK_NONE 
      009871 01 27            [ 1] 5173 	jreq 3$ 
      009873 03 CC            [ 1] 5174 	cp a,#TK_QSTR
      009875 88 15            [ 1] 5175 	jreq 1$
      009877 85 A3 00         [ 2] 5176 	jp syntax_error
      00987A 0F 23            [ 1] 5177 1$: ldw y,x 
      00987C 05 A6 0A CC 88   [ 1] 5178 	mov in,count 
      009881 17 CD 9E         [ 4] 5179 	call search_file
      009884 4F 6B            [ 1] 5180 	jrc 2$
      009886 01 E6            [ 1] 5181 	ld a,#ERR_NOT_FILE 
      009888 01 0D 01         [ 2] 5182 	jp tb_error 
      001AA2                       5183 2$: 
      00988B 27 05 44         [ 2] 5184 	ldw x,farptr
      00988E 0A 01 26         [ 1] 5185 	ld a,farptr+2
      009891 FB A4            [ 2] 5186 	jra 4$ 
      001AAA                       5187 3$: ; forget all files 
      009893 01 5F 97         [ 2] 5188 	ldw x,#0x100
      009896 A6               [ 1] 5189 	clr a 
      009897 04 5B 01         [ 2] 5190 	ldw farptr,x 
      00989A 81 00 19         [ 1] 5191 	ld farptr+2,a 
      00989B                       5192 4$:
      00989B 52 02 CD         [ 2] 5193 	ldw ffree,x 
      00989E 90 17 A1         [ 1] 5194 	ld ffree+2,a 
      0098A1 02 27            [ 1] 5195 	push #4
      0098A3 03               [ 1] 5196 	clrw x 
      001ABD                       5197 5$: 
      0098A4 CC               [ 1] 5198 	clr a  
      0098A5 88 15 85         [ 4] 5199 	call write_byte 
      0098A8 9F               [ 2] 5200 	incw x 
      0098A9 6B 02            [ 1] 5201 	dec (1,sp)
      0098AB 85 A3            [ 1] 5202 	jrne 5$	
      0098AD 00               [ 1] 5203 6$: pop a 
      0098AE 0F               [ 4] 5204 	ret 
                                   5205 
                                   5206 ;----------------------
                                   5207 ; BASIC: DIR 
                                   5208 ; list saved files 
                                   5209 ;----------------------
                           000001  5210 	COUNT=1 ; files counter 
                           000002  5211 	VSIZE=2 
      001AC8                       5212 directory:
      001AC8                       5213 	_vars VSIZE 
      0098AF 23 05            [ 2]    1     sub sp,#VSIZE 
      0098B1 A6               [ 1] 5214 	clrw x 
      0098B2 0A CC            [ 2] 5215 	ldw (COUNT,sp),x 
      0098B4 88 17 CD         [ 2] 5216 	ldw farptr+1,x 
      0098B7 9E 4F 6B 01      [ 1] 5217 	mov farptr,#1 
      001AD4                       5218 dir_loop:
      0098BB A6               [ 1] 5219 	clrw x 
      0098BC 01 0D 01 27      [ 5] 5220 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      0098C0 05 48            [ 1] 5221 	jreq 8$ 
      001ADB                       5222 1$: ;name loop 	
      0098C2 0A 01 26 FB      [ 5] 5223 	ldf a,([farptr],x)
      0098C6 0D 02            [ 1] 5224 	jreq 2$ 
      0098C8 26 05 43         [ 4] 5225 	call putc 
      0098CB E4               [ 2] 5226 	incw x 
      0098CC 00 20            [ 2] 5227 	jra 1$
      0098CE 02               [ 2] 5228 2$: incw x ; skip ending 0. 
      0098CF EA 00            [ 1] 5229 	ld a,#SPACE 
      0098D1 E7 00 5B         [ 4] 5230 	call putc 
                                   5231 ; get file size 	
      0098D4 02 81 00 17      [ 5] 5232 	ldf a,([farptr],x)
      0098D6 90 95            [ 1] 5233 	ld yh,a 
      0098D6 72               [ 2] 5234 	incw x 
      0098D7 00 00 25 02      [ 5] 5235 	ldf a,([farptr],x)
      0098DB 4F               [ 2] 5236 	incw x 
      0098DC 81 97            [ 1] 5237 	ld yl,a 
      0098DD 90 89            [ 2] 5238 	pushw y 
      0098DD AE 99 04         [ 2] 5239 	addw x,(1,sp)
      0098E0 CD               [ 2] 5240 	incw x ; skip EOF marker 
                                   5241 ; skip to next file 
      0098E1 82 57 5B         [ 4] 5242 	call incr_farptr 
                                   5243 ; print file size 
      0098E4 02               [ 2] 5244 	popw x ; file size 
      0098E5 52 04 CD         [ 4] 5245 	call print_int 
      0098E8 94 C1            [ 1] 5246 	ld a,#CR 
      0098EA AE 16 90         [ 4] 5247 	call putc
      0098ED CF 00            [ 2] 5248 	ldw x,(COUNT,sp)
      0098EF 05               [ 2] 5249 	incw x
      0098F0 7F 72            [ 2] 5250 	ldw (COUNT,sp),x  
      0098F2 5F 00            [ 2] 5251 	jra dir_loop 
      001B14                       5252 8$: ; print number of files 
      0098F4 04 5F            [ 2] 5253 	ldw x,(COUNT,sp)
      0098F6 CF 00 01         [ 4] 5254 	call print_int 
      0098F9 72 11 00         [ 2] 5255 	ldw x,#file_count 
      0098FC 25 72 18         [ 4] 5256 	call puts  
                                   5257 ; print drive free space 	
      0098FF 00 25            [ 1] 5258 	ld a,#0xff 
      009901 CC 88 BB         [ 1] 5259 	sub a,ffree+2 
      009904 0A 62 72         [ 1] 5260 	ld acc8,a 
      009907 65 61            [ 1] 5261 	ld a,#0x7f 
      009909 6B 20 70         [ 1] 5262 	sbc a,ffree+1 
      00990C 6F 69 6E         [ 1] 5263 	ld acc16,a 
      00990F 74 2C            [ 1] 5264 	ld a,#2 
      009911 20 52 55         [ 1] 5265 	sbc a,ffree 
      009914 4E 20 74         [ 1] 5266 	ld acc24,a 
      009917 6F               [ 1] 5267 	clrw x  
      009918 20 72            [ 1] 5268 	ld a,#6 
      00991A 65               [ 1] 5269 	ld xl,a 
      00991B 73 75            [ 1] 5270 	ld a,#10 
      00991D 6D 65 2E         [ 4] 5271 	call prti24 
      009920 0A 00 51         [ 2] 5272 	ldw x,#drive_free
      009922 CD 01 D7         [ 4] 5273 	call puts 
      001B46                       5274 	_drop VSIZE 
      009922 72 01            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009924 00               [ 4] 5275 	ret
      009925 25 01 81 6C 65 73 0A  5276 file_count: .asciz " files\n"
             00
      009928 20 62 79 74 65 73 20  5277 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5278 
                                   5279 ;---------------------
                                   5280 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5281 ; write 1 or more byte to FLASH or EEPROM
                                   5282 ; starting at address  
                                   5283 ; input:
                                   5284 ;   expr1  	is address 
                                   5285 ;   expr2,...,exprn   are bytes to write
                                   5286 ; output:
                                   5287 ;   none 
                                   5288 ;---------------------
                           000001  5289 	ADDR=1
                           000002  5290 	VSIZ=2 
      001B5E                       5291 write:
      001B5E                       5292 	_vars VSIZE 
      009928 CD 86            [ 2]    1     sub sp,#VSIZE 
      00992A 81 81 00 17      [ 1] 5293 	clr farptr ; expect 16 bits address 
      00992C CD 10 90         [ 4] 5294 	call expression
      00992C 72 BB            [ 1] 5295 	cp a,#TK_INTGR 
      00992E 00 19            [ 1] 5296 	jreq 0$
      009930 24 04 72         [ 2] 5297 	jp syntax_error
      009933 5C 00            [ 2] 5298 0$: ldw (ADDR,sp),x 
      009935 18 CF 00         [ 4] 5299 	call next_token 
      009938 19 81            [ 1] 5300 	cp a,#TK_COMMA 
      00993A 27 02            [ 1] 5301 	jreq 1$ 
      00993A A6 01            [ 2] 5302 	jra 9$ 
      00993C C7 00 18         [ 4] 5303 1$:	call expression
      00993F 5F CF            [ 1] 5304 	cp a,#TK_INTGR
      009941 00 19            [ 1] 5305 	jreq 2$
      009943 CC 07 95         [ 2] 5306 	jp syntax_error
      009943 AE               [ 1] 5307 2$:	ld a,xl 
      009944 00 03            [ 2] 5308 	ldw x,(ADDR,sp) 
      009946 92 AF 00         [ 2] 5309 	ldw farptr+1,x 
      009949 18               [ 1] 5310 	clrw x 
      00994A 26 05 5A         [ 4] 5311 	call write_byte
      00994D 2A F7            [ 2] 5312 	ldw x,(ADDR,sp)
      00994F 20               [ 2] 5313 	incw x 
      009950 19 5C            [ 2] 5314 	jra 0$ 
      001B92                       5315 9$:
      001B92                       5316 	_drop VSIZE
      009952 CD 99            [ 2]    1     addw sp,#VSIZE 
      009954 2C               [ 4] 5317 	ret 
                                   5318 
                                   5319 
                                   5320 ;---------------------
                                   5321 ;BASIC: CHAR(expr)
                                   5322 ; évaluate expression 
                                   5323 ; and take the 7 least 
                                   5324 ; bits as ASCII character
                                   5325 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      001B95                       5326 char:
      009955 AE 02 7F         [ 4] 5327 	call func_args 
      009958 C3 00            [ 1] 5328 	cp a,#1
      00995A 18 2A            [ 1] 5329 	jreq 1$
      00995C E6 72 5F         [ 2] 5330 	jp syntax_error
      00995F 00               [ 2] 5331 1$:	popw x 
      009960 1B               [ 1] 5332 	ld a,xl 
      009961 72 5F            [ 1] 5333 	and a,#0x7f 
      009963 00               [ 1] 5334 	ld xl,a
      009964 1C 72            [ 1] 5335 	ld a,#TK_CHAR
      009966 5F               [ 4] 5336 	ret
                                   5337 
                                   5338 ;---------------------
                                   5339 ; BASIC: ASC(string|char)
                                   5340 ; extract first character 
                                   5341 ; of string argument 
                                   5342 ; return it as TK_INTGR 
                                   5343 ;---------------------
      001BA7                       5344 ascii:
      009967 00 1D            [ 1] 5345 	ld a,#TK_LPAREN
      009969 81 0F 85         [ 4] 5346 	call expect 
      00996A CD 08 87         [ 4] 5347 	call next_token 
      00996A CE 00            [ 1] 5348 	cp a,#TK_QSTR 
      00996C 18 C6            [ 1] 5349 	jreq 1$
      00996E 00 1A            [ 1] 5350 	cp a,#TK_CHAR 
      009970 CF 00            [ 1] 5351 	jreq 2$ 
      009972 1B C7 00         [ 2] 5352 	jp syntax_error
      001BBA                       5353 1$: 
      009975 1D               [ 1] 5354 	ld a,(x) 
      009976 81               [ 1] 5355 	clrw x
      009977 97               [ 1] 5356 	ld xl,a 
      001BBD                       5357 2$: 
      009977 5F               [ 2] 5358 	pushw x 
      009978 92 AF            [ 1] 5359 	ld a,#TK_RPAREN 
      00997A 00 18 90         [ 4] 5360 	call expect
      00997D F1               [ 2] 5361 	popw x 
      00997E 26 08            [ 1] 5362 	ld a,#TK_INTGR 
      009980 4D               [ 4] 5363 	ret 
                                   5364 
                                   5365 ;---------------------
                                   5366 ;BASIC: KEY
                                   5367 ; wait for a character 
                                   5368 ; received from STDIN 
                                   5369 ; input:
                                   5370 ;	none 
                                   5371 ; output:
                                   5372 ;	X 		ASCII character 
                                   5373 ;---------------------
      001BC7                       5374 key:
      009981 27 12 5C         [ 4] 5375 	call getc 
      009984 90               [ 1] 5376 	clrw x 
      009985 5C               [ 1] 5377 	ld xl,a 
      009986 20 F0            [ 1] 5378 	ld a,#TK_INTGR
      009988 81               [ 4] 5379 	ret
                                   5380 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5381 ;----------------------
                                   5382 ; BASIC: QKEY
                                   5383 ; Return true if there 
                                   5384 ; is a character in 
                                   5385 ; waiting in STDIN 
                                   5386 ; input:
                                   5387 ;  none 
                                   5388 ; output:
                                   5389 ;   X 		0|-1 
                                   5390 ;-----------------------
      001BCF                       5391 qkey:: 
      009988 4D               [ 1] 5392 	clrw x 
      009989 27 07 5C 92      [ 1] 5393 	tnz rx_char
      00998D AF 00            [ 1] 5394 	jreq 9$ 
      00998F 18               [ 2] 5395 	cplw x 
      009990 20 F6            [ 1] 5396 9$: ld a,#TK_INTGR
      009992 5C               [ 4] 5397 	ret 
                                   5398 
                                   5399 ;---------------------
                                   5400 ; BASIC: GPIO(expr,reg)
                                   5401 ; return gpio address 
                                   5402 ; expr {0..8}
                                   5403 ; input:
                                   5404 ;   none 
                                   5405 ; output:
                                   5406 ;   X 		gpio register address
                                   5407 ;----------------------------
                           000003  5408 	PORT=3
                           000001  5409 	REG=1 
                           000004  5410 	VSIZE=4 
      001BDA                       5411 gpio:
      009993 98 81 92         [ 4] 5412 	call func_args 
      009995 A1 02            [ 1] 5413 	cp a,#2
      009995 5C 99            [ 1] 5414 	jreq 1$
      009997 81 07 95         [ 2] 5415 	jp syntax_error  
      009998                       5416 1$:	
      009998 52 04            [ 2] 5417 	ldw x,(PORT,sp)
      00999A 17 03            [ 1] 5418 	jrmi bad_port
      00999C 5F CF 00         [ 2] 5419 	cpw x,#9
      00999F 19 35            [ 1] 5420 	jrpl bad_port
      0099A1 01 00            [ 1] 5421 	ld a,#5
      0099A3 18               [ 4] 5422 	mul x,a
      0099A4 1C 50 00         [ 2] 5423 	addw x,#GPIO_BASE 
      0099A4 92 BC            [ 2] 5424 	ldw (PORT,sp),x  
      0099A6 00 18            [ 2] 5425 	ldw x,(REG,sp) 
      0099A8 27 25 5F         [ 2] 5426 	addw x,(PORT,sp)
      0099AB 16 03            [ 1] 5427 	ld a,#TK_INTGR
      001BFC                       5428 	_drop VSIZE 
      0099AD CD 99            [ 2]    1     addw sp,#VSIZE 
      0099AF 77               [ 4] 5429 	ret
      001BFF                       5430 bad_port:
      0099B0 25 2D            [ 1] 5431 	ld a,#ERR_BAD_VALUE
      0099B2 92 AF 00         [ 2] 5432 	jp tb_error
                                   5433 
                                   5434 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5435 ;-------------------------
                                   5436 ; BASIC: UFLASH 
                                   5437 ; return user flash address
                                   5438 ; input:
                                   5439 ;  none 
                                   5440 ; output:
                                   5441 ;	A		TK_INTGR
                                   5442 ;   X 		user address 
                                   5443 ;---------------------------
      001C04                       5444 uflash:
      0099B5 18 6B 01         [ 2] 5445 	ldw x,#user_space 
      0099B8 5C 92            [ 1] 5446 	ld a,#TK_INTGR 
      0099BA AF               [ 4] 5447 	ret 
                                   5448 
                                   5449 
                                   5450 ;---------------------
                                   5451 ; BASIC: USR(addr[,arg])
                                   5452 ; execute a function written 
                                   5453 ; in binary code.
                                   5454 ; binary fonction should 
                                   5455 ; return token attribute in A 
                                   5456 ; and value in X. 
                                   5457 ; input:
                                   5458 ;   addr	routine address 
                                   5459 ;   arg 	is an optional argument 
                                   5460 ; output:
                                   5461 ;   A 		token attribute 
                                   5462 ;   X       returned value 
                                   5463 ;---------------------
      001C0A                       5464 usr:
      0099BB 00 18            [ 2] 5465 	pushw y 	
      0099BD 6B 02 5C         [ 4] 5466 	call func_args 
      0099C0 72 FB            [ 1] 5467 	cp a,#1 
      0099C2 01 5C            [ 1] 5468 	jreq 2$
      0099C4 CD 99            [ 1] 5469 	cp a,#2
      0099C6 2C AE            [ 1] 5470 	jreq 2$  
      0099C8 02 80 C3         [ 2] 5471 	jp syntax_error 
      0099CB 00 18            [ 2] 5472 2$: popw y  ; arg|addr 
      0099CD 2A D5            [ 1] 5473 	cp a,#1
      0099CF 27 02            [ 1] 5474 	jreq 3$
      0099CF 72               [ 2] 5475 	popw x ; addr
      0099D0 5F               [ 1] 5476 	exgw x,y 
      0099D1 00 18            [ 4] 5477 3$: call (y)
      0099D3 72 5F            [ 2] 5478 	popw y 
      0099D5 00               [ 4] 5479 	ret 
                                   5480 
                                   5481 ;------------------------------
                                   5482 ; BASIC: BYE 
                                   5483 ; halt mcu in its lowest power mode 
                                   5484 ; wait for reset or external interrupt
                                   5485 ; do a cold start on wakeup.
                                   5486 ;------------------------------
      001C27                       5487 bye:
      0099D6 19 72 5F 00 1A   [ 2] 5488 	btjf UART1_SR,#UART_SR_TC,.
      0099DB 5B               [10] 5489 	halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      0099DC 04 98 81         [ 2] 5490 	jp cold_start  
                                   5491 
                                   5492 ;----------------------------------
                                   5493 ; BASIC: AUTORUN ["file_name"] 
                                   5494 ; record in eeprom at adrress AUTORUN_NAME
                                   5495 ; the name of file to load and execute
                                   5496 ; at startup. 
                                   5497 ; empty string delete autorun name 
                                   5498 ; no argument display autorun name  
                                   5499 ; input:
                                   5500 ;   file_name   file to execute 
                                   5501 ; output:
                                   5502 ;   none
                                   5503 ;-----------------------------------
      0099DF                       5504 autorun: 
      0099DF 5B 04 99 81 07   [ 2] 5505 	btjf flags,#FRUN,0$ 
      0099E3 27 05            [ 1] 5506 	jreq 0$ 
      0099E3 72 01            [ 1] 5507 	ld a,#ERR_CMD_ONLY 
      0099E5 00 25 05         [ 2] 5508 	jp tb_error 
      001C3C                       5509 0$:	
      0099E8 A6 07 CC         [ 4] 5510 	call next_token
      0099EB 88 17            [ 1] 5511 	jrne 1$
      0099ED AE 40 00         [ 2] 5512 	ldw x,#AUTORUN_NAME
      0099ED CE 00 20         [ 4] 5513 	call puts 
      0099F0 72               [ 1] 5514 	clr a 
      0099F1 B0               [ 4] 5515 	ret 
      001C49                       5516 1$:
      0099F2 00 1E            [ 1] 5517 	cp a,#TK_QSTR
      0099F4 26 05            [ 1] 5518 	jreq 2$
      0099F6 A6 0D CC         [ 2] 5519 	jp syntax_error 
      001C50                       5520 2$:	
      0099F9 88               [ 1] 5521 	tnz (x) 
      0099FA 17 08            [ 1] 5522 	jrne 3$
                                   5523 ; empty string, delete autorun 	
      0099FB CD 05 B4         [ 4] 5524 	call cancel_autorun
      0099FB 52 04 1F 01      [ 1] 5525 	clr count 
      0099FF CD               [ 4] 5526 	ret 
      009A00 89               [ 2] 5527 3$:	pushw x 
      009A01 07 A1            [ 1] 5528 	ldw y,x  
      009A03 02 27 03         [ 4] 5529 	call search_file 
      009A06 CC 88            [ 1] 5530 	jrc 4$ 
      009A08 15 09            [ 1] 5531 	ld a,#ERR_NOT_FILE
      009A09 CC 07 97         [ 2] 5532 	jp tb_error  
      001C68                       5533 4$: 
      009A09 1F 03 55 00 04   [ 1] 5534 	mov in,count 
      009A0E 00 02 CD 83      [ 1] 5535 	clr farptr 
      009A12 36 1C 00         [ 2] 5536 	ldw x,#AUTORUN_NAME
      009A15 03 72 FB         [ 2] 5537 	ldw farptr+1,x 
      009A18 01 72            [ 2] 5538 	ldw x,(1,sp)  
      009A1A 5D 00 1B         [ 4] 5539 	call strlen  ; return length in X 
      009A1D 26               [ 2] 5540 	incw x 
      009A1E 0B 72            [ 2] 5541 	popw y 
      009A20 B0               [ 2] 5542 	pushw x 
      009A21 00               [ 1] 5543 	clrw x 
      009A22 1C 23 05         [ 4] 5544 	call write_block 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001C84                       5545 	_drop 2 
      009A25 A6 0E            [ 2]    1     addw sp,#2 
      009A27 CC               [ 4] 5546 	ret 
                                   5547 
                                   5548 ;----------------------------------
                                   5549 ; BASIC: SLEEP 
                                   5550 ; halt mcu until reset or external
                                   5551 ; interrupt.
                                   5552 ; Resume progam after SLEEP command
                                   5553 ;----------------------------------
      001C87                       5554 sleep:
      009A28 88 17 52 30 FB   [ 2] 5555 	btjf UART1_SR,#UART_SR_TC,.
      009A2A 72 16 00 24      [ 1] 5556 	bset flags,#FSLEEP
      009A2A 16               [10] 5557 	halt 
      009A2B 03               [ 4] 5558 	ret 
                                   5559 
                                   5560 ;-------------------------------
                                   5561 ; BASIC: PAUSE expr 
                                   5562 ; suspend execution for n msec.
                                   5563 ; input:
                                   5564 ;	none
                                   5565 ; output:
                                   5566 ;	none 
                                   5567 ;------------------------------
      001C92                       5568 pause:
      009A2C CD 99 98         [ 4] 5569 	call expression
      009A2F 24 05            [ 1] 5570 	cp a,#TK_INTGR
      009A31 A6 08            [ 1] 5571 	jreq pause02 
      009A33 CC 88 17         [ 2] 5572 	jp syntax_error
      009A36                       5573 pause02: 
      009A36 CE               [ 2] 5574 1$: tnzw x 
      009A37 00 1B            [ 1] 5575 	jreq 2$
      009A39 C6               [10] 5576 	wfi 
      009A3A 00               [ 2] 5577 	decw x 
      009A3B 1D CF            [ 1] 5578 	jrne 1$
      009A3D 00               [ 1] 5579 2$:	clr a 
      009A3E 18               [ 4] 5580 	ret 
                                   5581 
                                   5582 ;------------------------------
                                   5583 ; BASIC: AWU expr
                                   5584 ; halt mcu for 'expr' milliseconds
                                   5585 ; use Auto wakeup peripheral
                                   5586 ; all oscillators stopped except LSI
                                   5587 ; range: 1ms - 511ms
                                   5588 ; input:
                                   5589 ;  none
                                   5590 ; output:
                                   5591 ;  none:
                                   5592 ;------------------------------
      001CA5                       5593 awu:
      009A3F C7 00 1A         [ 4] 5594   call expression
      009A42 1E 03            [ 1] 5595   cp a,#TK_INTGR
      009A44 CD 83            [ 1] 5596   jreq awu02
      009A46 36 5C 1F         [ 2] 5597   jp syntax_error
      001CAF                       5598 awu02:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009A49 01 5F 16         [ 2] 5599   cpw x,#5120
      009A4C 03 CD            [ 1] 5600   jrmi 1$ 
      009A4E 81 E6 CE 00      [ 1] 5601   mov AWU_TBR,#15 
      009A52 20 72            [ 1] 5602   ld a,#30
      009A54 B0               [ 2] 5603   div x,a
      009A55 00 1E            [ 1] 5604   ld a,#16
      009A57 1F               [ 2] 5605   div x,a 
      009A58 01 5F            [ 2] 5606   jra 4$
      001CC0                       5607 1$: 
      009A5A 7B 01 CD         [ 2] 5608   cpw x,#2048
      009A5D 81 71            [ 1] 5609   jrmi 2$ 
      009A5F 5C 7B 02 CD      [ 1] 5610   mov AWU_TBR,#14
      009A63 81 71            [ 1] 5611   ld a,#80
      009A65 5C               [ 2] 5612   div x,a 
      009A66 CD 99            [ 2] 5613   jra 4$   
      001CCE                       5614 2$:
      009A68 2C 1E 01 89      [ 1] 5615   mov AWU_TBR,#7
      001CD2                       5616 3$:  
                                   5617 ; while X > 64  divide by 2 and increment AWU_TBR 
      009A6C 5F 90 CE         [ 2] 5618   cpw x,#64 
      009A6F 00 1E            [ 2] 5619   jrule 4$ 
      009A71 CD 81 E6 5B      [ 1] 5620   inc AWU_TBR 
      009A75 02               [ 2] 5621   srlw x 
      009A76 AE 00            [ 2] 5622   jra 3$ 
      001CDE                       5623 4$:
      009A78 01               [ 1] 5624   ld a, xl
      009A79 A6               [ 1] 5625   dec a 
      009A7A FF CD            [ 1] 5626   jreq 5$
      009A7C 81               [ 1] 5627   dec a 	
      001CE3                       5628 5$: 
      009A7D 71 CD            [ 1] 5629   and a,#0x3e 
      009A7F 99 2C CE         [ 1] 5630   ld AWU_APR,a 
      009A82 00 18 C6 00      [ 1] 5631   bset AWU_CSR,#AWU_CSR_AWUEN
      009A86 1A               [10] 5632   halt 
                                   5633 
      009A87 CF               [ 4] 5634   ret 
                                   5635 
                                   5636 ;------------------------------
                                   5637 ; BASIC: TICKS
                                   5638 ; return msec ticks counter value 
                                   5639 ; input:
                                   5640 ; 	none 
                                   5641 ; output:
                                   5642 ;	X 		TK_INTGR
                                   5643 ;-------------------------------
      001CEE                       5644 get_ticks:
      009A88 00 1B C7         [ 2] 5645 	ldw x,ticks 
      009A8B 00 1D            [ 1] 5646 	ld a,#TK_INTGR
      009A8D 5F               [ 4] 5647 	ret 
                                   5648 
                                   5649 
                                   5650 
                                   5651 ;------------------------------
                                   5652 ; BASIC: ABS(expr)
                                   5653 ; return absolute value of expr.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5654 ; input:
                                   5655 ;   none
                                   5656 ; output:
                                   5657 ;   X     	positive integer
                                   5658 ;-------------------------------
      001CF4                       5659 abs:
      009A8E 4B 04 92         [ 4] 5660 	call func_args 
      009A90 A1 01            [ 1] 5661 	cp a,#1 
      009A90 4F CD            [ 1] 5662 	jreq 0$ 
      009A92 81 71 5C         [ 2] 5663 	jp syntax_error
      001CFE                       5664 0$:  
      009A95 0A               [ 2] 5665     popw x   
      009A96 01               [ 1] 5666 	ld a,xh 
      009A97 26 F7            [ 1] 5667 	bcp a,#0x80 
      009A99 84 1E            [ 1] 5668 	jreq 2$ 
      009A9B 01               [ 2] 5669 	negw x 
      009A9C CD 89            [ 1] 5670 2$: ld a,#TK_INTGR 
      009A9E AD               [ 4] 5671 	ret 
                                   5672 
                                   5673 ;------------------------------
                                   5674 ; BASIC: AND(expr1,expr2)
                                   5675 ; Apply bit AND relation between
                                   5676 ; the 2 arguments, i.e expr1 & expr2 
                                   5677 ; output:
                                   5678 ; 	A 		TK_INTGR
                                   5679 ;   X 		result 
                                   5680 ;------------------------------
      001D08                       5681 bit_and:
      009A9F 5B 04 81         [ 4] 5682 	call func_args 
      009AA2 A1 02            [ 1] 5683 	cp a,#2
      009AA2 CD 99            [ 1] 5684 	jreq 1$
      009AA4 2C CD 86         [ 2] 5685 	jp syntax_error 
      009AA7 81               [ 2] 5686 1$:	popw x 
      009AA8 5F               [ 1] 5687 	ld a,xh 
      009AA9 92 AF            [ 1] 5688 	and a,(1,sp)
      009AAB 00               [ 1] 5689 	ld xh,a 
      009AAC 18               [ 1] 5690 	ld a,xl
      009AAD 90 95            [ 1] 5691 	and a,(2,sp)
      009AAF 5C               [ 1] 5692 	ld xl,a 
      001D1B                       5693 	_drop 2 
      009AB0 92 AF            [ 2]    1     addw sp,#2 
      009AB2 00 18            [ 1] 5694 	ld a,#TK_INTGR
      009AB4 5C               [ 4] 5695 	ret
                                   5696 
                                   5697 ;------------------------------
                                   5698 ; BASIC: OR(expr1,expr2)
                                   5699 ; Apply bit OR relation between
                                   5700 ; the 2 arguments, i.e expr1 | expr2 
                                   5701 ; output:
                                   5702 ; 	A 		TK_INTGR
                                   5703 ;   X 		result 
                                   5704 ;------------------------------
      001D20                       5705 bit_or:
      009AB5 90 97 72         [ 4] 5706 	call func_args 
      009AB8 B9 00            [ 1] 5707 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009ABA 1E 90            [ 1] 5708 	jreq 1$
      009ABC CF 00 20         [ 2] 5709 	jp syntax_error 
      001D2A                       5710 1$: 
      009ABF 90               [ 2] 5711 	popw x 
      009AC0 CE               [ 1] 5712 	ld a,xh 
      009AC1 00 1E            [ 1] 5713 	or a,(1,sp)
      009AC3 95               [ 1] 5714 	ld xh,a 
      009AC3 92               [ 1] 5715 	ld a,xl 
      009AC4 AF 00            [ 1] 5716 	or a,(2,sp)
      009AC6 18               [ 1] 5717 	ld xl,a 
      001D33                       5718 	_drop 2 
      009AC7 90 F7            [ 2]    1     addw sp,#2 
      009AC9 5C 90            [ 1] 5719 	ld a,#TK_INTGR 
      009ACB 5C               [ 4] 5720 	ret
                                   5721 
                                   5722 ;------------------------------
                                   5723 ; BASIC: XOR(expr1,expr2)
                                   5724 ; Apply bit XOR relation between
                                   5725 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5726 ; output:
                                   5727 ; 	A 		TK_INTGR
                                   5728 ;   X 		result 
                                   5729 ;------------------------------
      001D38                       5730 bit_xor:
      009ACC 90 C3 00         [ 4] 5731 	call func_args 
      009ACF 20 2B            [ 1] 5732 	cp a,#2
      009AD1 F1 81            [ 1] 5733 	jreq 1$
      009AD3 CC 07 95         [ 2] 5734 	jp syntax_error 
      001D42                       5735 1$: 
      009AD3 72               [ 2] 5736 	popw x 
      009AD4 01               [ 1] 5737 	ld a,xh 
      009AD5 00 25            [ 1] 5738 	xor a,(1,sp)
      009AD7 07               [ 1] 5739 	ld xh,a 
      009AD8 27               [ 1] 5740 	ld a,xl 
      009AD9 05 A6            [ 1] 5741 	xor a,(2,sp)
      009ADB 07               [ 1] 5742 	ld xl,a 
      001D4B                       5743 	_drop 2 
      009ADC CC 88            [ 2]    1     addw sp,#2 
      009ADE 17 04            [ 1] 5744 	ld a,#TK_INTGR 
      009ADF 81               [ 4] 5745 	ret 
                                   5746 
                                   5747 ;------------------------------
                                   5748 ; BASIC: LSHIFT(expr1,expr2)
                                   5749 ; logical shift left expr1 by 
                                   5750 ; expr2 bits 
                                   5751 ; output:
                                   5752 ; 	A 		TK_INTGR
                                   5753 ;   X 		result 
                                   5754 ;------------------------------
      001D50                       5755 lshift:
      009ADF CD 89 07         [ 4] 5756 	call func_args
      009AE2 A1 02            [ 1] 5757 	cp a,#2 
      009AE4 27 03            [ 1] 5758 	jreq 1$
      009AE6 CC 88 15         [ 2] 5759 	jp syntax_error
      009AE9 90 93            [ 2] 5760 1$: popw y   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009AEB CD               [ 2] 5761 	popw x 
      009AEC 99 98            [ 2] 5762 	tnzw y 
      009AEE 25 05            [ 1] 5763 	jreq 4$
      009AF0 A6               [ 2] 5764 2$:	sllw x 
      009AF1 09 CC            [ 2] 5765 	decw y 
      009AF3 88 17            [ 1] 5766 	jrne 2$
      009AF5                       5767 4$:  
      009AF5 CD 9A            [ 1] 5768 	ld a,#TK_INTGR
      009AF7 A2               [ 4] 5769 	ret
                                   5770 
                                   5771 ;------------------------------
                                   5772 ; BASIC: RSHIFT(expr1,expr2)
                                   5773 ; logical shift right expr1 by 
                                   5774 ; expr2 bits.
                                   5775 ; output:
                                   5776 ; 	A 		TK_INTGR
                                   5777 ;   X 		result 
                                   5778 ;------------------------------
      001D69                       5779 rshift:
      009AF8 CE 00 20         [ 4] 5780 	call func_args
      009AFB 72 B0            [ 1] 5781 	cp a,#2 
      009AFD 00 1E            [ 1] 5782 	jreq 1$
      009AFF CD 89 AD         [ 2] 5783 	jp syntax_error
      009B02 81 85            [ 2] 5784 1$: popw y  
      009B03 85               [ 2] 5785 	popw x
      009B03 CD 89            [ 2] 5786 	tnzw y 
      009B05 07 A1            [ 1] 5787 	jreq 4$
      009B07 00               [ 2] 5788 2$:	srlw x 
      009B08 27 20            [ 2] 5789 	decw y 
      009B0A A1 02            [ 1] 5790 	jrne 2$
      001D7F                       5791 4$:  
      009B0C 27 03            [ 1] 5792 	ld a,#TK_INTGR
      009B0E CC               [ 4] 5793 	ret
                                   5794 
                                   5795 ;--------------------------
                                   5796 ; BASIC: FCPU integer
                                   5797 ; set CPU frequency 
                                   5798 ;-------------------------- 
                                   5799 
      001D82                       5800 fcpu:
      009B0F 88 15            [ 1] 5801 	ld a,#TK_INTGR
      009B11 90 93 55         [ 4] 5802 	call expect 
      009B14 00               [ 1] 5803 	ld a,xl 
      009B15 04 00            [ 1] 5804 	and a,#7 
      009B17 02 CD 99         [ 1] 5805 	ld CLK_CKDIVR,a 
      009B1A 98               [ 4] 5806 	ret 
                                   5807 
                                   5808 ;------------------------------
                                   5809 ; BASIC: PMODE pin#, mode 
                                   5810 ; Arduino pin. 
                                   5811 ; define pin as input or output
                                   5812 ; pin#: {0..15}
                                   5813 ; mode: INPUT|OUTPUT  
                                   5814 ;------------------------------
                           000001  5815 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           000001  5816 	VSIZE=1
      001D8E                       5817 pin_mode:
      001D8E                       5818 	_vars VSIZE 
      009B1B 25 05            [ 2]    1     sub sp,#VSIZE 
      009B1D A6 09 CC         [ 4] 5819 	call arg_list 
      009B20 88 17            [ 1] 5820 	cp a,#2 
      009B22 27 03            [ 1] 5821 	jreq 1$
      009B22 CE 00 18         [ 2] 5822 	jp syntax_error 
      009B25 C6 00            [ 2] 5823 1$: popw y ; mode 
      009B27 1A               [ 2] 5824 	popw x ; Dx pin 
      009B28 20 0A CF         [ 4] 5825 	call select_pin 
      009B2A 6B 01            [ 1] 5826 	ld (PINNO,sp),a  
      009B2A AE 01            [ 1] 5827 	ld a,#1 
      009B2C 00 4F            [ 1] 5828 	tnz (PINNO,sp)
      009B2E CF 00            [ 1] 5829 	jreq 4$
      009B30 18               [ 1] 5830 2$:	sll a 
      009B31 C7 00            [ 1] 5831 	dec (PINNO,sp)
      009B33 1A FB            [ 1] 5832 	jrne 2$ 
      009B34 6B 01            [ 1] 5833 	ld (PINNO,sp),a
      009B34 CF 00            [ 1] 5834 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009B36 1B C7            [ 1] 5835 	ld (GPIO_CR1,x),a 
      009B38 00 1D 4B 04      [ 2] 5836 4$:	cpw y,#OUTP 
      009B3C 5F 07            [ 1] 5837 	jreq 6$
                                   5838 ; input mode
      009B3D 7B 01            [ 1] 5839 	ld a,(PINNO,sp)
      009B3D 4F               [ 1] 5840 	cpl a 
      009B3E CD 81            [ 1] 5841 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009B40 71 5C            [ 2] 5842 	jra 9$
      001DC0                       5843 6$: ;output mode  
      009B42 0A 01            [ 1] 5844 	ld a,(PINNO,sp)
      009B44 26 F7            [ 1] 5845 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009B46 84 81            [ 1] 5846 	ld (GPIO_CR2,x),a 
      009B48 7B 01            [ 1] 5847 	ld a,(PINNO,sp)
      009B48 52 02            [ 1] 5848 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009B4A 5F 1F            [ 1] 5849 9$:	ld (GPIO_DDR,x),a 
      001DCC                       5850 	_drop VSIZE 
      009B4C 01 CF            [ 2]    1     addw sp,#VSIZE 
      009B4E 00               [ 4] 5851 	ret
                                   5852 
                                   5853 ;------------------------
                                   5854 ; select Arduino pin 
                                   5855 ; input:
                                   5856 ;   X 	 {0..15} Arduino Dx 
                                   5857 ; output:
                                   5858 ;   A     stm8s208 pin 
                                   5859 ;   X     base address s208 GPIO port 
                                   5860 ;---------------------------
      001DCF                       5861 select_pin:
      009B4F 19               [ 2] 5862 	sllw x 
      009B50 35 01 00         [ 2] 5863 	addw x,#arduino_to_8s208 
      009B53 18               [ 2] 5864 	ldw x,(x)
      009B54 9F               [ 1] 5865 	ld a,xl 
      009B54 5F               [ 1] 5866 	push a 
      009B55 92               [ 1] 5867 	swapw x 
      009B56 AF 00            [ 1] 5868 	ld a,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009B58 18               [ 4] 5869 	mul x,a 
      009B59 27 39 00         [ 2] 5870 	addw x,#GPIO_BASE 
      009B5B 84               [ 1] 5871 	pop a 
      009B5B 92               [ 4] 5872 	ret 
                                   5873 ; translation from Arduino D0..D15 to stm8s208rb 
      001DDF                       5874 arduino_to_8s208:
      009B5C AF 00                 5875 .byte 3,6 ; D0 
      009B5E 18 27                 5876 .byte 3,5 ; D1 
      009B60 06 CD                 5877 .byte 4,0 ; D2 
      009B62 82 44                 5878 .byte 2,1 ; D3
      009B64 5C 20                 5879 .byte 6,0 ; D4
      009B66 F4 5C                 5880 .byte 2,2 ; D5
      009B68 A6 20                 5881 .byte 2,3 ; D6
      009B6A CD 82                 5882 .byte 3,1 ; D7
      009B6C 44 92                 5883 .byte 3,3 ; D8
      009B6E AF 00                 5884 .byte 2,4 ; D9
      009B70 18 90                 5885 .byte 4,5 ; D10
      009B72 95 5C                 5886 .byte 2,6 ; D11
      009B74 92 AF                 5887 .byte 2,7 ; D12
      009B76 00 18                 5888 .byte 2,5 ; D13
      009B78 5C 90                 5889 .byte 4,2 ; D14
      009B7A 97 90                 5890 .byte 4,1 ; D15
                                   5891 
                                   5892 
                                   5893 ;------------------------------
                                   5894 ; BASIC: RND(expr)
                                   5895 ; return random number 
                                   5896 ; between 1 and expr inclusive
                                   5897 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5898 ; input:
                                   5899 ; 	none 
                                   5900 ; output:
                                   5901 ;	X 		random positive integer 
                                   5902 ;------------------------------
      001DFF                       5903 random:
      009B7C 89 72 FB         [ 4] 5904 	call func_args 
      009B7F 01 5C            [ 1] 5905 	cp a,#1
      009B81 CD 99            [ 1] 5906 	jreq 1$
      009B83 2C 85 CD         [ 2] 5907 	jp syntax_error
      001E09                       5908 1$:  
      009B86 89 AD            [ 1] 5909 	ld a,#0x80 
      009B88 A6 0D            [ 1] 5910 	bcp a,(1,sp)
      009B8A CD 82            [ 1] 5911 	jreq 2$
      009B8C 44 1E            [ 1] 5912 	ld a,#ERR_BAD_VALUE
      009B8E 01 5C 1F         [ 2] 5913 	jp tb_error
      001E14                       5914 2$: 
                                   5915 ; acc16=(x<<5)^x 
      009B91 01 20 C0         [ 2] 5916 	ldw x,seedx 
      009B94 58               [ 2] 5917 	sllw x 
      009B94 1E               [ 2] 5918 	sllw x 
      009B95 01               [ 2] 5919 	sllw x 
      009B96 CD               [ 2] 5920 	sllw x 
      009B97 89               [ 2] 5921 	sllw x 
      009B98 AD               [ 1] 5922 	ld a,xh 
      009B99 AE 9B C9         [ 1] 5923 	xor a,seedx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009B9C CD 82 57         [ 1] 5924 	ld acc16,a 
      009B9F A6               [ 1] 5925 	ld a,xl 
      009BA0 FF C0 00         [ 1] 5926 	xor a,seedx+1 
      009BA3 1D C7 00         [ 1] 5927 	ld acc8,a 
                                   5928 ; seedx=seedy 
      009BA6 0E A6 7F         [ 2] 5929 	ldw x,seedy 
      009BA9 C2 00 1C         [ 2] 5930 	ldw seedx,x  
                                   5931 ; seedy=seedy^(seedy>>1)
      009BAC C7 00            [ 2] 5932 	srlw y 
      009BAE 0D A6            [ 1] 5933 	ld a,yh 
      009BB0 02 C2 00         [ 1] 5934 	xor a,seedy 
      009BB3 1B C7 00         [ 1] 5935 	ld seedy,a  
      009BB6 0C 5F            [ 1] 5936 	ld a,yl 
      009BB8 A6 06 97         [ 1] 5937 	xor a,seedy+1 
      009BBB A6 0A CD         [ 1] 5938 	ld seedy+1,a 
                                   5939 ; acc16>>3 
      009BBE 89 65 AE         [ 2] 5940 	ldw x,acc16 
      009BC1 9B               [ 2] 5941 	srlw x 
      009BC2 D1               [ 2] 5942 	srlw x 
      009BC3 CD               [ 2] 5943 	srlw x 
                                   5944 ; x=acc16^x 
      009BC4 82               [ 1] 5945 	ld a,xh 
      009BC5 57 5B 02         [ 1] 5946 	xor a,acc16 
      009BC8 81               [ 1] 5947 	ld xh,a 
      009BC9 20               [ 1] 5948 	ld a,xl 
      009BCA 66 69 6C         [ 1] 5949 	xor a,acc8 
      009BCD 65               [ 1] 5950 	ld xl,a 
                                   5951 ; seedy=x^seedy 
      009BCE 73 0A 00         [ 1] 5952 	xor a,seedy+1
      009BD1 20               [ 1] 5953 	ld xl,a 
      009BD2 62               [ 1] 5954 	ld a,xh 
      009BD3 79 74 65         [ 1] 5955 	xor a,seedy
      009BD6 73               [ 1] 5956 	ld xh,a 
      009BD7 20 66 72         [ 2] 5957 	ldw seedy,x 
                                   5958 ; return seedy modulo expr + 1 
      009BDA 65 65            [ 2] 5959 	popw y 
      009BDC 0A               [ 2] 5960 	divw x,y 
      009BDD 00               [ 1] 5961 	ldw x,y 
      009BDE 5C               [ 2] 5962 	incw x 
      001E63                       5963 10$:
      009BDE 52 02            [ 1] 5964 	ld a,#TK_INTGR
      009BE0 72               [ 4] 5965 	ret 
                                   5966 
                                   5967 ;---------------------------------
                                   5968 ; BASIC: WORDS 
                                   5969 ; affiche la listes des mots du
                                   5970 ; dictionnaire ainsi que le nombre
                                   5971 ; de mots.
                                   5972 ;---------------------------------
                           000001  5973 	WLEN=1 ; word length
                           000002  5974 	LLEN=2 ; character sent to console
                           000003  5975 	WCNT=3 ; count words printed 
                           000003  5976 	VSIZE=3 
      001E66                       5977 words:
      001E66                       5978 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009BE1 5F 00            [ 2]    1     sub sp,#VSIZE 
      009BE3 18 CD            [ 1] 5979 	clr (LLEN,sp)
      009BE5 91 10            [ 1] 5980 	clr (WCNT,sp)
      009BE7 A1 04 27 03      [ 2] 5981 	ldw y,#kword_dict+2
      009BEB CC               [ 1] 5982 0$:	ldw x,y
      009BEC 88               [ 1] 5983 	ld a,(x)
      009BED 15 1F            [ 1] 5984 	and a,#15 
      009BEF 01 CD            [ 1] 5985 	ld (WLEN,sp),a 
      009BF1 89 07            [ 1] 5986 	inc (WCNT,sp)
      009BF3 A1               [ 2] 5987 1$:	incw x 
      009BF4 09               [ 1] 5988 	ld a,(x)
      009BF5 27 02 20         [ 4] 5989 	call putc 
      009BF8 19 CD            [ 1] 5990 	inc (LLEN,sp)
      009BFA 91 10            [ 1] 5991 	dec (WLEN,sp)
      009BFC A1 04            [ 1] 5992 	jrne 1$
      009BFE 27 03            [ 1] 5993 	ld a,#70
      009C00 CC 88            [ 1] 5994 	cp a,(LLEN,sp)
      009C02 15 9F            [ 1] 5995 	jrmi 2$   
      009C04 1E 01            [ 1] 5996 	ld a,#SPACE 
      009C06 CF 00 19         [ 4] 5997 	call putc 
      009C09 5F CD            [ 1] 5998 	inc (LLEN,sp) 
      009C0B 81 71            [ 2] 5999 	jra 3$
      009C0D 1E 01            [ 1] 6000 2$: ld a,#CR 
      009C0F 5C 20 DC         [ 4] 6001 	call putc 
      009C12 0F 02            [ 1] 6002 	clr (LLEN,sp)
      009C12 5B 02 81 02      [ 2] 6003 3$:	subw y,#2 
      009C15 90 FE            [ 2] 6004 	ldw y,(y)
      009C15 CD 90            [ 1] 6005 	jrne 0$ 
      009C17 12 A1            [ 1] 6006 	ld a,#CR 
      009C19 01 27 03         [ 4] 6007 	call putc  
      009C1C CC               [ 1] 6008 	clrw x 
      009C1D 88 15            [ 1] 6009 	ld a,(WCNT,sp)
      009C1F 85               [ 1] 6010 	ld xl,a 
      009C20 9F A4 7F         [ 4] 6011 	call print_int 
      009C23 97 A6 03         [ 2] 6012 	ldw x,#words_count_msg
      009C26 81 01 D7         [ 4] 6013 	call puts 
      009C27                       6014 	_drop VSIZE 
      009C27 A6 07            [ 2]    1     addw sp,#VSIZE 
      009C29 CD               [ 4] 6015 	ret 
      009C2A 90 05 CD 89 07 A1 02  6016 words_count_msg: .asciz " words in dictionary\n"
             27 07 A1 03 27 06 CC
             88 15 6E 61 72 79 0A
             00
                                   6017 
                                   6018 
                                   6019 ;-----------------------------
                                   6020 ; BASIC: TIMER expr 
                                   6021 ; initialize count down timer 
                                   6022 ;-----------------------------
      009C3A                       6023 set_timer:
      009C3A F6 5F 97         [ 4] 6024 	call arg_list
      009C3D A1 01            [ 1] 6025 	cp a,#1 
      009C3D 89 A6            [ 1] 6026 	jreq 1$
      009C3F 08 CD 90         [ 2] 6027 	jp syntax_error
      001ED6                       6028 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009C42 05               [ 2] 6029 	popw x 
      009C43 85 A6 04         [ 2] 6030 	ldw timer,x 
      009C46 81               [ 4] 6031 	ret 
                                   6032 
                                   6033 ;------------------------------
                                   6034 ; BASIC: TIMEOUT 
                                   6035 ; return state of timer 
                                   6036 ;------------------------------
      009C47                       6037 timeout:
      009C47 CD 82 4D         [ 2] 6038 	ldw x,timer 
      001EDE                       6039 logical_complement:
      009C4A 5F               [ 2] 6040 	cplw x 
      009C4B 97 A6 04         [ 2] 6041 	cpw x,#-1
      009C4E 81 01            [ 1] 6042 	jreq 2$
      009C4F 5F               [ 1] 6043 	clrw x 
      009C4F 5F 72            [ 1] 6044 2$:	ld a,#TK_INTGR
      009C51 5D               [ 4] 6045 	ret 
                                   6046 
                                   6047 ;--------------------------------
                                   6048 ; BASIC NOT(expr) 
                                   6049 ; return logical complement of expr
                                   6050 ;--------------------------------
      001EE8                       6051 func_not:
      009C52 00 27 27         [ 4] 6052 	call func_args  
      009C55 01 53            [ 1] 6053 	cp a,#1
      009C57 A6 04            [ 1] 6054 	jreq 1$
      009C59 81 07 95         [ 2] 6055 	jp syntax_error
      009C5A 85               [ 2] 6056 1$:	popw x 
      009C5A CD 90            [ 2] 6057 	jra logical_complement
                                   6058 
                                   6059 
                                   6060 
                                   6061 ;-----------------------------------
                                   6062 ; BASIC: IWDGEN expr1 
                                   6063 ; enable independant watchdog timer
                                   6064 ; expr1 is delay in multiple of 62.5µsec
                                   6065 ; expr1 -> {1..16383}
                                   6066 ;-----------------------------------
      001EF5                       6067 enable_iwdg:
      009C5C 12 A1 02         [ 4] 6068 	call arg_list
      009C5F 27 03            [ 1] 6069 	cp a,#1 
      009C61 CC 88            [ 1] 6070 	jreq 1$
      009C63 15 07 95         [ 2] 6071 	jp syntax_error 
      009C64 85               [ 2] 6072 1$: popw x 
      009C64 1E 03            [ 1] 6073 	push #0
      009C66 2B 17 A3 00      [ 1] 6074 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009C6A 09               [ 1] 6075 	ld a,xh 
      009C6B 2A 12            [ 1] 6076 	and a,#0x3f
      009C6D A6               [ 1] 6077 	ld xh,a  
      009C6E 05 42 1C         [ 2] 6078 2$:	cpw x,#255
      009C71 50 00            [ 2] 6079 	jrule 3$
      009C73 1F 03            [ 1] 6080 	inc (1,sp)
      009C75 1E               [ 1] 6081 	rcf 
      009C76 01               [ 2] 6082 	rrcw x 
      009C77 72 FB            [ 2] 6083 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009C79 03 A6 04 5B      [ 1] 6084 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C7D 04               [ 1] 6085 	pop a  
      009C7E 81 50 E1         [ 1] 6086 	ld IWDG_PR,a 
      009C7F 9F               [ 1] 6087 	ld a,xl
      009C7F A6               [ 1] 6088 	dec a 
      009C80 0A CC 88 17      [ 1] 6089 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C84 C7 50 E2         [ 1] 6090 	ld IWDG_RLR,a 
      009C84 AE A6 80 A6      [ 1] 6091 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009C88 04               [ 4] 6092 	ret 
                                   6093 
                                   6094 
                                   6095 ;-----------------------------------
                                   6096 ; BASIC: IWDGREF  
                                   6097 ; refresh independant watchdog count down 
                                   6098 ; timer before it reset MCU. 
                                   6099 ;-----------------------------------
      001F2B                       6100 refresh_iwdg:
      009C89 81 AA 50 E0      [ 1] 6101 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009C8A 81               [ 4] 6102 	ret 
                                   6103 
                                   6104 
                                   6105 ;-------------------------------------
                                   6106 ; BASIC: LOG(expr)
                                   6107 ; return logarithm base 2 of expr 
                                   6108 ; this is the position of most significant
                                   6109 ; bit set. 
                                   6110 ; input: 
                                   6111 ; output:
                                   6112 ;   X     log2 
                                   6113 ;   A     TK_INTGR 
                                   6114 ;*********************************
      001F30                       6115 log2:
      009C8A 90 89 CD         [ 4] 6116 	call func_args 
      009C8D 90 12            [ 1] 6117 	cp a,#1 
      009C8F A1 01            [ 1] 6118 	jreq 1$
      009C91 27 07 A1         [ 2] 6119 	jp syntax_error 
      009C94 02               [ 2] 6120 1$: popw x 
      001F3B                       6121 leading_one:
      009C95 27               [ 2] 6122 	tnzw x 
      009C96 03 CC            [ 1] 6123 	jreq 4$
      009C98 88 15            [ 1] 6124 	ld a,#15 
      009C9A 90               [ 2] 6125 2$: rlcw x 
      009C9B 85 A1            [ 1] 6126     jrc 3$
      009C9D 01               [ 1] 6127 	dec a 
      009C9E 27 02            [ 2] 6128 	jra 2$
      009CA0 85               [ 1] 6129 3$: clrw x 
      009CA1 51               [ 1] 6130     ld xl,a
      009CA2 90 FD            [ 1] 6131 4$:	ld a,#TK_INTGR
      009CA4 90               [ 4] 6132 	ret 
                                   6133 
                                   6134 ;-----------------------------------
                                   6135 ; BASIC: BIT(expr) 
                                   6136 ; expr ->{0..15}
                                   6137 ; return 2^expr 
                                   6138 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   6139 ;    x    2^expr 
                                   6140 ;-----------------------------------
      001F4B                       6141 bitmask:
      009CA5 85 81 92         [ 4] 6142     call func_args 
      009CA7 A1 01            [ 1] 6143 	cp a,#1
      009CA7 72 0D            [ 1] 6144 	jreq 1$
      009CA9 52 30 FB         [ 2] 6145 	jp syntax_error 
      009CAC 8E               [ 2] 6146 1$: popw x 
      009CAD CC               [ 1] 6147 	ld a,xl 
      009CAE 85 6F            [ 1] 6148 	and a,#15
      009CB0 5F               [ 1] 6149 	clrw x 
      009CB0 72               [ 2] 6150 	incw x 
      009CB1 01               [ 1] 6151 2$: tnz a 
      009CB2 00 25            [ 1] 6152 	jreq 3$
      009CB4 07               [ 2] 6153 	slaw x 
      009CB5 27               [ 1] 6154 	dec a 
      009CB6 05 A6            [ 2] 6155 	jra 2$ 
      009CB8 07 CC            [ 1] 6156 3$: ld a,#TK_INTGR
      009CBA 88               [ 4] 6157 	ret 
                                   6158 
                                   6159 ;------------------------------
                                   6160 ; BASIC: INVERT(expr)
                                   6161 ; 1's complement 
                                   6162 ;--------------------------------
      001F65                       6163 invert:
      009CBB 17 0F 92         [ 4] 6164 	call func_args
      009CBC A1 01            [ 1] 6165 	cp a,#1 
      009CBC CD 89            [ 1] 6166 	jreq 1$
      009CBE 07 26 08         [ 2] 6167 	jp syntax_error
      009CC1 AE               [ 2] 6168 1$: popw x  
      009CC2 40               [ 2] 6169 	cplw x 
      009CC3 00 CD            [ 1] 6170 	ld a,#TK_INTGR 
      009CC5 82               [ 4] 6171 	ret 
                                   6172 
                                   6173 ;------------------------------
                                   6174 ; BASIC: DO 
                                   6175 ; initiate a DO ... UNTIL loop 
                                   6176 ;------------------------------
                           000003  6177 	DOLP_ADR=3 
                           000005  6178 	DOLP_INW=5
                           000004  6179 	VSIZE=4 
      001F74                       6180 do_loop:
      009CC6 57               [ 2] 6181 	popw x 
      001F75                       6182 	_vars VSIZE 
      009CC7 4F 81            [ 2]    1     sub sp,#VSIZE 
      009CC9 89               [ 2] 6183 	pushw x 
      009CC9 A1 02 27 03      [ 2] 6184 	ldw y,basicptr 
      009CCD CC 88            [ 2] 6185 	ldw (DOLP_ADR,sp),y
      009CCF 15 CE 00 00      [ 2] 6186 	ldw y,in.w 
      009CD0 17 05            [ 2] 6187 	ldw (DOLP_INW,sp),y
      009CD0 7D 26 08 CD      [ 1] 6188 	inc loop_depth 
      009CD4 86               [ 4] 6189 	ret 
                                   6190 
                                   6191 ;--------------------------------
                                   6192 ; BASIC: UNTIL expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6193 ; loop if exprssion is false 
                                   6194 ; else terminate loop
                                   6195 ;--------------------------------
      001F89                       6196 until: 
      009CD5 34 72 5F 00      [ 1] 6197 	tnz loop_depth 
      009CD9 04 81            [ 1] 6198 	jrne 1$ 
      009CDB 89 90 93         [ 2] 6199 	jp syntax_error 
      001F92                       6200 1$: 
      009CDE CD 99 98         [ 4] 6201 	call relation 
      009CE1 25 05            [ 1] 6202 	cp a,#TK_INTGR
      009CE3 A6 09            [ 1] 6203 	jreq 2$
      009CE5 CC 88 17         [ 2] 6204 	jp syntax_error
      009CE8                       6205 2$: 
      009CE8 55               [ 2] 6206 	tnzw x 
      009CE9 00 04            [ 1] 6207 	jrne 9$
      009CEB 00 02            [ 2] 6208 	ldw x,(DOLP_ADR,sp)
      009CED 72 5F 00         [ 2] 6209 	ldw basicptr,x 
      009CF0 18 AE            [ 1] 6210 	ld a,(2,x)
      009CF2 40 00 CF         [ 1] 6211 	ld count,a 
      009CF5 00 19            [ 2] 6212 	ldw x,(DOLP_INW,sp)
      009CF7 1E 01 CD         [ 2] 6213 	ldw in.w,x 
      009CFA 83               [ 4] 6214 	ret 
      001FAF                       6215 9$:	; remove loop data from stack  
      009CFB 36               [ 2] 6216 	popw x
      001FB0                       6217 	_drop VSIZE
      009CFC 5C 90            [ 2]    1     addw sp,#VSIZE 
      009CFE 85 89 5F CD      [ 1] 6218 	dec loop_depth 
      009D02 81               [ 2] 6219 	jp (x)
                                   6220 
                                   6221 ;--------------------------
                                   6222 ; BASIC: PRTA...PRTI  
                                   6223 ;  return constant value 
                                   6224 ;  PORT  offset in GPIO
                                   6225 ;  array
                                   6226 ;---------------------------
      001FB7                       6227 const_porta:
      009D03 E6 5B 02         [ 2] 6228 	ldw x,#0
      009D06 81 04            [ 1] 6229 	ld a,#TK_INTGR 
      009D07 81               [ 4] 6230 	ret 
      001FBD                       6231 const_portb:
      009D07 72 0D 52         [ 2] 6232 	ldw x,#1
      009D0A 30 FB            [ 1] 6233 	ld a,#TK_INTGR 
      009D0C 72               [ 4] 6234 	ret 
      001FC3                       6235 const_portc:
      009D0D 16 00 25         [ 2] 6236 	ldw x,#2
      009D10 8E 81            [ 1] 6237 	ld a,#TK_INTGR 
      009D12 81               [ 4] 6238 	ret 
      001FC9                       6239 const_portd:
      009D12 CD 91 10         [ 2] 6240 	ldw x,#3
      009D15 A1 04            [ 1] 6241 	ld a,#TK_INTGR 
      009D17 27               [ 4] 6242 	ret 
      001FCF                       6243 const_porte:
      009D18 03 CC 88         [ 2] 6244 	ldw x,#4
      009D1B 15 04            [ 1] 6245 	ld a,#TK_INTGR 
      009D1C 81               [ 4] 6246 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      001FD5                       6247 const_portf:
      009D1C 5D 27 04         [ 2] 6248 	ldw x,#5
      009D1F 8F 5A            [ 1] 6249 	ld a,#TK_INTGR 
      009D21 26               [ 4] 6250 	ret 
      001FDB                       6251 const_portg:
      009D22 F9 4F 81         [ 2] 6252 	ldw x,#6
      009D25 A6 04            [ 1] 6253 	ld a,#TK_INTGR 
      009D25 CD               [ 4] 6254 	ret 
      001FE1                       6255 const_porth:
      009D26 91 10 A1         [ 2] 6256 	ldw x,#7
      009D29 04 27            [ 1] 6257 	ld a,#TK_INTGR 
      009D2B 03               [ 4] 6258 	ret 
      001FE7                       6259 const_porti:
      009D2C CC 88 15         [ 2] 6260 	ldw x,#8
      009D2F A6 04            [ 1] 6261 	ld a,#TK_INTGR 
      009D2F A3               [ 4] 6262 	ret 
                                   6263 
                                   6264 ;-------------------------------
                                   6265 ; following return constant 
                                   6266 ; related to GPIO register offset 
                                   6267 ;---------------------------------
      001FED                       6268 const_odr:
      009D30 14 00            [ 1] 6269 	ld a,#TK_INTGR 
      009D32 2B 0C 35         [ 2] 6270 	ldw x,#GPIO_ODR
      009D35 0F               [ 4] 6271 	ret 
      001FF3                       6272 const_idr:
      009D36 50 F2            [ 1] 6273 	ld a,#TK_INTGR 
      009D38 A6 1E 62         [ 2] 6274 	ldw x,#GPIO_IDR
      009D3B A6               [ 4] 6275 	ret 
      001FF9                       6276 const_ddr:
      009D3C 10 62            [ 1] 6277 	ld a,#TK_INTGR 
      009D3E 20 1E 02         [ 2] 6278 	ldw x,#GPIO_DDR
      009D40 81               [ 4] 6279 	ret 
      001FFF                       6280 const_cr1:
      009D40 A3 08            [ 1] 6281 	ld a,#TK_INTGR 
      009D42 00 2B 09         [ 2] 6282 	ldw x,#GPIO_CR1
      009D45 35               [ 4] 6283 	ret 
      002005                       6284 const_cr2:
      009D46 0E 50            [ 1] 6285 	ld a,#TK_INTGR 
      009D48 F2 A6 50         [ 2] 6286 	ldw x,#GPIO_CR2
      009D4B 62               [ 4] 6287 	ret 
                                   6288 ;-------------------------
                                   6289 ;  constant for port mode
                                   6290 ;  used by PMODE 
                                   6291 ;  input or output
                                   6292 ;------------------------
      00200B                       6293 const_output:
      009D4C 20 10            [ 1] 6294 	ld a,#TK_INTGR 
      009D4E AE 00 01         [ 2] 6295 	ldw x,#OUTP
      009D4E 35               [ 4] 6296 	ret 
      002011                       6297 const_input:
      009D4F 07 50            [ 1] 6298 	ld a,#TK_INTGR 
      009D51 F2 00 00         [ 2] 6299 	ldw x,#INP 
      009D52 81               [ 4] 6300 	ret 
                                   6301 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6302 ; memory area constants
                                   6303 ;-----------------------
      002017                       6304 const_eeprom_base:
      009D52 A3 00            [ 1] 6305 	ld a,#TK_INTGR 
      009D54 40 23 07         [ 2] 6306 	ldw x,#EEPROM_BASE 
      009D57 72               [ 4] 6307 	ret 
                                   6308 
                                   6309 ;---------------------------
                                   6310 ; BASIC: DATA 
                                   6311 ; when the interpreter find 
                                   6312 ; a DATA line it skip it.
                                   6313 ;---------------------------
      00201D                       6314 data:
      009D58 5C 50 F2 54 20   [ 1] 6315 	mov in,count 
      009D5D F4               [ 4] 6316 	ret 
                                   6317 
                                   6318 ;---------------------------
                                   6319 ; BASIC: DATLN  *expr*
                                   6320 ; set DATA pointer at line# 
                                   6321 ; specified by *expr* 
                                   6322 ;---------------------------
      009D5E                       6323 data_line:
      009D5E 9F 4A 27         [ 4] 6324 	call expression
      009D61 01 4A            [ 1] 6325 	cp a,#TK_INTGR
      009D63 27 03            [ 1] 6326 	jreq 1$
      009D63 A4 3E C7         [ 2] 6327 	jp syntax_error 
      009D66 50 F1 72         [ 4] 6328 1$: call search_lineno
      009D69 18               [ 2] 6329 	tnzw x 
      009D6A 50 F0            [ 1] 6330 	jrne 3$
      009D6C 8E 81            [ 1] 6331 2$:	ld a,#ERR_NO_LINE 
      009D6E CC 07 97         [ 2] 6332 	jp tb_error
      002038                       6333 3$: ; check if valid data line 
      009D6E CE 00            [ 1] 6334     ldw y,x 
      009D70 10 A6            [ 2] 6335 	ldw x,(4,x)
      009D72 04 81 1D         [ 2] 6336 	cpw x,#data 
      009D74 26 F2            [ 1] 6337 	jrne 2$ 
      009D74 CD 90 12 A1      [ 2] 6338 	ldw data_ptr,y
      009D78 01 27 03         [ 1] 6339 	ld a,(2,y)
      009D7B CC 88 15         [ 1] 6340 	ld data_len,a 
      009D7E 35 06 00 08      [ 1] 6341 	mov data_ofs,#FIRST_DATA_ITEM 
      009D7E 85               [ 4] 6342 	ret
                                   6343 
                                   6344 ;---------------------------------
                                   6345 ; BASIC: RESTORE 
                                   6346 ; set data_ptr to first data line
                                   6347 ; if not DATA found pointer set to
                                   6348 ; zero 
                                   6349 ;---------------------------------
      002050                       6350 restore:
      009D7F 9E A5 80 27      [ 1] 6351 	clr data_ptr 
      009D83 01 50 A6 04      [ 1] 6352 	clr data_ptr+1
      009D87 81 5F 00 08      [ 1] 6353 	clr data_ofs 
      009D88 72 5F 00 09      [ 1] 6354 	clr data_len
      009D88 CD 90 12         [ 2] 6355 	ldw x,txtbgn
      002063                       6356 data_search_loop: 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009D8B A1 02 27         [ 2] 6357 	cpw x,txtend
      009D8E 03 CC            [ 1] 6358 	jruge 9$
      009D90 88 15            [ 1] 6359 	ldw y,x 
      009D92 85 9E            [ 2] 6360 	ldw x,(4,x)
      009D94 14 01 95         [ 2] 6361 	cpw x,#data 
      009D97 9F 14            [ 1] 6362 	jrne try_next_line 
      009D99 02 97 5B 02      [ 2] 6363 	ldw data_ptr,y 
      009D9D A6 04 81         [ 1] 6364 	ld a,(2,y)
      009DA0 C7 00 09         [ 1] 6365 	ld data_len,a 
      009DA0 CD 90 12 A1      [ 1] 6366 	mov data_ofs,#FIRST_DATA_ITEM
      009DA4 02 27 03 CC      [ 1] 6367 9$:	tnz data_len 
      009DA8 88 15            [ 1] 6368     jrne 10$
      009DAA A6 0C            [ 1] 6369 	ld a,#ERR_NO_DATA 
      009DAA 85 9E 1A         [ 2] 6370 	jp tb_error 
      009DAD 01               [ 4] 6371 10$:ret
      00208B                       6372 try_next_line:
      009DAE 95               [ 1] 6373 	ldw x,y 
      009DAF 9F 1A            [ 1] 6374 	ld a,(2,x)
      009DB1 02 97 5B         [ 1] 6375 	ld acc8,a 
      009DB4 02 A6 04 81      [ 1] 6376 	clr acc16 
      009DB8 72 BB 00 0C      [ 2] 6377 	addw x,acc16 
      009DB8 CD 90            [ 2] 6378 	jra data_search_loop
                                   6379 
                                   6380 
                                   6381 ;---------------------------------
                                   6382 ; BASIC: READ 
                                   6383 ; return next data item | 0 
                                   6384 ;---------------------------------
                           000001  6385 	CTX_BPTR=1 
                           000003  6386 	CTX_IN=3 
                           000004  6387 	CTX_COUNT=4 
                           000005  6388 	XSAVE=5
                           000006  6389 	VSIZE=6
      00209B                       6390 read:
      00209B                       6391 	_vars  VSIZE 
      009DBA 12 A1            [ 2]    1     sub sp,#VSIZE 
      00209D                       6392 read01:	
      009DBC 02 27 03         [ 1] 6393 	ld a,data_ofs
      009DBF CC 88 15         [ 1] 6394 	cp a,data_len 
      009DC2 27 37            [ 1] 6395 	jreq 2$ ; end of line  
      009DC2 85 9E 18         [ 4] 6396 	call save_context
      009DC5 01 95 9F         [ 2] 6397 	ldw x,data_ptr 
      009DC8 18 02 97         [ 2] 6398 	ldw basicptr,x 
      009DCB 5B 02 A6 04 81   [ 1] 6399 	mov in,data_ofs 
      009DD0 55 00 09 00 03   [ 1] 6400 	mov count,data_len  
      009DD0 CD 90 12         [ 4] 6401 	call expression 
      009DD3 A1 02            [ 1] 6402 	cp a,#TK_INTGR 
      009DD5 27 03            [ 1] 6403 	jreq 1$ 
      009DD7 CC 88 15         [ 2] 6404 	jp syntax_error 
      0020C2                       6405 1$:
      009DDA 90 85            [ 2] 6406 	ldw (XSAVE,SP),x
      009DDC 85 90 5D         [ 4] 6407 	call next_token ; skip comma
      009DDF 27 05 58         [ 2] 6408 	ldw x,basicptr 
      009DE2 90 5A 26         [ 2] 6409 	ldw data_ptr,x 
      009DE5 FB 00 01 00 08   [ 1] 6410 	mov data_ofs,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009DE6 CD 14 51         [ 4] 6411 	call rest_context
      009DE6 A6 04            [ 2] 6412 	ldw x,(XSAVE,sp)
      009DE8 81 04            [ 1] 6413 	ld a,#TK_INTGR
      009DE9                       6414 	_drop VSIZE 
      009DE9 CD 90            [ 2]    1     addw sp,#VSIZE 
      009DEB 12               [ 4] 6415 	ret 
      0020DC                       6416 2$: ; end of line reached 
      009DEC A1 02 27 03      [ 2] 6417 	ldw y, data_ptr 
      009DF0 CC 88 15 90      [ 1] 6418 	clr data_ptr
      009DF4 85 85 90 5D      [ 1] 6419 	clr data_ptr+1   
      009DF8 27 05 54 90      [ 1] 6420 	clr data_ofs 
      009DFC 5A 26 FB 09      [ 1] 6421 	clr data_len 
      009DFF CD 20 8B         [ 4] 6422 	call try_next_line 
      009DFF A6 04            [ 2] 6423 	jra read01
                                   6424 
                                   6425 
                                   6426 ;---------------------------------
                                   6427 ; BASIC: SPIEN clkdiv, 0|1  
                                   6428 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6429 ; if clkdiv==-1 disable SPI
                                   6430 ; 0|1 -> disable|enable  
                                   6431 ;--------------------------------- 
                           000005  6432 SPI_CS_BIT=5
      0020F5                       6433 spi_enable:
      009E01 81 0F 97         [ 4] 6434 	call arg_list 
      009E02 A1 02            [ 1] 6435 	cp a,#2
      009E02 A6 04            [ 1] 6436 	jreq 1$
      009E04 CD 90 05         [ 2] 6437 	jp syntax_error 
      0020FF                       6438 1$: 
      009E07 9F A4 07 C7      [ 1] 6439 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009E0B 50               [ 2] 6440 	popw x  
      009E0C C6               [ 2] 6441 	tnzw x 
      009E0D 81 21            [ 1] 6442 	jreq spi_disable 
      009E0E 85               [ 2] 6443 	popw x 
      009E0E 52 01            [ 1] 6444 	ld a,#(1<<SPI_CR1_BR)
      009E10 CD               [ 4] 6445 	mul x,a 
      009E11 90               [ 1] 6446 	ld a,xl 
      009E12 17 A1 02         [ 1] 6447 	ld SPI_CR1,a 
                                   6448 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009E15 27 03 CC 88      [ 1] 6449 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009E19 15 90 85 85      [ 1] 6450 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6451 ; configure SPI as master mode 0.	
      009E1D CD 9E 4F 6B      [ 1] 6452 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6453 ; ~CS line controlled by sofware 	
      009E21 01 A6 01 0D      [ 1] 6454 	bset SPI_CR2,#SPI_CR2_SSM 
      009E25 01 27 0B 48      [ 1] 6455     bset SPI_CR2,#SPI_CR2_SSI 
                                   6456 ; enable SPI
      009E29 0A 01 26 FB      [ 1] 6457 	bset SPI_CR1,#SPI_CR1_SPE 	
      009E2D 6B               [ 4] 6458 	ret 
      002128                       6459 spi_disable:
      002128                       6460 	_drop #2; throw first argument.
      009E2E 01 EA            [ 2]    1     addw sp,##2 
                                   6461 ; wait spi idle 
      009E30 03 E7            [ 1] 6462 1$:	ld a,#0x82 
      009E32 03 90 A3         [ 1] 6463 	and a,SPI_SR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009E35 00 01            [ 1] 6464 	cp a,#2 
      009E37 27 07            [ 1] 6465 	jrne 1$
      009E39 7B 01 43 E4      [ 1] 6466 	bres SPI_CR1,#SPI_CR1_SPE
      009E3D 02 20 0A C7      [ 1] 6467 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009E40 72 1B 50 16      [ 1] 6468 	bres PE_DDR,#SPI_CS_BIT 
      009E40 7B               [ 4] 6469 	ret 
                                   6470 
      002140                       6471 spi_clear_error:
      009E41 01 EA            [ 1] 6472 	ld a,#0x78 
      009E43 04 E7 04         [ 1] 6473 	bcp a,SPI_SR 
      009E46 7B 01            [ 1] 6474 	jreq 1$
      009E48 EA 02 E7 02      [ 1] 6475 	clr SPI_SR 
      009E4C 5B               [ 4] 6476 1$: ret 
                                   6477 
      00214C                       6478 spi_send_byte:
      009E4D 01               [ 1] 6479 	push a 
      009E4E 81 21 40         [ 4] 6480 	call spi_clear_error
      009E4F 84               [ 1] 6481 	pop a 
      009E4F 58 1C 9E 5F FE   [ 2] 6482 	btjf SPI_SR,#SPI_SR_TXE,.
      009E54 9F 88 5E         [ 1] 6483 	ld SPI_DR,a
      009E57 A6 05 42 1C 50   [ 2] 6484 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009E5C 00 84 81         [ 1] 6485 	ld a,SPI_DR 
      009E5F 81               [ 4] 6486 	ret 
                                   6487 
      002162                       6488 spi_rcv_byte:
      009E5F 03 06            [ 1] 6489 	ld a,#255
      009E61 03 05 04 00 02   [ 2] 6490 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009E66 01 06 00         [ 1] 6491 	ld a,SPI_DR 
      009E69 02               [ 4] 6492 	ret
                                   6493 
                                   6494 ;------------------------------
                                   6495 ; BASIC: SPIWR byte [,byte]
                                   6496 ; write 1 or more byte
                                   6497 ;------------------------------
      00216D                       6498 spi_write:
      009E6A 02 02 03         [ 4] 6499 	call expression
      009E6D 03 01            [ 1] 6500 	cp a,#TK_INTGR 
      009E6F 03 03            [ 1] 6501 	jreq 1$
      009E71 02 04 04         [ 2] 6502 	jp syntax_error 
      002177                       6503 1$:	
      009E74 05               [ 1] 6504 	ld a,xl 
      009E75 02 06 02         [ 4] 6505 	call spi_send_byte 
      009E78 07 02 05         [ 4] 6506 	call next_token 
      009E7B 04 02            [ 1] 6507 	cp a,#TK_COMMA 
      009E7D 04 01            [ 1] 6508 	jrne 2$ 
      009E7F 20 E9            [ 2] 6509 	jra spi_write 
      009E7F CD               [ 1] 6510 2$:	tnz a 
      009E80 90 12            [ 1] 6511 	jreq 3$
      002187                       6512 	_unget_token  
      009E82 A1 01 27 03 CC   [ 1]    1     mov in,in.saved
      009E87 88               [ 4] 6513 3$:	ret 
                                   6514 
                                   6515 
                                   6516 ;-------------------------------
                                   6517 ; BASIC: SPIRD 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   6518 ; read one byte from SPI 
                                   6519 ;-------------------------------
      00218D                       6520 spi_read:
      009E88 15 21 62         [ 4] 6521 	call spi_rcv_byte 
      009E89 5F               [ 1] 6522 	clrw x 
      009E89 A6               [ 1] 6523 	ld xl,a 
      009E8A 80 15            [ 1] 6524 	ld a,#TK_INTGR 
      009E8C 01               [ 4] 6525 	ret 
                                   6526 
                                   6527 ;------------------------------
                                   6528 ; BASIC: SPISEL 0|1 
                                   6529 ; set state of ~CS line
                                   6530 ; 0|1 deselect|select  
                                   6531 ;------------------------------
      002195                       6532 spi_select:
      009E8D 27 05 A6         [ 4] 6533 	call next_token 
      009E90 0A CC            [ 1] 6534 	cp a,#TK_INTGR 
      009E92 88 17            [ 1] 6535 	jreq 1$
      009E94 CC 07 95         [ 2] 6536 	jp syntax_error 
      009E94 CE               [ 2] 6537 1$: tnzw x  
      009E95 00 14            [ 1] 6538 	jreq cs_high 
      009E97 58 58 58 58      [ 1] 6539 	bres PE_ODR,#SPI_CS_BIT
      009E9B 58               [ 4] 6540 	ret 
      0021A7                       6541 cs_high: 
      009E9C 9E C8 00 14      [ 1] 6542 	bset PE_ODR,#SPI_CS_BIT
      009EA0 C7               [ 4] 6543 	ret 
                                   6544 
                                   6545 
                                   6546 ;------------------------------
                                   6547 ; BASIC: FILERX
                                   6548 ; Use to receive a BASIC program
                                   6549 ; from the PC using XMODEM 
                                   6550 ; protocol. The file is store in
                                   6551 ; Each line received is compiled
                                   6552 ; then stored in RAM. When reception 
                                   6553 ; is completed with success  the 
                                   6554 ; program is ready to be executed 
                                   6555 ; or save as local file.
                                   6556 ;--------------------------------
      0021AC                       6557 file_receive:
      009EA1 00 0D 9F C8 00   [ 2] 6558 	btjf flags,#FRUN,1$
      009EA6 15 C7            [ 1] 6559 	ld a,#ERR_CMD_ONLY
      009EA8 00 0E CE         [ 2] 6560 	jp tb_error 
      0021B6                       6561 1$:	
      009EAB 00 16 CF         [ 4] 6562 	call clear_basic
      009EAE 00 14 90         [ 2] 6563 	ldw x, txtbgn
      009EB1 54 90 9E         [ 4] 6564 	call xreceive 
      009EB4 C8 00 16 C7      [ 2] 6565 	addw x,txtbgn 
      009EB8 00 16 90         [ 2] 6566 	ldw txtend,x 
      009EBB 9F C8 00         [ 4] 6567 	call print_int 
      009EBE 17 C7 00         [ 2] 6568 	ldw x,#fsize_msg 
      009EC1 17 CE 00         [ 4] 6569 	call puts 
      009EC4 0D               [ 4] 6570 	ret 
      009EC5 54 54 54 9E C8 00 0D  6571 fsize_msg: .asciz " bytes received\n"
             95 9F C8 00 0E 97 C8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal  00-Bits]



             64 0A 00
                                   6572 
                                   6573 ;------------------------------
                                   6574 ; BASIC: FILETX "file_name" 
                                   6575 ; Transmit the program in RAM 
                                   6576 ; To the PC using XMODEM protocol.
                                   6577 ; The file transmitted as source 
                                   6578 ; file not tokenized. 
                                   6579 ;-------------------------------
      0021E1                       6580 file_transmit:
                                   6581 
      009ED4 17               [ 4] 6582 	ret 
                                   6583 
                                   6584 
                                   6585 ;------------------------------
                                   6586 ;      dictionary 
                                   6587 ; format:
                                   6588 ;   link:   2 bytes 
                                   6589 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6590 ;   cmd_name: 16 byte max 
                                   6591 ;   code_address: 2 bytes 
                                   6592 ;------------------------------
                                   6593 	.macro _dict_entry len,name,cmd 
                                   6594 	.word LINK 
                                   6595 	LINK=.
                                   6596 name:
                                   6597 	.byte len 	
                                   6598 	.ascii "name"
                                   6599 	.word cmd 
                                   6600 	.endm 
                                   6601 
                           000000  6602 	LINK=0
                                   6603 ; respect alphabetic order for BASIC names from Z-A
                                   6604 ; this sort order is for a cleaner WORDS cmd output. 	
      0021E2                       6605 kword_end:
      0021E2                       6606 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009ED5 97 9E                    1 	.word LINK 
                           0021E4     2 	LINK=.
      0021E4                          3 XPEEK:
      009ED7 C8                       4 	.byte 5+F_IFUNC 	
      009ED8 00 16 95 CF 00           5 	.ascii "XPEEK"
      009EDD 16 90                    6 	.word xpeek 
      0021EC                       6607 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009EDF 85 65                    1 	.word LINK 
                           0021EE     2 	LINK=.
      0021EE                          3 XOR:
      009EE1 93                       4 	.byte 3+F_IFUNC 	
      009EE2 5C 4F 52                 5 	.ascii "XOR"
      009EE3 1D 38                    6 	.word bit_xor 
      0021F4                       6608 	_dict_entry,5,WRITE,write  
      009EE3 A6 04                    1 	.word LINK 
                           0021F6     2 	LINK=.
      0021F6                          3 WRITE:
      009EE5 81                       4 	.byte 5 	
      009EE6 57 52 49 54 45           5 	.ascii "WRITE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009EE6 52 03                    6 	.word write 
      0021FE                       6609 	_dict_entry,5,WORDS,words 
      009EE8 0F 02                    1 	.word LINK 
                           002200     2 	LINK=.
      002200                          3 WORDS:
      009EEA 0F                       4 	.byte 5 	
      009EEB 03 90 AE A6 0A           5 	.ascii "WORDS"
      009EF0 93 F6                    6 	.word words 
      002208                       6610 	_dict_entry 4,WAIT,wait 
      009EF2 A4 0F                    1 	.word LINK 
                           00220A     2 	LINK=.
      00220A                          3 WAIT:
      009EF4 6B                       4 	.byte 4 	
      009EF5 01 0C 03 5C              5 	.ascii "WAIT"
      009EF9 F6 CD                    6 	.word wait 
      002211                       6611 	_dict_entry,3+F_IFUNC,USR,usr
      009EFB 82 44                    1 	.word LINK 
                           002213     2 	LINK=.
      002213                          3 USR:
      009EFD 0C                       4 	.byte 3+F_IFUNC 	
      009EFE 02 0A 01                 5 	.ascii "USR"
      009F01 26 F5                    6 	.word usr 
      002219                       6612 	_dict_entry,5,UNTIL,until 
      009F03 A6 46                    1 	.word LINK 
                           00221B     2 	LINK=.
      00221B                          3 UNTIL:
      009F05 11                       4 	.byte 5 	
      009F06 02 2B 09 A6 20           5 	.ascii "UNTIL"
      009F0B CD 82                    6 	.word until 
      002223                       6613 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009F0D 44 0C                    1 	.word LINK 
                           002225     2 	LINK=.
      002225                          3 UFLASH:
      009F0F 02                       4 	.byte 6+F_IFUNC 	
      009F10 20 07 A6 0D CD 82        5 	.ascii "UFLASH"
      009F16 44 0F                    6 	.word uflash 
      00222E                       6614 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009F18 02 72                    1 	.word LINK 
                           002230     2 	LINK=.
      002230                          3 UBOUND:
      009F1A A2                       4 	.byte 6+F_IFUNC 	
      009F1B 00 02 90 FE 26 CF        5 	.ascii "UBOUND"
      009F21 A6 0D                    6 	.word ubound 
      002239                       6615 	_dict_entry,4,TONE,tone  
      009F23 CD 82                    1 	.word LINK 
                           00223B     2 	LINK=.
      00223B                          3 TONE:
      009F25 44                       4 	.byte 4 	
      009F26 5F 7B 03 97              5 	.ascii "TONE"
      009F2A CD 89                    6 	.word tone 
      002242                       6616 	_dict_entry,2,TO,to
      009F2C AD AE                    1 	.word LINK 
                           002244     2 	LINK=.
      002244                          3 TO:
      009F2E 9F                       4 	.byte 2 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009F2F 36 CD                    5 	.ascii "TO"
      009F31 82 57                    6 	.word to 
      002249                       6617 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009F33 5B 03                    1 	.word LINK 
                           00224B     2 	LINK=.
      00224B                          3 TIMEOUT:
      009F35 81                       4 	.byte 7+F_IFUNC 	
      009F36 20 77 6F 72 64 73 20     5 	.ascii "TIMEOUT"
      009F3D 69 6E                    6 	.word timeout 
      002255                       6618 	_dict_entry,5,TIMER,set_timer
      009F3F 20 64                    1 	.word LINK 
                           002257     2 	LINK=.
      002257                          3 TIMER:
      009F41 69                       4 	.byte 5 	
      009F42 63 74 69 6F 6E           5 	.ascii "TIMER"
      009F47 61 72                    6 	.word set_timer 
      00225F                       6619 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009F49 79 0A                    1 	.word LINK 
                           002261     2 	LINK=.
      002261                          3 TICKS:
      009F4B 00                       4 	.byte 5+F_IFUNC 	
      009F4C 54 49 43 4B 53           5 	.ascii "TICKS"
      009F4C CD 90                    6 	.word get_ticks 
      002269                       6620 	_dict_entry,4,STOP,stop 
      009F4E 17 A1                    1 	.word LINK 
                           00226B     2 	LINK=.
      00226B                          3 STOP:
      009F50 01                       4 	.byte 4 	
      009F51 27 03 CC 88              5 	.ascii "STOP"
      009F55 15 56                    6 	.word stop 
      009F56                       6621 	_dict_entry,4,STEP,step 
      009F56 85 CF                    1 	.word LINK 
                           002274     2 	LINK=.
      002274                          3 STEP:
      009F58 00                       4 	.byte 4 	
      009F59 12 81 45 50              5 	.ascii "STEP"
      009F5B 15 F9                    6 	.word step 
      00227B                       6622 	_dict_entry,5,SPIWR,spi_write
      009F5B CE 00                    1 	.word LINK 
                           00227D     2 	LINK=.
      00227D                          3 SPIWR:
      009F5D 12                       4 	.byte 5 	
      009F5E 53 50 49 57 52           5 	.ascii "SPIWR"
      009F5E 53 A3                    6 	.word spi_write 
      002285                       6623 	_dict_entry,6,SPISEL,spi_select
      009F60 FF FF                    1 	.word LINK 
                           002287     2 	LINK=.
      002287                          3 SPISEL:
      009F62 27                       4 	.byte 6 	
      009F63 01 5F A6 04 81 4C        5 	.ascii "SPISEL"
      009F68 21 95                    6 	.word spi_select 
      002290                       6624 	_dict_entry,5,SPIEN,spi_enable 
      009F68 CD 90                    1 	.word LINK 
                           002292     2 	LINK=.
      002292                          3 SPIEN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009F6A 12                       4 	.byte 5 	
      009F6B A1 01 27 03 CC           5 	.ascii "SPIEN"
      009F70 88 15                    6 	.word spi_enable 
      00229A                       6625 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      009F72 85 20                    1 	.word LINK 
                           00229C     2 	LINK=.
      00229C                          3 SPIRD:
      009F74 E9                       4 	.byte 5+F_IFUNC 	
      009F75 53 50 49 52 44           5 	.ascii "SPIRD"
      009F75 CD 90                    6 	.word spi_read 
      0022A4                       6626 	_dict_entry,5,SLEEP,sleep 
      009F77 17 A1                    1 	.word LINK 
                           0022A6     2 	LINK=.
      0022A6                          3 SLEEP:
      009F79 01                       4 	.byte 5 	
      009F7A 27 03 CC 88 15           5 	.ascii "SLEEP"
      009F7F 85 4B                    6 	.word sleep 
      0022AE                       6627 	_dict_entry,4+F_IFUNC,SIZE,size
      009F81 00 35                    1 	.word LINK 
                           0022B0     2 	LINK=.
      0022B0                          3 SIZE:
      009F83 CC                       4 	.byte 4+F_IFUNC 	
      009F84 50 E0 9E A4              5 	.ascii "SIZE"
      009F88 3F 95                    6 	.word size 
      0022B7                       6628     _dict_entry,4,SHOW,show 
      009F8A A3 00                    1 	.word LINK 
                           0022B9     2 	LINK=.
      0022B9                          3 SHOW:
      009F8C FF                       4 	.byte 4 	
      009F8D 23 06 0C 01              5 	.ascii "SHOW"
      009F91 98 56                    6 	.word show 
      0022C0                       6629 	_dict_entry,4,SAVE,save
      009F93 20 F5                    1 	.word LINK 
                           0022C2     2 	LINK=.
      0022C2                          3 SAVE:
      009F95 35                       4 	.byte 4 	
      009F96 55 50 E0 84              5 	.ascii "SAVE"
      009F9A C7 50                    6 	.word save 
      0022C9                       6630 	_dict_entry 3,RUN,run
      009F9C E1 9F                    1 	.word LINK 
                           0022CB     2 	LINK=.
      0022CB                          3 RUN:
      009F9E 4A                       4 	.byte 3 	
      009F9F 35 55 50                 5 	.ascii "RUN"
      009FA2 E0 C7                    6 	.word run 
      0022D1                       6631 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009FA4 50 E2                    1 	.word LINK 
                           0022D3     2 	LINK=.
      0022D3                          3 RSHIFT:
      009FA6 35                       4 	.byte 6+F_IFUNC 	
      009FA7 AA 50 E0 81 46 54        5 	.ascii "RSHIFT"
      009FAB 1D 69                    6 	.word rshift 
      0022DC                       6632 	_dict_entry,3+F_IFUNC,RND,random 
      009FAB 35 AA                    1 	.word LINK 
                           0022DE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0022DE                          3 RND:
      009FAD 50                       4 	.byte 3+F_IFUNC 	
      009FAE E0 81 44                 5 	.ascii "RND"
      009FB0 1D FF                    6 	.word random 
      0022E4                       6633 	_dict_entry,6,RETURN,return 
      009FB0 CD 90                    1 	.word LINK 
                           0022E6     2 	LINK=.
      0022E6                          3 RETURN:
      009FB2 12                       4 	.byte 6 	
      009FB3 A1 01 27 03 CC 88        5 	.ascii "RETURN"
      009FB9 15 85                    6 	.word return 
      009FBB                       6634 	_dict_entry,7,RESTORE,restore 
      009FBB 5D 27                    1 	.word LINK 
                           0022F1     2 	LINK=.
      0022F1                          3 RESTORE:
      009FBD 0A                       4 	.byte 7 	
      009FBE A6 0F 59 25 03 4A 20     5 	.ascii "RESTORE"
      009FC5 FA 5F                    6 	.word restore 
      0022FB                       6635 	_dict_entry 6,REMARK,remark 
      009FC7 97 A6                    1 	.word LINK 
                           0022FD     2 	LINK=.
      0022FD                          3 REMARK:
      009FC9 04                       4 	.byte 6 	
      009FCA 81 45 4D 41 52 4B        5 	.ascii "REMARK"
      009FCB 14 CD                    6 	.word remark 
      002306                       6636 	_dict_entry,6,REBOOT,cold_start
      009FCB CD 90                    1 	.word LINK 
                           002308     2 	LINK=.
      002308                          3 REBOOT:
      009FCD 12                       4 	.byte 6 	
      009FCE A1 01 27 03 CC 88        5 	.ascii "REBOOT"
      009FD4 15 85                    6 	.word cold_start 
      002311                       6637 	_dict_entry,4+F_IFUNC,READ,read  
      009FD6 9F A4                    1 	.word LINK 
                           002313     2 	LINK=.
      002313                          3 READ:
      009FD8 0F                       4 	.byte 4+F_IFUNC 	
      009FD9 5F 5C 4D 27              5 	.ascii "READ"
      009FDD 04 58                    6 	.word read 
      00231A                       6638 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009FDF 4A 20                    1 	.word LINK 
                           00231C     2 	LINK=.
      00231C                          3 QKEY:
      009FE1 F9                       4 	.byte 4+F_IFUNC 	
      009FE2 A6 04 81 59              5 	.ascii "QKEY"
      009FE5 1B CF                    6 	.word qkey 
      002323                       6639 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      009FE5 CD 90                    1 	.word LINK 
                           002325     2 	LINK=.
      002325                          3 PRTI:
      009FE7 12                       4 	.byte 4+F_IFUNC 	
      009FE8 A1 01 27 03              5 	.ascii "PRTI"
      009FEC CC 88                    6 	.word const_porti 
      00232C                       6640 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      009FEE 15 85                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



                           00232E     2 	LINK=.
      00232E                          3 PRTH:
      009FF0 53                       4 	.byte 4+F_IFUNC 	
      009FF1 A6 04 81 48              5 	.ascii "PRTH"
      009FF4 1F E1                    6 	.word const_porth 
      002335                       6641 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      009FF4 85 52                    1 	.word LINK 
                           002337     2 	LINK=.
      002337                          3 PRTG:
      009FF6 04                       4 	.byte 4+F_IFUNC 	
      009FF7 89 90 CE 00              5 	.ascii "PRTG"
      009FFB 05 17                    6 	.word const_portg 
      00233E                       6642 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      009FFD 03 90                    1 	.word LINK 
                           002340     2 	LINK=.
      002340                          3 PRTF:
      009FFF CE                       4 	.byte 4+F_IFUNC 	
      00A000 00 01 17 05              5 	.ascii "PRTF"
      00A004 72 5C                    6 	.word const_portf 
      002347                       6643 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A006 00 22                    1 	.word LINK 
                           002349     2 	LINK=.
      002349                          3 PRTE:
      00A008 81                       4 	.byte 4+F_IFUNC 	
      00A009 50 52 54 45              5 	.ascii "PRTE"
      00A009 72 5D                    6 	.word const_porte 
      002350                       6644 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A00B 00 22                    1 	.word LINK 
                           002352     2 	LINK=.
      002352                          3 PRTD:
      00A00D 26                       4 	.byte 4+F_IFUNC 	
      00A00E 03 CC 88 15              5 	.ascii "PRTD"
      00A012 1F C9                    6 	.word const_portd 
      002359                       6645 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A012 CD 91                    1 	.word LINK 
                           00235B     2 	LINK=.
      00235B                          3 PRTC:
      00A014 54                       4 	.byte 4+F_IFUNC 	
      00A015 A1 04 27 03              5 	.ascii "PRTC"
      00A019 CC 88                    6 	.word const_portc 
      002362                       6646 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A01B 15 5B                    1 	.word LINK 
                           002364     2 	LINK=.
      00A01C                          3 PRTB:
      00A01C 5D                       4 	.byte 4+F_IFUNC 	
      00A01D 26 10 1E 03              5 	.ascii "PRTB"
      00A021 CF 00                    6 	.word const_portb 
      00236B                       6647 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A023 05 E6                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 PRTA:
      00A025 02                       4 	.byte 4+F_IFUNC 	
      00A026 C7 00 04 1E              5 	.ascii "PRTA"
      00A02A 05 CF                    6 	.word const_porta 
      002374                       6648 	_dict_entry 5,PRINT,print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A02C 00 01                    1 	.word LINK 
                           002376     2 	LINK=.
      002376                          3 PRINT:
      00A02E 81                       4 	.byte 5 	
      00A02F 50 52 49 4E 54           5 	.ascii "PRINT"
      00A02F 85 5B                    6 	.word print 
      00237E                       6649 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A031 04 72                    1 	.word LINK 
                           002380     2 	LINK=.
      002380                          3 POUT:
      00A033 5A                       4 	.byte 4+F_IFUNC 	
      00A034 00 22 FC 54              5 	.ascii "POUT"
      00A037 20 0B                    6 	.word const_output 
      002387                       6650 	_dict_entry,4,POKE,poke 
      00A037 AE 00                    1 	.word LINK 
                           002389     2 	LINK=.
      002389                          3 POKE:
      00A039 00                       4 	.byte 4 	
      00A03A A6 04 81 45              5 	.ascii "POKE"
      00A03D 15 50                    6 	.word poke 
      002390                       6651 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A03D AE 00                    1 	.word LINK 
                           002392     2 	LINK=.
      002392                          3 PINP:
      00A03F 01                       4 	.byte 4+F_IFUNC 	
      00A040 A6 04 81 50              5 	.ascii "PINP"
      00A043 20 11                    6 	.word const_input 
      002399                       6652 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A043 AE 00                    1 	.word LINK 
                           00239B     2 	LINK=.
      00239B                          3 PEEK:
      00A045 02                       4 	.byte 4+F_IFUNC 	
      00A046 A6 04 81 4B              5 	.ascii "PEEK"
      00A049 15 5F                    6 	.word peek 
      0023A2                       6653 	_dict_entry,5,PMODE,pin_mode 
      00A049 AE 00                    1 	.word LINK 
                           0023A4     2 	LINK=.
      0023A4                          3 PMODE:
      00A04B 03                       4 	.byte 5 	
      00A04C A6 04 81 44 45           5 	.ascii "PMODE"
      00A04F 1D 8E                    6 	.word pin_mode 
      0023AC                       6654 	_dict_entry,5,PAUSE,pause 
      00A04F AE 00                    1 	.word LINK 
                           0023AE     2 	LINK=.
      0023AE                          3 PAUSE:
      00A051 04                       4 	.byte 5 	
      00A052 A6 04 81 53 45           5 	.ascii "PAUSE"
      00A055 1C 92                    6 	.word pause 
      0023B6                       6655 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A055 AE 00                    1 	.word LINK 
                           0023B8     2 	LINK=.
      0023B8                          3 OR:
      00A057 05                       4 	.byte 2+F_IFUNC 	
      00A058 A6 04                    5 	.ascii "OR"
      00A05A 81 20                    6 	.word bit_or 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A05B                       6656 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A05B AE 00                    1 	.word LINK 
                           0023BF     2 	LINK=.
      0023BF                          3 ODR:
      00A05D 06                       4 	.byte 3+F_IFUNC 	
      00A05E A6 04 81                 5 	.ascii "ODR"
      00A061 1F ED                    6 	.word const_odr 
      0023C5                       6657 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A061 AE 00                    1 	.word LINK 
                           0023C7     2 	LINK=.
      0023C7                          3 NOT:
      00A063 07                       4 	.byte 3+F_IFUNC 	
      00A064 A6 04 81                 5 	.ascii "NOT"
      00A067 1E E8                    6 	.word func_not 
      0023CD                       6658 	_dict_entry,3,NEW,new
      00A067 AE 00                    1 	.word LINK 
                           0023CF     2 	LINK=.
      0023CF                          3 NEW:
      00A069 08                       4 	.byte 3 	
      00A06A A6 04 81                 5 	.ascii "NEW"
      00A06D 18 A2                    6 	.word new 
      0023D5                       6659 	_dict_entry,4,NEXT,next 
      00A06D A6 04                    1 	.word LINK 
                           0023D7     2 	LINK=.
      0023D7                          3 NEXT:
      00A06F AE                       4 	.byte 4 	
      00A070 00 00 81 54              5 	.ascii "NEXT"
      00A073 16 20                    6 	.word next 
      0023DE                       6660 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A073 A6 04                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 LSHIFT:
      00A075 AE                       4 	.byte 6+F_IFUNC 	
      00A076 00 01 81 49 46 54        5 	.ascii "LSHIFT"
      00A079 1D 50                    6 	.word lshift 
      0023E9                       6661 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A079 A6 04                    1 	.word LINK 
                           0023EB     2 	LINK=.
      0023EB                          3 LOG:
      00A07B AE                       4 	.byte 3+F_IFUNC 	
      00A07C 00 02 81                 5 	.ascii "LOG"
      00A07F 1F 30                    6 	.word log2 
      0023F1                       6662 	_dict_entry,4,LOAD,load 
      00A07F A6 04                    1 	.word LINK 
                           0023F3     2 	LINK=.
      0023F3                          3 LOAD:
      00A081 AE                       4 	.byte 4 	
      00A082 00 03 81 44              5 	.ascii "LOAD"
      00A085 1A 53                    6 	.word load 
      0023FA                       6663 	_dict_entry 4,LIST,list
      00A085 A6 04                    1 	.word LINK 
                           0023FC     2 	LINK=.
      0023FC                          3 LIST:
      00A087 AE                       4 	.byte 4 	
      00A088 00 04 81 54              5 	.ascii "LIST"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A08B 11 CD                    6 	.word list 
      002403                       6664 	_dict_entry 3,LET,let 
      00A08B A6 04                    1 	.word LINK 
                           002405     2 	LINK=.
      002405                          3 LET:
      00A08D AE                       4 	.byte 3 	
      00A08E 00 01 81                 5 	.ascii "LET"
      00A091 11 A2                    6 	.word let 
      00240B                       6665 	_dict_entry,3+F_IFUNC,KEY,key 
      00A091 A6 04                    1 	.word LINK 
                           00240D     2 	LINK=.
      00240D                          3 KEY:
      00A093 AE                       4 	.byte 3+F_IFUNC 	
      00A094 00 00 81                 5 	.ascii "KEY"
      00A097 1B C7                    6 	.word key 
      002413                       6666 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A097 A6 04                    1 	.word LINK 
                           002415     2 	LINK=.
      002415                          3 IWDGREF:
      00A099 AE                       4 	.byte 7 	
      00A09A 40 00 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A09D 1F 2B                    6 	.word refresh_iwdg 
      00241F                       6667 	_dict_entry,6,IWDGEN,enable_iwdg
      00A09D 55 00                    1 	.word LINK 
                           002421     2 	LINK=.
      002421                          3 IWDGEN:
      00A09F 04                       4 	.byte 6 	
      00A0A0 00 02 81 47 45 4E        5 	.ascii "IWDGEN"
      00A0A3 1E F5                    6 	.word enable_iwdg 
      00242A                       6668 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A0A3 CD 91                    1 	.word LINK 
                           00242C     2 	LINK=.
      00242C                          3 INVERT:
      00A0A5 10                       4 	.byte 6+F_IFUNC 	
      00A0A6 A1 04 27 03 CC 88        5 	.ascii "INVERT"
      00A0AC 15 CD                    6 	.word invert 
      002435                       6669 	_dict_entry,5,INPUT,input_var  
      00A0AE 83 A4                    1 	.word LINK 
                           002437     2 	LINK=.
      002437                          3 INPUT:
      00A0B0 5D                       4 	.byte 5 	
      00A0B1 26 05 A6 05 CC           5 	.ascii "INPUT"
      00A0B6 88 17                    6 	.word input_var 
      00A0B8                       6670 	_dict_entry,2,IF,if 
      00A0B8 90 93                    1 	.word LINK 
                           002441     2 	LINK=.
      002441                          3 IF:
      00A0BA EE                       4 	.byte 2 	
      00A0BB 04 A3                    5 	.ascii "IF"
      00A0BD A0 9D                    6 	.word if 
      002446                       6671 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A0BF 26 F2                    1 	.word LINK 
                           002448     2 	LINK=.
      002448                          3 IDR:
      00A0C1 90                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A0C2 CF 00 07                 5 	.ascii "IDR"
      00A0C5 90 E6                    6 	.word const_idr 
      00244E                       6672 	_dict_entry,3,HEX,hex_base
      00A0C7 02 C7                    1 	.word LINK 
                           002450     2 	LINK=.
      002450                          3 HEX:
      00A0C9 00                       4 	.byte 3 	
      00A0CA 0A 35 06                 5 	.ascii "HEX"
      00A0CD 00 09                    6 	.word hex_base 
      002456                       6673 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A0CF 81 50                    1 	.word LINK 
                           002458     2 	LINK=.
      00A0D0                          3 GPIO:
      00A0D0 72                       4 	.byte 4+F_IFUNC 	
      00A0D1 5F 00 07 72              5 	.ascii "GPIO"
      00A0D5 5F 00                    6 	.word gpio 
      00245F                       6674 	_dict_entry,4,GOTO,goto 
      00A0D7 08 72                    1 	.word LINK 
                           002461     2 	LINK=.
      002461                          3 GOTO:
      00A0D9 5F                       4 	.byte 4 	
      00A0DA 00 09 72 5F              5 	.ascii "GOTO"
      00A0DE 00 0A                    6 	.word goto 
      002468                       6675 	_dict_entry,5,GOSUB,gosub 
      00A0E0 CE 00                    1 	.word LINK 
                           00246A     2 	LINK=.
      00246A                          3 GOSUB:
      00A0E2 1E                       4 	.byte 5 	
      00A0E3 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A0E3 C3 00                    6 	.word gosub 
      002472                       6676 	_dict_entry,6,FORGET,forget 
      00A0E5 20 24                    1 	.word LINK 
                           002474     2 	LINK=.
      002474                          3 FORGET:
      00A0E7 17                       4 	.byte 6 	
      00A0E8 90 93 EE 04 A3 A0        5 	.ascii "FORGET"
      00A0EE 9D 26                    6 	.word forget 
      00247D                       6677 	_dict_entry,3,FOR,for 
      00A0F0 1A 90                    1 	.word LINK 
                           00247F     2 	LINK=.
      00247F                          3 FOR:
      00A0F2 CF                       4 	.byte 3 	
      00A0F3 00 07 90                 5 	.ascii "FOR"
      00A0F6 E6 02                    6 	.word for 
      002485                       6678 	_dict_entry,6,FILETX,file_transmit
      00A0F8 C7 00                    1 	.word LINK 
                           002487     2 	LINK=.
      002487                          3 FILETX:
      00A0FA 0A                       4 	.byte 6 	
      00A0FB 35 06 00 09 72 5D        5 	.ascii "FILETX"
      00A101 00 0A                    6 	.word file_transmit 
      002490                       6679 	_dict_entry,6,FILERX,file_receive 
      00A103 26 05                    1 	.word LINK 
                           002492     2 	LINK=.
      002492                          3 FILERX:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A105 A6                       4 	.byte 6 	
      00A106 0C CC 88 17 81 58        5 	.ascii "FILERX"
      00A10B 21 AC                    6 	.word file_receive 
      00249B                       6680 	_dict_entry,4,FCPU,fcpu 
      00A10B 93 E6                    1 	.word LINK 
                           00249D     2 	LINK=.
      00249D                          3 FCPU:
      00A10D 02                       4 	.byte 4 	
      00A10E C7 00 0E 72              5 	.ascii "FCPU"
      00A112 5F 00                    6 	.word fcpu 
      0024A4                       6681 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A114 0D 72                    1 	.word LINK 
                           0024A6     2 	LINK=.
      0024A6                          3 EEPROM:
      00A116 BB                       4 	.byte 6+F_IFUNC 	
      00A117 00 0D 20 C8 4F 4D        5 	.ascii "EEPROM"
      00A11B 20 17                    6 	.word const_eeprom_base 
      0024AF                       6682 	_dict_entry,3,END,cmd_end  
      00A11B 52 06                    1 	.word LINK 
                           0024B1     2 	LINK=.
      00A11D                          3 END:
      00A11D C6                       4 	.byte 3 	
      00A11E 00 09 C1                 5 	.ascii "END"
      00A121 00 0A                    6 	.word cmd_end 
      0024B7                       6683 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A123 27 37                    1 	.word LINK 
                           0024B9     2 	LINK=.
      0024B9                          3 DWRITE:
      00A125 CD                       4 	.byte 6+F_CMD 	
      00A126 94 C1 CE 00 07 CF        5 	.ascii "DWRITE"
      00A12C 00 05                    6 	.word digital_write 
      0024C2                       6684 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A12E 55 00                    1 	.word LINK 
                           0024C4     2 	LINK=.
      0024C4                          3 DREAD:
      00A130 09                       4 	.byte 5+F_IFUNC 	
      00A131 00 02 55 00 0A           5 	.ascii "DREAD"
      00A136 00 04                    6 	.word digital_read 
      0024CC                       6685 	_dict_entry,2,DO,do_loop
      00A138 CD 91                    1 	.word LINK 
                           0024CE     2 	LINK=.
      0024CE                          3 DO:
      00A13A 10                       4 	.byte 2 	
      00A13B A1 04                    5 	.ascii "DO"
      00A13D 27 03                    6 	.word do_loop 
      0024D3                       6686 	_dict_entry,3,DIR,directory 
      00A13F CC 88                    1 	.word LINK 
                           0024D5     2 	LINK=.
      0024D5                          3 DIR:
      00A141 15                       4 	.byte 3 	
      00A142 44 49 52                 5 	.ascii "DIR"
      00A142 1F 05                    6 	.word directory 
      0024DB                       6687 	_dict_entry,3,DEC,dec_base
      00A144 CD 89                    1 	.word LINK 
                           0024DD     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      0024DD                          3 DEC:
      00A146 07                       4 	.byte 3 	
      00A147 CE 00 05                 5 	.ascii "DEC"
      00A14A CF 00                    6 	.word dec_base 
      0024E3                       6688 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A14C 07 55                    1 	.word LINK 
                           0024E5     2 	LINK=.
      0024E5                          3 DDR:
      00A14E 00                       4 	.byte 3+F_IFUNC 	
      00A14F 02 00 09                 5 	.ascii "DDR"
      00A152 CD 94                    6 	.word const_ddr 
      0024EB                       6689 	_dict_entry,6,DATALN,data_line  
      00A154 D1 1E                    1 	.word LINK 
                           0024ED     2 	LINK=.
      0024ED                          3 DATALN:
      00A156 05                       4 	.byte 6 	
      00A157 A6 04 5B 06 81 4E        5 	.ascii "DATALN"
      00A15C 20 23                    6 	.word data_line 
      0024F6                       6690 	_dict_entry,4,DATA,data  
      00A15C 90 CE                    1 	.word LINK 
                           0024F8     2 	LINK=.
      0024F8                          3 DATA:
      00A15E 00                       4 	.byte 4 	
      00A15F 07 72 5F 00              5 	.ascii "DATA"
      00A163 07 72                    6 	.word data 
      0024FF                       6691 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A165 5F 00                    1 	.word LINK 
                           002501     2 	LINK=.
      002501                          3 CRL:
      00A167 08                       4 	.byte 3+F_IFUNC 	
      00A168 72 5F 00                 5 	.ascii "CRL"
      00A16B 09 72                    6 	.word const_cr1 
      002507                       6692 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A16D 5F 00                    1 	.word LINK 
                           002509     2 	LINK=.
      002509                          3 CRH:
      00A16F 0A                       4 	.byte 3+F_IFUNC 	
      00A170 CD A1 0B                 5 	.ascii "CRH"
      00A173 20 A8                    6 	.word const_cr2 
      00A175                       6693 	_dict_entry,4+F_CFUNC,CHAR,char
      00A175 CD 90                    1 	.word LINK 
                           002511     2 	LINK=.
      002511                          3 CHAR:
      00A177 17                       4 	.byte 4+F_CFUNC 	
      00A178 A1 02 27 03              5 	.ascii "CHAR"
      00A17C CC 88                    6 	.word char 
      002518                       6694 	_dict_entry,3,BYE,bye 
      00A17E 15 11                    1 	.word LINK 
                           00251A     2 	LINK=.
      00A17F                          3 BYE:
      00A17F 72                       4 	.byte 3 	
      00A180 12 50 C7                 5 	.ascii "BYE"
      00A183 85 5D                    6 	.word bye 
      002520                       6695 	_dict_entry,5,BTOGL,bit_toggle
      00A185 27 21                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                           002522     2 	LINK=.
      002522                          3 BTOGL:
      00A187 85                       4 	.byte 5 	
      00A188 A6 08 42 9F C7           5 	.ascii "BTOGL"
      00A18D 52 00                    6 	.word bit_toggle 
      00252A                       6696 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A18F 72 1A                    1 	.word LINK 
                           00252C     2 	LINK=.
      00252C                          3 BTEST:
      00A191 50                       4 	.byte 5+F_IFUNC 	
      00A192 14 72 1A 50 16           5 	.ascii "BTEST"
      00A197 72 14                    6 	.word bit_test 
      002534                       6697 	_dict_entry,4,BSET,bit_set 
      00A199 52 00                    1 	.word LINK 
                           002536     2 	LINK=.
      002536                          3 BSET:
      00A19B 72                       4 	.byte 4 	
      00A19C 12 52 01 72              5 	.ascii "BSET"
      00A1A0 10 52                    6 	.word bit_set 
      00253D                       6698 	_dict_entry,4,BRES,bit_reset
      00A1A2 01 72                    1 	.word LINK 
                           00253F     2 	LINK=.
      00253F                          3 BRES:
      00A1A4 1C                       4 	.byte 4 	
      00A1A5 52 00 81 53              5 	.ascii "BRES"
      00A1A8 15 08                    6 	.word bit_reset 
      002546                       6699 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A1A8 5B 02                    1 	.word LINK 
                           002548     2 	LINK=.
      002548                          3 BIT:
      00A1AA A6                       4 	.byte 3+F_IFUNC 	
      00A1AB 82 C4 52                 5 	.ascii "BIT"
      00A1AE 03 A1                    6 	.word bitmask 
      00254E                       6700 	_dict_entry,3,AWU,awu 
      00A1B0 02 26                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 AWU:
      00A1B2 F7                       4 	.byte 3 	
      00A1B3 72 1D 52                 5 	.ascii "AWU"
      00A1B6 00 72                    6 	.word awu 
      002556                       6701 	_dict_entry,7,AUTORUN,autorun
      00A1B8 13 50                    1 	.word LINK 
                           002558     2 	LINK=.
      002558                          3 AUTORUN:
      00A1BA C7                       4 	.byte 7 	
      00A1BB 72 1B 50 16 81 55 4E     5 	.ascii "AUTORUN"
      00A1C0 1C 30                    6 	.word autorun 
      002562                       6702 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A1C0 A6 78                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 ASC:
      00A1C2 C5                       4 	.byte 3+F_IFUNC 	
      00A1C3 52 03 27                 5 	.ascii "ASC"
      00A1C6 04 72                    6 	.word ascii 
      00256A                       6703 	_dict_entry,3+F_IFUNC,AND,bit_and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00A1C8 5F 52                    1 	.word LINK 
                           00256C     2 	LINK=.
      00256C                          3 AND:
      00A1CA 03                       4 	.byte 3+F_IFUNC 	
      00A1CB 81 4E 44                 5 	.ascii "AND"
      00A1CC 1D 08                    6 	.word bit_and 
      002572                       6704 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A1CC 88 CD                    1 	.word LINK 
                           002574     2 	LINK=.
      002574                          3 ADCREAD:
      00A1CE A1                       4 	.byte 7+F_IFUNC 	
      00A1CF C0 84 72 03 52 03 FB     5 	.ascii "ADCREAD"
      00A1D6 C7 52                    6 	.word analog_read 
      00257E                       6705 	_dict_entry,5,ADCON,power_adc 
      00A1D8 04 72                    1 	.word LINK 
                           002580     2 	LINK=.
      002580                          3 ADCON:
      00A1DA 01                       4 	.byte 5 	
      00A1DB 52 03 FB C6 52           5 	.ascii "ADCON"
      00A1E0 04 81                    6 	.word power_adc 
      00A1E2                       6706 kword_dict:
      002588                       6707 	_dict_entry,3+F_IFUNC,ABS,abs
      00A1E2 A6 FF                    1 	.word LINK 
                           00258A     2 	LINK=.
      00258A                          3 ABS:
      00A1E4 72                       4 	.byte 3+F_IFUNC 	
      00A1E5 01 52 03                 5 	.ascii "ABS"
      00A1E8 E3 C6                    6 	.word abs 
                                   6708 	
                                   6709 
      002600                       6710 	.bndry 128 ; align on FLASH block.
                                   6711 ; free space for user application  
      002600                       6712 user_space:
                                   6713 ; USR() function test
      00A1EA 52               [ 2] 6714 	pushw x 
      00A1EB 04 81 50 0A      [ 1] 6715 	bset PC_ODR,#5 
      00A1ED 85               [ 2] 6716 	popw x 
      00A1ED CD 91 10         [ 4] 6717 	call pause02 
      00A1F0 A1 04 27 03      [ 1] 6718 	bres PC_ODR,#5 
      00A1F4 CC               [ 4] 6719 	ret
                                   6720 
                                   6721 	.area FLASH_DRIVE (ABS)
      010000                       6722 	.org 0x10000
      010000                       6723 fdrive:
                                   6724 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00258A R   |     ACK     =  000006 
  5 ADCON      002580 R   |   5 ADCREAD    002574 R   |     ADC_CR1 =  005401 
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
  5 AND        00256C R   |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        002564 R   |     ATTRIB  =  000002     |   5 AUTORUN    002558 R
    AUTORUN_=  004000     |   5 AWU        002550 R   |   5 AWUHandl   000001 R
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
    BINARY  =  000001     |   5 BIT        002548 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       00253F R
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       002536 R
    BSIZE   =  000001     |   5 BTEST      00252C R   |   5 BTOGL      002522 R
    BTW     =  000001     |   5 BYE        00251A R   |     C       =  000001 
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
  5 CHAR       002511 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002509 R
  5 CRL        002501 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       0024F8 R   |   5 DATALN     0024ED R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        0024E5 R   |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        0024DD R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0024D5 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0024CE R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |   5 DREAD      0024C4 R   |   5 DWRITE     0024B9 R
  5 EEPROM     0024A6 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EM      =  000019     |   5 END        0024B1 R
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       00249D R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |   5 FILERX     002492 R   |   5 FILETX     002487 R
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
    FLSI    =  01F400     |   5 FOR        00247F R   |   5 FORGET     002474 R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      00246A R   |   5 GOTO       002461 R
  5 GPIO       002458 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002450 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002448 R
  5 IF         002441 R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002437 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
    INT_VECT=  008058     |   5 INVERT     00242C R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002421 R
  5 IWDGREF    002415 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        00240D R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002405 R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  00258A R   |   5 LIST       0023FC R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOAD       0023F3 R   |   5 LOG        0023EB R   |   5 LSHIFT     0023E0 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0023CF R
  5 NEXT       0023D7 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  5 NOT        0023C7 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        0023BF R
    ONOFF   =  000003     |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0023B8 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000080     |   5 PAUSE      0023AE R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       00239B R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002392 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0023A4 R
  5 POKE       002389 R   |     PORT    =  000003     |   5 POUT       002380 R
    PREV    =  000001     |   5 PRINT      002376 R   |     PROD    =  000002 
  5 PRTA       00236D R   |   5 PRTB       002364 R   |   5 PRTC       00235B R
  5 PRTD       002352 R   |   5 PRTE       002349 R   |   5 PRTF       002340 R
  5 PRTG       002337 R   |   5 PRTH       00232E R   |   5 PRTI       002325 R
  5 QKEY       00231C R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       002313 R   |   5 REBOOT     002308 R
    REG     =  000001     |     RELOP   =  000005     |   5 REMARK     0022FD R
  5 RESTORE    0022F1 R   |     RETL1   =  000001     |   5 RETURN     0022E6 R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0022DE R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0022D3 R
    RST_SR  =  0050B3     |   5 RUN        0022CB R   |     RXCHAR  =  000001 
  5 SAVE       0022C2 R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0022B9 R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0022B0 R
    SKIP    =  000005     |   5 SLEEP      0022A6 R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      002292 R
  5 SPIRD      00229C R   |   5 SPISEL     002287 R   |   5 SPIWR      00227D R
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
  5 STEP       002274 R   |   5 STOP       00226B R   |     STREND  =  00000A 
    STRING  =  000002     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TEST    =  000000     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      002261 R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    00224B R   |   5 TIMER      002257 R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  000001 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000004     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000005     |   5 TO         002244 R
  5 TONE       00223B R   |   5 Timer4Up   000037 R   |     U8      =  000003 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR4=  000004     |     UART_CR4=  000006     |     UART_CR4=  000005 
    UART_CR5=  000008     |     UART_CR5=  000003     |     UART_CR5=  000001 
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002230 R
  5 UBTN_Han   00007A R   |   5 UFLASH     002225 R   |   5 UNTIL      00221B R
    US      =  00001F     |   5 USER_ABO   000082 R   |     USE_BLOC=  000000 
  5 USR        002213 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 Uart1RxH   00000F R   |   5 UserButt   00004D R
    VAR_ADDR=  000006     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       00220A R   |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      002200 R
  5 WRITE      0021F6 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        0021EE R
  5 XPEEK      0021E4 R   |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000003     |   5 abs        001CF4 R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   000AC6 R
  5 add        000E5B R   |   5 add_char   0013B0 R   |   5 analog_r   0017B7 R
  5 ansi_seq   000A88 R   |   5 arduino_   001DDF R   |   5 arg_list   000F97 R
  1 array_si   000022 R   |   5 ascii      001BA7 R   |   5 at_tst     000CCD R
  5 atoi24     000DDE R   |   5 atoi_exi   000E44 R   |   5 autorun    001C30 R
  5 autorun_   0005EC R   |   5 awu        001CA5 R   |   5 awu02      001CAF R
  5 bad_port   001BFF R   |   1 base       00000A R   |   1 basicptr   000004 R
  5 beep       00173F R   |   5 bin_exit   000BAB R   |   5 bit_and    001D08 R
  5 bit_or     001D20 R   |   5 bit_rese   001508 R   |   5 bit_set    0014F8 R
  5 bit_test   001529 R   |   5 bit_togg   001519 R   |   5 bit_xor    001D38 R
  5 bitmask    001F4B R   |   5 bkslsh_t   000C7A R   |   5 bksp       0001E1 R
  5 break_po   001884 R   |   5 bye        001C27 R   |   5 cancel_a   0005B4 R
  5 char       001B95 R   |   5 clear_ba   000601 R   |   5 clear_va   000481 R
  5 clock_in   00009D R   |   5 cmd_end    00172B R   |   5 cmd_line   00081F R
  5 cmd_name   000F06 R   |   5 cmp_name   0018F7 R   |   5 cold_sta   0004EF R
  5 colon_ts   000CA1 R   |   5 comma_ts   000CAC R   |   5 comp_msg   000775 R
  5 compile    00040E R   |   5 const_cr   001FFF R   |   5 const_cr   002005 R
  5 const_dd   001FF9 R   |   5 const_ee   002017 R   |   5 const_id   001FF3 R
  5 const_in   002011 R   |   5 const_od   001FED R   |   5 const_ou   00200B R
  5 const_po   001FB7 R   |   5 const_po   001FBD R   |   5 const_po   001FC3 R
  5 const_po   001FC9 R   |   5 const_po   001FCF R   |   5 const_po   001FD5 R
  5 const_po   001FDB R   |   5 const_po   001FE1 R   |   5 const_po   001FE7 R
  5 convert_   000B22 R   |   5 copy_com   000D02 R   |   1 count      000003 R
  5 cp_loop    000F46 R   |   5 create_g   000375 R   |   5 cs_high    0021A7 R
  5 cstk_pro   001145 R   |   5 dash_tst   000CC2 R   |   5 data       00201D R
  1 data_len   000009 R   |   5 data_lin   002023 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   002063 R   |   5 dec_base   001171 R
  5 del_back   000AB7 R   |   5 del_line   000348 R   |   5 del_ln     000AA8 R
  5 delete     0001F1 R   |   5 digital_   0017EB R   |   5 digital_   00181B R
  5 dir_loop   001AD4 R   |   5 director   001AC8 R   |   5 divide     000EB1 R
  5 divu24_8   0009D9 R   |   5 do_loop    001F74 R   |   5 drive_fr   001B51 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

  5 enable_i   001EF5 R   |   5 eql_tst    000D57 R   |   5 equal      0013C3 R
  5 err_bad_   0006E1 R   |   5 err_buf_   000757 R   |   5 err_cmd_   0006A5 R
  5 err_div0   00066A R   |   5 err_dupl   0006BF R   |   5 err_math   000651 R
  5 err_mem_   000636 R   |   5 err_msg    000616 R   |   5 err_no_a   0006ED R
  5 err_no_d   000720 R   |   5 err_no_f   000744 R   |   5 err_no_l   000679 R
  5 err_no_p   000730 R   |   5 err_not_   0006D0 R   |   5 err_run_   00068F R
  5 err_synt   000643 R   |   5 escaped    000B37 R   |   5 expect     000F85 R
  5 expr_exi   0010D1 R   |   5 expressi   001090 R   |   5 factor     000FE7 R
  1 farptr     000017 R   |   5 fcpu       001D82 R   |   7 fdrive     010000 R
  1 ffree      00001A R   |   5 file_cou   001B49 R   |   5 file_rec   0021AC R
  5 file_tra   0021E1 R   |   5 final_te   000A82 R   |   5 first_li   0011F6 R
  1 flags      000024 R   |   5 for        0015A0 R   |   5 forget     001A83 R
  1 free_ram   00005B R   |   5 fsize_ms   0021D0 R   |   5 func_arg   000F92 R
  5 func_not   001EE8 R   |   5 ge         0013C5 R   |   5 get_arra   000FC2 R
  5 get_targ   00166A R   |   5 get_tick   001CEE R   |   5 get_toke   000C13 R
  5 getc       0001CD R   |   5 gosub      00169B R   |   5 goto       001680 R
  5 gpio       001BDA R   |   5 gt         0013C1 R   |   5 gt_tst     000D62 R
  5 hex_base   00116C R   |   5 hex_dump   000279 R   |   5 if         00158C R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   0018AC R   |   5 input_ex   0014CA R   |   5 input_lo   001463 R
  5 input_va   001461 R   |   5 insert_l   0003A1 R   |   5 insert_l   00040B R
  5 interp_l   000860 R   |   5 interpre   00083B R   |   5 invert     001F65 R
  5 is_alpha   00048F R   |   5 is_digit   0004A0 R   |   5 itoa       000992 R
  5 itoa_loo   0009AA R   |   5 jp_to_ta   00168E R   |   5 key        001BC7 R
  5 kw_loop    000BC7 R   |   5 kword_di   002588 R   |   5 kword_en   0021E2 R
  5 le         0013CA R   |   5 leading_   001F3B R   |   5 left_arr   000A88 R
  5 let        0011A2 R   |   5 let_arra   0011B0 R   |   5 let_var    0011B3 R
  5 lines_sk   0011F9 R   |   5 list       0011CD R   |   5 list_exi   00123F R
  5 list_sta   001219 R   |   5 load       001A53 R   |   5 load_aut   0005C3 R
  5 load_fil   001A22 R   |   5 log2       001F30 R   |   5 logical_   001EDE R
  5 loop_bac   00164D R   |   1 loop_dep   000021 R   |   5 loop_don   001662 R
  5 lshift     001D50 R   |   5 lt         0013C8 R   |   5 lt_tst     000D8B R
  5 modulo     000EF5 R   |   5 move       0002E2 R   |   5 move_dow   000300 R
  5 move_exi   000321 R   |   5 move_loo   000305 R   |   5 move_up    0002F2 R
  5 mul_char   0013B2 R   |   5 multiply   000E69 R   |   5 mulu24_8   000A01 R
  5 nbr_tst    000C46 R   |   5 ne         0013CD R   |   5 neg_acc2   000A3B R
  5 new        0018A2 R   |   5 next       001620 R   |   5 next_lin   000843 R
  5 next_tok   000887 R   |   5 no_match   000F58 R   |   5 other      000DB4 R
  3 pad        0016E0 R   |   1 par_leve   00000E R   |   5 parse_bi   000B89 R
  5 parse_in   000B3F R   |   5 parse_ke   000BC6 R   |   5 parse_qu   000AEA R
  5 pause      001C92 R   |   5 pause02    001C9C R   |   5 peek       00155F R
  5 pin_mode   001D8E R   |   5 plus_tst   000D2B R   |   5 poke       001550 R
  5 power_ad   00177B R   |   5 prcnt_ts   000D4C R   |   5 print      0013D0 R
  5 print_ex   001435 R   |   5 print_in   00092D R   |   5 print_ty   001441 R
  5 prt_basi   00129A R   |   5 prt_cmd_   001242 R   |   5 prt_loop   0013D4 R
  5 prt_quot   001256 R   |   5 prt_tok    00020B R   |   5 prti24     0008E5 R
  1 ptr16      000018 R   |   1 ptr8       000019 R   |   5 putc       0001C4 R
  5 puts       0001D7 R   |   5 qkey       001BCF GR  |   5 qmark_ts   000CD8 R
  5 random     001DFF R   |   5 read       00209B R   |   5 read01     00209D R
  5 readln     000A5E R   |   5 readln_l   000A66 R   |   5 readln_q   000ADB R
  5 refresh_   001F2B R   |   5 rel_exit   001128 R   |   5 relation   0010D4 R
  5 relop_st   0013B5 R   |   5 remark     0014CD R   |   5 reprint    000A88 R
  5 reset_co   0013D2 R   |   5 rest_con   001451 R   |   5 restore    002050 R
  5 return     0016BB R   |   5 right_ar   000A88 R   |   5 row_loop   00025C R
  5 rparnt_t   000C96 R   |   5 rshift     001D69 R   |   5 rt_msg     000764 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

  5 run        0016D9 R   |   5 run_it     001704 R   |   1 rx_char    000026 R
  5 save       001963 R   |   5 save_con   001441 R   |   5 search_d   000F38 R
  5 search_e   000F82 R   |   5 search_f   001918 R   |   5 search_l   000324 R
  5 search_l   00032C R   |   5 search_n   000F3C R   |   1 seedx      000013 R
  1 seedy      000015 R   |   5 seek_fdr   0018BA R   |   5 select_p   001DCF R
  5 set_time   001ECC R   |   5 sharp_ts   000CB7 R   |   5 show       00112B R
  5 show_row   00024A R   |   5 single_c   0013AB R   |   5 size       001176 R
  5 skip       000E48 R   |   5 slash_ts   000D41 R   |   5 sleep      001C87 R
  5 software   0004A9 R   |   5 spaces     0001FF R   |   5 spi_clea   002140 R
  5 spi_disa   002128 R   |   5 spi_enab   0020F5 R   |   5 spi_rcv_   002162 R
  5 spi_read   00218D R   |   5 spi_sele   002195 R   |   5 spi_send   00214C R
  5 spi_writ   00216D R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000D36 R   |   5 step       0015F9 R   |   5 stop       001856 R
  5 store_lo   00160D R   |   5 str_matc   000F65 R   |   5 str_tst    000C36 R
  5 strcmp     0002C3 R   |   5 strcpy     0002D4 R   |   5 strlen     0002B6 R
  5 substrac   000E63 R   |   5 syntax_e   000795 R   |   1 tab_widt   000025 R
  5 tb_error   000797 R   |   5 term       001041 R   |   5 term01     00104A R
  5 term_exi   00108D R   |   3 tib        001690 R   |   5 tick_tst   000CF0 R
  1 ticks      00000F R   |   5 timeout    001EDB R   |   1 timer      000011 R
  5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R   |   5 tk_id      000785 R
  5 to         0015C9 R   |   5 to_upper   000DD2 GR  |   5 token_ch   000DCB R
  5 token_ex   000DCF R   |   5 token_ms   000242 R   |   5 tone       001732 R
  5 try_next   00208B R   |   1 txtbgn     00001D R   |   1 txtend     00001F R
  5 uart1_in   000189 R   |   5 uart1_se   000199 R   |   5 ubound     001180 R
  5 uflash     001C04 R   |   5 unlock_e   0000D5 R   |   5 unlock_f   0000E3 R
  5 until      001F89 R   |   5 user_int   000060 R   |   5 user_spa   002600 R
  5 usr        001C0A R   |   5 var_name   001292 R   |   1 vars       000027 R
  5 wait       0014D3 R   |   5 warm_ini   000596 R   |   5 warm_sta   00081C R
  5 words      001E66 R   |   5 words_co   001EB6 R   |   5 write      001B5E R
  5 write_bl   000166 R   |   5 write_by   0000F1 R   |   5 write_ee   00012D R
  5 write_ex   000161 R   |   5 write_fl   000117 R   |   5 xpeek      001570 R
    xreceive   ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5B   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   260E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

