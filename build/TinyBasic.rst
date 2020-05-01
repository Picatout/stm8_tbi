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
      000021                         83 txtend: .blkw 1 ; tokenized BASIC text end address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      008000 82 00 85 6E            107     int cold_start			; RESET vector 
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
      00806C 82 00 80 80            138 	int NonHandledInterrupt ;int25  not used
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



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
      0080A6 CC 85 6E         [ 2]  185 	jp cold_start 	
      0080A9                        186 2$: 
      0080A9 A1 1A            [ 1]  187 	cp a,#CTRL_Z
      0080AB 26 06            [ 1]  188 	jrne 3$
      0080AD CD 86 2C         [ 4]  189 	call cancel_autorun 
      0080B0 CC 85 6E         [ 2]  190 	jp cold_start 
      0080B3 C7 00 28         [ 1]  191 3$:	ld rx_char,a 	
      0080B6 80               [11]  192 	iret 
                                    193 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



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
      0080EE CD 82 57         [ 4]  248 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080F1 CE 00 05         [ 2]  249 	ldw x,basicptr 
      0080F4 C6 00 02         [ 1]  250 	ld a,in 
      0080F7 CD 92 CD         [ 4]  251 	call prt_basic_line
      0080FA                        252 UBTN_Handler_exit:
      0080FA AE 17 FF         [ 2]  253     ldw x,#STACK_EMPTY 
      0080FD 94               [ 1]  254     ldw sp,x
      0080FE 9A               [ 1]  255 	rim 
      0080FF CC 88 27         [ 2]  256 	jp warm_start
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
                                    300 ; interrupt every millisecond 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



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
                                    355 	ldf [farptr],a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



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
                                    410     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



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
      0081BE                        464 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



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
      0081FD 1F 05            [ 2]  515 	ldw (BSIZE,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081FF 26 ED            [ 1]  516 	jrne 1$
      008201                        517 9$:
      008201 1E 01            [ 2]  518 	ldw x,(XSAVE,sp)
      008203 CD 99 0A         [ 4]  519 	call incr_farptr
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
                                    569 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



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
                                    624 ; at terminal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



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
                                    679 	call prt_reg8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



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
                                    734 ; retrun string length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



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
      0082B2 20 F6            [ 2]  789 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



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
                                    842 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



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
      008330 90 E6 02         [ 1]  894 	ld a,(2,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



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
                                    946 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



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
      0083CA 27 27            [ 1] 1000 	jreq insert_ln_exit ; empty line exit.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



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
      008401 CC 87 DE         [ 2] 1040 	jp tb_error 
      008404 81               [ 4] 1041 1$: ret 
                                   1042 
                                   1043 
                                   1044 ;-----------------------------------
                                   1045 ; create token list form text line 
                                   1046 ; save this list in text area
                                   1047 ;  compiled line format: 
                                   1048 ;    line_no  2 bytes {0...32767}
                                   1049 ;    count    1 byte 
                                   1050 ;    tokens   variable 
                                   1051 ;   
                                   1052 ; input:
                                   1053 ;   none
                                   1054 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1055 ;   basicptr     token list buffer address 
                                   1056 ;   in.w  		 cleared, index in buffer 
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
      008411 5F               [ 1] 1066 	clrw x 
      008412 AE 00 03         [ 2] 1067 	ldw x,#3
      008415 1F 03            [ 2] 1068 	ldw (BUFIDX,sp),X  
      008417 CD 83 F6         [ 4] 1069 	call check_full
      00841A 5F               [ 1] 1070 	clrw x 
      00841B 72 CF 00 1A      [ 5] 1071 	ldw [ptr16],x ; initialize line# to zero 
      00841F CD 8B D6         [ 4] 1072 	call get_token
      008422 1F 01            [ 2] 1073 	ldw (XSAVE,sp),x 
      008424 A1 04            [ 1] 1074 	cp a,#TK_INTGR 
      008426 26 13            [ 1] 1075 	jrne 3$
      008428 A3 00 00         [ 2] 1076 	cpw x,#0 
      00842B 2C 05            [ 1] 1077 	jrsgt 1$
      00842D A6 0A            [ 1] 1078 	ld a,#ERR_BAD_VALUE 
      00842F CC 87 DE         [ 2] 1079 	jp tb_error ; line number must be in range {1..32767}
      008432 72 CF 00 1A      [ 5] 1080 1$:	ldw [ptr16],x; line number
      008436 CD 8B D6         [ 4] 1081 2$:	call get_token
      008439 1F 01            [ 2] 1082 	ldw (XSAVE,sp),x 
      00843B A1 00            [ 1] 1083 3$:	cp a,#TK_NONE 
      00843D 26 03            [ 1] 1084 	jrne 30$
      00843F CC 84 D0         [ 2] 1085 	jp 9$ ; end of line. 
      008442                       1086 30$: 	 
      008442 1E 03            [ 2] 1087 	ldw x,(BUFIDX,sp)
      008444 CD 83 F6         [ 4] 1088 	call check_full 
      008447 16 03            [ 2] 1089 	ldw y,(BUFIDX,sp) 
      008449 91 D7 1A         [ 4] 1090 	ld ([ptr16],y),a ; token attribute 
      00844C 90 5C            [ 2] 1091 	incw y
      00844E 17 03            [ 2] 1092 	ldw (BUFIDX,sp),y
      008450 A1 01            [ 1] 1093 	cp a,#TK_COLON 
      008452 26 02            [ 1] 1094 	jrne 31$
      008454 20 E0            [ 2] 1095 	jra 2$ ; loop for next token 
      008456                       1096 31$: ; check for token type 
                                   1097 ; character token have 1 byte attribute, i.e. ASCII character 
      008456 A1 03            [ 1] 1098 	cp a,#TK_CHAR
      008458 26 0C            [ 1] 1099 	jrne 32$ 
      00845A 1E 01            [ 2] 1100 	ldw x,(XSAVE,sp)
      00845C 9F               [ 1] 1101 	ld a,xl 
      00845D 91 D7 1A         [ 4] 1102 	ld ([ptr16],y),a
      008460 90 5C            [ 2] 1103 	incw y 
      008462 17 03            [ 2] 1104 	ldw (BUFIDX,sp),y 
      008464 20 D0            [ 2] 1105 	jra 2$ 
      008466                       1106 32$:
      008466 A1 02            [ 1] 1107 	cp a,#TK_ARRAY 
                                   1108 ; this token have not attribute. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008468 27 CC            [ 1] 1109 	jreq 2$ 
      00846A A1 0A            [ 1] 1110 	cp a,#TK_QSTR 
      00846C 26 25            [ 1] 1111 	jrne 4$
                                   1112 ; copy string as C string.	
      00846E AE 17 38         [ 2] 1113 	ldw x,#pad 
      008471 CD 82 8B         [ 4] 1114 	call strlen
      008474 5C               [ 2] 1115 	incw x  
      008475 CD 83 F6         [ 4] 1116 	call check_full 
      008478 90 AE 17 38      [ 2] 1117 	ldw y,#pad 
      00847C CE 00 1A         [ 2] 1118 	ldw x,ptr16
      00847F 72 FB 03         [ 2] 1119 	addw x,(BUFIDX,sp)	
      008482 CD 82 A9         [ 4] 1120 	call strcpy 
      008485 AE 17 38         [ 2] 1121 	ldw x,#pad 
      008488 CD 82 8B         [ 4] 1122 	call strlen 
      00848B 5C               [ 2] 1123 	incw x
      00848C 72 FB 03         [ 2] 1124 	addw x,(BUFIDX,sp) 
      00848F 1F 03            [ 2] 1125 	ldw (BUFIDX,sp),x
      008491 20 A3            [ 2] 1126 	jra 2$  
      008493 A1 04            [ 1] 1127 4$: cp a,#TK_INTGR
      008495 25 9F            [ 1] 1128 	jrult 2$ ; 
      008497 A1 08            [ 1] 1129 	cp a,#TK_CFUNC 
      008499 22 9B            [ 1] 1130 	Jrugt 2$ ; those tokens have no attributes 
      00849B 1E 01            [ 2] 1131 	ldw x,(XSAVE,sp) 
      00849D 16 03            [ 2] 1132 	ldw y,(BUFIDX,sp)
      00849F 91 DF 1A         [ 5] 1133 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      0084A2 A3 95 22         [ 2] 1134 	cpw x,#rem ; is this a comment? 
      0084A5 27 09            [ 1] 1135 	jreq 5$	
      0084A7 72 A9 00 02      [ 2] 1136 	addw y,#2 
      0084AB 17 03            [ 2] 1137 	ldw (BUFIDX,sp),y 
      0084AD CC 84 36         [ 2] 1138 	jp 2$
      0084B0                       1139 5$:
                                   1140 ; copy commment in code buffer and
                                   1141 ; skip to end of line.  
      0084B0 72 A9 00 02      [ 2] 1142 	addw y,#2 ; skip exec address 
      0084B4 17 03            [ 2] 1143 	ldw (BUFIDX,sp),y 
      0084B6 CE 00 1A         [ 2] 1144 	ldw x,ptr16 
      0084B9 72 FB 03         [ 2] 1145 	addw x,(BUFIDX,sp)
      0084BC 90 CE 00 01      [ 2] 1146 	ldw y,in.w 
      0084C0 72 A9 16 E8      [ 2] 1147 	addw y,#tib 
      0084C4 CD 82 A9         [ 4] 1148 	call strcpy 	
      0084C7 CD 82 8B         [ 4] 1149 	call strlen 
      0084CA 5C               [ 2] 1150 	incw x ; skip string 0. 
      0084CB 72 FB 03         [ 2] 1151 	addw x,(BUFIDX,sp)
      0084CE 1F 03            [ 2] 1152 	ldw (BUFIDX,sp),x 
      0084D0                       1153 9$: 
      0084D0 AE 00 02         [ 2] 1154 	ldw x,#2
      0084D3 16 03            [ 2] 1155 	ldw y,(BUFIDX,sp)
      0084D5 90 9F            [ 1] 1156 	ld a,yl 
      0084D7 72 D7 00 1A      [ 4] 1157 	ld ([ptr16],x),a ; code byte count   	
      0084DB 72 CE 00 1A      [ 5] 1158 	ldw x,[ptr16]
      0084DF 27 09            [ 1] 1159 	jreq 10$
      0084E1 CD 83 8E         [ 4] 1160 	call insert_line
      0084E4 72 5F 00 04      [ 1] 1161 	clr  count 
      0084E8 20 0F            [ 2] 1162 	jra  11$ 
      0084EA                       1163 10$: ; line# is zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0084EA CE 00 1A         [ 2] 1164 	ldw x,ptr16 
      0084ED CF 00 05         [ 2] 1165 	ldw basicptr,x 
      0084F0 E6 02            [ 1] 1166 	ld a,(2,x)
      0084F2 C7 00 04         [ 1] 1167 	ld count,a 
      0084F5 35 03 00 02      [ 1] 1168 	mov in,#3 
      0084F9                       1169 11$:
      000479                       1170 	_drop VSIZE 
      0084F9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084FB 72 1B 00 26      [ 1] 1171 	bres flags,#FCOMP 
      0084FF 81               [ 4] 1172 	ret 
                                   1173 
                                   1174 ;------------------------------------
                                   1175 ;  set all variables to zero 
                                   1176 ; input:
                                   1177 ;   none 
                                   1178 ; output:
                                   1179 ;	none
                                   1180 ;------------------------------------
      008500                       1181 clear_vars:
      008500 AE 00 29         [ 2] 1182 	ldw x,#vars 
      008503 90 AE 00 34      [ 2] 1183 	ldw y,#2*26 
      008507 7F               [ 1] 1184 1$:	clr (x)
      008508 5C               [ 2] 1185 	incw x 
      008509 90 5A            [ 2] 1186 	decw y 
      00850B 26 FA            [ 1] 1187 	jrne 1$
      00850D 81               [ 4] 1188 	ret 
                                   1189 
                                   1190 ;-------------------------------------
                                   1191 ; check if A is a letter 
                                   1192 ; input:
                                   1193 ;   A 			character to test 
                                   1194 ; output:
                                   1195 ;   C flag      1 true, 0 false 
                                   1196 ;-------------------------------------
      00850E                       1197 is_alpha:
      00850E A1 41            [ 1] 1198 	cp a,#'A 
      008510 8C               [ 1] 1199 	ccf
      008511 24 0B            [ 1] 1200 	jrnc 9$ 
      008513 A1 5B            [ 1] 1201 	cp a,#'Z+1 
      008515 25 07            [ 1] 1202 	jrc 9$ 
      008517 A1 61            [ 1] 1203 	cp a,#'a 
      008519 8C               [ 1] 1204 	ccf 
      00851A 24 02            [ 1] 1205 	jrnc 9$
      00851C A1 7B            [ 1] 1206 	cp a,#'z+1   
      00851E 81               [ 4] 1207 9$: ret 	
                                   1208 
                                   1209 ;------------------------------------
                                   1210 ; check if character in {'0'..'9'}
                                   1211 ; input:
                                   1212 ;    A  character to test
                                   1213 ; output:
                                   1214 ;    Carry  0 not digit | 1 digit
                                   1215 ;------------------------------------
      00851F                       1216 is_digit:
      00851F A1 30            [ 1] 1217 	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008521 25 03            [ 1] 1218 	jrc 1$
      008523 A1 3A            [ 1] 1219     cp a,#'9+1
      008525 8C               [ 1] 1220 	ccf 
      008526 8C               [ 1] 1221 1$:	ccf 
      008527 81               [ 4] 1222     ret
                                   1223 
                                   1224 ;-------------------------------------
                                   1225 ;  program initialization entry point 
                                   1226 ;-------------------------------------
                           000001  1227 	MAJOR=1
                           000000  1228 	MINOR=0
      008528 0A 0A 54 69 6E 79 20  1229 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00856E                       1230 cold_start:
                                   1231 ;set stack 
      00856E AE 17 FF         [ 2] 1232 	ldw x,#STACK_EMPTY
      008571 94               [ 1] 1233 	ldw sp,x   
                                   1234 ; clear all ram 
      008572 7F               [ 1] 1235 0$: clr (x)
      008573 5A               [ 2] 1236 	decw x 
      008574 26 FC            [ 1] 1237 	jrne 0$
                                   1238 ; activate pull up on all inputs 
      008576 A6 FF            [ 1] 1239 	ld a,#255 
      008578 C7 50 03         [ 1] 1240 	ld PA_CR1,a 
      00857B C7 50 08         [ 1] 1241 	ld PB_CR1,a 
      00857E C7 50 0D         [ 1] 1242 	ld PC_CR1,a 
      008581 C7 50 12         [ 1] 1243 	ld PD_CR1,a 
      008584 C7 50 17         [ 1] 1244 	ld PE_CR1,a 
      008587 C7 50 1C         [ 1] 1245 	ld PF_CR1,a 
      00858A C7 50 21         [ 1] 1246 	ld PG_CR1,a 
      00858D C7 50 2B         [ 1] 1247 	ld PI_CR1,a
                                   1248 ; set LD2 pin as output and turn it on
      008590 72 1A 50 0D      [ 1] 1249     bset PC_CR1,#LED2_BIT
      008594 72 1A 50 0E      [ 1] 1250     bset PC_CR2,#LED2_BIT
      008598 72 1A 50 0C      [ 1] 1251     bset PC_DDR,#LED2_BIT
      00859C 72 1A 50 0A      [ 1] 1252 	bset PC_ODR,#LED2_BIT 
                                   1253 ; disable schmitt triggers on Arduino CN4 analog inputs
      0085A0 55 00 3F 54 07   [ 1] 1254 	mov ADC_TDRL,0x3f
                                   1255 ; disable peripherals clocks
                                   1256 ;	clr CLK_PCKENR1 
                                   1257 ;	clr CLK_PCKENR2
      0085A5 72 5F 50 F2      [ 1] 1258 	clr AWU_TBR 
      0085A9 72 14 50 CA      [ 1] 1259 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1260 ; select internal clock no divisor: 16 Mhz 	
      0085AD A6 E1            [ 1] 1261 	ld a,#CLK_SWR_HSI 
      0085AF 5F               [ 1] 1262 	clrw x  
      0085B0 CD 81 1D         [ 4] 1263     call clock_init 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085B3 CD 81 40         [ 4] 1264 	call timer4_init
      0085B6 CD 81 33         [ 4] 1265 	call timer2_init
                                   1266 ; UART1 at 115200 BAUD
      0085B9 CD 82 09         [ 4] 1267 	call uart1_init
                                   1268 ; activate PE_4 (user button interrupt)
      0085BC 72 18 50 18      [ 1] 1269     bset PE_CR2,#USR_BTN_BIT 
                                   1270 ; display system information
      0085C0 AE 85 28         [ 2] 1271 	ldw x,#software 
      0085C3 CD 82 57         [ 4] 1272 	call puts 
      0085C6 A6 01            [ 1] 1273 	ld a,#MAJOR 
      0085C8 C7 00 0E         [ 1] 1274 	ld acc8,a 
      0085CB 5F               [ 1] 1275 	clrw x 
      0085CC CF 00 0C         [ 2] 1276 	ldw acc24,x 
      0085CF A6 0A            [ 1] 1277 	ld a,#10 
      0085D1 CD 88 E5         [ 4] 1278 	call prti24 
      0085D4 A6 2E            [ 1] 1279 	ld a,#'.
      0085D6 CD 82 44         [ 4] 1280 	call putc 
      0085D9 A6 00            [ 1] 1281 	ld a,#MINOR 
      0085DB C7 00 0E         [ 1] 1282 	ld acc8,a 
      0085DE 5F               [ 1] 1283 	clrw x 
      0085DF CF 00 0C         [ 2] 1284 	ldw acc24,x 
      0085E2 A6 0A            [ 1] 1285 	ld a,#10 
      0085E4 CD 88 E5         [ 4] 1286 	call prti24 
      0085E7 A6 0D            [ 1] 1287 	ld a,#CR 
      0085E9 CD 82 44         [ 4] 1288 	call putc 
      0085EC CD 99 18         [ 4] 1289 	call seek_fdrive 
      0085EF 9A               [ 1] 1290 	rim 
      0085F0 72 5C 00 18      [ 1] 1291 	inc seedy+1 
      0085F4 72 5C 00 16      [ 1] 1292 	inc seedx+1 
      0085F8 CD 86 79         [ 4] 1293 	call clear_basic
      0085FB CD 91 BB         [ 4] 1294 	call ubound 
                                   1295 ;	jra 2$	
                                   1296 ; 150 msec beep 
      0085FE AE 00 96         [ 2] 1297 	ldw x,#150 
      008601 90 AE 03 E6      [ 2] 1298 	ldw y,#998 
      008605 CD 97 9C         [ 4] 1299 	call beep  
      008608 72 1B 50 0A      [ 1] 1300 2$:	bres PC_ODR,#LED2_BIT	
      00860C CD 86 15         [ 4] 1301 	call warm_init
      00860F CD 86 3B         [ 4] 1302 	call load_autorun
      008612 CC 88 2A         [ 2] 1303     jp interp 
                                   1304 
      008615                       1305 warm_init:
      008615 72 5F 00 26      [ 1] 1306 	clr flags 
      008619 72 5F 00 23      [ 1] 1307 	clr loop_depth 
      00861D 35 04 00 27      [ 1] 1308 	mov tab_width,#TAB_WIDTH 
      008621 35 0A 00 0B      [ 1] 1309 	mov base,#10 
      008625 AE 16 E8         [ 2] 1310 	ldw x,#tib 
      008628 CF 00 05         [ 2] 1311 	ldw basicptr,x 
      00862B 81               [ 4] 1312 	ret 
                                   1313 
                                   1314 ;--------------------------
                                   1315 ; called by tb_error when
                                   1316 ; flag FAUTORUN is set.
                                   1317 ; There is a bug in autorun 
                                   1318 ; program so cancel it.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1319 ;---------------------------
      00862C                       1320 cancel_autorun:
      00862C AE 40 00         [ 2] 1321 	ldw x,#AUTORUN_NAME 
      00862F CF 00 1A         [ 2] 1322 	ldw farptr+1,x 
      008632 4F               [ 1] 1323 	clr a
      008633 5F               [ 1] 1324 	clrw x  
      008634 C7 00 19         [ 1] 1325 	ld farptr,a 
      008637 CD 81 71         [ 4] 1326 	call write_byte 
      00863A 81               [ 4] 1327 	ret 
                                   1328 
                                   1329 
                                   1330 ;--------------------------
                                   1331 ; if autorun file defined 
                                   1332 ; in eeprom address AUTORUN_NAME 
                                   1333 ; load and run it.
                                   1334 ;-------------------------
      00863B                       1335 load_autorun:
      00863B 90 AE 40 00      [ 2] 1336 	ldw y,#AUTORUN_NAME
      00863F 90 F6            [ 1] 1337 	ld a,(y)
      008641 27 20            [ 1] 1338 	jreq 9$
      008643 CD 99 76         [ 4] 1339 	call search_file
      008646 25 05            [ 1] 1340 	jrc 2$ 
                                   1341 ; if file doesn't exit
      008648 CD 86 2C         [ 4] 1342 	call cancel_autorun
      00864B 20 16            [ 2] 1343 	jra 9$ 
      00864D CD 9A 80         [ 4] 1344 2$:	call load_file
      008650 AE 40 00         [ 2] 1345 	ldw x,#AUTORUN_NAME 
      008653 CD 82 57         [ 4] 1346 	call puts
      008656 AE 86 64         [ 2] 1347 	ldw x,#autorun_msg 
      008659 CD 82 57         [ 4] 1348 	call puts 
      00865C 72 1C 00 26      [ 1] 1349 	bset flags,#FAUTORUN 
      008660 CC 97 59         [ 2] 1350 	jp run_it    
      008663 81               [ 4] 1351 9$: ret 	
                                   1352 
      008664 20 6C 6F 61 64 65 64  1353 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1354 ;---------------------------
                                   1355 ; reset BASIC text variables 
                                   1356 ; and clear variables 
                                   1357 ;---------------------------
      008679                       1358 clear_basic:
      008679 72 5F 00 04      [ 1] 1359 	clr count 
      00867D AE 00 5D         [ 2] 1360 	ldw x,#free_ram 
      008680 CF 00 1F         [ 2] 1361 	ldw txtbgn,x 
      008683 CF 00 21         [ 2] 1362 	ldw txtend,x 
      008686 CD 85 00         [ 4] 1363 	call clear_vars 
      008689 81               [ 4] 1364 	ret 
                                   1365 
                                   1366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1367 ;;   Tiny BASIC error messages     ;;
                                   1368 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00868A                       1369 err_msg:
      00868A 00 00 86 A8 86 B6 86  1370 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             C5 86 DF 86 EF
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008696 87 06 87 1D 87 38 87  1371 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             4A 87 5C
      0086A0 87 69 87 9D 87 B3 87  1372 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace    
             C8
                                   1373 
      0086A8 0A 4D 65 6D 6F 72 79  1374 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086B6 0A 73 79 6E 74 61 78  1375 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086C5 0A 6D 61 74 68 20 6F  1376 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086DF 0A 64 69 76 69 73 69  1377 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086EF 0A 69 6E 76 61 6C 69  1378 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008706 0A 72 75 6E 20 74 69  1379 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      00871D 0A 63 6F 6D 6D 61 6E  1380 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008738 0A 64 75 70 6C 69 63  1381 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00874A 0A 46 69 6C 65 20 6E  1382 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00875C 0A 62 61 64 20 76 61  1383 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008769 0A 46 69 6C 65 20 69  1384 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
      00879D 0A 4E 6F 20 64 61 74  1385 err_no_data: .asciz "\nNo data line found.\n"
             61 20 6C 69 6E 65 20
             66 6F 75 6E 64 2E 0A
             00
      0087B3 0A 4E 6F 20 70 72 6F  1386 err_no_prog: .asciz "\nNo program in RAM!\n"
             67 72 61 6D 20 69 6E
             20 52 41 4D 21 0A 00
      0087C8 0A 46 69 6C 65 20 73  1387 err_no_fspace: .asciz "\nFile system full.\n" 
             79 73 74 65 6D 20 66
             75 6C 6C 2E 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1388 
                                   1389 ;rt_msg: .asciz "last token id: "
                                   1390 
      0087DC                       1391 syntax_error:
      0087DC A6 02            [ 1] 1392 	ld a,#ERR_SYNTAX 
                                   1393 
      0087DE                       1394 tb_error:
      0087DE AE 86 8A         [ 2] 1395 	ldw x, #err_msg 
      0087E1 72 5F 00 0D      [ 1] 1396 	clr acc16 
      0087E5 48               [ 1] 1397 	sll a
      0087E6 72 59 00 0D      [ 1] 1398 	rlc acc16  
      0087EA C7 00 0E         [ 1] 1399 	ld acc8, a 
      0087ED 72 BB 00 0D      [ 2] 1400 	addw x,acc16 
      0087F1 FE               [ 2] 1401 	ldw x,(x)
      0087F2 CD 82 57         [ 4] 1402 	call puts
      0087F5 72 0B 00 26 18   [ 2] 1403 	btjf flags,#FCOMP, 1$
      0087FA AE 16 E8         [ 2] 1404 	ldw x,#tib
      0087FD CD 82 57         [ 4] 1405 	call puts 
      008800 A6 0D            [ 1] 1406 	ld a,#CR 
      008802 CD 82 44         [ 4] 1407 	call putc
      008805 CE 00 01         [ 2] 1408 	ldw x,in.w
      008808 CD 82 7F         [ 4] 1409 	call spaces
      00880B A6 5E            [ 1] 1410 	ld a,#'^
      00880D CD 82 44         [ 4] 1411 	call putc 
      008810 20 11            [ 2] 1412 	jra 6$
      008812 CE 00 05         [ 2] 1413 1$:	ldw x,basicptr
      008815 C6 00 02         [ 1] 1414 	ld a,in 
      008818 CD 92 CD         [ 4] 1415 	call prt_basic_line
      00881B 72 0D 00 26 03   [ 2] 1416 	btjf flags,#FAUTORUN ,2$
      008820 CD 86 2C         [ 4] 1417 	call cancel_autorun  
      008823                       1418 2$:
                                   1419 ;	ldw x,#rt_msg 
                                   1420 ;	call puts 
                                   1421 ;	clrw x 
                                   1422 ;	ld a,in.saved 
                                   1423 ;	ld xl,a 
                                   1424 ;	ld a,([basicptr],x)
                                   1425 ;	clrw x 
                                   1426 ;	ld xl,a 
                                   1427 ;	call print_int 
      008823 AE 17 FF         [ 2] 1428 6$: ldw x,#STACK_EMPTY 
      008826 94               [ 1] 1429     ldw sp,x
      008827                       1430 warm_start:
      008827 CD 86 15         [ 4] 1431 	call warm_init
                                   1432 ;----------------------------
                                   1433 ;   BASIC interpreter
                                   1434 ;----------------------------
      00882A                       1435 interp:
      00882A 72 5F 00 01      [ 1] 1436 	clr in.w
      00882E 72 01 00 26 23   [ 2] 1437 	btjf flags,#FRUN,cmd_line
                                   1438 ; flag FRUN is set 
                                   1439 ; running program
                                   1440 ; goto next basic line 
      008833 CE 00 05         [ 2] 1441 	ldw x,basicptr
      008836 E6 02            [ 1] 1442 	ld a,(2,x) ; line length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008838 C7 00 0E         [ 1] 1443 	ld acc8,a 
      00883B 72 5F 00 0D      [ 1] 1444 	clr acc16 
      00883F 72 BB 00 0D      [ 2] 1445 	addw x,acc16
      008843 C3 00 21         [ 2] 1446 	cpw x,txtend 
      008846 2A DF            [ 1] 1447 	jrpl warm_start
      008848 CF 00 05         [ 2] 1448 	ldw basicptr,x ; start of next line  
      00884B E6 02            [ 1] 1449 	ld a,(2,x)
      00884D C7 00 04         [ 1] 1450 	ld count,a 
      008850 35 03 00 02      [ 1] 1451 	mov in,#3 ; skip first 3 bytes of line 
      008854 20 14            [ 2] 1452 	jra interp_loop 
      008856                       1453 cmd_line: ; commande line interface  	
      008856 72 5F 00 02      [ 1] 1454 	clr in
      00885A A6 0D            [ 1] 1455 	ld a,#CR 
      00885C CD 82 44         [ 4] 1456 	call putc 
      00885F A6 3E            [ 1] 1457 	ld a,#'> 
      008861 CD 82 44         [ 4] 1458 	call putc 
      008864 CD 8A 57         [ 4] 1459 	call readln
      008867 CD 84 05         [ 4] 1460 	call compile
                                   1461 ; if text begin with a line number
                                   1462 ; the compile set count=0   
                                   1463 ; so code is not interpreted
                                   1464 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1465 ;; This is the interpreter loop
                                   1466 ;; for each BASIC code line. 
                                   1467 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00886A                       1468 interp_loop:  
      00886A C6 00 02         [ 1] 1469 	ld a,in 
      00886D C1 00 04         [ 1] 1470 	cp a,count  
      008870 2A B8            [ 1] 1471 	jrpl interp
      008872 CD 88 98         [ 4] 1472 	call next_token
      008875 A1 01            [ 1] 1473 	cp a,#TK_COLON 
      008877 27 F1            [ 1] 1474 	jreq interp_loop 
      008879                       1475 1$:
      008879 A1 05            [ 1] 1476 	cp a,#TK_VAR
      00887B 26 05            [ 1] 1477 	jrne 2$
      00887D CD 91 E7         [ 4] 1478 	call let02  
      008880 20 E8            [ 2] 1479 	jra interp_loop 
      008882                       1480 2$:	
      008882 A1 02            [ 1] 1481 	cp a,#TK_ARRAY 
      008884 26 08            [ 1] 1482 	jrne 3$
      008886 CD 8F 9C         [ 4] 1483 	call get_array_element
      008889 CD 91 E7         [ 4] 1484 	call let02 
      00888C 20 DC            [ 2] 1485 	jra interp_loop 
      00888E                       1486 3$:
      00888E A1 06            [ 1] 1487 	cp a,#TK_CMD
      008890 26 03            [ 1] 1488 	jrne 4$
      008892 FD               [ 4] 1489 	call (x) 
      008893 20 D5            [ 2] 1490 	jra interp_loop 
      008895                       1491 4$:	
      008895 CC 87 DC         [ 2] 1492 	jp syntax_error 
                                   1493 
                                   1494 ;--------------------------
                                   1495 ; extract next token from
                                   1496 ; token list 
                                   1497 ; basicptr -> base address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1498 ; in  -> offset in list array 
                                   1499 ; output:
                                   1500 ;   A 		token attribute
                                   1501 ;   X 		token value if there is one
                                   1502 ;----------------------------------------
      008898                       1503 next_token:
      008898 C6 00 02         [ 1] 1504 	ld a,in 
      00889B C0 00 04         [ 1] 1505 	sub a,count ; don't replace sub by cp.  
      00889E 27 44            [ 1] 1506 	jreq 10$
      0088A0 55 00 02 00 03   [ 1] 1507 	mov in.saved,in 
      0088A5 90 CE 00 05      [ 2] 1508 	ldw y,basicptr 
      0088A9 72 B9 00 01      [ 2] 1509 	addw y,in.w 
      0088AD 90 F6            [ 1] 1510 	ld a,(y)
      0088AF 90 5C            [ 2] 1511 	incw y  
      0088B1 A1 02            [ 1] 1512 	cp a,#TK_ARRAY  
      0088B3 23 27            [ 2] 1513 	jrule 9$
      0088B5 A1 03            [ 1] 1514 	cp a,#TK_CHAR
      0088B7 26 0A            [ 1] 1515 	jrne 1$
      0088B9 90 F6            [ 1] 1516 	ld a,(y)
      0088BB 90 5C            [ 2] 1517 	incw y
      0088BD 5F               [ 1] 1518 	clrw x 
      0088BE 97               [ 1] 1519 	ld xl,a 
      0088BF A6 03            [ 1] 1520 	ld a,#TK_CHAR
      0088C1 20 19            [ 2] 1521 	jra 9$ 
      0088C3 A1 0A            [ 1] 1522 1$:	cp a,#TK_QSTR 
      0088C5 25 0F            [ 1] 1523 	jrult 4$
      0088C7 26 13            [ 1] 1524 	jrne 9$
      0088C9 93               [ 1] 1525 	ldw x,y 
      0088CA 90 7D            [ 1] 1526 2$:	tnz (y)
      0088CC 27 04            [ 1] 1527 	jreq 3$
      0088CE 90 5C            [ 2] 1528 	incw y
      0088D0 20 F8            [ 2] 1529 	jra 2$ 
      0088D2 90 5C            [ 2] 1530 3$:	incw y 
      0088D4 20 06            [ 2] 1531 	jra 9$ 
      0088D6 93               [ 1] 1532 4$: ldw x,y 
      0088D7 FE               [ 2] 1533 	ldw x,(x)
      0088D8 72 A9 00 02      [ 2] 1534 	addw y,#2  
      0088DC 72 B2 00 05      [ 2] 1535 9$: subw y,basicptr 
      0088E0 90 CF 00 01      [ 2] 1536     ldw in.w,y 
      0088E4                       1537 10$:
      0088E4 81               [ 4] 1538 	ret	
                                   1539 
                                   1540 
                                   1541 ;----------------------------------------
                                   1542 ;   DEBUG support functions
                                   1543 ;----------------------------------------
                           000000  1544 .if DEBUG 
                                   1545 
                                   1546 ; turn LED on 
                                   1547 ledon:
                                   1548     bset PC_ODR,#LED2_BIT
                                   1549     ret 
                                   1550 
                                   1551 ; turn LED off 
                                   1552 ledoff:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1553     bres PC_ODR,#LED2_BIT 
                                   1554     ret 
                                   1555 
                                   1556 ; invert LED status 
                                   1557 ledtoggle:
                                   1558     ld a,#LED2_MASK
                                   1559     xor a,PC_ODR
                                   1560     ld PC_ODR,a
                                   1561     ret 
                                   1562 
                                   1563 left_paren:
                                   1564 	ld a,#SPACE 
                                   1565 	call putc
                                   1566 	ld a,#'( 
                                   1567 	call putc 	
                                   1568 	ret 
                                   1569 
                                   1570 ;------------------------------
                                   1571 ; print 8 bit register 
                                   1572 ; input:
                                   1573 ;   X  point to register name 
                                   1574 ;   A  register value to print 
                                   1575 ; output:
                                   1576 ;   none
                                   1577 ;------------------------------- 
                                   1578 prt_reg8:
                                   1579 	push a 
                                   1580 	call puts 
                                   1581 	ld a,(1,sp) 
                                   1582 	ld acc8,a 
                                   1583 	clrw x 
                                   1584 	ld xl,a 
                                   1585 	mov base,#16
                                   1586 	call print_int 
                                   1587 	call left_paren 
                                   1588 	pop a 
                                   1589 	clrw x 
                                   1590 	ld xl,a 
                                   1591 	mov base,#10 
                                   1592 	call print_int  
                                   1593 	ld a,#') 
                                   1594 	call putc
                                   1595 	ret
                                   1596 
                                   1597 ;--------------------------------
                                   1598 ; print 16 bits register 
                                   1599 ; input:
                                   1600 ;   X   point register name 
                                   1601 ;   Y   register value to print 
                                   1602 ; output:
                                   1603 ;  none
                                   1604 ;--------------------------------
                                   1605 prt_reg16: 
                                   1606 	pushw y 
                                   1607 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1608 	ldw x,(1,sp) 
                                   1609 	mov base,#16 
                                   1610 	call print_int  
                                   1611 	call left_paren 
                                   1612 	popw x 
                                   1613 	mov base,#10 
                                   1614 	call print_int  
                                   1615 	ld a,#') 
                                   1616 	call putc
                                   1617 	ret 
                                   1618 
                                   1619 ;------------------------------------
                                   1620 ; print registers contents saved on
                                   1621 ; stack by trap interrupt.
                                   1622 ;------------------------------------
                                   1623 print_registers:
                                   1624 	ldw x,#STATES
                                   1625 	call puts
                                   1626 ; print EPC 
                                   1627 	ldw x, #REG_EPC
                                   1628 	call puts 
                                   1629 	ld a, (11,sp)
                                   1630 	ld acc8,a 
                                   1631 	ld a, (10,sp) 
                                   1632 	ld acc16,a 
                                   1633 	ld a,(9,sp) 
                                   1634 	ld acc24,a
                                   1635 	clrw x  
                                   1636 	ld a,#16
                                   1637 	call prti24  
                                   1638 ; print X
                                   1639 	ldw x,#REG_X
                                   1640 	ldw y,(5,sp)
                                   1641 	call prt_reg16  
                                   1642 ; print Y 
                                   1643 	ldw x,#REG_Y
                                   1644 	ldw y, (7,sp)
                                   1645 	call prt_reg16  
                                   1646 ; print A 
                                   1647 	ldw x,#REG_A
                                   1648 	ld a, (4,sp) 
                                   1649 	call prt_reg8
                                   1650 ; print CC 
                                   1651 	ldw x,#REG_CC 
                                   1652 	ld a, (3,sp) 
                                   1653 	call prt_reg8 
                                   1654 ; print SP 
                                   1655 	ldw x,#REG_SP
                                   1656 	ldw y,sp 
                                   1657 	addw y,#12
                                   1658 	call prt_reg16  
                                   1659 	ld a,#'\n' 
                                   1660 	call putc
                                   1661 	ret
                                   1662 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1663 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1664 REG_EPC: .asciz "EPC:"
                                   1665 REG_Y:   .asciz "\nY:" 
                                   1666 REG_X:   .asciz "\nX:"
                                   1667 REG_A:   .asciz "\nA:" 
                                   1668 REG_CC:  .asciz "\nCC:"
                                   1669 REG_SP:  .asciz "\nSP:"
                                   1670 
                                   1671 .endif ; DEBUG 
                                   1672 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1673 
                                   1674 
                                   1675 ;------------------------------------
                                   1676 ; print integer in acc24 
                                   1677 ; input:
                                   1678 ;	acc24 		integer to print 
                                   1679 ;	A 			numerical base for conversion 
                                   1680 ;               if bit 7 is set add a space at print end.
                                   1681 ;   XL 			field width, 0 -> no fill.
                                   1682 ;  output:
                                   1683 ;    none 
                                   1684 ;------------------------------------
                           000001  1685 	WIDTH = 1
                           000002  1686 	BASE = 2
                           000003  1687 	ADD_SPACE=3 ; add a space after number 
                           000003  1688 	VSIZE = 3
      0088E5                       1689 prti24:
      000865                       1690 	_vars VSIZE 
      0088E5 52 03            [ 2]    1     sub sp,#VSIZE 
      0088E7 0F 03            [ 1] 1691 	clr (ADD_SPACE,sp)
      0088E9 A5 80            [ 1] 1692 	bcp a,#0x80 
      0088EB 27 02            [ 1] 1693 	jreq 0$ 
      0088ED 03 03            [ 1] 1694 	cpl (ADD_SPACE,sp)
      0088EF A4 1F            [ 1] 1695 0$:	and a,#31 
      0088F1 6B 02            [ 1] 1696 	ld (BASE,sp),a
      0088F3 9F               [ 1] 1697 	ld a,xl
      0088F4 6B 01            [ 1] 1698 	ld (WIDTH,sp),a 
      0088F6 7B 02            [ 1] 1699 	ld a, (BASE,sp)  
      0088F8 CD 89 8B         [ 4] 1700     call itoa  ; conversion entier en  .asciz
      0088FB 7B 01            [ 1] 1701 1$: ld a,(WIDTH,sp)
      0088FD 27 1F            [ 1] 1702 	jreq 4$
      0088FF C7 00 0E         [ 1] 1703 	ld acc8,a 
      008902 89               [ 2] 1704 	pushw x 
      008903 CD 82 8B         [ 4] 1705 	call strlen 
      008906 9F               [ 1] 1706 	ld a,xl 
      008907 85               [ 2] 1707 	popw x 
      008908 31 00 0E         [ 3] 1708 	exg a,acc8 
      00890B C0 00 0E         [ 1] 1709 	sub a,acc8 
      00890E 2B 0E            [ 1] 1710 	jrmi 4$
      008910 6B 01            [ 1] 1711 	ld (WIDTH,sp),a 
      008912 A6 20            [ 1] 1712 	ld  a,#SPACE
      008914 0D 01            [ 1] 1713 3$: tnz (WIDTH,sp)
      008916 27 06            [ 1] 1714 	jreq 4$
      008918 5A               [ 2] 1715 	decw x 
      008919 F7               [ 1] 1716 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      00891A 0A 01            [ 1] 1717 	dec (WIDTH,sp) 
      00891C 20 F6            [ 2] 1718 	jra 3$
      00891E                       1719 4$: 
      00891E CD 82 57         [ 4] 1720 	call puts 
      008921 0D 03            [ 1] 1721 	tnz (ADD_SPACE,sp)
      008923 27 05            [ 1] 1722 	jreq 5$
      008925 A6 20            [ 1] 1723     ld a,#SPACE 
      008927 CD 82 44         [ 4] 1724 	call putc 
      0008AA                       1725 5$: _drop VSIZE 
      00892A 5B 03            [ 2]    1     addw sp,#VSIZE 
      00892C 81               [ 4] 1726     ret	
                                   1727 
                                   1728 ;-----------------------------------
                                   1729 ; print a 16 bit integer 
                                   1730 ; using variable 'base' as conversion
                                   1731 ; format.
                                   1732 ; input:
                                   1733 ;   X       integer to print 
                                   1734 ;   base    conversion base 
                                   1735 ; output:
                                   1736 ;   none 
                                   1737 ;-----------------------------------
                           000001  1738 	SIGN=1
                           000001  1739 	VSIZE=1
      00892D                       1740 print_int: 
      0008AD                       1741 	_vars VSIZE 
      00892D 52 01            [ 2]    1     sub sp,#VSIZE 
      00892F 0F 01            [ 1] 1742 	clr (SIGN,sp)
      008931 90 AE 17 5F      [ 2] 1743 	ldw y,#pad+PAD_SIZE-1 
      008935 90 7F            [ 1] 1744 	clr (y)
      008937 C6 00 0B         [ 1] 1745 	ld a,base  
      00893A A1 0A            [ 1] 1746 	cp a,#10 
      00893C 26 06            [ 1] 1747 	jrne 1$ 
      00893E 5D               [ 2] 1748 	tnzw x 
      00893F 2A 03            [ 1] 1749 	jrpl 1$ 
      008941 03 01            [ 1] 1750 	cpl (SIGN,sp)
      008943 50               [ 2] 1751 	negw x 	 
      008944                       1752 1$:	
      008944 C6 00 0B         [ 1] 1753 	ld a,base 
      008947 62               [ 2] 1754 	div x,a 
      008948 AB 30            [ 1] 1755 	add a,#'0 
      00894A A1 3A            [ 1] 1756 	cp a,#'9+1 
      00894C 2B 02            [ 1] 1757 	jrmi 2$ 
      00894E AB 07            [ 1] 1758 	add a,#7 
      008950 90 5A            [ 2] 1759 2$: decw y 
      008952 90 F7            [ 1] 1760 	ld (y),a 
      008954 5D               [ 2] 1761 	tnzw x 
      008955 26 ED            [ 1] 1762 	jrne 1$ 
      008957 A6 10            [ 1] 1763 	ld a,#16 
      008959 C1 00 0B         [ 1] 1764 	cp a,base 
      00895C 26 08            [ 1] 1765 	jrne 3$
      00895E A6 24            [ 1] 1766 	ld a,#'$
      008960 90 5A            [ 2] 1767 	decw y  
      008962 90 F7            [ 1] 1768 	ld (y),a
      008964 20 0A            [ 2] 1769 	jra 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008966 0D 01            [ 1] 1770 3$: tnz (SIGN,sp)
      008968 27 06            [ 1] 1771 	jreq 9$ 
      00896A A6 2D            [ 1] 1772 	ld a,#'-
      00896C 90 5A            [ 2] 1773 	decw y  
      00896E 90 F7            [ 1] 1774 	ld (y),a
      008970                       1775 9$:	
      008970 93               [ 1] 1776 	ldw x,y 
      008971 1D 17 5F         [ 2] 1777 	subw x,#pad+PAD_SIZE-1 
      008974 50               [ 2] 1778 	negw x  
      008975                       1779 10$:
      008975 9F               [ 1] 1780 	ld a,xl 
      008976 C1 00 27         [ 1] 1781 	cp a,tab_width
      008979 24 09            [ 1] 1782 	jruge 12$
      00897B 90 5A            [ 2] 1783 	decw y 
      00897D A6 20            [ 1] 1784 	ld a,#SPACE 
      00897F 90 F7            [ 1] 1785 	ld (y),a
      008981 5C               [ 2] 1786 	incw x 
      008982 20 F1            [ 2] 1787 	jra 10$ 
      008984                       1788 12$:
      008984 93               [ 1] 1789     ldw x,y 
      008985 CD 82 57         [ 4] 1790 	call puts  
      000908                       1791 	_drop VSIZE 
      008988 5B 01            [ 2]    1     addw sp,#VSIZE 
      00898A 81               [ 4] 1792 	ret 
                                   1793 
                                   1794 ;------------------------------------
                                   1795 ; convert integer in acc24 to string
                                   1796 ; input:
                                   1797 ;   A	  	base
                                   1798 ;	acc24	integer to convert
                                   1799 ; output:
                                   1800 ;   X  		pointer to string
                                   1801 ;------------------------------------
                           000001  1802 	SIGN=1  ; integer sign 
                           000002  1803 	BASE=2  ; numeric base 
                           000002  1804 	VSIZE=2  ;locals size
      00898B                       1805 itoa:
      00898B 52 02            [ 2] 1806 	sub sp,#VSIZE
      00898D 6B 02            [ 1] 1807 	ld (BASE,sp), a  ; base
      00898F 0F 01            [ 1] 1808 	clr (SIGN,sp)    ; sign
      008991 A1 0A            [ 1] 1809 	cp a,#10
      008993 26 0A            [ 1] 1810 	jrne 1$
                                   1811 	; base 10 string display with negative sign if bit 23==1
      008995 72 0F 00 0C 05   [ 2] 1812 	btjf acc24,#7,1$
      00899A 03 01            [ 1] 1813 	cpl (SIGN,sp)
      00899C CD 8A 34         [ 4] 1814 	call neg_acc24
      00899F                       1815 1$:
                                   1816 ; initialize string pointer 
      00899F AE 17 5F         [ 2] 1817 	ldw x,#pad+PAD_SIZE-1
      0089A2 7F               [ 1] 1818 	clr (x)
      0089A3                       1819 itoa_loop:
      0089A3 7B 02            [ 1] 1820     ld a,(BASE,sp)
      0089A5 CD 89 D2         [ 4] 1821     call divu24_8 ; acc24/A 
      0089A8 AB 30            [ 1] 1822     add a,#'0  ; remainder of division
      0089AA A1 3A            [ 1] 1823     cp a,#'9+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089AC 2B 02            [ 1] 1824     jrmi 2$
      0089AE AB 07            [ 1] 1825     add a,#7 
      0089B0 5A               [ 2] 1826 2$: decw x
      0089B1 F7               [ 1] 1827     ld (x),a
                                   1828 	; if acc24==0 conversion done
      0089B2 C6 00 0C         [ 1] 1829 	ld a,acc24
      0089B5 CA 00 0D         [ 1] 1830 	or a,acc16
      0089B8 CA 00 0E         [ 1] 1831 	or a,acc8
      0089BB 26 E6            [ 1] 1832     jrne itoa_loop
                                   1833 	;conversion done, next add '$' or '-' as required
      0089BD 7B 02            [ 1] 1834 	ld a,(BASE,sp)
      0089BF A1 10            [ 1] 1835 	cp a,#16
      0089C1 27 08            [ 1] 1836 	jreq 8$
      0089C3 7B 01            [ 1] 1837 	ld a,(SIGN,sp)
      0089C5 27 08            [ 1] 1838     jreq 10$
      0089C7 A6 2D            [ 1] 1839     ld a,#'-
      0089C9 20 02            [ 2] 1840 	jra 9$ 
      0089CB A6 24            [ 1] 1841 8$: ld a,#'$ 
      0089CD 5A               [ 2] 1842 9$: decw x
      0089CE F7               [ 1] 1843     ld (x),a
      0089CF                       1844 10$:
      0089CF 5B 02            [ 2] 1845 	addw sp,#VSIZE
      0089D1 81               [ 4] 1846 	ret
                                   1847 
                                   1848 ;-------------------------------------
                                   1849 ; divide uint24_t by uint8_t
                                   1850 ; used to convert uint24_t to string
                                   1851 ; input:
                                   1852 ;	acc24	dividend
                                   1853 ;   A 		divisor
                                   1854 ; output:
                                   1855 ;   acc24	quotient
                                   1856 ;   A		remainder
                                   1857 ;------------------------------------- 
                                   1858 ; offset  on sp of arguments and locals
                           000001  1859 	U8   = 1   ; divisor on stack
                           000001  1860 	VSIZE =1
      0089D2                       1861 divu24_8:
      0089D2 89               [ 2] 1862 	pushw x ; save x
      0089D3 88               [ 1] 1863 	push a 
                                   1864 	; ld dividend UU:MM bytes in X
      0089D4 C6 00 0C         [ 1] 1865 	ld a, acc24
      0089D7 95               [ 1] 1866 	ld xh,a
      0089D8 C6 00 0D         [ 1] 1867 	ld a,acc24+1
      0089DB 97               [ 1] 1868 	ld xl,a
      0089DC 7B 01            [ 1] 1869 	ld a,(U8,SP) ; divisor
      0089DE 62               [ 2] 1870 	div x,a ; UU:MM/U8
      0089DF 88               [ 1] 1871 	push a  ;save remainder
      0089E0 9E               [ 1] 1872 	ld a,xh
      0089E1 C7 00 0C         [ 1] 1873 	ld acc24,a
      0089E4 9F               [ 1] 1874 	ld a,xl
      0089E5 C7 00 0D         [ 1] 1875 	ld acc24+1,a
      0089E8 84               [ 1] 1876 	pop a
      0089E9 95               [ 1] 1877 	ld xh,a
      0089EA C6 00 0E         [ 1] 1878 	ld a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089ED 97               [ 1] 1879 	ld xl,a
      0089EE 7B 01            [ 1] 1880 	ld a,(U8,sp) ; divisor
      0089F0 62               [ 2] 1881 	div x,a  ; R:LL/U8
      0089F1 6B 01            [ 1] 1882 	ld (U8,sp),a ; save remainder
      0089F3 9F               [ 1] 1883 	ld a,xl
      0089F4 C7 00 0E         [ 1] 1884 	ld acc24+2,a
      0089F7 84               [ 1] 1885 	pop a
      0089F8 85               [ 2] 1886 	popw x
      0089F9 81               [ 4] 1887 	ret
                                   1888 
                                   1889 ;--------------------------------------
                                   1890 ; unsigned multiply uint24_t by uint8_t
                                   1891 ; use to convert numerical string to uint24_t
                                   1892 ; input:
                                   1893 ;	acc24	uint24_t 
                                   1894 ;   A		uint8_t
                                   1895 ; output:
                                   1896 ;   acc24   A*acc24
                                   1897 ;-------------------------------------
                                   1898 ; local variables offset  on sp
                           000003  1899 	U8   = 3   ; A pushed on stack
                           000002  1900 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1901 	OVFH = 1  ; multiplication overflow high byte
                           000003  1902 	VSIZE = 3
      0089FA                       1903 mulu24_8:
      0089FA 89               [ 2] 1904 	pushw x    ; save X
                                   1905 	; local variables
      0089FB 88               [ 1] 1906 	push a     ; U8
      0089FC 5F               [ 1] 1907 	clrw x     ; initialize overflow to 0
      0089FD 89               [ 2] 1908 	pushw x    ; multiplication overflow
                                   1909 ; multiply low byte.
      0089FE C6 00 0E         [ 1] 1910 	ld a,acc24+2
      008A01 97               [ 1] 1911 	ld xl,a
      008A02 7B 03            [ 1] 1912 	ld a,(U8,sp)
      008A04 42               [ 4] 1913 	mul x,a
      008A05 9F               [ 1] 1914 	ld a,xl
      008A06 C7 00 0E         [ 1] 1915 	ld acc24+2,a
      008A09 9E               [ 1] 1916 	ld a, xh
      008A0A 6B 02            [ 1] 1917 	ld (OVFL,sp),a
                                   1918 ; multipy middle byte
      008A0C C6 00 0D         [ 1] 1919 	ld a,acc24+1
      008A0F 97               [ 1] 1920 	ld xl,a
      008A10 7B 03            [ 1] 1921 	ld a, (U8,sp)
      008A12 42               [ 4] 1922 	mul x,a
                                   1923 ; add overflow to this partial product
      008A13 72 FB 01         [ 2] 1924 	addw x,(OVFH,sp)
      008A16 9F               [ 1] 1925 	ld a,xl
      008A17 C7 00 0D         [ 1] 1926 	ld acc24+1,a
      008A1A 4F               [ 1] 1927 	clr a
      008A1B A9 00            [ 1] 1928 	adc a,#0
      008A1D 6B 01            [ 1] 1929 	ld (OVFH,sp),a
      008A1F 9E               [ 1] 1930 	ld a,xh
      008A20 6B 02            [ 1] 1931 	ld (OVFL,sp),a
                                   1932 ; multiply most signficant byte	
      008A22 C6 00 0C         [ 1] 1933 	ld a, acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A25 97               [ 1] 1934 	ld xl, a
      008A26 7B 03            [ 1] 1935 	ld a, (U8,sp)
      008A28 42               [ 4] 1936 	mul x,a
      008A29 72 FB 01         [ 2] 1937 	addw x, (OVFH,sp)
      008A2C 9F               [ 1] 1938 	ld a, xl
      008A2D C7 00 0C         [ 1] 1939 	ld acc24,a
      008A30 5B 03            [ 2] 1940     addw sp,#VSIZE
      008A32 85               [ 2] 1941 	popw x
      008A33 81               [ 4] 1942 	ret
                                   1943 
                                   1944 ;------------------------------------
                                   1945 ;  two's complement acc24
                                   1946 ;  input:
                                   1947 ;		acc24 variable
                                   1948 ;  output:
                                   1949 ;		acc24 variable
                                   1950 ;-------------------------------------
      008A34                       1951 neg_acc24:
      008A34 72 53 00 0E      [ 1] 1952 	cpl acc24+2
      008A38 72 53 00 0D      [ 1] 1953 	cpl acc24+1
      008A3C 72 53 00 0C      [ 1] 1954 	cpl acc24
      008A40 A6 01            [ 1] 1955 	ld a,#1
      008A42 CB 00 0E         [ 1] 1956 	add a,acc24+2
      008A45 C7 00 0E         [ 1] 1957 	ld acc24+2,a
      008A48 4F               [ 1] 1958 	clr a
      008A49 C9 00 0D         [ 1] 1959 	adc a,acc24+1
      008A4C C7 00 0D         [ 1] 1960 	ld acc24+1,a 
      008A4F 4F               [ 1] 1961 	clr a 
      008A50 C9 00 0C         [ 1] 1962 	adc a,acc24 
      008A53 C7 00 0C         [ 1] 1963 	ld acc24,a 
      008A56 81               [ 4] 1964 	ret
                                   1965 
                                   1966 
                                   1967 ;------------------------------------
                                   1968 ; read a line of text from terminal
                                   1969 ; input:
                                   1970 ;	none
                                   1971 ; local variable on stack:
                                   1972 ;	LL  line length
                                   1973 ;   RXCHAR last received chaaracte 
                                   1974 ; output:
                                   1975 ;   text in tib  buffer
                                   1976 ;------------------------------------
                                   1977 	; local variables
                           000001  1978 	LL_HB=1
                           000001  1979 	RXCHAR = 1 ; last char received
                           000002  1980 	LL = 2  ; accepted line length
                           000002  1981 	VSIZE=2 
      008A57                       1982 readln:
      008A57 5F               [ 1] 1983 	clrw x 
      008A58 89               [ 2] 1984 	pushw x 
      008A59 90 AE 16 E8      [ 2] 1985  	ldw y,#tib ; input buffer
      008A5D                       1986 readln_loop:
      008A5D CD 82 4D         [ 4] 1987 	call getc
      008A60 6B 01            [ 1] 1988 	ld (RXCHAR,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A62 A1 0D            [ 1] 1989 	cp a,#CR
      008A64 26 03            [ 1] 1990 	jrne 1$
      008A66 CC 8A D2         [ 2] 1991 	jp readln_quit
      008A69 A1 0A            [ 1] 1992 1$:	cp a,#LF 
      008A6B 27 65            [ 1] 1993 	jreq readln_quit
      008A6D A1 08            [ 1] 1994 	cp a,#BS
      008A6F 27 3D            [ 1] 1995 	jreq del_back
      008A71 A1 04            [ 1] 1996 	cp a,#CTRL_D
      008A73 27 2A            [ 1] 1997 	jreq del_ln
      008A75 A1 12            [ 1] 1998 	cp a,#CTRL_R 
      008A77 27 06            [ 1] 1999 	jreq reprint 
                                   2000 ;	cp a,#'[
                                   2001 ;	jreq ansi_seq
      008A79                       2002 final_test:
      008A79 A1 20            [ 1] 2003 	cp a,#SPACE
      008A7B 2A 40            [ 1] 2004 	jrpl accept_char
      008A7D 20 DE            [ 2] 2005 	jra readln_loop
      008A7F                       2006 ansi_seq:
                                   2007 ;	call getc
                                   2008 ;	cp a,#'C 
                                   2009 ;	jreq rigth_arrow
                                   2010 ;	cp a,#'D 
                                   2011 ;	jreq left_arrow 
                                   2012 ;	jra final_test
      008A7F                       2013 right_arrow:
                                   2014 ;	ld a,#BSP 
                                   2015 ;	call putc 
                                   2016 ;	jra realn_loop 
      008A7F                       2017 left_arrow:
                                   2018 ;	jra readln_loop
      008A7F                       2019 reprint: 
      008A7F 0D 02            [ 1] 2020 	tnz (LL,sp)
      008A81 26 DA            [ 1] 2021 	jrne readln_loop
      008A83 AE 16 E8         [ 2] 2022 	ldw x,#tib 
      008A86 CD 82 8B         [ 4] 2023 	call strlen 
      008A89 90 AE 16 E8      [ 2] 2024 	ldw y,#tib 
      008A8D 9F               [ 1] 2025 	ld a,xl
      008A8E 27 CD            [ 1] 2026 	jreq readln_loop
      008A90 6B 02            [ 1] 2027 	ld (LL,sp),a 
      008A92 AE 16 E8         [ 2] 2028 	ldw x,#tib 
      008A95 CD 82 57         [ 4] 2029 	call puts
      008A98 0F 01            [ 1] 2030 	clr (LL_HB,sp)
      008A9A 72 F9 01         [ 2] 2031 	addw y,(LL_HB,sp)
      008A9D 20 BE            [ 2] 2032 	jra readln_loop 
      008A9F                       2033 del_ln:
      008A9F 7B 02            [ 1] 2034 	ld a,(LL,sp)
      008AA1 CD 82 71         [ 4] 2035 	call delete
      008AA4 90 AE 16 E8      [ 2] 2036 	ldw y,#tib
      008AA8 90 7F            [ 1] 2037 	clr (y)
      008AAA 0F 02            [ 1] 2038 	clr (LL,sp)
      008AAC 20 AF            [ 2] 2039 	jra readln_loop
      008AAE                       2040 del_back:
      008AAE 0D 02            [ 1] 2041     tnz (LL,sp)
      008AB0 27 AB            [ 1] 2042     jreq readln_loop
      008AB2 0A 02            [ 1] 2043     dec (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008AB4 90 5A            [ 2] 2044     decw y
      008AB6 90 7F            [ 1] 2045     clr  (y)
      008AB8 CD 82 61         [ 4] 2046     call bksp 
      008ABB 20 A0            [ 2] 2047     jra readln_loop	
      008ABD                       2048 accept_char:
      008ABD A6 4F            [ 1] 2049 	ld a,#TIB_SIZE-1
      008ABF 11 02            [ 1] 2050 	cp a, (LL,sp)
      008AC1 27 9A            [ 1] 2051 	jreq readln_loop
      008AC3 7B 01            [ 1] 2052 	ld a,(RXCHAR,sp)
      008AC5 90 F7            [ 1] 2053 	ld (y),a
      008AC7 0C 02            [ 1] 2054 	inc (LL,sp)
      008AC9 90 5C            [ 2] 2055 	incw y
      008ACB 90 7F            [ 1] 2056 	clr (y)
      008ACD CD 82 44         [ 4] 2057 	call putc 
      008AD0 20 8B            [ 2] 2058 	jra readln_loop
      008AD2                       2059 readln_quit:
      008AD2 90 7F            [ 1] 2060 	clr (y)
      008AD4 7B 02            [ 1] 2061 	ld a,(LL,sp)
      008AD6 C7 00 04         [ 1] 2062 	ld count,a 
      000A59                       2063 	_drop VSIZE 
      008AD9 5B 02            [ 2]    1     addw sp,#VSIZE 
      008ADB A6 0D            [ 1] 2064 	ld a,#CR
      008ADD CD 82 44         [ 4] 2065 	call putc
      008AE0 81               [ 4] 2066 	ret
                                   2067 
                                   2068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           000000  2069 .if DEBUG 	
                                   2070 ;----------------------------
                                   2071 ; command interface
                                   2072 ; only 3 commands:
                                   2073 ;  'q' to resume application
                                   2074 ;  'p [addr]' to print memory values 
                                   2075 ;  's addr' to print string 
                                   2076 ;----------------------------
                                   2077 ;local variable 
                                   2078 	PSIZE=1
                                   2079 	VSIZE=1 
                                   2080 cmd_itf:
                                   2081 	sub sp,#VSIZE 
                                   2082 	clr farptr 
                                   2083 	clr farptr+1 
                                   2084 	clr farptr+2  
                                   2085 repl:
                                   2086 	ld a,#CR 
                                   2087 	call putc 
                                   2088 	ld a,#'? 
                                   2089 	call putc
                                   2090 	clr in.w 
                                   2091 	clr in 
                                   2092 	call readln
                                   2093 	ldw y,#tib  
                                   2094 	ld a,(y)
                                   2095 	jreq repl  
                                   2096 	inc in 
                                   2097 	call to_upper 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2098 	cp a,#'Q 
                                   2099 	jrne test_p
                                   2100 repl_exit:
                                   2101 	clr tib 
                                   2102 	clr count 
                                   2103 	clr in 
                                   2104 	_drop #VSIZE 	
                                   2105 	ret  
                                   2106 invalid:
                                   2107 	ldw x,#invalid_cmd 
                                   2108 	call puts 
                                   2109 	jra repl 
                                   2110 test_p:	
                                   2111     cp a,#'P 
                                   2112 	jreq mem_peek
                                   2113     cp a,#'S 
                                   2114 	jrne invalid 
                                   2115 print_string:	
                                   2116 	call get_token
                                   2117 	cp a,#TK_INTGR 
                                   2118 	jrne invalid 
                                   2119 	call puts
                                   2120 	jp repl 	
                                   2121 mem_peek:
                                   2122 	ld a,#SPACE 
                                   2123 	call skip  	 
                                   2124 	addw y,in.w 
                                   2125 	ldw x,#pad 
                                   2126 	call strcpy
                                   2127 	call atoi24 	
                                   2128 	ld a, acc24 
                                   2129 	or a,acc16 
                                   2130 	or a,acc8 
                                   2131 	jrne 1$ 
                                   2132 	jra peek_byte  
                                   2133 1$:	ldw x,acc24 
                                   2134 	ldw farptr,x 
                                   2135 	ld a,acc8 
                                   2136 	ld farptr+2,a 
                                   2137 peek_byte:
                                   2138 	call print_farptr 
                                   2139 	ld a,#8 
                                   2140 	ld (PSIZE,sp),a 
                                   2141 	clrw x 
                                   2142 1$:	call fetchc  
                                   2143 	pushw x 
                                   2144 	ld acc8,a 
                                   2145 	clrw x 
                                   2146 	ldw acc24,x 
                                   2147 	ld a,#16+128
                                   2148 	call prti24
                                   2149 	popw x 
                                   2150 	dec (PSIZE,sp)
                                   2151 	jrne 1$ 
                                   2152 	ld a,#8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2153 	add a,farptr+2 
                                   2154 	ld farptr+2,a
                                   2155 	clr a 
                                   2156 	adc a,farptr+1 
                                   2157 	ld farptr+1,a 
                                   2158 	clr a 
                                   2159 	adc a,farptr 
                                   2160 	ld farptr,a 
                                   2161 	jp repl  
                                   2162 
                                   2163 invalid_cmd: .asciz "not a command\n" 
                                   2164 
                                   2165 ;----------------------------
                                   2166 ; display farptr address
                                   2167 ;----------------------------
                                   2168 print_farptr:
                                   2169 	ld a ,farptr+2 
                                   2170 	ld acc8,a 
                                   2171 	ldw x,farptr 
                                   2172 	ldw acc24,x 
                                   2173 	clrw x 
                                   2174 	ld a,#16 
                                   2175 	call prti24
                                   2176 	ld a,#SPACE 
                                   2177 	call putc 
                                   2178 	call putc 
                                   2179 	ret
                                   2180 
                                   2181 ;------------------------------------
                                   2182 ; get byte at address farptr[X]
                                   2183 ; input:
                                   2184 ;	 farptr   address to peek
                                   2185 ;    X		  farptr index 	
                                   2186 ; output:
                                   2187 ;	 A 		  byte from memory  
                                   2188 ;    x		  incremented by 1
                                   2189 ;------------------------------------
                                   2190 fetchc: ; @C
                                   2191 	ldf a,([farptr],x)
                                   2192 	incw x
                                   2193 	ret
                                   2194 
                                   2195 
                                   2196 ;------------------------------------
                                   2197 ; expect a number from command line 
                                   2198 ; next argument
                                   2199 ;  input:
                                   2200 ;	  none
                                   2201 ;  output:
                                   2202 ;    acc24   int24_t 
                                   2203 ;------------------------------------
                                   2204 number::
                                   2205 	call get_token
                                   2206 	call atoi24
                                   2207 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2208 .endif ; DEBUG 
                                   2209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2210 
                                   2211 
                                   2212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2213 ;; compiler routines        ;;
                                   2214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2215 ;------------------------------------
                                   2216 ; parse quoted string 
                                   2217 ; input:
                                   2218 ;   Y 	pointer to tib 
                                   2219 ;   X   pointer to pad
                                   2220 ; output:
                                   2221 ;	pad   parsed string
                                   2222 ;   TOS  char* to pad  
                                   2223 ;------------------------------------
                           000001  2224 	PREV = 1
                           000002  2225 	CURR =2 
                           000002  2226 	VSIZE=2 
      008AE1                       2227 parse_quote: ; { -- addr }
      000A61                       2228 	_vars VSIZE 
      008AE1 52 02            [ 2]    1     sub sp,#VSIZE 
      008AE3 4F               [ 1] 2229 	clr a
      008AE4 6B 01            [ 1] 2230 1$:	ld (PREV,sp),a 
      008AE6 72 5C 00 02      [ 1] 2231 2$:	inc in
      008AEA 91 D6 01         [ 4] 2232 	ld a,([in.w],y)
      008AED 27 24            [ 1] 2233 	jreq 6$
      008AEF 6B 02            [ 1] 2234 	ld (CURR,sp),a 
      008AF1 A6 5C            [ 1] 2235 	ld a,#'\
      008AF3 11 01            [ 1] 2236 	cp a, (PREV,sp)
      008AF5 26 0A            [ 1] 2237 	jrne 3$
      008AF7 0F 01            [ 1] 2238 	clr (PREV,sp)
      008AF9 7B 02            [ 1] 2239 	ld a,(CURR,sp)
      008AFB AD 1F            [ 4] 2240 	callr convert_escape
      008AFD F7               [ 1] 2241 	ld (x),a 
      008AFE 5C               [ 2] 2242 	incw x 
      008AFF 20 E5            [ 2] 2243 	jra 2$
      008B01                       2244 3$:
      008B01 7B 02            [ 1] 2245 	ld a,(CURR,sp)
      008B03 A1 5C            [ 1] 2246 	cp a,#'\'
      008B05 27 DD            [ 1] 2247 	jreq 1$
      008B07 A1 22            [ 1] 2248 	cp a,#'"
      008B09 27 04            [ 1] 2249 	jreq 5$ 
      008B0B F7               [ 1] 2250 	ld (x),a 
      008B0C 5C               [ 2] 2251 	incw x 
      008B0D 20 D7            [ 2] 2252 	jra 2$
      008B0F 72 5C 00 02      [ 1] 2253 5$:	inc in 
      008B13 7F               [ 1] 2254 6$: clr (x)
      008B14 AE 17 38         [ 2] 2255 	ldw x,#pad 
      000A97                       2256 	_drop VSIZE
      008B17 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B19 A6 0A            [ 1] 2257 	ld a,#TK_QSTR  
      008B1B 81               [ 4] 2258 	ret 
                                   2259 
                                   2260 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2261 ; called by parse_quote
                                   2262 ; subtitute escaped character 
                                   2263 ; by their ASCII value .
                                   2264 ; input:
                                   2265 ;   A  character following '\'
                                   2266 ; output:
                                   2267 ;   A  substitued char or same if not valid.
                                   2268 ;---------------------------------------
      008B1C                       2269 convert_escape:
      008B1C 89               [ 2] 2270 	pushw x 
      008B1D AE 8B 31         [ 2] 2271 	ldw x,#escaped 
      008B20 F1               [ 1] 2272 1$:	cp a,(x)
      008B21 27 06            [ 1] 2273 	jreq 2$
      008B23 7D               [ 1] 2274 	tnz (x)
      008B24 27 09            [ 1] 2275 	jreq 3$
      008B26 5C               [ 2] 2276 	incw x 
      008B27 20 F7            [ 2] 2277 	jra 1$
      008B29 1D 8B 31         [ 2] 2278 2$: subw x,#escaped 
      008B2C 9F               [ 1] 2279 	ld a,xl 
      008B2D AB 07            [ 1] 2280 	add a,#7
      008B2F 85               [ 2] 2281 3$:	popw x 
      008B30 81               [ 4] 2282 	ret 
                                   2283 
      008B31 61 62 74 6E 76 66 72  2284 escaped: .asciz "abtnvfr"
             00
                                   2285 
                                   2286 ;-------------------------
                                   2287 ; integer parser 
                                   2288 ; input:
                                   2289 ;   X 		point to pad 
                                   2290 ;   Y 		point to tib 
                                   2291 ;   A 	    first digit|'$' 
                                   2292 ; output:  
                                   2293 ;   pad     number string 
                                   2294 ;   X 		integer 
                                   2295 ;   A 		TK_INTGR
                                   2296 ;-------------------------
                           000001  2297 	BASE=1
                           000002  2298 	TCHAR=2 
                           000002  2299 	VSIZE=2 
      008B39                       2300 parse_integer: ; { -- n }
      008B39 4B 00            [ 1] 2301 	push #0 ; TCHAR 
      008B3B A1 24            [ 1] 2302 	cp a,#'$
      008B3D 27 04            [ 1] 2303 	jreq 1$ 
      008B3F 4B 0A            [ 1] 2304 	push #10 ; BASE=10 
      008B41 20 02            [ 2] 2305 	jra 2$ 
      008B43 4B 10            [ 1] 2306 1$: push #16  ; BASE=16
      008B45 F7               [ 1] 2307 2$:	ld (x),a 
      008B46 5C               [ 2] 2308 	incw x 
      008B47 72 5C 00 02      [ 1] 2309 	inc in 
      008B4B 91 D6 01         [ 4] 2310 	ld a,([in.w],y)
      008B4E CD 8D 8E         [ 4] 2311 	call to_upper 
      008B51 6B 02            [ 1] 2312 	ld (TCHAR,sp),a 
      008B53 CD 85 1F         [ 4] 2313 	call is_digit 
      008B56 25 ED            [ 1] 2314 	jrc 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008B58 A6 10            [ 1] 2315 	ld a,#16 
      008B5A 11 01            [ 1] 2316 	cp a,(BASE,sp)
      008B5C 26 0A            [ 1] 2317 	jrne 3$ 
      008B5E 7B 02            [ 1] 2318 	ld a,(TCHAR,sp)
      008B60 A1 41            [ 1] 2319 	cp a,#'A 
      008B62 2B 04            [ 1] 2320 	jrmi 3$ 
      008B64 A1 47            [ 1] 2321 	cp a,#'G 
      008B66 2B DD            [ 1] 2322 	jrmi 2$ 
      008B68 7F               [ 1] 2323 3$:	clr (x)
      008B69 CD 8D 9A         [ 4] 2324 	call atoi24
      008B6C CE 00 0D         [ 2] 2325 	ldw x,acc16 
      008B6F A6 04            [ 1] 2326 	ld a,#TK_INTGR
      000AF1                       2327 	_drop VSIZE  
      008B71 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B73 81               [ 4] 2328 	ret 	
                                   2329 
                                   2330 ;-------------------------
                                   2331 ; binary integer parser 
                                   2332 ; input:
                                   2333 ;   X 		point to pad 
                                   2334 ;   Y 		point to tib 
                                   2335 ;   A 	    '%' 
                                   2336 ; output:  
                                   2337 ;   pad     number string 
                                   2338 ;   X 		integer 
                                   2339 ;   A 		TK_INTGR
                                   2340 ;   TOS     integer 
                                   2341 ;-------------------------
                           000001  2342 	BINARY=1
                           000002  2343 	VSIZE=2
      008B74                       2344 parse_binary: ; { -- n }
      008B74 4B 00            [ 1] 2345 	push #0
      008B76 4B 00            [ 1] 2346 	push #0
      008B78 F7               [ 1] 2347 1$: ld (x),a 
      008B79 5C               [ 2] 2348 	incw x 
      008B7A 72 5C 00 02      [ 1] 2349 	inc in 
      008B7E 91 D6 01         [ 4] 2350 	ld a,([in.w],y)
      008B81 A1 30            [ 1] 2351 	cp a,#'0 
      008B83 27 06            [ 1] 2352 	jreq 2$
      008B85 A1 31            [ 1] 2353 	cp a,#'1 
      008B87 27 02            [ 1] 2354 	jreq 2$ 
      008B89 20 09            [ 2] 2355 	jra bin_exit 
      008B8B A0 30            [ 1] 2356 2$: sub a,#'0	
      008B8D 46               [ 1] 2357 	rrc a 
      008B8E 09 02            [ 1] 2358 	rlc (BINARY+1,sp)
      008B90 09 01            [ 1] 2359 	rlc (BINARY,sp)
      008B92 20 E4            [ 2] 2360 	jra 1$  
      008B94                       2361 bin_exit:
      008B94 7F               [ 1] 2362 	clr (x)
      008B95 1E 01            [ 2] 2363 	ldw x,(BINARY,sp)
      008B97 A6 04            [ 1] 2364 	ld a,#TK_INTGR 	
      000B19                       2365 	_drop VSIZE 
      008B99 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B9B 81               [ 4] 2366 	ret
                                   2367 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2368 ;---------------------------
                                   2369 ;  token begin with a letter,
                                   2370 ;  is keyword or variable. 	
                                   2371 ; input:
                                   2372 ;   X 		point to pad 
                                   2373 ;   Y 		point to text
                                   2374 ;   A 	    first letter  
                                   2375 ; output:
                                   2376 ;   X		exec_addr|var_addr 
                                   2377 ;   A 		TK_CMD 
                                   2378 ;   pad 	keyword|var_name  
                                   2379 ;   TOS     exec_addr|var_addr 
                                   2380 ;--------------------------  
      008B9C                       2381 parse_keyword: ; { -- exec_addr|var_addr}
      008B9C CD 8D 8E         [ 4] 2382 	call to_upper 
      008B9F F7               [ 1] 2383 	ld (x),a 
      008BA0 5C               [ 2] 2384 	incw x 
      008BA1 72 5C 00 02      [ 1] 2385 	inc in 
      008BA5 91 D6 01         [ 4] 2386 	ld a,([in.w],y)
      008BA8 CD 85 0E         [ 4] 2387 	call is_alpha 
      008BAB 25 EF            [ 1] 2388 	jrc parse_keyword 
      008BAD 7F               [ 1] 2389 1$: clr (x)
      008BAE 72 5D 17 39      [ 1] 2390 	tnz pad+1 
      008BB2 26 15            [ 1] 2391 	jrne 2$
                                   2392 ; one letter variable name 
      008BB4 C6 17 38         [ 1] 2393 	ld a,pad 
      008BB7 A0 41            [ 1] 2394 	sub a,#'A 
      008BB9 48               [ 1] 2395 	sll a 
      008BBA 88               [ 1] 2396 	push a 
      008BBB 4B 00            [ 1] 2397 	push #0
      008BBD AE 00 29         [ 2] 2398 	ldw x,#vars 
      008BC0 72 FB 01         [ 2] 2399 	addw x,(1,sp) ; X=var address 
      000B43                       2400 	_drop 2 
      008BC3 5B 02            [ 2]    1     addw sp,#2 
      008BC5 A6 05            [ 1] 2401 	ld a,#TK_VAR 
      008BC7 20 0C            [ 2] 2402 	jra 4$ 
      008BC9                       2403 2$: ; check for keyword, otherwise syntax error.
      000B49                       2404 	_ldx_dict kword_dict
      008BC9 AE A5 C0         [ 2]    1     ldw x,#kword_dict+2
      008BCC CD 8E FC         [ 4] 2405 	call search_dict
      008BCF 4D               [ 1] 2406 	tnz a
      008BD0 26 03            [ 1] 2407 	jrne 4$ 
      008BD2 CC 87 DC         [ 2] 2408 	jp syntax_error
      008BD5 81               [ 4] 2409 4$:	ret  	
                                   2410 
                                   2411 
                                   2412 ;------------------------------------
                                   2413 ; scan text for next token
                                   2414 ; move token in 'pad'
                                   2415 ; input: 
      008BD6                       2416 	none: 
                                   2417 ; use:
                                   2418 ;	Y   pointer to text
                                   2419 ;   X	pointer to pad 
                                   2420 ;   in.w   index in text buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2421 ; output:
                                   2422 ;   A       token attribute 
                                   2423 ;   pad 	token as .asciz
                                   2424 ;   X 		token value   
                                   2425 ;------------------------------------
                                   2426 	; use to check special character 
                                   2427 	.macro _case c t  
                                   2428 	ld a,#c 
                                   2429 	cp a,(TCHAR,sp) 
                                   2430 	jrne t
                                   2431 	.endm 
                                   2432 
                           000001  2433 	TCHAR=1
                           000002  2434 	ATTRIB=2 
                           000002  2435 	VSIZE=2
      008BD6                       2436 get_token: 
      008BD6 90 AE 16 E8      [ 2] 2437 	ldw y,#tib    	
      008BDA C6 00 02         [ 1] 2438 	ld a,in 
      008BDD C1 00 04         [ 1] 2439 	cp a,count 
      008BE0 2B 03            [ 1] 2440 	jrmi 1$
      008BE2 A6 00            [ 1] 2441 	ld a,#TK_NONE 
      008BE4 81               [ 4] 2442 	ret 
      008BE5                       2443 1$:	
      000B65                       2444 	_vars VSIZE
      008BE5 52 02            [ 2]    1     sub sp,#VSIZE 
      008BE7 AE 17 38         [ 2] 2445 	ldw x, #pad
      008BEA A6 20            [ 1] 2446 	ld a,#SPACE
      008BEC CD 8E 0C         [ 4] 2447 	call skip
      008BEF 55 00 02 00 03   [ 1] 2448 	mov in.saved,in 
      008BF4 91 D6 01         [ 4] 2449 	ld a,([in.w],y)
      008BF7 26 07            [ 1] 2450 	jrne str_tst
      008BF9 72 5F 17 38      [ 1] 2451 	clr pad 
      008BFD CC 8D 8B         [ 2] 2452 	jp token_exit ; end of line 
                                   2453 
      008C00                       2454 str_tst: ; check for quoted string  	
      008C00 CD 8D 8E         [ 4] 2455 	call to_upper 
      008C03 6B 01            [ 1] 2456 	ld (TCHAR,sp),a 
      000B85                       2457 	_case '"' nbr_tst
      008C05 A6 22            [ 1]    1 	ld a,#'"' 
      008C07 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C09 26 06            [ 1]    3 	jrne nbr_tst
      008C0B CD 8A E1         [ 4] 2458 	call parse_quote
      008C0E CC 8D 8B         [ 2] 2459 	jp token_exit
      008C11                       2460 nbr_tst: ; check for number 
      008C11 A6 24            [ 1] 2461 	ld a,#'$'
      008C13 11 01            [ 1] 2462 	cp a,(TCHAR,sp) 
      008C15 27 13            [ 1] 2463 	jreq 1$
      008C17 A6 26            [ 1] 2464 	ld a,#'&
      008C19 11 01            [ 1] 2465 	cp a,(TCHAR,sp)
      008C1B 26 06            [ 1] 2466 	jrne 0$
      008C1D CD 8B 74         [ 4] 2467 	call parse_binary ; expect binary integer 
      008C20 CC 8D 8B         [ 2] 2468 	jp token_exit 
      008C23 7B 01            [ 1] 2469 0$:	ld a,(TCHAR,sp)
      008C25 CD 85 1F         [ 4] 2470 	call is_digit
      008C28 24 06            [ 1] 2471 	jrnc 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C2A CD 8B 39         [ 4] 2472 1$:	call parse_integer 
      008C2D CC 8D 8B         [ 2] 2473 	jp token_exit 
      008C30                       2474 3$: 
      000BB0                       2475 	_case '(' bkslsh_tst 
      008C30 A6 28            [ 1]    1 	ld a,#'(' 
      008C32 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C34 26 05            [ 1]    3 	jrne bkslsh_tst
      008C36 A6 0B            [ 1] 2476 	ld a,#TK_LPAREN
      008C38 CC 8D 7B         [ 2] 2477 	jp token_char   	
      008C3B                       2478 bkslsh_tst: ; character token 
      000BBB                       2479 	_case '\',rparnt_tst
      008C3B A6 5C            [ 1]    1 	ld a,#'\' 
      008C3D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3F 26 18            [ 1]    3 	jrne rparnt_tst
      008C41 7B 01            [ 1] 2480 	ld a,(TCHAR,sp)
      008C43 F7               [ 1] 2481 	ld (x),a 
      008C44 5C               [ 2] 2482 	incw x 
      008C45 72 5C 00 02      [ 1] 2483 	inc in 
      008C49 91 D6 01         [ 4] 2484 	ld a,([in.w],y)
      008C4C F7               [ 1] 2485 	ld (x),a 
      008C4D 5C               [ 2] 2486 	incw x 
      008C4E 72 5C 00 02      [ 1] 2487 	inc in  
      008C52 7F               [ 1] 2488 	clr (x) 
      008C53 97               [ 1] 2489 	ld xl,a 
      008C54 A6 03            [ 1] 2490 	ld a,#TK_CHAR 
      008C56 CC 8D 8B         [ 2] 2491 	jp token_exit 
      008C59                       2492 rparnt_tst:		
      000BD9                       2493 	_case ')' colon_tst 
      008C59 A6 29            [ 1]    1 	ld a,#')' 
      008C5B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5D 26 05            [ 1]    3 	jrne colon_tst
      008C5F A6 0C            [ 1] 2494 	ld a,#TK_RPAREN 
      008C61 CC 8D 7B         [ 2] 2495 	jp token_char 
      008C64                       2496 colon_tst:
      000BE4                       2497 	_case ':' comma_tst 
      008C64 A6 3A            [ 1]    1 	ld a,#':' 
      008C66 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C68 26 05            [ 1]    3 	jrne comma_tst
      008C6A A6 01            [ 1] 2498 	ld a,#TK_COLON 
      008C6C CC 8D 7B         [ 2] 2499 	jp token_char 
      008C6F                       2500 comma_tst:
      000BEF                       2501 	_case COMMA sharp_tst 
      008C6F A6 2C            [ 1]    1 	ld a,#COMMA 
      008C71 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C73 26 05            [ 1]    3 	jrne sharp_tst
      008C75 A6 0D            [ 1] 2502 	ld a,#TK_COMMA
      008C77 CC 8D 7B         [ 2] 2503 	jp token_char
      008C7A                       2504 sharp_tst:
      000BFA                       2505 	_case SHARP dash_tst 
      008C7A A6 23            [ 1]    1 	ld a,#SHARP 
      008C7C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7E 26 05            [ 1]    3 	jrne dash_tst
      008C80 A6 0E            [ 1] 2506 	ld a,#TK_SHARP
      008C82 CC 8D 7B         [ 2] 2507 	jp token_char  	 	 
      008C85                       2508 dash_tst: 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000C05                       2509 	_case '-' at_tst 
      008C85 A6 2D            [ 1]    1 	ld a,#'-' 
      008C87 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C89 26 05            [ 1]    3 	jrne at_tst
      008C8B A6 11            [ 1] 2510 	ld a,#TK_MINUS  
      008C8D CC 8D 7B         [ 2] 2511 	jp token_char 
      008C90                       2512 at_tst:
      000C10                       2513 	_case '@' qmark_tst 
      008C90 A6 40            [ 1]    1 	ld a,#'@' 
      008C92 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C94 26 05            [ 1]    3 	jrne qmark_tst
      008C96 A6 02            [ 1] 2514 	ld a,#TK_ARRAY 
      008C98 CC 8D 7B         [ 2] 2515 	jp token_char
      008C9B                       2516 qmark_tst:
      000C1B                       2517 	_case '?' tick_tst 
      008C9B A6 3F            [ 1]    1 	ld a,#'?' 
      008C9D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9F 26 11            [ 1]    3 	jrne tick_tst
      008CA1 7B 01            [ 1] 2518 	ld a,(TCHAR,sp)
      008CA3 F7               [ 1] 2519 	ld (x),a 
      008CA4 5C               [ 2] 2520 	incw x 
      008CA5 7F               [ 1] 2521 	clr (x)
      008CA6 72 5C 00 02      [ 1] 2522 	inc in 
      008CAA A6 06            [ 1] 2523 	ld a,#TK_CMD 
      008CAC AE 94 34         [ 2] 2524 	ldw x,#print 
      008CAF CC 8D 8B         [ 2] 2525 	jp token_exit
      008CB2                       2526 tick_tst: ; ignore comment 
      000C32                       2527 	_case TICK plus_tst 
      008CB2 A6 27            [ 1]    1 	ld a,#TICK 
      008CB4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB6 26 0C            [ 1]    3 	jrne plus_tst
      008CB8 72 5C 00 02      [ 1] 2528 	inc in 
      008CBC A6 06            [ 1] 2529 	ld a,#TK_CMD 
      008CBE AE 95 22         [ 2] 2530 	ldw x,#rem 
      008CC1 CC 8D 8B         [ 2] 2531 	jp token_exit 
      008CC4                       2532 plus_tst:
      000C44                       2533 	_case '+' star_tst 
      008CC4 A6 2B            [ 1]    1 	ld a,#'+' 
      008CC6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC8 26 05            [ 1]    3 	jrne star_tst
      008CCA A6 10            [ 1] 2534 	ld a,#TK_PLUS  
      008CCC CC 8D 7B         [ 2] 2535 	jp token_char 
      008CCF                       2536 star_tst:
      000C4F                       2537 	_case '*' slash_tst 
      008CCF A6 2A            [ 1]    1 	ld a,#'*' 
      008CD1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD3 26 05            [ 1]    3 	jrne slash_tst
      008CD5 A6 20            [ 1] 2538 	ld a,#TK_MULT 
      008CD7 CC 8D 7B         [ 2] 2539 	jp token_char 
      008CDA                       2540 slash_tst: 
      000C5A                       2541 	_case '/' prcnt_tst 
      008CDA A6 2F            [ 1]    1 	ld a,#'/' 
      008CDC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDE 26 05            [ 1]    3 	jrne prcnt_tst
      008CE0 A6 21            [ 1] 2542 	ld a,#TK_DIV 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008CE2 CC 8D 7B         [ 2] 2543 	jp token_char 
      008CE5                       2544 prcnt_tst:
      000C65                       2545 	_case '%' eql_tst 
      008CE5 A6 25            [ 1]    1 	ld a,#'%' 
      008CE7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE9 26 05            [ 1]    3 	jrne eql_tst
      008CEB A6 22            [ 1] 2546 	ld a,#TK_MOD
      008CED CC 8D 7B         [ 2] 2547 	jp token_char  
                                   2548 ; 1 or 2 character tokens 	
      008CF0                       2549 eql_tst:
      000C70                       2550 	_case '=' gt_tst 		
      008CF0 A6 3D            [ 1]    1 	ld a,#'=' 
      008CF2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF4 26 05            [ 1]    3 	jrne gt_tst
      008CF6 A6 32            [ 1] 2551 	ld a,#TK_EQUAL
      008CF8 CC 8D 7B         [ 2] 2552 	jp token_char 
      008CFB                       2553 gt_tst:
      000C7B                       2554 	_case '>' lt_tst 
      008CFB A6 3E            [ 1]    1 	ld a,#'>' 
      008CFD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFF 26 33            [ 1]    3 	jrne lt_tst
      008D01 A6 31            [ 1] 2555 	ld a,#TK_GT 
      008D03 6B 02            [ 1] 2556 	ld (ATTRIB,sp),a 
      008D05 72 5C 00 02      [ 1] 2557 	inc in 
      008D09 91 D6 01         [ 4] 2558 	ld a,([in.w],y)
      008D0C A1 3D            [ 1] 2559 	cp a,#'=
      008D0E 26 0C            [ 1] 2560 	jrne 1$
      008D10 7B 01            [ 1] 2561 	ld a,(TCHAR,sp)
      008D12 F7               [ 1] 2562 	ld (x),a
      008D13 5C               [ 2] 2563 	incw x 
      008D14 A6 3D            [ 1] 2564 	ld a,#'=
      008D16 6B 01            [ 1] 2565 	ld (TCHAR,sp),a 
      008D18 A6 33            [ 1] 2566 	ld a,#TK_GE 
      008D1A 20 5F            [ 2] 2567 	jra token_char  
      008D1C A1 3C            [ 1] 2568 1$: cp a,#'<
      008D1E 26 0C            [ 1] 2569 	jrne 2$
      008D20 7B 01            [ 1] 2570 	ld a,(TCHAR,sp)
      008D22 F7               [ 1] 2571 	ld (x),a
      008D23 5C               [ 2] 2572 	incw x 
      008D24 A6 3C            [ 1] 2573 	ld a,#'<	
      008D26 6B 01            [ 1] 2574 	ld (TCHAR,sp),a 
      008D28 A6 35            [ 1] 2575 	ld a,#TK_NE 
      008D2A 20 4F            [ 2] 2576 	jra token_char 
      008D2C 72 5A 00 02      [ 1] 2577 2$: dec in
      008D30 7B 02            [ 1] 2578 	ld a,(ATTRIB,sp)
      008D32 20 47            [ 2] 2579 	jra token_char 
      008D34                       2580 lt_tst:
      000CB4                       2581 	_case '<' other
      008D34 A6 3C            [ 1]    1 	ld a,#'<' 
      008D36 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D38 26 32            [ 1]    3 	jrne other
      008D3A A6 34            [ 1] 2582 	ld a,#TK_LT 
      008D3C 6B 02            [ 1] 2583 	ld (ATTRIB,sp),a 
      008D3E 72 5C 00 02      [ 1] 2584 	inc in 
      008D42 91 D6 01         [ 4] 2585 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008D45 A1 3D            [ 1] 2586 	cp a,#'=
      008D47 26 0B            [ 1] 2587 	jrne 1$
      008D49 7B 01            [ 1] 2588 	ld a,(TCHAR,sp)
      008D4B F7               [ 1] 2589 	ld (x),a 
      008D4C A6 3D            [ 1] 2590 	ld a,#'=
      008D4E 6B 01            [ 1] 2591 	ld (TCHAR,sp),a 
      008D50 A6 36            [ 1] 2592 	ld a,#TK_LE 
      008D52 20 27            [ 2] 2593 	jra token_char 
      008D54 A1 3E            [ 1] 2594 1$: cp a,#'>
      008D56 26 0C            [ 1] 2595 	jrne 2$
      008D58 7B 01            [ 1] 2596 	ld a,(TCHAR,sp)
      008D5A F7               [ 1] 2597 	ld (x),a 
      008D5B 5C               [ 2] 2598 	incw x 
      008D5C A6 3E            [ 1] 2599 	ld a,#'>
      008D5E 6B 01            [ 1] 2600 	ld (TCHAR,sp),a 
      008D60 A6 35            [ 1] 2601 	ld a,#TK_NE 
      008D62 20 17            [ 2] 2602 	jra token_char 
      008D64 72 5A 00 02      [ 1] 2603 2$: dec in 
      008D68 7B 02            [ 1] 2604 	ld a,(ATTRIB,sp)
      008D6A 20 0F            [ 2] 2605 	jra token_char 	
      008D6C                       2606 other: ; not a special character 	 
      008D6C 7B 01            [ 1] 2607 	ld a,(TCHAR,sp)
      008D6E CD 85 0E         [ 4] 2608 	call is_alpha 
      008D71 25 03            [ 1] 2609 	jrc 30$ 
      008D73 CC 87 DC         [ 2] 2610 	jp syntax_error 
      008D76                       2611 30$: 
      008D76 CD 8B 9C         [ 4] 2612 	call parse_keyword
      008D79 20 10            [ 2] 2613 	jra token_exit 
      008D7B                       2614 token_char:
      008D7B 6B 02            [ 1] 2615 	ld (ATTRIB,sp),a 
      008D7D 7B 01            [ 1] 2616 	ld a,(TCHAR,sp)
      008D7F F7               [ 1] 2617 	ld (x),a 
      008D80 5C               [ 2] 2618 	incw x 
      008D81 7F               [ 1] 2619 	clr(x)
      008D82 72 5C 00 02      [ 1] 2620 	inc in 
      008D86 7B 02            [ 1] 2621 	ld a,(ATTRIB,sp)
      008D88 AE 17 38         [ 2] 2622 	ldw x,#pad 
      008D8B                       2623 token_exit:
      000D0B                       2624 	_drop VSIZE 
      008D8B 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D8D 81               [ 4] 2625 	ret
                                   2626 
                                   2627 
                                   2628 ;------------------------------------
                                   2629 ; convert alpha to uppercase
                                   2630 ; input:
                                   2631 ;    a  character to convert
                                   2632 ; output:
                                   2633 ;    a  uppercase character
                                   2634 ;------------------------------------
      008D8E                       2635 to_upper::
      008D8E A1 61            [ 1] 2636 	cp a,#'a
      008D90 2A 01            [ 1] 2637 	jrpl 1$
      008D92 81               [ 4] 2638 0$:	ret
      008D93 A1 7A            [ 1] 2639 1$: cp a,#'z	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008D95 22 FB            [ 1] 2640 	jrugt 0$
      008D97 A0 20            [ 1] 2641 	sub a,#32
      008D99 81               [ 4] 2642 	ret
                                   2643 	
                                   2644 ;------------------------------------
                                   2645 ; convert pad content in integer
                                   2646 ; input:
                                   2647 ;    pad		.asciz to convert
                                   2648 ; output:
                                   2649 ;    acc24      int24_t
                                   2650 ;------------------------------------
                                   2651 	; local variables
                           000001  2652 	SIGN=1 ; 1 byte, 
                           000002  2653 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2654 	TEMP=3 ; 1 byte, temporary storage
                           000003  2655 	VSIZE=3 ; 3 bytes reserved for local storage
      008D9A                       2656 atoi24:
      008D9A 89               [ 2] 2657 	pushw x ;save x
      008D9B 52 03            [ 2] 2658 	sub sp,#VSIZE
                                   2659 	; acc24=0 
      008D9D 72 5F 00 0C      [ 1] 2660 	clr acc24    
      008DA1 72 5F 00 0D      [ 1] 2661 	clr acc16
      008DA5 72 5F 00 0E      [ 1] 2662 	clr acc8 
      008DA9 C6 17 38         [ 1] 2663 	ld a, pad 
      008DAC 27 5A            [ 1] 2664 	jreq atoi_exit
      008DAE 0F 01            [ 1] 2665 	clr (SIGN,sp)
      008DB0 A6 0A            [ 1] 2666 	ld a,#10
      008DB2 6B 02            [ 1] 2667 	ld (BASE,sp),a ; default base decimal
      008DB4 AE 17 38         [ 2] 2668 	ldw x,#pad ; pointer to string to convert
      008DB7 F6               [ 1] 2669 	ld a,(x)
      008DB8 27 47            [ 1] 2670 	jreq 9$  ; completed if 0
      008DBA A1 2D            [ 1] 2671 	cp a,#'-
      008DBC 26 04            [ 1] 2672 	jrne 1$
      008DBE 03 01            [ 1] 2673 	cpl (SIGN,sp)
      008DC0 20 08            [ 2] 2674 	jra 2$
      008DC2 A1 24            [ 1] 2675 1$: cp a,#'$
      008DC4 26 06            [ 1] 2676 	jrne 3$
      008DC6 A6 10            [ 1] 2677 	ld a,#16
      008DC8 6B 02            [ 1] 2678 	ld (BASE,sp),a
      008DCA 5C               [ 2] 2679 2$:	incw x
      008DCB F6               [ 1] 2680 	ld a,(x)
      008DCC                       2681 3$:	
      008DCC A1 61            [ 1] 2682 	cp a,#'a
      008DCE 2B 02            [ 1] 2683 	jrmi 4$
      008DD0 A0 20            [ 1] 2684 	sub a,#32
      008DD2 A1 30            [ 1] 2685 4$:	cp a,#'0
      008DD4 2B 2B            [ 1] 2686 	jrmi 9$
      008DD6 A0 30            [ 1] 2687 	sub a,#'0
      008DD8 A1 0A            [ 1] 2688 	cp a,#10
      008DDA 2B 06            [ 1] 2689 	jrmi 5$
      008DDC A0 07            [ 1] 2690 	sub a,#7
      008DDE 11 02            [ 1] 2691 	cp a,(BASE,sp)
      008DE0 2A 1F            [ 1] 2692 	jrpl 9$
      008DE2 6B 03            [ 1] 2693 5$:	ld (TEMP,sp),a
      008DE4 7B 02            [ 1] 2694 	ld a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008DE6 CD 89 FA         [ 4] 2695 	call mulu24_8
      008DE9 7B 03            [ 1] 2696 	ld a,(TEMP,sp)
      008DEB CB 00 0E         [ 1] 2697 	add a,acc24+2
      008DEE C7 00 0E         [ 1] 2698 	ld acc24+2,a
      008DF1 4F               [ 1] 2699 	clr a
      008DF2 C9 00 0D         [ 1] 2700 	adc a,acc24+1
      008DF5 C7 00 0D         [ 1] 2701 	ld acc24+1,a
      008DF8 4F               [ 1] 2702 	clr a
      008DF9 C9 00 0C         [ 1] 2703 	adc a,acc24
      008DFC C7 00 0C         [ 1] 2704 	ld acc24,a
      008DFF 20 C9            [ 2] 2705 	jra 2$
      008E01 0D 01            [ 1] 2706 9$:	tnz (SIGN,sp)
      008E03 27 03            [ 1] 2707     jreq atoi_exit
      008E05 CD 8A 34         [ 4] 2708     call neg_acc24
      008E08                       2709 atoi_exit: 
      008E08 5B 03            [ 2] 2710 	addw sp,#VSIZE
      008E0A 85               [ 2] 2711 	popw x ; restore x
      008E0B 81               [ 4] 2712 	ret
                                   2713 
                                   2714 
                                   2715 ;------------------------------------
                                   2716 ; skip character c in text starting from 'in'
                                   2717 ; input:
                                   2718 ;	 y 		point to text buffer
                                   2719 ;    a 		character to skip
                                   2720 ; output:  
                                   2721 ;	'in' ajusted to new position
                                   2722 ;------------------------------------
                           000001  2723 	C = 1 ; local var
      008E0C                       2724 skip:
      008E0C 88               [ 1] 2725 	push a
      008E0D 91 D6 01         [ 4] 2726 1$:	ld a,([in.w],y)
      008E10 27 0A            [ 1] 2727 	jreq 2$
      008E12 11 01            [ 1] 2728 	cp a,(C,sp)
      008E14 26 06            [ 1] 2729 	jrne 2$
      008E16 72 5C 00 02      [ 1] 2730 	inc in
      008E1A 20 F1            [ 2] 2731 	jra 1$
      000D9C                       2732 2$: _drop 1 
      008E1C 5B 01            [ 2]    1     addw sp,#1 
      008E1E 81               [ 4] 2733 	ret
                                   2734 	
                                   2735 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2736 ;;   TINY BASIC  operators,
                                   2737 ;;   commands and functions 
                                   2738 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2739 
                                   2740 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2741 ;;  Arithmetic operators
                                   2742 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2743 
                                   2744 ;--------------------------------
                                   2745 ;  add 2 integers
                                   2746 ;  input:
                                   2747 ;    N1     on cstack 
                                   2748 ;    N2     on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2749 ;  output:
                                   2750 ;    X 		n2+n1 
                                   2751 ;--------------------------------
                                   2752 	;arugments on cstack 
      008E1F                       2753 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000D9F                       2754 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000D9F                       2755 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000D9F                       2756 add:
      008E1F 1E 05            [ 2] 2757 	ldw x ,(N2,sp)
      008E21 72 FB 03         [ 2] 2758 	addw x,(N1,sp)
      008E24 1F 03            [ 2] 2759 	ldw (N1,sp),x 
      008E26 81               [ 4] 2760 	ret 
                                   2761 
                                   2762 ;--------------------------------
                                   2763 ;  substract 2 ntegers
                                   2764 ;  input:
                                   2765 ;    N1     on cstack 
                                   2766 ;    N2     on cstack 
                                   2767 ;  output:
                                   2768 ;    X 		n2+n1 
                                   2769 ;--------------------------------
      008E27                       2770 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000DA7                       2771 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000DA7                       2772 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000DA7                       2773 substract:
      008E27 1E 05            [ 2] 2774 	ldw x,(N2,sp)
      008E29 72 F0 03         [ 2] 2775 	subw x,(N1,sp)
      008E2C 81               [ 4] 2776 	ret 
                                   2777 
                                   2778 ;-------------------------------------
                                   2779 ; multiply 2 integers
                                   2780 ; product overflow is ignored unless
                                   2781 ; MATH_OVF assembler flag is set to 1
                                   2782 ; input:
                                   2783 ;  	N1      on cstack
                                   2784 ;   N2 		on cstack 
                                   2785 ; output:
                                   2786 ;	X        N1*N2 
                                   2787 ;-------------------------------------
                                   2788 	;arguments 
      008E2D                       2789 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000DAD                       2790 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000DAD                       2791 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000DAD                       2792 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000DAD                       2793 	_arg N2_LB 4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000009     1     N2_LB=ARG_OFS+4 
                                   2794    ; local variables 
                           000001  2795 	SIGN=1
                           000002  2796 	PROD=2
                           000003  2797 	VSIZE=3
      000DAD                       2798 multiply:
      000DAD                       2799 	_vars VSIZE 
      008E2D 52 03            [ 2]    1     sub sp,#VSIZE 
      008E2F 0F 01            [ 1] 2800 	clr (SIGN,sp)
      008E31 1E 06            [ 2] 2801 	ldw x,(N1_HB,sp)
      008E33 9E               [ 1] 2802 	ld a,xh  
      008E34 A5 80            [ 1] 2803 	bcp a,#0x80 
      008E36 27 05            [ 1] 2804 	jreq 2$
      008E38 03 01            [ 1] 2805 	cpl (SIGN,sp)
      008E3A 50               [ 2] 2806 	negw x 
      008E3B 1F 06            [ 2] 2807 	ldw (N1_HB,sp),x 
      008E3D 1E 08            [ 2] 2808 2$: ldw x,(N2_HB,sp)
      008E3F 9E               [ 1] 2809 	ld a,xh  
      008E40 A5 80            [ 1] 2810 	bcp a,#0x80 
      008E42 27 05            [ 1] 2811 	jreq 3$
      008E44 03 01            [ 1] 2812 	cpl (SIGN,sp)
      008E46 50               [ 2] 2813 	negw x 
      008E47 1F 08            [ 2] 2814 	ldw (N2_HB,sp),x 
                                   2815 ; N1_LB * N2_LB 	
      008E49 7B 07            [ 1] 2816 3$:	ld a,(N1_LB,sp)
      008E4B 97               [ 1] 2817 	ld xl,a 
      008E4C 7B 09            [ 1] 2818 	ld a,(N2_LB,sp) 
      008E4E 42               [ 4] 2819 	mul x,a 
                           000000  2820 .if MATH_OVF 	
                                   2821 	ld a,xh 
                                   2822 	bcp a,#0x80 
                                   2823 	jreq 4$ 
                                   2824 	ld a,#ERR_MATH_OVF 
                                   2825 	jp tb_error
                                   2826 .endif 	 
      008E4F 1F 02            [ 2] 2827 4$:	ldw (PROD,sp),x
                                   2828 ; N1_LB * N2_HB	 
      008E51 7B 07            [ 1] 2829 	ld a,(N1_LB,sp) 
      008E53 97               [ 1] 2830 	ld xl,a 
      008E54 7B 08            [ 1] 2831 	ld a,(N2_HB,sp)
      008E56 42               [ 4] 2832 	mul x,a
      008E57 9F               [ 1] 2833 	ld a,xl 
      008E58 1B 02            [ 1] 2834 	add a,(PROD,sp)
                           000000  2835 .if MATH_OVF 	
                                   2836 	bcp a,#0x80 
                                   2837 	jreq 5$ 
                                   2838 	ld a,#ERR_MATH_OVF 
                                   2839 	jp tb_error
                                   2840 .endif 	 
      008E5A 6B 02            [ 1] 2841 5$:	ld (PROD,sp),a 
                                   2842 ; N1_HB * N2_LB 
      008E5C 7B 06            [ 1] 2843 	ld a,(N1_HB,sp)
      008E5E 97               [ 1] 2844 	ld xl,a 
      008E5F 7B 09            [ 1] 2845 	ld a,(N2_LB,sp)
      008E61 42               [ 4] 2846 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008E62 9F               [ 1] 2847 	ld a,xl 
      008E63 1B 02            [ 1] 2848 	add a,(PROD,sp)
                           000000  2849 .if MATH_OVF 	
                                   2850 	bcp a,#0x80 
                                   2851 	jreq 6$ 
                                   2852 	ld a,#ERR_MATH_OVF 
                                   2853 	jp tb_error
                                   2854 .endif 	 
      008E65 6B 02            [ 1] 2855 6$:	ld (PROD,sp),a 
                                   2856 ; N1_HB * N2_HB 	
                                   2857 ; it is pointless to multiply N1_HB*N2_HB 
                                   2858 ; as this product is over 65535 or 0 
                                   2859 ;
                                   2860 ; sign adjust product
      008E67 0D 01            [ 1] 2861 	tnz (SIGN,sp)
      008E69 27 05            [ 1] 2862 	jreq 7$
      008E6B 1E 02            [ 2] 2863 	ldw x, (PROD,sp)
      008E6D 50               [ 2] 2864 	negw x
      008E6E 1F 02            [ 2] 2865 	ldw (PROD,sp),x  
      008E70                       2866 7$: 
      008E70 1E 02            [ 2] 2867 	ldw x,(PROD,sp) 
      000DF2                       2868 	_drop VSIZE 
      008E72 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E74 81               [ 4] 2869 	ret
                                   2870 
                                   2871 ;----------------------------------
                                   2872 ;  euclidian divide n2/n1 
                                   2873 ; input:
                                   2874 ;    N2 	on cstack
                                   2875 ;    N1 	on cstack
                                   2876 ; output:
                                   2877 ;    X      n2/n1 
                                   2878 ;    Y      remainder 
                                   2879 ;----------------------------------
      008E75                       2880 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000DF5                       2881 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000DF5                       2882 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2883 	; local variables
                           000001  2884 	SQUOT=1 ; sign quotient
                           000002  2885 	SDIVD=2 ; sign dividend  
                           000002  2886 	VSIZE=2
      000DF5                       2887 divide:
      000DF5                       2888 	_vars VSIZE 
      008E75 52 02            [ 2]    1     sub sp,#VSIZE 
      008E77 0F 01            [ 1] 2889 	clr (SQUOT,sp)
      008E79 0F 02            [ 1] 2890 	clr (SDIVD,sp)
                                   2891 ; check for 0 divisor
      008E7B 1E 05            [ 2] 2892 	ldw x,(DIVISR,sp)
      008E7D 5D               [ 2] 2893 	tnzw x 
      008E7E 26 05            [ 1] 2894     jrne 0$
      008E80 A6 04            [ 1] 2895 	ld a,#ERR_DIV0 
      008E82 CC 87 DE         [ 2] 2896 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2897 ; check divisor sign 	
      008E85 9E               [ 1] 2898 0$:	ld a,xh 
      008E86 A5 80            [ 1] 2899 	bcp a,#0x80 
      008E88 27 03            [ 1] 2900 	jreq 1$
      008E8A 03 01            [ 1] 2901 	cpl (SQUOT,sp)
      008E8C 50               [ 2] 2902 	negw x 
      008E8D 1F 05            [ 2] 2903 1$:	ldw (DIVISR,sp),x
                                   2904 ; check dividend sign 	 
      008E8F 1E 07            [ 2] 2905     ldw x,(DIVIDND,sp)
      008E91 9E               [ 1] 2906 	ld a,xh 
      008E92 A5 80            [ 1] 2907 	bcp a,#0x80 
      008E94 27 05            [ 1] 2908 	jreq 2$ 
      008E96 03 01            [ 1] 2909 	cpl (SQUOT,sp)
      008E98 03 02            [ 1] 2910 	cpl (SDIVD,sp)
      008E9A 50               [ 2] 2911 	negw x 
      008E9B 16 05            [ 2] 2912 2$:	ldw y,(DIVISR,sp)
      008E9D 65               [ 2] 2913 	divw x,y
      008E9E 90 CF 00 0D      [ 2] 2914 	ldw acc16,y 
                                   2915 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008EA2 0D 02            [ 1] 2916 	tnz (SDIVD,sp)
      008EA4 27 0B            [ 1] 2917 	jreq 7$
      008EA6 90 5D            [ 2] 2918 	tnzw y 
      008EA8 27 07            [ 1] 2919 	jreq 7$
      008EAA 5C               [ 2] 2920 	incw x
      008EAB 16 05            [ 2] 2921 	ldw y,(DIVISR,sp)
      008EAD 72 B2 00 0D      [ 2] 2922 	subw y,acc16
      008EB1 0D 01            [ 1] 2923 7$: tnz (SQUOT,sp)
      008EB3 27 01            [ 1] 2924 	jreq 9$ 	 
      008EB5 50               [ 2] 2925 8$:	negw x 
      008EB6                       2926 9$: 
      000E36                       2927 	_drop VSIZE 
      008EB6 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EB8 81               [ 4] 2928 	ret 
                                   2929 
                                   2930 
                                   2931 ;----------------------------------
                                   2932 ;  remainder resulting from euclidian 
                                   2933 ;  division of n2/n1 
                                   2934 ; input:
                                   2935 ;   N1 		cstack 
                                   2936 ;   N2      cstack
                                   2937 ; output:
                                   2938 ;   X       N2%N1 
                                   2939 ;----------------------------------
                           000003  2940 	N1=3
                           000005  2941 	N2=5
                           000004  2942 	VSIZE=4
      008EB9                       2943 modulo:
      008EB9 1E 03            [ 2] 2944 	Ldw x,(N1,sp)
      008EBB 16 05            [ 2] 2945 	ldw y,(N2,sp)
      000E3D                       2946 	_vars VSIZE 
      008EBD 52 04            [ 2]    1     sub sp,#VSIZE 
      008EBF 1F 01            [ 2] 2947 	ldw (1,sp),x 
      008EC1 17 03            [ 2] 2948 	ldw (3,sp),y 
      008EC3 CD 8E 75         [ 4] 2949 	call divide 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      008EC6 93               [ 1] 2950 	ldw x,y
      000E47                       2951 	_drop VSIZE 
      008EC7 5B 04            [ 2]    1     addw sp,#VSIZE 
      008EC9 81               [ 4] 2952 	ret 
                                   2953 
                                   2954 
                                   2955 ;----------------------------------
                                   2956 ; search in kword_dict name
                                   2957 ; from its execution address 
                                   2958 ; input:
                                   2959 ;   X       	execution address 
                                   2960 ; output:
                                   2961 ;   X 			cstr*  | 0 
                                   2962 ;--------------------------------
                           000001  2963 	XADR=1 
                           000003  2964 	LINK=3 
                           000004  2965 	VSIZE=4
      008ECA                       2966 cmd_name:
      000E4A                       2967 	_vars VSIZE 
      008ECA 52 04            [ 2]    1     sub sp,#VSIZE 
      008ECC 72 5F 00 0D      [ 1] 2968 	clr acc16 
      008ED0 1F 01            [ 2] 2969 	ldw (XADR,sp),x  
      008ED2 AE A5 BE         [ 2] 2970 	ldw x,#kword_dict	
      008ED5 1F 03            [ 2] 2971 1$:	ldw (LINK,sp),x
      008ED7 E6 02            [ 1] 2972 	ld a,(2,x)
      008ED9 A4 0F            [ 1] 2973 	and a,#15 
      008EDB C7 00 0E         [ 1] 2974 	ld acc8,a 
      008EDE 1C 00 03         [ 2] 2975 	addw x,#3
      008EE1 72 BB 00 0D      [ 2] 2976 	addw x,acc16
      008EE5 FE               [ 2] 2977 	ldw x,(x) ; execution address 
      008EE6 13 01            [ 2] 2978 	cpw x,(XADR,sp)
      008EE8 27 0A            [ 1] 2979 	jreq 2$
      008EEA 1E 03            [ 2] 2980 	ldw x,(LINK,sp)
      008EEC FE               [ 2] 2981 	ldw x,(x) 
      008EED 1D 00 02         [ 2] 2982 	subw x,#2  
      008EF0 26 E3            [ 1] 2983 	jrne 1$
      008EF2 20 05            [ 2] 2984 	jra 9$
      008EF4 1E 03            [ 2] 2985 2$: ldw x,(LINK,sp)
      008EF6 1C 00 02         [ 2] 2986 	addw x,#2 	
      000E79                       2987 9$:	_drop VSIZE
      008EF9 5B 04            [ 2]    1     addw sp,#VSIZE 
      008EFB 81               [ 4] 2988 	ret
                                   2989 
                                   2990 
                                   2991 ;---------------------------------
                                   2992 ; dictionary search 
                                   2993 ; input:
                                   2994 ;	X 		dictionary entry point 
                                   2995 ;  pad		.asciz name to search 
                                   2996 ; output:
                                   2997 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2998 ;  X		execution address | 0 
                                   2999 ;---------------------------------
                           000001  3000 	NLEN=1 ; cmd length 
                           000002  3001 	YSAVE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           000003  3002 	VSIZE=3 
      008EFC                       3003 search_dict:
      000E7C                       3004 	_vars VSIZE 
      008EFC 52 03            [ 2]    1     sub sp,#VSIZE 
      008EFE 90 93            [ 1] 3005 	ldw y,x 
      008F00                       3006 search_next:	
      008F00 90 F6            [ 1] 3007 	ld a,(y)
      008F02 A4 0F            [ 1] 3008 	and a,#0xf 
      008F04 6B 01            [ 1] 3009 	ld (NLEN,sp),a  
      008F06 AE 17 38         [ 2] 3010 	ldw x,#pad 
      008F09 17 02            [ 2] 3011 	ldw (YSAVE,sp),y
      008F0B 90 5C            [ 2] 3012 	incw y  
      008F0D                       3013 cp_loop:
      008F0D F6               [ 1] 3014 	ld a,(x)
      008F0E 27 1E            [ 1] 3015 	jreq str_match 
      008F10 0D 01            [ 1] 3016 	tnz (NLEN,sp)
      008F12 27 0B            [ 1] 3017 	jreq no_match  
      008F14 90 F1            [ 1] 3018 	cp a,(y)
      008F16 26 07            [ 1] 3019 	jrne no_match 
      008F18 90 5C            [ 2] 3020 	incw y 
      008F1A 5C               [ 2] 3021 	incw x
      008F1B 0A 01            [ 1] 3022 	dec (NLEN,sp)
      008F1D 20 EE            [ 2] 3023 	jra cp_loop 
      008F1F                       3024 no_match:
      008F1F 16 02            [ 2] 3025 	ldw y,(YSAVE,sp) 
      008F21 72 A2 00 02      [ 2] 3026 	subw y,#2 ; move Y to link field
      008F25 4B 00            [ 1] 3027 	push #TK_NONE 
      008F27 90 FE            [ 2] 3028 	ldw y,(y) ; next word link 
      008F29 84               [ 1] 3029 	pop a ; TK_NONE 
      008F2A 27 21            [ 1] 3030 	jreq search_exit  ; not found  
                                   3031 ;try next 
      008F2C 20 D2            [ 2] 3032 	jra search_next
      008F2E                       3033 str_match:
      008F2E 16 02            [ 2] 3034 	ldw y,(YSAVE,sp)
      008F30 90 F6            [ 1] 3035 	ld a,(y)
      008F32 6B 01            [ 1] 3036 	ld (NLEN,sp),a ; needed to test keyword type  
      008F34 A4 0F            [ 1] 3037 	and a,#0xf 
                                   3038 ; move y to procedure address field 	
      008F36 4C               [ 1] 3039 	inc a 
      008F37 C7 00 0E         [ 1] 3040 	ld acc8,a 
      008F3A 72 5F 00 0D      [ 1] 3041 	clr acc16 
      008F3E 72 B9 00 0D      [ 2] 3042 	addw y,acc16 
      008F42 90 FE            [ 2] 3043 	ldw y,(y) ; routine entry point 
                                   3044 ;determine keyword type bits 7:6 
      008F44 7B 01            [ 1] 3045 	ld a,(NLEN,sp)
      008F46 4E               [ 1] 3046 	swap a 
      008F47 A4 0C            [ 1] 3047 	and a,#0xc
      008F49 44               [ 1] 3048 	srl a
      008F4A 44               [ 1] 3049 	srl a 
      008F4B AB 06            [ 1] 3050 	add a,#6
      008F4D                       3051 search_exit: 
      008F4D 93               [ 1] 3052 	ldw x,y ; x=routine address 
      000ECE                       3053 	_drop VSIZE 	 
      008F4E 5B 03            [ 2]    1     addw sp,#VSIZE 
      008F50 81               [ 4] 3054 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3055 
                                   3056 ;---------------------
                                   3057 ; check if next token
                                   3058 ;  is of expected type 
                                   3059 ; input:
                                   3060 ;   A 		 expected token attribute
                                   3061 ;  ouput:
                                   3062 ;   none     if fail call syntax_error 
                                   3063 ;--------------------
      008F51                       3064 expect:
      008F51 88               [ 1] 3065 	push a 
      008F52 CD 88 98         [ 4] 3066 	call next_token 
      008F55 11 01            [ 1] 3067 	cp a,(1,sp)
      008F57 27 03            [ 1] 3068 	jreq 1$
      008F59 CC 87 DC         [ 2] 3069 	jp syntax_error
      008F5C 84               [ 1] 3070 1$: pop a 
      008F5D 81               [ 4] 3071 	ret 
                                   3072 
                                   3073 
                                   3074 ;-------------------------------
                                   3075 ; parse embedded BASIC routines 
                                   3076 ; arguments list.
                                   3077 ; arg_list::=  rel[','rel]*
                                   3078 ; all arguments are of integer type
                                   3079 ; and pushed on stack 
                                   3080 ; input:
                                   3081 ;   none
                                   3082 ; output:
                                   3083 ;   stack{n}   arguments pushed on stack
                                   3084 ;   A 	number of arguments pushed on stack  
                                   3085 ;--------------------------------
      008F5E                       3086 arg_list:
      008F5E 4B 00            [ 1] 3087 	push #0  
      008F60 CD 90 AE         [ 4] 3088 1$: call relation
      008F63 A1 00            [ 1] 3089 	cp a,#TK_NONE 
      008F65 27 1C            [ 1] 3090 	jreq 5$
      008F67 A1 04            [ 1] 3091 	cp a,#TK_INTGR
      008F69 26 13            [ 1] 3092 	jrne 4$
      008F6B                       3093 3$: 
                                   3094 ; swap return address with argument
      008F6B 84               [ 1] 3095 	pop a 
      008F6C 90 85            [ 2] 3096 	popw y 
      008F6E 89               [ 2] 3097 	pushw x 
      008F6F 90 89            [ 2] 3098 	pushw y 
      008F71 4C               [ 1] 3099     inc a
      008F72 88               [ 1] 3100 	push a 
      008F73 CD 88 98         [ 4] 3101 	call next_token 
      008F76 A1 0D            [ 1] 3102 	cp a,#TK_COMMA 
      008F78 27 E6            [ 1] 3103 	jreq 1$ 
      008F7A A1 00            [ 1] 3104 	cp a,#TK_NONE 
      008F7C 27 05            [ 1] 3105 	jreq 5$ 
      000EFE                       3106 4$:	_unget_token 
      008F7E 55 00 03 00 02   [ 1]    1     mov in,in.saved
      008F83 84               [ 1] 3107 5$:	pop a  
      008F84 81               [ 4] 3108 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3109 
                                   3110 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3111 ; parse arguments list 
                                   3112 ; between ()
                                   3113 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008F85                       3114 func_args:
      008F85 85               [ 2] 3115 	popw x
      008F86 CF 00 0F         [ 2] 3116 	ldw tmp16,x  
      008F89 A6 0B            [ 1] 3117 	ld a,#TK_LPAREN 
      008F8B CD 8F 51         [ 4] 3118 	call expect 
      008F8E CD 8F 5E         [ 4] 3119 	call arg_list 
      008F91 88               [ 1] 3120 	push a 
      008F92 A6 0C            [ 1] 3121 	ld a,#TK_RPAREN 
      008F94 CD 8F 51         [ 4] 3122 	call expect 
      008F97 84               [ 1] 3123 	pop a 
      008F98 72 CC 00 0F      [ 5] 3124 	jp [tmp16]
                                   3125 
                                   3126 ;--------------------------------
                                   3127 ;   BASIC commnands 
                                   3128 ;--------------------------------
                                   3129 
                                   3130 ;--------------------------------
                                   3131 ;  arithmetic and relational 
                                   3132 ;  routines
                                   3133 ;  operators precedence
                                   3134 ;  highest to lowest
                                   3135 ;  operators on same row have 
                                   3136 ;  same precedence and are executed
                                   3137 ;  from left to right.
                                   3138 ;	'*','/','%'
                                   3139 ;   '-','+'
                                   3140 ;   '=','>','<','>=','<=','<>','><'
                                   3141 ;   '<>' and '><' are equivalent for not equal.
                                   3142 ;--------------------------------
                                   3143 
                                   3144 ;---------------------
                                   3145 ; return array element
                                   3146 ; address from @(expr)
                                   3147 ; input:
                                   3148 ;   A 		TK_ARRAY
                                   3149 ; output:
                                   3150 ;   A 		TK_INTGR
                                   3151 ;	X 		element address 
                                   3152 ;----------------------
      008F9C                       3153 get_array_element:
      008F9C CD 8F 85         [ 4] 3154 	call func_args 
      008F9F A1 01            [ 1] 3155 	cp a,#1
      008FA1 27 03            [ 1] 3156 	jreq 1$
      008FA3 CC 87 DC         [ 2] 3157 	jp syntax_error
      008FA6 85               [ 2] 3158 1$: popw x 
                                   3159 	; check for bounds 
      008FA7 C3 00 24         [ 2] 3160 	cpw x,array_size 
      008FAA 23 05            [ 2] 3161 	jrule 3$
                                   3162 ; bounds {1..array_size}	
      008FAC A6 0A            [ 1] 3163 2$: ld a,#ERR_BAD_VALUE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008FAE CC 87 DE         [ 2] 3164 	jp tb_error 
      008FB1 5D               [ 2] 3165 3$: tnzw  x
      008FB2 27 F8            [ 1] 3166 	jreq 2$ 
      008FB4 58               [ 2] 3167 	sllw x 
      008FB5 89               [ 2] 3168 	pushw x 
      008FB6 AE 16 E8         [ 2] 3169 	ldw x,#tib
      008FB9 72 F0 01         [ 2] 3170 	subw x,(1,sp)
      000F3C                       3171 	_drop 2   
      008FBC 5B 02            [ 2]    1     addw sp,#2 
      008FBE A6 04            [ 1] 3172 	ld a,#TK_INTGR
      008FC0 81               [ 4] 3173 	ret 
                                   3174 
                                   3175 ;***********************************
                                   3176 ;   expression parse,execute 
                                   3177 ;***********************************
                                   3178 ;-----------------------------------
                                   3179 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3180 ;			 integer | function |
                                   3181 ;			 '('relation')' 
                                   3182 ; output:
                                   3183 ;   A    token attribute 
                                   3184 ;   X 	 integer
                                   3185 ; ---------------------------------
                           000001  3186 	NEG=1
                           000001  3187 	VSIZE=1
      008FC1                       3188 factor:
      000F41                       3189 	_vars VSIZE 
      008FC1 52 01            [ 2]    1     sub sp,#VSIZE 
      008FC3 CD 88 98         [ 4] 3190 	call next_token
      008FC6 A1 02            [ 1] 3191 	cp a,#CMD_END 
      008FC8 2B 4E            [ 1] 3192 	jrmi 20$
      008FCA 6B 01            [ 1] 3193 1$:	ld (NEG,sp),a 
      008FCC A4 30            [ 1] 3194 	and a,#TK_GRP_MASK
      008FCE A1 10            [ 1] 3195 	cp a,#TK_GRP_ADD 
      008FD0 27 04            [ 1] 3196 	jreq 2$
      008FD2 7B 01            [ 1] 3197 	ld a,(NEG,sp)
      008FD4 20 03            [ 2] 3198 	jra 4$  
      008FD6                       3199 2$:	
      008FD6 CD 88 98         [ 4] 3200 	call next_token 
      008FD9                       3201 4$:	
      008FD9 A1 07            [ 1] 3202 	cp a,#TK_IFUNC 
      008FDB 26 03            [ 1] 3203 	jrne 5$ 
      008FDD FD               [ 4] 3204 	call (x) 
      008FDE 20 2F            [ 2] 3205 	jra 18$ 
      008FE0                       3206 5$:
      008FE0 A1 04            [ 1] 3207 	cp a,#TK_INTGR
      008FE2 26 02            [ 1] 3208 	jrne 6$
      008FE4 20 29            [ 2] 3209 	jra 18$
      008FE6                       3210 6$:
      008FE6 A1 02            [ 1] 3211 	cp a,#TK_ARRAY
      008FE8 26 06            [ 1] 3212 	jrne 10$
      008FEA CD 8F 9C         [ 4] 3213 	call get_array_element
      008FED FE               [ 2] 3214 	ldw x,(x)
      008FEE 20 1F            [ 2] 3215 	jra 18$ 
      008FF0                       3216 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008FF0 A1 05            [ 1] 3217 	cp a,#TK_VAR 
      008FF2 26 03            [ 1] 3218 	jrne 12$
      008FF4 FE               [ 2] 3219 	ldw x,(x)
      008FF5 20 18            [ 2] 3220 	jra 18$
      008FF7                       3221 12$:			
      008FF7 A1 0B            [ 1] 3222 	cp a,#TK_LPAREN
      008FF9 26 0C            [ 1] 3223 	jrne 16$
      008FFB CD 90 AE         [ 4] 3224 	call relation
      008FFE 89               [ 2] 3225 	pushw x 
      008FFF A6 0C            [ 1] 3226 	ld a,#TK_RPAREN 
      009001 CD 8F 51         [ 4] 3227 	call expect
      009004 85               [ 2] 3228 	popw x 
      009005 20 08            [ 2] 3229 	jra 18$	
      009007                       3230 16$:
      000F87                       3231 	_unget_token
      009007 55 00 03 00 02   [ 1]    1     mov in,in.saved
      00900C 4F               [ 1] 3232 	clr a 
      00900D 20 09            [ 2] 3233 	jra 20$ 
      00900F                       3234 18$: 
      00900F A6 11            [ 1] 3235 	ld a,#TK_MINUS 
      009011 11 01            [ 1] 3236 	cp a,(NEG,sp)
      009013 26 01            [ 1] 3237 	jrne 19$
      009015 50               [ 2] 3238 	negw x
      009016                       3239 19$:
      009016 A6 04            [ 1] 3240 	ld a,#TK_INTGR
      009018                       3241 20$:
      000F98                       3242 	_drop VSIZE
      009018 5B 01            [ 2]    1     addw sp,#VSIZE 
      00901A 81               [ 4] 3243 	ret
                                   3244 
                                   3245 ;-----------------------------------
                                   3246 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3247 ; output:
                                   3248 ;   A    	token attribute 
                                   3249 ;	X		integer
                                   3250 ;-----------------------------------
                           000001  3251 	N1=1
                           000003  3252 	N2=3
                           000005  3253 	MULOP=5
                           000005  3254 	VSIZE=5
      00901B                       3255 term:
      000F9B                       3256 	_vars VSIZE
      00901B 52 05            [ 2]    1     sub sp,#VSIZE 
      00901D CD 8F C1         [ 4] 3257 	call factor
      009020 A1 02            [ 1] 3258 	cp a,#CMD_END
      009022 2B 43            [ 1] 3259 	jrmi term_exit
      009024                       3260 term01:	 ; check for  operator 
      009024 1F 03            [ 2] 3261 	ldw (N2,sp),x  ; save first factor 
      009026 CD 88 98         [ 4] 3262 	call next_token
      009029 A1 02            [ 1] 3263 	cp a,#CMD_END
      00902B 2B 36            [ 1] 3264 	jrmi 9$
      00902D 6B 05            [ 1] 3265 0$:	ld (MULOP,sp),a
      00902F A4 30            [ 1] 3266 	and a,#TK_GRP_MASK
      009031 A1 20            [ 1] 3267 	cp a,#TK_GRP_MULT
      009033 27 09            [ 1] 3268 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009035 7B 05            [ 1] 3269 	ld a,(MULOP,sp) 
      000FB7                       3270 	_unget_token 
      009037 55 00 03 00 02   [ 1]    1     mov in,in.saved
      00903C 20 25            [ 2] 3271 	jra 9$
      00903E                       3272 1$:	; got *|/|%
      00903E CD 8F C1         [ 4] 3273 	call factor
      009041 A1 04            [ 1] 3274 	cp a,#TK_INTGR
      009043 27 03            [ 1] 3275 	jreq 2$ 
      009045 CC 87 DC         [ 2] 3276 	jp syntax_error
      009048 1F 01            [ 2] 3277 2$:	ldw (N1,sp),x  
      00904A 7B 05            [ 1] 3278 	ld a,(MULOP,sp) 
      00904C A1 20            [ 1] 3279 	cp a,#TK_MULT 
      00904E 26 05            [ 1] 3280 	jrne 3$
      009050 CD 8E 2D         [ 4] 3281 	call multiply 
      009053 20 CF            [ 2] 3282 	jra term01
      009055 A1 21            [ 1] 3283 3$: cp a,#TK_DIV 
      009057 26 05            [ 1] 3284 	jrne 4$ 
      009059 CD 8E 75         [ 4] 3285 	call divide 
      00905C 20 C6            [ 2] 3286 	jra term01 
      00905E CD 8E B9         [ 4] 3287 4$: call modulo
      009061 20 C1            [ 2] 3288 	jra term01 
      009063 1E 03            [ 2] 3289 9$: ldw x,(N2,sp)  
      009065 A6 04            [ 1] 3290 	ld a,#TK_INTGR 	
      009067                       3291 term_exit:
      000FE7                       3292 	_drop VSIZE 
      009067 5B 05            [ 2]    1     addw sp,#VSIZE 
      009069 81               [ 4] 3293 	ret 
                                   3294 
                                   3295 ;-------------------------------
                                   3296 ;  expr ::= term [['+'|'-'] term]*
                                   3297 ;  result range {-32768..32767}
                                   3298 ;  output:
                                   3299 ;   A    token attribute 
                                   3300 ;   X	 integer   
                                   3301 ;-------------------------------
                           000001  3302 	N1=1 
                           000003  3303 	N2=3
                           000005  3304 	OP=5 
                           000005  3305 	VSIZE=5 
      00906A                       3306 expression:
      000FEA                       3307 	_vars VSIZE 
      00906A 52 05            [ 2]    1     sub sp,#VSIZE 
      00906C CD 90 1B         [ 4] 3308 	call term
      00906F A1 02            [ 1] 3309 	cp a,#CMD_END 
      009071 2B 38            [ 1] 3310 	jrmi expr_exit 
      009073 1F 03            [ 2] 3311 0$:	ldw (N2,sp),x 
      009075 CD 88 98         [ 4] 3312 	call next_token
      009078 A1 02            [ 1] 3313 	cp a,#CMD_END 
      00907A 2B 2B            [ 1] 3314 	jrmi 9$ 
      00907C 6B 05            [ 1] 3315 1$:	ld (OP,sp),a  
      00907E A4 30            [ 1] 3316 	and a,#TK_GRP_MASK
      009080 A1 10            [ 1] 3317 	cp a,#TK_GRP_ADD 
      009082 27 07            [ 1] 3318 	jreq 2$ 
      001004                       3319 	_unget_token
      009084 55 00 03 00 02   [ 1]    1     mov in,in.saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009089 20 1C            [ 2] 3320 	jra 9$
      00908B                       3321 2$: 
      00908B CD 90 1B         [ 4] 3322 	call term
      00908E A1 04            [ 1] 3323 	cp a,#TK_INTGR 
      009090 27 03            [ 1] 3324 	jreq 3$
      009092 CC 87 DC         [ 2] 3325 	jp syntax_error
      009095 1F 01            [ 2] 3326 3$:	ldw (N1,sp),x 
      009097 7B 05            [ 1] 3327 	ld a,(OP,sp)
      009099 A1 10            [ 1] 3328 	cp a,#TK_PLUS 
      00909B 26 05            [ 1] 3329 	jrne 4$
      00909D CD 8E 1F         [ 4] 3330 	call add 
      0090A0 20 D1            [ 2] 3331 	jra 0$ 
      0090A2 CD 8E 27         [ 4] 3332 4$:	call substract
      0090A5 20 CC            [ 2] 3333 	jra 0$
      0090A7 1E 03            [ 2] 3334 9$: ldw x,(N2,sp)
      0090A9 A6 04            [ 1] 3335 	ld a,#TK_INTGR	
      0090AB                       3336 expr_exit:
      00102B                       3337 	_drop VSIZE 
      0090AB 5B 05            [ 2]    1     addw sp,#VSIZE 
      0090AD 81               [ 4] 3338 	ret 
                                   3339 
                                   3340 ;---------------------------------------------
                                   3341 ; rel ::= expr rel_op expr
                                   3342 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3343 ;  relation return 1 | 0  for true | false 
                                   3344 ;  output:
                                   3345 ;    A 		token attribute  
                                   3346 ;	 X		1|0
                                   3347 ;---------------------------------------------
                           000001  3348 	N1=1
                           000003  3349 	N2=3
                           000005  3350 	RELOP=5
                           000005  3351 	VSIZE=5 
      0090AE                       3352 relation: 
      00102E                       3353 	_vars VSIZE
      0090AE 52 05            [ 2]    1     sub sp,#VSIZE 
      0090B0 CD 90 6A         [ 4] 3354 	call expression
      0090B3 A1 02            [ 1] 3355 	cp a,#CMD_END  
      0090B5 2B 4B            [ 1] 3356 	jrmi rel_exit 
                                   3357 	; expect rel_op or leave 
      0090B7 1F 03            [ 2] 3358 	ldw (N2,sp),x 
      0090B9 CD 88 98         [ 4] 3359 	call next_token 
      0090BC A1 02            [ 1] 3360 	cp a,#CMD_END 
      0090BE 2B 3E            [ 1] 3361 	jrmi 9$
      0090C0                       3362 1$:	
      0090C0 6B 05            [ 1] 3363 	ld (RELOP,sp),a 
      0090C2 A4 30            [ 1] 3364 	and a,#TK_GRP_MASK
      0090C4 A1 30            [ 1] 3365 	cp a,#TK_GRP_RELOP 
      0090C6 27 07            [ 1] 3366 	jreq 2$
      001048                       3367 	_unget_token  
      0090C8 55 00 03 00 02   [ 1]    1     mov in,in.saved
      0090CD 20 2F            [ 2] 3368 	jra 9$
      0090CF                       3369 2$:	; expect another expression or error 
      0090CF CD 90 6A         [ 4] 3370 	call expression
      0090D2 A1 04            [ 1] 3371 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0090D4 27 03            [ 1] 3372 	jreq 3$
      0090D6 CC 87 DC         [ 2] 3373 	jp syntax_error 
      0090D9 1F 01            [ 2] 3374 3$:	ldw (N1,sp),x 
      0090DB CD 8E 27         [ 4] 3375 	call substract
      0090DE 26 06            [ 1] 3376 	jrne 4$
      0090E0 35 02 00 0E      [ 1] 3377 	mov acc8,#2 ; n1==n2
      0090E4 20 0C            [ 2] 3378 	jra 6$ 
      0090E6                       3379 4$: 
      0090E6 2C 06            [ 1] 3380 	jrsgt 5$  
      0090E8 35 04 00 0E      [ 1] 3381 	mov acc8,#4 ; n1<2 
      0090EC 20 04            [ 2] 3382 	jra 6$
      0090EE                       3383 5$:
      0090EE 35 01 00 0E      [ 1] 3384 	mov acc8,#1 ; n1>n2 
      0090F2                       3385 6$:
      0090F2 5F               [ 1] 3386 	clrw x 
      0090F3 C6 00 0E         [ 1] 3387 	ld a, acc8  
      0090F6 14 05            [ 1] 3388 	and a,(RELOP,sp)
      0090F8 4D               [ 1] 3389 	tnz a 
      0090F9 27 05            [ 1] 3390 	jreq 10$
      0090FB 5C               [ 2] 3391 	incw x 
      0090FC                       3392 7$:	 
      0090FC 20 02            [ 2] 3393 	jra 10$  	
      0090FE 1E 03            [ 2] 3394 9$: ldw x,(N2,sp)
      009100                       3395 10$:
      009100 A6 04            [ 1] 3396 	ld a,#TK_INTGR
      009102                       3397 rel_exit: 	 
      001082                       3398 	_drop VSIZE
      009102 5B 05            [ 2]    1     addw sp,#VSIZE 
      009104 81               [ 4] 3399 	ret 
                                   3400 
                                   3401 ;--------------------------------
                                   3402 ; BASIC: SHOW 
                                   3403 ; print stack content in hexadecimal bytes 
                                   3404 ; 16 bytes per row 
                                   3405 ;--------------------------------
                           000001  3406 	TWSAVE=1
                           000002  3407 	BSAVE=2
                           000003  3408 	ADDR=3
                           000004  3409 	VSIZE=4 
      009105                       3410 show:
      001085                       3411 	_vars VSIZE
      009105 52 04            [ 2]    1     sub sp,#VSIZE 
      009107 C6 00 0B         [ 1] 3412 	ld a,base 
      00910A 6B 02            [ 1] 3413 	ld (BSAVE,sp),a
      00910C C6 00 27         [ 1] 3414 	ld a,tab_width
      00910F 6B 01            [ 1] 3415 	ld (TWSAVE,sp),a
      009111 35 10 00 0B      [ 1] 3416 	mov base,#16   
      009115 AE 91 51         [ 2] 3417 	ldw x,#cstk_prompt
      009118 CD 82 57         [ 4] 3418 	call puts 
      00911B 96               [ 1] 3419 	ldw x,sp 
      00911C 1C 00 05         [ 2] 3420 	addw x,#VSIZE+1 ; ignore local vars and return address
      00911F 1F 03            [ 2] 3421 	ldw (ADDR,sp),x 
      009121                       3422 dotr_loop:
      009121 A3 18 00         [ 2] 3423 	cpw x,#RAM_SIZE 
      009124 24 18            [ 1] 3424 	jruge 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009126 A6 10            [ 1] 3425 	ld a,#16 
      009128 90 AE 18 00      [ 2] 3426 	ldw y,#RAM_SIZE  
      00912C 72 F2 03         [ 2] 3427 	subw y,(ADDR,sp)
      00912F 90 A3 00 10      [ 2] 3428 	cpw y,#16 
      009133 24 02            [ 1] 3429 	jruge 2$
      009135 90 9F            [ 1] 3430 	ld a,yl  
      009137                       3431 2$:  
      009137 CD 91 78         [ 4] 3432 	call show_row 
      00913A 1F 03            [ 2] 3433 	ldw (ADDR,sp),x 
      00913C 20 E3            [ 2] 3434 	jra dotr_loop 
      00913E A6 0D            [ 1] 3435 9$:	ld a,#CR 
      009140 CD 82 44         [ 4] 3436 	call putc 
      009143 7B 02            [ 1] 3437 	ld a,(BSAVE,sp)
      009145 C7 00 0B         [ 1] 3438 	ld base,a 
      009148 7B 01            [ 1] 3439 	ld a,(TWSAVE,sp)
      00914A C7 00 27         [ 1] 3440 	ld tab_width,a 
      0010CD                       3441 	_drop VSIZE 
      00914D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00914F 4F               [ 1] 3442 	clr a 
      009150 81               [ 4] 3443 	ret
                                   3444 
      009151 0A 63 6F 6E 74 65 6E  3445 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3446 
                                   3447 ;---------------------
                                   3448 ; display n bytes row 
                                   3449 ; from memory.
                                   3450 ; input:
                                   3451 ;   A   bytes to print 
                                   3452 ;	X   start address 
                                   3453 ; output:
                                   3454 ;   X   address after last shown  
                                   3455 ;---------------------
                           000001  3456 	CNT=1 
                           000002  3457 	ADR=2 
                           000003  3458 	VSIZE=3 
      009178                       3459 show_row:
      009178 4D               [ 1] 3460 	tnz a 
      009179 26 01            [ 1] 3461 	jrne 1$
      00917B 81               [ 4] 3462 	ret 
      00917C                       3463 1$:	
      00917C 89               [ 2] 3464 	pushw x  
      00917D 88               [ 1] 3465 	push a 
      00917E 35 04 00 27      [ 1] 3466 	mov tab_width,#4 
      009182 CD 89 2D         [ 4] 3467 	call print_int 
      009185 A6 20            [ 1] 3468 	ld a,#SPACE  
      009187 CD 82 44         [ 4] 3469 	call putc
      00918A                       3470 row_loop:
      00918A 1E 02            [ 2] 3471 	ldw x,(ADR,sp)
      00918C F6               [ 1] 3472 	ld a,(x)
      00918D 5F               [ 1] 3473 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00918E 97               [ 1] 3474 	ld xl,a 
      00918F CD 89 2D         [ 4] 3475 	call print_int 
      009192 1E 02            [ 2] 3476 	ldw x,(ADR,sp)
      009194 5C               [ 2] 3477 	incw x 
      009195 1F 02            [ 2] 3478 	ldw (ADR,sp),x 
      009197 0A 01            [ 1] 3479 	dec (CNT,sp)
      009199 26 EF            [ 1] 3480 	jrne row_loop
      00111B                       3481 	_drop VSIZE  		
      00919B 5B 03            [ 2]    1     addw sp,#VSIZE 
      00919D 35 04 00 27      [ 1] 3482 	mov tab_width,#4
      0091A1 A6 0D            [ 1] 3483 	ld a,#CR 
      0091A3 CD 82 44         [ 4] 3484 	call putc 
      0091A6 81               [ 4] 3485 	ret 
                                   3486 
                                   3487 ;--------------------------------------------
                                   3488 ; BASIC: HEX 
                                   3489 ; select hexadecimal base for integer print
                                   3490 ;---------------------------------------------
      0091A7                       3491 hex_base:
      0091A7 35 10 00 0B      [ 1] 3492 	mov base,#16 
      0091AB 81               [ 4] 3493 	ret 
                                   3494 
                                   3495 ;--------------------------------------------
                                   3496 ; BASIC: DEC 
                                   3497 ; select decimal base for integer print
                                   3498 ;---------------------------------------------
      0091AC                       3499 dec_base:
      0091AC 35 0A 00 0B      [ 1] 3500 	mov base,#10
      0091B0 81               [ 4] 3501 	ret 
                                   3502 
                                   3503 ;------------------------
                                   3504 ; BASIC: SIZE 
                                   3505 ; return free size in text area
                                   3506 ; output:
                                   3507 ;   A 		TK_INTGR
                                   3508 ;   X 	    size integer
                                   3509 ;--------------------------
      0091B1                       3510 size:
      0091B1 AE 16 E8         [ 2] 3511 	ldw x,#tib 
      0091B4 72 B0 00 21      [ 2] 3512 	subw x,txtend 
      0091B8 A6 04            [ 1] 3513 	ld a,#TK_INTGR
      0091BA 81               [ 4] 3514 	ret 
                                   3515 
                                   3516 
                                   3517 ;------------------------
                                   3518 ; BASIC: UBOUND  
                                   3519 ; return array variable size 
                                   3520 ; output:
                                   3521 ;   A 		TK_INTGR
                                   3522 ;   X 	    array size 
                                   3523 ;--------------------------
      0091BB                       3524 ubound:
      0091BB AE 16 E8         [ 2] 3525 	ldw x,#tib
      0091BE 72 B0 00 21      [ 2] 3526 	subw x,txtend 
      0091C2 90 CE 00 05      [ 2] 3527 	ldw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0091C6 90 C3 00 21      [ 2] 3528 	cpw y,txtend 
      0091CA 25 0A            [ 1] 3529 	jrult 1$
      0091CC 3B 00 04         [ 1] 3530 	push count 
      0091CF 4B 00            [ 1] 3531 	push #0 
      0091D1 72 F0 01         [ 2] 3532 	subw x,(1,sp)
      001154                       3533 	_drop 2 
      0091D4 5B 02            [ 2]    1     addw sp,#2 
      0091D6 54               [ 2] 3534 1$:	srlw x 
      0091D7 CF 00 24         [ 2] 3535 	ldw array_size,x
      0091DA A6 04            [ 1] 3536 	ld a,#TK_INTGR
      0091DC 81               [ 4] 3537 	ret 
                                   3538 
                                   3539 ;-----------------------------
                                   3540 ; BASIC: LET var=expr 
                                   3541 ; variable assignement 
                                   3542 ; output:
                                   3543 ;   A 		TK_NONE 
                                   3544 ;-----------------------------
      0091DD                       3545 let:
      0091DD CD 88 98         [ 4] 3546 	call next_token 
      0091E0 A1 05            [ 1] 3547 	cp a,#TK_VAR 
      0091E2 27 03            [ 1] 3548 	jreq let02
      0091E4 CC 87 DC         [ 2] 3549 	jp syntax_error
      0091E7                       3550 let02:
      0091E7 89               [ 2] 3551 	pushw x  
      0091E8 CD 88 98         [ 4] 3552 	call next_token 
      0091EB A1 32            [ 1] 3553 	cp a,#TK_EQUAL
      0091ED 27 03            [ 1] 3554 	jreq 1$
      0091EF CC 87 DC         [ 2] 3555 	jp syntax_error
      0091F2                       3556 1$:	
      0091F2 CD 90 AE         [ 4] 3557 	call relation   
      0091F5 A1 04            [ 1] 3558 	cp a,#TK_INTGR 
      0091F7 27 03            [ 1] 3559 	jreq 2$
      0091F9 CC 87 DC         [ 2] 3560 	jp syntax_error
      0091FC                       3561 2$:	
      0091FC 90 93            [ 1] 3562 	ldw y,x 
      0091FE 85               [ 2] 3563 	popw x   
      0091FF FF               [ 2] 3564 	ldw (x),y   
      009200 81               [ 4] 3565 	ret 
                                   3566 
                                   3567 ;----------------------------
                                   3568 ; BASIC: LIST [[start][,end]]
                                   3569 ; list program lines 
                                   3570 ; form start to end 
                                   3571 ; if empty argument list then 
                                   3572 ; list all.
                                   3573 ;----------------------------
                           000001  3574 	FIRST=1
                           000003  3575 	LAST=3 
                           000005  3576 	LN_PTR=5
                           000006  3577 	VSIZE=6 
      009201                       3578 list:
      001181                       3579 	_vars VSIZE
      009201 52 06            [ 2]    1     sub sp,#VSIZE 
      009203 CE 00 1F         [ 2] 3580 	ldw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009206 C3 00 21         [ 2] 3581 	cpw x,txtend 
      009209 2B 05            [ 1] 3582 	jrmi 1$
      00920B A6 0D            [ 1] 3583 	ld a,#ERR_NO_PROG 
      00920D CC 87 DE         [ 2] 3584 	jp tb_error ; nothing to list 
      009210 1F 05            [ 2] 3585 1$:	ldw (LN_PTR,sp),x 
      009212 FE               [ 2] 3586 	ldw x,(x) 
      009213 1F 01            [ 2] 3587 	ldw (FIRST,sp),x ; list from first line 
      009215 AE 7F FF         [ 2] 3588 	ldw x,#MAX_LINENO ; biggest line number 
      009218 1F 03            [ 2] 3589 	ldw (LAST,sp),x 
      00921A CD 8F 5E         [ 4] 3590 	call arg_list
      00921D 4D               [ 1] 3591 	tnz a
      00921E 27 34            [ 1] 3592 	jreq list_start 
      009220 A1 02            [ 1] 3593 	cp a,#2 
      009222 27 07            [ 1] 3594 	jreq 4$
      009224 A1 01            [ 1] 3595 	cp a,#1 
      009226 27 06            [ 1] 3596 	jreq first_line 
      009228 CC 87 DC         [ 2] 3597 	jp syntax_error 
      00922B 85               [ 2] 3598 4$:	popw x 
      00922C 1F 03            [ 2] 3599 	ldw (LAST,sp),x 
      00922E                       3600 first_line:
      00922E 85               [ 2] 3601 	popw x 
      00922F 1F 01            [ 2] 3602 	ldw (FIRST,sp),x 
      009231                       3603 lines_skip:
      009231 CE 00 1F         [ 2] 3604 	ldw x,txtbgn
      009234 1F 05            [ 2] 3605 2$:	ldw (LN_PTR,sp),x 
      009236 C3 00 21         [ 2] 3606 	cpw x,txtend 
      009239 2A 3F            [ 1] 3607 	jrpl list_exit 
      00923B FE               [ 2] 3608 	ldw x,(x) ;line# 
      00923C 13 01            [ 2] 3609 	cpw x,(FIRST,sp)
      00923E 2A 14            [ 1] 3610 	jrpl list_start 
      009240 1E 05            [ 2] 3611 	ldw x,(LN_PTR,sp) 
      009242 1C 00 02         [ 2] 3612 	addw x,#2 
      009245 F6               [ 1] 3613 	ld a,(x)
      009246 5C               [ 2] 3614 	incw x 
      009247 C7 00 0E         [ 1] 3615 	ld acc8,a 
      00924A 72 5F 00 0D      [ 1] 3616 	clr acc16 
      00924E 72 BB 00 0D      [ 2] 3617 	addw x,acc16
      009252 20 E0            [ 2] 3618 	jra 2$ 
                                   3619 ; print loop
      009254                       3620 list_start:
      009254 1E 05            [ 2] 3621 	ldw x,(LN_PTR,sp)
      009256 E6 02            [ 1] 3622 3$:	ld a,(2,x) 
      009258 CD 92 CD         [ 4] 3623 	call prt_basic_line
      00925B 1E 05            [ 2] 3624 	ldw x,(LN_PTR,sp)
      00925D E6 02            [ 1] 3625 	ld a,(2,x)
      00925F C7 00 0E         [ 1] 3626 	ld acc8,a 
      009262 72 5F 00 0D      [ 1] 3627 	clr acc16 
      009266 72 BB 00 0D      [ 2] 3628 	addw x,acc16
      00926A C3 00 21         [ 2] 3629 	cpw x,txtend 
      00926D 2A 0B            [ 1] 3630 	jrpl list_exit
      00926F 1F 05            [ 2] 3631 	ldw (LN_PTR,sp),x
      009271 FE               [ 2] 3632 	ldw x,(x)
      009272 13 03            [ 2] 3633 	cpw x,(LAST,sp)  
      009274 2C 04            [ 1] 3634 	jrsgt list_exit 
      009276 1E 05            [ 2] 3635 	ldw x,(LN_PTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009278 20 DC            [ 2] 3636 	jra 3$
      00927A                       3637 list_exit:
      0011FA                       3638 	_drop VSIZE 
      00927A 5B 06            [ 2]    1     addw sp,#VSIZE 
      00927C 81               [ 4] 3639 	ret
                                   3640 
                                   3641 ;-------------------------
                                   3642 ; print counted string 
                                   3643 ; input:
                                   3644 ;   X 	address of string
                                   3645 ;--------------------------
      00927D                       3646 prt_cmd_name:
      00927D F6               [ 1] 3647 	ld a,(x)
      00927E 5C               [ 2] 3648 	incw x
      00927F A4 0F            [ 1] 3649 	and a,#15  
      009281 88               [ 1] 3650 	push a 
      009282 0D 01            [ 1] 3651 1$: tnz (1,sp) 
      009284 27 09            [ 1] 3652 	jreq 9$
      009286 F6               [ 1] 3653 	ld a,(x)
      009287 CD 82 44         [ 4] 3654 	call putc 
      00928A 5C               [ 2] 3655 	incw x
      00928B 0A 01            [ 1] 3656 	dec (1,sp)	 
      00928D 20 F3            [ 2] 3657 	jra 1$
      00928F 84               [ 1] 3658 9$: pop a 
      009290 81               [ 4] 3659 	ret	
                                   3660 
                                   3661 ;--------------------------
                                   3662 ; print TK_QSTR
                                   3663 ; converting control character
                                   3664 ; to backslash sequence
                                   3665 ; input:
                                   3666 ;   X        char *
                                   3667 ;-----------------------------
      009291                       3668 prt_quote:
      009291 A6 22            [ 1] 3669 	ld a,#'"
      009293 CD 82 44         [ 4] 3670 	call putc 
      009296 F6               [ 1] 3671 1$:	ld a,(x)
      009297 27 2D            [ 1] 3672 	jreq 9$
      009299 5C               [ 2] 3673 	incw x 
      00929A A1 20            [ 1] 3674 	cp a,#SPACE 
      00929C 25 0C            [ 1] 3675 	jrult 3$
      00929E CD 82 44         [ 4] 3676 	call putc
      0092A1 A1 5C            [ 1] 3677 	cp a,#'\ 
      0092A3 26 F1            [ 1] 3678 	jrne 1$ 
      0092A5                       3679 2$:
      0092A5 CD 82 44         [ 4] 3680 	call putc 
      0092A8 20 EC            [ 2] 3681 	jra 1$
      0092AA 88               [ 1] 3682 3$: push a 
      0092AB A6 5C            [ 1] 3683 	ld a,#'\
      0092AD CD 82 44         [ 4] 3684 	call putc 
      0092B0 84               [ 1] 3685 	pop a 
      0092B1 A0 07            [ 1] 3686 	sub a,#7
      0092B3 C7 00 0E         [ 1] 3687 	ld acc8,a 
      0092B6 72 5F 00 0D      [ 1] 3688 	clr acc16
      0092BA 90 AE 8B 31      [ 2] 3689 	ldw y,#escaped 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0092BE 72 B9 00 0D      [ 2] 3690 	addw y,acc16 
      0092C2 90 F6            [ 1] 3691 	ld a,(y)
      0092C4 20 DF            [ 2] 3692 	jra 2$
      0092C6 A6 22            [ 1] 3693 9$: ld a,#'"
      0092C8 CD 82 44         [ 4] 3694 	call putc 
      0092CB 5C               [ 2] 3695 	incw x 
      0092CC 81               [ 4] 3696 	ret
                                   3697 
                                   3698 
                                   3699 ;--------------------------
                                   3700 ; decompile line from token list 
                                   3701 ; input:
                                   3702 ;   A       stop at this position 
                                   3703 ;   X 		pointer at line
                                   3704 ; output:
                                   3705 ;   none 
                                   3706 ;--------------------------	
                           000001  3707 	BASE_SAV=1
                           000002  3708 	WIDTH_SAV=2
                           000003  3709 	XSAVE=3
                           000005  3710 	LLEN=5
                           000005  3711 	VSIZE=5 
      0092CD                       3712 prt_basic_line:
      00124D                       3713 	_vars VSIZE
      0092CD 52 05            [ 2]    1     sub sp,#VSIZE 
      0092CF 6B 05            [ 1] 3714 	ld (LLEN,sp),a  
      0092D1 C6 00 0B         [ 1] 3715 	ld a,base
      0092D4 6B 01            [ 1] 3716 	ld (BASE_SAV,sp),a  
      0092D6 C6 00 27         [ 1] 3717 	ld a,tab_width 
      0092D9 6B 02            [ 1] 3718 	ld (WIDTH_SAV,sp),a 
      0092DB CF 00 1A         [ 2] 3719 	ldw ptr16,x
      0092DE FE               [ 2] 3720 	ldw x,(x)
      0092DF 35 0A 00 0B      [ 1] 3721 	mov base,#10
      0092E3 35 05 00 27      [ 1] 3722 	mov tab_width,#5
      0092E7 CD 89 2D         [ 4] 3723 	call print_int ; print line number 
      0092EA A6 20            [ 1] 3724 	ld a,#SPACE 
      0092EC CD 82 44         [ 4] 3725 	call putc 
      0092EF 72 5F 00 27      [ 1] 3726 	clr tab_width
      0092F3 AE 00 03         [ 2] 3727 	ldw x,#3
      0092F6 9F               [ 1] 3728 1$:	ld a,xl 
      0092F7 11 05            [ 1] 3729 	cp a,(LLEN,sp)
      0092F9 2B 03            [ 1] 3730 	jrmi 20$
      0092FB CC 94 00         [ 2] 3731 	jp 90$
      0092FE                       3732 20$:	 
      0092FE 72 D6 00 1A      [ 4] 3733 	ld a,([ptr16],x)
      009302 5C               [ 2] 3734 	incw x 
      009303 1F 03            [ 2] 3735 	ldw (XSAVE,sp),x 
      009305 A1 06            [ 1] 3736 	cp a,#TK_CMD 
      009307 25 44            [ 1] 3737 	jrult 5$
      009309 A1 08            [ 1] 3738 	cp a,#TK_CFUNC 
      00930B 22 2F            [ 1] 3739 	jrugt 4$
      00930D                       3740 2$:	
      00930D 72 DE 00 1A      [ 5] 3741 	ldw x,([ptr16],x)
      009311 A3 95 22         [ 2] 3742 	cpw x,#rem 
      009314 26 14            [ 1] 3743 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009316 A6 27            [ 1] 3744 	ld a,#''
      009318 CD 82 44         [ 4] 3745 	call putc 
      00931B 1E 03            [ 2] 3746 	ldw x,(XSAVE,sp)
      00931D 1C 00 02         [ 2] 3747 	addw x,#2
      009320 72 BB 00 1A      [ 2] 3748 	addw x,ptr16  
      009324 CD 82 57         [ 4] 3749 	call puts 
      009327 CC 94 00         [ 2] 3750 	jp 90$ 
      00932A CD 8E CA         [ 4] 3751 3$:	call cmd_name
      00932D CD 92 7D         [ 4] 3752 	call prt_cmd_name
      009330 A6 20            [ 1] 3753 	ld a,#SPACE 
      009332 CD 82 44         [ 4] 3754 	call putc 
      009335 1E 03            [ 2] 3755 	ldw x,(XSAVE,sp)
      009337 1C 00 02         [ 2] 3756 	addw x,#2
      00933A 20 BA            [ 2] 3757 	jra 1$
      00933C A1 0A            [ 1] 3758 4$: cp a,#TK_QSTR 
      00933E 26 0D            [ 1] 3759 	jrne 5$
      009340 72 BB 00 1A      [ 2] 3760 	addw x,ptr16
      009344 CD 92 91         [ 4] 3761 	call prt_quote 
      009347 72 B0 00 1A      [ 2] 3762 	subw x,ptr16  
      00934B 20 A9            [ 2] 3763 	jra 1$
      00934D A1 05            [ 1] 3764 5$:	cp a,#TK_VAR
      00934F 26 1A            [ 1] 3765 	jrne 6$ 
      009351 72 DE 00 1A      [ 5] 3766 	ldw x,([ptr16],x)
      009355 1D 00 29         [ 2] 3767 	subw x,#vars 
      009358 9F               [ 1] 3768 	ld a,xl
      009359 44               [ 1] 3769 	srl a 
      00935A AB 41            [ 1] 3770 	add a,#'A 
      00935C CD 82 44         [ 4] 3771 	call putc 
      00935F A6 20            [ 1] 3772 	ld a,#SPACE 
      009361 CD 82 44         [ 4] 3773 	call putc 
      009364 1E 03            [ 2] 3774 	ldw x,(XSAVE,sp)
      009366 1C 00 02         [ 2] 3775 	addw x,#2 
      009369 20 8B            [ 2] 3776 	jra 1$ 
      00936B A1 02            [ 1] 3777 6$: cp a,#TK_ARRAY 
      00936D 26 0A            [ 1] 3778 	jrne 7$
      00936F A6 40            [ 1] 3779 	ld a,#'@ 
      009371 CD 82 44         [ 4] 3780 	call putc 
      009374 1E 03            [ 2] 3781 	ldw x,(XSAVE,sp)
      009376 CC 92 F6         [ 2] 3782 	jp 1$ 
      009379 A1 04            [ 1] 3783 7$: cp a,#TK_INTGR 
      00937B 26 0F            [ 1] 3784 	jrne 8$
      00937D 72 DE 00 1A      [ 5] 3785 	ldw x,([ptr16],x)
      009381 CD 89 2D         [ 4] 3786 	call print_int
                                   3787 ;	ld a,#SPACE 
                                   3788 ;	call putc 
      009384 1E 03            [ 2] 3789 	ldw x,(XSAVE,sp)
      009386 1C 00 02         [ 2] 3790 	addw x,#2 
      009389 CC 92 F6         [ 2] 3791 	jp 1$
      00938C A1 31            [ 1] 3792 8$: cp a,#TK_GT 
      00938E 2B 1A            [ 1] 3793 	jrmi 9$
      009390 A1 35            [ 1] 3794 	cp a,#TK_NE 
      009392 22 16            [ 1] 3795 	jrugt 9$
      009394 A0 31            [ 1] 3796 	sub a,#TK_GT  
      009396 48               [ 1] 3797 	sll a 
      009397 90 5F            [ 1] 3798 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009399 90 97            [ 1] 3799 	ld yl,a 
      00939B 72 A9 94 19      [ 2] 3800 	addw y,#relop_str 
      00939F 90 FE            [ 2] 3801 	ldw y,(y)
      0093A1 93               [ 1] 3802 	ldw x,y 
      0093A2 CD 82 57         [ 4] 3803 	call puts 
      0093A5 1E 03            [ 2] 3804 	ldw x,(XSAVE,sp)
      0093A7 CC 92 F6         [ 2] 3805 	jp 1$
      0093AA A1 10            [ 1] 3806 9$: cp a,#TK_PLUS 
      0093AC 26 04            [ 1] 3807 	jrne 10$
      0093AE A6 2B            [ 1] 3808 	ld a,#'+
      0093B0 20 46            [ 2] 3809 	jra 80$ 
      0093B2 A1 11            [ 1] 3810 10$: cp a,#TK_MINUS
      0093B4 26 04            [ 1] 3811 	jrne 11$
      0093B6 A6 2D            [ 1] 3812 	ld a,#'-
      0093B8 20 3E            [ 2] 3813 	jra 80$
      0093BA A1 20            [ 1] 3814 11$: cp a,#TK_MULT 
      0093BC 2B 0E            [ 1] 3815 	jrmi 12$
      0093BE A1 22            [ 1] 3816 	cp a,#TK_MOD 
      0093C0 22 0A            [ 1] 3817 	jrugt 12$
      0093C2 A0 20            [ 1] 3818 	sub a,#0x20
      0093C4 5F               [ 1] 3819 	clrw x 
      0093C5 97               [ 1] 3820 	ld xl,a 
      0093C6 1C 94 16         [ 2] 3821 	addw x,#mul_char 
      0093C9 F6               [ 1] 3822 	ld a,(x)
      0093CA 20 2C            [ 2] 3823 	jra 80$ 
      0093CC A1 0B            [ 1] 3824 12$: cp a,#TK_LPAREN 
      0093CE 2B 0E            [ 1] 3825 	jrmi 13$
      0093D0 A1 0E            [ 1] 3826 	cp a,#TK_SHARP 
      0093D2 22 0A            [ 1] 3827 	jrugt 13$
      0093D4 A0 0B            [ 1] 3828 	sub a,#TK_LPAREN
      0093D6 5F               [ 1] 3829 	clrw x 
      0093D7 97               [ 1] 3830 	ld xl,a 
      0093D8 1C 94 12         [ 2] 3831 	addw x,#single_char 
      0093DB F6               [ 1] 3832 	ld a,(x)
      0093DC 20 1A            [ 2] 3833 	jra 80$
      0093DE A1 03            [ 1] 3834 13$: cp a,#TK_CHAR 
      0093E0 26 14            [ 1] 3835 	jrne 14$
      0093E2 A6 5C            [ 1] 3836 	ld a,#'\
      0093E4 CD 82 44         [ 4] 3837 	call putc 
      0093E7 1E 03            [ 2] 3838 	ldw x,(XSAVE,sp)
      0093E9 72 D6 00 1A      [ 4] 3839 	ld a,([ptr16],x)
      0093ED 5C               [ 2] 3840 	incw x 
      0093EE 1F 03            [ 2] 3841 	ldw (XSAVE,sp),x 
      0093F0 CD 82 44         [ 4] 3842 	call putc 
      0093F3 CC 92 F6         [ 2] 3843 	jp 1$ 
      0093F6 A6 3A            [ 1] 3844 14$: ld a,#':
      0093F8 CD 82 44         [ 4] 3845 80$: call putc 
      0093FB 1E 03            [ 2] 3846 	ldw x,(XSAVE,sp)
      0093FD CC 92 F6         [ 2] 3847 	jp 1$ 
      009400                       3848 90$: 
      009400 A6 0D            [ 1] 3849 	ld a,#CR 
      009402 CD 82 44         [ 4] 3850 	call putc
      009405 7B 02            [ 1] 3851 	ld a,(WIDTH_SAV,sp) 
      009407 C7 00 27         [ 1] 3852 	ld tab_width,a 
      00940A 7B 01            [ 1] 3853 	ld a,(BASE_SAV,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00940C C7 00 0B         [ 1] 3854 	ld base,a
      00138F                       3855 	_drop VSIZE 
      00940F 5B 05            [ 2]    1     addw sp,#VSIZE 
      009411 81               [ 4] 3856 	ret 	
      009412 28 29 2C 23           3857 single_char: .byte '(',')',',','#'
      009416 2A 2F 25              3858 mul_char: .byte '*','/','%'
      009419 94 25 94 27 94 29 94  3859 relop_str: .word gt,equal,ge,lt,le,ne 
             2C 94 2E 94 31
      009425 3E 00                 3860 gt: .asciz ">"
      009427 3D 00                 3861 equal: .asciz "="
      009429 3E 3D 00              3862 ge: .asciz ">="
      00942C 3C 00                 3863 lt: .asciz "<"
      00942E 3C 3D 00              3864 le: .asciz "<="
      009431 3C 3E 00              3865 ne:  .asciz "<>"
                                   3866 
                                   3867 
                                   3868 ;---------------------------------
                                   3869 ; BASIC: PRINT|? arg_list 
                                   3870 ; print values from argument list
                                   3871 ;----------------------------------
                           000001  3872 	COMMA=1
                           000001  3873 	VSIZE=1
      009434                       3874 print:
      009434 4B 00            [ 1] 3875 push #0 ; local variable COMMA 
      009436                       3876 reset_comma:
      009436 0F 01            [ 1] 3877 	clr (COMMA,sp)
      009438                       3878 prt_loop:
      009438 CD 90 AE         [ 4] 3879 	call relation 
      00943B A1 01            [ 1] 3880 	cp a,#TK_COLON 
      00943D 27 53            [ 1] 3881 	jreq print_exit   
      00943F A1 04            [ 1] 3882 	cp a,#TK_INTGR 
      009441 26 05            [ 1] 3883 	jrne 0$ 
      009443 CD 89 2D         [ 4] 3884 	call print_int 
      009446 20 EE            [ 2] 3885 	jra reset_comma
      009448                       3886 0$: 	
      009448 CD 88 98         [ 4] 3887 	call next_token
      00944B A1 00            [ 1] 3888 	cp a,#TK_NONE 
      00944D 27 43            [ 1] 3889 	jreq print_exit 
      00944F A1 0A            [ 1] 3890 1$:	cp a,#TK_QSTR
      009451 26 05            [ 1] 3891 	jrne 2$   
      009453 CD 82 57         [ 4] 3892 	call puts
      009456 20 DE            [ 2] 3893 	jra reset_comma
      009458 A1 03            [ 1] 3894 2$: cp a,#TK_CHAR 
      00945A 26 06            [ 1] 3895 	jrne 3$
      00945C 9F               [ 1] 3896 	ld a,xl 
      00945D CD 82 44         [ 4] 3897 	call putc 
      009460 20 D4            [ 2] 3898 	jra reset_comma 
      009462                       3899 3$: 	
      009462 A1 08            [ 1] 3900 	cp a,#TK_CFUNC 
      009464 26 07            [ 1] 3901 	jrne 4$ 
      009466 FD               [ 4] 3902 	call (x)
      009467 9F               [ 1] 3903 	ld a,xl 
      009468 CD 82 44         [ 4] 3904 	call putc
      00946B 20 C9            [ 2] 3905 	jra reset_comma 
      00946D                       3906 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      00946D A1 0D            [ 1] 3907 	cp a,#TK_COMMA 
      00946F 26 05            [ 1] 3908 	jrne 5$
      009471 03 01            [ 1] 3909 	cpl (COMMA,sp) 
      009473 CC 94 38         [ 2] 3910 	jp prt_loop   
      009476                       3911 5$: 
      009476 A1 0E            [ 1] 3912 	cp a,#TK_SHARP
      009478 26 13            [ 1] 3913 	jrne 7$
      00947A CD 88 98         [ 4] 3914 	call next_token
      00947D A1 04            [ 1] 3915 	cp a,#TK_INTGR 
      00947F 27 03            [ 1] 3916 	jreq 6$
      009481 CC 87 DC         [ 2] 3917 	jp syntax_error 
      009484                       3918 6$:
      009484 9F               [ 1] 3919 	ld a,xl 
      009485 A4 0F            [ 1] 3920 	and a,#15 
      009487 C7 00 27         [ 1] 3921 	ld tab_width,a 
      00948A CC 94 36         [ 2] 3922 	jp reset_comma 
      00948D                       3923 7$:	
      00140D                       3924 	_unget_token
      00948D 55 00 03 00 02   [ 1]    1     mov in,in.saved
      009492                       3925 print_exit:
      009492 0D 01            [ 1] 3926 	tnz (COMMA,sp)
      009494 26 05            [ 1] 3927 	jrne 9$
      009496 A6 0D            [ 1] 3928 	ld a,#CR 
      009498 CD 82 44         [ 4] 3929     call putc 
      00141B                       3930 9$:	_drop VSIZE 
      00949B 5B 01            [ 2]    1     addw sp,#VSIZE 
      00949D 81               [ 4] 3931 	ret 
                                   3932 
                                   3933 ;----------------------
                                   3934 ; 'save_context' and
                                   3935 ; 'rest_context' must be 
                                   3936 ; called at the same 
                                   3937 ; call stack depth 
                                   3938 ; i.e. SP must have the 
                                   3939 ; save value at  
                                   3940 ; entry point of both 
                                   3941 ; routine. 
                                   3942 ;---------------------
                           000004  3943 	CTXT_SIZE=4 ; size of saved data 
                                   3944 ;--------------------
                                   3945 ; save current BASIC
                                   3946 ; interpreter context 
                                   3947 ; on stack 
                                   3948 ;--------------------
      00949E                       3949 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00141E                       3950 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00141E                       3951 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00141E                       3952 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00141E                       3953 save_context:
      00949E CE 00 05         [ 2] 3954 	ldw x,basicptr 
      0094A1 1F 03            [ 2] 3955 	ldw (BPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0094A3 C6 00 02         [ 1] 3956 	ld a,in 
      0094A6 6B 05            [ 1] 3957 	ld (IN,sp),a
      0094A8 C6 00 04         [ 1] 3958 	ld a,count 
      0094AB 6B 06            [ 1] 3959 	ld (CNT,sp),a  
      0094AD 81               [ 4] 3960 	ret
                                   3961 
                                   3962 ;-----------------------
                                   3963 ; restore previously saved 
                                   3964 ; BASIC interpreter context 
                                   3965 ; from stack 
                                   3966 ;-------------------------
      0094AE                       3967 rest_context:
      0094AE 1E 03            [ 2] 3968 	ldw x,(BPTR,sp)
      0094B0 CF 00 05         [ 2] 3969 	ldw basicptr,x 
      0094B3 7B 05            [ 1] 3970 	ld a,(IN,sp)
      0094B5 C7 00 02         [ 1] 3971 	ld in,a
      0094B8 7B 06            [ 1] 3972 	ld a,(CNT,sp)
      0094BA C7 00 04         [ 1] 3973 	ld count,a  
      0094BD 81               [ 4] 3974 	ret
                                   3975 
                                   3976 ;------------------------------------------
                                   3977 ; BASIC: INPUT [string],var[,[string],var]
                                   3978 ; input value in variables 
                                   3979 ; [string] optionally can be used as prompt 
                                   3980 ;-----------------------------------------
                           000001  3981 	CX_BPTR=1
                           000003  3982 	CX_IN=3
                           000004  3983 	CX_CNT=4
                           000005  3984 	SKIP=5
                           000006  3985 	VAR_ADDR=6 
                           000007  3986 	VSIZE=7
      0094BE                       3987 input_var:
      00143E                       3988 	_vars VSIZE 
      0094BE 52 07            [ 2]    1     sub sp,#VSIZE 
      0094C0                       3989 input_loop:
      0094C0 0F 05            [ 1] 3990 	clr (SKIP,sp)
      0094C2 CD 88 98         [ 4] 3991 	call next_token 
      0094C5 A1 0A            [ 1] 3992 	cp a,#TK_QSTR 
      0094C7 26 08            [ 1] 3993 	jrne 1$ 
      0094C9 CD 82 57         [ 4] 3994 	call puts 
      0094CC 03 05            [ 1] 3995 	cpl (SKIP,sp)
      0094CE CD 88 98         [ 4] 3996 	call next_token 
      0094D1 A1 05            [ 1] 3997 1$: cp a,#TK_VAR  
      0094D3 27 03            [ 1] 3998 	jreq 2$ 
      0094D5 CC 87 DC         [ 2] 3999 	jp syntax_error
      0094D8 1F 06            [ 2] 4000 2$:	ldw (VAR_ADDR,sp),x 
      0094DA 0D 05            [ 1] 4001 	tnz (SKIP,sp)
      0094DC 26 06            [ 1] 4002 	jrne 21$ 
                                   4003 ;	clr pad+2
      0094DE AE 17 38         [ 2] 4004 	ldw x,#pad 
      0094E1 CD 82 57         [ 4] 4005 	call puts   
      0094E4                       4006 21$:
      0094E4 A6 3A            [ 1] 4007 	ld a,#':
      0094E6 CD 82 44         [ 4] 4008 	call putc 
      0094E9 CD 94 9E         [ 4] 4009 	call save_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094EC 72 5F 00 04      [ 1] 4010 	clr count  
      0094F0 CD 8A 57         [ 4] 4011 	call readln 
      0094F3 AE 16 E8         [ 2] 4012 	ldw x,#tib 
      0094F6 CF 00 05         [ 2] 4013 	ldw basicptr,x  
      0094F9 72 5F 00 02      [ 1] 4014 	clr in 
      0094FD CD 8B D6         [ 4] 4015 	call get_token
      009500 A1 04            [ 1] 4016 	cp a,#TK_INTGR
      009502 27 06            [ 1] 4017 	jreq 3$ 
      009504 CD 94 AE         [ 4] 4018 	call rest_context 
      009507 CC 87 DC         [ 2] 4019 	jp syntax_error
      00950A 90 85            [ 2] 4020 3$: popw y 
      00950C 90 FF            [ 2] 4021 	ldw (y),x 
      00950E CD 94 AE         [ 4] 4022 	call rest_context
      009511 CD 88 98         [ 4] 4023 	call next_token 
      009514 A1 0D            [ 1] 4024 	cp a,#TK_COMMA 
      009516 27 A8            [ 1] 4025 	jreq input_loop 
      009518 A1 01            [ 1] 4026 	cp a,#TK_COLON 
      00951A 23 03            [ 2] 4027     jrule input_exit 
      00951C CC 87 DC         [ 2] 4028 	jp syntax_error 
      00951F                       4029 input_exit:
      00149F                       4030 	_drop VSIZE 
      00951F 5B 07            [ 2]    1     addw sp,#VSIZE 
      009521 81               [ 4] 4031 	ret 
                                   4032 
                                   4033 
                                   4034 ;---------------------
                                   4035 ; BASIC: REMARK | ' 
                                   4036 ; skip comment to end of line 
                                   4037 ;---------------------- 
      009522                       4038 rem:
      009522 55 00 02 00 04   [ 1] 4039  	mov count,in 
      009527 81               [ 4] 4040 	ret 
                                   4041 
                                   4042 ;---------------------
                                   4043 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4044 ; read in loop 'addr'  
                                   4045 ; apply & 'mask' to value 
                                   4046 ; loop while result==0.  
                                   4047 ; if 'xor_mask' given 
                                   4048 ; apply ^ in second  
                                   4049 ; loop while result==0 
                                   4050 ;---------------------
                           000001  4051 	XMASK=1 
                           000002  4052 	MASK=2
                           000003  4053 	ADDR=3
                           000004  4054 	VSIZE=4
      009528                       4055 wait: 
      0014A8                       4056 	_vars VSIZE
      009528 52 04            [ 2]    1     sub sp,#VSIZE 
      00952A 0F 01            [ 1] 4057 	clr (XMASK,sp) 
      00952C CD 8F 5E         [ 4] 4058 	call arg_list 
      00952F A1 02            [ 1] 4059 	cp a,#2
      009531 24 03            [ 1] 4060 	jruge 0$
      009533 CC 87 DC         [ 2] 4061 	jp syntax_error 
      009536 A1 03            [ 1] 4062 0$:	cp a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009538 25 04            [ 1] 4063 	jrult 1$
      00953A 85               [ 2] 4064 	popw x 
      00953B 9F               [ 1] 4065 	ld a,xl
      00953C 6B 01            [ 1] 4066 	ld (XMASK,sp),a 
      00953E 85               [ 2] 4067 1$: popw x ; mask 
      00953F 9F               [ 1] 4068 	ld a,xl 
      009540 6B 02            [ 1] 4069 	ld (MASK,sp),a 
      009542 85               [ 2] 4070 	popw x ; address 
      009543 F6               [ 1] 4071 2$:	ld a,(x)
      009544 14 02            [ 1] 4072 	and a,(MASK,sp)
      009546 18 01            [ 1] 4073 	xor a,(XMASK,sp)
      009548 27 F9            [ 1] 4074 	jreq 2$ 
      0014CA                       4075 	_drop VSIZE 
      00954A 5B 04            [ 2]    1     addw sp,#VSIZE 
      00954C 81               [ 4] 4076 	ret 
                                   4077 
                                   4078 ;---------------------
                                   4079 ; BASIC: BSET addr,mask
                                   4080 ; set bits at 'addr' corresponding 
                                   4081 ; to those of 'mask' that are at 1.
                                   4082 ; arguments:
                                   4083 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4084 ;   mask        mask|addr
                                   4085 ; output:
                                   4086 ;	none 
                                   4087 ;--------------------------
      00954D                       4088 bit_set:
      00954D CD 8F 5E         [ 4] 4089 	call arg_list 
      009550 A1 02            [ 1] 4090 	cp a,#2	 
      009552 27 03            [ 1] 4091 	jreq 1$ 
      009554 CC 87 DC         [ 2] 4092 	jp syntax_error
      009557                       4093 1$: 
      009557 85               [ 2] 4094 	popw x ; mask 
      009558 9F               [ 1] 4095 	ld a,xl 
      009559 85               [ 2] 4096 	popw x ; addr  
      00955A FA               [ 1] 4097 	or a,(x)
      00955B F7               [ 1] 4098 	ld (x),a
      00955C 81               [ 4] 4099 	ret 
                                   4100 
                                   4101 ;---------------------
                                   4102 ; BASIC: BRES addr,mask
                                   4103 ; reset bits at 'addr' corresponding 
                                   4104 ; to those of 'mask' that are at 1.
                                   4105 ; arguments:
                                   4106 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4107 ;   mask	    ~mask&*addr  
                                   4108 ; output:
                                   4109 ;	none 
                                   4110 ;--------------------------
      00955D                       4111 bit_reset:
      00955D CD 8F 5E         [ 4] 4112 	call arg_list 
      009560 A1 02            [ 1] 4113 	cp a,#2  
      009562 27 03            [ 1] 4114 	jreq 1$ 
      009564 CC 87 DC         [ 2] 4115 	jp syntax_error
      009567                       4116 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009567 85               [ 2] 4117 	popw x ; mask 
      009568 9F               [ 1] 4118 	ld a,xl 
      009569 43               [ 1] 4119 	cpl a 
      00956A 85               [ 2] 4120 	popw x ; addr  
      00956B F4               [ 1] 4121 	and a,(x)
      00956C F7               [ 1] 4122 	ld (x),a 
      00956D 81               [ 4] 4123 	ret 
                                   4124 
                                   4125 ;---------------------
                                   4126 ; BASIC: BTOGL addr,mask
                                   4127 ; toggle bits at 'addr' corresponding 
                                   4128 ; to those of 'mask' that are at 1.
                                   4129 ; arguments:
                                   4130 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4131 ;   mask	    mask^*addr  
                                   4132 ; output:
                                   4133 ;	none 
                                   4134 ;--------------------------
      00956E                       4135 bit_toggle:
      00956E CD 8F 5E         [ 4] 4136 	call arg_list 
      009571 A1 02            [ 1] 4137 	cp a,#2 
      009573 27 03            [ 1] 4138 	jreq 1$ 
      009575 CC 87 DC         [ 2] 4139 	jp syntax_error
      009578 85               [ 2] 4140 1$: popw x ; mask 
      009579 9F               [ 1] 4141 	ld a,xl 
      00957A 85               [ 2] 4142 	popw x ; addr  
      00957B F8               [ 1] 4143 	xor a,(x)
      00957C F7               [ 1] 4144 	ld (x),a 
      00957D 81               [ 4] 4145 	ret 
                                   4146 
                                   4147 
                                   4148 ;---------------------
                                   4149 ; BASIC: BTEST(addr,bit)
                                   4150 ; return bit value at 'addr' 
                                   4151 ; bit is in range {0..7}.
                                   4152 ; arguments:
                                   4153 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4154 ;   bit 	    bit position {0..7}  
                                   4155 ; output:
                                   4156 ;	none 
                                   4157 ;--------------------------
      00957E                       4158 bit_test:
      00957E CD 8F 85         [ 4] 4159 	call func_args 
      009581 A1 02            [ 1] 4160 	cp a,#2
      009583 27 03            [ 1] 4161 	jreq 0$
      009585 CC 87 DC         [ 2] 4162 	jp syntax_error
      009588                       4163 0$:	
      009588 85               [ 2] 4164 	popw x 
      009589 9F               [ 1] 4165 	ld a,xl 
      00958A A4 07            [ 1] 4166 	and a,#7
      00958C 88               [ 1] 4167 	push a   
      00958D A6 01            [ 1] 4168 	ld a,#1 
      00958F 0D 01            [ 1] 4169 1$: tnz (1,sp)
      009591 27 05            [ 1] 4170 	jreq 2$
      009593 48               [ 1] 4171 	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009594 0A 01            [ 1] 4172 	dec (1,sp)
      009596 20 F7            [ 2] 4173 	jra 1$
      001518                       4174 2$: _drop 1 
      009598 5B 01            [ 2]    1     addw sp,#1 
      00959A 85               [ 2] 4175 	popw x 
      00959B F4               [ 1] 4176 	and a,(x)
      00959C 27 02            [ 1] 4177 	jreq 3$
      00959E A6 01            [ 1] 4178 	ld a,#1 
      0095A0 5F               [ 1] 4179 3$:	clrw x 
      0095A1 97               [ 1] 4180 	ld xl,a 
      0095A2 A6 04            [ 1] 4181 	ld a,#TK_INTGR
      0095A4 81               [ 4] 4182 	ret
                                   4183 
                                   4184 
                                   4185 ;--------------------
                                   4186 ; BASIC: POKE addr,byte
                                   4187 ; put a byte at addr 
                                   4188 ;--------------------
      0095A5                       4189 poke:
      0095A5 CD 8F 5E         [ 4] 4190 	call arg_list 
      0095A8 A1 02            [ 1] 4191 	cp a,#2
      0095AA 27 03            [ 1] 4192 	jreq 1$
      0095AC CC 87 DC         [ 2] 4193 	jp syntax_error
      0095AF                       4194 1$:	
      0095AF 85               [ 2] 4195 	popw x  
      0095B0 9F               [ 1] 4196     ld a,xl 
      0095B1 85               [ 2] 4197 	popw x 
      0095B2 F7               [ 1] 4198 	ld (x),a 
      0095B3 81               [ 4] 4199 	ret 
                                   4200 
                                   4201 ;-----------------------
                                   4202 ; BASIC: PEEK(addr)
                                   4203 ; get the byte at addr 
                                   4204 ; input:
                                   4205 ;	none 
                                   4206 ; output:
                                   4207 ;	X 		value 
                                   4208 ;-----------------------
      0095B4                       4209 peek:
      0095B4 CD 8F 85         [ 4] 4210 	call func_args
      0095B7 A1 01            [ 1] 4211 	cp a,#1
      0095B9 27 03            [ 1] 4212 	jreq 1$
      0095BB CC 87 DC         [ 2] 4213 	jp syntax_error
      0095BE 85               [ 2] 4214 1$:	popw x 
      0095BF F6               [ 1] 4215 	ld a,(x)
      0095C0 5F               [ 1] 4216 	clrw x 
      0095C1 97               [ 1] 4217 	ld xl,a 
      0095C2 A6 04            [ 1] 4218 	ld a,#TK_INTGR
      0095C4 81               [ 4] 4219 	ret 
                                   4220 
                                   4221 ;----------------------------
                                   4222 ; BASIC: XPEEK(page,addr)
                                   4223 ; read extended memory byte
                                   4224 ; page in range {0,1,2}
                                   4225 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095C5                       4226 xpeek:
      0095C5 CD 8F 85         [ 4] 4227 	call func_args 
      0095C8 A1 02            [ 1] 4228 	cp a,#2 
      0095CA 27 03            [ 1] 4229 	jreq 1$
      0095CC CC 87 DC         [ 2] 4230 	jp syntax_error
      0095CF                       4231 1$: 
      0095CF 85               [ 2] 4232 	popw x  
      0095D0 CF 00 1A         [ 2] 4233 	ldw farptr+1,x 
      0095D3 85               [ 2] 4234 	popw x 
      0095D4 9F               [ 1] 4235 	ld a,xl 
      0095D5 C7 00 19         [ 1] 4236 	ld farptr,a 
      0095D8 5F               [ 1] 4237 	clrw x
      0095D9 92 BC 00 19      [ 5] 4238 	ldf a,[farptr]
      0095DD 97               [ 1] 4239 	ld xl,a 
      0095DE A6 04            [ 1] 4240 	ld a,#TK_INTGR 
      0095E0 81               [ 4] 4241 	ret 
                                   4242 
                                   4243 ;---------------------------
                                   4244 ; BASIC IF expr : instructions
                                   4245 ; evaluate expr and if true 
                                   4246 ; execute instructions on same line. 
                                   4247 ;----------------------------
      0095E1                       4248 if: 
      0095E1 CD 90 AE         [ 4] 4249 	call relation 
      0095E4 A1 04            [ 1] 4250 	cp a,#TK_INTGR
      0095E6 27 03            [ 1] 4251 	jreq 1$ 
      0095E8 CC 87 DC         [ 2] 4252 	jp syntax_error
      0095EB 4F               [ 1] 4253 1$:	clr a 
      0095EC 5D               [ 2] 4254 	tnzw x 
      0095ED 26 05            [ 1] 4255 	jrne 9$  
                                   4256 ;skip to next line
      0095EF 55 00 04 00 02   [ 1] 4257 	mov in,count
      0095F4 81               [ 4] 4258 9$:	ret 
                                   4259 
                                   4260 ;------------------------
                                   4261 ; BASIC: FOR var=expr 
                                   4262 ; set variable to expression 
                                   4263 ; leave variable address 
                                   4264 ; on stack and set
                                   4265 ; FLOOP bit in 'flags'
                                   4266 ;-----------------
                           000001  4267 	RETL1=1 ; return address  
                           000003  4268 	FSTEP=3  ; variable increment
                           000005  4269 	LIMIT=5 ; loop limit 
                           000007  4270 	CVAR=7   ; control variable 
                           000009  4271 	INW=9   ;  in.w saved
                           00000B  4272 	BPTR=11 ; baseptr saved
                           00000A  4273 	VSIZE=10  
      0095F5                       4274 for: ; { -- var_addr }
      0095F5 85               [ 2] 4275 	popw x ; call return address 
      001576                       4276 	_vars VSIZE 
      0095F6 52 0A            [ 2]    1     sub sp,#VSIZE 
      0095F8 89               [ 2] 4277 	pushw x  ; RETL1 
      0095F9 A6 05            [ 1] 4278 	ld a,#TK_VAR 
      0095FB CD 8F 51         [ 4] 4279 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095FE 1F 07            [ 2] 4280 	ldw (CVAR,sp),x  ; control variable 
      009600 CD 91 E7         [ 4] 4281 	call let02 
      009603 72 14 00 26      [ 1] 4282 	bset flags,#FLOOP 
                                   4283 ; open space on stack for loop data 
      009607 5F               [ 1] 4284 	clrw x 
      009608 1F 0B            [ 2] 4285 	ldw (BPTR,sp),x 
      00960A 1F 09            [ 2] 4286 	ldw (INW,sp),x 
      00960C CD 88 98         [ 4] 4287 	call next_token 
      00960F A1 06            [ 1] 4288 	cp a,#TK_CMD 
      009611 27 03            [ 1] 4289 	jreq 1$
      009613 CC 87 DC         [ 2] 4290 	jp syntax_error
      009616                       4291 1$:  
      009616 A3 96 1E         [ 2] 4292 	cpw x,#to 
      009619 27 03            [ 1] 4293 	jreq to
      00961B CC 87 DC         [ 2] 4294 	jp syntax_error 
                                   4295 
                                   4296 ;-----------------------------------
                                   4297 ; BASIC: TO expr 
                                   4298 ; second part of FOR loop initilization
                                   4299 ; leave limit on stack and set 
                                   4300 ; FTO bit in 'flags'
                                   4301 ;-----------------------------------
      00961E                       4302 to: ; { var_addr -- var_addr limit step }
      00961E 72 04 00 26 03   [ 2] 4303 	btjt flags,#FLOOP,1$
      009623 CC 87 DC         [ 2] 4304 	jp syntax_error
      009626 CD 90 AE         [ 4] 4305 1$: call relation  
      009629 A1 04            [ 1] 4306 	cp a,#TK_INTGR 
      00962B 27 03            [ 1] 4307 	jreq 2$ 
      00962D CC 87 DC         [ 2] 4308 	jp syntax_error
      009630 1F 05            [ 2] 4309 2$: ldw (LIMIT,sp),x
                                   4310 ;	ldw x,in.w 
      009632 CD 88 98         [ 4] 4311 	call next_token
      009635 A1 00            [ 1] 4312 	cp a,#TK_NONE  
      009637 27 0E            [ 1] 4313 	jreq 4$ 
      009639 A1 06            [ 1] 4314 	cp a,#TK_CMD
      00963B 26 05            [ 1] 4315 	jrne 3$
      00963D A3 96 4E         [ 2] 4316 	cpw x,#step 
      009640 27 0C            [ 1] 4317 	jreq step
      009642                       4318 3$:	
      0015C2                       4319 	_unget_token   	 
      009642 55 00 03 00 02   [ 1]    1     mov in,in.saved
      009647                       4320 4$:	
      009647 AE 00 01         [ 2] 4321 	ldw x,#1   ; default step  
      00964A 1F 03            [ 2] 4322 	ldw (FSTEP,sp),x 
      00964C 20 14            [ 2] 4323 	jra store_loop_addr 
                                   4324 
                                   4325 
                                   4326 ;----------------------------------
                                   4327 ; BASIC: STEP expr 
                                   4328 ; optional third par of FOR loop
                                   4329 ; initialization. 	
                                   4330 ;------------------------------------
      00964E                       4331 step: ; {var limit -- var limit step}
      00964E 72 04 00 26 03   [ 2] 4332 	btjt flags,#FLOOP,1$
      009653 CC 87 DC         [ 2] 4333 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009656 CD 90 AE         [ 4] 4334 1$: call relation
      009659 A1 04            [ 1] 4335 	cp a,#TK_INTGR
      00965B 27 03            [ 1] 4336 	jreq 2$
      00965D CC 87 DC         [ 2] 4337 	jp syntax_error
      009660 1F 03            [ 2] 4338 2$:	ldw (FSTEP,sp),x ; step
                                   4339 ; leave loop back entry point on cstack 
                                   4340 ; cstack is 1 call deep from interp_loop
      009662                       4341 store_loop_addr:
      009662 CE 00 05         [ 2] 4342 	ldw x,basicptr  
      009665 1F 0B            [ 2] 4343 	ldw (BPTR,sp),x 
      009667 CE 00 01         [ 2] 4344 	ldw x,in.w 
      00966A 1F 09            [ 2] 4345 	ldw (INW,sp),x   
      00966C 72 15 00 26      [ 1] 4346 	bres flags,#FLOOP 
      009670 72 5C 00 23      [ 1] 4347 	inc loop_depth  
      009674 81               [ 4] 4348 	ret 
                                   4349 
                                   4350 ;--------------------------------
                                   4351 ; BASIC: NEXT var 
                                   4352 ; FOR loop control 
                                   4353 ; increment variable with step 
                                   4354 ; and compare with limit 
                                   4355 ; loop if threshold not crossed.
                                   4356 ; else stack. 
                                   4357 ; and decrement 'loop_depth' 
                                   4358 ;--------------------------------
      009675                       4359 next: ; {var limit step retl1 -- [var limit step ] }
      009675 72 5D 00 23      [ 1] 4360 	tnz loop_depth 
      009679 26 03            [ 1] 4361 	jrne 1$ 
      00967B CC 87 DC         [ 2] 4362 	jp syntax_error 
      00967E                       4363 1$: 
      00967E A6 05            [ 1] 4364 	ld a,#TK_VAR 
      009680 CD 8F 51         [ 4] 4365 	call expect
                                   4366 ; check for good variable after NEXT 	 
      009683 13 07            [ 2] 4367 	cpw x,(CVAR,sp)
      009685 27 03            [ 1] 4368 	jreq 2$  
      009687 CC 87 DC         [ 2] 4369 	jp syntax_error ; not the good one 
      00968A                       4370 2$: ; increment variable 
      00968A FE               [ 2] 4371 	ldw x,(x)  ; get var value 
      00968B 72 FB 03         [ 2] 4372 	addw x,(FSTEP,sp) ; var+step 
      00968E 16 07            [ 2] 4373 	ldw y,(CVAR,sp)
      009690 90 FF            [ 2] 4374 	ldw (y),x ; save var new value 
                                   4375 ; check sign of STEP  
      009692 A6 80            [ 1] 4376 	ld a,#0x80
      009694 15 03            [ 1] 4377 	bcp a,(FSTEP,sp)
      009696 2A 06            [ 1] 4378 	jrpl 4$
                                   4379 ;negative step 
      009698 13 05            [ 2] 4380 	cpw x,(LIMIT,sp)
      00969A 2F 1B            [ 1] 4381 	jrslt loop_done
      00969C 20 04            [ 2] 4382 	jra loop_back 
      00969E                       4383 4$: ; positive step
      00969E 13 05            [ 2] 4384 	cpw x,(LIMIT,sp)
      0096A0 2C 15            [ 1] 4385 	jrsgt loop_done
      0096A2                       4386 loop_back:
      0096A2 1E 0B            [ 2] 4387 	ldw x,(BPTR,sp)
      0096A4 CF 00 05         [ 2] 4388 	ldw basicptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096A7 72 01 00 26 05   [ 2] 4389 	btjf flags,#FRUN,1$ 
      0096AC E6 02            [ 1] 4390 	ld a,(2,x)
      0096AE C7 00 04         [ 1] 4391 	ld count,a
      0096B1 1E 09            [ 2] 4392 1$:	ldw x,(INW,sp)
      0096B3 CF 00 01         [ 2] 4393 	ldw in.w,x 
      0096B6 81               [ 4] 4394 	ret 
      0096B7                       4395 loop_done:
                                   4396 	; remove loop data from stack  
      0096B7 85               [ 2] 4397 	popw x
      001638                       4398 	_drop VSIZE 
      0096B8 5B 0A            [ 2]    1     addw sp,#VSIZE 
      0096BA 72 5A 00 23      [ 1] 4399 	dec loop_depth 
                                   4400 ;	pushw x 
                                   4401 ;	ret 
      0096BE FC               [ 2] 4402 	jp (x)
                                   4403 
                                   4404 ;----------------------------
                                   4405 ; called by goto/gosub
                                   4406 ; to get target line number 
                                   4407 ;---------------------------
      0096BF                       4408 get_target_line:
      0096BF CD 90 AE         [ 4] 4409 	call relation 
      0096C2 A1 04            [ 1] 4410 	cp a,#TK_INTGR
      0096C4 27 03            [ 1] 4411 	jreq 1$
      0096C6 CC 87 DC         [ 2] 4412 	jp syntax_error
      0096C9 CD 82 F9         [ 4] 4413 1$:	call search_lineno  
      0096CC 5D               [ 2] 4414 	tnzw x 
      0096CD 26 05            [ 1] 4415 	jrne 2$ 
      0096CF A6 05            [ 1] 4416 	ld a,#ERR_NO_LINE 
      0096D1 CC 87 DE         [ 2] 4417 	jp tb_error 
      0096D4 81               [ 4] 4418 2$:	ret 
                                   4419 
                                   4420 ;------------------------
                                   4421 ; BASIC: GOTO line# 
                                   4422 ; jump to line# 
                                   4423 ; here cstack is 2 call deep from interp_loop 
                                   4424 ;------------------------
      0096D5                       4425 goto:
      0096D5 72 00 00 26 06   [ 2] 4426 	btjt flags,#FRUN,0$ 
      0096DA A6 06            [ 1] 4427 	ld a,#ERR_RUN_ONLY
      0096DC CC 87 DE         [ 2] 4428 	jp tb_error 
      0096DF 81               [ 4] 4429 	ret 
      0096E0 CD 96 BF         [ 4] 4430 0$:	call get_target_line
      0096E3                       4431 jp_to_target:
      0096E3 CF 00 05         [ 2] 4432 	ldw basicptr,x 
      0096E6 E6 02            [ 1] 4433 	ld a,(2,x)
      0096E8 C7 00 04         [ 1] 4434 	ld count,a 
      0096EB 35 03 00 02      [ 1] 4435 	mov in,#3 
      0096EF 81               [ 4] 4436 	ret 
                                   4437 
                                   4438 
                                   4439 ;--------------------
                                   4440 ; BASIC: GOSUB line#
                                   4441 ; basic subroutine call
                                   4442 ; actual line# and basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4443 ; are saved on cstack
                                   4444 ; here cstack is 2 call deep from interp_loop 
                                   4445 ;--------------------
                           000003  4446 	RET_ADDR=3
                           000005  4447 	RET_INW=5
                           000004  4448 	VSIZE=4  
      0096F0                       4449 gosub:
      0096F0 72 00 00 26 06   [ 2] 4450 	btjt flags,#FRUN,0$ 
      0096F5 A6 06            [ 1] 4451 	ld a,#ERR_RUN_ONLY
      0096F7 CC 87 DE         [ 2] 4452 	jp tb_error 
      0096FA 81               [ 4] 4453 	ret 
      0096FB 85               [ 2] 4454 0$:	popw x 
      00167C                       4455 	_vars VSIZE  
      0096FC 52 04            [ 2]    1     sub sp,#VSIZE 
      0096FE 89               [ 2] 4456 	pushw x 
      0096FF CE 00 05         [ 2] 4457 	ldw x,basicptr
      009702 1F 03            [ 2] 4458 	ldw (RET_ADDR,sp),x 
      009704 CD 96 BF         [ 4] 4459 	call get_target_line  
      009707 89               [ 2] 4460 	pushw x 
      009708 CE 00 01         [ 2] 4461 	ldw x,in.w 
      00970B 1F 07            [ 2] 4462 	ldw (RET_INW+2,sp),x
      00970D 85               [ 2] 4463 	popw x 
      00970E 20 D3            [ 2] 4464 	jra jp_to_target
                                   4465 
                                   4466 ;------------------------
                                   4467 ; BASIC: RETURN 
                                   4468 ; exit from a subroutine 
                                   4469 ; 
                                   4470 ;------------------------
      009710                       4471 return:
      009710 72 00 00 26 05   [ 2] 4472 	btjt flags,#FRUN,0$ 
      009715 A6 06            [ 1] 4473 	ld a,#ERR_RUN_ONLY
      009717 CC 87 DE         [ 2] 4474 	jp tb_error 
      00971A                       4475 0$:	
      00971A 1E 03            [ 2] 4476 	ldw x,(RET_ADDR,sp) 
      00971C CF 00 05         [ 2] 4477 	ldw basicptr,x
      00971F E6 02            [ 1] 4478 	ld a,(2,x)
      009721 C7 00 04         [ 1] 4479 	ld count,a  
      009724 1E 05            [ 2] 4480 	ldw x,(RET_INW,sp)
      009726 CF 00 01         [ 2] 4481 	ldw in.w,x 
      009729 85               [ 2] 4482 	popw x 
      0016AA                       4483 	_drop VSIZE 
      00972A 5B 04            [ 2]    1     addw sp,#VSIZE 
      00972C 89               [ 2] 4484 	pushw x
      00972D 81               [ 4] 4485 	ret  
                                   4486 
                                   4487 
                                   4488 ;----------------------------------
                                   4489 ; BASIC: RUN
                                   4490 ; run BASIC program in RAM
                                   4491 ;----------------------------------- 
      00972E                       4492 run: 
      00972E 72 01 00 26 02   [ 2] 4493 	btjf flags,#FRUN,0$  
      009733 4F               [ 1] 4494 	clr a 
      009734 81               [ 4] 4495 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009735                       4496 0$: 
      009735 72 09 00 26 12   [ 2] 4497 	btjf flags,#FBREAK,1$
      0016BA                       4498 	_drop 2 
      00973A 5B 02            [ 2]    1     addw sp,#2 
      00973C CD 94 AE         [ 4] 4499 	call rest_context
      0016BF                       4500 	_drop CTXT_SIZE 
      00973F 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      009741 72 19 00 26      [ 1] 4501 	bres flags,#FBREAK 
      009745 72 10 00 26      [ 1] 4502 	bset flags,#FRUN 
      009749 CC 88 6A         [ 2] 4503 	jp interp_loop 
      00974C CE 00 1F         [ 2] 4504 1$:	ldw x,txtbgn
      00974F C3 00 21         [ 2] 4505 	cpw x,txtend 
      009752 2B 05            [ 1] 4506 	jrmi run_it 
      009754 A6 0D            [ 1] 4507 	ld a,#ERR_NO_PROG
      009756 CC 87 DE         [ 2] 4508 	jp tb_error
                                   4509 
      009759                       4510 run_it:	 
      009759 CD 91 BB         [ 4] 4511     call ubound 
      0016DC                       4512 	_drop 2 ; drop return address 
      00975C 5B 02            [ 2]    1     addw sp,#2 
                                   4513 ; clear data pointer 
      00975E 5F               [ 1] 4514 	clrw x 
      00975F CF 00 07         [ 2] 4515 	ldw data_ptr,x 
      009762 72 5F 00 09      [ 1] 4516 	clr data_ofs 
      009766 72 5F 00 0A      [ 1] 4517 	clr data_len 
                                   4518 ; initialize BASIC pointer 
      00976A CE 00 1F         [ 2] 4519 	ldw x,txtbgn 
      00976D CF 00 05         [ 2] 4520 	ldw basicptr,x 
      009770 E6 02            [ 1] 4521 	ld a,(2,x)
      009772 C7 00 04         [ 1] 4522 	ld count,a
      009775 35 03 00 02      [ 1] 4523 	mov in,#3	
      009779 72 10 00 26      [ 1] 4524 	bset flags,#FRUN 
      00977D CC 88 6A         [ 2] 4525 	jp interp_loop 
                                   4526 
                                   4527 
                                   4528 ;----------------------
                                   4529 ; BASIC: END
                                   4530 ; end running program
                                   4531 ;---------------------- 
      009780                       4532 cmd_end: 
                                   4533 ; clean stack 
      009780 AE 17 FF         [ 2] 4534 	ldw x,#STACK_EMPTY 
      009783 94               [ 1] 4535 	ldw sp,x 
      009784 72 11 00 26      [ 1] 4536 	bres flags,#FRUN 
      009788 72 19 00 26      [ 1] 4537 	bres flags,#FBREAK
      00978C CC 88 27         [ 2] 4538 	jp warm_start
                                   4539 
                                   4540 
                                   4541 ;-----------------------
                                   4542 ; BASIC: TONE expr1,expr2
                                   4543 ; used TIMER2 channel 1
                                   4544 ; to produce a tone 
                                   4545 ; arguments:
                                   4546 ;    expr1   frequency 
                                   4547 ;    expr2   duration msec.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4548 ;---------------------------
      00978F                       4549 tone:
      00978F CD 8F 5E         [ 4] 4550 	call arg_list 
      009792 A1 02            [ 1] 4551 	cp a,#2 
      009794 27 03            [ 1] 4552 	jreq 1$
      009796 CC 87 DC         [ 2] 4553 	jp syntax_error 
      009799                       4554 1$: 
      009799 85               [ 2] 4555 	popw x ; duration
      00979A 90 85            [ 2] 4556 	popw y ; frequency 
      00979C                       4557 beep:  
      00979C 89               [ 2] 4558 	pushw x 
      00979D AE F4 24         [ 2] 4559 	ldw x,#TIM2_CLK_FREQ
      0097A0 65               [ 2] 4560 	divw x,y 
                                   4561 ; round to nearest integer 
      0097A1 90 A3 7A 12      [ 2] 4562 	cpw y,#TIM2_CLK_FREQ/2
      0097A5 2B 01            [ 1] 4563 	jrmi 2$
      0097A7 5C               [ 2] 4564 	incw x 
      0097A8                       4565 2$:	 
      0097A8 9E               [ 1] 4566 	ld a,xh 
      0097A9 C7 53 0D         [ 1] 4567 	ld TIM2_ARRH,a 
      0097AC 9F               [ 1] 4568 	ld a,xl 
      0097AD C7 53 0E         [ 1] 4569 	ld TIM2_ARRL,a 
                                   4570 ; 50% duty cycle 
      0097B0 8C               [ 1] 4571 	ccf 
      0097B1 56               [ 2] 4572 	rrcw x 
      0097B2 9E               [ 1] 4573 	ld a,xh 
      0097B3 C7 53 0F         [ 1] 4574 	ld TIM2_CCR1H,a 
      0097B6 9F               [ 1] 4575 	ld a,xl
      0097B7 C7 53 10         [ 1] 4576 	ld TIM2_CCR1L,a
      0097BA 72 10 53 08      [ 1] 4577 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0097BE 72 10 53 00      [ 1] 4578 	bset TIM2_CR1,#TIM2_CR1_CEN
      0097C2 72 10 53 04      [ 1] 4579 	bset TIM2_EGR,#TIM2_EGR_UG
      0097C6 85               [ 2] 4580 	popw x 
      0097C7 CF 00 13         [ 2] 4581 	ldw timer,x 
      0097CA CE 00 13         [ 2] 4582 3$: ldw x,timer 	
      0097CD 26 FB            [ 1] 4583 	jrne 3$ 
      0097CF 72 11 53 08      [ 1] 4584 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0097D3 72 11 53 00      [ 1] 4585 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0097D7 81               [ 4] 4586 	ret 
                                   4587 
                                   4588 ;-------------------------------
                                   4589 ; BASIC: ADCON 0|1 [,divisor]  
                                   4590 ; disable/enanble ADC 
                                   4591 ;-------------------------------
                           000003  4592 	ONOFF=3 
                           000001  4593 	DIVSOR=1
                           000004  4594 	VSIZE=4 
      0097D8                       4595 power_adc:
      0097D8 CD 8F 5E         [ 4] 4596 	call arg_list 
      0097DB A1 02            [ 1] 4597 	cp a,#2	
      0097DD 27 0B            [ 1] 4598 	jreq 1$
      0097DF A1 01            [ 1] 4599 	cp a,#1 
      0097E1 27 03            [ 1] 4600 	jreq 0$ 
      0097E3 CC 87 DC         [ 2] 4601 	jp syntax_error 
      0097E6 AE 00 00         [ 2] 4602 0$: ldw x,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097E9 89               [ 2] 4603 	pushw x  ; divisor 
      0097EA 1E 03            [ 2] 4604 1$: ldw x,(ONOFF,sp)
      0097EC 5D               [ 2] 4605 	tnzw x 
      0097ED 27 1A            [ 1] 4606 	jreq 2$ 
      0097EF 1E 01            [ 2] 4607 	ldw x,(DIVSOR,sp) ; divisor 
      0097F1 9F               [ 1] 4608 	ld a,xl
      0097F2 A4 07            [ 1] 4609 	and a,#7
      0097F4 4E               [ 1] 4610 	swap a 
      0097F5 C7 54 01         [ 1] 4611 	ld ADC_CR1,a
      0097F8 72 16 50 CA      [ 1] 4612 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0097FC 72 10 54 01      [ 1] 4613 	bset ADC_CR1,#ADC_CR1_ADON 
      001780                       4614 	_usec_dly 7 
      009800 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009803 5A               [ 2]    2     decw x
      009804 9D               [ 1]    3     nop 
      009805 26 FA            [ 1]    4     jrne .-4
      009807 20 08            [ 2] 4615 	jra 3$
      009809 72 11 54 01      [ 1] 4616 2$: bres ADC_CR1,#ADC_CR1_ADON
      00980D 72 17 50 CA      [ 1] 4617 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001791                       4618 3$:	_drop VSIZE 
      009811 5B 04            [ 2]    1     addw sp,#VSIZE 
      009813 81               [ 4] 4619 	ret
                                   4620 
                                   4621 ;-----------------------------
                                   4622 ; BASIC: ADCREAD (channel)
                                   4623 ; read adc channel {0..5}
                                   4624 ; output:
                                   4625 ;   A 		TK_INTGR 
                                   4626 ;   X 		value 
                                   4627 ;-----------------------------
      009814                       4628 analog_read:
      009814 CD 8F 85         [ 4] 4629 	call func_args 
      009817 A1 01            [ 1] 4630 	cp a,#1 
      009819 27 03            [ 1] 4631 	jreq 1$
      00981B CC 87 DC         [ 2] 4632 	jp syntax_error
      00981E 85               [ 2] 4633 1$: popw x 
      00981F A3 00 05         [ 2] 4634 	cpw x,#5 
      009822 23 05            [ 2] 4635 	jrule 2$
      009824 A6 0A            [ 1] 4636 	ld a,#ERR_BAD_VALUE
      009826 CC 87 DE         [ 2] 4637 	jp tb_error 
      009829 9F               [ 1] 4638 2$: ld a,xl
      00982A C7 00 0E         [ 1] 4639 	ld acc8,a 
      00982D A6 05            [ 1] 4640 	ld a,#5
      00982F C0 00 0E         [ 1] 4641 	sub a,acc8 
      009832 C7 54 00         [ 1] 4642 	ld ADC_CSR,a
      009835 72 16 54 02      [ 1] 4643 	bset ADC_CR2,#ADC_CR2_ALIGN
      009839 72 10 54 01      [ 1] 4644 	bset ADC_CR1,#ADC_CR1_ADON
      00983D 72 0F 54 00 FB   [ 2] 4645 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009842 CE 54 04         [ 2] 4646 	ldw x,ADC_DRH
      009845 A6 04            [ 1] 4647 	ld a,#TK_INTGR
      009847 81               [ 4] 4648 	ret 
                                   4649 
                                   4650 ;-----------------------
                                   4651 ; BASIC: DREAD(pin)
                                   4652 ; Arduino pins 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4653 ; read state of a digital pin 
                                   4654 ; pin# {0..15}
                                   4655 ; output:
                                   4656 ;    A 		TK_INTGR
                                   4657 ;    X      0|1 
                                   4658 ;-------------------------
                           000001  4659 	PINNO=1
                           000001  4660 	VSIZE=1
      009848                       4661 digital_read:
      0017C8                       4662 	_vars VSIZE 
      009848 52 01            [ 2]    1     sub sp,#VSIZE 
      00984A CD 8F 85         [ 4] 4663 	call func_args
      00984D A1 01            [ 1] 4664 	cp a,#1
      00984F 27 03            [ 1] 4665 	jreq 1$
      009851 CC 87 DC         [ 2] 4666 	jp syntax_error
      009854 85               [ 2] 4667 1$: popw x 
      009855 A3 00 0F         [ 2] 4668 	cpw x,#15 
      009858 23 05            [ 2] 4669 	jrule 2$
      00985A A6 0A            [ 1] 4670 	ld a,#ERR_BAD_VALUE
      00985C CC 87 DE         [ 2] 4671 	jp tb_error 
      00985F CD 9E 32         [ 4] 4672 2$:	call select_pin 
      009862 6B 01            [ 1] 4673 	ld (PINNO,sp),a
      009864 E6 01            [ 1] 4674 	ld a,(GPIO_IDR,x)
      009866 0D 01            [ 1] 4675 	tnz (PINNO,sp)
      009868 27 05            [ 1] 4676 	jreq 8$
      00986A 44               [ 1] 4677 3$: srl a 
      00986B 0A 01            [ 1] 4678 	dec (PINNO,sp)
      00986D 26 FB            [ 1] 4679 	jrne 3$ 
      00986F A4 01            [ 1] 4680 8$: and a,#1 
      009871 5F               [ 1] 4681 	clrw x 
      009872 97               [ 1] 4682 	ld xl,a 
      009873 A6 04            [ 1] 4683 	ld a,#TK_INTGR
      0017F5                       4684 	_drop VSIZE
      009875 5B 01            [ 2]    1     addw sp,#VSIZE 
      009877 81               [ 4] 4685 	ret
                                   4686 
                                   4687 ;-----------------------
                                   4688 ; BASIC: DWRITE pin,0|1
                                   4689 ; Arduino pins 
                                   4690 ; write to a digital pin 
                                   4691 ; pin# {0..15}
                                   4692 ; output:
                                   4693 ;    A 		TK_INTGR
                                   4694 ;    X      0|1 
                                   4695 ;-------------------------
                           000001  4696 	PINNO=1
                           000002  4697 	PINVAL=2
                           000002  4698 	VSIZE=2
      009878                       4699 digital_write:
      0017F8                       4700 	_vars VSIZE 
      009878 52 02            [ 2]    1     sub sp,#VSIZE 
      00987A CD 8F 5E         [ 4] 4701 	call arg_list  
      00987D A1 02            [ 1] 4702 	cp a,#2 
      00987F 27 03            [ 1] 4703 	jreq 1$
      009881 CC 87 DC         [ 2] 4704 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009884 85               [ 2] 4705 1$: popw x 
      009885 9F               [ 1] 4706 	ld a,xl 
      009886 6B 02            [ 1] 4707 	ld (PINVAL,sp),a
      009888 85               [ 2] 4708 	popw x 
      009889 A3 00 0F         [ 2] 4709 	cpw x,#15 
      00988C 23 05            [ 2] 4710 	jrule 2$
      00988E A6 0A            [ 1] 4711 	ld a,#ERR_BAD_VALUE
      009890 CC 87 DE         [ 2] 4712 	jp tb_error 
      009893 CD 9E 32         [ 4] 4713 2$:	call select_pin 
      009896 6B 01            [ 1] 4714 	ld (PINNO,sp),a 
      009898 A6 01            [ 1] 4715 	ld a,#1
      00989A 0D 01            [ 1] 4716 	tnz (PINNO,sp)
      00989C 27 05            [ 1] 4717 	jreq 4$
      00989E 48               [ 1] 4718 3$: sll a
      00989F 0A 01            [ 1] 4719 	dec (PINNO,sp)
      0098A1 26 FB            [ 1] 4720 	jrne 3$
      0098A3 0D 02            [ 1] 4721 4$: tnz (PINVAL,sp)
      0098A5 26 05            [ 1] 4722 	jrne 5$
      0098A7 43               [ 1] 4723 	cpl a 
      0098A8 E4 00            [ 1] 4724 	and a,(GPIO_ODR,x)
      0098AA 20 02            [ 2] 4725 	jra 8$
      0098AC EA 00            [ 1] 4726 5$: or a,(GPIO_ODR,x)
      0098AE E7 00            [ 1] 4727 8$: ld (GPIO_ODR,x),a 
      001830                       4728 	_drop VSIZE 
      0098B0 5B 02            [ 2]    1     addw sp,#VSIZE 
      0098B2 81               [ 4] 4729 	ret
                                   4730 
                                   4731 
                                   4732 ;-----------------------
                                   4733 ; BASIC: STOP
                                   4734 ; stop progam execution  
                                   4735 ; without resetting pointers 
                                   4736 ; the program is resumed
                                   4737 ; with RUN 
                                   4738 ;-------------------------
      0098B3                       4739 stop:
      0098B3 72 00 00 26 02   [ 2] 4740 	btjt flags,#FRUN,2$
      0098B8 4F               [ 1] 4741 	clr a
      0098B9 81               [ 4] 4742 	ret 
      0098BA                       4743 2$:	 
                                   4744 ; create space on cstack to save context 
      0098BA AE 98 E1         [ 2] 4745 	ldw x,#break_point 
      0098BD CD 82 57         [ 4] 4746 	call puts 
      001840                       4747 	_drop 2 ;drop return address 
      0098C0 5B 02            [ 2]    1     addw sp,#2 
      001842                       4748 	_vars CTXT_SIZE ; context size 
      0098C2 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      0098C4 CD 94 9E         [ 4] 4749 	call save_context 
      0098C7 AE 16 E8         [ 2] 4750 	ldw x,#tib 
      0098CA CF 00 05         [ 2] 4751 	ldw basicptr,x
      0098CD 7F               [ 1] 4752 	clr (x)
      0098CE 72 5F 00 04      [ 1] 4753 	clr count  
      0098D2 5F               [ 1] 4754 	clrw x 
      0098D3 CF 00 01         [ 2] 4755 	ldw in.w,x
      0098D6 72 11 00 26      [ 1] 4756 	bres flags,#FRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0098DA 72 18 00 26      [ 1] 4757 	bset flags,#FBREAK
      0098DE CC 88 6A         [ 2] 4758 	jp interp_loop 
      0098E1 0A 62 72 65 61 6B 20  4759 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4760 
                                   4761 ;-----------------------
                                   4762 ; BASIC: NEW
                                   4763 ; from command line only 
                                   4764 ; free program memory
                                   4765 ; and clear variables 
                                   4766 ;------------------------
      0098FF                       4767 new: 
      0098FF 72 01 00 26 02   [ 2] 4768 	btjf flags,#FRUN,0$ 
      009904 4F               [ 1] 4769 	clr a 
      009905 81               [ 4] 4770 	ret 
      009906                       4771 0$:	
      009906 CD 86 79         [ 4] 4772 	call clear_basic 
      009909 81               [ 4] 4773 	ret 
                                   4774 	 
                                   4775 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4776 ;  file system routines
                                   4777 ;  MCU flash memory from
                                   4778 ;  0x10000-0x27fff is 
                                   4779 ;  used to store BASIC 
                                   4780 ;  program files. 
                                   4781 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4782 
                                   4783 ;--------------------
                                   4784 ; input:
                                   4785 ;   X     increment 
                                   4786 ; output:
                                   4787 ;   farptr  incremented 
                                   4788 ;---------------------
      00990A                       4789 incr_farptr:
      00990A 72 BB 00 1A      [ 2] 4790 	addw x,farptr+1 
      00990E 24 04            [ 1] 4791 	jrnc 1$
      009910 72 5C 00 19      [ 1] 4792 	inc farptr 
      009914 CF 00 1A         [ 2] 4793 1$:	ldw farptr+1,x  
      009917 81               [ 4] 4794 	ret 
                                   4795 
                                   4796 ;------------------------------
                                   4797 ; extended flash memory used as FLASH_DRIVE 
                                   4798 ; seek end of used flash drive   
                                   4799 ; starting at 0x10000 address.
                                   4800 ; 4 consecutives 0 bytes signal free space. 
                                   4801 ; input:
                                   4802 ;	none
                                   4803 ; output:
                                   4804 ;   ffree     free_addr| 0 if memory full.
                                   4805 ;------------------------------
      009918                       4806 seek_fdrive:
                                   4807 ; start scan at 0x10000 address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009918 A6 01            [ 1] 4808 	ld a,#1
      00991A C7 00 19         [ 1] 4809 	ld farptr,a 
      00991D 5F               [ 1] 4810 	clrw x 
      00991E CF 00 1A         [ 2] 4811 	ldw farptr+1,x 
      009921                       4812 1$:
      009921 AE 00 03         [ 2] 4813 	ldw x,#3  
      009924 92 AF 00 19      [ 5] 4814 2$:	ldf a,([farptr],x) 
      009928 26 05            [ 1] 4815 	jrne 3$
      00992A 5A               [ 2] 4816 	decw x
      00992B 2A F7            [ 1] 4817 	jrpl 2$
      00992D 20 19            [ 2] 4818 	jra 4$ 
      00992F 5C               [ 2] 4819 3$:	incw x 
      009930 CD 99 0A         [ 4] 4820 	call incr_farptr
      009933 AE 02 7F         [ 2] 4821 	ldw x,#0x27f 
      009936 C3 00 19         [ 2] 4822 	cpw x,farptr
      009939 2A E6            [ 1] 4823 	jrpl 1$
                                   4824 ; drive full 
      00993B 72 5F 00 1C      [ 1] 4825 	clr ffree 
      00993F 72 5F 00 1D      [ 1] 4826 	clr ffree+1 
      009943 72 5F 00 1E      [ 1] 4827 	clr ffree+2 
      009947 81               [ 4] 4828 	ret
      009948                       4829 4$: ; copy farptr to ffree	 
      009948 CE 00 19         [ 2] 4830 	ldw x,farptr 
      00994B C6 00 1B         [ 1] 4831 	ld a,farptr+2 
      00994E CF 00 1C         [ 2] 4832 	ldw ffree,x 
      009951 C7 00 1E         [ 1] 4833 	ld ffree+2,a  
      009954 81               [ 4] 4834 	ret 
                                   4835 
                                   4836 ;-----------------------
                                   4837 ; compare file name 
                                   4838 ; with name pointed by Y  
                                   4839 ; input:
                                   4840 ;   farptr   file name 
                                   4841 ;   Y        target name 
                                   4842 ; output:
                                   4843 ;   farptr 	 at file_name
                                   4844 ;   X 		 farptr[x] point at size field  
                                   4845 ;   Carry    0|1 no match|match  
                                   4846 ;----------------------
      009955                       4847 cmp_name:
      009955 5F               [ 1] 4848 	clrw x
      009956 92 AF 00 19      [ 5] 4849 1$:	ldf a,([farptr],x)
      00995A 90 F1            [ 1] 4850 	cp a,(y)
      00995C 26 08            [ 1] 4851 	jrne 4$
      00995E 4D               [ 1] 4852 	tnz a 
      00995F 27 12            [ 1] 4853 	jreq 9$ 
      009961 5C               [ 2] 4854     incw x 
      009962 90 5C            [ 2] 4855 	incw y 
      009964 20 F0            [ 2] 4856 	jra 1$
      009966                       4857 4$: ;no match 
      009966 4D               [ 1] 4858 	tnz a 
      009967 27 07            [ 1] 4859 	jreq 5$
      009969 5C               [ 2] 4860 	incw x 
      00996A 92 AF 00 19      [ 5] 4861 	ldf a,([farptr],x)
      00996E 20 F6            [ 2] 4862 	jra 4$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009970 5C               [ 2] 4863 5$:	incw x ; farptr[x] point at 'size' field 
      009971 98               [ 1] 4864 	rcf 
      009972 81               [ 4] 4865 	ret
      009973                       4866 9$: ; match  
      009973 5C               [ 2] 4867 	incw x  ; farptr[x] at 'size' field 
      009974 99               [ 1] 4868 	scf 
      009975 81               [ 4] 4869 	ret 
                                   4870 
                                   4871 ;-----------------------
                                   4872 ; search file in 
                                   4873 ; flash memory 
                                   4874 ; input:
                                   4875 ;   Y       file name  
                                   4876 ; output:
                                   4877 ;   farptr  addr at name|0
                                   4878 ;-----------------------
                           000001  4879 	FSIZE=1
                           000003  4880 	YSAVE=3
                           000004  4881 	VSIZE=4 
      009976                       4882 search_file: 
      0018F6                       4883 	_vars VSIZE
      009976 52 04            [ 2]    1     sub sp,#VSIZE 
      009978 17 03            [ 2] 4884 	ldw (YSAVE,sp),y  
      00997A 5F               [ 1] 4885 	clrw x 
      00997B CF 00 1A         [ 2] 4886 	ldw farptr+1,x 
      00997E 35 01 00 19      [ 1] 4887 	mov farptr,#1
      009982                       4888 1$:	
                                   4889 ; check if farptr is after any file 
                                   4890 ; if  0 then so.
      009982 92 BC 00 19      [ 5] 4891 	ldf a,[farptr]
      009986 27 25            [ 1] 4892 	jreq 6$
      009988 5F               [ 1] 4893 2$: clrw x 	
      009989 16 03            [ 2] 4894 	ldw y,(YSAVE,sp) 
      00998B CD 99 55         [ 4] 4895 	call cmp_name
      00998E 25 2D            [ 1] 4896 	jrc 9$
      009990 92 AF 00 19      [ 5] 4897 	ldf a,([farptr],x)
      009994 6B 01            [ 1] 4898 	ld (FSIZE,sp),a 
      009996 5C               [ 2] 4899 	incw x 
      009997 92 AF 00 19      [ 5] 4900 	ldf a,([farptr],x)
      00999B 6B 02            [ 1] 4901 	ld (FSIZE+1,sp),a 
      00999D 5C               [ 2] 4902 	incw x 
      00999E 72 FB 01         [ 2] 4903 	addw x,(FSIZE,sp) ; count to skip 
      0099A1 5C               [ 2] 4904 	incw x ; skip over EOF marker 
      0099A2 CD 99 0A         [ 4] 4905 	call incr_farptr ; now at next file 'name_field'
      0099A5 AE 02 80         [ 2] 4906 	ldw x,#0x280
      0099A8 C3 00 19         [ 2] 4907 	cpw x,farptr 
      0099AB 2A D5            [ 1] 4908 	jrpl 1$
      0099AD                       4909 6$: ; file not found 
      0099AD 72 5F 00 19      [ 1] 4910 	clr farptr
      0099B1 72 5F 00 1A      [ 1] 4911 	clr farptr+1 
      0099B5 72 5F 00 1B      [ 1] 4912 	clr farptr+2 
      001939                       4913 	_drop VSIZE 
      0099B9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0099BB 98               [ 1] 4914 	rcf
      0099BC 81               [ 4] 4915 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0099BD                       4916 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00193D                       4917 	_drop VSIZE 
      0099BD 5B 04            [ 2]    1     addw sp,#VSIZE 
      0099BF 99               [ 1] 4918 	scf 	
      0099C0 81               [ 4] 4919 	ret
                                   4920 
                                   4921 
                                   4922 ;--------------------------------
                                   4923 ; BASIC: SAVE "name" 
                                   4924 ; save text program in 
                                   4925 ; flash memory used as 
                                   4926 ;--------------------------------
                           000001  4927 	BSIZE=1
                           000003  4928 	NAMEPTR=3
                           000004  4929 	VSIZE=4
      0099C1                       4930 save:
      0099C1 72 01 00 26 05   [ 2] 4931 	btjf flags,#FRUN,0$ 
      0099C6 A6 07            [ 1] 4932 	ld a,#ERR_CMD_ONLY 
      0099C8 CC 87 DE         [ 2] 4933 	jp tb_error
      0099CB                       4934 0$:	 
      0099CB CE 00 21         [ 2] 4935 	ldw x,txtend 
      0099CE 72 B0 00 1F      [ 2] 4936 	subw x,txtbgn
      0099D2 26 05            [ 1] 4937 	jrne 1$
                                   4938 ; nothing to save 
      0099D4 A6 0D            [ 1] 4939 	ld a,#ERR_NO_PROG
      0099D6 CC 87 DE         [ 2] 4940 	jp tb_error 	
      0099D9                       4941 1$:	
      001959                       4942 	_vars VSIZE 
      0099D9 52 04            [ 2]    1     sub sp,#VSIZE 
      0099DB 1F 01            [ 2] 4943 	ldw (BSIZE,sp),x 
      0099DD CD 88 98         [ 4] 4944 	call next_token	
      0099E0 A1 0A            [ 1] 4945 	cp a,#TK_QSTR
      0099E2 27 03            [ 1] 4946 	jreq 2$
      0099E4 CC 87 DC         [ 2] 4947 	jp syntax_error
      0099E7                       4948 2$: 
      0099E7 1F 03            [ 2] 4949 	ldw (NAMEPTR,sp),x  
      0099E9 55 00 04 00 02   [ 1] 4950 	mov in,count 
                                   4951 ; check if enough free space 
      0099EE CD 82 8B         [ 4] 4952 	call strlen 
      0099F1 1C 00 03         [ 2] 4953 	addw x,#3 
      0099F4 72 FB 01         [ 2] 4954 	addw x,(BSIZE,sp)
      0099F7 72 5D 00 1C      [ 1] 4955 	tnz ffree 
      0099FB 26 0B            [ 1] 4956 	jrne 21$
      0099FD 72 B0 00 1D      [ 2] 4957 	subw x,ffree+1 
      009A01 23 05            [ 2] 4958 	jrule 21$
      009A03 A6 0E            [ 1] 4959 	ld a,#ERR_NO_FSPACE  
      009A05 CC 87 DE         [ 2] 4960 	jp tb_error
      009A08                       4961 21$: 
                                   4962 ; check for existing file of that name 
      009A08 16 03            [ 2] 4963 	ldw y,(NAMEPTR,sp)	
      009A0A CD 99 76         [ 4] 4964 	call search_file 
      009A0D 24 05            [ 1] 4965 	jrnc 3$ 
      009A0F A6 08            [ 1] 4966 	ld a,#ERR_DUPLICATE 
      009A11 CC 87 DE         [ 2] 4967 	jp tb_error 
      009A14                       4968 3$:	;** write file name to flash **
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009A14 CE 00 1C         [ 2] 4969 	ldw x,ffree 
      009A17 C6 00 1E         [ 1] 4970 	ld a,ffree+2 
      009A1A CF 00 19         [ 2] 4971 	ldw farptr,x 
      009A1D C7 00 1B         [ 1] 4972 	ld farptr+2,a 
      009A20 1E 03            [ 2] 4973 	ldw x,(NAMEPTR,sp)  
      009A22 CD 82 8B         [ 4] 4974 	call strlen 
      009A25 5C               [ 2] 4975 	incw  x
      009A26 1F 01            [ 2] 4976 	ldw (BSIZE,sp),x  
      009A28 5F               [ 1] 4977 	clrw x   
      009A29 16 03            [ 2] 4978 	ldw y,(NAMEPTR,sp)
      009A2B CD 81 E6         [ 4] 4979 	call write_block  
                                   4980 ;** write file length after name **
      009A2E CE 00 21         [ 2] 4981 	ldw x,txtend 
      009A31 72 B0 00 1F      [ 2] 4982 	subw x,txtbgn
      009A35 1F 01            [ 2] 4983 	ldw (BSIZE,sp),x 
      009A37 5F               [ 1] 4984 	clrw x 
      009A38 7B 01            [ 1] 4985 	ld a,(BSIZE,sp)
      009A3A CD 81 71         [ 4] 4986 	call write_byte 
      009A3D 5C               [ 2] 4987 	incw x 
      009A3E 7B 02            [ 1] 4988 	ld a,(BSIZE+1,sp)
      009A40 CD 81 71         [ 4] 4989 	call write_byte
      009A43 5C               [ 2] 4990 	incw x  
      009A44 CD 99 0A         [ 4] 4991 	call incr_farptr ; move farptr after SIZE field 
                                   4992 ;** write BASIC text **
                                   4993 ; copy BSIZE, stack:{... bsize -- ... bsize bsize }	
      009A47 1E 01            [ 2] 4994 	ldw x,(BSIZE,sp)
      009A49 89               [ 2] 4995 	pushw x ; write_block argument 
      009A4A 5F               [ 1] 4996 	clrw x 
      009A4B 90 CE 00 1F      [ 2] 4997 	ldw y,txtbgn  ; BASIC text to save 
      009A4F CD 81 E6         [ 4] 4998 	call write_block 
      0019D2                       4999 	_drop 2 ;  drop write_block argument  
      009A52 5B 02            [ 2]    1     addw sp,#2 
                                   5000 ; write end of file marker 
      009A54 AE 00 01         [ 2] 5001 	ldw x,#1
      009A57 A6 FF            [ 1] 5002 	ld a,#EOF  
      009A59 CD 81 71         [ 4] 5003 	call write_byte 
      009A5C CD 99 0A         [ 4] 5004 	call incr_farptr
                                   5005 ; save farptr in ffree
      009A5F CE 00 19         [ 2] 5006 	ldw x,farptr 
      009A62 C6 00 1B         [ 1] 5007 	ld a,farptr+2 
      009A65 CF 00 1C         [ 2] 5008 	ldw ffree,x 
      009A68 C7 00 1E         [ 1] 5009 	ld ffree+2,a
                                   5010 ;write 4 zero bytes as an end of all files marker 
      009A6B 5F               [ 1] 5011     clrw x 
      009A6C 4B 04            [ 1] 5012 	push #4 
      009A6E                       5013 4$:
      009A6E 4F               [ 1] 5014 	clr a 
      009A6F CD 81 71         [ 4] 5015 	call write_byte 
      009A72 5C               [ 2] 5016 	incw x 
      009A73 0A 01            [ 1] 5017 	dec (1,sp)
      009A75 26 F7            [ 1] 5018 	jrne 4$
      009A77 84               [ 1] 5019 5$: pop a 
                                   5020 ; display saved size  
      009A78 1E 01            [ 2] 5021 	ldw x,(BSIZE,sp) 
      009A7A CD 89 2D         [ 4] 5022 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0019FD                       5023 	_drop VSIZE 
      009A7D 5B 04            [ 2]    1     addw sp,#VSIZE 
      009A7F 81               [ 4] 5024 	ret 
                                   5025 
                                   5026 ;----------------------
                                   5027 ; load file in RAM memory
                                   5028 ; input:
                                   5029 ;    farptr point at file size 
                                   5030 ; output:
                                   5031 ;   y point after BASIC program in RAM.
                                   5032 ;------------------------
      009A80                       5033 load_file:
      009A80 CD 99 0A         [ 4] 5034 	call incr_farptr  
      009A83 CD 86 79         [ 4] 5035 	call clear_basic  
      009A86 5F               [ 1] 5036 	clrw x
      009A87 92 AF 00 19      [ 5] 5037 	ldf a,([farptr],x)
      009A8B 90 95            [ 1] 5038 	ld yh,a 
      009A8D 5C               [ 2] 5039 	incw x  
      009A8E 92 AF 00 19      [ 5] 5040 	ldf a,([farptr],x)
      009A92 5C               [ 2] 5041 	incw x 
      009A93 90 97            [ 1] 5042 	ld yl,a 
      009A95 72 B9 00 1F      [ 2] 5043 	addw y,txtbgn
      009A99 90 CF 00 21      [ 2] 5044 	ldw txtend,y
      009A9D 90 CE 00 1F      [ 2] 5045 	ldw y,txtbgn
      009AA1                       5046 3$:	; load BASIC text 	
      009AA1 92 AF 00 19      [ 5] 5047 	ldf a,([farptr],x)
      009AA5 90 F7            [ 1] 5048 	ld (y),a 
      009AA7 5C               [ 2] 5049 	incw x 
      009AA8 90 5C            [ 2] 5050 	incw y 
      009AAA 90 C3 00 21      [ 2] 5051 	cpw y,txtend 
      009AAE 2B F1            [ 1] 5052 	jrmi 3$
      009AB0 81               [ 4] 5053 	ret 
                                   5054 
                                   5055 ;------------------------
                                   5056 ; BASIC: LOAD "file" 
                                   5057 ; load file to RAM 
                                   5058 ; for execution 
                                   5059 ;------------------------
      009AB1                       5060 load:
      009AB1 72 01 00 26 07   [ 2] 5061 	btjf flags,#FRUN,0$ 
      009AB6 27 05            [ 1] 5062 	jreq 0$ 
      009AB8 A6 07            [ 1] 5063 	ld a,#ERR_CMD_ONLY 
      009ABA CC 87 DE         [ 2] 5064 	jp tb_error 
      009ABD                       5065 0$:	
      009ABD CD 88 98         [ 4] 5066 	call next_token 
      009AC0 A1 0A            [ 1] 5067 	cp a,#TK_QSTR
      009AC2 27 03            [ 1] 5068 	jreq 1$
      009AC4 CC 87 DC         [ 2] 5069 	jp syntax_error 
      009AC7 90 93            [ 1] 5070 1$:	ldw y,x 
      009AC9 55 00 04 00 02   [ 1] 5071 	mov in,count 
      009ACE CD 99 76         [ 4] 5072 	call search_file 
      009AD1 25 05            [ 1] 5073 	jrc 2$ 
      009AD3 A6 09            [ 1] 5074 	ld a,#ERR_NOT_FILE
      009AD5 CC 87 DE         [ 2] 5075 	jp tb_error  
      009AD8                       5076 2$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009AD8 CD 9A 80         [ 4] 5077 	call load_file
                                   5078 ; print loaded size 	 
      009ADB CE 00 21         [ 2] 5079 	ldw x,txtend 
      009ADE 72 B0 00 1F      [ 2] 5080 	subw x,txtbgn
      009AE2 CD 89 2D         [ 4] 5081 	call print_int 
      009AE5 81               [ 4] 5082 	ret 
                                   5083 
                                   5084 ;-----------------------------------
                                   5085 ; BASIC: FORGET ["file_name"] 
                                   5086 ; erase file_name and all others 
                                   5087 ; after it. 
                                   5088 ; without argument erase all files 
                                   5089 ;-----------------------------------
      009AE6                       5090 forget:
      009AE6 CD 88 98         [ 4] 5091 	call next_token 
      009AE9 A1 00            [ 1] 5092 	cp a,#TK_NONE 
      009AEB 27 20            [ 1] 5093 	jreq 3$ 
      009AED A1 0A            [ 1] 5094 	cp a,#TK_QSTR
      009AEF 27 03            [ 1] 5095 	jreq 1$
      009AF1 CC 87 DC         [ 2] 5096 	jp syntax_error
      009AF4 90 93            [ 1] 5097 1$: ldw y,x 
      009AF6 55 00 04 00 02   [ 1] 5098 	mov in,count 
      009AFB CD 99 76         [ 4] 5099 	call search_file
      009AFE 25 05            [ 1] 5100 	jrc 2$
      009B00 A6 09            [ 1] 5101 	ld a,#ERR_NOT_FILE 
      009B02 CC 87 DE         [ 2] 5102 	jp tb_error 
      009B05                       5103 2$: 
      009B05 CE 00 19         [ 2] 5104 	ldw x,farptr
      009B08 C6 00 1B         [ 1] 5105 	ld a,farptr+2
      009B0B 20 0A            [ 2] 5106 	jra 4$ 
      009B0D                       5107 3$: ; forget all files 
      009B0D AE 01 00         [ 2] 5108 	ldw x,#0x100
      009B10 4F               [ 1] 5109 	clr a 
      009B11 CF 00 19         [ 2] 5110 	ldw farptr,x 
      009B14 C7 00 1B         [ 1] 5111 	ld farptr+2,a 
      009B17                       5112 4$:
      009B17 CF 00 1C         [ 2] 5113 	ldw ffree,x 
      009B1A C7 00 1E         [ 1] 5114 	ld ffree+2,a 
      009B1D 4B 04            [ 1] 5115 	push #4
      009B1F 5F               [ 1] 5116 	clrw x 
      009B20                       5117 5$: 
      009B20 4F               [ 1] 5118 	clr a  
      009B21 CD 81 71         [ 4] 5119 	call write_byte 
      009B24 5C               [ 2] 5120 	incw x 
      009B25 0A 01            [ 1] 5121 	dec (1,sp)
      009B27 26 F7            [ 1] 5122 	jrne 5$	
      009B29 84               [ 1] 5123 6$: pop a 
      009B2A 81               [ 4] 5124 	ret 
                                   5125 
                                   5126 ;----------------------
                                   5127 ; BASIC: DIR 
                                   5128 ; list saved files 
                                   5129 ;----------------------
                           000001  5130 	COUNT=1 ; files counter 
                           000002  5131 	VSIZE=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B2B                       5132 directory:
      001AAB                       5133 	_vars VSIZE 
      009B2B 52 02            [ 2]    1     sub sp,#VSIZE 
      009B2D 5F               [ 1] 5134 	clrw x 
      009B2E 1F 01            [ 2] 5135 	ldw (COUNT,sp),x 
      009B30 CF 00 1A         [ 2] 5136 	ldw farptr+1,x 
      009B33 35 01 00 19      [ 1] 5137 	mov farptr,#1 
      009B37                       5138 dir_loop:
      009B37 5F               [ 1] 5139 	clrw x 
      009B38 92 AF 00 19      [ 5] 5140 	ldf a,([farptr],x)
      009B3C 27 39            [ 1] 5141 	jreq 8$ 
      009B3E                       5142 1$: ;name loop 	
      009B3E 92 AF 00 19      [ 5] 5143 	ldf a,([farptr],x)
      009B42 27 06            [ 1] 5144 	jreq 2$ 
      009B44 CD 82 44         [ 4] 5145 	call putc 
      009B47 5C               [ 2] 5146 	incw x 
      009B48 20 F4            [ 2] 5147 	jra 1$
      009B4A 5C               [ 2] 5148 2$: incw x ; skip ending 0. 
      009B4B A6 20            [ 1] 5149 	ld a,#SPACE 
      009B4D CD 82 44         [ 4] 5150 	call putc 
                                   5151 ; get file size 	
      009B50 92 AF 00 19      [ 5] 5152 	ldf a,([farptr],x)
      009B54 90 95            [ 1] 5153 	ld yh,a 
      009B56 5C               [ 2] 5154 	incw x 
      009B57 92 AF 00 19      [ 5] 5155 	ldf a,([farptr],x)
      009B5B 5C               [ 2] 5156 	incw x 
      009B5C 90 97            [ 1] 5157 	ld yl,a 
      009B5E 90 89            [ 2] 5158 	pushw y 
      009B60 72 FB 01         [ 2] 5159 	addw x,(1,sp)
      009B63 5C               [ 2] 5160 	incw x ; skip EOF marker 
                                   5161 ; skip to next file 
      009B64 CD 99 0A         [ 4] 5162 	call incr_farptr 
                                   5163 ; print file size 
      009B67 85               [ 2] 5164 	popw x ; file size 
      009B68 CD 89 2D         [ 4] 5165 	call print_int 
      009B6B A6 0D            [ 1] 5166 	ld a,#CR 
      009B6D CD 82 44         [ 4] 5167 	call putc
      009B70 1E 01            [ 2] 5168 	ldw x,(COUNT,sp)
      009B72 5C               [ 2] 5169 	incw x
      009B73 1F 01            [ 2] 5170 	ldw (COUNT,sp),x  
      009B75 20 C0            [ 2] 5171 	jra dir_loop 
      009B77                       5172 8$: ; print number of files 
      009B77 1E 01            [ 2] 5173 	ldw x,(COUNT,sp)
      009B79 CD 89 2D         [ 4] 5174 	call print_int 
      009B7C AE 9B AC         [ 2] 5175 	ldw x,#file_count 
      009B7F CD 82 57         [ 4] 5176 	call puts  
                                   5177 ; print drive free space 	
      009B82 A6 FF            [ 1] 5178 	ld a,#0xff 
      009B84 C0 00 1E         [ 1] 5179 	sub a,ffree+2 
      009B87 C7 00 0E         [ 1] 5180 	ld acc8,a 
      009B8A A6 7F            [ 1] 5181 	ld a,#0x7f 
      009B8C C2 00 1D         [ 1] 5182 	sbc a,ffree+1 
      009B8F C7 00 0D         [ 1] 5183 	ld acc16,a 
      009B92 A6 02            [ 1] 5184 	ld a,#2 
      009B94 C2 00 1C         [ 1] 5185 	sbc a,ffree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B97 C7 00 0C         [ 1] 5186 	ld acc24,a 
      009B9A 5F               [ 1] 5187 	clrw x  
      009B9B A6 06            [ 1] 5188 	ld a,#6 
      009B9D 97               [ 1] 5189 	ld xl,a 
      009B9E A6 0A            [ 1] 5190 	ld a,#10 
      009BA0 CD 88 E5         [ 4] 5191 	call prti24 
      009BA3 AE 9B B4         [ 2] 5192 	ldw x,#drive_free
      009BA6 CD 82 57         [ 4] 5193 	call puts 
      001B29                       5194 	_drop VSIZE 
      009BA9 5B 02            [ 2]    1     addw sp,#VSIZE 
      009BAB 81               [ 4] 5195 	ret
      009BAC 20 66 69 6C 65 73 0A  5196 file_count: .asciz " files\n"
             00
      009BB4 20 62 79 74 65 73 20  5197 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5198 
                                   5199 ;---------------------
                                   5200 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5201 ; write 1 or more byte to FLASH or EEPROM
                                   5202 ; starting at address  
                                   5203 ; input:
                                   5204 ;   expr1  	is address 
                                   5205 ;   expr2,...,exprn   are bytes to write
                                   5206 ; output:
                                   5207 ;   none 
                                   5208 ;---------------------
                           000001  5209 	ADDR=1
                           000002  5210 	VSIZ=2 
      009BC1                       5211 write:
      001B41                       5212 	_vars VSIZE 
      009BC1 52 02            [ 2]    1     sub sp,#VSIZE 
      009BC3 72 5F 00 19      [ 1] 5213 	clr farptr ; expect 16 bits address 
      009BC7 CD 90 6A         [ 4] 5214 	call expression
      009BCA A1 04            [ 1] 5215 	cp a,#TK_INTGR 
      009BCC 27 03            [ 1] 5216 	jreq 0$
      009BCE CC 87 DC         [ 2] 5217 	jp syntax_error
      009BD1 1F 01            [ 2] 5218 0$: ldw (ADDR,sp),x 
      009BD3 CD 88 98         [ 4] 5219 	call next_token 
      009BD6 A1 0D            [ 1] 5220 	cp a,#TK_COMMA 
      009BD8 27 02            [ 1] 5221 	jreq 1$ 
      009BDA 20 19            [ 2] 5222 	jra 9$ 
      009BDC CD 90 6A         [ 4] 5223 1$:	call expression
      009BDF A1 04            [ 1] 5224 	cp a,#TK_INTGR
      009BE1 27 03            [ 1] 5225 	jreq 2$
      009BE3 CC 87 DC         [ 2] 5226 	jp syntax_error
      009BE6 9F               [ 1] 5227 2$:	ld a,xl 
      009BE7 1E 01            [ 2] 5228 	ldw x,(ADDR,sp) 
      009BE9 CF 00 1A         [ 2] 5229 	ldw farptr+1,x 
      009BEC 5F               [ 1] 5230 	clrw x 
      009BED CD 81 71         [ 4] 5231 	call write_byte
      009BF0 1E 01            [ 2] 5232 	ldw x,(ADDR,sp)
      009BF2 5C               [ 2] 5233 	incw x 
      009BF3 20 DC            [ 2] 5234 	jra 0$ 
      009BF5                       5235 9$:
      001B75                       5236 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BF5 5B 02            [ 2]    1     addw sp,#VSIZE 
      009BF7 81               [ 4] 5237 	ret 
                                   5238 
                                   5239 
                                   5240 ;---------------------
                                   5241 ;BASIC: CHAR(expr)
                                   5242 ; évaluate expression 
                                   5243 ; and take the 7 least 
                                   5244 ; bits as ASCII character
                                   5245 ;---------------------
      009BF8                       5246 char:
      009BF8 CD 8F 85         [ 4] 5247 	call func_args 
      009BFB A1 01            [ 1] 5248 	cp a,#1
      009BFD 27 03            [ 1] 5249 	jreq 1$
      009BFF CC 87 DC         [ 2] 5250 	jp syntax_error
      009C02 85               [ 2] 5251 1$:	popw x 
      009C03 9F               [ 1] 5252 	ld a,xl 
      009C04 A4 7F            [ 1] 5253 	and a,#0x7f 
      009C06 97               [ 1] 5254 	ld xl,a
      009C07 A6 03            [ 1] 5255 	ld a,#TK_CHAR
      009C09 81               [ 4] 5256 	ret
                                   5257 
                                   5258 ;---------------------
                                   5259 ; BASIC: ASC(string|char)
                                   5260 ; extract first character 
                                   5261 ; of string argument 
                                   5262 ; return it as TK_INTGR 
                                   5263 ;---------------------
      009C0A                       5264 ascii:
      009C0A A6 0B            [ 1] 5265 	ld a,#TK_LPAREN
      009C0C CD 8F 51         [ 4] 5266 	call expect 
      009C0F CD 88 98         [ 4] 5267 	call next_token 
      009C12 A1 0A            [ 1] 5268 	cp a,#TK_QSTR 
      009C14 27 07            [ 1] 5269 	jreq 1$
      009C16 A1 03            [ 1] 5270 	cp a,#TK_CHAR 
      009C18 27 06            [ 1] 5271 	jreq 2$ 
      009C1A CC 87 DC         [ 2] 5272 	jp syntax_error
      009C1D                       5273 1$: 
      009C1D F6               [ 1] 5274 	ld a,(x) 
      009C1E 5F               [ 1] 5275 	clrw x
      009C1F 97               [ 1] 5276 	ld xl,a 
      009C20                       5277 2$: 
      009C20 89               [ 2] 5278 	pushw x 
      009C21 A6 0C            [ 1] 5279 	ld a,#TK_RPAREN 
      009C23 CD 8F 51         [ 4] 5280 	call expect
      009C26 85               [ 2] 5281 	popw x 
      009C27 A6 04            [ 1] 5282 	ld a,#TK_INTGR 
      009C29 81               [ 4] 5283 	ret 
                                   5284 
                                   5285 ;---------------------
                                   5286 ;BASIC: KEY
                                   5287 ; wait for a character 
                                   5288 ; received from STDIN 
                                   5289 ; input:
                                   5290 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5291 ; output:
                                   5292 ;	X 		ASCII character 
                                   5293 ;---------------------
      009C2A                       5294 key:
      009C2A CD 82 4D         [ 4] 5295 	call getc 
      009C2D 5F               [ 1] 5296 	clrw x 
      009C2E 97               [ 1] 5297 	ld xl,a 
      009C2F A6 04            [ 1] 5298 	ld a,#TK_INTGR
      009C31 81               [ 4] 5299 	ret
                                   5300 
                                   5301 ;----------------------
                                   5302 ; BASIC: QKEY
                                   5303 ; Return true if there 
                                   5304 ; is a character in 
                                   5305 ; waiting in STDIN 
                                   5306 ; input:
                                   5307 ;  none 
                                   5308 ; output:
                                   5309 ;   X 		0|-1 
                                   5310 ;-----------------------
      009C32                       5311 qkey:: 
      009C32 5F               [ 1] 5312 	clrw x 
      009C33 72 5D 00 28      [ 1] 5313 	tnz rx_char
      009C37 27 01            [ 1] 5314 	jreq 9$ 
      009C39 53               [ 2] 5315 	cplw x 
      009C3A A6 04            [ 1] 5316 9$: ld a,#TK_INTGR
      009C3C 81               [ 4] 5317 	ret 
                                   5318 
                                   5319 ;---------------------
                                   5320 ; BASIC: GPIO(expr,reg)
                                   5321 ; return gpio address 
                                   5322 ; expr {0..8}
                                   5323 ; input:
                                   5324 ;   none 
                                   5325 ; output:
                                   5326 ;   X 		gpio register address
                                   5327 ;----------------------------
                           000003  5328 	PORT=3
                           000001  5329 	REG=1 
                           000004  5330 	VSIZE=4 
      009C3D                       5331 gpio:
      009C3D CD 8F 85         [ 4] 5332 	call func_args 
      009C40 A1 02            [ 1] 5333 	cp a,#2
      009C42 27 03            [ 1] 5334 	jreq 1$
      009C44 CC 87 DC         [ 2] 5335 	jp syntax_error  
      009C47                       5336 1$:	
      009C47 1E 03            [ 2] 5337 	ldw x,(PORT,sp)
      009C49 2B 17            [ 1] 5338 	jrmi bad_port
      009C4B A3 00 09         [ 2] 5339 	cpw x,#9
      009C4E 2A 12            [ 1] 5340 	jrpl bad_port
      009C50 A6 05            [ 1] 5341 	ld a,#5
      009C52 42               [ 4] 5342 	mul x,a
      009C53 1C 50 00         [ 2] 5343 	addw x,#GPIO_BASE 
      009C56 1F 03            [ 2] 5344 	ldw (PORT,sp),x  
      009C58 1E 01            [ 2] 5345 	ldw x,(REG,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C5A 72 FB 03         [ 2] 5346 	addw x,(PORT,sp)
      009C5D A6 04            [ 1] 5347 	ld a,#TK_INTGR
      001BDF                       5348 	_drop VSIZE 
      009C5F 5B 04            [ 2]    1     addw sp,#VSIZE 
      009C61 81               [ 4] 5349 	ret
      009C62                       5350 bad_port:
      009C62 A6 0A            [ 1] 5351 	ld a,#ERR_BAD_VALUE
      009C64 CC 87 DE         [ 2] 5352 	jp tb_error
                                   5353 
                                   5354 
                                   5355 ;-------------------------
                                   5356 ; BASIC: UFLASH 
                                   5357 ; return user flash address
                                   5358 ; input:
                                   5359 ;  none 
                                   5360 ; output:
                                   5361 ;	A		TK_INTGR
                                   5362 ;   X 		user address 
                                   5363 ;---------------------------
      009C67                       5364 uflash:
      009C67 AE A6 00         [ 2] 5365 	ldw x,#user_space 
      009C6A A6 04            [ 1] 5366 	ld a,#TK_INTGR 
      009C6C 81               [ 4] 5367 	ret 
                                   5368 
                                   5369 
                                   5370 ;---------------------
                                   5371 ; BASIC: USR(addr[,arg])
                                   5372 ; execute a function written 
                                   5373 ; in binary code.
                                   5374 ; binary fonction should 
                                   5375 ; return token attribute in A 
                                   5376 ; and value in X. 
                                   5377 ; input:
                                   5378 ;   addr	routine address 
                                   5379 ;   arg 	is an optional argument 
                                   5380 ; output:
                                   5381 ;   A 		token attribute 
                                   5382 ;   X       returned value 
                                   5383 ;---------------------
      009C6D                       5384 usr:
      009C6D 90 89            [ 2] 5385 	pushw y 	
      009C6F CD 8F 85         [ 4] 5386 	call func_args 
      009C72 A1 01            [ 1] 5387 	cp a,#1 
      009C74 27 07            [ 1] 5388 	jreq 2$
      009C76 A1 02            [ 1] 5389 	cp a,#2
      009C78 27 03            [ 1] 5390 	jreq 2$  
      009C7A CC 87 DC         [ 2] 5391 	jp syntax_error 
      009C7D 90 85            [ 2] 5392 2$: popw y  ; arg|addr 
      009C7F A1 01            [ 1] 5393 	cp a,#1
      009C81 27 02            [ 1] 5394 	jreq 3$
      009C83 85               [ 2] 5395 	popw x ; addr
      009C84 51               [ 1] 5396 	exgw x,y 
      009C85 90 FD            [ 4] 5397 3$: call (y)
      009C87 90 85            [ 2] 5398 	popw y 
      009C89 81               [ 4] 5399 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5400 
                                   5401 ;------------------------------
                                   5402 ; BASIC: BYE 
                                   5403 ; halt mcu in its lowest power mode 
                                   5404 ; wait for reset or external interrupt
                                   5405 ; do a cold start on wakeup.
                                   5406 ;------------------------------
      009C8A                       5407 bye:
      009C8A 72 0D 52 30 FB   [ 2] 5408 	btjf UART1_SR,#UART_SR_TC,.
      009C8F 8E               [10] 5409 	halt
      009C90 CC 85 6E         [ 2] 5410 	jp cold_start  
                                   5411 
                                   5412 ;----------------------------------
                                   5413 ; BASIC: AUTORUN ["file_name"] 
                                   5414 ; record in eeprom at adrress AUTORUN_NAME
                                   5415 ; the name of file to load and execute
                                   5416 ; at startup. 
                                   5417 ; empty string delete autorun name 
                                   5418 ; no argument display autorun name  
                                   5419 ; input:
                                   5420 ;   file_name   file to execute 
                                   5421 ; output:
                                   5422 ;   none
                                   5423 ;-----------------------------------
      009C93                       5424 autorun: 
      009C93 72 01 00 26 07   [ 2] 5425 	btjf flags,#FRUN,0$ 
      009C98 27 05            [ 1] 5426 	jreq 0$ 
      009C9A A6 07            [ 1] 5427 	ld a,#ERR_CMD_ONLY 
      009C9C CC 87 DE         [ 2] 5428 	jp tb_error 
      009C9F                       5429 0$:	
      009C9F CD 88 98         [ 4] 5430 	call next_token
      009CA2 26 08            [ 1] 5431 	jrne 1$
      009CA4 AE 40 00         [ 2] 5432 	ldw x,#AUTORUN_NAME
      009CA7 CD 82 57         [ 4] 5433 	call puts 
      009CAA 4F               [ 1] 5434 	clr a 
      009CAB 81               [ 4] 5435 	ret 
      009CAC                       5436 1$:
      009CAC A1 0A            [ 1] 5437 	cp a,#TK_QSTR
      009CAE 27 03            [ 1] 5438 	jreq 2$
      009CB0 CC 87 DC         [ 2] 5439 	jp syntax_error 
      009CB3                       5440 2$:	
      009CB3 7D               [ 1] 5441 	tnz (x) 
      009CB4 26 08            [ 1] 5442 	jrne 3$
                                   5443 ; empty string, delete autorun 	
      009CB6 CD 86 2C         [ 4] 5444 	call cancel_autorun
      009CB9 72 5F 00 04      [ 1] 5445 	clr count 
      009CBD 81               [ 4] 5446 	ret 
      009CBE 89               [ 2] 5447 3$:	pushw x 
      009CBF 90 93            [ 1] 5448 	ldw y,x  
      009CC1 CD 99 76         [ 4] 5449 	call search_file 
      009CC4 25 05            [ 1] 5450 	jrc 4$ 
      009CC6 A6 09            [ 1] 5451 	ld a,#ERR_NOT_FILE
      009CC8 CC 87 DE         [ 2] 5452 	jp tb_error  
      009CCB                       5453 4$: 
      009CCB 55 00 04 00 02   [ 1] 5454 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009CD0 72 5F 00 19      [ 1] 5455 	clr farptr 
      009CD4 AE 40 00         [ 2] 5456 	ldw x,#AUTORUN_NAME
      009CD7 CF 00 1A         [ 2] 5457 	ldw farptr+1,x 
      009CDA 1E 01            [ 2] 5458 	ldw x,(1,sp)  
      009CDC CD 82 8B         [ 4] 5459 	call strlen  ; return length in X 
      009CDF 5C               [ 2] 5460 	incw x 
      009CE0 90 85            [ 2] 5461 	popw y 
      009CE2 89               [ 2] 5462 	pushw x 
      009CE3 5F               [ 1] 5463 	clrw x 
      009CE4 CD 81 E6         [ 4] 5464 	call write_block 
      001C67                       5465 	_drop 2 
      009CE7 5B 02            [ 2]    1     addw sp,#2 
      009CE9 81               [ 4] 5466 	ret 
                                   5467 
                                   5468 ;----------------------------------
                                   5469 ; BASIC: SLEEP 
                                   5470 ; halt mcu until reset or external
                                   5471 ; interrupt.
                                   5472 ; Resume progam after SLEEP command
                                   5473 ;----------------------------------
      009CEA                       5474 sleep:
      009CEA 72 0D 52 30 FB   [ 2] 5475 	btjf UART1_SR,#UART_SR_TC,.
      009CEF 72 16 00 26      [ 1] 5476 	bset flags,#FSLEEP
      009CF3 8E               [10] 5477 	halt 
      009CF4 81               [ 4] 5478 	ret 
                                   5479 
                                   5480 ;-------------------------------
                                   5481 ; BASIC: PAUSE expr 
                                   5482 ; suspend execution for n msec.
                                   5483 ; input:
                                   5484 ;	none
                                   5485 ; output:
                                   5486 ;	none 
                                   5487 ;------------------------------
      009CF5                       5488 pause:
      009CF5 CD 90 6A         [ 4] 5489 	call expression
      009CF8 A1 04            [ 1] 5490 	cp a,#TK_INTGR
      009CFA 27 03            [ 1] 5491 	jreq pause02 
      009CFC CC 87 DC         [ 2] 5492 	jp syntax_error
      009CFF                       5493 pause02: 
      009CFF 5D               [ 2] 5494 1$: tnzw x 
      009D00 27 04            [ 1] 5495 	jreq 2$
      009D02 8F               [10] 5496 	wfi 
      009D03 5A               [ 2] 5497 	decw x 
      009D04 26 F9            [ 1] 5498 	jrne 1$
      009D06 4F               [ 1] 5499 2$:	clr a 
      009D07 81               [ 4] 5500 	ret 
                                   5501 
                                   5502 ;------------------------------
                                   5503 ; BASIC: AWU expr
                                   5504 ; halt mcu for 'expr' milliseconds
                                   5505 ; use Auto wakeup peripheral
                                   5506 ; all oscillators stopped except LSI
                                   5507 ; range: 1ms - 511ms
                                   5508 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5509 ;  none
                                   5510 ; output:
                                   5511 ;  none:
                                   5512 ;------------------------------
      009D08                       5513 awu:
      009D08 CD 90 6A         [ 4] 5514   call expression
      009D0B A1 04            [ 1] 5515   cp a,#TK_INTGR
      009D0D 27 03            [ 1] 5516   jreq awu02
      009D0F CC 87 DC         [ 2] 5517   jp syntax_error
      009D12                       5518 awu02:
      009D12 A3 14 00         [ 2] 5519   cpw x,#5120
      009D15 2B 0C            [ 1] 5520   jrmi 1$ 
      009D17 35 0F 50 F2      [ 1] 5521   mov AWU_TBR,#15 
      009D1B A6 1E            [ 1] 5522   ld a,#30
      009D1D 62               [ 2] 5523   div x,a
      009D1E A6 10            [ 1] 5524   ld a,#16
      009D20 62               [ 2] 5525   div x,a 
      009D21 20 1E            [ 2] 5526   jra 4$
      009D23                       5527 1$: 
      009D23 A3 08 00         [ 2] 5528   cpw x,#2048
      009D26 2B 09            [ 1] 5529   jrmi 2$ 
      009D28 35 0E 50 F2      [ 1] 5530   mov AWU_TBR,#14
      009D2C A6 50            [ 1] 5531   ld a,#80
      009D2E 62               [ 2] 5532   div x,a 
      009D2F 20 10            [ 2] 5533   jra 4$   
      009D31                       5534 2$:
      009D31 35 07 50 F2      [ 1] 5535   mov AWU_TBR,#7
      009D35                       5536 3$:  
                                   5537 ; while X > 64  divide by 2 and increment AWU_TBR 
      009D35 A3 00 40         [ 2] 5538   cpw x,#64 
      009D38 23 07            [ 2] 5539   jrule 4$ 
      009D3A 72 5C 50 F2      [ 1] 5540   inc AWU_TBR 
      009D3E 54               [ 2] 5541   srlw x 
      009D3F 20 F4            [ 2] 5542   jra 3$ 
      009D41                       5543 4$:
      009D41 9F               [ 1] 5544   ld a, xl
      009D42 4A               [ 1] 5545   dec a 
      009D43 27 01            [ 1] 5546   jreq 5$
      009D45 4A               [ 1] 5547   dec a 	
      009D46                       5548 5$: 
      009D46 A4 3E            [ 1] 5549   and a,#0x3e 
      009D48 C7 50 F1         [ 1] 5550   ld AWU_APR,a 
      009D4B 72 18 50 F0      [ 1] 5551   bset AWU_CSR,#AWU_CSR_AWUEN
      009D4F 8E               [10] 5552   halt 
                                   5553 
      009D50 81               [ 4] 5554   ret 
                                   5555 
                                   5556 ;------------------------------
                                   5557 ; BASIC: TICKS
                                   5558 ; return msec ticks counter value 
                                   5559 ; input:
                                   5560 ; 	none 
                                   5561 ; output:
                                   5562 ;	X 		TK_INTGR
                                   5563 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009D51                       5564 get_ticks:
      009D51 CE 00 11         [ 2] 5565 	ldw x,ticks 
      009D54 A6 04            [ 1] 5566 	ld a,#TK_INTGR
      009D56 81               [ 4] 5567 	ret 
                                   5568 
                                   5569 
                                   5570 
                                   5571 ;------------------------------
                                   5572 ; BASIC: ABS(expr)
                                   5573 ; return absolute value of expr.
                                   5574 ; input:
                                   5575 ;   none
                                   5576 ; output:
                                   5577 ;   X     	positive integer
                                   5578 ;-------------------------------
      009D57                       5579 abs:
      009D57 CD 8F 85         [ 4] 5580 	call func_args 
      009D5A A1 01            [ 1] 5581 	cp a,#1 
      009D5C 27 03            [ 1] 5582 	jreq 0$ 
      009D5E CC 87 DC         [ 2] 5583 	jp syntax_error
      009D61                       5584 0$:  
      009D61 85               [ 2] 5585     popw x   
      009D62 9E               [ 1] 5586 	ld a,xh 
      009D63 A5 80            [ 1] 5587 	bcp a,#0x80 
      009D65 27 01            [ 1] 5588 	jreq 2$ 
      009D67 50               [ 2] 5589 	negw x 
      009D68 A6 04            [ 1] 5590 2$: ld a,#TK_INTGR 
      009D6A 81               [ 4] 5591 	ret 
                                   5592 
                                   5593 ;------------------------------
                                   5594 ; BASIC: AND(expr1,expr2)
                                   5595 ; Apply bit AND relation between
                                   5596 ; the 2 arguments, i.e expr1 & expr2 
                                   5597 ; output:
                                   5598 ; 	A 		TK_INTGR
                                   5599 ;   X 		result 
                                   5600 ;------------------------------
      009D6B                       5601 bit_and:
      009D6B CD 8F 85         [ 4] 5602 	call func_args 
      009D6E A1 02            [ 1] 5603 	cp a,#2
      009D70 27 03            [ 1] 5604 	jreq 1$
      009D72 CC 87 DC         [ 2] 5605 	jp syntax_error 
      009D75 85               [ 2] 5606 1$:	popw x 
      009D76 9E               [ 1] 5607 	ld a,xh 
      009D77 14 01            [ 1] 5608 	and a,(1,sp)
      009D79 95               [ 1] 5609 	ld xh,a 
      009D7A 9F               [ 1] 5610 	ld a,xl
      009D7B 14 02            [ 1] 5611 	and a,(2,sp)
      009D7D 97               [ 1] 5612 	ld xl,a 
      001CFE                       5613 	_drop 2 
      009D7E 5B 02            [ 2]    1     addw sp,#2 
      009D80 A6 04            [ 1] 5614 	ld a,#TK_INTGR
      009D82 81               [ 4] 5615 	ret
                                   5616 
                                   5617 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5618 ; BASIC: OR(expr1,expr2)
                                   5619 ; Apply bit OR relation between
                                   5620 ; the 2 arguments, i.e expr1 | expr2 
                                   5621 ; output:
                                   5622 ; 	A 		TK_INTGR
                                   5623 ;   X 		result 
                                   5624 ;------------------------------
      009D83                       5625 bit_or:
      009D83 CD 8F 85         [ 4] 5626 	call func_args 
      009D86 A1 02            [ 1] 5627 	cp a,#2
      009D88 27 03            [ 1] 5628 	jreq 1$
      009D8A CC 87 DC         [ 2] 5629 	jp syntax_error 
      009D8D                       5630 1$: 
      009D8D 85               [ 2] 5631 	popw x 
      009D8E 9E               [ 1] 5632 	ld a,xh 
      009D8F 1A 01            [ 1] 5633 	or a,(1,sp)
      009D91 95               [ 1] 5634 	ld xh,a 
      009D92 9F               [ 1] 5635 	ld a,xl 
      009D93 1A 02            [ 1] 5636 	or a,(2,sp)
      009D95 97               [ 1] 5637 	ld xl,a 
      001D16                       5638 	_drop 2 
      009D96 5B 02            [ 2]    1     addw sp,#2 
      009D98 A6 04            [ 1] 5639 	ld a,#TK_INTGR 
      009D9A 81               [ 4] 5640 	ret
                                   5641 
                                   5642 ;------------------------------
                                   5643 ; BASIC: XOR(expr1,expr2)
                                   5644 ; Apply bit XOR relation between
                                   5645 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5646 ; output:
                                   5647 ; 	A 		TK_INTGR
                                   5648 ;   X 		result 
                                   5649 ;------------------------------
      009D9B                       5650 bit_xor:
      009D9B CD 8F 85         [ 4] 5651 	call func_args 
      009D9E A1 02            [ 1] 5652 	cp a,#2
      009DA0 27 03            [ 1] 5653 	jreq 1$
      009DA2 CC 87 DC         [ 2] 5654 	jp syntax_error 
      009DA5                       5655 1$: 
      009DA5 85               [ 2] 5656 	popw x 
      009DA6 9E               [ 1] 5657 	ld a,xh 
      009DA7 18 01            [ 1] 5658 	xor a,(1,sp)
      009DA9 95               [ 1] 5659 	ld xh,a 
      009DAA 9F               [ 1] 5660 	ld a,xl 
      009DAB 18 02            [ 1] 5661 	xor a,(2,sp)
      009DAD 97               [ 1] 5662 	ld xl,a 
      001D2E                       5663 	_drop 2 
      009DAE 5B 02            [ 2]    1     addw sp,#2 
      009DB0 A6 04            [ 1] 5664 	ld a,#TK_INTGR 
      009DB2 81               [ 4] 5665 	ret 
                                   5666 
                                   5667 ;------------------------------
                                   5668 ; BASIC: LSHIFT(expr1,expr2)
                                   5669 ; logical shift left expr1 by 
                                   5670 ; expr2 bits 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5671 ; output:
                                   5672 ; 	A 		TK_INTGR
                                   5673 ;   X 		result 
                                   5674 ;------------------------------
      009DB3                       5675 lshift:
      009DB3 CD 8F 85         [ 4] 5676 	call func_args
      009DB6 A1 02            [ 1] 5677 	cp a,#2 
      009DB8 27 03            [ 1] 5678 	jreq 1$
      009DBA CC 87 DC         [ 2] 5679 	jp syntax_error
      009DBD 90 85            [ 2] 5680 1$: popw y   
      009DBF 85               [ 2] 5681 	popw x 
      009DC0 90 5D            [ 2] 5682 	tnzw y 
      009DC2 27 05            [ 1] 5683 	jreq 4$
      009DC4 58               [ 2] 5684 2$:	sllw x 
      009DC5 90 5A            [ 2] 5685 	decw y 
      009DC7 26 FB            [ 1] 5686 	jrne 2$
      009DC9                       5687 4$:  
      009DC9 A6 04            [ 1] 5688 	ld a,#TK_INTGR
      009DCB 81               [ 4] 5689 	ret
                                   5690 
                                   5691 ;------------------------------
                                   5692 ; BASIC: RSHIFT(expr1,expr2)
                                   5693 ; logical shift right expr1 by 
                                   5694 ; expr2 bits.
                                   5695 ; output:
                                   5696 ; 	A 		TK_INTGR
                                   5697 ;   X 		result 
                                   5698 ;------------------------------
      009DCC                       5699 rshift:
      009DCC CD 8F 85         [ 4] 5700 	call func_args
      009DCF A1 02            [ 1] 5701 	cp a,#2 
      009DD1 27 03            [ 1] 5702 	jreq 1$
      009DD3 CC 87 DC         [ 2] 5703 	jp syntax_error
      009DD6 90 85            [ 2] 5704 1$: popw y  
      009DD8 85               [ 2] 5705 	popw x
      009DD9 90 5D            [ 2] 5706 	tnzw y 
      009DDB 27 05            [ 1] 5707 	jreq 4$
      009DDD 54               [ 2] 5708 2$:	srlw x 
      009DDE 90 5A            [ 2] 5709 	decw y 
      009DE0 26 FB            [ 1] 5710 	jrne 2$
      009DE2                       5711 4$:  
      009DE2 A6 04            [ 1] 5712 	ld a,#TK_INTGR
      009DE4 81               [ 4] 5713 	ret
                                   5714 
                                   5715 ;--------------------------
                                   5716 ; BASIC: FCPU integer
                                   5717 ; set CPU frequency 
                                   5718 ;-------------------------- 
                                   5719 
      009DE5                       5720 fcpu:
      009DE5 A6 04            [ 1] 5721 	ld a,#TK_INTGR
      009DE7 CD 8F 51         [ 4] 5722 	call expect 
      009DEA 9F               [ 1] 5723 	ld a,xl 
      009DEB A4 07            [ 1] 5724 	and a,#7 
      009DED C7 50 C6         [ 1] 5725 	ld CLK_CKDIVR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DF0 81               [ 4] 5726 	ret 
                                   5727 
                                   5728 ;------------------------------
                                   5729 ; BASIC: PMODE pin#, mode 
                                   5730 ; Arduino pin. 
                                   5731 ; define pin as input or output
                                   5732 ; pin#: {0..15}
                                   5733 ; mode: INPUT|OUTPUT  
                                   5734 ;------------------------------
                           000001  5735 	PINNO=1
                           000001  5736 	VSIZE=1
      009DF1                       5737 pin_mode:
      001D71                       5738 	_vars VSIZE 
      009DF1 52 01            [ 2]    1     sub sp,#VSIZE 
      009DF3 CD 8F 5E         [ 4] 5739 	call arg_list 
      009DF6 A1 02            [ 1] 5740 	cp a,#2 
      009DF8 27 03            [ 1] 5741 	jreq 1$
      009DFA CC 87 DC         [ 2] 5742 	jp syntax_error 
      009DFD 90 85            [ 2] 5743 1$: popw y ; mode 
      009DFF 85               [ 2] 5744 	popw x ; Dx pin 
      009E00 CD 9E 32         [ 4] 5745 	call select_pin 
      009E03 6B 01            [ 1] 5746 	ld (PINNO,sp),a  
      009E05 A6 01            [ 1] 5747 	ld a,#1 
      009E07 0D 01            [ 1] 5748 	tnz (PINNO,sp)
      009E09 27 0B            [ 1] 5749 	jreq 4$
      009E0B 48               [ 1] 5750 2$:	sll a 
      009E0C 0A 01            [ 1] 5751 	dec (PINNO,sp)
      009E0E 26 FB            [ 1] 5752 	jrne 2$ 
      009E10 6B 01            [ 1] 5753 	ld (PINNO,sp),a
      009E12 EA 03            [ 1] 5754 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009E14 E7 03            [ 1] 5755 	ld (GPIO_CR1,x),a 
      009E16 90 A3 00 01      [ 2] 5756 4$:	cpw y,#OUTP 
      009E1A 27 07            [ 1] 5757 	jreq 6$
                                   5758 ; input mode
      009E1C 7B 01            [ 1] 5759 	ld a,(PINNO,sp)
      009E1E 43               [ 1] 5760 	cpl a 
      009E1F E4 02            [ 1] 5761 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009E21 20 0A            [ 2] 5762 	jra 9$
      009E23                       5763 6$: ;output mode  
      009E23 7B 01            [ 1] 5764 	ld a,(PINNO,sp)
      009E25 EA 04            [ 1] 5765 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009E27 E7 04            [ 1] 5766 	ld (GPIO_CR2,x),a 
      009E29 7B 01            [ 1] 5767 	ld a,(PINNO,sp)
      009E2B EA 02            [ 1] 5768 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009E2D E7 02            [ 1] 5769 9$:	ld (GPIO_DDR,x),a 
      001DAF                       5770 	_drop VSIZE 
      009E2F 5B 01            [ 2]    1     addw sp,#VSIZE 
      009E31 81               [ 4] 5771 	ret
                                   5772 
                                   5773 ;------------------------
                                   5774 ; select Arduino pin 
                                   5775 ; input:
                                   5776 ;   X 	 {0..15} Arduino Dx 
                                   5777 ; output:
                                   5778 ;   A     stm8s208 pin 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5779 ;   X     base address s208 GPIO port 
                                   5780 ;---------------------------
      009E32                       5781 select_pin:
      009E32 58               [ 2] 5782 	sllw x 
      009E33 1C 9E 42         [ 2] 5783 	addw x,#arduino_to_8s208 
      009E36 FE               [ 2] 5784 	ldw x,(x)
      009E37 9F               [ 1] 5785 	ld a,xl 
      009E38 88               [ 1] 5786 	push a 
      009E39 5E               [ 1] 5787 	swapw x 
      009E3A A6 05            [ 1] 5788 	ld a,#5 
      009E3C 42               [ 4] 5789 	mul x,a 
      009E3D 1C 50 00         [ 2] 5790 	addw x,#GPIO_BASE 
      009E40 84               [ 1] 5791 	pop a 
      009E41 81               [ 4] 5792 	ret 
                                   5793 ; translation from Arduino D0..D15 to stm8s208rb 
      009E42                       5794 arduino_to_8s208:
      009E42 03 06                 5795 .byte 3,6 ; D0 
      009E44 03 05                 5796 .byte 3,5 ; D1 
      009E46 04 00                 5797 .byte 4,0 ; D2 
      009E48 02 01                 5798 .byte 2,1 ; D3
      009E4A 06 00                 5799 .byte 6,0 ; D4
      009E4C 02 02                 5800 .byte 2,2 ; D5
      009E4E 02 03                 5801 .byte 2,3 ; D6
      009E50 03 01                 5802 .byte 3,1 ; D7
      009E52 03 03                 5803 .byte 3,3 ; D8
      009E54 02 04                 5804 .byte 2,4 ; D9
      009E56 04 05                 5805 .byte 4,5 ; D10
      009E58 02 06                 5806 .byte 2,6 ; D11
      009E5A 02 07                 5807 .byte 2,7 ; D12
      009E5C 02 05                 5808 .byte 2,5 ; D13
      009E5E 04 02                 5809 .byte 4,2 ; D14
      009E60 04 01                 5810 .byte 4,1 ; D15
                                   5811 
                                   5812 
                                   5813 ;------------------------------
                                   5814 ; BASIC: RND(expr)
                                   5815 ; return random number 
                                   5816 ; between 1 and expr inclusive
                                   5817 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5818 ; input:
                                   5819 ; 	none 
                                   5820 ; output:
                                   5821 ;	X 		random positive integer 
                                   5822 ;------------------------------
      009E62                       5823 random:
      009E62 CD 8F 85         [ 4] 5824 	call func_args 
      009E65 A1 01            [ 1] 5825 	cp a,#1
      009E67 27 03            [ 1] 5826 	jreq 1$
      009E69 CC 87 DC         [ 2] 5827 	jp syntax_error
      009E6C                       5828 1$:  
      009E6C A6 80            [ 1] 5829 	ld a,#0x80 
      009E6E 15 01            [ 1] 5830 	bcp a,(1,sp)
      009E70 27 05            [ 1] 5831 	jreq 2$
      009E72 A6 0A            [ 1] 5832 	ld a,#ERR_BAD_VALUE
      009E74 CC 87 DE         [ 2] 5833 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E77                       5834 2$: 
                                   5835 ; acc16=(x<<5)^x 
      009E77 CE 00 15         [ 2] 5836 	ldw x,seedx 
      009E7A 58               [ 2] 5837 	sllw x 
      009E7B 58               [ 2] 5838 	sllw x 
      009E7C 58               [ 2] 5839 	sllw x 
      009E7D 58               [ 2] 5840 	sllw x 
      009E7E 58               [ 2] 5841 	sllw x 
      009E7F 9E               [ 1] 5842 	ld a,xh 
      009E80 C8 00 15         [ 1] 5843 	xor a,seedx 
      009E83 C7 00 0D         [ 1] 5844 	ld acc16,a 
      009E86 9F               [ 1] 5845 	ld a,xl 
      009E87 C8 00 16         [ 1] 5846 	xor a,seedx+1 
      009E8A C7 00 0E         [ 1] 5847 	ld acc8,a 
                                   5848 ; seedx=seedy 
      009E8D CE 00 17         [ 2] 5849 	ldw x,seedy 
      009E90 CF 00 15         [ 2] 5850 	ldw seedx,x  
                                   5851 ; seedy=seedy^(seedy>>1)
      009E93 90 54            [ 2] 5852 	srlw y 
      009E95 90 9E            [ 1] 5853 	ld a,yh 
      009E97 C8 00 17         [ 1] 5854 	xor a,seedy 
      009E9A C7 00 17         [ 1] 5855 	ld seedy,a  
      009E9D 90 9F            [ 1] 5856 	ld a,yl 
      009E9F C8 00 18         [ 1] 5857 	xor a,seedy+1 
      009EA2 C7 00 18         [ 1] 5858 	ld seedy+1,a 
                                   5859 ; acc16>>3 
      009EA5 CE 00 0D         [ 2] 5860 	ldw x,acc16 
      009EA8 54               [ 2] 5861 	srlw x 
      009EA9 54               [ 2] 5862 	srlw x 
      009EAA 54               [ 2] 5863 	srlw x 
                                   5864 ; x=acc16^x 
      009EAB 9E               [ 1] 5865 	ld a,xh 
      009EAC C8 00 0D         [ 1] 5866 	xor a,acc16 
      009EAF 95               [ 1] 5867 	ld xh,a 
      009EB0 9F               [ 1] 5868 	ld a,xl 
      009EB1 C8 00 0E         [ 1] 5869 	xor a,acc8 
      009EB4 97               [ 1] 5870 	ld xl,a 
                                   5871 ; seedy=x^seedy 
      009EB5 C8 00 18         [ 1] 5872 	xor a,seedy+1
      009EB8 97               [ 1] 5873 	ld xl,a 
      009EB9 9E               [ 1] 5874 	ld a,xh 
      009EBA C8 00 17         [ 1] 5875 	xor a,seedy
      009EBD 95               [ 1] 5876 	ld xh,a 
      009EBE CF 00 17         [ 2] 5877 	ldw seedy,x 
                                   5878 ; return seedy modulo expr + 1 
      009EC1 90 85            [ 2] 5879 	popw y 
      009EC3 65               [ 2] 5880 	divw x,y 
      009EC4 93               [ 1] 5881 	ldw x,y 
      009EC5 5C               [ 2] 5882 	incw x 
      009EC6                       5883 10$:
      009EC6 A6 04            [ 1] 5884 	ld a,#TK_INTGR
      009EC8 81               [ 4] 5885 	ret 
                                   5886 
                                   5887 ;---------------------------------
                                   5888 ; BASIC: WORDS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5889 ; affiche la listes des mots du
                                   5890 ; dictionnaire.
                                   5891 ;---------------------------------
                           000001  5892 	WLEN=1
                           000002  5893 	LLEN=2  
                           000002  5894 	VSIZE=2 
      009EC9                       5895 words:
      001E49                       5896 	_vars VSIZE
      009EC9 52 02            [ 2]    1     sub sp,#VSIZE 
      009ECB 0F 02            [ 1] 5897 	clr (LLEN,sp)
      009ECD 90 AE A5 C0      [ 2] 5898 	ldw y,#kword_dict+2
      009ED1 93               [ 1] 5899 0$:	ldw x,y
      009ED2 F6               [ 1] 5900 	ld a,(x)
      009ED3 A4 0F            [ 1] 5901 	and a,#15 
      009ED5 6B 01            [ 1] 5902 	ld (WLEN,sp),a 
      009ED7 5C               [ 2] 5903 1$:	incw x 
      009ED8 F6               [ 1] 5904 	ld a,(x)
      009ED9 CD 82 44         [ 4] 5905 	call putc 
      009EDC 0C 02            [ 1] 5906 	inc (LLEN,sp)
      009EDE 0A 01            [ 1] 5907 	dec (WLEN,sp)
      009EE0 26 F5            [ 1] 5908 	jrne 1$
      009EE2 A6 46            [ 1] 5909 	ld a,#70
      009EE4 11 02            [ 1] 5910 	cp a,(LLEN,sp)
      009EE6 2B 09            [ 1] 5911 	jrmi 2$   
      009EE8 A6 20            [ 1] 5912 	ld a,#SPACE 
      009EEA CD 82 44         [ 4] 5913 	call putc 
      009EED 0C 02            [ 1] 5914 	inc (LLEN,sp) 
      009EEF 20 07            [ 2] 5915 	jra 3$
      009EF1 A6 0D            [ 1] 5916 2$: ld a,#CR 
      009EF3 CD 82 44         [ 4] 5917 	call putc 
      009EF6 0F 02            [ 1] 5918 	clr (LLEN,sp)
      009EF8 72 A2 00 02      [ 2] 5919 3$:	subw y,#2 
      009EFC 90 FE            [ 2] 5920 	ldw y,(y)
      009EFE 26 D1            [ 1] 5921 	jrne 0$  
      001E80                       5922 	_drop VSIZE 
      009F00 5B 02            [ 2]    1     addw sp,#VSIZE 
      009F02 81               [ 4] 5923 	ret 
                                   5924 
                                   5925 
                                   5926 ;-----------------------------
                                   5927 ; BASIC: TIMER expr 
                                   5928 ; initialize count down timer 
                                   5929 ;-----------------------------
      009F03                       5930 set_timer:
      009F03 CD 8F 5E         [ 4] 5931 	call arg_list
      009F06 A1 01            [ 1] 5932 	cp a,#1 
      009F08 27 03            [ 1] 5933 	jreq 1$
      009F0A CC 87 DC         [ 2] 5934 	jp syntax_error
      009F0D                       5935 1$: 
      009F0D 85               [ 2] 5936 	popw x 
      009F0E CF 00 13         [ 2] 5937 	ldw timer,x 
      009F11 81               [ 4] 5938 	ret 
                                   5939 
                                   5940 ;------------------------------
                                   5941 ; BASIC: TIMEOUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5942 ; return state of timer 
                                   5943 ;------------------------------
      009F12                       5944 timeout:
      009F12 CE 00 13         [ 2] 5945 	ldw x,timer 
      009F15                       5946 logical_complement:
      009F15 53               [ 2] 5947 	cplw x 
      009F16 A3 FF FF         [ 2] 5948 	cpw x,#-1
      009F19 27 01            [ 1] 5949 	jreq 2$
      009F1B 5F               [ 1] 5950 	clrw x 
      009F1C A6 04            [ 1] 5951 2$:	ld a,#TK_INTGR
      009F1E 81               [ 4] 5952 	ret 
                                   5953 
                                   5954 ;--------------------------------
                                   5955 ; BASIC NOT(expr) 
                                   5956 ; return logical complement of expr
                                   5957 ;--------------------------------
      009F1F                       5958 func_not:
      009F1F CD 8F 85         [ 4] 5959 	call func_args  
      009F22 A1 01            [ 1] 5960 	cp a,#1
      009F24 27 03            [ 1] 5961 	jreq 1$
      009F26 CC 87 DC         [ 2] 5962 	jp syntax_error
      009F29 85               [ 2] 5963 1$:	popw x 
      009F2A 20 E9            [ 2] 5964 	jra logical_complement
                                   5965 
                                   5966 
                                   5967 
                                   5968 ;-----------------------------------
                                   5969 ; BASIC: IWDGEN expr1 
                                   5970 ; enable independant watchdog timer
                                   5971 ; expr1 is delay in multiple of 62.5µsec
                                   5972 ; expr1 -> {1..16383}
                                   5973 ;-----------------------------------
      009F2C                       5974 enable_iwdg:
      009F2C CD 8F 5E         [ 4] 5975 	call arg_list
      009F2F A1 01            [ 1] 5976 	cp a,#1 
      009F31 27 03            [ 1] 5977 	jreq 1$
      009F33 CC 87 DC         [ 2] 5978 	jp syntax_error 
      009F36 85               [ 2] 5979 1$: popw x 
      009F37 4B 00            [ 1] 5980 	push #0
      009F39 35 CC 50 E0      [ 1] 5981 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009F3D 9E               [ 1] 5982 	ld a,xh 
      009F3E A4 3F            [ 1] 5983 	and a,#0x3f
      009F40 95               [ 1] 5984 	ld xh,a  
      009F41 A3 00 FF         [ 2] 5985 2$:	cpw x,#255
      009F44 23 06            [ 2] 5986 	jrule 3$
      009F46 0C 01            [ 1] 5987 	inc (1,sp)
      009F48 98               [ 1] 5988 	rcf 
      009F49 56               [ 2] 5989 	rrcw x 
      009F4A 20 F5            [ 2] 5990 	jra 2$
      009F4C 35 55 50 E0      [ 1] 5991 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009F50 84               [ 1] 5992 	pop a  
      009F51 C7 50 E1         [ 1] 5993 	ld IWDG_PR,a 
      009F54 9F               [ 1] 5994 	ld a,xl
      009F55 4A               [ 1] 5995 	dec a 
      009F56 35 55 50 E0      [ 1] 5996 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009F5A C7 50 E2         [ 1] 5997 	ld IWDG_RLR,a 
      009F5D 35 AA 50 E0      [ 1] 5998 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009F61 81               [ 4] 5999 	ret 
                                   6000 
                                   6001 
                                   6002 ;-----------------------------------
                                   6003 ; BASIC: IWDGREF  
                                   6004 ; refresh independant watchdog count down 
                                   6005 ; timer before it reset MCU. 
                                   6006 ;-----------------------------------
      009F62                       6007 refresh_iwdg:
      009F62 35 AA 50 E0      [ 1] 6008 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009F66 81               [ 4] 6009 	ret 
                                   6010 
                                   6011 
                                   6012 ;-------------------------------------
                                   6013 ; BASIC: LOG(expr)
                                   6014 ; return logarithm base 2 of expr 
                                   6015 ; this is the position of most significant
                                   6016 ; bit set. 
                                   6017 ; input: 
                                   6018 ; output:
                                   6019 ;   X     log2 
                                   6020 ;   A     TK_INTGR 
                                   6021 ;*********************************
      009F67                       6022 log2:
      009F67 CD 8F 85         [ 4] 6023 	call func_args 
      009F6A A1 01            [ 1] 6024 	cp a,#1 
      009F6C 27 03            [ 1] 6025 	jreq 1$
      009F6E CC 87 DC         [ 2] 6026 	jp syntax_error 
      009F71 85               [ 2] 6027 1$: popw x 
      009F72                       6028 leading_one:
      009F72 5D               [ 2] 6029 	tnzw x 
      009F73 27 0A            [ 1] 6030 	jreq 4$
      009F75 A6 0F            [ 1] 6031 	ld a,#15 
      009F77 59               [ 2] 6032 2$: rlcw x 
      009F78 25 03            [ 1] 6033     jrc 3$
      009F7A 4A               [ 1] 6034 	dec a 
      009F7B 20 FA            [ 2] 6035 	jra 2$
      009F7D 5F               [ 1] 6036 3$: clrw x 
      009F7E 97               [ 1] 6037     ld xl,a
      009F7F A6 04            [ 1] 6038 4$:	ld a,#TK_INTGR
      009F81 81               [ 4] 6039 	ret 
                                   6040 
                                   6041 ;-----------------------------------
                                   6042 ; BASIC: BIT(expr) 
                                   6043 ; expr ->{0..15}
                                   6044 ; return 2^expr 
                                   6045 ; output:
                                   6046 ;    x    2^expr 
                                   6047 ;-----------------------------------
      009F82                       6048 bitmask:
      009F82 CD 8F 85         [ 4] 6049     call func_args 
      009F85 A1 01            [ 1] 6050 	cp a,#1
      009F87 27 03            [ 1] 6051 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F89 CC 87 DC         [ 2] 6052 	jp syntax_error 
      009F8C 85               [ 2] 6053 1$: popw x 
      009F8D 9F               [ 1] 6054 	ld a,xl 
      009F8E A4 0F            [ 1] 6055 	and a,#15
      009F90 5F               [ 1] 6056 	clrw x 
      009F91 5C               [ 2] 6057 	incw x 
      009F92 4D               [ 1] 6058 2$: tnz a 
      009F93 27 04            [ 1] 6059 	jreq 3$
      009F95 58               [ 2] 6060 	slaw x 
      009F96 4A               [ 1] 6061 	dec a 
      009F97 20 F9            [ 2] 6062 	jra 2$ 
      009F99 A6 04            [ 1] 6063 3$: ld a,#TK_INTGR
      009F9B 81               [ 4] 6064 	ret 
                                   6065 
                                   6066 ;------------------------------
                                   6067 ; BASIC: INVERT(expr)
                                   6068 ; 1's complement 
                                   6069 ;--------------------------------
      009F9C                       6070 invert:
      009F9C CD 8F 85         [ 4] 6071 	call func_args
      009F9F A1 01            [ 1] 6072 	cp a,#1 
      009FA1 27 03            [ 1] 6073 	jreq 1$
      009FA3 CC 87 DC         [ 2] 6074 	jp syntax_error
      009FA6 85               [ 2] 6075 1$: popw x  
      009FA7 53               [ 2] 6076 	cplw x 
      009FA8 A6 04            [ 1] 6077 	ld a,#TK_INTGR 
      009FAA 81               [ 4] 6078 	ret 
                                   6079 
                                   6080 ;------------------------------
                                   6081 ; BASIC: DO 
                                   6082 ; initiate a DO ... UNTIL loop 
                                   6083 ;------------------------------
                           000003  6084 	DOLP_ADR=3 
                           000005  6085 	DOLP_INW=5
                           000004  6086 	VSIZE=4 
      009FAB                       6087 do_loop:
      009FAB 85               [ 2] 6088 	popw x 
      001F2C                       6089 	_vars VSIZE 
      009FAC 52 04            [ 2]    1     sub sp,#VSIZE 
      009FAE 89               [ 2] 6090 	pushw x 
      009FAF 90 CE 00 05      [ 2] 6091 	ldw y,basicptr 
      009FB3 17 03            [ 2] 6092 	ldw (DOLP_ADR,sp),y
      009FB5 90 CE 00 01      [ 2] 6093 	ldw y,in.w 
      009FB9 17 05            [ 2] 6094 	ldw (DOLP_INW,sp),y
      009FBB 72 5C 00 23      [ 1] 6095 	inc loop_depth 
      009FBF 81               [ 4] 6096 	ret 
                                   6097 
                                   6098 ;--------------------------------
                                   6099 ; BASIC: UNTIL expr 
                                   6100 ; loop if exprssion is false 
                                   6101 ; else terminate loop
                                   6102 ;--------------------------------
      009FC0                       6103 until: 
      009FC0 72 5D 00 23      [ 1] 6104 	tnz loop_depth 
      009FC4 26 03            [ 1] 6105 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009FC6 CC 87 DC         [ 2] 6106 	jp syntax_error 
      009FC9                       6107 1$: 
      009FC9 CD 90 AE         [ 4] 6108 	call relation 
      009FCC A1 04            [ 1] 6109 	cp a,#TK_INTGR
      009FCE 27 03            [ 1] 6110 	jreq 2$
      009FD0 CC 87 DC         [ 2] 6111 	jp syntax_error
      009FD3                       6112 2$: 
      009FD3 5D               [ 2] 6113 	tnzw x 
      009FD4 26 10            [ 1] 6114 	jrne 9$
      009FD6 1E 03            [ 2] 6115 	ldw x,(DOLP_ADR,sp)
      009FD8 CF 00 05         [ 2] 6116 	ldw basicptr,x 
      009FDB E6 02            [ 1] 6117 	ld a,(2,x)
      009FDD C7 00 04         [ 1] 6118 	ld count,a 
      009FE0 1E 05            [ 2] 6119 	ldw x,(DOLP_INW,sp)
      009FE2 CF 00 01         [ 2] 6120 	ldw in.w,x 
      009FE5 81               [ 4] 6121 	ret 
      009FE6                       6122 9$:	; remove loop data from stack  
      009FE6 85               [ 2] 6123 	popw x
      001F67                       6124 	_drop VSIZE
      009FE7 5B 04            [ 2]    1     addw sp,#VSIZE 
      009FE9 72 5A 00 23      [ 1] 6125 	dec loop_depth 
      009FED FC               [ 2] 6126 	jp (x)
                                   6127 
                                   6128 ;--------------------------
                                   6129 ; BASIC: PRTA...PRTI  
                                   6130 ;  return constant value 
                                   6131 ;  PORT  offset in GPIO
                                   6132 ;  array
                                   6133 ;---------------------------
      009FEE                       6134 const_porta:
      009FEE AE 00 00         [ 2] 6135 	ldw x,#0
      009FF1 A6 04            [ 1] 6136 	ld a,#TK_INTGR 
      009FF3 81               [ 4] 6137 	ret 
      009FF4                       6138 const_portb:
      009FF4 AE 00 01         [ 2] 6139 	ldw x,#1
      009FF7 A6 04            [ 1] 6140 	ld a,#TK_INTGR 
      009FF9 81               [ 4] 6141 	ret 
      009FFA                       6142 const_portc:
      009FFA AE 00 02         [ 2] 6143 	ldw x,#2
      009FFD A6 04            [ 1] 6144 	ld a,#TK_INTGR 
      009FFF 81               [ 4] 6145 	ret 
      00A000                       6146 const_portd:
      00A000 AE 00 03         [ 2] 6147 	ldw x,#3
      00A003 A6 04            [ 1] 6148 	ld a,#TK_INTGR 
      00A005 81               [ 4] 6149 	ret 
      00A006                       6150 const_porte:
      00A006 AE 00 04         [ 2] 6151 	ldw x,#4
      00A009 A6 04            [ 1] 6152 	ld a,#TK_INTGR 
      00A00B 81               [ 4] 6153 	ret 
      00A00C                       6154 const_portf:
      00A00C AE 00 05         [ 2] 6155 	ldw x,#5
      00A00F A6 04            [ 1] 6156 	ld a,#TK_INTGR 
      00A011 81               [ 4] 6157 	ret 
      00A012                       6158 const_portg:
      00A012 AE 00 06         [ 2] 6159 	ldw x,#6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A015 A6 04            [ 1] 6160 	ld a,#TK_INTGR 
      00A017 81               [ 4] 6161 	ret 
      00A018                       6162 const_porth:
      00A018 AE 00 07         [ 2] 6163 	ldw x,#7
      00A01B A6 04            [ 1] 6164 	ld a,#TK_INTGR 
      00A01D 81               [ 4] 6165 	ret 
      00A01E                       6166 const_porti:
      00A01E AE 00 08         [ 2] 6167 	ldw x,#8
      00A021 A6 04            [ 1] 6168 	ld a,#TK_INTGR 
      00A023 81               [ 4] 6169 	ret 
                                   6170 
                                   6171 ;-------------------------------
                                   6172 ; following return constant 
                                   6173 ; related to GPIO register offset 
                                   6174 ;---------------------------------
      00A024                       6175 const_odr:
      00A024 A6 04            [ 1] 6176 	ld a,#TK_INTGR 
      00A026 AE 00 00         [ 2] 6177 	ldw x,#GPIO_ODR
      00A029 81               [ 4] 6178 	ret 
      00A02A                       6179 const_idr:
      00A02A A6 04            [ 1] 6180 	ld a,#TK_INTGR 
      00A02C AE 00 01         [ 2] 6181 	ldw x,#GPIO_IDR
      00A02F 81               [ 4] 6182 	ret 
      00A030                       6183 const_ddr:
      00A030 A6 04            [ 1] 6184 	ld a,#TK_INTGR 
      00A032 AE 00 02         [ 2] 6185 	ldw x,#GPIO_DDR
      00A035 81               [ 4] 6186 	ret 
      00A036                       6187 const_cr1:
      00A036 A6 04            [ 1] 6188 	ld a,#TK_INTGR 
      00A038 AE 00 03         [ 2] 6189 	ldw x,#GPIO_CR1
      00A03B 81               [ 4] 6190 	ret 
      00A03C                       6191 const_cr2:
      00A03C A6 04            [ 1] 6192 	ld a,#TK_INTGR 
      00A03E AE 00 04         [ 2] 6193 	ldw x,#GPIO_CR2
      00A041 81               [ 4] 6194 	ret 
                                   6195 ;-------------------------
                                   6196 ;  constant for port mode
                                   6197 ;  used by PMODE 
                                   6198 ;  input or output
                                   6199 ;------------------------
      00A042                       6200 const_output:
      00A042 A6 04            [ 1] 6201 	ld a,#TK_INTGR 
      00A044 AE 00 01         [ 2] 6202 	ldw x,#OUTP
      00A047 81               [ 4] 6203 	ret 
      00A048                       6204 const_input:
      00A048 A6 04            [ 1] 6205 	ld a,#TK_INTGR 
      00A04A AE 00 00         [ 2] 6206 	ldw x,#INP 
      00A04D 81               [ 4] 6207 	ret 
                                   6208 ;-----------------------
                                   6209 ; memory area constants
                                   6210 ;-----------------------
      00A04E                       6211 const_eeprom_base:
      00A04E A6 04            [ 1] 6212 	ld a,#TK_INTGR 
      00A050 AE 40 00         [ 2] 6213 	ldw x,#EEPROM_BASE 
      00A053 81               [ 4] 6214 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6215 
                                   6216 ;---------------------------
                                   6217 ; BASIC: DATA 
                                   6218 ; when the interpreter find 
                                   6219 ; a DATA line it skip it.
                                   6220 ;---------------------------
      00A054                       6221 data:
      00A054 55 00 04 00 02   [ 1] 6222 	mov in,count
      00A059 81               [ 4] 6223 	ret 
                                   6224 
                                   6225 ;---------------------------
                                   6226 ; BASIC: DATLN  *expr*
                                   6227 ; set DATA pointer at line# 
                                   6228 ; specified by *expr* 
                                   6229 ;---------------------------
      00A05A                       6230 data_line:
      00A05A CD 90 6A         [ 4] 6231 	call expression
      00A05D A1 04            [ 1] 6232 	cp a,#TK_INTGR
      00A05F 27 03            [ 1] 6233 	jreq 1$
      00A061 CC 87 DC         [ 2] 6234 	jp syntax_error 
      00A064 CD 82 F9         [ 4] 6235 1$: call search_lineno
      00A067 5D               [ 2] 6236 	tnzw x 
      00A068 26 05            [ 1] 6237 	jrne 3$
      00A06A A6 05            [ 1] 6238 2$:	ld a,#ERR_NO_LINE 
      00A06C CC 87 DE         [ 2] 6239 	jp tb_error
      00A06F                       6240 3$: ; check if valid data line 
      00A06F 90 93            [ 1] 6241     ldw y,x 
      00A071 EE 04            [ 2] 6242 	ldw x,(4,x)
      00A073 A3 A0 54         [ 2] 6243 	cpw x,#data 
      00A076 26 F2            [ 1] 6244 	jrne 2$ 
      00A078 90 CF 00 07      [ 2] 6245 	ldw data_ptr,y
      00A07C 90 E6 02         [ 1] 6246 	ld a,(2,y)
      00A07F C7 00 0A         [ 1] 6247 	ld data_len,a 
      00A082 35 06 00 09      [ 1] 6248 	mov data_ofs,#FIRST_DATA_ITEM 
      00A086 81               [ 4] 6249 	ret
                                   6250 
                                   6251 ;---------------------------------
                                   6252 ; BASIC: RESTORE 
                                   6253 ; set data_ptr to first data line
                                   6254 ; if not DATA found pointer set to
                                   6255 ; zero 
                                   6256 ;---------------------------------
      00A087                       6257 restore:
      00A087 72 5F 00 07      [ 1] 6258 	clr data_ptr 
      00A08B 72 5F 00 08      [ 1] 6259 	clr data_ptr+1
      00A08F 72 5F 00 09      [ 1] 6260 	clr data_ofs 
      00A093 72 5F 00 0A      [ 1] 6261 	clr data_len
      00A097 CE 00 1F         [ 2] 6262 	ldw x,txtbgn
      00A09A                       6263 data_search_loop: 	
      00A09A C3 00 21         [ 2] 6264 	cpw x,txtend
      00A09D 24 17            [ 1] 6265 	jruge 9$
      00A09F 90 93            [ 1] 6266 	ldw y,x 
      00A0A1 EE 04            [ 2] 6267 	ldw x,(4,x)
      00A0A3 A3 A0 54         [ 2] 6268 	cpw x,#data 
      00A0A6 26 1A            [ 1] 6269 	jrne try_next_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A0A8 90 CF 00 07      [ 2] 6270 	ldw data_ptr,y 
      00A0AC 90 E6 02         [ 1] 6271 	ld a,(2,y)
      00A0AF C7 00 0A         [ 1] 6272 	ld data_len,a 
      00A0B2 35 06 00 09      [ 1] 6273 	mov data_ofs,#FIRST_DATA_ITEM
      00A0B6 72 5D 00 0A      [ 1] 6274 9$:	tnz data_len 
      00A0BA 26 05            [ 1] 6275     jrne 10$
      00A0BC A6 0C            [ 1] 6276 	ld a,#ERR_NO_DATA 
      00A0BE CC 87 DE         [ 2] 6277 	jp tb_error 
      00A0C1 81               [ 4] 6278 10$:ret
      00A0C2                       6279 try_next_line:
      00A0C2 93               [ 1] 6280 	ldw x,y 
      00A0C3 E6 02            [ 1] 6281 	ld a,(2,x)
      00A0C5 C7 00 0E         [ 1] 6282 	ld acc8,a 
      00A0C8 72 5F 00 0D      [ 1] 6283 	clr acc16 
      00A0CC 72 BB 00 0D      [ 2] 6284 	addw x,acc16 
      00A0D0 20 C8            [ 2] 6285 	jra data_search_loop
                                   6286 
                                   6287 
                                   6288 ;---------------------------------
                                   6289 ; BASIC: READ 
                                   6290 ; return next data item | 0 
                                   6291 ;---------------------------------
                           000001  6292 	CTX_BPTR=1 
                           000003  6293 	CTX_IN=3 
                           000004  6294 	CTX_COUNT=4 
                           000005  6295 	XSAVE=5
                           000006  6296 	VSIZE=6
      00A0D2                       6297 read:
      002052                       6298 	_vars  VSIZE 
      00A0D2 52 06            [ 2]    1     sub sp,#VSIZE 
      00A0D4                       6299 read01:	
      00A0D4 C6 00 09         [ 1] 6300 	ld a,data_ofs
      00A0D7 C1 00 0A         [ 1] 6301 	cp a,data_len 
      00A0DA 27 37            [ 1] 6302 	jreq 2$ ; end of line  
      00A0DC CD 94 9E         [ 4] 6303 	call save_context
      00A0DF CE 00 07         [ 2] 6304 	ldw x,data_ptr 
      00A0E2 CF 00 05         [ 2] 6305 	ldw basicptr,x 
      00A0E5 55 00 09 00 02   [ 1] 6306 	mov in,data_ofs 
      00A0EA 55 00 0A 00 04   [ 1] 6307 	mov count,data_len  
      00A0EF CD 90 6A         [ 4] 6308 	call expression 
      00A0F2 A1 04            [ 1] 6309 	cp a,#TK_INTGR 
      00A0F4 27 03            [ 1] 6310 	jreq 1$ 
      00A0F6 CC 87 DC         [ 2] 6311 	jp syntax_error 
      00A0F9                       6312 1$:
      00A0F9 1F 05            [ 2] 6313 	ldw (XSAVE,SP),x
      00A0FB CD 88 98         [ 4] 6314 	call next_token ; skip comma
      00A0FE CE 00 05         [ 2] 6315 	ldw x,basicptr 
      00A101 CF 00 07         [ 2] 6316 	ldw data_ptr,x 
      00A104 55 00 02 00 09   [ 1] 6317 	mov data_ofs,in 
      00A109 CD 94 AE         [ 4] 6318 	call rest_context
      00A10C 1E 05            [ 2] 6319 	ldw x,(XSAVE,sp)
      00A10E A6 04            [ 1] 6320 	ld a,#TK_INTGR
      002090                       6321 	_drop VSIZE 
      00A110 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A112 81               [ 4] 6322 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      00A113                       6323 2$: ; end of line reached 
      00A113 90 CE 00 07      [ 2] 6324 	ldw y, data_ptr 
      00A117 72 5F 00 07      [ 1] 6325 	clr data_ptr
      00A11B 72 5F 00 08      [ 1] 6326 	clr data_ptr+1   
      00A11F 72 5F 00 09      [ 1] 6327 	clr data_ofs 
      00A123 72 5F 00 0A      [ 1] 6328 	clr data_len 
      00A127 CD A0 C2         [ 4] 6329 	call try_next_line 
      00A12A 20 A8            [ 2] 6330 	jra read01
                                   6331 
                                   6332 
                                   6333 ;---------------------------------
                                   6334 ; BASIC: SPIEN clkdiv, 0|1  
                                   6335 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6336 ; if clkdiv==-1 disable SPI
                                   6337 ; 0|1 -> disable|enable  
                                   6338 ;--------------------------------- 
                           000005  6339 SPI_CS_BIT=5
      00A12C                       6340 spi_enable:
      00A12C CD 8F 5E         [ 4] 6341 	call arg_list 
      00A12F A1 02            [ 1] 6342 	cp a,#2
      00A131 27 03            [ 1] 6343 	jreq 1$
      00A133 CC 87 DC         [ 2] 6344 	jp syntax_error 
      00A136                       6345 1$: 
      00A136 72 12 50 C7      [ 1] 6346 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A13A 85               [ 2] 6347 	popw x  
      00A13B 27 21            [ 1] 6348 	jreq spi_disable 
      00A13D 85               [ 2] 6349 	popw x 
      00A13E A6 08            [ 1] 6350 	ld a,#(1<<SPI_CR1_BR)
      00A140 42               [ 4] 6351 	mul x,a 
      00A141 9F               [ 1] 6352 	ld a,xl 
      00A142 C7 52 00         [ 1] 6353 	ld SPI_CR1,a 
                                   6354 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A145 72 1A 50 14      [ 1] 6355 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A149 72 1A 50 16      [ 1] 6356 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6357 ; configure SPI as master mode 0.	
      00A14D 72 14 52 00      [ 1] 6358 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6359 ; ~CS line controlled by sofware 	
      00A151 72 12 52 01      [ 1] 6360 	bset SPI_CR2,#SPI_CR2_SSM 
      00A155 72 10 52 01      [ 1] 6361     bset SPI_CR2,#SPI_CR2_SSI 
                                   6362 ; enable SPI
      00A159 72 1C 52 00      [ 1] 6363 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A15D 81               [ 4] 6364 	ret 
      00A15E                       6365 spi_disable:
      0020DE                       6366 	_drop #2; throw first argument.
      00A15E 5B 02            [ 2]    1     addw sp,##2 
                                   6367 ; wait spi idle 
      00A160 A6 82            [ 1] 6368 1$:	ld a,#0x82 
      00A162 C4 52 03         [ 1] 6369 	and a,SPI_SR
      00A165 A1 02            [ 1] 6370 	cp a,#2 
      00A167 26 F7            [ 1] 6371 	jrne 1$
      00A169 72 1D 52 00      [ 1] 6372 	bres SPI_CR1,#SPI_CR1_SPE
      00A16D 72 13 50 C7      [ 1] 6373 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A171 72 1B 50 16      [ 1] 6374 	bres PE_DDR,#SPI_CS_BIT 
      00A175 81               [ 4] 6375 	ret 
                                   6376 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A176                       6377 spi_clear_error:
      00A176 A6 78            [ 1] 6378 	ld a,#0x78 
      00A178 C5 52 03         [ 1] 6379 	bcp a,SPI_SR 
      00A17B 27 04            [ 1] 6380 	jreq 1$
      00A17D 72 5F 52 03      [ 1] 6381 	clr SPI_SR 
      00A181 81               [ 4] 6382 1$: ret 
                                   6383 
      00A182                       6384 spi_send_byte:
      00A182 88               [ 1] 6385 	push a 
      00A183 CD A1 76         [ 4] 6386 	call spi_clear_error
      00A186 84               [ 1] 6387 	pop a 
      00A187 72 03 52 03 FB   [ 2] 6388 	btjf SPI_SR,#SPI_SR_TXE,.
      00A18C C7 52 04         [ 1] 6389 	ld SPI_DR,a
      00A18F 72 01 52 03 FB   [ 2] 6390 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A194 C6 52 04         [ 1] 6391 	ld a,SPI_DR 
      00A197 81               [ 4] 6392 	ret 
                                   6393 
      00A198                       6394 spi_rcv_byte:
      00A198 A6 FF            [ 1] 6395 	ld a,#255
      00A19A 72 01 52 03 E3   [ 2] 6396 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A19F C6 52 04         [ 1] 6397 	ld a,SPI_DR 
      00A1A2 81               [ 4] 6398 	ret
                                   6399 
                                   6400 ;------------------------------
                                   6401 ; BASIC: SPIWR byte [,byte]
                                   6402 ; write 1 or more byte
                                   6403 ;------------------------------
      00A1A3                       6404 spi_write:
      00A1A3 CD 90 6A         [ 4] 6405 	call expression
      00A1A6 A1 04            [ 1] 6406 	cp a,#TK_INTGR 
      00A1A8 27 03            [ 1] 6407 	jreq 1$
      00A1AA CC 87 DC         [ 2] 6408 	jp syntax_error 
      00A1AD                       6409 1$:	
      00A1AD 9F               [ 1] 6410 	ld a,xl 
      00A1AE CD A1 82         [ 4] 6411 	call spi_send_byte 
      00A1B1 CD 88 98         [ 4] 6412 	call next_token 
      00A1B4 A1 0D            [ 1] 6413 	cp a,#TK_COMMA 
      00A1B6 26 02            [ 1] 6414 	jrne 2$ 
      00A1B8 20 E9            [ 2] 6415 	jra spi_write 
      00A1BA 4D               [ 1] 6416 2$:	tnz a 
      00A1BB 27 05            [ 1] 6417 	jreq 3$
      00213D                       6418 	_unget_token  
      00A1BD 55 00 03 00 02   [ 1]    1     mov in,in.saved
      00A1C2 81               [ 4] 6419 3$:	ret 
                                   6420 
                                   6421 
                                   6422 ;-------------------------------
                                   6423 ; BASIC: SPIRD 	
                                   6424 ; read one byte from SPI 
                                   6425 ;-------------------------------
      00A1C3                       6426 spi_read:
      00A1C3 CD A1 98         [ 4] 6427 	call spi_rcv_byte 
      00A1C6 5F               [ 1] 6428 	clrw x 
      00A1C7 97               [ 1] 6429 	ld xl,a 
      00A1C8 A6 04            [ 1] 6430 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A1CA 81               [ 4] 6431 	ret 
                                   6432 
                                   6433 ;------------------------------
                                   6434 ; BASIC: SPISEL 0|1 
                                   6435 ; set state of ~CS line
                                   6436 ; 0|1 deselect|select  
                                   6437 ;------------------------------
      00A1CB                       6438 spi_select:
      00A1CB CD 88 98         [ 4] 6439 	call next_token 
      00A1CE A1 04            [ 1] 6440 	cp a,#TK_INTGR 
      00A1D0 27 03            [ 1] 6441 	jreq 1$
      00A1D2 CC 87 DC         [ 2] 6442 	jp syntax_error 
      00A1D5 5D               [ 2] 6443 1$: tnzw x  
      00A1D6 27 05            [ 1] 6444 	jreq cs_high 
      00A1D8 72 1B 50 14      [ 1] 6445 	bres PE_ODR,#SPI_CS_BIT
      00A1DC 81               [ 4] 6446 	ret 
      00A1DD                       6447 cs_high: 
      00A1DD 72 1A 50 14      [ 1] 6448 	bset PE_ODR,#SPI_CS_BIT
      00A1E1 81               [ 4] 6449 	ret 
                                   6450 
                                   6451 
                                   6452 ;------------------------------
                                   6453 ; BASIC: FILERX
                                   6454 ; Use to receive a BASIC program
                                   6455 ; from the PC using XMODEM 
                                   6456 ; protocol. The file is store in
                                   6457 ; Each line received is compiled
                                   6458 ; then stored in RAM. When reception 
                                   6459 ; is completed with success  the 
                                   6460 ; program is ready to be executed 
                                   6461 ; or save as local file.
                                   6462 ;--------------------------------
      00A1E2                       6463 file_receive:
      00A1E2 72 01 00 26 05   [ 2] 6464 	btjf flags,#FRUN,1$
      00A1E7 A6 07            [ 1] 6465 	ld a,#ERR_CMD_ONLY
      00A1E9 CC 87 DE         [ 2] 6466 	jp tb_error 
      00A1EC                       6467 1$:	
      00A1EC CD 86 79         [ 4] 6468 	call clear_basic
      00A1EF CE 00 1F         [ 2] 6469 	ldw x, txtbgn
      00A1F2 CD A6 18         [ 4] 6470 	call xreceive 
      00A1F5 72 BB 00 1F      [ 2] 6471 	addw x,txtbgn 
      00A1F9 CF 00 21         [ 2] 6472 	ldw txtend,x 
      00A1FC CD 89 2D         [ 4] 6473 	call print_int 
      00A1FF AE A2 06         [ 2] 6474 	ldw x,#fsize_msg 
      00A202 CD 82 57         [ 4] 6475 	call puts 
      00A205 81               [ 4] 6476 	ret 
      00A206 20 62 79 74 65 73 20  6477 fsize_msg: .asciz " bytes received\n"
             72 65 63 65 69 76 65
             64 0A 00
                                   6478 
                                   6479 ;------------------------------
                                   6480 ; BASIC: FILETX "file_name" 
                                   6481 ; Transmit the program in RAM 
                                   6482 ; To the PC using XMODEM protocol.
                                   6483 ; The file transmitted as source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   6484 ; file not tokenized. 
                                   6485 ;-------------------------------
      00A217                       6486 file_transmit:
                                   6487 
      00A217 81               [ 4] 6488 	ret 
                                   6489 
                                   6490 
                                   6491 ;------------------------------
                                   6492 ;      dictionary 
                                   6493 ; format:
                                   6494 ;   link:   2 bytes 
                                   6495 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6496 ;   cmd_name: 16 byte max 
                                   6497 ;   code_address: 2 bytes 
                                   6498 ;------------------------------
                                   6499 	.macro _dict_entry len,name,cmd 
                                   6500 	.word LINK 
                                   6501 	LINK=.
                                   6502 name:
                                   6503 	.byte len 	
                                   6504 	.ascii "name"
                                   6505 	.word cmd 
                                   6506 	.endm 
                                   6507 
                           000000  6508 	LINK=0
                                   6509 ; respect alphabetic order for BASIC names from Z-A
                                   6510 ; this sort order is for a cleaner WORDS cmd output. 	
      00A218                       6511 kword_end:
      002198                       6512 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A218 00 00                    1 	.word LINK 
                           00219A     2 	LINK=.
      00A21A                          3 XPEEK:
      00A21A 45                       4 	.byte 5+F_IFUNC 	
      00A21B 58 50 45 45 4B           5 	.ascii "XPEEK"
      00A220 95 C5                    6 	.word xpeek 
      0021A2                       6513 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A222 A2 1A                    1 	.word LINK 
                           0021A4     2 	LINK=.
      00A224                          3 XOR:
      00A224 43                       4 	.byte 3+F_IFUNC 	
      00A225 58 4F 52                 5 	.ascii "XOR"
      00A228 9D 9B                    6 	.word bit_xor 
      0021AA                       6514 	_dict_entry,5,WRITE,write  
      00A22A A2 24                    1 	.word LINK 
                           0021AC     2 	LINK=.
      00A22C                          3 WRITE:
      00A22C 05                       4 	.byte 5 	
      00A22D 57 52 49 54 45           5 	.ascii "WRITE"
      00A232 9B C1                    6 	.word write 
      0021B4                       6515 	_dict_entry,5,WORDS,words 
      00A234 A2 2C                    1 	.word LINK 
                           0021B6     2 	LINK=.
      00A236                          3 WORDS:
      00A236 05                       4 	.byte 5 	
      00A237 57 4F 52 44 53           5 	.ascii "WORDS"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A23C 9E C9                    6 	.word words 
      0021BE                       6516 	_dict_entry 4,WAIT,wait 
      00A23E A2 36                    1 	.word LINK 
                           0021C0     2 	LINK=.
      00A240                          3 WAIT:
      00A240 04                       4 	.byte 4 	
      00A241 57 41 49 54              5 	.ascii "WAIT"
      00A245 95 28                    6 	.word wait 
      0021C7                       6517 	_dict_entry,3+F_IFUNC,USR,usr
      00A247 A2 40                    1 	.word LINK 
                           0021C9     2 	LINK=.
      00A249                          3 USR:
      00A249 43                       4 	.byte 3+F_IFUNC 	
      00A24A 55 53 52                 5 	.ascii "USR"
      00A24D 9C 6D                    6 	.word usr 
      0021CF                       6518 	_dict_entry,5,UNTIL,until 
      00A24F A2 49                    1 	.word LINK 
                           0021D1     2 	LINK=.
      00A251                          3 UNTIL:
      00A251 05                       4 	.byte 5 	
      00A252 55 4E 54 49 4C           5 	.ascii "UNTIL"
      00A257 9F C0                    6 	.word until 
      0021D9                       6519 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A259 A2 51                    1 	.word LINK 
                           0021DB     2 	LINK=.
      00A25B                          3 UFLASH:
      00A25B 46                       4 	.byte 6+F_IFUNC 	
      00A25C 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A262 9C 67                    6 	.word uflash 
      0021E4                       6520 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A264 A2 5B                    1 	.word LINK 
                           0021E6     2 	LINK=.
      00A266                          3 UBOUND:
      00A266 46                       4 	.byte 6+F_IFUNC 	
      00A267 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A26D 91 BB                    6 	.word ubound 
      0021EF                       6521 	_dict_entry,4,TONE,tone  
      00A26F A2 66                    1 	.word LINK 
                           0021F1     2 	LINK=.
      00A271                          3 TONE:
      00A271 04                       4 	.byte 4 	
      00A272 54 4F 4E 45              5 	.ascii "TONE"
      00A276 97 8F                    6 	.word tone 
      0021F8                       6522 	_dict_entry,2,TO,to
      00A278 A2 71                    1 	.word LINK 
                           0021FA     2 	LINK=.
      00A27A                          3 TO:
      00A27A 02                       4 	.byte 2 	
      00A27B 54 4F                    5 	.ascii "TO"
      00A27D 96 1E                    6 	.word to 
      0021FF                       6523 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A27F A2 7A                    1 	.word LINK 
                           002201     2 	LINK=.
      00A281                          3 TIMEOUT:
      00A281 47                       4 	.byte 7+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A282 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A289 9F 12                    6 	.word timeout 
      00220B                       6524 	_dict_entry,5,TIMER,set_timer
      00A28B A2 81                    1 	.word LINK 
                           00220D     2 	LINK=.
      00A28D                          3 TIMER:
      00A28D 05                       4 	.byte 5 	
      00A28E 54 49 4D 45 52           5 	.ascii "TIMER"
      00A293 9F 03                    6 	.word set_timer 
      002215                       6525 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A295 A2 8D                    1 	.word LINK 
                           002217     2 	LINK=.
      00A297                          3 TICKS:
      00A297 45                       4 	.byte 5+F_IFUNC 	
      00A298 54 49 43 4B 53           5 	.ascii "TICKS"
      00A29D 9D 51                    6 	.word get_ticks 
      00221F                       6526 	_dict_entry,4,STOP,stop 
      00A29F A2 97                    1 	.word LINK 
                           002221     2 	LINK=.
      00A2A1                          3 STOP:
      00A2A1 04                       4 	.byte 4 	
      00A2A2 53 54 4F 50              5 	.ascii "STOP"
      00A2A6 98 B3                    6 	.word stop 
      002228                       6527 	_dict_entry,4,STEP,step 
      00A2A8 A2 A1                    1 	.word LINK 
                           00222A     2 	LINK=.
      00A2AA                          3 STEP:
      00A2AA 04                       4 	.byte 4 	
      00A2AB 53 54 45 50              5 	.ascii "STEP"
      00A2AF 96 4E                    6 	.word step 
      002231                       6528 	_dict_entry,5,SPIWR,spi_write
      00A2B1 A2 AA                    1 	.word LINK 
                           002233     2 	LINK=.
      00A2B3                          3 SPIWR:
      00A2B3 05                       4 	.byte 5 	
      00A2B4 53 50 49 57 52           5 	.ascii "SPIWR"
      00A2B9 A1 A3                    6 	.word spi_write 
      00223B                       6529 	_dict_entry,6,SPISEL,spi_select
      00A2BB A2 B3                    1 	.word LINK 
                           00223D     2 	LINK=.
      00A2BD                          3 SPISEL:
      00A2BD 06                       4 	.byte 6 	
      00A2BE 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      00A2C4 A1 CB                    6 	.word spi_select 
      002246                       6530 	_dict_entry,5,SPIEN,spi_enable 
      00A2C6 A2 BD                    1 	.word LINK 
                           002248     2 	LINK=.
      00A2C8                          3 SPIEN:
      00A2C8 05                       4 	.byte 5 	
      00A2C9 53 50 49 45 4E           5 	.ascii "SPIEN"
      00A2CE A1 2C                    6 	.word spi_enable 
      002250                       6531 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A2D0 A2 C8                    1 	.word LINK 
                           002252     2 	LINK=.
      00A2D2                          3 SPIRD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2D2 45                       4 	.byte 5+F_IFUNC 	
      00A2D3 53 50 49 52 44           5 	.ascii "SPIRD"
      00A2D8 A1 C3                    6 	.word spi_read 
      00225A                       6532 	_dict_entry,5,SLEEP,sleep 
      00A2DA A2 D2                    1 	.word LINK 
                           00225C     2 	LINK=.
      00A2DC                          3 SLEEP:
      00A2DC 05                       4 	.byte 5 	
      00A2DD 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A2E2 9C EA                    6 	.word sleep 
      002264                       6533 	_dict_entry,4+F_IFUNC,SIZE,size
      00A2E4 A2 DC                    1 	.word LINK 
                           002266     2 	LINK=.
      00A2E6                          3 SIZE:
      00A2E6 44                       4 	.byte 4+F_IFUNC 	
      00A2E7 53 49 5A 45              5 	.ascii "SIZE"
      00A2EB 91 B1                    6 	.word size 
      00226D                       6534     _dict_entry,4,SHOW,show 
      00A2ED A2 E6                    1 	.word LINK 
                           00226F     2 	LINK=.
      00A2EF                          3 SHOW:
      00A2EF 04                       4 	.byte 4 	
      00A2F0 53 48 4F 57              5 	.ascii "SHOW"
      00A2F4 91 05                    6 	.word show 
      002276                       6535 	_dict_entry,4,SAVE,save
      00A2F6 A2 EF                    1 	.word LINK 
                           002278     2 	LINK=.
      00A2F8                          3 SAVE:
      00A2F8 04                       4 	.byte 4 	
      00A2F9 53 41 56 45              5 	.ascii "SAVE"
      00A2FD 99 C1                    6 	.word save 
      00227F                       6536 	_dict_entry 3,RUN,run
      00A2FF A2 F8                    1 	.word LINK 
                           002281     2 	LINK=.
      00A301                          3 RUN:
      00A301 03                       4 	.byte 3 	
      00A302 52 55 4E                 5 	.ascii "RUN"
      00A305 97 2E                    6 	.word run 
      002287                       6537 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A307 A3 01                    1 	.word LINK 
                           002289     2 	LINK=.
      00A309                          3 RSHIFT:
      00A309 46                       4 	.byte 6+F_IFUNC 	
      00A30A 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A310 9D CC                    6 	.word rshift 
      002292                       6538 	_dict_entry,3+F_IFUNC,RND,random 
      00A312 A3 09                    1 	.word LINK 
                           002294     2 	LINK=.
      00A314                          3 RND:
      00A314 43                       4 	.byte 3+F_IFUNC 	
      00A315 52 4E 44                 5 	.ascii "RND"
      00A318 9E 62                    6 	.word random 
      00229A                       6539 	_dict_entry,6,RETURN,return 
      00A31A A3 14                    1 	.word LINK 
                           00229C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A31C                          3 RETURN:
      00A31C 06                       4 	.byte 6 	
      00A31D 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A323 97 10                    6 	.word return 
      0022A5                       6540 	_dict_entry,7,RESTORE,restore 
      00A325 A3 1C                    1 	.word LINK 
                           0022A7     2 	LINK=.
      00A327                          3 RESTORE:
      00A327 07                       4 	.byte 7 	
      00A328 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A32F A0 87                    6 	.word restore 
      0022B1                       6541 	_dict_entry 6,REMARK,rem 
      00A331 A3 27                    1 	.word LINK 
                           0022B3     2 	LINK=.
      00A333                          3 REMARK:
      00A333 06                       4 	.byte 6 	
      00A334 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A33A 95 22                    6 	.word rem 
      0022BC                       6542 	_dict_entry,6,REBOOT,cold_start
      00A33C A3 33                    1 	.word LINK 
                           0022BE     2 	LINK=.
      00A33E                          3 REBOOT:
      00A33E 06                       4 	.byte 6 	
      00A33F 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A345 85 6E                    6 	.word cold_start 
      0022C7                       6543 	_dict_entry,4+F_IFUNC,READ,read  
      00A347 A3 3E                    1 	.word LINK 
                           0022C9     2 	LINK=.
      00A349                          3 READ:
      00A349 44                       4 	.byte 4+F_IFUNC 	
      00A34A 52 45 41 44              5 	.ascii "READ"
      00A34E A0 D2                    6 	.word read 
      0022D0                       6544 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A350 A3 49                    1 	.word LINK 
                           0022D2     2 	LINK=.
      00A352                          3 QKEY:
      00A352 44                       4 	.byte 4+F_IFUNC 	
      00A353 51 4B 45 59              5 	.ascii "QKEY"
      00A357 9C 32                    6 	.word qkey 
      0022D9                       6545 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A359 A3 52                    1 	.word LINK 
                           0022DB     2 	LINK=.
      00A35B                          3 PRTI:
      00A35B 44                       4 	.byte 4+F_IFUNC 	
      00A35C 50 52 54 49              5 	.ascii "PRTI"
      00A360 A0 1E                    6 	.word const_porti 
      0022E2                       6546 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A362 A3 5B                    1 	.word LINK 
                           0022E4     2 	LINK=.
      00A364                          3 PRTH:
      00A364 44                       4 	.byte 4+F_IFUNC 	
      00A365 50 52 54 48              5 	.ascii "PRTH"
      00A369 A0 18                    6 	.word const_porth 
      0022EB                       6547 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A36B A3 64                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                           0022ED     2 	LINK=.
      00A36D                          3 PRTG:
      00A36D 44                       4 	.byte 4+F_IFUNC 	
      00A36E 50 52 54 47              5 	.ascii "PRTG"
      00A372 A0 12                    6 	.word const_portg 
      0022F4                       6548 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A374 A3 6D                    1 	.word LINK 
                           0022F6     2 	LINK=.
      00A376                          3 PRTF:
      00A376 44                       4 	.byte 4+F_IFUNC 	
      00A377 50 52 54 46              5 	.ascii "PRTF"
      00A37B A0 0C                    6 	.word const_portf 
      0022FD                       6549 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A37D A3 76                    1 	.word LINK 
                           0022FF     2 	LINK=.
      00A37F                          3 PRTE:
      00A37F 44                       4 	.byte 4+F_IFUNC 	
      00A380 50 52 54 45              5 	.ascii "PRTE"
      00A384 A0 06                    6 	.word const_porte 
      002306                       6550 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A386 A3 7F                    1 	.word LINK 
                           002308     2 	LINK=.
      00A388                          3 PRTD:
      00A388 44                       4 	.byte 4+F_IFUNC 	
      00A389 50 52 54 44              5 	.ascii "PRTD"
      00A38D A0 00                    6 	.word const_portd 
      00230F                       6551 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A38F A3 88                    1 	.word LINK 
                           002311     2 	LINK=.
      00A391                          3 PRTC:
      00A391 44                       4 	.byte 4+F_IFUNC 	
      00A392 50 52 54 43              5 	.ascii "PRTC"
      00A396 9F FA                    6 	.word const_portc 
      002318                       6552 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A398 A3 91                    1 	.word LINK 
                           00231A     2 	LINK=.
      00A39A                          3 PRTB:
      00A39A 44                       4 	.byte 4+F_IFUNC 	
      00A39B 50 52 54 42              5 	.ascii "PRTB"
      00A39F 9F F4                    6 	.word const_portb 
      002321                       6553 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A3A1 A3 9A                    1 	.word LINK 
                           002323     2 	LINK=.
      00A3A3                          3 PRTA:
      00A3A3 44                       4 	.byte 4+F_IFUNC 	
      00A3A4 50 52 54 41              5 	.ascii "PRTA"
      00A3A8 9F EE                    6 	.word const_porta 
      00232A                       6554 	_dict_entry 5,PRINT,print 
      00A3AA A3 A3                    1 	.word LINK 
                           00232C     2 	LINK=.
      00A3AC                          3 PRINT:
      00A3AC 05                       4 	.byte 5 	
      00A3AD 50 52 49 4E 54           5 	.ascii "PRINT"
      00A3B2 94 34                    6 	.word print 
      002334                       6555 	_dict_entry,4+F_IFUNC,POUT,const_output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A3B4 A3 AC                    1 	.word LINK 
                           002336     2 	LINK=.
      00A3B6                          3 POUT:
      00A3B6 44                       4 	.byte 4+F_IFUNC 	
      00A3B7 50 4F 55 54              5 	.ascii "POUT"
      00A3BB A0 42                    6 	.word const_output 
      00233D                       6556 	_dict_entry,4,POKE,poke 
      00A3BD A3 B6                    1 	.word LINK 
                           00233F     2 	LINK=.
      00A3BF                          3 POKE:
      00A3BF 04                       4 	.byte 4 	
      00A3C0 50 4F 4B 45              5 	.ascii "POKE"
      00A3C4 95 A5                    6 	.word poke 
      002346                       6557 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A3C6 A3 BF                    1 	.word LINK 
                           002348     2 	LINK=.
      00A3C8                          3 PINP:
      00A3C8 44                       4 	.byte 4+F_IFUNC 	
      00A3C9 50 49 4E 50              5 	.ascii "PINP"
      00A3CD A0 48                    6 	.word const_input 
      00234F                       6558 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A3CF A3 C8                    1 	.word LINK 
                           002351     2 	LINK=.
      00A3D1                          3 PEEK:
      00A3D1 44                       4 	.byte 4+F_IFUNC 	
      00A3D2 50 45 45 4B              5 	.ascii "PEEK"
      00A3D6 95 B4                    6 	.word peek 
      002358                       6559 	_dict_entry,5,PMODE,pin_mode 
      00A3D8 A3 D1                    1 	.word LINK 
                           00235A     2 	LINK=.
      00A3DA                          3 PMODE:
      00A3DA 05                       4 	.byte 5 	
      00A3DB 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A3E0 9D F1                    6 	.word pin_mode 
      002362                       6560 	_dict_entry,5,PAUSE,pause 
      00A3E2 A3 DA                    1 	.word LINK 
                           002364     2 	LINK=.
      00A3E4                          3 PAUSE:
      00A3E4 05                       4 	.byte 5 	
      00A3E5 50 41 55 53 45           5 	.ascii "PAUSE"
      00A3EA 9C F5                    6 	.word pause 
      00236C                       6561 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A3EC A3 E4                    1 	.word LINK 
                           00236E     2 	LINK=.
      00A3EE                          3 OR:
      00A3EE 42                       4 	.byte 2+F_IFUNC 	
      00A3EF 4F 52                    5 	.ascii "OR"
      00A3F1 9D 83                    6 	.word bit_or 
      002373                       6562 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A3F3 A3 EE                    1 	.word LINK 
                           002375     2 	LINK=.
      00A3F5                          3 ODR:
      00A3F5 43                       4 	.byte 3+F_IFUNC 	
      00A3F6 4F 44 52                 5 	.ascii "ODR"
      00A3F9 A0 24                    6 	.word const_odr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00237B                       6563 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A3FB A3 F5                    1 	.word LINK 
                           00237D     2 	LINK=.
      00A3FD                          3 NOT:
      00A3FD 43                       4 	.byte 3+F_IFUNC 	
      00A3FE 4E 4F 54                 5 	.ascii "NOT"
      00A401 9F 1F                    6 	.word func_not 
      002383                       6564 	_dict_entry,3,NEW,new
      00A403 A3 FD                    1 	.word LINK 
                           002385     2 	LINK=.
      00A405                          3 NEW:
      00A405 03                       4 	.byte 3 	
      00A406 4E 45 57                 5 	.ascii "NEW"
      00A409 98 FF                    6 	.word new 
      00238B                       6565 	_dict_entry,4,NEXT,next 
      00A40B A4 05                    1 	.word LINK 
                           00238D     2 	LINK=.
      00A40D                          3 NEXT:
      00A40D 04                       4 	.byte 4 	
      00A40E 4E 45 58 54              5 	.ascii "NEXT"
      00A412 96 75                    6 	.word next 
      002394                       6566 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A414 A4 0D                    1 	.word LINK 
                           002396     2 	LINK=.
      00A416                          3 LSHIFT:
      00A416 46                       4 	.byte 6+F_IFUNC 	
      00A417 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A41D 9D B3                    6 	.word lshift 
      00239F                       6567 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A41F A4 16                    1 	.word LINK 
                           0023A1     2 	LINK=.
      00A421                          3 LOG:
      00A421 43                       4 	.byte 3+F_IFUNC 	
      00A422 4C 4F 47                 5 	.ascii "LOG"
      00A425 9F 67                    6 	.word log2 
      0023A7                       6568 	_dict_entry,4,LOAD,load 
      00A427 A4 21                    1 	.word LINK 
                           0023A9     2 	LINK=.
      00A429                          3 LOAD:
      00A429 04                       4 	.byte 4 	
      00A42A 4C 4F 41 44              5 	.ascii "LOAD"
      00A42E 9A B1                    6 	.word load 
      0023B0                       6569 	_dict_entry 4,LIST,list
      00A430 A4 29                    1 	.word LINK 
                           0023B2     2 	LINK=.
      00A432                          3 LIST:
      00A432 04                       4 	.byte 4 	
      00A433 4C 49 53 54              5 	.ascii "LIST"
      00A437 92 01                    6 	.word list 
      0023B9                       6570 	_dict_entry 3,LET,let 
      00A439 A4 32                    1 	.word LINK 
                           0023BB     2 	LINK=.
      00A43B                          3 LET:
      00A43B 03                       4 	.byte 3 	
      00A43C 4C 45 54                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A43F 91 DD                    6 	.word let 
      0023C1                       6571 	_dict_entry,3+F_IFUNC,KEY,key 
      00A441 A4 3B                    1 	.word LINK 
                           0023C3     2 	LINK=.
      00A443                          3 KEY:
      00A443 43                       4 	.byte 3+F_IFUNC 	
      00A444 4B 45 59                 5 	.ascii "KEY"
      00A447 9C 2A                    6 	.word key 
      0023C9                       6572 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A449 A4 43                    1 	.word LINK 
                           0023CB     2 	LINK=.
      00A44B                          3 IWDGREF:
      00A44B 07                       4 	.byte 7 	
      00A44C 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00A453 9F 62                    6 	.word refresh_iwdg 
      0023D5                       6573 	_dict_entry,6,IWDGEN,enable_iwdg
      00A455 A4 4B                    1 	.word LINK 
                           0023D7     2 	LINK=.
      00A457                          3 IWDGEN:
      00A457 06                       4 	.byte 6 	
      00A458 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      00A45E 9F 2C                    6 	.word enable_iwdg 
      0023E0                       6574 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A460 A4 57                    1 	.word LINK 
                           0023E2     2 	LINK=.
      00A462                          3 INVERT:
      00A462 46                       4 	.byte 6+F_IFUNC 	
      00A463 49 4E 56 45 52 54        5 	.ascii "INVERT"
      00A469 9F 9C                    6 	.word invert 
      0023EB                       6575 	_dict_entry,5,INPUT,input_var  
      00A46B A4 62                    1 	.word LINK 
                           0023ED     2 	LINK=.
      00A46D                          3 INPUT:
      00A46D 05                       4 	.byte 5 	
      00A46E 49 4E 50 55 54           5 	.ascii "INPUT"
      00A473 94 BE                    6 	.word input_var 
      0023F5                       6576 	_dict_entry,2,IF,if 
      00A475 A4 6D                    1 	.word LINK 
                           0023F7     2 	LINK=.
      00A477                          3 IF:
      00A477 02                       4 	.byte 2 	
      00A478 49 46                    5 	.ascii "IF"
      00A47A 95 E1                    6 	.word if 
      0023FC                       6577 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A47C A4 77                    1 	.word LINK 
                           0023FE     2 	LINK=.
      00A47E                          3 IDR:
      00A47E 43                       4 	.byte 3+F_IFUNC 	
      00A47F 49 44 52                 5 	.ascii "IDR"
      00A482 A0 2A                    6 	.word const_idr 
      002404                       6578 	_dict_entry,3,HEX,hex_base
      00A484 A4 7E                    1 	.word LINK 
                           002406     2 	LINK=.
      00A486                          3 HEX:
      00A486 03                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A487 48 45 58                 5 	.ascii "HEX"
      00A48A 91 A7                    6 	.word hex_base 
      00240C                       6579 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A48C A4 86                    1 	.word LINK 
                           00240E     2 	LINK=.
      00A48E                          3 GPIO:
      00A48E 44                       4 	.byte 4+F_IFUNC 	
      00A48F 47 50 49 4F              5 	.ascii "GPIO"
      00A493 9C 3D                    6 	.word gpio 
      002415                       6580 	_dict_entry,4,GOTO,goto 
      00A495 A4 8E                    1 	.word LINK 
                           002417     2 	LINK=.
      00A497                          3 GOTO:
      00A497 04                       4 	.byte 4 	
      00A498 47 4F 54 4F              5 	.ascii "GOTO"
      00A49C 96 D5                    6 	.word goto 
      00241E                       6581 	_dict_entry,5,GOSUB,gosub 
      00A49E A4 97                    1 	.word LINK 
                           002420     2 	LINK=.
      00A4A0                          3 GOSUB:
      00A4A0 05                       4 	.byte 5 	
      00A4A1 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A4A6 96 F0                    6 	.word gosub 
      002428                       6582 	_dict_entry,6,FORGET,forget 
      00A4A8 A4 A0                    1 	.word LINK 
                           00242A     2 	LINK=.
      00A4AA                          3 FORGET:
      00A4AA 06                       4 	.byte 6 	
      00A4AB 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A4B1 9A E6                    6 	.word forget 
      002433                       6583 	_dict_entry,3,FOR,for 
      00A4B3 A4 AA                    1 	.word LINK 
                           002435     2 	LINK=.
      00A4B5                          3 FOR:
      00A4B5 03                       4 	.byte 3 	
      00A4B6 46 4F 52                 5 	.ascii "FOR"
      00A4B9 95 F5                    6 	.word for 
      00243B                       6584 	_dict_entry,6,FILETX,file_transmit
      00A4BB A4 B5                    1 	.word LINK 
                           00243D     2 	LINK=.
      00A4BD                          3 FILETX:
      00A4BD 06                       4 	.byte 6 	
      00A4BE 46 49 4C 45 54 58        5 	.ascii "FILETX"
      00A4C4 A2 17                    6 	.word file_transmit 
      002446                       6585 	_dict_entry,6,FILERX,file_receive 
      00A4C6 A4 BD                    1 	.word LINK 
                           002448     2 	LINK=.
      00A4C8                          3 FILERX:
      00A4C8 06                       4 	.byte 6 	
      00A4C9 46 49 4C 45 52 58        5 	.ascii "FILERX"
      00A4CF A1 E2                    6 	.word file_receive 
      002451                       6586 	_dict_entry,4,FCPU,fcpu 
      00A4D1 A4 C8                    1 	.word LINK 
                           002453     2 	LINK=.
      00A4D3                          3 FCPU:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A4D3 04                       4 	.byte 4 	
      00A4D4 46 43 50 55              5 	.ascii "FCPU"
      00A4D8 9D E5                    6 	.word fcpu 
      00245A                       6587 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A4DA A4 D3                    1 	.word LINK 
                           00245C     2 	LINK=.
      00A4DC                          3 EEPROM:
      00A4DC 46                       4 	.byte 6+F_IFUNC 	
      00A4DD 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A4E3 A0 4E                    6 	.word const_eeprom_base 
      002465                       6588 	_dict_entry,3,END,cmd_end  
      00A4E5 A4 DC                    1 	.word LINK 
                           002467     2 	LINK=.
      00A4E7                          3 END:
      00A4E7 03                       4 	.byte 3 	
      00A4E8 45 4E 44                 5 	.ascii "END"
      00A4EB 97 80                    6 	.word cmd_end 
      00246D                       6589 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A4ED A4 E7                    1 	.word LINK 
                           00246F     2 	LINK=.
      00A4EF                          3 DWRITE:
      00A4EF 06                       4 	.byte 6+F_CMD 	
      00A4F0 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00A4F6 98 78                    6 	.word digital_write 
      002478                       6590 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A4F8 A4 EF                    1 	.word LINK 
                           00247A     2 	LINK=.
      00A4FA                          3 DREAD:
      00A4FA 45                       4 	.byte 5+F_IFUNC 	
      00A4FB 44 52 45 41 44           5 	.ascii "DREAD"
      00A500 98 48                    6 	.word digital_read 
      002482                       6591 	_dict_entry,2,DO,do_loop
      00A502 A4 FA                    1 	.word LINK 
                           002484     2 	LINK=.
      00A504                          3 DO:
      00A504 02                       4 	.byte 2 	
      00A505 44 4F                    5 	.ascii "DO"
      00A507 9F AB                    6 	.word do_loop 
      002489                       6592 	_dict_entry,3,DIR,directory 
      00A509 A5 04                    1 	.word LINK 
                           00248B     2 	LINK=.
      00A50B                          3 DIR:
      00A50B 03                       4 	.byte 3 	
      00A50C 44 49 52                 5 	.ascii "DIR"
      00A50F 9B 2B                    6 	.word directory 
      002491                       6593 	_dict_entry,3,DEC,dec_base
      00A511 A5 0B                    1 	.word LINK 
                           002493     2 	LINK=.
      00A513                          3 DEC:
      00A513 03                       4 	.byte 3 	
      00A514 44 45 43                 5 	.ascii "DEC"
      00A517 91 AC                    6 	.word dec_base 
      002499                       6594 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A519 A5 13                    1 	.word LINK 
                           00249B     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00A51B                          3 DDR:
      00A51B 43                       4 	.byte 3+F_IFUNC 	
      00A51C 44 44 52                 5 	.ascii "DDR"
      00A51F A0 30                    6 	.word const_ddr 
      0024A1                       6595 	_dict_entry,6,DATALN,data_line  
      00A521 A5 1B                    1 	.word LINK 
                           0024A3     2 	LINK=.
      00A523                          3 DATALN:
      00A523 06                       4 	.byte 6 	
      00A524 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      00A52A A0 5A                    6 	.word data_line 
      0024AC                       6596 	_dict_entry,4,DATA,data  
      00A52C A5 23                    1 	.word LINK 
                           0024AE     2 	LINK=.
      00A52E                          3 DATA:
      00A52E 04                       4 	.byte 4 	
      00A52F 44 41 54 41              5 	.ascii "DATA"
      00A533 A0 54                    6 	.word data 
      0024B5                       6597 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A535 A5 2E                    1 	.word LINK 
                           0024B7     2 	LINK=.
      00A537                          3 CRL:
      00A537 43                       4 	.byte 3+F_IFUNC 	
      00A538 43 52 4C                 5 	.ascii "CRL"
      00A53B A0 36                    6 	.word const_cr1 
      0024BD                       6598 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A53D A5 37                    1 	.word LINK 
                           0024BF     2 	LINK=.
      00A53F                          3 CRH:
      00A53F 43                       4 	.byte 3+F_IFUNC 	
      00A540 43 52 48                 5 	.ascii "CRH"
      00A543 A0 3C                    6 	.word const_cr2 
      0024C5                       6599 	_dict_entry,4+F_CFUNC,CHAR,char
      00A545 A5 3F                    1 	.word LINK 
                           0024C7     2 	LINK=.
      00A547                          3 CHAR:
      00A547 84                       4 	.byte 4+F_CFUNC 	
      00A548 43 48 41 52              5 	.ascii "CHAR"
      00A54C 9B F8                    6 	.word char 
      0024CE                       6600 	_dict_entry,3,BYE,bye 
      00A54E A5 47                    1 	.word LINK 
                           0024D0     2 	LINK=.
      00A550                          3 BYE:
      00A550 03                       4 	.byte 3 	
      00A551 42 59 45                 5 	.ascii "BYE"
      00A554 9C 8A                    6 	.word bye 
      0024D6                       6601 	_dict_entry,5,BTOGL,bit_toggle
      00A556 A5 50                    1 	.word LINK 
                           0024D8     2 	LINK=.
      00A558                          3 BTOGL:
      00A558 05                       4 	.byte 5 	
      00A559 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A55E 95 6E                    6 	.word bit_toggle 
      0024E0                       6602 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A560 A5 58                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                           0024E2     2 	LINK=.
      00A562                          3 BTEST:
      00A562 45                       4 	.byte 5+F_IFUNC 	
      00A563 42 54 45 53 54           5 	.ascii "BTEST"
      00A568 95 7E                    6 	.word bit_test 
      0024EA                       6603 	_dict_entry,4,BSET,bit_set 
      00A56A A5 62                    1 	.word LINK 
                           0024EC     2 	LINK=.
      00A56C                          3 BSET:
      00A56C 04                       4 	.byte 4 	
      00A56D 42 53 45 54              5 	.ascii "BSET"
      00A571 95 4D                    6 	.word bit_set 
      0024F3                       6604 	_dict_entry,4,BRES,bit_reset
      00A573 A5 6C                    1 	.word LINK 
                           0024F5     2 	LINK=.
      00A575                          3 BRES:
      00A575 04                       4 	.byte 4 	
      00A576 42 52 45 53              5 	.ascii "BRES"
      00A57A 95 5D                    6 	.word bit_reset 
      0024FC                       6605 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A57C A5 75                    1 	.word LINK 
                           0024FE     2 	LINK=.
      00A57E                          3 BIT:
      00A57E 43                       4 	.byte 3+F_IFUNC 	
      00A57F 42 49 54                 5 	.ascii "BIT"
      00A582 9F 82                    6 	.word bitmask 
      002504                       6606 	_dict_entry,3,AWU,awu 
      00A584 A5 7E                    1 	.word LINK 
                           002506     2 	LINK=.
      00A586                          3 AWU:
      00A586 03                       4 	.byte 3 	
      00A587 41 57 55                 5 	.ascii "AWU"
      00A58A 9D 08                    6 	.word awu 
      00250C                       6607 	_dict_entry,7,AUTORUN,autorun
      00A58C A5 86                    1 	.word LINK 
                           00250E     2 	LINK=.
      00A58E                          3 AUTORUN:
      00A58E 07                       4 	.byte 7 	
      00A58F 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A596 9C 93                    6 	.word autorun 
      002518                       6608 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A598 A5 8E                    1 	.word LINK 
                           00251A     2 	LINK=.
      00A59A                          3 ASC:
      00A59A 43                       4 	.byte 3+F_IFUNC 	
      00A59B 41 53 43                 5 	.ascii "ASC"
      00A59E 9C 0A                    6 	.word ascii 
      002520                       6609 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A5A0 A5 9A                    1 	.word LINK 
                           002522     2 	LINK=.
      00A5A2                          3 AND:
      00A5A2 43                       4 	.byte 3+F_IFUNC 	
      00A5A3 41 4E 44                 5 	.ascii "AND"
      00A5A6 9D 6B                    6 	.word bit_and 
      002528                       6610 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A5A8 A5 A2                    1 	.word LINK 
                           00252A     2 	LINK=.
      00A5AA                          3 ADCREAD:
      00A5AA 47                       4 	.byte 7+F_IFUNC 	
      00A5AB 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A5B2 98 14                    6 	.word analog_read 
      002534                       6611 	_dict_entry,5,ADCON,power_adc 
      00A5B4 A5 AA                    1 	.word LINK 
                           002536     2 	LINK=.
      00A5B6                          3 ADCON:
      00A5B6 05                       4 	.byte 5 	
      00A5B7 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A5BC 97 D8                    6 	.word power_adc 
      00A5BE                       6612 kword_dict:
      00253E                       6613 	_dict_entry,3+F_IFUNC,ABS,abs
      00A5BE A5 B6                    1 	.word LINK 
                           002540     2 	LINK=.
      00A5C0                          3 ABS:
      00A5C0 43                       4 	.byte 3+F_IFUNC 	
      00A5C1 41 42 53                 5 	.ascii "ABS"
      00A5C4 9D 57                    6 	.word abs 
                                   6614 	
                                   6615 
      00A600                       6616 	.bndry 128 ; align on FLASH block.
                                   6617 ; free space for user application  
      00A600                       6618 user_space:
                                   6619 ; USR() function test
      00A600 89               [ 2] 6620 	pushw x 
      00A601 72 1A 50 0A      [ 1] 6621 	bset PC_ODR,#5 
      00A605 85               [ 2] 6622 	popw x 
      00A606 CD 9C FF         [ 4] 6623 	call pause02 
      00A609 72 1B 50 0A      [ 1] 6624 	bres PC_ODR,#5 
      00A60D 81               [ 4] 6625 	ret
                                   6626 
                                   6627 	.area FLASH_DRIVE (ABS)
      010000                       6628 	.org 0x10000
      010000                       6629 fdrive:
                                   6630 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002540 R   |     ACK     =  000006 
  5 ADCON      002536 R   |   5 ADCREAD    00252A R   |     ADC_CR1 =  005401 
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
  5 AND        002522 R   |     ARG_OFS =  000002     |   5 ASC        00251A R
    ATTRIB  =  000002     |   5 AUTORUN    00250E R   |     AUTORUN_=  004000 
  5 AWU        002506 R   |   5 AWUHandl   000001 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        0024FE R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000B 
  5 BRES       0024F5 R   |     BS      =  000008     |     BSAVE   =  000002 
  5 BSET       0024EC R   |     BSIZE   =  000001     |   5 BTEST      0024E2 R
  5 BTOGL      0024D8 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        0024D0 R   |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       0024C7 R
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
    CMD_END =  000002     |     CNT     =  000006     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        0024BF R   |   5 CRL        0024B7 R
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       0024AE R
  5 DATALN     0024A3 R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        00249B R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        002493 R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        00248B R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         002484 R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
  5 DREAD      00247A R   |   5 DWRITE     00246F R   |   5 EEPROM     00245C R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002467 R   |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    FCOMP   =  000005     |   5 FCPU       002453 R   |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |   5 FILERX     002448 R
  5 FILETX     00243D R   |     FIRST   =  000001     |     FIRST_DA=  000006 
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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        002435 R
  5 FORGET     00242A R   |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002420 R
  5 GOTO       002417 R   |   5 GPIO       00240E R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        002406 R   |     HSECNT  =  004809 
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
  5 IDR        0023FE R   |   5 IF         0023F7 R   |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      0023ED R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_PU=  000001     |     INT_ADC2=  000016     |     INT_AUAR=  000012 
    INT_AWU =  000001     |     INT_CAN_=  000008     |     INT_CAN_=  000009 
    INT_CLK =  000002     |     INT_EXTI=  000003     |     INT_EXTI=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
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
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     0023E2 R
    INW     =  000009     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     0023D7 R   |   5 IWDGREF    0023CB R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0023C3 R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0023BB R   |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  002540 R   |   5 LIST       0023B2 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   5 LOAD       0023A9 R   |   5 LOG        0023A1 R
  5 LSHIFT     002396 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        002385 R   |   5 NEXT       00238D R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        00237D R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        002375 R   |     ONOFF   =  000003     |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         00236E R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      002364 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002351 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       002348 R   |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      00235A R   |   5 POKE       00233F R   |     PORT    =  000003 
  5 POUT       002336 R   |     PREV    =  000001     |   5 PRINT      00232C R
    PROD    =  000002     |   5 PRTA       002323 R   |   5 PRTB       00231A R
  5 PRTC       002311 R   |   5 PRTD       002308 R   |   5 PRTE       0022FF R
  5 PRTF       0022F6 R   |   5 PRTG       0022ED R   |   5 PRTH       0022E4 R
  5 PRTI       0022DB R   |   5 QKEY       0022D2 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 READ       0022C9 R
  5 REBOOT     0022BE R   |     REG     =  000001     |     RELOP   =  000005 
  5 REMARK     0022B3 R   |   5 RESTORE    0022A7 R   |     RETL1   =  000001 
  5 RETURN     00229C R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        002294 R   |     ROP     =  004800     |     RS      =  00001E 
  5 RSHIFT     002289 R   |     RST_SR  =  0050B3     |   5 RUN        002281 R
    RXCHAR  =  000001     |   5 SAVE       002278 R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       00226F R   |     SI      =  00000F     |     SIGN    =  000001 
  5 SIZE       002266 R   |     SKIP    =  000005     |   5 SLEEP      00225C R
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      002248 R   |   5 SPIRD      002252 R   |   5 SPISEL     00223D R
  5 SPIWR      002233 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       00222A R   |   5 STOP       002221 R
    STX     =  000002     |     SUB     =  00001A     |     SWIM_CSR=  007F80 
    SYN     =  000016     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      002217 R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
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
  5 TIMEOUT    002201 R   |   5 TIMER      00220D R   |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000002     |     TK_CFUNC=  000008 
    TK_CHAR =  000003     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000D     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000007     |     TK_INTGR=  000004 
    TK_LE   =  000036     |     TK_LPARE=  00000B     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  00000A     |     TK_RPARE=  00000C     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         0021FA R   |   5 TONE       0021F1 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     0021E6 R
  5 UBTN_Han   00007A R   |   5 UFLASH     0021DB R   |   5 UNTIL      0021D1 R
    US      =  00001F     |   5 USER_ABO   000082 R   |     USE_BLOC=  000000 
  5 USR        0021C9 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 Uart1RxH   00000F R   |   5 UserButt   00004D R
    VAR_ADDR=  000006     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       0021C0 R   |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH   =  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      0021B6 R   |   5 WRITE      0021AC R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XADR    =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  5 XOR        0021A4 R   |   5 XPEEK      00219A R   |     XSAVE   =  000005 
    YSAVE   =  000003     |   5 abs        001CD7 R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   000A3D R
  5 add        000D9F R   |   5 analog_r   001794 R   |   5 ansi_seq   0009FF R
  5 arduino_   001DC2 R   |   5 arg_list   000EDE R   |   1 array_si   000023 R
  5 ascii      001B8A R   |   5 at_tst     000C10 R   |   5 atoi24     000D1A R
  5 atoi_exi   000D88 R   |   5 autorun    001C13 R   |   5 autorun_   0005E4 R
  5 awu        001C88 R   |   5 awu02      001C92 R   |   5 bad_port   001BE2 R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       00171C R
  5 bin_exit   000B14 R   |   5 bit_and    001CEB R   |   5 bit_or     001D03 R
  5 bit_rese   0014DD R   |   5 bit_set    0014CD R   |   5 bit_test   0014FE R
  5 bit_togg   0014EE R   |   5 bit_xor    001D1B R   |   5 bitmask    001F02 R
  5 bkslsh_t   000BBB R   |   5 bksp       0001E1 R   |   5 break_po   001861 R
  5 bye        001C0A R   |   5 cancel_a   0005AC R   |   5 char       001B78 R
  5 check_fu   000376 R   |   5 clear_ba   0005F9 R   |   5 clear_va   000480 R
  5 clock_in   00009D R   |   5 cmd_end    001700 R   |   5 cmd_line   0007D6 R
  5 cmd_name   000E4A R   |   5 cmp_name   0018D5 R   |   5 cold_sta   0004EE R
  5 colon_ts   000BE4 R   |   5 comma_ts   000BEF R   |   5 compile    000385 R
  5 const_cr   001FB6 R   |   5 const_cr   001FBC R   |   5 const_dd   001FB0 R
  5 const_ee   001FCE R   |   5 const_id   001FAA R   |   5 const_in   001FC8 R
  5 const_od   001FA4 R   |   5 const_ou   001FC2 R   |   5 const_po   001F6E R
  5 const_po   001F74 R   |   5 const_po   001F7A R   |   5 const_po   001F80 R
  5 const_po   001F86 R   |   5 const_po   001F8C R   |   5 const_po   001F92 R
  5 const_po   001F98 R   |   5 const_po   001F9E R   |   5 convert_   000A9C R
  1 count      000003 R   |   5 cp_loop    000E8D R   |   5 create_g   0002D5 R
  5 cs_high    00215D R   |   5 cstk_pro   0010D1 R   |   5 dash_tst   000C05 R
  5 data       001FD4 R   |   1 data_len   000009 R   |   5 data_lin   001FDA R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   00201A R
  5 dec_base   00112C R   |   5 del_back   000A2E R   |   5 del_line   00029D R
  5 del_ln     000A1F R   |   5 delete     0001F1 R   |   5 digital_   0017C8 R
  5 digital_   0017F8 R   |   5 dir_loop   001AB7 R   |   5 director   001AAB R
  5 divide     000DF5 R   |   5 divu24_8   000952 R   |   5 do_loop    001F2B R
  5 dotr_loo   0010A1 R   |   5 drive_fr   001B34 R   |   5 enable_i   001EAC R
  5 eql_tst    000C70 R   |   5 equal      0013A7 R   |   5 err_bad_   0006DC R
  5 err_cmd_   00069D R   |   5 err_div0   00065F R   |   5 err_dupl   0006B8 R
  5 err_math   000645 R   |   5 err_mem_   000628 R   |   5 err_msg    00060A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 err_no_a   0006E9 R   |   5 err_no_d   00071D R   |   5 err_no_f   000748 R
  5 err_no_l   00066F R   |   5 err_no_p   000733 R   |   5 err_not_   0006CA R
  5 err_run_   000686 R   |   5 err_synt   000636 R   |   5 escaped    000AB1 R
  5 expect     000ED1 R   |   5 expr_exi   00102B R   |   5 expressi   000FEA R
  5 factor     000F41 R   |   1 farptr     000018 R   |   5 fcpu       001D65 R
  7 fdrive     010000 R   |   1 ffree      00001B R   |   5 file_cou   001B2C R
  5 file_rec   002162 R   |   5 file_tra   002197 R   |   5 final_te   0009F9 R
  5 first_li   0011AE R   |   1 flags      000025 R   |   5 for        001575 R
  5 forget     001A66 R   |   1 free_ram   00005C R   |   5 fsize_ms   002186 R
  5 func_arg   000F05 R   |   5 func_not   001E9F R   |   5 ge         0013A9 R
  5 get_arra   000F1C R   |   5 get_targ   00163F R   |   5 get_tick   001CD1 R
  5 get_toke   000B56 R   |   5 getc       0001CD R   |   5 gosub      001670 R
  5 goto       001655 R   |   5 gpio       001BBD R   |   5 gt         0013A5 R
  5 gt_tst     000C7B R   |   5 hex_base   001127 R   |   5 if         001561 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   00188A R   |   5 input_ex   00149F R   |   5 input_lo   001440 R
  5 input_va   00143E R   |   5 insert_l   00030E R   |   5 insert_l   000373 R
  5 interp     0007AA R   |   5 interp_l   0007EA R   |   5 invert     001F1C R
  5 is_alpha   00048E R   |   5 is_digit   00049F R   |   5 itoa       00090B R
  5 itoa_loo   000923 R   |   5 jp_to_ta   001663 R   |   5 key        001BAA R
  5 kword_di   00253E R   |   5 kword_en   002198 R   |   5 le         0013AE R
  5 leading_   001EF2 R   |   5 left_arr   0009FF R   |   5 let        00115D R
  5 let02      001167 R   |   5 lines_sk   0011B1 R   |   5 list       001181 R
  5 list_exi   0011FA R   |   5 list_sta   0011D4 R   |   5 load       001A31 R
  5 load_aut   0005BB R   |   5 load_fil   001A00 R   |   5 log2       001EE7 R
  5 logical_   001E95 R   |   5 loop_bac   001622 R   |   1 loop_dep   000022 R
  5 loop_don   001637 R   |   5 lshift     001D33 R   |   5 lt         0013AC R
  5 lt_tst     000CB4 R   |   5 modulo     000E39 R   |   5 move       000237 R
  5 move_dow   000255 R   |   5 move_exi   000276 R   |   5 move_loo   00025A R
  5 move_up    000247 R   |   5 mul_char   001396 R   |   5 multiply   000DAD R
  5 mulu24_8   00097A R   |   5 nbr_tst    000B91 R   |   5 ne         0013B1 R
  5 neg_acc2   0009B4 R   |   5 new        00187F R   |   5 next       0015F5 R
  5 next_tok   000818 R   |   5 no_match   000E9F R   |   5 none       000B56 R
  5 other      000CEC R   |   3 pad        001738 R   |   5 parse_bi   000AF4 R
  5 parse_in   000AB9 R   |   5 parse_ke   000B1C R   |   5 parse_qu   000A61 R
  5 pause      001C75 R   |   5 pause02    001C7F R   |   5 peek       001534 R
  5 pin_mode   001D71 R   |   5 plus_tst   000C44 R   |   5 poke       001525 R
  5 power_ad   001758 R   |   5 prcnt_ts   000C65 R   |   5 print      0013B4 R
  5 print_ex   001412 R   |   5 print_in   0008AD R   |   5 prt_basi   00124D R
  5 prt_cmd_   0011FD R   |   5 prt_loop   0013B8 R   |   5 prt_quot   001211 R
  5 prti24     000865 R   |   1 ptr16      000019 R   |   1 ptr8       00001A R
  5 putc       0001C4 R   |   5 puts       0001D7 R   |   5 qkey       001BB2 GR
  5 qmark_ts   000C1B R   |   5 random     001DE2 R   |   5 read       002052 R
  5 read01     002054 R   |   5 readln     0009D7 R   |   5 readln_l   0009DD R
  5 readln_q   000A52 R   |   5 refresh_   001EE2 R   |   5 rel_exit   001082 R
  5 relation   00102E R   |   5 relop_st   001399 R   |   5 rem        0014A2 R
  5 reprint    0009FF R   |   5 reset_co   0013B6 R   |   5 rest_con   00142E R
  5 restore    002007 R   |   5 return     001690 R   |   5 right_ar   0009FF R
  5 row_loop   00110A R   |   5 rparnt_t   000BD9 R   |   5 rshift     001D4C R
  5 run        0016AE R   |   5 run_it     0016D9 R   |   1 rx_char    000027 R
  5 save       001941 R   |   5 save_con   00141E R   |   5 search_d   000E7C R
  5 search_e   000ECD R   |   5 search_f   0018F6 R   |   5 search_l   000279 R
  5 search_l   000281 R   |   5 search_n   000E80 R   |   1 seedx      000014 R
  1 seedy      000016 R   |   5 seek_fdr   001898 R   |   5 select_p   001DB2 R
  5 set_time   001E83 R   |   5 sharp_ts   000BFA R   |   5 show       001085 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  5 show_row   0010F8 R   |   5 single_c   001392 R   |   5 size       001131 R
  5 skip       000D8C R   |   5 slash_ts   000C5A R   |   5 sleep      001C6A R
  5 software   0004A8 R   |   5 spaces     0001FF R   |   5 spi_clea   0020F6 R
  5 spi_disa   0020DE R   |   5 spi_enab   0020AC R   |   5 spi_rcv_   002118 R
  5 spi_read   002143 R   |   5 spi_sele   00214B R   |   5 spi_send   002102 R
  5 spi_writ   002123 R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000C4F R   |   5 step       0015CE R   |   5 stop       001833 R
  5 store_lo   0015E2 R   |   5 str_matc   000EAE R   |   5 str_tst    000B80 R
  5 strcmp     000218 R   |   5 strcpy     000229 R   |   5 strlen     00020B R
  5 substrac   000DA7 R   |   5 syntax_e   00075C R   |   1 tab_widt   000026 R
  5 tb_error   00075E R   |   5 term       000F9B R   |   5 term01     000FA4 R
  5 term_exi   000FE7 R   |   3 tib        0016E8 R   |   5 tick_tst   000C32 R
  1 ticks      000010 R   |   5 timeout    001E92 R   |   1 timer      000012 R
  5 timer2_i   0000B3 R   |   5 timer4_i   0000C0 R   |   1 tmp16      00000E R
  1 tmp8       00000F R   |   5 to         00159E R   |   5 to_upper   000D0E GR
  5 token_ch   000CFB R   |   5 token_ex   000D0B R   |   5 tone       00170F R
  5 try_next   002042 R   |   1 txtbgn     00001E R   |   1 txtend     000020 R
  5 uart1_in   000189 R   |   5 uart1_se   000199 R   |   5 ubound     00113B R
  5 uflash     001BE7 R   |   5 unlock_e   0000D5 R   |   5 unlock_f   0000E3 R
  5 until      001F40 R   |   5 user_int   000060 R   |   5 user_spa   002580 R
  5 usr        001BED R   |   1 vars       000028 R   |   5 wait       0014A8 R
  5 warm_ini   000595 R   |   5 warm_sta   0007A7 R   |   5 words      001E49 R
  5 write      001B41 R   |   5 write_bl   000166 R   |   5 write_by   0000F1 R
  5 write_ee   00012D R   |   5 write_ex   000161 R   |   5 write_fl   000117 R
  5 xpeek      001545 R   |     xreceive   ****** GX

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
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

