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
                                 
                                 
                                 
                                        
                                            .macro _led2_on 
                                        
                                            .macro _led2_off 
                                        
                                            .macro _led2_toggle 
                                             
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000003                         64 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         65 count:: .blkb 1 ; current BASIC line length and tib text length  
      000005                         66 basicptr::  .blkb 2  ; point to current BASIC line address.
      000007                         67 data_ptr:  .blkw 1  ; point to DATA address
      000009                         68 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         69 data_len:  .blkb 1  ; length of data line 
      00000B                         70 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         71 acc24:: .blkb 1 ; 24 bit accumulator upper-byte 
      00000D                         72 acc16:: .blkb 1 ; 16 bit accumulator, acc24 high-byte
      00000E                         73 acc8::  .blkb 1 ;  8 bit accumulator, acc24 low-byte  
      00000F                         74 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         75 timer:: .blkw 1 ;  milliseconds count down timer 
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
      000026                         88 rx1_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         89 rx1_head:  .blkb 1 ; rx1_queue head pointer
      00002F                         90 rx1_tail:   .blkb 1 ; rx1_queue tail pointer  
      000030                         91 rx3_queue: .ds RX_QUEUE_SIZE ; UART3 receive circular queue
      000038                         92 rx3_head:  .blkb 1 ; rx3_queue head pointer 
      000039                         93 rx3_tail:  .blkb 1 ; rx3_queue tail pointer  
                                     94 
      00003A                         95 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     96 ; keep 'free_ram' as last variable 
      00006E                         97 free_ram: ; from here RAM free for BASIC text 
                                     98 
                                     99 ;;-----------------------------------
                                    100     .area SSEG (ABS)
                                    101 ;; working buffers and stack at end of RAM. 	
                                    102 ;;-----------------------------------
      001690                        103     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                        104 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                        105 pad: .ds PAD_SIZE             ; working buffer
      001760                        106 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        107 stack_unf: ; stack underflow ; control_stack bottom 
                                    108 
                                    109 ;;--------------------------------------
                                    110     .area HOME 
                                    111 ;; interrupt vector table at 0x8000
                                    112 ;;--------------------------------------
      008000 82 00 86 F8            113     int cold_start			; RESET vector 
                           000000   114 .if DEBUG
                                    115 	int TrapHandler 		;TRAP  software interrupt
                           000001   116 .else
      008004 82 00 80 80            117 	int NonHandledInterrupt ;TRAP  software interrupt
                                    118 .endif
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008008 82 00 80 80            119 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            120 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            121 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            122 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            123 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            124 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            125 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 81 0D            126 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            127 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            128 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            129 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            130 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            131 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            132 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            133 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            134 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            135 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            136 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            137 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            138 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            139 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 D2            140 	int Uart3RxHandler      ;int21 UART3 RX full
      008060 82 00 80 80            141 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 F8            142 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            143 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            144 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            145 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            146 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            147 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            148 	int NonHandledInterrupt ;int29  not used
                                    149 
                                    150 ;---------------------------------------
                                    151     .area CODE
                                    152 ;---------------------------------------
                           000000   153 .if DEBUG
                                    154 .asciz "STM8_TBI" ; I like to put module name here.
                                    155 .endif 
                                    156 
                                    157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    158 ; non handled interrupt 
                                    159 ; reset MCU
                                    160 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        161 NonHandledInterrupt:
      008080 71                     162     .byte 0x71  ; invalid opcode reinitialize MCU
                                    163 
                                    164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    165 ; auto wakeup from halt
                                    166 ; at iret, program continue 
                                    167 ; after hatl instruction
                                    168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        169 AWUHandler:
      008081 72 19 50 F0      [ 1]  170 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  171 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  172 	clr AWU_TBR 
      00808E 80               [11]  173 	iret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    174 
                                    175 ;--------------------------
                                    176 ; UART1 receive character
                                    177 ; CTRL-C (ASCII 3)
                                    178 ; cancel program execution
                                    179 ; and fall back to command line
                                    180 ;--------------------------
      00808F                        181 Uart1RxHandler: ; console receive char 
      00000F                        182 	_led2_on 
      00808F 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      008093 72 0B 52 30 35   [ 2]  183 	btjf UART1_SR,#UART_SR_RXNE,5$
      008098 C6 52 31         [ 1]  184 	ld a,UART1_DR 
      00809B A1 03            [ 1]  185 	cp a,#CTRL_C 
      00809D 26 06            [ 1]  186 	jrne 2$
      00809F CD 83 AB         [ 4]  187 	call putc 
      0080A2 CC 81 20         [ 2]  188 	jp user_interrupted
      0080A5                        189 2$:
      0080A5 A1 18            [ 1]  190 	cp a,#CAN ; CTRL_X 
      0080A7 26 03            [ 1]  191 	jrne 3$
      0080A9 CC 86 F8         [ 2]  192 	jp cold_start 	
      0080AC                        193 3$: 
      0080AC A1 1A            [ 1]  194 	cp a,#CTRL_Z
      0080AE 26 06            [ 1]  195 	jrne 4$
      0080B0 CD 87 B9         [ 4]  196 	call cancel_autorun 
      0080B3 CC 86 F8         [ 2]  197 	jp cold_start
      0080B6 AE 00 26         [ 2]  198 4$:	ldw x,#rx1_queue  
      0080B9 88               [ 1]  199 	push a 
      0080BA 9F               [ 1]  200 	ld a,xl 
      0080BB CB 00 2F         [ 1]  201 	add a,rx1_tail 
      0080BE 97               [ 1]  202 	ld xl,a
      0080BF 84               [ 1]  203 	pop a  
      0080C0 F7               [ 1]  204 	ld (x),a
      0080C1 72 5C 00 2F      [ 1]  205 	inc rx1_tail 
      0080C5 A6 07            [ 1]  206 	ld a,#RX_QUEUE_SIZE-1
      0080C7 C4 00 2F         [ 1]  207 	and a,rx1_tail 
      0080CA C7 00 2F         [ 1]  208 	ld rx1_tail,a  
      00004D                        209 5$:	_led2_off 	
      0080CD 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080D1 80               [11]  210 	iret 
                                    211 
                                    212 ;-----------------------------
                                    213 ; ISR for character reception
                                    214 ; on UART3
                                    215 ; raw data communication
                                    216 ;-----------------------------
      0080D2                        217 Uart3RxHandler:
      000052                        218 	_led2_on 
      0080D2 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      0080D6 AE 00 30         [ 2]  219 	ldw x,#rx3_queue 
      0080D9 9F               [ 1]  220 	ld a,xl 
      0080DA CB 00 39         [ 1]  221 	add a,rx3_tail 
      0080DD 97               [ 1]  222 	ld xl,a 
      0080DE 72 0B 52 40 10   [ 2]  223 	btjf UART3_SR,#UART_SR_RXNE,9$
      0080E3 C6 52 41         [ 1]  224 	ld a,UART3_DR
      0080E6 F7               [ 1]  225 	ld (x),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080E7 72 5C 00 39      [ 1]  226 	inc rx3_tail 
      0080EB A6 07            [ 1]  227 	ld a,#RX_QUEUE_SIZE-1 
      0080ED C4 00 39         [ 1]  228 	and a,rx3_tail 
      0080F0 C7 00 39         [ 1]  229 	ld rx3_tail,a 
      000073                        230 9$:	_led2_off 
      0080F3 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080F7 80               [11]  231 	iret  
                                    232 
                                    233 
                                    234 ;------------------------------------
                                    235 ; software interrupt handler  
                                    236 ;------------------------------------
                           000000   237 .if DEBUG 
                                    238 TrapHandler:
                                    239 	bset flags,#FTRAP 
                                    240 	call print_registers
                                    241 	call cmd_itf
                                    242 	bres flags,#FTRAP 	
                                    243 	iret
                                    244 .endif 
                                    245 
                                    246 ;------------------------------
                                    247 ; TIMER 4 is used to maintain 
                                    248 ; a milliseconds 'ticks' counter
                                    249 ; and decrement 'timer' varaiable
                                    250 ;--------------------------------
      0080F8                        251 Timer4UpdateHandler:
      0080F8 72 5F 53 42      [ 1]  252 	clr TIM4_SR 
      0080FC CE 00 0F         [ 2]  253 	ldw x,ticks
      0080FF 5C               [ 1]  254 	incw x
      008100 CF 00 0F         [ 2]  255 	ldw ticks,x 
      008103 CE 00 11         [ 2]  256 	ldw x,timer
                                    257 ;	tnzw x 
      008106 27 04            [ 1]  258 	jreq 1$
      008108 5A               [ 2]  259 	decw x 
      008109 CF 00 11         [ 2]  260 	ldw timer,x 
      00810C                        261 1$:	
      00810C 80               [11]  262 	iret 
                                    263 
                                    264 
                                    265 ;------------------------------------
                                    266 ; Triggered by pressing USER UserButton 
                                    267 ; on NUCLEO card.
                                    268 ; This is used to abort a progam lock 
                                    269 ; in infinite loop. 
                                    270 ;------------------------------------
      00810D                        271 UserButtonHandler:
                                    272 ; wait button release
      00810D 5F               [ 1]  273 	clrw x
      00810E 5A               [ 2]  274 1$: decw x 
      00810F 26 FD            [ 1]  275 	jrne 1$
      008111 72 09 50 15 F8   [ 2]  276 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    277 ; if MCU suspended by SLEEP resume program
      008116 72 07 00 24 05   [ 2]  278     btjf flags,#FSLEEP,2$
      00811B 72 17 00 24      [ 1]  279 	bres flags,#FSLEEP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00811F 80               [11]  280 	iret
      008120                        281 2$:	
      008120                        282 user_interrupted:
      008120 72 00 00 24 02   [ 2]  283     btjt flags,#FRUN,4$
      008125 20 13            [ 2]  284 	jra UBTN_Handler_exit 
      008127                        285 4$:	; program interrupted by user 
      008127 72 11 00 24      [ 1]  286 	bres flags,#FRUN 
      00812B AE 81 42         [ 2]  287 	ldw x,#USER_ABORT
      00812E CD AA 40         [ 4]  288 	call puts 
      008131 CE 00 05         [ 2]  289 	ldw x,basicptr 
      008134 C6 00 02         [ 1]  290 	ld a,in 
      008137 CD 96 40         [ 4]  291 	call prt_basic_line
      00813A                        292 UBTN_Handler_exit:
      00813A AE 17 FF         [ 2]  293     ldw x,#STACK_EMPTY 
      00813D 94               [ 1]  294     ldw sp,x
      00813E 9A               [ 1]  295 	rim 
      00813F CC 8A 23         [ 2]  296 	jp warm_start
                                    297 
      008142 0A 50 72 6F 67 72 61   298 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    299 
                                    300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    301 ;    peripherals initialization
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 
                                    304 ;----------------------------------------
                                    305 ; inialize MCU clock 
                                    306 ; input:
                                    307 ;   A 		source  HSI | 1 HSE 
                                    308 ;   XL      CLK_CKDIVR , clock divisor 
                                    309 ; output:
                                    310 ;   none 
                                    311 ;----------------------------------------
      00815D                        312 clock_init:	
      00815D C1 50 C3         [ 1]  313 	cp a,CLK_CMSR 
      008160 27 0C            [ 1]  314 	jreq 2$ ; no switching required 
                                    315 ; select clock source 
      008162 72 12 50 C5      [ 1]  316 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008166 C7 50 C4         [ 1]  317 	ld CLK_SWR,a
      008169 C1 50 C3         [ 1]  318 1$:	cp a,CLK_CMSR
      00816C 26 FB            [ 1]  319 	jrne 1$
      00816E                        320 2$: 	
                                    321 ; HSI and cpu clock divisor 
      00816E 9F               [ 1]  322 	ld a,xl 
      00816F C7 50 C6         [ 1]  323 	ld CLK_CKDIVR,a  
      008172 81               [ 4]  324 	ret
                                    325 
                                    326 ;----------------------------------
                                    327 ; TIMER2 used as audio tone output 
                                    328 ; on port D:5.
                                    329 ; channel 1 configured as PWM mode 1 
                                    330 ;-----------------------------------  
                           00F424   331 TIM2_CLK_FREQ=62500
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008173                        332 timer2_init:
      008173 72 1A 50 C7      [ 1]  333 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008177 35 60 53 05      [ 1]  334  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00817B 35 08 53 0C      [ 1]  335 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00817F 81               [ 4]  336 	ret 
                                    337 
                                    338 ;---------------------------------
                                    339 ; TIM4 is configured to generate an 
                                    340 ; interrupt every millisecond 
                                    341 ;----------------------------------
      008180                        342 timer4_init:
      008180 72 18 50 C7      [ 1]  343 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008184 35 07 53 45      [ 1]  344 	mov TIM4_PSCR,#7 ; prescale 128  
      008188 35 7D 53 46      [ 1]  345 	mov TIM4_ARR,#125 ; set for 1msec.
      00818C 35 05 53 40      [ 1]  346 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008190 72 10 53 41      [ 1]  347 	bset TIM4_IER,#TIM4_IER_UIE
      008194 81               [ 4]  348 	ret
                                    349 
                                    350 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    351 ;  routines to write to FLASH, EEPROM 
                                    352 ;  and OPTION 
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    354 
                                    355 ;----------------------------------
                                    356 ; unlock EEPROM/OPT for writing/erasing
                                    357 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    358 ; input:
                                    359 ;  none
                                    360 ; output:
                                    361 ;  none 
                                    362 ;----------------------------------
      008195                        363 unlock_eeprom:
      008195 35 00 50 5B      [ 1]  364 	mov FLASH_CR2,#0 
      008199 35 FF 50 5C      [ 1]  365 	mov FLASH_NCR2,#0xFF 
      00819D 35 AE 50 64      [ 1]  366 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      0081A1 35 56 50 64      [ 1]  367     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      0081A5 72 07 50 5F FB   [ 2]  368 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      0081AA 81               [ 4]  369 	ret
                                    370 
                                    371 ;----------------------------------
                                    372 ; unlock FLASH for writing/erasing
                                    373 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    374 ; input:
                                    375 ;  none
                                    376 ; output:
                                    377 ;  none
                                    378 ;----------------------------------
      0081AB                        379 unlock_flash:
      0081AB 35 00 50 5B      [ 1]  380 	mov FLASH_CR2,#0 
      0081AF 35 FF 50 5C      [ 1]  381 	mov FLASH_NCR2,#0xFF 
      0081B3 35 56 50 62      [ 1]  382 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      0081B7 35 AE 50 62      [ 1]  383 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      0081BB 72 03 50 5F FB   [ 2]  384 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0081C0 81               [ 4]  385 	ret
                                    386 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    387 ;----------------------------
                                    388 ; erase block code must be 
                                    389 ; executed from RAM
                                    390 ; input:
                                    391 ;-----------------------------
      0081C1                        392 row_erase:
      0081C1 35 20 50 5B      [ 1]  393 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0081C5 35 DF 50 5C      [ 1]  394 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0081C9 4F               [ 1]  395 	clr a 
      0081CA 90 5F            [ 1]  396 	clrw y 
      0081CC 91 A7 00 17      [ 1]  397 	ldf ([farptr],y),a
      0081D0 90 5C            [ 1]  398     incw y
      0081D2 91 A7 00 17      [ 1]  399 	ldf ([farptr],y),a
      0081D6 90 5C            [ 1]  400     incw y
      0081D8 91 A7 00 17      [ 1]  401 	ldf ([farptr],y),a
      0081DC 90 5C            [ 1]  402     incw y
      0081DE 91 A7 00 17      [ 1]  403 	ldf ([farptr],y),a
      0081E2 72 05 50 5F FB   [ 2]  404 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E7 81               [ 4]  405 	ret
      0081E8                        406 row_erase_end:
                                    407 
                                    408 ; copy erase_start in RAM 
      0081E8                        409 move_erase_to_ram:
      0081E8 AE 81 E8         [ 2]  410 	ldw x,#row_erase_end 
      0081EB 1D 81 C1         [ 2]  411 	subw x,#row_erase
      0081EE CF 00 0D         [ 2]  412 	ldw acc16,x 
      0081F1 AE 16 90         [ 2]  413 	ldw x,#tib 
      0081F4 90 AE 81 C1      [ 2]  414 	ldw y,#row_erase 
      0081F8 CD 84 DE         [ 4]  415 	call move 
      0081FB 81               [ 4]  416 	ret 
                                    417 
                                    418 ;-----------------------------------
                                    419 ; block programming must be 
                                    420 ; executed from RAM 
                                    421 ; initial contidions: 
                                    422 ; 	memory unlocked
                                    423 ;   bit PRG set in 
                                    424 ; input:
                                    425 ;   x        128 bytes row to program 
                                    426 ;   farptr   row address 
                                    427 ; output:
                                    428 ;   none 
                                    429 ;----------------------------------
                           000001   430 	BCNT=1 
      0081FC                        431 program_row:
      0081FC 4B 80            [ 1]  432 	push #BLOCK_SIZE  
                                    433 ;enable block programming 
      0081FE 72 10 50 5B      [ 1]  434 	bset FLASH_CR2,#FLASH_CR2_PRG 
      008202 72 11 50 5C      [ 1]  435 	bres FLASH_NCR2,#FLASH_CR2_PRG
      008206 90 5F            [ 1]  436 	clrw y 
      008208 F6               [ 1]  437 1$:	ld a,(x)
      008209 91 A7 00 17      [ 1]  438 	ldf ([farptr],y),a
      00820D 5C               [ 1]  439 	incw x 
      00820E 90 5C            [ 1]  440 	incw y 
      008210 0A 01            [ 1]  441 	dec (BCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008212 26 F4            [ 1]  442 	jrne 1$
                                    443 ; wait EOP bit 
      008214 72 05 50 5F FB   [ 2]  444 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      000199                        445 	_drop 1 
      008219 5B 01            [ 2]    1     addw sp,#1 
      00821B 81               [ 4]  446 	ret 
      00821C                        447 program_row_end:
                                    448 
                                    449 ;-------------------------
                                    450 ; move program_row to RAM 
                                    451 ; at txtubound address 
                                    452 ;------------------------
      00821C                        453 move_prg_to_ram:
      00821C AE 82 1C         [ 2]  454 	ldw x,#program_row_end 
      00821F 1D 81 FC         [ 2]  455 	subw x,#program_row 
      008222 CF 00 0D         [ 2]  456 	ldw acc16,x 
      008225 AE 16 90         [ 2]  457 	ldw x,#tib 
      008228 90 AE 81 FC      [ 2]  458 	ldw y,#program_row 
      00822C CD 84 DE         [ 4]  459 	call move 
      00822F 81               [ 4]  460 	ret 
                                    461 
                                    462 
                                    463 ;-----------------------------
                                    464 ; write a row in FLASH/EEPROM 
                                    465 ; input:
                                    466 ;    farptr   destination address 
                                    467 ;    x        source address 
                                    468 ;-----------------------------
      008230                        469 write_row:
      008230 89               [ 2]  470 	pushw x 
      008231 72 5D 00 17      [ 1]  471 	tnz farptr 
      008235 26 1C            [ 1]  472 	jrne to_flash 
      008237 AE 80 00         [ 2]  473 	ldw x,#FLASH_BASE 
      00823A C3 00 18         [ 2]  474 	cpw x,farptr+1 
      00823D 24 14            [ 1]  475 	jruge to_flash 
      00823F                        476 to_eeprom:
      00823F AE 40 00         [ 2]  477 	ldw x,#EEPROM_BASE 
      008242 C3 00 18         [ 2]  478 	cpw x,farptr+1 
      008245 24 01            [ 1]  479 	jruge 1$
      008247 81               [ 4]  480 	ret ; bad address 
      008248 AE 47 FF         [ 2]  481 1$: ldw x,#EEPROM_END 
      00824B 23 01            [ 2]  482 	jrule 2$ 
      00824D 81               [ 4]  483 	ret ; bad address 
      00824E CD 81 95         [ 4]  484 2$:	call unlock_eeprom
      008251 20 03            [ 2]  485 	jra do_programming
      008253                        486 to_flash:
      008253 CD 81 AB         [ 4]  487 	call unlock_flash 
      008256                        488 do_programming:
      008256 85               [ 2]  489 	popw x 
      008257 CD 16 90         [ 4]  490 	call tib
      00825A 72 13 50 5F      [ 1]  491 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      00825E 72 17 50 5F      [ 1]  492 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008262 81               [ 4]  493 	ret 
                                    494 
                                    495 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    496 ;-----------------------------------
                                    497 ; erase flash or EEPROM block
                                    498 ; a blow is 128 bytes 
                                    499 ; input:
                                    500 ;   farptr  address row begin
                                    501 ; output:
                                    502 ;   none
                                    503 ;--------------------------------------
      008263                        504 block_erase:
      008263 CE 00 18         [ 2]  505 	ldw x,farptr+1
      008266 A3 AA 00         [ 2]  506 	cpw x,#user_space 
      008269 2A 17            [ 1]  507 	jrpl erase_flash 
                                    508 ; erase eeprom block
      00826B A3 40 00         [ 2]  509 	cpw x,#EEPROM_BASE 
      00826E 24 01            [ 1]  510 	jruge 1$
      008270 81               [ 4]  511 	ret ; bad address 
      008271 AE 47 FF         [ 2]  512 1$: ldw x,#EEPROM_END 
      008274 23 01            [ 2]  513 	jrule 2$ 
      008276 81               [ 4]  514 	ret ; bad address 
      008277 CD 81 95         [ 4]  515 2$:	call unlock_eeprom 
      00827A CD 16 90         [ 4]  516 	call tib 
      00827D 72 17 50 5F      [ 1]  517 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008281 81               [ 4]  518 	ret 
                                    519 ; erase flash block:
      008282                        520 erase_flash:
      008282 CD 81 AB         [ 4]  521 	call unlock_flash 
      008285 CD 16 90         [ 4]  522 	call tib 
      008288 72 13 50 5F      [ 1]  523     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00828C 81               [ 4]  524 	ret 
                                    525 
                                    526 
                                    527 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    528 ; write a byte to FLASH or EEPROM/OPTION  
                                    529 ; input:
                                    530 ;    a  		byte to write
                                    531 ;    farptr  	address
                                    532 ;    x          farptr[x]
                                    533 ; output:
                                    534 ;    none
                                    535 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    536 	; variables locales
                           000001   537 	BTW = 1   ; byte to write offset on stack
                           000002   538 	OPT = 2   ; OPTION flag offset on stack
                           000002   539 	VSIZE = 2
      00828D                        540 write_byte:
      00828D 90 89            [ 2]  541 	pushw y
      00020F                        542 	_vars VSIZE
      00828F 52 02            [ 2]    1     sub sp,#VSIZE 
      008291 6B 01            [ 1]  543 	ld (BTW,sp),a ; byte to write 
      008293 0F 02            [ 1]  544 	clr (OPT,sp)  ; OPTION flag
                                    545 ; put addr[15:0] in Y, for bounds check.
      008295 90 CE 00 18      [ 2]  546 	ldw y,farptr+1   ; Y=addr15:0
                                    547 ; check addr[23:16], if <> 0 then it is extened flash memory
      008299 72 5D 00 17      [ 1]  548 	tnz farptr 
      00829D 26 14            [ 1]  549 	jrne write_flash
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00829F 90 A3 AA 00      [ 2]  550     cpw y,#user_space
      0082A3 24 0E            [ 1]  551     jruge write_flash
      0082A5 90 A3 40 00      [ 2]  552 	cpw y,#EEPROM_BASE  
      0082A9 25 52            [ 1]  553     jrult write_exit
      0082AB 90 A3 48 7F      [ 2]  554 	cpw y,#OPTION_END 
      0082AF 22 4C            [ 1]  555 	jrugt write_exit
      0082B1 20 16            [ 2]  556 	jra write_eeprom 
                                    557 ; write program memory
      0082B3                        558 write_flash:
      0082B3 CD 81 AB         [ 4]  559 	call unlock_flash 
      0082B6 9B               [ 1]  560 1$:	sim 
      0082B7 7B 01            [ 1]  561 	ld a,(BTW,sp)
      0082B9 92 A7 00 17      [ 4]  562 	ldf ([farptr],x),a ; farptr[x]=A
      0082BD 72 05 50 5F FB   [ 2]  563 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082C2 9A               [ 1]  564     rim 
      0082C3 72 13 50 5F      [ 1]  565     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0082C7 20 34            [ 2]  566     jra write_exit
                                    567 ; write eeprom and option
      0082C9                        568 write_eeprom:
      0082C9 CD 81 95         [ 4]  569 	call unlock_eeprom
                                    570 	; check for data eeprom or option eeprom
      0082CC 90 A3 48 00      [ 2]  571 	cpw y,#OPTION_BASE
      0082D0 2B 08            [ 1]  572 	jrmi 1$
      0082D2 90 A3 48 80      [ 2]  573 	cpw y,#OPTION_END+1
      0082D6 2A 02            [ 1]  574 	jrpl 1$
      0082D8 03 02            [ 1]  575 	cpl (OPT,sp)
      0082DA                        576 1$: 
      0082DA 0D 02            [ 1]  577     tnz (OPT,sp)
      0082DC 27 08            [ 1]  578     jreq 2$
                                    579 	; pour modifier une option il faut modifier ces 2 bits
      0082DE 72 1E 50 5B      [ 1]  580     bset FLASH_CR2,#FLASH_CR2_OPT
      0082E2 72 1F 50 5C      [ 1]  581     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082E6                        582 2$: 
      0082E6 7B 01            [ 1]  583     ld a,(BTW,sp)
      0082E8 92 A7 00 17      [ 4]  584     ldf ([farptr],x),a
      0082EC 0D 02            [ 1]  585     tnz (OPT,sp)
      0082EE 27 08            [ 1]  586     jreq 3$
      0082F0 5C               [ 1]  587     incw x
      0082F1 7B 01            [ 1]  588     ld a,(BTW,sp)
      0082F3 43               [ 1]  589     cpl a
      0082F4 92 A7 00 17      [ 4]  590     ldf ([farptr],x),a
      0082F8 72 05 50 5F FB   [ 2]  591 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082FD                        592 write_exit:
      00027D                        593 	_drop VSIZE 
      0082FD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082FF 90 85            [ 2]  594 	popw y
      008301 81               [ 4]  595     ret
                                    596 
                                    597 ;--------------------------------------------
                                    598 ; write a data block to eeprom or flash 
                                    599 ; input:
                                    600 ;   Y        source address   
                                    601 ;   X        array index  destination  farptr[x]
                                    602 ;   BSIZE    block size bytes 
                                    603 ;   farptr   write address , byte* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    604 ; output:
                                    605 ;	X 		after last byte written 
                                    606 ;   Y 		after last byte read 
                                    607 ;  farptr   point after block
                                    608 ;---------------------------------------------
      008302                        609 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000282                        610 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    611 	; local var 
                           000001   612 	XSAVE=1 
                           000002   613 	VSIZE=2 
      000282                        614 write_block:
      000282                        615 	_vars VSIZE
      008302 52 02            [ 2]    1     sub sp,#VSIZE 
      008304 1F 01            [ 2]  616 	ldw (XSAVE,sp),x 
      008306 1E 05            [ 2]  617 	ldw x,(BSIZE,sp) 
      008308 27 13            [ 1]  618 	jreq 9$
      00830A 1E 01            [ 2]  619 1$:	ldw x,(XSAVE,sp)
      00830C 90 F6            [ 1]  620 	ld a,(y)
      00830E CD 82 8D         [ 4]  621 	call write_byte 
      008311 5C               [ 1]  622 	incw x 
      008312 90 5C            [ 1]  623 	incw y 
      008314 1F 01            [ 2]  624 	ldw (XSAVE,sp),x
      008316 1E 05            [ 2]  625 	ldw x,(BSIZE,sp)
      008318 5A               [ 2]  626 	decw x
      008319 1F 05            [ 2]  627 	ldw (BSIZE,sp),x 
      00831B 26 ED            [ 1]  628 	jrne 1$
      00831D                        629 9$:
      00831D 1E 01            [ 2]  630 	ldw x,(XSAVE,sp)
      00831F CD 9B 46         [ 4]  631 	call incr_farptr
      0002A2                        632 	_drop VSIZE
      008322 5B 02            [ 2]    1     addw sp,#VSIZE 
      008324 81               [ 4]  633 	ret 
                                    634 
                                    635 
                                    636 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    637 ;;   UART1 subroutines
                                    638 ;;   used for user interface 
                                    639 ;;   communication channel.
                                    640 ;;   settings: 
                                    641 ;;		115200 8N1 no flow control
                                    642 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    643 
                                    644 ;--------------------------------
                                    645 ; initialize UART3, 115200 8N1 
                                    646 ;--------------------------------
      008325                        647 uart3_init: 
      008325 72 1A 50 11      [ 1]  648 	bset PD_DDR,#UART3_TX_PIN
      008329 72 1A 50 12      [ 1]  649 	bset PD_CR1,#UART3_TX_PIN 
      00832D 72 1A 50 13      [ 1]  650 	bset PD_CR2,#UART3_TX_PIN 
      008331 72 16 50 C7      [ 1]  651 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3
      008335                        652 uart3_set_baud: 
                                    653 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    654 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008335 A6 E1            [ 1]  655 	ld a,#CLK_SWR_HSI
      008337 C1 50 C3         [ 1]  656 	cp a,CLK_CMSR 
      00833A 27 0A            [ 1]  657 	jreq 2$ 
      00833C                        658 1$: ; 8 Mhz 	
      00833C 35 05 52 43      [ 1]  659 	mov UART3_BRR2,#0x05 ; must be loaded first
      008340 35 04 52 42      [ 1]  660 	mov UART3_BRR1,#0x4
      008344 20 08            [ 2]  661 	jra 3$
      008346                        662 2$: ; 16 Mhz 	
      008346 35 0B 52 43      [ 1]  663 	mov UART3_BRR2,#0x0b ; must be loaded first
      00834A 35 08 52 42      [ 1]  664 	mov UART3_BRR1,#0x08
      00834E                        665 3$:
      00834E 72 5F 52 41      [ 1]  666     clr UART3_DR
      008352 35 2C 52 45      [ 1]  667 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008356 72 10 52 45      [ 1]  668 	bset UART3_CR2,#UART_CR2_SBK
      00835A 72 0D 52 40 FB   [ 2]  669     btjf UART3_SR,#UART_SR_TC,.
      00835F 72 5F 00 39      [ 1]  670 	clr rx3_tail 
      008363 72 5F 00 38      [ 1]  671 	clr rx3_head 
      008367 81               [ 4]  672 	ret 
                                    673 
                                    674 ;---------------------------------------------
                                    675 ; initialize UART1, 115200 8N1
                                    676 ; input:
                                    677 ;	none
                                    678 ; output:
                                    679 ;   none
                                    680 ;---------------------------------------------
      008368                        681 uart1_init:
      008368 72 1A 50 02      [ 1]  682     bset PA_DDR,#UART1_TX_PIN
      00836C 72 1A 50 03      [ 1]  683     bset PA_CR1,#UART1_TX_PIN 
      008370 72 1A 50 04      [ 1]  684     bset PA_CR2,#UART1_TX_PIN 
                                    685 ; enable UART1 clock
      008374 72 14 50 C7      [ 1]  686 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008378                        687 uart1_set_baud: 
                                    688 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    689 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008378 A6 E1            [ 1]  690 	ld a,#CLK_SWR_HSI
      00837A C1 50 C3         [ 1]  691 	cp a,CLK_CMSR 
      00837D 27 0A            [ 1]  692 	jreq 2$ 
      00837F                        693 1$: ; 8 Mhz 	
      00837F 35 05 52 33      [ 1]  694 	mov UART1_BRR2,#0x05 ; must be loaded first
      008383 35 04 52 32      [ 1]  695 	mov UART1_BRR1,#0x4
      008387 20 08            [ 2]  696 	jra 3$
      008389                        697 2$: ; 16 Mhz 	
      008389 35 0B 52 33      [ 1]  698 	mov UART1_BRR2,#0x0b ; must be loaded first
      00838D 35 08 52 32      [ 1]  699 	mov UART1_BRR1,#0x08
      008391                        700 3$:
      008391 72 5F 52 31      [ 1]  701     clr UART1_DR
      008395 35 2C 52 35      [ 1]  702 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008399 72 10 52 35      [ 1]  703 	bset UART1_CR2,#UART_CR2_SBK
      00839D 72 0D 52 30 FB   [ 2]  704     btjf UART1_SR,#UART_SR_TC,.
      0083A2 72 5F 00 2E      [ 1]  705     clr rx1_head 
      0083A6 72 5F 00 2F      [ 1]  706 	clr rx1_tail 
      0083AA 81               [ 4]  707 	ret
                                    708 
                                    709 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    710 ; uart1_putc
                                    711 ; send a character via UART1
                                    712 ; input:
                                    713 ;    A  	character to send
                                    714 ;---------------------------------
      0083AB                        715 putc:: ; console output always on UART1
      0083AB                        716 uart1_putc:: 
      0083AB 72 0F 52 30 FB   [ 2]  717 	btjf UART1_SR,#UART_SR_TXE,.
      0083B0 C7 52 31         [ 1]  718 	ld UART1_DR,a 
      0083B3 81               [ 4]  719 	ret 
                                    720 
                                    721 ;---------------------------------
                                    722 ; uart3_putc 
                                    723 ; send a character via UART3 
                                    724 ; input:
                                    725 ;    A  	character to send
                                    726 ;---------------------------------
      0083B4                        727 uart3_putc::
      0083B4 72 0F 52 40 FB   [ 2]  728 	btjf UART3_SR,#UART_SR_TXE,.
      0083B9 C7 52 41         [ 1]  729 	ld UART3_DR,a 
      0083BC 81               [ 4]  730 	ret 
                                    731 
                                    732 ;---------------------------------
                                    733 ; Query for character in rx1_queue
                                    734 ; input:
                                    735 ;   none 
                                    736 ; output:
                                    737 ;   A     0 no charcter available
                                    738 ;   Z     1 no character available
                                    739 ;---------------------------------
      0083BD                        740 qgetc::
      0083BD                        741 uart1_qgetc::
      0083BD C6 00 2E         [ 1]  742 	ld a,rx1_head 
      0083C0 C0 00 2F         [ 1]  743 	sub a,rx1_tail 
      0083C3 81               [ 4]  744 	ret 
                                    745 
      0083C4                        746 uart3_qgetc::
      0083C4 C6 00 38         [ 1]  747 	ld a,rx3_head 
      0083C7 C0 00 39         [ 1]  748 	sub a,rx3_tail 
      0083CA 81               [ 4]  749 	ret 
                                    750 
                                    751 ;---------------------------------
                                    752 ; wait character from UART1 
                                    753 ; input:
                                    754 ;   none
                                    755 ; output:
                                    756 ;   A 			char  
                                    757 ;--------------------------------	
      0083CB                        758 getc:: ;console input
      0083CB                        759 uart1_getc::
      0083CB CD 83 BD         [ 4]  760 	call uart1_qgetc
      0083CE 27 FB            [ 1]  761 	jreq uart1_getc 
      0083D0 89               [ 2]  762 	pushw x 
      0083D1 AE 00 26         [ 2]  763 	ldw x,#rx1_queue
      0083D4 9F               [ 1]  764 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083D5 CB 00 2E         [ 1]  765 	add a,rx1_head 
      0083D8 97               [ 1]  766 	ld xl,a 
      0083D9 F6               [ 1]  767 	ld a,(x)
      0083DA 85               [ 2]  768 	popw x
      0083DB 88               [ 1]  769 	push a
      0083DC 72 5C 00 2E      [ 1]  770 	inc rx1_head 
      0083E0 A6 07            [ 1]  771 	ld a,#RX_QUEUE_SIZE-1 
      0083E2 C4 00 2E         [ 1]  772 	and a,rx1_head 
      0083E5 C7 00 2E         [ 1]  773 	ld rx1_head,a 
      0083E8 84               [ 1]  774 	pop a  
      0083E9 81               [ 4]  775 	ret 
                                    776 
                                    777 ;----------------------------------
                                    778 ; wait character from UART3 
                                    779 ; output:
                                    780 ;   A       character received
                                    781 ;-----------------------------------
      0083EA                        782 uart3_getc::
      0083EA CD 83 C4         [ 4]  783 	call uart3_qgetc
      0083ED 27 FB            [ 1]  784 	jreq uart3_getc 
      0083EF 89               [ 2]  785 	pushw x 
      0083F0 AE 00 30         [ 2]  786 	ldw x,#rx3_queue
      0083F3 9F               [ 1]  787 	ld a,xl 
      0083F4 CB 00 38         [ 1]  788 	add a,rx3_head 
      0083F7 97               [ 1]  789 	ld xl,a 
      0083F8 F6               [ 1]  790 	ld a,(x)
      0083F9 85               [ 2]  791 	popw x
      0083FA 88               [ 1]  792 	push a
      0083FB 72 5C 00 38      [ 1]  793 	inc rx3_head 
      0083FF A6 07            [ 1]  794 	ld a,#RX_QUEUE_SIZE-1 
      008401 C4 00 38         [ 1]  795 	and a,rx3_head 
      008404 C7 00 38         [ 1]  796 	ld rx3_head,a 
      008407 84               [ 1]  797 	pop a  
      008408 81               [ 4]  798 	ret 
                                    799 
                                    800 
                                    801 ;----------------------
                                    802 ; print token id && value
                                    803 ; input:
                                    804 ;   A     token id 
                                    805 ;   X     token value 
                                    806 ;---------------------
                           000001   807 	BSAVE=1
                           000002   808 	AREG=2
                           000003   809 	XREG=3
                           000004   810 	VSIZE=4
      008409                        811 prt_tok:
      000389                        812 	_vars VSIZE 
      008409 52 04            [ 2]    1     sub sp,#VSIZE 
      00840B 6B 02            [ 1]  813 	ld (AREG,sp),a 
      00840D 1F 03            [ 2]  814 	ldw (XREG,sp),x 
      00840F C6 00 0B         [ 1]  815 	ld a, base
      008412 6B 01            [ 1]  816 	ld (BSAVE,sp),a 
      008414 35 10 00 0B      [ 1]  817 	mov base,#16  
      008418 AE 84 40         [ 2]  818 	ldw x,#token_msg
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00841B CD AA 40         [ 4]  819 	call puts 
      00841E 5F               [ 1]  820 	clrw x 
      00841F 7B 02            [ 1]  821 	ld a,(AREG,sp)
      008421 97               [ 1]  822 	ld xl,a 
      008422 CD 8A EF         [ 4]  823 	call print_int 
      008425 A6 20            [ 1]  824 	ld a,#SPACE
      008427 CD 83 AB         [ 4]  825 	call putc 
      00842A 1E 03            [ 2]  826 	ldw x,(XREG,sp)
      00842C CD 8A EF         [ 4]  827 	call print_int 
      00842F A6 0D            [ 1]  828 	ld a,#CR 
      008431 CD 83 AB         [ 4]  829 	call putc 
      008434 7B 01            [ 1]  830 	ld a,(BSAVE,sp)
      008436 C7 00 0B         [ 1]  831 	ld base,a 
      008439 7B 02            [ 1]  832 	ld a,(AREG,sp)
      00843B 1E 03            [ 2]  833 	ldw x,(XREG,sp)
      0003BD                        834 	_drop VSIZE 
      00843D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00843F 81               [ 4]  835 	ret 
      008440 74 6F 6B 65 6E 3A 20   836 token_msg: .asciz "token: "
             00
                                    837 
                                    838 
                                    839 ;---------------------
                                    840 ; display n bytes row 
                                    841 ; from memory.
                                    842 ; input:
                                    843 ;   A   bytes to print 
                                    844 ;	X   start address 
                                    845 ; output:
                                    846 ;   X   address after last shown  
                                    847 ;---------------------
                           000001   848 	CNT=1 
                           000002   849 	ADR=2 
                           000003   850 	VSIZE=3 
      008448                        851 show_row:
      008448 4D               [ 1]  852 	tnz a 
      008449 26 01            [ 1]  853 	jrne 1$
      00844B 81               [ 4]  854 	ret 
      00844C                        855 1$:	
      00844C 89               [ 2]  856 	pushw x  
      00844D 88               [ 1]  857 	push a 
      00844E 35 04 00 25      [ 1]  858 	mov tab_width,#4 
      008452 CD 8A EF         [ 4]  859 	call print_int 
      008455 A6 20            [ 1]  860 	ld a,#SPACE  
      008457 CD 83 AB         [ 4]  861 	call putc
      00845A                        862 row_loop:
      00845A 1E 02            [ 2]  863 	ldw x,(ADR,sp)
      00845C F6               [ 1]  864 	ld a,(x)
      00845D 5F               [ 1]  865 	clrw x 
      00845E 97               [ 1]  866 	ld xl,a 
      00845F CD 8A EF         [ 4]  867 	call print_int 
      008462 1E 02            [ 2]  868 	ldw x,(ADR,sp)
      008464 5C               [ 1]  869 	incw x 
      008465 1F 02            [ 2]  870 	ldw (ADR,sp),x 
      008467 0A 01            [ 1]  871 	dec (CNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008469 26 EF            [ 1]  872 	jrne row_loop
      0003EB                        873 	_drop VSIZE  		
      00846B 5B 03            [ 2]    1     addw sp,#VSIZE 
      00846D 35 04 00 25      [ 1]  874 	mov tab_width,#4
      008471 A6 0D            [ 1]  875 	ld a,#CR 
      008473 CD 83 AB         [ 4]  876 	call putc 
      008476 81               [ 4]  877 	ret 
                                    878 
                                    879 ;--------------------------
                                    880 ; print memory content 
                                    881 ; in hexadecimal format
                                    882 ;  input:
                                    883 ;    X    start address 
                                    884 ;    Y    count 
                                    885 ;--------------------------
                           000001   886 	BCNT=1
                           000003   887 	BASE=3
                           000004   888 	TABW=4
                           000004   889 	VSIZE=4   
      008477                        890 hex_dump:
      0003F7                        891 	_vars VSIZE
      008477 52 04            [ 2]    1     sub sp,#VSIZE 
      008479 C6 00 0B         [ 1]  892 	ld a,base
      00847C 6B 03            [ 1]  893 	ld (BASE,sp),a 
      00847E 35 10 00 0B      [ 1]  894 	mov base,#16
      008482 C6 00 25         [ 1]  895 	ld a,tab_width 
      008485 6B 04            [ 1]  896 	ld (TABW,sp),a
      008487 A6 0D            [ 1]  897 	ld a,#CR 
      008489 CD 83 AB         [ 4]  898 	call putc 
      00848C 17 01            [ 2]  899 1$: ldw (BCNT,sp),y
      00848E A6 10            [ 1]  900 	ld a,#16
      008490 90 A3 00 10      [ 2]  901 	cpw y,#16
      008494 2A 02            [ 1]  902 	jrpl 2$
      008496 90 9F            [ 1]  903 	ld a,yl
      008498                        904 2$: 	
      008498 CD 84 48         [ 4]  905 	call show_row 
      00849B 16 01            [ 2]  906 	ldw y,(BCNT,sp) 
      00849D 72 A2 00 10      [ 2]  907 	subw y,#16 
      0084A1 90 A3 00 01      [ 2]  908 	cpw y,#1
      0084A5 2A E5            [ 1]  909 	jrpl 1$
      0084A7 7B 03            [ 1]  910 	ld a,(BASE,sp)
      0084A9 C7 00 0B         [ 1]  911 	ld base,a
      0084AC 7B 04            [ 1]  912 	ld a,(TABW,sp)
      0084AE C7 00 25         [ 1]  913 	ld tab_width,a 
      000431                        914 	_drop VSIZE
      0084B1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084B3 81               [ 4]  915 	ret 
                                    916 
                                    917 ;-------------------------------------
                                    918 ; retrun string length
                                    919 ; input:
                                    920 ;   X         .asciz  pointer 
                                    921 ; output:
                                    922 ;   X         not affected 
                                    923 ;   A         length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    924 ;-------------------------------------
      0084B4                        925 strlen::
      0084B4 89               [ 2]  926 	pushw x 
      0084B5 4F               [ 1]  927 	clr a
      0084B6 7D               [ 1]  928 1$:	tnz (x) 
      0084B7 27 04            [ 1]  929 	jreq 9$ 
      0084B9 4C               [ 1]  930 	inc a 
      0084BA 5C               [ 1]  931 	incw x 
      0084BB 20 F9            [ 2]  932 	jra 1$ 
      0084BD 85               [ 2]  933 9$:	popw x 
      0084BE 81               [ 4]  934 	ret 
                                    935 
                                    936 ;------------------------------------
                                    937 ; compare 2 strings
                                    938 ; input:
                                    939 ;   X 		char* first string 
                                    940 ;   Y       char* second string 
                                    941 ; output:
                                    942 ;   A 		0|1 
                                    943 ;-------------------------------------
      0084BF                        944 strcmp:
      0084BF F6               [ 1]  945 	ld a,(x)
      0084C0 27 0B            [ 1]  946 	jreq 5$ 
      0084C2 90 F1            [ 1]  947 	cp a,(y) 
      0084C4 26 05            [ 1]  948 	jrne 4$ 
      0084C6 5C               [ 1]  949 	incw x 
      0084C7 90 5C            [ 1]  950 	incw y 
      0084C9 20 F4            [ 2]  951 	jra strcmp 
      0084CB                        952 4$: ; not same  
      0084CB 4F               [ 1]  953 	clr a 
      0084CC 81               [ 4]  954 	ret 
      0084CD                        955 5$: ; same 
      0084CD A6 01            [ 1]  956 	ld a,#1 
      0084CF 81               [ 4]  957 	ret 
                                    958 
                                    959 
                                    960 ;---------------------------------------
                                    961 ;  copy src to dest 
                                    962 ; input:
                                    963 ;   X 		dest 
                                    964 ;   Y 		src 
                                    965 ; output: 
                                    966 ;   X 		dest 
                                    967 ;----------------------------------
      0084D0                        968 strcpy:
      0084D0 89               [ 2]  969 	pushw x 
      0084D1 90 F6            [ 1]  970 1$: ld a,(y)
      0084D3 27 06            [ 1]  971 	jreq 9$ 
      0084D5 F7               [ 1]  972 	ld (x),a 
      0084D6 5C               [ 1]  973 	incw x 
      0084D7 90 5C            [ 1]  974 	incw y 
      0084D9 20 F6            [ 2]  975 	jra 1$ 
      0084DB 7F               [ 1]  976 9$:	clr (x)
      0084DC 85               [ 2]  977 	popw x 
      0084DD 81               [ 4]  978 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    979 
                                    980 ;---------------------------------------
                                    981 ; move memory block 
                                    982 ; input:
                                    983 ;   X 		destination 
                                    984 ;   Y 	    source 
                                    985 ;   acc16	bytes count 
                                    986 ; output:
                                    987 ;   none 
                                    988 ;--------------------------------------
                           000001   989 	INCR=1 ; increament high byte 
                           000002   990 	LB=2 ; increament low byte 
                           000002   991 	VSIZE=2
      0084DE                        992 move::
      00045E                        993 	_vars VSIZE 
      0084DE 52 02            [ 2]    1     sub sp,#VSIZE 
      0084E0 0F 01            [ 1]  994 	clr (INCR,sp)
      0084E2 0F 02            [ 1]  995 	clr (LB,sp)
      0084E4 90 89            [ 2]  996 	pushw y 
      0084E6 13 01            [ 2]  997 	cpw x,(1,sp) ; compare DEST to SRC 
      0084E8 90 85            [ 2]  998 	popw y 
      0084EA 27 31            [ 1]  999 	jreq move_exit ; x==y 
      0084EC 2B 0E            [ 1] 1000 	jrmi move_down
      0084EE                       1001 move_up: ; start from top address with incr=-1
      0084EE 72 BB 00 0D      [ 2] 1002 	addw x,acc16
      0084F2 72 B9 00 0D      [ 2] 1003 	addw y,acc16
      0084F6 03 01            [ 1] 1004 	cpl (INCR,sp)
      0084F8 03 02            [ 1] 1005 	cpl (LB,sp)   ; increment = -1 
      0084FA 20 05            [ 2] 1006 	jra move_loop  
      0084FC                       1007 move_down: ; start from bottom address with incr=1 
      0084FC 5A               [ 2] 1008     decw x 
      0084FD 90 5A            [ 2] 1009 	decw y
      0084FF 0C 02            [ 1] 1010 	inc (LB,sp) ; incr=1 
      008501                       1011 move_loop:	
      008501 C6 00 0D         [ 1] 1012     ld a, acc16 
      008504 CA 00 0E         [ 1] 1013 	or a, acc8
      008507 27 14            [ 1] 1014 	jreq move_exit 
      008509 72 FB 01         [ 2] 1015 	addw x,(INCR,sp)
      00850C 72 F9 01         [ 2] 1016 	addw y,(INCR,sp) 
      00850F 90 F6            [ 1] 1017 	ld a,(y)
      008511 F7               [ 1] 1018 	ld (x),a 
      008512 89               [ 2] 1019 	pushw x 
      008513 CE 00 0D         [ 2] 1020 	ldw x,acc16 
      008516 5A               [ 2] 1021 	decw x 
      008517 CF 00 0D         [ 2] 1022 	ldw acc16,x 
      00851A 85               [ 2] 1023 	popw x 
      00851B 20 E4            [ 2] 1024 	jra move_loop
      00851D                       1025 move_exit:
      00049D                       1026 	_drop VSIZE
      00851D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00851F 81               [ 4] 1027 	ret 	
                                   1028 
                                   1029 ;-------------------------------------
                                   1030 ; search text area for a line#
                                   1031 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1032 ;	X 			line# 
                                   1033 ; output:
                                   1034 ;   X 			addr of line | 0 
                                   1035 ;   Y           line#|insert address if not found  
                                   1036 ;-------------------------------------
                           000001  1037 	LL=1 ; line length 
                           000002  1038 	LB=2 ; line length low byte 
                           000002  1039 	VSIZE=2 
      008520                       1040 search_lineno::
      0004A0                       1041 	_vars VSIZE
      008520 52 02            [ 2]    1     sub sp,#VSIZE 
      008522 0F 01            [ 1] 1042 	clr (LL,sp)
      008524 90 CE 00 1D      [ 2] 1043 	ldw y,txtbgn
      008528                       1044 search_ln_loop:
      008528 90 C3 00 1F      [ 2] 1045 	cpw y,txtend 
      00852C 2A 10            [ 1] 1046 	jrpl 8$
      00852E 90 F3            [ 1] 1047 	cpw x,(y)
      008530 27 0E            [ 1] 1048 	jreq 9$
      008532 2B 0A            [ 1] 1049 	jrmi 8$ 
      008534 90 E6 02         [ 1] 1050 	ld a,(2,y)
      008537 6B 02            [ 1] 1051 	ld (LB,sp),a 
      008539 72 F9 01         [ 2] 1052 	addw y,(LL,sp)
      00853C 20 EA            [ 2] 1053 	jra search_ln_loop 
      00853E                       1054 8$: 
      00853E 5F               [ 1] 1055 	clrw x 	
      00853F 51               [ 1] 1056 	exgw x,y 
      0004C0                       1057 9$: _drop VSIZE
      008540 5B 02            [ 2]    1     addw sp,#VSIZE 
      008542 51               [ 1] 1058 	exgw x,y   
      008543 81               [ 4] 1059 	ret 
                                   1060 
                                   1061 ;-------------------------------------
                                   1062 ; delete line at addr
                                   1063 ; input:
                                   1064 ;   X 		addr of line i.e DEST for move 
                                   1065 ;-------------------------------------
                           000001  1066 	LLEN=1
                           000003  1067 	SRC=3
                           000004  1068 	VSIZE=4
      008544                       1069 del_line: 
      0004C4                       1070 	_vars VSIZE 
      008544 52 04            [ 2]    1     sub sp,#VSIZE 
      008546 E6 02            [ 1] 1071 	ld a,(2,x) ; line length
      008548 6B 02            [ 1] 1072 	ld (LLEN+1,sp),a 
      00854A 0F 01            [ 1] 1073 	clr (LLEN,sp)
      00854C 90 93            [ 1] 1074 	ldw y,x  
      00854E 72 F9 01         [ 2] 1075 	addw y,(LLEN,sp) ;SRC  
      008551 17 03            [ 2] 1076 	ldw (SRC,sp),y  ;save source 
      008553 90 CE 00 1F      [ 2] 1077 	ldw y,txtend 
      008557 72 F2 03         [ 2] 1078 	subw y,(SRC,sp) ; y=count 
      00855A 90 CF 00 0D      [ 2] 1079 	ldw acc16,y 
      00855E 16 03            [ 2] 1080 	ldw y,(SRC,sp)    ; source
      008560 CD 84 DE         [ 4] 1081 	call move
      008563 90 CE 00 1F      [ 2] 1082 	ldw y,txtend 
      008567 72 F2 01         [ 2] 1083 	subw y,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00856A 90 CF 00 1F      [ 2] 1084 	ldw txtend,y  
      0004EE                       1085 	_drop VSIZE     
      00856E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008570 81               [ 4] 1086 	ret 
                                   1087 
                                   1088 ;---------------------------------------------
                                   1089 ; create a gap in text area to 
                                   1090 ; move new line in this gap
                                   1091 ; input:
                                   1092 ;    X 			addr gap start 
                                   1093 ;    Y 			gap length 
                                   1094 ; output:
                                   1095 ;    X 			addr gap start 
                                   1096 ;--------------------------------------------
                           000001  1097 	DEST=1
                           000003  1098 	SRC=3
                           000005  1099 	LEN=5
                           000006  1100 	VSIZE=6 
      008571                       1101 create_gap:
      0004F1                       1102 	_vars VSIZE
      008571 52 06            [ 2]    1     sub sp,#VSIZE 
      008573 1F 03            [ 2] 1103 	ldw (SRC,sp),x 
      008575 17 05            [ 2] 1104 	ldw (LEN,sp),y 
      008577 90 CF 00 0D      [ 2] 1105 	ldw acc16,y 
      00857B 90 93            [ 1] 1106 	ldw y,x ; SRC
      00857D 72 BB 00 0D      [ 2] 1107 	addw x,acc16  
      008581 1F 01            [ 2] 1108 	ldw (DEST,sp),x 
                                   1109 ;compute size to move 	
      008583 CE 00 1F         [ 2] 1110 	ldw x,txtend 
      008586 72 F0 03         [ 2] 1111 	subw x,(SRC,sp)
      008589 CF 00 0D         [ 2] 1112 	ldw acc16,x ; size to move
      00858C 1E 01            [ 2] 1113 	ldw x,(DEST,sp) 
      00858E CD 84 DE         [ 4] 1114 	call move
      008591 CE 00 1F         [ 2] 1115 	ldw x,txtend
      008594 72 FB 05         [ 2] 1116 	addw x,(LEN,sp)
      008597 CF 00 1F         [ 2] 1117 	ldw txtend,x
      00051A                       1118 9$:	_drop VSIZE 
      00859A 5B 06            [ 2]    1     addw sp,#VSIZE 
      00859C 81               [ 4] 1119 	ret 
                                   1120 
                                   1121 ;--------------------------------------------
                                   1122 ; insert line in pad into text area 
                                   1123 ; first search for already existing 
                                   1124 ; replace existing 
                                   1125 ; if new line empty delete existing one. 
                                   1126 ; input:
                                   1127 ;   ptr16		pointer to tokenized line  
                                   1128 ; output:
                                   1129 ;   none
                                   1130 ;---------------------------------------------
                           000001  1131 	DEST=1  ; text area insertion address 
                           000003  1132 	SRC=3   ; str to insert address 
                           000005  1133 	LINENO=5 ; line number 
                           000007  1134 	LLEN=7 ; line length 
                           000008  1135 	VSIZE=8  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00859D                       1136 insert_line:
      00051D                       1137 	_vars VSIZE 
      00859D 52 08            [ 2]    1     sub sp,#VSIZE 
      00859F CE 00 1F         [ 2] 1138 	ldw x,txtend  
      0085A2 C3 00 1D         [ 2] 1139 	cpw x,txtbgn 
      0085A5 26 19            [ 1] 1140 	jrne 0$
                                   1141 ;first text line 
      0085A7 AE 00 02         [ 2] 1142 	ldw x,#2 
      0085AA 72 D6 00 18      [ 4] 1143 	ld a,([ptr16],x)
      0085AE A1 03            [ 1] 1144 	cp a,#3
      0085B0 27 59            [ 1] 1145 	jreq insert_ln_exit
      0085B2 5F               [ 1] 1146 	clrw x 
      0085B3 97               [ 1] 1147 	ld xl,a
      0085B4 1F 07            [ 2] 1148 	ldw (LLEN,sp),x 
      0085B6 CE 00 1D         [ 2] 1149 	ldw x,txtbgn
      0085B9 1F 01            [ 2] 1150 	ldw (DEST,sp),x 
      0085BB CE 00 1F         [ 2] 1151 	ldw x,txtend 
      0085BE 20 37            [ 2] 1152 	jra 4$
      0085C0 72 CE 00 18      [ 5] 1153 0$:	ldw x,[ptr16]
                                   1154 ; line number
      0085C4 1F 05            [ 2] 1155 	ldw (LINENO,sp),x 
      0085C6 AE 00 02         [ 2] 1156 	ldw x,#2 
      0085C9 72 D6 00 18      [ 4] 1157 	ld a,([ptr16],x)
      0085CD 97               [ 1] 1158 	ld xl,a
                                   1159 ; line length
      0085CE 1F 07            [ 2] 1160 	ldw (LLEN,sp),x
                                   1161 ; check if that line number already exit 	
      0085D0 1E 05            [ 2] 1162 	ldw x,(LINENO,sp)
      0085D2 CD 85 20         [ 4] 1163 	call search_lineno 
      0085D5 5D               [ 2] 1164 	tnzw x 
      0085D6 26 04            [ 1] 1165 	jrne 2$
                                   1166 ; line doesn't exit
                                   1167 ; it will be inserted at this point.  	
      0085D8 17 01            [ 2] 1168 	ldw (DEST,sp),y 
      0085DA 20 05            [ 2] 1169 	jra 3$
                                   1170 ; line exit delete it.
                                   1171 ; it will be replaced by new one 	
      0085DC 1F 01            [ 2] 1172 2$: ldw (DEST,sp),x 
      0085DE CD 85 44         [ 4] 1173 	call del_line
      0085E1                       1174 3$: 
                                   1175 ; insert new line or leave if LLEN==3
                                   1176 ; LLEN==3 means empty line 
      0085E1 A6 03            [ 1] 1177 	ld a,#3
      0085E3 11 08            [ 1] 1178 	cp a,(LLEN+1,sp)
      0085E5 27 24            [ 1] 1179 	jreq insert_ln_exit ; empty line exit.
                                   1180 ; if insertion point at txtend 
                                   1181 ; move no need to create a gap 
      0085E7 1E 01            [ 2] 1182 	ldw x,(DEST,sp)
      0085E9 C3 00 1F         [ 2] 1183 	cpw x,txtend 
      0085EC 27 09            [ 1] 1184 	jreq 4$ 
                                   1185 ; must create a gap
                                   1186 ; at insertion point  
      0085EE 1E 01            [ 2] 1187 	ldw x,(DEST,sp)
      0085F0 16 07            [ 2] 1188 	ldw y,(LLEN,sp)
      0085F2 CD 85 71         [ 4] 1189 	call create_gap
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085F5 20 06            [ 2] 1190 	jra 5$
      0085F7                       1191 4$: 
      0085F7 72 FB 07         [ 2] 1192 	addw x,(LLEN,sp)
      0085FA CF 00 1F         [ 2] 1193 	ldw txtend,x 	 
                                   1194 ; move new line in gap 
      0085FD 1E 07            [ 2] 1195 5$:	ldw x,(LLEN,sp)
      0085FF CF 00 0D         [ 2] 1196 	ldw acc16,x 
      008602 90 AE 16 E0      [ 2] 1197 	ldw y,#pad ;SRC 
      008606 1E 01            [ 2] 1198 	ldw x,(DEST,sp) ; dest address 
      008608 CD 84 DE         [ 4] 1199 	call move 
      00860B                       1200 insert_ln_exit:	
      00058B                       1201 	_drop VSIZE
      00860B 5B 08            [ 2]    1     addw sp,#VSIZE 
      00860D 81               [ 4] 1202 	ret
                                   1203 
                                   1204 ;-----------------------------------
                                   1205 ; create token list fromm text line 
                                   1206 ; save this list in pad buffer 
                                   1207 ;  compiled line format: 
                                   1208 ;    line_no  2 bytes {0...32767}
                                   1209 ;    count    1 byte  
                                   1210 ;    tokens   variable length 
                                   1211 ;   
                                   1212 ; input:
                                   1213 ;   none
                                   1214 ; modified variables:
                                   1215 ;   basicptr     token list buffer address 
                                   1216 ;   in.w  		 3|count, i.e. index in buffer
                                   1217 ;   count        length of line | 0  
                                   1218 ;-----------------------------------
                           000001  1219 	XSAVE=1
                           000002  1220 	VSIZE=2
      00860E                       1221 compile:
      00058E                       1222 	_vars VSIZE 
      00860E 52 02            [ 2]    1     sub sp,#VSIZE 
      008610 72 1A 00 24      [ 1] 1223 	bset flags,#FCOMP 
      008614 A6 00            [ 1] 1224 	ld a,#0
      008616 AE 00 00         [ 2] 1225 	ldw x,#0
      008619 CF 16 E0         [ 2] 1226 	ldw pad,x ; destination buffer 
      00861C C7 16 E2         [ 1] 1227 	ld pad+2,a ; count 
      00861F AE 16 E3         [ 2] 1228 	ldw x,#pad+3
      008622 72 5F 00 02      [ 1] 1229 	clr in 
      008626 CD 8D 1E         [ 4] 1230 	call get_token
      008629 A1 84            [ 1] 1231 	cp a,#TK_INTGR
      00862B 26 11            [ 1] 1232 	jrne 2$
      00862D A3 00 01         [ 2] 1233 	cpw x,#1 
      008630 2A 05            [ 1] 1234 	jrpl 1$
      008632 A6 0A            [ 1] 1235 	ld a,#ERR_BAD_VALUE
      008634 CC 89 9E         [ 2] 1236 	jp tb_error
      008637 CF 16 E0         [ 2] 1237 1$:	ldw pad,x 
      00863A 90 AE 16 E3      [ 2] 1238 	ldw y,#pad+3 
      00863E 90 A3 17 60      [ 2] 1239 2$:	cpw y,#stack_full 
      008642 25 05            [ 1] 1240 	jrult 3$
      008644 A6 0F            [ 1] 1241 	ld a,#ERR_BUF_FULL 
      008646 CC 89 9E         [ 2] 1242 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008649                       1243 3$:	
      008649 93               [ 1] 1244 	ldw x,y 
      00864A CD 8D 1E         [ 4] 1245 	call get_token 
      00864D A1 00            [ 1] 1246 	cp a,#TK_NONE 
      00864F 26 ED            [ 1] 1247 	jrne 2$ 
                                   1248 ; compilation completed  
      008651 72 A2 16 E0      [ 2] 1249 	subw y,#pad
      008655 90 9F            [ 1] 1250     ld a,yl
      008657 AE 16 E0         [ 2] 1251 	ldw x,#pad 
      00865A CF 00 18         [ 2] 1252 	ldw ptr16,x 
      00865D E7 02            [ 1] 1253 	ld (2,x),a 
      00865F FE               [ 2] 1254 	ldw x,(x)
      008660 27 09            [ 1] 1255 	jreq 10$
      008662 CD 85 9D         [ 4] 1256 	call insert_line
      008665 72 5F 00 04      [ 1] 1257 	clr  count 
      008669 20 0F            [ 2] 1258 	jra  11$ 
      00866B                       1259 10$: ; line# is zero 
      00866B CE 00 18         [ 2] 1260 	ldw x,ptr16  
      00866E CF 00 05         [ 2] 1261 	ldw basicptr,x 
      008671 E6 02            [ 1] 1262 	ld a,(2,x)
      008673 C7 00 04         [ 1] 1263 	ld count,a 
      008676 35 03 00 02      [ 1] 1264 	mov in,#3 
      00867A                       1265 11$:
      0005FA                       1266 	_drop VSIZE 
      00867A 5B 02            [ 2]    1     addw sp,#VSIZE 
      00867C 72 1B 00 24      [ 1] 1267 	bres flags,#FCOMP 
      008680 81               [ 4] 1268 	ret 
                                   1269 
                                   1270 ;------------------------------------
                                   1271 ;  set all variables to zero 
                                   1272 ; input:
                                   1273 ;   none 
                                   1274 ; output:
                                   1275 ;	none
                                   1276 ;------------------------------------
      008681                       1277 clear_vars:
      008681 AE 00 3A         [ 2] 1278 	ldw x,#vars 
      008684 90 AE 00 34      [ 2] 1279 	ldw y,#2*26 
      008688 7F               [ 1] 1280 1$:	clr (x)
      008689 5C               [ 1] 1281 	incw x 
      00868A 90 5A            [ 2] 1282 	decw y 
      00868C 26 FA            [ 1] 1283 	jrne 1$
      00868E 81               [ 4] 1284 	ret 
                                   1285 
                                   1286 ;-------------------------------------
                                   1287 ; check if A is a letter 
                                   1288 ; input:
                                   1289 ;   A 			character to test 
                                   1290 ; output:
                                   1291 ;   C flag      1 true, 0 false 
                                   1292 ;-------------------------------------
      00868F                       1293 is_alpha:
      00868F A1 41            [ 1] 1294 	cp a,#'A 
      008691 8C               [ 1] 1295 	ccf 
      008692 24 0B            [ 1] 1296 	jrnc 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008694 A1 5B            [ 1] 1297 	cp a,#'Z+1 
      008696 25 07            [ 1] 1298 	jrc 9$ 
      008698 A1 61            [ 1] 1299 	cp a,#'a 
      00869A 8C               [ 1] 1300 	ccf 
      00869B 24 02            [ 1] 1301 	jrnc 9$
      00869D A1 7B            [ 1] 1302 	cp a,#'z+1
      00869F 81               [ 4] 1303 9$: ret 	
                                   1304 
                                   1305 ;------------------------------------
                                   1306 ; check if character in {'0'..'9'}
                                   1307 ; input:
                                   1308 ;    A  character to test
                                   1309 ; output:
                                   1310 ;    Carry  0 not digit | 1 digit
                                   1311 ;------------------------------------
      0086A0                       1312 is_digit:
      0086A0 A1 30            [ 1] 1313 	cp a,#'0
      0086A2 25 03            [ 1] 1314 	jrc 1$
      0086A4 A1 3A            [ 1] 1315     cp a,#'9+1
      0086A6 8C               [ 1] 1316 	ccf 
      0086A7 8C               [ 1] 1317 1$:	ccf 
      0086A8 81               [ 4] 1318     ret
                                   1319 
                                   1320 ;-------------------------------------
                                   1321 ; return true if character in  A 
                                   1322 ; is letter or digit.
                                   1323 ; input:
                                   1324 ;   A     ASCII character 
                                   1325 ; output:
                                   1326 ;   A     no change 
                                   1327 ;   Carry    0 false| 1 true 
                                   1328 ;--------------------------------------
      0086A9                       1329 is_alnum:
      0086A9 CD 86 A0         [ 4] 1330 	call is_digit
      0086AC 25 03            [ 1] 1331 	jrc 1$ 
      0086AE CD 86 8F         [ 4] 1332 	call is_alpha
      0086B1 81               [ 4] 1333 1$:	ret 
                                   1334 
                                   1335 
                                   1336 ;-------------------------------------
                                   1337 ;  program initialization entry point 
                                   1338 ;-------------------------------------
                           000001  1339 	MAJOR=1
                           000000  1340 	MINOR=0
      0086B2 0A 0A 54 69 6E 79 20  1341 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0086F8                       1342 cold_start:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1343 ;set stack 
      0086F8 AE 17 FF         [ 2] 1344 	ldw x,#STACK_EMPTY
      0086FB 94               [ 1] 1345 	ldw sp,x   
                                   1346 ; clear all ram 
      0086FC 7F               [ 1] 1347 0$: clr (x)
      0086FD 5A               [ 2] 1348 	decw x 
      0086FE 26 FC            [ 1] 1349 	jrne 0$
                                   1350 ; activate pull up on all inputs 
      008700 A6 FF            [ 1] 1351 	ld a,#255 
      008702 C7 50 03         [ 1] 1352 	ld PA_CR1,a 
      008705 C7 50 08         [ 1] 1353 	ld PB_CR1,a 
      008708 C7 50 0D         [ 1] 1354 	ld PC_CR1,a 
      00870B C7 50 12         [ 1] 1355 	ld PD_CR1,a 
      00870E C7 50 17         [ 1] 1356 	ld PE_CR1,a 
      008711 C7 50 1C         [ 1] 1357 	ld PF_CR1,a 
      008714 C7 50 21         [ 1] 1358 	ld PG_CR1,a 
      008717 C7 50 2B         [ 1] 1359 	ld PI_CR1,a
                                   1360 ; set LD2 pin as output 
      00871A 72 1A 50 0D      [ 1] 1361     bset PC_CR1,#LED2_BIT
      00871E 72 1A 50 0E      [ 1] 1362     bset PC_CR2,#LED2_BIT
      008722 72 1A 50 0C      [ 1] 1363     bset PC_DDR,#LED2_BIT
      008726 72 1B 50 0A      [ 1] 1364 	bres PC_ODR,#LED2_BIT 
                                   1365 ; disable schmitt triggers on Arduino CN4 analog inputs
      00872A 55 00 3F 54 07   [ 1] 1366 	mov ADC_TDRL,0x3f
                                   1367 ; disable peripherals clocks
                                   1368 ;	clr CLK_PCKENR1 
                                   1369 ;	clr CLK_PCKENR2
      00872F 72 5F 50 F2      [ 1] 1370 	clr AWU_TBR 
      008733 72 14 50 CA      [ 1] 1371 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1372 ; select internal clock no divisor: 16 Mhz 	
      008737 A6 E1            [ 1] 1373 	ld a,#CLK_SWR_HSI 
      008739 5F               [ 1] 1374 	clrw x  
      00873A CD 81 5D         [ 4] 1375     call clock_init 
      00873D CD 81 80         [ 4] 1376 	call timer4_init
      008740 CD 81 73         [ 4] 1377 	call timer2_init
                                   1378 ; UART1 at 115200 BAUD
      008743 CD 83 68         [ 4] 1379 	call uart1_init
                                   1380 ; UART3 at 115200 BAUD 
      008746 CD 83 25         [ 4] 1381 	call uart3_init	
                                   1382 ; activate PE_4 (user button interrupt)
      008749 72 18 50 18      [ 1] 1383     bset PE_CR2,#USR_BTN_BIT 
                                   1384 ; display system information
      00874D AE 86 B2         [ 2] 1385 	ldw x,#software 
      008750 CD AA 40         [ 4] 1386 	call puts 
      008753 A6 01            [ 1] 1387 	ld a,#MAJOR 
      008755 C7 00 0E         [ 1] 1388 	ld acc8,a 
      008758 5F               [ 1] 1389 	clrw x 
      008759 CF 00 0C         [ 2] 1390 	ldw acc24,x
      00875C 72 5F 00 25      [ 1] 1391 	clr tab_width  
      008760 35 0A 00 0B      [ 1] 1392 	mov base, #10 
      008764 CD 8A FF         [ 4] 1393 	call prti24 
      008767 A6 2E            [ 1] 1394 	ld a,#'.
      008769 CD 83 AB         [ 4] 1395 	call putc 
      00876C A6 00            [ 1] 1396 	ld a,#MINOR 
      00876E C7 00 0E         [ 1] 1397 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008771 5F               [ 1] 1398 	clrw x 
      008772 CF 00 0C         [ 2] 1399 	ldw acc24,x 
      008775 CD 8A FF         [ 4] 1400 	call prti24
      008778 A6 0D            [ 1] 1401 	ld a,#CR 
      00877A CD 83 AB         [ 4] 1402 	call putc
      00877D CD 9B 54         [ 4] 1403 	call seek_fdrive 
      008780 9A               [ 1] 1404 	rim 
      008781 72 5C 00 16      [ 1] 1405 	inc seedy+1 
      008785 72 5C 00 14      [ 1] 1406 	inc seedx+1 
      008789 CD 88 06         [ 4] 1407 	call clear_basic
      00878C CD 93 6C         [ 4] 1408 	call ubound 
      00878F CD 99 A2         [ 4] 1409 	call beep_1khz  
      008792                       1410 2$:	
      008792 CD 87 9B         [ 4] 1411 	call warm_init
      008795 CD 87 C8         [ 4] 1412 	call load_autorun
      008798 CC 8A 26         [ 2] 1413     jp cmd_line  
                                   1414 
      00879B                       1415 warm_init:
      00879B 72 5F 00 24      [ 1] 1416 	clr flags 
      00879F 72 5F 00 21      [ 1] 1417 	clr loop_depth 
      0087A3 35 04 00 25      [ 1] 1418 	mov tab_width,#TAB_WIDTH 
      0087A7 35 0A 00 0B      [ 1] 1419 	mov base,#10 
      0087AB AE 00 00         [ 2] 1420 	ldw x,#0 
      0087AE CF 00 05         [ 2] 1421 	ldw basicptr,x 
      0087B1 CF 00 01         [ 2] 1422 	ldw in.w,x 
      0087B4 72 5F 00 04      [ 1] 1423 	clr count
      0087B8 81               [ 4] 1424 	ret 
                                   1425 
                                   1426 ;--------------------------
                                   1427 ; called by tb_error when
                                   1428 ; flag FAUTORUN is set.
                                   1429 ; There is a bug in autorun 
                                   1430 ; program so cancel it.
                                   1431 ;---------------------------
      0087B9                       1432 cancel_autorun:
      0087B9 AE 40 00         [ 2] 1433 	ldw x,#AUTORUN_NAME 
      0087BC CF 00 18         [ 2] 1434 	ldw farptr+1,x 
      0087BF 4F               [ 1] 1435 	clr a
      0087C0 5F               [ 1] 1436 	clrw x  
      0087C1 C7 00 17         [ 1] 1437 	ld farptr,a 
      0087C4 CD 82 8D         [ 4] 1438 	call write_byte 
      0087C7 81               [ 4] 1439 	ret 
                                   1440 
                                   1441 
                                   1442 ;--------------------------
                                   1443 ; if autorun file defined 
                                   1444 ; in eeprom address AUTORUN_NAME 
                                   1445 ; load and run it.
                                   1446 ;-------------------------
      0087C8                       1447 load_autorun:
      0087C8 90 AE 40 00      [ 2] 1448 	ldw y,#AUTORUN_NAME
      0087CC 90 F6            [ 1] 1449 	ld a,(y)
      0087CE 27 20            [ 1] 1450 	jreq 9$
      0087D0 CD 9B BA         [ 4] 1451 	call search_file
      0087D3 25 05            [ 1] 1452 	jrc 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1453 ; if file doesn't exit
      0087D5 CD 87 B9         [ 4] 1454 	call cancel_autorun
      0087D8 20 16            [ 2] 1455 	jra 9$ 
      0087DA CD 9C D5         [ 4] 1456 2$:	call load_file
      0087DD AE 40 00         [ 2] 1457 	ldw x,#AUTORUN_NAME 
      0087E0 CD AA 40         [ 4] 1458 	call puts
      0087E3 AE 87 F1         [ 2] 1459 	ldw x,#autorun_msg 
      0087E6 CD AA 40         [ 4] 1460 	call puts 
      0087E9 72 1C 00 24      [ 1] 1461 	bset flags,#FAUTORUN 
      0087ED CC 99 74         [ 2] 1462 	jp run_it    
      0087F0 81               [ 4] 1463 9$: ret 	
                                   1464 
      0087F1 20 6C 6F 61 64 65 64  1465 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1466 ;---------------------------
                                   1467 ; reset BASIC text variables 
                                   1468 ; and clear variables 
                                   1469 ;---------------------------
      008806                       1470 clear_basic:
      008806 72 5F 00 04      [ 1] 1471 	clr count
      00880A 72 5F 00 02      [ 1] 1472 	clr in  
      00880E AE 00 6E         [ 2] 1473 	ldw x,#free_ram 
      008811 CF 00 1D         [ 2] 1474 	ldw txtbgn,x 
      008814 CF 00 1F         [ 2] 1475 	ldw txtend,x 
      008817 CD 86 81         [ 4] 1476 	call clear_vars 
      00881A 81               [ 4] 1477 	ret 
                                   1478 
                                   1479 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1480 ;;   Tiny BASIC error messages     ;;
                                   1481 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00881B                       1482 err_msg:
      00881B 00 00 88 3B 88 48 88  1483 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             56 88 6F 88 7E
      008827 88 94 88 AA 88 C4 88  1484 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             D5 88 E6
      008831 88 F2 89 25 89 35 89  1485 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             49 89 5C
                                   1486 
      00883B 4D 65 6D 6F 72 79 20  1487 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008848 73 79 6E 74 61 78 20  1488 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008856 6D 61 74 68 20 6F 70  1489 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00886F 64 69 76 69 73 69 6F  1490 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      00887E 69 6E 76 61 6C 69 64  1491 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      008894 72 75 6E 20 74 69 6D  1492 err_run_only: .asciz "run time only usage.\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal  65-Bits]



             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00889C 20 6F 6E 6C 79 20 75  1493 err_cmd_only: .asciz "command line only usage.\n"
             73 61 67 65 2E 0A 00
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65
      0088B6 20 6F 6E 6C 79 20 75  1494 err_duplicate: .asciz "duplicate name.\n"
             73 61 67 65 2E 0A 00
             64 75 70
      0088C7 6C 69 63 61 74 65 20  1495 err_not_file: .asciz "File not found.\n"
             6E 61 6D 65 2E 0A 00
             46 69 6C
      0088D8 65 20 6E 6F 74 20 66  1496 err_bad_value: .asciz "bad value.\n"
             6F 75 6E 64 2E
      0088E4 0A 00 62 61 64 20 76  1497 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             61 6C 75 65 2E 0A 00
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E
      008917 20 66 72 6F 6D 20 74  1498 err_no_data: .asciz "No data found.\n"
             68 65 72 65 2E 0A 00
             4E 6F
      008927 20 64 61 74 61 20 66  1499 err_no_prog: .asciz "No program in RAM!\n"
             6F 75 6E 64 2E 0A 00
             4E 6F 20 70 72 6F
      00893B 67 72 61 6D 20 69 6E  1500 err_no_fspace: .asciz "File system full.\n" 
             20 52 41 4D 21 0A 00
             46 69 6C 65 20
      00894E 73 79 73 74 65 6D 20  1501 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 2E 0A
                                   1502 
      00895B 00 42 75 66 66 65 72  1503 rt_msg: .asciz "\nrun time error, "
             20 66 75 6C 6C 0A 00
             0A 72 75 6E
      00896D 20 74 69 6D 65 20 65  1504 comp_msg: .asciz "\ncompile error, "
             72 72 6F 72 2C 20 00
             0A 63 6F
      00897E 6D 70 69 6C 65 20 65  1505 tk_id: .asciz "last token id: "
             72 72 6F 72 2C 20 00
             6C 61
                                   1506 
      00091C                       1507 syntax_error:
      00898E 73 74            [ 1] 1508 	ld a,#ERR_SYNTAX 
                                   1509 
      00091E                       1510 tb_error:
      008990 20 74 6F 6B 65   [ 2] 1511 	btjt flags,#FCOMP,1$
      008995 6E               [ 1] 1512 	push a 
      008996 20 69 64         [ 2] 1513 	ldw x, #rt_msg 
      008999 3A 20 00         [ 4] 1514 	call puts 
      00899C 84               [ 1] 1515 	pop a 
      00899C A6 02 9B         [ 2] 1516 	ldw x, #err_msg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00899E 72 5F 00 0C      [ 1] 1517 	clr acc16 
      00899E 72               [ 1] 1518 	sll a
      00899F 0A 00 24 47      [ 1] 1519 	rlc acc16  
      0089A3 88 AE 89         [ 1] 1520 	ld acc8, a 
      0089A6 69 CD AA 40      [ 2] 1521 	addw x,acc16 
      0089AA 84               [ 2] 1522 	ldw x,(x)
      0089AB AE 88 1B         [ 4] 1523 	call puts
      0089AE 72 5F 00         [ 2] 1524 	ldw x,basicptr
      0089B1 0D 48 72         [ 1] 1525 	ld a,in 
      0089B4 59 00 0D         [ 4] 1526 	call prt_basic_line
      0089B7 C7 00 0E         [ 2] 1527 	ldw x,#tk_id 
      0089BA 72 BB 00         [ 4] 1528 	call puts 
      0089BD 0D FE CD         [ 1] 1529 	ld a,in.saved 
      0089C0 AA               [ 1] 1530 	clrw x 
      0089C1 40               [ 1] 1531 	ld xl,a 
      0089C2 CE 00 05 C6      [ 2] 1532 	addw x,basicptr 
      0089C6 00               [ 1] 1533 	ld a,(x)
      0089C7 02               [ 1] 1534 	clrw x 
      0089C8 CD               [ 1] 1535 	ld xl,a 
      0089C9 96 40 AE         [ 4] 1536 	call print_int
      0089CC 89 8C CD AA 40   [ 2] 1537 	btjf flags,#FAUTORUN ,6$
      0089D1 C6 00 03         [ 4] 1538 	call cancel_autorun  
      0089D4 5F 97            [ 2] 1539 	jra 6$
      00096A                       1540 1$:	
      0089D6 72               [ 1] 1541 	push a 
      0089D7 BB 00 05         [ 2] 1542 	ldw x,#comp_msg
      0089DA F6 5F 97         [ 4] 1543 	call puts 
      0089DD CD               [ 1] 1544 	pop a 
      0089DE 8A EF 72         [ 2] 1545 	ldw x, #err_msg 
      0089E1 0D 00 24 3A      [ 1] 1546 	clr acc16 
      0089E5 CD               [ 1] 1547 	sll a
      0089E6 87 B9 20 35      [ 1] 1548 	rlc acc16  
      0089EA C7 00 0D         [ 1] 1549 	ld acc8, a 
      0089EA 88 AE 89 7B      [ 2] 1550 	addw x,acc16 
      0089EE CD               [ 2] 1551 	ldw x,(x)
      0089EF AA 40 84         [ 4] 1552 	call puts
      0089F2 AE 88 1B         [ 2] 1553 	ldw x,#tib
      0089F5 72 5F 00         [ 4] 1554 	call puts 
      0089F8 0D 48            [ 1] 1555 	ld a,#CR 
      0089FA 72 59 00         [ 4] 1556 	call putc
      0089FD 0D C7 00         [ 2] 1557 	ldw x,in.w
      008A00 0E 72 BB         [ 4] 1558 	call spaces
      008A03 00 0D            [ 1] 1559 	ld a,#'^
      008A05 FE CD AA         [ 4] 1560 	call putc 
      008A08 40 AE 16         [ 2] 1561 6$: ldw x,#STACK_EMPTY 
      008A0B 90               [ 1] 1562     ldw sp,x
      0009A3                       1563 warm_start:
      008A0C CD AA 40         [ 4] 1564 	call warm_init
                                   1565 ;----------------------------
                                   1566 ;   BASIC interpreter
                                   1567 ;----------------------------
      0009A6                       1568 cmd_line: ; user interface 
      008A0F A6 0D            [ 1] 1569 	ld a,#CR 
      008A11 CD 83 AB         [ 4] 1570 	call putc 
      008A14 CE 00            [ 1] 1571 	ld a,#'> 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A16 01 CD AA         [ 4] 1572 	call putc
      008A19 AD A6 5E         [ 4] 1573 	call readln
      008A1C CD 83 AB AE      [ 1] 1574 	tnz count 
      008A20 17 FF            [ 1] 1575 	jreq cmd_line
      008A22 94 05 8E         [ 4] 1576 	call compile
                                   1577 ; if text begin with a line number
                                   1578 ; the compiler set count to zero    
                                   1579 ; so code is not interpreted
      008A23 72 5D 00 03      [ 1] 1580 	tnz count 
      008A23 CD 87            [ 1] 1581 	jreq cmd_line
                                   1582 
                                   1583 ; if direct command 
                                   1584 ; it's ready to interpret 
                                   1585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1586 ;; This is the interpreter loop
                                   1587 ;; for each BASIC code line. 
                                   1588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0009C2                       1589 interpreter: 
      008A25 9B 00 01         [ 1] 1590 	ld a,in 
      008A26 C1 00 03         [ 1] 1591 	cp a,count 
      008A26 A6 0D            [ 1] 1592 	jrmi interp_loop
      0009CA                       1593 next_line:
      008A28 CD 83 AB A6 3E   [ 2] 1594 	btjf flags, #FRUN, cmd_line
      008A2D CD 83 AB         [ 2] 1595 	ldw x,basicptr
      008A30 CD AB 45 72      [ 2] 1596 	addw x,in.w 
      008A34 5D 00 04         [ 2] 1597 	cpw x,txtend 
      008A37 27 ED            [ 1] 1598 	jrpl warm_start
      008A39 CD 86 0E         [ 2] 1599 	ldw basicptr,x ; start of next line  
      008A3C 72 5D            [ 1] 1600 	ld a,(2,x)
      008A3E 00 04 27         [ 1] 1601 	ld count,a 
      008A41 E4 03 00 01      [ 1] 1602 	mov in,#3 ; skip first 3 bytes of line 
      008A42                       1603 interp_loop: 
      008A42 C6 00 02         [ 4] 1604 	call next_token
      008A45 C1 00            [ 1] 1605 	cp a,#TK_NONE 
      008A47 04 2B            [ 1] 1606 	jreq next_line 
      008A49 1D 80            [ 1] 1607 	cp a,#TK_CMD
      008A4A 26 03            [ 1] 1608 	jrne 1$
      008A4A 72               [ 4] 1609 	call (x) 
      008A4B 01 00            [ 2] 1610 	jra interp_loop 
      0009F5                       1611 1$:	 
      008A4D 24 D7            [ 1] 1612 	cp a,#TK_VAR
      008A4F CE 00            [ 1] 1613 	jrne 2$
      008A51 05 72 BB         [ 4] 1614 	call let_var  
      008A54 00 01            [ 2] 1615 	jra interp_loop 
      0009FE                       1616 2$:	
      008A56 C3 00            [ 1] 1617 	cp a,#TK_ARRAY 
      008A58 1F 2A            [ 1] 1618 	jrne 3$
      008A5A C8 CF 00         [ 4] 1619 	call let_array 
      008A5D 05 E6            [ 2] 1620 	jra interp_loop
      000A07                       1621 3$:	
      008A5F 02 C7            [ 1] 1622 	cp a,#TK_COLON 
      008A61 00 04            [ 1] 1623 	jreq interp_loop 
      008A63 35 03 00         [ 2] 1624 	jp syntax_error 
                                   1625 
                                   1626 		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1627 ;--------------------------
                                   1628 ; extract next token from
                                   1629 ; token list 
                                   1630 ; basicptr -> base address 
                                   1631 ; in  -> offset in list array 
                                   1632 ; output:
                                   1633 ;   A 		token attribute
                                   1634 ;   X 		token value if there is one
                                   1635 ;----------------------------------------
      000A0E                       1636 next_token:
      008A66 02               [ 1] 1637 	clrw x 
      008A67 C6 00 01         [ 1] 1638 	ld a,in 
      008A67 CD 8A 8E         [ 1] 1639 	sub a,count ; don't replace sub by cp!  
      008A6A A1 00            [ 1] 1640 	jrmi 0$
      008A6C 27               [ 4] 1641 	ret  ; end of BASIC line 
      000A18                       1642 0$: 
      008A6D DC A1 80 26 03   [ 1] 1643 	mov in.saved,in 
      008A72 FD 20 F2 04      [ 2] 1644 	ldw y,basicptr 
      008A75 91 D6 00         [ 4] 1645 	ld a,([in.w],y)
      008A75 A1 85 26 05      [ 1] 1646 	inc in  
      008A79 CD               [ 1] 1647 	tnz a 
      008A7A 93 9F            [ 1] 1648 	jrmi 6$
      008A7C 20 E9            [ 1] 1649 	cp a,#TK_ARRAY
      008A7E 2A 3F            [ 1] 1650 	jrpl 9$  ; no attribute for these
      008A7E A1 06            [ 1] 1651 	cp a,#TK_COLON
      008A80 26 05            [ 1] 1652 	jreq 9$  
      000A33                       1653 1$: ; 
      008A82 CD 93            [ 1] 1654 	cp a,#TK_CHAR
      008A84 9C 20            [ 1] 1655 	jrne 2$
      008A86 E0               [ 1] 1656 	exg a,xl
      008A87 91 D6 00         [ 4] 1657 	ld a,([in.w],y)
      008A87 A1 01 27 DC      [ 1] 1658 	inc in 
      008A8B CC               [ 1] 1659 	exg a,xl  
      008A8C 89               [ 4] 1660 	ret
      008A8D 9C 02            [ 1] 1661 2$:	cp a,#TK_QSTR 
      008A8E 26 29            [ 1] 1662 	jrne 9$
      008A8E 5F               [ 1] 1663 	ldw x,y 
      008A8F C6 00 02 C0      [ 2] 1664 	addw x,in.w ; pointer to string 
                                   1665 ; move pointer after string 
      008A93 00 04 2B         [ 4] 1666 3$:	tnz ([in.w],y)
      008A96 01 81            [ 1] 1667 	jreq 8$
      008A98 72 5C 00 01      [ 1] 1668 	inc in 
      008A98 55 00            [ 2] 1669 	jra 3$
      000A55                       1670 6$: 
      008A9A 02 00 03 90      [ 2] 1671 	addw y,in.w 
      008A9E CE 00            [ 2] 1672 	ldw y,(y)
      008AA0 05 91            [ 1] 1673 	cp a,#TK_INTGR
      008AA2 D6 01            [ 1] 1674 	jrpl 7$
      008AA4 72 5C 00 02      [ 2] 1675 	addw y,#code_addr
      008AA8 4D 2B            [ 2] 1676 	ldw y,(y) 
      008AAA 2A               [ 1] 1677 7$:	exgw x,y 
      008AAB A1 06 2A 3F      [ 1] 1678 	inc in
      008AAF A1 01 27 3B      [ 1] 1679 8$:	inc in 
      008AB3                       1680 9$: 
      008AB3 A1               [ 4] 1681 	ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1682 
                                   1683 ;-----------------------------------
                                   1684 ; print a 16 bit integer 
                                   1685 ; using variable 'base' as conversion
                                   1686 ; format.
                                   1687 ; input:
                                   1688 ;   X       integer to print 
                                   1689 ;   'base'    conversion base 
                                   1690 ; output:
                                   1691 ;   none 
                                   1692 ;-----------------------------------
      000A6F                       1693 print_int:
      008AB4 03 26 0A 41      [ 1] 1694 	clr acc24 
      008AB8 91 D6 01         [ 2] 1695 	ldw acc16,x 
      008ABB 72 5C 00 02 41   [ 2] 1696 	btjf acc16,#7,prti24
      008AC0 81 A1 02 26      [ 1] 1697 	cpl acc24 
                                   1698 
                                   1699 ;------------------------------------
                                   1700 ; print integer in acc24 
                                   1701 ; input:
                                   1702 ;	acc24 		integer to print 
                                   1703 ;	'base' 		numerical base for conversion 
                                   1704 ;   'tab_width' field width 
                                   1705 ;  output:
                                   1706 ;    A          string length
                                   1707 ;------------------------------------
      000A7F                       1708 prti24:
      008AC4 29 93 72         [ 4] 1709     call itoa  ; conversion entier en  .asciz
      008AC7 BB 00 01         [ 4] 1710 	call right_align  
      008ACA 91               [ 1] 1711 	push a 
      008ACB 6D 01 27         [ 4] 1712 	call puts
      008ACE 1B               [ 1] 1713 	pop a 
      008ACF 72               [ 4] 1714     ret	
                                   1715 
                                   1716 ;------------------------------------
                                   1717 ; convert integer in acc24 to string
                                   1718 ; input:
                                   1719 ;   'base'	conversion base 
                                   1720 ;	acc24	integer to convert
                                   1721 ; output:
                                   1722 ;   X  		pointer to first char of string
                                   1723 ;   A       string length
                                   1724 ;------------------------------------
                           000001  1725 	SIGN=1  ; integer sign 
                           000002  1726 	LEN=2 
                           000003  1727 	PSTR=3
                           000004  1728 	VSIZE=4 ;locals size
      000A8B                       1729 itoa:
      000A8B                       1730 	_vars VSIZE
      008AD0 5C 00            [ 2]    1     sub sp,#VSIZE 
      008AD2 02 20            [ 1] 1731 	clr (LEN,sp) ; string length  
      008AD4 F5 01            [ 1] 1732 	clr (SIGN,sp)    ; sign
      008AD5 C6 00 0A         [ 1] 1733 	ld a,base 
      008AD5 72 B9            [ 1] 1734 	cp a,#10
      008AD7 00 01            [ 1] 1735 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1736 	; base 10 string display with negative sign if bit 23==1
      008AD9 90 FE A1 84 2A   [ 2] 1737 	btjf acc24,#7,1$
      008ADE 06 72            [ 1] 1738 	cpl (SIGN,sp)
      008AE0 A9 A9 2D         [ 4] 1739 	call neg_acc24
      000AA2                       1740 1$:
                                   1741 ; initialize string pointer 
      008AE3 90 FE 51         [ 2] 1742 	ldw x,#tib 
      008AE6 72 5C 00         [ 2] 1743 	addw x,#TIB_SIZE
      008AE9 02               [ 2] 1744 	decw x 
      008AEA 72               [ 1] 1745 	clr (x)
      000AAA                       1746 itoa_loop:
      008AEB 5C 00 02         [ 1] 1747     ld a,base
      008AEE 1F 03            [ 2] 1748 	ldw (PSTR,sp),x 
      008AEE 81 0A F0         [ 4] 1749     call divu24_8 ; acc24/A 
      008AEF 1E 03            [ 2] 1750 	ldw x,(PSTR,sp)
      008AEF 72 5F            [ 1] 1751     add a,#'0  ; remainder of division
      008AF1 00 0C            [ 1] 1752     cp a,#'9+1
      008AF3 CF 00            [ 1] 1753     jrmi 2$
      008AF5 0D 72            [ 1] 1754     add a,#7 
      000ABC                       1755 2$:	
      008AF7 0F               [ 2] 1756 	decw x
      008AF8 00               [ 1] 1757     ld (x),a
      008AF9 0D 04            [ 1] 1758 	inc (LEN,sp)
                                   1759 	; if acc24==0 conversion done
      008AFB 72 53 00         [ 1] 1760 	ld a,acc24
      008AFE 0C 00 0C         [ 1] 1761 	or a,acc16
      008AFF CA 00 0D         [ 1] 1762 	or a,acc8
      008AFF CD 8B            [ 1] 1763     jrne itoa_loop
                                   1764 	;conversion done, next add '$' or '-' as required
      008B01 0B CD 94         [ 1] 1765 	ld a,base 
      008B04 5C 88            [ 1] 1766 	cp a,#16
      008B06 CD AA            [ 1] 1767 	jreq 8$
      008B08 40 84            [ 1] 1768 	ld a,(SIGN,sp)
      008B0A 81 15            [ 1] 1769     jreq 10$
      008B0B A6 2D            [ 1] 1770     ld a,#'-
      008B0B 52 04            [ 2] 1771 	jra 9$ 
                                   1772 ; don't print more than 4 digits
                                   1773 ; in hexadecimal to avoid '-' sign 
                                   1774 ; extend display 	
      008B0D 0F 02            [ 1] 1775 8$: ld a,(LEN,sp) 
      008B0F 0F 01            [ 1] 1776 	cp a,#5 
      008B11 C6 00            [ 1] 1777 	jrmi 81$
      008B13 0B               [ 1] 1778 	incw x
      008B14 A1 0A            [ 1] 1779 	dec (LEN,sp)
      008B16 26 0A            [ 2] 1780 	jra 8$
      000AE5                       1781 81$:	
      008B18 72 0F            [ 1] 1782 	ld a,#'$ 
      008B1A 00               [ 2] 1783 9$: decw x
      008B1B 0C               [ 1] 1784     ld (x),a
      008B1C 05 03            [ 1] 1785 	inc (LEN,sp)
      000AEB                       1786 10$:
      008B1E 01 CD            [ 1] 1787 	ld a,(LEN,sp)
      000AED                       1788 	_drop VSIZE
      008B20 8B D2            [ 2]    1     addw sp,#VSIZE 
      008B22 81               [ 4] 1789 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1790 
                                   1791 ;-------------------------------------
                                   1792 ; divide uint24_t by uint8_t
                                   1793 ; used to convert uint24_t to string
                                   1794 ; input:
                                   1795 ;	acc24	dividend
                                   1796 ;   A 		divisor
                                   1797 ; output:
                                   1798 ;   acc24	quotient
                                   1799 ;   A		remainder
                                   1800 ;------------------------------------- 
                                   1801 ; offset  on sp of arguments and locals
                           000001  1802 	U8   = 1   ; divisor on stack
                           000001  1803 	VSIZE =1
      000AF0                       1804 divu24_8:
      008B22 AE               [ 2] 1805 	pushw x ; save x
      008B23 16               [ 1] 1806 	push a 
                                   1807 	; ld dividend UU:MM bytes in X
      008B24 90 1C 00         [ 1] 1808 	ld a, acc24
      008B27 50               [ 1] 1809 	ld xh,a
      008B28 5A 7F 0C         [ 1] 1810 	ld a,acc24+1
      008B2A 97               [ 1] 1811 	ld xl,a
      008B2A C6 00            [ 1] 1812 	ld a,(U8,SP) ; divisor
      008B2C 0B               [ 2] 1813 	div x,a ; UU:MM/U8
      008B2D 1F               [ 1] 1814 	push a  ;save remainder
      008B2E 03               [ 1] 1815 	ld a,xh
      008B2F CD 8B 70         [ 1] 1816 	ld acc24,a
      008B32 1E               [ 1] 1817 	ld a,xl
      008B33 03 AB 30         [ 1] 1818 	ld acc24+1,a
      008B36 A1               [ 1] 1819 	pop a
      008B37 3A               [ 1] 1820 	ld xh,a
      008B38 2B 02 AB         [ 1] 1821 	ld a,acc24+2
      008B3B 07               [ 1] 1822 	ld xl,a
      008B3C 7B 01            [ 1] 1823 	ld a,(U8,sp) ; divisor
      008B3C 5A               [ 2] 1824 	div x,a  ; R:LL/U8
      008B3D F7 0C            [ 1] 1825 	ld (U8,sp),a ; save remainder
      008B3F 02               [ 1] 1826 	ld a,xl
      008B40 C6 00 0C         [ 1] 1827 	ld acc24+2,a
      008B43 CA               [ 1] 1828 	pop a
      008B44 00               [ 2] 1829 	popw x
      008B45 0D               [ 4] 1830 	ret
                                   1831 
                                   1832 ;--------------------------------------
                                   1833 ; unsigned multiply uint24_t by uint8_t
                                   1834 ; use to convert numerical string to uint24_t
                                   1835 ; input:
                                   1836 ;	acc24	uint24_t 
                                   1837 ;   A		uint8_t
                                   1838 ; output:
                                   1839 ;   acc24   A*acc24
                                   1840 ;-------------------------------------
                                   1841 ; local variables offset  on sp
                           000003  1842 	U8   = 3   ; A pushed on stack
                           000002  1843 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1844 	OVFH = 1  ; multiplication overflow high byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                           000003  1845 	VSIZE = 3
      000B18                       1846 mulu24_8:
      008B46 CA               [ 2] 1847 	pushw x    ; save X
                                   1848 	; local variables
      008B47 00               [ 1] 1849 	push a     ; U8
      008B48 0E               [ 1] 1850 	clrw x     ; initialize overflow to 0
      008B49 26               [ 2] 1851 	pushw x    ; multiplication overflow
                                   1852 ; multiply low byte.
      008B4A DF C6 00         [ 1] 1853 	ld a,acc24+2
      008B4D 0B               [ 1] 1854 	ld xl,a
      008B4E A1 10            [ 1] 1855 	ld a,(U8,sp)
      008B50 27               [ 4] 1856 	mul x,a
      008B51 08               [ 1] 1857 	ld a,xl
      008B52 7B 01 27         [ 1] 1858 	ld acc24+2,a
      008B55 15               [ 1] 1859 	ld a, xh
      008B56 A6 2D            [ 1] 1860 	ld (OVFL,sp),a
                                   1861 ; multipy middle byte
      008B58 20 0D 7B         [ 1] 1862 	ld a,acc24+1
      008B5B 02               [ 1] 1863 	ld xl,a
      008B5C A1 05            [ 1] 1864 	ld a, (U8,sp)
      008B5E 2B               [ 4] 1865 	mul x,a
                                   1866 ; add overflow to this partial product
      008B5F 05 5C 0A         [ 2] 1867 	addw x,(OVFH,sp)
      008B62 02               [ 1] 1868 	ld a,xl
      008B63 20 F5 0C         [ 1] 1869 	ld acc24+1,a
      008B65 4F               [ 1] 1870 	clr a
      008B65 A6 24            [ 1] 1871 	adc a,#0
      008B67 5A F7            [ 1] 1872 	ld (OVFH,sp),a
      008B69 0C               [ 1] 1873 	ld a,xh
      008B6A 02 02            [ 1] 1874 	ld (OVFL,sp),a
                                   1875 ; multiply most signficant byte	
      008B6B C6 00 0B         [ 1] 1876 	ld a, acc24
      008B6B 7B               [ 1] 1877 	ld xl, a
      008B6C 02 5B            [ 1] 1878 	ld a, (U8,sp)
      008B6E 04               [ 4] 1879 	mul x,a
      008B6F 81 FB 01         [ 2] 1880 	addw x, (OVFH,sp)
      008B70 9F               [ 1] 1881 	ld a, xl
      008B70 89 88 C6         [ 1] 1882 	ld acc24,a
      008B73 00 0C            [ 2] 1883     addw sp,#VSIZE
      008B75 95               [ 2] 1884 	popw x
      008B76 C6               [ 4] 1885 	ret
                                   1886 
                                   1887 ;------------------------------------
                                   1888 ;  two's complement acc24
                                   1889 ;  input:
                                   1890 ;		acc24 variable
                                   1891 ;  output:
                                   1892 ;		acc24 variable
                                   1893 ;-------------------------------------
      000B52                       1894 neg_acc24:
      008B77 00 0D 97 7B      [ 1] 1895 	cpl acc24+2
      008B7B 01 62 88 9E      [ 1] 1896 	cpl acc24+1
      008B7F C7 00 0C 9F      [ 1] 1897 	cpl acc24
      008B83 C7 00            [ 1] 1898 	ld a,#1
      008B85 0D 84 95         [ 1] 1899 	add a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B88 C6 00 0E         [ 1] 1900 	ld acc24+2,a
      008B8B 97               [ 1] 1901 	clr a
      008B8C 7B 01 62         [ 1] 1902 	adc a,acc24+1
      008B8F 6B 01 9F         [ 1] 1903 	ld acc24+1,a 
      008B92 C7               [ 1] 1904 	clr a 
      008B93 00 0E 84         [ 1] 1905 	adc a,acc24 
      008B96 85 81 0B         [ 1] 1906 	ld acc24,a 
      008B98 81               [ 4] 1907 	ret
                                   1908 
                                   1909 
                                   1910 
                                   1911 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1912 ;; compiler routines        ;;
                                   1913 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1914 ;------------------------------------
                                   1915 ; parse quoted string 
                                   1916 ; input:
                                   1917 ;   Y 	pointer to tib 
                                   1918 ;   X   pointer to output buffer 
                                   1919 ; output:
                                   1920 ;	buffer   parsed string
                                   1921 ;------------------------------------
                           000001  1922 	PREV = 1
                           000002  1923 	CURR =2
                           000002  1924 	VSIZE=2
      000B75                       1925 parse_quote: 
      000B75                       1926 	_vars VSIZE 
      008B98 89 88            [ 2]    1     sub sp,#VSIZE 
      008B9A 5F               [ 1] 1927 	clr a
      008B9B 89 C6            [ 1] 1928 1$:	ld (PREV,sp),a 
      000B7A                       1929 2$:	
      008B9D 00 0E 97         [ 4] 1930 	ld a,([in.w],y)
      008BA0 7B 03            [ 1] 1931 	jreq 6$
      008BA2 42 9F C7 00      [ 1] 1932 	inc in 
      008BA6 0E 9E            [ 1] 1933 	ld (CURR,sp),a 
      008BA8 6B 02            [ 1] 1934 	ld a,#'\
      008BAA C6 00            [ 1] 1935 	cp a, (PREV,sp)
      008BAC 0D 97            [ 1] 1936 	jrne 3$
      008BAE 7B 03            [ 1] 1937 	clr (PREV,sp)
      008BB0 42 72            [ 1] 1938 	ld a,(CURR,sp)
      008BB2 FB 01            [ 4] 1939 	callr convert_escape
      008BB4 9F               [ 1] 1940 	ld (x),a 
      008BB5 C7               [ 1] 1941 	incw x 
      008BB6 00 0D            [ 2] 1942 	jra 2$
      000B95                       1943 3$:
      008BB8 4F A9            [ 1] 1944 	ld a,(CURR,sp)
      008BBA 00 6B            [ 1] 1945 	cp a,#'\'
      008BBC 01 9E            [ 1] 1946 	jreq 1$
      008BBE 6B 02            [ 1] 1947 	cp a,#'"
      008BC0 C6 00            [ 1] 1948 	jreq 6$ 
      008BC2 0C               [ 1] 1949 	ld (x),a 
      008BC3 97               [ 1] 1950 	incw x 
      008BC4 7B 03            [ 2] 1951 	jra 2$
      000BA3                       1952 6$:
      008BC6 42               [ 1] 1953 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BC7 72               [ 1] 1954 	incw x 
      008BC8 FB 01            [ 1] 1955 	ldw y,x 
      008BCA 9F               [ 1] 1956 	clrw x 
      008BCB C7 00            [ 1] 1957 	ld a,#TK_QSTR  
      000BAA                       1958 	_drop VSIZE
      008BCD 0C 5B            [ 2]    1     addw sp,#VSIZE 
      008BCF 03               [ 4] 1959 	ret 
                                   1960 
                                   1961 ;---------------------------------------
                                   1962 ; called by parse_quote
                                   1963 ; subtitute escaped character 
                                   1964 ; by their ASCII value .
                                   1965 ; input:
                                   1966 ;   A  character following '\'
                                   1967 ; output:
                                   1968 ;   A  substitued char or same if not valid.
                                   1969 ;---------------------------------------
      000BAD                       1970 convert_escape:
      008BD0 85               [ 2] 1971 	pushw x 
      008BD1 81 0B C2         [ 2] 1972 	ldw x,#escaped 
      008BD2 F1               [ 1] 1973 1$:	cp a,(x)
      008BD2 72 53            [ 1] 1974 	jreq 2$
      008BD4 00               [ 1] 1975 	tnz (x)
      008BD5 0E 72            [ 1] 1976 	jreq 3$
      008BD7 53               [ 1] 1977 	incw x 
      008BD8 00 0D            [ 2] 1978 	jra 1$
      008BDA 72 53 00         [ 2] 1979 2$: subw x,#escaped 
      008BDD 0C               [ 1] 1980 	ld a,xl 
      008BDE A6 01            [ 1] 1981 	add a,#7
      008BE0 CB               [ 2] 1982 3$:	popw x 
      008BE1 00               [ 4] 1983 	ret 
                                   1984 
      008BE2 0E C7 00 0E 4F C9 00  1985 escaped: .asciz "abtnvfr"
             0D
                                   1986 
                                   1987 ;-------------------------
                                   1988 ; integer parser 
                                   1989 ; input:
                                   1990 ;   X 		point to output buffer  
                                   1991 ;   Y 		point to tib 
                                   1992 ;   A 	    first digit|'$' 
                                   1993 ; output:  
                                   1994 ;   X 		integer 
                                   1995 ;   A 		TK_INTGR
                                   1996 ;   acc24   24 bits integer 
                                   1997 ;-------------------------
                           000001  1998 	BASE=1
                           000002  1999 	TCHAR=2 
                           000003  2000 	XSAVE=3
                           000004  2001 	VSIZE=4 
      000BCA                       2002 parse_integer: ; { -- n }
      008BEA C7               [ 2] 2003 	pushw x 	
      008BEB 00 0D            [ 1] 2004 	push #0 ; TCHAR
      008BED 4F C9            [ 1] 2005 	push #10 ; BASE=10
      008BEF 00 0C            [ 1] 2006 	cp a,#'$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BF1 C7 00            [ 1] 2007 	jrne 2$ 
      000BD3                       2008     _drop #1
      008BF3 0C 81            [ 2]    1     addw sp,##1 
      008BF5 4B 10            [ 1] 2009 	push #16  ; BASE=16
      008BF5 52               [ 1] 2010 2$:	ld (x),a 
      008BF6 02               [ 1] 2011 	incw x 
      008BF7 4F 6B 01         [ 4] 2012 	ld a,([in.w],y)
      008BFA 72 5C 00 01      [ 1] 2013 	inc in 
      008BFA 91 D6 01         [ 4] 2014 	call to_upper 
      008BFD 27 24            [ 1] 2015 	ld (TCHAR,sp),a 
      008BFF 72 5C 00         [ 4] 2016 	call is_digit 
      008C02 02 6B            [ 1] 2017 	jrc 2$
      008C04 02 A6            [ 1] 2018 	ld a,#16 
      008C06 5C 11            [ 1] 2019 	cp a,(BASE,sp)
      008C08 01 26            [ 1] 2020 	jrne 3$ 
      008C0A 0A 0F            [ 1] 2021 	ld a,(TCHAR,sp)
      008C0C 01 7B            [ 1] 2022 	cp a,#'A 
      008C0E 02 AD            [ 1] 2023 	jrmi 3$ 
      008C10 1C F7            [ 1] 2024 	cp a,#'G 
      008C12 5C 20            [ 1] 2025 	jrmi 2$ 
      008C14 E5 5A 00 01      [ 1] 2026 3$: dec in 	
      008C15 7F               [ 1] 2027     clr (x)
      008C15 7B 02            [ 2] 2028 	ldw x,(XSAVE,sp)
      008C17 A1 5C 27         [ 4] 2029 	call atoi24
      008C1A DD A1            [ 1] 2030 	ldw y,x 
      008C1C 22 27 04         [ 2] 2031 	ldw x,acc16 
      008C1F F7 5C            [ 1] 2032 	ld a,#TK_INTGR
      008C21 20 D7            [ 2] 2033 	ldw (y),x 
      008C23 72 A9 00 02      [ 2] 2034 	addw y,#2
      000C11                       2035 	_drop VSIZE  
      008C23 7F 5C            [ 2]    1     addw sp,#VSIZE 
      008C25 90               [ 4] 2036 	ret 	
                                   2037 
                                   2038 ;-------------------------
                                   2039 ; binary integer parser
                                   2040 ; build integer in acc24  
                                   2041 ; input:
                                   2042 ;   X 		point to output buffer  
                                   2043 ;   Y 		point to tib 
                                   2044 ;   A 	    '&' 
                                   2045 ; output:  
                                   2046 ;   buffer  TK_INTGR integer  
                                   2047 ;   X 		int16 
                                   2048 ;   A 		TK_INTGR
                                   2049 ;   acc24    int24 
                                   2050 ;-------------------------
                           000001  2051 	BINARY=1 ; 24 bits integer 
                           000003  2052 	VSIZE=3
      000C14                       2053 parse_binary: ; { -- n }
      008C26 93 5F            [ 1] 2054 	push #0
      008C28 A6 02            [ 1] 2055 	push #0
      008C2A 5B 02            [ 1] 2056 	push #0
      000C1A                       2057 2$:	
      008C2C 81 D6 00         [ 4] 2058 	ld a,([in.w],y)
      008C2D 72 5C 00 01      [ 1] 2059 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C2D 89 AE            [ 1] 2060 	cp a,#'0 
      008C2F 8C 42            [ 1] 2061 	jreq 3$
      008C31 F1 27            [ 1] 2062 	cp a,#'1 
      008C33 06 7D            [ 1] 2063 	jreq 3$ 
      008C35 27 09            [ 2] 2064 	jra bin_exit 
      008C37 5C 20            [ 1] 2065 3$: sub a,#'0 
      008C39 F7               [ 1] 2066 	rrc a
      008C3A 1D 8C            [ 1] 2067 	rlc (BINARY+2,sp) 
      008C3C 42 9F            [ 1] 2068 	rlc (BINARY+1,sp)
      008C3E AB 07            [ 1] 2069 	rlc (BINARY,sp) 
      008C40 85 81            [ 2] 2070 	jra 2$  
      000C36                       2071 bin_exit:
      008C42 61 62 74 6E      [ 1] 2072 	dec in 
      008C46 76 66            [ 1] 2073 	ldw y,x
      008C48 72 00            [ 1] 2074 	ld a,(BINARY,sp)
      008C4A C7 00 0B         [ 1] 2075 	ld acc24,a 
      008C4A 89 4B            [ 2] 2076 	ldw x,(BINARY+1,sp)
      008C4C 00 4B 0A         [ 2] 2077 	ldw acc16,x
      008C4F A1 24            [ 2] 2078 	ldw (y),x 
      008C51 26 04 5B 01      [ 2] 2079 	addw y,#2  
      008C55 4B 10            [ 1] 2080 	ld a,#TK_INTGR 	
      000C4E                       2081 	_drop VSIZE 
      008C57 F7 5C            [ 2]    1     addw sp,#VSIZE 
      008C59 91               [ 4] 2082 	ret
                                   2083 
                                   2084 ;---------------------------
                                   2085 ;  token begin with a letter,
                                   2086 ;  is keyword or variable. 	
                                   2087 ; input:
                                   2088 ;   X 		point to pad 
                                   2089 ;   Y 		point to text
                                   2090 ;   A 	    first letter  
                                   2091 ; output:
                                   2092 ;   X		exec_addr|var_addr 
                                   2093 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2094 ;   pad 	keyword|var_name  
                                   2095 ;--------------------------  
                           000001  2096 	XFIRST=1
                           000002  2097 	VSIZE=2
      000C51                       2098 parse_keyword: 
      008C5A D6               [ 2] 2099 	pushw x 
      000C52                       2100 kw_loop:	
      008C5B 01 72 5C         [ 4] 2101 	call to_upper 
      008C5E 00               [ 1] 2102 	ld (x),a 
      008C5F 02               [ 1] 2103 	incw x 
      008C60 CD 8E DD         [ 4] 2104 	ld a,([in.w],y)
      008C63 6B 02 CD 86      [ 1] 2105 	inc in 
      008C67 A0 25 ED         [ 4] 2106 	call is_alpha 
      008C6A A6 10            [ 1] 2107 	jrc kw_loop
      008C6C 11 01 26 0A      [ 1] 2108 	dec in   
      008C70 7B               [ 1] 2109 1$: clr (x)
      008C71 02 A1            [ 2] 2110 	ldw x,(XFIRST,sp) 
      008C73 41 2B            [ 1] 2111 	ld a,(1,x)
      008C75 04 A1            [ 1] 2112 	jrne 2$
                                   2113 ; one letter variable name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C77 47               [ 1] 2114 	ld a,(x) 
      008C78 2B DD            [ 1] 2115 	sub a,#'A 
      008C7A 72               [ 1] 2116 	sll a 
      008C7B 5A               [ 1] 2117 	push a 
      008C7C 00 02            [ 1] 2118 	push #0
      008C7E 7F 1E 03         [ 2] 2119 	ldw x,#vars 
      008C81 CD 8E E9         [ 2] 2120 	addw x,(1,sp) ; X=var address 
      000C7B                       2121 	_drop 2 
      008C84 90 93            [ 2]    1     addw sp,#2 
      008C86 CE 00            [ 1] 2122 	ld a,#TK_VAR 
      008C88 0D A6            [ 2] 2123 	jra 4$ 
      000C81                       2124 2$: ; check for keyword, otherwise syntax error.
      000C81                       2125 	_ldx_dict kword_dict ; dictionary entry point
      008C8A 84 90 FF         [ 2]    1     ldw x,#kword_dict+2
      008C8D 72 A9            [ 2] 2126 	ldw y,(XFIRST,sp) ; name to search for
      008C8F 00 02 5B         [ 4] 2127 	call search_dict
      008C92 04               [ 1] 2128 	tnz a
      008C93 81 03            [ 1] 2129 	jrne 4$ 
      008C94 CC 09 1C         [ 2] 2130 	jp syntax_error
      000C8F                       2131 4$:	
      008C94 4B 00            [ 2] 2132 	ldw y,(XFIRST,sp)
      008C96 4B 00            [ 1] 2133 	ld (y),a 
      008C98 4B 00            [ 1] 2134 	incw y 
      008C9A 90 FF            [ 2] 2135 	ldw (y),x
      008C9A 91 D6 01 72      [ 2] 2136 	addw y,#2  
      000C9B                       2137 	_drop VSIZE 
      008C9E 5C 00            [ 2]    1     addw sp,#VSIZE 
      008CA0 02               [ 4] 2138 	ret  	
                                   2139 
                                   2140 
                                   2141 ;------------------------------------
                                   2142 ; scan text for next token
                                   2143 ; input: 
                                   2144 ;	X 		pointer to buffer where 
                                   2145 ;	        token id and value are copied 
                                   2146 ; use:
                                   2147 ;	Y   pointer to text in tib 
                                   2148 ; output:
                                   2149 ;   A       token attribute 
                                   2150 ;   X 		token value
                                   2151 ;   Y       updated position in output buffer   
                                   2152 ;------------------------------------
                                   2153 	; use to check special character 
                                   2154 	.macro _case c t  
                                   2155 	ld a,#c 
                                   2156 	cp a,(TCHAR,sp) 
                                   2157 	jrne t
                                   2158 	.endm 
                                   2159 
                           000001  2160 	TCHAR=1
                           000002  2161 	ATTRIB=2
                           000002  2162 	VSIZE=2
      000C9E                       2163 get_token: 
      000C9E                       2164 	_vars VSIZE
      008CA1 A1 30            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2165 ;	ld a,in 
                                   2166 ;	sub a,count
                                   2167 ;   jrmi 0$
                                   2168 ;	clr a 
                                   2169 ;	ret 
      000CA0                       2170 0$: 
      008CA3 27 06 A1 31      [ 2] 2171 	ldw y,#tib    	
      008CA7 27 02            [ 1] 2172 	ld a,#SPACE
      008CA9 20 0B A0         [ 4] 2173 	call skip
      008CAC 30 46 09 03 09   [ 1] 2174 	mov in.saved,in 
      008CB1 02 09 01         [ 4] 2175 	ld a,([in.w],y)
      008CB4 20 E4            [ 1] 2176 	jrne 1$
      008CB6 90 93            [ 1] 2177 	ldw y,x 
      008CB6 72 5A 00         [ 2] 2178 	jp token_exit ; end of line 
      008CB9 02 90 93 7B      [ 1] 2179 1$:	inc in 
      008CBD 01 C7 00         [ 4] 2180 	call to_upper 
      008CC0 0C 1E            [ 1] 2181 	ld (TCHAR,sp),a 
                                   2182 ; check for quoted string
      000CC1                       2183 str_tst:  	
      000CC1                       2184 	_case '"' nbr_tst
      008CC2 02 CF            [ 1]    1 	ld a,#'"' 
      008CC4 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC6 90 FF            [ 1]    3 	jrne nbr_tst
      008CC8 72 A9            [ 1] 2185 	ld a,#TK_QSTR
      008CCA 00               [ 1] 2186 	ld (x),a 
      008CCB 02               [ 1] 2187 	incw x 
      008CCC A6 84 5B         [ 4] 2188 	call parse_quote
      008CCF 03 81 5A         [ 2] 2189 	jp token_exit
      008CD1                       2190 nbr_tst:
                                   2191 ; check for hexadecimal number 
      008CD1 89 24            [ 1] 2192 	ld a,#'$'
      008CD2 11 01            [ 1] 2193 	cp a,(TCHAR,sp) 
      008CD2 CD 8E            [ 1] 2194 	jreq 1$
                                   2195 ;check for binary number 
      008CD4 DD F7            [ 1] 2196 	ld a,#'&
      008CD6 5C 91            [ 1] 2197 	cp a,(TCHAR,sp)
      008CD8 D6 01            [ 1] 2198 	jrne 0$
      008CDA 72 5C            [ 1] 2199 	ld a,#TK_INTGR
      008CDC 00               [ 1] 2200 	ld (x),a 
      008CDD 02               [ 1] 2201 	incw x 
      008CDE CD 86 8F         [ 4] 2202 	call parse_binary ; expect binary integer 
      008CE1 25 EF 72         [ 2] 2203 	jp token_exit 
                                   2204 ; check for decimal number 	
      008CE4 5A 00            [ 1] 2205 0$:	ld a,(TCHAR,sp)
      008CE6 02 7F 1E         [ 4] 2206 	call is_digit
      008CE9 01 E6            [ 1] 2207 	jrnc 3$
      008CEB 01 26            [ 1] 2208 1$:	ld a,#TK_INTGR 
      008CED 13               [ 1] 2209 	ld (x),a 
      008CEE F6               [ 1] 2210 	incw x 
      008CEF A0 41            [ 1] 2211 	ld a,(TCHAR,sp)
      008CF1 48 88 4B         [ 4] 2212 	call parse_integer 
      008CF4 00 AE 00         [ 2] 2213 	jp token_exit 
      000CFA                       2214 3$: 
      000CFA                       2215 	_case '(' bkslsh_tst 
      008CF7 3A 72            [ 1]    1 	ld a,#'(' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CF9 FB 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFB 5B 02            [ 1]    3 	jrne bkslsh_tst
      008CFD A6 85            [ 1] 2216 	ld a,#TK_LPAREN
      008CFF 20 0E 56         [ 2] 2217 	jp token_char   	
      008D01                       2218 bkslsh_tst: ; character token 
      000D05                       2219 	_case '\',rparnt_tst
      008D01 AE A9            [ 1]    1 	ld a,#'\' 
      008D03 27 16            [ 1]    2 	cp a,(TCHAR,sp) 
      008D05 01 CD            [ 1]    3 	jrne rparnt_tst
      008D07 91 15            [ 1] 2220 	ld a,#TK_CHAR 
      008D09 4D               [ 1] 2221 	ld (x),a 
      008D0A 26               [ 1] 2222 	incw x 
      008D0B 03 CC 89         [ 4] 2223 	ld a,([in.w],y)
      008D0E 9C               [ 1] 2224 	ld (x),a 
      008D0F 5C               [ 1] 2225 	incw x
      008D0F 16 01            [ 1] 2226 	ldw y,x 	 
      008D11 90 F7 90 5C      [ 1] 2227 	inc in  
      008D15 90               [ 1] 2228 	clrw x 
      008D16 FF               [ 1] 2229 	ld xl,a 
      008D17 72 A9            [ 1] 2230 	ld a,#TK_CHAR 
      008D19 00 02 5B         [ 2] 2231 	jp token_exit 
      000D21                       2232 rparnt_tst:		
      000D21                       2233 	_case ')' colon_tst 
      008D1C 02 81            [ 1]    1 	ld a,#')' 
      008D1E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1E 52 02            [ 1]    3 	jrne colon_tst
      008D20 A6 08            [ 1] 2234 	ld a,#TK_RPAREN 
      008D20 90 AE 16         [ 2] 2235 	jp token_char
      000D2C                       2236 colon_tst:
      000D2C                       2237 	_case ':' comma_tst 
      008D23 90 A6            [ 1]    1 	ld a,#':' 
      008D25 20 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D27 8F 53            [ 1]    3 	jrne comma_tst
      008D29 55 00            [ 1] 2238 	ld a,#TK_COLON 
      008D2B 02 00 03         [ 2] 2239 	jp token_char  
      000D37                       2240 comma_tst:
      000D37                       2241 	_case COMMA sharp_tst 
      008D2E 91 D6            [ 1]    1 	ld a,#COMMA 
      008D30 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008D32 05 90            [ 1]    3 	jrne sharp_tst
      008D34 93 CC            [ 1] 2242 	ld a,#TK_COMMA
      008D36 8E DA 72         [ 2] 2243 	jp token_char
      000D42                       2244 sharp_tst:
      000D42                       2245 	_case SHARP dash_tst 
      008D39 5C 00            [ 1]    1 	ld a,#SHARP 
      008D3B 02 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3D 8E DD            [ 1]    3 	jrne dash_tst
      008D3F 6B 01            [ 1] 2246 	ld a,#TK_SHARP
      008D41 CC 0E 56         [ 2] 2247 	jp token_char  	 	 
      000D4D                       2248 dash_tst: 	
      000D4D                       2249 	_case '-' at_tst 
      008D41 A6 22            [ 1]    1 	ld a,#'-' 
      008D43 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D45 26 0A            [ 1]    3 	jrne at_tst
      008D47 A6 02            [ 1] 2250 	ld a,#TK_MINUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D49 F7 5C CD         [ 2] 2251 	jp token_char 
      000D58                       2252 at_tst:
      000D58                       2253 	_case '@' qmark_tst 
      008D4C 8B F5            [ 1]    1 	ld a,#'@' 
      008D4E CC 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008D50 DA 05            [ 1]    3 	jrne qmark_tst
      008D51 A6 06            [ 1] 2254 	ld a,#TK_ARRAY 
      008D51 A6 24 11         [ 2] 2255 	jp token_char
      000D63                       2256 qmark_tst:
      000D63                       2257 	_case '?' tick_tst 
      008D54 01 27            [ 1]    1 	ld a,#'?' 
      008D56 17 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D58 26 11            [ 1]    3 	jrne tick_tst
      008D5A 01 26            [ 1] 2258 	ld a,#TK_CMD  
      008D5C 0A               [ 1] 2259 	ld (x),a 
      008D5D A6               [ 1] 2260 	incw x 
      008D5E 84 F7            [ 1] 2261 	ldw y,x 
      008D60 5C CD 8C         [ 2] 2262 	ldw x,#PRT_IDX 
      008D63 94 CC            [ 2] 2263 	ldw (y),x 
      008D65 8E DA 7B 01      [ 2] 2264 	addw y,#2
      008D69 CD 86 A0         [ 2] 2265 	jp token_exit
      000D7B                       2266 tick_tst: ; comment 
      000D7B                       2267 	_case TICK plus_tst 
      008D6C 24 0C            [ 1]    1 	ld a,#TICK 
      008D6E A6 84            [ 1]    2 	cp a,(TCHAR,sp) 
      008D70 F7 5C            [ 1]    3 	jrne plus_tst
      008D72 7B 01            [ 1] 2268 	ld a,#TK_CMD
      008D74 CD               [ 1] 2269 	ld (x),a 
      008D75 8C               [ 1] 2270 	incw x
      008D76 4A CC 8E DA      [ 2] 2271 	ldw y,#REM_IDX
      008D7A FF               [ 2] 2272 	ldw (x),y 
      008D7A A6 28 11         [ 2] 2273 	addw x,#2  
      000D8D                       2274 copy_comment:
      008D7D 01 26 05 A6      [ 2] 2275 	ldw y,#tib 
      008D81 07 CC 8E D6      [ 2] 2276 	addw y,in.w
      008D85 90 89            [ 2] 2277 	pushw y
      008D85 A6 5C 11         [ 4] 2278 	call strcpy
      008D88 01 26 16         [ 2] 2279     subw y,(1,sp)
      008D8B A6 03            [ 1] 2280 	ld a,yl 
      008D8D F7 5C 91         [ 1] 2281 	add a,in
      008D90 D6 01 F7         [ 1] 2282 	ld in,a 
      008D93 5C 90            [ 2] 2283 	ldw (1,sp),x
      008D95 93 72 5C         [ 2] 2284 	addw y,(1,sp)
      008D98 00 02            [ 1] 2285 	incw y 
      000DAC                       2286 	_drop 2 
      008D9A 5F 97            [ 2]    1     addw sp,#2 
      008D9C A6 03 CC         [ 2] 2287 	ldw x,#REM_IDX 
      008D9F 8E DA            [ 1] 2288 	ld a,#TK_CMD 
      008DA1 CC 0E 5A         [ 2] 2289 	jp token_exit 
      000DB6                       2290 plus_tst:
      000DB6                       2291 	_case '+' star_tst 
      008DA1 A6 29            [ 1]    1 	ld a,#'+' 
      008DA3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA5 26 05            [ 1]    3 	jrne star_tst
      008DA7 A6 08            [ 1] 2292 	ld a,#TK_PLUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DA9 CC 8E D6         [ 2] 2293 	jp token_char 
      008DAC                       2294 star_tst:
      000DC1                       2295 	_case '*' slash_tst 
      008DAC A6 3A            [ 1]    1 	ld a,#'*' 
      008DAE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB0 26 05            [ 1]    3 	jrne slash_tst
      008DB2 A6 01            [ 1] 2296 	ld a,#TK_MULT 
      008DB4 CC 8E D6         [ 2] 2297 	jp token_char 
      008DB7                       2298 slash_tst: 
      000DCC                       2299 	_case '/' prcnt_tst 
      008DB7 A6 2C            [ 1]    1 	ld a,#'/' 
      008DB9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBB 26 05            [ 1]    3 	jrne prcnt_tst
      008DBD A6 09            [ 1] 2300 	ld a,#TK_DIV 
      008DBF CC 8E D6         [ 2] 2301 	jp token_char 
      008DC2                       2302 prcnt_tst:
      000DD7                       2303 	_case '%' eql_tst 
      008DC2 A6 23            [ 1]    1 	ld a,#'%' 
      008DC4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC6 26 05            [ 1]    3 	jrne eql_tst
      008DC8 A6 0A            [ 1] 2304 	ld a,#TK_MOD
      008DCA CC 8E D6         [ 2] 2305 	jp token_char  
                                   2306 ; 1 or 2 character tokens 	
      008DCD                       2307 eql_tst:
      000DE2                       2308 	_case '=' gt_tst 		
      008DCD A6 2D            [ 1]    1 	ld a,#'=' 
      008DCF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD1 26 05            [ 1]    3 	jrne gt_tst
      008DD3 A6 11            [ 1] 2309 	ld a,#TK_EQUAL
      008DD5 CC 8E D6         [ 2] 2310 	jp token_char 
      008DD8                       2311 gt_tst:
      000DED                       2312 	_case '>' lt_tst 
      008DD8 A6 40            [ 1]    1 	ld a,#'>' 
      008DDA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDC 26 05            [ 1]    3 	jrne lt_tst
      008DDE A6 06            [ 1] 2313 	ld a,#TK_GT 
      008DE0 CC 8E            [ 1] 2314 	ld (ATTRIB,sp),a 
      008DE2 D6 D6 00         [ 4] 2315 	ld a,([in.w],y)
      008DE3 72 5C 00 01      [ 1] 2316 	inc in 
      008DE3 A6 3F            [ 1] 2317 	cp a,#'=
      008DE5 11 01            [ 1] 2318 	jrne 1$
      008DE7 26 12            [ 1] 2319 	ld a,#TK_GE 
      008DE9 A6 80            [ 2] 2320 	jra token_char  
      008DEB F7 5C            [ 1] 2321 1$: cp a,#'<
      008DED 90 93            [ 1] 2322 	jrne 2$
      008DEF AE 00            [ 1] 2323 	ld a,#TK_NE 
      008DF1 74 90            [ 2] 2324 	jra token_char 
      008DF3 FF 72 A9 00      [ 1] 2325 2$: dec in
      008DF7 02 CC            [ 1] 2326 	ld a,(ATTRIB,sp)
      008DF9 8E DA            [ 2] 2327 	jra token_char 	 
      008DFB                       2328 lt_tst:
      000E16                       2329 	_case '<' other
      008DFB A6 27            [ 1]    1 	ld a,#'<' 
      008DFD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFF 26 35            [ 1]    3 	jrne other
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E01 A6 80            [ 1] 2330 	ld a,#TK_LT 
      008E03 F7 5C            [ 1] 2331 	ld (ATTRIB,sp),a 
      008E05 90 AE 00         [ 4] 2332 	ld a,([in.w],y)
      008E08 8E FF 1C 00      [ 1] 2333 	inc in 
      008E0C 02 3D            [ 1] 2334 	cp a,#'=
      008E0D 26 04            [ 1] 2335 	jrne 1$
      008E0D 90 AE            [ 1] 2336 	ld a,#TK_LE 
      008E0F 16 90            [ 2] 2337 	jra token_char 
      008E11 72 B9            [ 1] 2338 1$: cp a,#'>
      008E13 00 01            [ 1] 2339 	jrne 2$
      008E15 90 89            [ 1] 2340 	ld a,#TK_NE 
      008E17 CD 84            [ 2] 2341 	jra token_char 
      008E19 D0 72 F2 01      [ 1] 2342 2$: dec in 
      008E1D 90 9F            [ 1] 2343 	ld a,(ATTRIB,sp)
      008E1F CB 00            [ 2] 2344 	jra token_char 	
      000E3F                       2345 other: ; not a special character 	 
      008E21 02 C7            [ 1] 2346 	ld a,(TCHAR,sp)
      008E23 00 02 1F         [ 4] 2347 	call is_alpha 
      008E26 01 72            [ 1] 2348 	jrc 30$ 
      008E28 F9 01 90         [ 2] 2349 	jp syntax_error 
      000E49                       2350 30$: 
      008E2B 5C 5B 02         [ 4] 2351 	call parse_keyword
      008E2E AE 00 8E         [ 2] 2352 	cpw x,#remark 
      008E31 A6 80            [ 1] 2353 	jrne token_exit 
      008E33 CC 8E            [ 1] 2354 	ldw y,x 
      008E35 DA 0D 8D         [ 2] 2355 	jp copy_comment 
      008E36                       2356 token_char:
      008E36 A6               [ 1] 2357 	ld (x),a 
      008E37 2B               [ 1] 2358 	incw x
      008E38 11 01            [ 1] 2359 	ldw y,x 
      000E5A                       2360 token_exit:
      000E5A                       2361 	_drop VSIZE 
      008E3A 26 05            [ 2]    1     addw sp,#VSIZE 
      008E3C A6               [ 4] 2362 	ret
                                   2363 
                                   2364 
                                   2365 ;------------------------------------
                                   2366 ; convert alpha to uppercase
                                   2367 ; input:
                                   2368 ;    a  character to convert
                                   2369 ; output:
                                   2370 ;    a  uppercase character
                                   2371 ;------------------------------------
      000E5D                       2372 to_upper::
      008E3D 10 CC            [ 1] 2373 	cp a,#'a
      008E3F 8E D6            [ 1] 2374 	jrpl 1$
      008E41 81               [ 4] 2375 0$:	ret
      008E41 A6 2A            [ 1] 2376 1$: cp a,#'z	
      008E43 11 01            [ 1] 2377 	jrugt 0$
      008E45 26 05            [ 1] 2378 	sub a,#32
      008E47 A6               [ 4] 2379 	ret
                                   2380 	
                                   2381 ;------------------------------------
                                   2382 ; convert pad content in integer
                                   2383 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2384 ;    x		.asciz to convert
                                   2385 ; output:
                                   2386 ;    acc24      int24_t
                                   2387 ;------------------------------------
                                   2388 	; local variables
                           000001  2389 	SIGN=1 ; 1 byte, 
                           000002  2390 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2391 	TEMP=3 ; 1 byte, temporary storage
                           000003  2392 	VSIZE=3 ; 3 bytes reserved for local storage
      000E69                       2393 atoi24::
      008E48 20               [ 2] 2394 	pushw x 
      000E6A                       2395 	_vars VSIZE
      008E49 CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2396 	; acc24=0 
      008E4B D6 5F 00 0B      [ 1] 2397 	clr acc24    
      008E4C 72 5F 00 0C      [ 1] 2398 	clr acc16
      008E4C A6 2F 11 01      [ 1] 2399 	clr acc8 
      008E50 26 05            [ 1] 2400 	clr (SIGN,sp)
      008E52 A6 21            [ 1] 2401 	ld a,#10
      008E54 CC 8E            [ 1] 2402 	ld (BASE,sp),a ; default base decimal
      008E56 D6               [ 1] 2403 	ld a,(x)
      008E57 27 47            [ 1] 2404 	jreq 9$  ; completed if 0
      008E57 A6 25            [ 1] 2405 	cp a,#'-
      008E59 11 01            [ 1] 2406 	jrne 1$
      008E5B 26 05            [ 1] 2407 	cpl (SIGN,sp)
      008E5D A6 22            [ 2] 2408 	jra 2$
      008E5F CC 8E            [ 1] 2409 1$: cp a,#'$
      008E61 D6 06            [ 1] 2410 	jrne 3$
      008E62 A6 10            [ 1] 2411 	ld a,#16
      008E62 A6 3D            [ 1] 2412 	ld (BASE,sp),a
      008E64 11               [ 1] 2413 2$:	incw x
      008E65 01               [ 1] 2414 	ld a,(x)
      000E93                       2415 3$:	
      008E66 26 05            [ 1] 2416 	cp a,#'a
      008E68 A6 32            [ 1] 2417 	jrmi 4$
      008E6A CC 8E            [ 1] 2418 	sub a,#32
      008E6C D6 30            [ 1] 2419 4$:	cp a,#'0
      008E6D 2B 2B            [ 1] 2420 	jrmi 9$
      008E6D A6 3E            [ 1] 2421 	sub a,#'0
      008E6F 11 01            [ 1] 2422 	cp a,#10
      008E71 26 23            [ 1] 2423 	jrmi 5$
      008E73 A6 31            [ 1] 2424 	sub a,#7
      008E75 6B 02            [ 1] 2425 	cp a,(BASE,sp)
      008E77 91 D6            [ 1] 2426 	jrpl 9$
      008E79 01 72            [ 1] 2427 5$:	ld (TEMP,sp),a
      008E7B 5C 00            [ 1] 2428 	ld a,(BASE,sp)
      008E7D 02 A1 3D         [ 4] 2429 	call mulu24_8
      008E80 26 04            [ 1] 2430 	ld a,(TEMP,sp)
      008E82 A6 33 20         [ 1] 2431 	add a,acc24+2
      008E85 50 A1 3C         [ 1] 2432 	ld acc24+2,a
      008E88 26               [ 1] 2433 	clr a
      008E89 04 A6 35         [ 1] 2434 	adc a,acc24+1
      008E8C 20 48 72         [ 1] 2435 	ld acc24+1,a
      008E8F 5A               [ 1] 2436 	clr a
      008E90 00 02 7B         [ 1] 2437 	adc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E93 02 20 40         [ 1] 2438 	ld acc24,a
      008E96 20 C9            [ 2] 2439 	jra 2$
      008E96 A6 3C            [ 1] 2440 9$:	tnz (SIGN,sp)
      008E98 11 01            [ 1] 2441     jreq atoi_exit
      008E9A 26 23 A6         [ 4] 2442     call neg_acc24
      000ECF                       2443 atoi_exit: 
      000ECF                       2444 	_drop VSIZE
      008E9D 34 6B            [ 2]    1     addw sp,#VSIZE 
      008E9F 02               [ 2] 2445 	popw x ; restore x
      008EA0 91               [ 4] 2446 	ret
                                   2447 
                                   2448 
                                   2449 ;------------------------------------
                                   2450 ; skip character c in text starting from 'in'
                                   2451 ; input:
                                   2452 ;	 y 		point to text buffer
                                   2453 ;    a 		character to skip
                                   2454 ; output:  
                                   2455 ;	'in' ajusted to new position
                                   2456 ;------------------------------------
                           000001  2457 	C = 1 ; local var
      000ED3                       2458 skip:
      008EA1 D6               [ 1] 2459 	push a
      008EA2 01 72 5C         [ 4] 2460 1$:	ld a,([in.w],y)
      008EA5 00 02            [ 1] 2461 	jreq 2$
      008EA7 A1 3D            [ 1] 2462 	cp a,(C,sp)
      008EA9 26 04            [ 1] 2463 	jrne 2$
      008EAB A6 36 20 27      [ 1] 2464 	inc in
      008EAF A1 3E            [ 2] 2465 	jra 1$
      000EE3                       2466 2$: _drop 1 
      008EB1 26 04            [ 2]    1     addw sp,#1 
      008EB3 A6               [ 4] 2467 	ret
                                   2468 	
                                   2469 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2470 ;;   TINY BASIC  operators,
                                   2471 ;;   commands and functions 
                                   2472 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2473 
                                   2474 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2475 ;;  Arithmetic operators
                                   2476 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2477 
                                   2478 ;debug support
                           000001  2479 DEBUG_PRT=1
                           000001  2480 .if DEBUG_PRT 
                           000001  2481 	REGA=1
                           000002  2482 	SAVEB=2
                           000003  2483 	REGX=3
                           000005  2484 	REGY=5
                           000007  2485 	ACC24=7
                           000009  2486 	VSIZE=9 
      000EE6                       2487 printxy:
      000EE6                       2488 	_vars VSIZE 
      008EB4 35 20            [ 2]    1     sub sp,#VSIZE 
      008EB6 1F 72            [ 1] 2489 	ld (REGA,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EB8 5A 00 02         [ 1] 2490 	ld a,base 
      008EBB 7B 02            [ 1] 2491 	ld (SAVEB,sp),a
      008EBD 20 17            [ 2] 2492 	ldw (REGX,sp),x
      008EBF 17 05            [ 2] 2493 	ldw (REGY,sp),y
      008EBF 7B 01 CD         [ 2] 2494 	ldw x,acc24 
      008EC2 86 8F 25         [ 1] 2495 	ld a,acc8 
      008EC5 03 CC            [ 2] 2496 	ldw (ACC24,sp),x 
      008EC7 89 9C            [ 1] 2497 	ld (ACC24+2,sp),a 
      008EC9 35 10 00 0A      [ 1] 2498 	mov base,#16 
      008EC9 CD               [ 1] 2499 	clrw x 
      008ECA 8C D1            [ 1] 2500 	ld a,(REGA,sp)
      008ECC A3               [ 1] 2501 	ld xl,a 
      008ECD 97 52 26         [ 4] 2502 	call print_int
      008ED0 09 90            [ 1] 2503 	ld a,#SPACE 
      008ED2 93 CC 8E         [ 4] 2504 	call putc  
      008ED5 0D 03            [ 2] 2505 	ldw x,(REGX,sp)
      008ED6 CD 0A 6F         [ 4] 2506 	call print_int 
      008ED6 F7 5C            [ 1] 2507 	ld a,#SPACE 
      008ED8 90 93 2B         [ 4] 2508 	call putc  
      008EDA 1E 05            [ 2] 2509 	ldw x,(REGY,sp)
      008EDA 5B 02 81         [ 4] 2510 	call print_int 
      008EDD A6 0D            [ 1] 2511 	ld a,#CR 
      008EDD A1 61 2A         [ 4] 2512 	call putc 
      008EE0 01 81            [ 1] 2513 	ld a,(ACC24+2,sp)
      008EE2 A1 7A            [ 2] 2514 	ldw x,(ACC24,sp)
      008EE4 22 FB A0         [ 2] 2515 	ldw acc24,x 
      008EE7 20 81 0D         [ 1] 2516 	ld acc8,a
      008EE9 7B 02            [ 1] 2517 	ld a,(SAVEB,sp)
      008EE9 89 52 03         [ 1] 2518 	ld base,a 
      008EEC 72 5F            [ 1] 2519 	ld a,(REGA,sp)
      008EEE 00 0C            [ 2] 2520 	ldw x,(REGX,sp)
      008EF0 72 5F            [ 2] 2521 	ldw y,(REGY,sp)
      000F36                       2522 	_drop VSIZE 
      008EF2 00 0D            [ 2]    1     addw sp,#VSIZE 
      008EF4 72               [ 4] 2523 	ret 
                                   2524 .endif 
                                   2525 
                                   2526 
                                   2527 ;--------------------------------------
                                   2528 ;  multiply 2 uint16_t return uint32_t
                                   2529 ;  input:
                                   2530 ;     x       uint16_t 
                                   2531 ;     y       uint16_t 
                                   2532 ;  output:
                                   2533 ;     x       product bits 15..0
                                   2534 ;     y       product bits 31..16 
                                   2535 ;---------------------------------------
                           000001  2536 		U1=1  ; uint16_t 
                           000003  2537 		DBL=3 ; uint32_t
                           000006  2538 		VSIZE=6
      000F39                       2539 umstar:
      000F39                       2540 	_vars VSIZE 
      008EF5 5F 00            [ 2]    1     sub sp,#VSIZE 
      008EF7 0E 0F            [ 2] 2541 	ldw (U1,sp),x 
                                   2542 ;initialize bits 31..16 of 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2543 ;product to zero 
      008EF9 01 A6            [ 1] 2544 	clr (DBL,sp)
      008EFB 0A 6B            [ 1] 2545 	clr (DBL+1,sp)
                                   2546 ; produc U1L*U2L 
      008EFD 02 F6            [ 1] 2547 	ld a,yl 
      008EFF 27               [ 4] 2548 	mul x,a 
      008F00 47 A1            [ 2] 2549 	ldw (DBL+2,sp),x
                                   2550 ; product U1H*U2L 
      008F02 2D 26            [ 1] 2551 	ld a,(U1,sp) ; xh 
      008F04 04               [ 1] 2552 	ldw x,y
      008F05 03               [ 4] 2553 	mul x,a 
      008F06 01               [ 1] 2554 	clr a 
      008F07 20 08 A1         [ 2] 2555 	addw x,(DBL+1,sp) 
      008F0A 24               [ 1] 2556 	clr a 
      008F0B 26 06            [ 1] 2557 	adc a,(DBL,sp) 
      008F0D A6 10            [ 1] 2558 	ld (DBL,sp),a ; bits 23..17 
      008F0F 6B 02            [ 2] 2559 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2560 ; product U1L*U2H
      008F11 5C F6            [ 1] 2561 	swapw y 
      008F13 93               [ 1] 2562 	ldw x,y
      008F13 A1 61            [ 1] 2563 	ld a,(U1+1,sp)
      008F15 2B               [ 4] 2564 	mul x,a
      008F16 02 A0 20         [ 2] 2565 	addw x,(DBL+1,sp)
      008F19 A1               [ 1] 2566 	clr a 
      008F1A 30 2B            [ 1] 2567 	adc a,(DBL,sp)
      008F1C 2B A0            [ 1] 2568 	ld (DBL,sp),a 
      008F1E 30 A1            [ 2] 2569 	ldw (DBL+1,sp),x 
                                   2570 ; product U1H*U2H 	
      008F20 0A 2B            [ 1] 2571 	ld a,(U1,sp)
      008F22 06               [ 1] 2572 	ldw x,y  
      008F23 A0               [ 4] 2573 	mul x,a 
      008F24 07 11 02         [ 2] 2574 	addw x,(DBL,sp)
      008F27 2A 1F            [ 1] 2575 	ldw y,x 
      008F29 6B 03            [ 2] 2576 	ldw x,(DBL+2,sp)
      000F70                       2577 	_drop VSIZE 
      008F2B 7B 02            [ 2]    1     addw sp,#VSIZE 
      008F2D CD               [ 4] 2578 	ret
                                   2579 
                                   2580 
                                   2581 ;-------------------------------------
                                   2582 ; multiply 2 integers
                                   2583 ; input:
                                   2584 ;  	x       n1 
                                   2585 ;   y 		n2 
                                   2586 ; output:
                                   2587 ;	X        N1*N2 bits 15..0
                                   2588 ;   Y        N1*N2 bits 31..16 
                                   2589 ;-------------------------------------
                           000001  2590 	SIGN=1
                           000001  2591 	VSIZE=1
      000F73                       2592 multiply:
      000F73                       2593 	_vars VSIZE 
      008F2E 8B 98            [ 2]    1     sub sp,#VSIZE 
      008F30 7B 03            [ 1] 2594 	clr (SIGN,sp)
      008F32 CB               [ 1] 2595 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F33 00 0E            [ 1] 2596 	and a,#0x80
      008F35 C7 00            [ 1] 2597 	jrpl 1$
      008F37 0E 4F            [ 1] 2598 	cpl (SIGN,sp)
      008F39 C9               [ 2] 2599 	negw x 
      000F7F                       2600 1$:	
      008F3A 00 0D            [ 1] 2601 	ld a,yh
      008F3C C7 00            [ 1] 2602 	and a,#0x80  
      008F3E 0D 4F            [ 1] 2603 	jrpl 2$ 
      008F40 C9 00            [ 1] 2604 	cpl (SIGN,sp)
      008F42 0C C7            [ 2] 2605 	negw y 
      000F89                       2606 2$:	
      008F44 00 0C 20         [ 4] 2607 	call umstar
      008F47 C9 0D            [ 1] 2608 	ld a,(SIGN,sp)
      008F49 01 27            [ 1] 2609 	jreq 3$
      008F4B 03 CD 8B         [ 4] 2610 	call dneg 
      000F93                       2611 3$:	
      000F93                       2612 	_drop VSIZE 
      008F4E D2 01            [ 2]    1     addw sp,#VSIZE 
      008F4F 81               [ 4] 2613 	ret
                                   2614 
                                   2615 ;--------------------------------------
                                   2616 ; divide uint32_t/uint16_t
                                   2617 ; return:  quotient and remainder 
                                   2618 ; quotient expected to be uint16_t 
                                   2619 ; input:
                                   2620 ;   DBLDIVDND    on stack 
                                   2621 ;   X            divisor 
                                   2622 ; output:
                                   2623 ;   X            quotient 
                                   2624 ;   Y            remainder 
                                   2625 ;---------------------------------------
                           000003  2626 	VSIZE=3
      000F96                       2627 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F96                       2628 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2629 	; local variables 
                           000001  2630 	DIVISOR=1 
                           000003  2631 	CNTR=3 
      000F96                       2632 udiv32_16:
      000F96                       2633 	_vars VSIZE 
      008F4F 5B 03            [ 2]    1     sub sp,#VSIZE 
      008F51 85 81            [ 2] 2634 	ldw (DIVISOR,sp),x	; save divisor 
      008F53 1E 08            [ 2] 2635 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008F53 88 91            [ 2] 2636 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008F55 D6 01            [ 2] 2637 	tnzw y
      008F57 27 0A            [ 1] 2638 	jrne long_division 
      008F59 11 01            [ 2] 2639 	ldw y,(DIVISOR,sp)
      008F5B 26               [ 2] 2640 	divw x,y
      000FA5                       2641 	_drop VSIZE 
      008F5C 06 72            [ 2]    1     addw sp,#VSIZE 
      008F5E 5C               [ 4] 2642 	ret
      000FA8                       2643 long_division:
      008F5F 00               [ 1] 2644 	exgw x,y ; hi in x, lo in y 
      008F60 02 20            [ 1] 2645 	ld a,#17 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F62 F1 5B            [ 1] 2646 	ld (CNTR,sp),a
      000FAD                       2647 1$:
      008F64 01 81            [ 2] 2648 	cpw x,(DIVISOR,sp)
      008F66 2B 03            [ 1] 2649 	jrmi 2$
      008F66 52 09 6B         [ 2] 2650 	subw x,(DIVISOR,sp)
      008F69 01               [ 1] 2651 2$:	ccf 
      008F6A C6 00            [ 2] 2652 	rlcw y 
      008F6C 0B               [ 2] 2653 	rlcw x 
      008F6D 6B 02            [ 1] 2654 	dec (CNTR,sp)
      008F6F 1F 03            [ 1] 2655 	jrne 1$
      008F71 17               [ 1] 2656 	exgw x,y 
      000FBD                       2657 	_drop VSIZE 
      008F72 05 CE            [ 2]    1     addw sp,#VSIZE 
      008F74 00               [ 4] 2658 	ret
                                   2659 
                                   2660 ;-----------------------------
                                   2661 ; negate double int.
                                   2662 ; input:
                                   2663 ;   x     bits 15..0
                                   2664 ;   y     bits 31..16
                                   2665 ; output: 
                                   2666 ;   x     bits 15..0
                                   2667 ;   y     bits 31..16
                                   2668 ;-----------------------------
      000FC0                       2669 dneg:
      008F75 0C               [ 2] 2670 	cplw x 
      008F76 C6 00            [ 2] 2671 	cplw y 
      008F78 0E 1F 07         [ 2] 2672 	addw x,#1 
      008F7B 6B 09            [ 1] 2673 	jrnc 1$
      008F7D 35 10            [ 1] 2674 	incw y 
      008F7F 00               [ 4] 2675 1$: ret 
                                   2676 
                                   2677 
                                   2678 ;--------------------------------
                                   2679 ; sign extend single to double
                                   2680 ; input:
                                   2681 ;   x    int16_t
                                   2682 ; output:
                                   2683 ;   x    int32_t bits 15..0
                                   2684 ;   y    int32_t bits 31..16
                                   2685 ;--------------------------------
      000FCB                       2686 dbl_sign_extend:
      008F80 0B 5F            [ 1] 2687 	clrw y
      008F82 7B               [ 1] 2688 	ld a,xh 
      008F83 01 97            [ 1] 2689 	and a,#0x80 
      008F85 CD 8A            [ 1] 2690 	jreq 1$
      008F87 EF A6            [ 2] 2691 	cplw y
      008F89 20               [ 4] 2692 1$: ret 	
                                   2693 
                                   2694 
                                   2695 ;----------------------------------
                                   2696 ;  euclidian divide dbl/n1 
                                   2697 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2698 ; input:
                                   2699 ;    dbl    int32_t on stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2700 ;    x 		n1   int16_t  disivor  
                                   2701 ; output:
                                   2702 ;    X      dbl/x  int16_t 
                                   2703 ;    Y      remainder int16_t 
                                   2704 ;----------------------------------
                           000008  2705 	VSIZE=8
      000FD5                       2706 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000FD5                       2707 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000FD5                       2708 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2709 	; local variables
                           000001  2710 	DBLHI=1
                           000003  2711 	DBLLO=3 
                           000005  2712 	SDIVSR=5 ; sign divisor
                           000006  2713 	SQUOT=6 ; sign dividend 
                           000007  2714 	DIVISR=7 ; divisor 
      000FD5                       2715 div32_16:
      000FD5                       2716 	_vars VSIZE 
      008F8A CD 83            [ 2]    1     sub sp,#VSIZE 
      008F8C AB 1E            [ 1] 2717 	clr (SDIVSR,sp)
      008F8E 03 CD            [ 1] 2718 	clr (SQUOT,sp)
                                   2719 ; copy arguments 
      008F90 8A EF            [ 2] 2720 	ldw y,(DIVDNDHI,sp)
      008F92 A6 20            [ 2] 2721 	ldw (DBLHI,sp),y
      008F94 CD 83            [ 2] 2722 	ldw y,(DIVDNDLO,sp)
      008F96 AB 1E            [ 2] 2723 	ldw (DBLLO,sp),y 
                                   2724 ; check for 0 divisor
      008F98 05               [ 2] 2725 	tnzw x 
      008F99 CD 8A            [ 1] 2726     jrne 0$
      008F9B EF A6            [ 1] 2727 	ld a,#ERR_DIV0 
      008F9D 0D CD 83         [ 2] 2728 	jp tb_error 
                                   2729 ; check divisor sign 	
      008FA0 AB               [ 1] 2730 0$:	ld a,xh 
      008FA1 7B 09            [ 1] 2731 	and a,#0x80 
      008FA3 1E 07            [ 1] 2732 	jreq 1$
      008FA5 CF 00            [ 1] 2733 	cpl (SDIVSR,sp)
      008FA7 0C C7            [ 1] 2734 	cpl (SQUOT,sp)
      008FA9 00               [ 2] 2735 	negw x
      008FAA 0E 7B            [ 2] 2736 1$:	ldw (DIVISR,sp),x
                                   2737 ; check dividend sign 	 
      008FAC 02 C7            [ 1] 2738  	ld a,(DBLHI,sp) 
      008FAE 00 0B            [ 1] 2739 	and a,#0x80 
      008FB0 7B 01            [ 1] 2740 	jreq 2$ 
      008FB2 1E 03            [ 1] 2741 	cpl (SQUOT,sp)
      008FB4 16 05            [ 2] 2742 	ldw x,(DBLLO,sp)
      008FB6 5B 09            [ 2] 2743 	ldw y,(DBLHI,sp)
      008FB8 81 0F C0         [ 4] 2744 	call dneg 
      008FB9 1F 03            [ 2] 2745 	ldw (DBLLO,sp),x 
      008FB9 52 06            [ 2] 2746 	ldw (DBLHI,sp),y 
      008FBB 1F 01            [ 2] 2747 2$:	ldw x,(DIVISR,sp)
      008FBD 0F 03 0F         [ 4] 2748 	call udiv32_16
      008FC0 04 90            [ 2] 2749 	tnzw y 
      008FC2 9F 42            [ 1] 2750 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2751 ; x=quotient 
                                   2752 ; y=remainder 
                                   2753 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008FC4 1F 05            [ 1] 2754 	ld a,(SQUOT,sp)
      008FC6 7B 01            [ 1] 2755 	xor a,(SDIVSR,sp)
      008FC8 93 42            [ 1] 2756 	jreq 3$
      008FCA 4F               [ 1] 2757 	incw x 
      008FCB 72 FB 04 4F      [ 2] 2758 	ldw acc16,y 
      008FCF 19 03            [ 2] 2759 	ldw y,(DIVISR,sp)
      008FD1 6B 03 1F 04      [ 2] 2760 	subw y,acc16
                                   2761 ; sign quotient
      008FD5 90 5E            [ 1] 2762 3$:	ld a,(SQUOT,sp)
      008FD7 93 7B            [ 1] 2763 	jreq 4$
      008FD9 02               [ 2] 2764 	negw x 
      001029                       2765 4$:	
      001029                       2766 	_drop VSIZE 
      008FDA 42 72            [ 2]    1     addw sp,#VSIZE 
      008FDC FB               [ 4] 2767 	ret 
                                   2768 
                                   2769 
                                   2770 
                                   2771 ;----------------------------------
                                   2772 ; division x/y 
                                   2773 ; input:
                                   2774 ;    X       dividend
                                   2775 ;    Y       divisor 
                                   2776 ; output:
                                   2777 ;    X       quotient
                                   2778 ;    Y       remainder 
                                   2779 ;-----------------------------------
                           000004  2780 	VSIZE=4 
                                   2781 	; local variables 
                           000001  2782 	DBLHI=1
                           000003  2783 	DBLLO=3
      00102C                       2784 divide: 
      00102C                       2785 	_vars VSIZE 
      008FDD 04 4F            [ 2]    1     sub sp,#VSIZE 
      008FDF 19 03 6B 03      [ 2] 2786 	ldw acc16,y
      008FE3 1F 04 7B         [ 4] 2787 	call dbl_sign_extend
      008FE6 01 93            [ 2] 2788 	ldw (DBLLO,sp),x 
      008FE8 42 72            [ 2] 2789 	ldw (DBLHI,sp),y 
      008FEA FB 03 90         [ 2] 2790 	ldw x,acc16 
      008FED 93 1E 05         [ 4] 2791 	call div32_16 
      00103F                       2792 	_drop VSIZE 
      008FF0 5B 06            [ 2]    1     addw sp,#VSIZE 
      008FF2 81               [ 4] 2793 	ret
                                   2794 
                                   2795 
                                   2796 ;----------------------------------
                                   2797 ;  remainder resulting from euclidian 
                                   2798 ;  division of x/y 
                                   2799 ; input:
                                   2800 ;   x   	dividend int16_t 
                                   2801 ;   y 		divisor int16_t
                                   2802 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2803 ;   X       n1%n2 
                                   2804 ;----------------------------------
      008FF3                       2805 modulo:
      008FF3 52 01 0F         [ 4] 2806 	call divide
      008FF6 01               [ 1] 2807 	ldw x,y 
      008FF7 9E               [ 4] 2808 	ret 
                                   2809 
                                   2810 ;----------------------------------
                                   2811 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2812 ; return expr1*expr2/expr3 
                                   2813 ; product result is int32_t and 
                                   2814 ; divisiont is int32_t/int16_t
                                   2815 ;----------------------------------
                           000004  2816 	DBL_SIZE=4 
      001047                       2817 muldiv:
      008FF8 A4 80 2A         [ 4] 2818 	call func_args 
      008FFB 03 03            [ 1] 2819 	cp a,#3 
      008FFD 01 50            [ 1] 2820 	jreq 1$
      008FFF CC 09 1C         [ 2] 2821 	jp syntax_error
      001051                       2822 1$: 
      008FFF 90 9E            [ 2] 2823 	ldw x,(5,sp) ; expr1
      009001 A4 80            [ 2] 2824 	ldw y,(3,sp) ; expr2
      009003 2A 04 03         [ 4] 2825 	call multiply 
      009006 01 90            [ 2] 2826 	ldw (5,sp),x  ;int32_t 15..0
      009008 50 03            [ 2] 2827 	ldw (3,sp),y  ;int32_t 31..16
      009009 85               [ 2] 2828 	popw x        ; expr3 
      009009 CD 8F B9         [ 4] 2829 	call div32_16 ; int32_t/expr3 
      001060                       2830 	_drop DBL_SIZE
      00900C 7B 01            [ 2]    1     addw sp,#DBL_SIZE 
      00900E 27               [ 4] 2831 	ret 
                                   2832 
                                   2833 
                                   2834 ;----------------------------------
                                   2835 ; search in kword_dict name
                                   2836 ; from its execution address 
                                   2837 ; input:
                                   2838 ;   X       	cmd_index 
                                   2839 ; output:
                                   2840 ;   X 			cstr*  | 0 
                                   2841 ;--------------------------------
                           000001  2842 	CMDX=1 
                           000003  2843 	LINK=3 
                           000004  2844 	VSIZE=4
      001063                       2845 cmd_name:
      001063                       2846 	_vars VSIZE 
      00900F 03 CD            [ 2]    1     sub sp,#VSIZE 
      009011 90 40 00 0C      [ 1] 2847 	clr acc16 
      009013 1F 01            [ 2] 2848 	ldw (CMDX,sp),x  
      009013 5B 01 81         [ 2] 2849 	ldw x,#kword_dict	
      009016 1F 03            [ 2] 2850 1$:	ldw (LINK,sp),x
      009016 52 03            [ 1] 2851 	ld a,(2,x)
      009018 1F 01            [ 1] 2852 	and a,#15 
      00901A 1E 08 16         [ 1] 2853 	ld acc8,a 
      00901D 06 90 5D         [ 2] 2854 	addw x,#3
      009020 26 06 16 01      [ 2] 2855 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009024 65               [ 2] 2856 	ldw x,(x) ; command index  
      009025 5B 03            [ 2] 2857 	cpw x,(CMDX,sp)
      009027 81 0A            [ 1] 2858 	jreq 2$
      009028 1E 03            [ 2] 2859 	ldw x,(LINK,sp)
      009028 51               [ 2] 2860 	ldw x,(x) 
      009029 A6 11 6B         [ 2] 2861 	subw x,#2  
      00902C 03 E3            [ 1] 2862 	jrne 1$
      00902D 20 05            [ 2] 2863 	jra 9$
      00902D 13 01            [ 2] 2864 2$: ldw x,(LINK,sp)
      00902F 2B 03 72         [ 2] 2865 	addw x,#2 	
      001092                       2866 9$:	_drop VSIZE
      009032 F0 01            [ 2]    1     addw sp,#VSIZE 
      009034 8C               [ 4] 2867 	ret
                                   2868 
                                   2869 
                                   2870 ;---------------------------------
                                   2871 ; dictionary search 
                                   2872 ; input:
                                   2873 ;	X 		dictionary entry point, name field  
                                   2874 ;   y		.asciz name to search 
                                   2875 ; output:
                                   2876 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2877 ;  X		cmd_index ; execution address | 0 
                                   2878 ;---------------------------------
                           000001  2879 	NLEN=1 ; cmd length 
                           000002  2880 	XSAVE=2
                           000004  2881 	YSAVE=4
                           000005  2882 	VSIZE=5 
      001095                       2883 search_dict:
      001095                       2884 	_vars VSIZE 
      009035 90 59            [ 2]    1     sub sp,#VSIZE 
                                   2885 
      009037 59 0A            [ 2] 2886 	ldw (YSAVE,sp),y 
      001099                       2887 search_next:
      009039 03 26            [ 2] 2888 	ldw (XSAVE,sp),x 
                                   2889 ; get name length in dictionary	
      00903B F1               [ 1] 2890 	ld a,(x)
      00903C 51 5B            [ 1] 2891 	and a,#0xf 
      00903E 03 81            [ 1] 2892 	ld (NLEN,sp),a  
      009040 16 04            [ 2] 2893 	ldw y,(YSAVE,sp) ; name pointer 
      009040 53               [ 1] 2894 	incw x 
      0010A3                       2895 cp_loop:
      009041 90 53            [ 1] 2896 	ld a,(y)
      009043 1C 00            [ 1] 2897 	jreq str_match 
      009045 01 24            [ 1] 2898 	tnz (NLEN,sp)
      009047 02 90            [ 1] 2899 	jreq no_match  
      009049 5C               [ 1] 2900 	cp a,(x)
      00904A 81 07            [ 1] 2901 	jrne no_match 
      00904B 90 5C            [ 1] 2902 	incw y 
      00904B 90               [ 1] 2903 	incw x
      00904C 5F 9E            [ 1] 2904 	dec (NLEN,sp)
      00904E A4 80            [ 2] 2905 	jra cp_loop 
      0010B5                       2906 no_match:
      009050 27 02            [ 2] 2907 	ldw x,(XSAVE,sp) 
      009052 90 53 81         [ 2] 2908 	subw x,#2 ; move X to link field
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009055 4B 00            [ 1] 2909 	push #TK_NONE 
      009055 52               [ 2] 2910 	ldw x,(x) ; next word link 
      009056 08               [ 1] 2911 	pop a ; TK_NONE 
      009057 0F 05            [ 1] 2912 	jreq search_exit  ; not found  
                                   2913 ;try next 
      009059 0F 06            [ 2] 2914 	jra search_next
      0010C2                       2915 str_match:
      00905B 16 0B            [ 2] 2916 	ldw x,(XSAVE,sp)
      00905D 17               [ 1] 2917 	ld a,(X)
      00905E 01 16            [ 1] 2918 	ld (NLEN,sp),a ; needed to test keyword type  
      009060 0D 17            [ 1] 2919 	and a,#0xf 
                                   2920 ; move x to procedure address field 	
      009062 03               [ 1] 2921 	inc a 
      009063 5D 26 05         [ 1] 2922 	ld acc8,a 
      009066 A6 04 CC 89      [ 1] 2923 	clr acc16 
      00906A 9E 9E A4 80      [ 2] 2924 	addw x,acc16 
      00906E 27               [ 2] 2925 	ldw x,(x) ; routine index  
                                   2926 ;determine keyword type bits 7:6 
      00906F 05 03            [ 1] 2927 	ld a,(NLEN,sp)
      009071 05               [ 1] 2928 	swap a 
      009072 03 06            [ 1] 2929 	and a,#0xc
      009074 50               [ 1] 2930 	srl a
      009075 1F               [ 1] 2931 	srl a 
      009076 07 7B            [ 1] 2932 	add a,#128
      0010DF                       2933 search_exit: 
      0010DF                       2934 	_drop VSIZE 	 
      009078 01 A4            [ 2]    1     addw sp,#VSIZE 
      00907A 80               [ 4] 2935 	ret 
                                   2936 
                                   2937 ;---------------------
                                   2938 ; check if next token
                                   2939 ;  is of expected type 
                                   2940 ; input:
                                   2941 ;   A 		 expected token attribute
                                   2942 ;  ouput:
                                   2943 ;   none     if fail call syntax_error 
                                   2944 ;--------------------
      0010E2                       2945 expect:
      00907B 27               [ 1] 2946 	push a 
      00907C 0D 03 06         [ 4] 2947 	call next_token 
      00907F 1E 03            [ 1] 2948 	cp a,(1,sp)
      009081 16 01            [ 1] 2949 	jreq 1$
      009083 CD 90 40         [ 2] 2950 	jp syntax_error
      009086 1F               [ 1] 2951 1$: pop a 
      009087 03               [ 4] 2952 	ret 
                                   2953 
                                   2954 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2955 ; parse arguments list 
                                   2956 ; between ()
                                   2957 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010EF                       2958 func_args:
      009088 17 01            [ 1] 2959 	ld a,#TK_LPAREN 
      00908A 1E 07 CD         [ 4] 2960 	call expect 
                                   2961 ; expected to continue in arg_list 
                                   2962 ; caller must check for TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2963 
                                   2964 ;-------------------------------
                                   2965 ; parse embedded BASIC routines 
                                   2966 ; arguments list.
                                   2967 ; arg_list::=  rel[','rel]*
                                   2968 ; all arguments are of integer type
                                   2969 ; and pushed on stack 
                                   2970 ; input:
                                   2971 ;   none
                                   2972 ; output:
                                   2973 ;   stack{n}   arguments pushed on stack
                                   2974 ;   A 	number of arguments pushed on stack  
                                   2975 ;--------------------------------
      0010F4                       2976 arg_list:
      00908D 90 16            [ 1] 2977 	push #0  
      00908F 90 5D 27         [ 4] 2978 1$: call relation
      009092 11 7B            [ 1] 2979 	cp a,#TK_NONE 
      009094 06 18            [ 1] 2980 	jreq 5$
      009096 05 27            [ 1] 2981 	cp a,#TK_INTGR
      009098 0B 5C            [ 1] 2982 	jrne 4$
      001101                       2983 3$: 
                                   2984 ; swap return address with argument
      00909A 90               [ 1] 2985 	pop a ; arg_count
      00909B CF 00            [ 2] 2986 	popw y ; return address 
      00909D 0D               [ 2] 2987 	pushw x ; new argument 
      00909E 16 07            [ 2] 2988 	pushw y 
      0090A0 72               [ 1] 2989     inc a
      0090A1 B2               [ 1] 2990 	push a 
      0090A2 00 0D 7B         [ 4] 2991 	call next_token 
      0090A5 06 27            [ 1] 2992 	cp a,#TK_COMMA 
      0090A7 01 50            [ 1] 2993 	jreq 1$ 
      0090A9 A1 00            [ 1] 2994 	cp a,#TK_NONE 
      0090A9 5B 08            [ 1] 2995 	jreq 5$ 
      0090AB 81 08            [ 1] 2996 4$:	cp a,#TK_RPAREN 
      0090AC 27 05            [ 1] 2997 	jreq 5$
      001118                       2998 	_unget_token 
      0090AC 52 04 90 CF 00   [ 1]    1      mov in,in.saved  
      0090B1 0D               [ 1] 2999 5$:	pop a  
      0090B2 CD               [ 4] 3000 	ret 
                                   3001 
                                   3002 ;--------------------------------
                                   3003 ;   BASIC commnands 
                                   3004 ;--------------------------------
                                   3005 
                                   3006 ;--------------------------------
                                   3007 ;  arithmetic and relational 
                                   3008 ;  routines
                                   3009 ;  operators precedence
                                   3010 ;  highest to lowest
                                   3011 ;  operators on same row have 
                                   3012 ;  same precedence and are executed
                                   3013 ;  from left to right.
                                   3014 ;	'*','/','%'
                                   3015 ;   '-','+'
                                   3016 ;   '=','>','<','>=','<=','<>','><'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3017 ;   '<>' and '><' are equivalent for not equal.
                                   3018 ;--------------------------------
                                   3019 
                                   3020 ;---------------------
                                   3021 ; return array element
                                   3022 ; address from @(expr)
                                   3023 ; input:
                                   3024 ;   A 		TK_ARRAY
                                   3025 ; output:
                                   3026 ;   A 		TK_INTGR
                                   3027 ;	X 		element address 
                                   3028 ;----------------------
      00111F                       3029 get_array_element:
      0090B3 90 4B 1F         [ 4] 3030 	call func_args 
      0090B6 03 17            [ 1] 3031 	cp a,#1
      0090B8 01 CE            [ 1] 3032 	jreq 1$
      0090BA 00 0D CD         [ 2] 3033 	jp syntax_error
      0090BD 90               [ 2] 3034 1$: popw x 
                                   3035 	; check for bounds 
      0090BE 55 5B 04         [ 2] 3036 	cpw x,array_size 
      0090C1 81 05            [ 2] 3037 	jrule 3$
                                   3038 ; bounds {1..array_size}	
      0090C2 A6 0A            [ 1] 3039 2$: ld a,#ERR_BAD_VALUE 
      0090C2 CD 90 AC         [ 2] 3040 	jp tb_error 
      0090C5 93               [ 2] 3041 3$: tnzw  x
      0090C6 81 F8            [ 1] 3042 	jreq 2$ 
      0090C7 58               [ 2] 3043 	sllw x 
      0090C7 CD               [ 2] 3044 	pushw x 
      0090C8 91 6F A1         [ 2] 3045 	ldw x,#tib
      0090CB 03 27 03         [ 2] 3046 	subw x,(1,sp)
      00113F                       3047 	_drop 2   
      0090CE CC 89            [ 2]    1     addw sp,#2 
      0090D0 9C 84            [ 1] 3048 	ld a,#TK_INTGR
      0090D1 81               [ 4] 3049 	ret 
                                   3050 
                                   3051 
                                   3052 ;***********************************
                                   3053 ;   expression parse,execute 
                                   3054 ;***********************************
                                   3055 ;-----------------------------------
                                   3056 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3057 ;			 integer | function |
                                   3058 ;			 '('relation')' 
                                   3059 ; output:
                                   3060 ;   A    token attribute 
                                   3061 ;   X 	 integer
                                   3062 ; ---------------------------------
                           000001  3063 	NEG=1
                           000001  3064 	VSIZE=1
      001144                       3065 factor:
      001144                       3066 	_vars VSIZE 
      0090D1 1E 05            [ 2]    1     sub sp,#VSIZE 
      0090D3 16 03 CD         [ 4] 3067 	call next_token
      0090D6 8F F3            [ 1] 3068 	cp a,#CMD_END  
      0090D8 1F 05            [ 1] 3069 	jrult 16$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090DA 17 03            [ 1] 3070 1$:	ld (NEG,sp),a 
      0090DC 85 CD            [ 1] 3071 	and a,#TK_GRP_MASK
      0090DE 90 55            [ 1] 3072 	cp a,#TK_GRP_ADD 
      0090E0 5B 04            [ 1] 3073 	jreq 2$
      0090E2 81 01            [ 1] 3074 	ld a,(NEG,sp)
      0090E3 20 03            [ 2] 3075 	jra 4$  
      001159                       3076 2$:	
      0090E3 52 04 72         [ 4] 3077 	call next_token 
      00115C                       3078 4$:	
      0090E6 5F 00            [ 1] 3079 	cp a,#TK_IFUNC 
      0090E8 0D 1F            [ 1] 3080 	jrne 5$ 
      0090EA 01               [ 4] 3081 	call (x) 
      0090EB AE A9            [ 2] 3082 	jra 18$ 
      001163                       3083 5$:
      0090ED 25 1F            [ 1] 3084 	cp a,#TK_INTGR
      0090EF 03 E6            [ 1] 3085 	jrne 6$
      0090F1 02 A4            [ 2] 3086 	jra 18$
      001169                       3087 6$:
      0090F3 0F C7            [ 1] 3088 	cp a,#TK_ARRAY
      0090F5 00 0E            [ 1] 3089 	jrne 10$
      0090F7 1C 00 03         [ 4] 3090 	call get_array_element
      0090FA 72               [ 2] 3091 	ldw x,(x)
      0090FB BB 00            [ 2] 3092 	jra 18$ 
      001173                       3093 10$:
      0090FD 0D FE            [ 1] 3094 	cp a,#TK_VAR 
      0090FF 13 01            [ 1] 3095 	jrne 12$
      009101 27               [ 2] 3096 	ldw x,(x)
      009102 0A 1E            [ 2] 3097 	jra 18$
      00117A                       3098 12$:			
      009104 03 FE            [ 1] 3099 	cp a,#TK_LPAREN
      009106 1D 00            [ 1] 3100 	jrne 16$
      009108 02 26 E3         [ 4] 3101 	call relation
      00910B 20               [ 2] 3102 	pushw x 
      00910C 05 1E            [ 1] 3103 	ld a,#TK_RPAREN 
      00910E 03 1C 00         [ 4] 3104 	call expect
      009111 02               [ 2] 3105 	popw x 
      009112 5B 04            [ 2] 3106 	jra 18$	
      00118A                       3107 16$:
      009114 81               [ 1] 3108 	tnz a 
      009115 27 11            [ 1] 3109 	jreq 20$ 
      00118D                       3110 	_unget_token
      009115 52 05 17 04 01   [ 1]    1      mov in,in.saved  
      009119 4F               [ 1] 3111 	clr a 
      009119 1F 02            [ 2] 3112 	jra 20$ 
      001195                       3113 18$: 
      00911B F6 A4            [ 1] 3114 	ld a,#TK_MINUS 
      00911D 0F 6B            [ 1] 3115 	cp a,(NEG,sp)
      00911F 01 16            [ 1] 3116 	jrne 19$
      009121 04               [ 2] 3117 	negw x
      00119C                       3118 19$:
      009122 5C 84            [ 1] 3119 	ld a,#TK_INTGR
      009123                       3120 20$:
      00119E                       3121 	_drop VSIZE
      009123 90 F6            [ 2]    1     addw sp,#VSIZE 
      009125 27               [ 4] 3122 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3123 
                                   3124 ;-----------------------------------
                                   3125 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3126 ; output:
                                   3127 ;   A    	token attribute 
                                   3128 ;	X		integer
                                   3129 ;-----------------------------------
                           000001  3130 	N1=1   ; int16_t
                           000003  3131 	MULOP=3
                           000003  3132 	VSIZE=3
      0011A1                       3133 term:
      0011A1                       3134 	_vars VSIZE
      009126 1B 0D            [ 2]    1     sub sp,#VSIZE 
      009128 01 27 0A         [ 4] 3135 	call factor
      00912B F1               [ 1] 3136 	tnz a 
      00912C 26 07            [ 1] 3137 	jreq term_exit 
      0011A9                       3138 term01:	 ; check for  operator 
      00912E 90 5C            [ 2] 3139 	ldw (N1,sp),x  ; save first factor 
      009130 5C 0A 01         [ 4] 3140 	call next_token
      009133 20 EE            [ 1] 3141 	ld (MULOP,sp),a
      009135 A1 02            [ 1] 3142 	cp a,#CMD_END
      009135 1E 02            [ 1] 3143 	jrult 8$
      009137 1D 00            [ 1] 3144 	and a,#TK_GRP_MASK
      009139 02 4B            [ 1] 3145 	cp a,#TK_GRP_MULT
      00913B 00 FE            [ 1] 3146 	jreq 1$
      00913D 84 27            [ 2] 3147 	jra 8$
      0011BC                       3148 1$:	; got *|/|%
      00913F 1F 20 D7         [ 4] 3149 	call factor
      009142 A1 84            [ 1] 3150 	cp a,#TK_INTGR
      009142 1E 02            [ 1] 3151 	jreq 2$
      009144 F6 6B 01         [ 2] 3152 	jp syntax_error
      009147 A4 0F            [ 1] 3153 2$:	ldw y,x 
      009149 4C C7            [ 2] 3154 	ldw x,(N1,sp)
      00914B 00 0E            [ 1] 3155 	ld a,(MULOP,sp) 
      00914D 72 5F            [ 1] 3156 	cp a,#TK_MULT 
      00914F 00 0D            [ 1] 3157 	jrne 3$
      009151 72 BB 00         [ 4] 3158 	call multiply 
      009154 0D FE            [ 2] 3159 	jra term01
      009156 7B 01            [ 1] 3160 3$: cp a,#TK_DIV 
      009158 4E A4            [ 1] 3161 	jrne 4$ 
      00915A 0C 44 44         [ 4] 3162 	call divide 
      00915D AB 80            [ 2] 3163 	jra term01 
      00915F CD 10 42         [ 4] 3164 4$: call modulo
      00915F 5B 05            [ 2] 3165 	jra term01 
      009161 81 03            [ 1] 3166 8$: ld a,(MULOP,sp)
      009162 27 05            [ 1] 3167 	jreq 9$ 
      0011E7                       3168 	_unget_token
      009162 88 CD 8A 8E 11   [ 1]    1      mov in,in.saved  
      009167 01 27            [ 2] 3169 9$: ldw x,(N1,sp)
      009169 03 CC            [ 1] 3170 	ld a,#TK_INTGR 	
      0011F0                       3171 term_exit:
      0011F0                       3172 	_drop VSIZE 
      00916B 89 9C            [ 2]    1     addw sp,#VSIZE 
      00916D 84               [ 4] 3173 	ret 
                                   3174 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3175 ;-------------------------------
                                   3176 ;  expr ::= term [['+'|'-'] term]*
                                   3177 ;  result range {-32768..32767}
                                   3178 ;  output:
                                   3179 ;   A    token attribute 
                                   3180 ;   X	 integer   
                                   3181 ;-------------------------------
                           000001  3182 	N1=1 
                           000003  3183 	OP=3 
                           000003  3184 	VSIZE=3 
      0011F3                       3185 expression:
      0011F3                       3186 	_vars VSIZE 
      00916E 81 03            [ 2]    1     sub sp,#VSIZE 
      00916F CD 11 A1         [ 4] 3187 	call term
      00916F A6               [ 1] 3188 	tnz a 
      009170 07 CD            [ 1] 3189 	jreq expr_exit 
      009172 91 62            [ 2] 3190 1$:	ldw (N1,sp),x 
      009174 CD 0A 0E         [ 4] 3191 	call next_token
      009174 4B 00            [ 1] 3192 	ld (OP,sp),a 
      009176 CD 92            [ 1] 3193 	cp a,#CMD_END 
      009178 BF A1            [ 1] 3194 	jrult 8$ 
      00917A 00 27            [ 1] 3195 	and a,#TK_GRP_MASK
      00917C 20 A1            [ 1] 3196 	cp a,#TK_GRP_ADD 
      00917E 84 26            [ 1] 3197 	jreq 2$ 
      009180 13 21            [ 2] 3198 	jra 8$
      009181                       3199 2$: 
      009181 84 90 85         [ 4] 3200 	call term
      009184 89 90            [ 1] 3201 	cp a,#TK_INTGR
      009186 89 4C            [ 1] 3202 	jreq 3$
      009188 88 CD 8A         [ 2] 3203 	jp syntax_error
      00918B 8E A1 09         [ 2] 3204 3$:	ldw acc16,x 
      00918E 27 E6            [ 2] 3205 	ldw x,(N1,sp)
      009190 A1 00            [ 1] 3206 	ld a,(OP,sp)
      009192 27 09            [ 1] 3207 	cp a,#TK_PLUS 
      009194 A1 08            [ 1] 3208 	jrne 4$
      009196 27 05 55 00      [ 2] 3209 	addw x,acc16
      00919A 03 00            [ 2] 3210 	jra 1$ 
      00919C 02 84 81 0C      [ 2] 3211 4$:	subw x,acc16
      00919F 20 CC            [ 2] 3212 	jra 1$
      00919F CD 91            [ 1] 3213 8$: ld a,(OP,sp)
      0091A1 6F A1            [ 1] 3214 	jreq 9$ 
      001233                       3215 	_unget_token	
      0091A3 01 27 03 CC 89   [ 1]    1      mov in,in.saved  
      0091A8 9C 85            [ 2] 3216 9$: ldw x,(N1,sp)
      0091AA C3 00            [ 1] 3217 	ld a,#TK_INTGR	
      00123C                       3218 expr_exit:
      00123C                       3219 	_drop VSIZE 
      0091AC 22 23            [ 2]    1     addw sp,#VSIZE 
      0091AE 05               [ 4] 3220 	ret 
                                   3221 
                                   3222 ;---------------------------------------------
                                   3223 ; rel ::= expr rel_op expr
                                   3224 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3225 ;  relation return  integer , zero is false 
                                   3226 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3227 ;    A 		token attribute  
                                   3228 ;	 X		integer 
                                   3229 ;---------------------------------------------
                           000001  3230 	N1=1
                           000003  3231 	RELOP=3
                           000003  3232 	VSIZE=3 
      00123F                       3233 relation: 
      00123F                       3234 	_vars VSIZE
      0091AF A6 0A            [ 2]    1     sub sp,#VSIZE 
      0091B1 CC 89 9E         [ 4] 3235 	call expression
      0091B4 5D               [ 1] 3236 	tnz a 
      0091B5 27 F8            [ 1] 3237 	jreq rel_exit
      0091B7 58 89            [ 2] 3238 	ldw (N1,sp),x 
                                   3239 ; expect rel_op or leave 
      0091B9 AE 16 90         [ 4] 3240 	call next_token 
      0091BC 72 F0            [ 1] 3241 	ld (RELOP,sp),a 
      0091BE 01 5B            [ 1] 3242 	and a,#TK_GRP_MASK
      0091C0 02 A6            [ 1] 3243 	cp a,#TK_GRP_RELOP 
      0091C2 84 81            [ 1] 3244 	jrne 8$
      0091C4                       3245 2$:	; expect another expression
      0091C4 52 01 CD         [ 4] 3246 	call expression
      0091C7 8A 8E            [ 1] 3247 	cp a,#TK_INTGR
      0091C9 A1 02            [ 1] 3248 	jreq 3$
      0091CB 25 3D 6B         [ 2] 3249 	jp syntax_error 
      0091CE 01 A4 30         [ 2] 3250 3$:	ldw acc16,x 
      0091D1 A1 10            [ 2] 3251 	ldw x,(N1,sp) 
      0091D3 27 04 7B 01      [ 2] 3252 	subw x,acc16
      0091D7 20 03            [ 1] 3253 	jrne 4$
      0091D9 35 02 00 0D      [ 1] 3254 	mov acc8,#2 ; n1==n2
      0091D9 CD 8A            [ 2] 3255 	jra 6$ 
      00126F                       3256 4$: 
      0091DB 8E 06            [ 1] 3257 	jrsgt 5$  
      0091DC 35 04 00 0D      [ 1] 3258 	mov acc8,#4 ; n1<2 
      0091DC A1 81            [ 2] 3259 	jra 6$
      001277                       3260 5$:
      0091DE 26 03 FD 20      [ 1] 3261 	mov acc8,#1 ; n1>n2 
      00127B                       3262 6$:
      0091E2 32               [ 1] 3263 	clrw x 
      0091E3 C6 00 0D         [ 1] 3264 	ld a, acc8  
      0091E3 A1 84            [ 1] 3265 	and a,(RELOP,sp)
      0091E5 26               [ 1] 3266 	tnz a 
      0091E6 02 20            [ 1] 3267 	jreq 10$
      0091E8 2C               [ 1] 3268 	incw x 
      0091E9 20 0B            [ 2] 3269 	jra 10$  	
      0091E9 A1 06            [ 1] 3270 8$: ld a,(RELOP,sp)
      0091EB 26 06            [ 1] 3271 	jreq 9$
      00128B                       3272 	_unget_token
      0091ED CD 91 9F FE 20   [ 1]    1      mov in,in.saved  
      001290                       3273 9$: 
      0091F2 22 01            [ 2] 3274 	ldw x,(N1,sp)
      0091F3                       3275 10$:
      0091F3 A1 85            [ 1] 3276 	ld a,#TK_INTGR
      001294                       3277 rel_exit:
      001294                       3278 	_drop VSIZE
      0091F5 26 03            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091F7 FE               [ 4] 3279 	ret 
                                   3280 
                                   3281 ;--------------------------------
                                   3282 ; BASIC: SHOW 
                                   3283 ; print stack content in hexadecimal bytes 
                                   3284 ; 16 bytes per row 
                                   3285 ;--------------------------------
      001297                       3286 show:
      0091F8 20 1B B1         [ 2] 3287 	ldw x,#cstk_prompt
      0091FA CD 00 00         [ 4] 3288 	call puts 
      0091FA A1               [ 1] 3289 	ldw x,sp 
      0091FB 07 26 0C         [ 2] 3290 	addw x,#3 ; ignore return address
      0091FE CD 92 BF 89      [ 2] 3291 	ldw y,#RAM_SIZE  
      009202 A6 08 CD         [ 2] 3292 	ldw acc16,x 
      009205 91 62 85 20      [ 2] 3293 	subw y,acc16
      009209 0B 03 F7         [ 4] 3294 	call hex_dump
      00920A 4F               [ 1] 3295 	clr a 
      00920A 4D               [ 4] 3296 	ret
                                   3297 
      00920B 27 11 55 00 03 00 02  3298 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             4F 20 09 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3299 
                                   3300 
                                   3301 ;--------------------------------------------
                                   3302 ; BASIC: HEX 
                                   3303 ; select hexadecimal base for integer print
                                   3304 ;---------------------------------------------
      009215                       3305 hex_base:
      009215 A6 11 11 01      [ 1] 3306 	mov base,#16 
      009219 26               [ 4] 3307 	ret 
                                   3308 
                                   3309 ;--------------------------------------------
                                   3310 ; BASIC: DEC 
                                   3311 ; select decimal base for integer print
                                   3312 ;---------------------------------------------
      0012DD                       3313 dec_base:
      00921A 01 50 00 0A      [ 1] 3314 	mov base,#10
      00921C 81               [ 4] 3315 	ret 
                                   3316 
                                   3317 ;------------------------
                                   3318 ; BASIC: SIZE 
                                   3319 ; return free size in text area
                                   3320 ; output:
                                   3321 ;   A 		TK_INTGR
                                   3322 ;   X 	    size integer
                                   3323 ;--------------------------
      0012E2                       3324 size:
      00921C A6 84 90         [ 2] 3325 	ldw x,#tib 
      00921E 72 B0 00 1E      [ 2] 3326 	subw x,txtend 
      00921E 5B 01            [ 1] 3327 	ld a,#TK_INTGR
      009220 81               [ 4] 3328 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3329 
                                   3330 
                                   3331 ;------------------------
                                   3332 ; BASIC: UBOUND  
                                   3333 ; return array variable size 
                                   3334 ; output:
                                   3335 ;   A 		TK_INTGR
                                   3336 ;   X 	    array size 
                                   3337 ;--------------------------
      009221                       3338 ubound:
      009221 52 03 CD         [ 2] 3339 	ldw x,#tib
      009224 91 C4 4D 27      [ 2] 3340 	subw x,txtend 
      009228 47 CE 00 04      [ 2] 3341 	ldw y,basicptr 
      009229 90 C3 00 1E      [ 2] 3342 	cpw y,txtend 
      009229 1F 01            [ 1] 3343 	jrult 1$
      00922B CD 8A 8E         [ 1] 3344 	push count 
      00922E 6B 03            [ 1] 3345 	push #0 
      009230 A1 02 25         [ 2] 3346 	subw x,(1,sp)
      001305                       3347 	_drop 2 
      009233 2F A4            [ 2]    1     addw sp,#2 
      009235 30               [ 2] 3348 1$:	srlw x 
      009236 A1 20 27         [ 2] 3349 	ldw array_size,x
      009239 02 20            [ 1] 3350 	ld a,#TK_INTGR
      00923B 27               [ 4] 3351 	ret 
                                   3352 
                                   3353 ;-----------------------------
                                   3354 ; BASIC: LET var=expr 
                                   3355 ; variable assignement 
                                   3356 ; output:
                                   3357 ;   A 		TK_NONE 
                                   3358 ;-----------------------------
      00923C                       3359 let:
      00923C CD 91 C4         [ 4] 3360 	call next_token 
      00923F A1 84            [ 1] 3361 	cp a,#TK_VAR 
      009241 27 03            [ 1] 3362 	jreq let_var
      009243 CC 89            [ 1] 3363 	cp a,#TK_ARRAY 
      009245 9C 90            [ 1] 3364 	jreq  let_array
      009247 93 1E 01         [ 2] 3365 	jp syntax_error
      00131C                       3366 let_array:
      00924A 7B 03 A1         [ 4] 3367 	call get_array_element
      00131F                       3368 let_var:
      00924D 20               [ 2] 3369 	pushw x  
      00924E 26 05 CD         [ 4] 3370 	call next_token 
      009251 8F F3            [ 1] 3371 	cp a,#TK_EQUAL
      009253 20 D4            [ 1] 3372 	jreq 1$
      009255 A1 21 26         [ 2] 3373 	jp syntax_error
      00132A                       3374 1$:	
      009258 05 CD 90         [ 4] 3375 	call relation   
      00925B AC 20            [ 1] 3376 	cp a,#TK_INTGR 
      00925D CB CD            [ 1] 3377 	jreq 2$
      00925F 90 C2 20         [ 2] 3378 	jp syntax_error
      001334                       3379 2$:	
      009262 C6 7B            [ 1] 3380 	ldw y,x 
      009264 03               [ 2] 3381 	popw x   
      009265 27               [ 2] 3382 	ldw (x),y   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009266 05               [ 4] 3383 	ret 
                                   3384 
                                   3385 ;----------------------------
                                   3386 ; BASIC: LIST [[start][,end]]
                                   3387 ; list program lines 
                                   3388 ; form start to end 
                                   3389 ; if empty argument list then 
                                   3390 ; list all.
                                   3391 ;----------------------------
                           000001  3392 	FIRST=1
                           000003  3393 	LAST=3 
                           000005  3394 	LN_PTR=5
                           000006  3395 	VSIZE=6 
      001339                       3396 list:
      009267 55 00 03         [ 2] 3397 	ldw x,txtbgn 
      00926A 00 02 1E         [ 2] 3398 	cpw x,txtend 
      00926D 01 A6            [ 1] 3399 	jrmi 1$
      00926F 84               [ 4] 3400 	ret 
      009270                       3401 1$:	
      001342                       3402 	_vars VSIZE
      009270 5B 03            [ 2]    1     sub sp,#VSIZE 
      009272 81 05            [ 2] 3403 	ldw (LN_PTR,sp),x 
      009273 FE               [ 2] 3404 	ldw x,(x) 
      009273 52 03            [ 2] 3405 	ldw (FIRST,sp),x ; list from first line 
      009275 CD 92 21         [ 2] 3406 	ldw x,#MAX_LINENO ; biggest line number 
      009278 4D 27            [ 2] 3407 	ldw (LAST,sp),x 
      00927A 41 1F 01         [ 4] 3408 	call arg_list
      00927D CD               [ 1] 3409 	tnz a
      00927E 8A 8E            [ 1] 3410 	jreq list_loop 
      009280 6B 03            [ 1] 3411 	cp a,#2 
      009282 A1 02            [ 1] 3412 	jreq 4$
      009284 25 29            [ 1] 3413 	cp a,#1 
      009286 A4 30            [ 1] 3414 	jreq first_line 
      009288 A1 10 27         [ 2] 3415 	jp syntax_error 
      00928B 02               [ 2] 3416 4$:	popw x 
      00928C 20 21            [ 2] 3417 	ldw (LAST+2,sp),x 
      00928E                       3418 first_line:
      00928E CD               [ 2] 3419 	popw x
      00928F 92 21            [ 2] 3420 	ldw (FIRST,sp),x 
      001365                       3421 lines_skip:
      009291 A1 84 27         [ 2] 3422 	ldw x,txtbgn
      009294 03 CC            [ 2] 3423 2$:	ldw (LN_PTR,sp),x 
      009296 89 9C CF         [ 2] 3424 	cpw x,txtend 
      009299 00 0D            [ 1] 3425 	jrpl list_exit 
      00929B 1E               [ 2] 3426 	ldw x,(x) ;line# 
      00929C 01 7B            [ 2] 3427 	cpw x,(FIRST,sp)
      00929E 03 A1            [ 1] 3428 	jrpl list_loop 
      0092A0 10 26            [ 2] 3429 	ldw x,(LN_PTR,sp) 
      0092A2 06 72            [ 1] 3430 	ld a,(2,x)
      0092A4 BB 00 0D         [ 1] 3431 	ld acc8,a 
      0092A7 20 D2 72 B0      [ 1] 3432 	clr acc16 
      0092AB 00 0D 20 CC      [ 2] 3433 	addw x,acc16
      0092AF 7B 03            [ 2] 3434 	jra 2$ 
                                   3435 ; print loop
      001385                       3436 list_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0092B1 27 05            [ 2] 3437 	ldw x,(LN_PTR,sp)
      0092B3 55 00            [ 1] 3438 	ld a,(2,x) 
      0092B5 03 00 02         [ 4] 3439 	call prt_basic_line
      0092B8 1E 01            [ 2] 3440 	ldw x,(LN_PTR,sp)
      0092BA A6 84            [ 1] 3441 	ld a,(2,x)
      0092BC C7 00 0D         [ 1] 3442 	ld acc8,a 
      0092BC 5B 03 81 0C      [ 1] 3443 	clr acc16 
      0092BF 72 BB 00 0C      [ 2] 3444 	addw x,acc16
      0092BF 52 03 CD         [ 2] 3445 	cpw x,txtend 
      0092C2 92 73            [ 1] 3446 	jrpl list_exit
      0092C4 4D 27            [ 2] 3447 	ldw (LN_PTR,sp),x
      0092C6 4D               [ 2] 3448 	ldw x,(x)
      0092C7 1F 01            [ 2] 3449 	cpw x,(LAST,sp)  
      0092C9 CD 8A            [ 1] 3450 	jrslt list_loop
      0013A7                       3451 list_exit:
      0092CB 8E 6B 03 A4 30   [ 1] 3452 	mov in,count 
      0092D0 A1 30 26         [ 2] 3453 	ldw x,#pad 
      0092D3 33 00 04         [ 2] 3454 	ldw basicptr,x 
      0092D4                       3455 	_drop VSIZE 
      0092D4 CD 92            [ 2]    1     addw sp,#VSIZE 
      0092D6 73               [ 4] 3456 	ret
                                   3457 
                                   3458 ;-------------------------
                                   3459 ; copy command name to buffer  
                                   3460 ; input:
                                   3461 ;   X 	name address 
                                   3462 ;   Y   destination buffer 
                                   3463 ; output:
                                   3464 ;   Y   point after name  
                                   3465 ;--------------------------
      0013B5                       3466 cpy_cmd_name:
      0092D7 A1               [ 1] 3467 	ld a,(x)
      0092D8 84               [ 1] 3468 	incw x
      0092D9 27 03            [ 1] 3469 	and a,#15  
      0092DB CC               [ 1] 3470 	push a 
      0092DC 89 9C            [ 1] 3471     tnz (1,sp) 
      0092DE CF 00            [ 1] 3472 	jreq 9$
      0092E0 0D               [ 1] 3473 1$:	ld a,(x)
      0092E1 1E 01            [ 1] 3474 	ld (y),a  
      0092E3 72               [ 1] 3475 	incw x
      0092E4 B0 00            [ 1] 3476 	incw y 
      0092E6 0D 26            [ 1] 3477 	dec (1,sp)	 
      0092E8 06 35            [ 1] 3478 	jrne 1$
      0092EA 02               [ 1] 3479 9$: pop a 
      0092EB 00               [ 4] 3480 	ret	
                                   3481 
                                   3482 ;--------------------------
                                   3483 ; add a space after letter or 
                                   3484 ; digit.
                                   3485 ; input:
                                   3486 ;   Y     pointer to buffer 
                                   3487 ; output:
                                   3488 ;   Y    moved to end 
                                   3489 ;--------------------------
      0013CA                       3490 add_space:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092EC 0E 20            [ 2] 3491 	decw y 
      0092EE 0C F6            [ 1] 3492 	ld a,(y)
      0092EF 90 5C            [ 1] 3493 	incw y
      0092EF 2C 06 35         [ 4] 3494 	call is_alnum 
      0092F2 04 00            [ 1] 3495 	jrnc 1$
      0092F4 0E 20            [ 1] 3496 	ld a,#SPACE 
      0092F6 04 F7            [ 1] 3497 	ld (y),a 
      0092F7 90 5C            [ 1] 3498 	incw y 
      0092F7 35               [ 4] 3499 1$: ret 
                                   3500 
                                   3501 ;--------------------------
                                   3502 ;  align text in buffer 
                                   3503 ;  to tab_width padding 
                                   3504 ;  left with  SPACE 
                                   3505 ; input:
                                   3506 ;   X      str*
                                   3507 ;   A      str_length 
                                   3508 ; output:
                                   3509 ;   X      ajusted
                                   3510 ;--------------------------
      0013DC                       3511 right_align:
      0092F8 01               [ 1] 3512 	push a 
      0092F9 00 0E            [ 1] 3513 0$: ld a,(1,sp)
      0092FB C1 00 24         [ 1] 3514 	cp a,tab_width 
      0092FB 5F C6            [ 1] 3515 	jrpl 1$
      0092FD 00 0E            [ 1] 3516 	ld a,#SPACE 
      0092FF 14               [ 2] 3517 	decw x
      009300 03               [ 1] 3518 	ld (x),a  
      009301 4D 27            [ 1] 3519 	inc (1,sp)
      009303 0E 5C            [ 2] 3520 	jra 0$ 
      009305 20               [ 1] 3521 1$: pop a 	
      009306 0B               [ 4] 3522 	ret 
                                   3523 
                                   3524 ;--------------------------
                                   3525 ; print TK_QSTR
                                   3526 ; converting control character
                                   3527 ; to backslash sequence
                                   3528 ; input:
                                   3529 ;   X        char *
                                   3530 ;   Y        dest. buffer 
                                   3531 ; output:
                                   3532 ;   X        moved forward 
                                   3533 ;   Y        moved forward 
                                   3534 ;-----------------------------
      0013EE                       3535 cpy_quote:
      009307 7B 03            [ 1] 3536 	ld a,#'"
      009309 27 05            [ 1] 3537 	ld (y),a 
      00930B 55 00            [ 1] 3538 	incw y 
      00930D 03               [ 1] 3539 1$:	ld a,(x)
      00930E 00 02            [ 1] 3540 	jreq 9$
      009310 5C               [ 1] 3541 	incw x 
      009310 1E 01            [ 1] 3542 	cp a,#SPACE 
      009312 25 0E            [ 1] 3543 	jrult 3$
      009312 A6 84            [ 1] 3544 	ld (y),a
      009314 90 5C            [ 1] 3545 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009314 5B 03            [ 1] 3546 	cp a,#'\ 
      009316 81 F0            [ 1] 3547 	jrne 1$ 
      009317                       3548 2$:
      009317 AE 93            [ 1] 3549 	ld (y),a
      009319 31 CD            [ 1] 3550 	incw y  
      00931B AA 40            [ 2] 3551 	jra 1$
      00931D 96               [ 1] 3552 3$: push a 
      00931E 1C 00            [ 1] 3553 	ld a,#'\
      009320 03 90            [ 1] 3554 	ld (y),a 
      009322 AE 18            [ 1] 3555 	incw y  
      009324 00               [ 1] 3556 	pop a 
      009325 CF 00            [ 1] 3557 	sub a,#7
      009327 0D 72 B2         [ 1] 3558 	ld acc8,a 
      00932A 00 0D CD 84      [ 1] 3559 	clr acc16
      00932E 77               [ 2] 3560 	pushw x
      00932F 4F 81 0A         [ 2] 3561 	ldw x,#escaped 
      009332 63 6F 6E 74      [ 2] 3562 	addw x,acc16 
      009336 65               [ 1] 3563 	ld a,(x)
      009337 6E               [ 2] 3564 	popw x
      009338 74 20            [ 2] 3565 	jra 2$
      00933A 6F 66            [ 1] 3566 9$: ld a,#'"
      00933C 20 73            [ 1] 3567 	ld (y),a 
      00933E 74 61            [ 1] 3568 	incw y  
      009340 63               [ 1] 3569 	incw x 
      009341 6B               [ 4] 3570 	ret
                                   3571 
                                   3572 ;--------------------------
                                   3573 ; return variable name 
                                   3574 ; from its address.
                                   3575 ; input:
                                   3576 ;   X    variable address
                                   3577 ; output:
                                   3578 ;   A     variable letter
                                   3579 ;--------------------------
      00142F                       3580 var_name:
      009342 20 66 72         [ 2] 3581 		subw x,#vars 
      009345 6F               [ 1] 3582 		ld a,xl 
      009346 6D               [ 1] 3583 		srl a 
      009347 20 74            [ 1] 3584 		add a,#'A 
      009349 6F               [ 4] 3585 		ret 
                                   3586 
                                   3587 ;-----------------------------
                                   3588 ; return cmd  idx from its 
                                   3589 ; code address 
                                   3590 ; input:
                                   3591 ;   X      code address 
                                   3592 ; output:
                                   3593 ;   X      cmd_idx
                                   3594 ;-----------------------------
      001437                       3595 get_cmd_idx:
      00934A 70 20            [ 2] 3596 	pushw y
      00934C 74 6F 20 62      [ 2] 3597 	ldw y,#code_addr 
      009350 6F 74 74 6F      [ 2] 3598 	ldw ptr16,y 
      009354 6D 3A            [ 1] 3599 	clrw y 
      009356 0A 00 17         [ 5] 3600 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009358 27 0C            [ 1] 3601 	jreq 3$ 
      009358 35 10            [ 1] 3602 	incw y 
      00935A 00 0B 81         [ 4] 3603 	ld a,([ptr16],y)
      00935D 90 5C            [ 1] 3604 	incw y
      00935D 35 0A 00         [ 4] 3605 	or a,([ptr16],y)	
      009360 0B 81            [ 1] 3606 	jrne 1$
      009362 93               [ 1] 3607 3$: ldw x,y 
      009362 AE 16            [ 2] 3608 	popw y 
      009364 90               [ 4] 3609 	ret
                                   3610 
                                   3611 ;-------------------------------------
                                   3612 ; decompile tokens list 
                                   3613 ; to original text line 
                                   3614 ; input:
                                   3615 ;   [basicptr]  pointer at line 
                                   3616 ;   Y           destination buffer
                                   3617 ; output:
                                   3618 ;   A           length 
                                   3619 ;   Y           after string  
                                   3620 ;------------------------------------
                           000001  3621 	BASE_SAV=1
                           000002  3622 	WIDTH_SAV=2
                           000003  3623 	STR=3
                           000004  3624 	VSIZE=4 
      001458                       3625 decompile::
      001458                       3626 	_vars VSIZE
      009365 72 B0            [ 2]    1     sub sp,#VSIZE 
      009367 00 1F A6         [ 1] 3627 	ld a,base
      00936A 84 81            [ 1] 3628 	ld (BASE_SAV,sp),a  
      00936C C6 00 24         [ 1] 3629 	ld a,tab_width 
      00936C AE 16            [ 1] 3630 	ld (WIDTH_SAV,sp),a 
      00936E 90 72            [ 2] 3631 	ldw (STR,sp),y   
      009370 B0 00 1F 90      [ 5] 3632 	ldw x,[basicptr] ; line number 
      009374 CE 00 05 90      [ 1] 3633 	mov base,#10
      009378 C3 00 1F 25      [ 1] 3634 	mov tab_width,#5
      00937C 0A 3B 00 04      [ 1] 3635 	clr acc24 
      009380 4B 00 72         [ 2] 3636 	ldw acc16,x
      009383 F0 01 5B         [ 4] 3637 	call itoa  
      009386 02 54 CF         [ 4] 3638 	call right_align 
      009389 00               [ 1] 3639 	push a 
      00938A 22 A6            [ 1] 3640 1$:	ldw y,x ; source
      00938C 84 81            [ 2] 3641 	ldw x,(STR+1,sp) ; destination
      00938E CD 04 50         [ 4] 3642 	call strcpy 
      00938E CD 8A            [ 1] 3643 	clrw y 
      009390 8E               [ 1] 3644 	pop a 
      009391 A1 85            [ 1] 3645 	ld yl,a 
      009393 27 0A A1         [ 2] 3646 	addw y,(STR,sp)
      009396 06 27            [ 1] 3647 	ld a,#SPACE 
      009398 03 CC            [ 1] 3648 	ld (y),a 
      00939A 89 9C            [ 1] 3649 	incw y 
      00939C 72 5F 00 24      [ 1] 3650 	clr tab_width
      00939C CD 91 9F         [ 2] 3651 	ldw x,#3
      00939F CF 00 00         [ 2] 3652 	ldw in.w,x 
      00149F                       3653 decomp_loop:
      00939F 89 CD            [ 2] 3654 	pushw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093A1 8A 8E A1         [ 4] 3655 	call next_token 
      0093A4 32 27            [ 2] 3656 	popw y 
      0093A6 03               [ 1] 3657 	tnz a  
      0093A7 CC 89            [ 1] 3658 	jrne 1$
      0093A9 9C 15 85         [ 2] 3659 	jp 20$
      0093AA 2A 6F            [ 1] 3660 1$:	jrpl 6$
                                   3661 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      0093AA CD 92            [ 1] 3662 	cp a,#TK_VAR 
      0093AC BF A1            [ 1] 3663 	jrne 3$
                                   3664 ;; TK_VAR 
      0093AE 84 27 03         [ 4] 3665 	call add_space  
      0093B1 CC 89 9C         [ 4] 3666 	call var_name
      0093B4 90 F7            [ 1] 3667 	ld (y),a 
      0093B4 90 93            [ 1] 3668 	incw y  
      0093B6 85 FF            [ 2] 3669 	jra decomp_loop
      0014BE                       3670 3$:
      0093B8 81 84            [ 1] 3671 	cp a,#TK_INTGR
      0093B9 26 22            [ 1] 3672 	jrne 4$
                                   3673 ;; TK_INTGR
      0093B9 CE 00 1D         [ 4] 3674 	call add_space
      0093BC C3 00 1F 2B      [ 1] 3675 	clr acc24 
      0093C0 01 81 0C         [ 2] 3676 	ldw acc16,x 
      0093C2 90 89            [ 2] 3677 	pushw y 
      0093C2 52 06 1F         [ 4] 3678 	call itoa  
      0093C5 05 FE            [ 2] 3679 	ldw y,(1,sp) 
      0093C7 1F               [ 1] 3680 	push a 
      0093C8 01               [ 1] 3681 	exgw x,y 
      0093C9 AE 7F FF         [ 4] 3682 	call strcpy 
      0093CC 1F 03            [ 1] 3683 	clrw y
      0093CE CD               [ 1] 3684 	pop a  
      0093CF 91 74            [ 1] 3685 	ld yl,a 
      0093D1 4D 27 31         [ 2] 3686 	addw y,(1,sp)
      0014E0                       3687 	_drop 2 
      0093D4 A1 02            [ 2]    1     addw sp,#2 
      0093D6 27 07            [ 2] 3688 	jra decomp_loop
                                   3689 ;; dictionary keyword 
      0014E4                       3690 4$:	
      0093D8 A1 01 27         [ 4] 3691 	call get_cmd_idx 
      0093DB 06 CC 89         [ 2] 3692 	cpw x,#REM_IDX
      0093DE 9C 85            [ 1] 3693 	jrne 5$
      0093E0 1F 05 04         [ 2] 3694 	ldw x,basicptr 
                                   3695 ; copy comment to buffer 
      0093E2 CD 13 CA         [ 4] 3696 	call add_space
      0093E2 85 1F            [ 1] 3697 	ld a,#''
      0093E4 01 F7            [ 1] 3698 	ld (y),a 
      0093E5 90 5C            [ 1] 3699 	incw y 
      0014F8                       3700 41$:
      0093E5 CE 00 1D 1F      [ 4] 3701 	ld a,([in.w],x)
      0093E9 05 C3 00 1F      [ 1] 3702 	inc in  
      0093ED 2A 38            [ 1] 3703 	ld (y),a 
      0093EF FE 13            [ 1] 3704 	incw y 
      0093F1 01 2A 11         [ 1] 3705 	ld a,in 
      0093F4 1E 05 E6         [ 1] 3706 	cp a,count 
      0093F7 02 C7            [ 1] 3707 	jrmi 41$
      0093F9 00 0E            [ 2] 3708 	jra 20$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3709 ; insert command name 
      00150E                       3710 5$:
      0093FB 72 5F 00         [ 4] 3711 	call add_space  
      0093FE 0D 72            [ 2] 3712 	pushw y
      009400 BB 00 0D         [ 4] 3713 	call cmd_name
      009403 20 E3            [ 2] 3714 	popw y 
      009405 CD 13 B5         [ 4] 3715 	call cpy_cmd_name
      009405 1E 05            [ 2] 3716 	jra decomp_loop 
      00151D                       3717 6$:
      009407 E6 02            [ 1] 3718 	cp a,#TK_QSTR 
      009409 CD 96            [ 1] 3719 	jrne 7$
                                   3720 ;; TK_QSTR
      00940B 40 1E 05         [ 4] 3721 	call cpy_quote  
      00940E E6 02 C7         [ 2] 3722 	jp decomp_loop
      001527                       3723 7$:
      009411 00 0E            [ 1] 3724 	cp a,#TK_CHAR 
      009413 72 5F            [ 1] 3725 	jrne 8$
                                   3726 ;; TK_CHAR 
      009415 00 0D            [ 1] 3727 	ld a,#'\ 
      009417 72 BB            [ 1] 3728 	ld (y),a 
      009419 00 0D            [ 1] 3729 	incw y 
      00941B C3               [ 1] 3730 	ld a,xl 
      00941C 00 1F            [ 1] 3731 	ld (y),a 
      00941E 2A 07            [ 1] 3732 	incw y 
      009420 1F 05 FE         [ 2] 3733 	jp decomp_loop
      009423 13 03            [ 1] 3734 8$: cp a,#TK_COLON 
      009425 2F DE            [ 1] 3735 	jrne 9$
      009427 A6 3A            [ 1] 3736 	ld a,#':
      00153F                       3737 81$:
      009427 55 00            [ 1] 3738 	ld (y),a 
      009429 04 00            [ 1] 3739 	incw y 
      001543                       3740 82$:
      00942B 02 AE 16         [ 2] 3741 	jp decomp_loop
      001546                       3742 9$: 
      00942E E0 CF            [ 1] 3743 	cp a,#TK_SHARP
      009430 00 05            [ 1] 3744 	jrugt 10$ 
      009432 5B 06            [ 1] 3745 	sub a,#TK_ARRAY 
      009434 81               [ 1] 3746 	clrw x 
      009435 97               [ 1] 3747 	ld xl,a
      009435 F6 5C A4         [ 2] 3748 	addw x,#single_char 
      009438 0F               [ 1] 3749 	ld a,(x)
      009439 88 0D            [ 2] 3750 	jra 81$ 
      001554                       3751 10$: 
      00943B 01 27            [ 1] 3752 	cp a,#TK_MINUS 
      00943D 0A F6            [ 1] 3753 	jrugt 11$
      00943F 90 F7            [ 1] 3754 	sub a,#TK_PLUS 
      009441 5C               [ 1] 3755 	clrw x 
      009442 90               [ 1] 3756 	ld xl,a 
      009443 5C 0A 01         [ 2] 3757 	addw x,#add_char 
      009446 26               [ 1] 3758 	ld a,(x)
      009447 F6 84            [ 2] 3759 	jra 81$
      001562                       3760 11$:
      009449 81 22            [ 1] 3761     cp a,#TK_MOD 
      00944A 22 0A            [ 1] 3762 	jrugt 12$
      00944A 90 5A            [ 1] 3763 	sub a,#TK_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00944C 90               [ 1] 3764 	clrw x 
      00944D F6               [ 1] 3765 	ld xl,a 
      00944E 90 5C CD         [ 2] 3766 	addw x,#mul_char
      009451 86               [ 1] 3767 	ld a,(x)
      009452 A9 24            [ 2] 3768 	jra 81$
      001570                       3769 12$:
      009454 06 A6            [ 1] 3770 	sub a,#TK_GT  
      009456 20               [ 1] 3771 	sll a 
      009457 90               [ 1] 3772 	clrw x 
      009458 F7               [ 1] 3773 	ld xl,a 
      009459 90 5C 81         [ 2] 3774 	addw x,#relop_str 
      00945C FE               [ 2] 3775 	ldw x,(x)
      00945C 88               [ 1] 3776 	ld a,(x)
      00945D 7B               [ 1] 3777 	incw x 
      00945E 01 C1            [ 1] 3778 	ld (y),a
      009460 00 25            [ 1] 3779 	incw y 
      009462 2A               [ 1] 3780 	ld a,(x)
      009463 08 A6            [ 1] 3781 	jrne 81$
      009465 20 5A F7         [ 2] 3782 	jp decomp_loop 
      001585                       3783 20$: 
      009468 0C 01            [ 1] 3784 	clr (y)
      00946A 20 F1            [ 2] 3785 	ldw x,(STR,sp)
      00946C 84 81            [ 1] 3786 	ld a,(BASE_SAV,sp)
      00946E C7 00 0A         [ 1] 3787 	ld base,a 
      00946E A6 22            [ 1] 3788 	ld a,(WIDTH_SAV,sp)
      009470 90 F7 90         [ 1] 3789 	ld tab_width,a
      009473 5C F6 27         [ 2] 3790 	subw y,(STR,sp) 
      009476 30 5C            [ 1] 3791 	ld a,yl 
      001598                       3792 	_drop VSIZE 
      009478 A1 20            [ 2]    1     addw sp,#VSIZE 
      00947A 25               [ 4] 3793 	ret 
                                   3794 
      00947B 0E 90 F7 90 5C        3795 single_char: .byte '@','(',')',',','#'
      009480 A1 5C                 3796 add_char: .byte '+','-'
      009482 26 F0 25              3797 mul_char: .byte '*','/','%'
      009484 15 B1 15 B3 15 B5 15  3798 relop_str: .word gt,equal,ge,lt,le,ne 
             B8 15 BA 15 BD
      009484 90 F7                 3799 gt: .asciz ">"
      009486 90 5C                 3800 equal: .asciz "="
      009488 20 EA 88              3801 ge: .asciz ">="
      00948B A6 5C                 3802 lt: .asciz "<"
      00948D 90 F7 90              3803 le: .asciz "<="
      009490 5C 84 A0              3804 ne:  .asciz "<>"
                                   3805 
                                   3806 
                                   3807 ;--------------------------
                                   3808 ; decompile line from token list
                                   3809 ; and print it. 
                                   3810 ; input:
                                   3811 ;   A       stop at this position 
                                   3812 ;   X 		pointer at line
                                   3813 ; output:
                                   3814 ;   none 
                                   3815 ;--------------------------	
      0015C0                       3816 prt_basic_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009493 07 C7 00         [ 1] 3817 	ld count,a 
      009496 0E 72            [ 1] 3818 	ld a,(2,x)
      009498 5F 00 0D         [ 1] 3819 	cp a,count 
      00949B 89 AE            [ 1] 3820 	jrpl 1$ 
      00949D 8C 42 72         [ 1] 3821 	ld count,a 
      0094A0 BB 00 0D         [ 2] 3822 1$:	ldw basicptr,x 
      0094A3 F6 85 20 DD      [ 2] 3823 	ldw y,#tib  
      0094A7 A6 22 90         [ 4] 3824 	call decompile 
      0094AA F7 90 5C         [ 4] 3825 	call puts 
      0094AD 5C 81            [ 1] 3826 	ld a,#CR 
      0094AF CD 03 2B         [ 4] 3827 	call putc 
      0094AF 1D               [ 4] 3828 	ret 
                                   3829 
                                   3830 
                                   3831 
                                   3832 ;---------------------------------
                                   3833 ; BASIC: PRINT|? arg_list 
                                   3834 ; print values from argument list
                                   3835 ;----------------------------------
                           000001  3836 	COMMA=1
                           000001  3837 	VSIZE=1
      0015E0                       3838 print:
      0015E0                       3839 	_vars VSIZE 
      0094B0 00 3A            [ 2]    1     sub sp,#VSIZE 
      0015E2                       3840 reset_comma:
      0094B2 9F 44            [ 1] 3841 	clr (COMMA,sp)
      0015E4                       3842 prt_loop:
      0094B4 AB 41 81         [ 4] 3843 	call next_token
      0094B7 A1 02            [ 1] 3844 	cp a,#CMD_END 
      0094B7 90 89            [ 1] 3845 	jrult print_exit ; colon or end of line 
      0094B9 90 AE            [ 1] 3846 	cp a,#TK_QSTR
      0094BB A9 2D            [ 1] 3847 	jreq 1$
      0094BD 90 CF            [ 1] 3848 	cp a,#TK_CHAR 
      0094BF 00 18            [ 1] 3849 	jreq 2$ 
      0094C1 90 5F            [ 1] 3850 	cp a,#TK_CFUNC 
      0094C3 91 D3            [ 1] 3851 	jreq 3$
      0094C5 18 27            [ 1] 3852 	cp a,#TK_COMMA 
      0094C7 0C 90            [ 1] 3853 	jreq 4$
      0094C9 5C 91            [ 1] 3854 	cp a,#TK_SHARP 
      0094CB D6 18            [ 1] 3855 	jreq 5$
      0094CD 90 5C            [ 2] 3856 	jra 7$ 
      001601                       3857 1$:	; print string 
      0094CF 91 DA 18         [ 4] 3858 	call puts
      0094D2 26 EF            [ 2] 3859 	jra reset_comma
      001606                       3860 2$:	; print character 
      0094D4 93               [ 1] 3861 	ld a,xl 
      0094D5 90 85 81         [ 4] 3862 	call putc 
      0094D8 20 D6            [ 2] 3863 	jra reset_comma 
      00160C                       3864 3$: ; print character function value  	
      0094D8 52               [ 4] 3865 	call (x)
      0094D9 04               [ 1] 3866 	ld a,xl 
      0094DA C6 00 0B         [ 4] 3867 	call putc
      0094DD 6B 01            [ 2] 3868 	jra reset_comma 
      001613                       3869 4$: ; set comma state 
      0094DF C6 00            [ 1] 3870 	cpl (COMMA,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094E1 25 6B            [ 2] 3871 	jra prt_loop   
      001617                       3872 5$: ; # character must be followed by an integer   
      0094E3 02 17 03         [ 4] 3873 	call next_token
      0094E6 72 CE            [ 1] 3874 	cp a,#TK_INTGR 
      0094E8 00 05            [ 1] 3875 	jreq 6$
      0094EA 35 0A 00         [ 2] 3876 	jp syntax_error 
      001621                       3877 6$: ; set tab width
      0094ED 0B               [ 1] 3878 	ld a,xl 
      0094EE 35 05            [ 1] 3879 	and a,#15 
      0094F0 00 25 72         [ 1] 3880 	ld tab_width,a 
      0094F3 5F 00            [ 2] 3881 	jra reset_comma 
      001629                       3882 7$:	
      001629                       3883 	_unget_token 
      0094F5 0C CF 00 0D CD   [ 1]    1      mov in,in.saved  
      0094FA 8B 0B CD         [ 4] 3884 	call relation 
      0094FD 94 5C            [ 1] 3885 	cp a,#TK_INTGR 
      0094FF 88 90            [ 1] 3886 	jrne print_exit 
      009501 93 1E 04         [ 4] 3887     call print_int 
      009504 CD 84            [ 2] 3888 	jra reset_comma 
      00163A                       3889 print_exit:
      009506 D0 90            [ 1] 3890 	tnz (COMMA,sp)
      009508 5F 84            [ 1] 3891 	jrne 9$
      00950A 90 97            [ 1] 3892 	ld a,#CR 
      00950C 72 F9 03         [ 4] 3893     call putc 
      001643                       3894 9$:	_drop VSIZE 
      00950F A6 20            [ 2]    1     addw sp,#VSIZE 
      009511 90               [ 4] 3895 	ret 
                                   3896 
                                   3897 ;----------------------
                                   3898 ; 'save_context' and
                                   3899 ; 'rest_context' must be 
                                   3900 ; called at the same 
                                   3901 ; call stack depth 
                                   3902 ; i.e. SP must have the 
                                   3903 ; save value at  
                                   3904 ; entry point of both 
                                   3905 ; routine. 
                                   3906 ;---------------------
                           000004  3907 	CTXT_SIZE=4 ; size of saved data 
                                   3908 ;--------------------
                                   3909 ; save current BASIC
                                   3910 ; interpreter context 
                                   3911 ; on stack 
                                   3912 ;--------------------
      001646                       3913 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001646                       3914 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001646                       3915 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001646                       3916 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001646                       3917 save_context:
      009512 F7 90 5C         [ 2] 3918 	ldw x,basicptr 
      009515 72 5F            [ 2] 3919 	ldw (BPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009517 00 25 AE         [ 1] 3920 	ld a,in 
      00951A 00 03            [ 1] 3921 	ld (IN,sp),a
      00951C CF 00 01         [ 1] 3922 	ld a,count 
      00951F 6B 06            [ 1] 3923 	ld (CNT,sp),a  
      00951F 90               [ 4] 3924 	ret
                                   3925 
                                   3926 ;-----------------------
                                   3927 ; restore previously saved 
                                   3928 ; BASIC interpreter context 
                                   3929 ; from stack 
                                   3930 ;-------------------------
      001656                       3931 rest_context:
      009520 89 CD            [ 2] 3932 	ldw x,(BPTR,sp)
      009522 8A 8E 90         [ 2] 3933 	ldw basicptr,x 
      009525 85 4D            [ 1] 3934 	ld a,(IN,sp)
      009527 26 03 CC         [ 1] 3935 	ld in,a
      00952A 96 05            [ 1] 3936 	ld a,(CNT,sp)
      00952C 2A 6F A1         [ 1] 3937 	ld count,a  
      00952F 85               [ 4] 3938 	ret
                                   3939 
                                   3940 
                                   3941 
                                   3942 ;------------------------------------------
                                   3943 ; BASIC: INPUT [string]var[,[string]var]
                                   3944 ; input value in variables 
                                   3945 ; [string] optionally can be used as prompt 
                                   3946 ;-----------------------------------------
                           000001  3947 	CX_BPTR=1
                           000003  3948 	CX_IN=3
                           000004  3949 	CX_CNT=4
                           000005  3950 	SKIP=5
                           000006  3951 	VAR_ADDR=6
                           000007  3952 	VSIZE=7
      001666                       3953 input_var:
      001666                       3954 	_vars VSIZE 
      009530 26 0C            [ 2]    1     sub sp,#VSIZE 
      001668                       3955 input_loop:
      009532 CD 94            [ 1] 3956 	clr (SKIP,sp)
      009534 4A CD 94         [ 4] 3957 	call next_token 
      009537 AF 90            [ 1] 3958 	cp a,#TK_QSTR 
      009539 F7 90            [ 1] 3959 	jrne 1$ 
      00953B 5C 20 E1         [ 4] 3960 	call puts 
      00953E 03 05            [ 1] 3961 	cpl (SKIP,sp)
      00953E A1 84 26         [ 4] 3962 	call next_token 
      009541 22 CD            [ 1] 3963 1$: cp a,#TK_VAR  
      009543 94 4A            [ 1] 3964 	jreq 2$ 
      009545 72 5F 00         [ 2] 3965 	jp syntax_error
      009548 0C CF            [ 2] 3966 2$:	ldw (VAR_ADDR,sp),x 
      00954A 00 0D            [ 1] 3967 	tnz (SKIP,sp)
      00954C 90 89            [ 1] 3968 	jrne 21$ 
      00954E CD 8B 0B         [ 4] 3969 	call var_name 
      009551 16 01 88         [ 4] 3970 	call putc   
      00168C                       3971 21$:
      009554 51 CD            [ 1] 3972 	ld a,#':
      009556 84 D0 90         [ 4] 3973 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009559 5F 84 90         [ 4] 3974 	call save_context 
      00955C 97 72 F9 01      [ 1] 3975 	clr count  
      009560 5B 02 20         [ 4] 3976 	call readln 
      009563 BB 16 90         [ 2] 3977 	ldw x,#tib 
      009564 3B 00 03         [ 1] 3978 	push count
      009564 CD 94            [ 1] 3979 	push #0 
      009566 B7 A3 00         [ 2] 3980 	addw x,(1,sp)
      009569 8E               [ 1] 3981 	incw x 
      0016A7                       3982 	_drop 2 
      00956A 26 22            [ 2]    1     addw sp,#2 
      00956C CE 00 05 CD      [ 1] 3983 	clr in 
      009570 94 4A A6         [ 4] 3984 	call get_token
      009573 27 90            [ 1] 3985 	cp a,#TK_INTGR
      009575 F7 90            [ 1] 3986 	jreq 3$ 
      009577 5C 16 56         [ 4] 3987 	call rest_context 
      009578 CC 09 1C         [ 2] 3988 	jp syntax_error
      009578 72 D6            [ 2] 3989 3$: ldw y,(VAR_ADDR,sp) 
      00957A 00 01            [ 2] 3990 	ldw (y),x 
      00957C 72 5C 00         [ 4] 3991 	call rest_context
      00957F 02 90 F7         [ 4] 3992 	call next_token 
      009582 90 5C            [ 1] 3993 	cp a,#TK_COMMA 
      009584 C6 00            [ 1] 3994 	jreq input_loop 
      009586 02 C1            [ 1] 3995 	cp a,#TK_COLON 
      009588 00 04            [ 2] 3996     jrule input_exit 
      00958A 2B EC 20         [ 2] 3997 	jp syntax_error 
      0016CF                       3998 input_exit:
      0016CF                       3999 	_drop VSIZE 
      00958D 77 07            [ 2]    1     addw sp,#VSIZE 
      00958E 81               [ 4] 4000 	ret 
                                   4001 
                                   4002 
                                   4003 ;---------------------
                                   4004 ; BASIC: REMARK | ' 
                                   4005 ; skip comment to end of line 
                                   4006 ;---------------------- 
      0016D2                       4007 remark:
      00958E CD 94 4A 90 89   [ 1] 4008 	mov in,count 
      009593 CD               [ 4] 4009  	ret 
                                   4010 
                                   4011 
                                   4012 ;---------------------
                                   4013 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4014 ; read in loop 'addr'  
                                   4015 ; apply & 'mask' to value 
                                   4016 ; loop while result==0.  
                                   4017 ; 'xor_mask' is used to 
                                   4018 ; invert the wait logic.
                                   4019 ; i.e. loop while not 0.
                                   4020 ;---------------------
                           000001  4021 	XMASK=1 
                           000002  4022 	MASK=2
                           000003  4023 	ADDR=3
                           000004  4024 	VSIZE=4
      0016D8                       4025 wait: 
      0016D8                       4026 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009594 90 E3            [ 2]    1     sub sp,#VSIZE 
      009596 90 85            [ 1] 4027 	clr (XMASK,sp) 
      009598 CD 94 35         [ 4] 4028 	call arg_list 
      00959B 20 82            [ 1] 4029 	cp a,#2
      00959D 24 03            [ 1] 4030 	jruge 0$
      00959D A1 02 26         [ 2] 4031 	jp syntax_error 
      0095A0 06 CD            [ 1] 4032 0$:	cp a,#3
      0095A2 94 6E            [ 1] 4033 	jrult 1$
      0095A4 CC               [ 2] 4034 	popw x 
      0095A5 95               [ 1] 4035 	ld a,xl
      0095A6 1F 01            [ 1] 4036 	ld (XMASK,sp),a 
      0095A7 85               [ 2] 4037 1$: popw x ; mask 
      0095A7 A1               [ 1] 4038 	ld a,xl 
      0095A8 03 26            [ 1] 4039 	ld (MASK,sp),a 
      0095AA 0E               [ 2] 4040 	popw x ; address 
      0095AB A6               [ 1] 4041 2$:	ld a,(x)
      0095AC 5C 90            [ 1] 4042 	and a,(MASK,sp)
      0095AE F7 90            [ 1] 4043 	xor a,(XMASK,sp)
      0095B0 5C 9F            [ 1] 4044 	jreq 2$ 
      0016FA                       4045 	_drop VSIZE 
      0095B2 90 F7            [ 2]    1     addw sp,#VSIZE 
      0095B4 90               [ 4] 4046 	ret 
                                   4047 
                                   4048 ;---------------------
                                   4049 ; BASIC: BSET addr,mask
                                   4050 ; set bits at 'addr' corresponding 
                                   4051 ; to those of 'mask' that are at 1.
                                   4052 ; arguments:
                                   4053 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4054 ;   mask        mask|addr
                                   4055 ; output:
                                   4056 ;	none 
                                   4057 ;--------------------------
      0016FD                       4058 bit_set:
      0095B5 5C CC 95         [ 4] 4059 	call arg_list 
      0095B8 1F A1            [ 1] 4060 	cp a,#2	 
      0095BA 01 26            [ 1] 4061 	jreq 1$ 
      0095BC 09 A6 3A         [ 2] 4062 	jp syntax_error
      0095BF                       4063 1$: 
      0095BF 90               [ 2] 4064 	popw x ; mask 
      0095C0 F7               [ 1] 4065 	ld a,xl 
      0095C1 90               [ 2] 4066 	popw x ; addr  
      0095C2 5C               [ 1] 4067 	or a,(x)
      0095C3 F7               [ 1] 4068 	ld (x),a
      0095C3 CC               [ 4] 4069 	ret 
                                   4070 
                                   4071 ;---------------------
                                   4072 ; BASIC: BRES addr,mask
                                   4073 ; reset bits at 'addr' corresponding 
                                   4074 ; to those of 'mask' that are at 1.
                                   4075 ; arguments:
                                   4076 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4077 ;   mask	    ~mask&*addr  
                                   4078 ; output:
                                   4079 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4080 ;--------------------------
      00170D                       4081 bit_reset:
      0095C4 95 1F F4         [ 4] 4082 	call arg_list 
      0095C6 A1 02            [ 1] 4083 	cp a,#2  
      0095C6 A1 0A            [ 1] 4084 	jreq 1$ 
      0095C8 22 0A A0         [ 2] 4085 	jp syntax_error
      001717                       4086 1$: 
      0095CB 06               [ 2] 4087 	popw x ; mask 
      0095CC 5F               [ 1] 4088 	ld a,xl 
      0095CD 97               [ 1] 4089 	cpl a 
      0095CE 1C               [ 2] 4090 	popw x ; addr  
      0095CF 96               [ 1] 4091 	and a,(x)
      0095D0 1B               [ 1] 4092 	ld (x),a 
      0095D1 F6               [ 4] 4093 	ret 
                                   4094 
                                   4095 ;---------------------
                                   4096 ; BASIC: BTOGL addr,mask
                                   4097 ; toggle bits at 'addr' corresponding 
                                   4098 ; to those of 'mask' that are at 1.
                                   4099 ; arguments:
                                   4100 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4101 ;   mask	    mask^*addr  
                                   4102 ; output:
                                   4103 ;	none 
                                   4104 ;--------------------------
      00171E                       4105 bit_toggle:
      0095D2 20 EB F4         [ 4] 4106 	call arg_list 
      0095D4 A1 02            [ 1] 4107 	cp a,#2 
      0095D4 A1 11            [ 1] 4108 	jreq 1$ 
      0095D6 22 0A A0         [ 2] 4109 	jp syntax_error
      0095D9 10               [ 2] 4110 1$: popw x ; mask 
      0095DA 5F               [ 1] 4111 	ld a,xl 
      0095DB 97               [ 2] 4112 	popw x ; addr  
      0095DC 1C               [ 1] 4113 	xor a,(x)
      0095DD 96               [ 1] 4114 	ld (x),a 
      0095DE 20               [ 4] 4115 	ret 
                                   4116 
                                   4117 
                                   4118 ;---------------------
                                   4119 ; BASIC: BTEST(addr,bit)
                                   4120 ; return bit value at 'addr' 
                                   4121 ; bit is in range {0..7}.
                                   4122 ; arguments:
                                   4123 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4124 ;   bit 	    bit position {0..7}  
                                   4125 ; output:
                                   4126 ;	none 
                                   4127 ;--------------------------
      00172E                       4128 bit_test:
      0095DF F6 20 DD         [ 4] 4129 	call func_args 
      0095E2 A1 02            [ 1] 4130 	cp a,#2
      0095E2 A1 22            [ 1] 4131 	jreq 0$
      0095E4 22 0A A0         [ 2] 4132 	jp syntax_error
      001738                       4133 0$:	
      0095E7 20               [ 2] 4134 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095E8 5F               [ 1] 4135 	ld a,xl 
      0095E9 97 1C            [ 1] 4136 	and a,#7
      0095EB 96               [ 1] 4137 	push a   
      0095EC 22 F6            [ 1] 4138 	ld a,#1 
      0095EE 20 CF            [ 1] 4139 1$: tnz (1,sp)
      0095F0 27 05            [ 1] 4140 	jreq 2$
      0095F0 A0               [ 1] 4141 	sll a 
      0095F1 31 48            [ 1] 4142 	dec (1,sp)
      0095F3 5F 97            [ 2] 4143 	jra 1$
      001748                       4144 2$: _drop 1 
      0095F5 1C 96            [ 2]    1     addw sp,#1 
      0095F7 25               [ 2] 4145 	popw x 
      0095F8 FE               [ 1] 4146 	and a,(x)
      0095F9 F6 5C            [ 1] 4147 	jreq 3$
      0095FB 90 F7            [ 1] 4148 	ld a,#1 
      0095FD 90               [ 1] 4149 3$:	clrw x 
      0095FE 5C               [ 1] 4150 	ld xl,a 
      0095FF F6 26            [ 1] 4151 	ld a,#TK_INTGR
      009601 BD               [ 4] 4152 	ret
                                   4153 
                                   4154 
                                   4155 ;--------------------
                                   4156 ; BASIC: POKE addr,byte
                                   4157 ; put a byte at addr 
                                   4158 ;--------------------
      001755                       4159 poke:
      009602 CC 95 1F         [ 4] 4160 	call arg_list 
      009605 A1 02            [ 1] 4161 	cp a,#2
      009605 90 7F            [ 1] 4162 	jreq 1$
      009607 1E 03 7B         [ 2] 4163 	jp syntax_error
      00175F                       4164 1$:	
      00960A 01               [ 2] 4165 	popw x  
      00960B C7               [ 1] 4166     ld a,xl 
      00960C 00               [ 2] 4167 	popw x 
      00960D 0B               [ 1] 4168 	ld (x),a 
      00960E 7B               [ 4] 4169 	ret 
                                   4170 
                                   4171 ;-----------------------
                                   4172 ; BASIC: PEEK(addr)
                                   4173 ; get the byte at addr 
                                   4174 ; input:
                                   4175 ;	none 
                                   4176 ; output:
                                   4177 ;	X 		value 
                                   4178 ;-----------------------
      001764                       4179 peek:
      00960F 02 C7 00         [ 4] 4180 	call func_args
      009612 25 72            [ 1] 4181 	cp a,#1 
      009614 F2 03            [ 1] 4182 	jreq 1$
      009616 90 9F 5B         [ 2] 4183 	jp syntax_error
      009619 04               [ 2] 4184 1$: popw x 
      00961A 81               [ 1] 4185 	ld a,(x)
      00961B 40               [ 1] 4186 	clrw x 
      00961C 28               [ 1] 4187 	ld xl,a 
      00961D 29 2C            [ 1] 4188 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00961F 23               [ 4] 4189 	ret 
                                   4190 
                                   4191 ;---------------------------
                                   4192 ; BASIC IF expr : instructions
                                   4193 ; evaluate expr and if true 
                                   4194 ; execute instructions on same line. 
                                   4195 ;----------------------------
      001775                       4196 if: 
      009620 2B 2D 2A         [ 4] 4197 	call relation 
      009623 2F 25            [ 1] 4198 	cp a,#TK_INTGR
      009625 96 31            [ 1] 4199 	jreq 1$ 
      009627 96 33 96         [ 2] 4200 	jp syntax_error
      00962A 35               [ 1] 4201 1$:	clr a 
      00962B 96               [ 2] 4202 	tnzw x 
      00962C 38 96            [ 1] 4203 	jrne 9$  
                                   4204 ;skip to next line
      00962E 3A 96 3D 3E 00   [ 1] 4205 	mov in,count
      009633 3D               [ 4] 4206 9$:	ret 
                                   4207 
                                   4208 ;------------------------
                                   4209 ; BASIC: FOR var=expr 
                                   4210 ; set variable to expression 
                                   4211 ; leave variable address 
                                   4212 ; on stack and set
                                   4213 ; FLOOP bit in 'flags'
                                   4214 ;-----------------
                           000001  4215 	RETL1=1 ; return address  
                           000003  4216 	FSTEP=3  ; variable increment
                           000005  4217 	LIMIT=5 ; loop limit 
                           000007  4218 	CVAR=7   ; control variable 
                           000009  4219 	INW=9   ;  in.w saved
                           00000B  4220 	BPTR=11 ; baseptr saved
                           00000A  4221 	VSIZE=10  
      001789                       4222 for: ; { -- var_addr }
      009634 00               [ 2] 4223 	popw x ; call return address 
      00178A                       4224 	_vars VSIZE 
      009635 3E 3D            [ 2]    1     sub sp,#VSIZE 
      009637 00               [ 2] 4225 	pushw x  ; RETL1 
      009638 3C 00            [ 1] 4226 	ld a,#TK_VAR 
      00963A 3C 3D 00         [ 4] 4227 	call expect
      00963D 3C 3E            [ 2] 4228 	ldw (CVAR,sp),x  ; control variable 
      00963F 00 13 1F         [ 4] 4229 	call let_var 
      009640 72 14 00 23      [ 1] 4230 	bset flags,#FLOOP 
                                   4231 ; open space on stack for loop data 
      009640 C7               [ 1] 4232 	clrw x 
      009641 00 04            [ 2] 4233 	ldw (BPTR,sp),x 
      009643 E6 02            [ 2] 4234 	ldw (INW,sp),x 
      009645 C1 00 04         [ 4] 4235 	call next_token 
      009648 2A 03            [ 1] 4236 	cp a,#TK_CMD 
      00964A C7 00            [ 1] 4237 	jreq 1$
      00964C 04 CF 00         [ 2] 4238 	jp syntax_error
      0017AA                       4239 1$:  
      00964F 05 90 AE         [ 2] 4240 	cpw x,#to 
      009652 16 90            [ 1] 4241 	jreq to
      009654 CD 94 D8         [ 2] 4242 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4243 
                                   4244 ;-----------------------------------
                                   4245 ; BASIC: TO expr 
                                   4246 ; second part of FOR loop initilization
                                   4247 ; leave limit on stack and set 
                                   4248 ; FTO bit in 'flags'
                                   4249 ;-----------------------------------
      0017B2                       4250 to: ; { var_addr -- var_addr limit step }
      009657 CD AA 40 A6 0D   [ 2] 4251 	btjt flags,#FLOOP,1$
      00965C CD 83 AB         [ 2] 4252 	jp syntax_error
      00965F 81 12 3F         [ 4] 4253 1$: call relation  
      009660 A1 84            [ 1] 4254 	cp a,#TK_INTGR 
      009660 52 01            [ 1] 4255 	jreq 2$ 
      009662 CC 09 1C         [ 2] 4256 	jp syntax_error
      009662 0F 01            [ 2] 4257 2$: ldw (LIMIT,sp),x
                                   4258 ;	ldw x,in.w 
      009664 CD 0A 0E         [ 4] 4259 	call next_token
      009664 CD 8A            [ 1] 4260 	cp a,#TK_NONE  
      009666 8E A1            [ 1] 4261 	jreq 4$ 
      009668 02 25            [ 1] 4262 	cp a,#TK_CMD
      00966A 4F A1            [ 1] 4263 	jrne 3$
      00966C 02 27 12         [ 2] 4264 	cpw x,#step 
      00966F A1 03            [ 1] 4265 	jreq step
      0017D6                       4266 3$:	
      0017D6                       4267 	_unget_token   	 
      009671 27 13 A1 82 27   [ 1]    1      mov in,in.saved  
      0017DB                       4268 4$:	
      009676 15 A1 09         [ 2] 4269 	ldw x,#1   ; default step  
      009679 27 18            [ 2] 4270 	ldw (FSTEP,sp),x 
      00967B A1 0A            [ 2] 4271 	jra store_loop_addr 
                                   4272 
                                   4273 
                                   4274 ;----------------------------------
                                   4275 ; BASIC: STEP expr 
                                   4276 ; optional third par of FOR loop
                                   4277 ; initialization. 	
                                   4278 ;------------------------------------
      0017E2                       4279 step: ; {var limit -- var limit step}
      00967D 27 18 20 28 03   [ 2] 4280 	btjt flags,#FLOOP,1$
      009681 CC 09 1C         [ 2] 4281 	jp syntax_error
      009681 CD AA 40         [ 4] 4282 1$: call relation
      009684 20 DC            [ 1] 4283 	cp a,#TK_INTGR
      009686 27 03            [ 1] 4284 	jreq 2$
      009686 9F CD 83         [ 2] 4285 	jp syntax_error
      009689 AB 20            [ 2] 4286 2$:	ldw (FSTEP,sp),x ; step
                                   4287 ; leave loop back entry point on cstack 
                                   4288 ; cstack is 1 call deep from interpreter
      0017F6                       4289 store_loop_addr:
      00968B D6 00 04         [ 2] 4290 	ldw x,basicptr  
      00968C 1F 0B            [ 2] 4291 	ldw (BPTR,sp),x 
      00968C FD 9F CD         [ 2] 4292 	ldw x,in.w 
      00968F 83 AB            [ 2] 4293 	ldw (INW,sp),x   
      009691 20 CF 00 23      [ 1] 4294 	bres flags,#FLOOP 
      009693 72 5C 00 20      [ 1] 4295 	inc loop_depth  
      009693 03               [ 4] 4296 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4297 
                                   4298 ;--------------------------------
                                   4299 ; BASIC: NEXT var 
                                   4300 ; FOR loop control 
                                   4301 ; increment variable with step 
                                   4302 ; and compare with limit 
                                   4303 ; loop if threshold not crossed.
                                   4304 ; else stack. 
                                   4305 ; and decrement 'loop_depth' 
                                   4306 ;--------------------------------
      001809                       4307 next: ; {var limit step retl1 -- [var limit step ] }
      009694 01 20 CD 20      [ 1] 4308 	tnz loop_depth 
      009697 26 03            [ 1] 4309 	jrne 1$ 
      009697 CD 8A 8E         [ 2] 4310 	jp syntax_error 
      001812                       4311 1$: 
      00969A A1 84            [ 1] 4312 	ld a,#TK_VAR 
      00969C 27 03 CC         [ 4] 4313 	call expect
                                   4314 ; check for good variable after NEXT 	 
      00969F 89 9C            [ 2] 4315 	cpw x,(CVAR,sp)
      0096A1 27 03            [ 1] 4316 	jreq 2$  
      0096A1 9F A4 0F         [ 2] 4317 	jp syntax_error ; not the good one 
      00181E                       4318 2$: ; increment variable 
      0096A4 C7               [ 2] 4319 	ldw x,(x)  ; get var value 
      0096A5 00 25 20         [ 2] 4320 	addw x,(FSTEP,sp) ; var+step 
      0096A8 B9 07            [ 2] 4321 	ldw y,(CVAR,sp)
      0096A9 90 FF            [ 2] 4322 	ldw (y),x ; save var new value 
                                   4323 ; check sign of STEP  
      0096A9 55 00            [ 1] 4324 	ld a,#0x80
      0096AB 03 00            [ 1] 4325 	bcp a,(FSTEP,sp)
      0096AD 02 CD            [ 1] 4326 	jrpl 4$
                                   4327 ;negative step 
      0096AF 92 BF            [ 2] 4328 	cpw x,(LIMIT,sp)
      0096B1 A1 84            [ 1] 4329 	jrslt loop_done
      0096B3 26 05            [ 2] 4330 	jra loop_back 
      001832                       4331 4$: ; positive step
      0096B5 CD 8A            [ 2] 4332 	cpw x,(LIMIT,sp)
      0096B7 EF 20            [ 1] 4333 	jrsgt loop_done
      001836                       4334 loop_back:
      0096B9 A8 0B            [ 2] 4335 	ldw x,(BPTR,sp)
      0096BA CF 00 04         [ 2] 4336 	ldw basicptr,x 
      0096BA 0D 01 26 05 A6   [ 2] 4337 	btjf flags,#FRUN,1$ 
      0096BF 0D CD            [ 1] 4338 	ld a,(2,x)
      0096C1 83 AB 5B         [ 1] 4339 	ld count,a
      0096C4 01 81            [ 2] 4340 1$:	ldw x,(INW,sp)
      0096C6 CF 00 00         [ 2] 4341 	ldw in.w,x 
      0096C6 CE               [ 4] 4342 	ret 
      00184B                       4343 loop_done:
                                   4344 	; remove loop data from stack  
      0096C7 00               [ 2] 4345 	popw x
      00184C                       4346 	_drop VSIZE 
      0096C8 05 1F            [ 2]    1     addw sp,#VSIZE 
      0096CA 03 C6 00 02      [ 1] 4347 	dec loop_depth 
                                   4348 ;	pushw x 
                                   4349 ;	ret 
      0096CE 6B               [ 2] 4350 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4351 
                                   4352 ;----------------------------
                                   4353 ; called by goto/gosub
                                   4354 ; to get target line number 
                                   4355 ;---------------------------
      001853                       4356 get_target_line:
      0096CF 05 C6 00         [ 4] 4357 	call relation 
      0096D2 04 6B            [ 1] 4358 	cp a,#TK_INTGR
      0096D4 06 81            [ 1] 4359 	jreq 1$
      0096D6 CC 09 1C         [ 2] 4360 	jp syntax_error
      0096D6 1E 03 CF         [ 4] 4361 1$:	call search_lineno  
      0096D9 00               [ 2] 4362 	tnzw x 
      0096DA 05 7B            [ 1] 4363 	jrne 2$ 
      0096DC 05 C7            [ 1] 4364 	ld a,#ERR_NO_LINE 
      0096DE 00 02 7B         [ 2] 4365 	jp tb_error 
      0096E1 06               [ 4] 4366 2$:	ret 
                                   4367 
                                   4368 ;------------------------
                                   4369 ; BASIC: GOTO line# 
                                   4370 ; jump to line# 
                                   4371 ; here cstack is 2 call deep from interpreter 
                                   4372 ;------------------------
      001869                       4373 goto:
      0096E2 C7 00 04 81 06   [ 2] 4374 	btjt flags,#FRUN,0$ 
      0096E6 A6 06            [ 1] 4375 	ld a,#ERR_RUN_ONLY
      0096E6 52 07 1E         [ 2] 4376 	jp tb_error 
      0096E8 81               [ 4] 4377 	ret 
      0096E8 0F 05 CD         [ 4] 4378 0$:	call get_target_line
      001877                       4379 jp_to_target:
      0096EB 8A 8E A1         [ 2] 4380 	ldw basicptr,x 
      0096EE 02 26            [ 1] 4381 	ld a,(2,x)
      0096F0 08 CD AA         [ 1] 4382 	ld count,a 
      0096F3 40 03 05 CD      [ 1] 4383 	mov in,#3 
      0096F7 8A               [ 4] 4384 	ret 
                                   4385 
                                   4386 
                                   4387 ;--------------------
                                   4388 ; BASIC: GOSUB line#
                                   4389 ; basic subroutine call
                                   4390 ; actual line# and basicptr 
                                   4391 ; are saved on cstack
                                   4392 ; here cstack is 2 call deep from interpreter 
                                   4393 ;--------------------
                           000003  4394 	RET_ADDR=3
                           000005  4395 	RET_INW=5
                           000004  4396 	VSIZE=4  
      001884                       4397 gosub:
      0096F8 8E A1 85 27 03   [ 2] 4398 	btjt flags,#FRUN,0$ 
      0096FD CC 89            [ 1] 4399 	ld a,#ERR_RUN_ONLY
      0096FF 9C 1F 06         [ 2] 4400 	jp tb_error 
      009702 0D               [ 4] 4401 	ret 
      009703 05               [ 2] 4402 0$:	popw x 
      001890                       4403 	_vars VSIZE  
      009704 26 06            [ 2]    1     sub sp,#VSIZE 
      009706 CD               [ 2] 4404 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009707 94 AF CD         [ 2] 4405 	ldw x,basicptr
      00970A 83 AB            [ 2] 4406 	ldw (RET_ADDR,sp),x 
      00970C CD 18 53         [ 4] 4407 	call get_target_line  
      00970C A6               [ 2] 4408 	pushw x 
      00970D 3A CD 83         [ 2] 4409 	ldw x,in.w 
      009710 AB CD            [ 2] 4410 	ldw (RET_INW+2,sp),x
      009712 96               [ 2] 4411 	popw x 
      009713 C6 72            [ 2] 4412 	jra jp_to_target
                                   4413 
                                   4414 ;------------------------
                                   4415 ; BASIC: RETURN 
                                   4416 ; exit from a subroutine 
                                   4417 ; 
                                   4418 ;------------------------
      0018A4                       4419 return:
      009715 5F 00 04 CD AB   [ 2] 4420 	btjt flags,#FRUN,0$ 
      00971A 45 AE            [ 1] 4421 	ld a,#ERR_RUN_ONLY
      00971C 16 90 3B         [ 2] 4422 	jp tb_error 
      0018AE                       4423 0$:	
      00971F 00 04            [ 2] 4424 	ldw x,(RET_ADDR,sp) 
      009721 4B 00 72         [ 2] 4425 	ldw basicptr,x
      009724 FB 01            [ 1] 4426 	ld a,(2,x)
      009726 5C 5B 02         [ 1] 4427 	ld count,a  
      009729 72 5F            [ 2] 4428 	ldw x,(RET_INW,sp)
      00972B 00 02 CD         [ 2] 4429 	ldw in.w,x 
      00972E 8D               [ 2] 4430 	popw x 
      0018BE                       4431 	_drop VSIZE 
      00972F 1E A1            [ 2]    1     addw sp,#VSIZE 
      009731 84               [ 2] 4432 	pushw x
      009732 27               [ 4] 4433 	ret  
                                   4434 
                                   4435 
                                   4436 ;----------------------------------
                                   4437 ; BASIC: RUN
                                   4438 ; run BASIC program in RAM
                                   4439 ;----------------------------------- 
      0018C2                       4440 run: 
      009733 06 CD 96 D6 CC   [ 2] 4441 	btjf flags,#FRUN,0$  
      009738 89               [ 1] 4442 	clr a 
      009739 9C               [ 4] 4443 	ret
      0018C9                       4444 0$: 
      00973A 16 06 90 FF CD   [ 2] 4445 	btjf flags,#FBREAK,1$
      0018CE                       4446 	_drop 2 
      00973F 96 D6            [ 2]    1     addw sp,#2 
      009741 CD 8A 8E         [ 4] 4447 	call rest_context
      0018D3                       4448 	_drop CTXT_SIZE 
      009744 A1 09            [ 2]    1     addw sp,#CTXT_SIZE 
      009746 27 A0 A1 01      [ 1] 4449 	bres flags,#FBREAK 
      00974A 23 03 CC 89      [ 1] 4450 	bset flags,#FRUN 
      00974E 9C 09 C2         [ 2] 4451 	jp interpreter 
      00974F CE 00 1C         [ 2] 4452 1$:	ldw x,txtbgn
      00974F 5B 07 81         [ 2] 4453 	cpw x,txtend 
      009752 2B 0C            [ 1] 4454 	jrmi run_it 
      009752 55 00 04         [ 2] 4455 	ldw x,#err_no_prog
      009755 00 02 81         [ 4] 4456 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009758 55 00 03 00 01   [ 1] 4457 	mov in,count
      009758 52               [ 4] 4458 	ret 
      0018F4                       4459 run_it:	 
      009759 04 0F 01         [ 4] 4460     call ubound 
      0018F7                       4461 	_drop 2 ; drop return address 
      00975C CD 91            [ 2]    1     addw sp,#2 
                                   4462 ; clear data pointer 
      00975E 74               [ 1] 4463 	clrw x 
      00975F A1 02 24         [ 2] 4464 	ldw data_ptr,x 
      009762 03 CC 89 9C      [ 1] 4465 	clr data_ofs 
      009766 A1 03 25 04      [ 1] 4466 	clr data_len 
                                   4467 ; initialize BASIC pointer 
      00976A 85 9F 6B         [ 2] 4468 	ldw x,txtbgn 
      00976D 01 85 9F         [ 2] 4469 	ldw basicptr,x 
      009770 6B 02            [ 1] 4470 	ld a,(2,x)
      009772 85 F6 14         [ 1] 4471 	ld count,a
      009775 02 18 01 27      [ 1] 4472 	mov in,#3	
      009779 F9 5B 04 81      [ 1] 4473 	bset flags,#FRUN 
      00977D CC 09 C2         [ 2] 4474 	jp interpreter 
                                   4475 
                                   4476 
                                   4477 ;----------------------
                                   4478 ; BASIC: END
                                   4479 ; end running program
                                   4480 ;---------------------- 
      00191B                       4481 cmd_end: 
                                   4482 ; clean stack 
      00977D CD 91 74         [ 2] 4483 	ldw x,#STACK_EMPTY
      009780 A1               [ 1] 4484 	ldw sp,x 
      009781 02 27 03         [ 2] 4485 	jp warm_start
                                   4486 
                                   4487 ;-----------------
                                   4488 ; 1 Khz beep 
                                   4489 ;-----------------
      001922                       4490 beep_1khz:: 
      009784 CC 89 9C         [ 2] 4491 	ldw x,#100
      009787 90 AE 03 E8      [ 2] 4492 	ldw y,#1000
      009787 85 9F            [ 2] 4493 	jra beep
                                   4494 
                                   4495 ;-----------------------
                                   4496 ; BASIC: TONE expr1,expr2
                                   4497 ; used TIMER2 channel 1
                                   4498 ; to produce a tone 
                                   4499 ; arguments:
                                   4500 ;    expr1   frequency 
                                   4501 ;    expr2   duration msec.
                                   4502 ;---------------------------
      00192B                       4503 tone:
      009789 85 FA F7         [ 4] 4504 	call arg_list 
      00978C 81 02            [ 1] 4505 	cp a,#2 
      00978D 27 03            [ 1] 4506 	jreq 1$
      00978D CD 91 74         [ 2] 4507 	jp syntax_error 
      001935                       4508 1$: 
      009790 A1               [ 2] 4509 	popw x ; duration
      009791 02 27            [ 2] 4510 	popw y ; frequency 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      001938                       4511 beep:  
      009793 03               [ 2] 4512 	pushw x 
      009794 CC 89 9C         [ 2] 4513 	ldw x,#TIM2_CLK_FREQ
      009797 65               [ 2] 4514 	divw x,y 
                                   4515 ; round to nearest integer 
      009797 85 9F 43 85      [ 2] 4516 	cpw y,#TIM2_CLK_FREQ/2
      00979B F4 F7            [ 1] 4517 	jrmi 2$
      00979D 81               [ 1] 4518 	incw x 
      00979E                       4519 2$:	 
      00979E CD               [ 1] 4520 	ld a,xh 
      00979F 91 74 A1         [ 1] 4521 	ld TIM2_ARRH,a 
      0097A2 02               [ 1] 4522 	ld a,xl 
      0097A3 27 03 CC         [ 1] 4523 	ld TIM2_ARRL,a 
                                   4524 ; 50% duty cycle 
      0097A6 89               [ 1] 4525 	ccf 
      0097A7 9C               [ 2] 4526 	rrcw x 
      0097A8 85               [ 1] 4527 	ld a,xh 
      0097A9 9F 85 F8         [ 1] 4528 	ld TIM2_CCR1H,a 
      0097AC F7               [ 1] 4529 	ld a,xl
      0097AD 81 53 10         [ 1] 4530 	ld TIM2_CCR1L,a
      0097AE 72 10 53 08      [ 1] 4531 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0097AE CD 91 6F A1      [ 1] 4532 	bset TIM2_CR1,#TIM2_CR1_CEN
      0097B2 02 27 03 CC      [ 1] 4533 	bset TIM2_EGR,#TIM2_EGR_UG
      0097B6 89               [ 2] 4534 	popw x 
      0097B7 9C 1E F1         [ 4] 4535 	call pause02
      0097B8 72 11 53 08      [ 1] 4536 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0097B8 85 9F A4 07      [ 1] 4537 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0097BC 88               [ 4] 4538 	ret 
                                   4539 
                                   4540 ;-------------------------------
                                   4541 ; BASIC: ADCON 0|1 [,divisor]  
                                   4542 ; disable/enanble ADC 
                                   4543 ;-------------------------------
                           000003  4544 	ONOFF=3 
                           000001  4545 	DIVSOR=1
                           000004  4546 	VSIZE=4 
      00196F                       4547 power_adc:
      0097BD A6 01 0D         [ 4] 4548 	call arg_list 
      0097C0 01 27            [ 1] 4549 	cp a,#2	
      0097C2 05 48            [ 1] 4550 	jreq 1$
      0097C4 0A 01            [ 1] 4551 	cp a,#1 
      0097C6 20 F7            [ 1] 4552 	jreq 0$ 
      0097C8 5B 01 85         [ 2] 4553 	jp syntax_error 
      0097CB F4 27 02         [ 2] 4554 0$: ldw x,#0
      0097CE A6               [ 2] 4555 	pushw x  ; divisor 
      0097CF 01 5F            [ 2] 4556 1$: ldw x,(ONOFF,sp)
      0097D1 97               [ 2] 4557 	tnzw x 
      0097D2 A6 84            [ 1] 4558 	jreq 2$ 
      0097D4 81 01            [ 2] 4559 	ldw x,(DIVSOR,sp) ; divisor 
      0097D5 9F               [ 1] 4560 	ld a,xl
      0097D5 CD 91            [ 1] 4561 	and a,#7
      0097D7 74               [ 1] 4562 	swap a 
      0097D8 A1 02 27         [ 1] 4563 	ld ADC_CR1,a
      0097DB 03 CC 89 9C      [ 1] 4564 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0097DF 72 10 54 01      [ 1] 4565 	bset ADC_CR1,#ADC_CR1_ADON 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      001997                       4566 	_usec_dly 7 
      0097DF 85 9F 85         [ 2]    1     ldw x,#(16*7-2)/4
      0097E2 F7               [ 2]    2     decw x
      0097E3 81               [ 1]    3     nop 
      0097E4 26 FA            [ 1]    4     jrne .-4
      0097E4 CD 91            [ 2] 4567 	jra 3$
      0097E6 6F A1 01 27      [ 1] 4568 2$: bres ADC_CR1,#ADC_CR1_ADON
      0097EA 03 CC 89 9C      [ 1] 4569 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0019A8                       4570 3$:	_drop VSIZE 
      0097EE 85 F6            [ 2]    1     addw sp,#VSIZE 
      0097F0 5F               [ 4] 4571 	ret
                                   4572 
                                   4573 ;-----------------------------
                                   4574 ; BASIC: ADCREAD (channel)
                                   4575 ; read adc channel {0..5}
                                   4576 ; output:
                                   4577 ;   A 		TK_INTGR 
                                   4578 ;   X 		value 
                                   4579 ;-----------------------------
      0019AB                       4580 analog_read:
      0097F1 97 A6 84         [ 4] 4581 	call func_args 
      0097F4 81 01            [ 1] 4582 	cp a,#1 
      0097F5 27 03            [ 1] 4583 	jreq 1$
      0097F5 CD 92 BF         [ 2] 4584 	jp syntax_error
      0097F8 A1               [ 2] 4585 1$: popw x 
      0097F9 84 27 03         [ 2] 4586 	cpw x,#5 
      0097FC CC 89            [ 2] 4587 	jrule 2$
      0097FE 9C 4F            [ 1] 4588 	ld a,#ERR_BAD_VALUE
      009800 5D 26 05         [ 2] 4589 	jp tb_error 
      009803 55               [ 1] 4590 2$: ld a,xl
      009804 00 04 00         [ 1] 4591 	ld acc8,a 
      009807 02 81            [ 1] 4592 	ld a,#5
      009809 C0 00 0D         [ 1] 4593 	sub a,acc8 
      009809 85 52 0A         [ 1] 4594 	ld ADC_CSR,a
      00980C 89 A6 85 CD      [ 1] 4595 	bset ADC_CR2,#ADC_CR2_ALIGN
      009810 91 62 1F 07      [ 1] 4596 	bset ADC_CR1,#ADC_CR1_ADON
      009814 CD 93 9F 72 14   [ 2] 4597 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009819 00 24 5F         [ 2] 4598 	ldw x,ADC_DRH
      00981C 1F 0B            [ 1] 4599 	ld a,#TK_INTGR
      00981E 1F               [ 4] 4600 	ret 
                                   4601 
                                   4602 ;-----------------------
                                   4603 ; BASIC: DREAD(pin)
                                   4604 ; Arduino pins 
                                   4605 ; read state of a digital pin 
                                   4606 ; pin# {0..15}
                                   4607 ; output:
                                   4608 ;    A 		TK_INTGR
                                   4609 ;    X      0|1 
                                   4610 ;-------------------------
                           000001  4611 	PINNO=1
                           000001  4612 	VSIZE=1
      0019DF                       4613 digital_read:
      0019DF                       4614 	_vars VSIZE 
      00981F 09 CD            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009821 8A 8E A1         [ 4] 4615 	call func_args
      009824 80 27            [ 1] 4616 	cp a,#1
      009826 03 CC            [ 1] 4617 	jreq 1$
      009828 89 9C 1C         [ 2] 4618 	jp syntax_error
      00982A 85               [ 2] 4619 1$: popw x 
      00982A A3 98 32         [ 2] 4620 	cpw x,#15 
      00982D 27 03            [ 2] 4621 	jrule 2$
      00982F CC 89            [ 1] 4622 	ld a,#ERR_BAD_VALUE
      009831 9C 09 1E         [ 2] 4623 	jp tb_error 
      009832 CD 20 2F         [ 4] 4624 2$:	call select_pin 
      009832 72 04            [ 1] 4625 	ld (PINNO,sp),a
      009834 00 24            [ 1] 4626 	ld a,(GPIO_IDR,x)
      009836 03 CC            [ 1] 4627 	tnz (PINNO,sp)
      009838 89 9C            [ 1] 4628 	jreq 8$
      00983A CD               [ 1] 4629 3$: srl a 
      00983B 92 BF            [ 1] 4630 	dec (PINNO,sp)
      00983D A1 84            [ 1] 4631 	jrne 3$ 
      00983F 27 03            [ 1] 4632 8$: and a,#1 
      009841 CC               [ 1] 4633 	clrw x 
      009842 89               [ 1] 4634 	ld xl,a 
      009843 9C 1F            [ 1] 4635 	ld a,#TK_INTGR
      001A0C                       4636 	_drop VSIZE
      009845 05 CD            [ 2]    1     addw sp,#VSIZE 
      009847 8A               [ 4] 4637 	ret
                                   4638 
                                   4639 ;-----------------------
                                   4640 ; BASIC: DWRITE pin,0|1
                                   4641 ; Arduino pins 
                                   4642 ; write to a digital pin 
                                   4643 ; pin# {0..15}
                                   4644 ; output:
                                   4645 ;    A 		TK_INTGR
                                   4646 ;    X      0|1 
                                   4647 ;-------------------------
                           000001  4648 	PINNO=1
                           000002  4649 	PINVAL=2
                           000002  4650 	VSIZE=2
      001A0F                       4651 digital_write:
      001A0F                       4652 	_vars VSIZE 
      009848 8E A1            [ 2]    1     sub sp,#VSIZE 
      00984A 00 27 0E         [ 4] 4653 	call arg_list  
      00984D A1 80            [ 1] 4654 	cp a,#2 
      00984F 26 05            [ 1] 4655 	jreq 1$
      009851 A3 98 62         [ 2] 4656 	jp syntax_error
      009854 27               [ 2] 4657 1$: popw x 
      009855 0C               [ 1] 4658 	ld a,xl 
      009856 6B 02            [ 1] 4659 	ld (PINVAL,sp),a
      009856 55               [ 2] 4660 	popw x 
      009857 00 03 00         [ 2] 4661 	cpw x,#15 
      00985A 02 05            [ 2] 4662 	jrule 2$
      00985B A6 0A            [ 1] 4663 	ld a,#ERR_BAD_VALUE
      00985B AE 00 01         [ 2] 4664 	jp tb_error 
      00985E 1F 03 20         [ 4] 4665 2$:	call select_pin 
      009861 14 01            [ 1] 4666 	ld (PINNO,sp),a 
      009862 A6 01            [ 1] 4667 	ld a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009862 72 04            [ 1] 4668 	tnz (PINNO,sp)
      009864 00 24            [ 1] 4669 	jreq 4$
      009866 03               [ 1] 4670 3$: sll a
      009867 CC 89            [ 1] 4671 	dec (PINNO,sp)
      009869 9C CD            [ 1] 4672 	jrne 3$
      00986B 92 BF            [ 1] 4673 4$: tnz (PINVAL,sp)
      00986D A1 84            [ 1] 4674 	jrne 5$
      00986F 27               [ 1] 4675 	cpl a 
      009870 03 CC            [ 1] 4676 	and a,(GPIO_ODR,x)
      009872 89 9C            [ 2] 4677 	jra 8$
      009874 1F 03            [ 1] 4678 5$: or a,(GPIO_ODR,x)
      009876 E7 00            [ 1] 4679 8$: ld (GPIO_ODR,x),a 
      001A47                       4680 	_drop VSIZE 
      009876 CE 00            [ 2]    1     addw sp,#VSIZE 
      009878 05               [ 4] 4681 	ret
                                   4682 
                                   4683 
                                   4684 ;-----------------------
                                   4685 ; BASIC: STOP
                                   4686 ; stop progam execution  
                                   4687 ; without resetting pointers 
                                   4688 ; the program is resumed
                                   4689 ; with RUN 
                                   4690 ;-------------------------
      001A4A                       4691 stop:
      009879 1F 0B CE 00 01   [ 2] 4692 	btjt flags,#FRUN,2$
      00987E 1F               [ 1] 4693 	clr a
      00987F 09               [ 4] 4694 	ret 
      001A51                       4695 2$:	 
                                   4696 ; create space on cstack to save context 
      009880 72 15 00         [ 2] 4697 	ldw x,#break_point 
      009883 24 72 5C         [ 4] 4698 	call puts 
      001A57                       4699 	_drop 2 ;drop return address 
      009886 00 21            [ 2]    1     addw sp,#2 
      001A59                       4700 	_vars CTXT_SIZE ; context size 
      009888 81 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009889 CD 16 46         [ 4] 4701 	call save_context 
      009889 72 5D 00         [ 2] 4702 	ldw x,#tib 
      00988C 21 26 03         [ 2] 4703 	ldw basicptr,x
      00988F CC               [ 1] 4704 	clr (x)
      009890 89 9C 00 03      [ 1] 4705 	clr count  
      009892 5F               [ 1] 4706 	clrw x 
      009892 A6 85 CD         [ 2] 4707 	ldw in.w,x
      009895 91 62 13 07      [ 1] 4708 	bres flags,#FRUN 
      009899 27 03 CC 89      [ 1] 4709 	bset flags,#FBREAK
      00989D 9C 09 C2         [ 2] 4710 	jp interpreter 
      00989E 0A 62 72 65 61 6B 20  4711 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4712 
                                   4713 ;-----------------------
                                   4714 ; BASIC: NEW
                                   4715 ; from command line only 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4716 ; free program memory
                                   4717 ; and clear variables 
                                   4718 ;------------------------
      001A96                       4719 new: 
      00989E FE 72 FB 03 16   [ 2] 4720 	btjf flags,#FRUN,0$ 
      0098A3 07               [ 4] 4721 	ret 
      001A9C                       4722 0$:	
      0098A4 90 FF A6         [ 4] 4723 	call clear_basic 
      0098A7 80               [ 4] 4724 	ret 
                                   4725 	 
                                   4726 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4727 ;  file system routines
                                   4728 ;  MCU flash memory from
                                   4729 ;  0x10000-0x27fff is 
                                   4730 ;  used to store BASIC 
                                   4731 ;  program files. 
                                   4732 ;  use 128 bytes sectors
                                   4733 ;  because this is the MCU 
                                   4734 ;  row size.
                                   4735 ;  file entry aligned to row
                                   4736 ;  	name  variable length
                                   4737 ;  	size  2 bytes  
                                   4738 ; 	data  variable length 
                                   4739 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4740 
                                   4741 ;---------------------------
                                   4742 ; fill pad with zeros 
                                   4743 ;--------------------------
      001AA0                       4744 zero_pad:
      0098A8 15 03 2A         [ 2] 4745 	ldw x,#pad 
      0098AB 06 13            [ 1] 4746 	ld a,#PAD_SIZE 
      0098AD 05               [ 1] 4747 1$:	clr (x)
      0098AE 2F               [ 1] 4748 	incw x 
      0098AF 1B               [ 1] 4749 	dec a 
      0098B0 20 04            [ 1] 4750 	jrne 1$
      0098B2 81               [ 4] 4751 	ret 
                                   4752 
                                   4753 ;--------------------------
                                   4754 ; align farptr to BLOCK_SIZE 
                                   4755 ;---------------------------
      001AAB                       4756 row_align:
      0098B2 13 05            [ 1] 4757 	ld a,#0x7f 
      0098B4 2C 15 18         [ 1] 4758 	and a,farptr+2 
      0098B6 27 13            [ 1] 4759 	jreq 1$ 
      0098B6 1E 0B CF         [ 2] 4760 	ldw x,farptr+1 
      0098B9 00 05 72         [ 2] 4761 	addw x,#BLOCK_SIZE 
      0098BC 01 00            [ 1] 4762 	jrnc 0$
      0098BE 24 05 E6 02      [ 1] 4763 	inc farptr 
      0098C2 C7               [ 1] 4764 0$: ld a,xl 
      0098C3 00 04            [ 1] 4765 	and a,#0x80
      0098C5 1E               [ 1] 4766 	ld xl,a
      0098C6 09 CF 00         [ 2] 4767 	ldw farptr+1,x  	
      0098C9 01               [ 4] 4768 1$:	ret
                                   4769 
                                   4770 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4771 ; input:
                                   4772 ;   X     increment 
                                   4773 ; output:
                                   4774 ;   farptr  incremented 
                                   4775 ;---------------------
      001AC6                       4776 incr_farptr:
      0098CA 81 BB 00 17      [ 2] 4777 	addw x,farptr+1 
      0098CB 24 04            [ 1] 4778 	jrnc 1$
      0098CB 85 5B 0A 72      [ 1] 4779 	inc farptr 
      0098CF 5A 00 21         [ 2] 4780 1$:	ldw farptr+1,x  
      0098D2 FC               [ 4] 4781 	ret 
                                   4782 
                                   4783 ;------------------------------
                                   4784 ; extended flash memory used as FLASH_DRIVE 
                                   4785 ; seek end of used flash drive   
                                   4786 ; starting at 0x10000 address.
                                   4787 ; 4 consecutives 0 bytes signal free space. 
                                   4788 ; input:
                                   4789 ;	none
                                   4790 ; output:
                                   4791 ;   ffree     free_addr| 0 if memory full.
                                   4792 ;------------------------------
      0098D3                       4793 seek_fdrive:
                                   4794 ; start scan at 0x10000 address 
      0098D3 CD 92            [ 1] 4795 	ld a,#1
      0098D5 BF A1 84         [ 1] 4796 	ld farptr,a 
      0098D8 27               [ 1] 4797 	clrw x 
      0098D9 03 CC 89         [ 2] 4798 	ldw farptr+1,x 
      001ADD                       4799 1$:
      0098DC 9C CD 85         [ 2] 4800 	ldw x,#3  
      0098DF 20 5D 26 05      [ 5] 4801 2$:	ldf a,([farptr],x) 
      0098E3 A6 05            [ 1] 4802 	jrne 3$
      0098E5 CC               [ 2] 4803 	decw x
      0098E6 89 9E            [ 1] 4804 	jrpl 2$
      0098E8 81 0E            [ 2] 4805 	jra 4$ 
      0098E9 AE 00 80         [ 2] 4806 3$:	ldw x,#BLOCK_SIZE 
      0098E9 72 00 00         [ 4] 4807 	call incr_farptr
      0098EC 24 06 A6         [ 2] 4808 	ldw x,#0x280  
      0098EF 06 CC 89         [ 2] 4809 	cpw x,farptr
      0098F2 9E 81            [ 1] 4810 	jrugt 1$
      001AF9                       4811 4$: ; copy farptr to ffree	 
      0098F4 CD 98 D3         [ 2] 4812 	ldw x,farptr 
      0098F7 C6 00 18         [ 1] 4813 	ld a,farptr+2 
      0098F7 CF 00 05         [ 2] 4814 	ldw ffree,x 
      0098FA E6 02 C7         [ 1] 4815 	ld ffree+2,a  
      0098FD 00               [ 4] 4816 	ret 
                                   4817 
                                   4818 ;-----------------------
                                   4819 ; return amount of free 
                                   4820 ; space on flash drive
                                   4821 ; input:
                                   4822 ;   none
                                   4823 ; output:
                                   4824 ;   acc24   free space 
                                   4825 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001B06                       4826 disk_free:
      0098FE 04 35 03         [ 2] 4827 	ldw x,#0x8000
      009901 00 02 81 1A      [ 2] 4828 	subw x,ffree+1
      009904 A6 02            [ 1] 4829 	ld a,#2
      009904 72 00 00         [ 1] 4830 	sbc a,ffree 
      009907 24 06 A6         [ 1] 4831 	ld acc24,a 
      00990A 06 CC 89         [ 2] 4832 	ldw acc16,x 
      00990D 9E               [ 4] 4833 	ret 
                                   4834 
                                   4835 ;-----------------------
                                   4836 ; compare file name 
                                   4837 ; with name pointed by Y  
                                   4838 ; input:
                                   4839 ;   farptr   file name 
                                   4840 ;   Y        target name 
                                   4841 ; output:
                                   4842 ;   farptr 	 at file_name
                                   4843 ;   X 		 farptr[x] point at size field  
                                   4844 ;   Carry    0|1 no match|match  
                                   4845 ;----------------------
      001B19                       4846 cmp_name:
      00990E 81               [ 1] 4847 	clrw x
      00990F 85 52 04 89      [ 5] 4848 1$:	ldf a,([farptr],x)
      009913 CE 00            [ 1] 4849 	cp a,(y)
      009915 05 1F            [ 1] 4850 	jrne 4$
      009917 03               [ 1] 4851 	tnz a 
      009918 CD 98            [ 1] 4852 	jreq 9$ 
      00991A D3               [ 1] 4853     incw x 
      00991B 89 CE            [ 1] 4854 	incw y 
      00991D 00 01            [ 2] 4855 	jra 1$
      001B2A                       4856 4$: ;no match 
      00991F 1F               [ 1] 4857 	tnz a 
      009920 07 85            [ 1] 4858 	jreq 5$
      009922 20               [ 1] 4859 	incw x 
      009923 D3 AF 00 16      [ 5] 4860 	ldf a,([farptr],x)
      009924 20 F6            [ 2] 4861 	jra 4$  
      009924 72               [ 1] 4862 5$:	incw x ; farptr[x] point at 'size' field 
      009925 00               [ 1] 4863 	rcf 
      009926 00               [ 4] 4864 	ret
      001B37                       4865 9$: ; match  
      009927 24               [ 1] 4866 	incw x  ; farptr[x] at 'size' field 
      009928 05               [ 1] 4867 	scf 
      009929 A6               [ 4] 4868 	ret 
                                   4869 
                                   4870 ;-----------------------
                                   4871 ; search file in 
                                   4872 ; flash memory 
                                   4873 ; input:
                                   4874 ;   Y       file name  
                                   4875 ; output:
                                   4876 ;   farptr  addr at name|0
                                   4877 ;   X       offset to size field
                                   4878 ;   Carray   0 not found, 1 found 
                                   4879 ;-----------------------
                           000001  4880 	FSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                           000003  4881 	YSAVE=3
                           000004  4882 	VSIZE=4 
      001B3A                       4883 search_file: 
      001B3A                       4884 	_vars VSIZE
      00992A 06 CC            [ 2]    1     sub sp,#VSIZE 
      00992C 89 9E            [ 2] 4885 	ldw (YSAVE,sp),y  
      00992E 5F               [ 1] 4886 	clrw x 
      00992E 1E 03 CF         [ 2] 4887 	ldw farptr+1,x 
      009931 00 05 E6 02      [ 1] 4888 	mov farptr,#1
      001B46                       4889 1$:	
                                   4890 ; check if farptr is after any file 
                                   4891 ; if  0 then so.
      009935 C7 00 04 1E      [ 5] 4892 	ldf a,[farptr]
      009939 05 CF            [ 1] 4893 	jreq 6$
      00993B 00               [ 1] 4894 2$: clrw x 	
      00993C 01 85            [ 2] 4895 	ldw y,(YSAVE,sp) 
      00993E 5B 04 89         [ 4] 4896 	call cmp_name
      009941 81 2F            [ 1] 4897 	jrc 9$
      009942 92 AF 00 16      [ 5] 4898 	ldf a,([farptr],x)
      009942 72 01            [ 1] 4899 	ld (FSIZE,sp),a 
      009944 00               [ 1] 4900 	incw x 
      009945 24 02 4F 81      [ 5] 4901 	ldf a,([farptr],x)
      009949 6B 02            [ 1] 4902 	ld (FSIZE+1,sp),a 
      009949 72               [ 1] 4903 	incw x 
      00994A 09 00 24         [ 2] 4904 	addw x,(FSIZE,sp) ; skip over file data
      00994D 12 5B 02         [ 4] 4905 	call incr_farptr
      009950 CD 96 D6         [ 4] 4906 	call row_align  
      009953 5B 04 72         [ 2] 4907 	ldw x,#0x280
      009956 19 00 24         [ 2] 4908 	cpw x,farptr 
      009959 72 10            [ 1] 4909 	jrpl 1$
      001B73                       4910 6$: ; file not found 
      00995B 00 24 CC 8A      [ 1] 4911 	clr farptr
      00995F 42 CE 00 1D      [ 1] 4912 	clr farptr+1 
      009963 C3 00 1F 2B      [ 1] 4913 	clr farptr+2 
      001B7F                       4914 	_drop VSIZE 
      009967 0C AE            [ 2]    1     addw sp,#VSIZE 
      009969 89               [ 1] 4915 	rcf
      00996A 35               [ 4] 4916 	ret
      001B83                       4917 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B83                       4918 	_drop VSIZE 
      00996B CD AA            [ 2]    1     addw sp,#VSIZE 
      00996D 40               [ 1] 4919 	scf 	
      00996E 55               [ 4] 4920 	ret
                                   4921 
                                   4922 ;--------------------------------
                                   4923 ; BASIC: SAVE "name" 
                                   4924 ; save text program in 
                                   4925 ; flash memory used as permanent
                                   4926 ; storage from address 0x10000-0x27fff 
                                   4927 ;--------------------------------
                           000001  4928 	BSIZE=1
                           000003  4929 	NAMEPTR=3
                           000005  4930 	XSAVE=5
                           000007  4931 	YSAVE=7
                           000008  4932 	VSIZE=8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001B87                       4933 save:
      00996F 00 04 00 02 81   [ 2] 4934 	btjf flags,#FRUN,0$ 
      009974 A6 07            [ 1] 4935 	ld a,#ERR_CMD_ONLY 
      009974 CD 93 6C         [ 2] 4936 	jp tb_error
      001B91                       4937 0$:	 
      009977 5B 02 5F         [ 2] 4938 	ldw x,txtend 
      00997A CF 00 07 72      [ 2] 4939 	subw x,txtbgn
      00997E 5F 00            [ 1] 4940 	jrne 1$
                                   4941 ; nothing to save 
      009980 09 72 5F         [ 2] 4942 	ldw x,#err_no_prog 
      009983 00 0A CE         [ 4] 4943 	call puts 
      009986 00 1D CF 00 05   [ 1] 4944 	mov in,count 
      00998B E6               [ 4] 4945 	ret  	
      001BA6                       4946 1$:	
      001BA6                       4947 	_vars VSIZE 
      00998C 02 C7            [ 2]    1     sub sp,#VSIZE 
      00998E 00 04            [ 2] 4948 	ldw (BSIZE,sp),x 
      009990 35 03 00         [ 4] 4949 	call next_token	
      009993 02 72            [ 1] 4950 	cp a,#TK_QSTR
      009995 10 00            [ 1] 4951 	jreq 2$
      009997 24 CC 8A         [ 2] 4952 	jp syntax_error
      001BB4                       4953 2$: 
      00999A 42 03            [ 2] 4954 	ldw (NAMEPTR,sp),x  
      00999B CD 01 9C         [ 4] 4955 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4956 ; check if enough free space 
      00999B AE 17            [ 2] 4957 	ldw x,(NAMEPTR,sp)
      00999D FF 94 CC         [ 4] 4958 	call strlen 
      0099A0 8A 23            [ 1] 4959 	add a,#3
      0099A2 5F               [ 1] 4960 	clrw x 
      0099A2 AE               [ 1] 4961 	ld xl,a 
      0099A3 00 64 90         [ 2] 4962 	addw x,(BSIZE,sp)
      0099A6 AE               [ 1] 4963 	clr a 
      0099A7 03 E8 20 0D      [ 2] 4964 	addw x,ffree+1 
      0099AB C9 00 19         [ 1] 4965 	adc a,ffree 
      0099AB CD 91            [ 1] 4966 	cp a,#2
      0099AD 74 A1            [ 1] 4967 	jrmi 21$
      0099AF 02 27 03         [ 2] 4968 	cpw x,#0x8000
      0099B2 CC 89            [ 1] 4969 	jrmi 21$
      0099B4 9C 0E            [ 1] 4970 	ld a,#ERR_NO_FSPACE  
      0099B5 CC 09 1E         [ 2] 4971 	jp tb_error
      001BDB                       4972 21$: 
                                   4973 ; check for existing file of that name 
      0099B5 85 90            [ 2] 4974 	ldw y,(NAMEPTR,sp)	
      0099B7 85 1B 3A         [ 4] 4975 	call search_file 
      0099B8 24 05            [ 1] 4976 	jrnc 3$ 
      0099B8 89 AE            [ 1] 4977 	ld a,#ERR_DUPLICATE 
      0099BA F4 24 65         [ 2] 4978 	jp tb_error 
      001BE7                       4979 3$:	; initialize farptr 
      0099BD 90 A3 7A         [ 2] 4980 	ldw x,ffree 
      0099C0 12 2B 01         [ 1] 4981 	ld a,ffree+2 
      0099C3 5C 00 16         [ 2] 4982 	ldw farptr,x 
      0099C4 C7 00 18         [ 1] 4983 	ld farptr+2,a 
                                   4984 ;** write file name to row buffer **	
      0099C4 9E C7            [ 2] 4985 	ldw y,(NAMEPTR,sp)  
      0099C6 53 0D 9F         [ 2] 4986 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099C9 C7 53 0E         [ 4] 4987 	call strcpy
      0099CC 8C 56 9E         [ 4] 4988 	call strlen 
      0099CF C7               [ 1] 4989 	clrw x 
      0099D0 53               [ 1] 4990 	ld xl,a 
      0099D1 0F               [ 1] 4991 	incw  x
      0099D2 9F C7 53         [ 2] 4992 	addw x,#pad 
                                   4993 ; ** write file size to row buffer 
      0099D5 10 72            [ 2] 4994 	ldw y,(BSIZE,sp)
      0099D7 10               [ 2] 4995 	ldw (x),y 
      0099D8 53 08 72         [ 2] 4996 	addw x,#2 
                                   4997 ; ** write file data to row buffer 
      0099DB 10 53 00 72      [ 2] 4998 	ldw y,txtbgn 
      0099DF 10 53            [ 1] 4999 6$:	ld a,(y)
      0099E1 04 85            [ 1] 5000 	incw y
      0099E3 CD               [ 1] 5001 	ld (x),a 
      0099E4 9F               [ 1] 5002 	incw x
      0099E5 71 72 11 53      [ 2] 5003 	cpw y,txtend 
      0099E9 08 72            [ 1] 5004 	jreq 12$
      0099EB 11 53 00         [ 2] 5005 	cpw x,#stack_full 
      0099EE 81 EF            [ 1] 5006 	jrmi 6$
      0099EF                       5007 12$:
      0099EF CD 91            [ 2] 5008 	ldw (YSAVE,sp),y 
      001C21                       5009 14$: ; zero buffer end 
      0099F1 74 A1 02         [ 2] 5010 	cpw x,#stack_full
      0099F4 27 0B            [ 1] 5011 	jreq 16$
      0099F6 A1               [ 1] 5012 	clr (x)
      0099F7 01               [ 1] 5013 	incw x 
      0099F8 27 03            [ 2] 5014 	jra 14$
      001C2A                       5015 16$:
      0099FA CC 89 9C         [ 2] 5016 	ldw x,#pad 
      0099FD AE 00 00         [ 4] 5017 	call write_row 
      009A00 89 1E 03         [ 2] 5018 	ldw x,#BLOCK_SIZE 
      009A03 5D 27 1A         [ 4] 5019 	call incr_farptr
      009A06 1E 01 9F         [ 2] 5020 	ldw x,#pad 
      009A09 A4 07            [ 2] 5021 	ldw y,(YSAVE,sp)
      009A0B 4E C7 54 01      [ 2] 5022 	cpw y,txtend 
      009A0F 72 16            [ 1] 5023 	jrmi 6$
                                   5024 ; save farptr in ffree
      009A11 50 CA 72         [ 2] 5025 	ldw x,farptr 
      009A14 10 54 01         [ 1] 5026 	ld a,farptr+2 
      009A17 AE 00 1B         [ 2] 5027 	ldw ffree,x 
      009A1A 5A 9D 26         [ 1] 5028 	ld ffree+2,a
                                   5029 ; print file size 	
      009A1D FA 20            [ 2] 5030 	ldw x,(BSIZE,sp) 
      009A1F 08 72 11         [ 4] 5031 	call print_int 
      001C52                       5032 	_drop VSIZE 
      009A22 54 01            [ 2]    1     addw sp,#VSIZE 
      009A24 72               [ 4] 5033 	ret 
                                   5034 
                                   5035 ;----------------------
                                   5036 ; load file in RAM memory
                                   5037 ; input:
                                   5038 ;    farptr point at file size 
                                   5039 ; output:
                                   5040 ;   y point after BASIC program in RAM.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5041 ;------------------------
      001C55                       5042 load_file:
      009A25 17 50 CA         [ 4] 5043 	call incr_farptr  
      009A28 5B 04 81         [ 4] 5044 	call clear_basic  
      009A2B 5F               [ 1] 5045 	clrw x
      009A2B CD 91 6F A1      [ 5] 5046 	ldf a,([farptr],x)
      009A2F 01 27            [ 1] 5047 	ld yh,a 
      009A31 03               [ 1] 5048 	incw x  
      009A32 CC 89 9C 85      [ 5] 5049 	ldf a,([farptr],x)
      009A36 A3               [ 1] 5050 	incw x 
      009A37 00 05            [ 1] 5051 	ld yl,a 
      009A39 23 05 A6 0A      [ 2] 5052 	addw y,txtbgn
      009A3D CC 89 9E 9F      [ 2] 5053 	ldw txtend,y
      009A41 C7 00 0E A6      [ 2] 5054 	ldw y,txtbgn
      001C76                       5055 3$:	; load BASIC text 	
      009A45 05 C0 00 0E      [ 5] 5056 	ldf a,([farptr],x)
      009A49 C7 54            [ 1] 5057 	ld (y),a 
      009A4B 00               [ 1] 5058 	incw x 
      009A4C 72 16            [ 1] 5059 	incw y 
      009A4E 54 02 72 10      [ 2] 5060 	cpw y,txtend 
      009A52 54 01            [ 1] 5061 	jrmi 3$
      009A54 72               [ 4] 5062 	ret 
                                   5063 
                                   5064 ;------------------------
                                   5065 ; BASIC: LOAD "file" 
                                   5066 ; load file to RAM 
                                   5067 ; for execution 
                                   5068 ;------------------------
      001C86                       5069 load:
      009A55 0F 54 00 FB CE   [ 2] 5070 	btjf flags,#FRUN,0$ 
      009A5A 54 04            [ 1] 5071 	jreq 0$ 
      009A5C A6 84            [ 1] 5072 	ld a,#ERR_CMD_ONLY 
      009A5E 81 09 1E         [ 2] 5073 	jp tb_error 
      009A5F                       5074 0$:	
      009A5F 52 01 CD         [ 4] 5075 	call next_token 
      009A62 91 6F            [ 1] 5076 	cp a,#TK_QSTR
      009A64 A1 01            [ 1] 5077 	jreq 1$
      009A66 27 03 CC         [ 2] 5078 	jp syntax_error 
      009A69 89 9C            [ 1] 5079 1$:	ldw y,x 
      009A6B 85 A3 00         [ 4] 5080 	call search_file 
      009A6E 0F 23            [ 1] 5081 	jrc 2$ 
      009A70 05 A6            [ 1] 5082 	ld a,#ERR_NOT_FILE
      009A72 0A CC 89         [ 2] 5083 	jp tb_error  
      001CA8                       5084 2$:
      009A75 9E CD A0         [ 4] 5085 	call load_file
                                   5086 ; print loaded size 	 
      009A78 AF 6B 01         [ 2] 5087 	ldw x,txtend 
      009A7B E6 01 0D 01      [ 2] 5088 	subw x,txtbgn
      009A7F 27 05 44         [ 4] 5089 	call print_int 
      009A82 0A               [ 4] 5090 	ret 
                                   5091 
                                   5092 ;-----------------------------------
                                   5093 ; BASIC: FORGET ["file_name"] 
                                   5094 ; erase file_name and all others 
                                   5095 ; after it. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5096 ; without argument erase all files 
                                   5097 ;-----------------------------------
                           000001  5098 	NEW_FREE=1   ; free address after file delete
                           000004  5099 	BLOCK_COUNT=4  ; how many rows to delete
                           000005  5100 	VSIZE=5 
      001CB6                       5101 forget:
      001CB6                       5102 	_vars VSIZE 
      009A83 01 26            [ 2]    1     sub sp,#VSIZE 
      009A85 FB A4 01         [ 4] 5103 	call next_token 
      009A88 5F 97            [ 1] 5104 	cp a,#TK_NONE 
      009A8A A6 84            [ 1] 5105 	jreq 2$ 
      009A8C 5B 01            [ 1] 5106 	cp a,#TK_QSTR
      009A8E 81 03            [ 1] 5107 	jreq 1$
      009A8F CC 09 1C         [ 2] 5108 	jp syntax_error
      009A8F 52 02            [ 1] 5109 1$: ldw y,x 
      009A91 CD 91 74 A1 02   [ 1] 5110 	mov in,count 
      009A96 27 03 CC         [ 4] 5111 	call search_file
      009A99 89 9C            [ 1] 5112 	jrc 3$
      009A9B 85 9F            [ 1] 5113 	ld a,#ERR_NOT_FILE 
      009A9D 6B 02 85         [ 2] 5114 	jp tb_error 
      001CD7                       5115 2$: 
      009AA0 A3 00 0F         [ 2] 5116 	ldw x,#0x100
      009AA3 23               [ 1] 5117 	clr a 
      009AA4 05 A6 0A         [ 2] 5118 	ldw farptr,x 
      009AA7 CC 89 9E         [ 1] 5119 	ld farptr+2,a 
      009AAA CD A0 AF         [ 1] 5120 3$:	ld a,farptr+2 
      009AAD 6B 01 A6         [ 2] 5121 	ldw x,farptr 
                                   5122 ; save new free address 
      009AB0 01 0D            [ 2] 5123 	ldw (NEW_FREE,sp),x
      009AB2 01 27            [ 1] 5124 	ld (NEW_FREE+2,sp),a 
                                   5125 ; count blocks to erase 
      009AB4 05 48 0A         [ 1] 5126 	ld a,ffree+2 
      009AB7 01 26 FB         [ 2] 5127 	ldw x,ffree 
      009ABA 0D 02 26         [ 1] 5128 	sub a,farptr+2 
      009ABD 05 43            [ 1] 5129 	jrnc 4$
      009ABF E4               [ 2] 5130 	decw x 
      009AC0 00 20 02 EA      [ 2] 5131 4$:	subw x,farptr 
                                   5132 ; X= X:A/BLOCK_SIZE 
      009AC4 00               [ 1] 5133 	sll a 
      009AC5 E7               [ 2] 5134 	rlcw x 
      009AC6 00 5B            [ 2] 5135 	ldw (BLOCK_COUNT,sp),x
      009AC8 02 81 68         [ 4] 5136 	call move_erase_to_ram
      009ACA 1E 04            [ 2] 5137 5$: ldw x,(BLOCK_COUNT,sp)
      009ACA 72               [ 2] 5138 	tnzw x
      009ACB 00 00            [ 1] 5139 	jreq 6$
      009ACD 24 02 4F         [ 4] 5140 	call block_erase 
      009AD0 81 00 80         [ 2] 5141 	ldw x,#BLOCK_SIZE 
      009AD1 CD 1A C6         [ 4] 5142 	call incr_farptr 
      009AD1 AE 9A            [ 2] 5143 	ldw x,(BLOCK_COUNT,sp)
      009AD3 F8               [ 2] 5144 	decw x 
      009AD4 CD AA            [ 2] 5145 	ldw (BLOCK_COUNT,sp),x
      009AD6 40 5B            [ 2] 5146 	jra 5$  
                                   5147 ; save new free address
      009AD8 02 52            [ 1] 5148 6$:	ld a,(NEW_FREE+2,sp)
      009ADA 04 CD            [ 2] 5149 	ldw x,(NEW_FREE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009ADC 96 C6 AE         [ 1] 5150 	ld ffree+2,a 
      009ADF 16 90 CF         [ 2] 5151 	ldw ffree,x 
      001D21                       5152 	_drop VSIZE 
      009AE2 00 05            [ 2]    1     addw sp,#VSIZE 
      009AE4 7F               [ 4] 5153 	ret 
                                   5154 
                                   5155 ;----------------------
                                   5156 ; BASIC: DIR 
                                   5157 ; list saved files 
                                   5158 ;----------------------
                           000001  5159 	COUNT=1 ; files counter 
                           000002  5160 	VSIZE=2 
      001D24                       5161 directory:
      001D24                       5162 	_vars VSIZE 
      009AE5 72 5F            [ 2]    1     sub sp,#VSIZE 
      009AE7 00               [ 1] 5163 	clrw x 
      009AE8 04 5F            [ 2] 5164 	ldw (COUNT,sp),x 
      009AEA CF 00 01         [ 2] 5165 	ldw farptr+1,x 
      009AED 72 11 00 24      [ 1] 5166 	mov farptr,#1 
      001D30                       5167 dir_loop:
      009AF1 72               [ 1] 5168 	clrw x 
      009AF2 18 00 24 CC      [ 5] 5169 	ldf a,([farptr],x)
      009AF6 8A 42            [ 1] 5170 	jreq 8$ 
      001D37                       5171 1$: ;name loop 	
      009AF8 0A 62 72 65      [ 5] 5172 	ldf a,([farptr],x)
      009AFC 61 6B            [ 1] 5173 	jreq 2$ 
      009AFE 20 70 6F         [ 4] 5174 	call putc 
      009B01 69               [ 1] 5175 	incw x 
      009B02 6E 74            [ 2] 5176 	jra 1$
      009B04 2C               [ 1] 5177 2$: incw x ; skip ending 0. 
      009B05 20 52            [ 1] 5178 	ld a,#SPACE 
      009B07 55 4E 20         [ 4] 5179 	call putc 
                                   5180 ; get file size 	
      009B0A 74 6F 20 72      [ 5] 5181 	ldf a,([farptr],x)
      009B0E 65 73            [ 1] 5182 	ld yh,a 
      009B10 75               [ 1] 5183 	incw x 
      009B11 6D 65 2E 0A      [ 5] 5184 	ldf a,([farptr],x)
      009B15 00               [ 1] 5185 	incw x 
      009B16 90 97            [ 1] 5186 	ld yl,a 
      009B16 72 01            [ 2] 5187 	pushw y 
      009B18 00 24 01         [ 2] 5188 	addw x,(1,sp)
                                   5189 ; skip to next file 
      009B1B 81 1A C6         [ 4] 5190 	call incr_farptr
      009B1C CD 1A AB         [ 4] 5191 	call row_align
                                   5192 ; print file size 
      009B1C CD               [ 2] 5193 	popw x ; file size 
      009B1D 88 06 81         [ 4] 5194 	call print_int 
      009B20 A6 0D            [ 1] 5195 	ld a,#CR 
      009B20 AE 16 E0         [ 4] 5196 	call putc
      009B23 A6 80            [ 2] 5197 	ldw x,(COUNT,sp)
      009B25 7F               [ 1] 5198 	incw x
      009B26 5C 4A            [ 2] 5199 	ldw (COUNT,sp),x  
      009B28 26 FB            [ 2] 5200 	jra dir_loop
      001D72                       5201 8$: ; print number of files 
      009B2A 81 01            [ 2] 5202 	ldw x,(COUNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B2B CD 0A 6F         [ 4] 5203 	call print_int 
      009B2B A6 7F C4         [ 2] 5204 	ldw x,#file_count 
      009B2E 00 19 27         [ 4] 5205 	call puts  
                                   5206 ; print drive free space 	
      009B31 13 CE 00         [ 4] 5207 	call disk_free
      009B34 18               [ 1] 5208 	clrw x  
      009B35 1C 00 80 24      [ 1] 5209 	mov base,#10 
      009B39 04 72 5C         [ 4] 5210 	call prti24 
      009B3C 00 17 9F         [ 2] 5211 	ldw x,#drive_free
      009B3F A4 80 97         [ 4] 5212 	call puts 
      001D8E                       5213 	_drop VSIZE 
      009B42 CF 00            [ 2]    1     addw sp,#VSIZE 
      009B44 18               [ 4] 5214 	ret
      009B45 81 66 69 6C 65 73 0A  5215 file_count: .asciz " files\n"
             00
      009B46 20 62 79 74 65 73 20  5216 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5217 
                                   5218 ;---------------------
                                   5219 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5220 ; write 1 or more byte to FLASH or EEPROM
                                   5221 ; starting at address  
                                   5222 ; input:
                                   5223 ;   expr1  	is address 
                                   5224 ;   expr2,...,exprn   are bytes to write
                                   5225 ; output:
                                   5226 ;   none 
                                   5227 ;---------------------
                           000001  5228 	ADDR=1
                           000002  5229 	VSIZ=2 
      001DA6                       5230 write:
      001DA6                       5231 	_vars VSIZE 
      009B46 72 BB            [ 2]    1     sub sp,#VSIZE 
      009B48 00 18 24 04      [ 1] 5232 	clr farptr ; expect 16 bits address 
      009B4C 72 5C 00         [ 4] 5233 	call expression
      009B4F 17 CF            [ 1] 5234 	cp a,#TK_INTGR 
      009B51 00 18            [ 1] 5235 	jreq 0$
      009B53 81 09 1C         [ 2] 5236 	jp syntax_error
      009B54 1F 01            [ 2] 5237 0$: ldw (ADDR,sp),x 
      009B54 A6 01 C7         [ 4] 5238 	call next_token 
      009B57 00 17            [ 1] 5239 	cp a,#TK_COMMA 
      009B59 5F CF            [ 1] 5240 	jreq 1$ 
      009B5B 00 18            [ 2] 5241 	jra 9$ 
      009B5D CD 11 F3         [ 4] 5242 1$:	call expression
      009B5D AE 00            [ 1] 5243 	cp a,#TK_INTGR
      009B5F 03 92            [ 1] 5244 	jreq 2$
      009B61 AF 00 17         [ 2] 5245 	jp syntax_error
      009B64 26               [ 1] 5246 2$:	ld a,xl 
      009B65 05 5A            [ 2] 5247 	ldw x,(ADDR,sp) 
      009B67 2A F7 20         [ 2] 5248 	ldw farptr+1,x 
      009B6A 0E               [ 1] 5249 	clrw x 
      009B6B AE 00 80         [ 4] 5250 	call write_byte
      009B6E CD 9B            [ 2] 5251 	ldw x,(ADDR,sp)
      009B70 46               [ 1] 5252 	incw x 
      009B71 AE 02            [ 2] 5253 	jra 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001DDA                       5254 9$:
      001DDA                       5255 	_drop VSIZE
      009B73 80 C3            [ 2]    1     addw sp,#VSIZE 
      009B75 00               [ 4] 5256 	ret 
                                   5257 
                                   5258 
                                   5259 ;---------------------
                                   5260 ;BASIC: CHAR(expr)
                                   5261 ; évaluate expression 
                                   5262 ; and take the 7 least 
                                   5263 ; bits as ASCII character
                                   5264 ; return a TK_CHAR 
                                   5265 ;---------------------
      001DDD                       5266 char:
      009B76 17 22 E4         [ 4] 5267 	call func_args 
      009B79 A1 01            [ 1] 5268 	cp a,#1
      009B79 CE 00            [ 1] 5269 	jreq 1$
      009B7B 17 C6 00         [ 2] 5270 	jp syntax_error
      009B7E 19               [ 2] 5271 1$:	popw x 
      009B7F CF               [ 1] 5272 	ld a,xl 
      009B80 00 1A            [ 1] 5273 	and a,#0x7f 
      009B82 C7               [ 1] 5274 	ld xl,a
      009B83 00 1C            [ 1] 5275 	ld a,#TK_CHAR
      009B85 81               [ 4] 5276 	ret
                                   5277 
                                   5278 ;---------------------
                                   5279 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5280 ; extract first character 
                                   5281 ; of string argument 
                                   5282 ; return it as TK_INTGR 
                                   5283 ;---------------------
      009B86                       5284 ascii:
      009B86 AE 80            [ 1] 5285 	ld a,#TK_LPAREN
      009B88 00 72 B0         [ 4] 5286 	call expect 
      009B8B 00 1B A6         [ 4] 5287 	call next_token 
      009B8E 02 C2            [ 1] 5288 	cp a,#TK_QSTR 
      009B90 00 1A            [ 1] 5289 	jreq 1$
      009B92 C7 00            [ 1] 5290 	cp a,#TK_CHAR 
      009B94 0C CF            [ 1] 5291 	jreq 2$ 
      009B96 00 0D            [ 1] 5292 	cp a,#TK_CFUNC 
      009B98 81 03            [ 1] 5293 	jreq 0$
      009B99 CC 09 1C         [ 2] 5294 	jp syntax_error
      009B99 5F               [ 4] 5295 0$: call (x)
      009B9A 92 AF            [ 2] 5296 	jra 2$
      001E09                       5297 1$: 
      009B9C 00               [ 1] 5298 	ld a,(x) 
      009B9D 17               [ 1] 5299 	clrw x
      009B9E 90               [ 1] 5300 	ld xl,a 
      001E0C                       5301 2$: 
      009B9F F1               [ 2] 5302 	pushw x 
      009BA0 26 08            [ 1] 5303 	ld a,#TK_RPAREN 
      009BA2 4D 27 12         [ 4] 5304 	call expect
      009BA5 5C               [ 2] 5305 	popw x 
      009BA6 90 5C            [ 1] 5306 	ld a,#TK_INTGR 
      009BA8 20               [ 4] 5307 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5308 
                                   5309 ;---------------------
                                   5310 ;BASIC: KEY
                                   5311 ; wait for a character 
                                   5312 ; received from STDIN 
                                   5313 ; input:
                                   5314 ;	none 
                                   5315 ; output:
                                   5316 ;	X 		ASCII character 
                                   5317 ;---------------------
      001E16                       5318 key:
      009BA9 F0 03 4B         [ 4] 5319 	call getc 
      009BAA 5F               [ 1] 5320 	clrw x 
      009BAA 4D               [ 1] 5321 	ld xl,a 
      009BAB 27 07            [ 1] 5322 	ld a,#TK_INTGR
      009BAD 5C               [ 4] 5323 	ret
                                   5324 
                                   5325 ;----------------------
                                   5326 ; BASIC: QKEY
                                   5327 ; Return true if there 
                                   5328 ; is a character in 
                                   5329 ; waiting in STDIN 
                                   5330 ; input:
                                   5331 ;  none 
                                   5332 ; output:
                                   5333 ;   X 		0|-1 
                                   5334 ;-----------------------
      001E1E                       5335 qkey:: 
      009BAE 92               [ 1] 5336 	clrw x 
      009BAF AF 00 17         [ 1] 5337 	ld a,rx1_head
      009BB2 20 F6 5C         [ 1] 5338 	cp a,rx1_tail 
      009BB5 98 81            [ 1] 5339 	jreq 9$ 
      009BB7 53               [ 2] 5340 	cplw x 
      009BB7 5C 99            [ 1] 5341 9$: ld a,#TK_INTGR
      009BB9 81               [ 4] 5342 	ret 
                                   5343 
                                   5344 ;---------------------
                                   5345 ; BASIC: GPIO(expr,reg)
                                   5346 ; return gpio address 
                                   5347 ; expr {0..8}
                                   5348 ; input:
                                   5349 ;   none 
                                   5350 ; output:
                                   5351 ;   X 		gpio register address
                                   5352 ;----------------------------
                           000003  5353 	PORT=3
                           000001  5354 	REG=1 
                           000004  5355 	VSIZE=4 
      009BBA                       5356 gpio:
      009BBA 52 04 17         [ 4] 5357 	call func_args 
      009BBD 03 5F            [ 1] 5358 	cp a,#2
      009BBF CF 00            [ 1] 5359 	jreq 1$
      009BC1 18 35 01         [ 2] 5360 	jp syntax_error  
      001E35                       5361 1$:	
      009BC4 00 17            [ 2] 5362 	ldw x,(PORT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009BC6 2B 17            [ 1] 5363 	jrmi bad_port
      009BC6 92 BC 00         [ 2] 5364 	cpw x,#9
      009BC9 17 27            [ 1] 5365 	jrpl bad_port
      009BCB 27 5F            [ 1] 5366 	ld a,#5
      009BCD 16               [ 4] 5367 	mul x,a
      009BCE 03 CD 9B         [ 2] 5368 	addw x,#GPIO_BASE 
      009BD1 99 25            [ 2] 5369 	ldw (PORT,sp),x  
      009BD3 2F 92            [ 2] 5370 	ldw x,(REG,sp) 
      009BD5 AF 00 17         [ 2] 5371 	addw x,(PORT,sp)
      009BD8 6B 01            [ 1] 5372 	ld a,#TK_INTGR
      001E4D                       5373 	_drop VSIZE 
      009BDA 5C 92            [ 2]    1     addw sp,#VSIZE 
      009BDC AF               [ 4] 5374 	ret
      001E50                       5375 bad_port:
      009BDD 00 17            [ 1] 5376 	ld a,#ERR_BAD_VALUE
      009BDF 6B 02 5C         [ 2] 5377 	jp tb_error
                                   5378 
                                   5379 
                                   5380 ;-------------------------
                                   5381 ; BASIC: UFLASH 
                                   5382 ; return user flash address
                                   5383 ; input:
                                   5384 ;  none 
                                   5385 ; output:
                                   5386 ;	A		TK_INTGR
                                   5387 ;   X 		user address 
                                   5388 ;---------------------------
      001E55                       5389 uflash:
      009BE2 72 FB 01         [ 2] 5390 	ldw x,#user_space 
      009BE5 CD 9B            [ 1] 5391 	ld a,#TK_INTGR 
      009BE7 46               [ 4] 5392 	ret 
                                   5393 
                                   5394 
                                   5395 ;---------------------
                                   5396 ; BASIC: USR(addr[,arg])
                                   5397 ; execute a function written 
                                   5398 ; in binary code.
                                   5399 ; binary fonction should 
                                   5400 ; return token attribute in A 
                                   5401 ; and value in X. 
                                   5402 ; input:
                                   5403 ;   addr	routine address 
                                   5404 ;   arg 	is an optional argument 
                                   5405 ; output:
                                   5406 ;   A 		token attribute 
                                   5407 ;   X       returned value 
                                   5408 ;---------------------
      001E5B                       5409 usr:
      009BE8 CD 9B            [ 2] 5410 	pushw y 	
      009BEA 2B AE 02         [ 4] 5411 	call func_args 
      009BED 80 C3            [ 1] 5412 	cp a,#1 
      009BEF 00 17            [ 1] 5413 	jreq 2$
      009BF1 2A D3            [ 1] 5414 	cp a,#2
      009BF3 27 03            [ 1] 5415 	jreq 2$  
      009BF3 72 5F 00         [ 2] 5416 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BF6 17 72            [ 2] 5417 2$: popw y  ; arg|addr 
      009BF8 5F 00            [ 1] 5418 	cp a,#1
      009BFA 18 72            [ 1] 5419 	jreq 3$
      009BFC 5F               [ 2] 5420 	popw x ; addr
      009BFD 00               [ 1] 5421 	exgw x,y 
      009BFE 19 5B            [ 4] 5422 3$: call (y)
      009C00 04 98            [ 2] 5423 	popw y 
      009C02 81               [ 4] 5424 	ret 
                                   5425 
                                   5426 ;------------------------------
                                   5427 ; BASIC: BYE 
                                   5428 ; halt mcu in its lowest power mode 
                                   5429 ; wait for reset or external interrupt
                                   5430 ; do a cold start on wakeup.
                                   5431 ;------------------------------
      009C03                       5432 bye:
      009C03 5B 04 99 81 FB   [ 2] 5433 	btjf UART1_SR,#UART_SR_TC,.
      009C07 8E               [10] 5434 	halt
      009C07 72 01 00         [ 2] 5435 	jp cold_start  
                                   5436 
                                   5437 ;----------------------------------
                                   5438 ; BASIC: AUTORUN ["file_name"] 
                                   5439 ; record in eeprom at adrress AUTORUN_NAME
                                   5440 ; the name of file to load and execute
                                   5441 ; at startup. 
                                   5442 ; empty string delete autorun name 
                                   5443 ; no argument display autorun name  
                                   5444 ; input:
                                   5445 ;   file_name   file to execute 
                                   5446 ; output:
                                   5447 ;   none
                                   5448 ;-----------------------------------
      001E81                       5449 autorun: 
      009C0A 24 05 A6 07 CC   [ 2] 5450 	btjf flags,#FRUN,0$ 
      009C0F 89 9E            [ 1] 5451 	jreq 0$ 
      009C11 A6 07            [ 1] 5452 	ld a,#ERR_CMD_ONLY 
      009C11 CE 00 1F         [ 2] 5453 	jp tb_error 
      001E8D                       5454 0$:	
      009C14 72 B0 00         [ 4] 5455 	call next_token
      009C17 1D               [ 1] 5456 	tnz a 
      009C18 26 0C            [ 1] 5457 	jrne 1$
      009C1A AE 89 35         [ 2] 5458 	ldw x,#AUTORUN_NAME
      009C1D CD AA 40         [ 4] 5459 	call puts 
      009C20 55               [ 1] 5460 	clr a 
      009C21 00               [ 4] 5461 	ret 
      001E9B                       5462 1$:
      009C22 04 00            [ 1] 5463 	cp a,#TK_QSTR
      009C24 02 81            [ 1] 5464 	jreq 2$
      009C26 CC 09 1C         [ 2] 5465 	jp syntax_error 
      001EA2                       5466 2$:	
      009C26 52               [ 1] 5467 	tnz (x) 
      009C27 08 1F            [ 1] 5468 	jrne 3$
                                   5469 ; empty string, delete autorun 	
      009C29 01 CD 8A         [ 4] 5470 	call cancel_autorun
      009C2C 8E A1 02 27 03   [ 1] 5471 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C31 CC               [ 4] 5472 	ret 
      009C32 89               [ 2] 5473 3$:	pushw x 
      009C33 9C 93            [ 1] 5474 	ldw y,x  
      009C34 CD 1B 3A         [ 4] 5475 	call search_file 
      009C34 1F 03            [ 1] 5476 	jrc 4$ 
      009C36 CD 82            [ 1] 5477 	ld a,#ERR_NOT_FILE
      009C38 1C 1E 03         [ 2] 5478 	jp tb_error  
      001EBB                       5479 4$: 
      009C3B CD 84 B4 AB 03   [ 1] 5480 	mov in,count 
      009C40 5F 97 72 FB      [ 1] 5481 	clr farptr 
      009C44 01 4F 72         [ 2] 5482 	ldw x,#AUTORUN_NAME
      009C47 BB 00 1B         [ 2] 5483 	ldw farptr+1,x 
      009C4A C9 00            [ 2] 5484 	ldw x,(1,sp)  
      009C4C 1A A1 02         [ 4] 5485 	call strlen  ; return length in A 
      009C4F 2B               [ 1] 5486 	clrw x 
      009C50 0A               [ 1] 5487 	ld xl,a 
      009C51 A3               [ 1] 5488 	incw x 
      009C52 80 00            [ 2] 5489 	popw y 
      009C54 2B               [ 2] 5490 	pushw x 
      009C55 05               [ 1] 5491 	clrw x 
      009C56 A6 0E CC         [ 4] 5492 	call write_block 
      001ED9                       5493 	_drop 2 
      009C59 89 9E            [ 2]    1     addw sp,#2 
      009C5B 81               [ 4] 5494 	ret 
                                   5495 
                                   5496 ;----------------------------------
                                   5497 ; BASIC: SLEEP 
                                   5498 ; halt mcu until reset or external
                                   5499 ; interrupt.
                                   5500 ; Resume progam after SLEEP command
                                   5501 ;----------------------------------
      001EDC                       5502 sleep:
      009C5B 16 03 CD 9B BA   [ 2] 5503 	btjf UART1_SR,#UART_SR_TC,.
      009C60 24 05 A6 08      [ 1] 5504 	bset flags,#FSLEEP
      009C64 CC               [10] 5505 	halt 
      009C65 89               [ 4] 5506 	ret 
                                   5507 
                                   5508 ;-------------------------------
                                   5509 ; BASIC: PAUSE expr 
                                   5510 ; suspend execution for n msec.
                                   5511 ; input:
                                   5512 ;	none
                                   5513 ; output:
                                   5514 ;	none 
                                   5515 ;------------------------------
      001EE7                       5516 pause:
      009C66 9E 11 F3         [ 4] 5517 	call expression
      009C67 A1 84            [ 1] 5518 	cp a,#TK_INTGR
      009C67 CE 00            [ 1] 5519 	jreq pause02 
      009C69 1A C6 00         [ 2] 5520 	jp syntax_error
      001EF1                       5521 pause02: 
      009C6C 1C               [ 2] 5522 1$: tnzw x 
      009C6D CF 00            [ 1] 5523 	jreq 2$
      009C6F 17               [10] 5524 	wfi 
      009C70 C7               [ 2] 5525 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C71 00 19            [ 1] 5526 	jrne 1$
      009C73 16               [ 1] 5527 2$:	clr a 
      009C74 03               [ 4] 5528 	ret 
                                   5529 
                                   5530 ;------------------------------
                                   5531 ; BASIC: AWU expr
                                   5532 ; halt mcu for 'expr' milliseconds
                                   5533 ; use Auto wakeup peripheral
                                   5534 ; all oscillators stopped except LSI
                                   5535 ; range: 1ms - 511ms
                                   5536 ; input:
                                   5537 ;  none
                                   5538 ; output:
                                   5539 ;  none:
                                   5540 ;------------------------------
      001EFA                       5541 awu:
      009C75 AE 16 E0         [ 4] 5542   call expression
      009C78 CD 84            [ 1] 5543   cp a,#TK_INTGR
      009C7A D0 CD            [ 1] 5544   jreq awu02
      009C7C 84 B4 5F         [ 2] 5545   jp syntax_error
      001F04                       5546 awu02:
      009C7F 97 5C 1C         [ 2] 5547   cpw x,#5120
      009C82 16 E0            [ 1] 5548   jrmi 1$ 
      009C84 16 01 FF 1C      [ 1] 5549   mov AWU_TBR,#15 
      009C88 00 02            [ 1] 5550   ld a,#30
      009C8A 90               [ 2] 5551   div x,a
      009C8B CE 00            [ 1] 5552   ld a,#16
      009C8D 1D               [ 2] 5553   div x,a 
      009C8E 90 F6            [ 2] 5554   jra 4$
      001F15                       5555 1$: 
      009C90 90 5C F7         [ 2] 5556   cpw x,#2048
      009C93 5C 90            [ 1] 5557   jrmi 2$ 
      009C95 C3 00 1F 27      [ 1] 5558   mov AWU_TBR,#14
      009C99 05 A3            [ 1] 5559   ld a,#80
      009C9B 17               [ 2] 5560   div x,a 
      009C9C 60 2B            [ 2] 5561   jra 4$   
      001F23                       5562 2$:
      009C9E EF 07 50 F2      [ 1] 5563   mov AWU_TBR,#7
      009C9F                       5564 3$:  
                                   5565 ; while X > 64  divide by 2 and increment AWU_TBR 
      009C9F 17 07 40         [ 2] 5566   cpw x,#64 
      009CA1 23 07            [ 2] 5567   jrule 4$ 
      009CA1 A3 17 60 27      [ 1] 5568   inc AWU_TBR 
      009CA5 04               [ 2] 5569   srlw x 
      009CA6 7F 5C            [ 2] 5570   jra 3$ 
      001F33                       5571 4$:
      009CA8 20               [ 1] 5572   ld a, xl
      009CA9 F7               [ 1] 5573   dec a 
      009CAA 27 01            [ 1] 5574   jreq 5$
      009CAA AE               [ 1] 5575   dec a 	
      001F38                       5576 5$: 
      009CAB 16 E0            [ 1] 5577   and a,#0x3e 
      009CAD CD 82 30         [ 1] 5578   ld AWU_APR,a 
      009CB0 AE 00 80 CD      [ 1] 5579   bset AWU_CSR,#AWU_CSR_AWUEN
      009CB4 9B               [10] 5580   halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5581 
      009CB5 46               [ 4] 5582   ret 
                                   5583 
                                   5584 ;------------------------------
                                   5585 ; BASIC: TICKS
                                   5586 ; return msec ticks counter value 
                                   5587 ; input:
                                   5588 ; 	none 
                                   5589 ; output:
                                   5590 ;	X 		TK_INTGR
                                   5591 ;-------------------------------
      001F43                       5592 get_ticks:
      009CB6 AE 16 E0         [ 2] 5593 	ldw x,ticks 
      009CB9 16 07            [ 1] 5594 	ld a,#TK_INTGR
      009CBB 90               [ 4] 5595 	ret 
                                   5596 
                                   5597 
                                   5598 
                                   5599 ;------------------------------
                                   5600 ; BASIC: ABS(expr)
                                   5601 ; return absolute value of expr.
                                   5602 ; input:
                                   5603 ;   none
                                   5604 ; output:
                                   5605 ;   X     	positive integer
                                   5606 ;-------------------------------
      001F49                       5607 abs:
      009CBC C3 00 1F         [ 4] 5608 	call func_args 
      009CBF 2B CD            [ 1] 5609 	cp a,#1 
      009CC1 CE 00            [ 1] 5610 	jreq 0$ 
      009CC3 17 C6 00         [ 2] 5611 	jp syntax_error
      001F53                       5612 0$:  
      009CC6 19               [ 2] 5613     popw x   
      009CC7 CF               [ 1] 5614 	ld a,xh 
      009CC8 00 1A            [ 1] 5615 	bcp a,#0x80 
      009CCA C7 00            [ 1] 5616 	jreq 2$ 
      009CCC 1C               [ 2] 5617 	negw x 
      009CCD 1E 01            [ 1] 5618 2$: ld a,#TK_INTGR 
      009CCF CD               [ 4] 5619 	ret 
                                   5620 
                                   5621 ;------------------------------
                                   5622 ; BASIC: AND(expr1,expr2)
                                   5623 ; Apply bit AND relation between
                                   5624 ; the 2 arguments, i.e expr1 & expr2 
                                   5625 ; output:
                                   5626 ; 	A 		TK_INTGR
                                   5627 ;   X 		result 
                                   5628 ;------------------------------
      001F5D                       5629 bit_and:
      009CD0 8A EF 5B         [ 4] 5630 	call func_args 
      009CD3 08 81            [ 1] 5631 	cp a,#2
      009CD5 27 03            [ 1] 5632 	jreq 1$
      009CD5 CD 9B 46         [ 2] 5633 	jp syntax_error 
      009CD8 CD               [ 2] 5634 1$:	popw x 
      009CD9 88               [ 1] 5635 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CDA 06 5F            [ 1] 5636 	and a,(1,sp)
      009CDC 92               [ 1] 5637 	ld xh,a 
      009CDD AF               [ 1] 5638 	ld a,xl
      009CDE 00 17            [ 1] 5639 	and a,(2,sp)
      009CE0 90               [ 1] 5640 	ld xl,a 
      001F70                       5641 	_drop 2 
      009CE1 95 5C            [ 2]    1     addw sp,#2 
      009CE3 92 AF            [ 1] 5642 	ld a,#TK_INTGR
      009CE5 00               [ 4] 5643 	ret
                                   5644 
                                   5645 ;------------------------------
                                   5646 ; BASIC: OR(expr1,expr2)
                                   5647 ; Apply bit OR relation between
                                   5648 ; the 2 arguments, i.e expr1 | expr2 
                                   5649 ; output:
                                   5650 ; 	A 		TK_INTGR
                                   5651 ;   X 		result 
                                   5652 ;------------------------------
      001F75                       5653 bit_or:
      009CE6 17 5C 90         [ 4] 5654 	call func_args 
      009CE9 97 72            [ 1] 5655 	cp a,#2
      009CEB B9 00            [ 1] 5656 	jreq 1$
      009CED 1D 90 CF         [ 2] 5657 	jp syntax_error 
      001F7F                       5658 1$: 
      009CF0 00               [ 2] 5659 	popw x 
      009CF1 1F               [ 1] 5660 	ld a,xh 
      009CF2 90 CE            [ 1] 5661 	or a,(1,sp)
      009CF4 00               [ 1] 5662 	ld xh,a 
      009CF5 1D               [ 1] 5663 	ld a,xl 
      009CF6 1A 02            [ 1] 5664 	or a,(2,sp)
      009CF6 92               [ 1] 5665 	ld xl,a 
      001F88                       5666 	_drop 2 
      009CF7 AF 00            [ 2]    1     addw sp,#2 
      009CF9 17 90            [ 1] 5667 	ld a,#TK_INTGR 
      009CFB F7               [ 4] 5668 	ret
                                   5669 
                                   5670 ;------------------------------
                                   5671 ; BASIC: XOR(expr1,expr2)
                                   5672 ; Apply bit XOR relation between
                                   5673 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5674 ; output:
                                   5675 ; 	A 		TK_INTGR
                                   5676 ;   X 		result 
                                   5677 ;------------------------------
      001F8D                       5678 bit_xor:
      009CFC 5C 90 5C         [ 4] 5679 	call func_args 
      009CFF 90 C3            [ 1] 5680 	cp a,#2
      009D01 00 1F            [ 1] 5681 	jreq 1$
      009D03 2B F1 81         [ 2] 5682 	jp syntax_error 
      009D06                       5683 1$: 
      009D06 72               [ 2] 5684 	popw x 
      009D07 01               [ 1] 5685 	ld a,xh 
      009D08 00 24            [ 1] 5686 	xor a,(1,sp)
      009D0A 07               [ 1] 5687 	ld xh,a 
      009D0B 27               [ 1] 5688 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D0C 05 A6            [ 1] 5689 	xor a,(2,sp)
      009D0E 07               [ 1] 5690 	ld xl,a 
      001FA0                       5691 	_drop 2 
      009D0F CC 89            [ 2]    1     addw sp,#2 
      009D11 9E 84            [ 1] 5692 	ld a,#TK_INTGR 
      009D12 81               [ 4] 5693 	ret 
                                   5694 
                                   5695 ;------------------------------
                                   5696 ; BASIC: LSHIFT(expr1,expr2)
                                   5697 ; logical shift left expr1 by 
                                   5698 ; expr2 bits 
                                   5699 ; output:
                                   5700 ; 	A 		TK_INTGR
                                   5701 ;   X 		result 
                                   5702 ;------------------------------
      001FA5                       5703 lshift:
      009D12 CD 8A 8E         [ 4] 5704 	call func_args
      009D15 A1 02            [ 1] 5705 	cp a,#2 
      009D17 27 03            [ 1] 5706 	jreq 1$
      009D19 CC 89 9C         [ 2] 5707 	jp syntax_error
      009D1C 90 93            [ 2] 5708 1$: popw y   
      009D1E CD               [ 2] 5709 	popw x 
      009D1F 9B BA            [ 2] 5710 	tnzw y 
      009D21 25 05            [ 1] 5711 	jreq 4$
      009D23 A6               [ 2] 5712 2$:	sllw x 
      009D24 09 CC            [ 2] 5713 	decw y 
      009D26 89 9E            [ 1] 5714 	jrne 2$
      009D28                       5715 4$:  
      009D28 CD 9C            [ 1] 5716 	ld a,#TK_INTGR
      009D2A D5               [ 4] 5717 	ret
                                   5718 
                                   5719 ;------------------------------
                                   5720 ; BASIC: RSHIFT(expr1,expr2)
                                   5721 ; logical shift right expr1 by 
                                   5722 ; expr2 bits.
                                   5723 ; output:
                                   5724 ; 	A 		TK_INTGR
                                   5725 ;   X 		result 
                                   5726 ;------------------------------
      001FBE                       5727 rshift:
      009D2B CE 00 1F         [ 4] 5728 	call func_args
      009D2E 72 B0            [ 1] 5729 	cp a,#2 
      009D30 00 1D            [ 1] 5730 	jreq 1$
      009D32 CD 8A EF         [ 2] 5731 	jp syntax_error
      009D35 81 85            [ 2] 5732 1$: popw y  
      009D36 85               [ 2] 5733 	popw x
      009D36 52 05            [ 2] 5734 	tnzw y 
      009D38 CD 8A            [ 1] 5735 	jreq 4$
      009D3A 8E               [ 2] 5736 2$:	srlw x 
      009D3B A1 00            [ 2] 5737 	decw y 
      009D3D 27 18            [ 1] 5738 	jrne 2$
      001FD4                       5739 4$:  
      009D3F A1 02            [ 1] 5740 	ld a,#TK_INTGR
      009D41 27               [ 4] 5741 	ret
                                   5742 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5743 ;--------------------------
                                   5744 ; BASIC: FCPU integer
                                   5745 ; set CPU frequency 
                                   5746 ;-------------------------- 
                                   5747 
      001FD7                       5748 fcpu:
      009D42 03 CC            [ 1] 5749 	ld a,#TK_INTGR
      009D44 89 9C 90         [ 4] 5750 	call expect 
      009D47 93               [ 1] 5751 	ld a,xl 
      009D48 55 00            [ 1] 5752 	and a,#7 
      009D4A 04 00 02         [ 1] 5753 	ld CLK_CKDIVR,a 
      009D4D CD               [ 4] 5754 	ret 
                                   5755 
                                   5756 ;------------------------------
                                   5757 ; BASIC: PMODE pin#, mode 
                                   5758 ; Arduino pin. 
                                   5759 ; define pin as input or output
                                   5760 ; pin#: {0..15}
                                   5761 ; mode: INPUT|OUTPUT  
                                   5762 ;------------------------------
                           000001  5763 	PINNO=1
                           000001  5764 	VSIZE=1
      001FE3                       5765 pin_mode:
      001FE3                       5766 	_vars VSIZE 
      009D4E 9B BA            [ 2]    1     sub sp,#VSIZE 
      009D50 25 0F A6         [ 4] 5767 	call arg_list 
      009D53 09 CC            [ 1] 5768 	cp a,#2 
      009D55 89 9E            [ 1] 5769 	jreq 1$
      009D57 CC 09 1C         [ 2] 5770 	jp syntax_error 
      009D57 AE 01            [ 2] 5771 1$: popw y ; mode 
      009D59 00               [ 2] 5772 	popw x ; Dx pin 
      009D5A 4F CF 00         [ 4] 5773 	call select_pin 
      009D5D 17 C7            [ 1] 5774 	ld (PINNO,sp),a  
      009D5F 00 19            [ 1] 5775 	ld a,#1 
      009D61 C6 00            [ 1] 5776 	tnz (PINNO,sp)
      009D63 19 CE            [ 1] 5777 	jreq 4$
      009D65 00               [ 1] 5778 2$:	sll a 
      009D66 17 1F            [ 1] 5779 	dec (PINNO,sp)
      009D68 01 6B            [ 1] 5780 	jrne 2$ 
      009D6A 03 C6            [ 1] 5781 	ld (PINNO,sp),a
      009D6C 00 1C            [ 1] 5782 	ld a,(PINNO,sp)
      009D6E CE 00            [ 1] 5783 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D70 1A C0            [ 1] 5784 	ld (GPIO_CR1,x),a 
      009D72 00 19 24 01      [ 2] 5785 4$:	cpw y,#OUTP 
      009D76 5A 72            [ 1] 5786 	jreq 6$
                                   5787 ; input mode
                                   5788 ; disable external interrupt 
      009D78 B0 00            [ 1] 5789 	ld a,(PINNO,sp)
      009D7A 17               [ 1] 5790 	cpl a 
      009D7B 48 59            [ 1] 5791 	and a,(GPIO_CR2,x)
      009D7D 1F 04            [ 1] 5792 	ld (GPIO_CR2,x),a 
                                   5793 ;clear bit in DDR for input mode 
      009D7F CD 81            [ 1] 5794 	ld a,(PINNO,sp)
      009D81 E8               [ 1] 5795 	cpl a 
      009D82 1E 04            [ 1] 5796 	and a,(GPIO_DDR,x)	; bit==0 for input. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D84 5D 27            [ 1] 5797 	ld (GPIO_DDR,x),a 
      009D86 10 CD            [ 2] 5798 	jra 9$
      002020                       5799 6$: ;output mode  
      009D88 82 63            [ 1] 5800 	ld a,(PINNO,sp)
      009D8A AE 00            [ 1] 5801 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D8C 80 CD            [ 1] 5802 	ld (GPIO_DDR,x),a 
      009D8E 9B 46            [ 1] 5803 	ld a,(PINNO,sp)
      009D90 1E 04            [ 1] 5804 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D92 5A 1F            [ 1] 5805 	ld (GPIO_CR2,x),a 
      00202C                       5806 9$:	
      00202C                       5807 	_drop VSIZE 
      009D94 04 20            [ 2]    1     addw sp,#VSIZE 
      009D96 EB               [ 4] 5808 	ret
                                   5809 
                                   5810 ;------------------------
                                   5811 ; select Arduino pin 
                                   5812 ; input:
                                   5813 ;   X 	 {0..15} Arduino Dx 
                                   5814 ; output:
                                   5815 ;   A     stm8s208 pin 
                                   5816 ;   X     base address s208 GPIO port 
                                   5817 ;---------------------------
      00202F                       5818 select_pin:
      009D97 7B               [ 2] 5819 	sllw x 
      009D98 03 1E 01         [ 2] 5820 	addw x,#arduino_to_8s208 
      009D9B C7               [ 2] 5821 	ldw x,(x)
      009D9C 00               [ 1] 5822 	ld a,xl 
      009D9D 1C               [ 1] 5823 	push a 
      009D9E CF               [ 1] 5824 	swapw x 
      009D9F 00 1A            [ 1] 5825 	ld a,#5 
      009DA1 5B               [ 4] 5826 	mul x,a 
      009DA2 05 81 00         [ 2] 5827 	addw x,#GPIO_BASE 
      009DA4 84               [ 1] 5828 	pop a 
      009DA4 52               [ 4] 5829 	ret 
                                   5830 ; translation from Arduino D0..D15 to stm8s208rb 
      00203F                       5831 arduino_to_8s208:
      009DA5 02 5F                 5832 .byte 3,6 ; D0 
      009DA7 1F 01                 5833 .byte 3,5 ; D1 
      009DA9 CF 00                 5834 .byte 4,0 ; D2 
      009DAB 18 35                 5835 .byte 2,1 ; D3
      009DAD 01 00                 5836 .byte 6,0 ; D4
      009DAF 17 02                 5837 .byte 2,2 ; D5
      009DB0 02 03                 5838 .byte 2,3 ; D6
      009DB0 5F 92                 5839 .byte 3,1 ; D7
      009DB2 AF 00                 5840 .byte 3,3 ; D8
      009DB4 17 27                 5841 .byte 2,4 ; D9
      009DB6 3B 05                 5842 .byte 4,5 ; D10
      009DB7 02 06                 5843 .byte 2,6 ; D11
      009DB7 92 AF                 5844 .byte 2,7 ; D12
      009DB9 00 17                 5845 .byte 2,5 ; D13
      009DBB 27 06                 5846 .byte 4,2 ; D14
      009DBD CD 83                 5847 .byte 4,1 ; D15
                                   5848 
                                   5849 
                                   5850 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5851 ; BASIC: RND(expr)
                                   5852 ; return random number 
                                   5853 ; between 1 and expr inclusive
                                   5854 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5855 ; input:
                                   5856 ; 	none 
                                   5857 ; output:
                                   5858 ;	X 		random positive integer 
                                   5859 ;------------------------------
      00205F                       5860 random:
      009DBF AB 5C 20         [ 4] 5861 	call func_args 
      009DC2 F4 5C            [ 1] 5862 	cp a,#1
      009DC4 A6 20            [ 1] 5863 	jreq 1$
      009DC6 CD 83 AB         [ 2] 5864 	jp syntax_error
      002069                       5865 1$:  
      009DC9 92 AF            [ 1] 5866 	ld a,#0x80 
      009DCB 00 17            [ 1] 5867 	bcp a,(1,sp)
      009DCD 90 95            [ 1] 5868 	jreq 2$
      009DCF 5C 92            [ 1] 5869 	ld a,#ERR_BAD_VALUE
      009DD1 AF 00 17         [ 2] 5870 	jp tb_error
      002074                       5871 2$: 
                                   5872 ; acc16=(x<<5)^x 
      009DD4 5C 90 97         [ 2] 5873 	ldw x,seedx 
      009DD7 90               [ 2] 5874 	sllw x 
      009DD8 89               [ 2] 5875 	sllw x 
      009DD9 72               [ 2] 5876 	sllw x 
      009DDA FB               [ 2] 5877 	sllw x 
      009DDB 01               [ 2] 5878 	sllw x 
      009DDC CD               [ 1] 5879 	ld a,xh 
      009DDD 9B 46 CD         [ 1] 5880 	xor a,seedx 
      009DE0 9B 2B 85         [ 1] 5881 	ld acc16,a 
      009DE3 CD               [ 1] 5882 	ld a,xl 
      009DE4 8A EF A6         [ 1] 5883 	xor a,seedx+1 
      009DE7 0D CD 83         [ 1] 5884 	ld acc8,a 
                                   5885 ; seedx=seedy 
      009DEA AB 1E 01         [ 2] 5886 	ldw x,seedy 
      009DED 5C 1F 01         [ 2] 5887 	ldw seedx,x  
                                   5888 ; seedy=seedy^(seedy>>1)
      009DF0 20 BE            [ 2] 5889 	srlw y 
      009DF2 90 9E            [ 1] 5890 	ld a,yh 
      009DF2 1E 01 CD         [ 1] 5891 	xor a,seedy 
      009DF5 8A EF AE         [ 1] 5892 	ld seedy,a  
      009DF8 9E 11            [ 1] 5893 	ld a,yl 
      009DFA CD AA 40         [ 1] 5894 	xor a,seedy+1 
      009DFD CD 9B 86         [ 1] 5895 	ld seedy+1,a 
                                   5896 ; acc16>>3 
      009E00 5F 35 0A         [ 2] 5897 	ldw x,acc16 
      009E03 00               [ 2] 5898 	srlw x 
      009E04 0B               [ 2] 5899 	srlw x 
      009E05 CD               [ 2] 5900 	srlw x 
                                   5901 ; x=acc16^x 
      009E06 8A               [ 1] 5902 	ld a,xh 
      009E07 FF AE 9E         [ 1] 5903 	xor a,acc16 
      009E0A 19               [ 1] 5904 	ld xh,a 
      009E0B CD               [ 1] 5905 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E0C AA 40 5B         [ 1] 5906 	xor a,acc8 
      009E0F 02               [ 1] 5907 	ld xl,a 
                                   5908 ; seedy=x^seedy 
      009E10 81 20 66         [ 1] 5909 	xor a,seedy+1
      009E13 69               [ 1] 5910 	ld xl,a 
      009E14 6C               [ 1] 5911 	ld a,xh 
      009E15 65 73 0A         [ 1] 5912 	xor a,seedy
      009E18 00               [ 1] 5913 	ld xh,a 
      009E19 20 62 79         [ 2] 5914 	ldw seedy,x 
                                   5915 ; return seedy modulo expr + 1 
      009E1C 74 65            [ 2] 5916 	popw y 
      009E1E 73               [ 2] 5917 	divw x,y 
      009E1F 20               [ 1] 5918 	ldw x,y 
      009E20 66               [ 1] 5919 	incw x 
      0020C3                       5920 10$:
      009E21 72 65            [ 1] 5921 	ld a,#TK_INTGR
      009E23 65               [ 4] 5922 	ret 
                                   5923 
                                   5924 ;---------------------------------
                                   5925 ; BASIC: WORDS 
                                   5926 ; affiche la listes des mots du
                                   5927 ; dictionnaire ainsi que le nombre
                                   5928 ; de mots.
                                   5929 ;---------------------------------
                           000001  5930 	WLEN=1 ; word length
                           000002  5931 	LLEN=2 ; character sent to console
                           000003  5932 	WCNT=3 ; count words printed 
                           000003  5933 	VSIZE=3 
      0020C6                       5934 words:
      0020C6                       5935 	_vars VSIZE
      009E24 0A 00            [ 2]    1     sub sp,#VSIZE 
      009E26 0F 02            [ 1] 5936 	clr (LLEN,sp)
      009E26 52 02            [ 1] 5937 	clr (WCNT,sp)
      009E28 72 5F 00 17      [ 2] 5938 	ldw y,#kword_dict+2
      009E2C CD               [ 1] 5939 0$:	ldw x,y
      009E2D 92               [ 1] 5940 	ld a,(x)
      009E2E 73 A1            [ 1] 5941 	and a,#15 
      009E30 84 27            [ 1] 5942 	ld (WLEN,sp),a 
      009E32 03 CC            [ 1] 5943 	inc (WCNT,sp)
      009E34 89               [ 1] 5944 1$:	incw x 
      009E35 9C               [ 1] 5945 	ld a,(x)
      009E36 1F 01 CD         [ 4] 5946 	call putc 
      009E39 8A 8E            [ 1] 5947 	inc (LLEN,sp)
      009E3B A1 09            [ 1] 5948 	dec (WLEN,sp)
      009E3D 27 02            [ 1] 5949 	jrne 1$
      009E3F 20 19            [ 1] 5950 	ld a,#70
      009E41 CD 92            [ 1] 5951 	cp a,(LLEN,sp)
      009E43 73 A1            [ 1] 5952 	jrmi 2$   
      009E45 84 27            [ 1] 5953 	ld a,#SPACE 
      009E47 03 CC 89         [ 4] 5954 	call putc 
      009E4A 9C 9F            [ 1] 5955 	inc (LLEN,sp) 
      009E4C 1E 01            [ 2] 5956 	jra 3$
      009E4E CF 00            [ 1] 5957 2$: ld a,#CR 
      009E50 18 5F CD         [ 4] 5958 	call putc 
      009E53 82 8D            [ 1] 5959 	clr (LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E55 1E 01 5C 20      [ 2] 5960 3$:	subw y,#2 
      009E59 DC FE            [ 2] 5961 	ldw y,(y)
      009E5A 26 CF            [ 1] 5962 	jrne 0$ 
      009E5A 5B 02            [ 1] 5963 	ld a,#CR 
      009E5C 81 03 2B         [ 4] 5964 	call putc  
      009E5D 5F               [ 1] 5965 	clrw x 
      009E5D CD 91            [ 1] 5966 	ld a,(WCNT,sp)
      009E5F 6F               [ 1] 5967 	ld xl,a 
      009E60 A1 01 27         [ 4] 5968 	call print_int 
      009E63 03 CC 89         [ 2] 5969 	ldw x,#words_count_msg
      009E66 9C 85 9F         [ 4] 5970 	call puts 
      002113                       5971 	_drop VSIZE 
      009E69 A4 7F            [ 2]    1     addw sp,#VSIZE 
      009E6B 97               [ 4] 5972 	ret 
      009E6C A6 03 81 72 64 73 20  5973 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5974 
                                   5975 
                                   5976 ;-----------------------------
                                   5977 ; BASIC: TIMER expr 
                                   5978 ; initialize count down timer 
                                   5979 ;-----------------------------
      009E6F                       5980 set_timer:
      009E6F A6 07 CD         [ 4] 5981 	call arg_list
      009E72 91 62            [ 1] 5982 	cp a,#1 
      009E74 CD 8A            [ 1] 5983 	jreq 1$
      009E76 8E A1 02         [ 2] 5984 	jp syntax_error
      002136                       5985 1$: 
      009E79 27               [ 2] 5986 	popw x 
      009E7A 0E A1 03         [ 2] 5987 	ldw timer,x 
      009E7D 27               [ 4] 5988 	ret 
                                   5989 
                                   5990 ;------------------------------
                                   5991 ; BASIC: TIMEOUT 
                                   5992 ; return state of timer 
                                   5993 ;------------------------------
      00213B                       5994 timeout:
      009E7E 0D A1 82         [ 2] 5995 	ldw x,timer 
      00213E                       5996 logical_complement:
      009E81 27               [ 2] 5997 	cplw x 
      009E82 03 CC 89         [ 2] 5998 	cpw x,#-1
      009E85 9C FD            [ 1] 5999 	jreq 2$
      009E87 20               [ 1] 6000 	clrw x 
      009E88 03 84            [ 1] 6001 2$:	ld a,#TK_INTGR
      009E89 81               [ 4] 6002 	ret 
                                   6003 
                                   6004 ;--------------------------------
                                   6005 ; BASIC NOT(expr) 
                                   6006 ; return logical complement of expr
                                   6007 ;--------------------------------
      002148                       6008 func_not:
      009E89 F6 5F 97         [ 4] 6009 	call func_args  
      009E8C A1 01            [ 1] 6010 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E8C 89 A6            [ 1] 6011 	jreq 1$
      009E8E 08 CD 91         [ 2] 6012 	jp syntax_error
      009E91 62               [ 2] 6013 1$:	popw x 
      009E92 85 A6            [ 2] 6014 	jra logical_complement
                                   6015 
                                   6016 
                                   6017 
                                   6018 ;-----------------------------------
                                   6019 ; BASIC: IWDGEN expr1 
                                   6020 ; enable independant watchdog timer
                                   6021 ; expr1 is delay in multiple of 62.5µsec
                                   6022 ; expr1 -> {1..16383}
                                   6023 ;-----------------------------------
      002155                       6024 enable_iwdg:
      009E94 84 81 F4         [ 4] 6025 	call arg_list
      009E96 A1 01            [ 1] 6026 	cp a,#1 
      009E96 CD 83            [ 1] 6027 	jreq 1$
      009E98 CB 5F 97         [ 2] 6028 	jp syntax_error 
      009E9B A6               [ 2] 6029 1$: popw x 
      009E9C 84 81            [ 1] 6030 	push #0
      009E9E 35 CC 50 E0      [ 1] 6031 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009E9E 5F               [ 1] 6032 	ld a,xh 
      009E9F C6 00            [ 1] 6033 	and a,#0x3f
      009EA1 2E               [ 1] 6034 	ld xh,a  
      009EA2 C1 00 2F         [ 2] 6035 2$:	cpw x,#255
      009EA5 27 01            [ 2] 6036 	jrule 3$
      009EA7 53 A6            [ 1] 6037 	inc (1,sp)
      009EA9 84               [ 1] 6038 	rcf 
      009EAA 81               [ 2] 6039 	rrcw x 
      009EAB 20 F5            [ 2] 6040 	jra 2$
      009EAB CD 91 6F A1      [ 1] 6041 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EAF 02               [ 1] 6042 	pop a  
      009EB0 27 03 CC         [ 1] 6043 	ld IWDG_PR,a 
      009EB3 89               [ 1] 6044 	ld a,xl
      009EB4 9C               [ 1] 6045 	dec a 
      009EB5 35 55 50 E0      [ 1] 6046 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EB5 1E 03 2B         [ 1] 6047 	ld IWDG_RLR,a 
      009EB8 17 A3 00 09      [ 1] 6048 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009EBC 2A               [ 4] 6049 	ret 
                                   6050 
                                   6051 
                                   6052 ;-----------------------------------
                                   6053 ; BASIC: IWDGREF  
                                   6054 ; refresh independant watchdog count down 
                                   6055 ; timer before it reset MCU. 
                                   6056 ;-----------------------------------
      00218B                       6057 refresh_iwdg:
      009EBD 12 A6 05 42      [ 1] 6058 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009EC1 1C               [ 4] 6059 	ret 
                                   6060 
                                   6061 
                                   6062 ;-------------------------------------
                                   6063 ; BASIC: LOG(expr)
                                   6064 ; return logarithm base 2 of expr 
                                   6065 ; this is the position of most significant
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



                                   6066 ; bit set. 
                                   6067 ; input: 
                                   6068 ; output:
                                   6069 ;   X     log2 
                                   6070 ;   A     TK_INTGR 
                                   6071 ;*********************************
      002190                       6072 log2:
      009EC2 50 00 1F         [ 4] 6073 	call func_args 
      009EC5 03 1E            [ 1] 6074 	cp a,#1 
      009EC7 01 72            [ 1] 6075 	jreq 1$
      009EC9 FB 03 A6         [ 2] 6076 	jp syntax_error 
      009ECC 84               [ 2] 6077 1$: popw x 
      00219B                       6078 leading_one:
      009ECD 5B               [ 2] 6079 	tnzw x 
      009ECE 04 81            [ 1] 6080 	jreq 4$
      009ED0 A6 0F            [ 1] 6081 	ld a,#15 
      009ED0 A6               [ 2] 6082 2$: rlcw x 
      009ED1 0A CC            [ 1] 6083     jrc 3$
      009ED3 89               [ 1] 6084 	dec a 
      009ED4 9E FA            [ 2] 6085 	jra 2$
      009ED5 5F               [ 1] 6086 3$: clrw x 
      009ED5 AE               [ 1] 6087     ld xl,a
      009ED6 AA 00            [ 1] 6088 4$:	ld a,#TK_INTGR
      009ED8 A6               [ 4] 6089 	ret 
                                   6090 
                                   6091 ;-----------------------------------
                                   6092 ; BASIC: BIT(expr) 
                                   6093 ; expr ->{0..15}
                                   6094 ; return 2^expr 
                                   6095 ; output:
                                   6096 ;    x    2^expr 
                                   6097 ;-----------------------------------
      0021AB                       6098 bitmask:
      009ED9 84 81 EF         [ 4] 6099     call func_args 
      009EDB A1 01            [ 1] 6100 	cp a,#1
      009EDB 90 89            [ 1] 6101 	jreq 1$
      009EDD CD 91 6F         [ 2] 6102 	jp syntax_error 
      009EE0 A1               [ 2] 6103 1$: popw x 
      009EE1 01               [ 1] 6104 	ld a,xl 
      009EE2 27 07            [ 1] 6105 	and a,#15
      009EE4 A1               [ 1] 6106 	clrw x 
      009EE5 02               [ 1] 6107 	incw x 
      009EE6 27               [ 1] 6108 2$: tnz a 
      009EE7 03 CC            [ 1] 6109 	jreq 3$
      009EE9 89               [ 2] 6110 	slaw x 
      009EEA 9C               [ 1] 6111 	dec a 
      009EEB 90 85            [ 2] 6112 	jra 2$ 
      009EED A1 01            [ 1] 6113 3$: ld a,#TK_INTGR
      009EEF 27               [ 4] 6114 	ret 
                                   6115 
                                   6116 ;------------------------------
                                   6117 ; BASIC: INVERT(expr)
                                   6118 ; 1's complement 
                                   6119 ;--------------------------------
      0021C5                       6120 invert:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009EF0 02 85 51         [ 4] 6121 	call func_args
      009EF3 90 FD            [ 1] 6122 	cp a,#1 
      009EF5 90 85            [ 1] 6123 	jreq 1$
      009EF7 81 09 1C         [ 2] 6124 	jp syntax_error
      009EF8 85               [ 2] 6125 1$: popw x  
      009EF8 72               [ 2] 6126 	cplw x 
      009EF9 0D 52            [ 1] 6127 	ld a,#TK_INTGR 
      009EFB 30               [ 4] 6128 	ret 
                                   6129 
                                   6130 ;------------------------------
                                   6131 ; BASIC: DO 
                                   6132 ; initiate a DO ... UNTIL loop 
                                   6133 ;------------------------------
                           000003  6134 	DOLP_ADR=3 
                           000005  6135 	DOLP_INW=5
                           000004  6136 	VSIZE=4 
      0021D4                       6137 do_loop:
      009EFC FB               [ 2] 6138 	popw x 
      0021D5                       6139 	_vars VSIZE 
      009EFD 8E CC            [ 2]    1     sub sp,#VSIZE 
      009EFF 86               [ 2] 6140 	pushw x 
      009F00 F8 CE 00 04      [ 2] 6141 	ldw y,basicptr 
      009F01 17 03            [ 2] 6142 	ldw (DOLP_ADR,sp),y
      009F01 72 01 00 24      [ 2] 6143 	ldw y,in.w 
      009F05 07 27            [ 2] 6144 	ldw (DOLP_INW,sp),y
      009F07 05 A6 07 CC      [ 1] 6145 	inc loop_depth 
      009F0B 89               [ 4] 6146 	ret 
                                   6147 
                                   6148 ;--------------------------------
                                   6149 ; BASIC: UNTIL expr 
                                   6150 ; loop if exprssion is false 
                                   6151 ; else terminate loop
                                   6152 ;--------------------------------
      0021E9                       6153 until: 
      009F0C 9E 5D 00 20      [ 1] 6154 	tnz loop_depth 
      009F0D 26 03            [ 1] 6155 	jrne 1$ 
      009F0D CD 8A 8E         [ 2] 6156 	jp syntax_error 
      0021F2                       6157 1$: 
      009F10 4D 26 08         [ 4] 6158 	call relation 
      009F13 AE 40            [ 1] 6159 	cp a,#TK_INTGR
      009F15 00 CD            [ 1] 6160 	jreq 2$
      009F17 AA 40 4F         [ 2] 6161 	jp syntax_error
      0021FC                       6162 2$: 
      009F1A 81               [ 2] 6163 	tnzw x 
      009F1B 26 10            [ 1] 6164 	jrne 9$
      009F1B A1 02            [ 2] 6165 	ldw x,(DOLP_ADR,sp)
      009F1D 27 03 CC         [ 2] 6166 	ldw basicptr,x 
      009F20 89 9C            [ 1] 6167 	ld a,(2,x)
      009F22 C7 00 03         [ 1] 6168 	ld count,a 
      009F22 7D 26            [ 2] 6169 	ldw x,(DOLP_INW,sp)
      009F24 09 CD 87         [ 2] 6170 	ldw in.w,x 
      009F27 B9               [ 4] 6171 	ret 
      00220F                       6172 9$:	; remove loop data from stack  
      009F28 55               [ 2] 6173 	popw x
      002210                       6174 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F29 00 04            [ 2]    1     addw sp,#VSIZE 
      009F2B 00 02 81 89      [ 1] 6175 	dec loop_depth 
      009F2F 90               [ 2] 6176 	jp (x)
                                   6177 
                                   6178 ;--------------------------
                                   6179 ; BASIC: PRTA...PRTI  
                                   6180 ;  return constant value 
                                   6181 ;  PORT  offset in GPIO
                                   6182 ;  array
                                   6183 ;---------------------------
      002217                       6184 const_porta:
      009F30 93 CD 9B         [ 2] 6185 	ldw x,#0
      009F33 BA 25            [ 1] 6186 	ld a,#TK_INTGR 
      009F35 05               [ 4] 6187 	ret 
      00221D                       6188 const_portb:
      009F36 A6 09 CC         [ 2] 6189 	ldw x,#1
      009F39 89 9E            [ 1] 6190 	ld a,#TK_INTGR 
      009F3B 81               [ 4] 6191 	ret 
      002223                       6192 const_portc:
      009F3B 55 00 04         [ 2] 6193 	ldw x,#2
      009F3E 00 02            [ 1] 6194 	ld a,#TK_INTGR 
      009F40 72               [ 4] 6195 	ret 
      002229                       6196 const_portd:
      009F41 5F 00 17         [ 2] 6197 	ldw x,#3
      009F44 AE 40            [ 1] 6198 	ld a,#TK_INTGR 
      009F46 00               [ 4] 6199 	ret 
      00222F                       6200 const_porte:
      009F47 CF 00 18         [ 2] 6201 	ldw x,#4
      009F4A 1E 01            [ 1] 6202 	ld a,#TK_INTGR 
      009F4C CD               [ 4] 6203 	ret 
      002235                       6204 const_portf:
      009F4D 84 B4 5F         [ 2] 6205 	ldw x,#5
      009F50 97 5C            [ 1] 6206 	ld a,#TK_INTGR 
      009F52 90               [ 4] 6207 	ret 
      00223B                       6208 const_portg:
      009F53 85 89 5F         [ 2] 6209 	ldw x,#6
      009F56 CD 83            [ 1] 6210 	ld a,#TK_INTGR 
      009F58 02               [ 4] 6211 	ret 
      002241                       6212 const_porth:
      009F59 5B 02 81         [ 2] 6213 	ldw x,#7
      009F5C A6 84            [ 1] 6214 	ld a,#TK_INTGR 
      009F5C 72               [ 4] 6215 	ret 
      002247                       6216 const_porti:
      009F5D 0D 52 30         [ 2] 6217 	ldw x,#8
      009F60 FB 72            [ 1] 6218 	ld a,#TK_INTGR 
      009F62 16               [ 4] 6219 	ret 
                                   6220 
                                   6221 ;-------------------------------
                                   6222 ; following return constant 
                                   6223 ; related to GPIO register offset 
                                   6224 ;---------------------------------
      00224D                       6225 const_odr:
      009F63 00 24            [ 1] 6226 	ld a,#TK_INTGR 
      009F65 8E 81 00         [ 2] 6227 	ldw x,#GPIO_ODR
      009F67 81               [ 4] 6228 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      002253                       6229 const_idr:
      009F67 CD 92            [ 1] 6230 	ld a,#TK_INTGR 
      009F69 73 A1 84         [ 2] 6231 	ldw x,#GPIO_IDR
      009F6C 27               [ 4] 6232 	ret 
      002259                       6233 const_ddr:
      009F6D 03 CC            [ 1] 6234 	ld a,#TK_INTGR 
      009F6F 89 9C 02         [ 2] 6235 	ldw x,#GPIO_DDR
      009F71 81               [ 4] 6236 	ret 
      00225F                       6237 const_cr1:
      009F71 5D 27            [ 1] 6238 	ld a,#TK_INTGR 
      009F73 04 8F 5A         [ 2] 6239 	ldw x,#GPIO_CR1
      009F76 26               [ 4] 6240 	ret 
      002265                       6241 const_cr2:
      009F77 F9 4F            [ 1] 6242 	ld a,#TK_INTGR 
      009F79 81 00 04         [ 2] 6243 	ldw x,#GPIO_CR2
      009F7A 81               [ 4] 6244 	ret 
                                   6245 ;-------------------------
                                   6246 ;  constant for port mode
                                   6247 ;  used by PMODE 
                                   6248 ;  input or output
                                   6249 ;------------------------
      00226B                       6250 const_output:
      009F7A CD 92            [ 1] 6251 	ld a,#TK_INTGR 
      009F7C 73 A1 84         [ 2] 6252 	ldw x,#OUTP
      009F7F 27               [ 4] 6253 	ret 
      002271                       6254 const_input:
      009F80 03 CC            [ 1] 6255 	ld a,#TK_INTGR 
      009F82 89 9C 00         [ 2] 6256 	ldw x,#INP 
      009F84 81               [ 4] 6257 	ret 
                                   6258 ;-----------------------
                                   6259 ; memory area constants
                                   6260 ;-----------------------
      002277                       6261 const_eeprom_base:
      009F84 A3 14            [ 1] 6262 	ld a,#TK_INTGR 
      009F86 00 2B 0C         [ 2] 6263 	ldw x,#EEPROM_BASE 
      009F89 35               [ 4] 6264 	ret 
                                   6265 
                                   6266 ;---------------------------
                                   6267 ; BASIC: DATA 
                                   6268 ; when the interpreter find 
                                   6269 ; a DATA line it skip it.
                                   6270 ;---------------------------
      00227D                       6271 data:
      009F8A 0F 50 F2 A6 1E   [ 1] 6272 	mov in,count 
      009F8F 62               [ 4] 6273 	ret 
                                   6274 
                                   6275 ;---------------------------
                                   6276 ; BASIC: DATLN  *expr*
                                   6277 ; set DATA pointer at line# 
                                   6278 ; specified by *expr* 
                                   6279 ;---------------------------
      002283                       6280 data_line:
      009F90 A6 10 62         [ 4] 6281 	call expression
      009F93 20 1E            [ 1] 6282 	cp a,#TK_INTGR
      009F95 27 03            [ 1] 6283 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009F95 A3 08 00         [ 2] 6284 	jp syntax_error 
      009F98 2B 09 35         [ 4] 6285 1$: call search_lineno
      009F9B 0E               [ 2] 6286 	tnzw x 
      009F9C 50 F2            [ 1] 6287 	jrne 3$
      009F9E A6 50            [ 1] 6288 2$:	ld a,#ERR_NO_LINE 
      009FA0 62 20 10         [ 2] 6289 	jp tb_error
      009FA3                       6290 3$: ; check if valid data line 
      009FA3 35 07            [ 1] 6291     ldw y,x 
      009FA5 50 F2            [ 2] 6292 	ldw x,(4,x)
      009FA7 A3 22 7D         [ 2] 6293 	cpw x,#data 
      009FA7 A3 00            [ 1] 6294 	jrne 2$ 
      009FA9 40 23 07 72      [ 2] 6295 	ldw data_ptr,y
      009FAD 5C 50 F2         [ 1] 6296 	ld a,(2,y)
      009FB0 54 20 F4         [ 1] 6297 	ld data_len,a 
      009FB3 35 06 00 08      [ 1] 6298 	mov data_ofs,#FIRST_DATA_ITEM 
      009FB3 9F               [ 4] 6299 	ret
                                   6300 
                                   6301 ;---------------------------------
                                   6302 ; BASIC: RESTORE 
                                   6303 ; set data_ptr to first data line
                                   6304 ; if not DATA found pointer set to
                                   6305 ; zero 
                                   6306 ;---------------------------------
      0022B0                       6307 restore:
      009FB4 4A 27 01 4A      [ 1] 6308 	clr data_ptr 
      009FB8 72 5F 00 07      [ 1] 6309 	clr data_ptr+1
      009FB8 A4 3E C7 50      [ 1] 6310 	clr data_ofs 
      009FBC F1 72 18 50      [ 1] 6311 	clr data_len
      009FC0 F0 8E 81         [ 2] 6312 	ldw x,txtbgn
      009FC3                       6313 data_search_loop: 	
      009FC3 CE 00 0F         [ 2] 6314 	cpw x,txtend
      009FC6 A6 84            [ 1] 6315 	jruge 9$
      009FC8 81 93            [ 1] 6316 	ldw y,x 
      009FC9 EE 04            [ 2] 6317 	ldw x,(4,x)
      009FC9 CD 91 6F         [ 2] 6318 	addw x,#code_addr
      009FCC A1               [ 2] 6319 	ldw x,(x)
      009FCD 01 27 03         [ 2] 6320 	cpw x,#data 
      009FD0 CC 89            [ 1] 6321 	jrne try_next_line 
      009FD2 9C CF 00 06      [ 2] 6322 	ldw data_ptr,y 
      009FD3 90 E6 02         [ 1] 6323 	ld a,(2,y)
      009FD3 85 9E A5         [ 1] 6324 	ld data_len,a 
      009FD6 80 27 01 50      [ 1] 6325 	mov data_ofs,#FIRST_DATA_ITEM
      009FDA A6 84 81 09      [ 1] 6326 9$:	tnz data_len 
      009FDD 26 05            [ 1] 6327     jrne 10$
      009FDD CD 91            [ 1] 6328 	ld a,#ERR_NO_DATA 
      009FDF 6F A1 02         [ 2] 6329 	jp tb_error 
      009FE2 27               [ 4] 6330 10$:ret
      0022EF                       6331 try_next_line:
      009FE3 03               [ 1] 6332 	ldw x,y 
      009FE4 CC 89            [ 1] 6333 	ld a,(2,x)
      009FE6 9C 85 9E         [ 1] 6334 	ld acc8,a 
      009FE9 14 01 95 9F      [ 1] 6335 	clr acc16 
      009FED 14 02 97 5B      [ 2] 6336 	addw x,acc16 
      009FF1 02 A6            [ 2] 6337 	jra data_search_loop
                                   6338 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



                                   6339 
                                   6340 ;---------------------------------
                                   6341 ; BASIC: READ 
                                   6342 ; return next data item | 0 
                                   6343 ;---------------------------------
                           000001  6344 	CTX_BPTR=1 
                           000003  6345 	CTX_IN=3 
                           000004  6346 	CTX_COUNT=4 
                           000005  6347 	XSAVE=5
                           000006  6348 	VSIZE=6
      0022FF                       6349 read:
      0022FF                       6350 	_vars  VSIZE 
      009FF3 84 81            [ 2]    1     sub sp,#VSIZE 
      009FF5                       6351 read01:	
      009FF5 CD 91 6F         [ 1] 6352 	ld a,data_ofs
      009FF8 A1 02 27         [ 1] 6353 	cp a,data_len 
      009FFB 03 CC            [ 1] 6354 	jreq 2$ ; end of line  
      009FFD 89 9C 46         [ 4] 6355 	call save_context
      009FFF CE 00 06         [ 2] 6356 	ldw x,data_ptr 
      009FFF 85 9E 1A         [ 2] 6357 	ldw basicptr,x 
      00A002 01 95 9F 1A 02   [ 1] 6358 	mov in,data_ofs 
      00A007 97 5B 02 A6 84   [ 1] 6359 	mov count,data_len  
      00A00C 81 11 F3         [ 4] 6360 	call expression 
      00A00D A1 84            [ 1] 6361 	cp a,#TK_INTGR 
      00A00D CD 91            [ 1] 6362 	jreq 1$ 
      00A00F 6F A1 02         [ 2] 6363 	jp syntax_error 
      002326                       6364 1$:
      00A012 27 03            [ 2] 6365 	ldw (XSAVE,SP),x
      00A014 CC 89 9C         [ 4] 6366 	call next_token ; skip comma
      00A017 CE 00 04         [ 2] 6367 	ldw x,basicptr 
      00A017 85 9E 18         [ 2] 6368 	ldw data_ptr,x 
      00A01A 01 95 9F 18 02   [ 1] 6369 	mov data_ofs,in 
      00A01F 97 5B 02         [ 4] 6370 	call rest_context
      00A022 A6 84            [ 2] 6371 	ldw x,(XSAVE,sp)
      00A024 81 84            [ 1] 6372 	ld a,#TK_INTGR
      00A025                       6373 	_drop VSIZE 
      00A025 CD 91            [ 2]    1     addw sp,#VSIZE 
      00A027 6F               [ 4] 6374 	ret 
      002340                       6375 2$: ; end of line reached 
      00A028 A1 02 27 03      [ 2] 6376 	ldw y, data_ptr 
      00A02C CC 89 9C 90      [ 1] 6377 	clr data_ptr
      00A030 85 85 90 5D      [ 1] 6378 	clr data_ptr+1   
      00A034 27 05 58 90      [ 1] 6379 	clr data_ofs 
      00A038 5A 26 FB 09      [ 1] 6380 	clr data_len 
      00A03B CD 22 EF         [ 4] 6381 	call try_next_line 
      00A03B A6 84            [ 2] 6382 	jra read01
                                   6383 
                                   6384 
                                   6385 ;---------------------------------
                                   6386 ; BASIC: SPIEN clkdiv, 0|1  
                                   6387 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6388 ; if clkdiv==-1 disable SPI
                                   6389 ; 0|1 -> disable|enable  
                                   6390 ;--------------------------------- 
                           000005  6391 SPI_CS_BIT=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      002359                       6392 spi_enable:
      00A03D 81 10 F4         [ 4] 6393 	call arg_list 
      00A03E A1 02            [ 1] 6394 	cp a,#2
      00A03E CD 91            [ 1] 6395 	jreq 1$
      00A040 6F A1 02         [ 2] 6396 	jp syntax_error 
      002363                       6397 1$: 
      00A043 27 03 CC 89      [ 1] 6398 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A047 9C               [ 2] 6399 	popw x  
      00A048 90               [ 2] 6400 	tnzw x 
      00A049 85 85            [ 1] 6401 	jreq spi_disable 
      00A04B 90               [ 2] 6402 	popw x 
      00A04C 5D 27            [ 1] 6403 	ld a,#(1<<SPI_CR1_BR)
      00A04E 05               [ 4] 6404 	mul x,a 
      00A04F 54               [ 1] 6405 	ld a,xl 
      00A050 90 5A 26         [ 1] 6406 	ld SPI_CR1,a 
                                   6407 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A053 FB 1A 50 14      [ 1] 6408 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A054 72 1A 50 16      [ 1] 6409 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6410 ; configure SPI as master mode 0.	
      00A054 A6 84 81 00      [ 1] 6411 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6412 ; ~CS line controlled by sofware 	
      00A057 72 12 52 01      [ 1] 6413 	bset SPI_CR2,#SPI_CR2_SSM 
      00A057 A6 84 CD 91      [ 1] 6414     bset SPI_CR2,#SPI_CR2_SSI 
                                   6415 ; enable SPI
      00A05B 62 9F A4 07      [ 1] 6416 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A05F C7               [ 4] 6417 	ret 
      00238C                       6418 spi_disable:
      00238C                       6419 	_drop #2; throw first argument.
      00A060 50 C6            [ 2]    1     addw sp,##2 
                                   6420 ; wait spi idle 
      00A062 81 82            [ 1] 6421 1$:	ld a,#0x82 
      00A063 C4 52 03         [ 1] 6422 	and a,SPI_SR
      00A063 52 01            [ 1] 6423 	cp a,#2 
      00A065 CD 91            [ 1] 6424 	jrne 1$
      00A067 74 A1 02 27      [ 1] 6425 	bres SPI_CR1,#SPI_CR1_SPE
      00A06B 03 CC 89 9C      [ 1] 6426 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A06F 90 85 85 CD      [ 1] 6427 	bres PE_DDR,#SPI_CS_BIT 
      00A073 A0               [ 4] 6428 	ret 
                                   6429 
      0023A4                       6430 spi_clear_error:
      00A074 AF 6B            [ 1] 6431 	ld a,#0x78 
      00A076 01 A6 01         [ 1] 6432 	bcp a,SPI_SR 
      00A079 0D 01            [ 1] 6433 	jreq 1$
      00A07B 27 0D 48 0A      [ 1] 6434 	clr SPI_SR 
      00A07F 01               [ 4] 6435 1$: ret 
                                   6436 
      0023B0                       6437 spi_send_byte:
      00A080 26               [ 1] 6438 	push a 
      00A081 FB 6B 01         [ 4] 6439 	call spi_clear_error
      00A084 7B               [ 1] 6440 	pop a 
      00A085 01 EA 03 E7 03   [ 2] 6441 	btjf SPI_SR,#SPI_SR_TXE,.
      00A08A 90 A3 00         [ 1] 6442 	ld SPI_DR,a
      00A08D 01 27 10 7B 01   [ 2] 6443 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A092 43 E4 04         [ 1] 6444 	ld a,SPI_DR 
      00A095 E7               [ 4] 6445 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   6446 
      0023C6                       6447 spi_rcv_byte:
      00A096 04 7B            [ 1] 6448 	ld a,#255
      00A098 01 43 E4 02 E7   [ 2] 6449 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A09D 02 20 0C         [ 1] 6450 	ld a,SPI_DR 
      00A0A0 81               [ 4] 6451 	ret
                                   6452 
                                   6453 ;------------------------------
                                   6454 ; BASIC: SPIWR byte [,byte]
                                   6455 ; write 1 or more byte
                                   6456 ;------------------------------
      0023D1                       6457 spi_write:
      00A0A0 7B 01 EA         [ 4] 6458 	call expression
      00A0A3 02 E7            [ 1] 6459 	cp a,#TK_INTGR 
      00A0A5 02 7B            [ 1] 6460 	jreq 1$
      00A0A7 01 EA 04         [ 2] 6461 	jp syntax_error 
      0023DB                       6462 1$:	
      00A0AA E7               [ 1] 6463 	ld a,xl 
      00A0AB 04 23 B0         [ 4] 6464 	call spi_send_byte 
      00A0AC CD 0A 0E         [ 4] 6465 	call next_token 
      00A0AC 5B 01            [ 1] 6466 	cp a,#TK_COMMA 
      00A0AE 81 02            [ 1] 6467 	jrne 2$ 
      00A0AF 20 E9            [ 2] 6468 	jra spi_write 
      00A0AF 58               [ 1] 6469 2$:	tnz a 
      00A0B0 1C A0            [ 1] 6470 	jreq 3$
      0023EB                       6471 	_unget_token  
      00A0B2 BF FE 9F 88 5E   [ 1]    1      mov in,in.saved  
      00A0B7 A6               [ 4] 6472 3$:	ret 
                                   6473 
                                   6474 
                                   6475 ;-------------------------------
                                   6476 ; BASIC: SPIRD 	
                                   6477 ; read one byte from SPI 
                                   6478 ;-------------------------------
      0023F1                       6479 spi_read:
      00A0B8 05 42 1C         [ 4] 6480 	call spi_rcv_byte 
      00A0BB 50               [ 1] 6481 	clrw x 
      00A0BC 00               [ 1] 6482 	ld xl,a 
      00A0BD 84 81            [ 1] 6483 	ld a,#TK_INTGR 
      00A0BF 81               [ 4] 6484 	ret 
                                   6485 
                                   6486 ;------------------------------
                                   6487 ; BASIC: SPISEL 0|1 
                                   6488 ; set state of ~CS line
                                   6489 ; 0|1 deselect|select  
                                   6490 ;------------------------------
      0023F9                       6491 spi_select:
      00A0BF 03 06 03         [ 4] 6492 	call next_token 
      00A0C2 05 04            [ 1] 6493 	cp a,#TK_INTGR 
      00A0C4 00 02            [ 1] 6494 	jreq 1$
      00A0C6 01 06 00         [ 2] 6495 	jp syntax_error 
      00A0C9 02               [ 2] 6496 1$: tnzw x  
      00A0CA 02 02            [ 1] 6497 	jreq cs_high 
      00A0CC 03 03 01 03      [ 1] 6498 	bres PE_ODR,#SPI_CS_BIT
      00A0D0 03               [ 4] 6499 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00240B                       6500 cs_high: 
      00A0D1 02 04 04 05      [ 1] 6501 	bset PE_ODR,#SPI_CS_BIT
      00A0D5 02               [ 4] 6502 	ret 
                                   6503 
                                   6504 ;-------------------------------
                                   6505 ; BASIC: PAD 
                                   6506 ; Return pad buffer address.
                                   6507 ;------------------------------
      002410                       6508 pad_ref:
      00A0D6 06 02 07         [ 2] 6509 	ldw x,#pad 
      00A0D9 02 05            [ 1] 6510 	ld a,TK_INTGR
      00A0DB 04               [ 4] 6511 	ret 
                                   6512 
                                   6513 ;------------------------------
                                   6514 ; BASIC; XTRMT  
                                   6515 ; transmit file using xmodem protocol
                                   6516 ; via terminal serial port 
                                   6517 ;------------------------------------
                           000001  6518 	SERIAL=1 ;packet serial number
                           000001  6519 	VAR_SIZE=1
      002416                       6520 transmit:
      002416                       6521 	_vars VAR_SIZE
      00A0DC 02 04            [ 2]    1     sub sp,#VAR_SIZE 
      00A0DE 01 24 82         [ 2] 6522 	ldw x,#xtrmt_msg 
      00A0DF CD 00 00         [ 4] 6523 	call puts 
                                   6524 ; end of file marker 
      00A0DF CD 91 6F         [ 2] 6525 	ldw x,txtend 
      00A0E2 A1 01 27 03      [ 2] 6526 	ldw y,#END_IDX 
      00A0E6 CC               [ 2] 6527 	ldw (x),y 
                                   6528 ; zeroes end of file 
      00A0E7 89 9C 02         [ 2] 6529 	addw x,#2 
      00A0E9 89               [ 2] 6530 	pushw x 
      00A0E9 A6 80 15 01      [ 2] 6531 	subw x,txtbgn 
      00A0ED 27               [ 1] 6532 	ld a,xl 
      00A0EE 05 A6 0A         [ 1] 6533 	ld acc8,a 
      00A0F1 CC 89            [ 1] 6534 	ld a,#128 
      00A0F3 9E 00 0D         [ 1] 6535 	sub a,acc8 
      00A0F4 C7 00 0D         [ 1] 6536 	ld acc8,a 
      00A0F4 CE               [ 2] 6537 	popw x 
      00A0F5 00               [ 1] 6538 1$:	clr (x)
      00A0F6 13               [ 1] 6539 	incw x 
      00A0F7 58 58 58 58      [ 1] 6540 	dec acc8  
      00A0FB 58 9E            [ 1] 6541 	jrne 1$
                                   6542 ; transmit on uart3 channel 
      002443                       6543 wait_nak:
      00A0FD C8 00 13         [ 4] 6544 	call uart3_getc 
      00A100 C7 00            [ 1] 6545 	cp a,#NAK  
      00A102 0D 9F            [ 1] 6546 	jrne wait_nak 
      00A104 C8 00            [ 1] 6547 	clr (SERIAL,sp)
      00A106 14 C7 00         [ 2] 6548 	ldw x,txtbgn
      00244F                       6549 tx_loop:
      00A109 0E CE            [ 1] 6550 	ld a,(SERIAL,sp)
      00A10B 00               [ 1] 6551 	inc a
      00A10C 15 CF            [ 1] 6552 	ld (SERIAL,sp),a 
      00A10E 00 13 90         [ 4] 6553 	call xtrmt_block
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A111 54 90            [ 1] 6554 	cp a,#NAK 
      00A113 9E C8            [ 1] 6555 	jreq tx_failed 
      00A115 00 15 C7         [ 2] 6556 	cpw x,txtend
      00A118 00 15            [ 1] 6557 	jrult tx_loop 
      002460                       6558 tx_success:
      00A11A 90 9F            [ 1] 6559 	ld a,#EOT 
      00A11C C8 00 16         [ 4] 6560 	call uart3_putc 
      00A11F C7 00 16 CE      [ 2] 6561 	ldw y,#1000
      00A123 00 0D 54         [ 4] 6562 	call getc_to  
      00A126 54 54 9E         [ 2] 6563 	ldw x,#x_success 
      00A129 C8 00 0D         [ 4] 6564 	call puts 
      00A12C 95 9F            [ 2] 6565 	jra tx_exit
      002474                       6566 tx_failed:
      00A12E C8 00            [ 1] 6567 	ld a,#CAN 
      00A130 0E 97 C8         [ 4] 6568 	call uart3_putc 
      00A133 00 16 97         [ 2] 6569 	ldw x,#x_fail 
      00A136 9E C8 00         [ 4] 6570 	call puts 
      00247F                       6571 tx_exit:
      00247F                       6572 	_drop VAR_SIZE 
      00A139 15 95            [ 2]    1     addw sp,#VAR_SIZE 
      00A13B CF               [ 4] 6573 	ret
      00A13C 00 15 90 85 65 93 5C  6574 xtrmt_msg: .asciz "XMODEM transmit "	 
             74 72 61 6E 73 6D 69
             74 20 00
      00A143 73 75 63 63 65 65 64  6575 x_success: .asciz "succeeded.\n"
             65 64 2E 0A 00
      00A143 A6 84 81 6C 65 64 2E  6576 x_fail: .asciz "failed.\n"
             0A 00
                                   6577 
                                   6578 
                                   6579 ;------------------------------
                                   6580 ; BASIC: XRCV file_name 
                                   6581 ; receive a basic file using
                                   6582 ; xmodem protocol
                                   6583 ; via terminal serial port
                                   6584 ; file is expected to be tokenized 
                                   6585 ; BASIC file and is stored in RAM. 
                                   6586 ;------------------------------
      00A146                       6587 receive: 
      00A146 52 03 0F         [ 2] 6588 	ldw x,#xrcv_msg 
      00A149 02 0F 03         [ 4] 6589 	call puts 
      00A14C 90 AE            [ 1] 6590 	ld a,#NAK 
      00A14E A9 27 93         [ 4] 6591 	call uart3_putc 
      00A151 F6 A4 0F         [ 2] 6592 	ldw x,txtbgn
      0024B6                       6593 rx_loop:
      00A154 6B 01 0C         [ 4] 6594 	call xrcv_block
      00A157 03 5C            [ 1] 6595 	cp a,#ACK 
      00A159 F6 CD            [ 1] 6596 	jreq rx_loop 
      00A15B 83 AB            [ 1] 6597 	cp a,#EOT
      00A15D 0C 02            [ 1] 6598 	jreq rx_success 	
      0024C1                       6599 rx_failed:
      00A15F 0A 01            [ 1] 6600 	ld a,#ETX 
      00A161 26 F5 A6         [ 4] 6601 	call uart3_putc 
      00A164 46 11 02         [ 2] 6602 	ldw x,#x_fail 
      00A167 2B 09 A6         [ 4] 6603 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A16A 20               [ 4] 6604 	ret 
      0024CD                       6605 rx_success:
                                   6606 ;back to END_IDX 	
      00A16B CD 83 AB         [ 2] 6607 	cpw x,txtbgn
      00A16E 0C 02            [ 1] 6608 	jreq 1$ 
      00A170 20 07            [ 1] 6609 	ldw y,x 
      00A172 A6 0D            [ 2] 6610 	ldw y,(y)
      00A174 CD 83 AB 0F      [ 2] 6611 	cpw y,#END_IDX 
      00A178 02 72            [ 1] 6612 	jreq 1$
      00A17A A2               [ 2] 6613 	decw x 
      00A17B 00 02            [ 2] 6614 	jra rx_success
      00A17D 90 FE 26         [ 2] 6615 1$:	ldw txtend,x 
      00A180 CF A6 0D         [ 2] 6616 	ldw x,#x_success
      00A183 CD 83 AB         [ 4] 6617 	call puts 
      00A186 5F               [ 4] 6618 	ret
      00A187 7B 03 97 CD 8A EF AE  6619 xrcv_msg: .asciz "XMODEM receive "
             A1 96 CD AA 40 5B 03
             81 20
                                   6620 
                                   6621 
                                   6622 ;------------------------------
                                   6623 ;      dictionary 
                                   6624 ; format:
                                   6625 ;   link:   2 bytes 
                                   6626 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6627 ;   cmd_name: 16 byte max 
                                   6628 ;   cmd_index: 2 bytes 
                                   6629 ;------------------------------
                                   6630 	.macro _dict_entry len,name,cmd_idx 
                                   6631 	.word LINK 
                                   6632 	LINK=.
                                   6633 name:
                                   6634 	.byte len 	
                                   6635 	.ascii "name"
                                   6636 	.word cmd_idx 
                                   6637 	.endm 
                                   6638 
                           000000  6639 	LINK=0
                                   6640 ; respect alphabetic order for BASIC names from Z-A
                                   6641 ; this sort order is for a cleaner WORDS cmd output. 	
      0024F9                       6642 kword_end:
      0024F9                       6643 	_dict_entry,5,XTRMT,XTRMT_IDX ; xmodem transmit
      00A197 77 6F                    1 	.word LINK 
                           0024FB     2 	LINK=.
      0024FB                          3 XTRMT:
      00A199 72                       4 	.byte 5 	
      00A19A 64 73 20 69 6E           5 	.ascii "XTRMT"
      00A19F 20 64                    6 	.word XTRMT_IDX 
      002503                       6644 	_dict_entry,4,XRCV,XRCV_IDX ; xmodem receive
      00A1A1 69 63                    1 	.word LINK 
                           002505     2 	LINK=.
      002505                          3 XRCV:
      00A1A3 74                       4 	.byte 4 	
      00A1A4 69 6F 6E 61              5 	.ascii "XRCV"
      00A1A8 72 79                    6 	.word XRCV_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00250C                       6645 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A1AA 0A 00                    1 	.word LINK 
                           00250E     2 	LINK=.
      00A1AC                          3 XOR:
      00A1AC CD                       4 	.byte 3+F_IFUNC 	
      00A1AD 91 74 A1                 5 	.ascii "XOR"
      00A1B0 01 27                    6 	.word XOR_IDX 
      002514                       6646 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A1B2 03 CC                    1 	.word LINK 
                           002516     2 	LINK=.
      002516                          3 WRITE:
      00A1B4 89                       4 	.byte 5 	
      00A1B5 9C 52 49 54 45           5 	.ascii "WRITE"
      00A1B6 00 C4                    6 	.word WRITE_IDX 
      00251E                       6647 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A1B6 85 CF                    1 	.word LINK 
                           002520     2 	LINK=.
      002520                          3 WORDS:
      00A1B8 00                       4 	.byte 5 	
      00A1B9 11 81 52 44 53           5 	.ascii "WORDS"
      00A1BB 00 C2                    6 	.word WORDS_IDX 
      002528                       6648 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A1BB CE 00                    1 	.word LINK 
                           00252A     2 	LINK=.
      00252A                          3 WAIT:
      00A1BD 11                       4 	.byte 4 	
      00A1BE 57 41 49 54              5 	.ascii "WAIT"
      00A1BE 53 A3                    6 	.word WAIT_IDX 
      002531                       6649 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A1C0 FF FF                    1 	.word LINK 
                           002533     2 	LINK=.
      002533                          3 USR:
      00A1C2 27                       4 	.byte 3+F_IFUNC 	
      00A1C3 01 5F A6                 5 	.ascii "USR"
      00A1C6 84 81                    6 	.word USR_IDX 
      00A1C8                       6650 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A1C8 CD 91                    1 	.word LINK 
                           00253B     2 	LINK=.
      00253B                          3 UNTIL:
      00A1CA 6F                       4 	.byte 5 	
      00A1CB A1 01 27 03 CC           5 	.ascii "UNTIL"
      00A1D0 89 9C                    6 	.word UNTIL_IDX 
      002543                       6651 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A1D2 85 20                    1 	.word LINK 
                           002545     2 	LINK=.
      002545                          3 UFLASH:
      00A1D4 E9                       4 	.byte 6+F_IFUNC 	
      00A1D5 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A1D5 CD 91                    6 	.word UFLASH_IDX 
      00254E                       6652 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A1D7 74 A1                    1 	.word LINK 
                           002550     2 	LINK=.
      002550                          3 UBOUND:
      00A1D9 01                       4 	.byte 6+F_IFUNC 	
      00A1DA 27 03 CC 89 9C 85        5 	.ascii "UBOUND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A1E0 4B 00                    6 	.word UBOUND_IDX 
      002559                       6653 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A1E2 35 CC                    1 	.word LINK 
                           00255B     2 	LINK=.
      00255B                          3 TONE:
      00A1E4 50                       4 	.byte 4 	
      00A1E5 E0 9E A4 3F              5 	.ascii "TONE"
      00A1E9 95 A3                    6 	.word TONE_IDX 
      002562                       6654 	_dict_entry,2,TO,TO_IDX;to
      00A1EB 00 FF                    1 	.word LINK 
                           002564     2 	LINK=.
      002564                          3 TO:
      00A1ED 23                       4 	.byte 2 	
      00A1EE 06 0C                    5 	.ascii "TO"
      00A1F0 01 98                    6 	.word TO_IDX 
      002569                       6655 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A1F2 56 20                    1 	.word LINK 
                           00256B     2 	LINK=.
      00256B                          3 TIMER:
      00A1F4 F5                       4 	.byte 5 	
      00A1F5 35 55 50 E0 84           5 	.ascii "TIMER"
      00A1FA C7 50                    6 	.word TIMER_IDX 
      002573                       6656 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A1FC E1 9F                    1 	.word LINK 
                           002575     2 	LINK=.
      002575                          3 TIMEOUT:
      00A1FE 4A                       4 	.byte 7+F_IFUNC 	
      00A1FF 35 55 50 E0 C7 50 E2     5 	.ascii "TIMEOUT"
      00A206 35 AA                    6 	.word TMROUT_IDX 
      00257F                       6657 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A208 50 E0                    1 	.word LINK 
                           002581     2 	LINK=.
      002581                          3 TICKS:
      00A20A 81                       4 	.byte 5+F_IFUNC 	
      00A20B 54 49 43 4B 53           5 	.ascii "TICKS"
      00A20B 35 AA                    6 	.word TICKS_IDX 
      002589                       6658 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A20D 50 E0                    1 	.word LINK 
                           00258B     2 	LINK=.
      00258B                          3 STOP:
      00A20F 81                       4 	.byte 4 	
      00A210 53 54 4F 50              5 	.ascii "STOP"
      00A210 CD 91                    6 	.word STOP_IDX 
      002592                       6659 	_dict_entry,4,STEP,STEP_IDX;step 
      00A212 6F A1                    1 	.word LINK 
                           002594     2 	LINK=.
      002594                          3 STEP:
      00A214 01                       4 	.byte 4 	
      00A215 27 03 CC 89              5 	.ascii "STEP"
      00A219 9C 85                    6 	.word STEP_IDX 
      00A21B                       6660 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A21B 5D 27                    1 	.word LINK 
                           00259D     2 	LINK=.
      00259D                          3 SPIWR:
      00A21D 0A                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A21E A6 0F 59 25 03           5 	.ascii "SPIWR"
      00A223 4A 20                    6 	.word SPIWR_IDX 
      0025A5                       6661 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A225 FA 5F                    1 	.word LINK 
                           0025A7     2 	LINK=.
      0025A7                          3 SPISEL:
      00A227 97                       4 	.byte 6 	
      00A228 A6 84 81 53 45 4C        5 	.ascii "SPISEL"
      00A22B 00 A6                    6 	.word SPISEL_IDX 
      0025B0                       6662 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A22B CD 91                    1 	.word LINK 
                           0025B2     2 	LINK=.
      0025B2                          3 SPIRD:
      00A22D 6F                       4 	.byte 5+F_IFUNC 	
      00A22E A1 01 27 03 CC           5 	.ascii "SPIRD"
      00A233 89 9C                    6 	.word SPIRD_IDX 
      0025BA                       6663 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A235 85 9F                    1 	.word LINK 
                           0025BC     2 	LINK=.
      0025BC                          3 SPIEN:
      00A237 A4                       4 	.byte 5 	
      00A238 0F 5F 5C 4D 27           5 	.ascii "SPIEN"
      00A23D 04 58                    6 	.word SPIEN_IDX 
      0025C4                       6664 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A23F 4A 20                    1 	.word LINK 
                           0025C6     2 	LINK=.
      0025C6                          3 SLEEP:
      00A241 F9                       4 	.byte 5 	
      00A242 A6 84 81 45 50           5 	.ascii "SLEEP"
      00A245 00 A0                    6 	.word SLEEP_IDX 
      0025CE                       6665 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A245 CD 91                    1 	.word LINK 
                           0025D0     2 	LINK=.
      0025D0                          3 SIZE:
      00A247 6F                       4 	.byte 4+F_IFUNC 	
      00A248 A1 01 27 03              5 	.ascii "SIZE"
      00A24C CC 89                    6 	.word SIZE_IDX 
      0025D7                       6666     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A24E 9C 85                    1 	.word LINK 
                           0025D9     2 	LINK=.
      0025D9                          3 SHOW:
      00A250 53                       4 	.byte 4 	
      00A251 A6 84 81 57              5 	.ascii "SHOW"
      00A254 00 9C                    6 	.word SHOW_IDX 
      0025E0                       6667 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A254 85 52                    1 	.word LINK 
                           0025E2     2 	LINK=.
      0025E2                          3 SAVE:
      00A256 04                       4 	.byte 4 	
      00A257 89 90 CE 00              5 	.ascii "SAVE"
      00A25B 05 17                    6 	.word SAVE_IDX 
      0025E9                       6668 	_dict_entry 3,RUN,RUN_IDX;run
      00A25D 03 90                    1 	.word LINK 
                           0025EB     2 	LINK=.
      0025EB                          3 RUN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A25F CE                       4 	.byte 3 	
      00A260 00 01 17                 5 	.ascii "RUN"
      00A263 05 72                    6 	.word RUN_IDX 
      0025F1                       6669 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A265 5C 00                    1 	.word LINK 
                           0025F3     2 	LINK=.
      0025F3                          3 RSHIFT:
      00A267 21                       4 	.byte 6+F_IFUNC 	
      00A268 81 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A269 00 96                    6 	.word RSHIFT_IDX 
      0025FC                       6670 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A269 72 5D                    1 	.word LINK 
                           0025FE     2 	LINK=.
      0025FE                          3 RND:
      00A26B 00                       4 	.byte 3+F_IFUNC 	
      00A26C 21 26 03                 5 	.ascii "RND"
      00A26F CC 89                    6 	.word RND_IDX 
      002604                       6671 	_dict_entry,6,RETURN,RET_IDX;return 
      00A271 9C FE                    1 	.word LINK 
                           002606     2 	LINK=.
      00A272                          3 RETURN:
      00A272 CD                       4 	.byte 6 	
      00A273 92 BF A1 84 27 03        5 	.ascii "RETURN"
      00A279 CC 89                    6 	.word RET_IDX 
      00260F                       6672 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A27B 9C 06                    1 	.word LINK 
                           002611     2 	LINK=.
      00A27C                          3 RESTORE:
      00A27C 5D                       4 	.byte 7 	
      00A27D 26 10 1E 03 CF 00 05     5 	.ascii "RESTORE"
      00A284 E6 02                    6 	.word REST_IDX 
      00261B                       6673 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A286 C7 00                    1 	.word LINK 
                           00261D     2 	LINK=.
      00261D                          3 REMARK:
      00A288 04                       4 	.byte 6 	
      00A289 1E 05 CF 00 01 81        5 	.ascii "REMARK"
      00A28F 00 8E                    6 	.word REM_IDX 
      002626                       6674 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A28F 85 5B                    1 	.word LINK 
                           002628     2 	LINK=.
      002628                          3 REBOOT:
      00A291 04                       4 	.byte 6 	
      00A292 72 5A 00 21 FC 54        5 	.ascii "REBOOT"
      00A297 00 8C                    6 	.word RBT_IDX 
      002631                       6675 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A297 AE 00                    1 	.word LINK 
                           002633     2 	LINK=.
      002633                          3 READ:
      00A299 00                       4 	.byte 4+F_IFUNC 	
      00A29A A6 84 81 44              5 	.ascii "READ"
      00A29D 00 8A                    6 	.word READ_IDX 
      00263A                       6676 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A29D AE 00                    1 	.word LINK 
                           00263C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00263C                          3 QKEY:
      00A29F 01                       4 	.byte 4+F_IFUNC 	
      00A2A0 A6 84 81 59              5 	.ascii "QKEY"
      00A2A3 00 88                    6 	.word QKEY_IDX 
      002643                       6677 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A2A3 AE 00                    1 	.word LINK 
                           002645     2 	LINK=.
      002645                          3 PRTI:
      00A2A5 02                       4 	.byte 4+F_IFUNC 	
      00A2A6 A6 84 81 49              5 	.ascii "PRTI"
      00A2A9 00 86                    6 	.word PRTI_IDX 
      00264C                       6678 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A2A9 AE 00                    1 	.word LINK 
                           00264E     2 	LINK=.
      00264E                          3 PRTH:
      00A2AB 03                       4 	.byte 4+F_IFUNC 	
      00A2AC A6 84 81 48              5 	.ascii "PRTH"
      00A2AF 00 84                    6 	.word PRTH_IDX 
      002655                       6679 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A2AF AE 00                    1 	.word LINK 
                           002657     2 	LINK=.
      002657                          3 PRTG:
      00A2B1 04                       4 	.byte 4+F_IFUNC 	
      00A2B2 A6 84 81 47              5 	.ascii "PRTG"
      00A2B5 00 82                    6 	.word PRTG_IDX 
      00265E                       6680 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A2B5 AE 00                    1 	.word LINK 
                           002660     2 	LINK=.
      002660                          3 PRTF:
      00A2B7 05                       4 	.byte 4+F_IFUNC 	
      00A2B8 A6 84 81 46              5 	.ascii "PRTF"
      00A2BB 00 80                    6 	.word PRTF_IDX 
      002667                       6681 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A2BB AE 00                    1 	.word LINK 
                           002669     2 	LINK=.
      002669                          3 PRTE:
      00A2BD 06                       4 	.byte 4+F_IFUNC 	
      00A2BE A6 84 81 45              5 	.ascii "PRTE"
      00A2C1 00 7E                    6 	.word PRTE_IDX 
      002670                       6682 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A2C1 AE 00                    1 	.word LINK 
                           002672     2 	LINK=.
      002672                          3 PRTD:
      00A2C3 07                       4 	.byte 4+F_IFUNC 	
      00A2C4 A6 84 81 44              5 	.ascii "PRTD"
      00A2C7 00 7C                    6 	.word PRTD_IDX 
      002679                       6683 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A2C7 AE 00                    1 	.word LINK 
                           00267B     2 	LINK=.
      00267B                          3 PRTC:
      00A2C9 08                       4 	.byte 4+F_IFUNC 	
      00A2CA A6 84 81 43              5 	.ascii "PRTC"
      00A2CD 00 7A                    6 	.word PRTC_IDX 
      002682                       6684 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A2CD A6 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002684     2 	LINK=.
      002684                          3 PRTB:
      00A2CF AE                       4 	.byte 4+F_IFUNC 	
      00A2D0 00 00 81 42              5 	.ascii "PRTB"
      00A2D3 00 78                    6 	.word PRTB_IDX 
      00268B                       6685 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A2D3 A6 84                    1 	.word LINK 
                           00268D     2 	LINK=.
      00268D                          3 PRTA:
      00A2D5 AE                       4 	.byte 4+F_IFUNC 	
      00A2D6 00 01 81 41              5 	.ascii "PRTA"
      00A2D9 00 76                    6 	.word PRTA_IDX 
      002694                       6686 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A2D9 A6 84                    1 	.word LINK 
                           002696     2 	LINK=.
      002696                          3 PRINT:
      00A2DB AE                       4 	.byte 5 	
      00A2DC 00 02 81 4E 54           5 	.ascii "PRINT"
      00A2DF 00 74                    6 	.word PRT_IDX 
      00269E                       6687 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A2DF A6 84                    1 	.word LINK 
                           0026A0     2 	LINK=.
      0026A0                          3 POUT:
      00A2E1 AE                       4 	.byte 4+F_IFUNC 	
      00A2E2 00 03 81 54              5 	.ascii "POUT"
      00A2E5 00 72                    6 	.word POUT_IDX 
      0026A7                       6688 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A2E5 A6 84                    1 	.word LINK 
                           0026A9     2 	LINK=.
      0026A9                          3 POKE:
      00A2E7 AE                       4 	.byte 4 	
      00A2E8 00 04 81 45              5 	.ascii "POKE"
      00A2EB 00 70                    6 	.word POKE_IDX 
      0026B0                       6689 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A2EB A6 84                    1 	.word LINK 
                           0026B2     2 	LINK=.
      0026B2                          3 PMODE:
      00A2ED AE                       4 	.byte 5 	
      00A2EE 00 01 81 44 45           5 	.ascii "PMODE"
      00A2F1 00 6A                    6 	.word PMODE_IDX 
      0026BA                       6690 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A2F1 A6 84                    1 	.word LINK 
                           0026BC     2 	LINK=.
      0026BC                          3 PINP:
      00A2F3 AE                       4 	.byte 4+F_IFUNC 	
      00A2F4 00 00 81 50              5 	.ascii "PINP"
      00A2F7 00 6E                    6 	.word PINP_IDX 
      0026C3                       6691 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A2F7 A6 84                    1 	.word LINK 
                           0026C5     2 	LINK=.
      0026C5                          3 PEEK:
      00A2F9 AE                       4 	.byte 4+F_IFUNC 	
      00A2FA 40 00 81 4B              5 	.ascii "PEEK"
      00A2FD 00 6C                    6 	.word PEEK_IDX 
      0026CC                       6692 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A2FD 55 00                    1 	.word LINK 
                           0026CE     2 	LINK=.
      0026CE                          3 PAUSE:
      00A2FF 04                       4 	.byte 5 	
      00A300 00 02 81 53 45           5 	.ascii "PAUSE"
      00A303 00 68                    6 	.word PAUSE_IDX 
      0026D6                       6693 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A303 CD 92                    1 	.word LINK 
                           0026D8     2 	LINK=.
      0026D8                          3 PAD:
      00A305 73                       4 	.byte 3+F_IFUNC 	
      00A306 A1 84 27                 5 	.ascii "PAD"
      00A309 03 CC                    6 	.word PAD_IDX 
      0026DE                       6694 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A30B 89 9C                    1 	.word LINK 
                           0026E0     2 	LINK=.
      0026E0                          3 OR:
      00A30D CD                       4 	.byte 2+F_IFUNC 	
      00A30E 85 20                    5 	.ascii "OR"
      00A310 5D 26                    6 	.word OR_IDX 
      0026E5                       6695 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A312 05 A6                    1 	.word LINK 
                           0026E7     2 	LINK=.
      0026E7                          3 ODR:
      00A314 05                       4 	.byte 3+F_IFUNC 	
      00A315 CC 89 9E                 5 	.ascii "ODR"
      00A318 00 62                    6 	.word ODR_IDX 
      0026ED                       6696 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A318 90 93                    1 	.word LINK 
                           0026EF     2 	LINK=.
      0026EF                          3 NOT:
      00A31A EE                       4 	.byte 3+F_IFUNC 	
      00A31B 04 A3 A2                 5 	.ascii "NOT"
      00A31E FD 26                    6 	.word NOT_IDX 
      0026F5                       6697 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A320 F2 90                    1 	.word LINK 
                           0026F7     2 	LINK=.
      0026F7                          3 NEXT:
      00A322 CF                       4 	.byte 4 	
      00A323 00 07 90 E6              5 	.ascii "NEXT"
      00A327 02 C7                    6 	.word NEXT_IDX 
      0026FE                       6698 	_dict_entry,3,NEW,NEW_IDX;new
      00A329 00 0A                    1 	.word LINK 
                           002700     2 	LINK=.
      002700                          3 NEW:
      00A32B 35                       4 	.byte 3 	
      00A32C 06 00 09                 5 	.ascii "NEW"
      00A32F 81 5E                    6 	.word NEW_IDX 
      00A330                       6699 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A330 72 5F                    1 	.word LINK 
                           002708     2 	LINK=.
      002708                          3 MULDIV:
      00A332 00                       4 	.byte 6+F_IFUNC 	
      00A333 07 72 5F 00 08 72        5 	.ascii "MULDIV"
      00A339 5F 00                    6 	.word MULDIV_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      002711                       6700 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A33B 09 72                    1 	.word LINK 
                           002713     2 	LINK=.
      002713                          3 LSHIFT:
      00A33D 5F                       4 	.byte 6+F_IFUNC 	
      00A33E 00 0A CE 00 1D 54        5 	.ascii "LSHIFT"
      00A343 00 58                    6 	.word LSHIFT_IDX 
      00271C                       6701 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A343 C3 00                    1 	.word LINK 
                           00271E     2 	LINK=.
      00271E                          3 LOG:
      00A345 1F                       4 	.byte 3+F_IFUNC 	
      00A346 24 1B 90                 5 	.ascii "LOG"
      00A349 93 EE                    6 	.word LOG_IDX 
      002724                       6702 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A34B 04 1C                    1 	.word LINK 
                           002726     2 	LINK=.
      002726                          3 LOAD:
      00A34D A9                       4 	.byte 4 	
      00A34E 2D FE A3 A2              5 	.ascii "LOAD"
      00A352 FD 26                    6 	.word LOAD_IDX 
      00272D                       6703 	_dict_entry 4,LIST,LIST_IDX;list
      00A354 1A 90                    1 	.word LINK 
                           00272F     2 	LINK=.
      00272F                          3 LIST:
      00A356 CF                       4 	.byte 4 	
      00A357 00 07 90 E6              5 	.ascii "LIST"
      00A35B 02 C7                    6 	.word LIST_IDX 
      002736                       6704 	_dict_entry 3,LET,LET_IDX;let 
      00A35D 00 0A                    1 	.word LINK 
                           002738     2 	LINK=.
      002738                          3 LET:
      00A35F 35                       4 	.byte 3 	
      00A360 06 00 09                 5 	.ascii "LET"
      00A363 72 5D                    6 	.word LET_IDX 
      00273E                       6705 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A365 00 0A                    1 	.word LINK 
                           002740     2 	LINK=.
      002740                          3 KEY:
      00A367 26                       4 	.byte 3+F_IFUNC 	
      00A368 05 A6 0C                 5 	.ascii "KEY"
      00A36B CC 89                    6 	.word KEY_IDX 
      002746                       6706 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A36D 9E 81                    1 	.word LINK 
                           002748     2 	LINK=.
      00A36F                          3 IWDGREF:
      00A36F 93                       4 	.byte 7 	
      00A370 E6 02 C7 00 0E 72 5F     5 	.ascii "IWDGREF"
      00A377 00 0D                    6 	.word IWDGREF_IDX 
      002752                       6707 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A379 72 BB                    1 	.word LINK 
                           002754     2 	LINK=.
      002754                          3 IWDGEN:
      00A37B 00                       4 	.byte 6 	
      00A37C 0D 20 C4 47 45 4E        5 	.ascii "IWDGEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A37F 00 4A                    6 	.word IWDGEN_IDX 
      00275D                       6708 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A37F 52 06                    1 	.word LINK 
                           00275F     2 	LINK=.
      00A381                          3 INVERT:
      00A381 C6                       4 	.byte 6+F_IFUNC 	
      00A382 00 09 C1 00 0A 27        5 	.ascii "INVERT"
      00A388 37 CD                    6 	.word INVERT_IDX 
      002768                       6709 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A38A 96 C6                    1 	.word LINK 
                           00276A     2 	LINK=.
      00276A                          3 INPUT:
      00A38C CE                       4 	.byte 5 	
      00A38D 00 07 CF 00 05           5 	.ascii "INPUT"
      00A392 55 00                    6 	.word INPUT_IDX 
      002772                       6710 	_dict_entry,2,IF,IF_IDX;if 
      00A394 09 00                    1 	.word LINK 
                           002774     2 	LINK=.
      002774                          3 IF:
      00A396 02                       4 	.byte 2 	
      00A397 55 00                    5 	.ascii "IF"
      00A399 0A 00                    6 	.word IF_IDX 
      002779                       6711 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A39B 04 CD                    1 	.word LINK 
                           00277B     2 	LINK=.
      00277B                          3 IDR:
      00A39D 92                       4 	.byte 3+F_IFUNC 	
      00A39E 73 A1 84                 5 	.ascii "IDR"
      00A3A1 27 03                    6 	.word IDR_IDX 
      002781                       6712 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A3A3 CC 89                    1 	.word LINK 
                           002783     2 	LINK=.
      002783                          3 HEX:
      00A3A5 9C                       4 	.byte 3 	
      00A3A6 48 45 58                 5 	.ascii "HEX"
      00A3A6 1F 05                    6 	.word HEX_IDX 
      002789                       6713 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A3A8 CD 8A                    1 	.word LINK 
                           00278B     2 	LINK=.
      00278B                          3 GPIO:
      00A3AA 8E                       4 	.byte 4+F_IFUNC 	
      00A3AB CE 00 05 CF              5 	.ascii "GPIO"
      00A3AF 00 07                    6 	.word GPIO_IDX 
      002792                       6714 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A3B1 55 00                    1 	.word LINK 
                           002794     2 	LINK=.
      002794                          3 GOTO:
      00A3B3 02                       4 	.byte 4 	
      00A3B4 00 09 CD 96              5 	.ascii "GOTO"
      00A3B8 D6 1E                    6 	.word GOTO_IDX 
      00279B                       6715 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A3BA 05 A6                    1 	.word LINK 
                           00279D     2 	LINK=.
      00279D                          3 GOSUB:
      00A3BC 84                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A3BD 5B 06 81 55 42           5 	.ascii "GOSUB"
      00A3C0 00 3A                    6 	.word GOSUB_IDX 
      0027A5                       6716 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A3C0 90 CE                    1 	.word LINK 
                           0027A7     2 	LINK=.
      0027A7                          3 FORGET:
      00A3C2 00                       4 	.byte 6 	
      00A3C3 07 72 5F 00 07 72        5 	.ascii "FORGET"
      00A3C9 5F 00                    6 	.word FORGET_IDX 
      0027B0                       6717 	_dict_entry,3,FOR,FOR_IDX;for 
      00A3CB 08 72                    1 	.word LINK 
                           0027B2     2 	LINK=.
      0027B2                          3 FOR:
      00A3CD 5F                       4 	.byte 3 	
      00A3CE 00 09 72                 5 	.ascii "FOR"
      00A3D1 5F 00                    6 	.word FOR_IDX 
      0027B8                       6718 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A3D3 0A CD                    1 	.word LINK 
                           0027BA     2 	LINK=.
      0027BA                          3 FCPU:
      00A3D5 A3                       4 	.byte 4 	
      00A3D6 6F 20 A8 55              5 	.ascii "FCPU"
      00A3D9 00 34                    6 	.word FCPU_IDX 
      0027C1                       6719 	_dict_entry,3,END,END_IDX;cmd_end  
      00A3D9 CD 91                    1 	.word LINK 
                           0027C3     2 	LINK=.
      0027C3                          3 END:
      00A3DB 74                       4 	.byte 3 	
      00A3DC A1 02 27                 5 	.ascii "END"
      00A3DF 03 CC                    6 	.word END_IDX 
      0027C9                       6720 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A3E1 89 9C                    1 	.word LINK 
                           0027CB     2 	LINK=.
      00A3E3                          3 EEPROM:
      00A3E3 72                       4 	.byte 6+F_IFUNC 	
      00A3E4 12 50 C7 85 5D 27        5 	.ascii "EEPROM"
      00A3EA 21 85                    6 	.word EEPROM_IDX 
      0027D4                       6721 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A3EC A6 08                    1 	.word LINK 
                           0027D6     2 	LINK=.
      0027D6                          3 DWRITE:
      00A3EE 42                       4 	.byte 6+F_CMD 	
      00A3EF 9F C7 52 00 72 1A        5 	.ascii "DWRITE"
      00A3F5 50 14                    6 	.word DWRITE_IDX 
      0027DF                       6722 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A3F7 72 1A                    1 	.word LINK 
                           0027E1     2 	LINK=.
      0027E1                          3 DREAD:
      00A3F9 50                       4 	.byte 5+F_IFUNC 	
      00A3FA 16 72 14 52 00           5 	.ascii "DREAD"
      00A3FF 72 12                    6 	.word DREAD_IDX 
      0027E9                       6723 	_dict_entry,2,DO,DO_IDX;do_loop
      00A401 52 01                    1 	.word LINK 
                           0027EB     2 	LINK=.
      0027EB                          3 DO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A403 72                       4 	.byte 2 	
      00A404 10 52                    5 	.ascii "DO"
      00A406 01 72                    6 	.word DO_IDX 
      0027F0                       6724 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A408 1C 52                    1 	.word LINK 
                           0027F2     2 	LINK=.
      0027F2                          3 DIR:
      00A40A 00                       4 	.byte 3 	
      00A40B 81 49 52                 5 	.ascii "DIR"
      00A40C 00 28                    6 	.word DIR_IDX 
      0027F8                       6725 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A40C 5B 02                    1 	.word LINK 
                           0027FA     2 	LINK=.
      0027FA                          3 DEC:
      00A40E A6                       4 	.byte 3 	
      00A40F 82 C4 52                 5 	.ascii "DEC"
      00A412 03 A1                    6 	.word DEC_IDX 
      002800                       6726 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A414 02 26                    1 	.word LINK 
                           002802     2 	LINK=.
      002802                          3 DDR:
      00A416 F7                       4 	.byte 3+F_IFUNC 	
      00A417 72 1D 52                 5 	.ascii "DDR"
      00A41A 00 72                    6 	.word DDR_IDX 
      002808                       6727 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A41C 13 50                    1 	.word LINK 
                           00280A     2 	LINK=.
      00280A                          3 DATALN:
      00A41E C7                       4 	.byte 6 	
      00A41F 72 1B 50 16 81 4E        5 	.ascii "DATALN"
      00A424 00 22                    6 	.word DATALN_IDX 
      002813                       6728 	_dict_entry,4,DATA,DATA_IDX;data  
      00A424 A6 78                    1 	.word LINK 
                           002815     2 	LINK=.
      002815                          3 DATA:
      00A426 C5                       4 	.byte 4 	
      00A427 52 03 27 04              5 	.ascii "DATA"
      00A42B 72 5F                    6 	.word DATA_IDX 
      00281C                       6729 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A42D 52 03                    1 	.word LINK 
                           00281E     2 	LINK=.
      00281E                          3 CRL:
      00A42F 81                       4 	.byte 3+F_IFUNC 	
      00A430 43 52 4C                 5 	.ascii "CRL"
      00A430 88 CD                    6 	.word CRL_IDX 
      002824                       6730 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A432 A4 24                    1 	.word LINK 
                           002826     2 	LINK=.
      002826                          3 CRH:
      00A434 84                       4 	.byte 3+F_IFUNC 	
      00A435 72 03 52                 5 	.ascii "CRH"
      00A438 03 FB                    6 	.word CRH_IDX 
      00282C                       6731 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A43A C7 52                    1 	.word LINK 
                           00282E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00282E                          3 CHAR:
      00A43C 04                       4 	.byte 4+F_CFUNC 	
      00A43D 72 01 52 03              5 	.ascii "CHAR"
      00A441 FB C6                    6 	.word CHAR_IDX 
      002835                       6732 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A443 52 04                    1 	.word LINK 
                           002837     2 	LINK=.
      002837                          3 BYE:
      00A445 81                       4 	.byte 3 	
      00A446 42 59 45                 5 	.ascii "BYE"
      00A446 A6 FF                    6 	.word BYE_IDX 
      00283D                       6733 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A448 72 01                    1 	.word LINK 
                           00283F     2 	LINK=.
      00283F                          3 BTOGL:
      00A44A 52                       4 	.byte 5 	
      00A44B 03 E3 C6 52 04           5 	.ascii "BTOGL"
      00A450 81 16                    6 	.word BTOGL_IDX 
      00A451                       6734 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A451 CD 92                    1 	.word LINK 
                           002849     2 	LINK=.
      002849                          3 BTEST:
      00A453 73                       4 	.byte 5+F_IFUNC 	
      00A454 A1 84 27 03 CC           5 	.ascii "BTEST"
      00A459 89 9C                    6 	.word BTEST_IDX 
      00A45B                       6735 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A45B 9F CD                    1 	.word LINK 
                           002853     2 	LINK=.
      002853                          3 BSET:
      00A45D A4                       4 	.byte 4 	
      00A45E 30 CD 8A 8E              5 	.ascii "BSET"
      00A462 A1 09                    6 	.word BSET_IDX 
      00285A                       6736 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A464 26 02                    1 	.word LINK 
                           00285C     2 	LINK=.
      00285C                          3 BRES:
      00A466 20                       4 	.byte 4 	
      00A467 E9 4D 27 05              5 	.ascii "BRES"
      00A46B 55 00                    6 	.word BRES_IDX 
      002863                       6737 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A46D 03 00                    1 	.word LINK 
                           002865     2 	LINK=.
      002865                          3 BIT:
      00A46F 02                       4 	.byte 3+F_IFUNC 	
      00A470 81 49 54                 5 	.ascii "BIT"
      00A471 00 0E                    6 	.word BIT_IDX 
      00286B                       6738 	_dict_entry,3,AWU,AWU_IDX;awu 
      00A471 CD A4                    1 	.word LINK 
                           00286D     2 	LINK=.
      00286D                          3 AWU:
      00A473 46                       4 	.byte 3 	
      00A474 5F 97 A6                 5 	.ascii "AWU"
      00A477 84 81                    6 	.word AWU_IDX 
      00A479                       6739 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A479 CD 8A                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                           002875     2 	LINK=.
      002875                          3 AUTORUN:
      00A47B 8E                       4 	.byte 7 	
      00A47C A1 84 27 03 CC 89 9C     5 	.ascii "AUTORUN"
      00A483 5D 27                    6 	.word AUTORUN_IDX 
      00287F                       6740 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A485 05 72                    1 	.word LINK 
                           002881     2 	LINK=.
      002881                          3 ASC:
      00A487 1B                       4 	.byte 3+F_IFUNC 	
      00A488 50 14 81                 5 	.ascii "ASC"
      00A48B 00 08                    6 	.word ASC_IDX 
      002887                       6741 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A48B 72 1A                    1 	.word LINK 
                           002889     2 	LINK=.
      002889                          3 AND:
      00A48D 50                       4 	.byte 3+F_IFUNC 	
      00A48E 14 81 44                 5 	.ascii "AND"
      00A490 00 06                    6 	.word AND_IDX 
      00288F                       6742 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A490 AE 16                    1 	.word LINK 
                           002891     2 	LINK=.
      002891                          3 ADCREAD:
      00A492 E0                       4 	.byte 7+F_IFUNC 	
      00A493 B6 84 81 52 45 41 44     5 	.ascii "ADCREAD"
      00A496 00 04                    6 	.word ADCREAD_IDX 
      00289B                       6743 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A496 52 01                    1 	.word LINK 
                           00289D     2 	LINK=.
      00289D                          3 ADCON:
      00A498 AE                       4 	.byte 5 	
      00A499 A5 02 CD AA 40           5 	.ascii "ADCON"
      00A49E CE 00                    6 	.word ADCON_IDX 
      0028A5                       6744 kword_dict:
      0028A5                       6745 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A4A0 1F 90                    1 	.word LINK 
                           0028A7     2 	LINK=.
      0028A7                          3 ABS:
      00A4A2 AE                       4 	.byte 3+F_IFUNC 	
      00A4A3 00 30 FF                 5 	.ascii "ABS"
      00A4A6 1C 00                    6 	.word ABS_IDX 
                                   6746 
                                   6747 ;comands and fonctions address table 	
      0028AD                       6748 code_addr:
      00A4A8 02 89 72 B0 00 1D 9F  6749 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             C7 00 0E A6 80 C0 00
             0E C7
      00A4B8 00 0E 85 7F 5C 72 5A  6750 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             00 0E 26 F8 DD 22 65
      00A4C3 22 5F 22 7D 22 83 22  6751 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             59 12 DD 1D 24 21 D4
             19 DF 1A 0F
      00A4C3 CD 83 EA A1 15 26 F9  6752 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             0F 01 CE 00 1D 18 69
             1E 2B
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A4CF 12 D8 22 53 17 75 16  6753 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             66 21 C5 21 55 21 8B
             1E 16
      00A4CF 7B 01 4C 6B 01 CD AD  6754 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             CF A1 15 27 19 C3 00
             1F 25
      00A4DF EF 48 22 4D 1F 75 24  6755 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             10 1E E7 1F E3 17 64
             22 71
      00A4E0 17 55 22 6B 15 E0 22  6756 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             17 22 1D 22 23 22 29
             22 2F
      00A4E0 A6 04 CD 83 B4 90 AE  6757 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             03 E8 CD AD 53 AE A5
             13 CD
      00A4F0 AA 40 20 0B 20 5F 1F  6758 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             BE 18 C2 1B 87 12 97
             12 E2
      00A4F4 1E DC 23 F1 23 59 23  6759 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             F9 23 D1 17 E2 1A 4A
             1F 43
      00A4F4 A6 18 CD 83 B4 AE A5  6760 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             1F CD AA 40 55 21 E9
             1E 5B
      00A4FF 16 D8 20 C6 1D A6 1F  6761 	.word wait,words,write,bit_xor,transmit,receive ; 96..103 
             8D 24 16 24 A8
      00A4FF 5B 01                 6762 	.word 0 
                                   6763 
      002980                       6764 	.bndry 128 ; align on FLASH block.
                                   6765 ; free space for user application  
      002980                       6766 user_space:
                                   6767 ; USR() function test
      00A501 81               [ 2] 6768 	pushw x 
      00A502 58 4D 4F 44      [ 1] 6769 	bset PC_ODR,#5 
      00A506 45               [ 2] 6770 	popw x 
      00A507 4D 20 74         [ 4] 6771 	call pause02 
      00A50A 72 61 6E 73      [ 1] 6772 	bres PC_ODR,#5 
      00A50E 6D               [ 4] 6773 	ret
                                   6774 
                                   6775 	.area FLASH_DRIVE (ABS)
      010000                       6776 	.org 0x10000
      010000                       6777 fdrive:
                                   6778 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0028A7 R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      00289D R
    ADCON_ID=  000002     |   5 ADCREAD    002891 R   |     ADCREAD_=  000004 
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
  5 AND        002889 R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        002881 R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    002875 R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        00286D R   |   5 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        002865 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_CO=  000004     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       00285C R
    BRES_IDX=  000010     |     BS      =  000008     |     BSAVE   =  000001 
  5 BSET       002853 R   |     BSET_IDX=  000012     |     BSIZE   =  000001 
  5 BTEST      002849 R   |     BTEST_ID=  000014     |   5 BTOGL      00283F R
    BTOGL_ID=  000016     |     BTW     =  000001     |   5 BYE        002837 R
    BYE_IDX =  000018     |     C       =  000001     |     CAN     =  000018 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       00282E R
    CHAR_IDX=  00001A     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
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
    CLK_SWR_=  0000D2     |     CMDX    =  000001     |     CMD_END =  000002 
    CNT     =  000006     |     CNTR    =  000003     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        002826 R   |     CRH_IDX =  00001C 
  5 CRL        00281E R   |     CRL_IDX =  00001E     |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CTXT_SIZ=  000004     |     CTX_BPTR=  000001 
    CTX_COUN=  000004     |     CTX_IN  =  000003     |     CURR    =  000002 
    CVAR    =  000007     |     CX_BPTR =  000001     |     CX_CNT  =  000004 
    CX_IN   =  000003     |   5 DATA       002815 R   |   5 DATALN     00280A R
    DATALN_I=  000022     |     DATA_IDX=  000020     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
    DBL     =  000003     |     DBLDIVDN=  000006     |     DBLHI   =  000001 
    DBLLO   =  000003     |     DBL_SIZE=  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  5 DDR        002802 R   |     DDR_IDX =  000024     |     DEBUG   =  000000 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |     DEBUG_PR=  000001 
  5 DEC        0027FA R   |     DEC_IDX =  000026     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0027F2 R
    DIR_IDX =  000028     |     DIVDNDHI=  00000B     |     DIVDNDLO=  00000D 
    DIVISOR =  000001     |     DIVISR  =  000007     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         0027EB R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

    DO_IDX  =  00002A     |   5 DREAD      0027E1 R   |     DREAD_ID=  00002C 
  5 DWRITE     0027D6 R   |     DWRITE_I=  00002E     |   5 EEPROM     0027CB R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_I=  000032 
    EEPROM_S=  000800     |     EM      =  000019     |   5 END        0027C3 R
    END_IDX =  000030     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FAUTORUN=  000006     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       0027BA R   |     FCPU_IDX=  000034 
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
    FLSI    =  01F400     |   5 FOR        0027B2 R   |   5 FORGET     0027A7 R
    FORGET_I=  000038     |     FOR_IDX =  000036     |     FRUN    =  000000 
    FS      =  00001C     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FSTEP   =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      00279D R   |     GOSUB_ID=  00003A     |   5 GOTO       002794 R
    GOTO_IDX=  00003C     |   5 GPIO       00278B R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003E     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   5 HEX        002783 R
    HEX_IDX =  000040     |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    I2C_SR1_=  000001     |     I2C_SR1_=  000002     |     I2C_SR1_=  000006 
    I2C_SR1_=  000000     |     I2C_SR1_=  000004     |     I2C_SR1_=  000007 
    I2C_SR2 =  005218     |     I2C_SR2_=  000002     |     I2C_SR2_=  000001 
    I2C_SR2_=  000000     |     I2C_SR2_=  000003     |     I2C_SR2_=  000005 
    I2C_SR3 =  005219     |     I2C_SR3_=  000001     |     I2C_SR3_=  000007 
    I2C_SR3_=  000004     |     I2C_SR3_=  000000     |     I2C_SR3_=  000002 
    I2C_TRIS=  00521D     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        00277B R
    IDR_IDX =  000042     |   5 IF         002774 R   |     IF_IDX  =  000044 
    IN      =  000005     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      00276A R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_ID=  000046     |     INPUT_PU=  000001 
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
    INT_VECT=  008058     |   5 INVERT     00275F R   |     INVERT_I=  000048 
    INW     =  000009     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     002754 R   |     IWDGEN_I=  00004A     |   5 IWDGREF    002748 R
    IWDGREF_=  00004C     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002740 R   |     KEY_IDX =  00004E 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  5 LET        002738 R   |     LET_IDX =  000050     |     LF      =  00000A 
    LIMIT   =  000005     |     LINENO  =  000005     |   5 LINK    =  0028A7 R
  5 LIST       00272F R   |     LIST_IDX=  000052     |     LL      =  000001 
    LLEN    =  000002     |     LN_PTR  =  000005     |   5 LOAD       002726 R
    LOAD_IDX=  000054     |   5 LOG        00271E R   |     LOG_IDX =  000056 
  5 LSHIFT     002713 R   |     LSHIFT_I=  000058     |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |   5 MULDIV     002708 R   |     MULDIV_I=  00005A 
    MULOP   =  000003     |     N1      =  000001     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        002700 R   |     NEW_FREE=  000001 
    NEW_IDX =  00005E     |   5 NEXT       0026F7 R   |     NEXT_IDX=  00005C 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        0026EF R
    NOT_IDX =  000060     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R   |   5 ODR        0026E7 R
    ODR_IDX =  000062     |     ONOFF   =  000003     |     OP      =  000003 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         0026E0 R   |     OR_IDX  =  000064 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |   5 PAD        0026D8 R
    PAD_IDX =  000066     |     PAD_SIZE=  000080     |   5 PAUSE      0026CE R
    PAUSE_ID=  000068     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       0026C5 R
    PEEK_IDX=  00006C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       0026BC R   |     PINP_IDX=  00006E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 PMODE      0026B2 R   |     PMODE_ID=  00006A     |   5 POKE       0026A9 R
    POKE_IDX=  000070     |     PORT    =  000003     |   5 POUT       0026A0 R
    POUT_IDX=  000072     |     PREV    =  000001     |   5 PRINT      002696 R
  5 PRTA       00268D R   |     PRTA_IDX=  000076     |   5 PRTB       002684 R
    PRTB_IDX=  000078     |   5 PRTC       00267B R   |     PRTC_IDX=  00007A 
  5 PRTD       002672 R   |     PRTD_IDX=  00007C     |   5 PRTE       002669 R
    PRTE_IDX=  00007E     |   5 PRTF       002660 R   |     PRTF_IDX=  000080 
  5 PRTG       002657 R   |     PRTG_IDX=  000082     |   5 PRTH       00264E R
    PRTH_IDX=  000084     |   5 PRTI       002645 R   |     PRTI_IDX=  000086 
    PRT_IDX =  000074     |     PSTR    =  000003     |   5 QKEY       00263C R
    QKEY_IDX=  000088     |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |     RBT_IDX =  00008C     |   5 READ       002633 R
    READ_IDX=  00008A     |   5 REBOOT     002628 R   |     REG     =  000001 
    REGA    =  000001     |     REGX    =  000003     |     REGY    =  000005 
    RELOP   =  000003     |   5 REMARK     00261D R   |     REM_IDX =  00008E 
  5 RESTORE    002611 R   |     REST_IDX=  000090     |     RETL1   =  000001 
  5 RETURN     002606 R   |     RET_ADDR=  000003     |     RET_IDX =  000092 
    RET_INW =  000005     |   5 RND        0025FE R   |     RND_IDX =  000094 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    ROP     =  004800     |     RS      =  00001E     |   5 RSHIFT     0025F3 R
    RSHIFT_I=  000096     |     RST_SR  =  0050B3     |   5 RUN        0025EB R
    RUN_IDX =  000098     |     RX_QUEUE=  000008     |   5 SAVE       0025E2 R
    SAVEB   =  000002     |     SAVE_IDX=  00009A     |     SDIVSR  =  000005 
    SERIAL  =  000001     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       0025D9 R   |     SHOW_IDX=  00009C 
    SI      =  00000F     |     SIGN    =  000001     |   5 SIZE       0025D0 R
    SIZE_IDX=  00009E     |     SKIP    =  000005     |   5 SLEEP      0025C6 R
    SLEEP_ID=  0000A0     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   5 SPIEN      0025BC R   |     SPIEN_ID=  0000A4 
  5 SPIRD      0025B2 R   |     SPIRD_ID=  0000A2     |   5 SPISEL     0025A7 R
    SPISEL_I=  0000A6     |   5 SPIWR      00259D R   |     SPIWR_ID=  0000A8 
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
  5 STEP       002594 R   |     STEP_IDX=  0000AA     |   5 STOP       00258B R
    STOP_IDX=  0000AC     |     STR     =  000003     |     STX     =  000002 
    SUB     =  00001A     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      002581 R   |     TICKS_ID=  0000AE 
    TIM1_ARR=  005262     |     TIM1_ARR=  005263     |     TIM1_BKR=  00526D 
    TIM1_CCE=  00525C     |     TIM1_CCE=  00525D     |     TIM1_CCM=  005258 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_SR_=  000000     |   5 TIMEOUT    002575 R   |   5 TIMER      00256B R
    TIMER_ID=  0000B0     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_VAR  =  000085     |     TMROUT_I=  0000B2     |   5 TO         002564 R
  5 TONE       00255B R   |     TONE_IDX=  0000B6     |     TO_IDX  =  0000B4 
  5 Timer4Up   000078 R   |     U1      =  000001     |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART2   =  000001     |     UART3   =  000002 
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
  5 UBOUND     002550 R   |     UBOUND_I=  0000B8     |   5 UBTN_Han   0000BA R
  5 UFLASH     002545 R   |     UFLASH_I=  0000BA     |   5 UNTIL      00253B R
    UNTIL_ID=  0000BC     |     US      =  00001F     |   5 USER_ABO   0000C2 R
  5 USR        002533 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000BE     |   5 Uart1RxH   00000F R
  5 Uart3RxH   000052 R   |   5 UserButt   00008D R   |     VAR_ADDR=  000006 
    VAR_SIZE=  000001     |     VSIZ    =  000002     |     VSIZE   =  000006 
    VT      =  00000B     |   5 WAIT       00252A R   |     WAIT_IDX=  0000C0 
    WCNT    =  000003     |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      002520 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

    WORDS_ID=  0000C2     |   5 WRITE      002516 R   |     WRITE_ID=  0000C4 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  5 XOR        00250E R   |     XOR_IDX =  0000C6     |   5 XRCV       002505 R
    XRCV_IDX=  0000CA     |     XREG    =  000003     |     XSAVE   =  000005 
  5 XTRMT      0024FB R   |     XTRMT_ID=  0000C8     |     YSAVE   =  000007 
  5 abs        001F49 R   |   1 acc16      00000C GR  |   1 acc24      00000B GR
  1 acc8       00000D GR  |   5 add_char   0015A0 R   |   5 add_spac   0013CA R
  5 analog_r   0019AB R   |   5 arduino_   00203F R   |   5 arg_list   0010F4 R
  1 array_si   000021 R   |   5 ascii      001DEF R   |   5 at_tst     000D58 R
  5 atoi24     000E69 GR  |   5 atoi_exi   000ECF R   |   5 autorun    001E81 R
  5 autorun_   000771 R   |   5 awu        001EFA R   |   5 awu02      001F04 R
  5 bad_port   001E50 R   |   1 base       00000A R   |   1 basicptr   000004 GR
  5 beep       001938 R   |   5 beep_1kh   001922 GR  |   5 bin_exit   000C36 R
  5 bit_and    001F5D R   |   5 bit_or     001F75 R   |   5 bit_rese   00170D R
  5 bit_set    0016FD R   |   5 bit_test   00172E R   |   5 bit_togg   00171E R
  5 bit_xor    001F8D R   |   5 bitmask    0021AB R   |   5 bkslsh_t   000D05 R
  5 block_er   0001E3 R   |   5 break_po   001A78 R   |   5 bye        001E78 R
  5 cancel_a   000739 R   |   5 char       001DDD R   |   5 clear_ba   000786 R
  5 clear_va   000601 R   |   5 clock_in   0000DD R   |   5 cmd_end    00191B R
  5 cmd_line   0009A6 R   |   5 cmd_name   001063 R   |   5 cmp_name   001B19 R
  5 code_add   0028AD R   |   5 cold_sta   000678 R   |   5 colon_ts   000D2C R
  5 comma_ts   000D37 R   |   5 comp_msg   0008FB R   |   5 compile    00058E R
  5 const_cr   00225F R   |   5 const_cr   002265 R   |   5 const_dd   002259 R
  5 const_ee   002277 R   |   5 const_id   002253 R   |   5 const_in   002271 R
  5 const_od   00224D R   |   5 const_ou   00226B R   |   5 const_po   002217 R
  5 const_po   00221D R   |   5 const_po   002223 R   |   5 const_po   002229 R
  5 const_po   00222F R   |   5 const_po   002235 R   |   5 const_po   00223B R
  5 const_po   002241 R   |   5 const_po   002247 R   |   5 convert_   000BAD R
  5 copy_com   000D8D R   |   1 count      000003 GR  |   5 cp_loop    0010A3 R
  5 cpy_cmd_   0013B5 R   |   5 cpy_quot   0013EE R   |   5 create_g   0004F1 R
  5 cs_high    00240B R   |   5 cstk_pro   0012B1 R   |   5 dash_tst   000D4D R
  5 data       00227D R   |   1 data_len   000009 R   |   5 data_lin   002283 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   0022C3 R
  5 dbl_sign   000FCB R   |   5 dec_base   0012DD R   |   5 decomp_l   00149F R
  5 decompil   001458 GR  |   5 del_line   0004C4 R   |   5 digital_   0019DF R
  5 digital_   001A0F R   |   5 dir_loop   001D30 R   |   5 director   001D24 R
  5 disk_fre   001B06 R   |   5 div32_16   000FD5 R   |   5 divide     00102C R
  5 divu24_8   000AF0 R   |   5 dneg       000FC0 R   |   5 do_loop    0021D4 R
  5 do_progr   0001D6 R   |   5 drive_fr   001D99 R   |   5 enable_i   002155 R
  5 eql_tst    000DE2 R   |   5 equal      0015B3 R   |   5 erase_fl   000202 R
  5 err_bad_   000866 R   |   5 err_buf_   0008DC R   |   5 err_cmd_   00082A R
  5 err_div0   0007EF R   |   5 err_dupl   000844 R   |   5 err_math   0007D6 R
  5 err_mem_   0007BB R   |   5 err_msg    00079B R   |   5 err_no_a   000872 R
  5 err_no_d   0008A5 R   |   5 err_no_f   0008C9 R   |   5 err_no_l   0007FE R
  5 err_no_p   0008B5 R   |   5 err_not_   000855 R   |   5 err_run_   000814 R
  5 err_synt   0007C8 R   |   5 escaped    000BC2 R   |   5 expect     0010E2 R
  5 expr_exi   00123C R   |   5 expressi   0011F3 R   |   5 factor     001144 R
  1 farptr     000016 R   |   5 fcpu       001FD7 R   |   7 fdrive     010000 R
  1 ffree      000019 R   |   5 file_cou   001D91 R   |   5 first_li   001362 R
  1 flags      000023 R   |   5 for        001789 R   |   5 forget     001CB6 R
  1 free_ram   00006D R   |   5 func_arg   0010EF R   |   5 func_not   002148 R
  5 ge         0015B5 R   |   5 get_arra   00111F R   |   5 get_cmd_   001437 R
  5 get_targ   001853 R   |   5 get_tick   001F43 R   |   5 get_toke   000C9E R
  5 getc       00034B GR  |     getc_to    ****** GX  |   5 gosub      001884 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

  5 goto       001869 R   |   5 gpio       001E2B R   |   5 gt         0015B1 R
  5 gt_tst     000DED R   |   5 hex_base   0012D8 R   |   5 hex_dump   0003F7 R
  5 if         001775 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001AC6 R   |   5 input_ex   0016CF R
  5 input_lo   001668 R   |   5 input_va   001666 R   |   5 insert_l   00051D R
  5 insert_l   00058B R   |   5 interp_l   0009E7 R   |   5 interpre   0009C2 R
  5 invert     0021C5 R   |   5 is_alnum   000629 R   |   5 is_alpha   00060F R
  5 is_digit   000620 R   |   5 itoa       000A8B R   |   5 itoa_loo   000AAA R
  5 jp_to_ta   001877 R   |   5 key        001E16 R   |   5 kw_loop    000C52 R
  5 kword_di   0028A5 R   |   5 kword_en   0024F9 R   |   5 le         0015BA R
  5 leading_   00219B R   |   5 let        00130E R   |   5 let_arra   00131C R
  5 let_var    00131F R   |   5 lines_sk   001365 R   |   5 list       001339 R
  5 list_exi   0013A7 R   |   5 list_loo   001385 R   |   5 load       001C86 R
  5 load_aut   000748 R   |   5 load_fil   001C55 R   |   5 log2       002190 R
  5 logical_   00213E R   |   5 long_div   000FA8 R   |   5 loop_bac   001836 R
  1 loop_dep   000020 R   |   5 loop_don   00184B R   |   5 lshift     001FA5 R
  5 lt         0015B8 R   |   5 lt_tst     000E16 R   |   5 modulo     001042 R
  5 move       00045E GR  |   5 move_dow   00047C R   |   5 move_era   000168 R
  5 move_exi   00049D R   |   5 move_loo   000481 R   |   5 move_prg   00019C R
  5 move_up    00046E R   |   5 mul_char   0015A2 R   |   5 muldiv     001047 R
  5 multiply   000F73 R   |   5 mulu24_8   000B18 R   |   5 nbr_tst    000CD1 R
  5 ne         0015BD R   |   5 neg_acc2   000B52 R   |   5 new        001A96 R
  5 next       001809 R   |   5 next_lin   0009CA R   |   5 next_tok   000A0E R
  5 no_match   0010B5 R   |   5 other      000E3F R   |   3 pad        0016E0 R
  5 pad_ref    002410 R   |   5 parse_bi   000C14 R   |   5 parse_in   000BCA R
  5 parse_ke   000C51 R   |   5 parse_qu   000B75 R   |   5 pause      001EE7 R
  5 pause02    001EF1 R   |   5 peek       001764 R   |   5 pin_mode   001FE3 R
  5 plus_tst   000DB6 R   |   5 poke       001755 R   |   5 power_ad   00196F R
  5 prcnt_ts   000DD7 R   |   5 print      0015E0 R   |   5 print_ex   00163A R
  5 print_in   000A6F R   |   5 printxy    000EE6 R   |   5 program_   00017C R
  5 program_   00019C R   |   5 prt_basi   0015C0 R   |   5 prt_loop   0015E4 R
  5 prt_tok    000389 R   |   5 prti24     000A7F R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       00032B GR  |     puts       ****** GX
  5 qgetc      00033D GR  |   5 qkey       001E1E GR  |   5 qmark_ts   000D63 R
  5 random     00205F R   |   5 read       0022FF R   |   5 read01     002301 R
    readln     ****** GX  |   5 receive    0024A8 R   |   5 refresh_   00218B R
  5 rel_exit   001294 R   |   5 relation   00123F R   |   5 relop_st   0015A5 R
  5 remark     0016D2 R   |   5 reset_co   0015E2 R   |   5 rest_con   001656 R
  5 restore    0022B0 R   |   5 return     0018A4 R   |   5 right_al   0013DC R
  5 row_alig   001AAB R   |   5 row_eras   000141 R   |   5 row_eras   000168 R
  5 row_loop   0003DA R   |   5 rparnt_t   000D21 R   |   5 rshift     001FBE R
  5 rt_msg     0008E9 R   |   5 run        0018C2 R   |   5 run_it     0018F4 R
  1 rx1_head   00002D R   |   1 rx1_queu   000025 R   |   1 rx1_tail   00002E R
  1 rx3_head   000037 R   |   1 rx3_queu   00002F R   |   1 rx3_tail   000038 R
  5 rx_faile   0024C1 R   |   5 rx_loop    0024B6 R   |   5 rx_succe   0024CD R
  5 save       001B87 R   |   5 save_con   001646 R   |   5 search_d   001095 R
  5 search_e   0010DF R   |   5 search_f   001B3A R   |   5 search_l   0004A0 GR
  5 search_l   0004A8 R   |   5 search_n   001099 R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   001AD4 R   |   5 select_p   00202F R
  5 set_time   00212C R   |   5 sharp_ts   000D42 R   |   5 show       001297 R
  5 show_row   0003C8 R   |   5 single_c   00159B R   |   5 size       0012E2 R
  5 skip       000ED3 R   |   5 slash_ts   000DCC R   |   5 sleep      001EDC R
  5 software   000632 R   |     spaces     ****** GX  |   5 spi_clea   0023A4 R
  5 spi_disa   00238C R   |   5 spi_enab   002359 R   |   5 spi_rcv_   0023C6 R
  5 spi_read   0023F1 R   |   5 spi_sele   0023F9 R   |   5 spi_send   0023B0 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

  5 spi_writ   0023D1 R   |   3 stack_fu   001760 R   |   3 stack_un   001800 R
  5 star_tst   000DC1 R   |   5 step       0017E2 R   |   5 stop       001A4A R
  5 store_lo   0017F6 R   |   5 str_matc   0010C2 R   |   5 str_tst    000CC1 R
  5 strcmp     00043F R   |   5 strcpy     000450 R   |   5 strlen     000434 GR
  5 syntax_e   00091C R   |   1 tab_widt   000024 R   |   5 tb_error   00091E R
  5 term       0011A1 R   |   5 term01     0011A9 R   |   5 term_exi   0011F0 R
  3 tib        001690 GR  |   5 tick_tst   000D7B R   |   1 ticks      00000E R
  5 timeout    00213B R   |   1 timer      000010 GR  |   5 timer2_i   0000F3 R
  5 timer4_i   000100 R   |   5 tk_id      00090C R   |   5 to         0017B2 R
  5 to_eepro   0001BF R   |   5 to_flash   0001D3 R   |   5 to_upper   000E5D GR
  5 token_ch   000E56 R   |   5 token_ex   000E5A R   |   5 token_ms   0003C0 R
  5 tone       00192B R   |   5 transmit   002416 R   |   5 try_next   0022EF R
  5 tx_exit    00247F R   |   5 tx_faile   002474 R   |   5 tx_loop    00244F R
  5 tx_succe   002460 R   |   1 txtbgn     00001C R   |   1 txtend     00001E R
  5 uart1_ge   00034B GR  |   5 uart1_in   0002E8 R   |   5 uart1_pu   00032B GR
  5 uart1_qg   00033D GR  |   5 uart1_se   0002F8 R   |   5 uart3_ge   00036A GR
  5 uart3_in   0002A5 R   |   5 uart3_pu   000334 GR  |   5 uart3_qg   000344 GR
  5 uart3_se   0002B5 R   |   5 ubound     0012EC R   |   5 udiv32_1   000F96 R
  5 uflash     001E55 R   |   5 umstar     000F39 R   |   5 unlock_e   000115 R
  5 unlock_f   00012B R   |   5 until      0021E9 R   |   5 user_int   0000A0 R
  5 user_spa   002980 R   |   5 usr        001E5B R   |   5 var_name   00142F R
  1 vars       000039 R   |   5 wait       0016D8 R   |   5 wait_nak   002443 R
  5 warm_ini   00071B R   |   5 warm_sta   0009A3 R   |   5 words      0020C6 R
  5 words_co   002116 R   |   5 write      001DA6 R   |   5 write_bl   000282 R
  5 write_by   00020D R   |   5 write_ee   000249 R   |   5 write_ex   00027D R
  5 write_fl   000233 R   |   5 write_ro   0001B0 R   |   5 x_fail     00249F R
  5 x_succes   002493 R   |     xrcv_blo   ****** GX  |   5 xrcv_msg   0024E9 R
    xtrmt_bl   ****** GX  |   5 xtrmt_ms   002482 R   |   5 zero_pad   001AA0 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     6D   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   298E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

