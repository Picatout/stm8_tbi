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
      008000 82 00 86 54            105     int cold_start			; RESET vector 
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
      0080A6 CC 86 54         [ 2]  183 	jp cold_start 	
      0080A9                        184 2$: 
      0080A9 A1 1A            [ 1]  185 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  186 	jrne 3$
      0080AD CD 87 1D         [ 4]  187 	call cancel_autorun 
      0080B0 CC 86 54         [ 2]  188 	jp cold_start 
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
      0080F7 CD 96 00         [ 4]  249 	call prt_basic_line
      0080FA                        250 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  251     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  252     ldw sp,x
      0080FE 9A               [ 1]  253 	rim 
      0080FF CC 89 85         [ 2]  254 	jp warm_start
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
      008226 A3 A8 00         [ 2]  464 	cpw x,#user_space 
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
      00825F 90 A3 A8 00      [ 2]  508     cpw y,#user_space
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
      0082DF CD 9B 08         [ 4]  589 	call incr_farptr
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
      008380 CD 8A 45         [ 4]  749 	call print_int 
      008383 A6 20            [ 1]  750 	ld a,#SPACE
      008385 CD 83 20         [ 4]  751 	call putc 
      008388 1E 03            [ 2]  752 	ldw x,(XREG,sp)
      00838A CD 8A 45         [ 4]  753 	call print_int 
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
      0083B0 CD 8A 45         [ 4]  785 	call print_int 
      0083B3 A6 20            [ 1]  786 	ld a,#SPACE  
      0083B5 CD 83 20         [ 4]  787 	call putc
      0083B8                        788 row_loop:
      0083B8 1E 02            [ 2]  789 	ldw x,(ADR,sp)
      0083BA F6               [ 1]  790 	ld a,(x)
      0083BB 5F               [ 1]  791 	clrw x 
      0083BC 97               [ 1]  792 	ld xl,a 
      0083BD CD 8A 45         [ 4]  793 	call print_int 
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



      008582 CD 8D 3D         [ 4] 1152 	call get_token
      008585 A1 84            [ 1] 1153 	cp a,#TK_INTGR
      008587 26 11            [ 1] 1154 	jrne 2$
      008589 A3 00 01         [ 2] 1155 	cpw x,#1 
      00858C 2A 05            [ 1] 1156 	jrpl 1$
      00858E A6 0A            [ 1] 1157 	ld a,#ERR_BAD_VALUE
      008590 CC 89 00         [ 2] 1158 	jp tb_error
      008593 CF 16 E0         [ 2] 1159 1$:	ldw pad,x 
      008596 90 AE 16 E3      [ 2] 1160 	ldw y,#pad+3 
      00859A 90 A3 17 60      [ 2] 1161 2$:	cpw y,#stack_full 
      00859E 25 05            [ 1] 1162 	jrult 3$
      0085A0 A6 0F            [ 1] 1163 	ld a,#ERR_BUF_FULL 
      0085A2 CC 89 00         [ 2] 1164 	jp tb_error 
      0085A5                       1165 3$:	
      0085A5 93               [ 1] 1166 	ldw x,y 
      0085A6 CD 8D 3D         [ 4] 1167 	call get_token 
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
                                   1243 ; return true if character in  A 
                                   1244 ; is letter or digit.
                                   1245 ; input:
                                   1246 ;   A     ASCII character 
                                   1247 ; output:
                                   1248 ;   A     no change 
                                   1249 ;   Carry    0 false| 1 true 
                                   1250 ;--------------------------------------
      008605                       1251 is_alnum:
      008605 CD 85 FC         [ 4] 1252 	call is_digit
      008608 25 03            [ 1] 1253 	jrc 1$ 
      00860A CD 85 EB         [ 4] 1254 	call is_alpha
      00860D 81               [ 4] 1255 1$:	ret 
                                   1256 
                                   1257 
                                   1258 ;-------------------------------------
                                   1259 ;  program initialization entry point 
                                   1260 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                           000001  1261 	MAJOR=1
                           000000  1262 	MINOR=0
      00860E 0A 0A 54 69 6E 79 20  1263 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008654                       1264 cold_start:
                                   1265 ;set stack 
      008654 AE 17 FF         [ 2] 1266 	ldw x,#STACK_EMPTY
      008657 94               [ 1] 1267 	ldw sp,x   
                                   1268 ; clear all ram 
      008658 7F               [ 1] 1269 0$: clr (x)
      008659 5A               [ 2] 1270 	decw x 
      00865A 26 FC            [ 1] 1271 	jrne 0$
                                   1272 ; activate pull up on all inputs 
      00865C A6 FF            [ 1] 1273 	ld a,#255 
      00865E C7 50 03         [ 1] 1274 	ld PA_CR1,a 
      008661 C7 50 08         [ 1] 1275 	ld PB_CR1,a 
      008664 C7 50 0D         [ 1] 1276 	ld PC_CR1,a 
      008667 C7 50 12         [ 1] 1277 	ld PD_CR1,a 
      00866A C7 50 17         [ 1] 1278 	ld PE_CR1,a 
      00866D C7 50 1C         [ 1] 1279 	ld PF_CR1,a 
      008670 C7 50 21         [ 1] 1280 	ld PG_CR1,a 
      008673 C7 50 2B         [ 1] 1281 	ld PI_CR1,a
                                   1282 ; set LD2 pin as output and turn it on
      008676 72 1A 50 0D      [ 1] 1283     bset PC_CR1,#LED2_BIT
      00867A 72 1A 50 0E      [ 1] 1284     bset PC_CR2,#LED2_BIT
      00867E 72 1A 50 0C      [ 1] 1285     bset PC_DDR,#LED2_BIT
      008682 72 1A 50 0A      [ 1] 1286 	bset PC_ODR,#LED2_BIT 
                                   1287 ; disable schmitt triggers on Arduino CN4 analog inputs
      008686 55 00 3F 54 07   [ 1] 1288 	mov ADC_TDRL,0x3f
                                   1289 ; disable peripherals clocks
                                   1290 ;	clr CLK_PCKENR1 
                                   1291 ;	clr CLK_PCKENR2
      00868B 72 5F 50 F2      [ 1] 1292 	clr AWU_TBR 
      00868F 72 14 50 CA      [ 1] 1293 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1294 ; select internal clock no divisor: 16 Mhz 	
      008693 A6 E1            [ 1] 1295 	ld a,#CLK_SWR_HSI 
      008695 5F               [ 1] 1296 	clrw x  
      008696 CD 81 1D         [ 4] 1297     call clock_init 
      008699 CD 81 40         [ 4] 1298 	call timer4_init
      00869C CD 81 33         [ 4] 1299 	call timer2_init
                                   1300 ; UART1 at 115200 BAUD
      00869F CD 82 E5         [ 4] 1301 	call uart1_init
                                   1302 ; activate PE_4 (user button interrupt)
      0086A2 72 18 50 18      [ 1] 1303     bset PE_CR2,#USR_BTN_BIT 
                                   1304 ; display system information
      0086A6 AE 86 0E         [ 2] 1305 	ldw x,#software 
      0086A9 CD 83 33         [ 4] 1306 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0086AC A6 01            [ 1] 1307 	ld a,#MAJOR 
      0086AE C7 00 0E         [ 1] 1308 	ld acc8,a 
      0086B1 5F               [ 1] 1309 	clrw x 
      0086B2 CF 00 0C         [ 2] 1310 	ldw acc24,x
      0086B5 72 5F 00 25      [ 1] 1311 	clr tab_width  
      0086B9 35 0A 00 0B      [ 1] 1312 	mov base, #10 
      0086BD CD 8A 55         [ 4] 1313 	call prti24 
      0086C0 A6 2E            [ 1] 1314 	ld a,#'.
      0086C2 CD 83 20         [ 4] 1315 	call putc 
      0086C5 A6 00            [ 1] 1316 	ld a,#MINOR 
      0086C7 C7 00 0E         [ 1] 1317 	ld acc8,a 
      0086CA 5F               [ 1] 1318 	clrw x 
      0086CB CF 00 0C         [ 2] 1319 	ldw acc24,x 
      0086CE CD 8A 55         [ 4] 1320 	call prti24
      0086D1 A6 0D            [ 1] 1321 	ld a,#CR 
      0086D3 CD 83 20         [ 4] 1322 	call putc
      0086D6 CD 9B 16         [ 4] 1323 	call seek_fdrive 
      0086D9 9A               [ 1] 1324 	rim 
      0086DA 72 5C 00 16      [ 1] 1325 	inc seedy+1 
      0086DE 72 5C 00 14      [ 1] 1326 	inc seedx+1 
      0086E2 CD 87 6A         [ 4] 1327 	call clear_basic
      0086E5 CD 93 57         [ 4] 1328 	call ubound 
                                   1329 ;	jra 2$	
                                   1330 ; 150 msec beep 
      0086E8 AE 00 96         [ 2] 1331 	ldw x,#150 
      0086EB 90 AE 03 E6      [ 2] 1332 	ldw y,#998 
      0086EF CD 99 7A         [ 4] 1333 	call beep  
      0086F2 72 1B 50 0A      [ 1] 1334 2$:	bres PC_ODR,#LED2_BIT	
      0086F6 CD 86 FF         [ 4] 1335 	call warm_init
      0086F9 CD 87 2C         [ 4] 1336 	call load_autorun
      0086FC CC 89 88         [ 2] 1337     jp cmd_line  
                                   1338 
      0086FF                       1339 warm_init:
      0086FF 72 5F 00 24      [ 1] 1340 	clr flags 
      008703 72 5F 00 21      [ 1] 1341 	clr loop_depth 
      008707 35 04 00 25      [ 1] 1342 	mov tab_width,#TAB_WIDTH 
      00870B 35 0A 00 0B      [ 1] 1343 	mov base,#10 
      00870F AE 00 00         [ 2] 1344 	ldw x,#0 
      008712 CF 00 05         [ 2] 1345 	ldw basicptr,x 
      008715 CF 00 01         [ 2] 1346 	ldw in.w,x 
      008718 72 5F 00 04      [ 1] 1347 	clr count
      00871C 81               [ 4] 1348 	ret 
                                   1349 
                                   1350 ;--------------------------
                                   1351 ; called by tb_error when
                                   1352 ; flag FAUTORUN is set.
                                   1353 ; There is a bug in autorun 
                                   1354 ; program so cancel it.
                                   1355 ;---------------------------
      00871D                       1356 cancel_autorun:
      00871D AE 40 00         [ 2] 1357 	ldw x,#AUTORUN_NAME 
      008720 CF 00 18         [ 2] 1358 	ldw farptr+1,x 
      008723 4F               [ 1] 1359 	clr a
      008724 5F               [ 1] 1360 	clrw x  
      008725 C7 00 17         [ 1] 1361 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008728 CD 82 4D         [ 4] 1362 	call write_byte 
      00872B 81               [ 4] 1363 	ret 
                                   1364 
                                   1365 
                                   1366 ;--------------------------
                                   1367 ; if autorun file defined 
                                   1368 ; in eeprom address AUTORUN_NAME 
                                   1369 ; load and run it.
                                   1370 ;-------------------------
      00872C                       1371 load_autorun:
      00872C 90 AE 40 00      [ 2] 1372 	ldw y,#AUTORUN_NAME
      008730 90 F6            [ 1] 1373 	ld a,(y)
      008732 27 20            [ 1] 1374 	jreq 9$
      008734 CD 9B 7C         [ 4] 1375 	call search_file
      008737 25 05            [ 1] 1376 	jrc 2$ 
                                   1377 ; if file doesn't exit
      008739 CD 87 1D         [ 4] 1378 	call cancel_autorun
      00873C 20 16            [ 2] 1379 	jra 9$ 
      00873E CD 9C 92         [ 4] 1380 2$:	call load_file
      008741 AE 40 00         [ 2] 1381 	ldw x,#AUTORUN_NAME 
      008744 CD 83 33         [ 4] 1382 	call puts
      008747 AE 87 55         [ 2] 1383 	ldw x,#autorun_msg 
      00874A CD 83 33         [ 4] 1384 	call puts 
      00874D 72 1C 00 24      [ 1] 1385 	bset flags,#FAUTORUN 
      008751 CC 99 3F         [ 2] 1386 	jp run_it    
      008754 81               [ 4] 1387 9$: ret 	
                                   1388 
      008755 20 6C 6F 61 64 65 64  1389 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1390 ;---------------------------
                                   1391 ; reset BASIC text variables 
                                   1392 ; and clear variables 
                                   1393 ;---------------------------
      00876A                       1394 clear_basic:
      00876A 72 5F 00 04      [ 1] 1395 	clr count
      00876E 72 5F 00 02      [ 1] 1396 	clr in  
      008772 AE 00 5B         [ 2] 1397 	ldw x,#free_ram 
      008775 CF 00 1D         [ 2] 1398 	ldw txtbgn,x 
      008778 CF 00 1F         [ 2] 1399 	ldw txtend,x 
      00877B CD 85 DD         [ 4] 1400 	call clear_vars 
      00877E 81               [ 4] 1401 	ret 
                                   1402 
                                   1403 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1404 ;;   Tiny BASIC error messages     ;;
                                   1405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00877F                       1406 err_msg:
      00877F 00 00 87 9F 87 AC 87  1407 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             BA 87 D3 87 E2
      00878B 87 F8 88 0E 88 28 88  1408 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             39 88 4A
      008795 88 56 88 89 88 99 88  1409 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             AD 88 C0
                                   1410 
      00879F 4D 65 6D 6F 72 79 20  1411 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal  66-Bits]



             66 75 6C 6C 0A 00
      0087A7 75 6C 6C 0A 00 73 79  1412 err_syntax: .asciz "syntax error\n" 
             6E 74 61 78 20 65 72
      0087B5 72 6F 72 0A 00 6D 61  1413 err_math_ovf: .asciz "math operation overflow\n"
             74 68 20 6F 70 65 72
             61 74 69 6F 6E 20 6F
             76 65 72 66
      0087CE 6C 6F 77 0A 00 64 69  1414 err_div0: .asciz "division by 0\n" 
             76 69 73 69 6F 6E 20
             62
      0087DD 79 20 30 0A 00 69 6E  1415 err_no_line: .asciz "invalid line number.\n"
             76 61 6C 69 64 20 6C
             69 6E 65 20 6E 75 6D
             62
      0087F3 65 72 2E 0A 00 72 75  1416 err_run_only: .asciz "run time only usage.\n" 
             6E 20 74 69 6D 65 20
             6F 6E 6C 79 20 75 73
             61
      008809 67 65 2E 0A 00 63 6F  1417 err_cmd_only: .asciz "command line only usage.\n"
             6D 6D 61 6E 64 20 6C
             69 6E 65 20 6F 6E 6C
             79 20 75 73 61
      008823 67 65 2E 0A 00 64 75  1418 err_duplicate: .asciz "duplicate name.\n"
             70 6C 69 63 61 74 65
             20 6E 61
      008834 6D 65 2E 0A 00 46 69  1419 err_not_file: .asciz "File not found.\n"
             6C 65 20 6E 6F 74 20
             66 6F 75
      008845 6E 64 2E 0A 00 62 61  1420 err_bad_value: .asciz "bad value.\n"
             64 20 76 61 6C
      008851 75 65 2E 0A 00 46 69  1421 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             6C 65 20 69 6E 20 65
             78 74 65 6E 64 65 64
             20 6D 65 6D 6F 72 79
             2C 20 63 61 6E 27 74
             20 62 65 20 72 75 6E
             20 66 72 6F 6D 20 74
             68 65
      008884 72 65 2E 0A 00 4E 6F  1422 err_no_data: .asciz "No data found.\n"
             20 64 61 74 61 20 66
             6F 75
      008894 6E 64 2E 0A 00 4E 6F  1423 err_no_prog: .asciz "No program in RAM!\n"
             20 70 72 6F 67 72 61
             6D 20 69 6E 20 52
      0088A8 41 4D 21 0A 00 46 69  1424 err_no_fspace: .asciz "File system full.\n" 
             6C 65 20 73 79 73 74
             65 6D 20 66 75
      0088BB 6C 6C 2E 0A 00 42 75  1425 err_buf_full: .asciz "Buffer full\n"
             66 66 65 72 20 66
                                   1426 
      0088C8 75 6C 6C 0A 00 72 75  1427 rt_msg: .asciz "run time error, "
             6E 20 74 69 6D 65 20
             65 72 72
      0088D9 6F 72 2C 20 00 63 6F  1428 comp_msg: .asciz "compile error, "
             6D 70 69 6C 65 20 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal  72-Bits]



             20 00
      0088E8 72 6F 72 2C 20 00 6C  1429 tk_id: .asciz "last token id: "
             61 73 74 20 74 6F 6B
             65 6E
                                   1430 
      00087E                       1431 syntax_error:
      0088F8 20 69            [ 1] 1432 	ld a,#ERR_SYNTAX 
                                   1433 
      000880                       1434 tb_error:
      0088FA 64 3A 20 00 47   [ 2] 1435 	btjt flags,#FCOMP,1$
      0088FE 88               [ 1] 1436 	push a 
      0088FE A6 02 4D         [ 2] 1437 	ldw x, #rt_msg 
      008900 CD 02 B3         [ 4] 1438 	call puts 
      008900 72               [ 1] 1439 	pop a 
      008901 0A 00 24         [ 2] 1440 	ldw x, #err_msg 
      008904 47 88 AE 88      [ 1] 1441 	clr acc16 
      008908 CD               [ 1] 1442 	sll a
      008909 CD 83 33 84      [ 1] 1443 	rlc acc16  
      00890D AE 87 7F         [ 1] 1444 	ld acc8, a 
      008910 72 5F 00 0D      [ 2] 1445 	addw x,acc16 
      008914 48               [ 2] 1446 	ldw x,(x)
      008915 72 59 00         [ 4] 1447 	call puts
      008918 0D C7 00         [ 2] 1448 	ldw x,basicptr
      00891B 0E 72 BB         [ 1] 1449 	ld a,in 
      00891E 00 0D FE         [ 4] 1450 	call prt_basic_line
      008921 CD 83 33         [ 2] 1451 	ldw x,#tk_id 
      008924 CE 00 05         [ 4] 1452 	call puts 
      008927 C6 00 02         [ 1] 1453 	ld a,in.saved 
      00892A CD               [ 1] 1454 	clrw x 
      00892B 96               [ 1] 1455 	ld xl,a 
      00892C 00 AE 88 EE      [ 2] 1456 	addw x,basicptr 
      008930 CD               [ 1] 1457 	ld a,(x)
      008931 83               [ 1] 1458 	clrw x 
      008932 33               [ 1] 1459 	ld xl,a 
      008933 C6 00 03         [ 4] 1460 	call print_int
      008936 5F 97 72 BB 00   [ 2] 1461 	btjf flags,#FAUTORUN ,6$
      00893B 05 F6 5F         [ 4] 1462 	call cancel_autorun  
      00893E 97 CD            [ 2] 1463 	jra 6$
      0008CC                       1464 1$:	
      008940 8A               [ 1] 1465 	push a 
      008941 45 72 0D         [ 2] 1466 	ldw x,#comp_msg
      008944 00 24 3A         [ 4] 1467 	call puts 
      008947 CD               [ 1] 1468 	pop a 
      008948 87 1D 20         [ 2] 1469 	ldw x, #err_msg 
      00894B 35 5F 00 0C      [ 1] 1470 	clr acc16 
      00894C 48               [ 1] 1471 	sll a
      00894C 88 AE 88 DE      [ 1] 1472 	rlc acc16  
      008950 CD 83 33         [ 1] 1473 	ld acc8, a 
      008953 84 AE 87 7F      [ 2] 1474 	addw x,acc16 
      008957 72               [ 2] 1475 	ldw x,(x)
      008958 5F 00 0D         [ 4] 1476 	call puts
      00895B 48 72 59         [ 2] 1477 	ldw x,#tib
      00895E 00 0D C7         [ 4] 1478 	call puts 
      008961 00 0E            [ 1] 1479 	ld a,#CR 
      008963 72 BB 00         [ 4] 1480 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008966 0D FE CD         [ 2] 1481 	ldw x,in.w
      008969 83 33 AE         [ 4] 1482 	call spaces
      00896C 16 90            [ 1] 1483 	ld a,#'^
      00896E CD 83 33         [ 4] 1484 	call putc 
      008971 A6 0D CD         [ 2] 1485 6$: ldw x,#STACK_EMPTY 
      008974 83               [ 1] 1486     ldw sp,x
      000905                       1487 warm_start:
      008975 20 CE 00         [ 4] 1488 	call warm_init
                                   1489 ;----------------------------
                                   1490 ;   BASIC interpreter
                                   1491 ;----------------------------
      000908                       1492 cmd_line: ; user interface 
      008978 01 CD            [ 1] 1493 	ld a,#CR 
      00897A 83 5B A6         [ 4] 1494 	call putc 
      00897D 5E CD            [ 1] 1495 	ld a,#'> 
      00897F 83 20 AE         [ 4] 1496 	call putc
      008982 17 FF 94         [ 4] 1497 	call readln
      008985 72 5D 00 03      [ 1] 1498 	tnz count 
      008985 CD 86            [ 1] 1499 	jreq cmd_line
      008987 FF 04 EA         [ 4] 1500 	call compile
                                   1501 ; if text begin with a line number
                                   1502 ; the compiler set count to zero    
                                   1503 ; so code is not interpreted
      008988 72 5D 00 03      [ 1] 1504 	tnz count 
      008988 A6 0D            [ 1] 1505 	jreq cmd_line
                                   1506 
                                   1507 ; if direct command 
                                   1508 ; it's ready to interpret 
                                   1509 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1510 ;; This is the interpreter loop
                                   1511 ;; for each BASIC code line. 
                                   1512 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      000924                       1513 interpreter: 
      00898A CD 83 20         [ 1] 1514 	ld a,in 
      00898D A6 3E CD         [ 1] 1515 	cp a,count 
      008990 83 20            [ 1] 1516 	jrmi interp_loop
      00092C                       1517 next_line:
      008992 CD 8B 40 72 5D   [ 2] 1518 	btjf flags, #FRUN, cmd_line
      008997 00 04 27         [ 2] 1519 	ldw x,basicptr
      00899A ED CD 85 6A      [ 2] 1520 	addw x,in.w 
      00899E 72 5D 00         [ 2] 1521 	cpw x,txtend 
      0089A1 04 27            [ 1] 1522 	jrpl warm_start
      0089A3 E4 00 04         [ 2] 1523 	ldw basicptr,x ; start of next line  
      0089A4 E6 02            [ 1] 1524 	ld a,(2,x)
      0089A4 C6 00 02         [ 1] 1525 	ld count,a 
      0089A7 C1 00 04 2B      [ 1] 1526 	mov in,#3 ; skip first 3 bytes of line 
      000949                       1527 interp_loop: 
      0089AB 1D 09 70         [ 4] 1528 	call next_token
      0089AC A1 00            [ 1] 1529 	cp a,#TK_NONE 
      0089AC 72 01            [ 1] 1530 	jreq next_line 
      0089AE 00 24            [ 1] 1531 	cp a,#TK_CMD
      0089B0 D7 CE            [ 1] 1532 	jrne 1$
      0089B2 00               [ 4] 1533 	call (x) 
      0089B3 05 72            [ 2] 1534 	jra interp_loop 
      000957                       1535 1$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089B5 BB 00            [ 1] 1536 	cp a,#TK_VAR
      0089B7 01 C3            [ 1] 1537 	jrne 2$
      0089B9 00 1F 2A         [ 4] 1538 	call let_var  
      0089BC C8 CF            [ 2] 1539 	jra interp_loop 
      000960                       1540 2$:	
      0089BE 00 05            [ 1] 1541 	cp a,#TK_ARRAY 
      0089C0 E6 02            [ 1] 1542 	jrne 3$
      0089C2 C7 00 04         [ 4] 1543 	call let_array 
      0089C5 35 03            [ 2] 1544 	jra interp_loop
      000969                       1545 3$:	
      0089C7 00 02            [ 1] 1546 	cp a,#TK_COLON 
      0089C9 27 DC            [ 1] 1547 	jreq interp_loop 
      0089C9 CD 89 F0         [ 2] 1548 	jp syntax_error 
                                   1549 
                                   1550 		
                                   1551 ;--------------------------
                                   1552 ; extract next token from
                                   1553 ; token list 
                                   1554 ; basicptr -> base address 
                                   1555 ; in  -> offset in list array 
                                   1556 ; output:
                                   1557 ;   A 		token attribute
                                   1558 ;   X 		token value if there is one
                                   1559 ;----------------------------------------
      000970                       1560 next_token:
      0089CC A1               [ 1] 1561 	clrw x 
      0089CD 00 27 DC         [ 1] 1562 	ld a,in 
      0089D0 A1 80 26         [ 1] 1563 	sub a,count ; don't replace sub by cp!  
      0089D3 03 FD            [ 1] 1564 	jrmi 0$
      0089D5 20               [ 4] 1565 	ret  ; end of BASIC line 
      00097A                       1566 0$: 
      0089D6 F2 00 01 00 02   [ 1] 1567 	mov in.saved,in 
      0089D7 90 CE 00 04      [ 2] 1568 	ldw y,basicptr 
      0089D7 A1 85 26         [ 4] 1569 	ld a,([in.w],y)
      0089DA 05 CD 93 8A      [ 1] 1570 	inc in  
      0089DE 20               [ 1] 1571 	tnz a 
      0089DF E9 2B            [ 1] 1572 	jrmi 6$
      0089E0 A1 06            [ 1] 1573 	cp a,#TK_ARRAY
      0089E0 A1 06            [ 1] 1574 	jrpl 9$  ; no attribute for these
      0089E2 26 05            [ 1] 1575 	cp a,#TK_COLON
      0089E4 CD 93            [ 1] 1576 	jreq 9$  
      000995                       1577 1$: ; 
      0089E6 87 20            [ 1] 1578 	cp a,#TK_CHAR
      0089E8 E0 0B            [ 1] 1579 	jrne 2$
      0089E9 91 D6 00         [ 4] 1580 	ld a,([in.w],y)
      0089E9 A1 01 27 DC      [ 1] 1581 	inc in 
      0089ED CC               [ 1] 1582 	exg a,xl  
      0089EE 88 FE            [ 1] 1583 	ld a,#TK_CHAR
      0089F0 81               [ 4] 1584 	ret
      0089F0 5F C6            [ 1] 1585 2$:	cp a,#TK_QSTR 
      0089F2 00 02            [ 1] 1586 	jrne 9$
      0089F4 C0               [ 1] 1587 	ldw x,y 
      0089F5 00 04 2B 01      [ 2] 1588 	addw x,in.w ; pointer to string 
                                   1589 ; move pointer after string 
      0089F9 81 6D 00         [ 4] 1590 3$:	tnz ([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089FA 27 0E            [ 1] 1591 	jreq 8$
      0089FA 55 00 02 00      [ 1] 1592 	inc in 
      0089FE 03 90            [ 2] 1593 	jra 3$
      0009B8                       1594 6$: 
      008A00 CE 00 05         [ 5] 1595 	ldw y,([in.w],y)
      008A03 91               [ 1] 1596 	exgw x,y 
      008A04 D6 01 72 5C      [ 1] 1597 	inc in
      008A08 00 02 4D 2B      [ 1] 1598 8$:	inc in 
      0009C4                       1599 9$: 
      008A0C 2B               [ 4] 1600 	ret	
                                   1601 
                                   1602 ;-----------------------------------
                                   1603 ; print a 16 bit integer 
                                   1604 ; using variable 'base' as conversion
                                   1605 ; format.
                                   1606 ; input:
                                   1607 ;   X       integer to print 
                                   1608 ;   'base'    conversion base 
                                   1609 ; output:
                                   1610 ;   none 
                                   1611 ;-----------------------------------
      0009C5                       1612 print_int:
      008A0D A1 06 2A 33      [ 1] 1613 	clr acc24 
      008A11 A1 01 27         [ 2] 1614 	ldw acc16,x 
      008A14 2F 0F 00 0C 04   [ 2] 1615 	btjf acc16,#7,prti24
      008A15 72 53 00 0B      [ 1] 1616 	cpl acc24 
                                   1617 
                                   1618 ;------------------------------------
                                   1619 ; print integer in acc24 
                                   1620 ; input:
                                   1621 ;	acc24 		integer to print 
                                   1622 ;	'base' 		numerical base for conversion 
                                   1623 ;   'tab_width' field width 
                                   1624 ;  output:
                                   1625 ;    A          string length
                                   1626 ;------------------------------------
      0009D5                       1627 prti24:
      008A15 A1 03 26         [ 4] 1628     call itoa  ; conversion entier en  .asciz
      008A18 0B 91 D6         [ 4] 1629 	call right_align  
      008A1B 01               [ 1] 1630 	push a 
      008A1C 72 5C 00         [ 4] 1631 	call puts
      008A1F 02               [ 1] 1632 	pop a 
      008A20 41               [ 4] 1633     ret	
                                   1634 
                                   1635 ;------------------------------------
                                   1636 ; convert integer in acc24 to string
                                   1637 ; input:
                                   1638 ;   'base'	conversion base 
                                   1639 ;	acc24	integer to convert
                                   1640 ; output:
                                   1641 ;   X  		pointer to first char of string
                                   1642 ;   A       string length
                                   1643 ;------------------------------------
                           000001  1644 	SIGN=1  ; integer sign 
                           000002  1645 	LEN=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                           000003  1646 	PSTR=3
                           000004  1647 	VSIZE=4 ;locals size
      0009E1                       1648 itoa:
      0009E1                       1649 	_vars VSIZE
      008A21 A6 03            [ 2]    1     sub sp,#VSIZE 
      008A23 81 A1            [ 1] 1650 	clr (LEN,sp) ; string length  
      008A25 02 26            [ 1] 1651 	clr (SIGN,sp)    ; sign
      008A27 1C 93 72         [ 1] 1652 	ld a,base 
      008A2A BB 00            [ 1] 1653 	cp a,#10
      008A2C 01 91            [ 1] 1654 	jrne 1$
                                   1655 	; base 10 string display with negative sign if bit 23==1
      008A2E 6D 01 27 0E 72   [ 2] 1656 	btjf acc24,#7,1$
      008A33 5C 00            [ 1] 1657 	cpl (SIGN,sp)
      008A35 02 20 F5         [ 4] 1658 	call neg_acc24
      008A38                       1659 1$:
                                   1660 ; initialize string pointer 
      008A38 91 DE 01         [ 2] 1661 	ldw x,#tib 
      008A3B 51 72 5C         [ 2] 1662 	addw x,#TIB_SIZE
      008A3E 00               [ 2] 1663 	decw x 
      008A3F 02               [ 1] 1664 	clr (x)
      000A00                       1665 itoa_loop:
      008A40 72 5C 00         [ 1] 1666     ld a,base
      008A43 02 03            [ 2] 1667 	ldw (PSTR,sp),x 
      008A44 CD 0A 3B         [ 4] 1668     call divu24_8 ; acc24/A 
      008A44 81 03            [ 2] 1669 	ldw x,(PSTR,sp)
      008A45 AB 30            [ 1] 1670     add a,#'0  ; remainder of division
      008A45 72 5F            [ 1] 1671     cp a,#'9+1
      008A47 00 0C            [ 1] 1672     jrmi 2$
      008A49 CF 00            [ 1] 1673     add a,#7 
      000A12                       1674 2$:	
      008A4B 0D               [ 2] 1675 	decw x
      008A4C 72               [ 1] 1676     ld (x),a
      008A4D 0F 00            [ 1] 1677 	inc (LEN,sp)
                                   1678 	; if acc24==0 conversion done
      008A4F 0D 04 72         [ 1] 1679 	ld a,acc24
      008A52 53 00 0C         [ 1] 1680 	or a,acc16
      008A55 CA 00 0D         [ 1] 1681 	or a,acc8
      008A55 CD 8A            [ 1] 1682     jrne itoa_loop
                                   1683 	;conversion done, next add '$' or '-' as required
      008A57 61 CD 94         [ 1] 1684 	ld a,base 
      008A5A 47 88            [ 1] 1685 	cp a,#16
      008A5C CD 83            [ 1] 1686 	jreq 8$
      008A5E 33 84            [ 1] 1687 	ld a,(SIGN,sp)
      008A60 81 0A            [ 1] 1688     jreq 10$
      008A61 A6 2D            [ 1] 1689     ld a,#'-
      008A61 52 04            [ 2] 1690 	jra 9$ 
      008A63 0F 02            [ 1] 1691 8$: ld a,#'$ 
      008A65 0F               [ 2] 1692 9$: decw x
      008A66 01               [ 1] 1693     ld (x),a
      008A67 C6 00            [ 1] 1694 	inc (LEN,sp)
      000A36                       1695 10$:
      008A69 0B A1            [ 1] 1696 	ld a,(LEN,sp)
      000A38                       1697 	_drop VSIZE
      008A6B 0A 26            [ 2]    1     addw sp,#VSIZE 
      008A6D 0A               [ 4] 1698 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1699 
                                   1700 ;-------------------------------------
                                   1701 ; divide uint24_t by uint8_t
                                   1702 ; used to convert uint24_t to string
                                   1703 ; input:
                                   1704 ;	acc24	dividend
                                   1705 ;   A 		divisor
                                   1706 ; output:
                                   1707 ;   acc24	quotient
                                   1708 ;   A		remainder
                                   1709 ;------------------------------------- 
                                   1710 ; offset  on sp of arguments and locals
                           000001  1711 	U8   = 1   ; divisor on stack
                           000001  1712 	VSIZE =1
      000A3B                       1713 divu24_8:
      008A6E 72               [ 2] 1714 	pushw x ; save x
      008A6F 0F               [ 1] 1715 	push a 
                                   1716 	; ld dividend UU:MM bytes in X
      008A70 00 0C 05         [ 1] 1717 	ld a, acc24
      008A73 03               [ 1] 1718 	ld xh,a
      008A74 01 CD 8B         [ 1] 1719 	ld a,acc24+1
      008A77 1D               [ 1] 1720 	ld xl,a
      008A78 7B 01            [ 1] 1721 	ld a,(U8,SP) ; divisor
      008A78 AE               [ 2] 1722 	div x,a ; UU:MM/U8
      008A79 16               [ 1] 1723 	push a  ;save remainder
      008A7A 90               [ 1] 1724 	ld a,xh
      008A7B 1C 00 50         [ 1] 1725 	ld acc24,a
      008A7E 5A               [ 1] 1726 	ld a,xl
      008A7F 7F 00 0C         [ 1] 1727 	ld acc24+1,a
      008A80 84               [ 1] 1728 	pop a
      008A80 C6               [ 1] 1729 	ld xh,a
      008A81 00 0B 1F         [ 1] 1730 	ld a,acc24+2
      008A84 03               [ 1] 1731 	ld xl,a
      008A85 CD 8A            [ 1] 1732 	ld a,(U8,sp) ; divisor
      008A87 BB               [ 2] 1733 	div x,a  ; R:LL/U8
      008A88 1E 03            [ 1] 1734 	ld (U8,sp),a ; save remainder
      008A8A AB               [ 1] 1735 	ld a,xl
      008A8B 30 A1 3A         [ 1] 1736 	ld acc24+2,a
      008A8E 2B               [ 1] 1737 	pop a
      008A8F 02               [ 2] 1738 	popw x
      008A90 AB               [ 4] 1739 	ret
                                   1740 
                                   1741 ;--------------------------------------
                                   1742 ; unsigned multiply uint24_t by uint8_t
                                   1743 ; use to convert numerical string to uint24_t
                                   1744 ; input:
                                   1745 ;	acc24	uint24_t 
                                   1746 ;   A		uint8_t
                                   1747 ; output:
                                   1748 ;   acc24   A*acc24
                                   1749 ;-------------------------------------
                                   1750 ; local variables offset  on sp
                           000003  1751 	U8   = 3   ; A pushed on stack
                           000002  1752 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1753 	OVFH = 1  ; multiplication overflow high byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000003  1754 	VSIZE = 3
      000A63                       1755 mulu24_8:
      008A91 07               [ 2] 1756 	pushw x    ; save X
                                   1757 	; local variables
      008A92 88               [ 1] 1758 	push a     ; U8
      008A92 5A               [ 1] 1759 	clrw x     ; initialize overflow to 0
      008A93 F7               [ 2] 1760 	pushw x    ; multiplication overflow
                                   1761 ; multiply low byte.
      008A94 0C 02 C6         [ 1] 1762 	ld a,acc24+2
      008A97 00               [ 1] 1763 	ld xl,a
      008A98 0C CA            [ 1] 1764 	ld a,(U8,sp)
      008A9A 00               [ 4] 1765 	mul x,a
      008A9B 0D               [ 1] 1766 	ld a,xl
      008A9C CA 00 0E         [ 1] 1767 	ld acc24+2,a
      008A9F 26               [ 1] 1768 	ld a, xh
      008AA0 DF C6            [ 1] 1769 	ld (OVFL,sp),a
                                   1770 ; multipy middle byte
      008AA2 00 0B A1         [ 1] 1771 	ld a,acc24+1
      008AA5 10               [ 1] 1772 	ld xl,a
      008AA6 27 08            [ 1] 1773 	ld a, (U8,sp)
      008AA8 7B               [ 4] 1774 	mul x,a
                                   1775 ; add overflow to this partial product
      008AA9 01 27 0A         [ 2] 1776 	addw x,(OVFH,sp)
      008AAC A6               [ 1] 1777 	ld a,xl
      008AAD 2D 20 02         [ 1] 1778 	ld acc24+1,a
      008AB0 A6               [ 1] 1779 	clr a
      008AB1 24 5A            [ 1] 1780 	adc a,#0
      008AB3 F7 0C            [ 1] 1781 	ld (OVFH,sp),a
      008AB5 02               [ 1] 1782 	ld a,xh
      008AB6 6B 02            [ 1] 1783 	ld (OVFL,sp),a
                                   1784 ; multiply most signficant byte	
      008AB6 7B 02 5B         [ 1] 1785 	ld a, acc24
      008AB9 04               [ 1] 1786 	ld xl, a
      008ABA 81 03            [ 1] 1787 	ld a, (U8,sp)
      008ABB 42               [ 4] 1788 	mul x,a
      008ABB 89 88 C6         [ 2] 1789 	addw x, (OVFH,sp)
      008ABE 00               [ 1] 1790 	ld a, xl
      008ABF 0C 95 C6         [ 1] 1791 	ld acc24,a
      008AC2 00 0D            [ 2] 1792     addw sp,#VSIZE
      008AC4 97               [ 2] 1793 	popw x
      008AC5 7B               [ 4] 1794 	ret
                                   1795 
                                   1796 ;------------------------------------
                                   1797 ;  two's complement acc24
                                   1798 ;  input:
                                   1799 ;		acc24 variable
                                   1800 ;  output:
                                   1801 ;		acc24 variable
                                   1802 ;-------------------------------------
      000A9D                       1803 neg_acc24:
      008AC6 01 62 88 9E      [ 1] 1804 	cpl acc24+2
      008ACA C7 00 0C 9F      [ 1] 1805 	cpl acc24+1
      008ACE C7 00 0D 84      [ 1] 1806 	cpl acc24
      008AD2 95 C6            [ 1] 1807 	ld a,#1
      008AD4 00 0E 97         [ 1] 1808 	add a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AD7 7B 01 62         [ 1] 1809 	ld acc24+2,a
      008ADA 6B               [ 1] 1810 	clr a
      008ADB 01 9F C7         [ 1] 1811 	adc a,acc24+1
      008ADE 00 0E 84         [ 1] 1812 	ld acc24+1,a 
      008AE1 85               [ 1] 1813 	clr a 
      008AE2 81 00 0B         [ 1] 1814 	adc a,acc24 
      008AE3 C7 00 0B         [ 1] 1815 	ld acc24,a 
      008AE3 89               [ 4] 1816 	ret
                                   1817 
                                   1818 
                                   1819 ;------------------------------------
                                   1820 ; read a line of text from terminal
                                   1821 ; input:
                                   1822 ;	none
                                   1823 ; local variable on stack:
                                   1824 ;	LL  line length
                                   1825 ;   RXCHAR last received character 
                                   1826 ; output:
                                   1827 ;   text in tib  buffer
                                   1828 ;   count  line length 
                                   1829 ;------------------------------------
                                   1830 	; local variables
                           000001  1831 	LL_HB=1
                           000001  1832 	RXCHAR = 1 ; last char received
                           000002  1833 	LL = 2  ; accepted line length
                           000002  1834 	VSIZE=2 
      000AC0                       1835 readln:
      008AE4 88 5F            [ 1] 1836 	push #0
      008AE6 89 C6            [ 1] 1837 	push #0  
      008AE8 00 0E 97 7B      [ 2] 1838  	ldw y,#tib ; input buffer
      000AC8                       1839 readln_loop:
      008AEC 03 42 9F         [ 4] 1840 	call getc
      008AEF C7 00            [ 1] 1841 	ld (RXCHAR,sp),a
      008AF1 0E 9E            [ 1] 1842 	cp a,#CR
      008AF3 6B 02            [ 1] 1843 	jrne 1$
      008AF5 C6 00 0D         [ 2] 1844 	jp readln_quit
      008AF8 97 7B            [ 1] 1845 1$:	cp a,#LF 
      008AFA 03 42            [ 1] 1846 	jrne 2$ 
      008AFC 72 FB 01         [ 2] 1847 	jp readln_quit
      000ADB                       1848 2$:
      008AFF 9F C7            [ 1] 1849 	cp a,#BS
      008B01 00 0D            [ 1] 1850 	jrne 3$
                                   1851 ; delete left 
      008B03 4F A9            [ 1] 1852     tnz (LL,sp)
      008B05 00 6B            [ 1] 1853     jreq readln_loop
      008B07 01 9E            [ 1] 1854     dec (LL,sp)
      008B09 6B 02            [ 2] 1855     decw y
      008B0B C6 00            [ 1] 1856     clr  (y)
      008B0D 0C 97 7B         [ 4] 1857     call bksp 
      008B10 03 42            [ 2] 1858     jra readln_loop
      000AEE                       1859 3$:
      008B12 72 FB            [ 1] 1860 	cp a,#CTRL_D
      008B14 01 9F            [ 1] 1861 	jrne 4$
                                   1862 ;delete line 
      008B16 C7 00            [ 1] 1863 	ld a,(LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B18 0C 5B 03         [ 4] 1864 	call delete
      008B1B 85 81 16 90      [ 2] 1865 	ldw y,#tib
      008B1D 90 7F            [ 1] 1866 	clr (y)
      008B1D 72 53            [ 1] 1867 	clr (LL,sp)
      008B1F 00 0E            [ 2] 1868 	jra readln_loop
      000B01                       1869 4$:
      008B21 72 53            [ 1] 1870 	cp a,#CTRL_R 
      008B23 00 0D            [ 1] 1871 	jrne 5$
                                   1872 ;reprint 
      008B25 72 53            [ 1] 1873 	tnz (LL,sp)
      008B27 00 0C            [ 1] 1874 	jrne readln_loop
      008B29 A6 01 CB         [ 2] 1875 	ldw x,#tib 
      008B2C 00 0E C7         [ 4] 1876 	call strlen 
      008B2F 00 0E 4F C9      [ 2] 1877 	ldw y,#tib 
      008B33 00               [ 1] 1878 	ld a,xl
      008B34 0D C7            [ 1] 1879 	jreq readln_loop
      008B36 00 0D            [ 1] 1880 	ld (LL,sp),a 
      008B38 4F C9 00         [ 2] 1881 	ldw x,#tib 
      008B3B 0C C7 00         [ 4] 1882 	call puts
      008B3E 0C 81            [ 1] 1883 	clr (LL_HB,sp)
      008B40 72 F9 01         [ 2] 1884 	addw y,(LL_HB,sp)
      008B40 4B 00            [ 2] 1885 	jra readln_loop 
      000B25                       1886 5$:
      008B42 4B 00            [ 1] 1887 	cp a,#CTRL_E 
      008B44 90 AE            [ 1] 1888 	jrne 6$
                                   1889 ;edit line number 
      008B46 16 90 90         [ 2] 1890 	ldw x,#tib 
      008B48 CD 0E 88         [ 4] 1891 	call atoi24
      008B48 CD 83 29         [ 2] 1892 	ldw x,acc16
      008B4B 6B 01 A1         [ 4] 1893 	call search_lineno
      008B4E 0D               [ 2] 1894 	tnzw x 
      008B4F 26 03            [ 1] 1895 	jrne 51$
      008B51 CC 8C            [ 1] 1896 	clr (LL,sp)
      008B53 05 A1 0A 26      [ 2] 1897 	ldw y,#tib 	
      008B57 03 CC            [ 2] 1898 	jra readln_quit  
      000B40                       1899 51$:
      008B59 8C 05 04         [ 2] 1900 	ldw basicptr,x
      008B5B E6 02            [ 1] 1901 	ld a,(2,x)
      008B5B A1 08 26         [ 1] 1902 	ld count,a 
      008B5E 0F 0D 02 27      [ 2] 1903 	ldw y,#tib 
      008B62 E5 0A 02         [ 4] 1904 	call decompile 
      008B65 90 5A            [ 1] 1905 	ld (LL,sp),a 
      008B67 90 7F            [ 1] 1906 	clr (LL_HB,sp)
      008B69 CD 83            [ 1] 1907 	ld a,#CR 
      008B6B 3D 20 DA         [ 4] 1908 	call putc 
      008B6E A6 3E            [ 1] 1909 	ld a,#'>
      008B6E A1 04 26         [ 4] 1910 	call putc 
      008B71 0F 7B 02         [ 4] 1911 	call puts 
      008B74 CD 83            [ 1] 1912 	ldw y,x 
      008B76 4D 90 AE         [ 2] 1913 	jp readln_loop
      000B65                       1914 6$:
                                   1915 ;	cp a,#'[
                                   1916 ;	jreq ansi_seq
      000B65                       1917 final_test:
      008B79 16 90            [ 1] 1918 	cp a,#SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B7B 90 7F            [ 1] 1919 	jrpl accept_char
      008B7D 0F 02 20         [ 2] 1920 	jp readln_loop
      000B6C                       1921 ansi_seq:
                                   1922 ;	call getc
                                   1923 ;	cp a,#'C 
                                   1924 ;	jreq rigth_arrow
                                   1925 ;	cp a,#'D 
                                   1926 ;	jreq left_arrow 
                                   1927 ;	jra final_test
      000B6C                       1928 right_arrow:
                                   1929 ;	ld a,#BSP 
                                   1930 ;	call putc 
                                   1931 ;	jra realn_loop 
      000B6C                       1932 left_arrow:
                                   1933 ;	jra readln_loop
      000B6C                       1934 accept_char:
      008B80 C7 4F            [ 1] 1935 	ld a,#TIB_SIZE-1
      008B81 11 02            [ 1] 1936 	cp a, (LL,sp)
      008B81 A1 12            [ 1] 1937 	jrpl 1$
      008B83 26 20 0D         [ 2] 1938 	jp readln_loop
      008B86 02 26            [ 1] 1939 1$:	ld a,(RXCHAR,sp)
      008B88 BF AE            [ 1] 1940 	ld (y),a
      008B8A 16 90            [ 1] 1941 	inc (LL,sp)
      008B8C CD 84            [ 2] 1942 	incw y
      008B8E 12 90            [ 1] 1943 	clr (y)
      008B90 AE 16 90         [ 4] 1944 	call putc 
      008B93 9F 27 B2         [ 2] 1945 	jp readln_loop
      000B85                       1946 readln_quit:
      008B96 6B 02            [ 1] 1947 	clr (y)
      008B98 AE 16            [ 1] 1948 	ld a,(LL,sp)
      008B9A 90 CD 83         [ 1] 1949 	ld count,a 
      008B9D 33 0F            [ 1] 1950 	ld a,#CR
      008B9F 01 72 F9         [ 4] 1951 	call putc
      000B91                       1952 	_drop VSIZE 
      008BA2 01 20            [ 2]    1     addw sp,#VSIZE 
      008BA4 A3               [ 4] 1953 	ret
                                   1954 
                                   1955 
                                   1956 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1957 ;; compiler routines        ;;
                                   1958 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1959 ;------------------------------------
                                   1960 ; parse quoted string 
                                   1961 ; input:
                                   1962 ;   Y 	pointer to tib 
                                   1963 ;   X   pointer to output buffer 
                                   1964 ; output:
                                   1965 ;	buffer   parsed string
                                   1966 ;------------------------------------
                           000001  1967 	PREV = 1
                           000002  1968 	CURR =2
                           000002  1969 	VSIZE=2
      008BA5                       1970 parse_quote: 
      000B94                       1971 	_vars VSIZE 
      008BA5 A1 05            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BA7 26               [ 1] 1972 	clr a
      008BA8 3C AE            [ 1] 1973 1$:	ld (PREV,sp),a 
      000B99                       1974 2$:	
      008BAA 16 90 CD         [ 4] 1975 	ld a,([in.w],y)
      008BAD 8F 08            [ 1] 1976 	jreq 6$
      008BAF CE 00 0D CD      [ 1] 1977 	inc in 
      008BB3 84 80            [ 1] 1978 	ld (CURR,sp),a 
      008BB5 5D 26            [ 1] 1979 	ld a,#'\
      008BB7 08 0F            [ 1] 1980 	cp a, (PREV,sp)
      008BB9 02 90            [ 1] 1981 	jrne 3$
      008BBB AE 16            [ 1] 1982 	clr (PREV,sp)
      008BBD 90 20            [ 1] 1983 	ld a,(CURR,sp)
      008BBF 45 1C            [ 4] 1984 	callr convert_escape
      008BC0 F7               [ 1] 1985 	ld (x),a 
      008BC0 CF               [ 2] 1986 	incw x 
      008BC1 00 05            [ 2] 1987 	jra 2$
      000BB4                       1988 3$:
      008BC3 E6 02            [ 1] 1989 	ld a,(CURR,sp)
      008BC5 C7 00            [ 1] 1990 	cp a,#'\'
      008BC7 04 90            [ 1] 1991 	jreq 1$
      008BC9 AE 16            [ 1] 1992 	cp a,#'"
      008BCB 90 CD            [ 1] 1993 	jreq 6$ 
      008BCD 94               [ 1] 1994 	ld (x),a 
      008BCE A2               [ 2] 1995 	incw x 
      008BCF 6B 02            [ 2] 1996 	jra 2$
      000BC2                       1997 6$:
      008BD1 0F               [ 1] 1998 	clr (x)
      008BD2 01               [ 2] 1999 	incw x 
      008BD3 A6 0D            [ 1] 2000 	ldw y,x 
      008BD5 CD               [ 1] 2001 	clrw x 
      008BD6 83 20            [ 1] 2002 	ld a,#TK_QSTR  
      000BC9                       2003 	_drop VSIZE
      008BD8 A6 3E            [ 2]    1     addw sp,#VSIZE 
      008BDA CD               [ 4] 2004 	ret 
                                   2005 
                                   2006 ;---------------------------------------
                                   2007 ; called by parse_quote
                                   2008 ; subtitute escaped character 
                                   2009 ; by their ASCII value .
                                   2010 ; input:
                                   2011 ;   A  character following '\'
                                   2012 ; output:
                                   2013 ;   A  substitued char or same if not valid.
                                   2014 ;---------------------------------------
      000BCC                       2015 convert_escape:
      008BDB 83               [ 2] 2016 	pushw x 
      008BDC 20 CD 83         [ 2] 2017 	ldw x,#escaped 
      008BDF 33               [ 1] 2018 1$:	cp a,(x)
      008BE0 90 93            [ 1] 2019 	jreq 2$
      008BE2 CC               [ 1] 2020 	tnz (x)
      008BE3 8B 48            [ 1] 2021 	jreq 3$
      008BE5 5C               [ 2] 2022 	incw x 
      008BE5 20 F7            [ 2] 2023 	jra 1$
      008BE5 A1 20 2A         [ 2] 2024 2$: subw x,#escaped 
      008BE8 03               [ 1] 2025 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BE9 CC 8B            [ 1] 2026 	add a,#7
      008BEB 48               [ 2] 2027 3$:	popw x 
      008BEC 81               [ 4] 2028 	ret 
                                   2029 
      008BEC 61 62 74 6E 76 66 72  2030 escaped: .asciz "abtnvfr"
             00
                                   2031 
                                   2032 ;-------------------------
                                   2033 ; integer parser 
                                   2034 ; input:
                                   2035 ;   X 		point to output buffer  
                                   2036 ;   Y 		point to tib 
                                   2037 ;   A 	    first digit|'$' 
                                   2038 ; output:  
                                   2039 ;   X 		integer 
                                   2040 ;   A 		TK_INTGR
                                   2041 ;   acc24   24 bits integer 
                                   2042 ;-------------------------
                           000001  2043 	BASE=1
                           000002  2044 	TCHAR=2 
                           000003  2045 	XSAVE=3
                           000004  2046 	VSIZE=4 
      008BEC                       2047 parse_integer: ; { -- n }
      008BEC 89               [ 2] 2048 	pushw x 	
      008BEC A6 4F            [ 1] 2049 	push #0 ; TCHAR
      008BEE 11 02            [ 1] 2050 	push #10 ; BASE=10
      008BF0 2A 03            [ 1] 2051 	cp a,#'$
      008BF2 CC 8B            [ 1] 2052 	jrne 2$ 
      000BF2                       2053     _drop #1
      008BF4 48 7B            [ 2]    1     addw sp,##1 
      008BF6 01 90            [ 1] 2054 	push #16  ; BASE=16
      008BF8 F7               [ 1] 2055 2$:	ld (x),a 
      008BF9 0C               [ 2] 2056 	incw x 
      008BFA 02 90 5C         [ 4] 2057 	ld a,([in.w],y)
      008BFD 90 7F CD 83      [ 1] 2058 	inc in 
      008C01 20 CC 8B         [ 4] 2059 	call to_upper 
      008C04 48 02            [ 1] 2060 	ld (TCHAR,sp),a 
      008C05 CD 05 7C         [ 4] 2061 	call is_digit 
      008C05 90 7F            [ 1] 2062 	jrc 2$
      008C07 7B 02            [ 1] 2063 	ld a,#16 
      008C09 C7 00            [ 1] 2064 	cp a,(BASE,sp)
      008C0B 04 A6            [ 1] 2065 	jrne 3$ 
      008C0D 0D CD            [ 1] 2066 	ld a,(TCHAR,sp)
      008C0F 83 20            [ 1] 2067 	cp a,#'A 
      008C11 5B 02            [ 1] 2068 	jrmi 3$ 
      008C13 81 47            [ 1] 2069 	cp a,#'G 
      008C14 2B DD            [ 1] 2070 	jrmi 2$ 
      008C14 52 02 4F 6B      [ 1] 2071 3$: dec in 	
      008C18 01               [ 1] 2072     clr (x)
      008C19 1E 03            [ 2] 2073 	ldw x,(XSAVE,sp)
      008C19 91 D6 01         [ 4] 2074 	call atoi24
      008C1C 27 24            [ 1] 2075 	ldw y,x 
      008C1E 72 5C 00         [ 2] 2076 	ldw x,acc16 
      008C21 02 6B            [ 1] 2077 	ld a,#TK_INTGR
      008C23 02 A6            [ 2] 2078 	ldw (y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C25 5C 11 01 26      [ 2] 2079 	addw y,#2
      000C30                       2080 	_drop VSIZE  
      008C29 0A 0F            [ 2]    1     addw sp,#VSIZE 
      008C2B 01               [ 4] 2081 	ret 	
                                   2082 
                                   2083 ;-------------------------
                                   2084 ; binary integer parser
                                   2085 ; build integer in acc24  
                                   2086 ; input:
                                   2087 ;   X 		point to output buffer  
                                   2088 ;   Y 		point to tib 
                                   2089 ;   A 	    '&' 
                                   2090 ; output:  
                                   2091 ;   buffer  TK_INTGR integer  
                                   2092 ;   X 		int16 
                                   2093 ;   A 		TK_INTGR
                                   2094 ;   acc24    int24 
                                   2095 ;-------------------------
                           000001  2096 	BINARY=1 ; 24 bits integer 
                           000003  2097 	VSIZE=3
      000C33                       2098 parse_binary: ; { -- n }
      008C2C 7B 02            [ 1] 2099 	push #0
      008C2E AD 1C            [ 1] 2100 	push #0
      008C30 F7 5C            [ 1] 2101 	push #0
      000C39                       2102 2$:	
      008C32 20 E5 00         [ 4] 2103 	ld a,([in.w],y)
      008C34 72 5C 00 01      [ 1] 2104 	inc in 
      008C34 7B 02            [ 1] 2105 	cp a,#'0 
      008C36 A1 5C            [ 1] 2106 	jreq 3$
      008C38 27 DD            [ 1] 2107 	cp a,#'1 
      008C3A A1 22            [ 1] 2108 	jreq 3$ 
      008C3C 27 04            [ 2] 2109 	jra bin_exit 
      008C3E F7 5C            [ 1] 2110 3$: sub a,#'0 
      008C40 20               [ 1] 2111 	rrc a
      008C41 D7 03            [ 1] 2112 	rlc (BINARY+2,sp) 
      008C42 09 02            [ 1] 2113 	rlc (BINARY+1,sp)
      008C42 7F 5C            [ 1] 2114 	rlc (BINARY,sp) 
      008C44 90 93            [ 2] 2115 	jra 2$  
      000C55                       2116 bin_exit:
      008C46 5F A6 02 5B      [ 1] 2117 	dec in 
      008C4A 02 81            [ 1] 2118 	ldw y,x
      008C4C 7B 01            [ 1] 2119 	ld a,(BINARY,sp)
      008C4C 89 AE 8C         [ 1] 2120 	ld acc24,a 
      008C4F 61 F1            [ 2] 2121 	ldw x,(BINARY+1,sp)
      008C51 27 06 7D         [ 2] 2122 	ldw acc16,x
      008C54 27 09            [ 2] 2123 	ldw (y),x 
      008C56 5C 20 F7 1D      [ 2] 2124 	addw y,#2  
      008C5A 8C 61            [ 1] 2125 	ld a,#TK_INTGR 	
      000C6D                       2126 	_drop VSIZE 
      008C5C 9F AB            [ 2]    1     addw sp,#VSIZE 
      008C5E 07               [ 4] 2127 	ret
                                   2128 
                                   2129 ;---------------------------
                                   2130 ;  token begin with a letter,
                                   2131 ;  is keyword or variable. 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2132 ; input:
                                   2133 ;   X 		point to pad 
                                   2134 ;   Y 		point to text
                                   2135 ;   A 	    first letter  
                                   2136 ; output:
                                   2137 ;   X		exec_addr|var_addr 
                                   2138 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2139 ;   pad 	keyword|var_name  
                                   2140 ;--------------------------  
                           000001  2141 	XFIRST=1
                           000002  2142 	VSIZE=2
      000C70                       2143 parse_keyword: 
      008C5F 85               [ 2] 2144 	pushw x 
      000C71                       2145 kw_loop:	
      008C60 81 61 62         [ 4] 2146 	call to_upper 
      008C63 74               [ 1] 2147 	ld (x),a 
      008C64 6E               [ 2] 2148 	incw x 
      008C65 76 66 72         [ 4] 2149 	ld a,([in.w],y)
      008C68 00 5C 00 01      [ 1] 2150 	inc in 
      008C69 CD 05 6B         [ 4] 2151 	call is_alpha 
      008C69 89 4B            [ 1] 2152 	jrc kw_loop
      008C6B 00 4B 0A A1      [ 1] 2153 	dec in   
      008C6F 24               [ 1] 2154 1$: clr (x)
      008C70 26 04            [ 2] 2155 	ldw x,(XFIRST,sp) 
      008C72 5B 01            [ 1] 2156 	ld a,(1,x)
      008C74 4B 10            [ 1] 2157 	jrne 2$
                                   2158 ; one letter variable name 
      008C76 F7               [ 1] 2159 	ld a,(x) 
      008C77 5C 91            [ 1] 2160 	sub a,#'A 
      008C79 D6               [ 1] 2161 	sll a 
      008C7A 01               [ 1] 2162 	push a 
      008C7B 72 5C            [ 1] 2163 	push #0
      008C7D 00 02 CD         [ 2] 2164 	ldw x,#vars 
      008C80 8E FC 6B         [ 2] 2165 	addw x,(1,sp) ; X=var address 
      000C9A                       2166 	_drop 2 
      008C83 02 CD            [ 2]    1     addw sp,#2 
      008C85 85 FC            [ 1] 2167 	ld a,#TK_VAR 
      008C87 25 ED            [ 2] 2168 	jra 4$ 
      000CA0                       2169 2$: ; check for keyword, otherwise syntax error.
      000CA0                       2170 	_ldx_dict kword_dict ; dictionary entry point
      008C89 A6 10 11         [ 2]    1     ldw x,#kword_dict+2
      008C8C 01 26            [ 2] 2171 	ldw y,(XFIRST,sp) ; name to search for
      008C8E 0A 7B 02         [ 4] 2172 	call search_dict
      008C91 A1               [ 1] 2173 	tnz a
      008C92 41 2B            [ 1] 2174 	jrne 4$ 
      008C94 04 A1 47         [ 2] 2175 	jp syntax_error
      000CAE                       2176 4$:	
      008C97 2B DD            [ 2] 2177 	ldw y,(XFIRST,sp)
      008C99 72 5A            [ 1] 2178 	ld (y),a 
      008C9B 00 02            [ 2] 2179 	incw y 
      008C9D 7F 1E            [ 2] 2180 	ldw (y),x
      008C9F 03 CD 8F 08      [ 2] 2181 	addw y,#2  
      000CBA                       2182 	_drop VSIZE 
      008CA3 90 93            [ 2]    1     addw sp,#VSIZE 
      008CA5 CE               [ 4] 2183 	ret  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2184 
                                   2185 
                                   2186 ;------------------------------------
                                   2187 ; scan text for next token
                                   2188 ; input: 
                                   2189 ;	X 		pointer to buffer where 
                                   2190 ;	        token id and value are copied 
                                   2191 ; use:
                                   2192 ;	Y   pointer to text in tib 
                                   2193 ; output:
                                   2194 ;   A       token attribute 
                                   2195 ;   X 		token value
                                   2196 ;   Y       updated position in output buffer   
                                   2197 ;------------------------------------
                                   2198 	; use to check special character 
                                   2199 	.macro _case c t  
                                   2200 	ld a,#c 
                                   2201 	cp a,(TCHAR,sp) 
                                   2202 	jrne t
                                   2203 	.endm 
                                   2204 
                           000001  2205 	TCHAR=1
                           000002  2206 	ATTRIB=2
                           000002  2207 	VSIZE=2
      000CBD                       2208 get_token: 
      000CBD                       2209 	_vars VSIZE
      008CA6 00 0D            [ 2]    1     sub sp,#VSIZE 
                                   2210 ;	ld a,in 
                                   2211 ;	sub a,count
                                   2212 ;   jrmi 0$
                                   2213 ;	clr a 
                                   2214 ;	ret 
      000CBF                       2215 0$: 
      008CA8 A6 84 90 FF      [ 2] 2216 	ldw y,#tib    	
      008CAC 72 A9            [ 1] 2217 	ld a,#SPACE
      008CAE 00 02 5B         [ 4] 2218 	call skip
      008CB1 04 81 01 00 02   [ 1] 2219 	mov in.saved,in 
      008CB3 91 D6 00         [ 4] 2220 	ld a,([in.w],y)
      008CB3 4B 00            [ 1] 2221 	jrne 1$
      008CB5 4B 00            [ 1] 2222 	ldw y,x 
      008CB7 4B 00 79         [ 2] 2223 	jp token_exit ; end of line 
      008CB9 72 5C 00 01      [ 1] 2224 1$:	inc in 
      008CB9 91 D6 01         [ 4] 2225 	call to_upper 
      008CBC 72 5C            [ 1] 2226 	ld (TCHAR,sp),a 
                                   2227 ; check for quoted string
      000CE0                       2228 str_tst:  	
      000CE0                       2229 	_case '"' nbr_tst
      008CBE 00 02            [ 1]    1 	ld a,#'"' 
      008CC0 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC2 27 06            [ 1]    3 	jrne nbr_tst
      008CC4 A1 31            [ 1] 2230 	ld a,#TK_QSTR
      008CC6 27               [ 1] 2231 	ld (x),a 
      008CC7 02               [ 2] 2232 	incw x 
      008CC8 20 0B A0         [ 4] 2233 	call parse_quote
      008CCB 30 46 09         [ 2] 2234 	jp token_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      000CF0                       2235 nbr_tst:
                                   2236 ; check for hexadecimal number 
      008CCE 03 09            [ 1] 2237 	ld a,#'$'
      008CD0 02 09            [ 1] 2238 	cp a,(TCHAR,sp) 
      008CD2 01 20            [ 1] 2239 	jreq 1$
                                   2240 ;check for binary number 
      008CD4 E4 26            [ 1] 2241 	ld a,#'&
      008CD5 11 01            [ 1] 2242 	cp a,(TCHAR,sp)
      008CD5 72 5A            [ 1] 2243 	jrne 0$
      008CD7 00 02            [ 1] 2244 	ld a,#TK_INTGR
      008CD9 90               [ 1] 2245 	ld (x),a 
      008CDA 93               [ 2] 2246 	incw x 
      008CDB 7B 01 C7         [ 4] 2247 	call parse_binary ; expect binary integer 
      008CDE 00 0C 1E         [ 2] 2248 	jp token_exit 
                                   2249 ; check for decimal number 	
      008CE1 02 CF            [ 1] 2250 0$:	ld a,(TCHAR,sp)
      008CE3 00 0D 90         [ 4] 2251 	call is_digit
      008CE6 FF 72            [ 1] 2252 	jrnc 3$
      008CE8 A9 00            [ 1] 2253 1$:	ld a,#TK_INTGR 
      008CEA 02               [ 1] 2254 	ld (x),a 
      008CEB A6               [ 2] 2255 	incw x 
      008CEC 84 5B            [ 1] 2256 	ld a,(TCHAR,sp)
      008CEE 03 81 E9         [ 4] 2257 	call parse_integer 
      008CF0 CC 0E 79         [ 2] 2258 	jp token_exit 
      000D19                       2259 3$: 
      000D19                       2260 	_case '(' bkslsh_tst 
      008CF0 89 28            [ 1]    1 	ld a,#'(' 
      008CF1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF1 CD 8E            [ 1]    3 	jrne bkslsh_tst
      008CF3 FC F7            [ 1] 2261 	ld a,#TK_LPAREN
      008CF5 5C 91 D6         [ 2] 2262 	jp token_char   	
      000D24                       2263 bkslsh_tst: ; character token 
      000D24                       2264 	_case '\',rparnt_tst
      008CF8 01 72            [ 1]    1 	ld a,#'\' 
      008CFA 5C 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFC 02 CD            [ 1]    3 	jrne rparnt_tst
      008CFE 85 EB            [ 1] 2265 	ld a,#TK_CHAR 
      008D00 25               [ 1] 2266 	ld (x),a 
      008D01 EF               [ 2] 2267 	incw x 
      008D02 72 5A 00         [ 4] 2268 	ld a,([in.w],y)
      008D05 02               [ 1] 2269 	ld (x),a 
      008D06 7F               [ 2] 2270 	incw x
      008D07 1E 01            [ 1] 2271 	ldw y,x 	 
      008D09 E6 01 26 13      [ 1] 2272 	inc in  
      008D0D F6               [ 1] 2273 	clrw x 
      008D0E A0               [ 1] 2274 	ld xl,a 
      008D0F 41 48            [ 1] 2275 	ld a,#TK_CHAR 
      008D11 88 4B 00         [ 2] 2276 	jp token_exit 
      000D40                       2277 rparnt_tst:		
      000D40                       2278 	_case ')' colon_tst 
      008D14 AE 00            [ 1]    1 	ld a,#')' 
      008D16 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D18 FB 01            [ 1]    3 	jrne colon_tst
      008D1A 5B 02            [ 1] 2279 	ld a,#TK_RPAREN 
      008D1C A6 85 20         [ 2] 2280 	jp token_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      000D4B                       2281 colon_tst:
      000D4B                       2282 	_case ':' comma_tst 
      008D1F 0E 3A            [ 1]    1 	ld a,#':' 
      008D20 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D20 AE A7            [ 1]    3 	jrne comma_tst
      008D22 CC 16            [ 1] 2283 	ld a,#TK_COLON 
      008D24 01 CD 91         [ 2] 2284 	jp token_char  
      000D56                       2285 comma_tst:
      000D56                       2286 	_case COMMA sharp_tst 
      008D27 06 4D            [ 1]    1 	ld a,#COMMA 
      008D29 26 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2B CC 88            [ 1]    3 	jrne sharp_tst
      008D2D FE 09            [ 1] 2287 	ld a,#TK_COMMA
      008D2E CC 0E 75         [ 2] 2288 	jp token_char
      000D61                       2289 sharp_tst:
      000D61                       2290 	_case SHARP dash_tst 
      008D2E 16 01            [ 1]    1 	ld a,#SHARP 
      008D30 90 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D32 90 5C            [ 1]    3 	jrne dash_tst
      008D34 90 FF            [ 1] 2291 	ld a,#TK_SHARP
      008D36 72 A9 00         [ 2] 2292 	jp token_char  	 	 
      000D6C                       2293 dash_tst: 	
      000D6C                       2294 	_case '-' at_tst 
      008D39 02 5B            [ 1]    1 	ld a,#'-' 
      008D3B 02 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3D 26 05            [ 1]    3 	jrne at_tst
      008D3D 52 02            [ 1] 2295 	ld a,#TK_MINUS  
      008D3F CC 0E 75         [ 2] 2296 	jp token_char 
      000D77                       2297 at_tst:
      000D77                       2298 	_case '@' qmark_tst 
      008D3F 90 AE            [ 1]    1 	ld a,#'@' 
      008D41 16 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008D43 A6 20            [ 1]    3 	jrne qmark_tst
      008D45 CD 8F            [ 1] 2299 	ld a,#TK_ARRAY 
      008D47 72 55 00         [ 2] 2300 	jp token_char
      000D82                       2301 qmark_tst:
      000D82                       2302 	_case '?' tick_tst 
      008D4A 02 00            [ 1]    1 	ld a,#'?' 
      008D4C 03 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4E D6 01            [ 1]    3 	jrne tick_tst
      008D50 26 05            [ 1] 2303 	ld a,#TK_CMD  
      008D52 90               [ 1] 2304 	ld (x),a 
      008D53 93               [ 2] 2305 	incw x 
      008D54 CC 8E            [ 1] 2306 	ldw y,x 
      008D56 F9 72 5C         [ 2] 2307 	ldw x,#print 
      008D59 00 02            [ 2] 2308 	ldw (y),x 
      008D5B CD 8E FC 6B      [ 2] 2309 	addw y,#2
      008D5F 01 0E 79         [ 2] 2310 	jp token_exit
      008D60                       2311 tick_tst: ; comment 
      000D9A                       2312 	_case TICK plus_tst 
      008D60 A6 22            [ 1]    1 	ld a,#TICK 
      008D62 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D64 26 0A            [ 1]    3 	jrne plus_tst
      008D66 A6 02            [ 1] 2313 	ld a,#TK_CMD
      008D68 F7               [ 1] 2314 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D69 5C               [ 2] 2315 	incw x
      008D6A CD 8C 14 CC      [ 2] 2316 	ldw y,#remark
      008D6E 8E               [ 2] 2317 	ldw (x),y 
      008D6F F9 00 02         [ 2] 2318 	addw x,#2  
      008D70                       2319 copy_comment:
      008D70 A6 24 11 01      [ 2] 2320 	ldw y,#tib 
      008D74 27 17 A6 26      [ 2] 2321 	addw y,in.w
      008D78 11 01            [ 2] 2322 	pushw y
      008D7A 26 0A A6         [ 4] 2323 	call strcpy
      008D7D 84 F7 5C         [ 2] 2324     subw y,(1,sp)
      008D80 CD 8C            [ 1] 2325 	ld a,yl 
      008D82 B3 CC 8E         [ 1] 2326 	add a,in
      008D85 F9 7B 01         [ 1] 2327 	ld in,a 
      008D88 CD 85            [ 2] 2328 	ldw (1,sp),x
      008D8A FC 24 0C         [ 2] 2329 	addw y,(1,sp)
      008D8D A6 84            [ 2] 2330 	incw y 
      000DCB                       2331 	_drop 2 
      008D8F F7 5C            [ 2]    1     addw sp,#2 
      008D91 7B 01 CD         [ 2] 2332 	ldw x,#remark 
      008D94 8C 69            [ 1] 2333 	ld a,#TK_CMD 
      008D96 CC 8E F9         [ 2] 2334 	jp token_exit 
      008D99                       2335 plus_tst:
      000DD5                       2336 	_case '+' star_tst 
      008D99 A6 28            [ 1]    1 	ld a,#'+' 
      008D9B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9D 26 05            [ 1]    3 	jrne star_tst
      008D9F A6 07            [ 1] 2337 	ld a,#TK_PLUS  
      008DA1 CC 8E F5         [ 2] 2338 	jp token_char 
      008DA4                       2339 star_tst:
      000DE0                       2340 	_case '*' slash_tst 
      008DA4 A6 5C            [ 1]    1 	ld a,#'*' 
      008DA6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA8 26 16            [ 1]    3 	jrne slash_tst
      008DAA A6 03            [ 1] 2341 	ld a,#TK_MULT 
      008DAC F7 5C 91         [ 2] 2342 	jp token_char 
      000DEB                       2343 slash_tst: 
      000DEB                       2344 	_case '/' prcnt_tst 
      008DAF D6 01            [ 1]    1 	ld a,#'/' 
      008DB1 F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB3 90 93            [ 1]    3 	jrne prcnt_tst
      008DB5 72 5C            [ 1] 2345 	ld a,#TK_DIV 
      008DB7 00 02 5F         [ 2] 2346 	jp token_char 
      000DF6                       2347 prcnt_tst:
      000DF6                       2348 	_case '%' eql_tst 
      008DBA 97 A6            [ 1]    1 	ld a,#'%' 
      008DBC 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBE 8E F9            [ 1]    3 	jrne eql_tst
      008DC0 A6 22            [ 1] 2349 	ld a,#TK_MOD
      008DC0 A6 29 11         [ 2] 2350 	jp token_char  
                                   2351 ; 1 or 2 character tokens 	
      000E01                       2352 eql_tst:
      000E01                       2353 	_case '=' gt_tst 		
      008DC3 01 26            [ 1]    1 	ld a,#'=' 
      008DC5 05 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC7 08 CC            [ 1]    3 	jrne gt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DC9 8E F5            [ 1] 2354 	ld a,#TK_EQUAL
      008DCB CC 0E 75         [ 2] 2355 	jp token_char 
      000E0C                       2356 gt_tst:
      000E0C                       2357 	_case '>' lt_tst 
      008DCB A6 3A            [ 1]    1 	ld a,#'>' 
      008DCD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCF 26 05            [ 1]    3 	jrne lt_tst
      008DD1 A6 01            [ 1] 2358 	ld a,#TK_GT 
      008DD3 CC 8E            [ 1] 2359 	ld (ATTRIB,sp),a 
      008DD5 F5 5C 00 01      [ 1] 2360 	inc in 
      008DD6 91 D6 00         [ 4] 2361 	ld a,([in.w],y)
      008DD6 A6 2C            [ 1] 2362 	cp a,#'=
      008DD8 11 01            [ 1] 2363 	jrne 1$
      008DDA 26 05            [ 1] 2364 	ld a,#TK_GE 
      008DDC A6 09            [ 2] 2365 	jra token_char  
      008DDE CC 8E            [ 1] 2366 1$: cp a,#'<
      008DE0 F5 04            [ 1] 2367 	jrne 2$
      008DE1 A6 35            [ 1] 2368 	ld a,#TK_NE 
      008DE1 A6 23            [ 2] 2369 	jra token_char 
      008DE3 11 01 26 05      [ 1] 2370 2$: dec in
      008DE7 A6 0A            [ 1] 2371 	ld a,(ATTRIB,sp)
      008DE9 CC 8E            [ 2] 2372 	jra token_char 	 
      000E35                       2373 lt_tst:
      000E35                       2374 	_case '<' other
      008DEB F5 3C            [ 1]    1 	ld a,#'<' 
      008DEC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEC A6 2D            [ 1]    3 	jrne other
      008DEE 11 01            [ 1] 2375 	ld a,#TK_LT 
      008DF0 26 05            [ 1] 2376 	ld (ATTRIB,sp),a 
      008DF2 A6 11 CC 8E      [ 1] 2377 	inc in 
      008DF6 F5 D6 00         [ 4] 2378 	ld a,([in.w],y)
      008DF7 A1 3D            [ 1] 2379 	cp a,#'=
      008DF7 A6 40            [ 1] 2380 	jrne 1$
      008DF9 11 01            [ 1] 2381 	ld a,#TK_LE 
      008DFB 26 05            [ 2] 2382 	jra token_char 
      008DFD A6 06            [ 1] 2383 1$: cp a,#'>
      008DFF CC 8E            [ 1] 2384 	jrne 2$
      008E01 F5 35            [ 1] 2385 	ld a,#TK_NE 
      008E02 20 1F            [ 2] 2386 	jra token_char 
      008E02 A6 3F 11 01      [ 1] 2387 2$: dec in 
      008E06 26 12            [ 1] 2388 	ld a,(ATTRIB,sp)
      008E08 A6 80            [ 2] 2389 	jra token_char 	
      000E5E                       2390 other: ; not a special character 	 
      008E0A F7 5C            [ 1] 2391 	ld a,(TCHAR,sp)
      008E0C 90 93 AE         [ 4] 2392 	call is_alpha 
      008E0F 96 20            [ 1] 2393 	jrc 30$ 
      008E11 90 FF 72         [ 2] 2394 	jp syntax_error 
      000E68                       2395 30$: 
      008E14 A9 00 02         [ 4] 2396 	call parse_keyword
      008E17 CC 8E F9         [ 2] 2397 	cpw x,#remark 
      008E1A 26 09            [ 1] 2398 	jrne token_exit 
      008E1A A6 27            [ 1] 2399 	ldw y,x 
      008E1C 11 01 26         [ 2] 2400 	jp copy_comment 
      000E75                       2401 token_char:
      008E1F 35               [ 1] 2402 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E20 A6               [ 2] 2403 	incw x
      008E21 80 F7            [ 1] 2404 	ldw y,x 
      000E79                       2405 token_exit:
      000E79                       2406 	_drop VSIZE 
      008E23 5C 90            [ 2]    1     addw sp,#VSIZE 
      008E25 AE               [ 4] 2407 	ret
                                   2408 
                                   2409 
                                   2410 ;------------------------------------
                                   2411 ; convert alpha to uppercase
                                   2412 ; input:
                                   2413 ;    a  character to convert
                                   2414 ; output:
                                   2415 ;    a  uppercase character
                                   2416 ;------------------------------------
      000E7C                       2417 to_upper::
      008E26 97 1D            [ 1] 2418 	cp a,#'a
      008E28 FF 1C            [ 1] 2419 	jrpl 1$
      008E2A 00               [ 4] 2420 0$:	ret
      008E2B 02 7A            [ 1] 2421 1$: cp a,#'z	
      008E2C 22 FB            [ 1] 2422 	jrugt 0$
      008E2C 90 AE            [ 1] 2423 	sub a,#32
      008E2E 16               [ 4] 2424 	ret
                                   2425 	
                                   2426 ;------------------------------------
                                   2427 ; convert pad content in integer
                                   2428 ; input:
                                   2429 ;    x		.asciz to convert
                                   2430 ; output:
                                   2431 ;    acc24      int24_t
                                   2432 ;------------------------------------
                                   2433 	; local variables
                           000001  2434 	SIGN=1 ; 1 byte, 
                           000002  2435 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2436 	TEMP=3 ; 1 byte, temporary storage
                           000003  2437 	VSIZE=3 ; 3 bytes reserved for local storage
      000E88                       2438 atoi24:
      008E2F 90               [ 2] 2439 	pushw x 
      000E89                       2440 	_vars VSIZE
      008E30 72 B9            [ 2]    1     sub sp,#VSIZE 
                                   2441 	; acc24=0 
      008E32 00 01 90 89      [ 1] 2442 	clr acc24    
      008E36 CD 84 30 72      [ 1] 2443 	clr acc16
      008E3A F2 01 90 9F      [ 1] 2444 	clr acc8 
      008E3E CB 00            [ 1] 2445 	clr (SIGN,sp)
      008E40 02 C7            [ 1] 2446 	ld a,#10
      008E42 00 02            [ 1] 2447 	ld (BASE,sp),a ; default base decimal
      008E44 1F               [ 1] 2448 	ld a,(x)
      008E45 01 72            [ 1] 2449 	jreq 9$  ; completed if 0
      008E47 F9 01            [ 1] 2450 	cp a,#'-
      008E49 90 5C            [ 1] 2451 	jrne 1$
      008E4B 5B 02            [ 1] 2452 	cpl (SIGN,sp)
      008E4D AE 97            [ 2] 2453 	jra 2$
      008E4F 1D A6            [ 1] 2454 1$: cp a,#'$
      008E51 80 CC            [ 1] 2455 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E53 8E F9            [ 1] 2456 	ld a,#16
      008E55 6B 02            [ 1] 2457 	ld (BASE,sp),a
      008E55 A6               [ 2] 2458 2$:	incw x
      008E56 2B               [ 1] 2459 	ld a,(x)
      000EB2                       2460 3$:	
      008E57 11 01            [ 1] 2461 	cp a,#'a
      008E59 26 05            [ 1] 2462 	jrmi 4$
      008E5B A6 10            [ 1] 2463 	sub a,#32
      008E5D CC 8E            [ 1] 2464 4$:	cp a,#'0
      008E5F F5 2B            [ 1] 2465 	jrmi 9$
      008E60 A0 30            [ 1] 2466 	sub a,#'0
      008E60 A6 2A            [ 1] 2467 	cp a,#10
      008E62 11 01            [ 1] 2468 	jrmi 5$
      008E64 26 05            [ 1] 2469 	sub a,#7
      008E66 A6 20            [ 1] 2470 	cp a,(BASE,sp)
      008E68 CC 8E            [ 1] 2471 	jrpl 9$
      008E6A F5 03            [ 1] 2472 5$:	ld (TEMP,sp),a
      008E6B 7B 02            [ 1] 2473 	ld a,(BASE,sp)
      008E6B A6 2F 11         [ 4] 2474 	call mulu24_8
      008E6E 01 26            [ 1] 2475 	ld a,(TEMP,sp)
      008E70 05 A6 21         [ 1] 2476 	add a,acc24+2
      008E73 CC 8E F5         [ 1] 2477 	ld acc24+2,a
      008E76 4F               [ 1] 2478 	clr a
      008E76 A6 25 11         [ 1] 2479 	adc a,acc24+1
      008E79 01 26 05         [ 1] 2480 	ld acc24+1,a
      008E7C A6               [ 1] 2481 	clr a
      008E7D 22 CC 8E         [ 1] 2482 	adc a,acc24
      008E80 F5 00 0B         [ 1] 2483 	ld acc24,a
      008E81 20 C9            [ 2] 2484 	jra 2$
      008E81 A6 3D            [ 1] 2485 9$:	tnz (SIGN,sp)
      008E83 11 01            [ 1] 2486     jreq atoi_exit
      008E85 26 05 A6         [ 4] 2487     call neg_acc24
      000EEE                       2488 atoi_exit: 
      000EEE                       2489 	_drop VSIZE
      008E88 32 CC            [ 2]    1     addw sp,#VSIZE 
      008E8A 8E               [ 2] 2490 	popw x ; restore x
      008E8B F5               [ 4] 2491 	ret
                                   2492 
                                   2493 
                                   2494 ;------------------------------------
                                   2495 ; skip character c in text starting from 'in'
                                   2496 ; input:
                                   2497 ;	 y 		point to text buffer
                                   2498 ;    a 		character to skip
                                   2499 ; output:  
                                   2500 ;	'in' ajusted to new position
                                   2501 ;------------------------------------
                           000001  2502 	C = 1 ; local var
      008E8C                       2503 skip:
      008E8C A6               [ 1] 2504 	push a
      008E8D 3E 11 01         [ 4] 2505 1$:	ld a,([in.w],y)
      008E90 26 23            [ 1] 2506 	jreq 2$
      008E92 A6 31            [ 1] 2507 	cp a,(C,sp)
      008E94 6B 02            [ 1] 2508 	jrne 2$
      008E96 72 5C 00 02      [ 1] 2509 	inc in
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E9A 91 D6            [ 2] 2510 	jra 1$
      000F02                       2511 2$: _drop 1 
      008E9C 01 A1            [ 2]    1     addw sp,#1 
      008E9E 3D               [ 4] 2512 	ret
                                   2513 	
                                   2514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2515 ;;   TINY BASIC  operators,
                                   2516 ;;   commands and functions 
                                   2517 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2518 
                                   2519 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2520 ;;  Arithmetic operators
                                   2521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2522 
                                   2523 ;debug support
                           000001  2524 DEBUG_PRT=1
                           000001  2525 .if DEBUG_PRT 
      000F05                       2526 printxy:
      008E9F 26 04 A6         [ 1] 2527 	ld a,base 
      008EA2 33               [ 1] 2528 	push a 
      008EA3 20               [ 2] 2529 	pushw x 
      008EA4 50 A1            [ 2] 2530 	pushw y
      008EA6 3C 26 04 A6      [ 1] 2531 	mov base,#16 
      008EAA 35 20 48         [ 4] 2532 	call print_int
      008EAD 72 5A            [ 1] 2533 	ld a,#SPACE 
      008EAF 00 02 7B         [ 4] 2534 	call putc  
      008EB2 02 20            [ 2] 2535 	ldw x,(1,sp)
      008EB4 40 09 C5         [ 4] 2536 	call print_int 
      008EB5 A6 0D            [ 1] 2537 	ld a,#CR 
      008EB5 A6 3C 11         [ 4] 2538 	call putc 
      008EB8 01 26            [ 2] 2539 	popw y 
      008EBA 23               [ 2] 2540 	popw x 
      008EBB A6               [ 1] 2541 	pop a 
      008EBC 34 6B 02         [ 1] 2542 	ld base,a 
      008EBF 72               [ 4] 2543 	ret 
                                   2544 .endif 
                                   2545 
                                   2546 
                                   2547 ;--------------------------------------
                                   2548 ;  multiply 2 uint16_t return uint32_t
                                   2549 ;  input:
                                   2550 ;     x       uint16_t 
                                   2551 ;     y       uint16_t 
                                   2552 ;  output:
                                   2553 ;     x       product bits 15..0
                                   2554 ;     y       product bits 31..16 
                                   2555 ;---------------------------------------
                           000001  2556 		U1=1  ; uint16_t 
                           000003  2557 		DBL=3 ; uint32_t
                           000006  2558 		VSIZE=6
      000F2A                       2559 umstar:
      000F2A                       2560 	_vars VSIZE 
      008EC0 5C 00            [ 2]    1     sub sp,#VSIZE 
      008EC2 02 91            [ 2] 2561 	ldw (U1,sp),x 
                                   2562 ;initialize bits 31..16 of 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2563 ;product to zero 
      008EC4 D6 01            [ 1] 2564 	clr (DBL,sp)
      008EC6 A1 3D            [ 1] 2565 	clr (DBL+1,sp)
                                   2566 ; produc U1L*U2L 
      008EC8 26 04            [ 1] 2567 	ld a,yl 
      008ECA A6               [ 4] 2568 	mul x,a 
      008ECB 36 20            [ 2] 2569 	ldw (DBL+2,sp),x
                                   2570 ; product U1H*U2L 
      008ECD 27 A1            [ 1] 2571 	ld a,(U1,sp) ; xh 
      008ECF 3E               [ 1] 2572 	ldw x,y
      008ED0 26               [ 4] 2573 	mul x,a 
      008ED1 04               [ 1] 2574 	clr a 
      008ED2 A6 35 20         [ 2] 2575 	addw x,(DBL+1,sp) 
      008ED5 1F               [ 1] 2576 	clr a 
      008ED6 72 5A            [ 1] 2577 	adc a,(DBL,sp) 
      008ED8 00 02            [ 1] 2578 	ld (DBL,sp),a ; bits 23..17 
      008EDA 7B 02            [ 2] 2579 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2580 ; product U1L*U2H
      008EDC 20 17            [ 1] 2581 	swapw y 
      008EDE 93               [ 1] 2582 	ldw x,y
      008EDE 7B 01            [ 1] 2583 	ld a,(U1+1,sp)
      008EE0 CD               [ 4] 2584 	mul x,a
      008EE1 85 EB 25         [ 2] 2585 	addw x,(DBL+1,sp)
      008EE4 03               [ 1] 2586 	clr a 
      008EE5 CC 88            [ 1] 2587 	adc a,(DBL,sp)
      008EE7 FE 03            [ 1] 2588 	ld (DBL,sp),a 
      008EE8 1F 04            [ 2] 2589 	ldw (DBL+1,sp),x 
                                   2590 ; product U1H*U2H 	
      008EE8 CD 8C            [ 1] 2591 	ld a,(U1,sp)
      008EEA F0               [ 1] 2592 	ldw x,y  
      008EEB A3               [ 4] 2593 	mul x,a 
      008EEC 97 1D 26         [ 2] 2594 	addw x,(DBL,sp)
      008EEF 09 90            [ 1] 2595 	ldw y,x 
      008EF1 93 CC            [ 2] 2596 	ldw x,(DBL+2,sp)
      000F61                       2597 	_drop VSIZE 
      008EF3 8E 2C            [ 2]    1     addw sp,#VSIZE 
      008EF5 81               [ 4] 2598 	ret
                                   2599 
                                   2600 
                                   2601 ;-------------------------------------
                                   2602 ; multiply 2 integers
                                   2603 ; input:
                                   2604 ;  	x       n1 
                                   2605 ;   y 		n2 
                                   2606 ; output:
                                   2607 ;	X        N1*N2 bits 15..0
                                   2608 ;   Y        N1*N2 bits 31..16 
                                   2609 ;-------------------------------------
                           000001  2610 	SIGN=1
                           000001  2611 	VSIZE=1
      000F64                       2612 multiply:
      000F64                       2613 	_vars VSIZE 
      008EF5 F7 5C            [ 2]    1     sub sp,#VSIZE 
      008EF7 90 93            [ 1] 2614 	clr (SIGN,sp)
      008EF9 9E               [ 1] 2615 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EF9 5B 02            [ 1] 2616 	and a,#0x80
      008EFB 81 03            [ 1] 2617 	jrpl 1$
      008EFC 03 01            [ 1] 2618 	cpl (SIGN,sp)
      008EFC A1               [ 2] 2619 	negw x 
      000F70                       2620 1$:	
      008EFD 61 2A            [ 1] 2621 	ld a,yh
      008EFF 01 81            [ 1] 2622 	and a,#0x80  
      008F01 A1 7A            [ 1] 2623 	jrpl 2$ 
      008F03 22 FB            [ 1] 2624 	cpl (SIGN,sp)
      008F05 A0 20            [ 2] 2625 	negw y 
      000F7A                       2626 2$:	
      008F07 81 0F 2A         [ 4] 2627 	call umstar
      008F08 7B 01            [ 1] 2628 	ld a,(SIGN,sp)
      008F08 89 52            [ 1] 2629 	jreq 3$
      008F0A 03 72 5F         [ 4] 2630 	call dneg 
      000F84                       2631 3$:	
      000F84                       2632 	_drop VSIZE 
      008F0D 00 0C            [ 2]    1     addw sp,#VSIZE 
      008F0F 72               [ 4] 2633 	ret
                                   2634 
                                   2635 ;--------------------------------------
                                   2636 ; divide uint32_t/uint16_t
                                   2637 ; return:  quotient and remainder 
                                   2638 ; quotient expected to be uint16_t 
                                   2639 ; input:
                                   2640 ;   DBLDIVDND    on stack 
                                   2641 ;   X            divisor 
                                   2642 ; output:
                                   2643 ;   X            quotient 
                                   2644 ;   Y            remainder 
                                   2645 ;---------------------------------------
                           000003  2646 	VSIZE=3
      000F87                       2647 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F87                       2648 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2649 	; local variables 
                           000001  2650 	DIVISOR=1 
                           000003  2651 	CNTR=3 
      000F87                       2652 udiv32_16:
      000F87                       2653 	_vars VSIZE 
      008F10 5F 00            [ 2]    1     sub sp,#VSIZE 
      008F12 0D 72            [ 2] 2654 	ldw (DIVISOR,sp),x	; save divisor 
      008F14 5F 00            [ 2] 2655 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008F16 0E 0F            [ 2] 2656 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008F18 01 A6            [ 2] 2657 	tnzw y
      008F1A 0A 6B            [ 1] 2658 	jrne long_division 
      008F1C 02 F6            [ 2] 2659 	ldw y,(DIVISOR,sp)
      008F1E 27               [ 2] 2660 	divw x,y
      000F96                       2661 	_drop VSIZE 
      008F1F 47 A1            [ 2]    1     addw sp,#VSIZE 
      008F21 2D               [ 4] 2662 	ret
      000F99                       2663 long_division:
      008F22 26               [ 1] 2664 	exgw x,y ; hi in x, lo in y 
      008F23 04 03            [ 1] 2665 	ld a,#17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F25 01 20            [ 1] 2666 	ld (CNTR,sp),a
      000F9E                       2667 1$:
      008F27 08 A1            [ 2] 2668 	cpw x,(DIVISOR,sp)
      008F29 24 26            [ 1] 2669 	jrmi 2$
      008F2B 06 A6 10         [ 2] 2670 	subw x,(DIVISOR,sp)
      008F2E 6B               [ 1] 2671 2$:	ccf 
      008F2F 02 5C            [ 2] 2672 	rlcw y 
      008F31 F6               [ 2] 2673 	rlcw x 
      008F32 0A 03            [ 1] 2674 	dec (CNTR,sp)
      008F32 A1 61            [ 1] 2675 	jrne 1$
      008F34 2B               [ 1] 2676 	exgw x,y 
      000FAE                       2677 	_drop VSIZE 
      008F35 02 A0            [ 2]    1     addw sp,#VSIZE 
      008F37 20               [ 4] 2678 	ret
                                   2679 
                                   2680 ;-----------------------------
                                   2681 ; negate double int.
                                   2682 ; input:
                                   2683 ;   x     bits 15..0
                                   2684 ;   y     bits 31..16
                                   2685 ; output: 
                                   2686 ;   x     bits 15..0
                                   2687 ;   y     bits 31..16
                                   2688 ;-----------------------------
      000FB1                       2689 dneg:
      008F38 A1               [ 2] 2690 	cplw x 
      008F39 30 2B            [ 2] 2691 	cplw y 
      008F3B 2B A0 30         [ 2] 2692 	addw x,#1 
      008F3E A1 0A            [ 1] 2693 	jrnc 1$
      008F40 2B 06            [ 2] 2694 	incw y 
      008F42 A0               [ 4] 2695 1$: ret 
                                   2696 
                                   2697 
                                   2698 ;--------------------------------
                                   2699 ; sign extend single to double
                                   2700 ; input:
                                   2701 ;   x    int16_t
                                   2702 ; output:
                                   2703 ;   x    int32_t bits 15..0
                                   2704 ;   y    int32_t bits 31..16
                                   2705 ;--------------------------------
      000FBC                       2706 dbl_sign_extend:
      008F43 07 11            [ 1] 2707 	clrw y
      008F45 02               [ 1] 2708 	ld a,xh 
      008F46 2A 1F            [ 1] 2709 	and a,#0x80 
      008F48 6B 03            [ 1] 2710 	jreq 1$
      008F4A 7B 02            [ 2] 2711 	cplw y
      008F4C CD               [ 4] 2712 1$: ret 	
                                   2713 
                                   2714 
                                   2715 ;----------------------------------
                                   2716 ;  euclidian divide dbl/n1 
                                   2717 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2718 ; input:
                                   2719 ;    dbl    int32_t on stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2720 ;    x 		n1   int16_t  disivor  
                                   2721 ; output:
                                   2722 ;    X      dbl/x  int16_t 
                                   2723 ;    Y      remainder int16_t 
                                   2724 ;----------------------------------
                           000008  2725 	VSIZE=8
      000FC6                       2726 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000FC6                       2727 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000FC6                       2728 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2729 	; local variables
                           000001  2730 	DBLHI=1
                           000003  2731 	DBLLO=3 
                           000005  2732 	SDIVSR=5 ; sign divisor
                           000006  2733 	SQUOT=6 ; sign dividend 
                           000007  2734 	DIVISR=7 ; divisor 
      000FC6                       2735 div32_16:
      000FC6                       2736 	_vars VSIZE 
      008F4D 8A E3            [ 2]    1     sub sp,#VSIZE 
      008F4F 7B 03            [ 1] 2737 	clr (SDIVSR,sp)
      008F51 CB 00            [ 1] 2738 	clr (SQUOT,sp)
                                   2739 ; copy arguments 
      008F53 0E C7            [ 2] 2740 	ldw y,(DIVDNDHI,sp)
      008F55 00 0E            [ 2] 2741 	ldw (DBLHI,sp),y
      008F57 4F C9            [ 2] 2742 	ldw y,(DIVDNDLO,sp)
      008F59 00 0D            [ 2] 2743 	ldw (DBLLO,sp),y 
                                   2744 ; check for 0 divisor
      008F5B C7               [ 2] 2745 	tnzw x 
      008F5C 00 0D            [ 1] 2746     jrne 0$
      008F5E 4F C9            [ 1] 2747 	ld a,#ERR_DIV0 
      008F60 00 0C C7         [ 2] 2748 	jp tb_error 
                                   2749 ; check divisor sign 	
      008F63 00               [ 1] 2750 0$:	ld a,xh 
      008F64 0C 20            [ 1] 2751 	and a,#0x80 
      008F66 C9 0D            [ 1] 2752 	jreq 1$
      008F68 01 27            [ 1] 2753 	cpl (SDIVSR,sp)
      008F6A 03 CD            [ 1] 2754 	cpl (SQUOT,sp)
      008F6C 8B               [ 2] 2755 	negw x
      008F6D 1D 07            [ 2] 2756 1$:	ldw (DIVISR,sp),x
                                   2757 ; check dividend sign 	 
      008F6E 7B 01            [ 1] 2758  	ld a,(DBLHI,sp) 
      008F6E 5B 03            [ 1] 2759 	and a,#0x80 
      008F70 85 81            [ 1] 2760 	jreq 2$ 
      008F72 03 06            [ 1] 2761 	cpl (SQUOT,sp)
      008F72 88 91            [ 2] 2762 	ldw x,(DBLLO,sp)
      008F74 D6 01            [ 2] 2763 	ldw y,(DBLHI,sp)
      008F76 27 0A 11         [ 4] 2764 	call dneg 
      008F79 01 26            [ 2] 2765 	ldw (DBLLO,sp),x 
      008F7B 06 72            [ 2] 2766 	ldw (DBLHI,sp),y 
      008F7D 5C 00            [ 2] 2767 2$:	ldw x,(DIVISR,sp)
      008F7F 02 20 F1         [ 4] 2768 	call udiv32_16
      008F82 5B 01            [ 2] 2769 	tnzw y 
      008F84 81 11            [ 1] 2770 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2771 ; x=quotient 
                                   2772 ; y=remainder 
                                   2773 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F85 7B 06            [ 1] 2774 	ld a,(SQUOT,sp)
      008F85 C6 00            [ 1] 2775 	xor a,(SDIVSR,sp)
      008F87 0B 88            [ 1] 2776 	jreq 3$
      008F89 89               [ 2] 2777 	incw x 
      008F8A 90 89 35 10      [ 2] 2778 	ldw acc16,y 
      008F8E 00 0B            [ 2] 2779 	ldw y,(DIVISR,sp)
      008F90 CD 8A 45 A6      [ 2] 2780 	subw y,acc16
                                   2781 ; sign quotient
      008F94 20 CD            [ 1] 2782 3$:	ld a,(SQUOT,sp)
      008F96 83 20            [ 1] 2783 	jreq 4$
      008F98 1E               [ 2] 2784 	negw x 
      00101A                       2785 4$:	
      00101A                       2786 	_drop VSIZE 
      008F99 01 CD            [ 2]    1     addw sp,#VSIZE 
      008F9B 8A               [ 4] 2787 	ret 
                                   2788 
                                   2789 
                                   2790 
                                   2791 ;----------------------------------
                                   2792 ; division x/y 
                                   2793 ; input:
                                   2794 ;    X       dividend
                                   2795 ;    Y       divisor 
                                   2796 ; output:
                                   2797 ;    X       quotient
                                   2798 ;    Y       remainder 
                                   2799 ;-----------------------------------
                           000004  2800 	VSIZE=4 
                                   2801 	; local variables 
                           000001  2802 	DBLHI=1
                           000003  2803 	DBLLO=3
      00101D                       2804 divide: 
      00101D                       2805 	_vars VSIZE 
      008F9C 45 A6            [ 2]    1     sub sp,#VSIZE 
      008F9E 0D CD 83 20      [ 2] 2806 	ldw acc16,y
      008FA2 90 85 85         [ 4] 2807 	call dbl_sign_extend
      008FA5 84 C7            [ 2] 2808 	ldw (DBLLO,sp),x 
      008FA7 00 0B            [ 2] 2809 	ldw (DBLHI,sp),y 
      008FA9 81 00 0C         [ 2] 2810 	ldw x,acc16 
      008FAA CD 0F C6         [ 4] 2811 	call div32_16 
      001030                       2812 	_drop VSIZE 
      008FAA 52 06            [ 2]    1     addw sp,#VSIZE 
      008FAC 1F               [ 4] 2813 	ret
                                   2814 
                                   2815 
                                   2816 ;----------------------------------
                                   2817 ;  remainder resulting from euclidian 
                                   2818 ;  division of x/y 
                                   2819 ; input:
                                   2820 ;   x   	dividend int16_t 
                                   2821 ;   y 		divisor int16_t
                                   2822 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2823 ;   X       n1%n2 
                                   2824 ;----------------------------------
      001033                       2825 modulo:
      008FAD 01 0F 03         [ 4] 2826 	call divide
      008FB0 0F               [ 1] 2827 	ldw x,y 
      008FB1 04               [ 4] 2828 	ret 
                                   2829 
                                   2830 ;----------------------------------
                                   2831 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2832 ; return expr1*expr2/expr3 
                                   2833 ; product result is int32_t and 
                                   2834 ; divisiont is int32_t/int16_t
                                   2835 ;----------------------------------
                           000004  2836 	DBL_SIZE=4 
      001038                       2837 muldiv:
      008FB2 90 9F 42         [ 4] 2838 	call func_args 
      008FB5 1F 05            [ 1] 2839 	cp a,#3 
      008FB7 7B 01            [ 1] 2840 	jreq 1$
      008FB9 93 42 4F         [ 2] 2841 	jp syntax_error
      001042                       2842 1$: 
      008FBC 72 FB            [ 2] 2843 	ldw x,(5,sp) ; expr1
      008FBE 04 4F            [ 2] 2844 	ldw y,(3,sp) ; expr2
      008FC0 19 03 6B         [ 4] 2845 	call multiply 
      008FC3 03 1F            [ 2] 2846 	ldw (5,sp),x  ;int32_t 15..0
      008FC5 04 90            [ 2] 2847 	ldw (3,sp),y  ;int32_t 31..16
      008FC7 5E               [ 2] 2848 	popw x        ; expr3 
      008FC8 93 7B 02         [ 4] 2849 	call div32_16 ; int32_t/expr3 
      001051                       2850 	_drop DBL_SIZE
      008FCB 42 72            [ 2]    1     addw sp,#DBL_SIZE 
      008FCD FB               [ 4] 2851 	ret 
                                   2852 
                                   2853 
                                   2854 ;----------------------------------
                                   2855 ; search in kword_dict name
                                   2856 ; from its execution address 
                                   2857 ; input:
                                   2858 ;   X       	execution address 
                                   2859 ; output:
                                   2860 ;   X 			cstr*  | 0 
                                   2861 ;--------------------------------
                           000001  2862 	XADR=1 
                           000003  2863 	LINK=3 
                           000004  2864 	VSIZE=4
      001054                       2865 cmd_name:
      001054                       2866 	_vars VSIZE 
      008FCE 04 4F            [ 2]    1     sub sp,#VSIZE 
      008FD0 19 03 6B 03      [ 1] 2867 	clr acc16 
      008FD4 1F 04            [ 2] 2868 	ldw (XADR,sp),x  
      008FD6 7B 01 93         [ 2] 2869 	ldw x,#kword_dict	
      008FD9 42 72            [ 2] 2870 1$:	ldw (LINK,sp),x
      008FDB FB 03            [ 1] 2871 	ld a,(2,x)
      008FDD 90 93            [ 1] 2872 	and a,#15 
      008FDF 1E 05 5B         [ 1] 2873 	ld acc8,a 
      008FE2 06 81 03         [ 2] 2874 	addw x,#3
      008FE4 72 BB 00 0C      [ 2] 2875 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FE4 52               [ 2] 2876 	ldw x,(x) ; execution address 
      008FE5 01 0F            [ 2] 2877 	cpw x,(XADR,sp)
      008FE7 01 9E            [ 1] 2878 	jreq 2$
      008FE9 A4 80            [ 2] 2879 	ldw x,(LINK,sp)
      008FEB 2A               [ 2] 2880 	ldw x,(x) 
      008FEC 03 03 01         [ 2] 2881 	subw x,#2  
      008FEF 50 E3            [ 1] 2882 	jrne 1$
      008FF0 20 05            [ 2] 2883 	jra 9$
      008FF0 90 9E            [ 2] 2884 2$: ldw x,(LINK,sp)
      008FF2 A4 80 2A         [ 2] 2885 	addw x,#2 	
      001083                       2886 9$:	_drop VSIZE
      008FF5 04 03            [ 2]    1     addw sp,#VSIZE 
      008FF7 01               [ 4] 2887 	ret
                                   2888 
                                   2889 
                                   2890 ;---------------------------------
                                   2891 ; dictionary search 
                                   2892 ; input:
                                   2893 ;	X 		dictionary entry point, name field  
                                   2894 ;   y		.asciz name to search 
                                   2895 ; output:
                                   2896 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2897 ;  X		execution address | 0 
                                   2898 ;---------------------------------
                           000001  2899 	NLEN=1 ; cmd length 
                           000002  2900 	XSAVE=2
                           000004  2901 	YSAVE=4
                           000005  2902 	VSIZE=5 
      001086                       2903 search_dict:
      001086                       2904 	_vars VSIZE 
      008FF8 90 50            [ 2]    1     sub sp,#VSIZE 
                                   2905 
      008FFA 17 04            [ 2] 2906 	ldw (YSAVE,sp),y 
      00108A                       2907 search_next:
      008FFA CD 8F            [ 2] 2908 	ldw (XSAVE,sp),x 
                                   2909 ; get name length in dictionary	
      008FFC AA               [ 1] 2910 	ld a,(x)
      008FFD 7B 01            [ 1] 2911 	and a,#0xf 
      008FFF 27 03            [ 1] 2912 	ld (NLEN,sp),a  
      009001 CD 90            [ 2] 2913 	ldw y,(YSAVE,sp) ; name pointer 
      009003 31               [ 2] 2914 	incw x 
      009004                       2915 cp_loop:
      009004 5B 01            [ 1] 2916 	ld a,(y)
      009006 81 1B            [ 1] 2917 	jreq str_match 
      009007 0D 01            [ 1] 2918 	tnz (NLEN,sp)
      009007 52 03            [ 1] 2919 	jreq no_match  
      009009 1F               [ 1] 2920 	cp a,(x)
      00900A 01 1E            [ 1] 2921 	jrne no_match 
      00900C 08 16            [ 2] 2922 	incw y 
      00900E 06               [ 2] 2923 	incw x
      00900F 90 5D            [ 1] 2924 	dec (NLEN,sp)
      009011 26 06            [ 2] 2925 	jra cp_loop 
      0010A6                       2926 no_match:
      009013 16 01            [ 2] 2927 	ldw x,(XSAVE,sp) 
      009015 65 5B 03         [ 2] 2928 	subw x,#2 ; move X to link field
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009018 81 00            [ 1] 2929 	push #TK_NONE 
      009019 FE               [ 2] 2930 	ldw x,(x) ; next word link 
      009019 51               [ 1] 2931 	pop a ; TK_NONE 
      00901A A6 11            [ 1] 2932 	jreq search_exit  ; not found  
                                   2933 ;try next 
      00901C 6B 03            [ 2] 2934 	jra search_next
      00901E                       2935 str_match:
      00901E 13 01            [ 2] 2936 	ldw x,(XSAVE,sp)
      009020 2B               [ 1] 2937 	ld a,(X)
      009021 03 72            [ 1] 2938 	ld (NLEN,sp),a ; needed to test keyword type  
      009023 F0 01            [ 1] 2939 	and a,#0xf 
                                   2940 ; move x to procedure address field 	
      009025 8C               [ 1] 2941 	inc a 
      009026 90 59 59         [ 1] 2942 	ld acc8,a 
      009029 0A 03 26 F1      [ 1] 2943 	clr acc16 
      00902D 51 5B 03 81      [ 2] 2944 	addw x,acc16 
      009031 FE               [ 2] 2945 	ldw x,(x) ; routine entry point 
                                   2946 ;determine keyword type bits 7:6 
      009031 53 90            [ 1] 2947 	ld a,(NLEN,sp)
      009033 53               [ 1] 2948 	swap a 
      009034 1C 00            [ 1] 2949 	and a,#0xc
      009036 01               [ 1] 2950 	srl a
      009037 24               [ 1] 2951 	srl a 
      009038 02 90            [ 1] 2952 	add a,#128
      0010D0                       2953 search_exit: 
      0010D0                       2954 	_drop VSIZE 	 
      00903A 5C 81            [ 2]    1     addw sp,#VSIZE 
      00903C 81               [ 4] 2955 	ret 
                                   2956 
                                   2957 ;---------------------
                                   2958 ; check if next token
                                   2959 ;  is of expected type 
                                   2960 ; input:
                                   2961 ;   A 		 expected token attribute
                                   2962 ;  ouput:
                                   2963 ;   none     if fail call syntax_error 
                                   2964 ;--------------------
      0010D3                       2965 expect:
      00903C 90               [ 1] 2966 	push a 
      00903D 5F 9E A4         [ 4] 2967 	call next_token 
      009040 80 27            [ 1] 2968 	cp a,(1,sp)
      009042 02 90            [ 1] 2969 	jreq 1$
      009044 53 81 7E         [ 2] 2970 	jp syntax_error
      009046 84               [ 1] 2971 1$: pop a 
      009046 52               [ 4] 2972 	ret 
                                   2973 
                                   2974 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2975 ; parse arguments list 
                                   2976 ; between ()
                                   2977 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010E0                       2978 func_args:
      009047 08 0F            [ 1] 2979 	ld a,#TK_LPAREN 
      009049 05 0F 06         [ 4] 2980 	call expect 
                                   2981 ; expected to continue in arg_list 
                                   2982 ; caller must check for TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2983 
                                   2984 ;-------------------------------
                                   2985 ; parse embedded BASIC routines 
                                   2986 ; arguments list.
                                   2987 ; arg_list::=  rel[','rel]*
                                   2988 ; all arguments are of integer type
                                   2989 ; and pushed on stack 
                                   2990 ; input:
                                   2991 ;   none
                                   2992 ; output:
                                   2993 ;   stack{n}   arguments pushed on stack
                                   2994 ;   A 	number of arguments pushed on stack  
                                   2995 ;--------------------------------
      0010E5                       2996 arg_list:
      00904C 16 0B            [ 1] 2997 	push #0  
      00904E 17 01 16         [ 4] 2998 1$: call relation
      009051 0D 17            [ 1] 2999 	cp a,#TK_NONE 
      009053 03 5D            [ 1] 3000 	jreq 5$
      009055 26 05            [ 1] 3001 	cp a,#TK_INTGR
      009057 A6 04            [ 1] 3002 	jrne 4$
      0010F2                       3003 3$: 
                                   3004 ; swap return address with argument
      009059 CC               [ 1] 3005 	pop a ; arg_count
      00905A 89 00            [ 2] 3006 	popw y ; return address 
      00905C 9E               [ 2] 3007 	pushw x ; new argument 
      00905D A4 80            [ 2] 3008 	pushw y 
      00905F 27               [ 1] 3009     inc a
      009060 05               [ 1] 3010 	push a 
      009061 03 05 03         [ 4] 3011 	call next_token 
      009064 06 50            [ 1] 3012 	cp a,#TK_COMMA 
      009066 1F 07            [ 1] 3013 	jreq 1$ 
      009068 7B 01            [ 1] 3014 	cp a,#TK_NONE 
      00906A A4 80            [ 1] 3015 	jreq 5$ 
      00906C 27 0D            [ 1] 3016 4$:	cp a,#TK_RPAREN 
      00906E 03 06            [ 1] 3017 	jreq 5$
      001109                       3018 	_unget_token 
      009070 1E 03 16 01 CD   [ 1]    1     mov in,in.saved
      009075 90               [ 1] 3019 5$:	pop a  
      009076 31               [ 4] 3020 	ret 
                                   3021 
                                   3022 ;--------------------------------
                                   3023 ;   BASIC commnands 
                                   3024 ;--------------------------------
                                   3025 
                                   3026 ;--------------------------------
                                   3027 ;  arithmetic and relational 
                                   3028 ;  routines
                                   3029 ;  operators precedence
                                   3030 ;  highest to lowest
                                   3031 ;  operators on same row have 
                                   3032 ;  same precedence and are executed
                                   3033 ;  from left to right.
                                   3034 ;	'*','/','%'
                                   3035 ;   '-','+'
                                   3036 ;   '=','>','<','>=','<=','<>','><'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3037 ;   '<>' and '><' are equivalent for not equal.
                                   3038 ;--------------------------------
                                   3039 
                                   3040 ;---------------------
                                   3041 ; return array element
                                   3042 ; address from @(expr)
                                   3043 ; input:
                                   3044 ;   A 		TK_ARRAY
                                   3045 ; output:
                                   3046 ;   A 		TK_INTGR
                                   3047 ;	X 		element address 
                                   3048 ;----------------------
      001110                       3049 get_array_element:
      009077 1F 03 17         [ 4] 3050 	call func_args 
      00907A 01 1E            [ 1] 3051 	cp a,#1
      00907C 07 CD            [ 1] 3052 	jreq 1$
      00907E 90 07 90         [ 2] 3053 	jp syntax_error
      009081 5D               [ 2] 3054 1$: popw x 
                                   3055 	; check for bounds 
      009082 27 11 7B         [ 2] 3056 	cpw x,array_size 
      009085 06 18            [ 2] 3057 	jrule 3$
                                   3058 ; bounds {1..array_size}	
      009087 05 27            [ 1] 3059 2$: ld a,#ERR_BAD_VALUE 
      009089 0B 5C 90         [ 2] 3060 	jp tb_error 
      00908C CF               [ 2] 3061 3$: tnzw  x
      00908D 00 0D            [ 1] 3062 	jreq 2$ 
      00908F 16               [ 2] 3063 	sllw x 
      009090 07               [ 2] 3064 	pushw x 
      009091 72 B2 00         [ 2] 3065 	ldw x,#tib
      009094 0D 7B 06         [ 2] 3066 	subw x,(1,sp)
      001130                       3067 	_drop 2   
      009097 27 01            [ 2]    1     addw sp,#2 
      009099 50 84            [ 1] 3068 	ld a,#TK_INTGR
      00909A 81               [ 4] 3069 	ret 
                                   3070 
                                   3071 
                                   3072 ;***********************************
                                   3073 ;   expression parse,execute 
                                   3074 ;***********************************
                                   3075 ;-----------------------------------
                                   3076 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3077 ;			 integer | function |
                                   3078 ;			 '('relation')' 
                                   3079 ; output:
                                   3080 ;   A    token attribute 
                                   3081 ;   X 	 integer
                                   3082 ; ---------------------------------
                           000001  3083 	NEG=1
                           000001  3084 	VSIZE=1
      001135                       3085 factor:
      001135                       3086 	_vars VSIZE 
      00909A 5B 08            [ 2]    1     sub sp,#VSIZE 
      00909C 81 09 70         [ 4] 3087 	call next_token
      00909D A1 02            [ 1] 3088 	cp a,#CMD_END 
      00909D 52 04            [ 1] 3089 	jrult 20$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00909F 90 CF            [ 1] 3090 1$:	ld (NEG,sp),a 
      0090A1 00 0D            [ 1] 3091 	and a,#TK_GRP_MASK
      0090A3 CD 90            [ 1] 3092 	cp a,#TK_GRP_ADD 
      0090A5 3C 1F            [ 1] 3093 	jreq 2$
      0090A7 03 17            [ 1] 3094 	ld a,(NEG,sp)
      0090A9 01 CE            [ 2] 3095 	jra 4$  
      00114A                       3096 2$:	
      0090AB 00 0D CD         [ 4] 3097 	call next_token 
      00114D                       3098 4$:	
      0090AE 90 46            [ 1] 3099 	cp a,#TK_IFUNC 
      0090B0 5B 04            [ 1] 3100 	jrne 5$ 
      0090B2 81               [ 4] 3101 	call (x) 
      0090B3 20 2F            [ 2] 3102 	jra 18$ 
      001154                       3103 5$:
      0090B3 CD 90            [ 1] 3104 	cp a,#TK_INTGR
      0090B5 9D 93            [ 1] 3105 	jrne 6$
      0090B7 81 29            [ 2] 3106 	jra 18$
      0090B8                       3107 6$:
      0090B8 CD 91            [ 1] 3108 	cp a,#TK_ARRAY
      0090BA 60 A1            [ 1] 3109 	jrne 10$
      0090BC 03 27 03         [ 4] 3110 	call get_array_element
      0090BF CC               [ 2] 3111 	ldw x,(x)
      0090C0 88 FE            [ 2] 3112 	jra 18$ 
      0090C2                       3113 10$:
      0090C2 1E 05            [ 1] 3114 	cp a,#TK_VAR 
      0090C4 16 03            [ 1] 3115 	jrne 12$
      0090C6 CD               [ 2] 3116 	ldw x,(x)
      0090C7 8F E4            [ 2] 3117 	jra 18$
      00116B                       3118 12$:			
      0090C9 1F 05            [ 1] 3119 	cp a,#TK_LPAREN
      0090CB 17 03            [ 1] 3120 	jrne 16$
      0090CD 85 CD 90         [ 4] 3121 	call relation
      0090D0 46               [ 2] 3122 	pushw x 
      0090D1 5B 04            [ 1] 3123 	ld a,#TK_RPAREN 
      0090D3 81 10 D3         [ 4] 3124 	call expect
      0090D4 85               [ 2] 3125 	popw x 
      0090D4 52 04            [ 2] 3126 	jra 18$	
      00117B                       3127 16$:
      00117B                       3128 	_unget_token
      0090D6 72 5F 00 0D 1F   [ 1]    1     mov in,in.saved
      0090DB 01               [ 1] 3129 	clr a 
      0090DC AE A7            [ 2] 3130 	jra 20$ 
      001183                       3131 18$: 
      0090DE CA 1F            [ 1] 3132 	ld a,#TK_MINUS 
      0090E0 03 E6            [ 1] 3133 	cp a,(NEG,sp)
      0090E2 02 A4            [ 1] 3134 	jrne 19$
      0090E4 0F               [ 2] 3135 	negw x
      00118A                       3136 19$:
      0090E5 C7 00            [ 1] 3137 	ld a,#TK_INTGR
      00118C                       3138 20$:
      00118C                       3139 	_drop VSIZE
      0090E7 0E 1C            [ 2]    1     addw sp,#VSIZE 
      0090E9 00               [ 4] 3140 	ret
                                   3141 
                                   3142 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3143 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3144 ; output:
                                   3145 ;   A    	token attribute 
                                   3146 ;	X		integer
                                   3147 ;-----------------------------------
                           000001  3148 	N1=1   ; int16_t
                           000003  3149 	MULOP=3
                           000003  3150 	VSIZE=3
      00118F                       3151 term:
      00118F                       3152 	_vars VSIZE
      0090EA 03 72            [ 2]    1     sub sp,#VSIZE 
      0090EC BB 00 0D         [ 4] 3153 	call factor
      0090EF FE 13            [ 1] 3154 	cp a,#CMD_END
      0090F1 01 27            [ 1] 3155 	jrult term_exit
      001198                       3156 term01:	 ; check for  operator 
      0090F3 0A 1E            [ 2] 3157 	ldw (N1,sp),x  ; save first factor 
      0090F5 03 FE 1D         [ 4] 3158 	call next_token
      0090F8 00 02            [ 1] 3159 	cp a,#CMD_END
      0090FA 26 E3            [ 1] 3160 	jrult 9$
      0090FC 20 05            [ 1] 3161 0$:	ld (MULOP,sp),a
      0090FE 1E 03            [ 1] 3162 	and a,#TK_GRP_MASK
      009100 1C 00            [ 1] 3163 	cp a,#TK_GRP_MULT
      009102 02 5B            [ 1] 3164 	jreq 1$
      0011A9                       3165 	_unget_token 
      009104 04 81 02 00 01   [ 1]    1     mov in,in.saved
      009106 20 27            [ 2] 3166 	jra 9$
      0011B0                       3167 1$:	; got *|/|%
      009106 52 05 17         [ 4] 3168 	call factor
      009109 04 84            [ 1] 3169 	cp a,#TK_INTGR
      00910A 27 03            [ 1] 3170 	jreq 2$ 
      00910A 1F 02 F6         [ 2] 3171 	jp syntax_error
      00910D A4 0F            [ 1] 3172 2$:	ldw y,x 
      00910F 6B 01            [ 2] 3173 	ldw x,(N1,sp)
      009111 16 04            [ 1] 3174 	ld a,(MULOP,sp) 
      009113 5C 20            [ 1] 3175 	cp a,#TK_MULT 
      009114 26 05            [ 1] 3176 	jrne 3$
      009114 90 F6 27         [ 4] 3177 	call multiply 
      009117 1B 0D            [ 2] 3178 	jra term01
      009119 01 27            [ 1] 3179 3$: cp a,#TK_DIV 
      00911B 0A F1            [ 1] 3180 	jrne 4$ 
      00911D 26 07 90         [ 4] 3181 	call divide 
      009120 5C 5C            [ 2] 3182 	jra term01 
      009122 0A 01 20         [ 4] 3183 4$: call modulo
      009125 EE C1            [ 2] 3184 	jra term01 
      009126 1E 01            [ 2] 3185 9$: ldw x,(N1,sp)
      009126 1E 02            [ 1] 3186 	ld a,#TK_INTGR 	
      0011DB                       3187 term_exit:
      0011DB                       3188 	_drop VSIZE 
      009128 1D 00            [ 2]    1     addw sp,#VSIZE 
      00912A 02               [ 4] 3189 	ret 
                                   3190 
                                   3191 ;-------------------------------
                                   3192 ;  expr ::= term [['+'|'-'] term]*
                                   3193 ;  result range {-32768..32767}
                                   3194 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3195 ;   A    token attribute 
                                   3196 ;   X	 integer   
                                   3197 ;-------------------------------
                           000001  3198 	N1=1 
                           000003  3199 	OP=3 
                           000003  3200 	VSIZE=3 
      0011DE                       3201 expression:
      0011DE                       3202 	_vars VSIZE 
      00912B 4B 00            [ 2]    1     sub sp,#VSIZE 
      00912D FE 84 27         [ 4] 3203 	call term
      009130 1F 20            [ 1] 3204 	cp a,#CMD_END 
      009132 D7 3D            [ 1] 3205 	jrult expr_exit 
      009133 1F 01            [ 2] 3206 0$:	ldw (N1,sp),x 
      009133 1E 02 F6         [ 4] 3207 	call next_token
      009136 6B 01            [ 1] 3208 	cp a,#CMD_END 
      009138 A4 0F            [ 1] 3209 	jrult 9$ 
      00913A 4C C7            [ 1] 3210 1$:	ld (OP,sp),a  
      00913C 00 0E            [ 1] 3211 	and a,#TK_GRP_MASK
      00913E 72 5F            [ 1] 3212 	cp a,#TK_GRP_ADD 
      009140 00 0D            [ 1] 3213 	jreq 2$ 
      0011F8                       3214 	_unget_token
      009142 72 BB 00 0D FE   [ 1]    1     mov in,in.saved
      009147 7B 01            [ 2] 3215 	jra 9$
      0011FF                       3216 2$: 
      009149 4E A4 0C         [ 4] 3217 	call term
      00914C 44 44            [ 1] 3218 	cp a,#TK_INTGR 
      00914E AB 80            [ 1] 3219 	jreq 3$
      009150 CC 08 7E         [ 2] 3220 	jp syntax_error
      009150 5B 05 81         [ 2] 3221 3$:	ldw acc16,x 
      009153 1E 01            [ 2] 3222 	ldw x,(N1,sp)
      009153 88 CD            [ 1] 3223 	ld a,(OP,sp)
      009155 89 F0            [ 1] 3224 	cp a,#TK_PLUS 
      009157 11 01            [ 1] 3225 	jrne 4$
      009159 27 03 CC 88      [ 2] 3226 	addw x,acc16
      00915D FE 84            [ 2] 3227 	jra 0$ 
      00915F 81 B0 00 0C      [ 2] 3228 4$:	subw x,acc16
      009160 20 C7            [ 2] 3229 	jra 0$
      009160 A6 07            [ 2] 3230 9$: ldw x,(N1,sp)
      009162 CD 91            [ 1] 3231 	ld a,#TK_INTGR	
      001224                       3232 expr_exit:
      001224                       3233 	_drop VSIZE 
      009164 53 03            [ 2]    1     addw sp,#VSIZE 
      009165 81               [ 4] 3234 	ret 
                                   3235 
                                   3236 ;---------------------------------------------
                                   3237 ; rel ::= expr rel_op expr
                                   3238 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3239 ;  relation return  integer , zero is false 
                                   3240 ;  output:
                                   3241 ;    A 		token attribute  
                                   3242 ;	 X		integer 
                                   3243 ;---------------------------------------------
                           000001  3244 	N1=1
                           000003  3245 	RELOP=3
                           000003  3246 	VSIZE=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001227                       3247 relation: 
      001227                       3248 	_vars VSIZE
      009165 4B 00            [ 2]    1     sub sp,#VSIZE 
      009167 CD 92 A7         [ 4] 3249 	call expression
      00916A A1 00            [ 1] 3250 	cp a,#CMD_END  
      00916C 27 20            [ 1] 3251 	jrult rel_exit 
                                   3252 	; expect rel_op or leave 
      00916E A1 84            [ 2] 3253 	ldw (N1,sp),x 
      009170 26 13 70         [ 4] 3254 	call next_token 
      009172 A1 02            [ 1] 3255 	cp a,#CMD_END 
      009172 84 90            [ 1] 3256 	jrult 9$
      001239                       3257 1$:	
      009174 85 89            [ 1] 3258 	ld (RELOP,sp),a 
      009176 90 89            [ 1] 3259 	and a,#TK_GRP_MASK
      009178 4C 88            [ 1] 3260 	cp a,#TK_GRP_RELOP 
      00917A CD 89            [ 1] 3261 	jreq 2$
      001241                       3262 	_unget_token  
      00917C F0 A1 09 27 E6   [ 1]    1     mov in,in.saved
      009181 A1 00            [ 2] 3263 	jra 9$
      001248                       3264 2$:	; expect another expression or error 
      009183 27 09 A1         [ 4] 3265 	call expression
      009186 08 27            [ 1] 3266 	cp a,#TK_INTGR 
      009188 05 55            [ 1] 3267 	jreq 3$
      00918A 00 03 00         [ 2] 3268 	jp syntax_error 
      00918D 02 84 81         [ 2] 3269 3$:	ldw acc16,x 
      009190 1E 01            [ 2] 3270 	ldw x,(N1,sp) 
      009190 CD 91 60 A1      [ 2] 3271 	subw x,acc16
      009194 01 27            [ 1] 3272 	jrne 4$
      009196 03 CC 88 FE      [ 1] 3273 	mov acc8,#2 ; n1==n2
      00919A 85 C3            [ 2] 3274 	jra 6$ 
      001263                       3275 4$: 
      00919C 00 22            [ 1] 3276 	jrsgt 5$  
      00919E 23 05 A6 0A      [ 1] 3277 	mov acc8,#4 ; n1<2 
      0091A2 CC 89            [ 2] 3278 	jra 6$
      00126B                       3279 5$:
      0091A4 00 5D 27 F8      [ 1] 3280 	mov acc8,#1 ; n1>n2 
      00126F                       3281 6$:
      0091A8 58               [ 1] 3282 	clrw x 
      0091A9 89 AE 16         [ 1] 3283 	ld a, acc8  
      0091AC 90 72            [ 1] 3284 	and a,(RELOP,sp)
      0091AE F0               [ 1] 3285 	tnz a 
      0091AF 01 5B            [ 1] 3286 	jreq 10$
      0091B1 02               [ 2] 3287 	incw x 
      001279                       3288 7$:	 
      0091B2 A6 84            [ 2] 3289 	jra 10$  	
      0091B4 81 01            [ 2] 3290 9$: ldw x,(N1,sp)
      0091B5                       3291 10$:
      0091B5 52 01            [ 1] 3292 	ld a,#TK_INTGR
      00127F                       3293 rel_exit: 	 
      00127F                       3294 	_drop VSIZE
      0091B7 CD 89            [ 2]    1     addw sp,#VSIZE 
      0091B9 F0               [ 4] 3295 	ret 
                                   3296 
                                   3297 ;--------------------------------
                                   3298 ; BASIC: SHOW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3299 ; print stack content in hexadecimal bytes 
                                   3300 ; 16 bytes per row 
                                   3301 ;--------------------------------
      001282                       3302 show:
      0091BA A1 02 25         [ 2] 3303 	ldw x,#cstk_prompt
      0091BD 4E 6B 01         [ 4] 3304 	call puts 
      0091C0 A4               [ 1] 3305 	ldw x,sp 
      0091C1 30 A1 10         [ 2] 3306 	addw x,#3 ; ignore return address
      0091C4 27 04 7B 01      [ 2] 3307 	ldw y,#RAM_SIZE  
      0091C8 20 03 0C         [ 2] 3308 	ldw acc16,x 
      0091CA 72 B2 00 0C      [ 2] 3309 	subw y,acc16
      0091CA CD 89 F0         [ 4] 3310 	call hex_dump
      0091CD 4F               [ 1] 3311 	clr a 
      0091CD A1               [ 4] 3312 	ret
                                   3313 
      0091CE 81 26 03 FD 20 2F 6E  3314 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3315 
                                   3316 
                                   3317 ;--------------------------------------------
                                   3318 ; BASIC: HEX 
                                   3319 ; select hexadecimal base for integer print
                                   3320 ;---------------------------------------------
      0091D4                       3321 hex_base:
      0091D4 A1 84 26 02      [ 1] 3322 	mov base,#16 
      0091D8 20               [ 4] 3323 	ret 
                                   3324 
                                   3325 ;--------------------------------------------
                                   3326 ; BASIC: DEC 
                                   3327 ; select decimal base for integer print
                                   3328 ;---------------------------------------------
      0012C8                       3329 dec_base:
      0091D9 29 0A 00 0A      [ 1] 3330 	mov base,#10
      0091DA 81               [ 4] 3331 	ret 
                                   3332 
                                   3333 ;------------------------
                                   3334 ; BASIC: SIZE 
                                   3335 ; return free size in text area
                                   3336 ; output:
                                   3337 ;   A 		TK_INTGR
                                   3338 ;   X 	    size integer
                                   3339 ;--------------------------
      0012CD                       3340 size:
      0091DA A1 06 26         [ 2] 3341 	ldw x,#tib 
      0091DD 06 CD 91 90      [ 2] 3342 	subw x,txtend 
      0091E1 FE 20            [ 1] 3343 	ld a,#TK_INTGR
      0091E3 1F               [ 4] 3344 	ret 
                                   3345 
                                   3346 
                                   3347 ;------------------------
                                   3348 ; BASIC: UBOUND  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3349 ; return array variable size 
                                   3350 ; output:
                                   3351 ;   A 		TK_INTGR
                                   3352 ;   X 	    array size 
                                   3353 ;--------------------------
      0091E4                       3354 ubound:
      0091E4 A1 85 26         [ 2] 3355 	ldw x,#tib
      0091E7 03 FE 20 18      [ 2] 3356 	subw x,txtend 
      0091EB 90 CE 00 04      [ 2] 3357 	ldw y,basicptr 
      0091EB A1 07 26 0C      [ 2] 3358 	cpw y,txtend 
      0091EF CD 92            [ 1] 3359 	jrult 1$
      0091F1 A7 89 A6         [ 1] 3360 	push count 
      0091F4 08 CD            [ 1] 3361 	push #0 
      0091F6 91 53 85         [ 2] 3362 	subw x,(1,sp)
      0012F0                       3363 	_drop 2 
      0091F9 20 08            [ 2]    1     addw sp,#2 
      0091FB 54               [ 2] 3364 1$:	srlw x 
      0091FB 55 00 03         [ 2] 3365 	ldw array_size,x
      0091FE 00 02            [ 1] 3366 	ld a,#TK_INTGR
      009200 4F               [ 4] 3367 	ret 
                                   3368 
                                   3369 ;-----------------------------
                                   3370 ; BASIC: LET var=expr 
                                   3371 ; variable assignement 
                                   3372 ; output:
                                   3373 ;   A 		TK_NONE 
                                   3374 ;-----------------------------
      0012F9                       3375 let:
      009201 20 09 70         [ 4] 3376 	call next_token 
      009203 A1 85            [ 1] 3377 	cp a,#TK_VAR 
      009203 A6 11            [ 1] 3378 	jreq let_var
      009205 11 01            [ 1] 3379 	cp a,#TK_ARRAY 
      009207 26 01            [ 1] 3380 	jreq  let_array
      009209 50 08 7E         [ 2] 3381 	jp syntax_error
      00920A                       3382 let_array:
      00920A A6 84 10         [ 4] 3383 	call get_array_element
      00920C                       3384 let_var:
      00920C 5B               [ 2] 3385 	pushw x  
      00920D 01 81 70         [ 4] 3386 	call next_token 
      00920F A1 32            [ 1] 3387 	cp a,#TK_EQUAL
      00920F 52 03            [ 1] 3388 	jreq 1$
      009211 CD 91 B5         [ 2] 3389 	jp syntax_error
      001315                       3390 1$:	
      009214 A1 02 25         [ 4] 3391 	call relation   
      009217 43 84            [ 1] 3392 	cp a,#TK_INTGR 
      009218 27 03            [ 1] 3393 	jreq 2$
      009218 1F 01 CD         [ 2] 3394 	jp syntax_error
      00131F                       3395 2$:	
      00921B 89 F0            [ 1] 3396 	ldw y,x 
      00921D A1               [ 2] 3397 	popw x   
      00921E 02               [ 2] 3398 	ldw (x),y   
      00921F 25               [ 4] 3399 	ret 
                                   3400 
                                   3401 ;----------------------------
                                   3402 ; BASIC: LIST [[start][,end]]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3403 ; list program lines 
                                   3404 ; form start to end 
                                   3405 ; if empty argument list then 
                                   3406 ; list all.
                                   3407 ;----------------------------
                           000001  3408 	FIRST=1
                           000003  3409 	LAST=3 
                           000005  3410 	LN_PTR=5
                           000006  3411 	VSIZE=6 
      001324                       3412 list:
      009220 36 6B 03         [ 2] 3413 	ldw x,txtbgn 
      009223 A4 30 A1         [ 2] 3414 	cpw x,txtend 
      009226 20 27            [ 1] 3415 	jrmi 1$
      009228 07               [ 4] 3416 	ret 
      00132D                       3417 1$:	
      00132D                       3418 	_vars VSIZE
      009229 55 00            [ 2]    1     sub sp,#VSIZE 
      00922B 03 00            [ 2] 3419 	ldw (LN_PTR,sp),x 
      00922D 02               [ 2] 3420 	ldw x,(x) 
      00922E 20 27            [ 2] 3421 	ldw (FIRST,sp),x ; list from first line 
      009230 AE 7F FF         [ 2] 3422 	ldw x,#MAX_LINENO ; biggest line number 
      009230 CD 91            [ 2] 3423 	ldw (LAST,sp),x 
      009232 B5 A1 84         [ 4] 3424 	call arg_list
      009235 27               [ 1] 3425 	tnz a
      009236 03 CC            [ 1] 3426 	jreq list_loop 
      009238 88 FE            [ 1] 3427 	cp a,#2 
      00923A 90 93            [ 1] 3428 	jreq 4$
      00923C 1E 01            [ 1] 3429 	cp a,#1 
      00923E 7B 03            [ 1] 3430 	jreq first_line 
      009240 A1 20 26         [ 2] 3431 	jp syntax_error 
      009243 05               [ 2] 3432 4$:	popw x 
      009244 CD 8F            [ 2] 3433 	ldw (LAST+2,sp),x 
      00134D                       3434 first_line:
      009246 E4               [ 2] 3435 	popw x
      009247 20 CF            [ 2] 3436 	ldw (FIRST,sp),x 
      001350                       3437 lines_skip:
      009249 A1 21 26         [ 2] 3438 	ldw x,txtbgn
      00924C 05 CD            [ 2] 3439 2$:	ldw (LN_PTR,sp),x 
      00924E 90 9D 20         [ 2] 3440 	cpw x,txtend 
      009251 C6 CD            [ 1] 3441 	jrpl list_exit 
      009253 90               [ 2] 3442 	ldw x,(x) ;line# 
      009254 B3 20            [ 2] 3443 	cpw x,(FIRST,sp)
      009256 C1 1E            [ 1] 3444 	jrpl list_loop 
      009258 01 A6            [ 2] 3445 	ldw x,(LN_PTR,sp) 
      00925A 84 02            [ 1] 3446 	ld a,(2,x)
      00925B C7 00 0D         [ 1] 3447 	ld acc8,a 
      00925B 5B 03 81 0C      [ 1] 3448 	clr acc16 
      00925E 72 BB 00 0C      [ 2] 3449 	addw x,acc16
      00925E 52 03            [ 2] 3450 	jra 2$ 
                                   3451 ; print loop
      001370                       3452 list_loop:
      009260 CD 92            [ 2] 3453 	ldw x,(LN_PTR,sp)
      009262 0F A1            [ 1] 3454 	ld a,(2,x) 
      009264 02 25 3D         [ 4] 3455 	call prt_basic_line
      009267 1F 01            [ 2] 3456 	ldw x,(LN_PTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009269 CD 89            [ 1] 3457 	ld a,(2,x)
      00926B F0 A1 02         [ 1] 3458 	ld acc8,a 
      00926E 25 30 6B 03      [ 1] 3459 	clr acc16 
      009272 A4 30 A1 10      [ 2] 3460 	addw x,acc16
      009276 27 07 55         [ 2] 3461 	cpw x,txtend 
      009279 00 03            [ 1] 3462 	jrpl list_exit
      00927B 00 02            [ 2] 3463 	ldw (LN_PTR,sp),x
      00927D 20               [ 2] 3464 	ldw x,(x)
      00927E 21 03            [ 2] 3465 	cpw x,(LAST,sp)  
      00927F 2F DE            [ 1] 3466 	jrslt list_loop
      001392                       3467 list_exit:
      00927F CD 92 0F A1 84   [ 1] 3468 	mov in,count 
      009284 27 03 CC         [ 2] 3469 	ldw x,#pad 
      009287 88 FE CF         [ 2] 3470 	ldw basicptr,x 
      00139D                       3471 	_drop VSIZE 
      00928A 00 0D            [ 2]    1     addw sp,#VSIZE 
      00928C 1E               [ 4] 3472 	ret
                                   3473 
                                   3474 ;-------------------------
                                   3475 ; copy command name to buffer  
                                   3476 ; input:
                                   3477 ;   X 	name address 
                                   3478 ;   Y   destination buffer 
                                   3479 ; output:
                                   3480 ;   Y   point after name  
                                   3481 ;--------------------------
      0013A0                       3482 cpy_cmd_name:
      00928D 01               [ 1] 3483 	ld a,(x)
      00928E 7B               [ 2] 3484 	incw x
      00928F 03 A1            [ 1] 3485 	and a,#15  
      009291 10               [ 1] 3486 	push a 
      009292 26 06            [ 1] 3487     tnz (1,sp) 
      009294 72 BB            [ 1] 3488 	jreq 9$
      009296 00               [ 1] 3489 1$:	ld a,(x)
      009297 0D 20            [ 1] 3490 	ld (y),a  
      009299 CD               [ 2] 3491 	incw x
      00929A 72 B0            [ 2] 3492 	incw y 
      00929C 00 0D            [ 1] 3493 	dec (1,sp)	 
      00929E 20 C7            [ 1] 3494 	jrne 1$
      0092A0 1E               [ 1] 3495 9$: pop a 
      0092A1 01               [ 4] 3496 	ret	
                                   3497 
                                   3498 ;--------------------------
                                   3499 ; add a space after letter or 
                                   3500 ; digit.
                                   3501 ; input:
                                   3502 ;   Y     pointer to buffer 
                                   3503 ; output:
                                   3504 ;   Y    moved to end 
                                   3505 ;--------------------------
      0013B5                       3506 add_space:
      0092A2 A6 84            [ 2] 3507 	decw y 
      0092A4 90 F6            [ 1] 3508 	ld a,(y)
      0092A4 5B 03            [ 2] 3509 	incw y
      0092A6 81 05 85         [ 4] 3510 	call is_alnum 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092A7 24 06            [ 1] 3511 	jrnc 1$
      0092A7 52 03            [ 1] 3512 	ld a,#SPACE 
      0092A9 CD 92            [ 1] 3513 	ld (y),a 
      0092AB 5E A1            [ 2] 3514 	incw y 
      0092AD 02               [ 4] 3515 1$: ret 
                                   3516 
                                   3517 ;--------------------------
                                   3518 ;  align text in buffer 
                                   3519 ;  to tab_width padding 
                                   3520 ;  left with  SPACE 
                                   3521 ; input:
                                   3522 ;   X      str*
                                   3523 ;   A      str_length 
                                   3524 ; output:
                                   3525 ;   X      ajusted
                                   3526 ;--------------------------
      0013C7                       3527 right_align:
      0092AE 25               [ 1] 3528 	push a 
      0092AF 4F 1F            [ 1] 3529 0$: ld a,(1,sp)
      0092B1 01 CD 89         [ 1] 3530 	cp a,tab_width 
      0092B4 F0 A1            [ 1] 3531 	jrpl 1$
      0092B6 02 25            [ 1] 3532 	ld a,#SPACE 
      0092B8 42               [ 2] 3533 	decw x
      0092B9 F7               [ 1] 3534 	ld (x),a  
      0092B9 6B 03            [ 1] 3535 	inc (1,sp)
      0092BB A4 30            [ 2] 3536 	jra 0$ 
      0092BD A1               [ 1] 3537 1$: pop a 	
      0092BE 30               [ 4] 3538 	ret 
                                   3539 
                                   3540 ;--------------------------
                                   3541 ; print TK_QSTR
                                   3542 ; converting control character
                                   3543 ; to backslash sequence
                                   3544 ; input:
                                   3545 ;   X        char *
                                   3546 ;   Y        dest. buffer 
                                   3547 ; output:
                                   3548 ;   X        moved forward 
                                   3549 ;   Y        moved forward 
                                   3550 ;-----------------------------
      0013D9                       3551 cpy_quote:
      0092BF 27 07            [ 1] 3552 	ld a,#'"
      0092C1 55 00            [ 1] 3553 	ld (y),a 
      0092C3 03 00            [ 2] 3554 	incw y 
      0092C5 02               [ 1] 3555 1$:	ld a,(x)
      0092C6 20 33            [ 1] 3556 	jreq 9$
      0092C8 5C               [ 2] 3557 	incw x 
      0092C8 CD 92            [ 1] 3558 	cp a,#SPACE 
      0092CA 5E A1            [ 1] 3559 	jrult 3$
      0092CC 84 27            [ 1] 3560 	ld (y),a
      0092CE 03 CC            [ 2] 3561 	incw y 
      0092D0 88 FE            [ 1] 3562 	cp a,#'\ 
      0092D2 CF 00            [ 1] 3563 	jrne 1$ 
      0013EF                       3564 2$:
      0092D4 0D 1E            [ 1] 3565 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092D6 01 72            [ 2] 3566 	incw y  
      0092D8 B0 00            [ 2] 3567 	jra 1$
      0092DA 0D               [ 1] 3568 3$: push a 
      0092DB 26 06            [ 1] 3569 	ld a,#'\
      0092DD 35 02            [ 1] 3570 	ld (y),a 
      0092DF 00 0E            [ 2] 3571 	incw y  
      0092E1 20               [ 1] 3572 	pop a 
      0092E2 0C 07            [ 1] 3573 	sub a,#7
      0092E3 C7 00 0D         [ 1] 3574 	ld acc8,a 
      0092E3 2C 06 35 04      [ 1] 3575 	clr acc16
      0092E7 00               [ 2] 3576 	pushw x
      0092E8 0E 20 04         [ 2] 3577 	ldw x,#escaped 
      0092EB 72 BB 00 0C      [ 2] 3578 	addw x,acc16 
      0092EB 35               [ 1] 3579 	ld a,(x)
      0092EC 01               [ 2] 3580 	popw x
      0092ED 00 0E            [ 2] 3581 	jra 2$
      0092EF A6 22            [ 1] 3582 9$: ld a,#'"
      0092EF 5F C6            [ 1] 3583 	ld (y),a 
      0092F1 00 0E            [ 2] 3584 	incw y  
      0092F3 14               [ 2] 3585 	incw x 
      0092F4 03               [ 4] 3586 	ret
                                   3587 
                                   3588 ;--------------------------
                                   3589 ; return variable name 
                                   3590 ; from its address.
                                   3591 ; input:
                                   3592 ;   X    variable address
                                   3593 ; output:
                                   3594 ;   A     variable letter
                                   3595 ;--------------------------
      00141A                       3596 var_name:
      0092F5 4D 27 05         [ 2] 3597 		subw x,#vars 
      0092F8 5C               [ 1] 3598 		ld a,xl 
      0092F9 44               [ 1] 3599 		srl a 
      0092F9 20 02            [ 1] 3600 		add a,#'A 
      0092FB 1E               [ 4] 3601 		ret 
                                   3602 
                                   3603 
                                   3604 ;-------------------------------------
                                   3605 ; decompile tokens list 
                                   3606 ; to original text line 
                                   3607 ; input:
                                   3608 ;   [basicptr]  pointer at line 
                                   3609 ;   Y           destination buffer
                                   3610 ; output:
                                   3611 ;   A           length 
                                   3612 ;   Y           after string  
                                   3613 ;------------------------------------
                           000001  3614 	BASE_SAV=1
                           000002  3615 	WIDTH_SAV=2
                           000003  3616 	STR=3
                           000004  3617 	VSIZE=4 
      001422                       3618 decompile:
      001422                       3619 	_vars VSIZE
      0092FC 01 04            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0092FD C6 00 0A         [ 1] 3620 	ld a,base
      0092FD A6 84            [ 1] 3621 	ld (BASE_SAV,sp),a  
      0092FF C6 00 24         [ 1] 3622 	ld a,tab_width 
      0092FF 5B 03            [ 1] 3623 	ld (WIDTH_SAV,sp),a 
      009301 81 03            [ 2] 3624 	ldw (STR,sp),y   
      009302 72 CE 00 04      [ 5] 3625 	ldw x,[basicptr] ; line number 
      009302 AE 93 1C CD      [ 1] 3626 	mov base,#10
      009306 83 33 96 1C      [ 1] 3627 	mov tab_width,#5
      00930A 00 03 90 AE      [ 1] 3628 	clr acc24 
      00930E 18 00 CF         [ 2] 3629 	ldw acc16,x
      009311 00 0D 72         [ 4] 3630 	call itoa  
      009314 B2 00 0D         [ 4] 3631 	call right_align 
      009317 CD               [ 1] 3632 	push a 
      009318 83 D5            [ 1] 3633 1$:	ldw y,x ; source
      00931A 4F 81            [ 2] 3634 	ldw x,(STR+1,sp) ; destination
      00931C 0A 63 6F         [ 4] 3635 	call strcpy 
      00931F 6E 74            [ 1] 3636 	clrw y 
      009321 65               [ 1] 3637 	pop a 
      009322 6E 74            [ 1] 3638 	ld yl,a 
      009324 20 6F 66         [ 2] 3639 	addw y,(STR,sp)
      009327 20 73            [ 1] 3640 	ld a,#SPACE 
      009329 74 61            [ 1] 3641 	ld (y),a 
      00932B 63 6B            [ 2] 3642 	incw y 
      00932D 20 66 72 6F      [ 1] 3643 	clr tab_width
      009331 6D 20 74         [ 2] 3644 	ldw x,#3
      009334 6F 70 20         [ 2] 3645 	ldw in.w,x 
      001469                       3646 decomp_loop:
      009337 74 6F            [ 2] 3647 	pushw y
      009339 20 62 6F         [ 4] 3648 	call next_token 
      00933C 74 74            [ 2] 3649 	popw y 
      00933E 6F               [ 1] 3650 	tnz a  
      00933F 6D 3A            [ 1] 3651 	jrne 1$
      009341 0A 00 45         [ 2] 3652 	jp 20$
      009343 2A 65            [ 1] 3653 1$:	jrpl 6$
                                   3654 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      009343 35 10            [ 1] 3655 	cp a,#TK_VAR 
      009345 00 0B            [ 1] 3656 	jrne 3$
                                   3657 ;; TK_VAR 
      009347 81 13 B5         [ 4] 3658 	call add_space  
      009348 CD 14 1A         [ 4] 3659 	call var_name
      009348 35 0A            [ 1] 3660 	ld (y),a 
      00934A 00 0B            [ 2] 3661 	incw y  
      00934C 81 E1            [ 2] 3662 	jra decomp_loop
      00934D                       3663 3$:
      00934D AE 16            [ 1] 3664 	cp a,#TK_INTGR
      00934F 90 72            [ 1] 3665 	jrne 4$
                                   3666 ;; TK_INTGR
      009351 B0 00 1F         [ 4] 3667 	call add_space
      009354 A6 84 81 0B      [ 1] 3668 	clr acc24 
      009357 CF 00 0C         [ 2] 3669 	ldw acc16,x 
      009357 AE 16            [ 2] 3670 	pushw y 
      009359 90 72 B0         [ 4] 3671 	call itoa  
      00935C 00 1F            [ 2] 3672 	ldw y,(1,sp) 
      00935E 90               [ 1] 3673 	push a 
      00935F CE               [ 1] 3674 	exgw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009360 00 05 90         [ 4] 3675 	call strcpy 
      009363 C3 00            [ 1] 3676 	clrw y
      009365 1F               [ 1] 3677 	pop a  
      009366 25 0A            [ 1] 3678 	ld yl,a 
      009368 3B 00 04         [ 2] 3679 	addw y,(1,sp)
      0014AA                       3680 	_drop 2 
      00936B 4B 00            [ 2]    1     addw sp,#2 
      00936D 72 F0            [ 2] 3681 	jra decomp_loop
                                   3682 ;; dictionary keyword 
      0014AE                       3683 4$:	
      00936F 01 5B 02         [ 2] 3684 	cpw x,#remark 
      009372 54 CF            [ 1] 3685 	jrne 5$
      009374 00 22 A6         [ 2] 3686 	ldw x,basicptr 
      009377 84 81 00 00      [ 2] 3687 	addw x,in.w 
                                   3688 ; copy comment to buffer 
      009379 CD 13 B5         [ 4] 3689 	call add_space
      009379 CD 89            [ 1] 3690 	ld a,#''
      00937B F0 A1            [ 1] 3691 	ld (y),a 
      00937D 85 27            [ 2] 3692 	incw y 
      0014C3                       3693 41$:
      00937F 0A               [ 1] 3694 	ld a,(x)
      009380 A1               [ 2] 3695 	incw x 
      009381 06 27            [ 1] 3696 	ld (y),a 
      009383 03 CC            [ 2] 3697 	incw y 
      009385 88               [ 1] 3698 	tnz a 
      009386 FE F7            [ 1] 3699 	jrne 41$
      009387 20 77            [ 2] 3700 	jra 20$  
                                   3701 ; insert command name 
      0014CE                       3702 5$:
      009387 CD 91 90         [ 4] 3703 	call add_space  
      00938A 90 89            [ 2] 3704 	pushw y
      00938A 89 CD 89         [ 4] 3705 	call cmd_name
      00938D F0 A1            [ 2] 3706 	popw y 
      00938F 32 27 03         [ 4] 3707 	call cpy_cmd_name
      009392 CC 88            [ 2] 3708 	jra decomp_loop 
      0014DD                       3709 6$:
      009394 FE 02            [ 1] 3710 	cp a,#TK_QSTR 
      009395 26 06            [ 1] 3711 	jrne 7$
                                   3712 ;; TK_QSTR
      009395 CD 92 A7         [ 4] 3713 	call cpy_quote  
      009398 A1 84 27         [ 2] 3714 	jp decomp_loop
      0014E7                       3715 7$:
      00939B 03 CC            [ 1] 3716 	cp a,#TK_CHAR 
      00939D 88 FE            [ 1] 3717 	jrne 8$
                                   3718 ;; TK_CHAR 
      00939F A6 5C            [ 1] 3719 	ld a,#'\ 
      00939F 90 93            [ 1] 3720 	ld (y),a 
      0093A1 85 FF            [ 2] 3721 	incw y 
      0093A3 81               [ 1] 3722 	ld a,xl 
      0093A4 90 F7            [ 1] 3723 	ld (y),a 
      0093A4 CE 00            [ 2] 3724 	incw y 
      0093A6 1D C3 00         [ 2] 3725 	jp decomp_loop
      0093A9 1F 2B            [ 1] 3726 8$: cp a,#TK_COLON 
      0093AB 01 81            [ 1] 3727 	jrne 9$
      0093AD A6 3A            [ 1] 3728 	ld a,#':
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0014FF                       3729 81$:
      0093AD 52 06            [ 1] 3730 	ld (y),a 
      0093AF 1F 05            [ 2] 3731 	incw y 
      001503                       3732 82$:
      0093B1 FE 1F 01         [ 2] 3733 	jp decomp_loop
      001506                       3734 9$: 
      0093B4 AE 7F            [ 1] 3735 	cp a,#TK_SHARP
      0093B6 FF 1F            [ 1] 3736 	jrugt 10$ 
      0093B8 03 CD            [ 1] 3737 	sub a,#TK_ARRAY 
      0093BA 91               [ 1] 3738 	clrw x 
      0093BB 65               [ 1] 3739 	ld xl,a
      0093BC 4D 27 31         [ 2] 3740 	addw x,#single_char 
      0093BF A1               [ 1] 3741 	ld a,(x)
      0093C0 02 27            [ 2] 3742 	jra 81$ 
      001514                       3743 10$: 
      0093C2 07 A1            [ 1] 3744 	cp a,#TK_MINUS 
      0093C4 01 27            [ 1] 3745 	jrugt 11$
      0093C6 06 CC            [ 1] 3746 	sub a,#TK_PLUS 
      0093C8 88               [ 1] 3747 	clrw x 
      0093C9 FE               [ 1] 3748 	ld xl,a 
      0093CA 85 1F 05         [ 2] 3749 	addw x,#add_char 
      0093CD F6               [ 1] 3750 	ld a,(x)
      0093CD 85 1F            [ 2] 3751 	jra 81$
      001522                       3752 11$:
      0093CF 01 22            [ 1] 3753     cp a,#TK_MOD 
      0093D0 22 0A            [ 1] 3754 	jrugt 12$
      0093D0 CE 00            [ 1] 3755 	sub a,#TK_MULT
      0093D2 1D               [ 1] 3756 	clrw x 
      0093D3 1F               [ 1] 3757 	ld xl,a 
      0093D4 05 C3 00         [ 2] 3758 	addw x,#mul_char
      0093D7 1F               [ 1] 3759 	ld a,(x)
      0093D8 2A 38            [ 2] 3760 	jra 81$
      001530                       3761 12$:
      0093DA FE 13            [ 1] 3762 	sub a,#TK_GT  
      0093DC 01               [ 1] 3763 	sll a 
      0093DD 2A               [ 1] 3764 	clrw x 
      0093DE 11               [ 1] 3765 	ld xl,a 
      0093DF 1E 05 E6         [ 2] 3766 	addw x,#relop_str 
      0093E2 02               [ 2] 3767 	ldw x,(x)
      0093E3 C7               [ 1] 3768 	ld a,(x)
      0093E4 00               [ 2] 3769 	incw x 
      0093E5 0E 72            [ 1] 3770 	ld (y),a
      0093E7 5F 00            [ 2] 3771 	incw y 
      0093E9 0D               [ 1] 3772 	ld a,(x)
      0093EA 72 BB            [ 1] 3773 	jrne 81$
      0093EC 00 0D 20         [ 2] 3774 	jp decomp_loop 
      001545                       3775 20$: 
      0093EF E3 7F            [ 1] 3776 	clr (y)
      0093F0 1E 03            [ 2] 3777 	ldw x,(STR,sp)
      0093F0 1E 05            [ 1] 3778 	ld a,(BASE_SAV,sp)
      0093F2 E6 02 CD         [ 1] 3779 	ld base,a 
      0093F5 96 00            [ 1] 3780 	ld a,(WIDTH_SAV,sp)
      0093F7 1E 05 E6         [ 1] 3781 	ld tab_width,a
      0093FA 02 C7 00         [ 2] 3782 	subw y,(STR,sp) 
      0093FD 0E 72            [ 1] 3783 	ld a,yl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      001558                       3784 	_drop VSIZE 
      0093FF 5F 00            [ 2]    1     addw sp,#VSIZE 
      009401 0D               [ 4] 3785 	ret 
                                   3786 
      009402 72 BB 00 0D C3        3787 single_char: .byte '@','(',')',',','#'
      009407 00 1F                 3788 add_char: .byte '+','-'
      009409 2A 07 1F              3789 mul_char: .byte '*','/','%'
      00940C 05 FE 13 03 2F DE 15  3790 relop_str: .word gt,equal,ge,lt,le,ne 
             78 15 7A 15 7D
      009412 3E 00                 3791 gt: .asciz ">"
      009412 55 00                 3792 equal: .asciz "="
      009414 04 00 02              3793 ge: .asciz ">="
      009417 AE 16                 3794 lt: .asciz "<"
      009419 E0 CF 00              3795 le: .asciz "<="
      00941C 05 5B 06              3796 ne:  .asciz "<>"
                                   3797 
                                   3798 
                                   3799 ;--------------------------
                                   3800 ; decompile line from token list
                                   3801 ; and print it. 
                                   3802 ; input:
                                   3803 ;   A       stop at this position 
                                   3804 ;   X 		pointer at line
                                   3805 ; output:
                                   3806 ;   none 
                                   3807 ;--------------------------	
      001580                       3808 prt_basic_line:
      00941F 81 00 03         [ 1] 3809 	ld count,a 
      009420 E6 02            [ 1] 3810 	ld a,(2,x)
      009420 F6 5C A4         [ 1] 3811 	cp a,count 
      009423 0F 88            [ 1] 3812 	jrpl 1$ 
      009425 0D 01 27         [ 1] 3813 	ld count,a 
      009428 0A F6 90         [ 2] 3814 1$:	ldw basicptr,x 
      00942B F7 5C 90 5C      [ 2] 3815 	ldw y,#tib  
      00942F 0A 01 26         [ 4] 3816 	call decompile 
      009432 F6 84 81         [ 4] 3817 	call puts 
      009435 A6 0D            [ 1] 3818 	ld a,#CR 
      009435 90 5A 90         [ 4] 3819 	call putc 
      009438 F6               [ 4] 3820 	ret 
                                   3821 
                                   3822 
                                   3823 
                                   3824 ;---------------------------------
                                   3825 ; BASIC: PRINT|? arg_list 
                                   3826 ; print values from argument list
                                   3827 ;----------------------------------
                           000001  3828 	COMMA=1
                           000001  3829 	VSIZE=1
      0015A0                       3830 print:
      009439 90 5C            [ 1] 3831 push #0 ; local variable COMMA 
      0015A2                       3832 reset_comma:
      00943B CD 86            [ 1] 3833 	clr (COMMA,sp)
      0015A4                       3834 prt_loop:
      00943D 05 24 06         [ 4] 3835 	call next_token
      009440 A6 20            [ 1] 3836 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009442 90 F7            [ 1] 3837 	jrult print_exit ; colon or end of line 
      009444 90 5C            [ 1] 3838 	cp a,#TK_QSTR
      009446 81 12            [ 1] 3839 	jreq 1$
      009447 A1 03            [ 1] 3840 	cp a,#TK_CHAR 
      009447 88 7B            [ 1] 3841 	jreq 2$ 
      009449 01 C1            [ 1] 3842 	cp a,#TK_CFUNC 
      00944B 00 25            [ 1] 3843 	jreq 3$
      00944D 2A 08            [ 1] 3844 	cp a,#TK_COMMA 
      00944F A6 20            [ 1] 3845 	jreq 4$
      009451 5A F7            [ 1] 3846 	cp a,#TK_SHARP 
      009453 0C 01            [ 1] 3847 	jreq 5$
      009455 20 F1            [ 2] 3848 	jra 7$ 
      0015C1                       3849 1$:	; print string 
      009457 84 81 B3         [ 4] 3850 	call puts
      009459 20 DC            [ 2] 3851 	jra reset_comma
      0015C6                       3852 2$:	; print character 
      009459 A6               [ 1] 3853 	ld a,xl 
      00945A 22 90 F7         [ 4] 3854 	call putc 
      00945D 90 5C            [ 2] 3855 	jra reset_comma 
      0015CC                       3856 3$: ; print character function value  	
      00945F F6               [ 4] 3857 	call (x)
      009460 27               [ 1] 3858 	ld a,xl 
      009461 30 5C A1         [ 4] 3859 	call putc
      009464 20 25            [ 2] 3860 	jra reset_comma 
      0015D3                       3861 4$: ; set comma state 
      009466 0E 90            [ 1] 3862 	ld a,#255 
      009468 F7 90            [ 1] 3863 	ld (COMMA,sp),a  
      00946A 5C A1 5C         [ 2] 3864 	jp prt_loop   
      0015DA                       3865 5$: ; # character must be followed by an integer   
      00946D 26 F0 70         [ 4] 3866 	call next_token
      00946F A1 84            [ 1] 3867 	cp a,#TK_INTGR 
      00946F 90 F7            [ 1] 3868 	jreq 6$
      009471 90 5C 20         [ 2] 3869 	jp syntax_error 
      0015E4                       3870 6$: ; set tab width
      009474 EA               [ 1] 3871 	ld a,xl 
      009475 88 A6            [ 1] 3872 	and a,#15 
      009477 5C 90 F7         [ 1] 3873 	ld tab_width,a 
      00947A 90 5C            [ 2] 3874 	jra reset_comma 
      0015EC                       3875 7$:	
      0015EC                       3876 	_unget_token
      00947C 84 A0 07 C7 00   [ 1]    1     mov in,in.saved
      009481 0E 72 5F         [ 4] 3877 	call relation 
      009484 00 0D            [ 1] 3878 	cp a,#TK_INTGR
      009486 89 AE            [ 1] 3879 	jreq 8$
      0015F8                       3880 	_unget_token
      009488 8C 61 72 BB 00   [ 1]    1     mov in,in.saved
      00948D 0D F6 85         [ 2] 3881 	jp print_exit 
      009490 20 DD A6         [ 4] 3882 8$: call print_int 
      009493 22 90            [ 2] 3883 	jra reset_comma 
      001605                       3884 print_exit:
      009495 F7 90            [ 1] 3885 	tnz (COMMA,sp)
      009497 5C 5C            [ 1] 3886 	jrne 9$
      009499 81 0D            [ 1] 3887 	ld a,#CR 
      00949A CD 02 A0         [ 4] 3888     call putc 
      00160E                       3889 9$:	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00949A 1D 00            [ 2]    1     addw sp,#VSIZE 
      00949C 27               [ 4] 3890 	ret 
                                   3891 
      001611                       3892 print_type: 
                                   3893 
                                   3894 ;----------------------
                                   3895 ; 'save_context' and
                                   3896 ; 'rest_context' must be 
                                   3897 ; called at the same 
                                   3898 ; call stack depth 
                                   3899 ; i.e. SP must have the 
                                   3900 ; save value at  
                                   3901 ; entry point of both 
                                   3902 ; routine. 
                                   3903 ;---------------------
                           000004  3904 	CTXT_SIZE=4 ; size of saved data 
                                   3905 ;--------------------
                                   3906 ; save current BASIC
                                   3907 ; interpreter context 
                                   3908 ; on stack 
                                   3909 ;--------------------
      001611                       3910 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001611                       3911 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001611                       3912 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001611                       3913 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001611                       3914 save_context:
      00949D 9F 44 AB         [ 2] 3915 	ldw x,basicptr 
      0094A0 41 81            [ 2] 3916 	ldw (BPTR,sp),x
      0094A2 C6 00 01         [ 1] 3917 	ld a,in 
      0094A2 52 04            [ 1] 3918 	ld (IN,sp),a
      0094A4 C6 00 0B         [ 1] 3919 	ld a,count 
      0094A7 6B 01            [ 1] 3920 	ld (CNT,sp),a  
      0094A9 C6               [ 4] 3921 	ret
                                   3922 
                                   3923 ;-----------------------
                                   3924 ; restore previously saved 
                                   3925 ; BASIC interpreter context 
                                   3926 ; from stack 
                                   3927 ;-------------------------
      001621                       3928 rest_context:
      0094AA 00 25            [ 2] 3929 	ldw x,(BPTR,sp)
      0094AC 6B 02 17         [ 2] 3930 	ldw basicptr,x 
      0094AF 03 72            [ 1] 3931 	ld a,(IN,sp)
      0094B1 CE 00 05         [ 1] 3932 	ld in,a
      0094B4 35 0A            [ 1] 3933 	ld a,(CNT,sp)
      0094B6 00 0B 35         [ 1] 3934 	ld count,a  
      0094B9 05               [ 4] 3935 	ret
                                   3936 
                                   3937 
                                   3938 
                                   3939 ;------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3940 ; BASIC: INPUT [string]var[,[string]var]
                                   3941 ; input value in variables 
                                   3942 ; [string] optionally can be used as prompt 
                                   3943 ;-----------------------------------------
                           000001  3944 	CX_BPTR=1
                           000003  3945 	CX_IN=3
                           000004  3946 	CX_CNT=4
                           000005  3947 	SKIP=5
                           000006  3948 	VAR_ADDR=6
                           000007  3949 	VSIZE=7
      001631                       3950 input_var:
      001631                       3951 	_vars VSIZE 
      0094BA 00 25            [ 2]    1     sub sp,#VSIZE 
      001633                       3952 input_loop:
      0094BC 72 5F            [ 1] 3953 	clr (SKIP,sp)
      0094BE 00 0C CF         [ 4] 3954 	call next_token 
      0094C1 00 0D            [ 1] 3955 	cp a,#TK_QSTR 
      0094C3 CD 8A            [ 1] 3956 	jrne 1$ 
      0094C5 61 CD 94         [ 4] 3957 	call puts 
      0094C8 47 88            [ 1] 3958 	cpl (SKIP,sp)
      0094CA 90 93 1E         [ 4] 3959 	call next_token 
      0094CD 04 CD            [ 1] 3960 1$: cp a,#TK_VAR  
      0094CF 84 30            [ 1] 3961 	jreq 2$ 
      0094D1 90 5F 84         [ 2] 3962 	jp syntax_error
      0094D4 90 97            [ 2] 3963 2$:	ldw (VAR_ADDR,sp),x 
      0094D6 72 F9            [ 1] 3964 	tnz (SKIP,sp)
      0094D8 03 A6            [ 1] 3965 	jrne 21$ 
      0094DA 20 90 F7         [ 4] 3966 	call var_name 
      0094DD 90 5C 72         [ 4] 3967 	call putc   
      001657                       3968 21$:
      0094E0 5F 00            [ 1] 3969 	ld a,#':
      0094E2 25 AE 00         [ 4] 3970 	call putc 
      0094E5 03 CF 00         [ 4] 3971 	call save_context 
      0094E8 01 5F 00 03      [ 1] 3972 	clr count  
      0094E9 CD 0A C0         [ 4] 3973 	call readln 
      0094E9 90 89 CD         [ 2] 3974 	ldw x,#tib 
      0094EC 89 F0 90         [ 1] 3975 	push count
      0094EF 85 4D            [ 1] 3976 	push #0 
      0094F1 26 03 CC         [ 2] 3977 	addw x,(1,sp)
      0094F4 95               [ 2] 3978 	incw x 
      001672                       3979 	_drop 2 
      0094F5 C5 2A            [ 2]    1     addw sp,#2 
      0094F7 65 A1 85 26      [ 1] 3980 	clr in 
      0094FB 0C CD 94         [ 4] 3981 	call get_token
      0094FE 35 CD            [ 1] 3982 	cp a,#TK_INTGR
      009500 94 9A            [ 1] 3983 	jreq 3$ 
      009502 90 F7 90         [ 4] 3984 	call rest_context 
      009505 5C 20 E1         [ 2] 3985 	jp syntax_error
      009508 16 06            [ 2] 3986 3$: ldw y,(VAR_ADDR,sp) 
      009508 A1 84            [ 2] 3987 	ldw (y),x 
      00950A 26 22 CD         [ 4] 3988 	call rest_context
      00950D 94 35 72         [ 4] 3989 	call next_token 
      009510 5F 00            [ 1] 3990 	cp a,#TK_COMMA 
      009512 0C CF            [ 1] 3991 	jreq input_loop 
      009514 00 0D            [ 1] 3992 	cp a,#TK_COLON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009516 90 89            [ 2] 3993     jrule input_exit 
      009518 CD 8A 61         [ 2] 3994 	jp syntax_error 
      00169A                       3995 input_exit:
      00169A                       3996 	_drop VSIZE 
      00951B 16 01            [ 2]    1     addw sp,#VSIZE 
      00951D 88               [ 4] 3997 	ret 
                                   3998 
                                   3999 
                                   4000 ;---------------------
                                   4001 ; BASIC: REMARK | ' 
                                   4002 ; skip comment to end of line 
                                   4003 ;---------------------- 
      00169D                       4004 remark:
      00951E 51 CD 84 30 90   [ 1] 4005 	mov in,count 
      009523 5F               [ 4] 4006  	ret 
                                   4007 
                                   4008 
                                   4009 ;---------------------
                                   4010 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4011 ; read in loop 'addr'  
                                   4012 ; apply & 'mask' to value 
                                   4013 ; loop while result==0.  
                                   4014 ; 'xor_mask' is used to 
                                   4015 ; invert the wait logic.
                                   4016 ; i.e. loop while not 0.
                                   4017 ;---------------------
                           000001  4018 	XMASK=1 
                           000002  4019 	MASK=2
                           000003  4020 	ADDR=3
                           000004  4021 	VSIZE=4
      0016A3                       4022 wait: 
      0016A3                       4023 	_vars VSIZE
      009524 84 90            [ 2]    1     sub sp,#VSIZE 
      009526 97 72            [ 1] 4024 	clr (XMASK,sp) 
      009528 F9 01 5B         [ 4] 4025 	call arg_list 
      00952B 02 20            [ 1] 4026 	cp a,#2
      00952D BB 03            [ 1] 4027 	jruge 0$
      00952E CC 08 7E         [ 2] 4028 	jp syntax_error 
      00952E A3 97            [ 1] 4029 0$:	cp a,#3
      009530 1D 26            [ 1] 4030 	jrult 1$
      009532 1B               [ 2] 4031 	popw x 
      009533 CE               [ 1] 4032 	ld a,xl
      009534 00 05            [ 1] 4033 	ld (XMASK,sp),a 
      009536 72               [ 2] 4034 1$: popw x ; mask 
      009537 BB               [ 1] 4035 	ld a,xl 
      009538 00 01            [ 1] 4036 	ld (MASK,sp),a 
      00953A CD               [ 2] 4037 	popw x ; address 
      00953B 94               [ 1] 4038 2$:	ld a,(x)
      00953C 35 A6            [ 1] 4039 	and a,(MASK,sp)
      00953E 27 90            [ 1] 4040 	xor a,(XMASK,sp)
      009540 F7 90            [ 1] 4041 	jreq 2$ 
      0016C5                       4042 	_drop VSIZE 
      009542 5C 04            [ 2]    1     addw sp,#VSIZE 
      009543 81               [ 4] 4043 	ret 
                                   4044 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4045 ;---------------------
                                   4046 ; BASIC: BSET addr,mask
                                   4047 ; set bits at 'addr' corresponding 
                                   4048 ; to those of 'mask' that are at 1.
                                   4049 ; arguments:
                                   4050 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4051 ;   mask        mask|addr
                                   4052 ; output:
                                   4053 ;	none 
                                   4054 ;--------------------------
      0016C8                       4055 bit_set:
      009543 F6 5C 90         [ 4] 4056 	call arg_list 
      009546 F7 90            [ 1] 4057 	cp a,#2	 
      009548 5C 4D            [ 1] 4058 	jreq 1$ 
      00954A 26 F7 20         [ 2] 4059 	jp syntax_error
      0016D2                       4060 1$: 
      00954D 77               [ 2] 4061 	popw x ; mask 
      00954E 9F               [ 1] 4062 	ld a,xl 
      00954E CD               [ 2] 4063 	popw x ; addr  
      00954F 94               [ 1] 4064 	or a,(x)
      009550 35               [ 1] 4065 	ld (x),a
      009551 90               [ 4] 4066 	ret 
                                   4067 
                                   4068 ;---------------------
                                   4069 ; BASIC: BRES addr,mask
                                   4070 ; reset bits at 'addr' corresponding 
                                   4071 ; to those of 'mask' that are at 1.
                                   4072 ; arguments:
                                   4073 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4074 ;   mask	    ~mask&*addr  
                                   4075 ; output:
                                   4076 ;	none 
                                   4077 ;--------------------------
      0016D8                       4078 bit_reset:
      009552 89 CD 90         [ 4] 4079 	call arg_list 
      009555 D4 90            [ 1] 4080 	cp a,#2  
      009557 85 CD            [ 1] 4081 	jreq 1$ 
      009559 94 20 20         [ 2] 4082 	jp syntax_error
      0016E2                       4083 1$: 
      00955C 8C               [ 2] 4084 	popw x ; mask 
      00955D 9F               [ 1] 4085 	ld a,xl 
      00955D A1               [ 1] 4086 	cpl a 
      00955E 02               [ 2] 4087 	popw x ; addr  
      00955F 26               [ 1] 4088 	and a,(x)
      009560 06               [ 1] 4089 	ld (x),a 
      009561 CD               [ 4] 4090 	ret 
                                   4091 
                                   4092 ;---------------------
                                   4093 ; BASIC: BTOGL addr,mask
                                   4094 ; toggle bits at 'addr' corresponding 
                                   4095 ; to those of 'mask' that are at 1.
                                   4096 ; arguments:
                                   4097 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4098 ;   mask	    mask^*addr  
                                   4099 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4100 ;	none 
                                   4101 ;--------------------------
      0016E9                       4102 bit_toggle:
      009562 94 59 CC         [ 4] 4103 	call arg_list 
      009565 94 E9            [ 1] 4104 	cp a,#2 
      009567 27 03            [ 1] 4105 	jreq 1$ 
      009567 A1 03 26         [ 2] 4106 	jp syntax_error
      00956A 0E               [ 2] 4107 1$: popw x ; mask 
      00956B A6               [ 1] 4108 	ld a,xl 
      00956C 5C               [ 2] 4109 	popw x ; addr  
      00956D 90               [ 1] 4110 	xor a,(x)
      00956E F7               [ 1] 4111 	ld (x),a 
      00956F 90               [ 4] 4112 	ret 
                                   4113 
                                   4114 
                                   4115 ;---------------------
                                   4116 ; BASIC: BTEST(addr,bit)
                                   4117 ; return bit value at 'addr' 
                                   4118 ; bit is in range {0..7}.
                                   4119 ; arguments:
                                   4120 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4121 ;   bit 	    bit position {0..7}  
                                   4122 ; output:
                                   4123 ;	none 
                                   4124 ;--------------------------
      0016F9                       4125 bit_test:
      009570 5C 9F 90         [ 4] 4126 	call func_args 
      009573 F7 90            [ 1] 4127 	cp a,#2
      009575 5C CC            [ 1] 4128 	jreq 0$
      009577 94 E9 A1         [ 2] 4129 	jp syntax_error
      001703                       4130 0$:	
      00957A 01               [ 2] 4131 	popw x 
      00957B 26               [ 1] 4132 	ld a,xl 
      00957C 09 A6            [ 1] 4133 	and a,#7
      00957E 3A               [ 1] 4134 	push a   
      00957F A6 01            [ 1] 4135 	ld a,#1 
      00957F 90 F7            [ 1] 4136 1$: tnz (1,sp)
      009581 90 5C            [ 1] 4137 	jreq 2$
      009583 48               [ 1] 4138 	sll a 
      009583 CC 94            [ 1] 4139 	dec (1,sp)
      009585 E9 F7            [ 2] 4140 	jra 1$
      009586                       4141 2$: _drop 1 
      009586 A1 0A            [ 2]    1     addw sp,#1 
      009588 22               [ 2] 4142 	popw x 
      009589 0A               [ 1] 4143 	and a,(x)
      00958A A0 06            [ 1] 4144 	jreq 3$
      00958C 5F 97            [ 1] 4145 	ld a,#1 
      00958E 1C               [ 1] 4146 3$:	clrw x 
      00958F 95               [ 1] 4147 	ld xl,a 
      009590 DB F6            [ 1] 4148 	ld a,#TK_INTGR
      009592 20               [ 4] 4149 	ret
                                   4150 
                                   4151 
                                   4152 ;--------------------
                                   4153 ; BASIC: POKE addr,byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4154 ; put a byte at addr 
                                   4155 ;--------------------
      001720                       4156 poke:
      009593 EB 10 E5         [ 4] 4157 	call arg_list 
      009594 A1 02            [ 1] 4158 	cp a,#2
      009594 A1 11            [ 1] 4159 	jreq 1$
      009596 22 0A A0         [ 2] 4160 	jp syntax_error
      00172A                       4161 1$:	
      009599 10               [ 2] 4162 	popw x  
      00959A 5F               [ 1] 4163     ld a,xl 
      00959B 97               [ 2] 4164 	popw x 
      00959C 1C               [ 1] 4165 	ld (x),a 
      00959D 95               [ 4] 4166 	ret 
                                   4167 
                                   4168 ;-----------------------
                                   4169 ; BASIC: PEEK(addr)
                                   4170 ; get the byte at addr 
                                   4171 ; input:
                                   4172 ;	none 
                                   4173 ; output:
                                   4174 ;	X 		value 
                                   4175 ;-----------------------
      00172F                       4176 peek:
      00959E E0 F6 20         [ 4] 4177 	call func_args
      0095A1 DD 01            [ 1] 4178 	cp a,#1 
      0095A2 27 03            [ 1] 4179 	jreq 1$
      0095A2 A1 22 22         [ 2] 4180 	jp syntax_error
      0095A5 0A               [ 2] 4181 1$: popw x 
      0095A6 A0               [ 1] 4182 	ld a,(x)
      0095A7 20               [ 1] 4183 	clrw x 
      0095A8 5F               [ 1] 4184 	ld xl,a 
      0095A9 97 1C            [ 1] 4185 	ld a,#TK_INTGR
      0095AB 95               [ 4] 4186 	ret 
                                   4187 
                                   4188 ;---------------------------
                                   4189 ; BASIC IF expr : instructions
                                   4190 ; evaluate expr and if true 
                                   4191 ; execute instructions on same line. 
                                   4192 ;----------------------------
      001740                       4193 if: 
      0095AC E2 F6 20         [ 4] 4194 	call relation 
      0095AF CF 84            [ 1] 4195 	cp a,#TK_INTGR
      0095B0 27 03            [ 1] 4196 	jreq 1$ 
      0095B0 A0 31 48         [ 2] 4197 	jp syntax_error
      0095B3 5F               [ 1] 4198 1$:	clr a 
      0095B4 97               [ 2] 4199 	tnzw x 
      0095B5 1C 95            [ 1] 4200 	jrne 9$  
                                   4201 ;skip to next line
      0095B7 E5 FE F6 5C 90   [ 1] 4202 	mov in,count
      0095BC F7               [ 4] 4203 9$:	ret 
                                   4204 
                                   4205 ;------------------------
                                   4206 ; BASIC: FOR var=expr 
                                   4207 ; set variable to expression 
                                   4208 ; leave variable address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4209 ; on stack and set
                                   4210 ; FLOOP bit in 'flags'
                                   4211 ;-----------------
                           000001  4212 	RETL1=1 ; return address  
                           000003  4213 	FSTEP=3  ; variable increment
                           000005  4214 	LIMIT=5 ; loop limit 
                           000007  4215 	CVAR=7   ; control variable 
                           000009  4216 	INW=9   ;  in.w saved
                           00000B  4217 	BPTR=11 ; baseptr saved
                           00000A  4218 	VSIZE=10  
      001754                       4219 for: ; { -- var_addr }
      0095BD 90               [ 2] 4220 	popw x ; call return address 
      001755                       4221 	_vars VSIZE 
      0095BE 5C F6            [ 2]    1     sub sp,#VSIZE 
      0095C0 26               [ 2] 4222 	pushw x  ; RETL1 
      0095C1 BD CC            [ 1] 4223 	ld a,#TK_VAR 
      0095C3 94 E9 D3         [ 4] 4224 	call expect
      0095C5 1F 07            [ 2] 4225 	ldw (CVAR,sp),x  ; control variable 
      0095C5 90 7F 1E         [ 4] 4226 	call let_var 
      0095C8 03 7B 01 C7      [ 1] 4227 	bset flags,#FLOOP 
                                   4228 ; open space on stack for loop data 
      0095CC 00               [ 1] 4229 	clrw x 
      0095CD 0B 7B            [ 2] 4230 	ldw (BPTR,sp),x 
      0095CF 02 C7            [ 2] 4231 	ldw (INW,sp),x 
      0095D1 00 25 72         [ 4] 4232 	call next_token 
      0095D4 F2 03            [ 1] 4233 	cp a,#TK_CMD 
      0095D6 90 9F            [ 1] 4234 	jreq 1$
      0095D8 5B 04 81         [ 2] 4235 	jp syntax_error
      001775                       4236 1$:  
      0095DB 40 28 29         [ 2] 4237 	cpw x,#to 
      0095DE 2C 23            [ 1] 4238 	jreq to
      0095E0 2B 2D 2A         [ 2] 4239 	jp syntax_error 
                                   4240 
                                   4241 ;-----------------------------------
                                   4242 ; BASIC: TO expr 
                                   4243 ; second part of FOR loop initilization
                                   4244 ; leave limit on stack and set 
                                   4245 ; FTO bit in 'flags'
                                   4246 ;-----------------------------------
      00177D                       4247 to: ; { var_addr -- var_addr limit step }
      0095E3 2F 25 95 F1 95   [ 2] 4248 	btjt flags,#FLOOP,1$
      0095E8 F3 95 F5         [ 2] 4249 	jp syntax_error
      0095EB 95 F8 95         [ 4] 4250 1$: call relation  
      0095EE FA 95            [ 1] 4251 	cp a,#TK_INTGR 
      0095F0 FD 3E            [ 1] 4252 	jreq 2$ 
      0095F2 00 3D 00         [ 2] 4253 	jp syntax_error
      0095F5 3E 3D            [ 2] 4254 2$: ldw (LIMIT,sp),x
                                   4255 ;	ldw x,in.w 
      0095F7 00 3C 00         [ 4] 4256 	call next_token
      0095FA 3C 3D            [ 1] 4257 	cp a,#TK_NONE  
      0095FC 00 3C            [ 1] 4258 	jreq 4$ 
      0095FE 3E 00            [ 1] 4259 	cp a,#TK_CMD
      009600 26 05            [ 1] 4260 	jrne 3$
      009600 C7 00 04         [ 2] 4261 	cpw x,#step 
      009603 E6 02            [ 1] 4262 	jreq step
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0017A1                       4263 3$:	
      0017A1                       4264 	_unget_token   	 
      009605 C1 00 04 2A 03   [ 1]    1     mov in,in.saved
      0017A6                       4265 4$:	
      00960A C7 00 04         [ 2] 4266 	ldw x,#1   ; default step  
      00960D CF 00            [ 2] 4267 	ldw (FSTEP,sp),x 
      00960F 05 90            [ 2] 4268 	jra store_loop_addr 
                                   4269 
                                   4270 
                                   4271 ;----------------------------------
                                   4272 ; BASIC: STEP expr 
                                   4273 ; optional third par of FOR loop
                                   4274 ; initialization. 	
                                   4275 ;------------------------------------
      0017AD                       4276 step: ; {var limit -- var limit step}
      009611 AE 16 90 CD 94   [ 2] 4277 	btjt flags,#FLOOP,1$
      009616 A2 CD 83         [ 2] 4278 	jp syntax_error
      009619 33 A6 0D         [ 4] 4279 1$: call relation
      00961C CD 83            [ 1] 4280 	cp a,#TK_INTGR
      00961E 20 81            [ 1] 4281 	jreq 2$
      009620 CC 08 7E         [ 2] 4282 	jp syntax_error
      009620 4B 00            [ 2] 4283 2$:	ldw (FSTEP,sp),x ; step
                                   4284 ; leave loop back entry point on cstack 
                                   4285 ; cstack is 1 call deep from interpreter
      009622                       4286 store_loop_addr:
      009622 0F 01 04         [ 2] 4287 	ldw x,basicptr  
      009624 1F 0B            [ 2] 4288 	ldw (BPTR,sp),x 
      009624 CD 89 F0         [ 2] 4289 	ldw x,in.w 
      009627 A1 02            [ 2] 4290 	ldw (INW,sp),x   
      009629 25 5A A1 02      [ 1] 4291 	bres flags,#FLOOP 
      00962D 27 12 A1 03      [ 1] 4292 	inc loop_depth  
      009631 27               [ 4] 4293 	ret 
                                   4294 
                                   4295 ;--------------------------------
                                   4296 ; BASIC: NEXT var 
                                   4297 ; FOR loop control 
                                   4298 ; increment variable with step 
                                   4299 ; and compare with limit 
                                   4300 ; loop if threshold not crossed.
                                   4301 ; else stack. 
                                   4302 ; and decrement 'loop_depth' 
                                   4303 ;--------------------------------
      0017D4                       4304 next: ; {var limit step retl1 -- [var limit step ] }
      009632 13 A1 82 27      [ 1] 4305 	tnz loop_depth 
      009636 15 A1            [ 1] 4306 	jrne 1$ 
      009638 09 27 18         [ 2] 4307 	jp syntax_error 
      0017DD                       4308 1$: 
      00963B A1 0A            [ 1] 4309 	ld a,#TK_VAR 
      00963D 27 1B 20         [ 4] 4310 	call expect
                                   4311 ; check for good variable after NEXT 	 
      009640 2B 07            [ 2] 4312 	cpw x,(CVAR,sp)
      009641 27 03            [ 1] 4313 	jreq 2$  
      009641 CD 83 33         [ 2] 4314 	jp syntax_error ; not the good one 
      0017E9                       4315 2$: ; increment variable 
      009644 20               [ 2] 4316 	ldw x,(x)  ; get var value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009645 DC FB 03         [ 2] 4317 	addw x,(FSTEP,sp) ; var+step 
      009646 16 07            [ 2] 4318 	ldw y,(CVAR,sp)
      009646 9F CD            [ 2] 4319 	ldw (y),x ; save var new value 
                                   4320 ; check sign of STEP  
      009648 83 20            [ 1] 4321 	ld a,#0x80
      00964A 20 D6            [ 1] 4322 	bcp a,(FSTEP,sp)
      00964C 2A 06            [ 1] 4323 	jrpl 4$
                                   4324 ;negative step 
      00964C FD 9F            [ 2] 4325 	cpw x,(LIMIT,sp)
      00964E CD 83            [ 1] 4326 	jrslt loop_done
      009650 20 20            [ 2] 4327 	jra loop_back 
      0017FD                       4328 4$: ; positive step
      009652 CF 05            [ 2] 4329 	cpw x,(LIMIT,sp)
      009653 2C 15            [ 1] 4330 	jrsgt loop_done
      001801                       4331 loop_back:
      009653 A6 FF            [ 2] 4332 	ldw x,(BPTR,sp)
      009655 6B 01 CC         [ 2] 4333 	ldw basicptr,x 
      009658 96 24 00 23 05   [ 2] 4334 	btjf flags,#FRUN,1$ 
      00965A E6 02            [ 1] 4335 	ld a,(2,x)
      00965A CD 89 F0         [ 1] 4336 	ld count,a
      00965D A1 84            [ 2] 4337 1$:	ldw x,(INW,sp)
      00965F 27 03 CC         [ 2] 4338 	ldw in.w,x 
      009662 88               [ 4] 4339 	ret 
      001816                       4340 loop_done:
                                   4341 	; remove loop data from stack  
      009663 FE               [ 2] 4342 	popw x
      009664                       4343 	_drop VSIZE 
      009664 9F A4            [ 2]    1     addw sp,#VSIZE 
      009666 0F C7 00 25      [ 1] 4344 	dec loop_depth 
                                   4345 ;	pushw x 
                                   4346 ;	ret 
      00966A 20               [ 2] 4347 	jp (x)
                                   4348 
                                   4349 ;----------------------------
                                   4350 ; called by goto/gosub
                                   4351 ; to get target line number 
                                   4352 ;---------------------------
      00181E                       4353 get_target_line:
      00966B B6 12 27         [ 4] 4354 	call relation 
      00966C A1 84            [ 1] 4355 	cp a,#TK_INTGR
      00966C 55 00            [ 1] 4356 	jreq 1$
      00966E 03 00 02         [ 2] 4357 	jp syntax_error
      009671 CD 92 A7         [ 4] 4358 1$:	call search_lineno  
      009674 A1               [ 2] 4359 	tnzw x 
      009675 84 27            [ 1] 4360 	jrne 2$ 
      009677 08 55            [ 1] 4361 	ld a,#ERR_NO_LINE 
      009679 00 03 00         [ 2] 4362 	jp tb_error 
      00967C 02               [ 4] 4363 2$:	ret 
                                   4364 
                                   4365 ;------------------------
                                   4366 ; BASIC: GOTO line# 
                                   4367 ; jump to line# 
                                   4368 ; here cstack is 2 call deep from interpreter 
                                   4369 ;------------------------
      001834                       4370 goto:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00967D CC 96 85 CD 8A   [ 2] 4371 	btjt flags,#FRUN,0$ 
      009682 45 20            [ 1] 4372 	ld a,#ERR_RUN_ONLY
      009684 9D 08 80         [ 2] 4373 	jp tb_error 
      009685 81               [ 4] 4374 	ret 
      009685 0D 01 26         [ 4] 4375 0$:	call get_target_line
      001842                       4376 jp_to_target:
      009688 05 A6 0D         [ 2] 4377 	ldw basicptr,x 
      00968B CD 83            [ 1] 4378 	ld a,(2,x)
      00968D 20 5B 01         [ 1] 4379 	ld count,a 
      009690 81 03 00 01      [ 1] 4380 	mov in,#3 
      009691 81               [ 4] 4381 	ret 
                                   4382 
                                   4383 
                                   4384 ;--------------------
                                   4385 ; BASIC: GOSUB line#
                                   4386 ; basic subroutine call
                                   4387 ; actual line# and basicptr 
                                   4388 ; are saved on cstack
                                   4389 ; here cstack is 2 call deep from interpreter 
                                   4390 ;--------------------
                           000003  4391 	RET_ADDR=3
                           000005  4392 	RET_INW=5
                           000004  4393 	VSIZE=4  
      009691                       4394 gosub:
      009691 CE 00 05 1F 03   [ 2] 4395 	btjt flags,#FRUN,0$ 
      009696 C6 00            [ 1] 4396 	ld a,#ERR_RUN_ONLY
      009698 02 6B 05         [ 2] 4397 	jp tb_error 
      00969B C6               [ 4] 4398 	ret 
      00969C 00               [ 2] 4399 0$:	popw x 
      00185B                       4400 	_vars VSIZE  
      00969D 04 6B            [ 2]    1     sub sp,#VSIZE 
      00969F 06               [ 2] 4401 	pushw x 
      0096A0 81 00 04         [ 2] 4402 	ldw x,basicptr
      0096A1 1F 03            [ 2] 4403 	ldw (RET_ADDR,sp),x 
      0096A1 1E 03 CF         [ 4] 4404 	call get_target_line  
      0096A4 00               [ 2] 4405 	pushw x 
      0096A5 05 7B 05         [ 2] 4406 	ldw x,in.w 
      0096A8 C7 00            [ 2] 4407 	ldw (RET_INW+2,sp),x
      0096AA 02               [ 2] 4408 	popw x 
      0096AB 7B 06            [ 2] 4409 	jra jp_to_target
                                   4410 
                                   4411 ;------------------------
                                   4412 ; BASIC: RETURN 
                                   4413 ; exit from a subroutine 
                                   4414 ; 
                                   4415 ;------------------------
      00186F                       4416 return:
      0096AD C7 00 04 81 05   [ 2] 4417 	btjt flags,#FRUN,0$ 
      0096B1 A6 06            [ 1] 4418 	ld a,#ERR_RUN_ONLY
      0096B1 52 07 80         [ 2] 4419 	jp tb_error 
      0096B3                       4420 0$:	
      0096B3 0F 05            [ 2] 4421 	ldw x,(RET_ADDR,sp) 
      0096B5 CD 89 F0         [ 2] 4422 	ldw basicptr,x
      0096B8 A1 02            [ 1] 4423 	ld a,(2,x)
      0096BA 26 08 CD         [ 1] 4424 	ld count,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0096BD 83 33            [ 2] 4425 	ldw x,(RET_INW,sp)
      0096BF 03 05 CD         [ 2] 4426 	ldw in.w,x 
      0096C2 89               [ 2] 4427 	popw x 
      001889                       4428 	_drop VSIZE 
      0096C3 F0 A1            [ 2]    1     addw sp,#VSIZE 
      0096C5 85               [ 2] 4429 	pushw x
      0096C6 27               [ 4] 4430 	ret  
                                   4431 
                                   4432 
                                   4433 ;----------------------------------
                                   4434 ; BASIC: RUN
                                   4435 ; run BASIC program in RAM
                                   4436 ;----------------------------------- 
      00188D                       4437 run: 
      0096C7 03 CC 88 FE 1F   [ 2] 4438 	btjf flags,#FRUN,0$  
      0096CC 06               [ 1] 4439 	clr a 
      0096CD 0D               [ 4] 4440 	ret
      001894                       4441 0$: 
      0096CE 05 26 06 CD 94   [ 2] 4442 	btjf flags,#FBREAK,1$
      001899                       4443 	_drop 2 
      0096D3 9A CD            [ 2]    1     addw sp,#2 
      0096D5 83 20 21         [ 4] 4444 	call rest_context
      0096D7                       4445 	_drop CTXT_SIZE 
      0096D7 A6 3A            [ 2]    1     addw sp,#CTXT_SIZE 
      0096D9 CD 83 20 CD      [ 1] 4446 	bres flags,#FBREAK 
      0096DD 96 91 72 5F      [ 1] 4447 	bset flags,#FRUN 
      0096E1 00 04 CD         [ 2] 4448 	jp interpreter 
      0096E4 8B 40 AE         [ 2] 4449 1$:	ldw x,txtbgn
      0096E7 16 90 3B         [ 2] 4450 	cpw x,txtend 
      0096EA 00 04            [ 1] 4451 	jrmi run_it 
      0096EC 4B 00 72         [ 2] 4452 	ldw x,#err_no_prog
      0096EF FB 01 5C         [ 4] 4453 	call puts 
      0096F2 5B 02 72 5F 00   [ 1] 4454 	mov in,count
      0096F7 02               [ 4] 4455 	ret 
      0018BF                       4456 run_it:	 
      0096F8 CD 8D 3D         [ 4] 4457     call ubound 
      0018C2                       4458 	_drop 2 ; drop return address 
      0096FB A1 84            [ 2]    1     addw sp,#2 
                                   4459 ; clear data pointer 
      0096FD 27               [ 1] 4460 	clrw x 
      0096FE 06 CD 96         [ 2] 4461 	ldw data_ptr,x 
      009701 A1 CC 88 FE      [ 1] 4462 	clr data_ofs 
      009705 16 06 90 FF      [ 1] 4463 	clr data_len 
                                   4464 ; initialize BASIC pointer 
      009709 CD 96 A1         [ 2] 4465 	ldw x,txtbgn 
      00970C CD 89 F0         [ 2] 4466 	ldw basicptr,x 
      00970F A1 09            [ 1] 4467 	ld a,(2,x)
      009711 27 A0 A1         [ 1] 4468 	ld count,a
      009714 01 23 03 CC      [ 1] 4469 	mov in,#3	
      009718 88 FE 00 23      [ 1] 4470 	bset flags,#FRUN 
      00971A CC 09 24         [ 2] 4471 	jp interpreter 
                                   4472 
                                   4473 
                                   4474 ;----------------------
                                   4475 ; BASIC: END
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4476 ; end running program
                                   4477 ;---------------------- 
      0018E6                       4478 cmd_end: 
                                   4479 ; clean stack 
      00971A 5B 07 81         [ 2] 4480 	ldw x,#STACK_EMPTY
      00971D 94               [ 1] 4481 	ldw sp,x 
      00971D 55 00 04         [ 2] 4482 	jp warm_start
                                   4483 
                                   4484 
                                   4485 ;-----------------------
                                   4486 ; BASIC: TONE expr1,expr2
                                   4487 ; used TIMER2 channel 1
                                   4488 ; to produce a tone 
                                   4489 ; arguments:
                                   4490 ;    expr1   frequency 
                                   4491 ;    expr2   duration msec.
                                   4492 ;---------------------------
      0018ED                       4493 tone:
      009720 00 02 81         [ 4] 4494 	call arg_list 
      009723 A1 02            [ 1] 4495 	cp a,#2 
      009723 52 04            [ 1] 4496 	jreq 1$
      009725 0F 01 CD         [ 2] 4497 	jp syntax_error 
      0018F7                       4498 1$: 
      009728 91               [ 2] 4499 	popw x ; duration
      009729 65 A1            [ 2] 4500 	popw y ; frequency 
      0018FA                       4501 beep:  
      00972B 02               [ 2] 4502 	pushw x 
      00972C 24 03 CC         [ 2] 4503 	ldw x,#TIM2_CLK_FREQ
      00972F 88               [ 2] 4504 	divw x,y 
                                   4505 ; round to nearest integer 
      009730 FE A1 03 25      [ 2] 4506 	cpw y,#TIM2_CLK_FREQ/2
      009734 04 85            [ 1] 4507 	jrmi 2$
      009736 9F               [ 2] 4508 	incw x 
      001906                       4509 2$:	 
      009737 6B               [ 1] 4510 	ld a,xh 
      009738 01 85 9F         [ 1] 4511 	ld TIM2_ARRH,a 
      00973B 6B               [ 1] 4512 	ld a,xl 
      00973C 02 85 F6         [ 1] 4513 	ld TIM2_ARRL,a 
                                   4514 ; 50% duty cycle 
      00973F 14               [ 1] 4515 	ccf 
      009740 02               [ 2] 4516 	rrcw x 
      009741 18               [ 1] 4517 	ld a,xh 
      009742 01 27 F9         [ 1] 4518 	ld TIM2_CCR1H,a 
      009745 5B               [ 1] 4519 	ld a,xl
      009746 04 81 10         [ 1] 4520 	ld TIM2_CCR1L,a
      009748 72 10 53 08      [ 1] 4521 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009748 CD 91 65 A1      [ 1] 4522 	bset TIM2_CR1,#TIM2_CR1_CEN
      00974C 02 27 03 CC      [ 1] 4523 	bset TIM2_EGR,#TIM2_EGR_UG
      009750 88               [ 2] 4524 	popw x 
      009751 FE 1E 9B         [ 4] 4525 	call pause02
      009752 72 11 53 08      [ 1] 4526 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009752 85 9F 85 FA      [ 1] 4527 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009756 F7               [ 4] 4528 	ret 
                                   4529 
                                   4530 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4531 ; BASIC: ADCON 0|1 [,divisor]  
                                   4532 ; disable/enanble ADC 
                                   4533 ;-------------------------------
                           000003  4534 	ONOFF=3 
                           000001  4535 	DIVSOR=1
                           000004  4536 	VSIZE=4 
      001931                       4537 power_adc:
      009757 81 10 E5         [ 4] 4538 	call arg_list 
      009758 A1 02            [ 1] 4539 	cp a,#2	
      009758 CD 91            [ 1] 4540 	jreq 1$
      00975A 65 A1            [ 1] 4541 	cp a,#1 
      00975C 02 27            [ 1] 4542 	jreq 0$ 
      00975E 03 CC 88         [ 2] 4543 	jp syntax_error 
      009761 FE 00 00         [ 2] 4544 0$: ldw x,#0
      009762 89               [ 2] 4545 	pushw x  ; divisor 
      009762 85 9F            [ 2] 4546 1$: ldw x,(ONOFF,sp)
      009764 43               [ 2] 4547 	tnzw x 
      009765 85 F4            [ 1] 4548 	jreq 2$ 
      009767 F7 81            [ 2] 4549 	ldw x,(DIVSOR,sp) ; divisor 
      009769 9F               [ 1] 4550 	ld a,xl
      009769 CD 91            [ 1] 4551 	and a,#7
      00976B 65               [ 1] 4552 	swap a 
      00976C A1 02 27         [ 1] 4553 	ld ADC_CR1,a
      00976F 03 CC 88 FE      [ 1] 4554 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009773 85 9F 85 F8      [ 1] 4555 	bset ADC_CR1,#ADC_CR1_ADON 
      001959                       4556 	_usec_dly 7 
      009777 F7 81 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009779 5A               [ 2]    2     decw x
      009779 CD               [ 1]    3     nop 
      00977A 91 60            [ 1]    4     jrne .-4
      00977C A1 02            [ 2] 4557 	jra 3$
      00977E 27 03 CC 88      [ 1] 4558 2$: bres ADC_CR1,#ADC_CR1_ADON
      009782 FE 17 50 CA      [ 1] 4559 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      009783                       4560 3$:	_drop VSIZE 
      009783 85 9F            [ 2]    1     addw sp,#VSIZE 
      009785 A4               [ 4] 4561 	ret
                                   4562 
                                   4563 ;-----------------------------
                                   4564 ; BASIC: ADCREAD (channel)
                                   4565 ; read adc channel {0..5}
                                   4566 ; output:
                                   4567 ;   A 		TK_INTGR 
                                   4568 ;   X 		value 
                                   4569 ;-----------------------------
      00196D                       4570 analog_read:
      009786 07 88 A6         [ 4] 4571 	call func_args 
      009789 01 0D            [ 1] 4572 	cp a,#1 
      00978B 01 27            [ 1] 4573 	jreq 1$
      00978D 05 48 0A         [ 2] 4574 	jp syntax_error
      009790 01               [ 2] 4575 1$: popw x 
      009791 20 F7 5B         [ 2] 4576 	cpw x,#5 
      009794 01 85            [ 2] 4577 	jrule 2$
      009796 F4 27            [ 1] 4578 	ld a,#ERR_BAD_VALUE
      009798 02 A6 01         [ 2] 4579 	jp tb_error 
      00979B 5F               [ 1] 4580 2$: ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00979C 97 A6 84         [ 1] 4581 	ld acc8,a 
      00979F 81 05            [ 1] 4582 	ld a,#5
      0097A0 C0 00 0D         [ 1] 4583 	sub a,acc8 
      0097A0 CD 91 65         [ 1] 4584 	ld ADC_CSR,a
      0097A3 A1 02 27 03      [ 1] 4585 	bset ADC_CR2,#ADC_CR2_ALIGN
      0097A7 CC 88 FE 01      [ 1] 4586 	bset ADC_CR1,#ADC_CR1_ADON
      0097AA 72 0F 54 00 FB   [ 2] 4587 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0097AA 85 9F 85         [ 2] 4588 	ldw x,ADC_DRH
      0097AD F7 81            [ 1] 4589 	ld a,#TK_INTGR
      0097AF 81               [ 4] 4590 	ret 
                                   4591 
                                   4592 ;-----------------------
                                   4593 ; BASIC: DREAD(pin)
                                   4594 ; Arduino pins 
                                   4595 ; read state of a digital pin 
                                   4596 ; pin# {0..15}
                                   4597 ; output:
                                   4598 ;    A 		TK_INTGR
                                   4599 ;    X      0|1 
                                   4600 ;-------------------------
                           000001  4601 	PINNO=1
                           000001  4602 	VSIZE=1
      0019A1                       4603 digital_read:
      0019A1                       4604 	_vars VSIZE 
      0097AF CD 91            [ 2]    1     sub sp,#VSIZE 
      0097B1 60 A1 01         [ 4] 4605 	call func_args
      0097B4 27 03            [ 1] 4606 	cp a,#1
      0097B6 CC 88            [ 1] 4607 	jreq 1$
      0097B8 FE 85 F6         [ 2] 4608 	jp syntax_error
      0097BB 5F               [ 2] 4609 1$: popw x 
      0097BC 97 A6 84         [ 2] 4610 	cpw x,#15 
      0097BF 81 05            [ 2] 4611 	jrule 2$
      0097C0 A6 0A            [ 1] 4612 	ld a,#ERR_BAD_VALUE
      0097C0 CD 92 A7         [ 2] 4613 	jp tb_error 
      0097C3 A1 84 27         [ 4] 4614 2$:	call select_pin 
      0097C6 03 CC            [ 1] 4615 	ld (PINNO,sp),a
      0097C8 88 FE            [ 1] 4616 	ld a,(GPIO_IDR,x)
      0097CA 4F 5D            [ 1] 4617 	tnz (PINNO,sp)
      0097CC 26 05            [ 1] 4618 	jreq 8$
      0097CE 55               [ 1] 4619 3$: srl a 
      0097CF 00 04            [ 1] 4620 	dec (PINNO,sp)
      0097D1 00 02            [ 1] 4621 	jrne 3$ 
      0097D3 81 01            [ 1] 4622 8$: and a,#1 
      0097D4 5F               [ 1] 4623 	clrw x 
      0097D4 85               [ 1] 4624 	ld xl,a 
      0097D5 52 0A            [ 1] 4625 	ld a,#TK_INTGR
      0019CE                       4626 	_drop VSIZE
      0097D7 89 A6            [ 2]    1     addw sp,#VSIZE 
      0097D9 85               [ 4] 4627 	ret
                                   4628 
                                   4629 ;-----------------------
                                   4630 ; BASIC: DWRITE pin,0|1
                                   4631 ; Arduino pins 
                                   4632 ; write to a digital pin 
                                   4633 ; pin# {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4634 ; output:
                                   4635 ;    A 		TK_INTGR
                                   4636 ;    X      0|1 
                                   4637 ;-------------------------
                           000001  4638 	PINNO=1
                           000002  4639 	PINVAL=2
                           000002  4640 	VSIZE=2
      0019D1                       4641 digital_write:
      0019D1                       4642 	_vars VSIZE 
      0097DA CD 91            [ 2]    1     sub sp,#VSIZE 
      0097DC 53 1F 07         [ 4] 4643 	call arg_list  
      0097DF CD 93            [ 1] 4644 	cp a,#2 
      0097E1 8A 72            [ 1] 4645 	jreq 1$
      0097E3 14 00 24         [ 2] 4646 	jp syntax_error
      0097E6 5F               [ 2] 4647 1$: popw x 
      0097E7 1F               [ 1] 4648 	ld a,xl 
      0097E8 0B 1F            [ 1] 4649 	ld (PINVAL,sp),a
      0097EA 09               [ 2] 4650 	popw x 
      0097EB CD 89 F0         [ 2] 4651 	cpw x,#15 
      0097EE A1 80            [ 2] 4652 	jrule 2$
      0097F0 27 03            [ 1] 4653 	ld a,#ERR_BAD_VALUE
      0097F2 CC 88 FE         [ 2] 4654 	jp tb_error 
      0097F5 CD 1F CE         [ 4] 4655 2$:	call select_pin 
      0097F5 A3 97            [ 1] 4656 	ld (PINNO,sp),a 
      0097F7 FD 27            [ 1] 4657 	ld a,#1
      0097F9 03 CC            [ 1] 4658 	tnz (PINNO,sp)
      0097FB 88 FE            [ 1] 4659 	jreq 4$
      0097FD 48               [ 1] 4660 3$: sll a
      0097FD 72 04            [ 1] 4661 	dec (PINNO,sp)
      0097FF 00 24            [ 1] 4662 	jrne 3$
      009801 03 CC            [ 1] 4663 4$: tnz (PINVAL,sp)
      009803 88 FE            [ 1] 4664 	jrne 5$
      009805 CD               [ 1] 4665 	cpl a 
      009806 92 A7            [ 1] 4666 	and a,(GPIO_ODR,x)
      009808 A1 84            [ 2] 4667 	jra 8$
      00980A 27 03            [ 1] 4668 5$: or a,(GPIO_ODR,x)
      00980C CC 88            [ 1] 4669 8$: ld (GPIO_ODR,x),a 
      001A09                       4670 	_drop VSIZE 
      00980E FE 1F            [ 2]    1     addw sp,#VSIZE 
      009810 05               [ 4] 4671 	ret
                                   4672 
                                   4673 
                                   4674 ;-----------------------
                                   4675 ; BASIC: STOP
                                   4676 ; stop progam execution  
                                   4677 ; without resetting pointers 
                                   4678 ; the program is resumed
                                   4679 ; with RUN 
                                   4680 ;-------------------------
      001A0C                       4681 stop:
      009811 CD 89 F0 A1 00   [ 2] 4682 	btjt flags,#FRUN,2$
      009816 27               [ 1] 4683 	clr a
      009817 0E               [ 4] 4684 	ret 
      001A13                       4685 2$:	 
                                   4686 ; create space on cstack to save context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009818 A1 80 26         [ 2] 4687 	ldw x,#break_point 
      00981B 05 A3 98         [ 4] 4688 	call puts 
      001A19                       4689 	_drop 2 ;drop return address 
      00981E 2D 27            [ 2]    1     addw sp,#2 
      001A1B                       4690 	_vars CTXT_SIZE ; context size 
      009820 0C 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009821 CD 16 11         [ 4] 4691 	call save_context 
      009821 55 00 03         [ 2] 4692 	ldw x,#tib 
      009824 00 02 04         [ 2] 4693 	ldw basicptr,x
      009826 7F               [ 1] 4694 	clr (x)
      009826 AE 00 01 1F      [ 1] 4695 	clr count  
      00982A 03               [ 1] 4696 	clrw x 
      00982B 20 14 00         [ 2] 4697 	ldw in.w,x
      00982D 72 11 00 23      [ 1] 4698 	bres flags,#FRUN 
      00982D 72 04 00 24      [ 1] 4699 	bset flags,#FBREAK
      009831 03 CC 88         [ 2] 4700 	jp interpreter 
      009834 FE CD 92 A7 A1 84 27  4701 break_point: .asciz "\nbreak point, RUN to resume.\n"
             03 CC 88 FE 1F 03 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4702 
                                   4703 ;-----------------------
                                   4704 ; BASIC: NEW
                                   4705 ; from command line only 
                                   4706 ; free program memory
                                   4707 ; and clear variables 
                                   4708 ;------------------------
      009841                       4709 new: 
      009841 CE 00 05 1F 0B   [ 2] 4710 	btjf flags,#FRUN,0$ 
      009846 CE               [ 4] 4711 	ret 
      001A5E                       4712 0$:	
      009847 00 01 1F         [ 4] 4713 	call clear_basic 
      00984A 09               [ 4] 4714 	ret 
                                   4715 	 
                                   4716 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4717 ;  file system routines
                                   4718 ;  MCU flash memory from
                                   4719 ;  0x10000-0x27fff is 
                                   4720 ;  used to store BASIC 
                                   4721 ;  program files. 
                                   4722 ;  use 128 bytes sectors
                                   4723 ;  because this is the MCU 
                                   4724 ;  row size.
                                   4725 ;  file entry aligned to row
                                   4726 ;  	name  variable length
                                   4727 ;  	size  2 bytes  
                                   4728 ; 	data  variable length 
                                   4729 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4730 
                                   4731 ;---------------------------
                                   4732 ; fill pad with zeros 
                                   4733 ;--------------------------
      001A62                       4734 zero_pad:
      00984B 72 15 00         [ 2] 4735 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00984E 24 72            [ 1] 4736 	ld a,#PAD_SIZE 
      009850 5C               [ 1] 4737 1$:	clr (x)
      009851 00               [ 2] 4738 	incw x 
      009852 21               [ 1] 4739 	dec a 
      009853 81 FB            [ 1] 4740 	jrne 1$
      009854 81               [ 4] 4741 	ret 
                                   4742 
                                   4743 ;--------------------------
                                   4744 ; align farptr to BLOCK_SIZE 
                                   4745 ;---------------------------
      001A6D                       4746 row_align:
      009854 72 5D            [ 1] 4747 	ld a,#0x7f 
      009856 00 21 26         [ 1] 4748 	and a,farptr+2 
      009859 03 CC            [ 1] 4749 	jreq 1$ 
      00985B 88 FE 17         [ 2] 4750 	ldw x,farptr+1 
      00985D 1C 00 80         [ 2] 4751 	addw x,#BLOCK_SIZE 
      00985D A6 85            [ 1] 4752 	jrnc 0$
      00985F CD 91 53 13      [ 1] 4753 	inc farptr 
      009863 07               [ 1] 4754 0$: ld a,xl 
      009864 27 03            [ 1] 4755 	and a,#0x80
      009866 CC               [ 1] 4756 	ld xl,a
      009867 88 FE 17         [ 2] 4757 	ldw farptr+1,x  	
      009869 81               [ 4] 4758 1$:	ret
                                   4759 
                                   4760 ;--------------------
                                   4761 ; input:
                                   4762 ;   X     increment 
                                   4763 ; output:
                                   4764 ;   farptr  incremented 
                                   4765 ;---------------------
      001A88                       4766 incr_farptr:
      009869 FE 72 FB 03      [ 2] 4767 	addw x,farptr+1 
      00986D 16 07            [ 1] 4768 	jrnc 1$
      00986F 90 FF A6 80      [ 1] 4769 	inc farptr 
      009873 15 03 2A         [ 2] 4770 1$:	ldw farptr+1,x  
      009876 06               [ 4] 4771 	ret 
                                   4772 
                                   4773 ;------------------------------
                                   4774 ; extended flash memory used as FLASH_DRIVE 
                                   4775 ; seek end of used flash drive   
                                   4776 ; starting at 0x10000 address.
                                   4777 ; 4 consecutives 0 bytes signal free space. 
                                   4778 ; input:
                                   4779 ;	none
                                   4780 ; output:
                                   4781 ;   ffree     free_addr| 0 if memory full.
                                   4782 ;------------------------------
      001A96                       4783 seek_fdrive:
                                   4784 ; start scan at 0x10000 address 
      009877 13 05            [ 1] 4785 	ld a,#1
      009879 2F 1B 20         [ 1] 4786 	ld farptr,a 
      00987C 04               [ 1] 4787 	clrw x 
      00987D CF 00 17         [ 2] 4788 	ldw farptr+1,x 
      001A9F                       4789 1$:
      00987D 13 05 2C         [ 2] 4790 	ldw x,#3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009880 15 AF 00 16      [ 5] 4791 2$:	ldf a,([farptr],x) 
      009881 26 05            [ 1] 4792 	jrne 3$
      009881 1E               [ 2] 4793 	decw x
      009882 0B CF            [ 1] 4794 	jrpl 2$
      009884 00 05            [ 2] 4795 	jra 4$ 
      009886 72 01 00         [ 2] 4796 3$:	ldw x,#BLOCK_SIZE 
      009889 24 05 E6         [ 4] 4797 	call incr_farptr
      00988C 02 C7 00         [ 2] 4798 	ldw x,#0x280  
      00988F 04 1E 09         [ 2] 4799 	cpw x,farptr
      009892 CF 00            [ 1] 4800 	jrmi 1$
      001ABB                       4801 4$: ; copy farptr to ffree	 
      009894 01 81 16         [ 2] 4802 	ldw x,farptr 
      009896 C6 00 18         [ 1] 4803 	ld a,farptr+2 
      009896 85 5B 0A         [ 2] 4804 	ldw ffree,x 
      009899 72 5A 00         [ 1] 4805 	ld ffree+2,a  
      00989C 21               [ 4] 4806 	ret 
                                   4807 
                                   4808 ;-----------------------
                                   4809 ; return amount of free 
                                   4810 ; space on flash drive
                                   4811 ; input:
                                   4812 ;   none
                                   4813 ; output:
                                   4814 ;   acc24   free space 
                                   4815 ;-----------------------
      001AC8                       4816 disk_free:
      00989D FC 80 00         [ 2] 4817 	ldw x,#0x8000
      00989E 72 B0 00 1A      [ 2] 4818 	subw x,ffree+1
      00989E CD 92            [ 1] 4819 	ld a,#2
      0098A0 A7 A1 84         [ 1] 4820 	sbc a,ffree 
      0098A3 27 03 CC         [ 1] 4821 	ld acc24,a 
      0098A6 88 FE CD         [ 2] 4822 	ldw acc16,x 
      0098A9 84               [ 4] 4823 	ret 
                                   4824 
                                   4825 ;-----------------------
                                   4826 ; compare file name 
                                   4827 ; with name pointed by Y  
                                   4828 ; input:
                                   4829 ;   farptr   file name 
                                   4830 ;   Y        target name 
                                   4831 ; output:
                                   4832 ;   farptr 	 at file_name
                                   4833 ;   X 		 farptr[x] point at size field  
                                   4834 ;   Carry    0|1 no match|match  
                                   4835 ;----------------------
      001ADB                       4836 cmp_name:
      0098AA 80               [ 1] 4837 	clrw x
      0098AB 5D 26 05 A6      [ 5] 4838 1$:	ldf a,([farptr],x)
      0098AF 05 CC            [ 1] 4839 	cp a,(y)
      0098B1 89 00            [ 1] 4840 	jrne 4$
      0098B3 81               [ 1] 4841 	tnz a 
      0098B4 27 12            [ 1] 4842 	jreq 9$ 
      0098B4 72               [ 2] 4843     incw x 
      0098B5 00 00            [ 2] 4844 	incw y 
      0098B7 24 06            [ 2] 4845 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001AEC                       4846 4$: ;no match 
      0098B9 A6               [ 1] 4847 	tnz a 
      0098BA 06 CC            [ 1] 4848 	jreq 5$
      0098BC 89               [ 2] 4849 	incw x 
      0098BD 00 81 CD 98      [ 5] 4850 	ldf a,([farptr],x)
      0098C1 9E F6            [ 2] 4851 	jra 4$  
      0098C2 5C               [ 2] 4852 5$:	incw x ; farptr[x] point at 'size' field 
      0098C2 CF               [ 1] 4853 	rcf 
      0098C3 00               [ 4] 4854 	ret
      001AF9                       4855 9$: ; match  
      0098C4 05               [ 2] 4856 	incw x  ; farptr[x] at 'size' field 
      0098C5 E6               [ 1] 4857 	scf 
      0098C6 02               [ 4] 4858 	ret 
                                   4859 
                                   4860 ;-----------------------
                                   4861 ; search file in 
                                   4862 ; flash memory 
                                   4863 ; input:
                                   4864 ;   Y       file name  
                                   4865 ; output:
                                   4866 ;   farptr  addr at name|0
                                   4867 ;   X       offset to size field
                                   4868 ;-----------------------
                           000001  4869 	FSIZE=1
                           000003  4870 	YSAVE=3
                           000004  4871 	VSIZE=4 
      001AFC                       4872 search_file: 
      001AFC                       4873 	_vars VSIZE
      0098C7 C7 00            [ 2]    1     sub sp,#VSIZE 
      0098C9 04 35            [ 2] 4874 	ldw (YSAVE,sp),y  
      0098CB 03               [ 1] 4875 	clrw x 
      0098CC 00 02 81         [ 2] 4876 	ldw farptr+1,x 
      0098CF 35 01 00 16      [ 1] 4877 	mov farptr,#1
      001B08                       4878 1$:	
                                   4879 ; check if farptr is after any file 
                                   4880 ; if  0 then so.
      0098CF 72 00 00 24      [ 5] 4881 	ldf a,[farptr]
      0098D3 06 A6            [ 1] 4882 	jreq 6$
      0098D5 06               [ 1] 4883 2$: clrw x 	
      0098D6 CC 89            [ 2] 4884 	ldw y,(YSAVE,sp) 
      0098D8 00 81 85         [ 4] 4885 	call cmp_name
      0098DB 52 04            [ 1] 4886 	jrc 9$
      0098DD 89 CE 00 05      [ 5] 4887 	ldf a,([farptr],x)
      0098E1 1F 03            [ 1] 4888 	ld (FSIZE,sp),a 
      0098E3 CD               [ 2] 4889 	incw x 
      0098E4 98 9E 89 CE      [ 5] 4890 	ldf a,([farptr],x)
      0098E8 00 01            [ 1] 4891 	ld (FSIZE+1,sp),a 
      0098EA 1F               [ 2] 4892 	incw x 
      0098EB 07 85 20         [ 2] 4893 	addw x,(FSIZE,sp) ; skip over file data
      0098EE D3 1A 88         [ 4] 4894 	call incr_farptr
      0098EF CD 1A 6D         [ 4] 4895 	call row_align  
      0098EF 72 00 00         [ 2] 4896 	ldw x,#0x280
      0098F2 24 05 A6         [ 2] 4897 	cpw x,farptr 
      0098F5 06 CC            [ 1] 4898 	jrpl 1$
      001B35                       4899 6$: ; file not found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0098F7 89 00 00 16      [ 1] 4900 	clr farptr
      0098F9 72 5F 00 17      [ 1] 4901 	clr farptr+1 
      0098F9 1E 03 CF 00      [ 1] 4902 	clr farptr+2 
      001B41                       4903 	_drop VSIZE 
      0098FD 05 E6            [ 2]    1     addw sp,#VSIZE 
      0098FF 02               [ 1] 4904 	rcf
      009900 C7               [ 4] 4905 	ret
      001B45                       4906 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B45                       4907 	_drop VSIZE 
      009901 00 04            [ 2]    1     addw sp,#VSIZE 
      009903 1E               [ 1] 4908 	scf 	
      009904 05               [ 4] 4909 	ret
                                   4910 
                                   4911 ;--------------------------------
                                   4912 ; BASIC: SAVE "name" 
                                   4913 ; save text program in 
                                   4914 ; flash memory used as permanent
                                   4915 ; storage from address 0x10000-0x27fff 
                                   4916 ;--------------------------------
                           000001  4917 	BSIZE=1
                           000003  4918 	NAMEPTR=3
                           000005  4919 	XSAVE=5
                           000007  4920 	YSAVE=7
                           000008  4921 	VSIZE=8 
      001B49                       4922 save:
      009905 CF 00 01 85 5B   [ 2] 4923 	btjf flags,#FRUN,0$ 
      00990A 04 89            [ 1] 4924 	ld a,#ERR_CMD_ONLY 
      00990C 81 08 80         [ 2] 4925 	jp tb_error
      00990D                       4926 0$:	 
      00990D 72 01 00         [ 2] 4927 	ldw x,txtend 
      009910 24 02 4F 81      [ 2] 4928 	subw x,txtbgn
      009914 26 0C            [ 1] 4929 	jrne 1$
                                   4930 ; nothing to save 
      009914 72 09 00         [ 2] 4931 	ldw x,#err_no_prog 
      009917 24 12 5B         [ 4] 4932 	call puts 
      00991A 02 CD 96 A1 5B   [ 1] 4933 	mov in,count 
      00991F 04               [ 4] 4934 	ret  	
      001B68                       4935 1$:	
      001B68                       4936 	_vars VSIZE 
      009920 72 19            [ 2]    1     sub sp,#VSIZE 
      009922 00 24            [ 2] 4937 	ldw (BSIZE,sp),x 
      009924 72 10 00         [ 4] 4938 	call next_token	
      009927 24 CC            [ 1] 4939 	cp a,#TK_QSTR
      009929 89 A4            [ 1] 4940 	jreq 2$
      00992B CE 00 1D         [ 2] 4941 	jp syntax_error
      001B76                       4942 2$: 
      00992E C3 00            [ 2] 4943 	ldw (NAMEPTR,sp),x  
      009930 1F 2B 0C         [ 4] 4944 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4945 ; check if enough free space 
      009933 AE 88 99         [ 4] 4946 	call strlen 
      009936 CD 83 33         [ 2] 4947 	addw x,#3 
      009939 55 00 04         [ 2] 4948 	addw x,(BSIZE,sp)
      00993C 00               [ 1] 4949 	clr a 
      00993D 02 81 00 1A      [ 2] 4950 	addw x,ffree+1 
      00993F C9 00 19         [ 1] 4951 	adc a,ffree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      00993F CD 93            [ 1] 4952 	cp a,#2
      009941 57 5B            [ 1] 4953 	jrmi 21$
      009943 02 5F CF         [ 2] 4954 	cpw x,#0x8000
      009946 00 07            [ 1] 4955 	jrmi 21$
      009948 72 5F            [ 1] 4956 	ld a,#ERR_NO_FSPACE  
      00994A 00 09 72         [ 2] 4957 	jp tb_error
      001B9A                       4958 21$: 
                                   4959 ; check for existing file of that name 
      00994D 5F 00            [ 2] 4960 	ldw y,(NAMEPTR,sp)	
      00994F 0A CE 00         [ 4] 4961 	call search_file 
      009952 1D CF            [ 1] 4962 	jrnc 3$ 
      009954 00 05            [ 1] 4963 	ld a,#ERR_DUPLICATE 
      009956 E6 02 C7         [ 2] 4964 	jp tb_error 
      001BA6                       4965 3$:	; initialize farptr 
      009959 00 04 35         [ 2] 4966 	ldw x,ffree 
      00995C 03 00 02         [ 1] 4967 	ld a,ffree+2 
      00995F 72 10 00         [ 2] 4968 	ldw farptr,x 
      009962 24 CC 89         [ 1] 4969 	ld farptr+2,a 
                                   4970 ;** write file name to row buffer **	
      009965 A4 03            [ 2] 4971 	ldw y,(NAMEPTR,sp)  
      009966 AE 16 E0         [ 2] 4972 	ldw x,#pad 
      009966 AE 17 FF         [ 4] 4973 	call strcpy
      009969 94 CC 89         [ 4] 4974 	call strlen 
      00996C 85               [ 2] 4975 	incw  x
      00996D 1C 16 E0         [ 2] 4976 	addw x,#pad 
                                   4977 ; ** write file size to row buffer 
      00996D CD 91            [ 2] 4978 	ldw y,(BSIZE,sp)
      00996F 65               [ 2] 4979 	ldw (x),y 
      009970 A1 02 27         [ 2] 4980 	addw x,#2 
                                   4981 ; ** write file data to row buffer 
      009973 03 CC 88 FE      [ 2] 4982 	ldw y,txtbgn 
      009977 90 F6            [ 1] 4983 6$:	ld a,(y)
      009977 85 90            [ 2] 4984 	incw y
      009979 85               [ 1] 4985 	ld (x),a 
      00997A 5C               [ 2] 4986 	incw x
      00997A 89 AE F4 24      [ 2] 4987 	cpw y,txtend 
      00997E 65 90            [ 1] 4988 	jreq 12$
      009980 A3 7A 12         [ 2] 4989 	cpw x,#stack_full 
      009983 2B 01            [ 1] 4990 	jrmi 6$
      001BDC                       4991 12$:
      009985 5C 07            [ 2] 4992 	ldw (YSAVE,sp),y 
      009986                       4993 14$: ; zero buffer end 
      009986 9E C7 53         [ 2] 4994 	cpw x,#stack_full
      009989 0D 9F            [ 1] 4995 	jreq 16$
      00998B C7               [ 1] 4996 	clr (x)
      00998C 53               [ 2] 4997 	incw x 
      00998D 0E 8C            [ 2] 4998 	jra 14$
      001BE7                       4999 16$:
      00998F 56 9E C7         [ 2] 5000 	ldw x,#pad 
      009992 53 0F 9F         [ 4] 5001 	call write_row 
      009995 C7 53 10         [ 2] 5002 	ldw x,#BLOCK_SIZE 
      009998 72 10 53         [ 4] 5003 	call incr_farptr
      00999B 08 72 10         [ 2] 5004 	ldw x,#pad 
      00999E 53 00            [ 2] 5005 	ldw y,(YSAVE,sp)
      0099A0 72 10 53 04      [ 2] 5006 	cpw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099A4 85 CD            [ 1] 5007 	jrmi 6$
                                   5008 ; save farptr in ffree
      0099A6 9F 1B 72         [ 2] 5009 	ldw x,farptr 
      0099A9 11 53 08         [ 1] 5010 	ld a,farptr+2 
      0099AC 72 11 53         [ 2] 5011 	ldw ffree,x 
      0099AF 00 81 1B         [ 1] 5012 	ld ffree+2,a
                                   5013 ; print file size 	
      0099B1 1E 01            [ 2] 5014 	ldw x,(BSIZE,sp) 
      0099B1 CD 91 65         [ 4] 5015 	call print_int 
      001C0F                       5016 	_drop VSIZE 
      0099B4 A1 02            [ 2]    1     addw sp,#VSIZE 
      0099B6 27               [ 4] 5017 	ret 
                                   5018 
                                   5019 ;----------------------
                                   5020 ; load file in RAM memory
                                   5021 ; input:
                                   5022 ;    farptr point at file size 
                                   5023 ; output:
                                   5024 ;   y point after BASIC program in RAM.
                                   5025 ;------------------------
      001C12                       5026 load_file:
      0099B7 0B A1 01         [ 4] 5027 	call incr_farptr  
      0099BA 27 03 CC         [ 4] 5028 	call clear_basic  
      0099BD 88               [ 1] 5029 	clrw x
      0099BE FE AE 00 00      [ 5] 5030 	ldf a,([farptr],x)
      0099C2 89 1E            [ 1] 5031 	ld yh,a 
      0099C4 03               [ 2] 5032 	incw x  
      0099C5 5D 27 1A 1E      [ 5] 5033 	ldf a,([farptr],x)
      0099C9 01               [ 2] 5034 	incw x 
      0099CA 9F A4            [ 1] 5035 	ld yl,a 
      0099CC 07 4E C7 54      [ 2] 5036 	addw y,txtbgn
      0099D0 01 72 16 50      [ 2] 5037 	ldw txtend,y
      0099D4 CA 72 10 54      [ 2] 5038 	ldw y,txtbgn
      001C33                       5039 3$:	; load BASIC text 	
      0099D8 01 AE 00 1B      [ 5] 5040 	ldf a,([farptr],x)
      0099DC 5A 9D            [ 1] 5041 	ld (y),a 
      0099DE 26               [ 2] 5042 	incw x 
      0099DF FA 20            [ 2] 5043 	incw y 
      0099E1 08 72 11 54      [ 2] 5044 	cpw y,txtend 
      0099E5 01 72            [ 1] 5045 	jrmi 3$
      0099E7 17               [ 4] 5046 	ret 
                                   5047 
                                   5048 ;------------------------
                                   5049 ; BASIC: LOAD "file" 
                                   5050 ; load file to RAM 
                                   5051 ; for execution 
                                   5052 ;------------------------
      001C43                       5053 load:
      0099E8 50 CA 5B 04 81   [ 2] 5054 	btjf flags,#FRUN,0$ 
      0099ED 27 05            [ 1] 5055 	jreq 0$ 
      0099ED CD 91            [ 1] 5056 	ld a,#ERR_CMD_ONLY 
      0099EF 60 A1 01         [ 2] 5057 	jp tb_error 
      001C4F                       5058 0$:	
      0099F2 27 03 CC         [ 4] 5059 	call next_token 
      0099F5 88 FE            [ 1] 5060 	cp a,#TK_QSTR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      0099F7 85 A3            [ 1] 5061 	jreq 1$
      0099F9 00 05 23         [ 2] 5062 	jp syntax_error 
      0099FC 05 A6            [ 1] 5063 1$:	ldw y,x 
      0099FE 0A CC 89         [ 4] 5064 	call search_file 
      009A01 00 9F            [ 1] 5065 	jrc 2$ 
      009A03 C7 00            [ 1] 5066 	ld a,#ERR_NOT_FILE
      009A05 0E A6 05         [ 2] 5067 	jp tb_error  
      001C65                       5068 2$:
      009A08 C0 00 0E         [ 4] 5069 	call load_file
                                   5070 ; print loaded size 	 
      009A0B C7 54 00         [ 2] 5071 	ldw x,txtend 
      009A0E 72 16 54 02      [ 2] 5072 	subw x,txtbgn
      009A12 72 10 54         [ 4] 5073 	call print_int 
      009A15 01               [ 4] 5074 	ret 
                                   5075 
                                   5076 ;-----------------------------------
                                   5077 ; BASIC: FORGET ["file_name"] 
                                   5078 ; erase file_name and all others 
                                   5079 ; after it. 
                                   5080 ; without argument erase all files 
                                   5081 ;-----------------------------------
                           000001  5082 	NEW_FREE=1 
                           000003  5083 	VSIZE=3 
      001C73                       5084 forget:
      001C73                       5085 	_vars VSIZE 
      009A16 72 0F            [ 2]    1     sub sp,#VSIZE 
      009A18 54 00 FB         [ 4] 5086 	call next_token 
      009A1B CE 54            [ 1] 5087 	cp a,#TK_NONE 
      009A1D 04 A6            [ 1] 5088 	jreq 3$ 
      009A1F 84 81            [ 1] 5089 	cp a,#TK_QSTR
      009A21 27 03            [ 1] 5090 	jreq 1$
      009A21 52 01 CD         [ 2] 5091 	jp syntax_error
      009A24 91 60            [ 1] 5092 1$: ldw y,x 
      009A26 A1 01 27 03 CC   [ 1] 5093 	mov in,count 
      009A2B 88 FE 85         [ 4] 5094 	call search_file
      009A2E A3 00            [ 1] 5095 	jrc 2$
      009A30 0F 23            [ 1] 5096 	ld a,#ERR_NOT_FILE 
      009A32 05 A6 0A         [ 2] 5097 	jp tb_error 
      001C94                       5098 2$: 
      009A35 CC 89 00         [ 2] 5099 	ldw x,farptr
      009A38 CD A0 4E         [ 1] 5100 	ld a,farptr+2
      009A3B 6B 01            [ 2] 5101 	jra 4$ 
      001C9C                       5102 3$: ; forget all files 
      009A3D E6 01 0D         [ 2] 5103 	ldw x,#0x100
      009A40 01               [ 1] 5104 	clr a 
      009A41 27 05 44         [ 2] 5105 	ldw farptr,x 
      009A44 0A 01 26         [ 1] 5106 	ld farptr+2,a 
      001CA6                       5107 4$:	; save new free address 
      009A47 FB A4            [ 2] 5108 	ldw (NEW_FREE,sp),x
      009A49 01 5F            [ 1] 5109 	ld (NEW_FREE+2,sp),a 
      009A4B 97 A6 84         [ 4] 5110 	call move_erase_to_ram
      009A4E 5B 01 81         [ 4] 5111 5$: call block_erase 
      009A51 AE 00 80         [ 2] 5112 	ldw x,#BLOCK_SIZE 
      009A51 52 02 CD         [ 4] 5113 	call incr_farptr 
      009A54 91 65 A1         [ 4] 5114 	call row_align 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5115 ; check if all blocks erased
      009A57 02 27 03         [ 1] 5116 	ld a,farptr+2  
      009A5A CC 88 FE         [ 1] 5117 	sub a,ffree+2
      009A5D 85 9F 6B         [ 1] 5118 	ld a,farptr+1 
      009A60 02 85 A3         [ 1] 5119 	sbc a,ffree+1 
      009A63 00 0F 23         [ 1] 5120 	ld a,farptr 
      009A66 05 A6 0A         [ 1] 5121 	sbc a,ffree 
      009A69 CC 89            [ 1] 5122 	jrmi 5$ 
      009A6B 00 CD            [ 1] 5123 	ld a,(NEW_FREE+2,sp)
      009A6D A0 4E            [ 2] 5124 	ldw x,(NEW_FREE,sp)
      009A6F 6B 01 A6         [ 1] 5125 	ld ffree+2,a 
      009A72 01 0D 01         [ 2] 5126 	ldw ffree,x 
      001CD7                       5127 	_drop VSIZE 
      009A75 27 05            [ 2]    1     addw sp,#VSIZE 
      009A77 48               [ 4] 5128 	ret 
                                   5129 
                                   5130 ;----------------------
                                   5131 ; BASIC: DIR 
                                   5132 ; list saved files 
                                   5133 ;----------------------
                           000001  5134 	COUNT=1 ; files counter 
                           000002  5135 	VSIZE=2 
      001CDA                       5136 directory:
      001CDA                       5137 	_vars VSIZE 
      009A78 0A 01            [ 2]    1     sub sp,#VSIZE 
      009A7A 26               [ 1] 5138 	clrw x 
      009A7B FB 0D            [ 2] 5139 	ldw (COUNT,sp),x 
      009A7D 02 26 05         [ 2] 5140 	ldw farptr+1,x 
      009A80 43 E4 00 20      [ 1] 5141 	mov farptr,#1 
      001CE6                       5142 dir_loop:
      009A84 02               [ 1] 5143 	clrw x 
      009A85 EA 00 E7 00      [ 5] 5144 	ldf a,([farptr],x)
      009A89 5B 02            [ 1] 5145 	jreq 8$ 
      001CED                       5146 1$: ;name loop 	
      009A8B 81 AF 00 16      [ 5] 5147 	ldf a,([farptr],x)
      009A8C 27 06            [ 1] 5148 	jreq 2$ 
      009A8C 72 00 00         [ 4] 5149 	call putc 
      009A8F 24               [ 2] 5150 	incw x 
      009A90 02 4F            [ 2] 5151 	jra 1$
      009A92 81               [ 2] 5152 2$: incw x ; skip ending 0. 
      009A93 A6 20            [ 1] 5153 	ld a,#SPACE 
      009A93 AE 9A BA         [ 4] 5154 	call putc 
                                   5155 ; get file size 	
      009A96 CD 83 33 5B      [ 5] 5156 	ldf a,([farptr],x)
      009A9A 02 52            [ 1] 5157 	ld yh,a 
      009A9C 04               [ 2] 5158 	incw x 
      009A9D CD 96 91 AE      [ 5] 5159 	ldf a,([farptr],x)
      009AA1 16               [ 2] 5160 	incw x 
      009AA2 90 CF            [ 1] 5161 	ld yl,a 
      009AA4 00 05            [ 2] 5162 	pushw y 
      009AA6 7F 72 5F         [ 2] 5163 	addw x,(1,sp)
                                   5164 ; skip to next file 
      009AA9 00 04 5F         [ 4] 5165 	call incr_farptr
      009AAC CF 00 01         [ 4] 5166 	call row_align
                                   5167 ; print file size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AAF 72               [ 2] 5168 	popw x ; file size 
      009AB0 11 00 24         [ 4] 5169 	call print_int 
      009AB3 72 18            [ 1] 5170 	ld a,#CR 
      009AB5 00 24 CC         [ 4] 5171 	call putc
      009AB8 89 A4            [ 2] 5172 	ldw x,(COUNT,sp)
      009ABA 0A               [ 2] 5173 	incw x
      009ABB 62 72            [ 2] 5174 	ldw (COUNT,sp),x  
      009ABD 65 61            [ 2] 5175 	jra dir_loop
      001D28                       5176 8$: ; print number of files 
      009ABF 6B 20            [ 2] 5177 	ldw x,(COUNT,sp)
      009AC1 70 6F 69         [ 4] 5178 	call print_int 
      009AC4 6E 74 2C         [ 2] 5179 	ldw x,#file_count 
      009AC7 20 52 55         [ 4] 5180 	call puts  
                                   5181 ; print drive free space 	
      009ACA 4E 20 74         [ 4] 5182 	call disk_free
      009ACD 6F               [ 1] 5183 	clrw x  
      009ACE 20 72 65 73      [ 1] 5184 	mov base,#10 
      009AD2 75 6D 65         [ 4] 5185 	call prti24 
      009AD5 2E 0A 00         [ 2] 5186 	ldw x,#drive_free
      009AD8 CD 02 B3         [ 4] 5187 	call puts 
      001D44                       5188 	_drop VSIZE 
      009AD8 72 01            [ 2]    1     addw sp,#VSIZE 
      009ADA 00               [ 4] 5189 	ret
      009ADB 24 01 81 6C 65 73 0A  5190 file_count: .asciz " files\n"
             00
      009ADE 20 62 79 74 65 73 20  5191 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5192 
                                   5193 ;---------------------
                                   5194 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5195 ; write 1 or more byte to FLASH or EEPROM
                                   5196 ; starting at address  
                                   5197 ; input:
                                   5198 ;   expr1  	is address 
                                   5199 ;   expr2,...,exprn   are bytes to write
                                   5200 ; output:
                                   5201 ;   none 
                                   5202 ;---------------------
                           000001  5203 	ADDR=1
                           000002  5204 	VSIZ=2 
      001D5C                       5205 write:
      001D5C                       5206 	_vars VSIZE 
      009ADE CD 87            [ 2]    1     sub sp,#VSIZE 
      009AE0 6A 81 00 16      [ 1] 5207 	clr farptr ; expect 16 bits address 
      009AE2 CD 11 DE         [ 4] 5208 	call expression
      009AE2 AE 16            [ 1] 5209 	cp a,#TK_INTGR 
      009AE4 E0 A6            [ 1] 5210 	jreq 0$
      009AE6 80 7F 5C         [ 2] 5211 	jp syntax_error
      009AE9 4A 26            [ 2] 5212 0$: ldw (ADDR,sp),x 
      009AEB FB 81 70         [ 4] 5213 	call next_token 
      009AED A1 09            [ 1] 5214 	cp a,#TK_COMMA 
      009AED A6 7F            [ 1] 5215 	jreq 1$ 
      009AEF C4 00            [ 2] 5216 	jra 9$ 
      009AF1 19 27 13         [ 4] 5217 1$:	call expression
      009AF4 CE 00            [ 1] 5218 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AF6 18 1C            [ 1] 5219 	jreq 2$
      009AF8 00 80 24         [ 2] 5220 	jp syntax_error
      009AFB 04               [ 1] 5221 2$:	ld a,xl 
      009AFC 72 5C            [ 2] 5222 	ldw x,(ADDR,sp) 
      009AFE 00 17 9F         [ 2] 5223 	ldw farptr+1,x 
      009B01 A4               [ 1] 5224 	clrw x 
      009B02 80 97 CF         [ 4] 5225 	call write_byte
      009B05 00 18            [ 2] 5226 	ldw x,(ADDR,sp)
      009B07 81               [ 2] 5227 	incw x 
      009B08 20 DC            [ 2] 5228 	jra 0$ 
      001D90                       5229 9$:
      001D90                       5230 	_drop VSIZE
      009B08 72 BB            [ 2]    1     addw sp,#VSIZE 
      009B0A 00               [ 4] 5231 	ret 
                                   5232 
                                   5233 
                                   5234 ;---------------------
                                   5235 ;BASIC: CHAR(expr)
                                   5236 ; évaluate expression 
                                   5237 ; and take the 7 least 
                                   5238 ; bits as ASCII character
                                   5239 ;---------------------
      001D93                       5240 char:
      009B0B 18 24 04         [ 4] 5241 	call func_args 
      009B0E 72 5C            [ 1] 5242 	cp a,#1
      009B10 00 17            [ 1] 5243 	jreq 1$
      009B12 CF 00 18         [ 2] 5244 	jp syntax_error
      009B15 81               [ 2] 5245 1$:	popw x 
      009B16 9F               [ 1] 5246 	ld a,xl 
      009B16 A6 01            [ 1] 5247 	and a,#0x7f 
      009B18 C7               [ 1] 5248 	ld xl,a
      009B19 00 17            [ 1] 5249 	ld a,#TK_CHAR
      009B1B 5F               [ 4] 5250 	ret
                                   5251 
                                   5252 ;---------------------
                                   5253 ; BASIC: ASC(string|char)
                                   5254 ; extract first character 
                                   5255 ; of string argument 
                                   5256 ; return it as TK_INTGR 
                                   5257 ;---------------------
      001DA5                       5258 ascii:
      009B1C CF 00            [ 1] 5259 	ld a,#TK_LPAREN
      009B1E 18 10 D3         [ 4] 5260 	call expect 
      009B1F CD 09 70         [ 4] 5261 	call next_token 
      009B1F AE 00            [ 1] 5262 	cp a,#TK_QSTR 
      009B21 03 92            [ 1] 5263 	jreq 1$
      009B23 AF 00            [ 1] 5264 	cp a,#TK_CHAR 
      009B25 17 26            [ 1] 5265 	jreq 2$ 
      009B27 05 5A 2A         [ 2] 5266 	jp syntax_error
      001DB8                       5267 1$: 
      009B2A F7               [ 1] 5268 	ld a,(x) 
      009B2B 20               [ 1] 5269 	clrw x
      009B2C 0E               [ 1] 5270 	ld xl,a 
      001DBB                       5271 2$: 
      009B2D AE               [ 2] 5272 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B2E 00 80            [ 1] 5273 	ld a,#TK_RPAREN 
      009B30 CD 9B 08         [ 4] 5274 	call expect
      009B33 AE               [ 2] 5275 	popw x 
      009B34 02 80            [ 1] 5276 	ld a,#TK_INTGR 
      009B36 C3               [ 4] 5277 	ret 
                                   5278 
                                   5279 ;---------------------
                                   5280 ;BASIC: KEY
                                   5281 ; wait for a character 
                                   5282 ; received from STDIN 
                                   5283 ; input:
                                   5284 ;	none 
                                   5285 ; output:
                                   5286 ;	X 		ASCII character 
                                   5287 ;---------------------
      001DC5                       5288 key:
      009B37 00 17 2B         [ 4] 5289 	call getc 
      009B3A E4               [ 1] 5290 	clrw x 
      009B3B 97               [ 1] 5291 	ld xl,a 
      009B3B CE 00            [ 1] 5292 	ld a,#TK_INTGR
      009B3D 17               [ 4] 5293 	ret
                                   5294 
                                   5295 ;----------------------
                                   5296 ; BASIC: QKEY
                                   5297 ; Return true if there 
                                   5298 ; is a character in 
                                   5299 ; waiting in STDIN 
                                   5300 ; input:
                                   5301 ;  none 
                                   5302 ; output:
                                   5303 ;   X 		0|-1 
                                   5304 ;-----------------------
      001DCD                       5305 qkey:: 
      009B3E C6               [ 1] 5306 	clrw x 
      009B3F 00 19 CF 00      [ 1] 5307 	tnz rx_char
      009B43 1A C7            [ 1] 5308 	jreq 9$ 
      009B45 00               [ 2] 5309 	cplw x 
      009B46 1C 81            [ 1] 5310 9$: ld a,#TK_INTGR
      009B48 81               [ 4] 5311 	ret 
                                   5312 
                                   5313 ;---------------------
                                   5314 ; BASIC: GPIO(expr,reg)
                                   5315 ; return gpio address 
                                   5316 ; expr {0..8}
                                   5317 ; input:
                                   5318 ;   none 
                                   5319 ; output:
                                   5320 ;   X 		gpio register address
                                   5321 ;----------------------------
                           000003  5322 	PORT=3
                           000001  5323 	REG=1 
                           000004  5324 	VSIZE=4 
      001DD8                       5325 gpio:
      009B48 AE 80 00         [ 4] 5326 	call func_args 
      009B4B 72 B0            [ 1] 5327 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B4D 00 1B            [ 1] 5328 	jreq 1$
      009B4F A6 02 C2         [ 2] 5329 	jp syntax_error  
      001DE2                       5330 1$:	
      009B52 00 1A            [ 2] 5331 	ldw x,(PORT,sp)
      009B54 C7 00            [ 1] 5332 	jrmi bad_port
      009B56 0C CF 00         [ 2] 5333 	cpw x,#9
      009B59 0D 81            [ 1] 5334 	jrpl bad_port
      009B5B A6 05            [ 1] 5335 	ld a,#5
      009B5B 5F               [ 4] 5336 	mul x,a
      009B5C 92 AF 00         [ 2] 5337 	addw x,#GPIO_BASE 
      009B5F 17 90            [ 2] 5338 	ldw (PORT,sp),x  
      009B61 F1 26            [ 2] 5339 	ldw x,(REG,sp) 
      009B63 08 4D 27         [ 2] 5340 	addw x,(PORT,sp)
      009B66 12 5C            [ 1] 5341 	ld a,#TK_INTGR
      001DFA                       5342 	_drop VSIZE 
      009B68 90 5C            [ 2]    1     addw sp,#VSIZE 
      009B6A 20               [ 4] 5343 	ret
      001DFD                       5344 bad_port:
      009B6B F0 0A            [ 1] 5345 	ld a,#ERR_BAD_VALUE
      009B6C CC 08 80         [ 2] 5346 	jp tb_error
                                   5347 
                                   5348 
                                   5349 ;-------------------------
                                   5350 ; BASIC: UFLASH 
                                   5351 ; return user flash address
                                   5352 ; input:
                                   5353 ;  none 
                                   5354 ; output:
                                   5355 ;	A		TK_INTGR
                                   5356 ;   X 		user address 
                                   5357 ;---------------------------
      001E02                       5358 uflash:
      009B6C 4D 27 07         [ 2] 5359 	ldw x,#user_space 
      009B6F 5C 92            [ 1] 5360 	ld a,#TK_INTGR 
      009B71 AF               [ 4] 5361 	ret 
                                   5362 
                                   5363 
                                   5364 ;---------------------
                                   5365 ; BASIC: USR(addr[,arg])
                                   5366 ; execute a function written 
                                   5367 ; in binary code.
                                   5368 ; binary fonction should 
                                   5369 ; return token attribute in A 
                                   5370 ; and value in X. 
                                   5371 ; input:
                                   5372 ;   addr	routine address 
                                   5373 ;   arg 	is an optional argument 
                                   5374 ; output:
                                   5375 ;   A 		token attribute 
                                   5376 ;   X       returned value 
                                   5377 ;---------------------
      001E08                       5378 usr:
      009B72 00 17            [ 2] 5379 	pushw y 	
      009B74 20 F6 5C         [ 4] 5380 	call func_args 
      009B77 98 81            [ 1] 5381 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B79 27 07            [ 1] 5382 	jreq 2$
      009B79 5C 99            [ 1] 5383 	cp a,#2
      009B7B 81 03            [ 1] 5384 	jreq 2$  
      009B7C CC 08 7E         [ 2] 5385 	jp syntax_error 
      009B7C 52 04            [ 2] 5386 2$: popw y  ; arg|addr 
      009B7E 17 03            [ 1] 5387 	cp a,#1
      009B80 5F CF            [ 1] 5388 	jreq 3$
      009B82 00               [ 2] 5389 	popw x ; addr
      009B83 18               [ 1] 5390 	exgw x,y 
      009B84 35 01            [ 4] 5391 3$: call (y)
      009B86 00 17            [ 2] 5392 	popw y 
      009B88 81               [ 4] 5393 	ret 
                                   5394 
                                   5395 ;------------------------------
                                   5396 ; BASIC: BYE 
                                   5397 ; halt mcu in its lowest power mode 
                                   5398 ; wait for reset or external interrupt
                                   5399 ; do a cold start on wakeup.
                                   5400 ;------------------------------
      001E25                       5401 bye:
      009B88 92 BC 00 17 27   [ 2] 5402 	btjf UART1_SR,#UART_SR_TC,.
      009B8D 27               [10] 5403 	halt
      009B8E 5F 16 03         [ 2] 5404 	jp cold_start  
                                   5405 
                                   5406 ;----------------------------------
                                   5407 ; BASIC: AUTORUN ["file_name"] 
                                   5408 ; record in eeprom at adrress AUTORUN_NAME
                                   5409 ; the name of file to load and execute
                                   5410 ; at startup. 
                                   5411 ; empty string delete autorun name 
                                   5412 ; no argument display autorun name  
                                   5413 ; input:
                                   5414 ;   file_name   file to execute 
                                   5415 ; output:
                                   5416 ;   none
                                   5417 ;-----------------------------------
      001E2E                       5418 autorun: 
      009B91 CD 9B 5B 25 2F   [ 2] 5419 	btjf flags,#FRUN,0$ 
      009B96 92 AF            [ 1] 5420 	jreq 0$ 
      009B98 00 17            [ 1] 5421 	ld a,#ERR_CMD_ONLY 
      009B9A 6B 01 5C         [ 2] 5422 	jp tb_error 
      001E3A                       5423 0$:	
      009B9D 92 AF 00         [ 4] 5424 	call next_token
      009BA0 17 6B            [ 1] 5425 	jrne 1$
      009BA2 02 5C 72         [ 2] 5426 	ldw x,#AUTORUN_NAME
      009BA5 FB 01 CD         [ 4] 5427 	call puts 
      009BA8 9B               [ 1] 5428 	clr a 
      009BA9 08               [ 4] 5429 	ret 
      001E47                       5430 1$:
      009BAA CD 9A            [ 1] 5431 	cp a,#TK_QSTR
      009BAC ED AE            [ 1] 5432 	jreq 2$
      009BAE 02 80 C3         [ 2] 5433 	jp syntax_error 
      001E4E                       5434 2$:	
      009BB1 00               [ 1] 5435 	tnz (x) 
      009BB2 17 2A            [ 1] 5436 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5437 ; empty string, delete autorun 	
      009BB4 D3 06 9D         [ 4] 5438 	call cancel_autorun
      009BB5 55 00 03 00 01   [ 1] 5439 	mov in,count 
      009BB5 72               [ 4] 5440 	ret 
      009BB6 5F               [ 2] 5441 3$:	pushw x 
      009BB7 00 17            [ 1] 5442 	ldw y,x  
      009BB9 72 5F 00         [ 4] 5443 	call search_file 
      009BBC 18 72            [ 1] 5444 	jrc 4$ 
      009BBE 5F 00            [ 1] 5445 	ld a,#ERR_NOT_FILE
      009BC0 19 5B 04         [ 2] 5446 	jp tb_error  
      001E67                       5447 4$: 
      009BC3 98 81 03 00 01   [ 1] 5448 	mov in,count 
      009BC5 72 5F 00 16      [ 1] 5449 	clr farptr 
      009BC5 5B 04 99         [ 2] 5450 	ldw x,#AUTORUN_NAME
      009BC8 81 00 17         [ 2] 5451 	ldw farptr+1,x 
      009BC9 1E 01            [ 2] 5452 	ldw x,(1,sp)  
      009BC9 72 01 00         [ 4] 5453 	call strlen  ; return length in X 
      009BCC 24               [ 2] 5454 	incw x 
      009BCD 05 A6            [ 2] 5455 	popw y 
      009BCF 07               [ 2] 5456 	pushw x 
      009BD0 CC               [ 1] 5457 	clrw x 
      009BD1 89 00 42         [ 4] 5458 	call write_block 
      009BD3                       5459 	_drop 2 
      009BD3 CE 00            [ 2]    1     addw sp,#2 
      009BD5 1F               [ 4] 5460 	ret 
                                   5461 
                                   5462 ;----------------------------------
                                   5463 ; BASIC: SLEEP 
                                   5464 ; halt mcu until reset or external
                                   5465 ; interrupt.
                                   5466 ; Resume progam after SLEEP command
                                   5467 ;----------------------------------
      001E86                       5468 sleep:
      009BD6 72 B0 00 1D 26   [ 2] 5469 	btjf UART1_SR,#UART_SR_TC,.
      009BDB 0C AE 88 99      [ 1] 5470 	bset flags,#FSLEEP
      009BDF CD               [10] 5471 	halt 
      009BE0 83               [ 4] 5472 	ret 
                                   5473 
                                   5474 ;-------------------------------
                                   5475 ; BASIC: PAUSE expr 
                                   5476 ; suspend execution for n msec.
                                   5477 ; input:
                                   5478 ;	none
                                   5479 ; output:
                                   5480 ;	none 
                                   5481 ;------------------------------
      001E91                       5482 pause:
      009BE1 33 55 00         [ 4] 5483 	call expression
      009BE4 04 00            [ 1] 5484 	cp a,#TK_INTGR
      009BE6 02 81            [ 1] 5485 	jreq pause02 
      009BE8 CC 08 7E         [ 2] 5486 	jp syntax_error
      001E9B                       5487 pause02: 
      009BE8 52               [ 2] 5488 1$: tnzw x 
      009BE9 08 1F            [ 1] 5489 	jreq 2$
      009BEB 01               [10] 5490 	wfi 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BEC CD               [ 2] 5491 	decw x 
      009BED 89 F0            [ 1] 5492 	jrne 1$
      009BEF A1               [ 1] 5493 2$:	clr a 
      009BF0 02               [ 4] 5494 	ret 
                                   5495 
                                   5496 ;------------------------------
                                   5497 ; BASIC: AWU expr
                                   5498 ; halt mcu for 'expr' milliseconds
                                   5499 ; use Auto wakeup peripheral
                                   5500 ; all oscillators stopped except LSI
                                   5501 ; range: 1ms - 511ms
                                   5502 ; input:
                                   5503 ;  none
                                   5504 ; output:
                                   5505 ;  none:
                                   5506 ;------------------------------
      001EA4                       5507 awu:
      009BF1 27 03 CC         [ 4] 5508   call expression
      009BF4 88 FE            [ 1] 5509   cp a,#TK_INTGR
      009BF6 27 03            [ 1] 5510   jreq awu02
      009BF6 1F 03 CD         [ 2] 5511   jp syntax_error
      001EAE                       5512 awu02:
      009BF9 81 DC CD         [ 2] 5513   cpw x,#5120
      009BFC 84 12            [ 1] 5514   jrmi 1$ 
      009BFE 1C 00 03 72      [ 1] 5515   mov AWU_TBR,#15 
      009C02 FB 01            [ 1] 5516   ld a,#30
      009C04 4F               [ 2] 5517   div x,a
      009C05 72 BB            [ 1] 5518   ld a,#16
      009C07 00               [ 2] 5519   div x,a 
      009C08 1B C9            [ 2] 5520   jra 4$
      001EBF                       5521 1$: 
      009C0A 00 1A A1         [ 2] 5522   cpw x,#2048
      009C0D 02 2B            [ 1] 5523   jrmi 2$ 
      009C0F 0A A3 80 00      [ 1] 5524   mov AWU_TBR,#14
      009C13 2B 05            [ 1] 5525   ld a,#80
      009C15 A6               [ 2] 5526   div x,a 
      009C16 0E CC            [ 2] 5527   jra 4$   
      001ECD                       5528 2$:
      009C18 89 00 50 F2      [ 1] 5529   mov AWU_TBR,#7
      009C1A                       5530 3$:  
                                   5531 ; while X > 64  divide by 2 and increment AWU_TBR 
      009C1A 16 03 CD         [ 2] 5532   cpw x,#64 
      009C1D 9B 7C            [ 2] 5533   jrule 4$ 
      009C1F 24 05 A6 08      [ 1] 5534   inc AWU_TBR 
      009C23 CC               [ 2] 5535   srlw x 
      009C24 89 00            [ 2] 5536   jra 3$ 
      009C26                       5537 4$:
      009C26 CE               [ 1] 5538   ld a, xl
      009C27 00               [ 1] 5539   dec a 
      009C28 1A C6            [ 1] 5540   jreq 5$
      009C2A 00               [ 1] 5541   dec a 	
      001EE2                       5542 5$: 
      009C2B 1C CF            [ 1] 5543   and a,#0x3e 
      009C2D 00 17 C7         [ 1] 5544   ld AWU_APR,a 
      009C30 00 19 16 03      [ 1] 5545   bset AWU_CSR,#AWU_CSR_AWUEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C34 AE               [10] 5546   halt 
                                   5547 
      009C35 16               [ 4] 5548   ret 
                                   5549 
                                   5550 ;------------------------------
                                   5551 ; BASIC: TICKS
                                   5552 ; return msec ticks counter value 
                                   5553 ; input:
                                   5554 ; 	none 
                                   5555 ; output:
                                   5556 ;	X 		TK_INTGR
                                   5557 ;-------------------------------
      001EED                       5558 get_ticks:
      009C36 E0 CD 84         [ 2] 5559 	ldw x,ticks 
      009C39 30 CD            [ 1] 5560 	ld a,#TK_INTGR
      009C3B 84               [ 4] 5561 	ret 
                                   5562 
                                   5563 
                                   5564 
                                   5565 ;------------------------------
                                   5566 ; BASIC: ABS(expr)
                                   5567 ; return absolute value of expr.
                                   5568 ; input:
                                   5569 ;   none
                                   5570 ; output:
                                   5571 ;   X     	positive integer
                                   5572 ;-------------------------------
      001EF3                       5573 abs:
      009C3C 12 5C 1C         [ 4] 5574 	call func_args 
      009C3F 16 E0            [ 1] 5575 	cp a,#1 
      009C41 16 01            [ 1] 5576 	jreq 0$ 
      009C43 FF 1C 00         [ 2] 5577 	jp syntax_error
      001EFD                       5578 0$:  
      009C46 02               [ 2] 5579     popw x   
      009C47 90               [ 1] 5580 	ld a,xh 
      009C48 CE 00            [ 1] 5581 	bcp a,#0x80 
      009C4A 1D 90            [ 1] 5582 	jreq 2$ 
      009C4C F6               [ 2] 5583 	negw x 
      009C4D 90 5C            [ 1] 5584 2$: ld a,#TK_INTGR 
      009C4F F7               [ 4] 5585 	ret 
                                   5586 
                                   5587 ;------------------------------
                                   5588 ; BASIC: AND(expr1,expr2)
                                   5589 ; Apply bit AND relation between
                                   5590 ; the 2 arguments, i.e expr1 & expr2 
                                   5591 ; output:
                                   5592 ; 	A 		TK_INTGR
                                   5593 ;   X 		result 
                                   5594 ;------------------------------
      001F07                       5595 bit_and:
      009C50 5C 90 C3         [ 4] 5596 	call func_args 
      009C53 00 1F            [ 1] 5597 	cp a,#2
      009C55 27 05            [ 1] 5598 	jreq 1$
      009C57 A3 17 60         [ 2] 5599 	jp syntax_error 
      009C5A 2B               [ 2] 5600 1$:	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C5B EF               [ 1] 5601 	ld a,xh 
      009C5C 14 01            [ 1] 5602 	and a,(1,sp)
      009C5C 17               [ 1] 5603 	ld xh,a 
      009C5D 07               [ 1] 5604 	ld a,xl
      009C5E 14 02            [ 1] 5605 	and a,(2,sp)
      009C5E A3               [ 1] 5606 	ld xl,a 
      001F1A                       5607 	_drop 2 
      009C5F 17 60            [ 2]    1     addw sp,#2 
      009C61 27 04            [ 1] 5608 	ld a,#TK_INTGR
      009C63 7F               [ 4] 5609 	ret
                                   5610 
                                   5611 ;------------------------------
                                   5612 ; BASIC: OR(expr1,expr2)
                                   5613 ; Apply bit OR relation between
                                   5614 ; the 2 arguments, i.e expr1 | expr2 
                                   5615 ; output:
                                   5616 ; 	A 		TK_INTGR
                                   5617 ;   X 		result 
                                   5618 ;------------------------------
      001F1F                       5619 bit_or:
      009C64 5C 20 F7         [ 4] 5620 	call func_args 
      009C67 A1 02            [ 1] 5621 	cp a,#2
      009C67 AE 16            [ 1] 5622 	jreq 1$
      009C69 E0 CD 81         [ 2] 5623 	jp syntax_error 
      001F29                       5624 1$: 
      009C6C F0               [ 2] 5625 	popw x 
      009C6D AE               [ 1] 5626 	ld a,xh 
      009C6E 00 80            [ 1] 5627 	or a,(1,sp)
      009C70 CD               [ 1] 5628 	ld xh,a 
      009C71 9B               [ 1] 5629 	ld a,xl 
      009C72 08 AE            [ 1] 5630 	or a,(2,sp)
      009C74 16               [ 1] 5631 	ld xl,a 
      001F32                       5632 	_drop 2 
      009C75 E0 16            [ 2]    1     addw sp,#2 
      009C77 07 90            [ 1] 5633 	ld a,#TK_INTGR 
      009C79 C3               [ 4] 5634 	ret
                                   5635 
                                   5636 ;------------------------------
                                   5637 ; BASIC: XOR(expr1,expr2)
                                   5638 ; Apply bit XOR relation between
                                   5639 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5640 ; output:
                                   5641 ; 	A 		TK_INTGR
                                   5642 ;   X 		result 
                                   5643 ;------------------------------
      001F37                       5644 bit_xor:
      009C7A 00 1F 2B         [ 4] 5645 	call func_args 
      009C7D CD CE            [ 1] 5646 	cp a,#2
      009C7F 00 17            [ 1] 5647 	jreq 1$
      009C81 C6 00 19         [ 2] 5648 	jp syntax_error 
      001F41                       5649 1$: 
      009C84 CF               [ 2] 5650 	popw x 
      009C85 00               [ 1] 5651 	ld a,xh 
      009C86 1A C7            [ 1] 5652 	xor a,(1,sp)
      009C88 00               [ 1] 5653 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C89 1C               [ 1] 5654 	ld a,xl 
      009C8A 1E 01            [ 1] 5655 	xor a,(2,sp)
      009C8C CD               [ 1] 5656 	ld xl,a 
      001F4A                       5657 	_drop 2 
      009C8D 8A 45            [ 2]    1     addw sp,#2 
      009C8F 5B 08            [ 1] 5658 	ld a,#TK_INTGR 
      009C91 81               [ 4] 5659 	ret 
                                   5660 
                                   5661 ;------------------------------
                                   5662 ; BASIC: LSHIFT(expr1,expr2)
                                   5663 ; logical shift left expr1 by 
                                   5664 ; expr2 bits 
                                   5665 ; output:
                                   5666 ; 	A 		TK_INTGR
                                   5667 ;   X 		result 
                                   5668 ;------------------------------
      009C92                       5669 lshift:
      009C92 CD 9B 08         [ 4] 5670 	call func_args
      009C95 CD 87            [ 1] 5671 	cp a,#2 
      009C97 6A 5F            [ 1] 5672 	jreq 1$
      009C99 92 AF 00         [ 2] 5673 	jp syntax_error
      009C9C 17 90            [ 2] 5674 1$: popw y   
      009C9E 95               [ 2] 5675 	popw x 
      009C9F 5C 92            [ 2] 5676 	tnzw y 
      009CA1 AF 00            [ 1] 5677 	jreq 4$
      009CA3 17               [ 2] 5678 2$:	sllw x 
      009CA4 5C 90            [ 2] 5679 	decw y 
      009CA6 97 72            [ 1] 5680 	jrne 2$
      001F65                       5681 4$:  
      009CA8 B9 00            [ 1] 5682 	ld a,#TK_INTGR
      009CAA 1D               [ 4] 5683 	ret
                                   5684 
                                   5685 ;------------------------------
                                   5686 ; BASIC: RSHIFT(expr1,expr2)
                                   5687 ; logical shift right expr1 by 
                                   5688 ; expr2 bits.
                                   5689 ; output:
                                   5690 ; 	A 		TK_INTGR
                                   5691 ;   X 		result 
                                   5692 ;------------------------------
      001F68                       5693 rshift:
      009CAB 90 CF 00         [ 4] 5694 	call func_args
      009CAE 1F 90            [ 1] 5695 	cp a,#2 
      009CB0 CE 00            [ 1] 5696 	jreq 1$
      009CB2 1D 08 7E         [ 2] 5697 	jp syntax_error
      009CB3 90 85            [ 2] 5698 1$: popw y  
      009CB3 92               [ 2] 5699 	popw x
      009CB4 AF 00            [ 2] 5700 	tnzw y 
      009CB6 17 90            [ 1] 5701 	jreq 4$
      009CB8 F7               [ 2] 5702 2$:	srlw x 
      009CB9 5C 90            [ 2] 5703 	decw y 
      009CBB 5C 90            [ 1] 5704 	jrne 2$
      001F7E                       5705 4$:  
      009CBD C3 00            [ 1] 5706 	ld a,#TK_INTGR
      009CBF 1F               [ 4] 5707 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5708 
                                   5709 ;--------------------------
                                   5710 ; BASIC: FCPU integer
                                   5711 ; set CPU frequency 
                                   5712 ;-------------------------- 
                                   5713 
      001F81                       5714 fcpu:
      009CC0 2B F1            [ 1] 5715 	ld a,#TK_INTGR
      009CC2 81 10 D3         [ 4] 5716 	call expect 
      009CC3 9F               [ 1] 5717 	ld a,xl 
      009CC3 72 01            [ 1] 5718 	and a,#7 
      009CC5 00 24 07         [ 1] 5719 	ld CLK_CKDIVR,a 
      009CC8 27               [ 4] 5720 	ret 
                                   5721 
                                   5722 ;------------------------------
                                   5723 ; BASIC: PMODE pin#, mode 
                                   5724 ; Arduino pin. 
                                   5725 ; define pin as input or output
                                   5726 ; pin#: {0..15}
                                   5727 ; mode: INPUT|OUTPUT  
                                   5728 ;------------------------------
                           000001  5729 	PINNO=1
                           000001  5730 	VSIZE=1
      001F8D                       5731 pin_mode:
      001F8D                       5732 	_vars VSIZE 
      009CC9 05 A6            [ 2]    1     sub sp,#VSIZE 
      009CCB 07 CC 89         [ 4] 5733 	call arg_list 
      009CCE 00 02            [ 1] 5734 	cp a,#2 
      009CCF 27 03            [ 1] 5735 	jreq 1$
      009CCF CD 89 F0         [ 2] 5736 	jp syntax_error 
      009CD2 A1 02            [ 2] 5737 1$: popw y ; mode 
      009CD4 27               [ 2] 5738 	popw x ; Dx pin 
      009CD5 03 CC 88         [ 4] 5739 	call select_pin 
      009CD8 FE 90            [ 1] 5740 	ld (PINNO,sp),a  
      009CDA 93 CD            [ 1] 5741 	ld a,#1 
      009CDC 9B 7C            [ 1] 5742 	tnz (PINNO,sp)
      009CDE 25 05            [ 1] 5743 	jreq 4$
      009CE0 A6               [ 1] 5744 2$:	sll a 
      009CE1 09 CC            [ 1] 5745 	dec (PINNO,sp)
      009CE3 89 00            [ 1] 5746 	jrne 2$ 
      009CE5 6B 01            [ 1] 5747 	ld (PINNO,sp),a
      009CE5 CD 9C            [ 1] 5748 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009CE7 92 CE            [ 1] 5749 	ld (GPIO_CR1,x),a 
      009CE9 00 1F 72 B0      [ 2] 5750 4$:	cpw y,#OUTP 
      009CED 00 1D            [ 1] 5751 	jreq 6$
                                   5752 ; input mode
      009CEF CD 8A            [ 1] 5753 	ld a,(PINNO,sp)
      009CF1 45               [ 1] 5754 	cpl a 
      009CF2 81 02            [ 1] 5755 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009CF3 20 0A            [ 2] 5756 	jra 9$
      001FBF                       5757 6$: ;output mode  
      009CF3 52 03            [ 1] 5758 	ld a,(PINNO,sp)
      009CF5 CD 89            [ 1] 5759 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009CF7 F0 A1            [ 1] 5760 	ld (GPIO_CR2,x),a 
      009CF9 00 27            [ 1] 5761 	ld a,(PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009CFB 20 A1            [ 1] 5762 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009CFD 02 27            [ 1] 5763 9$:	ld (GPIO_DDR,x),a 
      001FCB                       5764 	_drop VSIZE 
      009CFF 03 CC            [ 2]    1     addw sp,#VSIZE 
      009D01 88               [ 4] 5765 	ret
                                   5766 
                                   5767 ;------------------------
                                   5768 ; select Arduino pin 
                                   5769 ; input:
                                   5770 ;   X 	 {0..15} Arduino Dx 
                                   5771 ; output:
                                   5772 ;   A     stm8s208 pin 
                                   5773 ;   X     base address s208 GPIO port 
                                   5774 ;---------------------------
      001FCE                       5775 select_pin:
      009D02 FE               [ 2] 5776 	sllw x 
      009D03 90 93 55         [ 2] 5777 	addw x,#arduino_to_8s208 
      009D06 00               [ 2] 5778 	ldw x,(x)
      009D07 04               [ 1] 5779 	ld a,xl 
      009D08 00               [ 1] 5780 	push a 
      009D09 02               [ 1] 5781 	swapw x 
      009D0A CD 9B            [ 1] 5782 	ld a,#5 
      009D0C 7C               [ 4] 5783 	mul x,a 
      009D0D 25 05 A6         [ 2] 5784 	addw x,#GPIO_BASE 
      009D10 09               [ 1] 5785 	pop a 
      009D11 CC               [ 4] 5786 	ret 
                                   5787 ; translation from Arduino D0..D15 to stm8s208rb 
      001FDE                       5788 arduino_to_8s208:
      009D12 89 00                 5789 .byte 3,6 ; D0 
      009D14 03 05                 5790 .byte 3,5 ; D1 
      009D14 CE 00                 5791 .byte 4,0 ; D2 
      009D16 17 C6                 5792 .byte 2,1 ; D3
      009D18 00 19                 5793 .byte 6,0 ; D4
      009D1A 20 0A                 5794 .byte 2,2 ; D5
      009D1C 02 03                 5795 .byte 2,3 ; D6
      009D1C AE 01                 5796 .byte 3,1 ; D7
      009D1E 00 4F                 5797 .byte 3,3 ; D8
      009D20 CF 00                 5798 .byte 2,4 ; D9
      009D22 17 C7                 5799 .byte 4,5 ; D10
      009D24 00 19                 5800 .byte 2,6 ; D11
      009D26 02 07                 5801 .byte 2,7 ; D12
      009D26 1F 01                 5802 .byte 2,5 ; D13
      009D28 6B 03                 5803 .byte 4,2 ; D14
      009D2A CD 81                 5804 .byte 4,1 ; D15
                                   5805 
                                   5806 
                                   5807 ;------------------------------
                                   5808 ; BASIC: RND(expr)
                                   5809 ; return random number 
                                   5810 ; between 1 and expr inclusive
                                   5811 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5812 ; input:
                                   5813 ; 	none 
                                   5814 ; output:
                                   5815 ;	X 		random positive integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5816 ;------------------------------
      001FFE                       5817 random:
      009D2C A8 CD 82         [ 4] 5818 	call func_args 
      009D2F 23 AE            [ 1] 5819 	cp a,#1
      009D31 00 80            [ 1] 5820 	jreq 1$
      009D33 CD 9B 08         [ 2] 5821 	jp syntax_error
      002008                       5822 1$:  
      009D36 CD 9A            [ 1] 5823 	ld a,#0x80 
      009D38 ED C6            [ 1] 5824 	bcp a,(1,sp)
      009D3A 00 19            [ 1] 5825 	jreq 2$
      009D3C C0 00            [ 1] 5826 	ld a,#ERR_BAD_VALUE
      009D3E 1C C6 00         [ 2] 5827 	jp tb_error
      002013                       5828 2$: 
                                   5829 ; acc16=(x<<5)^x 
      009D41 18 C2 00         [ 2] 5830 	ldw x,seedx 
      009D44 1B               [ 2] 5831 	sllw x 
      009D45 C6               [ 2] 5832 	sllw x 
      009D46 00               [ 2] 5833 	sllw x 
      009D47 17               [ 2] 5834 	sllw x 
      009D48 C2               [ 2] 5835 	sllw x 
      009D49 00               [ 1] 5836 	ld a,xh 
      009D4A 1A 2B E0         [ 1] 5837 	xor a,seedx 
      009D4D 7B 03 1E         [ 1] 5838 	ld acc16,a 
      009D50 01               [ 1] 5839 	ld a,xl 
      009D51 C7 00 1C         [ 1] 5840 	xor a,seedx+1 
      009D54 CF 00 1A         [ 1] 5841 	ld acc8,a 
                                   5842 ; seedx=seedy 
      009D57 5B 03 81         [ 2] 5843 	ldw x,seedy 
      009D5A CF 00 12         [ 2] 5844 	ldw seedx,x  
                                   5845 ; seedy=seedy^(seedy>>1)
      009D5A 52 02            [ 2] 5846 	srlw y 
      009D5C 5F 1F            [ 1] 5847 	ld a,yh 
      009D5E 01 CF 00         [ 1] 5848 	xor a,seedy 
      009D61 18 35 01         [ 1] 5849 	ld seedy,a  
      009D64 00 17            [ 1] 5850 	ld a,yl 
      009D66 C8 00 15         [ 1] 5851 	xor a,seedy+1 
      009D66 5F 92 AF         [ 1] 5852 	ld seedy+1,a 
                                   5853 ; acc16>>3 
      009D69 00 17 27         [ 2] 5854 	ldw x,acc16 
      009D6C 3B               [ 2] 5855 	srlw x 
      009D6D 54               [ 2] 5856 	srlw x 
      009D6D 92               [ 2] 5857 	srlw x 
                                   5858 ; x=acc16^x 
      009D6E AF               [ 1] 5859 	ld a,xh 
      009D6F 00 17 27         [ 1] 5860 	xor a,acc16 
      009D72 06               [ 1] 5861 	ld xh,a 
      009D73 CD               [ 1] 5862 	ld a,xl 
      009D74 83 20 5C         [ 1] 5863 	xor a,acc8 
      009D77 20               [ 1] 5864 	ld xl,a 
                                   5865 ; seedy=x^seedy 
      009D78 F4 5C A6         [ 1] 5866 	xor a,seedy+1
      009D7B 20               [ 1] 5867 	ld xl,a 
      009D7C CD               [ 1] 5868 	ld a,xh 
      009D7D 83 20 92         [ 1] 5869 	xor a,seedy
      009D80 AF               [ 1] 5870 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D81 00 17 90         [ 2] 5871 	ldw seedy,x 
                                   5872 ; return seedy modulo expr + 1 
      009D84 95 5C            [ 2] 5873 	popw y 
      009D86 92               [ 2] 5874 	divw x,y 
      009D87 AF               [ 1] 5875 	ldw x,y 
      009D88 00               [ 2] 5876 	incw x 
      002062                       5877 10$:
      009D89 17 5C            [ 1] 5878 	ld a,#TK_INTGR
      009D8B 90               [ 4] 5879 	ret 
                                   5880 
                                   5881 ;---------------------------------
                                   5882 ; BASIC: WORDS 
                                   5883 ; affiche la listes des mots du
                                   5884 ; dictionnaire ainsi que le nombre
                                   5885 ; de mots.
                                   5886 ;---------------------------------
                           000001  5887 	WLEN=1 ; word length
                           000002  5888 	LLEN=2 ; character sent to console
                           000003  5889 	WCNT=3 ; count words printed 
                           000003  5890 	VSIZE=3 
      002065                       5891 words:
      002065                       5892 	_vars VSIZE
      009D8C 97 90            [ 2]    1     sub sp,#VSIZE 
      009D8E 89 72            [ 1] 5893 	clr (LLEN,sp)
      009D90 FB 01            [ 1] 5894 	clr (WCNT,sp)
      009D92 CD 9B 08 CD      [ 2] 5895 	ldw y,#kword_dict+2
      009D96 9A               [ 1] 5896 0$:	ldw x,y
      009D97 ED               [ 1] 5897 	ld a,(x)
      009D98 85 CD            [ 1] 5898 	and a,#15 
      009D9A 8A 45            [ 1] 5899 	ld (WLEN,sp),a 
      009D9C A6 0D            [ 1] 5900 	inc (WCNT,sp)
      009D9E CD               [ 2] 5901 1$:	incw x 
      009D9F 83               [ 1] 5902 	ld a,(x)
      009DA0 20 1E 01         [ 4] 5903 	call putc 
      009DA3 5C 1F            [ 1] 5904 	inc (LLEN,sp)
      009DA5 01 20            [ 1] 5905 	dec (WLEN,sp)
      009DA7 BE F5            [ 1] 5906 	jrne 1$
      009DA8 A6 46            [ 1] 5907 	ld a,#70
      009DA8 1E 01            [ 1] 5908 	cp a,(LLEN,sp)
      009DAA CD 8A            [ 1] 5909 	jrmi 2$   
      009DAC 45 AE            [ 1] 5910 	ld a,#SPACE 
      009DAE 9D C7 CD         [ 4] 5911 	call putc 
      009DB1 83 33            [ 1] 5912 	inc (LLEN,sp) 
      009DB3 CD 9B            [ 2] 5913 	jra 3$
      009DB5 48 5F            [ 1] 5914 2$: ld a,#CR 
      009DB7 35 0A 00         [ 4] 5915 	call putc 
      009DBA 0B CD            [ 1] 5916 	clr (LLEN,sp)
      009DBC 8A 55 AE 9D      [ 2] 5917 3$:	subw y,#2 
      009DC0 CF CD            [ 2] 5918 	ldw y,(y)
      009DC2 83 33            [ 1] 5919 	jrne 0$ 
      009DC4 5B 02            [ 1] 5920 	ld a,#CR 
      009DC6 81 20 66         [ 4] 5921 	call putc  
      009DC9 69               [ 1] 5922 	clrw x 
      009DCA 6C 65            [ 1] 5923 	ld a,(WCNT,sp)
      009DCC 73               [ 1] 5924 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009DCD 0A 00 20         [ 4] 5925 	call print_int 
      009DD0 62 79 74         [ 2] 5926 	ldw x,#words_count_msg
      009DD3 65 73 20         [ 4] 5927 	call puts 
      0020B2                       5928 	_drop VSIZE 
      009DD6 66 72            [ 2]    1     addw sp,#VSIZE 
      009DD8 65               [ 4] 5929 	ret 
      009DD9 65 0A 00 72 64 73 20  5930 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5931 
                                   5932 
                                   5933 ;-----------------------------
                                   5934 ; BASIC: TIMER expr 
                                   5935 ; initialize count down timer 
                                   5936 ;-----------------------------
      009DDC                       5937 set_timer:
      009DDC 52 02 72         [ 4] 5938 	call arg_list
      009DDF 5F 00            [ 1] 5939 	cp a,#1 
      009DE1 17 CD            [ 1] 5940 	jreq 1$
      009DE3 92 5E A1         [ 2] 5941 	jp syntax_error
      0020D5                       5942 1$: 
      009DE6 84               [ 2] 5943 	popw x 
      009DE7 27 03 CC         [ 2] 5944 	ldw timer,x 
      009DEA 88               [ 4] 5945 	ret 
                                   5946 
                                   5947 ;------------------------------
                                   5948 ; BASIC: TIMEOUT 
                                   5949 ; return state of timer 
                                   5950 ;------------------------------
      0020DA                       5951 timeout:
      009DEB FE 1F 01         [ 2] 5952 	ldw x,timer 
      0020DD                       5953 logical_complement:
      009DEE CD               [ 2] 5954 	cplw x 
      009DEF 89 F0 A1         [ 2] 5955 	cpw x,#-1
      009DF2 09 27            [ 1] 5956 	jreq 2$
      009DF4 02               [ 1] 5957 	clrw x 
      009DF5 20 19            [ 1] 5958 2$:	ld a,#TK_INTGR
      009DF7 CD               [ 4] 5959 	ret 
                                   5960 
                                   5961 ;--------------------------------
                                   5962 ; BASIC NOT(expr) 
                                   5963 ; return logical complement of expr
                                   5964 ;--------------------------------
      0020E7                       5965 func_not:
      009DF8 92 5E A1         [ 4] 5966 	call func_args  
      009DFB 84 27            [ 1] 5967 	cp a,#1
      009DFD 03 CC            [ 1] 5968 	jreq 1$
      009DFF 88 FE 9F         [ 2] 5969 	jp syntax_error
      009E02 1E               [ 2] 5970 1$:	popw x 
      009E03 01 CF            [ 2] 5971 	jra logical_complement
                                   5972 
                                   5973 
                                   5974 
                                   5975 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5976 ; BASIC: IWDGEN expr1 
                                   5977 ; enable independant watchdog timer
                                   5978 ; expr1 is delay in multiple of 62.5µsec
                                   5979 ; expr1 -> {1..16383}
                                   5980 ;-----------------------------------
      0020F4                       5981 enable_iwdg:
      009E05 00 18 5F         [ 4] 5982 	call arg_list
      009E08 CD 82            [ 1] 5983 	cp a,#1 
      009E0A 4D 1E            [ 1] 5984 	jreq 1$
      009E0C 01 5C 20         [ 2] 5985 	jp syntax_error 
      009E0F DC               [ 2] 5986 1$: popw x 
      009E10 4B 00            [ 1] 5987 	push #0
      009E10 5B 02 81 E0      [ 1] 5988 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009E13 9E               [ 1] 5989 	ld a,xh 
      009E13 CD 91            [ 1] 5990 	and a,#0x3f
      009E15 60               [ 1] 5991 	ld xh,a  
      009E16 A1 01 27         [ 2] 5992 2$:	cpw x,#255
      009E19 03 CC            [ 2] 5993 	jrule 3$
      009E1B 88 FE            [ 1] 5994 	inc (1,sp)
      009E1D 85               [ 1] 5995 	rcf 
      009E1E 9F               [ 2] 5996 	rrcw x 
      009E1F A4 7F            [ 2] 5997 	jra 2$
      009E21 97 A6 03 81      [ 1] 5998 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E25 84               [ 1] 5999 	pop a  
      009E25 A6 07 CD         [ 1] 6000 	ld IWDG_PR,a 
      009E28 91               [ 1] 6001 	ld a,xl
      009E29 53               [ 1] 6002 	dec a 
      009E2A CD 89 F0 A1      [ 1] 6003 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009E2E 02 27 07         [ 1] 6004 	ld IWDG_RLR,a 
      009E31 A1 03 27 06      [ 1] 6005 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009E35 CC               [ 4] 6006 	ret 
                                   6007 
                                   6008 
                                   6009 ;-----------------------------------
                                   6010 ; BASIC: IWDGREF  
                                   6011 ; refresh independant watchdog count down 
                                   6012 ; timer before it reset MCU. 
                                   6013 ;-----------------------------------
      00212A                       6014 refresh_iwdg:
      009E36 88 FE 50 E0      [ 1] 6015 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009E38 81               [ 4] 6016 	ret 
                                   6017 
                                   6018 
                                   6019 ;-------------------------------------
                                   6020 ; BASIC: LOG(expr)
                                   6021 ; return logarithm base 2 of expr 
                                   6022 ; this is the position of most significant
                                   6023 ; bit set. 
                                   6024 ; input: 
                                   6025 ; output:
                                   6026 ;   X     log2 
                                   6027 ;   A     TK_INTGR 
                                   6028 ;*********************************
      00212F                       6029 log2:
      009E38 F6 5F 97         [ 4] 6030 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E3B A1 01            [ 1] 6031 	cp a,#1 
      009E3B 89 A6            [ 1] 6032 	jreq 1$
      009E3D 08 CD 91         [ 2] 6033 	jp syntax_error 
      009E40 53               [ 2] 6034 1$: popw x 
      00213A                       6035 leading_one:
      009E41 85               [ 2] 6036 	tnzw x 
      009E42 A6 84            [ 1] 6037 	jreq 4$
      009E44 81 0F            [ 1] 6038 	ld a,#15 
      009E45 59               [ 2] 6039 2$: rlcw x 
      009E45 CD 83            [ 1] 6040     jrc 3$
      009E47 29               [ 1] 6041 	dec a 
      009E48 5F 97            [ 2] 6042 	jra 2$
      009E4A A6               [ 1] 6043 3$: clrw x 
      009E4B 84               [ 1] 6044     ld xl,a
      009E4C 81 84            [ 1] 6045 4$:	ld a,#TK_INTGR
      009E4D 81               [ 4] 6046 	ret 
                                   6047 
                                   6048 ;-----------------------------------
                                   6049 ; BASIC: BIT(expr) 
                                   6050 ; expr ->{0..15}
                                   6051 ; return 2^expr 
                                   6052 ; output:
                                   6053 ;    x    2^expr 
                                   6054 ;-----------------------------------
      00214A                       6055 bitmask:
      009E4D 5F 72 5D         [ 4] 6056     call func_args 
      009E50 00 26            [ 1] 6057 	cp a,#1
      009E52 27 01            [ 1] 6058 	jreq 1$
      009E54 53 A6 84         [ 2] 6059 	jp syntax_error 
      009E57 81               [ 2] 6060 1$: popw x 
      009E58 9F               [ 1] 6061 	ld a,xl 
      009E58 CD 91            [ 1] 6062 	and a,#15
      009E5A 60               [ 1] 6063 	clrw x 
      009E5B A1               [ 2] 6064 	incw x 
      009E5C 02               [ 1] 6065 2$: tnz a 
      009E5D 27 03            [ 1] 6066 	jreq 3$
      009E5F CC               [ 2] 6067 	slaw x 
      009E60 88               [ 1] 6068 	dec a 
      009E61 FE F9            [ 2] 6069 	jra 2$ 
      009E62 A6 84            [ 1] 6070 3$: ld a,#TK_INTGR
      009E62 1E               [ 4] 6071 	ret 
                                   6072 
                                   6073 ;------------------------------
                                   6074 ; BASIC: INVERT(expr)
                                   6075 ; 1's complement 
                                   6076 ;--------------------------------
      002164                       6077 invert:
      009E63 03 2B 17         [ 4] 6078 	call func_args
      009E66 A3 00            [ 1] 6079 	cp a,#1 
      009E68 09 2A            [ 1] 6080 	jreq 1$
      009E6A 12 A6 05         [ 2] 6081 	jp syntax_error
      009E6D 42               [ 2] 6082 1$: popw x  
      009E6E 1C               [ 2] 6083 	cplw x 
      009E6F 50 00            [ 1] 6084 	ld a,#TK_INTGR 
      009E71 1F               [ 4] 6085 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6086 
                                   6087 ;------------------------------
                                   6088 ; BASIC: DO 
                                   6089 ; initiate a DO ... UNTIL loop 
                                   6090 ;------------------------------
                           000003  6091 	DOLP_ADR=3 
                           000005  6092 	DOLP_INW=5
                           000004  6093 	VSIZE=4 
      002173                       6094 do_loop:
      009E72 03               [ 2] 6095 	popw x 
      002174                       6096 	_vars VSIZE 
      009E73 1E 01            [ 2]    1     sub sp,#VSIZE 
      009E75 72               [ 2] 6097 	pushw x 
      009E76 FB 03 A6 84      [ 2] 6098 	ldw y,basicptr 
      009E7A 5B 04            [ 2] 6099 	ldw (DOLP_ADR,sp),y
      009E7C 81 CE 00 00      [ 2] 6100 	ldw y,in.w 
      009E7D 17 05            [ 2] 6101 	ldw (DOLP_INW,sp),y
      009E7D A6 0A CC 89      [ 1] 6102 	inc loop_depth 
      009E81 00               [ 4] 6103 	ret 
                                   6104 
                                   6105 ;--------------------------------
                                   6106 ; BASIC: UNTIL expr 
                                   6107 ; loop if exprssion is false 
                                   6108 ; else terminate loop
                                   6109 ;--------------------------------
      009E82                       6110 until: 
      009E82 AE A8 00 A6      [ 1] 6111 	tnz loop_depth 
      009E86 84 81            [ 1] 6112 	jrne 1$ 
      009E88 CC 08 7E         [ 2] 6113 	jp syntax_error 
      002191                       6114 1$: 
      009E88 90 89 CD         [ 4] 6115 	call relation 
      009E8B 91 60            [ 1] 6116 	cp a,#TK_INTGR
      009E8D A1 01            [ 1] 6117 	jreq 2$
      009E8F 27 07 A1         [ 2] 6118 	jp syntax_error
      00219B                       6119 2$: 
      009E92 02               [ 2] 6120 	tnzw x 
      009E93 27 03            [ 1] 6121 	jrne 9$
      009E95 CC 88            [ 2] 6122 	ldw x,(DOLP_ADR,sp)
      009E97 FE 90 85         [ 2] 6123 	ldw basicptr,x 
      009E9A A1 01            [ 1] 6124 	ld a,(2,x)
      009E9C 27 02 85         [ 1] 6125 	ld count,a 
      009E9F 51 90            [ 2] 6126 	ldw x,(DOLP_INW,sp)
      009EA1 FD 90 85         [ 2] 6127 	ldw in.w,x 
      009EA4 81               [ 4] 6128 	ret 
      009EA5                       6129 9$:	; remove loop data from stack  
      009EA5 72               [ 2] 6130 	popw x
      0021AF                       6131 	_drop VSIZE
      009EA6 0D 52            [ 2]    1     addw sp,#VSIZE 
      009EA8 30 FB 8E CC      [ 1] 6132 	dec loop_depth 
      009EAC 86               [ 2] 6133 	jp (x)
                                   6134 
                                   6135 ;--------------------------
                                   6136 ; BASIC: PRTA...PRTI  
                                   6137 ;  return constant value 
                                   6138 ;  PORT  offset in GPIO
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   6139 ;  array
                                   6140 ;---------------------------
      0021B6                       6141 const_porta:
      009EAD 54 00 00         [ 2] 6142 	ldw x,#0
      009EAE A6 84            [ 1] 6143 	ld a,#TK_INTGR 
      009EAE 72               [ 4] 6144 	ret 
      0021BC                       6145 const_portb:
      009EAF 01 00 24         [ 2] 6146 	ldw x,#1
      009EB2 07 27            [ 1] 6147 	ld a,#TK_INTGR 
      009EB4 05               [ 4] 6148 	ret 
      0021C2                       6149 const_portc:
      009EB5 A6 07 CC         [ 2] 6150 	ldw x,#2
      009EB8 89 00            [ 1] 6151 	ld a,#TK_INTGR 
      009EBA 81               [ 4] 6152 	ret 
      0021C8                       6153 const_portd:
      009EBA CD 89 F0         [ 2] 6154 	ldw x,#3
      009EBD 26 08            [ 1] 6155 	ld a,#TK_INTGR 
      009EBF AE               [ 4] 6156 	ret 
      0021CE                       6157 const_porte:
      009EC0 40 00 CD         [ 2] 6158 	ldw x,#4
      009EC3 83 33            [ 1] 6159 	ld a,#TK_INTGR 
      009EC5 4F               [ 4] 6160 	ret 
      0021D4                       6161 const_portf:
      009EC6 81 00 05         [ 2] 6162 	ldw x,#5
      009EC7 A6 84            [ 1] 6163 	ld a,#TK_INTGR 
      009EC7 A1               [ 4] 6164 	ret 
      0021DA                       6165 const_portg:
      009EC8 02 27 03         [ 2] 6166 	ldw x,#6
      009ECB CC 88            [ 1] 6167 	ld a,#TK_INTGR 
      009ECD FE               [ 4] 6168 	ret 
      009ECE                       6169 const_porth:
      009ECE 7D 26 09         [ 2] 6170 	ldw x,#7
      009ED1 CD 87            [ 1] 6171 	ld a,#TK_INTGR 
      009ED3 1D               [ 4] 6172 	ret 
      0021E6                       6173 const_porti:
      009ED4 55 00 04         [ 2] 6174 	ldw x,#8
      009ED7 00 02            [ 1] 6175 	ld a,#TK_INTGR 
      009ED9 81               [ 4] 6176 	ret 
                                   6177 
                                   6178 ;-------------------------------
                                   6179 ; following return constant 
                                   6180 ; related to GPIO register offset 
                                   6181 ;---------------------------------
      0021EC                       6182 const_odr:
      009EDA 89 90            [ 1] 6183 	ld a,#TK_INTGR 
      009EDC 93 CD 9B         [ 2] 6184 	ldw x,#GPIO_ODR
      009EDF 7C               [ 4] 6185 	ret 
      0021F2                       6186 const_idr:
      009EE0 25 05            [ 1] 6187 	ld a,#TK_INTGR 
      009EE2 A6 09 CC         [ 2] 6188 	ldw x,#GPIO_IDR
      009EE5 89               [ 4] 6189 	ret 
      0021F8                       6190 const_ddr:
      009EE6 00 84            [ 1] 6191 	ld a,#TK_INTGR 
      009EE7 AE 00 02         [ 2] 6192 	ldw x,#GPIO_DDR
      009EE7 55               [ 4] 6193 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0021FE                       6194 const_cr1:
      009EE8 00 04            [ 1] 6195 	ld a,#TK_INTGR 
      009EEA 00 02 72         [ 2] 6196 	ldw x,#GPIO_CR1
      009EED 5F               [ 4] 6197 	ret 
      002204                       6198 const_cr2:
      009EEE 00 17            [ 1] 6199 	ld a,#TK_INTGR 
      009EF0 AE 40 00         [ 2] 6200 	ldw x,#GPIO_CR2
      009EF3 CF               [ 4] 6201 	ret 
                                   6202 ;-------------------------
                                   6203 ;  constant for port mode
                                   6204 ;  used by PMODE 
                                   6205 ;  input or output
                                   6206 ;------------------------
      00220A                       6207 const_output:
      009EF4 00 18            [ 1] 6208 	ld a,#TK_INTGR 
      009EF6 1E 01 CD         [ 2] 6209 	ldw x,#OUTP
      009EF9 84               [ 4] 6210 	ret 
      002210                       6211 const_input:
      009EFA 12 5C            [ 1] 6212 	ld a,#TK_INTGR 
      009EFC 90 85 89         [ 2] 6213 	ldw x,#INP 
      009EFF 5F               [ 4] 6214 	ret 
                                   6215 ;-----------------------
                                   6216 ; memory area constants
                                   6217 ;-----------------------
      002216                       6218 const_eeprom_base:
      009F00 CD 82            [ 1] 6219 	ld a,#TK_INTGR 
      009F02 C2 5B 02         [ 2] 6220 	ldw x,#EEPROM_BASE 
      009F05 81               [ 4] 6221 	ret 
                                   6222 
                                   6223 ;---------------------------
                                   6224 ; BASIC: DATA 
                                   6225 ; when the interpreter find 
                                   6226 ; a DATA line it skip it.
                                   6227 ;---------------------------
      009F06                       6228 data:
      009F06 72 0D 52 30 FB   [ 1] 6229 	mov in,count 
      009F0B 72               [ 4] 6230 	ret 
                                   6231 
                                   6232 ;---------------------------
                                   6233 ; BASIC: DATLN  *expr*
                                   6234 ; set DATA pointer at line# 
                                   6235 ; specified by *expr* 
                                   6236 ;---------------------------
      002222                       6237 data_line:
      009F0C 16 00 24         [ 4] 6238 	call expression
      009F0F 8E 81            [ 1] 6239 	cp a,#TK_INTGR
      009F11 27 03            [ 1] 6240 	jreq 1$
      009F11 CD 92 5E         [ 2] 6241 	jp syntax_error 
      009F14 A1 84 27         [ 4] 6242 1$: call search_lineno
      009F17 03               [ 2] 6243 	tnzw x 
      009F18 CC 88            [ 1] 6244 	jrne 3$
      009F1A FE 05            [ 1] 6245 2$:	ld a,#ERR_NO_LINE 
      009F1B CC 08 80         [ 2] 6246 	jp tb_error
      002237                       6247 3$: ; check if valid data line 
      009F1B 5D 27            [ 1] 6248     ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F1D 04 8F            [ 2] 6249 	ldw x,(4,x)
      009F1F 5A 26 F9         [ 2] 6250 	cpw x,#data 
      009F22 4F 81            [ 1] 6251 	jrne 2$ 
      009F24 90 CF 00 06      [ 2] 6252 	ldw data_ptr,y
      009F24 CD 92 5E         [ 1] 6253 	ld a,(2,y)
      009F27 A1 84 27         [ 1] 6254 	ld data_len,a 
      009F2A 03 CC 88 FE      [ 1] 6255 	mov data_ofs,#FIRST_DATA_ITEM 
      009F2E 81               [ 4] 6256 	ret
                                   6257 
                                   6258 ;---------------------------------
                                   6259 ; BASIC: RESTORE 
                                   6260 ; set data_ptr to first data line
                                   6261 ; if not DATA found pointer set to
                                   6262 ; zero 
                                   6263 ;---------------------------------
      00224F                       6264 restore:
      009F2E A3 14 00 2B      [ 1] 6265 	clr data_ptr 
      009F32 0C 35 0F 50      [ 1] 6266 	clr data_ptr+1
      009F36 F2 A6 1E 62      [ 1] 6267 	clr data_ofs 
      009F3A A6 10 62 20      [ 1] 6268 	clr data_len
      009F3E 1E 00 1C         [ 2] 6269 	ldw x,txtbgn
      009F3F                       6270 data_search_loop: 	
      009F3F A3 08 00         [ 2] 6271 	cpw x,txtend
      009F42 2B 09            [ 1] 6272 	jruge 9$
      009F44 35 0E            [ 1] 6273 	ldw y,x 
      009F46 50 F2            [ 2] 6274 	ldw x,(4,x)
      009F48 A6 50 62         [ 2] 6275 	cpw x,#data 
      009F4B 20 10            [ 1] 6276 	jrne try_next_line 
      009F4D 90 CF 00 06      [ 2] 6277 	ldw data_ptr,y 
      009F4D 35 07 50         [ 1] 6278 	ld a,(2,y)
      009F50 F2 00 09         [ 1] 6279 	ld data_len,a 
      009F51 35 06 00 08      [ 1] 6280 	mov data_ofs,#FIRST_DATA_ITEM
      009F51 A3 00 40 23      [ 1] 6281 9$:	tnz data_len 
      009F55 07 72            [ 1] 6282     jrne 10$
      009F57 5C 50            [ 1] 6283 	ld a,#ERR_NO_DATA 
      009F59 F2 54 20         [ 2] 6284 	jp tb_error 
      009F5C F4               [ 4] 6285 10$:ret
      009F5D                       6286 try_next_line:
      009F5D 9F               [ 1] 6287 	ldw x,y 
      009F5E 4A 27            [ 1] 6288 	ld a,(2,x)
      009F60 01 4A 0D         [ 1] 6289 	ld acc8,a 
      009F62 72 5F 00 0C      [ 1] 6290 	clr acc16 
      009F62 A4 3E C7 50      [ 2] 6291 	addw x,acc16 
      009F66 F1 72            [ 2] 6292 	jra data_search_loop
                                   6293 
                                   6294 
                                   6295 ;---------------------------------
                                   6296 ; BASIC: READ 
                                   6297 ; return next data item | 0 
                                   6298 ;---------------------------------
                           000001  6299 	CTX_BPTR=1 
                           000003  6300 	CTX_IN=3 
                           000004  6301 	CTX_COUNT=4 
                           000005  6302 	XSAVE=5
                           000006  6303 	VSIZE=6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00229A                       6304 read:
      00229A                       6305 	_vars  VSIZE 
      009F68 18 50            [ 2]    1     sub sp,#VSIZE 
      00229C                       6306 read01:	
      009F6A F0 8E 81         [ 1] 6307 	ld a,data_ofs
      009F6D C1 00 09         [ 1] 6308 	cp a,data_len 
      009F6D CE 00            [ 1] 6309 	jreq 2$ ; end of line  
      009F6F 0F A6 84         [ 4] 6310 	call save_context
      009F72 81 00 06         [ 2] 6311 	ldw x,data_ptr 
      009F73 CF 00 04         [ 2] 6312 	ldw basicptr,x 
      009F73 CD 91 60 A1 01   [ 1] 6313 	mov in,data_ofs 
      009F78 27 03 CC 88 FE   [ 1] 6314 	mov count,data_len  
      009F7D CD 11 DE         [ 4] 6315 	call expression 
      009F7D 85 9E            [ 1] 6316 	cp a,#TK_INTGR 
      009F7F A5 80            [ 1] 6317 	jreq 1$ 
      009F81 27 01 50         [ 2] 6318 	jp syntax_error 
      0022C1                       6319 1$:
      009F84 A6 84            [ 2] 6320 	ldw (XSAVE,SP),x
      009F86 81 09 70         [ 4] 6321 	call next_token ; skip comma
      009F87 CE 00 04         [ 2] 6322 	ldw x,basicptr 
      009F87 CD 91 60         [ 2] 6323 	ldw data_ptr,x 
      009F8A A1 02 27 03 CC   [ 1] 6324 	mov data_ofs,in 
      009F8F 88 FE 85         [ 4] 6325 	call rest_context
      009F92 9E 14            [ 2] 6326 	ldw x,(XSAVE,sp)
      009F94 01 95            [ 1] 6327 	ld a,#TK_INTGR
      0022D8                       6328 	_drop VSIZE 
      009F96 9F 14            [ 2]    1     addw sp,#VSIZE 
      009F98 02               [ 4] 6329 	ret 
      0022DB                       6330 2$: ; end of line reached 
      009F99 97 5B 02 A6      [ 2] 6331 	ldw y, data_ptr 
      009F9D 84 81 00 06      [ 1] 6332 	clr data_ptr
      009F9F 72 5F 00 07      [ 1] 6333 	clr data_ptr+1   
      009F9F CD 91 60 A1      [ 1] 6334 	clr data_ofs 
      009FA3 02 27 03 CC      [ 1] 6335 	clr data_len 
      009FA7 88 FE 8A         [ 4] 6336 	call try_next_line 
      009FA9 20 A8            [ 2] 6337 	jra read01
                                   6338 
                                   6339 
                                   6340 ;---------------------------------
                                   6341 ; BASIC: SPIEN clkdiv, 0|1  
                                   6342 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6343 ; if clkdiv==-1 disable SPI
                                   6344 ; 0|1 -> disable|enable  
                                   6345 ;--------------------------------- 
                           000005  6346 SPI_CS_BIT=5
      0022F4                       6347 spi_enable:
      009FA9 85 9E 1A         [ 4] 6348 	call arg_list 
      009FAC 01 95            [ 1] 6349 	cp a,#2
      009FAE 9F 1A            [ 1] 6350 	jreq 1$
      009FB0 02 97 5B         [ 2] 6351 	jp syntax_error 
      0022FE                       6352 1$: 
      009FB3 02 A6 84 81      [ 1] 6353 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      009FB7 85               [ 2] 6354 	popw x  
      009FB7 CD               [ 2] 6355 	tnzw x 
      009FB8 91 60            [ 1] 6356 	jreq spi_disable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009FBA A1               [ 2] 6357 	popw x 
      009FBB 02 27            [ 1] 6358 	ld a,#(1<<SPI_CR1_BR)
      009FBD 03               [ 4] 6359 	mul x,a 
      009FBE CC               [ 1] 6360 	ld a,xl 
      009FBF 88 FE 00         [ 1] 6361 	ld SPI_CR1,a 
                                   6362 ; configure ~CS on PE5 (D10 on CN8) as output. 
      009FC1 72 1A 50 14      [ 1] 6363 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      009FC1 85 9E 18 01      [ 1] 6364 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6365 ; configure SPI as master mode 0.	
      009FC5 95 9F 18 02      [ 1] 6366 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6367 ; ~CS line controlled by sofware 	
      009FC9 97 5B 02 A6      [ 1] 6368 	bset SPI_CR2,#SPI_CR2_SSM 
      009FCD 84 81 52 01      [ 1] 6369     bset SPI_CR2,#SPI_CR2_SSI 
                                   6370 ; enable SPI
      009FCF 72 1C 52 00      [ 1] 6371 	bset SPI_CR1,#SPI_CR1_SPE 	
      009FCF CD               [ 4] 6372 	ret 
      002327                       6373 spi_disable:
      002327                       6374 	_drop #2; throw first argument.
      009FD0 91 60            [ 2]    1     addw sp,##2 
                                   6375 ; wait spi idle 
      009FD2 A1 02            [ 1] 6376 1$:	ld a,#0x82 
      009FD4 27 03 CC         [ 1] 6377 	and a,SPI_SR
      009FD7 88 FE            [ 1] 6378 	cp a,#2 
      009FD9 90 85            [ 1] 6379 	jrne 1$
      009FDB 85 90 5D 27      [ 1] 6380 	bres SPI_CR1,#SPI_CR1_SPE
      009FDF 05 58 90 5A      [ 1] 6381 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      009FE3 26 FB 50 16      [ 1] 6382 	bres PE_DDR,#SPI_CS_BIT 
      009FE5 81               [ 4] 6383 	ret 
                                   6384 
      00233F                       6385 spi_clear_error:
      009FE5 A6 84            [ 1] 6386 	ld a,#0x78 
      009FE7 81 52 03         [ 1] 6387 	bcp a,SPI_SR 
      009FE8 27 04            [ 1] 6388 	jreq 1$
      009FE8 CD 91 60 A1      [ 1] 6389 	clr SPI_SR 
      009FEC 02               [ 4] 6390 1$: ret 
                                   6391 
      00234B                       6392 spi_send_byte:
      009FED 27               [ 1] 6393 	push a 
      009FEE 03 CC 88         [ 4] 6394 	call spi_clear_error
      009FF1 FE               [ 1] 6395 	pop a 
      009FF2 90 85 85 90 5D   [ 2] 6396 	btjf SPI_SR,#SPI_SR_TXE,.
      009FF7 27 05 54         [ 1] 6397 	ld SPI_DR,a
      009FFA 90 5A 26 FB FB   [ 2] 6398 	btjf SPI_SR,#SPI_SR_RXNE,.  
      009FFE C6 52 04         [ 1] 6399 	ld a,SPI_DR 
      009FFE A6               [ 4] 6400 	ret 
                                   6401 
      002361                       6402 spi_rcv_byte:
      009FFF 84 81            [ 1] 6403 	ld a,#255
      00A001 72 01 52 03 E3   [ 2] 6404 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A001 A6 84 CD         [ 1] 6405 	ld a,SPI_DR 
      00A004 91               [ 4] 6406 	ret
                                   6407 
                                   6408 ;------------------------------
                                   6409 ; BASIC: SPIWR byte [,byte]
                                   6410 ; write 1 or more byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   6411 ;------------------------------
      00236C                       6412 spi_write:
      00A005 53 9F A4         [ 4] 6413 	call expression
      00A008 07 C7            [ 1] 6414 	cp a,#TK_INTGR 
      00A00A 50 C6            [ 1] 6415 	jreq 1$
      00A00C 81 08 7E         [ 2] 6416 	jp syntax_error 
      00A00D                       6417 1$:	
      00A00D 52               [ 1] 6418 	ld a,xl 
      00A00E 01 CD 91         [ 4] 6419 	call spi_send_byte 
      00A011 65 A1 02         [ 4] 6420 	call next_token 
      00A014 27 03            [ 1] 6421 	cp a,#TK_COMMA 
      00A016 CC 88            [ 1] 6422 	jrne 2$ 
      00A018 FE 90            [ 2] 6423 	jra spi_write 
      00A01A 85               [ 1] 6424 2$:	tnz a 
      00A01B 85 CD            [ 1] 6425 	jreq 3$
      002386                       6426 	_unget_token  
      00A01D A0 4E 6B 01 A6   [ 1]    1     mov in,in.saved
      00A022 01               [ 4] 6427 3$:	ret 
                                   6428 
                                   6429 
                                   6430 ;-------------------------------
                                   6431 ; BASIC: SPIRD 	
                                   6432 ; read one byte from SPI 
                                   6433 ;-------------------------------
      00238C                       6434 spi_read:
      00A023 0D 01 27         [ 4] 6435 	call spi_rcv_byte 
      00A026 0B               [ 1] 6436 	clrw x 
      00A027 48               [ 1] 6437 	ld xl,a 
      00A028 0A 01            [ 1] 6438 	ld a,#TK_INTGR 
      00A02A 26               [ 4] 6439 	ret 
                                   6440 
                                   6441 ;------------------------------
                                   6442 ; BASIC: SPISEL 0|1 
                                   6443 ; set state of ~CS line
                                   6444 ; 0|1 deselect|select  
                                   6445 ;------------------------------
      002394                       6446 spi_select:
      00A02B FB 6B 01         [ 4] 6447 	call next_token 
      00A02E EA 03            [ 1] 6448 	cp a,#TK_INTGR 
      00A030 E7 03            [ 1] 6449 	jreq 1$
      00A032 90 A3 00         [ 2] 6450 	jp syntax_error 
      00A035 01               [ 2] 6451 1$: tnzw x  
      00A036 27 07            [ 1] 6452 	jreq cs_high 
      00A038 7B 01 43 E4      [ 1] 6453 	bres PE_ODR,#SPI_CS_BIT
      00A03C 02               [ 4] 6454 	ret 
      0023A6                       6455 cs_high: 
      00A03D 20 0A 50 14      [ 1] 6456 	bset PE_ODR,#SPI_CS_BIT
      00A03F 81               [ 4] 6457 	ret 
                                   6458 
                                   6459 
                                   6460 ;-------------------------------
                                   6461 ; BASIC: PAD 
                                   6462 ; Return pad buffer address.
                                   6463 ;------------------------------
      0023AB                       6464 pad_ref:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A03F 7B 01 EA         [ 2] 6465 	ldw x,#pad 
      00A042 04 E7            [ 1] 6466 	ld a,TK_INTGR
      00A044 04               [ 4] 6467 	ret 
                                   6468 
                                   6469 ;------------------------------
                                   6470 ;      dictionary 
                                   6471 ; format:
                                   6472 ;   link:   2 bytes 
                                   6473 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6474 ;   cmd_name: 16 byte max 
                                   6475 ;   code_address: 2 bytes 
                                   6476 ;------------------------------
                                   6477 	.macro _dict_entry len,name,cmd 
                                   6478 	.word LINK 
                                   6479 	LINK=.
                                   6480 name:
                                   6481 	.byte len 	
                                   6482 	.ascii "name"
                                   6483 	.word cmd 
                                   6484 	.endm 
                                   6485 
                           000000  6486 	LINK=0
                                   6487 ; respect alphabetic order for BASIC names from Z-A
                                   6488 ; this sort order is for a cleaner WORDS cmd output. 	
      0023B1                       6489 kword_end:
      0023B1                       6490 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A045 7B 01                    1 	.word LINK 
                           0023B3     2 	LINK=.
      0023B3                          3 XOR:
      00A047 EA                       4 	.byte 3+F_IFUNC 	
      00A048 02 E7 02                 5 	.ascii "XOR"
      00A04B 5B 01                    6 	.word bit_xor 
      0023B9                       6491 	_dict_entry,5,WRITE,write  
      00A04D 81 B3                    1 	.word LINK 
                           0023BB     2 	LINK=.
      00A04E                          3 WRITE:
      00A04E 58                       4 	.byte 5 	
      00A04F 1C A0 5E FE 9F           5 	.ascii "WRITE"
      00A054 88 5E                    6 	.word write 
      0023C3                       6492 	_dict_entry,5,WORDS,words 
      00A056 A6 05                    1 	.word LINK 
                           0023C5     2 	LINK=.
      0023C5                          3 WORDS:
      00A058 42                       4 	.byte 5 	
      00A059 1C 50 00 84 81           5 	.ascii "WORDS"
      00A05E 20 65                    6 	.word words 
      0023CD                       6493 	_dict_entry 4,WAIT,wait 
      00A05E 03 06                    1 	.word LINK 
                           0023CF     2 	LINK=.
      0023CF                          3 WAIT:
      00A060 03                       4 	.byte 4 	
      00A061 05 04 00 02              5 	.ascii "WAIT"
      00A065 01 06                    6 	.word wait 
      0023D6                       6494 	_dict_entry,3+F_IFUNC,USR,usr
      00A067 00 02                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                           0023D8     2 	LINK=.
      0023D8                          3 USR:
      00A069 02                       4 	.byte 3+F_IFUNC 	
      00A06A 02 03 03                 5 	.ascii "USR"
      00A06D 01 03                    6 	.word usr 
      0023DE                       6495 	_dict_entry,5,UNTIL,until 
      00A06F 03 02                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 UNTIL:
      00A071 04                       4 	.byte 5 	
      00A072 04 05 02 06 02           5 	.ascii "UNTIL"
      00A077 07 02                    6 	.word until 
      0023E8                       6496 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A079 05 04                    1 	.word LINK 
                           0023EA     2 	LINK=.
      0023EA                          3 UFLASH:
      00A07B 02                       4 	.byte 6+F_IFUNC 	
      00A07C 04 01 4C 41 53 48        5 	.ascii "UFLASH"
      00A07E 1E 02                    6 	.word uflash 
      0023F3                       6497 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A07E CD 91                    1 	.word LINK 
                           0023F5     2 	LINK=.
      0023F5                          3 UBOUND:
      00A080 60                       4 	.byte 6+F_IFUNC 	
      00A081 A1 01 27 03 CC 88        5 	.ascii "UBOUND"
      00A087 FE D7                    6 	.word ubound 
      00A088                       6498 	_dict_entry,4,TONE,tone  
      00A088 A6 80                    1 	.word LINK 
                           002400     2 	LINK=.
      002400                          3 TONE:
      00A08A 15                       4 	.byte 4 	
      00A08B 01 27 05 A6              5 	.ascii "TONE"
      00A08F 0A CC                    6 	.word tone 
      002407                       6499 	_dict_entry,2,TO,to
      00A091 89 00                    1 	.word LINK 
                           002409     2 	LINK=.
      00A093                          3 TO:
      00A093 CE                       4 	.byte 2 	
      00A094 00 13                    5 	.ascii "TO"
      00A096 58 58                    6 	.word to 
      00240E                       6500 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A098 58 58                    1 	.word LINK 
                           002410     2 	LINK=.
      002410                          3 TIMEOUT:
      00A09A 58                       4 	.byte 7+F_IFUNC 	
      00A09B 9E C8 00 13 C7 00 0D     5 	.ascii "TIMEOUT"
      00A0A2 9F C8                    6 	.word timeout 
      00241A                       6501 	_dict_entry,5,TIMER,set_timer
      00A0A4 00 14                    1 	.word LINK 
                           00241C     2 	LINK=.
      00241C                          3 TIMER:
      00A0A6 C7                       4 	.byte 5 	
      00A0A7 00 0E CE 00 15           5 	.ascii "TIMER"
      00A0AC CF 00                    6 	.word set_timer 
      002424                       6502 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A0AE 13 90                    1 	.word LINK 
                           002426     2 	LINK=.
      002426                          3 TICKS:
      00A0B0 54                       4 	.byte 5+F_IFUNC 	
      00A0B1 90 9E C8 00 15           5 	.ascii "TICKS"
      00A0B6 C7 00                    6 	.word get_ticks 
      00242E                       6503 	_dict_entry,4,STOP,stop 
      00A0B8 15 90                    1 	.word LINK 
                           002430     2 	LINK=.
      002430                          3 STOP:
      00A0BA 9F                       4 	.byte 4 	
      00A0BB C8 00 16 C7              5 	.ascii "STOP"
      00A0BF 00 16                    6 	.word stop 
      002437                       6504 	_dict_entry,4,STEP,step 
      00A0C1 CE 00                    1 	.word LINK 
                           002439     2 	LINK=.
      002439                          3 STEP:
      00A0C3 0D                       4 	.byte 4 	
      00A0C4 54 54 54 9E              5 	.ascii "STEP"
      00A0C8 C8 00                    6 	.word step 
      002440                       6505 	_dict_entry,5,SPIWR,spi_write
      00A0CA 0D 95                    1 	.word LINK 
                           002442     2 	LINK=.
      002442                          3 SPIWR:
      00A0CC 9F                       4 	.byte 5 	
      00A0CD C8 00 0E 97 C8           5 	.ascii "SPIWR"
      00A0D2 00 16                    6 	.word spi_write 
      00244A                       6506 	_dict_entry,6,SPISEL,spi_select
      00A0D4 97 9E                    1 	.word LINK 
                           00244C     2 	LINK=.
      00244C                          3 SPISEL:
      00A0D6 C8                       4 	.byte 6 	
      00A0D7 00 15 95 CF 00 15        5 	.ascii "SPISEL"
      00A0DD 90 85                    6 	.word spi_select 
      002455                       6507 	_dict_entry,5,SPIEN,spi_enable 
      00A0DF 65 93                    1 	.word LINK 
                           002457     2 	LINK=.
      002457                          3 SPIEN:
      00A0E1 5C                       4 	.byte 5 	
      00A0E2 53 50 49 45 4E           5 	.ascii "SPIEN"
      00A0E2 A6 84                    6 	.word spi_enable 
      00245F                       6508 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A0E4 81 57                    1 	.word LINK 
                           002461     2 	LINK=.
      00A0E5                          3 SPIRD:
      00A0E5 52                       4 	.byte 5+F_IFUNC 	
      00A0E6 03 0F 02 0F 03           5 	.ascii "SPIRD"
      00A0EB 90 AE                    6 	.word spi_read 
      002469                       6509 	_dict_entry,5,SLEEP,sleep 
      00A0ED A7 CC                    1 	.word LINK 
                           00246B     2 	LINK=.
      00246B                          3 SLEEP:
      00A0EF 93                       4 	.byte 5 	
      00A0F0 F6 A4 0F 6B 01           5 	.ascii "SLEEP"
      00A0F5 0C 03                    6 	.word sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      002473                       6510 	_dict_entry,4+F_IFUNC,SIZE,size
      00A0F7 5C F6                    1 	.word LINK 
                           002475     2 	LINK=.
      002475                          3 SIZE:
      00A0F9 CD                       4 	.byte 4+F_IFUNC 	
      00A0FA 83 20 0C 02              5 	.ascii "SIZE"
      00A0FE 0A 01                    6 	.word size 
      00247C                       6511     _dict_entry,4,SHOW,show 
      00A100 26 F5                    1 	.word LINK 
                           00247E     2 	LINK=.
      00247E                          3 SHOW:
      00A102 A6                       4 	.byte 4 	
      00A103 46 11 02 2B              5 	.ascii "SHOW"
      00A107 09 A6                    6 	.word show 
      002485                       6512 	_dict_entry,4,SAVE,save
      00A109 20 CD                    1 	.word LINK 
                           002487     2 	LINK=.
      002487                          3 SAVE:
      00A10B 83                       4 	.byte 4 	
      00A10C 20 0C 02 20              5 	.ascii "SAVE"
      00A110 07 A6                    6 	.word save 
      00248E                       6513 	_dict_entry 3,RUN,run
      00A112 0D CD                    1 	.word LINK 
                           002490     2 	LINK=.
      002490                          3 RUN:
      00A114 83                       4 	.byte 3 	
      00A115 20 0F 02                 5 	.ascii "RUN"
      00A118 72 A2                    6 	.word run 
      002496                       6514 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A11A 00 02                    1 	.word LINK 
                           002498     2 	LINK=.
      002498                          3 RSHIFT:
      00A11C 90                       4 	.byte 6+F_IFUNC 	
      00A11D FE 26 CF A6 0D CD        5 	.ascii "RSHIFT"
      00A123 83 20                    6 	.word rshift 
      0024A1                       6515 	_dict_entry,3+F_IFUNC,RND,random 
      00A125 5F 7B                    1 	.word LINK 
                           0024A3     2 	LINK=.
      0024A3                          3 RND:
      00A127 03                       4 	.byte 3+F_IFUNC 	
      00A128 97 CD 8A                 5 	.ascii "RND"
      00A12B 45 AE                    6 	.word random 
      0024A9                       6516 	_dict_entry,6,RETURN,return 
      00A12D A1 35                    1 	.word LINK 
                           0024AB     2 	LINK=.
      0024AB                          3 RETURN:
      00A12F CD                       4 	.byte 6 	
      00A130 83 33 5B 03 81 20        5 	.ascii "RETURN"
      00A136 77 6F                    6 	.word return 
      0024B4                       6517 	_dict_entry,7,RESTORE,restore 
      00A138 72 64                    1 	.word LINK 
                           0024B6     2 	LINK=.
      0024B6                          3 RESTORE:
      00A13A 73                       4 	.byte 7 	
      00A13B 20 69 6E 20 64 69 63     5 	.ascii "RESTORE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal  74-Bits]



      00A143 69 6F                    6 	.word restore 
      0024C0                       6518 	_dict_entry 6,REMARK,remark 
      00A145 6E 61                    1 	.word LINK 
                           0024C2     2 	LINK=.
      0024C2                          3 REMARK:
      00A147 72                       4 	.byte 6 	
      00A148 79 0A 00 41 52 4B        5 	.ascii "REMARK"
      00A14B 16 9D                    6 	.word remark 
      0024CB                       6519 	_dict_entry,6,REBOOT,cold_start
      00A14B CD 91                    1 	.word LINK 
                           0024CD     2 	LINK=.
      0024CD                          3 REBOOT:
      00A14D 65                       4 	.byte 6 	
      00A14E A1 01 27 03 CC 88        5 	.ascii "REBOOT"
      00A154 FE D4                    6 	.word cold_start 
      00A155                       6520 	_dict_entry,4+F_IFUNC,READ,read  
      00A155 85 CF                    1 	.word LINK 
                           0024D8     2 	LINK=.
      0024D8                          3 READ:
      00A157 00                       4 	.byte 4+F_IFUNC 	
      00A158 11 81 41 44              5 	.ascii "READ"
      00A15A 22 9A                    6 	.word read 
      0024DF                       6521 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A15A CE 00                    1 	.word LINK 
                           0024E1     2 	LINK=.
      0024E1                          3 QKEY:
      00A15C 11                       4 	.byte 4+F_IFUNC 	
      00A15D 51 4B 45 59              5 	.ascii "QKEY"
      00A15D 53 A3                    6 	.word qkey 
      0024E8                       6522 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A15F FF FF                    1 	.word LINK 
                           0024EA     2 	LINK=.
      0024EA                          3 PRTI:
      00A161 27                       4 	.byte 4+F_IFUNC 	
      00A162 01 5F A6 84              5 	.ascii "PRTI"
      00A166 81 E6                    6 	.word const_porti 
      00A167                       6523 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A167 CD 91                    1 	.word LINK 
                           0024F3     2 	LINK=.
      0024F3                          3 PRTH:
      00A169 60                       4 	.byte 4+F_IFUNC 	
      00A16A A1 01 27 03              5 	.ascii "PRTH"
      00A16E CC 88                    6 	.word const_porth 
      0024FA                       6524 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A170 FE 85                    1 	.word LINK 
                           0024FC     2 	LINK=.
      0024FC                          3 PRTG:
      00A172 20                       4 	.byte 4+F_IFUNC 	
      00A173 E9 52 54 47              5 	.ascii "PRTG"
      00A174 21 DA                    6 	.word const_portg 
      002503                       6525 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A174 CD 91                    1 	.word LINK 
                           002505     2 	LINK=.
      002505                          3 PRTF:
      00A176 65                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A177 A1 01 27 03              5 	.ascii "PRTF"
      00A17B CC 88                    6 	.word const_portf 
      00250C                       6526 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A17D FE 85                    1 	.word LINK 
                           00250E     2 	LINK=.
      00250E                          3 PRTE:
      00A17F 4B                       4 	.byte 4+F_IFUNC 	
      00A180 00 35 CC 50              5 	.ascii "PRTE"
      00A184 E0 9E                    6 	.word const_porte 
      002515                       6527 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A186 A4 3F                    1 	.word LINK 
                           002517     2 	LINK=.
      002517                          3 PRTD:
      00A188 95                       4 	.byte 4+F_IFUNC 	
      00A189 A3 00 FF 23              5 	.ascii "PRTD"
      00A18D 06 0C                    6 	.word const_portd 
      00251E                       6528 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A18F 01 98                    1 	.word LINK 
                           002520     2 	LINK=.
      002520                          3 PRTC:
      00A191 56                       4 	.byte 4+F_IFUNC 	
      00A192 20 F5 35 55              5 	.ascii "PRTC"
      00A196 50 E0                    6 	.word const_portc 
      002527                       6529 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A198 84 C7                    1 	.word LINK 
                           002529     2 	LINK=.
      002529                          3 PRTB:
      00A19A 50                       4 	.byte 4+F_IFUNC 	
      00A19B E1 9F 4A 35              5 	.ascii "PRTB"
      00A19F 55 50                    6 	.word const_portb 
      002530                       6530 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A1A1 E0 C7                    1 	.word LINK 
                           002532     2 	LINK=.
      002532                          3 PRTA:
      00A1A3 50                       4 	.byte 4+F_IFUNC 	
      00A1A4 E2 35 AA 50              5 	.ascii "PRTA"
      00A1A8 E0 81                    6 	.word const_porta 
      00A1AA                       6531 	_dict_entry 5,PRINT,print 
      00A1AA 35 AA                    1 	.word LINK 
                           00253B     2 	LINK=.
      00253B                          3 PRINT:
      00A1AC 50                       4 	.byte 5 	
      00A1AD E0 81 49 4E 54           5 	.ascii "PRINT"
      00A1AF 15 A0                    6 	.word print 
      002543                       6532 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A1AF CD 91                    1 	.word LINK 
                           002545     2 	LINK=.
      002545                          3 POUT:
      00A1B1 60                       4 	.byte 4+F_IFUNC 	
      00A1B2 A1 01 27 03              5 	.ascii "POUT"
      00A1B6 CC 88                    6 	.word const_output 
      00254C                       6533 	_dict_entry,4,POKE,poke 
      00A1B8 FE 85                    1 	.word LINK 
                           00254E     2 	LINK=.
      00A1BA                          3 POKE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A1BA 5D                       4 	.byte 4 	
      00A1BB 27 0A A6 0F              5 	.ascii "POKE"
      00A1BF 59 25                    6 	.word poke 
      002555                       6534 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A1C1 03 4A                    1 	.word LINK 
                           002557     2 	LINK=.
      002557                          3 PINP:
      00A1C3 20                       4 	.byte 4+F_IFUNC 	
      00A1C4 FA 5F 97 A6              5 	.ascii "PINP"
      00A1C8 84 81                    6 	.word const_input 
      00A1CA                       6535 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A1CA CD 91                    1 	.word LINK 
                           002560     2 	LINK=.
      002560                          3 PEEK:
      00A1CC 60                       4 	.byte 4+F_IFUNC 	
      00A1CD A1 01 27 03              5 	.ascii "PEEK"
      00A1D1 CC 88                    6 	.word peek 
      002567                       6536 	_dict_entry,5,PMODE,pin_mode 
      00A1D3 FE 85                    1 	.word LINK 
                           002569     2 	LINK=.
      002569                          3 PMODE:
      00A1D5 9F                       4 	.byte 5 	
      00A1D6 A4 0F 5F 5C 4D           5 	.ascii "PMODE"
      00A1DB 27 04                    6 	.word pin_mode 
      002571                       6537 	_dict_entry,5,PAUSE,pause 
      00A1DD 58 4A                    1 	.word LINK 
                           002573     2 	LINK=.
      002573                          3 PAUSE:
      00A1DF 20                       4 	.byte 5 	
      00A1E0 F9 A6 84 81 45           5 	.ascii "PAUSE"
      00A1E4 1E 91                    6 	.word pause 
      00257B                       6538 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00A1E4 CD 91                    1 	.word LINK 
                           00257D     2 	LINK=.
      00257D                          3 PAD:
      00A1E6 60                       4 	.byte 3+F_IFUNC 	
      00A1E7 A1 01 27                 5 	.ascii "PAD"
      00A1EA 03 CC                    6 	.word pad_ref 
      002583                       6539 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A1EC 88 FE                    1 	.word LINK 
                           002585     2 	LINK=.
      002585                          3 OR:
      00A1EE 85                       4 	.byte 2+F_IFUNC 	
      00A1EF 53 A6                    5 	.ascii "OR"
      00A1F1 84 81                    6 	.word bit_or 
      00A1F3                       6540 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A1F3 85 52                    1 	.word LINK 
                           00258C     2 	LINK=.
      00258C                          3 ODR:
      00A1F5 04                       4 	.byte 3+F_IFUNC 	
      00A1F6 89 90 CE                 5 	.ascii "ODR"
      00A1F9 00 05                    6 	.word const_odr 
      002592                       6541 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A1FB 17 03                    1 	.word LINK 
                           002594     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      002594                          3 NOT:
      00A1FD 90                       4 	.byte 3+F_IFUNC 	
      00A1FE CE 00 01                 5 	.ascii "NOT"
      00A201 17 05                    6 	.word func_not 
      00259A                       6542 	_dict_entry,3,NEW,new
      00A203 72 5C                    1 	.word LINK 
                           00259C     2 	LINK=.
      00259C                          3 NEW:
      00A205 00                       4 	.byte 3 	
      00A206 21 81 57                 5 	.ascii "NEW"
      00A208 1A 58                    6 	.word new 
      0025A2                       6543 	_dict_entry,4,NEXT,next 
      00A208 72 5D                    1 	.word LINK 
                           0025A4     2 	LINK=.
      0025A4                          3 NEXT:
      00A20A 00                       4 	.byte 4 	
      00A20B 21 26 03 CC              5 	.ascii "NEXT"
      00A20F 88 FE                    6 	.word next 
      00A211                       6544 	_dict_entry,6+F_IFUNC,MULDIV,muldiv 
      00A211 CD 92                    1 	.word LINK 
                           0025AD     2 	LINK=.
      0025AD                          3 MULDIV:
      00A213 A7                       4 	.byte 6+F_IFUNC 	
      00A214 A1 84 27 03 CC 88        5 	.ascii "MULDIV"
      00A21A FE 38                    6 	.word muldiv 
      00A21B                       6545 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A21B 5D 26                    1 	.word LINK 
                           0025B8     2 	LINK=.
      0025B8                          3 LSHIFT:
      00A21D 10                       4 	.byte 6+F_IFUNC 	
      00A21E 1E 03 CF 00 05 E6        5 	.ascii "LSHIFT"
      00A224 02 C7                    6 	.word lshift 
      0025C1                       6546 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A226 00 04                    1 	.word LINK 
                           0025C3     2 	LINK=.
      0025C3                          3 LOG:
      00A228 1E                       4 	.byte 3+F_IFUNC 	
      00A229 05 CF 00                 5 	.ascii "LOG"
      00A22C 01 81                    6 	.word log2 
      00A22E                       6547 	_dict_entry,4,LOAD,load 
      00A22E 85 5B                    1 	.word LINK 
                           0025CB     2 	LINK=.
      0025CB                          3 LOAD:
      00A230 04                       4 	.byte 4 	
      00A231 72 5A 00 21              5 	.ascii "LOAD"
      00A235 FC 43                    6 	.word load 
      00A236                       6548 	_dict_entry 4,LIST,list
      00A236 AE 00                    1 	.word LINK 
                           0025D4     2 	LINK=.
      0025D4                          3 LIST:
      00A238 00                       4 	.byte 4 	
      00A239 A6 84 81 54              5 	.ascii "LIST"
      00A23C 13 24                    6 	.word list 
      0025DB                       6549 	_dict_entry 3,LET,let 
      00A23C AE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                           0025DD     2 	LINK=.
      0025DD                          3 LET:
      00A23E 01                       4 	.byte 3 	
      00A23F A6 84 81                 5 	.ascii "LET"
      00A242 12 F9                    6 	.word let 
      0025E3                       6550 	_dict_entry,3+F_IFUNC,KEY,key 
      00A242 AE 00                    1 	.word LINK 
                           0025E5     2 	LINK=.
      0025E5                          3 KEY:
      00A244 02                       4 	.byte 3+F_IFUNC 	
      00A245 A6 84 81                 5 	.ascii "KEY"
      00A248 1D C5                    6 	.word key 
      0025EB                       6551 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A248 AE 00                    1 	.word LINK 
                           0025ED     2 	LINK=.
      0025ED                          3 IWDGREF:
      00A24A 03                       4 	.byte 7 	
      00A24B A6 84 81 47 52 45 46     5 	.ascii "IWDGREF"
      00A24E 21 2A                    6 	.word refresh_iwdg 
      0025F7                       6552 	_dict_entry,6,IWDGEN,enable_iwdg
      00A24E AE 00                    1 	.word LINK 
                           0025F9     2 	LINK=.
      0025F9                          3 IWDGEN:
      00A250 04                       4 	.byte 6 	
      00A251 A6 84 81 47 45 4E        5 	.ascii "IWDGEN"
      00A254 20 F4                    6 	.word enable_iwdg 
      002602                       6553 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A254 AE 00                    1 	.word LINK 
                           002604     2 	LINK=.
      002604                          3 INVERT:
      00A256 05                       4 	.byte 6+F_IFUNC 	
      00A257 A6 84 81 45 52 54        5 	.ascii "INVERT"
      00A25A 21 64                    6 	.word invert 
      00260D                       6554 	_dict_entry,5,INPUT,input_var  
      00A25A AE 00                    1 	.word LINK 
                           00260F     2 	LINK=.
      00260F                          3 INPUT:
      00A25C 06                       4 	.byte 5 	
      00A25D A6 84 81 55 54           5 	.ascii "INPUT"
      00A260 16 31                    6 	.word input_var 
      002617                       6555 	_dict_entry,2,IF,if 
      00A260 AE 00                    1 	.word LINK 
                           002619     2 	LINK=.
      002619                          3 IF:
      00A262 07                       4 	.byte 2 	
      00A263 A6 84                    5 	.ascii "IF"
      00A265 81 40                    6 	.word if 
      00A266                       6556 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A266 AE 00                    1 	.word LINK 
                           002620     2 	LINK=.
      002620                          3 IDR:
      00A268 08                       4 	.byte 3+F_IFUNC 	
      00A269 A6 84 81                 5 	.ascii "IDR"
      00A26C 21 F2                    6 	.word const_idr 
      002626                       6557 	_dict_entry,3,HEX,hex_base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A26C A6 84                    1 	.word LINK 
                           002628     2 	LINK=.
      002628                          3 HEX:
      00A26E AE                       4 	.byte 3 	
      00A26F 00 00 81                 5 	.ascii "HEX"
      00A272 12 C3                    6 	.word hex_base 
      00262E                       6558 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A272 A6 84                    1 	.word LINK 
                           002630     2 	LINK=.
      002630                          3 GPIO:
      00A274 AE                       4 	.byte 4+F_IFUNC 	
      00A275 00 01 81 4F              5 	.ascii "GPIO"
      00A278 1D D8                    6 	.word gpio 
      002637                       6559 	_dict_entry,4,GOTO,goto 
      00A278 A6 84                    1 	.word LINK 
                           002639     2 	LINK=.
      002639                          3 GOTO:
      00A27A AE                       4 	.byte 4 	
      00A27B 00 02 81 4F              5 	.ascii "GOTO"
      00A27E 18 34                    6 	.word goto 
      002640                       6560 	_dict_entry,5,GOSUB,gosub 
      00A27E A6 84                    1 	.word LINK 
                           002642     2 	LINK=.
      002642                          3 GOSUB:
      00A280 AE                       4 	.byte 5 	
      00A281 00 03 81 55 42           5 	.ascii "GOSUB"
      00A284 18 4F                    6 	.word gosub 
      00264A                       6561 	_dict_entry,6,FORGET,forget 
      00A284 A6 84                    1 	.word LINK 
                           00264C     2 	LINK=.
      00264C                          3 FORGET:
      00A286 AE                       4 	.byte 6 	
      00A287 00 04 81 47 45 54        5 	.ascii "FORGET"
      00A28A 1C 73                    6 	.word forget 
      002655                       6562 	_dict_entry,3,FOR,for 
      00A28A A6 84                    1 	.word LINK 
                           002657     2 	LINK=.
      002657                          3 FOR:
      00A28C AE                       4 	.byte 3 	
      00A28D 00 01 81                 5 	.ascii "FOR"
      00A290 17 54                    6 	.word for 
      00265D                       6563 	_dict_entry,4,FCPU,fcpu 
      00A290 A6 84                    1 	.word LINK 
                           00265F     2 	LINK=.
      00265F                          3 FCPU:
      00A292 AE                       4 	.byte 4 	
      00A293 00 00 81 55              5 	.ascii "FCPU"
      00A296 1F 81                    6 	.word fcpu 
      002666                       6564 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A296 A6 84                    1 	.word LINK 
                           002668     2 	LINK=.
      002668                          3 EEPROM:
      00A298 AE                       4 	.byte 6+F_IFUNC 	
      00A299 40 00 81 52 4F 4D        5 	.ascii "EEPROM"
      00A29C 22 16                    6 	.word const_eeprom_base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      002671                       6565 	_dict_entry,3,END,cmd_end  
      00A29C 55 00                    1 	.word LINK 
                           002673     2 	LINK=.
      002673                          3 END:
      00A29E 04                       4 	.byte 3 	
      00A29F 00 02 81                 5 	.ascii "END"
      00A2A2 18 E6                    6 	.word cmd_end 
      002679                       6566 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A2A2 CD 92                    1 	.word LINK 
                           00267B     2 	LINK=.
      00267B                          3 DWRITE:
      00A2A4 5E                       4 	.byte 6+F_CMD 	
      00A2A5 A1 84 27 03 CC 88        5 	.ascii "DWRITE"
      00A2AB FE CD                    6 	.word digital_write 
      002684                       6567 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A2AD 84 80                    1 	.word LINK 
                           002686     2 	LINK=.
      002686                          3 DREAD:
      00A2AF 5D                       4 	.byte 5+F_IFUNC 	
      00A2B0 26 05 A6 05 CC           5 	.ascii "DREAD"
      00A2B5 89 00                    6 	.word digital_read 
      00A2B7                       6568 	_dict_entry,2,DO,do_loop
      00A2B7 90 93                    1 	.word LINK 
                           002690     2 	LINK=.
      002690                          3 DO:
      00A2B9 EE                       4 	.byte 2 	
      00A2BA 04 A3                    5 	.ascii "DO"
      00A2BC A2 9C                    6 	.word do_loop 
      002695                       6569 	_dict_entry,3,DIR,directory 
      00A2BE 26 F2                    1 	.word LINK 
                           002697     2 	LINK=.
      002697                          3 DIR:
      00A2C0 90                       4 	.byte 3 	
      00A2C1 CF 00 07                 5 	.ascii "DIR"
      00A2C4 90 E6                    6 	.word directory 
      00269D                       6570 	_dict_entry,3,DEC,dec_base
      00A2C6 02 C7                    1 	.word LINK 
                           00269F     2 	LINK=.
      00269F                          3 DEC:
      00A2C8 00                       4 	.byte 3 	
      00A2C9 0A 35 06                 5 	.ascii "DEC"
      00A2CC 00 09                    6 	.word dec_base 
      0026A5                       6571 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A2CE 81 9F                    1 	.word LINK 
                           0026A7     2 	LINK=.
      00A2CF                          3 DDR:
      00A2CF 72                       4 	.byte 3+F_IFUNC 	
      00A2D0 5F 00 07                 5 	.ascii "DDR"
      00A2D3 72 5F                    6 	.word const_ddr 
      0026AD                       6572 	_dict_entry,6,DATALN,data_line  
      00A2D5 00 08                    1 	.word LINK 
                           0026AF     2 	LINK=.
      0026AF                          3 DATALN:
      00A2D7 72                       4 	.byte 6 	
      00A2D8 5F 00 09 72 5F 00        5 	.ascii "DATALN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A2DE 0A CE                    6 	.word data_line 
      0026B8                       6573 	_dict_entry,4,DATA,data  
      00A2E0 00 1D                    1 	.word LINK 
                           0026BA     2 	LINK=.
      00A2E2                          3 DATA:
      00A2E2 C3                       4 	.byte 4 	
      00A2E3 00 1F 24 17              5 	.ascii "DATA"
      00A2E7 90 93                    6 	.word data 
      0026C1                       6574 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A2E9 EE 04                    1 	.word LINK 
                           0026C3     2 	LINK=.
      0026C3                          3 CRL:
      00A2EB A3                       4 	.byte 3+F_IFUNC 	
      00A2EC A2 9C 26                 5 	.ascii "CRL"
      00A2EF 1A 90                    6 	.word const_cr1 
      0026C9                       6575 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A2F1 CF 00                    1 	.word LINK 
                           0026CB     2 	LINK=.
      0026CB                          3 CRH:
      00A2F3 07                       4 	.byte 3+F_IFUNC 	
      00A2F4 90 E6 02                 5 	.ascii "CRH"
      00A2F7 C7 00                    6 	.word const_cr2 
      0026D1                       6576 	_dict_entry,4+F_CFUNC,CHAR,char
      00A2F9 0A 35                    1 	.word LINK 
                           0026D3     2 	LINK=.
      0026D3                          3 CHAR:
      00A2FB 06                       4 	.byte 4+F_CFUNC 	
      00A2FC 00 09 72 5D              5 	.ascii "CHAR"
      00A300 00 0A                    6 	.word char 
      0026DA                       6577 	_dict_entry,3,BYE,bye 
      00A302 26 05                    1 	.word LINK 
                           0026DC     2 	LINK=.
      0026DC                          3 BYE:
      00A304 A6                       4 	.byte 3 	
      00A305 0C CC 89                 5 	.ascii "BYE"
      00A308 00 81                    6 	.word bye 
      00A30A                       6578 	_dict_entry,5,BTOGL,bit_toggle
      00A30A 93 E6                    1 	.word LINK 
                           0026E4     2 	LINK=.
      0026E4                          3 BTOGL:
      00A30C 02                       4 	.byte 5 	
      00A30D C7 00 0E 72 5F           5 	.ascii "BTOGL"
      00A312 00 0D                    6 	.word bit_toggle 
      0026EC                       6579 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A314 72 BB                    1 	.word LINK 
                           0026EE     2 	LINK=.
      0026EE                          3 BTEST:
      00A316 00                       4 	.byte 5+F_IFUNC 	
      00A317 0D 20 C8 53 54           5 	.ascii "BTEST"
      00A31A 16 F9                    6 	.word bit_test 
      0026F6                       6580 	_dict_entry,4,BSET,bit_set 
      00A31A 52 06                    1 	.word LINK 
                           0026F8     2 	LINK=.
      00A31C                          3 BSET:
      00A31C C6                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A31D 00 09 C1 00              5 	.ascii "BSET"
      00A321 0A 27                    6 	.word bit_set 
      0026FF                       6581 	_dict_entry,4,BRES,bit_reset
      00A323 37 CD                    1 	.word LINK 
                           002701     2 	LINK=.
      002701                          3 BRES:
      00A325 96                       4 	.byte 4 	
      00A326 91 CE 00 07              5 	.ascii "BRES"
      00A32A CF 00                    6 	.word bit_reset 
      002708                       6582 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A32C 05 55                    1 	.word LINK 
                           00270A     2 	LINK=.
      00270A                          3 BIT:
      00A32E 00                       4 	.byte 3+F_IFUNC 	
      00A32F 09 00 02                 5 	.ascii "BIT"
      00A332 55 00                    6 	.word bitmask 
      002710                       6583 	_dict_entry,3,AWU,awu 
      00A334 0A 00                    1 	.word LINK 
                           002712     2 	LINK=.
      002712                          3 AWU:
      00A336 04                       4 	.byte 3 	
      00A337 CD 92 5E                 5 	.ascii "AWU"
      00A33A A1 84                    6 	.word awu 
      002718                       6584 	_dict_entry,7,AUTORUN,autorun
      00A33C 27 03                    1 	.word LINK 
                           00271A     2 	LINK=.
      00271A                          3 AUTORUN:
      00A33E CC                       4 	.byte 7 	
      00A33F 88 FE 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A341 1E 2E                    6 	.word autorun 
      002724                       6585 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A341 1F 05                    1 	.word LINK 
                           002726     2 	LINK=.
      002726                          3 ASC:
      00A343 CD                       4 	.byte 3+F_IFUNC 	
      00A344 89 F0 CE                 5 	.ascii "ASC"
      00A347 00 05                    6 	.word ascii 
      00272C                       6586 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A349 CF 00                    1 	.word LINK 
                           00272E     2 	LINK=.
      00272E                          3 AND:
      00A34B 07                       4 	.byte 3+F_IFUNC 	
      00A34C 55 00 02                 5 	.ascii "AND"
      00A34F 00 09                    6 	.word bit_and 
      002734                       6587 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A351 CD 96                    1 	.word LINK 
                           002736     2 	LINK=.
      002736                          3 ADCREAD:
      00A353 A1                       4 	.byte 7+F_IFUNC 	
      00A354 1E 05 A6 84 5B 06 81     5 	.ascii "ADCREAD"
      00A35B 19 6D                    6 	.word analog_read 
      002740                       6588 	_dict_entry,5,ADCON,power_adc 
      00A35B 90 CE                    1 	.word LINK 
                           002742     2 	LINK=.
      002742                          3 ADCON:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A35D 00                       4 	.byte 5 	
      00A35E 07 72 5F 00 07           5 	.ascii "ADCON"
      00A363 72 5F                    6 	.word power_adc 
      00274A                       6589 kword_dict:
      00274A                       6590 	_dict_entry,3+F_IFUNC,ABS,abs
      00A365 00 08                    1 	.word LINK 
                           00274C     2 	LINK=.
      00274C                          3 ABS:
      00A367 72                       4 	.byte 3+F_IFUNC 	
      00A368 5F 00 09                 5 	.ascii "ABS"
      00A36B 72 5F                    6 	.word abs 
                                   6591 	
                                   6592 
      002780                       6593 	.bndry 128 ; align on FLASH block.
                                   6594 ; free space for user application  
      002780                       6595 user_space:
                                   6596 ; USR() function test
      00A36D 00               [ 2] 6597 	pushw x 
      00A36E 0A CD A3 0A      [ 1] 6598 	bset PC_ODR,#5 
      00A372 20               [ 2] 6599 	popw x 
      00A373 A8 1E 9B         [ 4] 6600 	call pause02 
      00A374 72 1B 50 0A      [ 1] 6601 	bres PC_ODR,#5 
      00A374 CD               [ 4] 6602 	ret
                                   6603 
                                   6604 	.area FLASH_DRIVE (ABS)
      010000                       6605 	.org 0x10000
      010000                       6606 fdrive:
                                   6607 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00274C R   |     ACK     =  000006 
  5 ADCON      002742 R   |   5 ADCREAD    002736 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        00272E R
    AREG    =  000002     |     ARG_OFS =  000002     |   5 ASC        002726 R
    ATTRIB  =  000002     |   5 AUTORUN    00271A R   |     AUTORUN_=  004000 
  5 AWU        002712 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
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
  5 BIT        00270A R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       002701 R   |     BS      =  000008 
    BSAVE   =  000001     |   5 BSET       0026F8 R   |     BSIZE   =  000001 
  5 BTEST      0026EE R   |   5 BTOGL      0026E4 R   |     BTW     =  000001 
  5 BYE        0026DC R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       0026D3 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        0026CB R
  5 CRL        0026C3 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       0026BA R   |   5 DATALN     0026AF R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        0026A7 R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        00269F R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002697 R   |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         002690 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      002686 R   |   5 DWRITE     00267B R   |   5 EEPROM     002668 R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002673 R   |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    ERR_NO_P=  00000D     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     ETB     =  000017     |     ETX     =  000003 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FAUTORUN=  000006 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       00265F R
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
    FLSI    =  01F400     |   5 FOR        002657 R   |   5 FORGET     00264C R
    FRUN    =  000000     |     FS      =  00001C     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002642 R   |   5 GOTO       002639 R
  5 GPIO       002630 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  5 HEX        002628 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002620 R
  5 IF         002619 R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      00260F R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
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
    INT_VECT=  008058     |   5 INVERT     002604 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     0025F9 R
  5 IWDGREF    0025ED R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        0025E5 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        0025DD R
    LF      =  00000A     |     LIMIT   =  000005     |     LINENO  =  000005 
  5 LINK    =  00274C R   |   5 LIST       0025D4 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  5 LOAD       0025CB R   |   5 LOG        0025C3 R   |   5 LSHIFT     0025B8 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |   5 MULDIV     0025AD R
    MULOP   =  000003     |     N1      =  000001     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        00259C R   |     NEW_FREE=  000001 
  5 NEXT       0025A4 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  5 NOT        002594 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        00258C R
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002585 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
  5 PAD        00257D R   |     PAD_SIZE=  000080     |   5 PAUSE      002573 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002560 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       002557 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      002569 R   |   5 POKE       00254E R   |     PORT    =  000003 
  5 POUT       002545 R   |     PREV    =  000001     |   5 PRINT      00253B R
  5 PRTA       002532 R   |   5 PRTB       002529 R   |   5 PRTC       002520 R
  5 PRTD       002517 R   |   5 PRTE       00250E R   |   5 PRTF       002505 R
  5 PRTG       0024FC R   |   5 PRTH       0024F3 R   |   5 PRTI       0024EA R
    PSTR    =  000003     |   5 QKEY       0024E1 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       0024D8 R
  5 REBOOT     0024CD R   |     REG     =  000001     |     RELOP   =  000003 
  5 REMARK     0024C2 R   |   5 RESTORE    0024B6 R   |     RETL1   =  000001 
  5 RETURN     0024AB R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0024A3 R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     002498 R   |     RST_SR  =  0050B3     |   5 RUN        002490 R
    RXCHAR  =  000001     |   5 SAVE       002487 R   |     SDIVSR  =  000005 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       00247E R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       002475 R   |     SKIP    =  000005     |   5 SLEEP      00246B R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      002457 R   |   5 SPIRD      002461 R   |   5 SPISEL     00244C R
  5 SPIWR      002442 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002439 R   |   5 STOP       002430 R
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002426 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
    TIM1_BKR=  00526D     |     TIM1_CCE=  00525C     |     TIM1_CCE=  00525D 
    TIM1_CCM=  005258     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    002410 R
  5 TIMER      00241C R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
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
    TK_VAR  =  000085     |   5 TO         002409 R   |   5 TONE       002400 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     0023F5 R
  5 UBTN_Han   00007A R   |   5 UFLASH     0023EA R   |   5 UNTIL      0023E0 R
    US      =  00001F     |   5 USER_ABO   000082 R   |   5 USR        0023D8 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00004D R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       0023CF R   |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0023C5 R   |   5 WRITE      0023BB R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  5 XOR        0023B3 R   |     XREG    =  000003     |     XSAVE   =  000005 
    YSAVE   =  000007     |   5 abs        001EF3 R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   000B6C R
  5 add_char   001560 R   |   5 add_spac   0013B5 R   |   5 analog_r   00196D R
  5 ansi_seq   000B6C R   |   5 arduino_   001FDE R   |   5 arg_list   0010E5 R
  1 array_si   000021 R   |   5 ascii      001DA5 R   |   5 at_tst     000D77 R
  5 atoi24     000E88 R   |   5 atoi_exi   000EEE R   |   5 autorun    001E2E R
  5 autorun_   0006D5 R   |   5 awu        001EA4 R   |   5 awu02      001EAE R
  5 bad_port   001DFD R   |   1 base       00000A R   |   1 basicptr   000004 R
  5 beep       0018FA R   |   5 bin_exit   000C55 R   |   5 bit_and    001F07 R
  5 bit_or     001F1F R   |   5 bit_rese   0016D8 R   |   5 bit_set    0016C8 R
  5 bit_test   0016F9 R   |   5 bit_togg   0016E9 R   |   5 bit_xor    001F37 R
  5 bitmask    00214A R   |   5 bkslsh_t   000D24 R   |   5 bksp       0002BD R
  5 block_er   0001A3 R   |   5 break_po   001A3A R   |   5 bye        001E25 R
  5 cancel_a   00069D R   |   5 char       001D93 R   |   5 clear_ba   0006EA R
  5 clear_va   00055D R   |   5 clock_in   00009D R   |   5 cmd_end    0018E6 R
  5 cmd_line   000908 R   |   5 cmd_name   001054 R   |   5 cmp_name   001ADB R
  5 cold_sta   0005D4 R   |   5 colon_ts   000D4B R   |   5 comma_ts   000D56 R
  5 comp_msg   00085E R   |   5 compile    0004EA R   |   5 const_cr   0021FE R
  5 const_cr   002204 R   |   5 const_dd   0021F8 R   |   5 const_ee   002216 R
  5 const_id   0021F2 R   |   5 const_in   002210 R   |   5 const_od   0021EC R
  5 const_ou   00220A R   |   5 const_po   0021B6 R   |   5 const_po   0021BC R
  5 const_po   0021C2 R   |   5 const_po   0021C8 R   |   5 const_po   0021CE R
  5 const_po   0021D4 R   |   5 const_po   0021DA R   |   5 const_po   0021E0 R
  5 const_po   0021E6 R   |   5 convert_   000BCC R   |   5 copy_com   000DAC R
  1 count      000003 R   |   5 cp_loop    001094 R   |   5 cpy_cmd_   0013A0 R
  5 cpy_quot   0013D9 R   |   5 create_g   000451 R   |   5 cs_high    0023A6 R
  5 cstk_pro   00129C R   |   5 dash_tst   000D6C R   |   5 data       00221C R
  1 data_len   000009 R   |   5 data_lin   002222 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   002262 R   |   5 dbl_sign   000FBC R
  5 dec_base   0012C8 R   |   5 decomp_l   001469 R   |   5 decompil   001422 R
  5 del_line   000424 R   |   5 delete     0002CD R   |   5 digital_   0019A1 R
  5 digital_   0019D1 R   |   5 dir_loop   001CE6 R   |   5 director   001CDA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 disk_fre   001AC8 R   |   5 div32_16   000FC6 R   |   5 divide     00101D R
  5 divu24_8   000A3B R   |   5 dneg       000FB1 R   |   5 do_loop    002173 R
  5 do_progr   000196 R   |   5 drive_fr   001D4F R   |   5 enable_i   0020F4 R
  5 eql_tst    000E01 R   |   5 equal      001573 R   |   5 erase_fl   0001C2 R
  5 err_bad_   0007CA R   |   5 err_buf_   000840 R   |   5 err_cmd_   00078E R
  5 err_div0   000753 R   |   5 err_dupl   0007A8 R   |   5 err_math   00073A R
  5 err_mem_   00071F R   |   5 err_msg    0006FF R   |   5 err_no_a   0007D6 R
  5 err_no_d   000809 R   |   5 err_no_f   00082D R   |   5 err_no_l   000762 R
  5 err_no_p   000819 R   |   5 err_not_   0007B9 R   |   5 err_run_   000778 R
  5 err_synt   00072C R   |   5 escaped    000BE1 R   |   5 expect     0010D3 R
  5 expr_exi   001224 R   |   5 expressi   0011DE R   |   5 factor     001135 R
  1 farptr     000016 R   |   5 fcpu       001F81 R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001D47 R   |   5 final_te   000B65 R
  5 first_li   00134D R   |   1 flags      000023 R   |   5 for        001754 R
  5 forget     001C73 R   |   1 free_ram   00005A R   |   5 func_arg   0010E0 R
  5 func_not   0020E7 R   |   5 ge         001575 R   |   5 get_arra   001110 R
  5 get_targ   00181E R   |   5 get_tick   001EED R   |   5 get_toke   000CBD R
  5 getc       0002A9 R   |   5 gosub      00184F R   |   5 goto       001834 R
  5 gpio       001DD8 R   |   5 gt         001571 R   |   5 gt_tst     000E0C R
  5 hex_base   0012C3 R   |   5 hex_dump   000355 R   |   5 if         001740 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001A88 R   |   5 input_ex   00169A R   |   5 input_lo   001633 R
  5 input_va   001631 R   |   5 insert_l   00047D R   |   5 insert_l   0004E7 R
  5 interp_l   000949 R   |   5 interpre   000924 R   |   5 invert     002164 R
  5 is_alnum   000585 R   |   5 is_alpha   00056B R   |   5 is_digit   00057C R
  5 itoa       0009E1 R   |   5 itoa_loo   000A00 R   |   5 jp_to_ta   001842 R
  5 key        001DC5 R   |   5 kw_loop    000C71 R   |   5 kword_di   00274A R
  5 kword_en   0023B1 R   |   5 le         00157A R   |   5 leading_   00213A R
  5 left_arr   000B6C R   |   5 let        0012F9 R   |   5 let_arra   001307 R
  5 let_var    00130A R   |   5 lines_sk   001350 R   |   5 list       001324 R
  5 list_exi   001392 R   |   5 list_loo   001370 R   |   5 load       001C43 R
  5 load_aut   0006AC R   |   5 load_fil   001C12 R   |   5 log2       00212F R
  5 logical_   0020DD R   |   5 long_div   000F99 R   |   5 loop_bac   001801 R
  1 loop_dep   000020 R   |   5 loop_don   001816 R   |   5 lshift     001F4F R
  5 lt         001578 R   |   5 lt_tst     000E35 R   |   5 modulo     001033 R
  5 move       0003BE R   |   5 move_dow   0003DC R   |   5 move_era   000128 R
  5 move_exi   0003FD R   |   5 move_loo   0003E1 R   |   5 move_prg   00015C R
  5 move_up    0003CE R   |   5 mul_char   001562 R   |   5 muldiv     001038 R
  5 multiply   000F64 R   |   5 mulu24_8   000A63 R   |   5 nbr_tst    000CF0 R
  5 ne         00157D R   |   5 neg_acc2   000A9D R   |   5 new        001A58 R
  5 next       0017D4 R   |   5 next_lin   00092C R   |   5 next_tok   000970 R
  5 no_match   0010A6 R   |   5 other      000E5E R   |   3 pad        0016E0 R
  5 pad_ref    0023AB R   |   5 parse_bi   000C33 R   |   5 parse_in   000BE9 R
  5 parse_ke   000C70 R   |   5 parse_qu   000B94 R   |   5 pause      001E91 R
  5 pause02    001E9B R   |   5 peek       00172F R   |   5 pin_mode   001F8D R
  5 plus_tst   000DD5 R   |   5 poke       001720 R   |   5 power_ad   001931 R
  5 prcnt_ts   000DF6 R   |   5 print      0015A0 R   |   5 print_ex   001605 R
  5 print_in   0009C5 R   |   5 print_ty   001611 R   |   5 printxy    000F05 R
  5 program_   00013C R   |   5 program_   00015C R   |   5 prt_basi   001580 R
  5 prt_loop   0015A4 R   |   5 prt_tok    0002E7 R   |   5 prti24     0009D5 R
  1 ptr16      000017 R   |   1 ptr8       000018 R   |   5 putc       0002A0 R
  5 puts       0002B3 R   |   5 qkey       001DCD GR  |   5 qmark_ts   000D82 R
  5 random     001FFE R   |   5 read       00229A R   |   5 read01     00229C R
  5 readln     000AC0 R   |   5 readln_l   000AC8 R   |   5 readln_q   000B85 R
  5 refresh_   00212A R   |   5 rel_exit   00127F R   |   5 relation   001227 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  5 relop_st   001565 R   |   5 remark     00169D R   |   5 reset_co   0015A2 R
  5 rest_con   001621 R   |   5 restore    00224F R   |   5 return     00186F R
  5 right_al   0013C7 R   |   5 right_ar   000B6C R   |   5 row_alig   001A6D R
  5 row_eras   000101 R   |   5 row_eras   000128 R   |   5 row_loop   000338 R
  5 rparnt_t   000D40 R   |   5 rshift     001F68 R   |   5 rt_msg     00084D R
  5 run        00188D R   |   5 run_it     0018BF R   |   1 rx_char    000025 R
  5 save       001B49 R   |   5 save_con   001611 R   |   5 search_d   001086 R
  5 search_e   0010D0 R   |   5 search_f   001AFC R   |   5 search_l   000400 R
  5 search_l   000408 R   |   5 search_n   00108A R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   001A96 R   |   5 select_p   001FCE R
  5 set_time   0020CB R   |   5 sharp_ts   000D61 R   |   5 show       001282 R
  5 show_row   000326 R   |   5 single_c   00155B R   |   5 size       0012CD R
  5 skip       000EF2 R   |   5 slash_ts   000DEB R   |   5 sleep      001E86 R
  5 software   00058E R   |   5 spaces     0002DB R   |   5 spi_clea   00233F R
  5 spi_disa   002327 R   |   5 spi_enab   0022F4 R   |   5 spi_rcv_   002361 R
  5 spi_read   00238C R   |   5 spi_sele   002394 R   |   5 spi_send   00234B R
  5 spi_writ   00236C R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000DE0 R   |   5 step       0017AD R   |   5 stop       001A0C R
  5 store_lo   0017C1 R   |   5 str_matc   0010B3 R   |   5 str_tst    000CE0 R
  5 strcmp     00039F R   |   5 strcpy     0003B0 R   |   5 strlen     000392 R
  5 syntax_e   00087E R   |   1 tab_widt   000024 R   |   5 tb_error   000880 R
  5 term       00118F R   |   5 term01     001198 R   |   5 term_exi   0011DB R
  3 tib        001690 R   |   5 tick_tst   000D9A R   |   1 ticks      00000E R
  5 timeout    0020DA R   |   1 timer      000010 R   |   5 timer2_i   0000B3 R
  5 timer4_i   0000C0 R   |   5 tk_id      00086E R   |   5 to         00177D R
  5 to_eepro   00017F R   |   5 to_flash   000193 R   |   5 to_upper   000E7C GR
  5 token_ch   000E75 R   |   5 token_ex   000E79 R   |   5 token_ms   00031E R
  5 tone       0018ED R   |   5 try_next   00228A R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   000265 R   |   5 uart1_se   000275 R
  5 ubound     0012D7 R   |   5 udiv32_1   000F87 R   |   5 uflash     001E02 R
  5 umstar     000F2A R   |   5 unlock_e   0000D5 R   |   5 unlock_f   0000EB R
  5 until      002188 R   |   5 user_int   000060 R   |   5 user_spa   002780 R
  5 usr        001E08 R   |   5 var_name   00141A R   |   1 vars       000026 R
  5 wait       0016A3 R   |   5 warm_ini   00067F R   |   5 warm_sta   000905 R
  5 words      002065 R   |   5 words_co   0020B5 R   |   5 write      001D5C R
  5 write_bl   000242 R   |   5 write_by   0001CD R   |   5 write_ee   000209 R
  5 write_ex   00023D R   |   5 write_fl   0001F3 R   |   5 write_ro   000170 R
  5 zero_pad   001A62 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   278E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

