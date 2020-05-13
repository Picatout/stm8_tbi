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
                           0000A0    42 	STACK_SIZE=160
                           0017FF    43 	STACK_EMPTY=RAM_SIZE-1  
                           000000    44 	FRUN=0 ; flags run code in variable flags
                           000001    45 	FTRAP=1 ; inside trap handler 
                           000002    46 	FLOOP=2 ; FOR loop in preparation 
                           000003    47 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    48 	FBREAK=4 ; break point flag 
                           000005    49 	FCOMP=5  ; compiling flags 
                           000006    50 	FAUTORUN=6; auto start program running 
                                     51 
                           004000    52 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     53 
                           000006    54     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     55 
                           007FFF    56 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     57 
                           000008    58 	RX_QUEUE_SIZE=8 
                                     59 
      000001                         60 in.w:  .blkb 1 ; parser position in text line high-byte 
      000002                         61 in:    .blkb 1 ; low byte of in.w 
      000003                         62 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         63 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         64 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         65 data_ptr:  .blkw 1  ; point to DATA address
      000009                         66 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         67 data_len:  .blkb 1  ; length of data line 
      00000B                         68 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         69 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         70 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         71 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         72 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         73 timer: .blkw 1 ;  milliseconds count down timer 
      000013                         74 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         75 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000017                         76 farptr: .blkb 1 ; 24 bits pointer used by file system, upper-byte
      000018                         77 ptr16:  .blkb 1 ; 16 bits pointer , farptr high-byte 
      000019                         78 ptr8:   .blkb 1 ; 8 bits pointer, farptr low-byte  
      00001A                         79 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         80 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      00001F                         81 txtend: .blkw 1 ; tokenized BASIC text end address 
      000021                         82 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000022                         83 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000024                         84 flags: .blkb 1 ; various boolean flags
      000025                         85 tab_width: .blkb 1 ; print colon width (default 4)
      000026                         86 rx_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         87 rx_head:  .blkb 1 ; rx_queue head pointer
      00002F                         88 rx_tail:   .blkb 1 ; rx_queue tail pointer  
      000030                         89 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     90 ; keep 'free_ram' as last variable 
      000064                         91 free_ram: ; from here RAM free for BASIC text 
                                     92 
                                     93 ;;-----------------------------------
                                     94     .area SSEG (ABS)
                                     95 ;; working buffers and stack at end of RAM. 	
                                     96 ;;-----------------------------------
      001690                         97     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                         98 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                         99 pad: .ds PAD_SIZE             ; working buffer
      001760                        100 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        101 stack_unf: ; stack underflow ; control_stack bottom 
                                    102 
                                    103 ;;--------------------------------------
                                    104     .area HOME 
                                    105 ;; interrupt vector table at 0x8000
                                    106 ;;--------------------------------------
      008000 82 00 86 58            107     int cold_start			; RESET vector 
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
      008024 82 00 80 E5            120 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008050 82 00 80 8F            131 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            132 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            133 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            134 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            135 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 CF            136 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            137 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
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
      008099 26 0B            [ 1]  179 	jrne 1$
      00809B 72 5F 00 2E      [ 1]  180 	clr rx_head 
      00809F 72 5F 00 2F      [ 1]  181 	clr rx_tail 
      0080A3 CC 80 F8         [ 2]  182 	jp user_interrupted
      0080A6                        183 1$:
      0080A6 A1 18            [ 1]  184 	cp a,#CAN ; CTRL_X 
      0080A8 26 03            [ 1]  185 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080AA CC 86 58         [ 2]  186 	jp cold_start 	
      0080AD                        187 2$: 
      0080AD A1 1A            [ 1]  188 	cp a,#CTRL_Z
      0080AF 26 06            [ 1]  189 	jrne 3$
      0080B1 CD 87 1A         [ 4]  190 	call cancel_autorun 
      0080B4 CC 86 58         [ 2]  191 	jp cold_start 
      0080B7 AE 00 26         [ 2]  192 3$:	ldw x,#rx_queue  
      0080BA 88               [ 1]  193 	push a 
      0080BB 9F               [ 1]  194 	ld a,xl 
      0080BC CB 00 2F         [ 1]  195 	add a,rx_tail 
      0080BF 97               [ 1]  196 	ld xl,a
      0080C0 84               [ 1]  197 	pop a  
      0080C1 F7               [ 1]  198 	ld (x),a
      0080C2 72 5C 00 2F      [ 1]  199 	inc rx_tail 
      0080C6 A6 07            [ 1]  200 	ld a,#RX_QUEUE_SIZE-1
      0080C8 C4 00 2F         [ 1]  201 	and a,rx_tail 
      0080CB C7 00 2F         [ 1]  202 	ld rx_tail,a  	
      0080CE 80               [11]  203 	iret 
                                    204 
                                    205 ;------------------------------------
                                    206 ; software interrupt handler  
                                    207 ;------------------------------------
                           000000   208 .if DEBUG 
                                    209 TrapHandler:
                                    210 	bset flags,#FTRAP 
                                    211 	call print_registers
                                    212 	call cmd_itf
                                    213 	bres flags,#FTRAP 	
                                    214 	iret
                                    215 .endif 
                                    216 
                                    217 ;------------------------------
                                    218 ; TIMER 4 is used to maintain 
                                    219 ; a milliseconds 'ticks' counter
                                    220 ; and decrement 'timer' varaiable
                                    221 ;--------------------------------
      0080CF                        222 Timer4UpdateHandler:
      0080CF 72 5F 53 42      [ 1]  223 	clr TIM4_SR 
      0080D3 CE 00 0F         [ 2]  224 	ldw x,ticks
      0080D6 5C               [ 2]  225 	incw x
      0080D7 CF 00 0F         [ 2]  226 	ldw ticks,x 
      0080DA CE 00 11         [ 2]  227 	ldw x,timer
      0080DD 5D               [ 2]  228 	tnzw x 
      0080DE 27 04            [ 1]  229 	jreq 1$
      0080E0 5A               [ 2]  230 	decw x 
      0080E1 CF 00 11         [ 2]  231 	ldw timer,x 
      0080E4                        232 1$:	
      0080E4 80               [11]  233 	iret 
                                    234 
                                    235 
                                    236 ;------------------------------------
                                    237 ; Triggered by pressing USER UserButton 
                                    238 ; on NUCLEO card.
                                    239 ; This is used to abort a progam lock 
                                    240 ; in infinite loop. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    241 ;------------------------------------
      0080E5                        242 UserButtonHandler:
                                    243 ; wait button release
      0080E5 5F               [ 1]  244 	clrw x
      0080E6 5A               [ 2]  245 1$: decw x 
      0080E7 26 FD            [ 1]  246 	jrne 1$
      0080E9 72 09 50 15 F8   [ 2]  247 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    248 ; if MCU suspended by SLEEP resume program
      0080EE 72 07 00 24 05   [ 2]  249     btjf flags,#FSLEEP,2$
      0080F3 72 17 00 24      [ 1]  250 	bres flags,#FSLEEP 
      0080F7 80               [11]  251 	iret
      0080F8                        252 2$:	
      0080F8                        253 user_interrupted:
      0080F8 72 00 00 24 02   [ 2]  254     btjt flags,#FRUN,4$
      0080FD 20 13            [ 2]  255 	jra UBTN_Handler_exit 
      0080FF                        256 4$:	; program interrupted by user 
      0080FF 72 11 00 24      [ 1]  257 	bres flags,#FRUN 
      008103 AE 81 1A         [ 2]  258 	ldw x,#USER_ABORT
      008106 CD A7 C0         [ 4]  259 	call puts 
      008109 CE 00 05         [ 2]  260 	ldw x,basicptr 
      00810C C6 00 02         [ 1]  261 	ld a,in 
      00810F CD 95 29         [ 4]  262 	call prt_basic_line
      008112                        263 UBTN_Handler_exit:
      008112 AE 17 FF         [ 2]  264     ldw x,#STACK_EMPTY 
      008115 94               [ 1]  265     ldw sp,x
      008116 9A               [ 1]  266 	rim 
      008117 CC 89 82         [ 2]  267 	jp warm_start
                                    268 
      00811A 0A 50 72 6F 67 72 61   269 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    270 
                                    271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    272 ;    peripherals initialization
                                    273 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    274 
                                    275 ;----------------------------------------
                                    276 ; inialize MCU clock 
                                    277 ; input:
                                    278 ;   A 		source  HSI | 1 HSE 
                                    279 ;   XL      CLK_CKDIVR , clock divisor 
                                    280 ; output:
                                    281 ;   none 
                                    282 ;----------------------------------------
      008135                        283 clock_init:	
      008135 C1 50 C3         [ 1]  284 	cp a,CLK_CMSR 
      008138 27 0C            [ 1]  285 	jreq 2$ ; no switching required 
                                    286 ; select clock source 
      00813A 72 12 50 C5      [ 1]  287 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00813E C7 50 C4         [ 1]  288 	ld CLK_SWR,a
      008141 C1 50 C3         [ 1]  289 1$:	cp a,CLK_CMSR
      008144 26 FB            [ 1]  290 	jrne 1$
      008146                        291 2$: 	
                                    292 ; HSI and cpu clock divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008146 9F               [ 1]  293 	ld a,xl 
      008147 C7 50 C6         [ 1]  294 	ld CLK_CKDIVR,a  
      00814A 81               [ 4]  295 	ret
                                    296 
                                    297 ;----------------------------------
                                    298 ; TIMER2 used as audio tone output 
                                    299 ; on port D:5.
                                    300 ; channel 1 configured as PWM mode 1 
                                    301 ;-----------------------------------  
                           00F424   302 TIM2_CLK_FREQ=62500
      00814B                        303 timer2_init:
      00814B 72 1A 50 C7      [ 1]  304 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00814F 35 60 53 05      [ 1]  305  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008153 35 08 53 0C      [ 1]  306 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008157 81               [ 4]  307 	ret 
                                    308 
                                    309 ;---------------------------------
                                    310 ; TIM4 is configured to generate an 
                                    311 ; interrupt every millisecond 
                                    312 ;----------------------------------
      008158                        313 timer4_init:
      008158 72 18 50 C7      [ 1]  314 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00815C 35 07 53 45      [ 1]  315 	mov TIM4_PSCR,#7 ; prescale 128  
      008160 35 7D 53 46      [ 1]  316 	mov TIM4_ARR,#125 ; set for 1msec.
      008164 35 05 53 40      [ 1]  317 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008168 72 10 53 41      [ 1]  318 	bset TIM4_IER,#TIM4_IER_UIE
      00816C 81               [ 4]  319 	ret
                                    320 
                                    321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    322 ;  routines to write to FLASH, EEPROM 
                                    323 ;  and OPTION 
                                    324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    325 
                                    326 ;----------------------------------
                                    327 ; unlock EEPROM/OPT for writing/erasing
                                    328 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    329 ; input:
                                    330 ;  none
                                    331 ; output:
                                    332 ;  none 
                                    333 ;----------------------------------
      00816D                        334 unlock_eeprom:
      00816D 35 00 50 5B      [ 1]  335 	mov FLASH_CR2,#0 
      008171 35 FF 50 5C      [ 1]  336 	mov FLASH_NCR2,#0xFF 
      008175 35 AE 50 64      [ 1]  337 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008179 35 56 50 64      [ 1]  338     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00817D 72 07 50 5F FB   [ 2]  339 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008182 81               [ 4]  340 	ret
                                    341 
                                    342 ;----------------------------------
                                    343 ; unlock FLASH for writing/erasing
                                    344 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    345 ; input:
                                    346 ;  none
                                    347 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    348 ;  none
                                    349 ;----------------------------------
      008183                        350 unlock_flash:
      008183 35 00 50 5B      [ 1]  351 	mov FLASH_CR2,#0 
      008187 35 FF 50 5C      [ 1]  352 	mov FLASH_NCR2,#0xFF 
      00818B 35 56 50 62      [ 1]  353 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00818F 35 AE 50 62      [ 1]  354 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008193 72 03 50 5F FB   [ 2]  355 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008198 81               [ 4]  356 	ret
                                    357 
                                    358 ;----------------------------
                                    359 ; erase block code must be 
                                    360 ; executed from RAM
                                    361 ; input:
                                    362 ;-----------------------------
      008199                        363 row_erase:
      008199 35 20 50 5B      [ 1]  364 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00819D 35 DF 50 5C      [ 1]  365 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081A1 4F               [ 1]  366 	clr a 
      0081A2 90 5F            [ 1]  367 	clrw y 
      0081A4 91 A7 00 17      [ 1]  368 	ldf ([farptr],y),a
      0081A8 90 5C            [ 2]  369     incw y
      0081AA 91 A7 00 17      [ 1]  370 	ldf ([farptr],y),a
      0081AE 90 5C            [ 2]  371     incw y
      0081B0 91 A7 00 17      [ 1]  372 	ldf ([farptr],y),a
      0081B4 90 5C            [ 2]  373     incw y
      0081B6 91 A7 00 17      [ 1]  374 	ldf ([farptr],y),a
      0081BA 72 05 50 5F FB   [ 2]  375 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081BF 81               [ 4]  376 	ret
      0081C0                        377 row_erase_end:
                                    378 
                                    379 ; copy erase_start in RAM 
      0081C0                        380 move_erase_to_ram:
      0081C0 AE 81 C0         [ 2]  381 	ldw x,#row_erase_end 
      0081C3 1D 81 99         [ 2]  382 	subw x,#row_erase
      0081C6 CF 00 0D         [ 2]  383 	ldw acc16,x 
      0081C9 AE 16 90         [ 2]  384 	ldw x,#tib 
      0081CC 90 AE 81 99      [ 2]  385 	ldw y,#row_erase 
      0081D0 CD 84 42         [ 4]  386 	call move 
      0081D3 81               [ 4]  387 	ret 
                                    388 
                                    389 ;-----------------------------------
                                    390 ; block programming must be 
                                    391 ; executed from RAM 
                                    392 ; initial contidions: 
                                    393 ; 	memory unlocked
                                    394 ;   bit PRG set in 
                                    395 ; input:
                                    396 ;   x        128 bytes row to program 
                                    397 ;   farptr   row address 
                                    398 ; output:
                                    399 ;   none 
                                    400 ;----------------------------------
                           000001   401 	BCNT=1 
      0081D4                        402 program_row:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081D4 4B 80            [ 1]  403 	push #BLOCK_SIZE  
                                    404 ;enable block programming 
      0081D6 72 10 50 5B      [ 1]  405 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081DA 72 11 50 5C      [ 1]  406 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081DE 90 5F            [ 1]  407 	clrw y 
      0081E0 F6               [ 1]  408 1$:	ld a,(x)
      0081E1 91 A7 00 17      [ 1]  409 	ldf ([farptr],y),a
      0081E5 5C               [ 2]  410 	incw x 
      0081E6 90 5C            [ 2]  411 	incw y 
      0081E8 0A 01            [ 1]  412 	dec (BCNT,sp)
      0081EA 26 F4            [ 1]  413 	jrne 1$
                                    414 ; wait EOP bit 
      0081EC 72 05 50 5F FB   [ 2]  415 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000171                        416 	_drop 1 
      0081F1 5B 01            [ 2]    1     addw sp,#1 
      0081F3 81               [ 4]  417 	ret 
      0081F4                        418 program_row_end:
                                    419 
                                    420 ;-------------------------
                                    421 ; move program_row to RAM 
                                    422 ; at txtubound address 
                                    423 ;------------------------
      0081F4                        424 move_prg_to_ram:
      0081F4 AE 81 F4         [ 2]  425 	ldw x,#program_row_end 
      0081F7 1D 81 D4         [ 2]  426 	subw x,#program_row 
      0081FA CF 00 0D         [ 2]  427 	ldw acc16,x 
      0081FD AE 16 90         [ 2]  428 	ldw x,#tib 
      008200 90 AE 81 D4      [ 2]  429 	ldw y,#program_row 
      008204 CD 84 42         [ 4]  430 	call move 
      008207 81               [ 4]  431 	ret 
                                    432 
                                    433 
                                    434 ;-----------------------------
                                    435 ; write a row in FLASH/EEPROM 
                                    436 ; input:
                                    437 ;    farptr   destination address 
                                    438 ;    x        source address 
                                    439 ;-----------------------------
      008208                        440 write_row:
      008208 89               [ 2]  441 	pushw x 
      008209 72 5D 00 17      [ 1]  442 	tnz farptr 
      00820D 26 1C            [ 1]  443 	jrne to_flash 
      00820F AE 80 00         [ 2]  444 	ldw x,#FLASH_BASE 
      008212 C3 00 18         [ 2]  445 	cpw x,farptr+1 
      008215 24 14            [ 1]  446 	jruge to_flash 
      008217                        447 to_eeprom:
      008217 AE 40 00         [ 2]  448 	ldw x,#EEPROM_BASE 
      00821A C3 00 18         [ 2]  449 	cpw x,farptr+1 
      00821D 24 01            [ 1]  450 	jruge 1$
      00821F 81               [ 4]  451 	ret ; bad address 
      008220 AE 47 FF         [ 2]  452 1$: ldw x,#EEPROM_END 
      008223 23 01            [ 2]  453 	jrule 2$ 
      008225 81               [ 4]  454 	ret ; bad address 
      008226 CD 81 6D         [ 4]  455 2$:	call unlock_eeprom
      008229 20 03            [ 2]  456 	jra do_programming
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00822B                        457 to_flash:
      00822B CD 81 83         [ 4]  458 	call unlock_flash 
      00822E                        459 do_programming:
      00822E 85               [ 2]  460 	popw x 
      00822F CD 16 90         [ 4]  461 	call tib
      008232 72 13 50 5F      [ 1]  462 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008236 72 17 50 5F      [ 1]  463 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      00823A 81               [ 4]  464 	ret 
                                    465 
                                    466 
                                    467 ;-----------------------------------
                                    468 ; erase flash or EEPROM block
                                    469 ; a blow is 128 bytes 
                                    470 ; input:
                                    471 ;   farptr  address row begin
                                    472 ; output:
                                    473 ;   none
                                    474 ;--------------------------------------
      00823B                        475 block_erase:
      00823B CE 00 18         [ 2]  476 	ldw x,farptr+1
      00823E A3 A7 80         [ 2]  477 	cpw x,#user_space 
      008241 2A 17            [ 1]  478 	jrpl erase_flash 
                                    479 ; erase eeprom block
      008243 A3 40 00         [ 2]  480 	cpw x,#EEPROM_BASE 
      008246 24 01            [ 1]  481 	jruge 1$
      008248 81               [ 4]  482 	ret ; bad address 
      008249 AE 47 FF         [ 2]  483 1$: ldw x,#EEPROM_END 
      00824C 23 01            [ 2]  484 	jrule 2$ 
      00824E 81               [ 4]  485 	ret ; bad address 
      00824F CD 81 6D         [ 4]  486 2$:	call unlock_eeprom 
      008252 CD 16 90         [ 4]  487 	call tib 
      008255 72 17 50 5F      [ 1]  488 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008259 81               [ 4]  489 	ret 
                                    490 ; erase flash block:
      00825A                        491 erase_flash:
      00825A CD 81 83         [ 4]  492 	call unlock_flash 
      00825D CD 16 90         [ 4]  493 	call tib 
      008260 72 13 50 5F      [ 1]  494     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008264 81               [ 4]  495 	ret 
                                    496 
                                    497 
                                    498 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    499 ; write a byte to FLASH or EEPROM/OPTION  
                                    500 ; input:
                                    501 ;    a  		byte to write
                                    502 ;    farptr  	address
                                    503 ;    x          farptr[x]
                                    504 ; output:
                                    505 ;    none
                                    506 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    507 	; variables locales
                           000001   508 	BTW = 1   ; byte to write offset on stack
                           000002   509 	OPT = 2   ; OPTION flag offset on stack
                           000002   510 	VSIZE = 2
      008265                        511 write_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008265 90 89            [ 2]  512 	pushw y
      0001E7                        513 	_vars VSIZE
      008267 52 02            [ 2]    1     sub sp,#VSIZE 
      008269 6B 01            [ 1]  514 	ld (BTW,sp),a ; byte to write 
      00826B 0F 02            [ 1]  515 	clr (OPT,sp)  ; OPTION flag
                                    516 ; put addr[15:0] in Y, for bounds check.
      00826D 90 CE 00 18      [ 2]  517 	ldw y,farptr+1   ; Y=addr15:0
                                    518 ; check addr[23:16], if <> 0 then it is extened flash memory
      008271 72 5D 00 17      [ 1]  519 	tnz farptr 
      008275 26 14            [ 1]  520 	jrne write_flash
      008277 90 A3 A7 80      [ 2]  521     cpw y,#user_space
      00827B 24 0E            [ 1]  522     jruge write_flash
      00827D 90 A3 40 00      [ 2]  523 	cpw y,#EEPROM_BASE  
      008281 25 52            [ 1]  524     jrult write_exit
      008283 90 A3 48 7F      [ 2]  525 	cpw y,#OPTION_END 
      008287 22 4C            [ 1]  526 	jrugt write_exit
      008289 20 16            [ 2]  527 	jra write_eeprom 
                                    528 ; write program memory
      00828B                        529 write_flash:
      00828B CD 81 83         [ 4]  530 	call unlock_flash 
      00828E 9B               [ 1]  531 1$:	sim 
      00828F 7B 01            [ 1]  532 	ld a,(BTW,sp)
      008291 92 A7 00 17      [ 4]  533 	ldf ([farptr],x),a ; farptr[x]=A
      008295 72 05 50 5F FB   [ 2]  534 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00829A 9A               [ 1]  535     rim 
      00829B 72 13 50 5F      [ 1]  536     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00829F 20 34            [ 2]  537     jra write_exit
                                    538 ; write eeprom and option
      0082A1                        539 write_eeprom:
      0082A1 CD 81 6D         [ 4]  540 	call unlock_eeprom
                                    541 	; check for data eeprom or option eeprom
      0082A4 90 A3 48 00      [ 2]  542 	cpw y,#OPTION_BASE
      0082A8 2B 08            [ 1]  543 	jrmi 1$
      0082AA 90 A3 48 80      [ 2]  544 	cpw y,#OPTION_END+1
      0082AE 2A 02            [ 1]  545 	jrpl 1$
      0082B0 03 02            [ 1]  546 	cpl (OPT,sp)
      0082B2                        547 1$: 
      0082B2 0D 02            [ 1]  548     tnz (OPT,sp)
      0082B4 27 08            [ 1]  549     jreq 2$
                                    550 	; pour modifier une option il faut modifier ces 2 bits
      0082B6 72 1E 50 5B      [ 1]  551     bset FLASH_CR2,#FLASH_CR2_OPT
      0082BA 72 1F 50 5C      [ 1]  552     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082BE                        553 2$: 
      0082BE 7B 01            [ 1]  554     ld a,(BTW,sp)
      0082C0 92 A7 00 17      [ 4]  555     ldf ([farptr],x),a
      0082C4 0D 02            [ 1]  556     tnz (OPT,sp)
      0082C6 27 08            [ 1]  557     jreq 3$
      0082C8 5C               [ 2]  558     incw x
      0082C9 7B 01            [ 1]  559     ld a,(BTW,sp)
      0082CB 43               [ 1]  560     cpl a
      0082CC 92 A7 00 17      [ 4]  561     ldf ([farptr],x),a
      0082D0 72 05 50 5F FB   [ 2]  562 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082D5                        563 write_exit:
      000255                        564 	_drop VSIZE 
      0082D5 5B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082D7 90 85            [ 2]  565 	popw y
      0082D9 81               [ 4]  566     ret
                                    567 
                                    568 ;--------------------------------------------
                                    569 ; write a data block to eeprom or flash 
                                    570 ; input:
                                    571 ;   Y        source address   
                                    572 ;   X        array index  destination  farptr[x]
                                    573 ;   BSIZE    block size bytes 
                                    574 ;   farptr   write address , byte* 
                                    575 ; output:
                                    576 ;	X 		after last byte written 
                                    577 ;   Y 		after last byte read 
                                    578 ;  farptr   point after block
                                    579 ;---------------------------------------------
      0082DA                        580 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00025A                        581 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    582 	; local var 
                           000001   583 	XSAVE=1 
                           000002   584 	VSIZE=2 
      00025A                        585 write_block:
      00025A                        586 	_vars VSIZE
      0082DA 52 02            [ 2]    1     sub sp,#VSIZE 
      0082DC 1F 01            [ 2]  587 	ldw (XSAVE,sp),x 
      0082DE 1E 05            [ 2]  588 	ldw x,(BSIZE,sp) 
      0082E0 27 13            [ 1]  589 	jreq 9$
      0082E2 1E 01            [ 2]  590 1$:	ldw x,(XSAVE,sp)
      0082E4 90 F6            [ 1]  591 	ld a,(y)
      0082E6 CD 82 65         [ 4]  592 	call write_byte 
      0082E9 5C               [ 2]  593 	incw x 
      0082EA 90 5C            [ 2]  594 	incw y 
      0082EC 1F 01            [ 2]  595 	ldw (XSAVE,sp),x
      0082EE 1E 05            [ 2]  596 	ldw x,(BSIZE,sp)
      0082F0 5A               [ 2]  597 	decw x
      0082F1 1F 05            [ 2]  598 	ldw (BSIZE,sp),x 
      0082F3 26 ED            [ 1]  599 	jrne 1$
      0082F5                        600 9$:
      0082F5 1E 01            [ 2]  601 	ldw x,(XSAVE,sp)
      0082F7 CD 9A 3A         [ 4]  602 	call incr_farptr
      00027A                        603 	_drop VSIZE
      0082FA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FC 81               [ 4]  604 	ret 
                                    605 
                                    606 
                                    607 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    608 ;;   UART1 subroutines
                                    609 ;;   used for user interface 
                                    610 ;;   communication channel.
                                    611 ;;   settings: 
                                    612 ;;		115200 8N1 no flow control
                                    613 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    614 
                                    615 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    616 ; initialize UART1, 115200 8N1
                                    617 ; input:
                                    618 ;	none
                                    619 ; output:
                                    620 ;   none
                                    621 ;---------------------------------------------
      0082FD                        622 uart1_init:
      0082FD 72 1A 50 02      [ 1]  623     bset PA_DDR,#UART1_TX_PIN
      008301 72 1A 50 03      [ 1]  624     bset PA_CR1,#UART1_TX_PIN 
      008305 72 1A 50 04      [ 1]  625     bset PA_CR2,#UART1_TX_PIN 
                                    626 ; enable UART1 clock
      008309 72 14 50 C7      [ 1]  627 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00830D                        628 uart1_set_baud: 
                                    629 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    630 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830D A6 E1            [ 1]  631 	ld a,#CLK_SWR_HSI
      00830F C1 50 C3         [ 1]  632 	cp a,CLK_CMSR 
      008312 27 0A            [ 1]  633 	jreq 2$ 
      008314                        634 1$: ; 8 Mhz 	
      008314 35 05 52 33      [ 1]  635 	mov UART1_BRR2,#0x05 ; must be loaded first
      008318 35 04 52 32      [ 1]  636 	mov UART1_BRR1,#0x4
      00831C 20 08            [ 2]  637 	jra 3$
      00831E                        638 2$: ; 16 Mhz 	
      00831E 35 0B 52 33      [ 1]  639 	mov UART1_BRR2,#0x0b ; must be loaded first
      008322 35 08 52 32      [ 1]  640 	mov UART1_BRR1,#0x08
      008326                        641 3$:
      008326 72 5F 52 31      [ 1]  642     clr UART1_DR
      00832A 35 2C 52 35      [ 1]  643 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832E 72 10 52 35      [ 1]  644 	bset UART1_CR2,#UART_CR2_SBK
      008332 72 0D 52 30 FB   [ 2]  645     btjf UART1_SR,#UART_SR_TC,.
      008337 72 5F 00 2E      [ 1]  646     clr rx_head 
      00833B 72 5F 00 2F      [ 1]  647 	clr rx_tail 
      00833F 81               [ 4]  648 	ret
                                    649 
                                    650 ;---------------------------------
                                    651 ; send character to UART1 
                                    652 ; input:
                                    653 ;   A 
                                    654 ; output:
                                    655 ;   none 
                                    656 ;--------------------------------	
      008340                        657 putc::
      008340 72 0F 52 30 FB   [ 2]  658 	btjf UART1_SR,#UART_SR_TXE,.
      008345 C7 52 31         [ 1]  659 	ld UART1_DR,a 
      008348 81               [ 4]  660 	ret 
                                    661 
                                    662 ;---------------------------------
                                    663 ; wait character from UART1 
                                    664 ; input:
                                    665 ;   none
                                    666 ; output:
                                    667 ;   A 			char  
                                    668 ;--------------------------------	
      008349                        669 getc::
      008349 C6 00 2E         [ 1]  670 	ld a,rx_head 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00834C C1 00 2F         [ 1]  671 1$:	cp a,rx_tail 
      00834F 27 FB            [ 1]  672 	jreq 1$
      008351 89               [ 2]  673 	pushw x 
      008352 AE 00 26         [ 2]  674 	ldw x,#rx_queue
      008355 9F               [ 1]  675 	ld a,xl 
      008356 CB 00 2E         [ 1]  676 	add a,rx_head 
      008359 97               [ 1]  677 	ld xl,a 
      00835A F6               [ 1]  678 	ld a,(x)
      00835B 85               [ 2]  679 	popw x
      00835C 88               [ 1]  680 	push a
      00835D 72 5C 00 2E      [ 1]  681 	inc rx_head 
      008361 A6 07            [ 1]  682 	ld a,#RX_QUEUE_SIZE-1 
      008363 C4 00 2E         [ 1]  683 	and a,rx_head 
      008366 C7 00 2E         [ 1]  684 	ld rx_head,a 
      008369 84               [ 1]  685 	pop a  
      00836A 81               [ 4]  686 	ret 
                                    687 
                                    688 ;----------------------
                                    689 ; print token id && value
                                    690 ; input:
                                    691 ;   A     token id 
                                    692 ;   X     token value 
                                    693 ;---------------------
                           000001   694 	BSAVE=1
                           000002   695 	AREG=2
                           000003   696 	XREG=3
                           000004   697 	VSIZE=4
      00836B                        698 prt_tok:
      0002EB                        699 	_vars VSIZE 
      00836B 52 04            [ 2]    1     sub sp,#VSIZE 
      00836D 6B 02            [ 1]  700 	ld (AREG,sp),a 
      00836F 1F 03            [ 2]  701 	ldw (XREG,sp),x 
      008371 C6 00 0B         [ 1]  702 	ld a, base
      008374 6B 01            [ 1]  703 	ld (BSAVE,sp),a 
      008376 35 10 00 0B      [ 1]  704 	mov base,#16  
      00837A AE 83 A2         [ 2]  705 	ldw x,#token_msg
      00837D CD A7 C0         [ 4]  706 	call puts 
      008380 5F               [ 1]  707 	clrw x 
      008381 7B 02            [ 1]  708 	ld a,(AREG,sp)
      008383 97               [ 1]  709 	ld xl,a 
      008384 CD 8A 42         [ 4]  710 	call print_int 
      008387 A6 20            [ 1]  711 	ld a,#SPACE
      008389 CD 83 40         [ 4]  712 	call putc 
      00838C 1E 03            [ 2]  713 	ldw x,(XREG,sp)
      00838E CD 8A 42         [ 4]  714 	call print_int 
      008391 A6 0D            [ 1]  715 	ld a,#CR 
      008393 CD 83 40         [ 4]  716 	call putc 
      008396 7B 01            [ 1]  717 	ld a,(BSAVE,sp)
      008398 C7 00 0B         [ 1]  718 	ld base,a 
      00839B 7B 02            [ 1]  719 	ld a,(AREG,sp)
      00839D 1E 03            [ 2]  720 	ldw x,(XREG,sp)
      00031F                        721 	_drop VSIZE 
      00839F 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083A1 81               [ 4]  722 	ret 
      0083A2 74 6F 6B 65 6E 3A 20   723 token_msg: .asciz "token: "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal  00-Bits]



             00
                                    724 
                                    725 
                                    726 ;---------------------
                                    727 ; display n bytes row 
                                    728 ; from memory.
                                    729 ; input:
                                    730 ;   A   bytes to print 
                                    731 ;	X   start address 
                                    732 ; output:
                                    733 ;   X   address after last shown  
                                    734 ;---------------------
                           000001   735 	CNT=1 
                           000002   736 	ADR=2 
                           000003   737 	VSIZE=3 
      0083AA                        738 show_row:
      0083AA 4D               [ 1]  739 	tnz a 
      0083AB 26 01            [ 1]  740 	jrne 1$
      0083AD 81               [ 4]  741 	ret 
      0083AE                        742 1$:	
      0083AE 89               [ 2]  743 	pushw x  
      0083AF 88               [ 1]  744 	push a 
      0083B0 35 04 00 25      [ 1]  745 	mov tab_width,#4 
      0083B4 CD 8A 42         [ 4]  746 	call print_int 
      0083B7 A6 20            [ 1]  747 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  748 	call putc
      0083BC                        749 row_loop:
      0083BC 1E 02            [ 2]  750 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  751 	ld a,(x)
      0083BF 5F               [ 1]  752 	clrw x 
      0083C0 97               [ 1]  753 	ld xl,a 
      0083C1 CD 8A 42         [ 4]  754 	call print_int 
      0083C4 1E 02            [ 2]  755 	ldw x,(ADR,sp)
      0083C6 5C               [ 2]  756 	incw x 
      0083C7 1F 02            [ 2]  757 	ldw (ADR,sp),x 
      0083C9 0A 01            [ 1]  758 	dec (CNT,sp)
      0083CB 26 EF            [ 1]  759 	jrne row_loop
      00034D                        760 	_drop VSIZE  		
      0083CD 5B 03            [ 2]    1     addw sp,#VSIZE 
      0083CF 35 04 00 25      [ 1]  761 	mov tab_width,#4
      0083D3 A6 0D            [ 1]  762 	ld a,#CR 
      0083D5 CD 83 40         [ 4]  763 	call putc 
      0083D8 81               [ 4]  764 	ret 
                                    765 
                                    766 ;--------------------------
                                    767 ; print memory content 
                                    768 ; in hexadecimal format
                                    769 ;  input:
                                    770 ;    X    start address 
                                    771 ;    Y    count 
                                    772 ;--------------------------
                           000001   773 	BCNT=1
                           000003   774 	BASE=3
                           000004   775 	TABW=4
                           000004   776 	VSIZE=4   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083D9                        777 hex_dump:
      000359                        778 	_vars VSIZE
      0083D9 52 04            [ 2]    1     sub sp,#VSIZE 
      0083DB C6 00 0B         [ 1]  779 	ld a,base
      0083DE 6B 03            [ 1]  780 	ld (BASE,sp),a 
      0083E0 35 10 00 0B      [ 1]  781 	mov base,#16
      0083E4 C6 00 25         [ 1]  782 	ld a,tab_width 
      0083E7 6B 04            [ 1]  783 	ld (TABW,sp),a
      0083E9 A6 0D            [ 1]  784 	ld a,#CR 
      0083EB CD 83 40         [ 4]  785 	call putc 
      0083EE 17 01            [ 2]  786 1$: ldw (BCNT,sp),y
      0083F0 A6 10            [ 1]  787 	ld a,#16
      0083F2 90 A3 00 10      [ 2]  788 	cpw y,#16
      0083F6 2A 02            [ 1]  789 	jrpl 2$
      0083F8 90 9F            [ 1]  790 	ld a,yl
      0083FA                        791 2$: 	
      0083FA CD 83 AA         [ 4]  792 	call show_row 
      0083FD 16 01            [ 2]  793 	ldw y,(BCNT,sp) 
      0083FF 72 A2 00 10      [ 2]  794 	subw y,#16 
      008403 90 A3 00 01      [ 2]  795 	cpw y,#1
      008407 2A E5            [ 1]  796 	jrpl 1$
      008409 7B 03            [ 1]  797 	ld a,(BASE,sp)
      00840B C7 00 0B         [ 1]  798 	ld base,a
      00840E 7B 04            [ 1]  799 	ld a,(TABW,sp)
      008410 C7 00 25         [ 1]  800 	ld tab_width,a 
      000393                        801 	_drop VSIZE
      008413 5B 04            [ 2]    1     addw sp,#VSIZE 
      008415 81               [ 4]  802 	ret 
                                    803 
                                    804 ;-------------------------------------
                                    805 ; retrun string length
                                    806 ; input:
                                    807 ;   X         .asciz  pointer 
                                    808 ; output:
                                    809 ;   X         length 
                                    810 ;-------------------------------------
      008416                        811 strlen::
      008416 90 93            [ 1]  812 	ldw y,x 
      008418 5F               [ 1]  813 	clrw x 
      008419 90 7D            [ 1]  814 1$:	tnz (y) 
      00841B 27 05            [ 1]  815 	jreq 9$ 
      00841D 5C               [ 2]  816 	incw x
      00841E 90 5C            [ 2]  817 	incw y 
      008420 20 F7            [ 2]  818 	jra 1$ 
      008422 81               [ 4]  819 9$: ret 
                                    820 
                                    821 ;------------------------------------
                                    822 ; compare 2 strings
                                    823 ; input:
                                    824 ;   X 		char* first string 
                                    825 ;   Y       char* second string 
                                    826 ; output:
                                    827 ;   A 		0|1 
                                    828 ;-------------------------------------
      008423                        829 strcmp:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008423 F6               [ 1]  830 	ld a,(x)
      008424 27 0B            [ 1]  831 	jreq 5$ 
      008426 90 F1            [ 1]  832 	cp a,(y) 
      008428 26 05            [ 1]  833 	jrne 4$ 
      00842A 5C               [ 2]  834 	incw x 
      00842B 90 5C            [ 2]  835 	incw y 
      00842D 20 F4            [ 2]  836 	jra strcmp 
      00842F                        837 4$: ; not same  
      00842F 4F               [ 1]  838 	clr a 
      008430 81               [ 4]  839 	ret 
      008431                        840 5$: ; same 
      008431 A6 01            [ 1]  841 	ld a,#1 
      008433 81               [ 4]  842 	ret 
                                    843 
                                    844 
                                    845 ;---------------------------------------
                                    846 ;  copy src to dest 
                                    847 ; input:
                                    848 ;   X 		dest 
                                    849 ;   Y 		src 
                                    850 ; output: 
                                    851 ;   X 		dest 
                                    852 ;----------------------------------
      008434                        853 strcpy:
      008434 89               [ 2]  854 	pushw x 
      008435 90 F6            [ 1]  855 1$: ld a,(y)
      008437 27 06            [ 1]  856 	jreq 9$ 
      008439 F7               [ 1]  857 	ld (x),a 
      00843A 5C               [ 2]  858 	incw x 
      00843B 90 5C            [ 2]  859 	incw y 
      00843D 20 F6            [ 2]  860 	jra 1$ 
      00843F 7F               [ 1]  861 9$:	clr (x)
      008440 85               [ 2]  862 	popw x 
      008441 81               [ 4]  863 	ret 
                                    864 
                                    865 ;---------------------------------------
                                    866 ; move memory block 
                                    867 ; input:
                                    868 ;   X 		destination 
                                    869 ;   Y 	    source 
                                    870 ;   acc16	bytes count 
                                    871 ; output:
                                    872 ;   none 
                                    873 ;--------------------------------------
                           000001   874 	INCR=1 ; increament high byte 
                           000002   875 	LB=2 ; increament low byte 
                           000002   876 	VSIZE=2
      008442                        877 move::
      0003C2                        878 	_vars VSIZE 
      008442 52 02            [ 2]    1     sub sp,#VSIZE 
      008444 0F 01            [ 1]  879 	clr (INCR,sp)
      008446 0F 02            [ 1]  880 	clr (LB,sp)
      008448 90 89            [ 2]  881 	pushw y 
      00844A 13 01            [ 2]  882 	cpw x,(1,sp) ; compare DEST to SRC 
      00844C 90 85            [ 2]  883 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00844E 27 31            [ 1]  884 	jreq move_exit ; x==y 
      008450 2B 0E            [ 1]  885 	jrmi move_down
      008452                        886 move_up: ; start from top address with incr=-1
      008452 72 BB 00 0D      [ 2]  887 	addw x,acc16
      008456 72 B9 00 0D      [ 2]  888 	addw y,acc16
      00845A 03 01            [ 1]  889 	cpl (INCR,sp)
      00845C 03 02            [ 1]  890 	cpl (LB,sp)   ; increment = -1 
      00845E 20 05            [ 2]  891 	jra move_loop  
      008460                        892 move_down: ; start from bottom address with incr=1 
      008460 5A               [ 2]  893     decw x 
      008461 90 5A            [ 2]  894 	decw y
      008463 0C 02            [ 1]  895 	inc (LB,sp) ; incr=1 
      008465                        896 move_loop:	
      008465 C6 00 0D         [ 1]  897     ld a, acc16 
      008468 CA 00 0E         [ 1]  898 	or a, acc8
      00846B 27 14            [ 1]  899 	jreq move_exit 
      00846D 72 FB 01         [ 2]  900 	addw x,(INCR,sp)
      008470 72 F9 01         [ 2]  901 	addw y,(INCR,sp) 
      008473 90 F6            [ 1]  902 	ld a,(y)
      008475 F7               [ 1]  903 	ld (x),a 
      008476 89               [ 2]  904 	pushw x 
      008477 CE 00 0D         [ 2]  905 	ldw x,acc16 
      00847A 5A               [ 2]  906 	decw x 
      00847B CF 00 0D         [ 2]  907 	ldw acc16,x 
      00847E 85               [ 2]  908 	popw x 
      00847F 20 E4            [ 2]  909 	jra move_loop
      008481                        910 move_exit:
      000401                        911 	_drop VSIZE
      008481 5B 02            [ 2]    1     addw sp,#VSIZE 
      008483 81               [ 4]  912 	ret 	
                                    913 
                                    914 ;-------------------------------------
                                    915 ; search text area for a line#
                                    916 ; input:
                                    917 ;	X 			line# 
                                    918 ; output:
                                    919 ;   X 			addr of line | 0 
                                    920 ;   Y           line#|insert address if not found  
                                    921 ;-------------------------------------
                           000001   922 	LL=1 ; line length 
                           000002   923 	LB=2 ; line length low byte 
                           000002   924 	VSIZE=2 
      008484                        925 search_lineno::
      000404                        926 	_vars VSIZE
      008484 52 02            [ 2]    1     sub sp,#VSIZE 
      008486 0F 01            [ 1]  927 	clr (LL,sp)
      008488 90 CE 00 1D      [ 2]  928 	ldw y,txtbgn
      00848C                        929 search_ln_loop:
      00848C 90 C3 00 1F      [ 2]  930 	cpw y,txtend 
      008490 2A 10            [ 1]  931 	jrpl 8$
      008492 90 F3            [ 1]  932 	cpw x,(y)
      008494 27 0E            [ 1]  933 	jreq 9$
      008496 2B 0A            [ 1]  934 	jrmi 8$ 
      008498 90 E6 02         [ 1]  935 	ld a,(2,y)
      00849B 6B 02            [ 1]  936 	ld (LB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00849D 72 F9 01         [ 2]  937 	addw y,(LL,sp)
      0084A0 20 EA            [ 2]  938 	jra search_ln_loop 
      0084A2                        939 8$: 
      0084A2 5F               [ 1]  940 	clrw x 	
      0084A3 51               [ 1]  941 	exgw x,y 
      000424                        942 9$: _drop VSIZE
      0084A4 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084A6 51               [ 1]  943 	exgw x,y   
      0084A7 81               [ 4]  944 	ret 
                                    945 
                                    946 ;-------------------------------------
                                    947 ; delete line at addr
                                    948 ; input:
                                    949 ;   X 		addr of line i.e DEST for move 
                                    950 ;-------------------------------------
                           000001   951 	LLEN=1
                           000003   952 	SRC=3
                           000004   953 	VSIZE=4
      0084A8                        954 del_line: 
      000428                        955 	_vars VSIZE 
      0084A8 52 04            [ 2]    1     sub sp,#VSIZE 
      0084AA E6 02            [ 1]  956 	ld a,(2,x) ; line length
      0084AC 6B 02            [ 1]  957 	ld (LLEN+1,sp),a 
      0084AE 0F 01            [ 1]  958 	clr (LLEN,sp)
      0084B0 90 93            [ 1]  959 	ldw y,x  
      0084B2 72 F9 01         [ 2]  960 	addw y,(LLEN,sp) ;SRC  
      0084B5 17 03            [ 2]  961 	ldw (SRC,sp),y  ;save source 
      0084B7 90 CE 00 1F      [ 2]  962 	ldw y,txtend 
      0084BB 72 F2 03         [ 2]  963 	subw y,(SRC,sp) ; y=count 
      0084BE 90 CF 00 0D      [ 2]  964 	ldw acc16,y 
      0084C2 16 03            [ 2]  965 	ldw y,(SRC,sp)    ; source
      0084C4 CD 84 42         [ 4]  966 	call move
      0084C7 90 CE 00 1F      [ 2]  967 	ldw y,txtend 
      0084CB 72 F2 01         [ 2]  968 	subw y,(LLEN,sp)
      0084CE 90 CF 00 1F      [ 2]  969 	ldw txtend,y  
      000452                        970 	_drop VSIZE     
      0084D2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084D4 81               [ 4]  971 	ret 
                                    972 
                                    973 ;---------------------------------------------
                                    974 ; create a gap in text area to 
                                    975 ; move new line in this gap
                                    976 ; input:
                                    977 ;    X 			addr gap start 
                                    978 ;    Y 			gap length 
                                    979 ; output:
                                    980 ;    X 			addr gap start 
                                    981 ;--------------------------------------------
                           000001   982 	DEST=1
                           000003   983 	SRC=3
                           000005   984 	LEN=5
                           000006   985 	VSIZE=6 
      0084D5                        986 create_gap:
      000455                        987 	_vars VSIZE
      0084D5 52 06            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084D7 1F 03            [ 2]  988 	ldw (SRC,sp),x 
      0084D9 17 05            [ 2]  989 	ldw (LEN,sp),y 
      0084DB 90 CF 00 0D      [ 2]  990 	ldw acc16,y 
      0084DF 90 93            [ 1]  991 	ldw y,x ; SRC
      0084E1 72 BB 00 0D      [ 2]  992 	addw x,acc16  
      0084E5 1F 01            [ 2]  993 	ldw (DEST,sp),x 
                                    994 ;compute size to move 	
      0084E7 CE 00 1F         [ 2]  995 	ldw x,txtend 
      0084EA 72 F0 03         [ 2]  996 	subw x,(SRC,sp)
      0084ED CF 00 0D         [ 2]  997 	ldw acc16,x ; size to move
      0084F0 1E 01            [ 2]  998 	ldw x,(DEST,sp) 
      0084F2 CD 84 42         [ 4]  999 	call move
      0084F5 CE 00 1F         [ 2] 1000 	ldw x,txtend
      0084F8 72 FB 05         [ 2] 1001 	addw x,(LEN,sp)
      0084FB CF 00 1F         [ 2] 1002 	ldw txtend,x
      00047E                       1003 9$:	_drop VSIZE 
      0084FE 5B 06            [ 2]    1     addw sp,#VSIZE 
      008500 81               [ 4] 1004 	ret 
                                   1005 
                                   1006 ;--------------------------------------------
                                   1007 ; insert line in pad into text area 
                                   1008 ; first search for already existing 
                                   1009 ; replace existing 
                                   1010 ; if new line empty delete existing one. 
                                   1011 ; input:
                                   1012 ;   ptr16		pointer to tokenized line  
                                   1013 ; output:
                                   1014 ;   none
                                   1015 ;---------------------------------------------
                           000001  1016 	DEST=1  ; text area insertion address 
                           000003  1017 	SRC=3   ; str to insert address 
                           000005  1018 	LINENO=5 ; line number 
                           000007  1019 	LLEN=7 ; line length 
                           000008  1020 	VSIZE=8  
      008501                       1021 insert_line:
      000481                       1022 	_vars VSIZE 
      008501 52 08            [ 2]    1     sub sp,#VSIZE 
      008503 CE 00 1F         [ 2] 1023 	ldw x,txtend  
      008506 C3 00 1D         [ 2] 1024 	cpw x,txtbgn 
      008509 26 15            [ 1] 1025 	jrne 0$
                                   1026 ;first text line 
      00850B AE 00 02         [ 2] 1027 	ldw x,#2 
      00850E 72 D6 00 18      [ 4] 1028 	ld a,([ptr16],x)
      008512 5F               [ 1] 1029 	clrw x 
      008513 97               [ 1] 1030 	ld xl,a
      008514 1F 07            [ 2] 1031 	ldw (LLEN,sp),x 
      008516 CE 00 1D         [ 2] 1032 	ldw x,txtbgn
      008519 1F 01            [ 2] 1033 	ldw (DEST,sp),x 
      00851B CE 00 1F         [ 2] 1034 	ldw x,txtend 
      00851E 20 37            [ 2] 1035 	jra 4$
      008520 72 CE 00 18      [ 5] 1036 0$:	ldw x,[ptr16]
                                   1037 ; line number
      008524 1F 05            [ 2] 1038 	ldw (LINENO,sp),x 
      008526 AE 00 02         [ 2] 1039 	ldw x,#2 
      008529 72 D6 00 18      [ 4] 1040 	ld a,([ptr16],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00852D 97               [ 1] 1041 	ld xl,a
                                   1042 ; line length
      00852E 1F 07            [ 2] 1043 	ldw (LLEN,sp),x
                                   1044 ; check if that line number already exit 	
      008530 1E 05            [ 2] 1045 	ldw x,(LINENO,sp)
      008532 CD 84 84         [ 4] 1046 	call search_lineno 
      008535 5D               [ 2] 1047 	tnzw x 
      008536 26 04            [ 1] 1048 	jrne 2$
                                   1049 ; line doesn't exit
                                   1050 ; it will be inserted at this point.  	
      008538 17 01            [ 2] 1051 	ldw (DEST,sp),y 
      00853A 20 05            [ 2] 1052 	jra 3$
                                   1053 ; line exit delete it.
                                   1054 ; it will be replaced by new one 	
      00853C 1F 01            [ 2] 1055 2$: ldw (DEST,sp),x 
      00853E CD 84 A8         [ 4] 1056 	call del_line
      008541                       1057 3$: 
                                   1058 ; insert new line or leave if LLEN==3
                                   1059 ; LLEN==3 means empty line 
      008541 A6 03            [ 1] 1060 	ld a,#3
      008543 11 08            [ 1] 1061 	cp a,(LLEN+1,sp)
      008545 27 24            [ 1] 1062 	jreq insert_ln_exit ; empty line exit.
                                   1063 ; if insertion point at txtend 
                                   1064 ; move no need to create a gap 
      008547 1E 01            [ 2] 1065 	ldw x,(DEST,sp)
      008549 C3 00 1F         [ 2] 1066 	cpw x,txtend 
      00854C 27 09            [ 1] 1067 	jreq 4$ 
                                   1068 ; must create a gap
                                   1069 ; at insertion point  
      00854E 1E 01            [ 2] 1070 	ldw x,(DEST,sp)
      008550 16 07            [ 2] 1071 	ldw y,(LLEN,sp)
      008552 CD 84 D5         [ 4] 1072 	call create_gap
      008555 20 06            [ 2] 1073 	jra 5$
      008557                       1074 4$: 
      008557 72 FB 07         [ 2] 1075 	addw x,(LLEN,sp)
      00855A CF 00 1F         [ 2] 1076 	ldw txtend,x 	 
                                   1077 ; move new line in gap 
      00855D 1E 07            [ 2] 1078 5$:	ldw x,(LLEN,sp)
      00855F CF 00 0D         [ 2] 1079 	ldw acc16,x 
      008562 90 AE 16 E0      [ 2] 1080 	ldw y,#pad ;SRC 
      008566 1E 01            [ 2] 1081 	ldw x,(DEST,sp) ; dest address 
      008568 CD 84 42         [ 4] 1082 	call move 
      00856B                       1083 insert_ln_exit:	
      0004EB                       1084 	_drop VSIZE
      00856B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00856D 81               [ 4] 1085 	ret
                                   1086 
                                   1087 ;-----------------------------------
                                   1088 ; create token list fromm text line 
                                   1089 ; save this list in pad buffer 
                                   1090 ;  compiled line format: 
                                   1091 ;    line_no  2 bytes {0...32767}
                                   1092 ;    count    1 byte  
                                   1093 ;    tokens   variable length 
                                   1094 ;   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1095 ; input:
                                   1096 ;   none
                                   1097 ; modified variables:
                                   1098 ;   basicptr     token list buffer address 
                                   1099 ;   in.w  		 3|count, i.e. index in buffer
                                   1100 ;   count        length of line | 0  
                                   1101 ;-----------------------------------
                           000001  1102 	XSAVE=1
                           000002  1103 	VSIZE=2
      00856E                       1104 compile:
      0004EE                       1105 	_vars VSIZE 
      00856E 52 02            [ 2]    1     sub sp,#VSIZE 
      008570 72 1A 00 24      [ 1] 1106 	bset flags,#FCOMP 
      008574 A6 00            [ 1] 1107 	ld a,#0
      008576 AE 00 00         [ 2] 1108 	ldw x,#0
      008579 CF 16 E0         [ 2] 1109 	ldw pad,x ; destination buffer 
      00857C C7 16 E2         [ 1] 1110 	ld pad+2,a ; count 
      00857F AE 16 E3         [ 2] 1111 	ldw x,#pad+3
      008582 72 5F 00 02      [ 1] 1112 	clr in 
      008586 CD 8C 66         [ 4] 1113 	call get_token
      008589 A1 84            [ 1] 1114 	cp a,#TK_INTGR
      00858B 26 11            [ 1] 1115 	jrne 2$
      00858D A3 00 01         [ 2] 1116 	cpw x,#1 
      008590 2A 05            [ 1] 1117 	jrpl 1$
      008592 A6 0A            [ 1] 1118 	ld a,#ERR_BAD_VALUE
      008594 CC 88 FD         [ 2] 1119 	jp tb_error
      008597 CF 16 E0         [ 2] 1120 1$:	ldw pad,x 
      00859A 90 AE 16 E3      [ 2] 1121 	ldw y,#pad+3 
      00859E 90 A3 17 60      [ 2] 1122 2$:	cpw y,#stack_full 
      0085A2 25 05            [ 1] 1123 	jrult 3$
      0085A4 A6 0F            [ 1] 1124 	ld a,#ERR_BUF_FULL 
      0085A6 CC 88 FD         [ 2] 1125 	jp tb_error 
      0085A9                       1126 3$:	
      0085A9 93               [ 1] 1127 	ldw x,y 
      0085AA CD 8C 66         [ 4] 1128 	call get_token 
      0085AD A1 00            [ 1] 1129 	cp a,#TK_NONE 
      0085AF 26 ED            [ 1] 1130 	jrne 2$ 
                                   1131 ; compilation completed  
      0085B1 72 A2 16 E0      [ 2] 1132 	subw y,#pad
      0085B5 90 9F            [ 1] 1133     ld a,yl
      0085B7 AE 16 E0         [ 2] 1134 	ldw x,#pad 
      0085BA CF 00 18         [ 2] 1135 	ldw ptr16,x 
      0085BD E7 02            [ 1] 1136 	ld (2,x),a 
      0085BF FE               [ 2] 1137 	ldw x,(x)
      0085C0 27 09            [ 1] 1138 	jreq 10$
      0085C2 CD 85 01         [ 4] 1139 	call insert_line
      0085C5 72 5F 00 04      [ 1] 1140 	clr  count 
      0085C9 20 0F            [ 2] 1141 	jra  11$ 
      0085CB                       1142 10$: ; line# is zero 
      0085CB CE 00 18         [ 2] 1143 	ldw x,ptr16  
      0085CE CF 00 05         [ 2] 1144 	ldw basicptr,x 
      0085D1 E6 02            [ 1] 1145 	ld a,(2,x)
      0085D3 C7 00 04         [ 1] 1146 	ld count,a 
      0085D6 35 03 00 02      [ 1] 1147 	mov in,#3 
      0085DA                       1148 11$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00055A                       1149 	_drop VSIZE 
      0085DA 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085DC 72 1B 00 24      [ 1] 1150 	bres flags,#FCOMP 
      0085E0 81               [ 4] 1151 	ret 
                                   1152 
                                   1153 ;------------------------------------
                                   1154 ;  set all variables to zero 
                                   1155 ; input:
                                   1156 ;   none 
                                   1157 ; output:
                                   1158 ;	none
                                   1159 ;------------------------------------
      0085E1                       1160 clear_vars:
      0085E1 AE 00 30         [ 2] 1161 	ldw x,#vars 
      0085E4 90 AE 00 34      [ 2] 1162 	ldw y,#2*26 
      0085E8 7F               [ 1] 1163 1$:	clr (x)
      0085E9 5C               [ 2] 1164 	incw x 
      0085EA 90 5A            [ 2] 1165 	decw y 
      0085EC 26 FA            [ 1] 1166 	jrne 1$
      0085EE 81               [ 4] 1167 	ret 
                                   1168 
                                   1169 ;-------------------------------------
                                   1170 ; check if A is a letter 
                                   1171 ; input:
                                   1172 ;   A 			character to test 
                                   1173 ; output:
                                   1174 ;   C flag      1 true, 0 false 
                                   1175 ;-------------------------------------
      0085EF                       1176 is_alpha:
      0085EF A1 41            [ 1] 1177 	cp a,#'A 
      0085F1 8C               [ 1] 1178 	ccf 
      0085F2 24 0B            [ 1] 1179 	jrnc 9$ 
      0085F4 A1 5B            [ 1] 1180 	cp a,#'Z+1 
      0085F6 25 07            [ 1] 1181 	jrc 9$ 
      0085F8 A1 61            [ 1] 1182 	cp a,#'a 
      0085FA 8C               [ 1] 1183 	ccf 
      0085FB 24 02            [ 1] 1184 	jrnc 9$
      0085FD A1 7B            [ 1] 1185 	cp a,#'z+1
      0085FF 81               [ 4] 1186 9$: ret 	
                                   1187 
                                   1188 ;------------------------------------
                                   1189 ; check if character in {'0'..'9'}
                                   1190 ; input:
                                   1191 ;    A  character to test
                                   1192 ; output:
                                   1193 ;    Carry  0 not digit | 1 digit
                                   1194 ;------------------------------------
      008600                       1195 is_digit:
      008600 A1 30            [ 1] 1196 	cp a,#'0
      008602 25 03            [ 1] 1197 	jrc 1$
      008604 A1 3A            [ 1] 1198     cp a,#'9+1
      008606 8C               [ 1] 1199 	ccf 
      008607 8C               [ 1] 1200 1$:	ccf 
      008608 81               [ 4] 1201     ret
                                   1202 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1203 ;-------------------------------------
                                   1204 ; return true if character in  A 
                                   1205 ; is letter or digit.
                                   1206 ; input:
                                   1207 ;   A     ASCII character 
                                   1208 ; output:
                                   1209 ;   A     no change 
                                   1210 ;   Carry    0 false| 1 true 
                                   1211 ;--------------------------------------
      008609                       1212 is_alnum:
      008609 CD 86 00         [ 4] 1213 	call is_digit
      00860C 25 03            [ 1] 1214 	jrc 1$ 
      00860E CD 85 EF         [ 4] 1215 	call is_alpha
      008611 81               [ 4] 1216 1$:	ret 
                                   1217 
                                   1218 
                                   1219 ;-------------------------------------
                                   1220 ;  program initialization entry point 
                                   1221 ;-------------------------------------
                           000001  1222 	MAJOR=1
                           000000  1223 	MINOR=0
      008612 0A 0A 54 69 6E 79 20  1224 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008658                       1225 cold_start:
                                   1226 ;set stack 
      008658 AE 17 FF         [ 2] 1227 	ldw x,#STACK_EMPTY
      00865B 94               [ 1] 1228 	ldw sp,x   
                                   1229 ; clear all ram 
      00865C 7F               [ 1] 1230 0$: clr (x)
      00865D 5A               [ 2] 1231 	decw x 
      00865E 26 FC            [ 1] 1232 	jrne 0$
                                   1233 ; activate pull up on all inputs 
      008660 A6 FF            [ 1] 1234 	ld a,#255 
      008662 C7 50 03         [ 1] 1235 	ld PA_CR1,a 
      008665 C7 50 08         [ 1] 1236 	ld PB_CR1,a 
      008668 C7 50 0D         [ 1] 1237 	ld PC_CR1,a 
      00866B C7 50 12         [ 1] 1238 	ld PD_CR1,a 
      00866E C7 50 17         [ 1] 1239 	ld PE_CR1,a 
      008671 C7 50 1C         [ 1] 1240 	ld PF_CR1,a 
      008674 C7 50 21         [ 1] 1241 	ld PG_CR1,a 
      008677 C7 50 2B         [ 1] 1242 	ld PI_CR1,a
                                   1243 ; set LD2 pin as output and turn it on
      00867A 72 1A 50 0D      [ 1] 1244     bset PC_CR1,#LED2_BIT
      00867E 72 1A 50 0E      [ 1] 1245     bset PC_CR2,#LED2_BIT
      008682 72 1A 50 0C      [ 1] 1246     bset PC_DDR,#LED2_BIT
      008686 72 1A 50 0A      [ 1] 1247 	bset PC_ODR,#LED2_BIT 
                                   1248 ; disable schmitt triggers on Arduino CN4 analog inputs
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00868A 55 00 3F 54 07   [ 1] 1249 	mov ADC_TDRL,0x3f
                                   1250 ; disable peripherals clocks
                                   1251 ;	clr CLK_PCKENR1 
                                   1252 ;	clr CLK_PCKENR2
      00868F 72 5F 50 F2      [ 1] 1253 	clr AWU_TBR 
      008693 72 14 50 CA      [ 1] 1254 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1255 ; select internal clock no divisor: 16 Mhz 	
      008697 A6 E1            [ 1] 1256 	ld a,#CLK_SWR_HSI 
      008699 5F               [ 1] 1257 	clrw x  
      00869A CD 81 35         [ 4] 1258     call clock_init 
      00869D CD 81 58         [ 4] 1259 	call timer4_init
      0086A0 CD 81 4B         [ 4] 1260 	call timer2_init
                                   1261 ; UART1 at 115200 BAUD
      0086A3 CD 82 FD         [ 4] 1262 	call uart1_init
                                   1263 ; activate PE_4 (user button interrupt)
      0086A6 72 18 50 18      [ 1] 1264     bset PE_CR2,#USR_BTN_BIT 
                                   1265 ; display system information
      0086AA AE 86 12         [ 2] 1266 	ldw x,#software 
      0086AD CD A7 C0         [ 4] 1267 	call puts 
      0086B0 A6 01            [ 1] 1268 	ld a,#MAJOR 
      0086B2 C7 00 0E         [ 1] 1269 	ld acc8,a 
      0086B5 5F               [ 1] 1270 	clrw x 
      0086B6 CF 00 0C         [ 2] 1271 	ldw acc24,x
      0086B9 72 5F 00 25      [ 1] 1272 	clr tab_width  
      0086BD 35 0A 00 0B      [ 1] 1273 	mov base, #10 
      0086C1 CD 8A 52         [ 4] 1274 	call prti24 
      0086C4 A6 2E            [ 1] 1275 	ld a,#'.
      0086C6 CD 83 40         [ 4] 1276 	call putc 
      0086C9 A6 00            [ 1] 1277 	ld a,#MINOR 
      0086CB C7 00 0E         [ 1] 1278 	ld acc8,a 
      0086CE 5F               [ 1] 1279 	clrw x 
      0086CF CF 00 0C         [ 2] 1280 	ldw acc24,x 
      0086D2 CD 8A 52         [ 4] 1281 	call prti24
      0086D5 A6 0D            [ 1] 1282 	ld a,#CR 
      0086D7 CD 83 40         [ 4] 1283 	call putc
      0086DA CD 9A 48         [ 4] 1284 	call seek_fdrive 
      0086DD 9A               [ 1] 1285 	rim 
      0086DE 72 5C 00 16      [ 1] 1286 	inc seedy+1 
      0086E2 72 5C 00 14      [ 1] 1287 	inc seedx+1 
      0086E6 CD 87 67         [ 4] 1288 	call clear_basic
      0086E9 CD 92 80         [ 4] 1289 	call ubound 
                                   1290 ;	jra 2$	
      0086EC CD 98 96         [ 4] 1291 	call beep_1khz  
      0086EF 72 1B 50 0A      [ 1] 1292 2$:	bres PC_ODR,#LED2_BIT	
      0086F3 CD 86 FC         [ 4] 1293 	call warm_init
      0086F6 CD 87 29         [ 4] 1294 	call load_autorun
      0086F9 CC 89 85         [ 2] 1295     jp cmd_line  
                                   1296 
      0086FC                       1297 warm_init:
      0086FC 72 5F 00 24      [ 1] 1298 	clr flags 
      008700 72 5F 00 21      [ 1] 1299 	clr loop_depth 
      008704 35 04 00 25      [ 1] 1300 	mov tab_width,#TAB_WIDTH 
      008708 35 0A 00 0B      [ 1] 1301 	mov base,#10 
      00870C AE 00 00         [ 2] 1302 	ldw x,#0 
      00870F CF 00 05         [ 2] 1303 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008712 CF 00 01         [ 2] 1304 	ldw in.w,x 
      008715 72 5F 00 04      [ 1] 1305 	clr count
      008719 81               [ 4] 1306 	ret 
                                   1307 
                                   1308 ;--------------------------
                                   1309 ; called by tb_error when
                                   1310 ; flag FAUTORUN is set.
                                   1311 ; There is a bug in autorun 
                                   1312 ; program so cancel it.
                                   1313 ;---------------------------
      00871A                       1314 cancel_autorun:
      00871A AE 40 00         [ 2] 1315 	ldw x,#AUTORUN_NAME 
      00871D CF 00 18         [ 2] 1316 	ldw farptr+1,x 
      008720 4F               [ 1] 1317 	clr a
      008721 5F               [ 1] 1318 	clrw x  
      008722 C7 00 17         [ 1] 1319 	ld farptr,a 
      008725 CD 82 65         [ 4] 1320 	call write_byte 
      008728 81               [ 4] 1321 	ret 
                                   1322 
                                   1323 
                                   1324 ;--------------------------
                                   1325 ; if autorun file defined 
                                   1326 ; in eeprom address AUTORUN_NAME 
                                   1327 ; load and run it.
                                   1328 ;-------------------------
      008729                       1329 load_autorun:
      008729 90 AE 40 00      [ 2] 1330 	ldw y,#AUTORUN_NAME
      00872D 90 F6            [ 1] 1331 	ld a,(y)
      00872F 27 20            [ 1] 1332 	jreq 9$
      008731 CD 9A AE         [ 4] 1333 	call search_file
      008734 25 05            [ 1] 1334 	jrc 2$ 
                                   1335 ; if file doesn't exit
      008736 CD 87 1A         [ 4] 1336 	call cancel_autorun
      008739 20 16            [ 2] 1337 	jra 9$ 
      00873B CD 9B C4         [ 4] 1338 2$:	call load_file
      00873E AE 40 00         [ 2] 1339 	ldw x,#AUTORUN_NAME 
      008741 CD A7 C0         [ 4] 1340 	call puts
      008744 AE 87 52         [ 2] 1341 	ldw x,#autorun_msg 
      008747 CD A7 C0         [ 4] 1342 	call puts 
      00874A 72 1C 00 24      [ 1] 1343 	bset flags,#FAUTORUN 
      00874E CC 98 68         [ 2] 1344 	jp run_it    
      008751 81               [ 4] 1345 9$: ret 	
                                   1346 
      008752 20 6C 6F 61 64 65 64  1347 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1348 ;---------------------------
                                   1349 ; reset BASIC text variables 
                                   1350 ; and clear variables 
                                   1351 ;---------------------------
      008767                       1352 clear_basic:
      008767 72 5F 00 04      [ 1] 1353 	clr count
      00876B 72 5F 00 02      [ 1] 1354 	clr in  
      00876F AE 00 64         [ 2] 1355 	ldw x,#free_ram 
      008772 CF 00 1D         [ 2] 1356 	ldw txtbgn,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008775 CF 00 1F         [ 2] 1357 	ldw txtend,x 
      008778 CD 85 E1         [ 4] 1358 	call clear_vars 
      00877B 81               [ 4] 1359 	ret 
                                   1360 
                                   1361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1362 ;;   Tiny BASIC error messages     ;;
                                   1363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00877C                       1364 err_msg:
      00877C 00 00 87 9C 87 A9 87  1365 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B7 87 D0 87 DF
      008788 87 F5 88 0B 88 25 88  1366 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             36 88 47
      008792 88 53 88 86 88 96 88  1367 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             AA 88 BD
                                   1368 
      00879C 4D 65 6D 6F 72 79 20  1369 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      0087A9 73 79 6E 74 61 78 20  1370 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0087B7 6D 61 74 68 20 6F 70  1371 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0087D0 64 69 76 69 73 69 6F  1372 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0087DF 69 6E 76 61 6C 69 64  1373 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087F5 72 75 6E 20 74 69 6D  1374 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00880B 63 6F 6D 6D 61 6E 64  1375 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      008825 64 75 70 6C 69 63 61  1376 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      008836 46 69 6C 65 20 6E 6F  1377 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      008847 62 61 64 20 76 61 6C  1378 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      008853 46 69 6C 65 20 69 6E  1379 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      008886 4E 6F 20 64 61 74 61  1380 err_no_data: .asciz "No data found.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  20-Bits]



             20 66 6F 75 6E 64 2E
             0A 00
      00888E 66 6F 75 6E 64 2E 0A  1381 err_no_prog: .asciz "No program in RAM!\n"
             00 4E 6F 20 70 72 6F
             67 72 61 6D 20 69
      0088A2 6E 20 52 41 4D 21 0A  1382 err_no_fspace: .asciz "File system full.\n" 
             00 46 69 6C 65 20 73
             79 73 74 65 6D
      0088B5 20 66 75 6C 6C 2E 0A  1383 err_buf_full: .asciz "Buffer full\n"
             00 42 75 66 66 65
                                   1384 
      0088C2 72 20 66 75 6C 6C 0A  1385 rt_msg: .asciz "run time error, "
             00 72 75 6E 20 74 69
             6D 65 20
      0088D3 65 72 72 6F 72 2C 20  1386 comp_msg: .asciz "compile error, "
             00 63 6F 6D 70 69 6C
             65 20
      0088E3 65 72 72 6F 72 2C 20  1387 tk_id: .asciz "last token id: "
             00 6C 61 73 74 20 74
             6F 6B
                                   1388 
      00087B                       1389 syntax_error:
      0088F3 65 6E            [ 1] 1390 	ld a,#ERR_SYNTAX 
                                   1391 
      00087D                       1392 tb_error:
      0088F5 20 69 64 3A 20   [ 2] 1393 	btjt flags,#FCOMP,1$
      0088FA 00               [ 1] 1394 	push a 
      0088FB AE 08 4A         [ 2] 1395 	ldw x, #rt_msg 
      0088FB A6 02 00         [ 4] 1396 	call puts 
      0088FD 84               [ 1] 1397 	pop a 
      0088FD 72 0A 00         [ 2] 1398 	ldw x, #err_msg 
      008900 24 47 88 AE      [ 1] 1399 	clr acc16 
      008904 88               [ 1] 1400 	sll a
      008905 CA CD A7 C0      [ 1] 1401 	rlc acc16  
      008909 84 AE 87         [ 1] 1402 	ld acc8, a 
      00890C 7C 72 5F 00      [ 2] 1403 	addw x,acc16 
      008910 0D               [ 2] 1404 	ldw x,(x)
      008911 48 72 59         [ 4] 1405 	call puts
      008914 00 0D C7         [ 2] 1406 	ldw x,basicptr
      008917 00 0E 72         [ 1] 1407 	ld a,in 
      00891A BB 00 0D         [ 4] 1408 	call prt_basic_line
      00891D FE CD A7         [ 2] 1409 	ldw x,#tk_id 
      008920 C0 CE 00         [ 4] 1410 	call puts 
      008923 05 C6 00         [ 1] 1411 	ld a,in.saved 
      008926 02               [ 1] 1412 	clrw x 
      008927 CD               [ 1] 1413 	ld xl,a 
      008928 95 29 AE 88      [ 2] 1414 	addw x,basicptr 
      00892C EB               [ 1] 1415 	ld a,(x)
      00892D CD               [ 1] 1416 	clrw x 
      00892E A7               [ 1] 1417 	ld xl,a 
      00892F C0 C6 00         [ 4] 1418 	call print_int
      008932 03 5F 97 72 BB   [ 2] 1419 	btjf flags,#FAUTORUN ,6$
      008937 00 05 F6         [ 4] 1420 	call cancel_autorun  
      00893A 5F 97            [ 2] 1421 	jra 6$
      0008C9                       1422 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00893C CD               [ 1] 1423 	push a 
      00893D 8A 42 72         [ 2] 1424 	ldw x,#comp_msg
      008940 0D 00 24         [ 4] 1425 	call puts 
      008943 3A               [ 1] 1426 	pop a 
      008944 CD 87 1A         [ 2] 1427 	ldw x, #err_msg 
      008947 20 35 00 0C      [ 1] 1428 	clr acc16 
      008949 48               [ 1] 1429 	sll a
      008949 88 AE 88 DB      [ 1] 1430 	rlc acc16  
      00894D CD A7 C0         [ 1] 1431 	ld acc8, a 
      008950 84 AE 87 7C      [ 2] 1432 	addw x,acc16 
      008954 72               [ 2] 1433 	ldw x,(x)
      008955 5F 00 0D         [ 4] 1434 	call puts
      008958 48 72 59         [ 2] 1435 	ldw x,#tib
      00895B 00 0D C7         [ 4] 1436 	call puts 
      00895E 00 0E            [ 1] 1437 	ld a,#CR 
      008960 72 BB 00         [ 4] 1438 	call putc
      008963 0D FE CD         [ 2] 1439 	ldw x,in.w
      008966 A7 C0 AE         [ 4] 1440 	call spaces
      008969 16 90            [ 1] 1441 	ld a,#'^
      00896B CD A7 C0         [ 4] 1442 	call putc 
      00896E A6 0D CD         [ 2] 1443 6$: ldw x,#STACK_EMPTY 
      008971 83               [ 1] 1444     ldw sp,x
      000902                       1445 warm_start:
      008972 40 CE 00         [ 4] 1446 	call warm_init
                                   1447 ;----------------------------
                                   1448 ;   BASIC interpreter
                                   1449 ;----------------------------
      000905                       1450 cmd_line: ; user interface 
      008975 01 CD            [ 1] 1451 	ld a,#CR 
      008977 A8 2D A6         [ 4] 1452 	call putc 
      00897A 5E CD            [ 1] 1453 	ld a,#'> 
      00897C 83 40 AE         [ 4] 1454 	call putc
      00897F 17 FF 94         [ 4] 1455 	call readln
      008982 72 5D 00 03      [ 1] 1456 	tnz count 
      008982 CD 86            [ 1] 1457 	jreq cmd_line
      008984 FC 04 EE         [ 4] 1458 	call compile
                                   1459 ; if text begin with a line number
                                   1460 ; the compiler set count to zero    
                                   1461 ; so code is not interpreted
      008985 72 5D 00 03      [ 1] 1462 	tnz count 
      008985 A6 0D            [ 1] 1463 	jreq cmd_line
                                   1464 
                                   1465 ; if direct command 
                                   1466 ; it's ready to interpret 
                                   1467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1468 ;; This is the interpreter loop
                                   1469 ;; for each BASIC code line. 
                                   1470 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000921                       1471 interpreter: 
      008987 CD 83 40         [ 1] 1472 	ld a,in 
      00898A A6 3E CD         [ 1] 1473 	cp a,count 
      00898D 83 40            [ 1] 1474 	jrmi interp_loop
      000929                       1475 next_line:
      00898F CD A8 C5 72 5D   [ 2] 1476 	btjf flags, #FRUN, cmd_line
      008994 00 04 27         [ 2] 1477 	ldw x,basicptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008997 ED CD 85 6E      [ 2] 1478 	addw x,in.w 
      00899B 72 5D 00         [ 2] 1479 	cpw x,txtend 
      00899E 04 27            [ 1] 1480 	jrpl warm_start
      0089A0 E4 00 04         [ 2] 1481 	ldw basicptr,x ; start of next line  
      0089A1 E6 02            [ 1] 1482 	ld a,(2,x)
      0089A1 C6 00 02         [ 1] 1483 	ld count,a 
      0089A4 C1 00 04 2B      [ 1] 1484 	mov in,#3 ; skip first 3 bytes of line 
      000946                       1485 interp_loop: 
      0089A8 1D 09 6D         [ 4] 1486 	call next_token
      0089A9 A1 00            [ 1] 1487 	cp a,#TK_NONE 
      0089A9 72 01            [ 1] 1488 	jreq next_line 
      0089AB 00 24            [ 1] 1489 	cp a,#TK_CMD
      0089AD D7 CE            [ 1] 1490 	jrne 1$
      0089AF 00               [ 4] 1491 	call (x) 
      0089B0 05 72            [ 2] 1492 	jra interp_loop 
      000954                       1493 1$:	 
      0089B2 BB 00            [ 1] 1494 	cp a,#TK_VAR
      0089B4 01 C3            [ 1] 1495 	jrne 2$
      0089B6 00 1F 2A         [ 4] 1496 	call let_var  
      0089B9 C8 CF            [ 2] 1497 	jra interp_loop 
      00095D                       1498 2$:	
      0089BB 00 05            [ 1] 1499 	cp a,#TK_ARRAY 
      0089BD E6 02            [ 1] 1500 	jrne 3$
      0089BF C7 00 04         [ 4] 1501 	call let_array 
      0089C2 35 03            [ 2] 1502 	jra interp_loop
      000966                       1503 3$:	
      0089C4 00 02            [ 1] 1504 	cp a,#TK_COLON 
      0089C6 27 DC            [ 1] 1505 	jreq interp_loop 
      0089C6 CD 89 ED         [ 2] 1506 	jp syntax_error 
                                   1507 
                                   1508 		
                                   1509 ;--------------------------
                                   1510 ; extract next token from
                                   1511 ; token list 
                                   1512 ; basicptr -> base address 
                                   1513 ; in  -> offset in list array 
                                   1514 ; output:
                                   1515 ;   A 		token attribute
                                   1516 ;   X 		token value if there is one
                                   1517 ;----------------------------------------
      00096D                       1518 next_token:
      0089C9 A1               [ 1] 1519 	clrw x 
      0089CA 00 27 DC         [ 1] 1520 	ld a,in 
      0089CD A1 80 26         [ 1] 1521 	sub a,count ; don't replace sub by cp!  
      0089D0 03 FD            [ 1] 1522 	jrmi 0$
      0089D2 20               [ 4] 1523 	ret  ; end of BASIC line 
      000977                       1524 0$: 
      0089D3 F2 00 01 00 02   [ 1] 1525 	mov in.saved,in 
      0089D4 90 CE 00 04      [ 2] 1526 	ldw y,basicptr 
      0089D4 A1 85 26         [ 4] 1527 	ld a,([in.w],y)
      0089D7 05 CD 92 B3      [ 1] 1528 	inc in  
      0089DB 20               [ 1] 1529 	tnz a 
      0089DC E9 2B            [ 1] 1530 	jrmi 6$
      0089DD A1 06            [ 1] 1531 	cp a,#TK_ARRAY
      0089DD A1 06            [ 1] 1532 	jrpl 9$  ; no attribute for these
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089DF 26 05            [ 1] 1533 	cp a,#TK_COLON
      0089E1 CD 92            [ 1] 1534 	jreq 9$  
      000992                       1535 1$: ; 
      0089E3 B0 20            [ 1] 1536 	cp a,#TK_CHAR
      0089E5 E0 0B            [ 1] 1537 	jrne 2$
      0089E6 91 D6 00         [ 4] 1538 	ld a,([in.w],y)
      0089E6 A1 01 27 DC      [ 1] 1539 	inc in 
      0089EA CC               [ 1] 1540 	exg a,xl  
      0089EB 88 FB            [ 1] 1541 	ld a,#TK_CHAR
      0089ED 81               [ 4] 1542 	ret
      0089ED 5F C6            [ 1] 1543 2$:	cp a,#TK_QSTR 
      0089EF 00 02            [ 1] 1544 	jrne 9$
      0089F1 C0               [ 1] 1545 	ldw x,y 
      0089F2 00 04 2B 01      [ 2] 1546 	addw x,in.w ; pointer to string 
                                   1547 ; move pointer after string 
      0089F6 81 6D 00         [ 4] 1548 3$:	tnz ([in.w],y)
      0089F7 27 0E            [ 1] 1549 	jreq 8$
      0089F7 55 00 02 00      [ 1] 1550 	inc in 
      0089FB 03 90            [ 2] 1551 	jra 3$
      0009B5                       1552 6$: 
      0089FD CE 00 05         [ 5] 1553 	ldw y,([in.w],y)
      008A00 91               [ 1] 1554 	exgw x,y 
      008A01 D6 01 72 5C      [ 1] 1555 	inc in
      008A05 00 02 4D 2B      [ 1] 1556 8$:	inc in 
      0009C1                       1557 9$: 
      008A09 2B               [ 4] 1558 	ret	
                                   1559 
                                   1560 ;-----------------------------------
                                   1561 ; print a 16 bit integer 
                                   1562 ; using variable 'base' as conversion
                                   1563 ; format.
                                   1564 ; input:
                                   1565 ;   X       integer to print 
                                   1566 ;   'base'    conversion base 
                                   1567 ; output:
                                   1568 ;   none 
                                   1569 ;-----------------------------------
      0009C2                       1570 print_int:
      008A0A A1 06 2A 33      [ 1] 1571 	clr acc24 
      008A0E A1 01 27         [ 2] 1572 	ldw acc16,x 
      008A11 2F 0F 00 0C 04   [ 2] 1573 	btjf acc16,#7,prti24
      008A12 72 53 00 0B      [ 1] 1574 	cpl acc24 
                                   1575 
                                   1576 ;------------------------------------
                                   1577 ; print integer in acc24 
                                   1578 ; input:
                                   1579 ;	acc24 		integer to print 
                                   1580 ;	'base' 		numerical base for conversion 
                                   1581 ;   'tab_width' field width 
                                   1582 ;  output:
                                   1583 ;    A          string length
                                   1584 ;------------------------------------
      0009D2                       1585 prti24:
      008A12 A1 03 26         [ 4] 1586     call itoa  ; conversion entier en  .asciz
      008A15 0B 91 D6         [ 4] 1587 	call right_align  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A18 01               [ 1] 1588 	push a 
      008A19 72 5C 00         [ 4] 1589 	call puts
      008A1C 02               [ 1] 1590 	pop a 
      008A1D 41               [ 4] 1591     ret	
                                   1592 
                                   1593 ;------------------------------------
                                   1594 ; convert integer in acc24 to string
                                   1595 ; input:
                                   1596 ;   'base'	conversion base 
                                   1597 ;	acc24	integer to convert
                                   1598 ; output:
                                   1599 ;   X  		pointer to first char of string
                                   1600 ;   A       string length
                                   1601 ;------------------------------------
                           000001  1602 	SIGN=1  ; integer sign 
                           000002  1603 	LEN=2 
                           000003  1604 	PSTR=3
                           000004  1605 	VSIZE=4 ;locals size
      0009DE                       1606 itoa:
      0009DE                       1607 	_vars VSIZE
      008A1E A6 03            [ 2]    1     sub sp,#VSIZE 
      008A20 81 A1            [ 1] 1608 	clr (LEN,sp) ; string length  
      008A22 02 26            [ 1] 1609 	clr (SIGN,sp)    ; sign
      008A24 1C 93 72         [ 1] 1610 	ld a,base 
      008A27 BB 00            [ 1] 1611 	cp a,#10
      008A29 01 91            [ 1] 1612 	jrne 1$
                                   1613 	; base 10 string display with negative sign if bit 23==1
      008A2B 6D 01 27 0E 72   [ 2] 1614 	btjf acc24,#7,1$
      008A30 5C 00            [ 1] 1615 	cpl (SIGN,sp)
      008A32 02 20 F5         [ 4] 1616 	call neg_acc24
      008A35                       1617 1$:
                                   1618 ; initialize string pointer 
      008A35 91 DE 01         [ 2] 1619 	ldw x,#tib 
      008A38 51 72 5C         [ 2] 1620 	addw x,#TIB_SIZE
      008A3B 00               [ 2] 1621 	decw x 
      008A3C 02               [ 1] 1622 	clr (x)
      0009FD                       1623 itoa_loop:
      008A3D 72 5C 00         [ 1] 1624     ld a,base
      008A40 02 03            [ 2] 1625 	ldw (PSTR,sp),x 
      008A41 CD 0A 38         [ 4] 1626     call divu24_8 ; acc24/A 
      008A41 81 03            [ 2] 1627 	ldw x,(PSTR,sp)
      008A42 AB 30            [ 1] 1628     add a,#'0  ; remainder of division
      008A42 72 5F            [ 1] 1629     cp a,#'9+1
      008A44 00 0C            [ 1] 1630     jrmi 2$
      008A46 CF 00            [ 1] 1631     add a,#7 
      000A0F                       1632 2$:	
      008A48 0D               [ 2] 1633 	decw x
      008A49 72               [ 1] 1634     ld (x),a
      008A4A 0F 00            [ 1] 1635 	inc (LEN,sp)
                                   1636 	; if acc24==0 conversion done
      008A4C 0D 04 72         [ 1] 1637 	ld a,acc24
      008A4F 53 00 0C         [ 1] 1638 	or a,acc16
      008A52 CA 00 0D         [ 1] 1639 	or a,acc8
      008A52 CD 8A            [ 1] 1640     jrne itoa_loop
                                   1641 	;conversion done, next add '$' or '-' as required
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A54 5E CD 93         [ 1] 1642 	ld a,base 
      008A57 70 88            [ 1] 1643 	cp a,#16
      008A59 CD A7            [ 1] 1644 	jreq 8$
      008A5B C0 84            [ 1] 1645 	ld a,(SIGN,sp)
      008A5D 81 0A            [ 1] 1646     jreq 10$
      008A5E A6 2D            [ 1] 1647     ld a,#'-
      008A5E 52 04            [ 2] 1648 	jra 9$ 
      008A60 0F 02            [ 1] 1649 8$: ld a,#'$ 
      008A62 0F               [ 2] 1650 9$: decw x
      008A63 01               [ 1] 1651     ld (x),a
      008A64 C6 00            [ 1] 1652 	inc (LEN,sp)
      000A33                       1653 10$:
      008A66 0B A1            [ 1] 1654 	ld a,(LEN,sp)
      000A35                       1655 	_drop VSIZE
      008A68 0A 26            [ 2]    1     addw sp,#VSIZE 
      008A6A 0A               [ 4] 1656 	ret
                                   1657 
                                   1658 ;-------------------------------------
                                   1659 ; divide uint24_t by uint8_t
                                   1660 ; used to convert uint24_t to string
                                   1661 ; input:
                                   1662 ;	acc24	dividend
                                   1663 ;   A 		divisor
                                   1664 ; output:
                                   1665 ;   acc24	quotient
                                   1666 ;   A		remainder
                                   1667 ;------------------------------------- 
                                   1668 ; offset  on sp of arguments and locals
                           000001  1669 	U8   = 1   ; divisor on stack
                           000001  1670 	VSIZE =1
      000A38                       1671 divu24_8:
      008A6B 72               [ 2] 1672 	pushw x ; save x
      008A6C 0F               [ 1] 1673 	push a 
                                   1674 	; ld dividend UU:MM bytes in X
      008A6D 00 0C 05         [ 1] 1675 	ld a, acc24
      008A70 03               [ 1] 1676 	ld xh,a
      008A71 01 CD 8B         [ 1] 1677 	ld a,acc24+1
      008A74 1A               [ 1] 1678 	ld xl,a
      008A75 7B 01            [ 1] 1679 	ld a,(U8,SP) ; divisor
      008A75 AE               [ 2] 1680 	div x,a ; UU:MM/U8
      008A76 16               [ 1] 1681 	push a  ;save remainder
      008A77 90               [ 1] 1682 	ld a,xh
      008A78 1C 00 50         [ 1] 1683 	ld acc24,a
      008A7B 5A               [ 1] 1684 	ld a,xl
      008A7C 7F 00 0C         [ 1] 1685 	ld acc24+1,a
      008A7D 84               [ 1] 1686 	pop a
      008A7D C6               [ 1] 1687 	ld xh,a
      008A7E 00 0B 1F         [ 1] 1688 	ld a,acc24+2
      008A81 03               [ 1] 1689 	ld xl,a
      008A82 CD 8A            [ 1] 1690 	ld a,(U8,sp) ; divisor
      008A84 B8               [ 2] 1691 	div x,a  ; R:LL/U8
      008A85 1E 03            [ 1] 1692 	ld (U8,sp),a ; save remainder
      008A87 AB               [ 1] 1693 	ld a,xl
      008A88 30 A1 3A         [ 1] 1694 	ld acc24+2,a
      008A8B 2B               [ 1] 1695 	pop a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A8C 02               [ 2] 1696 	popw x
      008A8D AB               [ 4] 1697 	ret
                                   1698 
                                   1699 ;--------------------------------------
                                   1700 ; unsigned multiply uint24_t by uint8_t
                                   1701 ; use to convert numerical string to uint24_t
                                   1702 ; input:
                                   1703 ;	acc24	uint24_t 
                                   1704 ;   A		uint8_t
                                   1705 ; output:
                                   1706 ;   acc24   A*acc24
                                   1707 ;-------------------------------------
                                   1708 ; local variables offset  on sp
                           000003  1709 	U8   = 3   ; A pushed on stack
                           000002  1710 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1711 	OVFH = 1  ; multiplication overflow high byte
                           000003  1712 	VSIZE = 3
      000A60                       1713 mulu24_8:
      008A8E 07               [ 2] 1714 	pushw x    ; save X
                                   1715 	; local variables
      008A8F 88               [ 1] 1716 	push a     ; U8
      008A8F 5A               [ 1] 1717 	clrw x     ; initialize overflow to 0
      008A90 F7               [ 2] 1718 	pushw x    ; multiplication overflow
                                   1719 ; multiply low byte.
      008A91 0C 02 C6         [ 1] 1720 	ld a,acc24+2
      008A94 00               [ 1] 1721 	ld xl,a
      008A95 0C CA            [ 1] 1722 	ld a,(U8,sp)
      008A97 00               [ 4] 1723 	mul x,a
      008A98 0D               [ 1] 1724 	ld a,xl
      008A99 CA 00 0E         [ 1] 1725 	ld acc24+2,a
      008A9C 26               [ 1] 1726 	ld a, xh
      008A9D DF C6            [ 1] 1727 	ld (OVFL,sp),a
                                   1728 ; multipy middle byte
      008A9F 00 0B A1         [ 1] 1729 	ld a,acc24+1
      008AA2 10               [ 1] 1730 	ld xl,a
      008AA3 27 08            [ 1] 1731 	ld a, (U8,sp)
      008AA5 7B               [ 4] 1732 	mul x,a
                                   1733 ; add overflow to this partial product
      008AA6 01 27 0A         [ 2] 1734 	addw x,(OVFH,sp)
      008AA9 A6               [ 1] 1735 	ld a,xl
      008AAA 2D 20 02         [ 1] 1736 	ld acc24+1,a
      008AAD A6               [ 1] 1737 	clr a
      008AAE 24 5A            [ 1] 1738 	adc a,#0
      008AB0 F7 0C            [ 1] 1739 	ld (OVFH,sp),a
      008AB2 02               [ 1] 1740 	ld a,xh
      008AB3 6B 02            [ 1] 1741 	ld (OVFL,sp),a
                                   1742 ; multiply most signficant byte	
      008AB3 7B 02 5B         [ 1] 1743 	ld a, acc24
      008AB6 04               [ 1] 1744 	ld xl, a
      008AB7 81 03            [ 1] 1745 	ld a, (U8,sp)
      008AB8 42               [ 4] 1746 	mul x,a
      008AB8 89 88 C6         [ 2] 1747 	addw x, (OVFH,sp)
      008ABB 00               [ 1] 1748 	ld a, xl
      008ABC 0C 95 C6         [ 1] 1749 	ld acc24,a
      008ABF 00 0D            [ 2] 1750     addw sp,#VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AC1 97               [ 2] 1751 	popw x
      008AC2 7B               [ 4] 1752 	ret
                                   1753 
                                   1754 ;------------------------------------
                                   1755 ;  two's complement acc24
                                   1756 ;  input:
                                   1757 ;		acc24 variable
                                   1758 ;  output:
                                   1759 ;		acc24 variable
                                   1760 ;-------------------------------------
      000A9A                       1761 neg_acc24:
      008AC3 01 62 88 9E      [ 1] 1762 	cpl acc24+2
      008AC7 C7 00 0C 9F      [ 1] 1763 	cpl acc24+1
      008ACB C7 00 0D 84      [ 1] 1764 	cpl acc24
      008ACF 95 C6            [ 1] 1765 	ld a,#1
      008AD1 00 0E 97         [ 1] 1766 	add a,acc24+2
      008AD4 7B 01 62         [ 1] 1767 	ld acc24+2,a
      008AD7 6B               [ 1] 1768 	clr a
      008AD8 01 9F C7         [ 1] 1769 	adc a,acc24+1
      008ADB 00 0E 84         [ 1] 1770 	ld acc24+1,a 
      008ADE 85               [ 1] 1771 	clr a 
      008ADF 81 00 0B         [ 1] 1772 	adc a,acc24 
      008AE0 C7 00 0B         [ 1] 1773 	ld acc24,a 
      008AE0 89               [ 4] 1774 	ret
                                   1775 
                                   1776 
                                   1777 
                                   1778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1779 ;; compiler routines        ;;
                                   1780 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1781 ;------------------------------------
                                   1782 ; parse quoted string 
                                   1783 ; input:
                                   1784 ;   Y 	pointer to tib 
                                   1785 ;   X   pointer to output buffer 
                                   1786 ; output:
                                   1787 ;	buffer   parsed string
                                   1788 ;------------------------------------
                           000001  1789 	PREV = 1
                           000002  1790 	CURR =2
                           000002  1791 	VSIZE=2
      000ABD                       1792 parse_quote: 
      000ABD                       1793 	_vars VSIZE 
      008AE1 88 5F            [ 2]    1     sub sp,#VSIZE 
      008AE3 89               [ 1] 1794 	clr a
      008AE4 C6 00            [ 1] 1795 1$:	ld (PREV,sp),a 
      000AC2                       1796 2$:	
      008AE6 0E 97 7B         [ 4] 1797 	ld a,([in.w],y)
      008AE9 03 42            [ 1] 1798 	jreq 6$
      008AEB 9F C7 00 0E      [ 1] 1799 	inc in 
      008AEF 9E 6B            [ 1] 1800 	ld (CURR,sp),a 
      008AF1 02 C6            [ 1] 1801 	ld a,#'\
      008AF3 00 0D            [ 1] 1802 	cp a, (PREV,sp)
      008AF5 97 7B            [ 1] 1803 	jrne 3$
      008AF7 03 42            [ 1] 1804 	clr (PREV,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AF9 72 FB            [ 1] 1805 	ld a,(CURR,sp)
      008AFB 01 9F            [ 4] 1806 	callr convert_escape
      008AFD C7               [ 1] 1807 	ld (x),a 
      008AFE 00               [ 2] 1808 	incw x 
      008AFF 0D 4F            [ 2] 1809 	jra 2$
      000ADD                       1810 3$:
      008B01 A9 00            [ 1] 1811 	ld a,(CURR,sp)
      008B03 6B 01            [ 1] 1812 	cp a,#'\'
      008B05 9E 6B            [ 1] 1813 	jreq 1$
      008B07 02 C6            [ 1] 1814 	cp a,#'"
      008B09 00 0C            [ 1] 1815 	jreq 6$ 
      008B0B 97               [ 1] 1816 	ld (x),a 
      008B0C 7B               [ 2] 1817 	incw x 
      008B0D 03 42            [ 2] 1818 	jra 2$
      000AEB                       1819 6$:
      008B0F 72               [ 1] 1820 	clr (x)
      008B10 FB               [ 2] 1821 	incw x 
      008B11 01 9F            [ 1] 1822 	ldw y,x 
      008B13 C7               [ 1] 1823 	clrw x 
      008B14 00 0C            [ 1] 1824 	ld a,#TK_QSTR  
      000AF2                       1825 	_drop VSIZE
      008B16 5B 03            [ 2]    1     addw sp,#VSIZE 
      008B18 85               [ 4] 1826 	ret 
                                   1827 
                                   1828 ;---------------------------------------
                                   1829 ; called by parse_quote
                                   1830 ; subtitute escaped character 
                                   1831 ; by their ASCII value .
                                   1832 ; input:
                                   1833 ;   A  character following '\'
                                   1834 ; output:
                                   1835 ;   A  substitued char or same if not valid.
                                   1836 ;---------------------------------------
      000AF5                       1837 convert_escape:
      008B19 81               [ 2] 1838 	pushw x 
      008B1A AE 0B 0A         [ 2] 1839 	ldw x,#escaped 
      008B1A 72               [ 1] 1840 1$:	cp a,(x)
      008B1B 53 00            [ 1] 1841 	jreq 2$
      008B1D 0E               [ 1] 1842 	tnz (x)
      008B1E 72 53            [ 1] 1843 	jreq 3$
      008B20 00               [ 2] 1844 	incw x 
      008B21 0D 72            [ 2] 1845 	jra 1$
      008B23 53 00 0C         [ 2] 1846 2$: subw x,#escaped 
      008B26 A6               [ 1] 1847 	ld a,xl 
      008B27 01 CB            [ 1] 1848 	add a,#7
      008B29 00               [ 2] 1849 3$:	popw x 
      008B2A 0E               [ 4] 1850 	ret 
                                   1851 
      008B2B C7 00 0E 4F C9 00 0D  1852 escaped: .asciz "abtnvfr"
             C7
                                   1853 
                                   1854 ;-------------------------
                                   1855 ; integer parser 
                                   1856 ; input:
                                   1857 ;   X 		point to output buffer  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1858 ;   Y 		point to tib 
                                   1859 ;   A 	    first digit|'$' 
                                   1860 ; output:  
                                   1861 ;   X 		integer 
                                   1862 ;   A 		TK_INTGR
                                   1863 ;   acc24   24 bits integer 
                                   1864 ;-------------------------
                           000001  1865 	BASE=1
                           000002  1866 	TCHAR=2 
                           000003  1867 	XSAVE=3
                           000004  1868 	VSIZE=4 
      000B12                       1869 parse_integer: ; { -- n }
      008B33 00               [ 2] 1870 	pushw x 	
      008B34 0D 4F            [ 1] 1871 	push #0 ; TCHAR
      008B36 C9 00            [ 1] 1872 	push #10 ; BASE=10
      008B38 0C C7            [ 1] 1873 	cp a,#'$
      008B3A 00 0C            [ 1] 1874 	jrne 2$ 
      000B1B                       1875     _drop #1
      008B3C 81 01            [ 2]    1     addw sp,##1 
      008B3D 4B 10            [ 1] 1876 	push #16  ; BASE=16
      008B3D 52               [ 1] 1877 2$:	ld (x),a 
      008B3E 02               [ 2] 1878 	incw x 
      008B3F 4F 6B 01         [ 4] 1879 	ld a,([in.w],y)
      008B42 72 5C 00 01      [ 1] 1880 	inc in 
      008B42 91 D6 01         [ 4] 1881 	call to_upper 
      008B45 27 24            [ 1] 1882 	ld (TCHAR,sp),a 
      008B47 72 5C 00         [ 4] 1883 	call is_digit 
      008B4A 02 6B            [ 1] 1884 	jrc 2$
      008B4C 02 A6            [ 1] 1885 	ld a,#16 
      008B4E 5C 11            [ 1] 1886 	cp a,(BASE,sp)
      008B50 01 26            [ 1] 1887 	jrne 3$ 
      008B52 0A 0F            [ 1] 1888 	ld a,(TCHAR,sp)
      008B54 01 7B            [ 1] 1889 	cp a,#'A 
      008B56 02 AD            [ 1] 1890 	jrmi 3$ 
      008B58 1C F7            [ 1] 1891 	cp a,#'G 
      008B5A 5C 20            [ 1] 1892 	jrmi 2$ 
      008B5C E5 5A 00 01      [ 1] 1893 3$: dec in 	
      008B5D 7F               [ 1] 1894     clr (x)
      008B5D 7B 02            [ 2] 1895 	ldw x,(XSAVE,sp)
      008B5F A1 5C 27         [ 4] 1896 	call atoi24
      008B62 DD A1            [ 1] 1897 	ldw y,x 
      008B64 22 27 04         [ 2] 1898 	ldw x,acc16 
      008B67 F7 5C            [ 1] 1899 	ld a,#TK_INTGR
      008B69 20 D7            [ 2] 1900 	ldw (y),x 
      008B6B 72 A9 00 02      [ 2] 1901 	addw y,#2
      000B59                       1902 	_drop VSIZE  
      008B6B 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008B6D 90               [ 4] 1903 	ret 	
                                   1904 
                                   1905 ;-------------------------
                                   1906 ; binary integer parser
                                   1907 ; build integer in acc24  
                                   1908 ; input:
                                   1909 ;   X 		point to output buffer  
                                   1910 ;   Y 		point to tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1911 ;   A 	    '&' 
                                   1912 ; output:  
                                   1913 ;   buffer  TK_INTGR integer  
                                   1914 ;   X 		int16 
                                   1915 ;   A 		TK_INTGR
                                   1916 ;   acc24    int24 
                                   1917 ;-------------------------
                           000001  1918 	BINARY=1 ; 24 bits integer 
                           000003  1919 	VSIZE=3
      000B5C                       1920 parse_binary: ; { -- n }
      008B6E 93 5F            [ 1] 1921 	push #0
      008B70 A6 02            [ 1] 1922 	push #0
      008B72 5B 02            [ 1] 1923 	push #0
      000B62                       1924 2$:	
      008B74 81 D6 00         [ 4] 1925 	ld a,([in.w],y)
      008B75 72 5C 00 01      [ 1] 1926 	inc in 
      008B75 89 AE            [ 1] 1927 	cp a,#'0 
      008B77 8B 8A            [ 1] 1928 	jreq 3$
      008B79 F1 27            [ 1] 1929 	cp a,#'1 
      008B7B 06 7D            [ 1] 1930 	jreq 3$ 
      008B7D 27 09            [ 2] 1931 	jra bin_exit 
      008B7F 5C 20            [ 1] 1932 3$: sub a,#'0 
      008B81 F7               [ 1] 1933 	rrc a
      008B82 1D 8B            [ 1] 1934 	rlc (BINARY+2,sp) 
      008B84 8A 9F            [ 1] 1935 	rlc (BINARY+1,sp)
      008B86 AB 07            [ 1] 1936 	rlc (BINARY,sp) 
      008B88 85 81            [ 2] 1937 	jra 2$  
      000B7E                       1938 bin_exit:
      008B8A 61 62 74 6E      [ 1] 1939 	dec in 
      008B8E 76 66            [ 1] 1940 	ldw y,x
      008B90 72 00            [ 1] 1941 	ld a,(BINARY,sp)
      008B92 C7 00 0B         [ 1] 1942 	ld acc24,a 
      008B92 89 4B            [ 2] 1943 	ldw x,(BINARY+1,sp)
      008B94 00 4B 0A         [ 2] 1944 	ldw acc16,x
      008B97 A1 24            [ 2] 1945 	ldw (y),x 
      008B99 26 04 5B 01      [ 2] 1946 	addw y,#2  
      008B9D 4B 10            [ 1] 1947 	ld a,#TK_INTGR 	
      000B96                       1948 	_drop VSIZE 
      008B9F F7 5C            [ 2]    1     addw sp,#VSIZE 
      008BA1 91               [ 4] 1949 	ret
                                   1950 
                                   1951 ;---------------------------
                                   1952 ;  token begin with a letter,
                                   1953 ;  is keyword or variable. 	
                                   1954 ; input:
                                   1955 ;   X 		point to pad 
                                   1956 ;   Y 		point to text
                                   1957 ;   A 	    first letter  
                                   1958 ; output:
                                   1959 ;   X		exec_addr|var_addr 
                                   1960 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1961 ;   pad 	keyword|var_name  
                                   1962 ;--------------------------  
                           000001  1963 	XFIRST=1
                           000002  1964 	VSIZE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      000B99                       1965 parse_keyword: 
      008BA2 D6               [ 2] 1966 	pushw x 
      000B9A                       1967 kw_loop:	
      008BA3 01 72 5C         [ 4] 1968 	call to_upper 
      008BA6 00               [ 1] 1969 	ld (x),a 
      008BA7 02               [ 2] 1970 	incw x 
      008BA8 CD 8E 25         [ 4] 1971 	ld a,([in.w],y)
      008BAB 6B 02 CD 86      [ 1] 1972 	inc in 
      008BAF 00 25 ED         [ 4] 1973 	call is_alpha 
      008BB2 A6 10            [ 1] 1974 	jrc kw_loop
      008BB4 11 01 26 0A      [ 1] 1975 	dec in   
      008BB8 7B               [ 1] 1976 1$: clr (x)
      008BB9 02 A1            [ 2] 1977 	ldw x,(XFIRST,sp) 
      008BBB 41 2B            [ 1] 1978 	ld a,(1,x)
      008BBD 04 A1            [ 1] 1979 	jrne 2$
                                   1980 ; one letter variable name 
      008BBF 47               [ 1] 1981 	ld a,(x) 
      008BC0 2B DD            [ 1] 1982 	sub a,#'A 
      008BC2 72               [ 1] 1983 	sll a 
      008BC3 5A               [ 1] 1984 	push a 
      008BC4 00 02            [ 1] 1985 	push #0
      008BC6 7F 1E 03         [ 2] 1986 	ldw x,#vars 
      008BC9 CD 8E 31         [ 2] 1987 	addw x,(1,sp) ; X=var address 
      000BC3                       1988 	_drop 2 
      008BCC 90 93            [ 2]    1     addw sp,#2 
      008BCE CE 00            [ 1] 1989 	ld a,#TK_VAR 
      008BD0 0D A6            [ 2] 1990 	jra 4$ 
      000BC9                       1991 2$: ; check for keyword, otherwise syntax error.
      000BC9                       1992 	_ldx_dict kword_dict ; dictionary entry point
      008BD2 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008BD5 72 A9            [ 2] 1993 	ldw y,(XFIRST,sp) ; name to search for
      008BD7 00 02 5B         [ 4] 1994 	call search_dict
      008BDA 04               [ 1] 1995 	tnz a
      008BDB 81 03            [ 1] 1996 	jrne 4$ 
      008BDC CC 08 7B         [ 2] 1997 	jp syntax_error
      000BD7                       1998 4$:	
      008BDC 4B 00            [ 2] 1999 	ldw y,(XFIRST,sp)
      008BDE 4B 00            [ 1] 2000 	ld (y),a 
      008BE0 4B 00            [ 2] 2001 	incw y 
      008BE2 90 FF            [ 2] 2002 	ldw (y),x
      008BE2 91 D6 01 72      [ 2] 2003 	addw y,#2  
      000BE3                       2004 	_drop VSIZE 
      008BE6 5C 00            [ 2]    1     addw sp,#VSIZE 
      008BE8 02               [ 4] 2005 	ret  	
                                   2006 
                                   2007 
                                   2008 ;------------------------------------
                                   2009 ; scan text for next token
                                   2010 ; input: 
                                   2011 ;	X 		pointer to buffer where 
                                   2012 ;	        token id and value are copied 
                                   2013 ; use:
                                   2014 ;	Y   pointer to text in tib 
                                   2015 ; output:
                                   2016 ;   A       token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2017 ;   X 		token value
                                   2018 ;   Y       updated position in output buffer   
                                   2019 ;------------------------------------
                                   2020 	; use to check special character 
                                   2021 	.macro _case c t  
                                   2022 	ld a,#c 
                                   2023 	cp a,(TCHAR,sp) 
                                   2024 	jrne t
                                   2025 	.endm 
                                   2026 
                           000001  2027 	TCHAR=1
                           000002  2028 	ATTRIB=2
                           000002  2029 	VSIZE=2
      000BE6                       2030 get_token: 
      000BE6                       2031 	_vars VSIZE
      008BE9 A1 30            [ 2]    1     sub sp,#VSIZE 
                                   2032 ;	ld a,in 
                                   2033 ;	sub a,count
                                   2034 ;   jrmi 0$
                                   2035 ;	clr a 
                                   2036 ;	ret 
      000BE8                       2037 0$: 
      008BEB 27 06 A1 31      [ 2] 2038 	ldw y,#tib    	
      008BEF 27 02            [ 1] 2039 	ld a,#SPACE
      008BF1 20 0B A0         [ 4] 2040 	call skip
      008BF4 30 46 09 03 09   [ 1] 2041 	mov in.saved,in 
      008BF9 02 09 01         [ 4] 2042 	ld a,([in.w],y)
      008BFC 20 E4            [ 1] 2043 	jrne 1$
      008BFE 90 93            [ 1] 2044 	ldw y,x 
      008BFE 72 5A 00         [ 2] 2045 	jp token_exit ; end of line 
      008C01 02 90 93 7B      [ 1] 2046 1$:	inc in 
      008C05 01 C7 00         [ 4] 2047 	call to_upper 
      008C08 0C 1E            [ 1] 2048 	ld (TCHAR,sp),a 
                                   2049 ; check for quoted string
      000C09                       2050 str_tst:  	
      000C09                       2051 	_case '"' nbr_tst
      008C0A 02 CF            [ 1]    1 	ld a,#'"' 
      008C0C 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C0E 90 FF            [ 1]    3 	jrne nbr_tst
      008C10 72 A9            [ 1] 2052 	ld a,#TK_QSTR
      008C12 00               [ 1] 2053 	ld (x),a 
      008C13 02               [ 2] 2054 	incw x 
      008C14 A6 84 5B         [ 4] 2055 	call parse_quote
      008C17 03 81 A2         [ 2] 2056 	jp token_exit
      008C19                       2057 nbr_tst:
                                   2058 ; check for hexadecimal number 
      008C19 89 24            [ 1] 2059 	ld a,#'$'
      008C1A 11 01            [ 1] 2060 	cp a,(TCHAR,sp) 
      008C1A CD 8E            [ 1] 2061 	jreq 1$
                                   2062 ;check for binary number 
      008C1C 25 F7            [ 1] 2063 	ld a,#'&
      008C1E 5C 91            [ 1] 2064 	cp a,(TCHAR,sp)
      008C20 D6 01            [ 1] 2065 	jrne 0$
      008C22 72 5C            [ 1] 2066 	ld a,#TK_INTGR
      008C24 00               [ 1] 2067 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C25 02               [ 2] 2068 	incw x 
      008C26 CD 85 EF         [ 4] 2069 	call parse_binary ; expect binary integer 
      008C29 25 EF 72         [ 2] 2070 	jp token_exit 
                                   2071 ; check for decimal number 	
      008C2C 5A 00            [ 1] 2072 0$:	ld a,(TCHAR,sp)
      008C2E 02 7F 1E         [ 4] 2073 	call is_digit
      008C31 01 E6            [ 1] 2074 	jrnc 3$
      008C33 01 26            [ 1] 2075 1$:	ld a,#TK_INTGR 
      008C35 13               [ 1] 2076 	ld (x),a 
      008C36 F6               [ 2] 2077 	incw x 
      008C37 A0 41            [ 1] 2078 	ld a,(TCHAR,sp)
      008C39 48 88 4B         [ 4] 2079 	call parse_integer 
      008C3C 00 AE 00         [ 2] 2080 	jp token_exit 
      000C42                       2081 3$: 
      000C42                       2082 	_case '(' bkslsh_tst 
      008C3F 30 72            [ 1]    1 	ld a,#'(' 
      008C41 FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C43 5B 02            [ 1]    3 	jrne bkslsh_tst
      008C45 A6 85            [ 1] 2083 	ld a,#TK_LPAREN
      008C47 20 0E 9E         [ 2] 2084 	jp token_char   	
      008C49                       2085 bkslsh_tst: ; character token 
      000C4D                       2086 	_case '\',rparnt_tst
      008C49 AE A7            [ 1]    1 	ld a,#'\' 
      008C4B 00 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4D 01 CD            [ 1]    3 	jrne rparnt_tst
      008C4F 90 2F            [ 1] 2087 	ld a,#TK_CHAR 
      008C51 4D               [ 1] 2088 	ld (x),a 
      008C52 26               [ 2] 2089 	incw x 
      008C53 03 CC 88         [ 4] 2090 	ld a,([in.w],y)
      008C56 FB               [ 1] 2091 	ld (x),a 
      008C57 5C               [ 2] 2092 	incw x
      008C57 16 01            [ 1] 2093 	ldw y,x 	 
      008C59 90 F7 90 5C      [ 1] 2094 	inc in  
      008C5D 90               [ 1] 2095 	clrw x 
      008C5E FF               [ 1] 2096 	ld xl,a 
      008C5F 72 A9            [ 1] 2097 	ld a,#TK_CHAR 
      008C61 00 02 5B         [ 2] 2098 	jp token_exit 
      000C69                       2099 rparnt_tst:		
      000C69                       2100 	_case ')' colon_tst 
      008C64 02 81            [ 1]    1 	ld a,#')' 
      008C66 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C66 52 02            [ 1]    3 	jrne colon_tst
      008C68 A6 08            [ 1] 2101 	ld a,#TK_RPAREN 
      008C68 90 AE 16         [ 2] 2102 	jp token_char
      000C74                       2103 colon_tst:
      000C74                       2104 	_case ':' comma_tst 
      008C6B 90 A6            [ 1]    1 	ld a,#':' 
      008C6D 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6F 8E 9B            [ 1]    3 	jrne comma_tst
      008C71 55 00            [ 1] 2105 	ld a,#TK_COLON 
      008C73 02 00 03         [ 2] 2106 	jp token_char  
      000C7F                       2107 comma_tst:
      000C7F                       2108 	_case COMMA sharp_tst 
      008C76 91 D6            [ 1]    1 	ld a,#COMMA 
      008C78 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C7A 05 90            [ 1]    3 	jrne sharp_tst
      008C7C 93 CC            [ 1] 2109 	ld a,#TK_COMMA
      008C7E 8E 22 72         [ 2] 2110 	jp token_char
      000C8A                       2111 sharp_tst:
      000C8A                       2112 	_case SHARP dash_tst 
      008C81 5C 00            [ 1]    1 	ld a,#SHARP 
      008C83 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C85 8E 25            [ 1]    3 	jrne dash_tst
      008C87 6B 01            [ 1] 2113 	ld a,#TK_SHARP
      008C89 CC 0D 9E         [ 2] 2114 	jp token_char  	 	 
      000C95                       2115 dash_tst: 	
      000C95                       2116 	_case '-' at_tst 
      008C89 A6 22            [ 1]    1 	ld a,#'-' 
      008C8B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8D 26 0A            [ 1]    3 	jrne at_tst
      008C8F A6 02            [ 1] 2117 	ld a,#TK_MINUS  
      008C91 F7 5C CD         [ 2] 2118 	jp token_char 
      000CA0                       2119 at_tst:
      000CA0                       2120 	_case '@' qmark_tst 
      008C94 8B 3D            [ 1]    1 	ld a,#'@' 
      008C96 CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008C98 22 05            [ 1]    3 	jrne qmark_tst
      008C99 A6 06            [ 1] 2121 	ld a,#TK_ARRAY 
      008C99 A6 24 11         [ 2] 2122 	jp token_char
      000CAB                       2123 qmark_tst:
      000CAB                       2124 	_case '?' tick_tst 
      008C9C 01 27            [ 1]    1 	ld a,#'?' 
      008C9E 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA0 26 11            [ 1]    3 	jrne tick_tst
      008CA2 01 26            [ 1] 2125 	ld a,#TK_CMD  
      008CA4 0A               [ 1] 2126 	ld (x),a 
      008CA5 A6               [ 2] 2127 	incw x 
      008CA6 84 F7            [ 1] 2128 	ldw y,x 
      008CA8 5C CD 8B         [ 2] 2129 	ldw x,#print 
      008CAB DC CC            [ 2] 2130 	ldw (y),x 
      008CAD 8E 22 7B 01      [ 2] 2131 	addw y,#2
      008CB1 CD 86 00         [ 2] 2132 	jp token_exit
      000CC3                       2133 tick_tst: ; comment 
      000CC3                       2134 	_case TICK plus_tst 
      008CB4 24 0C            [ 1]    1 	ld a,#TICK 
      008CB6 A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB8 F7 5C            [ 1]    3 	jrne plus_tst
      008CBA 7B 01            [ 1] 2135 	ld a,#TK_CMD
      008CBC CD               [ 1] 2136 	ld (x),a 
      008CBD 8B               [ 2] 2137 	incw x
      008CBE 92 CC 8E 22      [ 2] 2138 	ldw y,#remark
      008CC2 FF               [ 2] 2139 	ldw (x),y 
      008CC2 A6 28 11         [ 2] 2140 	addw x,#2  
      000CD5                       2141 copy_comment:
      008CC5 01 26 05 A6      [ 2] 2142 	ldw y,#tib 
      008CC9 07 CC 8E 1E      [ 2] 2143 	addw y,in.w
      008CCD 90 89            [ 2] 2144 	pushw y
      008CCD A6 5C 11         [ 4] 2145 	call strcpy
      008CD0 01 26 16         [ 2] 2146     subw y,(1,sp)
      008CD3 A6 03            [ 1] 2147 	ld a,yl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CD5 F7 5C 91         [ 1] 2148 	add a,in
      008CD8 D6 01 F7         [ 1] 2149 	ld in,a 
      008CDB 5C 90            [ 2] 2150 	ldw (1,sp),x
      008CDD 93 72 5C         [ 2] 2151 	addw y,(1,sp)
      008CE0 00 02            [ 2] 2152 	incw y 
      000CF4                       2153 	_drop 2 
      008CE2 5F 97            [ 2]    1     addw sp,#2 
      008CE4 A6 03 CC         [ 2] 2154 	ldw x,#remark 
      008CE7 8E 22            [ 1] 2155 	ld a,#TK_CMD 
      008CE9 CC 0D A2         [ 2] 2156 	jp token_exit 
      000CFE                       2157 plus_tst:
      000CFE                       2158 	_case '+' star_tst 
      008CE9 A6 29            [ 1]    1 	ld a,#'+' 
      008CEB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CED 26 05            [ 1]    3 	jrne star_tst
      008CEF A6 08            [ 1] 2159 	ld a,#TK_PLUS  
      008CF1 CC 8E 1E         [ 2] 2160 	jp token_char 
      008CF4                       2161 star_tst:
      000D09                       2162 	_case '*' slash_tst 
      008CF4 A6 3A            [ 1]    1 	ld a,#'*' 
      008CF6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF8 26 05            [ 1]    3 	jrne slash_tst
      008CFA A6 01            [ 1] 2163 	ld a,#TK_MULT 
      008CFC CC 8E 1E         [ 2] 2164 	jp token_char 
      008CFF                       2165 slash_tst: 
      000D14                       2166 	_case '/' prcnt_tst 
      008CFF A6 2C            [ 1]    1 	ld a,#'/' 
      008D01 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D03 26 05            [ 1]    3 	jrne prcnt_tst
      008D05 A6 09            [ 1] 2167 	ld a,#TK_DIV 
      008D07 CC 8E 1E         [ 2] 2168 	jp token_char 
      008D0A                       2169 prcnt_tst:
      000D1F                       2170 	_case '%' eql_tst 
      008D0A A6 23            [ 1]    1 	ld a,#'%' 
      008D0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 26 05            [ 1]    3 	jrne eql_tst
      008D10 A6 0A            [ 1] 2171 	ld a,#TK_MOD
      008D12 CC 8E 1E         [ 2] 2172 	jp token_char  
                                   2173 ; 1 or 2 character tokens 	
      008D15                       2174 eql_tst:
      000D2A                       2175 	_case '=' gt_tst 		
      008D15 A6 2D            [ 1]    1 	ld a,#'=' 
      008D17 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D19 26 05            [ 1]    3 	jrne gt_tst
      008D1B A6 11            [ 1] 2176 	ld a,#TK_EQUAL
      008D1D CC 8E 1E         [ 2] 2177 	jp token_char 
      008D20                       2178 gt_tst:
      000D35                       2179 	_case '>' lt_tst 
      008D20 A6 40            [ 1]    1 	ld a,#'>' 
      008D22 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D24 26 05            [ 1]    3 	jrne lt_tst
      008D26 A6 06            [ 1] 2180 	ld a,#TK_GT 
      008D28 CC 8E            [ 1] 2181 	ld (ATTRIB,sp),a 
      008D2A 1E 5C 00 01      [ 1] 2182 	inc in 
      008D2B 91 D6 00         [ 4] 2183 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D2B A6 3F            [ 1] 2184 	cp a,#'=
      008D2D 11 01            [ 1] 2185 	jrne 1$
      008D2F 26 12            [ 1] 2186 	ld a,#TK_GE 
      008D31 A6 80            [ 2] 2187 	jra token_char  
      008D33 F7 5C            [ 1] 2188 1$: cp a,#'<
      008D35 90 93            [ 1] 2189 	jrne 2$
      008D37 AE 95            [ 1] 2190 	ld a,#TK_NE 
      008D39 49 90            [ 2] 2191 	jra token_char 
      008D3B FF 72 A9 00      [ 1] 2192 2$: dec in
      008D3F 02 CC            [ 1] 2193 	ld a,(ATTRIB,sp)
      008D41 8E 22            [ 2] 2194 	jra token_char 	 
      008D43                       2195 lt_tst:
      000D5E                       2196 	_case '<' other
      008D43 A6 27            [ 1]    1 	ld a,#'<' 
      008D45 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D47 26 35            [ 1]    3 	jrne other
      008D49 A6 80            [ 1] 2197 	ld a,#TK_LT 
      008D4B F7 5C            [ 1] 2198 	ld (ATTRIB,sp),a 
      008D4D 90 AE 96 46      [ 1] 2199 	inc in 
      008D51 FF 1C 00         [ 4] 2200 	ld a,([in.w],y)
      008D54 02 3D            [ 1] 2201 	cp a,#'=
      008D55 26 04            [ 1] 2202 	jrne 1$
      008D55 90 AE            [ 1] 2203 	ld a,#TK_LE 
      008D57 16 90            [ 2] 2204 	jra token_char 
      008D59 72 B9            [ 1] 2205 1$: cp a,#'>
      008D5B 00 01            [ 1] 2206 	jrne 2$
      008D5D 90 89            [ 1] 2207 	ld a,#TK_NE 
      008D5F CD 84            [ 2] 2208 	jra token_char 
      008D61 34 72 F2 01      [ 1] 2209 2$: dec in 
      008D65 90 9F            [ 1] 2210 	ld a,(ATTRIB,sp)
      008D67 CB 00            [ 2] 2211 	jra token_char 	
      000D87                       2212 other: ; not a special character 	 
      008D69 02 C7            [ 1] 2213 	ld a,(TCHAR,sp)
      008D6B 00 02 1F         [ 4] 2214 	call is_alpha 
      008D6E 01 72            [ 1] 2215 	jrc 30$ 
      008D70 F9 01 90         [ 2] 2216 	jp syntax_error 
      000D91                       2217 30$: 
      008D73 5C 5B 02         [ 4] 2218 	call parse_keyword
      008D76 AE 96 46         [ 2] 2219 	cpw x,#remark 
      008D79 A6 80            [ 1] 2220 	jrne token_exit 
      008D7B CC 8E            [ 1] 2221 	ldw y,x 
      008D7D 22 0C D5         [ 2] 2222 	jp copy_comment 
      008D7E                       2223 token_char:
      008D7E A6               [ 1] 2224 	ld (x),a 
      008D7F 2B               [ 2] 2225 	incw x
      008D80 11 01            [ 1] 2226 	ldw y,x 
      000DA2                       2227 token_exit:
      000DA2                       2228 	_drop VSIZE 
      008D82 26 05            [ 2]    1     addw sp,#VSIZE 
      008D84 A6               [ 4] 2229 	ret
                                   2230 
                                   2231 
                                   2232 ;------------------------------------
                                   2233 ; convert alpha to uppercase
                                   2234 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2235 ;    a  character to convert
                                   2236 ; output:
                                   2237 ;    a  uppercase character
                                   2238 ;------------------------------------
      000DA5                       2239 to_upper::
      008D85 10 CC            [ 1] 2240 	cp a,#'a
      008D87 8E 1E            [ 1] 2241 	jrpl 1$
      008D89 81               [ 4] 2242 0$:	ret
      008D89 A6 2A            [ 1] 2243 1$: cp a,#'z	
      008D8B 11 01            [ 1] 2244 	jrugt 0$
      008D8D 26 05            [ 1] 2245 	sub a,#32
      008D8F A6               [ 4] 2246 	ret
                                   2247 	
                                   2248 ;------------------------------------
                                   2249 ; convert pad content in integer
                                   2250 ; input:
                                   2251 ;    x		.asciz to convert
                                   2252 ; output:
                                   2253 ;    acc24      int24_t
                                   2254 ;------------------------------------
                                   2255 	; local variables
                           000001  2256 	SIGN=1 ; 1 byte, 
                           000002  2257 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2258 	TEMP=3 ; 1 byte, temporary storage
                           000003  2259 	VSIZE=3 ; 3 bytes reserved for local storage
      000DB1                       2260 atoi24::
      008D90 20               [ 2] 2261 	pushw x 
      000DB2                       2262 	_vars VSIZE
      008D91 CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2263 	; acc24=0 
      008D93 1E 5F 00 0B      [ 1] 2264 	clr acc24    
      008D94 72 5F 00 0C      [ 1] 2265 	clr acc16
      008D94 A6 2F 11 01      [ 1] 2266 	clr acc8 
      008D98 26 05            [ 1] 2267 	clr (SIGN,sp)
      008D9A A6 21            [ 1] 2268 	ld a,#10
      008D9C CC 8E            [ 1] 2269 	ld (BASE,sp),a ; default base decimal
      008D9E 1E               [ 1] 2270 	ld a,(x)
      008D9F 27 47            [ 1] 2271 	jreq 9$  ; completed if 0
      008D9F A6 25            [ 1] 2272 	cp a,#'-
      008DA1 11 01            [ 1] 2273 	jrne 1$
      008DA3 26 05            [ 1] 2274 	cpl (SIGN,sp)
      008DA5 A6 22            [ 2] 2275 	jra 2$
      008DA7 CC 8E            [ 1] 2276 1$: cp a,#'$
      008DA9 1E 06            [ 1] 2277 	jrne 3$
      008DAA A6 10            [ 1] 2278 	ld a,#16
      008DAA A6 3D            [ 1] 2279 	ld (BASE,sp),a
      008DAC 11               [ 2] 2280 2$:	incw x
      008DAD 01               [ 1] 2281 	ld a,(x)
      000DDB                       2282 3$:	
      008DAE 26 05            [ 1] 2283 	cp a,#'a
      008DB0 A6 32            [ 1] 2284 	jrmi 4$
      008DB2 CC 8E            [ 1] 2285 	sub a,#32
      008DB4 1E 30            [ 1] 2286 4$:	cp a,#'0
      008DB5 2B 2B            [ 1] 2287 	jrmi 9$
      008DB5 A6 3E            [ 1] 2288 	sub a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DB7 11 01            [ 1] 2289 	cp a,#10
      008DB9 26 23            [ 1] 2290 	jrmi 5$
      008DBB A6 31            [ 1] 2291 	sub a,#7
      008DBD 6B 02            [ 1] 2292 	cp a,(BASE,sp)
      008DBF 72 5C            [ 1] 2293 	jrpl 9$
      008DC1 00 02            [ 1] 2294 5$:	ld (TEMP,sp),a
      008DC3 91 D6            [ 1] 2295 	ld a,(BASE,sp)
      008DC5 01 A1 3D         [ 4] 2296 	call mulu24_8
      008DC8 26 04            [ 1] 2297 	ld a,(TEMP,sp)
      008DCA A6 33 20         [ 1] 2298 	add a,acc24+2
      008DCD 50 A1 3C         [ 1] 2299 	ld acc24+2,a
      008DD0 26               [ 1] 2300 	clr a
      008DD1 04 A6 35         [ 1] 2301 	adc a,acc24+1
      008DD4 20 48 72         [ 1] 2302 	ld acc24+1,a
      008DD7 5A               [ 1] 2303 	clr a
      008DD8 00 02 7B         [ 1] 2304 	adc a,acc24
      008DDB 02 20 40         [ 1] 2305 	ld acc24,a
      008DDE 20 C9            [ 2] 2306 	jra 2$
      008DDE A6 3C            [ 1] 2307 9$:	tnz (SIGN,sp)
      008DE0 11 01            [ 1] 2308     jreq atoi_exit
      008DE2 26 23 A6         [ 4] 2309     call neg_acc24
      000E17                       2310 atoi_exit: 
      000E17                       2311 	_drop VSIZE
      008DE5 34 6B            [ 2]    1     addw sp,#VSIZE 
      008DE7 02               [ 2] 2312 	popw x ; restore x
      008DE8 72               [ 4] 2313 	ret
                                   2314 
                                   2315 
                                   2316 ;------------------------------------
                                   2317 ; skip character c in text starting from 'in'
                                   2318 ; input:
                                   2319 ;	 y 		point to text buffer
                                   2320 ;    a 		character to skip
                                   2321 ; output:  
                                   2322 ;	'in' ajusted to new position
                                   2323 ;------------------------------------
                           000001  2324 	C = 1 ; local var
      000E1B                       2325 skip:
      008DE9 5C               [ 1] 2326 	push a
      008DEA 00 02 91         [ 4] 2327 1$:	ld a,([in.w],y)
      008DED D6 01            [ 1] 2328 	jreq 2$
      008DEF A1 3D            [ 1] 2329 	cp a,(C,sp)
      008DF1 26 04            [ 1] 2330 	jrne 2$
      008DF3 A6 36 20 27      [ 1] 2331 	inc in
      008DF7 A1 3E            [ 2] 2332 	jra 1$
      000E2B                       2333 2$: _drop 1 
      008DF9 26 04            [ 2]    1     addw sp,#1 
      008DFB A6               [ 4] 2334 	ret
                                   2335 	
                                   2336 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2337 ;;   TINY BASIC  operators,
                                   2338 ;;   commands and functions 
                                   2339 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2340 
                                   2341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2342 ;;  Arithmetic operators
                                   2343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2344 
                                   2345 ;debug support
                           000001  2346 DEBUG_PRT=1
                           000001  2347 .if DEBUG_PRT 
      000E2E                       2348 printxy:
      008DFC 35 20 1F         [ 1] 2349 	ld a,base 
      008DFF 72               [ 1] 2350 	push a 
      008E00 5A               [ 2] 2351 	pushw x 
      008E01 00 02            [ 2] 2352 	pushw y
      008E03 7B 02 20 17      [ 1] 2353 	mov base,#16 
      008E07 CD 09 C2         [ 4] 2354 	call print_int
      008E07 7B 01            [ 1] 2355 	ld a,#SPACE 
      008E09 CD 85 EF         [ 4] 2356 	call putc  
      008E0C 25 03            [ 2] 2357 	ldw x,(1,sp)
      008E0E CC 88 FB         [ 4] 2358 	call print_int 
      008E11 A6 0D            [ 1] 2359 	ld a,#CR 
      008E11 CD 8C 19         [ 4] 2360 	call putc 
      008E14 A3 96            [ 2] 2361 	popw y 
      008E16 46               [ 2] 2362 	popw x 
      008E17 26               [ 1] 2363 	pop a 
      008E18 09 90 93         [ 1] 2364 	ld base,a 
      008E1B CC               [ 4] 2365 	ret 
                                   2366 .endif 
                                   2367 
                                   2368 
                                   2369 ;--------------------------------------
                                   2370 ;  multiply 2 uint16_t return uint32_t
                                   2371 ;  input:
                                   2372 ;     x       uint16_t 
                                   2373 ;     y       uint16_t 
                                   2374 ;  output:
                                   2375 ;     x       product bits 15..0
                                   2376 ;     y       product bits 31..16 
                                   2377 ;---------------------------------------
                           000001  2378 		U1=1  ; uint16_t 
                           000003  2379 		DBL=3 ; uint32_t
                           000006  2380 		VSIZE=6
      000E53                       2381 umstar:
      000E53                       2382 	_vars VSIZE 
      008E1C 8D 55            [ 2]    1     sub sp,#VSIZE 
      008E1E 1F 01            [ 2] 2383 	ldw (U1,sp),x 
                                   2384 ;initialize bits 31..16 of 
                                   2385 ;product to zero 
      008E1E F7 5C            [ 1] 2386 	clr (DBL,sp)
      008E20 90 93            [ 1] 2387 	clr (DBL+1,sp)
                                   2388 ; produc U1L*U2L 
      008E22 90 9F            [ 1] 2389 	ld a,yl 
      008E22 5B               [ 4] 2390 	mul x,a 
      008E23 02 81            [ 2] 2391 	ldw (DBL+2,sp),x
                                   2392 ; product U1H*U2L 
      008E25 7B 01            [ 1] 2393 	ld a,(U1,sp) ; xh 
      008E25 A1               [ 1] 2394 	ldw x,y
      008E26 61               [ 4] 2395 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E27 2A               [ 1] 2396 	clr a 
      008E28 01 81 A1         [ 2] 2397 	addw x,(DBL+1,sp) 
      008E2B 7A               [ 1] 2398 	clr a 
      008E2C 22 FB            [ 1] 2399 	adc a,(DBL,sp) 
      008E2E A0 20            [ 1] 2400 	ld (DBL,sp),a ; bits 23..17 
      008E30 81 04            [ 2] 2401 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2402 ; product U1L*U2H
      008E31 90 5E            [ 1] 2403 	swapw y 
      008E31 89               [ 1] 2404 	ldw x,y
      008E32 52 03            [ 1] 2405 	ld a,(U1+1,sp)
      008E34 72               [ 4] 2406 	mul x,a
      008E35 5F 00 0C         [ 2] 2407 	addw x,(DBL+1,sp)
      008E38 72               [ 1] 2408 	clr a 
      008E39 5F 00            [ 1] 2409 	adc a,(DBL,sp)
      008E3B 0D 72            [ 1] 2410 	ld (DBL,sp),a 
      008E3D 5F 00            [ 2] 2411 	ldw (DBL+1,sp),x 
                                   2412 ; product U1H*U2H 	
      008E3F 0E 0F            [ 1] 2413 	ld a,(U1,sp)
      008E41 01               [ 1] 2414 	ldw x,y  
      008E42 A6               [ 4] 2415 	mul x,a 
      008E43 0A 6B 02         [ 2] 2416 	addw x,(DBL,sp)
      008E46 F6 27            [ 1] 2417 	ldw y,x 
      008E48 47 A1            [ 2] 2418 	ldw x,(DBL+2,sp)
      000E8A                       2419 	_drop VSIZE 
      008E4A 2D 26            [ 2]    1     addw sp,#VSIZE 
      008E4C 04               [ 4] 2420 	ret
                                   2421 
                                   2422 
                                   2423 ;-------------------------------------
                                   2424 ; multiply 2 integers
                                   2425 ; input:
                                   2426 ;  	x       n1 
                                   2427 ;   y 		n2 
                                   2428 ; output:
                                   2429 ;	X        N1*N2 bits 15..0
                                   2430 ;   Y        N1*N2 bits 31..16 
                                   2431 ;-------------------------------------
                           000001  2432 	SIGN=1
                           000001  2433 	VSIZE=1
      000E8D                       2434 multiply:
      000E8D                       2435 	_vars VSIZE 
      008E4D 03 01            [ 2]    1     sub sp,#VSIZE 
      008E4F 20 08            [ 1] 2436 	clr (SIGN,sp)
      008E51 A1               [ 1] 2437 	ld a,xh 
      008E52 24 26            [ 1] 2438 	and a,#0x80
      008E54 06 A6            [ 1] 2439 	jrpl 1$
      008E56 10 6B            [ 1] 2440 	cpl (SIGN,sp)
      008E58 02               [ 2] 2441 	negw x 
      000E99                       2442 1$:	
      008E59 5C F6            [ 1] 2443 	ld a,yh
      008E5B A4 80            [ 1] 2444 	and a,#0x80  
      008E5B A1 61            [ 1] 2445 	jrpl 2$ 
      008E5D 2B 02            [ 1] 2446 	cpl (SIGN,sp)
      008E5F A0 20            [ 2] 2447 	negw y 
      000EA3                       2448 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E61 A1 30 2B         [ 4] 2449 	call umstar
      008E64 2B A0            [ 1] 2450 	ld a,(SIGN,sp)
      008E66 30 A1            [ 1] 2451 	jreq 3$
      008E68 0A 2B 06         [ 4] 2452 	call dneg 
      000EAD                       2453 3$:	
      000EAD                       2454 	_drop VSIZE 
      008E6B A0 07            [ 2]    1     addw sp,#VSIZE 
      008E6D 11               [ 4] 2455 	ret
                                   2456 
                                   2457 ;--------------------------------------
                                   2458 ; divide uint32_t/uint16_t
                                   2459 ; return:  quotient and remainder 
                                   2460 ; quotient expected to be uint16_t 
                                   2461 ; input:
                                   2462 ;   DBLDIVDND    on stack 
                                   2463 ;   X            divisor 
                                   2464 ; output:
                                   2465 ;   X            quotient 
                                   2466 ;   Y            remainder 
                                   2467 ;---------------------------------------
                           000003  2468 	VSIZE=3
      000EB0                       2469 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EB0                       2470 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2471 	; local variables 
                           000001  2472 	DIVISOR=1 
                           000003  2473 	CNTR=3 
      000EB0                       2474 udiv32_16:
      000EB0                       2475 	_vars VSIZE 
      008E6E 02 2A            [ 2]    1     sub sp,#VSIZE 
      008E70 1F 6B            [ 2] 2476 	ldw (DIVISOR,sp),x	; save divisor 
      008E72 03 7B            [ 2] 2477 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008E74 02 CD            [ 2] 2478 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008E76 8A E0            [ 2] 2479 	tnzw y
      008E78 7B 03            [ 1] 2480 	jrne long_division 
      008E7A CB 00            [ 2] 2481 	ldw y,(DIVISOR,sp)
      008E7C 0E               [ 2] 2482 	divw x,y
      000EBF                       2483 	_drop VSIZE 
      008E7D C7 00            [ 2]    1     addw sp,#VSIZE 
      008E7F 0E               [ 4] 2484 	ret
      000EC2                       2485 long_division:
      008E80 4F               [ 1] 2486 	exgw x,y ; hi in x, lo in y 
      008E81 C9 00            [ 1] 2487 	ld a,#17 
      008E83 0D C7            [ 1] 2488 	ld (CNTR,sp),a
      000EC7                       2489 1$:
      008E85 00 0D            [ 2] 2490 	cpw x,(DIVISOR,sp)
      008E87 4F C9            [ 1] 2491 	jrmi 2$
      008E89 00 0C C7         [ 2] 2492 	subw x,(DIVISOR,sp)
      008E8C 00               [ 1] 2493 2$:	ccf 
      008E8D 0C 20            [ 2] 2494 	rlcw y 
      008E8F C9               [ 2] 2495 	rlcw x 
      008E90 0D 01            [ 1] 2496 	dec (CNTR,sp)
      008E92 27 03            [ 1] 2497 	jrne 1$
      008E94 CD               [ 1] 2498 	exgw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000ED7                       2499 	_drop VSIZE 
      008E95 8B 1A            [ 2]    1     addw sp,#VSIZE 
      008E97 81               [ 4] 2500 	ret
                                   2501 
                                   2502 ;-----------------------------
                                   2503 ; negate double int.
                                   2504 ; input:
                                   2505 ;   x     bits 15..0
                                   2506 ;   y     bits 31..16
                                   2507 ; output: 
                                   2508 ;   x     bits 15..0
                                   2509 ;   y     bits 31..16
                                   2510 ;-----------------------------
      000EDA                       2511 dneg:
      008E97 5B               [ 2] 2512 	cplw x 
      008E98 03 85            [ 2] 2513 	cplw y 
      008E9A 81 00 01         [ 2] 2514 	addw x,#1 
      008E9B 24 02            [ 1] 2515 	jrnc 1$
      008E9B 88 91            [ 2] 2516 	incw y 
      008E9D D6               [ 4] 2517 1$: ret 
                                   2518 
                                   2519 
                                   2520 ;--------------------------------
                                   2521 ; sign extend single to double
                                   2522 ; input:
                                   2523 ;   x    int16_t
                                   2524 ; output:
                                   2525 ;   x    int32_t bits 15..0
                                   2526 ;   y    int32_t bits 31..16
                                   2527 ;--------------------------------
      000EE5                       2528 dbl_sign_extend:
      008E9E 01 27            [ 1] 2529 	clrw y
      008EA0 0A               [ 1] 2530 	ld a,xh 
      008EA1 11 01            [ 1] 2531 	and a,#0x80 
      008EA3 26 06            [ 1] 2532 	jreq 1$
      008EA5 72 5C            [ 2] 2533 	cplw y
      008EA7 00               [ 4] 2534 1$: ret 	
                                   2535 
                                   2536 
                                   2537 ;----------------------------------
                                   2538 ;  euclidian divide dbl/n1 
                                   2539 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2540 ; input:
                                   2541 ;    dbl    int32_t on stack 
                                   2542 ;    x 		n1   int16_t  disivor  
                                   2543 ; output:
                                   2544 ;    X      dbl/x  int16_t 
                                   2545 ;    Y      remainder int16_t 
                                   2546 ;----------------------------------
                           000008  2547 	VSIZE=8
      000EEF                       2548 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000EEF                       2549 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000EEF                       2550 	_arg DIVDNDLO 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2551 	; local variables
                           000001  2552 	DBLHI=1
                           000003  2553 	DBLLO=3 
                           000005  2554 	SDIVSR=5 ; sign divisor
                           000006  2555 	SQUOT=6 ; sign dividend 
                           000007  2556 	DIVISR=7 ; divisor 
      000EEF                       2557 div32_16:
      000EEF                       2558 	_vars VSIZE 
      008EA8 02 20            [ 2]    1     sub sp,#VSIZE 
      008EAA F1 5B            [ 1] 2559 	clr (SDIVSR,sp)
      008EAC 01 81            [ 1] 2560 	clr (SQUOT,sp)
                                   2561 ; copy arguments 
      008EAE 16 0B            [ 2] 2562 	ldw y,(DIVDNDHI,sp)
      008EAE C6 00            [ 2] 2563 	ldw (DBLHI,sp),y
      008EB0 0B 88            [ 2] 2564 	ldw y,(DIVDNDLO,sp)
      008EB2 89 90            [ 2] 2565 	ldw (DBLLO,sp),y 
                                   2566 ; check for 0 divisor
      008EB4 89               [ 2] 2567 	tnzw x 
      008EB5 35 10            [ 1] 2568     jrne 0$
      008EB7 00 0B            [ 1] 2569 	ld a,#ERR_DIV0 
      008EB9 CD 8A 42         [ 2] 2570 	jp tb_error 
                                   2571 ; check divisor sign 	
      008EBC A6               [ 1] 2572 0$:	ld a,xh 
      008EBD 20 CD            [ 1] 2573 	and a,#0x80 
      008EBF 83 40            [ 1] 2574 	jreq 1$
      008EC1 1E 01            [ 1] 2575 	cpl (SDIVSR,sp)
      008EC3 CD 8A            [ 1] 2576 	cpl (SQUOT,sp)
      008EC5 42               [ 2] 2577 	negw x
      008EC6 A6 0D            [ 2] 2578 1$:	ldw (DIVISR,sp),x
                                   2579 ; check dividend sign 	 
      008EC8 CD 83            [ 1] 2580  	ld a,(DBLHI,sp) 
      008ECA 40 90            [ 1] 2581 	and a,#0x80 
      008ECC 85 85            [ 1] 2582 	jreq 2$ 
      008ECE 84 C7            [ 1] 2583 	cpl (SQUOT,sp)
      008ED0 00 0B            [ 2] 2584 	ldw x,(DBLLO,sp)
      008ED2 81 01            [ 2] 2585 	ldw y,(DBLHI,sp)
      008ED3 CD 0E DA         [ 4] 2586 	call dneg 
      008ED3 52 06            [ 2] 2587 	ldw (DBLLO,sp),x 
      008ED5 1F 01            [ 2] 2588 	ldw (DBLHI,sp),y 
      008ED7 0F 03            [ 2] 2589 2$:	ldw x,(DIVISR,sp)
      008ED9 0F 04 90         [ 4] 2590 	call udiv32_16
      008EDC 9F 42            [ 2] 2591 	tnzw y 
      008EDE 1F 05            [ 1] 2592 	jreq 3$ 
                                   2593 ; x=quotient 
                                   2594 ; y=remainder 
                                   2595 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008EE0 7B 01            [ 1] 2596 	ld a,(SQUOT,sp)
      008EE2 93 42            [ 1] 2597 	xor a,(SDIVSR,sp)
      008EE4 4F 72            [ 1] 2598 	jreq 3$
      008EE6 FB               [ 2] 2599 	incw x 
      008EE7 04 4F 19 03      [ 2] 2600 	ldw acc16,y 
      008EEB 6B 03            [ 2] 2601 	ldw y,(DIVISR,sp)
      008EED 1F 04 90 5E      [ 2] 2602 	subw y,acc16
                                   2603 ; sign quotient
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EF1 93 7B            [ 1] 2604 3$:	ld a,(SQUOT,sp)
      008EF3 02 42            [ 1] 2605 	jreq 4$
      008EF5 72               [ 2] 2606 	negw x 
      000F43                       2607 4$:	
      000F43                       2608 	_drop VSIZE 
      008EF6 FB 04            [ 2]    1     addw sp,#VSIZE 
      008EF8 4F               [ 4] 2609 	ret 
                                   2610 
                                   2611 
                                   2612 
                                   2613 ;----------------------------------
                                   2614 ; division x/y 
                                   2615 ; input:
                                   2616 ;    X       dividend
                                   2617 ;    Y       divisor 
                                   2618 ; output:
                                   2619 ;    X       quotient
                                   2620 ;    Y       remainder 
                                   2621 ;-----------------------------------
                           000004  2622 	VSIZE=4 
                                   2623 	; local variables 
                           000001  2624 	DBLHI=1
                           000003  2625 	DBLLO=3
      000F46                       2626 divide: 
      000F46                       2627 	_vars VSIZE 
      008EF9 19 03            [ 2]    1     sub sp,#VSIZE 
      008EFB 6B 03 1F 04      [ 2] 2628 	ldw acc16,y
      008EFF 7B 01 93         [ 4] 2629 	call dbl_sign_extend
      008F02 42 72            [ 2] 2630 	ldw (DBLLO,sp),x 
      008F04 FB 03            [ 2] 2631 	ldw (DBLHI,sp),y 
      008F06 90 93 1E         [ 2] 2632 	ldw x,acc16 
      008F09 05 5B 06         [ 4] 2633 	call div32_16 
      000F59                       2634 	_drop VSIZE 
      008F0C 81 04            [ 2]    1     addw sp,#VSIZE 
      008F0D 81               [ 4] 2635 	ret
                                   2636 
                                   2637 
                                   2638 ;----------------------------------
                                   2639 ;  remainder resulting from euclidian 
                                   2640 ;  division of x/y 
                                   2641 ; input:
                                   2642 ;   x   	dividend int16_t 
                                   2643 ;   y 		divisor int16_t
                                   2644 ; output:
                                   2645 ;   X       n1%n2 
                                   2646 ;----------------------------------
      000F5C                       2647 modulo:
      008F0D 52 01 0F         [ 4] 2648 	call divide
      008F10 01               [ 1] 2649 	ldw x,y 
      008F11 9E               [ 4] 2650 	ret 
                                   2651 
                                   2652 ;----------------------------------
                                   2653 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2654 ; return expr1*expr2/expr3 
                                   2655 ; product result is int32_t and 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2656 ; divisiont is int32_t/int16_t
                                   2657 ;----------------------------------
                           000004  2658 	DBL_SIZE=4 
      000F61                       2659 muldiv:
      008F12 A4 80 2A         [ 4] 2660 	call func_args 
      008F15 03 03            [ 1] 2661 	cp a,#3 
      008F17 01 50            [ 1] 2662 	jreq 1$
      008F19 CC 08 7B         [ 2] 2663 	jp syntax_error
      000F6B                       2664 1$: 
      008F19 90 9E            [ 2] 2665 	ldw x,(5,sp) ; expr1
      008F1B A4 80            [ 2] 2666 	ldw y,(3,sp) ; expr2
      008F1D 2A 04 03         [ 4] 2667 	call multiply 
      008F20 01 90            [ 2] 2668 	ldw (5,sp),x  ;int32_t 15..0
      008F22 50 03            [ 2] 2669 	ldw (3,sp),y  ;int32_t 31..16
      008F23 85               [ 2] 2670 	popw x        ; expr3 
      008F23 CD 8E D3         [ 4] 2671 	call div32_16 ; int32_t/expr3 
      000F7A                       2672 	_drop DBL_SIZE
      008F26 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      008F28 27               [ 4] 2673 	ret 
                                   2674 
                                   2675 
                                   2676 ;----------------------------------
                                   2677 ; search in kword_dict name
                                   2678 ; from its execution address 
                                   2679 ; input:
                                   2680 ;   X       	execution address 
                                   2681 ; output:
                                   2682 ;   X 			cstr*  | 0 
                                   2683 ;--------------------------------
                           000001  2684 	XADR=1 
                           000003  2685 	LINK=3 
                           000004  2686 	VSIZE=4
      000F7D                       2687 cmd_name:
      000F7D                       2688 	_vars VSIZE 
      008F29 03 CD            [ 2]    1     sub sp,#VSIZE 
      008F2B 8F 5A 00 0C      [ 1] 2689 	clr acc16 
      008F2D 1F 01            [ 2] 2690 	ldw (XADR,sp),x  
      008F2D 5B 01 81         [ 2] 2691 	ldw x,#kword_dict	
      008F30 1F 03            [ 2] 2692 1$:	ldw (LINK,sp),x
      008F30 52 03            [ 1] 2693 	ld a,(2,x)
      008F32 1F 01            [ 1] 2694 	and a,#15 
      008F34 1E 08 16         [ 1] 2695 	ld acc8,a 
      008F37 06 90 5D         [ 2] 2696 	addw x,#3
      008F3A 26 06 16 01      [ 2] 2697 	addw x,acc16
      008F3E 65               [ 2] 2698 	ldw x,(x) ; execution address 
      008F3F 5B 03            [ 2] 2699 	cpw x,(XADR,sp)
      008F41 81 0A            [ 1] 2700 	jreq 2$
      008F42 1E 03            [ 2] 2701 	ldw x,(LINK,sp)
      008F42 51               [ 2] 2702 	ldw x,(x) 
      008F43 A6 11 6B         [ 2] 2703 	subw x,#2  
      008F46 03 E3            [ 1] 2704 	jrne 1$
      008F47 20 05            [ 2] 2705 	jra 9$
      008F47 13 01            [ 2] 2706 2$: ldw x,(LINK,sp)
      008F49 2B 03 72         [ 2] 2707 	addw x,#2 	
      000FAC                       2708 9$:	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F4C F0 01            [ 2]    1     addw sp,#VSIZE 
      008F4E 8C               [ 4] 2709 	ret
                                   2710 
                                   2711 
                                   2712 ;---------------------------------
                                   2713 ; dictionary search 
                                   2714 ; input:
                                   2715 ;	X 		dictionary entry point, name field  
                                   2716 ;   y		.asciz name to search 
                                   2717 ; output:
                                   2718 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2719 ;  X		execution address | 0 
                                   2720 ;---------------------------------
                           000001  2721 	NLEN=1 ; cmd length 
                           000002  2722 	XSAVE=2
                           000004  2723 	YSAVE=4
                           000005  2724 	VSIZE=5 
      000FAF                       2725 search_dict:
      000FAF                       2726 	_vars VSIZE 
      008F4F 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2727 
      008F51 59 0A            [ 2] 2728 	ldw (YSAVE,sp),y 
      000FB3                       2729 search_next:
      008F53 03 26            [ 2] 2730 	ldw (XSAVE,sp),x 
                                   2731 ; get name length in dictionary	
      008F55 F1               [ 1] 2732 	ld a,(x)
      008F56 51 5B            [ 1] 2733 	and a,#0xf 
      008F58 03 81            [ 1] 2734 	ld (NLEN,sp),a  
      008F5A 16 04            [ 2] 2735 	ldw y,(YSAVE,sp) ; name pointer 
      008F5A 53               [ 2] 2736 	incw x 
      000FBD                       2737 cp_loop:
      008F5B 90 53            [ 1] 2738 	ld a,(y)
      008F5D 1C 00            [ 1] 2739 	jreq str_match 
      008F5F 01 24            [ 1] 2740 	tnz (NLEN,sp)
      008F61 02 90            [ 1] 2741 	jreq no_match  
      008F63 5C               [ 1] 2742 	cp a,(x)
      008F64 81 07            [ 1] 2743 	jrne no_match 
      008F65 90 5C            [ 2] 2744 	incw y 
      008F65 90               [ 2] 2745 	incw x
      008F66 5F 9E            [ 1] 2746 	dec (NLEN,sp)
      008F68 A4 80            [ 2] 2747 	jra cp_loop 
      000FCF                       2748 no_match:
      008F6A 27 02            [ 2] 2749 	ldw x,(XSAVE,sp) 
      008F6C 90 53 81         [ 2] 2750 	subw x,#2 ; move X to link field
      008F6F 4B 00            [ 1] 2751 	push #TK_NONE 
      008F6F 52               [ 2] 2752 	ldw x,(x) ; next word link 
      008F70 08               [ 1] 2753 	pop a ; TK_NONE 
      008F71 0F 05            [ 1] 2754 	jreq search_exit  ; not found  
                                   2755 ;try next 
      008F73 0F 06            [ 2] 2756 	jra search_next
      000FDC                       2757 str_match:
      008F75 16 0B            [ 2] 2758 	ldw x,(XSAVE,sp)
      008F77 17               [ 1] 2759 	ld a,(X)
      008F78 01 16            [ 1] 2760 	ld (NLEN,sp),a ; needed to test keyword type  
      008F7A 0D 17            [ 1] 2761 	and a,#0xf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2762 ; move x to procedure address field 	
      008F7C 03               [ 1] 2763 	inc a 
      008F7D 5D 26 05         [ 1] 2764 	ld acc8,a 
      008F80 A6 04 CC 88      [ 1] 2765 	clr acc16 
      008F84 FD 9E A4 80      [ 2] 2766 	addw x,acc16 
      008F88 27               [ 2] 2767 	ldw x,(x) ; routine entry point 
                                   2768 ;determine keyword type bits 7:6 
      008F89 05 03            [ 1] 2769 	ld a,(NLEN,sp)
      008F8B 05               [ 1] 2770 	swap a 
      008F8C 03 06            [ 1] 2771 	and a,#0xc
      008F8E 50               [ 1] 2772 	srl a
      008F8F 1F               [ 1] 2773 	srl a 
      008F90 07 7B            [ 1] 2774 	add a,#128
      000FF9                       2775 search_exit: 
      000FF9                       2776 	_drop VSIZE 	 
      008F92 01 A4            [ 2]    1     addw sp,#VSIZE 
      008F94 80               [ 4] 2777 	ret 
                                   2778 
                                   2779 ;---------------------
                                   2780 ; check if next token
                                   2781 ;  is of expected type 
                                   2782 ; input:
                                   2783 ;   A 		 expected token attribute
                                   2784 ;  ouput:
                                   2785 ;   none     if fail call syntax_error 
                                   2786 ;--------------------
      000FFC                       2787 expect:
      008F95 27               [ 1] 2788 	push a 
      008F96 0D 03 06         [ 4] 2789 	call next_token 
      008F99 1E 03            [ 1] 2790 	cp a,(1,sp)
      008F9B 16 01            [ 1] 2791 	jreq 1$
      008F9D CD 8F 5A         [ 2] 2792 	jp syntax_error
      008FA0 1F               [ 1] 2793 1$: pop a 
      008FA1 03               [ 4] 2794 	ret 
                                   2795 
                                   2796 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2797 ; parse arguments list 
                                   2798 ; between ()
                                   2799 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001009                       2800 func_args:
      008FA2 17 01            [ 1] 2801 	ld a,#TK_LPAREN 
      008FA4 1E 07 CD         [ 4] 2802 	call expect 
                                   2803 ; expected to continue in arg_list 
                                   2804 ; caller must check for TK_RPAREN 
                                   2805 
                                   2806 ;-------------------------------
                                   2807 ; parse embedded BASIC routines 
                                   2808 ; arguments list.
                                   2809 ; arg_list::=  rel[','rel]*
                                   2810 ; all arguments are of integer type
                                   2811 ; and pushed on stack 
                                   2812 ; input:
                                   2813 ;   none
                                   2814 ; output:
                                   2815 ;   stack{n}   arguments pushed on stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2816 ;   A 	number of arguments pushed on stack  
                                   2817 ;--------------------------------
      00100E                       2818 arg_list:
      008FA7 8F 30            [ 1] 2819 	push #0  
      008FA9 90 5D 27         [ 4] 2820 1$: call relation
      008FAC 11 7B            [ 1] 2821 	cp a,#TK_NONE 
      008FAE 06 18            [ 1] 2822 	jreq 5$
      008FB0 05 27            [ 1] 2823 	cp a,#TK_INTGR
      008FB2 0B 5C            [ 1] 2824 	jrne 4$
      00101B                       2825 3$: 
                                   2826 ; swap return address with argument
      008FB4 90               [ 1] 2827 	pop a ; arg_count
      008FB5 CF 00            [ 2] 2828 	popw y ; return address 
      008FB7 0D               [ 2] 2829 	pushw x ; new argument 
      008FB8 16 07            [ 2] 2830 	pushw y 
      008FBA 72               [ 1] 2831     inc a
      008FBB B2               [ 1] 2832 	push a 
      008FBC 00 0D 7B         [ 4] 2833 	call next_token 
      008FBF 06 27            [ 1] 2834 	cp a,#TK_COMMA 
      008FC1 01 50            [ 1] 2835 	jreq 1$ 
      008FC3 A1 00            [ 1] 2836 	cp a,#TK_NONE 
      008FC3 5B 08            [ 1] 2837 	jreq 5$ 
      008FC5 81 08            [ 1] 2838 4$:	cp a,#TK_RPAREN 
      008FC6 27 05            [ 1] 2839 	jreq 5$
      001032                       2840 	_unget_token 
      008FC6 52 04 90 CF 00   [ 1]    1     mov in,in.saved
      008FCB 0D               [ 1] 2841 5$:	pop a  
      008FCC CD               [ 4] 2842 	ret 
                                   2843 
                                   2844 ;--------------------------------
                                   2845 ;   BASIC commnands 
                                   2846 ;--------------------------------
                                   2847 
                                   2848 ;--------------------------------
                                   2849 ;  arithmetic and relational 
                                   2850 ;  routines
                                   2851 ;  operators precedence
                                   2852 ;  highest to lowest
                                   2853 ;  operators on same row have 
                                   2854 ;  same precedence and are executed
                                   2855 ;  from left to right.
                                   2856 ;	'*','/','%'
                                   2857 ;   '-','+'
                                   2858 ;   '=','>','<','>=','<=','<>','><'
                                   2859 ;   '<>' and '><' are equivalent for not equal.
                                   2860 ;--------------------------------
                                   2861 
                                   2862 ;---------------------
                                   2863 ; return array element
                                   2864 ; address from @(expr)
                                   2865 ; input:
                                   2866 ;   A 		TK_ARRAY
                                   2867 ; output:
                                   2868 ;   A 		TK_INTGR
                                   2869 ;	X 		element address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2870 ;----------------------
      001039                       2871 get_array_element:
      008FCD 8F 65 1F         [ 4] 2872 	call func_args 
      008FD0 03 17            [ 1] 2873 	cp a,#1
      008FD2 01 CE            [ 1] 2874 	jreq 1$
      008FD4 00 0D CD         [ 2] 2875 	jp syntax_error
      008FD7 8F               [ 2] 2876 1$: popw x 
                                   2877 	; check for bounds 
      008FD8 6F 5B 04         [ 2] 2878 	cpw x,array_size 
      008FDB 81 05            [ 2] 2879 	jrule 3$
                                   2880 ; bounds {1..array_size}	
      008FDC A6 0A            [ 1] 2881 2$: ld a,#ERR_BAD_VALUE 
      008FDC CD 8F C6         [ 2] 2882 	jp tb_error 
      008FDF 93               [ 2] 2883 3$: tnzw  x
      008FE0 81 F8            [ 1] 2884 	jreq 2$ 
      008FE1 58               [ 2] 2885 	sllw x 
      008FE1 CD               [ 2] 2886 	pushw x 
      008FE2 90 89 A1         [ 2] 2887 	ldw x,#tib
      008FE5 03 27 03         [ 2] 2888 	subw x,(1,sp)
      001059                       2889 	_drop 2   
      008FE8 CC 88            [ 2]    1     addw sp,#2 
      008FEA FB 84            [ 1] 2890 	ld a,#TK_INTGR
      008FEB 81               [ 4] 2891 	ret 
                                   2892 
                                   2893 
                                   2894 ;***********************************
                                   2895 ;   expression parse,execute 
                                   2896 ;***********************************
                                   2897 ;-----------------------------------
                                   2898 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2899 ;			 integer | function |
                                   2900 ;			 '('relation')' 
                                   2901 ; output:
                                   2902 ;   A    token attribute 
                                   2903 ;   X 	 integer
                                   2904 ; ---------------------------------
                           000001  2905 	NEG=1
                           000001  2906 	VSIZE=1
      00105E                       2907 factor:
      00105E                       2908 	_vars VSIZE 
      008FEB 1E 05            [ 2]    1     sub sp,#VSIZE 
      008FED 16 03 CD         [ 4] 2909 	call next_token
      008FF0 8F 0D            [ 1] 2910 	cp a,#CMD_END 
      008FF2 1F 05            [ 1] 2911 	jrult 20$
      008FF4 17 03            [ 1] 2912 1$:	ld (NEG,sp),a 
      008FF6 85 CD            [ 1] 2913 	and a,#TK_GRP_MASK
      008FF8 8F 6F            [ 1] 2914 	cp a,#TK_GRP_ADD 
      008FFA 5B 04            [ 1] 2915 	jreq 2$
      008FFC 81 01            [ 1] 2916 	ld a,(NEG,sp)
      008FFD 20 03            [ 2] 2917 	jra 4$  
      001073                       2918 2$:	
      008FFD 52 04 72         [ 4] 2919 	call next_token 
      001076                       2920 4$:	
      009000 5F 00            [ 1] 2921 	cp a,#TK_IFUNC 
      009002 0D 1F            [ 1] 2922 	jrne 5$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009004 01               [ 4] 2923 	call (x) 
      009005 AE A6            [ 2] 2924 	jra 18$ 
      00107D                       2925 5$:
      009007 FE 1F            [ 1] 2926 	cp a,#TK_INTGR
      009009 03 E6            [ 1] 2927 	jrne 6$
      00900B 02 A4            [ 2] 2928 	jra 18$
      001083                       2929 6$:
      00900D 0F C7            [ 1] 2930 	cp a,#TK_ARRAY
      00900F 00 0E            [ 1] 2931 	jrne 10$
      009011 1C 00 03         [ 4] 2932 	call get_array_element
      009014 72               [ 2] 2933 	ldw x,(x)
      009015 BB 00            [ 2] 2934 	jra 18$ 
      00108D                       2935 10$:
      009017 0D FE            [ 1] 2936 	cp a,#TK_VAR 
      009019 13 01            [ 1] 2937 	jrne 12$
      00901B 27               [ 2] 2938 	ldw x,(x)
      00901C 0A 1E            [ 2] 2939 	jra 18$
      001094                       2940 12$:			
      00901E 03 FE            [ 1] 2941 	cp a,#TK_LPAREN
      009020 1D 00            [ 1] 2942 	jrne 16$
      009022 02 26 E3         [ 4] 2943 	call relation
      009025 20               [ 2] 2944 	pushw x 
      009026 05 1E            [ 1] 2945 	ld a,#TK_RPAREN 
      009028 03 1C 00         [ 4] 2946 	call expect
      00902B 02               [ 2] 2947 	popw x 
      00902C 5B 04            [ 2] 2948 	jra 18$	
      0010A4                       2949 16$:
      0010A4                       2950 	_unget_token
      00902E 81 00 02 00 01   [ 1]    1     mov in,in.saved
      00902F 4F               [ 1] 2951 	clr a 
      00902F 52 05            [ 2] 2952 	jra 20$ 
      0010AC                       2953 18$: 
      009031 17 04            [ 1] 2954 	ld a,#TK_MINUS 
      009033 11 01            [ 1] 2955 	cp a,(NEG,sp)
      009033 1F 02            [ 1] 2956 	jrne 19$
      009035 F6               [ 2] 2957 	negw x
      0010B3                       2958 19$:
      009036 A4 0F            [ 1] 2959 	ld a,#TK_INTGR
      0010B5                       2960 20$:
      0010B5                       2961 	_drop VSIZE
      009038 6B 01            [ 2]    1     addw sp,#VSIZE 
      00903A 16               [ 4] 2962 	ret
                                   2963 
                                   2964 ;-----------------------------------
                                   2965 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   2966 ; output:
                                   2967 ;   A    	token attribute 
                                   2968 ;	X		integer
                                   2969 ;-----------------------------------
                           000001  2970 	N1=1   ; int16_t
                           000003  2971 	MULOP=3
                           000003  2972 	VSIZE=3
      0010B8                       2973 term:
      0010B8                       2974 	_vars VSIZE
      00903B 04 5C            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00903D CD 10 5E         [ 4] 2975 	call factor
      00903D 90 F6            [ 1] 2976 	cp a,#CMD_END
      00903F 27 1B            [ 1] 2977 	jrult term_exit
      0010C1                       2978 term01:	 ; check for  operator 
      009041 0D 01            [ 2] 2979 	ldw (N1,sp),x  ; save first factor 
      009043 27 0A F1         [ 4] 2980 	call next_token
      009046 26 07            [ 1] 2981 	cp a,#CMD_END
      009048 90 5C            [ 1] 2982 	jrult 9$
      00904A 5C 0A            [ 1] 2983 0$:	ld (MULOP,sp),a
      00904C 01 20            [ 1] 2984 	and a,#TK_GRP_MASK
      00904E EE 20            [ 1] 2985 	cp a,#TK_GRP_MULT
      00904F 27 07            [ 1] 2986 	jreq 1$
      0010D2                       2987 	_unget_token 
      00904F 1E 02 1D 00 02   [ 1]    1     mov in,in.saved
      009054 4B 00            [ 2] 2988 	jra 9$
      0010D9                       2989 1$:	; got *|/|%
      009056 FE 84 27         [ 4] 2990 	call factor
      009059 1F 20            [ 1] 2991 	cp a,#TK_INTGR
      00905B D7 03            [ 1] 2992 	jreq 2$ 
      00905C CC 08 7B         [ 2] 2993 	jp syntax_error
      00905C 1E 02            [ 1] 2994 2$:	ldw y,x 
      00905E F6 6B            [ 2] 2995 	ldw x,(N1,sp)
      009060 01 A4            [ 1] 2996 	ld a,(MULOP,sp) 
      009062 0F 4C            [ 1] 2997 	cp a,#TK_MULT 
      009064 C7 00            [ 1] 2998 	jrne 3$
      009066 0E 72 5F         [ 4] 2999 	call multiply 
      009069 00 0D            [ 2] 3000 	jra term01
      00906B 72 BB            [ 1] 3001 3$: cp a,#TK_DIV 
      00906D 00 0D            [ 1] 3002 	jrne 4$ 
      00906F FE 7B 01         [ 4] 3003 	call divide 
      009072 4E A4            [ 2] 3004 	jra term01 
      009074 0C 44 44         [ 4] 3005 4$: call modulo
      009077 AB 80            [ 2] 3006 	jra term01 
      009079 1E 01            [ 2] 3007 9$: ldw x,(N1,sp)
      009079 5B 05            [ 1] 3008 	ld a,#TK_INTGR 	
      001104                       3009 term_exit:
      001104                       3010 	_drop VSIZE 
      00907B 81 03            [ 2]    1     addw sp,#VSIZE 
      00907C 81               [ 4] 3011 	ret 
                                   3012 
                                   3013 ;-------------------------------
                                   3014 ;  expr ::= term [['+'|'-'] term]*
                                   3015 ;  result range {-32768..32767}
                                   3016 ;  output:
                                   3017 ;   A    token attribute 
                                   3018 ;   X	 integer   
                                   3019 ;-------------------------------
                           000001  3020 	N1=1 
                           000003  3021 	OP=3 
                           000003  3022 	VSIZE=3 
      001107                       3023 expression:
      001107                       3024 	_vars VSIZE 
      00907C 88 CD            [ 2]    1     sub sp,#VSIZE 
      00907E 89 ED 11         [ 4] 3025 	call term
      009081 01 27            [ 1] 3026 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009083 03 CC            [ 1] 3027 	jrult expr_exit 
      009085 88 FB            [ 2] 3028 0$:	ldw (N1,sp),x 
      009087 84 81 6D         [ 4] 3029 	call next_token
      009089 A1 02            [ 1] 3030 	cp a,#CMD_END 
      009089 A6 07            [ 1] 3031 	jrult 9$ 
      00908B CD 90            [ 1] 3032 1$:	ld (OP,sp),a  
      00908D 7C 30            [ 1] 3033 	and a,#TK_GRP_MASK
      00908E A1 10            [ 1] 3034 	cp a,#TK_GRP_ADD 
      00908E 4B 00            [ 1] 3035 	jreq 2$ 
      001121                       3036 	_unget_token
      009090 CD 91 D0 A1 00   [ 1]    1     mov in,in.saved
      009095 27 20            [ 2] 3037 	jra 9$
      001128                       3038 2$: 
      009097 A1 84 26         [ 4] 3039 	call term
      00909A 13 84            [ 1] 3040 	cp a,#TK_INTGR 
      00909B 27 03            [ 1] 3041 	jreq 3$
      00909B 84 90 85         [ 2] 3042 	jp syntax_error
      00909E 89 90 89         [ 2] 3043 3$:	ldw acc16,x 
      0090A1 4C 88            [ 2] 3044 	ldw x,(N1,sp)
      0090A3 CD 89            [ 1] 3045 	ld a,(OP,sp)
      0090A5 ED A1            [ 1] 3046 	cp a,#TK_PLUS 
      0090A7 09 27            [ 1] 3047 	jrne 4$
      0090A9 E6 A1 00 27      [ 2] 3048 	addw x,acc16
      0090AD 09 A1            [ 2] 3049 	jra 0$ 
      0090AF 08 27 05 55      [ 2] 3050 4$:	subw x,acc16
      0090B3 00 03            [ 2] 3051 	jra 0$
      0090B5 00 02            [ 2] 3052 9$: ldw x,(N1,sp)
      0090B7 84 81            [ 1] 3053 	ld a,#TK_INTGR	
      0090B9                       3054 expr_exit:
      00114D                       3055 	_drop VSIZE 
      0090B9 CD 90            [ 2]    1     addw sp,#VSIZE 
      0090BB 89               [ 4] 3056 	ret 
                                   3057 
                                   3058 ;---------------------------------------------
                                   3059 ; rel ::= expr rel_op expr
                                   3060 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3061 ;  relation return  integer , zero is false 
                                   3062 ;  output:
                                   3063 ;    A 		token attribute  
                                   3064 ;	 X		integer 
                                   3065 ;---------------------------------------------
                           000001  3066 	N1=1
                           000003  3067 	RELOP=3
                           000003  3068 	VSIZE=3 
      001150                       3069 relation: 
      001150                       3070 	_vars VSIZE
      0090BC A1 01            [ 2]    1     sub sp,#VSIZE 
      0090BE 27 03 CC         [ 4] 3071 	call expression
      0090C1 88 FB            [ 1] 3072 	cp a,#CMD_END  
      0090C3 85 C3            [ 1] 3073 	jrult rel_exit 
                                   3074 	; expect rel_op or leave 
      0090C5 00 22            [ 2] 3075 	ldw (N1,sp),x 
      0090C7 23 05 A6         [ 4] 3076 	call next_token 
      0090CA 0A CC            [ 1] 3077 	cp a,#CMD_END 
      0090CC 88 FD            [ 1] 3078 	jrult 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      001162                       3079 1$:	
      0090CE 5D 27            [ 1] 3080 	ld (RELOP,sp),a 
      0090D0 F8 58            [ 1] 3081 	and a,#TK_GRP_MASK
      0090D2 89 AE            [ 1] 3082 	cp a,#TK_GRP_RELOP 
      0090D4 16 90            [ 1] 3083 	jreq 2$
      00116A                       3084 	_unget_token  
      0090D6 72 F0 01 5B 02   [ 1]    1     mov in,in.saved
      0090DB A6 84            [ 2] 3085 	jra 9$
      001171                       3086 2$:	; expect another expression or error 
      0090DD 81 11 07         [ 4] 3087 	call expression
      0090DE A1 84            [ 1] 3088 	cp a,#TK_INTGR 
      0090DE 52 01            [ 1] 3089 	jreq 3$
      0090E0 CD 89 ED         [ 2] 3090 	jp syntax_error 
      0090E3 A1 02 25         [ 2] 3091 3$:	ldw acc16,x 
      0090E6 4E 6B            [ 2] 3092 	ldw x,(N1,sp) 
      0090E8 01 A4 30 A1      [ 2] 3093 	subw x,acc16
      0090EC 10 27            [ 1] 3094 	jrne 4$
      0090EE 04 7B 01 20      [ 1] 3095 	mov acc8,#2 ; n1==n2
      0090F2 03 0C            [ 2] 3096 	jra 6$ 
      0090F3                       3097 4$: 
      0090F3 CD 89            [ 1] 3098 	jrsgt 5$  
      0090F5 ED 04 00 0D      [ 1] 3099 	mov acc8,#4 ; n1<2 
      0090F6 20 04            [ 2] 3100 	jra 6$
      001194                       3101 5$:
      0090F6 A1 81 26 03      [ 1] 3102 	mov acc8,#1 ; n1>n2 
      001198                       3103 6$:
      0090FA FD               [ 1] 3104 	clrw x 
      0090FB 20 2F 0D         [ 1] 3105 	ld a, acc8  
      0090FD 14 03            [ 1] 3106 	and a,(RELOP,sp)
      0090FD A1               [ 1] 3107 	tnz a 
      0090FE 84 26            [ 1] 3108 	jreq 10$
      009100 02               [ 2] 3109 	incw x 
      0011A2                       3110 7$:	 
      009101 20 29            [ 2] 3111 	jra 10$  	
      009103 1E 01            [ 2] 3112 9$: ldw x,(N1,sp)
      0011A6                       3113 10$:
      009103 A1 06            [ 1] 3114 	ld a,#TK_INTGR
      0011A8                       3115 rel_exit: 	 
      0011A8                       3116 	_drop VSIZE
      009105 26 06            [ 2]    1     addw sp,#VSIZE 
      009107 CD               [ 4] 3117 	ret 
                                   3118 
                                   3119 ;--------------------------------
                                   3120 ; BASIC: SHOW 
                                   3121 ; print stack content in hexadecimal bytes 
                                   3122 ; 16 bytes per row 
                                   3123 ;--------------------------------
      0011AB                       3124 show:
      009108 90 B9 FE         [ 2] 3125 	ldw x,#cstk_prompt
      00910B 20 1F 00         [ 4] 3126 	call puts 
      00910D 96               [ 1] 3127 	ldw x,sp 
      00910D A1 85 26         [ 2] 3128 	addw x,#3 ; ignore return address
      009110 03 FE 20 18      [ 2] 3129 	ldw y,#RAM_SIZE  
      009114 CF 00 0C         [ 2] 3130 	ldw acc16,x 
      009114 A1 07 26 0C      [ 2] 3131 	subw y,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009118 CD 91 D0         [ 4] 3132 	call hex_dump
      00911B 89               [ 1] 3133 	clr a 
      00911C A6               [ 4] 3134 	ret
                                   3135 
      00911D 08 CD 90 7C 85 20 08  3136 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3137 
                                   3138 
                                   3139 ;--------------------------------------------
                                   3140 ; BASIC: HEX 
                                   3141 ; select hexadecimal base for integer print
                                   3142 ;---------------------------------------------
      009124                       3143 hex_base:
      009124 55 00 03 00      [ 1] 3144 	mov base,#16 
      009128 02               [ 4] 3145 	ret 
                                   3146 
                                   3147 ;--------------------------------------------
                                   3148 ; BASIC: DEC 
                                   3149 ; select decimal base for integer print
                                   3150 ;---------------------------------------------
      0011F1                       3151 dec_base:
      009129 4F 20 09 0A      [ 1] 3152 	mov base,#10
      00912C 81               [ 4] 3153 	ret 
                                   3154 
                                   3155 ;------------------------
                                   3156 ; BASIC: SIZE 
                                   3157 ; return free size in text area
                                   3158 ; output:
                                   3159 ;   A 		TK_INTGR
                                   3160 ;   X 	    size integer
                                   3161 ;--------------------------
      0011F6                       3162 size:
      00912C A6 11 11         [ 2] 3163 	ldw x,#tib 
      00912F 01 26 01 50      [ 2] 3164 	subw x,txtend 
      009133 A6 84            [ 1] 3165 	ld a,#TK_INTGR
      009133 A6               [ 4] 3166 	ret 
                                   3167 
                                   3168 
                                   3169 ;------------------------
                                   3170 ; BASIC: UBOUND  
                                   3171 ; return array variable size 
                                   3172 ; output:
                                   3173 ;   A 		TK_INTGR
                                   3174 ;   X 	    array size 
                                   3175 ;--------------------------
      001200                       3176 ubound:
      009134 84 16 90         [ 2] 3177 	ldw x,#tib
      009135 72 B0 00 1E      [ 2] 3178 	subw x,txtend 
      009135 5B 01 81 04      [ 2] 3179 	ldw y,basicptr 
      009138 90 C3 00 1E      [ 2] 3180 	cpw y,txtend 
      009138 52 03            [ 1] 3181 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00913A CD 90 DE         [ 1] 3182 	push count 
      00913D A1 02            [ 1] 3183 	push #0 
      00913F 25 43 01         [ 2] 3184 	subw x,(1,sp)
      009141                       3185 	_drop 2 
      009141 1F 01            [ 2]    1     addw sp,#2 
      009143 CD               [ 2] 3186 1$:	srlw x 
      009144 89 ED A1         [ 2] 3187 	ldw array_size,x
      009147 02 25            [ 1] 3188 	ld a,#TK_INTGR
      009149 36               [ 4] 3189 	ret 
                                   3190 
                                   3191 ;-----------------------------
                                   3192 ; BASIC: LET var=expr 
                                   3193 ; variable assignement 
                                   3194 ; output:
                                   3195 ;   A 		TK_NONE 
                                   3196 ;-----------------------------
      001222                       3197 let:
      00914A 6B 03 A4         [ 4] 3198 	call next_token 
      00914D 30 A1            [ 1] 3199 	cp a,#TK_VAR 
      00914F 20 27            [ 1] 3200 	jreq let_var
      009151 07 55            [ 1] 3201 	cp a,#TK_ARRAY 
      009153 00 03            [ 1] 3202 	jreq  let_array
      009155 00 02 20         [ 2] 3203 	jp syntax_error
      001230                       3204 let_array:
      009158 27 10 39         [ 4] 3205 	call get_array_element
      009159                       3206 let_var:
      009159 CD               [ 2] 3207 	pushw x  
      00915A 90 DE A1         [ 4] 3208 	call next_token 
      00915D 84 27            [ 1] 3209 	cp a,#TK_EQUAL
      00915F 03 CC            [ 1] 3210 	jreq 1$
      009161 88 FB 90         [ 2] 3211 	jp syntax_error
      00123E                       3212 1$:	
      009164 93 1E 01         [ 4] 3213 	call relation   
      009167 7B 03            [ 1] 3214 	cp a,#TK_INTGR 
      009169 A1 20            [ 1] 3215 	jreq 2$
      00916B 26 05 CD         [ 2] 3216 	jp syntax_error
      001248                       3217 2$:	
      00916E 8F 0D            [ 1] 3218 	ldw y,x 
      009170 20               [ 2] 3219 	popw x   
      009171 CF               [ 2] 3220 	ldw (x),y   
      009172 A1               [ 4] 3221 	ret 
                                   3222 
                                   3223 ;----------------------------
                                   3224 ; BASIC: LIST [[start][,end]]
                                   3225 ; list program lines 
                                   3226 ; form start to end 
                                   3227 ; if empty argument list then 
                                   3228 ; list all.
                                   3229 ;----------------------------
                           000001  3230 	FIRST=1
                           000003  3231 	LAST=3 
                           000005  3232 	LN_PTR=5
                           000006  3233 	VSIZE=6 
      00124D                       3234 list:
      009173 21 26 05         [ 2] 3235 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009176 CD 8F C6         [ 2] 3236 	cpw x,txtend 
      009179 20 C6            [ 1] 3237 	jrmi 1$
      00917B CD               [ 4] 3238 	ret 
      001256                       3239 1$:	
      001256                       3240 	_vars VSIZE
      00917C 8F DC            [ 2]    1     sub sp,#VSIZE 
      00917E 20 C1            [ 2] 3241 	ldw (LN_PTR,sp),x 
      009180 1E               [ 2] 3242 	ldw x,(x) 
      009181 01 A6            [ 2] 3243 	ldw (FIRST,sp),x ; list from first line 
      009183 84 7F FF         [ 2] 3244 	ldw x,#MAX_LINENO ; biggest line number 
      009184 1F 03            [ 2] 3245 	ldw (LAST,sp),x 
      009184 5B 03 81         [ 4] 3246 	call arg_list
      009187 4D               [ 1] 3247 	tnz a
      009187 52 03            [ 1] 3248 	jreq list_loop 
      009189 CD 91            [ 1] 3249 	cp a,#2 
      00918B 38 A1            [ 1] 3250 	jreq 4$
      00918D 02 25            [ 1] 3251 	cp a,#1 
      00918F 3D 1F            [ 1] 3252 	jreq first_line 
      009191 01 CD 89         [ 2] 3253 	jp syntax_error 
      009194 ED               [ 2] 3254 4$:	popw x 
      009195 A1 02            [ 2] 3255 	ldw (LAST+2,sp),x 
      001276                       3256 first_line:
      009197 25               [ 2] 3257 	popw x
      009198 30 6B            [ 2] 3258 	ldw (FIRST,sp),x 
      001279                       3259 lines_skip:
      00919A 03 A4 30         [ 2] 3260 	ldw x,txtbgn
      00919D A1 10            [ 2] 3261 2$:	ldw (LN_PTR,sp),x 
      00919F 27 07 55         [ 2] 3262 	cpw x,txtend 
      0091A2 00 03            [ 1] 3263 	jrpl list_exit 
      0091A4 00               [ 2] 3264 	ldw x,(x) ;line# 
      0091A5 02 20            [ 2] 3265 	cpw x,(FIRST,sp)
      0091A7 21 11            [ 1] 3266 	jrpl list_loop 
      0091A8 1E 05            [ 2] 3267 	ldw x,(LN_PTR,sp) 
      0091A8 CD 91            [ 1] 3268 	ld a,(2,x)
      0091AA 38 A1 84         [ 1] 3269 	ld acc8,a 
      0091AD 27 03 CC 88      [ 1] 3270 	clr acc16 
      0091B1 FB CF 00 0D      [ 2] 3271 	addw x,acc16
      0091B5 1E 01            [ 2] 3272 	jra 2$ 
                                   3273 ; print loop
      001299                       3274 list_loop:
      0091B7 7B 03            [ 2] 3275 	ldw x,(LN_PTR,sp)
      0091B9 A1 10            [ 1] 3276 	ld a,(2,x) 
      0091BB 26 06 72         [ 4] 3277 	call prt_basic_line
      0091BE BB 00            [ 2] 3278 	ldw x,(LN_PTR,sp)
      0091C0 0D 20            [ 1] 3279 	ld a,(2,x)
      0091C2 CD 72 B0         [ 1] 3280 	ld acc8,a 
      0091C5 00 0D 20 C7      [ 1] 3281 	clr acc16 
      0091C9 1E 01 A6 84      [ 2] 3282 	addw x,acc16
      0091CD C3 00 1E         [ 2] 3283 	cpw x,txtend 
      0091CD 5B 03            [ 1] 3284 	jrpl list_exit
      0091CF 81 05            [ 2] 3285 	ldw (LN_PTR,sp),x
      0091D0 FE               [ 2] 3286 	ldw x,(x)
      0091D0 52 03            [ 2] 3287 	cpw x,(LAST,sp)  
      0091D2 CD 91            [ 1] 3288 	jrslt list_loop
      0012BB                       3289 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091D4 87 A1 02 25 4F   [ 1] 3290 	mov in,count 
      0091D9 1F 01 CD         [ 2] 3291 	ldw x,#pad 
      0091DC 89 ED A1         [ 2] 3292 	ldw basicptr,x 
      0012C6                       3293 	_drop VSIZE 
      0091DF 02 25            [ 2]    1     addw sp,#VSIZE 
      0091E1 42               [ 4] 3294 	ret
                                   3295 
                                   3296 ;-------------------------
                                   3297 ; copy command name to buffer  
                                   3298 ; input:
                                   3299 ;   X 	name address 
                                   3300 ;   Y   destination buffer 
                                   3301 ; output:
                                   3302 ;   Y   point after name  
                                   3303 ;--------------------------
      0091E2                       3304 cpy_cmd_name:
      0091E2 6B               [ 1] 3305 	ld a,(x)
      0091E3 03               [ 2] 3306 	incw x
      0091E4 A4 30            [ 1] 3307 	and a,#15  
      0091E6 A1               [ 1] 3308 	push a 
      0091E7 30 27            [ 1] 3309     tnz (1,sp) 
      0091E9 07 55            [ 1] 3310 	jreq 9$
      0091EB 00               [ 1] 3311 1$:	ld a,(x)
      0091EC 03 00            [ 1] 3312 	ld (y),a  
      0091EE 02               [ 2] 3313 	incw x
      0091EF 20 33            [ 2] 3314 	incw y 
      0091F1 0A 01            [ 1] 3315 	dec (1,sp)	 
      0091F1 CD 91            [ 1] 3316 	jrne 1$
      0091F3 87               [ 1] 3317 9$: pop a 
      0091F4 A1               [ 4] 3318 	ret	
                                   3319 
                                   3320 ;--------------------------
                                   3321 ; add a space after letter or 
                                   3322 ; digit.
                                   3323 ; input:
                                   3324 ;   Y     pointer to buffer 
                                   3325 ; output:
                                   3326 ;   Y    moved to end 
                                   3327 ;--------------------------
      0012DE                       3328 add_space:
      0091F5 84 27            [ 2] 3329 	decw y 
      0091F7 03 CC            [ 1] 3330 	ld a,(y)
      0091F9 88 FB            [ 2] 3331 	incw y
      0091FB CF 00 0D         [ 4] 3332 	call is_alnum 
      0091FE 1E 01            [ 1] 3333 	jrnc 1$
      009200 72 B0            [ 1] 3334 	ld a,#SPACE 
      009202 00 0D            [ 1] 3335 	ld (y),a 
      009204 26 06            [ 2] 3336 	incw y 
      009206 35               [ 4] 3337 1$: ret 
                                   3338 
                                   3339 ;--------------------------
                                   3340 ;  align text in buffer 
                                   3341 ;  to tab_width padding 
                                   3342 ;  left with  SPACE 
                                   3343 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3344 ;   X      str*
                                   3345 ;   A      str_length 
                                   3346 ; output:
                                   3347 ;   X      ajusted
                                   3348 ;--------------------------
      0012F0                       3349 right_align:
      009207 02               [ 1] 3350 	push a 
      009208 00 0E            [ 1] 3351 0$: ld a,(1,sp)
      00920A 20 0C 24         [ 1] 3352 	cp a,tab_width 
      00920C 2A 08            [ 1] 3353 	jrpl 1$
      00920C 2C 06            [ 1] 3354 	ld a,#SPACE 
      00920E 35               [ 2] 3355 	decw x
      00920F 04               [ 1] 3356 	ld (x),a  
      009210 00 0E            [ 1] 3357 	inc (1,sp)
      009212 20 04            [ 2] 3358 	jra 0$ 
      009214 84               [ 1] 3359 1$: pop a 	
      009214 35               [ 4] 3360 	ret 
                                   3361 
                                   3362 ;--------------------------
                                   3363 ; print TK_QSTR
                                   3364 ; converting control character
                                   3365 ; to backslash sequence
                                   3366 ; input:
                                   3367 ;   X        char *
                                   3368 ;   Y        dest. buffer 
                                   3369 ; output:
                                   3370 ;   X        moved forward 
                                   3371 ;   Y        moved forward 
                                   3372 ;-----------------------------
      001302                       3373 cpy_quote:
      009215 01 00            [ 1] 3374 	ld a,#'"
      009217 0E F7            [ 1] 3375 	ld (y),a 
      009218 90 5C            [ 2] 3376 	incw y 
      009218 5F               [ 1] 3377 1$:	ld a,(x)
      009219 C6 00            [ 1] 3378 	jreq 9$
      00921B 0E               [ 2] 3379 	incw x 
      00921C 14 03            [ 1] 3380 	cp a,#SPACE 
      00921E 4D 27            [ 1] 3381 	jrult 3$
      009220 05 5C            [ 1] 3382 	ld (y),a
      009222 90 5C            [ 2] 3383 	incw y 
      009222 20 02            [ 1] 3384 	cp a,#'\ 
      009224 1E 01            [ 1] 3385 	jrne 1$ 
      009226                       3386 2$:
      009226 A6 84            [ 1] 3387 	ld (y),a
      009228 90 5C            [ 2] 3388 	incw y  
      009228 5B 03            [ 2] 3389 	jra 1$
      00922A 81               [ 1] 3390 3$: push a 
      00922B A6 5C            [ 1] 3391 	ld a,#'\
      00922B AE 92            [ 1] 3392 	ld (y),a 
      00922D 45 CD            [ 2] 3393 	incw y  
      00922F A7               [ 1] 3394 	pop a 
      009230 C0 96            [ 1] 3395 	sub a,#7
      009232 1C 00 03         [ 1] 3396 	ld acc8,a 
      009235 90 AE 18 00      [ 1] 3397 	clr acc16
      009239 CF               [ 2] 3398 	pushw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00923A 00 0D 72         [ 2] 3399 	ldw x,#escaped 
      00923D B2 00 0D CD      [ 2] 3400 	addw x,acc16 
      009241 83               [ 1] 3401 	ld a,(x)
      009242 D9               [ 2] 3402 	popw x
      009243 4F 81            [ 2] 3403 	jra 2$
      009245 0A 63            [ 1] 3404 9$: ld a,#'"
      009247 6F 6E            [ 1] 3405 	ld (y),a 
      009249 74 65            [ 2] 3406 	incw y  
      00924B 6E               [ 2] 3407 	incw x 
      00924C 74               [ 4] 3408 	ret
                                   3409 
                                   3410 ;--------------------------
                                   3411 ; return variable name 
                                   3412 ; from its address.
                                   3413 ; input:
                                   3414 ;   X    variable address
                                   3415 ; output:
                                   3416 ;   A     variable letter
                                   3417 ;--------------------------
      001343                       3418 var_name:
      00924D 20 6F 66         [ 2] 3419 		subw x,#vars 
      009250 20               [ 1] 3420 		ld a,xl 
      009251 73               [ 1] 3421 		srl a 
      009252 74 61            [ 1] 3422 		add a,#'A 
      009254 63               [ 4] 3423 		ret 
                                   3424 
                                   3425 
                                   3426 ;-------------------------------------
                                   3427 ; decompile tokens list 
                                   3428 ; to original text line 
                                   3429 ; input:
                                   3430 ;   [basicptr]  pointer at line 
                                   3431 ;   Y           destination buffer
                                   3432 ; output:
                                   3433 ;   A           length 
                                   3434 ;   Y           after string  
                                   3435 ;------------------------------------
                           000001  3436 	BASE_SAV=1
                           000002  3437 	WIDTH_SAV=2
                           000003  3438 	STR=3
                           000004  3439 	VSIZE=4 
      00134B                       3440 decompile::
      00134B                       3441 	_vars VSIZE
      009255 6B 20            [ 2]    1     sub sp,#VSIZE 
      009257 66 72 6F         [ 1] 3442 	ld a,base
      00925A 6D 20            [ 1] 3443 	ld (BASE_SAV,sp),a  
      00925C 74 6F 70         [ 1] 3444 	ld a,tab_width 
      00925F 20 74            [ 1] 3445 	ld (WIDTH_SAV,sp),a 
      009261 6F 20            [ 2] 3446 	ldw (STR,sp),y   
      009263 62 6F 74 74      [ 5] 3447 	ldw x,[basicptr] ; line number 
      009267 6F 6D 3A 0A      [ 1] 3448 	mov base,#10
      00926B 00 05 00 24      [ 1] 3449 	mov tab_width,#5
      00926C 72 5F 00 0B      [ 1] 3450 	clr acc24 
      00926C 35 10 00         [ 2] 3451 	ldw acc16,x
      00926F 0B 81 DE         [ 4] 3452 	call itoa  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009271 CD 12 F0         [ 4] 3453 	call right_align 
      009271 35               [ 1] 3454 	push a 
      009272 0A 00            [ 1] 3455 1$:	ldw y,x ; source
      009274 0B 81            [ 2] 3456 	ldw x,(STR+1,sp) ; destination
      009276 CD 03 B4         [ 4] 3457 	call strcpy 
      009276 AE 16            [ 1] 3458 	clrw y 
      009278 90               [ 1] 3459 	pop a 
      009279 72 B0            [ 1] 3460 	ld yl,a 
      00927B 00 1F A6         [ 2] 3461 	addw y,(STR,sp)
      00927E 84 81            [ 1] 3462 	ld a,#SPACE 
      009280 90 F7            [ 1] 3463 	ld (y),a 
      009280 AE 16            [ 2] 3464 	incw y 
      009282 90 72 B0 00      [ 1] 3465 	clr tab_width
      009286 1F 90 CE         [ 2] 3466 	ldw x,#3
      009289 00 05 90         [ 2] 3467 	ldw in.w,x 
      001392                       3468 decomp_loop:
      00928C C3 00            [ 2] 3469 	pushw y
      00928E 1F 25 0A         [ 4] 3470 	call next_token 
      009291 3B 00            [ 2] 3471 	popw y 
      009293 04               [ 1] 3472 	tnz a  
      009294 4B 00            [ 1] 3473 	jrne 1$
      009296 72 F0 01         [ 2] 3474 	jp 20$
      009299 5B 02            [ 1] 3475 1$:	jrpl 6$
                                   3476 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00929B 54 CF            [ 1] 3477 	cp a,#TK_VAR 
      00929D 00 22            [ 1] 3478 	jrne 3$
                                   3479 ;; TK_VAR 
      00929F A6 84 81         [ 4] 3480 	call add_space  
      0092A2 CD 13 43         [ 4] 3481 	call var_name
      0092A2 CD 89            [ 1] 3482 	ld (y),a 
      0092A4 ED A1            [ 2] 3483 	incw y  
      0092A6 85 27            [ 2] 3484 	jra decomp_loop
      0013B1                       3485 3$:
      0092A8 0A A1            [ 1] 3486 	cp a,#TK_INTGR
      0092AA 06 27            [ 1] 3487 	jrne 4$
                                   3488 ;; TK_INTGR
      0092AC 03 CC 88         [ 4] 3489 	call add_space
      0092AF FB 5F 00 0B      [ 1] 3490 	clr acc24 
      0092B0 CF 00 0C         [ 2] 3491 	ldw acc16,x 
      0092B0 CD 90            [ 2] 3492 	pushw y 
      0092B2 B9 09 DE         [ 4] 3493 	call itoa  
      0092B3 16 01            [ 2] 3494 	ldw y,(1,sp) 
      0092B3 89               [ 1] 3495 	push a 
      0092B4 CD               [ 1] 3496 	exgw x,y 
      0092B5 89 ED A1         [ 4] 3497 	call strcpy 
      0092B8 32 27            [ 1] 3498 	clrw y
      0092BA 03               [ 1] 3499 	pop a  
      0092BB CC 88            [ 1] 3500 	ld yl,a 
      0092BD FB F9 01         [ 2] 3501 	addw y,(1,sp)
      0092BE                       3502 	_drop 2 
      0092BE CD 91            [ 2]    1     addw sp,#2 
      0092C0 D0 A1            [ 2] 3503 	jra decomp_loop
                                   3504 ;; dictionary keyword 
      0013D7                       3505 4$:	
      0092C2 84 27 03         [ 2] 3506 	cpw x,#remark 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092C5 CC 88            [ 1] 3507 	jrne 5$
      0092C7 FB 00 04         [ 2] 3508 	ldw x,basicptr 
      0092C8 72 BB 00 00      [ 2] 3509 	addw x,in.w 
                                   3510 ; copy comment to buffer 
      0092C8 90 93 85         [ 4] 3511 	call add_space
      0092CB FF 81            [ 1] 3512 	ld a,#''
      0092CD 90 F7            [ 1] 3513 	ld (y),a 
      0092CD CE 00            [ 2] 3514 	incw y 
      0013EC                       3515 41$:
      0092CF 1D               [ 1] 3516 	ld a,(x)
      0092D0 C3               [ 2] 3517 	incw x 
      0092D1 00 1F            [ 1] 3518 	ld (y),a 
      0092D3 2B 01            [ 2] 3519 	incw y 
      0092D5 81               [ 1] 3520 	tnz a 
      0092D6 26 F7            [ 1] 3521 	jrne 41$
      0092D6 52 06            [ 2] 3522 	jra 20$  
                                   3523 ; insert command name 
      0013F7                       3524 5$:
      0092D8 1F 05 FE         [ 4] 3525 	call add_space  
      0092DB 1F 01            [ 2] 3526 	pushw y
      0092DD AE 7F FF         [ 4] 3527 	call cmd_name
      0092E0 1F 03            [ 2] 3528 	popw y 
      0092E2 CD 90 8E         [ 4] 3529 	call cpy_cmd_name
      0092E5 4D 27            [ 2] 3530 	jra decomp_loop 
      001406                       3531 6$:
      0092E7 31 A1            [ 1] 3532 	cp a,#TK_QSTR 
      0092E9 02 27            [ 1] 3533 	jrne 7$
                                   3534 ;; TK_QSTR
      0092EB 07 A1 01         [ 4] 3535 	call cpy_quote  
      0092EE 27 06 CC         [ 2] 3536 	jp decomp_loop
      001410                       3537 7$:
      0092F1 88 FB            [ 1] 3538 	cp a,#TK_CHAR 
      0092F3 85 1F            [ 1] 3539 	jrne 8$
                                   3540 ;; TK_CHAR 
      0092F5 05 5C            [ 1] 3541 	ld a,#'\ 
      0092F6 90 F7            [ 1] 3542 	ld (y),a 
      0092F6 85 1F            [ 2] 3543 	incw y 
      0092F8 01               [ 1] 3544 	ld a,xl 
      0092F9 90 F7            [ 1] 3545 	ld (y),a 
      0092F9 CE 00            [ 2] 3546 	incw y 
      0092FB 1D 1F 05         [ 2] 3547 	jp decomp_loop
      0092FE C3 00            [ 1] 3548 8$: cp a,#TK_COLON 
      009300 1F 2A            [ 1] 3549 	jrne 9$
      009302 38 FE            [ 1] 3550 	ld a,#':
      001428                       3551 81$:
      009304 13 01            [ 1] 3552 	ld (y),a 
      009306 2A 11            [ 2] 3553 	incw y 
      00142C                       3554 82$:
      009308 1E 05 E6         [ 2] 3555 	jp decomp_loop
      00142F                       3556 9$: 
      00930B 02 C7            [ 1] 3557 	cp a,#TK_SHARP
      00930D 00 0E            [ 1] 3558 	jrugt 10$ 
      00930F 72 5F            [ 1] 3559 	sub a,#TK_ARRAY 
      009311 00               [ 1] 3560 	clrw x 
      009312 0D               [ 1] 3561 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009313 72 BB 00         [ 2] 3562 	addw x,#single_char 
      009316 0D               [ 1] 3563 	ld a,(x)
      009317 20 E3            [ 2] 3564 	jra 81$ 
      009319                       3565 10$: 
      009319 1E 05            [ 1] 3566 	cp a,#TK_MINUS 
      00931B E6 02            [ 1] 3567 	jrugt 11$
      00931D CD 95            [ 1] 3568 	sub a,#TK_PLUS 
      00931F 29               [ 1] 3569 	clrw x 
      009320 1E               [ 1] 3570 	ld xl,a 
      009321 05 E6 02         [ 2] 3571 	addw x,#add_char 
      009324 C7               [ 1] 3572 	ld a,(x)
      009325 00 0E            [ 2] 3573 	jra 81$
      00144B                       3574 11$:
      009327 72 5F            [ 1] 3575     cp a,#TK_MOD 
      009329 00 0D            [ 1] 3576 	jrugt 12$
      00932B 72 BB            [ 1] 3577 	sub a,#TK_MULT
      00932D 00               [ 1] 3578 	clrw x 
      00932E 0D               [ 1] 3579 	ld xl,a 
      00932F C3 00 1F         [ 2] 3580 	addw x,#mul_char
      009332 2A               [ 1] 3581 	ld a,(x)
      009333 07 1F            [ 2] 3582 	jra 81$
      001459                       3583 12$:
      009335 05 FE            [ 1] 3584 	sub a,#TK_GT  
      009337 13               [ 1] 3585 	sll a 
      009338 03               [ 1] 3586 	clrw x 
      009339 2F               [ 1] 3587 	ld xl,a 
      00933A DE 14 8E         [ 2] 3588 	addw x,#relop_str 
      00933B FE               [ 2] 3589 	ldw x,(x)
      00933B 55               [ 1] 3590 	ld a,(x)
      00933C 00               [ 2] 3591 	incw x 
      00933D 04 00            [ 1] 3592 	ld (y),a
      00933F 02 AE            [ 2] 3593 	incw y 
      009341 16               [ 1] 3594 	ld a,(x)
      009342 E0 CF            [ 1] 3595 	jrne 81$
      009344 00 05 5B         [ 2] 3596 	jp decomp_loop 
      00146E                       3597 20$: 
      009347 06 81            [ 1] 3598 	clr (y)
      009349 1E 03            [ 2] 3599 	ldw x,(STR,sp)
      009349 F6 5C            [ 1] 3600 	ld a,(BASE_SAV,sp)
      00934B A4 0F 88         [ 1] 3601 	ld base,a 
      00934E 0D 01            [ 1] 3602 	ld a,(WIDTH_SAV,sp)
      009350 27 0A F6         [ 1] 3603 	ld tab_width,a
      009353 90 F7 5C         [ 2] 3604 	subw y,(STR,sp) 
      009356 90 5C            [ 1] 3605 	ld a,yl 
      001481                       3606 	_drop VSIZE 
      009358 0A 01            [ 2]    1     addw sp,#VSIZE 
      00935A 26               [ 4] 3607 	ret 
                                   3608 
      00935B F6 84 81 2C 23        3609 single_char: .byte '@','(',')',',','#'
      00935E 2B 2D                 3610 add_char: .byte '+','-'
      00935E 90 5A 90              3611 mul_char: .byte '*','/','%'
      009361 F6 90 5C CD 86 09 24  3612 relop_str: .word gt,equal,ge,lt,le,ne 
             06 A6 20 90 F7
      00936D 90 5C                 3613 gt: .asciz ">"
      00936F 81 00                 3614 equal: .asciz "="
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009370 3E 3D 00              3615 ge: .asciz ">="
      009370 88 7B                 3616 lt: .asciz "<"
      009372 01 C1 00              3617 le: .asciz "<="
      009375 25 2A 08              3618 ne:  .asciz "<>"
                                   3619 
                                   3620 
                                   3621 ;--------------------------
                                   3622 ; decompile line from token list
                                   3623 ; and print it. 
                                   3624 ; input:
                                   3625 ;   A       stop at this position 
                                   3626 ;   X 		pointer at line
                                   3627 ; output:
                                   3628 ;   none 
                                   3629 ;--------------------------	
      0014A9                       3630 prt_basic_line:
      009378 A6 20 5A         [ 1] 3631 	ld count,a 
      00937B F7 0C            [ 1] 3632 	ld a,(2,x)
      00937D 01 20 F1         [ 1] 3633 	cp a,count 
      009380 84 81            [ 1] 3634 	jrpl 1$ 
      009382 C7 00 03         [ 1] 3635 	ld count,a 
      009382 A6 22 90         [ 2] 3636 1$:	ldw basicptr,x 
      009385 F7 90 5C F6      [ 2] 3637 	ldw y,#tib  
      009389 27 30 5C         [ 4] 3638 	call decompile 
      00938C A1 20 25         [ 4] 3639 	call puts 
      00938F 0E 90            [ 1] 3640 	ld a,#CR 
      009391 F7 90 5C         [ 4] 3641 	call putc 
      009394 A1               [ 4] 3642 	ret 
                                   3643 
                                   3644 
                                   3645 
                                   3646 ;---------------------------------
                                   3647 ; BASIC: PRINT|? arg_list 
                                   3648 ; print values from argument list
                                   3649 ;----------------------------------
                           000001  3650 	COMMA=1
                           000001  3651 	VSIZE=1
      0014C9                       3652 print:
      009395 5C 26            [ 1] 3653 push #0 ; local variable COMMA 
      0014CB                       3654 reset_comma:
      009397 F0 01            [ 1] 3655 	clr (COMMA,sp)
      009398                       3656 prt_loop:
      009398 90 F7 90         [ 4] 3657 	call next_token
      00939B 5C 20            [ 1] 3658 	cp a,#CMD_END 
      00939D EA 88            [ 1] 3659 	jrult print_exit ; colon or end of line 
      00939F A6 5C            [ 1] 3660 	cp a,#TK_QSTR
      0093A1 90 F7            [ 1] 3661 	jreq 1$
      0093A3 90 5C            [ 1] 3662 	cp a,#TK_CHAR 
      0093A5 84 A0            [ 1] 3663 	jreq 2$ 
      0093A7 07 C7            [ 1] 3664 	cp a,#TK_CFUNC 
      0093A9 00 0E            [ 1] 3665 	jreq 3$
      0093AB 72 5F            [ 1] 3666 	cp a,#TK_COMMA 
      0093AD 00 0D            [ 1] 3667 	jreq 4$
      0093AF 89 AE            [ 1] 3668 	cp a,#TK_SHARP 
      0093B1 8B 8A            [ 1] 3669 	jreq 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093B3 72 BB            [ 2] 3670 	jra 7$ 
      0014EA                       3671 1$:	; print string 
      0093B5 00 0D F6         [ 4] 3672 	call puts
      0093B8 85 20            [ 2] 3673 	jra reset_comma
      0014EF                       3674 2$:	; print character 
      0093BA DD               [ 1] 3675 	ld a,xl 
      0093BB A6 22 90         [ 4] 3676 	call putc 
      0093BE F7 90            [ 2] 3677 	jra reset_comma 
      0014F5                       3678 3$: ; print character function value  	
      0093C0 5C               [ 4] 3679 	call (x)
      0093C1 5C               [ 1] 3680 	ld a,xl 
      0093C2 81 02 C0         [ 4] 3681 	call putc
      0093C3 20 CF            [ 2] 3682 	jra reset_comma 
      0014FC                       3683 4$: ; set comma state 
      0093C3 1D 00            [ 1] 3684 	ld a,#255 
      0093C5 30 9F            [ 1] 3685 	ld (COMMA,sp),a  
      0093C7 44 AB 41         [ 2] 3686 	jp prt_loop   
      001503                       3687 5$: ; # character must be followed by an integer   
      0093CA 81 09 6D         [ 4] 3688 	call next_token
      0093CB A1 84            [ 1] 3689 	cp a,#TK_INTGR 
      0093CB 52 04            [ 1] 3690 	jreq 6$
      0093CD C6 00 0B         [ 2] 3691 	jp syntax_error 
      00150D                       3692 6$: ; set tab width
      0093D0 6B               [ 1] 3693 	ld a,xl 
      0093D1 01 C6            [ 1] 3694 	and a,#15 
      0093D3 00 25 6B         [ 1] 3695 	ld tab_width,a 
      0093D6 02 17            [ 2] 3696 	jra reset_comma 
      001515                       3697 7$:	
      001515                       3698 	_unget_token
      0093D8 03 72 CE 00 05   [ 1]    1     mov in,in.saved
      0093DD 35 0A 00         [ 4] 3699 	call relation 
      0093E0 0B 35            [ 1] 3700 	cp a,#TK_INTGR
      0093E2 05 00            [ 1] 3701 	jreq 8$
      001521                       3702 	_unget_token
      0093E4 25 72 5F 00 0C   [ 1]    1     mov in,in.saved
      0093E9 CF 00 0D         [ 2] 3703 	jp print_exit 
      0093EC CD 8A 5E         [ 4] 3704 8$: call print_int 
      0093EF CD 93            [ 2] 3705 	jra reset_comma 
      00152E                       3706 print_exit:
      0093F1 70 88            [ 1] 3707 	tnz (COMMA,sp)
      0093F3 90 93            [ 1] 3708 	jrne 9$
      0093F5 1E 04            [ 1] 3709 	ld a,#CR 
      0093F7 CD 84 34         [ 4] 3710     call putc 
      001537                       3711 9$:	_drop VSIZE 
      0093FA 90 5F            [ 2]    1     addw sp,#VSIZE 
      0093FC 84               [ 4] 3712 	ret 
                                   3713 
      00153A                       3714 print_type: 
                                   3715 
                                   3716 ;----------------------
                                   3717 ; 'save_context' and
                                   3718 ; 'rest_context' must be 
                                   3719 ; called at the same 
                                   3720 ; call stack depth 
                                   3721 ; i.e. SP must have the 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3722 ; save value at  
                                   3723 ; entry point of both 
                                   3724 ; routine. 
                                   3725 ;---------------------
                           000004  3726 	CTXT_SIZE=4 ; size of saved data 
                                   3727 ;--------------------
                                   3728 ; save current BASIC
                                   3729 ; interpreter context 
                                   3730 ; on stack 
                                   3731 ;--------------------
      00153A                       3732 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00153A                       3733 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00153A                       3734 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00153A                       3735 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00153A                       3736 save_context:
      0093FD 90 97 72         [ 2] 3737 	ldw x,basicptr 
      009400 F9 03            [ 2] 3738 	ldw (BPTR,sp),x
      009402 A6 20 90         [ 1] 3739 	ld a,in 
      009405 F7 90            [ 1] 3740 	ld (IN,sp),a
      009407 5C 72 5F         [ 1] 3741 	ld a,count 
      00940A 00 25            [ 1] 3742 	ld (CNT,sp),a  
      00940C AE               [ 4] 3743 	ret
                                   3744 
                                   3745 ;-----------------------
                                   3746 ; restore previously saved 
                                   3747 ; BASIC interpreter context 
                                   3748 ; from stack 
                                   3749 ;-------------------------
      00154A                       3750 rest_context:
      00940D 00 03            [ 2] 3751 	ldw x,(BPTR,sp)
      00940F CF 00 01         [ 2] 3752 	ldw basicptr,x 
      009412 7B 05            [ 1] 3753 	ld a,(IN,sp)
      009412 90 89 CD         [ 1] 3754 	ld in,a
      009415 89 ED            [ 1] 3755 	ld a,(CNT,sp)
      009417 90 85 4D         [ 1] 3756 	ld count,a  
      00941A 26               [ 4] 3757 	ret
                                   3758 
                                   3759 
                                   3760 
                                   3761 ;------------------------------------------
                                   3762 ; BASIC: INPUT [string]var[,[string]var]
                                   3763 ; input value in variables 
                                   3764 ; [string] optionally can be used as prompt 
                                   3765 ;-----------------------------------------
                           000001  3766 	CX_BPTR=1
                           000003  3767 	CX_IN=3
                           000004  3768 	CX_CNT=4
                           000005  3769 	SKIP=5
                           000006  3770 	VAR_ADDR=6
                           000007  3771 	VSIZE=7
      00155A                       3772 input_var:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00155A                       3773 	_vars VSIZE 
      00941B 03 CC            [ 2]    1     sub sp,#VSIZE 
      00155C                       3774 input_loop:
      00941D 94 EE            [ 1] 3775 	clr (SKIP,sp)
      00941F 2A 65 A1         [ 4] 3776 	call next_token 
      009422 85 26            [ 1] 3777 	cp a,#TK_QSTR 
      009424 0C CD            [ 1] 3778 	jrne 1$ 
      009426 93 5E CD         [ 4] 3779 	call puts 
      009429 93 C3            [ 1] 3780 	cpl (SKIP,sp)
      00942B 90 F7 90         [ 4] 3781 	call next_token 
      00942E 5C 20            [ 1] 3782 1$: cp a,#TK_VAR  
      009430 E1 03            [ 1] 3783 	jreq 2$ 
      009431 CC 08 7B         [ 2] 3784 	jp syntax_error
      009431 A1 84            [ 2] 3785 2$:	ldw (VAR_ADDR,sp),x 
      009433 26 22            [ 1] 3786 	tnz (SKIP,sp)
      009435 CD 93            [ 1] 3787 	jrne 21$ 
      009437 5E 72 5F         [ 4] 3788 	call var_name 
      00943A 00 0C CF         [ 4] 3789 	call putc   
      001580                       3790 21$:
      00943D 00 0D            [ 1] 3791 	ld a,#':
      00943F 90 89 CD         [ 4] 3792 	call putc 
      009442 8A 5E 16         [ 4] 3793 	call save_context 
      009445 01 88 51 CD      [ 1] 3794 	clr count  
      009449 84 34 90         [ 4] 3795 	call readln 
      00944C 5F 84 90         [ 2] 3796 	ldw x,#tib 
      00944F 97 72 F9         [ 1] 3797 	push count
      009452 01 5B            [ 1] 3798 	push #0 
      009454 02 20 BB         [ 2] 3799 	addw x,(1,sp)
      009457 5C               [ 2] 3800 	incw x 
      00159B                       3801 	_drop 2 
      009457 A3 96            [ 2]    1     addw sp,#2 
      009459 46 26 1B CE      [ 1] 3802 	clr in 
      00945D 00 05 72         [ 4] 3803 	call get_token
      009460 BB 00            [ 1] 3804 	cp a,#TK_INTGR
      009462 01 CD            [ 1] 3805 	jreq 3$ 
      009464 93 5E A6         [ 4] 3806 	call rest_context 
      009467 27 90 F7         [ 2] 3807 	jp syntax_error
      00946A 90 5C            [ 2] 3808 3$: ldw y,(VAR_ADDR,sp) 
      00946C 90 FF            [ 2] 3809 	ldw (y),x 
      00946C F6 5C 90         [ 4] 3810 	call rest_context
      00946F F7 90 5C         [ 4] 3811 	call next_token 
      009472 4D 26            [ 1] 3812 	cp a,#TK_COMMA 
      009474 F7 20            [ 1] 3813 	jreq input_loop 
      009476 77 01            [ 1] 3814 	cp a,#TK_COLON 
      009477 23 03            [ 2] 3815     jrule input_exit 
      009477 CD 93 5E         [ 2] 3816 	jp syntax_error 
      0015C3                       3817 input_exit:
      0015C3                       3818 	_drop VSIZE 
      00947A 90 89            [ 2]    1     addw sp,#VSIZE 
      00947C CD               [ 4] 3819 	ret 
                                   3820 
                                   3821 
                                   3822 ;---------------------
                                   3823 ; BASIC: REMARK | ' 
                                   3824 ; skip comment to end of line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3825 ;---------------------- 
      0015C6                       3826 remark:
      00947D 8F FD 90 85 CD   [ 1] 3827 	mov in,count 
      009482 93               [ 4] 3828  	ret 
                                   3829 
                                   3830 
                                   3831 ;---------------------
                                   3832 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3833 ; read in loop 'addr'  
                                   3834 ; apply & 'mask' to value 
                                   3835 ; loop while result==0.  
                                   3836 ; 'xor_mask' is used to 
                                   3837 ; invert the wait logic.
                                   3838 ; i.e. loop while not 0.
                                   3839 ;---------------------
                           000001  3840 	XMASK=1 
                           000002  3841 	MASK=2
                           000003  3842 	ADDR=3
                           000004  3843 	VSIZE=4
      0015CC                       3844 wait: 
      0015CC                       3845 	_vars VSIZE
      009483 49 20            [ 2]    1     sub sp,#VSIZE 
      009485 8C 01            [ 1] 3846 	clr (XMASK,sp) 
      009486 CD 10 0E         [ 4] 3847 	call arg_list 
      009486 A1 02            [ 1] 3848 	cp a,#2
      009488 26 06            [ 1] 3849 	jruge 0$
      00948A CD 93 82         [ 2] 3850 	jp syntax_error 
      00948D CC 94            [ 1] 3851 0$:	cp a,#3
      00948F 12 04            [ 1] 3852 	jrult 1$
      009490 85               [ 2] 3853 	popw x 
      009490 A1               [ 1] 3854 	ld a,xl
      009491 03 26            [ 1] 3855 	ld (XMASK,sp),a 
      009493 0E               [ 2] 3856 1$: popw x ; mask 
      009494 A6               [ 1] 3857 	ld a,xl 
      009495 5C 90            [ 1] 3858 	ld (MASK,sp),a 
      009497 F7               [ 2] 3859 	popw x ; address 
      009498 90               [ 1] 3860 2$:	ld a,(x)
      009499 5C 9F            [ 1] 3861 	and a,(MASK,sp)
      00949B 90 F7            [ 1] 3862 	xor a,(XMASK,sp)
      00949D 90 5C            [ 1] 3863 	jreq 2$ 
      0015EE                       3864 	_drop VSIZE 
      00949F CC 94            [ 2]    1     addw sp,#VSIZE 
      0094A1 12               [ 4] 3865 	ret 
                                   3866 
                                   3867 ;---------------------
                                   3868 ; BASIC: BSET addr,mask
                                   3869 ; set bits at 'addr' corresponding 
                                   3870 ; to those of 'mask' that are at 1.
                                   3871 ; arguments:
                                   3872 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3873 ;   mask        mask|addr
                                   3874 ; output:
                                   3875 ;	none 
                                   3876 ;--------------------------
      0015F1                       3877 bit_set:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094A2 A1 01 26         [ 4] 3878 	call arg_list 
      0094A5 09 A6            [ 1] 3879 	cp a,#2	 
      0094A7 3A 03            [ 1] 3880 	jreq 1$ 
      0094A8 CC 08 7B         [ 2] 3881 	jp syntax_error
      0015FB                       3882 1$: 
      0094A8 90               [ 2] 3883 	popw x ; mask 
      0094A9 F7               [ 1] 3884 	ld a,xl 
      0094AA 90               [ 2] 3885 	popw x ; addr  
      0094AB 5C               [ 1] 3886 	or a,(x)
      0094AC F7               [ 1] 3887 	ld (x),a
      0094AC CC               [ 4] 3888 	ret 
                                   3889 
                                   3890 ;---------------------
                                   3891 ; BASIC: BRES addr,mask
                                   3892 ; reset bits at 'addr' corresponding 
                                   3893 ; to those of 'mask' that are at 1.
                                   3894 ; arguments:
                                   3895 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3896 ;   mask	    ~mask&*addr  
                                   3897 ; output:
                                   3898 ;	none 
                                   3899 ;--------------------------
      001601                       3900 bit_reset:
      0094AD 94 12 0E         [ 4] 3901 	call arg_list 
      0094AF A1 02            [ 1] 3902 	cp a,#2  
      0094AF A1 0A            [ 1] 3903 	jreq 1$ 
      0094B1 22 0A A0         [ 2] 3904 	jp syntax_error
      00160B                       3905 1$: 
      0094B4 06               [ 2] 3906 	popw x ; mask 
      0094B5 5F               [ 1] 3907 	ld a,xl 
      0094B6 97               [ 1] 3908 	cpl a 
      0094B7 1C               [ 2] 3909 	popw x ; addr  
      0094B8 95               [ 1] 3910 	and a,(x)
      0094B9 04               [ 1] 3911 	ld (x),a 
      0094BA F6               [ 4] 3912 	ret 
                                   3913 
                                   3914 ;---------------------
                                   3915 ; BASIC: BTOGL addr,mask
                                   3916 ; toggle bits at 'addr' corresponding 
                                   3917 ; to those of 'mask' that are at 1.
                                   3918 ; arguments:
                                   3919 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3920 ;   mask	    mask^*addr  
                                   3921 ; output:
                                   3922 ;	none 
                                   3923 ;--------------------------
      001612                       3924 bit_toggle:
      0094BB 20 EB 0E         [ 4] 3925 	call arg_list 
      0094BD A1 02            [ 1] 3926 	cp a,#2 
      0094BD A1 11            [ 1] 3927 	jreq 1$ 
      0094BF 22 0A A0         [ 2] 3928 	jp syntax_error
      0094C2 10               [ 2] 3929 1$: popw x ; mask 
      0094C3 5F               [ 1] 3930 	ld a,xl 
      0094C4 97               [ 2] 3931 	popw x ; addr  
      0094C5 1C               [ 1] 3932 	xor a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094C6 95               [ 1] 3933 	ld (x),a 
      0094C7 09               [ 4] 3934 	ret 
                                   3935 
                                   3936 
                                   3937 ;---------------------
                                   3938 ; BASIC: BTEST(addr,bit)
                                   3939 ; return bit value at 'addr' 
                                   3940 ; bit is in range {0..7}.
                                   3941 ; arguments:
                                   3942 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3943 ;   bit 	    bit position {0..7}  
                                   3944 ; output:
                                   3945 ;	none 
                                   3946 ;--------------------------
      001622                       3947 bit_test:
      0094C8 F6 20 DD         [ 4] 3948 	call func_args 
      0094CB A1 02            [ 1] 3949 	cp a,#2
      0094CB A1 22            [ 1] 3950 	jreq 0$
      0094CD 22 0A A0         [ 2] 3951 	jp syntax_error
      00162C                       3952 0$:	
      0094D0 20               [ 2] 3953 	popw x 
      0094D1 5F               [ 1] 3954 	ld a,xl 
      0094D2 97 1C            [ 1] 3955 	and a,#7
      0094D4 95               [ 1] 3956 	push a   
      0094D5 0B F6            [ 1] 3957 	ld a,#1 
      0094D7 20 CF            [ 1] 3958 1$: tnz (1,sp)
      0094D9 27 05            [ 1] 3959 	jreq 2$
      0094D9 A0               [ 1] 3960 	sll a 
      0094DA 31 48            [ 1] 3961 	dec (1,sp)
      0094DC 5F 97            [ 2] 3962 	jra 1$
      00163C                       3963 2$: _drop 1 
      0094DE 1C 95            [ 2]    1     addw sp,#1 
      0094E0 0E               [ 2] 3964 	popw x 
      0094E1 FE               [ 1] 3965 	and a,(x)
      0094E2 F6 5C            [ 1] 3966 	jreq 3$
      0094E4 90 F7            [ 1] 3967 	ld a,#1 
      0094E6 90               [ 1] 3968 3$:	clrw x 
      0094E7 5C               [ 1] 3969 	ld xl,a 
      0094E8 F6 26            [ 1] 3970 	ld a,#TK_INTGR
      0094EA BD               [ 4] 3971 	ret
                                   3972 
                                   3973 
                                   3974 ;--------------------
                                   3975 ; BASIC: POKE addr,byte
                                   3976 ; put a byte at addr 
                                   3977 ;--------------------
      001649                       3978 poke:
      0094EB CC 94 12         [ 4] 3979 	call arg_list 
      0094EE A1 02            [ 1] 3980 	cp a,#2
      0094EE 90 7F            [ 1] 3981 	jreq 1$
      0094F0 1E 03 7B         [ 2] 3982 	jp syntax_error
      001653                       3983 1$:	
      0094F3 01               [ 2] 3984 	popw x  
      0094F4 C7               [ 1] 3985     ld a,xl 
      0094F5 00               [ 2] 3986 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094F6 0B               [ 1] 3987 	ld (x),a 
      0094F7 7B               [ 4] 3988 	ret 
                                   3989 
                                   3990 ;-----------------------
                                   3991 ; BASIC: PEEK(addr)
                                   3992 ; get the byte at addr 
                                   3993 ; input:
                                   3994 ;	none 
                                   3995 ; output:
                                   3996 ;	X 		value 
                                   3997 ;-----------------------
      001658                       3998 peek:
      0094F8 02 C7 00         [ 4] 3999 	call func_args
      0094FB 25 72            [ 1] 4000 	cp a,#1 
      0094FD F2 03            [ 1] 4001 	jreq 1$
      0094FF 90 9F 5B         [ 2] 4002 	jp syntax_error
      009502 04               [ 2] 4003 1$: popw x 
      009503 81               [ 1] 4004 	ld a,(x)
      009504 40               [ 1] 4005 	clrw x 
      009505 28               [ 1] 4006 	ld xl,a 
      009506 29 2C            [ 1] 4007 	ld a,#TK_INTGR
      009508 23               [ 4] 4008 	ret 
                                   4009 
                                   4010 ;---------------------------
                                   4011 ; BASIC IF expr : instructions
                                   4012 ; evaluate expr and if true 
                                   4013 ; execute instructions on same line. 
                                   4014 ;----------------------------
      001669                       4015 if: 
      009509 2B 2D 2A         [ 4] 4016 	call relation 
      00950C 2F 25            [ 1] 4017 	cp a,#TK_INTGR
      00950E 95 1A            [ 1] 4018 	jreq 1$ 
      009510 95 1C 95         [ 2] 4019 	jp syntax_error
      009513 1E               [ 1] 4020 1$:	clr a 
      009514 95               [ 2] 4021 	tnzw x 
      009515 21 95            [ 1] 4022 	jrne 9$  
                                   4023 ;skip to next line
      009517 23 95 26 3E 00   [ 1] 4024 	mov in,count
      00951C 3D               [ 4] 4025 9$:	ret 
                                   4026 
                                   4027 ;------------------------
                                   4028 ; BASIC: FOR var=expr 
                                   4029 ; set variable to expression 
                                   4030 ; leave variable address 
                                   4031 ; on stack and set
                                   4032 ; FLOOP bit in 'flags'
                                   4033 ;-----------------
                           000001  4034 	RETL1=1 ; return address  
                           000003  4035 	FSTEP=3  ; variable increment
                           000005  4036 	LIMIT=5 ; loop limit 
                           000007  4037 	CVAR=7   ; control variable 
                           000009  4038 	INW=9   ;  in.w saved
                           00000B  4039 	BPTR=11 ; baseptr saved
                           00000A  4040 	VSIZE=10  
      00167D                       4041 for: ; { -- var_addr }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00951D 00               [ 2] 4042 	popw x ; call return address 
      00167E                       4043 	_vars VSIZE 
      00951E 3E 3D            [ 2]    1     sub sp,#VSIZE 
      009520 00               [ 2] 4044 	pushw x  ; RETL1 
      009521 3C 00            [ 1] 4045 	ld a,#TK_VAR 
      009523 3C 3D 00         [ 4] 4046 	call expect
      009526 3C 3E            [ 2] 4047 	ldw (CVAR,sp),x  ; control variable 
      009528 00 12 33         [ 4] 4048 	call let_var 
      009529 72 14 00 23      [ 1] 4049 	bset flags,#FLOOP 
                                   4050 ; open space on stack for loop data 
      009529 C7               [ 1] 4051 	clrw x 
      00952A 00 04            [ 2] 4052 	ldw (BPTR,sp),x 
      00952C E6 02            [ 2] 4053 	ldw (INW,sp),x 
      00952E C1 00 04         [ 4] 4054 	call next_token 
      009531 2A 03            [ 1] 4055 	cp a,#TK_CMD 
      009533 C7 00            [ 1] 4056 	jreq 1$
      009535 04 CF 00         [ 2] 4057 	jp syntax_error
      00169E                       4058 1$:  
      009538 05 90 AE         [ 2] 4059 	cpw x,#to 
      00953B 16 90            [ 1] 4060 	jreq to
      00953D CD 93 CB         [ 2] 4061 	jp syntax_error 
                                   4062 
                                   4063 ;-----------------------------------
                                   4064 ; BASIC: TO expr 
                                   4065 ; second part of FOR loop initilization
                                   4066 ; leave limit on stack and set 
                                   4067 ; FTO bit in 'flags'
                                   4068 ;-----------------------------------
      0016A6                       4069 to: ; { var_addr -- var_addr limit step }
      009540 CD A7 C0 A6 0D   [ 2] 4070 	btjt flags,#FLOOP,1$
      009545 CD 83 40         [ 2] 4071 	jp syntax_error
      009548 81 11 50         [ 4] 4072 1$: call relation  
      009549 A1 84            [ 1] 4073 	cp a,#TK_INTGR 
      009549 4B 00            [ 1] 4074 	jreq 2$ 
      00954B CC 08 7B         [ 2] 4075 	jp syntax_error
      00954B 0F 01            [ 2] 4076 2$: ldw (LIMIT,sp),x
                                   4077 ;	ldw x,in.w 
      00954D CD 09 6D         [ 4] 4078 	call next_token
      00954D CD 89            [ 1] 4079 	cp a,#TK_NONE  
      00954F ED A1            [ 1] 4080 	jreq 4$ 
      009551 02 25            [ 1] 4081 	cp a,#TK_CMD
      009553 5A A1            [ 1] 4082 	jrne 3$
      009555 02 27 12         [ 2] 4083 	cpw x,#step 
      009558 A1 03            [ 1] 4084 	jreq step
      0016CA                       4085 3$:	
      0016CA                       4086 	_unget_token   	 
      00955A 27 13 A1 82 27   [ 1]    1     mov in,in.saved
      0016CF                       4087 4$:	
      00955F 15 A1 09         [ 2] 4088 	ldw x,#1   ; default step  
      009562 27 18            [ 2] 4089 	ldw (FSTEP,sp),x 
      009564 A1 0A            [ 2] 4090 	jra store_loop_addr 
                                   4091 
                                   4092 
                                   4093 ;----------------------------------
                                   4094 ; BASIC: STEP expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4095 ; optional third par of FOR loop
                                   4096 ; initialization. 	
                                   4097 ;------------------------------------
      0016D6                       4098 step: ; {var limit -- var limit step}
      009566 27 1B 20 2B 03   [ 2] 4099 	btjt flags,#FLOOP,1$
      00956A CC 08 7B         [ 2] 4100 	jp syntax_error
      00956A CD A7 C0         [ 4] 4101 1$: call relation
      00956D 20 DC            [ 1] 4102 	cp a,#TK_INTGR
      00956F 27 03            [ 1] 4103 	jreq 2$
      00956F 9F CD 83         [ 2] 4104 	jp syntax_error
      009572 40 20            [ 2] 4105 2$:	ldw (FSTEP,sp),x ; step
                                   4106 ; leave loop back entry point on cstack 
                                   4107 ; cstack is 1 call deep from interpreter
      0016EA                       4108 store_loop_addr:
      009574 D6 00 04         [ 2] 4109 	ldw x,basicptr  
      009575 1F 0B            [ 2] 4110 	ldw (BPTR,sp),x 
      009575 FD 9F CD         [ 2] 4111 	ldw x,in.w 
      009578 83 40            [ 2] 4112 	ldw (INW,sp),x   
      00957A 20 CF 00 23      [ 1] 4113 	bres flags,#FLOOP 
      00957C 72 5C 00 20      [ 1] 4114 	inc loop_depth  
      00957C A6               [ 4] 4115 	ret 
                                   4116 
                                   4117 ;--------------------------------
                                   4118 ; BASIC: NEXT var 
                                   4119 ; FOR loop control 
                                   4120 ; increment variable with step 
                                   4121 ; and compare with limit 
                                   4122 ; loop if threshold not crossed.
                                   4123 ; else stack. 
                                   4124 ; and decrement 'loop_depth' 
                                   4125 ;--------------------------------
      0016FD                       4126 next: ; {var limit step retl1 -- [var limit step ] }
      00957D FF 6B 01 CC      [ 1] 4127 	tnz loop_depth 
      009581 95 4D            [ 1] 4128 	jrne 1$ 
      009583 CC 08 7B         [ 2] 4129 	jp syntax_error 
      001706                       4130 1$: 
      009583 CD 89            [ 1] 4131 	ld a,#TK_VAR 
      009585 ED A1 84         [ 4] 4132 	call expect
                                   4133 ; check for good variable after NEXT 	 
      009588 27 03            [ 2] 4134 	cpw x,(CVAR,sp)
      00958A CC 88            [ 1] 4135 	jreq 2$  
      00958C FB 08 7B         [ 2] 4136 	jp syntax_error ; not the good one 
      00958D                       4137 2$: ; increment variable 
      00958D 9F               [ 2] 4138 	ldw x,(x)  ; get var value 
      00958E A4 0F C7         [ 2] 4139 	addw x,(FSTEP,sp) ; var+step 
      009591 00 25            [ 2] 4140 	ldw y,(CVAR,sp)
      009593 20 B6            [ 2] 4141 	ldw (y),x ; save var new value 
                                   4142 ; check sign of STEP  
      009595 A6 80            [ 1] 4143 	ld a,#0x80
      009595 55 00            [ 1] 4144 	bcp a,(FSTEP,sp)
      009597 03 00            [ 1] 4145 	jrpl 4$
                                   4146 ;negative step 
      009599 02 CD            [ 2] 4147 	cpw x,(LIMIT,sp)
      00959B 91 D0            [ 1] 4148 	jrslt loop_done
      00959D A1 84            [ 2] 4149 	jra loop_back 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      001726                       4150 4$: ; positive step
      00959F 27 08            [ 2] 4151 	cpw x,(LIMIT,sp)
      0095A1 55 00            [ 1] 4152 	jrsgt loop_done
      00172A                       4153 loop_back:
      0095A3 03 00            [ 2] 4154 	ldw x,(BPTR,sp)
      0095A5 02 CC 95         [ 2] 4155 	ldw basicptr,x 
      0095A8 AE CD 8A 42 20   [ 2] 4156 	btjf flags,#FRUN,1$ 
      0095AD 9D 02            [ 1] 4157 	ld a,(2,x)
      0095AE C7 00 03         [ 1] 4158 	ld count,a
      0095AE 0D 01            [ 2] 4159 1$:	ldw x,(INW,sp)
      0095B0 26 05 A6         [ 2] 4160 	ldw in.w,x 
      0095B3 0D               [ 4] 4161 	ret 
      00173F                       4162 loop_done:
                                   4163 	; remove loop data from stack  
      0095B4 CD               [ 2] 4164 	popw x
      001740                       4165 	_drop VSIZE 
      0095B5 83 40            [ 2]    1     addw sp,#VSIZE 
      0095B7 5B 01 81 20      [ 1] 4166 	dec loop_depth 
                                   4167 ;	pushw x 
                                   4168 ;	ret 
      0095BA FC               [ 2] 4169 	jp (x)
                                   4170 
                                   4171 ;----------------------------
                                   4172 ; called by goto/gosub
                                   4173 ; to get target line number 
                                   4174 ;---------------------------
      0095BA                       4175 get_target_line:
      0095BA CE 00 05         [ 4] 4176 	call relation 
      0095BD 1F 03            [ 1] 4177 	cp a,#TK_INTGR
      0095BF C6 00            [ 1] 4178 	jreq 1$
      0095C1 02 6B 05         [ 2] 4179 	jp syntax_error
      0095C4 C6 00 04         [ 4] 4180 1$:	call search_lineno  
      0095C7 6B               [ 2] 4181 	tnzw x 
      0095C8 06 81            [ 1] 4182 	jrne 2$ 
      0095CA A6 05            [ 1] 4183 	ld a,#ERR_NO_LINE 
      0095CA 1E 03 CF         [ 2] 4184 	jp tb_error 
      0095CD 00               [ 4] 4185 2$:	ret 
                                   4186 
                                   4187 ;------------------------
                                   4188 ; BASIC: GOTO line# 
                                   4189 ; jump to line# 
                                   4190 ; here cstack is 2 call deep from interpreter 
                                   4191 ;------------------------
      00175D                       4192 goto:
      0095CE 05 7B 05 C7 00   [ 2] 4193 	btjt flags,#FRUN,0$ 
      0095D3 02 7B            [ 1] 4194 	ld a,#ERR_RUN_ONLY
      0095D5 06 C7 00         [ 2] 4195 	jp tb_error 
      0095D8 04               [ 4] 4196 	ret 
      0095D9 81 17 47         [ 4] 4197 0$:	call get_target_line
      0095DA                       4198 jp_to_target:
      0095DA 52 07 04         [ 2] 4199 	ldw basicptr,x 
      0095DC E6 02            [ 1] 4200 	ld a,(2,x)
      0095DC 0F 05 CD         [ 1] 4201 	ld count,a 
      0095DF 89 ED A1 02      [ 1] 4202 	mov in,#3 
      0095E3 26               [ 4] 4203 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4204 
                                   4205 
                                   4206 ;--------------------
                                   4207 ; BASIC: GOSUB line#
                                   4208 ; basic subroutine call
                                   4209 ; actual line# and basicptr 
                                   4210 ; are saved on cstack
                                   4211 ; here cstack is 2 call deep from interpreter 
                                   4212 ;--------------------
                           000003  4213 	RET_ADDR=3
                           000005  4214 	RET_INW=5
                           000004  4215 	VSIZE=4  
      001778                       4216 gosub:
      0095E4 08 CD A7 C0 03   [ 2] 4217 	btjt flags,#FRUN,0$ 
      0095E9 05 CD            [ 1] 4218 	ld a,#ERR_RUN_ONLY
      0095EB 89 ED A1         [ 2] 4219 	jp tb_error 
      0095EE 85               [ 4] 4220 	ret 
      0095EF 27               [ 2] 4221 0$:	popw x 
      001784                       4222 	_vars VSIZE  
      0095F0 03 CC            [ 2]    1     sub sp,#VSIZE 
      0095F2 88               [ 2] 4223 	pushw x 
      0095F3 FB 1F 06         [ 2] 4224 	ldw x,basicptr
      0095F6 0D 05            [ 2] 4225 	ldw (RET_ADDR,sp),x 
      0095F8 26 06 CD         [ 4] 4226 	call get_target_line  
      0095FB 93               [ 2] 4227 	pushw x 
      0095FC C3 CD 83         [ 2] 4228 	ldw x,in.w 
      0095FF 40 07            [ 2] 4229 	ldw (RET_INW+2,sp),x
      009600 85               [ 2] 4230 	popw x 
      009600 A6 3A            [ 2] 4231 	jra jp_to_target
                                   4232 
                                   4233 ;------------------------
                                   4234 ; BASIC: RETURN 
                                   4235 ; exit from a subroutine 
                                   4236 ; 
                                   4237 ;------------------------
      001798                       4238 return:
      009602 CD 83 40 CD 95   [ 2] 4239 	btjt flags,#FRUN,0$ 
      009607 BA 72            [ 1] 4240 	ld a,#ERR_RUN_ONLY
      009609 5F 00 04         [ 2] 4241 	jp tb_error 
      0017A2                       4242 0$:	
      00960C CD A8            [ 2] 4243 	ldw x,(RET_ADDR,sp) 
      00960E C5 AE 16         [ 2] 4244 	ldw basicptr,x
      009611 90 3B            [ 1] 4245 	ld a,(2,x)
      009613 00 04 4B         [ 1] 4246 	ld count,a  
      009616 00 72            [ 2] 4247 	ldw x,(RET_INW,sp)
      009618 FB 01 5C         [ 2] 4248 	ldw in.w,x 
      00961B 5B               [ 2] 4249 	popw x 
      0017B2                       4250 	_drop VSIZE 
      00961C 02 72            [ 2]    1     addw sp,#VSIZE 
      00961E 5F               [ 2] 4251 	pushw x
      00961F 00               [ 4] 4252 	ret  
                                   4253 
                                   4254 
                                   4255 ;----------------------------------
                                   4256 ; BASIC: RUN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4257 ; run BASIC program in RAM
                                   4258 ;----------------------------------- 
      0017B6                       4259 run: 
      009620 02 CD 8C 66 A1   [ 2] 4260 	btjf flags,#FRUN,0$  
      009625 84               [ 1] 4261 	clr a 
      009626 27               [ 4] 4262 	ret
      0017BD                       4263 0$: 
      009627 06 CD 95 CA CC   [ 2] 4264 	btjf flags,#FBREAK,1$
      0017C2                       4265 	_drop 2 
      00962C 88 FB            [ 2]    1     addw sp,#2 
      00962E 16 06 90         [ 4] 4266 	call rest_context
      0017C7                       4267 	_drop CTXT_SIZE 
      009631 FF CD            [ 2]    1     addw sp,#CTXT_SIZE 
      009633 95 CA CD 89      [ 1] 4268 	bres flags,#FBREAK 
      009637 ED A1 09 27      [ 1] 4269 	bset flags,#FRUN 
      00963B A0 A1 01         [ 2] 4270 	jp interpreter 
      00963E 23 03 CC         [ 2] 4271 1$:	ldw x,txtbgn
      009641 88 FB 1E         [ 2] 4272 	cpw x,txtend 
      009643 2B 0C            [ 1] 4273 	jrmi run_it 
      009643 5B 07 81         [ 2] 4274 	ldw x,#err_no_prog
      009646 CD 00 00         [ 4] 4275 	call puts 
      009646 55 00 04 00 02   [ 1] 4276 	mov in,count
      00964B 81               [ 4] 4277 	ret 
      00964C                       4278 run_it:	 
      00964C 52 04 0F         [ 4] 4279     call ubound 
      0017EB                       4280 	_drop 2 ; drop return address 
      00964F 01 CD            [ 2]    1     addw sp,#2 
                                   4281 ; clear data pointer 
      009651 90               [ 1] 4282 	clrw x 
      009652 8E A1 02         [ 2] 4283 	ldw data_ptr,x 
      009655 24 03 CC 88      [ 1] 4284 	clr data_ofs 
      009659 FB A1 03 25      [ 1] 4285 	clr data_len 
                                   4286 ; initialize BASIC pointer 
      00965D 04 85 9F         [ 2] 4287 	ldw x,txtbgn 
      009660 6B 01 85         [ 2] 4288 	ldw basicptr,x 
      009663 9F 6B            [ 1] 4289 	ld a,(2,x)
      009665 02 85 F6         [ 1] 4290 	ld count,a
      009668 14 02 18 01      [ 1] 4291 	mov in,#3	
      00966C 27 F9 5B 04      [ 1] 4292 	bset flags,#FRUN 
      009670 81 09 21         [ 2] 4293 	jp interpreter 
                                   4294 
                                   4295 
                                   4296 ;----------------------
                                   4297 ; BASIC: END
                                   4298 ; end running program
                                   4299 ;---------------------- 
      009671                       4300 cmd_end: 
                                   4301 ; clean stack 
      009671 CD 90 8E         [ 2] 4302 	ldw x,#STACK_EMPTY
      009674 A1               [ 1] 4303 	ldw sp,x 
      009675 02 27 03         [ 2] 4304 	jp warm_start
                                   4305 
                                   4306 ;-----------------
                                   4307 ; 1 Khz beep 
                                   4308 ;-----------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      001816                       4309 beep_1khz:: 
      009678 CC 88 FB         [ 2] 4310 	ldw x,#100
      00967B 90 AE 03 E8      [ 2] 4311 	ldw y,#1000
      00967B 85 9F            [ 2] 4312 	jra beep
                                   4313 
                                   4314 ;-----------------------
                                   4315 ; BASIC: TONE expr1,expr2
                                   4316 ; used TIMER2 channel 1
                                   4317 ; to produce a tone 
                                   4318 ; arguments:
                                   4319 ;    expr1   frequency 
                                   4320 ;    expr2   duration msec.
                                   4321 ;---------------------------
      00181F                       4322 tone:
      00967D 85 FA F7         [ 4] 4323 	call arg_list 
      009680 81 02            [ 1] 4324 	cp a,#2 
      009681 27 03            [ 1] 4325 	jreq 1$
      009681 CD 90 8E         [ 2] 4326 	jp syntax_error 
      001829                       4327 1$: 
      009684 A1               [ 2] 4328 	popw x ; duration
      009685 02 27            [ 2] 4329 	popw y ; frequency 
      00182C                       4330 beep:  
      009687 03               [ 2] 4331 	pushw x 
      009688 CC 88 FB         [ 2] 4332 	ldw x,#TIM2_CLK_FREQ
      00968B 65               [ 2] 4333 	divw x,y 
                                   4334 ; round to nearest integer 
      00968B 85 9F 43 85      [ 2] 4335 	cpw y,#TIM2_CLK_FREQ/2
      00968F F4 F7            [ 1] 4336 	jrmi 2$
      009691 81               [ 2] 4337 	incw x 
      009692                       4338 2$:	 
      009692 CD               [ 1] 4339 	ld a,xh 
      009693 90 8E A1         [ 1] 4340 	ld TIM2_ARRH,a 
      009696 02               [ 1] 4341 	ld a,xl 
      009697 27 03 CC         [ 1] 4342 	ld TIM2_ARRL,a 
                                   4343 ; 50% duty cycle 
      00969A 88               [ 1] 4344 	ccf 
      00969B FB               [ 2] 4345 	rrcw x 
      00969C 85               [ 1] 4346 	ld a,xh 
      00969D 9F 85 F8         [ 1] 4347 	ld TIM2_CCR1H,a 
      0096A0 F7               [ 1] 4348 	ld a,xl
      0096A1 81 53 10         [ 1] 4349 	ld TIM2_CCR1L,a
      0096A2 72 10 53 08      [ 1] 4350 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0096A2 CD 90 89 A1      [ 1] 4351 	bset TIM2_CR1,#TIM2_CR1_CEN
      0096A6 02 27 03 CC      [ 1] 4352 	bset TIM2_EGR,#TIM2_EGR_UG
      0096AA 88               [ 2] 4353 	popw x 
      0096AB FB 1D CF         [ 4] 4354 	call pause02
      0096AC 72 11 53 08      [ 1] 4355 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0096AC 85 9F A4 07      [ 1] 4356 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0096B0 88               [ 4] 4357 	ret 
                                   4358 
                                   4359 ;-------------------------------
                                   4360 ; BASIC: ADCON 0|1 [,divisor]  
                                   4361 ; disable/enanble ADC 
                                   4362 ;-------------------------------
                           000003  4363 	ONOFF=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                           000001  4364 	DIVSOR=1
                           000004  4365 	VSIZE=4 
      001863                       4366 power_adc:
      0096B1 A6 01 0D         [ 4] 4367 	call arg_list 
      0096B4 01 27            [ 1] 4368 	cp a,#2	
      0096B6 05 48            [ 1] 4369 	jreq 1$
      0096B8 0A 01            [ 1] 4370 	cp a,#1 
      0096BA 20 F7            [ 1] 4371 	jreq 0$ 
      0096BC 5B 01 85         [ 2] 4372 	jp syntax_error 
      0096BF F4 27 02         [ 2] 4373 0$: ldw x,#0
      0096C2 A6               [ 2] 4374 	pushw x  ; divisor 
      0096C3 01 5F            [ 2] 4375 1$: ldw x,(ONOFF,sp)
      0096C5 97               [ 2] 4376 	tnzw x 
      0096C6 A6 84            [ 1] 4377 	jreq 2$ 
      0096C8 81 01            [ 2] 4378 	ldw x,(DIVSOR,sp) ; divisor 
      0096C9 9F               [ 1] 4379 	ld a,xl
      0096C9 CD 90            [ 1] 4380 	and a,#7
      0096CB 8E               [ 1] 4381 	swap a 
      0096CC A1 02 27         [ 1] 4382 	ld ADC_CR1,a
      0096CF 03 CC 88 FB      [ 1] 4383 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096D3 72 10 54 01      [ 1] 4384 	bset ADC_CR1,#ADC_CR1_ADON 
      00188B                       4385 	_usec_dly 7 
      0096D3 85 9F 85         [ 2]    1     ldw x,#(16*7-2)/4
      0096D6 F7               [ 2]    2     decw x
      0096D7 81               [ 1]    3     nop 
      0096D8 26 FA            [ 1]    4     jrne .-4
      0096D8 CD 90            [ 2] 4386 	jra 3$
      0096DA 89 A1 01 27      [ 1] 4387 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096DE 03 CC 88 FB      [ 1] 4388 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00189C                       4389 3$:	_drop VSIZE 
      0096E2 85 F6            [ 2]    1     addw sp,#VSIZE 
      0096E4 5F               [ 4] 4390 	ret
                                   4391 
                                   4392 ;-----------------------------
                                   4393 ; BASIC: ADCREAD (channel)
                                   4394 ; read adc channel {0..5}
                                   4395 ; output:
                                   4396 ;   A 		TK_INTGR 
                                   4397 ;   X 		value 
                                   4398 ;-----------------------------
      00189F                       4399 analog_read:
      0096E5 97 A6 84         [ 4] 4400 	call func_args 
      0096E8 81 01            [ 1] 4401 	cp a,#1 
      0096E9 27 03            [ 1] 4402 	jreq 1$
      0096E9 CD 91 D0         [ 2] 4403 	jp syntax_error
      0096EC A1               [ 2] 4404 1$: popw x 
      0096ED 84 27 03         [ 2] 4405 	cpw x,#5 
      0096F0 CC 88            [ 2] 4406 	jrule 2$
      0096F2 FB 4F            [ 1] 4407 	ld a,#ERR_BAD_VALUE
      0096F4 5D 26 05         [ 2] 4408 	jp tb_error 
      0096F7 55               [ 1] 4409 2$: ld a,xl
      0096F8 00 04 00         [ 1] 4410 	ld acc8,a 
      0096FB 02 81            [ 1] 4411 	ld a,#5
      0096FD C0 00 0D         [ 1] 4412 	sub a,acc8 
      0096FD 85 52 0A         [ 1] 4413 	ld ADC_CSR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009700 89 A6 85 CD      [ 1] 4414 	bset ADC_CR2,#ADC_CR2_ALIGN
      009704 90 7C 1F 07      [ 1] 4415 	bset ADC_CR1,#ADC_CR1_ADON
      009708 CD 92 B3 72 14   [ 2] 4416 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00970D 00 24 5F         [ 2] 4417 	ldw x,ADC_DRH
      009710 1F 0B            [ 1] 4418 	ld a,#TK_INTGR
      009712 1F               [ 4] 4419 	ret 
                                   4420 
                                   4421 ;-----------------------
                                   4422 ; BASIC: DREAD(pin)
                                   4423 ; Arduino pins 
                                   4424 ; read state of a digital pin 
                                   4425 ; pin# {0..15}
                                   4426 ; output:
                                   4427 ;    A 		TK_INTGR
                                   4428 ;    X      0|1 
                                   4429 ;-------------------------
                           000001  4430 	PINNO=1
                           000001  4431 	VSIZE=1
      0018D3                       4432 digital_read:
      0018D3                       4433 	_vars VSIZE 
      009713 09 CD            [ 2]    1     sub sp,#VSIZE 
      009715 89 ED A1         [ 4] 4434 	call func_args
      009718 80 27            [ 1] 4435 	cp a,#1
      00971A 03 CC            [ 1] 4436 	jreq 1$
      00971C 88 FB 7B         [ 2] 4437 	jp syntax_error
      00971E 85               [ 2] 4438 1$: popw x 
      00971E A3 97 26         [ 2] 4439 	cpw x,#15 
      009721 27 03            [ 2] 4440 	jrule 2$
      009723 CC 88            [ 1] 4441 	ld a,#ERR_BAD_VALUE
      009725 FB 08 7D         [ 2] 4442 	jp tb_error 
      009726 CD 1F 02         [ 4] 4443 2$:	call select_pin 
      009726 72 04            [ 1] 4444 	ld (PINNO,sp),a
      009728 00 24            [ 1] 4445 	ld a,(GPIO_IDR,x)
      00972A 03 CC            [ 1] 4446 	tnz (PINNO,sp)
      00972C 88 FB            [ 1] 4447 	jreq 8$
      00972E CD               [ 1] 4448 3$: srl a 
      00972F 91 D0            [ 1] 4449 	dec (PINNO,sp)
      009731 A1 84            [ 1] 4450 	jrne 3$ 
      009733 27 03            [ 1] 4451 8$: and a,#1 
      009735 CC               [ 1] 4452 	clrw x 
      009736 88               [ 1] 4453 	ld xl,a 
      009737 FB 1F            [ 1] 4454 	ld a,#TK_INTGR
      001900                       4455 	_drop VSIZE
      009739 05 CD            [ 2]    1     addw sp,#VSIZE 
      00973B 89               [ 4] 4456 	ret
                                   4457 
                                   4458 ;-----------------------
                                   4459 ; BASIC: DWRITE pin,0|1
                                   4460 ; Arduino pins 
                                   4461 ; write to a digital pin 
                                   4462 ; pin# {0..15}
                                   4463 ; output:
                                   4464 ;    A 		TK_INTGR
                                   4465 ;    X      0|1 
                                   4466 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                           000001  4467 	PINNO=1
                           000002  4468 	PINVAL=2
                           000002  4469 	VSIZE=2
      001903                       4470 digital_write:
      001903                       4471 	_vars VSIZE 
      00973C ED A1            [ 2]    1     sub sp,#VSIZE 
      00973E 00 27 0E         [ 4] 4472 	call arg_list  
      009741 A1 80            [ 1] 4473 	cp a,#2 
      009743 26 05            [ 1] 4474 	jreq 1$
      009745 A3 97 56         [ 2] 4475 	jp syntax_error
      009748 27               [ 2] 4476 1$: popw x 
      009749 0C               [ 1] 4477 	ld a,xl 
      00974A 6B 02            [ 1] 4478 	ld (PINVAL,sp),a
      00974A 55               [ 2] 4479 	popw x 
      00974B 00 03 00         [ 2] 4480 	cpw x,#15 
      00974E 02 05            [ 2] 4481 	jrule 2$
      00974F A6 0A            [ 1] 4482 	ld a,#ERR_BAD_VALUE
      00974F AE 00 01         [ 2] 4483 	jp tb_error 
      009752 1F 03 20         [ 4] 4484 2$:	call select_pin 
      009755 14 01            [ 1] 4485 	ld (PINNO,sp),a 
      009756 A6 01            [ 1] 4486 	ld a,#1
      009756 72 04            [ 1] 4487 	tnz (PINNO,sp)
      009758 00 24            [ 1] 4488 	jreq 4$
      00975A 03               [ 1] 4489 3$: sll a
      00975B CC 88            [ 1] 4490 	dec (PINNO,sp)
      00975D FB CD            [ 1] 4491 	jrne 3$
      00975F 91 D0            [ 1] 4492 4$: tnz (PINVAL,sp)
      009761 A1 84            [ 1] 4493 	jrne 5$
      009763 27               [ 1] 4494 	cpl a 
      009764 03 CC            [ 1] 4495 	and a,(GPIO_ODR,x)
      009766 88 FB            [ 2] 4496 	jra 8$
      009768 1F 03            [ 1] 4497 5$: or a,(GPIO_ODR,x)
      00976A E7 00            [ 1] 4498 8$: ld (GPIO_ODR,x),a 
      00193B                       4499 	_drop VSIZE 
      00976A CE 00            [ 2]    1     addw sp,#VSIZE 
      00976C 05               [ 4] 4500 	ret
                                   4501 
                                   4502 
                                   4503 ;-----------------------
                                   4504 ; BASIC: STOP
                                   4505 ; stop progam execution  
                                   4506 ; without resetting pointers 
                                   4507 ; the program is resumed
                                   4508 ; with RUN 
                                   4509 ;-------------------------
      00193E                       4510 stop:
      00976D 1F 0B CE 00 01   [ 2] 4511 	btjt flags,#FRUN,2$
      009772 1F               [ 1] 4512 	clr a
      009773 09               [ 4] 4513 	ret 
      001945                       4514 2$:	 
                                   4515 ; create space on cstack to save context 
      009774 72 15 00         [ 2] 4516 	ldw x,#break_point 
      009777 24 72 5C         [ 4] 4517 	call puts 
      00194B                       4518 	_drop 2 ;drop return address 
      00977A 00 21            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00194D                       4519 	_vars CTXT_SIZE ; context size 
      00977C 81 04            [ 2]    1     sub sp,#CTXT_SIZE 
      00977D CD 15 3A         [ 4] 4520 	call save_context 
      00977D 72 5D 00         [ 2] 4521 	ldw x,#tib 
      009780 21 26 03         [ 2] 4522 	ldw basicptr,x
      009783 CC               [ 1] 4523 	clr (x)
      009784 88 FB 00 03      [ 1] 4524 	clr count  
      009786 5F               [ 1] 4525 	clrw x 
      009786 A6 85 CD         [ 2] 4526 	ldw in.w,x
      009789 90 7C 13 07      [ 1] 4527 	bres flags,#FRUN 
      00978D 27 03 CC 88      [ 1] 4528 	bset flags,#FBREAK
      009791 FB 09 21         [ 2] 4529 	jp interpreter 
      009792 0A 62 72 65 61 6B 20  4530 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4531 
                                   4532 ;-----------------------
                                   4533 ; BASIC: NEW
                                   4534 ; from command line only 
                                   4535 ; free program memory
                                   4536 ; and clear variables 
                                   4537 ;------------------------
      00198A                       4538 new: 
      009792 FE 72 FB 03 16   [ 2] 4539 	btjf flags,#FRUN,0$ 
      009797 07               [ 4] 4540 	ret 
      001990                       4541 0$:	
      009798 90 FF A6         [ 4] 4542 	call clear_basic 
      00979B 80               [ 4] 4543 	ret 
                                   4544 	 
                                   4545 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4546 ;  file system routines
                                   4547 ;  MCU flash memory from
                                   4548 ;  0x10000-0x27fff is 
                                   4549 ;  used to store BASIC 
                                   4550 ;  program files. 
                                   4551 ;  use 128 bytes sectors
                                   4552 ;  because this is the MCU 
                                   4553 ;  row size.
                                   4554 ;  file entry aligned to row
                                   4555 ;  	name  variable length
                                   4556 ;  	size  2 bytes  
                                   4557 ; 	data  variable length 
                                   4558 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4559 
                                   4560 ;---------------------------
                                   4561 ; fill pad with zeros 
                                   4562 ;--------------------------
      001994                       4563 zero_pad:
      00979C 15 03 2A         [ 2] 4564 	ldw x,#pad 
      00979F 06 13            [ 1] 4565 	ld a,#PAD_SIZE 
      0097A1 05               [ 1] 4566 1$:	clr (x)
      0097A2 2F               [ 2] 4567 	incw x 
      0097A3 1B               [ 1] 4568 	dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097A4 20 04            [ 1] 4569 	jrne 1$
      0097A6 81               [ 4] 4570 	ret 
                                   4571 
                                   4572 ;--------------------------
                                   4573 ; align farptr to BLOCK_SIZE 
                                   4574 ;---------------------------
      00199F                       4575 row_align:
      0097A6 13 05            [ 1] 4576 	ld a,#0x7f 
      0097A8 2C 15 18         [ 1] 4577 	and a,farptr+2 
      0097AA 27 13            [ 1] 4578 	jreq 1$ 
      0097AA 1E 0B CF         [ 2] 4579 	ldw x,farptr+1 
      0097AD 00 05 72         [ 2] 4580 	addw x,#BLOCK_SIZE 
      0097B0 01 00            [ 1] 4581 	jrnc 0$
      0097B2 24 05 E6 02      [ 1] 4582 	inc farptr 
      0097B6 C7               [ 1] 4583 0$: ld a,xl 
      0097B7 00 04            [ 1] 4584 	and a,#0x80
      0097B9 1E               [ 1] 4585 	ld xl,a
      0097BA 09 CF 00         [ 2] 4586 	ldw farptr+1,x  	
      0097BD 01               [ 4] 4587 1$:	ret
                                   4588 
                                   4589 ;--------------------
                                   4590 ; input:
                                   4591 ;   X     increment 
                                   4592 ; output:
                                   4593 ;   farptr  incremented 
                                   4594 ;---------------------
      0019BA                       4595 incr_farptr:
      0097BE 81 BB 00 17      [ 2] 4596 	addw x,farptr+1 
      0097BF 24 04            [ 1] 4597 	jrnc 1$
      0097BF 85 5B 0A 72      [ 1] 4598 	inc farptr 
      0097C3 5A 00 21         [ 2] 4599 1$:	ldw farptr+1,x  
      0097C6 FC               [ 4] 4600 	ret 
                                   4601 
                                   4602 ;------------------------------
                                   4603 ; extended flash memory used as FLASH_DRIVE 
                                   4604 ; seek end of used flash drive   
                                   4605 ; starting at 0x10000 address.
                                   4606 ; 4 consecutives 0 bytes signal free space. 
                                   4607 ; input:
                                   4608 ;	none
                                   4609 ; output:
                                   4610 ;   ffree     free_addr| 0 if memory full.
                                   4611 ;------------------------------
      0097C7                       4612 seek_fdrive:
                                   4613 ; start scan at 0x10000 address 
      0097C7 CD 91            [ 1] 4614 	ld a,#1
      0097C9 D0 A1 84         [ 1] 4615 	ld farptr,a 
      0097CC 27               [ 1] 4616 	clrw x 
      0097CD 03 CC 88         [ 2] 4617 	ldw farptr+1,x 
      0019D1                       4618 1$:
      0097D0 FB CD 84         [ 2] 4619 	ldw x,#3  
      0097D3 84 5D 26 05      [ 5] 4620 2$:	ldf a,([farptr],x) 
      0097D7 A6 05            [ 1] 4621 	jrne 3$
      0097D9 CC               [ 2] 4622 	decw x
      0097DA 88 FD            [ 1] 4623 	jrpl 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097DC 81 0E            [ 2] 4624 	jra 4$ 
      0097DD AE 00 80         [ 2] 4625 3$:	ldw x,#BLOCK_SIZE 
      0097DD 72 00 00         [ 4] 4626 	call incr_farptr
      0097E0 24 06 A6         [ 2] 4627 	ldw x,#0x280  
      0097E3 06 CC 88         [ 2] 4628 	cpw x,farptr
      0097E6 FD 81            [ 1] 4629 	jrmi 1$
      0019ED                       4630 4$: ; copy farptr to ffree	 
      0097E8 CD 97 C7         [ 2] 4631 	ldw x,farptr 
      0097EB C6 00 18         [ 1] 4632 	ld a,farptr+2 
      0097EB CF 00 05         [ 2] 4633 	ldw ffree,x 
      0097EE E6 02 C7         [ 1] 4634 	ld ffree+2,a  
      0097F1 00               [ 4] 4635 	ret 
                                   4636 
                                   4637 ;-----------------------
                                   4638 ; return amount of free 
                                   4639 ; space on flash drive
                                   4640 ; input:
                                   4641 ;   none
                                   4642 ; output:
                                   4643 ;   acc24   free space 
                                   4644 ;-----------------------
      0019FA                       4645 disk_free:
      0097F2 04 35 03         [ 2] 4646 	ldw x,#0x8000
      0097F5 00 02 81 1A      [ 2] 4647 	subw x,ffree+1
      0097F8 A6 02            [ 1] 4648 	ld a,#2
      0097F8 72 00 00         [ 1] 4649 	sbc a,ffree 
      0097FB 24 06 A6         [ 1] 4650 	ld acc24,a 
      0097FE 06 CC 88         [ 2] 4651 	ldw acc16,x 
      009801 FD               [ 4] 4652 	ret 
                                   4653 
                                   4654 ;-----------------------
                                   4655 ; compare file name 
                                   4656 ; with name pointed by Y  
                                   4657 ; input:
                                   4658 ;   farptr   file name 
                                   4659 ;   Y        target name 
                                   4660 ; output:
                                   4661 ;   farptr 	 at file_name
                                   4662 ;   X 		 farptr[x] point at size field  
                                   4663 ;   Carry    0|1 no match|match  
                                   4664 ;----------------------
      001A0D                       4665 cmp_name:
      009802 81               [ 1] 4666 	clrw x
      009803 85 52 04 89      [ 5] 4667 1$:	ldf a,([farptr],x)
      009807 CE 00            [ 1] 4668 	cp a,(y)
      009809 05 1F            [ 1] 4669 	jrne 4$
      00980B 03               [ 1] 4670 	tnz a 
      00980C CD 97            [ 1] 4671 	jreq 9$ 
      00980E C7               [ 2] 4672     incw x 
      00980F 89 CE            [ 2] 4673 	incw y 
      009811 00 01            [ 2] 4674 	jra 1$
      001A1E                       4675 4$: ;no match 
      009813 1F               [ 1] 4676 	tnz a 
      009814 07 85            [ 1] 4677 	jreq 5$
      009816 20               [ 2] 4678 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009817 D3 AF 00 16      [ 5] 4679 	ldf a,([farptr],x)
      009818 20 F6            [ 2] 4680 	jra 4$  
      009818 72               [ 2] 4681 5$:	incw x ; farptr[x] point at 'size' field 
      009819 00               [ 1] 4682 	rcf 
      00981A 00               [ 4] 4683 	ret
      001A2B                       4684 9$: ; match  
      00981B 24               [ 2] 4685 	incw x  ; farptr[x] at 'size' field 
      00981C 05               [ 1] 4686 	scf 
      00981D A6               [ 4] 4687 	ret 
                                   4688 
                                   4689 ;-----------------------
                                   4690 ; search file in 
                                   4691 ; flash memory 
                                   4692 ; input:
                                   4693 ;   Y       file name  
                                   4694 ; output:
                                   4695 ;   farptr  addr at name|0
                                   4696 ;   X       offset to size field
                                   4697 ;-----------------------
                           000001  4698 	FSIZE=1
                           000003  4699 	YSAVE=3
                           000004  4700 	VSIZE=4 
      001A2E                       4701 search_file: 
      001A2E                       4702 	_vars VSIZE
      00981E 06 CC            [ 2]    1     sub sp,#VSIZE 
      009820 88 FD            [ 2] 4703 	ldw (YSAVE,sp),y  
      009822 5F               [ 1] 4704 	clrw x 
      009822 1E 03 CF         [ 2] 4705 	ldw farptr+1,x 
      009825 00 05 E6 02      [ 1] 4706 	mov farptr,#1
      001A3A                       4707 1$:	
                                   4708 ; check if farptr is after any file 
                                   4709 ; if  0 then so.
      009829 C7 00 04 1E      [ 5] 4710 	ldf a,[farptr]
      00982D 05 CF            [ 1] 4711 	jreq 6$
      00982F 00               [ 1] 4712 2$: clrw x 	
      009830 01 85            [ 2] 4713 	ldw y,(YSAVE,sp) 
      009832 5B 04 89         [ 4] 4714 	call cmp_name
      009835 81 2F            [ 1] 4715 	jrc 9$
      009836 92 AF 00 16      [ 5] 4716 	ldf a,([farptr],x)
      009836 72 01            [ 1] 4717 	ld (FSIZE,sp),a 
      009838 00               [ 2] 4718 	incw x 
      009839 24 02 4F 81      [ 5] 4719 	ldf a,([farptr],x)
      00983D 6B 02            [ 1] 4720 	ld (FSIZE+1,sp),a 
      00983D 72               [ 2] 4721 	incw x 
      00983E 09 00 24         [ 2] 4722 	addw x,(FSIZE,sp) ; skip over file data
      009841 12 5B 02         [ 4] 4723 	call incr_farptr
      009844 CD 95 CA         [ 4] 4724 	call row_align  
      009847 5B 04 72         [ 2] 4725 	ldw x,#0x280
      00984A 19 00 24         [ 2] 4726 	cpw x,farptr 
      00984D 72 10            [ 1] 4727 	jrpl 1$
      001A67                       4728 6$: ; file not found 
      00984F 00 24 CC 89      [ 1] 4729 	clr farptr
      009853 A1 CE 00 1D      [ 1] 4730 	clr farptr+1 
      009857 C3 00 1F 2B      [ 1] 4731 	clr farptr+2 
      001A73                       4732 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00985B 0C AE            [ 2]    1     addw sp,#VSIZE 
      00985D 88               [ 1] 4733 	rcf
      00985E 96               [ 4] 4734 	ret
      001A77                       4735 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A77                       4736 	_drop VSIZE 
      00985F CD A7            [ 2]    1     addw sp,#VSIZE 
      009861 C0               [ 1] 4737 	scf 	
      009862 55               [ 4] 4738 	ret
                                   4739 
                                   4740 ;--------------------------------
                                   4741 ; BASIC: SAVE "name" 
                                   4742 ; save text program in 
                                   4743 ; flash memory used as permanent
                                   4744 ; storage from address 0x10000-0x27fff 
                                   4745 ;--------------------------------
                           000001  4746 	BSIZE=1
                           000003  4747 	NAMEPTR=3
                           000005  4748 	XSAVE=5
                           000007  4749 	YSAVE=7
                           000008  4750 	VSIZE=8 
      001A7B                       4751 save:
      009863 00 04 00 02 81   [ 2] 4752 	btjf flags,#FRUN,0$ 
      009868 A6 07            [ 1] 4753 	ld a,#ERR_CMD_ONLY 
      009868 CD 92 80         [ 2] 4754 	jp tb_error
      001A85                       4755 0$:	 
      00986B 5B 02 5F         [ 2] 4756 	ldw x,txtend 
      00986E CF 00 07 72      [ 2] 4757 	subw x,txtbgn
      009872 5F 00            [ 1] 4758 	jrne 1$
                                   4759 ; nothing to save 
      009874 09 72 5F         [ 2] 4760 	ldw x,#err_no_prog 
      009877 00 0A CE         [ 4] 4761 	call puts 
      00987A 00 1D CF 00 05   [ 1] 4762 	mov in,count 
      00987F E6               [ 4] 4763 	ret  	
      001A9A                       4764 1$:	
      001A9A                       4765 	_vars VSIZE 
      009880 02 C7            [ 2]    1     sub sp,#VSIZE 
      009882 00 04            [ 2] 4766 	ldw (BSIZE,sp),x 
      009884 35 03 00         [ 4] 4767 	call next_token	
      009887 02 72            [ 1] 4768 	cp a,#TK_QSTR
      009889 10 00            [ 1] 4769 	jreq 2$
      00988B 24 CC 89         [ 2] 4770 	jp syntax_error
      001AA8                       4771 2$: 
      00988E A1 03            [ 2] 4772 	ldw (NAMEPTR,sp),x  
      00988F CD 01 74         [ 4] 4773 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4774 ; check if enough free space 
      00988F AE 17 FF         [ 4] 4775 	call strlen 
      009892 94 CC 89         [ 2] 4776 	addw x,#3 
      009895 82 FB 01         [ 2] 4777 	addw x,(BSIZE,sp)
      009896 4F               [ 1] 4778 	clr a 
      009896 AE 00 64 90      [ 2] 4779 	addw x,ffree+1 
      00989A AE 03 E8         [ 1] 4780 	adc a,ffree 
      00989D 20 0D            [ 1] 4781 	cp a,#2
      00989F 2B 0A            [ 1] 4782 	jrmi 21$
      00989F CD 90 8E         [ 2] 4783 	cpw x,#0x8000
      0098A2 A1 02            [ 1] 4784 	jrmi 21$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098A4 27 03            [ 1] 4785 	ld a,#ERR_NO_FSPACE  
      0098A6 CC 88 FB         [ 2] 4786 	jp tb_error
      0098A9                       4787 21$: 
                                   4788 ; check for existing file of that name 
      0098A9 85 90            [ 2] 4789 	ldw y,(NAMEPTR,sp)	
      0098AB 85 1A 2E         [ 4] 4790 	call search_file 
      0098AC 24 05            [ 1] 4791 	jrnc 3$ 
      0098AC 89 AE            [ 1] 4792 	ld a,#ERR_DUPLICATE 
      0098AE F4 24 65         [ 2] 4793 	jp tb_error 
      001AD8                       4794 3$:	; initialize farptr 
      0098B1 90 A3 7A         [ 2] 4795 	ldw x,ffree 
      0098B4 12 2B 01         [ 1] 4796 	ld a,ffree+2 
      0098B7 5C 00 16         [ 2] 4797 	ldw farptr,x 
      0098B8 C7 00 18         [ 1] 4798 	ld farptr+2,a 
                                   4799 ;** write file name to row buffer **	
      0098B8 9E C7            [ 2] 4800 	ldw y,(NAMEPTR,sp)  
      0098BA 53 0D 9F         [ 2] 4801 	ldw x,#pad 
      0098BD C7 53 0E         [ 4] 4802 	call strcpy
      0098C0 8C 56 9E         [ 4] 4803 	call strlen 
      0098C3 C7               [ 2] 4804 	incw  x
      0098C4 53 0F 9F         [ 2] 4805 	addw x,#pad 
                                   4806 ; ** write file size to row buffer 
      0098C7 C7 53            [ 2] 4807 	ldw y,(BSIZE,sp)
      0098C9 10               [ 2] 4808 	ldw (x),y 
      0098CA 72 10 53         [ 2] 4809 	addw x,#2 
                                   4810 ; ** write file data to row buffer 
      0098CD 08 72 10 53      [ 2] 4811 	ldw y,txtbgn 
      0098D1 00 72            [ 1] 4812 6$:	ld a,(y)
      0098D3 10 53            [ 2] 4813 	incw y
      0098D5 04               [ 1] 4814 	ld (x),a 
      0098D6 85               [ 2] 4815 	incw x
      0098D7 CD 9E 4F 72      [ 2] 4816 	cpw y,txtend 
      0098DB 11 53            [ 1] 4817 	jreq 12$
      0098DD 08 72 11         [ 2] 4818 	cpw x,#stack_full 
      0098E0 53 00            [ 1] 4819 	jrmi 6$
      001B0E                       4820 12$:
      0098E2 81 07            [ 2] 4821 	ldw (YSAVE,sp),y 
      0098E3                       4822 14$: ; zero buffer end 
      0098E3 CD 90 8E         [ 2] 4823 	cpw x,#stack_full
      0098E6 A1 02            [ 1] 4824 	jreq 16$
      0098E8 27               [ 1] 4825 	clr (x)
      0098E9 0B               [ 2] 4826 	incw x 
      0098EA A1 01            [ 2] 4827 	jra 14$
      001B19                       4828 16$:
      0098EC 27 03 CC         [ 2] 4829 	ldw x,#pad 
      0098EF 88 FB AE         [ 4] 4830 	call write_row 
      0098F2 00 00 89         [ 2] 4831 	ldw x,#BLOCK_SIZE 
      0098F5 1E 03 5D         [ 4] 4832 	call incr_farptr
      0098F8 27 1A 1E         [ 2] 4833 	ldw x,#pad 
      0098FB 01 9F            [ 2] 4834 	ldw y,(YSAVE,sp)
      0098FD A4 07 4E C7      [ 2] 4835 	cpw y,txtend 
      009901 54 01            [ 1] 4836 	jrmi 6$
                                   4837 ; save farptr in ffree
      009903 72 16 50         [ 2] 4838 	ldw x,farptr 
      009906 CA 72 10         [ 1] 4839 	ld a,farptr+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009909 54 01 AE         [ 2] 4840 	ldw ffree,x 
      00990C 00 1B 5A         [ 1] 4841 	ld ffree+2,a
                                   4842 ; print file size 	
      00990F 9D 26            [ 2] 4843 	ldw x,(BSIZE,sp) 
      009911 FA 20 08         [ 4] 4844 	call print_int 
      001B41                       4845 	_drop VSIZE 
      009914 72 11            [ 2]    1     addw sp,#VSIZE 
      009916 54               [ 4] 4846 	ret 
                                   4847 
                                   4848 ;----------------------
                                   4849 ; load file in RAM memory
                                   4850 ; input:
                                   4851 ;    farptr point at file size 
                                   4852 ; output:
                                   4853 ;   y point after BASIC program in RAM.
                                   4854 ;------------------------
      001B44                       4855 load_file:
      009917 01 72 17         [ 4] 4856 	call incr_farptr  
      00991A 50 CA 5B         [ 4] 4857 	call clear_basic  
      00991D 04               [ 1] 4858 	clrw x
      00991E 81 AF 00 16      [ 5] 4859 	ldf a,([farptr],x)
      00991F 90 95            [ 1] 4860 	ld yh,a 
      00991F CD               [ 2] 4861 	incw x  
      009920 90 89 A1 01      [ 5] 4862 	ldf a,([farptr],x)
      009924 27               [ 2] 4863 	incw x 
      009925 03 CC            [ 1] 4864 	ld yl,a 
      009927 88 FB 85 A3      [ 2] 4865 	addw y,txtbgn
      00992B 00 05 23 05      [ 2] 4866 	ldw txtend,y
      00992F A6 0A CC 88      [ 2] 4867 	ldw y,txtbgn
      001B65                       4868 3$:	; load BASIC text 	
      009933 FD 9F C7 00      [ 5] 4869 	ldf a,([farptr],x)
      009937 0E A6            [ 1] 4870 	ld (y),a 
      009939 05               [ 2] 4871 	incw x 
      00993A C0 00            [ 2] 4872 	incw y 
      00993C 0E C7 54 00      [ 2] 4873 	cpw y,txtend 
      009940 72 16            [ 1] 4874 	jrmi 3$
      009942 54               [ 4] 4875 	ret 
                                   4876 
                                   4877 ;------------------------
                                   4878 ; BASIC: LOAD "file" 
                                   4879 ; load file to RAM 
                                   4880 ; for execution 
                                   4881 ;------------------------
      001B75                       4882 load:
      009943 02 72 10 54 01   [ 2] 4883 	btjf flags,#FRUN,0$ 
      009948 72 0F            [ 1] 4884 	jreq 0$ 
      00994A 54 00            [ 1] 4885 	ld a,#ERR_CMD_ONLY 
      00994C FB CE 54         [ 2] 4886 	jp tb_error 
      001B81                       4887 0$:	
      00994F 04 A6 84         [ 4] 4888 	call next_token 
      009952 81 02            [ 1] 4889 	cp a,#TK_QSTR
      009953 27 03            [ 1] 4890 	jreq 1$
      009953 52 01 CD         [ 2] 4891 	jp syntax_error 
      009956 90 89            [ 1] 4892 1$:	ldw y,x 
      009958 A1 01 27         [ 4] 4893 	call search_file 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00995B 03 CC            [ 1] 4894 	jrc 2$ 
      00995D 88 FB            [ 1] 4895 	ld a,#ERR_NOT_FILE
      00995F 85 A3 00         [ 2] 4896 	jp tb_error  
      001B97                       4897 2$:
      009962 0F 23 05         [ 4] 4898 	call load_file
                                   4899 ; print loaded size 	 
      009965 A6 0A CC         [ 2] 4900 	ldw x,txtend 
      009968 88 FD CD 9F      [ 2] 4901 	subw x,txtbgn
      00996C 82 6B 01         [ 4] 4902 	call print_int 
      00996F E6               [ 4] 4903 	ret 
                                   4904 
                                   4905 ;-----------------------------------
                                   4906 ; BASIC: FORGET ["file_name"] 
                                   4907 ; erase file_name and all others 
                                   4908 ; after it. 
                                   4909 ; without argument erase all files 
                                   4910 ;-----------------------------------
                           000001  4911 	NEW_FREE=1 
                           000003  4912 	VSIZE=3 
      001BA5                       4913 forget:
      001BA5                       4914 	_vars VSIZE 
      009970 01 0D            [ 2]    1     sub sp,#VSIZE 
      009972 01 27 05         [ 4] 4915 	call next_token 
      009975 44 0A            [ 1] 4916 	cp a,#TK_NONE 
      009977 01 26            [ 1] 4917 	jreq 3$ 
      009979 FB A4            [ 1] 4918 	cp a,#TK_QSTR
      00997B 01 5F            [ 1] 4919 	jreq 1$
      00997D 97 A6 84         [ 2] 4920 	jp syntax_error
      009980 5B 01            [ 1] 4921 1$: ldw y,x 
      009982 81 00 03 00 01   [ 1] 4922 	mov in,count 
      009983 CD 1A 2E         [ 4] 4923 	call search_file
      009983 52 02            [ 1] 4924 	jrc 2$
      009985 CD 90            [ 1] 4925 	ld a,#ERR_NOT_FILE 
      009987 8E A1 02         [ 2] 4926 	jp tb_error 
      001BC6                       4927 2$: 
      00998A 27 03 CC         [ 2] 4928 	ldw x,farptr
      00998D 88 FB 85         [ 1] 4929 	ld a,farptr+2
      009990 9F 6B            [ 2] 4930 	jra 4$ 
      001BCE                       4931 3$: ; forget all files 
      009992 02 85 A3         [ 2] 4932 	ldw x,#0x100
      009995 00               [ 1] 4933 	clr a 
      009996 0F 23 05         [ 2] 4934 	ldw farptr,x 
      009999 A6 0A CC         [ 1] 4935 	ld farptr+2,a 
      001BD8                       4936 4$:	; save new free address 
      00999C 88 FD            [ 2] 4937 	ldw (NEW_FREE,sp),x
      00999E CD 9F            [ 1] 4938 	ld (NEW_FREE+2,sp),a 
      0099A0 82 6B 01         [ 4] 4939 	call move_erase_to_ram
      0099A3 A6 01 0D         [ 4] 4940 5$: call block_erase 
      0099A6 01 27 05         [ 2] 4941 	ldw x,#BLOCK_SIZE 
      0099A9 48 0A 01         [ 4] 4942 	call incr_farptr 
      0099AC 26 FB 0D         [ 4] 4943 	call row_align 
                                   4944 ; check if all blocks erased
      0099AF 02 26 05         [ 1] 4945 	ld a,farptr+2  
      0099B2 43 E4 00         [ 1] 4946 	sub a,ffree+2
      0099B5 20 02 EA         [ 1] 4947 	ld a,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099B8 00 E7 00         [ 1] 4948 	sbc a,ffree+1 
      0099BB 5B 02 81         [ 1] 4949 	ld a,farptr 
      0099BE C2 00 19         [ 1] 4950 	sbc a,ffree 
      0099BE 72 00            [ 1] 4951 	jrmi 5$ 
      0099C0 00 24            [ 1] 4952 	ld a,(NEW_FREE+2,sp)
      0099C2 02 4F            [ 2] 4953 	ldw x,(NEW_FREE,sp)
      0099C4 81 00 1B         [ 1] 4954 	ld ffree+2,a 
      0099C5 CF 00 19         [ 2] 4955 	ldw ffree,x 
      001C09                       4956 	_drop VSIZE 
      0099C5 AE 99            [ 2]    1     addw sp,#VSIZE 
      0099C7 EC               [ 4] 4957 	ret 
                                   4958 
                                   4959 ;----------------------
                                   4960 ; BASIC: DIR 
                                   4961 ; list saved files 
                                   4962 ;----------------------
                           000001  4963 	COUNT=1 ; files counter 
                           000002  4964 	VSIZE=2 
      001C0C                       4965 directory:
      001C0C                       4966 	_vars VSIZE 
      0099C8 CD A7            [ 2]    1     sub sp,#VSIZE 
      0099CA C0               [ 1] 4967 	clrw x 
      0099CB 5B 02            [ 2] 4968 	ldw (COUNT,sp),x 
      0099CD 52 04 CD         [ 2] 4969 	ldw farptr+1,x 
      0099D0 95 BA AE 16      [ 1] 4970 	mov farptr,#1 
      001C18                       4971 dir_loop:
      0099D4 90               [ 1] 4972 	clrw x 
      0099D5 CF 00 05 7F      [ 5] 4973 	ldf a,([farptr],x)
      0099D9 72 5F            [ 1] 4974 	jreq 8$ 
      001C1F                       4975 1$: ;name loop 	
      0099DB 00 04 5F CF      [ 5] 4976 	ldf a,([farptr],x)
      0099DF 00 01            [ 1] 4977 	jreq 2$ 
      0099E1 72 11 00         [ 4] 4978 	call putc 
      0099E4 24               [ 2] 4979 	incw x 
      0099E5 72 18            [ 2] 4980 	jra 1$
      0099E7 00               [ 2] 4981 2$: incw x ; skip ending 0. 
      0099E8 24 CC            [ 1] 4982 	ld a,#SPACE 
      0099EA 89 A1 0A         [ 4] 4983 	call putc 
                                   4984 ; get file size 	
      0099ED 62 72 65 61      [ 5] 4985 	ldf a,([farptr],x)
      0099F1 6B 20            [ 1] 4986 	ld yh,a 
      0099F3 70               [ 2] 4987 	incw x 
      0099F4 6F 69 6E 74      [ 5] 4988 	ldf a,([farptr],x)
      0099F8 2C               [ 2] 4989 	incw x 
      0099F9 20 52            [ 1] 4990 	ld yl,a 
      0099FB 55 4E            [ 2] 4991 	pushw y 
      0099FD 20 74 6F         [ 2] 4992 	addw x,(1,sp)
                                   4993 ; skip to next file 
      009A00 20 72 65         [ 4] 4994 	call incr_farptr
      009A03 73 75 6D         [ 4] 4995 	call row_align
                                   4996 ; print file size 
      009A06 65               [ 2] 4997 	popw x ; file size 
      009A07 2E 0A 00         [ 4] 4998 	call print_int 
      009A0A A6 0D            [ 1] 4999 	ld a,#CR 
      009A0A 72 01 00         [ 4] 5000 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A0D 24 01            [ 2] 5001 	ldw x,(COUNT,sp)
      009A0F 81               [ 2] 5002 	incw x
      009A10 1F 01            [ 2] 5003 	ldw (COUNT,sp),x  
      009A10 CD 87            [ 2] 5004 	jra dir_loop
      001C5A                       5005 8$: ; print number of files 
      009A12 67 81            [ 2] 5006 	ldw x,(COUNT,sp)
      009A14 CD 09 C2         [ 4] 5007 	call print_int 
      009A14 AE 16 E0         [ 2] 5008 	ldw x,#file_count 
      009A17 A6 80 7F         [ 4] 5009 	call puts  
                                   5010 ; print drive free space 	
      009A1A 5C 4A 26         [ 4] 5011 	call disk_free
      009A1D FB               [ 1] 5012 	clrw x  
      009A1E 81 0A 00 0A      [ 1] 5013 	mov base,#10 
      009A1F CD 09 D2         [ 4] 5014 	call prti24 
      009A1F A6 7F C4         [ 2] 5015 	ldw x,#drive_free
      009A22 00 19 27         [ 4] 5016 	call puts 
      001C76                       5017 	_drop VSIZE 
      009A25 13 CE            [ 2]    1     addw sp,#VSIZE 
      009A27 00               [ 4] 5018 	ret
      009A28 18 1C 00 80 24 04 72  5019 file_count: .asciz " files\n"
             5C
      009A30 00 17 9F A4 80 97 CF  5020 drive_free: .asciz " bytes free\n" 
             00 18 81 65 0A 00
                                   5021 
                                   5022 ;---------------------
                                   5023 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5024 ; write 1 or more byte to FLASH or EEPROM
                                   5025 ; starting at address  
                                   5026 ; input:
                                   5027 ;   expr1  	is address 
                                   5028 ;   expr2,...,exprn   are bytes to write
                                   5029 ; output:
                                   5030 ;   none 
                                   5031 ;---------------------
                           000001  5032 	ADDR=1
                           000002  5033 	VSIZ=2 
      009A3A                       5034 write:
      001C8E                       5035 	_vars VSIZE 
      009A3A 72 BB            [ 2]    1     sub sp,#VSIZE 
      009A3C 00 18 24 04      [ 1] 5036 	clr farptr ; expect 16 bits address 
      009A40 72 5C 00         [ 4] 5037 	call expression
      009A43 17 CF            [ 1] 5038 	cp a,#TK_INTGR 
      009A45 00 18            [ 1] 5039 	jreq 0$
      009A47 81 08 7B         [ 2] 5040 	jp syntax_error
      009A48 1F 01            [ 2] 5041 0$: ldw (ADDR,sp),x 
      009A48 A6 01 C7         [ 4] 5042 	call next_token 
      009A4B 00 17            [ 1] 5043 	cp a,#TK_COMMA 
      009A4D 5F CF            [ 1] 5044 	jreq 1$ 
      009A4F 00 18            [ 2] 5045 	jra 9$ 
      009A51 CD 11 07         [ 4] 5046 1$:	call expression
      009A51 AE 00            [ 1] 5047 	cp a,#TK_INTGR
      009A53 03 92            [ 1] 5048 	jreq 2$
      009A55 AF 00 17         [ 2] 5049 	jp syntax_error
      009A58 26               [ 1] 5050 2$:	ld a,xl 
      009A59 05 5A            [ 2] 5051 	ldw x,(ADDR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A5B 2A F7 20         [ 2] 5052 	ldw farptr+1,x 
      009A5E 0E               [ 1] 5053 	clrw x 
      009A5F AE 00 80         [ 4] 5054 	call write_byte
      009A62 CD 9A            [ 2] 5055 	ldw x,(ADDR,sp)
      009A64 3A               [ 2] 5056 	incw x 
      009A65 AE 02            [ 2] 5057 	jra 0$ 
      001CC2                       5058 9$:
      001CC2                       5059 	_drop VSIZE
      009A67 80 C3            [ 2]    1     addw sp,#VSIZE 
      009A69 00               [ 4] 5060 	ret 
                                   5061 
                                   5062 
                                   5063 ;---------------------
                                   5064 ;BASIC: CHAR(expr)
                                   5065 ; évaluate expression 
                                   5066 ; and take the 7 least 
                                   5067 ; bits as ASCII character
                                   5068 ;---------------------
      001CC5                       5069 char:
      009A6A 17 2B E4         [ 4] 5070 	call func_args 
      009A6D A1 01            [ 1] 5071 	cp a,#1
      009A6D CE 00            [ 1] 5072 	jreq 1$
      009A6F 17 C6 00         [ 2] 5073 	jp syntax_error
      009A72 19               [ 2] 5074 1$:	popw x 
      009A73 CF               [ 1] 5075 	ld a,xl 
      009A74 00 1A            [ 1] 5076 	and a,#0x7f 
      009A76 C7               [ 1] 5077 	ld xl,a
      009A77 00 1C            [ 1] 5078 	ld a,#TK_CHAR
      009A79 81               [ 4] 5079 	ret
                                   5080 
                                   5081 ;---------------------
                                   5082 ; BASIC: ASC(string|char)
                                   5083 ; extract first character 
                                   5084 ; of string argument 
                                   5085 ; return it as TK_INTGR 
                                   5086 ;---------------------
      009A7A                       5087 ascii:
      009A7A AE 80            [ 1] 5088 	ld a,#TK_LPAREN
      009A7C 00 72 B0         [ 4] 5089 	call expect 
      009A7F 00 1B A6         [ 4] 5090 	call next_token 
      009A82 02 C2            [ 1] 5091 	cp a,#TK_QSTR 
      009A84 00 1A            [ 1] 5092 	jreq 1$
      009A86 C7 00            [ 1] 5093 	cp a,#TK_CHAR 
      009A88 0C CF            [ 1] 5094 	jreq 2$ 
      009A8A 00 0D 81         [ 2] 5095 	jp syntax_error
      009A8D                       5096 1$: 
      009A8D 5F               [ 1] 5097 	ld a,(x) 
      009A8E 92               [ 1] 5098 	clrw x
      009A8F AF               [ 1] 5099 	ld xl,a 
      001CED                       5100 2$: 
      009A90 00               [ 2] 5101 	pushw x 
      009A91 17 90            [ 1] 5102 	ld a,#TK_RPAREN 
      009A93 F1 26 08         [ 4] 5103 	call expect
      009A96 4D               [ 2] 5104 	popw x 
      009A97 27 12            [ 1] 5105 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A99 5C               [ 4] 5106 	ret 
                                   5107 
                                   5108 ;---------------------
                                   5109 ;BASIC: KEY
                                   5110 ; wait for a character 
                                   5111 ; received from STDIN 
                                   5112 ; input:
                                   5113 ;	none 
                                   5114 ; output:
                                   5115 ;	X 		ASCII character 
                                   5116 ;---------------------
      001CF7                       5117 key:
      009A9A 90 5C 20         [ 4] 5118 	call getc 
      009A9D F0               [ 1] 5119 	clrw x 
      009A9E 97               [ 1] 5120 	ld xl,a 
      009A9E 4D 27            [ 1] 5121 	ld a,#TK_INTGR
      009AA0 07               [ 4] 5122 	ret
                                   5123 
                                   5124 ;----------------------
                                   5125 ; BASIC: QKEY
                                   5126 ; Return true if there 
                                   5127 ; is a character in 
                                   5128 ; waiting in STDIN 
                                   5129 ; input:
                                   5130 ;  none 
                                   5131 ; output:
                                   5132 ;   X 		0|-1 
                                   5133 ;-----------------------
      001CFF                       5134 qkey:: 
      009AA1 5C               [ 1] 5135 	clrw x 
      009AA2 92 AF 00         [ 1] 5136 	ld a,rx_head
      009AA5 17 20 F6         [ 1] 5137 	cp a,rx_tail 
      009AA8 5C 98            [ 1] 5138 	jreq 9$ 
      009AAA 81               [ 2] 5139 	cplw x 
      009AAB A6 84            [ 1] 5140 9$: ld a,#TK_INTGR
      009AAB 5C               [ 4] 5141 	ret 
                                   5142 
                                   5143 ;---------------------
                                   5144 ; BASIC: GPIO(expr,reg)
                                   5145 ; return gpio address 
                                   5146 ; expr {0..8}
                                   5147 ; input:
                                   5148 ;   none 
                                   5149 ; output:
                                   5150 ;   X 		gpio register address
                                   5151 ;----------------------------
                           000003  5152 	PORT=3
                           000001  5153 	REG=1 
                           000004  5154 	VSIZE=4 
      001D0C                       5155 gpio:
      009AAC 99 81 09         [ 4] 5156 	call func_args 
      009AAE A1 02            [ 1] 5157 	cp a,#2
      009AAE 52 04            [ 1] 5158 	jreq 1$
      009AB0 17 03 5F         [ 2] 5159 	jp syntax_error  
      001D16                       5160 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AB3 CF 00            [ 2] 5161 	ldw x,(PORT,sp)
      009AB5 18 35            [ 1] 5162 	jrmi bad_port
      009AB7 01 00 17         [ 2] 5163 	cpw x,#9
      009ABA 2A 12            [ 1] 5164 	jrpl bad_port
      009ABA 92 BC            [ 1] 5165 	ld a,#5
      009ABC 00               [ 4] 5166 	mul x,a
      009ABD 17 27 27         [ 2] 5167 	addw x,#GPIO_BASE 
      009AC0 5F 16            [ 2] 5168 	ldw (PORT,sp),x  
      009AC2 03 CD            [ 2] 5169 	ldw x,(REG,sp) 
      009AC4 9A 8D 25         [ 2] 5170 	addw x,(PORT,sp)
      009AC7 2F 92            [ 1] 5171 	ld a,#TK_INTGR
      001D2E                       5172 	_drop VSIZE 
      009AC9 AF 00            [ 2]    1     addw sp,#VSIZE 
      009ACB 17               [ 4] 5173 	ret
      001D31                       5174 bad_port:
      009ACC 6B 01            [ 1] 5175 	ld a,#ERR_BAD_VALUE
      009ACE 5C 92 AF         [ 2] 5176 	jp tb_error
                                   5177 
                                   5178 
                                   5179 ;-------------------------
                                   5180 ; BASIC: UFLASH 
                                   5181 ; return user flash address
                                   5182 ; input:
                                   5183 ;  none 
                                   5184 ; output:
                                   5185 ;	A		TK_INTGR
                                   5186 ;   X 		user address 
                                   5187 ;---------------------------
      001D36                       5188 uflash:
      009AD1 00 17 6B         [ 2] 5189 	ldw x,#user_space 
      009AD4 02 5C            [ 1] 5190 	ld a,#TK_INTGR 
      009AD6 72               [ 4] 5191 	ret 
                                   5192 
                                   5193 
                                   5194 ;---------------------
                                   5195 ; BASIC: USR(addr[,arg])
                                   5196 ; execute a function written 
                                   5197 ; in binary code.
                                   5198 ; binary fonction should 
                                   5199 ; return token attribute in A 
                                   5200 ; and value in X. 
                                   5201 ; input:
                                   5202 ;   addr	routine address 
                                   5203 ;   arg 	is an optional argument 
                                   5204 ; output:
                                   5205 ;   A 		token attribute 
                                   5206 ;   X       returned value 
                                   5207 ;---------------------
      001D3C                       5208 usr:
      009AD7 FB 01            [ 2] 5209 	pushw y 	
      009AD9 CD 9A 3A         [ 4] 5210 	call func_args 
      009ADC CD 9A            [ 1] 5211 	cp a,#1 
      009ADE 1F AE            [ 1] 5212 	jreq 2$
      009AE0 02 80            [ 1] 5213 	cp a,#2
      009AE2 C3 00            [ 1] 5214 	jreq 2$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AE4 17 2A D3         [ 2] 5215 	jp syntax_error 
      009AE7 90 85            [ 2] 5216 2$: popw y  ; arg|addr 
      009AE7 72 5F            [ 1] 5217 	cp a,#1
      009AE9 00 17            [ 1] 5218 	jreq 3$
      009AEB 72               [ 2] 5219 	popw x ; addr
      009AEC 5F               [ 1] 5220 	exgw x,y 
      009AED 00 18            [ 4] 5221 3$: call (y)
      009AEF 72 5F            [ 2] 5222 	popw y 
      009AF1 00               [ 4] 5223 	ret 
                                   5224 
                                   5225 ;------------------------------
                                   5226 ; BASIC: BYE 
                                   5227 ; halt mcu in its lowest power mode 
                                   5228 ; wait for reset or external interrupt
                                   5229 ; do a cold start on wakeup.
                                   5230 ;------------------------------
      001D59                       5231 bye:
      009AF2 19 5B 04 98 81   [ 2] 5232 	btjf UART1_SR,#UART_SR_TC,.
      009AF7 8E               [10] 5233 	halt
      009AF7 5B 04 99         [ 2] 5234 	jp cold_start  
                                   5235 
                                   5236 ;----------------------------------
                                   5237 ; BASIC: AUTORUN ["file_name"] 
                                   5238 ; record in eeprom at adrress AUTORUN_NAME
                                   5239 ; the name of file to load and execute
                                   5240 ; at startup. 
                                   5241 ; empty string delete autorun name 
                                   5242 ; no argument display autorun name  
                                   5243 ; input:
                                   5244 ;   file_name   file to execute 
                                   5245 ; output:
                                   5246 ;   none
                                   5247 ;-----------------------------------
      001D62                       5248 autorun: 
      009AFA 81 01 00 23 07   [ 2] 5249 	btjf flags,#FRUN,0$ 
      009AFB 27 05            [ 1] 5250 	jreq 0$ 
      009AFB 72 01            [ 1] 5251 	ld a,#ERR_CMD_ONLY 
      009AFD 00 24 05         [ 2] 5252 	jp tb_error 
      001D6E                       5253 0$:	
      009B00 A6 07 CC         [ 4] 5254 	call next_token
      009B03 88 FD            [ 1] 5255 	jrne 1$
      009B05 AE 40 00         [ 2] 5256 	ldw x,#AUTORUN_NAME
      009B05 CE 00 1F         [ 4] 5257 	call puts 
      009B08 72               [ 1] 5258 	clr a 
      009B09 B0               [ 4] 5259 	ret 
      001D7B                       5260 1$:
      009B0A 00 1D            [ 1] 5261 	cp a,#TK_QSTR
      009B0C 26 0C            [ 1] 5262 	jreq 2$
      009B0E AE 88 96         [ 2] 5263 	jp syntax_error 
      001D82                       5264 2$:	
      009B11 CD               [ 1] 5265 	tnz (x) 
      009B12 A7 C0            [ 1] 5266 	jrne 3$
                                   5267 ; empty string, delete autorun 	
      009B14 55 00 04         [ 4] 5268 	call cancel_autorun
      009B17 00 02 81 00 01   [ 1] 5269 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B1A 81               [ 4] 5270 	ret 
      009B1A 52               [ 2] 5271 3$:	pushw x 
      009B1B 08 1F            [ 1] 5272 	ldw y,x  
      009B1D 01 CD 89         [ 4] 5273 	call search_file 
      009B20 ED A1            [ 1] 5274 	jrc 4$ 
      009B22 02 27            [ 1] 5275 	ld a,#ERR_NOT_FILE
      009B24 03 CC 88         [ 2] 5276 	jp tb_error  
      001D9B                       5277 4$: 
      009B27 FB 00 03 00 01   [ 1] 5278 	mov in,count 
      009B28 72 5F 00 16      [ 1] 5279 	clr farptr 
      009B28 1F 03 CD         [ 2] 5280 	ldw x,#AUTORUN_NAME
      009B2B 81 F4 CD         [ 2] 5281 	ldw farptr+1,x 
      009B2E 84 16            [ 2] 5282 	ldw x,(1,sp)  
      009B30 1C 00 03         [ 4] 5283 	call strlen  ; return length in X 
      009B33 72               [ 2] 5284 	incw x 
      009B34 FB 01            [ 2] 5285 	popw y 
      009B36 4F               [ 2] 5286 	pushw x 
      009B37 72               [ 1] 5287 	clrw x 
      009B38 BB 00 1B         [ 4] 5288 	call write_block 
      001DB7                       5289 	_drop 2 
      009B3B C9 00            [ 2]    1     addw sp,#2 
      009B3D 1A               [ 4] 5290 	ret 
                                   5291 
                                   5292 ;----------------------------------
                                   5293 ; BASIC: SLEEP 
                                   5294 ; halt mcu until reset or external
                                   5295 ; interrupt.
                                   5296 ; Resume progam after SLEEP command
                                   5297 ;----------------------------------
      001DBA                       5298 sleep:
      009B3E A1 02 2B 0A A3   [ 2] 5299 	btjf UART1_SR,#UART_SR_TC,.
      009B43 80 00 2B 05      [ 1] 5300 	bset flags,#FSLEEP
      009B47 A6               [10] 5301 	halt 
      009B48 0E               [ 4] 5302 	ret 
                                   5303 
                                   5304 ;-------------------------------
                                   5305 ; BASIC: PAUSE expr 
                                   5306 ; suspend execution for n msec.
                                   5307 ; input:
                                   5308 ;	none
                                   5309 ; output:
                                   5310 ;	none 
                                   5311 ;------------------------------
      001DC5                       5312 pause:
      009B49 CC 88 FD         [ 4] 5313 	call expression
      009B4C A1 84            [ 1] 5314 	cp a,#TK_INTGR
      009B4C 16 03            [ 1] 5315 	jreq pause02 
      009B4E CD 9A AE         [ 2] 5316 	jp syntax_error
      001DCF                       5317 pause02: 
      009B51 24               [ 2] 5318 1$: tnzw x 
      009B52 05 A6            [ 1] 5319 	jreq 2$
      009B54 08               [10] 5320 	wfi 
      009B55 CC               [ 2] 5321 	decw x 
      009B56 88 FD            [ 1] 5322 	jrne 1$
      009B58 4F               [ 1] 5323 2$:	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B58 CE               [ 4] 5324 	ret 
                                   5325 
                                   5326 ;------------------------------
                                   5327 ; BASIC: AWU expr
                                   5328 ; halt mcu for 'expr' milliseconds
                                   5329 ; use Auto wakeup peripheral
                                   5330 ; all oscillators stopped except LSI
                                   5331 ; range: 1ms - 511ms
                                   5332 ; input:
                                   5333 ;  none
                                   5334 ; output:
                                   5335 ;  none:
                                   5336 ;------------------------------
      001DD8                       5337 awu:
      009B59 00 1A C6         [ 4] 5338   call expression
      009B5C 00 1C            [ 1] 5339   cp a,#TK_INTGR
      009B5E CF 00            [ 1] 5340   jreq awu02
      009B60 17 C7 00         [ 2] 5341   jp syntax_error
      001DE2                       5342 awu02:
      009B63 19 16 03         [ 2] 5343   cpw x,#5120
      009B66 AE 16            [ 1] 5344   jrmi 1$ 
      009B68 E0 CD 84 34      [ 1] 5345   mov AWU_TBR,#15 
      009B6C CD 84            [ 1] 5346   ld a,#30
      009B6E 16               [ 2] 5347   div x,a
      009B6F 5C 1C            [ 1] 5348   ld a,#16
      009B71 16               [ 2] 5349   div x,a 
      009B72 E0 16            [ 2] 5350   jra 4$
      001DF3                       5351 1$: 
      009B74 01 FF 1C         [ 2] 5352   cpw x,#2048
      009B77 00 02            [ 1] 5353   jrmi 2$ 
      009B79 90 CE 00 1D      [ 1] 5354   mov AWU_TBR,#14
      009B7D 90 F6            [ 1] 5355   ld a,#80
      009B7F 90               [ 2] 5356   div x,a 
      009B80 5C F7            [ 2] 5357   jra 4$   
      001E01                       5358 2$:
      009B82 5C 90 C3 00      [ 1] 5359   mov AWU_TBR,#7
      001E05                       5360 3$:  
                                   5361 ; while X > 64  divide by 2 and increment AWU_TBR 
      009B86 1F 27 05         [ 2] 5362   cpw x,#64 
      009B89 A3 17            [ 2] 5363   jrule 4$ 
      009B8B 60 2B EF F2      [ 1] 5364   inc AWU_TBR 
      009B8E 54               [ 2] 5365   srlw x 
      009B8E 17 07            [ 2] 5366   jra 3$ 
      009B90                       5367 4$:
      009B90 A3               [ 1] 5368   ld a, xl
      009B91 17               [ 1] 5369   dec a 
      009B92 60 27            [ 1] 5370   jreq 5$
      009B94 04               [ 1] 5371   dec a 	
      001E16                       5372 5$: 
      009B95 7F 5C            [ 1] 5373   and a,#0x3e 
      009B97 20 F7 F1         [ 1] 5374   ld AWU_APR,a 
      009B99 72 18 50 F0      [ 1] 5375   bset AWU_CSR,#AWU_CSR_AWUEN
      009B99 AE               [10] 5376   halt 
                                   5377 
      009B9A 16               [ 4] 5378   ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5379 
                                   5380 ;------------------------------
                                   5381 ; BASIC: TICKS
                                   5382 ; return msec ticks counter value 
                                   5383 ; input:
                                   5384 ; 	none 
                                   5385 ; output:
                                   5386 ;	X 		TK_INTGR
                                   5387 ;-------------------------------
      001E21                       5388 get_ticks:
      009B9B E0 CD 82         [ 2] 5389 	ldw x,ticks 
      009B9E 08 AE            [ 1] 5390 	ld a,#TK_INTGR
      009BA0 00               [ 4] 5391 	ret 
                                   5392 
                                   5393 
                                   5394 
                                   5395 ;------------------------------
                                   5396 ; BASIC: ABS(expr)
                                   5397 ; return absolute value of expr.
                                   5398 ; input:
                                   5399 ;   none
                                   5400 ; output:
                                   5401 ;   X     	positive integer
                                   5402 ;-------------------------------
      001E27                       5403 abs:
      009BA1 80 CD 9A         [ 4] 5404 	call func_args 
      009BA4 3A AE            [ 1] 5405 	cp a,#1 
      009BA6 16 E0            [ 1] 5406 	jreq 0$ 
      009BA8 16 07 90         [ 2] 5407 	jp syntax_error
      001E31                       5408 0$:  
      009BAB C3               [ 2] 5409     popw x   
      009BAC 00               [ 1] 5410 	ld a,xh 
      009BAD 1F 2B            [ 1] 5411 	bcp a,#0x80 
      009BAF CD CE            [ 1] 5412 	jreq 2$ 
      009BB1 00               [ 2] 5413 	negw x 
      009BB2 17 C6            [ 1] 5414 2$: ld a,#TK_INTGR 
      009BB4 00               [ 4] 5415 	ret 
                                   5416 
                                   5417 ;------------------------------
                                   5418 ; BASIC: AND(expr1,expr2)
                                   5419 ; Apply bit AND relation between
                                   5420 ; the 2 arguments, i.e expr1 & expr2 
                                   5421 ; output:
                                   5422 ; 	A 		TK_INTGR
                                   5423 ;   X 		result 
                                   5424 ;------------------------------
      001E3B                       5425 bit_and:
      009BB5 19 CF 00         [ 4] 5426 	call func_args 
      009BB8 1A C7            [ 1] 5427 	cp a,#2
      009BBA 00 1C            [ 1] 5428 	jreq 1$
      009BBC 1E 01 CD         [ 2] 5429 	jp syntax_error 
      009BBF 8A               [ 2] 5430 1$:	popw x 
      009BC0 42               [ 1] 5431 	ld a,xh 
      009BC1 5B 08            [ 1] 5432 	and a,(1,sp)
      009BC3 81               [ 1] 5433 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BC4 9F               [ 1] 5434 	ld a,xl
      009BC4 CD 9A            [ 1] 5435 	and a,(2,sp)
      009BC6 3A               [ 1] 5436 	ld xl,a 
      001E4E                       5437 	_drop 2 
      009BC7 CD 87            [ 2]    1     addw sp,#2 
      009BC9 67 5F            [ 1] 5438 	ld a,#TK_INTGR
      009BCB 92               [ 4] 5439 	ret
                                   5440 
                                   5441 ;------------------------------
                                   5442 ; BASIC: OR(expr1,expr2)
                                   5443 ; Apply bit OR relation between
                                   5444 ; the 2 arguments, i.e expr1 | expr2 
                                   5445 ; output:
                                   5446 ; 	A 		TK_INTGR
                                   5447 ;   X 		result 
                                   5448 ;------------------------------
      001E53                       5449 bit_or:
      009BCC AF 00 17         [ 4] 5450 	call func_args 
      009BCF 90 95            [ 1] 5451 	cp a,#2
      009BD1 5C 92            [ 1] 5452 	jreq 1$
      009BD3 AF 00 17         [ 2] 5453 	jp syntax_error 
      001E5D                       5454 1$: 
      009BD6 5C               [ 2] 5455 	popw x 
      009BD7 90               [ 1] 5456 	ld a,xh 
      009BD8 97 72            [ 1] 5457 	or a,(1,sp)
      009BDA B9               [ 1] 5458 	ld xh,a 
      009BDB 00               [ 1] 5459 	ld a,xl 
      009BDC 1D 90            [ 1] 5460 	or a,(2,sp)
      009BDE CF               [ 1] 5461 	ld xl,a 
      001E66                       5462 	_drop 2 
      009BDF 00 1F            [ 2]    1     addw sp,#2 
      009BE1 90 CE            [ 1] 5463 	ld a,#TK_INTGR 
      009BE3 00               [ 4] 5464 	ret
                                   5465 
                                   5466 ;------------------------------
                                   5467 ; BASIC: XOR(expr1,expr2)
                                   5468 ; Apply bit XOR relation between
                                   5469 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5470 ; output:
                                   5471 ; 	A 		TK_INTGR
                                   5472 ;   X 		result 
                                   5473 ;------------------------------
      001E6B                       5474 bit_xor:
      009BE4 1D 10 09         [ 4] 5475 	call func_args 
      009BE5 A1 02            [ 1] 5476 	cp a,#2
      009BE5 92 AF            [ 1] 5477 	jreq 1$
      009BE7 00 17 90         [ 2] 5478 	jp syntax_error 
      001E75                       5479 1$: 
      009BEA F7               [ 2] 5480 	popw x 
      009BEB 5C               [ 1] 5481 	ld a,xh 
      009BEC 90 5C            [ 1] 5482 	xor a,(1,sp)
      009BEE 90               [ 1] 5483 	ld xh,a 
      009BEF C3               [ 1] 5484 	ld a,xl 
      009BF0 00 1F            [ 1] 5485 	xor a,(2,sp)
      009BF2 2B               [ 1] 5486 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001E7E                       5487 	_drop 2 
      009BF3 F1 81            [ 2]    1     addw sp,#2 
      009BF5 A6 84            [ 1] 5488 	ld a,#TK_INTGR 
      009BF5 72               [ 4] 5489 	ret 
                                   5490 
                                   5491 ;------------------------------
                                   5492 ; BASIC: LSHIFT(expr1,expr2)
                                   5493 ; logical shift left expr1 by 
                                   5494 ; expr2 bits 
                                   5495 ; output:
                                   5496 ; 	A 		TK_INTGR
                                   5497 ;   X 		result 
                                   5498 ;------------------------------
      001E83                       5499 lshift:
      009BF6 01 00 24         [ 4] 5500 	call func_args
      009BF9 07 27            [ 1] 5501 	cp a,#2 
      009BFB 05 A6            [ 1] 5502 	jreq 1$
      009BFD 07 CC 88         [ 2] 5503 	jp syntax_error
      009C00 FD 85            [ 2] 5504 1$: popw y   
      009C01 85               [ 2] 5505 	popw x 
      009C01 CD 89            [ 2] 5506 	tnzw y 
      009C03 ED A1            [ 1] 5507 	jreq 4$
      009C05 02               [ 2] 5508 2$:	sllw x 
      009C06 27 03            [ 2] 5509 	decw y 
      009C08 CC 88            [ 1] 5510 	jrne 2$
      001E99                       5511 4$:  
      009C0A FB 90            [ 1] 5512 	ld a,#TK_INTGR
      009C0C 93               [ 4] 5513 	ret
                                   5514 
                                   5515 ;------------------------------
                                   5516 ; BASIC: RSHIFT(expr1,expr2)
                                   5517 ; logical shift right expr1 by 
                                   5518 ; expr2 bits.
                                   5519 ; output:
                                   5520 ; 	A 		TK_INTGR
                                   5521 ;   X 		result 
                                   5522 ;------------------------------
      001E9C                       5523 rshift:
      009C0D CD 9A AE         [ 4] 5524 	call func_args
      009C10 25 05            [ 1] 5525 	cp a,#2 
      009C12 A6 09            [ 1] 5526 	jreq 1$
      009C14 CC 88 FD         [ 2] 5527 	jp syntax_error
      009C17 90 85            [ 2] 5528 1$: popw y  
      009C17 CD               [ 2] 5529 	popw x
      009C18 9B C4            [ 2] 5530 	tnzw y 
      009C1A CE 00            [ 1] 5531 	jreq 4$
      009C1C 1F               [ 2] 5532 2$:	srlw x 
      009C1D 72 B0            [ 2] 5533 	decw y 
      009C1F 00 1D            [ 1] 5534 	jrne 2$
      001EB2                       5535 4$:  
      009C21 CD 8A            [ 1] 5536 	ld a,#TK_INTGR
      009C23 42               [ 4] 5537 	ret
                                   5538 
                                   5539 ;--------------------------
                                   5540 ; BASIC: FCPU integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5541 ; set CPU frequency 
                                   5542 ;-------------------------- 
                                   5543 
      001EB5                       5544 fcpu:
      009C24 81 84            [ 1] 5545 	ld a,#TK_INTGR
      009C25 CD 0F FC         [ 4] 5546 	call expect 
      009C25 52               [ 1] 5547 	ld a,xl 
      009C26 03 CD            [ 1] 5548 	and a,#7 
      009C28 89 ED A1         [ 1] 5549 	ld CLK_CKDIVR,a 
      009C2B 00               [ 4] 5550 	ret 
                                   5551 
                                   5552 ;------------------------------
                                   5553 ; BASIC: PMODE pin#, mode 
                                   5554 ; Arduino pin. 
                                   5555 ; define pin as input or output
                                   5556 ; pin#: {0..15}
                                   5557 ; mode: INPUT|OUTPUT  
                                   5558 ;------------------------------
                           000001  5559 	PINNO=1
                           000001  5560 	VSIZE=1
      001EC1                       5561 pin_mode:
      001EC1                       5562 	_vars VSIZE 
      009C2C 27 20            [ 2]    1     sub sp,#VSIZE 
      009C2E A1 02 27         [ 4] 5563 	call arg_list 
      009C31 03 CC            [ 1] 5564 	cp a,#2 
      009C33 88 FB            [ 1] 5565 	jreq 1$
      009C35 90 93 55         [ 2] 5566 	jp syntax_error 
      009C38 00 04            [ 2] 5567 1$: popw y ; mode 
      009C3A 00               [ 2] 5568 	popw x ; Dx pin 
      009C3B 02 CD 9A         [ 4] 5569 	call select_pin 
      009C3E AE 25            [ 1] 5570 	ld (PINNO,sp),a  
      009C40 05 A6            [ 1] 5571 	ld a,#1 
      009C42 09 CC            [ 1] 5572 	tnz (PINNO,sp)
      009C44 88 FD            [ 1] 5573 	jreq 4$
      009C46 48               [ 1] 5574 2$:	sll a 
      009C46 CE 00            [ 1] 5575 	dec (PINNO,sp)
      009C48 17 C6            [ 1] 5576 	jrne 2$ 
      009C4A 00 19            [ 1] 5577 	ld (PINNO,sp),a
      009C4C 20 0A            [ 1] 5578 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C4E E7 03            [ 1] 5579 	ld (GPIO_CR1,x),a 
      009C4E AE 01 00 4F      [ 2] 5580 4$:	cpw y,#OUTP 
      009C52 CF 00            [ 1] 5581 	jreq 6$
                                   5582 ; input mode
      009C54 17 C7            [ 1] 5583 	ld a,(PINNO,sp)
      009C56 00               [ 1] 5584 	cpl a 
      009C57 19 02            [ 1] 5585 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C58 20 0A            [ 2] 5586 	jra 9$
      001EF3                       5587 6$: ;output mode  
      009C58 1F 01            [ 1] 5588 	ld a,(PINNO,sp)
      009C5A 6B 03            [ 1] 5589 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C5C CD 81            [ 1] 5590 	ld (GPIO_CR2,x),a 
      009C5E C0 CD            [ 1] 5591 	ld a,(PINNO,sp)
      009C60 82 3B            [ 1] 5592 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C62 AE 00            [ 1] 5593 9$:	ld (GPIO_DDR,x),a 
      001EFF                       5594 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C64 80 CD            [ 2]    1     addw sp,#VSIZE 
      009C66 9A               [ 4] 5595 	ret
                                   5596 
                                   5597 ;------------------------
                                   5598 ; select Arduino pin 
                                   5599 ; input:
                                   5600 ;   X 	 {0..15} Arduino Dx 
                                   5601 ; output:
                                   5602 ;   A     stm8s208 pin 
                                   5603 ;   X     base address s208 GPIO port 
                                   5604 ;---------------------------
      001F02                       5605 select_pin:
      009C67 3A               [ 2] 5606 	sllw x 
      009C68 CD 9A 1F         [ 2] 5607 	addw x,#arduino_to_8s208 
      009C6B C6               [ 2] 5608 	ldw x,(x)
      009C6C 00               [ 1] 5609 	ld a,xl 
      009C6D 19               [ 1] 5610 	push a 
      009C6E C0               [ 1] 5611 	swapw x 
      009C6F 00 1C            [ 1] 5612 	ld a,#5 
      009C71 C6               [ 4] 5613 	mul x,a 
      009C72 00 18 C2         [ 2] 5614 	addw x,#GPIO_BASE 
      009C75 00               [ 1] 5615 	pop a 
      009C76 1B               [ 4] 5616 	ret 
                                   5617 ; translation from Arduino D0..D15 to stm8s208rb 
      001F12                       5618 arduino_to_8s208:
      009C77 C6 00                 5619 .byte 3,6 ; D0 
      009C79 17 C2                 5620 .byte 3,5 ; D1 
      009C7B 00 1A                 5621 .byte 4,0 ; D2 
      009C7D 2B E0                 5622 .byte 2,1 ; D3
      009C7F 7B 03                 5623 .byte 6,0 ; D4
      009C81 1E 01                 5624 .byte 2,2 ; D5
      009C83 C7 00                 5625 .byte 2,3 ; D6
      009C85 1C CF                 5626 .byte 3,1 ; D7
      009C87 00 1A                 5627 .byte 3,3 ; D8
      009C89 5B 03                 5628 .byte 2,4 ; D9
      009C8B 81 05                 5629 .byte 4,5 ; D10
      009C8C 02 06                 5630 .byte 2,6 ; D11
      009C8C 52 02                 5631 .byte 2,7 ; D12
      009C8E 5F 1F                 5632 .byte 2,5 ; D13
      009C90 01 CF                 5633 .byte 4,2 ; D14
      009C92 00 18                 5634 .byte 4,1 ; D15
                                   5635 
                                   5636 
                                   5637 ;------------------------------
                                   5638 ; BASIC: RND(expr)
                                   5639 ; return random number 
                                   5640 ; between 1 and expr inclusive
                                   5641 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5642 ; input:
                                   5643 ; 	none 
                                   5644 ; output:
                                   5645 ;	X 		random positive integer 
                                   5646 ;------------------------------
      001F32                       5647 random:
      009C94 35 01 00         [ 4] 5648 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C97 17 01            [ 1] 5649 	cp a,#1
      009C98 27 03            [ 1] 5650 	jreq 1$
      009C98 5F 92 AF         [ 2] 5651 	jp syntax_error
      001F3C                       5652 1$:  
      009C9B 00 17            [ 1] 5653 	ld a,#0x80 
      009C9D 27 3B            [ 1] 5654 	bcp a,(1,sp)
      009C9F 27 05            [ 1] 5655 	jreq 2$
      009C9F 92 AF            [ 1] 5656 	ld a,#ERR_BAD_VALUE
      009CA1 00 17 27         [ 2] 5657 	jp tb_error
      001F47                       5658 2$: 
                                   5659 ; acc16=(x<<5)^x 
      009CA4 06 CD 83         [ 2] 5660 	ldw x,seedx 
      009CA7 40               [ 2] 5661 	sllw x 
      009CA8 5C               [ 2] 5662 	sllw x 
      009CA9 20               [ 2] 5663 	sllw x 
      009CAA F4               [ 2] 5664 	sllw x 
      009CAB 5C               [ 2] 5665 	sllw x 
      009CAC A6               [ 1] 5666 	ld a,xh 
      009CAD 20 CD 83         [ 1] 5667 	xor a,seedx 
      009CB0 40 92 AF         [ 1] 5668 	ld acc16,a 
      009CB3 00               [ 1] 5669 	ld a,xl 
      009CB4 17 90 95         [ 1] 5670 	xor a,seedx+1 
      009CB7 5C 92 AF         [ 1] 5671 	ld acc8,a 
                                   5672 ; seedx=seedy 
      009CBA 00 17 5C         [ 2] 5673 	ldw x,seedy 
      009CBD 90 97 90         [ 2] 5674 	ldw seedx,x  
                                   5675 ; seedy=seedy^(seedy>>1)
      009CC0 89 72            [ 2] 5676 	srlw y 
      009CC2 FB 01            [ 1] 5677 	ld a,yh 
      009CC4 CD 9A 3A         [ 1] 5678 	xor a,seedy 
      009CC7 CD 9A 1F         [ 1] 5679 	ld seedy,a  
      009CCA 85 CD            [ 1] 5680 	ld a,yl 
      009CCC 8A 42 A6         [ 1] 5681 	xor a,seedy+1 
      009CCF 0D CD 83         [ 1] 5682 	ld seedy+1,a 
                                   5683 ; acc16>>3 
      009CD2 40 1E 01         [ 2] 5684 	ldw x,acc16 
      009CD5 5C               [ 2] 5685 	srlw x 
      009CD6 1F               [ 2] 5686 	srlw x 
      009CD7 01               [ 2] 5687 	srlw x 
                                   5688 ; x=acc16^x 
      009CD8 20               [ 1] 5689 	ld a,xh 
      009CD9 BE 00 0C         [ 1] 5690 	xor a,acc16 
      009CDA 95               [ 1] 5691 	ld xh,a 
      009CDA 1E               [ 1] 5692 	ld a,xl 
      009CDB 01 CD 8A         [ 1] 5693 	xor a,acc8 
      009CDE 42               [ 1] 5694 	ld xl,a 
                                   5695 ; seedy=x^seedy 
      009CDF AE 9C F9         [ 1] 5696 	xor a,seedy+1
      009CE2 CD               [ 1] 5697 	ld xl,a 
      009CE3 A7               [ 1] 5698 	ld a,xh 
      009CE4 C0 CD 9A         [ 1] 5699 	xor a,seedy
      009CE7 7A               [ 1] 5700 	ld xh,a 
      009CE8 5F 35 0A         [ 2] 5701 	ldw seedy,x 
                                   5702 ; return seedy modulo expr + 1 
      009CEB 00 0B            [ 2] 5703 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CED CD               [ 2] 5704 	divw x,y 
      009CEE 8A               [ 1] 5705 	ldw x,y 
      009CEF 52               [ 2] 5706 	incw x 
      001F96                       5707 10$:
      009CF0 AE 9D            [ 1] 5708 	ld a,#TK_INTGR
      009CF2 01               [ 4] 5709 	ret 
                                   5710 
                                   5711 ;---------------------------------
                                   5712 ; BASIC: WORDS 
                                   5713 ; affiche la listes des mots du
                                   5714 ; dictionnaire ainsi que le nombre
                                   5715 ; de mots.
                                   5716 ;---------------------------------
                           000001  5717 	WLEN=1 ; word length
                           000002  5718 	LLEN=2 ; character sent to console
                           000003  5719 	WCNT=3 ; count words printed 
                           000003  5720 	VSIZE=3 
      001F99                       5721 words:
      001F99                       5722 	_vars VSIZE
      009CF3 CD A7            [ 2]    1     sub sp,#VSIZE 
      009CF5 C0 5B            [ 1] 5723 	clr (LLEN,sp)
      009CF7 02 81            [ 1] 5724 	clr (WCNT,sp)
      009CF9 20 66 69 6C      [ 2] 5725 	ldw y,#kword_dict+2
      009CFD 65               [ 1] 5726 0$:	ldw x,y
      009CFE 73               [ 1] 5727 	ld a,(x)
      009CFF 0A 00            [ 1] 5728 	and a,#15 
      009D01 20 62            [ 1] 5729 	ld (WLEN,sp),a 
      009D03 79 74            [ 1] 5730 	inc (WCNT,sp)
      009D05 65               [ 2] 5731 1$:	incw x 
      009D06 73               [ 1] 5732 	ld a,(x)
      009D07 20 66 72         [ 4] 5733 	call putc 
      009D0A 65 65            [ 1] 5734 	inc (LLEN,sp)
      009D0C 0A 00            [ 1] 5735 	dec (WLEN,sp)
      009D0E 26 F5            [ 1] 5736 	jrne 1$
      009D0E 52 02            [ 1] 5737 	ld a,#70
      009D10 72 5F            [ 1] 5738 	cp a,(LLEN,sp)
      009D12 00 17            [ 1] 5739 	jrmi 2$   
      009D14 CD 91            [ 1] 5740 	ld a,#SPACE 
      009D16 87 A1 84         [ 4] 5741 	call putc 
      009D19 27 03            [ 1] 5742 	inc (LLEN,sp) 
      009D1B CC 88            [ 2] 5743 	jra 3$
      009D1D FB 1F            [ 1] 5744 2$: ld a,#CR 
      009D1F 01 CD 89         [ 4] 5745 	call putc 
      009D22 ED A1            [ 1] 5746 	clr (LLEN,sp)
      009D24 09 27 02 20      [ 2] 5747 3$:	subw y,#2 
      009D28 19 CD            [ 2] 5748 	ldw y,(y)
      009D2A 91 87            [ 1] 5749 	jrne 0$ 
      009D2C A1 84            [ 1] 5750 	ld a,#CR 
      009D2E 27 03 CC         [ 4] 5751 	call putc  
      009D31 88               [ 1] 5752 	clrw x 
      009D32 FB 9F            [ 1] 5753 	ld a,(WCNT,sp)
      009D34 1E               [ 1] 5754 	ld xl,a 
      009D35 01 CF 00         [ 4] 5755 	call print_int 
      009D38 18 5F CD         [ 2] 5756 	ldw x,#words_count_msg
      009D3B 82 65 1E         [ 4] 5757 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      001FE6                       5758 	_drop VSIZE 
      009D3E 01 5C            [ 2]    1     addw sp,#VSIZE 
      009D40 20               [ 4] 5759 	ret 
      009D41 DC 77 6F 72 64 73 20  5760 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5761 
                                   5762 
                                   5763 ;-----------------------------
                                   5764 ; BASIC: TIMER expr 
                                   5765 ; initialize count down timer 
                                   5766 ;-----------------------------
      009D42                       5767 set_timer:
      009D42 5B 02 81         [ 4] 5768 	call arg_list
      009D45 A1 01            [ 1] 5769 	cp a,#1 
      009D45 CD 90            [ 1] 5770 	jreq 1$
      009D47 89 A1 01         [ 2] 5771 	jp syntax_error
      002009                       5772 1$: 
      009D4A 27               [ 2] 5773 	popw x 
      009D4B 03 CC 88         [ 2] 5774 	ldw timer,x 
      009D4E FB               [ 4] 5775 	ret 
                                   5776 
                                   5777 ;------------------------------
                                   5778 ; BASIC: TIMEOUT 
                                   5779 ; return state of timer 
                                   5780 ;------------------------------
      00200E                       5781 timeout:
      009D4F 85 9F A4         [ 2] 5782 	ldw x,timer 
      002011                       5783 logical_complement:
      009D52 7F               [ 2] 5784 	cplw x 
      009D53 97 A6 03         [ 2] 5785 	cpw x,#-1
      009D56 81 01            [ 1] 5786 	jreq 2$
      009D57 5F               [ 1] 5787 	clrw x 
      009D57 A6 07            [ 1] 5788 2$:	ld a,#TK_INTGR
      009D59 CD               [ 4] 5789 	ret 
                                   5790 
                                   5791 ;--------------------------------
                                   5792 ; BASIC NOT(expr) 
                                   5793 ; return logical complement of expr
                                   5794 ;--------------------------------
      00201B                       5795 func_not:
      009D5A 90 7C CD         [ 4] 5796 	call func_args  
      009D5D 89 ED            [ 1] 5797 	cp a,#1
      009D5F A1 02            [ 1] 5798 	jreq 1$
      009D61 27 07 A1         [ 2] 5799 	jp syntax_error
      009D64 03               [ 2] 5800 1$:	popw x 
      009D65 27 06            [ 2] 5801 	jra logical_complement
                                   5802 
                                   5803 
                                   5804 
                                   5805 ;-----------------------------------
                                   5806 ; BASIC: IWDGEN expr1 
                                   5807 ; enable independant watchdog timer
                                   5808 ; expr1 is delay in multiple of 62.5µsec
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5809 ; expr1 -> {1..16383}
                                   5810 ;-----------------------------------
      002028                       5811 enable_iwdg:
      009D67 CC 88 FB         [ 4] 5812 	call arg_list
      009D6A A1 01            [ 1] 5813 	cp a,#1 
      009D6A F6 5F            [ 1] 5814 	jreq 1$
      009D6C 97 08 7B         [ 2] 5815 	jp syntax_error 
      009D6D 85               [ 2] 5816 1$: popw x 
      009D6D 89 A6            [ 1] 5817 	push #0
      009D6F 08 CD 90 7C      [ 1] 5818 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D73 85               [ 1] 5819 	ld a,xh 
      009D74 A6 84            [ 1] 5820 	and a,#0x3f
      009D76 81               [ 1] 5821 	ld xh,a  
      009D77 A3 00 FF         [ 2] 5822 2$:	cpw x,#255
      009D77 CD 83            [ 2] 5823 	jrule 3$
      009D79 49 5F            [ 1] 5824 	inc (1,sp)
      009D7B 97               [ 1] 5825 	rcf 
      009D7C A6               [ 2] 5826 	rrcw x 
      009D7D 84 81            [ 2] 5827 	jra 2$
      009D7F 35 55 50 E0      [ 1] 5828 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D7F 5F               [ 1] 5829 	pop a  
      009D80 C6 00 2E         [ 1] 5830 	ld IWDG_PR,a 
      009D83 C1               [ 1] 5831 	ld a,xl
      009D84 00               [ 1] 5832 	dec a 
      009D85 2F 27 01 53      [ 1] 5833 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D89 A6 84 81         [ 1] 5834 	ld IWDG_RLR,a 
      009D8C 35 AA 50 E0      [ 1] 5835 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D8C CD               [ 4] 5836 	ret 
                                   5837 
                                   5838 
                                   5839 ;-----------------------------------
                                   5840 ; BASIC: IWDGREF  
                                   5841 ; refresh independant watchdog count down 
                                   5842 ; timer before it reset MCU. 
                                   5843 ;-----------------------------------
      00205E                       5844 refresh_iwdg:
      009D8D 90 89 A1 02      [ 1] 5845 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D91 27               [ 4] 5846 	ret 
                                   5847 
                                   5848 
                                   5849 ;-------------------------------------
                                   5850 ; BASIC: LOG(expr)
                                   5851 ; return logarithm base 2 of expr 
                                   5852 ; this is the position of most significant
                                   5853 ; bit set. 
                                   5854 ; input: 
                                   5855 ; output:
                                   5856 ;   X     log2 
                                   5857 ;   A     TK_INTGR 
                                   5858 ;*********************************
      002063                       5859 log2:
      009D92 03 CC 88         [ 4] 5860 	call func_args 
      009D95 FB 01            [ 1] 5861 	cp a,#1 
      009D96 27 03            [ 1] 5862 	jreq 1$
      009D96 1E 03 2B         [ 2] 5863 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D99 17               [ 2] 5864 1$: popw x 
      00206E                       5865 leading_one:
      009D9A A3               [ 2] 5866 	tnzw x 
      009D9B 00 09            [ 1] 5867 	jreq 4$
      009D9D 2A 12            [ 1] 5868 	ld a,#15 
      009D9F A6               [ 2] 5869 2$: rlcw x 
      009DA0 05 42            [ 1] 5870     jrc 3$
      009DA2 1C               [ 1] 5871 	dec a 
      009DA3 50 00            [ 2] 5872 	jra 2$
      009DA5 1F               [ 1] 5873 3$: clrw x 
      009DA6 03               [ 1] 5874     ld xl,a
      009DA7 1E 01            [ 1] 5875 4$:	ld a,#TK_INTGR
      009DA9 72               [ 4] 5876 	ret 
                                   5877 
                                   5878 ;-----------------------------------
                                   5879 ; BASIC: BIT(expr) 
                                   5880 ; expr ->{0..15}
                                   5881 ; return 2^expr 
                                   5882 ; output:
                                   5883 ;    x    2^expr 
                                   5884 ;-----------------------------------
      00207E                       5885 bitmask:
      009DAA FB 03 A6         [ 4] 5886     call func_args 
      009DAD 84 5B            [ 1] 5887 	cp a,#1
      009DAF 04 81            [ 1] 5888 	jreq 1$
      009DB1 CC 08 7B         [ 2] 5889 	jp syntax_error 
      009DB1 A6               [ 2] 5890 1$: popw x 
      009DB2 0A               [ 1] 5891 	ld a,xl 
      009DB3 CC 88            [ 1] 5892 	and a,#15
      009DB5 FD               [ 1] 5893 	clrw x 
      009DB6 5C               [ 2] 5894 	incw x 
      009DB6 AE               [ 1] 5895 2$: tnz a 
      009DB7 A7 80            [ 1] 5896 	jreq 3$
      009DB9 A6               [ 2] 5897 	slaw x 
      009DBA 84               [ 1] 5898 	dec a 
      009DBB 81 F9            [ 2] 5899 	jra 2$ 
      009DBC A6 84            [ 1] 5900 3$: ld a,#TK_INTGR
      009DBC 90               [ 4] 5901 	ret 
                                   5902 
                                   5903 ;------------------------------
                                   5904 ; BASIC: INVERT(expr)
                                   5905 ; 1's complement 
                                   5906 ;--------------------------------
      002098                       5907 invert:
      009DBD 89 CD 90         [ 4] 5908 	call func_args
      009DC0 89 A1            [ 1] 5909 	cp a,#1 
      009DC2 01 27            [ 1] 5910 	jreq 1$
      009DC4 07 A1 02         [ 2] 5911 	jp syntax_error
      009DC7 27               [ 2] 5912 1$: popw x  
      009DC8 03               [ 2] 5913 	cplw x 
      009DC9 CC 88            [ 1] 5914 	ld a,#TK_INTGR 
      009DCB FB               [ 4] 5915 	ret 
                                   5916 
                                   5917 ;------------------------------
                                   5918 ; BASIC: DO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5919 ; initiate a DO ... UNTIL loop 
                                   5920 ;------------------------------
                           000003  5921 	DOLP_ADR=3 
                           000005  5922 	DOLP_INW=5
                           000004  5923 	VSIZE=4 
      0020A7                       5924 do_loop:
      009DCC 90               [ 2] 5925 	popw x 
      0020A8                       5926 	_vars VSIZE 
      009DCD 85 A1            [ 2]    1     sub sp,#VSIZE 
      009DCF 01               [ 2] 5927 	pushw x 
      009DD0 27 02 85 51      [ 2] 5928 	ldw y,basicptr 
      009DD4 90 FD            [ 2] 5929 	ldw (DOLP_ADR,sp),y
      009DD6 90 85 81 00      [ 2] 5930 	ldw y,in.w 
      009DD9 17 05            [ 2] 5931 	ldw (DOLP_INW,sp),y
      009DD9 72 0D 52 30      [ 1] 5932 	inc loop_depth 
      009DDD FB               [ 4] 5933 	ret 
                                   5934 
                                   5935 ;--------------------------------
                                   5936 ; BASIC: UNTIL expr 
                                   5937 ; loop if exprssion is false 
                                   5938 ; else terminate loop
                                   5939 ;--------------------------------
      0020BC                       5940 until: 
      009DDE 8E CC 86 58      [ 1] 5941 	tnz loop_depth 
      009DE2 26 03            [ 1] 5942 	jrne 1$ 
      009DE2 72 01 00         [ 2] 5943 	jp syntax_error 
      0020C5                       5944 1$: 
      009DE5 24 07 27         [ 4] 5945 	call relation 
      009DE8 05 A6            [ 1] 5946 	cp a,#TK_INTGR
      009DEA 07 CC            [ 1] 5947 	jreq 2$
      009DEC 88 FD 7B         [ 2] 5948 	jp syntax_error
      009DEE                       5949 2$: 
      009DEE CD               [ 2] 5950 	tnzw x 
      009DEF 89 ED            [ 1] 5951 	jrne 9$
      009DF1 26 08            [ 2] 5952 	ldw x,(DOLP_ADR,sp)
      009DF3 AE 40 00         [ 2] 5953 	ldw basicptr,x 
      009DF6 CD A7            [ 1] 5954 	ld a,(2,x)
      009DF8 C0 4F 81         [ 1] 5955 	ld count,a 
      009DFB 1E 05            [ 2] 5956 	ldw x,(DOLP_INW,sp)
      009DFB A1 02 27         [ 2] 5957 	ldw in.w,x 
      009DFE 03               [ 4] 5958 	ret 
      0020E2                       5959 9$:	; remove loop data from stack  
      009DFF CC               [ 2] 5960 	popw x
      0020E3                       5961 	_drop VSIZE
      009E00 88 FB            [ 2]    1     addw sp,#VSIZE 
      009E02 72 5A 00 20      [ 1] 5962 	dec loop_depth 
      009E02 7D               [ 2] 5963 	jp (x)
                                   5964 
                                   5965 ;--------------------------
                                   5966 ; BASIC: PRTA...PRTI  
                                   5967 ;  return constant value 
                                   5968 ;  PORT  offset in GPIO
                                   5969 ;  array
                                   5970 ;---------------------------
      0020EA                       5971 const_porta:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E03 26 09 CD         [ 2] 5972 	ldw x,#0
      009E06 87 1A            [ 1] 5973 	ld a,#TK_INTGR 
      009E08 55               [ 4] 5974 	ret 
      0020F0                       5975 const_portb:
      009E09 00 04 00         [ 2] 5976 	ldw x,#1
      009E0C 02 81            [ 1] 5977 	ld a,#TK_INTGR 
      009E0E 89               [ 4] 5978 	ret 
      0020F6                       5979 const_portc:
      009E0F 90 93 CD         [ 2] 5980 	ldw x,#2
      009E12 9A AE            [ 1] 5981 	ld a,#TK_INTGR 
      009E14 25               [ 4] 5982 	ret 
      0020FC                       5983 const_portd:
      009E15 05 A6 09         [ 2] 5984 	ldw x,#3
      009E18 CC 88            [ 1] 5985 	ld a,#TK_INTGR 
      009E1A FD               [ 4] 5986 	ret 
      009E1B                       5987 const_porte:
      009E1B 55 00 04         [ 2] 5988 	ldw x,#4
      009E1E 00 02            [ 1] 5989 	ld a,#TK_INTGR 
      009E20 72               [ 4] 5990 	ret 
      002108                       5991 const_portf:
      009E21 5F 00 17         [ 2] 5992 	ldw x,#5
      009E24 AE 40            [ 1] 5993 	ld a,#TK_INTGR 
      009E26 00               [ 4] 5994 	ret 
      00210E                       5995 const_portg:
      009E27 CF 00 18         [ 2] 5996 	ldw x,#6
      009E2A 1E 01            [ 1] 5997 	ld a,#TK_INTGR 
      009E2C CD               [ 4] 5998 	ret 
      002114                       5999 const_porth:
      009E2D 84 16 5C         [ 2] 6000 	ldw x,#7
      009E30 90 85            [ 1] 6001 	ld a,#TK_INTGR 
      009E32 89               [ 4] 6002 	ret 
      00211A                       6003 const_porti:
      009E33 5F CD 82         [ 2] 6004 	ldw x,#8
      009E36 DA 5B            [ 1] 6005 	ld a,#TK_INTGR 
      009E38 02               [ 4] 6006 	ret 
                                   6007 
                                   6008 ;-------------------------------
                                   6009 ; following return constant 
                                   6010 ; related to GPIO register offset 
                                   6011 ;---------------------------------
      002120                       6012 const_odr:
      009E39 81 84            [ 1] 6013 	ld a,#TK_INTGR 
      009E3A AE 00 00         [ 2] 6014 	ldw x,#GPIO_ODR
      009E3A 72               [ 4] 6015 	ret 
      002126                       6016 const_idr:
      009E3B 0D 52            [ 1] 6017 	ld a,#TK_INTGR 
      009E3D 30 FB 72         [ 2] 6018 	ldw x,#GPIO_IDR
      009E40 16               [ 4] 6019 	ret 
      00212C                       6020 const_ddr:
      009E41 00 24            [ 1] 6021 	ld a,#TK_INTGR 
      009E43 8E 81 02         [ 2] 6022 	ldw x,#GPIO_DDR
      009E45 81               [ 4] 6023 	ret 
      002132                       6024 const_cr1:
      009E45 CD 91            [ 1] 6025 	ld a,#TK_INTGR 
      009E47 87 A1 84         [ 2] 6026 	ldw x,#GPIO_CR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E4A 27               [ 4] 6027 	ret 
      002138                       6028 const_cr2:
      009E4B 03 CC            [ 1] 6029 	ld a,#TK_INTGR 
      009E4D 88 FB 04         [ 2] 6030 	ldw x,#GPIO_CR2
      009E4F 81               [ 4] 6031 	ret 
                                   6032 ;-------------------------
                                   6033 ;  constant for port mode
                                   6034 ;  used by PMODE 
                                   6035 ;  input or output
                                   6036 ;------------------------
      00213E                       6037 const_output:
      009E4F 5D 27            [ 1] 6038 	ld a,#TK_INTGR 
      009E51 04 8F 5A         [ 2] 6039 	ldw x,#OUTP
      009E54 26               [ 4] 6040 	ret 
      002144                       6041 const_input:
      009E55 F9 4F            [ 1] 6042 	ld a,#TK_INTGR 
      009E57 81 00 00         [ 2] 6043 	ldw x,#INP 
      009E58 81               [ 4] 6044 	ret 
                                   6045 ;-----------------------
                                   6046 ; memory area constants
                                   6047 ;-----------------------
      00214A                       6048 const_eeprom_base:
      009E58 CD 91            [ 1] 6049 	ld a,#TK_INTGR 
      009E5A 87 A1 84         [ 2] 6050 	ldw x,#EEPROM_BASE 
      009E5D 27               [ 4] 6051 	ret 
                                   6052 
                                   6053 ;---------------------------
                                   6054 ; BASIC: DATA 
                                   6055 ; when the interpreter find 
                                   6056 ; a DATA line it skip it.
                                   6057 ;---------------------------
      002150                       6058 data:
      009E5E 03 CC 88 FB 01   [ 1] 6059 	mov in,count 
      009E62 81               [ 4] 6060 	ret 
                                   6061 
                                   6062 ;---------------------------
                                   6063 ; BASIC: DATLN  *expr*
                                   6064 ; set DATA pointer at line# 
                                   6065 ; specified by *expr* 
                                   6066 ;---------------------------
      002156                       6067 data_line:
      009E62 A3 14 00         [ 4] 6068 	call expression
      009E65 2B 0C            [ 1] 6069 	cp a,#TK_INTGR
      009E67 35 0F            [ 1] 6070 	jreq 1$
      009E69 50 F2 A6         [ 2] 6071 	jp syntax_error 
      009E6C 1E 62 A6         [ 4] 6072 1$: call search_lineno
      009E6F 10               [ 2] 6073 	tnzw x 
      009E70 62 20            [ 1] 6074 	jrne 3$
      009E72 1E 05            [ 1] 6075 2$:	ld a,#ERR_NO_LINE 
      009E73 CC 08 7D         [ 2] 6076 	jp tb_error
      00216B                       6077 3$: ; check if valid data line 
      009E73 A3 08            [ 1] 6078     ldw y,x 
      009E75 00 2B            [ 2] 6079 	ldw x,(4,x)
      009E77 09 35 0E         [ 2] 6080 	cpw x,#data 
      009E7A 50 F2            [ 1] 6081 	jrne 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E7C A6 50 62 20      [ 2] 6082 	ldw data_ptr,y
      009E80 10 E6 02         [ 1] 6083 	ld a,(2,y)
      009E81 C7 00 09         [ 1] 6084 	ld data_len,a 
      009E81 35 07 50 F2      [ 1] 6085 	mov data_ofs,#FIRST_DATA_ITEM 
      009E85 81               [ 4] 6086 	ret
                                   6087 
                                   6088 ;---------------------------------
                                   6089 ; BASIC: RESTORE 
                                   6090 ; set data_ptr to first data line
                                   6091 ; if not DATA found pointer set to
                                   6092 ; zero 
                                   6093 ;---------------------------------
      002183                       6094 restore:
      009E85 A3 00 40 23      [ 1] 6095 	clr data_ptr 
      009E89 07 72 5C 50      [ 1] 6096 	clr data_ptr+1
      009E8D F2 54 20 F4      [ 1] 6097 	clr data_ofs 
      009E91 72 5F 00 09      [ 1] 6098 	clr data_len
      009E91 9F 4A 27         [ 2] 6099 	ldw x,txtbgn
      002196                       6100 data_search_loop: 	
      009E94 01 4A 1E         [ 2] 6101 	cpw x,txtend
      009E96 24 17            [ 1] 6102 	jruge 9$
      009E96 A4 3E            [ 1] 6103 	ldw y,x 
      009E98 C7 50            [ 2] 6104 	ldw x,(4,x)
      009E9A F1 72 18         [ 2] 6105 	cpw x,#data 
      009E9D 50 F0            [ 1] 6106 	jrne try_next_line 
      009E9F 8E 81 00 06      [ 2] 6107 	ldw data_ptr,y 
      009EA1 90 E6 02         [ 1] 6108 	ld a,(2,y)
      009EA1 CE 00 0F         [ 1] 6109 	ld data_len,a 
      009EA4 A6 84 81 08      [ 1] 6110 	mov data_ofs,#FIRST_DATA_ITEM
      009EA7 72 5D 00 09      [ 1] 6111 9$:	tnz data_len 
      009EA7 CD 90            [ 1] 6112     jrne 10$
      009EA9 89 A1            [ 1] 6113 	ld a,#ERR_NO_DATA 
      009EAB 01 27 03         [ 2] 6114 	jp tb_error 
      009EAE CC               [ 4] 6115 10$:ret
      0021BE                       6116 try_next_line:
      009EAF 88               [ 1] 6117 	ldw x,y 
      009EB0 FB 02            [ 1] 6118 	ld a,(2,x)
      009EB1 C7 00 0D         [ 1] 6119 	ld acc8,a 
      009EB1 85 9E A5 80      [ 1] 6120 	clr acc16 
      009EB5 27 01 50 A6      [ 2] 6121 	addw x,acc16 
      009EB9 84 81            [ 2] 6122 	jra data_search_loop
                                   6123 
                                   6124 
                                   6125 ;---------------------------------
                                   6126 ; BASIC: READ 
                                   6127 ; return next data item | 0 
                                   6128 ;---------------------------------
                           000001  6129 	CTX_BPTR=1 
                           000003  6130 	CTX_IN=3 
                           000004  6131 	CTX_COUNT=4 
                           000005  6132 	XSAVE=5
                           000006  6133 	VSIZE=6
      009EBB                       6134 read:
      0021CE                       6135 	_vars  VSIZE 
      009EBB CD 90            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0021D0                       6136 read01:	
      009EBD 89 A1 02         [ 1] 6137 	ld a,data_ofs
      009EC0 27 03 CC         [ 1] 6138 	cp a,data_len 
      009EC3 88 FB            [ 1] 6139 	jreq 2$ ; end of line  
      009EC5 85 9E 14         [ 4] 6140 	call save_context
      009EC8 01 95 9F         [ 2] 6141 	ldw x,data_ptr 
      009ECB 14 02 97         [ 2] 6142 	ldw basicptr,x 
      009ECE 5B 02 A6 84 81   [ 1] 6143 	mov in,data_ofs 
      009ED3 55 00 09 00 03   [ 1] 6144 	mov count,data_len  
      009ED3 CD 90 89         [ 4] 6145 	call expression 
      009ED6 A1 02            [ 1] 6146 	cp a,#TK_INTGR 
      009ED8 27 03            [ 1] 6147 	jreq 1$ 
      009EDA CC 88 FB         [ 2] 6148 	jp syntax_error 
      009EDD                       6149 1$:
      009EDD 85 9E            [ 2] 6150 	ldw (XSAVE,SP),x
      009EDF 1A 01 95         [ 4] 6151 	call next_token ; skip comma
      009EE2 9F 1A 02         [ 2] 6152 	ldw x,basicptr 
      009EE5 97 5B 02         [ 2] 6153 	ldw data_ptr,x 
      009EE8 A6 84 81 00 08   [ 1] 6154 	mov data_ofs,in 
      009EEB CD 15 4A         [ 4] 6155 	call rest_context
      009EEB CD 90            [ 2] 6156 	ldw x,(XSAVE,sp)
      009EED 89 A1            [ 1] 6157 	ld a,#TK_INTGR
      00220C                       6158 	_drop VSIZE 
      009EEF 02 27            [ 2]    1     addw sp,#VSIZE 
      009EF1 03               [ 4] 6159 	ret 
      00220F                       6160 2$: ; end of line reached 
      009EF2 CC 88 FB 06      [ 2] 6161 	ldw y, data_ptr 
      009EF5 72 5F 00 06      [ 1] 6162 	clr data_ptr
      009EF5 85 9E 18 01      [ 1] 6163 	clr data_ptr+1   
      009EF9 95 9F 18 02      [ 1] 6164 	clr data_ofs 
      009EFD 97 5B 02 A6      [ 1] 6165 	clr data_len 
      009F01 84 81 BE         [ 4] 6166 	call try_next_line 
      009F03 20 A8            [ 2] 6167 	jra read01
                                   6168 
                                   6169 
                                   6170 ;---------------------------------
                                   6171 ; BASIC: SPIEN clkdiv, 0|1  
                                   6172 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6173 ; if clkdiv==-1 disable SPI
                                   6174 ; 0|1 -> disable|enable  
                                   6175 ;--------------------------------- 
                           000005  6176 SPI_CS_BIT=5
      002228                       6177 spi_enable:
      009F03 CD 90 89         [ 4] 6178 	call arg_list 
      009F06 A1 02            [ 1] 6179 	cp a,#2
      009F08 27 03            [ 1] 6180 	jreq 1$
      009F0A CC 88 FB         [ 2] 6181 	jp syntax_error 
      002232                       6182 1$: 
      009F0D 90 85 85 90      [ 1] 6183 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F11 5D               [ 2] 6184 	popw x  
      009F12 27               [ 2] 6185 	tnzw x 
      009F13 05 58            [ 1] 6186 	jreq spi_disable 
      009F15 90               [ 2] 6187 	popw x 
      009F16 5A 26            [ 1] 6188 	ld a,#(1<<SPI_CR1_BR)
      009F18 FB               [ 4] 6189 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F19 9F               [ 1] 6190 	ld a,xl 
      009F19 A6 84 81         [ 1] 6191 	ld SPI_CR1,a 
                                   6192 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F1C 72 1A 50 14      [ 1] 6193 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F1C CD 90 89 A1      [ 1] 6194 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6195 ; configure SPI as master mode 0.	
      009F20 02 27 03 CC      [ 1] 6196 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6197 ; ~CS line controlled by sofware 	
      009F24 88 FB 90 85      [ 1] 6198 	bset SPI_CR2,#SPI_CR2_SSM 
      009F28 85 90 5D 27      [ 1] 6199     bset SPI_CR2,#SPI_CR2_SSI 
                                   6200 ; enable SPI
      009F2C 05 54 90 5A      [ 1] 6201 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F30 26               [ 4] 6202 	ret 
      00225B                       6203 spi_disable:
      00225B                       6204 	_drop #2; throw first argument.
      009F31 FB 02            [ 2]    1     addw sp,##2 
                                   6205 ; wait spi idle 
      009F32 A6 82            [ 1] 6206 1$:	ld a,#0x82 
      009F32 A6 84 81         [ 1] 6207 	and a,SPI_SR
      009F35 A1 02            [ 1] 6208 	cp a,#2 
      009F35 A6 84            [ 1] 6209 	jrne 1$
      009F37 CD 90 7C 9F      [ 1] 6210 	bres SPI_CR1,#SPI_CR1_SPE
      009F3B A4 07 C7 50      [ 1] 6211 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F3F C6 81 50 16      [ 1] 6212 	bres PE_DDR,#SPI_CS_BIT 
      009F41 81               [ 4] 6213 	ret 
                                   6214 
      002273                       6215 spi_clear_error:
      009F41 52 01            [ 1] 6216 	ld a,#0x78 
      009F43 CD 90 8E         [ 1] 6217 	bcp a,SPI_SR 
      009F46 A1 02            [ 1] 6218 	jreq 1$
      009F48 27 03 CC 88      [ 1] 6219 	clr SPI_SR 
      009F4C FB               [ 4] 6220 1$: ret 
                                   6221 
      00227F                       6222 spi_send_byte:
      009F4D 90               [ 1] 6223 	push a 
      009F4E 85 85 CD         [ 4] 6224 	call spi_clear_error
      009F51 9F               [ 1] 6225 	pop a 
      009F52 82 6B 01 A6 01   [ 2] 6226 	btjf SPI_SR,#SPI_SR_TXE,.
      009F57 0D 01 27         [ 1] 6227 	ld SPI_DR,a
      009F5A 0B 48 0A 01 26   [ 2] 6228 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F5F FB 6B 01         [ 1] 6229 	ld a,SPI_DR 
      009F62 EA               [ 4] 6230 	ret 
                                   6231 
      002295                       6232 spi_rcv_byte:
      009F63 03 E7            [ 1] 6233 	ld a,#255
      009F65 03 90 A3 00 01   [ 2] 6234 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F6A 27 07 7B         [ 1] 6235 	ld a,SPI_DR 
      009F6D 01               [ 4] 6236 	ret
                                   6237 
                                   6238 ;------------------------------
                                   6239 ; BASIC: SPIWR byte [,byte]
                                   6240 ; write 1 or more byte
                                   6241 ;------------------------------
      0022A0                       6242 spi_write:
      009F6E 43 E4 02         [ 4] 6243 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F71 20 0A            [ 1] 6244 	cp a,#TK_INTGR 
      009F73 27 03            [ 1] 6245 	jreq 1$
      009F73 7B 01 EA         [ 2] 6246 	jp syntax_error 
      0022AA                       6247 1$:	
      009F76 04               [ 1] 6248 	ld a,xl 
      009F77 E7 04 7B         [ 4] 6249 	call spi_send_byte 
      009F7A 01 EA 02         [ 4] 6250 	call next_token 
      009F7D E7 02            [ 1] 6251 	cp a,#TK_COMMA 
      009F7F 5B 01            [ 1] 6252 	jrne 2$ 
      009F81 81 E9            [ 2] 6253 	jra spi_write 
      009F82 4D               [ 1] 6254 2$:	tnz a 
      009F82 58 1C            [ 1] 6255 	jreq 3$
      0022BA                       6256 	_unget_token  
      009F84 9F 92 FE 9F 88   [ 1]    1     mov in,in.saved
      009F89 5E               [ 4] 6257 3$:	ret 
                                   6258 
                                   6259 
                                   6260 ;-------------------------------
                                   6261 ; BASIC: SPIRD 	
                                   6262 ; read one byte from SPI 
                                   6263 ;-------------------------------
      0022C0                       6264 spi_read:
      009F8A A6 05 42         [ 4] 6265 	call spi_rcv_byte 
      009F8D 1C               [ 1] 6266 	clrw x 
      009F8E 50               [ 1] 6267 	ld xl,a 
      009F8F 00 84            [ 1] 6268 	ld a,#TK_INTGR 
      009F91 81               [ 4] 6269 	ret 
                                   6270 
                                   6271 ;------------------------------
                                   6272 ; BASIC: SPISEL 0|1 
                                   6273 ; set state of ~CS line
                                   6274 ; 0|1 deselect|select  
                                   6275 ;------------------------------
      009F92                       6276 spi_select:
      009F92 03 06 03         [ 4] 6277 	call next_token 
      009F95 05 04            [ 1] 6278 	cp a,#TK_INTGR 
      009F97 00 02            [ 1] 6279 	jreq 1$
      009F99 01 06 00         [ 2] 6280 	jp syntax_error 
      009F9C 02               [ 2] 6281 1$: tnzw x  
      009F9D 02 02            [ 1] 6282 	jreq cs_high 
      009F9F 03 03 01 03      [ 1] 6283 	bres PE_ODR,#SPI_CS_BIT
      009FA3 03               [ 4] 6284 	ret 
      0022DA                       6285 cs_high: 
      009FA4 02 04 04 05      [ 1] 6286 	bset PE_ODR,#SPI_CS_BIT
      009FA8 02               [ 4] 6287 	ret 
                                   6288 
                                   6289 
                                   6290 ;-------------------------------
                                   6291 ; BASIC: PAD 
                                   6292 ; Return pad buffer address.
                                   6293 ;------------------------------
      0022DF                       6294 pad_ref:
      009FA9 06 02 07         [ 2] 6295 	ldw x,#pad 
      009FAC 02 05            [ 1] 6296 	ld a,TK_INTGR
      009FAE 04               [ 4] 6297 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6298 
                                   6299 ;------------------------------
                                   6300 ;      dictionary 
                                   6301 ; format:
                                   6302 ;   link:   2 bytes 
                                   6303 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6304 ;   cmd_name: 16 byte max 
                                   6305 ;   code_address: 2 bytes 
                                   6306 ;------------------------------
                                   6307 	.macro _dict_entry len,name,cmd 
                                   6308 	.word LINK 
                                   6309 	LINK=.
                                   6310 name:
                                   6311 	.byte len 	
                                   6312 	.ascii "name"
                                   6313 	.word cmd 
                                   6314 	.endm 
                                   6315 
                           000000  6316 	LINK=0
                                   6317 ; respect alphabetic order for BASIC names from Z-A
                                   6318 ; this sort order is for a cleaner WORDS cmd output. 	
      0022E5                       6319 kword_end:
      0022E5                       6320 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FAF 02 04                    1 	.word LINK 
                           0022E7     2 	LINK=.
      0022E7                          3 XOR:
      009FB1 01                       4 	.byte 3+F_IFUNC 	
      009FB2 58 4F 52                 5 	.ascii "XOR"
      009FB2 CD 90                    6 	.word bit_xor 
      0022ED                       6321 	_dict_entry,5,WRITE,write  
      009FB4 89 A1                    1 	.word LINK 
                           0022EF     2 	LINK=.
      0022EF                          3 WRITE:
      009FB6 01                       4 	.byte 5 	
      009FB7 27 03 CC 88 FB           5 	.ascii "WRITE"
      009FBC 1C 8E                    6 	.word write 
      0022F7                       6322 	_dict_entry,5,WORDS,words 
      009FBC A6 80                    1 	.word LINK 
                           0022F9     2 	LINK=.
      0022F9                          3 WORDS:
      009FBE 15                       4 	.byte 5 	
      009FBF 01 27 05 A6 0A           5 	.ascii "WORDS"
      009FC4 CC 88                    6 	.word words 
      002301                       6323 	_dict_entry 4,WAIT,wait 
      009FC6 FD F9                    1 	.word LINK 
                           002303     2 	LINK=.
      009FC7                          3 WAIT:
      009FC7 CE                       4 	.byte 4 	
      009FC8 00 13 58 58              5 	.ascii "WAIT"
      009FCC 58 58                    6 	.word wait 
      00230A                       6324 	_dict_entry,3+F_IFUNC,USR,usr
      009FCE 58 9E                    1 	.word LINK 
                           00230C     2 	LINK=.
      00230C                          3 USR:
      009FD0 C8                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FD1 00 13 C7                 5 	.ascii "USR"
      009FD4 00 0D                    6 	.word usr 
      002312                       6325 	_dict_entry,5,UNTIL,until 
      009FD6 9F C8                    1 	.word LINK 
                           002314     2 	LINK=.
      002314                          3 UNTIL:
      009FD8 00                       4 	.byte 5 	
      009FD9 14 C7 00 0E CE           5 	.ascii "UNTIL"
      009FDE 00 15                    6 	.word until 
      00231C                       6326 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FE0 CF 00                    1 	.word LINK 
                           00231E     2 	LINK=.
      00231E                          3 UFLASH:
      009FE2 13                       4 	.byte 6+F_IFUNC 	
      009FE3 90 54 90 9E C8 00        5 	.ascii "UFLASH"
      009FE9 15 C7                    6 	.word uflash 
      002327                       6327 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009FEB 00 15                    1 	.word LINK 
                           002329     2 	LINK=.
      002329                          3 UBOUND:
      009FED 90                       4 	.byte 6+F_IFUNC 	
      009FEE 9F C8 00 16 C7 00        5 	.ascii "UBOUND"
      009FF4 16 CE                    6 	.word ubound 
      002332                       6328 	_dict_entry,4,TONE,tone  
      009FF6 00 0D                    1 	.word LINK 
                           002334     2 	LINK=.
      002334                          3 TONE:
      009FF8 54                       4 	.byte 4 	
      009FF9 54 54 9E C8              5 	.ascii "TONE"
      009FFD 00 0D                    6 	.word tone 
      00233B                       6329 	_dict_entry,2,TO,to
      009FFF 95 9F                    1 	.word LINK 
                           00233D     2 	LINK=.
      00233D                          3 TO:
      00A001 C8                       4 	.byte 2 	
      00A002 00 0E                    5 	.ascii "TO"
      00A004 97 C8                    6 	.word to 
      002342                       6330 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A006 00 16                    1 	.word LINK 
                           002344     2 	LINK=.
      002344                          3 TIMEOUT:
      00A008 97                       4 	.byte 7+F_IFUNC 	
      00A009 9E C8 00 15 95 CF 00     5 	.ascii "TIMEOUT"
      00A010 15 90                    6 	.word timeout 
      00234E                       6331 	_dict_entry,5,TIMER,set_timer
      00A012 85 65                    1 	.word LINK 
                           002350     2 	LINK=.
      002350                          3 TIMER:
      00A014 93                       4 	.byte 5 	
      00A015 5C 49 4D 45 52           5 	.ascii "TIMER"
      00A016 1F FF                    6 	.word set_timer 
      002358                       6332 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A016 A6 84                    1 	.word LINK 
                           00235A     2 	LINK=.
      00235A                          3 TICKS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A018 81                       4 	.byte 5+F_IFUNC 	
      00A019 54 49 43 4B 53           5 	.ascii "TICKS"
      00A019 52 03                    6 	.word get_ticks 
      002362                       6333 	_dict_entry,4,STOP,stop 
      00A01B 0F 02                    1 	.word LINK 
                           002364     2 	LINK=.
      002364                          3 STOP:
      00A01D 0F                       4 	.byte 4 	
      00A01E 03 90 AE A7              5 	.ascii "STOP"
      00A022 00 93                    6 	.word stop 
      00236B                       6334 	_dict_entry,4,STEP,step 
      00A024 F6 A4                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 STEP:
      00A026 0F                       4 	.byte 4 	
      00A027 6B 01 0C 03              5 	.ascii "STEP"
      00A02B 5C F6                    6 	.word step 
      002374                       6335 	_dict_entry,5,SPIWR,spi_write
      00A02D CD 83                    1 	.word LINK 
                           002376     2 	LINK=.
      002376                          3 SPIWR:
      00A02F 40                       4 	.byte 5 	
      00A030 0C 02 0A 01 26           5 	.ascii "SPIWR"
      00A035 F5 A6                    6 	.word spi_write 
      00237E                       6336 	_dict_entry,6,SPISEL,spi_select
      00A037 46 11                    1 	.word LINK 
                           002380     2 	LINK=.
      002380                          3 SPISEL:
      00A039 02                       4 	.byte 6 	
      00A03A 2B 09 A6 20 CD 83        5 	.ascii "SPISEL"
      00A040 40 0C                    6 	.word spi_select 
      002389                       6337 	_dict_entry,5,SPIEN,spi_enable 
      00A042 02 20                    1 	.word LINK 
                           00238B     2 	LINK=.
      00238B                          3 SPIEN:
      00A044 07                       4 	.byte 5 	
      00A045 A6 0D CD 83 40           5 	.ascii "SPIEN"
      00A04A 0F 02                    6 	.word spi_enable 
      002393                       6338 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A04C 72 A2                    1 	.word LINK 
                           002395     2 	LINK=.
      002395                          3 SPIRD:
      00A04E 00                       4 	.byte 5+F_IFUNC 	
      00A04F 02 90 FE 26 CF           5 	.ascii "SPIRD"
      00A054 A6 0D                    6 	.word spi_read 
      00239D                       6339 	_dict_entry,5,SLEEP,sleep 
      00A056 CD 83                    1 	.word LINK 
                           00239F     2 	LINK=.
      00239F                          3 SLEEP:
      00A058 40                       4 	.byte 5 	
      00A059 5F 7B 03 97 CD           5 	.ascii "SLEEP"
      00A05E 8A 42                    6 	.word sleep 
      0023A7                       6340 	_dict_entry,4+F_IFUNC,SIZE,size
      00A060 AE A0                    1 	.word LINK 
                           0023A9     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0023A9                          3 SIZE:
      00A062 69                       4 	.byte 4+F_IFUNC 	
      00A063 CD A7 C0 5B              5 	.ascii "SIZE"
      00A067 03 81                    6 	.word size 
      0023B0                       6341     _dict_entry,4,SHOW,show 
      00A069 20 77                    1 	.word LINK 
                           0023B2     2 	LINK=.
      0023B2                          3 SHOW:
      00A06B 6F                       4 	.byte 4 	
      00A06C 72 64 73 20              5 	.ascii "SHOW"
      00A070 69 6E                    6 	.word show 
      0023B9                       6342 	_dict_entry,4,SAVE,save
      00A072 20 64                    1 	.word LINK 
                           0023BB     2 	LINK=.
      0023BB                          3 SAVE:
      00A074 69                       4 	.byte 4 	
      00A075 63 74 69 6F              5 	.ascii "SAVE"
      00A079 6E 61                    6 	.word save 
      0023C2                       6343 	_dict_entry 3,RUN,run
      00A07B 72 79                    1 	.word LINK 
                           0023C4     2 	LINK=.
      0023C4                          3 RUN:
      00A07D 0A                       4 	.byte 3 	
      00A07E 00 55 4E                 5 	.ascii "RUN"
      00A07F 17 B6                    6 	.word run 
      0023CA                       6344 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A07F CD 90                    1 	.word LINK 
                           0023CC     2 	LINK=.
      0023CC                          3 RSHIFT:
      00A081 8E                       4 	.byte 6+F_IFUNC 	
      00A082 A1 01 27 03 CC 88        5 	.ascii "RSHIFT"
      00A088 FB 9C                    6 	.word rshift 
      00A089                       6345 	_dict_entry,3+F_IFUNC,RND,random 
      00A089 85 CF                    1 	.word LINK 
                           0023D7     2 	LINK=.
      0023D7                          3 RND:
      00A08B 00                       4 	.byte 3+F_IFUNC 	
      00A08C 11 81 44                 5 	.ascii "RND"
      00A08E 1F 32                    6 	.word random 
      0023DD                       6346 	_dict_entry,6,RETURN,return 
      00A08E CE 00                    1 	.word LINK 
                           0023DF     2 	LINK=.
      0023DF                          3 RETURN:
      00A090 11                       4 	.byte 6 	
      00A091 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A091 53 A3                    6 	.word return 
      0023E8                       6347 	_dict_entry,7,RESTORE,restore 
      00A093 FF FF                    1 	.word LINK 
                           0023EA     2 	LINK=.
      0023EA                          3 RESTORE:
      00A095 27                       4 	.byte 7 	
      00A096 01 5F A6 84 81 52 45     5 	.ascii "RESTORE"
      00A09B 21 83                    6 	.word restore 
      0023F4                       6348 	_dict_entry 6,REMARK,remark 
      00A09B CD 90                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                           0023F6     2 	LINK=.
      0023F6                          3 REMARK:
      00A09D 89                       4 	.byte 6 	
      00A09E A1 01 27 03 CC 88        5 	.ascii "REMARK"
      00A0A4 FB 85                    6 	.word remark 
      0023FF                       6349 	_dict_entry,6,REBOOT,cold_start
      00A0A6 20 E9                    1 	.word LINK 
                           002401     2 	LINK=.
      00A0A8                          3 REBOOT:
      00A0A8 CD                       4 	.byte 6 	
      00A0A9 90 8E A1 01 27 03        5 	.ascii "REBOOT"
      00A0AF CC 88                    6 	.word cold_start 
      00240A                       6350 	_dict_entry,4+F_IFUNC,READ,read  
      00A0B1 FB 85                    1 	.word LINK 
                           00240C     2 	LINK=.
      00240C                          3 READ:
      00A0B3 4B                       4 	.byte 4+F_IFUNC 	
      00A0B4 00 35 CC 50              5 	.ascii "READ"
      00A0B8 E0 9E                    6 	.word read 
      002413                       6351 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0BA A4 3F                    1 	.word LINK 
                           002415     2 	LINK=.
      002415                          3 QKEY:
      00A0BC 95                       4 	.byte 4+F_IFUNC 	
      00A0BD A3 00 FF 23              5 	.ascii "QKEY"
      00A0C1 06 0C                    6 	.word qkey 
      00241C                       6352 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0C3 01 98                    1 	.word LINK 
                           00241E     2 	LINK=.
      00241E                          3 PRTI:
      00A0C5 56                       4 	.byte 4+F_IFUNC 	
      00A0C6 20 F5 35 55              5 	.ascii "PRTI"
      00A0CA 50 E0                    6 	.word const_porti 
      002425                       6353 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0CC 84 C7                    1 	.word LINK 
                           002427     2 	LINK=.
      002427                          3 PRTH:
      00A0CE 50                       4 	.byte 4+F_IFUNC 	
      00A0CF E1 9F 4A 35              5 	.ascii "PRTH"
      00A0D3 55 50                    6 	.word const_porth 
      00242E                       6354 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A0D5 E0 C7                    1 	.word LINK 
                           002430     2 	LINK=.
      002430                          3 PRTG:
      00A0D7 50                       4 	.byte 4+F_IFUNC 	
      00A0D8 E2 35 AA 50              5 	.ascii "PRTG"
      00A0DC E0 81                    6 	.word const_portg 
      00A0DE                       6355 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A0DE 35 AA                    1 	.word LINK 
                           002439     2 	LINK=.
      002439                          3 PRTF:
      00A0E0 50                       4 	.byte 4+F_IFUNC 	
      00A0E1 E0 81 54 46              5 	.ascii "PRTF"
      00A0E3 21 08                    6 	.word const_portf 
      002440                       6356 	_dict_entry,4+F_IFUNC,PRTE,const_porte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0E3 CD 90                    1 	.word LINK 
                           002442     2 	LINK=.
      002442                          3 PRTE:
      00A0E5 89                       4 	.byte 4+F_IFUNC 	
      00A0E6 A1 01 27 03              5 	.ascii "PRTE"
      00A0EA CC 88                    6 	.word const_porte 
      002449                       6357 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A0EC FB 85                    1 	.word LINK 
                           00244B     2 	LINK=.
      00A0EE                          3 PRTD:
      00A0EE 5D                       4 	.byte 4+F_IFUNC 	
      00A0EF 27 0A A6 0F              5 	.ascii "PRTD"
      00A0F3 59 25                    6 	.word const_portd 
      002452                       6358 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A0F5 03 4A                    1 	.word LINK 
                           002454     2 	LINK=.
      002454                          3 PRTC:
      00A0F7 20                       4 	.byte 4+F_IFUNC 	
      00A0F8 FA 5F 97 A6              5 	.ascii "PRTC"
      00A0FC 84 81                    6 	.word const_portc 
      00A0FE                       6359 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A0FE CD 90                    1 	.word LINK 
                           00245D     2 	LINK=.
      00245D                          3 PRTB:
      00A100 89                       4 	.byte 4+F_IFUNC 	
      00A101 A1 01 27 03              5 	.ascii "PRTB"
      00A105 CC 88                    6 	.word const_portb 
      002464                       6360 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A107 FB 85                    1 	.word LINK 
                           002466     2 	LINK=.
      002466                          3 PRTA:
      00A109 9F                       4 	.byte 4+F_IFUNC 	
      00A10A A4 0F 5F 5C              5 	.ascii "PRTA"
      00A10E 4D 27                    6 	.word const_porta 
      00246D                       6361 	_dict_entry 5,PRINT,print 
      00A110 04 58                    1 	.word LINK 
                           00246F     2 	LINK=.
      00246F                          3 PRINT:
      00A112 4A                       4 	.byte 5 	
      00A113 20 F9 A6 84 81           5 	.ascii "PRINT"
      00A118 14 C9                    6 	.word print 
      002477                       6362 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A118 CD 90                    1 	.word LINK 
                           002479     2 	LINK=.
      002479                          3 POUT:
      00A11A 89                       4 	.byte 4+F_IFUNC 	
      00A11B A1 01 27 03              5 	.ascii "POUT"
      00A11F CC 88                    6 	.word const_output 
      002480                       6363 	_dict_entry,4,POKE,poke 
      00A121 FB 85                    1 	.word LINK 
                           002482     2 	LINK=.
      002482                          3 POKE:
      00A123 53                       4 	.byte 4 	
      00A124 A6 84 81 45              5 	.ascii "POKE"
      00A127 16 49                    6 	.word poke 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      002489                       6364 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A127 85 52                    1 	.word LINK 
                           00248B     2 	LINK=.
      00248B                          3 PINP:
      00A129 04                       4 	.byte 4+F_IFUNC 	
      00A12A 89 90 CE 00              5 	.ascii "PINP"
      00A12E 05 17                    6 	.word const_input 
      002492                       6365 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A130 03 90                    1 	.word LINK 
                           002494     2 	LINK=.
      002494                          3 PEEK:
      00A132 CE                       4 	.byte 4+F_IFUNC 	
      00A133 00 01 17 05              5 	.ascii "PEEK"
      00A137 72 5C                    6 	.word peek 
      00249B                       6366 	_dict_entry,5,PMODE,pin_mode 
      00A139 00 21                    1 	.word LINK 
                           00249D     2 	LINK=.
      00249D                          3 PMODE:
      00A13B 81                       4 	.byte 5 	
      00A13C 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A13C 72 5D                    6 	.word pin_mode 
      0024A5                       6367 	_dict_entry,5,PAUSE,pause 
      00A13E 00 21                    1 	.word LINK 
                           0024A7     2 	LINK=.
      0024A7                          3 PAUSE:
      00A140 26                       4 	.byte 5 	
      00A141 03 CC 88 FB 45           5 	.ascii "PAUSE"
      00A145 1D C5                    6 	.word pause 
      0024AF                       6368 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A145 CD 91                    1 	.word LINK 
                           0024B1     2 	LINK=.
      0024B1                          3 PAD:
      00A147 D0                       4 	.byte 3+F_IFUNC 	
      00A148 A1 84 27                 5 	.ascii "PAD"
      00A14B 03 CC                    6 	.word pad_ref 
      0024B7                       6369 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A14D 88 FB                    1 	.word LINK 
                           0024B9     2 	LINK=.
      00A14F                          3 OR:
      00A14F 5D                       4 	.byte 2+F_IFUNC 	
      00A150 26 10                    5 	.ascii "OR"
      00A152 1E 03                    6 	.word bit_or 
      0024BE                       6370 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A154 CF 00                    1 	.word LINK 
                           0024C0     2 	LINK=.
      0024C0                          3 ODR:
      00A156 05                       4 	.byte 3+F_IFUNC 	
      00A157 E6 02 C7                 5 	.ascii "ODR"
      00A15A 00 04                    6 	.word const_odr 
      0024C6                       6371 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A15C 1E 05                    1 	.word LINK 
                           0024C8     2 	LINK=.
      0024C8                          3 NOT:
      00A15E CF                       4 	.byte 3+F_IFUNC 	
      00A15F 00 01 81                 5 	.ascii "NOT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A162 20 1B                    6 	.word func_not 
      0024CE                       6372 	_dict_entry,3,NEW,new
      00A162 85 5B                    1 	.word LINK 
                           0024D0     2 	LINK=.
      0024D0                          3 NEW:
      00A164 04                       4 	.byte 3 	
      00A165 72 5A 00                 5 	.ascii "NEW"
      00A168 21 FC                    6 	.word new 
      00A16A                       6373 	_dict_entry,4,NEXT,next 
      00A16A AE 00                    1 	.word LINK 
                           0024D8     2 	LINK=.
      0024D8                          3 NEXT:
      00A16C 00                       4 	.byte 4 	
      00A16D A6 84 81 54              5 	.ascii "NEXT"
      00A170 16 FD                    6 	.word next 
      0024DF                       6374 	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
      00A170 AE 00                    1 	.word LINK 
                           0024E1     2 	LINK=.
      0024E1                          3 MULDIV:
      00A172 01                       4 	.byte 6+F_IFUNC 	
      00A173 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A176 0F 61                    6 	.word muldiv 
      0024EA                       6375 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A176 AE 00                    1 	.word LINK 
                           0024EC     2 	LINK=.
      0024EC                          3 LSHIFT:
      00A178 02                       4 	.byte 6+F_IFUNC 	
      00A179 A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A17C 1E 83                    6 	.word lshift 
      0024F5                       6376 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A17C AE 00                    1 	.word LINK 
                           0024F7     2 	LINK=.
      0024F7                          3 LOG:
      00A17E 03                       4 	.byte 3+F_IFUNC 	
      00A17F A6 84 81                 5 	.ascii "LOG"
      00A182 20 63                    6 	.word log2 
      0024FD                       6377 	_dict_entry,4,LOAD,load 
      00A182 AE 00                    1 	.word LINK 
                           0024FF     2 	LINK=.
      0024FF                          3 LOAD:
      00A184 04                       4 	.byte 4 	
      00A185 A6 84 81 44              5 	.ascii "LOAD"
      00A188 1B 75                    6 	.word load 
      002506                       6378 	_dict_entry 4,LIST,list
      00A188 AE 00                    1 	.word LINK 
                           002508     2 	LINK=.
      002508                          3 LIST:
      00A18A 05                       4 	.byte 4 	
      00A18B A6 84 81 54              5 	.ascii "LIST"
      00A18E 12 4D                    6 	.word list 
      00250F                       6379 	_dict_entry 3,LET,let 
      00A18E AE 00                    1 	.word LINK 
                           002511     2 	LINK=.
      002511                          3 LET:
      00A190 06                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A191 A6 84 81                 5 	.ascii "LET"
      00A194 12 22                    6 	.word let 
      002517                       6380 	_dict_entry,3+F_IFUNC,KEY,key 
      00A194 AE 00                    1 	.word LINK 
                           002519     2 	LINK=.
      002519                          3 KEY:
      00A196 07                       4 	.byte 3+F_IFUNC 	
      00A197 A6 84 81                 5 	.ascii "KEY"
      00A19A 1C F7                    6 	.word key 
      00251F                       6381 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A19A AE 00                    1 	.word LINK 
                           002521     2 	LINK=.
      002521                          3 IWDGREF:
      00A19C 08                       4 	.byte 7 	
      00A19D A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1A0 20 5E                    6 	.word refresh_iwdg 
      00252B                       6382 	_dict_entry,6,IWDGEN,enable_iwdg
      00A1A0 A6 84                    1 	.word LINK 
                           00252D     2 	LINK=.
      00252D                          3 IWDGEN:
      00A1A2 AE                       4 	.byte 6 	
      00A1A3 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1A6 20 28                    6 	.word enable_iwdg 
      002536                       6383 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A1A6 A6 84                    1 	.word LINK 
                           002538     2 	LINK=.
      002538                          3 INVERT:
      00A1A8 AE                       4 	.byte 6+F_IFUNC 	
      00A1A9 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A1AC 20 98                    6 	.word invert 
      002541                       6384 	_dict_entry,5,INPUT,input_var  
      00A1AC A6 84                    1 	.word LINK 
                           002543     2 	LINK=.
      002543                          3 INPUT:
      00A1AE AE                       4 	.byte 5 	
      00A1AF 00 02 81 55 54           5 	.ascii "INPUT"
      00A1B2 15 5A                    6 	.word input_var 
      00254B                       6385 	_dict_entry,2,IF,if 
      00A1B2 A6 84                    1 	.word LINK 
                           00254D     2 	LINK=.
      00254D                          3 IF:
      00A1B4 AE                       4 	.byte 2 	
      00A1B5 00 03                    5 	.ascii "IF"
      00A1B7 81 69                    6 	.word if 
      00A1B8                       6386 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1B8 A6 84                    1 	.word LINK 
                           002554     2 	LINK=.
      002554                          3 IDR:
      00A1BA AE                       4 	.byte 3+F_IFUNC 	
      00A1BB 00 04 81                 5 	.ascii "IDR"
      00A1BE 21 26                    6 	.word const_idr 
      00255A                       6387 	_dict_entry,3,HEX,hex_base
      00A1BE A6 84                    1 	.word LINK 
                           00255C     2 	LINK=.
      00255C                          3 HEX:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1C0 AE                       4 	.byte 3 	
      00A1C1 00 01 81                 5 	.ascii "HEX"
      00A1C4 11 EC                    6 	.word hex_base 
      002562                       6388 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1C4 A6 84                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 GPIO:
      00A1C6 AE                       4 	.byte 4+F_IFUNC 	
      00A1C7 00 00 81 4F              5 	.ascii "GPIO"
      00A1CA 1D 0C                    6 	.word gpio 
      00256B                       6389 	_dict_entry,4,GOTO,goto 
      00A1CA A6 84                    1 	.word LINK 
                           00256D     2 	LINK=.
      00256D                          3 GOTO:
      00A1CC AE                       4 	.byte 4 	
      00A1CD 40 00 81 4F              5 	.ascii "GOTO"
      00A1D0 17 5D                    6 	.word goto 
      002574                       6390 	_dict_entry,5,GOSUB,gosub 
      00A1D0 55 00                    1 	.word LINK 
                           002576     2 	LINK=.
      002576                          3 GOSUB:
      00A1D2 04                       4 	.byte 5 	
      00A1D3 00 02 81 55 42           5 	.ascii "GOSUB"
      00A1D6 17 78                    6 	.word gosub 
      00257E                       6391 	_dict_entry,6,FORGET,forget 
      00A1D6 CD 91                    1 	.word LINK 
                           002580     2 	LINK=.
      002580                          3 FORGET:
      00A1D8 87                       4 	.byte 6 	
      00A1D9 A1 84 27 03 CC 88        5 	.ascii "FORGET"
      00A1DF FB CD                    6 	.word forget 
      002589                       6392 	_dict_entry,3,FOR,for 
      00A1E1 84 84                    1 	.word LINK 
                           00258B     2 	LINK=.
      00258B                          3 FOR:
      00A1E3 5D                       4 	.byte 3 	
      00A1E4 26 05 A6                 5 	.ascii "FOR"
      00A1E7 05 CC                    6 	.word for 
      002591                       6393 	_dict_entry,4,FCPU,fcpu 
      00A1E9 88 FD                    1 	.word LINK 
                           002593     2 	LINK=.
      00A1EB                          3 FCPU:
      00A1EB 90                       4 	.byte 4 	
      00A1EC 93 EE 04 A3              5 	.ascii "FCPU"
      00A1F0 A1 D0                    6 	.word fcpu 
      00259A                       6394 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A1F2 26 F2                    1 	.word LINK 
                           00259C     2 	LINK=.
      00259C                          3 EEPROM:
      00A1F4 90                       4 	.byte 6+F_IFUNC 	
      00A1F5 CF 00 07 90 E6 02        5 	.ascii "EEPROM"
      00A1FB C7 00                    6 	.word const_eeprom_base 
      0025A5                       6395 	_dict_entry,3,END,cmd_end  
      00A1FD 0A 35                    1 	.word LINK 
                           0025A7     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0025A7                          3 END:
      00A1FF 06                       4 	.byte 3 	
      00A200 00 09 81                 5 	.ascii "END"
      00A203 18 0F                    6 	.word cmd_end 
      0025AD                       6396 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A203 72 5F                    1 	.word LINK 
                           0025AF     2 	LINK=.
      0025AF                          3 DWRITE:
      00A205 00                       4 	.byte 6+F_CMD 	
      00A206 07 72 5F 00 08 72        5 	.ascii "DWRITE"
      00A20C 5F 00                    6 	.word digital_write 
      0025B8                       6397 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A20E 09 72                    1 	.word LINK 
                           0025BA     2 	LINK=.
      0025BA                          3 DREAD:
      00A210 5F                       4 	.byte 5+F_IFUNC 	
      00A211 00 0A CE 00 1D           5 	.ascii "DREAD"
      00A216 18 D3                    6 	.word digital_read 
      0025C2                       6398 	_dict_entry,2,DO,do_loop
      00A216 C3 00                    1 	.word LINK 
                           0025C4     2 	LINK=.
      0025C4                          3 DO:
      00A218 1F                       4 	.byte 2 	
      00A219 24 17                    5 	.ascii "DO"
      00A21B 90 93                    6 	.word do_loop 
      0025C9                       6399 	_dict_entry,3,DIR,directory 
      00A21D EE 04                    1 	.word LINK 
                           0025CB     2 	LINK=.
      0025CB                          3 DIR:
      00A21F A3                       4 	.byte 3 	
      00A220 A1 D0 26                 5 	.ascii "DIR"
      00A223 1A 90                    6 	.word directory 
      0025D1                       6400 	_dict_entry,3,DEC,dec_base
      00A225 CF 00                    1 	.word LINK 
                           0025D3     2 	LINK=.
      0025D3                          3 DEC:
      00A227 07                       4 	.byte 3 	
      00A228 90 E6 02                 5 	.ascii "DEC"
      00A22B C7 00                    6 	.word dec_base 
      0025D9                       6401 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A22D 0A 35                    1 	.word LINK 
                           0025DB     2 	LINK=.
      0025DB                          3 DDR:
      00A22F 06                       4 	.byte 3+F_IFUNC 	
      00A230 00 09 72                 5 	.ascii "DDR"
      00A233 5D 00                    6 	.word const_ddr 
      0025E1                       6402 	_dict_entry,6,DATALN,data_line  
      00A235 0A 26                    1 	.word LINK 
                           0025E3     2 	LINK=.
      0025E3                          3 DATALN:
      00A237 05                       4 	.byte 6 	
      00A238 A6 0C CC 88 FD 81        5 	.ascii "DATALN"
      00A23E 21 56                    6 	.word data_line 
      0025EC                       6403 	_dict_entry,4,DATA,data  
      00A23E 93 E6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           0025EE     2 	LINK=.
      0025EE                          3 DATA:
      00A240 02                       4 	.byte 4 	
      00A241 C7 00 0E 72              5 	.ascii "DATA"
      00A245 5F 00                    6 	.word data 
      0025F5                       6404 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A247 0D 72                    1 	.word LINK 
                           0025F7     2 	LINK=.
      0025F7                          3 CRL:
      00A249 BB                       4 	.byte 3+F_IFUNC 	
      00A24A 00 0D 20                 5 	.ascii "CRL"
      00A24D C8 32                    6 	.word const_cr1 
      00A24E                       6405 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A24E 52 06                    1 	.word LINK 
                           0025FF     2 	LINK=.
      00A250                          3 CRH:
      00A250 C6                       4 	.byte 3+F_IFUNC 	
      00A251 00 09 C1                 5 	.ascii "CRH"
      00A254 00 0A                    6 	.word const_cr2 
      002605                       6406 	_dict_entry,4+F_CFUNC,CHAR,char
      00A256 27 37                    1 	.word LINK 
                           002607     2 	LINK=.
      002607                          3 CHAR:
      00A258 CD                       4 	.byte 4+F_CFUNC 	
      00A259 95 BA CE 00              5 	.ascii "CHAR"
      00A25D 07 CF                    6 	.word char 
      00260E                       6407 	_dict_entry,3,BYE,bye 
      00A25F 00 05                    1 	.word LINK 
                           002610     2 	LINK=.
      002610                          3 BYE:
      00A261 55                       4 	.byte 3 	
      00A262 00 09 00                 5 	.ascii "BYE"
      00A265 02 55                    6 	.word bye 
      002616                       6408 	_dict_entry,5,BTOGL,bit_toggle
      00A267 00 0A                    1 	.word LINK 
                           002618     2 	LINK=.
      002618                          3 BTOGL:
      00A269 00                       4 	.byte 5 	
      00A26A 04 CD 91 87 A1           5 	.ascii "BTOGL"
      00A26F 84 27                    6 	.word bit_toggle 
      002620                       6409 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A271 03 CC                    1 	.word LINK 
                           002622     2 	LINK=.
      002622                          3 BTEST:
      00A273 88                       4 	.byte 5+F_IFUNC 	
      00A274 FB 54 45 53 54           5 	.ascii "BTEST"
      00A275 16 22                    6 	.word bit_test 
      00262A                       6410 	_dict_entry,4,BSET,bit_set 
      00A275 1F 05                    1 	.word LINK 
                           00262C     2 	LINK=.
      00262C                          3 BSET:
      00A277 CD                       4 	.byte 4 	
      00A278 89 ED CE 00              5 	.ascii "BSET"
      00A27C 05 CF                    6 	.word bit_set 
      002633                       6411 	_dict_entry,4,BRES,bit_reset
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A27E 00 07                    1 	.word LINK 
                           002635     2 	LINK=.
      002635                          3 BRES:
      00A280 55                       4 	.byte 4 	
      00A281 00 02 00 09              5 	.ascii "BRES"
      00A285 CD 95                    6 	.word bit_reset 
      00263C                       6412 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A287 CA 1E                    1 	.word LINK 
                           00263E     2 	LINK=.
      00263E                          3 BIT:
      00A289 05                       4 	.byte 3+F_IFUNC 	
      00A28A A6 84 5B                 5 	.ascii "BIT"
      00A28D 06 81                    6 	.word bitmask 
      00A28F                       6413 	_dict_entry,3,AWU,awu 
      00A28F 90 CE                    1 	.word LINK 
                           002646     2 	LINK=.
      002646                          3 AWU:
      00A291 00                       4 	.byte 3 	
      00A292 07 72 5F                 5 	.ascii "AWU"
      00A295 00 07                    6 	.word awu 
      00264C                       6414 	_dict_entry,7,AUTORUN,autorun
      00A297 72 5F                    1 	.word LINK 
                           00264E     2 	LINK=.
      00264E                          3 AUTORUN:
      00A299 00                       4 	.byte 7 	
      00A29A 08 72 5F 00 09 72 5F     5 	.ascii "AUTORUN"
      00A2A1 00 0A                    6 	.word autorun 
      002658                       6415 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A2A3 CD A2                    1 	.word LINK 
                           00265A     2 	LINK=.
      00265A                          3 ASC:
      00A2A5 3E                       4 	.byte 3+F_IFUNC 	
      00A2A6 20 A8 43                 5 	.ascii "ASC"
      00A2A8 1C D7                    6 	.word ascii 
      002660                       6416 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2A8 CD 90                    1 	.word LINK 
                           002662     2 	LINK=.
      002662                          3 AND:
      00A2AA 8E                       4 	.byte 3+F_IFUNC 	
      00A2AB A1 02 27                 5 	.ascii "AND"
      00A2AE 03 CC                    6 	.word bit_and 
      002668                       6417 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2B0 88 FB                    1 	.word LINK 
                           00266A     2 	LINK=.
      00A2B2                          3 ADCREAD:
      00A2B2 72                       4 	.byte 7+F_IFUNC 	
      00A2B3 12 50 C7 85 5D 27 21     5 	.ascii "ADCREAD"
      00A2BA 85 A6                    6 	.word analog_read 
      002674                       6418 	_dict_entry,5,ADCON,power_adc 
      00A2BC 08 42                    1 	.word LINK 
                           002676     2 	LINK=.
      002676                          3 ADCON:
      00A2BE 9F                       4 	.byte 5 	
      00A2BF C7 52 00 72 1A           5 	.ascii "ADCON"
      00A2C4 50 14                    6 	.word power_adc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00267E                       6419 kword_dict:
      00267E                       6420 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2C6 72 1A                    1 	.word LINK 
                           002680     2 	LINK=.
      002680                          3 ABS:
      00A2C8 50                       4 	.byte 3+F_IFUNC 	
      00A2C9 16 72 14                 5 	.ascii "ABS"
      00A2CC 52 00                    6 	.word abs 
                                   6421 	
                                   6422 
      002700                       6423 	.bndry 128 ; align on FLASH block.
                                   6424 ; free space for user application  
      002700                       6425 user_space:
                                   6426 ; USR() function test
      00A2CE 72               [ 2] 6427 	pushw x 
      00A2CF 12 52 01 72      [ 1] 6428 	bset PC_ODR,#5 
      00A2D3 10               [ 2] 6429 	popw x 
      00A2D4 52 01 72         [ 4] 6430 	call pause02 
      00A2D7 1C 52 00 81      [ 1] 6431 	bres PC_ODR,#5 
      00A2DB 81               [ 4] 6432 	ret
                                   6433 
                                   6434 	.area FLASH_DRIVE (ABS)
      010000                       6435 	.org 0x10000
      010000                       6436 fdrive:
                                   6437 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002680 R   |     ACK     =  000006 
  5 ADCON      002676 R   |   5 ADCREAD    00266A R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002662 R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        00265A R
    ATTRIB  =  000002     |   5 AUTORUN    00264E R   |     AUTORUN_=  004000 
  5 AWU        002646 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
  5 BIT        00263E R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       002635 R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       00262C R   |     BSIZE   =  000001 
  5 BTEST      002622 R   |   5 BTOGL      002618 R   |     BTW     =  000001 
  5 BYE        002610 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       002607 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        0025FF R
  5 CRL        0025F7 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       0025EE R   |   5 DATALN     0025E3 R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        0025DB R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        0025D3 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0025CB R   |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0025C4 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0025BA R   |   5 DWRITE     0025AF R   |   5 EEPROM     00259C R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        0025A7 R   |     ENQ     =  000005 
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
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       002593 R
    FF      =  00000C     |     FHSE    =  7A1200     |     FHSI    =  F42400 
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
    FLSI    =  01F400     |   5 FOR        00258B R   |   5 FORGET     002580 R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002576 R   |   5 GOTO       00256D R
  5 GPIO       002564 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        00255C R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002554 R
  5 IF         00254D R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002543 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
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
    INT_VECT=  008058     |   5 INVERT     002538 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     00252D R
  5 IWDGREF    002521 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002519 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        002511 R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  002680 R   |   5 LIST       002508 R   |     LL      =  000001 
    LLEN    =  000002     |     LN_PTR  =  000005     |   5 LOAD       0024FF R
  5 LOG        0024F7 R   |   5 LSHIFT     0024EC R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   5 MULDIV     0024E1 R   |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0024D0 R   |     NEW_FREE=  000001     |   5 NEXT       0024D8 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        0024C8 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        0024C0 R   |     ONOFF   =  000003 
    OP      =  000003     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0024B9 R
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        0024B1 R
    PAD_SIZE=  000080     |   5 PAUSE      0024A7 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002494 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       00248B R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00249D R
  5 POKE       002482 R   |     PORT    =  000003     |   5 POUT       002479 R
    PREV    =  000001     |   5 PRINT      00246F R   |   5 PRTA       002466 R
  5 PRTB       00245D R   |   5 PRTC       002454 R   |   5 PRTD       00244B R
  5 PRTE       002442 R   |   5 PRTF       002439 R   |   5 PRTG       002430 R
  5 PRTH       002427 R   |   5 PRTI       00241E R   |     PSTR    =  000003 
  5 QKEY       002415 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 READ       00240C R   |   5 REBOOT     002401 R
    REG     =  000001     |     RELOP   =  000003     |   5 REMARK     0023F6 R
  5 RESTORE    0023EA R   |     RETL1   =  000001     |   5 RETURN     0023DF R
    RET_ADDR=  000003     |     RET_INW =  000005     |   5 RND        0023D7 R
    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0023CC R
    RST_SR  =  0050B3     |   5 RUN        0023C4 R   |     RX_QUEUE=  000008 
  5 SAVE       0023BB R   |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0023B2 R
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0023A9 R
    SKIP    =  000005     |   5 SLEEP      00239F R   |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      00238B R
  5 SPIRD      002395 R   |   5 SPISEL     002380 R   |   5 SPIWR      002376 R
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_CS_B=  000005     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_SR_B=  000007     |     SPI_SR_C=  000004     |     SPI_SR_M=  000005 
    SPI_SR_O=  000006     |     SPI_SR_R=  000000     |     SPI_SR_T=  000001 
    SPI_SR_W=  000003     |     SPI_TXCR=  005207     |     SQUOT   =  000006 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  0000A0 
  5 STEP       00236D R   |   5 STOP       002364 R   |     STR     =  000003 
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      00235A R
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
    TIM1_CCM=  000000     |     TIM1_CCM=  000001     |     TIM1_CCM=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM2_IER=  005301     |     TIM2_PSC=  00530C     |     TIM2_SR1=  005302 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   5 TIMEOUT    002344 R   |   5 TIMER      002350 R
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
  5 TO         00233D R   |   5 TONE       002334 R   |   5 Timer4Up   00004F R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     002329 R   |   5 UBTN_Han   000092 R
  5 UFLASH     00231E R   |   5 UNTIL      002314 R   |     US      =  00001F 
  5 USER_ABO   00009A R   |   5 USR        00230C R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 Uart1RxH   00000F R
  5 UserButt   000065 R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002303 R
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      0022F9 R
  5 WRITE      0022EF R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   5 XOR        0022E7 R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E27 R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
  1 acc8       00000D GR  |   5 add_char   001489 R   |   5 add_spac   0012DE R
  5 analog_r   00189F R   |   5 arduino_   001F12 R   |   5 arg_list   00100E R
  1 array_si   000021 R   |   5 ascii      001CD7 R   |   5 at_tst     000CA0 R
  5 atoi24     000DB1 GR  |   5 atoi_exi   000E17 R   |   5 autorun    001D62 R
  5 autorun_   0006D2 R   |   5 awu        001DD8 R   |   5 awu02      001DE2 R
  5 bad_port   001D31 R   |   1 base       00000A R   |   1 basicptr   000004 GR
  5 beep       00182C R   |   5 beep_1kh   001816 GR  |   5 bin_exit   000B7E R
  5 bit_and    001E3B R   |   5 bit_or     001E53 R   |   5 bit_rese   001601 R
  5 bit_set    0015F1 R   |   5 bit_test   001622 R   |   5 bit_togg   001612 R
  5 bit_xor    001E6B R   |   5 bitmask    00207E R   |   5 bkslsh_t   000C4D R
  5 block_er   0001BB R   |   5 break_po   00196C R   |   5 bye        001D59 R
  5 cancel_a   00069A R   |   5 char       001CC5 R   |   5 clear_ba   0006E7 R
  5 clear_va   000561 R   |   5 clock_in   0000B5 R   |   5 cmd_end    00180F R
  5 cmd_line   000905 R   |   5 cmd_name   000F7D R   |   5 cmp_name   001A0D R
  5 cold_sta   0005D8 R   |   5 colon_ts   000C74 R   |   5 comma_ts   000C7F R
  5 comp_msg   00085B R   |   5 compile    0004EE R   |   5 const_cr   002132 R
  5 const_cr   002138 R   |   5 const_dd   00212C R   |   5 const_ee   00214A R
  5 const_id   002126 R   |   5 const_in   002144 R   |   5 const_od   002120 R
  5 const_ou   00213E R   |   5 const_po   0020EA R   |   5 const_po   0020F0 R
  5 const_po   0020F6 R   |   5 const_po   0020FC R   |   5 const_po   002102 R
  5 const_po   002108 R   |   5 const_po   00210E R   |   5 const_po   002114 R
  5 const_po   00211A R   |   5 convert_   000AF5 R   |   5 copy_com   000CD5 R
  1 count      000003 GR  |   5 cp_loop    000FBD R   |   5 cpy_cmd_   0012C9 R
  5 cpy_quot   001302 R   |   5 create_g   000455 R   |   5 cs_high    0022DA R
  5 cstk_pro   0011C5 R   |   5 dash_tst   000C95 R   |   5 data       002150 R
  1 data_len   000009 R   |   5 data_lin   002156 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   002196 R   |   5 dbl_sign   000EE5 R
  5 dec_base   0011F1 R   |   5 decomp_l   001392 R   |   5 decompil   00134B GR
  5 del_line   000428 R   |   5 digital_   0018D3 R   |   5 digital_   001903 R
  5 dir_loop   001C18 R   |   5 director   001C0C R   |   5 disk_fre   0019FA R
  5 div32_16   000EEF R   |   5 divide     000F46 R   |   5 divu24_8   000A38 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

  5 dneg       000EDA R   |   5 do_loop    0020A7 R   |   5 do_progr   0001AE R
  5 drive_fr   001C81 R   |   5 enable_i   002028 R   |   5 eql_tst    000D2A R
  5 equal      00149C R   |   5 erase_fl   0001DA R   |   5 err_bad_   0007C7 R
  5 err_buf_   00083D R   |   5 err_cmd_   00078B R   |   5 err_div0   000750 R
  5 err_dupl   0007A5 R   |   5 err_math   000737 R   |   5 err_mem_   00071C R
  5 err_msg    0006FC R   |   5 err_no_a   0007D3 R   |   5 err_no_d   000806 R
  5 err_no_f   00082A R   |   5 err_no_l   00075F R   |   5 err_no_p   000816 R
  5 err_not_   0007B6 R   |   5 err_run_   000775 R   |   5 err_synt   000729 R
  5 escaped    000B0A R   |   5 expect     000FFC R   |   5 expr_exi   00114D R
  5 expressi   001107 R   |   5 factor     00105E R   |   1 farptr     000016 R
  5 fcpu       001EB5 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001C79 R   |   5 first_li   001276 R   |   1 flags      000023 R
  5 for        00167D R   |   5 forget     001BA5 R   |   1 free_ram   000063 R
  5 func_arg   001009 R   |   5 func_not   00201B R   |   5 ge         00149E R
  5 get_arra   001039 R   |   5 get_targ   001747 R   |   5 get_tick   001E21 R
  5 get_toke   000BE6 R   |   5 getc       0002C9 GR  |   5 gosub      001778 R
  5 goto       00175D R   |   5 gpio       001D0C R   |   5 gt         00149A R
  5 gt_tst     000D35 R   |   5 hex_base   0011EC R   |   5 hex_dump   000359 R
  5 if         001669 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   0019BA R   |   5 input_ex   0015C3 R
  5 input_lo   00155C R   |   5 input_va   00155A R   |   5 insert_l   000481 R
  5 insert_l   0004EB R   |   5 interp_l   000946 R   |   5 interpre   000921 R
  5 invert     002098 R   |   5 is_alnum   000589 R   |   5 is_alpha   00056F R
  5 is_digit   000580 R   |   5 itoa       0009DE R   |   5 itoa_loo   0009FD R
  5 jp_to_ta   00176B R   |   5 key        001CF7 R   |   5 kw_loop    000B9A R
  5 kword_di   00267E R   |   5 kword_en   0022E5 R   |   5 le         0014A3 R
  5 leading_   00206E R   |   5 let        001222 R   |   5 let_arra   001230 R
  5 let_var    001233 R   |   5 lines_sk   001279 R   |   5 list       00124D R
  5 list_exi   0012BB R   |   5 list_loo   001299 R   |   5 load       001B75 R
  5 load_aut   0006A9 R   |   5 load_fil   001B44 R   |   5 log2       002063 R
  5 logical_   002011 R   |   5 long_div   000EC2 R   |   5 loop_bac   00172A R
  1 loop_dep   000020 R   |   5 loop_don   00173F R   |   5 lshift     001E83 R
  5 lt         0014A1 R   |   5 lt_tst     000D5E R   |   5 modulo     000F5C R
  5 move       0003C2 GR  |   5 move_dow   0003E0 R   |   5 move_era   000140 R
  5 move_exi   000401 R   |   5 move_loo   0003E5 R   |   5 move_prg   000174 R
  5 move_up    0003D2 R   |   5 mul_char   00148B R   |   5 muldiv     000F61 R
  5 multiply   000E8D R   |   5 mulu24_8   000A60 R   |   5 nbr_tst    000C19 R
  5 ne         0014A6 R   |   5 neg_acc2   000A9A R   |   5 new        00198A R
  5 next       0016FD R   |   5 next_lin   000929 R   |   5 next_tok   00096D R
  5 no_match   000FCF R   |   5 other      000D87 R   |   3 pad        0016E0 R
  5 pad_ref    0022DF R   |   5 parse_bi   000B5C R   |   5 parse_in   000B12 R
  5 parse_ke   000B99 R   |   5 parse_qu   000ABD R   |   5 pause      001DC5 R
  5 pause02    001DCF R   |   5 peek       001658 R   |   5 pin_mode   001EC1 R
  5 plus_tst   000CFE R   |   5 poke       001649 R   |   5 power_ad   001863 R
  5 prcnt_ts   000D1F R   |   5 print      0014C9 R   |   5 print_ex   00152E R
  5 print_in   0009C2 R   |   5 print_ty   00153A R   |   5 printxy    000E2E R
  5 program_   000154 R   |   5 program_   000174 R   |   5 prt_basi   0014A9 R
  5 prt_loop   0014CD R   |   5 prt_tok    0002EB R   |   5 prti24     0009D2 R
  1 ptr16      000017 R   |   1 ptr8       000018 R   |   5 putc       0002C0 GR
    puts       ****** GX  |   5 qkey       001CFF GR  |   5 qmark_ts   000CAB R
  5 random     001F32 R   |   5 read       0021CE R   |   5 read01     0021D0 R
    readln     ****** GX  |   5 refresh_   00205E R   |   5 rel_exit   0011A8 R
  5 relation   001150 R   |   5 relop_st   00148E R   |   5 remark     0015C6 R
  5 reset_co   0014CB R   |   5 rest_con   00154A R   |   5 restore    002183 R
  5 return     001798 R   |   5 right_al   0012F0 R   |   5 row_alig   00199F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 row_eras   000119 R   |   5 row_eras   000140 R   |   5 row_loop   00033C R
  5 rparnt_t   000C69 R   |   5 rshift     001E9C R   |   5 rt_msg     00084A R
  5 run        0017B6 R   |   5 run_it     0017E8 R   |   1 rx_head    00002D R
  1 rx_queue   000025 R   |   1 rx_tail    00002E R   |   5 save       001A7B R
  5 save_con   00153A R   |   5 search_d   000FAF R   |   5 search_e   000FF9 R
  5 search_f   001A2E R   |   5 search_l   000404 GR  |   5 search_l   00040C R
  5 search_n   000FB3 R   |   1 seedx      000012 R   |   1 seedy      000014 R
  5 seek_fdr   0019C8 R   |   5 select_p   001F02 R   |   5 set_time   001FFF R
  5 sharp_ts   000C8A R   |   5 show       0011AB R   |   5 show_row   00032A R
  5 single_c   001484 R   |   5 size       0011F6 R   |   5 skip       000E1B R
  5 slash_ts   000D14 R   |   5 sleep      001DBA R   |   5 software   000592 R
    spaces     ****** GX  |   5 spi_clea   002273 R   |   5 spi_disa   00225B R
  5 spi_enab   002228 R   |   5 spi_rcv_   002295 R   |   5 spi_read   0022C0 R
  5 spi_sele   0022C8 R   |   5 spi_send   00227F R   |   5 spi_writ   0022A0 R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000D09 R
  5 step       0016D6 R   |   5 stop       00193E R   |   5 store_lo   0016EA R
  5 str_matc   000FDC R   |   5 str_tst    000C09 R   |   5 strcmp     0003A3 R
  5 strcpy     0003B4 R   |   5 strlen     000396 GR  |   5 syntax_e   00087B R
  1 tab_widt   000024 R   |   5 tb_error   00087D R   |   5 term       0010B8 R
  5 term01     0010C1 R   |   5 term_exi   001104 R   |   3 tib        001690 GR
  5 tick_tst   000CC3 R   |   1 ticks      00000E R   |   5 timeout    00200E R
  1 timer      000010 R   |   5 timer2_i   0000CB R   |   5 timer4_i   0000D8 R
  5 tk_id      00086B R   |   5 to         0016A6 R   |   5 to_eepro   000197 R
  5 to_flash   0001AB R   |   5 to_upper   000DA5 GR  |   5 token_ch   000D9E R
  5 token_ex   000DA2 R   |   5 token_ms   000322 R   |   5 tone       00181F R
  5 try_next   0021BE R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_in   00027D R   |   5 uart1_se   00028D R   |   5 ubound     001200 R
  5 udiv32_1   000EB0 R   |   5 uflash     001D36 R   |   5 umstar     000E53 R
  5 unlock_e   0000ED R   |   5 unlock_f   000103 R   |   5 until      0020BC R
  5 user_int   000078 R   |   5 user_spa   002700 R   |   5 usr        001D3C R
  5 var_name   001343 R   |   1 vars       00002F R   |   5 wait       0015CC R
  5 warm_ini   00067C R   |   5 warm_sta   000902 R   |   5 words      001F99 R
  5 words_co   001FE9 R   |   5 write      001C8E R   |   5 write_bl   00025A R
  5 write_by   0001E5 R   |   5 write_ee   000221 R   |   5 write_ex   000255 R
  5 write_fl   00020B R   |   5 write_ro   000188 R   |   5 zero_pad   001994 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     63   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   270E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

