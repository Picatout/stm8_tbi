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
      0080F7 CD 92 CD         [ 4]  251 	call prt_basic_line
      0080FA                        252 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  253     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  254     ldw sp,x
      0080FE 9A               [ 1]  255 	rim 
      0080FF CC 88 28         [ 2]  256 	jp warm_start
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
      008183 90 A3 A6 00      [ 2]  438     cpw y,#user_space
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
      008203 CD 99 15         [ 4]  519 	call incr_farptr
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
      008401 CC 87 DF         [ 2] 1040 	jp tb_error 
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
      00841E CD 8B D2         [ 4] 1071 	call get_token
      008421 1F 01            [ 2] 1072 	ldw (XSAVE,sp),x 
      008423 A1 04            [ 1] 1073 	cp a,#TK_INTGR 
      008425 26 13            [ 1] 1074 	jrne 3$
      008427 A3 00 00         [ 2] 1075 	cpw x,#0 
      00842A 2C 05            [ 1] 1076 	jrsgt 1$
      00842C A6 0A            [ 1] 1077 	ld a,#ERR_BAD_VALUE 
      00842E CC 87 DF         [ 2] 1078 	jp tb_error ; line number must be in range {1..32767}
      008431 72 CF 00 1A      [ 5] 1079 1$:	ldw [ptr16],x; line number
      008435 CD 8B D2         [ 4] 1080 2$:	call get_token
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
      0084A1 A3 95 35         [ 2] 1133 	cpw x,#remark ; is this a comment? 
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
      0085D0 CD 88 E1         [ 4] 1277 	call prti24 
      0085D3 A6 2E            [ 1] 1278 	ld a,#'.
      0085D5 CD 82 44         [ 4] 1279 	call putc 
      0085D8 A6 00            [ 1] 1280 	ld a,#MINOR 
      0085DA C7 00 0E         [ 1] 1281 	ld acc8,a 
      0085DD 5F               [ 1] 1282 	clrw x 
      0085DE CF 00 0C         [ 2] 1283 	ldw acc24,x 
      0085E1 A6 0A            [ 1] 1284 	ld a,#10 
      0085E3 CD 88 E1         [ 4] 1285 	call prti24 
      0085E6 A6 0D            [ 1] 1286 	ld a,#CR 
      0085E8 CD 82 44         [ 4] 1287 	call putc 
      0085EB CD 99 23         [ 4] 1288 	call seek_fdrive 
      0085EE 9A               [ 1] 1289 	rim 
      0085EF 72 5C 00 18      [ 1] 1290 	inc seedy+1 
      0085F3 72 5C 00 16      [ 1] 1291 	inc seedx+1 
      0085F7 CD 86 7F         [ 4] 1292 	call clear_basic
      0085FA CD 91 B7         [ 4] 1293 	call ubound 
                                   1294 ;	jra 2$	
                                   1295 ; 150 msec beep 
      0085FD AE 00 96         [ 2] 1296 	ldw x,#150 
      008600 90 AE 03 E6      [ 2] 1297 	ldw y,#998 
      008604 CD 97 A7         [ 4] 1298 	call beep  
      008607 72 1B 50 0A      [ 1] 1299 2$:	bres PC_ODR,#LED2_BIT	
      00860B CD 86 14         [ 4] 1300 	call warm_init
      00860E CD 86 41         [ 4] 1301 	call load_autorun
      008611 CC 88 2B         [ 2] 1302     jp cmd_line  
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
      008649 CD 99 81         [ 4] 1340 	call search_file
      00864C 25 05            [ 1] 1341 	jrc 2$ 
                                   1342 ; if file doesn't exit
      00864E CD 86 32         [ 4] 1343 	call cancel_autorun
      008651 20 16            [ 2] 1344 	jra 9$ 
      008653 CD 9A 8B         [ 4] 1345 2$:	call load_file
      008656 AE 40 00         [ 2] 1346 	ldw x,#AUTORUN_NAME 
      008659 CD 82 57         [ 4] 1347 	call puts
      00865C AE 86 6A         [ 2] 1348 	ldw x,#autorun_msg 
      00865F CD 82 57         [ 4] 1349 	call puts 
      008662 72 1C 00 26      [ 1] 1350 	bset flags,#FAUTORUN 
      008666 CC 97 6C         [ 2] 1351 	jp run_it    
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
      0086A6 87 6F 87 A3 87 B4 87  1373 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace    
             C9
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
      0087A3 0A 4E 6F 20 64 61 74  1386 err_no_data: .asciz "\nNo data found.\n"
             61 20 66 6F 75 6E 64
             2E 0A 00
      0087B4 0A 4E 6F 20 70 72 6F  1387 err_no_prog: .asciz "\nNo program in RAM!\n"
             67 72 61 6D 20 69 6E
             20 52 41 4D 21 0A 00
      0087C9 0A 46 69 6C 65 20 73  1388 err_no_fspace: .asciz "\nFile system full.\n" 
             79 73 74 65 6D 20 66
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  75-Bits]



             75 6C 6C 2E 0A 00
                                   1389 
                                   1390 ;rt_msg: .asciz "last token id: "
                                   1391 
      00075D                       1392 syntax_error:
      0087D8 6C 6C            [ 1] 1393 	ld a,#ERR_SYNTAX 
                                   1394 
      00075F                       1395 tb_error:
      0087DA 2E 0A 00         [ 2] 1396 	ldw x, #err_msg 
      0087DD 72 5F 00 0C      [ 1] 1397 	clr acc16 
      0087DD A6               [ 1] 1398 	sll a
      0087DE 02 59 00 0C      [ 1] 1399 	rlc acc16  
      0087DF C7 00 0D         [ 1] 1400 	ld acc8, a 
      0087DF AE 86 90 72      [ 2] 1401 	addw x,acc16 
      0087E3 5F               [ 2] 1402 	ldw x,(x)
      0087E4 00 0D 48         [ 4] 1403 	call puts
      0087E7 72 59 00 0D C7   [ 2] 1404 	btjf flags,#FCOMP, 1$
      0087EC 00 0E 72         [ 2] 1405 	ldw x,#tib
      0087EF BB 00 0D         [ 4] 1406 	call puts 
      0087F2 FE CD            [ 1] 1407 	ld a,#CR 
      0087F4 82 57 72         [ 4] 1408 	call putc
      0087F7 0B 00 26         [ 2] 1409 	ldw x,in.w
      0087FA 18 AE 16         [ 4] 1410 	call spaces
      0087FD E8 CD            [ 1] 1411 	ld a,#'^
      0087FF 82 57 A6         [ 4] 1412 	call putc 
      008802 0D CD            [ 2] 1413 	jra 6$
      008804 82 44 CE         [ 2] 1414 1$:	ldw x,basicptr
      008807 00 01 CD         [ 1] 1415 	ld a,in 
      00880A 82 7F A6         [ 4] 1416 	call prt_basic_line
      00880D 5E CD 82 44 20   [ 2] 1417 	btjf flags,#FAUTORUN ,2$
      008812 11 CE 00         [ 4] 1418 	call cancel_autorun  
      0007A4                       1419 2$:
                                   1420 ;	ldw x,#rt_msg 
                                   1421 ;	call puts 
                                   1422 ;	clrw x 
                                   1423 ;	ld a,in.saved 
                                   1424 ;	ld xl,a 
                                   1425 ;	ld a,([basicptr],x)
                                   1426 ;	clrw x 
                                   1427 ;	ld xl,a 
                                   1428 ;	call print_int 
      008815 05 C6 00         [ 2] 1429 6$: ldw x,#STACK_EMPTY 
      008818 02               [ 1] 1430     ldw sp,x
      0007A8                       1431 warm_start:
      008819 CD 92 CD         [ 4] 1432 	call warm_init
                                   1433 ;----------------------------
                                   1434 ;   BASIC interpreter
                                   1435 ;----------------------------
      0007AB                       1436 cmd_line: ; user interface 
      00881C 72 0D 00 26      [ 1] 1437 	clr in 
      008820 03 CD            [ 1] 1438 	ld a,#CR 
      008822 86 32 C4         [ 4] 1439 	call putc 
      008824 A6 3E            [ 1] 1440 	ld a,#'> 
      008824 AE 17 FF         [ 4] 1441 	call putc
      008827 94 09 D3         [ 4] 1442 	call readln
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008828 CD 03 85         [ 4] 1443 	call compile
                                   1444 ; if text begin with a line number
                                   1445 ; the compiler set count to zero    
                                   1446 ; so code is not interpreted
      008828 CD 86 14 03      [ 1] 1447 	tnz count 
      00882B 27 E6            [ 1] 1448 	jreq cmd_line
                                   1449 ; if direct command 
                                   1450 ; it's ready to interpret 
                                   1451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1452 ;; This is the interpreter loop
                                   1453 ;; for each BASIC code line. 
                                   1454 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0007C5                       1455 interpreter: 
      00882B 72 5F 00         [ 1] 1456 	ld a,in 
      00882E 02 A6 0D         [ 1] 1457 	cp a,count 
      008831 CD 82            [ 1] 1458 	jrmi 0$
      008833 44 A6 3E CD 82   [ 2] 1459 	btjf flags, #FRUN, cmd_line
                                   1460 ;next BASIC line
      008838 44 CD 8A         [ 2] 1461 	ldw x,basicptr
      00883B 53 CD 84 05      [ 2] 1462 	addw x,in.w 
      00883F 72 5D 00         [ 2] 1463 	cpw x,txtend 
      008842 04 27            [ 1] 1464 	jrpl warm_start
      008844 E6 00 04         [ 2] 1465 	ldw basicptr,x ; start of next line  
      008845 E6 02            [ 1] 1466 	ld a,(2,x)
      008845 C6 00 02         [ 1] 1467 	ld count,a 
      008848 C1 00 04 2B      [ 1] 1468 	mov in,#3 ; skip first 3 bytes of line 
      0007EA                       1469 0$: 
      00884C 1D 72 01         [ 4] 1470 	call next_token
      00884F 00               [ 2] 1471 	tnzw x 
      008850 26 D9            [ 1] 1472 	jrmi 4$ 
      008852 CE 00            [ 1] 1473 	cp a,#TK_COLON 
      008854 05 72            [ 1] 1474 	jreq interpreter 
      008856 BB 00            [ 1] 1475 	cp a,#TK_VAR
      008858 01 C3            [ 1] 1476 	jrne 2$
      00885A 00 21 2A         [ 4] 1477 	call let_var  
      00885D CA CF            [ 2] 1478 	jra interpreter 
      0007FD                       1479 2$:	
      00885F 00 05            [ 1] 1480 	cp a,#TK_ARRAY 
      008861 E6 02            [ 1] 1481 	jrne 3$
      008863 C7 00 04         [ 4] 1482 	call let_array 
      008866 35 03            [ 2] 1483 	jra interpreter 
      000806                       1484 3$:	
      008868 00 02 5D         [ 2] 1485 	jp syntax_error 
      00886A                       1486 4$:
      00886A CD 88            [ 1] 1487 	cp a,#TK_CMD
      00886C 90 5D            [ 1] 1488 	jrne 3$
      00886E 2B               [ 4] 1489 	call (x) 
      00886F 19 A1            [ 2] 1490 	jra interpreter 
                                   1491 
                                   1492 		
                                   1493 ;--------------------------
                                   1494 ; extract next token from
                                   1495 ; token list 
                                   1496 ; basicptr -> base address 
                                   1497 ; in  -> offset in list array 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 ; output:
                                   1499 ;   A 		token attribute
                                   1500 ;   X 		token value if there is one
                                   1501 ;----------------------------------------
      000810                       1502 next_token:
      008871 01               [ 1] 1503 	clrw x 
      008872 27 D1 A1         [ 1] 1504 	ld a,in 
      008875 05 26 05         [ 1] 1505 	sub a,count ; don't replace sub by cp.  
      008878 CD 91            [ 1] 1506 	jrmi 0$
      00887A EA               [ 4] 1507 	ret  ; end of BASIC line 
      00081A                       1508 0$: 
      00887B 20 C8 01 00 02   [ 1] 1509 	mov in.saved,in 
      00887D 90 CE 00 04      [ 2] 1510 	ldw y,basicptr 
      00887D A1 0A 26 05      [ 2] 1511 	addw y,in.w 
      008881 CD 91            [ 1] 1512 	ld a,(y)
      008883 E7 20            [ 2] 1513 	incw y  
      008885 BF 0A            [ 1] 1514 	cp a,#TK_ARRAY
      008886 2A 29            [ 1] 1515 	jrpl 9$  ; no attribute for these
      008886 CC 87            [ 1] 1516 	cp a,#TK_INTGR
      008888 DD 08            [ 1] 1517 	jrmi 1$
                                   1518 ; attribute type WORD 	
      008889 93               [ 1] 1519 	ldw x,y 
      008889 A1               [ 2] 1520 	ldw x,(x)
      00888A 06 26 F9 FD      [ 2] 1521 	addw y,#2  
      00888E 20 B5            [ 2] 1522 	jra 9$
      008890                       1523 1$: ; 
      008890 5F C6            [ 1] 1524 	cp a,#TK_CHAR
      008892 00 02            [ 1] 1525 	jrne 2$
      008894 C0 00            [ 1] 1526 	ld a,(y)
      008896 04 2B            [ 2] 1527 	incw y
      008898 01               [ 1] 1528 	clrw x 
      008899 81               [ 1] 1529 	ld xl,a 
      00889A A6 03            [ 1] 1530 	ld a,#TK_CHAR
      00889A 55 00            [ 2] 1531 	jra 9$ 
      00889C 02 00            [ 1] 1532 2$:	cp a,#TK_QSTR 
      00889E 03 90            [ 1] 1533 	jrne 9$
      0088A0 CE               [ 1] 1534 	ldw x,y 
                                   1535 ; move pointer after string 
      0088A1 00 05            [ 1] 1536 3$:	tnz (y)
      0088A3 72 B9            [ 1] 1537 	jreq 4$
      0088A5 00 01            [ 2] 1538 	incw y
      0088A7 90 F6            [ 2] 1539 	jra 3$ 
      0088A9 90 5C            [ 2] 1540 4$:	incw y 
      0088AB A1 0A 2A 29      [ 2] 1541 9$: subw y,basicptr 
      0088AF A1 04 2B 08      [ 2] 1542     ldw in.w,y 
      0088B3 93               [ 4] 1543 	ret	
                                   1544 
                                   1545 
                                   1546 ;----------------------------------------
                                   1547 ;   DEBUG support functions
                                   1548 ;----------------------------------------
                           000000  1549 .if DEBUG 
                                   1550 
                                   1551 ; turn LED on 
                                   1552 ledon:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553     bset PC_ODR,#LED2_BIT
                                   1554     ret 
                                   1555 
                                   1556 ; turn LED off 
                                   1557 ledoff:
                                   1558     bres PC_ODR,#LED2_BIT 
                                   1559     ret 
                                   1560 
                                   1561 ; invert LED status 
                                   1562 ledtoggle:
                                   1563     ld a,#LED2_MASK
                                   1564     xor a,PC_ODR
                                   1565     ld PC_ODR,a
                                   1566     ret 
                                   1567 
                                   1568 left_paren:
                                   1569 	ld a,#SPACE 
                                   1570 	call putc
                                   1571 	ld a,#'( 
                                   1572 	call putc 	
                                   1573 	ret 
                                   1574 
                                   1575 ;------------------------------
                                   1576 ; print 8 bit register 
                                   1577 ; input:
                                   1578 ;   X  point to register name 
                                   1579 ;   A  register value to print 
                                   1580 ; output:
                                   1581 ;   none
                                   1582 ;------------------------------- 
                                   1583 prt_reg8:
                                   1584 	push a 
                                   1585 	call puts 
                                   1586 	ld a,(1,sp) 
                                   1587 	ld acc8,a 
                                   1588 	clrw x 
                                   1589 	ld xl,a 
                                   1590 	mov base,#16
                                   1591 	call print_int 
                                   1592 	call left_paren 
                                   1593 	pop a 
                                   1594 	clrw x 
                                   1595 	ld xl,a 
                                   1596 	mov base,#10 
                                   1597 	call print_int  
                                   1598 	ld a,#') 
                                   1599 	call putc
                                   1600 	ret
                                   1601 
                                   1602 ;--------------------------------
                                   1603 ; print 16 bits register 
                                   1604 ; input:
                                   1605 ;   X   point register name 
                                   1606 ;   Y   register value to print 
                                   1607 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1608 ;  none
                                   1609 ;--------------------------------
                                   1610 prt_reg16: 
                                   1611 	pushw y 
                                   1612 	call puts 
                                   1613 	ldw x,(1,sp) 
                                   1614 	mov base,#16 
                                   1615 	call print_int  
                                   1616 	call left_paren 
                                   1617 	popw x 
                                   1618 	mov base,#10 
                                   1619 	call print_int  
                                   1620 	ld a,#') 
                                   1621 	call putc
                                   1622 	ret 
                                   1623 
                                   1624 ;------------------------------------
                                   1625 ; print registers contents saved on
                                   1626 ; stack by trap interrupt.
                                   1627 ;------------------------------------
                                   1628 print_registers:
                                   1629 	ldw x,#STATES
                                   1630 	call puts
                                   1631 ; print EPC 
                                   1632 	ldw x, #REG_EPC
                                   1633 	call puts 
                                   1634 	ld a, (11,sp)
                                   1635 	ld acc8,a 
                                   1636 	ld a, (10,sp) 
                                   1637 	ld acc16,a 
                                   1638 	ld a,(9,sp) 
                                   1639 	ld acc24,a
                                   1640 	clrw x  
                                   1641 	ld a,#16
                                   1642 	call prti24  
                                   1643 ; print X
                                   1644 	ldw x,#REG_X
                                   1645 	ldw y,(5,sp)
                                   1646 	call prt_reg16  
                                   1647 ; print Y 
                                   1648 	ldw x,#REG_Y
                                   1649 	ldw y, (7,sp)
                                   1650 	call prt_reg16  
                                   1651 ; print A 
                                   1652 	ldw x,#REG_A
                                   1653 	ld a, (4,sp) 
                                   1654 	call prt_reg8
                                   1655 ; print CC 
                                   1656 	ldw x,#REG_CC 
                                   1657 	ld a, (3,sp) 
                                   1658 	call prt_reg8 
                                   1659 ; print SP 
                                   1660 	ldw x,#REG_SP
                                   1661 	ldw y,sp 
                                   1662 	addw y,#12
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1663 	call prt_reg16  
                                   1664 	ld a,#'\n' 
                                   1665 	call putc
                                   1666 	ret
                                   1667 
                                   1668 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1669 REG_EPC: .asciz "EPC:"
                                   1670 REG_Y:   .asciz "\nY:" 
                                   1671 REG_X:   .asciz "\nX:"
                                   1672 REG_A:   .asciz "\nA:" 
                                   1673 REG_CC:  .asciz "\nCC:"
                                   1674 REG_SP:  .asciz "\nSP:"
                                   1675 
                                   1676 .endif ; DEBUG 
                                   1677 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1678 
                                   1679 
                                   1680 ;------------------------------------
                                   1681 ; print integer in acc24 
                                   1682 ; input:
                                   1683 ;	acc24 		integer to print 
                                   1684 ;	A 			numerical base for conversion 
                                   1685 ;               if bit 7 is set add a space at print end.
                                   1686 ;   XL 			field width, 0 -> no fill.
                                   1687 ;  output:
                                   1688 ;    none 
                                   1689 ;------------------------------------
                           000001  1690 	WIDTH = 1
                           000002  1691 	BASE = 2
                           000003  1692 	ADD_SPACE=3 ; add a space after number 
                           000003  1693 	VSIZE = 3
      000861                       1694 prti24:
      000861                       1695 	_vars VSIZE 
      0088B4 FE 72            [ 2]    1     sub sp,#VSIZE 
      0088B6 A9 00            [ 1] 1696 	clr (ADD_SPACE,sp)
      0088B8 02 20            [ 1] 1697 	bcp a,#0x80 
      0088BA 1D 02            [ 1] 1698 	jreq 0$ 
      0088BB 03 03            [ 1] 1699 	cpl (ADD_SPACE,sp)
      0088BB A1 03            [ 1] 1700 0$:	and a,#31 
      0088BD 26 0A            [ 1] 1701 	ld (BASE,sp),a
      0088BF 90               [ 1] 1702 	ld a,xl
      0088C0 F6 90            [ 1] 1703 	ld (WIDTH,sp),a 
      0088C2 5C 5F            [ 1] 1704 	ld a, (BASE,sp)  
      0088C4 97 A6 03         [ 4] 1705     call itoa  ; conversion entier en  .asciz
      0088C7 20 0F            [ 1] 1706 1$: ld a,(WIDTH,sp)
      0088C9 A1 02            [ 1] 1707 	jreq 4$
      0088CB 26 0B 93         [ 1] 1708 	ld acc8,a 
      0088CE 90               [ 2] 1709 	pushw x 
      0088CF 7D 27 04         [ 4] 1710 	call strlen 
      0088D2 90               [ 1] 1711 	ld a,xl 
      0088D3 5C               [ 2] 1712 	popw x 
      0088D4 20 F8 90         [ 3] 1713 	exg a,acc8 
      0088D7 5C 72 B2         [ 1] 1714 	sub a,acc8 
      0088DA 00 05            [ 1] 1715 	jrmi 4$
      0088DC 90 CF            [ 1] 1716 	ld (WIDTH,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088DE 00 01            [ 1] 1717 	ld  a,#SPACE
      0088E0 81 01            [ 1] 1718 3$: tnz (WIDTH,sp)
      0088E1 27 06            [ 1] 1719 	jreq 4$
      0088E1 52               [ 2] 1720 	decw x 
      0088E2 03               [ 1] 1721 	ld (x),a 
      0088E3 0F 03            [ 1] 1722 	dec (WIDTH,sp) 
      0088E5 A5 80            [ 2] 1723 	jra 3$
      00089A                       1724 4$: 
      0088E7 27 02 03         [ 4] 1725 	call puts 
      0088EA 03 A4            [ 1] 1726 	tnz (ADD_SPACE,sp)
      0088EC 1F 6B            [ 1] 1727 	jreq 5$
      0088EE 02 9F            [ 1] 1728     ld a,#SPACE 
      0088F0 6B 01 7B         [ 4] 1729 	call putc 
      0008A6                       1730 5$: _drop VSIZE 
      0088F3 02 CD            [ 2]    1     addw sp,#VSIZE 
      0088F5 89               [ 4] 1731     ret	
                                   1732 
                                   1733 ;-----------------------------------
                                   1734 ; print a 16 bit integer 
                                   1735 ; using variable 'base' as conversion
                                   1736 ; format.
                                   1737 ; input:
                                   1738 ;   X       integer to print 
                                   1739 ;   base    conversion base 
                                   1740 ; output:
                                   1741 ;   none 
                                   1742 ;-----------------------------------
                           000001  1743 	SIGN=1
                           000001  1744 	VSIZE=1
      0008A9                       1745 print_int: 
      0008A9                       1746 	_vars VSIZE 
      0088F6 87 7B            [ 2]    1     sub sp,#VSIZE 
      0088F8 01 27            [ 1] 1747 	clr (SIGN,sp)
      0088FA 1F C7 00 0E      [ 2] 1748 	ldw y,#pad+PAD_SIZE-1 
      0088FE 89 CD            [ 1] 1749 	clr (y)
      008900 82 8B 9F         [ 1] 1750 	ld a,base  
      008903 85 31            [ 1] 1751 	cp a,#10 
      008905 00 0E            [ 1] 1752 	jrne 1$ 
      008907 C0               [ 2] 1753 	tnzw x 
      008908 00 0E            [ 1] 1754 	jrpl 1$ 
      00890A 2B 0E            [ 1] 1755 	cpl (SIGN,sp)
      00890C 6B               [ 2] 1756 	negw x 	 
      0008C0                       1757 1$:	
      00890D 01 A6 20         [ 1] 1758 	ld a,base 
      008910 0D               [ 2] 1759 	div x,a 
      008911 01 27            [ 1] 1760 	add a,#'0 
      008913 06 5A            [ 1] 1761 	cp a,#'9+1 
      008915 F7 0A            [ 1] 1762 	jrmi 2$ 
      008917 01 20            [ 1] 1763 	add a,#7 
      008919 F6 5A            [ 2] 1764 2$: decw y 
      00891A 90 F7            [ 1] 1765 	ld (y),a 
      00891A CD               [ 2] 1766 	tnzw x 
      00891B 82 57            [ 1] 1767 	jrne 1$ 
      00891D 0D 03            [ 1] 1768 	ld a,#16 
      00891F 27 05 A6         [ 1] 1769 	cp a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008922 20 CD            [ 1] 1770 	jrne 3$
      008924 82 44            [ 1] 1771 	ld a,#'$
      008926 5B 03            [ 2] 1772 	decw y  
      008928 81 F7            [ 1] 1773 	ld (y),a
      008929 20 0A            [ 2] 1774 	jra 9$ 
      008929 52 01            [ 1] 1775 3$: tnz (SIGN,sp)
      00892B 0F 01            [ 1] 1776 	jreq 9$ 
      00892D 90 AE            [ 1] 1777 	ld a,#'-
      00892F 17 5F            [ 2] 1778 	decw y  
      008931 90 7F            [ 1] 1779 	ld (y),a
      0008EC                       1780 9$:	
      008933 C6               [ 1] 1781 	ldw x,y 
      008934 00 0B A1         [ 2] 1782 	subw x,#pad+PAD_SIZE-1 
      008937 0A               [ 2] 1783 	negw x  
      0008F1                       1784 10$:
      008938 26               [ 1] 1785 	ld a,xl 
      008939 06 5D 2A         [ 1] 1786 	cp a,tab_width
      00893C 03 03            [ 1] 1787 	jruge 12$
      00893E 01 50            [ 2] 1788 	decw y 
      008940 A6 20            [ 1] 1789 	ld a,#SPACE 
      008940 C6 00            [ 1] 1790 	ld (y),a
      008942 0B               [ 2] 1791 	incw x 
      008943 62 AB            [ 2] 1792 	jra 10$ 
      000900                       1793 12$:
      008945 30               [ 1] 1794     ldw x,y 
      008946 A1 3A 2B         [ 4] 1795 	call puts  
      000904                       1796 	_drop VSIZE 
      008949 02 AB            [ 2]    1     addw sp,#VSIZE 
      00894B 07               [ 4] 1797 	ret 
                                   1798 
                                   1799 ;------------------------------------
                                   1800 ; convert integer in acc24 to string
                                   1801 ; input:
                                   1802 ;   A	  	base
                                   1803 ;	acc24	integer to convert
                                   1804 ; output:
                                   1805 ;   X  		pointer to string
                                   1806 ;------------------------------------
                           000001  1807 	SIGN=1  ; integer sign 
                           000002  1808 	BASE=2  ; numeric base 
                           000002  1809 	VSIZE=2  ;locals size
      000907                       1810 itoa:
      00894C 90 5A            [ 2] 1811 	sub sp,#VSIZE
      00894E 90 F7            [ 1] 1812 	ld (BASE,sp), a  ; base
      008950 5D 26            [ 1] 1813 	clr (SIGN,sp)    ; sign
      008952 ED A6            [ 1] 1814 	cp a,#10
      008954 10 C1            [ 1] 1815 	jrne 1$
                                   1816 	; base 10 string display with negative sign if bit 23==1
      008956 00 0B 26 08 A6   [ 2] 1817 	btjf acc24,#7,1$
      00895B 24 90            [ 1] 1818 	cpl (SIGN,sp)
      00895D 5A 90 F7         [ 4] 1819 	call neg_acc24
      00091B                       1820 1$:
                                   1821 ; initialize string pointer 
      008960 20 0A 0D         [ 2] 1822 	ldw x,#pad+PAD_SIZE-1
      008963 01               [ 1] 1823 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      00091F                       1824 itoa_loop:
      008964 27 06            [ 1] 1825     ld a,(BASE,sp)
      008966 A6 2D 90         [ 4] 1826     call divu24_8 ; acc24/A 
      008969 5A 90            [ 1] 1827     add a,#'0  ; remainder of division
      00896B F7 3A            [ 1] 1828     cp a,#'9+1
      00896C 2B 02            [ 1] 1829     jrmi 2$
      00896C 93 1D            [ 1] 1830     add a,#7 
      00896E 17               [ 2] 1831 2$: decw x
      00896F 5F               [ 1] 1832     ld (x),a
                                   1833 	; if acc24==0 conversion done
      008970 50 00 0B         [ 1] 1834 	ld a,acc24
      008971 CA 00 0C         [ 1] 1835 	or a,acc16
      008971 9F C1 00         [ 1] 1836 	or a,acc8
      008974 27 24            [ 1] 1837     jrne itoa_loop
                                   1838 	;conversion done, next add '$' or '-' as required
      008976 09 90            [ 1] 1839 	ld a,(BASE,sp)
      008978 5A A6            [ 1] 1840 	cp a,#16
      00897A 20 90            [ 1] 1841 	jreq 8$
      00897C F7 5C            [ 1] 1842 	ld a,(SIGN,sp)
      00897E 20 F1            [ 1] 1843     jreq 10$
      008980 A6 2D            [ 1] 1844     ld a,#'-
      008980 93 CD            [ 2] 1845 	jra 9$ 
      008982 82 57            [ 1] 1846 8$: ld a,#'$ 
      008984 5B               [ 2] 1847 9$: decw x
      008985 01               [ 1] 1848     ld (x),a
      00094B                       1849 10$:
      008986 81 02            [ 2] 1850 	addw sp,#VSIZE
      008987 81               [ 4] 1851 	ret
                                   1852 
                                   1853 ;-------------------------------------
                                   1854 ; divide uint24_t by uint8_t
                                   1855 ; used to convert uint24_t to string
                                   1856 ; input:
                                   1857 ;	acc24	dividend
                                   1858 ;   A 		divisor
                                   1859 ; output:
                                   1860 ;   acc24	quotient
                                   1861 ;   A		remainder
                                   1862 ;------------------------------------- 
                                   1863 ; offset  on sp of arguments and locals
                           000001  1864 	U8   = 1   ; divisor on stack
                           000001  1865 	VSIZE =1
      00094E                       1866 divu24_8:
      008987 52               [ 2] 1867 	pushw x ; save x
      008988 02               [ 1] 1868 	push a 
                                   1869 	; ld dividend UU:MM bytes in X
      008989 6B 02 0F         [ 1] 1870 	ld a, acc24
      00898C 01               [ 1] 1871 	ld xh,a
      00898D A1 0A 26         [ 1] 1872 	ld a,acc24+1
      008990 0A               [ 1] 1873 	ld xl,a
      008991 72 0F            [ 1] 1874 	ld a,(U8,SP) ; divisor
      008993 00               [ 2] 1875 	div x,a ; UU:MM/U8
      008994 0C               [ 1] 1876 	push a  ;save remainder
      008995 05               [ 1] 1877 	ld a,xh
      008996 03 01 CD         [ 1] 1878 	ld acc24,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008999 8A               [ 1] 1879 	ld a,xl
      00899A 30 00 0C         [ 1] 1880 	ld acc24+1,a
      00899B 84               [ 1] 1881 	pop a
      00899B AE               [ 1] 1882 	ld xh,a
      00899C 17 5F 7F         [ 1] 1883 	ld a,acc24+2
      00899F 97               [ 1] 1884 	ld xl,a
      00899F 7B 02            [ 1] 1885 	ld a,(U8,sp) ; divisor
      0089A1 CD               [ 2] 1886 	div x,a  ; R:LL/U8
      0089A2 89 CE            [ 1] 1887 	ld (U8,sp),a ; save remainder
      0089A4 AB               [ 1] 1888 	ld a,xl
      0089A5 30 A1 3A         [ 1] 1889 	ld acc24+2,a
      0089A8 2B               [ 1] 1890 	pop a
      0089A9 02               [ 2] 1891 	popw x
      0089AA AB               [ 4] 1892 	ret
                                   1893 
                                   1894 ;--------------------------------------
                                   1895 ; unsigned multiply uint24_t by uint8_t
                                   1896 ; use to convert numerical string to uint24_t
                                   1897 ; input:
                                   1898 ;	acc24	uint24_t 
                                   1899 ;   A		uint8_t
                                   1900 ; output:
                                   1901 ;   acc24   A*acc24
                                   1902 ;-------------------------------------
                                   1903 ; local variables offset  on sp
                           000003  1904 	U8   = 3   ; A pushed on stack
                           000002  1905 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1906 	OVFH = 1  ; multiplication overflow high byte
                           000003  1907 	VSIZE = 3
      000976                       1908 mulu24_8:
      0089AB 07               [ 2] 1909 	pushw x    ; save X
                                   1910 	; local variables
      0089AC 5A               [ 1] 1911 	push a     ; U8
      0089AD F7               [ 1] 1912 	clrw x     ; initialize overflow to 0
      0089AE C6               [ 2] 1913 	pushw x    ; multiplication overflow
                                   1914 ; multiply low byte.
      0089AF 00 0C CA         [ 1] 1915 	ld a,acc24+2
      0089B2 00               [ 1] 1916 	ld xl,a
      0089B3 0D CA            [ 1] 1917 	ld a,(U8,sp)
      0089B5 00               [ 4] 1918 	mul x,a
      0089B6 0E               [ 1] 1919 	ld a,xl
      0089B7 26 E6 7B         [ 1] 1920 	ld acc24+2,a
      0089BA 02               [ 1] 1921 	ld a, xh
      0089BB A1 10            [ 1] 1922 	ld (OVFL,sp),a
                                   1923 ; multipy middle byte
      0089BD 27 08 7B         [ 1] 1924 	ld a,acc24+1
      0089C0 01               [ 1] 1925 	ld xl,a
      0089C1 27 08            [ 1] 1926 	ld a, (U8,sp)
      0089C3 A6               [ 4] 1927 	mul x,a
                                   1928 ; add overflow to this partial product
      0089C4 2D 20 02         [ 2] 1929 	addw x,(OVFH,sp)
      0089C7 A6               [ 1] 1930 	ld a,xl
      0089C8 24 5A F7         [ 1] 1931 	ld acc24+1,a
      0089CB 4F               [ 1] 1932 	clr a
      0089CB 5B 02            [ 1] 1933 	adc a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089CD 81 01            [ 1] 1934 	ld (OVFH,sp),a
      0089CE 9E               [ 1] 1935 	ld a,xh
      0089CE 89 88            [ 1] 1936 	ld (OVFL,sp),a
                                   1937 ; multiply most signficant byte	
      0089D0 C6 00 0C         [ 1] 1938 	ld a, acc24
      0089D3 95               [ 1] 1939 	ld xl, a
      0089D4 C6 00            [ 1] 1940 	ld a, (U8,sp)
      0089D6 0D               [ 4] 1941 	mul x,a
      0089D7 97 7B 01         [ 2] 1942 	addw x, (OVFH,sp)
      0089DA 62               [ 1] 1943 	ld a, xl
      0089DB 88 9E C7         [ 1] 1944 	ld acc24,a
      0089DE 00 0C            [ 2] 1945     addw sp,#VSIZE
      0089E0 9F               [ 2] 1946 	popw x
      0089E1 C7               [ 4] 1947 	ret
                                   1948 
                                   1949 ;------------------------------------
                                   1950 ;  two's complement acc24
                                   1951 ;  input:
                                   1952 ;		acc24 variable
                                   1953 ;  output:
                                   1954 ;		acc24 variable
                                   1955 ;-------------------------------------
      0009B0                       1956 neg_acc24:
      0089E2 00 0D 84 95      [ 1] 1957 	cpl acc24+2
      0089E6 C6 00 0E 97      [ 1] 1958 	cpl acc24+1
      0089EA 7B 01 62 6B      [ 1] 1959 	cpl acc24
      0089EE 01 9F            [ 1] 1960 	ld a,#1
      0089F0 C7 00 0E         [ 1] 1961 	add a,acc24+2
      0089F3 84 85 81         [ 1] 1962 	ld acc24+2,a
      0089F6 4F               [ 1] 1963 	clr a
      0089F6 89 88 5F         [ 1] 1964 	adc a,acc24+1
      0089F9 89 C6 00         [ 1] 1965 	ld acc24+1,a 
      0089FC 0E               [ 1] 1966 	clr a 
      0089FD 97 7B 03         [ 1] 1967 	adc a,acc24 
      008A00 42 9F C7         [ 1] 1968 	ld acc24,a 
      008A03 00               [ 4] 1969 	ret
                                   1970 
                                   1971 
                                   1972 ;------------------------------------
                                   1973 ; read a line of text from terminal
                                   1974 ; input:
                                   1975 ;	none
                                   1976 ; local variable on stack:
                                   1977 ;	LL  line length
                                   1978 ;   RXCHAR last received chaaracte 
                                   1979 ; output:
                                   1980 ;   text in tib  buffer
                                   1981 ;------------------------------------
                                   1982 	; local variables
                           000001  1983 	LL_HB=1
                           000001  1984 	RXCHAR = 1 ; last char received
                           000002  1985 	LL = 2  ; accepted line length
                           000002  1986 	VSIZE=2 
      0009D3                       1987 readln:
      008A04 0E               [ 1] 1988 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A05 9E               [ 2] 1989 	pushw x 
      008A06 6B 02 C6 00      [ 2] 1990  	ldw y,#tib ; input buffer
      0009D9                       1991 readln_loop:
      008A0A 0D 97 7B         [ 4] 1992 	call getc
      008A0D 03 42            [ 1] 1993 	ld (RXCHAR,sp),a
      008A0F 72 FB            [ 1] 1994 	cp a,#CR
      008A11 01 9F            [ 1] 1995 	jrne 1$
      008A13 C7 00 0D         [ 2] 1996 	jp readln_quit
      008A16 4F A9            [ 1] 1997 1$:	cp a,#LF 
      008A18 00 6B            [ 1] 1998 	jreq readln_quit
      008A1A 01 9E            [ 1] 1999 	cp a,#BS
      008A1C 6B 02            [ 1] 2000 	jreq del_back
      008A1E C6 00            [ 1] 2001 	cp a,#CTRL_D
      008A20 0C 97            [ 1] 2002 	jreq del_ln
      008A22 7B 03            [ 1] 2003 	cp a,#CTRL_R 
      008A24 42 72            [ 1] 2004 	jreq reprint 
                                   2005 ;	cp a,#'[
                                   2006 ;	jreq ansi_seq
      0009F5                       2007 final_test:
      008A26 FB 01            [ 1] 2008 	cp a,#SPACE
      008A28 9F C7            [ 1] 2009 	jrpl accept_char
      008A2A 00 0C            [ 2] 2010 	jra readln_loop
      0009FB                       2011 ansi_seq:
                                   2012 ;	call getc
                                   2013 ;	cp a,#'C 
                                   2014 ;	jreq rigth_arrow
                                   2015 ;	cp a,#'D 
                                   2016 ;	jreq left_arrow 
                                   2017 ;	jra final_test
      0009FB                       2018 right_arrow:
                                   2019 ;	ld a,#BSP 
                                   2020 ;	call putc 
                                   2021 ;	jra realn_loop 
      0009FB                       2022 left_arrow:
                                   2023 ;	jra readln_loop
      0009FB                       2024 reprint: 
      008A2C 5B 03            [ 1] 2025 	tnz (LL,sp)
      008A2E 85 81            [ 1] 2026 	jrne readln_loop
      008A30 AE 16 E8         [ 2] 2027 	ldw x,#tib 
      008A30 72 53 00         [ 4] 2028 	call strlen 
      008A33 0E 72 53 00      [ 2] 2029 	ldw y,#tib 
      008A37 0D               [ 1] 2030 	ld a,xl
      008A38 72 53            [ 1] 2031 	jreq readln_loop
      008A3A 00 0C            [ 1] 2032 	ld (LL,sp),a 
      008A3C A6 01 CB         [ 2] 2033 	ldw x,#tib 
      008A3F 00 0E C7         [ 4] 2034 	call puts
      008A42 00 0E            [ 1] 2035 	clr (LL_HB,sp)
      008A44 4F C9 00         [ 2] 2036 	addw y,(LL_HB,sp)
      008A47 0D C7            [ 2] 2037 	jra readln_loop 
      000A1B                       2038 del_ln:
      008A49 00 0D            [ 1] 2039 	ld a,(LL,sp)
      008A4B 4F C9 00         [ 4] 2040 	call delete
      008A4E 0C C7 00 0C      [ 2] 2041 	ldw y,#tib
      008A52 81 7F            [ 1] 2042 	clr (y)
      008A53 0F 02            [ 1] 2043 	clr (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008A53 5F 89            [ 2] 2044 	jra readln_loop
      000A2A                       2045 del_back:
      008A55 90 AE            [ 1] 2046     tnz (LL,sp)
      008A57 16 E8            [ 1] 2047     jreq readln_loop
      008A59 0A 02            [ 1] 2048     dec (LL,sp)
      008A59 CD 82            [ 2] 2049     decw y
      008A5B 4D 6B            [ 1] 2050     clr  (y)
      008A5D 01 A1 0D         [ 4] 2051     call bksp 
      008A60 26 03            [ 2] 2052     jra readln_loop	
      000A39                       2053 accept_char:
      008A62 CC 8A            [ 1] 2054 	ld a,#TIB_SIZE-1
      008A64 CE A1            [ 1] 2055 	cp a, (LL,sp)
      008A66 0A 27            [ 1] 2056 	jreq readln_loop
      008A68 65 A1            [ 1] 2057 	ld a,(RXCHAR,sp)
      008A6A 08 27            [ 1] 2058 	ld (y),a
      008A6C 3D A1            [ 1] 2059 	inc (LL,sp)
      008A6E 04 27            [ 2] 2060 	incw y
      008A70 2A A1            [ 1] 2061 	clr (y)
      008A72 12 27 06         [ 4] 2062 	call putc 
      008A75 20 8B            [ 2] 2063 	jra readln_loop
      000A4E                       2064 readln_quit:
      008A75 A1 20            [ 1] 2065 	clr (y)
      008A77 2A 40            [ 1] 2066 	ld a,(LL,sp)
      008A79 20 DE 03         [ 1] 2067 	ld count,a 
      008A7B                       2068 	_drop VSIZE 
      008A7B 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A7B A6 0D            [ 1] 2069 	ld a,#CR
      008A7B CD 01 C4         [ 4] 2070 	call putc
      008A7B 0D               [ 4] 2071 	ret
                                   2072 
                                   2073 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           000000  2074 .if DEBUG 	
                                   2075 ;----------------------------
                                   2076 ; command interface
                                   2077 ; only 3 commands:
                                   2078 ;  'q' to resume application
                                   2079 ;  'p [addr]' to print memory values 
                                   2080 ;  's addr' to print string 
                                   2081 ;----------------------------
                                   2082 ;local variable 
                                   2083 	PSIZE=1
                                   2084 	VSIZE=1 
                                   2085 cmd_itf:
                                   2086 	sub sp,#VSIZE 
                                   2087 	clr farptr 
                                   2088 	clr farptr+1 
                                   2089 	clr farptr+2  
                                   2090 repl:
                                   2091 	ld a,#CR 
                                   2092 	call putc 
                                   2093 	ld a,#'? 
                                   2094 	call putc
                                   2095 	clr in.w 
                                   2096 	clr in 
                                   2097 	call readln
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2098 	ldw y,#tib  
                                   2099 	ld a,(y)
                                   2100 	jreq repl  
                                   2101 	inc in 
                                   2102 	call to_upper 
                                   2103 	cp a,#'Q 
                                   2104 	jrne test_p
                                   2105 repl_exit:
                                   2106 	clr tib 
                                   2107 	clr count 
                                   2108 	clr in 
                                   2109 	_drop #VSIZE 	
                                   2110 	ret  
                                   2111 invalid:
                                   2112 	ldw x,#invalid_cmd 
                                   2113 	call puts 
                                   2114 	jra repl 
                                   2115 test_p:	
                                   2116     cp a,#'P 
                                   2117 	jreq mem_peek
                                   2118     cp a,#'S 
                                   2119 	jrne invalid 
                                   2120 print_string:	
                                   2121 	call get_token
                                   2122 	cp a,#TK_INTGR 
                                   2123 	jrne invalid 
                                   2124 	call puts
                                   2125 	jp repl 	
                                   2126 mem_peek:
                                   2127 	ld a,#SPACE 
                                   2128 	call skip  	 
                                   2129 	addw y,in.w 
                                   2130 	ldw x,#pad 
                                   2131 	call strcpy
                                   2132 	call atoi24 	
                                   2133 	ld a, acc24 
                                   2134 	or a,acc16 
                                   2135 	or a,acc8 
                                   2136 	jrne 1$ 
                                   2137 	jra peek_byte  
                                   2138 1$:	ldw x,acc24 
                                   2139 	ldw farptr,x 
                                   2140 	ld a,acc8 
                                   2141 	ld farptr+2,a 
                                   2142 peek_byte:
                                   2143 	call print_farptr 
                                   2144 	ld a,#8 
                                   2145 	ld (PSIZE,sp),a 
                                   2146 	clrw x 
                                   2147 1$:	call fetchc  
                                   2148 	pushw x 
                                   2149 	ld acc8,a 
                                   2150 	clrw x 
                                   2151 	ldw acc24,x 
                                   2152 	ld a,#16+128
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2153 	call prti24
                                   2154 	popw x 
                                   2155 	dec (PSIZE,sp)
                                   2156 	jrne 1$ 
                                   2157 	ld a,#8 
                                   2158 	add a,farptr+2 
                                   2159 	ld farptr+2,a
                                   2160 	clr a 
                                   2161 	adc a,farptr+1 
                                   2162 	ld farptr+1,a 
                                   2163 	clr a 
                                   2164 	adc a,farptr 
                                   2165 	ld farptr,a 
                                   2166 	jp repl  
                                   2167 
                                   2168 invalid_cmd: .asciz "not a command\n" 
                                   2169 
                                   2170 ;----------------------------
                                   2171 ; display farptr address
                                   2172 ;----------------------------
                                   2173 print_farptr:
                                   2174 	ld a ,farptr+2 
                                   2175 	ld acc8,a 
                                   2176 	ldw x,farptr 
                                   2177 	ldw acc24,x 
                                   2178 	clrw x 
                                   2179 	ld a,#16 
                                   2180 	call prti24
                                   2181 	ld a,#SPACE 
                                   2182 	call putc 
                                   2183 	call putc 
                                   2184 	ret
                                   2185 
                                   2186 ;------------------------------------
                                   2187 ; get byte at address farptr[X]
                                   2188 ; input:
                                   2189 ;	 farptr   address to peek
                                   2190 ;    X		  farptr index 	
                                   2191 ; output:
                                   2192 ;	 A 		  byte from memory  
                                   2193 ;    x		  incremented by 1
                                   2194 ;------------------------------------
                                   2195 fetchc: ; @C
                                   2196 	ldf a,([farptr],x)
                                   2197 	incw x
                                   2198 	ret
                                   2199 
                                   2200 
                                   2201 ;------------------------------------
                                   2202 ; expect a number from command line 
                                   2203 ; next argument
                                   2204 ;  input:
                                   2205 ;	  none
                                   2206 ;  output:
                                   2207 ;    acc24   int24_t 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2208 ;------------------------------------
                                   2209 number::
                                   2210 	call get_token
                                   2211 	call atoi24
                                   2212 	ret
                                   2213 .endif ; DEBUG 
                                   2214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2215 
                                   2216 
                                   2217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2218 ;; compiler routines        ;;
                                   2219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2220 ;------------------------------------
                                   2221 ; parse quoted string 
                                   2222 ; input:
                                   2223 ;   Y 	pointer to tib 
                                   2224 ;   X   pointer to pad
                                   2225 ; output:
                                   2226 ;	pad   parsed string
                                   2227 ;   TOS  char* to pad  
                                   2228 ;------------------------------------
                           000001  2229 	PREV = 1
                           000002  2230 	CURR =2 
                           000002  2231 	VSIZE=2 
      000A5D                       2232 parse_quote: ; { -- addr }
      000A5D                       2233 	_vars VSIZE 
      008A7C 02 26            [ 2]    1     sub sp,#VSIZE 
      008A7E DA               [ 1] 2234 	clr a
      008A7F AE 16            [ 1] 2235 1$:	ld (PREV,sp),a 
      008A81 E8 CD 82 8B      [ 1] 2236 2$:	inc in
      008A85 90 AE 16         [ 4] 2237 	ld a,([in.w],y)
      008A88 E8 9F            [ 1] 2238 	jreq 6$
      008A8A 27 CD            [ 1] 2239 	ld (CURR,sp),a 
      008A8C 6B 02            [ 1] 2240 	ld a,#'\
      008A8E AE 16            [ 1] 2241 	cp a, (PREV,sp)
      008A90 E8 CD            [ 1] 2242 	jrne 3$
      008A92 82 57            [ 1] 2243 	clr (PREV,sp)
      008A94 0F 01            [ 1] 2244 	ld a,(CURR,sp)
      008A96 72 F9            [ 4] 2245 	callr convert_escape
      008A98 01               [ 1] 2246 	ld (x),a 
      008A99 20               [ 2] 2247 	incw x 
      008A9A BE E5            [ 2] 2248 	jra 2$
      008A9B                       2249 3$:
      008A9B 7B 02            [ 1] 2250 	ld a,(CURR,sp)
      008A9D CD 82            [ 1] 2251 	cp a,#'\'
      008A9F 71 90            [ 1] 2252 	jreq 1$
      008AA1 AE 16            [ 1] 2253 	cp a,#'"
      008AA3 E8 90            [ 1] 2254 	jreq 5$ 
      008AA5 7F               [ 1] 2255 	ld (x),a 
      008AA6 0F               [ 2] 2256 	incw x 
      008AA7 02 20            [ 2] 2257 	jra 2$
      008AA9 AF 5C 00 01      [ 1] 2258 5$:	inc in 
      008AAA 7F               [ 1] 2259 6$: clr (x)
      008AAA 0D 02 27         [ 2] 2260 	ldw x,#pad 
      000A93                       2261 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008AAD AB 0A            [ 2]    1     addw sp,#VSIZE 
      008AAF 02 90            [ 1] 2262 	ld a,#TK_QSTR  
      008AB1 5A               [ 4] 2263 	ret 
                                   2264 
                                   2265 ;---------------------------------------
                                   2266 ; called by parse_quote
                                   2267 ; subtitute escaped character 
                                   2268 ; by their ASCII value .
                                   2269 ; input:
                                   2270 ;   A  character following '\'
                                   2271 ; output:
                                   2272 ;   A  substitued char or same if not valid.
                                   2273 ;---------------------------------------
      000A98                       2274 convert_escape:
      008AB2 90               [ 2] 2275 	pushw x 
      008AB3 7F CD 82         [ 2] 2276 	ldw x,#escaped 
      008AB6 61               [ 1] 2277 1$:	cp a,(x)
      008AB7 20 A0            [ 1] 2278 	jreq 2$
      008AB9 7D               [ 1] 2279 	tnz (x)
      008AB9 A6 4F            [ 1] 2280 	jreq 3$
      008ABB 11               [ 2] 2281 	incw x 
      008ABC 02 27            [ 2] 2282 	jra 1$
      008ABE 9A 7B 01         [ 2] 2283 2$: subw x,#escaped 
      008AC1 90               [ 1] 2284 	ld a,xl 
      008AC2 F7 0C            [ 1] 2285 	add a,#7
      008AC4 02               [ 2] 2286 3$:	popw x 
      008AC5 90               [ 4] 2287 	ret 
                                   2288 
      008AC6 5C 90 7F CD 82 44 20  2289 escaped: .asciz "abtnvfr"
             8B
                                   2290 
                                   2291 ;-------------------------
                                   2292 ; integer parser 
                                   2293 ; input:
                                   2294 ;   X 		point to pad 
                                   2295 ;   Y 		point to tib 
                                   2296 ;   A 	    first digit|'$' 
                                   2297 ; output:  
                                   2298 ;   pad     number string 
                                   2299 ;   X 		integer 
                                   2300 ;   A 		TK_INTGR
                                   2301 ;-------------------------
                           000001  2302 	BASE=1
                           000002  2303 	TCHAR=2 
                           000002  2304 	VSIZE=2 
      008ACE                       2305 parse_integer: ; { -- n }
      008ACE 90 7F            [ 1] 2306 	push #0 ; TCHAR 
      008AD0 7B 02            [ 1] 2307 	cp a,#'$
      008AD2 C7 00            [ 1] 2308 	jreq 1$ 
      008AD4 04 5B            [ 1] 2309 	push #10 ; BASE=10 
      008AD6 02 A6            [ 2] 2310 	jra 2$ 
      008AD8 0D CD            [ 1] 2311 1$: push #16  ; BASE=16
      008ADA 82               [ 1] 2312 2$:	ld (x),a 
      008ADB 44               [ 2] 2313 	incw x 
      008ADC 81 5C 00 01      [ 1] 2314 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008ADD 91 D6 00         [ 4] 2315 	ld a,([in.w],y)
      008ADD 52 02 4F         [ 4] 2316 	call to_upper 
      008AE0 6B 01            [ 1] 2317 	ld (TCHAR,sp),a 
      008AE2 72 5C 00         [ 4] 2318 	call is_digit 
      008AE5 02 91            [ 1] 2319 	jrc 2$
      008AE7 D6 01            [ 1] 2320 	ld a,#16 
      008AE9 27 24            [ 1] 2321 	cp a,(BASE,sp)
      008AEB 6B 02            [ 1] 2322 	jrne 3$ 
      008AED A6 5C            [ 1] 2323 	ld a,(TCHAR,sp)
      008AEF 11 01            [ 1] 2324 	cp a,#'A 
      008AF1 26 0A            [ 1] 2325 	jrmi 3$ 
      008AF3 0F 01            [ 1] 2326 	cp a,#'G 
      008AF5 7B 02            [ 1] 2327 	jrmi 2$ 
      008AF7 AD               [ 1] 2328 3$:	clr (x)
      008AF8 1F F7 5C         [ 4] 2329 	call atoi24
      008AFB 20 E5 0C         [ 2] 2330 	ldw x,acc16 
      008AFD A6 04            [ 1] 2331 	ld a,#TK_INTGR
      000AED                       2332 	_drop VSIZE  
      008AFD 7B 02            [ 2]    1     addw sp,#VSIZE 
      008AFF A1               [ 4] 2333 	ret 	
                                   2334 
                                   2335 ;-------------------------
                                   2336 ; binary integer parser 
                                   2337 ; input:
                                   2338 ;   X 		point to pad 
                                   2339 ;   Y 		point to tib 
                                   2340 ;   A 	    '%' 
                                   2341 ; output:  
                                   2342 ;   pad     number string 
                                   2343 ;   X 		integer 
                                   2344 ;   A 		TK_INTGR
                                   2345 ;   TOS     integer 
                                   2346 ;-------------------------
                           000001  2347 	BINARY=1
                           000002  2348 	VSIZE=2
      000AF0                       2349 parse_binary: ; { -- n }
      008B00 5C 27            [ 1] 2350 	push #0
      008B02 DD A1            [ 1] 2351 	push #0
      008B04 22               [ 1] 2352 1$: ld (x),a 
      008B05 27               [ 2] 2353 	incw x 
      008B06 04 F7 5C 20      [ 1] 2354 	inc in 
      008B0A D7 72 5C         [ 4] 2355 	ld a,([in.w],y)
      008B0D 00 02            [ 1] 2356 	cp a,#'0 
      008B0F 7F AE            [ 1] 2357 	jreq 2$
      008B11 17 38            [ 1] 2358 	cp a,#'1 
      008B13 5B 02            [ 1] 2359 	jreq 2$ 
      008B15 A6 02            [ 2] 2360 	jra bin_exit 
      008B17 81 30            [ 1] 2361 2$: sub a,#'0	
      008B18 46               [ 1] 2362 	rrc a 
      008B18 89 AE            [ 1] 2363 	rlc (BINARY+1,sp)
      008B1A 8B 2D            [ 1] 2364 	rlc (BINARY,sp)
      008B1C F1 27            [ 2] 2365 	jra 1$  
      000B10                       2366 bin_exit:
      008B1E 06               [ 1] 2367 	clr (x)
      008B1F 7D 27            [ 2] 2368 	ldw x,(BINARY,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008B21 09 5C            [ 1] 2369 	ld a,#TK_INTGR 	
      000B15                       2370 	_drop VSIZE 
      008B23 20 F7            [ 2]    1     addw sp,#VSIZE 
      008B25 1D               [ 4] 2371 	ret
                                   2372 
                                   2373 ;---------------------------
                                   2374 ;  token begin with a letter,
                                   2375 ;  is keyword or variable. 	
                                   2376 ; input:
                                   2377 ;   X 		point to pad 
                                   2378 ;   Y 		point to text
                                   2379 ;   A 	    first letter  
                                   2380 ; output:
                                   2381 ;   X		exec_addr|var_addr 
                                   2382 ;   A 		TK_CMD 
                                   2383 ;   pad 	keyword|var_name  
                                   2384 ;   TOS     exec_addr|var_addr 
                                   2385 ;--------------------------  
      000B18                       2386 parse_keyword: ; { -- exec_addr|var_addr}
      008B26 8B 2D 9F         [ 4] 2387 	call to_upper 
      008B29 AB               [ 1] 2388 	ld (x),a 
      008B2A 07               [ 2] 2389 	incw x 
      008B2B 85 81 61 62      [ 1] 2390 	inc in 
      008B2F 74 6E 76         [ 4] 2391 	ld a,([in.w],y)
      008B32 66 72 00         [ 4] 2392 	call is_alpha 
      008B35 25 EF            [ 1] 2393 	jrc parse_keyword 
      008B35 4B               [ 1] 2394 1$: clr (x)
      008B36 00 A1 24 27      [ 1] 2395 	tnz pad+1 
      008B3A 04 4B            [ 1] 2396 	jrne 2$
                                   2397 ; one letter variable name 
      008B3C 0A 20 02         [ 1] 2398 	ld a,pad 
      008B3F 4B 10            [ 1] 2399 	sub a,#'A 
      008B41 F7               [ 1] 2400 	sll a 
      008B42 5C               [ 1] 2401 	push a 
      008B43 72 5C            [ 1] 2402 	push #0
      008B45 00 02 91         [ 2] 2403 	ldw x,#vars 
      008B48 D6 01 CD         [ 2] 2404 	addw x,(1,sp) ; X=var address 
      000B3F                       2405 	_drop 2 
      008B4B 8D 8A            [ 2]    1     addw sp,#2 
      008B4D 6B 02            [ 1] 2406 	ld a,#TK_VAR 
      008B4F CD 85            [ 2] 2407 	jra 4$ 
      000B45                       2408 2$: ; check for keyword, otherwise syntax error.
      000B45                       2409 	_ldx_dict kword_dict
      008B51 1E 25 ED         [ 2]    1     ldw x,#kword_dict+2
      008B54 A6 10 11         [ 4] 2410 	call search_dict
      008B57 01               [ 1] 2411 	tnz a
      008B58 26 0A            [ 1] 2412 	jrne 4$ 
      008B5A 7B 02 A1         [ 2] 2413 	jp syntax_error
      008B5D 41               [ 4] 2414 4$:	ret  	
                                   2415 
                                   2416 
                                   2417 ;------------------------------------
                                   2418 ; scan text for next token
                                   2419 ; move token in 'pad'
                                   2420 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000B52                       2421 	none: 
                                   2422 ; use:
                                   2423 ;	Y   pointer to text
                                   2424 ;   X	pointer to pad 
                                   2425 ;   in.w   index in text buffer
                                   2426 ; output:
                                   2427 ;   A       token attribute 
                                   2428 ;   pad 	token as .asciz
                                   2429 ;   X 		token value   
                                   2430 ;------------------------------------
                                   2431 	; use to check special character 
                                   2432 	.macro _case c t  
                                   2433 	ld a,#c 
                                   2434 	cp a,(TCHAR,sp) 
                                   2435 	jrne t
                                   2436 	.endm 
                                   2437 
                           000001  2438 	TCHAR=1
                           000002  2439 	ATTRIB=2 
                           000002  2440 	VSIZE=2
      000B52                       2441 get_token: 
      008B5E 2B 04 A1 47      [ 2] 2442 	ldw y,#tib    	
      008B62 2B DD 7F         [ 1] 2443 	ld a,in 
      008B65 CD 8D 96         [ 1] 2444 	cp a,count 
      008B68 CE 00            [ 1] 2445 	jrmi 1$
      008B6A 0D A6            [ 1] 2446 	ld a,#TK_NONE 
      008B6C 04               [ 4] 2447 	ret 
      000B61                       2448 1$:	
      000B61                       2449 	_vars VSIZE
      008B6D 5B 02            [ 2]    1     sub sp,#VSIZE 
      008B6F 81 17 38         [ 2] 2450 	ldw x, #pad
      008B70 A6 20            [ 1] 2451 	ld a,#SPACE
      008B70 4B 00 4B         [ 4] 2452 	call skip
      008B73 00 F7 5C 72 5C   [ 1] 2453 	mov in.saved,in 
      008B78 00 02 91         [ 4] 2454 	ld a,([in.w],y)
      008B7B D6 01            [ 1] 2455 	jrne str_tst
      008B7D A1 30 27 06      [ 1] 2456 	clr pad 
      008B81 A1 31 27         [ 2] 2457 	jp token_exit ; end of line 
                                   2458 
      000B7C                       2459 str_tst: ; check for quoted string  	
      008B84 02 20 09         [ 4] 2460 	call to_upper 
      008B87 A0 30            [ 1] 2461 	ld (TCHAR,sp),a 
      000B81                       2462 	_case '"' nbr_tst
      008B89 46 09            [ 1]    1 	ld a,#'"' 
      008B8B 02 09            [ 1]    2 	cp a,(TCHAR,sp) 
      008B8D 01 20            [ 1]    3 	jrne nbr_tst
      008B8F E4 0A 5D         [ 4] 2463 	call parse_quote
      008B90 CC 0D 07         [ 2] 2464 	jp token_exit
      000B8D                       2465 nbr_tst: ; check for number 
      008B90 7F 1E            [ 1] 2466 	ld a,#'$'
      008B92 01 A6            [ 1] 2467 	cp a,(TCHAR,sp) 
      008B94 04 5B            [ 1] 2468 	jreq 1$
      008B96 02 81            [ 1] 2469 	ld a,#'&
      008B98 11 01            [ 1] 2470 	cp a,(TCHAR,sp)
      008B98 CD 8D            [ 1] 2471 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008B9A 8A F7 5C         [ 4] 2472 	call parse_binary ; expect binary integer 
      008B9D 72 5C 00         [ 2] 2473 	jp token_exit 
      008BA0 02 91            [ 1] 2474 0$:	ld a,(TCHAR,sp)
      008BA2 D6 01 CD         [ 4] 2475 	call is_digit
      008BA5 85 0D            [ 1] 2476 	jrnc 3$
      008BA7 25 EF 7F         [ 4] 2477 1$:	call parse_integer 
      008BAA 72 5D 17         [ 2] 2478 	jp token_exit 
      000BAC                       2479 3$: 
      000BAC                       2480 	_case '(' bkslsh_tst 
      008BAD 39 26            [ 1]    1 	ld a,#'(' 
      008BAF 15 C6            [ 1]    2 	cp a,(TCHAR,sp) 
      008BB1 17 38            [ 1]    3 	jrne bkslsh_tst
      008BB3 A0 41            [ 1] 2481 	ld a,#TK_LPAREN
      008BB5 48 88 4B         [ 2] 2482 	jp token_char   	
      000BB7                       2483 bkslsh_tst: ; character token 
      000BB7                       2484 	_case '\',rparnt_tst
      008BB8 00 AE            [ 1]    1 	ld a,#'\' 
      008BBA 00 29            [ 1]    2 	cp a,(TCHAR,sp) 
      008BBC 72 FB            [ 1]    3 	jrne rparnt_tst
      008BBE 01 5B            [ 1] 2485 	ld a,(TCHAR,sp)
      008BC0 02               [ 1] 2486 	ld (x),a 
      008BC1 A6               [ 2] 2487 	incw x 
      008BC2 05 20 0C 01      [ 1] 2488 	inc in 
      008BC5 91 D6 00         [ 4] 2489 	ld a,([in.w],y)
      008BC5 AE               [ 1] 2490 	ld (x),a 
      008BC6 A5               [ 2] 2491 	incw x 
      008BC7 F7 CD 8E F8      [ 1] 2492 	inc in  
      008BCB 4D               [ 1] 2493 	clr (x) 
      008BCC 26               [ 1] 2494 	ld xl,a 
      008BCD 03 CC            [ 1] 2495 	ld a,#TK_CHAR 
      008BCF 87 DD 81         [ 2] 2496 	jp token_exit 
      008BD2                       2497 rparnt_tst:		
      008BD2                       2498 	_case ')' colon_tst 
      008BD2 90 AE            [ 1]    1 	ld a,#')' 
      008BD4 16 E8            [ 1]    2 	cp a,(TCHAR,sp) 
      008BD6 C6 00            [ 1]    3 	jrne colon_tst
      008BD8 02 C1            [ 1] 2499 	ld a,#TK_RPAREN 
      008BDA 00 04 2B         [ 2] 2500 	jp token_char 
      000BE0                       2501 colon_tst:
      000BE0                       2502 	_case ':' comma_tst 
      008BDD 03 A6            [ 1]    1 	ld a,#':' 
      008BDF 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008BE1 26 05            [ 1]    3 	jrne comma_tst
      008BE1 52 02            [ 1] 2503 	ld a,#TK_COLON 
      008BE3 AE 17 38         [ 2] 2504 	jp token_char 
      000BEB                       2505 comma_tst:
      000BEB                       2506 	_case COMMA sharp_tst 
      008BE6 A6 20            [ 1]    1 	ld a,#COMMA 
      008BE8 CD 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008BEA 08 55            [ 1]    3 	jrne sharp_tst
      008BEC 00 02            [ 1] 2507 	ld a,#TK_COMMA
      008BEE 00 03 91         [ 2] 2508 	jp token_char
      000BF6                       2509 sharp_tst:
      000BF6                       2510 	_case SHARP dash_tst 
      008BF1 D6 01            [ 1]    1 	ld a,#SHARP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008BF3 26 07            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF5 72 5F            [ 1]    3 	jrne dash_tst
      008BF7 17 38            [ 1] 2511 	ld a,#TK_SHARP
      008BF9 CC 8D 87         [ 2] 2512 	jp token_char  	 	 
      008BFC                       2513 dash_tst: 	
      000C01                       2514 	_case '-' at_tst 
      008BFC CD 8D            [ 1]    1 	ld a,#'-' 
      008BFE 8A 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C00 01 A6            [ 1]    3 	jrne at_tst
      008C02 22 11            [ 1] 2515 	ld a,#TK_MINUS  
      008C04 01 26 06         [ 2] 2516 	jp token_char 
      000C0C                       2517 at_tst:
      000C0C                       2518 	_case '@' qmark_tst 
      008C07 CD 8A            [ 1]    1 	ld a,#'@' 
      008C09 DD CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008C0B 8D 87            [ 1]    3 	jrne qmark_tst
      008C0D A6 0A            [ 1] 2519 	ld a,#TK_ARRAY 
      008C0D A6 24 11         [ 2] 2520 	jp token_char
      000C17                       2521 qmark_tst:
      000C17                       2522 	_case '?' tick_tst 
      008C10 01 27            [ 1]    1 	ld a,#'?' 
      008C12 13 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C14 26 11            [ 1]    3 	jrne tick_tst
      008C16 01 26            [ 1] 2523 	ld a,(TCHAR,sp)
      008C18 06               [ 1] 2524 	ld (x),a 
      008C19 CD               [ 2] 2525 	incw x 
      008C1A 8B               [ 1] 2526 	clr (x)
      008C1B 70 CC 8D 87      [ 1] 2527 	inc in 
      008C1F 7B 01            [ 1] 2528 	ld a,#TK_CMD 
      008C21 CD 85 1E         [ 2] 2529 	ldw x,#print 
      008C24 24 06 CD         [ 2] 2530 	jp token_exit
      000C2E                       2531 tick_tst: ; ignore comment 
      000C2E                       2532 	_case TICK plus_tst 
      008C27 8B 35            [ 1]    1 	ld a,#TICK 
      008C29 CC 8D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C2B 87 0C            [ 1]    3 	jrne plus_tst
      008C2C 72 5C 00 01      [ 1] 2533 	inc in 
      008C2C A6 28            [ 1] 2534 	ld a,#TK_CMD 
      008C2E 11 01 26         [ 2] 2535 	ldw x,#remark  
      008C31 05 A6 0B         [ 2] 2536 	jp token_exit 
      000C40                       2537 plus_tst:
      000C40                       2538 	_case '+' star_tst 
      008C34 CC 8D            [ 1]    1 	ld a,#'+' 
      008C36 77 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C37 26 05            [ 1]    3 	jrne star_tst
      008C37 A6 5C            [ 1] 2539 	ld a,#TK_PLUS  
      008C39 11 01 26         [ 2] 2540 	jp token_char 
      000C4B                       2541 star_tst:
      000C4B                       2542 	_case '*' slash_tst 
      008C3C 18 7B            [ 1]    1 	ld a,#'*' 
      008C3E 01 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C40 5C 72            [ 1]    3 	jrne slash_tst
      008C42 5C 00            [ 1] 2543 	ld a,#TK_MULT 
      008C44 02 91 D6         [ 2] 2544 	jp token_char 
      000C56                       2545 slash_tst: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000C56                       2546 	_case '/' prcnt_tst 
      008C47 01 F7            [ 1]    1 	ld a,#'/' 
      008C49 5C 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4B 5C 00            [ 1]    3 	jrne prcnt_tst
      008C4D 02 7F            [ 1] 2547 	ld a,#TK_DIV 
      008C4F 97 A6 03         [ 2] 2548 	jp token_char 
      000C61                       2549 prcnt_tst:
      000C61                       2550 	_case '%' eql_tst 
      008C52 CC 8D            [ 1]    1 	ld a,#'%' 
      008C54 87 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C55 26 05            [ 1]    3 	jrne eql_tst
      008C55 A6 29            [ 1] 2551 	ld a,#TK_MOD
      008C57 11 01 26         [ 2] 2552 	jp token_char  
                                   2553 ; 1 or 2 character tokens 	
      000C6C                       2554 eql_tst:
      000C6C                       2555 	_case '=' gt_tst 		
      008C5A 05 A6            [ 1]    1 	ld a,#'=' 
      008C5C 0C CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5E 8D 77            [ 1]    3 	jrne gt_tst
      008C60 A6 32            [ 1] 2556 	ld a,#TK_EQUAL
      008C60 A6 3A 11         [ 2] 2557 	jp token_char 
      000C77                       2558 gt_tst:
      000C77                       2559 	_case '>' lt_tst 
      008C63 01 26            [ 1]    1 	ld a,#'>' 
      008C65 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C67 01 CC            [ 1]    3 	jrne lt_tst
      008C69 8D 77            [ 1] 2560 	ld a,#TK_GT 
      008C6B 6B 02            [ 1] 2561 	ld (ATTRIB,sp),a 
      008C6B A6 2C 11 01      [ 1] 2562 	inc in 
      008C6F 26 05 A6         [ 4] 2563 	ld a,([in.w],y)
      008C72 0D CC            [ 1] 2564 	cp a,#'=
      008C74 8D 77            [ 1] 2565 	jrne 1$
      008C76 7B 01            [ 1] 2566 	ld a,(TCHAR,sp)
      008C76 A6               [ 1] 2567 	ld (x),a
      008C77 23               [ 2] 2568 	incw x 
      008C78 11 01            [ 1] 2569 	ld a,#'=
      008C7A 26 05            [ 1] 2570 	ld (TCHAR,sp),a 
      008C7C A6 0E            [ 1] 2571 	ld a,#TK_GE 
      008C7E CC 8D            [ 2] 2572 	jra token_char  
      008C80 77 3C            [ 1] 2573 1$: cp a,#'<
      008C81 26 0C            [ 1] 2574 	jrne 2$
      008C81 A6 2D            [ 1] 2575 	ld a,(TCHAR,sp)
      008C83 11               [ 1] 2576 	ld (x),a
      008C84 01               [ 2] 2577 	incw x 
      008C85 26 05            [ 1] 2578 	ld a,#'<	
      008C87 A6 11            [ 1] 2579 	ld (TCHAR,sp),a 
      008C89 CC 8D            [ 1] 2580 	ld a,#TK_NE 
      008C8B 77 4F            [ 2] 2581 	jra token_char 
      008C8C 72 5A 00 01      [ 1] 2582 2$: dec in
      008C8C A6 40            [ 1] 2583 	ld a,(ATTRIB,sp)
      008C8E 11 01            [ 2] 2584 	jra token_char 
      000CB0                       2585 lt_tst:
      000CB0                       2586 	_case '<' other
      008C90 26 05            [ 1]    1 	ld a,#'<' 
      008C92 A6 0A            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008C94 CC 8D            [ 1]    3 	jrne other
      008C96 77 34            [ 1] 2587 	ld a,#TK_LT 
      008C97 6B 02            [ 1] 2588 	ld (ATTRIB,sp),a 
      008C97 A6 3F 11 01      [ 1] 2589 	inc in 
      008C9B 26 11 7B         [ 4] 2590 	ld a,([in.w],y)
      008C9E 01 F7            [ 1] 2591 	cp a,#'=
      008CA0 5C 7F            [ 1] 2592 	jrne 1$
      008CA2 72 5C            [ 1] 2593 	ld a,(TCHAR,sp)
      008CA4 00               [ 1] 2594 	ld (x),a 
      008CA5 02 A6            [ 1] 2595 	ld a,#'=
      008CA7 06 AE            [ 1] 2596 	ld (TCHAR,sp),a 
      008CA9 94 48            [ 1] 2597 	ld a,#TK_LE 
      008CAB CC 8D            [ 2] 2598 	jra token_char 
      008CAD 87 3E            [ 1] 2599 1$: cp a,#'>
      008CAE 26 0C            [ 1] 2600 	jrne 2$
      008CAE A6 27            [ 1] 2601 	ld a,(TCHAR,sp)
      008CB0 11               [ 1] 2602 	ld (x),a 
      008CB1 01               [ 2] 2603 	incw x 
      008CB2 26 0C            [ 1] 2604 	ld a,#'>
      008CB4 72 5C            [ 1] 2605 	ld (TCHAR,sp),a 
      008CB6 00 02            [ 1] 2606 	ld a,#TK_NE 
      008CB8 A6 06            [ 2] 2607 	jra token_char 
      008CBA AE 95 35 CC      [ 1] 2608 2$: dec in 
      008CBE 8D 87            [ 1] 2609 	ld a,(ATTRIB,sp)
      008CC0 20 0F            [ 2] 2610 	jra token_char 	
      000CE8                       2611 other: ; not a special character 	 
      008CC0 A6 2B            [ 1] 2612 	ld a,(TCHAR,sp)
      008CC2 11 01 26         [ 4] 2613 	call is_alpha 
      008CC5 05 A6            [ 1] 2614 	jrc 30$ 
      008CC7 10 CC 8D         [ 2] 2615 	jp syntax_error 
      000CF2                       2616 30$: 
      008CCA 77 0B 18         [ 4] 2617 	call parse_keyword
      008CCB 20 10            [ 2] 2618 	jra token_exit 
      000CF7                       2619 token_char:
      008CCB A6 2A            [ 1] 2620 	ld (ATTRIB,sp),a 
      008CCD 11 01            [ 1] 2621 	ld a,(TCHAR,sp)
      008CCF 26               [ 1] 2622 	ld (x),a 
      008CD0 05               [ 2] 2623 	incw x 
      008CD1 A6               [ 1] 2624 	clr(x)
      008CD2 20 CC 8D 77      [ 1] 2625 	inc in 
      008CD6 7B 02            [ 1] 2626 	ld a,(ATTRIB,sp)
      008CD6 A6 2F 11         [ 2] 2627 	ldw x,#pad 
      000D07                       2628 token_exit:
      000D07                       2629 	_drop VSIZE 
      008CD9 01 26            [ 2]    1     addw sp,#VSIZE 
      008CDB 05               [ 4] 2630 	ret
                                   2631 
                                   2632 
                                   2633 ;------------------------------------
                                   2634 ; convert alpha to uppercase
                                   2635 ; input:
                                   2636 ;    a  character to convert
                                   2637 ; output:
                                   2638 ;    a  uppercase character
                                   2639 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000D0A                       2640 to_upper::
      008CDC A6 21            [ 1] 2641 	cp a,#'a
      008CDE CC 8D            [ 1] 2642 	jrpl 1$
      008CE0 77               [ 4] 2643 0$:	ret
      008CE1 A1 7A            [ 1] 2644 1$: cp a,#'z	
      008CE1 A6 25            [ 1] 2645 	jrugt 0$
      008CE3 11 01            [ 1] 2646 	sub a,#32
      008CE5 26               [ 4] 2647 	ret
                                   2648 	
                                   2649 ;------------------------------------
                                   2650 ; convert pad content in integer
                                   2651 ; input:
                                   2652 ;    pad		.asciz to convert
                                   2653 ; output:
                                   2654 ;    acc24      int24_t
                                   2655 ;------------------------------------
                                   2656 	; local variables
                           000001  2657 	SIGN=1 ; 1 byte, 
                           000002  2658 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2659 	TEMP=3 ; 1 byte, temporary storage
                           000003  2660 	VSIZE=3 ; 3 bytes reserved for local storage
      000D16                       2661 atoi24:
      008CE6 05               [ 2] 2662 	pushw x ;save x
      008CE7 A6 22            [ 2] 2663 	sub sp,#VSIZE
                                   2664 	; acc24=0 
      008CE9 CC 8D 77 0B      [ 1] 2665 	clr acc24    
      008CEC 72 5F 00 0C      [ 1] 2666 	clr acc16
      008CEC A6 3D 11 01      [ 1] 2667 	clr acc8 
      008CF0 26 05 A6         [ 1] 2668 	ld a, pad 
      008CF3 32 CC            [ 1] 2669 	jreq atoi_exit
      008CF5 8D 77            [ 1] 2670 	clr (SIGN,sp)
      008CF7 A6 0A            [ 1] 2671 	ld a,#10
      008CF7 A6 3E            [ 1] 2672 	ld (BASE,sp),a ; default base decimal
      008CF9 11 01 26         [ 2] 2673 	ldw x,#pad ; pointer to string to convert
      008CFC 33               [ 1] 2674 	ld a,(x)
      008CFD A6 31            [ 1] 2675 	jreq 9$  ; completed if 0
      008CFF 6B 02            [ 1] 2676 	cp a,#'-
      008D01 72 5C            [ 1] 2677 	jrne 1$
      008D03 00 02            [ 1] 2678 	cpl (SIGN,sp)
      008D05 91 D6            [ 2] 2679 	jra 2$
      008D07 01 A1            [ 1] 2680 1$: cp a,#'$
      008D09 3D 26            [ 1] 2681 	jrne 3$
      008D0B 0C 7B            [ 1] 2682 	ld a,#16
      008D0D 01 F7            [ 1] 2683 	ld (BASE,sp),a
      008D0F 5C               [ 2] 2684 2$:	incw x
      008D10 A6               [ 1] 2685 	ld a,(x)
      000D48                       2686 3$:	
      008D11 3D 6B            [ 1] 2687 	cp a,#'a
      008D13 01 A6            [ 1] 2688 	jrmi 4$
      008D15 33 20            [ 1] 2689 	sub a,#32
      008D17 5F A1            [ 1] 2690 4$:	cp a,#'0
      008D19 3C 26            [ 1] 2691 	jrmi 9$
      008D1B 0C 7B            [ 1] 2692 	sub a,#'0
      008D1D 01 F7            [ 1] 2693 	cp a,#10
      008D1F 5C A6            [ 1] 2694 	jrmi 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D21 3C 6B            [ 1] 2695 	sub a,#7
      008D23 01 A6            [ 1] 2696 	cp a,(BASE,sp)
      008D25 35 20            [ 1] 2697 	jrpl 9$
      008D27 4F 72            [ 1] 2698 5$:	ld (TEMP,sp),a
      008D29 5A 00            [ 1] 2699 	ld a,(BASE,sp)
      008D2B 02 7B 02         [ 4] 2700 	call mulu24_8
      008D2E 20 47            [ 1] 2701 	ld a,(TEMP,sp)
      008D30 CB 00 0D         [ 1] 2702 	add a,acc24+2
      008D30 A6 3C 11         [ 1] 2703 	ld acc24+2,a
      008D33 01               [ 1] 2704 	clr a
      008D34 26 32 A6         [ 1] 2705 	adc a,acc24+1
      008D37 34 6B 02         [ 1] 2706 	ld acc24+1,a
      008D3A 72               [ 1] 2707 	clr a
      008D3B 5C 00 02         [ 1] 2708 	adc a,acc24
      008D3E 91 D6 01         [ 1] 2709 	ld acc24,a
      008D41 A1 3D            [ 2] 2710 	jra 2$
      008D43 26 0B            [ 1] 2711 9$:	tnz (SIGN,sp)
      008D45 7B 01            [ 1] 2712     jreq atoi_exit
      008D47 F7 A6 3D         [ 4] 2713     call neg_acc24
      000D84                       2714 atoi_exit: 
      008D4A 6B 01            [ 2] 2715 	addw sp,#VSIZE
      008D4C A6               [ 2] 2716 	popw x ; restore x
      008D4D 36               [ 4] 2717 	ret
                                   2718 
                                   2719 
                                   2720 ;------------------------------------
                                   2721 ; skip character c in text starting from 'in'
                                   2722 ; input:
                                   2723 ;	 y 		point to text buffer
                                   2724 ;    a 		character to skip
                                   2725 ; output:  
                                   2726 ;	'in' ajusted to new position
                                   2727 ;------------------------------------
                           000001  2728 	C = 1 ; local var
      000D88                       2729 skip:
      008D4E 20               [ 1] 2730 	push a
      008D4F 27 A1 3E         [ 4] 2731 1$:	ld a,([in.w],y)
      008D52 26 0C            [ 1] 2732 	jreq 2$
      008D54 7B 01            [ 1] 2733 	cp a,(C,sp)
      008D56 F7 5C            [ 1] 2734 	jrne 2$
      008D58 A6 3E 6B 01      [ 1] 2735 	inc in
      008D5C A6 35            [ 2] 2736 	jra 1$
      000D98                       2737 2$: _drop 1 
      008D5E 20 17            [ 2]    1     addw sp,#1 
      008D60 72               [ 4] 2738 	ret
                                   2739 	
                                   2740 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2741 ;;   TINY BASIC  operators,
                                   2742 ;;   commands and functions 
                                   2743 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2744 
                                   2745 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2746 ;;  Arithmetic operators
                                   2747 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2748 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2749 ;--------------------------------
                                   2750 ;  add 2 integers
                                   2751 ;  input:
                                   2752 ;    N1     on cstack 
                                   2753 ;    N2     on cstack 
                                   2754 ;  output:
                                   2755 ;    X 		n2+n1 
                                   2756 ;--------------------------------
                                   2757 	;arugments on cstack 
      000D9B                       2758 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000D9B                       2759 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000D9B                       2760 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000D9B                       2761 add:
      008D61 5A 00            [ 2] 2762 	ldw x ,(N2,sp)
      008D63 02 7B 02         [ 2] 2763 	addw x,(N1,sp)
      008D66 20 0F            [ 2] 2764 	ldw (N1,sp),x 
      008D68 81               [ 4] 2765 	ret 
                                   2766 
                                   2767 ;--------------------------------
                                   2768 ;  substract 2 ntegers
                                   2769 ;  input:
                                   2770 ;    N1     on cstack 
                                   2771 ;    N2     on cstack 
                                   2772 ;  output:
                                   2773 ;    X 		n2+n1 
                                   2774 ;--------------------------------
      000DA3                       2775 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000DA3                       2776 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000DA3                       2777 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000DA3                       2778 substract:
      008D68 7B 01            [ 2] 2779 	ldw x,(N2,sp)
      008D6A CD 85 0D         [ 2] 2780 	subw x,(N1,sp)
      008D6D 25               [ 4] 2781 	ret 
                                   2782 
                                   2783 ;-------------------------------------
                                   2784 ; multiply 2 integers
                                   2785 ; product overflow is ignored unless
                                   2786 ; MATH_OVF assembler flag is set to 1
                                   2787 ; input:
                                   2788 ;  	N1      on cstack
                                   2789 ;   N2 		on cstack 
                                   2790 ; output:
                                   2791 ;	X        N1*N2 
                                   2792 ;-------------------------------------
                                   2793 	;arguments 
      000DA9                       2794 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000DA9                       2795 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      000DA9                       2796 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000DA9                       2797 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000DA9                       2798 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2799    ; local variables 
                           000001  2800 	SIGN=1
                           000002  2801 	PROD=2
                           000003  2802 	VSIZE=3
      000DA9                       2803 multiply:
      000DA9                       2804 	_vars VSIZE 
      008D6E 03 CC            [ 2]    1     sub sp,#VSIZE 
      008D70 87 DD            [ 1] 2805 	clr (SIGN,sp)
      008D72 1E 06            [ 2] 2806 	ldw x,(N1_HB,sp)
      008D72 CD               [ 1] 2807 	ld a,xh  
      008D73 8B 98            [ 1] 2808 	bcp a,#0x80 
      008D75 20 10            [ 1] 2809 	jreq 2$
      008D77 03 01            [ 1] 2810 	cpl (SIGN,sp)
      008D77 6B               [ 2] 2811 	negw x 
      008D78 02 7B            [ 2] 2812 	ldw (N1_HB,sp),x 
      008D7A 01 F7            [ 2] 2813 2$: ldw x,(N2_HB,sp)
      008D7C 5C               [ 1] 2814 	ld a,xh  
      008D7D 7F 72            [ 1] 2815 	bcp a,#0x80 
      008D7F 5C 00            [ 1] 2816 	jreq 3$
      008D81 02 7B            [ 1] 2817 	cpl (SIGN,sp)
      008D83 02               [ 2] 2818 	negw x 
      008D84 AE 17            [ 2] 2819 	ldw (N2_HB,sp),x 
                                   2820 ; N1_LB * N2_LB 	
      008D86 38 07            [ 1] 2821 3$:	ld a,(N1_LB,sp)
      008D87 97               [ 1] 2822 	ld xl,a 
      008D87 5B 02            [ 1] 2823 	ld a,(N2_LB,sp) 
      008D89 81               [ 4] 2824 	mul x,a 
                           000000  2825 .if MATH_OVF 	
                                   2826 	ld a,xh 
                                   2827 	bcp a,#0x80 
                                   2828 	jreq 4$ 
                                   2829 	ld a,#ERR_MATH_OVF 
                                   2830 	jp tb_error
                                   2831 .endif 	 
      008D8A 1F 02            [ 2] 2832 4$:	ldw (PROD,sp),x
                                   2833 ; N1_LB * N2_HB	 
      008D8A A1 61            [ 1] 2834 	ld a,(N1_LB,sp) 
      008D8C 2A               [ 1] 2835 	ld xl,a 
      008D8D 01 81            [ 1] 2836 	ld a,(N2_HB,sp)
      008D8F A1               [ 4] 2837 	mul x,a
      008D90 7A               [ 1] 2838 	ld a,xl 
      008D91 22 FB            [ 1] 2839 	add a,(PROD,sp)
                           000000  2840 .if MATH_OVF 	
                                   2841 	bcp a,#0x80 
                                   2842 	jreq 5$ 
                                   2843 	ld a,#ERR_MATH_OVF 
                                   2844 	jp tb_error
                                   2845 .endif 	 
      008D93 A0 20            [ 1] 2846 5$:	ld (PROD,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2847 ; N1_HB * N2_LB 
      008D95 81 06            [ 1] 2848 	ld a,(N1_HB,sp)
      008D96 97               [ 1] 2849 	ld xl,a 
      008D96 89 52            [ 1] 2850 	ld a,(N2_LB,sp)
      008D98 03               [ 4] 2851 	mul x,a 
      008D99 72               [ 1] 2852 	ld a,xl 
      008D9A 5F 00            [ 1] 2853 	add a,(PROD,sp)
                           000000  2854 .if MATH_OVF 	
                                   2855 	bcp a,#0x80 
                                   2856 	jreq 6$ 
                                   2857 	ld a,#ERR_MATH_OVF 
                                   2858 	jp tb_error
                                   2859 .endif 	 
      008D9C 0C 72            [ 1] 2860 6$:	ld (PROD,sp),a 
                                   2861 ; N1_HB * N2_HB 	
                                   2862 ; it is pointless to multiply N1_HB*N2_HB 
                                   2863 ; as this product is over 65535 or 0 
                                   2864 ;
                                   2865 ; sign adjust product
      008D9E 5F 00            [ 1] 2866 	tnz (SIGN,sp)
      008DA0 0D 72            [ 1] 2867 	jreq 7$
      008DA2 5F 00            [ 2] 2868 	ldw x, (PROD,sp)
      008DA4 0E               [ 2] 2869 	negw x
      008DA5 C6 17            [ 2] 2870 	ldw (PROD,sp),x  
      000DEC                       2871 7$: 
      008DA7 38 27            [ 2] 2872 	ldw x,(PROD,sp) 
      000DEE                       2873 	_drop VSIZE 
      008DA9 5A 0F            [ 2]    1     addw sp,#VSIZE 
      008DAB 01               [ 4] 2874 	ret
                                   2875 
                                   2876 ;----------------------------------
                                   2877 ;  euclidian divide n2/n1 
                                   2878 ; input:
                                   2879 ;    N2 	on cstack
                                   2880 ;    N1 	on cstack
                                   2881 ; output:
                                   2882 ;    X      n2/n1 
                                   2883 ;    Y      remainder 
                                   2884 ;----------------------------------
      000DF1                       2885 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000DF1                       2886 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000DF1                       2887 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2888 	; local variables
                           000001  2889 	SQUOT=1 ; sign quotient
                           000002  2890 	SDIVD=2 ; sign dividend  
                           000002  2891 	VSIZE=2
      000DF1                       2892 divide:
      000DF1                       2893 	_vars VSIZE 
      008DAC A6 0A            [ 2]    1     sub sp,#VSIZE 
      008DAE 6B 02            [ 1] 2894 	clr (SQUOT,sp)
      008DB0 AE 17            [ 1] 2895 	clr (SDIVD,sp)
                                   2896 ; check for 0 divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008DB2 38 F6            [ 2] 2897 	ldw x,(DIVISR,sp)
      008DB4 27               [ 2] 2898 	tnzw x 
      008DB5 47 A1            [ 1] 2899     jrne 0$
      008DB7 2D 26            [ 1] 2900 	ld a,#ERR_DIV0 
      008DB9 04 03 01         [ 2] 2901 	jp tb_error 
                                   2902 ; check divisor sign 	
      008DBC 20               [ 1] 2903 0$:	ld a,xh 
      008DBD 08 A1            [ 1] 2904 	bcp a,#0x80 
      008DBF 24 26            [ 1] 2905 	jreq 1$
      008DC1 06 A6            [ 1] 2906 	cpl (SQUOT,sp)
      008DC3 10               [ 2] 2907 	negw x 
      008DC4 6B 02            [ 2] 2908 1$:	ldw (DIVISR,sp),x
                                   2909 ; check dividend sign 	 
      008DC6 5C F6            [ 2] 2910     ldw x,(DIVIDND,sp)
      008DC8 9E               [ 1] 2911 	ld a,xh 
      008DC8 A1 61            [ 1] 2912 	bcp a,#0x80 
      008DCA 2B 02            [ 1] 2913 	jreq 2$ 
      008DCC A0 20            [ 1] 2914 	cpl (SQUOT,sp)
      008DCE A1 30            [ 1] 2915 	cpl (SDIVD,sp)
      008DD0 2B               [ 2] 2916 	negw x 
      008DD1 2B A0            [ 2] 2917 2$:	ldw y,(DIVISR,sp)
      008DD3 30               [ 2] 2918 	divw x,y
      008DD4 A1 0A 2B 06      [ 2] 2919 	ldw acc16,y 
                                   2920 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008DD8 A0 07            [ 1] 2921 	tnz (SDIVD,sp)
      008DDA 11 02            [ 1] 2922 	jreq 7$
      008DDC 2A 1F            [ 2] 2923 	tnzw y 
      008DDE 6B 03            [ 1] 2924 	jreq 7$
      008DE0 7B               [ 2] 2925 	incw x
      008DE1 02 CD            [ 2] 2926 	ldw y,(DIVISR,sp)
      008DE3 89 F6 7B 03      [ 2] 2927 	subw y,acc16
      008DE7 CB 00            [ 1] 2928 7$: tnz (SQUOT,sp)
      008DE9 0E C7            [ 1] 2929 	jreq 9$ 	 
      008DEB 00               [ 2] 2930 8$:	negw x 
      000E32                       2931 9$: 
      000E32                       2932 	_drop VSIZE 
      008DEC 0E 4F            [ 2]    1     addw sp,#VSIZE 
      008DEE C9               [ 4] 2933 	ret 
                                   2934 
                                   2935 
                                   2936 ;----------------------------------
                                   2937 ;  remainder resulting from euclidian 
                                   2938 ;  division of n2/n1 
                                   2939 ; input:
                                   2940 ;   N1 		cstack 
                                   2941 ;   N2      cstack
                                   2942 ; output:
                                   2943 ;   X       N2%N1 
                                   2944 ;----------------------------------
                           000003  2945 	N1=3
                           000005  2946 	N2=5
                           000004  2947 	VSIZE=4
      000E35                       2948 modulo:
      008DEF 00 0D            [ 2] 2949 	Ldw x,(N1,sp)
      008DF1 C7 00            [ 2] 2950 	ldw y,(N2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      000E39                       2951 	_vars VSIZE 
      008DF3 0D 4F            [ 2]    1     sub sp,#VSIZE 
      008DF5 C9 00            [ 2] 2952 	ldw (1,sp),x 
      008DF7 0C C7            [ 2] 2953 	ldw (3,sp),y 
      008DF9 00 0C 20         [ 4] 2954 	call divide 
      008DFC C9               [ 1] 2955 	ldw x,y
      000E43                       2956 	_drop VSIZE 
      008DFD 0D 01            [ 2]    1     addw sp,#VSIZE 
      008DFF 27               [ 4] 2957 	ret 
                                   2958 
                                   2959 
                                   2960 ;----------------------------------
                                   2961 ; search in kword_dict name
                                   2962 ; from its execution address 
                                   2963 ; input:
                                   2964 ;   X       	execution address 
                                   2965 ; output:
                                   2966 ;   X 			cstr*  | 0 
                                   2967 ;--------------------------------
                           000001  2968 	XADR=1 
                           000003  2969 	LINK=3 
                           000004  2970 	VSIZE=4
      000E46                       2971 cmd_name:
      000E46                       2972 	_vars VSIZE 
      008E00 03 CD            [ 2]    1     sub sp,#VSIZE 
      008E02 8A 30 00 0C      [ 1] 2973 	clr acc16 
      008E04 1F 01            [ 2] 2974 	ldw (XADR,sp),x  
      008E04 5B 03 85         [ 2] 2975 	ldw x,#kword_dict	
      008E07 81 03            [ 2] 2976 1$:	ldw (LINK,sp),x
      008E08 E6 02            [ 1] 2977 	ld a,(2,x)
      008E08 88 91            [ 1] 2978 	and a,#15 
      008E0A D6 01 27         [ 1] 2979 	ld acc8,a 
      008E0D 0A 11 01         [ 2] 2980 	addw x,#3
      008E10 26 06 72 5C      [ 2] 2981 	addw x,acc16
      008E14 00               [ 2] 2982 	ldw x,(x) ; execution address 
      008E15 02 20            [ 2] 2983 	cpw x,(XADR,sp)
      008E17 F1 5B            [ 1] 2984 	jreq 2$
      008E19 01 81            [ 2] 2985 	ldw x,(LINK,sp)
      008E1B FE               [ 2] 2986 	ldw x,(x) 
      008E1B 1E 05 72         [ 2] 2987 	subw x,#2  
      008E1E FB 03            [ 1] 2988 	jrne 1$
      008E20 1F 03            [ 2] 2989 	jra 9$
      008E22 81 03            [ 2] 2990 2$: ldw x,(LINK,sp)
      008E23 1C 00 02         [ 2] 2991 	addw x,#2 	
      000E75                       2992 9$:	_drop VSIZE
      008E23 1E 05            [ 2]    1     addw sp,#VSIZE 
      008E25 72               [ 4] 2993 	ret
                                   2994 
                                   2995 
                                   2996 ;---------------------------------
                                   2997 ; dictionary search 
                                   2998 ; input:
                                   2999 ;	X 		dictionary entry point 
                                   3000 ;  pad		.asciz name to search 
                                   3001 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   3002 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3003 ;  X		execution address | 0 
                                   3004 ;---------------------------------
                           000001  3005 	NLEN=1 ; cmd length 
                           000002  3006 	YSAVE=2
                           000003  3007 	VSIZE=3 
      000E78                       3008 search_dict:
      000E78                       3009 	_vars VSIZE 
      008E26 F0 03            [ 2]    1     sub sp,#VSIZE 
      008E28 81 93            [ 1] 3010 	ldw y,x 
      008E29                       3011 search_next:	
      008E29 52 03            [ 1] 3012 	ld a,(y)
      008E2B 0F 01            [ 1] 3013 	and a,#0xf 
      008E2D 1E 06            [ 1] 3014 	ld (NLEN,sp),a  
      008E2F 9E A5 80         [ 2] 3015 	ldw x,#pad 
      008E32 27 05            [ 2] 3016 	ldw (YSAVE,sp),y
      008E34 03 01            [ 2] 3017 	incw y  
      000E89                       3018 cp_loop:
      008E36 50               [ 1] 3019 	ld a,(x)
      008E37 1F 06            [ 1] 3020 	jreq str_match 
      008E39 1E 08            [ 1] 3021 	tnz (NLEN,sp)
      008E3B 9E A5            [ 1] 3022 	jreq no_match  
      008E3D 80 27            [ 1] 3023 	cp a,(y)
      008E3F 05 03            [ 1] 3024 	jrne no_match 
      008E41 01 50            [ 2] 3025 	incw y 
      008E43 1F               [ 2] 3026 	incw x
      008E44 08 7B            [ 1] 3027 	dec (NLEN,sp)
      008E46 07 97            [ 2] 3028 	jra cp_loop 
      000E9B                       3029 no_match:
      008E48 7B 09            [ 2] 3030 	ldw y,(YSAVE,sp) 
      008E4A 42 1F 02 7B      [ 2] 3031 	subw y,#2 ; move Y to link field
      008E4E 07 97            [ 1] 3032 	push #TK_NONE 
      008E50 7B 08            [ 2] 3033 	ldw y,(y) ; next word link 
      008E52 42               [ 1] 3034 	pop a ; TK_NONE 
      008E53 9F 1B            [ 1] 3035 	jreq search_exit  ; not found  
                                   3036 ;try next 
      008E55 02 6B            [ 2] 3037 	jra search_next
      000EAA                       3038 str_match:
      008E57 02 7B            [ 2] 3039 	ldw y,(YSAVE,sp)
      008E59 06 97            [ 1] 3040 	ld a,(y)
      008E5B 7B 09            [ 1] 3041 	ld (NLEN,sp),a ; needed to test keyword type  
      008E5D 42 9F            [ 1] 3042 	and a,#0xf 
                                   3043 ; move y to procedure address field 	
      008E5F 1B               [ 1] 3044 	inc a 
      008E60 02 6B 02         [ 1] 3045 	ld acc8,a 
      008E63 0D 01 27 05      [ 1] 3046 	clr acc16 
      008E67 1E 02 50 1F      [ 2] 3047 	addw y,acc16 
      008E6B 02 FE            [ 2] 3048 	ldw y,(y) ; routine entry point 
                                   3049 ;determine keyword type bits 7:6 
      008E6C 7B 01            [ 1] 3050 	ld a,(NLEN,sp)
      008E6C 1E               [ 1] 3051 	swap a 
      008E6D 02 5B            [ 1] 3052 	and a,#0xc
      008E6F 03               [ 1] 3053 	srl a
      008E70 81               [ 1] 3054 	srl a 
      008E71 AB 06            [ 1] 3055 	add a,#6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      000EC9                       3056 search_exit: 
      008E71 52               [ 1] 3057 	ldw x,y ; x=routine address 
      000ECA                       3058 	_drop VSIZE 	 
      008E72 02 0F            [ 2]    1     addw sp,#VSIZE 
      008E74 01               [ 4] 3059 	ret 
                                   3060 
                                   3061 ;---------------------
                                   3062 ; check if next token
                                   3063 ;  is of expected type 
                                   3064 ; input:
                                   3065 ;   A 		 expected token attribute
                                   3066 ;  ouput:
                                   3067 ;   none     if fail call syntax_error 
                                   3068 ;--------------------
      000ECD                       3069 expect:
      008E75 0F               [ 1] 3070 	push a 
      008E76 02 1E 05         [ 4] 3071 	call next_token 
      008E79 5D 26            [ 1] 3072 	cp a,(1,sp)
      008E7B 05 A6            [ 1] 3073 	jreq 1$
      008E7D 04 CC 87         [ 2] 3074 	jp syntax_error
      008E80 DF               [ 1] 3075 1$: pop a 
      008E81 9E               [ 4] 3076 	ret 
                                   3077 
                                   3078 
                                   3079 ;-------------------------------
                                   3080 ; parse embedded BASIC routines 
                                   3081 ; arguments list.
                                   3082 ; arg_list::=  rel[','rel]*
                                   3083 ; all arguments are of integer type
                                   3084 ; and pushed on stack 
                                   3085 ; input:
                                   3086 ;   none
                                   3087 ; output:
                                   3088 ;   stack{n}   arguments pushed on stack
                                   3089 ;   A 	number of arguments pushed on stack  
                                   3090 ;--------------------------------
      000EDA                       3091 arg_list:
      008E82 A5 80            [ 1] 3092 	push #0  
      008E84 27 03 03         [ 4] 3093 1$: call relation
      008E87 01 50            [ 1] 3094 	cp a,#TK_NONE 
      008E89 1F 05            [ 1] 3095 	jreq 5$
      008E8B 1E 07            [ 1] 3096 	cp a,#TK_INTGR
      008E8D 9E A5            [ 1] 3097 	jrne 4$
      000EE7                       3098 3$: 
                                   3099 ; swap return address with argument
      008E8F 80               [ 1] 3100 	pop a 
      008E90 27 05            [ 2] 3101 	popw y 
      008E92 03               [ 2] 3102 	pushw x 
      008E93 01 03            [ 2] 3103 	pushw y 
      008E95 02               [ 1] 3104     inc a
      008E96 50               [ 1] 3105 	push a 
      008E97 16 05 65         [ 4] 3106 	call next_token 
      008E9A 90 CF            [ 1] 3107 	cp a,#TK_COMMA 
      008E9C 00 0D            [ 1] 3108 	jreq 1$ 
      008E9E 0D 02            [ 1] 3109 	cp a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008EA0 27 0B            [ 1] 3110 	jreq 5$ 
      000EFA                       3111 4$:	_unget_token 
      008EA2 90 5D 27 07 5C   [ 1]    1     mov in,in.saved
      008EA7 16               [ 1] 3112 5$:	pop a  
      008EA8 05               [ 4] 3113 	ret 
                                   3114 
                                   3115 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3116 ; parse arguments list 
                                   3117 ; between ()
                                   3118 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      000F01                       3119 func_args:
      008EA9 72               [ 2] 3120 	popw x
      008EAA B2 00 0D         [ 2] 3121 	ldw tmp16,x  
      008EAD 0D 01            [ 1] 3122 	ld a,#TK_LPAREN 
      008EAF 27 01 50         [ 4] 3123 	call expect 
      008EB2 CD 0E DA         [ 4] 3124 	call arg_list 
      008EB2 5B               [ 1] 3125 	push a 
      008EB3 02 81            [ 1] 3126 	ld a,#TK_RPAREN 
      008EB5 CD 0E CD         [ 4] 3127 	call expect 
      008EB5 1E               [ 1] 3128 	pop a 
      008EB6 03 16 05 52      [ 5] 3129 	jp [tmp16]
                                   3130 
                                   3131 ;--------------------------------
                                   3132 ;   BASIC commnands 
                                   3133 ;--------------------------------
                                   3134 
                                   3135 ;--------------------------------
                                   3136 ;  arithmetic and relational 
                                   3137 ;  routines
                                   3138 ;  operators precedence
                                   3139 ;  highest to lowest
                                   3140 ;  operators on same row have 
                                   3141 ;  same precedence and are executed
                                   3142 ;  from left to right.
                                   3143 ;	'*','/','%'
                                   3144 ;   '-','+'
                                   3145 ;   '=','>','<','>=','<=','<>','><'
                                   3146 ;   '<>' and '><' are equivalent for not equal.
                                   3147 ;--------------------------------
                                   3148 
                                   3149 ;---------------------
                                   3150 ; return array element
                                   3151 ; address from @(expr)
                                   3152 ; input:
                                   3153 ;   A 		TK_ARRAY
                                   3154 ; output:
                                   3155 ;   A 		TK_INTGR
                                   3156 ;	X 		element address 
                                   3157 ;----------------------
      000F18                       3158 get_array_element:
      008EBA 04 1F 01         [ 4] 3159 	call func_args 
      008EBD 17 03            [ 1] 3160 	cp a,#1
      008EBF CD 8E            [ 1] 3161 	jreq 1$
      008EC1 71 93 5B         [ 2] 3162 	jp syntax_error
      008EC4 04               [ 2] 3163 1$: popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3164 	; check for bounds 
      008EC5 81 00 23         [ 2] 3165 	cpw x,array_size 
      008EC6 23 05            [ 2] 3166 	jrule 3$
                                   3167 ; bounds {1..array_size}	
      008EC6 52 04            [ 1] 3168 2$: ld a,#ERR_BAD_VALUE 
      008EC8 72 5F 00         [ 2] 3169 	jp tb_error 
      008ECB 0D               [ 2] 3170 3$: tnzw  x
      008ECC 1F 01            [ 1] 3171 	jreq 2$ 
      008ECE AE               [ 2] 3172 	sllw x 
      008ECF A5               [ 2] 3173 	pushw x 
      008ED0 F5 1F 03         [ 2] 3174 	ldw x,#tib
      008ED3 E6 02 A4         [ 2] 3175 	subw x,(1,sp)
      000F38                       3176 	_drop 2   
      008ED6 0F C7            [ 2]    1     addw sp,#2 
      008ED8 00 0E            [ 1] 3177 	ld a,#TK_INTGR
      008EDA 1C               [ 4] 3178 	ret 
                                   3179 
                                   3180 ;***********************************
                                   3181 ;   expression parse,execute 
                                   3182 ;***********************************
                                   3183 ;-----------------------------------
                                   3184 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3185 ;			 integer | function |
                                   3186 ;			 '('relation')' 
                                   3187 ; output:
                                   3188 ;   A    token attribute 
                                   3189 ;   X 	 integer
                                   3190 ; ---------------------------------
                           000001  3191 	NEG=1
                           000001  3192 	VSIZE=1
      000F3D                       3193 factor:
      000F3D                       3194 	_vars VSIZE 
      008EDB 00 03            [ 2]    1     sub sp,#VSIZE 
      008EDD 72 BB 00         [ 4] 3195 	call next_token
      008EE0 0D FE            [ 1] 3196 	cp a,#CMD_END 
      008EE2 13 01            [ 1] 3197 	jrmi 20$
      008EE4 27 0A            [ 1] 3198 1$:	ld (NEG,sp),a 
      008EE6 1E 03            [ 1] 3199 	and a,#TK_GRP_MASK
      008EE8 FE 1D            [ 1] 3200 	cp a,#TK_GRP_ADD 
      008EEA 00 02            [ 1] 3201 	jreq 2$
      008EEC 26 E3            [ 1] 3202 	ld a,(NEG,sp)
      008EEE 20 05            [ 2] 3203 	jra 4$  
      000F52                       3204 2$:	
      008EF0 1E 03 1C         [ 4] 3205 	call next_token 
      000F55                       3206 4$:	
      008EF3 00 02            [ 1] 3207 	cp a,#TK_IFUNC 
      008EF5 5B 04            [ 1] 3208 	jrne 5$ 
      008EF7 81               [ 4] 3209 	call (x) 
      008EF8 20 2F            [ 2] 3210 	jra 18$ 
      000F5C                       3211 5$:
      008EF8 52 03            [ 1] 3212 	cp a,#TK_INTGR
      008EFA 90 93            [ 1] 3213 	jrne 6$
      008EFC 20 29            [ 2] 3214 	jra 18$
      000F62                       3215 6$:
      008EFC 90 F6            [ 1] 3216 	cp a,#TK_ARRAY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008EFE A4 0F            [ 1] 3217 	jrne 10$
      008F00 6B 01 AE         [ 4] 3218 	call get_array_element
      008F03 17               [ 2] 3219 	ldw x,(x)
      008F04 38 17            [ 2] 3220 	jra 18$ 
      000F6C                       3221 10$:
      008F06 02 90            [ 1] 3222 	cp a,#TK_VAR 
      008F08 5C 03            [ 1] 3223 	jrne 12$
      008F09 FE               [ 2] 3224 	ldw x,(x)
      008F09 F6 27            [ 2] 3225 	jra 18$
      000F73                       3226 12$:			
      008F0B 1E 0D            [ 1] 3227 	cp a,#TK_LPAREN
      008F0D 01 27            [ 1] 3228 	jrne 16$
      008F0F 0B 90 F1         [ 4] 3229 	call relation
      008F12 26               [ 2] 3230 	pushw x 
      008F13 07 90            [ 1] 3231 	ld a,#TK_RPAREN 
      008F15 5C 5C 0A         [ 4] 3232 	call expect
      008F18 01               [ 2] 3233 	popw x 
      008F19 20 EE            [ 2] 3234 	jra 18$	
      008F1B                       3235 16$:
      000F83                       3236 	_unget_token
      008F1B 16 02 72 A2 00   [ 1]    1     mov in,in.saved
      008F20 02               [ 1] 3237 	clr a 
      008F21 4B 00            [ 2] 3238 	jra 20$ 
      000F8B                       3239 18$: 
      008F23 90 FE            [ 1] 3240 	ld a,#TK_MINUS 
      008F25 84 27            [ 1] 3241 	cp a,(NEG,sp)
      008F27 21 20            [ 1] 3242 	jrne 19$
      008F29 D2               [ 2] 3243 	negw x
      008F2A                       3244 19$:
      008F2A 16 02            [ 1] 3245 	ld a,#TK_INTGR
      000F94                       3246 20$:
      000F94                       3247 	_drop VSIZE
      008F2C 90 F6            [ 2]    1     addw sp,#VSIZE 
      008F2E 6B               [ 4] 3248 	ret
                                   3249 
                                   3250 ;-----------------------------------
                                   3251 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3252 ; output:
                                   3253 ;   A    	token attribute 
                                   3254 ;	X		integer
                                   3255 ;-----------------------------------
                           000001  3256 	N1=1
                           000003  3257 	N2=3
                           000005  3258 	MULOP=5
                           000005  3259 	VSIZE=5
      000F97                       3260 term:
      000F97                       3261 	_vars VSIZE
      008F2F 01 A4            [ 2]    1     sub sp,#VSIZE 
      008F31 0F 4C C7         [ 4] 3262 	call factor
      008F34 00 0E            [ 1] 3263 	cp a,#CMD_END
      008F36 72 5F            [ 1] 3264 	jrmi term_exit
      000FA0                       3265 term01:	 ; check for  operator 
      008F38 00 0D            [ 2] 3266 	ldw (N2,sp),x  ; save first factor 
      008F3A 72 B9 00         [ 4] 3267 	call next_token
      008F3D 0D 90            [ 1] 3268 	cp a,#CMD_END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008F3F FE 7B            [ 1] 3269 	jrmi 9$
      008F41 01 4E            [ 1] 3270 0$:	ld (MULOP,sp),a
      008F43 A4 0C            [ 1] 3271 	and a,#TK_GRP_MASK
      008F45 44 44            [ 1] 3272 	cp a,#TK_GRP_MULT
      008F47 AB 06            [ 1] 3273 	jreq 1$
      008F49 7B 05            [ 1] 3274 	ld a,(MULOP,sp) 
      000FB3                       3275 	_unget_token 
      008F49 93 5B 03 81 01   [ 1]    1     mov in,in.saved
      008F4D 20 25            [ 2] 3276 	jra 9$
      000FBA                       3277 1$:	; got *|/|%
      008F4D 88 CD 88         [ 4] 3278 	call factor
      008F50 90 11            [ 1] 3279 	cp a,#TK_INTGR
      008F52 01 27            [ 1] 3280 	jreq 2$ 
      008F54 03 CC 87         [ 2] 3281 	jp syntax_error
      008F57 DD 84            [ 2] 3282 2$:	ldw (N1,sp),x  
      008F59 81 05            [ 1] 3283 	ld a,(MULOP,sp) 
      008F5A A1 20            [ 1] 3284 	cp a,#TK_MULT 
      008F5A 4B 00            [ 1] 3285 	jrne 3$
      008F5C CD 90 AA         [ 4] 3286 	call multiply 
      008F5F A1 00            [ 2] 3287 	jra term01
      008F61 27 1C            [ 1] 3288 3$: cp a,#TK_DIV 
      008F63 A1 04            [ 1] 3289 	jrne 4$ 
      008F65 26 13 F1         [ 4] 3290 	call divide 
      008F67 20 C6            [ 2] 3291 	jra term01 
      008F67 84 90 85         [ 4] 3292 4$: call modulo
      008F6A 89 90            [ 2] 3293 	jra term01 
      008F6C 89 4C            [ 2] 3294 9$: ldw x,(N2,sp)  
      008F6E 88 CD            [ 1] 3295 	ld a,#TK_INTGR 	
      000FE3                       3296 term_exit:
      000FE3                       3297 	_drop VSIZE 
      008F70 88 90            [ 2]    1     addw sp,#VSIZE 
      008F72 A1               [ 4] 3298 	ret 
                                   3299 
                                   3300 ;-------------------------------
                                   3301 ;  expr ::= term [['+'|'-'] term]*
                                   3302 ;  result range {-32768..32767}
                                   3303 ;  output:
                                   3304 ;   A    token attribute 
                                   3305 ;   X	 integer   
                                   3306 ;-------------------------------
                           000001  3307 	N1=1 
                           000003  3308 	N2=3
                           000005  3309 	OP=5 
                           000005  3310 	VSIZE=5 
      000FE6                       3311 expression:
      000FE6                       3312 	_vars VSIZE 
      008F73 0D 27            [ 2]    1     sub sp,#VSIZE 
      008F75 E6 A1 00         [ 4] 3313 	call term
      008F78 27 05            [ 1] 3314 	cp a,#CMD_END 
      008F7A 55 00            [ 1] 3315 	jrmi expr_exit 
      008F7C 03 00            [ 2] 3316 0$:	ldw (N2,sp),x 
      008F7E 02 84 81         [ 4] 3317 	call next_token
      008F81 A1 02            [ 1] 3318 	cp a,#CMD_END 
      008F81 85 CF            [ 1] 3319 	jrmi 9$ 
      008F83 00 0F            [ 1] 3320 1$:	ld (OP,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      008F85 A6 0B            [ 1] 3321 	and a,#TK_GRP_MASK
      008F87 CD 8F            [ 1] 3322 	cp a,#TK_GRP_ADD 
      008F89 4D CD            [ 1] 3323 	jreq 2$ 
      001000                       3324 	_unget_token
      008F8B 8F 5A 88 A6 0C   [ 1]    1     mov in,in.saved
      008F90 CD 8F            [ 2] 3325 	jra 9$
      001007                       3326 2$: 
      008F92 4D 84 72         [ 4] 3327 	call term
      008F95 CC 00            [ 1] 3328 	cp a,#TK_INTGR 
      008F97 0F 03            [ 1] 3329 	jreq 3$
      008F98 CC 07 5D         [ 2] 3330 	jp syntax_error
      008F98 CD 8F            [ 2] 3331 3$:	ldw (N1,sp),x 
      008F9A 81 A1            [ 1] 3332 	ld a,(OP,sp)
      008F9C 01 27            [ 1] 3333 	cp a,#TK_PLUS 
      008F9E 03 CC            [ 1] 3334 	jrne 4$
      008FA0 87 DD 85         [ 4] 3335 	call add 
      008FA3 C3 00            [ 2] 3336 	jra 0$ 
      008FA5 24 23 05         [ 4] 3337 4$:	call substract
      008FA8 A6 0A            [ 2] 3338 	jra 0$
      008FAA CC 87            [ 2] 3339 9$: ldw x,(N2,sp)
      008FAC DF 5D            [ 1] 3340 	ld a,#TK_INTGR	
      001027                       3341 expr_exit:
      001027                       3342 	_drop VSIZE 
      008FAE 27 F8            [ 2]    1     addw sp,#VSIZE 
      008FB0 58               [ 4] 3343 	ret 
                                   3344 
                                   3345 ;---------------------------------------------
                                   3346 ; rel ::= expr rel_op expr
                                   3347 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3348 ;  relation return 1 | 0  for true | false 
                                   3349 ;  output:
                                   3350 ;    A 		token attribute  
                                   3351 ;	 X		1|0
                                   3352 ;---------------------------------------------
                           000001  3353 	N1=1
                           000003  3354 	N2=3
                           000005  3355 	RELOP=5
                           000005  3356 	VSIZE=5 
      00102A                       3357 relation: 
      00102A                       3358 	_vars VSIZE
      008FB1 89 AE            [ 2]    1     sub sp,#VSIZE 
      008FB3 16 E8 72         [ 4] 3359 	call expression
      008FB6 F0 01            [ 1] 3360 	cp a,#CMD_END  
      008FB8 5B 02            [ 1] 3361 	jrmi rel_exit 
                                   3362 	; expect rel_op or leave 
      008FBA A6 04            [ 2] 3363 	ldw (N2,sp),x 
      008FBC 81 08 10         [ 4] 3364 	call next_token 
      008FBD A1 02            [ 1] 3365 	cp a,#CMD_END 
      008FBD 52 01            [ 1] 3366 	jrmi 9$
      00103C                       3367 1$:	
      008FBF CD 88            [ 1] 3368 	ld (RELOP,sp),a 
      008FC1 90 A1            [ 1] 3369 	and a,#TK_GRP_MASK
      008FC3 02 2B            [ 1] 3370 	cp a,#TK_GRP_RELOP 
      008FC5 4E 6B            [ 1] 3371 	jreq 2$
      001044                       3372 	_unget_token  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      008FC7 01 A4 30 A1 10   [ 1]    1     mov in,in.saved
      008FCC 27 04            [ 2] 3373 	jra 9$
      00104B                       3374 2$:	; expect another expression or error 
      008FCE 7B 01 20         [ 4] 3375 	call expression
      008FD1 03 04            [ 1] 3376 	cp a,#TK_INTGR 
      008FD2 27 03            [ 1] 3377 	jreq 3$
      008FD2 CD 88 90         [ 2] 3378 	jp syntax_error 
      008FD5 1F 01            [ 2] 3379 3$:	ldw (N1,sp),x 
      008FD5 A1 07 26         [ 4] 3380 	call substract
      008FD8 03 FD            [ 1] 3381 	jrne 4$
      008FDA 20 2F 00 0D      [ 1] 3382 	mov acc8,#2 ; n1==n2
      008FDC 20 0C            [ 2] 3383 	jra 6$ 
      001062                       3384 4$: 
      008FDC A1 04            [ 1] 3385 	jrsgt 5$  
      008FDE 26 02 20 29      [ 1] 3386 	mov acc8,#4 ; n1<2 
      008FE2 20 04            [ 2] 3387 	jra 6$
      00106A                       3388 5$:
      008FE2 A1 0A 26 06      [ 1] 3389 	mov acc8,#1 ; n1>n2 
      00106E                       3390 6$:
      008FE6 CD               [ 1] 3391 	clrw x 
      008FE7 8F 98 FE         [ 1] 3392 	ld a, acc8  
      008FEA 20 1F            [ 1] 3393 	and a,(RELOP,sp)
      008FEC 4D               [ 1] 3394 	tnz a 
      008FEC A1 05            [ 1] 3395 	jreq 10$
      008FEE 26               [ 2] 3396 	incw x 
      001078                       3397 7$:	 
      008FEF 03 FE            [ 2] 3398 	jra 10$  	
      008FF1 20 18            [ 2] 3399 9$: ldw x,(N2,sp)
      008FF3                       3400 10$:
      008FF3 A1 0B            [ 1] 3401 	ld a,#TK_INTGR
      00107E                       3402 rel_exit: 	 
      00107E                       3403 	_drop VSIZE
      008FF5 26 0C            [ 2]    1     addw sp,#VSIZE 
      008FF7 CD               [ 4] 3404 	ret 
                                   3405 
                                   3406 ;--------------------------------
                                   3407 ; BASIC: SHOW 
                                   3408 ; print stack content in hexadecimal bytes 
                                   3409 ; 16 bytes per row 
                                   3410 ;--------------------------------
                           000001  3411 	TWSAVE=1
                           000002  3412 	BSAVE=2
                           000003  3413 	ADDR=3
                           000004  3414 	VSIZE=4 
      001081                       3415 show:
      001081                       3416 	_vars VSIZE
      008FF8 90 AA            [ 2]    1     sub sp,#VSIZE 
      008FFA 89 A6 0C         [ 1] 3417 	ld a,base 
      008FFD CD 8F            [ 1] 3418 	ld (BSAVE,sp),a
      008FFF 4D 85 20         [ 1] 3419 	ld a,tab_width
      009002 08 01            [ 1] 3420 	ld (TWSAVE,sp),a
      009003 35 10 00 0A      [ 1] 3421 	mov base,#16   
      009003 55 00 03         [ 2] 3422 	ldw x,#cstk_prompt
      009006 00 02 4F         [ 4] 3423 	call puts 
      009009 20               [ 1] 3424 	ldw x,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00900A 09 00 05         [ 2] 3425 	addw x,#VSIZE+1 ; ignore local vars and return address
      00900B 1F 03            [ 2] 3426 	ldw (ADDR,sp),x 
      00109D                       3427 dotr_loop:
      00900B A6 11 11         [ 2] 3428 	cpw x,#RAM_SIZE 
      00900E 01 26            [ 1] 3429 	jruge 9$
      009010 01 50            [ 1] 3430 	ld a,#16 
      009012 90 AE 18 00      [ 2] 3431 	ldw y,#RAM_SIZE  
      009012 A6 04 03         [ 2] 3432 	subw y,(ADDR,sp)
      009014 90 A3 00 10      [ 2] 3433 	cpw y,#16 
      009014 5B 01            [ 1] 3434 	jruge 2$
      009016 81 9F            [ 1] 3435 	ld a,yl  
      009017                       3436 2$:  
      009017 52 05 CD         [ 4] 3437 	call show_row 
      00901A 8F BD            [ 2] 3438 	ldw (ADDR,sp),x 
      00901C A1 02            [ 2] 3439 	jra dotr_loop 
      00901E 2B 43            [ 1] 3440 9$:	ld a,#CR 
      009020 CD 01 C4         [ 4] 3441 	call putc 
      009020 1F 03            [ 1] 3442 	ld a,(BSAVE,sp)
      009022 CD 88 90         [ 1] 3443 	ld base,a 
      009025 A1 02            [ 1] 3444 	ld a,(TWSAVE,sp)
      009027 2B 36 6B         [ 1] 3445 	ld tab_width,a 
      0010C9                       3446 	_drop VSIZE 
      00902A 05 A4            [ 2]    1     addw sp,#VSIZE 
      00902C 30               [ 1] 3447 	clr a 
      00902D A1               [ 4] 3448 	ret
                                   3449 
      00902E 20 27 09 7B 05 55 00  3450 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             03 00 02 20 25 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3451 
                                   3452 ;---------------------
                                   3453 ; display n bytes row 
                                   3454 ; from memory.
                                   3455 ; input:
                                   3456 ;   A   bytes to print 
                                   3457 ;	X   start address 
                                   3458 ; output:
                                   3459 ;   X   address after last shown  
                                   3460 ;---------------------
                           000001  3461 	CNT=1 
                           000002  3462 	ADR=2 
                           000003  3463 	VSIZE=3 
      00903A                       3464 show_row:
      00903A CD               [ 1] 3465 	tnz a 
      00903B 8F BD            [ 1] 3466 	jrne 1$
      00903D A1               [ 4] 3467 	ret 
      0010F8                       3468 1$:	
      00903E 04               [ 2] 3469 	pushw x  
      00903F 27               [ 1] 3470 	push a 
      009040 03 CC 87 DD      [ 1] 3471 	mov tab_width,#4 
      009044 1F 01 7B         [ 4] 3472 	call print_int 
      009047 05 A1            [ 1] 3473 	ld a,#SPACE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009049 20 26 05         [ 4] 3474 	call putc
      001106                       3475 row_loop:
      00904C CD 8E            [ 2] 3476 	ldw x,(ADR,sp)
      00904E 29               [ 1] 3477 	ld a,(x)
      00904F 20               [ 1] 3478 	clrw x 
      009050 CF               [ 1] 3479 	ld xl,a 
      009051 A1 21 26         [ 4] 3480 	call print_int 
      009054 05 CD            [ 2] 3481 	ldw x,(ADR,sp)
      009056 8E               [ 2] 3482 	incw x 
      009057 71 20            [ 2] 3483 	ldw (ADR,sp),x 
      009059 C6 CD            [ 1] 3484 	dec (CNT,sp)
      00905B 8E B5            [ 1] 3485 	jrne row_loop
      001117                       3486 	_drop VSIZE  		
      00905D 20 C1            [ 2]    1     addw sp,#VSIZE 
      00905F 1E 03 A6 04      [ 1] 3487 	mov tab_width,#4
      009063 A6 0D            [ 1] 3488 	ld a,#CR 
      009063 5B 05 81         [ 4] 3489 	call putc 
      009066 81               [ 4] 3490 	ret 
                                   3491 
                                   3492 ;--------------------------------------------
                                   3493 ; BASIC: HEX 
                                   3494 ; select hexadecimal base for integer print
                                   3495 ;---------------------------------------------
      001123                       3496 hex_base:
      009066 52 05 CD 90      [ 1] 3497 	mov base,#16 
      00906A 17               [ 4] 3498 	ret 
                                   3499 
                                   3500 ;--------------------------------------------
                                   3501 ; BASIC: DEC 
                                   3502 ; select decimal base for integer print
                                   3503 ;---------------------------------------------
      001128                       3504 dec_base:
      00906B A1 02 2B 38      [ 1] 3505 	mov base,#10
      00906F 1F               [ 4] 3506 	ret 
                                   3507 
                                   3508 ;------------------------
                                   3509 ; BASIC: SIZE 
                                   3510 ; return free size in text area
                                   3511 ; output:
                                   3512 ;   A 		TK_INTGR
                                   3513 ;   X 	    size integer
                                   3514 ;--------------------------
      00112D                       3515 size:
      009070 03 CD 88         [ 2] 3516 	ldw x,#tib 
      009073 90 A1 02 2B      [ 2] 3517 	subw x,txtend 
      009077 2B 6B            [ 1] 3518 	ld a,#TK_INTGR
      009079 05               [ 4] 3519 	ret 
                                   3520 
                                   3521 
                                   3522 ;------------------------
                                   3523 ; BASIC: UBOUND  
                                   3524 ; return array variable size 
                                   3525 ; output:
                                   3526 ;   A 		TK_INTGR
                                   3527 ;   X 	    array size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3528 ;--------------------------
      001137                       3529 ubound:
      00907A A4 30 A1         [ 2] 3530 	ldw x,#tib
      00907D 10 27 07 55      [ 2] 3531 	subw x,txtend 
      009081 00 03 00 02      [ 2] 3532 	ldw y,basicptr 
      009085 20 1C 00 20      [ 2] 3533 	cpw y,txtend 
      009087 25 0A            [ 1] 3534 	jrult 1$
      009087 CD 90 17         [ 1] 3535 	push count 
      00908A A1 04            [ 1] 3536 	push #0 
      00908C 27 03 CC         [ 2] 3537 	subw x,(1,sp)
      001150                       3538 	_drop 2 
      00908F 87 DD            [ 2]    1     addw sp,#2 
      009091 1F               [ 2] 3539 1$:	srlw x 
      009092 01 7B 05         [ 2] 3540 	ldw array_size,x
      009095 A1 10            [ 1] 3541 	ld a,#TK_INTGR
      009097 26               [ 4] 3542 	ret 
                                   3543 
                                   3544 ;-----------------------------
                                   3545 ; BASIC: LET var=expr 
                                   3546 ; variable assignement 
                                   3547 ; output:
                                   3548 ;   A 		TK_NONE 
                                   3549 ;-----------------------------
      001159                       3550 let:
      009098 05 CD 8E         [ 4] 3551 	call next_token 
      00909B 1B 20            [ 1] 3552 	cp a,#TK_VAR 
      00909D D1 CD            [ 1] 3553 	jreq let_var
      00909F 8E 23            [ 1] 3554 	cp a,#TK_ARRAY 
      0090A1 20 CC            [ 1] 3555 	jreq  let_array
      0090A3 1E 03 A6         [ 2] 3556 	jp syntax_error
      001167                       3557 let_array:
      0090A6 04 0F 18         [ 4] 3558 	call get_array_element
      0090A7                       3559 let_var:
      0090A7 5B               [ 2] 3560 	pushw x  
      0090A8 05 81 10         [ 4] 3561 	call next_token 
      0090AA A1 32            [ 1] 3562 	cp a,#TK_EQUAL
      0090AA 52 05            [ 1] 3563 	jreq 1$
      0090AC CD 90 66         [ 2] 3564 	jp syntax_error
      001175                       3565 1$:	
      0090AF A1 02 2B         [ 4] 3566 	call relation   
      0090B2 4B 1F            [ 1] 3567 	cp a,#TK_INTGR 
      0090B4 03 CD            [ 1] 3568 	jreq 2$
      0090B6 88 90 A1         [ 2] 3569 	jp syntax_error
      00117F                       3570 2$:	
      0090B9 02 2B            [ 1] 3571 	ldw y,x 
      0090BB 3E               [ 2] 3572 	popw x   
      0090BC FF               [ 2] 3573 	ldw (x),y   
      0090BC 6B               [ 4] 3574 	ret 
                                   3575 
                                   3576 ;----------------------------
                                   3577 ; BASIC: LIST [[start][,end]]
                                   3578 ; list program lines 
                                   3579 ; form start to end 
                                   3580 ; if empty argument list then 
                                   3581 ; list all.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3582 ;----------------------------
                           000001  3583 	FIRST=1
                           000003  3584 	LAST=3 
                           000005  3585 	LN_PTR=5
                           000006  3586 	VSIZE=6 
      001184                       3587 list:
      001184                       3588 	_vars VSIZE
      0090BD 05 A4            [ 2]    1     sub sp,#VSIZE 
      0090BF 30 A1 30         [ 2] 3589 	ldw x,txtbgn 
      0090C2 27 07 55         [ 2] 3590 	cpw x,txtend 
      0090C5 00 03            [ 1] 3591 	jrmi 1$
      0090C7 00 02            [ 1] 3592 	ld a,#ERR_NO_PROG 
      0090C9 20 2F 5F         [ 2] 3593 	jp tb_error ; nothing to list 
      0090CB 1F 05            [ 2] 3594 1$:	ldw (LN_PTR,sp),x 
      0090CB CD               [ 2] 3595 	ldw x,(x) 
      0090CC 90 66            [ 2] 3596 	ldw (FIRST,sp),x ; list from first line 
      0090CE A1 04 27         [ 2] 3597 	ldw x,#MAX_LINENO ; biggest line number 
      0090D1 03 CC            [ 2] 3598 	ldw (LAST,sp),x 
      0090D3 87 DD 1F         [ 4] 3599 	call arg_list
      0090D6 01               [ 1] 3600 	tnz a
      0090D7 CD 8E            [ 1] 3601 	jreq list_start 
      0090D9 23 26            [ 1] 3602 	cp a,#2 
      0090DB 06 35            [ 1] 3603 	jreq 4$
      0090DD 02 00            [ 1] 3604 	cp a,#1 
      0090DF 0E 20            [ 1] 3605 	jreq first_line 
      0090E1 0C 07 5D         [ 2] 3606 	jp syntax_error 
      0090E2 85               [ 2] 3607 4$:	popw x 
      0090E2 2C 06            [ 2] 3608 	ldw (LAST+2,sp),x 
      0011B1                       3609 first_line:
      0090E4 35               [ 2] 3610 	popw x
      0090E5 04 00            [ 2] 3611 	ldw (FIRST,sp),x 
      0011B4                       3612 lines_skip:
      0090E7 0E 20 04         [ 2] 3613 	ldw x,txtbgn
      0090EA 1F 05            [ 2] 3614 2$:	ldw (LN_PTR,sp),x 
      0090EA 35 01 00         [ 2] 3615 	cpw x,txtend 
      0090ED 0E 3C            [ 1] 3616 	jrpl list_exit 
      0090EE FE               [ 2] 3617 	ldw x,(x) ;line# 
      0090EE 5F C6            [ 2] 3618 	cpw x,(FIRST,sp)
      0090F0 00 0E            [ 1] 3619 	jrpl list_start 
      0090F2 14 05            [ 2] 3620 	ldw x,(LN_PTR,sp) 
      0090F4 4D 27            [ 1] 3621 	ld a,(2,x)
      0090F6 05 5C 0D         [ 1] 3622 	ld acc8,a 
      0090F8 72 5F 00 0C      [ 1] 3623 	clr acc16 
      0090F8 20 02 1E 03      [ 2] 3624 	addw x,acc16
      0090FC 20 E3            [ 2] 3625 	jra 2$ 
                                   3626 ; print loop
      0011D4                       3627 list_start:
      0090FC A6 04            [ 2] 3628 	ldw x,(LN_PTR,sp)
      0090FE E6 02            [ 1] 3629 3$:	ld a,(2,x) 
      0090FE 5B 05 81         [ 4] 3630 	call prt_basic_line
      009101 1E 05            [ 2] 3631 	ldw x,(LN_PTR,sp)
      009101 52 04            [ 1] 3632 	ld a,(2,x)
      009103 C6 00 0B         [ 1] 3633 	ld acc8,a 
      009106 6B 02 C6 00      [ 1] 3634 	clr acc16 
      00910A 27 6B 01 35      [ 2] 3635 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00910E 10 00 0B         [ 2] 3636 	cpw x,txtend 
      009111 AE 91            [ 1] 3637 	jrpl list_exit
      009113 4D CD            [ 2] 3638 	ldw (LN_PTR,sp),x
      009115 82               [ 2] 3639 	ldw x,(x)
      009116 57 96            [ 2] 3640 	cpw x,(LAST,sp)  
      009118 1C 00            [ 1] 3641 	jrsgt list_exit 
      00911A 05 1F            [ 2] 3642 	ldw x,(LN_PTR,sp)
      00911C 03 DC            [ 2] 3643 	jra 3$
      00911D                       3644 list_exit:
      0011FA                       3645 	_drop VSIZE 
      00911D A3 18            [ 2]    1     addw sp,#VSIZE 
      00911F 00               [ 4] 3646 	ret
                                   3647 
                                   3648 ;-------------------------
                                   3649 ; print counted string 
                                   3650 ; input:
                                   3651 ;   X 	address of string
                                   3652 ;--------------------------
      0011FD                       3653 prt_cmd_name:
      009120 24               [ 1] 3654 	ld a,(x)
      009121 18               [ 2] 3655 	incw x
      009122 A6 10            [ 1] 3656 	and a,#15  
      009124 90               [ 1] 3657 	push a 
      009125 AE 18            [ 1] 3658 1$: tnz (1,sp) 
      009127 00 72            [ 1] 3659 	jreq 9$
      009129 F2               [ 1] 3660 	ld a,(x)
      00912A 03 90 A3         [ 4] 3661 	call putc 
      00912D 00               [ 2] 3662 	incw x
      00912E 10 24            [ 1] 3663 	dec (1,sp)	 
      009130 02 90            [ 2] 3664 	jra 1$
      009132 9F               [ 1] 3665 9$: pop a 
      009133 81               [ 4] 3666 	ret	
                                   3667 
                                   3668 ;--------------------------
                                   3669 ; print TK_QSTR
                                   3670 ; converting control character
                                   3671 ; to backslash sequence
                                   3672 ; input:
                                   3673 ;   X        char *
                                   3674 ;-----------------------------
      001211                       3675 prt_quote:
      009133 CD 91            [ 1] 3676 	ld a,#'"
      009135 74 1F 03         [ 4] 3677 	call putc 
      009138 20               [ 1] 3678 1$:	ld a,(x)
      009139 E3 A6            [ 1] 3679 	jreq 9$
      00913B 0D               [ 2] 3680 	incw x 
      00913C CD 82            [ 1] 3681 	cp a,#SPACE 
      00913E 44 7B            [ 1] 3682 	jrult 3$
      009140 02 C7 00         [ 4] 3683 	call putc
      009143 0B 7B            [ 1] 3684 	cp a,#'\ 
      009145 01 C7            [ 1] 3685 	jrne 1$ 
      001225                       3686 2$:
      009147 00 27 5B         [ 4] 3687 	call putc 
      00914A 04 4F            [ 2] 3688 	jra 1$
      00914C 81               [ 1] 3689 3$: push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00914D 0A 63            [ 1] 3690 	ld a,#'\
      00914F 6F 6E 74         [ 4] 3691 	call putc 
      009152 65               [ 1] 3692 	pop a 
      009153 6E 74            [ 1] 3693 	sub a,#7
      009155 20 6F 66         [ 1] 3694 	ld acc8,a 
      009158 20 73 74 61      [ 1] 3695 	clr acc16
      00915C 63 6B 20 66      [ 2] 3696 	ldw y,#escaped 
      009160 72 6F 6D 20      [ 2] 3697 	addw y,acc16 
      009164 74 6F            [ 1] 3698 	ld a,(y)
      009166 70 20            [ 2] 3699 	jra 2$
      009168 74 6F            [ 1] 3700 9$: ld a,#'"
      00916A 20 62 6F         [ 4] 3701 	call putc 
      00916D 74               [ 2] 3702 	incw x 
      00916E 74               [ 4] 3703 	ret
                                   3704 
                                   3705 
                                   3706 ;--------------------------
                                   3707 ; decompile line from token list 
                                   3708 ; input:
                                   3709 ;   A       stop at this position 
                                   3710 ;   X 		pointer at line
                                   3711 ; output:
                                   3712 ;   none 
                                   3713 ;--------------------------	
                           000001  3714 	BASE_SAV=1
                           000002  3715 	WIDTH_SAV=2
                           000003  3716 	XSAVE=3
                           000005  3717 	LLEN=5
                           000005  3718 	VSIZE=5 
      00124D                       3719 prt_basic_line:
      00124D                       3720 	_vars VSIZE
      00916F 6F 6D            [ 2]    1     sub sp,#VSIZE 
      009171 3A 0A            [ 1] 3721 	ld (LLEN,sp),a  
      009173 00 00 0A         [ 1] 3722 	ld a,base
      009174 6B 01            [ 1] 3723 	ld (BASE_SAV,sp),a  
      009174 4D 26 01         [ 1] 3724 	ld a,tab_width 
      009177 81 02            [ 1] 3725 	ld (WIDTH_SAV,sp),a 
      009178 CF 00 19         [ 2] 3726 	ldw ptr16,x
      009178 89               [ 2] 3727 	ldw x,(x)
      009179 88 35 04 00      [ 1] 3728 	mov base,#10
      00917D 27 CD 89 29      [ 1] 3729 	mov tab_width,#5
      009181 A6 20 CD         [ 4] 3730 	call print_int ; print line number 
      009184 82 44            [ 1] 3731 	ld a,#SPACE 
      009186 CD 01 C4         [ 4] 3732 	call putc 
      009186 1E 02 F6 5F      [ 1] 3733 	clr tab_width
      00918A 97 CD 89         [ 2] 3734 	ldw x,#3
      00918D 29               [ 1] 3735 1$:	ld a,xl 
      00918E 1E 02            [ 1] 3736 	cp a,(LLEN,sp)
      009190 5C 1F            [ 1] 3737 	jrmi 20$
      009192 02 0A 01         [ 2] 3738 	jp 90$
      00127E                       3739 20$:	 
      009195 26 EF 5B 03      [ 4] 3740 	ld a,([ptr16],x)
      009199 35               [ 2] 3741 	incw x 
      00919A 04 00            [ 2] 3742 	ldw (XSAVE,sp),x 
      00919C 27 A6            [ 1] 3743 	cp a,#TK_CMD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00919E 0D CD            [ 1] 3744 	jrmi 4$
      0091A0 82 44            [ 1] 3745 	cp a,#TK_CFUNC 
      0091A2 81 2F            [ 1] 3746 	jrugt 4$
      0091A3                       3747 2$:	
      0091A3 35 10 00 0B      [ 5] 3748 	ldw x,([ptr16],x)
      0091A7 81 14 B5         [ 2] 3749 	cpw x,#remark 
      0091A8 26 14            [ 1] 3750 	jrne 3$
      0091A8 35 0A            [ 1] 3751 	ld a,#''
      0091AA 00 0B 81         [ 4] 3752 	call putc 
      0091AD 1E 03            [ 2] 3753 	ldw x,(XSAVE,sp)
      0091AD AE 16 E8         [ 2] 3754 	addw x,#2
      0091B0 72 B0 00 21      [ 2] 3755 	addw x,ptr16  
      0091B4 A6 04 81         [ 4] 3756 	call puts 
      0091B7 CC 13 94         [ 2] 3757 	jp 90$ 
      0012AA                       3758 3$:	
      0091B7 AE 16 E8         [ 4] 3759 	call cmd_name
      0091BA 72 B0 00         [ 4] 3760 	call prt_cmd_name
      0091BD 21 90            [ 1] 3761 	ld a,#SPACE 
      0091BF CE 00 05         [ 4] 3762 	call putc 
      0091C2 90 C3            [ 2] 3763 	ldw x,(XSAVE,sp)
      0091C4 00 21 25         [ 2] 3764 	addw x,#2
      0091C7 0A 3B            [ 2] 3765 	jra 1$
      0091C9 00 04            [ 1] 3766 4$: cp a,#TK_QSTR 
      0091CB 4B 00            [ 1] 3767 	jrne 5$
      0091CD 72 F0 01 5B      [ 2] 3768 	addw x,ptr16
      0091D1 02 54 CF         [ 4] 3769 	call prt_quote  
      0091D4 00 24 A6 04      [ 2] 3770 	subw x,ptr16  
      0091D8 81 A9            [ 2] 3771 	jra 1$
      0091D9 A1 03            [ 1] 3772 5$:	cp a,#TK_CHAR 
      0091D9 CD 88            [ 1] 3773 	jrne 51$
      0091DB 90 A1            [ 1] 3774 	ld a,#'\ 
      0091DD 05 27 0A         [ 4] 3775 	call putc 
      0091E0 A1 0A 27 03      [ 4] 3776 	ld a,([ptr16],x)
      0091E4 CC               [ 2] 3777 	incw x 
      0091E5 87 DD C4         [ 4] 3778 	call putc 
      0091E7 20 96            [ 2] 3779 	jra 1$ 
      0012E0                       3780 51$:	
      0091E7 CD 8F            [ 1] 3781 	cp a,#TK_VAR
      0091E9 98 1B            [ 1] 3782 	jrne 6$ 
      0091EA 72 DE 00 19      [ 5] 3783 	ldw x,([ptr16],x)
      0091EA 89 CD 88         [ 2] 3784 	subw x,#vars 
      0091ED 90               [ 1] 3785 	ld a,xl
      0091EE A1               [ 1] 3786 	srl a 
      0091EF 32 27            [ 1] 3787 	add a,#'A 
      0091F1 03 CC 87         [ 4] 3788 	call putc 
      0091F4 DD 20            [ 1] 3789 	ld a,#SPACE 
      0091F5 CD 01 C4         [ 4] 3790 	call putc 
      0091F5 CD 90            [ 2] 3791 	ldw x,(XSAVE,sp)
      0091F7 AA A1 04         [ 2] 3792 	addw x,#2 
      0091FA 27 03 CC         [ 2] 3793 	jp  1$ 
      0091FD 87 DD            [ 1] 3794 6$: cp a,#TK_ARRAY 
      0091FF 26 0A            [ 1] 3795 	jrne 7$
      0091FF 90 93            [ 1] 3796 	ld a,#'@ 
      009201 85 FF 81         [ 4] 3797 	call putc 
      009204 1E 03            [ 2] 3798 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009204 52 06 CE         [ 2] 3799 	jp 1$ 
      009207 00 1F            [ 1] 3800 7$: cp a,#TK_INTGR 
      009209 C3 00            [ 1] 3801 	jrne 8$
      00920B 21 2B 05 A6      [ 5] 3802 	ldw x,([ptr16],x)
      00920F 0D CC 87         [ 4] 3803 	call print_int
                                   3804 ;	ld a,#SPACE 
                                   3805 ;	call putc 
      009212 DF 1F            [ 2] 3806 	ldw x,(XSAVE,sp)
      009214 05 FE 1F         [ 2] 3807 	addw x,#2 
      009217 01 AE 7F         [ 2] 3808 	jp 1$
      00921A FF 1F            [ 1] 3809 8$: cp a,#TK_GT 
      00921C 03 CD            [ 1] 3810 	jrmi 9$
      00921E 8F 5A            [ 1] 3811 	cp a,#TK_NE 
      009220 4D 27            [ 1] 3812 	jrugt 9$
      009222 31 A1            [ 1] 3813 	sub a,#TK_GT  
      009224 02               [ 1] 3814 	sll a 
      009225 27 07            [ 1] 3815 	clrw y 
      009227 A1 01            [ 1] 3816 	ld yl,a 
      009229 27 06 CC 87      [ 2] 3817 	addw y,#relop_str 
      00922D DD 85            [ 2] 3818 	ldw y,(y)
      00922F 1F               [ 1] 3819 	ldw x,y 
      009230 05 01 D7         [ 4] 3820 	call puts 
      009231 1E 03            [ 2] 3821 	ldw x,(XSAVE,sp)
      009231 85 1F 01         [ 2] 3822 	jp 1$
      009234 A1 10            [ 1] 3823 9$: cp a,#TK_PLUS 
      009234 CE 00            [ 1] 3824 	jrne 10$
      009236 1F 1F            [ 1] 3825 	ld a,#'+
      009238 05 C3            [ 2] 3826 	jra 80$ 
      00923A 00 21            [ 1] 3827 10$: cp a,#TK_MINUS
      00923C 2A 3C            [ 1] 3828 	jrne 11$
      00923E FE 13            [ 1] 3829 	ld a,#'-
      009240 01 2A            [ 2] 3830 	jra 80$
      009242 11 1E            [ 1] 3831 11$: cp a,#TK_MULT 
      009244 05 E6            [ 1] 3832 	jrmi 12$
      009246 02 C7            [ 1] 3833 	cp a,#TK_MOD 
      009248 00 0E            [ 1] 3834 	jrugt 12$
      00924A 72 5F            [ 1] 3835 	sub a,#0x20
      00924C 00               [ 1] 3836 	clrw x 
      00924D 0D               [ 1] 3837 	ld xl,a 
      00924E 72 BB 00         [ 2] 3838 	addw x,#mul_char 
      009251 0D               [ 1] 3839 	ld a,(x)
      009252 20 E3            [ 2] 3840 	jra 80$ 
      009254 A1 0B            [ 1] 3841 12$: cp a,#TK_LPAREN 
      009254 1E 05            [ 1] 3842 	jrmi 13$
      009256 E6 02            [ 1] 3843 	cp a,#TK_SHARP 
      009258 CD 92            [ 1] 3844 	jrugt 13$
      00925A CD 1E            [ 1] 3845 	sub a,#TK_LPAREN
      00925C 05               [ 1] 3846 	clrw x 
      00925D E6               [ 1] 3847 	ld xl,a 
      00925E 02 C7 00         [ 2] 3848 	addw x,#single_char 
      009261 0E               [ 1] 3849 	ld a,(x)
      009262 72 5F            [ 2] 3850 	jra 80$
      009264 00 0D            [ 1] 3851 13$: cp a,#TK_CHAR 
      009266 72 BB            [ 1] 3852 	jrne 14$
      009268 00 0D            [ 1] 3853 	ld a,#'\
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00926A C3 00 21         [ 4] 3854 	call putc 
      00926D 2A 0B            [ 2] 3855 	ldw x,(XSAVE,sp)
      00926F 1F 05 FE 13      [ 4] 3856 	ld a,([ptr16],x)
      009273 03               [ 2] 3857 	incw x 
      009274 2C 04            [ 2] 3858 	ldw (XSAVE,sp),x 
      009276 1E 05 20         [ 4] 3859 	call putc 
      009279 DC 12 76         [ 2] 3860 	jp 1$ 
      00927A A6 3A            [ 1] 3861 14$: ld a,#':
      00927A 5B 06 81         [ 4] 3862 80$: call putc 
      00927D 1E 03            [ 2] 3863 	ldw x,(XSAVE,sp)
      00927D F6 5C A4         [ 2] 3864 	jp 1$ 
      001394                       3865 90$: 
      009280 0F 88            [ 1] 3866 	ld a,#CR 
      009282 0D 01 27         [ 4] 3867 	call putc
      009285 09 F6            [ 1] 3868 	ld a,(WIDTH_SAV,sp) 
      009287 CD 82 44         [ 1] 3869 	ld tab_width,a 
      00928A 5C 0A            [ 1] 3870 	ld a,(BASE_SAV,sp) 
      00928C 01 20 F3         [ 1] 3871 	ld base,a
      0013A3                       3872 	_drop VSIZE 
      00928F 84 81            [ 2]    1     addw sp,#VSIZE 
      009291 81               [ 4] 3873 	ret 	
      009291 A6 22 CD 82           3874 single_char: .byte '(',')',',','#'
      009295 44 F6 27              3875 mul_char: .byte '*','/','%'
      009298 2D 5C A1 20 25 0C CD  3876 relop_str: .word gt,equal,ge,lt,le,ne 
             82 44 A1 5C 26
      0092A4 F1 00                 3877 gt: .asciz ">"
      0092A5 3D 00                 3878 equal: .asciz "="
      0092A5 CD 82 44              3879 ge: .asciz ">="
      0092A8 20 EC                 3880 lt: .asciz "<"
      0092AA 88 A6 5C              3881 le: .asciz "<="
      0092AD CD 82 44              3882 ne:  .asciz "<>"
                                   3883 
                                   3884 
                                   3885 ;---------------------------------
                                   3886 ; BASIC: PRINT|? arg_list 
                                   3887 ; print values from argument list
                                   3888 ;----------------------------------
                           000001  3889 	COMMA=1
                           000001  3890 	VSIZE=1
      0013C8                       3891 print:
      0092B0 84 A0            [ 1] 3892 push #0 ; local variable COMMA 
      0013CA                       3893 reset_comma:
      0092B2 07 C7            [ 1] 3894 	clr (COMMA,sp)
      0013CC                       3895 prt_loop:
      0092B4 00 0E 72         [ 4] 3896 	call next_token
      0092B7 5F 00            [ 1] 3897 	cp a,#CMD_END 
      0092B9 0D 90            [ 1] 3898 	jrmi print_exit ; colon or end of line 
      0092BB AE 8B            [ 1] 3899 	cp a,#TK_QSTR
      0092BD 2D 72            [ 1] 3900 	jreq 1$
      0092BF B9 00            [ 1] 3901 	cp a,#TK_CHAR 
      0092C1 0D 90            [ 1] 3902 	jreq 2$ 
      0092C3 F6 20            [ 1] 3903 	cp a,#TK_CFUNC 
      0092C5 DF A6            [ 1] 3904 	jreq 3$
      0092C7 22 CD            [ 1] 3905 	cp a,#TK_COMMA 
      0092C9 82 44            [ 1] 3906 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0092CB 5C 81            [ 1] 3907 	cp a,#TK_SHARP 
      0092CD 27 1B            [ 1] 3908 	jreq 5$
      0092CD 52 05            [ 2] 3909 	jra 7$ 
      0013E9                       3910 1$:	; print string 
      0092CF 6B 05 C6         [ 4] 3911 	call puts
      0092D2 00 0B            [ 2] 3912 	jra reset_comma
      0013EE                       3913 2$:	; print character 
      0092D4 6B               [ 1] 3914 	ld a,xl 
      0092D5 01 C6 00         [ 4] 3915 	call putc 
      0092D8 27 6B            [ 2] 3916 	jra reset_comma 
      0013F4                       3917 3$: ; print character function value  	
      0092DA 02               [ 4] 3918 	call (x)
      0092DB CF               [ 1] 3919 	ld a,xl 
      0092DC 00 1A FE         [ 4] 3920 	call putc
      0092DF 35 0A            [ 2] 3921 	jra reset_comma 
      0013FB                       3922 4$: ; set comma state 
      0092E1 00 0B            [ 1] 3923 	ld a,#255 
      0092E3 35 05            [ 1] 3924 	ld (COMMA,sp),a  
      0092E5 00 27 CD         [ 2] 3925 	jp prt_loop   
      001402                       3926 5$: ; # character must be followed by an integer   
      0092E8 89 29 A6         [ 4] 3927 	call next_token
      0092EB 20 CD            [ 1] 3928 	cp a,#TK_INTGR 
      0092ED 82 44            [ 1] 3929 	jreq 6$
      0092EF 72 5F 00         [ 2] 3930 	jp syntax_error 
      00140C                       3931 6$: ; set tab width
      0092F2 27               [ 1] 3932 	ld a,xl 
      0092F3 AE 00            [ 1] 3933 	and a,#15 
      0092F5 03 9F 11         [ 1] 3934 	ld tab_width,a 
      0092F8 05 2B            [ 2] 3935 	jra reset_comma 
      001414                       3936 7$:	
      001414                       3937 	_unget_token
      0092FA 03 CC 94 14 01   [ 1]    1     mov in,in.saved
      0092FE CD 10 2A         [ 4] 3938 	call relation 
      0092FE 72 D6            [ 1] 3939 	cp a,#TK_INTGR
      009300 00 1A            [ 1] 3940 	jreq 8$
      009302 5C 1F 03         [ 2] 3941 	jp print_exit 
      009305 A1 06 2B         [ 4] 3942 8$: call print_int 
      009308 33 A1            [ 2] 3943 	jra reset_comma 
      001428                       3944 print_exit:
      00930A 08 22            [ 1] 3945 	tnz (COMMA,sp)
      00930C 2F 05            [ 1] 3946 	jrne 9$
      00930D A6 0D            [ 1] 3947 	ld a,#CR 
      00930D 72 DE 00         [ 4] 3948     call putc 
      001431                       3949 9$:	_drop VSIZE 
      009310 1A A3            [ 2]    1     addw sp,#VSIZE 
      009312 95               [ 4] 3950 	ret 
                                   3951 
      001434                       3952 print_type: 
                                   3953 
                                   3954 ;----------------------
                                   3955 ; 'save_context' and
                                   3956 ; 'rest_context' must be 
                                   3957 ; called at the same 
                                   3958 ; call stack depth 
                                   3959 ; i.e. SP must have the 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3960 ; save value at  
                                   3961 ; entry point of both 
                                   3962 ; routine. 
                                   3963 ;---------------------
                           000004  3964 	CTXT_SIZE=4 ; size of saved data 
                                   3965 ;--------------------
                                   3966 ; save current BASIC
                                   3967 ; interpreter context 
                                   3968 ; on stack 
                                   3969 ;--------------------
      001434                       3970 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001434                       3971 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001434                       3972 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001434                       3973 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001434                       3974 save_context:
      009313 35 26 14         [ 2] 3975 	ldw x,basicptr 
      009316 A6 27            [ 2] 3976 	ldw (BPTR,sp),x
      009318 CD 82 44         [ 1] 3977 	ld a,in 
      00931B 1E 03            [ 1] 3978 	ld (IN,sp),a
      00931D 1C 00 02         [ 1] 3979 	ld a,count 
      009320 72 BB            [ 1] 3980 	ld (CNT,sp),a  
      009322 00               [ 4] 3981 	ret
                                   3982 
                                   3983 ;-----------------------
                                   3984 ; restore previously saved 
                                   3985 ; BASIC interpreter context 
                                   3986 ; from stack 
                                   3987 ;-------------------------
      001444                       3988 rest_context:
      009323 1A CD            [ 2] 3989 	ldw x,(BPTR,sp)
      009325 82 57 CC         [ 2] 3990 	ldw basicptr,x 
      009328 94 14            [ 1] 3991 	ld a,(IN,sp)
      00932A C7 00 01         [ 1] 3992 	ld in,a
      00932A CD 8E            [ 1] 3993 	ld a,(CNT,sp)
      00932C C6 CD 92         [ 1] 3994 	ld count,a  
      00932F 7D               [ 4] 3995 	ret
                                   3996 
                                   3997 ;------------------------------------------
                                   3998 ; BASIC: INPUT [string]var[,[string]var]
                                   3999 ; input value in variables 
                                   4000 ; [string] optionally can be used as prompt 
                                   4001 ;-----------------------------------------
                           000001  4002 	CX_BPTR=1
                           000003  4003 	CX_IN=3
                           000004  4004 	CX_CNT=4
                           000005  4005 	SKIP=5
                           000006  4006 	VAR_ADDR=6 
                           000007  4007 	VSIZE=7
      001454                       4008 input_var:
      001454                       4009 	_vars VSIZE 
      009330 A6 20            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      001456                       4010 input_loop:
      009332 CD 82            [ 1] 4011 	clr (SKIP,sp)
      009334 44 1E 03         [ 4] 4012 	call next_token 
      009337 1C 00            [ 1] 4013 	cp a,#TK_QSTR 
      009339 02 20            [ 1] 4014 	jrne 1$ 
      00933B BA A1 02         [ 4] 4015 	call puts 
      00933E 26 0D            [ 1] 4016 	cpl (SKIP,sp)
      009340 72 BB 00         [ 4] 4017 	call next_token 
      009343 1A CD            [ 1] 4018 1$: cp a,#TK_VAR  
      009345 92 91            [ 1] 4019 	jreq 2$ 
      009347 72 B0 00         [ 2] 4020 	jp syntax_error
      00934A 1A 20            [ 2] 4021 2$:	ldw (VAR_ADDR,sp),x 
      00934C A9 A1            [ 1] 4022 	tnz (SKIP,sp)
      00934E 03 26            [ 1] 4023 	jrne 21$ 
      009350 0F A6 5C         [ 2] 4024 	ldw x,#pad 
      009353 CD 82 44         [ 4] 4025 	call puts   
      00147A                       4026 21$:
      009356 72 D6            [ 1] 4027 	ld a,#':
      009358 00 1A 5C         [ 4] 4028 	call putc 
      00935B CD 82 44         [ 4] 4029 	call save_context 
      00935E 20 96 00 03      [ 1] 4030 	clr count  
      009360 CD 09 D3         [ 4] 4031 	call readln 
      009360 A1 05 26         [ 2] 4032 	ldw x,#tib 
      009363 1B 72 DE 00      [ 1] 4033 	clr in 
      009367 1A 1D 00         [ 4] 4034 	call get_token
      00936A 29 9F            [ 1] 4035 	cp a,#TK_INTGR
      00936C 44 AB            [ 1] 4036 	jreq 3$ 
      00936E 41 CD 82         [ 4] 4037 	call rest_context 
      009371 44 A6 20         [ 2] 4038 	jp syntax_error
      009374 CD 82            [ 2] 4039 3$: ldw y,(VAR_ADDR,sp) 
      009376 44 1E            [ 2] 4040 	ldw (y),x 
      009378 03 1C 00         [ 4] 4041 	call rest_context
      00937B 02 CC 92         [ 4] 4042 	call next_token 
      00937E F6 A1            [ 1] 4043 	cp a,#TK_COMMA 
      009380 0A 26            [ 1] 4044 	jreq input_loop 
      009382 0A A6            [ 1] 4045 	cp a,#TK_COLON 
      009384 40 CD            [ 2] 4046     jrule input_exit 
      009386 82 44 1E         [ 2] 4047 	jp syntax_error 
      0014B2                       4048 input_exit:
      0014B2                       4049 	_drop VSIZE 
      009389 03 CC            [ 2]    1     addw sp,#VSIZE 
      00938B 92               [ 4] 4050 	ret 
                                   4051 
                                   4052 
                                   4053 ;---------------------
                                   4054 ; BASIC: REMARK | ' 
                                   4055 ; skip comment to end of line 
                                   4056 ;---------------------- 
      0014B5                       4057 remark:
      00938C F6 A1 04 26 0F   [ 1] 4058 	mov in,count 
      009391 72               [ 4] 4059  	ret 
                                   4060 
                                   4061 
                                   4062 ;---------------------
                                   4063 ; BASIC: WAIT addr,mask[,xor_mask] 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4064 ; read in loop 'addr'  
                                   4065 ; apply & 'mask' to value 
                                   4066 ; loop while result==0.  
                                   4067 ; if 'xor_mask' given 
                                   4068 ; apply ^ in second  
                                   4069 ; loop while result==0 
                                   4070 ;---------------------
                           000001  4071 	XMASK=1 
                           000002  4072 	MASK=2
                           000003  4073 	ADDR=3
                           000004  4074 	VSIZE=4
      0014BB                       4075 wait: 
      0014BB                       4076 	_vars VSIZE
      009392 DE 00            [ 2]    1     sub sp,#VSIZE 
      009394 1A CD            [ 1] 4077 	clr (XMASK,sp) 
      009396 89 29 1E         [ 4] 4078 	call arg_list 
      009399 03 1C            [ 1] 4079 	cp a,#2
      00939B 00 02            [ 1] 4080 	jruge 0$
      00939D CC 92 F6         [ 2] 4081 	jp syntax_error 
      0093A0 A1 31            [ 1] 4082 0$:	cp a,#3
      0093A2 2B 1A            [ 1] 4083 	jrult 1$
      0093A4 A1               [ 2] 4084 	popw x 
      0093A5 35               [ 1] 4085 	ld a,xl
      0093A6 22 16            [ 1] 4086 	ld (XMASK,sp),a 
      0093A8 A0               [ 2] 4087 1$: popw x ; mask 
      0093A9 31               [ 1] 4088 	ld a,xl 
      0093AA 48 90            [ 1] 4089 	ld (MASK,sp),a 
      0093AC 5F               [ 2] 4090 	popw x ; address 
      0093AD 90               [ 1] 4091 2$:	ld a,(x)
      0093AE 97 72            [ 1] 4092 	and a,(MASK,sp)
      0093B0 A9 94            [ 1] 4093 	xor a,(XMASK,sp)
      0093B2 2D 90            [ 1] 4094 	jreq 2$ 
      0014DD                       4095 	_drop VSIZE 
      0093B4 FE 93            [ 2]    1     addw sp,#VSIZE 
      0093B6 CD               [ 4] 4096 	ret 
                                   4097 
                                   4098 ;---------------------
                                   4099 ; BASIC: BSET addr,mask
                                   4100 ; set bits at 'addr' corresponding 
                                   4101 ; to those of 'mask' that are at 1.
                                   4102 ; arguments:
                                   4103 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4104 ;   mask        mask|addr
                                   4105 ; output:
                                   4106 ;	none 
                                   4107 ;--------------------------
      0014E0                       4108 bit_set:
      0093B7 82 57 1E         [ 4] 4109 	call arg_list 
      0093BA 03 CC            [ 1] 4110 	cp a,#2	 
      0093BC 92 F6            [ 1] 4111 	jreq 1$ 
      0093BE A1 10 26         [ 2] 4112 	jp syntax_error
      0014EA                       4113 1$: 
      0093C1 04               [ 2] 4114 	popw x ; mask 
      0093C2 A6               [ 1] 4115 	ld a,xl 
      0093C3 2B               [ 2] 4116 	popw x ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0093C4 20               [ 1] 4117 	or a,(x)
      0093C5 46               [ 1] 4118 	ld (x),a
      0093C6 A1               [ 4] 4119 	ret 
                                   4120 
                                   4121 ;---------------------
                                   4122 ; BASIC: BRES addr,mask
                                   4123 ; reset bits at 'addr' corresponding 
                                   4124 ; to those of 'mask' that are at 1.
                                   4125 ; arguments:
                                   4126 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4127 ;   mask	    ~mask&*addr  
                                   4128 ; output:
                                   4129 ;	none 
                                   4130 ;--------------------------
      0014F0                       4131 bit_reset:
      0093C7 11 26 04         [ 4] 4132 	call arg_list 
      0093CA A6 2D            [ 1] 4133 	cp a,#2  
      0093CC 20 3E            [ 1] 4134 	jreq 1$ 
      0093CE A1 20 2B         [ 2] 4135 	jp syntax_error
      0014FA                       4136 1$: 
      0093D1 0E               [ 2] 4137 	popw x ; mask 
      0093D2 A1               [ 1] 4138 	ld a,xl 
      0093D3 22               [ 1] 4139 	cpl a 
      0093D4 22               [ 2] 4140 	popw x ; addr  
      0093D5 0A               [ 1] 4141 	and a,(x)
      0093D6 A0               [ 1] 4142 	ld (x),a 
      0093D7 20               [ 4] 4143 	ret 
                                   4144 
                                   4145 ;---------------------
                                   4146 ; BASIC: BTOGL addr,mask
                                   4147 ; toggle bits at 'addr' corresponding 
                                   4148 ; to those of 'mask' that are at 1.
                                   4149 ; arguments:
                                   4150 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4151 ;   mask	    mask^*addr  
                                   4152 ; output:
                                   4153 ;	none 
                                   4154 ;--------------------------
      001501                       4155 bit_toggle:
      0093D8 5F 97 1C         [ 4] 4156 	call arg_list 
      0093DB 94 2A            [ 1] 4157 	cp a,#2 
      0093DD F6 20            [ 1] 4158 	jreq 1$ 
      0093DF 2C A1 0B         [ 2] 4159 	jp syntax_error
      0093E2 2B               [ 2] 4160 1$: popw x ; mask 
      0093E3 0E               [ 1] 4161 	ld a,xl 
      0093E4 A1               [ 2] 4162 	popw x ; addr  
      0093E5 0E               [ 1] 4163 	xor a,(x)
      0093E6 22               [ 1] 4164 	ld (x),a 
      0093E7 0A               [ 4] 4165 	ret 
                                   4166 
                                   4167 
                                   4168 ;---------------------
                                   4169 ; BASIC: BTEST(addr,bit)
                                   4170 ; return bit value at 'addr' 
                                   4171 ; bit is in range {0..7}.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4172 ; arguments:
                                   4173 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4174 ;   bit 	    bit position {0..7}  
                                   4175 ; output:
                                   4176 ;	none 
                                   4177 ;--------------------------
      001511                       4178 bit_test:
      0093E8 A0 0B 5F         [ 4] 4179 	call func_args 
      0093EB 97 1C            [ 1] 4180 	cp a,#2
      0093ED 94 26            [ 1] 4181 	jreq 0$
      0093EF F6 20 1A         [ 2] 4182 	jp syntax_error
      00151B                       4183 0$:	
      0093F2 A1               [ 2] 4184 	popw x 
      0093F3 03               [ 1] 4185 	ld a,xl 
      0093F4 26 14            [ 1] 4186 	and a,#7
      0093F6 A6               [ 1] 4187 	push a   
      0093F7 5C CD            [ 1] 4188 	ld a,#1 
      0093F9 82 44            [ 1] 4189 1$: tnz (1,sp)
      0093FB 1E 03            [ 1] 4190 	jreq 2$
      0093FD 72               [ 1] 4191 	sll a 
      0093FE D6 00            [ 1] 4192 	dec (1,sp)
      009400 1A 5C            [ 2] 4193 	jra 1$
      00152B                       4194 2$: _drop 1 
      009402 1F 03            [ 2]    1     addw sp,#1 
      009404 CD               [ 2] 4195 	popw x 
      009405 82               [ 1] 4196 	and a,(x)
      009406 44 CC            [ 1] 4197 	jreq 3$
      009408 92 F6            [ 1] 4198 	ld a,#1 
      00940A A6               [ 1] 4199 3$:	clrw x 
      00940B 3A               [ 1] 4200 	ld xl,a 
      00940C CD 82            [ 1] 4201 	ld a,#TK_INTGR
      00940E 44               [ 4] 4202 	ret
                                   4203 
                                   4204 
                                   4205 ;--------------------
                                   4206 ; BASIC: POKE addr,byte
                                   4207 ; put a byte at addr 
                                   4208 ;--------------------
      001538                       4209 poke:
      00940F 1E 03 CC         [ 4] 4210 	call arg_list 
      009412 92 F6            [ 1] 4211 	cp a,#2
      009414 27 03            [ 1] 4212 	jreq 1$
      009414 A6 0D CD         [ 2] 4213 	jp syntax_error
      001542                       4214 1$:	
      009417 82               [ 2] 4215 	popw x  
      009418 44               [ 1] 4216     ld a,xl 
      009419 7B               [ 2] 4217 	popw x 
      00941A 02               [ 1] 4218 	ld (x),a 
      00941B C7               [ 4] 4219 	ret 
                                   4220 
                                   4221 ;-----------------------
                                   4222 ; BASIC: PEEK(addr)
                                   4223 ; get the byte at addr 
                                   4224 ; input:
                                   4225 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4226 ; output:
                                   4227 ;	X 		value 
                                   4228 ;-----------------------
      001547                       4229 peek:
      00941C 00 27 7B         [ 4] 4230 	call func_args
      00941F 01 C7            [ 1] 4231 	cp a,#1
      009421 00 0B            [ 1] 4232 	jreq 1$
      009423 5B 05 81         [ 2] 4233 	jp syntax_error
      009426 28               [ 2] 4234 1$:	popw x 
      009427 29               [ 1] 4235 	ld a,(x)
      009428 2C               [ 1] 4236 	clrw x 
      009429 23               [ 1] 4237 	ld xl,a 
      00942A 2A 2F            [ 1] 4238 	ld a,#TK_INTGR
      00942C 25               [ 4] 4239 	ret 
                                   4240 
                                   4241 ;----------------------------
                                   4242 ; BASIC: XPEEK(page,addr)
                                   4243 ; read extended memory byte
                                   4244 ; page in range {0,1,2}
                                   4245 ;----------------------------
      001558                       4246 xpeek:
      00942D 94 39 94         [ 4] 4247 	call func_args 
      009430 3B 94            [ 1] 4248 	cp a,#2 
      009432 3D 94            [ 1] 4249 	jreq 1$
      009434 40 94 42         [ 2] 4250 	jp syntax_error
      001562                       4251 1$: 
      009437 94               [ 2] 4252 	popw x  
      009438 45 3E 00         [ 2] 4253 	ldw farptr+1,x 
      00943B 3D               [ 2] 4254 	popw x 
      00943C 00               [ 1] 4255 	ld a,xl 
      00943D 3E 3D 00         [ 1] 4256 	ld farptr,a 
      009440 3C               [ 1] 4257 	clrw x
      009441 00 3C 3D 00      [ 5] 4258 	ldf a,[farptr]
      009445 3C               [ 1] 4259 	ld xl,a 
      009446 3E 00            [ 1] 4260 	ld a,#TK_INTGR 
      009448 81               [ 4] 4261 	ret 
                                   4262 
                                   4263 ;---------------------------
                                   4264 ; BASIC IF expr : instructions
                                   4265 ; evaluate expr and if true 
                                   4266 ; execute instructions on same line. 
                                   4267 ;----------------------------
      001574                       4268 if: 
      009448 4B 00 2A         [ 4] 4269 	call relation 
      00944A A1 04            [ 1] 4270 	cp a,#TK_INTGR
      00944A 0F 01            [ 1] 4271 	jreq 1$ 
      00944C CC 07 5D         [ 2] 4272 	jp syntax_error
      00944C CD               [ 1] 4273 1$:	clr a 
      00944D 88               [ 2] 4274 	tnzw x 
      00944E 90 A1            [ 1] 4275 	jrne 9$  
                                   4276 ;skip to next line
      009450 02 2B 55 A1 02   [ 1] 4277 	mov in,count
      009455 27               [ 4] 4278 9$:	ret 
                                   4279 
                                   4280 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4281 ; BASIC: FOR var=expr 
                                   4282 ; set variable to expression 
                                   4283 ; leave variable address 
                                   4284 ; on stack and set
                                   4285 ; FLOOP bit in 'flags'
                                   4286 ;-----------------
                           000001  4287 	RETL1=1 ; return address  
                           000003  4288 	FSTEP=3  ; variable increment
                           000005  4289 	LIMIT=5 ; loop limit 
                           000007  4290 	CVAR=7   ; control variable 
                           000009  4291 	INW=9   ;  in.w saved
                           00000B  4292 	BPTR=11 ; baseptr saved
                           00000A  4293 	VSIZE=10  
      001588                       4294 for: ; { -- var_addr }
      009456 12               [ 2] 4295 	popw x ; call return address 
      001589                       4296 	_vars VSIZE 
      009457 A1 03            [ 2]    1     sub sp,#VSIZE 
      009459 27               [ 2] 4297 	pushw x  ; RETL1 
      00945A 13 A1            [ 1] 4298 	ld a,#TK_VAR 
      00945C 08 27 15         [ 4] 4299 	call expect
      00945F A1 0D            [ 2] 4300 	ldw (CVAR,sp),x  ; control variable 
      009461 27 18 A1         [ 4] 4301 	call let_var 
      009464 0E 27 1B 20      [ 1] 4302 	bset flags,#FLOOP 
                                   4303 ; open space on stack for loop data 
      009468 2B               [ 1] 4304 	clrw x 
      009469 1F 0B            [ 2] 4305 	ldw (BPTR,sp),x 
      009469 CD 82            [ 2] 4306 	ldw (INW,sp),x 
      00946B 57 20 DC         [ 4] 4307 	call next_token 
      00946E A1 06            [ 1] 4308 	cp a,#TK_CMD 
      00946E 9F CD            [ 1] 4309 	jreq 1$
      009470 82 44 20         [ 2] 4310 	jp syntax_error
      0015A9                       4311 1$:  
      009473 D6 15 B1         [ 2] 4312 	cpw x,#to 
      009474 27 03            [ 1] 4313 	jreq to
      009474 FD 9F CD         [ 2] 4314 	jp syntax_error 
                                   4315 
                                   4316 ;-----------------------------------
                                   4317 ; BASIC: TO expr 
                                   4318 ; second part of FOR loop initilization
                                   4319 ; leave limit on stack and set 
                                   4320 ; FTO bit in 'flags'
                                   4321 ;-----------------------------------
      0015B1                       4322 to: ; { var_addr -- var_addr limit step }
      009477 82 44 20 CF 03   [ 2] 4323 	btjt flags,#FLOOP,1$
      00947B CC 07 5D         [ 2] 4324 	jp syntax_error
      00947B A6 FF 6B         [ 4] 4325 1$: call relation  
      00947E 01 CC            [ 1] 4326 	cp a,#TK_INTGR 
      009480 94 4C            [ 1] 4327 	jreq 2$ 
      009482 CC 07 5D         [ 2] 4328 	jp syntax_error
      009482 CD 88            [ 2] 4329 2$: ldw (LIMIT,sp),x
                                   4330 ;	ldw x,in.w 
      009484 90 A1 04         [ 4] 4331 	call next_token
      009487 27 03            [ 1] 4332 	cp a,#TK_NONE  
      009489 CC 87            [ 1] 4333 	jreq 4$ 
      00948B DD 06            [ 1] 4334 	cp a,#TK_CMD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00948C 26 05            [ 1] 4335 	jrne 3$
      00948C 9F A4 0F         [ 2] 4336 	cpw x,#step 
      00948F C7 00            [ 1] 4337 	jreq step
      0015D5                       4338 3$:	
      0015D5                       4339 	_unget_token   	 
      009491 27 20 B6 00 01   [ 1]    1     mov in,in.saved
      009494                       4340 4$:	
      009494 55 00 03         [ 2] 4341 	ldw x,#1   ; default step  
      009497 00 02            [ 2] 4342 	ldw (FSTEP,sp),x 
      009499 CD 90            [ 2] 4343 	jra store_loop_addr 
                                   4344 
                                   4345 
                                   4346 ;----------------------------------
                                   4347 ; BASIC: STEP expr 
                                   4348 ; optional third par of FOR loop
                                   4349 ; initialization. 	
                                   4350 ;------------------------------------
      0015E1                       4351 step: ; {var limit -- var limit step}
      00949B AA A1 04 27 03   [ 2] 4352 	btjt flags,#FLOOP,1$
      0094A0 CC 94 A8         [ 2] 4353 	jp syntax_error
      0094A3 CD 89 29         [ 4] 4354 1$: call relation
      0094A6 20 A2            [ 1] 4355 	cp a,#TK_INTGR
      0094A8 27 03            [ 1] 4356 	jreq 2$
      0094A8 0D 01 26         [ 2] 4357 	jp syntax_error
      0094AB 05 A6            [ 2] 4358 2$:	ldw (FSTEP,sp),x ; step
                                   4359 ; leave loop back entry point on cstack 
                                   4360 ; cstack is 1 call deep from interpreter
      0015F5                       4361 store_loop_addr:
      0094AD 0D CD 82         [ 2] 4362 	ldw x,basicptr  
      0094B0 44 5B            [ 2] 4363 	ldw (BPTR,sp),x 
      0094B2 01 81 00         [ 2] 4364 	ldw x,in.w 
      0094B4 1F 09            [ 2] 4365 	ldw (INW,sp),x   
      0094B4 72 15 00 25      [ 1] 4366 	bres flags,#FLOOP 
      0094B4 CE 00 05 1F      [ 1] 4367 	inc loop_depth  
      0094B8 03               [ 4] 4368 	ret 
                                   4369 
                                   4370 ;--------------------------------
                                   4371 ; BASIC: NEXT var 
                                   4372 ; FOR loop control 
                                   4373 ; increment variable with step 
                                   4374 ; and compare with limit 
                                   4375 ; loop if threshold not crossed.
                                   4376 ; else stack. 
                                   4377 ; and decrement 'loop_depth' 
                                   4378 ;--------------------------------
      001608                       4379 next: ; {var limit step retl1 -- [var limit step ] }
      0094B9 C6 00 02 6B      [ 1] 4380 	tnz loop_depth 
      0094BD 05 C6            [ 1] 4381 	jrne 1$ 
      0094BF 00 04 6B         [ 2] 4382 	jp syntax_error 
      001611                       4383 1$: 
      0094C2 06 81            [ 1] 4384 	ld a,#TK_VAR 
      0094C4 CD 0E CD         [ 4] 4385 	call expect
                                   4386 ; check for good variable after NEXT 	 
      0094C4 1E 03            [ 2] 4387 	cpw x,(CVAR,sp)
      0094C6 CF 00            [ 1] 4388 	jreq 2$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0094C8 05 7B 05         [ 2] 4389 	jp syntax_error ; not the good one 
      00161D                       4390 2$: ; increment variable 
      0094CB C7               [ 2] 4391 	ldw x,(x)  ; get var value 
      0094CC 00 02 7B         [ 2] 4392 	addw x,(FSTEP,sp) ; var+step 
      0094CF 06 C7            [ 2] 4393 	ldw y,(CVAR,sp)
      0094D1 00 04            [ 2] 4394 	ldw (y),x ; save var new value 
                                   4395 ; check sign of STEP  
      0094D3 81 80            [ 1] 4396 	ld a,#0x80
      0094D4 15 03            [ 1] 4397 	bcp a,(FSTEP,sp)
      0094D4 52 07            [ 1] 4398 	jrpl 4$
                                   4399 ;negative step 
      0094D6 13 05            [ 2] 4400 	cpw x,(LIMIT,sp)
      0094D6 0F 05            [ 1] 4401 	jrslt loop_done
      0094D8 CD 88            [ 2] 4402 	jra loop_back 
      001631                       4403 4$: ; positive step
      0094DA 90 A1            [ 2] 4404 	cpw x,(LIMIT,sp)
      0094DC 02 26            [ 1] 4405 	jrsgt loop_done
      001635                       4406 loop_back:
      0094DE 08 CD            [ 2] 4407 	ldw x,(BPTR,sp)
      0094E0 82 57 03         [ 2] 4408 	ldw basicptr,x 
      0094E3 05 CD 88 90 A1   [ 2] 4409 	btjf flags,#FRUN,1$ 
      0094E8 05 27            [ 1] 4410 	ld a,(2,x)
      0094EA 03 CC 87         [ 1] 4411 	ld count,a
      0094ED DD 1F            [ 2] 4412 1$:	ldw x,(INW,sp)
      0094EF 06 0D 05         [ 2] 4413 	ldw in.w,x 
      0094F2 26               [ 4] 4414 	ret 
      00164A                       4415 loop_done:
                                   4416 	; remove loop data from stack  
      0094F3 06               [ 2] 4417 	popw x
      00164B                       4418 	_drop VSIZE 
      0094F4 AE 17            [ 2]    1     addw sp,#VSIZE 
      0094F6 38 CD 82 57      [ 1] 4419 	dec loop_depth 
                                   4420 ;	pushw x 
                                   4421 ;	ret 
      0094FA FC               [ 2] 4422 	jp (x)
                                   4423 
                                   4424 ;----------------------------
                                   4425 ; called by goto/gosub
                                   4426 ; to get target line number 
                                   4427 ;---------------------------
      001652                       4428 get_target_line:
      0094FA A6 3A CD         [ 4] 4429 	call relation 
      0094FD 82 44            [ 1] 4430 	cp a,#TK_INTGR
      0094FF CD 94            [ 1] 4431 	jreq 1$
      009501 B4 72 5F         [ 2] 4432 	jp syntax_error
      009504 00 04 CD         [ 4] 4433 1$:	call search_lineno  
      009507 8A               [ 2] 4434 	tnzw x 
      009508 53 AE            [ 1] 4435 	jrne 2$ 
      00950A 16 E8            [ 1] 4436 	ld a,#ERR_NO_LINE 
      00950C 72 5F 00         [ 2] 4437 	jp tb_error 
      00950F 02               [ 4] 4438 2$:	ret 
                                   4439 
                                   4440 ;------------------------
                                   4441 ; BASIC: GOTO line# 
                                   4442 ; jump to line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4443 ; here cstack is 2 call deep from interpreter 
                                   4444 ;------------------------
      001668                       4445 goto:
      009510 CD 8B D2 A1 04   [ 2] 4446 	btjt flags,#FRUN,0$ 
      009515 27 06            [ 1] 4447 	ld a,#ERR_RUN_ONLY
      009517 CD 94 C4         [ 2] 4448 	jp tb_error 
      00951A CC               [ 4] 4449 	ret 
      00951B 87 DD 16         [ 4] 4450 0$:	call get_target_line
      001676                       4451 jp_to_target:
      00951E 06 90 FF         [ 2] 4452 	ldw basicptr,x 
      009521 CD 94            [ 1] 4453 	ld a,(2,x)
      009523 C4 CD 88         [ 1] 4454 	ld count,a 
      009526 90 A1 0D 27      [ 1] 4455 	mov in,#3 
      00952A AB               [ 4] 4456 	ret 
                                   4457 
                                   4458 
                                   4459 ;--------------------
                                   4460 ; BASIC: GOSUB line#
                                   4461 ; basic subroutine call
                                   4462 ; actual line# and basicptr 
                                   4463 ; are saved on cstack
                                   4464 ; here cstack is 2 call deep from interpreter 
                                   4465 ;--------------------
                           000003  4466 	RET_ADDR=3
                           000005  4467 	RET_INW=5
                           000004  4468 	VSIZE=4  
      001683                       4469 gosub:
      00952B A1 01 23 03 CC   [ 2] 4470 	btjt flags,#FRUN,0$ 
      009530 87 DD            [ 1] 4471 	ld a,#ERR_RUN_ONLY
      009532 CC 07 5F         [ 2] 4472 	jp tb_error 
      009532 5B               [ 4] 4473 	ret 
      009533 07               [ 2] 4474 0$:	popw x 
      00168F                       4475 	_vars VSIZE  
      009534 81 04            [ 2]    1     sub sp,#VSIZE 
      009535 89               [ 2] 4476 	pushw x 
      009535 55 00 04         [ 2] 4477 	ldw x,basicptr
      009538 00 02            [ 2] 4478 	ldw (RET_ADDR,sp),x 
      00953A 81 16 52         [ 4] 4479 	call get_target_line  
      00953B 89               [ 2] 4480 	pushw x 
      00953B 52 04 0F         [ 2] 4481 	ldw x,in.w 
      00953E 01 CD            [ 2] 4482 	ldw (RET_INW+2,sp),x
      009540 8F               [ 2] 4483 	popw x 
      009541 5A A1            [ 2] 4484 	jra jp_to_target
                                   4485 
                                   4486 ;------------------------
                                   4487 ; BASIC: RETURN 
                                   4488 ; exit from a subroutine 
                                   4489 ; 
                                   4490 ;------------------------
      0016A3                       4491 return:
      009543 02 24 03 CC 87   [ 2] 4492 	btjt flags,#FRUN,0$ 
      009548 DD A1            [ 1] 4493 	ld a,#ERR_RUN_ONLY
      00954A 03 25 04         [ 2] 4494 	jp tb_error 
      0016AD                       4495 0$:	
      00954D 85 9F            [ 2] 4496 	ldw x,(RET_ADDR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00954F 6B 01 85         [ 2] 4497 	ldw basicptr,x
      009552 9F 6B            [ 1] 4498 	ld a,(2,x)
      009554 02 85 F6         [ 1] 4499 	ld count,a  
      009557 14 02            [ 2] 4500 	ldw x,(RET_INW,sp)
      009559 18 01 27         [ 2] 4501 	ldw in.w,x 
      00955C F9               [ 2] 4502 	popw x 
      0016BD                       4503 	_drop VSIZE 
      00955D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00955F 81               [ 2] 4504 	pushw x
      009560 81               [ 4] 4505 	ret  
                                   4506 
                                   4507 
                                   4508 ;----------------------------------
                                   4509 ; BASIC: RUN
                                   4510 ; run BASIC program in RAM
                                   4511 ;----------------------------------- 
      0016C1                       4512 run: 
      009560 CD 8F 5A A1 02   [ 2] 4513 	btjf flags,#FRUN,0$  
      009565 27               [ 1] 4514 	clr a 
      009566 03               [ 4] 4515 	ret
      0016C8                       4516 0$: 
      009567 CC 87 DD 25 12   [ 2] 4517 	btjf flags,#FBREAK,1$
      00956A                       4518 	_drop 2 
      00956A 85 9F            [ 2]    1     addw sp,#2 
      00956C 85 FA F7         [ 4] 4519 	call rest_context
      0016D2                       4520 	_drop CTXT_SIZE 
      00956F 81 04            [ 2]    1     addw sp,#CTXT_SIZE 
      009570 72 19 00 25      [ 1] 4521 	bres flags,#FBREAK 
      009570 CD 8F 5A A1      [ 1] 4522 	bset flags,#FRUN 
      009574 02 27 03         [ 2] 4523 	jp interpreter 
      009577 CC 87 DD         [ 2] 4524 1$:	ldw x,txtbgn
      00957A C3 00 20         [ 2] 4525 	cpw x,txtend 
      00957A 85 9F            [ 1] 4526 	jrmi run_it 
      00957C 43 85            [ 1] 4527 	ld a,#ERR_NO_PROG
      00957E F4 F7 81         [ 2] 4528 	jp tb_error
                                   4529 
      009581                       4530 run_it:	 
      009581 CD 8F 5A         [ 4] 4531     call ubound 
      0016EF                       4532 	_drop 2 ; drop return address 
      009584 A1 02            [ 2]    1     addw sp,#2 
                                   4533 ; clear data pointer 
      009586 27               [ 1] 4534 	clrw x 
      009587 03 CC 87         [ 2] 4535 	ldw data_ptr,x 
      00958A DD 85 9F 85      [ 1] 4536 	clr data_ofs 
      00958E F8 F7 81 09      [ 1] 4537 	clr data_len 
                                   4538 ; initialize BASIC pointer 
      009591 CE 00 1E         [ 2] 4539 	ldw x,txtbgn 
      009591 CD 8F 81         [ 2] 4540 	ldw basicptr,x 
      009594 A1 02            [ 1] 4541 	ld a,(2,x)
      009596 27 03 CC         [ 1] 4542 	ld count,a
      009599 87 DD 00 01      [ 1] 4543 	mov in,#3	
      00959B 72 10 00 25      [ 1] 4544 	bset flags,#FRUN 
      00959B 85 9F A4         [ 2] 4545 	jp interpreter 
                                   4546 
                                   4547 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4548 ;----------------------
                                   4549 ; BASIC: END
                                   4550 ; end running program
                                   4551 ;---------------------- 
      001713                       4552 cmd_end: 
                                   4553 ; clean stack 
      00959E 07 88 A6         [ 2] 4554 	ldw x,#STACK_EMPTY
      0095A1 01               [ 1] 4555 	ldw sp,x 
      0095A2 0D 01 27         [ 2] 4556 	jp warm_start
                                   4557 
                                   4558 
                                   4559 ;-----------------------
                                   4560 ; BASIC: TONE expr1,expr2
                                   4561 ; used TIMER2 channel 1
                                   4562 ; to produce a tone 
                                   4563 ; arguments:
                                   4564 ;    expr1   frequency 
                                   4565 ;    expr2   duration msec.
                                   4566 ;---------------------------
      00171A                       4567 tone:
      0095A5 05 48 0A         [ 4] 4568 	call arg_list 
      0095A8 01 20            [ 1] 4569 	cp a,#2 
      0095AA F7 5B            [ 1] 4570 	jreq 1$
      0095AC 01 85 F4         [ 2] 4571 	jp syntax_error 
      001724                       4572 1$: 
      0095AF 27               [ 2] 4573 	popw x ; duration
      0095B0 02 A6            [ 2] 4574 	popw y ; frequency 
      001727                       4575 beep:  
      0095B2 01               [ 2] 4576 	pushw x 
      0095B3 5F 97 A6         [ 2] 4577 	ldw x,#TIM2_CLK_FREQ
      0095B6 04               [ 2] 4578 	divw x,y 
                                   4579 ; round to nearest integer 
      0095B7 81 A3 7A 12      [ 2] 4580 	cpw y,#TIM2_CLK_FREQ/2
      0095B8 2B 01            [ 1] 4581 	jrmi 2$
      0095B8 CD               [ 2] 4582 	incw x 
      001733                       4583 2$:	 
      0095B9 8F               [ 1] 4584 	ld a,xh 
      0095BA 5A A1 02         [ 1] 4585 	ld TIM2_ARRH,a 
      0095BD 27               [ 1] 4586 	ld a,xl 
      0095BE 03 CC 87         [ 1] 4587 	ld TIM2_ARRL,a 
                                   4588 ; 50% duty cycle 
      0095C1 DD               [ 1] 4589 	ccf 
      0095C2 56               [ 2] 4590 	rrcw x 
      0095C2 85               [ 1] 4591 	ld a,xh 
      0095C3 9F 85 F7         [ 1] 4592 	ld TIM2_CCR1H,a 
      0095C6 81               [ 1] 4593 	ld a,xl
      0095C7 C7 53 10         [ 1] 4594 	ld TIM2_CCR1L,a
      0095C7 CD 8F 81 A1      [ 1] 4595 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0095CB 01 27 03 CC      [ 1] 4596 	bset TIM2_CR1,#TIM2_CR1_CEN
      0095CF 87 DD 85 F6      [ 1] 4597 	bset TIM2_EGR,#TIM2_EGR_UG
      0095D3 5F               [ 2] 4598 	popw x 
      0095D4 97 A6 04         [ 2] 4599 	ldw timer,x 
      0095D7 81 00 12         [ 2] 4600 3$: ldw x,timer 	
      0095D8 26 FB            [ 1] 4601 	jrne 3$ 
      0095D8 CD 8F 81 A1      [ 1] 4602 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0095DC 02 27 03 CC      [ 1] 4603 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0095E0 87               [ 4] 4604 	ret 
                                   4605 
                                   4606 ;-------------------------------
                                   4607 ; BASIC: ADCON 0|1 [,divisor]  
                                   4608 ; disable/enanble ADC 
                                   4609 ;-------------------------------
                           000003  4610 	ONOFF=3 
                           000001  4611 	DIVSOR=1
                           000004  4612 	VSIZE=4 
      001763                       4613 power_adc:
      0095E1 DD 0E DA         [ 4] 4614 	call arg_list 
      0095E2 A1 02            [ 1] 4615 	cp a,#2	
      0095E2 85 CF            [ 1] 4616 	jreq 1$
      0095E4 00 1A            [ 1] 4617 	cp a,#1 
      0095E6 85 9F            [ 1] 4618 	jreq 0$ 
      0095E8 C7 00 19         [ 2] 4619 	jp syntax_error 
      0095EB 5F 92 BC         [ 2] 4620 0$: ldw x,#0
      0095EE 00               [ 2] 4621 	pushw x  ; divisor 
      0095EF 19 97            [ 2] 4622 1$: ldw x,(ONOFF,sp)
      0095F1 A6               [ 2] 4623 	tnzw x 
      0095F2 04 81            [ 1] 4624 	jreq 2$ 
      0095F4 1E 01            [ 2] 4625 	ldw x,(DIVSOR,sp) ; divisor 
      0095F4 CD               [ 1] 4626 	ld a,xl
      0095F5 90 AA            [ 1] 4627 	and a,#7
      0095F7 A1               [ 1] 4628 	swap a 
      0095F8 04 27 03         [ 1] 4629 	ld ADC_CR1,a
      0095FB CC 87 DD 4F      [ 1] 4630 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0095FF 5D 26 05 55      [ 1] 4631 	bset ADC_CR1,#ADC_CR1_ADON 
      00178B                       4632 	_usec_dly 7 
      009603 00 04 00         [ 2]    1     ldw x,#(16*7-2)/4
      009606 02               [ 2]    2     decw x
      009607 81               [ 1]    3     nop 
      009608 26 FA            [ 1]    4     jrne .-4
      009608 85 52            [ 2] 4633 	jra 3$
      00960A 0A 89 A6 05      [ 1] 4634 2$: bres ADC_CR1,#ADC_CR1_ADON
      00960E CD 8F 4D 1F      [ 1] 4635 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00179C                       4636 3$:	_drop VSIZE 
      009612 07 CD            [ 2]    1     addw sp,#VSIZE 
      009614 91               [ 4] 4637 	ret
                                   4638 
                                   4639 ;-----------------------------
                                   4640 ; BASIC: ADCREAD (channel)
                                   4641 ; read adc channel {0..5}
                                   4642 ; output:
                                   4643 ;   A 		TK_INTGR 
                                   4644 ;   X 		value 
                                   4645 ;-----------------------------
      00179F                       4646 analog_read:
      009615 EA 72 14         [ 4] 4647 	call func_args 
      009618 00 26            [ 1] 4648 	cp a,#1 
      00961A 5F 1F            [ 1] 4649 	jreq 1$
      00961C 0B 1F 09         [ 2] 4650 	jp syntax_error
      00961F CD               [ 2] 4651 1$: popw x 
      009620 88 90 A1         [ 2] 4652 	cpw x,#5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009623 06 27            [ 2] 4653 	jrule 2$
      009625 03 CC            [ 1] 4654 	ld a,#ERR_BAD_VALUE
      009627 87 DD 5F         [ 2] 4655 	jp tb_error 
      009629 9F               [ 1] 4656 2$: ld a,xl
      009629 A3 96 31         [ 1] 4657 	ld acc8,a 
      00962C 27 03            [ 1] 4658 	ld a,#5
      00962E CC 87 DD         [ 1] 4659 	sub a,acc8 
      009631 C7 54 00         [ 1] 4660 	ld ADC_CSR,a
      009631 72 04 00 26      [ 1] 4661 	bset ADC_CR2,#ADC_CR2_ALIGN
      009635 03 CC 87 DD      [ 1] 4662 	bset ADC_CR1,#ADC_CR1_ADON
      009639 CD 90 AA A1 04   [ 2] 4663 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00963E 27 03 CC         [ 2] 4664 	ldw x,ADC_DRH
      009641 87 DD            [ 1] 4665 	ld a,#TK_INTGR
      009643 1F               [ 4] 4666 	ret 
                                   4667 
                                   4668 ;-----------------------
                                   4669 ; BASIC: DREAD(pin)
                                   4670 ; Arduino pins 
                                   4671 ; read state of a digital pin 
                                   4672 ; pin# {0..15}
                                   4673 ; output:
                                   4674 ;    A 		TK_INTGR
                                   4675 ;    X      0|1 
                                   4676 ;-------------------------
                           000001  4677 	PINNO=1
                           000001  4678 	VSIZE=1
      0017D3                       4679 digital_read:
      0017D3                       4680 	_vars VSIZE 
      009644 05 CD            [ 2]    1     sub sp,#VSIZE 
      009646 88 90 A1         [ 4] 4681 	call func_args
      009649 00 27            [ 1] 4682 	cp a,#1
      00964B 0E A1            [ 1] 4683 	jreq 1$
      00964D 06 26 05         [ 2] 4684 	jp syntax_error
      009650 A3               [ 2] 4685 1$: popw x 
      009651 96 61 27         [ 2] 4686 	cpw x,#15 
      009654 0C 05            [ 2] 4687 	jrule 2$
      009655 A6 0A            [ 1] 4688 	ld a,#ERR_BAD_VALUE
      009655 55 00 03         [ 2] 4689 	jp tb_error 
      009658 00 02 BD         [ 4] 4690 2$:	call select_pin 
      00965A 6B 01            [ 1] 4691 	ld (PINNO,sp),a
      00965A AE 00            [ 1] 4692 	ld a,(GPIO_IDR,x)
      00965C 01 1F            [ 1] 4693 	tnz (PINNO,sp)
      00965E 03 20            [ 1] 4694 	jreq 8$
      009660 14               [ 1] 4695 3$: srl a 
      009661 0A 01            [ 1] 4696 	dec (PINNO,sp)
      009661 72 04            [ 1] 4697 	jrne 3$ 
      009663 00 26            [ 1] 4698 8$: and a,#1 
      009665 03               [ 1] 4699 	clrw x 
      009666 CC               [ 1] 4700 	ld xl,a 
      009667 87 DD            [ 1] 4701 	ld a,#TK_INTGR
      001800                       4702 	_drop VSIZE
      009669 CD 90            [ 2]    1     addw sp,#VSIZE 
      00966B AA               [ 4] 4703 	ret
                                   4704 
                                   4705 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4706 ; BASIC: DWRITE pin,0|1
                                   4707 ; Arduino pins 
                                   4708 ; write to a digital pin 
                                   4709 ; pin# {0..15}
                                   4710 ; output:
                                   4711 ;    A 		TK_INTGR
                                   4712 ;    X      0|1 
                                   4713 ;-------------------------
                           000001  4714 	PINNO=1
                           000002  4715 	PINVAL=2
                           000002  4716 	VSIZE=2
      001803                       4717 digital_write:
      001803                       4718 	_vars VSIZE 
      00966C A1 04            [ 2]    1     sub sp,#VSIZE 
      00966E 27 03 CC         [ 4] 4719 	call arg_list  
      009671 87 DD            [ 1] 4720 	cp a,#2 
      009673 1F 03            [ 1] 4721 	jreq 1$
      009675 CC 07 5D         [ 2] 4722 	jp syntax_error
      009675 CE               [ 2] 4723 1$: popw x 
      009676 00               [ 1] 4724 	ld a,xl 
      009677 05 1F            [ 1] 4725 	ld (PINVAL,sp),a
      009679 0B               [ 2] 4726 	popw x 
      00967A CE 00 01         [ 2] 4727 	cpw x,#15 
      00967D 1F 09            [ 2] 4728 	jrule 2$
      00967F 72 15            [ 1] 4729 	ld a,#ERR_BAD_VALUE
      009681 00 26 72         [ 2] 4730 	jp tb_error 
      009684 5C 00 23         [ 4] 4731 2$:	call select_pin 
      009687 81 01            [ 1] 4732 	ld (PINNO,sp),a 
      009688 A6 01            [ 1] 4733 	ld a,#1
      009688 72 5D            [ 1] 4734 	tnz (PINNO,sp)
      00968A 00 23            [ 1] 4735 	jreq 4$
      00968C 26               [ 1] 4736 3$: sll a
      00968D 03 CC            [ 1] 4737 	dec (PINNO,sp)
      00968F 87 DD            [ 1] 4738 	jrne 3$
      009691 0D 02            [ 1] 4739 4$: tnz (PINVAL,sp)
      009691 A6 05            [ 1] 4740 	jrne 5$
      009693 CD               [ 1] 4741 	cpl a 
      009694 8F 4D            [ 1] 4742 	and a,(GPIO_ODR,x)
      009696 13 07            [ 2] 4743 	jra 8$
      009698 27 03            [ 1] 4744 5$: or a,(GPIO_ODR,x)
      00969A CC 87            [ 1] 4745 8$: ld (GPIO_ODR,x),a 
      00183B                       4746 	_drop VSIZE 
      00969C DD 02            [ 2]    1     addw sp,#VSIZE 
      00969D 81               [ 4] 4747 	ret
                                   4748 
                                   4749 
                                   4750 ;-----------------------
                                   4751 ; BASIC: STOP
                                   4752 ; stop progam execution  
                                   4753 ; without resetting pointers 
                                   4754 ; the program is resumed
                                   4755 ; with RUN 
                                   4756 ;-------------------------
      00183E                       4757 stop:
      00969D FE 72 FB 03 16   [ 2] 4758 	btjt flags,#FRUN,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0096A2 07               [ 1] 4759 	clr a
      0096A3 90               [ 4] 4760 	ret 
      001845                       4761 2$:	 
                                   4762 ; create space on cstack to save context 
      0096A4 FF A6 80         [ 2] 4763 	ldw x,#break_point 
      0096A7 15 03 2A         [ 4] 4764 	call puts 
      00184B                       4765 	_drop 2 ;drop return address 
      0096AA 06 13            [ 2]    1     addw sp,#2 
      00184D                       4766 	_vars CTXT_SIZE ; context size 
      0096AC 05 2F            [ 2]    1     sub sp,#CTXT_SIZE 
      0096AE 1B 20 04         [ 4] 4767 	call save_context 
      0096B1 AE 16 E8         [ 2] 4768 	ldw x,#tib 
      0096B1 13 05 2C         [ 2] 4769 	ldw basicptr,x
      0096B4 15               [ 1] 4770 	clr (x)
      0096B5 72 5F 00 03      [ 1] 4771 	clr count  
      0096B5 1E               [ 1] 4772 	clrw x 
      0096B6 0B CF 00         [ 2] 4773 	ldw in.w,x
      0096B9 05 72 01 00      [ 1] 4774 	bres flags,#FRUN 
      0096BD 26 05 E6 02      [ 1] 4775 	bset flags,#FBREAK
      0096C1 C7 00 04         [ 2] 4776 	jp interpreter 
      0096C4 1E 09 CF 00 01 81 20  4777 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4778 
                                   4779 ;-----------------------
                                   4780 ; BASIC: NEW
                                   4781 ; from command line only 
                                   4782 ; free program memory
                                   4783 ; and clear variables 
                                   4784 ;------------------------
      0096CA                       4785 new: 
      0096CA 85 5B 0A 72 5A   [ 2] 4786 	btjf flags,#FRUN,0$ 
      0096CF 00               [ 1] 4787 	clr a 
      0096D0 23               [ 4] 4788 	ret 
      001891                       4789 0$:	
      0096D1 FC 05 FF         [ 4] 4790 	call clear_basic 
      0096D2 81               [ 4] 4791 	ret 
                                   4792 	 
                                   4793 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4794 ;  file system routines
                                   4795 ;  MCU flash memory from
                                   4796 ;  0x10000-0x27fff is 
                                   4797 ;  used to store BASIC 
                                   4798 ;  program files. 
                                   4799 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4800 
                                   4801 ;--------------------
                                   4802 ; input:
                                   4803 ;   X     increment 
                                   4804 ; output:
                                   4805 ;   farptr  incremented 
                                   4806 ;---------------------
      001895                       4807 incr_farptr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0096D2 CD 90 AA A1      [ 2] 4808 	addw x,farptr+1 
      0096D6 04 27            [ 1] 4809 	jrnc 1$
      0096D8 03 CC 87 DD      [ 1] 4810 	inc farptr 
      0096DC CD 82 F9         [ 2] 4811 1$:	ldw farptr+1,x  
      0096DF 5D               [ 4] 4812 	ret 
                                   4813 
                                   4814 ;------------------------------
                                   4815 ; extended flash memory used as FLASH_DRIVE 
                                   4816 ; seek end of used flash drive   
                                   4817 ; starting at 0x10000 address.
                                   4818 ; 4 consecutives 0 bytes signal free space. 
                                   4819 ; input:
                                   4820 ;	none
                                   4821 ; output:
                                   4822 ;   ffree     free_addr| 0 if memory full.
                                   4823 ;------------------------------
      0018A3                       4824 seek_fdrive:
                                   4825 ; start scan at 0x10000 address 
      0096E0 26 05            [ 1] 4826 	ld a,#1
      0096E2 A6 05 CC         [ 1] 4827 	ld farptr,a 
      0096E5 87               [ 1] 4828 	clrw x 
      0096E6 DF 81 19         [ 2] 4829 	ldw farptr+1,x 
      0096E8                       4830 1$:
      0096E8 72 00 00         [ 2] 4831 	ldw x,#3  
      0096EB 26 06 A6 06      [ 5] 4832 2$:	ldf a,([farptr],x) 
      0096EF CC 87            [ 1] 4833 	jrne 3$
      0096F1 DF               [ 2] 4834 	decw x
      0096F2 81 CD            [ 1] 4835 	jrpl 2$
      0096F4 96 D2            [ 2] 4836 	jra 4$ 
      0096F6 5C               [ 2] 4837 3$:	incw x 
      0096F6 CF 00 05         [ 4] 4838 	call incr_farptr
      0096F9 E6 02 C7         [ 2] 4839 	ldw x,#0x27f 
      0096FC 00 04 35         [ 2] 4840 	cpw x,farptr
      0096FF 03 00            [ 1] 4841 	jrpl 1$
                                   4842 ; drive full 
      009701 02 81 00 1B      [ 1] 4843 	clr ffree 
      009703 72 5F 00 1C      [ 1] 4844 	clr ffree+1 
      009703 72 00 00 26      [ 1] 4845 	clr ffree+2 
      009707 06               [ 4] 4846 	ret
      0018D3                       4847 4$: ; copy farptr to ffree	 
      009708 A6 06 CC         [ 2] 4848 	ldw x,farptr 
      00970B 87 DF 81         [ 1] 4849 	ld a,farptr+2 
      00970E 85 52 04         [ 2] 4850 	ldw ffree,x 
      009711 89 CE 00         [ 1] 4851 	ld ffree+2,a  
      009714 05               [ 4] 4852 	ret 
                                   4853 
                                   4854 ;-----------------------
                                   4855 ; compare file name 
                                   4856 ; with name pointed by Y  
                                   4857 ; input:
                                   4858 ;   farptr   file name 
                                   4859 ;   Y        target name 
                                   4860 ; output:
                                   4861 ;   farptr 	 at file_name
                                   4862 ;   X 		 farptr[x] point at size field  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4863 ;   Carry    0|1 no match|match  
                                   4864 ;----------------------
      0018E0                       4865 cmp_name:
      009715 1F               [ 1] 4866 	clrw x
      009716 03 CD 96 D2      [ 5] 4867 1$:	ldf a,([farptr],x)
      00971A 89 CE            [ 1] 4868 	cp a,(y)
      00971C 00 01            [ 1] 4869 	jrne 4$
      00971E 1F               [ 1] 4870 	tnz a 
      00971F 07 85            [ 1] 4871 	jreq 9$ 
      009721 20               [ 2] 4872     incw x 
      009722 D3 5C            [ 2] 4873 	incw y 
      009723 20 F0            [ 2] 4874 	jra 1$
      0018F1                       4875 4$: ;no match 
      009723 72               [ 1] 4876 	tnz a 
      009724 00 00            [ 1] 4877 	jreq 5$
      009726 26               [ 2] 4878 	incw x 
      009727 05 A6 06 CC      [ 5] 4879 	ldf a,([farptr],x)
      00972B 87 DF            [ 2] 4880 	jra 4$  
      00972D 5C               [ 2] 4881 5$:	incw x ; farptr[x] point at 'size' field 
      00972D 1E               [ 1] 4882 	rcf 
      00972E 03               [ 4] 4883 	ret
      0018FE                       4884 9$: ; match  
      00972F CF               [ 2] 4885 	incw x  ; farptr[x] at 'size' field 
      009730 00               [ 1] 4886 	scf 
      009731 05               [ 4] 4887 	ret 
                                   4888 
                                   4889 ;-----------------------
                                   4890 ; search file in 
                                   4891 ; flash memory 
                                   4892 ; input:
                                   4893 ;   Y       file name  
                                   4894 ; output:
                                   4895 ;   farptr  addr at name|0
                                   4896 ;-----------------------
                           000001  4897 	FSIZE=1
                           000003  4898 	YSAVE=3
                           000004  4899 	VSIZE=4 
      001901                       4900 search_file: 
      001901                       4901 	_vars VSIZE
      009732 E6 02            [ 2]    1     sub sp,#VSIZE 
      009734 C7 00            [ 2] 4902 	ldw (YSAVE,sp),y  
      009736 04               [ 1] 4903 	clrw x 
      009737 1E 05 CF         [ 2] 4904 	ldw farptr+1,x 
      00973A 00 01 85 5B      [ 1] 4905 	mov farptr,#1
      00190D                       4906 1$:	
                                   4907 ; check if farptr is after any file 
                                   4908 ; if  0 then so.
      00973E 04 89 81 18      [ 5] 4909 	ldf a,[farptr]
      009741 27 25            [ 1] 4910 	jreq 6$
      009741 72               [ 1] 4911 2$: clrw x 	
      009742 01 00            [ 2] 4912 	ldw y,(YSAVE,sp) 
      009744 26 02 4F         [ 4] 4913 	call cmp_name
      009747 81 2D            [ 1] 4914 	jrc 9$
      009748 92 AF 00 18      [ 5] 4915 	ldf a,([farptr],x)
      009748 72 09            [ 1] 4916 	ld (FSIZE,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00974A 00               [ 2] 4917 	incw x 
      00974B 26 12 5B 02      [ 5] 4918 	ldf a,([farptr],x)
      00974F CD 94            [ 1] 4919 	ld (FSIZE+1,sp),a 
      009751 C4               [ 2] 4920 	incw x 
      009752 5B 04 72         [ 2] 4921 	addw x,(FSIZE,sp) ; count to skip 
      009755 19               [ 2] 4922 	incw x ; skip over EOF marker 
      009756 00 26 72         [ 4] 4923 	call incr_farptr ; now at next file 'name_field'
      009759 10 00 26         [ 2] 4924 	ldw x,#0x280
      00975C CC 88 45         [ 2] 4925 	cpw x,farptr 
      00975F CE 00            [ 1] 4926 	jrpl 1$
      001938                       4927 6$: ; file not found 
      009761 1F C3 00 21      [ 1] 4928 	clr farptr
      009765 2B 05 A6 0D      [ 1] 4929 	clr farptr+1 
      009769 CC 87 DF 1A      [ 1] 4930 	clr farptr+2 
      00976C                       4931 	_drop VSIZE 
      00976C CD 91            [ 2]    1     addw sp,#VSIZE 
      00976E B7               [ 1] 4932 	rcf
      00976F 5B               [ 4] 4933 	ret
      001948                       4934 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001948                       4935 	_drop VSIZE 
      009770 02 5F            [ 2]    1     addw sp,#VSIZE 
      009772 CF               [ 1] 4936 	scf 	
      009773 00               [ 4] 4937 	ret
                                   4938 
                                   4939 
                                   4940 ;--------------------------------
                                   4941 ; BASIC: SAVE "name" 
                                   4942 ; save text program in 
                                   4943 ; flash memory used as 
                                   4944 ;--------------------------------
                           000001  4945 	BSIZE=1
                           000003  4946 	NAMEPTR=3
                           000004  4947 	VSIZE=4
      00194C                       4948 save:
      009774 07 72 5F 00 09   [ 2] 4949 	btjf flags,#FRUN,0$ 
      009779 72 5F            [ 1] 4950 	ld a,#ERR_CMD_ONLY 
      00977B 00 0A CE         [ 2] 4951 	jp tb_error
      001956                       4952 0$:	 
      00977E 00 1F CF         [ 2] 4953 	ldw x,txtend 
      009781 00 05 E6 02      [ 2] 4954 	subw x,txtbgn
      009785 C7 00            [ 1] 4955 	jrne 1$
                                   4956 ; nothing to save 
      009787 04 35            [ 1] 4957 	ld a,#ERR_NO_PROG
      009789 03 00 02         [ 2] 4958 	jp tb_error 	
      001964                       4959 1$:	
      001964                       4960 	_vars VSIZE 
      00978C 72 10            [ 2]    1     sub sp,#VSIZE 
      00978E 00 26            [ 2] 4961 	ldw (BSIZE,sp),x 
      009790 CC 88 45         [ 4] 4962 	call next_token	
      009793 A1 02            [ 1] 4963 	cp a,#TK_QSTR
      009793 AE 17            [ 1] 4964 	jreq 2$
      009795 FF 94 CC         [ 2] 4965 	jp syntax_error
      001972                       4966 2$: 
      009798 88 28            [ 2] 4967 	ldw (NAMEPTR,sp),x  
      00979A 55 00 03 00 01   [ 1] 4968 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4969 ; check if enough free space 
      00979A CD 8F 5A         [ 4] 4970 	call strlen 
      00979D A1 02 27         [ 2] 4971 	addw x,#3 
      0097A0 03 CC 87         [ 2] 4972 	addw x,(BSIZE,sp)
      0097A3 DD 5D 00 1B      [ 1] 4973 	tnz ffree 
      0097A4 26 0B            [ 1] 4974 	jrne 21$
      0097A4 85 90 85 1C      [ 2] 4975 	subw x,ffree+1 
      0097A7 23 05            [ 2] 4976 	jrule 21$
      0097A7 89 AE            [ 1] 4977 	ld a,#ERR_NO_FSPACE  
      0097A9 F4 24 65         [ 2] 4978 	jp tb_error
      001993                       4979 21$: 
                                   4980 ; check for existing file of that name 
      0097AC 90 A3            [ 2] 4981 	ldw y,(NAMEPTR,sp)	
      0097AE 7A 12 2B         [ 4] 4982 	call search_file 
      0097B1 01 5C            [ 1] 4983 	jrnc 3$ 
      0097B3 A6 08            [ 1] 4984 	ld a,#ERR_DUPLICATE 
      0097B3 9E C7 53         [ 2] 4985 	jp tb_error 
      00199F                       4986 3$:	;** write file name to flash **
      0097B6 0D 9F C7         [ 2] 4987 	ldw x,ffree 
      0097B9 53 0E 8C         [ 1] 4988 	ld a,ffree+2 
      0097BC 56 9E C7         [ 2] 4989 	ldw farptr,x 
      0097BF 53 0F 9F         [ 1] 4990 	ld farptr+2,a 
      0097C2 C7 53            [ 2] 4991 	ldw x,(NAMEPTR,sp)  
      0097C4 10 72 10         [ 4] 4992 	call strlen 
      0097C7 53               [ 2] 4993 	incw  x
      0097C8 08 72            [ 2] 4994 	ldw (BSIZE,sp),x  
      0097CA 10               [ 1] 4995 	clrw x   
      0097CB 53 00            [ 2] 4996 	ldw y,(NAMEPTR,sp)
      0097CD 72 10 53         [ 4] 4997 	call write_block  
                                   4998 ;** write file length after name **
      0097D0 04 85 CF         [ 2] 4999 	ldw x,txtend 
      0097D3 00 13 CE 00      [ 2] 5000 	subw x,txtbgn
      0097D7 13 26            [ 2] 5001 	ldw (BSIZE,sp),x 
      0097D9 FB               [ 1] 5002 	clrw x 
      0097DA 72 11            [ 1] 5003 	ld a,(BSIZE,sp)
      0097DC 53 08 72         [ 4] 5004 	call write_byte 
      0097DF 11               [ 2] 5005 	incw x 
      0097E0 53 00            [ 1] 5006 	ld a,(BSIZE+1,sp)
      0097E2 81 00 F1         [ 4] 5007 	call write_byte
      0097E3 5C               [ 2] 5008 	incw x  
      0097E3 CD 8F 5A         [ 4] 5009 	call incr_farptr ; move farptr after SIZE field 
                                   5010 ;** write BASIC text **
                                   5011 ; copy BSIZE, stack:{... bsize -- ... bsize bsize }	
      0097E6 A1 02            [ 2] 5012 	ldw x,(BSIZE,sp)
      0097E8 27               [ 2] 5013 	pushw x ; write_block argument 
      0097E9 0B               [ 1] 5014 	clrw x 
      0097EA A1 01 27 03      [ 2] 5015 	ldw y,txtbgn  ; BASIC text to save 
      0097EE CC 87 DD         [ 4] 5016 	call write_block 
      0019DD                       5017 	_drop 2 ;  drop write_block argument  
      0097F1 AE 00            [ 2]    1     addw sp,#2 
                                   5018 ; write end of file marker 
      0097F3 00 89 1E         [ 2] 5019 	ldw x,#1
      0097F6 03 5D            [ 1] 5020 	ld a,#EOF  
      0097F8 27 1A 1E         [ 4] 5021 	call write_byte 
      0097FB 01 9F A4         [ 4] 5022 	call incr_farptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   5023 ; save farptr in ffree
      0097FE 07 4E C7         [ 2] 5024 	ldw x,farptr 
      009801 54 01 72         [ 1] 5025 	ld a,farptr+2 
      009804 16 50 CA         [ 2] 5026 	ldw ffree,x 
      009807 72 10 54         [ 1] 5027 	ld ffree+2,a
                                   5028 ;write 4 zero bytes as an end of all files marker 
      00980A 01               [ 1] 5029     clrw x 
      00980B AE 00            [ 1] 5030 	push #4 
      0019F9                       5031 4$:
      00980D 1B               [ 1] 5032 	clr a 
      00980E 5A 9D 26         [ 4] 5033 	call write_byte 
      009811 FA               [ 2] 5034 	incw x 
      009812 20 08            [ 1] 5035 	dec (1,sp)
      009814 72 11            [ 1] 5036 	jrne 4$
      009816 54               [ 1] 5037 5$: pop a 
                                   5038 ; display saved size  
      009817 01 72            [ 2] 5039 	ldw x,(BSIZE,sp) 
      009819 17 50 CA         [ 4] 5040 	call print_int 
      001A08                       5041 	_drop VSIZE 
      00981C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00981E 81               [ 4] 5042 	ret 
                                   5043 
                                   5044 ;----------------------
                                   5045 ; load file in RAM memory
                                   5046 ; input:
                                   5047 ;    farptr point at file size 
                                   5048 ; output:
                                   5049 ;   y point after BASIC program in RAM.
                                   5050 ;------------------------
      00981F                       5051 load_file:
      00981F CD 8F 81         [ 4] 5052 	call incr_farptr  
      009822 A1 01 27         [ 4] 5053 	call clear_basic  
      009825 03               [ 1] 5054 	clrw x
      009826 CC 87 DD 85      [ 5] 5055 	ldf a,([farptr],x)
      00982A A3 00            [ 1] 5056 	ld yh,a 
      00982C 05               [ 2] 5057 	incw x  
      00982D 23 05 A6 0A      [ 5] 5058 	ldf a,([farptr],x)
      009831 CC               [ 2] 5059 	incw x 
      009832 87 DF            [ 1] 5060 	ld yl,a 
      009834 9F C7 00 0E      [ 2] 5061 	addw y,txtbgn
      009838 A6 05 C0 00      [ 2] 5062 	ldw txtend,y
      00983C 0E C7 54 00      [ 2] 5063 	ldw y,txtbgn
      001A2C                       5064 3$:	; load BASIC text 	
      009840 72 16 54 02      [ 5] 5065 	ldf a,([farptr],x)
      009844 72 10            [ 1] 5066 	ld (y),a 
      009846 54               [ 2] 5067 	incw x 
      009847 01 72            [ 2] 5068 	incw y 
      009849 0F 54 00 FB      [ 2] 5069 	cpw y,txtend 
      00984D CE 54            [ 1] 5070 	jrmi 3$
      00984F 04               [ 4] 5071 	ret 
                                   5072 
                                   5073 ;------------------------
                                   5074 ; BASIC: LOAD "file" 
                                   5075 ; load file to RAM 
                                   5076 ; for execution 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5077 ;------------------------
      001A3C                       5078 load:
      009850 A6 04 81 25 07   [ 2] 5079 	btjf flags,#FRUN,0$ 
      009853 27 05            [ 1] 5080 	jreq 0$ 
      009853 52 01            [ 1] 5081 	ld a,#ERR_CMD_ONLY 
      009855 CD 8F 81         [ 2] 5082 	jp tb_error 
      001A48                       5083 0$:	
      009858 A1 01 27         [ 4] 5084 	call next_token 
      00985B 03 CC            [ 1] 5085 	cp a,#TK_QSTR
      00985D 87 DD            [ 1] 5086 	jreq 1$
      00985F 85 A3 00         [ 2] 5087 	jp syntax_error 
      009862 0F 23            [ 1] 5088 1$:	ldw y,x 
      009864 05 A6 0A CC 87   [ 1] 5089 	mov in,count 
      009869 DF CD 9E         [ 4] 5090 	call search_file 
      00986C 3D 6B            [ 1] 5091 	jrc 2$ 
      00986E 01 E6            [ 1] 5092 	ld a,#ERR_NOT_FILE
      009870 01 0D 01         [ 2] 5093 	jp tb_error  
      001A63                       5094 2$:
      009873 27 05 44         [ 4] 5095 	call load_file
                                   5096 ; print loaded size 	 
      009876 0A 01 26         [ 2] 5097 	ldw x,txtend 
      009879 FB A4 01 5F      [ 2] 5098 	subw x,txtbgn
      00987D 97 A6 04         [ 4] 5099 	call print_int 
      009880 5B               [ 4] 5100 	ret 
                                   5101 
                                   5102 ;-----------------------------------
                                   5103 ; BASIC: FORGET ["file_name"] 
                                   5104 ; erase file_name and all others 
                                   5105 ; after it. 
                                   5106 ; without argument erase all files 
                                   5107 ;-----------------------------------
      001A71                       5108 forget:
      009881 01 81 10         [ 4] 5109 	call next_token 
      009883 A1 00            [ 1] 5110 	cp a,#TK_NONE 
      009883 52 02            [ 1] 5111 	jreq 3$ 
      009885 CD 8F            [ 1] 5112 	cp a,#TK_QSTR
      009887 5A A1            [ 1] 5113 	jreq 1$
      009889 02 27 03         [ 2] 5114 	jp syntax_error
      00988C CC 87            [ 1] 5115 1$: ldw y,x 
      00988E DD 85 9F 6B 02   [ 1] 5116 	mov in,count 
      009893 85 A3 00         [ 4] 5117 	call search_file
      009896 0F 23            [ 1] 5118 	jrc 2$
      009898 05 A6            [ 1] 5119 	ld a,#ERR_NOT_FILE 
      00989A 0A CC 87         [ 2] 5120 	jp tb_error 
      001A90                       5121 2$: 
      00989D DF CD 9E         [ 2] 5122 	ldw x,farptr
      0098A0 3D 6B 01         [ 1] 5123 	ld a,farptr+2
      0098A3 A6 01            [ 2] 5124 	jra 4$ 
      001A98                       5125 3$: ; forget all files 
      0098A5 0D 01 27         [ 2] 5126 	ldw x,#0x100
      0098A8 05               [ 1] 5127 	clr a 
      0098A9 48 0A 01         [ 2] 5128 	ldw farptr,x 
      0098AC 26 FB 0D         [ 1] 5129 	ld farptr+2,a 
      001AA2                       5130 4$:
      0098AF 02 26 05         [ 2] 5131 	ldw ffree,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      0098B2 43 E4 00         [ 1] 5132 	ld ffree+2,a 
      0098B5 20 02            [ 1] 5133 	push #4
      0098B7 EA               [ 1] 5134 	clrw x 
      001AAB                       5135 5$: 
      0098B8 00               [ 1] 5136 	clr a  
      0098B9 E7 00 5B         [ 4] 5137 	call write_byte 
      0098BC 02               [ 2] 5138 	incw x 
      0098BD 81 01            [ 1] 5139 	dec (1,sp)
      0098BE 26 F7            [ 1] 5140 	jrne 5$	
      0098BE 72               [ 1] 5141 6$: pop a 
      0098BF 00               [ 4] 5142 	ret 
                                   5143 
                                   5144 ;----------------------
                                   5145 ; BASIC: DIR 
                                   5146 ; list saved files 
                                   5147 ;----------------------
                           000001  5148 	COUNT=1 ; files counter 
                           000002  5149 	VSIZE=2 
      001AB6                       5150 directory:
      001AB6                       5151 	_vars VSIZE 
      0098C0 00 26            [ 2]    1     sub sp,#VSIZE 
      0098C2 02               [ 1] 5152 	clrw x 
      0098C3 4F 81            [ 2] 5153 	ldw (COUNT,sp),x 
      0098C5 CF 00 19         [ 2] 5154 	ldw farptr+1,x 
      0098C5 AE 98 EC CD      [ 1] 5155 	mov farptr,#1 
      001AC2                       5156 dir_loop:
      0098C9 82               [ 1] 5157 	clrw x 
      0098CA 57 5B 02 52      [ 5] 5158 	ldf a,([farptr],x)
      0098CE 04 CD            [ 1] 5159 	jreq 8$ 
      001AC9                       5160 1$: ;name loop 	
      0098D0 94 B4 AE 16      [ 5] 5161 	ldf a,([farptr],x)
      0098D4 E8 CF            [ 1] 5162 	jreq 2$ 
      0098D6 00 05 7F         [ 4] 5163 	call putc 
      0098D9 72               [ 2] 5164 	incw x 
      0098DA 5F 00            [ 2] 5165 	jra 1$
      0098DC 04               [ 2] 5166 2$: incw x ; skip ending 0. 
      0098DD 5F CF            [ 1] 5167 	ld a,#SPACE 
      0098DF 00 01 72         [ 4] 5168 	call putc 
                                   5169 ; get file size 	
      0098E2 11 00 26 72      [ 5] 5170 	ldf a,([farptr],x)
      0098E6 18 00            [ 1] 5171 	ld yh,a 
      0098E8 26               [ 2] 5172 	incw x 
      0098E9 CC 88 45 0A      [ 5] 5173 	ldf a,([farptr],x)
      0098ED 62               [ 2] 5174 	incw x 
      0098EE 72 65            [ 1] 5175 	ld yl,a 
      0098F0 61 6B            [ 2] 5176 	pushw y 
      0098F2 20 70 6F         [ 2] 5177 	addw x,(1,sp)
      0098F5 69               [ 2] 5178 	incw x ; skip EOF marker 
                                   5179 ; skip to next file 
      0098F6 6E 74 2C         [ 4] 5180 	call incr_farptr 
                                   5181 ; print file size 
      0098F9 20               [ 2] 5182 	popw x ; file size 
      0098FA 52 55 4E         [ 4] 5183 	call print_int 
      0098FD 20 74            [ 1] 5184 	ld a,#CR 
      0098FF 6F 20 72         [ 4] 5185 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009902 65 73            [ 2] 5186 	ldw x,(COUNT,sp)
      009904 75               [ 2] 5187 	incw x
      009905 6D 65            [ 2] 5188 	ldw (COUNT,sp),x  
      009907 2E 0A            [ 2] 5189 	jra dir_loop 
      001B02                       5190 8$: ; print number of files 
      009909 00 01            [ 2] 5191 	ldw x,(COUNT,sp)
      00990A CD 08 A9         [ 4] 5192 	call print_int 
      00990A 72 01 00         [ 2] 5193 	ldw x,#file_count 
      00990D 26 02 4F         [ 4] 5194 	call puts  
                                   5195 ; print drive free space 	
      009910 81 FF            [ 1] 5196 	ld a,#0xff 
      009911 C0 00 1D         [ 1] 5197 	sub a,ffree+2 
      009911 CD 86 7F         [ 1] 5198 	ld acc8,a 
      009914 81 7F            [ 1] 5199 	ld a,#0x7f 
      009915 C2 00 1C         [ 1] 5200 	sbc a,ffree+1 
      009915 72 BB 00         [ 1] 5201 	ld acc16,a 
      009918 1A 24            [ 1] 5202 	ld a,#2 
      00991A 04 72 5C         [ 1] 5203 	sbc a,ffree 
      00991D 00 19 CF         [ 1] 5204 	ld acc24,a 
      009920 00               [ 1] 5205 	clrw x  
      009921 1A 81            [ 1] 5206 	ld a,#6 
      009923 97               [ 1] 5207 	ld xl,a 
      009923 A6 01            [ 1] 5208 	ld a,#10 
      009925 C7 00 19         [ 4] 5209 	call prti24 
      009928 5F CF 00         [ 2] 5210 	ldw x,#drive_free
      00992B 1A 01 D7         [ 4] 5211 	call puts 
      00992C                       5212 	_drop VSIZE 
      00992C AE 00            [ 2]    1     addw sp,#VSIZE 
      00992E 03               [ 4] 5213 	ret
      00992F 92 AF 00 19 26 05 5A  5214 file_count: .asciz " files\n"
             2A
      009937 F7 20 19 5C CD 99 15  5215 drive_free: .asciz " bytes free\n" 
             AE 02 7F C3 00 19
                                   5216 
                                   5217 ;---------------------
                                   5218 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5219 ; write 1 or more byte to FLASH or EEPROM
                                   5220 ; starting at address  
                                   5221 ; input:
                                   5222 ;   expr1  	is address 
                                   5223 ;   expr2,...,exprn   are bytes to write
                                   5224 ; output:
                                   5225 ;   none 
                                   5226 ;---------------------
                           000001  5227 	ADDR=1
                           000002  5228 	VSIZ=2 
      001B4C                       5229 write:
      001B4C                       5230 	_vars VSIZE 
      009944 2A E6            [ 2]    1     sub sp,#VSIZE 
      009946 72 5F 00 1C      [ 1] 5231 	clr farptr ; expect 16 bits address 
      00994A 72 5F 00         [ 4] 5232 	call expression
      00994D 1D 72            [ 1] 5233 	cp a,#TK_INTGR 
      00994F 5F 00            [ 1] 5234 	jreq 0$
      009951 1E 81 5D         [ 2] 5235 	jp syntax_error
      009953 1F 01            [ 2] 5236 0$: ldw (ADDR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009953 CE 00 19         [ 4] 5237 	call next_token 
      009956 C6 00            [ 1] 5238 	cp a,#TK_COMMA 
      009958 1B CF            [ 1] 5239 	jreq 1$ 
      00995A 00 1C            [ 2] 5240 	jra 9$ 
      00995C C7 00 1E         [ 4] 5241 1$:	call expression
      00995F 81 04            [ 1] 5242 	cp a,#TK_INTGR
      009960 27 03            [ 1] 5243 	jreq 2$
      009960 5F 92 AF         [ 2] 5244 	jp syntax_error
      009963 00               [ 1] 5245 2$:	ld a,xl 
      009964 19 90            [ 2] 5246 	ldw x,(ADDR,sp) 
      009966 F1 26 08         [ 2] 5247 	ldw farptr+1,x 
      009969 4D               [ 1] 5248 	clrw x 
      00996A 27 12 5C         [ 4] 5249 	call write_byte
      00996D 90 5C            [ 2] 5250 	ldw x,(ADDR,sp)
      00996F 20               [ 2] 5251 	incw x 
      009970 F0 DC            [ 2] 5252 	jra 0$ 
      009971                       5253 9$:
      001B80                       5254 	_drop VSIZE
      009971 4D 27            [ 2]    1     addw sp,#VSIZE 
      009973 07               [ 4] 5255 	ret 
                                   5256 
                                   5257 
                                   5258 ;---------------------
                                   5259 ;BASIC: CHAR(expr)
                                   5260 ; évaluate expression 
                                   5261 ; and take the 7 least 
                                   5262 ; bits as ASCII character
                                   5263 ;---------------------
      001B83                       5264 char:
      009974 5C 92 AF         [ 4] 5265 	call func_args 
      009977 00 19            [ 1] 5266 	cp a,#1
      009979 20 F6            [ 1] 5267 	jreq 1$
      00997B 5C 98 81         [ 2] 5268 	jp syntax_error
      00997E 85               [ 2] 5269 1$:	popw x 
      00997E 5C               [ 1] 5270 	ld a,xl 
      00997F 99 81            [ 1] 5271 	and a,#0x7f 
      009981 97               [ 1] 5272 	ld xl,a
      009981 52 04            [ 1] 5273 	ld a,#TK_CHAR
      009983 17               [ 4] 5274 	ret
                                   5275 
                                   5276 ;---------------------
                                   5277 ; BASIC: ASC(string|char)
                                   5278 ; extract first character 
                                   5279 ; of string argument 
                                   5280 ; return it as TK_INTGR 
                                   5281 ;---------------------
      001B95                       5282 ascii:
      009984 03 5F            [ 1] 5283 	ld a,#TK_LPAREN
      009986 CF 00 1A         [ 4] 5284 	call expect 
      009989 35 01 00         [ 4] 5285 	call next_token 
      00998C 19 02            [ 1] 5286 	cp a,#TK_QSTR 
      00998D 27 07            [ 1] 5287 	jreq 1$
      00998D 92 BC            [ 1] 5288 	cp a,#TK_CHAR 
      00998F 00 19            [ 1] 5289 	jreq 2$ 
      009991 27 25 5F         [ 2] 5290 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001BA8                       5291 1$: 
      009994 16               [ 1] 5292 	ld a,(x) 
      009995 03               [ 1] 5293 	clrw x
      009996 CD               [ 1] 5294 	ld xl,a 
      001BAB                       5295 2$: 
      009997 99               [ 2] 5296 	pushw x 
      009998 60 25            [ 1] 5297 	ld a,#TK_RPAREN 
      00999A 2D 92 AF         [ 4] 5298 	call expect
      00999D 00               [ 2] 5299 	popw x 
      00999E 19 6B            [ 1] 5300 	ld a,#TK_INTGR 
      0099A0 01               [ 4] 5301 	ret 
                                   5302 
                                   5303 ;---------------------
                                   5304 ;BASIC: KEY
                                   5305 ; wait for a character 
                                   5306 ; received from STDIN 
                                   5307 ; input:
                                   5308 ;	none 
                                   5309 ; output:
                                   5310 ;	X 		ASCII character 
                                   5311 ;---------------------
      001BB5                       5312 key:
      0099A1 5C 92 AF         [ 4] 5313 	call getc 
      0099A4 00               [ 1] 5314 	clrw x 
      0099A5 19               [ 1] 5315 	ld xl,a 
      0099A6 6B 02            [ 1] 5316 	ld a,#TK_INTGR
      0099A8 5C               [ 4] 5317 	ret
                                   5318 
                                   5319 ;----------------------
                                   5320 ; BASIC: QKEY
                                   5321 ; Return true if there 
                                   5322 ; is a character in 
                                   5323 ; waiting in STDIN 
                                   5324 ; input:
                                   5325 ;  none 
                                   5326 ; output:
                                   5327 ;   X 		0|-1 
                                   5328 ;-----------------------
      001BBD                       5329 qkey:: 
      0099A9 72               [ 1] 5330 	clrw x 
      0099AA FB 01 5C CD      [ 1] 5331 	tnz rx_char
      0099AE 99 15            [ 1] 5332 	jreq 9$ 
      0099B0 AE               [ 2] 5333 	cplw x 
      0099B1 02 80            [ 1] 5334 9$: ld a,#TK_INTGR
      0099B3 C3               [ 4] 5335 	ret 
                                   5336 
                                   5337 ;---------------------
                                   5338 ; BASIC: GPIO(expr,reg)
                                   5339 ; return gpio address 
                                   5340 ; expr {0..8}
                                   5341 ; input:
                                   5342 ;   none 
                                   5343 ; output:
                                   5344 ;   X 		gpio register address
                                   5345 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                           000003  5346 	PORT=3
                           000001  5347 	REG=1 
                           000004  5348 	VSIZE=4 
      001BC8                       5349 gpio:
      0099B4 00 19 2A         [ 4] 5350 	call func_args 
      0099B7 D5 02            [ 1] 5351 	cp a,#2
      0099B8 27 03            [ 1] 5352 	jreq 1$
      0099B8 72 5F 00         [ 2] 5353 	jp syntax_error  
      001BD2                       5354 1$:	
      0099BB 19 72            [ 2] 5355 	ldw x,(PORT,sp)
      0099BD 5F 00            [ 1] 5356 	jrmi bad_port
      0099BF 1A 72 5F         [ 2] 5357 	cpw x,#9
      0099C2 00 1B            [ 1] 5358 	jrpl bad_port
      0099C4 5B 04            [ 1] 5359 	ld a,#5
      0099C6 98               [ 4] 5360 	mul x,a
      0099C7 81 50 00         [ 2] 5361 	addw x,#GPIO_BASE 
      0099C8 1F 03            [ 2] 5362 	ldw (PORT,sp),x  
      0099C8 5B 04            [ 2] 5363 	ldw x,(REG,sp) 
      0099CA 99 81 03         [ 2] 5364 	addw x,(PORT,sp)
      0099CC A6 04            [ 1] 5365 	ld a,#TK_INTGR
      001BEA                       5366 	_drop VSIZE 
      0099CC 72 01            [ 2]    1     addw sp,#VSIZE 
      0099CE 00               [ 4] 5367 	ret
      001BED                       5368 bad_port:
      0099CF 26 05            [ 1] 5369 	ld a,#ERR_BAD_VALUE
      0099D1 A6 07 CC         [ 2] 5370 	jp tb_error
                                   5371 
                                   5372 
                                   5373 ;-------------------------
                                   5374 ; BASIC: UFLASH 
                                   5375 ; return user flash address
                                   5376 ; input:
                                   5377 ;  none 
                                   5378 ; output:
                                   5379 ;	A		TK_INTGR
                                   5380 ;   X 		user address 
                                   5381 ;---------------------------
      001BF2                       5382 uflash:
      0099D4 87 DF 80         [ 2] 5383 	ldw x,#user_space 
      0099D6 A6 04            [ 1] 5384 	ld a,#TK_INTGR 
      0099D6 CE               [ 4] 5385 	ret 
                                   5386 
                                   5387 
                                   5388 ;---------------------
                                   5389 ; BASIC: USR(addr[,arg])
                                   5390 ; execute a function written 
                                   5391 ; in binary code.
                                   5392 ; binary fonction should 
                                   5393 ; return token attribute in A 
                                   5394 ; and value in X. 
                                   5395 ; input:
                                   5396 ;   addr	routine address 
                                   5397 ;   arg 	is an optional argument 
                                   5398 ; output:
                                   5399 ;   A 		token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5400 ;   X       returned value 
                                   5401 ;---------------------
      001BF8                       5402 usr:
      0099D7 00 21            [ 2] 5403 	pushw y 	
      0099D9 72 B0 00         [ 4] 5404 	call func_args 
      0099DC 1F 26            [ 1] 5405 	cp a,#1 
      0099DE 05 A6            [ 1] 5406 	jreq 2$
      0099E0 0D CC            [ 1] 5407 	cp a,#2
      0099E2 87 DF            [ 1] 5408 	jreq 2$  
      0099E4 CC 07 5D         [ 2] 5409 	jp syntax_error 
      0099E4 52 04            [ 2] 5410 2$: popw y  ; arg|addr 
      0099E6 1F 01            [ 1] 5411 	cp a,#1
      0099E8 CD 88            [ 1] 5412 	jreq 3$
      0099EA 90               [ 2] 5413 	popw x ; addr
      0099EB A1               [ 1] 5414 	exgw x,y 
      0099EC 02 27            [ 4] 5415 3$: call (y)
      0099EE 03 CC            [ 2] 5416 	popw y 
      0099F0 87               [ 4] 5417 	ret 
                                   5418 
                                   5419 ;------------------------------
                                   5420 ; BASIC: BYE 
                                   5421 ; halt mcu in its lowest power mode 
                                   5422 ; wait for reset or external interrupt
                                   5423 ; do a cold start on wakeup.
                                   5424 ;------------------------------
      001C15                       5425 bye:
      0099F1 DD 0D 52 30 FB   [ 2] 5426 	btjf UART1_SR,#UART_SR_TC,.
      0099F2 8E               [10] 5427 	halt
      0099F2 1F 03 55         [ 2] 5428 	jp cold_start  
                                   5429 
                                   5430 ;----------------------------------
                                   5431 ; BASIC: AUTORUN ["file_name"] 
                                   5432 ; record in eeprom at adrress AUTORUN_NAME
                                   5433 ; the name of file to load and execute
                                   5434 ; at startup. 
                                   5435 ; empty string delete autorun name 
                                   5436 ; no argument display autorun name  
                                   5437 ; input:
                                   5438 ;   file_name   file to execute 
                                   5439 ; output:
                                   5440 ;   none
                                   5441 ;-----------------------------------
      001C1E                       5442 autorun: 
      0099F5 00 04 00 02 CD   [ 2] 5443 	btjf flags,#FRUN,0$ 
      0099FA 82 8B            [ 1] 5444 	jreq 0$ 
      0099FC 1C 00            [ 1] 5445 	ld a,#ERR_CMD_ONLY 
      0099FE 03 72 FB         [ 2] 5446 	jp tb_error 
      001C2A                       5447 0$:	
      009A01 01 72 5D         [ 4] 5448 	call next_token
      009A04 00 1C            [ 1] 5449 	jrne 1$
      009A06 26 0B 72         [ 2] 5450 	ldw x,#AUTORUN_NAME
      009A09 B0 00 1D         [ 4] 5451 	call puts 
      009A0C 23               [ 1] 5452 	clr a 
      009A0D 05               [ 4] 5453 	ret 
      001C37                       5454 1$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009A0E A6 0E            [ 1] 5455 	cp a,#TK_QSTR
      009A10 CC 87            [ 1] 5456 	jreq 2$
      009A12 DF 07 5D         [ 2] 5457 	jp syntax_error 
      009A13                       5458 2$:	
      009A13 16               [ 1] 5459 	tnz (x) 
      009A14 03 CD            [ 1] 5460 	jrne 3$
                                   5461 ; empty string, delete autorun 	
      009A16 99 81 24         [ 4] 5462 	call cancel_autorun
      009A19 05 A6 08 CC      [ 1] 5463 	clr count 
      009A1D 87               [ 4] 5464 	ret 
      009A1E DF               [ 2] 5465 3$:	pushw x 
      009A1F 90 93            [ 1] 5466 	ldw y,x  
      009A1F CE 00 1C         [ 4] 5467 	call search_file 
      009A22 C6 00            [ 1] 5468 	jrc 4$ 
      009A24 1E CF            [ 1] 5469 	ld a,#ERR_NOT_FILE
      009A26 00 19 C7         [ 2] 5470 	jp tb_error  
      001C56                       5471 4$: 
      009A29 00 1B 1E 03 CD   [ 1] 5472 	mov in,count 
      009A2E 82 8B 5C 1F      [ 1] 5473 	clr farptr 
      009A32 01 5F 16         [ 2] 5474 	ldw x,#AUTORUN_NAME
      009A35 03 CD 81         [ 2] 5475 	ldw farptr+1,x 
      009A38 E6 CE            [ 2] 5476 	ldw x,(1,sp)  
      009A3A 00 21 72         [ 4] 5477 	call strlen  ; return length in X 
      009A3D B0               [ 2] 5478 	incw x 
      009A3E 00 1F            [ 2] 5479 	popw y 
      009A40 1F               [ 2] 5480 	pushw x 
      009A41 01               [ 1] 5481 	clrw x 
      009A42 5F 7B 01         [ 4] 5482 	call write_block 
      001C72                       5483 	_drop 2 
      009A45 CD 81            [ 2]    1     addw sp,#2 
      009A47 71               [ 4] 5484 	ret 
                                   5485 
                                   5486 ;----------------------------------
                                   5487 ; BASIC: SLEEP 
                                   5488 ; halt mcu until reset or external
                                   5489 ; interrupt.
                                   5490 ; Resume progam after SLEEP command
                                   5491 ;----------------------------------
      001C75                       5492 sleep:
      009A48 5C 7B 02 CD 81   [ 2] 5493 	btjf UART1_SR,#UART_SR_TC,.
      009A4D 71 5C CD 99      [ 1] 5494 	bset flags,#FSLEEP
      009A51 15               [10] 5495 	halt 
      009A52 1E               [ 4] 5496 	ret 
                                   5497 
                                   5498 ;-------------------------------
                                   5499 ; BASIC: PAUSE expr 
                                   5500 ; suspend execution for n msec.
                                   5501 ; input:
                                   5502 ;	none
                                   5503 ; output:
                                   5504 ;	none 
                                   5505 ;------------------------------
      001C80                       5506 pause:
      009A53 01 89 5F         [ 4] 5507 	call expression
      009A56 90 CE            [ 1] 5508 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009A58 00 1F            [ 1] 5509 	jreq pause02 
      009A5A CD 81 E6         [ 2] 5510 	jp syntax_error
      001C8A                       5511 pause02: 
      009A5D 5B               [ 2] 5512 1$: tnzw x 
      009A5E 02 AE            [ 1] 5513 	jreq 2$
      009A60 00               [10] 5514 	wfi 
      009A61 01               [ 2] 5515 	decw x 
      009A62 A6 FF            [ 1] 5516 	jrne 1$
      009A64 CD               [ 1] 5517 2$:	clr a 
      009A65 81               [ 4] 5518 	ret 
                                   5519 
                                   5520 ;------------------------------
                                   5521 ; BASIC: AWU expr
                                   5522 ; halt mcu for 'expr' milliseconds
                                   5523 ; use Auto wakeup peripheral
                                   5524 ; all oscillators stopped except LSI
                                   5525 ; range: 1ms - 511ms
                                   5526 ; input:
                                   5527 ;  none
                                   5528 ; output:
                                   5529 ;  none:
                                   5530 ;------------------------------
      001C93                       5531 awu:
      009A66 71 CD 99         [ 4] 5532   call expression
      009A69 15 CE            [ 1] 5533   cp a,#TK_INTGR
      009A6B 00 19            [ 1] 5534   jreq awu02
      009A6D C6 00 1B         [ 2] 5535   jp syntax_error
      001C9D                       5536 awu02:
      009A70 CF 00 1C         [ 2] 5537   cpw x,#5120
      009A73 C7 00            [ 1] 5538   jrmi 1$ 
      009A75 1E 5F 4B 04      [ 1] 5539   mov AWU_TBR,#15 
      009A79 A6 1E            [ 1] 5540   ld a,#30
      009A79 4F               [ 2] 5541   div x,a
      009A7A CD 81            [ 1] 5542   ld a,#16
      009A7C 71               [ 2] 5543   div x,a 
      009A7D 5C 0A            [ 2] 5544   jra 4$
      001CAE                       5545 1$: 
      009A7F 01 26 F7         [ 2] 5546   cpw x,#2048
      009A82 84 1E            [ 1] 5547   jrmi 2$ 
      009A84 01 CD 89 29      [ 1] 5548   mov AWU_TBR,#14
      009A88 5B 04            [ 1] 5549   ld a,#80
      009A8A 81               [ 2] 5550   div x,a 
      009A8B 20 10            [ 2] 5551   jra 4$   
      001CBC                       5552 2$:
      009A8B CD 99 15 CD      [ 1] 5553   mov AWU_TBR,#7
      001CC0                       5554 3$:  
                                   5555 ; while X > 64  divide by 2 and increment AWU_TBR 
      009A8F 86 7F 5F         [ 2] 5556   cpw x,#64 
      009A92 92 AF            [ 2] 5557   jrule 4$ 
      009A94 00 19 90 95      [ 1] 5558   inc AWU_TBR 
      009A98 5C               [ 2] 5559   srlw x 
      009A99 92 AF            [ 2] 5560   jra 3$ 
      001CCC                       5561 4$:
      009A9B 00               [ 1] 5562   ld a, xl
      009A9C 19               [ 1] 5563   dec a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009A9D 5C 90            [ 1] 5564   jreq 5$
      009A9F 97               [ 1] 5565   dec a 	
      001CD1                       5566 5$: 
      009AA0 72 B9            [ 1] 5567   and a,#0x3e 
      009AA2 00 1F 90         [ 1] 5568   ld AWU_APR,a 
      009AA5 CF 00 21 90      [ 1] 5569   bset AWU_CSR,#AWU_CSR_AWUEN
      009AA9 CE               [10] 5570   halt 
                                   5571 
      009AAA 00               [ 4] 5572   ret 
                                   5573 
                                   5574 ;------------------------------
                                   5575 ; BASIC: TICKS
                                   5576 ; return msec ticks counter value 
                                   5577 ; input:
                                   5578 ; 	none 
                                   5579 ; output:
                                   5580 ;	X 		TK_INTGR
                                   5581 ;-------------------------------
      001CDC                       5582 get_ticks:
      009AAB 1F 00 10         [ 2] 5583 	ldw x,ticks 
      009AAC A6 04            [ 1] 5584 	ld a,#TK_INTGR
      009AAC 92               [ 4] 5585 	ret 
                                   5586 
                                   5587 
                                   5588 
                                   5589 ;------------------------------
                                   5590 ; BASIC: ABS(expr)
                                   5591 ; return absolute value of expr.
                                   5592 ; input:
                                   5593 ;   none
                                   5594 ; output:
                                   5595 ;   X     	positive integer
                                   5596 ;-------------------------------
      001CE2                       5597 abs:
      009AAD AF 00 19         [ 4] 5598 	call func_args 
      009AB0 90 F7            [ 1] 5599 	cp a,#1 
      009AB2 5C 90            [ 1] 5600 	jreq 0$ 
      009AB4 5C 90 C3         [ 2] 5601 	jp syntax_error
      001CEC                       5602 0$:  
      009AB7 00               [ 2] 5603     popw x   
      009AB8 21               [ 1] 5604 	ld a,xh 
      009AB9 2B F1            [ 1] 5605 	bcp a,#0x80 
      009ABB 81 01            [ 1] 5606 	jreq 2$ 
      009ABC 50               [ 2] 5607 	negw x 
      009ABC 72 01            [ 1] 5608 2$: ld a,#TK_INTGR 
      009ABE 00               [ 4] 5609 	ret 
                                   5610 
                                   5611 ;------------------------------
                                   5612 ; BASIC: AND(expr1,expr2)
                                   5613 ; Apply bit AND relation between
                                   5614 ; the 2 arguments, i.e expr1 & expr2 
                                   5615 ; output:
                                   5616 ; 	A 		TK_INTGR
                                   5617 ;   X 		result 
                                   5618 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001CF6                       5619 bit_and:
      009ABF 26 07 27         [ 4] 5620 	call func_args 
      009AC2 05 A6            [ 1] 5621 	cp a,#2
      009AC4 07 CC            [ 1] 5622 	jreq 1$
      009AC6 87 DF 5D         [ 2] 5623 	jp syntax_error 
      009AC8 85               [ 2] 5624 1$:	popw x 
      009AC8 CD               [ 1] 5625 	ld a,xh 
      009AC9 88 90            [ 1] 5626 	and a,(1,sp)
      009ACB A1               [ 1] 5627 	ld xh,a 
      009ACC 02               [ 1] 5628 	ld a,xl
      009ACD 27 03            [ 1] 5629 	and a,(2,sp)
      009ACF CC               [ 1] 5630 	ld xl,a 
      001D09                       5631 	_drop 2 
      009AD0 87 DD            [ 2]    1     addw sp,#2 
      009AD2 90 93            [ 1] 5632 	ld a,#TK_INTGR
      009AD4 55               [ 4] 5633 	ret
                                   5634 
                                   5635 ;------------------------------
                                   5636 ; BASIC: OR(expr1,expr2)
                                   5637 ; Apply bit OR relation between
                                   5638 ; the 2 arguments, i.e expr1 | expr2 
                                   5639 ; output:
                                   5640 ; 	A 		TK_INTGR
                                   5641 ;   X 		result 
                                   5642 ;------------------------------
      001D0E                       5643 bit_or:
      009AD5 00 04 00         [ 4] 5644 	call func_args 
      009AD8 02 CD            [ 1] 5645 	cp a,#2
      009ADA 99 81            [ 1] 5646 	jreq 1$
      009ADC 25 05 A6         [ 2] 5647 	jp syntax_error 
      001D18                       5648 1$: 
      009ADF 09               [ 2] 5649 	popw x 
      009AE0 CC               [ 1] 5650 	ld a,xh 
      009AE1 87 DF            [ 1] 5651 	or a,(1,sp)
      009AE3 95               [ 1] 5652 	ld xh,a 
      009AE3 CD               [ 1] 5653 	ld a,xl 
      009AE4 9A 8B            [ 1] 5654 	or a,(2,sp)
      009AE6 CE               [ 1] 5655 	ld xl,a 
      001D21                       5656 	_drop 2 
      009AE7 00 21            [ 2]    1     addw sp,#2 
      009AE9 72 B0            [ 1] 5657 	ld a,#TK_INTGR 
      009AEB 00               [ 4] 5658 	ret
                                   5659 
                                   5660 ;------------------------------
                                   5661 ; BASIC: XOR(expr1,expr2)
                                   5662 ; Apply bit XOR relation between
                                   5663 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5664 ; output:
                                   5665 ; 	A 		TK_INTGR
                                   5666 ;   X 		result 
                                   5667 ;------------------------------
      001D26                       5668 bit_xor:
      009AEC 1F CD 89         [ 4] 5669 	call func_args 
      009AEF 29 81            [ 1] 5670 	cp a,#2
      009AF1 27 03            [ 1] 5671 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009AF1 CD 88 90         [ 2] 5672 	jp syntax_error 
      001D30                       5673 1$: 
      009AF4 A1               [ 2] 5674 	popw x 
      009AF5 00               [ 1] 5675 	ld a,xh 
      009AF6 27 20            [ 1] 5676 	xor a,(1,sp)
      009AF8 A1               [ 1] 5677 	ld xh,a 
      009AF9 02               [ 1] 5678 	ld a,xl 
      009AFA 27 03            [ 1] 5679 	xor a,(2,sp)
      009AFC CC               [ 1] 5680 	ld xl,a 
      001D39                       5681 	_drop 2 
      009AFD 87 DD            [ 2]    1     addw sp,#2 
      009AFF 90 93            [ 1] 5682 	ld a,#TK_INTGR 
      009B01 55               [ 4] 5683 	ret 
                                   5684 
                                   5685 ;------------------------------
                                   5686 ; BASIC: LSHIFT(expr1,expr2)
                                   5687 ; logical shift left expr1 by 
                                   5688 ; expr2 bits 
                                   5689 ; output:
                                   5690 ; 	A 		TK_INTGR
                                   5691 ;   X 		result 
                                   5692 ;------------------------------
      001D3E                       5693 lshift:
      009B02 00 04 00         [ 4] 5694 	call func_args
      009B05 02 CD            [ 1] 5695 	cp a,#2 
      009B07 99 81            [ 1] 5696 	jreq 1$
      009B09 25 05 A6         [ 2] 5697 	jp syntax_error
      009B0C 09 CC            [ 2] 5698 1$: popw y   
      009B0E 87               [ 2] 5699 	popw x 
      009B0F DF 5D            [ 2] 5700 	tnzw y 
      009B10 27 05            [ 1] 5701 	jreq 4$
      009B10 CE               [ 2] 5702 2$:	sllw x 
      009B11 00 19            [ 2] 5703 	decw y 
      009B13 C6 00            [ 1] 5704 	jrne 2$
      001D54                       5705 4$:  
      009B15 1B 20            [ 1] 5706 	ld a,#TK_INTGR
      009B17 0A               [ 4] 5707 	ret
                                   5708 
                                   5709 ;------------------------------
                                   5710 ; BASIC: RSHIFT(expr1,expr2)
                                   5711 ; logical shift right expr1 by 
                                   5712 ; expr2 bits.
                                   5713 ; output:
                                   5714 ; 	A 		TK_INTGR
                                   5715 ;   X 		result 
                                   5716 ;------------------------------
      009B18                       5717 rshift:
      009B18 AE 01 00         [ 4] 5718 	call func_args
      009B1B 4F CF            [ 1] 5719 	cp a,#2 
      009B1D 00 19            [ 1] 5720 	jreq 1$
      009B1F C7 00 1B         [ 2] 5721 	jp syntax_error
      009B22 90 85            [ 2] 5722 1$: popw y  
      009B22 CF               [ 2] 5723 	popw x
      009B23 00 1C            [ 2] 5724 	tnzw y 
      009B25 C7 00            [ 1] 5725 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009B27 1E               [ 2] 5726 2$:	srlw x 
      009B28 4B 04            [ 2] 5727 	decw y 
      009B2A 5F FB            [ 1] 5728 	jrne 2$
      009B2B                       5729 4$:  
      009B2B 4F CD            [ 1] 5730 	ld a,#TK_INTGR
      009B2D 81               [ 4] 5731 	ret
                                   5732 
                                   5733 ;--------------------------
                                   5734 ; BASIC: FCPU integer
                                   5735 ; set CPU frequency 
                                   5736 ;-------------------------- 
                                   5737 
      001D70                       5738 fcpu:
      009B2E 71 5C            [ 1] 5739 	ld a,#TK_INTGR
      009B30 0A 01 26         [ 4] 5740 	call expect 
      009B33 F7               [ 1] 5741 	ld a,xl 
      009B34 84 81            [ 1] 5742 	and a,#7 
      009B36 C7 50 C6         [ 1] 5743 	ld CLK_CKDIVR,a 
      009B36 52               [ 4] 5744 	ret 
                                   5745 
                                   5746 ;------------------------------
                                   5747 ; BASIC: PMODE pin#, mode 
                                   5748 ; Arduino pin. 
                                   5749 ; define pin as input or output
                                   5750 ; pin#: {0..15}
                                   5751 ; mode: INPUT|OUTPUT  
                                   5752 ;------------------------------
                           000001  5753 	PINNO=1
                           000001  5754 	VSIZE=1
      001D7C                       5755 pin_mode:
      001D7C                       5756 	_vars VSIZE 
      009B37 02 5F            [ 2]    1     sub sp,#VSIZE 
      009B39 1F 01 CF         [ 4] 5757 	call arg_list 
      009B3C 00 1A            [ 1] 5758 	cp a,#2 
      009B3E 35 01            [ 1] 5759 	jreq 1$
      009B40 00 19 5D         [ 2] 5760 	jp syntax_error 
      009B42 90 85            [ 2] 5761 1$: popw y ; mode 
      009B42 5F               [ 2] 5762 	popw x ; Dx pin 
      009B43 92 AF 00         [ 4] 5763 	call select_pin 
      009B46 19 27            [ 1] 5764 	ld (PINNO,sp),a  
      009B48 39 01            [ 1] 5765 	ld a,#1 
      009B49 0D 01            [ 1] 5766 	tnz (PINNO,sp)
      009B49 92 AF            [ 1] 5767 	jreq 4$
      009B4B 00               [ 1] 5768 2$:	sll a 
      009B4C 19 27            [ 1] 5769 	dec (PINNO,sp)
      009B4E 06 CD            [ 1] 5770 	jrne 2$ 
      009B50 82 44            [ 1] 5771 	ld (PINNO,sp),a
      009B52 5C 20            [ 1] 5772 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009B54 F4 5C            [ 1] 5773 	ld (GPIO_CR1,x),a 
      009B56 A6 20 CD 82      [ 2] 5774 4$:	cpw y,#OUTP 
      009B5A 44 92            [ 1] 5775 	jreq 6$
                                   5776 ; input mode
      009B5C AF 00            [ 1] 5777 	ld a,(PINNO,sp)
      009B5E 19               [ 1] 5778 	cpl a 
      009B5F 90 95            [ 1] 5779 	and a,(GPIO_DDR,x)	; bit==0 for input. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009B61 5C 92            [ 2] 5780 	jra 9$
      001DAE                       5781 6$: ;output mode  
      009B63 AF 00            [ 1] 5782 	ld a,(PINNO,sp)
      009B65 19 5C            [ 1] 5783 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009B67 90 97            [ 1] 5784 	ld (GPIO_CR2,x),a 
      009B69 90 89            [ 1] 5785 	ld a,(PINNO,sp)
      009B6B 72 FB            [ 1] 5786 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009B6D 01 5C            [ 1] 5787 9$:	ld (GPIO_DDR,x),a 
      001DBA                       5788 	_drop VSIZE 
      009B6F CD 99            [ 2]    1     addw sp,#VSIZE 
      009B71 15               [ 4] 5789 	ret
                                   5790 
                                   5791 ;------------------------
                                   5792 ; select Arduino pin 
                                   5793 ; input:
                                   5794 ;   X 	 {0..15} Arduino Dx 
                                   5795 ; output:
                                   5796 ;   A     stm8s208 pin 
                                   5797 ;   X     base address s208 GPIO port 
                                   5798 ;---------------------------
      001DBD                       5799 select_pin:
      009B72 85               [ 2] 5800 	sllw x 
      009B73 CD 89 29         [ 2] 5801 	addw x,#arduino_to_8s208 
      009B76 A6               [ 2] 5802 	ldw x,(x)
      009B77 0D               [ 1] 5803 	ld a,xl 
      009B78 CD               [ 1] 5804 	push a 
      009B79 82               [ 1] 5805 	swapw x 
      009B7A 44 1E            [ 1] 5806 	ld a,#5 
      009B7C 01               [ 4] 5807 	mul x,a 
      009B7D 5C 1F 01         [ 2] 5808 	addw x,#GPIO_BASE 
      009B80 20               [ 1] 5809 	pop a 
      009B81 C0               [ 4] 5810 	ret 
                                   5811 ; translation from Arduino D0..D15 to stm8s208rb 
      009B82                       5812 arduino_to_8s208:
      009B82 1E 01                 5813 .byte 3,6 ; D0 
      009B84 CD 89                 5814 .byte 3,5 ; D1 
      009B86 29 AE                 5815 .byte 4,0 ; D2 
      009B88 9B B7                 5816 .byte 2,1 ; D3
      009B8A CD 82                 5817 .byte 6,0 ; D4
      009B8C 57 A6                 5818 .byte 2,2 ; D5
      009B8E FF C0                 5819 .byte 2,3 ; D6
      009B90 00 1E                 5820 .byte 3,1 ; D7
      009B92 C7 00                 5821 .byte 3,3 ; D8
      009B94 0E A6                 5822 .byte 2,4 ; D9
      009B96 7F C2                 5823 .byte 4,5 ; D10
      009B98 00 1D                 5824 .byte 2,6 ; D11
      009B9A C7 00                 5825 .byte 2,7 ; D12
      009B9C 0D A6                 5826 .byte 2,5 ; D13
      009B9E 02 C2                 5827 .byte 4,2 ; D14
      009BA0 00 1C                 5828 .byte 4,1 ; D15
                                   5829 
                                   5830 
                                   5831 ;------------------------------
                                   5832 ; BASIC: RND(expr)
                                   5833 ; return random number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5834 ; between 1 and expr inclusive
                                   5835 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5836 ; input:
                                   5837 ; 	none 
                                   5838 ; output:
                                   5839 ;	X 		random positive integer 
                                   5840 ;------------------------------
      001DED                       5841 random:
      009BA2 C7 00 0C         [ 4] 5842 	call func_args 
      009BA5 5F A6            [ 1] 5843 	cp a,#1
      009BA7 06 97            [ 1] 5844 	jreq 1$
      009BA9 A6 0A CD         [ 2] 5845 	jp syntax_error
      001DF7                       5846 1$:  
      009BAC 88 E1            [ 1] 5847 	ld a,#0x80 
      009BAE AE 9B            [ 1] 5848 	bcp a,(1,sp)
      009BB0 BF CD            [ 1] 5849 	jreq 2$
      009BB2 82 57            [ 1] 5850 	ld a,#ERR_BAD_VALUE
      009BB4 5B 02 81         [ 2] 5851 	jp tb_error
      001E02                       5852 2$: 
                                   5853 ; acc16=(x<<5)^x 
      009BB7 20 66 69         [ 2] 5854 	ldw x,seedx 
      009BBA 6C               [ 2] 5855 	sllw x 
      009BBB 65               [ 2] 5856 	sllw x 
      009BBC 73               [ 2] 5857 	sllw x 
      009BBD 0A               [ 2] 5858 	sllw x 
      009BBE 00               [ 2] 5859 	sllw x 
      009BBF 20               [ 1] 5860 	ld a,xh 
      009BC0 62 79 74         [ 1] 5861 	xor a,seedx 
      009BC3 65 73 20         [ 1] 5862 	ld acc16,a 
      009BC6 66               [ 1] 5863 	ld a,xl 
      009BC7 72 65 65         [ 1] 5864 	xor a,seedx+1 
      009BCA 0A 00 0D         [ 1] 5865 	ld acc8,a 
                                   5866 ; seedx=seedy 
      009BCC CE 00 16         [ 2] 5867 	ldw x,seedy 
      009BCC 52 02 72         [ 2] 5868 	ldw seedx,x  
                                   5869 ; seedy=seedy^(seedy>>1)
      009BCF 5F 00            [ 2] 5870 	srlw y 
      009BD1 19 CD            [ 1] 5871 	ld a,yh 
      009BD3 90 66 A1         [ 1] 5872 	xor a,seedy 
      009BD6 04 27 03         [ 1] 5873 	ld seedy,a  
      009BD9 CC 87            [ 1] 5874 	ld a,yl 
      009BDB DD 1F 01         [ 1] 5875 	xor a,seedy+1 
      009BDE CD 88 90         [ 1] 5876 	ld seedy+1,a 
                                   5877 ; acc16>>3 
      009BE1 A1 0D 27         [ 2] 5878 	ldw x,acc16 
      009BE4 02               [ 2] 5879 	srlw x 
      009BE5 20               [ 2] 5880 	srlw x 
      009BE6 19               [ 2] 5881 	srlw x 
                                   5882 ; x=acc16^x 
      009BE7 CD               [ 1] 5883 	ld a,xh 
      009BE8 90 66 A1         [ 1] 5884 	xor a,acc16 
      009BEB 04               [ 1] 5885 	ld xh,a 
      009BEC 27               [ 1] 5886 	ld a,xl 
      009BED 03 CC 87         [ 1] 5887 	xor a,acc8 
      009BF0 DD               [ 1] 5888 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5889 ; seedy=x^seedy 
      009BF1 9F 1E 01         [ 1] 5890 	xor a,seedy+1
      009BF4 CF               [ 1] 5891 	ld xl,a 
      009BF5 00               [ 1] 5892 	ld a,xh 
      009BF6 1A 5F CD         [ 1] 5893 	xor a,seedy
      009BF9 81               [ 1] 5894 	ld xh,a 
      009BFA 71 1E 01         [ 2] 5895 	ldw seedy,x 
                                   5896 ; return seedy modulo expr + 1 
      009BFD 5C 20            [ 2] 5897 	popw y 
      009BFF DC               [ 2] 5898 	divw x,y 
      009C00 93               [ 1] 5899 	ldw x,y 
      009C00 5B               [ 2] 5900 	incw x 
      001E51                       5901 10$:
      009C01 02 81            [ 1] 5902 	ld a,#TK_INTGR
      009C03 81               [ 4] 5903 	ret 
                                   5904 
                                   5905 ;---------------------------------
                                   5906 ; BASIC: WORDS 
                                   5907 ; affiche la listes des mots du
                                   5908 ; dictionnaire ainsi que le nombre
                                   5909 ; de mots.
                                   5910 ;---------------------------------
                           000001  5911 	WLEN=1 ; word length
                           000002  5912 	LLEN=2 ; character sent to console
                           000003  5913 	WCNT=3 ; count words printed 
                           000003  5914 	VSIZE=3 
      001E54                       5915 words:
      001E54                       5916 	_vars VSIZE
      009C03 CD 8F            [ 2]    1     sub sp,#VSIZE 
      009C05 81 A1            [ 1] 5917 	clr (LLEN,sp)
      009C07 01 27            [ 1] 5918 	clr (WCNT,sp)
      009C09 03 CC 87 DD      [ 2] 5919 	ldw y,#kword_dict+2
      009C0D 85               [ 1] 5920 0$:	ldw x,y
      009C0E 9F               [ 1] 5921 	ld a,(x)
      009C0F A4 7F            [ 1] 5922 	and a,#15 
      009C11 97 A6            [ 1] 5923 	ld (WLEN,sp),a 
      009C13 03 81            [ 1] 5924 	inc (WCNT,sp)
      009C15 5C               [ 2] 5925 1$:	incw x 
      009C15 A6               [ 1] 5926 	ld a,(x)
      009C16 0B CD 8F         [ 4] 5927 	call putc 
      009C19 4D CD            [ 1] 5928 	inc (LLEN,sp)
      009C1B 88 90            [ 1] 5929 	dec (WLEN,sp)
      009C1D A1 02            [ 1] 5930 	jrne 1$
      009C1F 27 07            [ 1] 5931 	ld a,#70
      009C21 A1 03            [ 1] 5932 	cp a,(LLEN,sp)
      009C23 27 06            [ 1] 5933 	jrmi 2$   
      009C25 CC 87            [ 1] 5934 	ld a,#SPACE 
      009C27 DD 01 C4         [ 4] 5935 	call putc 
      009C28 0C 02            [ 1] 5936 	inc (LLEN,sp) 
      009C28 F6 5F            [ 2] 5937 	jra 3$
      009C2A 97 0D            [ 1] 5938 2$: ld a,#CR 
      009C2B CD 01 C4         [ 4] 5939 	call putc 
      009C2B 89 A6            [ 1] 5940 	clr (LLEN,sp)
      009C2D 0C CD 8F 4D      [ 2] 5941 3$:	subw y,#2 
      009C31 85 A6            [ 2] 5942 	ldw y,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009C33 04 81            [ 1] 5943 	jrne 0$ 
      009C35 A6 0D            [ 1] 5944 	ld a,#CR 
      009C35 CD 82 4D         [ 4] 5945 	call putc  
      009C38 5F               [ 1] 5946 	clrw x 
      009C39 97 A6            [ 1] 5947 	ld a,(WCNT,sp)
      009C3B 04               [ 1] 5948 	ld xl,a 
      009C3C 81 08 A9         [ 4] 5949 	call print_int 
      009C3D AE 1E A4         [ 2] 5950 	ldw x,#words_count_msg
      009C3D 5F 72 5D         [ 4] 5951 	call puts 
      001EA1                       5952 	_drop VSIZE 
      009C40 00 28            [ 2]    1     addw sp,#VSIZE 
      009C42 27               [ 4] 5953 	ret 
      009C43 01 53 A6 04 81 73 20  5954 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5955 
                                   5956 
                                   5957 ;-----------------------------
                                   5958 ; BASIC: TIMER expr 
                                   5959 ; initialize count down timer 
                                   5960 ;-----------------------------
      009C48                       5961 set_timer:
      009C48 CD 8F 81         [ 4] 5962 	call arg_list
      009C4B A1 02            [ 1] 5963 	cp a,#1 
      009C4D 27 03            [ 1] 5964 	jreq 1$
      009C4F CC 87 DD         [ 2] 5965 	jp syntax_error
      009C52                       5966 1$: 
      009C52 1E               [ 2] 5967 	popw x 
      009C53 03 2B 17         [ 2] 5968 	ldw timer,x 
      009C56 A3               [ 4] 5969 	ret 
                                   5970 
                                   5971 ;------------------------------
                                   5972 ; BASIC: TIMEOUT 
                                   5973 ; return state of timer 
                                   5974 ;------------------------------
      001EC9                       5975 timeout:
      009C57 00 09 2A         [ 2] 5976 	ldw x,timer 
      001ECC                       5977 logical_complement:
      009C5A 12               [ 2] 5978 	cplw x 
      009C5B A6 05 42         [ 2] 5979 	cpw x,#-1
      009C5E 1C 50            [ 1] 5980 	jreq 2$
      009C60 00               [ 1] 5981 	clrw x 
      009C61 1F 03            [ 1] 5982 2$:	ld a,#TK_INTGR
      009C63 1E               [ 4] 5983 	ret 
                                   5984 
                                   5985 ;--------------------------------
                                   5986 ; BASIC NOT(expr) 
                                   5987 ; return logical complement of expr
                                   5988 ;--------------------------------
      001ED6                       5989 func_not:
      009C64 01 72 FB         [ 4] 5990 	call func_args  
      009C67 03 A6            [ 1] 5991 	cp a,#1
      009C69 04 5B            [ 1] 5992 	jreq 1$
      009C6B 04 81 5D         [ 2] 5993 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009C6D 85               [ 2] 5994 1$:	popw x 
      009C6D A6 0A            [ 2] 5995 	jra logical_complement
                                   5996 
                                   5997 
                                   5998 
                                   5999 ;-----------------------------------
                                   6000 ; BASIC: IWDGEN expr1 
                                   6001 ; enable independant watchdog timer
                                   6002 ; expr1 is delay in multiple of 62.5µsec
                                   6003 ; expr1 -> {1..16383}
                                   6004 ;-----------------------------------
      001EE3                       6005 enable_iwdg:
      009C6F CC 87 DF         [ 4] 6006 	call arg_list
      009C72 A1 01            [ 1] 6007 	cp a,#1 
      009C72 AE A6            [ 1] 6008 	jreq 1$
      009C74 00 A6 04         [ 2] 6009 	jp syntax_error 
      009C77 81               [ 2] 6010 1$: popw x 
      009C78 4B 00            [ 1] 6011 	push #0
      009C78 90 89 CD 8F      [ 1] 6012 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009C7C 81               [ 1] 6013 	ld a,xh 
      009C7D A1 01            [ 1] 6014 	and a,#0x3f
      009C7F 27               [ 1] 6015 	ld xh,a  
      009C80 07 A1 02         [ 2] 6016 2$:	cpw x,#255
      009C83 27 03            [ 2] 6017 	jrule 3$
      009C85 CC 87            [ 1] 6018 	inc (1,sp)
      009C87 DD               [ 1] 6019 	rcf 
      009C88 90               [ 2] 6020 	rrcw x 
      009C89 85 A1            [ 2] 6021 	jra 2$
      009C8B 01 27 02 85      [ 1] 6022 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C8F 51               [ 1] 6023 	pop a  
      009C90 90 FD 90         [ 1] 6024 	ld IWDG_PR,a 
      009C93 85               [ 1] 6025 	ld a,xl
      009C94 81               [ 1] 6026 	dec a 
      009C95 35 55 50 E0      [ 1] 6027 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009C95 72 0D 52         [ 1] 6028 	ld IWDG_RLR,a 
      009C98 30 FB 8E CC      [ 1] 6029 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009C9C 85               [ 4] 6030 	ret 
                                   6031 
                                   6032 
                                   6033 ;-----------------------------------
                                   6034 ; BASIC: IWDGREF  
                                   6035 ; refresh independant watchdog count down 
                                   6036 ; timer before it reset MCU. 
                                   6037 ;-----------------------------------
      001F19                       6038 refresh_iwdg:
      009C9D 6D AA 50 E0      [ 1] 6039 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009C9E 81               [ 4] 6040 	ret 
                                   6041 
                                   6042 
                                   6043 ;-------------------------------------
                                   6044 ; BASIC: LOG(expr)
                                   6045 ; return logarithm base 2 of expr 
                                   6046 ; this is the position of most significant
                                   6047 ; bit set. 
                                   6048 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6049 ; output:
                                   6050 ;   X     log2 
                                   6051 ;   A     TK_INTGR 
                                   6052 ;*********************************
      001F1E                       6053 log2:
      009C9E 72 01 00         [ 4] 6054 	call func_args 
      009CA1 26 07            [ 1] 6055 	cp a,#1 
      009CA3 27 05            [ 1] 6056 	jreq 1$
      009CA5 A6 07 CC         [ 2] 6057 	jp syntax_error 
      009CA8 87               [ 2] 6058 1$: popw x 
      001F29                       6059 leading_one:
      009CA9 DF               [ 2] 6060 	tnzw x 
      009CAA 27 0A            [ 1] 6061 	jreq 4$
      009CAA CD 88            [ 1] 6062 	ld a,#15 
      009CAC 90               [ 2] 6063 2$: rlcw x 
      009CAD 26 08            [ 1] 6064     jrc 3$
      009CAF AE               [ 1] 6065 	dec a 
      009CB0 40 00            [ 2] 6066 	jra 2$
      009CB2 CD               [ 1] 6067 3$: clrw x 
      009CB3 82               [ 1] 6068     ld xl,a
      009CB4 57 4F            [ 1] 6069 4$:	ld a,#TK_INTGR
      009CB6 81               [ 4] 6070 	ret 
                                   6071 
                                   6072 ;-----------------------------------
                                   6073 ; BASIC: BIT(expr) 
                                   6074 ; expr ->{0..15}
                                   6075 ; return 2^expr 
                                   6076 ; output:
                                   6077 ;    x    2^expr 
                                   6078 ;-----------------------------------
      009CB7                       6079 bitmask:
      009CB7 A1 02 27         [ 4] 6080     call func_args 
      009CBA 03 CC            [ 1] 6081 	cp a,#1
      009CBC 87 DD            [ 1] 6082 	jreq 1$
      009CBE CC 07 5D         [ 2] 6083 	jp syntax_error 
      009CBE 7D               [ 2] 6084 1$: popw x 
      009CBF 26               [ 1] 6085 	ld a,xl 
      009CC0 08 CD            [ 1] 6086 	and a,#15
      009CC2 86               [ 1] 6087 	clrw x 
      009CC3 32               [ 2] 6088 	incw x 
      009CC4 72               [ 1] 6089 2$: tnz a 
      009CC5 5F 00            [ 1] 6090 	jreq 3$
      009CC7 04               [ 2] 6091 	slaw x 
      009CC8 81               [ 1] 6092 	dec a 
      009CC9 89 90            [ 2] 6093 	jra 2$ 
      009CCB 93 CD            [ 1] 6094 3$: ld a,#TK_INTGR
      009CCD 99               [ 4] 6095 	ret 
                                   6096 
                                   6097 ;------------------------------
                                   6098 ; BASIC: INVERT(expr)
                                   6099 ; 1's complement 
                                   6100 ;--------------------------------
      001F53                       6101 invert:
      009CCE 81 25 05         [ 4] 6102 	call func_args
      009CD1 A6 09            [ 1] 6103 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009CD3 CC 87            [ 1] 6104 	jreq 1$
      009CD5 DF 07 5D         [ 2] 6105 	jp syntax_error
      009CD6 85               [ 2] 6106 1$: popw x  
      009CD6 55               [ 2] 6107 	cplw x 
      009CD7 00 04            [ 1] 6108 	ld a,#TK_INTGR 
      009CD9 00               [ 4] 6109 	ret 
                                   6110 
                                   6111 ;------------------------------
                                   6112 ; BASIC: DO 
                                   6113 ; initiate a DO ... UNTIL loop 
                                   6114 ;------------------------------
                           000003  6115 	DOLP_ADR=3 
                           000005  6116 	DOLP_INW=5
                           000004  6117 	VSIZE=4 
      001F62                       6118 do_loop:
      009CDA 02               [ 2] 6119 	popw x 
      001F63                       6120 	_vars VSIZE 
      009CDB 72 5F            [ 2]    1     sub sp,#VSIZE 
      009CDD 00               [ 2] 6121 	pushw x 
      009CDE 19 AE 40 00      [ 2] 6122 	ldw y,basicptr 
      009CE2 CF 00            [ 2] 6123 	ldw (DOLP_ADR,sp),y
      009CE4 1A 1E 01 CD      [ 2] 6124 	ldw y,in.w 
      009CE8 82 8B            [ 2] 6125 	ldw (DOLP_INW,sp),y
      009CEA 5C 90 85 89      [ 1] 6126 	inc loop_depth 
      009CEE 5F               [ 4] 6127 	ret 
                                   6128 
                                   6129 ;--------------------------------
                                   6130 ; BASIC: UNTIL expr 
                                   6131 ; loop if exprssion is false 
                                   6132 ; else terminate loop
                                   6133 ;--------------------------------
      001F77                       6134 until: 
      009CEF CD 81 E6 5B      [ 1] 6135 	tnz loop_depth 
      009CF3 02 81            [ 1] 6136 	jrne 1$ 
      009CF5 CC 07 5D         [ 2] 6137 	jp syntax_error 
      001F80                       6138 1$: 
      009CF5 72 0D 52         [ 4] 6139 	call relation 
      009CF8 30 FB            [ 1] 6140 	cp a,#TK_INTGR
      009CFA 72 16            [ 1] 6141 	jreq 2$
      009CFC 00 26 8E         [ 2] 6142 	jp syntax_error
      001F8A                       6143 2$: 
      009CFF 81               [ 2] 6144 	tnzw x 
      009D00 26 10            [ 1] 6145 	jrne 9$
      009D00 CD 90            [ 2] 6146 	ldw x,(DOLP_ADR,sp)
      009D02 66 A1 04         [ 2] 6147 	ldw basicptr,x 
      009D05 27 03            [ 1] 6148 	ld a,(2,x)
      009D07 CC 87 DD         [ 1] 6149 	ld count,a 
      009D0A 1E 05            [ 2] 6150 	ldw x,(DOLP_INW,sp)
      009D0A 5D 27 04         [ 2] 6151 	ldw in.w,x 
      009D0D 8F               [ 4] 6152 	ret 
      001F9D                       6153 9$:	; remove loop data from stack  
      009D0E 5A               [ 2] 6154 	popw x
      001F9E                       6155 	_drop VSIZE
      009D0F 26 F9            [ 2]    1     addw sp,#VSIZE 
      009D11 4F 81 00 22      [ 1] 6156 	dec loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009D13 FC               [ 2] 6157 	jp (x)
                                   6158 
                                   6159 ;--------------------------
                                   6160 ; BASIC: PRTA...PRTI  
                                   6161 ;  return constant value 
                                   6162 ;  PORT  offset in GPIO
                                   6163 ;  array
                                   6164 ;---------------------------
      001FA5                       6165 const_porta:
      009D13 CD 90 66         [ 2] 6166 	ldw x,#0
      009D16 A1 04            [ 1] 6167 	ld a,#TK_INTGR 
      009D18 27               [ 4] 6168 	ret 
      001FAB                       6169 const_portb:
      009D19 03 CC 87         [ 2] 6170 	ldw x,#1
      009D1C DD 04            [ 1] 6171 	ld a,#TK_INTGR 
      009D1D 81               [ 4] 6172 	ret 
      001FB1                       6173 const_portc:
      009D1D A3 14 00         [ 2] 6174 	ldw x,#2
      009D20 2B 0C            [ 1] 6175 	ld a,#TK_INTGR 
      009D22 35               [ 4] 6176 	ret 
      001FB7                       6177 const_portd:
      009D23 0F 50 F2         [ 2] 6178 	ldw x,#3
      009D26 A6 1E            [ 1] 6179 	ld a,#TK_INTGR 
      009D28 62               [ 4] 6180 	ret 
      001FBD                       6181 const_porte:
      009D29 A6 10 62         [ 2] 6182 	ldw x,#4
      009D2C 20 1E            [ 1] 6183 	ld a,#TK_INTGR 
      009D2E 81               [ 4] 6184 	ret 
      001FC3                       6185 const_portf:
      009D2E A3 08 00         [ 2] 6186 	ldw x,#5
      009D31 2B 09            [ 1] 6187 	ld a,#TK_INTGR 
      009D33 35               [ 4] 6188 	ret 
      001FC9                       6189 const_portg:
      009D34 0E 50 F2         [ 2] 6190 	ldw x,#6
      009D37 A6 50            [ 1] 6191 	ld a,#TK_INTGR 
      009D39 62               [ 4] 6192 	ret 
      001FCF                       6193 const_porth:
      009D3A 20 10 07         [ 2] 6194 	ldw x,#7
      009D3C A6 04            [ 1] 6195 	ld a,#TK_INTGR 
      009D3C 35               [ 4] 6196 	ret 
      001FD5                       6197 const_porti:
      009D3D 07 50 F2         [ 2] 6198 	ldw x,#8
      009D40 A6 04            [ 1] 6199 	ld a,#TK_INTGR 
      009D40 A3               [ 4] 6200 	ret 
                                   6201 
                                   6202 ;-------------------------------
                                   6203 ; following return constant 
                                   6204 ; related to GPIO register offset 
                                   6205 ;---------------------------------
      001FDB                       6206 const_odr:
      009D41 00 40            [ 1] 6207 	ld a,#TK_INTGR 
      009D43 23 07 72         [ 2] 6208 	ldw x,#GPIO_ODR
      009D46 5C               [ 4] 6209 	ret 
      001FE1                       6210 const_idr:
      009D47 50 F2            [ 1] 6211 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009D49 54 20 F4         [ 2] 6212 	ldw x,#GPIO_IDR
      009D4C 81               [ 4] 6213 	ret 
      001FE7                       6214 const_ddr:
      009D4C 9F 4A            [ 1] 6215 	ld a,#TK_INTGR 
      009D4E 27 01 4A         [ 2] 6216 	ldw x,#GPIO_DDR
      009D51 81               [ 4] 6217 	ret 
      001FED                       6218 const_cr1:
      009D51 A4 3E            [ 1] 6219 	ld a,#TK_INTGR 
      009D53 C7 50 F1         [ 2] 6220 	ldw x,#GPIO_CR1
      009D56 72               [ 4] 6221 	ret 
      001FF3                       6222 const_cr2:
      009D57 18 50            [ 1] 6223 	ld a,#TK_INTGR 
      009D59 F0 8E 81         [ 2] 6224 	ldw x,#GPIO_CR2
      009D5C 81               [ 4] 6225 	ret 
                                   6226 ;-------------------------
                                   6227 ;  constant for port mode
                                   6228 ;  used by PMODE 
                                   6229 ;  input or output
                                   6230 ;------------------------
      001FF9                       6231 const_output:
      009D5C CE 00            [ 1] 6232 	ld a,#TK_INTGR 
      009D5E 11 A6 04         [ 2] 6233 	ldw x,#OUTP
      009D61 81               [ 4] 6234 	ret 
      009D62                       6235 const_input:
      009D62 CD 8F            [ 1] 6236 	ld a,#TK_INTGR 
      009D64 81 A1 01         [ 2] 6237 	ldw x,#INP 
      009D67 27               [ 4] 6238 	ret 
                                   6239 ;-----------------------
                                   6240 ; memory area constants
                                   6241 ;-----------------------
      002005                       6242 const_eeprom_base:
      009D68 03 CC            [ 1] 6243 	ld a,#TK_INTGR 
      009D6A 87 DD 00         [ 2] 6244 	ldw x,#EEPROM_BASE 
      009D6C 81               [ 4] 6245 	ret 
                                   6246 
                                   6247 ;---------------------------
                                   6248 ; BASIC: DATA 
                                   6249 ; when the interpreter find 
                                   6250 ; a DATA line it skip it.
                                   6251 ;---------------------------
      00200B                       6252 data:
      009D6C 85 9E A5 80 27   [ 1] 6253 	mov in,count 
      009D71 01               [ 4] 6254 	ret 
                                   6255 
                                   6256 ;---------------------------
                                   6257 ; BASIC: DATLN  *expr*
                                   6258 ; set DATA pointer at line# 
                                   6259 ; specified by *expr* 
                                   6260 ;---------------------------
      002011                       6261 data_line:
      009D72 50 A6 04         [ 4] 6262 	call expression
      009D75 81 04            [ 1] 6263 	cp a,#TK_INTGR
      009D76 27 03            [ 1] 6264 	jreq 1$
      009D76 CD 8F 81         [ 2] 6265 	jp syntax_error 
      009D79 A1 02 27         [ 4] 6266 1$: call search_lineno
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009D7C 03               [ 2] 6267 	tnzw x 
      009D7D CC 87            [ 1] 6268 	jrne 3$
      009D7F DD 85            [ 1] 6269 2$:	ld a,#ERR_NO_LINE 
      009D81 9E 14 01         [ 2] 6270 	jp tb_error
      002026                       6271 3$: ; check if valid data line 
      009D84 95 9F            [ 1] 6272     ldw y,x 
      009D86 14 02            [ 2] 6273 	ldw x,(4,x)
      009D88 97 5B 02         [ 2] 6274 	cpw x,#data 
      009D8B A6 04            [ 1] 6275 	jrne 2$ 
      009D8D 81 CF 00 06      [ 2] 6276 	ldw data_ptr,y
      009D8E 90 E6 02         [ 1] 6277 	ld a,(2,y)
      009D8E CD 8F 81         [ 1] 6278 	ld data_len,a 
      009D91 A1 02 27 03      [ 1] 6279 	mov data_ofs,#FIRST_DATA_ITEM 
      009D95 CC               [ 4] 6280 	ret
                                   6281 
                                   6282 ;---------------------------------
                                   6283 ; BASIC: RESTORE 
                                   6284 ; set data_ptr to first data line
                                   6285 ; if not DATA found pointer set to
                                   6286 ; zero 
                                   6287 ;---------------------------------
      00203E                       6288 restore:
      009D96 87 DD 00 06      [ 1] 6289 	clr data_ptr 
      009D98 72 5F 00 07      [ 1] 6290 	clr data_ptr+1
      009D98 85 9E 1A 01      [ 1] 6291 	clr data_ofs 
      009D9C 95 9F 1A 02      [ 1] 6292 	clr data_len
      009DA0 97 5B 02         [ 2] 6293 	ldw x,txtbgn
      002051                       6294 data_search_loop: 	
      009DA3 A6 04 81         [ 2] 6295 	cpw x,txtend
      009DA6 24 17            [ 1] 6296 	jruge 9$
      009DA6 CD 8F            [ 1] 6297 	ldw y,x 
      009DA8 81 A1            [ 2] 6298 	ldw x,(4,x)
      009DAA 02 27 03         [ 2] 6299 	cpw x,#data 
      009DAD CC 87            [ 1] 6300 	jrne try_next_line 
      009DAF DD CF 00 06      [ 2] 6301 	ldw data_ptr,y 
      009DB0 90 E6 02         [ 1] 6302 	ld a,(2,y)
      009DB0 85 9E 18         [ 1] 6303 	ld data_len,a 
      009DB3 01 95 9F 18      [ 1] 6304 	mov data_ofs,#FIRST_DATA_ITEM
      009DB7 02 97 5B 02      [ 1] 6305 9$:	tnz data_len 
      009DBB A6 04            [ 1] 6306     jrne 10$
      009DBD 81 0C            [ 1] 6307 	ld a,#ERR_NO_DATA 
      009DBE CC 07 5F         [ 2] 6308 	jp tb_error 
      009DBE CD               [ 4] 6309 10$:ret
      002079                       6310 try_next_line:
      009DBF 8F               [ 1] 6311 	ldw x,y 
      009DC0 81 A1            [ 1] 6312 	ld a,(2,x)
      009DC2 02 27 03         [ 1] 6313 	ld acc8,a 
      009DC5 CC 87 DD 90      [ 1] 6314 	clr acc16 
      009DC9 85 85 90 5D      [ 2] 6315 	addw x,acc16 
      009DCD 27 05            [ 2] 6316 	jra data_search_loop
                                   6317 
                                   6318 
                                   6319 ;---------------------------------
                                   6320 ; BASIC: READ 
                                   6321 ; return next data item | 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6322 ;---------------------------------
                           000001  6323 	CTX_BPTR=1 
                           000003  6324 	CTX_IN=3 
                           000004  6325 	CTX_COUNT=4 
                           000005  6326 	XSAVE=5
                           000006  6327 	VSIZE=6
      002089                       6328 read:
      002089                       6329 	_vars  VSIZE 
      009DCF 58 90            [ 2]    1     sub sp,#VSIZE 
      00208B                       6330 read01:	
      009DD1 5A 26 FB         [ 1] 6331 	ld a,data_ofs
      009DD4 C1 00 09         [ 1] 6332 	cp a,data_len 
      009DD4 A6 04            [ 1] 6333 	jreq 2$ ; end of line  
      009DD6 81 14 34         [ 4] 6334 	call save_context
      009DD7 CE 00 06         [ 2] 6335 	ldw x,data_ptr 
      009DD7 CD 8F 81         [ 2] 6336 	ldw basicptr,x 
      009DDA A1 02 27 03 CC   [ 1] 6337 	mov in,data_ofs 
      009DDF 87 DD 90 85 85   [ 1] 6338 	mov count,data_len  
      009DE4 90 5D 27         [ 4] 6339 	call expression 
      009DE7 05 54            [ 1] 6340 	cp a,#TK_INTGR 
      009DE9 90 5A            [ 1] 6341 	jreq 1$ 
      009DEB 26 FB 5D         [ 2] 6342 	jp syntax_error 
      009DED                       6343 1$:
      009DED A6 04            [ 2] 6344 	ldw (XSAVE,SP),x
      009DEF 81 08 10         [ 4] 6345 	call next_token ; skip comma
      009DF0 CE 00 04         [ 2] 6346 	ldw x,basicptr 
      009DF0 A6 04 CD         [ 2] 6347 	ldw data_ptr,x 
      009DF3 8F 4D 9F A4 07   [ 1] 6348 	mov data_ofs,in 
      009DF8 C7 50 C6         [ 4] 6349 	call rest_context
      009DFB 81 05            [ 2] 6350 	ldw x,(XSAVE,sp)
      009DFC A6 04            [ 1] 6351 	ld a,#TK_INTGR
      0020C7                       6352 	_drop VSIZE 
      009DFC 52 01            [ 2]    1     addw sp,#VSIZE 
      009DFE CD               [ 4] 6353 	ret 
      0020CA                       6354 2$: ; end of line reached 
      009DFF 8F 5A A1 02      [ 2] 6355 	ldw y, data_ptr 
      009E03 27 03 CC 87      [ 1] 6356 	clr data_ptr
      009E07 DD 90 85 85      [ 1] 6357 	clr data_ptr+1   
      009E0B CD 9E 3D 6B      [ 1] 6358 	clr data_ofs 
      009E0F 01 A6 01 0D      [ 1] 6359 	clr data_len 
      009E13 01 27 0B         [ 4] 6360 	call try_next_line 
      009E16 48 0A            [ 2] 6361 	jra read01
                                   6362 
                                   6363 
                                   6364 ;---------------------------------
                                   6365 ; BASIC: SPIEN clkdiv, 0|1  
                                   6366 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6367 ; if clkdiv==-1 disable SPI
                                   6368 ; 0|1 -> disable|enable  
                                   6369 ;--------------------------------- 
                           000005  6370 SPI_CS_BIT=5
      0020E3                       6371 spi_enable:
      009E18 01 26 FB         [ 4] 6372 	call arg_list 
      009E1B 6B 01            [ 1] 6373 	cp a,#2
      009E1D EA 03            [ 1] 6374 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009E1F E7 03 90         [ 2] 6375 	jp syntax_error 
      0020ED                       6376 1$: 
      009E22 A3 00 01 27      [ 1] 6377 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009E26 07               [ 2] 6378 	popw x  
      009E27 7B 01            [ 1] 6379 	jreq spi_disable 
      009E29 43               [ 2] 6380 	popw x 
      009E2A E4 02            [ 1] 6381 	ld a,#(1<<SPI_CR1_BR)
      009E2C 20               [ 4] 6382 	mul x,a 
      009E2D 0A               [ 1] 6383 	ld a,xl 
      009E2E C7 52 00         [ 1] 6384 	ld SPI_CR1,a 
                                   6385 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009E2E 7B 01 EA 04      [ 1] 6386 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009E32 E7 04 7B 01      [ 1] 6387 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6388 ; configure SPI as master mode 0.	
      009E36 EA 02 E7 02      [ 1] 6389 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6390 ; ~CS line controlled by sofware 	
      009E3A 5B 01 81 01      [ 1] 6391 	bset SPI_CR2,#SPI_CR2_SSM 
      009E3D 72 10 52 01      [ 1] 6392     bset SPI_CR2,#SPI_CR2_SSI 
                                   6393 ; enable SPI
      009E3D 58 1C 9E 4D      [ 1] 6394 	bset SPI_CR1,#SPI_CR1_SPE 	
      009E41 FE               [ 4] 6395 	ret 
      002115                       6396 spi_disable:
      002115                       6397 	_drop #2; throw first argument.
      009E42 9F 88            [ 2]    1     addw sp,##2 
                                   6398 ; wait spi idle 
      009E44 5E A6            [ 1] 6399 1$:	ld a,#0x82 
      009E46 05 42 1C         [ 1] 6400 	and a,SPI_SR
      009E49 50 00            [ 1] 6401 	cp a,#2 
      009E4B 84 81            [ 1] 6402 	jrne 1$
      009E4D 72 1D 52 00      [ 1] 6403 	bres SPI_CR1,#SPI_CR1_SPE
      009E4D 03 06 03 05      [ 1] 6404 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009E51 04 00 02 01      [ 1] 6405 	bres PE_DDR,#SPI_CS_BIT 
      009E55 06               [ 4] 6406 	ret 
                                   6407 
      00212D                       6408 spi_clear_error:
      009E56 00 02            [ 1] 6409 	ld a,#0x78 
      009E58 02 02 03         [ 1] 6410 	bcp a,SPI_SR 
      009E5B 03 01            [ 1] 6411 	jreq 1$
      009E5D 03 03 02 04      [ 1] 6412 	clr SPI_SR 
      009E61 04               [ 4] 6413 1$: ret 
                                   6414 
      002139                       6415 spi_send_byte:
      009E62 05               [ 1] 6416 	push a 
      009E63 02 06 02         [ 4] 6417 	call spi_clear_error
      009E66 07               [ 1] 6418 	pop a 
      009E67 02 05 04 02 04   [ 2] 6419 	btjf SPI_SR,#SPI_SR_TXE,.
      009E6C 01 52 04         [ 1] 6420 	ld SPI_DR,a
      009E6D 72 01 52 03 FB   [ 2] 6421 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009E6D CD 8F 81         [ 1] 6422 	ld a,SPI_DR 
      009E70 A1               [ 4] 6423 	ret 
                                   6424 
      00214F                       6425 spi_rcv_byte:
      009E71 01 27            [ 1] 6426 	ld a,#255
      009E73 03 CC 87 DD E3   [ 2] 6427 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009E77 C6 52 04         [ 1] 6428 	ld a,SPI_DR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      009E77 A6               [ 4] 6429 	ret
                                   6430 
                                   6431 ;------------------------------
                                   6432 ; BASIC: SPIWR byte [,byte]
                                   6433 ; write 1 or more byte
                                   6434 ;------------------------------
      00215A                       6435 spi_write:
      009E78 80 15 01         [ 4] 6436 	call expression
      009E7B 27 05            [ 1] 6437 	cp a,#TK_INTGR 
      009E7D A6 0A            [ 1] 6438 	jreq 1$
      009E7F CC 87 DF         [ 2] 6439 	jp syntax_error 
      009E82                       6440 1$:	
      009E82 CE               [ 1] 6441 	ld a,xl 
      009E83 00 15 58         [ 4] 6442 	call spi_send_byte 
      009E86 58 58 58         [ 4] 6443 	call next_token 
      009E89 58 9E            [ 1] 6444 	cp a,#TK_COMMA 
      009E8B C8 00            [ 1] 6445 	jrne 2$ 
      009E8D 15 C7            [ 2] 6446 	jra spi_write 
      009E8F 00               [ 1] 6447 2$:	tnz a 
      009E90 0D 9F            [ 1] 6448 	jreq 3$
      002174                       6449 	_unget_token  
      009E92 C8 00 16 C7 00   [ 1]    1     mov in,in.saved
      009E97 0E               [ 4] 6450 3$:	ret 
                                   6451 
                                   6452 
                                   6453 ;-------------------------------
                                   6454 ; BASIC: SPIRD 	
                                   6455 ; read one byte from SPI 
                                   6456 ;-------------------------------
      00217A                       6457 spi_read:
      009E98 CE 00 17         [ 4] 6458 	call spi_rcv_byte 
      009E9B CF               [ 1] 6459 	clrw x 
      009E9C 00               [ 1] 6460 	ld xl,a 
      009E9D 15 90            [ 1] 6461 	ld a,#TK_INTGR 
      009E9F 54               [ 4] 6462 	ret 
                                   6463 
                                   6464 ;------------------------------
                                   6465 ; BASIC: SPISEL 0|1 
                                   6466 ; set state of ~CS line
                                   6467 ; 0|1 deselect|select  
                                   6468 ;------------------------------
      002182                       6469 spi_select:
      009EA0 90 9E C8         [ 4] 6470 	call next_token 
      009EA3 00 17            [ 1] 6471 	cp a,#TK_INTGR 
      009EA5 C7 00            [ 1] 6472 	jreq 1$
      009EA7 17 90 9F         [ 2] 6473 	jp syntax_error 
      009EAA C8               [ 2] 6474 1$: tnzw x  
      009EAB 00 18            [ 1] 6475 	jreq cs_high 
      009EAD C7 00 18 CE      [ 1] 6476 	bres PE_ODR,#SPI_CS_BIT
      009EB1 00               [ 4] 6477 	ret 
      002194                       6478 cs_high: 
      009EB2 0D 54 54 54      [ 1] 6479 	bset PE_ODR,#SPI_CS_BIT
      009EB6 9E               [ 4] 6480 	ret 
                                   6481 
                                   6482 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   6483 ;------------------------------
                                   6484 ; BASIC: FILERX
                                   6485 ; Use to receive a BASIC program
                                   6486 ; from the PC using XMODEM 
                                   6487 ; protocol. The file is store in
                                   6488 ; Each line received is compiled
                                   6489 ; then stored in RAM. When reception 
                                   6490 ; is completed with success  the 
                                   6491 ; program is ready to be executed 
                                   6492 ; or save as local file.
                                   6493 ;--------------------------------
      002199                       6494 file_receive:
      009EB7 C8 00 0D 95 9F   [ 2] 6495 	btjf flags,#FRUN,1$
      009EBC C8 00            [ 1] 6496 	ld a,#ERR_CMD_ONLY
      009EBE 0E 97 C8         [ 2] 6497 	jp tb_error 
      0021A3                       6498 1$:	
      009EC1 00 18 97         [ 4] 6499 	call clear_basic
      009EC4 9E C8 00         [ 2] 6500 	ldw x, txtbgn
      009EC7 17 95 CF         [ 4] 6501 	call xreceive 
      009ECA 00 17 90 85      [ 2] 6502 	addw x,txtbgn 
      009ECE 65 93 5C         [ 2] 6503 	ldw txtend,x 
      009ED1 CD 08 A9         [ 4] 6504 	call print_int 
      009ED1 A6 04 81         [ 2] 6505 	ldw x,#fsize_msg 
      009ED4 CD 01 D7         [ 4] 6506 	call puts 
      009ED4 52               [ 4] 6507 	ret 
      009ED5 03 0F 02 0F 03 90 AE  6508 fsize_msg: .asciz " bytes received\n"
             A5 F7 93 F6 A4 0F 6B
             01 0C 03
                                   6509 
                                   6510 ;------------------------------
                                   6511 ; BASIC: FILETX "file_name" 
                                   6512 ; Transmit the program in RAM 
                                   6513 ; To the PC using XMODEM protocol.
                                   6514 ; The file transmitted as source 
                                   6515 ; file not tokenized. 
                                   6516 ;-------------------------------
      0021CE                       6517 file_transmit:
                                   6518 
      009EE6 5C               [ 4] 6519 	ret 
                                   6520 
                                   6521 
                                   6522 ;------------------------------
                                   6523 ;      dictionary 
                                   6524 ; format:
                                   6525 ;   link:   2 bytes 
                                   6526 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6527 ;   cmd_name: 16 byte max 
                                   6528 ;   code_address: 2 bytes 
                                   6529 ;------------------------------
                                   6530 	.macro _dict_entry len,name,cmd 
                                   6531 	.word LINK 
                                   6532 	LINK=.
                                   6533 name:
                                   6534 	.byte len 	
                                   6535 	.ascii "name"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   6536 	.word cmd 
                                   6537 	.endm 
                                   6538 
                           000000  6539 	LINK=0
                                   6540 ; respect alphabetic order for BASIC names from Z-A
                                   6541 ; this sort order is for a cleaner WORDS cmd output. 	
      0021CF                       6542 kword_end:
      0021CF                       6543 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009EE7 F6 CD                    1 	.word LINK 
                           0021D1     2 	LINK=.
      0021D1                          3 XPEEK:
      009EE9 82                       4 	.byte 5+F_IFUNC 	
      009EEA 44 0C 02 0A 01           5 	.ascii "XPEEK"
      009EEF 26 F5                    6 	.word xpeek 
      0021D9                       6544 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009EF1 A6 46                    1 	.word LINK 
                           0021DB     2 	LINK=.
      0021DB                          3 XOR:
      009EF3 11                       4 	.byte 3+F_IFUNC 	
      009EF4 02 2B 09                 5 	.ascii "XOR"
      009EF7 A6 20                    6 	.word bit_xor 
      0021E1                       6545 	_dict_entry,5,WRITE,write  
      009EF9 CD 82                    1 	.word LINK 
                           0021E3     2 	LINK=.
      0021E3                          3 WRITE:
      009EFB 44                       4 	.byte 5 	
      009EFC 0C 02 20 07 A6           5 	.ascii "WRITE"
      009F01 0D CD                    6 	.word write 
      0021EB                       6546 	_dict_entry,5,WORDS,words 
      009F03 82 44                    1 	.word LINK 
                           0021ED     2 	LINK=.
      0021ED                          3 WORDS:
      009F05 0F                       4 	.byte 5 	
      009F06 02 72 A2 00 02           5 	.ascii "WORDS"
      009F0B 90 FE                    6 	.word words 
      0021F5                       6547 	_dict_entry 4,WAIT,wait 
      009F0D 26 CF                    1 	.word LINK 
                           0021F7     2 	LINK=.
      0021F7                          3 WAIT:
      009F0F A6                       4 	.byte 4 	
      009F10 0D CD 82 44              5 	.ascii "WAIT"
      009F14 5F 7B                    6 	.word wait 
      0021FE                       6548 	_dict_entry,3+F_IFUNC,USR,usr
      009F16 03 97                    1 	.word LINK 
                           002200     2 	LINK=.
      002200                          3 USR:
      009F18 CD                       4 	.byte 3+F_IFUNC 	
      009F19 89 29 AE                 5 	.ascii "USR"
      009F1C 9F 24                    6 	.word usr 
      002206                       6549 	_dict_entry,5,UNTIL,until 
      009F1E CD 82                    1 	.word LINK 
                           002208     2 	LINK=.
      002208                          3 UNTIL:
      009F20 57                       4 	.byte 5 	
      009F21 5B 03 81 20 77           5 	.ascii "UNTIL"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009F26 6F 72                    6 	.word until 
      002210                       6550 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009F28 64 73                    1 	.word LINK 
                           002212     2 	LINK=.
      002212                          3 UFLASH:
      009F2A 20                       4 	.byte 6+F_IFUNC 	
      009F2B 69 6E 20 64 69 63        5 	.ascii "UFLASH"
      009F31 74 69                    6 	.word uflash 
      00221B                       6551 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009F33 6F 6E                    1 	.word LINK 
                           00221D     2 	LINK=.
      00221D                          3 UBOUND:
      009F35 61                       4 	.byte 6+F_IFUNC 	
      009F36 72 79 0A 00 4E 44        5 	.ascii "UBOUND"
      009F3A 11 37                    6 	.word ubound 
      002226                       6552 	_dict_entry,4,TONE,tone  
      009F3A CD 8F                    1 	.word LINK 
                           002228     2 	LINK=.
      002228                          3 TONE:
      009F3C 5A                       4 	.byte 4 	
      009F3D A1 01 27 03              5 	.ascii "TONE"
      009F41 CC 87                    6 	.word tone 
      00222F                       6553 	_dict_entry,2,TO,to
      009F43 DD 28                    1 	.word LINK 
                           002231     2 	LINK=.
      009F44                          3 TO:
      009F44 85                       4 	.byte 2 	
      009F45 CF 00                    5 	.ascii "TO"
      009F47 13 81                    6 	.word to 
      009F49                       6554 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009F49 CE 00                    1 	.word LINK 
                           002238     2 	LINK=.
      002238                          3 TIMEOUT:
      009F4B 13                       4 	.byte 7+F_IFUNC 	
      009F4C 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      009F4C 53 A3                    6 	.word timeout 
      002242                       6555 	_dict_entry,5,TIMER,set_timer
      009F4E FF FF                    1 	.word LINK 
                           002244     2 	LINK=.
      002244                          3 TIMER:
      009F50 27                       4 	.byte 5 	
      009F51 01 5F A6 04 81           5 	.ascii "TIMER"
      009F56 1E BA                    6 	.word set_timer 
      00224C                       6556 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009F56 CD 8F                    1 	.word LINK 
                           00224E     2 	LINK=.
      00224E                          3 TICKS:
      009F58 81                       4 	.byte 5+F_IFUNC 	
      009F59 A1 01 27 03 CC           5 	.ascii "TICKS"
      009F5E 87 DD                    6 	.word get_ticks 
      002256                       6557 	_dict_entry,4,STOP,stop 
      009F60 85 20                    1 	.word LINK 
                           002258     2 	LINK=.
      002258                          3 STOP:
      009F62 E9                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      009F63 53 54 4F 50              5 	.ascii "STOP"
      009F63 CD 8F                    6 	.word stop 
      00225F                       6558 	_dict_entry,4,STEP,step 
      009F65 5A A1                    1 	.word LINK 
                           002261     2 	LINK=.
      002261                          3 STEP:
      009F67 01                       4 	.byte 4 	
      009F68 27 03 CC 87              5 	.ascii "STEP"
      009F6C DD 85                    6 	.word step 
      002268                       6559 	_dict_entry,5,SPIWR,spi_write
      009F6E 4B 00                    1 	.word LINK 
                           00226A     2 	LINK=.
      00226A                          3 SPIWR:
      009F70 35                       4 	.byte 5 	
      009F71 CC 50 E0 9E A4           5 	.ascii "SPIWR"
      009F76 3F 95                    6 	.word spi_write 
      002272                       6560 	_dict_entry,6,SPISEL,spi_select
      009F78 A3 00                    1 	.word LINK 
                           002274     2 	LINK=.
      002274                          3 SPISEL:
      009F7A FF                       4 	.byte 6 	
      009F7B 23 06 0C 01 98 56        5 	.ascii "SPISEL"
      009F81 20 F5                    6 	.word spi_select 
      00227D                       6561 	_dict_entry,5,SPIEN,spi_enable 
      009F83 35 55                    1 	.word LINK 
                           00227F     2 	LINK=.
      00227F                          3 SPIEN:
      009F85 50                       4 	.byte 5 	
      009F86 E0 84 C7 50 E1           5 	.ascii "SPIEN"
      009F8B 9F 4A                    6 	.word spi_enable 
      002287                       6562 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      009F8D 35 55                    1 	.word LINK 
                           002289     2 	LINK=.
      002289                          3 SPIRD:
      009F8F 50                       4 	.byte 5+F_IFUNC 	
      009F90 E0 C7 50 E2 35           5 	.ascii "SPIRD"
      009F95 AA 50                    6 	.word spi_read 
      002291                       6563 	_dict_entry,5,SLEEP,sleep 
      009F97 E0 81                    1 	.word LINK 
                           002293     2 	LINK=.
      009F99                          3 SLEEP:
      009F99 35                       4 	.byte 5 	
      009F9A AA 50 E0 81 50           5 	.ascii "SLEEP"
      009F9E 1C 75                    6 	.word sleep 
      00229B                       6564 	_dict_entry,4+F_IFUNC,SIZE,size
      009F9E CD 8F                    1 	.word LINK 
                           00229D     2 	LINK=.
      00229D                          3 SIZE:
      009FA0 81                       4 	.byte 4+F_IFUNC 	
      009FA1 A1 01 27 03              5 	.ascii "SIZE"
      009FA5 CC 87                    6 	.word size 
      0022A4                       6565     _dict_entry,4,SHOW,show 
      009FA7 DD 85                    1 	.word LINK 
                           0022A6     2 	LINK=.
      009FA9                          3 SHOW:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009FA9 5D                       4 	.byte 4 	
      009FAA 27 0A A6 0F              5 	.ascii "SHOW"
      009FAE 59 25                    6 	.word show 
      0022AD                       6566 	_dict_entry,4,SAVE,save
      009FB0 03 4A                    1 	.word LINK 
                           0022AF     2 	LINK=.
      0022AF                          3 SAVE:
      009FB2 20                       4 	.byte 4 	
      009FB3 FA 5F 97 A6              5 	.ascii "SAVE"
      009FB7 04 81                    6 	.word save 
      009FB9                       6567 	_dict_entry 3,RUN,run
      009FB9 CD 8F                    1 	.word LINK 
                           0022B8     2 	LINK=.
      0022B8                          3 RUN:
      009FBB 81                       4 	.byte 3 	
      009FBC A1 01 27                 5 	.ascii "RUN"
      009FBF 03 CC                    6 	.word run 
      0022BE                       6568 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009FC1 87 DD                    1 	.word LINK 
                           0022C0     2 	LINK=.
      0022C0                          3 RSHIFT:
      009FC3 85                       4 	.byte 6+F_IFUNC 	
      009FC4 9F A4 0F 5F 5C 4D        5 	.ascii "RSHIFT"
      009FCA 27 04                    6 	.word rshift 
      0022C9                       6569 	_dict_entry,3+F_IFUNC,RND,random 
      009FCC 58 4A                    1 	.word LINK 
                           0022CB     2 	LINK=.
      0022CB                          3 RND:
      009FCE 20                       4 	.byte 3+F_IFUNC 	
      009FCF F9 A6 04                 5 	.ascii "RND"
      009FD2 81 ED                    6 	.word random 
      009FD3                       6570 	_dict_entry,6,RETURN,return 
      009FD3 CD 8F                    1 	.word LINK 
                           0022D3     2 	LINK=.
      0022D3                          3 RETURN:
      009FD5 81                       4 	.byte 6 	
      009FD6 A1 01 27 03 CC 87        5 	.ascii "RETURN"
      009FDC DD 85                    6 	.word return 
      0022DC                       6571 	_dict_entry,7,RESTORE,restore 
      009FDE 53 A6                    1 	.word LINK 
                           0022DE     2 	LINK=.
      0022DE                          3 RESTORE:
      009FE0 04                       4 	.byte 7 	
      009FE1 81 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      009FE2 20 3E                    6 	.word restore 
      0022E8                       6572 	_dict_entry 6,REMARK,remark 
      009FE2 85 52                    1 	.word LINK 
                           0022EA     2 	LINK=.
      0022EA                          3 REMARK:
      009FE4 04                       4 	.byte 6 	
      009FE5 89 90 CE 00 05 17        5 	.ascii "REMARK"
      009FEB 03 90                    6 	.word remark 
      0022F3                       6573 	_dict_entry,6,REBOOT,cold_start
      009FED CE 00                    1 	.word LINK 
                           0022F5     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0022F5                          3 REBOOT:
      009FEF 01                       4 	.byte 6 	
      009FF0 17 05 72 5C 00 23        5 	.ascii "REBOOT"
      009FF6 81 ED                    6 	.word cold_start 
      009FF7                       6574 	_dict_entry,4+F_IFUNC,READ,read  
      009FF7 72 5D                    1 	.word LINK 
                           002300     2 	LINK=.
      002300                          3 READ:
      009FF9 00                       4 	.byte 4+F_IFUNC 	
      009FFA 23 26 03 CC              5 	.ascii "READ"
      009FFE 87 DD                    6 	.word read 
      00A000                       6575 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A000 CD 90                    1 	.word LINK 
                           002309     2 	LINK=.
      002309                          3 QKEY:
      00A002 AA                       4 	.byte 4+F_IFUNC 	
      00A003 A1 04 27 03              5 	.ascii "QKEY"
      00A007 CC 87                    6 	.word qkey 
      002310                       6576 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A009 DD 09                    1 	.word LINK 
                           002312     2 	LINK=.
      00A00A                          3 PRTI:
      00A00A 5D                       4 	.byte 4+F_IFUNC 	
      00A00B 26 10 1E 03              5 	.ascii "PRTI"
      00A00F CF 00                    6 	.word const_porti 
      002319                       6577 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A011 05 E6                    1 	.word LINK 
                           00231B     2 	LINK=.
      00231B                          3 PRTH:
      00A013 02                       4 	.byte 4+F_IFUNC 	
      00A014 C7 00 04 1E              5 	.ascii "PRTH"
      00A018 05 CF                    6 	.word const_porth 
      002322                       6578 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A01A 00 01                    1 	.word LINK 
                           002324     2 	LINK=.
      002324                          3 PRTG:
      00A01C 81                       4 	.byte 4+F_IFUNC 	
      00A01D 50 52 54 47              5 	.ascii "PRTG"
      00A01D 85 5B                    6 	.word const_portg 
      00232B                       6579 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A01F 04 72                    1 	.word LINK 
                           00232D     2 	LINK=.
      00232D                          3 PRTF:
      00A021 5A                       4 	.byte 4+F_IFUNC 	
      00A022 00 23 FC 46              5 	.ascii "PRTF"
      00A025 1F C3                    6 	.word const_portf 
      002334                       6580 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A025 AE 00                    1 	.word LINK 
                           002336     2 	LINK=.
      002336                          3 PRTE:
      00A027 00                       4 	.byte 4+F_IFUNC 	
      00A028 A6 04 81 45              5 	.ascii "PRTE"
      00A02B 1F BD                    6 	.word const_porte 
      00233D                       6581 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A02B AE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



                           00233F     2 	LINK=.
      00233F                          3 PRTD:
      00A02D 01                       4 	.byte 4+F_IFUNC 	
      00A02E A6 04 81 44              5 	.ascii "PRTD"
      00A031 1F B7                    6 	.word const_portd 
      002346                       6582 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A031 AE 00                    1 	.word LINK 
                           002348     2 	LINK=.
      002348                          3 PRTC:
      00A033 02                       4 	.byte 4+F_IFUNC 	
      00A034 A6 04 81 43              5 	.ascii "PRTC"
      00A037 1F B1                    6 	.word const_portc 
      00234F                       6583 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A037 AE 00                    1 	.word LINK 
                           002351     2 	LINK=.
      002351                          3 PRTB:
      00A039 03                       4 	.byte 4+F_IFUNC 	
      00A03A A6 04 81 42              5 	.ascii "PRTB"
      00A03D 1F AB                    6 	.word const_portb 
      002358                       6584 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A03D AE 00                    1 	.word LINK 
                           00235A     2 	LINK=.
      00235A                          3 PRTA:
      00A03F 04                       4 	.byte 4+F_IFUNC 	
      00A040 A6 04 81 41              5 	.ascii "PRTA"
      00A043 1F A5                    6 	.word const_porta 
      002361                       6585 	_dict_entry 5,PRINT,print 
      00A043 AE 00                    1 	.word LINK 
                           002363     2 	LINK=.
      002363                          3 PRINT:
      00A045 05                       4 	.byte 5 	
      00A046 A6 04 81 4E 54           5 	.ascii "PRINT"
      00A049 13 C8                    6 	.word print 
      00236B                       6586 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A049 AE 00                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 POUT:
      00A04B 06                       4 	.byte 4+F_IFUNC 	
      00A04C A6 04 81 54              5 	.ascii "POUT"
      00A04F 1F F9                    6 	.word const_output 
      002374                       6587 	_dict_entry,4,POKE,poke 
      00A04F AE 00                    1 	.word LINK 
                           002376     2 	LINK=.
      002376                          3 POKE:
      00A051 07                       4 	.byte 4 	
      00A052 A6 04 81 45              5 	.ascii "POKE"
      00A055 15 38                    6 	.word poke 
      00237D                       6588 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A055 AE 00                    1 	.word LINK 
                           00237F     2 	LINK=.
      00237F                          3 PINP:
      00A057 08                       4 	.byte 4+F_IFUNC 	
      00A058 A6 04 81 50              5 	.ascii "PINP"
      00A05B 1F FF                    6 	.word const_input 
      002386                       6589 	_dict_entry,4+F_IFUNC,PEEK,peek 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A05B A6 04                    1 	.word LINK 
                           002388     2 	LINK=.
      002388                          3 PEEK:
      00A05D AE                       4 	.byte 4+F_IFUNC 	
      00A05E 00 00 81 4B              5 	.ascii "PEEK"
      00A061 15 47                    6 	.word peek 
      00238F                       6590 	_dict_entry,5,PMODE,pin_mode 
      00A061 A6 04                    1 	.word LINK 
                           002391     2 	LINK=.
      002391                          3 PMODE:
      00A063 AE                       4 	.byte 5 	
      00A064 00 01 81 44 45           5 	.ascii "PMODE"
      00A067 1D 7C                    6 	.word pin_mode 
      002399                       6591 	_dict_entry,5,PAUSE,pause 
      00A067 A6 04                    1 	.word LINK 
                           00239B     2 	LINK=.
      00239B                          3 PAUSE:
      00A069 AE                       4 	.byte 5 	
      00A06A 00 02 81 53 45           5 	.ascii "PAUSE"
      00A06D 1C 80                    6 	.word pause 
      0023A3                       6592 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A06D A6 04                    1 	.word LINK 
                           0023A5     2 	LINK=.
      0023A5                          3 OR:
      00A06F AE                       4 	.byte 2+F_IFUNC 	
      00A070 00 03                    5 	.ascii "OR"
      00A072 81 0E                    6 	.word bit_or 
      00A073                       6593 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A073 A6 04                    1 	.word LINK 
                           0023AC     2 	LINK=.
      0023AC                          3 ODR:
      00A075 AE                       4 	.byte 3+F_IFUNC 	
      00A076 00 04 81                 5 	.ascii "ODR"
      00A079 1F DB                    6 	.word const_odr 
      0023B2                       6594 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A079 A6 04                    1 	.word LINK 
                           0023B4     2 	LINK=.
      0023B4                          3 NOT:
      00A07B AE                       4 	.byte 3+F_IFUNC 	
      00A07C 00 01 81                 5 	.ascii "NOT"
      00A07F 1E D6                    6 	.word func_not 
      0023BA                       6595 	_dict_entry,3,NEW,new
      00A07F A6 04                    1 	.word LINK 
                           0023BC     2 	LINK=.
      0023BC                          3 NEW:
      00A081 AE                       4 	.byte 3 	
      00A082 00 00 81                 5 	.ascii "NEW"
      00A085 18 8A                    6 	.word new 
      0023C2                       6596 	_dict_entry,4,NEXT,next 
      00A085 A6 04                    1 	.word LINK 
                           0023C4     2 	LINK=.
      0023C4                          3 NEXT:
      00A087 AE                       4 	.byte 4 	
      00A088 40 00 81 54              5 	.ascii "NEXT"
      00A08B 16 08                    6 	.word next 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0023CB                       6597 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A08B 55 00                    1 	.word LINK 
                           0023CD     2 	LINK=.
      0023CD                          3 LSHIFT:
      00A08D 04                       4 	.byte 6+F_IFUNC 	
      00A08E 00 02 81 49 46 54        5 	.ascii "LSHIFT"
      00A091 1D 3E                    6 	.word lshift 
      0023D6                       6598 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A091 CD 90                    1 	.word LINK 
                           0023D8     2 	LINK=.
      0023D8                          3 LOG:
      00A093 66                       4 	.byte 3+F_IFUNC 	
      00A094 A1 04 27                 5 	.ascii "LOG"
      00A097 03 CC                    6 	.word log2 
      0023DE                       6599 	_dict_entry,4,LOAD,load 
      00A099 87 DD                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 LOAD:
      00A09B CD                       4 	.byte 4 	
      00A09C 82 F9 5D 26              5 	.ascii "LOAD"
      00A0A0 05 A6                    6 	.word load 
      0023E7                       6600 	_dict_entry 4,LIST,list
      00A0A2 05 CC                    1 	.word LINK 
                           0023E9     2 	LINK=.
      0023E9                          3 LIST:
      00A0A4 87                       4 	.byte 4 	
      00A0A5 DF 49 53 54              5 	.ascii "LIST"
      00A0A6 11 84                    6 	.word list 
      0023F0                       6601 	_dict_entry 3,LET,let 
      00A0A6 90 93                    1 	.word LINK 
                           0023F2     2 	LINK=.
      0023F2                          3 LET:
      00A0A8 EE                       4 	.byte 3 	
      00A0A9 04 A3 A0                 5 	.ascii "LET"
      00A0AC 8B 26                    6 	.word let 
      0023F8                       6602 	_dict_entry,3+F_IFUNC,KEY,key 
      00A0AE F2 90                    1 	.word LINK 
                           0023FA     2 	LINK=.
      0023FA                          3 KEY:
      00A0B0 CF                       4 	.byte 3+F_IFUNC 	
      00A0B1 00 07 90                 5 	.ascii "KEY"
      00A0B4 E6 02                    6 	.word key 
      002400                       6603 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A0B6 C7 00                    1 	.word LINK 
                           002402     2 	LINK=.
      002402                          3 IWDGREF:
      00A0B8 0A                       4 	.byte 7 	
      00A0B9 35 06 00 09 81 45 46     5 	.ascii "IWDGREF"
      00A0BE 1F 19                    6 	.word refresh_iwdg 
      00240C                       6604 	_dict_entry,6,IWDGEN,enable_iwdg
      00A0BE 72 5F                    1 	.word LINK 
                           00240E     2 	LINK=.
      00240E                          3 IWDGEN:
      00A0C0 00                       4 	.byte 6 	
      00A0C1 07 72 5F 00 08 72        5 	.ascii "IWDGEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A0C7 5F 00                    6 	.word enable_iwdg 
      002417                       6605 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A0C9 09 72                    1 	.word LINK 
                           002419     2 	LINK=.
      002419                          3 INVERT:
      00A0CB 5F                       4 	.byte 6+F_IFUNC 	
      00A0CC 00 0A CE 00 1F 54        5 	.ascii "INVERT"
      00A0D1 1F 53                    6 	.word invert 
      002422                       6606 	_dict_entry,5,INPUT,input_var  
      00A0D1 C3 00                    1 	.word LINK 
                           002424     2 	LINK=.
      002424                          3 INPUT:
      00A0D3 21                       4 	.byte 5 	
      00A0D4 24 17 90 93 EE           5 	.ascii "INPUT"
      00A0D9 04 A3                    6 	.word input_var 
      00242C                       6607 	_dict_entry,2,IF,if 
      00A0DB A0 8B                    1 	.word LINK 
                           00242E     2 	LINK=.
      00242E                          3 IF:
      00A0DD 26                       4 	.byte 2 	
      00A0DE 1A 90                    5 	.ascii "IF"
      00A0E0 CF 00                    6 	.word if 
      002433                       6608 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A0E2 07 90                    1 	.word LINK 
                           002435     2 	LINK=.
      002435                          3 IDR:
      00A0E4 E6                       4 	.byte 3+F_IFUNC 	
      00A0E5 02 C7 00                 5 	.ascii "IDR"
      00A0E8 0A 35                    6 	.word const_idr 
      00243B                       6609 	_dict_entry,3,HEX,hex_base
      00A0EA 06 00                    1 	.word LINK 
                           00243D     2 	LINK=.
      00243D                          3 HEX:
      00A0EC 09                       4 	.byte 3 	
      00A0ED 72 5D 00                 5 	.ascii "HEX"
      00A0F0 0A 26                    6 	.word hex_base 
      002443                       6610 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A0F2 05 A6                    1 	.word LINK 
                           002445     2 	LINK=.
      002445                          3 GPIO:
      00A0F4 0C                       4 	.byte 4+F_IFUNC 	
      00A0F5 CC 87 DF 81              5 	.ascii "GPIO"
      00A0F9 1B C8                    6 	.word gpio 
      00244C                       6611 	_dict_entry,4,GOTO,goto 
      00A0F9 93 E6                    1 	.word LINK 
                           00244E     2 	LINK=.
      00244E                          3 GOTO:
      00A0FB 02                       4 	.byte 4 	
      00A0FC C7 00 0E 72              5 	.ascii "GOTO"
      00A100 5F 00                    6 	.word goto 
      002455                       6612 	_dict_entry,5,GOSUB,gosub 
      00A102 0D 72                    1 	.word LINK 
                           002457     2 	LINK=.
      002457                          3 GOSUB:
      00A104 BB                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A105 00 0D 20 C8 42           5 	.ascii "GOSUB"
      00A109 16 83                    6 	.word gosub 
      00245F                       6613 	_dict_entry,6,FORGET,forget 
      00A109 52 06                    1 	.word LINK 
                           002461     2 	LINK=.
      00A10B                          3 FORGET:
      00A10B C6                       4 	.byte 6 	
      00A10C 00 09 C1 00 0A 27        5 	.ascii "FORGET"
      00A112 37 CD                    6 	.word forget 
      00246A                       6614 	_dict_entry,3,FOR,for 
      00A114 94 B4                    1 	.word LINK 
                           00246C     2 	LINK=.
      00246C                          3 FOR:
      00A116 CE                       4 	.byte 3 	
      00A117 00 07 CF                 5 	.ascii "FOR"
      00A11A 00 05                    6 	.word for 
      002472                       6615 	_dict_entry,6,FILETX,file_transmit
      00A11C 55 00                    1 	.word LINK 
                           002474     2 	LINK=.
      002474                          3 FILETX:
      00A11E 09                       4 	.byte 6 	
      00A11F 00 02 55 00 0A 00        5 	.ascii "FILETX"
      00A125 04 CD                    6 	.word file_transmit 
      00247D                       6616 	_dict_entry,6,FILERX,file_receive 
      00A127 90 66                    1 	.word LINK 
                           00247F     2 	LINK=.
      00247F                          3 FILERX:
      00A129 A1                       4 	.byte 6 	
      00A12A 04 27 03 CC 87 DD        5 	.ascii "FILERX"
      00A130 21 99                    6 	.word file_receive 
      002488                       6617 	_dict_entry,4,FCPU,fcpu 
      00A130 1F 05                    1 	.word LINK 
                           00248A     2 	LINK=.
      00248A                          3 FCPU:
      00A132 CD                       4 	.byte 4 	
      00A133 88 90 CE 00              5 	.ascii "FCPU"
      00A137 05 CF                    6 	.word fcpu 
      002491                       6618 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A139 00 07                    1 	.word LINK 
                           002493     2 	LINK=.
      002493                          3 EEPROM:
      00A13B 55                       4 	.byte 6+F_IFUNC 	
      00A13C 00 02 00 09 CD 94        5 	.ascii "EEPROM"
      00A142 C4 1E                    6 	.word const_eeprom_base 
      00249C                       6619 	_dict_entry,3,END,cmd_end  
      00A144 05 A6                    1 	.word LINK 
                           00249E     2 	LINK=.
      00249E                          3 END:
      00A146 04                       4 	.byte 3 	
      00A147 5B 06 81                 5 	.ascii "END"
      00A14A 17 13                    6 	.word cmd_end 
      0024A4                       6620 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A14A 90 CE                    1 	.word LINK 
                           0024A6     2 	LINK=.
      0024A6                          3 DWRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A14C 00                       4 	.byte 6+F_CMD 	
      00A14D 07 72 5F 00 07 72        5 	.ascii "DWRITE"
      00A153 5F 00                    6 	.word digital_write 
      0024AF                       6621 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A155 08 72                    1 	.word LINK 
                           0024B1     2 	LINK=.
      0024B1                          3 DREAD:
      00A157 5F                       4 	.byte 5+F_IFUNC 	
      00A158 00 09 72 5F 00           5 	.ascii "DREAD"
      00A15D 0A CD                    6 	.word digital_read 
      0024B9                       6622 	_dict_entry,2,DO,do_loop
      00A15F A0 F9                    1 	.word LINK 
                           0024BB     2 	LINK=.
      0024BB                          3 DO:
      00A161 20                       4 	.byte 2 	
      00A162 A8 4F                    5 	.ascii "DO"
      00A163 1F 62                    6 	.word do_loop 
      0024C0                       6623 	_dict_entry,3,DIR,directory 
      00A163 CD 8F                    1 	.word LINK 
                           0024C2     2 	LINK=.
      0024C2                          3 DIR:
      00A165 5A                       4 	.byte 3 	
      00A166 A1 02 27                 5 	.ascii "DIR"
      00A169 03 CC                    6 	.word directory 
      0024C8                       6624 	_dict_entry,3,DEC,dec_base
      00A16B 87 DD                    1 	.word LINK 
                           0024CA     2 	LINK=.
      00A16D                          3 DEC:
      00A16D 72                       4 	.byte 3 	
      00A16E 12 50 C7                 5 	.ascii "DEC"
      00A171 85 27                    6 	.word dec_base 
      0024D0                       6625 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A173 21 85                    1 	.word LINK 
                           0024D2     2 	LINK=.
      0024D2                          3 DDR:
      00A175 A6                       4 	.byte 3+F_IFUNC 	
      00A176 08 42 9F                 5 	.ascii "DDR"
      00A179 C7 52                    6 	.word const_ddr 
      0024D8                       6626 	_dict_entry,6,DATALN,data_line  
      00A17B 00 72                    1 	.word LINK 
                           0024DA     2 	LINK=.
      0024DA                          3 DATALN:
      00A17D 1A                       4 	.byte 6 	
      00A17E 50 14 72 1A 50 16        5 	.ascii "DATALN"
      00A184 72 14                    6 	.word data_line 
      0024E3                       6627 	_dict_entry,4,DATA,data  
      00A186 52 00                    1 	.word LINK 
                           0024E5     2 	LINK=.
      0024E5                          3 DATA:
      00A188 72                       4 	.byte 4 	
      00A189 12 52 01 72              5 	.ascii "DATA"
      00A18D 10 52                    6 	.word data 
      0024EC                       6628 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A18F 01 72                    1 	.word LINK 
                           0024EE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0024EE                          3 CRL:
      00A191 1C                       4 	.byte 3+F_IFUNC 	
      00A192 52 00 81                 5 	.ascii "CRL"
      00A195 1F ED                    6 	.word const_cr1 
      0024F4                       6629 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A195 5B 02                    1 	.word LINK 
                           0024F6     2 	LINK=.
      0024F6                          3 CRH:
      00A197 A6                       4 	.byte 3+F_IFUNC 	
      00A198 82 C4 52                 5 	.ascii "CRH"
      00A19B 03 A1                    6 	.word const_cr2 
      0024FC                       6630 	_dict_entry,4+F_CFUNC,CHAR,char
      00A19D 02 26                    1 	.word LINK 
                           0024FE     2 	LINK=.
      0024FE                          3 CHAR:
      00A19F F7                       4 	.byte 4+F_CFUNC 	
      00A1A0 72 1D 52 00              5 	.ascii "CHAR"
      00A1A4 72 13                    6 	.word char 
      002505                       6631 	_dict_entry,3,BYE,bye 
      00A1A6 50 C7                    1 	.word LINK 
                           002507     2 	LINK=.
      002507                          3 BYE:
      00A1A8 72                       4 	.byte 3 	
      00A1A9 1B 50 16                 5 	.ascii "BYE"
      00A1AC 81 15                    6 	.word bye 
      00A1AD                       6632 	_dict_entry,5,BTOGL,bit_toggle
      00A1AD A6 78                    1 	.word LINK 
                           00250F     2 	LINK=.
      00250F                          3 BTOGL:
      00A1AF C5                       4 	.byte 5 	
      00A1B0 52 03 27 04 72           5 	.ascii "BTOGL"
      00A1B5 5F 52                    6 	.word bit_toggle 
      002517                       6633 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A1B7 03 81                    1 	.word LINK 
                           002519     2 	LINK=.
      00A1B9                          3 BTEST:
      00A1B9 88                       4 	.byte 5+F_IFUNC 	
      00A1BA CD A1 AD 84 72           5 	.ascii "BTEST"
      00A1BF 03 52                    6 	.word bit_test 
      002521                       6634 	_dict_entry,4,BSET,bit_set 
      00A1C1 03 FB                    1 	.word LINK 
                           002523     2 	LINK=.
      002523                          3 BSET:
      00A1C3 C7                       4 	.byte 4 	
      00A1C4 52 04 72 01              5 	.ascii "BSET"
      00A1C8 52 03                    6 	.word bit_set 
      00252A                       6635 	_dict_entry,4,BRES,bit_reset
      00A1CA FB C6                    1 	.word LINK 
                           00252C     2 	LINK=.
      00252C                          3 BRES:
      00A1CC 52                       4 	.byte 4 	
      00A1CD 04 81 45 53              5 	.ascii "BRES"
      00A1CF 14 F0                    6 	.word bit_reset 
      002533                       6636 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A1CF A6 FF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                           002535     2 	LINK=.
      002535                          3 BIT:
      00A1D1 72                       4 	.byte 3+F_IFUNC 	
      00A1D2 01 52 03                 5 	.ascii "BIT"
      00A1D5 E3 C6                    6 	.word bitmask 
      00253B                       6637 	_dict_entry,3,AWU,awu 
      00A1D7 52 04                    1 	.word LINK 
                           00253D     2 	LINK=.
      00253D                          3 AWU:
      00A1D9 81                       4 	.byte 3 	
      00A1DA 41 57 55                 5 	.ascii "AWU"
      00A1DA CD 90                    6 	.word awu 
      002543                       6638 	_dict_entry,7,AUTORUN,autorun
      00A1DC 66 A1                    1 	.word LINK 
                           002545     2 	LINK=.
      002545                          3 AUTORUN:
      00A1DE 04                       4 	.byte 7 	
      00A1DF 27 03 CC 87 DD 55 4E     5 	.ascii "AUTORUN"
      00A1E4 1C 1E                    6 	.word autorun 
      00254F                       6639 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A1E4 9F CD                    1 	.word LINK 
                           002551     2 	LINK=.
      002551                          3 ASC:
      00A1E6 A1                       4 	.byte 3+F_IFUNC 	
      00A1E7 B9 CD 88                 5 	.ascii "ASC"
      00A1EA 90 A1                    6 	.word ascii 
      002557                       6640 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A1EC 0D 26                    1 	.word LINK 
                           002559     2 	LINK=.
      002559                          3 AND:
      00A1EE 02                       4 	.byte 3+F_IFUNC 	
      00A1EF 20 E9 4D                 5 	.ascii "AND"
      00A1F2 27 05                    6 	.word bit_and 
      00255F                       6641 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A1F4 55 00                    1 	.word LINK 
                           002561     2 	LINK=.
      002561                          3 ADCREAD:
      00A1F6 03                       4 	.byte 7+F_IFUNC 	
      00A1F7 00 02 81 52 45 41 44     5 	.ascii "ADCREAD"
      00A1FA 17 9F                    6 	.word analog_read 
      00256B                       6642 	_dict_entry,5,ADCON,power_adc 
      00A1FA CD A1                    1 	.word LINK 
                           00256D     2 	LINK=.
      00256D                          3 ADCON:
      00A1FC CF                       4 	.byte 5 	
      00A1FD 5F 97 A6 04 81           5 	.ascii "ADCON"
      00A202 17 63                    6 	.word power_adc 
      002575                       6643 kword_dict:
      002575                       6644 	_dict_entry,3+F_IFUNC,ABS,abs
      00A202 CD 88                    1 	.word LINK 
                           002577     2 	LINK=.
      002577                          3 ABS:
      00A204 90                       4 	.byte 3+F_IFUNC 	
      00A205 A1 04 27                 5 	.ascii "ABS"
      00A208 03 CC                    6 	.word abs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   6645 	
                                   6646 
      002580                       6647 	.bndry 128 ; align on FLASH block.
                                   6648 ; free space for user application  
      002580                       6649 user_space:
                                   6650 ; USR() function test
      00A20A 87               [ 2] 6651 	pushw x 
      00A20B DD 5D 27 05      [ 1] 6652 	bset PC_ODR,#5 
      00A20F 72               [ 2] 6653 	popw x 
      00A210 1B 50 14         [ 4] 6654 	call pause02 
      00A213 81 1B 50 0A      [ 1] 6655 	bres PC_ODR,#5 
      00A214 81               [ 4] 6656 	ret
                                   6657 
                                   6658 	.area FLASH_DRIVE (ABS)
      010000                       6659 	.org 0x10000
      010000                       6660 fdrive:
                                   6661 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002577 R   |     ACK     =  000006 
  5 ADCON      00256D R   |   5 ADCREAD    002561 R   |     ADC_CR1 =  005401 
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
  5 AND        002559 R   |     ARG_OFS =  000002     |   5 ASC        002551 R
    ATTRIB  =  000002     |   5 AUTORUN    002545 R   |     AUTORUN_=  004000 
  5 AWU        00253D R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        002535 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       00252C R   |     BS      =  000008     |     BSAVE   =  000002 
  5 BSET       002523 R   |     BSIZE   =  000001     |   5 BTEST      002519 R
  5 BTOGL      00250F R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        002507 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       0024FE R
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
    CR      =  00000D     |   5 CRH        0024F6 R   |   5 CRL        0024EE R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       0024E5 R
  5 DATALN     0024DA R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        0024D2 R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        0024CA R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0024C2 R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0024BB R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      0024B1 R   |   5 DWRITE     0024A6 R   |   5 EEPROM     002493 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        00249E R   |     ENQ     =  000005 
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

    FCOMP   =  000005     |   5 FCPU       00248A R   |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |   5 FILERX     00247F R
  5 FILETX     002474 R   |     FIRST   =  000001     |     FIRST_DA=  000006 
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        00246C R
  5 FORGET     002461 R   |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002457 R
  5 GOTO       00244E R   |   5 GPIO       002445 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        00243D R   |     HSECNT  =  004809 
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
  5 IDR        002435 R   |   5 IF         00242E R   |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002424 R
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     002419 R
    INW     =  000009     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     00240E R   |   5 IWDGREF    002402 R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0023FA R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0023F2 R   |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  002577 R   |   5 LIST       0023E9 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   5 LOAD       0023E0 R   |   5 LOG        0023D8 R
  5 LSHIFT     0023CD R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0023BC R   |   5 NEXT       0023C4 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0023B4 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0023AC R   |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         0023A5 R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00239B R
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
    PE      =  000014     |   5 PEEK       002388 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       00237F R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      002391 R   |   5 POKE       002376 R   |     PORT    =  000003 
  5 POUT       00236D R   |     PREV    =  000001     |   5 PRINT      002363 R
    PROD    =  000002     |   5 PRTA       00235A R   |   5 PRTB       002351 R
  5 PRTC       002348 R   |   5 PRTD       00233F R   |   5 PRTE       002336 R
  5 PRTF       00232D R   |   5 PRTG       002324 R   |   5 PRTH       00231B R
  5 PRTI       002312 R   |   5 QKEY       002309 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       002300 R
  5 REBOOT     0022F5 R   |     REG     =  000001     |     RELOP   =  000005 
  5 REMARK     0022EA R   |   5 RESTORE    0022DE R   |     RETL1   =  000001 
  5 RETURN     0022D3 R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0022CB R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     0022C0 R   |     RST_SR  =  0050B3     |   5 RUN        0022B8 R
    RXCHAR  =  000001     |   5 SAVE       0022AF R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0022A6 R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       00229D R   |     SKIP    =  000005     |   5 SLEEP      002293 R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      00227F R   |   5 SPIRD      002289 R   |   5 SPISEL     002274 R
  5 SPIWR      00226A R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002261 R   |   5 STOP       002258 R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      00224E R   |     TIM1_ARR=  005262 
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
  5 TIMEOUT    002238 R   |   5 TIMER      002244 R   |     TIM_CR1_=  000007 
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
    TK_VAR  =  000005     |   5 TO         002231 R   |   5 TONE       002228 R
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00221D R
  5 UBTN_Han   00007A R   |   5 UFLASH     002212 R   |   5 UNTIL      002208 R
    US      =  00001F     |   5 USER_ABO   000082 R   |     USE_BLOC=  000000 
  5 USR        002200 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 Uart1RxH   00000F R   |   5 UserButt   00004D R
    VAR_ADDR=  000006     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       0021F7 R   |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      0021ED R
  5 WRITE      0021E3 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        0021DB R   |   5 XPEEK      0021D1 R
    XSAVE   =  000005     |     YSAVE   =  000003     |   5 abs        001CE2 R
  1 acc16      00000C R   |   1 acc24      00000B R   |   1 acc8       00000D R
  5 accept_c   000A39 R   |   5 add        000D9B R   |   5 analog_r   00179F R
  5 ansi_seq   0009FB R   |   5 arduino_   001DCD R   |   5 arg_list   000EDA R
  1 array_si   000023 R   |   5 ascii      001B95 R   |   5 at_tst     000C0C R
  5 atoi24     000D16 R   |   5 atoi_exi   000D84 R   |   5 autorun    001C1E R
  5 autorun_   0005EA R   |   5 awu        001C93 R   |   5 awu02      001C9D R
  5 bad_port   001BED R   |   1 base       00000A R   |   1 basicptr   000004 R
  5 beep       001727 R   |   5 bin_exit   000B10 R   |   5 bit_and    001CF6 R
  5 bit_or     001D0E R   |   5 bit_rese   0014F0 R   |   5 bit_set    0014E0 R
  5 bit_test   001511 R   |   5 bit_togg   001501 R   |   5 bit_xor    001D26 R
  5 bitmask    001F39 R   |   5 bkslsh_t   000BB7 R   |   5 bksp       0001E1 R
  5 break_po   00186C R   |   5 bye        001C15 R   |   5 cancel_a   0005B2 R
  5 char       001B83 R   |   5 check_fu   000376 R   |   5 clear_ba   0005FF R
  5 clear_va   00047F R   |   5 clock_in   00009D R   |   5 cmd_end    001713 R
  5 cmd_line   0007AB R   |   5 cmd_name   000E46 R   |   5 cmp_name   0018E0 R
  5 cold_sta   0004ED R   |   5 colon_ts   000BE0 R   |   5 comma_ts   000BEB R
  5 compile    000385 R   |   5 const_cr   001FED R   |   5 const_cr   001FF3 R
  5 const_dd   001FE7 R   |   5 const_ee   002005 R   |   5 const_id   001FE1 R
  5 const_in   001FFF R   |   5 const_od   001FDB R   |   5 const_ou   001FF9 R
  5 const_po   001FA5 R   |   5 const_po   001FAB R   |   5 const_po   001FB1 R
  5 const_po   001FB7 R   |   5 const_po   001FBD R   |   5 const_po   001FC3 R
  5 const_po   001FC9 R   |   5 const_po   001FCF R   |   5 const_po   001FD5 R
  5 convert_   000A98 R   |   1 count      000003 R   |   5 cp_loop    000E89 R
  5 create_g   0002D5 R   |   5 cs_high    002194 R   |   5 cstk_pro   0010CD R
  5 dash_tst   000C01 R   |   5 data       00200B R   |   1 data_len   000009 R
  5 data_lin   002011 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002051 R   |   5 dec_base   001128 R   |   5 del_back   000A2A R
  5 del_line   00029D R   |   5 del_ln     000A1B R   |   5 delete     0001F1 R
  5 digital_   0017D3 R   |   5 digital_   001803 R   |   5 dir_loop   001AC2 R
  5 director   001AB6 R   |   5 divide     000DF1 R   |   5 divu24_8   00094E R
  5 do_loop    001F62 R   |   5 dotr_loo   00109D R   |   5 drive_fr   001B3F R
  5 enable_i   001EE3 R   |   5 eql_tst    000C6C R   |   5 equal      0013BB R
  5 err_bad_   0006E2 R   |   5 err_cmd_   0006A3 R   |   5 err_div0   000665 R
  5 err_dupl   0006BE R   |   5 err_math   00064B R   |   5 err_mem_   00062E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  5 err_msg    000610 R   |   5 err_no_a   0006EF R   |   5 err_no_d   000723 R
  5 err_no_f   000749 R   |   5 err_no_l   000675 R   |   5 err_no_p   000734 R
  5 err_not_   0006D0 R   |   5 err_run_   00068C R   |   5 err_synt   00063C R
  5 escaped    000AAD R   |   5 expect     000ECD R   |   5 expr_exi   001027 R
  5 expressi   000FE6 R   |   5 factor     000F3D R   |   1 farptr     000018 R
  5 fcpu       001D70 R   |   7 fdrive     010000 R   |   1 ffree      00001B R
  5 file_cou   001B37 R   |   5 file_rec   002199 R   |   5 file_tra   0021CE R
  5 final_te   0009F5 R   |   5 first_li   0011B1 R   |   1 flags      000025 R
  5 for        001588 R   |   5 forget     001A71 R   |   1 free_ram   00005C R
  5 fsize_ms   0021BD R   |   5 func_arg   000F01 R   |   5 func_not   001ED6 R
  5 ge         0013BD R   |   5 get_arra   000F18 R   |   5 get_targ   001652 R
  5 get_tick   001CDC R   |   5 get_toke   000B52 R   |   5 getc       0001CD R
  5 gosub      001683 R   |   5 goto       001668 R   |   5 gpio       001BC8 R
  5 gt         0013B9 R   |   5 gt_tst     000C77 R   |   5 hex_base   001123 R
  5 if         001574 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001895 R   |   5 input_ex   0014B2 R
  5 input_lo   001456 R   |   5 input_va   001454 R   |   5 insert_l   00030E R
  5 insert_l   000373 R   |   5 interpre   0007C5 R   |   5 invert     001F53 R
  5 is_alpha   00048D R   |   5 is_digit   00049E R   |   5 itoa       000907 R
  5 itoa_loo   00091F R   |   5 jp_to_ta   001676 R   |   5 key        001BB5 R
  5 kword_di   002575 R   |   5 kword_en   0021CF R   |   5 le         0013C2 R
  5 leading_   001F29 R   |   5 left_arr   0009FB R   |   5 let        001159 R
  5 let_arra   001167 R   |   5 let_var    00116A R   |   5 lines_sk   0011B4 R
  5 list       001184 R   |   5 list_exi   0011FA R   |   5 list_sta   0011D4 R
  5 load       001A3C R   |   5 load_aut   0005C1 R   |   5 load_fil   001A0B R
  5 log2       001F1E R   |   5 logical_   001ECC R   |   5 loop_bac   001635 R
  1 loop_dep   000022 R   |   5 loop_don   00164A R   |   5 lshift     001D3E R
  5 lt         0013C0 R   |   5 lt_tst     000CB0 R   |   5 modulo     000E35 R
  5 move       000237 R   |   5 move_dow   000255 R   |   5 move_exi   000276 R
  5 move_loo   00025A R   |   5 move_up    000247 R   |   5 mul_char   0013AA R
  5 multiply   000DA9 R   |   5 mulu24_8   000976 R   |   5 nbr_tst    000B8D R
  5 ne         0013C5 R   |   5 neg_acc2   0009B0 R   |   5 new        00188A R
  5 next       001608 R   |   5 next_tok   000810 R   |   5 no_match   000E9B R
  5 none       000B52 R   |   5 other      000CE8 R   |   3 pad        001738 R
  5 parse_bi   000AF0 R   |   5 parse_in   000AB5 R   |   5 parse_ke   000B18 R
  5 parse_qu   000A5D R   |   5 pause      001C80 R   |   5 pause02    001C8A R
  5 peek       001547 R   |   5 pin_mode   001D7C R   |   5 plus_tst   000C40 R
  5 poke       001538 R   |   5 power_ad   001763 R   |   5 prcnt_ts   000C61 R
  5 print      0013C8 R   |   5 print_ex   001428 R   |   5 print_in   0008A9 R
  5 print_ty   001434 R   |   5 prt_basi   00124D R   |   5 prt_cmd_   0011FD R
  5 prt_loop   0013CC R   |   5 prt_quot   001211 R   |   5 prti24     000861 R
  1 ptr16      000019 R   |   1 ptr8       00001A R   |   5 putc       0001C4 R
  5 puts       0001D7 R   |   5 qkey       001BBD GR  |   5 qmark_ts   000C17 R
  5 random     001DED R   |   5 read       002089 R   |   5 read01     00208B R
  5 readln     0009D3 R   |   5 readln_l   0009D9 R   |   5 readln_q   000A4E R
  5 refresh_   001F19 R   |   5 rel_exit   00107E R   |   5 relation   00102A R
  5 relop_st   0013AD R   |   5 remark     0014B5 R   |   5 reprint    0009FB R
  5 reset_co   0013CA R   |   5 rest_con   001444 R   |   5 restore    00203E R
  5 return     0016A3 R   |   5 right_ar   0009FB R   |   5 row_loop   001106 R
  5 rparnt_t   000BD5 R   |   5 rshift     001D57 R   |   5 run        0016C1 R
  5 run_it     0016EC R   |   1 rx_char    000027 R   |   5 save       00194C R
  5 save_con   001434 R   |   5 search_d   000E78 R   |   5 search_e   000EC9 R
  5 search_f   001901 R   |   5 search_l   000279 R   |   5 search_l   000281 R
  5 search_n   000E7C R   |   1 seedx      000014 R   |   1 seedy      000016 R
  5 seek_fdr   0018A3 R   |   5 select_p   001DBD R   |   5 set_time   001EBA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

  5 sharp_ts   000BF6 R   |   5 show       001081 R   |   5 show_row   0010F4 R
  5 single_c   0013A6 R   |   5 size       00112D R   |   5 skip       000D88 R
  5 slash_ts   000C56 R   |   5 sleep      001C75 R   |   5 software   0004A7 R
  5 spaces     0001FF R   |   5 spi_clea   00212D R   |   5 spi_disa   002115 R
  5 spi_enab   0020E3 R   |   5 spi_rcv_   00214F R   |   5 spi_read   00217A R
  5 spi_sele   002182 R   |   5 spi_send   002139 R   |   5 spi_writ   00215A R
  3 stack_fu   001760 R   |   3 stack_un   001800 R   |   5 star_tst   000C4B R
  5 step       0015E1 R   |   5 stop       00183E R   |   5 store_lo   0015F5 R
  5 str_matc   000EAA R   |   5 str_tst    000B7C R   |   5 strcmp     000218 R
  5 strcpy     000229 R   |   5 strlen     00020B R   |   5 substrac   000DA3 R
  5 syntax_e   00075D R   |   1 tab_widt   000026 R   |   5 tb_error   00075F R
  5 term       000F97 R   |   5 term01     000FA0 R   |   5 term_exi   000FE3 R
  3 tib        0016E8 R   |   5 tick_tst   000C2E R   |   1 ticks      000010 R
  5 timeout    001EC9 R   |   1 timer      000012 R   |   5 timer2_i   0000B3 R
  5 timer4_i   0000C0 R   |   1 tmp16      00000E R   |   1 tmp8       00000F R
  5 to         0015B1 R   |   5 to_upper   000D0A GR  |   5 token_ch   000CF7 R
  5 token_ex   000D07 R   |   5 tone       00171A R   |   5 try_next   002079 R
  1 txtbgn     00001E R   |   1 txtend     000020 R   |   5 uart1_in   000189 R
  5 uart1_se   000199 R   |   5 ubound     001137 R   |   5 uflash     001BF2 R
  5 unlock_e   0000D5 R   |   5 unlock_f   0000E3 R   |   5 until      001F77 R
  5 user_int   000060 R   |   5 user_spa   002580 R   |   5 usr        001BF8 R
  1 vars       000028 R   |   5 wait       0014BB R   |   5 warm_ini   000594 R
  5 warm_sta   0007A8 R   |   5 words      001E54 R   |   5 words_co   001EA4 R
  5 write      001B4C R   |   5 write_bl   000166 R   |   5 write_by   0000F1 R
  5 write_ee   00012D R   |   5 write_ex   000161 R   |   5 write_fl   000117 R
  5 xpeek      001558 R   |     xreceive   ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5C   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    118   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   258E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

