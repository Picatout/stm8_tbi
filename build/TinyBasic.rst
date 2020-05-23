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
                                            ; extracted except if it was end of line 
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
      008000 82 00 86 5A            109     int cold_start			; RESET vector 
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
      0080AA CC 86 5A         [ 2]  188 	jp cold_start 	
      0080AD                        189 2$: 
      0080AD A1 1A            [ 1]  190 	cp a,#CTRL_Z
      0080AF 26 06            [ 1]  191 	jrne 3$
      0080B1 CD 87 1C         [ 4]  192 	call cancel_autorun 
      0080B4 CC 86 5A         [ 2]  193 	jp cold_start 
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
      00810F CD 95 9E         [ 4]  264 	call prt_basic_line
      008112                        265 UBTN_Handler_exit:
      008112 AE 17 FF         [ 2]  266     ldw x,#STACK_EMPTY 
      008115 94               [ 1]  267     ldw sp,x
      008116 9A               [ 1]  268 	rim 
      008117 CC 89 86         [ 2]  269 	jp warm_start
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
      0082F7 CD 9A A4         [ 4]  604 	call incr_farptr
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
      008384 CD 8A 4D         [ 4]  712 	call print_int 
      008387 A6 20            [ 1]  713 	ld a,#SPACE
      008389 CD 83 40         [ 4]  714 	call putc 
      00838C 1E 03            [ 2]  715 	ldw x,(XREG,sp)
      00838E CD 8A 4D         [ 4]  716 	call print_int 
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
      0083B4 CD 8A 4D         [ 4]  748 	call print_int 
      0083B7 A6 20            [ 1]  749 	ld a,#SPACE  
      0083B9 CD 83 40         [ 4]  750 	call putc
      0083BC                        751 row_loop:
      0083BC 1E 02            [ 2]  752 	ldw x,(ADR,sp)
      0083BE F6               [ 1]  753 	ld a,(x)
      0083BF 5F               [ 1]  754 	clrw x 
      0083C0 97               [ 1]  755 	ld xl,a 
      0083C1 CD 8A 4D         [ 4]  756 	call print_int 
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
      008507 26 19            [ 1] 1029 	jrne 0$
                                   1030 ;first text line 
      008509 AE 00 02         [ 2] 1031 	ldw x,#2 
      00850C 72 D6 00 18      [ 4] 1032 	ld a,([ptr16],x)
      008510 A1 03            [ 1] 1033 	cp a,#3
      008512 27 59            [ 1] 1034 	jreq insert_ln_exit
      008514 5F               [ 1] 1035 	clrw x 
      008515 97               [ 1] 1036 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008516 1F 07            [ 2] 1037 	ldw (LLEN,sp),x 
      008518 CE 00 1D         [ 2] 1038 	ldw x,txtbgn
      00851B 1F 01            [ 2] 1039 	ldw (DEST,sp),x 
      00851D CE 00 1F         [ 2] 1040 	ldw x,txtend 
      008520 20 37            [ 2] 1041 	jra 4$
      008522 72 CE 00 18      [ 5] 1042 0$:	ldw x,[ptr16]
                                   1043 ; line number
      008526 1F 05            [ 2] 1044 	ldw (LINENO,sp),x 
      008528 AE 00 02         [ 2] 1045 	ldw x,#2 
      00852B 72 D6 00 18      [ 4] 1046 	ld a,([ptr16],x)
      00852F 97               [ 1] 1047 	ld xl,a
                                   1048 ; line length
      008530 1F 07            [ 2] 1049 	ldw (LLEN,sp),x
                                   1050 ; check if that line number already exit 	
      008532 1E 05            [ 2] 1051 	ldw x,(LINENO,sp)
      008534 CD 84 82         [ 4] 1052 	call search_lineno 
      008537 5D               [ 2] 1053 	tnzw x 
      008538 26 04            [ 1] 1054 	jrne 2$
                                   1055 ; line doesn't exit
                                   1056 ; it will be inserted at this point.  	
      00853A 17 01            [ 2] 1057 	ldw (DEST,sp),y 
      00853C 20 05            [ 2] 1058 	jra 3$
                                   1059 ; line exit delete it.
                                   1060 ; it will be replaced by new one 	
      00853E 1F 01            [ 2] 1061 2$: ldw (DEST,sp),x 
      008540 CD 84 A6         [ 4] 1062 	call del_line
      008543                       1063 3$: 
                                   1064 ; insert new line or leave if LLEN==3
                                   1065 ; LLEN==3 means empty line 
      008543 A6 03            [ 1] 1066 	ld a,#3
      008545 11 08            [ 1] 1067 	cp a,(LLEN+1,sp)
      008547 27 24            [ 1] 1068 	jreq insert_ln_exit ; empty line exit.
                                   1069 ; if insertion point at txtend 
                                   1070 ; move no need to create a gap 
      008549 1E 01            [ 2] 1071 	ldw x,(DEST,sp)
      00854B C3 00 1F         [ 2] 1072 	cpw x,txtend 
      00854E 27 09            [ 1] 1073 	jreq 4$ 
                                   1074 ; must create a gap
                                   1075 ; at insertion point  
      008550 1E 01            [ 2] 1076 	ldw x,(DEST,sp)
      008552 16 07            [ 2] 1077 	ldw y,(LLEN,sp)
      008554 CD 84 D3         [ 4] 1078 	call create_gap
      008557 20 06            [ 2] 1079 	jra 5$
      008559                       1080 4$: 
      008559 72 FB 07         [ 2] 1081 	addw x,(LLEN,sp)
      00855C CF 00 1F         [ 2] 1082 	ldw txtend,x 	 
                                   1083 ; move new line in gap 
      00855F 1E 07            [ 2] 1084 5$:	ldw x,(LLEN,sp)
      008561 CF 00 0D         [ 2] 1085 	ldw acc16,x 
      008564 90 AE 16 E0      [ 2] 1086 	ldw y,#pad ;SRC 
      008568 1E 01            [ 2] 1087 	ldw x,(DEST,sp) ; dest address 
      00856A CD 84 40         [ 4] 1088 	call move 
      00856D                       1089 insert_ln_exit:	
      0004ED                       1090 	_drop VSIZE
      00856D 5B 08            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856F 81               [ 4] 1091 	ret
                                   1092 
                                   1093 ;-----------------------------------
                                   1094 ; create token list fromm text line 
                                   1095 ; save this list in pad buffer 
                                   1096 ;  compiled line format: 
                                   1097 ;    line_no  2 bytes {0...32767}
                                   1098 ;    count    1 byte  
                                   1099 ;    tokens   variable length 
                                   1100 ;   
                                   1101 ; input:
                                   1102 ;   none
                                   1103 ; modified variables:
                                   1104 ;   basicptr     token list buffer address 
                                   1105 ;   in.w  		 3|count, i.e. index in buffer
                                   1106 ;   count        length of line | 0  
                                   1107 ;-----------------------------------
                           000001  1108 	XSAVE=1
                           000002  1109 	VSIZE=2
      008570                       1110 compile:
      0004F0                       1111 	_vars VSIZE 
      008570 52 02            [ 2]    1     sub sp,#VSIZE 
      008572 72 1A 00 24      [ 1] 1112 	bset flags,#FCOMP 
      008576 A6 00            [ 1] 1113 	ld a,#0
      008578 AE 00 00         [ 2] 1114 	ldw x,#0
      00857B CF 16 E0         [ 2] 1115 	ldw pad,x ; destination buffer 
      00857E C7 16 E2         [ 1] 1116 	ld pad+2,a ; count 
      008581 AE 16 E3         [ 2] 1117 	ldw x,#pad+3
      008584 72 5F 00 02      [ 1] 1118 	clr in 
      008588 CD 8C 7C         [ 4] 1119 	call get_token
      00858B A1 84            [ 1] 1120 	cp a,#TK_INTGR
      00858D 26 11            [ 1] 1121 	jrne 2$
      00858F A3 00 01         [ 2] 1122 	cpw x,#1 
      008592 2A 05            [ 1] 1123 	jrpl 1$
      008594 A6 0A            [ 1] 1124 	ld a,#ERR_BAD_VALUE
      008596 CC 89 01         [ 2] 1125 	jp tb_error
      008599 CF 16 E0         [ 2] 1126 1$:	ldw pad,x 
      00859C 90 AE 16 E3      [ 2] 1127 	ldw y,#pad+3 
      0085A0 90 A3 17 60      [ 2] 1128 2$:	cpw y,#stack_full 
      0085A4 25 05            [ 1] 1129 	jrult 3$
      0085A6 A6 0F            [ 1] 1130 	ld a,#ERR_BUF_FULL 
      0085A8 CC 89 01         [ 2] 1131 	jp tb_error 
      0085AB                       1132 3$:	
      0085AB 93               [ 1] 1133 	ldw x,y 
      0085AC CD 8C 7C         [ 4] 1134 	call get_token 
      0085AF A1 00            [ 1] 1135 	cp a,#TK_NONE 
      0085B1 26 ED            [ 1] 1136 	jrne 2$ 
                                   1137 ; compilation completed  
      0085B3 72 A2 16 E0      [ 2] 1138 	subw y,#pad
      0085B7 90 9F            [ 1] 1139     ld a,yl
      0085B9 AE 16 E0         [ 2] 1140 	ldw x,#pad 
      0085BC CF 00 18         [ 2] 1141 	ldw ptr16,x 
      0085BF E7 02            [ 1] 1142 	ld (2,x),a 
      0085C1 FE               [ 2] 1143 	ldw x,(x)
      0085C2 27 09            [ 1] 1144 	jreq 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085C4 CD 84 FF         [ 4] 1145 	call insert_line
      0085C7 72 5F 00 04      [ 1] 1146 	clr  count 
      0085CB 20 0F            [ 2] 1147 	jra  11$ 
      0085CD                       1148 10$: ; line# is zero 
      0085CD CE 00 18         [ 2] 1149 	ldw x,ptr16  
      0085D0 CF 00 05         [ 2] 1150 	ldw basicptr,x 
      0085D3 E6 02            [ 1] 1151 	ld a,(2,x)
      0085D5 C7 00 04         [ 1] 1152 	ld count,a 
      0085D8 35 03 00 02      [ 1] 1153 	mov in,#3 
      0085DC                       1154 11$:
      00055C                       1155 	_drop VSIZE 
      0085DC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0085DE 72 1B 00 24      [ 1] 1156 	bres flags,#FCOMP 
      0085E2 81               [ 4] 1157 	ret 
                                   1158 
                                   1159 ;------------------------------------
                                   1160 ;  set all variables to zero 
                                   1161 ; input:
                                   1162 ;   none 
                                   1163 ; output:
                                   1164 ;	none
                                   1165 ;------------------------------------
      0085E3                       1166 clear_vars:
      0085E3 AE 00 30         [ 2] 1167 	ldw x,#vars 
      0085E6 90 AE 00 34      [ 2] 1168 	ldw y,#2*26 
      0085EA 7F               [ 1] 1169 1$:	clr (x)
      0085EB 5C               [ 2] 1170 	incw x 
      0085EC 90 5A            [ 2] 1171 	decw y 
      0085EE 26 FA            [ 1] 1172 	jrne 1$
      0085F0 81               [ 4] 1173 	ret 
                                   1174 
                                   1175 ;-------------------------------------
                                   1176 ; check if A is a letter 
                                   1177 ; input:
                                   1178 ;   A 			character to test 
                                   1179 ; output:
                                   1180 ;   C flag      1 true, 0 false 
                                   1181 ;-------------------------------------
      0085F1                       1182 is_alpha:
      0085F1 A1 41            [ 1] 1183 	cp a,#'A 
      0085F3 8C               [ 1] 1184 	ccf 
      0085F4 24 0B            [ 1] 1185 	jrnc 9$ 
      0085F6 A1 5B            [ 1] 1186 	cp a,#'Z+1 
      0085F8 25 07            [ 1] 1187 	jrc 9$ 
      0085FA A1 61            [ 1] 1188 	cp a,#'a 
      0085FC 8C               [ 1] 1189 	ccf 
      0085FD 24 02            [ 1] 1190 	jrnc 9$
      0085FF A1 7B            [ 1] 1191 	cp a,#'z+1
      008601 81               [ 4] 1192 9$: ret 	
                                   1193 
                                   1194 ;------------------------------------
                                   1195 ; check if character in {'0'..'9'}
                                   1196 ; input:
                                   1197 ;    A  character to test
                                   1198 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1199 ;    Carry  0 not digit | 1 digit
                                   1200 ;------------------------------------
      008602                       1201 is_digit:
      008602 A1 30            [ 1] 1202 	cp a,#'0
      008604 25 03            [ 1] 1203 	jrc 1$
      008606 A1 3A            [ 1] 1204     cp a,#'9+1
      008608 8C               [ 1] 1205 	ccf 
      008609 8C               [ 1] 1206 1$:	ccf 
      00860A 81               [ 4] 1207     ret
                                   1208 
                                   1209 ;-------------------------------------
                                   1210 ; return true if character in  A 
                                   1211 ; is letter or digit.
                                   1212 ; input:
                                   1213 ;   A     ASCII character 
                                   1214 ; output:
                                   1215 ;   A     no change 
                                   1216 ;   Carry    0 false| 1 true 
                                   1217 ;--------------------------------------
      00860B                       1218 is_alnum:
      00860B CD 86 02         [ 4] 1219 	call is_digit
      00860E 25 03            [ 1] 1220 	jrc 1$ 
      008610 CD 85 F1         [ 4] 1221 	call is_alpha
      008613 81               [ 4] 1222 1$:	ret 
                                   1223 
                                   1224 
                                   1225 ;-------------------------------------
                                   1226 ;  program initialization entry point 
                                   1227 ;-------------------------------------
                           000001  1228 	MAJOR=1
                           000000  1229 	MINOR=0
      008614 0A 0A 54 69 6E 79 20  1230 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00865A                       1231 cold_start:
                                   1232 ;set stack 
      00865A AE 17 FF         [ 2] 1233 	ldw x,#STACK_EMPTY
      00865D 94               [ 1] 1234 	ldw sp,x   
                                   1235 ; clear all ram 
      00865E 7F               [ 1] 1236 0$: clr (x)
      00865F 5A               [ 2] 1237 	decw x 
      008660 26 FC            [ 1] 1238 	jrne 0$
                                   1239 ; activate pull up on all inputs 
      008662 A6 FF            [ 1] 1240 	ld a,#255 
      008664 C7 50 03         [ 1] 1241 	ld PA_CR1,a 
      008667 C7 50 08         [ 1] 1242 	ld PB_CR1,a 
      00866A C7 50 0D         [ 1] 1243 	ld PC_CR1,a 
      00866D C7 50 12         [ 1] 1244 	ld PD_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008670 C7 50 17         [ 1] 1245 	ld PE_CR1,a 
      008673 C7 50 1C         [ 1] 1246 	ld PF_CR1,a 
      008676 C7 50 21         [ 1] 1247 	ld PG_CR1,a 
      008679 C7 50 2B         [ 1] 1248 	ld PI_CR1,a
                                   1249 ; set LD2 pin as output and turn it on
      00867C 72 1A 50 0D      [ 1] 1250     bset PC_CR1,#LED2_BIT
      008680 72 1A 50 0E      [ 1] 1251     bset PC_CR2,#LED2_BIT
      008684 72 1A 50 0C      [ 1] 1252     bset PC_DDR,#LED2_BIT
      008688 72 1A 50 0A      [ 1] 1253 	bset PC_ODR,#LED2_BIT 
                                   1254 ; disable schmitt triggers on Arduino CN4 analog inputs
      00868C 55 00 3F 54 07   [ 1] 1255 	mov ADC_TDRL,0x3f
                                   1256 ; disable peripherals clocks
                                   1257 ;	clr CLK_PCKENR1 
                                   1258 ;	clr CLK_PCKENR2
      008691 72 5F 50 F2      [ 1] 1259 	clr AWU_TBR 
      008695 72 14 50 CA      [ 1] 1260 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1261 ; select internal clock no divisor: 16 Mhz 	
      008699 A6 E1            [ 1] 1262 	ld a,#CLK_SWR_HSI 
      00869B 5F               [ 1] 1263 	clrw x  
      00869C CD 81 35         [ 4] 1264     call clock_init 
      00869F CD 81 58         [ 4] 1265 	call timer4_init
      0086A2 CD 81 4B         [ 4] 1266 	call timer2_init
                                   1267 ; UART1 at 115200 BAUD
      0086A5 CD 82 FD         [ 4] 1268 	call uart1_init
                                   1269 ; activate PE_4 (user button interrupt)
      0086A8 72 18 50 18      [ 1] 1270     bset PE_CR2,#USR_BTN_BIT 
                                   1271 ; display system information
      0086AC AE 86 14         [ 2] 1272 	ldw x,#software 
      0086AF CD A8 C0         [ 4] 1273 	call puts 
      0086B2 A6 01            [ 1] 1274 	ld a,#MAJOR 
      0086B4 C7 00 0E         [ 1] 1275 	ld acc8,a 
      0086B7 5F               [ 1] 1276 	clrw x 
      0086B8 CF 00 0C         [ 2] 1277 	ldw acc24,x
      0086BB 72 5F 00 25      [ 1] 1278 	clr tab_width  
      0086BF 35 0A 00 0B      [ 1] 1279 	mov base, #10 
      0086C3 CD 8A 5D         [ 4] 1280 	call prti24 
      0086C6 A6 2E            [ 1] 1281 	ld a,#'.
      0086C8 CD 83 40         [ 4] 1282 	call putc 
      0086CB A6 00            [ 1] 1283 	ld a,#MINOR 
      0086CD C7 00 0E         [ 1] 1284 	ld acc8,a 
      0086D0 5F               [ 1] 1285 	clrw x 
      0086D1 CF 00 0C         [ 2] 1286 	ldw acc24,x 
      0086D4 CD 8A 5D         [ 4] 1287 	call prti24
      0086D7 A6 0D            [ 1] 1288 	ld a,#CR 
      0086D9 CD 83 40         [ 4] 1289 	call putc
      0086DC CD 9A B2         [ 4] 1290 	call seek_fdrive 
      0086DF 9A               [ 1] 1291 	rim 
      0086E0 72 5C 00 16      [ 1] 1292 	inc seedy+1 
      0086E4 72 5C 00 14      [ 1] 1293 	inc seedx+1 
      0086E8 CD 87 69         [ 4] 1294 	call clear_basic
      0086EB CD 92 CA         [ 4] 1295 	call ubound 
                                   1296 ;	jra 2$	
      0086EE CD 99 00         [ 4] 1297 	call beep_1khz  
      0086F1 72 1B 50 0A      [ 1] 1298 2$:	bres PC_ODR,#LED2_BIT	
      0086F5 CD 86 FE         [ 4] 1299 	call warm_init
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086F8 CD 87 2B         [ 4] 1300 	call load_autorun
      0086FB CC 89 89         [ 2] 1301     jp cmd_line  
                                   1302 
      0086FE                       1303 warm_init:
      0086FE 72 5F 00 24      [ 1] 1304 	clr flags 
      008702 72 5F 00 21      [ 1] 1305 	clr loop_depth 
      008706 35 04 00 25      [ 1] 1306 	mov tab_width,#TAB_WIDTH 
      00870A 35 0A 00 0B      [ 1] 1307 	mov base,#10 
      00870E AE 00 00         [ 2] 1308 	ldw x,#0 
      008711 CF 00 05         [ 2] 1309 	ldw basicptr,x 
      008714 CF 00 01         [ 2] 1310 	ldw in.w,x 
      008717 72 5F 00 04      [ 1] 1311 	clr count
      00871B 81               [ 4] 1312 	ret 
                                   1313 
                                   1314 ;--------------------------
                                   1315 ; called by tb_error when
                                   1316 ; flag FAUTORUN is set.
                                   1317 ; There is a bug in autorun 
                                   1318 ; program so cancel it.
                                   1319 ;---------------------------
      00871C                       1320 cancel_autorun:
      00871C AE 40 00         [ 2] 1321 	ldw x,#AUTORUN_NAME 
      00871F CF 00 18         [ 2] 1322 	ldw farptr+1,x 
      008722 4F               [ 1] 1323 	clr a
      008723 5F               [ 1] 1324 	clrw x  
      008724 C7 00 17         [ 1] 1325 	ld farptr,a 
      008727 CD 82 65         [ 4] 1326 	call write_byte 
      00872A 81               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------
                                   1331 ; if autorun file defined 
                                   1332 ; in eeprom address AUTORUN_NAME 
                                   1333 ; load and run it.
                                   1334 ;-------------------------
      00872B                       1335 load_autorun:
      00872B 90 AE 40 00      [ 2] 1336 	ldw y,#AUTORUN_NAME
      00872F 90 F6            [ 1] 1337 	ld a,(y)
      008731 27 20            [ 1] 1338 	jreq 9$
      008733 CD 9B 18         [ 4] 1339 	call search_file
      008736 25 05            [ 1] 1340 	jrc 2$ 
                                   1341 ; if file doesn't exit
      008738 CD 87 1C         [ 4] 1342 	call cancel_autorun
      00873B 20 16            [ 2] 1343 	jra 9$ 
      00873D CD 9C 31         [ 4] 1344 2$:	call load_file
      008740 AE 40 00         [ 2] 1345 	ldw x,#AUTORUN_NAME 
      008743 CD A8 C0         [ 4] 1346 	call puts
      008746 AE 87 54         [ 2] 1347 	ldw x,#autorun_msg 
      008749 CD A8 C0         [ 4] 1348 	call puts 
      00874C 72 1C 00 24      [ 1] 1349 	bset flags,#FAUTORUN 
      008750 CC 98 D2         [ 2] 1350 	jp run_it    
      008753 81               [ 4] 1351 9$: ret 	
                                   1352 
      008754 20 6C 6F 61 64 65 64  1353 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  6E-Bits]



             6E 6E 69 6E 67 0A 00
                                   1354 ;---------------------------
                                   1355 ; reset BASIC text variables 
                                   1356 ; and clear variables 
                                   1357 ;---------------------------
      0006E9                       1358 clear_basic:
      008763 6E 69 6E 67      [ 1] 1359 	clr count
      008767 0A 00 00 01      [ 1] 1360 	clr in  
      008769 AE 00 63         [ 2] 1361 	ldw x,#free_ram 
      008769 72 5F 00         [ 2] 1362 	ldw txtbgn,x 
      00876C 04 72 5F         [ 2] 1363 	ldw txtend,x 
      00876F 00 02 AE         [ 4] 1364 	call clear_vars 
      008772 00               [ 4] 1365 	ret 
                                   1366 
                                   1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1368 ;;   Tiny BASIC error messages     ;;
                                   1369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0006FE                       1370 err_msg:
      008773 64 CF 00 1D CF 00 1F  1371 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             CD 85 E3 81 61
      00877E 07 77 07 8D 07 A7 07  1372 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B8 07 C9
      00877E 00 00 87 9E 87 AB 87  1373 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             B9 87 D2
                                   1374 
      008788 87 E1 87 F7 88 0D 88  1375 err_mem_full: .asciz "Memory full\n" 
             27 88 38 88 49 88
      008795 55 88 88 88 98 88 AC  1376 err_syntax: .asciz "syntax error\n" 
             88 BF 4D 65 6D 6F 72
      0087A3 79 20 66 75 6C 6C 0A  1377 err_math_ovf: .asciz "math operation overflow\n"
             00 73 79 6E 74 61 78
             20 65 72 72 6F 72 0A
             00 6D 61 74
      0087BC 68 20 6F 70 65 72 61  1378 err_div0: .asciz "division by 0\n" 
             74 69 6F 6E 20 6F 76
             65
      0087CB 72 66 6C 6F 77 0A 00  1379 err_no_line: .asciz "invalid line number.\n"
             64 69 76 69 73 69 6F
             6E 20 62 79 20 30 0A
             00
      0087E1 69 6E 76 61 6C 69 64  1380 err_run_only: .asciz "run time only usage.\n" 
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0087F7 72 75 6E 20 74 69 6D  1381 err_cmd_only: .asciz "command line only usage.\n"
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00 63 6F 6D 6D
      008811 61 6E 64 20 6C 69 6E  1382 err_duplicate: .asciz "duplicate name.\n"
             65 20 6F 6E 6C 79 20
             75 73 61
      008822 67 65 2E 0A 00 64 75  1383 err_not_file: .asciz "File not found.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      008833 6D 65 2E 0A 00 46 69  1384 err_bad_value: .asciz "bad value.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  6C-Bits]



             75 65 2E 0A 00
      00883B 65 20 6E 6F 74 20 66  1385 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6F 75 6E 64 2E 0A 00
             62 61 64 20 76 61 6C
             75 65 2E 0A 00 46 69
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20
      00886E 63 61 6E 27 74 20 62  1386 err_no_data: .asciz "No data found.\n"
             65 20 72 75 6E 20 66
             72 6F
      00887E 6D 20 74 68 65 72 65  1387 err_no_prog: .asciz "No program in RAM!\n"
             2E 0A 00 4E 6F 20 64
             61 74 61 20 66 6F
      008892 75 6E 64 2E 0A 00 4E  1388 err_no_fspace: .asciz "File system full.\n" 
             6F 20 70 72 6F 67 72
             61 6D 20 69 6E
      0088A5 20 52 41 4D 21 0A 00  1389 err_buf_full: .asciz "Buffer full\n"
             46 69 6C 65 20 73
                                   1390 
      0088B2 79 73 74 65 6D 20 66  1391 rt_msg: .asciz "\nrun time error, "
             75 6C 6C 2E 0A 00 42
             75 66 66 65
      0088C4 72 20 66 75 6C 6C 0A  1392 comp_msg: .asciz "\ncompile error, "
             00 0A 72 75 6E 20 74
             69 6D 65
      0088D5 20 65 72 72 6F 72 2C  1393 tk_id: .asciz "last token id: "
             20 00 0A 63 6F 6D 70
             69 6C
                                   1394 
      00087F                       1395 syntax_error:
      0088E5 65 20            [ 1] 1396 	ld a,#ERR_SYNTAX 
                                   1397 
      000881                       1398 tb_error:
      0088E7 65 72 72 6F 72   [ 2] 1399 	btjt flags,#FCOMP,1$
      0088EC 2C               [ 1] 1400 	push a 
      0088ED 20 00 6C         [ 2] 1401 	ldw x, #rt_msg 
      0088F0 61 73 74         [ 4] 1402 	call puts 
      0088F3 20               [ 1] 1403 	pop a 
      0088F4 74 6F 6B         [ 2] 1404 	ldw x, #err_msg 
      0088F7 65 6E 20 69      [ 1] 1405 	clr acc16 
      0088FB 64               [ 1] 1406 	sll a
      0088FC 3A 20 00 0C      [ 1] 1407 	rlc acc16  
      0088FF C7 00 0D         [ 1] 1408 	ld acc8, a 
      0088FF A6 02 00 0C      [ 2] 1409 	addw x,acc16 
      008901 FE               [ 2] 1410 	ldw x,(x)
      008901 72 0A 00         [ 4] 1411 	call puts
      008904 24 47 88         [ 2] 1412 	ldw x,basicptr
      008907 AE 88 CC         [ 1] 1413 	ld a,in 
      00890A CD A8 C0         [ 4] 1414 	call prt_basic_line
      00890D 84 AE 87         [ 2] 1415 	ldw x,#tk_id 
      008910 7E 72 5F         [ 4] 1416 	call puts 
      008913 00 0D 48         [ 1] 1417 	ld a,in.saved 
      008916 72               [ 1] 1418 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008917 59               [ 1] 1419 	ld xl,a 
      008918 00 0D C7 00      [ 2] 1420 	addw x,basicptr 
      00891C 0E               [ 1] 1421 	ld a,(x)
      00891D 72               [ 1] 1422 	clrw x 
      00891E BB               [ 1] 1423 	ld xl,a 
      00891F 00 0D FE         [ 4] 1424 	call print_int
      008922 CD A8 C0 CE 00   [ 2] 1425 	btjf flags,#FAUTORUN ,6$
      008927 05 C6 00         [ 4] 1426 	call cancel_autorun  
      00892A 02 CD            [ 2] 1427 	jra 6$
      0008CD                       1428 1$:	
      00892C 95               [ 1] 1429 	push a 
      00892D 9E AE 88         [ 2] 1430 	ldw x,#comp_msg
      008930 EF CD A8         [ 4] 1431 	call puts 
      008933 C0               [ 1] 1432 	pop a 
      008934 C6 00 03         [ 2] 1433 	ldw x, #err_msg 
      008937 5F 97 72 BB      [ 1] 1434 	clr acc16 
      00893B 00               [ 1] 1435 	sll a
      00893C 05 F6 5F 97      [ 1] 1436 	rlc acc16  
      008940 CD 8A 4D         [ 1] 1437 	ld acc8, a 
      008943 72 0D 00 24      [ 2] 1438 	addw x,acc16 
      008947 3A               [ 2] 1439 	ldw x,(x)
      008948 CD 87 1C         [ 4] 1440 	call puts
      00894B 20 35 90         [ 2] 1441 	ldw x,#tib
      00894D CD 00 00         [ 4] 1442 	call puts 
      00894D 88 AE            [ 1] 1443 	ld a,#CR 
      00894F 88 DE CD         [ 4] 1444 	call putc
      008952 A8 C0 84         [ 2] 1445 	ldw x,in.w
      008955 AE 87 7E         [ 4] 1446 	call spaces
      008958 72 5F            [ 1] 1447 	ld a,#'^
      00895A 00 0D 48         [ 4] 1448 	call putc 
      00895D 72 59 00         [ 2] 1449 6$: ldw x,#STACK_EMPTY 
      008960 0D               [ 1] 1450     ldw sp,x
      000906                       1451 warm_start:
      008961 C7 00 0E         [ 4] 1452 	call warm_init
                                   1453 ;----------------------------
                                   1454 ;   BASIC interpreter
                                   1455 ;----------------------------
      000909                       1456 cmd_line: ; user interface 
      008964 72 BB            [ 1] 1457 	ld a,#CR 
      008966 00 0D FE         [ 4] 1458 	call putc 
      008969 CD A8            [ 1] 1459 	ld a,#'> 
      00896B C0 AE 16         [ 4] 1460 	call putc
      00896E 90 CD A8         [ 4] 1461 	call readln
      008971 C0 A6 0D CD      [ 1] 1462 	tnz count 
      008975 83 40            [ 1] 1463 	jreq cmd_line
      008977 CE 00 01         [ 4] 1464 	call compile
                                   1465 ; if text begin with a line number
                                   1466 ; the compiler set count to zero    
                                   1467 ; so code is not interpreted
      00897A CD A9 2D A6      [ 1] 1468 	tnz count 
      00897E 5E CD            [ 1] 1469 	jreq cmd_line
                                   1470 
                                   1471 ; if direct command 
                                   1472 ; it's ready to interpret 
                                   1473 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1474 ;; This is the interpreter loop
                                   1475 ;; for each BASIC code line. 
                                   1476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000925                       1477 interpreter: 
      008980 83 40 AE         [ 1] 1478 	ld a,in 
      008983 17 FF 94         [ 1] 1479 	cp a,count 
      008986 2B 1D            [ 1] 1480 	jrmi interp_loop
      00092D                       1481 next_line:
      008986 CD 86 FE 23 D7   [ 2] 1482 	btjf flags, #FRUN, cmd_line
      008989 CE 00 04         [ 2] 1483 	ldw x,basicptr
      008989 A6 0D CD 83      [ 2] 1484 	addw x,in.w 
      00898D 40 A6 3E         [ 2] 1485 	cpw x,txtend 
      008990 CD 83            [ 1] 1486 	jrpl warm_start
      008992 40 CD A9         [ 2] 1487 	ldw basicptr,x ; start of next line  
      008995 C5 72            [ 1] 1488 	ld a,(2,x)
      008997 5D 00 04         [ 1] 1489 	ld count,a 
      00899A 27 ED CD 85      [ 1] 1490 	mov in,#3 ; skip first 3 bytes of line 
      00094A                       1491 interp_loop: 
      00899E 70 72 5D         [ 4] 1492 	call next_token
      0089A1 00 04            [ 1] 1493 	cp a,#TK_NONE 
      0089A3 27 E4            [ 1] 1494 	jreq next_line 
      0089A5 A1 80            [ 1] 1495 	cp a,#TK_CMD
      0089A5 C6 00            [ 1] 1496 	jrne 1$
      0089A7 02               [ 4] 1497 	call (x) 
      0089A8 C1 00            [ 2] 1498 	jra interp_loop 
      000958                       1499 1$:	 
      0089AA 04 2B            [ 1] 1500 	cp a,#TK_VAR
      0089AC 1D 05            [ 1] 1501 	jrne 2$
      0089AD CD 12 7D         [ 4] 1502 	call let_var  
      0089AD 72 01            [ 2] 1503 	jra interp_loop 
      000961                       1504 2$:	
      0089AF 00 24            [ 1] 1505 	cp a,#TK_ARRAY 
      0089B1 D7 CE            [ 1] 1506 	jrne 3$
      0089B3 00 05 72         [ 4] 1507 	call let_array 
      0089B6 BB 00            [ 2] 1508 	jra interp_loop
      00096A                       1509 3$:	
      0089B8 01 C3            [ 1] 1510 	cp a,#TK_COLON 
      0089BA 00 1F            [ 1] 1511 	jreq interp_loop 
      0089BC 2A C8 CF         [ 2] 1512 	jp syntax_error 
                                   1513 
                                   1514 		
                                   1515 ;--------------------------
                                   1516 ; extract next token from
                                   1517 ; token list 
                                   1518 ; basicptr -> base address 
                                   1519 ; in  -> offset in list array 
                                   1520 ; output:
                                   1521 ;   A 		token attribute
                                   1522 ;   X 		token value if there is one
                                   1523 ;----------------------------------------
      000971                       1524 next_token:
      0089BF 00               [ 1] 1525 	clrw x 
      0089C0 05 E6 02         [ 1] 1526 	ld a,in 
      0089C3 C7 00 04         [ 1] 1527 	sub a,count ; don't replace sub by cp!  
      0089C6 35 03            [ 1] 1528 	jrmi 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089C8 00               [ 4] 1529 	ret  ; end of BASIC line 
      00097B                       1530 0$: 
      0089C9 02 00 01 00 02   [ 1] 1531 	mov in.saved,in 
      0089CA 90 CE 00 04      [ 2] 1532 	ldw y,basicptr 
      0089CA CD 89 F1         [ 4] 1533 	ld a,([in.w],y)
      0089CD A1 00 27 DC      [ 1] 1534 	inc in  
      0089D1 A1               [ 1] 1535 	tnz a 
      0089D2 80 26            [ 1] 1536 	jrmi 6$
      0089D4 03 FD            [ 1] 1537 	cp a,#TK_ARRAY
      0089D6 20 F2            [ 1] 1538 	jrpl 9$  ; no attribute for these
      0089D8 A1 01            [ 1] 1539 	cp a,#TK_COLON
      0089D8 A1 85            [ 1] 1540 	jreq 9$  
      000996                       1541 1$: ; 
      0089DA 26 05            [ 1] 1542 	cp a,#TK_CHAR
      0089DC CD 92            [ 1] 1543 	jrne 2$
      0089DE FD               [ 1] 1544 	exg a,xl
      0089DF 20 E9 00         [ 4] 1545 	ld a,([in.w],y)
      0089E1 72 5C 00 01      [ 1] 1546 	inc in 
      0089E1 A1               [ 1] 1547 	exg a,xl  
      0089E2 06               [ 4] 1548 	ret
      0089E3 26 05            [ 1] 1549 2$:	cp a,#TK_QSTR 
      0089E5 CD 92            [ 1] 1550 	jrne 9$
      0089E7 FA               [ 1] 1551 	ldw x,y 
      0089E8 20 E0 00 00      [ 2] 1552 	addw x,in.w ; pointer to string 
                                   1553 ; move pointer after string 
      0089EA 91 6D 00         [ 4] 1554 3$:	tnz ([in.w],y)
      0089EA A1 01            [ 1] 1555 	jreq 8$
      0089EC 27 DC CC 88      [ 1] 1556 	inc in 
      0089F0 FF F5            [ 2] 1557 	jra 3$
      0089F1                       1558 6$: 
      0089F1 5F               [ 1] 1559 	ldw x,y 
      0089F2 C6 00 02 C0      [ 5] 1560 	ldw x,([in.w],x)
      0089F6 00 04            [ 1] 1561 	cp a,#TK_INTGR
      0089F8 2B 01            [ 1] 1562 	jrpl 7$
      0089FA 81 27 0C         [ 2] 1563 	ldw x,(code_addr,x) 
      0089FB 72 5C 00 01      [ 1] 1564 7$:	inc in
      0089FB 55 00 02 00      [ 1] 1565 8$:	inc in 
      0009CC                       1566 9$: 
      0089FF 03               [ 4] 1567 	ret	
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
      0009CD                       1579 print_int:
      008A00 90 CE 00 05      [ 1] 1580 	clr acc24 
      008A04 91 D6 01         [ 2] 1581 	ldw acc16,x 
      008A07 72 5C 00 02 4D   [ 2] 1582 	btjf acc16,#7,prti24
      008A0C 2B 2A A1 06      [ 1] 1583 	cpl acc24 
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
      0009DD                       1594 prti24:
      008A10 2A 3A A1         [ 4] 1595     call itoa  ; conversion entier en  .asciz
      008A13 01 27 36         [ 4] 1596 	call right_align  
      008A16 88               [ 1] 1597 	push a 
      008A16 A1 03 26         [ 4] 1598 	call puts
      008A19 0A               [ 1] 1599 	pop a 
      008A1A 41               [ 4] 1600     ret	
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
      0009E9                       1615 itoa:
      0009E9                       1616 	_vars VSIZE
      008A1B 91 D6            [ 2]    1     sub sp,#VSIZE 
      008A1D 01 72            [ 1] 1617 	clr (LEN,sp) ; string length  
      008A1F 5C 00            [ 1] 1618 	clr (SIGN,sp)    ; sign
      008A21 02 41 81         [ 1] 1619 	ld a,base 
      008A24 A1 02            [ 1] 1620 	cp a,#10
      008A26 26 24            [ 1] 1621 	jrne 1$
                                   1622 	; base 10 string display with negative sign if bit 23==1
      008A28 93 72 BB 00 01   [ 2] 1623 	btjf acc24,#7,1$
      008A2D 91 6D            [ 1] 1624 	cpl (SIGN,sp)
      008A2F 01 27 16         [ 4] 1625 	call neg_acc24
      000A00                       1626 1$:
                                   1627 ; initialize string pointer 
      008A32 72 5C 00         [ 2] 1628 	ldw x,#tib 
      008A35 02 20 F5         [ 2] 1629 	addw x,#TIB_SIZE
      008A38 5A               [ 2] 1630 	decw x 
      008A38 93               [ 1] 1631 	clr (x)
      000A08                       1632 itoa_loop:
      008A39 72 DE 00         [ 1] 1633     ld a,base
      008A3C 01 A1            [ 2] 1634 	ldw (PSTR,sp),x 
      008A3E 84 2A 03         [ 4] 1635     call divu24_8 ; acc24/A 
      008A41 DE A7            [ 2] 1636 	ldw x,(PSTR,sp)
      008A43 8C 72            [ 1] 1637     add a,#'0  ; remainder of division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A45 5C 00            [ 1] 1638     cp a,#'9+1
      008A47 02 72            [ 1] 1639     jrmi 2$
      008A49 5C 00            [ 1] 1640     add a,#7 
      000A1A                       1641 2$:	
      008A4B 02               [ 2] 1642 	decw x
      008A4C F7               [ 1] 1643     ld (x),a
      008A4C 81 02            [ 1] 1644 	inc (LEN,sp)
                                   1645 	; if acc24==0 conversion done
      008A4D C6 00 0B         [ 1] 1646 	ld a,acc24
      008A4D 72 5F 00         [ 1] 1647 	or a,acc16
      008A50 0C CF 00         [ 1] 1648 	or a,acc8
      008A53 0D 72            [ 1] 1649     jrne itoa_loop
                                   1650 	;conversion done, next add '$' or '-' as required
      008A55 0F 00 0D         [ 1] 1651 	ld a,base 
      008A58 04 72            [ 1] 1652 	cp a,#16
      008A5A 53 00            [ 1] 1653 	jreq 8$
      008A5C 0C 01            [ 1] 1654 	ld a,(SIGN,sp)
      008A5D 27 15            [ 1] 1655     jreq 10$
      008A5D CD 8A            [ 1] 1656     ld a,#'-
      008A5F 69 CD            [ 2] 1657 	jra 9$ 
                                   1658 ; don't print more than 4 digits
                                   1659 ; in hexadecimal to avoid '-' sign 
                                   1660 ; extend display 	
      008A61 93 BA            [ 1] 1661 8$: ld a,(LEN,sp) 
      008A63 88 CD            [ 1] 1662 	cp a,#5 
      008A65 A8 C0            [ 1] 1663 	jrmi 81$
      008A67 84               [ 2] 1664 	incw x
      008A68 81 02            [ 1] 1665 	dec (LEN,sp)
      008A69 20 F5            [ 2] 1666 	jra 8$
      000A43                       1667 81$:	
      008A69 52 04            [ 1] 1668 	ld a,#'$ 
      008A6B 0F               [ 2] 1669 9$: decw x
      008A6C 02               [ 1] 1670     ld (x),a
      008A6D 0F 01            [ 1] 1671 	inc (LEN,sp)
      000A49                       1672 10$:
      008A6F C6 00            [ 1] 1673 	ld a,(LEN,sp)
      000A4B                       1674 	_drop VSIZE
      008A71 0B A1            [ 2]    1     addw sp,#VSIZE 
      008A73 0A               [ 4] 1675 	ret
                                   1676 
                                   1677 ;-------------------------------------
                                   1678 ; divide uint24_t by uint8_t
                                   1679 ; used to convert uint24_t to string
                                   1680 ; input:
                                   1681 ;	acc24	dividend
                                   1682 ;   A 		divisor
                                   1683 ; output:
                                   1684 ;   acc24	quotient
                                   1685 ;   A		remainder
                                   1686 ;------------------------------------- 
                                   1687 ; offset  on sp of arguments and locals
                           000001  1688 	U8   = 1   ; divisor on stack
                           000001  1689 	VSIZE =1
      000A4E                       1690 divu24_8:
      008A74 26               [ 2] 1691 	pushw x ; save x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A75 0A               [ 1] 1692 	push a 
                                   1693 	; ld dividend UU:MM bytes in X
      008A76 72 0F 00         [ 1] 1694 	ld a, acc24
      008A79 0C               [ 1] 1695 	ld xh,a
      008A7A 05 03 01         [ 1] 1696 	ld a,acc24+1
      008A7D CD               [ 1] 1697 	ld xl,a
      008A7E 8B 30            [ 1] 1698 	ld a,(U8,SP) ; divisor
      008A80 62               [ 2] 1699 	div x,a ; UU:MM/U8
      008A80 AE               [ 1] 1700 	push a  ;save remainder
      008A81 16               [ 1] 1701 	ld a,xh
      008A82 90 1C 00         [ 1] 1702 	ld acc24,a
      008A85 50               [ 1] 1703 	ld a,xl
      008A86 5A 7F 0C         [ 1] 1704 	ld acc24+1,a
      008A88 84               [ 1] 1705 	pop a
      008A88 C6               [ 1] 1706 	ld xh,a
      008A89 00 0B 1F         [ 1] 1707 	ld a,acc24+2
      008A8C 03               [ 1] 1708 	ld xl,a
      008A8D CD 8A            [ 1] 1709 	ld a,(U8,sp) ; divisor
      008A8F CE               [ 2] 1710 	div x,a  ; R:LL/U8
      008A90 1E 03            [ 1] 1711 	ld (U8,sp),a ; save remainder
      008A92 AB               [ 1] 1712 	ld a,xl
      008A93 30 A1 3A         [ 1] 1713 	ld acc24+2,a
      008A96 2B               [ 1] 1714 	pop a
      008A97 02               [ 2] 1715 	popw x
      008A98 AB               [ 4] 1716 	ret
                                   1717 
                                   1718 ;--------------------------------------
                                   1719 ; unsigned multiply uint24_t by uint8_t
                                   1720 ; use to convert numerical string to uint24_t
                                   1721 ; input:
                                   1722 ;	acc24	uint24_t 
                                   1723 ;   A		uint8_t
                                   1724 ; output:
                                   1725 ;   acc24   A*acc24
                                   1726 ;-------------------------------------
                                   1727 ; local variables offset  on sp
                           000003  1728 	U8   = 3   ; A pushed on stack
                           000002  1729 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1730 	OVFH = 1  ; multiplication overflow high byte
                           000003  1731 	VSIZE = 3
      000A76                       1732 mulu24_8:
      008A99 07               [ 2] 1733 	pushw x    ; save X
                                   1734 	; local variables
      008A9A 88               [ 1] 1735 	push a     ; U8
      008A9A 5A               [ 1] 1736 	clrw x     ; initialize overflow to 0
      008A9B F7               [ 2] 1737 	pushw x    ; multiplication overflow
                                   1738 ; multiply low byte.
      008A9C 0C 02 C6         [ 1] 1739 	ld a,acc24+2
      008A9F 00               [ 1] 1740 	ld xl,a
      008AA0 0C CA            [ 1] 1741 	ld a,(U8,sp)
      008AA2 00               [ 4] 1742 	mul x,a
      008AA3 0D               [ 1] 1743 	ld a,xl
      008AA4 CA 00 0E         [ 1] 1744 	ld acc24+2,a
      008AA7 26               [ 1] 1745 	ld a, xh
      008AA8 DF C6            [ 1] 1746 	ld (OVFL,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1747 ; multipy middle byte
      008AAA 00 0B A1         [ 1] 1748 	ld a,acc24+1
      008AAD 10               [ 1] 1749 	ld xl,a
      008AAE 27 08            [ 1] 1750 	ld a, (U8,sp)
      008AB0 7B               [ 4] 1751 	mul x,a
                                   1752 ; add overflow to this partial product
      008AB1 01 27 15         [ 2] 1753 	addw x,(OVFH,sp)
      008AB4 A6               [ 1] 1754 	ld a,xl
      008AB5 2D 20 0D         [ 1] 1755 	ld acc24+1,a
      008AB8 7B               [ 1] 1756 	clr a
      008AB9 02 A1            [ 1] 1757 	adc a,#0
      008ABB 05 2B            [ 1] 1758 	ld (OVFH,sp),a
      008ABD 05               [ 1] 1759 	ld a,xh
      008ABE 5C 0A            [ 1] 1760 	ld (OVFL,sp),a
                                   1761 ; multiply most signficant byte	
      008AC0 02 20 F5         [ 1] 1762 	ld a, acc24
      008AC3 97               [ 1] 1763 	ld xl, a
      008AC3 A6 24            [ 1] 1764 	ld a, (U8,sp)
      008AC5 5A               [ 4] 1765 	mul x,a
      008AC6 F7 0C 02         [ 2] 1766 	addw x, (OVFH,sp)
      008AC9 9F               [ 1] 1767 	ld a, xl
      008AC9 7B 02 5B         [ 1] 1768 	ld acc24,a
      008ACC 04 81            [ 2] 1769     addw sp,#VSIZE
      008ACE 85               [ 2] 1770 	popw x
      008ACE 89               [ 4] 1771 	ret
                                   1772 
                                   1773 ;------------------------------------
                                   1774 ;  two's complement acc24
                                   1775 ;  input:
                                   1776 ;		acc24 variable
                                   1777 ;  output:
                                   1778 ;		acc24 variable
                                   1779 ;-------------------------------------
      000AB0                       1780 neg_acc24:
      008ACF 88 C6 00 0C      [ 1] 1781 	cpl acc24+2
      008AD3 95 C6 00 0D      [ 1] 1782 	cpl acc24+1
      008AD7 97 7B 01 62      [ 1] 1783 	cpl acc24
      008ADB 88 9E            [ 1] 1784 	ld a,#1
      008ADD C7 00 0C         [ 1] 1785 	add a,acc24+2
      008AE0 9F C7 00         [ 1] 1786 	ld acc24+2,a
      008AE3 0D               [ 1] 1787 	clr a
      008AE4 84 95 C6         [ 1] 1788 	adc a,acc24+1
      008AE7 00 0E 97         [ 1] 1789 	ld acc24+1,a 
      008AEA 7B               [ 1] 1790 	clr a 
      008AEB 01 62 6B         [ 1] 1791 	adc a,acc24 
      008AEE 01 9F C7         [ 1] 1792 	ld acc24,a 
      008AF1 00               [ 4] 1793 	ret
                                   1794 
                                   1795 
                                   1796 
                                   1797 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1798 ;; compiler routines        ;;
                                   1799 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1800 ;------------------------------------
                                   1801 ; parse quoted string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1802 ; input:
                                   1803 ;   Y 	pointer to tib 
                                   1804 ;   X   pointer to output buffer 
                                   1805 ; output:
                                   1806 ;	buffer   parsed string
                                   1807 ;------------------------------------
                           000001  1808 	PREV = 1
                           000002  1809 	CURR =2
                           000002  1810 	VSIZE=2
      000AD3                       1811 parse_quote: 
      000AD3                       1812 	_vars VSIZE 
      008AF2 0E 84            [ 2]    1     sub sp,#VSIZE 
      008AF4 85               [ 1] 1813 	clr a
      008AF5 81 01            [ 1] 1814 1$:	ld (PREV,sp),a 
      008AF6                       1815 2$:	
      008AF6 89 88 5F         [ 4] 1816 	ld a,([in.w],y)
      008AF9 89 C6            [ 1] 1817 	jreq 6$
      008AFB 00 0E 97 7B      [ 1] 1818 	inc in 
      008AFF 03 42            [ 1] 1819 	ld (CURR,sp),a 
      008B01 9F C7            [ 1] 1820 	ld a,#'\
      008B03 00 0E            [ 1] 1821 	cp a, (PREV,sp)
      008B05 9E 6B            [ 1] 1822 	jrne 3$
      008B07 02 C6            [ 1] 1823 	clr (PREV,sp)
      008B09 00 0D            [ 1] 1824 	ld a,(CURR,sp)
      008B0B 97 7B            [ 4] 1825 	callr convert_escape
      008B0D 03               [ 1] 1826 	ld (x),a 
      008B0E 42               [ 2] 1827 	incw x 
      008B0F 72 FB            [ 2] 1828 	jra 2$
      000AF3                       1829 3$:
      008B11 01 9F            [ 1] 1830 	ld a,(CURR,sp)
      008B13 C7 00            [ 1] 1831 	cp a,#'\'
      008B15 0D 4F            [ 1] 1832 	jreq 1$
      008B17 A9 00            [ 1] 1833 	cp a,#'"
      008B19 6B 01            [ 1] 1834 	jreq 6$ 
      008B1B 9E               [ 1] 1835 	ld (x),a 
      008B1C 6B               [ 2] 1836 	incw x 
      008B1D 02 C6            [ 2] 1837 	jra 2$
      000B01                       1838 6$:
      008B1F 00               [ 1] 1839 	clr (x)
      008B20 0C               [ 2] 1840 	incw x 
      008B21 97 7B            [ 1] 1841 	ldw y,x 
      008B23 03               [ 1] 1842 	clrw x 
      008B24 42 72            [ 1] 1843 	ld a,#TK_QSTR  
      000B08                       1844 	_drop VSIZE
      008B26 FB 01            [ 2]    1     addw sp,#VSIZE 
      008B28 9F               [ 4] 1845 	ret 
                                   1846 
                                   1847 ;---------------------------------------
                                   1848 ; called by parse_quote
                                   1849 ; subtitute escaped character 
                                   1850 ; by their ASCII value .
                                   1851 ; input:
                                   1852 ;   A  character following '\'
                                   1853 ; output:
                                   1854 ;   A  substitued char or same if not valid.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1855 ;---------------------------------------
      000B0B                       1856 convert_escape:
      008B29 C7               [ 2] 1857 	pushw x 
      008B2A 00 0C 5B         [ 2] 1858 	ldw x,#escaped 
      008B2D 03               [ 1] 1859 1$:	cp a,(x)
      008B2E 85 81            [ 1] 1860 	jreq 2$
      008B30 7D               [ 1] 1861 	tnz (x)
      008B30 72 53            [ 1] 1862 	jreq 3$
      008B32 00               [ 2] 1863 	incw x 
      008B33 0E 72            [ 2] 1864 	jra 1$
      008B35 53 00 0D         [ 2] 1865 2$: subw x,#escaped 
      008B38 72               [ 1] 1866 	ld a,xl 
      008B39 53 00            [ 1] 1867 	add a,#7
      008B3B 0C               [ 2] 1868 3$:	popw x 
      008B3C A6               [ 4] 1869 	ret 
                                   1870 
      008B3D 01 CB 00 0E C7 00 0E  1871 escaped: .asciz "abtnvfr"
             4F
                                   1872 
                                   1873 ;-------------------------
                                   1874 ; integer parser 
                                   1875 ; input:
                                   1876 ;   X 		point to output buffer  
                                   1877 ;   Y 		point to tib 
                                   1878 ;   A 	    first digit|'$' 
                                   1879 ; output:  
                                   1880 ;   X 		integer 
                                   1881 ;   A 		TK_INTGR
                                   1882 ;   acc24   24 bits integer 
                                   1883 ;-------------------------
                           000001  1884 	BASE=1
                           000002  1885 	TCHAR=2 
                           000003  1886 	XSAVE=3
                           000004  1887 	VSIZE=4 
      000B28                       1888 parse_integer: ; { -- n }
      008B45 C9               [ 2] 1889 	pushw x 	
      008B46 00 0D            [ 1] 1890 	push #0 ; TCHAR
      008B48 C7 00            [ 1] 1891 	push #10 ; BASE=10
      008B4A 0D 4F            [ 1] 1892 	cp a,#'$
      008B4C C9 00            [ 1] 1893 	jrne 2$ 
      000B31                       1894     _drop #1
      008B4E 0C C7            [ 2]    1     addw sp,##1 
      008B50 00 0C            [ 1] 1895 	push #16  ; BASE=16
      008B52 81               [ 1] 1896 2$:	ld (x),a 
      008B53 5C               [ 2] 1897 	incw x 
      008B53 52 02 4F         [ 4] 1898 	ld a,([in.w],y)
      008B56 6B 01 00 01      [ 1] 1899 	inc in 
      008B58 CD 0D BB         [ 4] 1900 	call to_upper 
      008B58 91 D6            [ 1] 1901 	ld (TCHAR,sp),a 
      008B5A 01 27 24         [ 4] 1902 	call is_digit 
      008B5D 72 5C            [ 1] 1903 	jrc 2$
      008B5F 00 02            [ 1] 1904 	ld a,#16 
      008B61 6B 02            [ 1] 1905 	cp a,(BASE,sp)
      008B63 A6 5C            [ 1] 1906 	jrne 3$ 
      008B65 11 01            [ 1] 1907 	ld a,(TCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B67 26 0A            [ 1] 1908 	cp a,#'A 
      008B69 0F 01            [ 1] 1909 	jrmi 3$ 
      008B6B 7B 02            [ 1] 1910 	cp a,#'G 
      008B6D AD 1C            [ 1] 1911 	jrmi 2$ 
      008B6F F7 5C 20 E5      [ 1] 1912 3$: dec in 	
      008B73 7F               [ 1] 1913     clr (x)
      008B73 7B 02            [ 2] 1914 	ldw x,(XSAVE,sp)
      008B75 A1 5C 27         [ 4] 1915 	call atoi24
      008B78 DD A1            [ 1] 1916 	ldw y,x 
      008B7A 22 27 04         [ 2] 1917 	ldw x,acc16 
      008B7D F7 5C            [ 1] 1918 	ld a,#TK_INTGR
      008B7F 20 D7            [ 2] 1919 	ldw (y),x 
      008B81 72 A9 00 02      [ 2] 1920 	addw y,#2
      000B6F                       1921 	_drop VSIZE  
      008B81 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008B83 90               [ 4] 1922 	ret 	
                                   1923 
                                   1924 ;-------------------------
                                   1925 ; binary integer parser
                                   1926 ; build integer in acc24  
                                   1927 ; input:
                                   1928 ;   X 		point to output buffer  
                                   1929 ;   Y 		point to tib 
                                   1930 ;   A 	    '&' 
                                   1931 ; output:  
                                   1932 ;   buffer  TK_INTGR integer  
                                   1933 ;   X 		int16 
                                   1934 ;   A 		TK_INTGR
                                   1935 ;   acc24    int24 
                                   1936 ;-------------------------
                           000001  1937 	BINARY=1 ; 24 bits integer 
                           000003  1938 	VSIZE=3
      000B72                       1939 parse_binary: ; { -- n }
      008B84 93 5F            [ 1] 1940 	push #0
      008B86 A6 02            [ 1] 1941 	push #0
      008B88 5B 02            [ 1] 1942 	push #0
      000B78                       1943 2$:	
      008B8A 81 D6 00         [ 4] 1944 	ld a,([in.w],y)
      008B8B 72 5C 00 01      [ 1] 1945 	inc in 
      008B8B 89 AE            [ 1] 1946 	cp a,#'0 
      008B8D 8B A0            [ 1] 1947 	jreq 3$
      008B8F F1 27            [ 1] 1948 	cp a,#'1 
      008B91 06 7D            [ 1] 1949 	jreq 3$ 
      008B93 27 09            [ 2] 1950 	jra bin_exit 
      008B95 5C 20            [ 1] 1951 3$: sub a,#'0 
      008B97 F7               [ 1] 1952 	rrc a
      008B98 1D 8B            [ 1] 1953 	rlc (BINARY+2,sp) 
      008B9A A0 9F            [ 1] 1954 	rlc (BINARY+1,sp)
      008B9C AB 07            [ 1] 1955 	rlc (BINARY,sp) 
      008B9E 85 81            [ 2] 1956 	jra 2$  
      000B94                       1957 bin_exit:
      008BA0 61 62 74 6E      [ 1] 1958 	dec in 
      008BA4 76 66            [ 1] 1959 	ldw y,x
      008BA6 72 00            [ 1] 1960 	ld a,(BINARY,sp)
      008BA8 C7 00 0B         [ 1] 1961 	ld acc24,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BA8 89 4B            [ 2] 1962 	ldw x,(BINARY+1,sp)
      008BAA 00 4B 0A         [ 2] 1963 	ldw acc16,x
      008BAD A1 24            [ 2] 1964 	ldw (y),x 
      008BAF 26 04 5B 01      [ 2] 1965 	addw y,#2  
      008BB3 4B 10            [ 1] 1966 	ld a,#TK_INTGR 	
      000BAC                       1967 	_drop VSIZE 
      008BB5 F7 5C            [ 2]    1     addw sp,#VSIZE 
      008BB7 91               [ 4] 1968 	ret
                                   1969 
                                   1970 ;---------------------------
                                   1971 ;  token begin with a letter,
                                   1972 ;  is keyword or variable. 	
                                   1973 ; input:
                                   1974 ;   X 		point to pad 
                                   1975 ;   Y 		point to text
                                   1976 ;   A 	    first letter  
                                   1977 ; output:
                                   1978 ;   X		exec_addr|var_addr 
                                   1979 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   1980 ;   pad 	keyword|var_name  
                                   1981 ;--------------------------  
                           000001  1982 	XFIRST=1
                           000002  1983 	VSIZE=2
      000BAF                       1984 parse_keyword: 
      008BB8 D6               [ 2] 1985 	pushw x 
      000BB0                       1986 kw_loop:	
      008BB9 01 72 5C         [ 4] 1987 	call to_upper 
      008BBC 00               [ 1] 1988 	ld (x),a 
      008BBD 02               [ 2] 1989 	incw x 
      008BBE CD 8E 3B         [ 4] 1990 	ld a,([in.w],y)
      008BC1 6B 02 CD 86      [ 1] 1991 	inc in 
      008BC5 02 25 ED         [ 4] 1992 	call is_alpha 
      008BC8 A6 10            [ 1] 1993 	jrc kw_loop
      008BCA 11 01 26 0A      [ 1] 1994 	dec in   
      008BCE 7B               [ 1] 1995 1$: clr (x)
      008BCF 02 A1            [ 2] 1996 	ldw x,(XFIRST,sp) 
      008BD1 41 2B            [ 1] 1997 	ld a,(1,x)
      008BD3 04 A1            [ 1] 1998 	jrne 2$
                                   1999 ; one letter variable name 
      008BD5 47               [ 1] 2000 	ld a,(x) 
      008BD6 2B DD            [ 1] 2001 	sub a,#'A 
      008BD8 72               [ 1] 2002 	sll a 
      008BD9 5A               [ 1] 2003 	push a 
      008BDA 00 02            [ 1] 2004 	push #0
      008BDC 7F 1E 03         [ 2] 2005 	ldw x,#vars 
      008BDF CD 8E 47         [ 2] 2006 	addw x,(1,sp) ; X=var address 
      000BD9                       2007 	_drop 2 
      008BE2 90 93            [ 2]    1     addw sp,#2 
      008BE4 CE 00            [ 1] 2008 	ld a,#TK_VAR 
      008BE6 0D A6            [ 2] 2009 	jra 4$ 
      000BDF                       2010 2$: ; check for keyword, otherwise syntax error.
      000BDF                       2011 	_ldx_dict kword_dict ; dictionary entry point
      008BE8 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008BEB 72 A9            [ 2] 2012 	ldw y,(XFIRST,sp) ; name to search for
      008BED 00 02 5B         [ 4] 2013 	call search_dict
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BF0 04               [ 1] 2014 	tnz a
      008BF1 81 03            [ 1] 2015 	jrne 4$ 
      008BF2 CC 08 7F         [ 2] 2016 	jp syntax_error
      000BED                       2017 4$:	
      008BF2 4B 00            [ 2] 2018 	ldw y,(XFIRST,sp)
      008BF4 4B 00            [ 1] 2019 	ld (y),a 
      008BF6 4B 00            [ 2] 2020 	incw y 
      008BF8 90 FF            [ 2] 2021 	ldw (y),x
      008BF8 91 D6 01 72      [ 2] 2022 	addw y,#2  
      000BF9                       2023 	_drop VSIZE 
      008BFC 5C 00            [ 2]    1     addw sp,#VSIZE 
      008BFE 02               [ 4] 2024 	ret  	
                                   2025 
                                   2026 
                                   2027 ;------------------------------------
                                   2028 ; scan text for next token
                                   2029 ; input: 
                                   2030 ;	X 		pointer to buffer where 
                                   2031 ;	        token id and value are copied 
                                   2032 ; use:
                                   2033 ;	Y   pointer to text in tib 
                                   2034 ; output:
                                   2035 ;   A       token attribute 
                                   2036 ;   X 		token value
                                   2037 ;   Y       updated position in output buffer   
                                   2038 ;------------------------------------
                                   2039 	; use to check special character 
                                   2040 	.macro _case c t  
                                   2041 	ld a,#c 
                                   2042 	cp a,(TCHAR,sp) 
                                   2043 	jrne t
                                   2044 	.endm 
                                   2045 
                           000001  2046 	TCHAR=1
                           000002  2047 	ATTRIB=2
                           000002  2048 	VSIZE=2
      000BFC                       2049 get_token: 
      000BFC                       2050 	_vars VSIZE
      008BFF A1 30            [ 2]    1     sub sp,#VSIZE 
                                   2051 ;	ld a,in 
                                   2052 ;	sub a,count
                                   2053 ;   jrmi 0$
                                   2054 ;	clr a 
                                   2055 ;	ret 
      000BFE                       2056 0$: 
      008C01 27 06 A1 31      [ 2] 2057 	ldw y,#tib    	
      008C05 27 02            [ 1] 2058 	ld a,#SPACE
      008C07 20 0B A0         [ 4] 2059 	call skip
      008C0A 30 46 09 03 09   [ 1] 2060 	mov in.saved,in 
      008C0F 02 09 01         [ 4] 2061 	ld a,([in.w],y)
      008C12 20 E4            [ 1] 2062 	jrne 1$
      008C14 90 93            [ 1] 2063 	ldw y,x 
      008C14 72 5A 00         [ 2] 2064 	jp token_exit ; end of line 
      008C17 02 90 93 7B      [ 1] 2065 1$:	inc in 
      008C1B 01 C7 00         [ 4] 2066 	call to_upper 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C1E 0C 1E            [ 1] 2067 	ld (TCHAR,sp),a 
                                   2068 ; check for quoted string
      000C1F                       2069 str_tst:  	
      000C1F                       2070 	_case '"' nbr_tst
      008C20 02 CF            [ 1]    1 	ld a,#'"' 
      008C22 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008C24 90 FF            [ 1]    3 	jrne nbr_tst
      008C26 72 A9            [ 1] 2071 	ld a,#TK_QSTR
      008C28 00               [ 1] 2072 	ld (x),a 
      008C29 02               [ 2] 2073 	incw x 
      008C2A A6 84 5B         [ 4] 2074 	call parse_quote
      008C2D 03 81 B8         [ 2] 2075 	jp token_exit
      008C2F                       2076 nbr_tst:
                                   2077 ; check for hexadecimal number 
      008C2F 89 24            [ 1] 2078 	ld a,#'$'
      008C30 11 01            [ 1] 2079 	cp a,(TCHAR,sp) 
      008C30 CD 8E            [ 1] 2080 	jreq 1$
                                   2081 ;check for binary number 
      008C32 3B F7            [ 1] 2082 	ld a,#'&
      008C34 5C 91            [ 1] 2083 	cp a,(TCHAR,sp)
      008C36 D6 01            [ 1] 2084 	jrne 0$
      008C38 72 5C            [ 1] 2085 	ld a,#TK_INTGR
      008C3A 00               [ 1] 2086 	ld (x),a 
      008C3B 02               [ 2] 2087 	incw x 
      008C3C CD 85 F1         [ 4] 2088 	call parse_binary ; expect binary integer 
      008C3F 25 EF 72         [ 2] 2089 	jp token_exit 
                                   2090 ; check for decimal number 	
      008C42 5A 00            [ 1] 2091 0$:	ld a,(TCHAR,sp)
      008C44 02 7F 1E         [ 4] 2092 	call is_digit
      008C47 01 E6            [ 1] 2093 	jrnc 3$
      008C49 01 26            [ 1] 2094 1$:	ld a,#TK_INTGR 
      008C4B 13               [ 1] 2095 	ld (x),a 
      008C4C F6               [ 2] 2096 	incw x 
      008C4D A0 41            [ 1] 2097 	ld a,(TCHAR,sp)
      008C4F 48 88 4B         [ 4] 2098 	call parse_integer 
      008C52 00 AE 00         [ 2] 2099 	jp token_exit 
      000C58                       2100 3$: 
      000C58                       2101 	_case '(' bkslsh_tst 
      008C55 30 72            [ 1]    1 	ld a,#'(' 
      008C57 FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C59 5B 02            [ 1]    3 	jrne bkslsh_tst
      008C5B A6 85            [ 1] 2102 	ld a,#TK_LPAREN
      008C5D 20 0E B4         [ 2] 2103 	jp token_char   	
      008C5F                       2104 bkslsh_tst: ; character token 
      000C63                       2105 	_case '\',rparnt_tst
      008C5F AE A7            [ 1]    1 	ld a,#'\' 
      008C61 86 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008C63 01 CD            [ 1]    3 	jrne rparnt_tst
      008C65 90 73            [ 1] 2106 	ld a,#TK_CHAR 
      008C67 4D               [ 1] 2107 	ld (x),a 
      008C68 26               [ 2] 2108 	incw x 
      008C69 03 CC 88         [ 4] 2109 	ld a,([in.w],y)
      008C6C FF               [ 1] 2110 	ld (x),a 
      008C6D 5C               [ 2] 2111 	incw x
      008C6D 16 01            [ 1] 2112 	ldw y,x 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C6F 90 F7 90 5C      [ 1] 2113 	inc in  
      008C73 90               [ 1] 2114 	clrw x 
      008C74 FF               [ 1] 2115 	ld xl,a 
      008C75 72 A9            [ 1] 2116 	ld a,#TK_CHAR 
      008C77 00 02 5B         [ 2] 2117 	jp token_exit 
      000C7F                       2118 rparnt_tst:		
      000C7F                       2119 	_case ')' colon_tst 
      008C7A 02 81            [ 1]    1 	ld a,#')' 
      008C7C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7C 52 02            [ 1]    3 	jrne colon_tst
      008C7E A6 08            [ 1] 2120 	ld a,#TK_RPAREN 
      008C7E 90 AE 16         [ 2] 2121 	jp token_char
      000C8A                       2122 colon_tst:
      000C8A                       2123 	_case ':' comma_tst 
      008C81 90 A6            [ 1]    1 	ld a,#':' 
      008C83 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C85 8E B1            [ 1]    3 	jrne comma_tst
      008C87 55 00            [ 1] 2124 	ld a,#TK_COLON 
      008C89 02 00 03         [ 2] 2125 	jp token_char  
      000C95                       2126 comma_tst:
      000C95                       2127 	_case COMMA sharp_tst 
      008C8C 91 D6            [ 1]    1 	ld a,#COMMA 
      008C8E 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008C90 05 90            [ 1]    3 	jrne sharp_tst
      008C92 93 CC            [ 1] 2128 	ld a,#TK_COMMA
      008C94 8E 38 72         [ 2] 2129 	jp token_char
      000CA0                       2130 sharp_tst:
      000CA0                       2131 	_case SHARP dash_tst 
      008C97 5C 00            [ 1]    1 	ld a,#SHARP 
      008C99 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9B 8E 3B            [ 1]    3 	jrne dash_tst
      008C9D 6B 01            [ 1] 2132 	ld a,#TK_SHARP
      008C9F CC 0D B4         [ 2] 2133 	jp token_char  	 	 
      000CAB                       2134 dash_tst: 	
      000CAB                       2135 	_case '-' at_tst 
      008C9F A6 22            [ 1]    1 	ld a,#'-' 
      008CA1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA3 26 0A            [ 1]    3 	jrne at_tst
      008CA5 A6 02            [ 1] 2136 	ld a,#TK_MINUS  
      008CA7 F7 5C CD         [ 2] 2137 	jp token_char 
      000CB6                       2138 at_tst:
      000CB6                       2139 	_case '@' qmark_tst 
      008CAA 8B 53            [ 1]    1 	ld a,#'@' 
      008CAC CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008CAE 38 05            [ 1]    3 	jrne qmark_tst
      008CAF A6 06            [ 1] 2140 	ld a,#TK_ARRAY 
      008CAF A6 24 11         [ 2] 2141 	jp token_char
      000CC1                       2142 qmark_tst:
      000CC1                       2143 	_case '?' tick_tst 
      008CB2 01 27            [ 1]    1 	ld a,#'?' 
      008CB4 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB6 26 11            [ 1]    3 	jrne tick_tst
      008CB8 01 26            [ 1] 2144 	ld a,#TK_CMD  
      008CBA 0A               [ 1] 2145 	ld (x),a 
      008CBB A6               [ 2] 2146 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CBC 84 F7            [ 1] 2147 	ldw y,x 
      008CBE 5C CD 8B         [ 2] 2148 	ldw x,#PRT_IDX 
      008CC1 F2 CC            [ 2] 2149 	ldw (y),x 
      008CC3 8E 38 7B 01      [ 2] 2150 	addw y,#2
      008CC7 CD 86 02         [ 2] 2151 	jp token_exit
      000CD9                       2152 tick_tst: ; comment 
      000CD9                       2153 	_case TICK plus_tst 
      008CCA 24 0C            [ 1]    1 	ld a,#TICK 
      008CCC A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008CCE F7 5C            [ 1]    3 	jrne plus_tst
      008CD0 7B 01            [ 1] 2154 	ld a,#TK_CMD
      008CD2 CD               [ 1] 2155 	ld (x),a 
      008CD3 8B               [ 2] 2156 	incw x
      008CD4 A8 CC 8E 38      [ 2] 2157 	ldw y,#REM_IDX
      008CD8 FF               [ 2] 2158 	ldw (x),y 
      008CD8 A6 28 11         [ 2] 2159 	addw x,#2  
      000CEB                       2160 copy_comment:
      008CDB 01 26 05 A6      [ 2] 2161 	ldw y,#tib 
      008CDF 07 CC 8E 34      [ 2] 2162 	addw y,in.w
      008CE3 90 89            [ 2] 2163 	pushw y
      008CE3 A6 5C 11         [ 4] 2164 	call strcpy
      008CE6 01 26 16         [ 2] 2165     subw y,(1,sp)
      008CE9 A6 03            [ 1] 2166 	ld a,yl 
      008CEB F7 5C 91         [ 1] 2167 	add a,in
      008CEE D6 01 F7         [ 1] 2168 	ld in,a 
      008CF1 5C 90            [ 2] 2169 	ldw (1,sp),x
      008CF3 93 72 5C         [ 2] 2170 	addw y,(1,sp)
      008CF6 00 02            [ 2] 2171 	incw y 
      000D0A                       2172 	_drop 2 
      008CF8 5F 97            [ 2]    1     addw sp,#2 
      008CFA A6 03 CC         [ 2] 2173 	ldw x,#REM_IDX 
      008CFD 8E 38            [ 1] 2174 	ld a,#TK_CMD 
      008CFF CC 0D B8         [ 2] 2175 	jp token_exit 
      000D14                       2176 plus_tst:
      000D14                       2177 	_case '+' star_tst 
      008CFF A6 29            [ 1]    1 	ld a,#'+' 
      008D01 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D03 26 05            [ 1]    3 	jrne star_tst
      008D05 A6 08            [ 1] 2178 	ld a,#TK_PLUS  
      008D07 CC 8E 34         [ 2] 2179 	jp token_char 
      008D0A                       2180 star_tst:
      000D1F                       2181 	_case '*' slash_tst 
      008D0A A6 3A            [ 1]    1 	ld a,#'*' 
      008D0C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 26 05            [ 1]    3 	jrne slash_tst
      008D10 A6 01            [ 1] 2182 	ld a,#TK_MULT 
      008D12 CC 8E 34         [ 2] 2183 	jp token_char 
      008D15                       2184 slash_tst: 
      000D2A                       2185 	_case '/' prcnt_tst 
      008D15 A6 2C            [ 1]    1 	ld a,#'/' 
      008D17 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D19 26 05            [ 1]    3 	jrne prcnt_tst
      008D1B A6 09            [ 1] 2186 	ld a,#TK_DIV 
      008D1D CC 8E 34         [ 2] 2187 	jp token_char 
      008D20                       2188 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      000D35                       2189 	_case '%' eql_tst 
      008D20 A6 23            [ 1]    1 	ld a,#'%' 
      008D22 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D24 26 05            [ 1]    3 	jrne eql_tst
      008D26 A6 0A            [ 1] 2190 	ld a,#TK_MOD
      008D28 CC 8E 34         [ 2] 2191 	jp token_char  
                                   2192 ; 1 or 2 character tokens 	
      008D2B                       2193 eql_tst:
      000D40                       2194 	_case '=' gt_tst 		
      008D2B A6 2D            [ 1]    1 	ld a,#'=' 
      008D2D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2F 26 05            [ 1]    3 	jrne gt_tst
      008D31 A6 11            [ 1] 2195 	ld a,#TK_EQUAL
      008D33 CC 8E 34         [ 2] 2196 	jp token_char 
      008D36                       2197 gt_tst:
      000D4B                       2198 	_case '>' lt_tst 
      008D36 A6 40            [ 1]    1 	ld a,#'>' 
      008D38 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3A 26 05            [ 1]    3 	jrne lt_tst
      008D3C A6 06            [ 1] 2199 	ld a,#TK_GT 
      008D3E CC 8E            [ 1] 2200 	ld (ATTRIB,sp),a 
      008D40 34 D6 00         [ 4] 2201 	ld a,([in.w],y)
      008D41 72 5C 00 01      [ 1] 2202 	inc in 
      008D41 A6 3F            [ 1] 2203 	cp a,#'=
      008D43 11 01            [ 1] 2204 	jrne 1$
      008D45 26 12            [ 1] 2205 	ld a,#TK_GE 
      008D47 A6 80            [ 2] 2206 	jra token_char  
      008D49 F7 5C            [ 1] 2207 1$: cp a,#'<
      008D4B 90 93            [ 1] 2208 	jrne 2$
      008D4D AE 00            [ 1] 2209 	ld a,#TK_NE 
      008D4F 74 90            [ 2] 2210 	jra token_char 
      008D51 FF 72 A9 00      [ 1] 2211 2$: dec in
      008D55 02 CC            [ 1] 2212 	ld a,(ATTRIB,sp)
      008D57 8E 38            [ 2] 2213 	jra token_char 	 
      008D59                       2214 lt_tst:
      000D74                       2215 	_case '<' other
      008D59 A6 27            [ 1]    1 	ld a,#'<' 
      008D5B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5D 26 35            [ 1]    3 	jrne other
      008D5F A6 80            [ 1] 2216 	ld a,#TK_LT 
      008D61 F7 5C            [ 1] 2217 	ld (ATTRIB,sp),a 
      008D63 90 AE 00         [ 4] 2218 	ld a,([in.w],y)
      008D66 8E FF 1C 00      [ 1] 2219 	inc in 
      008D6A 02 3D            [ 1] 2220 	cp a,#'=
      008D6B 26 04            [ 1] 2221 	jrne 1$
      008D6B 90 AE            [ 1] 2222 	ld a,#TK_LE 
      008D6D 16 90            [ 2] 2223 	jra token_char 
      008D6F 72 B9            [ 1] 2224 1$: cp a,#'>
      008D71 00 01            [ 1] 2225 	jrne 2$
      008D73 90 89            [ 1] 2226 	ld a,#TK_NE 
      008D75 CD 84            [ 2] 2227 	jra token_char 
      008D77 32 72 F2 01      [ 1] 2228 2$: dec in 
      008D7B 90 9F            [ 1] 2229 	ld a,(ATTRIB,sp)
      008D7D CB 00            [ 2] 2230 	jra token_char 	
      000D9D                       2231 other: ; not a special character 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D7F 02 C7            [ 1] 2232 	ld a,(TCHAR,sp)
      008D81 00 02 1F         [ 4] 2233 	call is_alpha 
      008D84 01 72            [ 1] 2234 	jrc 30$ 
      008D86 F9 01 90         [ 2] 2235 	jp syntax_error 
      000DA7                       2236 30$: 
      008D89 5C 5B 02         [ 4] 2237 	call parse_keyword
      008D8C AE 00 8E         [ 2] 2238 	cpw x,#remark 
      008D8F A6 80            [ 1] 2239 	jrne token_exit 
      008D91 CC 8E            [ 1] 2240 	ldw y,x 
      008D93 38 0C EB         [ 2] 2241 	jp copy_comment 
      008D94                       2242 token_char:
      008D94 A6               [ 1] 2243 	ld (x),a 
      008D95 2B               [ 2] 2244 	incw x
      008D96 11 01            [ 1] 2245 	ldw y,x 
      000DB8                       2246 token_exit:
      000DB8                       2247 	_drop VSIZE 
      008D98 26 05            [ 2]    1     addw sp,#VSIZE 
      008D9A A6               [ 4] 2248 	ret
                                   2249 
                                   2250 
                                   2251 ;------------------------------------
                                   2252 ; convert alpha to uppercase
                                   2253 ; input:
                                   2254 ;    a  character to convert
                                   2255 ; output:
                                   2256 ;    a  uppercase character
                                   2257 ;------------------------------------
      000DBB                       2258 to_upper::
      008D9B 10 CC            [ 1] 2259 	cp a,#'a
      008D9D 8E 34            [ 1] 2260 	jrpl 1$
      008D9F 81               [ 4] 2261 0$:	ret
      008D9F A6 2A            [ 1] 2262 1$: cp a,#'z	
      008DA1 11 01            [ 1] 2263 	jrugt 0$
      008DA3 26 05            [ 1] 2264 	sub a,#32
      008DA5 A6               [ 4] 2265 	ret
                                   2266 	
                                   2267 ;------------------------------------
                                   2268 ; convert pad content in integer
                                   2269 ; input:
                                   2270 ;    x		.asciz to convert
                                   2271 ; output:
                                   2272 ;    acc24      int24_t
                                   2273 ;------------------------------------
                                   2274 	; local variables
                           000001  2275 	SIGN=1 ; 1 byte, 
                           000002  2276 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2277 	TEMP=3 ; 1 byte, temporary storage
                           000003  2278 	VSIZE=3 ; 3 bytes reserved for local storage
      000DC7                       2279 atoi24::
      008DA6 20               [ 2] 2280 	pushw x 
      000DC8                       2281 	_vars VSIZE
      008DA7 CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2282 	; acc24=0 
      008DA9 34 5F 00 0B      [ 1] 2283 	clr acc24    
      008DAA 72 5F 00 0C      [ 1] 2284 	clr acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DAA A6 2F 11 01      [ 1] 2285 	clr acc8 
      008DAE 26 05            [ 1] 2286 	clr (SIGN,sp)
      008DB0 A6 21            [ 1] 2287 	ld a,#10
      008DB2 CC 8E            [ 1] 2288 	ld (BASE,sp),a ; default base decimal
      008DB4 34               [ 1] 2289 	ld a,(x)
      008DB5 27 47            [ 1] 2290 	jreq 9$  ; completed if 0
      008DB5 A6 25            [ 1] 2291 	cp a,#'-
      008DB7 11 01            [ 1] 2292 	jrne 1$
      008DB9 26 05            [ 1] 2293 	cpl (SIGN,sp)
      008DBB A6 22            [ 2] 2294 	jra 2$
      008DBD CC 8E            [ 1] 2295 1$: cp a,#'$
      008DBF 34 06            [ 1] 2296 	jrne 3$
      008DC0 A6 10            [ 1] 2297 	ld a,#16
      008DC0 A6 3D            [ 1] 2298 	ld (BASE,sp),a
      008DC2 11               [ 2] 2299 2$:	incw x
      008DC3 01               [ 1] 2300 	ld a,(x)
      000DF1                       2301 3$:	
      008DC4 26 05            [ 1] 2302 	cp a,#'a
      008DC6 A6 32            [ 1] 2303 	jrmi 4$
      008DC8 CC 8E            [ 1] 2304 	sub a,#32
      008DCA 34 30            [ 1] 2305 4$:	cp a,#'0
      008DCB 2B 2B            [ 1] 2306 	jrmi 9$
      008DCB A6 3E            [ 1] 2307 	sub a,#'0
      008DCD 11 01            [ 1] 2308 	cp a,#10
      008DCF 26 23            [ 1] 2309 	jrmi 5$
      008DD1 A6 31            [ 1] 2310 	sub a,#7
      008DD3 6B 02            [ 1] 2311 	cp a,(BASE,sp)
      008DD5 91 D6            [ 1] 2312 	jrpl 9$
      008DD7 01 72            [ 1] 2313 5$:	ld (TEMP,sp),a
      008DD9 5C 00            [ 1] 2314 	ld a,(BASE,sp)
      008DDB 02 A1 3D         [ 4] 2315 	call mulu24_8
      008DDE 26 04            [ 1] 2316 	ld a,(TEMP,sp)
      008DE0 A6 33 20         [ 1] 2317 	add a,acc24+2
      008DE3 50 A1 3C         [ 1] 2318 	ld acc24+2,a
      008DE6 26               [ 1] 2319 	clr a
      008DE7 04 A6 35         [ 1] 2320 	adc a,acc24+1
      008DEA 20 48 72         [ 1] 2321 	ld acc24+1,a
      008DED 5A               [ 1] 2322 	clr a
      008DEE 00 02 7B         [ 1] 2323 	adc a,acc24
      008DF1 02 20 40         [ 1] 2324 	ld acc24,a
      008DF4 20 C9            [ 2] 2325 	jra 2$
      008DF4 A6 3C            [ 1] 2326 9$:	tnz (SIGN,sp)
      008DF6 11 01            [ 1] 2327     jreq atoi_exit
      008DF8 26 23 A6         [ 4] 2328     call neg_acc24
      000E2D                       2329 atoi_exit: 
      000E2D                       2330 	_drop VSIZE
      008DFB 34 6B            [ 2]    1     addw sp,#VSIZE 
      008DFD 02               [ 2] 2331 	popw x ; restore x
      008DFE 91               [ 4] 2332 	ret
                                   2333 
                                   2334 
                                   2335 ;------------------------------------
                                   2336 ; skip character c in text starting from 'in'
                                   2337 ; input:
                                   2338 ;	 y 		point to text buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2339 ;    a 		character to skip
                                   2340 ; output:  
                                   2341 ;	'in' ajusted to new position
                                   2342 ;------------------------------------
                           000001  2343 	C = 1 ; local var
      000E31                       2344 skip:
      008DFF D6               [ 1] 2345 	push a
      008E00 01 72 5C         [ 4] 2346 1$:	ld a,([in.w],y)
      008E03 00 02            [ 1] 2347 	jreq 2$
      008E05 A1 3D            [ 1] 2348 	cp a,(C,sp)
      008E07 26 04            [ 1] 2349 	jrne 2$
      008E09 A6 36 20 27      [ 1] 2350 	inc in
      008E0D A1 3E            [ 2] 2351 	jra 1$
      000E41                       2352 2$: _drop 1 
      008E0F 26 04            [ 2]    1     addw sp,#1 
      008E11 A6               [ 4] 2353 	ret
                                   2354 	
                                   2355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2356 ;;   TINY BASIC  operators,
                                   2357 ;;   commands and functions 
                                   2358 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2359 
                                   2360 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2361 ;;  Arithmetic operators
                                   2362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2363 
                                   2364 ;debug support
                           000001  2365 DEBUG_PRT=1
                           000001  2366 .if DEBUG_PRT 
                           000001  2367 	REGA=1
                           000002  2368 	SAVEB=2
                           000003  2369 	REGX=3
                           000005  2370 	REGY=5
                           000007  2371 	ACC24=7
                           000009  2372 	VSIZE=9 
      000E44                       2373 printxy:
      000E44                       2374 	_vars VSIZE 
      008E12 35 20            [ 2]    1     sub sp,#VSIZE 
      008E14 1F 72            [ 1] 2375 	ld (REGA,sp),a 
      008E16 5A 00 02         [ 1] 2376 	ld a,base 
      008E19 7B 02            [ 1] 2377 	ld (SAVEB,sp),a
      008E1B 20 17            [ 2] 2378 	ldw (REGX,sp),x
      008E1D 17 05            [ 2] 2379 	ldw (REGY,sp),y
      008E1D 7B 01 CD         [ 2] 2380 	ldw x,acc24 
      008E20 85 F1 25         [ 1] 2381 	ld a,acc8 
      008E23 03 CC            [ 2] 2382 	ldw (ACC24,sp),x 
      008E25 88 FF            [ 1] 2383 	ld (ACC24+2,sp),a 
      008E27 35 10 00 0A      [ 1] 2384 	mov base,#16 
      008E27 CD               [ 1] 2385 	clrw x 
      008E28 8C 2F            [ 1] 2386 	ld a,(REGA,sp)
      008E2A A3               [ 1] 2387 	ld xl,a 
      008E2B 96 B0 26         [ 4] 2388 	call print_int
      008E2E 09 90            [ 1] 2389 	ld a,#SPACE 
      008E30 93 CC 8D         [ 4] 2390 	call putc  
      008E33 6B 03            [ 2] 2391 	ldw x,(REGX,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E34 CD 09 CD         [ 4] 2392 	call print_int 
      008E34 F7 5C            [ 1] 2393 	ld a,#SPACE 
      008E36 90 93 C0         [ 4] 2394 	call putc  
      008E38 1E 05            [ 2] 2395 	ldw x,(REGY,sp)
      008E38 5B 02 81         [ 4] 2396 	call print_int 
      008E3B A6 0D            [ 1] 2397 	ld a,#CR 
      008E3B A1 61 2A         [ 4] 2398 	call putc 
      008E3E 01 81            [ 1] 2399 	ld a,(ACC24+2,sp)
      008E40 A1 7A            [ 2] 2400 	ldw x,(ACC24,sp)
      008E42 22 FB A0         [ 2] 2401 	ldw acc24,x 
      008E45 20 81 0D         [ 1] 2402 	ld acc8,a
      008E47 7B 02            [ 1] 2403 	ld a,(SAVEB,sp)
      008E47 89 52 03         [ 1] 2404 	ld base,a 
      008E4A 72 5F            [ 1] 2405 	ld a,(REGA,sp)
      008E4C 00 0C            [ 2] 2406 	ldw x,(REGX,sp)
      008E4E 72 5F            [ 2] 2407 	ldw y,(REGY,sp)
      000E94                       2408 	_drop VSIZE 
      008E50 00 0D            [ 2]    1     addw sp,#VSIZE 
      008E52 72               [ 4] 2409 	ret 
                                   2410 .endif 
                                   2411 
                                   2412 
                                   2413 ;--------------------------------------
                                   2414 ;  multiply 2 uint16_t return uint32_t
                                   2415 ;  input:
                                   2416 ;     x       uint16_t 
                                   2417 ;     y       uint16_t 
                                   2418 ;  output:
                                   2419 ;     x       product bits 15..0
                                   2420 ;     y       product bits 31..16 
                                   2421 ;---------------------------------------
                           000001  2422 		U1=1  ; uint16_t 
                           000003  2423 		DBL=3 ; uint32_t
                           000006  2424 		VSIZE=6
      000E97                       2425 umstar:
      000E97                       2426 	_vars VSIZE 
      008E53 5F 00            [ 2]    1     sub sp,#VSIZE 
      008E55 0E 0F            [ 2] 2427 	ldw (U1,sp),x 
                                   2428 ;initialize bits 31..16 of 
                                   2429 ;product to zero 
      008E57 01 A6            [ 1] 2430 	clr (DBL,sp)
      008E59 0A 6B            [ 1] 2431 	clr (DBL+1,sp)
                                   2432 ; produc U1L*U2L 
      008E5B 02 F6            [ 1] 2433 	ld a,yl 
      008E5D 27               [ 4] 2434 	mul x,a 
      008E5E 47 A1            [ 2] 2435 	ldw (DBL+2,sp),x
                                   2436 ; product U1H*U2L 
      008E60 2D 26            [ 1] 2437 	ld a,(U1,sp) ; xh 
      008E62 04               [ 1] 2438 	ldw x,y
      008E63 03               [ 4] 2439 	mul x,a 
      008E64 01               [ 1] 2440 	clr a 
      008E65 20 08 A1         [ 2] 2441 	addw x,(DBL+1,sp) 
      008E68 24               [ 1] 2442 	clr a 
      008E69 26 06            [ 1] 2443 	adc a,(DBL,sp) 
      008E6B A6 10            [ 1] 2444 	ld (DBL,sp),a ; bits 23..17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E6D 6B 02            [ 2] 2445 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2446 ; product U1L*U2H
      008E6F 5C F6            [ 1] 2447 	swapw y 
      008E71 93               [ 1] 2448 	ldw x,y
      008E71 A1 61            [ 1] 2449 	ld a,(U1+1,sp)
      008E73 2B               [ 4] 2450 	mul x,a
      008E74 02 A0 20         [ 2] 2451 	addw x,(DBL+1,sp)
      008E77 A1               [ 1] 2452 	clr a 
      008E78 30 2B            [ 1] 2453 	adc a,(DBL,sp)
      008E7A 2B A0            [ 1] 2454 	ld (DBL,sp),a 
      008E7C 30 A1            [ 2] 2455 	ldw (DBL+1,sp),x 
                                   2456 ; product U1H*U2H 	
      008E7E 0A 2B            [ 1] 2457 	ld a,(U1,sp)
      008E80 06               [ 1] 2458 	ldw x,y  
      008E81 A0               [ 4] 2459 	mul x,a 
      008E82 07 11 02         [ 2] 2460 	addw x,(DBL,sp)
      008E85 2A 1F            [ 1] 2461 	ldw y,x 
      008E87 6B 03            [ 2] 2462 	ldw x,(DBL+2,sp)
      000ECE                       2463 	_drop VSIZE 
      008E89 7B 02            [ 2]    1     addw sp,#VSIZE 
      008E8B CD               [ 4] 2464 	ret
                                   2465 
                                   2466 
                                   2467 ;-------------------------------------
                                   2468 ; multiply 2 integers
                                   2469 ; input:
                                   2470 ;  	x       n1 
                                   2471 ;   y 		n2 
                                   2472 ; output:
                                   2473 ;	X        N1*N2 bits 15..0
                                   2474 ;   Y        N1*N2 bits 31..16 
                                   2475 ;-------------------------------------
                           000001  2476 	SIGN=1
                           000001  2477 	VSIZE=1
      000ED1                       2478 multiply:
      000ED1                       2479 	_vars VSIZE 
      008E8C 8A F6            [ 2]    1     sub sp,#VSIZE 
      008E8E 7B 03            [ 1] 2480 	clr (SIGN,sp)
      008E90 CB               [ 1] 2481 	ld a,xh 
      008E91 00 0E            [ 1] 2482 	and a,#0x80
      008E93 C7 00            [ 1] 2483 	jrpl 1$
      008E95 0E 4F            [ 1] 2484 	cpl (SIGN,sp)
      008E97 C9               [ 2] 2485 	negw x 
      000EDD                       2486 1$:	
      008E98 00 0D            [ 1] 2487 	ld a,yh
      008E9A C7 00            [ 1] 2488 	and a,#0x80  
      008E9C 0D 4F            [ 1] 2489 	jrpl 2$ 
      008E9E C9 00            [ 1] 2490 	cpl (SIGN,sp)
      008EA0 0C C7            [ 2] 2491 	negw y 
      000EE7                       2492 2$:	
      008EA2 00 0C 20         [ 4] 2493 	call umstar
      008EA5 C9 0D            [ 1] 2494 	ld a,(SIGN,sp)
      008EA7 01 27            [ 1] 2495 	jreq 3$
      008EA9 03 CD 8B         [ 4] 2496 	call dneg 
      000EF1                       2497 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000EF1                       2498 	_drop VSIZE 
      008EAC 30 01            [ 2]    1     addw sp,#VSIZE 
      008EAD 81               [ 4] 2499 	ret
                                   2500 
                                   2501 ;--------------------------------------
                                   2502 ; divide uint32_t/uint16_t
                                   2503 ; return:  quotient and remainder 
                                   2504 ; quotient expected to be uint16_t 
                                   2505 ; input:
                                   2506 ;   DBLDIVDND    on stack 
                                   2507 ;   X            divisor 
                                   2508 ; output:
                                   2509 ;   X            quotient 
                                   2510 ;   Y            remainder 
                                   2511 ;---------------------------------------
                           000003  2512 	VSIZE=3
      000EF4                       2513 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000EF4                       2514 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2515 	; local variables 
                           000001  2516 	DIVISOR=1 
                           000003  2517 	CNTR=3 
      000EF4                       2518 udiv32_16:
      000EF4                       2519 	_vars VSIZE 
      008EAD 5B 03            [ 2]    1     sub sp,#VSIZE 
      008EAF 85 81            [ 2] 2520 	ldw (DIVISOR,sp),x	; save divisor 
      008EB1 1E 08            [ 2] 2521 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008EB1 88 91            [ 2] 2522 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008EB3 D6 01            [ 2] 2523 	tnzw y
      008EB5 27 0A            [ 1] 2524 	jrne long_division 
      008EB7 11 01            [ 2] 2525 	ldw y,(DIVISOR,sp)
      008EB9 26               [ 2] 2526 	divw x,y
      000F03                       2527 	_drop VSIZE 
      008EBA 06 72            [ 2]    1     addw sp,#VSIZE 
      008EBC 5C               [ 4] 2528 	ret
      000F06                       2529 long_division:
      008EBD 00               [ 1] 2530 	exgw x,y ; hi in x, lo in y 
      008EBE 02 20            [ 1] 2531 	ld a,#17 
      008EC0 F1 5B            [ 1] 2532 	ld (CNTR,sp),a
      000F0B                       2533 1$:
      008EC2 01 81            [ 2] 2534 	cpw x,(DIVISOR,sp)
      008EC4 2B 03            [ 1] 2535 	jrmi 2$
      008EC4 52 09 6B         [ 2] 2536 	subw x,(DIVISOR,sp)
      008EC7 01               [ 1] 2537 2$:	ccf 
      008EC8 C6 00            [ 2] 2538 	rlcw y 
      008ECA 0B               [ 2] 2539 	rlcw x 
      008ECB 6B 02            [ 1] 2540 	dec (CNTR,sp)
      008ECD 1F 03            [ 1] 2541 	jrne 1$
      008ECF 17               [ 1] 2542 	exgw x,y 
      000F1B                       2543 	_drop VSIZE 
      008ED0 05 CE            [ 2]    1     addw sp,#VSIZE 
      008ED2 00               [ 4] 2544 	ret
                                   2545 
                                   2546 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2547 ; negate double int.
                                   2548 ; input:
                                   2549 ;   x     bits 15..0
                                   2550 ;   y     bits 31..16
                                   2551 ; output: 
                                   2552 ;   x     bits 15..0
                                   2553 ;   y     bits 31..16
                                   2554 ;-----------------------------
      000F1E                       2555 dneg:
      008ED3 0C               [ 2] 2556 	cplw x 
      008ED4 C6 00            [ 2] 2557 	cplw y 
      008ED6 0E 1F 07         [ 2] 2558 	addw x,#1 
      008ED9 6B 09            [ 1] 2559 	jrnc 1$
      008EDB 35 10            [ 2] 2560 	incw y 
      008EDD 00               [ 4] 2561 1$: ret 
                                   2562 
                                   2563 
                                   2564 ;--------------------------------
                                   2565 ; sign extend single to double
                                   2566 ; input:
                                   2567 ;   x    int16_t
                                   2568 ; output:
                                   2569 ;   x    int32_t bits 15..0
                                   2570 ;   y    int32_t bits 31..16
                                   2571 ;--------------------------------
      000F29                       2572 dbl_sign_extend:
      008EDE 0B 5F            [ 1] 2573 	clrw y
      008EE0 7B               [ 1] 2574 	ld a,xh 
      008EE1 01 97            [ 1] 2575 	and a,#0x80 
      008EE3 CD 8A            [ 1] 2576 	jreq 1$
      008EE5 4D A6            [ 2] 2577 	cplw y
      008EE7 20               [ 4] 2578 1$: ret 	
                                   2579 
                                   2580 
                                   2581 ;----------------------------------
                                   2582 ;  euclidian divide dbl/n1 
                                   2583 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2584 ; input:
                                   2585 ;    dbl    int32_t on stack 
                                   2586 ;    x 		n1   int16_t  disivor  
                                   2587 ; output:
                                   2588 ;    X      dbl/x  int16_t 
                                   2589 ;    Y      remainder int16_t 
                                   2590 ;----------------------------------
                           000008  2591 	VSIZE=8
      000F33                       2592 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F33                       2593 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F33                       2594 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2595 	; local variables
                           000001  2596 	DBLHI=1
                           000003  2597 	DBLLO=3 
                           000005  2598 	SDIVSR=5 ; sign divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                           000006  2599 	SQUOT=6 ; sign dividend 
                           000007  2600 	DIVISR=7 ; divisor 
      000F33                       2601 div32_16:
      000F33                       2602 	_vars VSIZE 
      008EE8 CD 83            [ 2]    1     sub sp,#VSIZE 
      008EEA 40 1E            [ 1] 2603 	clr (SDIVSR,sp)
      008EEC 03 CD            [ 1] 2604 	clr (SQUOT,sp)
                                   2605 ; copy arguments 
      008EEE 8A 4D            [ 2] 2606 	ldw y,(DIVDNDHI,sp)
      008EF0 A6 20            [ 2] 2607 	ldw (DBLHI,sp),y
      008EF2 CD 83            [ 2] 2608 	ldw y,(DIVDNDLO,sp)
      008EF4 40 1E            [ 2] 2609 	ldw (DBLLO,sp),y 
                                   2610 ; check for 0 divisor
      008EF6 05               [ 2] 2611 	tnzw x 
      008EF7 CD 8A            [ 1] 2612     jrne 0$
      008EF9 4D A6            [ 1] 2613 	ld a,#ERR_DIV0 
      008EFB 0D CD 83         [ 2] 2614 	jp tb_error 
                                   2615 ; check divisor sign 	
      008EFE 40               [ 1] 2616 0$:	ld a,xh 
      008EFF 7B 09            [ 1] 2617 	and a,#0x80 
      008F01 1E 07            [ 1] 2618 	jreq 1$
      008F03 CF 00            [ 1] 2619 	cpl (SDIVSR,sp)
      008F05 0C C7            [ 1] 2620 	cpl (SQUOT,sp)
      008F07 00               [ 2] 2621 	negw x
      008F08 0E 7B            [ 2] 2622 1$:	ldw (DIVISR,sp),x
                                   2623 ; check dividend sign 	 
      008F0A 02 C7            [ 1] 2624  	ld a,(DBLHI,sp) 
      008F0C 00 0B            [ 1] 2625 	and a,#0x80 
      008F0E 7B 01            [ 1] 2626 	jreq 2$ 
      008F10 1E 03            [ 1] 2627 	cpl (SQUOT,sp)
      008F12 16 05            [ 2] 2628 	ldw x,(DBLLO,sp)
      008F14 5B 09            [ 2] 2629 	ldw y,(DBLHI,sp)
      008F16 81 0F 1E         [ 4] 2630 	call dneg 
      008F17 1F 03            [ 2] 2631 	ldw (DBLLO,sp),x 
      008F17 52 06            [ 2] 2632 	ldw (DBLHI,sp),y 
      008F19 1F 01            [ 2] 2633 2$:	ldw x,(DIVISR,sp)
      008F1B 0F 03 0F         [ 4] 2634 	call udiv32_16
      008F1E 04 90            [ 2] 2635 	tnzw y 
      008F20 9F 42            [ 1] 2636 	jreq 3$ 
                                   2637 ; x=quotient 
                                   2638 ; y=remainder 
                                   2639 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F22 1F 05            [ 1] 2640 	ld a,(SQUOT,sp)
      008F24 7B 01            [ 1] 2641 	xor a,(SDIVSR,sp)
      008F26 93 42            [ 1] 2642 	jreq 3$
      008F28 4F               [ 2] 2643 	incw x 
      008F29 72 FB 04 4F      [ 2] 2644 	ldw acc16,y 
      008F2D 19 03            [ 2] 2645 	ldw y,(DIVISR,sp)
      008F2F 6B 03 1F 04      [ 2] 2646 	subw y,acc16
                                   2647 ; sign quotient
      008F33 90 5E            [ 1] 2648 3$:	ld a,(SQUOT,sp)
      008F35 93 7B            [ 1] 2649 	jreq 4$
      008F37 02               [ 2] 2650 	negw x 
      000F87                       2651 4$:	
      000F87                       2652 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F38 42 72            [ 2]    1     addw sp,#VSIZE 
      008F3A FB               [ 4] 2653 	ret 
                                   2654 
                                   2655 
                                   2656 
                                   2657 ;----------------------------------
                                   2658 ; division x/y 
                                   2659 ; input:
                                   2660 ;    X       dividend
                                   2661 ;    Y       divisor 
                                   2662 ; output:
                                   2663 ;    X       quotient
                                   2664 ;    Y       remainder 
                                   2665 ;-----------------------------------
                           000004  2666 	VSIZE=4 
                                   2667 	; local variables 
                           000001  2668 	DBLHI=1
                           000003  2669 	DBLLO=3
      000F8A                       2670 divide: 
      000F8A                       2671 	_vars VSIZE 
      008F3B 04 4F            [ 2]    1     sub sp,#VSIZE 
      008F3D 19 03 6B 03      [ 2] 2672 	ldw acc16,y
      008F41 1F 04 7B         [ 4] 2673 	call dbl_sign_extend
      008F44 01 93            [ 2] 2674 	ldw (DBLLO,sp),x 
      008F46 42 72            [ 2] 2675 	ldw (DBLHI,sp),y 
      008F48 FB 03 90         [ 2] 2676 	ldw x,acc16 
      008F4B 93 1E 05         [ 4] 2677 	call div32_16 
      000F9D                       2678 	_drop VSIZE 
      008F4E 5B 06            [ 2]    1     addw sp,#VSIZE 
      008F50 81               [ 4] 2679 	ret
                                   2680 
                                   2681 
                                   2682 ;----------------------------------
                                   2683 ;  remainder resulting from euclidian 
                                   2684 ;  division of x/y 
                                   2685 ; input:
                                   2686 ;   x   	dividend int16_t 
                                   2687 ;   y 		divisor int16_t
                                   2688 ; output:
                                   2689 ;   X       n1%n2 
                                   2690 ;----------------------------------
      008F51                       2691 modulo:
      008F51 52 01 0F         [ 4] 2692 	call divide
      008F54 01               [ 1] 2693 	ldw x,y 
      008F55 9E               [ 4] 2694 	ret 
                                   2695 
                                   2696 ;----------------------------------
                                   2697 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2698 ; return expr1*expr2/expr3 
                                   2699 ; product result is int32_t and 
                                   2700 ; divisiont is int32_t/int16_t
                                   2701 ;----------------------------------
                           000004  2702 	DBL_SIZE=4 
      000FA5                       2703 muldiv:
      008F56 A4 80 2A         [ 4] 2704 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F59 03 03            [ 1] 2705 	cp a,#3 
      008F5B 01 50            [ 1] 2706 	jreq 1$
      008F5D CC 08 7F         [ 2] 2707 	jp syntax_error
      000FAF                       2708 1$: 
      008F5D 90 9E            [ 2] 2709 	ldw x,(5,sp) ; expr1
      008F5F A4 80            [ 2] 2710 	ldw y,(3,sp) ; expr2
      008F61 2A 04 03         [ 4] 2711 	call multiply 
      008F64 01 90            [ 2] 2712 	ldw (5,sp),x  ;int32_t 15..0
      008F66 50 03            [ 2] 2713 	ldw (3,sp),y  ;int32_t 31..16
      008F67 85               [ 2] 2714 	popw x        ; expr3 
      008F67 CD 8F 17         [ 4] 2715 	call div32_16 ; int32_t/expr3 
      000FBE                       2716 	_drop DBL_SIZE
      008F6A 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      008F6C 27               [ 4] 2717 	ret 
                                   2718 
                                   2719 
                                   2720 ;----------------------------------
                                   2721 ; search in kword_dict name
                                   2722 ; from its execution address 
                                   2723 ; input:
                                   2724 ;   X       	cmd_index 
                                   2725 ; output:
                                   2726 ;   X 			cstr*  | 0 
                                   2727 ;--------------------------------
                           000001  2728 	CMDX=1 
                           000003  2729 	LINK=3 
                           000004  2730 	VSIZE=4
      000FC1                       2731 cmd_name:
      000FC1                       2732 	_vars VSIZE 
      008F6D 03 CD            [ 2]    1     sub sp,#VSIZE 
      008F6F 8F 9E 00 0C      [ 1] 2733 	clr acc16 
      008F71 1F 01            [ 2] 2734 	ldw (CMDX,sp),x  
      008F71 5B 01 81         [ 2] 2735 	ldw x,#kword_dict	
      008F74 1F 03            [ 2] 2736 1$:	ldw (LINK,sp),x
      008F74 52 03            [ 1] 2737 	ld a,(2,x)
      008F76 1F 01            [ 1] 2738 	and a,#15 
      008F78 1E 08 16         [ 1] 2739 	ld acc8,a 
      008F7B 06 90 5D         [ 2] 2740 	addw x,#3
      008F7E 26 06 16 01      [ 2] 2741 	addw x,acc16
      008F82 65               [ 2] 2742 	ldw x,(x) ; command index  
      008F83 5B 03            [ 2] 2743 	cpw x,(CMDX,sp)
      008F85 81 0A            [ 1] 2744 	jreq 2$
      008F86 1E 03            [ 2] 2745 	ldw x,(LINK,sp)
      008F86 51               [ 2] 2746 	ldw x,(x) 
      008F87 A6 11 6B         [ 2] 2747 	subw x,#2  
      008F8A 03 E3            [ 1] 2748 	jrne 1$
      008F8B 20 05            [ 2] 2749 	jra 9$
      008F8B 13 01            [ 2] 2750 2$: ldw x,(LINK,sp)
      008F8D 2B 03 72         [ 2] 2751 	addw x,#2 	
      000FF0                       2752 9$:	_drop VSIZE
      008F90 F0 01            [ 2]    1     addw sp,#VSIZE 
      008F92 8C               [ 4] 2753 	ret
                                   2754 
                                   2755 
                                   2756 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2757 ; dictionary search 
                                   2758 ; input:
                                   2759 ;	X 		dictionary entry point, name field  
                                   2760 ;   y		.asciz name to search 
                                   2761 ; output:
                                   2762 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2763 ;  X		cmd_index ; execution address | 0 
                                   2764 ;---------------------------------
                           000001  2765 	NLEN=1 ; cmd length 
                           000002  2766 	XSAVE=2
                           000004  2767 	YSAVE=4
                           000005  2768 	VSIZE=5 
      000FF3                       2769 search_dict:
      000FF3                       2770 	_vars VSIZE 
      008F93 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2771 
      008F95 59 0A            [ 2] 2772 	ldw (YSAVE,sp),y 
      000FF7                       2773 search_next:
      008F97 03 26            [ 2] 2774 	ldw (XSAVE,sp),x 
                                   2775 ; get name length in dictionary	
      008F99 F1               [ 1] 2776 	ld a,(x)
      008F9A 51 5B            [ 1] 2777 	and a,#0xf 
      008F9C 03 81            [ 1] 2778 	ld (NLEN,sp),a  
      008F9E 16 04            [ 2] 2779 	ldw y,(YSAVE,sp) ; name pointer 
      008F9E 53               [ 2] 2780 	incw x 
      001001                       2781 cp_loop:
      008F9F 90 53            [ 1] 2782 	ld a,(y)
      008FA1 1C 00            [ 1] 2783 	jreq str_match 
      008FA3 01 24            [ 1] 2784 	tnz (NLEN,sp)
      008FA5 02 90            [ 1] 2785 	jreq no_match  
      008FA7 5C               [ 1] 2786 	cp a,(x)
      008FA8 81 07            [ 1] 2787 	jrne no_match 
      008FA9 90 5C            [ 2] 2788 	incw y 
      008FA9 90               [ 2] 2789 	incw x
      008FAA 5F 9E            [ 1] 2790 	dec (NLEN,sp)
      008FAC A4 80            [ 2] 2791 	jra cp_loop 
      001013                       2792 no_match:
      008FAE 27 02            [ 2] 2793 	ldw x,(XSAVE,sp) 
      008FB0 90 53 81         [ 2] 2794 	subw x,#2 ; move X to link field
      008FB3 4B 00            [ 1] 2795 	push #TK_NONE 
      008FB3 52               [ 2] 2796 	ldw x,(x) ; next word link 
      008FB4 08               [ 1] 2797 	pop a ; TK_NONE 
      008FB5 0F 05            [ 1] 2798 	jreq search_exit  ; not found  
                                   2799 ;try next 
      008FB7 0F 06            [ 2] 2800 	jra search_next
      001020                       2801 str_match:
      008FB9 16 0B            [ 2] 2802 	ldw x,(XSAVE,sp)
      008FBB 17               [ 1] 2803 	ld a,(X)
      008FBC 01 16            [ 1] 2804 	ld (NLEN,sp),a ; needed to test keyword type  
      008FBE 0D 17            [ 1] 2805 	and a,#0xf 
                                   2806 ; move x to procedure address field 	
      008FC0 03               [ 1] 2807 	inc a 
      008FC1 5D 26 05         [ 1] 2808 	ld acc8,a 
      008FC4 A6 04 CC 89      [ 1] 2809 	clr acc16 
      008FC8 01 9E A4 80      [ 2] 2810 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FCC 27               [ 2] 2811 	ldw x,(x) ; routine index  
                                   2812 ;determine keyword type bits 7:6 
      008FCD 05 03            [ 1] 2813 	ld a,(NLEN,sp)
      008FCF 05               [ 1] 2814 	swap a 
      008FD0 03 06            [ 1] 2815 	and a,#0xc
      008FD2 50               [ 1] 2816 	srl a
      008FD3 1F               [ 1] 2817 	srl a 
      008FD4 07 7B            [ 1] 2818 	add a,#128
      00103D                       2819 search_exit: 
      00103D                       2820 	_drop VSIZE 	 
      008FD6 01 A4            [ 2]    1     addw sp,#VSIZE 
      008FD8 80               [ 4] 2821 	ret 
                                   2822 
                                   2823 ;---------------------
                                   2824 ; check if next token
                                   2825 ;  is of expected type 
                                   2826 ; input:
                                   2827 ;   A 		 expected token attribute
                                   2828 ;  ouput:
                                   2829 ;   none     if fail call syntax_error 
                                   2830 ;--------------------
      001040                       2831 expect:
      008FD9 27               [ 1] 2832 	push a 
      008FDA 0D 03 06         [ 4] 2833 	call next_token 
      008FDD 1E 03            [ 1] 2834 	cp a,(1,sp)
      008FDF 16 01            [ 1] 2835 	jreq 1$
      008FE1 CD 8F 9E         [ 2] 2836 	jp syntax_error
      008FE4 1F               [ 1] 2837 1$: pop a 
      008FE5 03               [ 4] 2838 	ret 
                                   2839 
                                   2840 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2841 ; parse arguments list 
                                   2842 ; between ()
                                   2843 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00104D                       2844 func_args:
      008FE6 17 01            [ 1] 2845 	ld a,#TK_LPAREN 
      008FE8 1E 07 CD         [ 4] 2846 	call expect 
                                   2847 ; expected to continue in arg_list 
                                   2848 ; caller must check for TK_RPAREN 
                                   2849 
                                   2850 ;-------------------------------
                                   2851 ; parse embedded BASIC routines 
                                   2852 ; arguments list.
                                   2853 ; arg_list::=  rel[','rel]*
                                   2854 ; all arguments are of integer type
                                   2855 ; and pushed on stack 
                                   2856 ; input:
                                   2857 ;   none
                                   2858 ; output:
                                   2859 ;   stack{n}   arguments pushed on stack
                                   2860 ;   A 	number of arguments pushed on stack  
                                   2861 ;--------------------------------
      001052                       2862 arg_list:
      008FEB 8F 74            [ 1] 2863 	push #0  
      008FED 90 5D 27         [ 4] 2864 1$: call relation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FF0 11 7B            [ 1] 2865 	cp a,#TK_NONE 
      008FF2 06 18            [ 1] 2866 	jreq 5$
      008FF4 05 27            [ 1] 2867 	cp a,#TK_INTGR
      008FF6 0B 5C            [ 1] 2868 	jrne 4$
      00105F                       2869 3$: 
                                   2870 ; swap return address with argument
      008FF8 90               [ 1] 2871 	pop a ; arg_count
      008FF9 CF 00            [ 2] 2872 	popw y ; return address 
      008FFB 0D               [ 2] 2873 	pushw x ; new argument 
      008FFC 16 07            [ 2] 2874 	pushw y 
      008FFE 72               [ 1] 2875     inc a
      008FFF B2               [ 1] 2876 	push a 
      009000 00 0D 7B         [ 4] 2877 	call next_token 
      009003 06 27            [ 1] 2878 	cp a,#TK_COMMA 
      009005 01 50            [ 1] 2879 	jreq 1$ 
      009007 A1 00            [ 1] 2880 	cp a,#TK_NONE 
      009007 5B 08            [ 1] 2881 	jreq 5$ 
      009009 81 08            [ 1] 2882 4$:	cp a,#TK_RPAREN 
      00900A 27 05            [ 1] 2883 	jreq 5$
      001076                       2884 	_unget_token 
      00900A 52 04 90 CF 00   [ 1]    1      mov in,in.saved  
      00900F 0D               [ 1] 2885 5$:	pop a  
      009010 CD               [ 4] 2886 	ret 
                                   2887 
                                   2888 ;--------------------------------
                                   2889 ;   BASIC commnands 
                                   2890 ;--------------------------------
                                   2891 
                                   2892 ;--------------------------------
                                   2893 ;  arithmetic and relational 
                                   2894 ;  routines
                                   2895 ;  operators precedence
                                   2896 ;  highest to lowest
                                   2897 ;  operators on same row have 
                                   2898 ;  same precedence and are executed
                                   2899 ;  from left to right.
                                   2900 ;	'*','/','%'
                                   2901 ;   '-','+'
                                   2902 ;   '=','>','<','>=','<=','<>','><'
                                   2903 ;   '<>' and '><' are equivalent for not equal.
                                   2904 ;--------------------------------
                                   2905 
                                   2906 ;---------------------
                                   2907 ; return array element
                                   2908 ; address from @(expr)
                                   2909 ; input:
                                   2910 ;   A 		TK_ARRAY
                                   2911 ; output:
                                   2912 ;   A 		TK_INTGR
                                   2913 ;	X 		element address 
                                   2914 ;----------------------
      00107D                       2915 get_array_element:
      009011 8F A9 1F         [ 4] 2916 	call func_args 
      009014 03 17            [ 1] 2917 	cp a,#1
      009016 01 CE            [ 1] 2918 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009018 00 0D CD         [ 2] 2919 	jp syntax_error
      00901B 8F               [ 2] 2920 1$: popw x 
                                   2921 	; check for bounds 
      00901C B3 5B 04         [ 2] 2922 	cpw x,array_size 
      00901F 81 05            [ 2] 2923 	jrule 3$
                                   2924 ; bounds {1..array_size}	
      009020 A6 0A            [ 1] 2925 2$: ld a,#ERR_BAD_VALUE 
      009020 CD 90 0A         [ 2] 2926 	jp tb_error 
      009023 93               [ 2] 2927 3$: tnzw  x
      009024 81 F8            [ 1] 2928 	jreq 2$ 
      009025 58               [ 2] 2929 	sllw x 
      009025 CD               [ 2] 2930 	pushw x 
      009026 90 CD A1         [ 2] 2931 	ldw x,#tib
      009029 03 27 03         [ 2] 2932 	subw x,(1,sp)
      00109D                       2933 	_drop 2   
      00902C CC 88            [ 2]    1     addw sp,#2 
      00902E FF 84            [ 1] 2934 	ld a,#TK_INTGR
      00902F 81               [ 4] 2935 	ret 
                                   2936 
                                   2937 
                                   2938 ;***********************************
                                   2939 ;   expression parse,execute 
                                   2940 ;***********************************
                                   2941 ;-----------------------------------
                                   2942 ; factor ::= ['+'|'-'|e] | var | @ |
                                   2943 ;			 integer | function | constant 
                                   2944 ;			 '('relation')' 
                                   2945 ; output:
                                   2946 ;   A    token attribute 
                                   2947 ;   X 	 integer
                                   2948 ; ---------------------------------
                           000001  2949 	NEG=1
                           000001  2950 	VSIZE=1
      0010A2                       2951 factor:
      0010A2                       2952 	_vars VSIZE 
      00902F 1E 05            [ 2]    1     sub sp,#VSIZE 
      009031 16 03 CD         [ 4] 2953 	call next_token
      009034 8F 51            [ 1] 2954 	cp a,#CMD_END  
      009036 1F 05            [ 1] 2955 	jrult 16$
      009038 17 03            [ 1] 2956 1$:	ld (NEG,sp),a 
      00903A 85 CD            [ 1] 2957 	and a,#TK_GRP_MASK
      00903C 8F B3            [ 1] 2958 	cp a,#TK_GRP_ADD 
      00903E 5B 04            [ 1] 2959 	jreq 2$
      009040 81 01            [ 1] 2960 	ld a,(NEG,sp)
      009041 20 03            [ 2] 2961 	jra 4$  
      0010B7                       2962 2$:	
      009041 52 04 72         [ 4] 2963 	call next_token 
      0010BA                       2964 4$:	
      009044 5F 00            [ 1] 2965 	cp a,#TK_IFUNC 
      009046 0D 1F            [ 1] 2966 	jrne 5$ 
      009048 01               [ 4] 2967 	call (x) 
      009049 AE A7            [ 2] 2968 	jra 18$ 
      0010C1                       2969 5$:
      00904B 84 1F            [ 1] 2970 	cp a,#TK_INTGR
      00904D 03 E6            [ 1] 2971 	jrne 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00904F 02 A4            [ 2] 2972 	jra 18$
      0010C7                       2973 6$:
      009051 0F C7            [ 1] 2974 	cp a,#TK_ARRAY
      009053 00 0E            [ 1] 2975 	jrne 10$
      009055 1C 00 03         [ 4] 2976 	call get_array_element
      009058 72               [ 2] 2977 	ldw x,(x)
      009059 BB 00            [ 2] 2978 	jra 18$ 
      0010D1                       2979 10$:
      00905B 0D FE            [ 1] 2980 	cp a,#TK_VAR 
      00905D 13 01            [ 1] 2981 	jrne 12$
      00905F 27               [ 2] 2982 	ldw x,(x)
      009060 0A 1E            [ 2] 2983 	jra 18$
      0010D8                       2984 12$:			
      009062 03 FE            [ 1] 2985 	cp a,#TK_LPAREN
      009064 1D 00            [ 1] 2986 	jrne 17$
      009066 02 26 E3         [ 4] 2987 	call relation
      009069 20               [ 2] 2988 	pushw x 
      00906A 05 1E            [ 1] 2989 	ld a,#TK_RPAREN 
      00906C 03 1C 00         [ 4] 2990 	call expect
      00906F 02               [ 2] 2991 	popw x 
      009070 5B 04            [ 2] 2992 	jra 18$	
      0010E8                       2993 16$:
      009072 81               [ 1] 2994 	tnz a 
      009073 27 11            [ 1] 2995 	jreq 20$ 
      0010EB                       2996 17$:
      0010EB                       2997 	_unget_token
      009073 52 05 17 04 01   [ 1]    1      mov in,in.saved  
      009077 4F               [ 1] 2998 	clr a 
      009077 1F 02            [ 2] 2999 	jra 20$ 
      0010F3                       3000 18$: 
      009079 F6 A4            [ 1] 3001 	ld a,#TK_MINUS 
      00907B 0F 6B            [ 1] 3002 	cp a,(NEG,sp)
      00907D 01 16            [ 1] 3003 	jrne 19$
      00907F 04               [ 2] 3004 	negw x
      0010FA                       3005 19$:
      009080 5C 84            [ 1] 3006 	ld a,#TK_INTGR
      009081                       3007 20$:
      0010FC                       3008 	_drop VSIZE
      009081 90 F6            [ 2]    1     addw sp,#VSIZE 
      009083 27               [ 4] 3009 	ret
                                   3010 
                                   3011 ;-----------------------------------
                                   3012 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3013 ; output:
                                   3014 ;   A    	token attribute 
                                   3015 ;	X		integer
                                   3016 ;-----------------------------------
                           000001  3017 	N1=1   ; int16_t
                           000003  3018 	MULOP=3
                           000003  3019 	VSIZE=3
      0010FF                       3020 term:
      0010FF                       3021 	_vars VSIZE
      009084 1B 0D            [ 2]    1     sub sp,#VSIZE 
      009086 01 27 0A         [ 4] 3022 	call factor
      009089 F1               [ 1] 3023 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00908A 26 07            [ 1] 3024 	jreq term_exit 
      001107                       3025 term01:	 ; check for  operator 
      00908C 90 5C            [ 2] 3026 	ldw (N1,sp),x  ; save first factor 
      00908E 5C 0A 01         [ 4] 3027 	call next_token
      009091 20 EE            [ 1] 3028 	ld (MULOP,sp),a
      009093 A1 02            [ 1] 3029 	cp a,#CMD_END
      009093 1E 02            [ 1] 3030 	jrult 8$
      009095 1D 00            [ 1] 3031 	and a,#TK_GRP_MASK
      009097 02 4B            [ 1] 3032 	cp a,#TK_GRP_MULT
      009099 00 FE            [ 1] 3033 	jreq 1$
      00909B 84 27            [ 2] 3034 	jra 8$
      00111A                       3035 1$:	; got *|/|%
      00909D 1F 20 D7         [ 4] 3036 	call factor
      0090A0 A1 84            [ 1] 3037 	cp a,#TK_INTGR
      0090A0 1E 02            [ 1] 3038 	jreq 2$
      0090A2 F6 6B 01         [ 2] 3039 	jp syntax_error
      0090A5 A4 0F            [ 1] 3040 2$:	ldw y,x 
      0090A7 4C C7            [ 2] 3041 	ldw x,(N1,sp)
      0090A9 00 0E            [ 1] 3042 	ld a,(MULOP,sp) 
      0090AB 72 5F            [ 1] 3043 	cp a,#TK_MULT 
      0090AD 00 0D            [ 1] 3044 	jrne 3$
      0090AF 72 BB 00         [ 4] 3045 	call multiply 
      0090B2 0D FE            [ 2] 3046 	jra term01
      0090B4 7B 01            [ 1] 3047 3$: cp a,#TK_DIV 
      0090B6 4E A4            [ 1] 3048 	jrne 4$ 
      0090B8 0C 44 44         [ 4] 3049 	call divide 
      0090BB AB 80            [ 2] 3050 	jra term01 
      0090BD CD 0F A0         [ 4] 3051 4$: call modulo
      0090BD 5B 05            [ 2] 3052 	jra term01 
      0090BF 81 03            [ 1] 3053 8$: ld a,(MULOP,sp)
      0090C0 27 05            [ 1] 3054 	jreq 9$ 
      001145                       3055 	_unget_token
      0090C0 88 CD 89 F1 11   [ 1]    1      mov in,in.saved  
      0090C5 01 27            [ 2] 3056 9$: ldw x,(N1,sp)
      0090C7 03 CC            [ 1] 3057 	ld a,#TK_INTGR 	
      00114E                       3058 term_exit:
      00114E                       3059 	_drop VSIZE 
      0090C9 88 FF            [ 2]    1     addw sp,#VSIZE 
      0090CB 84               [ 4] 3060 	ret 
                                   3061 
                                   3062 ;-------------------------------
                                   3063 ;  expr ::= term [['+'|'-'] term]*
                                   3064 ;  result range {-32768..32767}
                                   3065 ;  output:
                                   3066 ;   A    token attribute 
                                   3067 ;   X	 integer   
                                   3068 ;-------------------------------
                           000001  3069 	N1=1 
                           000003  3070 	OP=3 
                           000003  3071 	VSIZE=3 
      001151                       3072 expression:
      001151                       3073 	_vars VSIZE 
      0090CC 81 03            [ 2]    1     sub sp,#VSIZE 
      0090CD CD 10 FF         [ 4] 3074 	call term
      0090CD A6               [ 1] 3075 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090CE 07 CD            [ 1] 3076 	jreq expr_exit 
      0090D0 90 C0            [ 2] 3077 1$:	ldw (N1,sp),x 
      0090D2 CD 09 71         [ 4] 3078 	call next_token
      0090D2 4B 00            [ 1] 3079 	ld (OP,sp),a 
      0090D4 CD 92            [ 1] 3080 	cp a,#CMD_END 
      0090D6 1D A1            [ 1] 3081 	jrult 8$ 
      0090D8 00 27            [ 1] 3082 	and a,#TK_GRP_MASK
      0090DA 20 A1            [ 1] 3083 	cp a,#TK_GRP_ADD 
      0090DC 84 26            [ 1] 3084 	jreq 2$ 
      0090DE 13 21            [ 2] 3085 	jra 8$
      0090DF                       3086 2$: 
      0090DF 84 90 85         [ 4] 3087 	call term
      0090E2 89 90            [ 1] 3088 	cp a,#TK_INTGR
      0090E4 89 4C            [ 1] 3089 	jreq 3$
      0090E6 88 CD 89         [ 2] 3090 	jp syntax_error
      0090E9 F1 A1 09         [ 2] 3091 3$:	ldw acc16,x 
      0090EC 27 E6            [ 2] 3092 	ldw x,(N1,sp)
      0090EE A1 00            [ 1] 3093 	ld a,(OP,sp)
      0090F0 27 09            [ 1] 3094 	cp a,#TK_PLUS 
      0090F2 A1 08            [ 1] 3095 	jrne 4$
      0090F4 27 05 55 00      [ 2] 3096 	addw x,acc16
      0090F8 03 00            [ 2] 3097 	jra 1$ 
      0090FA 02 84 81 0C      [ 2] 3098 4$:	subw x,acc16
      0090FD 20 CC            [ 2] 3099 	jra 1$
      0090FD CD 90            [ 1] 3100 8$: ld a,(OP,sp)
      0090FF CD A1            [ 1] 3101 	jreq 9$ 
      001191                       3102 	_unget_token	
      009101 01 27 03 CC 88   [ 1]    1      mov in,in.saved  
      009106 FF 85            [ 2] 3103 9$: ldw x,(N1,sp)
      009108 C3 00            [ 1] 3104 	ld a,#TK_INTGR	
      00119A                       3105 expr_exit:
      00119A                       3106 	_drop VSIZE 
      00910A 22 23            [ 2]    1     addw sp,#VSIZE 
      00910C 05               [ 4] 3107 	ret 
                                   3108 
                                   3109 ;---------------------------------------------
                                   3110 ; rel ::= expr rel_op expr
                                   3111 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3112 ;  relation return  integer , zero is false 
                                   3113 ;  output:
                                   3114 ;    A 		token attribute  
                                   3115 ;	 X		integer 
                                   3116 ;---------------------------------------------
                           000001  3117 	N1=1
                           000003  3118 	RELOP=3
                           000003  3119 	VSIZE=3 
      00119D                       3120 relation: 
      00119D                       3121 	_vars VSIZE
      00910D A6 0A            [ 2]    1     sub sp,#VSIZE 
      00910F CC 89 01         [ 4] 3122 	call expression
      009112 5D               [ 1] 3123 	tnz a 
      009113 27 F8            [ 1] 3124 	jreq rel_exit
      009115 58 89            [ 2] 3125 	ldw (N1,sp),x 
                                   3126 ; expect rel_op or leave 
      009117 AE 16 90         [ 4] 3127 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00911A 72 F0            [ 1] 3128 	ld (RELOP,sp),a 
      00911C 01 5B            [ 1] 3129 	and a,#TK_GRP_MASK
      00911E 02 A6            [ 1] 3130 	cp a,#TK_GRP_RELOP 
      009120 84 81            [ 1] 3131 	jrne 8$
      009122                       3132 2$:	; expect another expression
      009122 52 01 CD         [ 4] 3133 	call expression
      009125 89 F1            [ 1] 3134 	cp a,#TK_INTGR
      009127 A1 02            [ 1] 3135 	jreq 3$
      009129 25 3D 6B         [ 2] 3136 	jp syntax_error 
      00912C 01 A4 30         [ 2] 3137 3$:	ldw acc16,x 
      00912F A1 10            [ 2] 3138 	ldw x,(N1,sp) 
      009131 27 04 7B 01      [ 2] 3139 	subw x,acc16
      009135 20 03            [ 1] 3140 	jrne 4$
      009137 35 02 00 0D      [ 1] 3141 	mov acc8,#2 ; n1==n2
      009137 CD 89            [ 2] 3142 	jra 6$ 
      0011CD                       3143 4$: 
      009139 F1 06            [ 1] 3144 	jrsgt 5$  
      00913A 35 04 00 0D      [ 1] 3145 	mov acc8,#4 ; n1<2 
      00913A A1 81            [ 2] 3146 	jra 6$
      0011D5                       3147 5$:
      00913C 26 03 FD 20      [ 1] 3148 	mov acc8,#1 ; n1>n2 
      0011D9                       3149 6$:
      009140 32               [ 1] 3150 	clrw x 
      009141 C6 00 0D         [ 1] 3151 	ld a, acc8  
      009141 A1 84            [ 1] 3152 	and a,(RELOP,sp)
      009143 26               [ 1] 3153 	tnz a 
      009144 02 20            [ 1] 3154 	jreq 10$
      009146 2C               [ 2] 3155 	incw x 
      009147 20 0B            [ 2] 3156 	jra 10$  	
      009147 A1 06            [ 1] 3157 8$: ld a,(RELOP,sp)
      009149 26 06            [ 1] 3158 	jreq 9$
      0011E9                       3159 	_unget_token
      00914B CD 90 FD FE 20   [ 1]    1      mov in,in.saved  
      0011EE                       3160 9$: 
      009150 22 01            [ 2] 3161 	ldw x,(N1,sp)
      009151                       3162 10$:
      009151 A1 85            [ 1] 3163 	ld a,#TK_INTGR
      0011F2                       3164 rel_exit:
      0011F2                       3165 	_drop VSIZE
      009153 26 03            [ 2]    1     addw sp,#VSIZE 
      009155 FE               [ 4] 3166 	ret 
                                   3167 
                                   3168 ;--------------------------------
                                   3169 ; BASIC: SHOW 
                                   3170 ; print stack content in hexadecimal bytes 
                                   3171 ; 16 bytes per row 
                                   3172 ;--------------------------------
      0011F5                       3173 show:
      009156 20 1B 0F         [ 2] 3174 	ldw x,#cstk_prompt
      009158 CD 00 00         [ 4] 3175 	call puts 
      009158 A1               [ 1] 3176 	ldw x,sp 
      009159 07 26 0F         [ 2] 3177 	addw x,#3 ; ignore return address
      00915C CD 92 1D 89      [ 2] 3178 	ldw y,#RAM_SIZE  
      009160 A6 08 CD         [ 2] 3179 	ldw acc16,x 
      009163 90 C0 85 20      [ 2] 3180 	subw y,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009167 0B 03 59         [ 4] 3181 	call hex_dump
      009168 4F               [ 1] 3182 	clr a 
      009168 4D               [ 4] 3183 	ret
                                   3184 
      009169 27 11 6F 6E 74 65 6E  3185 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3186 
                                   3187 
                                   3188 ;--------------------------------------------
                                   3189 ; BASIC: HEX 
                                   3190 ; select hexadecimal base for integer print
                                   3191 ;---------------------------------------------
      00916B                       3192 hex_base:
      00916B 55 00 03 00      [ 1] 3193 	mov base,#16 
      00916F 02               [ 4] 3194 	ret 
                                   3195 
                                   3196 ;--------------------------------------------
                                   3197 ; BASIC: DEC 
                                   3198 ; select decimal base for integer print
                                   3199 ;---------------------------------------------
      00123B                       3200 dec_base:
      009170 4F 20 09 0A      [ 1] 3201 	mov base,#10
      009173 81               [ 4] 3202 	ret 
                                   3203 
                                   3204 ;------------------------
                                   3205 ; BASIC: SIZE 
                                   3206 ; return free size in text area
                                   3207 ; output:
                                   3208 ;   A 		TK_INTGR
                                   3209 ;   X 	    size integer
                                   3210 ;--------------------------
      001240                       3211 size:
      009173 A6 11 11         [ 2] 3212 	ldw x,#tib 
      009176 01 26 01 50      [ 2] 3213 	subw x,txtend 
      00917A A6 84            [ 1] 3214 	ld a,#TK_INTGR
      00917A A6               [ 4] 3215 	ret 
                                   3216 
                                   3217 
                                   3218 ;------------------------
                                   3219 ; BASIC: UBOUND  
                                   3220 ; return array variable size 
                                   3221 ; output:
                                   3222 ;   A 		TK_INTGR
                                   3223 ;   X 	    array size 
                                   3224 ;--------------------------
      00124A                       3225 ubound:
      00917B 84 16 90         [ 2] 3226 	ldw x,#tib
      00917C 72 B0 00 1E      [ 2] 3227 	subw x,txtend 
      00917C 5B 01 81 04      [ 2] 3228 	ldw y,basicptr 
      00917F 90 C3 00 1E      [ 2] 3229 	cpw y,txtend 
      00917F 52 03            [ 1] 3230 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009181 CD 91 22         [ 1] 3231 	push count 
      009184 4D 27            [ 1] 3232 	push #0 
      009186 47 F0 01         [ 2] 3233 	subw x,(1,sp)
      009187                       3234 	_drop 2 
      009187 1F 01            [ 2]    1     addw sp,#2 
      009189 CD               [ 2] 3235 1$:	srlw x 
      00918A 89 F1 6B         [ 2] 3236 	ldw array_size,x
      00918D 03 A1            [ 1] 3237 	ld a,#TK_INTGR
      00918F 02               [ 4] 3238 	ret 
                                   3239 
                                   3240 ;-----------------------------
                                   3241 ; BASIC: LET var=expr 
                                   3242 ; variable assignement 
                                   3243 ; output:
                                   3244 ;   A 		TK_NONE 
                                   3245 ;-----------------------------
      00126C                       3246 let:
      009190 25 2F A4         [ 4] 3247 	call next_token 
      009193 30 A1            [ 1] 3248 	cp a,#TK_VAR 
      009195 20 27            [ 1] 3249 	jreq let_var
      009197 02 20            [ 1] 3250 	cp a,#TK_ARRAY 
      009199 27 03            [ 1] 3251 	jreq  let_array
      00919A CC 08 7F         [ 2] 3252 	jp syntax_error
      00127A                       3253 let_array:
      00919A CD 91 22         [ 4] 3254 	call get_array_element
      00127D                       3255 let_var:
      00919D A1               [ 2] 3256 	pushw x  
      00919E 84 27 03         [ 4] 3257 	call next_token 
      0091A1 CC 88            [ 1] 3258 	cp a,#TK_EQUAL
      0091A3 FF 90            [ 1] 3259 	jreq 1$
      0091A5 93 1E 01         [ 2] 3260 	jp syntax_error
      001288                       3261 1$:	
      0091A8 7B 03 A1         [ 4] 3262 	call relation   
      0091AB 20 26            [ 1] 3263 	cp a,#TK_INTGR 
      0091AD 05 CD            [ 1] 3264 	jreq 2$
      0091AF 8F 51 20         [ 2] 3265 	jp syntax_error
      001292                       3266 2$:	
      0091B2 D4 A1            [ 1] 3267 	ldw y,x 
      0091B4 21               [ 2] 3268 	popw x   
      0091B5 26               [ 2] 3269 	ldw (x),y   
      0091B6 05               [ 4] 3270 	ret 
                                   3271 
                                   3272 ;----------------------------
                                   3273 ; BASIC: LIST [[start][,end]]
                                   3274 ; list program lines 
                                   3275 ; form start to end 
                                   3276 ; if empty argument list then 
                                   3277 ; list all.
                                   3278 ;----------------------------
                           000001  3279 	FIRST=1
                           000003  3280 	LAST=3 
                           000005  3281 	LN_PTR=5
                           000006  3282 	VSIZE=6 
      001297                       3283 list:
      0091B7 CD 90 0A         [ 2] 3284 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091BA 20 CB CD         [ 2] 3285 	cpw x,txtend 
      0091BD 90 20            [ 1] 3286 	jrmi 1$
      0091BF 20               [ 4] 3287 	ret 
      0012A0                       3288 1$:	
      0012A0                       3289 	_vars VSIZE
      0091C0 C6 7B            [ 2]    1     sub sp,#VSIZE 
      0091C2 03 27            [ 2] 3290 	ldw (LN_PTR,sp),x 
      0091C4 05               [ 2] 3291 	ldw x,(x) 
      0091C5 55 00            [ 2] 3292 	ldw (FIRST,sp),x ; list from first line 
      0091C7 03 00 02         [ 2] 3293 	ldw x,#MAX_LINENO ; biggest line number 
      0091CA 1E 01            [ 2] 3294 	ldw (LAST,sp),x 
      0091CC A6 84 52         [ 4] 3295 	call arg_list
      0091CE 4D               [ 1] 3296 	tnz a
      0091CE 5B 03            [ 1] 3297 	jreq list_loop 
      0091D0 81 02            [ 1] 3298 	cp a,#2 
      0091D1 27 07            [ 1] 3299 	jreq 4$
      0091D1 52 03            [ 1] 3300 	cp a,#1 
      0091D3 CD 91            [ 1] 3301 	jreq first_line 
      0091D5 7F 4D 27         [ 2] 3302 	jp syntax_error 
      0091D8 41               [ 2] 3303 4$:	popw x 
      0091D9 1F 01            [ 2] 3304 	ldw (LAST+2,sp),x 
      0012C0                       3305 first_line:
      0091DB CD               [ 2] 3306 	popw x
      0091DC 89 F1            [ 2] 3307 	ldw (FIRST,sp),x 
      0012C3                       3308 lines_skip:
      0091DE 6B 03 A1         [ 2] 3309 	ldw x,txtbgn
      0091E1 02 25            [ 2] 3310 2$:	ldw (LN_PTR,sp),x 
      0091E3 29 A4 30         [ 2] 3311 	cpw x,txtend 
      0091E6 A1 10            [ 1] 3312 	jrpl list_exit 
      0091E8 27               [ 2] 3313 	ldw x,(x) ;line# 
      0091E9 02 20            [ 2] 3314 	cpw x,(FIRST,sp)
      0091EB 21 11            [ 1] 3315 	jrpl list_loop 
      0091EC 1E 05            [ 2] 3316 	ldw x,(LN_PTR,sp) 
      0091EC CD 91            [ 1] 3317 	ld a,(2,x)
      0091EE 7F A1 84         [ 1] 3318 	ld acc8,a 
      0091F1 27 03 CC 88      [ 1] 3319 	clr acc16 
      0091F5 FF CF 00 0D      [ 2] 3320 	addw x,acc16
      0091F9 1E 01            [ 2] 3321 	jra 2$ 
                                   3322 ; print loop
      0012E3                       3323 list_loop:
      0091FB 7B 03            [ 2] 3324 	ldw x,(LN_PTR,sp)
      0091FD A1 10            [ 1] 3325 	ld a,(2,x) 
      0091FF 26 06 72         [ 4] 3326 	call prt_basic_line
      009202 BB 00            [ 2] 3327 	ldw x,(LN_PTR,sp)
      009204 0D 20            [ 1] 3328 	ld a,(2,x)
      009206 D2 72 B0         [ 1] 3329 	ld acc8,a 
      009209 00 0D 20 CC      [ 1] 3330 	clr acc16 
      00920D 7B 03 27 05      [ 2] 3331 	addw x,acc16
      009211 55 00 03         [ 2] 3332 	cpw x,txtend 
      009214 00 02            [ 1] 3333 	jrpl list_exit
      009216 1E 01            [ 2] 3334 	ldw (LN_PTR,sp),x
      009218 A6               [ 2] 3335 	ldw x,(x)
      009219 84 03            [ 2] 3336 	cpw x,(LAST,sp)  
      00921A 2F DE            [ 1] 3337 	jrslt list_loop
      001305                       3338 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00921A 5B 03 81 00 01   [ 1] 3339 	mov in,count 
      00921D AE 16 E0         [ 2] 3340 	ldw x,#pad 
      00921D 52 03 CD         [ 2] 3341 	ldw basicptr,x 
      001310                       3342 	_drop VSIZE 
      009220 91 D1            [ 2]    1     addw sp,#VSIZE 
      009222 4D               [ 4] 3343 	ret
                                   3344 
                                   3345 ;-------------------------
                                   3346 ; copy command name to buffer  
                                   3347 ; input:
                                   3348 ;   X 	name address 
                                   3349 ;   Y   destination buffer 
                                   3350 ; output:
                                   3351 ;   Y   point after name  
                                   3352 ;--------------------------
      001313                       3353 cpy_cmd_name:
      009223 27               [ 1] 3354 	ld a,(x)
      009224 4D               [ 2] 3355 	incw x
      009225 1F 01            [ 1] 3356 	and a,#15  
      009227 CD               [ 1] 3357 	push a 
      009228 89 F1            [ 1] 3358     tnz (1,sp) 
      00922A 6B 03            [ 1] 3359 	jreq 9$
      00922C A4               [ 1] 3360 1$:	ld a,(x)
      00922D 30 A1            [ 1] 3361 	ld (y),a  
      00922F 30               [ 2] 3362 	incw x
      009230 26 33            [ 2] 3363 	incw y 
      009232 0A 01            [ 1] 3364 	dec (1,sp)	 
      009232 CD 91            [ 1] 3365 	jrne 1$
      009234 D1               [ 1] 3366 9$: pop a 
      009235 A1               [ 4] 3367 	ret	
                                   3368 
                                   3369 ;--------------------------
                                   3370 ; add a space after letter or 
                                   3371 ; digit.
                                   3372 ; input:
                                   3373 ;   Y     pointer to buffer 
                                   3374 ; output:
                                   3375 ;   Y    moved to end 
                                   3376 ;--------------------------
      001328                       3377 add_space:
      009236 84 27            [ 2] 3378 	decw y 
      009238 03 CC            [ 1] 3379 	ld a,(y)
      00923A 88 FF            [ 2] 3380 	incw y
      00923C CF 00 0D         [ 4] 3381 	call is_alnum 
      00923F 1E 01            [ 1] 3382 	jrnc 1$
      009241 72 B0            [ 1] 3383 	ld a,#SPACE 
      009243 00 0D            [ 1] 3384 	ld (y),a 
      009245 26 06            [ 2] 3385 	incw y 
      009247 35               [ 4] 3386 1$: ret 
                                   3387 
                                   3388 ;--------------------------
                                   3389 ;  align text in buffer 
                                   3390 ;  to tab_width padding 
                                   3391 ;  left with  SPACE 
                                   3392 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3393 ;   X      str*
                                   3394 ;   A      str_length 
                                   3395 ; output:
                                   3396 ;   X      ajusted
                                   3397 ;--------------------------
      00133A                       3398 right_align:
      009248 02               [ 1] 3399 	push a 
      009249 00 0E            [ 1] 3400 0$: ld a,(1,sp)
      00924B 20 0C 24         [ 1] 3401 	cp a,tab_width 
      00924D 2A 08            [ 1] 3402 	jrpl 1$
      00924D 2C 06            [ 1] 3403 	ld a,#SPACE 
      00924F 35               [ 2] 3404 	decw x
      009250 04               [ 1] 3405 	ld (x),a  
      009251 00 0E            [ 1] 3406 	inc (1,sp)
      009253 20 04            [ 2] 3407 	jra 0$ 
      009255 84               [ 1] 3408 1$: pop a 	
      009255 35               [ 4] 3409 	ret 
                                   3410 
                                   3411 ;--------------------------
                                   3412 ; print TK_QSTR
                                   3413 ; converting control character
                                   3414 ; to backslash sequence
                                   3415 ; input:
                                   3416 ;   X        char *
                                   3417 ;   Y        dest. buffer 
                                   3418 ; output:
                                   3419 ;   X        moved forward 
                                   3420 ;   Y        moved forward 
                                   3421 ;-----------------------------
      00134C                       3422 cpy_quote:
      009256 01 00            [ 1] 3423 	ld a,#'"
      009258 0E F7            [ 1] 3424 	ld (y),a 
      009259 90 5C            [ 2] 3425 	incw y 
      009259 5F               [ 1] 3426 1$:	ld a,(x)
      00925A C6 00            [ 1] 3427 	jreq 9$
      00925C 0E               [ 2] 3428 	incw x 
      00925D 14 03            [ 1] 3429 	cp a,#SPACE 
      00925F 4D 27            [ 1] 3430 	jrult 3$
      009261 0E 5C            [ 1] 3431 	ld (y),a
      009263 20 0B            [ 2] 3432 	incw y 
      009265 7B 03            [ 1] 3433 	cp a,#'\ 
      009267 27 05            [ 1] 3434 	jrne 1$ 
      001362                       3435 2$:
      009269 55 00            [ 1] 3436 	ld (y),a
      00926B 03 00            [ 2] 3437 	incw y  
      00926D 02 EA            [ 2] 3438 	jra 1$
      00926E 88               [ 1] 3439 3$: push a 
      00926E 1E 01            [ 1] 3440 	ld a,#'\
      009270 90 F7            [ 1] 3441 	ld (y),a 
      009270 A6 84            [ 2] 3442 	incw y  
      009272 84               [ 1] 3443 	pop a 
      009272 5B 03            [ 1] 3444 	sub a,#7
      009274 81 00 0D         [ 1] 3445 	ld acc8,a 
      009275 72 5F 00 0C      [ 1] 3446 	clr acc16
      009275 AE               [ 2] 3447 	pushw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009276 92 8F CD         [ 2] 3448 	ldw x,#escaped 
      009279 A8 C0 96 1C      [ 2] 3449 	addw x,acc16 
      00927D 00               [ 1] 3450 	ld a,(x)
      00927E 03               [ 2] 3451 	popw x
      00927F 90 AE            [ 2] 3452 	jra 2$
      009281 18 00            [ 1] 3453 9$: ld a,#'"
      009283 CF 00            [ 1] 3454 	ld (y),a 
      009285 0D 72            [ 2] 3455 	incw y  
      009287 B2               [ 2] 3456 	incw x 
      009288 00               [ 4] 3457 	ret
                                   3458 
                                   3459 ;--------------------------
                                   3460 ; return variable name 
                                   3461 ; from its address.
                                   3462 ; input:
                                   3463 ;   X    variable address
                                   3464 ; output:
                                   3465 ;   A     variable letter
                                   3466 ;--------------------------
      00138D                       3467 var_name:
      009289 0D CD 83         [ 2] 3468 		subw x,#vars 
      00928C D9               [ 1] 3469 		ld a,xl 
      00928D 4F               [ 1] 3470 		srl a 
      00928E 81 0A            [ 1] 3471 		add a,#'A 
      009290 63               [ 4] 3472 		ret 
                                   3473 
                                   3474 ;-----------------------------
                                   3475 ; return cmd  idx from its 
                                   3476 ; code address 
                                   3477 ; input:
                                   3478 ;   X      code address 
                                   3479 ; output:
                                   3480 ;   X      cmd_idx
                                   3481 ;-----------------------------
      001395                       3482 get_cmd_idx:
      009291 6F 6E            [ 2] 3483 	pushw y
      009293 74 65 6E 74      [ 2] 3484 	ldw y,#code_addr 
      009297 20 6F 66 20      [ 2] 3485 	ldw ptr16,y 
      00929B 73 74            [ 1] 3486 	clrw y 
      00929D 61 63 6B         [ 5] 3487 1$:	cpw x,([ptr16],y)
      0092A0 20 66            [ 1] 3488 	jreq 3$ 
      0092A2 72 6F            [ 2] 3489 	incw y 
      0092A4 6D 20 74         [ 4] 3490 	ld a,([ptr16],y)
      0092A7 6F 70            [ 2] 3491 	incw y
      0092A9 20 74 6F         [ 4] 3492 	or a,([ptr16],y)	
      0092AC 20 62            [ 1] 3493 	jrne 1$
      0092AE 6F               [ 1] 3494 3$: ldw x,y 
      0092AF 74 74            [ 2] 3495 	popw y 
      0092B1 6F               [ 4] 3496 	ret
                                   3497 
                                   3498 ;-------------------------------------
                                   3499 ; decompile tokens list 
                                   3500 ; to original text line 
                                   3501 ; input:
                                   3502 ;   [basicptr]  pointer at line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3503 ;   Y           destination buffer
                                   3504 ; output:
                                   3505 ;   A           length 
                                   3506 ;   Y           after string  
                                   3507 ;------------------------------------
                           000001  3508 	BASE_SAV=1
                           000002  3509 	WIDTH_SAV=2
                           000003  3510 	STR=3
                           000004  3511 	VSIZE=4 
      0013B6                       3512 decompile::
      0013B6                       3513 	_vars VSIZE
      0092B2 6D 3A            [ 2]    1     sub sp,#VSIZE 
      0092B4 0A 00 0A         [ 1] 3514 	ld a,base
      0092B6 6B 01            [ 1] 3515 	ld (BASE_SAV,sp),a  
      0092B6 35 10 00         [ 1] 3516 	ld a,tab_width 
      0092B9 0B 81            [ 1] 3517 	ld (WIDTH_SAV,sp),a 
      0092BB 17 03            [ 2] 3518 	ldw (STR,sp),y   
      0092BB 35 0A 00 0B      [ 5] 3519 	ldw x,[basicptr] ; line number 
      0092BF 81 0A 00 0A      [ 1] 3520 	mov base,#10
      0092C0 35 05 00 24      [ 1] 3521 	mov tab_width,#5
      0092C0 AE 16 90 72      [ 1] 3522 	clr acc24 
      0092C4 B0 00 1F         [ 2] 3523 	ldw acc16,x
      0092C7 A6 84 81         [ 4] 3524 	call itoa  
      0092CA CD 13 3A         [ 4] 3525 	call right_align 
      0092CA AE               [ 1] 3526 	push a 
      0092CB 16 90            [ 1] 3527 1$:	ldw y,x ; source
      0092CD 72 B0            [ 2] 3528 	ldw x,(STR+1,sp) ; destination
      0092CF 00 1F 90         [ 4] 3529 	call strcpy 
      0092D2 CE 00            [ 1] 3530 	clrw y 
      0092D4 05               [ 1] 3531 	pop a 
      0092D5 90 C3            [ 1] 3532 	ld yl,a 
      0092D7 00 1F 25         [ 2] 3533 	addw y,(STR,sp)
      0092DA 0A 3B            [ 1] 3534 	ld a,#SPACE 
      0092DC 00 04            [ 1] 3535 	ld (y),a 
      0092DE 4B 00            [ 2] 3536 	incw y 
      0092E0 72 F0 01 5B      [ 1] 3537 	clr tab_width
      0092E4 02 54 CF         [ 2] 3538 	ldw x,#3
      0092E7 00 22 A6         [ 2] 3539 	ldw in.w,x 
      0013FD                       3540 decomp_loop:
      0092EA 84 81            [ 2] 3541 	pushw y
      0092EC CD 09 71         [ 4] 3542 	call next_token 
      0092EC CD 89            [ 2] 3543 	popw y 
      0092EE F1               [ 1] 3544 	tnz a  
      0092EF A1 85            [ 1] 3545 	jrne 1$
      0092F1 27 0A A1         [ 2] 3546 	jp 20$
      0092F4 06 27            [ 1] 3547 1$:	jrpl 6$
                                   3548 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_VAR|TK_INTGR
      0092F6 03 CC            [ 1] 3549 	cp a,#TK_VAR 
      0092F8 88 FF            [ 1] 3550 	jrne 3$
                                   3551 ;; TK_VAR 
      0092FA CD 13 28         [ 4] 3552 	call add_space  
      0092FA CD 90 FD         [ 4] 3553 	call var_name
      0092FD 90 F7            [ 1] 3554 	ld (y),a 
      0092FD 89 CD            [ 2] 3555 	incw y  
      0092FF 89 F1            [ 2] 3556 	jra decomp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00141C                       3557 3$:
      009301 A1 32            [ 1] 3558 	cp a,#TK_INTGR
      009303 27 03            [ 1] 3559 	jrne 4$
                                   3560 ;; TK_INTGR
      009305 CC 88 FF         [ 4] 3561 	call add_space
      009308 72 5F 00 0B      [ 1] 3562 	clr acc24 
      009308 CD 92 1D         [ 2] 3563 	ldw acc16,x 
      00930B A1 84            [ 2] 3564 	pushw y 
      00930D 27 03 CC         [ 4] 3565 	call itoa  
      009310 88 FF            [ 2] 3566 	ldw y,(1,sp) 
      009312 88               [ 1] 3567 	push a 
      009312 90               [ 1] 3568 	exgw x,y 
      009313 93 85 FF         [ 4] 3569 	call strcpy 
      009316 81 5F            [ 1] 3570 	clrw y
      009317 84               [ 1] 3571 	pop a  
      009317 CE 00            [ 1] 3572 	ld yl,a 
      009319 1D C3 00         [ 2] 3573 	addw y,(1,sp)
      00143E                       3574 	_drop 2 
      00931C 1F 2B            [ 2]    1     addw sp,#2 
      00931E 01 81            [ 2] 3575 	jra decomp_loop
                                   3576 ;; dictionary keyword 
      009320                       3577 4$:	
      009320 52 06 1F         [ 4] 3578 	call get_cmd_idx 
      009323 05 FE 1F         [ 2] 3579 	cpw x,#REM_IDX
      009326 01 AE            [ 1] 3580 	jrne 5$
      009328 7F FF 1F         [ 2] 3581 	ldw x,basicptr 
                                   3582 ; copy comment to buffer 
      00932B 03 CD 90         [ 4] 3583 	call add_space
      00932E D2 4D            [ 1] 3584 	ld a,#''
      009330 27 31            [ 1] 3585 	ld (y),a 
      009332 A1 02            [ 2] 3586 	incw y 
      001456                       3587 41$:
      009334 27 07 A1 01      [ 4] 3588 	ld a,([in.w],x)
      009338 27 06 CC 88      [ 1] 3589 	inc in  
      00933C FF 85            [ 1] 3590 	ld (y),a 
      00933E 1F 05            [ 2] 3591 	incw y 
      009340 C6 00 01         [ 1] 3592 	ld a,in 
      009340 85 1F 01         [ 1] 3593 	cp a,count 
      009343 2B EC            [ 1] 3594 	jrmi 41$
      009343 CE 00            [ 2] 3595 	jra 20$  
                                   3596 ; insert command name 
      00146C                       3597 5$:
      009345 1D 1F 05         [ 4] 3598 	call add_space  
      009348 C3 00            [ 2] 3599 	pushw y
      00934A 1F 2A 38         [ 4] 3600 	call cmd_name
      00934D FE 13            [ 2] 3601 	popw y 
      00934F 01 2A 11         [ 4] 3602 	call cpy_cmd_name
      009352 1E 05            [ 2] 3603 	jra decomp_loop 
      00147B                       3604 6$:
      009354 E6 02            [ 1] 3605 	cp a,#TK_QSTR 
      009356 C7 00            [ 1] 3606 	jrne 7$
                                   3607 ;; TK_QSTR
      009358 0E 72 5F         [ 4] 3608 	call cpy_quote  
      00935B 00 0D 72         [ 2] 3609 	jp decomp_loop
      001485                       3610 7$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00935E BB 00            [ 1] 3611 	cp a,#TK_CHAR 
      009360 0D 20            [ 1] 3612 	jrne 8$
                                   3613 ;; TK_CHAR 
      009362 E3 5C            [ 1] 3614 	ld a,#'\ 
      009363 90 F7            [ 1] 3615 	ld (y),a 
      009363 1E 05            [ 2] 3616 	incw y 
      009365 E6               [ 1] 3617 	ld a,xl 
      009366 02 CD            [ 1] 3618 	ld (y),a 
      009368 95 9E            [ 2] 3619 	incw y 
      00936A 1E 05 E6         [ 2] 3620 	jp decomp_loop
      00936D 02 C7            [ 1] 3621 8$: cp a,#TK_COLON 
      00936F 00 0E            [ 1] 3622 	jrne 9$
      009371 72 5F            [ 1] 3623 	ld a,#':
      00149D                       3624 81$:
      009373 00 0D            [ 1] 3625 	ld (y),a 
      009375 72 BB            [ 2] 3626 	incw y 
      0014A1                       3627 82$:
      009377 00 0D C3         [ 2] 3628 	jp decomp_loop
      0014A4                       3629 9$: 
      00937A 00 1F            [ 1] 3630 	cp a,#TK_SHARP
      00937C 2A 07            [ 1] 3631 	jrugt 10$ 
      00937E 1F 05            [ 1] 3632 	sub a,#TK_ARRAY 
      009380 FE               [ 1] 3633 	clrw x 
      009381 13               [ 1] 3634 	ld xl,a
      009382 03 2F DE         [ 2] 3635 	addw x,#single_char 
      009385 F6               [ 1] 3636 	ld a,(x)
      009385 55 00            [ 2] 3637 	jra 81$ 
      0014B2                       3638 10$: 
      009387 04 00            [ 1] 3639 	cp a,#TK_MINUS 
      009389 02 AE            [ 1] 3640 	jrugt 11$
      00938B 16 E0            [ 1] 3641 	sub a,#TK_PLUS 
      00938D CF               [ 1] 3642 	clrw x 
      00938E 00               [ 1] 3643 	ld xl,a 
      00938F 05 5B 06         [ 2] 3644 	addw x,#add_char 
      009392 81               [ 1] 3645 	ld a,(x)
      009393 20 DD            [ 2] 3646 	jra 81$
      0014C0                       3647 11$:
      009393 F6 5C            [ 1] 3648     cp a,#TK_MOD 
      009395 A4 0F            [ 1] 3649 	jrugt 12$
      009397 88 0D            [ 1] 3650 	sub a,#TK_MULT
      009399 01               [ 1] 3651 	clrw x 
      00939A 27               [ 1] 3652 	ld xl,a 
      00939B 0A F6 90         [ 2] 3653 	addw x,#mul_char
      00939E F7               [ 1] 3654 	ld a,(x)
      00939F 5C 90            [ 2] 3655 	jra 81$
      0014CE                       3656 12$:
      0093A1 5C 0A            [ 1] 3657 	sub a,#TK_GT  
      0093A3 01               [ 1] 3658 	sll a 
      0093A4 26               [ 1] 3659 	clrw x 
      0093A5 F6               [ 1] 3660 	ld xl,a 
      0093A6 84 81 03         [ 2] 3661 	addw x,#relop_str 
      0093A8 FE               [ 2] 3662 	ldw x,(x)
      0093A8 90               [ 1] 3663 	ld a,(x)
      0093A9 5A               [ 2] 3664 	incw x 
      0093AA 90 F6            [ 1] 3665 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093AC 90 5C            [ 2] 3666 	incw y 
      0093AE CD               [ 1] 3667 	ld a,(x)
      0093AF 86 0B            [ 1] 3668 	jrne 81$
      0093B1 24 06 A6         [ 2] 3669 	jp decomp_loop 
      0014E3                       3670 20$: 
      0093B4 20 90            [ 1] 3671 	clr (y)
      0093B6 F7 90            [ 2] 3672 	ldw x,(STR,sp)
      0093B8 5C 81            [ 1] 3673 	ld a,(BASE_SAV,sp)
      0093BA C7 00 0A         [ 1] 3674 	ld base,a 
      0093BA 88 7B            [ 1] 3675 	ld a,(WIDTH_SAV,sp)
      0093BC 01 C1 00         [ 1] 3676 	ld tab_width,a
      0093BF 25 2A 08         [ 2] 3677 	subw y,(STR,sp) 
      0093C2 A6 20            [ 1] 3678 	ld a,yl 
      0014F6                       3679 	_drop VSIZE 
      0093C4 5A F7            [ 2]    1     addw sp,#VSIZE 
      0093C6 0C               [ 4] 3680 	ret 
                                   3681 
      0093C7 01 20 F1 84 81        3682 single_char: .byte '@','(',')',',','#'
      0093CC 2B 2D                 3683 add_char: .byte '+','-'
      0093CC A6 22 90              3684 mul_char: .byte '*','/','%'
      0093CF F7 90 5C F6 27 30 5C  3685 relop_str: .word gt,equal,ge,lt,le,ne 
             A1 20 25 0E 90
      0093DB F7 90                 3686 gt: .asciz ">"
      0093DD 5C A1                 3687 equal: .asciz "="
      0093DF 5C 26 F0              3688 ge: .asciz ">="
      0093E2 3C 00                 3689 lt: .asciz "<"
      0093E2 90 F7 90              3690 le: .asciz "<="
      0093E5 5C 20 EA              3691 ne:  .asciz "<>"
                                   3692 
                                   3693 
                                   3694 ;--------------------------
                                   3695 ; decompile line from token list
                                   3696 ; and print it. 
                                   3697 ; input:
                                   3698 ;   A       stop at this position 
                                   3699 ;   X 		pointer at line
                                   3700 ; output:
                                   3701 ;   none 
                                   3702 ;--------------------------	
      00151E                       3703 prt_basic_line:
      0093E8 88 A6 5C         [ 1] 3704 	ld count,a 
      0093EB 90 F7            [ 1] 3705 	ld a,(2,x)
      0093ED 90 5C 84         [ 1] 3706 	cp a,count 
      0093F0 A0 07            [ 1] 3707 	jrpl 1$ 
      0093F2 C7 00 0E         [ 1] 3708 	ld count,a 
      0093F5 72 5F 00         [ 2] 3709 1$:	ldw basicptr,x 
      0093F8 0D 89 AE 8B      [ 2] 3710 	ldw y,#tib  
      0093FC A0 72 BB         [ 4] 3711 	call decompile 
      0093FF 00 0D F6         [ 4] 3712 	call puts 
      009402 85 20            [ 1] 3713 	ld a,#CR 
      009404 DD A6 22         [ 4] 3714 	call putc 
      009407 90               [ 4] 3715 	ret 
                                   3716 
                                   3717 
                                   3718 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3719 ;---------------------------------
                                   3720 ; BASIC: PRINT|? arg_list 
                                   3721 ; print values from argument list
                                   3722 ;----------------------------------
                           000001  3723 	COMMA=1
                           000001  3724 	VSIZE=1
      00153E                       3725 print:
      00153E                       3726 	_vars VSIZE 
      009408 F7 90            [ 2]    1     sub sp,#VSIZE 
      001540                       3727 reset_comma:
      00940A 5C 5C            [ 1] 3728 	clr (COMMA,sp)
      001542                       3729 prt_loop:
      00940C 81 09 71         [ 4] 3730 	call next_token
      00940D A1 02            [ 1] 3731 	cp a,#CMD_END 
      00940D 1D 00            [ 1] 3732 	jrult print_exit ; colon or end of line 
      00940F 30 9F            [ 1] 3733 	cp a,#TK_QSTR
      009411 44 AB            [ 1] 3734 	jreq 1$
      009413 41 81            [ 1] 3735 	cp a,#TK_CHAR 
      009415 27 13            [ 1] 3736 	jreq 2$ 
      009415 90 89            [ 1] 3737 	cp a,#TK_CFUNC 
      009417 90 AE            [ 1] 3738 	jreq 3$
      009419 A7 8C            [ 1] 3739 	cp a,#TK_COMMA 
      00941B 90 CF            [ 1] 3740 	jreq 4$
      00941D 00 18            [ 1] 3741 	cp a,#TK_SHARP 
      00941F 90 5F            [ 1] 3742 	jreq 5$
      009421 91 D3            [ 2] 3743 	jra 7$ 
      00155F                       3744 1$:	; print string 
      009423 18 27 0C         [ 4] 3745 	call puts
      009426 90 5C            [ 2] 3746 	jra reset_comma
      001564                       3747 2$:	; print character 
      009428 91               [ 1] 3748 	ld a,xl 
      009429 D6 18 90         [ 4] 3749 	call putc 
      00942C 5C 91            [ 2] 3750 	jra reset_comma 
      00156A                       3751 3$: ; print character function value  	
      00942E DA               [ 4] 3752 	call (x)
      00942F 18               [ 1] 3753 	ld a,xl 
      009430 26 EF 93         [ 4] 3754 	call putc
      009433 90 85            [ 2] 3755 	jra reset_comma 
      001571                       3756 4$: ; set comma state 
      009435 81 01            [ 1] 3757 	cpl (COMMA,sp)
      009436 20 CD            [ 2] 3758 	jra prt_loop   
      001575                       3759 5$: ; # character must be followed by an integer   
      009436 52 04 C6         [ 4] 3760 	call next_token
      009439 00 0B            [ 1] 3761 	cp a,#TK_INTGR 
      00943B 6B 01            [ 1] 3762 	jreq 6$
      00943D C6 00 25         [ 2] 3763 	jp syntax_error 
      00157F                       3764 6$: ; set tab width
      009440 6B               [ 1] 3765 	ld a,xl 
      009441 02 17            [ 1] 3766 	and a,#15 
      009443 03 72 CE         [ 1] 3767 	ld tab_width,a 
      009446 00 05            [ 2] 3768 	jra reset_comma 
      001587                       3769 7$:	
      001587                       3770 	_unget_token 
      009448 35 0A 00 0B 35   [ 1]    1      mov in,in.saved  
      00944D 05 00 25         [ 4] 3771 	call relation 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009450 72 5F            [ 1] 3772 	cp a,#TK_INTGR 
      009452 00 0C            [ 1] 3773 	jrne print_exit 
      009454 CF 00 0D         [ 4] 3774     call print_int 
      009457 CD 8A            [ 2] 3775 	jra reset_comma 
      001598                       3776 print_exit:
      009459 69 CD            [ 1] 3777 	tnz (COMMA,sp)
      00945B 93 BA            [ 1] 3778 	jrne 9$
      00945D 88 90            [ 1] 3779 	ld a,#CR 
      00945F 93 1E 04         [ 4] 3780     call putc 
      0015A1                       3781 9$:	_drop VSIZE 
      009462 CD 84            [ 2]    1     addw sp,#VSIZE 
      009464 32               [ 4] 3782 	ret 
                                   3783 
                                   3784 ;----------------------
                                   3785 ; 'save_context' and
                                   3786 ; 'rest_context' must be 
                                   3787 ; called at the same 
                                   3788 ; call stack depth 
                                   3789 ; i.e. SP must have the 
                                   3790 ; save value at  
                                   3791 ; entry point of both 
                                   3792 ; routine. 
                                   3793 ;---------------------
                           000004  3794 	CTXT_SIZE=4 ; size of saved data 
                                   3795 ;--------------------
                                   3796 ; save current BASIC
                                   3797 ; interpreter context 
                                   3798 ; on stack 
                                   3799 ;--------------------
      0015A4                       3800 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0015A4                       3801 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0015A4                       3802 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0015A4                       3803 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0015A4                       3804 save_context:
      009465 90 5F 84         [ 2] 3805 	ldw x,basicptr 
      009468 90 97            [ 2] 3806 	ldw (BPTR,sp),x
      00946A 72 F9 03         [ 1] 3807 	ld a,in 
      00946D A6 20            [ 1] 3808 	ld (IN,sp),a
      00946F 90 F7 90         [ 1] 3809 	ld a,count 
      009472 5C 72            [ 1] 3810 	ld (CNT,sp),a  
      009474 5F               [ 4] 3811 	ret
                                   3812 
                                   3813 ;-----------------------
                                   3814 ; restore previously saved 
                                   3815 ; BASIC interpreter context 
                                   3816 ; from stack 
                                   3817 ;-------------------------
      0015B4                       3818 rest_context:
      009475 00 25            [ 2] 3819 	ldw x,(BPTR,sp)
      009477 AE 00 03         [ 2] 3820 	ldw basicptr,x 
      00947A CF 00            [ 1] 3821 	ld a,(IN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00947C 01 00 01         [ 1] 3822 	ld in,a
      00947D 7B 06            [ 1] 3823 	ld a,(CNT,sp)
      00947D 90 89 CD         [ 1] 3824 	ld count,a  
      009480 89               [ 4] 3825 	ret
                                   3826 
                                   3827 
                                   3828 
                                   3829 ;------------------------------------------
                                   3830 ; BASIC: INPUT [string]var[,[string]var]
                                   3831 ; input value in variables 
                                   3832 ; [string] optionally can be used as prompt 
                                   3833 ;-----------------------------------------
                           000001  3834 	CX_BPTR=1
                           000003  3835 	CX_IN=3
                           000004  3836 	CX_CNT=4
                           000005  3837 	SKIP=5
                           000006  3838 	VAR_ADDR=6
                           000007  3839 	VSIZE=7
      0015C4                       3840 input_var:
      0015C4                       3841 	_vars VSIZE 
      009481 F1 90            [ 2]    1     sub sp,#VSIZE 
      0015C6                       3842 input_loop:
      009483 85 4D            [ 1] 3843 	clr (SKIP,sp)
      009485 26 03 CC         [ 4] 3844 	call next_token 
      009488 95 63            [ 1] 3845 	cp a,#TK_QSTR 
      00948A 2A 6F            [ 1] 3846 	jrne 1$ 
      00948C A1 85 26         [ 4] 3847 	call puts 
      00948F 0C CD            [ 1] 3848 	cpl (SKIP,sp)
      009491 93 A8 CD         [ 4] 3849 	call next_token 
      009494 94 0D            [ 1] 3850 1$: cp a,#TK_VAR  
      009496 90 F7            [ 1] 3851 	jreq 2$ 
      009498 90 5C 20         [ 2] 3852 	jp syntax_error
      00949B E1 06            [ 2] 3853 2$:	ldw (VAR_ADDR,sp),x 
      00949C 0D 05            [ 1] 3854 	tnz (SKIP,sp)
      00949C A1 84            [ 1] 3855 	jrne 21$ 
      00949E 26 22 CD         [ 4] 3856 	call var_name 
      0094A1 93 A8 72         [ 4] 3857 	call putc   
      0015EA                       3858 21$:
      0094A4 5F 00            [ 1] 3859 	ld a,#':
      0094A6 0C CF 00         [ 4] 3860 	call putc 
      0094A9 0D 90 89         [ 4] 3861 	call save_context 
      0094AC CD 8A 69 16      [ 1] 3862 	clr count  
      0094B0 01 88 51         [ 4] 3863 	call readln 
      0094B3 CD 84 32         [ 2] 3864 	ldw x,#tib 
      0094B6 90 5F 84         [ 1] 3865 	push count
      0094B9 90 97            [ 1] 3866 	push #0 
      0094BB 72 F9 01         [ 2] 3867 	addw x,(1,sp)
      0094BE 5B               [ 2] 3868 	incw x 
      001605                       3869 	_drop 2 
      0094BF 02 20            [ 2]    1     addw sp,#2 
      0094C1 BB 5F 00 01      [ 1] 3870 	clr in 
      0094C2 CD 0B FC         [ 4] 3871 	call get_token
      0094C2 CD 94            [ 1] 3872 	cp a,#TK_INTGR
      0094C4 15 A3            [ 1] 3873 	jreq 3$ 
      0094C6 00 8E 26         [ 4] 3874 	call rest_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094C9 22 CE 00         [ 2] 3875 	jp syntax_error
      0094CC 05 CD            [ 2] 3876 3$: ldw y,(VAR_ADDR,sp) 
      0094CE 93 A8            [ 2] 3877 	ldw (y),x 
      0094D0 A6 27 90         [ 4] 3878 	call rest_context
      0094D3 F7 90 5C         [ 4] 3879 	call next_token 
      0094D6 A1 09            [ 1] 3880 	cp a,#TK_COMMA 
      0094D6 72 D6            [ 1] 3881 	jreq input_loop 
      0094D8 00 01            [ 1] 3882 	cp a,#TK_COLON 
      0094DA 72 5C            [ 2] 3883     jrule input_exit 
      0094DC 00 02 90         [ 2] 3884 	jp syntax_error 
      00162D                       3885 input_exit:
      00162D                       3886 	_drop VSIZE 
      0094DF F7 90            [ 2]    1     addw sp,#VSIZE 
      0094E1 5C               [ 4] 3887 	ret 
                                   3888 
                                   3889 
                                   3890 ;---------------------
                                   3891 ; BASIC: REMARK | ' 
                                   3892 ; skip comment to end of line 
                                   3893 ;---------------------- 
      001630                       3894 remark:
      0094E2 C6 00 02 C1 00   [ 1] 3895 	mov in,count 
      0094E7 04               [ 4] 3896  	ret 
                                   3897 
                                   3898 
                                   3899 ;---------------------
                                   3900 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3901 ; read in loop 'addr'  
                                   3902 ; apply & 'mask' to value 
                                   3903 ; loop while result==0.  
                                   3904 ; 'xor_mask' is used to 
                                   3905 ; invert the wait logic.
                                   3906 ; i.e. loop while not 0.
                                   3907 ;---------------------
                           000001  3908 	XMASK=1 
                           000002  3909 	MASK=2
                           000003  3910 	ADDR=3
                           000004  3911 	VSIZE=4
      001636                       3912 wait: 
      001636                       3913 	_vars VSIZE
      0094E8 2B EC            [ 2]    1     sub sp,#VSIZE 
      0094EA 20 77            [ 1] 3914 	clr (XMASK,sp) 
      0094EC CD 10 52         [ 4] 3915 	call arg_list 
      0094EC CD 93            [ 1] 3916 	cp a,#2
      0094EE A8 90            [ 1] 3917 	jruge 0$
      0094F0 89 CD 90         [ 2] 3918 	jp syntax_error 
      0094F3 41 90            [ 1] 3919 0$:	cp a,#3
      0094F5 85 CD            [ 1] 3920 	jrult 1$
      0094F7 93               [ 2] 3921 	popw x 
      0094F8 93               [ 1] 3922 	ld a,xl
      0094F9 20 82            [ 1] 3923 	ld (XMASK,sp),a 
      0094FB 85               [ 2] 3924 1$: popw x ; mask 
      0094FB A1               [ 1] 3925 	ld a,xl 
      0094FC 02 26            [ 1] 3926 	ld (MASK,sp),a 
      0094FE 06               [ 2] 3927 	popw x ; address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094FF CD               [ 1] 3928 2$:	ld a,(x)
      009500 93 CC            [ 1] 3929 	and a,(MASK,sp)
      009502 CC 94            [ 1] 3930 	xor a,(XMASK,sp)
      009504 7D F9            [ 1] 3931 	jreq 2$ 
      009505                       3932 	_drop VSIZE 
      009505 A1 03            [ 2]    1     addw sp,#VSIZE 
      009507 26               [ 4] 3933 	ret 
                                   3934 
                                   3935 ;---------------------
                                   3936 ; BASIC: BSET addr,mask
                                   3937 ; set bits at 'addr' corresponding 
                                   3938 ; to those of 'mask' that are at 1.
                                   3939 ; arguments:
                                   3940 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3941 ;   mask        mask|addr
                                   3942 ; output:
                                   3943 ;	none 
                                   3944 ;--------------------------
      00165B                       3945 bit_set:
      009508 0E A6 5C         [ 4] 3946 	call arg_list 
      00950B 90 F7            [ 1] 3947 	cp a,#2	 
      00950D 90 5C            [ 1] 3948 	jreq 1$ 
      00950F 9F 90 F7         [ 2] 3949 	jp syntax_error
      001665                       3950 1$: 
      009512 90               [ 2] 3951 	popw x ; mask 
      009513 5C               [ 1] 3952 	ld a,xl 
      009514 CC               [ 2] 3953 	popw x ; addr  
      009515 94               [ 1] 3954 	or a,(x)
      009516 7D               [ 1] 3955 	ld (x),a
      009517 A1               [ 4] 3956 	ret 
                                   3957 
                                   3958 ;---------------------
                                   3959 ; BASIC: BRES addr,mask
                                   3960 ; reset bits at 'addr' corresponding 
                                   3961 ; to those of 'mask' that are at 1.
                                   3962 ; arguments:
                                   3963 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3964 ;   mask	    ~mask&*addr  
                                   3965 ; output:
                                   3966 ;	none 
                                   3967 ;--------------------------
      00166B                       3968 bit_reset:
      009518 01 26 09         [ 4] 3969 	call arg_list 
      00951B A6 3A            [ 1] 3970 	cp a,#2  
      00951D 27 03            [ 1] 3971 	jreq 1$ 
      00951D 90 F7 90         [ 2] 3972 	jp syntax_error
      001675                       3973 1$: 
      009520 5C               [ 2] 3974 	popw x ; mask 
      009521 9F               [ 1] 3975 	ld a,xl 
      009521 CC               [ 1] 3976 	cpl a 
      009522 94               [ 2] 3977 	popw x ; addr  
      009523 7D               [ 1] 3978 	and a,(x)
      009524 F7               [ 1] 3979 	ld (x),a 
      009524 A1               [ 4] 3980 	ret 
                                   3981 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3982 ;---------------------
                                   3983 ; BASIC: BTOGL addr,mask
                                   3984 ; toggle bits at 'addr' corresponding 
                                   3985 ; to those of 'mask' that are at 1.
                                   3986 ; arguments:
                                   3987 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3988 ;   mask	    mask^*addr  
                                   3989 ; output:
                                   3990 ;	none 
                                   3991 ;--------------------------
      00167C                       3992 bit_toggle:
      009525 0A 22 0A         [ 4] 3993 	call arg_list 
      009528 A0 06            [ 1] 3994 	cp a,#2 
      00952A 5F 97            [ 1] 3995 	jreq 1$ 
      00952C 1C 95 79         [ 2] 3996 	jp syntax_error
      00952F F6               [ 2] 3997 1$: popw x ; mask 
      009530 20               [ 1] 3998 	ld a,xl 
      009531 EB               [ 2] 3999 	popw x ; addr  
      009532 F8               [ 1] 4000 	xor a,(x)
      009532 A1               [ 1] 4001 	ld (x),a 
      009533 11               [ 4] 4002 	ret 
                                   4003 
                                   4004 
                                   4005 ;---------------------
                                   4006 ; BASIC: BTEST(addr,bit)
                                   4007 ; return bit value at 'addr' 
                                   4008 ; bit is in range {0..7}.
                                   4009 ; arguments:
                                   4010 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4011 ;   bit 	    bit position {0..7}  
                                   4012 ; output:
                                   4013 ;	none 
                                   4014 ;--------------------------
      00168C                       4015 bit_test:
      009534 22 0A A0         [ 4] 4016 	call func_args 
      009537 10 5F            [ 1] 4017 	cp a,#2
      009539 97 1C            [ 1] 4018 	jreq 0$
      00953B 95 7E F6         [ 2] 4019 	jp syntax_error
      001696                       4020 0$:	
      00953E 20               [ 2] 4021 	popw x 
      00953F DD               [ 1] 4022 	ld a,xl 
      009540 A4 07            [ 1] 4023 	and a,#7
      009540 A1               [ 1] 4024 	push a   
      009541 22 22            [ 1] 4025 	ld a,#1 
      009543 0A A0            [ 1] 4026 1$: tnz (1,sp)
      009545 20 5F            [ 1] 4027 	jreq 2$
      009547 97               [ 1] 4028 	sll a 
      009548 1C 95            [ 1] 4029 	dec (1,sp)
      00954A 80 F6            [ 2] 4030 	jra 1$
      0016A6                       4031 2$: _drop 1 
      00954C 20 CF            [ 2]    1     addw sp,#1 
      00954E 85               [ 2] 4032 	popw x 
      00954E A0               [ 1] 4033 	and a,(x)
      00954F 31 48            [ 1] 4034 	jreq 3$
      009551 5F 97            [ 1] 4035 	ld a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009553 1C               [ 1] 4036 3$:	clrw x 
      009554 95               [ 1] 4037 	ld xl,a 
      009555 83 FE            [ 1] 4038 	ld a,#TK_INTGR
      009557 F6               [ 4] 4039 	ret
                                   4040 
                                   4041 
                                   4042 ;--------------------
                                   4043 ; BASIC: POKE addr,byte
                                   4044 ; put a byte at addr 
                                   4045 ;--------------------
      0016B3                       4046 poke:
      009558 5C 90 F7         [ 4] 4047 	call arg_list 
      00955B 90 5C            [ 1] 4048 	cp a,#2
      00955D F6 26            [ 1] 4049 	jreq 1$
      00955F BD CC 94         [ 2] 4050 	jp syntax_error
      0016BD                       4051 1$:	
      009562 7D               [ 2] 4052 	popw x  
      009563 9F               [ 1] 4053     ld a,xl 
      009563 90               [ 2] 4054 	popw x 
      009564 7F               [ 1] 4055 	ld (x),a 
      009565 1E               [ 4] 4056 	ret 
                                   4057 
                                   4058 ;-----------------------
                                   4059 ; BASIC: PEEK(addr)
                                   4060 ; get the byte at addr 
                                   4061 ; input:
                                   4062 ;	none 
                                   4063 ; output:
                                   4064 ;	X 		value 
                                   4065 ;-----------------------
      0016C2                       4066 peek:
      009566 03 7B 01         [ 4] 4067 	call func_args
      009569 C7 00            [ 1] 4068 	cp a,#1 
      00956B 0B 7B            [ 1] 4069 	jreq 1$
      00956D 02 C7 00         [ 2] 4070 	jp syntax_error
      009570 25               [ 2] 4071 1$: popw x 
      009571 72               [ 1] 4072 	ld a,(x)
      009572 F2               [ 1] 4073 	clrw x 
      009573 03               [ 1] 4074 	ld xl,a 
      009574 90 9F            [ 1] 4075 	ld a,#TK_INTGR
      009576 5B               [ 4] 4076 	ret 
                                   4077 
                                   4078 ;---------------------------
                                   4079 ; BASIC IF expr : instructions
                                   4080 ; evaluate expr and if true 
                                   4081 ; execute instructions on same line. 
                                   4082 ;----------------------------
      0016D3                       4083 if: 
      009577 04 81 40         [ 4] 4084 	call relation 
      00957A 28 29            [ 1] 4085 	cp a,#TK_INTGR
      00957C 2C 23            [ 1] 4086 	jreq 1$ 
      00957E 2B 2D 2A         [ 2] 4087 	jp syntax_error
      009581 2F               [ 1] 4088 1$:	clr a 
      009582 25               [ 2] 4089 	tnzw x 
      009583 95 8F            [ 1] 4090 	jrne 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4091 ;skip to next line
      009585 95 91 95 93 95   [ 1] 4092 	mov in,count
      00958A 96               [ 4] 4093 9$:	ret 
                                   4094 
                                   4095 ;------------------------
                                   4096 ; BASIC: FOR var=expr 
                                   4097 ; set variable to expression 
                                   4098 ; leave variable address 
                                   4099 ; on stack and set
                                   4100 ; FLOOP bit in 'flags'
                                   4101 ;-----------------
                           000001  4102 	RETL1=1 ; return address  
                           000003  4103 	FSTEP=3  ; variable increment
                           000005  4104 	LIMIT=5 ; loop limit 
                           000007  4105 	CVAR=7   ; control variable 
                           000009  4106 	INW=9   ;  in.w saved
                           00000B  4107 	BPTR=11 ; baseptr saved
                           00000A  4108 	VSIZE=10  
      0016E7                       4109 for: ; { -- var_addr }
      00958B 95               [ 2] 4110 	popw x ; call return address 
      0016E8                       4111 	_vars VSIZE 
      00958C 98 95            [ 2]    1     sub sp,#VSIZE 
      00958E 9B               [ 2] 4112 	pushw x  ; RETL1 
      00958F 3E 00            [ 1] 4113 	ld a,#TK_VAR 
      009591 3D 00 3E         [ 4] 4114 	call expect
      009594 3D 00            [ 2] 4115 	ldw (CVAR,sp),x  ; control variable 
      009596 3C 00 3C         [ 4] 4116 	call let_var 
      009599 3D 00 3C 3E      [ 1] 4117 	bset flags,#FLOOP 
                                   4118 ; open space on stack for loop data 
      00959D 00               [ 1] 4119 	clrw x 
      00959E 1F 0B            [ 2] 4120 	ldw (BPTR,sp),x 
      00959E C7 00            [ 2] 4121 	ldw (INW,sp),x 
      0095A0 04 E6 02         [ 4] 4122 	call next_token 
      0095A3 C1 00            [ 1] 4123 	cp a,#TK_CMD 
      0095A5 04 2A            [ 1] 4124 	jreq 1$
      0095A7 03 C7 00         [ 2] 4125 	jp syntax_error
      001708                       4126 1$:  
      0095AA 04 CF 00         [ 2] 4127 	cpw x,#to 
      0095AD 05 90            [ 1] 4128 	jreq to
      0095AF AE 16 90         [ 2] 4129 	jp syntax_error 
                                   4130 
                                   4131 ;-----------------------------------
                                   4132 ; BASIC: TO expr 
                                   4133 ; second part of FOR loop initilization
                                   4134 ; leave limit on stack and set 
                                   4135 ; FTO bit in 'flags'
                                   4136 ;-----------------------------------
      001710                       4137 to: ; { var_addr -- var_addr limit step }
      0095B2 CD 94 36 CD A8   [ 2] 4138 	btjt flags,#FLOOP,1$
      0095B7 C0 A6 0D         [ 2] 4139 	jp syntax_error
      0095BA CD 83 40         [ 4] 4140 1$: call relation  
      0095BD 81 84            [ 1] 4141 	cp a,#TK_INTGR 
      0095BE 27 03            [ 1] 4142 	jreq 2$ 
      0095BE 52 01 7F         [ 2] 4143 	jp syntax_error
      0095C0 1F 05            [ 2] 4144 2$: ldw (LIMIT,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4145 ;	ldw x,in.w 
      0095C0 0F 01 71         [ 4] 4146 	call next_token
      0095C2 A1 00            [ 1] 4147 	cp a,#TK_NONE  
      0095C2 CD 89            [ 1] 4148 	jreq 4$ 
      0095C4 F1 A1            [ 1] 4149 	cp a,#TK_CMD
      0095C6 02 25            [ 1] 4150 	jrne 3$
      0095C8 4F A1 02         [ 2] 4151 	cpw x,#step 
      0095CB 27 12            [ 1] 4152 	jreq step
      001734                       4153 3$:	
      001734                       4154 	_unget_token   	 
      0095CD A1 03 27 13 A1   [ 1]    1      mov in,in.saved  
      001739                       4155 4$:	
      0095D2 82 27 15         [ 2] 4156 	ldw x,#1   ; default step  
      0095D5 A1 09            [ 2] 4157 	ldw (FSTEP,sp),x 
      0095D7 27 18            [ 2] 4158 	jra store_loop_addr 
                                   4159 
                                   4160 
                                   4161 ;----------------------------------
                                   4162 ; BASIC: STEP expr 
                                   4163 ; optional third par of FOR loop
                                   4164 ; initialization. 	
                                   4165 ;------------------------------------
      001740                       4166 step: ; {var limit -- var limit step}
      0095D9 A1 0A 27 18 20   [ 2] 4167 	btjt flags,#FLOOP,1$
      0095DE 28 08 7F         [ 2] 4168 	jp syntax_error
      0095DF CD 11 9D         [ 4] 4169 1$: call relation
      0095DF CD A8            [ 1] 4170 	cp a,#TK_INTGR
      0095E1 C0 20            [ 1] 4171 	jreq 2$
      0095E3 DC 08 7F         [ 2] 4172 	jp syntax_error
      0095E4 1F 03            [ 2] 4173 2$:	ldw (FSTEP,sp),x ; step
                                   4174 ; leave loop back entry point on cstack 
                                   4175 ; cstack is 1 call deep from interpreter
      001754                       4176 store_loop_addr:
      0095E4 9F CD 83         [ 2] 4177 	ldw x,basicptr  
      0095E7 40 20            [ 2] 4178 	ldw (BPTR,sp),x 
      0095E9 D6 00 00         [ 2] 4179 	ldw x,in.w 
      0095EA 1F 09            [ 2] 4180 	ldw (INW,sp),x   
      0095EA FD 9F CD 83      [ 1] 4181 	bres flags,#FLOOP 
      0095EE 40 20 CF 20      [ 1] 4182 	inc loop_depth  
      0095F1 81               [ 4] 4183 	ret 
                                   4184 
                                   4185 ;--------------------------------
                                   4186 ; BASIC: NEXT var 
                                   4187 ; FOR loop control 
                                   4188 ; increment variable with step 
                                   4189 ; and compare with limit 
                                   4190 ; loop if threshold not crossed.
                                   4191 ; else stack. 
                                   4192 ; and decrement 'loop_depth' 
                                   4193 ;--------------------------------
      001767                       4194 next: ; {var limit step retl1 -- [var limit step ] }
      0095F1 03 01 20 CD      [ 1] 4195 	tnz loop_depth 
      0095F5 26 03            [ 1] 4196 	jrne 1$ 
      0095F5 CD 89 F1         [ 2] 4197 	jp syntax_error 
      001770                       4198 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095F8 A1 84            [ 1] 4199 	ld a,#TK_VAR 
      0095FA 27 03 CC         [ 4] 4200 	call expect
                                   4201 ; check for good variable after NEXT 	 
      0095FD 88 FF            [ 2] 4202 	cpw x,(CVAR,sp)
      0095FF 27 03            [ 1] 4203 	jreq 2$  
      0095FF 9F A4 0F         [ 2] 4204 	jp syntax_error ; not the good one 
      00177C                       4205 2$: ; increment variable 
      009602 C7               [ 2] 4206 	ldw x,(x)  ; get var value 
      009603 00 25 20         [ 2] 4207 	addw x,(FSTEP,sp) ; var+step 
      009606 B9 07            [ 2] 4208 	ldw y,(CVAR,sp)
      009607 90 FF            [ 2] 4209 	ldw (y),x ; save var new value 
                                   4210 ; check sign of STEP  
      009607 55 00            [ 1] 4211 	ld a,#0x80
      009609 03 00            [ 1] 4212 	bcp a,(FSTEP,sp)
      00960B 02 CD            [ 1] 4213 	jrpl 4$
                                   4214 ;negative step 
      00960D 92 1D            [ 2] 4215 	cpw x,(LIMIT,sp)
      00960F A1 84            [ 1] 4216 	jrslt loop_done
      009611 26 05            [ 2] 4217 	jra loop_back 
      001790                       4218 4$: ; positive step
      009613 CD 8A            [ 2] 4219 	cpw x,(LIMIT,sp)
      009615 4D 20            [ 1] 4220 	jrsgt loop_done
      001794                       4221 loop_back:
      009617 A8 0B            [ 2] 4222 	ldw x,(BPTR,sp)
      009618 CF 00 04         [ 2] 4223 	ldw basicptr,x 
      009618 0D 01 26 05 A6   [ 2] 4224 	btjf flags,#FRUN,1$ 
      00961D 0D CD            [ 1] 4225 	ld a,(2,x)
      00961F 83 40 5B         [ 1] 4226 	ld count,a
      009622 01 81            [ 2] 4227 1$:	ldw x,(INW,sp)
      009624 CF 00 00         [ 2] 4228 	ldw in.w,x 
      009624 CE               [ 4] 4229 	ret 
      0017A9                       4230 loop_done:
                                   4231 	; remove loop data from stack  
      009625 00               [ 2] 4232 	popw x
      0017AA                       4233 	_drop VSIZE 
      009626 05 1F            [ 2]    1     addw sp,#VSIZE 
      009628 03 C6 00 02      [ 1] 4234 	dec loop_depth 
                                   4235 ;	pushw x 
                                   4236 ;	ret 
      00962C 6B               [ 2] 4237 	jp (x)
                                   4238 
                                   4239 ;----------------------------
                                   4240 ; called by goto/gosub
                                   4241 ; to get target line number 
                                   4242 ;---------------------------
      0017B1                       4243 get_target_line:
      00962D 05 C6 00         [ 4] 4244 	call relation 
      009630 04 6B            [ 1] 4245 	cp a,#TK_INTGR
      009632 06 81            [ 1] 4246 	jreq 1$
      009634 CC 08 7F         [ 2] 4247 	jp syntax_error
      009634 1E 03 CF         [ 4] 4248 1$:	call search_lineno  
      009637 00               [ 2] 4249 	tnzw x 
      009638 05 7B            [ 1] 4250 	jrne 2$ 
      00963A 05 C7            [ 1] 4251 	ld a,#ERR_NO_LINE 
      00963C 00 02 7B         [ 2] 4252 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00963F 06               [ 4] 4253 2$:	ret 
                                   4254 
                                   4255 ;------------------------
                                   4256 ; BASIC: GOTO line# 
                                   4257 ; jump to line# 
                                   4258 ; here cstack is 2 call deep from interpreter 
                                   4259 ;------------------------
      0017C7                       4260 goto:
      009640 C7 00 04 81 06   [ 2] 4261 	btjt flags,#FRUN,0$ 
      009644 A6 06            [ 1] 4262 	ld a,#ERR_RUN_ONLY
      009644 52 07 81         [ 2] 4263 	jp tb_error 
      009646 81               [ 4] 4264 	ret 
      009646 0F 05 CD         [ 4] 4265 0$:	call get_target_line
      0017D5                       4266 jp_to_target:
      009649 89 F1 A1         [ 2] 4267 	ldw basicptr,x 
      00964C 02 26            [ 1] 4268 	ld a,(2,x)
      00964E 08 CD A8         [ 1] 4269 	ld count,a 
      009651 C0 03 05 CD      [ 1] 4270 	mov in,#3 
      009655 89               [ 4] 4271 	ret 
                                   4272 
                                   4273 
                                   4274 ;--------------------
                                   4275 ; BASIC: GOSUB line#
                                   4276 ; basic subroutine call
                                   4277 ; actual line# and basicptr 
                                   4278 ; are saved on cstack
                                   4279 ; here cstack is 2 call deep from interpreter 
                                   4280 ;--------------------
                           000003  4281 	RET_ADDR=3
                           000005  4282 	RET_INW=5
                           000004  4283 	VSIZE=4  
      0017E2                       4284 gosub:
      009656 F1 A1 85 27 03   [ 2] 4285 	btjt flags,#FRUN,0$ 
      00965B CC 88            [ 1] 4286 	ld a,#ERR_RUN_ONLY
      00965D FF 1F 06         [ 2] 4287 	jp tb_error 
      009660 0D               [ 4] 4288 	ret 
      009661 05               [ 2] 4289 0$:	popw x 
      0017EE                       4290 	_vars VSIZE  
      009662 26 06            [ 2]    1     sub sp,#VSIZE 
      009664 CD               [ 2] 4291 	pushw x 
      009665 94 0D CD         [ 2] 4292 	ldw x,basicptr
      009668 83 40            [ 2] 4293 	ldw (RET_ADDR,sp),x 
      00966A CD 17 B1         [ 4] 4294 	call get_target_line  
      00966A A6               [ 2] 4295 	pushw x 
      00966B 3A CD 83         [ 2] 4296 	ldw x,in.w 
      00966E 40 CD            [ 2] 4297 	ldw (RET_INW+2,sp),x
      009670 96               [ 2] 4298 	popw x 
      009671 24 72            [ 2] 4299 	jra jp_to_target
                                   4300 
                                   4301 ;------------------------
                                   4302 ; BASIC: RETURN 
                                   4303 ; exit from a subroutine 
                                   4304 ; 
                                   4305 ;------------------------
      001802                       4306 return:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009673 5F 00 04 CD A9   [ 2] 4307 	btjt flags,#FRUN,0$ 
      009678 C5 AE            [ 1] 4308 	ld a,#ERR_RUN_ONLY
      00967A 16 90 3B         [ 2] 4309 	jp tb_error 
      00180C                       4310 0$:	
      00967D 00 04            [ 2] 4311 	ldw x,(RET_ADDR,sp) 
      00967F 4B 00 72         [ 2] 4312 	ldw basicptr,x
      009682 FB 01            [ 1] 4313 	ld a,(2,x)
      009684 5C 5B 02         [ 1] 4314 	ld count,a  
      009687 72 5F            [ 2] 4315 	ldw x,(RET_INW,sp)
      009689 00 02 CD         [ 2] 4316 	ldw in.w,x 
      00968C 8C               [ 2] 4317 	popw x 
      00181C                       4318 	_drop VSIZE 
      00968D 7C A1            [ 2]    1     addw sp,#VSIZE 
      00968F 84               [ 2] 4319 	pushw x
      009690 27               [ 4] 4320 	ret  
                                   4321 
                                   4322 
                                   4323 ;----------------------------------
                                   4324 ; BASIC: RUN
                                   4325 ; run BASIC program in RAM
                                   4326 ;----------------------------------- 
      001820                       4327 run: 
      009691 06 CD 96 34 CC   [ 2] 4328 	btjf flags,#FRUN,0$  
      009696 88               [ 1] 4329 	clr a 
      009697 FF               [ 4] 4330 	ret
      001827                       4331 0$: 
      009698 16 06 90 FF CD   [ 2] 4332 	btjf flags,#FBREAK,1$
      00182C                       4333 	_drop 2 
      00969D 96 34            [ 2]    1     addw sp,#2 
      00969F CD 89 F1         [ 4] 4334 	call rest_context
      001831                       4335 	_drop CTXT_SIZE 
      0096A2 A1 09            [ 2]    1     addw sp,#CTXT_SIZE 
      0096A4 27 A0 A1 01      [ 1] 4336 	bres flags,#FBREAK 
      0096A8 23 03 CC 88      [ 1] 4337 	bset flags,#FRUN 
      0096AC FF 09 25         [ 2] 4338 	jp interpreter 
      0096AD CE 00 1C         [ 2] 4339 1$:	ldw x,txtbgn
      0096AD 5B 07 81         [ 2] 4340 	cpw x,txtend 
      0096B0 2B 0C            [ 1] 4341 	jrmi run_it 
      0096B0 55 00 04         [ 2] 4342 	ldw x,#err_no_prog
      0096B3 00 02 81         [ 4] 4343 	call puts 
      0096B6 55 00 03 00 01   [ 1] 4344 	mov in,count
      0096B6 52               [ 4] 4345 	ret 
      001852                       4346 run_it:	 
      0096B7 04 0F 01         [ 4] 4347     call ubound 
      001855                       4348 	_drop 2 ; drop return address 
      0096BA CD 90            [ 2]    1     addw sp,#2 
                                   4349 ; clear data pointer 
      0096BC D2               [ 1] 4350 	clrw x 
      0096BD A1 02 24         [ 2] 4351 	ldw data_ptr,x 
      0096C0 03 CC 88 FF      [ 1] 4352 	clr data_ofs 
      0096C4 A1 03 25 04      [ 1] 4353 	clr data_len 
                                   4354 ; initialize BASIC pointer 
      0096C8 85 9F 6B         [ 2] 4355 	ldw x,txtbgn 
      0096CB 01 85 9F         [ 2] 4356 	ldw basicptr,x 
      0096CE 6B 02            [ 1] 4357 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096D0 85 F6 14         [ 1] 4358 	ld count,a
      0096D3 02 18 01 27      [ 1] 4359 	mov in,#3	
      0096D7 F9 5B 04 81      [ 1] 4360 	bset flags,#FRUN 
      0096DB CC 09 25         [ 2] 4361 	jp interpreter 
                                   4362 
                                   4363 
                                   4364 ;----------------------
                                   4365 ; BASIC: END
                                   4366 ; end running program
                                   4367 ;---------------------- 
      001879                       4368 cmd_end: 
                                   4369 ; clean stack 
      0096DB CD 90 D2         [ 2] 4370 	ldw x,#STACK_EMPTY
      0096DE A1               [ 1] 4371 	ldw sp,x 
      0096DF 02 27 03         [ 2] 4372 	jp warm_start
                                   4373 
                                   4374 ;-----------------
                                   4375 ; 1 Khz beep 
                                   4376 ;-----------------
      001880                       4377 beep_1khz:: 
      0096E2 CC 88 FF         [ 2] 4378 	ldw x,#100
      0096E5 90 AE 03 E8      [ 2] 4379 	ldw y,#1000
      0096E5 85 9F            [ 2] 4380 	jra beep
                                   4381 
                                   4382 ;-----------------------
                                   4383 ; BASIC: TONE expr1,expr2
                                   4384 ; used TIMER2 channel 1
                                   4385 ; to produce a tone 
                                   4386 ; arguments:
                                   4387 ;    expr1   frequency 
                                   4388 ;    expr2   duration msec.
                                   4389 ;---------------------------
      001889                       4390 tone:
      0096E7 85 FA F7         [ 4] 4391 	call arg_list 
      0096EA 81 02            [ 1] 4392 	cp a,#2 
      0096EB 27 03            [ 1] 4393 	jreq 1$
      0096EB CD 90 D2         [ 2] 4394 	jp syntax_error 
      001893                       4395 1$: 
      0096EE A1               [ 2] 4396 	popw x ; duration
      0096EF 02 27            [ 2] 4397 	popw y ; frequency 
      001896                       4398 beep:  
      0096F1 03               [ 2] 4399 	pushw x 
      0096F2 CC 88 FF         [ 2] 4400 	ldw x,#TIM2_CLK_FREQ
      0096F5 65               [ 2] 4401 	divw x,y 
                                   4402 ; round to nearest integer 
      0096F5 85 9F 43 85      [ 2] 4403 	cpw y,#TIM2_CLK_FREQ/2
      0096F9 F4 F7            [ 1] 4404 	jrmi 2$
      0096FB 81               [ 2] 4405 	incw x 
      0096FC                       4406 2$:	 
      0096FC CD               [ 1] 4407 	ld a,xh 
      0096FD 90 D2 A1         [ 1] 4408 	ld TIM2_ARRH,a 
      009700 02               [ 1] 4409 	ld a,xl 
      009701 27 03 CC         [ 1] 4410 	ld TIM2_ARRL,a 
                                   4411 ; 50% duty cycle 
      009704 88               [ 1] 4412 	ccf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009705 FF               [ 2] 4413 	rrcw x 
      009706 85               [ 1] 4414 	ld a,xh 
      009707 9F 85 F8         [ 1] 4415 	ld TIM2_CCR1H,a 
      00970A F7               [ 1] 4416 	ld a,xl
      00970B 81 53 10         [ 1] 4417 	ld TIM2_CCR1L,a
      00970C 72 10 53 08      [ 1] 4418 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00970C CD 90 CD A1      [ 1] 4419 	bset TIM2_CR1,#TIM2_CR1_CEN
      009710 02 27 03 CC      [ 1] 4420 	bset TIM2_EGR,#TIM2_EGR_UG
      009714 88               [ 2] 4421 	popw x 
      009715 FF 1E 46         [ 4] 4422 	call pause02
      009716 72 11 53 08      [ 1] 4423 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009716 85 9F A4 07      [ 1] 4424 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00971A 88               [ 4] 4425 	ret 
                                   4426 
                                   4427 ;-------------------------------
                                   4428 ; BASIC: ADCON 0|1 [,divisor]  
                                   4429 ; disable/enanble ADC 
                                   4430 ;-------------------------------
                           000003  4431 	ONOFF=3 
                           000001  4432 	DIVSOR=1
                           000004  4433 	VSIZE=4 
      0018CD                       4434 power_adc:
      00971B A6 01 0D         [ 4] 4435 	call arg_list 
      00971E 01 27            [ 1] 4436 	cp a,#2	
      009720 05 48            [ 1] 4437 	jreq 1$
      009722 0A 01            [ 1] 4438 	cp a,#1 
      009724 20 F7            [ 1] 4439 	jreq 0$ 
      009726 5B 01 85         [ 2] 4440 	jp syntax_error 
      009729 F4 27 02         [ 2] 4441 0$: ldw x,#0
      00972C A6               [ 2] 4442 	pushw x  ; divisor 
      00972D 01 5F            [ 2] 4443 1$: ldw x,(ONOFF,sp)
      00972F 97               [ 2] 4444 	tnzw x 
      009730 A6 84            [ 1] 4445 	jreq 2$ 
      009732 81 01            [ 2] 4446 	ldw x,(DIVSOR,sp) ; divisor 
      009733 9F               [ 1] 4447 	ld a,xl
      009733 CD 90            [ 1] 4448 	and a,#7
      009735 D2               [ 1] 4449 	swap a 
      009736 A1 02 27         [ 1] 4450 	ld ADC_CR1,a
      009739 03 CC 88 FF      [ 1] 4451 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00973D 72 10 54 01      [ 1] 4452 	bset ADC_CR1,#ADC_CR1_ADON 
      0018F5                       4453 	_usec_dly 7 
      00973D 85 9F 85         [ 2]    1     ldw x,#(16*7-2)/4
      009740 F7               [ 2]    2     decw x
      009741 81               [ 1]    3     nop 
      009742 26 FA            [ 1]    4     jrne .-4
      009742 CD 90            [ 2] 4454 	jra 3$
      009744 CD A1 01 27      [ 1] 4455 2$: bres ADC_CR1,#ADC_CR1_ADON
      009748 03 CC 88 FF      [ 1] 4456 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001906                       4457 3$:	_drop VSIZE 
      00974C 85 F6            [ 2]    1     addw sp,#VSIZE 
      00974E 5F               [ 4] 4458 	ret
                                   4459 
                                   4460 ;-----------------------------
                                   4461 ; BASIC: ADCREAD (channel)
                                   4462 ; read adc channel {0..5}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4463 ; output:
                                   4464 ;   A 		TK_INTGR 
                                   4465 ;   X 		value 
                                   4466 ;-----------------------------
      001909                       4467 analog_read:
      00974F 97 A6 84         [ 4] 4468 	call func_args 
      009752 81 01            [ 1] 4469 	cp a,#1 
      009753 27 03            [ 1] 4470 	jreq 1$
      009753 CD 92 1D         [ 2] 4471 	jp syntax_error
      009756 A1               [ 2] 4472 1$: popw x 
      009757 84 27 03         [ 2] 4473 	cpw x,#5 
      00975A CC 88            [ 2] 4474 	jrule 2$
      00975C FF 4F            [ 1] 4475 	ld a,#ERR_BAD_VALUE
      00975E 5D 26 05         [ 2] 4476 	jp tb_error 
      009761 55               [ 1] 4477 2$: ld a,xl
      009762 00 04 00         [ 1] 4478 	ld acc8,a 
      009765 02 81            [ 1] 4479 	ld a,#5
      009767 C0 00 0D         [ 1] 4480 	sub a,acc8 
      009767 85 52 0A         [ 1] 4481 	ld ADC_CSR,a
      00976A 89 A6 85 CD      [ 1] 4482 	bset ADC_CR2,#ADC_CR2_ALIGN
      00976E 90 C0 1F 07      [ 1] 4483 	bset ADC_CR1,#ADC_CR1_ADON
      009772 CD 92 FD 72 14   [ 2] 4484 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009777 00 24 5F         [ 2] 4485 	ldw x,ADC_DRH
      00977A 1F 0B            [ 1] 4486 	ld a,#TK_INTGR
      00977C 1F               [ 4] 4487 	ret 
                                   4488 
                                   4489 ;-----------------------
                                   4490 ; BASIC: DREAD(pin)
                                   4491 ; Arduino pins 
                                   4492 ; read state of a digital pin 
                                   4493 ; pin# {0..15}
                                   4494 ; output:
                                   4495 ;    A 		TK_INTGR
                                   4496 ;    X      0|1 
                                   4497 ;-------------------------
                           000001  4498 	PINNO=1
                           000001  4499 	VSIZE=1
      00193D                       4500 digital_read:
      00193D                       4501 	_vars VSIZE 
      00977D 09 CD            [ 2]    1     sub sp,#VSIZE 
      00977F 89 F1 A1         [ 4] 4502 	call func_args
      009782 80 27            [ 1] 4503 	cp a,#1
      009784 03 CC            [ 1] 4504 	jreq 1$
      009786 88 FF 7F         [ 2] 4505 	jp syntax_error
      009788 85               [ 2] 4506 1$: popw x 
      009788 A3 97 90         [ 2] 4507 	cpw x,#15 
      00978B 27 03            [ 2] 4508 	jrule 2$
      00978D CC 88            [ 1] 4509 	ld a,#ERR_BAD_VALUE
      00978F FF 08 81         [ 2] 4510 	jp tb_error 
      009790 CD 1F 84         [ 4] 4511 2$:	call select_pin 
      009790 72 04            [ 1] 4512 	ld (PINNO,sp),a
      009792 00 24            [ 1] 4513 	ld a,(GPIO_IDR,x)
      009794 03 CC            [ 1] 4514 	tnz (PINNO,sp)
      009796 88 FF            [ 1] 4515 	jreq 8$
      009798 CD               [ 1] 4516 3$: srl a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009799 92 1D            [ 1] 4517 	dec (PINNO,sp)
      00979B A1 84            [ 1] 4518 	jrne 3$ 
      00979D 27 03            [ 1] 4519 8$: and a,#1 
      00979F CC               [ 1] 4520 	clrw x 
      0097A0 88               [ 1] 4521 	ld xl,a 
      0097A1 FF 1F            [ 1] 4522 	ld a,#TK_INTGR
      00196A                       4523 	_drop VSIZE
      0097A3 05 CD            [ 2]    1     addw sp,#VSIZE 
      0097A5 89               [ 4] 4524 	ret
                                   4525 
                                   4526 ;-----------------------
                                   4527 ; BASIC: DWRITE pin,0|1
                                   4528 ; Arduino pins 
                                   4529 ; write to a digital pin 
                                   4530 ; pin# {0..15}
                                   4531 ; output:
                                   4532 ;    A 		TK_INTGR
                                   4533 ;    X      0|1 
                                   4534 ;-------------------------
                           000001  4535 	PINNO=1
                           000002  4536 	PINVAL=2
                           000002  4537 	VSIZE=2
      00196D                       4538 digital_write:
      00196D                       4539 	_vars VSIZE 
      0097A6 F1 A1            [ 2]    1     sub sp,#VSIZE 
      0097A8 00 27 0E         [ 4] 4540 	call arg_list  
      0097AB A1 80            [ 1] 4541 	cp a,#2 
      0097AD 26 05            [ 1] 4542 	jreq 1$
      0097AF A3 97 C0         [ 2] 4543 	jp syntax_error
      0097B2 27               [ 2] 4544 1$: popw x 
      0097B3 0C               [ 1] 4545 	ld a,xl 
      0097B4 6B 02            [ 1] 4546 	ld (PINVAL,sp),a
      0097B4 55               [ 2] 4547 	popw x 
      0097B5 00 03 00         [ 2] 4548 	cpw x,#15 
      0097B8 02 05            [ 2] 4549 	jrule 2$
      0097B9 A6 0A            [ 1] 4550 	ld a,#ERR_BAD_VALUE
      0097B9 AE 00 01         [ 2] 4551 	jp tb_error 
      0097BC 1F 03 20         [ 4] 4552 2$:	call select_pin 
      0097BF 14 01            [ 1] 4553 	ld (PINNO,sp),a 
      0097C0 A6 01            [ 1] 4554 	ld a,#1
      0097C0 72 04            [ 1] 4555 	tnz (PINNO,sp)
      0097C2 00 24            [ 1] 4556 	jreq 4$
      0097C4 03               [ 1] 4557 3$: sll a
      0097C5 CC 88            [ 1] 4558 	dec (PINNO,sp)
      0097C7 FF CD            [ 1] 4559 	jrne 3$
      0097C9 92 1D            [ 1] 4560 4$: tnz (PINVAL,sp)
      0097CB A1 84            [ 1] 4561 	jrne 5$
      0097CD 27               [ 1] 4562 	cpl a 
      0097CE 03 CC            [ 1] 4563 	and a,(GPIO_ODR,x)
      0097D0 88 FF            [ 2] 4564 	jra 8$
      0097D2 1F 03            [ 1] 4565 5$: or a,(GPIO_ODR,x)
      0097D4 E7 00            [ 1] 4566 8$: ld (GPIO_ODR,x),a 
      0019A5                       4567 	_drop VSIZE 
      0097D4 CE 00            [ 2]    1     addw sp,#VSIZE 
      0097D6 05               [ 4] 4568 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4569 
                                   4570 
                                   4571 ;-----------------------
                                   4572 ; BASIC: STOP
                                   4573 ; stop progam execution  
                                   4574 ; without resetting pointers 
                                   4575 ; the program is resumed
                                   4576 ; with RUN 
                                   4577 ;-------------------------
      0019A8                       4578 stop:
      0097D7 1F 0B CE 00 01   [ 2] 4579 	btjt flags,#FRUN,2$
      0097DC 1F               [ 1] 4580 	clr a
      0097DD 09               [ 4] 4581 	ret 
      0019AF                       4582 2$:	 
                                   4583 ; create space on cstack to save context 
      0097DE 72 15 00         [ 2] 4584 	ldw x,#break_point 
      0097E1 24 72 5C         [ 4] 4585 	call puts 
      0019B5                       4586 	_drop 2 ;drop return address 
      0097E4 00 21            [ 2]    1     addw sp,#2 
      0019B7                       4587 	_vars CTXT_SIZE ; context size 
      0097E6 81 04            [ 2]    1     sub sp,#CTXT_SIZE 
      0097E7 CD 15 A4         [ 4] 4588 	call save_context 
      0097E7 72 5D 00         [ 2] 4589 	ldw x,#tib 
      0097EA 21 26 03         [ 2] 4590 	ldw basicptr,x
      0097ED CC               [ 1] 4591 	clr (x)
      0097EE 88 FF 00 03      [ 1] 4592 	clr count  
      0097F0 5F               [ 1] 4593 	clrw x 
      0097F0 A6 85 CD         [ 2] 4594 	ldw in.w,x
      0097F3 90 C0 13 07      [ 1] 4595 	bres flags,#FRUN 
      0097F7 27 03 CC 88      [ 1] 4596 	bset flags,#FBREAK
      0097FB FF 09 25         [ 2] 4597 	jp interpreter 
      0097FC 0A 62 72 65 61 6B 20  4598 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4599 
                                   4600 ;-----------------------
                                   4601 ; BASIC: NEW
                                   4602 ; from command line only 
                                   4603 ; free program memory
                                   4604 ; and clear variables 
                                   4605 ;------------------------
      0019F4                       4606 new: 
      0097FC FE 72 FB 03 16   [ 2] 4607 	btjf flags,#FRUN,0$ 
      009801 07               [ 4] 4608 	ret 
      0019FA                       4609 0$:	
      009802 90 FF A6         [ 4] 4610 	call clear_basic 
      009805 80               [ 4] 4611 	ret 
                                   4612 	 
                                   4613 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4614 ;  file system routines
                                   4615 ;  MCU flash memory from
                                   4616 ;  0x10000-0x27fff is 
                                   4617 ;  used to store BASIC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4618 ;  program files. 
                                   4619 ;  use 128 bytes sectors
                                   4620 ;  because this is the MCU 
                                   4621 ;  row size.
                                   4622 ;  file entry aligned to row
                                   4623 ;  	name  variable length
                                   4624 ;  	size  2 bytes  
                                   4625 ; 	data  variable length 
                                   4626 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4627 
                                   4628 ;---------------------------
                                   4629 ; fill pad with zeros 
                                   4630 ;--------------------------
      0019FE                       4631 zero_pad:
      009806 15 03 2A         [ 2] 4632 	ldw x,#pad 
      009809 06 13            [ 1] 4633 	ld a,#PAD_SIZE 
      00980B 05               [ 1] 4634 1$:	clr (x)
      00980C 2F               [ 2] 4635 	incw x 
      00980D 1B               [ 1] 4636 	dec a 
      00980E 20 04            [ 1] 4637 	jrne 1$
      009810 81               [ 4] 4638 	ret 
                                   4639 
                                   4640 ;--------------------------
                                   4641 ; align farptr to BLOCK_SIZE 
                                   4642 ;---------------------------
      001A09                       4643 row_align:
      009810 13 05            [ 1] 4644 	ld a,#0x7f 
      009812 2C 15 18         [ 1] 4645 	and a,farptr+2 
      009814 27 13            [ 1] 4646 	jreq 1$ 
      009814 1E 0B CF         [ 2] 4647 	ldw x,farptr+1 
      009817 00 05 72         [ 2] 4648 	addw x,#BLOCK_SIZE 
      00981A 01 00            [ 1] 4649 	jrnc 0$
      00981C 24 05 E6 02      [ 1] 4650 	inc farptr 
      009820 C7               [ 1] 4651 0$: ld a,xl 
      009821 00 04            [ 1] 4652 	and a,#0x80
      009823 1E               [ 1] 4653 	ld xl,a
      009824 09 CF 00         [ 2] 4654 	ldw farptr+1,x  	
      009827 01               [ 4] 4655 1$:	ret
                                   4656 
                                   4657 ;--------------------
                                   4658 ; input:
                                   4659 ;   X     increment 
                                   4660 ; output:
                                   4661 ;   farptr  incremented 
                                   4662 ;---------------------
      001A24                       4663 incr_farptr:
      009828 81 BB 00 17      [ 2] 4664 	addw x,farptr+1 
      009829 24 04            [ 1] 4665 	jrnc 1$
      009829 85 5B 0A 72      [ 1] 4666 	inc farptr 
      00982D 5A 00 21         [ 2] 4667 1$:	ldw farptr+1,x  
      009830 FC               [ 4] 4668 	ret 
                                   4669 
                                   4670 ;------------------------------
                                   4671 ; extended flash memory used as FLASH_DRIVE 
                                   4672 ; seek end of used flash drive   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4673 ; starting at 0x10000 address.
                                   4674 ; 4 consecutives 0 bytes signal free space. 
                                   4675 ; input:
                                   4676 ;	none
                                   4677 ; output:
                                   4678 ;   ffree     free_addr| 0 if memory full.
                                   4679 ;------------------------------
      009831                       4680 seek_fdrive:
                                   4681 ; start scan at 0x10000 address 
      009831 CD 92            [ 1] 4682 	ld a,#1
      009833 1D A1 84         [ 1] 4683 	ld farptr,a 
      009836 27               [ 1] 4684 	clrw x 
      009837 03 CC 88         [ 2] 4685 	ldw farptr+1,x 
      001A3B                       4686 1$:
      00983A FF CD 84         [ 2] 4687 	ldw x,#3  
      00983D 82 5D 26 05      [ 5] 4688 2$:	ldf a,([farptr],x) 
      009841 A6 05            [ 1] 4689 	jrne 3$
      009843 CC               [ 2] 4690 	decw x
      009844 89 01            [ 1] 4691 	jrpl 2$
      009846 81 0E            [ 2] 4692 	jra 4$ 
      009847 AE 00 80         [ 2] 4693 3$:	ldw x,#BLOCK_SIZE 
      009847 72 00 00         [ 4] 4694 	call incr_farptr
      00984A 24 06 A6         [ 2] 4695 	ldw x,#0x280  
      00984D 06 CC 89         [ 2] 4696 	cpw x,farptr
      009850 01 81            [ 1] 4697 	jrmi 1$
      001A57                       4698 4$: ; copy farptr to ffree	 
      009852 CD 98 31         [ 2] 4699 	ldw x,farptr 
      009855 C6 00 18         [ 1] 4700 	ld a,farptr+2 
      009855 CF 00 05         [ 2] 4701 	ldw ffree,x 
      009858 E6 02 C7         [ 1] 4702 	ld ffree+2,a  
      00985B 00               [ 4] 4703 	ret 
                                   4704 
                                   4705 ;-----------------------
                                   4706 ; return amount of free 
                                   4707 ; space on flash drive
                                   4708 ; input:
                                   4709 ;   none
                                   4710 ; output:
                                   4711 ;   acc24   free space 
                                   4712 ;-----------------------
      001A64                       4713 disk_free:
      00985C 04 35 03         [ 2] 4714 	ldw x,#0x8000
      00985F 00 02 81 1A      [ 2] 4715 	subw x,ffree+1
      009862 A6 02            [ 1] 4716 	ld a,#2
      009862 72 00 00         [ 1] 4717 	sbc a,ffree 
      009865 24 06 A6         [ 1] 4718 	ld acc24,a 
      009868 06 CC 89         [ 2] 4719 	ldw acc16,x 
      00986B 01               [ 4] 4720 	ret 
                                   4721 
                                   4722 ;-----------------------
                                   4723 ; compare file name 
                                   4724 ; with name pointed by Y  
                                   4725 ; input:
                                   4726 ;   farptr   file name 
                                   4727 ;   Y        target name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4728 ; output:
                                   4729 ;   farptr 	 at file_name
                                   4730 ;   X 		 farptr[x] point at size field  
                                   4731 ;   Carry    0|1 no match|match  
                                   4732 ;----------------------
      001A77                       4733 cmp_name:
      00986C 81               [ 1] 4734 	clrw x
      00986D 85 52 04 89      [ 5] 4735 1$:	ldf a,([farptr],x)
      009871 CE 00            [ 1] 4736 	cp a,(y)
      009873 05 1F            [ 1] 4737 	jrne 4$
      009875 03               [ 1] 4738 	tnz a 
      009876 CD 98            [ 1] 4739 	jreq 9$ 
      009878 31               [ 2] 4740     incw x 
      009879 89 CE            [ 2] 4741 	incw y 
      00987B 00 01            [ 2] 4742 	jra 1$
      001A88                       4743 4$: ;no match 
      00987D 1F               [ 1] 4744 	tnz a 
      00987E 07 85            [ 1] 4745 	jreq 5$
      009880 20               [ 2] 4746 	incw x 
      009881 D3 AF 00 16      [ 5] 4747 	ldf a,([farptr],x)
      009882 20 F6            [ 2] 4748 	jra 4$  
      009882 72               [ 2] 4749 5$:	incw x ; farptr[x] point at 'size' field 
      009883 00               [ 1] 4750 	rcf 
      009884 00               [ 4] 4751 	ret
      001A95                       4752 9$: ; match  
      009885 24               [ 2] 4753 	incw x  ; farptr[x] at 'size' field 
      009886 05               [ 1] 4754 	scf 
      009887 A6               [ 4] 4755 	ret 
                                   4756 
                                   4757 ;-----------------------
                                   4758 ; search file in 
                                   4759 ; flash memory 
                                   4760 ; input:
                                   4761 ;   Y       file name  
                                   4762 ; output:
                                   4763 ;   farptr  addr at name|0
                                   4764 ;   X       offset to size field
                                   4765 ;-----------------------
                           000001  4766 	FSIZE=1
                           000003  4767 	YSAVE=3
                           000004  4768 	VSIZE=4 
      001A98                       4769 search_file: 
      001A98                       4770 	_vars VSIZE
      009888 06 CC            [ 2]    1     sub sp,#VSIZE 
      00988A 89 01            [ 2] 4771 	ldw (YSAVE,sp),y  
      00988C 5F               [ 1] 4772 	clrw x 
      00988C 1E 03 CF         [ 2] 4773 	ldw farptr+1,x 
      00988F 00 05 E6 02      [ 1] 4774 	mov farptr,#1
      001AA4                       4775 1$:	
                                   4776 ; check if farptr is after any file 
                                   4777 ; if  0 then so.
      009893 C7 00 04 1E      [ 5] 4778 	ldf a,[farptr]
      009897 05 CF            [ 1] 4779 	jreq 6$
      009899 00               [ 1] 4780 2$: clrw x 	
      00989A 01 85            [ 2] 4781 	ldw y,(YSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00989C 5B 04 89         [ 4] 4782 	call cmp_name
      00989F 81 2F            [ 1] 4783 	jrc 9$
      0098A0 92 AF 00 16      [ 5] 4784 	ldf a,([farptr],x)
      0098A0 72 01            [ 1] 4785 	ld (FSIZE,sp),a 
      0098A2 00               [ 2] 4786 	incw x 
      0098A3 24 02 4F 81      [ 5] 4787 	ldf a,([farptr],x)
      0098A7 6B 02            [ 1] 4788 	ld (FSIZE+1,sp),a 
      0098A7 72               [ 2] 4789 	incw x 
      0098A8 09 00 24         [ 2] 4790 	addw x,(FSIZE,sp) ; skip over file data
      0098AB 12 5B 02         [ 4] 4791 	call incr_farptr
      0098AE CD 96 34         [ 4] 4792 	call row_align  
      0098B1 5B 04 72         [ 2] 4793 	ldw x,#0x280
      0098B4 19 00 24         [ 2] 4794 	cpw x,farptr 
      0098B7 72 10            [ 1] 4795 	jrpl 1$
      001AD1                       4796 6$: ; file not found 
      0098B9 00 24 CC 89      [ 1] 4797 	clr farptr
      0098BD A5 CE 00 1D      [ 1] 4798 	clr farptr+1 
      0098C1 C3 00 1F 2B      [ 1] 4799 	clr farptr+2 
      001ADD                       4800 	_drop VSIZE 
      0098C5 0C AE            [ 2]    1     addw sp,#VSIZE 
      0098C7 88               [ 1] 4801 	rcf
      0098C8 98               [ 4] 4802 	ret
      001AE1                       4803 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AE1                       4804 	_drop VSIZE 
      0098C9 CD A8            [ 2]    1     addw sp,#VSIZE 
      0098CB C0               [ 1] 4805 	scf 	
      0098CC 55               [ 4] 4806 	ret
                                   4807 
                                   4808 ;--------------------------------
                                   4809 ; BASIC: SAVE "name" 
                                   4810 ; save text program in 
                                   4811 ; flash memory used as permanent
                                   4812 ; storage from address 0x10000-0x27fff 
                                   4813 ;--------------------------------
                           000001  4814 	BSIZE=1
                           000003  4815 	NAMEPTR=3
                           000005  4816 	XSAVE=5
                           000007  4817 	YSAVE=7
                           000008  4818 	VSIZE=8 
      001AE5                       4819 save:
      0098CD 00 04 00 02 81   [ 2] 4820 	btjf flags,#FRUN,0$ 
      0098D2 A6 07            [ 1] 4821 	ld a,#ERR_CMD_ONLY 
      0098D2 CD 92 CA         [ 2] 4822 	jp tb_error
      001AEF                       4823 0$:	 
      0098D5 5B 02 5F         [ 2] 4824 	ldw x,txtend 
      0098D8 CF 00 07 72      [ 2] 4825 	subw x,txtbgn
      0098DC 5F 00            [ 1] 4826 	jrne 1$
                                   4827 ; nothing to save 
      0098DE 09 72 5F         [ 2] 4828 	ldw x,#err_no_prog 
      0098E1 00 0A CE         [ 4] 4829 	call puts 
      0098E4 00 1D CF 00 05   [ 1] 4830 	mov in,count 
      0098E9 E6               [ 4] 4831 	ret  	
      001B04                       4832 1$:	
      001B04                       4833 	_vars VSIZE 
      0098EA 02 C7            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098EC 00 04            [ 2] 4834 	ldw (BSIZE,sp),x 
      0098EE 35 03 00         [ 4] 4835 	call next_token	
      0098F1 02 72            [ 1] 4836 	cp a,#TK_QSTR
      0098F3 10 00            [ 1] 4837 	jreq 2$
      0098F5 24 CC 89         [ 2] 4838 	jp syntax_error
      001B12                       4839 2$: 
      0098F8 A5 03            [ 2] 4840 	ldw (NAMEPTR,sp),x  
      0098F9 CD 01 74         [ 4] 4841 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4842 ; check if enough free space 
      0098F9 AE 17 FF         [ 4] 4843 	call strlen 
      0098FC 94 CC            [ 1] 4844 	add a,#3
      0098FE 89               [ 1] 4845 	clrw x 
      0098FF 86               [ 1] 4846 	ld xl,a 
      009900 72 FB 01         [ 2] 4847 	addw x,(BSIZE,sp)
      009900 AE               [ 1] 4848 	clr a 
      009901 00 64 90 AE      [ 2] 4849 	addw x,ffree+1 
      009905 03 E8 20         [ 1] 4850 	adc a,ffree 
      009908 0D 02            [ 1] 4851 	cp a,#2
      009909 2B 0A            [ 1] 4852 	jrmi 21$
      009909 CD 90 D2         [ 2] 4853 	cpw x,#0x8000
      00990C A1 02            [ 1] 4854 	jrmi 21$
      00990E 27 03            [ 1] 4855 	ld a,#ERR_NO_FSPACE  
      009910 CC 88 FF         [ 2] 4856 	jp tb_error
      009913                       4857 21$: 
                                   4858 ; check for existing file of that name 
      009913 85 90            [ 2] 4859 	ldw y,(NAMEPTR,sp)	
      009915 85 1A 98         [ 4] 4860 	call search_file 
      009916 24 05            [ 1] 4861 	jrnc 3$ 
      009916 89 AE            [ 1] 4862 	ld a,#ERR_DUPLICATE 
      009918 F4 24 65         [ 2] 4863 	jp tb_error 
      001B43                       4864 3$:	; initialize farptr 
      00991B 90 A3 7A         [ 2] 4865 	ldw x,ffree 
      00991E 12 2B 01         [ 1] 4866 	ld a,ffree+2 
      009921 5C 00 16         [ 2] 4867 	ldw farptr,x 
      009922 C7 00 18         [ 1] 4868 	ld farptr+2,a 
                                   4869 ;** write file name to row buffer **	
      009922 9E C7            [ 2] 4870 	ldw y,(NAMEPTR,sp)  
      009924 53 0D 9F         [ 2] 4871 	ldw x,#pad 
      009927 C7 53 0E         [ 4] 4872 	call strcpy
      00992A 8C 56 9E         [ 4] 4873 	call strlen 
      00992D C7               [ 1] 4874 	clrw x 
      00992E 53               [ 1] 4875 	ld xl,a 
      00992F 0F               [ 2] 4876 	incw  x
      009930 9F C7 53         [ 2] 4877 	addw x,#pad 
                                   4878 ; ** write file size to row buffer 
      009933 10 72            [ 2] 4879 	ldw y,(BSIZE,sp)
      009935 10               [ 2] 4880 	ldw (x),y 
      009936 53 08 72         [ 2] 4881 	addw x,#2 
                                   4882 ; ** write file data to row buffer 
      009939 10 53 00 72      [ 2] 4883 	ldw y,txtbgn 
      00993D 10 53            [ 1] 4884 6$:	ld a,(y)
      00993F 04 85            [ 2] 4885 	incw y
      009941 CD               [ 1] 4886 	ld (x),a 
      009942 9E               [ 2] 4887 	incw x
      009943 C6 72 11 53      [ 2] 4888 	cpw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009947 08 72            [ 1] 4889 	jreq 12$
      009949 11 53 00         [ 2] 4890 	cpw x,#stack_full 
      00994C 81 EF            [ 1] 4891 	jrmi 6$
      00994D                       4892 12$:
      00994D CD 90            [ 2] 4893 	ldw (YSAVE,sp),y 
      001B7D                       4894 14$: ; zero buffer end 
      00994F D2 A1 02         [ 2] 4895 	cpw x,#stack_full
      009952 27 0B            [ 1] 4896 	jreq 16$
      009954 A1               [ 1] 4897 	clr (x)
      009955 01               [ 2] 4898 	incw x 
      009956 27 03            [ 2] 4899 	jra 14$
      001B86                       4900 16$:
      009958 CC 88 FF         [ 2] 4901 	ldw x,#pad 
      00995B AE 00 00         [ 4] 4902 	call write_row 
      00995E 89 1E 03         [ 2] 4903 	ldw x,#BLOCK_SIZE 
      009961 5D 27 1A         [ 4] 4904 	call incr_farptr
      009964 1E 01 9F         [ 2] 4905 	ldw x,#pad 
      009967 A4 07            [ 2] 4906 	ldw y,(YSAVE,sp)
      009969 4E C7 54 01      [ 2] 4907 	cpw y,txtend 
      00996D 72 16            [ 1] 4908 	jrmi 6$
                                   4909 ; save farptr in ffree
      00996F 50 CA 72         [ 2] 4910 	ldw x,farptr 
      009972 10 54 01         [ 1] 4911 	ld a,farptr+2 
      009975 AE 00 1B         [ 2] 4912 	ldw ffree,x 
      009978 5A 9D 26         [ 1] 4913 	ld ffree+2,a
                                   4914 ; print file size 	
      00997B FA 20            [ 2] 4915 	ldw x,(BSIZE,sp) 
      00997D 08 72 11         [ 4] 4916 	call print_int 
      001BAE                       4917 	_drop VSIZE 
      009980 54 01            [ 2]    1     addw sp,#VSIZE 
      009982 72               [ 4] 4918 	ret 
                                   4919 
                                   4920 ;----------------------
                                   4921 ; load file in RAM memory
                                   4922 ; input:
                                   4923 ;    farptr point at file size 
                                   4924 ; output:
                                   4925 ;   y point after BASIC program in RAM.
                                   4926 ;------------------------
      001BB1                       4927 load_file:
      009983 17 50 CA         [ 4] 4928 	call incr_farptr  
      009986 5B 04 81         [ 4] 4929 	call clear_basic  
      009989 5F               [ 1] 4930 	clrw x
      009989 CD 90 CD A1      [ 5] 4931 	ldf a,([farptr],x)
      00998D 01 27            [ 1] 4932 	ld yh,a 
      00998F 03               [ 2] 4933 	incw x  
      009990 CC 88 FF 85      [ 5] 4934 	ldf a,([farptr],x)
      009994 A3               [ 2] 4935 	incw x 
      009995 00 05            [ 1] 4936 	ld yl,a 
      009997 23 05 A6 0A      [ 2] 4937 	addw y,txtbgn
      00999B CC 89 01 9F      [ 2] 4938 	ldw txtend,y
      00999F C7 00 0E A6      [ 2] 4939 	ldw y,txtbgn
      001BD2                       4940 3$:	; load BASIC text 	
      0099A3 05 C0 00 0E      [ 5] 4941 	ldf a,([farptr],x)
      0099A7 C7 54            [ 1] 4942 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099A9 00               [ 2] 4943 	incw x 
      0099AA 72 16            [ 2] 4944 	incw y 
      0099AC 54 02 72 10      [ 2] 4945 	cpw y,txtend 
      0099B0 54 01            [ 1] 4946 	jrmi 3$
      0099B2 72               [ 4] 4947 	ret 
                                   4948 
                                   4949 ;------------------------
                                   4950 ; BASIC: LOAD "file" 
                                   4951 ; load file to RAM 
                                   4952 ; for execution 
                                   4953 ;------------------------
      001BE2                       4954 load:
      0099B3 0F 54 00 FB CE   [ 2] 4955 	btjf flags,#FRUN,0$ 
      0099B8 54 04            [ 1] 4956 	jreq 0$ 
      0099BA A6 84            [ 1] 4957 	ld a,#ERR_CMD_ONLY 
      0099BC 81 08 81         [ 2] 4958 	jp tb_error 
      0099BD                       4959 0$:	
      0099BD 52 01 CD         [ 4] 4960 	call next_token 
      0099C0 90 CD            [ 1] 4961 	cp a,#TK_QSTR
      0099C2 A1 01            [ 1] 4962 	jreq 1$
      0099C4 27 03 CC         [ 2] 4963 	jp syntax_error 
      0099C7 88 FF            [ 1] 4964 1$:	ldw y,x 
      0099C9 85 A3 00         [ 4] 4965 	call search_file 
      0099CC 0F 23            [ 1] 4966 	jrc 2$ 
      0099CE 05 A6            [ 1] 4967 	ld a,#ERR_NOT_FILE
      0099D0 0A CC 89         [ 2] 4968 	jp tb_error  
      001C04                       4969 2$:
      0099D3 01 CD A0         [ 4] 4970 	call load_file
                                   4971 ; print loaded size 	 
      0099D6 04 6B 01         [ 2] 4972 	ldw x,txtend 
      0099D9 E6 01 0D 01      [ 2] 4973 	subw x,txtbgn
      0099DD 27 05 44         [ 4] 4974 	call print_int 
      0099E0 0A               [ 4] 4975 	ret 
                                   4976 
                                   4977 ;-----------------------------------
                                   4978 ; BASIC: FORGET ["file_name"] 
                                   4979 ; erase file_name and all others 
                                   4980 ; after it. 
                                   4981 ; without argument erase all files 
                                   4982 ;-----------------------------------
                           000001  4983 	NEW_FREE=1 
                           000003  4984 	VSIZE=3 
      001C12                       4985 forget:
      001C12                       4986 	_vars VSIZE 
      0099E1 01 26            [ 2]    1     sub sp,#VSIZE 
      0099E3 FB A4 01         [ 4] 4987 	call next_token 
      0099E6 5F 97            [ 1] 4988 	cp a,#TK_NONE 
      0099E8 A6 84            [ 1] 4989 	jreq 3$ 
      0099EA 5B 01            [ 1] 4990 	cp a,#TK_QSTR
      0099EC 81 03            [ 1] 4991 	jreq 1$
      0099ED CC 08 7F         [ 2] 4992 	jp syntax_error
      0099ED 52 02            [ 1] 4993 1$: ldw y,x 
      0099EF CD 90 D2 A1 02   [ 1] 4994 	mov in,count 
      0099F4 27 03 CC         [ 4] 4995 	call search_file
      0099F7 88 FF            [ 1] 4996 	jrc 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099F9 85 9F            [ 1] 4997 	ld a,#ERR_NOT_FILE 
      0099FB 6B 02 85         [ 2] 4998 	jp tb_error 
      001C33                       4999 2$: 
      0099FE A3 00 0F         [ 2] 5000 	ldw x,farptr
      009A01 23 05 A6         [ 1] 5001 	ld a,farptr+2
      009A04 0A CC            [ 2] 5002 	jra 4$ 
      001C3B                       5003 3$: ; forget all files 
      009A06 89 01 CD         [ 2] 5004 	ldw x,#0x100
      009A09 A0               [ 1] 5005 	clr a 
      009A0A 04 6B 01         [ 2] 5006 	ldw farptr,x 
      009A0D A6 01 0D         [ 1] 5007 	ld farptr+2,a 
      001C45                       5008 4$:	; save new free address 
      009A10 01 27            [ 2] 5009 	ldw (NEW_FREE,sp),x
      009A12 05 48            [ 1] 5010 	ld (NEW_FREE+2,sp),a 
      009A14 0A 01 26         [ 4] 5011 	call move_erase_to_ram
      009A17 FB 0D 02         [ 4] 5012 5$: call block_erase 
      009A1A 26 05 43         [ 2] 5013 	ldw x,#BLOCK_SIZE 
      009A1D E4 00 20         [ 4] 5014 	call incr_farptr 
      009A20 02 EA 00         [ 4] 5015 	call row_align 
                                   5016 ; check if all blocks erased
      009A23 E7 00 5B         [ 1] 5017 	ld a,farptr+2  
      009A26 02 81 1B         [ 1] 5018 	sub a,ffree+2
      009A28 C6 00 17         [ 1] 5019 	ld a,farptr+1 
      009A28 72 00 00         [ 1] 5020 	sbc a,ffree+1 
      009A2B 24 02 4F         [ 1] 5021 	ld a,farptr 
      009A2E 81 00 19         [ 1] 5022 	sbc a,ffree 
      009A2F 2B E0            [ 1] 5023 	jrmi 5$ 
      009A2F AE 9A            [ 1] 5024 	ld a,(NEW_FREE+2,sp)
      009A31 56 CD            [ 2] 5025 	ldw x,(NEW_FREE,sp)
      009A33 A8 C0 5B         [ 1] 5026 	ld ffree+2,a 
      009A36 02 52 04         [ 2] 5027 	ldw ffree,x 
      001C76                       5028 	_drop VSIZE 
      009A39 CD 96            [ 2]    1     addw sp,#VSIZE 
      009A3B 24               [ 4] 5029 	ret 
                                   5030 
                                   5031 ;----------------------
                                   5032 ; BASIC: DIR 
                                   5033 ; list saved files 
                                   5034 ;----------------------
                           000001  5035 	COUNT=1 ; files counter 
                           000002  5036 	VSIZE=2 
      001C79                       5037 directory:
      001C79                       5038 	_vars VSIZE 
      009A3C AE 16            [ 2]    1     sub sp,#VSIZE 
      009A3E 90               [ 1] 5039 	clrw x 
      009A3F CF 00            [ 2] 5040 	ldw (COUNT,sp),x 
      009A41 05 7F 72         [ 2] 5041 	ldw farptr+1,x 
      009A44 5F 00 04 5F      [ 1] 5042 	mov farptr,#1 
      001C85                       5043 dir_loop:
      009A48 CF               [ 1] 5044 	clrw x 
      009A49 00 01 72 11      [ 5] 5045 	ldf a,([farptr],x)
      009A4D 00 24            [ 1] 5046 	jreq 8$ 
      001C8C                       5047 1$: ;name loop 	
      009A4F 72 18 00 24      [ 5] 5048 	ldf a,([farptr],x)
      009A53 CC 89            [ 1] 5049 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A55 A5 0A 62         [ 4] 5050 	call putc 
      009A58 72               [ 2] 5051 	incw x 
      009A59 65 61            [ 2] 5052 	jra 1$
      009A5B 6B               [ 2] 5053 2$: incw x ; skip ending 0. 
      009A5C 20 70            [ 1] 5054 	ld a,#SPACE 
      009A5E 6F 69 6E         [ 4] 5055 	call putc 
                                   5056 ; get file size 	
      009A61 74 2C 20 52      [ 5] 5057 	ldf a,([farptr],x)
      009A65 55 4E            [ 1] 5058 	ld yh,a 
      009A67 20               [ 2] 5059 	incw x 
      009A68 74 6F 20 72      [ 5] 5060 	ldf a,([farptr],x)
      009A6C 65               [ 2] 5061 	incw x 
      009A6D 73 75            [ 1] 5062 	ld yl,a 
      009A6F 6D 65            [ 2] 5063 	pushw y 
      009A71 2E 0A 00         [ 2] 5064 	addw x,(1,sp)
                                   5065 ; skip to next file 
      009A74 CD 1A 24         [ 4] 5066 	call incr_farptr
      009A74 72 01 00         [ 4] 5067 	call row_align
                                   5068 ; print file size 
      009A77 24               [ 2] 5069 	popw x ; file size 
      009A78 01 81 CD         [ 4] 5070 	call print_int 
      009A7A A6 0D            [ 1] 5071 	ld a,#CR 
      009A7A CD 87 69         [ 4] 5072 	call putc
      009A7D 81 01            [ 2] 5073 	ldw x,(COUNT,sp)
      009A7E 5C               [ 2] 5074 	incw x
      009A7E AE 16            [ 2] 5075 	ldw (COUNT,sp),x  
      009A80 E0 A6            [ 2] 5076 	jra dir_loop
      001CC7                       5077 8$: ; print number of files 
      009A82 80 7F            [ 2] 5078 	ldw x,(COUNT,sp)
      009A84 5C 4A 26         [ 4] 5079 	call print_int 
      009A87 FB 81 E6         [ 2] 5080 	ldw x,#file_count 
      009A89 CD 00 00         [ 4] 5081 	call puts  
                                   5082 ; print drive free space 	
      009A89 A6 7F C4         [ 4] 5083 	call disk_free
      009A8C 00               [ 1] 5084 	clrw x  
      009A8D 19 27 13 CE      [ 1] 5085 	mov base,#10 
      009A91 00 18 1C         [ 4] 5086 	call prti24 
      009A94 00 80 24         [ 2] 5087 	ldw x,#drive_free
      009A97 04 72 5C         [ 4] 5088 	call puts 
      001CE3                       5089 	_drop VSIZE 
      009A9A 00 17            [ 2]    1     addw sp,#VSIZE 
      009A9C 9F               [ 4] 5090 	ret
      009A9D A4 80 97 CF 00 18 81  5091 file_count: .asciz " files\n"
             00
      009AA4 20 62 79 74 65 73 20  5092 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5093 
                                   5094 ;---------------------
                                   5095 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5096 ; write 1 or more byte to FLASH or EEPROM
                                   5097 ; starting at address  
                                   5098 ; input:
                                   5099 ;   expr1  	is address 
                                   5100 ;   expr2,...,exprn   are bytes to write
                                   5101 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5102 ;   none 
                                   5103 ;---------------------
                           000001  5104 	ADDR=1
                           000002  5105 	VSIZ=2 
      001CFB                       5106 write:
      001CFB                       5107 	_vars VSIZE 
      009AA4 72 BB            [ 2]    1     sub sp,#VSIZE 
      009AA6 00 18 24 04      [ 1] 5108 	clr farptr ; expect 16 bits address 
      009AAA 72 5C 00         [ 4] 5109 	call expression
      009AAD 17 CF            [ 1] 5110 	cp a,#TK_INTGR 
      009AAF 00 18            [ 1] 5111 	jreq 0$
      009AB1 81 08 7F         [ 2] 5112 	jp syntax_error
      009AB2 1F 01            [ 2] 5113 0$: ldw (ADDR,sp),x 
      009AB2 A6 01 C7         [ 4] 5114 	call next_token 
      009AB5 00 17            [ 1] 5115 	cp a,#TK_COMMA 
      009AB7 5F CF            [ 1] 5116 	jreq 1$ 
      009AB9 00 18            [ 2] 5117 	jra 9$ 
      009ABB CD 11 51         [ 4] 5118 1$:	call expression
      009ABB AE 00            [ 1] 5119 	cp a,#TK_INTGR
      009ABD 03 92            [ 1] 5120 	jreq 2$
      009ABF AF 00 17         [ 2] 5121 	jp syntax_error
      009AC2 26               [ 1] 5122 2$:	ld a,xl 
      009AC3 05 5A            [ 2] 5123 	ldw x,(ADDR,sp) 
      009AC5 2A F7 20         [ 2] 5124 	ldw farptr+1,x 
      009AC8 0E               [ 1] 5125 	clrw x 
      009AC9 AE 00 80         [ 4] 5126 	call write_byte
      009ACC CD 9A            [ 2] 5127 	ldw x,(ADDR,sp)
      009ACE A4               [ 2] 5128 	incw x 
      009ACF AE 02            [ 2] 5129 	jra 0$ 
      001D2F                       5130 9$:
      001D2F                       5131 	_drop VSIZE
      009AD1 80 C3            [ 2]    1     addw sp,#VSIZE 
      009AD3 00               [ 4] 5132 	ret 
                                   5133 
                                   5134 
                                   5135 ;---------------------
                                   5136 ;BASIC: CHAR(expr)
                                   5137 ; évaluate expression 
                                   5138 ; and take the 7 least 
                                   5139 ; bits as ASCII character
                                   5140 ; return a TK_CHAR 
                                   5141 ;---------------------
      001D32                       5142 char:
      009AD4 17 2B E4         [ 4] 5143 	call func_args 
      009AD7 A1 01            [ 1] 5144 	cp a,#1
      009AD7 CE 00            [ 1] 5145 	jreq 1$
      009AD9 17 C6 00         [ 2] 5146 	jp syntax_error
      009ADC 19               [ 2] 5147 1$:	popw x 
      009ADD CF               [ 1] 5148 	ld a,xl 
      009ADE 00 1A            [ 1] 5149 	and a,#0x7f 
      009AE0 C7               [ 1] 5150 	ld xl,a
      009AE1 00 1C            [ 1] 5151 	ld a,#TK_CHAR
      009AE3 81               [ 4] 5152 	ret
                                   5153 
                                   5154 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5155 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5156 ; extract first character 
                                   5157 ; of string argument 
                                   5158 ; return it as TK_INTGR 
                                   5159 ;---------------------
      009AE4                       5160 ascii:
      009AE4 AE 80            [ 1] 5161 	ld a,#TK_LPAREN
      009AE6 00 72 B0         [ 4] 5162 	call expect 
      009AE9 00 1B A6         [ 4] 5163 	call next_token 
      009AEC 02 C2            [ 1] 5164 	cp a,#TK_QSTR 
      009AEE 00 1A            [ 1] 5165 	jreq 1$
      009AF0 C7 00            [ 1] 5166 	cp a,#TK_CHAR 
      009AF2 0C CF            [ 1] 5167 	jreq 2$ 
      009AF4 00 0D            [ 1] 5168 	cp a,#TK_CFUNC 
      009AF6 81 03            [ 1] 5169 	jreq 0$
      009AF7 CC 08 7F         [ 2] 5170 	jp syntax_error
      009AF7 5F               [ 4] 5171 0$: call (x)
      009AF8 92 AF            [ 2] 5172 	jra 2$
      001D5E                       5173 1$: 
      009AFA 00               [ 1] 5174 	ld a,(x) 
      009AFB 17               [ 1] 5175 	clrw x
      009AFC 90               [ 1] 5176 	ld xl,a 
      001D61                       5177 2$: 
      009AFD F1               [ 2] 5178 	pushw x 
      009AFE 26 08            [ 1] 5179 	ld a,#TK_RPAREN 
      009B00 4D 27 12         [ 4] 5180 	call expect
      009B03 5C               [ 2] 5181 	popw x 
      009B04 90 5C            [ 1] 5182 	ld a,#TK_INTGR 
      009B06 20               [ 4] 5183 	ret 
                                   5184 
                                   5185 ;---------------------
                                   5186 ;BASIC: KEY
                                   5187 ; wait for a character 
                                   5188 ; received from STDIN 
                                   5189 ; input:
                                   5190 ;	none 
                                   5191 ; output:
                                   5192 ;	X 		ASCII character 
                                   5193 ;---------------------
      001D6B                       5194 key:
      009B07 F0 02 C9         [ 4] 5195 	call getc 
      009B08 5F               [ 1] 5196 	clrw x 
      009B08 4D               [ 1] 5197 	ld xl,a 
      009B09 27 07            [ 1] 5198 	ld a,#TK_INTGR
      009B0B 5C               [ 4] 5199 	ret
                                   5200 
                                   5201 ;----------------------
                                   5202 ; BASIC: QKEY
                                   5203 ; Return true if there 
                                   5204 ; is a character in 
                                   5205 ; waiting in STDIN 
                                   5206 ; input:
                                   5207 ;  none 
                                   5208 ; output:
                                   5209 ;   X 		0|-1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5210 ;-----------------------
      001D73                       5211 qkey:: 
      009B0C 92               [ 1] 5212 	clrw x 
      009B0D AF 00 17         [ 1] 5213 	ld a,rx_head
      009B10 20 F6 5C         [ 1] 5214 	cp a,rx_tail 
      009B13 98 81            [ 1] 5215 	jreq 9$ 
      009B15 53               [ 2] 5216 	cplw x 
      009B15 5C 99            [ 1] 5217 9$: ld a,#TK_INTGR
      009B17 81               [ 4] 5218 	ret 
                                   5219 
                                   5220 ;---------------------
                                   5221 ; BASIC: GPIO(expr,reg)
                                   5222 ; return gpio address 
                                   5223 ; expr {0..8}
                                   5224 ; input:
                                   5225 ;   none 
                                   5226 ; output:
                                   5227 ;   X 		gpio register address
                                   5228 ;----------------------------
                           000003  5229 	PORT=3
                           000001  5230 	REG=1 
                           000004  5231 	VSIZE=4 
      009B18                       5232 gpio:
      009B18 52 04 17         [ 4] 5233 	call func_args 
      009B1B 03 5F            [ 1] 5234 	cp a,#2
      009B1D CF 00            [ 1] 5235 	jreq 1$
      009B1F 18 35 01         [ 2] 5236 	jp syntax_error  
      001D8A                       5237 1$:	
      009B22 00 17            [ 2] 5238 	ldw x,(PORT,sp)
      009B24 2B 17            [ 1] 5239 	jrmi bad_port
      009B24 92 BC 00         [ 2] 5240 	cpw x,#9
      009B27 17 27            [ 1] 5241 	jrpl bad_port
      009B29 27 5F            [ 1] 5242 	ld a,#5
      009B2B 16               [ 4] 5243 	mul x,a
      009B2C 03 CD 9A         [ 2] 5244 	addw x,#GPIO_BASE 
      009B2F F7 25            [ 2] 5245 	ldw (PORT,sp),x  
      009B31 2F 92            [ 2] 5246 	ldw x,(REG,sp) 
      009B33 AF 00 17         [ 2] 5247 	addw x,(PORT,sp)
      009B36 6B 01            [ 1] 5248 	ld a,#TK_INTGR
      001DA2                       5249 	_drop VSIZE 
      009B38 5C 92            [ 2]    1     addw sp,#VSIZE 
      009B3A AF               [ 4] 5250 	ret
      001DA5                       5251 bad_port:
      009B3B 00 17            [ 1] 5252 	ld a,#ERR_BAD_VALUE
      009B3D 6B 02 5C         [ 2] 5253 	jp tb_error
                                   5254 
                                   5255 
                                   5256 ;-------------------------
                                   5257 ; BASIC: UFLASH 
                                   5258 ; return user flash address
                                   5259 ; input:
                                   5260 ;  none 
                                   5261 ; output:
                                   5262 ;	A		TK_INTGR
                                   5263 ;   X 		user address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5264 ;---------------------------
      001DAA                       5265 uflash:
      009B40 72 FB 01         [ 2] 5266 	ldw x,#user_space 
      009B43 CD 9A            [ 1] 5267 	ld a,#TK_INTGR 
      009B45 A4               [ 4] 5268 	ret 
                                   5269 
                                   5270 
                                   5271 ;---------------------
                                   5272 ; BASIC: USR(addr[,arg])
                                   5273 ; execute a function written 
                                   5274 ; in binary code.
                                   5275 ; binary fonction should 
                                   5276 ; return token attribute in A 
                                   5277 ; and value in X. 
                                   5278 ; input:
                                   5279 ;   addr	routine address 
                                   5280 ;   arg 	is an optional argument 
                                   5281 ; output:
                                   5282 ;   A 		token attribute 
                                   5283 ;   X       returned value 
                                   5284 ;---------------------
      001DB0                       5285 usr:
      009B46 CD 9A            [ 2] 5286 	pushw y 	
      009B48 89 AE 02         [ 4] 5287 	call func_args 
      009B4B 80 C3            [ 1] 5288 	cp a,#1 
      009B4D 00 17            [ 1] 5289 	jreq 2$
      009B4F 2A D3            [ 1] 5290 	cp a,#2
      009B51 27 03            [ 1] 5291 	jreq 2$  
      009B51 72 5F 00         [ 2] 5292 	jp syntax_error 
      009B54 17 72            [ 2] 5293 2$: popw y  ; arg|addr 
      009B56 5F 00            [ 1] 5294 	cp a,#1
      009B58 18 72            [ 1] 5295 	jreq 3$
      009B5A 5F               [ 2] 5296 	popw x ; addr
      009B5B 00               [ 1] 5297 	exgw x,y 
      009B5C 19 5B            [ 4] 5298 3$: call (y)
      009B5E 04 98            [ 2] 5299 	popw y 
      009B60 81               [ 4] 5300 	ret 
                                   5301 
                                   5302 ;------------------------------
                                   5303 ; BASIC: BYE 
                                   5304 ; halt mcu in its lowest power mode 
                                   5305 ; wait for reset or external interrupt
                                   5306 ; do a cold start on wakeup.
                                   5307 ;------------------------------
      009B61                       5308 bye:
      009B61 5B 04 99 81 FB   [ 2] 5309 	btjf UART1_SR,#UART_SR_TC,.
      009B65 8E               [10] 5310 	halt
      009B65 72 01 00         [ 2] 5311 	jp cold_start  
                                   5312 
                                   5313 ;----------------------------------
                                   5314 ; BASIC: AUTORUN ["file_name"] 
                                   5315 ; record in eeprom at adrress AUTORUN_NAME
                                   5316 ; the name of file to load and execute
                                   5317 ; at startup. 
                                   5318 ; empty string delete autorun name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5319 ; no argument display autorun name  
                                   5320 ; input:
                                   5321 ;   file_name   file to execute 
                                   5322 ; output:
                                   5323 ;   none
                                   5324 ;-----------------------------------
      001DD6                       5325 autorun: 
      009B68 24 05 A6 07 CC   [ 2] 5326 	btjf flags,#FRUN,0$ 
      009B6D 89 01            [ 1] 5327 	jreq 0$ 
      009B6F A6 07            [ 1] 5328 	ld a,#ERR_CMD_ONLY 
      009B6F CE 00 1F         [ 2] 5329 	jp tb_error 
      001DE2                       5330 0$:	
      009B72 72 B0 00         [ 4] 5331 	call next_token
      009B75 1D               [ 1] 5332 	tnz a 
      009B76 26 0C            [ 1] 5333 	jrne 1$
      009B78 AE 88 98         [ 2] 5334 	ldw x,#AUTORUN_NAME
      009B7B CD A8 C0         [ 4] 5335 	call puts 
      009B7E 55               [ 1] 5336 	clr a 
      009B7F 00               [ 4] 5337 	ret 
      001DF0                       5338 1$:
      009B80 04 00            [ 1] 5339 	cp a,#TK_QSTR
      009B82 02 81            [ 1] 5340 	jreq 2$
      009B84 CC 08 7F         [ 2] 5341 	jp syntax_error 
      001DF7                       5342 2$:	
      009B84 52               [ 1] 5343 	tnz (x) 
      009B85 08 1F            [ 1] 5344 	jrne 3$
                                   5345 ; empty string, delete autorun 	
      009B87 01 CD 89         [ 4] 5346 	call cancel_autorun
      009B8A F1 A1 02 27 03   [ 1] 5347 	mov in,count 
      009B8F CC               [ 4] 5348 	ret 
      009B90 88               [ 2] 5349 3$:	pushw x 
      009B91 FF 93            [ 1] 5350 	ldw y,x  
      009B92 CD 1A 98         [ 4] 5351 	call search_file 
      009B92 1F 03            [ 1] 5352 	jrc 4$ 
      009B94 CD 81            [ 1] 5353 	ld a,#ERR_NOT_FILE
      009B96 F4 CD 84         [ 2] 5354 	jp tb_error  
      001E10                       5355 4$: 
      009B99 16 AB 03 5F 97   [ 1] 5356 	mov in,count 
      009B9E 72 FB 01 4F      [ 1] 5357 	clr farptr 
      009BA2 72 BB 00         [ 2] 5358 	ldw x,#AUTORUN_NAME
      009BA5 1B C9 00         [ 2] 5359 	ldw farptr+1,x 
      009BA8 1A A1            [ 2] 5360 	ldw x,(1,sp)  
      009BAA 02 2B 0A         [ 4] 5361 	call strlen  ; return length in A 
      009BAD A3               [ 1] 5362 	clrw x 
      009BAE 80               [ 1] 5363 	ld xl,a 
      009BAF 00               [ 2] 5364 	incw x 
      009BB0 2B 05            [ 2] 5365 	popw y 
      009BB2 A6               [ 2] 5366 	pushw x 
      009BB3 0E               [ 1] 5367 	clrw x 
      009BB4 CC 89 01         [ 4] 5368 	call write_block 
      009BB7                       5369 	_drop 2 
      009BB7 16 03            [ 2]    1     addw sp,#2 
      009BB9 CD               [ 4] 5370 	ret 
                                   5371 
                                   5372 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5373 ; BASIC: SLEEP 
                                   5374 ; halt mcu until reset or external
                                   5375 ; interrupt.
                                   5376 ; Resume progam after SLEEP command
                                   5377 ;----------------------------------
      001E31                       5378 sleep:
      009BBA 9B 18 24 05 A6   [ 2] 5379 	btjf UART1_SR,#UART_SR_TC,.
      009BBF 08 CC 89 01      [ 1] 5380 	bset flags,#FSLEEP
      009BC3 8E               [10] 5381 	halt 
      009BC3 CE               [ 4] 5382 	ret 
                                   5383 
                                   5384 ;-------------------------------
                                   5385 ; BASIC: PAUSE expr 
                                   5386 ; suspend execution for n msec.
                                   5387 ; input:
                                   5388 ;	none
                                   5389 ; output:
                                   5390 ;	none 
                                   5391 ;------------------------------
      001E3C                       5392 pause:
      009BC4 00 1A C6         [ 4] 5393 	call expression
      009BC7 00 1C            [ 1] 5394 	cp a,#TK_INTGR
      009BC9 CF 00            [ 1] 5395 	jreq pause02 
      009BCB 17 C7 00         [ 2] 5396 	jp syntax_error
      001E46                       5397 pause02: 
      009BCE 19               [ 2] 5398 1$: tnzw x 
      009BCF 16 03            [ 1] 5399 	jreq 2$
      009BD1 AE               [10] 5400 	wfi 
      009BD2 16               [ 2] 5401 	decw x 
      009BD3 E0 CD            [ 1] 5402 	jrne 1$
      009BD5 84               [ 1] 5403 2$:	clr a 
      009BD6 32               [ 4] 5404 	ret 
                                   5405 
                                   5406 ;------------------------------
                                   5407 ; BASIC: AWU expr
                                   5408 ; halt mcu for 'expr' milliseconds
                                   5409 ; use Auto wakeup peripheral
                                   5410 ; all oscillators stopped except LSI
                                   5411 ; range: 1ms - 511ms
                                   5412 ; input:
                                   5413 ;  none
                                   5414 ; output:
                                   5415 ;  none:
                                   5416 ;------------------------------
      001E4F                       5417 awu:
      009BD7 CD 84 16         [ 4] 5418   call expression
      009BDA 5F 97            [ 1] 5419   cp a,#TK_INTGR
      009BDC 5C 1C            [ 1] 5420   jreq awu02
      009BDE 16 E0 16         [ 2] 5421   jp syntax_error
      001E59                       5422 awu02:
      009BE1 01 FF 1C         [ 2] 5423   cpw x,#5120
      009BE4 00 02            [ 1] 5424   jrmi 1$ 
      009BE6 90 CE 00 1D      [ 1] 5425   mov AWU_TBR,#15 
      009BEA 90 F6            [ 1] 5426   ld a,#30
      009BEC 90               [ 2] 5427   div x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BED 5C F7            [ 1] 5428   ld a,#16
      009BEF 5C               [ 2] 5429   div x,a 
      009BF0 90 C3            [ 2] 5430   jra 4$
      001E6A                       5431 1$: 
      009BF2 00 1F 27         [ 2] 5432   cpw x,#2048
      009BF5 05 A3            [ 1] 5433   jrmi 2$ 
      009BF7 17 60 2B EF      [ 1] 5434   mov AWU_TBR,#14
      009BFB A6 50            [ 1] 5435   ld a,#80
      009BFB 17               [ 2] 5436   div x,a 
      009BFC 07 10            [ 2] 5437   jra 4$   
      009BFD                       5438 2$:
      009BFD A3 17 60 27      [ 1] 5439   mov AWU_TBR,#7
      001E7C                       5440 3$:  
                                   5441 ; while X > 64  divide by 2 and increment AWU_TBR 
      009C01 04 7F 5C         [ 2] 5442   cpw x,#64 
      009C04 20 F7            [ 2] 5443   jrule 4$ 
      009C06 72 5C 50 F2      [ 1] 5444   inc AWU_TBR 
      009C06 AE               [ 2] 5445   srlw x 
      009C07 16 E0            [ 2] 5446   jra 3$ 
      001E88                       5447 4$:
      009C09 CD               [ 1] 5448   ld a, xl
      009C0A 82               [ 1] 5449   dec a 
      009C0B 08 AE            [ 1] 5450   jreq 5$
      009C0D 00               [ 1] 5451   dec a 	
      001E8D                       5452 5$: 
      009C0E 80 CD            [ 1] 5453   and a,#0x3e 
      009C10 9A A4 AE         [ 1] 5454   ld AWU_APR,a 
      009C13 16 E0 16 07      [ 1] 5455   bset AWU_CSR,#AWU_CSR_AWUEN
      009C17 90               [10] 5456   halt 
                                   5457 
      009C18 C3               [ 4] 5458   ret 
                                   5459 
                                   5460 ;------------------------------
                                   5461 ; BASIC: TICKS
                                   5462 ; return msec ticks counter value 
                                   5463 ; input:
                                   5464 ; 	none 
                                   5465 ; output:
                                   5466 ;	X 		TK_INTGR
                                   5467 ;-------------------------------
      001E98                       5468 get_ticks:
      009C19 00 1F 2B         [ 2] 5469 	ldw x,ticks 
      009C1C CD CE            [ 1] 5470 	ld a,#TK_INTGR
      009C1E 00               [ 4] 5471 	ret 
                                   5472 
                                   5473 
                                   5474 
                                   5475 ;------------------------------
                                   5476 ; BASIC: ABS(expr)
                                   5477 ; return absolute value of expr.
                                   5478 ; input:
                                   5479 ;   none
                                   5480 ; output:
                                   5481 ;   X     	positive integer
                                   5482 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001E9E                       5483 abs:
      009C1F 17 C6 00         [ 4] 5484 	call func_args 
      009C22 19 CF            [ 1] 5485 	cp a,#1 
      009C24 00 1A            [ 1] 5486 	jreq 0$ 
      009C26 C7 00 1C         [ 2] 5487 	jp syntax_error
      001EA8                       5488 0$:  
      009C29 1E               [ 2] 5489     popw x   
      009C2A 01               [ 1] 5490 	ld a,xh 
      009C2B CD 8A            [ 1] 5491 	bcp a,#0x80 
      009C2D 4D 5B            [ 1] 5492 	jreq 2$ 
      009C2F 08               [ 2] 5493 	negw x 
      009C30 81 84            [ 1] 5494 2$: ld a,#TK_INTGR 
      009C31 81               [ 4] 5495 	ret 
                                   5496 
                                   5497 ;------------------------------
                                   5498 ; BASIC: AND(expr1,expr2)
                                   5499 ; Apply bit AND relation between
                                   5500 ; the 2 arguments, i.e expr1 & expr2 
                                   5501 ; output:
                                   5502 ; 	A 		TK_INTGR
                                   5503 ;   X 		result 
                                   5504 ;------------------------------
      001EB2                       5505 bit_and:
      009C31 CD 9A A4         [ 4] 5506 	call func_args 
      009C34 CD 87            [ 1] 5507 	cp a,#2
      009C36 69 5F            [ 1] 5508 	jreq 1$
      009C38 92 AF 00         [ 2] 5509 	jp syntax_error 
      009C3B 17               [ 2] 5510 1$:	popw x 
      009C3C 90               [ 1] 5511 	ld a,xh 
      009C3D 95 5C            [ 1] 5512 	and a,(1,sp)
      009C3F 92               [ 1] 5513 	ld xh,a 
      009C40 AF               [ 1] 5514 	ld a,xl
      009C41 00 17            [ 1] 5515 	and a,(2,sp)
      009C43 5C               [ 1] 5516 	ld xl,a 
      001EC5                       5517 	_drop 2 
      009C44 90 97            [ 2]    1     addw sp,#2 
      009C46 72 B9            [ 1] 5518 	ld a,#TK_INTGR
      009C48 00               [ 4] 5519 	ret
                                   5520 
                                   5521 ;------------------------------
                                   5522 ; BASIC: OR(expr1,expr2)
                                   5523 ; Apply bit OR relation between
                                   5524 ; the 2 arguments, i.e expr1 | expr2 
                                   5525 ; output:
                                   5526 ; 	A 		TK_INTGR
                                   5527 ;   X 		result 
                                   5528 ;------------------------------
      001ECA                       5529 bit_or:
      009C49 1D 90 CF         [ 4] 5530 	call func_args 
      009C4C 00 1F            [ 1] 5531 	cp a,#2
      009C4E 90 CE            [ 1] 5532 	jreq 1$
      009C50 00 1D 7F         [ 2] 5533 	jp syntax_error 
      009C52                       5534 1$: 
      009C52 92               [ 2] 5535 	popw x 
      009C53 AF               [ 1] 5536 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C54 00 17            [ 1] 5537 	or a,(1,sp)
      009C56 90               [ 1] 5538 	ld xh,a 
      009C57 F7               [ 1] 5539 	ld a,xl 
      009C58 5C 90            [ 1] 5540 	or a,(2,sp)
      009C5A 5C               [ 1] 5541 	ld xl,a 
      001EDD                       5542 	_drop 2 
      009C5B 90 C3            [ 2]    1     addw sp,#2 
      009C5D 00 1F            [ 1] 5543 	ld a,#TK_INTGR 
      009C5F 2B               [ 4] 5544 	ret
                                   5545 
                                   5546 ;------------------------------
                                   5547 ; BASIC: XOR(expr1,expr2)
                                   5548 ; Apply bit XOR relation between
                                   5549 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5550 ; output:
                                   5551 ; 	A 		TK_INTGR
                                   5552 ;   X 		result 
                                   5553 ;------------------------------
      001EE2                       5554 bit_xor:
      009C60 F1 81 4D         [ 4] 5555 	call func_args 
      009C62 A1 02            [ 1] 5556 	cp a,#2
      009C62 72 01            [ 1] 5557 	jreq 1$
      009C64 00 24 07         [ 2] 5558 	jp syntax_error 
      001EEC                       5559 1$: 
      009C67 27               [ 2] 5560 	popw x 
      009C68 05               [ 1] 5561 	ld a,xh 
      009C69 A6 07            [ 1] 5562 	xor a,(1,sp)
      009C6B CC               [ 1] 5563 	ld xh,a 
      009C6C 89               [ 1] 5564 	ld a,xl 
      009C6D 01 02            [ 1] 5565 	xor a,(2,sp)
      009C6E 97               [ 1] 5566 	ld xl,a 
      001EF5                       5567 	_drop 2 
      009C6E CD 89            [ 2]    1     addw sp,#2 
      009C70 F1 A1            [ 1] 5568 	ld a,#TK_INTGR 
      009C72 02               [ 4] 5569 	ret 
                                   5570 
                                   5571 ;------------------------------
                                   5572 ; BASIC: LSHIFT(expr1,expr2)
                                   5573 ; logical shift left expr1 by 
                                   5574 ; expr2 bits 
                                   5575 ; output:
                                   5576 ; 	A 		TK_INTGR
                                   5577 ;   X 		result 
                                   5578 ;------------------------------
      001EFA                       5579 lshift:
      009C73 27 03 CC         [ 4] 5580 	call func_args
      009C76 88 FF            [ 1] 5581 	cp a,#2 
      009C78 90 93            [ 1] 5582 	jreq 1$
      009C7A CD 9B 18         [ 2] 5583 	jp syntax_error
      009C7D 25 05            [ 2] 5584 1$: popw y   
      009C7F A6               [ 2] 5585 	popw x 
      009C80 09 CC            [ 2] 5586 	tnzw y 
      009C82 89 01            [ 1] 5587 	jreq 4$
      009C84 58               [ 2] 5588 2$:	sllw x 
      009C84 CD 9C            [ 2] 5589 	decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C86 31 CE            [ 1] 5590 	jrne 2$
      001F10                       5591 4$:  
      009C88 00 1F            [ 1] 5592 	ld a,#TK_INTGR
      009C8A 72               [ 4] 5593 	ret
                                   5594 
                                   5595 ;------------------------------
                                   5596 ; BASIC: RSHIFT(expr1,expr2)
                                   5597 ; logical shift right expr1 by 
                                   5598 ; expr2 bits.
                                   5599 ; output:
                                   5600 ; 	A 		TK_INTGR
                                   5601 ;   X 		result 
                                   5602 ;------------------------------
      001F13                       5603 rshift:
      009C8B B0 00 1D         [ 4] 5604 	call func_args
      009C8E CD 8A            [ 1] 5605 	cp a,#2 
      009C90 4D 81            [ 1] 5606 	jreq 1$
      009C92 CC 08 7F         [ 2] 5607 	jp syntax_error
      009C92 52 03            [ 2] 5608 1$: popw y  
      009C94 CD               [ 2] 5609 	popw x
      009C95 89 F1            [ 2] 5610 	tnzw y 
      009C97 A1 00            [ 1] 5611 	jreq 4$
      009C99 27               [ 2] 5612 2$:	srlw x 
      009C9A 20 A1            [ 2] 5613 	decw y 
      009C9C 02 27            [ 1] 5614 	jrne 2$
      001F29                       5615 4$:  
      009C9E 03 CC            [ 1] 5616 	ld a,#TK_INTGR
      009CA0 88               [ 4] 5617 	ret
                                   5618 
                                   5619 ;--------------------------
                                   5620 ; BASIC: FCPU integer
                                   5621 ; set CPU frequency 
                                   5622 ;-------------------------- 
                                   5623 
      001F2C                       5624 fcpu:
      009CA1 FF 90            [ 1] 5625 	ld a,#TK_INTGR
      009CA3 93 55 00         [ 4] 5626 	call expect 
      009CA6 04               [ 1] 5627 	ld a,xl 
      009CA7 00 02            [ 1] 5628 	and a,#7 
      009CA9 CD 9B 18         [ 1] 5629 	ld CLK_CKDIVR,a 
      009CAC 25               [ 4] 5630 	ret 
                                   5631 
                                   5632 ;------------------------------
                                   5633 ; BASIC: PMODE pin#, mode 
                                   5634 ; Arduino pin. 
                                   5635 ; define pin as input or output
                                   5636 ; pin#: {0..15}
                                   5637 ; mode: INPUT|OUTPUT  
                                   5638 ;------------------------------
                           000001  5639 	PINNO=1
                           000001  5640 	VSIZE=1
      001F38                       5641 pin_mode:
      001F38                       5642 	_vars VSIZE 
      009CAD 05 A6            [ 2]    1     sub sp,#VSIZE 
      009CAF 09 CC 89         [ 4] 5643 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CB2 01 02            [ 1] 5644 	cp a,#2 
      009CB3 27 03            [ 1] 5645 	jreq 1$
      009CB3 CE 00 17         [ 2] 5646 	jp syntax_error 
      009CB6 C6 00            [ 2] 5647 1$: popw y ; mode 
      009CB8 19               [ 2] 5648 	popw x ; Dx pin 
      009CB9 20 0A 84         [ 4] 5649 	call select_pin 
      009CBB 6B 01            [ 1] 5650 	ld (PINNO,sp),a  
      009CBB AE 01            [ 1] 5651 	ld a,#1 
      009CBD 00 4F            [ 1] 5652 	tnz (PINNO,sp)
      009CBF CF 00            [ 1] 5653 	jreq 4$
      009CC1 17               [ 1] 5654 2$:	sll a 
      009CC2 C7 00            [ 1] 5655 	dec (PINNO,sp)
      009CC4 19 FB            [ 1] 5656 	jrne 2$ 
      009CC5 6B 01            [ 1] 5657 	ld (PINNO,sp),a
      009CC5 1F 01            [ 1] 5658 	ld a,(PINNO,sp)
      009CC7 6B 03            [ 1] 5659 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009CC9 CD 81            [ 1] 5660 	ld (GPIO_CR1,x),a 
      009CCB C0 CD 82 3B      [ 2] 5661 4$:	cpw y,#OUTP 
      009CCF AE 00            [ 1] 5662 	jreq 6$
                                   5663 ; input mode
                                   5664 ; disable external interrupt 
      009CD1 80 CD            [ 1] 5665 	ld a,(PINNO,sp)
      009CD3 9A               [ 1] 5666 	cpl a 
      009CD4 A4 CD            [ 1] 5667 	and a,(GPIO_CR2,x)
      009CD6 9A 89            [ 1] 5668 	ld (GPIO_CR2,x),a 
                                   5669 ;clear bit in DDR for input mode 
      009CD8 C6 00            [ 1] 5670 	ld a,(PINNO,sp)
      009CDA 19               [ 1] 5671 	cpl a 
      009CDB C0 00            [ 1] 5672 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009CDD 1C C6            [ 1] 5673 	ld (GPIO_DDR,x),a 
      009CDF 00 18            [ 2] 5674 	jra 9$
      001F75                       5675 6$: ;output mode  
      009CE1 C2 00            [ 1] 5676 	ld a,(PINNO,sp)
      009CE3 1B C6            [ 1] 5677 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009CE5 00 17            [ 1] 5678 	ld (GPIO_DDR,x),a 
      009CE7 C2 00            [ 1] 5679 	ld a,(PINNO,sp)
      009CE9 1A 2B            [ 1] 5680 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009CEB E0 7B            [ 1] 5681 	ld (GPIO_CR2,x),a 
      001F81                       5682 9$:	
      001F81                       5683 	_drop VSIZE 
      009CED 03 1E            [ 2]    1     addw sp,#VSIZE 
      009CEF 01               [ 4] 5684 	ret
                                   5685 
                                   5686 ;------------------------
                                   5687 ; select Arduino pin 
                                   5688 ; input:
                                   5689 ;   X 	 {0..15} Arduino Dx 
                                   5690 ; output:
                                   5691 ;   A     stm8s208 pin 
                                   5692 ;   X     base address s208 GPIO port 
                                   5693 ;---------------------------
      001F84                       5694 select_pin:
      009CF0 C7               [ 2] 5695 	sllw x 
      009CF1 00 1C CF         [ 2] 5696 	addw x,#arduino_to_8s208 
      009CF4 00               [ 2] 5697 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CF5 1A               [ 1] 5698 	ld a,xl 
      009CF6 5B               [ 1] 5699 	push a 
      009CF7 03               [ 1] 5700 	swapw x 
      009CF8 81 05            [ 1] 5701 	ld a,#5 
      009CF9 42               [ 4] 5702 	mul x,a 
      009CF9 52 02 5F         [ 2] 5703 	addw x,#GPIO_BASE 
      009CFC 1F               [ 1] 5704 	pop a 
      009CFD 01               [ 4] 5705 	ret 
                                   5706 ; translation from Arduino D0..D15 to stm8s208rb 
      001F94                       5707 arduino_to_8s208:
      009CFE CF 00                 5708 .byte 3,6 ; D0 
      009D00 18 35                 5709 .byte 3,5 ; D1 
      009D02 01 00                 5710 .byte 4,0 ; D2 
      009D04 17 01                 5711 .byte 2,1 ; D3
      009D05 06 00                 5712 .byte 6,0 ; D4
      009D05 5F 92                 5713 .byte 2,2 ; D5
      009D07 AF 00                 5714 .byte 2,3 ; D6
      009D09 17 27                 5715 .byte 3,1 ; D7
      009D0B 3B 03                 5716 .byte 3,3 ; D8
      009D0C 02 04                 5717 .byte 2,4 ; D9
      009D0C 92 AF                 5718 .byte 4,5 ; D10
      009D0E 00 17                 5719 .byte 2,6 ; D11
      009D10 27 06                 5720 .byte 2,7 ; D12
      009D12 CD 83                 5721 .byte 2,5 ; D13
      009D14 40 5C                 5722 .byte 4,2 ; D14
      009D16 20 F4                 5723 .byte 4,1 ; D15
                                   5724 
                                   5725 
                                   5726 ;------------------------------
                                   5727 ; BASIC: RND(expr)
                                   5728 ; return random number 
                                   5729 ; between 1 and expr inclusive
                                   5730 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5731 ; input:
                                   5732 ; 	none 
                                   5733 ; output:
                                   5734 ;	X 		random positive integer 
                                   5735 ;------------------------------
      001FB4                       5736 random:
      009D18 5C A6 20         [ 4] 5737 	call func_args 
      009D1B CD 83            [ 1] 5738 	cp a,#1
      009D1D 40 92            [ 1] 5739 	jreq 1$
      009D1F AF 00 17         [ 2] 5740 	jp syntax_error
      001FBE                       5741 1$:  
      009D22 90 95            [ 1] 5742 	ld a,#0x80 
      009D24 5C 92            [ 1] 5743 	bcp a,(1,sp)
      009D26 AF 00            [ 1] 5744 	jreq 2$
      009D28 17 5C            [ 1] 5745 	ld a,#ERR_BAD_VALUE
      009D2A 90 97 90         [ 2] 5746 	jp tb_error
      001FC9                       5747 2$: 
                                   5748 ; acc16=(x<<5)^x 
      009D2D 89 72 FB         [ 2] 5749 	ldw x,seedx 
      009D30 01               [ 2] 5750 	sllw x 
      009D31 CD               [ 2] 5751 	sllw x 
      009D32 9A               [ 2] 5752 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D33 A4               [ 2] 5753 	sllw x 
      009D34 CD               [ 2] 5754 	sllw x 
      009D35 9A               [ 1] 5755 	ld a,xh 
      009D36 89 85 CD         [ 1] 5756 	xor a,seedx 
      009D39 8A 4D A6         [ 1] 5757 	ld acc16,a 
      009D3C 0D               [ 1] 5758 	ld a,xl 
      009D3D CD 83 40         [ 1] 5759 	xor a,seedx+1 
      009D40 1E 01 5C         [ 1] 5760 	ld acc8,a 
                                   5761 ; seedx=seedy 
      009D43 1F 01 20         [ 2] 5762 	ldw x,seedy 
      009D46 BE 00 12         [ 2] 5763 	ldw seedx,x  
                                   5764 ; seedy=seedy^(seedy>>1)
      009D47 90 54            [ 2] 5765 	srlw y 
      009D47 1E 01            [ 1] 5766 	ld a,yh 
      009D49 CD 8A 4D         [ 1] 5767 	xor a,seedy 
      009D4C AE 9D 66         [ 1] 5768 	ld seedy,a  
      009D4F CD A8            [ 1] 5769 	ld a,yl 
      009D51 C0 CD 9A         [ 1] 5770 	xor a,seedy+1 
      009D54 E4 5F 35         [ 1] 5771 	ld seedy+1,a 
                                   5772 ; acc16>>3 
      009D57 0A 00 0B         [ 2] 5773 	ldw x,acc16 
      009D5A CD               [ 2] 5774 	srlw x 
      009D5B 8A               [ 2] 5775 	srlw x 
      009D5C 5D               [ 2] 5776 	srlw x 
                                   5777 ; x=acc16^x 
      009D5D AE               [ 1] 5778 	ld a,xh 
      009D5E 9D 6E CD         [ 1] 5779 	xor a,acc16 
      009D61 A8               [ 1] 5780 	ld xh,a 
      009D62 C0               [ 1] 5781 	ld a,xl 
      009D63 5B 02 81         [ 1] 5782 	xor a,acc8 
      009D66 20               [ 1] 5783 	ld xl,a 
                                   5784 ; seedy=x^seedy 
      009D67 66 69 6C         [ 1] 5785 	xor a,seedy+1
      009D6A 65               [ 1] 5786 	ld xl,a 
      009D6B 73               [ 1] 5787 	ld a,xh 
      009D6C 0A 00 20         [ 1] 5788 	xor a,seedy
      009D6F 62               [ 1] 5789 	ld xh,a 
      009D70 79 74 65         [ 2] 5790 	ldw seedy,x 
                                   5791 ; return seedy modulo expr + 1 
      009D73 73 20            [ 2] 5792 	popw y 
      009D75 66               [ 2] 5793 	divw x,y 
      009D76 72               [ 1] 5794 	ldw x,y 
      009D77 65               [ 2] 5795 	incw x 
      002018                       5796 10$:
      009D78 65 0A            [ 1] 5797 	ld a,#TK_INTGR
      009D7A 00               [ 4] 5798 	ret 
                                   5799 
                                   5800 ;---------------------------------
                                   5801 ; BASIC: WORDS 
                                   5802 ; affiche la listes des mots du
                                   5803 ; dictionnaire ainsi que le nombre
                                   5804 ; de mots.
                                   5805 ;---------------------------------
                           000001  5806 	WLEN=1 ; word length
                           000002  5807 	LLEN=2 ; character sent to console
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           000003  5808 	WCNT=3 ; count words printed 
                           000003  5809 	VSIZE=3 
      009D7B                       5810 words:
      00201B                       5811 	_vars VSIZE
      009D7B 52 02            [ 2]    1     sub sp,#VSIZE 
      009D7D 72 5F            [ 1] 5812 	clr (LLEN,sp)
      009D7F 00 17            [ 1] 5813 	clr (WCNT,sp)
      009D81 CD 91 D1 A1      [ 2] 5814 	ldw y,#kword_dict+2
      009D85 84               [ 1] 5815 0$:	ldw x,y
      009D86 27               [ 1] 5816 	ld a,(x)
      009D87 03 CC            [ 1] 5817 	and a,#15 
      009D89 88 FF            [ 1] 5818 	ld (WLEN,sp),a 
      009D8B 1F 01            [ 1] 5819 	inc (WCNT,sp)
      009D8D CD               [ 2] 5820 1$:	incw x 
      009D8E 89               [ 1] 5821 	ld a,(x)
      009D8F F1 A1 09         [ 4] 5822 	call putc 
      009D92 27 02            [ 1] 5823 	inc (LLEN,sp)
      009D94 20 19            [ 1] 5824 	dec (WLEN,sp)
      009D96 CD 91            [ 1] 5825 	jrne 1$
      009D98 D1 A1            [ 1] 5826 	ld a,#70
      009D9A 84 27            [ 1] 5827 	cp a,(LLEN,sp)
      009D9C 03 CC            [ 1] 5828 	jrmi 2$   
      009D9E 88 FF            [ 1] 5829 	ld a,#SPACE 
      009DA0 9F 1E 01         [ 4] 5830 	call putc 
      009DA3 CF 00            [ 1] 5831 	inc (LLEN,sp) 
      009DA5 18 5F            [ 2] 5832 	jra 3$
      009DA7 CD 82            [ 1] 5833 2$: ld a,#CR 
      009DA9 65 1E 01         [ 4] 5834 	call putc 
      009DAC 5C 20            [ 1] 5835 	clr (LLEN,sp)
      009DAE DC A2 00 02      [ 2] 5836 3$:	subw y,#2 
      009DAF 90 FE            [ 2] 5837 	ldw y,(y)
      009DAF 5B 02            [ 1] 5838 	jrne 0$ 
      009DB1 81 0D            [ 1] 5839 	ld a,#CR 
      009DB2 CD 02 C0         [ 4] 5840 	call putc  
      009DB2 CD               [ 1] 5841 	clrw x 
      009DB3 90 CD            [ 1] 5842 	ld a,(WCNT,sp)
      009DB5 A1               [ 1] 5843 	ld xl,a 
      009DB6 01 27 03         [ 4] 5844 	call print_int 
      009DB9 CC 88 FF         [ 2] 5845 	ldw x,#words_count_msg
      009DBC 85 9F A4         [ 4] 5846 	call puts 
      002068                       5847 	_drop VSIZE 
      009DBF 7F 97            [ 2]    1     addw sp,#VSIZE 
      009DC1 A6               [ 4] 5848 	ret 
      009DC2 03 81 6F 72 64 73 20  5849 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5850 
                                   5851 
                                   5852 ;-----------------------------
                                   5853 ; BASIC: TIMER expr 
                                   5854 ; initialize count down timer 
                                   5855 ;-----------------------------
      009DC4                       5856 set_timer:
      009DC4 A6 07 CD         [ 4] 5857 	call arg_list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DC7 90 C0            [ 1] 5858 	cp a,#1 
      009DC9 CD 89            [ 1] 5859 	jreq 1$
      009DCB F1 A1 02         [ 2] 5860 	jp syntax_error
      00208B                       5861 1$: 
      009DCE 27               [ 2] 5862 	popw x 
      009DCF 0E A1 03         [ 2] 5863 	ldw timer,x 
      009DD2 27               [ 4] 5864 	ret 
                                   5865 
                                   5866 ;------------------------------
                                   5867 ; BASIC: TIMEOUT 
                                   5868 ; return state of timer 
                                   5869 ;------------------------------
      002090                       5870 timeout:
      009DD3 0D A1 82         [ 2] 5871 	ldw x,timer 
      002093                       5872 logical_complement:
      009DD6 27               [ 2] 5873 	cplw x 
      009DD7 03 CC 88         [ 2] 5874 	cpw x,#-1
      009DDA FF FD            [ 1] 5875 	jreq 2$
      009DDC 20               [ 1] 5876 	clrw x 
      009DDD 03 84            [ 1] 5877 2$:	ld a,#TK_INTGR
      009DDE 81               [ 4] 5878 	ret 
                                   5879 
                                   5880 ;--------------------------------
                                   5881 ; BASIC NOT(expr) 
                                   5882 ; return logical complement of expr
                                   5883 ;--------------------------------
      00209D                       5884 func_not:
      009DDE F6 5F 97         [ 4] 5885 	call func_args  
      009DE1 A1 01            [ 1] 5886 	cp a,#1
      009DE1 89 A6            [ 1] 5887 	jreq 1$
      009DE3 08 CD 90         [ 2] 5888 	jp syntax_error
      009DE6 C0               [ 2] 5889 1$:	popw x 
      009DE7 85 A6            [ 2] 5890 	jra logical_complement
                                   5891 
                                   5892 
                                   5893 
                                   5894 ;-----------------------------------
                                   5895 ; BASIC: IWDGEN expr1 
                                   5896 ; enable independant watchdog timer
                                   5897 ; expr1 is delay in multiple of 62.5µsec
                                   5898 ; expr1 -> {1..16383}
                                   5899 ;-----------------------------------
      0020AA                       5900 enable_iwdg:
      009DE9 84 81 52         [ 4] 5901 	call arg_list
      009DEB A1 01            [ 1] 5902 	cp a,#1 
      009DEB CD 83            [ 1] 5903 	jreq 1$
      009DED 49 5F 97         [ 2] 5904 	jp syntax_error 
      009DF0 A6               [ 2] 5905 1$: popw x 
      009DF1 84 81            [ 1] 5906 	push #0
      009DF3 35 CC 50 E0      [ 1] 5907 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009DF3 5F               [ 1] 5908 	ld a,xh 
      009DF4 C6 00            [ 1] 5909 	and a,#0x3f
      009DF6 2E               [ 1] 5910 	ld xh,a  
      009DF7 C1 00 2F         [ 2] 5911 2$:	cpw x,#255
      009DFA 27 01            [ 2] 5912 	jrule 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009DFC 53 A6            [ 1] 5913 	inc (1,sp)
      009DFE 84               [ 1] 5914 	rcf 
      009DFF 81               [ 2] 5915 	rrcw x 
      009E00 20 F5            [ 2] 5916 	jra 2$
      009E00 CD 90 CD A1      [ 1] 5917 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E04 02               [ 1] 5918 	pop a  
      009E05 27 03 CC         [ 1] 5919 	ld IWDG_PR,a 
      009E08 88               [ 1] 5920 	ld a,xl
      009E09 FF               [ 1] 5921 	dec a 
      009E0A 35 55 50 E0      [ 1] 5922 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E0A 1E 03 2B         [ 1] 5923 	ld IWDG_RLR,a 
      009E0D 17 A3 00 09      [ 1] 5924 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009E11 2A               [ 4] 5925 	ret 
                                   5926 
                                   5927 
                                   5928 ;-----------------------------------
                                   5929 ; BASIC: IWDGREF  
                                   5930 ; refresh independant watchdog count down 
                                   5931 ; timer before it reset MCU. 
                                   5932 ;-----------------------------------
      0020E0                       5933 refresh_iwdg:
      009E12 12 A6 05 42      [ 1] 5934 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009E16 1C               [ 4] 5935 	ret 
                                   5936 
                                   5937 
                                   5938 ;-------------------------------------
                                   5939 ; BASIC: LOG(expr)
                                   5940 ; return logarithm base 2 of expr 
                                   5941 ; this is the position of most significant
                                   5942 ; bit set. 
                                   5943 ; input: 
                                   5944 ; output:
                                   5945 ;   X     log2 
                                   5946 ;   A     TK_INTGR 
                                   5947 ;*********************************
      0020E5                       5948 log2:
      009E17 50 00 1F         [ 4] 5949 	call func_args 
      009E1A 03 1E            [ 1] 5950 	cp a,#1 
      009E1C 01 72            [ 1] 5951 	jreq 1$
      009E1E FB 03 A6         [ 2] 5952 	jp syntax_error 
      009E21 84               [ 2] 5953 1$: popw x 
      0020F0                       5954 leading_one:
      009E22 5B               [ 2] 5955 	tnzw x 
      009E23 04 81            [ 1] 5956 	jreq 4$
      009E25 A6 0F            [ 1] 5957 	ld a,#15 
      009E25 A6               [ 2] 5958 2$: rlcw x 
      009E26 0A CC            [ 1] 5959     jrc 3$
      009E28 89               [ 1] 5960 	dec a 
      009E29 01 FA            [ 2] 5961 	jra 2$
      009E2A 5F               [ 1] 5962 3$: clrw x 
      009E2A AE               [ 1] 5963     ld xl,a
      009E2B A8 80            [ 1] 5964 4$:	ld a,#TK_INTGR
      009E2D A6               [ 4] 5965 	ret 
                                   5966 
                                   5967 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5968 ; BASIC: BIT(expr) 
                                   5969 ; expr ->{0..15}
                                   5970 ; return 2^expr 
                                   5971 ; output:
                                   5972 ;    x    2^expr 
                                   5973 ;-----------------------------------
      002100                       5974 bitmask:
      009E2E 84 81 4D         [ 4] 5975     call func_args 
      009E30 A1 01            [ 1] 5976 	cp a,#1
      009E30 90 89            [ 1] 5977 	jreq 1$
      009E32 CD 90 CD         [ 2] 5978 	jp syntax_error 
      009E35 A1               [ 2] 5979 1$: popw x 
      009E36 01               [ 1] 5980 	ld a,xl 
      009E37 27 07            [ 1] 5981 	and a,#15
      009E39 A1               [ 1] 5982 	clrw x 
      009E3A 02               [ 2] 5983 	incw x 
      009E3B 27               [ 1] 5984 2$: tnz a 
      009E3C 03 CC            [ 1] 5985 	jreq 3$
      009E3E 88               [ 2] 5986 	slaw x 
      009E3F FF               [ 1] 5987 	dec a 
      009E40 90 85            [ 2] 5988 	jra 2$ 
      009E42 A1 01            [ 1] 5989 3$: ld a,#TK_INTGR
      009E44 27               [ 4] 5990 	ret 
                                   5991 
                                   5992 ;------------------------------
                                   5993 ; BASIC: INVERT(expr)
                                   5994 ; 1's complement 
                                   5995 ;--------------------------------
      00211A                       5996 invert:
      009E45 02 85 51         [ 4] 5997 	call func_args
      009E48 90 FD            [ 1] 5998 	cp a,#1 
      009E4A 90 85            [ 1] 5999 	jreq 1$
      009E4C 81 08 7F         [ 2] 6000 	jp syntax_error
      009E4D 85               [ 2] 6001 1$: popw x  
      009E4D 72               [ 2] 6002 	cplw x 
      009E4E 0D 52            [ 1] 6003 	ld a,#TK_INTGR 
      009E50 30               [ 4] 6004 	ret 
                                   6005 
                                   6006 ;------------------------------
                                   6007 ; BASIC: DO 
                                   6008 ; initiate a DO ... UNTIL loop 
                                   6009 ;------------------------------
                           000003  6010 	DOLP_ADR=3 
                           000005  6011 	DOLP_INW=5
                           000004  6012 	VSIZE=4 
      002129                       6013 do_loop:
      009E51 FB               [ 2] 6014 	popw x 
      00212A                       6015 	_vars VSIZE 
      009E52 8E CC            [ 2]    1     sub sp,#VSIZE 
      009E54 86               [ 2] 6016 	pushw x 
      009E55 5A CE 00 04      [ 2] 6017 	ldw y,basicptr 
      009E56 17 03            [ 2] 6018 	ldw (DOLP_ADR,sp),y
      009E56 72 01 00 24      [ 2] 6019 	ldw y,in.w 
      009E5A 07 27            [ 2] 6020 	ldw (DOLP_INW,sp),y
      009E5C 05 A6 07 CC      [ 1] 6021 	inc loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E60 89               [ 4] 6022 	ret 
                                   6023 
                                   6024 ;--------------------------------
                                   6025 ; BASIC: UNTIL expr 
                                   6026 ; loop if exprssion is false 
                                   6027 ; else terminate loop
                                   6028 ;--------------------------------
      00213E                       6029 until: 
      009E61 01 5D 00 20      [ 1] 6030 	tnz loop_depth 
      009E62 26 03            [ 1] 6031 	jrne 1$ 
      009E62 CD 89 F1         [ 2] 6032 	jp syntax_error 
      002147                       6033 1$: 
      009E65 4D 26 08         [ 4] 6034 	call relation 
      009E68 AE 40            [ 1] 6035 	cp a,#TK_INTGR
      009E6A 00 CD            [ 1] 6036 	jreq 2$
      009E6C A8 C0 4F         [ 2] 6037 	jp syntax_error
      002151                       6038 2$: 
      009E6F 81               [ 2] 6039 	tnzw x 
      009E70 26 10            [ 1] 6040 	jrne 9$
      009E70 A1 02            [ 2] 6041 	ldw x,(DOLP_ADR,sp)
      009E72 27 03 CC         [ 2] 6042 	ldw basicptr,x 
      009E75 88 FF            [ 1] 6043 	ld a,(2,x)
      009E77 C7 00 03         [ 1] 6044 	ld count,a 
      009E77 7D 26            [ 2] 6045 	ldw x,(DOLP_INW,sp)
      009E79 09 CD 87         [ 2] 6046 	ldw in.w,x 
      009E7C 1C               [ 4] 6047 	ret 
      002164                       6048 9$:	; remove loop data from stack  
      009E7D 55               [ 2] 6049 	popw x
      002165                       6050 	_drop VSIZE
      009E7E 00 04            [ 2]    1     addw sp,#VSIZE 
      009E80 00 02 81 89      [ 1] 6051 	dec loop_depth 
      009E84 90               [ 2] 6052 	jp (x)
                                   6053 
                                   6054 ;--------------------------
                                   6055 ; BASIC: PRTA...PRTI  
                                   6056 ;  return constant value 
                                   6057 ;  PORT  offset in GPIO
                                   6058 ;  array
                                   6059 ;---------------------------
      00216C                       6060 const_porta:
      009E85 93 CD 9B         [ 2] 6061 	ldw x,#0
      009E88 18 25            [ 1] 6062 	ld a,#TK_INTGR 
      009E8A 05               [ 4] 6063 	ret 
      002172                       6064 const_portb:
      009E8B A6 09 CC         [ 2] 6065 	ldw x,#1
      009E8E 89 01            [ 1] 6066 	ld a,#TK_INTGR 
      009E90 81               [ 4] 6067 	ret 
      002178                       6068 const_portc:
      009E90 55 00 04         [ 2] 6069 	ldw x,#2
      009E93 00 02            [ 1] 6070 	ld a,#TK_INTGR 
      009E95 72               [ 4] 6071 	ret 
      00217E                       6072 const_portd:
      009E96 5F 00 17         [ 2] 6073 	ldw x,#3
      009E99 AE 40            [ 1] 6074 	ld a,#TK_INTGR 
      009E9B 00               [ 4] 6075 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      002184                       6076 const_porte:
      009E9C CF 00 18         [ 2] 6077 	ldw x,#4
      009E9F 1E 01            [ 1] 6078 	ld a,#TK_INTGR 
      009EA1 CD               [ 4] 6079 	ret 
      00218A                       6080 const_portf:
      009EA2 84 16 5F         [ 2] 6081 	ldw x,#5
      009EA5 97 5C            [ 1] 6082 	ld a,#TK_INTGR 
      009EA7 90               [ 4] 6083 	ret 
      002190                       6084 const_portg:
      009EA8 85 89 5F         [ 2] 6085 	ldw x,#6
      009EAB CD 82            [ 1] 6086 	ld a,#TK_INTGR 
      009EAD DA               [ 4] 6087 	ret 
      002196                       6088 const_porth:
      009EAE 5B 02 81         [ 2] 6089 	ldw x,#7
      009EB1 A6 84            [ 1] 6090 	ld a,#TK_INTGR 
      009EB1 72               [ 4] 6091 	ret 
      00219C                       6092 const_porti:
      009EB2 0D 52 30         [ 2] 6093 	ldw x,#8
      009EB5 FB 72            [ 1] 6094 	ld a,#TK_INTGR 
      009EB7 16               [ 4] 6095 	ret 
                                   6096 
                                   6097 ;-------------------------------
                                   6098 ; following return constant 
                                   6099 ; related to GPIO register offset 
                                   6100 ;---------------------------------
      0021A2                       6101 const_odr:
      009EB8 00 24            [ 1] 6102 	ld a,#TK_INTGR 
      009EBA 8E 81 00         [ 2] 6103 	ldw x,#GPIO_ODR
      009EBC 81               [ 4] 6104 	ret 
      0021A8                       6105 const_idr:
      009EBC CD 91            [ 1] 6106 	ld a,#TK_INTGR 
      009EBE D1 A1 84         [ 2] 6107 	ldw x,#GPIO_IDR
      009EC1 27               [ 4] 6108 	ret 
      0021AE                       6109 const_ddr:
      009EC2 03 CC            [ 1] 6110 	ld a,#TK_INTGR 
      009EC4 88 FF 02         [ 2] 6111 	ldw x,#GPIO_DDR
      009EC6 81               [ 4] 6112 	ret 
      0021B4                       6113 const_cr1:
      009EC6 5D 27            [ 1] 6114 	ld a,#TK_INTGR 
      009EC8 04 8F 5A         [ 2] 6115 	ldw x,#GPIO_CR1
      009ECB 26               [ 4] 6116 	ret 
      0021BA                       6117 const_cr2:
      009ECC F9 4F            [ 1] 6118 	ld a,#TK_INTGR 
      009ECE 81 00 04         [ 2] 6119 	ldw x,#GPIO_CR2
      009ECF 81               [ 4] 6120 	ret 
                                   6121 ;-------------------------
                                   6122 ;  constant for port mode
                                   6123 ;  used by PMODE 
                                   6124 ;  input or output
                                   6125 ;------------------------
      0021C0                       6126 const_output:
      009ECF CD 91            [ 1] 6127 	ld a,#TK_INTGR 
      009ED1 D1 A1 84         [ 2] 6128 	ldw x,#OUTP
      009ED4 27               [ 4] 6129 	ret 
      0021C6                       6130 const_input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009ED5 03 CC            [ 1] 6131 	ld a,#TK_INTGR 
      009ED7 88 FF 00         [ 2] 6132 	ldw x,#INP 
      009ED9 81               [ 4] 6133 	ret 
                                   6134 ;-----------------------
                                   6135 ; memory area constants
                                   6136 ;-----------------------
      0021CC                       6137 const_eeprom_base:
      009ED9 A3 14            [ 1] 6138 	ld a,#TK_INTGR 
      009EDB 00 2B 0C         [ 2] 6139 	ldw x,#EEPROM_BASE 
      009EDE 35               [ 4] 6140 	ret 
                                   6141 
                                   6142 ;---------------------------
                                   6143 ; BASIC: DATA 
                                   6144 ; when the interpreter find 
                                   6145 ; a DATA line it skip it.
                                   6146 ;---------------------------
      0021D2                       6147 data:
      009EDF 0F 50 F2 A6 1E   [ 1] 6148 	mov in,count 
      009EE4 62               [ 4] 6149 	ret 
                                   6150 
                                   6151 ;---------------------------
                                   6152 ; BASIC: DATLN  *expr*
                                   6153 ; set DATA pointer at line# 
                                   6154 ; specified by *expr* 
                                   6155 ;---------------------------
      0021D8                       6156 data_line:
      009EE5 A6 10 62         [ 4] 6157 	call expression
      009EE8 20 1E            [ 1] 6158 	cp a,#TK_INTGR
      009EEA 27 03            [ 1] 6159 	jreq 1$
      009EEA A3 08 00         [ 2] 6160 	jp syntax_error 
      009EED 2B 09 35         [ 4] 6161 1$: call search_lineno
      009EF0 0E               [ 2] 6162 	tnzw x 
      009EF1 50 F2            [ 1] 6163 	jrne 3$
      009EF3 A6 50            [ 1] 6164 2$:	ld a,#ERR_NO_LINE 
      009EF5 62 20 10         [ 2] 6165 	jp tb_error
      009EF8                       6166 3$: ; check if valid data line 
      009EF8 35 07            [ 1] 6167     ldw y,x 
      009EFA 50 F2            [ 2] 6168 	ldw x,(4,x)
      009EFC A3 21 D2         [ 2] 6169 	cpw x,#data 
      009EFC A3 00            [ 1] 6170 	jrne 2$ 
      009EFE 40 23 07 72      [ 2] 6171 	ldw data_ptr,y
      009F02 5C 50 F2         [ 1] 6172 	ld a,(2,y)
      009F05 54 20 F4         [ 1] 6173 	ld data_len,a 
      009F08 35 06 00 08      [ 1] 6174 	mov data_ofs,#FIRST_DATA_ITEM 
      009F08 9F               [ 4] 6175 	ret
                                   6176 
                                   6177 ;---------------------------------
                                   6178 ; BASIC: RESTORE 
                                   6179 ; set data_ptr to first data line
                                   6180 ; if not DATA found pointer set to
                                   6181 ; zero 
                                   6182 ;---------------------------------
      002205                       6183 restore:
      009F09 4A 27 01 4A      [ 1] 6184 	clr data_ptr 
      009F0D 72 5F 00 07      [ 1] 6185 	clr data_ptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F0D A4 3E C7 50      [ 1] 6186 	clr data_ofs 
      009F11 F1 72 18 50      [ 1] 6187 	clr data_len
      009F15 F0 8E 81         [ 2] 6188 	ldw x,txtbgn
      009F18                       6189 data_search_loop: 	
      009F18 CE 00 0F         [ 2] 6190 	cpw x,txtend
      009F1B A6 84            [ 1] 6191 	jruge 9$
      009F1D 81 93            [ 1] 6192 	ldw y,x 
      009F1E EE 04            [ 2] 6193 	ldw x,(4,x)
      009F1E CD 90 CD         [ 2] 6194 	addw x,#code_addr
      009F21 A1               [ 2] 6195 	ldw x,(x)
      009F22 01 27 03         [ 2] 6196 	cpw x,#data 
      009F25 CC 88            [ 1] 6197 	jrne try_next_line 
      009F27 FF CF 00 06      [ 2] 6198 	ldw data_ptr,y 
      009F28 90 E6 02         [ 1] 6199 	ld a,(2,y)
      009F28 85 9E A5         [ 1] 6200 	ld data_len,a 
      009F2B 80 27 01 50      [ 1] 6201 	mov data_ofs,#FIRST_DATA_ITEM
      009F2F A6 84 81 09      [ 1] 6202 9$:	tnz data_len 
      009F32 26 05            [ 1] 6203     jrne 10$
      009F32 CD 90            [ 1] 6204 	ld a,#ERR_NO_DATA 
      009F34 CD A1 02         [ 2] 6205 	jp tb_error 
      009F37 27               [ 4] 6206 10$:ret
      002244                       6207 try_next_line:
      009F38 03               [ 1] 6208 	ldw x,y 
      009F39 CC 88            [ 1] 6209 	ld a,(2,x)
      009F3B FF 85 9E         [ 1] 6210 	ld acc8,a 
      009F3E 14 01 95 9F      [ 1] 6211 	clr acc16 
      009F42 14 02 97 5B      [ 2] 6212 	addw x,acc16 
      009F46 02 A6            [ 2] 6213 	jra data_search_loop
                                   6214 
                                   6215 
                                   6216 ;---------------------------------
                                   6217 ; BASIC: READ 
                                   6218 ; return next data item | 0 
                                   6219 ;---------------------------------
                           000001  6220 	CTX_BPTR=1 
                           000003  6221 	CTX_IN=3 
                           000004  6222 	CTX_COUNT=4 
                           000005  6223 	XSAVE=5
                           000006  6224 	VSIZE=6
      002254                       6225 read:
      002254                       6226 	_vars  VSIZE 
      009F48 84 81            [ 2]    1     sub sp,#VSIZE 
      009F4A                       6227 read01:	
      009F4A CD 90 CD         [ 1] 6228 	ld a,data_ofs
      009F4D A1 02 27         [ 1] 6229 	cp a,data_len 
      009F50 03 CC            [ 1] 6230 	jreq 2$ ; end of line  
      009F52 88 FF A4         [ 4] 6231 	call save_context
      009F54 CE 00 06         [ 2] 6232 	ldw x,data_ptr 
      009F54 85 9E 1A         [ 2] 6233 	ldw basicptr,x 
      009F57 01 95 9F 1A 02   [ 1] 6234 	mov in,data_ofs 
      009F5C 97 5B 02 A6 84   [ 1] 6235 	mov count,data_len  
      009F61 81 11 51         [ 4] 6236 	call expression 
      009F62 A1 84            [ 1] 6237 	cp a,#TK_INTGR 
      009F62 CD 90            [ 1] 6238 	jreq 1$ 
      009F64 CD A1 02         [ 2] 6239 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00227B                       6240 1$:
      009F67 27 03            [ 2] 6241 	ldw (XSAVE,SP),x
      009F69 CC 88 FF         [ 4] 6242 	call next_token ; skip comma
      009F6C CE 00 04         [ 2] 6243 	ldw x,basicptr 
      009F6C 85 9E 18         [ 2] 6244 	ldw data_ptr,x 
      009F6F 01 95 9F 18 02   [ 1] 6245 	mov data_ofs,in 
      009F74 97 5B 02         [ 4] 6246 	call rest_context
      009F77 A6 84            [ 2] 6247 	ldw x,(XSAVE,sp)
      009F79 81 84            [ 1] 6248 	ld a,#TK_INTGR
      009F7A                       6249 	_drop VSIZE 
      009F7A CD 90            [ 2]    1     addw sp,#VSIZE 
      009F7C CD               [ 4] 6250 	ret 
      002295                       6251 2$: ; end of line reached 
      009F7D A1 02 27 03      [ 2] 6252 	ldw y, data_ptr 
      009F81 CC 88 FF 90      [ 1] 6253 	clr data_ptr
      009F85 85 85 90 5D      [ 1] 6254 	clr data_ptr+1   
      009F89 27 05 58 90      [ 1] 6255 	clr data_ofs 
      009F8D 5A 26 FB 09      [ 1] 6256 	clr data_len 
      009F90 CD 22 44         [ 4] 6257 	call try_next_line 
      009F90 A6 84            [ 2] 6258 	jra read01
                                   6259 
                                   6260 
                                   6261 ;---------------------------------
                                   6262 ; BASIC: SPIEN clkdiv, 0|1  
                                   6263 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6264 ; if clkdiv==-1 disable SPI
                                   6265 ; 0|1 -> disable|enable  
                                   6266 ;--------------------------------- 
                           000005  6267 SPI_CS_BIT=5
      0022AE                       6268 spi_enable:
      009F92 81 10 52         [ 4] 6269 	call arg_list 
      009F93 A1 02            [ 1] 6270 	cp a,#2
      009F93 CD 90            [ 1] 6271 	jreq 1$
      009F95 CD A1 02         [ 2] 6272 	jp syntax_error 
      0022B8                       6273 1$: 
      009F98 27 03 CC 88      [ 1] 6274 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009F9C FF               [ 2] 6275 	popw x  
      009F9D 90               [ 2] 6276 	tnzw x 
      009F9E 85 85            [ 1] 6277 	jreq spi_disable 
      009FA0 90               [ 2] 6278 	popw x 
      009FA1 5D 27            [ 1] 6279 	ld a,#(1<<SPI_CR1_BR)
      009FA3 05               [ 4] 6280 	mul x,a 
      009FA4 54               [ 1] 6281 	ld a,xl 
      009FA5 90 5A 26         [ 1] 6282 	ld SPI_CR1,a 
                                   6283 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009FA8 FB 1A 50 14      [ 1] 6284 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009FA9 72 1A 50 16      [ 1] 6285 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6286 ; configure SPI as master mode 0.	
      009FA9 A6 84 81 00      [ 1] 6287 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6288 ; ~CS line controlled by sofware 	
      009FAC 72 12 52 01      [ 1] 6289 	bset SPI_CR2,#SPI_CR2_SSM 
      009FAC A6 84 CD 90      [ 1] 6290     bset SPI_CR2,#SPI_CR2_SSI 
                                   6291 ; enable SPI
      009FB0 C0 9F A4 07      [ 1] 6292 	bset SPI_CR1,#SPI_CR1_SPE 	
      009FB4 C7               [ 4] 6293 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      0022E1                       6294 spi_disable:
      0022E1                       6295 	_drop #2; throw first argument.
      009FB5 50 C6            [ 2]    1     addw sp,##2 
                                   6296 ; wait spi idle 
      009FB7 81 82            [ 1] 6297 1$:	ld a,#0x82 
      009FB8 C4 52 03         [ 1] 6298 	and a,SPI_SR
      009FB8 52 01            [ 1] 6299 	cp a,#2 
      009FBA CD 90            [ 1] 6300 	jrne 1$
      009FBC D2 A1 02 27      [ 1] 6301 	bres SPI_CR1,#SPI_CR1_SPE
      009FC0 03 CC 88 FF      [ 1] 6302 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009FC4 90 85 85 CD      [ 1] 6303 	bres PE_DDR,#SPI_CS_BIT 
      009FC8 A0               [ 4] 6304 	ret 
                                   6305 
      0022F9                       6306 spi_clear_error:
      009FC9 04 6B            [ 1] 6307 	ld a,#0x78 
      009FCB 01 A6 01         [ 1] 6308 	bcp a,SPI_SR 
      009FCE 0D 01            [ 1] 6309 	jreq 1$
      009FD0 27 0D 48 0A      [ 1] 6310 	clr SPI_SR 
      009FD4 01               [ 4] 6311 1$: ret 
                                   6312 
      002305                       6313 spi_send_byte:
      009FD5 26               [ 1] 6314 	push a 
      009FD6 FB 6B 01         [ 4] 6315 	call spi_clear_error
      009FD9 7B               [ 1] 6316 	pop a 
      009FDA 01 EA 03 E7 03   [ 2] 6317 	btjf SPI_SR,#SPI_SR_TXE,.
      009FDF 90 A3 00         [ 1] 6318 	ld SPI_DR,a
      009FE2 01 27 10 7B 01   [ 2] 6319 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009FE7 43 E4 04         [ 1] 6320 	ld a,SPI_DR 
      009FEA E7               [ 4] 6321 	ret 
                                   6322 
      00231B                       6323 spi_rcv_byte:
      009FEB 04 7B            [ 1] 6324 	ld a,#255
      009FED 01 43 E4 02 E7   [ 2] 6325 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      009FF2 02 20 0C         [ 1] 6326 	ld a,SPI_DR 
      009FF5 81               [ 4] 6327 	ret
                                   6328 
                                   6329 ;------------------------------
                                   6330 ; BASIC: SPIWR byte [,byte]
                                   6331 ; write 1 or more byte
                                   6332 ;------------------------------
      002326                       6333 spi_write:
      009FF5 7B 01 EA         [ 4] 6334 	call expression
      009FF8 02 E7            [ 1] 6335 	cp a,#TK_INTGR 
      009FFA 02 7B            [ 1] 6336 	jreq 1$
      009FFC 01 EA 04         [ 2] 6337 	jp syntax_error 
      002330                       6338 1$:	
      009FFF E7               [ 1] 6339 	ld a,xl 
      00A000 04 23 05         [ 4] 6340 	call spi_send_byte 
      00A001 CD 09 71         [ 4] 6341 	call next_token 
      00A001 5B 01            [ 1] 6342 	cp a,#TK_COMMA 
      00A003 81 02            [ 1] 6343 	jrne 2$ 
      00A004 20 E9            [ 2] 6344 	jra spi_write 
      00A004 58               [ 1] 6345 2$:	tnz a 
      00A005 1C A0            [ 1] 6346 	jreq 3$
      002340                       6347 	_unget_token  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A007 14 FE 9F 88 5E   [ 1]    1      mov in,in.saved  
      00A00C A6               [ 4] 6348 3$:	ret 
                                   6349 
                                   6350 
                                   6351 ;-------------------------------
                                   6352 ; BASIC: SPIRD 	
                                   6353 ; read one byte from SPI 
                                   6354 ;-------------------------------
      002346                       6355 spi_read:
      00A00D 05 42 1C         [ 4] 6356 	call spi_rcv_byte 
      00A010 50               [ 1] 6357 	clrw x 
      00A011 00               [ 1] 6358 	ld xl,a 
      00A012 84 81            [ 1] 6359 	ld a,#TK_INTGR 
      00A014 81               [ 4] 6360 	ret 
                                   6361 
                                   6362 ;------------------------------
                                   6363 ; BASIC: SPISEL 0|1 
                                   6364 ; set state of ~CS line
                                   6365 ; 0|1 deselect|select  
                                   6366 ;------------------------------
      00234E                       6367 spi_select:
      00A014 03 06 03         [ 4] 6368 	call next_token 
      00A017 05 04            [ 1] 6369 	cp a,#TK_INTGR 
      00A019 00 02            [ 1] 6370 	jreq 1$
      00A01B 01 06 00         [ 2] 6371 	jp syntax_error 
      00A01E 02               [ 2] 6372 1$: tnzw x  
      00A01F 02 02            [ 1] 6373 	jreq cs_high 
      00A021 03 03 01 03      [ 1] 6374 	bres PE_ODR,#SPI_CS_BIT
      00A025 03               [ 4] 6375 	ret 
      002360                       6376 cs_high: 
      00A026 02 04 04 05      [ 1] 6377 	bset PE_ODR,#SPI_CS_BIT
      00A02A 02               [ 4] 6378 	ret 
                                   6379 
                                   6380 
                                   6381 ;-------------------------------
                                   6382 ; BASIC: PAD 
                                   6383 ; Return pad buffer address.
                                   6384 ;------------------------------
      002365                       6385 pad_ref:
      00A02B 06 02 07         [ 2] 6386 	ldw x,#pad 
      00A02E 02 05            [ 1] 6387 	ld a,TK_INTGR
      00A030 04               [ 4] 6388 	ret 
                                   6389 
                                   6390 ;------------------------------
                                   6391 ;      dictionary 
                                   6392 ; format:
                                   6393 ;   link:   2 bytes 
                                   6394 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6395 ;   cmd_name: 16 byte max 
                                   6396 ;   cmd_index: 2 bytes 
                                   6397 ;------------------------------
                                   6398 	.macro _dict_entry len,name,cmd_idx 
                                   6399 	.word LINK 
                                   6400 	LINK=.
                                   6401 name:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   6402 	.byte len 	
                                   6403 	.ascii "name"
                                   6404 	.word cmd_idx 
                                   6405 	.endm 
                                   6406 
                           000000  6407 	LINK=0
                                   6408 ; respect alphabetic order for BASIC names from Z-A
                                   6409 ; this sort order is for a cleaner WORDS cmd output. 	
      00236B                       6410 kword_end:
      00236B                       6411 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A031 02 04                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 XOR:
      00A033 01                       4 	.byte 3+F_IFUNC 	
      00A034 58 4F 52                 5 	.ascii "XOR"
      00A034 CD 90                    6 	.word XOR_IDX 
      002373                       6412 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A036 CD A1                    1 	.word LINK 
                           002375     2 	LINK=.
      002375                          3 WRITE:
      00A038 01                       4 	.byte 5 	
      00A039 27 03 CC 88 FF           5 	.ascii "WRITE"
      00A03E 00 C4                    6 	.word WRITE_IDX 
      00237D                       6413 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A03E A6 80                    1 	.word LINK 
                           00237F     2 	LINK=.
      00237F                          3 WORDS:
      00A040 15                       4 	.byte 5 	
      00A041 01 27 05 A6 0A           5 	.ascii "WORDS"
      00A046 CC 89                    6 	.word WORDS_IDX 
      002387                       6414 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A048 01 7F                    1 	.word LINK 
                           002389     2 	LINK=.
      00A049                          3 WAIT:
      00A049 CE                       4 	.byte 4 	
      00A04A 00 13 58 58              5 	.ascii "WAIT"
      00A04E 58 58                    6 	.word WAIT_IDX 
      002390                       6415 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A050 58 9E                    1 	.word LINK 
                           002392     2 	LINK=.
      002392                          3 USR:
      00A052 C8                       4 	.byte 3+F_IFUNC 	
      00A053 00 13 C7                 5 	.ascii "USR"
      00A056 00 0D                    6 	.word USR_IDX 
      002398                       6416 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A058 9F C8                    1 	.word LINK 
                           00239A     2 	LINK=.
      00239A                          3 UNTIL:
      00A05A 00                       4 	.byte 5 	
      00A05B 14 C7 00 0E CE           5 	.ascii "UNTIL"
      00A060 00 15                    6 	.word UNTIL_IDX 
      0023A2                       6417 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A062 CF 00                    1 	.word LINK 
                           0023A4     2 	LINK=.
      0023A4                          3 UFLASH:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A064 13                       4 	.byte 6+F_IFUNC 	
      00A065 90 54 90 9E C8 00        5 	.ascii "UFLASH"
      00A06B 15 C7                    6 	.word UFLASH_IDX 
      0023AD                       6418 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound 
      00A06D 00 15                    1 	.word LINK 
                           0023AF     2 	LINK=.
      0023AF                          3 UBOUND:
      00A06F 90                       4 	.byte 6+F_IFUNC 	
      00A070 9F C8 00 16 C7 00        5 	.ascii "UBOUND"
      00A076 16 CE                    6 	.word UBOUND_IDX 
      0023B8                       6419 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A078 00 0D                    1 	.word LINK 
                           0023BA     2 	LINK=.
      0023BA                          3 TONE:
      00A07A 54                       4 	.byte 4 	
      00A07B 54 54 9E C8              5 	.ascii "TONE"
      00A07F 00 0D                    6 	.word TONE_IDX 
      0023C1                       6420 	_dict_entry,2,TO,TO_IDX;to
      00A081 95 9F                    1 	.word LINK 
                           0023C3     2 	LINK=.
      0023C3                          3 TO:
      00A083 C8                       4 	.byte 2 	
      00A084 00 0E                    5 	.ascii "TO"
      00A086 97 C8                    6 	.word TO_IDX 
      0023C8                       6421 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A088 00 16                    1 	.word LINK 
                           0023CA     2 	LINK=.
      0023CA                          3 TIMEOUT:
      00A08A 97                       4 	.byte 7+F_IFUNC 	
      00A08B 9E C8 00 15 95 CF 00     5 	.ascii "TIMEOUT"
      00A092 15 90                    6 	.word TMROUT_IDX 
      0023D4                       6422 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A094 85 65                    1 	.word LINK 
                           0023D6     2 	LINK=.
      0023D6                          3 TIMER:
      00A096 93                       4 	.byte 5 	
      00A097 5C 49 4D 45 52           5 	.ascii "TIMER"
      00A098 00 B0                    6 	.word TIMER_IDX 
      0023DE                       6423 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A098 A6 84                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 TICKS:
      00A09A 81                       4 	.byte 5+F_IFUNC 	
      00A09B 54 49 43 4B 53           5 	.ascii "TICKS"
      00A09B 52 03                    6 	.word TICKS_IDX 
      0023E8                       6424 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A09D 0F 02                    1 	.word LINK 
                           0023EA     2 	LINK=.
      0023EA                          3 STOP:
      00A09F 0F                       4 	.byte 4 	
      00A0A0 03 90 AE A7              5 	.ascii "STOP"
      00A0A4 86 93                    6 	.word STOP_IDX 
      0023F1                       6425 	_dict_entry,4,STEP,STEP_IDX;step 
      00A0A6 F6 A4                    1 	.word LINK 
                           0023F3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0023F3                          3 STEP:
      00A0A8 0F                       4 	.byte 4 	
      00A0A9 6B 01 0C 03              5 	.ascii "STEP"
      00A0AD 5C F6                    6 	.word STEP_IDX 
      0023FA                       6426 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A0AF CD 83                    1 	.word LINK 
                           0023FC     2 	LINK=.
      0023FC                          3 SPIWR:
      00A0B1 40                       4 	.byte 5 	
      00A0B2 0C 02 0A 01 26           5 	.ascii "SPIWR"
      00A0B7 F5 A6                    6 	.word SPIWR_IDX 
      002404                       6427 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A0B9 46 11                    1 	.word LINK 
                           002406     2 	LINK=.
      002406                          3 SPISEL:
      00A0BB 02                       4 	.byte 6 	
      00A0BC 2B 09 A6 20 CD 83        5 	.ascii "SPISEL"
      00A0C2 40 0C                    6 	.word SPISEL_IDX 
      00240F                       6428 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A0C4 02 20                    1 	.word LINK 
                           002411     2 	LINK=.
      002411                          3 SPIEN:
      00A0C6 07                       4 	.byte 5 	
      00A0C7 A6 0D CD 83 40           5 	.ascii "SPIEN"
      00A0CC 0F 02                    6 	.word SPIEN_IDX 
      002419                       6429 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A0CE 72 A2                    1 	.word LINK 
                           00241B     2 	LINK=.
      00241B                          3 SPIRD:
      00A0D0 00                       4 	.byte 5+F_IFUNC 	
      00A0D1 02 90 FE 26 CF           5 	.ascii "SPIRD"
      00A0D6 A6 0D                    6 	.word SPIRD_IDX 
      002423                       6430 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A0D8 CD 83                    1 	.word LINK 
                           002425     2 	LINK=.
      002425                          3 SLEEP:
      00A0DA 40                       4 	.byte 5 	
      00A0DB 5F 7B 03 97 CD           5 	.ascii "SLEEP"
      00A0E0 8A 4D                    6 	.word SLEEP_IDX 
      00242D                       6431 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A0E2 AE A0                    1 	.word LINK 
                           00242F     2 	LINK=.
      00242F                          3 SIZE:
      00A0E4 EB                       4 	.byte 4+F_IFUNC 	
      00A0E5 CD A8 C0 5B              5 	.ascii "SIZE"
      00A0E9 03 81                    6 	.word SIZE_IDX 
      002436                       6432     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A0EB 20 77                    1 	.word LINK 
                           002438     2 	LINK=.
      002438                          3 SHOW:
      00A0ED 6F                       4 	.byte 4 	
      00A0EE 72 64 73 20              5 	.ascii "SHOW"
      00A0F2 69 6E                    6 	.word SHOW_IDX 
      00243F                       6433 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A0F4 20 64                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           002441     2 	LINK=.
      002441                          3 SAVE:
      00A0F6 69                       4 	.byte 4 	
      00A0F7 63 74 69 6F              5 	.ascii "SAVE"
      00A0FB 6E 61                    6 	.word SAVE_IDX 
      002448                       6434 	_dict_entry 3,RUN,RUN_IDX;run
      00A0FD 72 79                    1 	.word LINK 
                           00244A     2 	LINK=.
      00244A                          3 RUN:
      00A0FF 0A                       4 	.byte 3 	
      00A100 00 55 4E                 5 	.ascii "RUN"
      00A101 00 98                    6 	.word RUN_IDX 
      002450                       6435 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A101 CD 90                    1 	.word LINK 
                           002452     2 	LINK=.
      002452                          3 RSHIFT:
      00A103 D2                       4 	.byte 6+F_IFUNC 	
      00A104 A1 01 27 03 CC 88        5 	.ascii "RSHIFT"
      00A10A FF 96                    6 	.word RSHIFT_IDX 
      00A10B                       6436 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A10B 85 CF                    1 	.word LINK 
                           00245D     2 	LINK=.
      00245D                          3 RND:
      00A10D 00                       4 	.byte 3+F_IFUNC 	
      00A10E 11 81 44                 5 	.ascii "RND"
      00A110 00 94                    6 	.word RND_IDX 
      002463                       6437 	_dict_entry,6,RETURN,RET_IDX;return 
      00A110 CE 00                    1 	.word LINK 
                           002465     2 	LINK=.
      002465                          3 RETURN:
      00A112 11                       4 	.byte 6 	
      00A113 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A113 53 A3                    6 	.word RET_IDX 
      00246E                       6438 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A115 FF FF                    1 	.word LINK 
                           002470     2 	LINK=.
      002470                          3 RESTORE:
      00A117 27                       4 	.byte 7 	
      00A118 01 5F A6 84 81 52 45     5 	.ascii "RESTORE"
      00A11D 00 90                    6 	.word REST_IDX 
      00247A                       6439 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A11D CD 90                    1 	.word LINK 
                           00247C     2 	LINK=.
      00247C                          3 REMARK:
      00A11F CD                       4 	.byte 6 	
      00A120 A1 01 27 03 CC 88        5 	.ascii "REMARK"
      00A126 FF 85                    6 	.word REM_IDX 
      002485                       6440 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A128 20 E9                    1 	.word LINK 
                           002487     2 	LINK=.
      00A12A                          3 REBOOT:
      00A12A CD                       4 	.byte 6 	
      00A12B 90 D2 A1 01 27 03        5 	.ascii "REBOOT"
      00A131 CC 88                    6 	.word RBT_IDX 
      002490                       6441 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A133 FF 85                    1 	.word LINK 
                           002492     2 	LINK=.
      002492                          3 READ:
      00A135 4B                       4 	.byte 4+F_IFUNC 	
      00A136 00 35 CC 50              5 	.ascii "READ"
      00A13A E0 9E                    6 	.word READ_IDX 
      002499                       6442 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A13C A4 3F                    1 	.word LINK 
                           00249B     2 	LINK=.
      00249B                          3 QKEY:
      00A13E 95                       4 	.byte 4+F_IFUNC 	
      00A13F A3 00 FF 23              5 	.ascii "QKEY"
      00A143 06 0C                    6 	.word QKEY_IDX 
      0024A2                       6443 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A145 01 98                    1 	.word LINK 
                           0024A4     2 	LINK=.
      0024A4                          3 PRTI:
      00A147 56                       4 	.byte 4+F_IFUNC 	
      00A148 20 F5 35 55              5 	.ascii "PRTI"
      00A14C 50 E0                    6 	.word PRTI_IDX 
      0024AB                       6444 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A14E 84 C7                    1 	.word LINK 
                           0024AD     2 	LINK=.
      0024AD                          3 PRTH:
      00A150 50                       4 	.byte 4+F_IFUNC 	
      00A151 E1 9F 4A 35              5 	.ascii "PRTH"
      00A155 55 50                    6 	.word PRTH_IDX 
      0024B4                       6445 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A157 E0 C7                    1 	.word LINK 
                           0024B6     2 	LINK=.
      0024B6                          3 PRTG:
      00A159 50                       4 	.byte 4+F_IFUNC 	
      00A15A E2 35 AA 50              5 	.ascii "PRTG"
      00A15E E0 81                    6 	.word PRTG_IDX 
      00A160                       6446 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A160 35 AA                    1 	.word LINK 
                           0024BF     2 	LINK=.
      0024BF                          3 PRTF:
      00A162 50                       4 	.byte 4+F_IFUNC 	
      00A163 E0 81 54 46              5 	.ascii "PRTF"
      00A165 00 80                    6 	.word PRTF_IDX 
      0024C6                       6447 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A165 CD 90                    1 	.word LINK 
                           0024C8     2 	LINK=.
      0024C8                          3 PRTE:
      00A167 CD                       4 	.byte 4+F_IFUNC 	
      00A168 A1 01 27 03              5 	.ascii "PRTE"
      00A16C CC 88                    6 	.word PRTE_IDX 
      0024CF                       6448 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A16E FF 85                    1 	.word LINK 
                           0024D1     2 	LINK=.
      00A170                          3 PRTD:
      00A170 5D                       4 	.byte 4+F_IFUNC 	
      00A171 27 0A A6 0F              5 	.ascii "PRTD"
      00A175 59 25                    6 	.word PRTD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0024D8                       6449 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A177 03 4A                    1 	.word LINK 
                           0024DA     2 	LINK=.
      0024DA                          3 PRTC:
      00A179 20                       4 	.byte 4+F_IFUNC 	
      00A17A FA 5F 97 A6              5 	.ascii "PRTC"
      00A17E 84 81                    6 	.word PRTC_IDX 
      00A180                       6450 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A180 CD 90                    1 	.word LINK 
                           0024E3     2 	LINK=.
      0024E3                          3 PRTB:
      00A182 CD                       4 	.byte 4+F_IFUNC 	
      00A183 A1 01 27 03              5 	.ascii "PRTB"
      00A187 CC 88                    6 	.word PRTB_IDX 
      0024EA                       6451 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A189 FF 85                    1 	.word LINK 
                           0024EC     2 	LINK=.
      0024EC                          3 PRTA:
      00A18B 9F                       4 	.byte 4+F_IFUNC 	
      00A18C A4 0F 5F 5C              5 	.ascii "PRTA"
      00A190 4D 27                    6 	.word PRTA_IDX 
      0024F3                       6452 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A192 04 58                    1 	.word LINK 
                           0024F5     2 	LINK=.
      0024F5                          3 PRINT:
      00A194 4A                       4 	.byte 5 	
      00A195 20 F9 A6 84 81           5 	.ascii "PRINT"
      00A19A 00 74                    6 	.word PRT_IDX 
      0024FD                       6453 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A19A CD 90                    1 	.word LINK 
                           0024FF     2 	LINK=.
      0024FF                          3 POUT:
      00A19C CD                       4 	.byte 4+F_IFUNC 	
      00A19D A1 01 27 03              5 	.ascii "POUT"
      00A1A1 CC 88                    6 	.word POUT_IDX 
      002506                       6454 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A1A3 FF 85                    1 	.word LINK 
                           002508     2 	LINK=.
      002508                          3 POKE:
      00A1A5 53                       4 	.byte 4 	
      00A1A6 A6 84 81 45              5 	.ascii "POKE"
      00A1A9 00 70                    6 	.word POKE_IDX 
      00250F                       6455 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A1A9 85 52                    1 	.word LINK 
                           002511     2 	LINK=.
      002511                          3 PINP:
      00A1AB 04                       4 	.byte 4+F_IFUNC 	
      00A1AC 89 90 CE 00              5 	.ascii "PINP"
      00A1B0 05 17                    6 	.word PINP_IDX 
      002518                       6456 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A1B2 03 90                    1 	.word LINK 
                           00251A     2 	LINK=.
      00251A                          3 PEEK:
      00A1B4 CE                       4 	.byte 4+F_IFUNC 	
      00A1B5 00 01 17 05              5 	.ascii "PEEK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1B9 72 5C                    6 	.word PEEK_IDX 
      002521                       6457 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A1BB 00 21                    1 	.word LINK 
                           002523     2 	LINK=.
      002523                          3 PMODE:
      00A1BD 81                       4 	.byte 5 	
      00A1BE 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A1BE 72 5D                    6 	.word PMODE_IDX 
      00252B                       6458 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A1C0 00 21                    1 	.word LINK 
                           00252D     2 	LINK=.
      00252D                          3 PAUSE:
      00A1C2 26                       4 	.byte 5 	
      00A1C3 03 CC 88 FF 45           5 	.ascii "PAUSE"
      00A1C7 00 68                    6 	.word PAUSE_IDX 
      002535                       6459 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A1C7 CD 92                    1 	.word LINK 
                           002537     2 	LINK=.
      002537                          3 PAD:
      00A1C9 1D                       4 	.byte 3+F_IFUNC 	
      00A1CA A1 84 27                 5 	.ascii "PAD"
      00A1CD 03 CC                    6 	.word PAD_IDX 
      00253D                       6460 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A1CF 88 FF                    1 	.word LINK 
                           00253F     2 	LINK=.
      00A1D1                          3 OR:
      00A1D1 5D                       4 	.byte 2+F_IFUNC 	
      00A1D2 26 10                    5 	.ascii "OR"
      00A1D4 1E 03                    6 	.word OR_IDX 
      002544                       6461 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A1D6 CF 00                    1 	.word LINK 
                           002546     2 	LINK=.
      002546                          3 ODR:
      00A1D8 05                       4 	.byte 3+F_IFUNC 	
      00A1D9 E6 02 C7                 5 	.ascii "ODR"
      00A1DC 00 04                    6 	.word ODR_IDX 
      00254C                       6462 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A1DE 1E 05                    1 	.word LINK 
                           00254E     2 	LINK=.
      00254E                          3 NOT:
      00A1E0 CF                       4 	.byte 3+F_IFUNC 	
      00A1E1 00 01 81                 5 	.ascii "NOT"
      00A1E4 00 60                    6 	.word NOT_IDX 
      002554                       6463 	_dict_entry,3,NEW,NEW_IDX;new
      00A1E4 85 5B                    1 	.word LINK 
                           002556     2 	LINK=.
      002556                          3 NEW:
      00A1E6 04                       4 	.byte 3 	
      00A1E7 72 5A 00                 5 	.ascii "NEW"
      00A1EA 21 FC                    6 	.word NEW_IDX 
      00A1EC                       6464 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A1EC AE 00                    1 	.word LINK 
                           00255E     2 	LINK=.
      00255E                          3 NEXT:
      00A1EE 00                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1EF A6 84 81 54              5 	.ascii "NEXT"
      00A1F2 00 5C                    6 	.word NEXT_IDX 
      002565                       6465 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A1F2 AE 00                    1 	.word LINK 
                           002567     2 	LINK=.
      002567                          3 MULDIV:
      00A1F4 01                       4 	.byte 6+F_IFUNC 	
      00A1F5 A6 84 81 44 49 56        5 	.ascii "MULDIV"
      00A1F8 00 5A                    6 	.word MULDIV_IDX 
      002570                       6466 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A1F8 AE 00                    1 	.word LINK 
                           002572     2 	LINK=.
      002572                          3 LSHIFT:
      00A1FA 02                       4 	.byte 6+F_IFUNC 	
      00A1FB A6 84 81 49 46 54        5 	.ascii "LSHIFT"
      00A1FE 00 58                    6 	.word LSHIFT_IDX 
      00257B                       6467 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A1FE AE 00                    1 	.word LINK 
                           00257D     2 	LINK=.
      00257D                          3 LOG:
      00A200 03                       4 	.byte 3+F_IFUNC 	
      00A201 A6 84 81                 5 	.ascii "LOG"
      00A204 00 56                    6 	.word LOG_IDX 
      002583                       6468 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A204 AE 00                    1 	.word LINK 
                           002585     2 	LINK=.
      002585                          3 LOAD:
      00A206 04                       4 	.byte 4 	
      00A207 A6 84 81 44              5 	.ascii "LOAD"
      00A20A 00 54                    6 	.word LOAD_IDX 
      00258C                       6469 	_dict_entry 4,LIST,LIST_IDX;list
      00A20A AE 00                    1 	.word LINK 
                           00258E     2 	LINK=.
      00258E                          3 LIST:
      00A20C 05                       4 	.byte 4 	
      00A20D A6 84 81 54              5 	.ascii "LIST"
      00A210 00 52                    6 	.word LIST_IDX 
      002595                       6470 	_dict_entry 3,LET,LET_IDX;let 
      00A210 AE 00                    1 	.word LINK 
                           002597     2 	LINK=.
      002597                          3 LET:
      00A212 06                       4 	.byte 3 	
      00A213 A6 84 81                 5 	.ascii "LET"
      00A216 00 50                    6 	.word LET_IDX 
      00259D                       6471 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A216 AE 00                    1 	.word LINK 
                           00259F     2 	LINK=.
      00259F                          3 KEY:
      00A218 07                       4 	.byte 3+F_IFUNC 	
      00A219 A6 84 81                 5 	.ascii "KEY"
      00A21C 00 4E                    6 	.word KEY_IDX 
      0025A5                       6472 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A21C AE 00                    1 	.word LINK 
                           0025A7     2 	LINK=.
      0025A7                          3 IWDGREF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A21E 08                       4 	.byte 7 	
      00A21F A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A222 00 4C                    6 	.word IWDGREF_IDX 
      0025B1                       6473 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A222 A6 84                    1 	.word LINK 
                           0025B3     2 	LINK=.
      0025B3                          3 IWDGEN:
      00A224 AE                       4 	.byte 6 	
      00A225 00 00 81 47 45 4E        5 	.ascii "IWDGEN"
      00A228 00 4A                    6 	.word IWDGEN_IDX 
      0025BC                       6474 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A228 A6 84                    1 	.word LINK 
                           0025BE     2 	LINK=.
      0025BE                          3 INVERT:
      00A22A AE                       4 	.byte 6+F_IFUNC 	
      00A22B 00 01 81 45 52 54        5 	.ascii "INVERT"
      00A22E 00 48                    6 	.word INVERT_IDX 
      0025C7                       6475 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A22E A6 84                    1 	.word LINK 
                           0025C9     2 	LINK=.
      0025C9                          3 INPUT:
      00A230 AE                       4 	.byte 5 	
      00A231 00 02 81 55 54           5 	.ascii "INPUT"
      00A234 00 46                    6 	.word INPUT_IDX 
      0025D1                       6476 	_dict_entry,2,IF,IF_IDX;if 
      00A234 A6 84                    1 	.word LINK 
                           0025D3     2 	LINK=.
      0025D3                          3 IF:
      00A236 AE                       4 	.byte 2 	
      00A237 00 03                    5 	.ascii "IF"
      00A239 81 44                    6 	.word IF_IDX 
      00A23A                       6477 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A23A A6 84                    1 	.word LINK 
                           0025DA     2 	LINK=.
      0025DA                          3 IDR:
      00A23C AE                       4 	.byte 3+F_IFUNC 	
      00A23D 00 04 81                 5 	.ascii "IDR"
      00A240 00 42                    6 	.word IDR_IDX 
      0025E0                       6478 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A240 A6 84                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 HEX:
      00A242 AE                       4 	.byte 3 	
      00A243 00 01 81                 5 	.ascii "HEX"
      00A246 00 40                    6 	.word HEX_IDX 
      0025E8                       6479 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A246 A6 84                    1 	.word LINK 
                           0025EA     2 	LINK=.
      0025EA                          3 GPIO:
      00A248 AE                       4 	.byte 4+F_IFUNC 	
      00A249 00 00 81 4F              5 	.ascii "GPIO"
      00A24C 00 3E                    6 	.word GPIO_IDX 
      0025F1                       6480 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A24C A6 84                    1 	.word LINK 
                           0025F3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0025F3                          3 GOTO:
      00A24E AE                       4 	.byte 4 	
      00A24F 40 00 81 4F              5 	.ascii "GOTO"
      00A252 00 3C                    6 	.word GOTO_IDX 
      0025FA                       6481 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A252 55 00                    1 	.word LINK 
                           0025FC     2 	LINK=.
      0025FC                          3 GOSUB:
      00A254 04                       4 	.byte 5 	
      00A255 00 02 81 55 42           5 	.ascii "GOSUB"
      00A258 00 3A                    6 	.word GOSUB_IDX 
      002604                       6482 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A258 CD 91                    1 	.word LINK 
                           002606     2 	LINK=.
      002606                          3 FORGET:
      00A25A D1                       4 	.byte 6 	
      00A25B A1 84 27 03 CC 88        5 	.ascii "FORGET"
      00A261 FF CD                    6 	.word FORGET_IDX 
      00260F                       6483 	_dict_entry,3,FOR,FOR_IDX;for 
      00A263 84 82                    1 	.word LINK 
                           002611     2 	LINK=.
      002611                          3 FOR:
      00A265 5D                       4 	.byte 3 	
      00A266 26 05 A6                 5 	.ascii "FOR"
      00A269 05 CC                    6 	.word FOR_IDX 
      002617                       6484 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A26B 89 01                    1 	.word LINK 
                           002619     2 	LINK=.
      00A26D                          3 FCPU:
      00A26D 90                       4 	.byte 4 	
      00A26E 93 EE 04 A3              5 	.ascii "FCPU"
      00A272 A2 52                    6 	.word FCPU_IDX 
      002620                       6485 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A274 26 F2                    1 	.word LINK 
                           002622     2 	LINK=.
      002622                          3 EEPROM:
      00A276 90                       4 	.byte 6+F_IFUNC 	
      00A277 CF 00 07 90 E6 02        5 	.ascii "EEPROM"
      00A27D C7 00                    6 	.word EEPROM_IDX 
      00262B                       6486 	_dict_entry,3,END,END_IDX;cmd_end  
      00A27F 0A 35                    1 	.word LINK 
                           00262D     2 	LINK=.
      00262D                          3 END:
      00A281 06                       4 	.byte 3 	
      00A282 00 09 81                 5 	.ascii "END"
      00A285 00 30                    6 	.word END_IDX 
      002633                       6487 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A285 72 5F                    1 	.word LINK 
                           002635     2 	LINK=.
      002635                          3 DWRITE:
      00A287 00                       4 	.byte 6+F_CMD 	
      00A288 07 72 5F 00 08 72        5 	.ascii "DWRITE"
      00A28E 5F 00                    6 	.word DWRITE_IDX 
      00263E                       6488 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A290 09 72                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002640     2 	LINK=.
      002640                          3 DREAD:
      00A292 5F                       4 	.byte 5+F_IFUNC 	
      00A293 00 0A CE 00 1D           5 	.ascii "DREAD"
      00A298 00 2C                    6 	.word DREAD_IDX 
      002648                       6489 	_dict_entry,2,DO,DO_IDX;do_loop
      00A298 C3 00                    1 	.word LINK 
                           00264A     2 	LINK=.
      00264A                          3 DO:
      00A29A 1F                       4 	.byte 2 	
      00A29B 24 1B                    5 	.ascii "DO"
      00A29D 90 93                    6 	.word DO_IDX 
      00264F                       6490 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A29F EE 04                    1 	.word LINK 
                           002651     2 	LINK=.
      002651                          3 DIR:
      00A2A1 1C                       4 	.byte 3 	
      00A2A2 A7 8C FE                 5 	.ascii "DIR"
      00A2A5 A3 A2                    6 	.word DIR_IDX 
      002657                       6491 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A2A7 52 26                    1 	.word LINK 
                           002659     2 	LINK=.
      002659                          3 DEC:
      00A2A9 1A                       4 	.byte 3 	
      00A2AA 90 CF 00                 5 	.ascii "DEC"
      00A2AD 07 90                    6 	.word DEC_IDX 
      00265F                       6492 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A2AF E6 02                    1 	.word LINK 
                           002661     2 	LINK=.
      002661                          3 DDR:
      00A2B1 C7                       4 	.byte 3+F_IFUNC 	
      00A2B2 00 0A 35                 5 	.ascii "DDR"
      00A2B5 06 00                    6 	.word DDR_IDX 
      002667                       6493 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A2B7 09 72                    1 	.word LINK 
                           002669     2 	LINK=.
      002669                          3 DATALN:
      00A2B9 5D                       4 	.byte 6 	
      00A2BA 00 0A 26 05 A6 0C        5 	.ascii "DATALN"
      00A2C0 CC 89                    6 	.word DATALN_IDX 
      002672                       6494 	_dict_entry,4,DATA,DATA_IDX;data  
      00A2C2 01 81                    1 	.word LINK 
                           002674     2 	LINK=.
      00A2C4                          3 DATA:
      00A2C4 93                       4 	.byte 4 	
      00A2C5 E6 02 C7 00              5 	.ascii "DATA"
      00A2C9 0E 72                    6 	.word DATA_IDX 
      00267B                       6495 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A2CB 5F 00                    1 	.word LINK 
                           00267D     2 	LINK=.
      00267D                          3 CRL:
      00A2CD 0D                       4 	.byte 3+F_IFUNC 	
      00A2CE 72 BB 00                 5 	.ascii "CRL"
      00A2D1 0D 20                    6 	.word CRL_IDX 
      002683                       6496 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A2D3 C4 7D                    1 	.word LINK 
                           002685     2 	LINK=.
      00A2D4                          3 CRH:
      00A2D4 52                       4 	.byte 3+F_IFUNC 	
      00A2D5 06 52 48                 5 	.ascii "CRH"
      00A2D6 00 1C                    6 	.word CRH_IDX 
      00268B                       6497 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A2D6 C6 00                    1 	.word LINK 
                           00268D     2 	LINK=.
      00268D                          3 CHAR:
      00A2D8 09                       4 	.byte 4+F_CFUNC 	
      00A2D9 C1 00 0A 27              5 	.ascii "CHAR"
      00A2DD 37 CD                    6 	.word CHAR_IDX 
      002694                       6498 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A2DF 96 24                    1 	.word LINK 
                           002696     2 	LINK=.
      002696                          3 BYE:
      00A2E1 CE                       4 	.byte 3 	
      00A2E2 00 07 CF                 5 	.ascii "BYE"
      00A2E5 00 05                    6 	.word BYE_IDX 
      00269C                       6499 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A2E7 55 00                    1 	.word LINK 
                           00269E     2 	LINK=.
      00269E                          3 BTOGL:
      00A2E9 09                       4 	.byte 5 	
      00A2EA 00 02 55 00 0A           5 	.ascii "BTOGL"
      00A2EF 00 04                    6 	.word BTOGL_IDX 
      0026A6                       6500 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A2F1 CD 91                    1 	.word LINK 
                           0026A8     2 	LINK=.
      0026A8                          3 BTEST:
      00A2F3 D1                       4 	.byte 5+F_IFUNC 	
      00A2F4 A1 84 27 03 CC           5 	.ascii "BTEST"
      00A2F9 88 FF                    6 	.word BTEST_IDX 
      00A2FB                       6501 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A2FB 1F 05                    1 	.word LINK 
                           0026B2     2 	LINK=.
      0026B2                          3 BSET:
      00A2FD CD                       4 	.byte 4 	
      00A2FE 89 F1 CE 00              5 	.ascii "BSET"
      00A302 05 CF                    6 	.word BSET_IDX 
      0026B9                       6502 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A304 00 07                    1 	.word LINK 
                           0026BB     2 	LINK=.
      0026BB                          3 BRES:
      00A306 55                       4 	.byte 4 	
      00A307 00 02 00 09              5 	.ascii "BRES"
      00A30B CD 96                    6 	.word BRES_IDX 
      0026C2                       6503 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A30D 34 1E                    1 	.word LINK 
                           0026C4     2 	LINK=.
      0026C4                          3 BIT:
      00A30F 05                       4 	.byte 3+F_IFUNC 	
      00A310 A6 84 5B                 5 	.ascii "BIT"
      00A313 06 81                    6 	.word BIT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A315                       6504 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A315 90 CE                    1 	.word LINK 
                           0026CC     2 	LINK=.
      0026CC                          3 AWU:
      00A317 00                       4 	.byte 3 	
      00A318 07 72 5F                 5 	.ascii "AWU"
      00A31B 00 07                    6 	.word AWU_IDX 
      0026D2                       6505 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A31D 72 5F                    1 	.word LINK 
                           0026D4     2 	LINK=.
      0026D4                          3 AUTORUN:
      00A31F 00                       4 	.byte 7 	
      00A320 08 72 5F 00 09 72 5F     5 	.ascii "AUTORUN"
      00A327 00 0A                    6 	.word AUTORUN_IDX 
      0026DE                       6506 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A329 CD A2                    1 	.word LINK 
                           0026E0     2 	LINK=.
      0026E0                          3 ASC:
      00A32B C4                       4 	.byte 3+F_IFUNC 	
      00A32C 20 A8 43                 5 	.ascii "ASC"
      00A32E 00 08                    6 	.word ASC_IDX 
      0026E6                       6507 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A32E CD 90                    1 	.word LINK 
                           0026E8     2 	LINK=.
      0026E8                          3 AND:
      00A330 D2                       4 	.byte 3+F_IFUNC 	
      00A331 A1 02 27                 5 	.ascii "AND"
      00A334 03 CC                    6 	.word AND_IDX 
      0026EE                       6508 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A336 88 FF                    1 	.word LINK 
                           0026F0     2 	LINK=.
      00A338                          3 ADCREAD:
      00A338 72                       4 	.byte 7+F_IFUNC 	
      00A339 12 50 C7 85 5D 27 21     5 	.ascii "ADCREAD"
      00A340 85 A6                    6 	.word ADCREAD_IDX 
      0026FA                       6509 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A342 08 42                    1 	.word LINK 
                           0026FC     2 	LINK=.
      0026FC                          3 ADCON:
      00A344 9F                       4 	.byte 5 	
      00A345 C7 52 00 72 1A           5 	.ascii "ADCON"
      00A34A 50 14                    6 	.word ADCON_IDX 
      002704                       6510 kword_dict:
      002704                       6511 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A34C 72 1A                    1 	.word LINK 
                           002706     2 	LINK=.
      002706                          3 ABS:
      00A34E 50                       4 	.byte 3+F_IFUNC 	
      00A34F 16 72 14                 5 	.ascii "ABS"
      00A352 52 00                    6 	.word ABS_IDX 
                                   6512 
                                   6513 ;comands and fonctions address table 	
      00270C                       6514 code_addr:
      00A354 72 12 52 01 72 10 52  6515 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             01 72 1C 52 00 81 4F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



             21 00
      00A361 16 6B 16 5B 16 8C 16  6516 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             7C 1D CD 1D 32 21 BA
      00A361 5B 02 A6 82 C4 52 03  6517 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             A1 02 26 F7 72 1D 52
             00 72 13 50
      00A373 C7 72 1B 50 16 81 16  6518 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             E7 1C 12 17 E2 17 C7
             1D 80
      00A379 12 36 21 A8 16 D3 15  6519 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             C4 21 1A 20 AA 20 E0
             1D 6B
      00A379 A6 78 C5 52 03 27 04  6520 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             72 5F 52 03 81 17 67
             19 F4
      00A385 20 9D 21 A2 1E CA 23  6521 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             65 1E 3C 1F 38 16 C2
             21 C6
      00A385 88 CD A3 79 84 72 03  6522 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             52 03 FB C7 52 04 72
             01 52
      00A395 03 FB C6 52 04 81 21  6523 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             9C 1D 73 22 54 05 DA
             16 30
      00A39B 22 05 18 02 1F B4 1F  6524 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             13 18 20 1A E5 11 F5
             12 40
      00A39B A6 FF 72 01 52 03 E3  6525 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             C6 52 04 81 40 19 A8
             1E 98
      00A3A6 20 81 20 90 17 10 18  6526 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             89 12 4A 1D AA 21 3E
             1D B0
      00A3A6 CD 91 D1 A1 84 27 03  6527 	.word wait,words,write,bit_xor ; 96..103 
             CC
      00A3AE 88 FF                 6528 	.word 0 
                                   6529 
      00A3B0                       6530 	.bndry 128 ; align on FLASH block.
                                   6531 ; free space for user application  
      002800                       6532 user_space:
                                   6533 ; USR() function test
      00A3B0 9F               [ 2] 6534 	pushw x 
      00A3B1 CD A3 85 CD      [ 1] 6535 	bset PC_ODR,#5 
      00A3B5 89               [ 2] 6536 	popw x 
      00A3B6 F1 A1 09         [ 4] 6537 	call pause02 
      00A3B9 26 02 20 E9      [ 1] 6538 	bres PC_ODR,#5 
      00A3BD 4D               [ 4] 6539 	ret
                                   6540 
                                   6541 	.area FLASH_DRIVE (ABS)
      010000                       6542 	.org 0x10000
      010000                       6543 fdrive:
                                   6544 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002706 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      0026FC R
    ADCON_ID=  000002     |   5 ADCREAD    0026F0 R   |     ADCREAD_=  000004 
    ADC_CR1 =  005401     |     ADC_CR1_=  000000     |     ADC_CR1_=  000001 
    ADC_CR1_=  000004     |     ADC_CR1_=  000005     |     ADC_CR1_=  000006 
    ADC_CR2 =  005402     |     ADC_CR2_=  000003     |     ADC_CR2_=  000004 
    ADC_CR2_=  000005     |     ADC_CR2_=  000006     |     ADC_CR2_=  000001 
    ADC_CR3 =  005403     |     ADC_CR3_=  000007     |     ADC_CR3_=  000006 
    ADC_CSR =  005400     |     ADC_CSR_=  000006     |     ADC_CSR_=  000004 
    ADC_CSR_=  000000     |     ADC_CSR_=  000001     |     ADC_CSR_=  000002 
    ADC_CSR_=  000003     |     ADC_CSR_=  000007     |     ADC_CSR_=  000005 
    ADC_DRH =  005404     |     ADC_DRL =  005405     |     ADC_TDRH=  005406 
    ADC_TDRL=  005407     |     ADDR    =  000001     |     ADR     =  000002 
    AFR     =  004803     |     AFR0_ADC=  000000     |     AFR1_TIM=  000001 
    AFR2_CCO=  000002     |     AFR3_TIM=  000003     |     AFR4_TIM=  000004 
    AFR5_TIM=  000005     |     AFR6_I2C=  000006     |     AFR7_BEE=  000007 
  5 AND        0026E8 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        0026E0 R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    0026D4 R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        0026CC R   |   5 AWUHandl   000001 R
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_CSR_=  000004 
    AWU_IDX =  00000C     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BCNT    =  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        0026C4 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       0026BB R   |     BRES_IDX=  000010 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       0026B2 R
    BSET_IDX=  000012     |     BSIZE   =  000001     |   5 BTEST      0026A8 R
    BTEST_ID=  000014     |   5 BTOGL      00269E R   |     BTOGL_ID=  000016 
    BTW     =  000001     |   5 BYE        002696 R   |     BYE_IDX =  000018 
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
    CFG_GCR_=  000000     |   5 CHAR       00268D R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
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
    CMDX    =  000001     |     CMD_END =  000002     |     CNT     =  000006 
    CNTR    =  000003     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        002685 R   |     CRH_IDX =  00001C     |   5 CRL        00267D R
    CRL_IDX =  00001E     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       002674 R   |   5 DATALN     002669 R   |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        002661 R
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        002659 R
    DEC_IDX =  000026     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002651 R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         00264A R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

  5 DREAD      002640 R   |     DREAD_ID=  00002C     |   5 DWRITE     002635 R
    DWRITE_I=  00002E     |   5 EEPROM     002622 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        00262D R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002619 R   |     FCPU_IDX=  000034     |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
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
  5 FOR        002611 R   |   5 FORGET     002606 R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      0025FC R
    GOSUB_ID=  00003A     |   5 GOTO       0025F3 R   |     GOTO_IDX=  00003C 
  5 GPIO       0025EA R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        0025E2 R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   5 IDR        0025DA R   |     IDR_IDX =  000042 
  5 IF         0025D3 R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      0025C9 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000046     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
  5 INVERT     0025BE R   |     INVERT_I=  000048     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     0025B3 R
    IWDGEN_I=  00004A     |   5 IWDGREF    0025A7 R   |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00259F R   |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        002597 R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  002706 R   |   5 LIST       00258E R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       002585 R   |     LOAD_IDX=  000054 
  5 LOG        00257D R   |     LOG_IDX =  000056     |   5 LSHIFT     002572 R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     002567 R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        002556 R   |     NEW_FREE=  000001     |     NEW_IDX =  00005E 
  5 NEXT       00255E R   |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    NOPTBL  =  00487F     |   5 NOT        00254E R   |     NOT_IDX =  000060 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        002546 R   |     ODR_IDX =  000062 
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         00253F R   |     OR_IDX  =  000064     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        002537 R   |     PAD_IDX =  000066 
    PAD_SIZE=  000080     |   5 PAUSE      00252D R   |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       00251A R   |     PEEK_IDX=  00006C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       002511 R
    PINP_IDX=  00006E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      002523 R
    PMODE_ID=  00006A     |   5 POKE       002508 R   |     POKE_IDX=  000070 
    PORT    =  000003     |   5 POUT       0024FF R   |     POUT_IDX=  000072 
    PREV    =  000001     |   5 PRINT      0024F5 R   |   5 PRTA       0024EC R
    PRTA_IDX=  000076     |   5 PRTB       0024E3 R   |     PRTB_IDX=  000078 
  5 PRTC       0024DA R   |     PRTC_IDX=  00007A     |   5 PRTD       0024D1 R
    PRTD_IDX=  00007C     |   5 PRTE       0024C8 R   |     PRTE_IDX=  00007E 
  5 PRTF       0024BF R   |     PRTF_IDX=  000080     |   5 PRTG       0024B6 R
    PRTG_IDX=  000082     |   5 PRTH       0024AD R   |     PRTH_IDX=  000084 
  5 PRTI       0024A4 R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       00249B R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       002492 R   |     READ_IDX=  00008A 
  5 REBOOT     002487 R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     00247C R   |     REM_IDX =  00008E     |   5 RESTORE    002470 R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     002465 R
    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        00245D R   |     RND_IDX =  000094     |     ROP     =  004800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    RS      =  00001E     |   5 RSHIFT     002452 R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        00244A R   |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |   5 SAVE       002441 R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       002438 R
    SHOW_IDX=  00009C     |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       00242F R   |     SIZE_IDX=  00009E     |     SKIP    =  000005 
  5 SLEEP      002425 R   |     SLEEP_ID=  0000A0     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   5 SPIEN      002411 R
    SPIEN_ID=  0000A4     |   5 SPIRD      00241B R   |     SPIRD_ID=  0000A2 
  5 SPISEL     002406 R   |     SPISEL_I=  0000A6     |   5 SPIWR      0023FC R
    SPIWR_ID=  0000A8     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       0023F3 R   |     STEP_IDX=  0000AA 
  5 STOP       0023EA R   |     STOP_IDX=  0000AC     |     STR     =  000003 
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0023E0 R
    TICKS_ID=  0000AE     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    0023CA R
  5 TIMER      0023D6 R   |     TIMER_ID=  0000B0     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000006     |     TK_CFUNC=  000082 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    TK_CHAR =  000003     |     TK_CMD  =  000080     |     TK_COLON=  000001 
    TK_COMMA=  000009     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LE   =  000036     |     TK_LPARE=  000007 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000002     |     TK_RPARE=  000008 
    TK_SHARP=  00000A     |     TK_VAR  =  000085     |     TMROUT_I=  0000B2 
  5 TO         0023C3 R   |   5 TONE       0023BA R   |     TONE_IDX=  0000B6 
    TO_IDX  =  0000B4     |   5 Timer4Up   00004F R   |     U1      =  000001 
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
    UART3_TX=  000005     |     UART_BRR=  000002     |     UART_BRR=  000003 
    UART_CR1=  000004     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
    UART_CR2=  000005     |     UART_CR2=  000004     |     UART_CR2=  000002 
    UART_CR2=  000005     |     UART_CR2=  000001     |     UART_CR2=  000000 
    UART_CR2=  000006     |     UART_CR2=  000003     |     UART_CR2=  000007 
    UART_CR3=  000006     |     UART_CR3=  000003     |     UART_CR3=  000001 
    UART_CR3=  000002     |     UART_CR3=  000000     |     UART_CR3=  000006 
    UART_CR3=  000004     |     UART_CR3=  000005     |     UART_CR4=  000007 
    UART_CR4=  000000     |     UART_CR4=  000001     |     UART_CR4=  000002 
    UART_CR4=  000003     |     UART_CR4=  000004     |     UART_CR4=  000006 
    UART_CR4=  000005     |     UART_CR5=  000008     |     UART_CR5=  000003 
    UART_CR5=  000001     |     UART_CR5=  000002     |     UART_CR5=  000004 
    UART_CR5=  000005     |     UART_CR6=  000009     |     UART_CR6=  000004 
    UART_CR6=  000007     |     UART_CR6=  000001     |     UART_CR6=  000002 
    UART_CR6=  000000     |     UART_CR6=  000005     |     UART_DR =  000001 
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  5 UBOUND     0023AF R   |     UBOUND_I=  0000B8     |   5 UBTN_Han   000092 R
  5 UFLASH     0023A4 R   |     UFLASH_I=  0000BA     |   5 UNTIL      00239A R
    UNTIL_ID=  0000BC     |     US      =  00001F     |   5 USER_ABO   00009A R
  5 USR        002392 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000BE     |   5 Uart1RxH   00000F R
  5 UserButt   000065 R   |     VAR_ADDR=  000006     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       002389 R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      00237F R   |     WORDS_ID=  0000C2     |   5 WRITE      002375 R
    WRITE_ID=  0000C4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        00236D R   |     XOR_IDX =  0000C6 
    XREG    =  000003     |     XSAVE   =  000005     |     YSAVE   =  000007 
  5 abs        001E9E R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
  1 acc8       00000D GR  |   5 add_char   0014FE R   |   5 add_spac   001328 R
  5 analog_r   001909 R   |   5 arduino_   001F94 R   |   5 arg_list   001052 R
  1 array_si   000021 R   |   5 ascii      001D44 R   |   5 at_tst     000CB6 R
  5 atoi24     000DC7 GR  |   5 atoi_exi   000E2D R   |   5 autorun    001DD6 R
  5 autorun_   0006D4 R   |   5 awu        001E4F R   |   5 awu02      001E59 R
  5 bad_port   001DA5 R   |   1 base       00000A R   |   1 basicptr   000004 GR
  5 beep       001896 R   |   5 beep_1kh   001880 GR  |   5 bin_exit   000B94 R
  5 bit_and    001EB2 R   |   5 bit_or     001ECA R   |   5 bit_rese   00166B R
  5 bit_set    00165B R   |   5 bit_test   00168C R   |   5 bit_togg   00167C R
  5 bit_xor    001EE2 R   |   5 bitmask    002100 R   |   5 bkslsh_t   000C63 R
  5 block_er   0001BB R   |   5 break_po   0019D6 R   |   5 bye        001DCD R
  5 cancel_a   00069C R   |   5 char       001D32 R   |   5 clear_ba   0006E9 R
  5 clear_va   000563 R   |   5 clock_in   0000B5 R   |   5 cmd_end    001879 R
  5 cmd_line   000909 R   |   5 cmd_name   000FC1 R   |   5 cmp_name   001A77 R
  5 code_add   00270C R   |   5 cold_sta   0005DA R   |   5 colon_ts   000C8A R
  5 comma_ts   000C95 R   |   5 comp_msg   00085E R   |   5 compile    0004F0 R
  5 const_cr   0021B4 R   |   5 const_cr   0021BA R   |   5 const_dd   0021AE R
  5 const_ee   0021CC R   |   5 const_id   0021A8 R   |   5 const_in   0021C6 R
  5 const_od   0021A2 R   |   5 const_ou   0021C0 R   |   5 const_po   00216C R
  5 const_po   002172 R   |   5 const_po   002178 R   |   5 const_po   00217E R
  5 const_po   002184 R   |   5 const_po   00218A R   |   5 const_po   002190 R
  5 const_po   002196 R   |   5 const_po   00219C R   |   5 convert_   000B0B R
  5 copy_com   000CEB R   |   1 count      000003 GR  |   5 cp_loop    001001 R
  5 cpy_cmd_   001313 R   |   5 cpy_quot   00134C R   |   5 create_g   000453 R
  5 cs_high    002360 R   |   5 cstk_pro   00120F R   |   5 dash_tst   000CAB R
  5 data       0021D2 R   |   1 data_len   000009 R   |   5 data_lin   0021D8 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   002218 R
  5 dbl_sign   000F29 R   |   5 dec_base   00123B R   |   5 decomp_l   0013FD R
  5 decompil   0013B6 GR  |   5 del_line   000426 R   |   5 digital_   00193D R
  5 digital_   00196D R   |   5 dir_loop   001C85 R   |   5 director   001C79 R
  5 disk_fre   001A64 R   |   5 div32_16   000F33 R   |   5 divide     000F8A R
  5 divu24_8   000A4E R   |   5 dneg       000F1E R   |   5 do_loop    002129 R
  5 do_progr   0001AE R   |   5 drive_fr   001CEE R   |   5 enable_i   0020AA R
  5 eql_tst    000D40 R   |   5 equal      001511 R   |   5 erase_fl   0001DA R
  5 err_bad_   0007C9 R   |   5 err_buf_   00083F R   |   5 err_cmd_   00078D R
  5 err_div0   000752 R   |   5 err_dupl   0007A7 R   |   5 err_math   000739 R
  5 err_mem_   00071E R   |   5 err_msg    0006FE R   |   5 err_no_a   0007D5 R
  5 err_no_d   000808 R   |   5 err_no_f   00082C R   |   5 err_no_l   000761 R
  5 err_no_p   000818 R   |   5 err_not_   0007B8 R   |   5 err_run_   000777 R
  5 err_synt   00072B R   |   5 escaped    000B20 R   |   5 expect     001040 R
  5 expr_exi   00119A R   |   5 expressi   001151 R   |   5 factor     0010A2 R
  1 farptr     000016 R   |   5 fcpu       001F2C R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001CE6 R   |   5 first_li   0012C0 R
  1 flags      000023 R   |   5 for        0016E7 R   |   5 forget     001C12 R
  1 free_ram   000063 R   |   5 func_arg   00104D R   |   5 func_not   00209D R
  5 ge         001513 R   |   5 get_arra   00107D R   |   5 get_cmd_   001395 R
  5 get_targ   0017B1 R   |   5 get_tick   001E98 R   |   5 get_toke   000BFC R
  5 getc       0002C9 GR  |   5 gosub      0017E2 R   |   5 goto       0017C7 R
  5 gpio       001D80 R   |   5 gt         00150F R   |   5 gt_tst     000D4B R
  5 hex_base   001236 R   |   5 hex_dump   000359 R   |   5 if         0016D3 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 incr_far   001A24 R   |   5 input_ex   00162D R   |   5 input_lo   0015C6 R
  5 input_va   0015C4 R   |   5 insert_l   00047F R   |   5 insert_l   0004ED R
  5 interp_l   00094A R   |   5 interpre   000925 R   |   5 invert     00211A R
  5 is_alnum   00058B R   |   5 is_alpha   000571 R   |   5 is_digit   000582 R
  5 itoa       0009E9 R   |   5 itoa_loo   000A08 R   |   5 jp_to_ta   0017D5 R
  5 key        001D6B R   |   5 kw_loop    000BB0 R   |   5 kword_di   002704 R
  5 kword_en   00236B R   |   5 le         001518 R   |   5 leading_   0020F0 R
  5 let        00126C R   |   5 let_arra   00127A R   |   5 let_var    00127D R
  5 lines_sk   0012C3 R   |   5 list       001297 R   |   5 list_exi   001305 R
  5 list_loo   0012E3 R   |   5 load       001BE2 R   |   5 load_aut   0006AB R
  5 load_fil   001BB1 R   |   5 log2       0020E5 R   |   5 logical_   002093 R
  5 long_div   000F06 R   |   5 loop_bac   001794 R   |   1 loop_dep   000020 R
  5 loop_don   0017A9 R   |   5 lshift     001EFA R   |   5 lt         001516 R
  5 lt_tst     000D74 R   |   5 modulo     000FA0 R   |   5 move       0003C0 GR
  5 move_dow   0003DE R   |   5 move_era   000140 R   |   5 move_exi   0003FF R
  5 move_loo   0003E3 R   |   5 move_prg   000174 R   |   5 move_up    0003D0 R
  5 mul_char   001500 R   |   5 muldiv     000FA5 R   |   5 multiply   000ED1 R
  5 mulu24_8   000A76 R   |   5 nbr_tst    000C2F R   |   5 ne         00151B R
  5 neg_acc2   000AB0 R   |   5 new        0019F4 R   |   5 next       001767 R
  5 next_lin   00092D R   |   5 next_tok   000971 R   |   5 no_match   001013 R
  5 other      000D9D R   |   3 pad        0016E0 R   |   5 pad_ref    002365 R
  5 parse_bi   000B72 R   |   5 parse_in   000B28 R   |   5 parse_ke   000BAF R
  5 parse_qu   000AD3 R   |   5 pause      001E3C R   |   5 pause02    001E46 R
  5 peek       0016C2 R   |   5 pin_mode   001F38 R   |   5 plus_tst   000D14 R
  5 poke       0016B3 R   |   5 power_ad   0018CD R   |   5 prcnt_ts   000D35 R
  5 print      00153E R   |   5 print_ex   001598 R   |   5 print_in   0009CD R
  5 printxy    000E44 R   |   5 program_   000154 R   |   5 program_   000174 R
  5 prt_basi   00151E R   |   5 prt_loop   001542 R   |   5 prt_tok    0002EB R
  5 prti24     0009DD R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       0002C0 GR  |     puts       ****** GX  |   5 qkey       001D73 GR
  5 qmark_ts   000CC1 R   |   5 random     001FB4 R   |   5 read       002254 R
  5 read01     002256 R   |     readln     ****** GX  |   5 refresh_   0020E0 R
  5 rel_exit   0011F2 R   |   5 relation   00119D R   |   5 relop_st   001503 R
  5 remark     001630 R   |   5 reset_co   001540 R   |   5 rest_con   0015B4 R
  5 restore    002205 R   |   5 return     001802 R   |   5 right_al   00133A R
  5 row_alig   001A09 R   |   5 row_eras   000119 R   |   5 row_eras   000140 R
  5 row_loop   00033C R   |   5 rparnt_t   000C7F R   |   5 rshift     001F13 R
  5 rt_msg     00084C R   |   5 run        001820 R   |   5 run_it     001852 R
  1 rx_head    00002D R   |   1 rx_queue   000025 R   |   1 rx_tail    00002E R
  5 save       001AE5 R   |   5 save_con   0015A4 R   |   5 search_d   000FF3 R
  5 search_e   00103D R   |   5 search_f   001A98 R   |   5 search_l   000402 GR
  5 search_l   00040A R   |   5 search_n   000FF7 R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   001A32 R   |   5 select_p   001F84 R
  5 set_time   002081 R   |   5 sharp_ts   000CA0 R   |   5 show       0011F5 R
  5 show_row   00032A R   |   5 single_c   0014F9 R   |   5 size       001240 R
  5 skip       000E31 R   |   5 slash_ts   000D2A R   |   5 sleep      001E31 R
  5 software   000594 R   |     spaces     ****** GX  |   5 spi_clea   0022F9 R
  5 spi_disa   0022E1 R   |   5 spi_enab   0022AE R   |   5 spi_rcv_   00231B R
  5 spi_read   002346 R   |   5 spi_sele   00234E R   |   5 spi_send   002305 R
  5 spi_writ   002326 R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000D1F R   |   5 step       001740 R   |   5 stop       0019A8 R
  5 store_lo   001754 R   |   5 str_matc   001020 R   |   5 str_tst    000C1F R
  5 strcmp     0003A1 R   |   5 strcpy     0003B2 R   |   5 strlen     000396 GR
  5 syntax_e   00087F R   |   1 tab_widt   000024 R   |   5 tb_error   000881 R
  5 term       0010FF R   |   5 term01     001107 R   |   5 term_exi   00114E R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  3 tib        001690 GR  |   5 tick_tst   000CD9 R   |   1 ticks      00000E R
  5 timeout    002090 R   |   1 timer      000010 R   |   5 timer2_i   0000CB R
  5 timer4_i   0000D8 R   |   5 tk_id      00086F R   |   5 to         001710 R
  5 to_eepro   000197 R   |   5 to_flash   0001AB R   |   5 to_upper   000DBB GR
  5 token_ch   000DB4 R   |   5 token_ex   000DB8 R   |   5 token_ms   000322 R
  5 tone       001889 R   |   5 try_next   002244 R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   00027D R   |   5 uart1_se   00028D R
  5 ubound     00124A R   |   5 udiv32_1   000EF4 R   |   5 uflash     001DAA R
  5 umstar     000E97 R   |   5 unlock_e   0000ED R   |   5 unlock_f   000103 R
  5 until      00213E R   |   5 user_int   000078 R   |   5 user_spa   002800 R
  5 usr        001DB0 R   |   5 var_name   00138D R   |   1 vars       00002F R
  5 wait       001636 R   |   5 warm_ini   00067E R   |   5 warm_sta   000906 R
  5 words      00201B R   |   5 words_co   00206B R   |   5 write      001CFB R
  5 write_bl   00025A R   |   5 write_by   0001E5 R   |   5 write_ee   000221 R
  5 write_ex   000255 R   |   5 write_fl   00020B R   |   5 write_ro   000188 R
  5 zero_pad   0019FE R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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

