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
      0080AD CD 87 10         [ 4]  187 	call cancel_autorun 
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
      0080F7 CD 93 ED         [ 4]  249 	call prt_basic_line
      0080FA                        250 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  251     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  252     ldw sp,x
      0080FE 9A               [ 1]  253 	rim 
      0080FF CC 89 78         [ 2]  254 	jp warm_start
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
      0082DF CD 9A 2C         [ 4]  589 	call incr_farptr
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
      008380 CD 8A 80         [ 4]  749 	call print_int 
      008383 A6 20            [ 1]  750 	ld a,#SPACE
      008385 CD 83 20         [ 4]  751 	call putc 
      008388 1E 03            [ 2]  752 	ldw x,(XREG,sp)
      00838A CD 8A 80         [ 4]  753 	call print_int 
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
      0083B0 CD 8A 80         [ 4]  785 	call print_int 
      0083B3 A6 20            [ 1]  786 	ld a,#SPACE  
      0083B5 CD 83 20         [ 4]  787 	call putc
      0083B8                        788 row_loop:
      0083B8 1E 02            [ 2]  789 	ldw x,(ADR,sp)
      0083BA F6               [ 1]  790 	ld a,(x)
      0083BB 5F               [ 1]  791 	clrw x 
      0083BC 97               [ 1]  792 	ld xl,a 
      0083BD CD 8A 80         [ 4]  793 	call print_int 
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



      008582 CD 8D 66         [ 4] 1152 	call get_token
      008585 A1 84            [ 1] 1153 	cp a,#TK_INTGR
      008587 26 11            [ 1] 1154 	jrne 2$
      008589 A3 00 01         [ 2] 1155 	cpw x,#1 
      00858C 2A 05            [ 1] 1156 	jrpl 1$
      00858E A6 0A            [ 1] 1157 	ld a,#ERR_BAD_VALUE
      008590 CC 88 F3         [ 2] 1158 	jp tb_error
      008593 CF 16 E0         [ 2] 1159 1$:	ldw pad,x 
      008596 90 AE 16 E3      [ 2] 1160 	ldw y,#pad+3 
      00859A 90 A3 17 60      [ 2] 1161 2$:	cpw y,#stack_full 
      00859E 25 05            [ 1] 1162 	jrult 3$
      0085A0 A6 0F            [ 1] 1163 	ld a,#ERR_BUF_FULL 
      0085A2 CC 88 F3         [ 2] 1164 	jp tb_error 
      0085A5                       1165 3$:	
      0085A5 93               [ 1] 1166 	ldw x,y 
      0085A6 CD 8D 66         [ 4] 1167 	call get_token 
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
      0086AC A6 0A            [ 1] 1295 	ld a,#10 
      0086AE CD 8A 38         [ 4] 1296 	call prti24 
      0086B1 A6 2E            [ 1] 1297 	ld a,#'.
      0086B3 CD 83 20         [ 4] 1298 	call putc 
      0086B6 A6 00            [ 1] 1299 	ld a,#MINOR 
      0086B8 C7 00 0E         [ 1] 1300 	ld acc8,a 
      0086BB 5F               [ 1] 1301 	clrw x 
      0086BC CF 00 0C         [ 2] 1302 	ldw acc24,x 
      0086BF A6 0A            [ 1] 1303 	ld a,#10 
      0086C1 CD 8A 38         [ 4] 1304 	call prti24 
      0086C4 A6 0D            [ 1] 1305 	ld a,#CR 
      0086C6 CD 83 20         [ 4] 1306 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086C9 CD 9A 3A         [ 4] 1307 	call seek_fdrive 
      0086CC 9A               [ 1] 1308 	rim 
      0086CD 72 5C 00 16      [ 1] 1309 	inc seedy+1 
      0086D1 72 5C 00 14      [ 1] 1310 	inc seedx+1 
      0086D5 CD 87 5D         [ 4] 1311 	call clear_basic
      0086D8 CD 92 D3         [ 4] 1312 	call ubound 
                                   1313 ;	jra 2$	
                                   1314 ; 150 msec beep 
      0086DB AE 00 96         [ 2] 1315 	ldw x,#150 
      0086DE 90 AE 03 E6      [ 2] 1316 	ldw y,#998 
      0086E2 CD 98 99         [ 4] 1317 	call beep  
      0086E5 72 1B 50 0A      [ 1] 1318 2$:	bres PC_ODR,#LED2_BIT	
      0086E9 CD 86 F2         [ 4] 1319 	call warm_init
      0086EC CD 87 1F         [ 4] 1320 	call load_autorun
      0086EF CC 89 7B         [ 2] 1321     jp cmd_line  
                                   1322 
      0086F2                       1323 warm_init:
      0086F2 72 5F 00 24      [ 1] 1324 	clr flags 
      0086F6 72 5F 00 21      [ 1] 1325 	clr loop_depth 
      0086FA 35 04 00 25      [ 1] 1326 	mov tab_width,#TAB_WIDTH 
      0086FE 35 0A 00 0B      [ 1] 1327 	mov base,#10 
      008702 AE 00 00         [ 2] 1328 	ldw x,#0 
      008705 CF 00 05         [ 2] 1329 	ldw basicptr,x 
      008708 CF 00 01         [ 2] 1330 	ldw in.w,x 
      00870B 72 5F 00 04      [ 1] 1331 	clr count
      00870F 81               [ 4] 1332 	ret 
                                   1333 
                                   1334 ;--------------------------
                                   1335 ; called by tb_error when
                                   1336 ; flag FAUTORUN is set.
                                   1337 ; There is a bug in autorun 
                                   1338 ; program so cancel it.
                                   1339 ;---------------------------
      008710                       1340 cancel_autorun:
      008710 AE 40 00         [ 2] 1341 	ldw x,#AUTORUN_NAME 
      008713 CF 00 18         [ 2] 1342 	ldw farptr+1,x 
      008716 4F               [ 1] 1343 	clr a
      008717 5F               [ 1] 1344 	clrw x  
      008718 C7 00 17         [ 1] 1345 	ld farptr,a 
      00871B CD 82 4D         [ 4] 1346 	call write_byte 
      00871E 81               [ 4] 1347 	ret 
                                   1348 
                                   1349 
                                   1350 ;--------------------------
                                   1351 ; if autorun file defined 
                                   1352 ; in eeprom address AUTORUN_NAME 
                                   1353 ; load and run it.
                                   1354 ;-------------------------
      00871F                       1355 load_autorun:
      00871F 90 AE 40 00      [ 2] 1356 	ldw y,#AUTORUN_NAME
      008723 90 F6            [ 1] 1357 	ld a,(y)
      008725 27 20            [ 1] 1358 	jreq 9$
      008727 CD 9A A0         [ 4] 1359 	call search_file
      00872A 25 05            [ 1] 1360 	jrc 2$ 
                                   1361 ; if file doesn't exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00872C CD 87 10         [ 4] 1362 	call cancel_autorun
      00872F 20 16            [ 2] 1363 	jra 9$ 
      008731 CD 9B B6         [ 4] 1364 2$:	call load_file
      008734 AE 40 00         [ 2] 1365 	ldw x,#AUTORUN_NAME 
      008737 CD 83 33         [ 4] 1366 	call puts
      00873A AE 87 48         [ 2] 1367 	ldw x,#autorun_msg 
      00873D CD 83 33         [ 4] 1368 	call puts 
      008740 72 1C 00 24      [ 1] 1369 	bset flags,#FAUTORUN 
      008744 CC 98 5E         [ 2] 1370 	jp run_it    
      008747 81               [ 4] 1371 9$: ret 	
                                   1372 
      008748 20 6C 6F 61 64 65 64  1373 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1374 ;---------------------------
                                   1375 ; reset BASIC text variables 
                                   1376 ; and clear variables 
                                   1377 ;---------------------------
      00875D                       1378 clear_basic:
      00875D 72 5F 00 04      [ 1] 1379 	clr count
      008761 72 5F 00 02      [ 1] 1380 	clr in  
      008765 AE 00 5B         [ 2] 1381 	ldw x,#free_ram 
      008768 CF 00 1D         [ 2] 1382 	ldw txtbgn,x 
      00876B CF 00 1F         [ 2] 1383 	ldw txtend,x 
      00876E CD 85 DD         [ 4] 1384 	call clear_vars 
      008771 81               [ 4] 1385 	ret 
                                   1386 
                                   1387 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1388 ;;   Tiny BASIC error messages     ;;
                                   1389 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008772                       1390 err_msg:
      008772 00 00 87 92 87 9F 87  1391 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             AD 87 C6 87 D5
      00877E 87 EB 88 01 88 1B 88  1392 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             2C 88 3D
      008788 88 49 88 7C 88 8C 88  1393 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             A0 88 B3
                                   1394 
      008792 4D 65 6D 6F 72 79 20  1395 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      00879F 73 79 6E 74 61 78 20  1396 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      0087AD 6D 61 74 68 20 6F 70  1397 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0087C6 64 69 76 69 73 69 6F  1398 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0087D5 69 6E 76 61 6C 69 64  1399 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087EB 72 75 6E 20 74 69 6D  1400 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  75-Bits]



             75 73 61 67 65 2E 0A
             00
      0087FA 73 61 67 65 2E 0A 00  1401 err_cmd_only: .asciz "command line only usage.\n"
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75
      008814 73 61 67 65 2E 0A 00  1402 err_duplicate: .asciz "duplicate name.\n"
             64 75 70 6C 69 63 61
             74 65 20
      008825 6E 61 6D 65 2E 0A 00  1403 err_not_file: .asciz "File not found.\n"
             46 69 6C 65 20 6E 6F
             74 20 66
      008836 6F 75 6E 64 2E 0A 00  1404 err_bad_value: .asciz "bad value.\n"
             62 61 64 20 76
      008842 61 6C 75 65 2E 0A 00  1405 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74
      008875 68 65 72 65 2E 0A 00  1406 err_no_data: .asciz "No data found.\n"
             4E 6F 20 64 61 74 61
             20 66
      008885 6F 75 6E 64 2E 0A 00  1407 err_no_prog: .asciz "No program in RAM!\n"
             4E 6F 20 70 72 6F 67
             72 61 6D 20 69 6E
      008899 20 52 41 4D 21 0A 00  1408 err_no_fspace: .asciz "File system full.\n" 
             46 69 6C 65 20 73 79
             73 74 65 6D 20
      0088AC 66 75 6C 6C 2E 0A 00  1409 err_buf_full: .asciz "Buffer full\n"
             42 75 66 66 65 72
                                   1410 
      0088B9 20 66 75 6C 6C 0A 00  1411 rt_msg: .asciz "run time error, "
             72 75 6E 20 74 69 6D
             65 20 65
      0088CA 72 72 6F 72 2C 20 00  1412 comp_msg: .asciz "compile error, "
             63 6F 6D 70 69 6C 65
             20 65
      0088DA 72 72 6F 72 2C 20 00  1413 tk_id: .asciz "last token id: "
             6C 61 73 74 20 74 6F
             6B 65
                                   1414 
      000871                       1415 syntax_error:
      0088EA 6E 20            [ 1] 1416 	ld a,#ERR_SYNTAX 
                                   1417 
      000873                       1418 tb_error:
      0088EC 69 64 3A 20 00   [ 2] 1419 	btjt flags,#FCOMP,1$
      0088F1 88               [ 1] 1420 	push a 
      0088F1 A6 02 40         [ 2] 1421 	ldw x, #rt_msg 
      0088F3 CD 02 B3         [ 4] 1422 	call puts 
      0088F3 72               [ 1] 1423 	pop a 
      0088F4 0A 00 24         [ 2] 1424 	ldw x, #err_msg 
      0088F7 47 88 AE 88      [ 1] 1425 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088FB C0               [ 1] 1426 	sll a
      0088FC CD 83 33 84      [ 1] 1427 	rlc acc16  
      008900 AE 87 72         [ 1] 1428 	ld acc8, a 
      008903 72 5F 00 0D      [ 2] 1429 	addw x,acc16 
      008907 48               [ 2] 1430 	ldw x,(x)
      008908 72 59 00         [ 4] 1431 	call puts
      00890B 0D C7 00         [ 2] 1432 	ldw x,basicptr
      00890E 0E 72 BB         [ 1] 1433 	ld a,in 
      008911 00 0D FE         [ 4] 1434 	call prt_basic_line
      008914 CD 83 33         [ 2] 1435 	ldw x,#tk_id 
      008917 CE 00 05         [ 4] 1436 	call puts 
      00891A C6 00 02         [ 1] 1437 	ld a,in.saved 
      00891D CD               [ 1] 1438 	clrw x 
      00891E 93               [ 1] 1439 	ld xl,a 
      00891F ED AE 88 E1      [ 2] 1440 	addw x,basicptr 
      008923 CD               [ 1] 1441 	ld a,(x)
      008924 83               [ 1] 1442 	clrw x 
      008925 33               [ 1] 1443 	ld xl,a 
      008926 C6 00 03         [ 4] 1444 	call print_int
      008929 5F 97 72 BB 00   [ 2] 1445 	btjf flags,#FAUTORUN ,6$
      00892E 05 F6 5F         [ 4] 1446 	call cancel_autorun  
      008931 97 CD            [ 2] 1447 	jra 6$
      0008BF                       1448 1$:	
      008933 8A               [ 1] 1449 	push a 
      008934 80 72 0D         [ 2] 1450 	ldw x,#comp_msg
      008937 00 24 3A         [ 4] 1451 	call puts 
      00893A CD               [ 1] 1452 	pop a 
      00893B 87 10 20         [ 2] 1453 	ldw x, #err_msg 
      00893E 35 5F 00 0C      [ 1] 1454 	clr acc16 
      00893F 48               [ 1] 1455 	sll a
      00893F 88 AE 88 D1      [ 1] 1456 	rlc acc16  
      008943 CD 83 33         [ 1] 1457 	ld acc8, a 
      008946 84 AE 87 72      [ 2] 1458 	addw x,acc16 
      00894A 72               [ 2] 1459 	ldw x,(x)
      00894B 5F 00 0D         [ 4] 1460 	call puts
      00894E 48 72 59         [ 2] 1461 	ldw x,#tib
      008951 00 0D C7         [ 4] 1462 	call puts 
      008954 00 0E            [ 1] 1463 	ld a,#CR 
      008956 72 BB 00         [ 4] 1464 	call putc
      008959 0D FE CD         [ 2] 1465 	ldw x,in.w
      00895C 83 33 AE         [ 4] 1466 	call spaces
      00895F 16 90            [ 1] 1467 	ld a,#'^
      008961 CD 83 33         [ 4] 1468 	call putc 
      008964 A6 0D CD         [ 2] 1469 6$: ldw x,#STACK_EMPTY 
      008967 83               [ 1] 1470     ldw sp,x
      0008F8                       1471 warm_start:
      008968 20 CE 00         [ 4] 1472 	call warm_init
                                   1473 ;----------------------------
                                   1474 ;   BASIC interpreter
                                   1475 ;----------------------------
      0008FB                       1476 cmd_line: ; user interface 
      00896B 01 CD            [ 1] 1477 	ld a,#CR 
      00896D 83 5B A6         [ 4] 1478 	call putc 
      008970 5E CD            [ 1] 1479 	ld a,#'> 
      008972 83 20 AE         [ 4] 1480 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008975 17 FF 94         [ 4] 1481 	call readln
      008978 72 5D 00 03      [ 1] 1482 	tnz count 
      008978 CD 86            [ 1] 1483 	jreq cmd_line
      00897A F2 04 EA         [ 4] 1484 	call compile
                                   1485 ; if text begin with a line number
                                   1486 ; the compiler set count to zero    
                                   1487 ; so code is not interpreted
      00897B 72 5D 00 03      [ 1] 1488 	tnz count 
      00897B A6 0D            [ 1] 1489 	jreq cmd_line
                                   1490 
                                   1491 ; if direct command 
                                   1492 ; it's ready to interpret 
                                   1493 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1494 ;; This is the interpreter loop
                                   1495 ;; for each BASIC code line. 
                                   1496 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000917                       1497 interpreter: 
      00897D CD 83 20         [ 1] 1498 	ld a,in 
      008980 A6 3E CD         [ 1] 1499 	cp a,count 
      008983 83 20            [ 1] 1500 	jrmi interp_loop
      00091F                       1501 next_line:
      008985 CD 8B B1 72 5D   [ 2] 1502 	btjf flags, #FRUN, cmd_line
      00898A 00 04 27         [ 2] 1503 	ldw x,basicptr
      00898D ED CD 85 6A      [ 2] 1504 	addw x,in.w 
      008991 72 5D 00         [ 2] 1505 	cpw x,txtend 
      008994 04 27            [ 1] 1506 	jrpl warm_start
      008996 E4 00 04         [ 2] 1507 	ldw basicptr,x ; start of next line  
      008997 E6 02            [ 1] 1508 	ld a,(2,x)
      008997 C6 00 02         [ 1] 1509 	ld count,a 
      00899A C1 00 04 2B      [ 1] 1510 	mov in,#3 ; skip first 3 bytes of line 
      00093C                       1511 interp_loop: 
      00899E 1D 09 63         [ 4] 1512 	call next_token
      00899F A1 00            [ 1] 1513 	cp a,#TK_NONE 
      00899F 72 01            [ 1] 1514 	jreq next_line 
      0089A1 00 24            [ 1] 1515 	cp a,#TK_CMD
      0089A3 D7 CE            [ 1] 1516 	jrne 1$
      0089A5 00               [ 4] 1517 	call (x) 
      0089A6 05 72            [ 2] 1518 	jra interp_loop 
      00094A                       1519 1$:	 
      0089A8 BB 00            [ 1] 1520 	cp a,#TK_VAR
      0089AA 01 C3            [ 1] 1521 	jrne 2$
      0089AC 00 1F 2A         [ 4] 1522 	call let_var  
      0089AF C8 CF            [ 2] 1523 	jra interp_loop 
      000953                       1524 2$:	
      0089B1 00 05            [ 1] 1525 	cp a,#TK_ARRAY 
      0089B3 E6 02            [ 1] 1526 	jrne 3$
      0089B5 C7 00 04         [ 4] 1527 	call let_array 
      0089B8 35 03            [ 2] 1528 	jra interp_loop
      00095C                       1529 3$:	
      0089BA 00 02            [ 1] 1530 	cp a,#TK_COLON 
      0089BC 27 DC            [ 1] 1531 	jreq interp_loop 
      0089BC CD 89 E3         [ 2] 1532 	jp syntax_error 
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
      000963                       1544 next_token:
      0089BF A1               [ 1] 1545 	clrw x 
      0089C0 00 27 DC         [ 1] 1546 	ld a,in 
      0089C3 A1 80 26         [ 1] 1547 	sub a,count ; don't replace sub by cp!  
      0089C6 03 FD            [ 1] 1548 	jrmi 0$
      0089C8 20               [ 4] 1549 	ret  ; end of BASIC line 
      00096D                       1550 0$: 
      0089C9 F2 00 01 00 02   [ 1] 1551 	mov in.saved,in 
      0089CA 90 CE 00 04      [ 2] 1552 	ldw y,basicptr 
      0089CA A1 85 26         [ 4] 1553 	ld a,([in.w],y)
      0089CD 05 CD 93 06      [ 1] 1554 	inc in  
      0089D1 20               [ 1] 1555 	tnz a 
      0089D2 E9 2B            [ 1] 1556 	jrmi 6$
      0089D3 A1 06            [ 1] 1557 	cp a,#TK_ARRAY
      0089D3 A1 06            [ 1] 1558 	jrpl 9$  ; no attribute for these
      0089D5 26 05            [ 1] 1559 	cp a,#TK_COLON
      0089D7 CD 93            [ 1] 1560 	jreq 9$  
      000988                       1561 1$: ; 
      0089D9 03 20            [ 1] 1562 	cp a,#TK_CHAR
      0089DB E0 0B            [ 1] 1563 	jrne 2$
      0089DC 91 D6 00         [ 4] 1564 	ld a,([in.w],y)
      0089DC A1 01 27 DC      [ 1] 1565 	inc in 
      0089E0 CC               [ 1] 1566 	exg a,xl  
      0089E1 88 F1            [ 1] 1567 	ld a,#TK_CHAR
      0089E3 81               [ 4] 1568 	ret
      0089E3 5F C6            [ 1] 1569 2$:	cp a,#TK_QSTR 
      0089E5 00 02            [ 1] 1570 	jrne 9$
      0089E7 C0               [ 1] 1571 	ldw x,y 
      0089E8 00 04 2B 01      [ 2] 1572 	addw x,in.w ; pointer to string 
                                   1573 ; move pointer after string 
      0089EC 81 6D 00         [ 4] 1574 3$:	tnz ([in.w],y)
      0089ED 27 0E            [ 1] 1575 	jreq 8$
      0089ED 55 00 02 00      [ 1] 1576 	inc in 
      0089F1 03 90            [ 2] 1577 	jra 3$
      0009AB                       1578 6$: 
      0089F3 CE 00 05         [ 5] 1579 	ldw y,([in.w],y)
      0089F6 91               [ 1] 1580 	exgw x,y 
      0089F7 D6 01 72 5C      [ 1] 1581 	inc in
      0089FB 00 02 4D 2B      [ 1] 1582 8$:	inc in 
      0009B7                       1583 9$: 
      0089FF 2B               [ 4] 1584 	ret	
                                   1585 
                                   1586 
                                   1587 
                                   1588 
                                   1589 ;------------------------------------
                                   1590 ; print integer in acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1591 ; input:
                                   1592 ;	acc24 		integer to print 
                                   1593 ;	A 			numerical base for conversion 
                                   1594 ;               if bit 7 is set add a space at print end.
                                   1595 ;   XL 			field width, 0 -> no fill.
                                   1596 ;  output:
                                   1597 ;    none 
                                   1598 ;------------------------------------
                           000001  1599 	WIDTH = 1
                           000002  1600 	BASE = 2
                           000003  1601 	ADD_SPACE=3 ; add a space after number 
                           000003  1602 	VSIZE = 3
      0009B8                       1603 prti24:
      0009B8                       1604 	_vars VSIZE 
      008A00 A1 06            [ 2]    1     sub sp,#VSIZE 
      008A02 2A 33            [ 1] 1605 	clr (ADD_SPACE,sp)
      008A04 A1 01            [ 1] 1606 	bcp a,#0x80 
      008A06 27 2F            [ 1] 1607 	jreq 0$ 
      008A08 03 03            [ 1] 1608 	cpl (ADD_SPACE,sp)
      008A08 A1 03            [ 1] 1609 0$:	and a,#31 
      008A0A 26 0B            [ 1] 1610 	ld (BASE,sp),a
      008A0C 91               [ 1] 1611 	ld a,xl
      008A0D D6 01            [ 1] 1612 	ld (WIDTH,sp),a 
      008A0F 72 5C            [ 1] 1613 	ld a, (BASE,sp)  
      008A11 00 02 41         [ 4] 1614     call itoa  ; conversion entier en  .asciz
      008A14 A6 03            [ 1] 1615 1$: ld a,(WIDTH,sp)
      008A16 81 A1            [ 1] 1616 	jreq 4$
      008A18 02 26 1C         [ 1] 1617 	ld acc8,a 
      008A1B 93               [ 2] 1618 	pushw x 
      008A1C 72 BB 00         [ 4] 1619 	call strlen 
      008A1F 01               [ 1] 1620 	ld a,xl 
      008A20 91               [ 2] 1621 	popw x 
      008A21 6D 01 27         [ 3] 1622 	exg a,acc8 
      008A24 0E 72 5C         [ 1] 1623 	sub a,acc8 
      008A27 00 02            [ 1] 1624 	jrmi 4$
      008A29 20 F5            [ 1] 1625 	ld (WIDTH,sp),a 
      008A2B A6 20            [ 1] 1626 	ld  a,#SPACE
      008A2B 91 DE            [ 1] 1627 3$: tnz (WIDTH,sp)
      008A2D 01 51            [ 1] 1628 	jreq 4$
      008A2F 72               [ 2] 1629 	decw x 
      008A30 5C               [ 1] 1630 	ld (x),a 
      008A31 00 02            [ 1] 1631 	dec (WIDTH,sp) 
      008A33 72 5C            [ 2] 1632 	jra 3$
      0009F1                       1633 4$: 
      008A35 00 02 B3         [ 4] 1634 	call puts 
      008A37 0D 03            [ 1] 1635 	tnz (ADD_SPACE,sp)
      008A37 81 05            [ 1] 1636 	jreq 5$
      008A38 A6 20            [ 1] 1637     ld a,#SPACE 
      008A38 52 03 0F         [ 4] 1638 	call putc 
      0009FD                       1639 5$: _drop VSIZE 
      008A3B 03 A5            [ 2]    1     addw sp,#VSIZE 
      008A3D 80               [ 4] 1640     ret	
                                   1641 
                                   1642 ;-----------------------------------
                                   1643 ; print a 16 bit integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1644 ; using variable 'base' as conversion
                                   1645 ; format.
                                   1646 ; input:
                                   1647 ;   X       integer to print 
                                   1648 ;   base    conversion base 
                                   1649 ; output:
                                   1650 ;   none 
                                   1651 ;-----------------------------------
                           000001  1652 	SIGN=1
                           000002  1653 	STRING=2
                                   1654 ;; 9 char on stack for string buffer	
                           00000A  1655 	STREND=2+8 
                           00000A  1656 	VSIZE=10
      000A00                       1657 print_int: 
      000A00                       1658 	_vars VSIZE 
      008A3E 27 02            [ 2]    1     sub sp,#VSIZE 
      008A40 03 03            [ 1] 1659 	clr (SIGN,sp)
      008A42 A4 1F            [ 1] 1660 	ldw y,sp 
      008A44 6B 02 9F 6B      [ 2] 1661 	addw y,#STREND  
      008A48 01 7B            [ 1] 1662 	clr (y)
      008A4A 02 CD 8A         [ 1] 1663 	ld a,base  
      008A4D E5 7B            [ 1] 1664 	cp a,#10 
      008A4F 01 27            [ 1] 1665 	jrne 1$ 
      008A51 1F               [ 2] 1666 	tnzw x 
      008A52 C7 00            [ 1] 1667 	jrpl 1$ 
      008A54 0E 89            [ 1] 1668 	cpl (SIGN,sp)
      008A56 CD               [ 2] 1669 	negw x 	 
      000A19                       1670 1$:	
      008A57 84 12 9F         [ 1] 1671 	ld a,base 
      008A5A 85               [ 2] 1672 	div x,a 
      008A5B 31 00            [ 1] 1673 	add a,#'0 
      008A5D 0E C0            [ 1] 1674 	cp a,#'9+1 
      008A5F 00 0E            [ 1] 1675 	jrmi 2$ 
      008A61 2B 0E            [ 1] 1676 	add a,#7 
      008A63 6B 01            [ 2] 1677 2$: decw y 
      008A65 A6 20            [ 1] 1678 	ld (y),a 
      008A67 0D               [ 2] 1679 	tnzw x 
      008A68 01 27            [ 1] 1680 	jrne 1$ 
      008A6A 06 5A            [ 1] 1681 	ld a,#16 
      008A6C F7 0A 01         [ 1] 1682 	cp a,base 
      008A6F 20 F6            [ 1] 1683 	jrne 3$
      008A71 A6 24            [ 1] 1684 	ld a,#'$
      008A71 CD 83            [ 2] 1685 	decw y  
      008A73 33 0D            [ 1] 1686 	ld (y),a
      008A75 03 27            [ 2] 1687 	jra 9$ 
      008A77 05 A6            [ 1] 1688 3$: tnz (SIGN,sp)
      008A79 20 CD            [ 1] 1689 	jreq 9$ 
      008A7B 83 20            [ 1] 1690 	ld a,#'-
      008A7D 5B 03            [ 2] 1691 	decw y  
      008A7F 81 F7            [ 1] 1692 	ld (y),a
      008A80                       1693 9$:	
      008A80 52               [ 1] 1694 	ldw x,sp 
      008A81 0A 0F 01         [ 2] 1695 	addw x,#STREND  
      008A84 90 96            [ 2] 1696 	pushw y
      008A86 72 A9 00         [ 2] 1697 	subw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      000A4E                       1698 	_drop 2 
      008A89 0A 90            [ 2]    1     addw sp,#2 
      000A50                       1699 10$:
      008A8B 7F               [ 1] 1700 	ld a,xl 
      008A8C C6 00 0B         [ 1] 1701 	cp a,tab_width
      008A8F A1 0A            [ 1] 1702 	jruge 12$
      008A91 26 06            [ 1] 1703 	ld a,#SPACE 
      008A93 5D 2A 03         [ 4] 1704 	call putc 
      008A96 03               [ 2] 1705 	incw x 
      008A97 01 50            [ 2] 1706 	jra 10$ 
      008A99                       1707 12$:
      008A99 C6               [ 1] 1708     ldw x,y 
      008A9A 00 0B 62         [ 4] 1709 	call puts  
      000A62                       1710 	_drop VSIZE 
      008A9D AB 30            [ 2]    1     addw sp,#VSIZE 
      008A9F A1               [ 4] 1711 	ret 
                                   1712 
                                   1713 ;------------------------------------
                                   1714 ; convert integer in acc24 to string
                                   1715 ; input:
                                   1716 ;   A	  	base
                                   1717 ;	acc24	integer to convert
                                   1718 ; output:
                                   1719 ;   X  		pointer to string
                                   1720 ;------------------------------------
                           000001  1721 	SIGN=1  ; integer sign 
                           000002  1722 	BASE=2  ; numeric base 
                           000002  1723 	VSIZE=2  ;locals size
      000A65                       1724 itoa:
      008AA0 3A 2B            [ 2] 1725 	sub sp,#VSIZE
      008AA2 02 AB            [ 1] 1726 	ld (BASE,sp), a  ; base
      008AA4 07 90            [ 1] 1727 	clr (SIGN,sp)    ; sign
      008AA6 5A 90            [ 1] 1728 	cp a,#10
      008AA8 F7 5D            [ 1] 1729 	jrne 1$
                                   1730 	; base 10 string display with negative sign if bit 23==1
      008AAA 26 ED A6 10 C1   [ 2] 1731 	btjf acc24,#7,1$
      008AAF 00 0B            [ 1] 1732 	cpl (SIGN,sp)
      008AB1 26 08 A6         [ 4] 1733 	call neg_acc24
      000A79                       1734 1$:
                                   1735 ; initialize string pointer 
      008AB4 24 90 5A         [ 2] 1736 	ldw x,#pad+PAD_SIZE-1
      008AB7 90               [ 1] 1737 	clr (x)
      000A7D                       1738 itoa_loop:
      008AB8 F7 20            [ 1] 1739     ld a,(BASE,sp)
      008ABA 0A 0D 01         [ 4] 1740     call divu24_8 ; acc24/A 
      008ABD 27 06            [ 1] 1741     add a,#'0  ; remainder of division
      008ABF A6 2D            [ 1] 1742     cp a,#'9+1
      008AC1 90 5A            [ 1] 1743     jrmi 2$
      008AC3 90 F7            [ 1] 1744     add a,#7 
      008AC5 5A               [ 2] 1745 2$: decw x
      008AC5 96               [ 1] 1746     ld (x),a
                                   1747 	; if acc24==0 conversion done
      008AC6 1C 00 0A         [ 1] 1748 	ld a,acc24
      008AC9 90 89 72         [ 1] 1749 	or a,acc16
      008ACC F0 01 5B         [ 1] 1750 	or a,acc8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008ACF 02 E6            [ 1] 1751     jrne itoa_loop
                                   1752 	;conversion done, next add '$' or '-' as required
      008AD0 7B 02            [ 1] 1753 	ld a,(BASE,sp)
      008AD0 9F C1            [ 1] 1754 	cp a,#16
      008AD2 00 25            [ 1] 1755 	jreq 8$
      008AD4 24 08            [ 1] 1756 	ld a,(SIGN,sp)
      008AD6 A6 20            [ 1] 1757     jreq 10$
      008AD8 CD 83            [ 1] 1758     ld a,#'-
      008ADA 20 5C            [ 2] 1759 	jra 9$ 
      008ADC 20 F2            [ 1] 1760 8$: ld a,#'$ 
      008ADE 5A               [ 2] 1761 9$: decw x
      008ADE 93               [ 1] 1762     ld (x),a
      000AA9                       1763 10$:
      008ADF CD 83            [ 2] 1764 	addw sp,#VSIZE
      008AE1 33               [ 4] 1765 	ret
                                   1766 
                                   1767 ;-------------------------------------
                                   1768 ; divide uint24_t by uint8_t
                                   1769 ; used to convert uint24_t to string
                                   1770 ; input:
                                   1771 ;	acc24	dividend
                                   1772 ;   A 		divisor
                                   1773 ; output:
                                   1774 ;   acc24	quotient
                                   1775 ;   A		remainder
                                   1776 ;------------------------------------- 
                                   1777 ; offset  on sp of arguments and locals
                           000001  1778 	U8   = 1   ; divisor on stack
                           000001  1779 	VSIZE =1
      000AAC                       1780 divu24_8:
      008AE2 5B               [ 2] 1781 	pushw x ; save x
      008AE3 0A               [ 1] 1782 	push a 
                                   1783 	; ld dividend UU:MM bytes in X
      008AE4 81 00 0B         [ 1] 1784 	ld a, acc24
      008AE5 95               [ 1] 1785 	ld xh,a
      008AE5 52 02 6B         [ 1] 1786 	ld a,acc24+1
      008AE8 02               [ 1] 1787 	ld xl,a
      008AE9 0F 01            [ 1] 1788 	ld a,(U8,SP) ; divisor
      008AEB A1               [ 2] 1789 	div x,a ; UU:MM/U8
      008AEC 0A               [ 1] 1790 	push a  ;save remainder
      008AED 26               [ 1] 1791 	ld a,xh
      008AEE 0A 72 0F         [ 1] 1792 	ld acc24,a
      008AF1 00               [ 1] 1793 	ld a,xl
      008AF2 0C 05 03         [ 1] 1794 	ld acc24+1,a
      008AF5 01               [ 1] 1795 	pop a
      008AF6 CD               [ 1] 1796 	ld xh,a
      008AF7 8B 8E 0D         [ 1] 1797 	ld a,acc24+2
      008AF9 97               [ 1] 1798 	ld xl,a
      008AF9 AE 17            [ 1] 1799 	ld a,(U8,sp) ; divisor
      008AFB 5F               [ 2] 1800 	div x,a  ; R:LL/U8
      008AFC 7F 01            [ 1] 1801 	ld (U8,sp),a ; save remainder
      008AFD 9F               [ 1] 1802 	ld a,xl
      008AFD 7B 02 CD         [ 1] 1803 	ld acc24+2,a
      008B00 8B               [ 1] 1804 	pop a
      008B01 2C               [ 2] 1805 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B02 AB               [ 4] 1806 	ret
                                   1807 
                                   1808 ;--------------------------------------
                                   1809 ; unsigned multiply uint24_t by uint8_t
                                   1810 ; use to convert numerical string to uint24_t
                                   1811 ; input:
                                   1812 ;	acc24	uint24_t 
                                   1813 ;   A		uint8_t
                                   1814 ; output:
                                   1815 ;   acc24   A*acc24
                                   1816 ;-------------------------------------
                                   1817 ; local variables offset  on sp
                           000003  1818 	U8   = 3   ; A pushed on stack
                           000002  1819 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1820 	OVFH = 1  ; multiplication overflow high byte
                           000003  1821 	VSIZE = 3
      000AD4                       1822 mulu24_8:
      008B03 30               [ 2] 1823 	pushw x    ; save X
                                   1824 	; local variables
      008B04 A1               [ 1] 1825 	push a     ; U8
      008B05 3A               [ 1] 1826 	clrw x     ; initialize overflow to 0
      008B06 2B               [ 2] 1827 	pushw x    ; multiplication overflow
                                   1828 ; multiply low byte.
      008B07 02 AB 07         [ 1] 1829 	ld a,acc24+2
      008B0A 5A               [ 1] 1830 	ld xl,a
      008B0B F7 C6            [ 1] 1831 	ld a,(U8,sp)
      008B0D 00               [ 4] 1832 	mul x,a
      008B0E 0C               [ 1] 1833 	ld a,xl
      008B0F CA 00 0D         [ 1] 1834 	ld acc24+2,a
      008B12 CA               [ 1] 1835 	ld a, xh
      008B13 00 0E            [ 1] 1836 	ld (OVFL,sp),a
                                   1837 ; multipy middle byte
      008B15 26 E6 7B         [ 1] 1838 	ld a,acc24+1
      008B18 02               [ 1] 1839 	ld xl,a
      008B19 A1 10            [ 1] 1840 	ld a, (U8,sp)
      008B1B 27               [ 4] 1841 	mul x,a
                                   1842 ; add overflow to this partial product
      008B1C 08 7B 01         [ 2] 1843 	addw x,(OVFH,sp)
      008B1F 27               [ 1] 1844 	ld a,xl
      008B20 08 A6 2D         [ 1] 1845 	ld acc24+1,a
      008B23 20               [ 1] 1846 	clr a
      008B24 02 A6            [ 1] 1847 	adc a,#0
      008B26 24 5A            [ 1] 1848 	ld (OVFH,sp),a
      008B28 F7               [ 1] 1849 	ld a,xh
      008B29 6B 02            [ 1] 1850 	ld (OVFL,sp),a
                                   1851 ; multiply most signficant byte	
      008B29 5B 02 81         [ 1] 1852 	ld a, acc24
      008B2C 97               [ 1] 1853 	ld xl, a
      008B2C 89 88            [ 1] 1854 	ld a, (U8,sp)
      008B2E C6               [ 4] 1855 	mul x,a
      008B2F 00 0C 95         [ 2] 1856 	addw x, (OVFH,sp)
      008B32 C6               [ 1] 1857 	ld a, xl
      008B33 00 0D 97         [ 1] 1858 	ld acc24,a
      008B36 7B 01            [ 2] 1859     addw sp,#VSIZE
      008B38 62               [ 2] 1860 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B39 88               [ 4] 1861 	ret
                                   1862 
                                   1863 ;------------------------------------
                                   1864 ;  two's complement acc24
                                   1865 ;  input:
                                   1866 ;		acc24 variable
                                   1867 ;  output:
                                   1868 ;		acc24 variable
                                   1869 ;-------------------------------------
      000B0E                       1870 neg_acc24:
      008B3A 9E C7 00 0C      [ 1] 1871 	cpl acc24+2
      008B3E 9F C7 00 0D      [ 1] 1872 	cpl acc24+1
      008B42 84 95 C6 00      [ 1] 1873 	cpl acc24
      008B46 0E 97            [ 1] 1874 	ld a,#1
      008B48 7B 01 62         [ 1] 1875 	add a,acc24+2
      008B4B 6B 01 9F         [ 1] 1876 	ld acc24+2,a
      008B4E C7               [ 1] 1877 	clr a
      008B4F 00 0E 84         [ 1] 1878 	adc a,acc24+1
      008B52 85 81 0C         [ 1] 1879 	ld acc24+1,a 
      008B54 4F               [ 1] 1880 	clr a 
      008B54 89 88 5F         [ 1] 1881 	adc a,acc24 
      008B57 89 C6 00         [ 1] 1882 	ld acc24,a 
      008B5A 0E               [ 4] 1883 	ret
                                   1884 
                                   1885 
                                   1886 ;------------------------------------
                                   1887 ; read a line of text from terminal
                                   1888 ; input:
                                   1889 ;	none
                                   1890 ; local variable on stack:
                                   1891 ;	LL  line length
                                   1892 ;   RXCHAR last received character 
                                   1893 ; output:
                                   1894 ;   text in tib  buffer
                                   1895 ;   count  line length 
                                   1896 ;------------------------------------
                                   1897 	; local variables
                           000001  1898 	LL_HB=1
                           000001  1899 	RXCHAR = 1 ; last char received
                           000002  1900 	LL = 2  ; accepted line length
                           000002  1901 	VSIZE=2 
      000B31                       1902 readln:
      008B5B 97 7B            [ 1] 1903 	push #0
      008B5D 03 42            [ 1] 1904 	push #0  
      008B5F 9F C7 00 0E      [ 2] 1905  	ldw y,#tib ; input buffer
      000B39                       1906 readln_loop:
      008B63 9E 6B 02         [ 4] 1907 	call getc
      008B66 C6 00            [ 1] 1908 	ld (RXCHAR,sp),a
      008B68 0D 97            [ 1] 1909 	cp a,#CR
      008B6A 7B 03            [ 1] 1910 	jrne 1$
      008B6C 42 72 FB         [ 2] 1911 	jp readln_quit
      008B6F 01 9F            [ 1] 1912 1$:	cp a,#LF 
      008B71 C7 00            [ 1] 1913 	jreq readln_quit
      008B73 0D 4F            [ 1] 1914 	cp a,#BS
      008B75 A9 00            [ 1] 1915 	jreq del_back
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B77 6B 01            [ 1] 1916 	cp a,#CTRL_D
      008B79 9E 6B            [ 1] 1917 	jreq del_ln
      008B7B 02 C6            [ 1] 1918 	cp a,#CTRL_R 
      008B7D 00 0C            [ 1] 1919 	jreq reprint 
                                   1920 ;	cp a,#'[
                                   1921 ;	jreq ansi_seq
      000B55                       1922 final_test:
      008B7F 97 7B            [ 1] 1923 	cp a,#SPACE
      008B81 03 42            [ 1] 1924 	jrpl accept_char
      008B83 72 FB            [ 2] 1925 	jra readln_loop
      000B5B                       1926 ansi_seq:
                                   1927 ;	call getc
                                   1928 ;	cp a,#'C 
                                   1929 ;	jreq rigth_arrow
                                   1930 ;	cp a,#'D 
                                   1931 ;	jreq left_arrow 
                                   1932 ;	jra final_test
      000B5B                       1933 right_arrow:
                                   1934 ;	ld a,#BSP 
                                   1935 ;	call putc 
                                   1936 ;	jra realn_loop 
      000B5B                       1937 left_arrow:
                                   1938 ;	jra readln_loop
      000B5B                       1939 reprint: 
      008B85 01 9F            [ 1] 1940 	tnz (LL,sp)
      008B87 C7 00            [ 1] 1941 	jrne readln_loop
      008B89 0C 5B 03         [ 2] 1942 	ldw x,#tib 
      008B8C 85 81 92         [ 4] 1943 	call strlen 
      008B8E 90 AE 16 90      [ 2] 1944 	ldw y,#tib 
      008B8E 72               [ 1] 1945 	ld a,xl
      008B8F 53 00            [ 1] 1946 	jreq readln_loop
      008B91 0E 72            [ 1] 1947 	ld (LL,sp),a 
      008B93 53 00 0D         [ 2] 1948 	ldw x,#tib 
      008B96 72 53 00         [ 4] 1949 	call puts
      008B99 0C A6            [ 1] 1950 	clr (LL_HB,sp)
      008B9B 01 CB 00         [ 2] 1951 	addw y,(LL_HB,sp)
      008B9E 0E C7            [ 2] 1952 	jra readln_loop 
      000B7B                       1953 del_ln:
      008BA0 00 0E            [ 1] 1954 	ld a,(LL,sp)
      008BA2 4F C9 00         [ 4] 1955 	call delete
      008BA5 0D C7 00 0D      [ 2] 1956 	ldw y,#tib
      008BA9 4F C9            [ 1] 1957 	clr (y)
      008BAB 00 0C            [ 1] 1958 	clr (LL,sp)
      008BAD C7 00            [ 2] 1959 	jra readln_loop
      000B8A                       1960 del_back:
      008BAF 0C 81            [ 1] 1961     tnz (LL,sp)
      008BB1 27 AB            [ 1] 1962     jreq readln_loop
      008BB1 4B 00            [ 1] 1963     dec (LL,sp)
      008BB3 4B 00            [ 2] 1964     decw y
      008BB5 90 AE            [ 1] 1965     clr  (y)
      008BB7 16 90 BD         [ 4] 1966     call bksp 
      008BB9 20 A0            [ 2] 1967     jra readln_loop	
      000B99                       1968 accept_char:
      008BB9 CD 83            [ 1] 1969 	ld a,#TIB_SIZE-1
      008BBB 29 6B            [ 1] 1970 	cp a, (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BBD 01 A1            [ 1] 1971 	jreq readln_loop
      008BBF 0D 26            [ 1] 1972 	ld a,(RXCHAR,sp)
      008BC1 03 CC            [ 1] 1973 	ld (y),a
      008BC3 8C 2E            [ 1] 1974 	inc (LL,sp)
      008BC5 A1 0A            [ 2] 1975 	incw y
      008BC7 27 65            [ 1] 1976 	clr (y)
      008BC9 A1 08 27         [ 4] 1977 	call putc 
      008BCC 3D A1            [ 2] 1978 	jra readln_loop
      000BAE                       1979 readln_quit:
      008BCE 04 27            [ 1] 1980 	clr (y)
      008BD0 2A A1            [ 1] 1981 	ld a,(LL,sp)
      008BD2 12 27 06         [ 1] 1982 	ld count,a 
      008BD5 A6 0D            [ 1] 1983 	ld a,#CR
      008BD5 A1 20 2A         [ 4] 1984 	call putc
      000BBA                       1985 	_drop VSIZE 
      008BD8 40 20            [ 2]    1     addw sp,#VSIZE 
      008BDA DE               [ 4] 1986 	ret
                                   1987 
                                   1988 
                                   1989 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1990 ;; compiler routines        ;;
                                   1991 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1992 ;------------------------------------
                                   1993 ; parse quoted string 
                                   1994 ; input:
                                   1995 ;   Y 	pointer to tib 
                                   1996 ;   X   pointer to output buffer 
                                   1997 ; output:
                                   1998 ;	buffer   parsed string
                                   1999 ;------------------------------------
                           000001  2000 	PREV = 1
                           000002  2001 	CURR =2
                           000002  2002 	VSIZE=2
      008BDB                       2003 parse_quote: 
      008BDB                       2004 	_vars VSIZE 
      008BDB 52 02            [ 2]    1     sub sp,#VSIZE 
      008BDB 4F               [ 1] 2005 	clr a
      008BDB 0D 02            [ 1] 2006 1$:	ld (PREV,sp),a 
      000BC2                       2007 2$:	
      008BDD 26 DA AE         [ 4] 2008 	ld a,([in.w],y)
      008BE0 16 90            [ 1] 2009 	jreq 6$
      008BE2 CD 84 12 90      [ 1] 2010 	inc in 
      008BE6 AE 16            [ 1] 2011 	ld (CURR,sp),a 
      008BE8 90 9F            [ 1] 2012 	ld a,#'\
      008BEA 27 CD            [ 1] 2013 	cp a, (PREV,sp)
      008BEC 6B 02            [ 1] 2014 	jrne 3$
      008BEE AE 16            [ 1] 2015 	clr (PREV,sp)
      008BF0 90 CD            [ 1] 2016 	ld a,(CURR,sp)
      008BF2 83 33            [ 4] 2017 	callr convert_escape
      008BF4 0F               [ 1] 2018 	ld (x),a 
      008BF5 01               [ 2] 2019 	incw x 
      008BF6 72 F9            [ 2] 2020 	jra 2$
      000BDD                       2021 3$:
      008BF8 01 20            [ 1] 2022 	ld a,(CURR,sp)
      008BFA BE 5C            [ 1] 2023 	cp a,#'\'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BFB 27 DD            [ 1] 2024 	jreq 1$
      008BFB 7B 02            [ 1] 2025 	cp a,#'"
      008BFD CD 83            [ 1] 2026 	jreq 6$ 
      008BFF 4D               [ 1] 2027 	ld (x),a 
      008C00 90               [ 2] 2028 	incw x 
      008C01 AE 16            [ 2] 2029 	jra 2$
      000BEB                       2030 6$:
      008C03 90               [ 1] 2031 	clr (x)
      008C04 90               [ 2] 2032 	incw x 
      008C05 7F 0F            [ 1] 2033 	ldw y,x 
      008C07 02               [ 1] 2034 	clrw x 
      008C08 20 AF            [ 1] 2035 	ld a,#TK_QSTR  
      008C0A                       2036 	_drop VSIZE
      008C0A 0D 02            [ 2]    1     addw sp,#VSIZE 
      008C0C 27               [ 4] 2037 	ret 
                                   2038 
                                   2039 ;---------------------------------------
                                   2040 ; called by parse_quote
                                   2041 ; subtitute escaped character 
                                   2042 ; by their ASCII value .
                                   2043 ; input:
                                   2044 ;   A  character following '\'
                                   2045 ; output:
                                   2046 ;   A  substitued char or same if not valid.
                                   2047 ;---------------------------------------
      000BF5                       2048 convert_escape:
      008C0D AB               [ 2] 2049 	pushw x 
      008C0E 0A 02 90         [ 2] 2050 	ldw x,#escaped 
      008C11 5A               [ 1] 2051 1$:	cp a,(x)
      008C12 90 7F            [ 1] 2052 	jreq 2$
      008C14 CD               [ 1] 2053 	tnz (x)
      008C15 83 3D            [ 1] 2054 	jreq 3$
      008C17 20               [ 2] 2055 	incw x 
      008C18 A0 F7            [ 2] 2056 	jra 1$
      008C19 1D 0C 0A         [ 2] 2057 2$: subw x,#escaped 
      008C19 A6               [ 1] 2058 	ld a,xl 
      008C1A 4F 11            [ 1] 2059 	add a,#7
      008C1C 02               [ 2] 2060 3$:	popw x 
      008C1D 27               [ 4] 2061 	ret 
                                   2062 
      008C1E 9A 7B 01 90 F7 0C 02  2063 escaped: .asciz "abtnvfr"
             90
                                   2064 
                                   2065 ;-------------------------
                                   2066 ; integer parser 
                                   2067 ; input:
                                   2068 ;   X 		point to output buffer  
                                   2069 ;   Y 		point to tib 
                                   2070 ;   A 	    first digit|'$' 
                                   2071 ; output:  
                                   2072 ;   pad     number string 
                                   2073 ;   X 		integer 
                                   2074 ;   A 		TK_INTGR
                                   2075 ;-------------------------
                           000001  2076 	BASE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                           000002  2077 	TCHAR=2 
                           000003  2078 	XSAVE=3
                           000004  2079 	VSIZE=4 
      000C12                       2080 parse_integer: ; { -- n }
      008C26 5C               [ 2] 2081 	pushw x 	
      008C27 90 7F            [ 1] 2082 	push #0 ; TCHAR
      008C29 CD 83            [ 1] 2083 	push #10 ; BASE=10
      008C2B 20 20            [ 1] 2084 	cp a,#'$
      008C2D 8B 04            [ 1] 2085 	jrne 2$ 
      008C2E                       2086     _drop #1
      008C2E 90 7F            [ 2]    1     addw sp,##1 
      008C30 7B 02            [ 1] 2087 	push #16  ; BASE=16
      008C32 C7               [ 1] 2088 2$:	ld (x),a 
      008C33 00               [ 2] 2089 	incw x 
      008C34 04 A6 0D         [ 4] 2090 	ld a,([in.w],y)
      008C37 CD 83 20 5B      [ 1] 2091 	inc in 
      008C3B 02 81 A5         [ 4] 2092 	call to_upper 
      008C3D 6B 02            [ 1] 2093 	ld (TCHAR,sp),a 
      008C3D 52 02 4F         [ 4] 2094 	call is_digit 
      008C40 6B 01            [ 1] 2095 	jrc 2$
      008C42 A6 10            [ 1] 2096 	ld a,#16 
      008C42 91 D6            [ 1] 2097 	cp a,(BASE,sp)
      008C44 01 27            [ 1] 2098 	jrne 3$ 
      008C46 24 72            [ 1] 2099 	ld a,(TCHAR,sp)
      008C48 5C 00            [ 1] 2100 	cp a,#'A 
      008C4A 02 6B            [ 1] 2101 	jrmi 3$ 
      008C4C 02 A6            [ 1] 2102 	cp a,#'G 
      008C4E 5C 11            [ 1] 2103 	jrmi 2$ 
      008C50 01 26 0A 0F      [ 1] 2104 3$: dec in 	
      008C54 01               [ 1] 2105     clr (x)
      008C55 7B 02            [ 2] 2106 	ldw x,(XSAVE,sp)
      008C57 AD 1C F7         [ 4] 2107 	call atoi24
      008C5A 5C 20            [ 1] 2108 	ldw y,x 
      008C5C E5 00 0C         [ 2] 2109 	ldw x,acc16 
      008C5D A6 84            [ 1] 2110 	ld a,#TK_INTGR
      008C5D 7B 02            [ 2] 2111 	ldw (y),x 
      008C5F A1 5C 27 DD      [ 2] 2112 	addw y,#2
      000C59                       2113 	_drop VSIZE  
      008C63 A1 22            [ 2]    1     addw sp,#VSIZE 
      008C65 27               [ 4] 2114 	ret 	
                                   2115 
                                   2116 ;-------------------------
                                   2117 ; binary integer parser
                                   2118 ; build integer in acc24  
                                   2119 ; input:
                                   2120 ;   X 		point to output buffer  
                                   2121 ;   Y 		point to tib 
                                   2122 ;   A 	    '&' 
                                   2123 ; output:  
                                   2124 ;   buffer  TK_INTGR integer  
                                   2125 ;   X 		int16 
                                   2126 ;   A 		TK_INTGR
                                   2127 ;   acc24    int24 
                                   2128 ;-------------------------
                           000001  2129 	BINARY=1 ; 24 bits integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                           000003  2130 	VSIZE=3
      000C5C                       2131 parse_binary: ; { -- n }
      008C66 04 F7            [ 1] 2132 	push #0
      008C68 5C 20            [ 1] 2133 	push #0
      008C6A D7 00            [ 1] 2134 	push #0
      008C6B                       2135 2$:	
      008C6B 7F 5C 90         [ 4] 2136 	ld a,([in.w],y)
      008C6E 93 5F A6 02      [ 1] 2137 	inc in 
      008C72 5B 02            [ 1] 2138 	cp a,#'0 
      008C74 81 06            [ 1] 2139 	jreq 3$
      008C75 A1 31            [ 1] 2140 	cp a,#'1 
      008C75 89 AE            [ 1] 2141 	jreq 3$ 
      008C77 8C 8A            [ 2] 2142 	jra bin_exit 
      008C79 F1 27            [ 1] 2143 3$: sub a,#'0 
      008C7B 06               [ 1] 2144 	rrc a
      008C7C 7D 27            [ 1] 2145 	rlc (BINARY+2,sp) 
      008C7E 09 5C            [ 1] 2146 	rlc (BINARY+1,sp)
      008C80 20 F7            [ 1] 2147 	rlc (BINARY,sp) 
      008C82 1D 8C            [ 2] 2148 	jra 2$  
      000C7E                       2149 bin_exit:
      008C84 8A 9F AB 07      [ 1] 2150 	dec in 
      008C88 85 81            [ 1] 2151 	ldw y,x
      008C8A 61 62            [ 1] 2152 	ld a,(BINARY,sp)
      008C8C 74 6E 76         [ 1] 2153 	ld acc24,a 
      008C8F 66 72            [ 2] 2154 	ldw x,(BINARY+1,sp)
      008C91 00 00 0C         [ 2] 2155 	ldw acc16,x
      008C92 90 FF            [ 2] 2156 	ldw (y),x 
      008C92 89 4B 00 4B      [ 2] 2157 	addw y,#2  
      008C96 0A A1            [ 1] 2158 	ld a,#TK_INTGR 	
      000C96                       2159 	_drop VSIZE 
      008C98 24 26            [ 2]    1     addw sp,#VSIZE 
      008C9A 04               [ 4] 2160 	ret
                                   2161 
                                   2162 ;---------------------------
                                   2163 ;  token begin with a letter,
                                   2164 ;  is keyword or variable. 	
                                   2165 ; input:
                                   2166 ;   X 		point to pad 
                                   2167 ;   Y 		point to text
                                   2168 ;   A 	    first letter  
                                   2169 ; output:
                                   2170 ;   X		exec_addr|var_addr 
                                   2171 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2172 ;   pad 	keyword|var_name  
                                   2173 ;--------------------------  
                           000001  2174 	XFIRST=1
                           000002  2175 	VSIZE=2
      000C99                       2176 parse_keyword: 
      008C9B 5B               [ 2] 2177 	pushw x 
      000C9A                       2178 kw_loop:	
      008C9C 01 4B 10         [ 4] 2179 	call to_upper 
      008C9F F7               [ 1] 2180 	ld (x),a 
      008CA0 5C               [ 2] 2181 	incw x 
      008CA1 91 D6 01         [ 4] 2182 	ld a,([in.w],y)
      008CA4 72 5C 00 02      [ 1] 2183 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CA8 CD 8F 25         [ 4] 2184 	call is_alpha 
      008CAB 6B 02            [ 1] 2185 	jrc kw_loop
      008CAD CD 85 FC 25      [ 1] 2186 	dec in   
      008CB1 ED               [ 1] 2187 1$: clr (x)
      008CB2 A6 10            [ 2] 2188 	ldw x,(XFIRST,sp) 
      008CB4 11 01            [ 1] 2189 	ld a,(1,x)
      008CB6 26 0A            [ 1] 2190 	jrne 2$
                                   2191 ; one letter variable name 
      008CB8 7B               [ 1] 2192 	ld a,(x) 
      008CB9 02 A1            [ 1] 2193 	sub a,#'A 
      008CBB 41               [ 1] 2194 	sll a 
      008CBC 2B               [ 1] 2195 	push a 
      008CBD 04 A1            [ 1] 2196 	push #0
      008CBF 47 2B DD         [ 2] 2197 	ldw x,#vars 
      008CC2 72 5A 00         [ 2] 2198 	addw x,(1,sp) ; X=var address 
      000CC3                       2199 	_drop 2 
      008CC5 02 7F            [ 2]    1     addw sp,#2 
      008CC7 1E 03            [ 1] 2200 	ld a,#TK_VAR 
      008CC9 CD 8F            [ 2] 2201 	jra 4$ 
      000CC9                       2202 2$: ; check for keyword, otherwise syntax error.
      000CC9                       2203 	_ldx_dict kword_dict ; dictionary entry point
      008CCB 31 90 93         [ 2]    1     ldw x,#kword_dict+2
      008CCE CE 00            [ 2] 2204 	ldw y,(XFIRST,sp) ; name to search for
      008CD0 0D A6 84         [ 4] 2205 	call search_dict
      008CD3 90               [ 1] 2206 	tnz a
      008CD4 FF 72            [ 1] 2207 	jrne 4$ 
      008CD6 A9 00 02         [ 2] 2208 	jp syntax_error
      000CD7                       2209 4$:	
      008CD9 5B 04            [ 2] 2210 	ldw y,(XFIRST,sp)
      008CDB 81 F7            [ 1] 2211 	ld (y),a 
      008CDC 90 5C            [ 2] 2212 	incw y 
      008CDC 4B 00            [ 2] 2213 	ldw (y),x
      008CDE 4B 00 4B 00      [ 2] 2214 	addw y,#2  
      008CE2                       2215 	_drop VSIZE 
      008CE2 91 D6            [ 2]    1     addw sp,#VSIZE 
      008CE4 01               [ 4] 2216 	ret  	
                                   2217 
                                   2218 
                                   2219 ;------------------------------------
                                   2220 ; scan text for next token
                                   2221 ; input: 
                                   2222 ;	X 		pointer to buffer where 
                                   2223 ;	        token id and value are copied 
                                   2224 ; use:
                                   2225 ;	Y   pointer to text in tib 
                                   2226 ; output:
                                   2227 ;   A       token attribute 
                                   2228 ;   X 		token value
                                   2229 ;   Y       updated position in output buffer   
                                   2230 ;------------------------------------
                                   2231 	; use to check special character 
                                   2232 	.macro _case c t  
                                   2233 	ld a,#c 
                                   2234 	cp a,(TCHAR,sp) 
                                   2235 	jrne t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2236 	.endm 
                                   2237 
                           000001  2238 	TCHAR=1
                           000002  2239 	ATTRIB=2
                           000002  2240 	VSIZE=2
      000CE6                       2241 get_token: 
      000CE6                       2242 	_vars VSIZE
      008CE5 72 5C            [ 2]    1     sub sp,#VSIZE 
                                   2243 ;	ld a,in 
                                   2244 ;	sub a,count
                                   2245 ;   jrmi 0$
                                   2246 ;	clr a 
                                   2247 ;	ret 
      000CE8                       2248 0$: 
      008CE7 00 02 A1 30      [ 2] 2249 	ldw y,#tib    	
      008CEB 27 06            [ 1] 2250 	ld a,#SPACE
      008CED A1 31 27         [ 4] 2251 	call skip
      008CF0 02 20 0B A0 30   [ 1] 2252 	mov in.saved,in 
      008CF5 46 09 03         [ 4] 2253 	ld a,([in.w],y)
      008CF8 09 02            [ 1] 2254 	jrne 1$
      008CFA 09 01            [ 1] 2255 	ldw y,x 
      008CFC 20 E4 A2         [ 2] 2256 	jp token_exit ; end of line 
      008CFE 72 5C 00 01      [ 1] 2257 1$:	inc in 
      008CFE 72 5A 00         [ 4] 2258 	call to_upper 
      008D01 02 90            [ 1] 2259 	ld (TCHAR,sp),a 
                                   2260 ; check for quoted string
      000D09                       2261 str_tst:  	
      000D09                       2262 	_case '"' nbr_tst
      008D03 93 7B            [ 1]    1 	ld a,#'"' 
      008D05 01 C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D07 00 0C            [ 1]    3 	jrne nbr_tst
      008D09 1E 02            [ 1] 2263 	ld a,#TK_QSTR
      008D0B CF               [ 1] 2264 	ld (x),a 
      008D0C 00               [ 2] 2265 	incw x 
      008D0D 0D 90 FF         [ 4] 2266 	call parse_quote
      008D10 72 A9 00         [ 2] 2267 	jp token_exit
      000D19                       2268 nbr_tst:
                                   2269 ; check for hexadecimal number 
      008D13 02 A6            [ 1] 2270 	ld a,#'$'
      008D15 84 5B            [ 1] 2271 	cp a,(TCHAR,sp) 
      008D17 03 81            [ 1] 2272 	jreq 1$
                                   2273 ;check for binary number 
      008D19 A6 26            [ 1] 2274 	ld a,#'&
      008D19 89 01            [ 1] 2275 	cp a,(TCHAR,sp)
      008D1A 26 0A            [ 1] 2276 	jrne 0$
      008D1A CD 8F            [ 1] 2277 	ld a,#TK_INTGR
      008D1C 25               [ 1] 2278 	ld (x),a 
      008D1D F7               [ 2] 2279 	incw x 
      008D1E 5C 91 D6         [ 4] 2280 	call parse_binary ; expect binary integer 
      008D21 01 72 5C         [ 2] 2281 	jp token_exit 
                                   2282 ; check for decimal number 	
      008D24 00 02            [ 1] 2283 0$:	ld a,(TCHAR,sp)
      008D26 CD 85 EB         [ 4] 2284 	call is_digit
      008D29 25 EF            [ 1] 2285 	jrnc 3$
      008D2B 72 5A            [ 1] 2286 1$:	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D2D 00               [ 1] 2287 	ld (x),a 
      008D2E 02               [ 2] 2288 	incw x 
      008D2F 7F 1E            [ 1] 2289 	ld a,(TCHAR,sp)
      008D31 01 E6 01         [ 4] 2290 	call parse_integer 
      008D34 26 13 F6         [ 2] 2291 	jp token_exit 
      000D42                       2292 3$: 
      000D42                       2293 	_case '(' bkslsh_tst 
      008D37 A0 41            [ 1]    1 	ld a,#'(' 
      008D39 48 88            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3B 4B 00            [ 1]    3 	jrne bkslsh_tst
      008D3D AE 00            [ 1] 2294 	ld a,#TK_LPAREN
      008D3F 27 72 FB         [ 2] 2295 	jp token_char   	
      000D4D                       2296 bkslsh_tst: ; character token 
      000D4D                       2297 	_case '\',rparnt_tst
      008D42 01 5B            [ 1]    1 	ld a,#'\' 
      008D44 02 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D46 85 20            [ 1]    3 	jrne rparnt_tst
      008D48 0E 03            [ 1] 2298 	ld a,#TK_CHAR 
      008D49 F7               [ 1] 2299 	ld (x),a 
      008D49 AE               [ 2] 2300 	incw x 
      008D4A A7 2E 16         [ 4] 2301 	ld a,([in.w],y)
      008D4D 01               [ 1] 2302 	ld (x),a 
      008D4E CD               [ 2] 2303 	incw x
      008D4F 90 8B            [ 1] 2304 	ldw y,x 	 
      008D51 4D 26 03 CC      [ 1] 2305 	inc in  
      008D55 88               [ 1] 2306 	clrw x 
      008D56 F1               [ 1] 2307 	ld xl,a 
      008D57 A6 03            [ 1] 2308 	ld a,#TK_CHAR 
      008D57 16 01 90         [ 2] 2309 	jp token_exit 
      000D69                       2310 rparnt_tst:		
      000D69                       2311 	_case ')' colon_tst 
      008D5A F7 90            [ 1]    1 	ld a,#')' 
      008D5C 5C 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5E FF 72            [ 1]    3 	jrne colon_tst
      008D60 A9 00            [ 1] 2312 	ld a,#TK_RPAREN 
      008D62 02 5B 02         [ 2] 2313 	jp token_char
      000D74                       2314 colon_tst:
      000D74                       2315 	_case ':' comma_tst 
      008D65 81 3A            [ 1]    1 	ld a,#':' 
      008D66 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D66 52 02            [ 1]    3 	jrne comma_tst
      008D68 A6 01            [ 1] 2316 	ld a,#TK_COLON 
      008D68 90 AE 16         [ 2] 2317 	jp token_char  
      000D7F                       2318 comma_tst:
      000D7F                       2319 	_case COMMA sharp_tst 
      008D6B 90 A6            [ 1]    1 	ld a,#COMMA 
      008D6D 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6F 8F 9B            [ 1]    3 	jrne sharp_tst
      008D71 55 00            [ 1] 2320 	ld a,#TK_COMMA
      008D73 02 00 03         [ 2] 2321 	jp token_char
      000D8A                       2322 sharp_tst:
      000D8A                       2323 	_case SHARP dash_tst 
      008D76 91 D6            [ 1]    1 	ld a,#SHARP 
      008D78 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7A 05 90            [ 1]    3 	jrne dash_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D7C 93 CC            [ 1] 2324 	ld a,#TK_SHARP
      008D7E 8F 22 72         [ 2] 2325 	jp token_char  	 	 
      000D95                       2326 dash_tst: 	
      000D95                       2327 	_case '-' at_tst 
      008D81 5C 00            [ 1]    1 	ld a,#'-' 
      008D83 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D85 8F 25            [ 1]    3 	jrne at_tst
      008D87 6B 01            [ 1] 2328 	ld a,#TK_MINUS  
      008D89 CC 0E 9E         [ 2] 2329 	jp token_char 
      000DA0                       2330 at_tst:
      000DA0                       2331 	_case '@' qmark_tst 
      008D89 A6 22            [ 1]    1 	ld a,#'@' 
      008D8B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8D 26 0A            [ 1]    3 	jrne qmark_tst
      008D8F A6 02            [ 1] 2332 	ld a,#TK_ARRAY 
      008D91 F7 5C CD         [ 2] 2333 	jp token_char
      000DAB                       2334 qmark_tst:
      000DAB                       2335 	_case '?' tick_tst 
      008D94 8C 3D            [ 1]    1 	ld a,#'?' 
      008D96 CC 8F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D98 22 12            [ 1]    3 	jrne tick_tst
      008D99 A6 80            [ 1] 2336 	ld a,#TK_CMD  
      008D99 A6               [ 1] 2337 	ld (x),a 
      008D9A 24               [ 2] 2338 	incw x 
      008D9B 11 01            [ 1] 2339 	ldw y,x 
      008D9D 27 17 A6         [ 2] 2340 	ldw x,#print 
      008DA0 26 11            [ 2] 2341 	ldw (y),x 
      008DA2 01 26 0A A6      [ 2] 2342 	addw y,#2
      008DA6 84 F7 5C         [ 2] 2343 	jp token_exit
      000DC3                       2344 tick_tst: ; comment 
      000DC3                       2345 	_case TICK plus_tst 
      008DA9 CD 8C            [ 1]    1 	ld a,#TICK 
      008DAB DC CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAD 8F 22            [ 1]    3 	jrne plus_tst
      008DAF 7B 01            [ 1] 2346 	ld a,#TK_CMD
      008DB1 CD               [ 1] 2347 	ld (x),a 
      008DB2 85               [ 2] 2348 	incw x
      008DB3 FC 24 0C A6      [ 2] 2349 	ldw y,#remark
      008DB7 84               [ 2] 2350 	ldw (x),y 
      008DB8 F7 5C 7B         [ 2] 2351 	addw x,#2  
      000DD5                       2352 copy_comment:
      008DBB 01 CD 8C 92      [ 2] 2353 	ldw y,#tib 
      008DBF CC 8F 22 00      [ 2] 2354 	addw y,in.w
      008DC2 90 89            [ 2] 2355 	pushw y
      008DC2 A6 28 11         [ 4] 2356 	call strcpy
      008DC5 01 26 05         [ 2] 2357     subw y,(1,sp)
      008DC8 A6 07            [ 1] 2358 	ld a,yl 
      008DCA CC 8F 1E         [ 1] 2359 	add a,in
      008DCD C7 00 01         [ 1] 2360 	ld in,a 
      008DCD A6 5C            [ 2] 2361 	ldw (1,sp),x
      008DCF 11 01 26         [ 2] 2362 	addw y,(1,sp)
      008DD2 16 A6            [ 2] 2363 	incw y 
      000DF4                       2364 	_drop 2 
      008DD4 03 F7            [ 2]    1     addw sp,#2 
      008DD6 5C 91 D6         [ 2] 2365 	ldw x,#remark 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DD9 01 F7            [ 1] 2366 	ld a,#TK_CMD 
      008DDB 5C 90 93         [ 2] 2367 	jp token_exit 
      000DFE                       2368 plus_tst:
      000DFE                       2369 	_case '+' star_tst 
      008DDE 72 5C            [ 1]    1 	ld a,#'+' 
      008DE0 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE2 5F 97            [ 1]    3 	jrne star_tst
      008DE4 A6 03            [ 1] 2370 	ld a,#TK_PLUS  
      008DE6 CC 8F 22         [ 2] 2371 	jp token_char 
      008DE9                       2372 star_tst:
      000E09                       2373 	_case '*' slash_tst 
      008DE9 A6 29            [ 1]    1 	ld a,#'*' 
      008DEB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DED 26 05            [ 1]    3 	jrne slash_tst
      008DEF A6 08            [ 1] 2374 	ld a,#TK_MULT 
      008DF1 CC 8F 1E         [ 2] 2375 	jp token_char 
      008DF4                       2376 slash_tst: 
      000E14                       2377 	_case '/' prcnt_tst 
      008DF4 A6 3A            [ 1]    1 	ld a,#'/' 
      008DF6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF8 26 05            [ 1]    3 	jrne prcnt_tst
      008DFA A6 01            [ 1] 2378 	ld a,#TK_DIV 
      008DFC CC 8F 1E         [ 2] 2379 	jp token_char 
      008DFF                       2380 prcnt_tst:
      000E1F                       2381 	_case '%' eql_tst 
      008DFF A6 2C            [ 1]    1 	ld a,#'%' 
      008E01 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E03 26 05            [ 1]    3 	jrne eql_tst
      008E05 A6 09            [ 1] 2382 	ld a,#TK_MOD
      008E07 CC 8F 1E         [ 2] 2383 	jp token_char  
                                   2384 ; 1 or 2 character tokens 	
      008E0A                       2385 eql_tst:
      000E2A                       2386 	_case '=' gt_tst 		
      008E0A A6 23            [ 1]    1 	ld a,#'=' 
      008E0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0E 26 05            [ 1]    3 	jrne gt_tst
      008E10 A6 0A            [ 1] 2387 	ld a,#TK_EQUAL
      008E12 CC 8F 1E         [ 2] 2388 	jp token_char 
      008E15                       2389 gt_tst:
      000E35                       2390 	_case '>' lt_tst 
      008E15 A6 2D            [ 1]    1 	ld a,#'>' 
      008E17 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E19 26 05            [ 1]    3 	jrne lt_tst
      008E1B A6 11            [ 1] 2391 	ld a,#TK_GT 
      008E1D CC 8F            [ 1] 2392 	ld (ATTRIB,sp),a 
      008E1F 1E 5C 00 01      [ 1] 2393 	inc in 
      008E20 91 D6 00         [ 4] 2394 	ld a,([in.w],y)
      008E20 A6 40            [ 1] 2395 	cp a,#'=
      008E22 11 01            [ 1] 2396 	jrne 1$
      008E24 26 05            [ 1] 2397 	ld a,#TK_GE 
      008E26 A6 06            [ 2] 2398 	jra token_char  
      008E28 CC 8F            [ 1] 2399 1$: cp a,#'<
      008E2A 1E 04            [ 1] 2400 	jrne 2$
      008E2B A6 35            [ 1] 2401 	ld a,#TK_NE 
      008E2B A6 3F            [ 2] 2402 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E2D 11 01 26 12      [ 1] 2403 2$: dec in
      008E31 A6 80            [ 1] 2404 	ld a,(ATTRIB,sp)
      008E33 F7 5C            [ 2] 2405 	jra token_char 	 
      000E5E                       2406 lt_tst:
      000E5E                       2407 	_case '<' other
      008E35 90 93            [ 1]    1 	ld a,#'<' 
      008E37 AE 95            [ 1]    2 	cp a,(TCHAR,sp) 
      008E39 23 90            [ 1]    3 	jrne other
      008E3B FF 72            [ 1] 2408 	ld a,#TK_LT 
      008E3D A9 00            [ 1] 2409 	ld (ATTRIB,sp),a 
      008E3F 02 CC 8F 22      [ 1] 2410 	inc in 
      008E43 91 D6 00         [ 4] 2411 	ld a,([in.w],y)
      008E43 A6 27            [ 1] 2412 	cp a,#'=
      008E45 11 01            [ 1] 2413 	jrne 1$
      008E47 26 35            [ 1] 2414 	ld a,#TK_LE 
      008E49 A6 80            [ 2] 2415 	jra token_char 
      008E4B F7 5C            [ 1] 2416 1$: cp a,#'>
      008E4D 90 AE            [ 1] 2417 	jrne 2$
      008E4F 96 20            [ 1] 2418 	ld a,#TK_NE 
      008E51 FF 1C            [ 2] 2419 	jra token_char 
      008E53 00 02 00 01      [ 1] 2420 2$: dec in 
      008E55 7B 02            [ 1] 2421 	ld a,(ATTRIB,sp)
      008E55 90 AE            [ 2] 2422 	jra token_char 	
      000E87                       2423 other: ; not a special character 	 
      008E57 16 90            [ 1] 2424 	ld a,(TCHAR,sp)
      008E59 72 B9 00         [ 4] 2425 	call is_alpha 
      008E5C 01 90            [ 1] 2426 	jrc 30$ 
      008E5E 89 CD 84         [ 2] 2427 	jp syntax_error 
      000E91                       2428 30$: 
      008E61 30 72 F2         [ 4] 2429 	call parse_keyword
      008E64 01 90 9F         [ 2] 2430 	cpw x,#remark 
      008E67 CB 00            [ 1] 2431 	jrne token_exit 
      008E69 02 C7            [ 1] 2432 	ldw y,x 
      008E6B 00 02 1F         [ 2] 2433 	jp copy_comment 
      000E9E                       2434 token_char:
      008E6E 01               [ 1] 2435 	ld (x),a 
      008E6F 72               [ 2] 2436 	incw x
      008E70 F9 01            [ 1] 2437 	ldw y,x 
      000EA2                       2438 token_exit:
      000EA2                       2439 	_drop VSIZE 
      008E72 90 5C            [ 2]    1     addw sp,#VSIZE 
      008E74 5B               [ 4] 2440 	ret
                                   2441 
                                   2442 
                                   2443 ;------------------------------------
                                   2444 ; convert alpha to uppercase
                                   2445 ; input:
                                   2446 ;    a  character to convert
                                   2447 ; output:
                                   2448 ;    a  uppercase character
                                   2449 ;------------------------------------
      000EA5                       2450 to_upper::
      008E75 02 AE            [ 1] 2451 	cp a,#'a
      008E77 96 20            [ 1] 2452 	jrpl 1$
      008E79 A6               [ 4] 2453 0$:	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E7A 80 CC            [ 1] 2454 1$: cp a,#'z	
      008E7C 8F 22            [ 1] 2455 	jrugt 0$
      008E7E A0 20            [ 1] 2456 	sub a,#32
      008E7E A6               [ 4] 2457 	ret
                                   2458 	
                                   2459 ;------------------------------------
                                   2460 ; convert pad content in integer
                                   2461 ; input:
                                   2462 ;    x		.asciz to convert
                                   2463 ; output:
                                   2464 ;    acc24      int24_t
                                   2465 ;------------------------------------
                                   2466 	; local variables
                           000001  2467 	SIGN=1 ; 1 byte, 
                           000002  2468 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2469 	TEMP=3 ; 1 byte, temporary storage
                           000003  2470 	VSIZE=3 ; 3 bytes reserved for local storage
      000EB1                       2471 atoi24:
      008E7F 2B               [ 2] 2472 	pushw x 
      000EB2                       2473 	_vars VSIZE
      008E80 11 01            [ 2]    1     sub sp,#VSIZE 
                                   2474 	; acc24=0 
      008E82 26 05 A6 10      [ 1] 2475 	clr acc24    
      008E86 CC 8F 1E 0C      [ 1] 2476 	clr acc16
      008E89 72 5F 00 0D      [ 1] 2477 	clr acc8 
      008E89 A6 2A            [ 1] 2478 	clr (SIGN,sp)
      008E8B 11 01            [ 1] 2479 	ld a,#10
      008E8D 26 05            [ 1] 2480 	ld (BASE,sp),a ; default base decimal
      008E8F A6               [ 1] 2481 	ld a,(x)
      008E90 20 CC            [ 1] 2482 	jreq 9$  ; completed if 0
      008E92 8F 1E            [ 1] 2483 	cp a,#'-
      008E94 26 04            [ 1] 2484 	jrne 1$
      008E94 A6 2F            [ 1] 2485 	cpl (SIGN,sp)
      008E96 11 01            [ 2] 2486 	jra 2$
      008E98 26 05            [ 1] 2487 1$: cp a,#'$
      008E9A A6 21            [ 1] 2488 	jrne 3$
      008E9C CC 8F            [ 1] 2489 	ld a,#16
      008E9E 1E 02            [ 1] 2490 	ld (BASE,sp),a
      008E9F 5C               [ 2] 2491 2$:	incw x
      008E9F A6               [ 1] 2492 	ld a,(x)
      000EDB                       2493 3$:	
      008EA0 25 11            [ 1] 2494 	cp a,#'a
      008EA2 01 26            [ 1] 2495 	jrmi 4$
      008EA4 05 A6            [ 1] 2496 	sub a,#32
      008EA6 22 CC            [ 1] 2497 4$:	cp a,#'0
      008EA8 8F 1E            [ 1] 2498 	jrmi 9$
      008EAA A0 30            [ 1] 2499 	sub a,#'0
      008EAA A6 3D            [ 1] 2500 	cp a,#10
      008EAC 11 01            [ 1] 2501 	jrmi 5$
      008EAE 26 05            [ 1] 2502 	sub a,#7
      008EB0 A6 32            [ 1] 2503 	cp a,(BASE,sp)
      008EB2 CC 8F            [ 1] 2504 	jrpl 9$
      008EB4 1E 03            [ 1] 2505 5$:	ld (TEMP,sp),a
      008EB5 7B 02            [ 1] 2506 	ld a,(BASE,sp)
      008EB5 A6 3E 11         [ 4] 2507 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EB8 01 26            [ 1] 2508 	ld a,(TEMP,sp)
      008EBA 23 A6 31         [ 1] 2509 	add a,acc24+2
      008EBD 6B 02 72         [ 1] 2510 	ld acc24+2,a
      008EC0 5C               [ 1] 2511 	clr a
      008EC1 00 02 91         [ 1] 2512 	adc a,acc24+1
      008EC4 D6 01 A1         [ 1] 2513 	ld acc24+1,a
      008EC7 3D               [ 1] 2514 	clr a
      008EC8 26 04 A6         [ 1] 2515 	adc a,acc24
      008ECB 33 20 50         [ 1] 2516 	ld acc24,a
      008ECE A1 3C            [ 2] 2517 	jra 2$
      008ED0 26 04            [ 1] 2518 9$:	tnz (SIGN,sp)
      008ED2 A6 35            [ 1] 2519     jreq atoi_exit
      008ED4 20 48 72         [ 4] 2520     call neg_acc24
      000F17                       2521 atoi_exit: 
      000F17                       2522 	_drop VSIZE
      008ED7 5A 00            [ 2]    1     addw sp,#VSIZE 
      008ED9 02               [ 2] 2523 	popw x ; restore x
      008EDA 7B               [ 4] 2524 	ret
                                   2525 
                                   2526 
                                   2527 ;------------------------------------
                                   2528 ; skip character c in text starting from 'in'
                                   2529 ; input:
                                   2530 ;	 y 		point to text buffer
                                   2531 ;    a 		character to skip
                                   2532 ; output:  
                                   2533 ;	'in' ajusted to new position
                                   2534 ;------------------------------------
                           000001  2535 	C = 1 ; local var
      000F1B                       2536 skip:
      008EDB 02               [ 1] 2537 	push a
      008EDC 20 40 00         [ 4] 2538 1$:	ld a,([in.w],y)
      008EDE 27 0A            [ 1] 2539 	jreq 2$
      008EDE A6 3C            [ 1] 2540 	cp a,(C,sp)
      008EE0 11 01            [ 1] 2541 	jrne 2$
      008EE2 26 23 A6 34      [ 1] 2542 	inc in
      008EE6 6B 02            [ 2] 2543 	jra 1$
      000F2B                       2544 2$: _drop 1 
      008EE8 72 5C            [ 2]    1     addw sp,#1 
      008EEA 00               [ 4] 2545 	ret
                                   2546 	
                                   2547 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2548 ;;   TINY BASIC  operators,
                                   2549 ;;   commands and functions 
                                   2550 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2551 
                                   2552 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2553 ;;  Arithmetic operators
                                   2554 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2555 
                                   2556 ;--------------------------------
                                   2557 ;  add 2 integers
                                   2558 ;  input:
                                   2559 ;    N1     on cstack 
                                   2560 ;    N2     on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2561 ;  output:
                                   2562 ;    X 		n2+n1 
                                   2563 ;--------------------------------
                                   2564 	;arugments on cstack 
      000F2E                       2565 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F2E                       2566 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F2E                       2567 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F2E                       2568 add:
      008EEB 02 91            [ 2] 2569 	ldw x ,(N2,sp)
      008EED D6 01 A1         [ 2] 2570 	addw x,(N1,sp)
      008EF0 3D 26            [ 2] 2571 	ldw (N1,sp),x 
      008EF2 04               [ 4] 2572 	ret 
                                   2573 
                                   2574 ;--------------------------------
                                   2575 ;  substract 2 ntegers
                                   2576 ;  input:
                                   2577 ;    N1     on cstack 
                                   2578 ;    N2     on cstack 
                                   2579 ;  output:
                                   2580 ;    X 		n2+n1 
                                   2581 ;--------------------------------
      000F36                       2582 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F36                       2583 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F36                       2584 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F36                       2585 substract:
      008EF3 A6 36            [ 2] 2586 	ldw x,(N2,sp)
      008EF5 20 27 A1         [ 2] 2587 	subw x,(N1,sp)
      008EF8 3E               [ 4] 2588 	ret 
                                   2589 
                                   2590 ;-------------------------------------
                                   2591 ; multiply 2 integers
                                   2592 ; product overflow is ignored unless
                                   2593 ; MATH_OVF assembler flag is set to 1
                                   2594 ; input:
                                   2595 ;  	N1      on cstack
                                   2596 ;   N2 		on cstack 
                                   2597 ; output:
                                   2598 ;	X        N1*N2 
                                   2599 ;-------------------------------------
                                   2600 	;arguments 
      000F3C                       2601 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000F3C                       2602 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000F3C                       2603 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000F3C                       2604 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000F3C                       2605 	_arg N2_LB 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000009     1     N2_LB=ARG_OFS+4 
                                   2606    ; local variables 
                           000001  2607 	SIGN=1
                           000002  2608 	PROD=2
                           000003  2609 	VSIZE=3
      000F3C                       2610 multiply:
      000F3C                       2611 	_vars VSIZE 
      008EF9 26 04            [ 2]    1     sub sp,#VSIZE 
      008EFB A6 35            [ 1] 2612 	clr (SIGN,sp)
      008EFD 20 1F            [ 2] 2613 	ldw x,(N1_HB,sp)
      008EFF 72               [ 1] 2614 	ld a,xh  
      008F00 5A 00            [ 1] 2615 	bcp a,#0x80 
      008F02 02 7B            [ 1] 2616 	jreq 2$
      008F04 02 20            [ 1] 2617 	cpl (SIGN,sp)
      008F06 17               [ 2] 2618 	negw x 
      008F07 1F 06            [ 2] 2619 	ldw (N1_HB,sp),x 
      008F07 7B 01            [ 2] 2620 2$: ldw x,(N2_HB,sp)
      008F09 CD               [ 1] 2621 	ld a,xh  
      008F0A 85 EB            [ 1] 2622 	bcp a,#0x80 
      008F0C 25 03            [ 1] 2623 	jreq 3$
      008F0E CC 88            [ 1] 2624 	cpl (SIGN,sp)
      008F10 F1               [ 2] 2625 	negw x 
      008F11 1F 08            [ 2] 2626 	ldw (N2_HB,sp),x 
                                   2627 ; N1_LB * N2_LB 	
      008F11 CD 8D            [ 1] 2628 3$:	ld a,(N1_LB,sp)
      008F13 19               [ 1] 2629 	ld xl,a 
      008F14 A3 96            [ 1] 2630 	ld a,(N2_LB,sp) 
      008F16 20               [ 4] 2631 	mul x,a 
                           000000  2632 .if MATH_OVF 	
                                   2633 	ld a,xh 
                                   2634 	bcp a,#0x80 
                                   2635 	jreq 4$ 
                                   2636 	ld a,#ERR_MATH_OVF 
                                   2637 	jp tb_error
                                   2638 .endif 	 
      008F17 26 09            [ 2] 2639 4$:	ldw (PROD,sp),x
                                   2640 ; N1_LB * N2_HB	 
      008F19 90 93            [ 1] 2641 	ld a,(N1_LB,sp) 
      008F1B CC               [ 1] 2642 	ld xl,a 
      008F1C 8E 55            [ 1] 2643 	ld a,(N2_HB,sp)
      008F1E 42               [ 4] 2644 	mul x,a
      008F1E F7               [ 1] 2645 	ld a,xl 
      008F1F 5C 90            [ 1] 2646 	add a,(PROD,sp)
                           000000  2647 .if MATH_OVF 	
                                   2648 	bcp a,#0x80 
                                   2649 	jreq 5$ 
                                   2650 	ld a,#ERR_MATH_OVF 
                                   2651 	jp tb_error
                                   2652 .endif 	 
      008F21 93 02            [ 1] 2653 5$:	ld (PROD,sp),a 
                                   2654 ; N1_HB * N2_LB 
      008F22 7B 06            [ 1] 2655 	ld a,(N1_HB,sp)
      008F22 5B               [ 1] 2656 	ld xl,a 
      008F23 02 81            [ 1] 2657 	ld a,(N2_LB,sp)
      008F25 42               [ 4] 2658 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F25 A1               [ 1] 2659 	ld a,xl 
      008F26 61 2A            [ 1] 2660 	add a,(PROD,sp)
                           000000  2661 .if MATH_OVF 	
                                   2662 	bcp a,#0x80 
                                   2663 	jreq 6$ 
                                   2664 	ld a,#ERR_MATH_OVF 
                                   2665 	jp tb_error
                                   2666 .endif 	 
      008F28 01 81            [ 1] 2667 6$:	ld (PROD,sp),a 
                                   2668 ; N1_HB * N2_HB 	
                                   2669 ; it is pointless to multiply N1_HB*N2_HB 
                                   2670 ; as this product is over 65535 or 0 
                                   2671 ;
                                   2672 ; sign adjust product
      008F2A A1 7A            [ 1] 2673 	tnz (SIGN,sp)
      008F2C 22 FB            [ 1] 2674 	jreq 7$
      008F2E A0 20            [ 2] 2675 	ldw x, (PROD,sp)
      008F30 81               [ 2] 2676 	negw x
      008F31 1F 02            [ 2] 2677 	ldw (PROD,sp),x  
      000F7F                       2678 7$: 
      008F31 89 52            [ 2] 2679 	ldw x,(PROD,sp) 
      000F81                       2680 	_drop VSIZE 
      008F33 03 72            [ 2]    1     addw sp,#VSIZE 
      008F35 5F               [ 4] 2681 	ret
                                   2682 
                                   2683 ;----------------------------------
                                   2684 ;  euclidian divide n2/n1 
                                   2685 ; input:
                                   2686 ;    N2 	on cstack
                                   2687 ;    N1 	on cstack
                                   2688 ; output:
                                   2689 ;    X      n2/n1 
                                   2690 ;    Y      remainder 
                                   2691 ;----------------------------------
      000F84                       2692 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000F84                       2693 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000F84                       2694 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2695 	; local variables
                           000001  2696 	SQUOT=1 ; sign quotient
                           000002  2697 	SDIVD=2 ; sign dividend  
                           000002  2698 	VSIZE=2
      000F84                       2699 divide:
      000F84                       2700 	_vars VSIZE 
      008F36 00 0C            [ 2]    1     sub sp,#VSIZE 
      008F38 72 5F            [ 1] 2701 	clr (SQUOT,sp)
      008F3A 00 0D            [ 1] 2702 	clr (SDIVD,sp)
                                   2703 ; check for 0 divisor
      008F3C 72 5F            [ 2] 2704 	ldw x,(DIVISR,sp)
      008F3E 00               [ 2] 2705 	tnzw x 
      008F3F 0E 0F            [ 1] 2706     jrne 0$
      008F41 01 A6            [ 1] 2707 	ld a,#ERR_DIV0 
      008F43 0A 6B 02         [ 2] 2708 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2709 ; check divisor sign 	
      008F46 F6               [ 1] 2710 0$:	ld a,xh 
      008F47 27 47            [ 1] 2711 	bcp a,#0x80 
      008F49 A1 2D            [ 1] 2712 	jreq 1$
      008F4B 26 04            [ 1] 2713 	cpl (SQUOT,sp)
      008F4D 03               [ 2] 2714 	negw x 
      008F4E 01 20            [ 2] 2715 1$:	ldw (DIVISR,sp),x
                                   2716 ; check dividend sign 	 
      008F50 08 A1            [ 2] 2717     ldw x,(DIVIDND,sp)
      008F52 24               [ 1] 2718 	ld a,xh 
      008F53 26 06            [ 1] 2719 	bcp a,#0x80 
      008F55 A6 10            [ 1] 2720 	jreq 2$ 
      008F57 6B 02            [ 1] 2721 	cpl (SQUOT,sp)
      008F59 5C F6            [ 1] 2722 	cpl (SDIVD,sp)
      008F5B 50               [ 2] 2723 	negw x 
      008F5B A1 61            [ 2] 2724 2$:	ldw y,(DIVISR,sp)
      008F5D 2B               [ 2] 2725 	divw x,y
      008F5E 02 A0 20 A1      [ 2] 2726 	ldw acc16,y 
                                   2727 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F62 30 2B            [ 1] 2728 	tnz (SDIVD,sp)
      008F64 2B A0            [ 1] 2729 	jreq 7$
      008F66 30 A1            [ 2] 2730 	tnzw y 
      008F68 0A 2B            [ 1] 2731 	jreq 7$
      008F6A 06               [ 2] 2732 	incw x
      008F6B A0 07            [ 2] 2733 	ldw y,(DIVISR,sp)
      008F6D 11 02 2A 1F      [ 2] 2734 	subw y,acc16
      008F71 6B 03            [ 1] 2735 7$: tnz (SQUOT,sp)
      008F73 7B 02            [ 1] 2736 	jreq 9$ 	 
      008F75 CD               [ 2] 2737 8$:	negw x 
      000FC5                       2738 9$: 
      000FC5                       2739 	_drop VSIZE 
      008F76 8B 54            [ 2]    1     addw sp,#VSIZE 
      008F78 7B               [ 4] 2740 	ret 
                                   2741 
                                   2742 
                                   2743 ;----------------------------------
                                   2744 ;  remainder resulting from euclidian 
                                   2745 ;  division of n2/n1 
                                   2746 ; input:
                                   2747 ;   N1 		cstack 
                                   2748 ;   N2      cstack
                                   2749 ; output:
                                   2750 ;   X       N2%N1 
                                   2751 ;----------------------------------
                           000003  2752 	N1=3
                           000005  2753 	N2=5
                           000004  2754 	VSIZE=4
      000FC8                       2755 modulo:
      008F79 03 CB            [ 2] 2756 	Ldw x,(N1,sp)
      008F7B 00 0E            [ 2] 2757 	ldw y,(N2,sp)
      000FCC                       2758 	_vars VSIZE 
      008F7D C7 00            [ 2]    1     sub sp,#VSIZE 
      008F7F 0E 4F            [ 2] 2759 	ldw (1,sp),x 
      008F81 C9 00            [ 2] 2760 	ldw (3,sp),y 
      008F83 0D C7 00         [ 4] 2761 	call divide 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F86 0D               [ 1] 2762 	ldw x,y
      000FD6                       2763 	_drop VSIZE 
      008F87 4F C9            [ 2]    1     addw sp,#VSIZE 
      008F89 00               [ 4] 2764 	ret 
                                   2765 
                                   2766 
                                   2767 ;----------------------------------
                                   2768 ; search in kword_dict name
                                   2769 ; from its execution address 
                                   2770 ; input:
                                   2771 ;   X       	execution address 
                                   2772 ; output:
                                   2773 ;   X 			cstr*  | 0 
                                   2774 ;--------------------------------
                           000001  2775 	XADR=1 
                           000003  2776 	LINK=3 
                           000004  2777 	VSIZE=4
      000FD9                       2778 cmd_name:
      000FD9                       2779 	_vars VSIZE 
      008F8A 0C C7            [ 2]    1     sub sp,#VSIZE 
      008F8C 00 0C 20 C9      [ 1] 2780 	clr acc16 
      008F90 0D 01            [ 2] 2781 	ldw (XADR,sp),x  
      008F92 27 03 CD         [ 2] 2782 	ldw x,#kword_dict	
      008F95 8B 8E            [ 2] 2783 1$:	ldw (LINK,sp),x
      008F97 E6 02            [ 1] 2784 	ld a,(2,x)
      008F97 5B 03            [ 1] 2785 	and a,#15 
      008F99 85 81 0D         [ 1] 2786 	ld acc8,a 
      008F9B 1C 00 03         [ 2] 2787 	addw x,#3
      008F9B 88 91 D6 01      [ 2] 2788 	addw x,acc16
      008F9F 27               [ 2] 2789 	ldw x,(x) ; execution address 
      008FA0 0A 11            [ 2] 2790 	cpw x,(XADR,sp)
      008FA2 01 26            [ 1] 2791 	jreq 2$
      008FA4 06 72            [ 2] 2792 	ldw x,(LINK,sp)
      008FA6 5C               [ 2] 2793 	ldw x,(x) 
      008FA7 00 02 20         [ 2] 2794 	subw x,#2  
      008FAA F1 5B            [ 1] 2795 	jrne 1$
      008FAC 01 81            [ 2] 2796 	jra 9$
      008FAE 1E 03            [ 2] 2797 2$: ldw x,(LINK,sp)
      008FAE 1E 05 72         [ 2] 2798 	addw x,#2 	
      001008                       2799 9$:	_drop VSIZE
      008FB1 FB 03            [ 2]    1     addw sp,#VSIZE 
      008FB3 1F               [ 4] 2800 	ret
                                   2801 
                                   2802 
                                   2803 ;---------------------------------
                                   2804 ; dictionary search 
                                   2805 ; input:
                                   2806 ;	X 		dictionary entry point, name field  
                                   2807 ;   y		.asciz name to search 
                                   2808 ; output:
                                   2809 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2810 ;  X		execution address | 0 
                                   2811 ;---------------------------------
                           000001  2812 	NLEN=1 ; cmd length 
                           000002  2813 	XSAVE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000004  2814 	YSAVE=4
                           000005  2815 	VSIZE=5 
      00100B                       2816 search_dict:
      00100B                       2817 	_vars VSIZE 
      008FB4 03 81            [ 2]    1     sub sp,#VSIZE 
                                   2818 
      008FB6 17 04            [ 2] 2819 	ldw (YSAVE,sp),y 
      00100F                       2820 search_next:
      008FB6 1E 05            [ 2] 2821 	ldw (XSAVE,sp),x 
                                   2822 ; get name length in dictionary	
      008FB8 72               [ 1] 2823 	ld a,(x)
      008FB9 F0 03            [ 1] 2824 	and a,#0xf 
      008FBB 81 01            [ 1] 2825 	ld (NLEN,sp),a  
      008FBC 16 04            [ 2] 2826 	ldw y,(YSAVE,sp) ; name pointer 
      008FBC 52               [ 2] 2827 	incw x 
      001019                       2828 cp_loop:
      008FBD 03 0F            [ 1] 2829 	ld a,(y)
      008FBF 01 1E            [ 1] 2830 	jreq str_match 
      008FC1 06 9E            [ 1] 2831 	tnz (NLEN,sp)
      008FC3 A5 80            [ 1] 2832 	jreq no_match  
      008FC5 27               [ 1] 2833 	cp a,(x)
      008FC6 05 03            [ 1] 2834 	jrne no_match 
      008FC8 01 50            [ 2] 2835 	incw y 
      008FCA 1F               [ 2] 2836 	incw x
      008FCB 06 1E            [ 1] 2837 	dec (NLEN,sp)
      008FCD 08 9E            [ 2] 2838 	jra cp_loop 
      00102B                       2839 no_match:
      008FCF A5 80            [ 2] 2840 	ldw x,(XSAVE,sp) 
      008FD1 27 05 03         [ 2] 2841 	subw x,#2 ; move X to link field
      008FD4 01 50            [ 1] 2842 	push #TK_NONE 
      008FD6 1F               [ 2] 2843 	ldw x,(x) ; next word link 
      008FD7 08               [ 1] 2844 	pop a ; TK_NONE 
      008FD8 7B 07            [ 1] 2845 	jreq search_exit  ; not found  
                                   2846 ;try next 
      008FDA 97 7B            [ 2] 2847 	jra search_next
      001038                       2848 str_match:
      008FDC 09 42            [ 2] 2849 	ldw x,(XSAVE,sp)
      008FDE 1F               [ 1] 2850 	ld a,(X)
      008FDF 02 7B            [ 1] 2851 	ld (NLEN,sp),a ; needed to test keyword type  
      008FE1 07 97            [ 1] 2852 	and a,#0xf 
                                   2853 ; move x to procedure address field 	
      008FE3 7B               [ 1] 2854 	inc a 
      008FE4 08 42 9F         [ 1] 2855 	ld acc8,a 
      008FE7 1B 02 6B 02      [ 1] 2856 	clr acc16 
      008FEB 7B 06 97 7B      [ 2] 2857 	addw x,acc16 
      008FEF 09               [ 2] 2858 	ldw x,(x) ; routine entry point 
                                   2859 ;determine keyword type bits 7:6 
      008FF0 42 9F            [ 1] 2860 	ld a,(NLEN,sp)
      008FF2 1B               [ 1] 2861 	swap a 
      008FF3 02 6B            [ 1] 2862 	and a,#0xc
      008FF5 02               [ 1] 2863 	srl a
      008FF6 0D               [ 1] 2864 	srl a 
      008FF7 01 27            [ 1] 2865 	add a,#128
      001055                       2866 search_exit: 
      001055                       2867 	_drop VSIZE 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FF9 05 1E            [ 2]    1     addw sp,#VSIZE 
      008FFB 02               [ 4] 2868 	ret 
                                   2869 
                                   2870 ;---------------------
                                   2871 ; check if next token
                                   2872 ;  is of expected type 
                                   2873 ; input:
                                   2874 ;   A 		 expected token attribute
                                   2875 ;  ouput:
                                   2876 ;   none     if fail call syntax_error 
                                   2877 ;--------------------
      001058                       2878 expect:
      008FFC 50               [ 1] 2879 	push a 
      008FFD 1F 02 63         [ 4] 2880 	call next_token 
      008FFF 11 01            [ 1] 2881 	cp a,(1,sp)
      008FFF 1E 02            [ 1] 2882 	jreq 1$
      009001 5B 03 81         [ 2] 2883 	jp syntax_error
      009004 84               [ 1] 2884 1$: pop a 
      009004 52               [ 4] 2885 	ret 
                                   2886 
                                   2887 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2888 ; parse arguments list 
                                   2889 ; between ()
                                   2890 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001065                       2891 func_args:
      009005 02 0F            [ 1] 2892 	ld a,#TK_LPAREN 
      009007 01 0F 02         [ 4] 2893 	call expect 
                                   2894 ; expected to continue in arg_list 
                                   2895 ; caller must check for TK_RPAREN 
                                   2896 
                                   2897 ;-------------------------------
                                   2898 ; parse embedded BASIC routines 
                                   2899 ; arguments list.
                                   2900 ; arg_list::=  rel[','rel]*
                                   2901 ; all arguments are of integer type
                                   2902 ; and pushed on stack 
                                   2903 ; input:
                                   2904 ;   none
                                   2905 ; output:
                                   2906 ;   stack{n}   arguments pushed on stack
                                   2907 ;   A 	number of arguments pushed on stack  
                                   2908 ;--------------------------------
      00106A                       2909 arg_list:
      00900A 1E 05            [ 1] 2910 	push #0  
      00900C 5D 26 05         [ 4] 2911 1$: call relation
      00900F A6 04            [ 1] 2912 	cp a,#TK_NONE 
      009011 CC 88            [ 1] 2913 	jreq 5$
      009013 F3 9E            [ 1] 2914 	cp a,#TK_INTGR
      009015 A5 80            [ 1] 2915 	jrne 4$
      001077                       2916 3$: 
                                   2917 ; swap return address with argument
      009017 27               [ 1] 2918 	pop a ; arg_count
      009018 03 03            [ 2] 2919 	popw y ; return address 
      00901A 01               [ 2] 2920 	pushw x ; new argument 
      00901B 50 1F            [ 2] 2921 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00901D 05               [ 1] 2922     inc a
      00901E 1E               [ 1] 2923 	push a 
      00901F 07 9E A5         [ 4] 2924 	call next_token 
      009022 80 27            [ 1] 2925 	cp a,#TK_COMMA 
      009024 05 03            [ 1] 2926 	jreq 1$ 
      009026 01 03            [ 1] 2927 	cp a,#TK_NONE 
      009028 02 50            [ 1] 2928 	jreq 5$ 
      00902A 16 05            [ 1] 2929 4$:	cp a,#TK_RPAREN 
      00902C 65 90            [ 1] 2930 	jreq 5$
      00108E                       2931 	_unget_token 
      00902E CF 00 0D 0D 02   [ 1]    1     mov in,in.saved
      009033 27               [ 1] 2932 5$:	pop a  
      009034 0B               [ 4] 2933 	ret 
                                   2934 
                                   2935 ;--------------------------------
                                   2936 ;   BASIC commnands 
                                   2937 ;--------------------------------
                                   2938 
                                   2939 ;--------------------------------
                                   2940 ;  arithmetic and relational 
                                   2941 ;  routines
                                   2942 ;  operators precedence
                                   2943 ;  highest to lowest
                                   2944 ;  operators on same row have 
                                   2945 ;  same precedence and are executed
                                   2946 ;  from left to right.
                                   2947 ;	'*','/','%'
                                   2948 ;   '-','+'
                                   2949 ;   '=','>','<','>=','<=','<>','><'
                                   2950 ;   '<>' and '><' are equivalent for not equal.
                                   2951 ;--------------------------------
                                   2952 
                                   2953 ;---------------------
                                   2954 ; return array element
                                   2955 ; address from @(expr)
                                   2956 ; input:
                                   2957 ;   A 		TK_ARRAY
                                   2958 ; output:
                                   2959 ;   A 		TK_INTGR
                                   2960 ;	X 		element address 
                                   2961 ;----------------------
      001095                       2962 get_array_element:
      009035 90 5D 27         [ 4] 2963 	call func_args 
      009038 07 5C            [ 1] 2964 	cp a,#1
      00903A 16 05            [ 1] 2965 	jreq 1$
      00903C 72 B2 00         [ 2] 2966 	jp syntax_error
      00903F 0D               [ 2] 2967 1$: popw x 
                                   2968 	; check for bounds 
      009040 0D 01 27         [ 2] 2969 	cpw x,array_size 
      009043 01 50            [ 2] 2970 	jrule 3$
                                   2971 ; bounds {1..array_size}	
      009045 A6 0A            [ 1] 2972 2$: ld a,#ERR_BAD_VALUE 
      009045 5B 02 81         [ 2] 2973 	jp tb_error 
      009048 5D               [ 2] 2974 3$: tnzw  x
      009048 1E 03            [ 1] 2975 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00904A 16               [ 2] 2976 	sllw x 
      00904B 05               [ 2] 2977 	pushw x 
      00904C 52 04 1F         [ 2] 2978 	ldw x,#tib
      00904F 01 17 03         [ 2] 2979 	subw x,(1,sp)
      0010B5                       2980 	_drop 2   
      009052 CD 90            [ 2]    1     addw sp,#2 
      009054 04 93            [ 1] 2981 	ld a,#TK_INTGR
      009056 5B               [ 4] 2982 	ret 
                                   2983 
                                   2984 ;***********************************
                                   2985 ;   expression parse,execute 
                                   2986 ;***********************************
                                   2987 ;-----------------------------------
                                   2988 ; factor ::= ['+'|'-'|e]  var | @ |
                                   2989 ;			 integer | function |
                                   2990 ;			 '('relation')' 
                                   2991 ; output:
                                   2992 ;   A    token attribute 
                                   2993 ;   X 	 integer
                                   2994 ; ---------------------------------
                           000001  2995 	NEG=1
                           000001  2996 	VSIZE=1
      0010BA                       2997 factor:
      0010BA                       2998 	_vars VSIZE 
      009057 04 81            [ 2]    1     sub sp,#VSIZE 
      009059 CD 09 63         [ 4] 2999 	call next_token
      009059 52 04            [ 1] 3000 	cp a,#CMD_END 
      00905B 72 5F            [ 1] 3001 	jrult 20$
      00905D 00 0D            [ 1] 3002 1$:	ld (NEG,sp),a 
      00905F 1F 01            [ 1] 3003 	and a,#TK_GRP_MASK
      009061 AE A7            [ 1] 3004 	cp a,#TK_GRP_ADD 
      009063 2C 1F            [ 1] 3005 	jreq 2$
      009065 03 E6            [ 1] 3006 	ld a,(NEG,sp)
      009067 02 A4            [ 2] 3007 	jra 4$  
      0010CF                       3008 2$:	
      009069 0F C7 00         [ 4] 3009 	call next_token 
      0010D2                       3010 4$:	
      00906C 0E 1C            [ 1] 3011 	cp a,#TK_IFUNC 
      00906E 00 03            [ 1] 3012 	jrne 5$ 
      009070 72               [ 4] 3013 	call (x) 
      009071 BB 00            [ 2] 3014 	jra 18$ 
      0010D9                       3015 5$:
      009073 0D FE            [ 1] 3016 	cp a,#TK_INTGR
      009075 13 01            [ 1] 3017 	jrne 6$
      009077 27 0A            [ 2] 3018 	jra 18$
      0010DF                       3019 6$:
      009079 1E 03            [ 1] 3020 	cp a,#TK_ARRAY
      00907B FE 1D            [ 1] 3021 	jrne 10$
      00907D 00 02 26         [ 4] 3022 	call get_array_element
      009080 E3               [ 2] 3023 	ldw x,(x)
      009081 20 05            [ 2] 3024 	jra 18$ 
      0010E9                       3025 10$:
      009083 1E 03            [ 1] 3026 	cp a,#TK_VAR 
      009085 1C 00            [ 1] 3027 	jrne 12$
      009087 02               [ 2] 3028 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009088 5B 04            [ 2] 3029 	jra 18$
      0010F0                       3030 12$:			
      00908A 81 07            [ 1] 3031 	cp a,#TK_LPAREN
      00908B 26 0C            [ 1] 3032 	jrne 16$
      00908B 52 05 17         [ 4] 3033 	call relation
      00908E 04               [ 2] 3034 	pushw x 
      00908F A6 08            [ 1] 3035 	ld a,#TK_RPAREN 
      00908F 1F 02 F6         [ 4] 3036 	call expect
      009092 A4               [ 2] 3037 	popw x 
      009093 0F 6B            [ 2] 3038 	jra 18$	
      001100                       3039 16$:
      001100                       3040 	_unget_token
      009095 01 16 04 5C 01   [ 1]    1     mov in,in.saved
      009099 4F               [ 1] 3041 	clr a 
      009099 90 F6            [ 2] 3042 	jra 20$ 
      001108                       3043 18$: 
      00909B 27 1B            [ 1] 3044 	ld a,#TK_MINUS 
      00909D 0D 01            [ 1] 3045 	cp a,(NEG,sp)
      00909F 27 0A            [ 1] 3046 	jrne 19$
      0090A1 F1               [ 2] 3047 	negw x
      00110F                       3048 19$:
      0090A2 26 07            [ 1] 3049 	ld a,#TK_INTGR
      001111                       3050 20$:
      001111                       3051 	_drop VSIZE
      0090A4 90 5C            [ 2]    1     addw sp,#VSIZE 
      0090A6 5C               [ 4] 3052 	ret
                                   3053 
                                   3054 ;-----------------------------------
                                   3055 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3056 ; output:
                                   3057 ;   A    	token attribute 
                                   3058 ;	X		integer
                                   3059 ;-----------------------------------
                           000001  3060 	N1=1
                           000003  3061 	N2=3
                           000005  3062 	MULOP=5
                           000005  3063 	VSIZE=5
      001114                       3064 term:
      001114                       3065 	_vars VSIZE
      0090A7 0A 01            [ 2]    1     sub sp,#VSIZE 
      0090A9 20 EE BA         [ 4] 3066 	call factor
      0090AB A1 02            [ 1] 3067 	cp a,#CMD_END
      0090AB 1E 02            [ 1] 3068 	jrult term_exit
      00111D                       3069 term01:	 ; check for  operator 
      0090AD 1D 00            [ 2] 3070 	ldw (N2,sp),x  ; save first factor 
      0090AF 02 4B 00         [ 4] 3071 	call next_token
      0090B2 FE 84            [ 1] 3072 	cp a,#CMD_END
      0090B4 27 1F            [ 1] 3073 	jrult 9$
      0090B6 20 D7            [ 1] 3074 0$:	ld (MULOP,sp),a
      0090B8 A4 30            [ 1] 3075 	and a,#TK_GRP_MASK
      0090B8 1E 02            [ 1] 3076 	cp a,#TK_GRP_MULT
      0090BA F6 6B            [ 1] 3077 	jreq 1$
      0090BC 01 A4            [ 1] 3078 	ld a,(MULOP,sp) 
      001130                       3079 	_unget_token 
      0090BE 0F 4C C7 00 0E   [ 1]    1     mov in,in.saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090C3 72 5F            [ 2] 3080 	jra 9$
      001137                       3081 1$:	; got *|/|%
      0090C5 00 0D 72         [ 4] 3082 	call factor
      0090C8 BB 00            [ 1] 3083 	cp a,#TK_INTGR
      0090CA 0D FE            [ 1] 3084 	jreq 2$ 
      0090CC 7B 01 4E         [ 2] 3085 	jp syntax_error
      0090CF A4 0C            [ 2] 3086 2$:	ldw (N1,sp),x  
      0090D1 44 44            [ 1] 3087 	ld a,(MULOP,sp) 
      0090D3 AB 80            [ 1] 3088 	cp a,#TK_MULT 
      0090D5 26 05            [ 1] 3089 	jrne 3$
      0090D5 5B 05 81         [ 4] 3090 	call multiply 
      0090D8 20 CF            [ 2] 3091 	jra term01
      0090D8 88 CD            [ 1] 3092 3$: cp a,#TK_DIV 
      0090DA 89 E3            [ 1] 3093 	jrne 4$ 
      0090DC 11 01 27         [ 4] 3094 	call divide 
      0090DF 03 CC            [ 2] 3095 	jra term01 
      0090E1 88 F1 84         [ 4] 3096 4$: call modulo
      0090E4 81 C1            [ 2] 3097 	jra term01 
      0090E5 1E 03            [ 2] 3098 9$: ldw x,(N2,sp)  
      0090E5 A6 07            [ 1] 3099 	ld a,#TK_INTGR 	
      001160                       3100 term_exit:
      001160                       3101 	_drop VSIZE 
      0090E7 CD 90            [ 2]    1     addw sp,#VSIZE 
      0090E9 D8               [ 4] 3102 	ret 
                                   3103 
                                   3104 ;-------------------------------
                                   3105 ;  expr ::= term [['+'|'-'] term]*
                                   3106 ;  result range {-32768..32767}
                                   3107 ;  output:
                                   3108 ;   A    token attribute 
                                   3109 ;   X	 integer   
                                   3110 ;-------------------------------
                           000001  3111 	N1=1 
                           000003  3112 	N2=3
                           000005  3113 	OP=5 
                           000005  3114 	VSIZE=5 
      0090EA                       3115 expression:
      001163                       3116 	_vars VSIZE 
      0090EA 4B 00            [ 2]    1     sub sp,#VSIZE 
      0090EC CD 92 27         [ 4] 3117 	call term
      0090EF A1 00            [ 1] 3118 	cp a,#CMD_END 
      0090F1 27 20            [ 1] 3119 	jrult expr_exit 
      0090F3 A1 84            [ 2] 3120 0$:	ldw (N2,sp),x 
      0090F5 26 13 63         [ 4] 3121 	call next_token
      0090F7 A1 02            [ 1] 3122 	cp a,#CMD_END 
      0090F7 84 90            [ 1] 3123 	jrult 9$ 
      0090F9 85 89            [ 1] 3124 1$:	ld (OP,sp),a  
      0090FB 90 89            [ 1] 3125 	and a,#TK_GRP_MASK
      0090FD 4C 88            [ 1] 3126 	cp a,#TK_GRP_ADD 
      0090FF CD 89            [ 1] 3127 	jreq 2$ 
      00117D                       3128 	_unget_token
      009101 E3 A1 09 27 E6   [ 1]    1     mov in,in.saved
      009106 A1 00            [ 2] 3129 	jra 9$
      001184                       3130 2$: 
      009108 27 09 A1         [ 4] 3131 	call term
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00910B 08 27            [ 1] 3132 	cp a,#TK_INTGR 
      00910D 05 55            [ 1] 3133 	jreq 3$
      00910F 00 03 00         [ 2] 3134 	jp syntax_error
      009112 02 84            [ 2] 3135 3$:	ldw (N1,sp),x 
      009114 81 05            [ 1] 3136 	ld a,(OP,sp)
      009115 A1 10            [ 1] 3137 	cp a,#TK_PLUS 
      009115 CD 90            [ 1] 3138 	jrne 4$
      009117 E5 A1 01         [ 4] 3139 	call add 
      00911A 27 03            [ 2] 3140 	jra 0$ 
      00911C CC 88 F1         [ 4] 3141 4$:	call substract
      00911F 85 C3            [ 2] 3142 	jra 0$
      009121 00 22            [ 2] 3143 9$: ldw x,(N2,sp)
      009123 23 05            [ 1] 3144 	ld a,#TK_INTGR	
      0011A4                       3145 expr_exit:
      0011A4                       3146 	_drop VSIZE 
      009125 A6 0A            [ 2]    1     addw sp,#VSIZE 
      009127 CC               [ 4] 3147 	ret 
                                   3148 
                                   3149 ;---------------------------------------------
                                   3150 ; rel ::= expr rel_op expr
                                   3151 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3152 ;  relation return 1 | 0  for true | false 
                                   3153 ;  output:
                                   3154 ;    A 		token attribute  
                                   3155 ;	 X		1|0
                                   3156 ;---------------------------------------------
                           000001  3157 	N1=1
                           000003  3158 	N2=3
                           000005  3159 	RELOP=5
                           000005  3160 	VSIZE=5 
      0011A7                       3161 relation: 
      0011A7                       3162 	_vars VSIZE
      009128 88 F3            [ 2]    1     sub sp,#VSIZE 
      00912A 5D 27 F8         [ 4] 3163 	call expression
      00912D 58 89            [ 1] 3164 	cp a,#CMD_END  
      00912F AE 16            [ 1] 3165 	jrult rel_exit 
                                   3166 	; expect rel_op or leave 
      009131 90 72            [ 2] 3167 	ldw (N2,sp),x 
      009133 F0 01 5B         [ 4] 3168 	call next_token 
      009136 02 A6            [ 1] 3169 	cp a,#CMD_END 
      009138 84 81            [ 1] 3170 	jrult 9$
      00913A                       3171 1$:	
      00913A 52 01            [ 1] 3172 	ld (RELOP,sp),a 
      00913C CD 89            [ 1] 3173 	and a,#TK_GRP_MASK
      00913E E3 A1            [ 1] 3174 	cp a,#TK_GRP_RELOP 
      009140 02 25            [ 1] 3175 	jreq 2$
      0011C1                       3176 	_unget_token  
      009142 4E 6B 01 A4 30   [ 1]    1     mov in,in.saved
      009147 A1 10            [ 2] 3177 	jra 9$
      0011C8                       3178 2$:	; expect another expression or error 
      009149 27 04 7B         [ 4] 3179 	call expression
      00914C 01 20            [ 1] 3180 	cp a,#TK_INTGR 
      00914E 03 03            [ 1] 3181 	jreq 3$
      00914F CC 08 71         [ 2] 3182 	jp syntax_error 
      00914F CD 89            [ 2] 3183 3$:	ldw (N1,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009151 E3 0F 36         [ 4] 3184 	call substract
      009152 26 06            [ 1] 3185 	jrne 4$
      009152 A1 81 26 03      [ 1] 3186 	mov acc8,#2 ; n1==n2
      009156 FD 20            [ 2] 3187 	jra 6$ 
      0011DF                       3188 4$: 
      009158 2F 06            [ 1] 3189 	jrsgt 5$  
      009159 35 04 00 0D      [ 1] 3190 	mov acc8,#4 ; n1<2 
      009159 A1 84            [ 2] 3191 	jra 6$
      0011E7                       3192 5$:
      00915B 26 02 20 29      [ 1] 3193 	mov acc8,#1 ; n1>n2 
      00915F                       3194 6$:
      00915F A1               [ 1] 3195 	clrw x 
      009160 06 26 06         [ 1] 3196 	ld a, acc8  
      009163 CD 91            [ 1] 3197 	and a,(RELOP,sp)
      009165 15               [ 1] 3198 	tnz a 
      009166 FE 20            [ 1] 3199 	jreq 10$
      009168 1F               [ 2] 3200 	incw x 
      009169                       3201 7$:	 
      009169 A1 85            [ 2] 3202 	jra 10$  	
      00916B 26 03            [ 2] 3203 9$: ldw x,(N2,sp)
      0011F9                       3204 10$:
      00916D FE 20            [ 1] 3205 	ld a,#TK_INTGR
      0011FB                       3206 rel_exit: 	 
      0011FB                       3207 	_drop VSIZE
      00916F 18 05            [ 2]    1     addw sp,#VSIZE 
      009170 81               [ 4] 3208 	ret 
                                   3209 
                                   3210 ;--------------------------------
                                   3211 ; BASIC: SHOW 
                                   3212 ; print stack content in hexadecimal bytes 
                                   3213 ; 16 bytes per row 
                                   3214 ;--------------------------------
      0011FE                       3215 show:
      009170 A1 07 26         [ 2] 3216 	ldw x,#cstk_prompt
      009173 0C CD 92         [ 4] 3217 	call puts 
      009176 27               [ 1] 3218 	ldw x,sp 
      009177 89 A6 08         [ 2] 3219 	addw x,#3 ; ignore return address
      00917A CD 90 D8 85      [ 2] 3220 	ldw y,#RAM_SIZE  
      00917E 20 08 0C         [ 2] 3221 	ldw acc16,x 
      009180 72 B2 00 0C      [ 2] 3222 	subw y,acc16
      009180 55 00 03         [ 4] 3223 	call hex_dump
      009183 00               [ 1] 3224 	clr a 
      009184 02               [ 4] 3225 	ret
                                   3226 
      009185 4F 20 09 6E 74 65 6E  3227 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3228 
                                   3229 
                                   3230 ;--------------------------------------------
                                   3231 ; BASIC: HEX 
                                   3232 ; select hexadecimal base for integer print
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3233 ;---------------------------------------------
      009188                       3234 hex_base:
      009188 A6 11 11 01      [ 1] 3235 	mov base,#16 
      00918C 26               [ 4] 3236 	ret 
                                   3237 
                                   3238 ;--------------------------------------------
                                   3239 ; BASIC: DEC 
                                   3240 ; select decimal base for integer print
                                   3241 ;---------------------------------------------
      001244                       3242 dec_base:
      00918D 01 50 00 0A      [ 1] 3243 	mov base,#10
      00918F 81               [ 4] 3244 	ret 
                                   3245 
                                   3246 ;------------------------
                                   3247 ; BASIC: SIZE 
                                   3248 ; return free size in text area
                                   3249 ; output:
                                   3250 ;   A 		TK_INTGR
                                   3251 ;   X 	    size integer
                                   3252 ;--------------------------
      001249                       3253 size:
      00918F A6 84 90         [ 2] 3254 	ldw x,#tib 
      009191 72 B0 00 1E      [ 2] 3255 	subw x,txtend 
      009191 5B 01            [ 1] 3256 	ld a,#TK_INTGR
      009193 81               [ 4] 3257 	ret 
                                   3258 
                                   3259 
                                   3260 ;------------------------
                                   3261 ; BASIC: UBOUND  
                                   3262 ; return array variable size 
                                   3263 ; output:
                                   3264 ;   A 		TK_INTGR
                                   3265 ;   X 	    array size 
                                   3266 ;--------------------------
      009194                       3267 ubound:
      009194 52 05 CD         [ 2] 3268 	ldw x,#tib
      009197 91 3A A1 02      [ 2] 3269 	subw x,txtend 
      00919B 25 43 00 04      [ 2] 3270 	ldw y,basicptr 
      00919D 90 C3 00 1E      [ 2] 3271 	cpw y,txtend 
      00919D 1F 03            [ 1] 3272 	jrult 1$
      00919F CD 89 E3         [ 1] 3273 	push count 
      0091A2 A1 02            [ 1] 3274 	push #0 
      0091A4 25 36 6B         [ 2] 3275 	subw x,(1,sp)
      00126C                       3276 	_drop 2 
      0091A7 05 A4            [ 2]    1     addw sp,#2 
      0091A9 30               [ 2] 3277 1$:	srlw x 
      0091AA A1 20 27         [ 2] 3278 	ldw array_size,x
      0091AD 09 7B            [ 1] 3279 	ld a,#TK_INTGR
      0091AF 05               [ 4] 3280 	ret 
                                   3281 
                                   3282 ;-----------------------------
                                   3283 ; BASIC: LET var=expr 
                                   3284 ; variable assignement 
                                   3285 ; output:
                                   3286 ;   A 		TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3287 ;-----------------------------
      001275                       3288 let:
      0091B0 55 00 03         [ 4] 3289 	call next_token 
      0091B3 00 02            [ 1] 3290 	cp a,#TK_VAR 
      0091B5 20 25            [ 1] 3291 	jreq let_var
      0091B7 A1 06            [ 1] 3292 	cp a,#TK_ARRAY 
      0091B7 CD 91            [ 1] 3293 	jreq  let_array
      0091B9 3A A1 84         [ 2] 3294 	jp syntax_error
      001283                       3295 let_array:
      0091BC 27 03 CC         [ 4] 3296 	call get_array_element
      001286                       3297 let_var:
      0091BF 88               [ 2] 3298 	pushw x  
      0091C0 F1 1F 01         [ 4] 3299 	call next_token 
      0091C3 7B 05            [ 1] 3300 	cp a,#TK_EQUAL
      0091C5 A1 20            [ 1] 3301 	jreq 1$
      0091C7 26 05 CD         [ 2] 3302 	jp syntax_error
      001291                       3303 1$:	
      0091CA 8F BC 20         [ 4] 3304 	call relation   
      0091CD CF A1            [ 1] 3305 	cp a,#TK_INTGR 
      0091CF 21 26            [ 1] 3306 	jreq 2$
      0091D1 05 CD 90         [ 2] 3307 	jp syntax_error
      00129B                       3308 2$:	
      0091D4 04 20            [ 1] 3309 	ldw y,x 
      0091D6 C6               [ 2] 3310 	popw x   
      0091D7 CD               [ 2] 3311 	ldw (x),y   
      0091D8 90               [ 4] 3312 	ret 
                                   3313 
                                   3314 ;----------------------------
                                   3315 ; BASIC: LIST [[start][,end]]
                                   3316 ; list program lines 
                                   3317 ; form start to end 
                                   3318 ; if empty argument list then 
                                   3319 ; list all.
                                   3320 ;----------------------------
                           000001  3321 	FIRST=1
                           000003  3322 	LAST=3 
                           000005  3323 	LN_PTR=5
                           000006  3324 	VSIZE=6 
      0012A0                       3325 list:
      0091D9 48 20 C1         [ 2] 3326 	ldw x,txtbgn 
      0091DC 1E 03 A6         [ 2] 3327 	cpw x,txtend 
      0091DF 84 01            [ 1] 3328 	jrmi 1$
      0091E0 81               [ 4] 3329 	ret 
      0012A9                       3330 1$:	
      0012A9                       3331 	_vars VSIZE
      0091E0 5B 05            [ 2]    1     sub sp,#VSIZE 
      0091E2 81 05            [ 2] 3332 	ldw (LN_PTR,sp),x 
      0091E3 FE               [ 2] 3333 	ldw x,(x) 
      0091E3 52 05            [ 2] 3334 	ldw (FIRST,sp),x ; list from first line 
      0091E5 CD 91 94         [ 2] 3335 	ldw x,#MAX_LINENO ; biggest line number 
      0091E8 A1 02            [ 2] 3336 	ldw (LAST,sp),x 
      0091EA 25 38 1F         [ 4] 3337 	call arg_list
      0091ED 03               [ 1] 3338 	tnz a
      0091EE CD 89            [ 1] 3339 	jreq list_start 
      0091F0 E3 A1            [ 1] 3340 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091F2 02 25            [ 1] 3341 	jreq 4$
      0091F4 2B 6B            [ 1] 3342 	cp a,#1 
      0091F6 05 A4            [ 1] 3343 	jreq first_line 
      0091F8 30 A1 10         [ 2] 3344 	jp syntax_error 
      0091FB 27               [ 2] 3345 4$:	popw x 
      0091FC 07 55            [ 2] 3346 	ldw (LAST+2,sp),x 
      0012C9                       3347 first_line:
      0091FE 00               [ 2] 3348 	popw x
      0091FF 03 00            [ 2] 3349 	ldw (FIRST,sp),x 
      0012CC                       3350 lines_skip:
      009201 02 20 1C         [ 2] 3351 	ldw x,txtbgn
      009204 1F 05            [ 2] 3352 2$:	ldw (LN_PTR,sp),x 
      009204 CD 91 94         [ 2] 3353 	cpw x,txtend 
      009207 A1 84            [ 1] 3354 	jrpl list_exit 
      009209 27               [ 2] 3355 	ldw x,(x) ;line# 
      00920A 03 CC            [ 2] 3356 	cpw x,(FIRST,sp)
      00920C 88 F1            [ 1] 3357 	jrpl list_start 
      00920E 1F 01            [ 2] 3358 	ldw x,(LN_PTR,sp) 
      009210 7B 05            [ 1] 3359 	ld a,(2,x)
      009212 A1 10 26         [ 1] 3360 	ld acc8,a 
      009215 05 CD 8F AE      [ 1] 3361 	clr acc16 
      009219 20 D1 CD 8F      [ 2] 3362 	addw x,acc16
      00921D B6 20            [ 2] 3363 	jra 2$ 
                                   3364 ; print loop
      0012EC                       3365 list_start:
      00921F CC 1E            [ 2] 3366 	ldw x,(LN_PTR,sp)
      009221 03 A6            [ 1] 3367 3$:	ld a,(2,x) 
      009223 84 13 6D         [ 4] 3368 	call prt_basic_line
      009224 1E 05            [ 2] 3369 	ldw x,(LN_PTR,sp)
      009224 5B 05            [ 1] 3370 	ld a,(2,x)
      009226 81 00 0D         [ 1] 3371 	ld acc8,a 
      009227 72 5F 00 0C      [ 1] 3372 	clr acc16 
      009227 52 05 CD 91      [ 2] 3373 	addw x,acc16
      00922B E3 A1 02         [ 2] 3374 	cpw x,txtend 
      00922E 25 4B            [ 1] 3375 	jrpl list_exit
      009230 1F 03            [ 2] 3376 	ldw (LN_PTR,sp),x
      009232 CD               [ 2] 3377 	ldw x,(x)
      009233 89 E3            [ 2] 3378 	cpw x,(LAST,sp)  
      009235 A1 02            [ 1] 3379 	jrsgt list_exit 
      009237 25 3E            [ 2] 3380 	ldw x,(LN_PTR,sp)
      009239 20 DC            [ 2] 3381 	jra 3$
      001312                       3382 list_exit:
      001312                       3383 	_drop VSIZE 
      009239 6B 05            [ 2]    1     addw sp,#VSIZE 
      00923B A4               [ 4] 3384 	ret
                                   3385 
                                   3386 ;-------------------------
                                   3387 ; print counted string 
                                   3388 ; input:
                                   3389 ;   X 	address of string
                                   3390 ;--------------------------
      001315                       3391 prt_cmd_name:
      00923C 30               [ 1] 3392 	ld a,(x)
      00923D A1               [ 2] 3393 	incw x
      00923E 30 27            [ 1] 3394 	and a,#15  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009240 07               [ 1] 3395 	push a 
      009241 55 00            [ 1] 3396 1$: tnz (1,sp) 
      009243 03 00            [ 1] 3397 	jreq 9$
      009245 02               [ 1] 3398 	ld a,(x)
      009246 20 2F A0         [ 4] 3399 	call putc 
      009248 5C               [ 2] 3400 	incw x
      009248 CD 91            [ 1] 3401 	dec (1,sp)	 
      00924A E3 A1            [ 2] 3402 	jra 1$
      00924C 84               [ 1] 3403 9$: pop a 
      00924D 27               [ 4] 3404 	ret	
                                   3405 
                                   3406 ;--------------------------
                                   3407 ; print TK_QSTR
                                   3408 ; converting control character
                                   3409 ; to backslash sequence
                                   3410 ; input:
                                   3411 ;   X        char *
                                   3412 ;-----------------------------
      001329                       3413 prt_quote:
      00924E 03 CC            [ 1] 3414 	ld a,#'"
      009250 88 F1 1F         [ 4] 3415 	call putc 
      009253 01               [ 1] 3416 1$:	ld a,(x)
      009254 CD 8F            [ 1] 3417 	jreq 9$
      009256 B6               [ 2] 3418 	incw x 
      009257 26 06            [ 1] 3419 	cp a,#SPACE 
      009259 35 02            [ 1] 3420 	jrult 3$
      00925B 00 0E 20         [ 4] 3421 	call putc
      00925E 0C 5C            [ 1] 3422 	cp a,#'\ 
      00925F 26 F1            [ 1] 3423 	jrne 1$ 
      00133D                       3424 2$:
      00925F 2C 06 35         [ 4] 3425 	call putc 
      009262 04 00            [ 2] 3426 	jra 1$
      009264 0E               [ 1] 3427 3$: push a 
      009265 20 04            [ 1] 3428 	ld a,#'\
      009267 CD 02 A0         [ 4] 3429 	call putc 
      009267 35               [ 1] 3430 	pop a 
      009268 01 00            [ 1] 3431 	sub a,#7
      00926A 0E 00 0D         [ 1] 3432 	ld acc8,a 
      00926B 72 5F 00 0C      [ 1] 3433 	clr acc16
      00926B 5F C6 00 0E      [ 2] 3434 	ldw y,#escaped 
      00926F 14 05 4D 27      [ 2] 3435 	addw y,acc16 
      009273 05 5C            [ 1] 3436 	ld a,(y)
      009275 20 DF            [ 2] 3437 	jra 2$
      009275 20 02            [ 1] 3438 9$: ld a,#'"
      009277 1E 03 A0         [ 4] 3439 	call putc 
      009279 5C               [ 2] 3440 	incw x 
      009279 A6               [ 4] 3441 	ret
                                   3442 
                                   3443 ;--------------------------
                                   3444 ; return variable name 
                                   3445 ; from its address.
                                   3446 ; input:
                                   3447 ;   X    variable address
                                   3448 ; output:
                                   3449 ;   A     variable letter
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3450 ;--------------------------
      001365                       3451 var_name:
      00927A 84 00 26         [ 2] 3452 		subw x,#vars 
      00927B 9F               [ 1] 3453 		ld a,xl 
      00927B 5B               [ 1] 3454 		srl a 
      00927C 05 81            [ 1] 3455 		add a,#'A 
      00927E 81               [ 4] 3456 		ret 
                                   3457 
                                   3458 
                                   3459 ;--------------------------
                                   3460 ; decompile line from token list 
                                   3461 ; input:
                                   3462 ;   A       stop at this position 
                                   3463 ;   X 		pointer at line
                                   3464 ; output:
                                   3465 ;   none 
                                   3466 ;--------------------------	
                           000001  3467 	BASE_SAV=1
                           000002  3468 	WIDTH_SAV=2
                           000003  3469 	XSAVE=3
                           000005  3470 	LLEN=5
                           000005  3471 	VSIZE=5 
      00136D                       3472 prt_basic_line:
      00136D                       3473 	_vars VSIZE
      00927E AE 92            [ 2]    1     sub sp,#VSIZE 
      009280 98 CD            [ 1] 3474 	ld (LLEN,sp),a  
      009282 83 33 96         [ 1] 3475 	ld a,base
      009285 1C 00            [ 1] 3476 	ld (BASE_SAV,sp),a  
      009287 03 90 AE         [ 1] 3477 	ld a,tab_width 
      00928A 18 00            [ 1] 3478 	ld (WIDTH_SAV,sp),a 
      00928C CF 00 0D         [ 2] 3479 	ldw ptr16,x
      00928F 72               [ 2] 3480 	ldw x,(x)
      009290 B2 00 0D CD      [ 1] 3481 	mov base,#10
      009294 83 D5 4F 81      [ 1] 3482 	mov tab_width,#5
      009298 0A 63 6F         [ 4] 3483 	call print_int ; print line number 
      00929B 6E 74            [ 1] 3484 	ld a,#SPACE 
      00929D 65 6E 74         [ 4] 3485 	call putc 
      0092A0 20 6F 66 20      [ 1] 3486 	clr tab_width
      0092A4 73 74 61         [ 2] 3487 	ldw x,#3
      0092A7 63               [ 1] 3488 1$:	ld a,xl 
      0092A8 6B 20            [ 1] 3489 	cp a,(LLEN,sp)
      0092AA 66 72            [ 1] 3490 	jrmi 2$
      0092AC 6F 6D 20         [ 2] 3491 	jp 20$
      00139E                       3492 2$:	 
      0092AF 74 6F 70 20      [ 4] 3493 	ld a,([ptr16],x)
      0092B3 74               [ 2] 3494 	incw x 
      0092B4 6F 20            [ 2] 3495 	ldw (XSAVE,sp),x 
      0092B6 62 6F 74 74      [ 5] 3496 	ldw x,([ptr16],x)
      0092BA 6F               [ 1] 3497 	tnz a 
      0092BB 6D 3A            [ 1] 3498 	jrmi 3$
      0092BD 0A 00            [ 1] 3499 	cp a,#TK_QSTR 
      0092BF 27 4B            [ 1] 3500 	jreq 6$
      0092BF 35 10            [ 1] 3501 	cp a,#TK_CHAR 
      0092C1 00 0B            [ 1] 3502 	jreq 7$
      0092C3 81 64            [ 2] 3503 	jra 8$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3504 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST
      0092C4                       3505 3$:	
      0092C4 35 0A            [ 1] 3506 	cp a,#TK_VAR 
      0092C6 00 0B            [ 1] 3507 	jreq 4$
      0092C8 81 84            [ 1] 3508 	cp a,#TK_INTGR
      0092C9 27 38            [ 1] 3509 	jreq 5$
      0092C9 AE 16 90         [ 2] 3510 	cpw x,#remark 
      0092CC 72 B0            [ 1] 3511 	jrne 30$
      0092CE 00 1F            [ 1] 3512 	ld a,#''
      0092D0 A6 84 81         [ 4] 3513 	call putc 
      0092D3 1E 03            [ 2] 3514 	ldw x,(XSAVE,sp)
      0092D3 AE 16 90         [ 2] 3515 	addw x,#2
      0092D6 72 B0 00 1F      [ 2] 3516 	addw x,ptr16  
      0092DA 90 CE 00         [ 4] 3517 	call puts 
      0092DD 05 90 C3         [ 2] 3518 	jp 20$ 
      0013D7                       3519 30$:
      0092E0 00 1F            [ 1] 3520 	ld a,#SPACE 
      0092E2 25 0A 3B         [ 4] 3521 	call putc 
      0092E5 00 04 4B         [ 4] 3522 	call cmd_name
      0092E8 00 72 F0         [ 4] 3523 	call prt_cmd_name
      0092EB 01 5B            [ 1] 3524 	ld a,#SPACE 
      0092ED 02 54 CF         [ 4] 3525 	call putc 
      0013E7                       3526 31$:
      0092F0 00 22            [ 2] 3527 	ldw x,(XSAVE,sp)
      0092F2 A6 84 81         [ 2] 3528 	addw x,#2
      0092F5 20 A8            [ 2] 3529 	jra 1$
                                   3530 ;; TK_VAR 
      0013EE                       3531 4$:
                                   3532 ;	ld a,#SPACE 
                                   3533 ;	call putc 
      0092F5 CD 89 E3         [ 4] 3534 	call var_name
      0092F8 A1 85 27         [ 4] 3535 	call putc 
      0092FB 0A A1            [ 2] 3536 	jra 31$
                                   3537 ;; TK_INTGR
      0013F6                       3538 5$:
                                   3539 ;	ld a,#SPACE 
                                   3540 ;	call putc
      0092FD 06 27 03         [ 4] 3541 	call print_int 
      009300 CC 88            [ 2] 3542 	jra 31$
                                   3543 ;; TK_QSTR
      0013FB                       3544 6$:
      009302 F1 03            [ 2] 3545 	ldw x,(XSAVE,sp)
      009303 72 BB 00 17      [ 2] 3546 	addw x,ptr16 
      009303 CD 91 15         [ 4] 3547 	call prt_quote  
      009306 72 B0 00 17      [ 2] 3548 	subw x,ptr16  
      009306 89 CD 89         [ 2] 3549 	jp 1$
                                   3550 ;; TK_CHAR 
      00140B                       3551 7$:
      009309 E3 A1            [ 1] 3552 	ld a,#'\ 
      00930B 32 27 03         [ 4] 3553 	call putc 
      00930E CC               [ 1] 3554 	ld a,xh 
      00930F 88 F1 A0         [ 4] 3555 	call putc 
      009311 1E 03            [ 2] 3556 	ldw x,(XSAVE,sp)
      009311 CD               [ 2] 3557 	incw x 
      009312 92 27 A1         [ 2] 3558 	jp 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009315 84 27            [ 1] 3559 8$: cp a,#TK_COLON 
      009317 03 CC            [ 1] 3560 	jrne 9$
      009319 88 F1            [ 1] 3561 	ld a,#':
      00931B                       3562 81$:
      00931B 90 93 85         [ 4] 3563 	call putc
      001423                       3564 82$:
      00931E FF 81            [ 2] 3565 	ldw x,(XSAVE,sp)
      009320 CC 13 96         [ 2] 3566 	jp 1$ 
      001428                       3567 9$: 
      009320 CE 00            [ 1] 3568 	cp a,#TK_SHARP
      009322 1D C3            [ 1] 3569 	jrugt 10$ 
      009324 00 1F            [ 1] 3570 	sub a,#TK_ARRAY 
      009326 2B 01            [ 1] 3571 	clrw y 
      009328 81 97            [ 1] 3572 	ld yl,a
      009329 72 A9 14 7E      [ 2] 3573 	addw y,#single_char 
      009329 52 06            [ 1] 3574 	ld a,(y)
      00932B 1F 05            [ 2] 3575 	jra 81$ 
      00143A                       3576 10$: 
      00932D FE 1F            [ 1] 3577 	cp a,#TK_MINUS 
      00932F 01 AE            [ 1] 3578 	jrugt 11$
      009331 7F FF            [ 1] 3579 	sub a,#TK_PLUS 
      009333 1F 03            [ 1] 3580 	clrw y 
      009335 CD 90            [ 1] 3581 	ld yl,a 
      009337 EA 4D 27 31      [ 2] 3582 	addw y,#add_char 
      00933B A1 02            [ 1] 3583 	ld a,(y)
      00933D 27 07            [ 2] 3584 	jra 81$
      00144C                       3585 11$:
      00933F A1 01            [ 1] 3586     cp a,#TK_MOD 
      009341 27 06            [ 1] 3587 	jrugt 12$
      009343 CC 88            [ 1] 3588 	sub a,#TK_MULT
      009345 F1 85            [ 1] 3589 	clrw y 
      009347 1F 05            [ 1] 3590 	ld yl,a 
      009349 72 A9 14 85      [ 2] 3591 	addw y,#mul_char
      009349 85 1F            [ 1] 3592 	ld a,(y)
      00934B 01 C2            [ 2] 3593 	jra 81$
      00934C                       3594 12$:
      00934C CE 00            [ 1] 3595 	sub a,#TK_GT  
      00934E 1D               [ 1] 3596 	sll a 
      00934F 1F               [ 1] 3597 	clrw x 
      009350 05               [ 1] 3598 	ld xl,a 
      009351 C3 00 1F         [ 2] 3599 	addw x,#relop_str 
      009354 2A               [ 2] 3600 	ldw x,(x)
      009355 3C FE 13         [ 4] 3601 	call puts 
      009358 01 2A            [ 2] 3602 	jra 82$
      00146C                       3603 20$: 
      00935A 11 1E            [ 1] 3604 	ld a,#CR 
      00935C 05 E6 02         [ 4] 3605 	call putc
      00935F C7 00            [ 1] 3606 	ld a,(WIDTH_SAV,sp) 
      009361 0E 72 5F         [ 1] 3607 	ld tab_width,a 
      009364 00 0D            [ 1] 3608 	ld a,(BASE_SAV,sp) 
      009366 72 BB 00         [ 1] 3609 	ld base,a
      00147B                       3610 	_drop VSIZE 
      009369 0D 20            [ 2]    1     addw sp,#VSIZE 
      00936B E3               [ 4] 3611 	ret 
                                   3612 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00936C 40 28 29 2C 23        3613 single_char: .byte '@','(',')',',','#'
      00936C 1E 05                 3614 add_char: .byte '+','-'
      00936E E6 02 CD              3615 mul_char: .byte '*','/','%'
      009371 93 ED 1E 05 E6 02 C7  3616 relop_str: .word gt,equal,ge,lt,le,ne 
             00 0E 72 5F 00
      00937D 0D 72                 3617 gt: .asciz ">"
      00937F BB 00                 3618 equal: .asciz "="
      009381 0D C3 00              3619 ge: .asciz ">="
      009384 1F 2A                 3620 lt: .asciz "<"
      009386 0B 1F 05              3621 le: .asciz "<="
      009389 FE 13 03              3622 ne:  .asciz "<>"
                                   3623 
                                   3624 
                                   3625 ;---------------------------------
                                   3626 ; BASIC: PRINT|? arg_list 
                                   3627 ; print values from argument list
                                   3628 ;----------------------------------
                           000001  3629 	COMMA=1
                           000001  3630 	VSIZE=1
      0014A3                       3631 print:
      00938C 2C 04            [ 1] 3632 push #0 ; local variable COMMA 
      0014A5                       3633 reset_comma:
      00938E 1E 05            [ 1] 3634 	clr (COMMA,sp)
      0014A7                       3635 prt_loop:
      009390 20 DC 63         [ 4] 3636 	call next_token
      009392 A1 02            [ 1] 3637 	cp a,#CMD_END 
      009392 5B 06            [ 1] 3638 	jrult print_exit ; colon or end of line 
      009394 81 02            [ 1] 3639 	cp a,#TK_QSTR
      009395 27 12            [ 1] 3640 	jreq 1$
      009395 F6 5C            [ 1] 3641 	cp a,#TK_CHAR 
      009397 A4 0F            [ 1] 3642 	jreq 2$ 
      009399 88 0D            [ 1] 3643 	cp a,#TK_CFUNC 
      00939B 01 27            [ 1] 3644 	jreq 3$
      00939D 09 F6            [ 1] 3645 	cp a,#TK_COMMA 
      00939F CD 83            [ 1] 3646 	jreq 4$
      0093A1 20 5C            [ 1] 3647 	cp a,#TK_SHARP 
      0093A3 0A 01            [ 1] 3648 	jreq 5$
      0093A5 20 F3            [ 2] 3649 	jra 7$ 
      0014C4                       3650 1$:	; print string 
      0093A7 84 81 B3         [ 4] 3651 	call puts
      0093A9 20 DC            [ 2] 3652 	jra reset_comma
      0014C9                       3653 2$:	; print character 
      0093A9 A6               [ 1] 3654 	ld a,xl 
      0093AA 22 CD 83         [ 4] 3655 	call putc 
      0093AD 20 F6            [ 2] 3656 	jra reset_comma 
      0014CF                       3657 3$: ; print character function value  	
      0093AF 27               [ 4] 3658 	call (x)
      0093B0 2D               [ 1] 3659 	ld a,xl 
      0093B1 5C A1 20         [ 4] 3660 	call putc
      0093B4 25 0C            [ 2] 3661 	jra reset_comma 
      0014D6                       3662 4$: ; set comma state 
      0093B6 CD 83            [ 1] 3663 	ld a,#255 
      0093B8 20 A1            [ 1] 3664 	ld (COMMA,sp),a  
      0093BA 5C 26 F1         [ 2] 3665 	jp prt_loop   
      0093BD                       3666 5$: ; # character must be followed by an integer   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093BD CD 83 20         [ 4] 3667 	call next_token
      0093C0 20 EC            [ 1] 3668 	cp a,#TK_INTGR 
      0093C2 88 A6            [ 1] 3669 	jreq 6$
      0093C4 5C CD 83         [ 2] 3670 	jp syntax_error 
      0014E7                       3671 6$: ; set tab width
      0093C7 20               [ 1] 3672 	ld a,xl 
      0093C8 84 A0            [ 1] 3673 	and a,#15 
      0093CA 07 C7 00         [ 1] 3674 	ld tab_width,a 
      0093CD 0E 72            [ 2] 3675 	jra reset_comma 
      0014EF                       3676 7$:	
      0014EF                       3677 	_unget_token
      0093CF 5F 00 0D 90 AE   [ 1]    1     mov in,in.saved
      0093D4 8C 8A 72         [ 4] 3678 	call relation 
      0093D7 B9 00            [ 1] 3679 	cp a,#TK_INTGR
      0093D9 0D 90            [ 1] 3680 	jreq 8$
      0014FB                       3681 	_unget_token
      0093DB F6 20 DF A6 22   [ 1]    1     mov in,in.saved
      0093E0 CD 83 20         [ 2] 3682 	jp print_exit 
      0093E3 5C 81 00         [ 4] 3683 8$: call print_int 
      0093E5 20 9D            [ 2] 3684 	jra reset_comma 
      001508                       3685 print_exit:
      0093E5 1D 00            [ 1] 3686 	tnz (COMMA,sp)
      0093E7 27 9F            [ 1] 3687 	jrne 9$
      0093E9 44 AB            [ 1] 3688 	ld a,#CR 
      0093EB 41 81 A0         [ 4] 3689     call putc 
      0093ED                       3690 9$:	_drop VSIZE 
      0093ED 52 05            [ 2]    1     addw sp,#VSIZE 
      0093EF 6B               [ 4] 3691 	ret 
                                   3692 
      001514                       3693 print_type: 
                                   3694 
                                   3695 ;----------------------
                                   3696 ; 'save_context' and
                                   3697 ; 'rest_context' must be 
                                   3698 ; called at the same 
                                   3699 ; call stack depth 
                                   3700 ; i.e. SP must have the 
                                   3701 ; save value at  
                                   3702 ; entry point of both 
                                   3703 ; routine. 
                                   3704 ;---------------------
                           000004  3705 	CTXT_SIZE=4 ; size of saved data 
                                   3706 ;--------------------
                                   3707 ; save current BASIC
                                   3708 ; interpreter context 
                                   3709 ; on stack 
                                   3710 ;--------------------
      001514                       3711 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001514                       3712 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001514                       3713 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001514                       3714 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      001514                       3715 save_context:
      0093F0 05 C6 00         [ 2] 3716 	ldw x,basicptr 
      0093F3 0B 6B            [ 2] 3717 	ldw (BPTR,sp),x
      0093F5 01 C6 00         [ 1] 3718 	ld a,in 
      0093F8 25 6B            [ 1] 3719 	ld (IN,sp),a
      0093FA 02 CF 00         [ 1] 3720 	ld a,count 
      0093FD 18 FE            [ 1] 3721 	ld (CNT,sp),a  
      0093FF 35               [ 4] 3722 	ret
                                   3723 
                                   3724 ;-----------------------
                                   3725 ; restore previously saved 
                                   3726 ; BASIC interpreter context 
                                   3727 ; from stack 
                                   3728 ;-------------------------
      001524                       3729 rest_context:
      009400 0A 00            [ 2] 3730 	ldw x,(BPTR,sp)
      009402 0B 35 05         [ 2] 3731 	ldw basicptr,x 
      009405 00 25            [ 1] 3732 	ld a,(IN,sp)
      009407 CD 8A 80         [ 1] 3733 	ld in,a
      00940A A6 20            [ 1] 3734 	ld a,(CNT,sp)
      00940C CD 83 20         [ 1] 3735 	ld count,a  
      00940F 72               [ 4] 3736 	ret
                                   3737 
                                   3738 
                                   3739 
                                   3740 ;------------------------------------------
                                   3741 ; BASIC: INPUT [string]var[,[string]var]
                                   3742 ; input value in variables 
                                   3743 ; [string] optionally can be used as prompt 
                                   3744 ;-----------------------------------------
                           000001  3745 	CX_BPTR=1
                           000003  3746 	CX_IN=3
                           000004  3747 	CX_CNT=4
                           000005  3748 	SKIP=5
                           000006  3749 	VAR_ADDR=6
                           000007  3750 	VSIZE=7
      001534                       3751 input_var:
      001534                       3752 	_vars VSIZE 
      009410 5F 00            [ 2]    1     sub sp,#VSIZE 
      001536                       3753 input_loop:
      009412 25 AE            [ 1] 3754 	clr (SKIP,sp)
      009414 00 03 9F         [ 4] 3755 	call next_token 
      009417 11 05            [ 1] 3756 	cp a,#TK_QSTR 
      009419 2B 03            [ 1] 3757 	jrne 1$ 
      00941B CC 94 EC         [ 4] 3758 	call puts 
      00941E 03 05            [ 1] 3759 	cpl (SKIP,sp)
      00941E 72 D6 00         [ 4] 3760 	call next_token 
      009421 18 5C            [ 1] 3761 1$: cp a,#TK_VAR  
      009423 1F 03            [ 1] 3762 	jreq 2$ 
      009425 72 DE 00         [ 2] 3763 	jp syntax_error
      009428 18 4D            [ 2] 3764 2$:	ldw (VAR_ADDR,sp),x 
      00942A 2B 0A            [ 1] 3765 	tnz (SKIP,sp)
      00942C A1 02            [ 1] 3766 	jrne 21$ 
      00942E 27 4B A1         [ 4] 3767 	call var_name 
      009431 03 27 57         [ 4] 3768 	call putc   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00155A                       3769 21$:
      009434 20 64            [ 1] 3770 	ld a,#':
      009436 CD 02 A0         [ 4] 3771 	call putc 
      009436 A1 85 27         [ 4] 3772 	call save_context 
      009439 34 A1 84 27      [ 1] 3773 	clr count  
      00943D 38 A3 96         [ 4] 3774 	call readln 
      009440 20 26 14         [ 2] 3775 	ldw x,#tib 
      009443 A6 27 CD         [ 1] 3776 	push count
      009446 83 20            [ 1] 3777 	push #0 
      009448 1E 03 1C         [ 2] 3778 	addw x,(1,sp)
      00944B 00               [ 2] 3779 	incw x 
      001575                       3780 	_drop 2 
      00944C 02 72            [ 2]    1     addw sp,#2 
      00944E BB 00 18 CD      [ 1] 3781 	clr in 
      009452 83 33 CC         [ 4] 3782 	call get_token
      009455 94 EC            [ 1] 3783 	cp a,#TK_INTGR
      009457 27 06            [ 1] 3784 	jreq 3$ 
      009457 A6 20 CD         [ 4] 3785 	call rest_context 
      00945A 83 20 CD         [ 2] 3786 	jp syntax_error
      00945D 90 59            [ 2] 3787 3$: ldw y,(VAR_ADDR,sp) 
      00945F CD 93            [ 2] 3788 	ldw (y),x 
      009461 95 A6 20         [ 4] 3789 	call rest_context
      009464 CD 83 20         [ 4] 3790 	call next_token 
      009467 A1 09            [ 1] 3791 	cp a,#TK_COMMA 
      009467 1E 03            [ 1] 3792 	jreq input_loop 
      009469 1C 00            [ 1] 3793 	cp a,#TK_COLON 
      00946B 02 20            [ 2] 3794     jrule input_exit 
      00946D A8 08 71         [ 2] 3795 	jp syntax_error 
      00946E                       3796 input_exit:
      00159D                       3797 	_drop VSIZE 
      00946E CD 93            [ 2]    1     addw sp,#VSIZE 
      009470 E5               [ 4] 3798 	ret 
                                   3799 
                                   3800 
                                   3801 ;---------------------
                                   3802 ; BASIC: REMARK | ' 
                                   3803 ; skip comment to end of line 
                                   3804 ;---------------------- 
      0015A0                       3805 remark:
      009471 CD 83 20 20 F1   [ 1] 3806 	mov in,count 
      009476 81               [ 4] 3807  	ret 
                                   3808 
                                   3809 
                                   3810 ;---------------------
                                   3811 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3812 ; read in loop 'addr'  
                                   3813 ; apply & 'mask' to value 
                                   3814 ; loop while result==0.  
                                   3815 ; 'xor_mask' is used to 
                                   3816 ; invert the wait logic.
                                   3817 ; i.e. loop while not 0.
                                   3818 ;---------------------
                           000001  3819 	XMASK=1 
                           000002  3820 	MASK=2
                           000003  3821 	ADDR=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                           000004  3822 	VSIZE=4
      0015A6                       3823 wait: 
      0015A6                       3824 	_vars VSIZE
      009476 CD 8A            [ 2]    1     sub sp,#VSIZE 
      009478 80 20            [ 1] 3825 	clr (XMASK,sp) 
      00947A EC 10 6A         [ 4] 3826 	call arg_list 
      00947B A1 02            [ 1] 3827 	cp a,#2
      00947B 1E 03            [ 1] 3828 	jruge 0$
      00947D 72 BB 00         [ 2] 3829 	jp syntax_error 
      009480 18 CD            [ 1] 3830 0$:	cp a,#3
      009482 93 A9            [ 1] 3831 	jrult 1$
      009484 72               [ 2] 3832 	popw x 
      009485 B0               [ 1] 3833 	ld a,xl
      009486 00 18            [ 1] 3834 	ld (XMASK,sp),a 
      009488 CC               [ 2] 3835 1$: popw x ; mask 
      009489 94               [ 1] 3836 	ld a,xl 
      00948A 16 02            [ 1] 3837 	ld (MASK,sp),a 
      00948B 85               [ 2] 3838 	popw x ; address 
      00948B A6               [ 1] 3839 2$:	ld a,(x)
      00948C 5C CD            [ 1] 3840 	and a,(MASK,sp)
      00948E 83 20            [ 1] 3841 	xor a,(XMASK,sp)
      009490 9E CD            [ 1] 3842 	jreq 2$ 
      0015C8                       3843 	_drop VSIZE 
      009492 83 20            [ 2]    1     addw sp,#VSIZE 
      009494 1E               [ 4] 3844 	ret 
                                   3845 
                                   3846 ;---------------------
                                   3847 ; BASIC: BSET addr,mask
                                   3848 ; set bits at 'addr' corresponding 
                                   3849 ; to those of 'mask' that are at 1.
                                   3850 ; arguments:
                                   3851 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3852 ;   mask        mask|addr
                                   3853 ; output:
                                   3854 ;	none 
                                   3855 ;--------------------------
      0015CB                       3856 bit_set:
      009495 03 5C CC         [ 4] 3857 	call arg_list 
      009498 94 16            [ 1] 3858 	cp a,#2	 
      00949A A1 01            [ 1] 3859 	jreq 1$ 
      00949C 26 0A A6         [ 2] 3860 	jp syntax_error
      0015D5                       3861 1$: 
      00949F 3A               [ 2] 3862 	popw x ; mask 
      0094A0 9F               [ 1] 3863 	ld a,xl 
      0094A0 CD               [ 2] 3864 	popw x ; addr  
      0094A1 83               [ 1] 3865 	or a,(x)
      0094A2 20               [ 1] 3866 	ld (x),a
      0094A3 81               [ 4] 3867 	ret 
                                   3868 
                                   3869 ;---------------------
                                   3870 ; BASIC: BRES addr,mask
                                   3871 ; reset bits at 'addr' corresponding 
                                   3872 ; to those of 'mask' that are at 1.
                                   3873 ; arguments:
                                   3874 ; 	addr 		memory address RAM|PERIPHERAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3875 ;   mask	    ~mask&*addr  
                                   3876 ; output:
                                   3877 ;	none 
                                   3878 ;--------------------------
      0015DB                       3879 bit_reset:
      0094A3 1E 03 CC         [ 4] 3880 	call arg_list 
      0094A6 94 16            [ 1] 3881 	cp a,#2  
      0094A8 27 03            [ 1] 3882 	jreq 1$ 
      0094A8 A1 0A 22         [ 2] 3883 	jp syntax_error
      0015E5                       3884 1$: 
      0094AB 0E               [ 2] 3885 	popw x ; mask 
      0094AC A0               [ 1] 3886 	ld a,xl 
      0094AD 06               [ 1] 3887 	cpl a 
      0094AE 90               [ 2] 3888 	popw x ; addr  
      0094AF 5F               [ 1] 3889 	and a,(x)
      0094B0 90               [ 1] 3890 	ld (x),a 
      0094B1 97               [ 4] 3891 	ret 
                                   3892 
                                   3893 ;---------------------
                                   3894 ; BASIC: BTOGL addr,mask
                                   3895 ; toggle bits at 'addr' corresponding 
                                   3896 ; to those of 'mask' that are at 1.
                                   3897 ; arguments:
                                   3898 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3899 ;   mask	    mask^*addr  
                                   3900 ; output:
                                   3901 ;	none 
                                   3902 ;--------------------------
      0015EC                       3903 bit_toggle:
      0094B2 72 A9 94         [ 4] 3904 	call arg_list 
      0094B5 FE 90            [ 1] 3905 	cp a,#2 
      0094B7 F6 20            [ 1] 3906 	jreq 1$ 
      0094B9 E6 08 71         [ 2] 3907 	jp syntax_error
      0094BA 85               [ 2] 3908 1$: popw x ; mask 
      0094BA A1               [ 1] 3909 	ld a,xl 
      0094BB 11               [ 2] 3910 	popw x ; addr  
      0094BC 22               [ 1] 3911 	xor a,(x)
      0094BD 0E               [ 1] 3912 	ld (x),a 
      0094BE A0               [ 4] 3913 	ret 
                                   3914 
                                   3915 
                                   3916 ;---------------------
                                   3917 ; BASIC: BTEST(addr,bit)
                                   3918 ; return bit value at 'addr' 
                                   3919 ; bit is in range {0..7}.
                                   3920 ; arguments:
                                   3921 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3922 ;   bit 	    bit position {0..7}  
                                   3923 ; output:
                                   3924 ;	none 
                                   3925 ;--------------------------
      0015FC                       3926 bit_test:
      0094BF 10 90 5F         [ 4] 3927 	call func_args 
      0094C2 90 97            [ 1] 3928 	cp a,#2
      0094C4 72 A9            [ 1] 3929 	jreq 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094C6 95 03 90         [ 2] 3930 	jp syntax_error
      001606                       3931 0$:	
      0094C9 F6               [ 2] 3932 	popw x 
      0094CA 20               [ 1] 3933 	ld a,xl 
      0094CB D4 07            [ 1] 3934 	and a,#7
      0094CC 88               [ 1] 3935 	push a   
      0094CC A1 22            [ 1] 3936 	ld a,#1 
      0094CE 22 0E            [ 1] 3937 1$: tnz (1,sp)
      0094D0 A0 20            [ 1] 3938 	jreq 2$
      0094D2 90               [ 1] 3939 	sll a 
      0094D3 5F 90            [ 1] 3940 	dec (1,sp)
      0094D5 97 72            [ 2] 3941 	jra 1$
      001616                       3942 2$: _drop 1 
      0094D7 A9 95            [ 2]    1     addw sp,#1 
      0094D9 05               [ 2] 3943 	popw x 
      0094DA 90               [ 1] 3944 	and a,(x)
      0094DB F6 20            [ 1] 3945 	jreq 3$
      0094DD C2 01            [ 1] 3946 	ld a,#1 
      0094DE 5F               [ 1] 3947 3$:	clrw x 
      0094DE A0               [ 1] 3948 	ld xl,a 
      0094DF 31 48            [ 1] 3949 	ld a,#TK_INTGR
      0094E1 5F               [ 4] 3950 	ret
                                   3951 
                                   3952 
                                   3953 ;--------------------
                                   3954 ; BASIC: POKE addr,byte
                                   3955 ; put a byte at addr 
                                   3956 ;--------------------
      001623                       3957 poke:
      0094E2 97 1C 95         [ 4] 3958 	call arg_list 
      0094E5 08 FE            [ 1] 3959 	cp a,#2
      0094E7 CD 83            [ 1] 3960 	jreq 1$
      0094E9 33 20 B7         [ 2] 3961 	jp syntax_error
      0094EC                       3962 1$:	
      0094EC A6               [ 2] 3963 	popw x  
      0094ED 0D               [ 1] 3964     ld a,xl 
      0094EE CD               [ 2] 3965 	popw x 
      0094EF 83               [ 1] 3966 	ld (x),a 
      0094F0 20               [ 4] 3967 	ret 
                                   3968 
                                   3969 ;-----------------------
                                   3970 ; BASIC: PEEK(addr)
                                   3971 ; get the byte at addr 
                                   3972 ; input:
                                   3973 ;	none 
                                   3974 ; output:
                                   3975 ;	X 		value 
                                   3976 ;-----------------------
      001632                       3977 peek:
      0094F1 7B 02 C7         [ 4] 3978 	call func_args
      0094F4 00 25            [ 1] 3979 	cp a,#1
      0094F6 7B 01            [ 1] 3980 	jreq 1$
      0094F8 C7 00 0B         [ 2] 3981 	jp syntax_error
      0094FB 5B               [ 2] 3982 1$:	popw x 
      0094FC 05               [ 1] 3983 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094FD 81               [ 1] 3984 	clrw x 
      0094FE 40               [ 1] 3985 	ld xl,a 
      0094FF 28 29            [ 1] 3986 	ld a,#TK_INTGR
      009501 2C               [ 4] 3987 	ret 
                                   3988 
                                   3989 ;----------------------------
                                   3990 ; BASIC: XPEEK(page,addr)
                                   3991 ; read extended memory byte
                                   3992 ; page in range {0,1,2}
                                   3993 ;----------------------------
      001643                       3994 xpeek:
      009502 23 2B 2D         [ 4] 3995 	call func_args 
      009505 2A 2F            [ 1] 3996 	cp a,#2 
      009507 25 95            [ 1] 3997 	jreq 1$
      009509 14 95 16         [ 2] 3998 	jp syntax_error
      00164D                       3999 1$: 
      00950C 95               [ 2] 4000 	popw x  
      00950D 18 95 1B         [ 2] 4001 	ldw farptr+1,x 
      009510 95               [ 2] 4002 	popw x 
      009511 1D               [ 1] 4003 	ld a,xl 
      009512 95 20 3E         [ 1] 4004 	ld farptr,a 
      009515 00               [ 1] 4005 	clrw x
      009516 3D 00 3E 3D      [ 5] 4006 	ldf a,[farptr]
      00951A 00               [ 1] 4007 	ld xl,a 
      00951B 3C 00            [ 1] 4008 	ld a,#TK_INTGR 
      00951D 3C               [ 4] 4009 	ret 
                                   4010 
                                   4011 ;---------------------------
                                   4012 ; BASIC IF expr : instructions
                                   4013 ; evaluate expr and if true 
                                   4014 ; execute instructions on same line. 
                                   4015 ;----------------------------
      00165F                       4016 if: 
      00951E 3D 00 3C         [ 4] 4017 	call relation 
      009521 3E 00            [ 1] 4018 	cp a,#TK_INTGR
      009523 27 03            [ 1] 4019 	jreq 1$ 
      009523 4B 00 71         [ 2] 4020 	jp syntax_error
      009525 4F               [ 1] 4021 1$:	clr a 
      009525 0F               [ 2] 4022 	tnzw x 
      009526 01 05            [ 1] 4023 	jrne 9$  
                                   4024 ;skip to next line
      009527 55 00 03 00 01   [ 1] 4025 	mov in,count
      009527 CD               [ 4] 4026 9$:	ret 
                                   4027 
                                   4028 ;------------------------
                                   4029 ; BASIC: FOR var=expr 
                                   4030 ; set variable to expression 
                                   4031 ; leave variable address 
                                   4032 ; on stack and set
                                   4033 ; FLOOP bit in 'flags'
                                   4034 ;-----------------
                           000001  4035 	RETL1=1 ; return address  
                           000003  4036 	FSTEP=3  ; variable increment
                           000005  4037 	LIMIT=5 ; loop limit 
                           000007  4038 	CVAR=7   ; control variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                           000009  4039 	INW=9   ;  in.w saved
                           00000B  4040 	BPTR=11 ; baseptr saved
                           00000A  4041 	VSIZE=10  
      001673                       4042 for: ; { -- var_addr }
      009528 89               [ 2] 4043 	popw x ; call return address 
      001674                       4044 	_vars VSIZE 
      009529 E3 A1            [ 2]    1     sub sp,#VSIZE 
      00952B 02               [ 2] 4045 	pushw x  ; RETL1 
      00952C 25 5A            [ 1] 4046 	ld a,#TK_VAR 
      00952E A1 02 27         [ 4] 4047 	call expect
      009531 12 A1            [ 2] 4048 	ldw (CVAR,sp),x  ; control variable 
      009533 03 27 13         [ 4] 4049 	call let_var 
      009536 A1 82 27 15      [ 1] 4050 	bset flags,#FLOOP 
                                   4051 ; open space on stack for loop data 
      00953A A1               [ 1] 4052 	clrw x 
      00953B 09 27            [ 2] 4053 	ldw (BPTR,sp),x 
      00953D 18 A1            [ 2] 4054 	ldw (INW,sp),x 
      00953F 0A 27 1B         [ 4] 4055 	call next_token 
      009542 20 2B            [ 1] 4056 	cp a,#TK_CMD 
      009544 27 03            [ 1] 4057 	jreq 1$
      009544 CD 83 33         [ 2] 4058 	jp syntax_error
      001694                       4059 1$:  
      009547 20 DC 9C         [ 2] 4060 	cpw x,#to 
      009549 27 03            [ 1] 4061 	jreq to
      009549 9F CD 83         [ 2] 4062 	jp syntax_error 
                                   4063 
                                   4064 ;-----------------------------------
                                   4065 ; BASIC: TO expr 
                                   4066 ; second part of FOR loop initilization
                                   4067 ; leave limit on stack and set 
                                   4068 ; FTO bit in 'flags'
                                   4069 ;-----------------------------------
      00169C                       4070 to: ; { var_addr -- var_addr limit step }
      00954C 20 20 D6 23 03   [ 2] 4071 	btjt flags,#FLOOP,1$
      00954F CC 08 71         [ 2] 4072 	jp syntax_error
      00954F FD 9F CD         [ 4] 4073 1$: call relation  
      009552 83 20            [ 1] 4074 	cp a,#TK_INTGR 
      009554 20 CF            [ 1] 4075 	jreq 2$ 
      009556 CC 08 71         [ 2] 4076 	jp syntax_error
      009556 A6 FF            [ 2] 4077 2$: ldw (LIMIT,sp),x
                                   4078 ;	ldw x,in.w 
      009558 6B 01 CC         [ 4] 4079 	call next_token
      00955B 95 27            [ 1] 4080 	cp a,#TK_NONE  
      00955D 27 0E            [ 1] 4081 	jreq 4$ 
      00955D CD 89            [ 1] 4082 	cp a,#TK_CMD
      00955F E3 A1            [ 1] 4083 	jrne 3$
      009561 84 27 03         [ 2] 4084 	cpw x,#step 
      009564 CC 88            [ 1] 4085 	jreq step
      0016C0                       4086 3$:	
      0016C0                       4087 	_unget_token   	 
      009566 F1 00 02 00 01   [ 1]    1     mov in,in.saved
      009567                       4088 4$:	
      009567 9F A4 0F         [ 2] 4089 	ldw x,#1   ; default step  
      00956A C7 00            [ 2] 4090 	ldw (FSTEP,sp),x 
      00956C 25 20            [ 2] 4091 	jra store_loop_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4092 
                                   4093 
                                   4094 ;----------------------------------
                                   4095 ; BASIC: STEP expr 
                                   4096 ; optional third par of FOR loop
                                   4097 ; initialization. 	
                                   4098 ;------------------------------------
      0016CC                       4099 step: ; {var limit -- var limit step}
      00956E B6 04 00 23 03   [ 2] 4100 	btjt flags,#FLOOP,1$
      00956F CC 08 71         [ 2] 4101 	jp syntax_error
      00956F 55 00 03         [ 4] 4102 1$: call relation
      009572 00 02            [ 1] 4103 	cp a,#TK_INTGR
      009574 CD 92            [ 1] 4104 	jreq 2$
      009576 27 A1 84         [ 2] 4105 	jp syntax_error
      009579 27 08            [ 2] 4106 2$:	ldw (FSTEP,sp),x ; step
                                   4107 ; leave loop back entry point on cstack 
                                   4108 ; cstack is 1 call deep from interpreter
      0016E0                       4109 store_loop_addr:
      00957B 55 00 03         [ 2] 4110 	ldw x,basicptr  
      00957E 00 02            [ 2] 4111 	ldw (BPTR,sp),x 
      009580 CC 95 88         [ 2] 4112 	ldw x,in.w 
      009583 CD 8A            [ 2] 4113 	ldw (INW,sp),x   
      009585 80 20 9D 23      [ 1] 4114 	bres flags,#FLOOP 
      009588 72 5C 00 20      [ 1] 4115 	inc loop_depth  
      009588 0D               [ 4] 4116 	ret 
                                   4117 
                                   4118 ;--------------------------------
                                   4119 ; BASIC: NEXT var 
                                   4120 ; FOR loop control 
                                   4121 ; increment variable with step 
                                   4122 ; and compare with limit 
                                   4123 ; loop if threshold not crossed.
                                   4124 ; else stack. 
                                   4125 ; and decrement 'loop_depth' 
                                   4126 ;--------------------------------
      0016F3                       4127 next: ; {var limit step retl1 -- [var limit step ] }
      009589 01 26 05 A6      [ 1] 4128 	tnz loop_depth 
      00958D 0D CD            [ 1] 4129 	jrne 1$ 
      00958F 83 20 5B         [ 2] 4130 	jp syntax_error 
      0016FC                       4131 1$: 
      009592 01 81            [ 1] 4132 	ld a,#TK_VAR 
      009594 CD 10 58         [ 4] 4133 	call expect
                                   4134 ; check for good variable after NEXT 	 
      009594 13 07            [ 2] 4135 	cpw x,(CVAR,sp)
      009594 CE 00            [ 1] 4136 	jreq 2$  
      009596 05 1F 03         [ 2] 4137 	jp syntax_error ; not the good one 
      001708                       4138 2$: ; increment variable 
      009599 C6               [ 2] 4139 	ldw x,(x)  ; get var value 
      00959A 00 02 6B         [ 2] 4140 	addw x,(FSTEP,sp) ; var+step 
      00959D 05 C6            [ 2] 4141 	ldw y,(CVAR,sp)
      00959F 00 04            [ 2] 4142 	ldw (y),x ; save var new value 
                                   4143 ; check sign of STEP  
      0095A1 6B 06            [ 1] 4144 	ld a,#0x80
      0095A3 81 03            [ 1] 4145 	bcp a,(FSTEP,sp)
      0095A4 2A 06            [ 1] 4146 	jrpl 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4147 ;negative step 
      0095A4 1E 03            [ 2] 4148 	cpw x,(LIMIT,sp)
      0095A6 CF 00            [ 1] 4149 	jrslt loop_done
      0095A8 05 7B            [ 2] 4150 	jra loop_back 
      00171C                       4151 4$: ; positive step
      0095AA 05 C7            [ 2] 4152 	cpw x,(LIMIT,sp)
      0095AC 00 02            [ 1] 4153 	jrsgt loop_done
      001720                       4154 loop_back:
      0095AE 7B 06            [ 2] 4155 	ldw x,(BPTR,sp)
      0095B0 C7 00 04         [ 2] 4156 	ldw basicptr,x 
      0095B3 81 01 00 23 05   [ 2] 4157 	btjf flags,#FRUN,1$ 
      0095B4 E6 02            [ 1] 4158 	ld a,(2,x)
      0095B4 52 07 03         [ 1] 4159 	ld count,a
      0095B6 1E 09            [ 2] 4160 1$:	ldw x,(INW,sp)
      0095B6 0F 05 CD         [ 2] 4161 	ldw in.w,x 
      0095B9 89               [ 4] 4162 	ret 
      001735                       4163 loop_done:
                                   4164 	; remove loop data from stack  
      0095BA E3               [ 2] 4165 	popw x
      001736                       4166 	_drop VSIZE 
      0095BB A1 02            [ 2]    1     addw sp,#VSIZE 
      0095BD 26 08 CD 83      [ 1] 4167 	dec loop_depth 
                                   4168 ;	pushw x 
                                   4169 ;	ret 
      0095C1 33               [ 2] 4170 	jp (x)
                                   4171 
                                   4172 ;----------------------------
                                   4173 ; called by goto/gosub
                                   4174 ; to get target line number 
                                   4175 ;---------------------------
      00173D                       4176 get_target_line:
      0095C2 03 05 CD         [ 4] 4177 	call relation 
      0095C5 89 E3            [ 1] 4178 	cp a,#TK_INTGR
      0095C7 A1 85            [ 1] 4179 	jreq 1$
      0095C9 27 03 CC         [ 2] 4180 	jp syntax_error
      0095CC 88 F1 1F         [ 4] 4181 1$:	call search_lineno  
      0095CF 06               [ 2] 4182 	tnzw x 
      0095D0 0D 05            [ 1] 4183 	jrne 2$ 
      0095D2 26 06            [ 1] 4184 	ld a,#ERR_NO_LINE 
      0095D4 CD 93 E5         [ 2] 4185 	jp tb_error 
      0095D7 CD               [ 4] 4186 2$:	ret 
                                   4187 
                                   4188 ;------------------------
                                   4189 ; BASIC: GOTO line# 
                                   4190 ; jump to line# 
                                   4191 ; here cstack is 2 call deep from interpreter 
                                   4192 ;------------------------
      001753                       4193 goto:
      0095D8 83 20 00 23 06   [ 2] 4194 	btjt flags,#FRUN,0$ 
      0095DA A6 06            [ 1] 4195 	ld a,#ERR_RUN_ONLY
      0095DA A6 3A CD         [ 2] 4196 	jp tb_error 
      0095DD 83               [ 4] 4197 	ret 
      0095DE 20 CD 95         [ 4] 4198 0$:	call get_target_line
      001761                       4199 jp_to_target:
      0095E1 94 72 5F         [ 2] 4200 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095E4 00 04            [ 1] 4201 	ld a,(2,x)
      0095E6 CD 8B B1         [ 1] 4202 	ld count,a 
      0095E9 AE 16 90 3B      [ 1] 4203 	mov in,#3 
      0095ED 00               [ 4] 4204 	ret 
                                   4205 
                                   4206 
                                   4207 ;--------------------
                                   4208 ; BASIC: GOSUB line#
                                   4209 ; basic subroutine call
                                   4210 ; actual line# and basicptr 
                                   4211 ; are saved on cstack
                                   4212 ; here cstack is 2 call deep from interpreter 
                                   4213 ;--------------------
                           000003  4214 	RET_ADDR=3
                           000005  4215 	RET_INW=5
                           000004  4216 	VSIZE=4  
      00176E                       4217 gosub:
      0095EE 04 4B 00 72 FB   [ 2] 4218 	btjt flags,#FRUN,0$ 
      0095F3 01 5C            [ 1] 4219 	ld a,#ERR_RUN_ONLY
      0095F5 5B 02 72         [ 2] 4220 	jp tb_error 
      0095F8 5F               [ 4] 4221 	ret 
      0095F9 00               [ 2] 4222 0$:	popw x 
      00177A                       4223 	_vars VSIZE  
      0095FA 02 CD            [ 2]    1     sub sp,#VSIZE 
      0095FC 8D               [ 2] 4224 	pushw x 
      0095FD 66 A1 84         [ 2] 4225 	ldw x,basicptr
      009600 27 06            [ 2] 4226 	ldw (RET_ADDR,sp),x 
      009602 CD 95 A4         [ 4] 4227 	call get_target_line  
      009605 CC               [ 2] 4228 	pushw x 
      009606 88 F1 16         [ 2] 4229 	ldw x,in.w 
      009609 06 90            [ 2] 4230 	ldw (RET_INW+2,sp),x
      00960B FF               [ 2] 4231 	popw x 
      00960C CD 95            [ 2] 4232 	jra jp_to_target
                                   4233 
                                   4234 ;------------------------
                                   4235 ; BASIC: RETURN 
                                   4236 ; exit from a subroutine 
                                   4237 ; 
                                   4238 ;------------------------
      00178E                       4239 return:
      00960E A4 CD 89 E3 A1   [ 2] 4240 	btjt flags,#FRUN,0$ 
      009613 09 27            [ 1] 4241 	ld a,#ERR_RUN_ONLY
      009615 A0 A1 01         [ 2] 4242 	jp tb_error 
      001798                       4243 0$:	
      009618 23 03            [ 2] 4244 	ldw x,(RET_ADDR,sp) 
      00961A CC 88 F1         [ 2] 4245 	ldw basicptr,x
      00961D E6 02            [ 1] 4246 	ld a,(2,x)
      00961D 5B 07 81         [ 1] 4247 	ld count,a  
      009620 1E 05            [ 2] 4248 	ldw x,(RET_INW,sp)
      009620 55 00 04         [ 2] 4249 	ldw in.w,x 
      009623 00               [ 2] 4250 	popw x 
      0017A8                       4251 	_drop VSIZE 
      009624 02 81            [ 2]    1     addw sp,#VSIZE 
      009626 89               [ 2] 4252 	pushw x
      009626 52               [ 4] 4253 	ret  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4254 
                                   4255 
                                   4256 ;----------------------------------
                                   4257 ; BASIC: RUN
                                   4258 ; run BASIC program in RAM
                                   4259 ;----------------------------------- 
      0017AC                       4260 run: 
      009627 04 0F 01 CD 90   [ 2] 4261 	btjf flags,#FRUN,0$  
      00962C EA               [ 1] 4262 	clr a 
      00962D A1               [ 4] 4263 	ret
      0017B3                       4264 0$: 
      00962E 02 24 03 CC 88   [ 2] 4265 	btjf flags,#FBREAK,1$
      0017B8                       4266 	_drop 2 
      009633 F1 A1            [ 2]    1     addw sp,#2 
      009635 03 25 04         [ 4] 4267 	call rest_context
      0017BD                       4268 	_drop CTXT_SIZE 
      009638 85 9F            [ 2]    1     addw sp,#CTXT_SIZE 
      00963A 6B 01 85 9F      [ 1] 4269 	bres flags,#FBREAK 
      00963E 6B 02 85 F6      [ 1] 4270 	bset flags,#FRUN 
      009642 14 02 18         [ 2] 4271 	jp interpreter 
      009645 01 27 F9         [ 2] 4272 1$:	ldw x,txtbgn
      009648 5B 04 81         [ 2] 4273 	cpw x,txtend 
      00964B 2B 0C            [ 1] 4274 	jrmi run_it 
      00964B CD 90 EA         [ 2] 4275 	ldw x,#err_no_prog
      00964E A1 02 27         [ 4] 4276 	call puts 
      009651 03 CC 88 F1 01   [ 1] 4277 	mov in,count
      009655 81               [ 4] 4278 	ret 
      0017DE                       4279 run_it:	 
      009655 85 9F 85         [ 4] 4280     call ubound 
      0017E1                       4281 	_drop 2 ; drop return address 
      009658 FA F7            [ 2]    1     addw sp,#2 
                                   4282 ; clear data pointer 
      00965A 81               [ 1] 4283 	clrw x 
      00965B CF 00 06         [ 2] 4284 	ldw data_ptr,x 
      00965B CD 90 EA A1      [ 1] 4285 	clr data_ofs 
      00965F 02 27 03 CC      [ 1] 4286 	clr data_len 
                                   4287 ; initialize BASIC pointer 
      009663 88 F1 1C         [ 2] 4288 	ldw x,txtbgn 
      009665 CF 00 04         [ 2] 4289 	ldw basicptr,x 
      009665 85 9F            [ 1] 4290 	ld a,(2,x)
      009667 43 85 F4         [ 1] 4291 	ld count,a
      00966A F7 81 00 01      [ 1] 4292 	mov in,#3	
      00966C 72 10 00 23      [ 1] 4293 	bset flags,#FRUN 
      00966C CD 90 EA         [ 2] 4294 	jp interpreter 
                                   4295 
                                   4296 
                                   4297 ;----------------------
                                   4298 ; BASIC: END
                                   4299 ; end running program
                                   4300 ;---------------------- 
      001805                       4301 cmd_end: 
                                   4302 ; clean stack 
      00966F A1 02 27         [ 2] 4303 	ldw x,#STACK_EMPTY
      009672 03               [ 1] 4304 	ldw sp,x 
      009673 CC 88 F1         [ 2] 4305 	jp warm_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4306 
                                   4307 
                                   4308 ;-----------------------
                                   4309 ; BASIC: TONE expr1,expr2
                                   4310 ; used TIMER2 channel 1
                                   4311 ; to produce a tone 
                                   4312 ; arguments:
                                   4313 ;    expr1   frequency 
                                   4314 ;    expr2   duration msec.
                                   4315 ;---------------------------
      00180C                       4316 tone:
      009676 85 9F 85         [ 4] 4317 	call arg_list 
      009679 F8 F7            [ 1] 4318 	cp a,#2 
      00967B 81 03            [ 1] 4319 	jreq 1$
      00967C CC 08 71         [ 2] 4320 	jp syntax_error 
      001816                       4321 1$: 
      00967C CD               [ 2] 4322 	popw x ; duration
      00967D 90 E5            [ 2] 4323 	popw y ; frequency 
      001819                       4324 beep:  
      00967F A1               [ 2] 4325 	pushw x 
      009680 02 27 03         [ 2] 4326 	ldw x,#TIM2_CLK_FREQ
      009683 CC               [ 2] 4327 	divw x,y 
                                   4328 ; round to nearest integer 
      009684 88 F1 7A 12      [ 2] 4329 	cpw y,#TIM2_CLK_FREQ/2
      009686 2B 01            [ 1] 4330 	jrmi 2$
      009686 85               [ 2] 4331 	incw x 
      001825                       4332 2$:	 
      009687 9F               [ 1] 4333 	ld a,xh 
      009688 A4 07 88         [ 1] 4334 	ld TIM2_ARRH,a 
      00968B A6               [ 1] 4335 	ld a,xl 
      00968C 01 0D 01         [ 1] 4336 	ld TIM2_ARRL,a 
                                   4337 ; 50% duty cycle 
      00968F 27               [ 1] 4338 	ccf 
      009690 05               [ 2] 4339 	rrcw x 
      009691 48               [ 1] 4340 	ld a,xh 
      009692 0A 01 20         [ 1] 4341 	ld TIM2_CCR1H,a 
      009695 F7               [ 1] 4342 	ld a,xl
      009696 5B 01 85         [ 1] 4343 	ld TIM2_CCR1L,a
      009699 F4 27 02 A6      [ 1] 4344 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00969D 01 5F 97 A6      [ 1] 4345 	bset TIM2_CR1,#TIM2_CR1_CEN
      0096A1 84 81 53 04      [ 1] 4346 	bset TIM2_EGR,#TIM2_EGR_UG
      0096A3 85               [ 2] 4347 	popw x 
      0096A3 CD 90 EA         [ 2] 4348 	ldw timer,x 
      0096A6 A1 02 27         [ 2] 4349 3$: ldw x,timer 	
      0096A9 03 CC            [ 1] 4350 	jrne 3$ 
      0096AB 88 F1 53 08      [ 1] 4351 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0096AD 72 11 53 00      [ 1] 4352 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0096AD 85               [ 4] 4353 	ret 
                                   4354 
                                   4355 ;-------------------------------
                                   4356 ; BASIC: ADCON 0|1 [,divisor]  
                                   4357 ; disable/enanble ADC 
                                   4358 ;-------------------------------
                           000003  4359 	ONOFF=3 
                           000001  4360 	DIVSOR=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                           000004  4361 	VSIZE=4 
      001855                       4362 power_adc:
      0096AE 9F 85 F7         [ 4] 4363 	call arg_list 
      0096B1 81 02            [ 1] 4364 	cp a,#2	
      0096B2 27 0B            [ 1] 4365 	jreq 1$
      0096B2 CD 90            [ 1] 4366 	cp a,#1 
      0096B4 E5 A1            [ 1] 4367 	jreq 0$ 
      0096B6 01 27 03         [ 2] 4368 	jp syntax_error 
      0096B9 CC 88 F1         [ 2] 4369 0$: ldw x,#0
      0096BC 85               [ 2] 4370 	pushw x  ; divisor 
      0096BD F6 5F            [ 2] 4371 1$: ldw x,(ONOFF,sp)
      0096BF 97               [ 2] 4372 	tnzw x 
      0096C0 A6 84            [ 1] 4373 	jreq 2$ 
      0096C2 81 01            [ 2] 4374 	ldw x,(DIVSOR,sp) ; divisor 
      0096C3 9F               [ 1] 4375 	ld a,xl
      0096C3 CD 90            [ 1] 4376 	and a,#7
      0096C5 E5               [ 1] 4377 	swap a 
      0096C6 A1 02 27         [ 1] 4378 	ld ADC_CR1,a
      0096C9 03 CC 88 F1      [ 1] 4379 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0096CD 72 10 54 01      [ 1] 4380 	bset ADC_CR1,#ADC_CR1_ADON 
      00187D                       4381 	_usec_dly 7 
      0096CD 85 CF 00         [ 2]    1     ldw x,#(16*7-2)/4
      0096D0 18               [ 2]    2     decw x
      0096D1 85               [ 1]    3     nop 
      0096D2 9F C7            [ 1]    4     jrne .-4
      0096D4 00 17            [ 2] 4382 	jra 3$
      0096D6 5F 92 BC 00      [ 1] 4383 2$: bres ADC_CR1,#ADC_CR1_ADON
      0096DA 17 97 A6 84      [ 1] 4384 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00188E                       4385 3$:	_drop VSIZE 
      0096DE 81 04            [ 2]    1     addw sp,#VSIZE 
      0096DF 81               [ 4] 4386 	ret
                                   4387 
                                   4388 ;-----------------------------
                                   4389 ; BASIC: ADCREAD (channel)
                                   4390 ; read adc channel {0..5}
                                   4391 ; output:
                                   4392 ;   A 		TK_INTGR 
                                   4393 ;   X 		value 
                                   4394 ;-----------------------------
      001891                       4395 analog_read:
      0096DF CD 92 27         [ 4] 4396 	call func_args 
      0096E2 A1 84            [ 1] 4397 	cp a,#1 
      0096E4 27 03            [ 1] 4398 	jreq 1$
      0096E6 CC 88 F1         [ 2] 4399 	jp syntax_error
      0096E9 4F               [ 2] 4400 1$: popw x 
      0096EA 5D 26 05         [ 2] 4401 	cpw x,#5 
      0096ED 55 00            [ 2] 4402 	jrule 2$
      0096EF 04 00            [ 1] 4403 	ld a,#ERR_BAD_VALUE
      0096F1 02 81 73         [ 2] 4404 	jp tb_error 
      0096F3 9F               [ 1] 4405 2$: ld a,xl
      0096F3 85 52 0A         [ 1] 4406 	ld acc8,a 
      0096F6 89 A6            [ 1] 4407 	ld a,#5
      0096F8 85 CD 90         [ 1] 4408 	sub a,acc8 
      0096FB D8 1F 07         [ 1] 4409 	ld ADC_CSR,a
      0096FE CD 93 06 72      [ 1] 4410 	bset ADC_CR2,#ADC_CR2_ALIGN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009702 14 00 24 5F      [ 1] 4411 	bset ADC_CR1,#ADC_CR1_ADON
      009706 1F 0B 1F 09 CD   [ 2] 4412 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00970B 89 E3 A1         [ 2] 4413 	ldw x,ADC_DRH
      00970E 80 27            [ 1] 4414 	ld a,#TK_INTGR
      009710 03               [ 4] 4415 	ret 
                                   4416 
                                   4417 ;-----------------------
                                   4418 ; BASIC: DREAD(pin)
                                   4419 ; Arduino pins 
                                   4420 ; read state of a digital pin 
                                   4421 ; pin# {0..15}
                                   4422 ; output:
                                   4423 ;    A 		TK_INTGR
                                   4424 ;    X      0|1 
                                   4425 ;-------------------------
                           000001  4426 	PINNO=1
                           000001  4427 	VSIZE=1
      0018C5                       4428 digital_read:
      0018C5                       4429 	_vars VSIZE 
      009711 CC 88            [ 2]    1     sub sp,#VSIZE 
      009713 F1 10 65         [ 4] 4430 	call func_args
      009714 A1 01            [ 1] 4431 	cp a,#1
      009714 A3 97            [ 1] 4432 	jreq 1$
      009716 1C 27 03         [ 2] 4433 	jp syntax_error
      009719 CC               [ 2] 4434 1$: popw x 
      00971A 88 F1 0F         [ 2] 4435 	cpw x,#15 
      00971C 23 05            [ 2] 4436 	jrule 2$
      00971C 72 04            [ 1] 4437 	ld a,#ERR_BAD_VALUE
      00971E 00 24 03         [ 2] 4438 	jp tb_error 
      009721 CC 88 F1         [ 4] 4439 2$:	call select_pin 
      009724 CD 92            [ 1] 4440 	ld (PINNO,sp),a
      009726 27 A1            [ 1] 4441 	ld a,(GPIO_IDR,x)
      009728 84 27            [ 1] 4442 	tnz (PINNO,sp)
      00972A 03 CC            [ 1] 4443 	jreq 8$
      00972C 88               [ 1] 4444 3$: srl a 
      00972D F1 1F            [ 1] 4445 	dec (PINNO,sp)
      00972F 05 CD            [ 1] 4446 	jrne 3$ 
      009731 89 E3            [ 1] 4447 8$: and a,#1 
      009733 A1               [ 1] 4448 	clrw x 
      009734 00               [ 1] 4449 	ld xl,a 
      009735 27 0E            [ 1] 4450 	ld a,#TK_INTGR
      0018F2                       4451 	_drop VSIZE
      009737 A1 80            [ 2]    1     addw sp,#VSIZE 
      009739 26               [ 4] 4452 	ret
                                   4453 
                                   4454 ;-----------------------
                                   4455 ; BASIC: DWRITE pin,0|1
                                   4456 ; Arduino pins 
                                   4457 ; write to a digital pin 
                                   4458 ; pin# {0..15}
                                   4459 ; output:
                                   4460 ;    A 		TK_INTGR
                                   4461 ;    X      0|1 
                                   4462 ;-------------------------
                           000001  4463 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                           000002  4464 	PINVAL=2
                           000002  4465 	VSIZE=2
      0018F5                       4466 digital_write:
      0018F5                       4467 	_vars VSIZE 
      00973A 05 A3            [ 2]    1     sub sp,#VSIZE 
      00973C 97 4C 27         [ 4] 4468 	call arg_list  
      00973F 0C 02            [ 1] 4469 	cp a,#2 
      009740 27 03            [ 1] 4470 	jreq 1$
      009740 55 00 03         [ 2] 4471 	jp syntax_error
      009743 00               [ 2] 4472 1$: popw x 
      009744 02               [ 1] 4473 	ld a,xl 
      009745 6B 02            [ 1] 4474 	ld (PINVAL,sp),a
      009745 AE               [ 2] 4475 	popw x 
      009746 00 01 1F         [ 2] 4476 	cpw x,#15 
      009749 03 20            [ 2] 4477 	jrule 2$
      00974B 14 0A            [ 1] 4478 	ld a,#ERR_BAD_VALUE
      00974C CC 08 73         [ 2] 4479 	jp tb_error 
      00974C 72 04 00         [ 4] 4480 2$:	call select_pin 
      00974F 24 03            [ 1] 4481 	ld (PINNO,sp),a 
      009751 CC 88            [ 1] 4482 	ld a,#1
      009753 F1 CD            [ 1] 4483 	tnz (PINNO,sp)
      009755 92 27            [ 1] 4484 	jreq 4$
      009757 A1               [ 1] 4485 3$: sll a
      009758 84 27            [ 1] 4486 	dec (PINNO,sp)
      00975A 03 CC            [ 1] 4487 	jrne 3$
      00975C 88 F1            [ 1] 4488 4$: tnz (PINVAL,sp)
      00975E 1F 03            [ 1] 4489 	jrne 5$
      009760 43               [ 1] 4490 	cpl a 
      009760 CE 00            [ 1] 4491 	and a,(GPIO_ODR,x)
      009762 05 1F            [ 2] 4492 	jra 8$
      009764 0B CE            [ 1] 4493 5$: or a,(GPIO_ODR,x)
      009766 00 01            [ 1] 4494 8$: ld (GPIO_ODR,x),a 
      00192D                       4495 	_drop VSIZE 
      009768 1F 09            [ 2]    1     addw sp,#VSIZE 
      00976A 72               [ 4] 4496 	ret
                                   4497 
                                   4498 
                                   4499 ;-----------------------
                                   4500 ; BASIC: STOP
                                   4501 ; stop progam execution  
                                   4502 ; without resetting pointers 
                                   4503 ; the program is resumed
                                   4504 ; with RUN 
                                   4505 ;-------------------------
      001930                       4506 stop:
      00976B 15 00 24 72 5C   [ 2] 4507 	btjt flags,#FRUN,2$
      009770 00               [ 1] 4508 	clr a
      009771 21               [ 4] 4509 	ret 
      001937                       4510 2$:	 
                                   4511 ; create space on cstack to save context 
      009772 81 19 5E         [ 2] 4512 	ldw x,#break_point 
      009773 CD 02 B3         [ 4] 4513 	call puts 
      00193D                       4514 	_drop 2 ;drop return address 
      009773 72 5D            [ 2]    1     addw sp,#2 
      00193F                       4515 	_vars CTXT_SIZE ; context size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009775 00 21            [ 2]    1     sub sp,#CTXT_SIZE 
      009777 26 03 CC         [ 4] 4516 	call save_context 
      00977A 88 F1 90         [ 2] 4517 	ldw x,#tib 
      00977C CF 00 04         [ 2] 4518 	ldw basicptr,x
      00977C A6               [ 1] 4519 	clr (x)
      00977D 85 CD 90 D8      [ 1] 4520 	clr count  
      009781 13               [ 1] 4521 	clrw x 
      009782 07 27 03         [ 2] 4522 	ldw in.w,x
      009785 CC 88 F1 23      [ 1] 4523 	bres flags,#FRUN 
      009788 72 18 00 23      [ 1] 4524 	bset flags,#FBREAK
      009788 FE 72 FB         [ 2] 4525 	jp interpreter 
      00978B 03 16 07 90 FF A6 80  4526 break_point: .asciz "\nbreak point, RUN to resume.\n"
             15 03 2A 06 13 05 2F
             1B 20 04 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4527 
                                   4528 ;-----------------------
                                   4529 ; BASIC: NEW
                                   4530 ; from command line only 
                                   4531 ; free program memory
                                   4532 ; and clear variables 
                                   4533 ;------------------------
      00979C                       4534 new: 
      00979C 13 05 2C 15 01   [ 2] 4535 	btjf flags,#FRUN,0$ 
      0097A0 81               [ 4] 4536 	ret 
      001982                       4537 0$:	
      0097A0 1E 0B CF         [ 4] 4538 	call clear_basic 
      0097A3 00               [ 4] 4539 	ret 
                                   4540 	 
                                   4541 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4542 ;  file system routines
                                   4543 ;  MCU flash memory from
                                   4544 ;  0x10000-0x27fff is 
                                   4545 ;  used to store BASIC 
                                   4546 ;  program files. 
                                   4547 ;  use 128 bytes sectors
                                   4548 ;  because this is the MCU 
                                   4549 ;  row size.
                                   4550 ;  file entry aligned to row
                                   4551 ;  	name  variable length
                                   4552 ;  	size  2 bytes  
                                   4553 ; 	data  variable length 
                                   4554 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4555 
                                   4556 ;---------------------------
                                   4557 ; fill pad with zeros 
                                   4558 ;--------------------------
      001986                       4559 zero_pad:
      0097A4 05 72 01         [ 2] 4560 	ldw x,#pad 
      0097A7 00 24            [ 1] 4561 	ld a,#PAD_SIZE 
      0097A9 05               [ 1] 4562 1$:	clr (x)
      0097AA E6               [ 2] 4563 	incw x 
      0097AB 02               [ 1] 4564 	dec a 
      0097AC C7 00            [ 1] 4565 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097AE 04               [ 4] 4566 	ret 
                                   4567 
                                   4568 ;--------------------------
                                   4569 ; align farptr to BLOCK_SIZE 
                                   4570 ;---------------------------
      001991                       4571 row_align:
      0097AF 1E 09            [ 1] 4572 	ld a,#0x7f 
      0097B1 CF 00 01         [ 1] 4573 	and a,farptr+2 
      0097B4 81 13            [ 1] 4574 	jreq 1$ 
      0097B5 CE 00 17         [ 2] 4575 	ldw x,farptr+1 
      0097B5 85 5B 0A         [ 2] 4576 	addw x,#BLOCK_SIZE 
      0097B8 72 5A            [ 1] 4577 	jrnc 0$
      0097BA 00 21 FC 16      [ 1] 4578 	inc farptr 
      0097BD 9F               [ 1] 4579 0$: ld a,xl 
      0097BD CD 92            [ 1] 4580 	and a,#0x80
      0097BF 27               [ 1] 4581 	ld xl,a
      0097C0 A1 84 27         [ 2] 4582 	ldw farptr+1,x  	
      0097C3 03               [ 4] 4583 1$:	ret
                                   4584 
                                   4585 ;--------------------
                                   4586 ; input:
                                   4587 ;   X     increment 
                                   4588 ; output:
                                   4589 ;   farptr  incremented 
                                   4590 ;---------------------
      0019AC                       4591 incr_farptr:
      0097C4 CC 88 F1 CD      [ 2] 4592 	addw x,farptr+1 
      0097C8 84 80            [ 1] 4593 	jrnc 1$
      0097CA 5D 26 05 A6      [ 1] 4594 	inc farptr 
      0097CE 05 CC 88         [ 2] 4595 1$:	ldw farptr+1,x  
      0097D1 F3               [ 4] 4596 	ret 
                                   4597 
                                   4598 ;------------------------------
                                   4599 ; extended flash memory used as FLASH_DRIVE 
                                   4600 ; seek end of used flash drive   
                                   4601 ; starting at 0x10000 address.
                                   4602 ; 4 consecutives 0 bytes signal free space. 
                                   4603 ; input:
                                   4604 ;	none
                                   4605 ; output:
                                   4606 ;   ffree     free_addr| 0 if memory full.
                                   4607 ;------------------------------
      0019BA                       4608 seek_fdrive:
                                   4609 ; start scan at 0x10000 address 
      0097D2 81 01            [ 1] 4610 	ld a,#1
      0097D3 C7 00 16         [ 1] 4611 	ld farptr,a 
      0097D3 72               [ 1] 4612 	clrw x 
      0097D4 00 00 24         [ 2] 4613 	ldw farptr+1,x 
      0019C3                       4614 1$:
      0097D7 06 A6 06         [ 2] 4615 	ldw x,#3  
      0097DA CC 88 F3 81      [ 5] 4616 2$:	ldf a,([farptr],x) 
      0097DE CD 97            [ 1] 4617 	jrne 3$
      0097E0 BD               [ 2] 4618 	decw x
      0097E1 2A F7            [ 1] 4619 	jrpl 2$
      0097E1 CF 00            [ 2] 4620 	jra 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097E3 05 E6 02         [ 2] 4621 3$:	ldw x,#BLOCK_SIZE 
      0097E6 C7 00 04         [ 4] 4622 	call incr_farptr
      0097E9 35 03 00         [ 2] 4623 	ldw x,#0x280  
      0097EC 02 81 16         [ 2] 4624 	cpw x,farptr
      0097EE 2B E4            [ 1] 4625 	jrmi 1$
      0019DF                       4626 4$: ; copy farptr to ffree	 
      0097EE 72 00 00         [ 2] 4627 	ldw x,farptr 
      0097F1 24 06 A6         [ 1] 4628 	ld a,farptr+2 
      0097F4 06 CC 88         [ 2] 4629 	ldw ffree,x 
      0097F7 F3 81 85         [ 1] 4630 	ld ffree+2,a  
      0097FA 52               [ 4] 4631 	ret 
                                   4632 
                                   4633 ;-----------------------
                                   4634 ; return amount of free 
                                   4635 ; space on flash drive
                                   4636 ; input:
                                   4637 ;   none
                                   4638 ; output:
                                   4639 ;   acc24   free space 
                                   4640 ;-----------------------
      0019EC                       4641 disk_free:
      0097FB 04 89 CE         [ 2] 4642 	ldw x,#0x8000
      0097FE 00 05 1F 03      [ 2] 4643 	subw x,ffree+1
      009802 CD 97            [ 1] 4644 	ld a,#2
      009804 BD 89 CE         [ 1] 4645 	sbc a,ffree 
      009807 00 01 1F         [ 1] 4646 	ld acc24,a 
      00980A 07 85 20         [ 2] 4647 	ldw acc16,x 
      00980D D3               [ 4] 4648 	ret 
                                   4649 
                                   4650 ;-----------------------
                                   4651 ; compare file name 
                                   4652 ; with name pointed by Y  
                                   4653 ; input:
                                   4654 ;   farptr   file name 
                                   4655 ;   Y        target name 
                                   4656 ; output:
                                   4657 ;   farptr 	 at file_name
                                   4658 ;   X 		 farptr[x] point at size field  
                                   4659 ;   Carry    0|1 no match|match  
                                   4660 ;----------------------
      00980E                       4661 cmp_name:
      00980E 72               [ 1] 4662 	clrw x
      00980F 00 00 24 05      [ 5] 4663 1$:	ldf a,([farptr],x)
      009813 A6 06            [ 1] 4664 	cp a,(y)
      009815 CC 88            [ 1] 4665 	jrne 4$
      009817 F3               [ 1] 4666 	tnz a 
      009818 27 12            [ 1] 4667 	jreq 9$ 
      009818 1E               [ 2] 4668     incw x 
      009819 03 CF            [ 2] 4669 	incw y 
      00981B 00 05            [ 2] 4670 	jra 1$
      001A10                       4671 4$: ;no match 
      00981D E6               [ 1] 4672 	tnz a 
      00981E 02 C7            [ 1] 4673 	jreq 5$
      009820 00               [ 2] 4674 	incw x 
      009821 04 1E 05 CF      [ 5] 4675 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009825 00 01            [ 2] 4676 	jra 4$  
      009827 85               [ 2] 4677 5$:	incw x ; farptr[x] point at 'size' field 
      009828 5B               [ 1] 4678 	rcf 
      009829 04               [ 4] 4679 	ret
      001A1D                       4680 9$: ; match  
      00982A 89               [ 2] 4681 	incw x  ; farptr[x] at 'size' field 
      00982B 81               [ 1] 4682 	scf 
      00982C 81               [ 4] 4683 	ret 
                                   4684 
                                   4685 ;-----------------------
                                   4686 ; search file in 
                                   4687 ; flash memory 
                                   4688 ; input:
                                   4689 ;   Y       file name  
                                   4690 ; output:
                                   4691 ;   farptr  addr at name|0
                                   4692 ;   X       offset to size field
                                   4693 ;-----------------------
                           000001  4694 	FSIZE=1
                           000003  4695 	YSAVE=3
                           000004  4696 	VSIZE=4 
      001A20                       4697 search_file: 
      001A20                       4698 	_vars VSIZE
      00982C 72 01            [ 2]    1     sub sp,#VSIZE 
      00982E 00 24            [ 2] 4699 	ldw (YSAVE,sp),y  
      009830 02               [ 1] 4700 	clrw x 
      009831 4F 81 17         [ 2] 4701 	ldw farptr+1,x 
      009833 35 01 00 16      [ 1] 4702 	mov farptr,#1
      001A2C                       4703 1$:	
                                   4704 ; check if farptr is after any file 
                                   4705 ; if  0 then so.
      009833 72 09 00 24      [ 5] 4706 	ldf a,[farptr]
      009837 12 5B            [ 1] 4707 	jreq 6$
      009839 02               [ 1] 4708 2$: clrw x 	
      00983A CD 95            [ 2] 4709 	ldw y,(YSAVE,sp) 
      00983C A4 5B 04         [ 4] 4710 	call cmp_name
      00983F 72 19            [ 1] 4711 	jrc 9$
      009841 00 24 72 10      [ 5] 4712 	ldf a,([farptr],x)
      009845 00 24            [ 1] 4713 	ld (FSIZE,sp),a 
      009847 CC               [ 2] 4714 	incw x 
      009848 89 97 CE 00      [ 5] 4715 	ldf a,([farptr],x)
      00984C 1D C3            [ 1] 4716 	ld (FSIZE+1,sp),a 
      00984E 00               [ 2] 4717 	incw x 
      00984F 1F 2B 0C         [ 2] 4718 	addw x,(FSIZE,sp) ; skip over file data
      009852 AE 88 8C         [ 4] 4719 	call incr_farptr
      009855 CD 83 33         [ 4] 4720 	call row_align  
      009858 55 00 04         [ 2] 4721 	ldw x,#0x280
      00985B 00 02 81         [ 2] 4722 	cpw x,farptr 
      00985E 2A D3            [ 1] 4723 	jrpl 1$
      001A59                       4724 6$: ; file not found 
      00985E CD 92 D3 5B      [ 1] 4725 	clr farptr
      009862 02 5F CF 00      [ 1] 4726 	clr farptr+1 
      009866 07 72 5F 00      [ 1] 4727 	clr farptr+2 
      001A65                       4728 	_drop VSIZE 
      00986A 09 72            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00986C 5F               [ 1] 4729 	rcf
      00986D 00               [ 4] 4730 	ret
      001A69                       4731 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001A69                       4732 	_drop VSIZE 
      00986E 0A CE            [ 2]    1     addw sp,#VSIZE 
      009870 00               [ 1] 4733 	scf 	
      009871 1D               [ 4] 4734 	ret
                                   4735 
                                   4736 ;--------------------------------
                                   4737 ; BASIC: SAVE "name" 
                                   4738 ; save text program in 
                                   4739 ; flash memory used as permanent
                                   4740 ; storage from address 0x10000-0x27fff 
                                   4741 ;--------------------------------
                           000001  4742 	BSIZE=1
                           000003  4743 	NAMEPTR=3
                           000005  4744 	XSAVE=5
                           000007  4745 	YSAVE=7
                           000008  4746 	VSIZE=8 
      001A6D                       4747 save:
      009872 CF 00 05 E6 02   [ 2] 4748 	btjf flags,#FRUN,0$ 
      009877 C7 00            [ 1] 4749 	ld a,#ERR_CMD_ONLY 
      009879 04 35 03         [ 2] 4750 	jp tb_error
      001A77                       4751 0$:	 
      00987C 00 02 72         [ 2] 4752 	ldw x,txtend 
      00987F 10 00 24 CC      [ 2] 4753 	subw x,txtbgn
      009883 89 97            [ 1] 4754 	jrne 1$
                                   4755 ; nothing to save 
      009885 AE 08 0C         [ 2] 4756 	ldw x,#err_no_prog 
      009885 AE 17 FF         [ 4] 4757 	call puts 
      009888 94 CC 89 78 01   [ 1] 4758 	mov in,count 
      00988C 81               [ 4] 4759 	ret  	
      001A8C                       4760 1$:	
      001A8C                       4761 	_vars VSIZE 
      00988C CD 90            [ 2]    1     sub sp,#VSIZE 
      00988E EA A1            [ 2] 4762 	ldw (BSIZE,sp),x 
      009890 02 27 03         [ 4] 4763 	call next_token	
      009893 CC 88            [ 1] 4764 	cp a,#TK_QSTR
      009895 F1 03            [ 1] 4765 	jreq 2$
      009896 CC 08 71         [ 2] 4766 	jp syntax_error
      001A9A                       4767 2$: 
      009896 85 90            [ 2] 4768 	ldw (NAMEPTR,sp),x  
      009898 85 01 5C         [ 4] 4769 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4770 ; check if enough free space 
      009899 CD 03 92         [ 4] 4771 	call strlen 
      009899 89 AE F4         [ 2] 4772 	addw x,#3 
      00989C 24 65 90         [ 2] 4773 	addw x,(BSIZE,sp)
      00989F A3               [ 1] 4774 	clr a 
      0098A0 7A 12 2B 01      [ 2] 4775 	addw x,ffree+1 
      0098A4 5C 00 19         [ 1] 4776 	adc a,ffree 
      0098A5 A1 02            [ 1] 4777 	cp a,#2
      0098A5 9E C7            [ 1] 4778 	jrmi 21$
      0098A7 53 0D 9F         [ 2] 4779 	cpw x,#0x8000
      0098AA C7 53            [ 1] 4780 	jrmi 21$
      0098AC 0E 8C            [ 1] 4781 	ld a,#ERR_NO_FSPACE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098AE 56 9E C7         [ 2] 4782 	jp tb_error
      001ABE                       4783 21$: 
                                   4784 ; check for existing file of that name 
      0098B1 53 0F            [ 2] 4785 	ldw y,(NAMEPTR,sp)	
      0098B3 9F C7 53         [ 4] 4786 	call search_file 
      0098B6 10 72            [ 1] 4787 	jrnc 3$ 
      0098B8 10 53            [ 1] 4788 	ld a,#ERR_DUPLICATE 
      0098BA 08 72 10         [ 2] 4789 	jp tb_error 
      001ACA                       4790 3$:	; initialize farptr 
      0098BD 53 00 72         [ 2] 4791 	ldw x,ffree 
      0098C0 10 53 04         [ 1] 4792 	ld a,ffree+2 
      0098C3 85 CF 00         [ 2] 4793 	ldw farptr,x 
      0098C6 11 CE 00         [ 1] 4794 	ld farptr+2,a 
                                   4795 ;** write file name to row buffer **	
      0098C9 11 26            [ 2] 4796 	ldw y,(NAMEPTR,sp)  
      0098CB FB 72 11         [ 2] 4797 	ldw x,#pad 
      0098CE 53 08 72         [ 4] 4798 	call strcpy
      0098D1 11 53 00         [ 4] 4799 	call strlen 
      0098D4 81               [ 2] 4800 	incw  x
      0098D5 1C 16 E0         [ 2] 4801 	addw x,#pad 
                                   4802 ; ** write file size to row buffer 
      0098D5 CD 90            [ 2] 4803 	ldw y,(BSIZE,sp)
      0098D7 EA               [ 2] 4804 	ldw (x),y 
      0098D8 A1 02 27         [ 2] 4805 	addw x,#2 
                                   4806 ; ** write file data to row buffer 
      0098DB 0B A1 01 27      [ 2] 4807 	ldw y,txtbgn 
      0098DF 03 CC            [ 1] 4808 6$:	ld a,(y)
      0098E1 88 F1            [ 2] 4809 	incw y
      0098E3 AE               [ 1] 4810 	ld (x),a 
      0098E4 00               [ 2] 4811 	incw x
      0098E5 00 89 1E 03      [ 2] 4812 	cpw y,txtend 
      0098E9 5D 27            [ 1] 4813 	jreq 12$
      0098EB 1A 1E 01         [ 2] 4814 	cpw x,#stack_full 
      0098EE 9F A4            [ 1] 4815 	jrmi 6$
      001B00                       4816 12$:
      0098F0 07 4E            [ 2] 4817 	ldw (YSAVE,sp),y 
      001B02                       4818 14$: ; zero buffer end 
      0098F2 C7 54 01         [ 2] 4819 	cpw x,#stack_full
      0098F5 72 16            [ 1] 4820 	jreq 16$
      0098F7 50               [ 1] 4821 	clr (x)
      0098F8 CA               [ 2] 4822 	incw x 
      0098F9 72 10            [ 2] 4823 	jra 14$
      001B0B                       4824 16$:
      0098FB 54 01 AE         [ 2] 4825 	ldw x,#pad 
      0098FE 00 1B 5A         [ 4] 4826 	call write_row 
      009901 9D 26 FA         [ 2] 4827 	ldw x,#BLOCK_SIZE 
      009904 20 08 72         [ 4] 4828 	call incr_farptr
      009907 11 54 01         [ 2] 4829 	ldw x,#pad 
      00990A 72 17            [ 2] 4830 	ldw y,(YSAVE,sp)
      00990C 50 CA 5B 04      [ 2] 4831 	cpw y,txtend 
      009910 81 CD            [ 1] 4832 	jrmi 6$
                                   4833 ; save farptr in ffree
      009911 CE 00 16         [ 2] 4834 	ldw x,farptr 
      009911 CD 90 E5         [ 1] 4835 	ld a,farptr+2 
      009914 A1 01 27         [ 2] 4836 	ldw ffree,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009917 03 CC 88         [ 1] 4837 	ld ffree+2,a
                                   4838 ; print file size 	
      00991A F1 85            [ 2] 4839 	ldw x,(BSIZE,sp) 
      00991C A3 00 05         [ 4] 4840 	call print_int 
      001B33                       4841 	_drop VSIZE 
      00991F 23 05            [ 2]    1     addw sp,#VSIZE 
      009921 A6               [ 4] 4842 	ret 
                                   4843 
                                   4844 ;----------------------
                                   4845 ; load file in RAM memory
                                   4846 ; input:
                                   4847 ;    farptr point at file size 
                                   4848 ; output:
                                   4849 ;   y point after BASIC program in RAM.
                                   4850 ;------------------------
      001B36                       4851 load_file:
      009922 0A CC 88         [ 4] 4852 	call incr_farptr  
      009925 F3 9F C7         [ 4] 4853 	call clear_basic  
      009928 00               [ 1] 4854 	clrw x
      009929 0E A6 05 C0      [ 5] 4855 	ldf a,([farptr],x)
      00992D 00 0E            [ 1] 4856 	ld yh,a 
      00992F C7               [ 2] 4857 	incw x  
      009930 54 00 72 16      [ 5] 4858 	ldf a,([farptr],x)
      009934 54               [ 2] 4859 	incw x 
      009935 02 72            [ 1] 4860 	ld yl,a 
      009937 10 54 01 72      [ 2] 4861 	addw y,txtbgn
      00993B 0F 54 00 FB      [ 2] 4862 	ldw txtend,y
      00993F CE 54 04 A6      [ 2] 4863 	ldw y,txtbgn
      001B57                       4864 3$:	; load BASIC text 	
      009943 84 81 00 16      [ 5] 4865 	ldf a,([farptr],x)
      009945 90 F7            [ 1] 4866 	ld (y),a 
      009945 52               [ 2] 4867 	incw x 
      009946 01 CD            [ 2] 4868 	incw y 
      009948 90 E5 A1 01      [ 2] 4869 	cpw y,txtend 
      00994C 27 03            [ 1] 4870 	jrmi 3$
      00994E CC               [ 4] 4871 	ret 
                                   4872 
                                   4873 ;------------------------
                                   4874 ; BASIC: LOAD "file" 
                                   4875 ; load file to RAM 
                                   4876 ; for execution 
                                   4877 ;------------------------
      001B67                       4878 load:
      00994F 88 F1 85 A3 00   [ 2] 4879 	btjf flags,#FRUN,0$ 
      009954 0F 23            [ 1] 4880 	jreq 0$ 
      009956 05 A6            [ 1] 4881 	ld a,#ERR_CMD_ONLY 
      009958 0A CC 88         [ 2] 4882 	jp tb_error 
      001B73                       4883 0$:	
      00995B F3 CD 9F         [ 4] 4884 	call next_token 
      00995E 73 6B            [ 1] 4885 	cp a,#TK_QSTR
      009960 01 E6            [ 1] 4886 	jreq 1$
      009962 01 0D 01         [ 2] 4887 	jp syntax_error 
      009965 27 05            [ 1] 4888 1$:	ldw y,x 
      009967 44 0A 01         [ 4] 4889 	call search_file 
      00996A 26 FB            [ 1] 4890 	jrc 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00996C A4 01            [ 1] 4891 	ld a,#ERR_NOT_FILE
      00996E 5F 97 A6         [ 2] 4892 	jp tb_error  
      001B89                       4893 2$:
      009971 84 5B 01         [ 4] 4894 	call load_file
                                   4895 ; print loaded size 	 
      009974 81 00 1E         [ 2] 4896 	ldw x,txtend 
      009975 72 B0 00 1C      [ 2] 4897 	subw x,txtbgn
      009975 52 02 CD         [ 4] 4898 	call print_int 
      009978 90               [ 4] 4899 	ret 
                                   4900 
                                   4901 ;-----------------------------------
                                   4902 ; BASIC: FORGET ["file_name"] 
                                   4903 ; erase file_name and all others 
                                   4904 ; after it. 
                                   4905 ; without argument erase all files 
                                   4906 ;-----------------------------------
                           000001  4907 	NEW_FREE=1 
                           000003  4908 	VSIZE=3 
      001B97                       4909 forget:
      001B97                       4910 	_vars VSIZE 
      009979 EA A1            [ 2]    1     sub sp,#VSIZE 
      00997B 02 27 03         [ 4] 4911 	call next_token 
      00997E CC 88            [ 1] 4912 	cp a,#TK_NONE 
      009980 F1 85            [ 1] 4913 	jreq 3$ 
      009982 9F 6B            [ 1] 4914 	cp a,#TK_QSTR
      009984 02 85            [ 1] 4915 	jreq 1$
      009986 A3 00 0F         [ 2] 4916 	jp syntax_error
      009989 23 05            [ 1] 4917 1$: ldw y,x 
      00998B A6 0A CC 88 F3   [ 1] 4918 	mov in,count 
      009990 CD 9F 73         [ 4] 4919 	call search_file
      009993 6B 01            [ 1] 4920 	jrc 2$
      009995 A6 01            [ 1] 4921 	ld a,#ERR_NOT_FILE 
      009997 0D 01 27         [ 2] 4922 	jp tb_error 
      001BB8                       4923 2$: 
      00999A 05 48 0A         [ 2] 4924 	ldw x,farptr
      00999D 01 26 FB         [ 1] 4925 	ld a,farptr+2
      0099A0 0D 02            [ 2] 4926 	jra 4$ 
      001BC0                       4927 3$: ; forget all files 
      0099A2 26 05 43         [ 2] 4928 	ldw x,#0x100
      0099A5 E4               [ 1] 4929 	clr a 
      0099A6 00 20 02         [ 2] 4930 	ldw farptr,x 
      0099A9 EA 00 E7         [ 1] 4931 	ld farptr+2,a 
      001BCA                       4932 4$:	; save new free address 
      0099AC 00 5B            [ 2] 4933 	ldw (NEW_FREE,sp),x
      0099AE 02 81            [ 1] 4934 	ld (NEW_FREE+2,sp),a 
      0099B0 CD 01 28         [ 4] 4935 	call move_erase_to_ram
      0099B0 72 00 00         [ 4] 4936 5$: call block_erase 
      0099B3 24 02 4F         [ 2] 4937 	ldw x,#BLOCK_SIZE 
      0099B6 81 19 AC         [ 4] 4938 	call incr_farptr 
      0099B7 CD 19 91         [ 4] 4939 	call row_align 
                                   4940 ; check if all blocks erased
      0099B7 AE 99 DE         [ 1] 4941 	ld a,farptr+2  
      0099BA CD 83 33         [ 1] 4942 	sub a,ffree+2
      0099BD 5B 02 52         [ 1] 4943 	ld a,farptr+1 
      0099C0 04 CD 95         [ 1] 4944 	sbc a,ffree+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099C3 94 AE 16         [ 1] 4945 	ld a,farptr 
      0099C6 90 CF 00         [ 1] 4946 	sbc a,ffree 
      0099C9 05 7F            [ 1] 4947 	jrmi 5$ 
      0099CB 72 5F            [ 1] 4948 	ld a,(NEW_FREE+2,sp)
      0099CD 00 04            [ 2] 4949 	ldw x,(NEW_FREE,sp)
      0099CF 5F CF 00         [ 1] 4950 	ld ffree+2,a 
      0099D2 01 72 11         [ 2] 4951 	ldw ffree,x 
      001BFB                       4952 	_drop VSIZE 
      0099D5 00 24            [ 2]    1     addw sp,#VSIZE 
      0099D7 72               [ 4] 4953 	ret 
                                   4954 
                                   4955 ;----------------------
                                   4956 ; BASIC: DIR 
                                   4957 ; list saved files 
                                   4958 ;----------------------
                           000001  4959 	COUNT=1 ; files counter 
                           000002  4960 	VSIZE=2 
      001BFE                       4961 directory:
      001BFE                       4962 	_vars VSIZE 
      0099D8 18 00            [ 2]    1     sub sp,#VSIZE 
      0099DA 24               [ 1] 4963 	clrw x 
      0099DB CC 89            [ 2] 4964 	ldw (COUNT,sp),x 
      0099DD 97 0A 62         [ 2] 4965 	ldw farptr+1,x 
      0099E0 72 65 61 6B      [ 1] 4966 	mov farptr,#1 
      001C0A                       4967 dir_loop:
      0099E4 20               [ 1] 4968 	clrw x 
      0099E5 70 6F 69 6E      [ 5] 4969 	ldf a,([farptr],x)
      0099E9 74 2C            [ 1] 4970 	jreq 8$ 
      001C11                       4971 1$: ;name loop 	
      0099EB 20 52 55 4E      [ 5] 4972 	ldf a,([farptr],x)
      0099EF 20 74            [ 1] 4973 	jreq 2$ 
      0099F1 6F 20 72         [ 4] 4974 	call putc 
      0099F4 65               [ 2] 4975 	incw x 
      0099F5 73 75            [ 2] 4976 	jra 1$
      0099F7 6D               [ 2] 4977 2$: incw x ; skip ending 0. 
      0099F8 65 2E            [ 1] 4978 	ld a,#SPACE 
      0099FA 0A 00 A0         [ 4] 4979 	call putc 
                                   4980 ; get file size 	
      0099FC 92 AF 00 16      [ 5] 4981 	ldf a,([farptr],x)
      0099FC 72 01            [ 1] 4982 	ld yh,a 
      0099FE 00               [ 2] 4983 	incw x 
      0099FF 24 01 81 16      [ 5] 4984 	ldf a,([farptr],x)
      009A02 5C               [ 2] 4985 	incw x 
      009A02 CD 87            [ 1] 4986 	ld yl,a 
      009A04 5D 81            [ 2] 4987 	pushw y 
      009A06 72 FB 01         [ 2] 4988 	addw x,(1,sp)
                                   4989 ; skip to next file 
      009A06 AE 16 E0         [ 4] 4990 	call incr_farptr
      009A09 A6 80 7F         [ 4] 4991 	call row_align
                                   4992 ; print file size 
      009A0C 5C               [ 2] 4993 	popw x ; file size 
      009A0D 4A 26 FB         [ 4] 4994 	call print_int 
      009A10 81 0D            [ 1] 4995 	ld a,#CR 
      009A11 CD 02 A0         [ 4] 4996 	call putc
      009A11 A6 7F            [ 2] 4997 	ldw x,(COUNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A13 C4               [ 2] 4998 	incw x
      009A14 00 19            [ 2] 4999 	ldw (COUNT,sp),x  
      009A16 27 13            [ 2] 5000 	jra dir_loop
      001C4C                       5001 8$: ; print number of files 
      009A18 CE 00            [ 2] 5002 	ldw x,(COUNT,sp)
      009A1A 18 1C 00         [ 4] 5003 	call print_int 
      009A1D 80 24 04         [ 2] 5004 	ldw x,#file_count 
      009A20 72 5C 00         [ 4] 5005 	call puts  
                                   5006 ; print drive free space 	
      009A23 17 9F A4         [ 4] 5007 	call disk_free
      009A26 80               [ 1] 5008 	clrw x  
      009A27 97 CF            [ 1] 5009 	ld a,#6 
      009A29 00               [ 1] 5010 	ld xl,a 
      009A2A 18 81            [ 1] 5011 	ld a,#10 
      009A2C CD 09 B8         [ 4] 5012 	call prti24 
      009A2C 72 BB 00         [ 2] 5013 	ldw x,#drive_free
      009A2F 18 24 04         [ 4] 5014 	call puts 
      001C69                       5015 	_drop VSIZE 
      009A32 72 5C            [ 2]    1     addw sp,#VSIZE 
      009A34 00               [ 4] 5016 	ret
      009A35 17 CF 00 18 81 73 0A  5017 file_count: .asciz " files\n"
             00
      009A3A 20 62 79 74 65 73 20  5018 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5019 
                                   5020 ;---------------------
                                   5021 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5022 ; write 1 or more byte to FLASH or EEPROM
                                   5023 ; starting at address  
                                   5024 ; input:
                                   5025 ;   expr1  	is address 
                                   5026 ;   expr2,...,exprn   are bytes to write
                                   5027 ; output:
                                   5028 ;   none 
                                   5029 ;---------------------
                           000001  5030 	ADDR=1
                           000002  5031 	VSIZ=2 
      001C81                       5032 write:
      001C81                       5033 	_vars VSIZE 
      009A3A A6 01            [ 2]    1     sub sp,#VSIZE 
      009A3C C7 00 17 5F      [ 1] 5034 	clr farptr ; expect 16 bits address 
      009A40 CF 00 18         [ 4] 5035 	call expression
      009A43 A1 84            [ 1] 5036 	cp a,#TK_INTGR 
      009A43 AE 00            [ 1] 5037 	jreq 0$
      009A45 03 92 AF         [ 2] 5038 	jp syntax_error
      009A48 00 17            [ 2] 5039 0$: ldw (ADDR,sp),x 
      009A4A 26 05 5A         [ 4] 5040 	call next_token 
      009A4D 2A F7            [ 1] 5041 	cp a,#TK_COMMA 
      009A4F 20 0E            [ 1] 5042 	jreq 1$ 
      009A51 AE 00            [ 2] 5043 	jra 9$ 
      009A53 80 CD 9A         [ 4] 5044 1$:	call expression
      009A56 2C AE            [ 1] 5045 	cp a,#TK_INTGR
      009A58 02 80            [ 1] 5046 	jreq 2$
      009A5A C3 00 17         [ 2] 5047 	jp syntax_error
      009A5D 2B               [ 1] 5048 2$:	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A5E E4 01            [ 2] 5049 	ldw x,(ADDR,sp) 
      009A5F CF 00 17         [ 2] 5050 	ldw farptr+1,x 
      009A5F CE               [ 1] 5051 	clrw x 
      009A60 00 17 C6         [ 4] 5052 	call write_byte
      009A63 00 19            [ 2] 5053 	ldw x,(ADDR,sp)
      009A65 CF               [ 2] 5054 	incw x 
      009A66 00 1A            [ 2] 5055 	jra 0$ 
      001CB5                       5056 9$:
      001CB5                       5057 	_drop VSIZE
      009A68 C7 00            [ 2]    1     addw sp,#VSIZE 
      009A6A 1C               [ 4] 5058 	ret 
                                   5059 
                                   5060 
                                   5061 ;---------------------
                                   5062 ;BASIC: CHAR(expr)
                                   5063 ; évaluate expression 
                                   5064 ; and take the 7 least 
                                   5065 ; bits as ASCII character
                                   5066 ;---------------------
      001CB8                       5067 char:
      009A6B 81 10 65         [ 4] 5068 	call func_args 
      009A6C A1 01            [ 1] 5069 	cp a,#1
      009A6C AE 80            [ 1] 5070 	jreq 1$
      009A6E 00 72 B0         [ 2] 5071 	jp syntax_error
      009A71 00               [ 2] 5072 1$:	popw x 
      009A72 1B               [ 1] 5073 	ld a,xl 
      009A73 A6 02            [ 1] 5074 	and a,#0x7f 
      009A75 C2               [ 1] 5075 	ld xl,a
      009A76 00 1A            [ 1] 5076 	ld a,#TK_CHAR
      009A78 C7               [ 4] 5077 	ret
                                   5078 
                                   5079 ;---------------------
                                   5080 ; BASIC: ASC(string|char)
                                   5081 ; extract first character 
                                   5082 ; of string argument 
                                   5083 ; return it as TK_INTGR 
                                   5084 ;---------------------
      001CCA                       5085 ascii:
      009A79 00 0C            [ 1] 5086 	ld a,#TK_LPAREN
      009A7B CF 00 0D         [ 4] 5087 	call expect 
      009A7E 81 09 63         [ 4] 5088 	call next_token 
      009A7F A1 02            [ 1] 5089 	cp a,#TK_QSTR 
      009A7F 5F 92            [ 1] 5090 	jreq 1$
      009A81 AF 00            [ 1] 5091 	cp a,#TK_CHAR 
      009A83 17 90            [ 1] 5092 	jreq 2$ 
      009A85 F1 26 08         [ 2] 5093 	jp syntax_error
      001CDD                       5094 1$: 
      009A88 4D               [ 1] 5095 	ld a,(x) 
      009A89 27               [ 1] 5096 	clrw x
      009A8A 12               [ 1] 5097 	ld xl,a 
      001CE0                       5098 2$: 
      009A8B 5C               [ 2] 5099 	pushw x 
      009A8C 90 5C            [ 1] 5100 	ld a,#TK_RPAREN 
      009A8E 20 F0 58         [ 4] 5101 	call expect
      009A90 85               [ 2] 5102 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A90 4D 27            [ 1] 5103 	ld a,#TK_INTGR 
      009A92 07               [ 4] 5104 	ret 
                                   5105 
                                   5106 ;---------------------
                                   5107 ;BASIC: KEY
                                   5108 ; wait for a character 
                                   5109 ; received from STDIN 
                                   5110 ; input:
                                   5111 ;	none 
                                   5112 ; output:
                                   5113 ;	X 		ASCII character 
                                   5114 ;---------------------
      001CEA                       5115 key:
      009A93 5C 92 AF         [ 4] 5116 	call getc 
      009A96 00               [ 1] 5117 	clrw x 
      009A97 17               [ 1] 5118 	ld xl,a 
      009A98 20 F6            [ 1] 5119 	ld a,#TK_INTGR
      009A9A 5C               [ 4] 5120 	ret
                                   5121 
                                   5122 ;----------------------
                                   5123 ; BASIC: QKEY
                                   5124 ; Return true if there 
                                   5125 ; is a character in 
                                   5126 ; waiting in STDIN 
                                   5127 ; input:
                                   5128 ;  none 
                                   5129 ; output:
                                   5130 ;   X 		0|-1 
                                   5131 ;-----------------------
      001CF2                       5132 qkey:: 
      009A9B 98               [ 1] 5133 	clrw x 
      009A9C 81 5D 00 25      [ 1] 5134 	tnz rx_char
      009A9D 27 01            [ 1] 5135 	jreq 9$ 
      009A9D 5C               [ 2] 5136 	cplw x 
      009A9E 99 81            [ 1] 5137 9$: ld a,#TK_INTGR
      009AA0 81               [ 4] 5138 	ret 
                                   5139 
                                   5140 ;---------------------
                                   5141 ; BASIC: GPIO(expr,reg)
                                   5142 ; return gpio address 
                                   5143 ; expr {0..8}
                                   5144 ; input:
                                   5145 ;   none 
                                   5146 ; output:
                                   5147 ;   X 		gpio register address
                                   5148 ;----------------------------
                           000003  5149 	PORT=3
                           000001  5150 	REG=1 
                           000004  5151 	VSIZE=4 
      001CFD                       5152 gpio:
      009AA0 52 04 17         [ 4] 5153 	call func_args 
      009AA3 03 5F            [ 1] 5154 	cp a,#2
      009AA5 CF 00            [ 1] 5155 	jreq 1$
      009AA7 18 35 01         [ 2] 5156 	jp syntax_error  
      001D07                       5157 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AAA 00 17            [ 2] 5158 	ldw x,(PORT,sp)
      009AAC 2B 17            [ 1] 5159 	jrmi bad_port
      009AAC 92 BC 00         [ 2] 5160 	cpw x,#9
      009AAF 17 27            [ 1] 5161 	jrpl bad_port
      009AB1 27 5F            [ 1] 5162 	ld a,#5
      009AB3 16               [ 4] 5163 	mul x,a
      009AB4 03 CD 9A         [ 2] 5164 	addw x,#GPIO_BASE 
      009AB7 7F 25            [ 2] 5165 	ldw (PORT,sp),x  
      009AB9 2F 92            [ 2] 5166 	ldw x,(REG,sp) 
      009ABB AF 00 17         [ 2] 5167 	addw x,(PORT,sp)
      009ABE 6B 01            [ 1] 5168 	ld a,#TK_INTGR
      001D1F                       5169 	_drop VSIZE 
      009AC0 5C 92            [ 2]    1     addw sp,#VSIZE 
      009AC2 AF               [ 4] 5170 	ret
      001D22                       5171 bad_port:
      009AC3 00 17            [ 1] 5172 	ld a,#ERR_BAD_VALUE
      009AC5 6B 02 5C         [ 2] 5173 	jp tb_error
                                   5174 
                                   5175 
                                   5176 ;-------------------------
                                   5177 ; BASIC: UFLASH 
                                   5178 ; return user flash address
                                   5179 ; input:
                                   5180 ;  none 
                                   5181 ; output:
                                   5182 ;	A		TK_INTGR
                                   5183 ;   X 		user address 
                                   5184 ;---------------------------
      001D27                       5185 uflash:
      009AC8 72 FB 01         [ 2] 5186 	ldw x,#user_space 
      009ACB CD 9A            [ 1] 5187 	ld a,#TK_INTGR 
      009ACD 2C               [ 4] 5188 	ret 
                                   5189 
                                   5190 
                                   5191 ;---------------------
                                   5192 ; BASIC: USR(addr[,arg])
                                   5193 ; execute a function written 
                                   5194 ; in binary code.
                                   5195 ; binary fonction should 
                                   5196 ; return token attribute in A 
                                   5197 ; and value in X. 
                                   5198 ; input:
                                   5199 ;   addr	routine address 
                                   5200 ;   arg 	is an optional argument 
                                   5201 ; output:
                                   5202 ;   A 		token attribute 
                                   5203 ;   X       returned value 
                                   5204 ;---------------------
      001D2D                       5205 usr:
      009ACE CD 9A            [ 2] 5206 	pushw y 	
      009AD0 11 AE 02         [ 4] 5207 	call func_args 
      009AD3 80 C3            [ 1] 5208 	cp a,#1 
      009AD5 00 17            [ 1] 5209 	jreq 2$
      009AD7 2A D3            [ 1] 5210 	cp a,#2
      009AD9 27 03            [ 1] 5211 	jreq 2$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AD9 72 5F 00         [ 2] 5212 	jp syntax_error 
      009ADC 17 72            [ 2] 5213 2$: popw y  ; arg|addr 
      009ADE 5F 00            [ 1] 5214 	cp a,#1
      009AE0 18 72            [ 1] 5215 	jreq 3$
      009AE2 5F               [ 2] 5216 	popw x ; addr
      009AE3 00               [ 1] 5217 	exgw x,y 
      009AE4 19 5B            [ 4] 5218 3$: call (y)
      009AE6 04 98            [ 2] 5219 	popw y 
      009AE8 81               [ 4] 5220 	ret 
                                   5221 
                                   5222 ;------------------------------
                                   5223 ; BASIC: BYE 
                                   5224 ; halt mcu in its lowest power mode 
                                   5225 ; wait for reset or external interrupt
                                   5226 ; do a cold start on wakeup.
                                   5227 ;------------------------------
      009AE9                       5228 bye:
      009AE9 5B 04 99 81 FB   [ 2] 5229 	btjf UART1_SR,#UART_SR_TC,.
      009AED 8E               [10] 5230 	halt
      009AED 72 01 00         [ 2] 5231 	jp cold_start  
                                   5232 
                                   5233 ;----------------------------------
                                   5234 ; BASIC: AUTORUN ["file_name"] 
                                   5235 ; record in eeprom at adrress AUTORUN_NAME
                                   5236 ; the name of file to load and execute
                                   5237 ; at startup. 
                                   5238 ; empty string delete autorun name 
                                   5239 ; no argument display autorun name  
                                   5240 ; input:
                                   5241 ;   file_name   file to execute 
                                   5242 ; output:
                                   5243 ;   none
                                   5244 ;-----------------------------------
      001D53                       5245 autorun: 
      009AF0 24 05 A6 07 CC   [ 2] 5246 	btjf flags,#FRUN,0$ 
      009AF5 88 F3            [ 1] 5247 	jreq 0$ 
      009AF7 A6 07            [ 1] 5248 	ld a,#ERR_CMD_ONLY 
      009AF7 CE 00 1F         [ 2] 5249 	jp tb_error 
      001D5F                       5250 0$:	
      009AFA 72 B0 00         [ 4] 5251 	call next_token
      009AFD 1D 26            [ 1] 5252 	jrne 1$
      009AFF 0C AE 88         [ 2] 5253 	ldw x,#AUTORUN_NAME
      009B02 8C CD 83         [ 4] 5254 	call puts 
      009B05 33               [ 1] 5255 	clr a 
      009B06 55               [ 4] 5256 	ret 
      001D6C                       5257 1$:
      009B07 00 04            [ 1] 5258 	cp a,#TK_QSTR
      009B09 00 02            [ 1] 5259 	jreq 2$
      009B0B 81 08 71         [ 2] 5260 	jp syntax_error 
      009B0C                       5261 2$:	
      009B0C 52               [ 1] 5262 	tnz (x) 
      009B0D 08 1F            [ 1] 5263 	jrne 3$
                                   5264 ; empty string, delete autorun 	
      009B0F 01 CD 89         [ 4] 5265 	call cancel_autorun
      009B12 E3 A1 02 27 03   [ 1] 5266 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B17 CC               [ 4] 5267 	ret 
      009B18 88               [ 2] 5268 3$:	pushw x 
      009B19 F1 93            [ 1] 5269 	ldw y,x  
      009B1A CD 1A 20         [ 4] 5270 	call search_file 
      009B1A 1F 03            [ 1] 5271 	jrc 4$ 
      009B1C CD 81            [ 1] 5272 	ld a,#ERR_NOT_FILE
      009B1E DC CD 84         [ 2] 5273 	jp tb_error  
      001D8C                       5274 4$: 
      009B21 12 1C 00 03 72   [ 1] 5275 	mov in,count 
      009B26 FB 01 4F 72      [ 1] 5276 	clr farptr 
      009B2A BB 00 1B         [ 2] 5277 	ldw x,#AUTORUN_NAME
      009B2D C9 00 1A         [ 2] 5278 	ldw farptr+1,x 
      009B30 A1 02            [ 2] 5279 	ldw x,(1,sp)  
      009B32 2B 0A A3         [ 4] 5280 	call strlen  ; return length in X 
      009B35 80               [ 2] 5281 	incw x 
      009B36 00 2B            [ 2] 5282 	popw y 
      009B38 05               [ 2] 5283 	pushw x 
      009B39 A6               [ 1] 5284 	clrw x 
      009B3A 0E CC 88         [ 4] 5285 	call write_block 
      001DA8                       5286 	_drop 2 
      009B3D F3 02            [ 2]    1     addw sp,#2 
      009B3E 81               [ 4] 5287 	ret 
                                   5288 
                                   5289 ;----------------------------------
                                   5290 ; BASIC: SLEEP 
                                   5291 ; halt mcu until reset or external
                                   5292 ; interrupt.
                                   5293 ; Resume progam after SLEEP command
                                   5294 ;----------------------------------
      001DAB                       5295 sleep:
      009B3E 16 03 CD 9A A0   [ 2] 5296 	btjf UART1_SR,#UART_SR_TC,.
      009B43 24 05 A6 08      [ 1] 5297 	bset flags,#FSLEEP
      009B47 CC               [10] 5298 	halt 
      009B48 88               [ 4] 5299 	ret 
                                   5300 
                                   5301 ;-------------------------------
                                   5302 ; BASIC: PAUSE expr 
                                   5303 ; suspend execution for n msec.
                                   5304 ; input:
                                   5305 ;	none
                                   5306 ; output:
                                   5307 ;	none 
                                   5308 ;------------------------------
      001DB6                       5309 pause:
      009B49 F3 11 63         [ 4] 5310 	call expression
      009B4A A1 84            [ 1] 5311 	cp a,#TK_INTGR
      009B4A CE 00            [ 1] 5312 	jreq pause02 
      009B4C 1A C6 00         [ 2] 5313 	jp syntax_error
      001DC0                       5314 pause02: 
      009B4F 1C               [ 2] 5315 1$: tnzw x 
      009B50 CF 00            [ 1] 5316 	jreq 2$
      009B52 17               [10] 5317 	wfi 
      009B53 C7               [ 2] 5318 	decw x 
      009B54 00 19            [ 1] 5319 	jrne 1$
      009B56 16               [ 1] 5320 2$:	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B57 03               [ 4] 5321 	ret 
                                   5322 
                                   5323 ;------------------------------
                                   5324 ; BASIC: AWU expr
                                   5325 ; halt mcu for 'expr' milliseconds
                                   5326 ; use Auto wakeup peripheral
                                   5327 ; all oscillators stopped except LSI
                                   5328 ; range: 1ms - 511ms
                                   5329 ; input:
                                   5330 ;  none
                                   5331 ; output:
                                   5332 ;  none:
                                   5333 ;------------------------------
      001DC9                       5334 awu:
      009B58 AE 16 E0         [ 4] 5335   call expression
      009B5B CD 84            [ 1] 5336   cp a,#TK_INTGR
      009B5D 30 CD            [ 1] 5337   jreq awu02
      009B5F 84 12 5C         [ 2] 5338   jp syntax_error
      001DD3                       5339 awu02:
      009B62 1C 16 E0         [ 2] 5340   cpw x,#5120
      009B65 16 01            [ 1] 5341   jrmi 1$ 
      009B67 FF 1C 00 02      [ 1] 5342   mov AWU_TBR,#15 
      009B6B 90 CE            [ 1] 5343   ld a,#30
      009B6D 00               [ 2] 5344   div x,a
      009B6E 1D 90            [ 1] 5345   ld a,#16
      009B70 F6               [ 2] 5346   div x,a 
      009B71 90 5C            [ 2] 5347   jra 4$
      001DE4                       5348 1$: 
      009B73 F7 5C 90         [ 2] 5349   cpw x,#2048
      009B76 C3 00            [ 1] 5350   jrmi 2$ 
      009B78 1F 27 05 A3      [ 1] 5351   mov AWU_TBR,#14
      009B7C 17 60            [ 1] 5352   ld a,#80
      009B7E 2B               [ 2] 5353   div x,a 
      009B7F EF 10            [ 2] 5354   jra 4$   
      009B80                       5355 2$:
      009B80 17 07 50 F2      [ 1] 5356   mov AWU_TBR,#7
      009B82                       5357 3$:  
                                   5358 ; while X > 64  divide by 2 and increment AWU_TBR 
      009B82 A3 17 60         [ 2] 5359   cpw x,#64 
      009B85 27 04            [ 2] 5360   jrule 4$ 
      009B87 7F 5C 20 F7      [ 1] 5361   inc AWU_TBR 
      009B8B 54               [ 2] 5362   srlw x 
      009B8B AE 16            [ 2] 5363   jra 3$ 
      001E02                       5364 4$:
      009B8D E0               [ 1] 5365   ld a, xl
      009B8E CD               [ 1] 5366   dec a 
      009B8F 81 F0            [ 1] 5367   jreq 5$
      009B91 AE               [ 1] 5368   dec a 	
      001E07                       5369 5$: 
      009B92 00 80            [ 1] 5370   and a,#0x3e 
      009B94 CD 9A 2C         [ 1] 5371   ld AWU_APR,a 
      009B97 AE 16 E0 16      [ 1] 5372   bset AWU_CSR,#AWU_CSR_AWUEN
      009B9B 07               [10] 5373   halt 
                                   5374 
      009B9C 90               [ 4] 5375   ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5376 
                                   5377 ;------------------------------
                                   5378 ; BASIC: TICKS
                                   5379 ; return msec ticks counter value 
                                   5380 ; input:
                                   5381 ; 	none 
                                   5382 ; output:
                                   5383 ;	X 		TK_INTGR
                                   5384 ;-------------------------------
      001E12                       5385 get_ticks:
      009B9D C3 00 1F         [ 2] 5386 	ldw x,ticks 
      009BA0 2B CD            [ 1] 5387 	ld a,#TK_INTGR
      009BA2 CE               [ 4] 5388 	ret 
                                   5389 
                                   5390 
                                   5391 
                                   5392 ;------------------------------
                                   5393 ; BASIC: ABS(expr)
                                   5394 ; return absolute value of expr.
                                   5395 ; input:
                                   5396 ;   none
                                   5397 ; output:
                                   5398 ;   X     	positive integer
                                   5399 ;-------------------------------
      001E18                       5400 abs:
      009BA3 00 17 C6         [ 4] 5401 	call func_args 
      009BA6 00 19            [ 1] 5402 	cp a,#1 
      009BA8 CF 00            [ 1] 5403 	jreq 0$ 
      009BAA 1A C7 00         [ 2] 5404 	jp syntax_error
      001E22                       5405 0$:  
      009BAD 1C               [ 2] 5406     popw x   
      009BAE 1E               [ 1] 5407 	ld a,xh 
      009BAF 01 CD            [ 1] 5408 	bcp a,#0x80 
      009BB1 8A 80            [ 1] 5409 	jreq 2$ 
      009BB3 5B               [ 2] 5410 	negw x 
      009BB4 08 81            [ 1] 5411 2$: ld a,#TK_INTGR 
      009BB6 81               [ 4] 5412 	ret 
                                   5413 
                                   5414 ;------------------------------
                                   5415 ; BASIC: AND(expr1,expr2)
                                   5416 ; Apply bit AND relation between
                                   5417 ; the 2 arguments, i.e expr1 & expr2 
                                   5418 ; output:
                                   5419 ; 	A 		TK_INTGR
                                   5420 ;   X 		result 
                                   5421 ;------------------------------
      001E2C                       5422 bit_and:
      009BB6 CD 9A 2C         [ 4] 5423 	call func_args 
      009BB9 CD 87            [ 1] 5424 	cp a,#2
      009BBB 5D 5F            [ 1] 5425 	jreq 1$
      009BBD 92 AF 00         [ 2] 5426 	jp syntax_error 
      009BC0 17               [ 2] 5427 1$:	popw x 
      009BC1 90               [ 1] 5428 	ld a,xh 
      009BC2 95 5C            [ 1] 5429 	and a,(1,sp)
      009BC4 92               [ 1] 5430 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BC5 AF               [ 1] 5431 	ld a,xl
      009BC6 00 17            [ 1] 5432 	and a,(2,sp)
      009BC8 5C               [ 1] 5433 	ld xl,a 
      001E3F                       5434 	_drop 2 
      009BC9 90 97            [ 2]    1     addw sp,#2 
      009BCB 72 B9            [ 1] 5435 	ld a,#TK_INTGR
      009BCD 00               [ 4] 5436 	ret
                                   5437 
                                   5438 ;------------------------------
                                   5439 ; BASIC: OR(expr1,expr2)
                                   5440 ; Apply bit OR relation between
                                   5441 ; the 2 arguments, i.e expr1 | expr2 
                                   5442 ; output:
                                   5443 ; 	A 		TK_INTGR
                                   5444 ;   X 		result 
                                   5445 ;------------------------------
      001E44                       5446 bit_or:
      009BCE 1D 90 CF         [ 4] 5447 	call func_args 
      009BD1 00 1F            [ 1] 5448 	cp a,#2
      009BD3 90 CE            [ 1] 5449 	jreq 1$
      009BD5 00 1D 71         [ 2] 5450 	jp syntax_error 
      009BD7                       5451 1$: 
      009BD7 92               [ 2] 5452 	popw x 
      009BD8 AF               [ 1] 5453 	ld a,xh 
      009BD9 00 17            [ 1] 5454 	or a,(1,sp)
      009BDB 90               [ 1] 5455 	ld xh,a 
      009BDC F7               [ 1] 5456 	ld a,xl 
      009BDD 5C 90            [ 1] 5457 	or a,(2,sp)
      009BDF 5C               [ 1] 5458 	ld xl,a 
      001E57                       5459 	_drop 2 
      009BE0 90 C3            [ 2]    1     addw sp,#2 
      009BE2 00 1F            [ 1] 5460 	ld a,#TK_INTGR 
      009BE4 2B               [ 4] 5461 	ret
                                   5462 
                                   5463 ;------------------------------
                                   5464 ; BASIC: XOR(expr1,expr2)
                                   5465 ; Apply bit XOR relation between
                                   5466 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5467 ; output:
                                   5468 ; 	A 		TK_INTGR
                                   5469 ;   X 		result 
                                   5470 ;------------------------------
      001E5C                       5471 bit_xor:
      009BE5 F1 81 65         [ 4] 5472 	call func_args 
      009BE7 A1 02            [ 1] 5473 	cp a,#2
      009BE7 72 01            [ 1] 5474 	jreq 1$
      009BE9 00 24 07         [ 2] 5475 	jp syntax_error 
      001E66                       5476 1$: 
      009BEC 27               [ 2] 5477 	popw x 
      009BED 05               [ 1] 5478 	ld a,xh 
      009BEE A6 07            [ 1] 5479 	xor a,(1,sp)
      009BF0 CC               [ 1] 5480 	ld xh,a 
      009BF1 88               [ 1] 5481 	ld a,xl 
      009BF2 F3 02            [ 1] 5482 	xor a,(2,sp)
      009BF3 97               [ 1] 5483 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001E6F                       5484 	_drop 2 
      009BF3 CD 89            [ 2]    1     addw sp,#2 
      009BF5 E3 A1            [ 1] 5485 	ld a,#TK_INTGR 
      009BF7 02               [ 4] 5486 	ret 
                                   5487 
                                   5488 ;------------------------------
                                   5489 ; BASIC: LSHIFT(expr1,expr2)
                                   5490 ; logical shift left expr1 by 
                                   5491 ; expr2 bits 
                                   5492 ; output:
                                   5493 ; 	A 		TK_INTGR
                                   5494 ;   X 		result 
                                   5495 ;------------------------------
      001E74                       5496 lshift:
      009BF8 27 03 CC         [ 4] 5497 	call func_args
      009BFB 88 F1            [ 1] 5498 	cp a,#2 
      009BFD 90 93            [ 1] 5499 	jreq 1$
      009BFF CD 9A A0         [ 2] 5500 	jp syntax_error
      009C02 25 05            [ 2] 5501 1$: popw y   
      009C04 A6               [ 2] 5502 	popw x 
      009C05 09 CC            [ 2] 5503 	tnzw y 
      009C07 88 F3            [ 1] 5504 	jreq 4$
      009C09 58               [ 2] 5505 2$:	sllw x 
      009C09 CD 9B            [ 2] 5506 	decw y 
      009C0B B6 CE            [ 1] 5507 	jrne 2$
      001E8A                       5508 4$:  
      009C0D 00 1F            [ 1] 5509 	ld a,#TK_INTGR
      009C0F 72               [ 4] 5510 	ret
                                   5511 
                                   5512 ;------------------------------
                                   5513 ; BASIC: RSHIFT(expr1,expr2)
                                   5514 ; logical shift right expr1 by 
                                   5515 ; expr2 bits.
                                   5516 ; output:
                                   5517 ; 	A 		TK_INTGR
                                   5518 ;   X 		result 
                                   5519 ;------------------------------
      001E8D                       5520 rshift:
      009C10 B0 00 1D         [ 4] 5521 	call func_args
      009C13 CD 8A            [ 1] 5522 	cp a,#2 
      009C15 80 81            [ 1] 5523 	jreq 1$
      009C17 CC 08 71         [ 2] 5524 	jp syntax_error
      009C17 52 03            [ 2] 5525 1$: popw y  
      009C19 CD               [ 2] 5526 	popw x
      009C1A 89 E3            [ 2] 5527 	tnzw y 
      009C1C A1 00            [ 1] 5528 	jreq 4$
      009C1E 27               [ 2] 5529 2$:	srlw x 
      009C1F 20 A1            [ 2] 5530 	decw y 
      009C21 02 27            [ 1] 5531 	jrne 2$
      001EA3                       5532 4$:  
      009C23 03 CC            [ 1] 5533 	ld a,#TK_INTGR
      009C25 88               [ 4] 5534 	ret
                                   5535 
                                   5536 ;--------------------------
                                   5537 ; BASIC: FCPU integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5538 ; set CPU frequency 
                                   5539 ;-------------------------- 
                                   5540 
      001EA6                       5541 fcpu:
      009C26 F1 90            [ 1] 5542 	ld a,#TK_INTGR
      009C28 93 55 00         [ 4] 5543 	call expect 
      009C2B 04               [ 1] 5544 	ld a,xl 
      009C2C 00 02            [ 1] 5545 	and a,#7 
      009C2E CD 9A A0         [ 1] 5546 	ld CLK_CKDIVR,a 
      009C31 25               [ 4] 5547 	ret 
                                   5548 
                                   5549 ;------------------------------
                                   5550 ; BASIC: PMODE pin#, mode 
                                   5551 ; Arduino pin. 
                                   5552 ; define pin as input or output
                                   5553 ; pin#: {0..15}
                                   5554 ; mode: INPUT|OUTPUT  
                                   5555 ;------------------------------
                           000001  5556 	PINNO=1
                           000001  5557 	VSIZE=1
      001EB2                       5558 pin_mode:
      001EB2                       5559 	_vars VSIZE 
      009C32 05 A6            [ 2]    1     sub sp,#VSIZE 
      009C34 09 CC 88         [ 4] 5560 	call arg_list 
      009C37 F3 02            [ 1] 5561 	cp a,#2 
      009C38 27 03            [ 1] 5562 	jreq 1$
      009C38 CE 00 17         [ 2] 5563 	jp syntax_error 
      009C3B C6 00            [ 2] 5564 1$: popw y ; mode 
      009C3D 19               [ 2] 5565 	popw x ; Dx pin 
      009C3E 20 0A F3         [ 4] 5566 	call select_pin 
      009C40 6B 01            [ 1] 5567 	ld (PINNO,sp),a  
      009C40 AE 01            [ 1] 5568 	ld a,#1 
      009C42 00 4F            [ 1] 5569 	tnz (PINNO,sp)
      009C44 CF 00            [ 1] 5570 	jreq 4$
      009C46 17               [ 1] 5571 2$:	sll a 
      009C47 C7 00            [ 1] 5572 	dec (PINNO,sp)
      009C49 19 FB            [ 1] 5573 	jrne 2$ 
      009C4A 6B 01            [ 1] 5574 	ld (PINNO,sp),a
      009C4A 1F 01            [ 1] 5575 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C4C 6B 03            [ 1] 5576 	ld (GPIO_CR1,x),a 
      009C4E CD 81 A8 CD      [ 2] 5577 4$:	cpw y,#OUTP 
      009C52 82 23            [ 1] 5578 	jreq 6$
                                   5579 ; input mode
      009C54 AE 00            [ 1] 5580 	ld a,(PINNO,sp)
      009C56 80               [ 1] 5581 	cpl a 
      009C57 CD 9A            [ 1] 5582 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C59 2C CD            [ 2] 5583 	jra 9$
      001EE4                       5584 6$: ;output mode  
      009C5B 9A 11            [ 1] 5585 	ld a,(PINNO,sp)
      009C5D C6 00            [ 1] 5586 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C5F 19 C0            [ 1] 5587 	ld (GPIO_CR2,x),a 
      009C61 00 1C            [ 1] 5588 	ld a,(PINNO,sp)
      009C63 C6 00            [ 1] 5589 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C65 18 C2            [ 1] 5590 9$:	ld (GPIO_DDR,x),a 
      001EF0                       5591 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C67 00 1B            [ 2]    1     addw sp,#VSIZE 
      009C69 C6               [ 4] 5592 	ret
                                   5593 
                                   5594 ;------------------------
                                   5595 ; select Arduino pin 
                                   5596 ; input:
                                   5597 ;   X 	 {0..15} Arduino Dx 
                                   5598 ; output:
                                   5599 ;   A     stm8s208 pin 
                                   5600 ;   X     base address s208 GPIO port 
                                   5601 ;---------------------------
      001EF3                       5602 select_pin:
      009C6A 00               [ 2] 5603 	sllw x 
      009C6B 17 C2 00         [ 2] 5604 	addw x,#arduino_to_8s208 
      009C6E 1A               [ 2] 5605 	ldw x,(x)
      009C6F 2B               [ 1] 5606 	ld a,xl 
      009C70 E0               [ 1] 5607 	push a 
      009C71 7B               [ 1] 5608 	swapw x 
      009C72 03 1E            [ 1] 5609 	ld a,#5 
      009C74 01               [ 4] 5610 	mul x,a 
      009C75 C7 00 1C         [ 2] 5611 	addw x,#GPIO_BASE 
      009C78 CF               [ 1] 5612 	pop a 
      009C79 00               [ 4] 5613 	ret 
                                   5614 ; translation from Arduino D0..D15 to stm8s208rb 
      001F03                       5615 arduino_to_8s208:
      009C7A 1A 5B                 5616 .byte 3,6 ; D0 
      009C7C 03 81                 5617 .byte 3,5 ; D1 
      009C7E 04 00                 5618 .byte 4,0 ; D2 
      009C7E 52 02                 5619 .byte 2,1 ; D3
      009C80 5F 1F                 5620 .byte 6,0 ; D4
      009C82 01 CF                 5621 .byte 2,2 ; D5
      009C84 00 18                 5622 .byte 2,3 ; D6
      009C86 35 01                 5623 .byte 3,1 ; D7
      009C88 00 17                 5624 .byte 3,3 ; D8
      009C8A 02 04                 5625 .byte 2,4 ; D9
      009C8A 5F 92                 5626 .byte 4,5 ; D10
      009C8C AF 00                 5627 .byte 2,6 ; D11
      009C8E 17 27                 5628 .byte 2,7 ; D12
      009C90 3B 05                 5629 .byte 2,5 ; D13
      009C91 04 02                 5630 .byte 4,2 ; D14
      009C91 92 AF                 5631 .byte 4,1 ; D15
                                   5632 
                                   5633 
                                   5634 ;------------------------------
                                   5635 ; BASIC: RND(expr)
                                   5636 ; return random number 
                                   5637 ; between 1 and expr inclusive
                                   5638 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5639 ; input:
                                   5640 ; 	none 
                                   5641 ; output:
                                   5642 ;	X 		random positive integer 
                                   5643 ;------------------------------
      001F23                       5644 random:
      009C93 00 17 27         [ 4] 5645 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C96 06 CD            [ 1] 5646 	cp a,#1
      009C98 83 20            [ 1] 5647 	jreq 1$
      009C9A 5C 20 F4         [ 2] 5648 	jp syntax_error
      001F2D                       5649 1$:  
      009C9D 5C A6            [ 1] 5650 	ld a,#0x80 
      009C9F 20 CD            [ 1] 5651 	bcp a,(1,sp)
      009CA1 83 20            [ 1] 5652 	jreq 2$
      009CA3 92 AF            [ 1] 5653 	ld a,#ERR_BAD_VALUE
      009CA5 00 17 90         [ 2] 5654 	jp tb_error
      001F38                       5655 2$: 
                                   5656 ; acc16=(x<<5)^x 
      009CA8 95 5C 92         [ 2] 5657 	ldw x,seedx 
      009CAB AF               [ 2] 5658 	sllw x 
      009CAC 00               [ 2] 5659 	sllw x 
      009CAD 17               [ 2] 5660 	sllw x 
      009CAE 5C               [ 2] 5661 	sllw x 
      009CAF 90               [ 2] 5662 	sllw x 
      009CB0 97               [ 1] 5663 	ld a,xh 
      009CB1 90 89 72         [ 1] 5664 	xor a,seedx 
      009CB4 FB 01 CD         [ 1] 5665 	ld acc16,a 
      009CB7 9A               [ 1] 5666 	ld a,xl 
      009CB8 2C CD 9A         [ 1] 5667 	xor a,seedx+1 
      009CBB 11 85 CD         [ 1] 5668 	ld acc8,a 
                                   5669 ; seedx=seedy 
      009CBE 8A 80 A6         [ 2] 5670 	ldw x,seedy 
      009CC1 0D CD 83         [ 2] 5671 	ldw seedx,x  
                                   5672 ; seedy=seedy^(seedy>>1)
      009CC4 20 1E            [ 2] 5673 	srlw y 
      009CC6 01 5C            [ 1] 5674 	ld a,yh 
      009CC8 1F 01 20         [ 1] 5675 	xor a,seedy 
      009CCB BE 00 14         [ 1] 5676 	ld seedy,a  
      009CCC 90 9F            [ 1] 5677 	ld a,yl 
      009CCC 1E 01 CD         [ 1] 5678 	xor a,seedy+1 
      009CCF 8A 80 AE         [ 1] 5679 	ld seedy+1,a 
                                   5680 ; acc16>>3 
      009CD2 9C EC CD         [ 2] 5681 	ldw x,acc16 
      009CD5 83               [ 2] 5682 	srlw x 
      009CD6 33               [ 2] 5683 	srlw x 
      009CD7 CD               [ 2] 5684 	srlw x 
                                   5685 ; x=acc16^x 
      009CD8 9A               [ 1] 5686 	ld a,xh 
      009CD9 6C 5F A6         [ 1] 5687 	xor a,acc16 
      009CDC 06               [ 1] 5688 	ld xh,a 
      009CDD 97               [ 1] 5689 	ld a,xl 
      009CDE A6 0A CD         [ 1] 5690 	xor a,acc8 
      009CE1 8A               [ 1] 5691 	ld xl,a 
                                   5692 ; seedy=x^seedy 
      009CE2 38 AE 9C         [ 1] 5693 	xor a,seedy+1
      009CE5 F4               [ 1] 5694 	ld xl,a 
      009CE6 CD               [ 1] 5695 	ld a,xh 
      009CE7 83 33 5B         [ 1] 5696 	xor a,seedy
      009CEA 02               [ 1] 5697 	ld xh,a 
      009CEB 81 20 66         [ 2] 5698 	ldw seedy,x 
                                   5699 ; return seedy modulo expr + 1 
      009CEE 69 6C            [ 2] 5700 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CF0 65               [ 2] 5701 	divw x,y 
      009CF1 73               [ 1] 5702 	ldw x,y 
      009CF2 0A               [ 2] 5703 	incw x 
      001F87                       5704 10$:
      009CF3 00 20            [ 1] 5705 	ld a,#TK_INTGR
      009CF5 62               [ 4] 5706 	ret 
                                   5707 
                                   5708 ;---------------------------------
                                   5709 ; BASIC: WORDS 
                                   5710 ; affiche la listes des mots du
                                   5711 ; dictionnaire ainsi que le nombre
                                   5712 ; de mots.
                                   5713 ;---------------------------------
                           000001  5714 	WLEN=1 ; word length
                           000002  5715 	LLEN=2 ; character sent to console
                           000003  5716 	WCNT=3 ; count words printed 
                           000003  5717 	VSIZE=3 
      001F8A                       5718 words:
      001F8A                       5719 	_vars VSIZE
      009CF6 79 74            [ 2]    1     sub sp,#VSIZE 
      009CF8 65 73            [ 1] 5720 	clr (LLEN,sp)
      009CFA 20 66            [ 1] 5721 	clr (WCNT,sp)
      009CFC 72 65 65 0A      [ 2] 5722 	ldw y,#kword_dict+2
      009D00 00               [ 1] 5723 0$:	ldw x,y
      009D01 F6               [ 1] 5724 	ld a,(x)
      009D01 52 02            [ 1] 5725 	and a,#15 
      009D03 72 5F            [ 1] 5726 	ld (WLEN,sp),a 
      009D05 00 17            [ 1] 5727 	inc (WCNT,sp)
      009D07 CD               [ 2] 5728 1$:	incw x 
      009D08 91               [ 1] 5729 	ld a,(x)
      009D09 E3 A1 84         [ 4] 5730 	call putc 
      009D0C 27 03            [ 1] 5731 	inc (LLEN,sp)
      009D0E CC 88            [ 1] 5732 	dec (WLEN,sp)
      009D10 F1 1F            [ 1] 5733 	jrne 1$
      009D12 01 CD            [ 1] 5734 	ld a,#70
      009D14 89 E3            [ 1] 5735 	cp a,(LLEN,sp)
      009D16 A1 09            [ 1] 5736 	jrmi 2$   
      009D18 27 02            [ 1] 5737 	ld a,#SPACE 
      009D1A 20 19 CD         [ 4] 5738 	call putc 
      009D1D 91 E3            [ 1] 5739 	inc (LLEN,sp) 
      009D1F A1 84            [ 2] 5740 	jra 3$
      009D21 27 03            [ 1] 5741 2$: ld a,#CR 
      009D23 CC 88 F1         [ 4] 5742 	call putc 
      009D26 9F 1E            [ 1] 5743 	clr (LLEN,sp)
      009D28 01 CF 00 18      [ 2] 5744 3$:	subw y,#2 
      009D2C 5F CD            [ 2] 5745 	ldw y,(y)
      009D2E 82 4D            [ 1] 5746 	jrne 0$ 
      009D30 1E 01            [ 1] 5747 	ld a,#CR 
      009D32 5C 20 DC         [ 4] 5748 	call putc  
      009D35 5F               [ 1] 5749 	clrw x 
      009D35 5B 02            [ 1] 5750 	ld a,(WCNT,sp)
      009D37 81               [ 1] 5751 	ld xl,a 
      009D38 CD 0A 00         [ 4] 5752 	call print_int 
      009D38 CD 90 E5         [ 2] 5753 	ldw x,#words_count_msg
      009D3B A1 01 27         [ 4] 5754 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      001FD7                       5755 	_drop VSIZE 
      009D3E 03 CC            [ 2]    1     addw sp,#VSIZE 
      009D40 88               [ 4] 5756 	ret 
      009D41 F1 85 9F A4 7F 97 A6  5757 words_count_msg: .asciz " words in dictionary\n"
             03 81 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5758 
                                   5759 
                                   5760 ;-----------------------------
                                   5761 ; BASIC: TIMER expr 
                                   5762 ; initialize count down timer 
                                   5763 ;-----------------------------
      009D4A                       5764 set_timer:
      009D4A A6 07 CD         [ 4] 5765 	call arg_list
      009D4D 90 D8            [ 1] 5766 	cp a,#1 
      009D4F CD 89            [ 1] 5767 	jreq 1$
      009D51 E3 A1 02         [ 2] 5768 	jp syntax_error
      001FFA                       5769 1$: 
      009D54 27               [ 2] 5770 	popw x 
      009D55 07 A1 03         [ 2] 5771 	ldw timer,x 
      009D58 27               [ 4] 5772 	ret 
                                   5773 
                                   5774 ;------------------------------
                                   5775 ; BASIC: TIMEOUT 
                                   5776 ; return state of timer 
                                   5777 ;------------------------------
      001FFF                       5778 timeout:
      009D59 06 CC 88         [ 2] 5779 	ldw x,timer 
      002002                       5780 logical_complement:
      009D5C F1               [ 2] 5781 	cplw x 
      009D5D A3 FF FF         [ 2] 5782 	cpw x,#-1
      009D5D F6 5F            [ 1] 5783 	jreq 2$
      009D5F 97               [ 1] 5784 	clrw x 
      009D60 A6 84            [ 1] 5785 2$:	ld a,#TK_INTGR
      009D60 89               [ 4] 5786 	ret 
                                   5787 
                                   5788 ;--------------------------------
                                   5789 ; BASIC NOT(expr) 
                                   5790 ; return logical complement of expr
                                   5791 ;--------------------------------
      00200C                       5792 func_not:
      009D61 A6 08 CD         [ 4] 5793 	call func_args  
      009D64 90 D8            [ 1] 5794 	cp a,#1
      009D66 85 A6            [ 1] 5795 	jreq 1$
      009D68 84 81 71         [ 2] 5796 	jp syntax_error
      009D6A 85               [ 2] 5797 1$:	popw x 
      009D6A CD 83            [ 2] 5798 	jra logical_complement
                                   5799 
                                   5800 
                                   5801 
                                   5802 ;-----------------------------------
                                   5803 ; BASIC: IWDGEN expr1 
                                   5804 ; enable independant watchdog timer
                                   5805 ; expr1 is delay in multiple of 62.5µsec
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5806 ; expr1 -> {1..16383}
                                   5807 ;-----------------------------------
      002019                       5808 enable_iwdg:
      009D6C 29 5F 97         [ 4] 5809 	call arg_list
      009D6F A6 84            [ 1] 5810 	cp a,#1 
      009D71 81 03            [ 1] 5811 	jreq 1$
      009D72 CC 08 71         [ 2] 5812 	jp syntax_error 
      009D72 5F               [ 2] 5813 1$: popw x 
      009D73 72 5D            [ 1] 5814 	push #0
      009D75 00 26 27 01      [ 1] 5815 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009D79 53               [ 1] 5816 	ld a,xh 
      009D7A A6 84            [ 1] 5817 	and a,#0x3f
      009D7C 81               [ 1] 5818 	ld xh,a  
      009D7D A3 00 FF         [ 2] 5819 2$:	cpw x,#255
      009D7D CD 90            [ 2] 5820 	jrule 3$
      009D7F E5 A1            [ 1] 5821 	inc (1,sp)
      009D81 02               [ 1] 5822 	rcf 
      009D82 27               [ 2] 5823 	rrcw x 
      009D83 03 CC            [ 2] 5824 	jra 2$
      009D85 88 F1 50 E0      [ 1] 5825 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D87 84               [ 1] 5826 	pop a  
      009D87 1E 03 2B         [ 1] 5827 	ld IWDG_PR,a 
      009D8A 17               [ 1] 5828 	ld a,xl
      009D8B A3               [ 1] 5829 	dec a 
      009D8C 00 09 2A 12      [ 1] 5830 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009D90 A6 05 42         [ 1] 5831 	ld IWDG_RLR,a 
      009D93 1C 50 00 1F      [ 1] 5832 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009D97 03               [ 4] 5833 	ret 
                                   5834 
                                   5835 
                                   5836 ;-----------------------------------
                                   5837 ; BASIC: IWDGREF  
                                   5838 ; refresh independant watchdog count down 
                                   5839 ; timer before it reset MCU. 
                                   5840 ;-----------------------------------
      00204F                       5841 refresh_iwdg:
      009D98 1E 01 72 FB      [ 1] 5842 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009D9C 03               [ 4] 5843 	ret 
                                   5844 
                                   5845 
                                   5846 ;-------------------------------------
                                   5847 ; BASIC: LOG(expr)
                                   5848 ; return logarithm base 2 of expr 
                                   5849 ; this is the position of most significant
                                   5850 ; bit set. 
                                   5851 ; input: 
                                   5852 ; output:
                                   5853 ;   X     log2 
                                   5854 ;   A     TK_INTGR 
                                   5855 ;*********************************
      002054                       5856 log2:
      009D9D A6 84 5B         [ 4] 5857 	call func_args 
      009DA0 04 81            [ 1] 5858 	cp a,#1 
      009DA2 27 03            [ 1] 5859 	jreq 1$
      009DA2 A6 0A CC         [ 2] 5860 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DA5 88               [ 2] 5861 1$: popw x 
      00205F                       5862 leading_one:
      009DA6 F3               [ 2] 5863 	tnzw x 
      009DA7 27 0A            [ 1] 5864 	jreq 4$
      009DA7 AE A7            [ 1] 5865 	ld a,#15 
      009DA9 80               [ 2] 5866 2$: rlcw x 
      009DAA A6 84            [ 1] 5867     jrc 3$
      009DAC 81               [ 1] 5868 	dec a 
      009DAD 20 FA            [ 2] 5869 	jra 2$
      009DAD 90               [ 1] 5870 3$: clrw x 
      009DAE 89               [ 1] 5871     ld xl,a
      009DAF CD 90            [ 1] 5872 4$:	ld a,#TK_INTGR
      009DB1 E5               [ 4] 5873 	ret 
                                   5874 
                                   5875 ;-----------------------------------
                                   5876 ; BASIC: BIT(expr) 
                                   5877 ; expr ->{0..15}
                                   5878 ; return 2^expr 
                                   5879 ; output:
                                   5880 ;    x    2^expr 
                                   5881 ;-----------------------------------
      00206F                       5882 bitmask:
      009DB2 A1 01 27         [ 4] 5883     call func_args 
      009DB5 07 A1            [ 1] 5884 	cp a,#1
      009DB7 02 27            [ 1] 5885 	jreq 1$
      009DB9 03 CC 88         [ 2] 5886 	jp syntax_error 
      009DBC F1               [ 2] 5887 1$: popw x 
      009DBD 90               [ 1] 5888 	ld a,xl 
      009DBE 85 A1            [ 1] 5889 	and a,#15
      009DC0 01               [ 1] 5890 	clrw x 
      009DC1 27               [ 2] 5891 	incw x 
      009DC2 02               [ 1] 5892 2$: tnz a 
      009DC3 85 51            [ 1] 5893 	jreq 3$
      009DC5 90               [ 2] 5894 	slaw x 
      009DC6 FD               [ 1] 5895 	dec a 
      009DC7 90 85            [ 2] 5896 	jra 2$ 
      009DC9 81 84            [ 1] 5897 3$: ld a,#TK_INTGR
      009DCA 81               [ 4] 5898 	ret 
                                   5899 
                                   5900 ;------------------------------
                                   5901 ; BASIC: INVERT(expr)
                                   5902 ; 1's complement 
                                   5903 ;--------------------------------
      002089                       5904 invert:
      009DCA 72 0D 52         [ 4] 5905 	call func_args
      009DCD 30 FB            [ 1] 5906 	cp a,#1 
      009DCF 8E CC            [ 1] 5907 	jreq 1$
      009DD1 86 4B 71         [ 2] 5908 	jp syntax_error
      009DD3 85               [ 2] 5909 1$: popw x  
      009DD3 72               [ 2] 5910 	cplw x 
      009DD4 01 00            [ 1] 5911 	ld a,#TK_INTGR 
      009DD6 24               [ 4] 5912 	ret 
                                   5913 
                                   5914 ;------------------------------
                                   5915 ; BASIC: DO 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5916 ; initiate a DO ... UNTIL loop 
                                   5917 ;------------------------------
                           000003  5918 	DOLP_ADR=3 
                           000005  5919 	DOLP_INW=5
                           000004  5920 	VSIZE=4 
      002098                       5921 do_loop:
      009DD7 07               [ 2] 5922 	popw x 
      002099                       5923 	_vars VSIZE 
      009DD8 27 05            [ 2]    1     sub sp,#VSIZE 
      009DDA A6               [ 2] 5924 	pushw x 
      009DDB 07 CC 88 F3      [ 2] 5925 	ldw y,basicptr 
      009DDF 17 03            [ 2] 5926 	ldw (DOLP_ADR,sp),y
      009DDF CD 89 E3 26      [ 2] 5927 	ldw y,in.w 
      009DE3 08 AE            [ 2] 5928 	ldw (DOLP_INW,sp),y
      009DE5 40 00 CD 83      [ 1] 5929 	inc loop_depth 
      009DE9 33               [ 4] 5930 	ret 
                                   5931 
                                   5932 ;--------------------------------
                                   5933 ; BASIC: UNTIL expr 
                                   5934 ; loop if exprssion is false 
                                   5935 ; else terminate loop
                                   5936 ;--------------------------------
      0020AD                       5937 until: 
      009DEA 4F 81 00 20      [ 1] 5938 	tnz loop_depth 
      009DEC 26 03            [ 1] 5939 	jrne 1$ 
      009DEC A1 02 27         [ 2] 5940 	jp syntax_error 
      0020B6                       5941 1$: 
      009DEF 03 CC 88         [ 4] 5942 	call relation 
      009DF2 F1 84            [ 1] 5943 	cp a,#TK_INTGR
      009DF3 27 03            [ 1] 5944 	jreq 2$
      009DF3 7D 26 09         [ 2] 5945 	jp syntax_error
      0020C0                       5946 2$: 
      009DF6 CD               [ 2] 5947 	tnzw x 
      009DF7 87 10            [ 1] 5948 	jrne 9$
      009DF9 55 00            [ 2] 5949 	ldw x,(DOLP_ADR,sp)
      009DFB 04 00 02         [ 2] 5950 	ldw basicptr,x 
      009DFE 81 89            [ 1] 5951 	ld a,(2,x)
      009E00 90 93 CD         [ 1] 5952 	ld count,a 
      009E03 9A A0            [ 2] 5953 	ldw x,(DOLP_INW,sp)
      009E05 25 05 A6         [ 2] 5954 	ldw in.w,x 
      009E08 09               [ 4] 5955 	ret 
      0020D3                       5956 9$:	; remove loop data from stack  
      009E09 CC               [ 2] 5957 	popw x
      0020D4                       5958 	_drop VSIZE
      009E0A 88 F3            [ 2]    1     addw sp,#VSIZE 
      009E0C 72 5A 00 20      [ 1] 5959 	dec loop_depth 
      009E0C 55               [ 2] 5960 	jp (x)
                                   5961 
                                   5962 ;--------------------------
                                   5963 ; BASIC: PRTA...PRTI  
                                   5964 ;  return constant value 
                                   5965 ;  PORT  offset in GPIO
                                   5966 ;  array
                                   5967 ;---------------------------
      0020DB                       5968 const_porta:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E0D 00 04 00         [ 2] 5969 	ldw x,#0
      009E10 02 72            [ 1] 5970 	ld a,#TK_INTGR 
      009E12 5F               [ 4] 5971 	ret 
      0020E1                       5972 const_portb:
      009E13 00 17 AE         [ 2] 5973 	ldw x,#1
      009E16 40 00            [ 1] 5974 	ld a,#TK_INTGR 
      009E18 CF               [ 4] 5975 	ret 
      0020E7                       5976 const_portc:
      009E19 00 18 1E         [ 2] 5977 	ldw x,#2
      009E1C 01 CD            [ 1] 5978 	ld a,#TK_INTGR 
      009E1E 84               [ 4] 5979 	ret 
      0020ED                       5980 const_portd:
      009E1F 12 5C 90         [ 2] 5981 	ldw x,#3
      009E22 85 89            [ 1] 5982 	ld a,#TK_INTGR 
      009E24 5F               [ 4] 5983 	ret 
      0020F3                       5984 const_porte:
      009E25 CD 82 C2         [ 2] 5985 	ldw x,#4
      009E28 5B 02            [ 1] 5986 	ld a,#TK_INTGR 
      009E2A 81               [ 4] 5987 	ret 
      009E2B                       5988 const_portf:
      009E2B 72 0D 52         [ 2] 5989 	ldw x,#5
      009E2E 30 FB            [ 1] 5990 	ld a,#TK_INTGR 
      009E30 72               [ 4] 5991 	ret 
      0020FF                       5992 const_portg:
      009E31 16 00 24         [ 2] 5993 	ldw x,#6
      009E34 8E 81            [ 1] 5994 	ld a,#TK_INTGR 
      009E36 81               [ 4] 5995 	ret 
      002105                       5996 const_porth:
      009E36 CD 91 E3         [ 2] 5997 	ldw x,#7
      009E39 A1 84            [ 1] 5998 	ld a,#TK_INTGR 
      009E3B 27               [ 4] 5999 	ret 
      00210B                       6000 const_porti:
      009E3C 03 CC 88         [ 2] 6001 	ldw x,#8
      009E3F F1 84            [ 1] 6002 	ld a,#TK_INTGR 
      009E40 81               [ 4] 6003 	ret 
                                   6004 
                                   6005 ;-------------------------------
                                   6006 ; following return constant 
                                   6007 ; related to GPIO register offset 
                                   6008 ;---------------------------------
      002111                       6009 const_odr:
      009E40 5D 27            [ 1] 6010 	ld a,#TK_INTGR 
      009E42 04 8F 5A         [ 2] 6011 	ldw x,#GPIO_ODR
      009E45 26               [ 4] 6012 	ret 
      002117                       6013 const_idr:
      009E46 F9 4F            [ 1] 6014 	ld a,#TK_INTGR 
      009E48 81 00 01         [ 2] 6015 	ldw x,#GPIO_IDR
      009E49 81               [ 4] 6016 	ret 
      00211D                       6017 const_ddr:
      009E49 CD 91            [ 1] 6018 	ld a,#TK_INTGR 
      009E4B E3 A1 84         [ 2] 6019 	ldw x,#GPIO_DDR
      009E4E 27               [ 4] 6020 	ret 
      002123                       6021 const_cr1:
      009E4F 03 CC            [ 1] 6022 	ld a,#TK_INTGR 
      009E51 88 F1 03         [ 2] 6023 	ldw x,#GPIO_CR1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E53 81               [ 4] 6024 	ret 
      002129                       6025 const_cr2:
      009E53 A3 14            [ 1] 6026 	ld a,#TK_INTGR 
      009E55 00 2B 0C         [ 2] 6027 	ldw x,#GPIO_CR2
      009E58 35               [ 4] 6028 	ret 
                                   6029 ;-------------------------
                                   6030 ;  constant for port mode
                                   6031 ;  used by PMODE 
                                   6032 ;  input or output
                                   6033 ;------------------------
      00212F                       6034 const_output:
      009E59 0F 50            [ 1] 6035 	ld a,#TK_INTGR 
      009E5B F2 A6 1E         [ 2] 6036 	ldw x,#OUTP
      009E5E 62               [ 4] 6037 	ret 
      002135                       6038 const_input:
      009E5F A6 10            [ 1] 6039 	ld a,#TK_INTGR 
      009E61 62 20 1E         [ 2] 6040 	ldw x,#INP 
      009E64 81               [ 4] 6041 	ret 
                                   6042 ;-----------------------
                                   6043 ; memory area constants
                                   6044 ;-----------------------
      00213B                       6045 const_eeprom_base:
      009E64 A3 08            [ 1] 6046 	ld a,#TK_INTGR 
      009E66 00 2B 09         [ 2] 6047 	ldw x,#EEPROM_BASE 
      009E69 35               [ 4] 6048 	ret 
                                   6049 
                                   6050 ;---------------------------
                                   6051 ; BASIC: DATA 
                                   6052 ; when the interpreter find 
                                   6053 ; a DATA line it skip it.
                                   6054 ;---------------------------
      002141                       6055 data:
      009E6A 0E 50 F2 A6 50   [ 1] 6056 	mov in,count 
      009E6F 62               [ 4] 6057 	ret 
                                   6058 
                                   6059 ;---------------------------
                                   6060 ; BASIC: DATLN  *expr*
                                   6061 ; set DATA pointer at line# 
                                   6062 ; specified by *expr* 
                                   6063 ;---------------------------
      002147                       6064 data_line:
      009E70 20 10 63         [ 4] 6065 	call expression
      009E72 A1 84            [ 1] 6066 	cp a,#TK_INTGR
      009E72 35 07            [ 1] 6067 	jreq 1$
      009E74 50 F2 71         [ 2] 6068 	jp syntax_error 
      009E76 CD 04 00         [ 4] 6069 1$: call search_lineno
      009E76 A3               [ 2] 6070 	tnzw x 
      009E77 00 40            [ 1] 6071 	jrne 3$
      009E79 23 07            [ 1] 6072 2$:	ld a,#ERR_NO_LINE 
      009E7B 72 5C 50         [ 2] 6073 	jp tb_error
      00215C                       6074 3$: ; check if valid data line 
      009E7E F2 54            [ 1] 6075     ldw y,x 
      009E80 20 F4            [ 2] 6076 	ldw x,(4,x)
      009E82 A3 21 41         [ 2] 6077 	cpw x,#data 
      009E82 9F 4A            [ 1] 6078 	jrne 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009E84 27 01 4A 06      [ 2] 6079 	ldw data_ptr,y
      009E87 90 E6 02         [ 1] 6080 	ld a,(2,y)
      009E87 A4 3E C7         [ 1] 6081 	ld data_len,a 
      009E8A 50 F1 72 18      [ 1] 6082 	mov data_ofs,#FIRST_DATA_ITEM 
      009E8E 50               [ 4] 6083 	ret
                                   6084 
                                   6085 ;---------------------------------
                                   6086 ; BASIC: RESTORE 
                                   6087 ; set data_ptr to first data line
                                   6088 ; if not DATA found pointer set to
                                   6089 ; zero 
                                   6090 ;---------------------------------
      002174                       6091 restore:
      009E8F F0 8E 81 06      [ 1] 6092 	clr data_ptr 
      009E92 72 5F 00 07      [ 1] 6093 	clr data_ptr+1
      009E92 CE 00 0F A6      [ 1] 6094 	clr data_ofs 
      009E96 84 81 00 09      [ 1] 6095 	clr data_len
      009E98 CE 00 1C         [ 2] 6096 	ldw x,txtbgn
      002187                       6097 data_search_loop: 	
      009E98 CD 90 E5         [ 2] 6098 	cpw x,txtend
      009E9B A1 01            [ 1] 6099 	jruge 9$
      009E9D 27 03            [ 1] 6100 	ldw y,x 
      009E9F CC 88            [ 2] 6101 	ldw x,(4,x)
      009EA1 F1 21 41         [ 2] 6102 	cpw x,#data 
      009EA2 26 1A            [ 1] 6103 	jrne try_next_line 
      009EA2 85 9E A5 80      [ 2] 6104 	ldw data_ptr,y 
      009EA6 27 01 50         [ 1] 6105 	ld a,(2,y)
      009EA9 A6 84 81         [ 1] 6106 	ld data_len,a 
      009EAC 35 06 00 08      [ 1] 6107 	mov data_ofs,#FIRST_DATA_ITEM
      009EAC CD 90 E5 A1      [ 1] 6108 9$:	tnz data_len 
      009EB0 02 27            [ 1] 6109     jrne 10$
      009EB2 03 CC            [ 1] 6110 	ld a,#ERR_NO_DATA 
      009EB4 88 F1 85         [ 2] 6111 	jp tb_error 
      009EB7 9E               [ 4] 6112 10$:ret
      0021AF                       6113 try_next_line:
      009EB8 14               [ 1] 6114 	ldw x,y 
      009EB9 01 95            [ 1] 6115 	ld a,(2,x)
      009EBB 9F 14 02         [ 1] 6116 	ld acc8,a 
      009EBE 97 5B 02 A6      [ 1] 6117 	clr acc16 
      009EC2 84 81 00 0C      [ 2] 6118 	addw x,acc16 
      009EC4 20 C8            [ 2] 6119 	jra data_search_loop
                                   6120 
                                   6121 
                                   6122 ;---------------------------------
                                   6123 ; BASIC: READ 
                                   6124 ; return next data item | 0 
                                   6125 ;---------------------------------
                           000001  6126 	CTX_BPTR=1 
                           000003  6127 	CTX_IN=3 
                           000004  6128 	CTX_COUNT=4 
                           000005  6129 	XSAVE=5
                           000006  6130 	VSIZE=6
      0021BF                       6131 read:
      0021BF                       6132 	_vars  VSIZE 
      009EC4 CD 90            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0021C1                       6133 read01:	
      009EC6 E5 A1 02         [ 1] 6134 	ld a,data_ofs
      009EC9 27 03 CC         [ 1] 6135 	cp a,data_len 
      009ECC 88 F1            [ 1] 6136 	jreq 2$ ; end of line  
      009ECE CD 15 14         [ 4] 6137 	call save_context
      009ECE 85 9E 1A         [ 2] 6138 	ldw x,data_ptr 
      009ED1 01 95 9F         [ 2] 6139 	ldw basicptr,x 
      009ED4 1A 02 97 5B 02   [ 1] 6140 	mov in,data_ofs 
      009ED9 A6 84 81 00 03   [ 1] 6141 	mov count,data_len  
      009EDC CD 11 63         [ 4] 6142 	call expression 
      009EDC CD 90            [ 1] 6143 	cp a,#TK_INTGR 
      009EDE E5 A1            [ 1] 6144 	jreq 1$ 
      009EE0 02 27 03         [ 2] 6145 	jp syntax_error 
      0021E6                       6146 1$:
      009EE3 CC 88            [ 2] 6147 	ldw (XSAVE,SP),x
      009EE5 F1 09 63         [ 4] 6148 	call next_token ; skip comma
      009EE6 CE 00 04         [ 2] 6149 	ldw x,basicptr 
      009EE6 85 9E 18         [ 2] 6150 	ldw data_ptr,x 
      009EE9 01 95 9F 18 02   [ 1] 6151 	mov data_ofs,in 
      009EEE 97 5B 02         [ 4] 6152 	call rest_context
      009EF1 A6 84            [ 2] 6153 	ldw x,(XSAVE,sp)
      009EF3 81 84            [ 1] 6154 	ld a,#TK_INTGR
      009EF4                       6155 	_drop VSIZE 
      009EF4 CD 90            [ 2]    1     addw sp,#VSIZE 
      009EF6 E5               [ 4] 6156 	ret 
      002200                       6157 2$: ; end of line reached 
      009EF7 A1 02 27 03      [ 2] 6158 	ldw y, data_ptr 
      009EFB CC 88 F1 90      [ 1] 6159 	clr data_ptr
      009EFF 85 85 90 5D      [ 1] 6160 	clr data_ptr+1   
      009F03 27 05 58 90      [ 1] 6161 	clr data_ofs 
      009F07 5A 26 FB 09      [ 1] 6162 	clr data_len 
      009F0A CD 21 AF         [ 4] 6163 	call try_next_line 
      009F0A A6 84            [ 2] 6164 	jra read01
                                   6165 
                                   6166 
                                   6167 ;---------------------------------
                                   6168 ; BASIC: SPIEN clkdiv, 0|1  
                                   6169 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6170 ; if clkdiv==-1 disable SPI
                                   6171 ; 0|1 -> disable|enable  
                                   6172 ;--------------------------------- 
                           000005  6173 SPI_CS_BIT=5
      002219                       6174 spi_enable:
      009F0C 81 10 6A         [ 4] 6175 	call arg_list 
      009F0D A1 02            [ 1] 6176 	cp a,#2
      009F0D CD 90            [ 1] 6177 	jreq 1$
      009F0F E5 A1 02         [ 2] 6178 	jp syntax_error 
      002223                       6179 1$: 
      009F12 27 03 CC 88      [ 1] 6180 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F16 F1               [ 2] 6181 	popw x  
      009F17 90               [ 2] 6182 	tnzw x 
      009F18 85 85            [ 1] 6183 	jreq spi_disable 
      009F1A 90               [ 2] 6184 	popw x 
      009F1B 5D 27            [ 1] 6185 	ld a,#(1<<SPI_CR1_BR)
      009F1D 05               [ 4] 6186 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F1E 54               [ 1] 6187 	ld a,xl 
      009F1F 90 5A 26         [ 1] 6188 	ld SPI_CR1,a 
                                   6189 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009F22 FB 1A 50 14      [ 1] 6190 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009F23 72 1A 50 16      [ 1] 6191 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6192 ; configure SPI as master mode 0.	
      009F23 A6 84 81 00      [ 1] 6193 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6194 ; ~CS line controlled by sofware 	
      009F26 72 12 52 01      [ 1] 6195 	bset SPI_CR2,#SPI_CR2_SSM 
      009F26 A6 84 CD 90      [ 1] 6196     bset SPI_CR2,#SPI_CR2_SSI 
                                   6197 ; enable SPI
      009F2A D8 9F A4 07      [ 1] 6198 	bset SPI_CR1,#SPI_CR1_SPE 	
      009F2E C7               [ 4] 6199 	ret 
      00224C                       6200 spi_disable:
      00224C                       6201 	_drop #2; throw first argument.
      009F2F 50 C6            [ 2]    1     addw sp,##2 
                                   6202 ; wait spi idle 
      009F31 81 82            [ 1] 6203 1$:	ld a,#0x82 
      009F32 C4 52 03         [ 1] 6204 	and a,SPI_SR
      009F32 52 01            [ 1] 6205 	cp a,#2 
      009F34 CD 90            [ 1] 6206 	jrne 1$
      009F36 EA A1 02 27      [ 1] 6207 	bres SPI_CR1,#SPI_CR1_SPE
      009F3A 03 CC 88 F1      [ 1] 6208 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009F3E 90 85 85 CD      [ 1] 6209 	bres PE_DDR,#SPI_CS_BIT 
      009F42 9F               [ 4] 6210 	ret 
                                   6211 
      002264                       6212 spi_clear_error:
      009F43 73 6B            [ 1] 6213 	ld a,#0x78 
      009F45 01 A6 01         [ 1] 6214 	bcp a,SPI_SR 
      009F48 0D 01            [ 1] 6215 	jreq 1$
      009F4A 27 0B 48 0A      [ 1] 6216 	clr SPI_SR 
      009F4E 01               [ 4] 6217 1$: ret 
                                   6218 
      002270                       6219 spi_send_byte:
      009F4F 26               [ 1] 6220 	push a 
      009F50 FB 6B 01         [ 4] 6221 	call spi_clear_error
      009F53 EA               [ 1] 6222 	pop a 
      009F54 03 E7 03 90 A3   [ 2] 6223 	btjf SPI_SR,#SPI_SR_TXE,.
      009F59 00 01 27         [ 1] 6224 	ld SPI_DR,a
      009F5C 07 7B 01 43 E4   [ 2] 6225 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009F61 02 20 0A         [ 1] 6226 	ld a,SPI_DR 
      009F64 81               [ 4] 6227 	ret 
                                   6228 
      002286                       6229 spi_rcv_byte:
      009F64 7B 01            [ 1] 6230 	ld a,#255
      009F66 EA 04 E7 04 7B   [ 2] 6231 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009F6B 01 EA 02         [ 1] 6232 	ld a,SPI_DR 
      009F6E E7               [ 4] 6233 	ret
                                   6234 
                                   6235 ;------------------------------
                                   6236 ; BASIC: SPIWR byte [,byte]
                                   6237 ; write 1 or more byte
                                   6238 ;------------------------------
      002291                       6239 spi_write:
      009F6F 02 5B 01         [ 4] 6240 	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F72 81 84            [ 1] 6241 	cp a,#TK_INTGR 
      009F73 27 03            [ 1] 6242 	jreq 1$
      009F73 58 1C 9F         [ 2] 6243 	jp syntax_error 
      00229B                       6244 1$:	
      009F76 83               [ 1] 6245 	ld a,xl 
      009F77 FE 9F 88         [ 4] 6246 	call spi_send_byte 
      009F7A 5E A6 05         [ 4] 6247 	call next_token 
      009F7D 42 1C            [ 1] 6248 	cp a,#TK_COMMA 
      009F7F 50 00            [ 1] 6249 	jrne 2$ 
      009F81 84 81            [ 2] 6250 	jra spi_write 
      009F83 4D               [ 1] 6251 2$:	tnz a 
      009F83 03 06            [ 1] 6252 	jreq 3$
      0022AB                       6253 	_unget_token  
      009F85 03 05 04 00 02   [ 1]    1     mov in,in.saved
      009F8A 01               [ 4] 6254 3$:	ret 
                                   6255 
                                   6256 
                                   6257 ;-------------------------------
                                   6258 ; BASIC: SPIRD 	
                                   6259 ; read one byte from SPI 
                                   6260 ;-------------------------------
      0022B1                       6261 spi_read:
      009F8B 06 00 02         [ 4] 6262 	call spi_rcv_byte 
      009F8E 02               [ 1] 6263 	clrw x 
      009F8F 02               [ 1] 6264 	ld xl,a 
      009F90 03 03            [ 1] 6265 	ld a,#TK_INTGR 
      009F92 01               [ 4] 6266 	ret 
                                   6267 
                                   6268 ;------------------------------
                                   6269 ; BASIC: SPISEL 0|1 
                                   6270 ; set state of ~CS line
                                   6271 ; 0|1 deselect|select  
                                   6272 ;------------------------------
      0022B9                       6273 spi_select:
      009F93 03 03 02         [ 4] 6274 	call next_token 
      009F96 04 04            [ 1] 6275 	cp a,#TK_INTGR 
      009F98 05 02            [ 1] 6276 	jreq 1$
      009F9A 06 02 07         [ 2] 6277 	jp syntax_error 
      009F9D 02               [ 2] 6278 1$: tnzw x  
      009F9E 05 04            [ 1] 6279 	jreq cs_high 
      009FA0 02 04 01 14      [ 1] 6280 	bres PE_ODR,#SPI_CS_BIT
      009FA3 81               [ 4] 6281 	ret 
      0022CB                       6282 cs_high: 
      009FA3 CD 90 E5 A1      [ 1] 6283 	bset PE_ODR,#SPI_CS_BIT
      009FA7 01               [ 4] 6284 	ret 
                                   6285 
                                   6286 
                                   6287 ;------------------------------
                                   6288 ; BASIC: FILERX
                                   6289 ; Use to receive a BASIC program
                                   6290 ; from the PC using XMODEM 
                                   6291 ; protocol. The file is store in
                                   6292 ; Each line received is compiled
                                   6293 ; then stored in RAM. When reception 
                                   6294 ; is completed with success  the 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6295 ; program is ready to be executed 
                                   6296 ; or save as local file.
                                   6297 ;--------------------------------
      0022D0                       6298 file_receive:
      009FA8 27 03 CC 88 F1   [ 2] 6299 	btjf flags,#FRUN,1$
      009FAD A6 07            [ 1] 6300 	ld a,#ERR_CMD_ONLY
      009FAD A6 80 15         [ 2] 6301 	jp tb_error 
      0022DA                       6302 1$:	
      009FB0 01 27 05         [ 4] 6303 	call clear_basic
      009FB3 A6 0A CC         [ 2] 6304 	ldw x, txtbgn
      009FB6 88 F3 00         [ 4] 6305 	call xreceive 
      009FB8 72 BB 00 1C      [ 2] 6306 	addw x,txtbgn 
      009FB8 CE 00 13         [ 2] 6307 	ldw txtend,x 
      009FBB 58 58 58         [ 4] 6308 	call print_int 
      009FBE 58 58 9E         [ 2] 6309 	ldw x,#fsize_msg 
      009FC1 C8 00 13         [ 4] 6310 	call puts 
      009FC4 C7               [ 4] 6311 	ret 
      009FC5 00 0D 9F C8 00 14 C7  6312 fsize_msg: .asciz " bytes received\n"
             00 0E CE 00 15 CF 00
             13 90 54
                                   6313 
                                   6314 ;------------------------------
                                   6315 ; BASIC: FILETX "file_name" 
                                   6316 ; Transmit the program in RAM 
                                   6317 ; To the PC using XMODEM protocol.
                                   6318 ; The file transmitted as source 
                                   6319 ; file not tokenized. 
                                   6320 ;-------------------------------
      002305                       6321 file_transmit:
                                   6322 
      009FD6 90               [ 4] 6323 	ret 
                                   6324 
                                   6325 
                                   6326 ;------------------------------
                                   6327 ;      dictionary 
                                   6328 ; format:
                                   6329 ;   link:   2 bytes 
                                   6330 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6331 ;   cmd_name: 16 byte max 
                                   6332 ;   code_address: 2 bytes 
                                   6333 ;------------------------------
                                   6334 	.macro _dict_entry len,name,cmd 
                                   6335 	.word LINK 
                                   6336 	LINK=.
                                   6337 name:
                                   6338 	.byte len 	
                                   6339 	.ascii "name"
                                   6340 	.word cmd 
                                   6341 	.endm 
                                   6342 
                           000000  6343 	LINK=0
                                   6344 ; respect alphabetic order for BASIC names from Z-A
                                   6345 ; this sort order is for a cleaner WORDS cmd output. 	
      002306                       6346 kword_end:
      002306                       6347 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FD7 9E C8                    1 	.word LINK 
                           002308     2 	LINK=.
      002308                          3 XPEEK:
      009FD9 00                       4 	.byte 5+F_IFUNC 	
      009FDA 15 C7 00 15 90           5 	.ascii "XPEEK"
      009FDF 9F C8                    6 	.word xpeek 
      002310                       6348 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009FE1 00 16                    1 	.word LINK 
                           002312     2 	LINK=.
      002312                          3 XOR:
      009FE3 C7                       4 	.byte 3+F_IFUNC 	
      009FE4 00 16 CE                 5 	.ascii "XOR"
      009FE7 00 0D                    6 	.word bit_xor 
      002318                       6349 	_dict_entry,5,WRITE,write  
      009FE9 54 54                    1 	.word LINK 
                           00231A     2 	LINK=.
      00231A                          3 WRITE:
      009FEB 54                       4 	.byte 5 	
      009FEC 9E C8 00 0D 95           5 	.ascii "WRITE"
      009FF1 9F C8                    6 	.word write 
      002322                       6350 	_dict_entry,5,WORDS,words 
      009FF3 00 0E                    1 	.word LINK 
                           002324     2 	LINK=.
      002324                          3 WORDS:
      009FF5 97                       4 	.byte 5 	
      009FF6 C8 00 16 97 9E           5 	.ascii "WORDS"
      009FFB C8 00                    6 	.word words 
      00232C                       6351 	_dict_entry 4,WAIT,wait 
      009FFD 15 95                    1 	.word LINK 
                           00232E     2 	LINK=.
      00232E                          3 WAIT:
      009FFF CF                       4 	.byte 4 	
      00A000 00 15 90 85              5 	.ascii "WAIT"
      00A004 65 93                    6 	.word wait 
      002335                       6352 	_dict_entry,3+F_IFUNC,USR,usr
      00A006 5C 2E                    1 	.word LINK 
                           002337     2 	LINK=.
      00A007                          3 USR:
      00A007 A6                       4 	.byte 3+F_IFUNC 	
      00A008 84 81 52                 5 	.ascii "USR"
      00A00A 1D 2D                    6 	.word usr 
      00233D                       6353 	_dict_entry,5,UNTIL,until 
      00A00A 52 03                    1 	.word LINK 
                           00233F     2 	LINK=.
      00233F                          3 UNTIL:
      00A00C 0F                       4 	.byte 5 	
      00A00D 02 0F 03 90 AE           5 	.ascii "UNTIL"
      00A012 A7 2E                    6 	.word until 
      002347                       6354 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A014 93 F6                    1 	.word LINK 
                           002349     2 	LINK=.
      002349                          3 UFLASH:
      00A016 A4                       4 	.byte 6+F_IFUNC 	
      00A017 0F 6B 01 0C 03 5C        5 	.ascii "UFLASH"
      00A01D F6 CD                    6 	.word uflash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      002352                       6355 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A01F 83 20                    1 	.word LINK 
                           002354     2 	LINK=.
      002354                          3 UBOUND:
      00A021 0C                       4 	.byte 6+F_IFUNC 	
      00A022 02 0A 01 26 F5 A6        5 	.ascii "UBOUND"
      00A028 46 11                    6 	.word ubound 
      00235D                       6356 	_dict_entry,4,TONE,tone  
      00A02A 02 2B                    1 	.word LINK 
                           00235F     2 	LINK=.
      00235F                          3 TONE:
      00A02C 09                       4 	.byte 4 	
      00A02D A6 20 CD 83              5 	.ascii "TONE"
      00A031 20 0C                    6 	.word tone 
      002366                       6357 	_dict_entry,2,TO,to
      00A033 02 20                    1 	.word LINK 
                           002368     2 	LINK=.
      002368                          3 TO:
      00A035 07                       4 	.byte 2 	
      00A036 A6 0D                    5 	.ascii "TO"
      00A038 CD 83                    6 	.word to 
      00236D                       6358 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A03A 20 0F                    1 	.word LINK 
                           00236F     2 	LINK=.
      00236F                          3 TIMEOUT:
      00A03C 02                       4 	.byte 7+F_IFUNC 	
      00A03D 72 A2 00 02 90 FE 26     5 	.ascii "TIMEOUT"
      00A044 CF A6                    6 	.word timeout 
      002379                       6359 	_dict_entry,5,TIMER,set_timer
      00A046 0D CD                    1 	.word LINK 
                           00237B     2 	LINK=.
      00237B                          3 TIMER:
      00A048 83                       4 	.byte 5 	
      00A049 20 5F 7B 03 97           5 	.ascii "TIMER"
      00A04E CD 8A                    6 	.word set_timer 
      002383                       6360 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A050 80 AE                    1 	.word LINK 
                           002385     2 	LINK=.
      002385                          3 TICKS:
      00A052 A0                       4 	.byte 5+F_IFUNC 	
      00A053 5A CD 83 33 5B           5 	.ascii "TICKS"
      00A058 03 81                    6 	.word get_ticks 
      00238D                       6361 	_dict_entry,4,STOP,stop 
      00A05A 20 77                    1 	.word LINK 
                           00238F     2 	LINK=.
      00238F                          3 STOP:
      00A05C 6F                       4 	.byte 4 	
      00A05D 72 64 73 20              5 	.ascii "STOP"
      00A061 69 6E                    6 	.word stop 
      002396                       6362 	_dict_entry,4,STEP,step 
      00A063 20 64                    1 	.word LINK 
                           002398     2 	LINK=.
      002398                          3 STEP:
      00A065 69                       4 	.byte 4 	
      00A066 63 74 69 6F              5 	.ascii "STEP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A06A 6E 61                    6 	.word step 
      00239F                       6363 	_dict_entry,5,SPIWR,spi_write
      00A06C 72 79                    1 	.word LINK 
                           0023A1     2 	LINK=.
      0023A1                          3 SPIWR:
      00A06E 0A                       4 	.byte 5 	
      00A06F 00 50 49 57 52           5 	.ascii "SPIWR"
      00A070 22 91                    6 	.word spi_write 
      0023A9                       6364 	_dict_entry,6,SPISEL,spi_select
      00A070 CD 90                    1 	.word LINK 
                           0023AB     2 	LINK=.
      0023AB                          3 SPISEL:
      00A072 EA                       4 	.byte 6 	
      00A073 A1 01 27 03 CC 88        5 	.ascii "SPISEL"
      00A079 F1 B9                    6 	.word spi_select 
      00A07A                       6365 	_dict_entry,5,SPIEN,spi_enable 
      00A07A 85 CF                    1 	.word LINK 
                           0023B6     2 	LINK=.
      0023B6                          3 SPIEN:
      00A07C 00                       4 	.byte 5 	
      00A07D 11 81 49 45 4E           5 	.ascii "SPIEN"
      00A07F 22 19                    6 	.word spi_enable 
      0023BE                       6366 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A07F CE 00                    1 	.word LINK 
                           0023C0     2 	LINK=.
      0023C0                          3 SPIRD:
      00A081 11                       4 	.byte 5+F_IFUNC 	
      00A082 53 50 49 52 44           5 	.ascii "SPIRD"
      00A082 53 A3                    6 	.word spi_read 
      0023C8                       6367 	_dict_entry,5,SLEEP,sleep 
      00A084 FF FF                    1 	.word LINK 
                           0023CA     2 	LINK=.
      0023CA                          3 SLEEP:
      00A086 27                       4 	.byte 5 	
      00A087 01 5F A6 84 81           5 	.ascii "SLEEP"
      00A08C 1D AB                    6 	.word sleep 
      0023D2                       6368 	_dict_entry,4+F_IFUNC,SIZE,size
      00A08C CD 90                    1 	.word LINK 
                           0023D4     2 	LINK=.
      0023D4                          3 SIZE:
      00A08E E5                       4 	.byte 4+F_IFUNC 	
      00A08F A1 01 27 03              5 	.ascii "SIZE"
      00A093 CC 88                    6 	.word size 
      0023DB                       6369     _dict_entry,4,SHOW,show 
      00A095 F1 85                    1 	.word LINK 
                           0023DD     2 	LINK=.
      0023DD                          3 SHOW:
      00A097 20                       4 	.byte 4 	
      00A098 E9 48 4F 57              5 	.ascii "SHOW"
      00A099 11 FE                    6 	.word show 
      0023E4                       6370 	_dict_entry,4,SAVE,save
      00A099 CD 90                    1 	.word LINK 
                           0023E6     2 	LINK=.
      0023E6                          3 SAVE:
      00A09B EA                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A09C A1 01 27 03              5 	.ascii "SAVE"
      00A0A0 CC 88                    6 	.word save 
      0023ED                       6371 	_dict_entry 3,RUN,run
      00A0A2 F1 85                    1 	.word LINK 
                           0023EF     2 	LINK=.
      0023EF                          3 RUN:
      00A0A4 4B                       4 	.byte 3 	
      00A0A5 00 35 CC                 5 	.ascii "RUN"
      00A0A8 50 E0                    6 	.word run 
      0023F5                       6372 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A0AA 9E A4                    1 	.word LINK 
                           0023F7     2 	LINK=.
      0023F7                          3 RSHIFT:
      00A0AC 3F                       4 	.byte 6+F_IFUNC 	
      00A0AD 95 A3 00 FF 23 06        5 	.ascii "RSHIFT"
      00A0B3 0C 01                    6 	.word rshift 
      002400                       6373 	_dict_entry,3+F_IFUNC,RND,random 
      00A0B5 98 56                    1 	.word LINK 
                           002402     2 	LINK=.
      002402                          3 RND:
      00A0B7 20                       4 	.byte 3+F_IFUNC 	
      00A0B8 F5 35 55                 5 	.ascii "RND"
      00A0BB 50 E0                    6 	.word random 
      002408                       6374 	_dict_entry,6,RETURN,return 
      00A0BD 84 C7                    1 	.word LINK 
                           00240A     2 	LINK=.
      00240A                          3 RETURN:
      00A0BF 50                       4 	.byte 6 	
      00A0C0 E1 9F 4A 35 55 50        5 	.ascii "RETURN"
      00A0C6 E0 C7                    6 	.word return 
      002413                       6375 	_dict_entry,7,RESTORE,restore 
      00A0C8 50 E2                    1 	.word LINK 
                           002415     2 	LINK=.
      002415                          3 RESTORE:
      00A0CA 35                       4 	.byte 7 	
      00A0CB AA 50 E0 81 4F 52 45     5 	.ascii "RESTORE"
      00A0CF 21 74                    6 	.word restore 
      00241F                       6376 	_dict_entry 6,REMARK,remark 
      00A0CF 35 AA                    1 	.word LINK 
                           002421     2 	LINK=.
      002421                          3 REMARK:
      00A0D1 50                       4 	.byte 6 	
      00A0D2 E0 81 4D 41 52 4B        5 	.ascii "REMARK"
      00A0D4 15 A0                    6 	.word remark 
      00242A                       6377 	_dict_entry,6,REBOOT,cold_start
      00A0D4 CD 90                    1 	.word LINK 
                           00242C     2 	LINK=.
      00242C                          3 REBOOT:
      00A0D6 E5                       4 	.byte 6 	
      00A0D7 A1 01 27 03 CC 88        5 	.ascii "REBOOT"
      00A0DD F1 85                    6 	.word cold_start 
      00A0DF                       6378 	_dict_entry,4+F_IFUNC,READ,read  
      00A0DF 5D 27                    1 	.word LINK 
                           002437     2 	LINK=.
      002437                          3 READ:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0E1 0A                       4 	.byte 4+F_IFUNC 	
      00A0E2 A6 0F 59 25              5 	.ascii "READ"
      00A0E6 03 4A                    6 	.word read 
      00243E                       6379 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0E8 20 FA                    1 	.word LINK 
                           002440     2 	LINK=.
      002440                          3 QKEY:
      00A0EA 5F                       4 	.byte 4+F_IFUNC 	
      00A0EB 97 A6 84 81              5 	.ascii "QKEY"
      00A0EF 1C F2                    6 	.word qkey 
      002447                       6380 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A0EF CD 90                    1 	.word LINK 
                           002449     2 	LINK=.
      002449                          3 PRTI:
      00A0F1 E5                       4 	.byte 4+F_IFUNC 	
      00A0F2 A1 01 27 03              5 	.ascii "PRTI"
      00A0F6 CC 88                    6 	.word const_porti 
      002450                       6381 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A0F8 F1 85                    1 	.word LINK 
                           002452     2 	LINK=.
      002452                          3 PRTH:
      00A0FA 9F                       4 	.byte 4+F_IFUNC 	
      00A0FB A4 0F 5F 5C              5 	.ascii "PRTH"
      00A0FF 4D 27                    6 	.word const_porth 
      002459                       6382 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A101 04 58                    1 	.word LINK 
                           00245B     2 	LINK=.
      00245B                          3 PRTG:
      00A103 4A                       4 	.byte 4+F_IFUNC 	
      00A104 20 F9 A6 84              5 	.ascii "PRTG"
      00A108 81 FF                    6 	.word const_portg 
      00A109                       6383 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A109 CD 90                    1 	.word LINK 
                           002464     2 	LINK=.
      002464                          3 PRTF:
      00A10B E5                       4 	.byte 4+F_IFUNC 	
      00A10C A1 01 27 03              5 	.ascii "PRTF"
      00A110 CC 88                    6 	.word const_portf 
      00246B                       6384 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A112 F1 85                    1 	.word LINK 
                           00246D     2 	LINK=.
      00246D                          3 PRTE:
      00A114 53                       4 	.byte 4+F_IFUNC 	
      00A115 A6 84 81 45              5 	.ascii "PRTE"
      00A118 20 F3                    6 	.word const_porte 
      002474                       6385 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A118 85 52                    1 	.word LINK 
                           002476     2 	LINK=.
      002476                          3 PRTD:
      00A11A 04                       4 	.byte 4+F_IFUNC 	
      00A11B 89 90 CE 00              5 	.ascii "PRTD"
      00A11F 05 17                    6 	.word const_portd 
      00247D                       6386 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A121 03 90                    1 	.word LINK 
                           00247F     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00247F                          3 PRTC:
      00A123 CE                       4 	.byte 4+F_IFUNC 	
      00A124 00 01 17 05              5 	.ascii "PRTC"
      00A128 72 5C                    6 	.word const_portc 
      002486                       6387 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A12A 00 21                    1 	.word LINK 
                           002488     2 	LINK=.
      002488                          3 PRTB:
      00A12C 81                       4 	.byte 4+F_IFUNC 	
      00A12D 50 52 54 42              5 	.ascii "PRTB"
      00A12D 72 5D                    6 	.word const_portb 
      00248F                       6388 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A12F 00 21                    1 	.word LINK 
                           002491     2 	LINK=.
      002491                          3 PRTA:
      00A131 26                       4 	.byte 4+F_IFUNC 	
      00A132 03 CC 88 F1              5 	.ascii "PRTA"
      00A136 20 DB                    6 	.word const_porta 
      002498                       6389 	_dict_entry 5,PRINT,print 
      00A136 CD 92                    1 	.word LINK 
                           00249A     2 	LINK=.
      00249A                          3 PRINT:
      00A138 27                       4 	.byte 5 	
      00A139 A1 84 27 03 CC           5 	.ascii "PRINT"
      00A13E 88 F1                    6 	.word print 
      00A140                       6390 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A140 5D 26                    1 	.word LINK 
                           0024A4     2 	LINK=.
      0024A4                          3 POUT:
      00A142 10                       4 	.byte 4+F_IFUNC 	
      00A143 1E 03 CF 00              5 	.ascii "POUT"
      00A147 05 E6                    6 	.word const_output 
      0024AB                       6391 	_dict_entry,4,POKE,poke 
      00A149 02 C7                    1 	.word LINK 
                           0024AD     2 	LINK=.
      0024AD                          3 POKE:
      00A14B 00                       4 	.byte 4 	
      00A14C 04 1E 05 CF              5 	.ascii "POKE"
      00A150 00 01                    6 	.word poke 
      0024B4                       6392 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A152 81 AD                    1 	.word LINK 
                           0024B6     2 	LINK=.
      00A153                          3 PINP:
      00A153 85                       4 	.byte 4+F_IFUNC 	
      00A154 5B 04 72 5A              5 	.ascii "PINP"
      00A158 00 21                    6 	.word const_input 
      0024BD                       6393 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A15A FC B6                    1 	.word LINK 
                           0024BF     2 	LINK=.
      00A15B                          3 PEEK:
      00A15B AE                       4 	.byte 4+F_IFUNC 	
      00A15C 00 00 A6 84              5 	.ascii "PEEK"
      00A160 81 32                    6 	.word peek 
      00A161                       6394 	_dict_entry,5,PMODE,pin_mode 
      00A161 AE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                           0024C8     2 	LINK=.
      0024C8                          3 PMODE:
      00A163 01                       4 	.byte 5 	
      00A164 A6 84 81 44 45           5 	.ascii "PMODE"
      00A167 1E B2                    6 	.word pin_mode 
      0024D0                       6395 	_dict_entry,5,PAUSE,pause 
      00A167 AE 00                    1 	.word LINK 
                           0024D2     2 	LINK=.
      0024D2                          3 PAUSE:
      00A169 02                       4 	.byte 5 	
      00A16A A6 84 81 53 45           5 	.ascii "PAUSE"
      00A16D 1D B6                    6 	.word pause 
      0024DA                       6396 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A16D AE 00                    1 	.word LINK 
                           0024DC     2 	LINK=.
      0024DC                          3 OR:
      00A16F 03                       4 	.byte 2+F_IFUNC 	
      00A170 A6 84                    5 	.ascii "OR"
      00A172 81 44                    6 	.word bit_or 
      00A173                       6397 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A173 AE 00                    1 	.word LINK 
                           0024E3     2 	LINK=.
      0024E3                          3 ODR:
      00A175 04                       4 	.byte 3+F_IFUNC 	
      00A176 A6 84 81                 5 	.ascii "ODR"
      00A179 21 11                    6 	.word const_odr 
      0024E9                       6398 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A179 AE 00                    1 	.word LINK 
                           0024EB     2 	LINK=.
      0024EB                          3 NOT:
      00A17B 05                       4 	.byte 3+F_IFUNC 	
      00A17C A6 84 81                 5 	.ascii "NOT"
      00A17F 20 0C                    6 	.word func_not 
      0024F1                       6399 	_dict_entry,3,NEW,new
      00A17F AE 00                    1 	.word LINK 
                           0024F3     2 	LINK=.
      0024F3                          3 NEW:
      00A181 06                       4 	.byte 3 	
      00A182 A6 84 81                 5 	.ascii "NEW"
      00A185 19 7C                    6 	.word new 
      0024F9                       6400 	_dict_entry,4,NEXT,next 
      00A185 AE 00                    1 	.word LINK 
                           0024FB     2 	LINK=.
      0024FB                          3 NEXT:
      00A187 07                       4 	.byte 4 	
      00A188 A6 84 81 54              5 	.ascii "NEXT"
      00A18B 16 F3                    6 	.word next 
      002502                       6401 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A18B AE 00                    1 	.word LINK 
                           002504     2 	LINK=.
      002504                          3 LSHIFT:
      00A18D 08                       4 	.byte 6+F_IFUNC 	
      00A18E A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A191 1E 74                    6 	.word lshift 
      00250D                       6402 	_dict_entry,3+F_IFUNC,LOG,log2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A191 A6 84                    1 	.word LINK 
                           00250F     2 	LINK=.
      00250F                          3 LOG:
      00A193 AE                       4 	.byte 3+F_IFUNC 	
      00A194 00 00 81                 5 	.ascii "LOG"
      00A197 20 54                    6 	.word log2 
      002515                       6403 	_dict_entry,4,LOAD,load 
      00A197 A6 84                    1 	.word LINK 
                           002517     2 	LINK=.
      002517                          3 LOAD:
      00A199 AE                       4 	.byte 4 	
      00A19A 00 01 81 44              5 	.ascii "LOAD"
      00A19D 1B 67                    6 	.word load 
      00251E                       6404 	_dict_entry 4,LIST,list
      00A19D A6 84                    1 	.word LINK 
                           002520     2 	LINK=.
      002520                          3 LIST:
      00A19F AE                       4 	.byte 4 	
      00A1A0 00 02 81 54              5 	.ascii "LIST"
      00A1A3 12 A0                    6 	.word list 
      002527                       6405 	_dict_entry 3,LET,let 
      00A1A3 A6 84                    1 	.word LINK 
                           002529     2 	LINK=.
      002529                          3 LET:
      00A1A5 AE                       4 	.byte 3 	
      00A1A6 00 03 81                 5 	.ascii "LET"
      00A1A9 12 75                    6 	.word let 
      00252F                       6406 	_dict_entry,3+F_IFUNC,KEY,key 
      00A1A9 A6 84                    1 	.word LINK 
                           002531     2 	LINK=.
      002531                          3 KEY:
      00A1AB AE                       4 	.byte 3+F_IFUNC 	
      00A1AC 00 04 81                 5 	.ascii "KEY"
      00A1AF 1C EA                    6 	.word key 
      002537                       6407 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A1AF A6 84                    1 	.word LINK 
                           002539     2 	LINK=.
      002539                          3 IWDGREF:
      00A1B1 AE                       4 	.byte 7 	
      00A1B2 00 01 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A1B5 20 4F                    6 	.word refresh_iwdg 
      002543                       6408 	_dict_entry,6,IWDGEN,enable_iwdg
      00A1B5 A6 84                    1 	.word LINK 
                           002545     2 	LINK=.
      002545                          3 IWDGEN:
      00A1B7 AE                       4 	.byte 6 	
      00A1B8 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A1BB 20 19                    6 	.word enable_iwdg 
      00254E                       6409 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A1BB A6 84                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 INVERT:
      00A1BD AE                       4 	.byte 6+F_IFUNC 	
      00A1BE 40 00 81 45 52 54        5 	.ascii "INVERT"
      00A1C1 20 89                    6 	.word invert 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      002559                       6410 	_dict_entry,5,INPUT,input_var  
      00A1C1 55 00                    1 	.word LINK 
                           00255B     2 	LINK=.
      00255B                          3 INPUT:
      00A1C3 04                       4 	.byte 5 	
      00A1C4 00 02 81 55 54           5 	.ascii "INPUT"
      00A1C7 15 34                    6 	.word input_var 
      002563                       6411 	_dict_entry,2,IF,if 
      00A1C7 CD 91                    1 	.word LINK 
                           002565     2 	LINK=.
      002565                          3 IF:
      00A1C9 E3                       4 	.byte 2 	
      00A1CA A1 84                    5 	.ascii "IF"
      00A1CC 27 03                    6 	.word if 
      00256A                       6412 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A1CE CC 88                    1 	.word LINK 
                           00256C     2 	LINK=.
      00256C                          3 IDR:
      00A1D0 F1                       4 	.byte 3+F_IFUNC 	
      00A1D1 CD 84 80                 5 	.ascii "IDR"
      00A1D4 5D 26                    6 	.word const_idr 
      002572                       6413 	_dict_entry,3,HEX,hex_base
      00A1D6 05 A6                    1 	.word LINK 
                           002574     2 	LINK=.
      002574                          3 HEX:
      00A1D8 05                       4 	.byte 3 	
      00A1D9 CC 88 F3                 5 	.ascii "HEX"
      00A1DC 12 3F                    6 	.word hex_base 
      00257A                       6414 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A1DC 90 93                    1 	.word LINK 
                           00257C     2 	LINK=.
      00257C                          3 GPIO:
      00A1DE EE                       4 	.byte 4+F_IFUNC 	
      00A1DF 04 A3 A1 C1              5 	.ascii "GPIO"
      00A1E3 26 F2                    6 	.word gpio 
      002583                       6415 	_dict_entry,4,GOTO,goto 
      00A1E5 90 CF                    1 	.word LINK 
                           002585     2 	LINK=.
      002585                          3 GOTO:
      00A1E7 00                       4 	.byte 4 	
      00A1E8 07 90 E6 02              5 	.ascii "GOTO"
      00A1EC C7 00                    6 	.word goto 
      00258C                       6416 	_dict_entry,5,GOSUB,gosub 
      00A1EE 0A 35                    1 	.word LINK 
                           00258E     2 	LINK=.
      00258E                          3 GOSUB:
      00A1F0 06                       4 	.byte 5 	
      00A1F1 00 09 81 55 42           5 	.ascii "GOSUB"
      00A1F4 17 6E                    6 	.word gosub 
      002596                       6417 	_dict_entry,6,FORGET,forget 
      00A1F4 72 5F                    1 	.word LINK 
                           002598     2 	LINK=.
      002598                          3 FORGET:
      00A1F6 00                       4 	.byte 6 	
      00A1F7 07 72 5F 00 08 72        5 	.ascii "FORGET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A1FD 5F 00                    6 	.word forget 
      0025A1                       6418 	_dict_entry,3,FOR,for 
      00A1FF 09 72                    1 	.word LINK 
                           0025A3     2 	LINK=.
      0025A3                          3 FOR:
      00A201 5F                       4 	.byte 3 	
      00A202 00 0A CE                 5 	.ascii "FOR"
      00A205 00 1D                    6 	.word for 
      00A207                       6419 	_dict_entry,6,FILETX,file_transmit
      00A207 C3 00                    1 	.word LINK 
                           0025AB     2 	LINK=.
      0025AB                          3 FILETX:
      00A209 1F                       4 	.byte 6 	
      00A20A 24 17 90 93 EE 04        5 	.ascii "FILETX"
      00A210 A3 A1                    6 	.word file_transmit 
      0025B4                       6420 	_dict_entry,6,FILERX,file_receive 
      00A212 C1 26                    1 	.word LINK 
                           0025B6     2 	LINK=.
      0025B6                          3 FILERX:
      00A214 1A                       4 	.byte 6 	
      00A215 90 CF 00 07 90 E6        5 	.ascii "FILERX"
      00A21B 02 C7                    6 	.word file_receive 
      0025BF                       6421 	_dict_entry,4,FCPU,fcpu 
      00A21D 00 0A                    1 	.word LINK 
                           0025C1     2 	LINK=.
      0025C1                          3 FCPU:
      00A21F 35                       4 	.byte 4 	
      00A220 06 00 09 72              5 	.ascii "FCPU"
      00A224 5D 00                    6 	.word fcpu 
      0025C8                       6422 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A226 0A 26                    1 	.word LINK 
                           0025CA     2 	LINK=.
      0025CA                          3 EEPROM:
      00A228 05                       4 	.byte 6+F_IFUNC 	
      00A229 A6 0C CC 88 F3 81        5 	.ascii "EEPROM"
      00A22F 21 3B                    6 	.word const_eeprom_base 
      0025D3                       6423 	_dict_entry,3,END,cmd_end  
      00A22F 93 E6                    1 	.word LINK 
                           0025D5     2 	LINK=.
      0025D5                          3 END:
      00A231 02                       4 	.byte 3 	
      00A232 C7 00 0E                 5 	.ascii "END"
      00A235 72 5F                    6 	.word cmd_end 
      0025DB                       6424 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A237 00 0D                    1 	.word LINK 
                           0025DD     2 	LINK=.
      0025DD                          3 DWRITE:
      00A239 72                       4 	.byte 6+F_CMD 	
      00A23A BB 00 0D 20 C8 45        5 	.ascii "DWRITE"
      00A23F 18 F5                    6 	.word digital_write 
      0025E6                       6425 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A23F 52 06                    1 	.word LINK 
                           0025E8     2 	LINK=.
      00A241                          3 DREAD:
      00A241 C6                       4 	.byte 5+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A242 00 09 C1 00 0A           5 	.ascii "DREAD"
      00A247 27 37                    6 	.word digital_read 
      0025F0                       6426 	_dict_entry,2,DO,do_loop
      00A249 CD 95                    1 	.word LINK 
                           0025F2     2 	LINK=.
      0025F2                          3 DO:
      00A24B 94                       4 	.byte 2 	
      00A24C CE 00                    5 	.ascii "DO"
      00A24E 07 CF                    6 	.word do_loop 
      0025F7                       6427 	_dict_entry,3,DIR,directory 
      00A250 00 05                    1 	.word LINK 
                           0025F9     2 	LINK=.
      0025F9                          3 DIR:
      00A252 55                       4 	.byte 3 	
      00A253 00 09 00                 5 	.ascii "DIR"
      00A256 02 55                    6 	.word directory 
      0025FF                       6428 	_dict_entry,3,DEC,dec_base
      00A258 00 0A                    1 	.word LINK 
                           002601     2 	LINK=.
      002601                          3 DEC:
      00A25A 00                       4 	.byte 3 	
      00A25B 04 CD 91                 5 	.ascii "DEC"
      00A25E E3 A1                    6 	.word dec_base 
      002607                       6429 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A260 84 27                    1 	.word LINK 
                           002609     2 	LINK=.
      002609                          3 DDR:
      00A262 03                       4 	.byte 3+F_IFUNC 	
      00A263 CC 88 F1                 5 	.ascii "DDR"
      00A266 21 1D                    6 	.word const_ddr 
      00260F                       6430 	_dict_entry,6,DATALN,data_line  
      00A266 1F 05                    1 	.word LINK 
                           002611     2 	LINK=.
      002611                          3 DATALN:
      00A268 CD                       4 	.byte 6 	
      00A269 89 E3 CE 00 05 CF        5 	.ascii "DATALN"
      00A26F 00 07                    6 	.word data_line 
      00261A                       6431 	_dict_entry,4,DATA,data  
      00A271 55 00                    1 	.word LINK 
                           00261C     2 	LINK=.
      00261C                          3 DATA:
      00A273 02                       4 	.byte 4 	
      00A274 00 09 CD 95              5 	.ascii "DATA"
      00A278 A4 1E                    6 	.word data 
      002623                       6432 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A27A 05 A6                    1 	.word LINK 
                           002625     2 	LINK=.
      002625                          3 CRL:
      00A27C 84                       4 	.byte 3+F_IFUNC 	
      00A27D 5B 06 81                 5 	.ascii "CRL"
      00A280 21 23                    6 	.word const_cr1 
      00262B                       6433 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A280 90 CE                    1 	.word LINK 
                           00262D     2 	LINK=.
      00262D                          3 CRH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A282 00                       4 	.byte 3+F_IFUNC 	
      00A283 07 72 5F                 5 	.ascii "CRH"
      00A286 00 07                    6 	.word const_cr2 
      002633                       6434 	_dict_entry,4+F_CFUNC,CHAR,char
      00A288 72 5F                    1 	.word LINK 
                           002635     2 	LINK=.
      002635                          3 CHAR:
      00A28A 00                       4 	.byte 4+F_CFUNC 	
      00A28B 08 72 5F 00              5 	.ascii "CHAR"
      00A28F 09 72                    6 	.word char 
      00263C                       6435 	_dict_entry,3,BYE,bye 
      00A291 5F 00                    1 	.word LINK 
                           00263E     2 	LINK=.
      00263E                          3 BYE:
      00A293 0A                       4 	.byte 3 	
      00A294 CD A2 2F                 5 	.ascii "BYE"
      00A297 20 A8                    6 	.word bye 
      00A299                       6436 	_dict_entry,5,BTOGL,bit_toggle
      00A299 CD 90                    1 	.word LINK 
                           002646     2 	LINK=.
      002646                          3 BTOGL:
      00A29B EA                       4 	.byte 5 	
      00A29C A1 02 27 03 CC           5 	.ascii "BTOGL"
      00A2A1 88 F1                    6 	.word bit_toggle 
      00A2A3                       6437 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A2A3 72 12                    1 	.word LINK 
                           002650     2 	LINK=.
      002650                          3 BTEST:
      00A2A5 50                       4 	.byte 5+F_IFUNC 	
      00A2A6 C7 85 5D 27 21           5 	.ascii "BTEST"
      00A2AB 85 A6                    6 	.word bit_test 
      002658                       6438 	_dict_entry,4,BSET,bit_set 
      00A2AD 08 42                    1 	.word LINK 
                           00265A     2 	LINK=.
      00265A                          3 BSET:
      00A2AF 9F                       4 	.byte 4 	
      00A2B0 C7 52 00 72              5 	.ascii "BSET"
      00A2B4 1A 50                    6 	.word bit_set 
      002661                       6439 	_dict_entry,4,BRES,bit_reset
      00A2B6 14 72                    1 	.word LINK 
                           002663     2 	LINK=.
      002663                          3 BRES:
      00A2B8 1A                       4 	.byte 4 	
      00A2B9 50 16 72 14              5 	.ascii "BRES"
      00A2BD 52 00                    6 	.word bit_reset 
      00266A                       6440 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A2BF 72 12                    1 	.word LINK 
                           00266C     2 	LINK=.
      00266C                          3 BIT:
      00A2C1 52                       4 	.byte 3+F_IFUNC 	
      00A2C2 01 72 10                 5 	.ascii "BIT"
      00A2C5 52 01                    6 	.word bitmask 
      002672                       6441 	_dict_entry,3,AWU,awu 
      00A2C7 72 1C                    1 	.word LINK 
                           002674     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002674                          3 AWU:
      00A2C9 52                       4 	.byte 3 	
      00A2CA 00 81 55                 5 	.ascii "AWU"
      00A2CC 1D C9                    6 	.word awu 
      00267A                       6442 	_dict_entry,7,AUTORUN,autorun
      00A2CC 5B 02                    1 	.word LINK 
                           00267C     2 	LINK=.
      00267C                          3 AUTORUN:
      00A2CE A6                       4 	.byte 7 	
      00A2CF 82 C4 52 03 A1 02 26     5 	.ascii "AUTORUN"
      00A2D6 F7 72                    6 	.word autorun 
      002686                       6443 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A2D8 1D 52                    1 	.word LINK 
                           002688     2 	LINK=.
      002688                          3 ASC:
      00A2DA 00                       4 	.byte 3+F_IFUNC 	
      00A2DB 72 13 50                 5 	.ascii "ASC"
      00A2DE C7 72                    6 	.word ascii 
      00268E                       6444 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A2E0 1B 50                    1 	.word LINK 
                           002690     2 	LINK=.
      002690                          3 AND:
      00A2E2 16                       4 	.byte 3+F_IFUNC 	
      00A2E3 81 4E 44                 5 	.ascii "AND"
      00A2E4 1E 2C                    6 	.word bit_and 
      002696                       6445 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A2E4 A6 78                    1 	.word LINK 
                           002698     2 	LINK=.
      002698                          3 ADCREAD:
      00A2E6 C5                       4 	.byte 7+F_IFUNC 	
      00A2E7 52 03 27 04 72 5F 52     5 	.ascii "ADCREAD"
      00A2EE 03 81                    6 	.word analog_read 
      00A2F0                       6446 	_dict_entry,5,ADCON,power_adc 
      00A2F0 88 CD                    1 	.word LINK 
                           0026A4     2 	LINK=.
      0026A4                          3 ADCON:
      00A2F2 A2                       4 	.byte 5 	
      00A2F3 E4 84 72 03 52           5 	.ascii "ADCON"
      00A2F8 03 FB                    6 	.word power_adc 
      0026AC                       6447 kword_dict:
      0026AC                       6448 	_dict_entry,3+F_IFUNC,ABS,abs
      00A2FA C7 52                    1 	.word LINK 
                           0026AE     2 	LINK=.
      0026AE                          3 ABS:
      00A2FC 04                       4 	.byte 3+F_IFUNC 	
      00A2FD 72 01 52                 5 	.ascii "ABS"
      00A300 03 FB                    6 	.word abs 
                                   6449 	
                                   6450 
      002700                       6451 	.bndry 128 ; align on FLASH block.
                                   6452 ; free space for user application  
      002700                       6453 user_space:
                                   6454 ; USR() function test
      00A302 C6               [ 2] 6455 	pushw x 
      00A303 52 04 81 0A      [ 1] 6456 	bset PC_ODR,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A306 85               [ 2] 6457 	popw x 
      00A306 A6 FF 72         [ 4] 6458 	call pause02 
      00A309 01 52 03 E3      [ 1] 6459 	bres PC_ODR,#5 
      00A30D C6               [ 4] 6460 	ret
                                   6461 
                                   6462 	.area FLASH_DRIVE (ABS)
      010000                       6463 	.org 0x10000
      010000                       6464 fdrive:
                                   6465 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0026AE R   |     ACK     =  000006 
  5 ADCON      0026A4 R   |   5 ADCREAD    002698 R   |     ADC_CR1 =  005401 
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
  5 AND        002690 R   |     AREG    =  000002     |     ARG_OFS =  000002 
  5 ASC        002688 R   |     ATTRIB  =  000002     |   5 AUTORUN    00267C R
    AUTORUN_=  004000     |   5 AWU        002674 R   |   5 AWUHandl   000001 R
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
    BINARY  =  000001     |   5 BIT        00266C R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       002663 R
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       00265A R
    BSIZE   =  000001     |   5 BTEST      002650 R   |   5 BTOGL      002646 R
    BTW     =  000001     |   5 BYE        00263E R   |     C       =  000001 
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
  5 CHAR       002635 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        00262D R
  5 CRL        002625 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       00261C R   |   5 DATALN     002611 R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   5 DDR        002609 R   |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        002601 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        0025F9 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   5 DO         0025F2 R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |   5 DREAD      0025E8 R   |   5 DWRITE     0025DD R
  5 EEPROM     0025CA R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EM      =  000019     |   5 END        0025D5 R
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       0025C1 R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |   5 FILERX     0025B6 R   |   5 FILETX     0025AB R
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
    FLSI    =  01F400     |   5 FOR        0025A3 R   |   5 FORGET     002598 R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      00258E R   |   5 GOTO       002585 R
  5 GPIO       00257C R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002574 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        00256C R
  5 IF         002565 R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00255B R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
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
    INT_VECT=  008058     |   5 INVERT     002550 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002545 R
  5 IWDGREF    002539 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002531 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002529 R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  0026AE R   |   5 LIST       002520 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOAD       002517 R   |   5 LOG        00250F R   |   5 LSHIFT     002504 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0024F3 R
    NEW_FREE=  000001     |   5 NEXT       0024FB R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0024EB R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0024E3 R   |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         0024DC R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000080     |   5 PAUSE      0024D2 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       0024BF R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       0024B6 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      0024C8 R   |   5 POKE       0024AD R   |     PORT    =  000003 
  5 POUT       0024A4 R   |     PREV    =  000001     |   5 PRINT      00249A R
    PROD    =  000002     |   5 PRTA       002491 R   |   5 PRTB       002488 R
  5 PRTC       00247F R   |   5 PRTD       002476 R   |   5 PRTE       00246D R
  5 PRTF       002464 R   |   5 PRTG       00245B R   |   5 PRTH       002452 R
  5 PRTI       002449 R   |   5 QKEY       002440 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       002437 R
  5 REBOOT     00242C R   |     REG     =  000001     |     RELOP   =  000005 
  5 REMARK     002421 R   |   5 RESTORE    002415 R   |     RETL1   =  000001 
  5 RETURN     00240A R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        002402 R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     0023F7 R   |     RST_SR  =  0050B3     |   5 RUN        0023EF R
    RXCHAR  =  000001     |   5 SAVE       0023E6 R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0023DD R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       0023D4 R   |     SKIP    =  000005     |   5 SLEEP      0023CA R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0023B6 R   |   5 SPIRD      0023C0 R   |   5 SPISEL     0023AB R
  5 SPIWR      0023A1 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002398 R   |   5 STOP       00238F R
    STREND  =  00000A     |     STRING  =  000002     |     STX     =  000002 
    SUB     =  00001A     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      002385 R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
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
  5 TIMEOUT    00236F R   |   5 TIMER      00237B R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  000001 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000085     |   5 TO         002368 R
  5 TONE       00235F R   |   5 Timer4Up   000037 R   |     U8      =  000003 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002354 R
  5 UBTN_Han   00007A R   |   5 UFLASH     002349 R   |   5 UNTIL      00233F R
    US      =  00001F     |   5 USER_ABO   000082 R   |   5 USR        002337 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00004D R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       00232E R   |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH   =  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      002324 R   |   5 WRITE      00231A R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XADR    =  000001 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        002312 R   |   5 XPEEK      002308 R
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E18 R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   000B99 R   |   5 add        000F2E R
  5 add_char   001483 R   |   5 analog_r   001891 R   |   5 ansi_seq   000B5B R
  5 arduino_   001F03 R   |   5 arg_list   00106A R   |   1 array_si   000021 R
  5 ascii      001CCA R   |   5 at_tst     000DA0 R   |   5 atoi24     000EB1 R
  5 atoi_exi   000F17 R   |   5 autorun    001D53 R   |   5 autorun_   0006C8 R
  5 awu        001DC9 R   |   5 awu02      001DD3 R   |   5 bad_port   001D22 R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       001819 R
  5 bin_exit   000C7E R   |   5 bit_and    001E2C R   |   5 bit_or     001E44 R
  5 bit_rese   0015DB R   |   5 bit_set    0015CB R   |   5 bit_test   0015FC R
  5 bit_togg   0015EC R   |   5 bit_xor    001E5C R   |   5 bitmask    00206F R
  5 bkslsh_t   000D4D R   |   5 bksp       0002BD R   |   5 block_er   0001A3 R
  5 break_po   00195E R   |   5 bye        001D4A R   |   5 cancel_a   000690 R
  5 char       001CB8 R   |   5 clear_ba   0006DD R   |   5 clear_va   00055D R
  5 clock_in   00009D R   |   5 cmd_end    001805 R   |   5 cmd_line   0008FB R
  5 cmd_name   000FD9 R   |   5 cmp_name   0019FF R   |   5 cold_sta   0005CB R
  5 colon_ts   000D74 R   |   5 comma_ts   000D7F R   |   5 comp_msg   000851 R
  5 compile    0004EA R   |   5 const_cr   002123 R   |   5 const_cr   002129 R
  5 const_dd   00211D R   |   5 const_ee   00213B R   |   5 const_id   002117 R
  5 const_in   002135 R   |   5 const_od   002111 R   |   5 const_ou   00212F R
  5 const_po   0020DB R   |   5 const_po   0020E1 R   |   5 const_po   0020E7 R
  5 const_po   0020ED R   |   5 const_po   0020F3 R   |   5 const_po   0020F9 R
  5 const_po   0020FF R   |   5 const_po   002105 R   |   5 const_po   00210B R
  5 convert_   000BF5 R   |   5 copy_com   000DD5 R   |   1 count      000003 R
  5 cp_loop    001019 R   |   5 create_g   000451 R   |   5 cs_high    0022CB R
  5 cstk_pro   001218 R   |   5 dash_tst   000D95 R   |   5 data       002141 R
  1 data_len   000009 R   |   5 data_lin   002147 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   002187 R   |   5 dec_base   001244 R
  5 del_back   000B8A R   |   5 del_line   000424 R   |   5 del_ln     000B7B R
  5 delete     0002CD R   |   5 digital_   0018C5 R   |   5 digital_   0018F5 R
  5 dir_loop   001C0A R   |   5 director   001BFE R   |   5 disk_fre   0019EC R
  5 divide     000F84 R   |   5 divu24_8   000AAC R   |   5 do_loop    002098 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 do_progr   000196 R   |   5 drive_fr   001C74 R   |   5 enable_i   002019 R
  5 eql_tst    000E2A R   |   5 equal      001496 R   |   5 erase_fl   0001C2 R
  5 err_bad_   0007BD R   |   5 err_buf_   000833 R   |   5 err_cmd_   000781 R
  5 err_div0   000746 R   |   5 err_dupl   00079B R   |   5 err_math   00072D R
  5 err_mem_   000712 R   |   5 err_msg    0006F2 R   |   5 err_no_a   0007C9 R
  5 err_no_d   0007FC R   |   5 err_no_f   000820 R   |   5 err_no_l   000755 R
  5 err_no_p   00080C R   |   5 err_not_   0007AC R   |   5 err_run_   00076B R
  5 err_synt   00071F R   |   5 escaped    000C0A R   |   5 expect     001058 R
  5 expr_exi   0011A4 R   |   5 expressi   001163 R   |   5 factor     0010BA R
  1 farptr     000016 R   |   5 fcpu       001EA6 R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001C6C R   |   5 file_rec   0022D0 R
  5 file_tra   002305 R   |   5 final_te   000B55 R   |   5 first_li   0012C9 R
  1 flags      000023 R   |   5 for        001673 R   |   5 forget     001B97 R
  1 free_ram   00005A R   |   5 fsize_ms   0022F4 R   |   5 func_arg   001065 R
  5 func_not   00200C R   |   5 ge         001498 R   |   5 get_arra   001095 R
  5 get_targ   00173D R   |   5 get_tick   001E12 R   |   5 get_toke   000CE6 R
  5 getc       0002A9 R   |   5 gosub      00176E R   |   5 goto       001753 R
  5 gpio       001CFD R   |   5 gt         001494 R   |   5 gt_tst     000E35 R
  5 hex_base   00123F R   |   5 hex_dump   000355 R   |   5 if         00165F R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   0019AC R   |   5 input_ex   00159D R   |   5 input_lo   001536 R
  5 input_va   001534 R   |   5 insert_l   00047D R   |   5 insert_l   0004E7 R
  5 interp_l   00093C R   |   5 interpre   000917 R   |   5 invert     002089 R
  5 is_alpha   00056B R   |   5 is_digit   00057C R   |   5 itoa       000A65 R
  5 itoa_loo   000A7D R   |   5 jp_to_ta   001761 R   |   5 key        001CEA R
  5 kw_loop    000C9A R   |   5 kword_di   0026AC R   |   5 kword_en   002306 R
  5 le         00149D R   |   5 leading_   00205F R   |   5 left_arr   000B5B R
  5 let        001275 R   |   5 let_arra   001283 R   |   5 let_var    001286 R
  5 lines_sk   0012CC R   |   5 list       0012A0 R   |   5 list_exi   001312 R
  5 list_sta   0012EC R   |   5 load       001B67 R   |   5 load_aut   00069F R
  5 load_fil   001B36 R   |   5 log2       002054 R   |   5 logical_   002002 R
  5 loop_bac   001720 R   |   1 loop_dep   000020 R   |   5 loop_don   001735 R
  5 lshift     001E74 R   |   5 lt         00149B R   |   5 lt_tst     000E5E R
  5 modulo     000FC8 R   |   5 move       0003BE R   |   5 move_dow   0003DC R
  5 move_era   000128 R   |   5 move_exi   0003FD R   |   5 move_loo   0003E1 R
  5 move_prg   00015C R   |   5 move_up    0003CE R   |   5 mul_char   001485 R
  5 multiply   000F3C R   |   5 mulu24_8   000AD4 R   |   5 nbr_tst    000D19 R
  5 ne         0014A0 R   |   5 neg_acc2   000B0E R   |   5 new        00197C R
  5 next       0016F3 R   |   5 next_lin   00091F R   |   5 next_tok   000963 R
  5 no_match   00102B R   |   5 other      000E87 R   |   3 pad        0016E0 R
  5 parse_bi   000C5C R   |   5 parse_in   000C12 R   |   5 parse_ke   000C99 R
  5 parse_qu   000BBD R   |   5 pause      001DB6 R   |   5 pause02    001DC0 R
  5 peek       001632 R   |   5 pin_mode   001EB2 R   |   5 plus_tst   000DFE R
  5 poke       001623 R   |   5 power_ad   001855 R   |   5 prcnt_ts   000E1F R
  5 print      0014A3 R   |   5 print_ex   001508 R   |   5 print_in   000A00 R
  5 print_ty   001514 R   |   5 program_   00013C R   |   5 program_   00015C R
  5 prt_basi   00136D R   |   5 prt_cmd_   001315 R   |   5 prt_loop   0014A7 R
  5 prt_quot   001329 R   |   5 prt_tok    0002E7 R   |   5 prti24     0009B8 R
  1 ptr16      000017 R   |   1 ptr8       000018 R   |   5 putc       0002A0 R
  5 puts       0002B3 R   |   5 qkey       001CF2 GR  |   5 qmark_ts   000DAB R
  5 random     001F23 R   |   5 read       0021BF R   |   5 read01     0021C1 R
  5 readln     000B31 R   |   5 readln_l   000B39 R   |   5 readln_q   000BAE R
  5 refresh_   00204F R   |   5 rel_exit   0011FB R   |   5 relation   0011A7 R
  5 relop_st   001488 R   |   5 remark     0015A0 R   |   5 reprint    000B5B R
  5 reset_co   0014A5 R   |   5 rest_con   001524 R   |   5 restore    002174 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 return     00178E R   |   5 right_ar   000B5B R   |   5 row_alig   001991 R
  5 row_eras   000101 R   |   5 row_eras   000128 R   |   5 row_loop   000338 R
  5 rparnt_t   000D69 R   |   5 rshift     001E8D R   |   5 rt_msg     000840 R
  5 run        0017AC R   |   5 run_it     0017DE R   |   1 rx_char    000025 R
  5 save       001A6D R   |   5 save_con   001514 R   |   5 search_d   00100B R
  5 search_e   001055 R   |   5 search_f   001A20 R   |   5 search_l   000400 R
  5 search_l   000408 R   |   5 search_n   00100F R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   0019BA R   |   5 select_p   001EF3 R
  5 set_time   001FF0 R   |   5 sharp_ts   000D8A R   |   5 show       0011FE R
  5 show_row   000326 R   |   5 single_c   00147E R   |   5 size       001249 R
  5 skip       000F1B R   |   5 slash_ts   000E14 R   |   5 sleep      001DAB R
  5 software   000585 R   |   5 spaces     0002DB R   |   5 spi_clea   002264 R
  5 spi_disa   00224C R   |   5 spi_enab   002219 R   |   5 spi_rcv_   002286 R
  5 spi_read   0022B1 R   |   5 spi_sele   0022B9 R   |   5 spi_send   002270 R
  5 spi_writ   002291 R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000E09 R   |   5 step       0016CC R   |   5 stop       001930 R
  5 store_lo   0016E0 R   |   5 str_matc   001038 R   |   5 str_tst    000D09 R
  5 strcmp     00039F R   |   5 strcpy     0003B0 R   |   5 strlen     000392 R
  5 substrac   000F36 R   |   5 syntax_e   000871 R   |   1 tab_widt   000024 R
  5 tb_error   000873 R   |   5 term       001114 R   |   5 term01     00111D R
  5 term_exi   001160 R   |   3 tib        001690 R   |   5 tick_tst   000DC3 R
  1 ticks      00000E R   |   5 timeout    001FFF R   |   1 timer      000010 R
  5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R   |   5 tk_id      000861 R
  5 to         00169C R   |   5 to_eepro   00017F R   |   5 to_flash   000193 R
  5 to_upper   000EA5 GR  |   5 token_ch   000E9E R   |   5 token_ex   000EA2 R
  5 token_ms   00031E R   |   5 tone       00180C R   |   5 try_next   0021AF R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart1_in   000265 R
  5 uart1_se   000275 R   |   5 ubound     001253 R   |   5 uflash     001D27 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R   |   5 until      0020AD R
  5 user_int   000060 R   |   5 user_spa   002700 R   |   5 usr        001D2D R
  5 var_name   001365 R   |   1 vars       000026 R   |   5 wait       0015A6 R
  5 warm_ini   000672 R   |   5 warm_sta   0008F8 R   |   5 words      001F8A R
  5 words_co   001FDA R   |   5 write      001C81 R   |   5 write_bl   000242 R
  5 write_by   0001CD R   |   5 write_ee   000209 R   |   5 write_ex   00023D R
  5 write_fl   0001F3 R   |   5 write_ro   000170 R   |   5 xpeek      001643 R
    xreceive   ****** GX  |   5 zero_pad   001986 R

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

