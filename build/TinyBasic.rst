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
      00810F CD 95 5A         [ 4]  264 	call prt_basic_line
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
      0082F7 CD 9A 6B         [ 4]  604 	call incr_farptr
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
      008384 CD 8A 48         [ 4]  712 	call print_int 
      008387 A6 20            [ 1]  713 	ld a,#SPACE
      008389 CD 83 40         [ 4]  714 	call putc 
      00838C 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      00838E CD 8A 48         [ 4]  716 	call print_int 
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
      0083B4 CD 8A 48         [ 4]  748 	call print_int 
      0083B7 A6 20            [ 1]  749 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  750 	call putc
      0083BC                        751 row_loop:
      0083BC 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  753 	ld a,(x)
      0083BF 5F               [ 1]  754 	clrw x 
      0083C0 97               [ 1]  755 	ld xl,a 
      0083C1 CD 8A 48         [ 4]  756 	call print_int 
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
      008584 CD 8C 6C         [ 4] 1117 	call get_token
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
      0085A8 CD 8C 6C         [ 4] 1132 	call get_token 
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
      0086BF CD 8A 58         [ 4] 1278 	call prti24 
      0086C2 A6 2E            [ 1] 1279 	ld a,#'.
      0086C4 CD 83 40         [ 4] 1280 	call putc 
      0086C7 A6 00            [ 1] 1281 	ld a,#MINOR 
      0086C9 C7 00 0E         [ 1] 1282 	ld acc8,a 
      0086CC 5F               [ 1] 1283 	clrw x 
      0086CD CF 00 0C         [ 2] 1284 	ldw acc24,x 
      0086D0 CD 8A 58         [ 4] 1285 	call prti24
      0086D3 A6 0D            [ 1] 1286 	ld a,#CR 
      0086D5 CD 83 40         [ 4] 1287 	call putc
      0086D8 CD 9A 79         [ 4] 1288 	call seek_fdrive 
      0086DB 9A               [ 1] 1289 	rim 
      0086DC 72 5C 00 16      [ 1] 1290 	inc seedy+1 
      0086E0 72 5C 00 14      [ 1] 1291 	inc seedx+1 
      0086E4 CD 87 65         [ 4] 1292 	call clear_basic
      0086E7 CD 92 86         [ 4] 1293 	call ubound 
                                   1294 ;	jra 2$	
      0086EA CD 98 C7         [ 4] 1295 	call beep_1khz  
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
      00872F CD 9A DF         [ 4] 1337 	call search_file
      008732 25 05            [ 1] 1338 	jrc 2$ 
                                   1339 ; if file doesn't exit
      008734 CD 87 18         [ 4] 1340 	call cancel_autorun
      008737 20 16            [ 2] 1341 	jra 9$ 
      008739 CD 9B F8         [ 4] 1342 2$:	call load_file
      00873C AE 40 00         [ 2] 1343 	ldw x,#AUTORUN_NAME 
      00873F CD A8 C0         [ 4] 1344 	call puts
      008742 AE 87 50         [ 2] 1345 	ldw x,#autorun_msg 
      008745 CD A8 C0         [ 4] 1346 	call puts 
      008748 72 1C 00 24      [ 1] 1347 	bset flags,#FAUTORUN 
      00874C CC 98 99         [ 2] 1348 	jp run_it    
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
      0088F9 CD 14 DA         [ 4] 1412 	call prt_basic_line
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
      008924 02 CD 95 5A      [ 1] 1434 	rlc acc16  
      008928 AE 88 E9         [ 1] 1435 	ld acc8, a 
      00892B CD A8 C0 C6      [ 2] 1436 	addw x,acc16 
      00892F 00               [ 2] 1437 	ldw x,(x)
      008930 03 5F 97         [ 4] 1438 	call puts
      008933 72 BB 00         [ 2] 1439 	ldw x,#tib
      008936 05 F6 5F         [ 4] 1440 	call puts 
      008939 97 CD            [ 1] 1441 	ld a,#CR 
      00893B 8A 48 72         [ 4] 1442 	call putc
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
      00899E E4 12 36         [ 4] 1505 	call let_array 
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
      0089CA DC A1 80         [ 4] 1542 	ld a,([in.w],y)
      0089CD 26 03 FD 20      [ 1] 1543 	inc in 
      0089D1 F2               [ 1] 1544 	exg a,xl  
      0089D2 A6 03            [ 1] 1545 	ld a,#TK_CHAR
      0089D2 A1               [ 4] 1546 	ret
      0089D3 85 26            [ 1] 1547 2$:	cp a,#TK_QSTR 
      0089D5 05 CD            [ 1] 1548 	jrne 9$
      0089D7 92               [ 1] 1549 	ldw x,y 
      0089D8 B9 20 E9 00      [ 2] 1550 	addw x,in.w ; pointer to string 
                                   1551 ; move pointer after string 
      0089DB 91 6D 00         [ 4] 1552 3$:	tnz ([in.w],y)
      0089DB A1 06            [ 1] 1553 	jreq 8$
      0089DD 26 05 CD 92      [ 1] 1554 	inc in 
      0089E1 B6 20            [ 2] 1555 	jra 3$
      0009B3                       1556 6$: 
      0089E3 E0 DE 00         [ 5] 1557 	ldw y,([in.w],y)
      0089E4 51               [ 1] 1558 	exgw x,y
      0089E4 A1 01            [ 1] 1559 	cp a,#TK_INTGR
      0089E6 27 DC            [ 1] 1560 	jrpl 7$
      0089E8 CC 88 F9         [ 2] 1561 	addw x,#code_addr
      0089EB FE               [ 2] 1562 	ldw x,(x) 
      0089EB 5F C6 00 02      [ 1] 1563 7$:	inc in
      0089EF C0 00 04 2B      [ 1] 1564 8$:	inc in 
      0009C7                       1565 9$: 
      0089F3 01               [ 4] 1566 	ret	
                                   1567 
                                   1568 ;-----------------------------------
                                   1569 ; print a 16 bit integer 
                                   1570 ; using variable 'base' as conversion
                                   1571 ; format.
                                   1572 ; input:
                                   1573 ;   X       integer to print 
                                   1574 ;   'base'    conversion base 
                                   1575 ; output:
                                   1576 ;   none 
                                   1577 ;-----------------------------------
      0009C8                       1578 print_int:
      0089F4 81 5F 00 0B      [ 1] 1579 	clr acc24 
      0089F5 CF 00 0C         [ 2] 1580 	ldw acc16,x 
      0089F5 55 00 02 00 03   [ 2] 1581 	btjf acc16,#7,prti24
      0089FA 90 CE 00 05      [ 1] 1582 	cpl acc24 
                                   1583 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1584 ;------------------------------------
                                   1585 ; print integer in acc24 
                                   1586 ; input:
                                   1587 ;	acc24 		integer to print 
                                   1588 ;	'base' 		numerical base for conversion 
                                   1589 ;   'tab_width' field width 
                                   1590 ;  output:
                                   1591 ;    A          string length
                                   1592 ;------------------------------------
      0009D8                       1593 prti24:
      0089FE 91 D6 01         [ 4] 1594     call itoa  ; conversion entier en  .asciz
      008A01 72 5C 00         [ 4] 1595 	call right_align  
      008A04 02               [ 1] 1596 	push a 
      008A05 4D 2B 2B         [ 4] 1597 	call puts
      008A08 A1               [ 1] 1598 	pop a 
      008A09 06               [ 4] 1599     ret	
                                   1600 
                                   1601 ;------------------------------------
                                   1602 ; convert integer in acc24 to string
                                   1603 ; input:
                                   1604 ;   'base'	conversion base 
                                   1605 ;	acc24	integer to convert
                                   1606 ; output:
                                   1607 ;   X  		pointer to first char of string
                                   1608 ;   A       string length
                                   1609 ;------------------------------------
                           000001  1610 	SIGN=1  ; integer sign 
                           000002  1611 	LEN=2 
                           000003  1612 	PSTR=3
                           000004  1613 	VSIZE=4 ;locals size
      0009E4                       1614 itoa:
      0009E4                       1615 	_vars VSIZE
      008A0A 2A 3B            [ 2]    1     sub sp,#VSIZE 
      008A0C A1 01            [ 1] 1616 	clr (LEN,sp) ; string length  
      008A0E 27 37            [ 1] 1617 	clr (SIGN,sp)    ; sign
      008A10 C6 00 0A         [ 1] 1618 	ld a,base 
      008A10 A1 03            [ 1] 1619 	cp a,#10
      008A12 26 0B            [ 1] 1620 	jrne 1$
                                   1621 	; base 10 string display with negative sign if bit 23==1
      008A14 91 D6 01 72 5C   [ 2] 1622 	btjf acc24,#7,1$
      008A19 00 02            [ 1] 1623 	cpl (SIGN,sp)
      008A1B 41 A6 03         [ 4] 1624 	call neg_acc24
      0009FB                       1625 1$:
                                   1626 ; initialize string pointer 
      008A1E 81 A1 02         [ 2] 1627 	ldw x,#tib 
      008A21 26 24 93         [ 2] 1628 	addw x,#TIB_SIZE
      008A24 72               [ 2] 1629 	decw x 
      008A25 BB               [ 1] 1630 	clr (x)
      000A03                       1631 itoa_loop:
      008A26 00 01 91         [ 1] 1632     ld a,base
      008A29 6D 01            [ 2] 1633 	ldw (PSTR,sp),x 
      008A2B 27 16 72         [ 4] 1634     call divu24_8 ; acc24/A 
      008A2E 5C 00            [ 2] 1635 	ldw x,(PSTR,sp)
      008A30 02 20            [ 1] 1636     add a,#'0  ; remainder of division
      008A32 F5 3A            [ 1] 1637     cp a,#'9+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A33 2B 02            [ 1] 1638     jrmi 2$
      008A33 91 DE            [ 1] 1639     add a,#7 
      000A15                       1640 2$:	
      008A35 01               [ 2] 1641 	decw x
      008A36 51               [ 1] 1642     ld (x),a
      008A37 A1 84            [ 1] 1643 	inc (LEN,sp)
                                   1644 	; if acc24==0 conversion done
      008A39 2A 04 1C         [ 1] 1645 	ld a,acc24
      008A3C A7 3D FE         [ 1] 1646 	or a,acc16
      008A3F 72 5C 00         [ 1] 1647 	or a,acc8
      008A42 02 72            [ 1] 1648     jrne itoa_loop
                                   1649 	;conversion done, next add '$' or '-' as required
      008A44 5C 00 02         [ 1] 1650 	ld a,base 
      008A47 A1 10            [ 1] 1651 	cp a,#16
      008A47 81 08            [ 1] 1652 	jreq 8$
      008A48 7B 01            [ 1] 1653 	ld a,(SIGN,sp)
      008A48 72 5F            [ 1] 1654     jreq 10$
      008A4A 00 0C            [ 1] 1655     ld a,#'-
      008A4C CF 00            [ 2] 1656 	jra 9$ 
      008A4E 0D 72            [ 1] 1657 8$: ld a,#'$ 
      008A50 0F               [ 2] 1658 9$: decw x
      008A51 00               [ 1] 1659     ld (x),a
      008A52 0D 04            [ 1] 1660 	inc (LEN,sp)
      000A39                       1661 10$:
      008A54 72 53            [ 1] 1662 	ld a,(LEN,sp)
      000A3B                       1663 	_drop VSIZE
      008A56 00 0C            [ 2]    1     addw sp,#VSIZE 
      008A58 81               [ 4] 1664 	ret
                                   1665 
                                   1666 ;-------------------------------------
                                   1667 ; divide uint24_t by uint8_t
                                   1668 ; used to convert uint24_t to string
                                   1669 ; input:
                                   1670 ;	acc24	dividend
                                   1671 ;   A 		divisor
                                   1672 ; output:
                                   1673 ;   acc24	quotient
                                   1674 ;   A		remainder
                                   1675 ;------------------------------------- 
                                   1676 ; offset  on sp of arguments and locals
                           000001  1677 	U8   = 1   ; divisor on stack
                           000001  1678 	VSIZE =1
      000A3E                       1679 divu24_8:
      008A58 CD               [ 2] 1680 	pushw x ; save x
      008A59 8A               [ 1] 1681 	push a 
                                   1682 	; ld dividend UU:MM bytes in X
      008A5A 64 CD 93         [ 1] 1683 	ld a, acc24
      008A5D 76               [ 1] 1684 	ld xh,a
      008A5E 88 CD A8         [ 1] 1685 	ld a,acc24+1
      008A61 C0               [ 1] 1686 	ld xl,a
      008A62 84 81            [ 1] 1687 	ld a,(U8,SP) ; divisor
      008A64 62               [ 2] 1688 	div x,a ; UU:MM/U8
      008A64 52               [ 1] 1689 	push a  ;save remainder
      008A65 04               [ 1] 1690 	ld a,xh
      008A66 0F 02 0F         [ 1] 1691 	ld acc24,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A69 01               [ 1] 1692 	ld a,xl
      008A6A C6 00 0B         [ 1] 1693 	ld acc24+1,a
      008A6D A1               [ 1] 1694 	pop a
      008A6E 0A               [ 1] 1695 	ld xh,a
      008A6F 26 0A 72         [ 1] 1696 	ld a,acc24+2
      008A72 0F               [ 1] 1697 	ld xl,a
      008A73 00 0C            [ 1] 1698 	ld a,(U8,sp) ; divisor
      008A75 05               [ 2] 1699 	div x,a  ; R:LL/U8
      008A76 03 01            [ 1] 1700 	ld (U8,sp),a ; save remainder
      008A78 CD               [ 1] 1701 	ld a,xl
      008A79 8B 20 0D         [ 1] 1702 	ld acc24+2,a
      008A7B 84               [ 1] 1703 	pop a
      008A7B AE               [ 2] 1704 	popw x
      008A7C 16               [ 4] 1705 	ret
                                   1706 
                                   1707 ;--------------------------------------
                                   1708 ; unsigned multiply uint24_t by uint8_t
                                   1709 ; use to convert numerical string to uint24_t
                                   1710 ; input:
                                   1711 ;	acc24	uint24_t 
                                   1712 ;   A		uint8_t
                                   1713 ; output:
                                   1714 ;   acc24   A*acc24
                                   1715 ;-------------------------------------
                                   1716 ; local variables offset  on sp
                           000003  1717 	U8   = 3   ; A pushed on stack
                           000002  1718 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1719 	OVFH = 1  ; multiplication overflow high byte
                           000003  1720 	VSIZE = 3
      000A66                       1721 mulu24_8:
      008A7D 90               [ 2] 1722 	pushw x    ; save X
                                   1723 	; local variables
      008A7E 1C               [ 1] 1724 	push a     ; U8
      008A7F 00               [ 1] 1725 	clrw x     ; initialize overflow to 0
      008A80 50               [ 2] 1726 	pushw x    ; multiplication overflow
                                   1727 ; multiply low byte.
      008A81 5A 7F 0D         [ 1] 1728 	ld a,acc24+2
      008A83 97               [ 1] 1729 	ld xl,a
      008A83 C6 00            [ 1] 1730 	ld a,(U8,sp)
      008A85 0B               [ 4] 1731 	mul x,a
      008A86 1F               [ 1] 1732 	ld a,xl
      008A87 03 CD 8A         [ 1] 1733 	ld acc24+2,a
      008A8A BE               [ 1] 1734 	ld a, xh
      008A8B 1E 03            [ 1] 1735 	ld (OVFL,sp),a
                                   1736 ; multipy middle byte
      008A8D AB 30 A1         [ 1] 1737 	ld a,acc24+1
      008A90 3A               [ 1] 1738 	ld xl,a
      008A91 2B 02            [ 1] 1739 	ld a, (U8,sp)
      008A93 AB               [ 4] 1740 	mul x,a
                                   1741 ; add overflow to this partial product
      008A94 07 FB 01         [ 2] 1742 	addw x,(OVFH,sp)
      008A95 9F               [ 1] 1743 	ld a,xl
      008A95 5A F7 0C         [ 1] 1744 	ld acc24+1,a
      008A98 02               [ 1] 1745 	clr a
      008A99 C6 00            [ 1] 1746 	adc a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A9B 0C CA            [ 1] 1747 	ld (OVFH,sp),a
      008A9D 00               [ 1] 1748 	ld a,xh
      008A9E 0D CA            [ 1] 1749 	ld (OVFL,sp),a
                                   1750 ; multiply most signficant byte	
      008AA0 00 0E 26         [ 1] 1751 	ld a, acc24
      008AA3 DF               [ 1] 1752 	ld xl, a
      008AA4 C6 00            [ 1] 1753 	ld a, (U8,sp)
      008AA6 0B               [ 4] 1754 	mul x,a
      008AA7 A1 10 27         [ 2] 1755 	addw x, (OVFH,sp)
      008AAA 08               [ 1] 1756 	ld a, xl
      008AAB 7B 01 27         [ 1] 1757 	ld acc24,a
      008AAE 0A A6            [ 2] 1758     addw sp,#VSIZE
      008AB0 2D               [ 2] 1759 	popw x
      008AB1 20               [ 4] 1760 	ret
                                   1761 
                                   1762 ;------------------------------------
                                   1763 ;  two's complement acc24
                                   1764 ;  input:
                                   1765 ;		acc24 variable
                                   1766 ;  output:
                                   1767 ;		acc24 variable
                                   1768 ;-------------------------------------
      000AA0                       1769 neg_acc24:
      008AB2 02 A6 24 5A      [ 1] 1770 	cpl acc24+2
      008AB6 F7 0C 02 0C      [ 1] 1771 	cpl acc24+1
      008AB9 72 53 00 0B      [ 1] 1772 	cpl acc24
      008AB9 7B 02            [ 1] 1773 	ld a,#1
      008ABB 5B 04 81         [ 1] 1774 	add a,acc24+2
      008ABE C7 00 0D         [ 1] 1775 	ld acc24+2,a
      008ABE 89               [ 1] 1776 	clr a
      008ABF 88 C6 00         [ 1] 1777 	adc a,acc24+1
      008AC2 0C 95 C6         [ 1] 1778 	ld acc24+1,a 
      008AC5 00               [ 1] 1779 	clr a 
      008AC6 0D 97 7B         [ 1] 1780 	adc a,acc24 
      008AC9 01 62 88         [ 1] 1781 	ld acc24,a 
      008ACC 9E               [ 4] 1782 	ret
                                   1783 
                                   1784 
                                   1785 
                                   1786 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1787 ;; compiler routines        ;;
                                   1788 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1789 ;------------------------------------
                                   1790 ; parse quoted string 
                                   1791 ; input:
                                   1792 ;   Y 	pointer to tib 
                                   1793 ;   X   pointer to output buffer 
                                   1794 ; output:
                                   1795 ;	buffer   parsed string
                                   1796 ;------------------------------------
                           000001  1797 	PREV = 1
                           000002  1798 	CURR =2
                           000002  1799 	VSIZE=2
      000AC3                       1800 parse_quote: 
      000AC3                       1801 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008ACD C7 00            [ 2]    1     sub sp,#VSIZE 
      008ACF 0C               [ 1] 1802 	clr a
      008AD0 9F C7            [ 1] 1803 1$:	ld (PREV,sp),a 
      000AC8                       1804 2$:	
      008AD2 00 0D 84         [ 4] 1805 	ld a,([in.w],y)
      008AD5 95 C6            [ 1] 1806 	jreq 6$
      008AD7 00 0E 97 7B      [ 1] 1807 	inc in 
      008ADB 01 62            [ 1] 1808 	ld (CURR,sp),a 
      008ADD 6B 01            [ 1] 1809 	ld a,#'\
      008ADF 9F C7            [ 1] 1810 	cp a, (PREV,sp)
      008AE1 00 0E            [ 1] 1811 	jrne 3$
      008AE3 84 85            [ 1] 1812 	clr (PREV,sp)
      008AE5 81 02            [ 1] 1813 	ld a,(CURR,sp)
      008AE6 AD 1C            [ 4] 1814 	callr convert_escape
      008AE6 89               [ 1] 1815 	ld (x),a 
      008AE7 88               [ 2] 1816 	incw x 
      008AE8 5F 89            [ 2] 1817 	jra 2$
      000AE3                       1818 3$:
      008AEA C6 00            [ 1] 1819 	ld a,(CURR,sp)
      008AEC 0E 97            [ 1] 1820 	cp a,#'\'
      008AEE 7B 03            [ 1] 1821 	jreq 1$
      008AF0 42 9F            [ 1] 1822 	cp a,#'"
      008AF2 C7 00            [ 1] 1823 	jreq 6$ 
      008AF4 0E               [ 1] 1824 	ld (x),a 
      008AF5 9E               [ 2] 1825 	incw x 
      008AF6 6B 02            [ 2] 1826 	jra 2$
      000AF1                       1827 6$:
      008AF8 C6               [ 1] 1828 	clr (x)
      008AF9 00               [ 2] 1829 	incw x 
      008AFA 0D 97            [ 1] 1830 	ldw y,x 
      008AFC 7B               [ 1] 1831 	clrw x 
      008AFD 03 42            [ 1] 1832 	ld a,#TK_QSTR  
      000AF8                       1833 	_drop VSIZE
      008AFF 72 FB            [ 2]    1     addw sp,#VSIZE 
      008B01 01               [ 4] 1834 	ret 
                                   1835 
                                   1836 ;---------------------------------------
                                   1837 ; called by parse_quote
                                   1838 ; subtitute escaped character 
                                   1839 ; by their ASCII value .
                                   1840 ; input:
                                   1841 ;   A  character following '\'
                                   1842 ; output:
                                   1843 ;   A  substitued char or same if not valid.
                                   1844 ;---------------------------------------
      000AFB                       1845 convert_escape:
      008B02 9F               [ 2] 1846 	pushw x 
      008B03 C7 00 0D         [ 2] 1847 	ldw x,#escaped 
      008B06 4F               [ 1] 1848 1$:	cp a,(x)
      008B07 A9 00            [ 1] 1849 	jreq 2$
      008B09 6B               [ 1] 1850 	tnz (x)
      008B0A 01 9E            [ 1] 1851 	jreq 3$
      008B0C 6B               [ 2] 1852 	incw x 
      008B0D 02 C6            [ 2] 1853 	jra 1$
      008B0F 00 0C 97         [ 2] 1854 2$: subw x,#escaped 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B12 7B               [ 1] 1855 	ld a,xl 
      008B13 03 42            [ 1] 1856 	add a,#7
      008B15 72               [ 2] 1857 3$:	popw x 
      008B16 FB               [ 4] 1858 	ret 
                                   1859 
      008B17 01 9F C7 00 0C 5B 03  1860 escaped: .asciz "abtnvfr"
             85
                                   1861 
                                   1862 ;-------------------------
                                   1863 ; integer parser 
                                   1864 ; input:
                                   1865 ;   X 		point to output buffer  
                                   1866 ;   Y 		point to tib 
                                   1867 ;   A 	    first digit|'$' 
                                   1868 ; output:  
                                   1869 ;   X 		integer 
                                   1870 ;   A 		TK_INTGR
                                   1871 ;   acc24   24 bits integer 
                                   1872 ;-------------------------
                           000001  1873 	BASE=1
                           000002  1874 	TCHAR=2 
                           000003  1875 	XSAVE=3
                           000004  1876 	VSIZE=4 
      000B18                       1877 parse_integer: ; { -- n }
      008B1F 81               [ 2] 1878 	pushw x 	
      008B20 4B 00            [ 1] 1879 	push #0 ; TCHAR
      008B20 72 53            [ 1] 1880 	push #10 ; BASE=10
      008B22 00 0E            [ 1] 1881 	cp a,#'$
      008B24 72 53            [ 1] 1882 	jrne 2$ 
      000B21                       1883     _drop #1
      008B26 00 0D            [ 2]    1     addw sp,##1 
      008B28 72 53            [ 1] 1884 	push #16  ; BASE=16
      008B2A 00               [ 1] 1885 2$:	ld (x),a 
      008B2B 0C               [ 2] 1886 	incw x 
      008B2C A6 01 CB         [ 4] 1887 	ld a,([in.w],y)
      008B2F 00 0E C7 00      [ 1] 1888 	inc in 
      008B33 0E 4F C9         [ 4] 1889 	call to_upper 
      008B36 00 0D            [ 1] 1890 	ld (TCHAR,sp),a 
      008B38 C7 00 0D         [ 4] 1891 	call is_digit 
      008B3B 4F C9            [ 1] 1892 	jrc 2$
      008B3D 00 0C            [ 1] 1893 	ld a,#16 
      008B3F C7 00            [ 1] 1894 	cp a,(BASE,sp)
      008B41 0C 81            [ 1] 1895 	jrne 3$ 
      008B43 7B 02            [ 1] 1896 	ld a,(TCHAR,sp)
      008B43 52 02            [ 1] 1897 	cp a,#'A 
      008B45 4F 6B            [ 1] 1898 	jrmi 3$ 
      008B47 01 47            [ 1] 1899 	cp a,#'G 
      008B48 2B DD            [ 1] 1900 	jrmi 2$ 
      008B48 91 D6 01 27      [ 1] 1901 3$: dec in 	
      008B4C 24               [ 1] 1902     clr (x)
      008B4D 72 5C            [ 2] 1903 	ldw x,(XSAVE,sp)
      008B4F 00 02 6B         [ 4] 1904 	call atoi24
      008B52 02 A6            [ 1] 1905 	ldw y,x 
      008B54 5C 11 01         [ 2] 1906 	ldw x,acc16 
      008B57 26 0A            [ 1] 1907 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B59 0F 01            [ 2] 1908 	ldw (y),x 
      008B5B 7B 02 AD 1C      [ 2] 1909 	addw y,#2
      000B5F                       1910 	_drop VSIZE  
      008B5F F7 5C            [ 2]    1     addw sp,#VSIZE 
      008B61 20               [ 4] 1911 	ret 	
                                   1912 
                                   1913 ;-------------------------
                                   1914 ; binary integer parser
                                   1915 ; build integer in acc24  
                                   1916 ; input:
                                   1917 ;   X 		point to output buffer  
                                   1918 ;   Y 		point to tib 
                                   1919 ;   A 	    '&' 
                                   1920 ; output:  
                                   1921 ;   buffer  TK_INTGR integer  
                                   1922 ;   X 		int16 
                                   1923 ;   A 		TK_INTGR
                                   1924 ;   acc24    int24 
                                   1925 ;-------------------------
                           000001  1926 	BINARY=1 ; 24 bits integer 
                           000003  1927 	VSIZE=3
      000B62                       1928 parse_binary: ; { -- n }
      008B62 E5 00            [ 1] 1929 	push #0
      008B63 4B 00            [ 1] 1930 	push #0
      008B63 7B 02            [ 1] 1931 	push #0
      000B68                       1932 2$:	
      008B65 A1 5C 27         [ 4] 1933 	ld a,([in.w],y)
      008B68 DD A1 22 27      [ 1] 1934 	inc in 
      008B6C 04 F7            [ 1] 1935 	cp a,#'0 
      008B6E 5C 20            [ 1] 1936 	jreq 3$
      008B70 D7 31            [ 1] 1937 	cp a,#'1 
      008B71 27 02            [ 1] 1938 	jreq 3$ 
      008B71 7F 5C            [ 2] 1939 	jra bin_exit 
      008B73 90 93            [ 1] 1940 3$: sub a,#'0 
      008B75 5F               [ 1] 1941 	rrc a
      008B76 A6 02            [ 1] 1942 	rlc (BINARY+2,sp) 
      008B78 5B 02            [ 1] 1943 	rlc (BINARY+1,sp)
      008B7A 81 01            [ 1] 1944 	rlc (BINARY,sp) 
      008B7B 20 E4            [ 2] 1945 	jra 2$  
      000B84                       1946 bin_exit:
      008B7B 89 AE 8B 90      [ 1] 1947 	dec in 
      008B7F F1 27            [ 1] 1948 	ldw y,x
      008B81 06 7D            [ 1] 1949 	ld a,(BINARY,sp)
      008B83 27 09 5C         [ 1] 1950 	ld acc24,a 
      008B86 20 F7            [ 2] 1951 	ldw x,(BINARY+1,sp)
      008B88 1D 8B 90         [ 2] 1952 	ldw acc16,x
      008B8B 9F AB            [ 2] 1953 	ldw (y),x 
      008B8D 07 85 81 61      [ 2] 1954 	addw y,#2  
      008B91 62 74            [ 1] 1955 	ld a,#TK_INTGR 	
      000B9C                       1956 	_drop VSIZE 
      008B93 6E 76            [ 2]    1     addw sp,#VSIZE 
      008B95 66               [ 4] 1957 	ret
                                   1958 
                                   1959 ;---------------------------
                                   1960 ;  token begin with a letter,
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1961 ;  is keyword or variable. 	
                                   1962 ; input:
                                   1963 ;   X 		point to pad 
                                   1964 ;   Y 		point to text
                                   1965 ;   A 	    first letter  
                                   1966 ; output:
                                   1967 ;   X		exec_addr|var_addr 
                                   1968 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1969 ;   pad 	keyword|var_name  
                                   1970 ;--------------------------  
                           000001  1971 	XFIRST=1
                           000002  1972 	VSIZE=2
      000B9F                       1973 parse_keyword: 
      008B96 72               [ 2] 1974 	pushw x 
      000BA0                       1975 kw_loop:	
      008B97 00 0D AB         [ 4] 1976 	call to_upper 
      008B98 F7               [ 1] 1977 	ld (x),a 
      008B98 89               [ 2] 1978 	incw x 
      008B99 4B 00 4B         [ 4] 1979 	ld a,([in.w],y)
      008B9C 0A A1 24 26      [ 1] 1980 	inc in 
      008BA0 04 5B 01         [ 4] 1981 	call is_alpha 
      008BA3 4B 10            [ 1] 1982 	jrc kw_loop
      008BA5 F7 5C 91 D6      [ 1] 1983 	dec in   
      008BA9 01               [ 1] 1984 1$: clr (x)
      008BAA 72 5C            [ 2] 1985 	ldw x,(XFIRST,sp) 
      008BAC 00 02            [ 1] 1986 	ld a,(1,x)
      008BAE CD 8E            [ 1] 1987 	jrne 2$
                                   1988 ; one letter variable name 
      008BB0 2B               [ 1] 1989 	ld a,(x) 
      008BB1 6B 02            [ 1] 1990 	sub a,#'A 
      008BB3 CD               [ 1] 1991 	sll a 
      008BB4 85               [ 1] 1992 	push a 
      008BB5 FE 25            [ 1] 1993 	push #0
      008BB7 ED A6 10         [ 2] 1994 	ldw x,#vars 
      008BBA 11 01 26         [ 2] 1995 	addw x,(1,sp) ; X=var address 
      000BC9                       1996 	_drop 2 
      008BBD 0A 7B            [ 2]    1     addw sp,#2 
      008BBF 02 A1            [ 1] 1997 	ld a,#TK_VAR 
      008BC1 41 2B            [ 2] 1998 	jra 4$ 
      000BCF                       1999 2$: ; check for keyword, otherwise syntax error.
      000BCF                       2000 	_ldx_dict kword_dict ; dictionary entry point
      008BC3 04 A1 47         [ 2]    1     ldw x,#kword_dict+2
      008BC6 2B DD            [ 2] 2001 	ldw y,(XFIRST,sp) ; name to search for
      008BC8 72 5A 00         [ 4] 2002 	call search_dict
      008BCB 02               [ 1] 2003 	tnz a
      008BCC 7F 1E            [ 1] 2004 	jrne 4$ 
      008BCE 03 CD 8E         [ 2] 2005 	jp syntax_error
      000BDD                       2006 4$:	
      008BD1 37 90            [ 2] 2007 	ldw y,(XFIRST,sp)
      008BD3 93 CE            [ 1] 2008 	ld (y),a 
      008BD5 00 0D            [ 2] 2009 	incw y 
      008BD7 A6 84            [ 2] 2010 	ldw (y),x
      008BD9 90 FF 72 A9      [ 2] 2011 	addw y,#2  
      000BE9                       2012 	_drop VSIZE 
      008BDD 00 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BDF 5B               [ 4] 2013 	ret  	
                                   2014 
                                   2015 
                                   2016 ;------------------------------------
                                   2017 ; scan text for next token
                                   2018 ; input: 
                                   2019 ;	X 		pointer to buffer where 
                                   2020 ;	        token id and value are copied 
                                   2021 ; use:
                                   2022 ;	Y   pointer to text in tib 
                                   2023 ; output:
                                   2024 ;   A       token attribute 
                                   2025 ;   X 		token value
                                   2026 ;   Y       updated position in output buffer   
                                   2027 ;------------------------------------
                                   2028 	; use to check special character 
                                   2029 	.macro _case c t  
                                   2030 	ld a,#c 
                                   2031 	cp a,(TCHAR,sp) 
                                   2032 	jrne t
                                   2033 	.endm 
                                   2034 
                           000001  2035 	TCHAR=1
                           000002  2036 	ATTRIB=2
                           000002  2037 	VSIZE=2
      000BEC                       2038 get_token: 
      000BEC                       2039 	_vars VSIZE
      008BE0 04 81            [ 2]    1     sub sp,#VSIZE 
                                   2040 ;	ld a,in 
                                   2041 ;	sub a,count
                                   2042 ;   jrmi 0$
                                   2043 ;	clr a 
                                   2044 ;	ret 
      008BE2                       2045 0$: 
      008BE2 4B 00 4B 00      [ 2] 2046 	ldw y,#tib    	
      008BE6 4B 00            [ 1] 2047 	ld a,#SPACE
      008BE8 CD 0E 21         [ 4] 2048 	call skip
      008BE8 91 D6 01 72 5C   [ 1] 2049 	mov in.saved,in 
      008BED 00 02 A1         [ 4] 2050 	ld a,([in.w],y)
      008BF0 30 27            [ 1] 2051 	jrne 1$
      008BF2 06 A1            [ 1] 2052 	ldw y,x 
      008BF4 31 27 02         [ 2] 2053 	jp token_exit ; end of line 
      008BF7 20 0B A0 30      [ 1] 2054 1$:	inc in 
      008BFB 46 09 03         [ 4] 2055 	call to_upper 
      008BFE 09 02            [ 1] 2056 	ld (TCHAR,sp),a 
                                   2057 ; check for quoted string
      000C0F                       2058 str_tst:  	
      000C0F                       2059 	_case '"' nbr_tst
      008C00 09 01            [ 1]    1 	ld a,#'"' 
      008C02 20 E4            [ 1]    2 	cp a,(TCHAR,sp) 
      008C04 26 0A            [ 1]    3 	jrne nbr_tst
      008C04 72 5A            [ 1] 2060 	ld a,#TK_QSTR
      008C06 00               [ 1] 2061 	ld (x),a 
      008C07 02               [ 2] 2062 	incw x 
      008C08 90 93 7B         [ 4] 2063 	call parse_quote
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C0B 01 C7 00         [ 2] 2064 	jp token_exit
      000C1F                       2065 nbr_tst:
                                   2066 ; check for hexadecimal number 
      008C0E 0C 1E            [ 1] 2067 	ld a,#'$'
      008C10 02 CF            [ 1] 2068 	cp a,(TCHAR,sp) 
      008C12 00 0D            [ 1] 2069 	jreq 1$
                                   2070 ;check for binary number 
      008C14 90 FF            [ 1] 2071 	ld a,#'&
      008C16 72 A9            [ 1] 2072 	cp a,(TCHAR,sp)
      008C18 00 02            [ 1] 2073 	jrne 0$
      008C1A A6 84            [ 1] 2074 	ld a,#TK_INTGR
      008C1C 5B               [ 1] 2075 	ld (x),a 
      008C1D 03               [ 2] 2076 	incw x 
      008C1E 81 0B 62         [ 4] 2077 	call parse_binary ; expect binary integer 
      008C1F CC 0D A8         [ 2] 2078 	jp token_exit 
                                   2079 ; check for decimal number 	
      008C1F 89 01            [ 1] 2080 0$:	ld a,(TCHAR,sp)
      008C20 CD 05 7E         [ 4] 2081 	call is_digit
      008C20 CD 8E            [ 1] 2082 	jrnc 3$
      008C22 2B F7            [ 1] 2083 1$:	ld a,#TK_INTGR 
      008C24 5C               [ 1] 2084 	ld (x),a 
      008C25 91               [ 2] 2085 	incw x 
      008C26 D6 01            [ 1] 2086 	ld a,(TCHAR,sp)
      008C28 72 5C 00         [ 4] 2087 	call parse_integer 
      008C2B 02 CD 85         [ 2] 2088 	jp token_exit 
      000C48                       2089 3$: 
      000C48                       2090 	_case '(' bkslsh_tst 
      008C2E ED 25            [ 1]    1 	ld a,#'(' 
      008C30 EF 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008C32 5A 00            [ 1]    3 	jrne bkslsh_tst
      008C34 02 7F            [ 1] 2091 	ld a,#TK_LPAREN
      008C36 1E 01 E6         [ 2] 2092 	jp token_char   	
      000C53                       2093 bkslsh_tst: ; character token 
      000C53                       2094 	_case '\',rparnt_tst
      008C39 01 26            [ 1]    1 	ld a,#'\' 
      008C3B 13 F6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3D A0 41            [ 1]    3 	jrne rparnt_tst
      008C3F 48 88            [ 1] 2095 	ld a,#TK_CHAR 
      008C41 4B               [ 1] 2096 	ld (x),a 
      008C42 00               [ 2] 2097 	incw x 
      008C43 AE 00 30         [ 4] 2098 	ld a,([in.w],y)
      008C46 72               [ 1] 2099 	ld (x),a 
      008C47 FB               [ 2] 2100 	incw x
      008C48 01 5B            [ 1] 2101 	ldw y,x 	 
      008C4A 02 A6 85 20      [ 1] 2102 	inc in  
      008C4E 0E               [ 1] 2103 	clrw x 
      008C4F 97               [ 1] 2104 	ld xl,a 
      008C4F AE A7            [ 1] 2105 	ld a,#TK_CHAR 
      008C51 37 16 01         [ 2] 2106 	jp token_exit 
      000C6F                       2107 rparnt_tst:		
      000C6F                       2108 	_case ')' colon_tst 
      008C54 CD 90            [ 1]    1 	ld a,#')' 
      008C56 35 4D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C58 26 03            [ 1]    3 	jrne colon_tst
      008C5A CC 88            [ 1] 2109 	ld a,#TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C5C F9 0D A4         [ 2] 2110 	jp token_char
      008C5D                       2111 colon_tst:
      000C7A                       2112 	_case ':' comma_tst 
      008C5D 16 01            [ 1]    1 	ld a,#':' 
      008C5F 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C61 90 5C            [ 1]    3 	jrne comma_tst
      008C63 90 FF            [ 1] 2113 	ld a,#TK_COLON 
      008C65 72 A9 00         [ 2] 2114 	jp token_char  
      000C85                       2115 comma_tst:
      000C85                       2116 	_case COMMA sharp_tst 
      008C68 02 5B            [ 1]    1 	ld a,#COMMA 
      008C6A 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6C 26 05            [ 1]    3 	jrne sharp_tst
      008C6C 52 02            [ 1] 2117 	ld a,#TK_COMMA
      008C6E CC 0D A4         [ 2] 2118 	jp token_char
      000C90                       2119 sharp_tst:
      000C90                       2120 	_case SHARP dash_tst 
      008C6E 90 AE            [ 1]    1 	ld a,#SHARP 
      008C70 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008C72 A6 20            [ 1]    3 	jrne dash_tst
      008C74 CD 8E            [ 1] 2121 	ld a,#TK_SHARP
      008C76 A1 55 00         [ 2] 2122 	jp token_char  	 	 
      000C9B                       2123 dash_tst: 	
      000C9B                       2124 	_case '-' at_tst 
      008C79 02 00            [ 1]    1 	ld a,#'-' 
      008C7B 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7D D6 01            [ 1]    3 	jrne at_tst
      008C7F 26 05            [ 1] 2125 	ld a,#TK_MINUS  
      008C81 90 93 CC         [ 2] 2126 	jp token_char 
      000CA6                       2127 at_tst:
      000CA6                       2128 	_case '@' qmark_tst 
      008C84 8E 28            [ 1]    1 	ld a,#'@' 
      008C86 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008C88 00 02            [ 1]    3 	jrne qmark_tst
      008C8A CD 8E            [ 1] 2129 	ld a,#TK_ARRAY 
      008C8C 2B 6B 01         [ 2] 2130 	jp token_char
      008C8F                       2131 qmark_tst:
      000CB1                       2132 	_case '?' tick_tst 
      008C8F A6 22            [ 1]    1 	ld a,#'?' 
      008C91 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C93 26 0A            [ 1]    3 	jrne tick_tst
      008C95 A6 02            [ 1] 2133 	ld a,#TK_CMD  
      008C97 F7               [ 1] 2134 	ld (x),a 
      008C98 5C               [ 2] 2135 	incw x 
      008C99 CD 8B            [ 1] 2136 	ldw y,x 
      008C9B 43 CC 8E         [ 2] 2137 	ldw x,#PRT_IDX 
      008C9E 28 FF            [ 2] 2138 	ldw (y),x 
      008C9F 72 A9 00 02      [ 2] 2139 	addw y,#2
      008C9F A6 24 11         [ 2] 2140 	jp token_exit
      000CC9                       2141 tick_tst: ; comment 
      000CC9                       2142 	_case TICK plus_tst 
      008CA2 01 27            [ 1]    1 	ld a,#TICK 
      008CA4 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA6 26 11            [ 1]    3 	jrne plus_tst
      008CA8 01 26            [ 1] 2143 	ld a,#TK_CMD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CAA 0A               [ 1] 2144 	ld (x),a 
      008CAB A6               [ 2] 2145 	incw x
      008CAC 84 F7 5C CD      [ 2] 2146 	ldw y,#REM_IDX
      008CB0 8B               [ 2] 2147 	ldw (x),y 
      008CB1 E2 CC 8E         [ 2] 2148 	addw x,#2  
      000CDB                       2149 copy_comment:
      008CB4 28 7B 01 CD      [ 2] 2150 	ldw y,#tib 
      008CB8 85 FE 24 0C      [ 2] 2151 	addw y,in.w
      008CBC A6 84            [ 2] 2152 	pushw y
      008CBE F7 5C 7B         [ 4] 2153 	call strcpy
      008CC1 01 CD 8B         [ 2] 2154     subw y,(1,sp)
      008CC4 98 CC            [ 1] 2155 	ld a,yl 
      008CC6 8E 28 01         [ 1] 2156 	add a,in
      008CC8 C7 00 01         [ 1] 2157 	ld in,a 
      008CC8 A6 28            [ 2] 2158 	ldw (1,sp),x
      008CCA 11 01 26         [ 2] 2159 	addw y,(1,sp)
      008CCD 05 A6            [ 2] 2160 	incw y 
      000CFA                       2161 	_drop 2 
      008CCF 07 CC            [ 2]    1     addw sp,#2 
      008CD1 8E 24 8E         [ 2] 2162 	ldw x,#REM_IDX 
      008CD3 A6 80            [ 1] 2163 	ld a,#TK_CMD 
      008CD3 A6 5C 11         [ 2] 2164 	jp token_exit 
      000D04                       2165 plus_tst:
      000D04                       2166 	_case '+' star_tst 
      008CD6 01 26            [ 1]    1 	ld a,#'+' 
      008CD8 16 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDA 03 F7            [ 1]    3 	jrne star_tst
      008CDC 5C 91            [ 1] 2167 	ld a,#TK_PLUS  
      008CDE D6 01 F7         [ 2] 2168 	jp token_char 
      000D0F                       2169 star_tst:
      000D0F                       2170 	_case '*' slash_tst 
      008CE1 5C 90            [ 1]    1 	ld a,#'*' 
      008CE3 93 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE5 5C 00            [ 1]    3 	jrne slash_tst
      008CE7 02 5F            [ 1] 2171 	ld a,#TK_MULT 
      008CE9 97 A6 03         [ 2] 2172 	jp token_char 
      000D1A                       2173 slash_tst: 
      000D1A                       2174 	_case '/' prcnt_tst 
      008CEC CC 8E            [ 1]    1 	ld a,#'/' 
      008CEE 28 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEF 26 05            [ 1]    3 	jrne prcnt_tst
      008CEF A6 29            [ 1] 2175 	ld a,#TK_DIV 
      008CF1 11 01 26         [ 2] 2176 	jp token_char 
      000D25                       2177 prcnt_tst:
      000D25                       2178 	_case '%' eql_tst 
      008CF4 05 A6            [ 1]    1 	ld a,#'%' 
      008CF6 08 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF8 8E 24            [ 1]    3 	jrne eql_tst
      008CFA A6 22            [ 1] 2179 	ld a,#TK_MOD
      008CFA A6 3A 11         [ 2] 2180 	jp token_char  
                                   2181 ; 1 or 2 character tokens 	
      000D30                       2182 eql_tst:
      000D30                       2183 	_case '=' gt_tst 		
      008CFD 01 26            [ 1]    1 	ld a,#'=' 
      008CFF 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D01 01 CC            [ 1]    3 	jrne gt_tst
      008D03 8E 24            [ 1] 2184 	ld a,#TK_EQUAL
      008D05 CC 0D A4         [ 2] 2185 	jp token_char 
      000D3B                       2186 gt_tst:
      000D3B                       2187 	_case '>' lt_tst 
      008D05 A6 2C            [ 1]    1 	ld a,#'>' 
      008D07 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D09 26 05            [ 1]    3 	jrne lt_tst
      008D0B A6 09            [ 1] 2188 	ld a,#TK_GT 
      008D0D CC 8E            [ 1] 2189 	ld (ATTRIB,sp),a 
      008D0F 24 5C 00 01      [ 1] 2190 	inc in 
      008D10 91 D6 00         [ 4] 2191 	ld a,([in.w],y)
      008D10 A6 23            [ 1] 2192 	cp a,#'=
      008D12 11 01            [ 1] 2193 	jrne 1$
      008D14 26 05            [ 1] 2194 	ld a,#TK_GE 
      008D16 A6 0A            [ 2] 2195 	jra token_char  
      008D18 CC 8E            [ 1] 2196 1$: cp a,#'<
      008D1A 24 04            [ 1] 2197 	jrne 2$
      008D1B A6 35            [ 1] 2198 	ld a,#TK_NE 
      008D1B A6 2D            [ 2] 2199 	jra token_char 
      008D1D 11 01 26 05      [ 1] 2200 2$: dec in
      008D21 A6 11            [ 1] 2201 	ld a,(ATTRIB,sp)
      008D23 CC 8E            [ 2] 2202 	jra token_char 	 
      000D64                       2203 lt_tst:
      000D64                       2204 	_case '<' other
      008D25 24 3C            [ 1]    1 	ld a,#'<' 
      008D26 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D26 A6 40            [ 1]    3 	jrne other
      008D28 11 01            [ 1] 2205 	ld a,#TK_LT 
      008D2A 26 05            [ 1] 2206 	ld (ATTRIB,sp),a 
      008D2C A6 06 CC 8E      [ 1] 2207 	inc in 
      008D30 24 D6 00         [ 4] 2208 	ld a,([in.w],y)
      008D31 A1 3D            [ 1] 2209 	cp a,#'=
      008D31 A6 3F            [ 1] 2210 	jrne 1$
      008D33 11 01            [ 1] 2211 	ld a,#TK_LE 
      008D35 26 12            [ 2] 2212 	jra token_char 
      008D37 A6 80            [ 1] 2213 1$: cp a,#'>
      008D39 F7 5C            [ 1] 2214 	jrne 2$
      008D3B 90 93            [ 1] 2215 	ld a,#TK_NE 
      008D3D AE 00            [ 2] 2216 	jra token_char 
      008D3F 74 90 FF 72      [ 1] 2217 2$: dec in 
      008D43 A9 00            [ 1] 2218 	ld a,(ATTRIB,sp)
      008D45 02 CC            [ 2] 2219 	jra token_char 	
      000D8D                       2220 other: ; not a special character 	 
      008D47 8E 28            [ 1] 2221 	ld a,(TCHAR,sp)
      008D49 CD 05 6D         [ 4] 2222 	call is_alpha 
      008D49 A6 27            [ 1] 2223 	jrc 30$ 
      008D4B 11 01 26         [ 2] 2224 	jp syntax_error 
      000D97                       2225 30$: 
      008D4E 35 A6 80         [ 4] 2226 	call parse_keyword
      008D51 F7 5C 90         [ 2] 2227 	cpw x,#remark 
      008D54 AE 00            [ 1] 2228 	jrne token_exit 
      008D56 8E FF            [ 1] 2229 	ldw y,x 
      008D58 1C 00 02         [ 2] 2230 	jp copy_comment 
      008D5B                       2231 token_char:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D5B 90               [ 1] 2232 	ld (x),a 
      008D5C AE               [ 2] 2233 	incw x
      008D5D 16 90            [ 1] 2234 	ldw y,x 
      000DA8                       2235 token_exit:
      000DA8                       2236 	_drop VSIZE 
      008D5F 72 B9            [ 2]    1     addw sp,#VSIZE 
      008D61 00               [ 4] 2237 	ret
                                   2238 
                                   2239 
                                   2240 ;------------------------------------
                                   2241 ; convert alpha to uppercase
                                   2242 ; input:
                                   2243 ;    a  character to convert
                                   2244 ; output:
                                   2245 ;    a  uppercase character
                                   2246 ;------------------------------------
      000DAB                       2247 to_upper::
      008D62 01 90            [ 1] 2248 	cp a,#'a
      008D64 89 CD            [ 1] 2249 	jrpl 1$
      008D66 84               [ 4] 2250 0$:	ret
      008D67 32 72            [ 1] 2251 1$: cp a,#'z	
      008D69 F2 01            [ 1] 2252 	jrugt 0$
      008D6B 90 9F            [ 1] 2253 	sub a,#32
      008D6D CB               [ 4] 2254 	ret
                                   2255 	
                                   2256 ;------------------------------------
                                   2257 ; convert pad content in integer
                                   2258 ; input:
                                   2259 ;    x		.asciz to convert
                                   2260 ; output:
                                   2261 ;    acc24      int24_t
                                   2262 ;------------------------------------
                                   2263 	; local variables
                           000001  2264 	SIGN=1 ; 1 byte, 
                           000002  2265 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2266 	TEMP=3 ; 1 byte, temporary storage
                           000003  2267 	VSIZE=3 ; 3 bytes reserved for local storage
      000DB7                       2268 atoi24::
      008D6E 00               [ 2] 2269 	pushw x 
      000DB8                       2270 	_vars VSIZE
      008D6F 02 C7            [ 2]    1     sub sp,#VSIZE 
                                   2271 	; acc24=0 
      008D71 00 02 1F 01      [ 1] 2272 	clr acc24    
      008D75 72 F9 01 90      [ 1] 2273 	clr acc16
      008D79 5C 5B 02 AE      [ 1] 2274 	clr acc8 
      008D7D 00 8E            [ 1] 2275 	clr (SIGN,sp)
      008D7F A6 80            [ 1] 2276 	ld a,#10
      008D81 CC 8E            [ 1] 2277 	ld (BASE,sp),a ; default base decimal
      008D83 28               [ 1] 2278 	ld a,(x)
      008D84 27 47            [ 1] 2279 	jreq 9$  ; completed if 0
      008D84 A6 2B            [ 1] 2280 	cp a,#'-
      008D86 11 01            [ 1] 2281 	jrne 1$
      008D88 26 05            [ 1] 2282 	cpl (SIGN,sp)
      008D8A A6 10            [ 2] 2283 	jra 2$
      008D8C CC 8E            [ 1] 2284 1$: cp a,#'$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D8E 24 06            [ 1] 2285 	jrne 3$
      008D8F A6 10            [ 1] 2286 	ld a,#16
      008D8F A6 2A            [ 1] 2287 	ld (BASE,sp),a
      008D91 11               [ 2] 2288 2$:	incw x
      008D92 01               [ 1] 2289 	ld a,(x)
      000DE1                       2290 3$:	
      008D93 26 05            [ 1] 2291 	cp a,#'a
      008D95 A6 20            [ 1] 2292 	jrmi 4$
      008D97 CC 8E            [ 1] 2293 	sub a,#32
      008D99 24 30            [ 1] 2294 4$:	cp a,#'0
      008D9A 2B 2B            [ 1] 2295 	jrmi 9$
      008D9A A6 2F            [ 1] 2296 	sub a,#'0
      008D9C 11 01            [ 1] 2297 	cp a,#10
      008D9E 26 05            [ 1] 2298 	jrmi 5$
      008DA0 A6 21            [ 1] 2299 	sub a,#7
      008DA2 CC 8E            [ 1] 2300 	cp a,(BASE,sp)
      008DA4 24 1F            [ 1] 2301 	jrpl 9$
      008DA5 6B 03            [ 1] 2302 5$:	ld (TEMP,sp),a
      008DA5 A6 25            [ 1] 2303 	ld a,(BASE,sp)
      008DA7 11 01 26         [ 4] 2304 	call mulu24_8
      008DAA 05 A6            [ 1] 2305 	ld a,(TEMP,sp)
      008DAC 22 CC 8E         [ 1] 2306 	add a,acc24+2
      008DAF 24 00 0D         [ 1] 2307 	ld acc24+2,a
      008DB0 4F               [ 1] 2308 	clr a
      008DB0 A6 3D 11         [ 1] 2309 	adc a,acc24+1
      008DB3 01 26 05         [ 1] 2310 	ld acc24+1,a
      008DB6 A6               [ 1] 2311 	clr a
      008DB7 32 CC 8E         [ 1] 2312 	adc a,acc24
      008DBA 24 00 0B         [ 1] 2313 	ld acc24,a
      008DBB 20 C9            [ 2] 2314 	jra 2$
      008DBB A6 3E            [ 1] 2315 9$:	tnz (SIGN,sp)
      008DBD 11 01            [ 1] 2316     jreq atoi_exit
      008DBF 26 23 A6         [ 4] 2317     call neg_acc24
      000E1D                       2318 atoi_exit: 
      000E1D                       2319 	_drop VSIZE
      008DC2 31 6B            [ 2]    1     addw sp,#VSIZE 
      008DC4 02               [ 2] 2320 	popw x ; restore x
      008DC5 72               [ 4] 2321 	ret
                                   2322 
                                   2323 
                                   2324 ;------------------------------------
                                   2325 ; skip character c in text starting from 'in'
                                   2326 ; input:
                                   2327 ;	 y 		point to text buffer
                                   2328 ;    a 		character to skip
                                   2329 ; output:  
                                   2330 ;	'in' ajusted to new position
                                   2331 ;------------------------------------
                           000001  2332 	C = 1 ; local var
      000E21                       2333 skip:
      008DC6 5C               [ 1] 2334 	push a
      008DC7 00 02 91         [ 4] 2335 1$:	ld a,([in.w],y)
      008DCA D6 01            [ 1] 2336 	jreq 2$
      008DCC A1 3D            [ 1] 2337 	cp a,(C,sp)
      008DCE 26 04            [ 1] 2338 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DD0 A6 33 20 50      [ 1] 2339 	inc in
      008DD4 A1 3C            [ 2] 2340 	jra 1$
      000E31                       2341 2$: _drop 1 
      008DD6 26 04            [ 2]    1     addw sp,#1 
      008DD8 A6               [ 4] 2342 	ret
                                   2343 	
                                   2344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2345 ;;   TINY BASIC  operators,
                                   2346 ;;   commands and functions 
                                   2347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2348 
                                   2349 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2350 ;;  Arithmetic operators
                                   2351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2352 
                                   2353 ;debug support
                           000001  2354 DEBUG_PRT=1
                           000001  2355 .if DEBUG_PRT 
      000E34                       2356 printxy:
      008DD9 35 20 48         [ 1] 2357 	ld a,base 
      008DDC 72               [ 1] 2358 	push a 
      008DDD 5A               [ 2] 2359 	pushw x 
      008DDE 00 02            [ 2] 2360 	pushw y
      008DE0 7B 02 20 40      [ 1] 2361 	mov base,#16 
      008DE4 CD 09 C8         [ 4] 2362 	call print_int
      008DE4 A6 3C            [ 1] 2363 	ld a,#SPACE 
      008DE6 11 01 26         [ 4] 2364 	call putc  
      008DE9 23 A6            [ 2] 2365 	ldw x,(1,sp)
      008DEB 34 6B 02         [ 4] 2366 	call print_int 
      008DEE 72 5C            [ 1] 2367 	ld a,#CR 
      008DF0 00 02 91         [ 4] 2368 	call putc 
      008DF3 D6 01            [ 2] 2369 	popw y 
      008DF5 A1               [ 2] 2370 	popw x 
      008DF6 3D               [ 1] 2371 	pop a 
      008DF7 26 04 A6         [ 1] 2372 	ld base,a 
      008DFA 36               [ 4] 2373 	ret 
                                   2374 .endif 
                                   2375 
                                   2376 
                                   2377 ;--------------------------------------
                                   2378 ;  multiply 2 uint16_t return uint32_t
                                   2379 ;  input:
                                   2380 ;     x       uint16_t 
                                   2381 ;     y       uint16_t 
                                   2382 ;  output:
                                   2383 ;     x       product bits 15..0
                                   2384 ;     y       product bits 31..16 
                                   2385 ;---------------------------------------
                           000001  2386 		U1=1  ; uint16_t 
                           000003  2387 		DBL=3 ; uint32_t
                           000006  2388 		VSIZE=6
      000E59                       2389 umstar:
      000E59                       2390 	_vars VSIZE 
      008DFB 20 27            [ 2]    1     sub sp,#VSIZE 
      008DFD A1 3E            [ 2] 2391 	ldw (U1,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2392 ;initialize bits 31..16 of 
                                   2393 ;product to zero 
      008DFF 26 04            [ 1] 2394 	clr (DBL,sp)
      008E01 A6 35            [ 1] 2395 	clr (DBL+1,sp)
                                   2396 ; produc U1L*U2L 
      008E03 20 1F            [ 1] 2397 	ld a,yl 
      008E05 72               [ 4] 2398 	mul x,a 
      008E06 5A 00            [ 2] 2399 	ldw (DBL+2,sp),x
                                   2400 ; product U1H*U2L 
      008E08 02 7B            [ 1] 2401 	ld a,(U1,sp) ; xh 
      008E0A 02               [ 1] 2402 	ldw x,y
      008E0B 20               [ 4] 2403 	mul x,a 
      008E0C 17               [ 1] 2404 	clr a 
      008E0D 72 FB 04         [ 2] 2405 	addw x,(DBL+1,sp) 
      008E0D 7B               [ 1] 2406 	clr a 
      008E0E 01 CD            [ 1] 2407 	adc a,(DBL,sp) 
      008E10 85 ED            [ 1] 2408 	ld (DBL,sp),a ; bits 23..17 
      008E12 25 03            [ 2] 2409 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2410 ; product U1L*U2H
      008E14 CC 88            [ 1] 2411 	swapw y 
      008E16 F9               [ 1] 2412 	ldw x,y
      008E17 7B 02            [ 1] 2413 	ld a,(U1+1,sp)
      008E17 CD               [ 4] 2414 	mul x,a
      008E18 8C 1F A3         [ 2] 2415 	addw x,(DBL+1,sp)
      008E1B 96               [ 1] 2416 	clr a 
      008E1C 77 26            [ 1] 2417 	adc a,(DBL,sp)
      008E1E 09 90            [ 1] 2418 	ld (DBL,sp),a 
      008E20 93 CC            [ 2] 2419 	ldw (DBL+1,sp),x 
                                   2420 ; product U1H*U2H 	
      008E22 8D 5B            [ 1] 2421 	ld a,(U1,sp)
      008E24 93               [ 1] 2422 	ldw x,y  
      008E24 F7               [ 4] 2423 	mul x,a 
      008E25 5C 90 93         [ 2] 2424 	addw x,(DBL,sp)
      008E28 90 93            [ 1] 2425 	ldw y,x 
      008E28 5B 02            [ 2] 2426 	ldw x,(DBL+2,sp)
      000E90                       2427 	_drop VSIZE 
      008E2A 81 06            [ 2]    1     addw sp,#VSIZE 
      008E2B 81               [ 4] 2428 	ret
                                   2429 
                                   2430 
                                   2431 ;-------------------------------------
                                   2432 ; multiply 2 integers
                                   2433 ; input:
                                   2434 ;  	x       n1 
                                   2435 ;   y 		n2 
                                   2436 ; output:
                                   2437 ;	X        N1*N2 bits 15..0
                                   2438 ;   Y        N1*N2 bits 31..16 
                                   2439 ;-------------------------------------
                           000001  2440 	SIGN=1
                           000001  2441 	VSIZE=1
      000E93                       2442 multiply:
      000E93                       2443 	_vars VSIZE 
      008E2B A1 61            [ 2]    1     sub sp,#VSIZE 
      008E2D 2A 01            [ 1] 2444 	clr (SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E2F 81               [ 1] 2445 	ld a,xh 
      008E30 A1 7A            [ 1] 2446 	and a,#0x80
      008E32 22 FB            [ 1] 2447 	jrpl 1$
      008E34 A0 20            [ 1] 2448 	cpl (SIGN,sp)
      008E36 81               [ 2] 2449 	negw x 
      008E37                       2450 1$:	
      008E37 89 52            [ 1] 2451 	ld a,yh
      008E39 03 72            [ 1] 2452 	and a,#0x80  
      008E3B 5F 00            [ 1] 2453 	jrpl 2$ 
      008E3D 0C 72            [ 1] 2454 	cpl (SIGN,sp)
      008E3F 5F 00            [ 2] 2455 	negw y 
      000EA9                       2456 2$:	
      008E41 0D 72 5F         [ 4] 2457 	call umstar
      008E44 00 0E            [ 1] 2458 	ld a,(SIGN,sp)
      008E46 0F 01            [ 1] 2459 	jreq 3$
      008E48 A6 0A 6B         [ 4] 2460 	call dneg 
      000EB3                       2461 3$:	
      000EB3                       2462 	_drop VSIZE 
      008E4B 02 F6            [ 2]    1     addw sp,#VSIZE 
      008E4D 27               [ 4] 2463 	ret
                                   2464 
                                   2465 ;--------------------------------------
                                   2466 ; divide uint32_t/uint16_t
                                   2467 ; return:  quotient and remainder 
                                   2468 ; quotient expected to be uint16_t 
                                   2469 ; input:
                                   2470 ;   DBLDIVDND    on stack 
                                   2471 ;   X            divisor 
                                   2472 ; output:
                                   2473 ;   X            quotient 
                                   2474 ;   Y            remainder 
                                   2475 ;---------------------------------------
                           000003  2476 	VSIZE=3
      000EB6                       2477 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EB6                       2478 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2479 	; local variables 
                           000001  2480 	DIVISOR=1 
                           000003  2481 	CNTR=3 
      000EB6                       2482 udiv32_16:
      000EB6                       2483 	_vars VSIZE 
      008E4E 47 A1            [ 2]    1     sub sp,#VSIZE 
      008E50 2D 26            [ 2] 2484 	ldw (DIVISOR,sp),x	; save divisor 
      008E52 04 03            [ 2] 2485 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008E54 01 20            [ 2] 2486 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008E56 08 A1            [ 2] 2487 	tnzw y
      008E58 24 26            [ 1] 2488 	jrne long_division 
      008E5A 06 A6            [ 2] 2489 	ldw y,(DIVISOR,sp)
      008E5C 10               [ 2] 2490 	divw x,y
      000EC5                       2491 	_drop VSIZE 
      008E5D 6B 02            [ 2]    1     addw sp,#VSIZE 
      008E5F 5C               [ 4] 2492 	ret
      000EC8                       2493 long_division:
      008E60 F6               [ 1] 2494 	exgw x,y ; hi in x, lo in y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E61 A6 11            [ 1] 2495 	ld a,#17 
      008E61 A1 61            [ 1] 2496 	ld (CNTR,sp),a
      000ECD                       2497 1$:
      008E63 2B 02            [ 2] 2498 	cpw x,(DIVISOR,sp)
      008E65 A0 20            [ 1] 2499 	jrmi 2$
      008E67 A1 30 2B         [ 2] 2500 	subw x,(DIVISOR,sp)
      008E6A 2B               [ 1] 2501 2$:	ccf 
      008E6B A0 30            [ 2] 2502 	rlcw y 
      008E6D A1               [ 2] 2503 	rlcw x 
      008E6E 0A 2B            [ 1] 2504 	dec (CNTR,sp)
      008E70 06 A0            [ 1] 2505 	jrne 1$
      008E72 07               [ 1] 2506 	exgw x,y 
      000EDD                       2507 	_drop VSIZE 
      008E73 11 02            [ 2]    1     addw sp,#VSIZE 
      008E75 2A               [ 4] 2508 	ret
                                   2509 
                                   2510 ;-----------------------------
                                   2511 ; negate double int.
                                   2512 ; input:
                                   2513 ;   x     bits 15..0
                                   2514 ;   y     bits 31..16
                                   2515 ; output: 
                                   2516 ;   x     bits 15..0
                                   2517 ;   y     bits 31..16
                                   2518 ;-----------------------------
      000EE0                       2519 dneg:
      008E76 1F               [ 2] 2520 	cplw x 
      008E77 6B 03            [ 2] 2521 	cplw y 
      008E79 7B 02 CD         [ 2] 2522 	addw x,#1 
      008E7C 8A E6            [ 1] 2523 	jrnc 1$
      008E7E 7B 03            [ 2] 2524 	incw y 
      008E80 CB               [ 4] 2525 1$: ret 
                                   2526 
                                   2527 
                                   2528 ;--------------------------------
                                   2529 ; sign extend single to double
                                   2530 ; input:
                                   2531 ;   x    int16_t
                                   2532 ; output:
                                   2533 ;   x    int32_t bits 15..0
                                   2534 ;   y    int32_t bits 31..16
                                   2535 ;--------------------------------
      000EEB                       2536 dbl_sign_extend:
      008E81 00 0E            [ 1] 2537 	clrw y
      008E83 C7               [ 1] 2538 	ld a,xh 
      008E84 00 0E            [ 1] 2539 	and a,#0x80 
      008E86 4F C9            [ 1] 2540 	jreq 1$
      008E88 00 0D            [ 2] 2541 	cplw y
      008E8A C7               [ 4] 2542 1$: ret 	
                                   2543 
                                   2544 
                                   2545 ;----------------------------------
                                   2546 ;  euclidian divide dbl/n1 
                                   2547 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2548 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2549 ;    dbl    int32_t on stack 
                                   2550 ;    x 		n1   int16_t  disivor  
                                   2551 ; output:
                                   2552 ;    X      dbl/x  int16_t 
                                   2553 ;    Y      remainder int16_t 
                                   2554 ;----------------------------------
                           000008  2555 	VSIZE=8
      000EF5                       2556 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000EF5                       2557 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000EF5                       2558 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2559 	; local variables
                           000001  2560 	DBLHI=1
                           000003  2561 	DBLLO=3 
                           000005  2562 	SDIVSR=5 ; sign divisor
                           000006  2563 	SQUOT=6 ; sign dividend 
                           000007  2564 	DIVISR=7 ; divisor 
      000EF5                       2565 div32_16:
      000EF5                       2566 	_vars VSIZE 
      008E8B 00 0D            [ 2]    1     sub sp,#VSIZE 
      008E8D 4F C9            [ 1] 2567 	clr (SDIVSR,sp)
      008E8F 00 0C            [ 1] 2568 	clr (SQUOT,sp)
                                   2569 ; copy arguments 
      008E91 C7 00            [ 2] 2570 	ldw y,(DIVDNDHI,sp)
      008E93 0C 20            [ 2] 2571 	ldw (DBLHI,sp),y
      008E95 C9 0D            [ 2] 2572 	ldw y,(DIVDNDLO,sp)
      008E97 01 27            [ 2] 2573 	ldw (DBLLO,sp),y 
                                   2574 ; check for 0 divisor
      008E99 03               [ 2] 2575 	tnzw x 
      008E9A CD 8B            [ 1] 2576     jrne 0$
      008E9C 20 04            [ 1] 2577 	ld a,#ERR_DIV0 
      008E9D CC 08 7B         [ 2] 2578 	jp tb_error 
                                   2579 ; check divisor sign 	
      008E9D 5B               [ 1] 2580 0$:	ld a,xh 
      008E9E 03 85            [ 1] 2581 	and a,#0x80 
      008EA0 81 05            [ 1] 2582 	jreq 1$
      008EA1 03 05            [ 1] 2583 	cpl (SDIVSR,sp)
      008EA1 88 91            [ 1] 2584 	cpl (SQUOT,sp)
      008EA3 D6               [ 2] 2585 	negw x
      008EA4 01 27            [ 2] 2586 1$:	ldw (DIVISR,sp),x
                                   2587 ; check dividend sign 	 
      008EA6 0A 11            [ 1] 2588  	ld a,(DBLHI,sp) 
      008EA8 01 26            [ 1] 2589 	and a,#0x80 
      008EAA 06 72            [ 1] 2590 	jreq 2$ 
      008EAC 5C 00            [ 1] 2591 	cpl (SQUOT,sp)
      008EAE 02 20            [ 2] 2592 	ldw x,(DBLLO,sp)
      008EB0 F1 5B            [ 2] 2593 	ldw y,(DBLHI,sp)
      008EB2 01 81 E0         [ 4] 2594 	call dneg 
      008EB4 1F 03            [ 2] 2595 	ldw (DBLLO,sp),x 
      008EB4 C6 00            [ 2] 2596 	ldw (DBLHI,sp),y 
      008EB6 0B 88            [ 2] 2597 2$:	ldw x,(DIVISR,sp)
      008EB8 89 90 89         [ 4] 2598 	call udiv32_16
      008EBB 35 10            [ 2] 2599 	tnzw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EBD 00 0B            [ 1] 2600 	jreq 3$ 
                                   2601 ; x=quotient 
                                   2602 ; y=remainder 
                                   2603 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008EBF CD 8A            [ 1] 2604 	ld a,(SQUOT,sp)
      008EC1 48 A6            [ 1] 2605 	xor a,(SDIVSR,sp)
      008EC3 20 CD            [ 1] 2606 	jreq 3$
      008EC5 83               [ 2] 2607 	incw x 
      008EC6 40 1E 01 CD      [ 2] 2608 	ldw acc16,y 
      008ECA 8A 48            [ 2] 2609 	ldw y,(DIVISR,sp)
      008ECC A6 0D CD 83      [ 2] 2610 	subw y,acc16
                                   2611 ; sign quotient
      008ED0 40 90            [ 1] 2612 3$:	ld a,(SQUOT,sp)
      008ED2 85 85            [ 1] 2613 	jreq 4$
      008ED4 84               [ 2] 2614 	negw x 
      000F49                       2615 4$:	
      000F49                       2616 	_drop VSIZE 
      008ED5 C7 00            [ 2]    1     addw sp,#VSIZE 
      008ED7 0B               [ 4] 2617 	ret 
                                   2618 
                                   2619 
                                   2620 
                                   2621 ;----------------------------------
                                   2622 ; division x/y 
                                   2623 ; input:
                                   2624 ;    X       dividend
                                   2625 ;    Y       divisor 
                                   2626 ; output:
                                   2627 ;    X       quotient
                                   2628 ;    Y       remainder 
                                   2629 ;-----------------------------------
                           000004  2630 	VSIZE=4 
                                   2631 	; local variables 
                           000001  2632 	DBLHI=1
                           000003  2633 	DBLLO=3
      000F4C                       2634 divide: 
      000F4C                       2635 	_vars VSIZE 
      008ED8 81 04            [ 2]    1     sub sp,#VSIZE 
      008ED9 90 CF 00 0C      [ 2] 2636 	ldw acc16,y
      008ED9 52 06 1F         [ 4] 2637 	call dbl_sign_extend
      008EDC 01 0F            [ 2] 2638 	ldw (DBLLO,sp),x 
      008EDE 03 0F            [ 2] 2639 	ldw (DBLHI,sp),y 
      008EE0 04 90 9F         [ 2] 2640 	ldw x,acc16 
      008EE3 42 1F 05         [ 4] 2641 	call div32_16 
      000F5F                       2642 	_drop VSIZE 
      008EE6 7B 01            [ 2]    1     addw sp,#VSIZE 
      008EE8 93               [ 4] 2643 	ret
                                   2644 
                                   2645 
                                   2646 ;----------------------------------
                                   2647 ;  remainder resulting from euclidian 
                                   2648 ;  division of x/y 
                                   2649 ; input:
                                   2650 ;   x   	dividend int16_t 
                                   2651 ;   y 		divisor int16_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2652 ; output:
                                   2653 ;   X       n1%n2 
                                   2654 ;----------------------------------
      000F62                       2655 modulo:
      008EE9 42 4F 72         [ 4] 2656 	call divide
      008EEC FB               [ 1] 2657 	ldw x,y 
      008EED 04               [ 4] 2658 	ret 
                                   2659 
                                   2660 ;----------------------------------
                                   2661 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2662 ; return expr1*expr2/expr3 
                                   2663 ; product result is int32_t and 
                                   2664 ; divisiont is int32_t/int16_t
                                   2665 ;----------------------------------
                           000004  2666 	DBL_SIZE=4 
      000F67                       2667 muldiv:
      008EEE 4F 19 03         [ 4] 2668 	call func_args 
      008EF1 6B 03            [ 1] 2669 	cp a,#3 
      008EF3 1F 04            [ 1] 2670 	jreq 1$
      008EF5 90 5E 93         [ 2] 2671 	jp syntax_error
      000F71                       2672 1$: 
      008EF8 7B 02            [ 2] 2673 	ldw x,(5,sp) ; expr1
      008EFA 42 72            [ 2] 2674 	ldw y,(3,sp) ; expr2
      008EFC FB 04 4F         [ 4] 2675 	call multiply 
      008EFF 19 03            [ 2] 2676 	ldw (5,sp),x  ;int32_t 15..0
      008F01 6B 03            [ 2] 2677 	ldw (3,sp),y  ;int32_t 31..16
      008F03 1F               [ 2] 2678 	popw x        ; expr3 
      008F04 04 7B 01         [ 4] 2679 	call div32_16 ; int32_t/expr3 
      000F80                       2680 	_drop DBL_SIZE
      008F07 93 42            [ 2]    1     addw sp,#DBL_SIZE 
      008F09 72               [ 4] 2681 	ret 
                                   2682 
                                   2683 
                                   2684 ;----------------------------------
                                   2685 ; search in kword_dict name
                                   2686 ; from its execution address 
                                   2687 ; input:
                                   2688 ;   X       	cmd_index 
                                   2689 ; output:
                                   2690 ;   X 			cstr*  | 0 
                                   2691 ;--------------------------------
                           000001  2692 	CMDX=1 
                           000003  2693 	LINK=3 
                           000004  2694 	VSIZE=4
      000F83                       2695 cmd_name:
      000F83                       2696 	_vars VSIZE 
      008F0A FB 03            [ 2]    1     sub sp,#VSIZE 
      008F0C 90 93 1E 05      [ 1] 2697 	clr acc16 
      008F10 5B 06            [ 2] 2698 	ldw (CMDX,sp),x  
      008F12 81 26 B5         [ 2] 2699 	ldw x,#kword_dict	
      008F13 1F 03            [ 2] 2700 1$:	ldw (LINK,sp),x
      008F13 52 01            [ 1] 2701 	ld a,(2,x)
      008F15 0F 01            [ 1] 2702 	and a,#15 
      008F17 9E A4 80         [ 1] 2703 	ld acc8,a 
      008F1A 2A 03 03         [ 2] 2704 	addw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F1D 01 50 00 0C      [ 2] 2705 	addw x,acc16
      008F1F FE               [ 2] 2706 	ldw x,(x) ; command index  
      008F1F 90 9E            [ 2] 2707 	cpw x,(CMDX,sp)
      008F21 A4 80            [ 1] 2708 	jreq 2$
      008F23 2A 04            [ 2] 2709 	ldw x,(LINK,sp)
      008F25 03               [ 2] 2710 	ldw x,(x) 
      008F26 01 90 50         [ 2] 2711 	subw x,#2  
      008F29 26 E3            [ 1] 2712 	jrne 1$
      008F29 CD 8E            [ 2] 2713 	jra 9$
      008F2B D9 7B            [ 2] 2714 2$: ldw x,(LINK,sp)
      008F2D 01 27 03         [ 2] 2715 	addw x,#2 	
      000FB2                       2716 9$:	_drop VSIZE
      008F30 CD 8F            [ 2]    1     addw sp,#VSIZE 
      008F32 60               [ 4] 2717 	ret
                                   2718 
                                   2719 
                                   2720 ;---------------------------------
                                   2721 ; dictionary search 
                                   2722 ; input:
                                   2723 ;	X 		dictionary entry point, name field  
                                   2724 ;   y		.asciz name to search 
                                   2725 ; output:
                                   2726 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2727 ;  X		cmd_index ; execution address | 0 
                                   2728 ;---------------------------------
                           000001  2729 	NLEN=1 ; cmd length 
                           000002  2730 	XSAVE=2
                           000004  2731 	YSAVE=4
                           000005  2732 	VSIZE=5 
      008F33                       2733 search_dict:
      000FB5                       2734 	_vars VSIZE 
      008F33 5B 01            [ 2]    1     sub sp,#VSIZE 
                                   2735 
      008F35 81 04            [ 2] 2736 	ldw (YSAVE,sp),y 
      008F36                       2737 search_next:
      008F36 52 03            [ 2] 2738 	ldw (XSAVE,sp),x 
                                   2739 ; get name length in dictionary	
      008F38 1F               [ 1] 2740 	ld a,(x)
      008F39 01 1E            [ 1] 2741 	and a,#0xf 
      008F3B 08 16            [ 1] 2742 	ld (NLEN,sp),a  
      008F3D 06 90            [ 2] 2743 	ldw y,(YSAVE,sp) ; name pointer 
      008F3F 5D               [ 2] 2744 	incw x 
      000FC3                       2745 cp_loop:
      008F40 26 06            [ 1] 2746 	ld a,(y)
      008F42 16 01            [ 1] 2747 	jreq str_match 
      008F44 65 5B            [ 1] 2748 	tnz (NLEN,sp)
      008F46 03 81            [ 1] 2749 	jreq no_match  
      008F48 F1               [ 1] 2750 	cp a,(x)
      008F48 51 A6            [ 1] 2751 	jrne no_match 
      008F4A 11 6B            [ 2] 2752 	incw y 
      008F4C 03               [ 2] 2753 	incw x
      008F4D 0A 01            [ 1] 2754 	dec (NLEN,sp)
      008F4D 13 01            [ 2] 2755 	jra cp_loop 
      000FD5                       2756 no_match:
      008F4F 2B 03            [ 2] 2757 	ldw x,(XSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F51 72 F0 01         [ 2] 2758 	subw x,#2 ; move X to link field
      008F54 8C 90            [ 1] 2759 	push #TK_NONE 
      008F56 59               [ 2] 2760 	ldw x,(x) ; next word link 
      008F57 59               [ 1] 2761 	pop a ; TK_NONE 
      008F58 0A 03            [ 1] 2762 	jreq search_exit  ; not found  
                                   2763 ;try next 
      008F5A 26 F1            [ 2] 2764 	jra search_next
      000FE2                       2765 str_match:
      008F5C 51 5B            [ 2] 2766 	ldw x,(XSAVE,sp)
      008F5E 03               [ 1] 2767 	ld a,(X)
      008F5F 81 01            [ 1] 2768 	ld (NLEN,sp),a ; needed to test keyword type  
      008F60 A4 0F            [ 1] 2769 	and a,#0xf 
                                   2770 ; move x to procedure address field 	
      008F60 53               [ 1] 2771 	inc a 
      008F61 90 53 1C         [ 1] 2772 	ld acc8,a 
      008F64 00 01 24 02      [ 1] 2773 	clr acc16 
      008F68 90 5C 81 0C      [ 2] 2774 	addw x,acc16 
      008F6B FE               [ 2] 2775 	ldw x,(x) ; routine index  
                                   2776 ;determine keyword type bits 7:6 
      008F6B 90 5F            [ 1] 2777 	ld a,(NLEN,sp)
      008F6D 9E               [ 1] 2778 	swap a 
      008F6E A4 80            [ 1] 2779 	and a,#0xc
      008F70 27               [ 1] 2780 	srl a
      008F71 02               [ 1] 2781 	srl a 
      008F72 90 53            [ 1] 2782 	add a,#128
      000FFF                       2783 search_exit: 
      000FFF                       2784 	_drop VSIZE 	 
      008F74 81 05            [ 2]    1     addw sp,#VSIZE 
      008F75 81               [ 4] 2785 	ret 
                                   2786 
                                   2787 ;---------------------
                                   2788 ; check if next token
                                   2789 ;  is of expected type 
                                   2790 ; input:
                                   2791 ;   A 		 expected token attribute
                                   2792 ;  ouput:
                                   2793 ;   none     if fail call syntax_error 
                                   2794 ;--------------------
      001002                       2795 expect:
      008F75 52               [ 1] 2796 	push a 
      008F76 08 0F 05         [ 4] 2797 	call next_token 
      008F79 0F 06            [ 1] 2798 	cp a,(1,sp)
      008F7B 16 0B            [ 1] 2799 	jreq 1$
      008F7D 17 01 16         [ 2] 2800 	jp syntax_error
      008F80 0D               [ 1] 2801 1$: pop a 
      008F81 17               [ 4] 2802 	ret 
                                   2803 
                                   2804 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2805 ; parse arguments list 
                                   2806 ; between ()
                                   2807 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00100F                       2808 func_args:
      008F82 03 5D            [ 1] 2809 	ld a,#TK_LPAREN 
      008F84 26 05 A6         [ 4] 2810 	call expect 
                                   2811 ; expected to continue in arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2812 ; caller must check for TK_RPAREN 
                                   2813 
                                   2814 ;-------------------------------
                                   2815 ; parse embedded BASIC routines 
                                   2816 ; arguments list.
                                   2817 ; arg_list::=  rel[','rel]*
                                   2818 ; all arguments are of integer type
                                   2819 ; and pushed on stack 
                                   2820 ; input:
                                   2821 ;   none
                                   2822 ; output:
                                   2823 ;   stack{n}   arguments pushed on stack
                                   2824 ;   A 	number of arguments pushed on stack  
                                   2825 ;--------------------------------
      001014                       2826 arg_list:
      008F87 04 CC            [ 1] 2827 	push #0  
      008F89 88 FB 9E         [ 4] 2828 1$: call relation
      008F8C A4 80            [ 1] 2829 	cp a,#TK_NONE 
      008F8E 27 05            [ 1] 2830 	jreq 5$
      008F90 03 05            [ 1] 2831 	cp a,#TK_INTGR
      008F92 03 06            [ 1] 2832 	jrne 4$
      001021                       2833 3$: 
                                   2834 ; swap return address with argument
      008F94 50               [ 1] 2835 	pop a ; arg_count
      008F95 1F 07            [ 2] 2836 	popw y ; return address 
      008F97 7B               [ 2] 2837 	pushw x ; new argument 
      008F98 01 A4            [ 2] 2838 	pushw y 
      008F9A 80               [ 1] 2839     inc a
      008F9B 27               [ 1] 2840 	push a 
      008F9C 0D 03 06         [ 4] 2841 	call next_token 
      008F9F 1E 03            [ 1] 2842 	cp a,#TK_COMMA 
      008FA1 16 01            [ 1] 2843 	jreq 1$ 
      008FA3 CD 8F            [ 1] 2844 	cp a,#TK_NONE 
      008FA5 60 1F            [ 1] 2845 	jreq 5$ 
      008FA7 03 17            [ 1] 2846 4$:	cp a,#TK_RPAREN 
      008FA9 01 1E            [ 1] 2847 	jreq 5$
      001038                       2848 	_unget_token 
      008FAB 07 CD 8F 36 90   [ 1]    1     mov in,in.saved
      008FB0 5D               [ 1] 2849 5$:	pop a  
      008FB1 27               [ 4] 2850 	ret 
                                   2851 
                                   2852 ;--------------------------------
                                   2853 ;   BASIC commnands 
                                   2854 ;--------------------------------
                                   2855 
                                   2856 ;--------------------------------
                                   2857 ;  arithmetic and relational 
                                   2858 ;  routines
                                   2859 ;  operators precedence
                                   2860 ;  highest to lowest
                                   2861 ;  operators on same row have 
                                   2862 ;  same precedence and are executed
                                   2863 ;  from left to right.
                                   2864 ;	'*','/','%'
                                   2865 ;   '-','+'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2866 ;   '=','>','<','>=','<=','<>','><'
                                   2867 ;   '<>' and '><' are equivalent for not equal.
                                   2868 ;--------------------------------
                                   2869 
                                   2870 ;---------------------
                                   2871 ; return array element
                                   2872 ; address from @(expr)
                                   2873 ; input:
                                   2874 ;   A 		TK_ARRAY
                                   2875 ; output:
                                   2876 ;   A 		TK_INTGR
                                   2877 ;	X 		element address 
                                   2878 ;----------------------
      00103F                       2879 get_array_element:
      008FB2 11 7B 06         [ 4] 2880 	call func_args 
      008FB5 18 05            [ 1] 2881 	cp a,#1
      008FB7 27 0B            [ 1] 2882 	jreq 1$
      008FB9 5C 90 CF         [ 2] 2883 	jp syntax_error
      008FBC 00               [ 2] 2884 1$: popw x 
                                   2885 	; check for bounds 
      008FBD 0D 16 07         [ 2] 2886 	cpw x,array_size 
      008FC0 72 B2            [ 2] 2887 	jrule 3$
                                   2888 ; bounds {1..array_size}	
      008FC2 00 0D            [ 1] 2889 2$: ld a,#ERR_BAD_VALUE 
      008FC4 7B 06 27         [ 2] 2890 	jp tb_error 
      008FC7 01               [ 2] 2891 3$: tnzw  x
      008FC8 50 F8            [ 1] 2892 	jreq 2$ 
      008FC9 58               [ 2] 2893 	sllw x 
      008FC9 5B               [ 2] 2894 	pushw x 
      008FCA 08 81 90         [ 2] 2895 	ldw x,#tib
      008FCC 72 F0 01         [ 2] 2896 	subw x,(1,sp)
      00105F                       2897 	_drop 2   
      008FCC 52 04            [ 2]    1     addw sp,#2 
      008FCE 90 CF            [ 1] 2898 	ld a,#TK_INTGR
      008FD0 00               [ 4] 2899 	ret 
                                   2900 
                                   2901 
                                   2902 ;***********************************
                                   2903 ;   expression parse,execute 
                                   2904 ;***********************************
                                   2905 ;-----------------------------------
                                   2906 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2907 ;			 integer | function |
                                   2908 ;			 '('relation')' 
                                   2909 ; output:
                                   2910 ;   A    token attribute 
                                   2911 ;   X 	 integer
                                   2912 ; ---------------------------------
                           000001  2913 	NEG=1
                           000001  2914 	VSIZE=1
      001064                       2915 factor:
      001064                       2916 	_vars VSIZE 
      008FD1 0D CD            [ 2]    1     sub sp,#VSIZE 
      008FD3 8F 6B 1F         [ 4] 2917 	call next_token
      008FD6 03 17            [ 1] 2918 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008FD8 01 CE            [ 1] 2919 	jrult 20$
      008FDA 00 0D            [ 1] 2920 1$:	ld (NEG,sp),a 
      008FDC CD 8F            [ 1] 2921 	and a,#TK_GRP_MASK
      008FDE 75 5B            [ 1] 2922 	cp a,#TK_GRP_ADD 
      008FE0 04 81            [ 1] 2923 	jreq 2$
      008FE2 7B 01            [ 1] 2924 	ld a,(NEG,sp)
      008FE2 CD 8F            [ 2] 2925 	jra 4$  
      001079                       2926 2$:	
      008FE4 CC 93 81         [ 4] 2927 	call next_token 
      008FE7                       2928 4$:	
      008FE7 CD 90            [ 1] 2929 	cp a,#TK_IFUNC 
      008FE9 8F A1            [ 1] 2930 	jrne 5$ 
      008FEB 03               [ 4] 2931 	call (x) 
      008FEC 27 03            [ 2] 2932 	jra 18$ 
      001083                       2933 5$:
      008FEE CC 88            [ 1] 2934 	cp a,#TK_INTGR
      008FF0 F9 02            [ 1] 2935 	jrne 6$
      008FF1 20 29            [ 2] 2936 	jra 18$
      001089                       2937 6$:
      008FF1 1E 05            [ 1] 2938 	cp a,#TK_ARRAY
      008FF3 16 03            [ 1] 2939 	jrne 10$
      008FF5 CD 8F 13         [ 4] 2940 	call get_array_element
      008FF8 1F               [ 2] 2941 	ldw x,(x)
      008FF9 05 17            [ 2] 2942 	jra 18$ 
      001093                       2943 10$:
      008FFB 03 85            [ 1] 2944 	cp a,#TK_VAR 
      008FFD CD 8F            [ 1] 2945 	jrne 12$
      008FFF 75               [ 2] 2946 	ldw x,(x)
      009000 5B 04            [ 2] 2947 	jra 18$
      00109A                       2948 12$:			
      009002 81 07            [ 1] 2949 	cp a,#TK_LPAREN
      009003 26 0C            [ 1] 2950 	jrne 16$
      009003 52 04 72         [ 4] 2951 	call relation
      009006 5F               [ 2] 2952 	pushw x 
      009007 00 0D            [ 1] 2953 	ld a,#TK_RPAREN 
      009009 1F 01 AE         [ 4] 2954 	call expect
      00900C A7               [ 2] 2955 	popw x 
      00900D 35 1F            [ 2] 2956 	jra 18$	
      0010AA                       2957 16$:
      0010AA                       2958 	_unget_token
      00900F 03 E6 02 A4 0F   [ 1]    1     mov in,in.saved
      009014 C7               [ 1] 2959 	clr a 
      009015 00 0E            [ 2] 2960 	jra 20$ 
      0010B2                       2961 18$: 
      009017 1C 00            [ 1] 2962 	ld a,#TK_MINUS 
      009019 03 72            [ 1] 2963 	cp a,(NEG,sp)
      00901B BB 00            [ 1] 2964 	jrne 19$
      00901D 0D               [ 2] 2965 	negw x
      0010B9                       2966 19$:
      00901E FE 13            [ 1] 2967 	ld a,#TK_INTGR
      0010BB                       2968 20$:
      0010BB                       2969 	_drop VSIZE
      009020 01 27            [ 2]    1     addw sp,#VSIZE 
      009022 0A               [ 4] 2970 	ret
                                   2971 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2972 ;-----------------------------------
                                   2973 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2974 ; output:
                                   2975 ;   A    	token attribute 
                                   2976 ;	X		integer
                                   2977 ;-----------------------------------
                           000001  2978 	N1=1   ; int16_t
                           000003  2979 	MULOP=3
                           000003  2980 	VSIZE=3
      0010BE                       2981 term:
      0010BE                       2982 	_vars VSIZE
      009023 1E 03            [ 2]    1     sub sp,#VSIZE 
      009025 FE 1D 00         [ 4] 2983 	call factor
      009028 02 26            [ 1] 2984 	cp a,#CMD_END
      00902A E3 20            [ 1] 2985 	jrult term_exit
      0010C7                       2986 term01:	 ; check for  operator 
      00902C 05 1E            [ 2] 2987 	ldw (N1,sp),x  ; save first factor 
      00902E 03 1C 00         [ 4] 2988 	call next_token
      009031 02 5B            [ 1] 2989 	cp a,#CMD_END
      009033 04 81            [ 1] 2990 	jrult 9$
      009035 6B 03            [ 1] 2991 0$:	ld (MULOP,sp),a
      009035 52 05            [ 1] 2992 	and a,#TK_GRP_MASK
      009037 17 04            [ 1] 2993 	cp a,#TK_GRP_MULT
      009039 27 07            [ 1] 2994 	jreq 1$
      0010D8                       2995 	_unget_token 
      009039 1F 02 F6 A4 0F   [ 1]    1     mov in,in.saved
      00903E 6B 01            [ 2] 2996 	jra 9$
      0010DF                       2997 1$:	; got *|/|%
      009040 16 04 5C         [ 4] 2998 	call factor
      009043 A1 84            [ 1] 2999 	cp a,#TK_INTGR
      009043 90 F6            [ 1] 3000 	jreq 2$ 
      009045 27 1B 0D         [ 2] 3001 	jp syntax_error
      009048 01 27            [ 1] 3002 2$:	ldw y,x 
      00904A 0A F1            [ 2] 3003 	ldw x,(N1,sp)
      00904C 26 07            [ 1] 3004 	ld a,(MULOP,sp) 
      00904E 90 5C            [ 1] 3005 	cp a,#TK_MULT 
      009050 5C 0A            [ 1] 3006 	jrne 3$
      009052 01 20 EE         [ 4] 3007 	call multiply 
      009055 20 CF            [ 2] 3008 	jra term01
      009055 1E 02            [ 1] 3009 3$: cp a,#TK_DIV 
      009057 1D 00            [ 1] 3010 	jrne 4$ 
      009059 02 4B 00         [ 4] 3011 	call divide 
      00905C FE 84            [ 2] 3012 	jra term01 
      00905E 27 1F 20         [ 4] 3013 4$: call modulo
      009061 D7 C1            [ 2] 3014 	jra term01 
      009062 1E 01            [ 2] 3015 9$: ldw x,(N1,sp)
      009062 1E 02            [ 1] 3016 	ld a,#TK_INTGR 	
      00110A                       3017 term_exit:
      00110A                       3018 	_drop VSIZE 
      009064 F6 6B            [ 2]    1     addw sp,#VSIZE 
      009066 01               [ 4] 3019 	ret 
                                   3020 
                                   3021 ;-------------------------------
                                   3022 ;  expr ::= term [['+'|'-'] term]*
                                   3023 ;  result range {-32768..32767}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3024 ;  output:
                                   3025 ;   A    token attribute 
                                   3026 ;   X	 integer   
                                   3027 ;-------------------------------
                           000001  3028 	N1=1 
                           000003  3029 	OP=3 
                           000003  3030 	VSIZE=3 
      00110D                       3031 expression:
      00110D                       3032 	_vars VSIZE 
      009067 A4 0F            [ 2]    1     sub sp,#VSIZE 
      009069 4C C7 00         [ 4] 3033 	call term
      00906C 0E 72            [ 1] 3034 	cp a,#CMD_END 
      00906E 5F 00            [ 1] 3035 	jrult expr_exit 
      009070 0D 72            [ 2] 3036 0$:	ldw (N1,sp),x 
      009072 BB 00 0D         [ 4] 3037 	call next_token
      009075 FE 7B            [ 1] 3038 	cp a,#CMD_END 
      009077 01 4E            [ 1] 3039 	jrult 9$ 
      009079 A4 0C            [ 1] 3040 1$:	ld (OP,sp),a  
      00907B 44 44            [ 1] 3041 	and a,#TK_GRP_MASK
      00907D AB 80            [ 1] 3042 	cp a,#TK_GRP_ADD 
      00907F 27 07            [ 1] 3043 	jreq 2$ 
      001127                       3044 	_unget_token
      00907F 5B 05 81 00 01   [ 1]    1     mov in,in.saved
      009082 20 21            [ 2] 3045 	jra 9$
      00112E                       3046 2$: 
      009082 88 CD 89         [ 4] 3047 	call term
      009085 EB 11            [ 1] 3048 	cp a,#TK_INTGR 
      009087 01 27            [ 1] 3049 	jreq 3$
      009089 03 CC 88         [ 2] 3050 	jp syntax_error
      00908C F9 84 81         [ 2] 3051 3$:	ldw acc16,x 
      00908F 1E 01            [ 2] 3052 	ldw x,(N1,sp)
      00908F A6 07            [ 1] 3053 	ld a,(OP,sp)
      009091 CD 90            [ 1] 3054 	cp a,#TK_PLUS 
      009093 82 06            [ 1] 3055 	jrne 4$
      009094 72 BB 00 0C      [ 2] 3056 	addw x,acc16
      009094 4B 00            [ 2] 3057 	jra 0$ 
      009096 CD 91 D6 A1      [ 2] 3058 4$:	subw x,acc16
      00909A 00 27            [ 2] 3059 	jra 0$
      00909C 20 A1            [ 2] 3060 9$: ldw x,(N1,sp)
      00909E 84 26            [ 1] 3061 	ld a,#TK_INTGR	
      001153                       3062 expr_exit:
      001153                       3063 	_drop VSIZE 
      0090A0 13 03            [ 2]    1     addw sp,#VSIZE 
      0090A1 81               [ 4] 3064 	ret 
                                   3065 
                                   3066 ;---------------------------------------------
                                   3067 ; rel ::= expr rel_op expr
                                   3068 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3069 ;  relation return  integer , zero is false 
                                   3070 ;  output:
                                   3071 ;    A 		token attribute  
                                   3072 ;	 X		integer 
                                   3073 ;---------------------------------------------
                           000001  3074 	N1=1
                           000003  3075 	RELOP=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                           000003  3076 	VSIZE=3 
      001156                       3077 relation: 
      001156                       3078 	_vars VSIZE
      0090A1 84 90            [ 2]    1     sub sp,#VSIZE 
      0090A3 85 89 90         [ 4] 3079 	call expression
      0090A6 89 4C            [ 1] 3080 	cp a,#CMD_END  
      0090A8 88 CD            [ 1] 3081 	jrult rel_exit 
                                   3082 	; expect rel_op or leave 
      0090AA 89 EB            [ 2] 3083 	ldw (N1,sp),x 
      0090AC A1 09 27         [ 4] 3084 	call next_token 
      0090AF E6 A1            [ 1] 3085 	cp a,#CMD_END 
      0090B1 00 27            [ 1] 3086 	jrult 9$
      001168                       3087 1$:	
      0090B3 09 A1            [ 1] 3088 	ld (RELOP,sp),a 
      0090B5 08 27            [ 1] 3089 	and a,#TK_GRP_MASK
      0090B7 05 55            [ 1] 3090 	cp a,#TK_GRP_RELOP 
      0090B9 00 03            [ 1] 3091 	jreq 2$
      001170                       3092 	_unget_token  
      0090BB 00 02 84 81 01   [ 1]    1     mov in,in.saved
      0090BF 20 33            [ 2] 3093 	jra 9$
      001177                       3094 2$:	; expect another expression or error 
      0090BF CD 90 8F         [ 4] 3095 	call expression
      0090C2 A1 01            [ 1] 3096 	cp a,#TK_INTGR 
      0090C4 27 03            [ 1] 3097 	jreq 3$
      0090C6 CC 88 F9         [ 2] 3098 	jp syntax_error 
      0090C9 85 C3 00         [ 2] 3099 3$:	ldw acc16,x 
      0090CC 22 23            [ 2] 3100 	ldw x,(N1,sp) 
      0090CE 05 A6 0A CC      [ 2] 3101 	subw x,acc16
      0090D2 88 FB            [ 1] 3102 	jrne 4$
      0090D4 5D 27 F8 58      [ 1] 3103 	mov acc8,#2 ; n1==n2
      0090D8 89 AE            [ 2] 3104 	jra 6$ 
      001192                       3105 4$: 
      0090DA 16 90            [ 1] 3106 	jrsgt 5$  
      0090DC 72 F0 01 5B      [ 1] 3107 	mov acc8,#4 ; n1<2 
      0090E0 02 A6            [ 2] 3108 	jra 6$
      00119A                       3109 5$:
      0090E2 84 81 00 0D      [ 1] 3110 	mov acc8,#1 ; n1>n2 
      0090E4                       3111 6$:
      0090E4 52               [ 1] 3112 	clrw x 
      0090E5 01 CD 89         [ 1] 3113 	ld a, acc8  
      0090E8 EB A1            [ 1] 3114 	and a,(RELOP,sp)
      0090EA 02               [ 1] 3115 	tnz a 
      0090EB 25 4E            [ 1] 3116 	jreq 10$
      0090ED 6B               [ 2] 3117 	incw x 
      0011A8                       3118 7$:	 
      0090EE 01 A4            [ 2] 3119 	jra 10$  	
      0090F0 30 A1            [ 2] 3120 9$: ldw x,(N1,sp)
      0011AC                       3121 10$:
      0090F2 10 27            [ 1] 3122 	ld a,#TK_INTGR
      0011AE                       3123 rel_exit: 	 
      0011AE                       3124 	_drop VSIZE
      0090F4 04 7B            [ 2]    1     addw sp,#VSIZE 
      0090F6 01               [ 4] 3125 	ret 
                                   3126 
                                   3127 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3128 ; BASIC: SHOW 
                                   3129 ; print stack content in hexadecimal bytes 
                                   3130 ; 16 bytes per row 
                                   3131 ;--------------------------------
      0011B1                       3132 show:
      0090F7 20 03 CB         [ 2] 3133 	ldw x,#cstk_prompt
      0090F9 CD 00 00         [ 4] 3134 	call puts 
      0090F9 CD               [ 1] 3135 	ldw x,sp 
      0090FA 89 EB 03         [ 2] 3136 	addw x,#3 ; ignore return address
      0090FC 90 AE 18 00      [ 2] 3137 	ldw y,#RAM_SIZE  
      0090FC A1 81 26         [ 2] 3138 	ldw acc16,x 
      0090FF 03 FD 20 2F      [ 2] 3139 	subw y,acc16
      009103 CD 03 59         [ 4] 3140 	call hex_dump
      009103 A1               [ 1] 3141 	clr a 
      009104 84               [ 4] 3142 	ret
                                   3143 
      009105 26 02 20 29 74 65 6E  3144 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3145 
                                   3146 
                                   3147 ;--------------------------------------------
                                   3148 ; BASIC: HEX 
                                   3149 ; select hexadecimal base for integer print
                                   3150 ;---------------------------------------------
      009109                       3151 hex_base:
      009109 A1 06 26 06      [ 1] 3152 	mov base,#16 
      00910D CD               [ 4] 3153 	ret 
                                   3154 
                                   3155 ;--------------------------------------------
                                   3156 ; BASIC: DEC 
                                   3157 ; select decimal base for integer print
                                   3158 ;---------------------------------------------
      0011F7                       3159 dec_base:
      00910E 90 BF FE 20      [ 1] 3160 	mov base,#10
      009112 1F               [ 4] 3161 	ret 
                                   3162 
                                   3163 ;------------------------
                                   3164 ; BASIC: SIZE 
                                   3165 ; return free size in text area
                                   3166 ; output:
                                   3167 ;   A 		TK_INTGR
                                   3168 ;   X 	    size integer
                                   3169 ;--------------------------
      009113                       3170 size:
      009113 A1 85 26         [ 2] 3171 	ldw x,#tib 
      009116 03 FE 20 18      [ 2] 3172 	subw x,txtend 
      00911A A6 84            [ 1] 3173 	ld a,#TK_INTGR
      00911A A1               [ 4] 3174 	ret 
                                   3175 
                                   3176 
                                   3177 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3178 ; BASIC: UBOUND  
                                   3179 ; return array variable size 
                                   3180 ; output:
                                   3181 ;   A 		TK_INTGR
                                   3182 ;   X 	    array size 
                                   3183 ;--------------------------
      001206                       3184 ubound:
      00911B 07 26 0C         [ 2] 3185 	ldw x,#tib
      00911E CD 91 D6 89      [ 2] 3186 	subw x,txtend 
      009122 A6 08 CD 90      [ 2] 3187 	ldw y,basicptr 
      009126 82 85 20 08      [ 2] 3188 	cpw y,txtend 
      00912A 25 0A            [ 1] 3189 	jrult 1$
      00912A 55 00 03         [ 1] 3190 	push count 
      00912D 00 02            [ 1] 3191 	push #0 
      00912F 4F 20 09         [ 2] 3192 	subw x,(1,sp)
      009132                       3193 	_drop 2 
      009132 A6 11            [ 2]    1     addw sp,#2 
      009134 11               [ 2] 3194 1$:	srlw x 
      009135 01 26 01         [ 2] 3195 	ldw array_size,x
      009138 50 84            [ 1] 3196 	ld a,#TK_INTGR
      009139 81               [ 4] 3197 	ret 
                                   3198 
                                   3199 ;-----------------------------
                                   3200 ; BASIC: LET var=expr 
                                   3201 ; variable assignement 
                                   3202 ; output:
                                   3203 ;   A 		TK_NONE 
                                   3204 ;-----------------------------
      001228                       3205 let:
      009139 A6 84 6B         [ 4] 3206 	call next_token 
      00913B A1 85            [ 1] 3207 	cp a,#TK_VAR 
      00913B 5B 01            [ 1] 3208 	jreq let_var
      00913D 81 06            [ 1] 3209 	cp a,#TK_ARRAY 
      00913E 27 03            [ 1] 3210 	jreq  let_array
      00913E 52 03 CD         [ 2] 3211 	jp syntax_error
      001236                       3212 let_array:
      009141 90 E4 A1         [ 4] 3213 	call get_array_element
      001239                       3214 let_var:
      009144 02               [ 2] 3215 	pushw x  
      009145 25 43 6B         [ 4] 3216 	call next_token 
      009147 A1 32            [ 1] 3217 	cp a,#TK_EQUAL
      009147 1F 01            [ 1] 3218 	jreq 1$
      009149 CD 89 EB         [ 2] 3219 	jp syntax_error
      001244                       3220 1$:	
      00914C A1 02 25         [ 4] 3221 	call relation   
      00914F 36 6B            [ 1] 3222 	cp a,#TK_INTGR 
      009151 03 A4            [ 1] 3223 	jreq 2$
      009153 30 A1 20         [ 2] 3224 	jp syntax_error
      00124E                       3225 2$:	
      009156 27 07            [ 1] 3226 	ldw y,x 
      009158 55               [ 2] 3227 	popw x   
      009159 00               [ 2] 3228 	ldw (x),y   
      00915A 03               [ 4] 3229 	ret 
                                   3230 
                                   3231 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3232 ; BASIC: LIST [[start][,end]]
                                   3233 ; list program lines 
                                   3234 ; form start to end 
                                   3235 ; if empty argument list then 
                                   3236 ; list all.
                                   3237 ;----------------------------
                           000001  3238 	FIRST=1
                           000003  3239 	LAST=3 
                           000005  3240 	LN_PTR=5
                           000006  3241 	VSIZE=6 
      001253                       3242 list:
      00915B 00 02 20         [ 2] 3243 	ldw x,txtbgn 
      00915E 27 00 1E         [ 2] 3244 	cpw x,txtend 
      00915F 2B 01            [ 1] 3245 	jrmi 1$
      00915F CD               [ 4] 3246 	ret 
      00125C                       3247 1$:	
      00125C                       3248 	_vars VSIZE
      009160 90 E4            [ 2]    1     sub sp,#VSIZE 
      009162 A1 84            [ 2] 3249 	ldw (LN_PTR,sp),x 
      009164 27               [ 2] 3250 	ldw x,(x) 
      009165 03 CC            [ 2] 3251 	ldw (FIRST,sp),x ; list from first line 
      009167 88 F9 90         [ 2] 3252 	ldw x,#MAX_LINENO ; biggest line number 
      00916A 93 1E            [ 2] 3253 	ldw (LAST,sp),x 
      00916C 01 7B 03         [ 4] 3254 	call arg_list
      00916F A1               [ 1] 3255 	tnz a
      009170 20 26            [ 1] 3256 	jreq list_loop 
      009172 05 CD            [ 1] 3257 	cp a,#2 
      009174 8F 13            [ 1] 3258 	jreq 4$
      009176 20 CF            [ 1] 3259 	cp a,#1 
      009178 A1 21            [ 1] 3260 	jreq first_line 
      00917A 26 05 CD         [ 2] 3261 	jp syntax_error 
      00917D 8F               [ 2] 3262 4$:	popw x 
      00917E CC 20            [ 2] 3263 	ldw (LAST+2,sp),x 
      00127C                       3264 first_line:
      009180 C6               [ 2] 3265 	popw x
      009181 CD 8F            [ 2] 3266 	ldw (FIRST,sp),x 
      00127F                       3267 lines_skip:
      009183 E2 20 C1         [ 2] 3268 	ldw x,txtbgn
      009186 1E 01            [ 2] 3269 2$:	ldw (LN_PTR,sp),x 
      009188 A6 84 1E         [ 2] 3270 	cpw x,txtend 
      00918A 2A 38            [ 1] 3271 	jrpl list_exit 
      00918A 5B               [ 2] 3272 	ldw x,(x) ;line# 
      00918B 03 81            [ 2] 3273 	cpw x,(FIRST,sp)
      00918D 2A 11            [ 1] 3274 	jrpl list_loop 
      00918D 52 03            [ 2] 3275 	ldw x,(LN_PTR,sp) 
      00918F CD 91            [ 1] 3276 	ld a,(2,x)
      009191 3E A1 02         [ 1] 3277 	ld acc8,a 
      009194 25 3D 1F 01      [ 1] 3278 	clr acc16 
      009198 CD 89 EB A1      [ 2] 3279 	addw x,acc16
      00919C 02 25            [ 2] 3280 	jra 2$ 
                                   3281 ; print loop
      00129F                       3282 list_loop:
      00919E 30 6B            [ 2] 3283 	ldw x,(LN_PTR,sp)
      0091A0 03 A4            [ 1] 3284 	ld a,(2,x) 
      0091A2 30 A1 10         [ 4] 3285 	call prt_basic_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091A5 27 07            [ 2] 3286 	ldw x,(LN_PTR,sp)
      0091A7 55 00            [ 1] 3287 	ld a,(2,x)
      0091A9 03 00 02         [ 1] 3288 	ld acc8,a 
      0091AC 20 21 00 0C      [ 1] 3289 	clr acc16 
      0091AE 72 BB 00 0C      [ 2] 3290 	addw x,acc16
      0091AE CD 91 3E         [ 2] 3291 	cpw x,txtend 
      0091B1 A1 84            [ 1] 3292 	jrpl list_exit
      0091B3 27 03            [ 2] 3293 	ldw (LN_PTR,sp),x
      0091B5 CC               [ 2] 3294 	ldw x,(x)
      0091B6 88 F9            [ 2] 3295 	cpw x,(LAST,sp)  
      0091B8 CF 00            [ 1] 3296 	jrslt list_loop
      0012C1                       3297 list_exit:
      0091BA 0D 1E 01 7B 03   [ 1] 3298 	mov in,count 
      0091BF A1 10 26         [ 2] 3299 	ldw x,#pad 
      0091C2 06 72 BB         [ 2] 3300 	ldw basicptr,x 
      0012CC                       3301 	_drop VSIZE 
      0091C5 00 0D            [ 2]    1     addw sp,#VSIZE 
      0091C7 20               [ 4] 3302 	ret
                                   3303 
                                   3304 ;-------------------------
                                   3305 ; copy command name to buffer  
                                   3306 ; input:
                                   3307 ;   X 	name address 
                                   3308 ;   Y   destination buffer 
                                   3309 ; output:
                                   3310 ;   Y   point after name  
                                   3311 ;--------------------------
      0012CF                       3312 cpy_cmd_name:
      0091C8 CD               [ 1] 3313 	ld a,(x)
      0091C9 72               [ 2] 3314 	incw x
      0091CA B0 00            [ 1] 3315 	and a,#15  
      0091CC 0D               [ 1] 3316 	push a 
      0091CD 20 C7            [ 1] 3317     tnz (1,sp) 
      0091CF 1E 01            [ 1] 3318 	jreq 9$
      0091D1 A6               [ 1] 3319 1$:	ld a,(x)
      0091D2 84 F7            [ 1] 3320 	ld (y),a  
      0091D3 5C               [ 2] 3321 	incw x
      0091D3 5B 03            [ 2] 3322 	incw y 
      0091D5 81 01            [ 1] 3323 	dec (1,sp)	 
      0091D6 26 F6            [ 1] 3324 	jrne 1$
      0091D6 52               [ 1] 3325 9$: pop a 
      0091D7 03               [ 4] 3326 	ret	
                                   3327 
                                   3328 ;--------------------------
                                   3329 ; add a space after letter or 
                                   3330 ; digit.
                                   3331 ; input:
                                   3332 ;   Y     pointer to buffer 
                                   3333 ; output:
                                   3334 ;   Y    moved to end 
                                   3335 ;--------------------------
      0012E4                       3336 add_space:
      0091D8 CD 91            [ 2] 3337 	decw y 
      0091DA 8D A1            [ 1] 3338 	ld a,(y)
      0091DC 02 25            [ 2] 3339 	incw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091DE 4F 1F 01         [ 4] 3340 	call is_alnum 
      0091E1 CD 89            [ 1] 3341 	jrnc 1$
      0091E3 EB A1            [ 1] 3342 	ld a,#SPACE 
      0091E5 02 25            [ 1] 3343 	ld (y),a 
      0091E7 42 5C            [ 2] 3344 	incw y 
      0091E8 81               [ 4] 3345 1$: ret 
                                   3346 
                                   3347 ;--------------------------
                                   3348 ;  align text in buffer 
                                   3349 ;  to tab_width padding 
                                   3350 ;  left with  SPACE 
                                   3351 ; input:
                                   3352 ;   X      str*
                                   3353 ;   A      str_length 
                                   3354 ; output:
                                   3355 ;   X      ajusted
                                   3356 ;--------------------------
      0012F6                       3357 right_align:
      0091E8 6B               [ 1] 3358 	push a 
      0091E9 03 A4            [ 1] 3359 0$: ld a,(1,sp)
      0091EB 30 A1 30         [ 1] 3360 	cp a,tab_width 
      0091EE 27 07            [ 1] 3361 	jrpl 1$
      0091F0 55 00            [ 1] 3362 	ld a,#SPACE 
      0091F2 03               [ 2] 3363 	decw x
      0091F3 00               [ 1] 3364 	ld (x),a  
      0091F4 02 20            [ 1] 3365 	inc (1,sp)
      0091F6 33 F1            [ 2] 3366 	jra 0$ 
      0091F7 84               [ 1] 3367 1$: pop a 	
      0091F7 CD               [ 4] 3368 	ret 
                                   3369 
                                   3370 ;--------------------------
                                   3371 ; print TK_QSTR
                                   3372 ; converting control character
                                   3373 ; to backslash sequence
                                   3374 ; input:
                                   3375 ;   X        char *
                                   3376 ;   Y        dest. buffer 
                                   3377 ; output:
                                   3378 ;   X        moved forward 
                                   3379 ;   Y        moved forward 
                                   3380 ;-----------------------------
      001308                       3381 cpy_quote:
      0091F8 91 8D            [ 1] 3382 	ld a,#'"
      0091FA A1 84            [ 1] 3383 	ld (y),a 
      0091FC 27 03            [ 2] 3384 	incw y 
      0091FE CC               [ 1] 3385 1$:	ld a,(x)
      0091FF 88 F9            [ 1] 3386 	jreq 9$
      009201 CF               [ 2] 3387 	incw x 
      009202 00 0D            [ 1] 3388 	cp a,#SPACE 
      009204 1E 01            [ 1] 3389 	jrult 3$
      009206 72 B0            [ 1] 3390 	ld (y),a
      009208 00 0D            [ 2] 3391 	incw y 
      00920A 26 06            [ 1] 3392 	cp a,#'\ 
      00920C 35 02            [ 1] 3393 	jrne 1$ 
      00131E                       3394 2$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00920E 00 0E            [ 1] 3395 	ld (y),a
      009210 20 0C            [ 2] 3396 	incw y  
      009212 20 EA            [ 2] 3397 	jra 1$
      009212 2C               [ 1] 3398 3$: push a 
      009213 06 35            [ 1] 3399 	ld a,#'\
      009215 04 00            [ 1] 3400 	ld (y),a 
      009217 0E 20            [ 2] 3401 	incw y  
      009219 04               [ 1] 3402 	pop a 
      00921A A0 07            [ 1] 3403 	sub a,#7
      00921A 35 01 00         [ 1] 3404 	ld acc8,a 
      00921D 0E 5F 00 0C      [ 1] 3405 	clr acc16
      00921E 89               [ 2] 3406 	pushw x
      00921E 5F C6 00         [ 2] 3407 	ldw x,#escaped 
      009221 0E 14 03 4D      [ 2] 3408 	addw x,acc16 
      009225 27               [ 1] 3409 	ld a,(x)
      009226 05               [ 2] 3410 	popw x
      009227 5C DD            [ 2] 3411 	jra 2$
      009228 A6 22            [ 1] 3412 9$: ld a,#'"
      009228 20 02            [ 1] 3413 	ld (y),a 
      00922A 1E 01            [ 2] 3414 	incw y  
      00922C 5C               [ 2] 3415 	incw x 
      00922C A6               [ 4] 3416 	ret
                                   3417 
                                   3418 ;--------------------------
                                   3419 ; return variable name 
                                   3420 ; from its address.
                                   3421 ; input:
                                   3422 ;   X    variable address
                                   3423 ; output:
                                   3424 ;   A     variable letter
                                   3425 ;--------------------------
      001349                       3426 var_name:
      00922D 84 00 2F         [ 2] 3427 		subw x,#vars 
      00922E 9F               [ 1] 3428 		ld a,xl 
      00922E 5B               [ 1] 3429 		srl a 
      00922F 03 81            [ 1] 3430 		add a,#'A 
      009231 81               [ 4] 3431 		ret 
                                   3432 
                                   3433 ;-----------------------------
                                   3434 ; return cmd  idx from its 
                                   3435 ; code address 
                                   3436 ; input:
                                   3437 ;   X      code address 
                                   3438 ; output:
                                   3439 ;   X      cmd_idx
                                   3440 ;-----------------------------
      001351                       3441 get_cmd_idx:
      009231 AE 92            [ 2] 3442 	pushw y
      009233 4B CD A8 C0      [ 2] 3443 	ldw y,#code_addr 
      009237 96 1C 00 03      [ 2] 3444 	ldw ptr16,y 
      00923B 90 AE            [ 1] 3445 	clrw y 
      00923D 18 00 CF         [ 5] 3446 1$:	cpw x,([ptr16],y)
      009240 00 0D            [ 1] 3447 	jreq 3$ 
      009242 72 B2            [ 2] 3448 	incw y 
      009244 00 0D CD         [ 4] 3449 	ld a,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009247 83 D9            [ 2] 3450 	incw y
      009249 4F 81 0A         [ 4] 3451 	or a,([ptr16],y)	
      00924C 63 6F            [ 1] 3452 	jrne 1$
      00924E 6E               [ 1] 3453 3$: ldw x,y 
      00924F 74 65            [ 2] 3454 	popw y 
      009251 6E               [ 4] 3455 	ret
                                   3456 
                                   3457 ;-------------------------------------
                                   3458 ; decompile tokens list 
                                   3459 ; to original text line 
                                   3460 ; input:
                                   3461 ;   [basicptr]  pointer at line 
                                   3462 ;   Y           destination buffer
                                   3463 ; output:
                                   3464 ;   A           length 
                                   3465 ;   Y           after string  
                                   3466 ;------------------------------------
                           000001  3467 	BASE_SAV=1
                           000002  3468 	WIDTH_SAV=2
                           000003  3469 	STR=3
                           000004  3470 	VSIZE=4 
      001372                       3471 decompile::
      001372                       3472 	_vars VSIZE
      009252 74 20            [ 2]    1     sub sp,#VSIZE 
      009254 6F 66 20         [ 1] 3473 	ld a,base
      009257 73 74            [ 1] 3474 	ld (BASE_SAV,sp),a  
      009259 61 63 6B         [ 1] 3475 	ld a,tab_width 
      00925C 20 66            [ 1] 3476 	ld (WIDTH_SAV,sp),a 
      00925E 72 6F            [ 2] 3477 	ldw (STR,sp),y   
      009260 6D 20 74 6F      [ 5] 3478 	ldw x,[basicptr] ; line number 
      009264 70 20 74 6F      [ 1] 3479 	mov base,#10
      009268 20 62 6F 74      [ 1] 3480 	mov tab_width,#5
      00926C 74 6F 6D 3A      [ 1] 3481 	clr acc24 
      009270 0A 00 0C         [ 2] 3482 	ldw acc16,x
      009272 CD 09 E4         [ 4] 3483 	call itoa  
      009272 35 10 00         [ 4] 3484 	call right_align 
      009275 0B               [ 1] 3485 	push a 
      009276 81 93            [ 1] 3486 1$:	ldw y,x ; source
      009277 1E 04            [ 2] 3487 	ldw x,(STR+1,sp) ; destination
      009277 35 0A 00         [ 4] 3488 	call strcpy 
      00927A 0B 81            [ 1] 3489 	clrw y 
      00927C 84               [ 1] 3490 	pop a 
      00927C AE 16            [ 1] 3491 	ld yl,a 
      00927E 90 72 B0         [ 2] 3492 	addw y,(STR,sp)
      009281 00 1F            [ 1] 3493 	ld a,#SPACE 
      009283 A6 84            [ 1] 3494 	ld (y),a 
      009285 81 5C            [ 2] 3495 	incw y 
      009286 72 5F 00 24      [ 1] 3496 	clr tab_width
      009286 AE 16 90         [ 2] 3497 	ldw x,#3
      009289 72 B0 00         [ 2] 3498 	ldw in.w,x 
      0013B9                       3499 decomp_loop:
      00928C 1F 90            [ 2] 3500 	pushw y
      00928E CE 00 05         [ 4] 3501 	call next_token 
      009291 90 C3            [ 2] 3502 	popw y 
      009293 00               [ 1] 3503 	tnz a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009294 1F 25            [ 1] 3504 	jrne 1$
      009296 0A 3B 00         [ 2] 3505 	jp 20$
      009299 04 4B            [ 1] 3506 1$:	jrpl 6$
                                   3507 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00929B 00 72            [ 1] 3508 	cp a,#TK_VAR 
      00929D F0 01            [ 1] 3509 	jrne 3$
                                   3510 ;; TK_VAR 
      00929F 5B 02 54         [ 4] 3511 	call add_space  
      0092A2 CF 00 22         [ 4] 3512 	call var_name
      0092A5 A6 84            [ 1] 3513 	ld (y),a 
      0092A7 81 5C            [ 2] 3514 	incw y  
      0092A8 20 E1            [ 2] 3515 	jra decomp_loop
      0013D8                       3516 3$:
      0092A8 CD 89            [ 1] 3517 	cp a,#TK_INTGR
      0092AA EB A1            [ 1] 3518 	jrne 4$
                                   3519 ;; TK_INTGR
      0092AC 85 27 0A         [ 4] 3520 	call add_space
      0092AF A1 06 27 03      [ 1] 3521 	clr acc24 
      0092B3 CC 88 F9         [ 2] 3522 	ldw acc16,x 
      0092B6 90 89            [ 2] 3523 	pushw y 
      0092B6 CD 90 BF         [ 4] 3524 	call itoa  
      0092B9 16 01            [ 2] 3525 	ldw y,(1,sp) 
      0092B9 89               [ 1] 3526 	push a 
      0092BA CD               [ 1] 3527 	exgw x,y 
      0092BB 89 EB A1         [ 4] 3528 	call strcpy 
      0092BE 32 27            [ 1] 3529 	clrw y
      0092C0 03               [ 1] 3530 	pop a  
      0092C1 CC 88            [ 1] 3531 	ld yl,a 
      0092C3 F9 F9 01         [ 2] 3532 	addw y,(1,sp)
      0092C4                       3533 	_drop 2 
      0092C4 CD 91            [ 2]    1     addw sp,#2 
      0092C6 D6 A1            [ 2] 3534 	jra decomp_loop
                                   3535 ;; dictionary keyword 
      0013FE                       3536 4$:	
      0092C8 84 27 03         [ 4] 3537 	call get_cmd_idx 
      0092CB CC 88 F9         [ 2] 3538 	cpw x,#REM_IDX
      0092CE 26 22            [ 1] 3539 	jrne 5$
      0092CE 90 93 85         [ 2] 3540 	ldw x,basicptr 
                                   3541 ; copy comment to buffer 
      0092D1 FF 81 E4         [ 4] 3542 	call add_space
      0092D3 A6 27            [ 1] 3543 	ld a,#''
      0092D3 CE 00            [ 1] 3544 	ld (y),a 
      0092D5 1D C3            [ 2] 3545 	incw y 
      001412                       3546 41$:
      0092D7 00 1F 2B 01      [ 4] 3547 	ld a,([in.w],x)
      0092DB 81 5C 00 01      [ 1] 3548 	inc in  
      0092DC 90 F7            [ 1] 3549 	ld (y),a 
      0092DC 52 06            [ 2] 3550 	incw y 
      0092DE 1F 05 FE         [ 1] 3551 	ld a,in 
      0092E1 1F 01 AE         [ 1] 3552 	cp a,count 
      0092E4 7F FF            [ 1] 3553 	jrmi 41$
      0092E6 1F 03            [ 2] 3554 	jra 20$  
                                   3555 ; insert command name 
      001428                       3556 5$:
      0092E8 CD 90 94         [ 4] 3557 	call add_space  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092EB 4D 27            [ 2] 3558 	pushw y
      0092ED 31 A1 02         [ 4] 3559 	call cmd_name
      0092F0 27 07            [ 2] 3560 	popw y 
      0092F2 A1 01 27         [ 4] 3561 	call cpy_cmd_name
      0092F5 06 CC            [ 2] 3562 	jra decomp_loop 
      001437                       3563 6$:
      0092F7 88 F9            [ 1] 3564 	cp a,#TK_QSTR 
      0092F9 85 1F            [ 1] 3565 	jrne 7$
                                   3566 ;; TK_QSTR
      0092FB 05 13 08         [ 4] 3567 	call cpy_quote  
      0092FC CC 13 B9         [ 2] 3568 	jp decomp_loop
      001441                       3569 7$:
      0092FC 85 1F            [ 1] 3570 	cp a,#TK_CHAR 
      0092FE 01 0E            [ 1] 3571 	jrne 8$
                                   3572 ;; TK_CHAR 
      0092FF A6 5C            [ 1] 3573 	ld a,#'\ 
      0092FF CE 00            [ 1] 3574 	ld (y),a 
      009301 1D 1F            [ 2] 3575 	incw y 
      009303 05               [ 1] 3576 	ld a,xl 
      009304 C3 00            [ 1] 3577 	ld (y),a 
      009306 1F 2A            [ 2] 3578 	incw y 
      009308 38 FE 13         [ 2] 3579 	jp decomp_loop
      00930B 01 2A            [ 1] 3580 8$: cp a,#TK_COLON 
      00930D 11 1E            [ 1] 3581 	jrne 9$
      00930F 05 E6            [ 1] 3582 	ld a,#':
      001459                       3583 81$:
      009311 02 C7            [ 1] 3584 	ld (y),a 
      009313 00 0E            [ 2] 3585 	incw y 
      00145D                       3586 82$:
      009315 72 5F 00         [ 2] 3587 	jp decomp_loop
      001460                       3588 9$: 
      009318 0D 72            [ 1] 3589 	cp a,#TK_SHARP
      00931A BB 00            [ 1] 3590 	jrugt 10$ 
      00931C 0D 20            [ 1] 3591 	sub a,#TK_ARRAY 
      00931E E3               [ 1] 3592 	clrw x 
      00931F 97               [ 1] 3593 	ld xl,a
      00931F 1E 05 E6         [ 2] 3594 	addw x,#single_char 
      009322 02               [ 1] 3595 	ld a,(x)
      009323 CD 95            [ 2] 3596 	jra 81$ 
      00146E                       3597 10$: 
      009325 5A 1E            [ 1] 3598 	cp a,#TK_MINUS 
      009327 05 E6            [ 1] 3599 	jrugt 11$
      009329 02 C7            [ 1] 3600 	sub a,#TK_PLUS 
      00932B 00               [ 1] 3601 	clrw x 
      00932C 0E               [ 1] 3602 	ld xl,a 
      00932D 72 5F 00         [ 2] 3603 	addw x,#add_char 
      009330 0D               [ 1] 3604 	ld a,(x)
      009331 72 BB            [ 2] 3605 	jra 81$
      00147C                       3606 11$:
      009333 00 0D            [ 1] 3607     cp a,#TK_MOD 
      009335 C3 00            [ 1] 3608 	jrugt 12$
      009337 1F 2A            [ 1] 3609 	sub a,#TK_MULT
      009339 07               [ 1] 3610 	clrw x 
      00933A 1F               [ 1] 3611 	ld xl,a 
      00933B 05 FE 13         [ 2] 3612 	addw x,#mul_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00933E 03               [ 1] 3613 	ld a,(x)
      00933F 2F DE            [ 2] 3614 	jra 81$
      009341                       3615 12$:
      009341 55 00            [ 1] 3616 	sub a,#TK_GT  
      009343 04               [ 1] 3617 	sll a 
      009344 00               [ 1] 3618 	clrw x 
      009345 02               [ 1] 3619 	ld xl,a 
      009346 AE 16 E0         [ 2] 3620 	addw x,#relop_str 
      009349 CF               [ 2] 3621 	ldw x,(x)
      00934A 00               [ 1] 3622 	ld a,(x)
      00934B 05               [ 2] 3623 	incw x 
      00934C 5B 06            [ 1] 3624 	ld (y),a
      00934E 81 5C            [ 2] 3625 	incw y 
      00934F F6               [ 1] 3626 	ld a,(x)
      00934F F6 5C            [ 1] 3627 	jrne 81$
      009351 A4 0F 88         [ 2] 3628 	jp decomp_loop 
      00149F                       3629 20$: 
      009354 0D 01            [ 1] 3630 	clr (y)
      009356 27 0A            [ 2] 3631 	ldw x,(STR,sp)
      009358 F6 90            [ 1] 3632 	ld a,(BASE_SAV,sp)
      00935A F7 5C 90         [ 1] 3633 	ld base,a 
      00935D 5C 0A            [ 1] 3634 	ld a,(WIDTH_SAV,sp)
      00935F 01 26 F6         [ 1] 3635 	ld tab_width,a
      009362 84 81 03         [ 2] 3636 	subw y,(STR,sp) 
      009364 90 9F            [ 1] 3637 	ld a,yl 
      0014B2                       3638 	_drop VSIZE 
      009364 90 5A            [ 2]    1     addw sp,#VSIZE 
      009366 90               [ 4] 3639 	ret 
                                   3640 
      009367 F6 90 5C CD 86        3641 single_char: .byte '@','(',')',',','#'
      00936C 07 24                 3642 add_char: .byte '+','-'
      00936E 06 A6 20              3643 mul_char: .byte '*','/','%'
      009371 90 F7 90 5C 81 CF 14  3644 relop_str: .word gt,equal,ge,lt,le,ne 
             D2 14 D4 14 D7
      009376 3E 00                 3645 gt: .asciz ">"
      009376 88 7B                 3646 equal: .asciz "="
      009378 01 C1 00              3647 ge: .asciz ">="
      00937B 25 2A                 3648 lt: .asciz "<"
      00937D 08 A6 20              3649 le: .asciz "<="
      009380 5A F7 0C              3650 ne:  .asciz "<>"
                                   3651 
                                   3652 
                                   3653 ;--------------------------
                                   3654 ; decompile line from token list
                                   3655 ; and print it. 
                                   3656 ; input:
                                   3657 ;   A       stop at this position 
                                   3658 ;   X 		pointer at line
                                   3659 ; output:
                                   3660 ;   none 
                                   3661 ;--------------------------	
      0014DA                       3662 prt_basic_line:
      009383 01 20 F1         [ 1] 3663 	ld count,a 
      009386 84 81            [ 1] 3664 	ld a,(2,x)
      009388 C1 00 03         [ 1] 3665 	cp a,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009388 A6 22            [ 1] 3666 	jrpl 1$ 
      00938A 90 F7 90         [ 1] 3667 	ld count,a 
      00938D 5C F6 27         [ 2] 3668 1$:	ldw basicptr,x 
      009390 30 5C A1 20      [ 2] 3669 	ldw y,#tib  
      009394 25 0E 90         [ 4] 3670 	call decompile 
      009397 F7 90 5C         [ 4] 3671 	call puts 
      00939A A1 5C            [ 1] 3672 	ld a,#CR 
      00939C 26 F0 C0         [ 4] 3673 	call putc 
      00939E 81               [ 4] 3674 	ret 
                                   3675 
                                   3676 
                                   3677 
                                   3678 ;---------------------------------
                                   3679 ; BASIC: PRINT|? arg_list 
                                   3680 ; print values from argument list
                                   3681 ;----------------------------------
                           000001  3682 	COMMA=1
                           000001  3683 	VSIZE=1
      0014FA                       3684 print:
      00939E 90 F7            [ 1] 3685 push #0 ; local variable COMMA 
      0014FC                       3686 reset_comma:
      0093A0 90 5C            [ 1] 3687 	clr (COMMA,sp)
      0014FE                       3688 prt_loop:
      0093A2 20 EA 88         [ 4] 3689 	call next_token
      0093A5 A6 5C            [ 1] 3690 	cp a,#CMD_END 
      0093A7 90 F7            [ 1] 3691 	jrult print_exit ; colon or end of line 
      0093A9 90 5C            [ 1] 3692 	cp a,#TK_QSTR
      0093AB 84 A0            [ 1] 3693 	jreq 1$
      0093AD 07 C7            [ 1] 3694 	cp a,#TK_CHAR 
      0093AF 00 0E            [ 1] 3695 	jreq 2$ 
      0093B1 72 5F            [ 1] 3696 	cp a,#TK_CFUNC 
      0093B3 00 0D            [ 1] 3697 	jreq 3$
      0093B5 89 AE            [ 1] 3698 	cp a,#TK_COMMA 
      0093B7 8B 90            [ 1] 3699 	jreq 4$
      0093B9 72 BB            [ 1] 3700 	cp a,#TK_SHARP 
      0093BB 00 0D            [ 1] 3701 	jreq 5$
      0093BD F6 85            [ 2] 3702 	jra 7$ 
      00151B                       3703 1$:	; print string 
      0093BF 20 DD A6         [ 4] 3704 	call puts
      0093C2 22 90            [ 2] 3705 	jra reset_comma
      001520                       3706 2$:	; print character 
      0093C4 F7               [ 1] 3707 	ld a,xl 
      0093C5 90 5C 5C         [ 4] 3708 	call putc 
      0093C8 81 D6            [ 2] 3709 	jra reset_comma 
      0093C9                       3710 3$: ; print character function value  	
      0093C9 1D               [ 4] 3711 	call (x)
      0093CA 00               [ 1] 3712 	ld a,xl 
      0093CB 30 9F 44         [ 4] 3713 	call putc
      0093CE AB 41            [ 2] 3714 	jra reset_comma 
      00152D                       3715 4$: ; set comma state 
      0093D0 81 FF            [ 1] 3716 	ld a,#255 
      0093D1 6B 01            [ 1] 3717 	ld (COMMA,sp),a  
      0093D1 90 89 90         [ 2] 3718 	jp prt_loop   
      001534                       3719 5$: ; # character must be followed by an integer   
      0093D4 AE A7 3D         [ 4] 3720 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093D7 90 CF            [ 1] 3721 	cp a,#TK_INTGR 
      0093D9 00 18            [ 1] 3722 	jreq 6$
      0093DB 90 5F 91         [ 2] 3723 	jp syntax_error 
      00153E                       3724 6$: ; set tab width
      0093DE D3               [ 1] 3725 	ld a,xl 
      0093DF 18 27            [ 1] 3726 	and a,#15 
      0093E1 0C 90 5C         [ 1] 3727 	ld tab_width,a 
      0093E4 91 D6            [ 2] 3728 	jra reset_comma 
      001546                       3729 7$:	
      001546                       3730 	_unget_token
      0093E6 18 90 5C 91 DA   [ 1]    1     mov in,in.saved
      0093EB 18 26 EF         [ 4] 3731 	call relation 
      0093EE 93 90            [ 1] 3732 	cp a,#TK_INTGR
      0093F0 85 81            [ 1] 3733 	jreq 8$
      0093F2                       3734 	_unget_token
      0093F2 52 04 C6 00 0B   [ 1]    1     mov in,in.saved
      0093F7 6B 01 C6         [ 2] 3735 	jp print_exit 
      0093FA 00 25 6B         [ 4] 3736 8$: call print_int 
      0093FD 02 17            [ 2] 3737 	jra reset_comma 
      00155F                       3738 print_exit:
      0093FF 03 72            [ 1] 3739 	tnz (COMMA,sp)
      009401 CE 00            [ 1] 3740 	jrne 9$
      009403 05 35            [ 1] 3741 	ld a,#CR 
      009405 0A 00 0B         [ 4] 3742     call putc 
      001568                       3743 9$:	_drop VSIZE 
      009408 35 05            [ 2]    1     addw sp,#VSIZE 
      00940A 00               [ 4] 3744 	ret 
                                   3745 
                                   3746 ;----------------------
                                   3747 ; 'save_context' and
                                   3748 ; 'rest_context' must be 
                                   3749 ; called at the same 
                                   3750 ; call stack depth 
                                   3751 ; i.e. SP must have the 
                                   3752 ; save value at  
                                   3753 ; entry point of both 
                                   3754 ; routine. 
                                   3755 ;---------------------
                           000004  3756 	CTXT_SIZE=4 ; size of saved data 
                                   3757 ;--------------------
                                   3758 ; save current BASIC
                                   3759 ; interpreter context 
                                   3760 ; on stack 
                                   3761 ;--------------------
      00156B                       3762 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00156B                       3763 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00156B                       3764 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00156B                       3765 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00156B                       3766 save_context:
      00940B 25 72 5F         [ 2] 3767 	ldw x,basicptr 
      00940E 00 0C            [ 2] 3768 	ldw (BPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009410 CF 00 0D         [ 1] 3769 	ld a,in 
      009413 CD 8A            [ 1] 3770 	ld (IN,sp),a
      009415 64 CD 93         [ 1] 3771 	ld a,count 
      009418 76 88            [ 1] 3772 	ld (CNT,sp),a  
      00941A 90               [ 4] 3773 	ret
                                   3774 
                                   3775 ;-----------------------
                                   3776 ; restore previously saved 
                                   3777 ; BASIC interpreter context 
                                   3778 ; from stack 
                                   3779 ;-------------------------
      00157B                       3780 rest_context:
      00941B 93 1E            [ 2] 3781 	ldw x,(BPTR,sp)
      00941D 04 CD 84         [ 2] 3782 	ldw basicptr,x 
      009420 32 90            [ 1] 3783 	ld a,(IN,sp)
      009422 5F 84 90         [ 1] 3784 	ld in,a
      009425 97 72            [ 1] 3785 	ld a,(CNT,sp)
      009427 F9 03 A6         [ 1] 3786 	ld count,a  
      00942A 20               [ 4] 3787 	ret
                                   3788 
                                   3789 
                                   3790 
                                   3791 ;------------------------------------------
                                   3792 ; BASIC: INPUT [string]var[,[string]var]
                                   3793 ; input value in variables 
                                   3794 ; [string] optionally can be used as prompt 
                                   3795 ;-----------------------------------------
                           000001  3796 	CX_BPTR=1
                           000003  3797 	CX_IN=3
                           000004  3798 	CX_CNT=4
                           000005  3799 	SKIP=5
                           000006  3800 	VAR_ADDR=6
                           000007  3801 	VSIZE=7
      00158B                       3802 input_var:
      00158B                       3803 	_vars VSIZE 
      00942B 90 F7            [ 2]    1     sub sp,#VSIZE 
      00158D                       3804 input_loop:
      00942D 90 5C            [ 1] 3805 	clr (SKIP,sp)
      00942F 72 5F 00         [ 4] 3806 	call next_token 
      009432 25 AE            [ 1] 3807 	cp a,#TK_QSTR 
      009434 00 03            [ 1] 3808 	jrne 1$ 
      009436 CF 00 01         [ 4] 3809 	call puts 
      009439 03 05            [ 1] 3810 	cpl (SKIP,sp)
      009439 90 89 CD         [ 4] 3811 	call next_token 
      00943C 89 EB            [ 1] 3812 1$: cp a,#TK_VAR  
      00943E 90 85            [ 1] 3813 	jreq 2$ 
      009440 4D 26 03         [ 2] 3814 	jp syntax_error
      009443 CC 95            [ 2] 3815 2$:	ldw (VAR_ADDR,sp),x 
      009445 1F 2A            [ 1] 3816 	tnz (SKIP,sp)
      009447 6F A1            [ 1] 3817 	jrne 21$ 
      009449 85 26 0C         [ 4] 3818 	call var_name 
      00944C CD 93 64         [ 4] 3819 	call putc   
      0015B1                       3820 21$:
      00944F CD 93            [ 1] 3821 	ld a,#':
      009451 C9 90 F7         [ 4] 3822 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009454 90 5C 20         [ 4] 3823 	call save_context 
      009457 E1 5F 00 03      [ 1] 3824 	clr count  
      009458 CD 00 00         [ 4] 3825 	call readln 
      009458 A1 84 26         [ 2] 3826 	ldw x,#tib 
      00945B 22 CD 93         [ 1] 3827 	push count
      00945E 64 72            [ 1] 3828 	push #0 
      009460 5F 00 0C         [ 2] 3829 	addw x,(1,sp)
      009463 CF               [ 2] 3830 	incw x 
      0015CC                       3831 	_drop 2 
      009464 00 0D            [ 2]    1     addw sp,#2 
      009466 90 89 CD 8A      [ 1] 3832 	clr in 
      00946A 64 16 01         [ 4] 3833 	call get_token
      00946D 88 51            [ 1] 3834 	cp a,#TK_INTGR
      00946F CD 84            [ 1] 3835 	jreq 3$ 
      009471 32 90 5F         [ 4] 3836 	call rest_context 
      009474 84 90 97         [ 2] 3837 	jp syntax_error
      009477 72 F9            [ 2] 3838 3$: ldw y,(VAR_ADDR,sp) 
      009479 01 5B            [ 2] 3839 	ldw (y),x 
      00947B 02 20 BB         [ 4] 3840 	call rest_context
      00947E CD 09 6B         [ 4] 3841 	call next_token 
      00947E CD 93            [ 1] 3842 	cp a,#TK_COMMA 
      009480 D1 A3            [ 1] 3843 	jreq input_loop 
      009482 00 8E            [ 1] 3844 	cp a,#TK_COLON 
      009484 26 22            [ 2] 3845     jrule input_exit 
      009486 CE 00 05         [ 2] 3846 	jp syntax_error 
      0015F4                       3847 input_exit:
      0015F4                       3848 	_drop VSIZE 
      009489 CD 93            [ 2]    1     addw sp,#VSIZE 
      00948B 64               [ 4] 3849 	ret 
                                   3850 
                                   3851 
                                   3852 ;---------------------
                                   3853 ; BASIC: REMARK | ' 
                                   3854 ; skip comment to end of line 
                                   3855 ;---------------------- 
      0015F7                       3856 remark:
      00948C A6 27 90 F7 90   [ 1] 3857 	mov in,count 
      009491 5C               [ 4] 3858  	ret 
                                   3859 
                                   3860 
                                   3861 ;---------------------
                                   3862 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3863 ; read in loop 'addr'  
                                   3864 ; apply & 'mask' to value 
                                   3865 ; loop while result==0.  
                                   3866 ; 'xor_mask' is used to 
                                   3867 ; invert the wait logic.
                                   3868 ; i.e. loop while not 0.
                                   3869 ;---------------------
                           000001  3870 	XMASK=1 
                           000002  3871 	MASK=2
                           000003  3872 	ADDR=3
                           000004  3873 	VSIZE=4
      009492                       3874 wait: 
      0015FD                       3875 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009492 72 D6            [ 2]    1     sub sp,#VSIZE 
      009494 00 01            [ 1] 3876 	clr (XMASK,sp) 
      009496 72 5C 00         [ 4] 3877 	call arg_list 
      009499 02 90            [ 1] 3878 	cp a,#2
      00949B F7 90            [ 1] 3879 	jruge 0$
      00949D 5C C6 00         [ 2] 3880 	jp syntax_error 
      0094A0 02 C1            [ 1] 3881 0$:	cp a,#3
      0094A2 00 04            [ 1] 3882 	jrult 1$
      0094A4 2B               [ 2] 3883 	popw x 
      0094A5 EC               [ 1] 3884 	ld a,xl
      0094A6 20 77            [ 1] 3885 	ld (XMASK,sp),a 
      0094A8 85               [ 2] 3886 1$: popw x ; mask 
      0094A8 CD               [ 1] 3887 	ld a,xl 
      0094A9 93 64            [ 1] 3888 	ld (MASK,sp),a 
      0094AB 90               [ 2] 3889 	popw x ; address 
      0094AC 89               [ 1] 3890 2$:	ld a,(x)
      0094AD CD 90            [ 1] 3891 	and a,(MASK,sp)
      0094AF 03 90            [ 1] 3892 	xor a,(XMASK,sp)
      0094B1 85 CD            [ 1] 3893 	jreq 2$ 
      00161F                       3894 	_drop VSIZE 
      0094B3 93 4F            [ 2]    1     addw sp,#VSIZE 
      0094B5 20               [ 4] 3895 	ret 
                                   3896 
                                   3897 ;---------------------
                                   3898 ; BASIC: BSET addr,mask
                                   3899 ; set bits at 'addr' corresponding 
                                   3900 ; to those of 'mask' that are at 1.
                                   3901 ; arguments:
                                   3902 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3903 ;   mask        mask|addr
                                   3904 ; output:
                                   3905 ;	none 
                                   3906 ;--------------------------
      001622                       3907 bit_set:
      0094B6 82 10 14         [ 4] 3908 	call arg_list 
      0094B7 A1 02            [ 1] 3909 	cp a,#2	 
      0094B7 A1 02            [ 1] 3910 	jreq 1$ 
      0094B9 26 06 CD         [ 2] 3911 	jp syntax_error
      00162C                       3912 1$: 
      0094BC 93               [ 2] 3913 	popw x ; mask 
      0094BD 88               [ 1] 3914 	ld a,xl 
      0094BE CC               [ 2] 3915 	popw x ; addr  
      0094BF 94               [ 1] 3916 	or a,(x)
      0094C0 39               [ 1] 3917 	ld (x),a
      0094C1 81               [ 4] 3918 	ret 
                                   3919 
                                   3920 ;---------------------
                                   3921 ; BASIC: BRES addr,mask
                                   3922 ; reset bits at 'addr' corresponding 
                                   3923 ; to those of 'mask' that are at 1.
                                   3924 ; arguments:
                                   3925 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3926 ;   mask	    ~mask&*addr  
                                   3927 ; output:
                                   3928 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3929 ;--------------------------
      001632                       3930 bit_reset:
      0094C1 A1 03 26         [ 4] 3931 	call arg_list 
      0094C4 0E A6            [ 1] 3932 	cp a,#2  
      0094C6 5C 90            [ 1] 3933 	jreq 1$ 
      0094C8 F7 90 5C         [ 2] 3934 	jp syntax_error
      00163C                       3935 1$: 
      0094CB 9F               [ 2] 3936 	popw x ; mask 
      0094CC 90               [ 1] 3937 	ld a,xl 
      0094CD F7               [ 1] 3938 	cpl a 
      0094CE 90               [ 2] 3939 	popw x ; addr  
      0094CF 5C               [ 1] 3940 	and a,(x)
      0094D0 CC               [ 1] 3941 	ld (x),a 
      0094D1 94               [ 4] 3942 	ret 
                                   3943 
                                   3944 ;---------------------
                                   3945 ; BASIC: BTOGL addr,mask
                                   3946 ; toggle bits at 'addr' corresponding 
                                   3947 ; to those of 'mask' that are at 1.
                                   3948 ; arguments:
                                   3949 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3950 ;   mask	    mask^*addr  
                                   3951 ; output:
                                   3952 ;	none 
                                   3953 ;--------------------------
      001643                       3954 bit_toggle:
      0094D2 39 A1 01         [ 4] 3955 	call arg_list 
      0094D5 26 09            [ 1] 3956 	cp a,#2 
      0094D7 A6 3A            [ 1] 3957 	jreq 1$ 
      0094D9 CC 08 79         [ 2] 3958 	jp syntax_error
      0094D9 90               [ 2] 3959 1$: popw x ; mask 
      0094DA F7               [ 1] 3960 	ld a,xl 
      0094DB 90               [ 2] 3961 	popw x ; addr  
      0094DC 5C               [ 1] 3962 	xor a,(x)
      0094DD F7               [ 1] 3963 	ld (x),a 
      0094DD CC               [ 4] 3964 	ret 
                                   3965 
                                   3966 
                                   3967 ;---------------------
                                   3968 ; BASIC: BTEST(addr,bit)
                                   3969 ; return bit value at 'addr' 
                                   3970 ; bit is in range {0..7}.
                                   3971 ; arguments:
                                   3972 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3973 ;   bit 	    bit position {0..7}  
                                   3974 ; output:
                                   3975 ;	none 
                                   3976 ;--------------------------
      001653                       3977 bit_test:
      0094DE 94 39 0F         [ 4] 3978 	call func_args 
      0094E0 A1 02            [ 1] 3979 	cp a,#2
      0094E0 A1 0A            [ 1] 3980 	jreq 0$
      0094E2 22 0A A0         [ 2] 3981 	jp syntax_error
      00165D                       3982 0$:	
      0094E5 06               [ 2] 3983 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094E6 5F               [ 1] 3984 	ld a,xl 
      0094E7 97 1C            [ 1] 3985 	and a,#7
      0094E9 95               [ 1] 3986 	push a   
      0094EA 35 F6            [ 1] 3987 	ld a,#1 
      0094EC 20 EB            [ 1] 3988 1$: tnz (1,sp)
      0094EE 27 05            [ 1] 3989 	jreq 2$
      0094EE A1               [ 1] 3990 	sll a 
      0094EF 11 22            [ 1] 3991 	dec (1,sp)
      0094F1 0A A0            [ 2] 3992 	jra 1$
      00166D                       3993 2$: _drop 1 
      0094F3 10 5F            [ 2]    1     addw sp,#1 
      0094F5 97               [ 2] 3994 	popw x 
      0094F6 1C               [ 1] 3995 	and a,(x)
      0094F7 95 3A            [ 1] 3996 	jreq 3$
      0094F9 F6 20            [ 1] 3997 	ld a,#1 
      0094FB DD               [ 1] 3998 3$:	clrw x 
      0094FC 97               [ 1] 3999 	ld xl,a 
      0094FC A1 22            [ 1] 4000 	ld a,#TK_INTGR
      0094FE 22               [ 4] 4001 	ret
                                   4002 
                                   4003 
                                   4004 ;--------------------
                                   4005 ; BASIC: POKE addr,byte
                                   4006 ; put a byte at addr 
                                   4007 ;--------------------
      00167A                       4008 poke:
      0094FF 0A A0 20         [ 4] 4009 	call arg_list 
      009502 5F 97            [ 1] 4010 	cp a,#2
      009504 1C 95            [ 1] 4011 	jreq 1$
      009506 3C F6 20         [ 2] 4012 	jp syntax_error
      001684                       4013 1$:	
      009509 CF               [ 2] 4014 	popw x  
      00950A 9F               [ 1] 4015     ld a,xl 
      00950A A0               [ 2] 4016 	popw x 
      00950B 31               [ 1] 4017 	ld (x),a 
      00950C 48               [ 4] 4018 	ret 
                                   4019 
                                   4020 ;-----------------------
                                   4021 ; BASIC: PEEK(addr)
                                   4022 ; get the byte at addr 
                                   4023 ; input:
                                   4024 ;	none 
                                   4025 ; output:
                                   4026 ;	X 		value 
                                   4027 ;-----------------------
      001689                       4028 peek:
      00950D 5F 97 1C         [ 4] 4029 	call func_args
      009510 95 3F            [ 1] 4030 	cp a,#1 
      009512 FE F6            [ 1] 4031 	jreq 1$
      009514 5C 90 F7         [ 2] 4032 	jp syntax_error
      009517 90               [ 2] 4033 1$: popw x 
      009518 5C               [ 1] 4034 	ld a,(x)
      009519 F6               [ 1] 4035 	clrw x 
      00951A 26               [ 1] 4036 	ld xl,a 
      00951B BD CC            [ 1] 4037 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00951D 94               [ 4] 4038 	ret 
                                   4039 
                                   4040 ;---------------------------
                                   4041 ; BASIC IF expr : instructions
                                   4042 ; evaluate expr and if true 
                                   4043 ; execute instructions on same line. 
                                   4044 ;----------------------------
      00169A                       4045 if: 
      00951E 39 11 56         [ 4] 4046 	call relation 
      00951F A1 84            [ 1] 4047 	cp a,#TK_INTGR
      00951F 90 7F            [ 1] 4048 	jreq 1$ 
      009521 1E 03 7B         [ 2] 4049 	jp syntax_error
      009524 01               [ 1] 4050 1$:	clr a 
      009525 C7               [ 2] 4051 	tnzw x 
      009526 00 0B            [ 1] 4052 	jrne 9$  
                                   4053 ;skip to next line
      009528 7B 02 C7 00 25   [ 1] 4054 	mov in,count
      00952D 72               [ 4] 4055 9$:	ret 
                                   4056 
                                   4057 ;------------------------
                                   4058 ; BASIC: FOR var=expr 
                                   4059 ; set variable to expression 
                                   4060 ; leave variable address 
                                   4061 ; on stack and set
                                   4062 ; FLOOP bit in 'flags'
                                   4063 ;-----------------
                           000001  4064 	RETL1=1 ; return address  
                           000003  4065 	FSTEP=3  ; variable increment
                           000005  4066 	LIMIT=5 ; loop limit 
                           000007  4067 	CVAR=7   ; control variable 
                           000009  4068 	INW=9   ;  in.w saved
                           00000B  4069 	BPTR=11 ; baseptr saved
                           00000A  4070 	VSIZE=10  
      0016AE                       4071 for: ; { -- var_addr }
      00952E F2               [ 2] 4072 	popw x ; call return address 
      0016AF                       4073 	_vars VSIZE 
      00952F 03 90            [ 2]    1     sub sp,#VSIZE 
      009531 9F               [ 2] 4074 	pushw x  ; RETL1 
      009532 5B 04            [ 1] 4075 	ld a,#TK_VAR 
      009534 81 40 28         [ 4] 4076 	call expect
      009537 29 2C            [ 2] 4077 	ldw (CVAR,sp),x  ; control variable 
      009539 23 2B 2D         [ 4] 4078 	call let_var 
      00953C 2A 2F 25 95      [ 1] 4079 	bset flags,#FLOOP 
                                   4080 ; open space on stack for loop data 
      009540 4B               [ 1] 4081 	clrw x 
      009541 95 4D            [ 2] 4082 	ldw (BPTR,sp),x 
      009543 95 4F            [ 2] 4083 	ldw (INW,sp),x 
      009545 95 52 95         [ 4] 4084 	call next_token 
      009548 54 95            [ 1] 4085 	cp a,#TK_CMD 
      00954A 57 3E            [ 1] 4086 	jreq 1$
      00954C 00 3D 00         [ 2] 4087 	jp syntax_error
      0016CF                       4088 1$:  
      00954F 3E 3D 00         [ 2] 4089 	cpw x,#to 
      009552 3C 00            [ 1] 4090 	jreq to
      009554 3C 3D 00         [ 2] 4091 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4092 
                                   4093 ;-----------------------------------
                                   4094 ; BASIC: TO expr 
                                   4095 ; second part of FOR loop initilization
                                   4096 ; leave limit on stack and set 
                                   4097 ; FTO bit in 'flags'
                                   4098 ;-----------------------------------
      0016D7                       4099 to: ; { var_addr -- var_addr limit step }
      009557 3C 3E 00 23 03   [ 2] 4100 	btjt flags,#FLOOP,1$
      00955A CC 08 79         [ 2] 4101 	jp syntax_error
      00955A C7 00 04         [ 4] 4102 1$: call relation  
      00955D E6 02            [ 1] 4103 	cp a,#TK_INTGR 
      00955F C1 00            [ 1] 4104 	jreq 2$ 
      009561 04 2A 03         [ 2] 4105 	jp syntax_error
      009564 C7 00            [ 2] 4106 2$: ldw (LIMIT,sp),x
                                   4107 ;	ldw x,in.w 
      009566 04 CF 00         [ 4] 4108 	call next_token
      009569 05 90            [ 1] 4109 	cp a,#TK_NONE  
      00956B AE 16            [ 1] 4110 	jreq 4$ 
      00956D 90 CD            [ 1] 4111 	cp a,#TK_CMD
      00956F 93 F2            [ 1] 4112 	jrne 3$
      009571 CD A8 C0         [ 2] 4113 	cpw x,#step 
      009574 A6 0D            [ 1] 4114 	jreq step
      0016FB                       4115 3$:	
      0016FB                       4116 	_unget_token   	 
      009576 CD 83 40 81 01   [ 1]    1     mov in,in.saved
      00957A                       4117 4$:	
      00957A 4B 00 01         [ 2] 4118 	ldw x,#1   ; default step  
      00957C 1F 03            [ 2] 4119 	ldw (FSTEP,sp),x 
      00957C 0F 01            [ 2] 4120 	jra store_loop_addr 
                                   4121 
                                   4122 
                                   4123 ;----------------------------------
                                   4124 ; BASIC: STEP expr 
                                   4125 ; optional third par of FOR loop
                                   4126 ; initialization. 	
                                   4127 ;------------------------------------
      00957E                       4128 step: ; {var limit -- var limit step}
      00957E CD 89 EB A1 02   [ 2] 4129 	btjt flags,#FLOOP,1$
      009583 25 5A A1         [ 2] 4130 	jp syntax_error
      009586 02 27 12         [ 4] 4131 1$: call relation
      009589 A1 03            [ 1] 4132 	cp a,#TK_INTGR
      00958B 27 13            [ 1] 4133 	jreq 2$
      00958D A1 82 27         [ 2] 4134 	jp syntax_error
      009590 15 A1            [ 2] 4135 2$:	ldw (FSTEP,sp),x ; step
                                   4136 ; leave loop back entry point on cstack 
                                   4137 ; cstack is 1 call deep from interpreter
      00171B                       4138 store_loop_addr:
      009592 09 27 18         [ 2] 4139 	ldw x,basicptr  
      009595 A1 0A            [ 2] 4140 	ldw (BPTR,sp),x 
      009597 27 1B 20         [ 2] 4141 	ldw x,in.w 
      00959A 2B 09            [ 2] 4142 	ldw (INW,sp),x   
      00959B 72 15 00 23      [ 1] 4143 	bres flags,#FLOOP 
      00959B CD A8 C0 20      [ 1] 4144 	inc loop_depth  
      00959F DC               [ 4] 4145 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4146 
                                   4147 ;--------------------------------
                                   4148 ; BASIC: NEXT var 
                                   4149 ; FOR loop control 
                                   4150 ; increment variable with step 
                                   4151 ; and compare with limit 
                                   4152 ; loop if threshold not crossed.
                                   4153 ; else stack. 
                                   4154 ; and decrement 'loop_depth' 
                                   4155 ;--------------------------------
      0095A0                       4156 next: ; {var limit step retl1 -- [var limit step ] }
      0095A0 9F CD 83 40      [ 1] 4157 	tnz loop_depth 
      0095A4 20 D6            [ 1] 4158 	jrne 1$ 
      0095A6 CC 08 79         [ 2] 4159 	jp syntax_error 
      001737                       4160 1$: 
      0095A6 FD 9F            [ 1] 4161 	ld a,#TK_VAR 
      0095A8 CD 83 40         [ 4] 4162 	call expect
                                   4163 ; check for good variable after NEXT 	 
      0095AB 20 CF            [ 2] 4164 	cpw x,(CVAR,sp)
      0095AD 27 03            [ 1] 4165 	jreq 2$  
      0095AD A6 FF 6B         [ 2] 4166 	jp syntax_error ; not the good one 
      001743                       4167 2$: ; increment variable 
      0095B0 01               [ 2] 4168 	ldw x,(x)  ; get var value 
      0095B1 CC 95 7E         [ 2] 4169 	addw x,(FSTEP,sp) ; var+step 
      0095B4 16 07            [ 2] 4170 	ldw y,(CVAR,sp)
      0095B4 CD 89            [ 2] 4171 	ldw (y),x ; save var new value 
                                   4172 ; check sign of STEP  
      0095B6 EB A1            [ 1] 4173 	ld a,#0x80
      0095B8 84 27            [ 1] 4174 	bcp a,(FSTEP,sp)
      0095BA 03 CC            [ 1] 4175 	jrpl 4$
                                   4176 ;negative step 
      0095BC 88 F9            [ 2] 4177 	cpw x,(LIMIT,sp)
      0095BE 2F 1B            [ 1] 4178 	jrslt loop_done
      0095BE 9F A4            [ 2] 4179 	jra loop_back 
      001757                       4180 4$: ; positive step
      0095C0 0F C7            [ 2] 4181 	cpw x,(LIMIT,sp)
      0095C2 00 25            [ 1] 4182 	jrsgt loop_done
      00175B                       4183 loop_back:
      0095C4 20 B6            [ 2] 4184 	ldw x,(BPTR,sp)
      0095C6 CF 00 04         [ 2] 4185 	ldw basicptr,x 
      0095C6 55 00 03 00 02   [ 2] 4186 	btjf flags,#FRUN,1$ 
      0095CB CD 91            [ 1] 4187 	ld a,(2,x)
      0095CD D6 A1 84         [ 1] 4188 	ld count,a
      0095D0 27 08            [ 2] 4189 1$:	ldw x,(INW,sp)
      0095D2 55 00 03         [ 2] 4190 	ldw in.w,x 
      0095D5 00               [ 4] 4191 	ret 
      001770                       4192 loop_done:
                                   4193 	; remove loop data from stack  
      0095D6 02               [ 2] 4194 	popw x
      001771                       4195 	_drop VSIZE 
      0095D7 CC 95            [ 2]    1     addw sp,#VSIZE 
      0095D9 DF CD 8A 48      [ 1] 4196 	dec loop_depth 
                                   4197 ;	pushw x 
                                   4198 ;	ret 
      0095DD 20               [ 2] 4199 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4200 
                                   4201 ;----------------------------
                                   4202 ; called by goto/gosub
                                   4203 ; to get target line number 
                                   4204 ;---------------------------
      001778                       4205 get_target_line:
      0095DE 9D 11 56         [ 4] 4206 	call relation 
      0095DF A1 84            [ 1] 4207 	cp a,#TK_INTGR
      0095DF 0D 01            [ 1] 4208 	jreq 1$
      0095E1 26 05 A6         [ 2] 4209 	jp syntax_error
      0095E4 0D CD 83         [ 4] 4210 1$:	call search_lineno  
      0095E7 40               [ 2] 4211 	tnzw x 
      0095E8 5B 01            [ 1] 4212 	jrne 2$ 
      0095EA 81 05            [ 1] 4213 	ld a,#ERR_NO_LINE 
      0095EB CC 08 7B         [ 2] 4214 	jp tb_error 
      0095EB CE               [ 4] 4215 2$:	ret 
                                   4216 
                                   4217 ;------------------------
                                   4218 ; BASIC: GOTO line# 
                                   4219 ; jump to line# 
                                   4220 ; here cstack is 2 call deep from interpreter 
                                   4221 ;------------------------
      00178E                       4222 goto:
      0095EC 00 05 1F 03 C6   [ 2] 4223 	btjt flags,#FRUN,0$ 
      0095F1 00 02            [ 1] 4224 	ld a,#ERR_RUN_ONLY
      0095F3 6B 05 C6         [ 2] 4225 	jp tb_error 
      0095F6 00               [ 4] 4226 	ret 
      0095F7 04 6B 06         [ 4] 4227 0$:	call get_target_line
      00179C                       4228 jp_to_target:
      0095FA 81 00 04         [ 2] 4229 	ldw basicptr,x 
      0095FB E6 02            [ 1] 4230 	ld a,(2,x)
      0095FB 1E 03 CF         [ 1] 4231 	ld count,a 
      0095FE 00 05 7B 05      [ 1] 4232 	mov in,#3 
      009602 C7               [ 4] 4233 	ret 
                                   4234 
                                   4235 
                                   4236 ;--------------------
                                   4237 ; BASIC: GOSUB line#
                                   4238 ; basic subroutine call
                                   4239 ; actual line# and basicptr 
                                   4240 ; are saved on cstack
                                   4241 ; here cstack is 2 call deep from interpreter 
                                   4242 ;--------------------
                           000003  4243 	RET_ADDR=3
                           000005  4244 	RET_INW=5
                           000004  4245 	VSIZE=4  
      0017A9                       4246 gosub:
      009603 00 02 7B 06 C7   [ 2] 4247 	btjt flags,#FRUN,0$ 
      009608 00 04            [ 1] 4248 	ld a,#ERR_RUN_ONLY
      00960A 81 08 7B         [ 2] 4249 	jp tb_error 
      00960B 81               [ 4] 4250 	ret 
      00960B 52               [ 2] 4251 0$:	popw x 
      0017B5                       4252 	_vars VSIZE  
      00960C 07 04            [ 2]    1     sub sp,#VSIZE 
      00960D 89               [ 2] 4253 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00960D 0F 05 CD         [ 2] 4254 	ldw x,basicptr
      009610 89 EB            [ 2] 4255 	ldw (RET_ADDR,sp),x 
      009612 A1 02 26         [ 4] 4256 	call get_target_line  
      009615 08               [ 2] 4257 	pushw x 
      009616 CD A8 C0         [ 2] 4258 	ldw x,in.w 
      009619 03 05            [ 2] 4259 	ldw (RET_INW+2,sp),x
      00961B CD               [ 2] 4260 	popw x 
      00961C 89 EB            [ 2] 4261 	jra jp_to_target
                                   4262 
                                   4263 ;------------------------
                                   4264 ; BASIC: RETURN 
                                   4265 ; exit from a subroutine 
                                   4266 ; 
                                   4267 ;------------------------
      0017C9                       4268 return:
      00961E A1 85 27 03 CC   [ 2] 4269 	btjt flags,#FRUN,0$ 
      009623 88 F9            [ 1] 4270 	ld a,#ERR_RUN_ONLY
      009625 1F 06 0D         [ 2] 4271 	jp tb_error 
      0017D3                       4272 0$:	
      009628 05 26            [ 2] 4273 	ldw x,(RET_ADDR,sp) 
      00962A 06 CD 93         [ 2] 4274 	ldw basicptr,x
      00962D C9 CD            [ 1] 4275 	ld a,(2,x)
      00962F 83 40 03         [ 1] 4276 	ld count,a  
      009631 1E 05            [ 2] 4277 	ldw x,(RET_INW,sp)
      009631 A6 3A CD         [ 2] 4278 	ldw in.w,x 
      009634 83               [ 2] 4279 	popw x 
      0017E3                       4280 	_drop VSIZE 
      009635 40 CD            [ 2]    1     addw sp,#VSIZE 
      009637 95               [ 2] 4281 	pushw x
      009638 EB               [ 4] 4282 	ret  
                                   4283 
                                   4284 
                                   4285 ;----------------------------------
                                   4286 ; BASIC: RUN
                                   4287 ; run BASIC program in RAM
                                   4288 ;----------------------------------- 
      0017E7                       4289 run: 
      009639 72 5F 00 04 CD   [ 2] 4290 	btjf flags,#FRUN,0$  
      00963E A9               [ 1] 4291 	clr a 
      00963F C5               [ 4] 4292 	ret
      0017EE                       4293 0$: 
      009640 AE 16 90 3B 00   [ 2] 4294 	btjf flags,#FBREAK,1$
      0017F3                       4295 	_drop 2 
      009645 04 4B            [ 2]    1     addw sp,#2 
      009647 00 72 FB         [ 4] 4296 	call rest_context
      0017F8                       4297 	_drop CTXT_SIZE 
      00964A 01 5C            [ 2]    1     addw sp,#CTXT_SIZE 
      00964C 5B 02 72 5F      [ 1] 4298 	bres flags,#FBREAK 
      009650 00 02 CD 8C      [ 1] 4299 	bset flags,#FRUN 
      009654 6C A1 84         [ 2] 4300 	jp interpreter 
      009657 27 06 CD         [ 2] 4301 1$:	ldw x,txtbgn
      00965A 95 FB CC         [ 2] 4302 	cpw x,txtend 
      00965D 88 F9            [ 1] 4303 	jrmi run_it 
      00965F 16 06 90         [ 2] 4304 	ldw x,#err_no_prog
      009662 FF CD 95         [ 4] 4305 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009665 FB CD 89 EB A1   [ 1] 4306 	mov in,count
      00966A 09               [ 4] 4307 	ret 
      001819                       4308 run_it:	 
      00966B 27 A0 A1         [ 4] 4309     call ubound 
      00181C                       4310 	_drop 2 ; drop return address 
      00966E 01 23            [ 2]    1     addw sp,#2 
                                   4311 ; clear data pointer 
      009670 03               [ 1] 4312 	clrw x 
      009671 CC 88 F9         [ 2] 4313 	ldw data_ptr,x 
      009674 72 5F 00 08      [ 1] 4314 	clr data_ofs 
      009674 5B 07 81 09      [ 1] 4315 	clr data_len 
                                   4316 ; initialize BASIC pointer 
      009677 CE 00 1C         [ 2] 4317 	ldw x,txtbgn 
      009677 55 00 04         [ 2] 4318 	ldw basicptr,x 
      00967A 00 02            [ 1] 4319 	ld a,(2,x)
      00967C 81 00 03         [ 1] 4320 	ld count,a
      00967D 35 03 00 01      [ 1] 4321 	mov in,#3	
      00967D 52 04 0F 01      [ 1] 4322 	bset flags,#FRUN 
      009681 CD 90 94         [ 2] 4323 	jp interpreter 
                                   4324 
                                   4325 
                                   4326 ;----------------------
                                   4327 ; BASIC: END
                                   4328 ; end running program
                                   4329 ;---------------------- 
      001840                       4330 cmd_end: 
                                   4331 ; clean stack 
      009684 A1 02 24         [ 2] 4332 	ldw x,#STACK_EMPTY
      009687 03               [ 1] 4333 	ldw sp,x 
      009688 CC 88 F9         [ 2] 4334 	jp warm_start
                                   4335 
                                   4336 ;-----------------
                                   4337 ; 1 Khz beep 
                                   4338 ;-----------------
      001847                       4339 beep_1khz:: 
      00968B A1 03 25         [ 2] 4340 	ldw x,#100
      00968E 04 85 9F 6B      [ 2] 4341 	ldw y,#1000
      009692 01 85            [ 2] 4342 	jra beep
                                   4343 
                                   4344 ;-----------------------
                                   4345 ; BASIC: TONE expr1,expr2
                                   4346 ; used TIMER2 channel 1
                                   4347 ; to produce a tone 
                                   4348 ; arguments:
                                   4349 ;    expr1   frequency 
                                   4350 ;    expr2   duration msec.
                                   4351 ;---------------------------
      001850                       4352 tone:
      009694 9F 6B 02         [ 4] 4353 	call arg_list 
      009697 85 F6            [ 1] 4354 	cp a,#2 
      009699 14 02            [ 1] 4355 	jreq 1$
      00969B 18 01 27         [ 2] 4356 	jp syntax_error 
      00185A                       4357 1$: 
      00969E F9               [ 2] 4358 	popw x ; duration
      00969F 5B 04            [ 2] 4359 	popw y ; frequency 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00185D                       4360 beep:  
      0096A1 81               [ 2] 4361 	pushw x 
      0096A2 AE F4 24         [ 2] 4362 	ldw x,#TIM2_CLK_FREQ
      0096A2 CD               [ 2] 4363 	divw x,y 
                                   4364 ; round to nearest integer 
      0096A3 90 94 A1 02      [ 2] 4365 	cpw y,#TIM2_CLK_FREQ/2
      0096A7 27 03            [ 1] 4366 	jrmi 2$
      0096A9 CC               [ 2] 4367 	incw x 
      001869                       4368 2$:	 
      0096AA 88               [ 1] 4369 	ld a,xh 
      0096AB F9 53 0D         [ 1] 4370 	ld TIM2_ARRH,a 
      0096AC 9F               [ 1] 4371 	ld a,xl 
      0096AC 85 9F 85         [ 1] 4372 	ld TIM2_ARRL,a 
                                   4373 ; 50% duty cycle 
      0096AF FA               [ 1] 4374 	ccf 
      0096B0 F7               [ 2] 4375 	rrcw x 
      0096B1 81               [ 1] 4376 	ld a,xh 
      0096B2 C7 53 0F         [ 1] 4377 	ld TIM2_CCR1H,a 
      0096B2 CD               [ 1] 4378 	ld a,xl
      0096B3 90 94 A1         [ 1] 4379 	ld TIM2_CCR1L,a
      0096B6 02 27 03 CC      [ 1] 4380 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0096BA 88 F9 53 00      [ 1] 4381 	bset TIM2_CR1,#TIM2_CR1_CEN
      0096BC 72 10 53 04      [ 1] 4382 	bset TIM2_EGR,#TIM2_EGR_UG
      0096BC 85               [ 2] 4383 	popw x 
      0096BD 9F 43 85         [ 4] 4384 	call pause02
      0096C0 F4 F7 81 08      [ 1] 4385 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0096C3 72 11 53 00      [ 1] 4386 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0096C3 CD               [ 4] 4387 	ret 
                                   4388 
                                   4389 ;-------------------------------
                                   4390 ; BASIC: ADCON 0|1 [,divisor]  
                                   4391 ; disable/enanble ADC 
                                   4392 ;-------------------------------
                           000003  4393 	ONOFF=3 
                           000001  4394 	DIVSOR=1
                           000004  4395 	VSIZE=4 
      001894                       4396 power_adc:
      0096C4 90 94 A1         [ 4] 4397 	call arg_list 
      0096C7 02 27            [ 1] 4398 	cp a,#2	
      0096C9 03 CC            [ 1] 4399 	jreq 1$
      0096CB 88 F9            [ 1] 4400 	cp a,#1 
      0096CD 85 9F            [ 1] 4401 	jreq 0$ 
      0096CF 85 F8 F7         [ 2] 4402 	jp syntax_error 
      0096D2 81 00 00         [ 2] 4403 0$: ldw x,#0
      0096D3 89               [ 2] 4404 	pushw x  ; divisor 
      0096D3 CD 90            [ 2] 4405 1$: ldw x,(ONOFF,sp)
      0096D5 8F               [ 2] 4406 	tnzw x 
      0096D6 A1 02            [ 1] 4407 	jreq 2$ 
      0096D8 27 03            [ 2] 4408 	ldw x,(DIVSOR,sp) ; divisor 
      0096DA CC               [ 1] 4409 	ld a,xl
      0096DB 88 F9            [ 1] 4410 	and a,#7
      0096DD 4E               [ 1] 4411 	swap a 
      0096DD 85 9F A4         [ 1] 4412 	ld ADC_CR1,a
      0096E0 07 88 A6 01      [ 1] 4413 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096E4 0D 01 27 05      [ 1] 4414 	bset ADC_CR1,#ADC_CR1_ADON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0018BC                       4415 	_usec_dly 7 
      0096E8 48 0A 01         [ 2]    1     ldw x,#(16*7-2)/4
      0096EB 20               [ 2]    2     decw x
      0096EC F7               [ 1]    3     nop 
      0096ED 5B 01            [ 1]    4     jrne .-4
      0096EF 85 F4            [ 2] 4416 	jra 3$
      0096F1 27 02 A6 01      [ 1] 4417 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096F5 5F 97 A6 84      [ 1] 4418 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0018CD                       4419 3$:	_drop VSIZE 
      0096F9 81 04            [ 2]    1     addw sp,#VSIZE 
      0096FA 81               [ 4] 4420 	ret
                                   4421 
                                   4422 ;-----------------------------
                                   4423 ; BASIC: ADCREAD (channel)
                                   4424 ; read adc channel {0..5}
                                   4425 ; output:
                                   4426 ;   A 		TK_INTGR 
                                   4427 ;   X 		value 
                                   4428 ;-----------------------------
      0018D0                       4429 analog_read:
      0096FA CD 90 94         [ 4] 4430 	call func_args 
      0096FD A1 02            [ 1] 4431 	cp a,#1 
      0096FF 27 03            [ 1] 4432 	jreq 1$
      009701 CC 88 F9         [ 2] 4433 	jp syntax_error
      009704 85               [ 2] 4434 1$: popw x 
      009704 85 9F 85         [ 2] 4435 	cpw x,#5 
      009707 F7 81            [ 2] 4436 	jrule 2$
      009709 A6 0A            [ 1] 4437 	ld a,#ERR_BAD_VALUE
      009709 CD 90 8F         [ 2] 4438 	jp tb_error 
      00970C A1               [ 1] 4439 2$: ld a,xl
      00970D 01 27 03         [ 1] 4440 	ld acc8,a 
      009710 CC 88            [ 1] 4441 	ld a,#5
      009712 F9 85 F6         [ 1] 4442 	sub a,acc8 
      009715 5F 97 A6         [ 1] 4443 	ld ADC_CSR,a
      009718 84 81 54 02      [ 1] 4444 	bset ADC_CR2,#ADC_CR2_ALIGN
      00971A 72 10 54 01      [ 1] 4445 	bset ADC_CR1,#ADC_CR1_ADON
      00971A CD 91 D6 A1 84   [ 2] 4446 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00971F 27 03 CC         [ 2] 4447 	ldw x,ADC_DRH
      009722 88 F9            [ 1] 4448 	ld a,#TK_INTGR
      009724 4F               [ 4] 4449 	ret 
                                   4450 
                                   4451 ;-----------------------
                                   4452 ; BASIC: DREAD(pin)
                                   4453 ; Arduino pins 
                                   4454 ; read state of a digital pin 
                                   4455 ; pin# {0..15}
                                   4456 ; output:
                                   4457 ;    A 		TK_INTGR
                                   4458 ;    X      0|1 
                                   4459 ;-------------------------
                           000001  4460 	PINNO=1
                           000001  4461 	VSIZE=1
      001904                       4462 digital_read:
      001904                       4463 	_vars VSIZE 
      009725 5D 26            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009727 05 55 00         [ 4] 4464 	call func_args
      00972A 04 00            [ 1] 4465 	cp a,#1
      00972C 02 81            [ 1] 4466 	jreq 1$
      00972E CC 08 79         [ 2] 4467 	jp syntax_error
      00972E 85               [ 2] 4468 1$: popw x 
      00972F 52 0A 89         [ 2] 4469 	cpw x,#15 
      009732 A6 85            [ 2] 4470 	jrule 2$
      009734 CD 90            [ 1] 4471 	ld a,#ERR_BAD_VALUE
      009736 82 1F 07         [ 2] 4472 	jp tb_error 
      009739 CD 92 B9         [ 4] 4473 2$:	call select_pin 
      00973C 72 14            [ 1] 4474 	ld (PINNO,sp),a
      00973E 00 24            [ 1] 4475 	ld a,(GPIO_IDR,x)
      009740 5F 1F            [ 1] 4476 	tnz (PINNO,sp)
      009742 0B 1F            [ 1] 4477 	jreq 8$
      009744 09               [ 1] 4478 3$: srl a 
      009745 CD 89            [ 1] 4479 	dec (PINNO,sp)
      009747 EB A1            [ 1] 4480 	jrne 3$ 
      009749 80 27            [ 1] 4481 8$: and a,#1 
      00974B 03               [ 1] 4482 	clrw x 
      00974C CC               [ 1] 4483 	ld xl,a 
      00974D 88 F9            [ 1] 4484 	ld a,#TK_INTGR
      00974F                       4485 	_drop VSIZE
      00974F A3 97            [ 2]    1     addw sp,#VSIZE 
      009751 57               [ 4] 4486 	ret
                                   4487 
                                   4488 ;-----------------------
                                   4489 ; BASIC: DWRITE pin,0|1
                                   4490 ; Arduino pins 
                                   4491 ; write to a digital pin 
                                   4492 ; pin# {0..15}
                                   4493 ; output:
                                   4494 ;    A 		TK_INTGR
                                   4495 ;    X      0|1 
                                   4496 ;-------------------------
                           000001  4497 	PINNO=1
                           000002  4498 	PINVAL=2
                           000002  4499 	VSIZE=2
      001934                       4500 digital_write:
      001934                       4501 	_vars VSIZE 
      009752 27 03            [ 2]    1     sub sp,#VSIZE 
      009754 CC 88 F9         [ 4] 4502 	call arg_list  
      009757 A1 02            [ 1] 4503 	cp a,#2 
      009757 72 04            [ 1] 4504 	jreq 1$
      009759 00 24 03         [ 2] 4505 	jp syntax_error
      00975C CC               [ 2] 4506 1$: popw x 
      00975D 88               [ 1] 4507 	ld a,xl 
      00975E F9 CD            [ 1] 4508 	ld (PINVAL,sp),a
      009760 91               [ 2] 4509 	popw x 
      009761 D6 A1 84         [ 2] 4510 	cpw x,#15 
      009764 27 03            [ 2] 4511 	jrule 2$
      009766 CC 88            [ 1] 4512 	ld a,#ERR_BAD_VALUE
      009768 F9 1F 05         [ 2] 4513 	jp tb_error 
      00976B CD 89 EB         [ 4] 4514 2$:	call select_pin 
      00976E A1 00            [ 1] 4515 	ld (PINNO,sp),a 
      009770 27 0E            [ 1] 4516 	ld a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009772 A1 80            [ 1] 4517 	tnz (PINNO,sp)
      009774 26 05            [ 1] 4518 	jreq 4$
      009776 A3               [ 1] 4519 3$: sll a
      009777 97 87            [ 1] 4520 	dec (PINNO,sp)
      009779 27 0C            [ 1] 4521 	jrne 3$
      00977B 0D 02            [ 1] 4522 4$: tnz (PINVAL,sp)
      00977B 55 00            [ 1] 4523 	jrne 5$
      00977D 03               [ 1] 4524 	cpl a 
      00977E 00 02            [ 1] 4525 	and a,(GPIO_ODR,x)
      009780 20 02            [ 2] 4526 	jra 8$
      009780 AE 00            [ 1] 4527 5$: or a,(GPIO_ODR,x)
      009782 01 1F            [ 1] 4528 8$: ld (GPIO_ODR,x),a 
      00196C                       4529 	_drop VSIZE 
      009784 03 20            [ 2]    1     addw sp,#VSIZE 
      009786 14               [ 4] 4530 	ret
                                   4531 
                                   4532 
                                   4533 ;-----------------------
                                   4534 ; BASIC: STOP
                                   4535 ; stop progam execution  
                                   4536 ; without resetting pointers 
                                   4537 ; the program is resumed
                                   4538 ; with RUN 
                                   4539 ;-------------------------
      009787                       4540 stop:
      009787 72 04 00 24 03   [ 2] 4541 	btjt flags,#FRUN,2$
      00978C CC               [ 1] 4542 	clr a
      00978D 88               [ 4] 4543 	ret 
      001976                       4544 2$:	 
                                   4545 ; create space on cstack to save context 
      00978E F9 CD 91         [ 2] 4546 	ldw x,#break_point 
      009791 D6 A1 84         [ 4] 4547 	call puts 
      00197C                       4548 	_drop 2 ;drop return address 
      009794 27 03            [ 2]    1     addw sp,#2 
      00197E                       4549 	_vars CTXT_SIZE ; context size 
      009796 CC 88            [ 2]    1     sub sp,#CTXT_SIZE 
      009798 F9 1F 03         [ 4] 4550 	call save_context 
      00979B AE 16 90         [ 2] 4551 	ldw x,#tib 
      00979B CE 00 05         [ 2] 4552 	ldw basicptr,x
      00979E 1F               [ 1] 4553 	clr (x)
      00979F 0B CE 00 01      [ 1] 4554 	clr count  
      0097A3 1F               [ 1] 4555 	clrw x 
      0097A4 09 72 15         [ 2] 4556 	ldw in.w,x
      0097A7 00 24 72 5C      [ 1] 4557 	bres flags,#FRUN 
      0097AB 00 21 81 23      [ 1] 4558 	bset flags,#FBREAK
      0097AE CC 09 1F         [ 2] 4559 	jp interpreter 
      0097AE 72 5D 00 21 26 03 CC  4560 break_point: .asciz "\nbreak point, RUN to resume.\n"
             88 F9 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4561 
                                   4562 ;-----------------------
                                   4563 ; BASIC: NEW
                                   4564 ; from command line only 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4565 ; free program memory
                                   4566 ; and clear variables 
                                   4567 ;------------------------
      0097B7                       4568 new: 
      0097B7 A6 85 CD 90 82   [ 2] 4569 	btjf flags,#FRUN,0$ 
      0097BC 13               [ 4] 4570 	ret 
      0019C1                       4571 0$:	
      0097BD 07 27 03         [ 4] 4572 	call clear_basic 
      0097C0 CC               [ 4] 4573 	ret 
                                   4574 	 
                                   4575 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4576 ;  file system routines
                                   4577 ;  MCU flash memory from
                                   4578 ;  0x10000-0x27fff is 
                                   4579 ;  used to store BASIC 
                                   4580 ;  program files. 
                                   4581 ;  use 128 bytes sectors
                                   4582 ;  because this is the MCU 
                                   4583 ;  row size.
                                   4584 ;  file entry aligned to row
                                   4585 ;  	name  variable length
                                   4586 ;  	size  2 bytes  
                                   4587 ; 	data  variable length 
                                   4588 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4589 
                                   4590 ;---------------------------
                                   4591 ; fill pad with zeros 
                                   4592 ;--------------------------
      0019C5                       4593 zero_pad:
      0097C1 88 F9 E0         [ 2] 4594 	ldw x,#pad 
      0097C3 A6 80            [ 1] 4595 	ld a,#PAD_SIZE 
      0097C3 FE               [ 1] 4596 1$:	clr (x)
      0097C4 72               [ 2] 4597 	incw x 
      0097C5 FB               [ 1] 4598 	dec a 
      0097C6 03 16            [ 1] 4599 	jrne 1$
      0097C8 07               [ 4] 4600 	ret 
                                   4601 
                                   4602 ;--------------------------
                                   4603 ; align farptr to BLOCK_SIZE 
                                   4604 ;---------------------------
      0019D0                       4605 row_align:
      0097C9 90 FF            [ 1] 4606 	ld a,#0x7f 
      0097CB A6 80 15         [ 1] 4607 	and a,farptr+2 
      0097CE 03 2A            [ 1] 4608 	jreq 1$ 
      0097D0 06 13 05         [ 2] 4609 	ldw x,farptr+1 
      0097D3 2F 1B 20         [ 2] 4610 	addw x,#BLOCK_SIZE 
      0097D6 04 04            [ 1] 4611 	jrnc 0$
      0097D7 72 5C 00 16      [ 1] 4612 	inc farptr 
      0097D7 13               [ 1] 4613 0$: ld a,xl 
      0097D8 05 2C            [ 1] 4614 	and a,#0x80
      0097DA 15               [ 1] 4615 	ld xl,a
      0097DB CF 00 17         [ 2] 4616 	ldw farptr+1,x  	
      0097DB 1E               [ 4] 4617 1$:	ret
                                   4618 
                                   4619 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4620 ; input:
                                   4621 ;   X     increment 
                                   4622 ; output:
                                   4623 ;   farptr  incremented 
                                   4624 ;---------------------
      0019EB                       4625 incr_farptr:
      0097DC 0B CF 00 05      [ 2] 4626 	addw x,farptr+1 
      0097E0 72 01            [ 1] 4627 	jrnc 1$
      0097E2 00 24 05 E6      [ 1] 4628 	inc farptr 
      0097E6 02 C7 00         [ 2] 4629 1$:	ldw farptr+1,x  
      0097E9 04               [ 4] 4630 	ret 
                                   4631 
                                   4632 ;------------------------------
                                   4633 ; extended flash memory used as FLASH_DRIVE 
                                   4634 ; seek end of used flash drive   
                                   4635 ; starting at 0x10000 address.
                                   4636 ; 4 consecutives 0 bytes signal free space. 
                                   4637 ; input:
                                   4638 ;	none
                                   4639 ; output:
                                   4640 ;   ffree     free_addr| 0 if memory full.
                                   4641 ;------------------------------
      0019F9                       4642 seek_fdrive:
                                   4643 ; start scan at 0x10000 address 
      0097EA 1E 09            [ 1] 4644 	ld a,#1
      0097EC CF 00 01         [ 1] 4645 	ld farptr,a 
      0097EF 81               [ 1] 4646 	clrw x 
      0097F0 CF 00 17         [ 2] 4647 	ldw farptr+1,x 
      001A02                       4648 1$:
      0097F0 85 5B 0A         [ 2] 4649 	ldw x,#3  
      0097F3 72 5A 00 21      [ 5] 4650 2$:	ldf a,([farptr],x) 
      0097F7 FC 05            [ 1] 4651 	jrne 3$
      0097F8 5A               [ 2] 4652 	decw x
      0097F8 CD 91            [ 1] 4653 	jrpl 2$
      0097FA D6 A1            [ 2] 4654 	jra 4$ 
      0097FC 84 27 03         [ 2] 4655 3$:	ldw x,#BLOCK_SIZE 
      0097FF CC 88 F9         [ 4] 4656 	call incr_farptr
      009802 CD 84 82         [ 2] 4657 	ldw x,#0x280  
      009805 5D 26 05         [ 2] 4658 	cpw x,farptr
      009808 A6 05            [ 1] 4659 	jrmi 1$
      001A1E                       4660 4$: ; copy farptr to ffree	 
      00980A CC 88 FB         [ 2] 4661 	ldw x,farptr 
      00980D 81 00 18         [ 1] 4662 	ld a,farptr+2 
      00980E CF 00 19         [ 2] 4663 	ldw ffree,x 
      00980E 72 00 00         [ 1] 4664 	ld ffree+2,a  
      009811 24               [ 4] 4665 	ret 
                                   4666 
                                   4667 ;-----------------------
                                   4668 ; return amount of free 
                                   4669 ; space on flash drive
                                   4670 ; input:
                                   4671 ;   none
                                   4672 ; output:
                                   4673 ;   acc24   free space 
                                   4674 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      001A2B                       4675 disk_free:
      009812 06 A6 06         [ 2] 4676 	ldw x,#0x8000
      009815 CC 88 FB 81      [ 2] 4677 	subw x,ffree+1
      009819 CD 97            [ 1] 4678 	ld a,#2
      00981B F8 00 19         [ 1] 4679 	sbc a,ffree 
      00981C C7 00 0B         [ 1] 4680 	ld acc24,a 
      00981C CF 00 05         [ 2] 4681 	ldw acc16,x 
      00981F E6               [ 4] 4682 	ret 
                                   4683 
                                   4684 ;-----------------------
                                   4685 ; compare file name 
                                   4686 ; with name pointed by Y  
                                   4687 ; input:
                                   4688 ;   farptr   file name 
                                   4689 ;   Y        target name 
                                   4690 ; output:
                                   4691 ;   farptr 	 at file_name
                                   4692 ;   X 		 farptr[x] point at size field  
                                   4693 ;   Carry    0|1 no match|match  
                                   4694 ;----------------------
      001A3E                       4695 cmp_name:
      009820 02               [ 1] 4696 	clrw x
      009821 C7 00 04 35      [ 5] 4697 1$:	ldf a,([farptr],x)
      009825 03 00            [ 1] 4698 	cp a,(y)
      009827 02 81            [ 1] 4699 	jrne 4$
      009829 4D               [ 1] 4700 	tnz a 
      009829 72 00            [ 1] 4701 	jreq 9$ 
      00982B 00               [ 2] 4702     incw x 
      00982C 24 06            [ 2] 4703 	incw y 
      00982E A6 06            [ 2] 4704 	jra 1$
      001A4F                       4705 4$: ;no match 
      009830 CC               [ 1] 4706 	tnz a 
      009831 88 FB            [ 1] 4707 	jreq 5$
      009833 81               [ 2] 4708 	incw x 
      009834 85 52 04 89      [ 5] 4709 	ldf a,([farptr],x)
      009838 CE 00            [ 2] 4710 	jra 4$  
      00983A 05               [ 2] 4711 5$:	incw x ; farptr[x] point at 'size' field 
      00983B 1F               [ 1] 4712 	rcf 
      00983C 03               [ 4] 4713 	ret
      001A5C                       4714 9$: ; match  
      00983D CD               [ 2] 4715 	incw x  ; farptr[x] at 'size' field 
      00983E 97               [ 1] 4716 	scf 
      00983F F8               [ 4] 4717 	ret 
                                   4718 
                                   4719 ;-----------------------
                                   4720 ; search file in 
                                   4721 ; flash memory 
                                   4722 ; input:
                                   4723 ;   Y       file name  
                                   4724 ; output:
                                   4725 ;   farptr  addr at name|0
                                   4726 ;   X       offset to size field
                                   4727 ;-----------------------
                           000001  4728 	FSIZE=1
                           000003  4729 	YSAVE=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                           000004  4730 	VSIZE=4 
      001A5F                       4731 search_file: 
      001A5F                       4732 	_vars VSIZE
      009840 89 CE            [ 2]    1     sub sp,#VSIZE 
      009842 00 01            [ 2] 4733 	ldw (YSAVE,sp),y  
      009844 1F               [ 1] 4734 	clrw x 
      009845 07 85 20         [ 2] 4735 	ldw farptr+1,x 
      009848 D3 01 00 16      [ 1] 4736 	mov farptr,#1
      009849                       4737 1$:	
                                   4738 ; check if farptr is after any file 
                                   4739 ; if  0 then so.
      009849 72 00 00 24      [ 5] 4740 	ldf a,[farptr]
      00984D 05 A6            [ 1] 4741 	jreq 6$
      00984F 06               [ 1] 4742 2$: clrw x 	
      009850 CC 88            [ 2] 4743 	ldw y,(YSAVE,sp) 
      009852 FB 1A 3E         [ 4] 4744 	call cmp_name
      009853 25 2F            [ 1] 4745 	jrc 9$
      009853 1E 03 CF 00      [ 5] 4746 	ldf a,([farptr],x)
      009857 05 E6            [ 1] 4747 	ld (FSIZE,sp),a 
      009859 02               [ 2] 4748 	incw x 
      00985A C7 00 04 1E      [ 5] 4749 	ldf a,([farptr],x)
      00985E 05 CF            [ 1] 4750 	ld (FSIZE+1,sp),a 
      009860 00               [ 2] 4751 	incw x 
      009861 01 85 5B         [ 2] 4752 	addw x,(FSIZE,sp) ; skip over file data
      009864 04 89 81         [ 4] 4753 	call incr_farptr
      009867 CD 19 D0         [ 4] 4754 	call row_align  
      009867 72 01 00         [ 2] 4755 	ldw x,#0x280
      00986A 24 02 4F         [ 2] 4756 	cpw x,farptr 
      00986D 81 D3            [ 1] 4757 	jrpl 1$
      00986E                       4758 6$: ; file not found 
      00986E 72 09 00 24      [ 1] 4759 	clr farptr
      009872 12 5B 02 CD      [ 1] 4760 	clr farptr+1 
      009876 95 FB 5B 04      [ 1] 4761 	clr farptr+2 
      001AA4                       4762 	_drop VSIZE 
      00987A 72 19            [ 2]    1     addw sp,#VSIZE 
      00987C 00               [ 1] 4763 	rcf
      00987D 24               [ 4] 4764 	ret
      001AA8                       4765 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AA8                       4766 	_drop VSIZE 
      00987E 72 10            [ 2]    1     addw sp,#VSIZE 
      009880 00               [ 1] 4767 	scf 	
      009881 24               [ 4] 4768 	ret
                                   4769 
                                   4770 ;--------------------------------
                                   4771 ; BASIC: SAVE "name" 
                                   4772 ; save text program in 
                                   4773 ; flash memory used as permanent
                                   4774 ; storage from address 0x10000-0x27fff 
                                   4775 ;--------------------------------
                           000001  4776 	BSIZE=1
                           000003  4777 	NAMEPTR=3
                           000005  4778 	XSAVE=5
                           000007  4779 	YSAVE=7
                           000008  4780 	VSIZE=8 
      001AAC                       4781 save:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009882 CC 89 9F CE 00   [ 2] 4782 	btjf flags,#FRUN,0$ 
      009887 1D C3            [ 1] 4783 	ld a,#ERR_CMD_ONLY 
      009889 00 1F 2B         [ 2] 4784 	jp tb_error
      001AB6                       4785 0$:	 
      00988C 0C AE 88         [ 2] 4786 	ldw x,txtend 
      00988F 94 CD A8 C0      [ 2] 4787 	subw x,txtbgn
      009893 55 00            [ 1] 4788 	jrne 1$
                                   4789 ; nothing to save 
      009895 04 00 02         [ 2] 4790 	ldw x,#err_no_prog 
      009898 81 00 00         [ 4] 4791 	call puts 
      009899 55 00 03 00 01   [ 1] 4792 	mov in,count 
      009899 CD               [ 4] 4793 	ret  	
      001ACB                       4794 1$:	
      001ACB                       4795 	_vars VSIZE 
      00989A 92 86            [ 2]    1     sub sp,#VSIZE 
      00989C 5B 02            [ 2] 4796 	ldw (BSIZE,sp),x 
      00989E 5F CF 00         [ 4] 4797 	call next_token	
      0098A1 07 72            [ 1] 4798 	cp a,#TK_QSTR
      0098A3 5F 00            [ 1] 4799 	jreq 2$
      0098A5 09 72 5F         [ 2] 4800 	jp syntax_error
      001AD9                       4801 2$: 
      0098A8 00 0A            [ 2] 4802 	ldw (NAMEPTR,sp),x  
      0098AA CE 00 1D         [ 4] 4803 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4804 ; check if enough free space 
      0098AD CF 00 05         [ 4] 4805 	call strlen 
      0098B0 E6 02            [ 1] 4806 	add a,#3
      0098B2 C7               [ 1] 4807 	clrw x 
      0098B3 00               [ 1] 4808 	ld xl,a 
      0098B4 04 35 03         [ 2] 4809 	addw x,(BSIZE,sp)
      0098B7 00               [ 1] 4810 	clr a 
      0098B8 02 72 10 00      [ 2] 4811 	addw x,ffree+1 
      0098BC 24 CC 89         [ 1] 4812 	adc a,ffree 
      0098BF 9F 02            [ 1] 4813 	cp a,#2
      0098C0 2B 0A            [ 1] 4814 	jrmi 21$
      0098C0 AE 17 FF         [ 2] 4815 	cpw x,#0x8000
      0098C3 94 CC            [ 1] 4816 	jrmi 21$
      0098C5 89 80            [ 1] 4817 	ld a,#ERR_NO_FSPACE  
      0098C7 CC 08 7B         [ 2] 4818 	jp tb_error
      001AFE                       4819 21$: 
                                   4820 ; check for existing file of that name 
      0098C7 AE 00            [ 2] 4821 	ldw y,(NAMEPTR,sp)	
      0098C9 64 90 AE         [ 4] 4822 	call search_file 
      0098CC 03 E8            [ 1] 4823 	jrnc 3$ 
      0098CE 20 0D            [ 1] 4824 	ld a,#ERR_DUPLICATE 
      0098D0 CC 08 7B         [ 2] 4825 	jp tb_error 
      001B0A                       4826 3$:	; initialize farptr 
      0098D0 CD 90 94         [ 2] 4827 	ldw x,ffree 
      0098D3 A1 02 27         [ 1] 4828 	ld a,ffree+2 
      0098D6 03 CC 88         [ 2] 4829 	ldw farptr,x 
      0098D9 F9 00 18         [ 1] 4830 	ld farptr+2,a 
                                   4831 ;** write file name to row buffer **	
      0098DA 16 03            [ 2] 4832 	ldw y,(NAMEPTR,sp)  
      0098DA 85 90 85         [ 2] 4833 	ldw x,#pad 
      0098DD CD 03 B2         [ 4] 4834 	call strcpy
      0098DD 89 AE F4         [ 4] 4835 	call strlen 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098E0 24               [ 1] 4836 	clrw x 
      0098E1 65               [ 1] 4837 	ld xl,a 
      0098E2 90               [ 2] 4838 	incw  x
      0098E3 A3 7A 12         [ 2] 4839 	addw x,#pad 
                                   4840 ; ** write file size to row buffer 
      0098E6 2B 01            [ 2] 4841 	ldw y,(BSIZE,sp)
      0098E8 5C               [ 2] 4842 	ldw (x),y 
      0098E9 1C 00 02         [ 2] 4843 	addw x,#2 
                                   4844 ; ** write file data to row buffer 
      0098E9 9E C7 53 0D      [ 2] 4845 	ldw y,txtbgn 
      0098ED 9F C7            [ 1] 4846 6$:	ld a,(y)
      0098EF 53 0E            [ 2] 4847 	incw y
      0098F1 8C               [ 1] 4848 	ld (x),a 
      0098F2 56               [ 2] 4849 	incw x
      0098F3 9E C7 53 0F      [ 2] 4850 	cpw y,txtend 
      0098F7 9F C7            [ 1] 4851 	jreq 12$
      0098F9 53 10 72         [ 2] 4852 	cpw x,#stack_full 
      0098FC 10 53            [ 1] 4853 	jrmi 6$
      001B42                       4854 12$:
      0098FE 08 72            [ 2] 4855 	ldw (YSAVE,sp),y 
      001B44                       4856 14$: ; zero buffer end 
      009900 10 53 00         [ 2] 4857 	cpw x,#stack_full
      009903 72 10            [ 1] 4858 	jreq 16$
      009905 53               [ 1] 4859 	clr (x)
      009906 04               [ 2] 4860 	incw x 
      009907 85 CD            [ 2] 4861 	jra 14$
      001B4D                       4862 16$:
      009909 9E 86 72         [ 2] 4863 	ldw x,#pad 
      00990C 11 53 08         [ 4] 4864 	call write_row 
      00990F 72 11 53         [ 2] 4865 	ldw x,#BLOCK_SIZE 
      009912 00 81 EB         [ 4] 4866 	call incr_farptr
      009914 AE 16 E0         [ 2] 4867 	ldw x,#pad 
      009914 CD 90            [ 2] 4868 	ldw y,(YSAVE,sp)
      009916 94 A1 02 27      [ 2] 4869 	cpw y,txtend 
      00991A 0B A1            [ 1] 4870 	jrmi 6$
                                   4871 ; save farptr in ffree
      00991C 01 27 03         [ 2] 4872 	ldw x,farptr 
      00991F CC 88 F9         [ 1] 4873 	ld a,farptr+2 
      009922 AE 00 00         [ 2] 4874 	ldw ffree,x 
      009925 89 1E 03         [ 1] 4875 	ld ffree+2,a
                                   4876 ; print file size 	
      009928 5D 27            [ 2] 4877 	ldw x,(BSIZE,sp) 
      00992A 1A 1E 01         [ 4] 4878 	call print_int 
      001B75                       4879 	_drop VSIZE 
      00992D 9F A4            [ 2]    1     addw sp,#VSIZE 
      00992F 07               [ 4] 4880 	ret 
                                   4881 
                                   4882 ;----------------------
                                   4883 ; load file in RAM memory
                                   4884 ; input:
                                   4885 ;    farptr point at file size 
                                   4886 ; output:
                                   4887 ;   y point after BASIC program in RAM.
                                   4888 ;------------------------
      001B78                       4889 load_file:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009930 4E C7 54         [ 4] 4890 	call incr_farptr  
      009933 01 72 16         [ 4] 4891 	call clear_basic  
      009936 50               [ 1] 4892 	clrw x
      009937 CA 72 10 54      [ 5] 4893 	ldf a,([farptr],x)
      00993B 01 AE            [ 1] 4894 	ld yh,a 
      00993D 00               [ 2] 4895 	incw x  
      00993E 1B 5A 9D 26      [ 5] 4896 	ldf a,([farptr],x)
      009942 FA               [ 2] 4897 	incw x 
      009943 20 08            [ 1] 4898 	ld yl,a 
      009945 72 11 54 01      [ 2] 4899 	addw y,txtbgn
      009949 72 17 50 CA      [ 2] 4900 	ldw txtend,y
      00994D 5B 04 81 1C      [ 2] 4901 	ldw y,txtbgn
      009950                       4902 3$:	; load BASIC text 	
      009950 CD 90 8F A1      [ 5] 4903 	ldf a,([farptr],x)
      009954 01 27            [ 1] 4904 	ld (y),a 
      009956 03               [ 2] 4905 	incw x 
      009957 CC 88            [ 2] 4906 	incw y 
      009959 F9 85 A3 00      [ 2] 4907 	cpw y,txtend 
      00995D 05 23            [ 1] 4908 	jrmi 3$
      00995F 05               [ 4] 4909 	ret 
                                   4910 
                                   4911 ;------------------------
                                   4912 ; BASIC: LOAD "file" 
                                   4913 ; load file to RAM 
                                   4914 ; for execution 
                                   4915 ;------------------------
      001BA9                       4916 load:
      009960 A6 0A CC 88 FB   [ 2] 4917 	btjf flags,#FRUN,0$ 
      009965 9F C7            [ 1] 4918 	jreq 0$ 
      009967 00 0E            [ 1] 4919 	ld a,#ERR_CMD_ONLY 
      009969 A6 05 C0         [ 2] 4920 	jp tb_error 
      001BB5                       4921 0$:	
      00996C 00 0E C7         [ 4] 4922 	call next_token 
      00996F 54 00            [ 1] 4923 	cp a,#TK_QSTR
      009971 72 16            [ 1] 4924 	jreq 1$
      009973 54 02 72         [ 2] 4925 	jp syntax_error 
      009976 10 54            [ 1] 4926 1$:	ldw y,x 
      009978 01 72 0F         [ 4] 4927 	call search_file 
      00997B 54 00            [ 1] 4928 	jrc 2$ 
      00997D FB CE            [ 1] 4929 	ld a,#ERR_NOT_FILE
      00997F 54 04 A6         [ 2] 4930 	jp tb_error  
      001BCB                       4931 2$:
      009982 84 81 78         [ 4] 4932 	call load_file
                                   4933 ; print loaded size 	 
      009984 CE 00 1E         [ 2] 4934 	ldw x,txtend 
      009984 52 01 CD 90      [ 2] 4935 	subw x,txtbgn
      009988 8F A1 01         [ 4] 4936 	call print_int 
      00998B 27               [ 4] 4937 	ret 
                                   4938 
                                   4939 ;-----------------------------------
                                   4940 ; BASIC: FORGET ["file_name"] 
                                   4941 ; erase file_name and all others 
                                   4942 ; after it. 
                                   4943 ; without argument erase all files 
                                   4944 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                           000001  4945 	NEW_FREE=1 
                           000003  4946 	VSIZE=3 
      001BD9                       4947 forget:
      001BD9                       4948 	_vars VSIZE 
      00998C 03 CC            [ 2]    1     sub sp,#VSIZE 
      00998E 88 F9 85         [ 4] 4949 	call next_token 
      009991 A3 00            [ 1] 4950 	cp a,#TK_NONE 
      009993 0F 23            [ 1] 4951 	jreq 3$ 
      009995 05 A6            [ 1] 4952 	cp a,#TK_QSTR
      009997 0A CC            [ 1] 4953 	jreq 1$
      009999 88 FB CD         [ 2] 4954 	jp syntax_error
      00999C 9F B9            [ 1] 4955 1$: ldw y,x 
      00999E 6B 01 E6 01 0D   [ 1] 4956 	mov in,count 
      0099A3 01 27 05         [ 4] 4957 	call search_file
      0099A6 44 0A            [ 1] 4958 	jrc 2$
      0099A8 01 26            [ 1] 4959 	ld a,#ERR_NOT_FILE 
      0099AA FB A4 01         [ 2] 4960 	jp tb_error 
      001BFA                       4961 2$: 
      0099AD 5F 97 A6         [ 2] 4962 	ldw x,farptr
      0099B0 84 5B 01         [ 1] 4963 	ld a,farptr+2
      0099B3 81 0A            [ 2] 4964 	jra 4$ 
      0099B4                       4965 3$: ; forget all files 
      0099B4 52 02 CD         [ 2] 4966 	ldw x,#0x100
      0099B7 90               [ 1] 4967 	clr a 
      0099B8 94 A1 02         [ 2] 4968 	ldw farptr,x 
      0099BB 27 03 CC         [ 1] 4969 	ld farptr+2,a 
      001C0C                       4970 4$:	; save new free address 
      0099BE 88 F9            [ 2] 4971 	ldw (NEW_FREE,sp),x
      0099C0 85 9F            [ 1] 4972 	ld (NEW_FREE+2,sp),a 
      0099C2 6B 02 85         [ 4] 4973 	call move_erase_to_ram
      0099C5 A3 00 0F         [ 4] 4974 5$: call block_erase 
      0099C8 23 05 A6         [ 2] 4975 	ldw x,#BLOCK_SIZE 
      0099CB 0A CC 88         [ 4] 4976 	call incr_farptr 
      0099CE FB CD 9F         [ 4] 4977 	call row_align 
                                   4978 ; check if all blocks erased
      0099D1 B9 6B 01         [ 1] 4979 	ld a,farptr+2  
      0099D4 A6 01 0D         [ 1] 4980 	sub a,ffree+2
      0099D7 01 27 05         [ 1] 4981 	ld a,farptr+1 
      0099DA 48 0A 01         [ 1] 4982 	sbc a,ffree+1 
      0099DD 26 FB 0D         [ 1] 4983 	ld a,farptr 
      0099E0 02 26 05         [ 1] 4984 	sbc a,ffree 
      0099E3 43 E4            [ 1] 4985 	jrmi 5$ 
      0099E5 00 20            [ 1] 4986 	ld a,(NEW_FREE+2,sp)
      0099E7 02 EA            [ 2] 4987 	ldw x,(NEW_FREE,sp)
      0099E9 00 E7 00         [ 1] 4988 	ld ffree+2,a 
      0099EC 5B 02 81         [ 2] 4989 	ldw ffree,x 
      0099EF                       4990 	_drop VSIZE 
      0099EF 72 00            [ 2]    1     addw sp,#VSIZE 
      0099F1 00               [ 4] 4991 	ret 
                                   4992 
                                   4993 ;----------------------
                                   4994 ; BASIC: DIR 
                                   4995 ; list saved files 
                                   4996 ;----------------------
                           000001  4997 	COUNT=1 ; files counter 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           000002  4998 	VSIZE=2 
      001C40                       4999 directory:
      001C40                       5000 	_vars VSIZE 
      0099F2 24 02            [ 2]    1     sub sp,#VSIZE 
      0099F4 4F               [ 1] 5001 	clrw x 
      0099F5 81 01            [ 2] 5002 	ldw (COUNT,sp),x 
      0099F6 CF 00 17         [ 2] 5003 	ldw farptr+1,x 
      0099F6 AE 9A 1D CD      [ 1] 5004 	mov farptr,#1 
      001C4C                       5005 dir_loop:
      0099FA A8               [ 1] 5006 	clrw x 
      0099FB C0 5B 02 52      [ 5] 5007 	ldf a,([farptr],x)
      0099FF 04 CD            [ 1] 5008 	jreq 8$ 
      001C53                       5009 1$: ;name loop 	
      009A01 95 EB AE 16      [ 5] 5010 	ldf a,([farptr],x)
      009A05 90 CF            [ 1] 5011 	jreq 2$ 
      009A07 00 05 7F         [ 4] 5012 	call putc 
      009A0A 72               [ 2] 5013 	incw x 
      009A0B 5F 00            [ 2] 5014 	jra 1$
      009A0D 04               [ 2] 5015 2$: incw x ; skip ending 0. 
      009A0E 5F CF            [ 1] 5016 	ld a,#SPACE 
      009A10 00 01 72         [ 4] 5017 	call putc 
                                   5018 ; get file size 	
      009A13 11 00 24 72      [ 5] 5019 	ldf a,([farptr],x)
      009A17 18 00            [ 1] 5020 	ld yh,a 
      009A19 24               [ 2] 5021 	incw x 
      009A1A CC 89 9F 0A      [ 5] 5022 	ldf a,([farptr],x)
      009A1E 62               [ 2] 5023 	incw x 
      009A1F 72 65            [ 1] 5024 	ld yl,a 
      009A21 61 6B            [ 2] 5025 	pushw y 
      009A23 20 70 6F         [ 2] 5026 	addw x,(1,sp)
                                   5027 ; skip to next file 
      009A26 69 6E 74         [ 4] 5028 	call incr_farptr
      009A29 2C 20 52         [ 4] 5029 	call row_align
                                   5030 ; print file size 
      009A2C 55               [ 2] 5031 	popw x ; file size 
      009A2D 4E 20 74         [ 4] 5032 	call print_int 
      009A30 6F 20            [ 1] 5033 	ld a,#CR 
      009A32 72 65 73         [ 4] 5034 	call putc
      009A35 75 6D            [ 2] 5035 	ldw x,(COUNT,sp)
      009A37 65               [ 2] 5036 	incw x
      009A38 2E 0A            [ 2] 5037 	ldw (COUNT,sp),x  
      009A3A 00 BE            [ 2] 5038 	jra dir_loop
      009A3B                       5039 8$: ; print number of files 
      009A3B 72 01            [ 2] 5040 	ldw x,(COUNT,sp)
      009A3D 00 24 01         [ 4] 5041 	call print_int 
      009A40 81 1C AD         [ 2] 5042 	ldw x,#file_count 
      009A41 CD 00 00         [ 4] 5043 	call puts  
                                   5044 ; print drive free space 	
      009A41 CD 87 65         [ 4] 5045 	call disk_free
      009A44 81               [ 1] 5046 	clrw x  
      009A45 35 0A 00 0A      [ 1] 5047 	mov base,#10 
      009A45 AE 16 E0         [ 4] 5048 	call prti24 
      009A48 A6 80 7F         [ 2] 5049 	ldw x,#drive_free
      009A4B 5C 4A 26         [ 4] 5050 	call puts 
      001CAA                       5051 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A4E FB 81            [ 2]    1     addw sp,#VSIZE 
      009A50 81               [ 4] 5052 	ret
      009A50 A6 7F C4 00 19 27 13  5053 file_count: .asciz " files\n"
             CE
      009A58 00 18 1C 00 80 24 04  5054 drive_free: .asciz " bytes free\n" 
             72 5C 00 17 9F A4
                                   5055 
                                   5056 ;---------------------
                                   5057 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5058 ; write 1 or more byte to FLASH or EEPROM
                                   5059 ; starting at address  
                                   5060 ; input:
                                   5061 ;   expr1  	is address 
                                   5062 ;   expr2,...,exprn   are bytes to write
                                   5063 ; output:
                                   5064 ;   none 
                                   5065 ;---------------------
                           000001  5066 	ADDR=1
                           000002  5067 	VSIZ=2 
      001CC2                       5068 write:
      001CC2                       5069 	_vars VSIZE 
      009A65 80 97            [ 2]    1     sub sp,#VSIZE 
      009A67 CF 00 18 81      [ 1] 5070 	clr farptr ; expect 16 bits address 
      009A6B CD 11 0D         [ 4] 5071 	call expression
      009A6B 72 BB            [ 1] 5072 	cp a,#TK_INTGR 
      009A6D 00 18            [ 1] 5073 	jreq 0$
      009A6F 24 04 72         [ 2] 5074 	jp syntax_error
      009A72 5C 00            [ 2] 5075 0$: ldw (ADDR,sp),x 
      009A74 17 CF 00         [ 4] 5076 	call next_token 
      009A77 18 81            [ 1] 5077 	cp a,#TK_COMMA 
      009A79 27 02            [ 1] 5078 	jreq 1$ 
      009A79 A6 01            [ 2] 5079 	jra 9$ 
      009A7B C7 00 17         [ 4] 5080 1$:	call expression
      009A7E 5F CF            [ 1] 5081 	cp a,#TK_INTGR
      009A80 00 18            [ 1] 5082 	jreq 2$
      009A82 CC 08 79         [ 2] 5083 	jp syntax_error
      009A82 AE               [ 1] 5084 2$:	ld a,xl 
      009A83 00 03            [ 2] 5085 	ldw x,(ADDR,sp) 
      009A85 92 AF 00         [ 2] 5086 	ldw farptr+1,x 
      009A88 17               [ 1] 5087 	clrw x 
      009A89 26 05 5A         [ 4] 5088 	call write_byte
      009A8C 2A F7            [ 2] 5089 	ldw x,(ADDR,sp)
      009A8E 20               [ 2] 5090 	incw x 
      009A8F 0E AE            [ 2] 5091 	jra 0$ 
      001CF6                       5092 9$:
      001CF6                       5093 	_drop VSIZE
      009A91 00 80            [ 2]    1     addw sp,#VSIZE 
      009A93 CD               [ 4] 5094 	ret 
                                   5095 
                                   5096 
                                   5097 ;---------------------
                                   5098 ;BASIC: CHAR(expr)
                                   5099 ; évaluate expression 
                                   5100 ; and take the 7 least 
                                   5101 ; bits as ASCII character
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5102 ;---------------------
      001CF9                       5103 char:
      009A94 9A 6B AE         [ 4] 5104 	call func_args 
      009A97 02 80            [ 1] 5105 	cp a,#1
      009A99 C3 00            [ 1] 5106 	jreq 1$
      009A9B 17 2B E4         [ 2] 5107 	jp syntax_error
      009A9E 85               [ 2] 5108 1$:	popw x 
      009A9E CE               [ 1] 5109 	ld a,xl 
      009A9F 00 17            [ 1] 5110 	and a,#0x7f 
      009AA1 C6               [ 1] 5111 	ld xl,a
      009AA2 00 19            [ 1] 5112 	ld a,#TK_CHAR
      009AA4 CF               [ 4] 5113 	ret
                                   5114 
                                   5115 ;---------------------
                                   5116 ; BASIC: ASC(string|char)
                                   5117 ; extract first character 
                                   5118 ; of string argument 
                                   5119 ; return it as TK_INTGR 
                                   5120 ;---------------------
      001D0B                       5121 ascii:
      009AA5 00 1A            [ 1] 5122 	ld a,#TK_LPAREN
      009AA7 C7 00 1C         [ 4] 5123 	call expect 
      009AAA 81 09 6B         [ 4] 5124 	call next_token 
      009AAB A1 02            [ 1] 5125 	cp a,#TK_QSTR 
      009AAB AE 80            [ 1] 5126 	jreq 1$
      009AAD 00 72            [ 1] 5127 	cp a,#TK_CHAR 
      009AAF B0 00            [ 1] 5128 	jreq 2$ 
      009AB1 1B A6 02         [ 2] 5129 	jp syntax_error
      001D1E                       5130 1$: 
      009AB4 C2               [ 1] 5131 	ld a,(x) 
      009AB5 00               [ 1] 5132 	clrw x
      009AB6 1A               [ 1] 5133 	ld xl,a 
      001D21                       5134 2$: 
      009AB7 C7               [ 2] 5135 	pushw x 
      009AB8 00 0C            [ 1] 5136 	ld a,#TK_RPAREN 
      009ABA CF 00 0D         [ 4] 5137 	call expect
      009ABD 81               [ 2] 5138 	popw x 
      009ABE A6 84            [ 1] 5139 	ld a,#TK_INTGR 
      009ABE 5F               [ 4] 5140 	ret 
                                   5141 
                                   5142 ;---------------------
                                   5143 ;BASIC: KEY
                                   5144 ; wait for a character 
                                   5145 ; received from STDIN 
                                   5146 ; input:
                                   5147 ;	none 
                                   5148 ; output:
                                   5149 ;	X 		ASCII character 
                                   5150 ;---------------------
      001D2B                       5151 key:
      009ABF 92 AF 00         [ 4] 5152 	call getc 
      009AC2 17               [ 1] 5153 	clrw x 
      009AC3 90               [ 1] 5154 	ld xl,a 
      009AC4 F1 26            [ 1] 5155 	ld a,#TK_INTGR
      009AC6 08               [ 4] 5156 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5157 
                                   5158 ;----------------------
                                   5159 ; BASIC: QKEY
                                   5160 ; Return true if there 
                                   5161 ; is a character in 
                                   5162 ; waiting in STDIN 
                                   5163 ; input:
                                   5164 ;  none 
                                   5165 ; output:
                                   5166 ;   X 		0|-1 
                                   5167 ;-----------------------
      001D33                       5168 qkey:: 
      009AC7 4D               [ 1] 5169 	clrw x 
      009AC8 27 12 5C         [ 1] 5170 	ld a,rx_head
      009ACB 90 5C 20         [ 1] 5171 	cp a,rx_tail 
      009ACE F0 01            [ 1] 5172 	jreq 9$ 
      009ACF 53               [ 2] 5173 	cplw x 
      009ACF 4D 27            [ 1] 5174 9$: ld a,#TK_INTGR
      009AD1 07               [ 4] 5175 	ret 
                                   5176 
                                   5177 ;---------------------
                                   5178 ; BASIC: GPIO(expr,reg)
                                   5179 ; return gpio address 
                                   5180 ; expr {0..8}
                                   5181 ; input:
                                   5182 ;   none 
                                   5183 ; output:
                                   5184 ;   X 		gpio register address
                                   5185 ;----------------------------
                           000003  5186 	PORT=3
                           000001  5187 	REG=1 
                           000004  5188 	VSIZE=4 
      001D40                       5189 gpio:
      009AD2 5C 92 AF         [ 4] 5190 	call func_args 
      009AD5 00 17            [ 1] 5191 	cp a,#2
      009AD7 20 F6            [ 1] 5192 	jreq 1$
      009AD9 5C 98 81         [ 2] 5193 	jp syntax_error  
      009ADC                       5194 1$:	
      009ADC 5C 99            [ 2] 5195 	ldw x,(PORT,sp)
      009ADE 81 17            [ 1] 5196 	jrmi bad_port
      009ADF A3 00 09         [ 2] 5197 	cpw x,#9
      009ADF 52 04            [ 1] 5198 	jrpl bad_port
      009AE1 17 03            [ 1] 5199 	ld a,#5
      009AE3 5F               [ 4] 5200 	mul x,a
      009AE4 CF 00 18         [ 2] 5201 	addw x,#GPIO_BASE 
      009AE7 35 01            [ 2] 5202 	ldw (PORT,sp),x  
      009AE9 00 17            [ 2] 5203 	ldw x,(REG,sp) 
      009AEB 72 FB 03         [ 2] 5204 	addw x,(PORT,sp)
      009AEB 92 BC            [ 1] 5205 	ld a,#TK_INTGR
      001D62                       5206 	_drop VSIZE 
      009AED 00 17            [ 2]    1     addw sp,#VSIZE 
      009AEF 27               [ 4] 5207 	ret
      001D65                       5208 bad_port:
      009AF0 27 5F            [ 1] 5209 	ld a,#ERR_BAD_VALUE
      009AF2 16 03 CD         [ 2] 5210 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5211 
                                   5212 
                                   5213 ;-------------------------
                                   5214 ; BASIC: UFLASH 
                                   5215 ; return user flash address
                                   5216 ; input:
                                   5217 ;  none 
                                   5218 ; output:
                                   5219 ;	A		TK_INTGR
                                   5220 ;   X 		user address 
                                   5221 ;---------------------------
      001D6A                       5222 uflash:
      009AF5 9A BE 25         [ 2] 5223 	ldw x,#user_space 
      009AF8 2F 92            [ 1] 5224 	ld a,#TK_INTGR 
      009AFA AF               [ 4] 5225 	ret 
                                   5226 
                                   5227 
                                   5228 ;---------------------
                                   5229 ; BASIC: USR(addr[,arg])
                                   5230 ; execute a function written 
                                   5231 ; in binary code.
                                   5232 ; binary fonction should 
                                   5233 ; return token attribute in A 
                                   5234 ; and value in X. 
                                   5235 ; input:
                                   5236 ;   addr	routine address 
                                   5237 ;   arg 	is an optional argument 
                                   5238 ; output:
                                   5239 ;   A 		token attribute 
                                   5240 ;   X       returned value 
                                   5241 ;---------------------
      001D70                       5242 usr:
      009AFB 00 17            [ 2] 5243 	pushw y 	
      009AFD 6B 01 5C         [ 4] 5244 	call func_args 
      009B00 92 AF            [ 1] 5245 	cp a,#1 
      009B02 00 17            [ 1] 5246 	jreq 2$
      009B04 6B 02            [ 1] 5247 	cp a,#2
      009B06 5C 72            [ 1] 5248 	jreq 2$  
      009B08 FB 01 CD         [ 2] 5249 	jp syntax_error 
      009B0B 9A 6B            [ 2] 5250 2$: popw y  ; arg|addr 
      009B0D CD 9A            [ 1] 5251 	cp a,#1
      009B0F 50 AE            [ 1] 5252 	jreq 3$
      009B11 02               [ 2] 5253 	popw x ; addr
      009B12 80               [ 1] 5254 	exgw x,y 
      009B13 C3 00            [ 4] 5255 3$: call (y)
      009B15 17 2A            [ 2] 5256 	popw y 
      009B17 D3               [ 4] 5257 	ret 
                                   5258 
                                   5259 ;------------------------------
                                   5260 ; BASIC: BYE 
                                   5261 ; halt mcu in its lowest power mode 
                                   5262 ; wait for reset or external interrupt
                                   5263 ; do a cold start on wakeup.
                                   5264 ;------------------------------
      009B18                       5265 bye:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B18 72 5F 00 17 72   [ 2] 5266 	btjf UART1_SR,#UART_SR_TC,.
      009B1D 5F               [10] 5267 	halt
      009B1E 00 18 72         [ 2] 5268 	jp cold_start  
                                   5269 
                                   5270 ;----------------------------------
                                   5271 ; BASIC: AUTORUN ["file_name"] 
                                   5272 ; record in eeprom at adrress AUTORUN_NAME
                                   5273 ; the name of file to load and execute
                                   5274 ; at startup. 
                                   5275 ; empty string delete autorun name 
                                   5276 ; no argument display autorun name  
                                   5277 ; input:
                                   5278 ;   file_name   file to execute 
                                   5279 ; output:
                                   5280 ;   none
                                   5281 ;-----------------------------------
      001D96                       5282 autorun: 
      009B21 5F 00 19 5B 04   [ 2] 5283 	btjf flags,#FRUN,0$ 
      009B26 98 81            [ 1] 5284 	jreq 0$ 
      009B28 A6 07            [ 1] 5285 	ld a,#ERR_CMD_ONLY 
      009B28 5B 04 99         [ 2] 5286 	jp tb_error 
      001DA2                       5287 0$:	
      009B2B 81 09 6B         [ 4] 5288 	call next_token
      009B2C 4D               [ 1] 5289 	tnz a 
      009B2C 72 01            [ 1] 5290 	jrne 1$
      009B2E 00 24 05         [ 2] 5291 	ldw x,#AUTORUN_NAME
      009B31 A6 07 CC         [ 4] 5292 	call puts 
      009B34 88               [ 1] 5293 	clr a 
      009B35 FB               [ 4] 5294 	ret 
      009B36                       5295 1$:
      009B36 CE 00            [ 1] 5296 	cp a,#TK_QSTR
      009B38 1F 72            [ 1] 5297 	jreq 2$
      009B3A B0 00 1D         [ 2] 5298 	jp syntax_error 
      001DB7                       5299 2$:	
      009B3D 26               [ 1] 5300 	tnz (x) 
      009B3E 0C AE            [ 1] 5301 	jrne 3$
                                   5302 ; empty string, delete autorun 	
      009B40 88 94 CD         [ 4] 5303 	call cancel_autorun
      009B43 A8 C0 55 00 04   [ 1] 5304 	mov in,count 
      009B48 00               [ 4] 5305 	ret 
      009B49 02               [ 2] 5306 3$:	pushw x 
      009B4A 81 93            [ 1] 5307 	ldw y,x  
      009B4B CD 1A 5F         [ 4] 5308 	call search_file 
      009B4B 52 08            [ 1] 5309 	jrc 4$ 
      009B4D 1F 01            [ 1] 5310 	ld a,#ERR_NOT_FILE
      009B4F CD 89 EB         [ 2] 5311 	jp tb_error  
      001DD0                       5312 4$: 
      009B52 A1 02 27 03 CC   [ 1] 5313 	mov in,count 
      009B57 88 F9 00 16      [ 1] 5314 	clr farptr 
      009B59 AE 40 00         [ 2] 5315 	ldw x,#AUTORUN_NAME
      009B59 1F 03 CD         [ 2] 5316 	ldw farptr+1,x 
      009B5C 81 F4            [ 2] 5317 	ldw x,(1,sp)  
      009B5E CD 84 16         [ 4] 5318 	call strlen  ; return length in A 
      009B61 AB               [ 1] 5319 	clrw x 
      009B62 03               [ 1] 5320 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B63 5F               [ 2] 5321 	incw x 
      009B64 97 72            [ 2] 5322 	popw y 
      009B66 FB               [ 2] 5323 	pushw x 
      009B67 01               [ 1] 5324 	clrw x 
      009B68 4F 72 BB         [ 4] 5325 	call write_block 
      001DEE                       5326 	_drop 2 
      009B6B 00 1B            [ 2]    1     addw sp,#2 
      009B6D C9               [ 4] 5327 	ret 
                                   5328 
                                   5329 ;----------------------------------
                                   5330 ; BASIC: SLEEP 
                                   5331 ; halt mcu until reset or external
                                   5332 ; interrupt.
                                   5333 ; Resume progam after SLEEP command
                                   5334 ;----------------------------------
      001DF1                       5335 sleep:
      009B6E 00 1A A1 02 2B   [ 2] 5336 	btjf UART1_SR,#UART_SR_TC,.
      009B73 0A A3 80 00      [ 1] 5337 	bset flags,#FSLEEP
      009B77 2B               [10] 5338 	halt 
      009B78 05               [ 4] 5339 	ret 
                                   5340 
                                   5341 ;-------------------------------
                                   5342 ; BASIC: PAUSE expr 
                                   5343 ; suspend execution for n msec.
                                   5344 ; input:
                                   5345 ;	none
                                   5346 ; output:
                                   5347 ;	none 
                                   5348 ;------------------------------
      001DFC                       5349 pause:
      009B79 A6 0E CC         [ 4] 5350 	call expression
      009B7C 88 FB            [ 1] 5351 	cp a,#TK_INTGR
      009B7E 27 03            [ 1] 5352 	jreq pause02 
      009B7E 16 03 CD         [ 2] 5353 	jp syntax_error
      001E06                       5354 pause02: 
      009B81 9A               [ 2] 5355 1$: tnzw x 
      009B82 DF 24            [ 1] 5356 	jreq 2$
      009B84 05               [10] 5357 	wfi 
      009B85 A6               [ 2] 5358 	decw x 
      009B86 08 CC            [ 1] 5359 	jrne 1$
      009B88 88               [ 1] 5360 2$:	clr a 
      009B89 FB               [ 4] 5361 	ret 
                                   5362 
                                   5363 ;------------------------------
                                   5364 ; BASIC: AWU expr
                                   5365 ; halt mcu for 'expr' milliseconds
                                   5366 ; use Auto wakeup peripheral
                                   5367 ; all oscillators stopped except LSI
                                   5368 ; range: 1ms - 511ms
                                   5369 ; input:
                                   5370 ;  none
                                   5371 ; output:
                                   5372 ;  none:
                                   5373 ;------------------------------
      009B8A                       5374 awu:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B8A CE 00 1A         [ 4] 5375   call expression
      009B8D C6 00            [ 1] 5376   cp a,#TK_INTGR
      009B8F 1C CF            [ 1] 5377   jreq awu02
      009B91 00 17 C7         [ 2] 5378   jp syntax_error
      001E19                       5379 awu02:
      009B94 00 19 16         [ 2] 5380   cpw x,#5120
      009B97 03 AE            [ 1] 5381   jrmi 1$ 
      009B99 16 E0 CD 84      [ 1] 5382   mov AWU_TBR,#15 
      009B9D 32 CD            [ 1] 5383   ld a,#30
      009B9F 84               [ 2] 5384   div x,a
      009BA0 16 5F            [ 1] 5385   ld a,#16
      009BA2 97               [ 2] 5386   div x,a 
      009BA3 5C 1C            [ 2] 5387   jra 4$
      001E2A                       5388 1$: 
      009BA5 16 E0 16         [ 2] 5389   cpw x,#2048
      009BA8 01 FF            [ 1] 5390   jrmi 2$ 
      009BAA 1C 00 02 90      [ 1] 5391   mov AWU_TBR,#14
      009BAE CE 00            [ 1] 5392   ld a,#80
      009BB0 1D               [ 2] 5393   div x,a 
      009BB1 90 F6            [ 2] 5394   jra 4$   
      001E38                       5395 2$:
      009BB3 90 5C F7 5C      [ 1] 5396   mov AWU_TBR,#7
      001E3C                       5397 3$:  
                                   5398 ; while X > 64  divide by 2 and increment AWU_TBR 
      009BB7 90 C3 00         [ 2] 5399   cpw x,#64 
      009BBA 1F 27            [ 2] 5400   jrule 4$ 
      009BBC 05 A3 17 60      [ 1] 5401   inc AWU_TBR 
      009BC0 2B               [ 2] 5402   srlw x 
      009BC1 EF F4            [ 2] 5403   jra 3$ 
      009BC2                       5404 4$:
      009BC2 17               [ 1] 5405   ld a, xl
      009BC3 07               [ 1] 5406   dec a 
      009BC4 27 01            [ 1] 5407   jreq 5$
      009BC4 A3               [ 1] 5408   dec a 	
      001E4D                       5409 5$: 
      009BC5 17 60            [ 1] 5410   and a,#0x3e 
      009BC7 27 04 7F         [ 1] 5411   ld AWU_APR,a 
      009BCA 5C 20 F7 F0      [ 1] 5412   bset AWU_CSR,#AWU_CSR_AWUEN
      009BCD 8E               [10] 5413   halt 
                                   5414 
      009BCD AE               [ 4] 5415   ret 
                                   5416 
                                   5417 ;------------------------------
                                   5418 ; BASIC: TICKS
                                   5419 ; return msec ticks counter value 
                                   5420 ; input:
                                   5421 ; 	none 
                                   5422 ; output:
                                   5423 ;	X 		TK_INTGR
                                   5424 ;-------------------------------
      001E58                       5425 get_ticks:
      009BCE 16 E0 CD         [ 2] 5426 	ldw x,ticks 
      009BD1 82 08            [ 1] 5427 	ld a,#TK_INTGR
      009BD3 AE               [ 4] 5428 	ret 
                                   5429 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5430 
                                   5431 
                                   5432 ;------------------------------
                                   5433 ; BASIC: ABS(expr)
                                   5434 ; return absolute value of expr.
                                   5435 ; input:
                                   5436 ;   none
                                   5437 ; output:
                                   5438 ;   X     	positive integer
                                   5439 ;-------------------------------
      001E5E                       5440 abs:
      009BD4 00 80 CD         [ 4] 5441 	call func_args 
      009BD7 9A 6B            [ 1] 5442 	cp a,#1 
      009BD9 AE 16            [ 1] 5443 	jreq 0$ 
      009BDB E0 16 07         [ 2] 5444 	jp syntax_error
      001E68                       5445 0$:  
      009BDE 90               [ 2] 5446     popw x   
      009BDF C3               [ 1] 5447 	ld a,xh 
      009BE0 00 1F            [ 1] 5448 	bcp a,#0x80 
      009BE2 2B CD            [ 1] 5449 	jreq 2$ 
      009BE4 CE               [ 2] 5450 	negw x 
      009BE5 00 17            [ 1] 5451 2$: ld a,#TK_INTGR 
      009BE7 C6               [ 4] 5452 	ret 
                                   5453 
                                   5454 ;------------------------------
                                   5455 ; BASIC: AND(expr1,expr2)
                                   5456 ; Apply bit AND relation between
                                   5457 ; the 2 arguments, i.e expr1 & expr2 
                                   5458 ; output:
                                   5459 ; 	A 		TK_INTGR
                                   5460 ;   X 		result 
                                   5461 ;------------------------------
      001E72                       5462 bit_and:
      009BE8 00 19 CF         [ 4] 5463 	call func_args 
      009BEB 00 1A            [ 1] 5464 	cp a,#2
      009BED C7 00            [ 1] 5465 	jreq 1$
      009BEF 1C 1E 01         [ 2] 5466 	jp syntax_error 
      009BF2 CD               [ 2] 5467 1$:	popw x 
      009BF3 8A               [ 1] 5468 	ld a,xh 
      009BF4 48 5B            [ 1] 5469 	and a,(1,sp)
      009BF6 08               [ 1] 5470 	ld xh,a 
      009BF7 81               [ 1] 5471 	ld a,xl
      009BF8 14 02            [ 1] 5472 	and a,(2,sp)
      009BF8 CD               [ 1] 5473 	ld xl,a 
      001E85                       5474 	_drop 2 
      009BF9 9A 6B            [ 2]    1     addw sp,#2 
      009BFB CD 87            [ 1] 5475 	ld a,#TK_INTGR
      009BFD 65               [ 4] 5476 	ret
                                   5477 
                                   5478 ;------------------------------
                                   5479 ; BASIC: OR(expr1,expr2)
                                   5480 ; Apply bit OR relation between
                                   5481 ; the 2 arguments, i.e expr1 | expr2 
                                   5482 ; output:
                                   5483 ; 	A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5484 ;   X 		result 
                                   5485 ;------------------------------
      001E8A                       5486 bit_or:
      009BFE 5F 92 AF         [ 4] 5487 	call func_args 
      009C01 00 17            [ 1] 5488 	cp a,#2
      009C03 90 95            [ 1] 5489 	jreq 1$
      009C05 5C 92 AF         [ 2] 5490 	jp syntax_error 
      001E94                       5491 1$: 
      009C08 00               [ 2] 5492 	popw x 
      009C09 17               [ 1] 5493 	ld a,xh 
      009C0A 5C 90            [ 1] 5494 	or a,(1,sp)
      009C0C 97               [ 1] 5495 	ld xh,a 
      009C0D 72               [ 1] 5496 	ld a,xl 
      009C0E B9 00            [ 1] 5497 	or a,(2,sp)
      009C10 1D               [ 1] 5498 	ld xl,a 
      001E9D                       5499 	_drop 2 
      009C11 90 CF            [ 2]    1     addw sp,#2 
      009C13 00 1F            [ 1] 5500 	ld a,#TK_INTGR 
      009C15 90               [ 4] 5501 	ret
                                   5502 
                                   5503 ;------------------------------
                                   5504 ; BASIC: XOR(expr1,expr2)
                                   5505 ; Apply bit XOR relation between
                                   5506 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5507 ; output:
                                   5508 ; 	A 		TK_INTGR
                                   5509 ;   X 		result 
                                   5510 ;------------------------------
      001EA2                       5511 bit_xor:
      009C16 CE 00 1D         [ 4] 5512 	call func_args 
      009C19 A1 02            [ 1] 5513 	cp a,#2
      009C19 92 AF            [ 1] 5514 	jreq 1$
      009C1B 00 17 90         [ 2] 5515 	jp syntax_error 
      001EAC                       5516 1$: 
      009C1E F7               [ 2] 5517 	popw x 
      009C1F 5C               [ 1] 5518 	ld a,xh 
      009C20 90 5C            [ 1] 5519 	xor a,(1,sp)
      009C22 90               [ 1] 5520 	ld xh,a 
      009C23 C3               [ 1] 5521 	ld a,xl 
      009C24 00 1F            [ 1] 5522 	xor a,(2,sp)
      009C26 2B               [ 1] 5523 	ld xl,a 
      001EB5                       5524 	_drop 2 
      009C27 F1 81            [ 2]    1     addw sp,#2 
      009C29 A6 84            [ 1] 5525 	ld a,#TK_INTGR 
      009C29 72               [ 4] 5526 	ret 
                                   5527 
                                   5528 ;------------------------------
                                   5529 ; BASIC: LSHIFT(expr1,expr2)
                                   5530 ; logical shift left expr1 by 
                                   5531 ; expr2 bits 
                                   5532 ; output:
                                   5533 ; 	A 		TK_INTGR
                                   5534 ;   X 		result 
                                   5535 ;------------------------------
      001EBA                       5536 lshift:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C2A 01 00 24         [ 4] 5537 	call func_args
      009C2D 07 27            [ 1] 5538 	cp a,#2 
      009C2F 05 A6            [ 1] 5539 	jreq 1$
      009C31 07 CC 88         [ 2] 5540 	jp syntax_error
      009C34 FB 85            [ 2] 5541 1$: popw y   
      009C35 85               [ 2] 5542 	popw x 
      009C35 CD 89            [ 2] 5543 	tnzw y 
      009C37 EB A1            [ 1] 5544 	jreq 4$
      009C39 02               [ 2] 5545 2$:	sllw x 
      009C3A 27 03            [ 2] 5546 	decw y 
      009C3C CC 88            [ 1] 5547 	jrne 2$
      001ED0                       5548 4$:  
      009C3E F9 90            [ 1] 5549 	ld a,#TK_INTGR
      009C40 93               [ 4] 5550 	ret
                                   5551 
                                   5552 ;------------------------------
                                   5553 ; BASIC: RSHIFT(expr1,expr2)
                                   5554 ; logical shift right expr1 by 
                                   5555 ; expr2 bits.
                                   5556 ; output:
                                   5557 ; 	A 		TK_INTGR
                                   5558 ;   X 		result 
                                   5559 ;------------------------------
      001ED3                       5560 rshift:
      009C41 CD 9A DF         [ 4] 5561 	call func_args
      009C44 25 05            [ 1] 5562 	cp a,#2 
      009C46 A6 09            [ 1] 5563 	jreq 1$
      009C48 CC 88 FB         [ 2] 5564 	jp syntax_error
      009C4B 90 85            [ 2] 5565 1$: popw y  
      009C4B CD               [ 2] 5566 	popw x
      009C4C 9B F8            [ 2] 5567 	tnzw y 
      009C4E CE 00            [ 1] 5568 	jreq 4$
      009C50 1F               [ 2] 5569 2$:	srlw x 
      009C51 72 B0            [ 2] 5570 	decw y 
      009C53 00 1D            [ 1] 5571 	jrne 2$
      001EE9                       5572 4$:  
      009C55 CD 8A            [ 1] 5573 	ld a,#TK_INTGR
      009C57 48               [ 4] 5574 	ret
                                   5575 
                                   5576 ;--------------------------
                                   5577 ; BASIC: FCPU integer
                                   5578 ; set CPU frequency 
                                   5579 ;-------------------------- 
                                   5580 
      001EEC                       5581 fcpu:
      009C58 81 84            [ 1] 5582 	ld a,#TK_INTGR
      009C59 CD 10 02         [ 4] 5583 	call expect 
      009C59 52               [ 1] 5584 	ld a,xl 
      009C5A 03 CD            [ 1] 5585 	and a,#7 
      009C5C 89 EB A1         [ 1] 5586 	ld CLK_CKDIVR,a 
      009C5F 00               [ 4] 5587 	ret 
                                   5588 
                                   5589 ;------------------------------
                                   5590 ; BASIC: PMODE pin#, mode 
                                   5591 ; Arduino pin. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5592 ; define pin as input or output
                                   5593 ; pin#: {0..15}
                                   5594 ; mode: INPUT|OUTPUT  
                                   5595 ;------------------------------
                           000001  5596 	PINNO=1
                           000001  5597 	VSIZE=1
      001EF8                       5598 pin_mode:
      001EF8                       5599 	_vars VSIZE 
      009C60 27 20            [ 2]    1     sub sp,#VSIZE 
      009C62 A1 02 27         [ 4] 5600 	call arg_list 
      009C65 03 CC            [ 1] 5601 	cp a,#2 
      009C67 88 F9            [ 1] 5602 	jreq 1$
      009C69 90 93 55         [ 2] 5603 	jp syntax_error 
      009C6C 00 04            [ 2] 5604 1$: popw y ; mode 
      009C6E 00               [ 2] 5605 	popw x ; Dx pin 
      009C6F 02 CD 9A         [ 4] 5606 	call select_pin 
      009C72 DF 25            [ 1] 5607 	ld (PINNO,sp),a  
      009C74 05 A6            [ 1] 5608 	ld a,#1 
      009C76 09 CC            [ 1] 5609 	tnz (PINNO,sp)
      009C78 88 FB            [ 1] 5610 	jreq 4$
      009C7A 48               [ 1] 5611 2$:	sll a 
      009C7A CE 00            [ 1] 5612 	dec (PINNO,sp)
      009C7C 17 C6            [ 1] 5613 	jrne 2$ 
      009C7E 00 19            [ 1] 5614 	ld (PINNO,sp),a
      009C80 20 0A            [ 1] 5615 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C82 E7 03            [ 1] 5616 	ld (GPIO_CR1,x),a 
      009C82 AE 01 00 4F      [ 2] 5617 4$:	cpw y,#OUTP 
      009C86 CF 00            [ 1] 5618 	jreq 6$
                                   5619 ; input mode
      009C88 17 C7            [ 1] 5620 	ld a,(PINNO,sp)
      009C8A 00               [ 1] 5621 	cpl a 
      009C8B 19 02            [ 1] 5622 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C8C 20 0A            [ 2] 5623 	jra 9$
      001F2A                       5624 6$: ;output mode  
      009C8C 1F 01            [ 1] 5625 	ld a,(PINNO,sp)
      009C8E 6B 03            [ 1] 5626 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C90 CD 81            [ 1] 5627 	ld (GPIO_CR2,x),a 
      009C92 C0 CD            [ 1] 5628 	ld a,(PINNO,sp)
      009C94 82 3B            [ 1] 5629 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C96 AE 00            [ 1] 5630 9$:	ld (GPIO_DDR,x),a 
      001F36                       5631 	_drop VSIZE 
      009C98 80 CD            [ 2]    1     addw sp,#VSIZE 
      009C9A 9A               [ 4] 5632 	ret
                                   5633 
                                   5634 ;------------------------
                                   5635 ; select Arduino pin 
                                   5636 ; input:
                                   5637 ;   X 	 {0..15} Arduino Dx 
                                   5638 ; output:
                                   5639 ;   A     stm8s208 pin 
                                   5640 ;   X     base address s208 GPIO port 
                                   5641 ;---------------------------
      001F39                       5642 select_pin:
      009C9B 6B               [ 2] 5643 	sllw x 
      009C9C CD 9A 50         [ 2] 5644 	addw x,#arduino_to_8s208 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C9F C6               [ 2] 5645 	ldw x,(x)
      009CA0 00               [ 1] 5646 	ld a,xl 
      009CA1 19               [ 1] 5647 	push a 
      009CA2 C0               [ 1] 5648 	swapw x 
      009CA3 00 1C            [ 1] 5649 	ld a,#5 
      009CA5 C6               [ 4] 5650 	mul x,a 
      009CA6 00 18 C2         [ 2] 5651 	addw x,#GPIO_BASE 
      009CA9 00               [ 1] 5652 	pop a 
      009CAA 1B               [ 4] 5653 	ret 
                                   5654 ; translation from Arduino D0..D15 to stm8s208rb 
      001F49                       5655 arduino_to_8s208:
      009CAB C6 00                 5656 .byte 3,6 ; D0 
      009CAD 17 C2                 5657 .byte 3,5 ; D1 
      009CAF 00 1A                 5658 .byte 4,0 ; D2 
      009CB1 2B E0                 5659 .byte 2,1 ; D3
      009CB3 7B 03                 5660 .byte 6,0 ; D4
      009CB5 1E 01                 5661 .byte 2,2 ; D5
      009CB7 C7 00                 5662 .byte 2,3 ; D6
      009CB9 1C CF                 5663 .byte 3,1 ; D7
      009CBB 00 1A                 5664 .byte 3,3 ; D8
      009CBD 5B 03                 5665 .byte 2,4 ; D9
      009CBF 81 05                 5666 .byte 4,5 ; D10
      009CC0 02 06                 5667 .byte 2,6 ; D11
      009CC0 52 02                 5668 .byte 2,7 ; D12
      009CC2 5F 1F                 5669 .byte 2,5 ; D13
      009CC4 01 CF                 5670 .byte 4,2 ; D14
      009CC6 00 18                 5671 .byte 4,1 ; D15
                                   5672 
                                   5673 
                                   5674 ;------------------------------
                                   5675 ; BASIC: RND(expr)
                                   5676 ; return random number 
                                   5677 ; between 1 and expr inclusive
                                   5678 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5679 ; input:
                                   5680 ; 	none 
                                   5681 ; output:
                                   5682 ;	X 		random positive integer 
                                   5683 ;------------------------------
      001F69                       5684 random:
      009CC8 35 01 00         [ 4] 5685 	call func_args 
      009CCB 17 01            [ 1] 5686 	cp a,#1
      009CCC 27 03            [ 1] 5687 	jreq 1$
      009CCC 5F 92 AF         [ 2] 5688 	jp syntax_error
      001F73                       5689 1$:  
      009CCF 00 17            [ 1] 5690 	ld a,#0x80 
      009CD1 27 3B            [ 1] 5691 	bcp a,(1,sp)
      009CD3 27 05            [ 1] 5692 	jreq 2$
      009CD3 92 AF            [ 1] 5693 	ld a,#ERR_BAD_VALUE
      009CD5 00 17 27         [ 2] 5694 	jp tb_error
      001F7E                       5695 2$: 
                                   5696 ; acc16=(x<<5)^x 
      009CD8 06 CD 83         [ 2] 5697 	ldw x,seedx 
      009CDB 40               [ 2] 5698 	sllw x 
      009CDC 5C               [ 2] 5699 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CDD 20               [ 2] 5700 	sllw x 
      009CDE F4               [ 2] 5701 	sllw x 
      009CDF 5C               [ 2] 5702 	sllw x 
      009CE0 A6               [ 1] 5703 	ld a,xh 
      009CE1 20 CD 83         [ 1] 5704 	xor a,seedx 
      009CE4 40 92 AF         [ 1] 5705 	ld acc16,a 
      009CE7 00               [ 1] 5706 	ld a,xl 
      009CE8 17 90 95         [ 1] 5707 	xor a,seedx+1 
      009CEB 5C 92 AF         [ 1] 5708 	ld acc8,a 
                                   5709 ; seedx=seedy 
      009CEE 00 17 5C         [ 2] 5710 	ldw x,seedy 
      009CF1 90 97 90         [ 2] 5711 	ldw seedx,x  
                                   5712 ; seedy=seedy^(seedy>>1)
      009CF4 89 72            [ 2] 5713 	srlw y 
      009CF6 FB 01            [ 1] 5714 	ld a,yh 
      009CF8 CD 9A 6B         [ 1] 5715 	xor a,seedy 
      009CFB CD 9A 50         [ 1] 5716 	ld seedy,a  
      009CFE 85 CD            [ 1] 5717 	ld a,yl 
      009D00 8A 48 A6         [ 1] 5718 	xor a,seedy+1 
      009D03 0D CD 83         [ 1] 5719 	ld seedy+1,a 
                                   5720 ; acc16>>3 
      009D06 40 1E 01         [ 2] 5721 	ldw x,acc16 
      009D09 5C               [ 2] 5722 	srlw x 
      009D0A 1F               [ 2] 5723 	srlw x 
      009D0B 01               [ 2] 5724 	srlw x 
                                   5725 ; x=acc16^x 
      009D0C 20               [ 1] 5726 	ld a,xh 
      009D0D BE 00 0C         [ 1] 5727 	xor a,acc16 
      009D0E 95               [ 1] 5728 	ld xh,a 
      009D0E 1E               [ 1] 5729 	ld a,xl 
      009D0F 01 CD 8A         [ 1] 5730 	xor a,acc8 
      009D12 48               [ 1] 5731 	ld xl,a 
                                   5732 ; seedy=x^seedy 
      009D13 AE 9D 2D         [ 1] 5733 	xor a,seedy+1
      009D16 CD               [ 1] 5734 	ld xl,a 
      009D17 A8               [ 1] 5735 	ld a,xh 
      009D18 C0 CD 9A         [ 1] 5736 	xor a,seedy
      009D1B AB               [ 1] 5737 	ld xh,a 
      009D1C 5F 35 0A         [ 2] 5738 	ldw seedy,x 
                                   5739 ; return seedy modulo expr + 1 
      009D1F 00 0B            [ 2] 5740 	popw y 
      009D21 CD               [ 2] 5741 	divw x,y 
      009D22 8A               [ 1] 5742 	ldw x,y 
      009D23 58               [ 2] 5743 	incw x 
      001FCD                       5744 10$:
      009D24 AE 9D            [ 1] 5745 	ld a,#TK_INTGR
      009D26 35               [ 4] 5746 	ret 
                                   5747 
                                   5748 ;---------------------------------
                                   5749 ; BASIC: WORDS 
                                   5750 ; affiche la listes des mots du
                                   5751 ; dictionnaire ainsi que le nombre
                                   5752 ; de mots.
                                   5753 ;---------------------------------
                           000001  5754 	WLEN=1 ; word length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           000002  5755 	LLEN=2 ; character sent to console
                           000003  5756 	WCNT=3 ; count words printed 
                           000003  5757 	VSIZE=3 
      001FD0                       5758 words:
      001FD0                       5759 	_vars VSIZE
      009D27 CD A8            [ 2]    1     sub sp,#VSIZE 
      009D29 C0 5B            [ 1] 5760 	clr (LLEN,sp)
      009D2B 02 81            [ 1] 5761 	clr (WCNT,sp)
      009D2D 20 66 69 6C      [ 2] 5762 	ldw y,#kword_dict+2
      009D31 65               [ 1] 5763 0$:	ldw x,y
      009D32 73               [ 1] 5764 	ld a,(x)
      009D33 0A 00            [ 1] 5765 	and a,#15 
      009D35 20 62            [ 1] 5766 	ld (WLEN,sp),a 
      009D37 79 74            [ 1] 5767 	inc (WCNT,sp)
      009D39 65               [ 2] 5768 1$:	incw x 
      009D3A 73               [ 1] 5769 	ld a,(x)
      009D3B 20 66 72         [ 4] 5770 	call putc 
      009D3E 65 65            [ 1] 5771 	inc (LLEN,sp)
      009D40 0A 00            [ 1] 5772 	dec (WLEN,sp)
      009D42 26 F5            [ 1] 5773 	jrne 1$
      009D42 52 02            [ 1] 5774 	ld a,#70
      009D44 72 5F            [ 1] 5775 	cp a,(LLEN,sp)
      009D46 00 17            [ 1] 5776 	jrmi 2$   
      009D48 CD 91            [ 1] 5777 	ld a,#SPACE 
      009D4A 8D A1 84         [ 4] 5778 	call putc 
      009D4D 27 03            [ 1] 5779 	inc (LLEN,sp) 
      009D4F CC 88            [ 2] 5780 	jra 3$
      009D51 F9 1F            [ 1] 5781 2$: ld a,#CR 
      009D53 01 CD 89         [ 4] 5782 	call putc 
      009D56 EB A1            [ 1] 5783 	clr (LLEN,sp)
      009D58 09 27 02 20      [ 2] 5784 3$:	subw y,#2 
      009D5C 19 CD            [ 2] 5785 	ldw y,(y)
      009D5E 91 8D            [ 1] 5786 	jrne 0$ 
      009D60 A1 84            [ 1] 5787 	ld a,#CR 
      009D62 27 03 CC         [ 4] 5788 	call putc  
      009D65 88               [ 1] 5789 	clrw x 
      009D66 F9 9F            [ 1] 5790 	ld a,(WCNT,sp)
      009D68 1E               [ 1] 5791 	ld xl,a 
      009D69 01 CF 00         [ 4] 5792 	call print_int 
      009D6C 18 5F CD         [ 2] 5793 	ldw x,#words_count_msg
      009D6F 82 65 1E         [ 4] 5794 	call puts 
      00201D                       5795 	_drop VSIZE 
      009D72 01 5C            [ 2]    1     addw sp,#VSIZE 
      009D74 20               [ 4] 5796 	ret 
      009D75 DC 77 6F 72 64 73 20  5797 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5798 
                                   5799 
                                   5800 ;-----------------------------
                                   5801 ; BASIC: TIMER expr 
                                   5802 ; initialize count down timer 
                                   5803 ;-----------------------------
      009D76                       5804 set_timer:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D76 5B 02 81         [ 4] 5805 	call arg_list
      009D79 A1 01            [ 1] 5806 	cp a,#1 
      009D79 CD 90            [ 1] 5807 	jreq 1$
      009D7B 8F A1 01         [ 2] 5808 	jp syntax_error
      002040                       5809 1$: 
      009D7E 27               [ 2] 5810 	popw x 
      009D7F 03 CC 88         [ 2] 5811 	ldw timer,x 
      009D82 F9               [ 4] 5812 	ret 
                                   5813 
                                   5814 ;------------------------------
                                   5815 ; BASIC: TIMEOUT 
                                   5816 ; return state of timer 
                                   5817 ;------------------------------
      002045                       5818 timeout:
      009D83 85 9F A4         [ 2] 5819 	ldw x,timer 
      002048                       5820 logical_complement:
      009D86 7F               [ 2] 5821 	cplw x 
      009D87 97 A6 03         [ 2] 5822 	cpw x,#-1
      009D8A 81 01            [ 1] 5823 	jreq 2$
      009D8B 5F               [ 1] 5824 	clrw x 
      009D8B A6 07            [ 1] 5825 2$:	ld a,#TK_INTGR
      009D8D CD               [ 4] 5826 	ret 
                                   5827 
                                   5828 ;--------------------------------
                                   5829 ; BASIC NOT(expr) 
                                   5830 ; return logical complement of expr
                                   5831 ;--------------------------------
      002052                       5832 func_not:
      009D8E 90 82 CD         [ 4] 5833 	call func_args  
      009D91 89 EB            [ 1] 5834 	cp a,#1
      009D93 A1 02            [ 1] 5835 	jreq 1$
      009D95 27 07 A1         [ 2] 5836 	jp syntax_error
      009D98 03               [ 2] 5837 1$:	popw x 
      009D99 27 06            [ 2] 5838 	jra logical_complement
                                   5839 
                                   5840 
                                   5841 
                                   5842 ;-----------------------------------
                                   5843 ; BASIC: IWDGEN expr1 
                                   5844 ; enable independant watchdog timer
                                   5845 ; expr1 is delay in multiple of 62.5µsec
                                   5846 ; expr1 -> {1..16383}
                                   5847 ;-----------------------------------
      00205F                       5848 enable_iwdg:
      009D9B CC 88 F9         [ 4] 5849 	call arg_list
      009D9E A1 01            [ 1] 5850 	cp a,#1 
      009D9E F6 5F            [ 1] 5851 	jreq 1$
      009DA0 97 08 79         [ 2] 5852 	jp syntax_error 
      009DA1 85               [ 2] 5853 1$: popw x 
      009DA1 89 A6            [ 1] 5854 	push #0
      009DA3 08 CD 90 82      [ 1] 5855 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009DA7 85               [ 1] 5856 	ld a,xh 
      009DA8 A6 84            [ 1] 5857 	and a,#0x3f
      009DAA 81               [ 1] 5858 	ld xh,a  
      009DAB A3 00 FF         [ 2] 5859 2$:	cpw x,#255
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DAB CD 83            [ 2] 5860 	jrule 3$
      009DAD 49 5F            [ 1] 5861 	inc (1,sp)
      009DAF 97               [ 1] 5862 	rcf 
      009DB0 A6               [ 2] 5863 	rrcw x 
      009DB1 84 81            [ 2] 5864 	jra 2$
      009DB3 35 55 50 E0      [ 1] 5865 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DB3 5F               [ 1] 5866 	pop a  
      009DB4 C6 00 2E         [ 1] 5867 	ld IWDG_PR,a 
      009DB7 C1               [ 1] 5868 	ld a,xl
      009DB8 00               [ 1] 5869 	dec a 
      009DB9 2F 27 01 53      [ 1] 5870 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009DBD A6 84 81         [ 1] 5871 	ld IWDG_RLR,a 
      009DC0 35 AA 50 E0      [ 1] 5872 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009DC0 CD               [ 4] 5873 	ret 
                                   5874 
                                   5875 
                                   5876 ;-----------------------------------
                                   5877 ; BASIC: IWDGREF  
                                   5878 ; refresh independant watchdog count down 
                                   5879 ; timer before it reset MCU. 
                                   5880 ;-----------------------------------
      002095                       5881 refresh_iwdg:
      009DC1 90 8F A1 02      [ 1] 5882 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009DC5 27               [ 4] 5883 	ret 
                                   5884 
                                   5885 
                                   5886 ;-------------------------------------
                                   5887 ; BASIC: LOG(expr)
                                   5888 ; return logarithm base 2 of expr 
                                   5889 ; this is the position of most significant
                                   5890 ; bit set. 
                                   5891 ; input: 
                                   5892 ; output:
                                   5893 ;   X     log2 
                                   5894 ;   A     TK_INTGR 
                                   5895 ;*********************************
      00209A                       5896 log2:
      009DC6 03 CC 88         [ 4] 5897 	call func_args 
      009DC9 F9 01            [ 1] 5898 	cp a,#1 
      009DCA 27 03            [ 1] 5899 	jreq 1$
      009DCA 1E 03 2B         [ 2] 5900 	jp syntax_error 
      009DCD 17               [ 2] 5901 1$: popw x 
      0020A5                       5902 leading_one:
      009DCE A3               [ 2] 5903 	tnzw x 
      009DCF 00 09            [ 1] 5904 	jreq 4$
      009DD1 2A 12            [ 1] 5905 	ld a,#15 
      009DD3 A6               [ 2] 5906 2$: rlcw x 
      009DD4 05 42            [ 1] 5907     jrc 3$
      009DD6 1C               [ 1] 5908 	dec a 
      009DD7 50 00            [ 2] 5909 	jra 2$
      009DD9 1F               [ 1] 5910 3$: clrw x 
      009DDA 03               [ 1] 5911     ld xl,a
      009DDB 1E 01            [ 1] 5912 4$:	ld a,#TK_INTGR
      009DDD 72               [ 4] 5913 	ret 
                                   5914 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5915 ;-----------------------------------
                                   5916 ; BASIC: BIT(expr) 
                                   5917 ; expr ->{0..15}
                                   5918 ; return 2^expr 
                                   5919 ; output:
                                   5920 ;    x    2^expr 
                                   5921 ;-----------------------------------
      0020B5                       5922 bitmask:
      009DDE FB 03 A6         [ 4] 5923     call func_args 
      009DE1 84 5B            [ 1] 5924 	cp a,#1
      009DE3 04 81            [ 1] 5925 	jreq 1$
      009DE5 CC 08 79         [ 2] 5926 	jp syntax_error 
      009DE5 A6               [ 2] 5927 1$: popw x 
      009DE6 0A               [ 1] 5928 	ld a,xl 
      009DE7 CC 88            [ 1] 5929 	and a,#15
      009DE9 FB               [ 1] 5930 	clrw x 
      009DEA 5C               [ 2] 5931 	incw x 
      009DEA AE               [ 1] 5932 2$: tnz a 
      009DEB A8 80            [ 1] 5933 	jreq 3$
      009DED A6               [ 2] 5934 	slaw x 
      009DEE 84               [ 1] 5935 	dec a 
      009DEF 81 F9            [ 2] 5936 	jra 2$ 
      009DF0 A6 84            [ 1] 5937 3$: ld a,#TK_INTGR
      009DF0 90               [ 4] 5938 	ret 
                                   5939 
                                   5940 ;------------------------------
                                   5941 ; BASIC: INVERT(expr)
                                   5942 ; 1's complement 
                                   5943 ;--------------------------------
      0020CF                       5944 invert:
      009DF1 89 CD 90         [ 4] 5945 	call func_args
      009DF4 8F A1            [ 1] 5946 	cp a,#1 
      009DF6 01 27            [ 1] 5947 	jreq 1$
      009DF8 07 A1 02         [ 2] 5948 	jp syntax_error
      009DFB 27               [ 2] 5949 1$: popw x  
      009DFC 03               [ 2] 5950 	cplw x 
      009DFD CC 88            [ 1] 5951 	ld a,#TK_INTGR 
      009DFF F9               [ 4] 5952 	ret 
                                   5953 
                                   5954 ;------------------------------
                                   5955 ; BASIC: DO 
                                   5956 ; initiate a DO ... UNTIL loop 
                                   5957 ;------------------------------
                           000003  5958 	DOLP_ADR=3 
                           000005  5959 	DOLP_INW=5
                           000004  5960 	VSIZE=4 
      0020DE                       5961 do_loop:
      009E00 90               [ 2] 5962 	popw x 
      0020DF                       5963 	_vars VSIZE 
      009E01 85 A1            [ 2]    1     sub sp,#VSIZE 
      009E03 01               [ 2] 5964 	pushw x 
      009E04 27 02 85 51      [ 2] 5965 	ldw y,basicptr 
      009E08 90 FD            [ 2] 5966 	ldw (DOLP_ADR,sp),y
      009E0A 90 85 81 00      [ 2] 5967 	ldw y,in.w 
      009E0D 17 05            [ 2] 5968 	ldw (DOLP_INW,sp),y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E0D 72 0D 52 30      [ 1] 5969 	inc loop_depth 
      009E11 FB               [ 4] 5970 	ret 
                                   5971 
                                   5972 ;--------------------------------
                                   5973 ; BASIC: UNTIL expr 
                                   5974 ; loop if exprssion is false 
                                   5975 ; else terminate loop
                                   5976 ;--------------------------------
      0020F3                       5977 until: 
      009E12 8E CC 86 56      [ 1] 5978 	tnz loop_depth 
      009E16 26 03            [ 1] 5979 	jrne 1$ 
      009E16 72 01 00         [ 2] 5980 	jp syntax_error 
      0020FC                       5981 1$: 
      009E19 24 07 27         [ 4] 5982 	call relation 
      009E1C 05 A6            [ 1] 5983 	cp a,#TK_INTGR
      009E1E 07 CC            [ 1] 5984 	jreq 2$
      009E20 88 FB 79         [ 2] 5985 	jp syntax_error
      009E22                       5986 2$: 
      009E22 CD               [ 2] 5987 	tnzw x 
      009E23 89 EB            [ 1] 5988 	jrne 9$
      009E25 4D 26            [ 2] 5989 	ldw x,(DOLP_ADR,sp)
      009E27 08 AE 40         [ 2] 5990 	ldw basicptr,x 
      009E2A 00 CD            [ 1] 5991 	ld a,(2,x)
      009E2C A8 C0 4F         [ 1] 5992 	ld count,a 
      009E2F 81 05            [ 2] 5993 	ldw x,(DOLP_INW,sp)
      009E30 CF 00 00         [ 2] 5994 	ldw in.w,x 
      009E30 A1               [ 4] 5995 	ret 
      002119                       5996 9$:	; remove loop data from stack  
      009E31 02               [ 2] 5997 	popw x
      00211A                       5998 	_drop VSIZE
      009E32 27 03            [ 2]    1     addw sp,#VSIZE 
      009E34 CC 88 F9 20      [ 1] 5999 	dec loop_depth 
      009E37 FC               [ 2] 6000 	jp (x)
                                   6001 
                                   6002 ;--------------------------
                                   6003 ; BASIC: PRTA...PRTI  
                                   6004 ;  return constant value 
                                   6005 ;  PORT  offset in GPIO
                                   6006 ;  array
                                   6007 ;---------------------------
      002121                       6008 const_porta:
      009E37 7D 26 09         [ 2] 6009 	ldw x,#0
      009E3A CD 87            [ 1] 6010 	ld a,#TK_INTGR 
      009E3C 18               [ 4] 6011 	ret 
      002127                       6012 const_portb:
      009E3D 55 00 04         [ 2] 6013 	ldw x,#1
      009E40 00 02            [ 1] 6014 	ld a,#TK_INTGR 
      009E42 81               [ 4] 6015 	ret 
      00212D                       6016 const_portc:
      009E43 89 90 93         [ 2] 6017 	ldw x,#2
      009E46 CD 9A            [ 1] 6018 	ld a,#TK_INTGR 
      009E48 DF               [ 4] 6019 	ret 
      002133                       6020 const_portd:
      009E49 25 05 A6         [ 2] 6021 	ldw x,#3
      009E4C 09 CC            [ 1] 6022 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E4E 88               [ 4] 6023 	ret 
      002139                       6024 const_porte:
      009E4F FB 00 04         [ 2] 6025 	ldw x,#4
      009E50 A6 84            [ 1] 6026 	ld a,#TK_INTGR 
      009E50 55               [ 4] 6027 	ret 
      00213F                       6028 const_portf:
      009E51 00 04 00         [ 2] 6029 	ldw x,#5
      009E54 02 72            [ 1] 6030 	ld a,#TK_INTGR 
      009E56 5F               [ 4] 6031 	ret 
      002145                       6032 const_portg:
      009E57 00 17 AE         [ 2] 6033 	ldw x,#6
      009E5A 40 00            [ 1] 6034 	ld a,#TK_INTGR 
      009E5C CF               [ 4] 6035 	ret 
      00214B                       6036 const_porth:
      009E5D 00 18 1E         [ 2] 6037 	ldw x,#7
      009E60 01 CD            [ 1] 6038 	ld a,#TK_INTGR 
      009E62 84               [ 4] 6039 	ret 
      002151                       6040 const_porti:
      009E63 16 5F 97         [ 2] 6041 	ldw x,#8
      009E66 5C 90            [ 1] 6042 	ld a,#TK_INTGR 
      009E68 85               [ 4] 6043 	ret 
                                   6044 
                                   6045 ;-------------------------------
                                   6046 ; following return constant 
                                   6047 ; related to GPIO register offset 
                                   6048 ;---------------------------------
      002157                       6049 const_odr:
      009E69 89 5F            [ 1] 6050 	ld a,#TK_INTGR 
      009E6B CD 82 DA         [ 2] 6051 	ldw x,#GPIO_ODR
      009E6E 5B               [ 4] 6052 	ret 
      00215D                       6053 const_idr:
      009E6F 02 81            [ 1] 6054 	ld a,#TK_INTGR 
      009E71 AE 00 01         [ 2] 6055 	ldw x,#GPIO_IDR
      009E71 72               [ 4] 6056 	ret 
      002163                       6057 const_ddr:
      009E72 0D 52            [ 1] 6058 	ld a,#TK_INTGR 
      009E74 30 FB 72         [ 2] 6059 	ldw x,#GPIO_DDR
      009E77 16               [ 4] 6060 	ret 
      002169                       6061 const_cr1:
      009E78 00 24            [ 1] 6062 	ld a,#TK_INTGR 
      009E7A 8E 81 03         [ 2] 6063 	ldw x,#GPIO_CR1
      009E7C 81               [ 4] 6064 	ret 
      00216F                       6065 const_cr2:
      009E7C CD 91            [ 1] 6066 	ld a,#TK_INTGR 
      009E7E 8D A1 84         [ 2] 6067 	ldw x,#GPIO_CR2
      009E81 27               [ 4] 6068 	ret 
                                   6069 ;-------------------------
                                   6070 ;  constant for port mode
                                   6071 ;  used by PMODE 
                                   6072 ;  input or output
                                   6073 ;------------------------
      002175                       6074 const_output:
      009E82 03 CC            [ 1] 6075 	ld a,#TK_INTGR 
      009E84 88 F9 01         [ 2] 6076 	ldw x,#OUTP
      009E86 81               [ 4] 6077 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00217B                       6078 const_input:
      009E86 5D 27            [ 1] 6079 	ld a,#TK_INTGR 
      009E88 04 8F 5A         [ 2] 6080 	ldw x,#INP 
      009E8B 26               [ 4] 6081 	ret 
                                   6082 ;-----------------------
                                   6083 ; memory area constants
                                   6084 ;-----------------------
      002181                       6085 const_eeprom_base:
      009E8C F9 4F            [ 1] 6086 	ld a,#TK_INTGR 
      009E8E 81 40 00         [ 2] 6087 	ldw x,#EEPROM_BASE 
      009E8F 81               [ 4] 6088 	ret 
                                   6089 
                                   6090 ;---------------------------
                                   6091 ; BASIC: DATA 
                                   6092 ; when the interpreter find 
                                   6093 ; a DATA line it skip it.
                                   6094 ;---------------------------
      002187                       6095 data:
      009E8F CD 91 8D A1 84   [ 1] 6096 	mov in,count 
      009E94 27               [ 4] 6097 	ret 
                                   6098 
                                   6099 ;---------------------------
                                   6100 ; BASIC: DATLN  *expr*
                                   6101 ; set DATA pointer at line# 
                                   6102 ; specified by *expr* 
                                   6103 ;---------------------------
      00218D                       6104 data_line:
      009E95 03 CC 88         [ 4] 6105 	call expression
      009E98 F9 84            [ 1] 6106 	cp a,#TK_INTGR
      009E99 27 03            [ 1] 6107 	jreq 1$
      009E99 A3 14 00         [ 2] 6108 	jp syntax_error 
      009E9C 2B 0C 35         [ 4] 6109 1$: call search_lineno
      009E9F 0F               [ 2] 6110 	tnzw x 
      009EA0 50 F2            [ 1] 6111 	jrne 3$
      009EA2 A6 1E            [ 1] 6112 2$:	ld a,#ERR_NO_LINE 
      009EA4 62 A6 10         [ 2] 6113 	jp tb_error
      0021A2                       6114 3$: ; check if valid data line 
      009EA7 62 20            [ 1] 6115     ldw y,x 
      009EA9 1E 04            [ 2] 6116 	ldw x,(4,x)
      009EAA A3 21 87         [ 2] 6117 	cpw x,#data 
      009EAA A3 08            [ 1] 6118 	jrne 2$ 
      009EAC 00 2B 09 35      [ 2] 6119 	ldw data_ptr,y
      009EB0 0E 50 F2         [ 1] 6120 	ld a,(2,y)
      009EB3 A6 50 62         [ 1] 6121 	ld data_len,a 
      009EB6 20 10 00 08      [ 1] 6122 	mov data_ofs,#FIRST_DATA_ITEM 
      009EB8 81               [ 4] 6123 	ret
                                   6124 
                                   6125 ;---------------------------------
                                   6126 ; BASIC: RESTORE 
                                   6127 ; set data_ptr to first data line
                                   6128 ; if not DATA found pointer set to
                                   6129 ; zero 
                                   6130 ;---------------------------------
      0021BA                       6131 restore:
      009EB8 35 07 50 F2      [ 1] 6132 	clr data_ptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EBC 72 5F 00 07      [ 1] 6133 	clr data_ptr+1
      009EBC A3 00 40 23      [ 1] 6134 	clr data_ofs 
      009EC0 07 72 5C 50      [ 1] 6135 	clr data_len
      009EC4 F2 54 20         [ 2] 6136 	ldw x,txtbgn
      0021CD                       6137 data_search_loop: 	
      009EC7 F4 00 1E         [ 2] 6138 	cpw x,txtend
      009EC8 24 17            [ 1] 6139 	jruge 9$
      009EC8 9F 4A            [ 1] 6140 	ldw y,x 
      009ECA 27 01            [ 2] 6141 	ldw x,(4,x)
      009ECC 4A 21 87         [ 2] 6142 	cpw x,#data 
      009ECD 26 1A            [ 1] 6143 	jrne try_next_line 
      009ECD A4 3E C7 50      [ 2] 6144 	ldw data_ptr,y 
      009ED1 F1 72 18         [ 1] 6145 	ld a,(2,y)
      009ED4 50 F0 8E         [ 1] 6146 	ld data_len,a 
      009ED7 81 06 00 08      [ 1] 6147 	mov data_ofs,#FIRST_DATA_ITEM
      009ED8 72 5D 00 09      [ 1] 6148 9$:	tnz data_len 
      009ED8 CE 00            [ 1] 6149     jrne 10$
      009EDA 0F A6            [ 1] 6150 	ld a,#ERR_NO_DATA 
      009EDC 84 81 7B         [ 2] 6151 	jp tb_error 
      009EDE 81               [ 4] 6152 10$:ret
      0021F5                       6153 try_next_line:
      009EDE CD               [ 1] 6154 	ldw x,y 
      009EDF 90 8F            [ 1] 6155 	ld a,(2,x)
      009EE1 A1 01 27         [ 1] 6156 	ld acc8,a 
      009EE4 03 CC 88 F9      [ 1] 6157 	clr acc16 
      009EE8 72 BB 00 0C      [ 2] 6158 	addw x,acc16 
      009EE8 85 9E            [ 2] 6159 	jra data_search_loop
                                   6160 
                                   6161 
                                   6162 ;---------------------------------
                                   6163 ; BASIC: READ 
                                   6164 ; return next data item | 0 
                                   6165 ;---------------------------------
                           000001  6166 	CTX_BPTR=1 
                           000003  6167 	CTX_IN=3 
                           000004  6168 	CTX_COUNT=4 
                           000005  6169 	XSAVE=5
                           000006  6170 	VSIZE=6
      002205                       6171 read:
      002205                       6172 	_vars  VSIZE 
      009EEA A5 80            [ 2]    1     sub sp,#VSIZE 
      002207                       6173 read01:	
      009EEC 27 01 50         [ 1] 6174 	ld a,data_ofs
      009EEF A6 84 81         [ 1] 6175 	cp a,data_len 
      009EF2 27 37            [ 1] 6176 	jreq 2$ ; end of line  
      009EF2 CD 90 8F         [ 4] 6177 	call save_context
      009EF5 A1 02 27         [ 2] 6178 	ldw x,data_ptr 
      009EF8 03 CC 88         [ 2] 6179 	ldw basicptr,x 
      009EFB F9 85 9E 14 01   [ 1] 6180 	mov in,data_ofs 
      009F00 95 9F 14 02 97   [ 1] 6181 	mov count,data_len  
      009F05 5B 02 A6         [ 4] 6182 	call expression 
      009F08 84 81            [ 1] 6183 	cp a,#TK_INTGR 
      009F0A 27 03            [ 1] 6184 	jreq 1$ 
      009F0A CD 90 8F         [ 2] 6185 	jp syntax_error 
      00222C                       6186 1$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F0D A1 02            [ 2] 6187 	ldw (XSAVE,SP),x
      009F0F 27 03 CC         [ 4] 6188 	call next_token ; skip comma
      009F12 88 F9 04         [ 2] 6189 	ldw x,basicptr 
      009F14 CF 00 06         [ 2] 6190 	ldw data_ptr,x 
      009F14 85 9E 1A 01 95   [ 1] 6191 	mov data_ofs,in 
      009F19 9F 1A 02         [ 4] 6192 	call rest_context
      009F1C 97 5B            [ 2] 6193 	ldw x,(XSAVE,sp)
      009F1E 02 A6            [ 1] 6194 	ld a,#TK_INTGR
      002243                       6195 	_drop VSIZE 
      009F20 84 81            [ 2]    1     addw sp,#VSIZE 
      009F22 81               [ 4] 6196 	ret 
      002246                       6197 2$: ; end of line reached 
      009F22 CD 90 8F A1      [ 2] 6198 	ldw y, data_ptr 
      009F26 02 27 03 CC      [ 1] 6199 	clr data_ptr
      009F2A 88 F9 00 07      [ 1] 6200 	clr data_ptr+1   
      009F2C 72 5F 00 08      [ 1] 6201 	clr data_ofs 
      009F2C 85 9E 18 01      [ 1] 6202 	clr data_len 
      009F30 95 9F 18         [ 4] 6203 	call try_next_line 
      009F33 02 97            [ 2] 6204 	jra read01
                                   6205 
                                   6206 
                                   6207 ;---------------------------------
                                   6208 ; BASIC: SPIEN clkdiv, 0|1  
                                   6209 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6210 ; if clkdiv==-1 disable SPI
                                   6211 ; 0|1 -> disable|enable  
                                   6212 ;--------------------------------- 
                           000005  6213 SPI_CS_BIT=5
      00225F                       6214 spi_enable:
      009F35 5B 02 A6         [ 4] 6215 	call arg_list 
      009F38 84 81            [ 1] 6216 	cp a,#2
      009F3A 27 03            [ 1] 6217 	jreq 1$
      009F3A CD 90 8F         [ 2] 6218 	jp syntax_error 
      002269                       6219 1$: 
      009F3D A1 02 27 03      [ 1] 6220 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F41 CC               [ 2] 6221 	popw x  
      009F42 88               [ 2] 6222 	tnzw x 
      009F43 F9 90            [ 1] 6223 	jreq spi_disable 
      009F45 85               [ 2] 6224 	popw x 
      009F46 85 90            [ 1] 6225 	ld a,#(1<<SPI_CR1_BR)
      009F48 5D               [ 4] 6226 	mul x,a 
      009F49 27               [ 1] 6227 	ld a,xl 
      009F4A 05 58 90         [ 1] 6228 	ld SPI_CR1,a 
                                   6229 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F4D 5A 26 FB 14      [ 1] 6230 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F50 72 1A 50 16      [ 1] 6231 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6232 ; configure SPI as master mode 0.	
      009F50 A6 84 81 00      [ 1] 6233 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6234 ; ~CS line controlled by sofware 	
      009F53 72 12 52 01      [ 1] 6235 	bset SPI_CR2,#SPI_CR2_SSM 
      009F53 CD 90 8F A1      [ 1] 6236     bset SPI_CR2,#SPI_CR2_SSI 
                                   6237 ; enable SPI
      009F57 02 27 03 CC      [ 1] 6238 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F5B 88               [ 4] 6239 	ret 
      002292                       6240 spi_disable:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      002292                       6241 	_drop #2; throw first argument.
      009F5C F9 90            [ 2]    1     addw sp,##2 
                                   6242 ; wait spi idle 
      009F5E 85 85            [ 1] 6243 1$:	ld a,#0x82 
      009F60 90 5D 27         [ 1] 6244 	and a,SPI_SR
      009F63 05 54            [ 1] 6245 	cp a,#2 
      009F65 90 5A            [ 1] 6246 	jrne 1$
      009F67 26 FB 52 00      [ 1] 6247 	bres SPI_CR1,#SPI_CR1_SPE
      009F69 72 13 50 C7      [ 1] 6248 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F69 A6 84 81 16      [ 1] 6249 	bres PE_DDR,#SPI_CS_BIT 
      009F6C 81               [ 4] 6250 	ret 
                                   6251 
      0022AA                       6252 spi_clear_error:
      009F6C A6 84            [ 1] 6253 	ld a,#0x78 
      009F6E CD 90 82         [ 1] 6254 	bcp a,SPI_SR 
      009F71 9F A4            [ 1] 6255 	jreq 1$
      009F73 07 C7 50 C6      [ 1] 6256 	clr SPI_SR 
      009F77 81               [ 4] 6257 1$: ret 
                                   6258 
      009F78                       6259 spi_send_byte:
      009F78 52               [ 1] 6260 	push a 
      009F79 01 CD 90         [ 4] 6261 	call spi_clear_error
      009F7C 94               [ 1] 6262 	pop a 
      009F7D A1 02 27 03 CC   [ 2] 6263 	btjf SPI_SR,#SPI_SR_TXE,.
      009F82 88 F9 90         [ 1] 6264 	ld SPI_DR,a
      009F85 85 85 CD 9F B9   [ 2] 6265 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F8A 6B 01 A6         [ 1] 6266 	ld a,SPI_DR 
      009F8D 01               [ 4] 6267 	ret 
                                   6268 
      0022CC                       6269 spi_rcv_byte:
      009F8E 0D 01            [ 1] 6270 	ld a,#255
      009F90 27 0B 48 0A 01   [ 2] 6271 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F95 26 FB 6B         [ 1] 6272 	ld a,SPI_DR 
      009F98 01               [ 4] 6273 	ret
                                   6274 
                                   6275 ;------------------------------
                                   6276 ; BASIC: SPIWR byte [,byte]
                                   6277 ; write 1 or more byte
                                   6278 ;------------------------------
      0022D7                       6279 spi_write:
      009F99 EA 03 E7         [ 4] 6280 	call expression
      009F9C 03 90            [ 1] 6281 	cp a,#TK_INTGR 
      009F9E A3 00            [ 1] 6282 	jreq 1$
      009FA0 01 27 07         [ 2] 6283 	jp syntax_error 
      0022E1                       6284 1$:	
      009FA3 7B               [ 1] 6285 	ld a,xl 
      009FA4 01 43 E4         [ 4] 6286 	call spi_send_byte 
      009FA7 02 20 0A         [ 4] 6287 	call next_token 
      009FAA A1 09            [ 1] 6288 	cp a,#TK_COMMA 
      009FAA 7B 01            [ 1] 6289 	jrne 2$ 
      009FAC EA 04            [ 2] 6290 	jra spi_write 
      009FAE E7               [ 1] 6291 2$:	tnz a 
      009FAF 04 7B            [ 1] 6292 	jreq 3$
      0022F1                       6293 	_unget_token  
      009FB1 01 EA 02 E7 02   [ 1]    1     mov in,in.saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FB6 5B               [ 4] 6294 3$:	ret 
                                   6295 
                                   6296 
                                   6297 ;-------------------------------
                                   6298 ; BASIC: SPIRD 	
                                   6299 ; read one byte from SPI 
                                   6300 ;-------------------------------
      0022F7                       6301 spi_read:
      009FB7 01 81 CC         [ 4] 6302 	call spi_rcv_byte 
      009FB9 5F               [ 1] 6303 	clrw x 
      009FB9 58               [ 1] 6304 	ld xl,a 
      009FBA 1C 9F            [ 1] 6305 	ld a,#TK_INTGR 
      009FBC C9               [ 4] 6306 	ret 
                                   6307 
                                   6308 ;------------------------------
                                   6309 ; BASIC: SPISEL 0|1 
                                   6310 ; set state of ~CS line
                                   6311 ; 0|1 deselect|select  
                                   6312 ;------------------------------
      0022FF                       6313 spi_select:
      009FBD FE 9F 88         [ 4] 6314 	call next_token 
      009FC0 5E A6            [ 1] 6315 	cp a,#TK_INTGR 
      009FC2 05 42            [ 1] 6316 	jreq 1$
      009FC4 1C 50 00         [ 2] 6317 	jp syntax_error 
      009FC7 84               [ 2] 6318 1$: tnzw x  
      009FC8 81 05            [ 1] 6319 	jreq cs_high 
      009FC9 72 1B 50 14      [ 1] 6320 	bres PE_ODR,#SPI_CS_BIT
      009FC9 03               [ 4] 6321 	ret 
      002311                       6322 cs_high: 
      009FCA 06 03 05 04      [ 1] 6323 	bset PE_ODR,#SPI_CS_BIT
      009FCE 00               [ 4] 6324 	ret 
                                   6325 
                                   6326 
                                   6327 ;-------------------------------
                                   6328 ; BASIC: PAD 
                                   6329 ; Return pad buffer address.
                                   6330 ;------------------------------
      002316                       6331 pad_ref:
      009FCF 02 01 06         [ 2] 6332 	ldw x,#pad 
      009FD2 00 02            [ 1] 6333 	ld a,TK_INTGR
      009FD4 02               [ 4] 6334 	ret 
                                   6335 
                                   6336 ;------------------------------
                                   6337 ;      dictionary 
                                   6338 ; format:
                                   6339 ;   link:   2 bytes 
                                   6340 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6341 ;   cmd_name: 16 byte max 
                                   6342 ;   cmd_index: 2 bytes 
                                   6343 ;------------------------------
                                   6344 	.macro _dict_entry len,name,cmd_idx 
                                   6345 	.word LINK 
                                   6346 	LINK=.
                                   6347 name:
                                   6348 	.byte len 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6349 	.ascii "name"
                                   6350 	.word cmd_idx 
                                   6351 	.endm 
                                   6352 
                           000000  6353 	LINK=0
                                   6354 ; respect alphabetic order for BASIC names from Z-A
                                   6355 ; this sort order is for a cleaner WORDS cmd output. 	
      00231C                       6356 kword_end:
      00231C                       6357 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      009FD5 02 03                    1 	.word LINK 
                           00231E     2 	LINK=.
      00231E                          3 XOR:
      009FD7 03                       4 	.byte 3+F_IFUNC 	
      009FD8 01 03 03                 5 	.ascii "XOR"
      009FDB 02 04                    6 	.word XOR_IDX 
      002324                       6358 	_dict_entry,5,WRITE,WRITE_IDX;write  
      009FDD 04 05                    1 	.word LINK 
                           002326     2 	LINK=.
      002326                          3 WRITE:
      009FDF 02                       4 	.byte 5 	
      009FE0 06 02 07 02 05           5 	.ascii "WRITE"
      009FE5 04 02                    6 	.word WRITE_IDX 
      00232E                       6359 	_dict_entry,5,WORDS,WORDS_IDX;words 
      009FE7 04 01                    1 	.word LINK 
                           002330     2 	LINK=.
      009FE9                          3 WORDS:
      009FE9 CD                       4 	.byte 5 	
      009FEA 90 8F A1 01 27           5 	.ascii "WORDS"
      009FEF 03 CC                    6 	.word WORDS_IDX 
      002338                       6360 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      009FF1 88 F9                    1 	.word LINK 
                           00233A     2 	LINK=.
      009FF3                          3 WAIT:
      009FF3 A6                       4 	.byte 4 	
      009FF4 80 15 01 27              5 	.ascii "WAIT"
      009FF8 05 A6                    6 	.word WAIT_IDX 
      002341                       6361 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      009FFA 0A CC                    1 	.word LINK 
                           002343     2 	LINK=.
      002343                          3 USR:
      009FFC 88                       4 	.byte 3+F_IFUNC 	
      009FFD FB 53 52                 5 	.ascii "USR"
      009FFE 00 BE                    6 	.word USR_IDX 
      002349                       6362 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      009FFE CE 00                    1 	.word LINK 
                           00234B     2 	LINK=.
      00234B                          3 UNTIL:
      00A000 13                       4 	.byte 5 	
      00A001 58 58 58 58 58           5 	.ascii "UNTIL"
      00A006 9E C8                    6 	.word UNTIL_IDX 
      002353                       6363 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A008 00 13                    1 	.word LINK 
                           002355     2 	LINK=.
      002355                          3 UFLASH:
      00A00A C7                       4 	.byte 6+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A00B 00 0D 9F C8 00 14        5 	.ascii "UFLASH"
      00A011 C7 00                    6 	.word UFLASH_IDX 
      00235E                       6364 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound 
      00A013 0E CE                    1 	.word LINK 
                           002360     2 	LINK=.
      002360                          3 UBOUND:
      00A015 00                       4 	.byte 6+F_IFUNC 	
      00A016 15 CF 00 13 90 54        5 	.ascii "UBOUND"
      00A01C 90 9E                    6 	.word UBOUND_IDX 
      002369                       6365 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A01E C8 00                    1 	.word LINK 
                           00236B     2 	LINK=.
      00236B                          3 TONE:
      00A020 15                       4 	.byte 4 	
      00A021 C7 00 15 90              5 	.ascii "TONE"
      00A025 9F C8                    6 	.word TONE_IDX 
      002372                       6366 	_dict_entry,2,TO,TO_IDX;to
      00A027 00 16                    1 	.word LINK 
                           002374     2 	LINK=.
      002374                          3 TO:
      00A029 C7                       4 	.byte 2 	
      00A02A 00 16                    5 	.ascii "TO"
      00A02C CE 00                    6 	.word TO_IDX 
      002379                       6367 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A02E 0D 54                    1 	.word LINK 
                           00237B     2 	LINK=.
      00237B                          3 TIMEOUT:
      00A030 54                       4 	.byte 7+F_IFUNC 	
      00A031 54 9E C8 00 0D 95 9F     5 	.ascii "TIMEOUT"
      00A038 C8 00                    6 	.word TMROUT_IDX 
      002385                       6368 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A03A 0E 97                    1 	.word LINK 
                           002387     2 	LINK=.
      002387                          3 TIMER:
      00A03C C8                       4 	.byte 5 	
      00A03D 00 16 97 9E C8           5 	.ascii "TIMER"
      00A042 00 15                    6 	.word TIMER_IDX 
      00238F                       6369 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A044 95 CF                    1 	.word LINK 
                           002391     2 	LINK=.
      002391                          3 TICKS:
      00A046 00                       4 	.byte 5+F_IFUNC 	
      00A047 15 90 85 65 93           5 	.ascii "TICKS"
      00A04C 5C AE                    6 	.word TICKS_IDX 
      00A04D                       6370 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A04D A6 84                    1 	.word LINK 
                           00239B     2 	LINK=.
      00239B                          3 STOP:
      00A04F 81                       4 	.byte 4 	
      00A050 53 54 4F 50              5 	.ascii "STOP"
      00A050 52 03                    6 	.word STOP_IDX 
      0023A2                       6371 	_dict_entry,4,STEP,STEP_IDX;step 
      00A052 0F 02                    1 	.word LINK 
                           0023A4     2 	LINK=.
      0023A4                          3 STEP:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A054 0F                       4 	.byte 4 	
      00A055 03 90 AE A7              5 	.ascii "STEP"
      00A059 37 93                    6 	.word STEP_IDX 
      0023AB                       6372 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A05B F6 A4                    1 	.word LINK 
                           0023AD     2 	LINK=.
      0023AD                          3 SPIWR:
      00A05D 0F                       4 	.byte 5 	
      00A05E 6B 01 0C 03 5C           5 	.ascii "SPIWR"
      00A063 F6 CD                    6 	.word SPIWR_IDX 
      0023B5                       6373 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A065 83 40                    1 	.word LINK 
                           0023B7     2 	LINK=.
      0023B7                          3 SPISEL:
      00A067 0C                       4 	.byte 6 	
      00A068 02 0A 01 26 F5 A6        5 	.ascii "SPISEL"
      00A06E 46 11                    6 	.word SPISEL_IDX 
      0023C0                       6374 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A070 02 2B                    1 	.word LINK 
                           0023C2     2 	LINK=.
      0023C2                          3 SPIEN:
      00A072 09                       4 	.byte 5 	
      00A073 A6 20 CD 83 40           5 	.ascii "SPIEN"
      00A078 0C 02                    6 	.word SPIEN_IDX 
      0023CA                       6375 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A07A 20 07                    1 	.word LINK 
                           0023CC     2 	LINK=.
      0023CC                          3 SPIRD:
      00A07C A6                       4 	.byte 5+F_IFUNC 	
      00A07D 0D CD 83 40 0F           5 	.ascii "SPIRD"
      00A082 02 72                    6 	.word SPIRD_IDX 
      0023D4                       6376 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A084 A2 00                    1 	.word LINK 
                           0023D6     2 	LINK=.
      0023D6                          3 SLEEP:
      00A086 02                       4 	.byte 5 	
      00A087 90 FE 26 CF A6           5 	.ascii "SLEEP"
      00A08C 0D CD                    6 	.word SLEEP_IDX 
      0023DE                       6377 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A08E 83 40                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 SIZE:
      00A090 5F                       4 	.byte 4+F_IFUNC 	
      00A091 7B 03 97 CD              5 	.ascii "SIZE"
      00A095 8A 48                    6 	.word SIZE_IDX 
      0023E7                       6378     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A097 AE A0                    1 	.word LINK 
                           0023E9     2 	LINK=.
      0023E9                          3 SHOW:
      00A099 A0                       4 	.byte 4 	
      00A09A CD A8 C0 5B              5 	.ascii "SHOW"
      00A09E 03 81                    6 	.word SHOW_IDX 
      0023F0                       6379 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A0A0 20 77                    1 	.word LINK 
                           0023F2     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0023F2                          3 SAVE:
      00A0A2 6F                       4 	.byte 4 	
      00A0A3 72 64 73 20              5 	.ascii "SAVE"
      00A0A7 69 6E                    6 	.word SAVE_IDX 
      0023F9                       6380 	_dict_entry 3,RUN,RUN_IDX;run
      00A0A9 20 64                    1 	.word LINK 
                           0023FB     2 	LINK=.
      0023FB                          3 RUN:
      00A0AB 69                       4 	.byte 3 	
      00A0AC 63 74 69                 5 	.ascii "RUN"
      00A0AF 6F 6E                    6 	.word RUN_IDX 
      002401                       6381 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A0B1 61 72                    1 	.word LINK 
                           002403     2 	LINK=.
      002403                          3 RSHIFT:
      00A0B3 79                       4 	.byte 6+F_IFUNC 	
      00A0B4 0A 00 48 49 46 54        5 	.ascii "RSHIFT"
      00A0B6 00 96                    6 	.word RSHIFT_IDX 
      00240C                       6382 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A0B6 CD 90                    1 	.word LINK 
                           00240E     2 	LINK=.
      00240E                          3 RND:
      00A0B8 94                       4 	.byte 3+F_IFUNC 	
      00A0B9 A1 01 27                 5 	.ascii "RND"
      00A0BC 03 CC                    6 	.word RND_IDX 
      002414                       6383 	_dict_entry,6,RETURN,RET_IDX;return 
      00A0BE 88 F9                    1 	.word LINK 
                           002416     2 	LINK=.
      00A0C0                          3 RETURN:
      00A0C0 85                       4 	.byte 6 	
      00A0C1 CF 00 11 81 52 4E        5 	.ascii "RETURN"
      00A0C5 00 92                    6 	.word RET_IDX 
      00241F                       6384 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A0C5 CE 00                    1 	.word LINK 
                           002421     2 	LINK=.
      002421                          3 RESTORE:
      00A0C7 11                       4 	.byte 7 	
      00A0C8 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A0C8 53 A3                    6 	.word REST_IDX 
      00242B                       6385 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A0CA FF FF                    1 	.word LINK 
                           00242D     2 	LINK=.
      00242D                          3 REMARK:
      00A0CC 27                       4 	.byte 6 	
      00A0CD 01 5F A6 84 81 4B        5 	.ascii "REMARK"
      00A0D2 00 8E                    6 	.word REM_IDX 
      002436                       6386 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A0D2 CD 90                    1 	.word LINK 
                           002438     2 	LINK=.
      002438                          3 REBOOT:
      00A0D4 8F                       4 	.byte 6 	
      00A0D5 A1 01 27 03 CC 88        5 	.ascii "REBOOT"
      00A0DB F9 85                    6 	.word RBT_IDX 
      002441                       6387 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A0DD 20 E9                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           002443     2 	LINK=.
      00A0DF                          3 READ:
      00A0DF CD                       4 	.byte 4+F_IFUNC 	
      00A0E0 90 94 A1 01              5 	.ascii "READ"
      00A0E4 27 03                    6 	.word READ_IDX 
      00244A                       6388 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A0E6 CC 88                    1 	.word LINK 
                           00244C     2 	LINK=.
      00244C                          3 QKEY:
      00A0E8 F9                       4 	.byte 4+F_IFUNC 	
      00A0E9 85 4B 00 35              5 	.ascii "QKEY"
      00A0ED CC 50                    6 	.word QKEY_IDX 
      002453                       6389 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A0EF E0 9E                    1 	.word LINK 
                           002455     2 	LINK=.
      002455                          3 PRTI:
      00A0F1 A4                       4 	.byte 4+F_IFUNC 	
      00A0F2 3F 95 A3 00              5 	.ascii "PRTI"
      00A0F6 FF 23                    6 	.word PRTI_IDX 
      00245C                       6390 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A0F8 06 0C                    1 	.word LINK 
                           00245E     2 	LINK=.
      00245E                          3 PRTH:
      00A0FA 01                       4 	.byte 4+F_IFUNC 	
      00A0FB 98 56 20 F5              5 	.ascii "PRTH"
      00A0FF 35 55                    6 	.word PRTH_IDX 
      002465                       6391 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A101 50 E0                    1 	.word LINK 
                           002467     2 	LINK=.
      002467                          3 PRTG:
      00A103 84                       4 	.byte 4+F_IFUNC 	
      00A104 C7 50 E1 9F              5 	.ascii "PRTG"
      00A108 4A 35                    6 	.word PRTG_IDX 
      00246E                       6392 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A10A 55 50                    1 	.word LINK 
                           002470     2 	LINK=.
      002470                          3 PRTF:
      00A10C E0                       4 	.byte 4+F_IFUNC 	
      00A10D C7 50 E2 35              5 	.ascii "PRTF"
      00A111 AA 50                    6 	.word PRTF_IDX 
      002477                       6393 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A113 E0 81                    1 	.word LINK 
                           002479     2 	LINK=.
      00A115                          3 PRTE:
      00A115 35                       4 	.byte 4+F_IFUNC 	
      00A116 AA 50 E0 81              5 	.ascii "PRTE"
      00A11A 00 7E                    6 	.word PRTE_IDX 
      002480                       6394 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A11A CD 90                    1 	.word LINK 
                           002482     2 	LINK=.
      002482                          3 PRTD:
      00A11C 8F                       4 	.byte 4+F_IFUNC 	
      00A11D A1 01 27 03              5 	.ascii "PRTD"
      00A121 CC 88                    6 	.word PRTD_IDX 
      002489                       6395 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A123 F9 85                    1 	.word LINK 
                           00248B     2 	LINK=.
      00A125                          3 PRTC:
      00A125 5D                       4 	.byte 4+F_IFUNC 	
      00A126 27 0A A6 0F              5 	.ascii "PRTC"
      00A12A 59 25                    6 	.word PRTC_IDX 
      002492                       6396 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A12C 03 4A                    1 	.word LINK 
                           002494     2 	LINK=.
      002494                          3 PRTB:
      00A12E 20                       4 	.byte 4+F_IFUNC 	
      00A12F FA 5F 97 A6              5 	.ascii "PRTB"
      00A133 84 81                    6 	.word PRTB_IDX 
      00A135                       6397 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A135 CD 90                    1 	.word LINK 
                           00249D     2 	LINK=.
      00249D                          3 PRTA:
      00A137 8F                       4 	.byte 4+F_IFUNC 	
      00A138 A1 01 27 03              5 	.ascii "PRTA"
      00A13C CC 88                    6 	.word PRTA_IDX 
      0024A4                       6398 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A13E F9 85                    1 	.word LINK 
                           0024A6     2 	LINK=.
      0024A6                          3 PRINT:
      00A140 9F                       4 	.byte 5 	
      00A141 A4 0F 5F 5C 4D           5 	.ascii "PRINT"
      00A146 27 04                    6 	.word PRT_IDX 
      0024AE                       6399 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A148 58 4A                    1 	.word LINK 
                           0024B0     2 	LINK=.
      0024B0                          3 POUT:
      00A14A 20                       4 	.byte 4+F_IFUNC 	
      00A14B F9 A6 84 81              5 	.ascii "POUT"
      00A14F 00 72                    6 	.word POUT_IDX 
      0024B7                       6400 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A14F CD 90                    1 	.word LINK 
                           0024B9     2 	LINK=.
      0024B9                          3 POKE:
      00A151 8F                       4 	.byte 4 	
      00A152 A1 01 27 03              5 	.ascii "POKE"
      00A156 CC 88                    6 	.word POKE_IDX 
      0024C0                       6401 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A158 F9 85                    1 	.word LINK 
                           0024C2     2 	LINK=.
      0024C2                          3 PINP:
      00A15A 53                       4 	.byte 4+F_IFUNC 	
      00A15B A6 84 81 50              5 	.ascii "PINP"
      00A15E 00 6E                    6 	.word PINP_IDX 
      0024C9                       6402 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A15E 85 52                    1 	.word LINK 
                           0024CB     2 	LINK=.
      0024CB                          3 PEEK:
      00A160 04                       4 	.byte 4+F_IFUNC 	
      00A161 89 90 CE 00              5 	.ascii "PEEK"
      00A165 05 17                    6 	.word PEEK_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0024D2                       6403 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A167 03 90                    1 	.word LINK 
                           0024D4     2 	LINK=.
      0024D4                          3 PMODE:
      00A169 CE                       4 	.byte 5 	
      00A16A 00 01 17 05 72           5 	.ascii "PMODE"
      00A16F 5C 00                    6 	.word PMODE_IDX 
      0024DC                       6404 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A171 21 81                    1 	.word LINK 
                           0024DE     2 	LINK=.
      00A173                          3 PAUSE:
      00A173 72                       4 	.byte 5 	
      00A174 5D 00 21 26 03           5 	.ascii "PAUSE"
      00A179 CC 88                    6 	.word PAUSE_IDX 
      0024E6                       6405 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A17B F9 DE                    1 	.word LINK 
                           0024E8     2 	LINK=.
      00A17C                          3 PAD:
      00A17C CD                       4 	.byte 3+F_IFUNC 	
      00A17D 91 D6 A1                 5 	.ascii "PAD"
      00A180 84 27                    6 	.word PAD_IDX 
      0024EE                       6406 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A182 03 CC                    1 	.word LINK 
                           0024F0     2 	LINK=.
      0024F0                          3 OR:
      00A184 88                       4 	.byte 2+F_IFUNC 	
      00A185 F9 52                    5 	.ascii "OR"
      00A186 00 64                    6 	.word OR_IDX 
      0024F5                       6407 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A186 5D 26                    1 	.word LINK 
                           0024F7     2 	LINK=.
      0024F7                          3 ODR:
      00A188 10                       4 	.byte 3+F_IFUNC 	
      00A189 1E 03 CF                 5 	.ascii "ODR"
      00A18C 00 05                    6 	.word ODR_IDX 
      0024FD                       6408 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A18E E6 02                    1 	.word LINK 
                           0024FF     2 	LINK=.
      0024FF                          3 NOT:
      00A190 C7                       4 	.byte 3+F_IFUNC 	
      00A191 00 04 1E                 5 	.ascii "NOT"
      00A194 05 CF                    6 	.word NOT_IDX 
      002505                       6409 	_dict_entry,3,NEW,NEW_IDX;new
      00A196 00 01                    1 	.word LINK 
                           002507     2 	LINK=.
      002507                          3 NEW:
      00A198 81                       4 	.byte 3 	
      00A199 4E 45 57                 5 	.ascii "NEW"
      00A199 85 5B                    6 	.word NEW_IDX 
      00250D                       6410 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A19B 04 72                    1 	.word LINK 
                           00250F     2 	LINK=.
      00250F                          3 NEXT:
      00A19D 5A                       4 	.byte 4 	
      00A19E 00 21 FC 54              5 	.ascii "NEXT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1A1 00 5C                    6 	.word NEXT_IDX 
      002516                       6411 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A1A1 AE 00                    1 	.word LINK 
                           002518     2 	LINK=.
      002518                          3 MULDIV:
      00A1A3 00                       4 	.byte 6+F_IFUNC 	
      00A1A4 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A1A7 00 5A                    6 	.word MULDIV_IDX 
      002521                       6412 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A1A7 AE 00                    1 	.word LINK 
                           002523     2 	LINK=.
      002523                          3 LSHIFT:
      00A1A9 01                       4 	.byte 6+F_IFUNC 	
      00A1AA A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A1AD 00 58                    6 	.word LSHIFT_IDX 
      00252C                       6413 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A1AD AE 00                    1 	.word LINK 
                           00252E     2 	LINK=.
      00252E                          3 LOG:
      00A1AF 02                       4 	.byte 3+F_IFUNC 	
      00A1B0 A6 84 81                 5 	.ascii "LOG"
      00A1B3 00 56                    6 	.word LOG_IDX 
      002534                       6414 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A1B3 AE 00                    1 	.word LINK 
                           002536     2 	LINK=.
      002536                          3 LOAD:
      00A1B5 03                       4 	.byte 4 	
      00A1B6 A6 84 81 44              5 	.ascii "LOAD"
      00A1B9 00 54                    6 	.word LOAD_IDX 
      00253D                       6415 	_dict_entry 4,LIST,LIST_IDX;list
      00A1B9 AE 00                    1 	.word LINK 
                           00253F     2 	LINK=.
      00253F                          3 LIST:
      00A1BB 04                       4 	.byte 4 	
      00A1BC A6 84 81 54              5 	.ascii "LIST"
      00A1BF 00 52                    6 	.word LIST_IDX 
      002546                       6416 	_dict_entry 3,LET,LET_IDX;let 
      00A1BF AE 00                    1 	.word LINK 
                           002548     2 	LINK=.
      002548                          3 LET:
      00A1C1 05                       4 	.byte 3 	
      00A1C2 A6 84 81                 5 	.ascii "LET"
      00A1C5 00 50                    6 	.word LET_IDX 
      00254E                       6417 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A1C5 AE 00                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 KEY:
      00A1C7 06                       4 	.byte 3+F_IFUNC 	
      00A1C8 A6 84 81                 5 	.ascii "KEY"
      00A1CB 00 4E                    6 	.word KEY_IDX 
      002556                       6418 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A1CB AE 00                    1 	.word LINK 
                           002558     2 	LINK=.
      002558                          3 IWDGREF:
      00A1CD 07                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1CE A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1D1 00 4C                    6 	.word IWDGREF_IDX 
      002562                       6419 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A1D1 AE 00                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 IWDGEN:
      00A1D3 08                       4 	.byte 6 	
      00A1D4 A6 84 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1D7 00 4A                    6 	.word IWDGEN_IDX 
      00256D                       6420 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A1D7 A6 84                    1 	.word LINK 
                           00256F     2 	LINK=.
      00256F                          3 INVERT:
      00A1D9 AE                       4 	.byte 6+F_IFUNC 	
      00A1DA 00 00 81 45 52 54        5 	.ascii "INVERT"
      00A1DD 00 48                    6 	.word INVERT_IDX 
      002578                       6421 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A1DD A6 84                    1 	.word LINK 
                           00257A     2 	LINK=.
      00257A                          3 INPUT:
      00A1DF AE                       4 	.byte 5 	
      00A1E0 00 01 81 55 54           5 	.ascii "INPUT"
      00A1E3 00 46                    6 	.word INPUT_IDX 
      002582                       6422 	_dict_entry,2,IF,IF_IDX;if 
      00A1E3 A6 84                    1 	.word LINK 
                           002584     2 	LINK=.
      002584                          3 IF:
      00A1E5 AE                       4 	.byte 2 	
      00A1E6 00 02                    5 	.ascii "IF"
      00A1E8 81 44                    6 	.word IF_IDX 
      00A1E9                       6423 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A1E9 A6 84                    1 	.word LINK 
                           00258B     2 	LINK=.
      00258B                          3 IDR:
      00A1EB AE                       4 	.byte 3+F_IFUNC 	
      00A1EC 00 03 81                 5 	.ascii "IDR"
      00A1EF 00 42                    6 	.word IDR_IDX 
      002591                       6424 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A1EF A6 84                    1 	.word LINK 
                           002593     2 	LINK=.
      002593                          3 HEX:
      00A1F1 AE                       4 	.byte 3 	
      00A1F2 00 04 81                 5 	.ascii "HEX"
      00A1F5 00 40                    6 	.word HEX_IDX 
      002599                       6425 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A1F5 A6 84                    1 	.word LINK 
                           00259B     2 	LINK=.
      00259B                          3 GPIO:
      00A1F7 AE                       4 	.byte 4+F_IFUNC 	
      00A1F8 00 01 81 4F              5 	.ascii "GPIO"
      00A1FB 00 3E                    6 	.word GPIO_IDX 
      0025A2                       6426 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A1FB A6 84                    1 	.word LINK 
                           0025A4     2 	LINK=.
      0025A4                          3 GOTO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A1FD AE                       4 	.byte 4 	
      00A1FE 00 00 81 4F              5 	.ascii "GOTO"
      00A201 00 3C                    6 	.word GOTO_IDX 
      0025AB                       6427 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A201 A6 84                    1 	.word LINK 
                           0025AD     2 	LINK=.
      0025AD                          3 GOSUB:
      00A203 AE                       4 	.byte 5 	
      00A204 40 00 81 55 42           5 	.ascii "GOSUB"
      00A207 00 3A                    6 	.word GOSUB_IDX 
      0025B5                       6428 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A207 55 00                    1 	.word LINK 
                           0025B7     2 	LINK=.
      0025B7                          3 FORGET:
      00A209 04                       4 	.byte 6 	
      00A20A 00 02 81 47 45 54        5 	.ascii "FORGET"
      00A20D 00 38                    6 	.word FORGET_IDX 
      0025C0                       6429 	_dict_entry,3,FOR,FOR_IDX;for 
      00A20D CD 91                    1 	.word LINK 
                           0025C2     2 	LINK=.
      0025C2                          3 FOR:
      00A20F 8D                       4 	.byte 3 	
      00A210 A1 84 27                 5 	.ascii "FOR"
      00A213 03 CC                    6 	.word FOR_IDX 
      0025C8                       6430 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A215 88 F9                    1 	.word LINK 
                           0025CA     2 	LINK=.
      0025CA                          3 FCPU:
      00A217 CD                       4 	.byte 4 	
      00A218 84 82 5D 26              5 	.ascii "FCPU"
      00A21C 05 A6                    6 	.word FCPU_IDX 
      0025D1                       6431 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A21E 05 CC                    1 	.word LINK 
                           0025D3     2 	LINK=.
      0025D3                          3 EEPROM:
      00A220 88                       4 	.byte 6+F_IFUNC 	
      00A221 FB 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A222 00 32                    6 	.word EEPROM_IDX 
      0025DC                       6432 	_dict_entry,3,END,END_IDX;cmd_end  
      00A222 90 93                    1 	.word LINK 
                           0025DE     2 	LINK=.
      0025DE                          3 END:
      00A224 EE                       4 	.byte 3 	
      00A225 04 A3 A2                 5 	.ascii "END"
      00A228 07 26                    6 	.word END_IDX 
      0025E4                       6433 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A22A F2 90                    1 	.word LINK 
                           0025E6     2 	LINK=.
      0025E6                          3 DWRITE:
      00A22C CF                       4 	.byte 6+F_CMD 	
      00A22D 00 07 90 E6 02 C7        5 	.ascii "DWRITE"
      00A233 00 0A                    6 	.word DWRITE_IDX 
      0025EF                       6434 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A235 35 06                    1 	.word LINK 
                           0025F1     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0025F1                          3 DREAD:
      00A237 00                       4 	.byte 5+F_IFUNC 	
      00A238 09 81 45 41 44           5 	.ascii "DREAD"
      00A23A 00 2C                    6 	.word DREAD_IDX 
      0025F9                       6435 	_dict_entry,2,DO,DO_IDX;do_loop
      00A23A 72 5F                    1 	.word LINK 
                           0025FB     2 	LINK=.
      0025FB                          3 DO:
      00A23C 00                       4 	.byte 2 	
      00A23D 07 72                    5 	.ascii "DO"
      00A23F 5F 00                    6 	.word DO_IDX 
      002600                       6436 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A241 08 72                    1 	.word LINK 
                           002602     2 	LINK=.
      002602                          3 DIR:
      00A243 5F                       4 	.byte 3 	
      00A244 00 09 72                 5 	.ascii "DIR"
      00A247 5F 00                    6 	.word DIR_IDX 
      002608                       6437 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A249 0A CE                    1 	.word LINK 
                           00260A     2 	LINK=.
      00260A                          3 DEC:
      00A24B 00                       4 	.byte 3 	
      00A24C 1D 45 43                 5 	.ascii "DEC"
      00A24D 00 26                    6 	.word DEC_IDX 
      002610                       6438 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A24D C3 00                    1 	.word LINK 
                           002612     2 	LINK=.
      002612                          3 DDR:
      00A24F 1F                       4 	.byte 3+F_IFUNC 	
      00A250 24 17 90                 5 	.ascii "DDR"
      00A253 93 EE                    6 	.word DDR_IDX 
      002618                       6439 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A255 04 A3                    1 	.word LINK 
                           00261A     2 	LINK=.
      00261A                          3 DATALN:
      00A257 A2                       4 	.byte 6 	
      00A258 07 26 1A 90 CF 00        5 	.ascii "DATALN"
      00A25E 07 90                    6 	.word DATALN_IDX 
      002623                       6440 	_dict_entry,4,DATA,DATA_IDX;data  
      00A260 E6 02                    1 	.word LINK 
                           002625     2 	LINK=.
      002625                          3 DATA:
      00A262 C7                       4 	.byte 4 	
      00A263 00 0A 35 06              5 	.ascii "DATA"
      00A267 00 09                    6 	.word DATA_IDX 
      00262C                       6441 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A269 72 5D                    1 	.word LINK 
                           00262E     2 	LINK=.
      00262E                          3 CRL:
      00A26B 00                       4 	.byte 3+F_IFUNC 	
      00A26C 0A 26 05                 5 	.ascii "CRL"
      00A26F A6 0C                    6 	.word CRL_IDX 
      002634                       6442 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A271 CC 88                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002636     2 	LINK=.
      002636                          3 CRH:
      00A273 FB                       4 	.byte 3+F_IFUNC 	
      00A274 81 52 48                 5 	.ascii "CRH"
      00A275 00 1C                    6 	.word CRH_IDX 
      00263C                       6443 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A275 93 E6                    1 	.word LINK 
                           00263E     2 	LINK=.
      00263E                          3 CHAR:
      00A277 02                       4 	.byte 4+F_CFUNC 	
      00A278 C7 00 0E 72              5 	.ascii "CHAR"
      00A27C 5F 00                    6 	.word CHAR_IDX 
      002645                       6444 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A27E 0D 72                    1 	.word LINK 
                           002647     2 	LINK=.
      002647                          3 BYE:
      00A280 BB                       4 	.byte 3 	
      00A281 00 0D 20                 5 	.ascii "BYE"
      00A284 C8 18                    6 	.word BYE_IDX 
      00A285                       6445 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A285 52 06                    1 	.word LINK 
                           00264F     2 	LINK=.
      00A287                          3 BTOGL:
      00A287 C6                       4 	.byte 5 	
      00A288 00 09 C1 00 0A           5 	.ascii "BTOGL"
      00A28D 27 37                    6 	.word BTOGL_IDX 
      002657                       6446 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A28F CD 95                    1 	.word LINK 
                           002659     2 	LINK=.
      002659                          3 BTEST:
      00A291 EB                       4 	.byte 5+F_IFUNC 	
      00A292 CE 00 07 CF 00           5 	.ascii "BTEST"
      00A297 05 55                    6 	.word BTEST_IDX 
      002661                       6447 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A299 00 09                    1 	.word LINK 
                           002663     2 	LINK=.
      002663                          3 BSET:
      00A29B 00                       4 	.byte 4 	
      00A29C 02 55 00 0A              5 	.ascii "BSET"
      00A2A0 00 04                    6 	.word BSET_IDX 
      00266A                       6448 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A2A2 CD 91                    1 	.word LINK 
                           00266C     2 	LINK=.
      00266C                          3 BRES:
      00A2A4 8D                       4 	.byte 4 	
      00A2A5 A1 84 27 03              5 	.ascii "BRES"
      00A2A9 CC 88                    6 	.word BRES_IDX 
      002673                       6449 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A2AB F9 6C                    1 	.word LINK 
                           002675     2 	LINK=.
      00A2AC                          3 BIT:
      00A2AC 1F                       4 	.byte 3+F_IFUNC 	
      00A2AD 05 CD 89                 5 	.ascii "BIT"
      00A2B0 EB CE                    6 	.word BIT_IDX 
      00267B                       6450 	_dict_entry,3,AWU,AWU_IDX;awu 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A2B2 00 05                    1 	.word LINK 
                           00267D     2 	LINK=.
      00267D                          3 AWU:
      00A2B4 CF                       4 	.byte 3 	
      00A2B5 00 07 55                 5 	.ascii "AWU"
      00A2B8 00 02                    6 	.word AWU_IDX 
      002683                       6451 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A2BA 00 09                    1 	.word LINK 
                           002685     2 	LINK=.
      002685                          3 AUTORUN:
      00A2BC CD                       4 	.byte 7 	
      00A2BD 95 FB 1E 05 A6 84 5B     5 	.ascii "AUTORUN"
      00A2C4 06 81                    6 	.word AUTORUN_IDX 
      00A2C6                       6452 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A2C6 90 CE                    1 	.word LINK 
                           002691     2 	LINK=.
      002691                          3 ASC:
      00A2C8 00                       4 	.byte 3+F_IFUNC 	
      00A2C9 07 72 5F                 5 	.ascii "ASC"
      00A2CC 00 07                    6 	.word ASC_IDX 
      002697                       6453 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A2CE 72 5F                    1 	.word LINK 
                           002699     2 	LINK=.
      002699                          3 AND:
      00A2D0 00                       4 	.byte 3+F_IFUNC 	
      00A2D1 08 72 5F                 5 	.ascii "AND"
      00A2D4 00 09                    6 	.word AND_IDX 
      00269F                       6454 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A2D6 72 5F                    1 	.word LINK 
                           0026A1     2 	LINK=.
      0026A1                          3 ADCREAD:
      00A2D8 00                       4 	.byte 7+F_IFUNC 	
      00A2D9 0A CD A2 75 20 A8 44     5 	.ascii "ADCREAD"
      00A2DF 00 04                    6 	.word ADCREAD_IDX 
      0026AB                       6455 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A2DF CD 90                    1 	.word LINK 
                           0026AD     2 	LINK=.
      0026AD                          3 ADCON:
      00A2E1 94                       4 	.byte 5 	
      00A2E2 A1 02 27 03 CC           5 	.ascii "ADCON"
      00A2E7 88 F9                    6 	.word ADCON_IDX 
      00A2E9                       6456 kword_dict:
      0026B5                       6457 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A2E9 72 12                    1 	.word LINK 
                           0026B7     2 	LINK=.
      0026B7                          3 ABS:
      00A2EB 50                       4 	.byte 3+F_IFUNC 	
      00A2EC C7 85 5D                 5 	.ascii "ABS"
      00A2EF 27 21                    6 	.word ABS_IDX 
                                   6458 
                                   6459 ;comands and fonctions address table 	
      0026BD                       6460 code_addr:
      00A2F1 85 A6 08 42 9F C7 52  6461 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             00 72 1A 50 14 72 1A
             50 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A301 72 14 52 00 72 12 52  6462 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             01 72 10 52 01 72 1C
      00A30F 52 00 81 87 21 8D 21  6463 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             63 11 F7 1C 40 20 DE
             19 04 19 34
      00A312 18 40 21 81 1E EC 16  6464 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             AE 1B D9 17 A9 17 8E
             1D 40
      00A312 5B 02 A6 82 C4 52 03  6465 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             A1 02 26 F7 72 1D 52
             00 72
      00A322 13 50 C7 72 1B 50 16  6466 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             81 1E BA 0F 67 17 2E
             19 BB
      00A32A 20 52 21 57 1E 8A 23  6467 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             16 1D FC 1E F8 16 89
             21 7B
      00A32A A6 78 C5 52 03 27 04  6468 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             72 5F 52 03 81 21 33
             21 39
      00A336 21 3F 21 45 21 4B 21  6469 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             51 1D 33 22 05 05 D6
             15 F7
      00A336 88 CD A3 2A 84 72 03  6470 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             52 03 FB C7 52 04 72
             01 52
      00A346 03 FB C6 52 04 81 22  6471 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             FF 22 D7 17 07 19 6F
             1E 58
      00A34C 20 36 20 45 16 D7 18  6472 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             50 12 06 1D 6A 20 F3
             1D 70
      00A34C A6 FF 72 01 52 03 E3  6473 	.word wait,words,write,bit_xor ; 96..103 
             C6
      00A354 52 04                 6474 	.word 0 
                                   6475 
      002800                       6476 	.bndry 128 ; align on FLASH block.
                                   6477 ; free space for user application  
      002800                       6478 user_space:
                                   6479 ; USR() function test
      00A356 81               [ 2] 6480 	pushw x 
      00A357 72 1A 50 0A      [ 1] 6481 	bset PC_ODR,#5 
      00A357 CD               [ 2] 6482 	popw x 
      00A358 91 8D A1         [ 4] 6483 	call pause02 
      00A35B 84 27 03 CC      [ 1] 6484 	bres PC_ODR,#5 
      00A35F 88               [ 4] 6485 	ret
                                   6486 
                                   6487 	.area FLASH_DRIVE (ABS)
      010000                       6488 	.org 0x10000
      010000                       6489 fdrive:
                                   6490 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026B7 R   |     ABS_IDX =  000000 
    ACK     =  000006     |   5 ADCON      0026AD R   |     ADCON_ID=  000002 
  5 ADCREAD    0026A1 R   |     ADCREAD_=  000004     |     ADC_CR1 =  005401 
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
    AND_IDX =  000006     |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        002691 R   |     ASC_IDX =  000008     |     ATTRIB  =  000002 
  5 AUTORUN    002685 R   |     AUTORUN_=  00000A     |     AUTORUN_=  004000 
  5 AWU        00267D R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
    BINARY  =  000001     |   5 BIT        002675 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000E     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       00266C R   |     BRES_IDX=  000010     |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       002663 R   |     BSET_IDX=  000012 
    BSIZE   =  000001     |   5 BTEST      002659 R   |     BTEST_ID=  000014 
  5 BTOGL      00264F R   |     BTOGL_ID=  000016     |     BTW     =  000001 
  5 BYE        002647 R   |     BYE_IDX =  000018     |     C       =  000001 
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
  5 CHAR       00263E R   |     CHAR_IDX=  00001A     |     CLKOPT  =  004807 
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002636 R
    CRH_IDX =  00001C     |   5 CRL        00262E R   |     CRL_IDX =  00001E 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       002625 R
  5 DATALN     00261A R   |     DATALN_I=  000022     |     DATA_IDX=  000020 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |     DBL     =  000003     |     DBLDIVDN=  000006 
    DBLHI   =  000001     |     DBLLO   =  000003     |     DBL_SIZE=  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        002612 R   |     DDR_IDX =  000024 
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
    DEBUG_PR=  000001     |   5 DEC        00260A R   |     DEC_IDX =  000026 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002602 R   |     DIR_IDX =  000028     |     DIVDNDHI=  00000B 
    DIVDNDLO=  00000D     |     DIVISOR =  000001     |     DIVISR  =  000007 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0025FB R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  00002A     |   5 DREAD      0025F1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    DREAD_ID=  00002C     |   5 DWRITE     0025E6 R   |     DWRITE_I=  00002E 
  5 EEPROM     0025D3 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  000032     |     EEPROM_S=  000800     |     EM      =  000019 
  5 END        0025DE R   |     END_IDX =  000030     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0025CA R
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        0025C2 R
  5 FORGET     0025B7 R   |     FORGET_I=  000038     |     FOR_IDX =  000036 
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      0025AD R   |     GOSUB_ID=  00003A 
  5 GOTO       0025A4 R   |     GOTO_IDX=  00003C     |   5 GPIO       00259B R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003E 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002593 R   |     HEX_IDX =  000040     |     HSECNT  =  004809 
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
  5 IDR        00258B R   |     IDR_IDX =  000042     |   5 IF         002584 R
    IF_IDX  =  000044     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00257A R   |     INPUT_DI=  000000 
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     00256F R
    INVERT_I=  000048     |     INW     =  000009     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   5 IWDGEN     002564 R   |     IWDGEN_I=  00004A 
  5 IWDGREF    002558 R   |     IWDGREF_=  00004C     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        002550 R
    KEY_IDX =  00004E     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   5 LET        002548 R   |     LET_IDX =  000050 
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  0026B7 R   |   5 LIST       00253F R   |     LIST_IDX=  000052 
    LL      =  000001     |     LLEN    =  000002     |     LN_PTR  =  000005 
  5 LOAD       002536 R   |     LOAD_IDX=  000054     |   5 LOG        00252E R
    LOG_IDX =  000056     |   5 LSHIFT     002523 R   |     LSHIFT_I=  000058 
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   5 MULDIV     002518 R
    MULDIV_I=  00005A     |     MULOP   =  000003     |     N1      =  000001 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        002507 R
    NEW_FREE=  000001     |     NEW_IDX =  00005E     |   5 NEXT       00250F R
    NEXT_IDX=  00005C     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

  5 NOT        0024FF R   |     NOT_IDX =  000060     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0024F7 R   |     ODR_IDX =  000062     |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024F0 R
    OR_IDX  =  000064     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
  5 PAD        0024E8 R   |     PAD_IDX =  000066     |     PAD_SIZE=  000080 
  5 PAUSE      0024DE R   |     PAUSE_ID=  000068     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0024CB R   |     PEEK_IDX=  00006C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       0024C2 R   |     PINP_IDX=  00006E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 PMODE      0024D4 R   |     PMODE_ID=  00006A 
  5 POKE       0024B9 R   |     POKE_IDX=  000070     |     PORT    =  000003 
  5 POUT       0024B0 R   |     POUT_IDX=  000072     |     PREV    =  000001 
  5 PRINT      0024A6 R   |   5 PRTA       00249D R   |     PRTA_IDX=  000076 
  5 PRTB       002494 R   |     PRTB_IDX=  000078     |   5 PRTC       00248B R
    PRTC_IDX=  00007A     |   5 PRTD       002482 R   |     PRTD_IDX=  00007C 
  5 PRTE       002479 R   |     PRTE_IDX=  00007E     |   5 PRTF       002470 R
    PRTF_IDX=  000080     |   5 PRTG       002467 R   |     PRTG_IDX=  000082 
  5 PRTH       00245E R   |     PRTH_IDX=  000084     |   5 PRTI       002455 R
    PRTI_IDX=  000086     |     PRT_IDX =  000074     |     PSTR    =  000003 
  5 QKEY       00244C R   |     QKEY_IDX=  000088     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |     RBT_IDX =  00008C 
  5 READ       002443 R   |     READ_IDX=  00008A     |   5 REBOOT     002438 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     00242D R
    REM_IDX =  00008E     |   5 RESTORE    002421 R   |     REST_IDX=  000090 
    RETL1   =  000001     |   5 RETURN     002416 R   |     RET_ADDR=  000003 
    RET_IDX =  000092     |     RET_INW =  000005     |   5 RND        00240E R
    RND_IDX =  000094     |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     002403 R   |     RSHIFT_I=  000096     |     RST_SR  =  0050B3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

  5 RUN        0023FB R   |     RUN_IDX =  000098     |     RX_QUEUE=  000008 
  5 SAVE       0023F2 R   |     SAVE_IDX=  00009A     |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023E9 R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       0023E0 R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      0023D6 R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0023C2 R   |     SPIEN_ID=  0000A4     |   5 SPIRD      0023CC R
    SPIRD_ID=  0000A2     |   5 SPISEL     0023B7 R   |     SPISEL_I=  0000A6 
  5 SPIWR      0023AD R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       0023A4 R
    STEP_IDX=  0000AA     |   5 STOP       00239B R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002391 R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
  5 TIMEOUT    00237B R   |   5 TIMER      002387 R   |     TIMER_ID=  0000B0 
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
    TMROUT_I=  0000B2     |   5 TO         002374 R   |   5 TONE       00236B R
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
    UBC     =  004801     |   5 UBOUND     002360 R   |     UBOUND_I=  0000B8 
  5 UBTN_Han   000092 R   |   5 UFLASH     002355 R   |     UFLASH_I=  0000BA 
  5 UNTIL      00234B R   |     UNTIL_ID=  0000BC     |     US      =  00001F 
  5 USER_ABO   00009A R   |   5 USR        002343 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |     USR_IDX =  0000BE 
  5 Uart1RxH   00000F R   |   5 UserButt   000065 R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       00233A R   |     WAIT_IDX=  0000C0     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      002330 R   |     WORDS_ID=  0000C2 
  5 WRITE      002326 R   |     WRITE_ID=  0000C4     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        00231E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    XOR_IDX =  0000C6     |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        001E5E R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   0014BA R
  5 add_spac   0012E4 R   |   5 analog_r   0018D0 R   |   5 arduino_   001F49 R
  5 arg_list   001014 R   |   1 array_si   000021 R   |   5 ascii      001D0B R
  5 at_tst     000CA6 R   |   5 atoi24     000DB7 GR  |   5 atoi_exi   000E1D R
  5 autorun    001D96 R   |   5 autorun_   0006D0 R   |   5 awu        001E0F R
  5 awu02      001E19 R   |   5 bad_port   001D65 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       00185D R   |   5 beep_1kh   001847 GR
  5 bin_exit   000B84 R   |   5 bit_and    001E72 R   |   5 bit_or     001E8A R
  5 bit_rese   001632 R   |   5 bit_set    001622 R   |   5 bit_test   001653 R
  5 bit_togg   001643 R   |   5 bit_xor    001EA2 R   |   5 bitmask    0020B5 R
  5 bkslsh_t   000C53 R   |   5 block_er   0001BB R   |   5 break_po   00199D R
  5 bye        001D8D R   |   5 cancel_a   000698 R   |   5 char       001CF9 R
  5 clear_ba   0006E5 R   |   5 clear_va   00055F R   |   5 clock_in   0000B5 R
  5 cmd_end    001840 R   |   5 cmd_line   000903 R   |   5 cmd_name   000F83 R
  5 cmp_name   001A3E R   |   5 code_add   0026BD R   |   5 cold_sta   0005D6 R
  5 colon_ts   000C7A R   |   5 comma_ts   000C85 R   |   5 comp_msg   000859 R
  5 compile    0004EC R   |   5 const_cr   002169 R   |   5 const_cr   00216F R
  5 const_dd   002163 R   |   5 const_ee   002181 R   |   5 const_id   00215D R
  5 const_in   00217B R   |   5 const_od   002157 R   |   5 const_ou   002175 R
  5 const_po   002121 R   |   5 const_po   002127 R   |   5 const_po   00212D R
  5 const_po   002133 R   |   5 const_po   002139 R   |   5 const_po   00213F R
  5 const_po   002145 R   |   5 const_po   00214B R   |   5 const_po   002151 R
  5 convert_   000AFB R   |   5 copy_com   000CDB R   |   1 count      000003 GR
  5 cp_loop    000FC3 R   |   5 cpy_cmd_   0012CF R   |   5 cpy_quot   001308 R
  5 create_g   000453 R   |   5 cs_high    002311 R   |   5 cstk_pro   0011CB R
  5 dash_tst   000C9B R   |   5 data       002187 R   |   1 data_len   000009 R
  5 data_lin   00218D R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   0021CD R   |   5 dbl_sign   000EEB R   |   5 dec_base   0011F7 R
  5 decomp_l   0013B9 R   |   5 decompil   001372 GR  |   5 del_line   000426 R
  5 digital_   001904 R   |   5 digital_   001934 R   |   5 dir_loop   001C4C R
  5 director   001C40 R   |   5 disk_fre   001A2B R   |   5 div32_16   000EF5 R
  5 divide     000F4C R   |   5 divu24_8   000A3E R   |   5 dneg       000EE0 R
  5 do_loop    0020DE R   |   5 do_progr   0001AE R   |   5 drive_fr   001CB5 R
  5 enable_i   00205F R   |   5 eql_tst    000D30 R   |   5 equal      0014CD R
  5 erase_fl   0001DA R   |   5 err_bad_   0007C5 R   |   5 err_buf_   00083B R
  5 err_cmd_   000789 R   |   5 err_div0   00074E R   |   5 err_dupl   0007A3 R
  5 err_math   000735 R   |   5 err_mem_   00071A R   |   5 err_msg    0006FA R
  5 err_no_a   0007D1 R   |   5 err_no_d   000804 R   |   5 err_no_f   000828 R
  5 err_no_l   00075D R   |   5 err_no_p   000814 R   |   5 err_not_   0007B4 R
  5 err_run_   000773 R   |   5 err_synt   000727 R   |   5 escaped    000B10 R
  5 expect     001002 R   |   5 expr_exi   001153 R   |   5 expressi   00110D R
  5 factor     001064 R   |   1 farptr     000016 R   |   5 fcpu       001EEC R
  7 fdrive     010000 R   |   1 ffree      000019 R   |   5 file_cou   001CAD R
  5 first_li   00127C R   |   1 flags      000023 R   |   5 for        0016AE R
  5 forget     001BD9 R   |   1 free_ram   000063 R   |   5 func_arg   00100F R
  5 func_not   002052 R   |   5 ge         0014CF R   |   5 get_arra   00103F R
  5 get_cmd_   001351 R   |   5 get_targ   001778 R   |   5 get_tick   001E58 R
  5 get_toke   000BEC R   |   5 getc       0002C9 GR  |   5 gosub      0017A9 R
  5 goto       00178E R   |   5 gpio       001D40 R   |   5 gt         0014CB R
  5 gt_tst     000D3B R   |   5 hex_base   0011F2 R   |   5 hex_dump   000359 R
  5 if         00169A R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   0019EB R   |   5 input_ex   0015F4 R
  5 input_lo   00158D R   |   5 input_va   00158B R   |   5 insert_l   00047F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 insert_l   0004E9 R   |   5 interp_l   000944 R   |   5 interpre   00091F R
  5 invert     0020CF R   |   5 is_alnum   000587 R   |   5 is_alpha   00056D R
  5 is_digit   00057E R   |   5 itoa       0009E4 R   |   5 itoa_loo   000A03 R
  5 jp_to_ta   00179C R   |   5 key        001D2B R   |   5 kw_loop    000BA0 R
  5 kword_di   0026B5 R   |   5 kword_en   00231C R   |   5 le         0014D4 R
  5 leading_   0020A5 R   |   5 let        001228 R   |   5 let_arra   001236 R
  5 let_var    001239 R   |   5 lines_sk   00127F R   |   5 list       001253 R
  5 list_exi   0012C1 R   |   5 list_loo   00129F R   |   5 load       001BA9 R
  5 load_aut   0006A7 R   |   5 load_fil   001B78 R   |   5 log2       00209A R
  5 logical_   002048 R   |   5 long_div   000EC8 R   |   5 loop_bac   00175B R
  1 loop_dep   000020 R   |   5 loop_don   001770 R   |   5 lshift     001EBA R
  5 lt         0014D2 R   |   5 lt_tst     000D64 R   |   5 modulo     000F62 R
  5 move       0003C0 GR  |   5 move_dow   0003DE R   |   5 move_era   000140 R
  5 move_exi   0003FF R   |   5 move_loo   0003E3 R   |   5 move_prg   000174 R
  5 move_up    0003D0 R   |   5 mul_char   0014BC R   |   5 muldiv     000F67 R
  5 multiply   000E93 R   |   5 mulu24_8   000A66 R   |   5 nbr_tst    000C1F R
  5 ne         0014D7 R   |   5 neg_acc2   000AA0 R   |   5 new        0019BB R
  5 next       00172E R   |   5 next_lin   000927 R   |   5 next_tok   00096B R
  5 no_match   000FD5 R   |   5 other      000D8D R   |   3 pad        0016E0 R
  5 pad_ref    002316 R   |   5 parse_bi   000B62 R   |   5 parse_in   000B18 R
  5 parse_ke   000B9F R   |   5 parse_qu   000AC3 R   |   5 pause      001DFC R
  5 pause02    001E06 R   |   5 peek       001689 R   |   5 pin_mode   001EF8 R
  5 plus_tst   000D04 R   |   5 poke       00167A R   |   5 power_ad   001894 R
  5 prcnt_ts   000D25 R   |   5 print      0014FA R   |   5 print_ex   00155F R
  5 print_in   0009C8 R   |   5 printxy    000E34 R   |   5 program_   000154 R
  5 program_   000174 R   |   5 prt_basi   0014DA R   |   5 prt_loop   0014FE R
  5 prt_tok    0002EB R   |   5 prti24     0009D8 R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0002C0 GR  |     puts       ****** GX
  5 qkey       001D33 GR  |   5 qmark_ts   000CB1 R   |   5 random     001F69 R
  5 read       002205 R   |   5 read01     002207 R   |     readln     ****** GX
  5 refresh_   002095 R   |   5 rel_exit   0011AE R   |   5 relation   001156 R
  5 relop_st   0014BF R   |   5 remark     0015F7 R   |   5 reset_co   0014FC R
  5 rest_con   00157B R   |   5 restore    0021BA R   |   5 return     0017C9 R
  5 right_al   0012F6 R   |   5 row_alig   0019D0 R   |   5 row_eras   000119 R
  5 row_eras   000140 R   |   5 row_loop   00033C R   |   5 rparnt_t   000C6F R
  5 rshift     001ED3 R   |   5 rt_msg     000848 R   |   5 run        0017E7 R
  5 run_it     001819 R   |   1 rx_head    00002D R   |   1 rx_queue   000025 R
  1 rx_tail    00002E R   |   5 save       001AAC R   |   5 save_con   00156B R
  5 search_d   000FB5 R   |   5 search_e   000FFF R   |   5 search_f   001A5F R
  5 search_l   000402 GR  |   5 search_l   00040A R   |   5 search_n   000FB9 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   0019F9 R
  5 select_p   001F39 R   |   5 set_time   002036 R   |   5 sharp_ts   000C90 R
  5 show       0011B1 R   |   5 show_row   00032A R   |   5 single_c   0014B5 R
  5 size       0011FC R   |   5 skip       000E21 R   |   5 slash_ts   000D1A R
  5 sleep      001DF1 R   |   5 software   000590 R   |     spaces     ****** GX
  5 spi_clea   0022AA R   |   5 spi_disa   002292 R   |   5 spi_enab   00225F R
  5 spi_rcv_   0022CC R   |   5 spi_read   0022F7 R   |   5 spi_sele   0022FF R
  5 spi_send   0022B6 R   |   5 spi_writ   0022D7 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D0F R   |   5 step       001707 R
  5 stop       00196F R   |   5 store_lo   00171B R   |   5 str_matc   000FE2 R
  5 str_tst    000C0F R   |   5 strcmp     0003A1 R   |   5 strcpy     0003B2 R
  5 strlen     000396 GR  |   5 syntax_e   000879 R   |   1 tab_widt   000024 R
  5 tb_error   00087B R   |   5 term       0010BE R   |   5 term01     0010C7 R
  5 term_exi   00110A R   |   3 tib        001690 GR  |   5 tick_tst   000CC9 R
  1 ticks      00000E R   |   5 timeout    002045 R   |   1 timer      000010 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 timer2_i   0000CB R   |   5 timer4_i   0000D8 R   |   5 tk_id      000869 R
  5 to         0016D7 R   |   5 to_eepro   000197 R   |   5 to_flash   0001AB R
  5 to_upper   000DAB GR  |   5 token_ch   000DA4 R   |   5 token_ex   000DA8 R
  5 token_ms   000322 R   |   5 tone       001850 R   |   5 try_next   0021F5 R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart1_in   00027D R
  5 uart1_se   00028D R   |   5 ubound     001206 R   |   5 udiv32_1   000EB6 R
  5 uflash     001D6A R   |   5 umstar     000E59 R   |   5 unlock_e   0000ED R
  5 unlock_f   000103 R   |   5 until      0020F3 R   |   5 user_int   000078 R
  5 user_spa   002800 R   |   5 usr        001D70 R   |   5 var_name   001349 R
  1 vars       00002F R   |   5 wait       0015FD R   |   5 warm_ini   00067A R
  5 warm_sta   000900 R   |   5 words      001FD0 R   |   5 words_co   002020 R
  5 write      001CC2 R   |   5 write_bl   00025A R   |   5 write_by   0001E5 R
  5 write_ee   000221 R   |   5 write_ex   000255 R   |   5 write_fl   00020B R
  5 write_ro   000188 R   |   5 zero_pad   0019C5 R

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

