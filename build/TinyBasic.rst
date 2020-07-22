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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      000026                         88 rx_queue: .ds RX_QUEUE_SIZE ; UART1 receive circular queue 
      00002E                         89 rx_head:  .blkb 1 ; rx_queue head pointer
      00002F                         90 rx_tail:   .blkb 1 ; rx_queue tail pointer  
      000030                         91 comm: .blkb 1 ; active communication UART1|UART3 
                                     92 
      000031                         93 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     94 ; keep 'free_ram' as last variable 
      000065                         95 free_ram: ; from here RAM free for BASIC text 
                                     96 
                                     97 ;;-----------------------------------
                                     98     .area SSEG (ABS)
                                     99 ;; working buffers and stack at end of RAM. 	
                                    100 ;;-----------------------------------
      001690                        101     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      001690                        102 tib:: .ds TIB_SIZE             ; transaction input buffer
      0016E0                        103 pad: .ds PAD_SIZE             ; working buffer
      001760                        104 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        105 stack_unf: ; stack underflow ; control_stack bottom 
                                    106 
                                    107 ;;--------------------------------------
                                    108     .area HOME 
                                    109 ;; interrupt vector table at 0x8000
                                    110 ;;--------------------------------------
      008000 82 00 86 BE            111     int cold_start			; RESET vector 
                           000000   112 .if DEBUG
                                    113 	int TrapHandler 		;TRAP  software interrupt
                           000001   114 .else
      008004 82 00 80 80            115 	int NonHandledInterrupt ;TRAP  software interrupt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                    116 .endif
      008008 82 00 80 80            117 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            118 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            119 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            120 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            121 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            122 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            123 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 DD            124 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            125 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            126 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            127 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            128 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            129 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            130 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            131 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            132 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            133 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            134 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            135 	int UartRxHandler		;int18 UART1 RX full ; default user communication channel.
      008054 82 00 80 80            136 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            137 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 8F            138 	int UartRxHandler       ;int21 UART3 RX full
      008060 82 00 80 80            139 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 C8            140 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            141 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            142 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            143 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            144 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            145 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            146 	int NonHandledInterrupt ;int29  not used
                                    147 
                                    148 ;---------------------------------------
                                    149     .area CODE
                                    150 ;---------------------------------------
                           000000   151 .if DEBUG
                                    152 .asciz "STM8_TBI" ; I like to put module name here.
                                    153 .endif 
                                    154 
                                    155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    156 ; non handled interrupt 
                                    157 ; reset MCU
                                    158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        159 NonHandledInterrupt:
      008080 71                     160     .byte 0x71  ; invalid opcode reinitialize MCU
                                    161 
                                    162 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    163 ; auto wakeup from halt
                                    164 ; at iret, program continue 
                                    165 ; after hatl instruction
                                    166 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        167 AWUHandler:
      008081 72 19 50 F0      [ 1]  168 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  169 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  170 	clr AWU_TBR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00808E 80               [11]  171 	iret
                                    172 
                                    173 ;--------------------------
                                    174 ; UART receive character
                                    175 ; CTRL-C (ASCII 3)
                                    176 ; cancel program execution
                                    177 ; and fall back to command line
                                    178 ;--------------------------
      00808F                        179 UartRxHandler:
      00000F                        180 	_led2_on 
      00808F 72 1A 50 0A      [ 1]    1     bset LED2_PORT,#LED2_BIT 
      008093 A6 00            [ 1]  181 	ld a,#UART1
      008095 C1 00 30         [ 1]  182 	cp a,comm 
      008098 26 0A            [ 1]  183 	jrne 0$ 
      00809A 72 0B 52 30 28   [ 2]  184 	btjf UART1_SR,#UART_SR_RXNE,5$
      00809F C6 52 31         [ 1]  185 	ld a,UART1_DR 
      0080A2 20 08            [ 2]  186 	jra 1$
      0080A4                        187 0$:	
      0080A4 72 0B 52 40 1E   [ 2]  188 	btjf UART3_SR,#UART_SR_RXNE,5$
      0080A9 C6 52 41         [ 1]  189 	ld a,UART3_DR 
      0080AC                        190 1$:
                           000000   191 .if 0 ; pas compatible avec XMODEM
                                    192 	cp a,#CTRL_C 
                                    193 	jrne 2$
                                    194 	call putc 
                                    195 	jp user_interrupted
                                    196 2$:
                                    197 	cp a,#CAN ; CTRL_X 
                                    198 	jrne 3$
                                    199 	jp cold_start 	
                                    200 3$: 
                                    201 	cp a,#CTRL_Z
                                    202 	jrne 4$
                                    203 	call cancel_autorun 
                                    204 	jp cold_start
                                    205 .endif 	 
      0080AC AE 00 26         [ 2]  206 4$:	ldw x,#rx_queue  
      0080AF 88               [ 1]  207 	push a 
      0080B0 9F               [ 1]  208 	ld a,xl 
      0080B1 CB 00 2F         [ 1]  209 	add a,rx_tail 
      0080B4 97               [ 1]  210 	ld xl,a
      0080B5 84               [ 1]  211 	pop a  
      0080B6 F7               [ 1]  212 	ld (x),a
      0080B7 72 5C 00 2F      [ 1]  213 	inc rx_tail 
      0080BB A6 07            [ 1]  214 	ld a,#RX_QUEUE_SIZE-1
      0080BD C4 00 2F         [ 1]  215 	and a,rx_tail 
      0080C0 C7 00 2F         [ 1]  216 	ld rx_tail,a  
      000043                        217 	_led2_off 	
      0080C3 72 1B 50 0A      [ 1]    1     bres LED2_PORT,#LED2_BIT 
      0080C7 80               [11]  218 5$:	iret 
                                    219 
                                    220 ;------------------------------------
                                    221 ; software interrupt handler  
                                    222 ;------------------------------------
                           000000   223 .if DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    224 TrapHandler:
                                    225 	bset flags,#FTRAP 
                                    226 	call print_registers
                                    227 	call cmd_itf
                                    228 	bres flags,#FTRAP 	
                                    229 	iret
                                    230 .endif 
                                    231 
                                    232 ;------------------------------
                                    233 ; TIMER 4 is used to maintain 
                                    234 ; a milliseconds 'ticks' counter
                                    235 ; and decrement 'timer' varaiable
                                    236 ;--------------------------------
      0080C8                        237 Timer4UpdateHandler:
      0080C8 72 5F 53 42      [ 1]  238 	clr TIM4_SR 
      0080CC CE 00 0F         [ 2]  239 	ldw x,ticks
      0080CF 5C               [ 1]  240 	incw x
      0080D0 CF 00 0F         [ 2]  241 	ldw ticks,x 
      0080D3 CE 00 11         [ 2]  242 	ldw x,timer
                                    243 ;	tnzw x 
      0080D6 27 04            [ 1]  244 	jreq 1$
      0080D8 5A               [ 2]  245 	decw x 
      0080D9 CF 00 11         [ 2]  246 	ldw timer,x 
      0080DC                        247 1$:	
      0080DC 80               [11]  248 	iret 
                                    249 
                                    250 
                                    251 ;------------------------------------
                                    252 ; Triggered by pressing USER UserButton 
                                    253 ; on NUCLEO card.
                                    254 ; This is used to abort a progam lock 
                                    255 ; in infinite loop. 
                                    256 ;------------------------------------
      0080DD                        257 UserButtonHandler:
                                    258 ; wait button release
      0080DD 5F               [ 1]  259 	clrw x
      0080DE 5A               [ 2]  260 1$: decw x 
      0080DF 26 FD            [ 1]  261 	jrne 1$
      0080E1 72 09 50 15 F8   [ 2]  262 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    263 ; if MCU suspended by SLEEP resume program
      0080E6 72 07 00 24 05   [ 2]  264     btjf flags,#FSLEEP,2$
      0080EB 72 17 00 24      [ 1]  265 	bres flags,#FSLEEP 
      0080EF 80               [11]  266 	iret
      0080F0                        267 2$:	
      0080F0                        268 user_interrupted:
      0080F0 A6 00            [ 1]  269 	ld a,#UART1 
      0080F2 CD A5 77         [ 4]  270 	call con_sel 
      0080F5 72 00 00 24 02   [ 2]  271     btjt flags,#FRUN,4$
      0080FA 20 13            [ 2]  272 	jra UBTN_Handler_exit 
      0080FC                        273 4$:	; program interrupted by user 
      0080FC 72 11 00 24      [ 1]  274 	bres flags,#FRUN 
      008100 AE 81 17         [ 2]  275 	ldw x,#USER_ABORT
      008103 CD AA C0         [ 4]  276 	call puts 
      008106 CE 00 05         [ 2]  277 	ldw x,basicptr 
      008109 C6 00 02         [ 1]  278 	ld a,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00810C CD 96 0A         [ 4]  279 	call prt_basic_line
      00810F                        280 UBTN_Handler_exit:
      00810F AE 17 FF         [ 2]  281     ldw x,#STACK_EMPTY 
      008112 94               [ 1]  282     ldw sp,x
      008113 9A               [ 1]  283 	rim 
      008114 CC 89 ED         [ 2]  284 	jp warm_start
                                    285 
      008117 0A 50 72 6F 67 72 61   286 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    287 
                                    288 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    289 ;    peripherals initialization
                                    290 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    291 
                                    292 ;----------------------------------------
                                    293 ; inialize MCU clock 
                                    294 ; input:
                                    295 ;   A 		source  HSI | 1 HSE 
                                    296 ;   XL      CLK_CKDIVR , clock divisor 
                                    297 ; output:
                                    298 ;   none 
                                    299 ;----------------------------------------
      008132                        300 clock_init:	
      008132 C1 50 C3         [ 1]  301 	cp a,CLK_CMSR 
      008135 27 0C            [ 1]  302 	jreq 2$ ; no switching required 
                                    303 ; select clock source 
      008137 72 12 50 C5      [ 1]  304 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00813B C7 50 C4         [ 1]  305 	ld CLK_SWR,a
      00813E C1 50 C3         [ 1]  306 1$:	cp a,CLK_CMSR
      008141 26 FB            [ 1]  307 	jrne 1$
      008143                        308 2$: 	
                                    309 ; HSI and cpu clock divisor 
      008143 9F               [ 1]  310 	ld a,xl 
      008144 C7 50 C6         [ 1]  311 	ld CLK_CKDIVR,a  
      008147 81               [ 4]  312 	ret
                                    313 
                                    314 ;----------------------------------
                                    315 ; TIMER2 used as audio tone output 
                                    316 ; on port D:5.
                                    317 ; channel 1 configured as PWM mode 1 
                                    318 ;-----------------------------------  
                           00F424   319 TIM2_CLK_FREQ=62500
      008148                        320 timer2_init:
      008148 72 1A 50 C7      [ 1]  321 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      00814C 35 60 53 05      [ 1]  322  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      008150 35 08 53 0C      [ 1]  323 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      008154 81               [ 4]  324 	ret 
                                    325 
                                    326 ;---------------------------------
                                    327 ; TIM4 is configured to generate an 
                                    328 ; interrupt every millisecond 
                                    329 ;----------------------------------
      008155                        330 timer4_init:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008155 72 18 50 C7      [ 1]  331 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008159 35 07 53 45      [ 1]  332 	mov TIM4_PSCR,#7 ; prescale 128  
      00815D 35 7D 53 46      [ 1]  333 	mov TIM4_ARR,#125 ; set for 1msec.
      008161 35 05 53 40      [ 1]  334 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008165 72 10 53 41      [ 1]  335 	bset TIM4_IER,#TIM4_IER_UIE
      008169 81               [ 4]  336 	ret
                                    337 
                                    338 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    339 ;  routines to write to FLASH, EEPROM 
                                    340 ;  and OPTION 
                                    341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    342 
                                    343 ;----------------------------------
                                    344 ; unlock EEPROM/OPT for writing/erasing
                                    345 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    346 ; input:
                                    347 ;  none
                                    348 ; output:
                                    349 ;  none 
                                    350 ;----------------------------------
      00816A                        351 unlock_eeprom:
      00816A 35 00 50 5B      [ 1]  352 	mov FLASH_CR2,#0 
      00816E 35 FF 50 5C      [ 1]  353 	mov FLASH_NCR2,#0xFF 
      008172 35 AE 50 64      [ 1]  354 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008176 35 56 50 64      [ 1]  355     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00817A 72 07 50 5F FB   [ 2]  356 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00817F 81               [ 4]  357 	ret
                                    358 
                                    359 ;----------------------------------
                                    360 ; unlock FLASH for writing/erasing
                                    361 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    362 ; input:
                                    363 ;  none
                                    364 ; output:
                                    365 ;  none
                                    366 ;----------------------------------
      008180                        367 unlock_flash:
      008180 35 00 50 5B      [ 1]  368 	mov FLASH_CR2,#0 
      008184 35 FF 50 5C      [ 1]  369 	mov FLASH_NCR2,#0xFF 
      008188 35 56 50 62      [ 1]  370 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00818C 35 AE 50 62      [ 1]  371 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008190 72 03 50 5F FB   [ 2]  372 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008195 81               [ 4]  373 	ret
                                    374 
                                    375 ;----------------------------
                                    376 ; erase block code must be 
                                    377 ; executed from RAM
                                    378 ; input:
                                    379 ;-----------------------------
      008196                        380 row_erase:
      008196 35 20 50 5B      [ 1]  381 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00819A 35 DF 50 5C      [ 1]  382 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      00819E 4F               [ 1]  383 	clr a 
      00819F 90 5F            [ 1]  384 	clrw y 
      0081A1 91 A7 00 17      [ 1]  385 	ldf ([farptr],y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081A5 90 5C            [ 1]  386     incw y
      0081A7 91 A7 00 17      [ 1]  387 	ldf ([farptr],y),a
      0081AB 90 5C            [ 1]  388     incw y
      0081AD 91 A7 00 17      [ 1]  389 	ldf ([farptr],y),a
      0081B1 90 5C            [ 1]  390     incw y
      0081B3 91 A7 00 17      [ 1]  391 	ldf ([farptr],y),a
      0081B7 72 05 50 5F FB   [ 2]  392 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081BC 81               [ 4]  393 	ret
      0081BD                        394 row_erase_end:
                                    395 
                                    396 ; copy erase_start in RAM 
      0081BD                        397 move_erase_to_ram:
      0081BD AE 81 BD         [ 2]  398 	ldw x,#row_erase_end 
      0081C0 1D 81 96         [ 2]  399 	subw x,#row_erase
      0081C3 CF 00 0D         [ 2]  400 	ldw acc16,x 
      0081C6 AE 16 90         [ 2]  401 	ldw x,#tib 
      0081C9 90 AE 81 96      [ 2]  402 	ldw y,#row_erase 
      0081CD CD 84 A4         [ 4]  403 	call move 
      0081D0 81               [ 4]  404 	ret 
                                    405 
                                    406 ;-----------------------------------
                                    407 ; block programming must be 
                                    408 ; executed from RAM 
                                    409 ; initial contidions: 
                                    410 ; 	memory unlocked
                                    411 ;   bit PRG set in 
                                    412 ; input:
                                    413 ;   x        128 bytes row to program 
                                    414 ;   farptr   row address 
                                    415 ; output:
                                    416 ;   none 
                                    417 ;----------------------------------
                           000001   418 	BCNT=1 
      0081D1                        419 program_row:
      0081D1 4B 80            [ 1]  420 	push #BLOCK_SIZE  
                                    421 ;enable block programming 
      0081D3 72 10 50 5B      [ 1]  422 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0081D7 72 11 50 5C      [ 1]  423 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0081DB 90 5F            [ 1]  424 	clrw y 
      0081DD F6               [ 1]  425 1$:	ld a,(x)
      0081DE 91 A7 00 17      [ 1]  426 	ldf ([farptr],y),a
      0081E2 5C               [ 1]  427 	incw x 
      0081E3 90 5C            [ 1]  428 	incw y 
      0081E5 0A 01            [ 1]  429 	dec (BCNT,sp)
      0081E7 26 F4            [ 1]  430 	jrne 1$
                                    431 ; wait EOP bit 
      0081E9 72 05 50 5F FB   [ 2]  432 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. 
      00016E                        433 	_drop 1 
      0081EE 5B 01            [ 2]    1     addw sp,#1 
      0081F0 81               [ 4]  434 	ret 
      0081F1                        435 program_row_end:
                                    436 
                                    437 ;-------------------------
                                    438 ; move program_row to RAM 
                                    439 ; at txtubound address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    440 ;------------------------
      0081F1                        441 move_prg_to_ram:
      0081F1 AE 81 F1         [ 2]  442 	ldw x,#program_row_end 
      0081F4 1D 81 D1         [ 2]  443 	subw x,#program_row 
      0081F7 CF 00 0D         [ 2]  444 	ldw acc16,x 
      0081FA AE 16 90         [ 2]  445 	ldw x,#tib 
      0081FD 90 AE 81 D1      [ 2]  446 	ldw y,#program_row 
      008201 CD 84 A4         [ 4]  447 	call move 
      008204 81               [ 4]  448 	ret 
                                    449 
                                    450 
                                    451 ;-----------------------------
                                    452 ; write a row in FLASH/EEPROM 
                                    453 ; input:
                                    454 ;    farptr   destination address 
                                    455 ;    x        source address 
                                    456 ;-----------------------------
      008205                        457 write_row:
      008205 89               [ 2]  458 	pushw x 
      008206 72 5D 00 17      [ 1]  459 	tnz farptr 
      00820A 26 1C            [ 1]  460 	jrne to_flash 
      00820C AE 80 00         [ 2]  461 	ldw x,#FLASH_BASE 
      00820F C3 00 18         [ 2]  462 	cpw x,farptr+1 
      008212 24 14            [ 1]  463 	jruge to_flash 
      008214                        464 to_eeprom:
      008214 AE 40 00         [ 2]  465 	ldw x,#EEPROM_BASE 
      008217 C3 00 18         [ 2]  466 	cpw x,farptr+1 
      00821A 24 01            [ 1]  467 	jruge 1$
      00821C 81               [ 4]  468 	ret ; bad address 
      00821D AE 47 FF         [ 2]  469 1$: ldw x,#EEPROM_END 
      008220 23 01            [ 2]  470 	jrule 2$ 
      008222 81               [ 4]  471 	ret ; bad address 
      008223 CD 81 6A         [ 4]  472 2$:	call unlock_eeprom
      008226 20 03            [ 2]  473 	jra do_programming
      008228                        474 to_flash:
      008228 CD 81 80         [ 4]  475 	call unlock_flash 
      00822B                        476 do_programming:
      00822B 85               [ 2]  477 	popw x 
      00822C CD 16 90         [ 4]  478 	call tib
      00822F 72 13 50 5F      [ 1]  479 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008233 72 17 50 5F      [ 1]  480 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008237 81               [ 4]  481 	ret 
                                    482 
                                    483 
                                    484 ;-----------------------------------
                                    485 ; erase flash or EEPROM block
                                    486 ; a blow is 128 bytes 
                                    487 ; input:
                                    488 ;   farptr  address row begin
                                    489 ; output:
                                    490 ;   none
                                    491 ;--------------------------------------
      008238                        492 block_erase:
      008238 CE 00 18         [ 2]  493 	ldw x,farptr+1
      00823B A3 AA 80         [ 2]  494 	cpw x,#user_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00823E 2A 17            [ 1]  495 	jrpl erase_flash 
                                    496 ; erase eeprom block
      008240 A3 40 00         [ 2]  497 	cpw x,#EEPROM_BASE 
      008243 24 01            [ 1]  498 	jruge 1$
      008245 81               [ 4]  499 	ret ; bad address 
      008246 AE 47 FF         [ 2]  500 1$: ldw x,#EEPROM_END 
      008249 23 01            [ 2]  501 	jrule 2$ 
      00824B 81               [ 4]  502 	ret ; bad address 
      00824C CD 81 6A         [ 4]  503 2$:	call unlock_eeprom 
      00824F CD 16 90         [ 4]  504 	call tib 
      008252 72 17 50 5F      [ 1]  505 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      008256 81               [ 4]  506 	ret 
                                    507 ; erase flash block:
      008257                        508 erase_flash:
      008257 CD 81 80         [ 4]  509 	call unlock_flash 
      00825A CD 16 90         [ 4]  510 	call tib 
      00825D 72 13 50 5F      [ 1]  511     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008261 81               [ 4]  512 	ret 
                                    513 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    516 ; write a byte to FLASH or EEPROM/OPTION  
                                    517 ; input:
                                    518 ;    a  		byte to write
                                    519 ;    farptr  	address
                                    520 ;    x          farptr[x]
                                    521 ; output:
                                    522 ;    none
                                    523 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    524 	; variables locales
                           000001   525 	BTW = 1   ; byte to write offset on stack
                           000002   526 	OPT = 2   ; OPTION flag offset on stack
                           000002   527 	VSIZE = 2
      008262                        528 write_byte:
      008262 90 89            [ 2]  529 	pushw y
      0001E4                        530 	_vars VSIZE
      008264 52 02            [ 2]    1     sub sp,#VSIZE 
      008266 6B 01            [ 1]  531 	ld (BTW,sp),a ; byte to write 
      008268 0F 02            [ 1]  532 	clr (OPT,sp)  ; OPTION flag
                                    533 ; put addr[15:0] in Y, for bounds check.
      00826A 90 CE 00 18      [ 2]  534 	ldw y,farptr+1   ; Y=addr15:0
                                    535 ; check addr[23:16], if <> 0 then it is extened flash memory
      00826E 72 5D 00 17      [ 1]  536 	tnz farptr 
      008272 26 14            [ 1]  537 	jrne write_flash
      008274 90 A3 AA 80      [ 2]  538     cpw y,#user_space
      008278 24 0E            [ 1]  539     jruge write_flash
      00827A 90 A3 40 00      [ 2]  540 	cpw y,#EEPROM_BASE  
      00827E 25 52            [ 1]  541     jrult write_exit
      008280 90 A3 48 7F      [ 2]  542 	cpw y,#OPTION_END 
      008284 22 4C            [ 1]  543 	jrugt write_exit
      008286 20 16            [ 2]  544 	jra write_eeprom 
                                    545 ; write program memory
      008288                        546 write_flash:
      008288 CD 81 80         [ 4]  547 	call unlock_flash 
      00828B 9B               [ 1]  548 1$:	sim 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00828C 7B 01            [ 1]  549 	ld a,(BTW,sp)
      00828E 92 A7 00 17      [ 4]  550 	ldf ([farptr],x),a ; farptr[x]=A
      008292 72 05 50 5F FB   [ 2]  551 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008297 9A               [ 1]  552     rim 
      008298 72 13 50 5F      [ 1]  553     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00829C 20 34            [ 2]  554     jra write_exit
                                    555 ; write eeprom and option
      00829E                        556 write_eeprom:
      00829E CD 81 6A         [ 4]  557 	call unlock_eeprom
                                    558 	; check for data eeprom or option eeprom
      0082A1 90 A3 48 00      [ 2]  559 	cpw y,#OPTION_BASE
      0082A5 2B 08            [ 1]  560 	jrmi 1$
      0082A7 90 A3 48 80      [ 2]  561 	cpw y,#OPTION_END+1
      0082AB 2A 02            [ 1]  562 	jrpl 1$
      0082AD 03 02            [ 1]  563 	cpl (OPT,sp)
      0082AF                        564 1$: 
      0082AF 0D 02            [ 1]  565     tnz (OPT,sp)
      0082B1 27 08            [ 1]  566     jreq 2$
                                    567 	; pour modifier une option il faut modifier ces 2 bits
      0082B3 72 1E 50 5B      [ 1]  568     bset FLASH_CR2,#FLASH_CR2_OPT
      0082B7 72 1F 50 5C      [ 1]  569     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0082BB                        570 2$: 
      0082BB 7B 01            [ 1]  571     ld a,(BTW,sp)
      0082BD 92 A7 00 17      [ 4]  572     ldf ([farptr],x),a
      0082C1 0D 02            [ 1]  573     tnz (OPT,sp)
      0082C3 27 08            [ 1]  574     jreq 3$
      0082C5 5C               [ 1]  575     incw x
      0082C6 7B 01            [ 1]  576     ld a,(BTW,sp)
      0082C8 43               [ 1]  577     cpl a
      0082C9 92 A7 00 17      [ 4]  578     ldf ([farptr],x),a
      0082CD 72 05 50 5F FB   [ 2]  579 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0082D2                        580 write_exit:
      000252                        581 	_drop VSIZE 
      0082D2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082D4 90 85            [ 2]  582 	popw y
      0082D6 81               [ 4]  583     ret
                                    584 
                                    585 ;--------------------------------------------
                                    586 ; write a data block to eeprom or flash 
                                    587 ; input:
                                    588 ;   Y        source address   
                                    589 ;   X        array index  destination  farptr[x]
                                    590 ;   BSIZE    block size bytes 
                                    591 ;   farptr   write address , byte* 
                                    592 ; output:
                                    593 ;	X 		after last byte written 
                                    594 ;   Y 		after last byte read 
                                    595 ;  farptr   point after block
                                    596 ;---------------------------------------------
      0082D7                        597 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000257                        598 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    599 	; local var 
                           000001   600 	XSAVE=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                           000002   601 	VSIZE=2 
      000257                        602 write_block:
      000257                        603 	_vars VSIZE
      0082D7 52 02            [ 2]    1     sub sp,#VSIZE 
      0082D9 1F 01            [ 2]  604 	ldw (XSAVE,sp),x 
      0082DB 1E 05            [ 2]  605 	ldw x,(BSIZE,sp) 
      0082DD 27 13            [ 1]  606 	jreq 9$
      0082DF 1E 01            [ 2]  607 1$:	ldw x,(XSAVE,sp)
      0082E1 90 F6            [ 1]  608 	ld a,(y)
      0082E3 CD 82 62         [ 4]  609 	call write_byte 
      0082E6 5C               [ 1]  610 	incw x 
      0082E7 90 5C            [ 1]  611 	incw y 
      0082E9 1F 01            [ 2]  612 	ldw (XSAVE,sp),x
      0082EB 1E 05            [ 2]  613 	ldw x,(BSIZE,sp)
      0082ED 5A               [ 2]  614 	decw x
      0082EE 1F 05            [ 2]  615 	ldw (BSIZE,sp),x 
      0082F0 26 ED            [ 1]  616 	jrne 1$
      0082F2                        617 9$:
      0082F2 1E 01            [ 2]  618 	ldw x,(XSAVE,sp)
      0082F4 CD 9B 10         [ 4]  619 	call incr_farptr
      000277                        620 	_drop VSIZE
      0082F7 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082F9 81               [ 4]  621 	ret 
                                    622 
                                    623 
                                    624 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    625 ;;   UART1 subroutines
                                    626 ;;   used for user interface 
                                    627 ;;   communication channel.
                                    628 ;;   settings: 
                                    629 ;;		115200 8N1 no flow control
                                    630 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    631 
                                    632 ;--------------------------------
                                    633 ; initialize UART3, 115200 8N1 
                                    634 ;--------------------------------
      0082FA                        635 uart3_init: 
      0082FA 72 1A 50 11      [ 1]  636 	bset PD_DDR,#UART3_TX_PIN
      0082FE 72 1A 50 12      [ 1]  637 	bset PD_CR1,#UART3_TX_PIN 
      008302 72 1A 50 13      [ 1]  638 	bset PD_CR2,#UART3_TX_PIN 
      008306 72 16 50 C7      [ 1]  639 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3
      00830A                        640 uart3_set_baud: 
                                    641 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    642 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00830A A6 E1            [ 1]  643 	ld a,#CLK_SWR_HSI
      00830C C1 50 C3         [ 1]  644 	cp a,CLK_CMSR 
      00830F 27 0A            [ 1]  645 	jreq 2$ 
      008311                        646 1$: ; 8 Mhz 	
      008311 35 05 52 43      [ 1]  647 	mov UART3_BRR2,#0x05 ; must be loaded first
      008315 35 04 52 42      [ 1]  648 	mov UART3_BRR1,#0x4
      008319 20 08            [ 2]  649 	jra 3$
      00831B                        650 2$: ; 16 Mhz 	
      00831B 35 0B 52 43      [ 1]  651 	mov UART3_BRR2,#0x0b ; must be loaded first
      00831F 35 08 52 42      [ 1]  652 	mov UART3_BRR1,#0x08
      008323                        653 3$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008323 72 5F 52 41      [ 1]  654     clr UART3_DR
      008327 35 2C 52 45      [ 1]  655 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      00832B 72 10 52 45      [ 1]  656 	bset UART3_CR2,#UART_CR2_SBK
      00832F 72 0D 52 40 FB   [ 2]  657     btjf UART3_SR,#UART_SR_TC,.
      008334 81               [ 4]  658 	ret 
                                    659 
                                    660 ;---------------------------------------------
                                    661 ; initialize UART1, 115200 8N1
                                    662 ; input:
                                    663 ;	none
                                    664 ; output:
                                    665 ;   none
                                    666 ;---------------------------------------------
      008335                        667 uart1_init:
      008335 72 1A 50 02      [ 1]  668     bset PA_DDR,#UART1_TX_PIN
      008339 72 1A 50 03      [ 1]  669     bset PA_CR1,#UART1_TX_PIN 
      00833D 72 1A 50 04      [ 1]  670     bset PA_CR2,#UART1_TX_PIN 
                                    671 ; enable UART1 clock
      008341 72 14 50 C7      [ 1]  672 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008345                        673 uart1_set_baud: 
                                    674 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    675 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008345 A6 E1            [ 1]  676 	ld a,#CLK_SWR_HSI
      008347 C1 50 C3         [ 1]  677 	cp a,CLK_CMSR 
      00834A 27 0A            [ 1]  678 	jreq 2$ 
      00834C                        679 1$: ; 8 Mhz 	
      00834C 35 05 52 33      [ 1]  680 	mov UART1_BRR2,#0x05 ; must be loaded first
      008350 35 04 52 32      [ 1]  681 	mov UART1_BRR1,#0x4
      008354 20 08            [ 2]  682 	jra 3$
      008356                        683 2$: ; 16 Mhz 	
      008356 35 0B 52 33      [ 1]  684 	mov UART1_BRR2,#0x0b ; must be loaded first
      00835A 35 08 52 32      [ 1]  685 	mov UART1_BRR1,#0x08
      00835E                        686 3$:
      00835E 72 5F 52 31      [ 1]  687     clr UART1_DR
      008362 35 2C 52 35      [ 1]  688 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008366 72 10 52 35      [ 1]  689 	bset UART1_CR2,#UART_CR2_SBK
      00836A 72 0D 52 30 FB   [ 2]  690     btjf UART1_SR,#UART_SR_TC,.
      00836F 72 5F 00 2E      [ 1]  691     clr rx_head 
      008373 72 5F 00 2F      [ 1]  692 	clr rx_tail 
      008377 81               [ 4]  693 	ret
                                    694 
                                    695 ;---------------------------------
                                    696 ; send character to UART1 
                                    697 ; input:
                                    698 ;   A 
                                    699 ; output:
                                    700 ;   none 
                                    701 ;--------------------------------	
      008378                        702 putc::
      008378 88               [ 1]  703 	push a 
      008379 A6 00            [ 1]  704 	ld a,#UART1 
      00837B C1 00 30         [ 1]  705 	cp a,comm 
      00837E 26 0A            [ 1]  706 	jrne putc3
      008380                        707 putc1: 
      008380 84               [ 1]  708 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008381 72 0F 52 30 FB   [ 2]  709 	btjf UART1_SR,#UART_SR_TXE,.
      008386 C7 52 31         [ 1]  710 	ld UART1_DR,a 
      008389 81               [ 4]  711 	ret 
      00838A                        712 putc3:
      00838A 84               [ 1]  713 	pop a 
      00838B 72 0F 52 40 FB   [ 2]  714 	btjf UART3_SR,#UART_SR_TXE,.
      008390 C7 52 41         [ 1]  715 	ld UART3_DR,a 
      008393 81               [ 4]  716 	ret 
                                    717 
                                    718 ;---------------------------------
                                    719 ; Query for character in rx_queue
                                    720 ; input:
                                    721 ;   none 
                                    722 ; output:
                                    723 ;   A     0 no charcter available
                                    724 ;   Z     1 no character available
                                    725 ;---------------------------------
      008394                        726 qgetc::
      008394 C6 00 2E         [ 1]  727 	ld a,rx_head 
      008397 C0 00 2F         [ 1]  728 	sub a,rx_tail 
      00839A 81               [ 4]  729 	ret 
                                    730 
                                    731 ;---------------------------------
                                    732 ; wait character from UART1 
                                    733 ; input:
                                    734 ;   none
                                    735 ; output:
                                    736 ;   A 			char  
                                    737 ;--------------------------------	
      00839B                        738 getc::
      00839B CD 83 94         [ 4]  739 	call qgetc
      00839E 27 FB            [ 1]  740 	jreq getc 
      0083A0 89               [ 2]  741 	pushw x 
      0083A1 AE 00 26         [ 2]  742 	ldw x,#rx_queue
      0083A4 9F               [ 1]  743 	ld a,xl 
      0083A5 CB 00 2E         [ 1]  744 	add a,rx_head 
      0083A8 97               [ 1]  745 	ld xl,a 
      0083A9 F6               [ 1]  746 	ld a,(x)
      0083AA 85               [ 2]  747 	popw x
      0083AB 88               [ 1]  748 	push a
      0083AC 72 5C 00 2E      [ 1]  749 	inc rx_head 
      0083B0 A6 07            [ 1]  750 	ld a,#RX_QUEUE_SIZE-1 
      0083B2 C4 00 2E         [ 1]  751 	and a,rx_head 
      0083B5 C7 00 2E         [ 1]  752 	ld rx_head,a 
      0083B8 84               [ 1]  753 	pop a  
      0083B9 81               [ 4]  754 	ret 
                                    755 
                                    756 ;-----------------------------
                                    757 ; drop all characters 
                                    758 ; received in the 
                                    759 ; next Y msec 
                                    760 ; input:
                                    761 ;   Y    drain time msec 
                                    762 ; output:
                                    763 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    764 ;----------------------------
      0083BA                        765 drain::
      0083BA 90 CF 00 11      [ 2]  766 	ldw timer,y 
      0083BE 90 CE 00 11      [ 2]  767 1$: ldw y,timer 
      0083C2 26 01            [ 1]  768 	jrne 2$
      0083C4 81               [ 4]  769 	ret
      0083C5 CD 83 94         [ 4]  770 2$:	call qgetc 
      0083C8 27 F4            [ 1]  771 	jreq 1$ 
      0083CA CD 83 9B         [ 4]  772 	call getc 
      0083CD 20 EF            [ 2]  773 	jra 1$
                                    774 
                                    775 
                                    776 ;----------------------
                                    777 ; print token id && value
                                    778 ; input:
                                    779 ;   A     token id 
                                    780 ;   X     token value 
                                    781 ;---------------------
                           000001   782 	BSAVE=1
                           000002   783 	AREG=2
                           000003   784 	XREG=3
                           000004   785 	VSIZE=4
      0083CF                        786 prt_tok:
      00034F                        787 	_vars VSIZE 
      0083CF 52 04            [ 2]    1     sub sp,#VSIZE 
      0083D1 6B 02            [ 1]  788 	ld (AREG,sp),a 
      0083D3 1F 03            [ 2]  789 	ldw (XREG,sp),x 
      0083D5 C6 00 0B         [ 1]  790 	ld a, base
      0083D8 6B 01            [ 1]  791 	ld (BSAVE,sp),a 
      0083DA 35 10 00 0B      [ 1]  792 	mov base,#16  
      0083DE AE 84 06         [ 2]  793 	ldw x,#token_msg
      0083E1 CD AA C0         [ 4]  794 	call puts 
      0083E4 5F               [ 1]  795 	clrw x 
      0083E5 7B 02            [ 1]  796 	ld a,(AREG,sp)
      0083E7 97               [ 1]  797 	ld xl,a 
      0083E8 CD 8A B9         [ 4]  798 	call print_int 
      0083EB A6 20            [ 1]  799 	ld a,#SPACE
      0083ED CD 83 78         [ 4]  800 	call putc 
      0083F0 1E 03            [ 2]  801 	ldw x,(XREG,sp)
      0083F2 CD 8A B9         [ 4]  802 	call print_int 
      0083F5 A6 0D            [ 1]  803 	ld a,#CR 
      0083F7 CD 83 78         [ 4]  804 	call putc 
      0083FA 7B 01            [ 1]  805 	ld a,(BSAVE,sp)
      0083FC C7 00 0B         [ 1]  806 	ld base,a 
      0083FF 7B 02            [ 1]  807 	ld a,(AREG,sp)
      008401 1E 03            [ 2]  808 	ldw x,(XREG,sp)
      000383                        809 	_drop VSIZE 
      008403 5B 04            [ 2]    1     addw sp,#VSIZE 
      008405 81               [ 4]  810 	ret 
      008406 74 6F 6B 65 6E 3A 20   811 token_msg: .asciz "token: "
             00
                                    812 
                                    813 
                                    814 ;---------------------
                                    815 ; display n bytes row 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    816 ; from memory.
                                    817 ; input:
                                    818 ;   A   bytes to print 
                                    819 ;	X   start address 
                                    820 ; output:
                                    821 ;   X   address after last shown  
                                    822 ;---------------------
                           000001   823 	CNT=1 
                           000002   824 	ADR=2 
                           000003   825 	VSIZE=3 
      00840E                        826 show_row:
      00840E 4D               [ 1]  827 	tnz a 
      00840F 26 01            [ 1]  828 	jrne 1$
      008411 81               [ 4]  829 	ret 
      008412                        830 1$:	
      008412 89               [ 2]  831 	pushw x  
      008413 88               [ 1]  832 	push a 
      008414 35 04 00 25      [ 1]  833 	mov tab_width,#4 
      008418 CD 8A B9         [ 4]  834 	call print_int 
      00841B A6 20            [ 1]  835 	ld a,#SPACE  
      00841D CD 83 78         [ 4]  836 	call putc
      008420                        837 row_loop:
      008420 1E 02            [ 2]  838 	ldw x,(ADR,sp)
      008422 F6               [ 1]  839 	ld a,(x)
      008423 5F               [ 1]  840 	clrw x 
      008424 97               [ 1]  841 	ld xl,a 
      008425 CD 8A B9         [ 4]  842 	call print_int 
      008428 1E 02            [ 2]  843 	ldw x,(ADR,sp)
      00842A 5C               [ 1]  844 	incw x 
      00842B 1F 02            [ 2]  845 	ldw (ADR,sp),x 
      00842D 0A 01            [ 1]  846 	dec (CNT,sp)
      00842F 26 EF            [ 1]  847 	jrne row_loop
      0003B1                        848 	_drop VSIZE  		
      008431 5B 03            [ 2]    1     addw sp,#VSIZE 
      008433 35 04 00 25      [ 1]  849 	mov tab_width,#4
      008437 A6 0D            [ 1]  850 	ld a,#CR 
      008439 CD 83 78         [ 4]  851 	call putc 
      00843C 81               [ 4]  852 	ret 
                                    853 
                                    854 ;--------------------------
                                    855 ; print memory content 
                                    856 ; in hexadecimal format
                                    857 ;  input:
                                    858 ;    X    start address 
                                    859 ;    Y    count 
                                    860 ;--------------------------
                           000001   861 	BCNT=1
                           000003   862 	BASE=3
                           000004   863 	TABW=4
                           000004   864 	VSIZE=4   
      00843D                        865 hex_dump:
      0003BD                        866 	_vars VSIZE
      00843D 52 04            [ 2]    1     sub sp,#VSIZE 
      00843F C6 00 0B         [ 1]  867 	ld a,base
      008442 6B 03            [ 1]  868 	ld (BASE,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008444 35 10 00 0B      [ 1]  869 	mov base,#16
      008448 C6 00 25         [ 1]  870 	ld a,tab_width 
      00844B 6B 04            [ 1]  871 	ld (TABW,sp),a
      00844D A6 0D            [ 1]  872 	ld a,#CR 
      00844F CD 83 78         [ 4]  873 	call putc 
      008452 17 01            [ 2]  874 1$: ldw (BCNT,sp),y
      008454 A6 10            [ 1]  875 	ld a,#16
      008456 90 A3 00 10      [ 2]  876 	cpw y,#16
      00845A 2A 02            [ 1]  877 	jrpl 2$
      00845C 90 9F            [ 1]  878 	ld a,yl
      00845E                        879 2$: 	
      00845E CD 84 0E         [ 4]  880 	call show_row 
      008461 16 01            [ 2]  881 	ldw y,(BCNT,sp) 
      008463 72 A2 00 10      [ 2]  882 	subw y,#16 
      008467 90 A3 00 01      [ 2]  883 	cpw y,#1
      00846B 2A E5            [ 1]  884 	jrpl 1$
      00846D 7B 03            [ 1]  885 	ld a,(BASE,sp)
      00846F C7 00 0B         [ 1]  886 	ld base,a
      008472 7B 04            [ 1]  887 	ld a,(TABW,sp)
      008474 C7 00 25         [ 1]  888 	ld tab_width,a 
      0003F7                        889 	_drop VSIZE
      008477 5B 04            [ 2]    1     addw sp,#VSIZE 
      008479 81               [ 4]  890 	ret 
                                    891 
                                    892 ;-------------------------------------
                                    893 ; retrun string length
                                    894 ; input:
                                    895 ;   X         .asciz  pointer 
                                    896 ; output:
                                    897 ;   X         not affected 
                                    898 ;   A         length 
                                    899 ;-------------------------------------
      00847A                        900 strlen::
      00847A 89               [ 2]  901 	pushw x 
      00847B 4F               [ 1]  902 	clr a
      00847C 7D               [ 1]  903 1$:	tnz (x) 
      00847D 27 04            [ 1]  904 	jreq 9$ 
      00847F 4C               [ 1]  905 	inc a 
      008480 5C               [ 1]  906 	incw x 
      008481 20 F9            [ 2]  907 	jra 1$ 
      008483 85               [ 2]  908 9$:	popw x 
      008484 81               [ 4]  909 	ret 
                                    910 
                                    911 ;------------------------------------
                                    912 ; compare 2 strings
                                    913 ; input:
                                    914 ;   X 		char* first string 
                                    915 ;   Y       char* second string 
                                    916 ; output:
                                    917 ;   A 		0|1 
                                    918 ;-------------------------------------
      008485                        919 strcmp:
      008485 F6               [ 1]  920 	ld a,(x)
      008486 27 0B            [ 1]  921 	jreq 5$ 
      008488 90 F1            [ 1]  922 	cp a,(y) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00848A 26 05            [ 1]  923 	jrne 4$ 
      00848C 5C               [ 1]  924 	incw x 
      00848D 90 5C            [ 1]  925 	incw y 
      00848F 20 F4            [ 2]  926 	jra strcmp 
      008491                        927 4$: ; not same  
      008491 4F               [ 1]  928 	clr a 
      008492 81               [ 4]  929 	ret 
      008493                        930 5$: ; same 
      008493 A6 01            [ 1]  931 	ld a,#1 
      008495 81               [ 4]  932 	ret 
                                    933 
                                    934 
                                    935 ;---------------------------------------
                                    936 ;  copy src to dest 
                                    937 ; input:
                                    938 ;   X 		dest 
                                    939 ;   Y 		src 
                                    940 ; output: 
                                    941 ;   X 		dest 
                                    942 ;----------------------------------
      008496                        943 strcpy:
      008496 89               [ 2]  944 	pushw x 
      008497 90 F6            [ 1]  945 1$: ld a,(y)
      008499 27 06            [ 1]  946 	jreq 9$ 
      00849B F7               [ 1]  947 	ld (x),a 
      00849C 5C               [ 1]  948 	incw x 
      00849D 90 5C            [ 1]  949 	incw y 
      00849F 20 F6            [ 2]  950 	jra 1$ 
      0084A1 7F               [ 1]  951 9$:	clr (x)
      0084A2 85               [ 2]  952 	popw x 
      0084A3 81               [ 4]  953 	ret 
                                    954 
                                    955 ;---------------------------------------
                                    956 ; move memory block 
                                    957 ; input:
                                    958 ;   X 		destination 
                                    959 ;   Y 	    source 
                                    960 ;   acc16	bytes count 
                                    961 ; output:
                                    962 ;   none 
                                    963 ;--------------------------------------
                           000001   964 	INCR=1 ; increament high byte 
                           000002   965 	LB=2 ; increament low byte 
                           000002   966 	VSIZE=2
      0084A4                        967 move::
      000424                        968 	_vars VSIZE 
      0084A4 52 02            [ 2]    1     sub sp,#VSIZE 
      0084A6 0F 01            [ 1]  969 	clr (INCR,sp)
      0084A8 0F 02            [ 1]  970 	clr (LB,sp)
      0084AA 90 89            [ 2]  971 	pushw y 
      0084AC 13 01            [ 2]  972 	cpw x,(1,sp) ; compare DEST to SRC 
      0084AE 90 85            [ 2]  973 	popw y 
      0084B0 27 31            [ 1]  974 	jreq move_exit ; x==y 
      0084B2 2B 0E            [ 1]  975 	jrmi move_down
      0084B4                        976 move_up: ; start from top address with incr=-1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084B4 72 BB 00 0D      [ 2]  977 	addw x,acc16
      0084B8 72 B9 00 0D      [ 2]  978 	addw y,acc16
      0084BC 03 01            [ 1]  979 	cpl (INCR,sp)
      0084BE 03 02            [ 1]  980 	cpl (LB,sp)   ; increment = -1 
      0084C0 20 05            [ 2]  981 	jra move_loop  
      0084C2                        982 move_down: ; start from bottom address with incr=1 
      0084C2 5A               [ 2]  983     decw x 
      0084C3 90 5A            [ 2]  984 	decw y
      0084C5 0C 02            [ 1]  985 	inc (LB,sp) ; incr=1 
      0084C7                        986 move_loop:	
      0084C7 C6 00 0D         [ 1]  987     ld a, acc16 
      0084CA CA 00 0E         [ 1]  988 	or a, acc8
      0084CD 27 14            [ 1]  989 	jreq move_exit 
      0084CF 72 FB 01         [ 2]  990 	addw x,(INCR,sp)
      0084D2 72 F9 01         [ 2]  991 	addw y,(INCR,sp) 
      0084D5 90 F6            [ 1]  992 	ld a,(y)
      0084D7 F7               [ 1]  993 	ld (x),a 
      0084D8 89               [ 2]  994 	pushw x 
      0084D9 CE 00 0D         [ 2]  995 	ldw x,acc16 
      0084DC 5A               [ 2]  996 	decw x 
      0084DD CF 00 0D         [ 2]  997 	ldw acc16,x 
      0084E0 85               [ 2]  998 	popw x 
      0084E1 20 E4            [ 2]  999 	jra move_loop
      0084E3                       1000 move_exit:
      000463                       1001 	_drop VSIZE
      0084E3 5B 02            [ 2]    1     addw sp,#VSIZE 
      0084E5 81               [ 4] 1002 	ret 	
                                   1003 
                                   1004 ;-------------------------------------
                                   1005 ; search text area for a line#
                                   1006 ; input:
                                   1007 ;	X 			line# 
                                   1008 ; output:
                                   1009 ;   X 			addr of line | 0 
                                   1010 ;   Y           line#|insert address if not found  
                                   1011 ;-------------------------------------
                           000001  1012 	LL=1 ; line length 
                           000002  1013 	LB=2 ; line length low byte 
                           000002  1014 	VSIZE=2 
      0084E6                       1015 search_lineno::
      000466                       1016 	_vars VSIZE
      0084E6 52 02            [ 2]    1     sub sp,#VSIZE 
      0084E8 0F 01            [ 1] 1017 	clr (LL,sp)
      0084EA 90 CE 00 1D      [ 2] 1018 	ldw y,txtbgn
      0084EE                       1019 search_ln_loop:
      0084EE 90 C3 00 1F      [ 2] 1020 	cpw y,txtend 
      0084F2 2A 10            [ 1] 1021 	jrpl 8$
      0084F4 90 F3            [ 1] 1022 	cpw x,(y)
      0084F6 27 0E            [ 1] 1023 	jreq 9$
      0084F8 2B 0A            [ 1] 1024 	jrmi 8$ 
      0084FA 90 E6 02         [ 1] 1025 	ld a,(2,y)
      0084FD 6B 02            [ 1] 1026 	ld (LB,sp),a 
      0084FF 72 F9 01         [ 2] 1027 	addw y,(LL,sp)
      008502 20 EA            [ 2] 1028 	jra search_ln_loop 
      008504                       1029 8$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008504 5F               [ 1] 1030 	clrw x 	
      008505 51               [ 1] 1031 	exgw x,y 
      000486                       1032 9$: _drop VSIZE
      008506 5B 02            [ 2]    1     addw sp,#VSIZE 
      008508 51               [ 1] 1033 	exgw x,y   
      008509 81               [ 4] 1034 	ret 
                                   1035 
                                   1036 ;-------------------------------------
                                   1037 ; delete line at addr
                                   1038 ; input:
                                   1039 ;   X 		addr of line i.e DEST for move 
                                   1040 ;-------------------------------------
                           000001  1041 	LLEN=1
                           000003  1042 	SRC=3
                           000004  1043 	VSIZE=4
      00850A                       1044 del_line: 
      00048A                       1045 	_vars VSIZE 
      00850A 52 04            [ 2]    1     sub sp,#VSIZE 
      00850C E6 02            [ 1] 1046 	ld a,(2,x) ; line length
      00850E 6B 02            [ 1] 1047 	ld (LLEN+1,sp),a 
      008510 0F 01            [ 1] 1048 	clr (LLEN,sp)
      008512 90 93            [ 1] 1049 	ldw y,x  
      008514 72 F9 01         [ 2] 1050 	addw y,(LLEN,sp) ;SRC  
      008517 17 03            [ 2] 1051 	ldw (SRC,sp),y  ;save source 
      008519 90 CE 00 1F      [ 2] 1052 	ldw y,txtend 
      00851D 72 F2 03         [ 2] 1053 	subw y,(SRC,sp) ; y=count 
      008520 90 CF 00 0D      [ 2] 1054 	ldw acc16,y 
      008524 16 03            [ 2] 1055 	ldw y,(SRC,sp)    ; source
      008526 CD 84 A4         [ 4] 1056 	call move
      008529 90 CE 00 1F      [ 2] 1057 	ldw y,txtend 
      00852D 72 F2 01         [ 2] 1058 	subw y,(LLEN,sp)
      008530 90 CF 00 1F      [ 2] 1059 	ldw txtend,y  
      0004B4                       1060 	_drop VSIZE     
      008534 5B 04            [ 2]    1     addw sp,#VSIZE 
      008536 81               [ 4] 1061 	ret 
                                   1062 
                                   1063 ;---------------------------------------------
                                   1064 ; create a gap in text area to 
                                   1065 ; move new line in this gap
                                   1066 ; input:
                                   1067 ;    X 			addr gap start 
                                   1068 ;    Y 			gap length 
                                   1069 ; output:
                                   1070 ;    X 			addr gap start 
                                   1071 ;--------------------------------------------
                           000001  1072 	DEST=1
                           000003  1073 	SRC=3
                           000005  1074 	LEN=5
                           000006  1075 	VSIZE=6 
      008537                       1076 create_gap:
      0004B7                       1077 	_vars VSIZE
      008537 52 06            [ 2]    1     sub sp,#VSIZE 
      008539 1F 03            [ 2] 1078 	ldw (SRC,sp),x 
      00853B 17 05            [ 2] 1079 	ldw (LEN,sp),y 
      00853D 90 CF 00 0D      [ 2] 1080 	ldw acc16,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008541 90 93            [ 1] 1081 	ldw y,x ; SRC
      008543 72 BB 00 0D      [ 2] 1082 	addw x,acc16  
      008547 1F 01            [ 2] 1083 	ldw (DEST,sp),x 
                                   1084 ;compute size to move 	
      008549 CE 00 1F         [ 2] 1085 	ldw x,txtend 
      00854C 72 F0 03         [ 2] 1086 	subw x,(SRC,sp)
      00854F CF 00 0D         [ 2] 1087 	ldw acc16,x ; size to move
      008552 1E 01            [ 2] 1088 	ldw x,(DEST,sp) 
      008554 CD 84 A4         [ 4] 1089 	call move
      008557 CE 00 1F         [ 2] 1090 	ldw x,txtend
      00855A 72 FB 05         [ 2] 1091 	addw x,(LEN,sp)
      00855D CF 00 1F         [ 2] 1092 	ldw txtend,x
      0004E0                       1093 9$:	_drop VSIZE 
      008560 5B 06            [ 2]    1     addw sp,#VSIZE 
      008562 81               [ 4] 1094 	ret 
                                   1095 
                                   1096 ;--------------------------------------------
                                   1097 ; insert line in pad into text area 
                                   1098 ; first search for already existing 
                                   1099 ; replace existing 
                                   1100 ; if new line empty delete existing one. 
                                   1101 ; input:
                                   1102 ;   ptr16		pointer to tokenized line  
                                   1103 ; output:
                                   1104 ;   none
                                   1105 ;---------------------------------------------
                           000001  1106 	DEST=1  ; text area insertion address 
                           000003  1107 	SRC=3   ; str to insert address 
                           000005  1108 	LINENO=5 ; line number 
                           000007  1109 	LLEN=7 ; line length 
                           000008  1110 	VSIZE=8  
      008563                       1111 insert_line:
      0004E3                       1112 	_vars VSIZE 
      008563 52 08            [ 2]    1     sub sp,#VSIZE 
      008565 CE 00 1F         [ 2] 1113 	ldw x,txtend  
      008568 C3 00 1D         [ 2] 1114 	cpw x,txtbgn 
      00856B 26 19            [ 1] 1115 	jrne 0$
                                   1116 ;first text line 
      00856D AE 00 02         [ 2] 1117 	ldw x,#2 
      008570 72 D6 00 18      [ 4] 1118 	ld a,([ptr16],x)
      008574 A1 03            [ 1] 1119 	cp a,#3
      008576 27 59            [ 1] 1120 	jreq insert_ln_exit
      008578 5F               [ 1] 1121 	clrw x 
      008579 97               [ 1] 1122 	ld xl,a
      00857A 1F 07            [ 2] 1123 	ldw (LLEN,sp),x 
      00857C CE 00 1D         [ 2] 1124 	ldw x,txtbgn
      00857F 1F 01            [ 2] 1125 	ldw (DEST,sp),x 
      008581 CE 00 1F         [ 2] 1126 	ldw x,txtend 
      008584 20 37            [ 2] 1127 	jra 4$
      008586 72 CE 00 18      [ 5] 1128 0$:	ldw x,[ptr16]
                                   1129 ; line number
      00858A 1F 05            [ 2] 1130 	ldw (LINENO,sp),x 
      00858C AE 00 02         [ 2] 1131 	ldw x,#2 
      00858F 72 D6 00 18      [ 4] 1132 	ld a,([ptr16],x)
      008593 97               [ 1] 1133 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1134 ; line length
      008594 1F 07            [ 2] 1135 	ldw (LLEN,sp),x
                                   1136 ; check if that line number already exit 	
      008596 1E 05            [ 2] 1137 	ldw x,(LINENO,sp)
      008598 CD 84 E6         [ 4] 1138 	call search_lineno 
      00859B 5D               [ 2] 1139 	tnzw x 
      00859C 26 04            [ 1] 1140 	jrne 2$
                                   1141 ; line doesn't exit
                                   1142 ; it will be inserted at this point.  	
      00859E 17 01            [ 2] 1143 	ldw (DEST,sp),y 
      0085A0 20 05            [ 2] 1144 	jra 3$
                                   1145 ; line exit delete it.
                                   1146 ; it will be replaced by new one 	
      0085A2 1F 01            [ 2] 1147 2$: ldw (DEST,sp),x 
      0085A4 CD 85 0A         [ 4] 1148 	call del_line
      0085A7                       1149 3$: 
                                   1150 ; insert new line or leave if LLEN==3
                                   1151 ; LLEN==3 means empty line 
      0085A7 A6 03            [ 1] 1152 	ld a,#3
      0085A9 11 08            [ 1] 1153 	cp a,(LLEN+1,sp)
      0085AB 27 24            [ 1] 1154 	jreq insert_ln_exit ; empty line exit.
                                   1155 ; if insertion point at txtend 
                                   1156 ; move no need to create a gap 
      0085AD 1E 01            [ 2] 1157 	ldw x,(DEST,sp)
      0085AF C3 00 1F         [ 2] 1158 	cpw x,txtend 
      0085B2 27 09            [ 1] 1159 	jreq 4$ 
                                   1160 ; must create a gap
                                   1161 ; at insertion point  
      0085B4 1E 01            [ 2] 1162 	ldw x,(DEST,sp)
      0085B6 16 07            [ 2] 1163 	ldw y,(LLEN,sp)
      0085B8 CD 85 37         [ 4] 1164 	call create_gap
      0085BB 20 06            [ 2] 1165 	jra 5$
      0085BD                       1166 4$: 
      0085BD 72 FB 07         [ 2] 1167 	addw x,(LLEN,sp)
      0085C0 CF 00 1F         [ 2] 1168 	ldw txtend,x 	 
                                   1169 ; move new line in gap 
      0085C3 1E 07            [ 2] 1170 5$:	ldw x,(LLEN,sp)
      0085C5 CF 00 0D         [ 2] 1171 	ldw acc16,x 
      0085C8 90 AE 16 E0      [ 2] 1172 	ldw y,#pad ;SRC 
      0085CC 1E 01            [ 2] 1173 	ldw x,(DEST,sp) ; dest address 
      0085CE CD 84 A4         [ 4] 1174 	call move 
      0085D1                       1175 insert_ln_exit:	
      000551                       1176 	_drop VSIZE
      0085D1 5B 08            [ 2]    1     addw sp,#VSIZE 
      0085D3 81               [ 4] 1177 	ret
                                   1178 
                                   1179 ;-----------------------------------
                                   1180 ; create token list fromm text line 
                                   1181 ; save this list in pad buffer 
                                   1182 ;  compiled line format: 
                                   1183 ;    line_no  2 bytes {0...32767}
                                   1184 ;    count    1 byte  
                                   1185 ;    tokens   variable length 
                                   1186 ;   
                                   1187 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1188 ;   none
                                   1189 ; modified variables:
                                   1190 ;   basicptr     token list buffer address 
                                   1191 ;   in.w  		 3|count, i.e. index in buffer
                                   1192 ;   count        length of line | 0  
                                   1193 ;-----------------------------------
                           000001  1194 	XSAVE=1
                           000002  1195 	VSIZE=2
      0085D4                       1196 compile:
      000554                       1197 	_vars VSIZE 
      0085D4 52 02            [ 2]    1     sub sp,#VSIZE 
      0085D6 72 1A 00 24      [ 1] 1198 	bset flags,#FCOMP 
      0085DA A6 00            [ 1] 1199 	ld a,#0
      0085DC AE 00 00         [ 2] 1200 	ldw x,#0
      0085DF CF 16 E0         [ 2] 1201 	ldw pad,x ; destination buffer 
      0085E2 C7 16 E2         [ 1] 1202 	ld pad+2,a ; count 
      0085E5 AE 16 E3         [ 2] 1203 	ldw x,#pad+3
      0085E8 72 5F 00 02      [ 1] 1204 	clr in 
      0085EC CD 8C E8         [ 4] 1205 	call get_token
      0085EF A1 84            [ 1] 1206 	cp a,#TK_INTGR
      0085F1 26 11            [ 1] 1207 	jrne 2$
      0085F3 A3 00 01         [ 2] 1208 	cpw x,#1 
      0085F6 2A 05            [ 1] 1209 	jrpl 1$
      0085F8 A6 0A            [ 1] 1210 	ld a,#ERR_BAD_VALUE
      0085FA CC 89 68         [ 2] 1211 	jp tb_error
      0085FD CF 16 E0         [ 2] 1212 1$:	ldw pad,x 
      008600 90 AE 16 E3      [ 2] 1213 	ldw y,#pad+3 
      008604 90 A3 17 60      [ 2] 1214 2$:	cpw y,#stack_full 
      008608 25 05            [ 1] 1215 	jrult 3$
      00860A A6 0F            [ 1] 1216 	ld a,#ERR_BUF_FULL 
      00860C CC 89 68         [ 2] 1217 	jp tb_error 
      00860F                       1218 3$:	
      00860F 93               [ 1] 1219 	ldw x,y 
      008610 CD 8C E8         [ 4] 1220 	call get_token 
      008613 A1 00            [ 1] 1221 	cp a,#TK_NONE 
      008615 26 ED            [ 1] 1222 	jrne 2$ 
                                   1223 ; compilation completed  
      008617 72 A2 16 E0      [ 2] 1224 	subw y,#pad
      00861B 90 9F            [ 1] 1225     ld a,yl
      00861D AE 16 E0         [ 2] 1226 	ldw x,#pad 
      008620 CF 00 18         [ 2] 1227 	ldw ptr16,x 
      008623 E7 02            [ 1] 1228 	ld (2,x),a 
      008625 FE               [ 2] 1229 	ldw x,(x)
      008626 27 09            [ 1] 1230 	jreq 10$
      008628 CD 85 63         [ 4] 1231 	call insert_line
      00862B 72 5F 00 04      [ 1] 1232 	clr  count 
      00862F 20 0F            [ 2] 1233 	jra  11$ 
      008631                       1234 10$: ; line# is zero 
      008631 CE 00 18         [ 2] 1235 	ldw x,ptr16  
      008634 CF 00 05         [ 2] 1236 	ldw basicptr,x 
      008637 E6 02            [ 1] 1237 	ld a,(2,x)
      008639 C7 00 04         [ 1] 1238 	ld count,a 
      00863C 35 03 00 02      [ 1] 1239 	mov in,#3 
      008640                       1240 11$:
      0005C0                       1241 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008640 5B 02            [ 2]    1     addw sp,#VSIZE 
      008642 72 1B 00 24      [ 1] 1242 	bres flags,#FCOMP 
      008646 81               [ 4] 1243 	ret 
                                   1244 
                                   1245 ;------------------------------------
                                   1246 ;  set all variables to zero 
                                   1247 ; input:
                                   1248 ;   none 
                                   1249 ; output:
                                   1250 ;	none
                                   1251 ;------------------------------------
      008647                       1252 clear_vars:
      008647 AE 00 31         [ 2] 1253 	ldw x,#vars 
      00864A 90 AE 00 34      [ 2] 1254 	ldw y,#2*26 
      00864E 7F               [ 1] 1255 1$:	clr (x)
      00864F 5C               [ 1] 1256 	incw x 
      008650 90 5A            [ 2] 1257 	decw y 
      008652 26 FA            [ 1] 1258 	jrne 1$
      008654 81               [ 4] 1259 	ret 
                                   1260 
                                   1261 ;-------------------------------------
                                   1262 ; check if A is a letter 
                                   1263 ; input:
                                   1264 ;   A 			character to test 
                                   1265 ; output:
                                   1266 ;   C flag      1 true, 0 false 
                                   1267 ;-------------------------------------
      008655                       1268 is_alpha:
      008655 A1 41            [ 1] 1269 	cp a,#'A 
      008657 8C               [ 1] 1270 	ccf 
      008658 24 0B            [ 1] 1271 	jrnc 9$ 
      00865A A1 5B            [ 1] 1272 	cp a,#'Z+1 
      00865C 25 07            [ 1] 1273 	jrc 9$ 
      00865E A1 61            [ 1] 1274 	cp a,#'a 
      008660 8C               [ 1] 1275 	ccf 
      008661 24 02            [ 1] 1276 	jrnc 9$
      008663 A1 7B            [ 1] 1277 	cp a,#'z+1
      008665 81               [ 4] 1278 9$: ret 	
                                   1279 
                                   1280 ;------------------------------------
                                   1281 ; check if character in {'0'..'9'}
                                   1282 ; input:
                                   1283 ;    A  character to test
                                   1284 ; output:
                                   1285 ;    Carry  0 not digit | 1 digit
                                   1286 ;------------------------------------
      008666                       1287 is_digit:
      008666 A1 30            [ 1] 1288 	cp a,#'0
      008668 25 03            [ 1] 1289 	jrc 1$
      00866A A1 3A            [ 1] 1290     cp a,#'9+1
      00866C 8C               [ 1] 1291 	ccf 
      00866D 8C               [ 1] 1292 1$:	ccf 
      00866E 81               [ 4] 1293     ret
                                   1294 
                                   1295 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1296 ; return true if character in  A 
                                   1297 ; is letter or digit.
                                   1298 ; input:
                                   1299 ;   A     ASCII character 
                                   1300 ; output:
                                   1301 ;   A     no change 
                                   1302 ;   Carry    0 false| 1 true 
                                   1303 ;--------------------------------------
      00866F                       1304 is_alnum:
      00866F CD 86 66         [ 4] 1305 	call is_digit
      008672 25 03            [ 1] 1306 	jrc 1$ 
      008674 CD 86 55         [ 4] 1307 	call is_alpha
      008677 81               [ 4] 1308 1$:	ret 
                                   1309 
                                   1310 
                                   1311 ;-------------------------------------
                                   1312 ;  program initialization entry point 
                                   1313 ;-------------------------------------
                           000001  1314 	MAJOR=1
                           000000  1315 	MINOR=0
      008678 0A 0A 54 69 6E 79 20  1316 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0086BE                       1317 cold_start:
                                   1318 ;set stack 
      0086BE AE 17 FF         [ 2] 1319 	ldw x,#STACK_EMPTY
      0086C1 94               [ 1] 1320 	ldw sp,x   
                                   1321 ; clear all ram 
      0086C2 7F               [ 1] 1322 0$: clr (x)
      0086C3 5A               [ 2] 1323 	decw x 
      0086C4 26 FC            [ 1] 1324 	jrne 0$
                                   1325 ; activate pull up on all inputs 
      0086C6 A6 FF            [ 1] 1326 	ld a,#255 
      0086C8 C7 50 03         [ 1] 1327 	ld PA_CR1,a 
      0086CB C7 50 08         [ 1] 1328 	ld PB_CR1,a 
      0086CE C7 50 0D         [ 1] 1329 	ld PC_CR1,a 
      0086D1 C7 50 12         [ 1] 1330 	ld PD_CR1,a 
      0086D4 C7 50 17         [ 1] 1331 	ld PE_CR1,a 
      0086D7 C7 50 1C         [ 1] 1332 	ld PF_CR1,a 
      0086DA C7 50 21         [ 1] 1333 	ld PG_CR1,a 
      0086DD C7 50 2B         [ 1] 1334 	ld PI_CR1,a
                                   1335 ; set LD2 pin as output and turn it on
      0086E0 72 1A 50 0D      [ 1] 1336     bset PC_CR1,#LED2_BIT
      0086E4 72 1A 50 0E      [ 1] 1337     bset PC_CR2,#LED2_BIT
      0086E8 72 1A 50 0C      [ 1] 1338     bset PC_DDR,#LED2_BIT
      0086EC 72 1B 50 0A      [ 1] 1339 	bres PC_ODR,#LED2_BIT 
                                   1340 ; disable schmitt triggers on Arduino CN4 analog inputs
      0086F0 55 00 3F 54 07   [ 1] 1341 	mov ADC_TDRL,0x3f
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1342 ; disable peripherals clocks
                                   1343 ;	clr CLK_PCKENR1 
                                   1344 ;	clr CLK_PCKENR2
      0086F5 72 5F 50 F2      [ 1] 1345 	clr AWU_TBR 
      0086F9 72 14 50 CA      [ 1] 1346 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1347 ; select internal clock no divisor: 16 Mhz 	
      0086FD A6 E1            [ 1] 1348 	ld a,#CLK_SWR_HSI 
      0086FF 5F               [ 1] 1349 	clrw x  
      008700 CD 81 32         [ 4] 1350     call clock_init 
      008703 CD 81 55         [ 4] 1351 	call timer4_init
      008706 CD 81 48         [ 4] 1352 	call timer2_init
                                   1353 ; UART1 at 115200 BAUD
      008709 CD 83 35         [ 4] 1354 	call uart1_init
                                   1355 ; UART3 at 115200 BAUD 
      00870C CD 82 FA         [ 4] 1356 	call uart3_init	
      00870F 72 5F 00 30      [ 1] 1357 	clr comm ; default to UART1
                                   1358 ; activate PE_4 (user button interrupt)
      008713 72 18 50 18      [ 1] 1359     bset PE_CR2,#USR_BTN_BIT 
                                   1360 ; display system information
      008717 AE 86 78         [ 2] 1361 	ldw x,#software 
      00871A CD AA C0         [ 4] 1362 	call puts 
      00871D A6 01            [ 1] 1363 	ld a,#MAJOR 
      00871F C7 00 0E         [ 1] 1364 	ld acc8,a 
      008722 5F               [ 1] 1365 	clrw x 
      008723 CF 00 0C         [ 2] 1366 	ldw acc24,x
      008726 72 5F 00 25      [ 1] 1367 	clr tab_width  
      00872A 35 0A 00 0B      [ 1] 1368 	mov base, #10 
      00872E CD 8A C9         [ 4] 1369 	call prti24 
      008731 A6 2E            [ 1] 1370 	ld a,#'.
      008733 CD 83 78         [ 4] 1371 	call putc 
      008736 A6 00            [ 1] 1372 	ld a,#MINOR 
      008738 C7 00 0E         [ 1] 1373 	ld acc8,a 
      00873B 5F               [ 1] 1374 	clrw x 
      00873C CF 00 0C         [ 2] 1375 	ldw acc24,x 
      00873F CD 8A C9         [ 4] 1376 	call prti24
      008742 A6 0D            [ 1] 1377 	ld a,#CR 
      008744 CD 83 78         [ 4] 1378 	call putc
      008747 CD 9B 1E         [ 4] 1379 	call seek_fdrive 
      00874A 9A               [ 1] 1380 	rim 
      00874B 72 5C 00 16      [ 1] 1381 	inc seedy+1 
      00874F 72 5C 00 14      [ 1] 1382 	inc seedx+1 
      008753 CD 87 D0         [ 4] 1383 	call clear_basic
      008756 CD 93 36         [ 4] 1384 	call ubound 
                                   1385 ;	jra 2$	
      008759 CD 99 6C         [ 4] 1386 	call beep_1khz  
      00875C                       1387 2$:	
      00875C CD 87 65         [ 4] 1388 	call warm_init
      00875F CD 87 92         [ 4] 1389 	call load_autorun
      008762 CC 89 F0         [ 2] 1390     jp cmd_line  
                                   1391 
      008765                       1392 warm_init:
      008765 72 5F 00 24      [ 1] 1393 	clr flags 
      008769 72 5F 00 21      [ 1] 1394 	clr loop_depth 
      00876D 35 04 00 25      [ 1] 1395 	mov tab_width,#TAB_WIDTH 
      008771 35 0A 00 0B      [ 1] 1396 	mov base,#10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008775 AE 00 00         [ 2] 1397 	ldw x,#0 
      008778 CF 00 05         [ 2] 1398 	ldw basicptr,x 
      00877B CF 00 01         [ 2] 1399 	ldw in.w,x 
      00877E 72 5F 00 04      [ 1] 1400 	clr count
      008782 81               [ 4] 1401 	ret 
                                   1402 
                                   1403 ;--------------------------
                                   1404 ; called by tb_error when
                                   1405 ; flag FAUTORUN is set.
                                   1406 ; There is a bug in autorun 
                                   1407 ; program so cancel it.
                                   1408 ;---------------------------
      008783                       1409 cancel_autorun:
      008783 AE 40 00         [ 2] 1410 	ldw x,#AUTORUN_NAME 
      008786 CF 00 18         [ 2] 1411 	ldw farptr+1,x 
      008789 4F               [ 1] 1412 	clr a
      00878A 5F               [ 1] 1413 	clrw x  
      00878B C7 00 17         [ 1] 1414 	ld farptr,a 
      00878E CD 82 62         [ 4] 1415 	call write_byte 
      008791 81               [ 4] 1416 	ret 
                                   1417 
                                   1418 
                                   1419 ;--------------------------
                                   1420 ; if autorun file defined 
                                   1421 ; in eeprom address AUTORUN_NAME 
                                   1422 ; load and run it.
                                   1423 ;-------------------------
      008792                       1424 load_autorun:
      008792 90 AE 40 00      [ 2] 1425 	ldw y,#AUTORUN_NAME
      008796 90 F6            [ 1] 1426 	ld a,(y)
      008798 27 20            [ 1] 1427 	jreq 9$
      00879A CD 9B 84         [ 4] 1428 	call search_file
      00879D 25 05            [ 1] 1429 	jrc 2$ 
                                   1430 ; if file doesn't exit
      00879F CD 87 83         [ 4] 1431 	call cancel_autorun
      0087A2 20 16            [ 2] 1432 	jra 9$ 
      0087A4 CD 9C 9D         [ 4] 1433 2$:	call load_file
      0087A7 AE 40 00         [ 2] 1434 	ldw x,#AUTORUN_NAME 
      0087AA CD AA C0         [ 4] 1435 	call puts
      0087AD AE 87 BB         [ 2] 1436 	ldw x,#autorun_msg 
      0087B0 CD AA C0         [ 4] 1437 	call puts 
      0087B3 72 1C 00 24      [ 1] 1438 	bset flags,#FAUTORUN 
      0087B7 CC 99 3E         [ 2] 1439 	jp run_it    
      0087BA 81               [ 4] 1440 9$: ret 	
                                   1441 
      0087BB 20 6C 6F 61 64 65 64  1442 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1443 ;---------------------------
                                   1444 ; reset BASIC text variables 
                                   1445 ; and clear variables 
                                   1446 ;---------------------------
      0087D0                       1447 clear_basic:
      0087D0 72 5F 00 04      [ 1] 1448 	clr count
      0087D4 72 5F 00 02      [ 1] 1449 	clr in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0087D8 AE 00 65         [ 2] 1450 	ldw x,#free_ram 
      0087DB CF 00 1D         [ 2] 1451 	ldw txtbgn,x 
      0087DE CF 00 1F         [ 2] 1452 	ldw txtend,x 
      0087E1 CD 86 47         [ 4] 1453 	call clear_vars 
      0087E4 81               [ 4] 1454 	ret 
                                   1455 
                                   1456 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1457 ;;   Tiny BASIC error messages     ;;
                                   1458 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0087E5                       1459 err_msg:
      0087E5 00 00 88 05 88 12 88  1460 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             20 88 39 88 48
      0087F1 88 5E 88 74 88 8E 88  1461 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             9F 88 B0
      0087FB 88 BC 88 EF 88 FF 89  1462 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             13 89 26
                                   1463 
      008805 4D 65 6D 6F 72 79 20  1464 err_mem_full: .asciz "Memory full\n" 
             66 75 6C 6C 0A 00
      008812 73 79 6E 74 61 78 20  1465 err_syntax: .asciz "syntax error\n" 
             65 72 72 6F 72 0A 00
      008820 6D 61 74 68 20 6F 70  1466 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      008839 64 69 76 69 73 69 6F  1467 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      008848 69 6E 76 61 6C 69 64  1468 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00885E 72 75 6E 20 74 69 6D  1469 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      008874 63 6F 6D 6D 61 6E 64  1470 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      00888E 64 75 70 6C 69 63 61  1471 err_duplicate: .asciz "duplicate name.\n"
             74 65 20 6E 61 6D 65
             2E 0A 00
      00889F 46 69 6C 65 20 6E 6F  1472 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0088B0 62 61 64 20 76 61 6C  1473 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0088BC 46 69 6C 65 20 69 6E  1474 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal  0A-Bits]



             0A 00
      0088EE 00 4E 6F 20 64 61 74  1475 err_no_data: .asciz "No data found.\n"
             61 20 66 6F 75 6E 64
             2E 0A
      0088FE 00 4E 6F 20 70 72 6F  1476 err_no_prog: .asciz "No program in RAM!\n"
             67 72 61 6D 20 69 6E
             20 52 41 4D 21 0A
      008912 00 46 69 6C 65 20 73  1477 err_no_fspace: .asciz "File system full.\n" 
             79 73 74 65 6D 20 66
             75 6C 6C 2E 0A
      008925 00 42 75 66 66 65 72  1478 err_buf_full: .asciz "Buffer full\n"
             20 66 75 6C 6C 0A
                                   1479 
      008932 00 0A 72 75 6E 20 74  1480 rt_msg: .asciz "\nrun time error, "
             69 6D 65 20 65 72 72
             6F 72 2C 20
      008944 00 0A 63 6F 6D 70 69  1481 comp_msg: .asciz "\ncompile error, "
             6C 65 20 65 72 72 6F
             72 2C 20
      008955 00 6C 61 73 74 20 74  1482 tk_id: .asciz "last token id: "
             6F 6B 65 6E 20 69 64
             3A 20
                                   1483 
      0008E6                       1484 syntax_error:
      008965 00 02            [ 1] 1485 	ld a,#ERR_SYNTAX 
                                   1486 
      008966                       1487 tb_error:
      008966 A6 02 00 23 47   [ 2] 1488 	btjt flags,#FCOMP,1$
      008968 88               [ 1] 1489 	push a 
      008968 72 0A 00         [ 2] 1490 	ldw x, #rt_msg 
      00896B 24 47 88         [ 4] 1491 	call puts 
      00896E AE               [ 1] 1492 	pop a 
      00896F 89 33 CD         [ 2] 1493 	ldw x, #err_msg 
      008972 AA C0 84 AE      [ 1] 1494 	clr acc16 
      008976 87               [ 1] 1495 	sll a
      008977 E5 72 5F 00      [ 1] 1496 	rlc acc16  
      00897B 0D 48 72         [ 1] 1497 	ld acc8, a 
      00897E 59 00 0D C7      [ 2] 1498 	addw x,acc16 
      008982 00               [ 2] 1499 	ldw x,(x)
      008983 0E 72 BB         [ 4] 1500 	call puts
      008986 00 0D FE         [ 2] 1501 	ldw x,basicptr
      008989 CD AA C0         [ 1] 1502 	ld a,in 
      00898C CE 00 05         [ 4] 1503 	call prt_basic_line
      00898F C6 00 02         [ 2] 1504 	ldw x,#tk_id 
      008992 CD 96 0A         [ 4] 1505 	call puts 
      008995 AE 89 56         [ 1] 1506 	ld a,in.saved 
      008998 CD               [ 1] 1507 	clrw x 
      008999 AA               [ 1] 1508 	ld xl,a 
      00899A C0 C6 00 03      [ 2] 1509 	addw x,basicptr 
      00899E 5F               [ 1] 1510 	ld a,(x)
      00899F 97               [ 1] 1511 	clrw x 
      0089A0 72               [ 1] 1512 	ld xl,a 
      0089A1 BB 00 05         [ 4] 1513 	call print_int
      0089A4 F6 5F 97 CD 8A   [ 2] 1514 	btjf flags,#FAUTORUN ,6$
      0089A9 B9 72 0D         [ 4] 1515 	call cancel_autorun  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      0089AC 00 24            [ 2] 1516 	jra 6$
      000934                       1517 1$:	
      0089AE 3A               [ 1] 1518 	push a 
      0089AF CD 87 83         [ 2] 1519 	ldw x,#comp_msg
      0089B2 20 35 00         [ 4] 1520 	call puts 
      0089B4 84               [ 1] 1521 	pop a 
      0089B4 88 AE 89         [ 2] 1522 	ldw x, #err_msg 
      0089B7 45 CD AA C0      [ 1] 1523 	clr acc16 
      0089BB 84               [ 1] 1524 	sll a
      0089BC AE 87 E5 72      [ 1] 1525 	rlc acc16  
      0089C0 5F 00 0D         [ 1] 1526 	ld acc8, a 
      0089C3 48 72 59 00      [ 2] 1527 	addw x,acc16 
      0089C7 0D               [ 2] 1528 	ldw x,(x)
      0089C8 C7 00 0E         [ 4] 1529 	call puts
      0089CB 72 BB 00         [ 2] 1530 	ldw x,#tib
      0089CE 0D FE CD         [ 4] 1531 	call puts 
      0089D1 AA C0            [ 1] 1532 	ld a,#CR 
      0089D3 AE 16 90         [ 4] 1533 	call putc
      0089D6 CD AA C0         [ 2] 1534 	ldw x,in.w
      0089D9 A6 0D CD         [ 4] 1535 	call spaces
      0089DC 83 78            [ 1] 1536 	ld a,#'^
      0089DE CE 00 01         [ 4] 1537 	call putc 
      0089E1 CD AB 2D         [ 2] 1538 6$: ldw x,#STACK_EMPTY 
      0089E4 A6               [ 1] 1539     ldw sp,x
      00096D                       1540 warm_start:
      0089E5 5E CD 83         [ 4] 1541 	call warm_init
                                   1542 ;----------------------------
                                   1543 ;   BASIC interpreter
                                   1544 ;----------------------------
      000970                       1545 cmd_line: ; user interface 
      0089E8 78 AE            [ 1] 1546 	ld a,#CR 
      0089EA 17 FF 94         [ 4] 1547 	call putc 
      0089ED A6 3E            [ 1] 1548 	ld a,#'> 
      0089ED CD 87 65         [ 4] 1549 	call putc
      0089F0 CD 00 00         [ 4] 1550 	call readln
      0089F0 A6 0D CD 83      [ 1] 1551 	tnz count 
      0089F4 78 A6            [ 1] 1552 	jreq cmd_line
      0089F6 3E CD 83         [ 4] 1553 	call compile
                                   1554 ; if text begin with a line number
                                   1555 ; the compiler set count to zero    
                                   1556 ; so code is not interpreted
      0089F9 78 CD AB C5      [ 1] 1557 	tnz count 
      0089FD 72 5D            [ 1] 1558 	jreq cmd_line
                                   1559 
                                   1560 ; if direct command 
                                   1561 ; it's ready to interpret 
                                   1562 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1563 ;; This is the interpreter loop
                                   1564 ;; for each BASIC code line. 
                                   1565 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00098C                       1566 interpreter: 
      0089FF 00 04 27         [ 1] 1567 	ld a,in 
      008A02 ED CD 85         [ 1] 1568 	cp a,count 
      008A05 D4 72            [ 1] 1569 	jrmi interp_loop
      000994                       1570 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008A07 5D 00 04 27 E4   [ 2] 1571 	btjf flags, #FRUN, cmd_line
      008A0C CE 00 04         [ 2] 1572 	ldw x,basicptr
      008A0C C6 00 02 C1      [ 2] 1573 	addw x,in.w 
      008A10 00 04 2B         [ 2] 1574 	cpw x,txtend 
      008A13 1D C8            [ 1] 1575 	jrpl warm_start
      008A14 CF 00 04         [ 2] 1576 	ldw basicptr,x ; start of next line  
      008A14 72 01            [ 1] 1577 	ld a,(2,x)
      008A16 00 24 D7         [ 1] 1578 	ld count,a 
      008A19 CE 00 05 72      [ 1] 1579 	mov in,#3 ; skip first 3 bytes of line 
      0009B1                       1580 interp_loop: 
      008A1D BB 00 01         [ 4] 1581 	call next_token
      008A20 C3 00            [ 1] 1582 	cp a,#TK_NONE 
      008A22 1F 2A            [ 1] 1583 	jreq next_line 
      008A24 C8 CF            [ 1] 1584 	cp a,#TK_CMD
      008A26 00 05            [ 1] 1585 	jrne 1$
      008A28 E6               [ 4] 1586 	call (x) 
      008A29 02 C7            [ 2] 1587 	jra interp_loop 
      0009BF                       1588 1$:	 
      008A2B 00 04            [ 1] 1589 	cp a,#TK_VAR
      008A2D 35 03            [ 1] 1590 	jrne 2$
      008A2F 00 02 E9         [ 4] 1591 	call let_var  
      008A31 20 E9            [ 2] 1592 	jra interp_loop 
      0009C8                       1593 2$:	
      008A31 CD 8A            [ 1] 1594 	cp a,#TK_ARRAY 
      008A33 58 A1            [ 1] 1595 	jrne 3$
      008A35 00 27 DC         [ 4] 1596 	call let_array 
      008A38 A1 80            [ 2] 1597 	jra interp_loop
      0009D1                       1598 3$:	
      008A3A 26 03            [ 1] 1599 	cp a,#TK_COLON 
      008A3C FD 20            [ 1] 1600 	jreq interp_loop 
      008A3E F2 08 E6         [ 2] 1601 	jp syntax_error 
                                   1602 
                                   1603 		
                                   1604 ;--------------------------
                                   1605 ; extract next token from
                                   1606 ; token list 
                                   1607 ; basicptr -> base address 
                                   1608 ; in  -> offset in list array 
                                   1609 ; output:
                                   1610 ;   A 		token attribute
                                   1611 ;   X 		token value if there is one
                                   1612 ;----------------------------------------
      008A3F                       1613 next_token:
      008A3F A1               [ 1] 1614 	clrw x 
      008A40 85 26 05         [ 1] 1615 	ld a,in 
      008A43 CD 93 69         [ 1] 1616 	sub a,count ; don't replace sub by cp!  
      008A46 20 E9            [ 1] 1617 	jrmi 0$
      008A48 81               [ 4] 1618 	ret  ; end of BASIC line 
      0009E2                       1619 0$: 
      008A48 A1 06 26 05 CD   [ 1] 1620 	mov in.saved,in 
      008A4D 93 66 20 E0      [ 2] 1621 	ldw y,basicptr 
      008A51 91 D6 00         [ 4] 1622 	ld a,([in.w],y)
      008A51 A1 01 27 DC      [ 1] 1623 	inc in  
      008A55 CC               [ 1] 1624 	tnz a 
      008A56 89 66            [ 1] 1625 	jrmi 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A58 A1 06            [ 1] 1626 	cp a,#TK_ARRAY
      008A58 5F C6            [ 1] 1627 	jrpl 9$  ; no attribute for these
      008A5A 00 02            [ 1] 1628 	cp a,#TK_COLON
      008A5C C0 00            [ 1] 1629 	jreq 9$  
      0009FD                       1630 1$: ; 
      008A5E 04 2B            [ 1] 1631 	cp a,#TK_CHAR
      008A60 01 81            [ 1] 1632 	jrne 2$
      008A62 41               [ 1] 1633 	exg a,xl
      008A62 55 00 02         [ 4] 1634 	ld a,([in.w],y)
      008A65 00 03 90 CE      [ 1] 1635 	inc in 
      008A69 00               [ 1] 1636 	exg a,xl  
      008A6A 05               [ 4] 1637 	ret
      008A6B 91 D6            [ 1] 1638 2$:	cp a,#TK_QSTR 
      008A6D 01 72            [ 1] 1639 	jrne 9$
      008A6F 5C               [ 1] 1640 	ldw x,y 
      008A70 00 02 4D 2B      [ 2] 1641 	addw x,in.w ; pointer to string 
                                   1642 ; move pointer after string 
      008A74 2A A1 06         [ 4] 1643 3$:	tnz ([in.w],y)
      008A77 2A 3F            [ 1] 1644 	jreq 8$
      008A79 A1 01 27 3B      [ 1] 1645 	inc in 
      008A7D 20 F5            [ 2] 1646 	jra 3$
      000A1F                       1647 6$: 
      008A7D A1 03 26 0A      [ 2] 1648 	addw y,in.w 
      008A81 41 91            [ 2] 1649 	ldw y,(y)
      008A83 D6 01            [ 1] 1650 	cp a,#TK_INTGR
      008A85 72 5C            [ 1] 1651 	jrpl 7$
      008A87 00 02 41 81      [ 2] 1652 	addw y,#code_addr
      008A8B A1 02            [ 2] 1653 	ldw y,(y) 
      008A8D 26               [ 1] 1654 7$:	exgw x,y 
      008A8E 29 93 72 BB      [ 1] 1655 	inc in
      008A92 00 01 91 6D      [ 1] 1656 8$:	inc in 
      000A38                       1657 9$: 
      008A96 01               [ 4] 1658 	ret	
                                   1659 
                                   1660 ;-----------------------------------
                                   1661 ; print a 16 bit integer 
                                   1662 ; using variable 'base' as conversion
                                   1663 ; format.
                                   1664 ; input:
                                   1665 ;   X       integer to print 
                                   1666 ;   'base'    conversion base 
                                   1667 ; output:
                                   1668 ;   none 
                                   1669 ;-----------------------------------
      000A39                       1670 print_int:
      008A97 27 1B 72 5C      [ 1] 1671 	clr acc24 
      008A9B 00 02 20         [ 2] 1672 	ldw acc16,x 
      008A9E F5 0F 00 0C 04   [ 2] 1673 	btjf acc16,#7,prti24
      008A9F 72 53 00 0B      [ 1] 1674 	cpl acc24 
                                   1675 
                                   1676 ;------------------------------------
                                   1677 ; print integer in acc24 
                                   1678 ; input:
                                   1679 ;	acc24 		integer to print 
                                   1680 ;	'base' 		numerical base for conversion 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1681 ;   'tab_width' field width 
                                   1682 ;  output:
                                   1683 ;    A          string length
                                   1684 ;------------------------------------
      000A49                       1685 prti24:
      008A9F 72 B9 00         [ 4] 1686     call itoa  ; conversion entier en  .asciz
      008AA2 01 90 FE         [ 4] 1687 	call right_align  
      008AA5 A1               [ 1] 1688 	push a 
      008AA6 84 2A 06         [ 4] 1689 	call puts
      008AA9 72               [ 1] 1690 	pop a 
      008AAA A9               [ 4] 1691     ret	
                                   1692 
                                   1693 ;------------------------------------
                                   1694 ; convert integer in acc24 to string
                                   1695 ; input:
                                   1696 ;   'base'	conversion base 
                                   1697 ;	acc24	integer to convert
                                   1698 ; output:
                                   1699 ;   X  		pointer to first char of string
                                   1700 ;   A       string length
                                   1701 ;------------------------------------
                           000001  1702 	SIGN=1  ; integer sign 
                           000002  1703 	LEN=2 
                           000003  1704 	PSTR=3
                           000004  1705 	VSIZE=4 ;locals size
      000A55                       1706 itoa:
      000A55                       1707 	_vars VSIZE
      008AAB A9 80            [ 2]    1     sub sp,#VSIZE 
      008AAD 90 FE            [ 1] 1708 	clr (LEN,sp) ; string length  
      008AAF 51 72            [ 1] 1709 	clr (SIGN,sp)    ; sign
      008AB1 5C 00 02         [ 1] 1710 	ld a,base 
      008AB4 72 5C            [ 1] 1711 	cp a,#10
      008AB6 00 02            [ 1] 1712 	jrne 1$
                                   1713 	; base 10 string display with negative sign if bit 23==1
      008AB8 72 0F 00 0B 05   [ 2] 1714 	btjf acc24,#7,1$
      008AB8 81 01            [ 1] 1715 	cpl (SIGN,sp)
      008AB9 CD 0B 1C         [ 4] 1716 	call neg_acc24
      000A6C                       1717 1$:
                                   1718 ; initialize string pointer 
      008AB9 72 5F 00         [ 2] 1719 	ldw x,#tib 
      008ABC 0C CF 00         [ 2] 1720 	addw x,#TIB_SIZE
      008ABF 0D               [ 2] 1721 	decw x 
      008AC0 72               [ 1] 1722 	clr (x)
      000A74                       1723 itoa_loop:
      008AC1 0F 00 0D         [ 1] 1724     ld a,base
      008AC4 04 72            [ 2] 1725 	ldw (PSTR,sp),x 
      008AC6 53 00 0C         [ 4] 1726     call divu24_8 ; acc24/A 
      008AC9 1E 03            [ 2] 1727 	ldw x,(PSTR,sp)
      008AC9 CD 8A            [ 1] 1728     add a,#'0  ; remainder of division
      008ACB D5 CD            [ 1] 1729     cp a,#'9+1
      008ACD 94 26            [ 1] 1730     jrmi 2$
      008ACF 88 CD            [ 1] 1731     add a,#7 
      000A86                       1732 2$:	
      008AD1 AA               [ 2] 1733 	decw x
      008AD2 C0               [ 1] 1734     ld (x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AD3 84 81            [ 1] 1735 	inc (LEN,sp)
                                   1736 	; if acc24==0 conversion done
      008AD5 C6 00 0B         [ 1] 1737 	ld a,acc24
      008AD5 52 04 0F         [ 1] 1738 	or a,acc16
      008AD8 02 0F 01         [ 1] 1739 	or a,acc8
      008ADB C6 00            [ 1] 1740     jrne itoa_loop
                                   1741 	;conversion done, next add '$' or '-' as required
      008ADD 0B A1 0A         [ 1] 1742 	ld a,base 
      008AE0 26 0A            [ 1] 1743 	cp a,#16
      008AE2 72 0F            [ 1] 1744 	jreq 8$
      008AE4 00 0C            [ 1] 1745 	ld a,(SIGN,sp)
      008AE6 05 03            [ 1] 1746     jreq 10$
      008AE8 01 CD            [ 1] 1747     ld a,#'-
      008AEA 8B 9C            [ 2] 1748 	jra 9$ 
                                   1749 ; don't print more than 4 digits
                                   1750 ; in hexadecimal to avoid '-' sign 
                                   1751 ; extend display 	
      008AEC 7B 02            [ 1] 1752 8$: ld a,(LEN,sp) 
      008AEC AE 16            [ 1] 1753 	cp a,#5 
      008AEE 90 1C            [ 1] 1754 	jrmi 81$
      008AF0 00               [ 1] 1755 	incw x
      008AF1 50 5A            [ 1] 1756 	dec (LEN,sp)
      008AF3 7F F5            [ 2] 1757 	jra 8$
      008AF4                       1758 81$:	
      008AF4 C6 00            [ 1] 1759 	ld a,#'$ 
      008AF6 0B               [ 2] 1760 9$: decw x
      008AF7 1F               [ 1] 1761     ld (x),a
      008AF8 03 CD            [ 1] 1762 	inc (LEN,sp)
      000AB5                       1763 10$:
      008AFA 8B 3A            [ 1] 1764 	ld a,(LEN,sp)
      000AB7                       1765 	_drop VSIZE
      008AFC 1E 03            [ 2]    1     addw sp,#VSIZE 
      008AFE AB               [ 4] 1766 	ret
                                   1767 
                                   1768 ;-------------------------------------
                                   1769 ; divide uint24_t by uint8_t
                                   1770 ; used to convert uint24_t to string
                                   1771 ; input:
                                   1772 ;	acc24	dividend
                                   1773 ;   A 		divisor
                                   1774 ; output:
                                   1775 ;   acc24	quotient
                                   1776 ;   A		remainder
                                   1777 ;------------------------------------- 
                                   1778 ; offset  on sp of arguments and locals
                           000001  1779 	U8   = 1   ; divisor on stack
                           000001  1780 	VSIZE =1
      000ABA                       1781 divu24_8:
      008AFF 30               [ 2] 1782 	pushw x ; save x
      008B00 A1               [ 1] 1783 	push a 
                                   1784 	; ld dividend UU:MM bytes in X
      008B01 3A 2B 02         [ 1] 1785 	ld a, acc24
      008B04 AB               [ 1] 1786 	ld xh,a
      008B05 07 00 0C         [ 1] 1787 	ld a,acc24+1
      008B06 97               [ 1] 1788 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B06 5A F7            [ 1] 1789 	ld a,(U8,SP) ; divisor
      008B08 0C               [ 2] 1790 	div x,a ; UU:MM/U8
      008B09 02               [ 1] 1791 	push a  ;save remainder
      008B0A C6               [ 1] 1792 	ld a,xh
      008B0B 00 0C CA         [ 1] 1793 	ld acc24,a
      008B0E 00               [ 1] 1794 	ld a,xl
      008B0F 0D CA 00         [ 1] 1795 	ld acc24+1,a
      008B12 0E               [ 1] 1796 	pop a
      008B13 26               [ 1] 1797 	ld xh,a
      008B14 DF C6 00         [ 1] 1798 	ld a,acc24+2
      008B17 0B               [ 1] 1799 	ld xl,a
      008B18 A1 10            [ 1] 1800 	ld a,(U8,sp) ; divisor
      008B1A 27               [ 2] 1801 	div x,a  ; R:LL/U8
      008B1B 08 7B            [ 1] 1802 	ld (U8,sp),a ; save remainder
      008B1D 01               [ 1] 1803 	ld a,xl
      008B1E 27 15 A6         [ 1] 1804 	ld acc24+2,a
      008B21 2D               [ 1] 1805 	pop a
      008B22 20               [ 2] 1806 	popw x
      008B23 0D               [ 4] 1807 	ret
                                   1808 
                                   1809 ;--------------------------------------
                                   1810 ; unsigned multiply uint24_t by uint8_t
                                   1811 ; use to convert numerical string to uint24_t
                                   1812 ; input:
                                   1813 ;	acc24	uint24_t 
                                   1814 ;   A		uint8_t
                                   1815 ; output:
                                   1816 ;   acc24   A*acc24
                                   1817 ;-------------------------------------
                                   1818 ; local variables offset  on sp
                           000003  1819 	U8   = 3   ; A pushed on stack
                           000002  1820 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  1821 	OVFH = 1  ; multiplication overflow high byte
                           000003  1822 	VSIZE = 3
      000AE2                       1823 mulu24_8:
      008B24 7B               [ 2] 1824 	pushw x    ; save X
                                   1825 	; local variables
      008B25 02               [ 1] 1826 	push a     ; U8
      008B26 A1               [ 1] 1827 	clrw x     ; initialize overflow to 0
      008B27 05               [ 2] 1828 	pushw x    ; multiplication overflow
                                   1829 ; multiply low byte.
      008B28 2B 05 5C         [ 1] 1830 	ld a,acc24+2
      008B2B 0A               [ 1] 1831 	ld xl,a
      008B2C 02 20            [ 1] 1832 	ld a,(U8,sp)
      008B2E F5               [ 4] 1833 	mul x,a
      008B2F 9F               [ 1] 1834 	ld a,xl
      008B2F A6 24 5A         [ 1] 1835 	ld acc24+2,a
      008B32 F7               [ 1] 1836 	ld a, xh
      008B33 0C 02            [ 1] 1837 	ld (OVFL,sp),a
                                   1838 ; multipy middle byte
      008B35 C6 00 0C         [ 1] 1839 	ld a,acc24+1
      008B35 7B               [ 1] 1840 	ld xl,a
      008B36 02 5B            [ 1] 1841 	ld a, (U8,sp)
      008B38 04               [ 4] 1842 	mul x,a
                                   1843 ; add overflow to this partial product
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B39 81 FB 01         [ 2] 1844 	addw x,(OVFH,sp)
      008B3A 9F               [ 1] 1845 	ld a,xl
      008B3A 89 88 C6         [ 1] 1846 	ld acc24+1,a
      008B3D 00               [ 1] 1847 	clr a
      008B3E 0C 95            [ 1] 1848 	adc a,#0
      008B40 C6 00            [ 1] 1849 	ld (OVFH,sp),a
      008B42 0D               [ 1] 1850 	ld a,xh
      008B43 97 7B            [ 1] 1851 	ld (OVFL,sp),a
                                   1852 ; multiply most signficant byte	
      008B45 01 62 88         [ 1] 1853 	ld a, acc24
      008B48 9E               [ 1] 1854 	ld xl, a
      008B49 C7 00            [ 1] 1855 	ld a, (U8,sp)
      008B4B 0C               [ 4] 1856 	mul x,a
      008B4C 9F C7 00         [ 2] 1857 	addw x, (OVFH,sp)
      008B4F 0D               [ 1] 1858 	ld a, xl
      008B50 84 95 C6         [ 1] 1859 	ld acc24,a
      008B53 00 0E            [ 2] 1860     addw sp,#VSIZE
      008B55 97               [ 2] 1861 	popw x
      008B56 7B               [ 4] 1862 	ret
                                   1863 
                                   1864 ;------------------------------------
                                   1865 ;  two's complement acc24
                                   1866 ;  input:
                                   1867 ;		acc24 variable
                                   1868 ;  output:
                                   1869 ;		acc24 variable
                                   1870 ;-------------------------------------
      000B1C                       1871 neg_acc24:
      008B57 01 62 6B 01      [ 1] 1872 	cpl acc24+2
      008B5B 9F C7 00 0E      [ 1] 1873 	cpl acc24+1
      008B5F 84 85 81 0B      [ 1] 1874 	cpl acc24
      008B62 A6 01            [ 1] 1875 	ld a,#1
      008B62 89 88 5F         [ 1] 1876 	add a,acc24+2
      008B65 89 C6 00         [ 1] 1877 	ld acc24+2,a
      008B68 0E               [ 1] 1878 	clr a
      008B69 97 7B 03         [ 1] 1879 	adc a,acc24+1
      008B6C 42 9F C7         [ 1] 1880 	ld acc24+1,a 
      008B6F 00               [ 1] 1881 	clr a 
      008B70 0E 9E 6B         [ 1] 1882 	adc a,acc24 
      008B73 02 C6 00         [ 1] 1883 	ld acc24,a 
      008B76 0D               [ 4] 1884 	ret
                                   1885 
                                   1886 
                                   1887 
                                   1888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1889 ;; compiler routines        ;;
                                   1890 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1891 ;------------------------------------
                                   1892 ; parse quoted string 
                                   1893 ; input:
                                   1894 ;   Y 	pointer to tib 
                                   1895 ;   X   pointer to output buffer 
                                   1896 ; output:
                                   1897 ;	buffer   parsed string
                                   1898 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           000001  1899 	PREV = 1
                           000002  1900 	CURR =2
                           000002  1901 	VSIZE=2
      000B3F                       1902 parse_quote: 
      000B3F                       1903 	_vars VSIZE 
      008B77 97 7B            [ 2]    1     sub sp,#VSIZE 
      008B79 03               [ 1] 1904 	clr a
      008B7A 42 72            [ 1] 1905 1$:	ld (PREV,sp),a 
      000B44                       1906 2$:	
      008B7C FB 01 9F         [ 4] 1907 	ld a,([in.w],y)
      008B7F C7 00            [ 1] 1908 	jreq 6$
      008B81 0D 4F A9 00      [ 1] 1909 	inc in 
      008B85 6B 01            [ 1] 1910 	ld (CURR,sp),a 
      008B87 9E 6B            [ 1] 1911 	ld a,#'\
      008B89 02 C6            [ 1] 1912 	cp a, (PREV,sp)
      008B8B 00 0C            [ 1] 1913 	jrne 3$
      008B8D 97 7B            [ 1] 1914 	clr (PREV,sp)
      008B8F 03 42            [ 1] 1915 	ld a,(CURR,sp)
      008B91 72 FB            [ 4] 1916 	callr convert_escape
      008B93 01               [ 1] 1917 	ld (x),a 
      008B94 9F               [ 1] 1918 	incw x 
      008B95 C7 00            [ 2] 1919 	jra 2$
      000B5F                       1920 3$:
      008B97 0C 5B            [ 1] 1921 	ld a,(CURR,sp)
      008B99 03 85            [ 1] 1922 	cp a,#'\'
      008B9B 81 DD            [ 1] 1923 	jreq 1$
      008B9C A1 22            [ 1] 1924 	cp a,#'"
      008B9C 72 53            [ 1] 1925 	jreq 6$ 
      008B9E 00               [ 1] 1926 	ld (x),a 
      008B9F 0E               [ 1] 1927 	incw x 
      008BA0 72 53            [ 2] 1928 	jra 2$
      000B6D                       1929 6$:
      008BA2 00               [ 1] 1930 	clr (x)
      008BA3 0D               [ 1] 1931 	incw x 
      008BA4 72 53            [ 1] 1932 	ldw y,x 
      008BA6 00               [ 1] 1933 	clrw x 
      008BA7 0C A6            [ 1] 1934 	ld a,#TK_QSTR  
      000B74                       1935 	_drop VSIZE
      008BA9 01 CB            [ 2]    1     addw sp,#VSIZE 
      008BAB 00               [ 4] 1936 	ret 
                                   1937 
                                   1938 ;---------------------------------------
                                   1939 ; called by parse_quote
                                   1940 ; subtitute escaped character 
                                   1941 ; by their ASCII value .
                                   1942 ; input:
                                   1943 ;   A  character following '\'
                                   1944 ; output:
                                   1945 ;   A  substitued char or same if not valid.
                                   1946 ;---------------------------------------
      000B77                       1947 convert_escape:
      008BAC 0E               [ 2] 1948 	pushw x 
      008BAD C7 00 0E         [ 2] 1949 	ldw x,#escaped 
      008BB0 4F               [ 1] 1950 1$:	cp a,(x)
      008BB1 C9 00            [ 1] 1951 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BB3 0D               [ 1] 1952 	tnz (x)
      008BB4 C7 00            [ 1] 1953 	jreq 3$
      008BB6 0D               [ 1] 1954 	incw x 
      008BB7 4F C9            [ 2] 1955 	jra 1$
      008BB9 00 0C C7         [ 2] 1956 2$: subw x,#escaped 
      008BBC 00               [ 1] 1957 	ld a,xl 
      008BBD 0C 81            [ 1] 1958 	add a,#7
      008BBF 85               [ 2] 1959 3$:	popw x 
      008BBF 52               [ 4] 1960 	ret 
                                   1961 
      008BC0 02 4F 6B 01 76 66 72  1962 escaped: .asciz "abtnvfr"
             00
                                   1963 
                                   1964 ;-------------------------
                                   1965 ; integer parser 
                                   1966 ; input:
                                   1967 ;   X 		point to output buffer  
                                   1968 ;   Y 		point to tib 
                                   1969 ;   A 	    first digit|'$' 
                                   1970 ; output:  
                                   1971 ;   X 		integer 
                                   1972 ;   A 		TK_INTGR
                                   1973 ;   acc24   24 bits integer 
                                   1974 ;-------------------------
                           000001  1975 	BASE=1
                           000002  1976 	TCHAR=2 
                           000003  1977 	XSAVE=3
                           000004  1978 	VSIZE=4 
      008BC4                       1979 parse_integer: ; { -- n }
      008BC4 91               [ 2] 1980 	pushw x 	
      008BC5 D6 01            [ 1] 1981 	push #0 ; TCHAR
      008BC7 27 24            [ 1] 1982 	push #10 ; BASE=10
      008BC9 72 5C            [ 1] 1983 	cp a,#'$
      008BCB 00 02            [ 1] 1984 	jrne 2$ 
      000B9D                       1985     _drop #1
      008BCD 6B 02            [ 2]    1     addw sp,##1 
      008BCF A6 5C            [ 1] 1986 	push #16  ; BASE=16
      008BD1 11               [ 1] 1987 2$:	ld (x),a 
      008BD2 01               [ 1] 1988 	incw x 
      008BD3 26 0A 0F         [ 4] 1989 	ld a,([in.w],y)
      008BD6 01 7B 02 AD      [ 1] 1990 	inc in 
      008BDA 1C F7 5C         [ 4] 1991 	call to_upper 
      008BDD 20 E5            [ 1] 1992 	ld (TCHAR,sp),a 
      008BDF CD 05 E6         [ 4] 1993 	call is_digit 
      008BDF 7B 02            [ 1] 1994 	jrc 2$
      008BE1 A1 5C            [ 1] 1995 	ld a,#16 
      008BE3 27 DD            [ 1] 1996 	cp a,(BASE,sp)
      008BE5 A1 22            [ 1] 1997 	jrne 3$ 
      008BE7 27 04            [ 1] 1998 	ld a,(TCHAR,sp)
      008BE9 F7 5C            [ 1] 1999 	cp a,#'A 
      008BEB 20 D7            [ 1] 2000 	jrmi 3$ 
      008BED A1 47            [ 1] 2001 	cp a,#'G 
      008BED 7F 5C            [ 1] 2002 	jrmi 2$ 
      008BEF 90 93 5F A6      [ 1] 2003 3$: dec in 	
      008BF3 02               [ 1] 2004     clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BF4 5B 02            [ 2] 2005 	ldw x,(XSAVE,sp)
      008BF6 81 0E 33         [ 4] 2006 	call atoi24
      008BF7 90 93            [ 1] 2007 	ldw y,x 
      008BF7 89 AE 8C         [ 2] 2008 	ldw x,acc16 
      008BFA 0C F1            [ 1] 2009 	ld a,#TK_INTGR
      008BFC 27 06            [ 2] 2010 	ldw (y),x 
      008BFE 7D 27 09 5C      [ 2] 2011 	addw y,#2
      000BDB                       2012 	_drop VSIZE  
      008C02 20 F7            [ 2]    1     addw sp,#VSIZE 
      008C04 1D               [ 4] 2013 	ret 	
                                   2014 
                                   2015 ;-------------------------
                                   2016 ; binary integer parser
                                   2017 ; build integer in acc24  
                                   2018 ; input:
                                   2019 ;   X 		point to output buffer  
                                   2020 ;   Y 		point to tib 
                                   2021 ;   A 	    '&' 
                                   2022 ; output:  
                                   2023 ;   buffer  TK_INTGR integer  
                                   2024 ;   X 		int16 
                                   2025 ;   A 		TK_INTGR
                                   2026 ;   acc24    int24 
                                   2027 ;-------------------------
                           000001  2028 	BINARY=1 ; 24 bits integer 
                           000003  2029 	VSIZE=3
      000BDE                       2030 parse_binary: ; { -- n }
      008C05 8C 0C            [ 1] 2031 	push #0
      008C07 9F AB            [ 1] 2032 	push #0
      008C09 07 85            [ 1] 2033 	push #0
      000BE4                       2034 2$:	
      008C0B 81 61 62         [ 4] 2035 	ld a,([in.w],y)
      008C0E 74 6E 76 66      [ 1] 2036 	inc in 
      008C12 72 00            [ 1] 2037 	cp a,#'0 
      008C14 27 06            [ 1] 2038 	jreq 3$
      008C14 89 4B            [ 1] 2039 	cp a,#'1 
      008C16 00 4B            [ 1] 2040 	jreq 3$ 
      008C18 0A A1            [ 2] 2041 	jra bin_exit 
      008C1A 24 26            [ 1] 2042 3$: sub a,#'0 
      008C1C 04               [ 1] 2043 	rrc a
      008C1D 5B 01            [ 1] 2044 	rlc (BINARY+2,sp) 
      008C1F 4B 10            [ 1] 2045 	rlc (BINARY+1,sp)
      008C21 F7 5C            [ 1] 2046 	rlc (BINARY,sp) 
      008C23 91 D6            [ 2] 2047 	jra 2$  
      000C00                       2048 bin_exit:
      008C25 01 72 5C 00      [ 1] 2049 	dec in 
      008C29 02 CD            [ 1] 2050 	ldw y,x
      008C2B 8E A7            [ 1] 2051 	ld a,(BINARY,sp)
      008C2D 6B 02 CD         [ 1] 2052 	ld acc24,a 
      008C30 86 66            [ 2] 2053 	ldw x,(BINARY+1,sp)
      008C32 25 ED A6         [ 2] 2054 	ldw acc16,x
      008C35 10 11            [ 2] 2055 	ldw (y),x 
      008C37 01 26 0A 7B      [ 2] 2056 	addw y,#2  
      008C3B 02 A1            [ 1] 2057 	ld a,#TK_INTGR 	
      000C18                       2058 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C3D 41 2B            [ 2]    1     addw sp,#VSIZE 
      008C3F 04               [ 4] 2059 	ret
                                   2060 
                                   2061 ;---------------------------
                                   2062 ;  token begin with a letter,
                                   2063 ;  is keyword or variable. 	
                                   2064 ; input:
                                   2065 ;   X 		point to pad 
                                   2066 ;   Y 		point to text
                                   2067 ;   A 	    first letter  
                                   2068 ; output:
                                   2069 ;   X		exec_addr|var_addr 
                                   2070 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                   2071 ;   pad 	keyword|var_name  
                                   2072 ;--------------------------  
                           000001  2073 	XFIRST=1
                           000002  2074 	VSIZE=2
      000C1B                       2075 parse_keyword: 
      008C40 A1               [ 2] 2076 	pushw x 
      000C1C                       2077 kw_loop:	
      008C41 47 2B DD         [ 4] 2078 	call to_upper 
      008C44 72               [ 1] 2079 	ld (x),a 
      008C45 5A               [ 1] 2080 	incw x 
      008C46 00 02 7F         [ 4] 2081 	ld a,([in.w],y)
      008C49 1E 03 CD 8E      [ 1] 2082 	inc in 
      008C4D B3 90 93         [ 4] 2083 	call is_alpha 
      008C50 CE 00            [ 1] 2084 	jrc kw_loop
      008C52 0D A6 84 90      [ 1] 2085 	dec in   
      008C56 FF               [ 1] 2086 1$: clr (x)
      008C57 72 A9            [ 2] 2087 	ldw x,(XFIRST,sp) 
      008C59 00 02            [ 1] 2088 	ld a,(1,x)
      008C5B 5B 04            [ 1] 2089 	jrne 2$
                                   2090 ; one letter variable name 
      008C5D 81               [ 1] 2091 	ld a,(x) 
      008C5E A0 41            [ 1] 2092 	sub a,#'A 
      008C5E 4B               [ 1] 2093 	sll a 
      008C5F 00               [ 1] 2094 	push a 
      008C60 4B 00            [ 1] 2095 	push #0
      008C62 4B 00 30         [ 2] 2096 	ldw x,#vars 
      008C64 72 FB 01         [ 2] 2097 	addw x,(1,sp) ; X=var address 
      000C45                       2098 	_drop 2 
      008C64 91 D6            [ 2]    1     addw sp,#2 
      008C66 01 72            [ 1] 2099 	ld a,#TK_VAR 
      008C68 5C 00            [ 2] 2100 	jra 4$ 
      000C4B                       2101 2$: ; check for keyword, otherwise syntax error.
      000C4B                       2102 	_ldx_dict kword_dict ; dictionary entry point
      008C6A 02 A1 30         [ 2]    1     ldw x,#kword_dict+2
      008C6D 27 06            [ 2] 2103 	ldw y,(XFIRST,sp) ; name to search for
      008C6F A1 31 27         [ 4] 2104 	call search_dict
      008C72 02               [ 1] 2105 	tnz a
      008C73 20 0B            [ 1] 2106 	jrne 4$ 
      008C75 A0 30 46         [ 2] 2107 	jp syntax_error
      000C59                       2108 4$:	
      008C78 09 03            [ 2] 2109 	ldw y,(XFIRST,sp)
      008C7A 09 02            [ 1] 2110 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C7C 09 01            [ 1] 2111 	incw y 
      008C7E 20 E4            [ 2] 2112 	ldw (y),x
      008C80 72 A9 00 02      [ 2] 2113 	addw y,#2  
      000C65                       2114 	_drop VSIZE 
      008C80 72 5A            [ 2]    1     addw sp,#VSIZE 
      008C82 00               [ 4] 2115 	ret  	
                                   2116 
                                   2117 
                                   2118 ;------------------------------------
                                   2119 ; scan text for next token
                                   2120 ; input: 
                                   2121 ;	X 		pointer to buffer where 
                                   2122 ;	        token id and value are copied 
                                   2123 ; use:
                                   2124 ;	Y   pointer to text in tib 
                                   2125 ; output:
                                   2126 ;   A       token attribute 
                                   2127 ;   X 		token value
                                   2128 ;   Y       updated position in output buffer   
                                   2129 ;------------------------------------
                                   2130 	; use to check special character 
                                   2131 	.macro _case c t  
                                   2132 	ld a,#c 
                                   2133 	cp a,(TCHAR,sp) 
                                   2134 	jrne t
                                   2135 	.endm 
                                   2136 
                           000001  2137 	TCHAR=1
                           000002  2138 	ATTRIB=2
                           000002  2139 	VSIZE=2
      000C68                       2140 get_token: 
      000C68                       2141 	_vars VSIZE
      008C83 02 90            [ 2]    1     sub sp,#VSIZE 
                                   2142 ;	ld a,in 
                                   2143 ;	sub a,count
                                   2144 ;   jrmi 0$
                                   2145 ;	clr a 
                                   2146 ;	ret 
      000C6A                       2147 0$: 
      008C85 93 7B 01 C7      [ 2] 2148 	ldw y,#tib    	
      008C89 00 0C            [ 1] 2149 	ld a,#SPACE
      008C8B 1E 02 CF         [ 4] 2150 	call skip
      008C8E 00 0D 90 FF 72   [ 1] 2151 	mov in.saved,in 
      008C93 A9 00 02         [ 4] 2152 	ld a,([in.w],y)
      008C96 A6 84            [ 1] 2153 	jrne 1$
      008C98 5B 03            [ 1] 2154 	ldw y,x 
      008C9A 81 0E 24         [ 2] 2155 	jp token_exit ; end of line 
      008C9B 72 5C 00 01      [ 1] 2156 1$:	inc in 
      008C9B 89 0E 27         [ 4] 2157 	call to_upper 
      008C9C 6B 01            [ 1] 2158 	ld (TCHAR,sp),a 
                                   2159 ; check for quoted string
      000C8B                       2160 str_tst:  	
      000C8B                       2161 	_case '"' nbr_tst
      008C9C CD 8E            [ 1]    1 	ld a,#'"' 
      008C9E A7 F7            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CA0 5C 91            [ 1]    3 	jrne nbr_tst
      008CA2 D6 01            [ 1] 2162 	ld a,#TK_QSTR
      008CA4 72               [ 1] 2163 	ld (x),a 
      008CA5 5C               [ 1] 2164 	incw x 
      008CA6 00 02 CD         [ 4] 2165 	call parse_quote
      008CA9 86 55 25         [ 2] 2166 	jp token_exit
      000C9B                       2167 nbr_tst:
                                   2168 ; check for hexadecimal number 
      008CAC EF 72            [ 1] 2169 	ld a,#'$'
      008CAE 5A 00            [ 1] 2170 	cp a,(TCHAR,sp) 
      008CB0 02 7F            [ 1] 2171 	jreq 1$
                                   2172 ;check for binary number 
      008CB2 1E 01            [ 1] 2173 	ld a,#'&
      008CB4 E6 01            [ 1] 2174 	cp a,(TCHAR,sp)
      008CB6 26 13            [ 1] 2175 	jrne 0$
      008CB8 F6 A0            [ 1] 2176 	ld a,#TK_INTGR
      008CBA 41               [ 1] 2177 	ld (x),a 
      008CBB 48               [ 1] 2178 	incw x 
      008CBC 88 4B 00         [ 4] 2179 	call parse_binary ; expect binary integer 
      008CBF AE 00 31         [ 2] 2180 	jp token_exit 
                                   2181 ; check for decimal number 	
      008CC2 72 FB            [ 1] 2182 0$:	ld a,(TCHAR,sp)
      008CC4 01 5B 02         [ 4] 2183 	call is_digit
      008CC7 A6 85            [ 1] 2184 	jrnc 3$
      008CC9 20 0E            [ 1] 2185 1$:	ld a,#TK_INTGR 
      008CCB F7               [ 1] 2186 	ld (x),a 
      008CCB AE               [ 1] 2187 	incw x 
      008CCC A9 7A            [ 1] 2188 	ld a,(TCHAR,sp)
      008CCE 16 01 CD         [ 4] 2189 	call parse_integer 
      008CD1 90 DF 4D         [ 2] 2190 	jp token_exit 
      000CC4                       2191 3$: 
      000CC4                       2192 	_case '(' bkslsh_tst 
      008CD4 26 03            [ 1]    1 	ld a,#'(' 
      008CD6 CC 89            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD8 66 05            [ 1]    3 	jrne bkslsh_tst
      008CD9 A6 07            [ 1] 2193 	ld a,#TK_LPAREN
      008CD9 16 01 90         [ 2] 2194 	jp token_char   	
      000CCF                       2195 bkslsh_tst: ; character token 
      000CCF                       2196 	_case '\',rparnt_tst
      008CDC F7 90            [ 1]    1 	ld a,#'\' 
      008CDE 5C 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE0 FF 72            [ 1]    3 	jrne rparnt_tst
      008CE2 A9 00            [ 1] 2197 	ld a,#TK_CHAR 
      008CE4 02               [ 1] 2198 	ld (x),a 
      008CE5 5B               [ 1] 2199 	incw x 
      008CE6 02 81 00         [ 4] 2200 	ld a,([in.w],y)
      008CE8 F7               [ 1] 2201 	ld (x),a 
      008CE8 52               [ 1] 2202 	incw x
      008CE9 02 93            [ 1] 2203 	ldw y,x 	 
      008CEA 72 5C 00 01      [ 1] 2204 	inc in  
      008CEA 90               [ 1] 2205 	clrw x 
      008CEB AE               [ 1] 2206 	ld xl,a 
      008CEC 16 90            [ 1] 2207 	ld a,#TK_CHAR 
      008CEE A6 20 CD         [ 2] 2208 	jp token_exit 
      000CEB                       2209 rparnt_tst:		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      000CEB                       2210 	_case ')' colon_tst 
      008CF1 8F 1D            [ 1]    1 	ld a,#')' 
      008CF3 55 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF5 02 00            [ 1]    3 	jrne colon_tst
      008CF7 03 91            [ 1] 2211 	ld a,#TK_RPAREN 
      008CF9 D6 01 26         [ 2] 2212 	jp token_char
      000CF6                       2213 colon_tst:
      000CF6                       2214 	_case ':' comma_tst 
      008CFC 05 90            [ 1]    1 	ld a,#':' 
      008CFE 93 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008D00 8E A4            [ 1]    3 	jrne comma_tst
      008D02 72 5C            [ 1] 2215 	ld a,#TK_COLON 
      008D04 00 02 CD         [ 2] 2216 	jp token_char  
      000D01                       2217 comma_tst:
      000D01                       2218 	_case COMMA sharp_tst 
      008D07 8E A7            [ 1]    1 	ld a,#COMMA 
      008D09 6B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0B 26 05            [ 1]    3 	jrne sharp_tst
      008D0B A6 22            [ 1] 2219 	ld a,#TK_COMMA
      008D0D 11 01 26         [ 2] 2220 	jp token_char
      000D0C                       2221 sharp_tst:
      000D0C                       2222 	_case SHARP dash_tst 
      008D10 0A A6            [ 1]    1 	ld a,#SHARP 
      008D12 02 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D14 5C CD            [ 1]    3 	jrne dash_tst
      008D16 8B BF            [ 1] 2223 	ld a,#TK_SHARP
      008D18 CC 8E A4         [ 2] 2224 	jp token_char  	 	 
      008D1B                       2225 dash_tst: 	
      000D17                       2226 	_case '-' at_tst 
      008D1B A6 24            [ 1]    1 	ld a,#'-' 
      008D1D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1F 27 17            [ 1]    3 	jrne at_tst
      008D21 A6 26            [ 1] 2227 	ld a,#TK_MINUS  
      008D23 11 01 26         [ 2] 2228 	jp token_char 
      000D22                       2229 at_tst:
      000D22                       2230 	_case '@' qmark_tst 
      008D26 0A A6            [ 1]    1 	ld a,#'@' 
      008D28 84 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2A 5C CD            [ 1]    3 	jrne qmark_tst
      008D2C 8C 5E            [ 1] 2231 	ld a,#TK_ARRAY 
      008D2E CC 8E A4         [ 2] 2232 	jp token_char
      000D2D                       2233 qmark_tst:
      000D2D                       2234 	_case '?' tick_tst 
      008D31 7B 01            [ 1]    1 	ld a,#'?' 
      008D33 CD 86            [ 1]    2 	cp a,(TCHAR,sp) 
      008D35 66 24            [ 1]    3 	jrne tick_tst
      008D37 0C A6            [ 1] 2235 	ld a,#TK_CMD  
      008D39 84               [ 1] 2236 	ld (x),a 
      008D3A F7               [ 1] 2237 	incw x 
      008D3B 5C 7B            [ 1] 2238 	ldw y,x 
      008D3D 01 CD 8C         [ 2] 2239 	ldw x,#PRT_IDX 
      008D40 14 CC            [ 2] 2240 	ldw (y),x 
      008D42 8E A4 00 02      [ 2] 2241 	addw y,#2
      008D44 CC 0E 24         [ 2] 2242 	jp token_exit
      000D45                       2243 tick_tst: ; comment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      000D45                       2244 	_case TICK plus_tst 
      008D44 A6 28            [ 1]    1 	ld a,#TICK 
      008D46 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D48 26 05            [ 1]    3 	jrne plus_tst
      008D4A A6 07            [ 1] 2245 	ld a,#TK_CMD
      008D4C CC               [ 1] 2246 	ld (x),a 
      008D4D 8E               [ 1] 2247 	incw x
      008D4E A0 AE 00 8E      [ 2] 2248 	ldw y,#REM_IDX
      008D4F FF               [ 2] 2249 	ldw (x),y 
      008D4F A6 5C 11         [ 2] 2250 	addw x,#2  
      000D57                       2251 copy_comment:
      008D52 01 26 16 A6      [ 2] 2252 	ldw y,#tib 
      008D56 03 F7 5C 91      [ 2] 2253 	addw y,in.w
      008D5A D6 01            [ 2] 2254 	pushw y
      008D5C F7 5C 90         [ 4] 2255 	call strcpy
      008D5F 93 72 5C         [ 2] 2256     subw y,(1,sp)
      008D62 00 02            [ 1] 2257 	ld a,yl 
      008D64 5F 97 A6         [ 1] 2258 	add a,in
      008D67 03 CC 8E         [ 1] 2259 	ld in,a 
      008D6A A4 01            [ 2] 2260 	ldw (1,sp),x
      008D6B 72 F9 01         [ 2] 2261 	addw y,(1,sp)
      008D6B A6 29            [ 1] 2262 	incw y 
      000D76                       2263 	_drop 2 
      008D6D 11 01            [ 2]    1     addw sp,#2 
      008D6F 26 05 A6         [ 2] 2264 	ldw x,#REM_IDX 
      008D72 08 CC            [ 1] 2265 	ld a,#TK_CMD 
      008D74 8E A0 24         [ 2] 2266 	jp token_exit 
      008D76                       2267 plus_tst:
      000D80                       2268 	_case '+' star_tst 
      008D76 A6 3A            [ 1]    1 	ld a,#'+' 
      008D78 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7A 26 05            [ 1]    3 	jrne star_tst
      008D7C A6 01            [ 1] 2269 	ld a,#TK_PLUS  
      008D7E CC 8E A0         [ 2] 2270 	jp token_char 
      008D81                       2271 star_tst:
      000D8B                       2272 	_case '*' slash_tst 
      008D81 A6 2C            [ 1]    1 	ld a,#'*' 
      008D83 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D85 26 05            [ 1]    3 	jrne slash_tst
      008D87 A6 09            [ 1] 2273 	ld a,#TK_MULT 
      008D89 CC 8E A0         [ 2] 2274 	jp token_char 
      008D8C                       2275 slash_tst: 
      000D96                       2276 	_case '/' prcnt_tst 
      008D8C A6 23            [ 1]    1 	ld a,#'/' 
      008D8E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D90 26 05            [ 1]    3 	jrne prcnt_tst
      008D92 A6 0A            [ 1] 2277 	ld a,#TK_DIV 
      008D94 CC 8E A0         [ 2] 2278 	jp token_char 
      008D97                       2279 prcnt_tst:
      000DA1                       2280 	_case '%' eql_tst 
      008D97 A6 2D            [ 1]    1 	ld a,#'%' 
      008D99 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9B 26 05            [ 1]    3 	jrne eql_tst
      008D9D A6 11            [ 1] 2281 	ld a,#TK_MOD
      008D9F CC 8E A0         [ 2] 2282 	jp token_char  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2283 ; 1 or 2 character tokens 	
      008DA2                       2284 eql_tst:
      000DAC                       2285 	_case '=' gt_tst 		
      008DA2 A6 40            [ 1]    1 	ld a,#'=' 
      008DA4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA6 26 05            [ 1]    3 	jrne gt_tst
      008DA8 A6 06            [ 1] 2286 	ld a,#TK_EQUAL
      008DAA CC 8E A0         [ 2] 2287 	jp token_char 
      008DAD                       2288 gt_tst:
      000DB7                       2289 	_case '>' lt_tst 
      008DAD A6 3F            [ 1]    1 	ld a,#'>' 
      008DAF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB1 26 12            [ 1]    3 	jrne lt_tst
      008DB3 A6 80            [ 1] 2290 	ld a,#TK_GT 
      008DB5 F7 5C            [ 1] 2291 	ld (ATTRIB,sp),a 
      008DB7 90 93 AE         [ 4] 2292 	ld a,([in.w],y)
      008DBA 00 74 90 FF      [ 1] 2293 	inc in 
      008DBE 72 A9            [ 1] 2294 	cp a,#'=
      008DC0 00 02            [ 1] 2295 	jrne 1$
      008DC2 CC 8E            [ 1] 2296 	ld a,#TK_GE 
      008DC4 A4 50            [ 2] 2297 	jra token_char  
      008DC5 A1 3C            [ 1] 2298 1$: cp a,#'<
      008DC5 A6 27            [ 1] 2299 	jrne 2$
      008DC7 11 01            [ 1] 2300 	ld a,#TK_NE 
      008DC9 26 35            [ 2] 2301 	jra token_char 
      008DCB A6 80 F7 5C      [ 1] 2302 2$: dec in
      008DCF 90 AE            [ 1] 2303 	ld a,(ATTRIB,sp)
      008DD1 00 8E            [ 2] 2304 	jra token_char 	 
      000DE0                       2305 lt_tst:
      000DE0                       2306 	_case '<' other
      008DD3 FF 1C            [ 1]    1 	ld a,#'<' 
      008DD5 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD7 26 23            [ 1]    3 	jrne other
      008DD7 90 AE            [ 1] 2307 	ld a,#TK_LT 
      008DD9 16 90            [ 1] 2308 	ld (ATTRIB,sp),a 
      008DDB 72 B9 00         [ 4] 2309 	ld a,([in.w],y)
      008DDE 01 90 89 CD      [ 1] 2310 	inc in 
      008DE2 84 96            [ 1] 2311 	cp a,#'=
      008DE4 72 F2            [ 1] 2312 	jrne 1$
      008DE6 01 90            [ 1] 2313 	ld a,#TK_LE 
      008DE8 9F CB            [ 2] 2314 	jra token_char 
      008DEA 00 02            [ 1] 2315 1$: cp a,#'>
      008DEC C7 00            [ 1] 2316 	jrne 2$
      008DEE 02 1F            [ 1] 2317 	ld a,#TK_NE 
      008DF0 01 72            [ 2] 2318 	jra token_char 
      008DF2 F9 01 90 5C      [ 1] 2319 2$: dec in 
      008DF6 5B 02            [ 1] 2320 	ld a,(ATTRIB,sp)
      008DF8 AE 00            [ 2] 2321 	jra token_char 	
      000E09                       2322 other: ; not a special character 	 
      008DFA 8E A6            [ 1] 2323 	ld a,(TCHAR,sp)
      008DFC 80 CC 8E         [ 4] 2324 	call is_alpha 
      008DFF A4 03            [ 1] 2325 	jrc 30$ 
      008E00 CC 08 E6         [ 2] 2326 	jp syntax_error 
      000E13                       2327 30$: 
      008E00 A6 2B 11         [ 4] 2328 	call parse_keyword
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E03 01 26 05         [ 2] 2329 	cpw x,#remark 
      008E06 A6 10            [ 1] 2330 	jrne token_exit 
      008E08 CC 8E            [ 1] 2331 	ldw y,x 
      008E0A A0 0D 57         [ 2] 2332 	jp copy_comment 
      008E0B                       2333 token_char:
      008E0B A6               [ 1] 2334 	ld (x),a 
      008E0C 2A               [ 1] 2335 	incw x
      008E0D 11 01            [ 1] 2336 	ldw y,x 
      000E24                       2337 token_exit:
      000E24                       2338 	_drop VSIZE 
      008E0F 26 05            [ 2]    1     addw sp,#VSIZE 
      008E11 A6               [ 4] 2339 	ret
                                   2340 
                                   2341 
                                   2342 ;------------------------------------
                                   2343 ; convert alpha to uppercase
                                   2344 ; input:
                                   2345 ;    a  character to convert
                                   2346 ; output:
                                   2347 ;    a  uppercase character
                                   2348 ;------------------------------------
      000E27                       2349 to_upper::
      008E12 20 CC            [ 1] 2350 	cp a,#'a
      008E14 8E A0            [ 1] 2351 	jrpl 1$
      008E16 81               [ 4] 2352 0$:	ret
      008E16 A6 2F            [ 1] 2353 1$: cp a,#'z	
      008E18 11 01            [ 1] 2354 	jrugt 0$
      008E1A 26 05            [ 1] 2355 	sub a,#32
      008E1C A6               [ 4] 2356 	ret
                                   2357 	
                                   2358 ;------------------------------------
                                   2359 ; convert pad content in integer
                                   2360 ; input:
                                   2361 ;    x		.asciz to convert
                                   2362 ; output:
                                   2363 ;    acc24      int24_t
                                   2364 ;------------------------------------
                                   2365 	; local variables
                           000001  2366 	SIGN=1 ; 1 byte, 
                           000002  2367 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2368 	TEMP=3 ; 1 byte, temporary storage
                           000003  2369 	VSIZE=3 ; 3 bytes reserved for local storage
      000E33                       2370 atoi24::
      008E1D 21               [ 2] 2371 	pushw x 
      000E34                       2372 	_vars VSIZE
      008E1E CC 8E            [ 2]    1     sub sp,#VSIZE 
                                   2373 	; acc24=0 
      008E20 A0 5F 00 0B      [ 1] 2374 	clr acc24    
      008E21 72 5F 00 0C      [ 1] 2375 	clr acc16
      008E21 A6 25 11 01      [ 1] 2376 	clr acc8 
      008E25 26 05            [ 1] 2377 	clr (SIGN,sp)
      008E27 A6 22            [ 1] 2378 	ld a,#10
      008E29 CC 8E            [ 1] 2379 	ld (BASE,sp),a ; default base decimal
      008E2B A0               [ 1] 2380 	ld a,(x)
      008E2C 27 47            [ 1] 2381 	jreq 9$  ; completed if 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E2C A6 3D            [ 1] 2382 	cp a,#'-
      008E2E 11 01            [ 1] 2383 	jrne 1$
      008E30 26 05            [ 1] 2384 	cpl (SIGN,sp)
      008E32 A6 32            [ 2] 2385 	jra 2$
      008E34 CC 8E            [ 1] 2386 1$: cp a,#'$
      008E36 A0 06            [ 1] 2387 	jrne 3$
      008E37 A6 10            [ 1] 2388 	ld a,#16
      008E37 A6 3E            [ 1] 2389 	ld (BASE,sp),a
      008E39 11               [ 1] 2390 2$:	incw x
      008E3A 01               [ 1] 2391 	ld a,(x)
      000E5D                       2392 3$:	
      008E3B 26 23            [ 1] 2393 	cp a,#'a
      008E3D A6 31            [ 1] 2394 	jrmi 4$
      008E3F 6B 02            [ 1] 2395 	sub a,#32
      008E41 91 D6            [ 1] 2396 4$:	cp a,#'0
      008E43 01 72            [ 1] 2397 	jrmi 9$
      008E45 5C 00            [ 1] 2398 	sub a,#'0
      008E47 02 A1            [ 1] 2399 	cp a,#10
      008E49 3D 26            [ 1] 2400 	jrmi 5$
      008E4B 04 A6            [ 1] 2401 	sub a,#7
      008E4D 33 20            [ 1] 2402 	cp a,(BASE,sp)
      008E4F 50 A1            [ 1] 2403 	jrpl 9$
      008E51 3C 26            [ 1] 2404 5$:	ld (TEMP,sp),a
      008E53 04 A6            [ 1] 2405 	ld a,(BASE,sp)
      008E55 35 20 48         [ 4] 2406 	call mulu24_8
      008E58 72 5A            [ 1] 2407 	ld a,(TEMP,sp)
      008E5A 00 02 7B         [ 1] 2408 	add a,acc24+2
      008E5D 02 20 40         [ 1] 2409 	ld acc24+2,a
      008E60 4F               [ 1] 2410 	clr a
      008E60 A6 3C 11         [ 1] 2411 	adc a,acc24+1
      008E63 01 26 23         [ 1] 2412 	ld acc24+1,a
      008E66 A6               [ 1] 2413 	clr a
      008E67 34 6B 02         [ 1] 2414 	adc a,acc24
      008E6A 91 D6 01         [ 1] 2415 	ld acc24,a
      008E6D 72 5C            [ 2] 2416 	jra 2$
      008E6F 00 02            [ 1] 2417 9$:	tnz (SIGN,sp)
      008E71 A1 3D            [ 1] 2418     jreq atoi_exit
      008E73 26 04 A6         [ 4] 2419     call neg_acc24
      000E99                       2420 atoi_exit: 
      000E99                       2421 	_drop VSIZE
      008E76 36 20            [ 2]    1     addw sp,#VSIZE 
      008E78 27               [ 2] 2422 	popw x ; restore x
      008E79 A1               [ 4] 2423 	ret
                                   2424 
                                   2425 
                                   2426 ;------------------------------------
                                   2427 ; skip character c in text starting from 'in'
                                   2428 ; input:
                                   2429 ;	 y 		point to text buffer
                                   2430 ;    a 		character to skip
                                   2431 ; output:  
                                   2432 ;	'in' ajusted to new position
                                   2433 ;------------------------------------
                           000001  2434 	C = 1 ; local var
      000E9D                       2435 skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E7A 3E               [ 1] 2436 	push a
      008E7B 26 04 A6         [ 4] 2437 1$:	ld a,([in.w],y)
      008E7E 35 20            [ 1] 2438 	jreq 2$
      008E80 1F 72            [ 1] 2439 	cp a,(C,sp)
      008E82 5A 00            [ 1] 2440 	jrne 2$
      008E84 02 7B 02 20      [ 1] 2441 	inc in
      008E88 17 F1            [ 2] 2442 	jra 1$
      008E89                       2443 2$: _drop 1 
      008E89 7B 01            [ 2]    1     addw sp,#1 
      008E8B CD               [ 4] 2444 	ret
                                   2445 	
                                   2446 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2447 ;;   TINY BASIC  operators,
                                   2448 ;;   commands and functions 
                                   2449 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2450 
                                   2451 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2452 ;;  Arithmetic operators
                                   2453 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2454 
                                   2455 ;debug support
                           000001  2456 DEBUG_PRT=1
                           000001  2457 .if DEBUG_PRT 
                           000001  2458 	REGA=1
                           000002  2459 	SAVEB=2
                           000003  2460 	REGX=3
                           000005  2461 	REGY=5
                           000007  2462 	ACC24=7
                           000009  2463 	VSIZE=9 
      000EB0                       2464 printxy:
      000EB0                       2465 	_vars VSIZE 
      008E8C 86 55            [ 2]    1     sub sp,#VSIZE 
      008E8E 25 03            [ 1] 2466 	ld (REGA,sp),a 
      008E90 CC 89 66         [ 1] 2467 	ld a,base 
      008E93 6B 02            [ 1] 2468 	ld (SAVEB,sp),a
      008E93 CD 8C            [ 2] 2469 	ldw (REGX,sp),x
      008E95 9B A3            [ 2] 2470 	ldw (REGY,sp),y
      008E97 97 1C 26         [ 2] 2471 	ldw x,acc24 
      008E9A 09 90 93         [ 1] 2472 	ld a,acc8 
      008E9D CC 8D            [ 2] 2473 	ldw (ACC24,sp),x 
      008E9F D7 09            [ 1] 2474 	ld (ACC24+2,sp),a 
      008EA0 35 10 00 0A      [ 1] 2475 	mov base,#16 
      008EA0 F7               [ 1] 2476 	clrw x 
      008EA1 5C 90            [ 1] 2477 	ld a,(REGA,sp)
      008EA3 93               [ 1] 2478 	ld xl,a 
      008EA4 CD 0A 39         [ 4] 2479 	call print_int
      008EA4 5B 02            [ 1] 2480 	ld a,#SPACE 
      008EA6 81 02 F8         [ 4] 2481 	call putc  
      008EA7 1E 03            [ 2] 2482 	ldw x,(REGX,sp)
      008EA7 A1 61 2A         [ 4] 2483 	call print_int 
      008EAA 01 81            [ 1] 2484 	ld a,#SPACE 
      008EAC A1 7A 22         [ 4] 2485 	call putc  
      008EAF FB A0            [ 2] 2486 	ldw x,(REGY,sp)
      008EB1 20 81 39         [ 4] 2487 	call print_int 
      008EB3 A6 0D            [ 1] 2488 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EB3 89 52 03         [ 4] 2489 	call putc 
      008EB6 72 5F            [ 1] 2490 	ld a,(ACC24+2,sp)
      008EB8 00 0C            [ 2] 2491 	ldw x,(ACC24,sp)
      008EBA 72 5F 00         [ 2] 2492 	ldw acc24,x 
      008EBD 0D 72 5F         [ 1] 2493 	ld acc8,a
      008EC0 00 0E            [ 1] 2494 	ld a,(SAVEB,sp)
      008EC2 0F 01 A6         [ 1] 2495 	ld base,a 
      008EC5 0A 6B            [ 1] 2496 	ld a,(REGA,sp)
      008EC7 02 F6            [ 2] 2497 	ldw x,(REGX,sp)
      008EC9 27 47            [ 2] 2498 	ldw y,(REGY,sp)
      000F00                       2499 	_drop VSIZE 
      008ECB A1 2D            [ 2]    1     addw sp,#VSIZE 
      008ECD 26               [ 4] 2500 	ret 
                                   2501 .endif 
                                   2502 
                                   2503 
                                   2504 ;--------------------------------------
                                   2505 ;  multiply 2 uint16_t return uint32_t
                                   2506 ;  input:
                                   2507 ;     x       uint16_t 
                                   2508 ;     y       uint16_t 
                                   2509 ;  output:
                                   2510 ;     x       product bits 15..0
                                   2511 ;     y       product bits 31..16 
                                   2512 ;---------------------------------------
                           000001  2513 		U1=1  ; uint16_t 
                           000003  2514 		DBL=3 ; uint32_t
                           000006  2515 		VSIZE=6
      000F03                       2516 umstar:
      000F03                       2517 	_vars VSIZE 
      008ECE 04 03            [ 2]    1     sub sp,#VSIZE 
      008ED0 01 20            [ 2] 2518 	ldw (U1,sp),x 
                                   2519 ;initialize bits 31..16 of 
                                   2520 ;product to zero 
      008ED2 08 A1            [ 1] 2521 	clr (DBL,sp)
      008ED4 24 26            [ 1] 2522 	clr (DBL+1,sp)
                                   2523 ; produc U1L*U2L 
      008ED6 06 A6            [ 1] 2524 	ld a,yl 
      008ED8 10               [ 4] 2525 	mul x,a 
      008ED9 6B 02            [ 2] 2526 	ldw (DBL+2,sp),x
                                   2527 ; product U1H*U2L 
      008EDB 5C F6            [ 1] 2528 	ld a,(U1,sp) ; xh 
      008EDD 93               [ 1] 2529 	ldw x,y
      008EDD A1               [ 4] 2530 	mul x,a 
      008EDE 61               [ 1] 2531 	clr a 
      008EDF 2B 02 A0         [ 2] 2532 	addw x,(DBL+1,sp) 
      008EE2 20               [ 1] 2533 	clr a 
      008EE3 A1 30            [ 1] 2534 	adc a,(DBL,sp) 
      008EE5 2B 2B            [ 1] 2535 	ld (DBL,sp),a ; bits 23..17 
      008EE7 A0 30            [ 2] 2536 	ldw (DBL+1,sp),x ; bits 15..0 
                                   2537 ; product U1L*U2H
      008EE9 A1 0A            [ 1] 2538 	swapw y 
      008EEB 2B               [ 1] 2539 	ldw x,y
      008EEC 06 A0            [ 1] 2540 	ld a,(U1+1,sp)
      008EEE 07               [ 4] 2541 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EEF 11 02 2A         [ 2] 2542 	addw x,(DBL+1,sp)
      008EF2 1F               [ 1] 2543 	clr a 
      008EF3 6B 03            [ 1] 2544 	adc a,(DBL,sp)
      008EF5 7B 02            [ 1] 2545 	ld (DBL,sp),a 
      008EF7 CD 8B            [ 2] 2546 	ldw (DBL+1,sp),x 
                                   2547 ; product U1H*U2H 	
      008EF9 62 7B            [ 1] 2548 	ld a,(U1,sp)
      008EFB 03               [ 1] 2549 	ldw x,y  
      008EFC CB               [ 4] 2550 	mul x,a 
      008EFD 00 0E C7         [ 2] 2551 	addw x,(DBL,sp)
      008F00 00 0E            [ 1] 2552 	ldw y,x 
      008F02 4F C9            [ 2] 2553 	ldw x,(DBL+2,sp)
      000F3A                       2554 	_drop VSIZE 
      008F04 00 0D            [ 2]    1     addw sp,#VSIZE 
      008F06 C7               [ 4] 2555 	ret
                                   2556 
                                   2557 
                                   2558 ;-------------------------------------
                                   2559 ; multiply 2 integers
                                   2560 ; input:
                                   2561 ;  	x       n1 
                                   2562 ;   y 		n2 
                                   2563 ; output:
                                   2564 ;	X        N1*N2 bits 15..0
                                   2565 ;   Y        N1*N2 bits 31..16 
                                   2566 ;-------------------------------------
                           000001  2567 	SIGN=1
                           000001  2568 	VSIZE=1
      000F3D                       2569 multiply:
      000F3D                       2570 	_vars VSIZE 
      008F07 00 0D            [ 2]    1     sub sp,#VSIZE 
      008F09 4F C9            [ 1] 2571 	clr (SIGN,sp)
      008F0B 00               [ 1] 2572 	ld a,xh 
      008F0C 0C C7            [ 1] 2573 	and a,#0x80
      008F0E 00 0C            [ 1] 2574 	jrpl 1$
      008F10 20 C9            [ 1] 2575 	cpl (SIGN,sp)
      008F12 0D               [ 2] 2576 	negw x 
      000F49                       2577 1$:	
      008F13 01 27            [ 1] 2578 	ld a,yh
      008F15 03 CD            [ 1] 2579 	and a,#0x80  
      008F17 8B 9C            [ 1] 2580 	jrpl 2$ 
      008F19 03 01            [ 1] 2581 	cpl (SIGN,sp)
      008F19 5B 03            [ 2] 2582 	negw y 
      000F53                       2583 2$:	
      008F1B 85 81 03         [ 4] 2584 	call umstar
      008F1D 7B 01            [ 1] 2585 	ld a,(SIGN,sp)
      008F1D 88 91            [ 1] 2586 	jreq 3$
      008F1F D6 01 27         [ 4] 2587 	call dneg 
      000F5D                       2588 3$:	
      000F5D                       2589 	_drop VSIZE 
      008F22 0A 11            [ 2]    1     addw sp,#VSIZE 
      008F24 01               [ 4] 2590 	ret
                                   2591 
                                   2592 ;--------------------------------------
                                   2593 ; divide uint32_t/uint16_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2594 ; return:  quotient and remainder 
                                   2595 ; quotient expected to be uint16_t 
                                   2596 ; input:
                                   2597 ;   DBLDIVDND    on stack 
                                   2598 ;   X            divisor 
                                   2599 ; output:
                                   2600 ;   X            quotient 
                                   2601 ;   Y            remainder 
                                   2602 ;---------------------------------------
                           000003  2603 	VSIZE=3
      000F60                       2604 	_argofs VSIZE 
                           000005     1     ARG_OFS=2+VSIZE 
      000F60                       2605 	_arg DBLDIVDND 1
                           000006     1     DBLDIVDND=ARG_OFS+1 
                                   2606 	; local variables 
                           000001  2607 	DIVISOR=1 
                           000003  2608 	CNTR=3 
      000F60                       2609 udiv32_16:
      000F60                       2610 	_vars VSIZE 
      008F25 26 06            [ 2]    1     sub sp,#VSIZE 
      008F27 72 5C            [ 2] 2611 	ldw (DIVISOR,sp),x	; save divisor 
      008F29 00 02            [ 2] 2612 	ldw x,(DBLDIVDND+2,sp)  ; bits 15..0
      008F2B 20 F1            [ 2] 2613 	ldw y,(DBLDIVDND,sp) ; bits 31..16
      008F2D 5B 01            [ 2] 2614 	tnzw y
      008F2F 81 06            [ 1] 2615 	jrne long_division 
      008F30 16 01            [ 2] 2616 	ldw y,(DIVISOR,sp)
      008F30 52               [ 2] 2617 	divw x,y
      000F6F                       2618 	_drop VSIZE 
      008F31 09 6B            [ 2]    1     addw sp,#VSIZE 
      008F33 01               [ 4] 2619 	ret
      000F72                       2620 long_division:
      008F34 C6               [ 1] 2621 	exgw x,y ; hi in x, lo in y 
      008F35 00 0B            [ 1] 2622 	ld a,#17 
      008F37 6B 02            [ 1] 2623 	ld (CNTR,sp),a
      000F77                       2624 1$:
      008F39 1F 03            [ 2] 2625 	cpw x,(DIVISOR,sp)
      008F3B 17 05            [ 1] 2626 	jrmi 2$
      008F3D CE 00 0C         [ 2] 2627 	subw x,(DIVISOR,sp)
      008F40 C6               [ 1] 2628 2$:	ccf 
      008F41 00 0E            [ 2] 2629 	rlcw y 
      008F43 1F               [ 2] 2630 	rlcw x 
      008F44 07 6B            [ 1] 2631 	dec (CNTR,sp)
      008F46 09 35            [ 1] 2632 	jrne 1$
      008F48 10               [ 1] 2633 	exgw x,y 
      000F87                       2634 	_drop VSIZE 
      008F49 00 0B            [ 2]    1     addw sp,#VSIZE 
      008F4B 5F               [ 4] 2635 	ret
                                   2636 
                                   2637 ;-----------------------------
                                   2638 ; negate double int.
                                   2639 ; input:
                                   2640 ;   x     bits 15..0
                                   2641 ;   y     bits 31..16
                                   2642 ; output: 
                                   2643 ;   x     bits 15..0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2644 ;   y     bits 31..16
                                   2645 ;-----------------------------
      000F8A                       2646 dneg:
      008F4C 7B               [ 2] 2647 	cplw x 
      008F4D 01 97            [ 2] 2648 	cplw y 
      008F4F CD 8A B9         [ 2] 2649 	addw x,#1 
      008F52 A6 20            [ 1] 2650 	jrnc 1$
      008F54 CD 83            [ 1] 2651 	incw y 
      008F56 78               [ 4] 2652 1$: ret 
                                   2653 
                                   2654 
                                   2655 ;--------------------------------
                                   2656 ; sign extend single to double
                                   2657 ; input:
                                   2658 ;   x    int16_t
                                   2659 ; output:
                                   2660 ;   x    int32_t bits 15..0
                                   2661 ;   y    int32_t bits 31..16
                                   2662 ;--------------------------------
      000F95                       2663 dbl_sign_extend:
      008F57 1E 03            [ 1] 2664 	clrw y
      008F59 CD               [ 1] 2665 	ld a,xh 
      008F5A 8A B9            [ 1] 2666 	and a,#0x80 
      008F5C A6 20            [ 1] 2667 	jreq 1$
      008F5E CD 83            [ 2] 2668 	cplw y
      008F60 78               [ 4] 2669 1$: ret 	
                                   2670 
                                   2671 
                                   2672 ;----------------------------------
                                   2673 ;  euclidian divide dbl/n1 
                                   2674 ;  ref: https://en.wikipedia.org/wiki/Euclidean_division
                                   2675 ; input:
                                   2676 ;    dbl    int32_t on stack 
                                   2677 ;    x 		n1   int16_t  disivor  
                                   2678 ; output:
                                   2679 ;    X      dbl/x  int16_t 
                                   2680 ;    Y      remainder int16_t 
                                   2681 ;----------------------------------
                           000008  2682 	VSIZE=8
      000F9F                       2683 	_argofs VSIZE 
                           00000A     1     ARG_OFS=2+VSIZE 
      000F9F                       2684 	_arg DIVDNDHI 1 
                           00000B     1     DIVDNDHI=ARG_OFS+1 
      000F9F                       2685 	_arg DIVDNDLO 3
                           00000D     1     DIVDNDLO=ARG_OFS+3 
                                   2686 	; local variables
                           000001  2687 	DBLHI=1
                           000003  2688 	DBLLO=3 
                           000005  2689 	SDIVSR=5 ; sign divisor
                           000006  2690 	SQUOT=6 ; sign dividend 
                           000007  2691 	DIVISR=7 ; divisor 
      000F9F                       2692 div32_16:
      000F9F                       2693 	_vars VSIZE 
      008F61 1E 05            [ 2]    1     sub sp,#VSIZE 
      008F63 CD 8A            [ 1] 2694 	clr (SDIVSR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F65 B9 A6            [ 1] 2695 	clr (SQUOT,sp)
                                   2696 ; copy arguments 
      008F67 0D CD            [ 2] 2697 	ldw y,(DIVDNDHI,sp)
      008F69 83 78            [ 2] 2698 	ldw (DBLHI,sp),y
      008F6B 7B 09            [ 2] 2699 	ldw y,(DIVDNDLO,sp)
      008F6D 1E 07            [ 2] 2700 	ldw (DBLLO,sp),y 
                                   2701 ; check for 0 divisor
      008F6F CF               [ 2] 2702 	tnzw x 
      008F70 00 0C            [ 1] 2703     jrne 0$
      008F72 C7 00            [ 1] 2704 	ld a,#ERR_DIV0 
      008F74 0E 7B 02         [ 2] 2705 	jp tb_error 
                                   2706 ; check divisor sign 	
      008F77 C7               [ 1] 2707 0$:	ld a,xh 
      008F78 00 0B            [ 1] 2708 	and a,#0x80 
      008F7A 7B 01            [ 1] 2709 	jreq 1$
      008F7C 1E 03            [ 1] 2710 	cpl (SDIVSR,sp)
      008F7E 16 05            [ 1] 2711 	cpl (SQUOT,sp)
      008F80 5B               [ 2] 2712 	negw x
      008F81 09 81            [ 2] 2713 1$:	ldw (DIVISR,sp),x
                                   2714 ; check dividend sign 	 
      008F83 7B 01            [ 1] 2715  	ld a,(DBLHI,sp) 
      008F83 52 06            [ 1] 2716 	and a,#0x80 
      008F85 1F 01            [ 1] 2717 	jreq 2$ 
      008F87 0F 03            [ 1] 2718 	cpl (SQUOT,sp)
      008F89 0F 04            [ 2] 2719 	ldw x,(DBLLO,sp)
      008F8B 90 9F            [ 2] 2720 	ldw y,(DBLHI,sp)
      008F8D 42 1F 05         [ 4] 2721 	call dneg 
      008F90 7B 01            [ 2] 2722 	ldw (DBLLO,sp),x 
      008F92 93 42            [ 2] 2723 	ldw (DBLHI,sp),y 
      008F94 4F 72            [ 2] 2724 2$:	ldw x,(DIVISR,sp)
      008F96 FB 04 4F         [ 4] 2725 	call udiv32_16
      008F99 19 03            [ 2] 2726 	tnzw y 
      008F9B 6B 03            [ 1] 2727 	jreq 3$ 
                                   2728 ; x=quotient 
                                   2729 ; y=remainder 
                                   2730 ; if SDIVSR XOR SQUOT increment quotient and remainder.
      008F9D 1F 04            [ 1] 2731 	ld a,(SQUOT,sp)
      008F9F 90 5E            [ 1] 2732 	xor a,(SDIVSR,sp)
      008FA1 93 7B            [ 1] 2733 	jreq 3$
      008FA3 02               [ 1] 2734 	incw x 
      008FA4 42 72 FB 04      [ 2] 2735 	ldw acc16,y 
      008FA8 4F 19            [ 2] 2736 	ldw y,(DIVISR,sp)
      008FAA 03 6B 03 1F      [ 2] 2737 	subw y,acc16
                                   2738 ; sign quotient
      008FAE 04 7B            [ 1] 2739 3$:	ld a,(SQUOT,sp)
      008FB0 01 93            [ 1] 2740 	jreq 4$
      008FB2 42               [ 2] 2741 	negw x 
      000FF3                       2742 4$:	
      000FF3                       2743 	_drop VSIZE 
      008FB3 72 FB            [ 2]    1     addw sp,#VSIZE 
      008FB5 03               [ 4] 2744 	ret 
                                   2745 
                                   2746 
                                   2747 
                                   2748 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2749 ; division x/y 
                                   2750 ; input:
                                   2751 ;    X       dividend
                                   2752 ;    Y       divisor 
                                   2753 ; output:
                                   2754 ;    X       quotient
                                   2755 ;    Y       remainder 
                                   2756 ;-----------------------------------
                           000004  2757 	VSIZE=4 
                                   2758 	; local variables 
                           000001  2759 	DBLHI=1
                           000003  2760 	DBLLO=3
      000FF6                       2761 divide: 
      000FF6                       2762 	_vars VSIZE 
      008FB6 90 93            [ 2]    1     sub sp,#VSIZE 
      008FB8 1E 05 5B 06      [ 2] 2763 	ldw acc16,y
      008FBC 81 0F 95         [ 4] 2764 	call dbl_sign_extend
      008FBD 1F 03            [ 2] 2765 	ldw (DBLLO,sp),x 
      008FBD 52 01            [ 2] 2766 	ldw (DBLHI,sp),y 
      008FBF 0F 01 9E         [ 2] 2767 	ldw x,acc16 
      008FC2 A4 80 2A         [ 4] 2768 	call div32_16 
      001009                       2769 	_drop VSIZE 
      008FC5 03 03            [ 2]    1     addw sp,#VSIZE 
      008FC7 01               [ 4] 2770 	ret
                                   2771 
                                   2772 
                                   2773 ;----------------------------------
                                   2774 ;  remainder resulting from euclidian 
                                   2775 ;  division of x/y 
                                   2776 ; input:
                                   2777 ;   x   	dividend int16_t 
                                   2778 ;   y 		divisor int16_t
                                   2779 ; output:
                                   2780 ;   X       n1%n2 
                                   2781 ;----------------------------------
      00100C                       2782 modulo:
      008FC8 50 0F F6         [ 4] 2783 	call divide
      008FC9 93               [ 1] 2784 	ldw x,y 
      008FC9 90               [ 4] 2785 	ret 
                                   2786 
                                   2787 ;----------------------------------
                                   2788 ; BASIC: MULDIV(expr1,expr2,expr3)
                                   2789 ; return expr1*expr2/expr3 
                                   2790 ; product result is int32_t and 
                                   2791 ; divisiont is int32_t/int16_t
                                   2792 ;----------------------------------
                           000004  2793 	DBL_SIZE=4 
      001011                       2794 muldiv:
      008FCA 9E A4 80         [ 4] 2795 	call func_args 
      008FCD 2A 04            [ 1] 2796 	cp a,#3 
      008FCF 03 01            [ 1] 2797 	jreq 1$
      008FD1 90 50 E6         [ 2] 2798 	jp syntax_error
      008FD3                       2799 1$: 
      008FD3 CD 8F            [ 2] 2800 	ldw x,(5,sp) ; expr1
      008FD5 83 7B            [ 2] 2801 	ldw y,(3,sp) ; expr2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FD7 01 27 03         [ 4] 2802 	call multiply 
      008FDA CD 90            [ 2] 2803 	ldw (5,sp),x  ;int32_t 15..0
      008FDC 0A 03            [ 2] 2804 	ldw (3,sp),y  ;int32_t 31..16
      008FDD 85               [ 2] 2805 	popw x        ; expr3 
      008FDD 5B 01 81         [ 4] 2806 	call div32_16 ; int32_t/expr3 
      008FE0                       2807 	_drop DBL_SIZE
      008FE0 52 03            [ 2]    1     addw sp,#DBL_SIZE 
      008FE2 1F               [ 4] 2808 	ret 
                                   2809 
                                   2810 
                                   2811 ;----------------------------------
                                   2812 ; search in kword_dict name
                                   2813 ; from its execution address 
                                   2814 ; input:
                                   2815 ;   X       	cmd_index 
                                   2816 ; output:
                                   2817 ;   X 			cstr*  | 0 
                                   2818 ;--------------------------------
                           000001  2819 	CMDX=1 
                           000003  2820 	LINK=3 
                           000004  2821 	VSIZE=4
      00102D                       2822 cmd_name:
      00102D                       2823 	_vars VSIZE 
      008FE3 01 1E            [ 2]    1     sub sp,#VSIZE 
      008FE5 08 16 06 90      [ 1] 2824 	clr acc16 
      008FE9 5D 26            [ 2] 2825 	ldw (CMDX,sp),x  
      008FEB 06 16 01         [ 2] 2826 	ldw x,#kword_dict	
      008FEE 65 5B            [ 2] 2827 1$:	ldw (LINK,sp),x
      008FF0 03 81            [ 1] 2828 	ld a,(2,x)
      008FF2 A4 0F            [ 1] 2829 	and a,#15 
      008FF2 51 A6 11         [ 1] 2830 	ld acc8,a 
      008FF5 6B 03 03         [ 2] 2831 	addw x,#3
      008FF7 72 BB 00 0C      [ 2] 2832 	addw x,acc16
      008FF7 13               [ 2] 2833 	ldw x,(x) ; command index  
      008FF8 01 2B            [ 2] 2834 	cpw x,(CMDX,sp)
      008FFA 03 72            [ 1] 2835 	jreq 2$
      008FFC F0 01            [ 2] 2836 	ldw x,(LINK,sp)
      008FFE 8C               [ 2] 2837 	ldw x,(x) 
      008FFF 90 59 59         [ 2] 2838 	subw x,#2  
      009002 0A 03            [ 1] 2839 	jrne 1$
      009004 26 F1            [ 2] 2840 	jra 9$
      009006 51 5B            [ 2] 2841 2$: ldw x,(LINK,sp)
      009008 03 81 02         [ 2] 2842 	addw x,#2 	
      00900A                       2843 9$:	_drop VSIZE
      00900A 53 90            [ 2]    1     addw sp,#VSIZE 
      00900C 53               [ 4] 2844 	ret
                                   2845 
                                   2846 
                                   2847 ;---------------------------------
                                   2848 ; dictionary search 
                                   2849 ; input:
                                   2850 ;	X 		dictionary entry point, name field  
                                   2851 ;   y		.asciz name to search 
                                   2852 ; output:
                                   2853 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2854 ;  X		cmd_index ; execution address | 0 
                                   2855 ;---------------------------------
                           000001  2856 	NLEN=1 ; cmd length 
                           000002  2857 	XSAVE=2
                           000004  2858 	YSAVE=4
                           000005  2859 	VSIZE=5 
      00105F                       2860 search_dict:
      00105F                       2861 	_vars VSIZE 
      00900D 1C 00            [ 2]    1     sub sp,#VSIZE 
                                   2862 
      00900F 01 24            [ 2] 2863 	ldw (YSAVE,sp),y 
      001063                       2864 search_next:
      009011 02 90            [ 2] 2865 	ldw (XSAVE,sp),x 
                                   2866 ; get name length in dictionary	
      009013 5C               [ 1] 2867 	ld a,(x)
      009014 81 0F            [ 1] 2868 	and a,#0xf 
      009015 6B 01            [ 1] 2869 	ld (NLEN,sp),a  
      009015 90 5F            [ 2] 2870 	ldw y,(YSAVE,sp) ; name pointer 
      009017 9E               [ 1] 2871 	incw x 
      00106D                       2872 cp_loop:
      009018 A4 80            [ 1] 2873 	ld a,(y)
      00901A 27 02            [ 1] 2874 	jreq str_match 
      00901C 90 53            [ 1] 2875 	tnz (NLEN,sp)
      00901E 81 0A            [ 1] 2876 	jreq no_match  
      00901F F1               [ 1] 2877 	cp a,(x)
      00901F 52 08            [ 1] 2878 	jrne no_match 
      009021 0F 05            [ 1] 2879 	incw y 
      009023 0F               [ 1] 2880 	incw x
      009024 06 16            [ 1] 2881 	dec (NLEN,sp)
      009026 0B 17            [ 2] 2882 	jra cp_loop 
      00107F                       2883 no_match:
      009028 01 16            [ 2] 2884 	ldw x,(XSAVE,sp) 
      00902A 0D 17 03         [ 2] 2885 	subw x,#2 ; move X to link field
      00902D 5D 26            [ 1] 2886 	push #TK_NONE 
      00902F 05               [ 2] 2887 	ldw x,(x) ; next word link 
      009030 A6               [ 1] 2888 	pop a ; TK_NONE 
      009031 04 CC            [ 1] 2889 	jreq search_exit  ; not found  
                                   2890 ;try next 
      009033 89 68            [ 2] 2891 	jra search_next
      00108C                       2892 str_match:
      009035 9E A4            [ 2] 2893 	ldw x,(XSAVE,sp)
      009037 80               [ 1] 2894 	ld a,(X)
      009038 27 05            [ 1] 2895 	ld (NLEN,sp),a ; needed to test keyword type  
      00903A 03 05            [ 1] 2896 	and a,#0xf 
                                   2897 ; move x to procedure address field 	
      00903C 03               [ 1] 2898 	inc a 
      00903D 06 50 1F         [ 1] 2899 	ld acc8,a 
      009040 07 7B 01 A4      [ 1] 2900 	clr acc16 
      009044 80 27 0D 03      [ 2] 2901 	addw x,acc16 
      009048 06               [ 2] 2902 	ldw x,(x) ; routine index  
                                   2903 ;determine keyword type bits 7:6 
      009049 1E 03            [ 1] 2904 	ld a,(NLEN,sp)
      00904B 16               [ 1] 2905 	swap a 
      00904C 01 CD            [ 1] 2906 	and a,#0xc
      00904E 90               [ 1] 2907 	srl a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00904F 0A               [ 1] 2908 	srl a 
      009050 1F 03            [ 1] 2909 	add a,#128
      0010A9                       2910 search_exit: 
      0010A9                       2911 	_drop VSIZE 	 
      009052 17 01            [ 2]    1     addw sp,#VSIZE 
      009054 1E               [ 4] 2912 	ret 
                                   2913 
                                   2914 ;---------------------
                                   2915 ; check if next token
                                   2916 ;  is of expected type 
                                   2917 ; input:
                                   2918 ;   A 		 expected token attribute
                                   2919 ;  ouput:
                                   2920 ;   none     if fail call syntax_error 
                                   2921 ;--------------------
      0010AC                       2922 expect:
      009055 07               [ 1] 2923 	push a 
      009056 CD 8F E0         [ 4] 2924 	call next_token 
      009059 90 5D            [ 1] 2925 	cp a,(1,sp)
      00905B 27 11            [ 1] 2926 	jreq 1$
      00905D 7B 06 18         [ 2] 2927 	jp syntax_error
      009060 05               [ 1] 2928 1$: pop a 
      009061 27               [ 4] 2929 	ret 
                                   2930 
                                   2931 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2932 ; parse arguments list 
                                   2933 ; between ()
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0010B9                       2935 func_args:
      009062 0B 5C            [ 1] 2936 	ld a,#TK_LPAREN 
      009064 90 CF 00         [ 4] 2937 	call expect 
                                   2938 ; expected to continue in arg_list 
                                   2939 ; caller must check for TK_RPAREN 
                                   2940 
                                   2941 ;-------------------------------
                                   2942 ; parse embedded BASIC routines 
                                   2943 ; arguments list.
                                   2944 ; arg_list::=  rel[','rel]*
                                   2945 ; all arguments are of integer type
                                   2946 ; and pushed on stack 
                                   2947 ; input:
                                   2948 ;   none
                                   2949 ; output:
                                   2950 ;   stack{n}   arguments pushed on stack
                                   2951 ;   A 	number of arguments pushed on stack  
                                   2952 ;--------------------------------
      0010BE                       2953 arg_list:
      009067 0D 16            [ 1] 2954 	push #0  
      009069 07 72 B2         [ 4] 2955 1$: call relation
      00906C 00 0D            [ 1] 2956 	cp a,#TK_NONE 
      00906E 7B 06            [ 1] 2957 	jreq 5$
      009070 27 01            [ 1] 2958 	cp a,#TK_INTGR
      009072 50 13            [ 1] 2959 	jrne 4$
      009073                       2960 3$: 
                                   2961 ; swap return address with argument
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009073 5B               [ 1] 2962 	pop a ; arg_count
      009074 08 81            [ 2] 2963 	popw y ; return address 
      009076 89               [ 2] 2964 	pushw x ; new argument 
      009076 52 04            [ 2] 2965 	pushw y 
      009078 90               [ 1] 2966     inc a
      009079 CF               [ 1] 2967 	push a 
      00907A 00 0D CD         [ 4] 2968 	call next_token 
      00907D 90 15            [ 1] 2969 	cp a,#TK_COMMA 
      00907F 1F 03            [ 1] 2970 	jreq 1$ 
      009081 17 01            [ 1] 2971 	cp a,#TK_NONE 
      009083 CE 00            [ 1] 2972 	jreq 5$ 
      009085 0D CD            [ 1] 2973 4$:	cp a,#TK_RPAREN 
      009087 90 1F            [ 1] 2974 	jreq 5$
      0010E2                       2975 	_unget_token 
      009089 5B 04 81 00 01   [ 1]    1      mov in,in.saved  
      00908C 84               [ 1] 2976 5$:	pop a  
      00908C CD               [ 4] 2977 	ret 
                                   2978 
                                   2979 ;--------------------------------
                                   2980 ;   BASIC commnands 
                                   2981 ;--------------------------------
                                   2982 
                                   2983 ;--------------------------------
                                   2984 ;  arithmetic and relational 
                                   2985 ;  routines
                                   2986 ;  operators precedence
                                   2987 ;  highest to lowest
                                   2988 ;  operators on same row have 
                                   2989 ;  same precedence and are executed
                                   2990 ;  from left to right.
                                   2991 ;	'*','/','%'
                                   2992 ;   '-','+'
                                   2993 ;   '=','>','<','>=','<=','<>','><'
                                   2994 ;   '<>' and '><' are equivalent for not equal.
                                   2995 ;--------------------------------
                                   2996 
                                   2997 ;---------------------
                                   2998 ; return array element
                                   2999 ; address from @(expr)
                                   3000 ; input:
                                   3001 ;   A 		TK_ARRAY
                                   3002 ; output:
                                   3003 ;   A 		TK_INTGR
                                   3004 ;	X 		element address 
                                   3005 ;----------------------
      0010E9                       3006 get_array_element:
      00908D 90 76 93         [ 4] 3007 	call func_args 
      009090 81 01            [ 1] 3008 	cp a,#1
      009091 27 03            [ 1] 3009 	jreq 1$
      009091 CD 91 39         [ 2] 3010 	jp syntax_error
      009094 A1               [ 2] 3011 1$: popw x 
                                   3012 	; check for bounds 
      009095 03 27 03         [ 2] 3013 	cpw x,array_size 
      009098 CC 89            [ 2] 3014 	jrule 3$
                                   3015 ; bounds {1..array_size}	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00909A 66 0A            [ 1] 3016 2$: ld a,#ERR_BAD_VALUE 
      00909B CC 08 E8         [ 2] 3017 	jp tb_error 
      00909B 1E               [ 2] 3018 3$: tnzw  x
      00909C 05 16            [ 1] 3019 	jreq 2$ 
      00909E 03               [ 2] 3020 	sllw x 
      00909F CD               [ 2] 3021 	pushw x 
      0090A0 8F BD 1F         [ 2] 3022 	ldw x,#tib
      0090A3 05 17 03         [ 2] 3023 	subw x,(1,sp)
      001109                       3024 	_drop 2   
      0090A6 85 CD            [ 2]    1     addw sp,#2 
      0090A8 90 1F            [ 1] 3025 	ld a,#TK_INTGR
      0090AA 5B               [ 4] 3026 	ret 
                                   3027 
                                   3028 
                                   3029 ;***********************************
                                   3030 ;   expression parse,execute 
                                   3031 ;***********************************
                                   3032 ;-----------------------------------
                                   3033 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3034 ;			 integer | function |
                                   3035 ;			 '('relation')' 
                                   3036 ; output:
                                   3037 ;   A    token attribute 
                                   3038 ;   X 	 integer
                                   3039 ; ---------------------------------
                           000001  3040 	NEG=1
                           000001  3041 	VSIZE=1
      00110E                       3042 factor:
      00110E                       3043 	_vars VSIZE 
      0090AB 04 81            [ 2]    1     sub sp,#VSIZE 
      0090AD CD 09 D8         [ 4] 3044 	call next_token
      0090AD 52 04            [ 1] 3045 	cp a,#CMD_END  
      0090AF 72 5F            [ 1] 3046 	jrult 16$
      0090B1 00 0D            [ 1] 3047 1$:	ld (NEG,sp),a 
      0090B3 1F 01            [ 1] 3048 	and a,#TK_GRP_MASK
      0090B5 AE A9            [ 1] 3049 	cp a,#TK_GRP_ADD 
      0090B7 78 1F            [ 1] 3050 	jreq 2$
      0090B9 03 E6            [ 1] 3051 	ld a,(NEG,sp)
      0090BB 02 A4            [ 2] 3052 	jra 4$  
      001123                       3053 2$:	
      0090BD 0F C7 00         [ 4] 3054 	call next_token 
      001126                       3055 4$:	
      0090C0 0E 1C            [ 1] 3056 	cp a,#TK_IFUNC 
      0090C2 00 03            [ 1] 3057 	jrne 5$ 
      0090C4 72               [ 4] 3058 	call (x) 
      0090C5 BB 00            [ 2] 3059 	jra 18$ 
      00112D                       3060 5$:
      0090C7 0D FE            [ 1] 3061 	cp a,#TK_INTGR
      0090C9 13 01            [ 1] 3062 	jrne 6$
      0090CB 27 0A            [ 2] 3063 	jra 18$
      001133                       3064 6$:
      0090CD 1E 03            [ 1] 3065 	cp a,#TK_ARRAY
      0090CF FE 1D            [ 1] 3066 	jrne 10$
      0090D1 00 02 26         [ 4] 3067 	call get_array_element
      0090D4 E3               [ 2] 3068 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090D5 20 05            [ 2] 3069 	jra 18$ 
      00113D                       3070 10$:
      0090D7 1E 03            [ 1] 3071 	cp a,#TK_VAR 
      0090D9 1C 00            [ 1] 3072 	jrne 12$
      0090DB 02               [ 2] 3073 	ldw x,(x)
      0090DC 5B 04            [ 2] 3074 	jra 18$
      001144                       3075 12$:			
      0090DE 81 07            [ 1] 3076 	cp a,#TK_LPAREN
      0090DF 26 0C            [ 1] 3077 	jrne 16$
      0090DF 52 05 17         [ 4] 3078 	call relation
      0090E2 04               [ 2] 3079 	pushw x 
      0090E3 A6 08            [ 1] 3080 	ld a,#TK_RPAREN 
      0090E3 1F 02 F6         [ 4] 3081 	call expect
      0090E6 A4               [ 2] 3082 	popw x 
      0090E7 0F 6B            [ 2] 3083 	jra 18$	
      001154                       3084 16$:
      0090E9 01               [ 1] 3085 	tnz a 
      0090EA 16 04            [ 1] 3086 	jreq 20$ 
      001157                       3087 	_unget_token
      0090EC 5C 00 02 00 01   [ 1]    1      mov in,in.saved  
      0090ED 4F               [ 1] 3088 	clr a 
      0090ED 90 F6            [ 2] 3089 	jra 20$ 
      00115F                       3090 18$: 
      0090EF 27 1B            [ 1] 3091 	ld a,#TK_MINUS 
      0090F1 0D 01            [ 1] 3092 	cp a,(NEG,sp)
      0090F3 27 0A            [ 1] 3093 	jrne 19$
      0090F5 F1               [ 2] 3094 	negw x
      001166                       3095 19$:
      0090F6 26 07            [ 1] 3096 	ld a,#TK_INTGR
      001168                       3097 20$:
      001168                       3098 	_drop VSIZE
      0090F8 90 5C            [ 2]    1     addw sp,#VSIZE 
      0090FA 5C               [ 4] 3099 	ret
                                   3100 
                                   3101 ;-----------------------------------
                                   3102 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3103 ; output:
                                   3104 ;   A    	token attribute 
                                   3105 ;	X		integer
                                   3106 ;-----------------------------------
                           000001  3107 	N1=1   ; int16_t
                           000003  3108 	MULOP=3
                           000003  3109 	VSIZE=3
      00116B                       3110 term:
      00116B                       3111 	_vars VSIZE
      0090FB 0A 01            [ 2]    1     sub sp,#VSIZE 
      0090FD 20 EE 0E         [ 4] 3112 	call factor
      0090FF 4D               [ 1] 3113 	tnz a 
      0090FF 1E 02            [ 1] 3114 	jreq term_exit 
      001173                       3115 term01:	 ; check for  operator 
      009101 1D 00            [ 2] 3116 	ldw (N1,sp),x  ; save first factor 
      009103 02 4B 00         [ 4] 3117 	call next_token
      009106 FE 84            [ 1] 3118 	ld (MULOP,sp),a
      009108 27 1F            [ 1] 3119 	cp a,#CMD_END
      00910A 20 D7            [ 1] 3120 	jrult 8$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00910C A4 30            [ 1] 3121 	and a,#TK_GRP_MASK
      00910C 1E 02            [ 1] 3122 	cp a,#TK_GRP_MULT
      00910E F6 6B            [ 1] 3123 	jreq 1$
      009110 01 A4            [ 2] 3124 	jra 8$
      001186                       3125 1$:	; got *|/|%
      009112 0F 4C C7         [ 4] 3126 	call factor
      009115 00 0E            [ 1] 3127 	cp a,#TK_INTGR
      009117 72 5F            [ 1] 3128 	jreq 2$
      009119 00 0D 72         [ 2] 3129 	jp syntax_error
      00911C BB 00            [ 1] 3130 2$:	ldw y,x 
      00911E 0D FE            [ 2] 3131 	ldw x,(N1,sp)
      009120 7B 01            [ 1] 3132 	ld a,(MULOP,sp) 
      009122 4E A4            [ 1] 3133 	cp a,#TK_MULT 
      009124 0C 44            [ 1] 3134 	jrne 3$
      009126 44 AB 80         [ 4] 3135 	call multiply 
      009129 20 D4            [ 2] 3136 	jra term01
      009129 5B 05            [ 1] 3137 3$: cp a,#TK_DIV 
      00912B 81 05            [ 1] 3138 	jrne 4$ 
      00912C CD 0F F6         [ 4] 3139 	call divide 
      00912C 88 CD            [ 2] 3140 	jra term01 
      00912E 8A 58 11         [ 4] 3141 4$: call modulo
      009131 01 27            [ 2] 3142 	jra term01 
      009133 03 CC            [ 1] 3143 8$: ld a,(MULOP,sp)
      009135 89 66            [ 1] 3144 	jreq 9$ 
      0011B1                       3145 	_unget_token
      009137 84 81 02 00 01   [ 1]    1      mov in,in.saved  
      009139 1E 01            [ 2] 3146 9$: ldw x,(N1,sp)
      009139 A6 07            [ 1] 3147 	ld a,#TK_INTGR 	
      0011BA                       3148 term_exit:
      0011BA                       3149 	_drop VSIZE 
      00913B CD 91            [ 2]    1     addw sp,#VSIZE 
      00913D 2C               [ 4] 3150 	ret 
                                   3151 
                                   3152 ;-------------------------------
                                   3153 ;  expr ::= term [['+'|'-'] term]*
                                   3154 ;  result range {-32768..32767}
                                   3155 ;  output:
                                   3156 ;   A    token attribute 
                                   3157 ;   X	 integer   
                                   3158 ;-------------------------------
                           000001  3159 	N1=1 
                           000003  3160 	OP=3 
                           000003  3161 	VSIZE=3 
      00913E                       3162 expression:
      0011BD                       3163 	_vars VSIZE 
      00913E 4B 00            [ 2]    1     sub sp,#VSIZE 
      009140 CD 92 89         [ 4] 3164 	call term
      009143 A1               [ 1] 3165 	tnz a 
      009144 00 27            [ 1] 3166 	jreq expr_exit 
      009146 20 A1            [ 2] 3167 1$:	ldw (N1,sp),x 
      009148 84 26 13         [ 4] 3168 	call next_token
      00914B 6B 03            [ 1] 3169 	ld (OP,sp),a 
      00914B 84 90            [ 1] 3170 	cp a,#CMD_END 
      00914D 85 89            [ 1] 3171 	jrult 8$ 
      00914F 90 89            [ 1] 3172 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009151 4C 88            [ 1] 3173 	cp a,#TK_GRP_ADD 
      009153 CD 8A            [ 1] 3174 	jreq 2$ 
      009155 58 A1            [ 2] 3175 	jra 8$
      0011D8                       3176 2$: 
      009157 09 27 E6         [ 4] 3177 	call term
      00915A A1 00            [ 1] 3178 	cp a,#TK_INTGR
      00915C 27 09            [ 1] 3179 	jreq 3$
      00915E A1 08 27         [ 2] 3180 	jp syntax_error
      009161 05 55 00         [ 2] 3181 3$:	ldw acc16,x 
      009164 03 00            [ 2] 3182 	ldw x,(N1,sp)
      009166 02 84            [ 1] 3183 	ld a,(OP,sp)
      009168 81 10            [ 1] 3184 	cp a,#TK_PLUS 
      009169 26 06            [ 1] 3185 	jrne 4$
      009169 CD 91 39 A1      [ 2] 3186 	addw x,acc16
      00916D 01 27            [ 2] 3187 	jra 1$ 
      00916F 03 CC 89 66      [ 2] 3188 4$:	subw x,acc16
      009173 85 C3            [ 2] 3189 	jra 1$
      009175 00 22            [ 1] 3190 8$: ld a,(OP,sp)
      009177 23 05            [ 1] 3191 	jreq 9$ 
      0011FD                       3192 	_unget_token	
      009179 A6 0A CC 89 68   [ 1]    1      mov in,in.saved  
      00917E 5D 27            [ 2] 3193 9$: ldw x,(N1,sp)
      009180 F8 58            [ 1] 3194 	ld a,#TK_INTGR	
      001206                       3195 expr_exit:
      001206                       3196 	_drop VSIZE 
      009182 89 AE            [ 2]    1     addw sp,#VSIZE 
      009184 16               [ 4] 3197 	ret 
                                   3198 
                                   3199 ;---------------------------------------------
                                   3200 ; rel ::= expr rel_op expr
                                   3201 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3202 ;  relation return  integer , zero is false 
                                   3203 ;  output:
                                   3204 ;    A 		token attribute  
                                   3205 ;	 X		integer 
                                   3206 ;---------------------------------------------
                           000001  3207 	N1=1
                           000003  3208 	RELOP=3
                           000003  3209 	VSIZE=3 
      001209                       3210 relation: 
      001209                       3211 	_vars VSIZE
      009185 90 72            [ 2]    1     sub sp,#VSIZE 
      009187 F0 01 5B         [ 4] 3212 	call expression
      00918A 02               [ 1] 3213 	tnz a 
      00918B A6 84            [ 1] 3214 	jreq rel_exit
      00918D 81 01            [ 2] 3215 	ldw (N1,sp),x 
                                   3216 ; expect rel_op or leave 
      00918E CD 09 D8         [ 4] 3217 	call next_token 
      00918E 52 01            [ 1] 3218 	ld (RELOP,sp),a 
      009190 CD 8A            [ 1] 3219 	and a,#TK_GRP_MASK
      009192 58 A1            [ 1] 3220 	cp a,#TK_GRP_RELOP 
      009194 02 25            [ 1] 3221 	jrne 8$
      00121E                       3222 2$:	; expect another expression
      009196 3D 6B 01         [ 4] 3223 	call expression
      009199 A4 30            [ 1] 3224 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00919B A1 10            [ 1] 3225 	jreq 3$
      00919D 27 04 7B         [ 2] 3226 	jp syntax_error 
      0091A0 01 20 03         [ 2] 3227 3$:	ldw acc16,x 
      0091A3 1E 01            [ 2] 3228 	ldw x,(N1,sp) 
      0091A3 CD 8A 58 0C      [ 2] 3229 	subw x,acc16
      0091A6 26 06            [ 1] 3230 	jrne 4$
      0091A6 A1 81 26 03      [ 1] 3231 	mov acc8,#2 ; n1==n2
      0091AA FD 20            [ 2] 3232 	jra 6$ 
      001239                       3233 4$: 
      0091AC 32 06            [ 1] 3234 	jrsgt 5$  
      0091AD 35 04 00 0D      [ 1] 3235 	mov acc8,#4 ; n1<2 
      0091AD A1 84            [ 2] 3236 	jra 6$
      001241                       3237 5$:
      0091AF 26 02 20 2C      [ 1] 3238 	mov acc8,#1 ; n1>n2 
      0091B3                       3239 6$:
      0091B3 A1               [ 1] 3240 	clrw x 
      0091B4 06 26 06         [ 1] 3241 	ld a, acc8  
      0091B7 CD 91            [ 1] 3242 	and a,(RELOP,sp)
      0091B9 69               [ 1] 3243 	tnz a 
      0091BA FE 20            [ 1] 3244 	jreq 10$
      0091BC 22               [ 1] 3245 	incw x 
      0091BD 20 0B            [ 2] 3246 	jra 10$  	
      0091BD A1 85            [ 1] 3247 8$: ld a,(RELOP,sp)
      0091BF 26 03            [ 1] 3248 	jreq 9$
      001255                       3249 	_unget_token
      0091C1 FE 20 1B 00 01   [ 1]    1      mov in,in.saved  
      0091C4                       3250 9$: 
      0091C4 A1 07            [ 2] 3251 	ldw x,(N1,sp)
      00125C                       3252 10$:
      0091C6 26 0C            [ 1] 3253 	ld a,#TK_INTGR
      00125E                       3254 rel_exit:
      00125E                       3255 	_drop VSIZE
      0091C8 CD 92            [ 2]    1     addw sp,#VSIZE 
      0091CA 89               [ 4] 3256 	ret 
                                   3257 
                                   3258 ;--------------------------------
                                   3259 ; BASIC: SHOW 
                                   3260 ; print stack content in hexadecimal bytes 
                                   3261 ; 16 bytes per row 
                                   3262 ;--------------------------------
      001261                       3263 show:
      0091CB 89 A6 08         [ 2] 3264 	ldw x,#cstk_prompt
      0091CE CD 91 2C         [ 4] 3265 	call puts 
      0091D1 85               [ 1] 3266 	ldw x,sp 
      0091D2 20 0B 03         [ 2] 3267 	addw x,#3 ; ignore return address
      0091D4 90 AE 18 00      [ 2] 3268 	ldw y,#RAM_SIZE  
      0091D4 4D 27 11         [ 2] 3269 	ldw acc16,x 
      0091D7 55 00 03 00      [ 2] 3270 	subw y,acc16
      0091DB 02 4F 20         [ 4] 3271 	call hex_dump
      0091DE 09               [ 1] 3272 	clr a 
      0091DF 81               [ 4] 3273 	ret
                                   3274 
      0091DF A6 11 11 01 26 01 50  3275 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3276 
                                   3277 
                                   3278 ;--------------------------------------------
                                   3279 ; BASIC: HEX 
                                   3280 ; select hexadecimal base for integer print
                                   3281 ;---------------------------------------------
      0091E6                       3282 hex_base:
      0091E6 A6 84 00 0A      [ 1] 3283 	mov base,#16 
      0091E8 81               [ 4] 3284 	ret 
                                   3285 
                                   3286 ;--------------------------------------------
                                   3287 ; BASIC: DEC 
                                   3288 ; select decimal base for integer print
                                   3289 ;---------------------------------------------
      0012A7                       3290 dec_base:
      0091E8 5B 01 81 0A      [ 1] 3291 	mov base,#10
      0091EB 81               [ 4] 3292 	ret 
                                   3293 
                                   3294 ;------------------------
                                   3295 ; BASIC: SIZE 
                                   3296 ; return free size in text area
                                   3297 ; output:
                                   3298 ;   A 		TK_INTGR
                                   3299 ;   X 	    size integer
                                   3300 ;--------------------------
      0012AC                       3301 size:
      0091EB 52 03 CD         [ 2] 3302 	ldw x,#tib 
      0091EE 91 8E 4D 27      [ 2] 3303 	subw x,txtend 
      0091F2 47 84            [ 1] 3304 	ld a,#TK_INTGR
      0091F3 81               [ 4] 3305 	ret 
                                   3306 
                                   3307 
                                   3308 ;------------------------
                                   3309 ; BASIC: UBOUND  
                                   3310 ; return array variable size 
                                   3311 ; output:
                                   3312 ;   A 		TK_INTGR
                                   3313 ;   X 	    array size 
                                   3314 ;--------------------------
      0012B6                       3315 ubound:
      0091F3 1F 01 CD         [ 2] 3316 	ldw x,#tib
      0091F6 8A 58 6B 03      [ 2] 3317 	subw x,txtend 
      0091FA A1 02 25 2F      [ 2] 3318 	ldw y,basicptr 
      0091FE A4 30 A1 20      [ 2] 3319 	cpw y,txtend 
      009202 27 02            [ 1] 3320 	jrult 1$
      009204 20 27 03         [ 1] 3321 	push count 
      009206 4B 00            [ 1] 3322 	push #0 
      009206 CD 91 8E         [ 2] 3323 	subw x,(1,sp)
      0012CF                       3324 	_drop 2 
      009209 A1 84            [ 2]    1     addw sp,#2 
      00920B 27               [ 2] 3325 1$:	srlw x 
      00920C 03 CC 89         [ 2] 3326 	ldw array_size,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00920F 66 90            [ 1] 3327 	ld a,#TK_INTGR
      009211 93               [ 4] 3328 	ret 
                                   3329 
                                   3330 ;-----------------------------
                                   3331 ; BASIC: LET var=expr 
                                   3332 ; variable assignement 
                                   3333 ; output:
                                   3334 ;   A 		TK_NONE 
                                   3335 ;-----------------------------
      0012D8                       3336 let:
      009212 1E 01 7B         [ 4] 3337 	call next_token 
      009215 03 A1            [ 1] 3338 	cp a,#TK_VAR 
      009217 20 26            [ 1] 3339 	jreq let_var
      009219 05 CD            [ 1] 3340 	cp a,#TK_ARRAY 
      00921B 8F BD            [ 1] 3341 	jreq  let_array
      00921D 20 D4 A1         [ 2] 3342 	jp syntax_error
      0012E6                       3343 let_array:
      009220 21 26 05         [ 4] 3344 	call get_array_element
      0012E9                       3345 let_var:
      009223 CD               [ 2] 3346 	pushw x  
      009224 90 76 20         [ 4] 3347 	call next_token 
      009227 CB CD            [ 1] 3348 	cp a,#TK_EQUAL
      009229 90 8C            [ 1] 3349 	jreq 1$
      00922B 20 C6 7B         [ 2] 3350 	jp syntax_error
      0012F4                       3351 1$:	
      00922E 03 27 05         [ 4] 3352 	call relation   
      009231 55 00            [ 1] 3353 	cp a,#TK_INTGR 
      009233 03 00            [ 1] 3354 	jreq 2$
      009235 02 1E 01         [ 2] 3355 	jp syntax_error
      0012FE                       3356 2$:	
      009238 A6 84            [ 1] 3357 	ldw y,x 
      00923A 85               [ 2] 3358 	popw x   
      00923A 5B               [ 2] 3359 	ldw (x),y   
      00923B 03               [ 4] 3360 	ret 
                                   3361 
                                   3362 ;----------------------------
                                   3363 ; BASIC: LIST [[start][,end]]
                                   3364 ; list program lines 
                                   3365 ; form start to end 
                                   3366 ; if empty argument list then 
                                   3367 ; list all.
                                   3368 ;----------------------------
                           000001  3369 	FIRST=1
                           000003  3370 	LAST=3 
                           000005  3371 	LN_PTR=5
                           000006  3372 	VSIZE=6 
      001303                       3373 list:
      00923C 81 00 1C         [ 2] 3374 	ldw x,txtbgn 
      00923D C3 00 1E         [ 2] 3375 	cpw x,txtend 
      00923D 52 03            [ 1] 3376 	jrmi 1$
      00923F CD               [ 4] 3377 	ret 
      00130C                       3378 1$:	
      00130C                       3379 	_vars VSIZE
      009240 91 EB            [ 2]    1     sub sp,#VSIZE 
      009242 4D 27            [ 2] 3380 	ldw (LN_PTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009244 41               [ 2] 3381 	ldw x,(x) 
      009245 1F 01            [ 2] 3382 	ldw (FIRST,sp),x ; list from first line 
      009247 CD 8A 58         [ 2] 3383 	ldw x,#MAX_LINENO ; biggest line number 
      00924A 6B 03            [ 2] 3384 	ldw (LAST,sp),x 
      00924C A1 02 25         [ 4] 3385 	call arg_list
      00924F 29               [ 1] 3386 	tnz a
      009250 A4 30            [ 1] 3387 	jreq list_loop 
      009252 A1 10            [ 1] 3388 	cp a,#2 
      009254 27 02            [ 1] 3389 	jreq 4$
      009256 20 21            [ 1] 3390 	cp a,#1 
      009258 27 06            [ 1] 3391 	jreq first_line 
      009258 CD 91 EB         [ 2] 3392 	jp syntax_error 
      00925B A1               [ 2] 3393 4$:	popw x 
      00925C 84 27            [ 2] 3394 	ldw (LAST+2,sp),x 
      00132C                       3395 first_line:
      00925E 03               [ 2] 3396 	popw x
      00925F CC 89            [ 2] 3397 	ldw (FIRST,sp),x 
      00132F                       3398 lines_skip:
      009261 66 CF 00         [ 2] 3399 	ldw x,txtbgn
      009264 0D 1E            [ 2] 3400 2$:	ldw (LN_PTR,sp),x 
      009266 01 7B 03         [ 2] 3401 	cpw x,txtend 
      009269 A1 10            [ 1] 3402 	jrpl list_exit 
      00926B 26               [ 2] 3403 	ldw x,(x) ;line# 
      00926C 06 72            [ 2] 3404 	cpw x,(FIRST,sp)
      00926E BB 00            [ 1] 3405 	jrpl list_loop 
      009270 0D 20            [ 2] 3406 	ldw x,(LN_PTR,sp) 
      009272 D2 72            [ 1] 3407 	ld a,(2,x)
      009274 B0 00 0D         [ 1] 3408 	ld acc8,a 
      009277 20 CC 7B 03      [ 1] 3409 	clr acc16 
      00927B 27 05 55 00      [ 2] 3410 	addw x,acc16
      00927F 03 00            [ 2] 3411 	jra 2$ 
                                   3412 ; print loop
      00134F                       3413 list_loop:
      009281 02 1E            [ 2] 3414 	ldw x,(LN_PTR,sp)
      009283 01 A6            [ 1] 3415 	ld a,(2,x) 
      009285 84 15 8A         [ 4] 3416 	call prt_basic_line
      009286 1E 05            [ 2] 3417 	ldw x,(LN_PTR,sp)
      009286 5B 03            [ 1] 3418 	ld a,(2,x)
      009288 81 00 0D         [ 1] 3419 	ld acc8,a 
      009289 72 5F 00 0C      [ 1] 3420 	clr acc16 
      009289 52 03 CD 92      [ 2] 3421 	addw x,acc16
      00928D 3D 4D 27         [ 2] 3422 	cpw x,txtend 
      009290 4D 1F            [ 1] 3423 	jrpl list_exit
      009292 01 CD            [ 2] 3424 	ldw (LN_PTR,sp),x
      009294 8A               [ 2] 3425 	ldw x,(x)
      009295 58 6B            [ 2] 3426 	cpw x,(LAST,sp)  
      009297 03 A4            [ 1] 3427 	jrslt list_loop
      001371                       3428 list_exit:
      009299 30 A1 30 26 33   [ 1] 3429 	mov in,count 
      00929E AE 16 E0         [ 2] 3430 	ldw x,#pad 
      00929E CD 92 3D         [ 2] 3431 	ldw basicptr,x 
      00137C                       3432 	_drop VSIZE 
      0092A1 A1 84            [ 2]    1     addw sp,#VSIZE 
      0092A3 27               [ 4] 3433 	ret
                                   3434 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3435 ;-------------------------
                                   3436 ; copy command name to buffer  
                                   3437 ; input:
                                   3438 ;   X 	name address 
                                   3439 ;   Y   destination buffer 
                                   3440 ; output:
                                   3441 ;   Y   point after name  
                                   3442 ;--------------------------
      00137F                       3443 cpy_cmd_name:
      0092A4 03               [ 1] 3444 	ld a,(x)
      0092A5 CC               [ 1] 3445 	incw x
      0092A6 89 66            [ 1] 3446 	and a,#15  
      0092A8 CF               [ 1] 3447 	push a 
      0092A9 00 0D            [ 1] 3448     tnz (1,sp) 
      0092AB 1E 01            [ 1] 3449 	jreq 9$
      0092AD 72               [ 1] 3450 1$:	ld a,(x)
      0092AE B0 00            [ 1] 3451 	ld (y),a  
      0092B0 0D               [ 1] 3452 	incw x
      0092B1 26 06            [ 1] 3453 	incw y 
      0092B3 35 02            [ 1] 3454 	dec (1,sp)	 
      0092B5 00 0E            [ 1] 3455 	jrne 1$
      0092B7 20               [ 1] 3456 9$: pop a 
      0092B8 0C               [ 4] 3457 	ret	
                                   3458 
                                   3459 ;--------------------------
                                   3460 ; add a space after letter or 
                                   3461 ; digit.
                                   3462 ; input:
                                   3463 ;   Y     pointer to buffer 
                                   3464 ; output:
                                   3465 ;   Y    moved to end 
                                   3466 ;--------------------------
      0092B9                       3467 add_space:
      0092B9 2C 06            [ 2] 3468 	decw y 
      0092BB 35 04            [ 1] 3469 	ld a,(y)
      0092BD 00 0E            [ 1] 3470 	incw y
      0092BF 20 04 EF         [ 4] 3471 	call is_alnum 
      0092C1 24 06            [ 1] 3472 	jrnc 1$
      0092C1 35 01            [ 1] 3473 	ld a,#SPACE 
      0092C3 00 0E            [ 1] 3474 	ld (y),a 
      0092C5 90 5C            [ 1] 3475 	incw y 
      0092C5 5F               [ 4] 3476 1$: ret 
                                   3477 
                                   3478 ;--------------------------
                                   3479 ;  align text in buffer 
                                   3480 ;  to tab_width padding 
                                   3481 ;  left with  SPACE 
                                   3482 ; input:
                                   3483 ;   X      str*
                                   3484 ;   A      str_length 
                                   3485 ; output:
                                   3486 ;   X      ajusted
                                   3487 ;--------------------------
      0013A6                       3488 right_align:
      0092C6 C6               [ 1] 3489 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092C7 00 0E            [ 1] 3490 0$: ld a,(1,sp)
      0092C9 14 03 4D         [ 1] 3491 	cp a,tab_width 
      0092CC 27 0E            [ 1] 3492 	jrpl 1$
      0092CE 5C 20            [ 1] 3493 	ld a,#SPACE 
      0092D0 0B               [ 2] 3494 	decw x
      0092D1 7B               [ 1] 3495 	ld (x),a  
      0092D2 03 27            [ 1] 3496 	inc (1,sp)
      0092D4 05 55            [ 2] 3497 	jra 0$ 
      0092D6 00               [ 1] 3498 1$: pop a 	
      0092D7 03               [ 4] 3499 	ret 
                                   3500 
                                   3501 ;--------------------------
                                   3502 ; print TK_QSTR
                                   3503 ; converting control character
                                   3504 ; to backslash sequence
                                   3505 ; input:
                                   3506 ;   X        char *
                                   3507 ;   Y        dest. buffer 
                                   3508 ; output:
                                   3509 ;   X        moved forward 
                                   3510 ;   Y        moved forward 
                                   3511 ;-----------------------------
      0013B8                       3512 cpy_quote:
      0092D8 00 02            [ 1] 3513 	ld a,#'"
      0092DA 90 F7            [ 1] 3514 	ld (y),a 
      0092DA 1E 01            [ 1] 3515 	incw y 
      0092DC F6               [ 1] 3516 1$:	ld a,(x)
      0092DC A6 84            [ 1] 3517 	jreq 9$
      0092DE 5C               [ 1] 3518 	incw x 
      0092DE 5B 03            [ 1] 3519 	cp a,#SPACE 
      0092E0 81 0E            [ 1] 3520 	jrult 3$
      0092E1 90 F7            [ 1] 3521 	ld (y),a
      0092E1 AE 92            [ 1] 3522 	incw y 
      0092E3 FB CD            [ 1] 3523 	cp a,#'\ 
      0092E5 AA C0            [ 1] 3524 	jrne 1$ 
      0013CE                       3525 2$:
      0092E7 96 1C            [ 1] 3526 	ld (y),a
      0092E9 00 03            [ 1] 3527 	incw y  
      0092EB 90 AE            [ 2] 3528 	jra 1$
      0092ED 18               [ 1] 3529 3$: push a 
      0092EE 00 CF            [ 1] 3530 	ld a,#'\
      0092F0 00 0D            [ 1] 3531 	ld (y),a 
      0092F2 72 B2            [ 1] 3532 	incw y  
      0092F4 00               [ 1] 3533 	pop a 
      0092F5 0D CD            [ 1] 3534 	sub a,#7
      0092F7 84 3D 4F         [ 1] 3535 	ld acc8,a 
      0092FA 81 0A 63 6F      [ 1] 3536 	clr acc16
      0092FE 6E               [ 2] 3537 	pushw x
      0092FF 74 65 6E         [ 2] 3538 	ldw x,#escaped 
      009302 74 20 6F 66      [ 2] 3539 	addw x,acc16 
      009306 20               [ 1] 3540 	ld a,(x)
      009307 73               [ 2] 3541 	popw x
      009308 74 61            [ 2] 3542 	jra 2$
      00930A 63 6B            [ 1] 3543 9$: ld a,#'"
      00930C 20 66            [ 1] 3544 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00930E 72 6F            [ 1] 3545 	incw y  
      009310 6D               [ 1] 3546 	incw x 
      009311 20               [ 4] 3547 	ret
                                   3548 
                                   3549 ;--------------------------
                                   3550 ; return variable name 
                                   3551 ; from its address.
                                   3552 ; input:
                                   3553 ;   X    variable address
                                   3554 ; output:
                                   3555 ;   A     variable letter
                                   3556 ;--------------------------
      0013F9                       3557 var_name:
      009312 74 6F 70         [ 2] 3558 		subw x,#vars 
      009315 20               [ 1] 3559 		ld a,xl 
      009316 74               [ 1] 3560 		srl a 
      009317 6F 20            [ 1] 3561 		add a,#'A 
      009319 62               [ 4] 3562 		ret 
                                   3563 
                                   3564 ;-----------------------------
                                   3565 ; return cmd  idx from its 
                                   3566 ; code address 
                                   3567 ; input:
                                   3568 ;   X      code address 
                                   3569 ; output:
                                   3570 ;   X      cmd_idx
                                   3571 ;-----------------------------
      001401                       3572 get_cmd_idx:
      00931A 6F 74            [ 2] 3573 	pushw y
      00931C 74 6F 6D 3A      [ 2] 3574 	ldw y,#code_addr 
      009320 0A 00 00 17      [ 2] 3575 	ldw ptr16,y 
      009322 90 5F            [ 1] 3576 	clrw y 
      009322 35 10 00         [ 5] 3577 1$:	cpw x,([ptr16],y)
      009325 0B 81            [ 1] 3578 	jreq 3$ 
      009327 90 5C            [ 1] 3579 	incw y 
      009327 35 0A 00         [ 4] 3580 	ld a,([ptr16],y)
      00932A 0B 81            [ 1] 3581 	incw y
      00932C 91 DA 17         [ 4] 3582 	or a,([ptr16],y)	
      00932C AE 16            [ 1] 3583 	jrne 1$
      00932E 90               [ 1] 3584 3$: ldw x,y 
      00932F 72 B0            [ 2] 3585 	popw y 
      009331 00               [ 4] 3586 	ret
                                   3587 
                                   3588 ;-------------------------------------
                                   3589 ; decompile tokens list 
                                   3590 ; to original text line 
                                   3591 ; input:
                                   3592 ;   [basicptr]  pointer at line 
                                   3593 ;   Y           destination buffer
                                   3594 ; output:
                                   3595 ;   A           length 
                                   3596 ;   Y           after string  
                                   3597 ;------------------------------------
                           000001  3598 	BASE_SAV=1
                           000002  3599 	WIDTH_SAV=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                           000003  3600 	STR=3
                           000004  3601 	VSIZE=4 
      001422                       3602 decompile::
      001422                       3603 	_vars VSIZE
      009332 1F A6            [ 2]    1     sub sp,#VSIZE 
      009334 84 81 0A         [ 1] 3604 	ld a,base
      009336 6B 01            [ 1] 3605 	ld (BASE_SAV,sp),a  
      009336 AE 16 90         [ 1] 3606 	ld a,tab_width 
      009339 72 B0            [ 1] 3607 	ld (WIDTH_SAV,sp),a 
      00933B 00 1F            [ 2] 3608 	ldw (STR,sp),y   
      00933D 90 CE 00 05      [ 5] 3609 	ldw x,[basicptr] ; line number 
      009341 90 C3 00 1F      [ 1] 3610 	mov base,#10
      009345 25 0A 3B 00      [ 1] 3611 	mov tab_width,#5
      009349 04 4B 00 72      [ 1] 3612 	clr acc24 
      00934D F0 01 5B         [ 2] 3613 	ldw acc16,x
      009350 02 54 CF         [ 4] 3614 	call itoa  
      009353 00 22 A6         [ 4] 3615 	call right_align 
      009356 84               [ 1] 3616 	push a 
      009357 81 93            [ 1] 3617 1$:	ldw y,x ; source
      009358 1E 04            [ 2] 3618 	ldw x,(STR+1,sp) ; destination
      009358 CD 8A 58         [ 4] 3619 	call strcpy 
      00935B A1 85            [ 1] 3620 	clrw y 
      00935D 27               [ 1] 3621 	pop a 
      00935E 0A A1            [ 1] 3622 	ld yl,a 
      009360 06 27 03         [ 2] 3623 	addw y,(STR,sp)
      009363 CC 89            [ 1] 3624 	ld a,#SPACE 
      009365 66 F7            [ 1] 3625 	ld (y),a 
      009366 90 5C            [ 1] 3626 	incw y 
      009366 CD 91 69 24      [ 1] 3627 	clr tab_width
      009369 AE 00 03         [ 2] 3628 	ldw x,#3
      009369 89 CD 8A         [ 2] 3629 	ldw in.w,x 
      001469                       3630 decomp_loop:
      00936C 58 A1            [ 2] 3631 	pushw y
      00936E 32 27 03         [ 4] 3632 	call next_token 
      009371 CC 89            [ 2] 3633 	popw y 
      009373 66               [ 1] 3634 	tnz a  
      009374 26 03            [ 1] 3635 	jrne 1$
      009374 CD 92 89         [ 2] 3636 	jp 20$
      009377 A1 84            [ 1] 3637 1$:	jrpl 6$
                                   3638 ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      009379 27 03            [ 1] 3639 	cp a,#TK_VAR 
      00937B CC 89            [ 1] 3640 	jrne 3$
                                   3641 ;; TK_VAR 
      00937D 66 13 94         [ 4] 3642 	call add_space  
      00937E CD 13 F9         [ 4] 3643 	call var_name
      00937E 90 93            [ 1] 3644 	ld (y),a 
      009380 85 FF            [ 1] 3645 	incw y  
      009382 81 E1            [ 2] 3646 	jra decomp_loop
      009383                       3647 3$:
      009383 CE 00            [ 1] 3648 	cp a,#TK_INTGR
      009385 1D C3            [ 1] 3649 	jrne 4$
                                   3650 ;; TK_INTGR
      009387 00 1F 2B         [ 4] 3651 	call add_space
      00938A 01 81 00 0B      [ 1] 3652 	clr acc24 
      00938C CF 00 0C         [ 2] 3653 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00938C 52 06            [ 2] 3654 	pushw y 
      00938E 1F 05 FE         [ 4] 3655 	call itoa  
      009391 1F 01            [ 2] 3656 	ldw y,(1,sp) 
      009393 AE               [ 1] 3657 	push a 
      009394 7F               [ 1] 3658 	exgw x,y 
      009395 FF 1F 03         [ 4] 3659 	call strcpy 
      009398 CD 91            [ 1] 3660 	clrw y
      00939A 3E               [ 1] 3661 	pop a  
      00939B 4D 27            [ 1] 3662 	ld yl,a 
      00939D 31 A1 02         [ 2] 3663 	addw y,(1,sp)
      0014AA                       3664 	_drop 2 
      0093A0 27 07            [ 2]    1     addw sp,#2 
      0093A2 A1 01            [ 2] 3665 	jra decomp_loop
                                   3666 ;; dictionary keyword 
      0014AE                       3667 4$:	
      0093A4 27 06 CC         [ 4] 3668 	call get_cmd_idx 
      0093A7 89 66 85         [ 2] 3669 	cpw x,#REM_IDX
      0093AA 1F 05            [ 1] 3670 	jrne 5$
      0093AC CE 00 04         [ 2] 3671 	ldw x,basicptr 
                                   3672 ; copy comment to buffer 
      0093AC 85 1F 01         [ 4] 3673 	call add_space
      0093AF A6 27            [ 1] 3674 	ld a,#''
      0093AF CE 00            [ 1] 3675 	ld (y),a 
      0093B1 1D 1F            [ 1] 3676 	incw y 
      0014C2                       3677 41$:
      0093B3 05 C3 00 1F      [ 4] 3678 	ld a,([in.w],x)
      0093B7 2A 38 FE 13      [ 1] 3679 	inc in  
      0093BB 01 2A            [ 1] 3680 	ld (y),a 
      0093BD 11 1E            [ 1] 3681 	incw y 
      0093BF 05 E6 02         [ 1] 3682 	ld a,in 
      0093C2 C7 00 0E         [ 1] 3683 	cp a,count 
      0093C5 72 5F            [ 1] 3684 	jrmi 41$
      0093C7 00 0D            [ 2] 3685 	jra 20$  
                                   3686 ; insert command name 
      0014D8                       3687 5$:
      0093C9 72 BB 00         [ 4] 3688 	call add_space  
      0093CC 0D 20            [ 2] 3689 	pushw y
      0093CE E3 10 2D         [ 4] 3690 	call cmd_name
      0093CF 90 85            [ 2] 3691 	popw y 
      0093CF 1E 05 E6         [ 4] 3692 	call cpy_cmd_name
      0093D2 02 CD            [ 2] 3693 	jra decomp_loop 
      0014E7                       3694 6$:
      0093D4 96 0A            [ 1] 3695 	cp a,#TK_QSTR 
      0093D6 1E 05            [ 1] 3696 	jrne 7$
                                   3697 ;; TK_QSTR
      0093D8 E6 02 C7         [ 4] 3698 	call cpy_quote  
      0093DB 00 0E 72         [ 2] 3699 	jp decomp_loop
      0014F1                       3700 7$:
      0093DE 5F 00            [ 1] 3701 	cp a,#TK_CHAR 
      0093E0 0D 72            [ 1] 3702 	jrne 8$
                                   3703 ;; TK_CHAR 
      0093E2 BB 00            [ 1] 3704 	ld a,#'\ 
      0093E4 0D C3            [ 1] 3705 	ld (y),a 
      0093E6 00 1F            [ 1] 3706 	incw y 
      0093E8 2A               [ 1] 3707 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093E9 07 1F            [ 1] 3708 	ld (y),a 
      0093EB 05 FE            [ 1] 3709 	incw y 
      0093ED 13 03 2F         [ 2] 3710 	jp decomp_loop
      0093F0 DE 01            [ 1] 3711 8$: cp a,#TK_COLON 
      0093F1 26 09            [ 1] 3712 	jrne 9$
      0093F1 55 00            [ 1] 3713 	ld a,#':
      001509                       3714 81$:
      0093F3 04 00            [ 1] 3715 	ld (y),a 
      0093F5 02 AE            [ 1] 3716 	incw y 
      00150D                       3717 82$:
      0093F7 16 E0 CF         [ 2] 3718 	jp decomp_loop
      001510                       3719 9$: 
      0093FA 00 05            [ 1] 3720 	cp a,#TK_SHARP
      0093FC 5B 06            [ 1] 3721 	jrugt 10$ 
      0093FE 81 06            [ 1] 3722 	sub a,#TK_ARRAY 
      0093FF 5F               [ 1] 3723 	clrw x 
      0093FF F6               [ 1] 3724 	ld xl,a
      009400 5C A4 0F         [ 2] 3725 	addw x,#single_char 
      009403 88               [ 1] 3726 	ld a,(x)
      009404 0D 01            [ 2] 3727 	jra 81$ 
      00151E                       3728 10$: 
      009406 27 0A            [ 1] 3729 	cp a,#TK_MINUS 
      009408 F6 90            [ 1] 3730 	jrugt 11$
      00940A F7 5C            [ 1] 3731 	sub a,#TK_PLUS 
      00940C 90               [ 1] 3732 	clrw x 
      00940D 5C               [ 1] 3733 	ld xl,a 
      00940E 0A 01 26         [ 2] 3734 	addw x,#add_char 
      009411 F6               [ 1] 3735 	ld a,(x)
      009412 84 81            [ 2] 3736 	jra 81$
      009414                       3737 11$:
      009414 90 5A            [ 1] 3738     cp a,#TK_MOD 
      009416 90 F6            [ 1] 3739 	jrugt 12$
      009418 90 5C            [ 1] 3740 	sub a,#TK_MULT
      00941A CD               [ 1] 3741 	clrw x 
      00941B 86               [ 1] 3742 	ld xl,a 
      00941C 6F 24 06         [ 2] 3743 	addw x,#mul_char
      00941F A6               [ 1] 3744 	ld a,(x)
      009420 20 90            [ 2] 3745 	jra 81$
      00153A                       3746 12$:
      009422 F7 90            [ 1] 3747 	sub a,#TK_GT  
      009424 5C               [ 1] 3748 	sll a 
      009425 81               [ 1] 3749 	clrw x 
      009426 97               [ 1] 3750 	ld xl,a 
      009426 88 7B 01         [ 2] 3751 	addw x,#relop_str 
      009429 C1               [ 2] 3752 	ldw x,(x)
      00942A 00               [ 1] 3753 	ld a,(x)
      00942B 25               [ 1] 3754 	incw x 
      00942C 2A 08            [ 1] 3755 	ld (y),a
      00942E A6 20            [ 1] 3756 	incw y 
      009430 5A               [ 1] 3757 	ld a,(x)
      009431 F7 0C            [ 1] 3758 	jrne 81$
      009433 01 20 F1         [ 2] 3759 	jp decomp_loop 
      00154F                       3760 20$: 
      009436 84 81            [ 1] 3761 	clr (y)
      009438 1E 03            [ 2] 3762 	ldw x,(STR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009438 A6 22            [ 1] 3763 	ld a,(BASE_SAV,sp)
      00943A 90 F7 90         [ 1] 3764 	ld base,a 
      00943D 5C F6            [ 1] 3765 	ld a,(WIDTH_SAV,sp)
      00943F 27 30 5C         [ 1] 3766 	ld tab_width,a
      009442 A1 20 25         [ 2] 3767 	subw y,(STR,sp) 
      009445 0E 90            [ 1] 3768 	ld a,yl 
      001562                       3769 	_drop VSIZE 
      009447 F7 90            [ 2]    1     addw sp,#VSIZE 
      009449 5C               [ 4] 3770 	ret 
                                   3771 
      00944A A1 5C 26 F0 23        3772 single_char: .byte '@','(',')',',','#'
      00944E 2B 2D                 3773 add_char: .byte '+','-'
      00944E 90 F7 90              3774 mul_char: .byte '*','/','%'
      009451 5C 20 EA 88 A6 5C 90  3775 relop_str: .word gt,equal,ge,lt,le,ne 
             F7 90 5C 84 A0
      00945D 07 C7                 3776 gt: .asciz ">"
      00945F 00 0E                 3777 equal: .asciz "="
      009461 72 5F 00              3778 ge: .asciz ">="
      009464 0D 89                 3779 lt: .asciz "<"
      009466 AE 8C 0C              3780 le: .asciz "<="
      009469 72 BB 00              3781 ne:  .asciz "<>"
                                   3782 
                                   3783 
                                   3784 ;--------------------------
                                   3785 ; decompile line from token list
                                   3786 ; and print it. 
                                   3787 ; input:
                                   3788 ;   A       stop at this position 
                                   3789 ;   X 		pointer at line
                                   3790 ; output:
                                   3791 ;   none 
                                   3792 ;--------------------------	
      00158A                       3793 prt_basic_line:
      00946C 0D F6 85         [ 1] 3794 	ld count,a 
      00946F 20 DD            [ 1] 3795 	ld a,(2,x)
      009471 A6 22 90         [ 1] 3796 	cp a,count 
      009474 F7 90            [ 1] 3797 	jrpl 1$ 
      009476 5C 5C 81         [ 1] 3798 	ld count,a 
      009479 CF 00 04         [ 2] 3799 1$:	ldw basicptr,x 
      009479 1D 00 31 9F      [ 2] 3800 	ldw y,#tib  
      00947D 44 AB 41         [ 4] 3801 	call decompile 
      009480 81 00 00         [ 4] 3802 	call puts 
      009481 A6 0D            [ 1] 3803 	ld a,#CR 
      009481 90 89 90         [ 4] 3804 	call putc 
      009484 AE               [ 4] 3805 	ret 
                                   3806 
                                   3807 
                                   3808 
                                   3809 ;---------------------------------
                                   3810 ; BASIC: PRINT|? arg_list 
                                   3811 ; print values from argument list
                                   3812 ;----------------------------------
                           000001  3813 	COMMA=1
                           000001  3814 	VSIZE=1
      0015AA                       3815 print:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015AA                       3816 	_vars VSIZE 
      009485 A9 80            [ 2]    1     sub sp,#VSIZE 
      0015AC                       3817 reset_comma:
      009487 90 CF            [ 1] 3818 	clr (COMMA,sp)
      0015AE                       3819 prt_loop:
      009489 00 18 90         [ 4] 3820 	call next_token
      00948C 5F 91            [ 1] 3821 	cp a,#CMD_END 
      00948E D3 18            [ 1] 3822 	jrult print_exit ; colon or end of line 
      009490 27 0C            [ 1] 3823 	cp a,#TK_QSTR
      009492 90 5C            [ 1] 3824 	jreq 1$
      009494 91 D6            [ 1] 3825 	cp a,#TK_CHAR 
      009496 18 90            [ 1] 3826 	jreq 2$ 
      009498 5C 91            [ 1] 3827 	cp a,#TK_CFUNC 
      00949A DA 18            [ 1] 3828 	jreq 3$
      00949C 26 EF            [ 1] 3829 	cp a,#TK_COMMA 
      00949E 93 90            [ 1] 3830 	jreq 4$
      0094A0 85 81            [ 1] 3831 	cp a,#TK_SHARP 
      0094A2 27 18            [ 1] 3832 	jreq 5$
      0094A2 52 04            [ 2] 3833 	jra 7$ 
      0015CB                       3834 1$:	; print string 
      0094A4 C6 00 0B         [ 4] 3835 	call puts
      0094A7 6B 01            [ 2] 3836 	jra reset_comma
      0015D0                       3837 2$:	; print character 
      0094A9 C6               [ 1] 3838 	ld a,xl 
      0094AA 00 25 6B         [ 4] 3839 	call putc 
      0094AD 02 17            [ 2] 3840 	jra reset_comma 
      0015D6                       3841 3$: ; print character function value  	
      0094AF 03               [ 4] 3842 	call (x)
      0094B0 72               [ 1] 3843 	ld a,xl 
      0094B1 CE 00 05         [ 4] 3844 	call putc
      0094B4 35 0A            [ 2] 3845 	jra reset_comma 
      0015DD                       3846 4$: ; set comma state 
      0094B6 00 0B            [ 1] 3847 	cpl (COMMA,sp)
      0094B8 35 05            [ 2] 3848 	jra prt_loop   
      0015E1                       3849 5$: ; # character must be followed by an integer   
      0094BA 00 25 72         [ 4] 3850 	call next_token
      0094BD 5F 00            [ 1] 3851 	cp a,#TK_INTGR 
      0094BF 0C CF            [ 1] 3852 	jreq 6$
      0094C1 00 0D CD         [ 2] 3853 	jp syntax_error 
      0015EB                       3854 6$: ; set tab width
      0094C4 8A               [ 1] 3855 	ld a,xl 
      0094C5 D5 CD            [ 1] 3856 	and a,#15 
      0094C7 94 26 88         [ 1] 3857 	ld tab_width,a 
      0094CA 90 93            [ 2] 3858 	jra reset_comma 
      0015F3                       3859 7$:	
      0015F3                       3860 	_unget_token 
      0094CC 1E 04 CD 84 96   [ 1]    1      mov in,in.saved  
      0094D1 90 5F 84         [ 4] 3861 	call relation 
      0094D4 90 97            [ 1] 3862 	cp a,#TK_INTGR 
      0094D6 72 F9            [ 1] 3863 	jrne print_exit 
      0094D8 03 A6 20         [ 4] 3864     call print_int 
      0094DB 90 F7            [ 2] 3865 	jra reset_comma 
      001604                       3866 print_exit:
      0094DD 90 5C            [ 1] 3867 	tnz (COMMA,sp)
      0094DF 72 5F            [ 1] 3868 	jrne 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094E1 00 25            [ 1] 3869 	ld a,#CR 
      0094E3 AE 00 03         [ 4] 3870     call putc 
      00160D                       3871 9$:	_drop VSIZE 
      0094E6 CF 00            [ 2]    1     addw sp,#VSIZE 
      0094E8 01               [ 4] 3872 	ret 
                                   3873 
                                   3874 ;----------------------
                                   3875 ; 'save_context' and
                                   3876 ; 'rest_context' must be 
                                   3877 ; called at the same 
                                   3878 ; call stack depth 
                                   3879 ; i.e. SP must have the 
                                   3880 ; save value at  
                                   3881 ; entry point of both 
                                   3882 ; routine. 
                                   3883 ;---------------------
                           000004  3884 	CTXT_SIZE=4 ; size of saved data 
                                   3885 ;--------------------
                                   3886 ; save current BASIC
                                   3887 ; interpreter context 
                                   3888 ; on stack 
                                   3889 ;--------------------
      0094E9                       3890 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001610                       3891 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001610                       3892 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001610                       3893 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001610                       3894 save_context:
      0094E9 90 89 CD         [ 2] 3895 	ldw x,basicptr 
      0094EC 8A 58            [ 2] 3896 	ldw (BPTR,sp),x
      0094EE 90 85 4D         [ 1] 3897 	ld a,in 
      0094F1 26 03            [ 1] 3898 	ld (IN,sp),a
      0094F3 CC 95 CF         [ 1] 3899 	ld a,count 
      0094F6 2A 6F            [ 1] 3900 	ld (CNT,sp),a  
      0094F8 A1               [ 4] 3901 	ret
                                   3902 
                                   3903 ;-----------------------
                                   3904 ; restore previously saved 
                                   3905 ; BASIC interpreter context 
                                   3906 ; from stack 
                                   3907 ;-------------------------
      001620                       3908 rest_context:
      0094F9 85 26            [ 2] 3909 	ldw x,(BPTR,sp)
      0094FB 0C CD 94         [ 2] 3910 	ldw basicptr,x 
      0094FE 14 CD            [ 1] 3911 	ld a,(IN,sp)
      009500 94 79 90         [ 1] 3912 	ld in,a
      009503 F7 90            [ 1] 3913 	ld a,(CNT,sp)
      009505 5C 20 E1         [ 1] 3914 	ld count,a  
      009508 81               [ 4] 3915 	ret
                                   3916 
                                   3917 
                                   3918 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3919 ;------------------------------------------
                                   3920 ; BASIC: INPUT [string]var[,[string]var]
                                   3921 ; input value in variables 
                                   3922 ; [string] optionally can be used as prompt 
                                   3923 ;-----------------------------------------
                           000001  3924 	CX_BPTR=1
                           000003  3925 	CX_IN=3
                           000004  3926 	CX_CNT=4
                           000005  3927 	SKIP=5
                           000006  3928 	VAR_ADDR=6
                           000007  3929 	VSIZE=7
      001630                       3930 input_var:
      001630                       3931 	_vars VSIZE 
      009508 A1 84            [ 2]    1     sub sp,#VSIZE 
      001632                       3932 input_loop:
      00950A 26 22            [ 1] 3933 	clr (SKIP,sp)
      00950C CD 94 14         [ 4] 3934 	call next_token 
      00950F 72 5F            [ 1] 3935 	cp a,#TK_QSTR 
      009511 00 0C            [ 1] 3936 	jrne 1$ 
      009513 CF 00 0D         [ 4] 3937 	call puts 
      009516 90 89            [ 1] 3938 	cpl (SKIP,sp)
      009518 CD 8A D5         [ 4] 3939 	call next_token 
      00951B 16 01            [ 1] 3940 1$: cp a,#TK_VAR  
      00951D 88 51            [ 1] 3941 	jreq 2$ 
      00951F CD 84 96         [ 2] 3942 	jp syntax_error
      009522 90 5F            [ 2] 3943 2$:	ldw (VAR_ADDR,sp),x 
      009524 84 90            [ 1] 3944 	tnz (SKIP,sp)
      009526 97 72            [ 1] 3945 	jrne 21$ 
      009528 F9 01 5B         [ 4] 3946 	call var_name 
      00952B 02 20 BB         [ 4] 3947 	call putc   
      00952E                       3948 21$:
      00952E CD 94            [ 1] 3949 	ld a,#':
      009530 81 A3 00         [ 4] 3950 	call putc 
      009533 8E 26 22         [ 4] 3951 	call save_context 
      009536 CE 00 05 CD      [ 1] 3952 	clr count  
      00953A 94 14 A6         [ 4] 3953 	call readln 
      00953D 27 90 F7         [ 2] 3954 	ldw x,#tib 
      009540 90 5C 03         [ 1] 3955 	push count
      009542 4B 00            [ 1] 3956 	push #0 
      009542 72 D6 00         [ 2] 3957 	addw x,(1,sp)
      009545 01               [ 1] 3958 	incw x 
      001671                       3959 	_drop 2 
      009546 72 5C            [ 2]    1     addw sp,#2 
      009548 00 02 90 F7      [ 1] 3960 	clr in 
      00954C 90 5C C6         [ 4] 3961 	call get_token
      00954F 00 02            [ 1] 3962 	cp a,#TK_INTGR
      009551 C1 00            [ 1] 3963 	jreq 3$ 
      009553 04 2B EC         [ 4] 3964 	call rest_context 
      009556 20 77 E6         [ 2] 3965 	jp syntax_error
      009558 16 06            [ 2] 3966 3$: ldw y,(VAR_ADDR,sp) 
      009558 CD 94            [ 2] 3967 	ldw (y),x 
      00955A 14 90 89         [ 4] 3968 	call rest_context
      00955D CD 90 AD         [ 4] 3969 	call next_token 
      009560 90 85            [ 1] 3970 	cp a,#TK_COMMA 
      009562 CD 93            [ 1] 3971 	jreq input_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009564 FF 20            [ 1] 3972 	cp a,#TK_COLON 
      009566 82 03            [ 2] 3973     jrule input_exit 
      009567 CC 08 E6         [ 2] 3974 	jp syntax_error 
      001699                       3975 input_exit:
      001699                       3976 	_drop VSIZE 
      009567 A1 02            [ 2]    1     addw sp,#VSIZE 
      009569 26               [ 4] 3977 	ret 
                                   3978 
                                   3979 
                                   3980 ;---------------------
                                   3981 ; BASIC: REMARK | ' 
                                   3982 ; skip comment to end of line 
                                   3983 ;---------------------- 
      00169C                       3984 remark:
      00956A 06 CD 94 38 CC   [ 1] 3985 	mov in,count 
      00956F 94               [ 4] 3986  	ret 
                                   3987 
                                   3988 
                                   3989 ;---------------------
                                   3990 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3991 ; read in loop 'addr'  
                                   3992 ; apply & 'mask' to value 
                                   3993 ; loop while result==0.  
                                   3994 ; 'xor_mask' is used to 
                                   3995 ; invert the wait logic.
                                   3996 ; i.e. loop while not 0.
                                   3997 ;---------------------
                           000001  3998 	XMASK=1 
                           000002  3999 	MASK=2
                           000003  4000 	ADDR=3
                           000004  4001 	VSIZE=4
      0016A2                       4002 wait: 
      0016A2                       4003 	_vars VSIZE
      009570 E9 04            [ 2]    1     sub sp,#VSIZE 
      009571 0F 01            [ 1] 4004 	clr (XMASK,sp) 
      009571 A1 03 26         [ 4] 4005 	call arg_list 
      009574 0E A6            [ 1] 4006 	cp a,#2
      009576 5C 90            [ 1] 4007 	jruge 0$
      009578 F7 90 5C         [ 2] 4008 	jp syntax_error 
      00957B 9F 90            [ 1] 4009 0$:	cp a,#3
      00957D F7 90            [ 1] 4010 	jrult 1$
      00957F 5C               [ 2] 4011 	popw x 
      009580 CC               [ 1] 4012 	ld a,xl
      009581 94 E9            [ 1] 4013 	ld (XMASK,sp),a 
      009583 A1               [ 2] 4014 1$: popw x ; mask 
      009584 01               [ 1] 4015 	ld a,xl 
      009585 26 09            [ 1] 4016 	ld (MASK,sp),a 
      009587 A6               [ 2] 4017 	popw x ; address 
      009588 3A               [ 1] 4018 2$:	ld a,(x)
      009589 14 02            [ 1] 4019 	and a,(MASK,sp)
      009589 90 F7            [ 1] 4020 	xor a,(XMASK,sp)
      00958B 90 5C            [ 1] 4021 	jreq 2$ 
      00958D                       4022 	_drop VSIZE 
      00958D CC 94            [ 2]    1     addw sp,#VSIZE 
      00958F E9               [ 4] 4023 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4024 
                                   4025 ;---------------------
                                   4026 ; BASIC: BSET addr,mask
                                   4027 ; set bits at 'addr' corresponding 
                                   4028 ; to those of 'mask' that are at 1.
                                   4029 ; arguments:
                                   4030 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4031 ;   mask        mask|addr
                                   4032 ; output:
                                   4033 ;	none 
                                   4034 ;--------------------------
      009590                       4035 bit_set:
      009590 A1 0A 22         [ 4] 4036 	call arg_list 
      009593 0A A0            [ 1] 4037 	cp a,#2	 
      009595 06 5F            [ 1] 4038 	jreq 1$ 
      009597 97 1C 95         [ 2] 4039 	jp syntax_error
      0016D1                       4040 1$: 
      00959A E5               [ 2] 4041 	popw x ; mask 
      00959B F6               [ 1] 4042 	ld a,xl 
      00959C 20               [ 2] 4043 	popw x ; addr  
      00959D EB               [ 1] 4044 	or a,(x)
      00959E F7               [ 1] 4045 	ld (x),a
      00959E A1               [ 4] 4046 	ret 
                                   4047 
                                   4048 ;---------------------
                                   4049 ; BASIC: BRES addr,mask
                                   4050 ; reset bits at 'addr' corresponding 
                                   4051 ; to those of 'mask' that are at 1.
                                   4052 ; arguments:
                                   4053 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4054 ;   mask	    ~mask&*addr  
                                   4055 ; output:
                                   4056 ;	none 
                                   4057 ;--------------------------
      0016D7                       4058 bit_reset:
      00959F 11 22 0A         [ 4] 4059 	call arg_list 
      0095A2 A0 10            [ 1] 4060 	cp a,#2  
      0095A4 5F 97            [ 1] 4061 	jreq 1$ 
      0095A6 1C 95 EA         [ 2] 4062 	jp syntax_error
      0016E1                       4063 1$: 
      0095A9 F6               [ 2] 4064 	popw x ; mask 
      0095AA 20               [ 1] 4065 	ld a,xl 
      0095AB DD               [ 1] 4066 	cpl a 
      0095AC 85               [ 2] 4067 	popw x ; addr  
      0095AC A1               [ 1] 4068 	and a,(x)
      0095AD 22               [ 1] 4069 	ld (x),a 
      0095AE 22               [ 4] 4070 	ret 
                                   4071 
                                   4072 ;---------------------
                                   4073 ; BASIC: BTOGL addr,mask
                                   4074 ; toggle bits at 'addr' corresponding 
                                   4075 ; to those of 'mask' that are at 1.
                                   4076 ; arguments:
                                   4077 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4078 ;   mask	    mask^*addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4079 ; output:
                                   4080 ;	none 
                                   4081 ;--------------------------
      0016E8                       4082 bit_toggle:
      0095AF 0A A0 20         [ 4] 4083 	call arg_list 
      0095B2 5F 97            [ 1] 4084 	cp a,#2 
      0095B4 1C 95            [ 1] 4085 	jreq 1$ 
      0095B6 EC F6 20         [ 2] 4086 	jp syntax_error
      0095B9 CF               [ 2] 4087 1$: popw x ; mask 
      0095BA 9F               [ 1] 4088 	ld a,xl 
      0095BA A0               [ 2] 4089 	popw x ; addr  
      0095BB 31               [ 1] 4090 	xor a,(x)
      0095BC 48               [ 1] 4091 	ld (x),a 
      0095BD 5F               [ 4] 4092 	ret 
                                   4093 
                                   4094 
                                   4095 ;---------------------
                                   4096 ; BASIC: BTEST(addr,bit)
                                   4097 ; return bit value at 'addr' 
                                   4098 ; bit is in range {0..7}.
                                   4099 ; arguments:
                                   4100 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4101 ;   bit 	    bit position {0..7}  
                                   4102 ; output:
                                   4103 ;	none 
                                   4104 ;--------------------------
      0016F8                       4105 bit_test:
      0095BE 97 1C 95         [ 4] 4106 	call func_args 
      0095C1 EF FE            [ 1] 4107 	cp a,#2
      0095C3 F6 5C            [ 1] 4108 	jreq 0$
      0095C5 90 F7 90         [ 2] 4109 	jp syntax_error
      001702                       4110 0$:	
      0095C8 5C               [ 2] 4111 	popw x 
      0095C9 F6               [ 1] 4112 	ld a,xl 
      0095CA 26 BD            [ 1] 4113 	and a,#7
      0095CC CC               [ 1] 4114 	push a   
      0095CD 94 E9            [ 1] 4115 	ld a,#1 
      0095CF 0D 01            [ 1] 4116 1$: tnz (1,sp)
      0095CF 90 7F            [ 1] 4117 	jreq 2$
      0095D1 1E               [ 1] 4118 	sll a 
      0095D2 03 7B            [ 1] 4119 	dec (1,sp)
      0095D4 01 C7            [ 2] 4120 	jra 1$
      001712                       4121 2$: _drop 1 
      0095D6 00 0B            [ 2]    1     addw sp,#1 
      0095D8 7B               [ 2] 4122 	popw x 
      0095D9 02               [ 1] 4123 	and a,(x)
      0095DA C7 00            [ 1] 4124 	jreq 3$
      0095DC 25 72            [ 1] 4125 	ld a,#1 
      0095DE F2               [ 1] 4126 3$:	clrw x 
      0095DF 03               [ 1] 4127 	ld xl,a 
      0095E0 90 9F            [ 1] 4128 	ld a,#TK_INTGR
      0095E2 5B               [ 4] 4129 	ret
                                   4130 
                                   4131 
                                   4132 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4133 ; BASIC: POKE addr,byte
                                   4134 ; put a byte at addr 
                                   4135 ;--------------------
      00171F                       4136 poke:
      0095E3 04 81 40         [ 4] 4137 	call arg_list 
      0095E6 28 29            [ 1] 4138 	cp a,#2
      0095E8 2C 23            [ 1] 4139 	jreq 1$
      0095EA 2B 2D 2A         [ 2] 4140 	jp syntax_error
      001729                       4141 1$:	
      0095ED 2F               [ 2] 4142 	popw x  
      0095EE 25               [ 1] 4143     ld a,xl 
      0095EF 95               [ 2] 4144 	popw x 
      0095F0 FB               [ 1] 4145 	ld (x),a 
      0095F1 95               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;-----------------------
                                   4149 ; BASIC: PEEK(addr)
                                   4150 ; get the byte at addr 
                                   4151 ; input:
                                   4152 ;	none 
                                   4153 ; output:
                                   4154 ;	X 		value 
                                   4155 ;-----------------------
      00172E                       4156 peek:
      0095F2 FD 95 FF         [ 4] 4157 	call func_args
      0095F5 96 02            [ 1] 4158 	cp a,#1 
      0095F7 96 04            [ 1] 4159 	jreq 1$
      0095F9 96 07 3E         [ 2] 4160 	jp syntax_error
      0095FC 00               [ 2] 4161 1$: popw x 
      0095FD 3D               [ 1] 4162 	ld a,(x)
      0095FE 00               [ 1] 4163 	clrw x 
      0095FF 3E               [ 1] 4164 	ld xl,a 
      009600 3D 00            [ 1] 4165 	ld a,#TK_INTGR
      009602 3C               [ 4] 4166 	ret 
                                   4167 
                                   4168 ;---------------------------
                                   4169 ; BASIC IF expr : instructions
                                   4170 ; evaluate expr and if true 
                                   4171 ; execute instructions on same line. 
                                   4172 ;----------------------------
      00173F                       4173 if: 
      009603 00 3C 3D         [ 4] 4174 	call relation 
      009606 00 3C            [ 1] 4175 	cp a,#TK_INTGR
      009608 3E 00            [ 1] 4176 	jreq 1$ 
      00960A CC 08 E6         [ 2] 4177 	jp syntax_error
      00960A C7               [ 1] 4178 1$:	clr a 
      00960B 00               [ 2] 4179 	tnzw x 
      00960C 04 E6            [ 1] 4180 	jrne 9$  
                                   4181 ;skip to next line
      00960E 02 C1 00 04 2A   [ 1] 4182 	mov in,count
      009613 03               [ 4] 4183 9$:	ret 
                                   4184 
                                   4185 ;------------------------
                                   4186 ; BASIC: FOR var=expr 
                                   4187 ; set variable to expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4188 ; leave variable address 
                                   4189 ; on stack and set
                                   4190 ; FLOOP bit in 'flags'
                                   4191 ;-----------------
                           000001  4192 	RETL1=1 ; return address  
                           000003  4193 	FSTEP=3  ; variable increment
                           000005  4194 	LIMIT=5 ; loop limit 
                           000007  4195 	CVAR=7   ; control variable 
                           000009  4196 	INW=9   ;  in.w saved
                           00000B  4197 	BPTR=11 ; baseptr saved
                           00000A  4198 	VSIZE=10  
      001753                       4199 for: ; { -- var_addr }
      009614 C7               [ 2] 4200 	popw x ; call return address 
      001754                       4201 	_vars VSIZE 
      009615 00 04            [ 2]    1     sub sp,#VSIZE 
      009617 CF               [ 2] 4202 	pushw x  ; RETL1 
      009618 00 05            [ 1] 4203 	ld a,#TK_VAR 
      00961A 90 AE 16         [ 4] 4204 	call expect
      00961D 90 CD            [ 2] 4205 	ldw (CVAR,sp),x  ; control variable 
      00961F 94 A2 CD         [ 4] 4206 	call let_var 
      009622 AA C0 A6 0D      [ 1] 4207 	bset flags,#FLOOP 
                                   4208 ; open space on stack for loop data 
      009626 CD               [ 1] 4209 	clrw x 
      009627 83 78            [ 2] 4210 	ldw (BPTR,sp),x 
      009629 81 09            [ 2] 4211 	ldw (INW,sp),x 
      00962A CD 09 D8         [ 4] 4212 	call next_token 
      00962A 52 01            [ 1] 4213 	cp a,#TK_CMD 
      00962C 27 03            [ 1] 4214 	jreq 1$
      00962C 0F 01 E6         [ 2] 4215 	jp syntax_error
      00962E                       4216 1$:  
      00962E CD 8A 58         [ 2] 4217 	cpw x,#to 
      009631 A1 02            [ 1] 4218 	jreq to
      009633 25 4F A1         [ 2] 4219 	jp syntax_error 
                                   4220 
                                   4221 ;-----------------------------------
                                   4222 ; BASIC: TO expr 
                                   4223 ; second part of FOR loop initilization
                                   4224 ; leave limit on stack and set 
                                   4225 ; FTO bit in 'flags'
                                   4226 ;-----------------------------------
      00177C                       4227 to: ; { var_addr -- var_addr limit step }
      009636 02 27 12 A1 03   [ 2] 4228 	btjt flags,#FLOOP,1$
      00963B 27 13 A1         [ 2] 4229 	jp syntax_error
      00963E 82 27 15         [ 4] 4230 1$: call relation  
      009641 A1 09            [ 1] 4231 	cp a,#TK_INTGR 
      009643 27 18            [ 1] 4232 	jreq 2$ 
      009645 A1 0A 27         [ 2] 4233 	jp syntax_error
      009648 18 20            [ 2] 4234 2$: ldw (LIMIT,sp),x
                                   4235 ;	ldw x,in.w 
      00964A 28 09 D8         [ 4] 4236 	call next_token
      00964B A1 00            [ 1] 4237 	cp a,#TK_NONE  
      00964B CD AA            [ 1] 4238 	jreq 4$ 
      00964D C0 20            [ 1] 4239 	cp a,#TK_CMD
      00964F DC 05            [ 1] 4240 	jrne 3$
      009650 A3 17 AC         [ 2] 4241 	cpw x,#step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009650 9F CD            [ 1] 4242 	jreq step
      0017A0                       4243 3$:	
      0017A0                       4244 	_unget_token   	 
      009652 83 78 20 D6 01   [ 1]    1      mov in,in.saved  
      009656                       4245 4$:	
      009656 FD 9F CD         [ 2] 4246 	ldw x,#1   ; default step  
      009659 83 78            [ 2] 4247 	ldw (FSTEP,sp),x 
      00965B 20 CF            [ 2] 4248 	jra store_loop_addr 
                                   4249 
                                   4250 
                                   4251 ;----------------------------------
                                   4252 ; BASIC: STEP expr 
                                   4253 ; optional third par of FOR loop
                                   4254 ; initialization. 	
                                   4255 ;------------------------------------
      00965D                       4256 step: ; {var limit -- var limit step}
      00965D 03 01 20 CD 03   [ 2] 4257 	btjt flags,#FLOOP,1$
      009661 CC 08 E6         [ 2] 4258 	jp syntax_error
      009661 CD 8A 58         [ 4] 4259 1$: call relation
      009664 A1 84            [ 1] 4260 	cp a,#TK_INTGR
      009666 27 03            [ 1] 4261 	jreq 2$
      009668 CC 89 66         [ 2] 4262 	jp syntax_error
      00966B 1F 03            [ 2] 4263 2$:	ldw (FSTEP,sp),x ; step
                                   4264 ; leave loop back entry point on cstack 
                                   4265 ; cstack is 1 call deep from interpreter
      0017C0                       4266 store_loop_addr:
      00966B 9F A4 0F         [ 2] 4267 	ldw x,basicptr  
      00966E C7 00            [ 2] 4268 	ldw (BPTR,sp),x 
      009670 25 20 B9         [ 2] 4269 	ldw x,in.w 
      009673 1F 09            [ 2] 4270 	ldw (INW,sp),x   
      009673 55 00 03 00      [ 1] 4271 	bres flags,#FLOOP 
      009677 02 CD 92 89      [ 1] 4272 	inc loop_depth  
      00967B A1               [ 4] 4273 	ret 
                                   4274 
                                   4275 ;--------------------------------
                                   4276 ; BASIC: NEXT var 
                                   4277 ; FOR loop control 
                                   4278 ; increment variable with step 
                                   4279 ; and compare with limit 
                                   4280 ; loop if threshold not crossed.
                                   4281 ; else stack. 
                                   4282 ; and decrement 'loop_depth' 
                                   4283 ;--------------------------------
      0017D3                       4284 next: ; {var limit step retl1 -- [var limit step ] }
      00967C 84 26 05 CD      [ 1] 4285 	tnz loop_depth 
      009680 8A B9            [ 1] 4286 	jrne 1$ 
      009682 20 A8 E6         [ 2] 4287 	jp syntax_error 
      009684                       4288 1$: 
      009684 0D 01            [ 1] 4289 	ld a,#TK_VAR 
      009686 26 05 A6         [ 4] 4290 	call expect
                                   4291 ; check for good variable after NEXT 	 
      009689 0D CD            [ 2] 4292 	cpw x,(CVAR,sp)
      00968B 83 78            [ 1] 4293 	jreq 2$  
      00968D 5B 01 81         [ 2] 4294 	jp syntax_error ; not the good one 
      009690                       4295 2$: ; increment variable 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009690 CE               [ 2] 4296 	ldw x,(x)  ; get var value 
      009691 00 05 1F         [ 2] 4297 	addw x,(FSTEP,sp) ; var+step 
      009694 03 C6            [ 2] 4298 	ldw y,(CVAR,sp)
      009696 00 02            [ 2] 4299 	ldw (y),x ; save var new value 
                                   4300 ; check sign of STEP  
      009698 6B 05            [ 1] 4301 	ld a,#0x80
      00969A C6 00            [ 1] 4302 	bcp a,(FSTEP,sp)
      00969C 04 6B            [ 1] 4303 	jrpl 4$
                                   4304 ;negative step 
      00969E 06 81            [ 2] 4305 	cpw x,(LIMIT,sp)
      0096A0 2F 1B            [ 1] 4306 	jrslt loop_done
      0096A0 1E 03            [ 2] 4307 	jra loop_back 
      0017FC                       4308 4$: ; positive step
      0096A2 CF 00            [ 2] 4309 	cpw x,(LIMIT,sp)
      0096A4 05 7B            [ 1] 4310 	jrsgt loop_done
      001800                       4311 loop_back:
      0096A6 05 C7            [ 2] 4312 	ldw x,(BPTR,sp)
      0096A8 00 02 7B         [ 2] 4313 	ldw basicptr,x 
      0096AB 06 C7 00 04 81   [ 2] 4314 	btjf flags,#FRUN,1$ 
      0096B0 E6 02            [ 1] 4315 	ld a,(2,x)
      0096B0 52 07 03         [ 1] 4316 	ld count,a
      0096B2 1E 09            [ 2] 4317 1$:	ldw x,(INW,sp)
      0096B2 0F 05 CD         [ 2] 4318 	ldw in.w,x 
      0096B5 8A               [ 4] 4319 	ret 
      001815                       4320 loop_done:
                                   4321 	; remove loop data from stack  
      0096B6 58               [ 2] 4322 	popw x
      001816                       4323 	_drop VSIZE 
      0096B7 A1 02            [ 2]    1     addw sp,#VSIZE 
      0096B9 26 08 CD AA      [ 1] 4324 	dec loop_depth 
                                   4325 ;	pushw x 
                                   4326 ;	ret 
      0096BD C0               [ 2] 4327 	jp (x)
                                   4328 
                                   4329 ;----------------------------
                                   4330 ; called by goto/gosub
                                   4331 ; to get target line number 
                                   4332 ;---------------------------
      00181D                       4333 get_target_line:
      0096BE 03 05 CD         [ 4] 4334 	call relation 
      0096C1 8A 58            [ 1] 4335 	cp a,#TK_INTGR
      0096C3 A1 85            [ 1] 4336 	jreq 1$
      0096C5 27 03 CC         [ 2] 4337 	jp syntax_error
      0096C8 89 66 1F         [ 4] 4338 1$:	call search_lineno  
      0096CB 06               [ 2] 4339 	tnzw x 
      0096CC 0D 05            [ 1] 4340 	jrne 2$ 
      0096CE 26 06            [ 1] 4341 	ld a,#ERR_NO_LINE 
      0096D0 CD 94 79         [ 2] 4342 	jp tb_error 
      0096D3 CD               [ 4] 4343 2$:	ret 
                                   4344 
                                   4345 ;------------------------
                                   4346 ; BASIC: GOTO line# 
                                   4347 ; jump to line# 
                                   4348 ; here cstack is 2 call deep from interpreter 
                                   4349 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      001833                       4350 goto:
      0096D4 83 78 00 23 06   [ 2] 4351 	btjt flags,#FRUN,0$ 
      0096D6 A6 06            [ 1] 4352 	ld a,#ERR_RUN_ONLY
      0096D6 A6 3A CD         [ 2] 4353 	jp tb_error 
      0096D9 83               [ 4] 4354 	ret 
      0096DA 78 CD 96         [ 4] 4355 0$:	call get_target_line
      001841                       4356 jp_to_target:
      0096DD 90 72 5F         [ 2] 4357 	ldw basicptr,x 
      0096E0 00 04            [ 1] 4358 	ld a,(2,x)
      0096E2 CD AB C5         [ 1] 4359 	ld count,a 
      0096E5 AE 16 90 3B      [ 1] 4360 	mov in,#3 
      0096E9 00               [ 4] 4361 	ret 
                                   4362 
                                   4363 
                                   4364 ;--------------------
                                   4365 ; BASIC: GOSUB line#
                                   4366 ; basic subroutine call
                                   4367 ; actual line# and basicptr 
                                   4368 ; are saved on cstack
                                   4369 ; here cstack is 2 call deep from interpreter 
                                   4370 ;--------------------
                           000003  4371 	RET_ADDR=3
                           000005  4372 	RET_INW=5
                           000004  4373 	VSIZE=4  
      00184E                       4374 gosub:
      0096EA 04 4B 00 72 FB   [ 2] 4375 	btjt flags,#FRUN,0$ 
      0096EF 01 5C            [ 1] 4376 	ld a,#ERR_RUN_ONLY
      0096F1 5B 02 72         [ 2] 4377 	jp tb_error 
      0096F4 5F               [ 4] 4378 	ret 
      0096F5 00               [ 2] 4379 0$:	popw x 
      00185A                       4380 	_vars VSIZE  
      0096F6 02 CD            [ 2]    1     sub sp,#VSIZE 
      0096F8 8C               [ 2] 4381 	pushw x 
      0096F9 E8 A1 84         [ 2] 4382 	ldw x,basicptr
      0096FC 27 06            [ 2] 4383 	ldw (RET_ADDR,sp),x 
      0096FE CD 96 A0         [ 4] 4384 	call get_target_line  
      009701 CC               [ 2] 4385 	pushw x 
      009702 89 66 16         [ 2] 4386 	ldw x,in.w 
      009705 06 90            [ 2] 4387 	ldw (RET_INW+2,sp),x
      009707 FF               [ 2] 4388 	popw x 
      009708 CD 96            [ 2] 4389 	jra jp_to_target
                                   4390 
                                   4391 ;------------------------
                                   4392 ; BASIC: RETURN 
                                   4393 ; exit from a subroutine 
                                   4394 ; 
                                   4395 ;------------------------
      00186E                       4396 return:
      00970A A0 CD 8A 58 A1   [ 2] 4397 	btjt flags,#FRUN,0$ 
      00970F 09 27            [ 1] 4398 	ld a,#ERR_RUN_ONLY
      009711 A0 A1 01         [ 2] 4399 	jp tb_error 
      001878                       4400 0$:	
      009714 23 03            [ 2] 4401 	ldw x,(RET_ADDR,sp) 
      009716 CC 89 66         [ 2] 4402 	ldw basicptr,x
      009719 E6 02            [ 1] 4403 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009719 5B 07 81         [ 1] 4404 	ld count,a  
      00971C 1E 05            [ 2] 4405 	ldw x,(RET_INW,sp)
      00971C 55 00 04         [ 2] 4406 	ldw in.w,x 
      00971F 00               [ 2] 4407 	popw x 
      001888                       4408 	_drop VSIZE 
      009720 02 81            [ 2]    1     addw sp,#VSIZE 
      009722 89               [ 2] 4409 	pushw x
      009722 52               [ 4] 4410 	ret  
                                   4411 
                                   4412 
                                   4413 ;----------------------------------
                                   4414 ; BASIC: RUN
                                   4415 ; run BASIC program in RAM
                                   4416 ;----------------------------------- 
      00188C                       4417 run: 
      009723 04 0F 01 CD 91   [ 2] 4418 	btjf flags,#FRUN,0$  
      009728 3E               [ 1] 4419 	clr a 
      009729 A1               [ 4] 4420 	ret
      001893                       4421 0$: 
      00972A 02 24 03 CC 89   [ 2] 4422 	btjf flags,#FBREAK,1$
      001898                       4423 	_drop 2 
      00972F 66 A1            [ 2]    1     addw sp,#2 
      009731 03 25 04         [ 4] 4424 	call rest_context
      00189D                       4425 	_drop CTXT_SIZE 
      009734 85 9F            [ 2]    1     addw sp,#CTXT_SIZE 
      009736 6B 01 85 9F      [ 1] 4426 	bres flags,#FBREAK 
      00973A 6B 02 85 F6      [ 1] 4427 	bset flags,#FRUN 
      00973E 14 02 18         [ 2] 4428 	jp interpreter 
      009741 01 27 F9         [ 2] 4429 1$:	ldw x,txtbgn
      009744 5B 04 81         [ 2] 4430 	cpw x,txtend 
      009747 2B 0C            [ 1] 4431 	jrmi run_it 
      009747 CD 91 3E         [ 2] 4432 	ldw x,#err_no_prog
      00974A A1 02 27         [ 4] 4433 	call puts 
      00974D 03 CC 89 66 01   [ 1] 4434 	mov in,count
      009751 81               [ 4] 4435 	ret 
      0018BE                       4436 run_it:	 
      009751 85 9F 85         [ 4] 4437     call ubound 
      0018C1                       4438 	_drop 2 ; drop return address 
      009754 FA F7            [ 2]    1     addw sp,#2 
                                   4439 ; clear data pointer 
      009756 81               [ 1] 4440 	clrw x 
      009757 CF 00 06         [ 2] 4441 	ldw data_ptr,x 
      009757 CD 91 3E A1      [ 1] 4442 	clr data_ofs 
      00975B 02 27 03 CC      [ 1] 4443 	clr data_len 
                                   4444 ; initialize BASIC pointer 
      00975F 89 66 1C         [ 2] 4445 	ldw x,txtbgn 
      009761 CF 00 04         [ 2] 4446 	ldw basicptr,x 
      009761 85 9F            [ 1] 4447 	ld a,(2,x)
      009763 43 85 F4         [ 1] 4448 	ld count,a
      009766 F7 81 00 01      [ 1] 4449 	mov in,#3	
      009768 72 10 00 23      [ 1] 4450 	bset flags,#FRUN 
      009768 CD 91 3E         [ 2] 4451 	jp interpreter 
                                   4452 
                                   4453 
                                   4454 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4455 ; BASIC: END
                                   4456 ; end running program
                                   4457 ;---------------------- 
      0018E5                       4458 cmd_end: 
                                   4459 ; clean stack 
      00976B A1 02 27         [ 2] 4460 	ldw x,#STACK_EMPTY
      00976E 03               [ 1] 4461 	ldw sp,x 
      00976F CC 89 66         [ 2] 4462 	jp warm_start
                                   4463 
                                   4464 ;-----------------
                                   4465 ; 1 Khz beep 
                                   4466 ;-----------------
      0018EC                       4467 beep_1khz:: 
      009772 85 9F 85         [ 2] 4468 	ldw x,#100
      009775 F8 F7 81 E8      [ 2] 4469 	ldw y,#1000
      009778 20 0D            [ 2] 4470 	jra beep
                                   4471 
                                   4472 ;-----------------------
                                   4473 ; BASIC: TONE expr1,expr2
                                   4474 ; used TIMER2 channel 1
                                   4475 ; to produce a tone 
                                   4476 ; arguments:
                                   4477 ;    expr1   frequency 
                                   4478 ;    expr2   duration msec.
                                   4479 ;---------------------------
      0018F5                       4480 tone:
      009778 CD 91 39         [ 4] 4481 	call arg_list 
      00977B A1 02            [ 1] 4482 	cp a,#2 
      00977D 27 03            [ 1] 4483 	jreq 1$
      00977F CC 89 66         [ 2] 4484 	jp syntax_error 
      009782                       4485 1$: 
      009782 85               [ 2] 4486 	popw x ; duration
      009783 9F A4            [ 2] 4487 	popw y ; frequency 
      001902                       4488 beep:  
      009785 07               [ 2] 4489 	pushw x 
      009786 88 A6 01         [ 2] 4490 	ldw x,#TIM2_CLK_FREQ
      009789 0D               [ 2] 4491 	divw x,y 
                                   4492 ; round to nearest integer 
      00978A 01 27 05 48      [ 2] 4493 	cpw y,#TIM2_CLK_FREQ/2
      00978E 0A 01            [ 1] 4494 	jrmi 2$
      009790 20               [ 1] 4495 	incw x 
      00190E                       4496 2$:	 
      009791 F7               [ 1] 4497 	ld a,xh 
      009792 5B 01 85         [ 1] 4498 	ld TIM2_ARRH,a 
      009795 F4               [ 1] 4499 	ld a,xl 
      009796 27 02 A6         [ 1] 4500 	ld TIM2_ARRL,a 
                                   4501 ; 50% duty cycle 
      009799 01               [ 1] 4502 	ccf 
      00979A 5F               [ 2] 4503 	rrcw x 
      00979B 97               [ 1] 4504 	ld a,xh 
      00979C A6 84 81         [ 1] 4505 	ld TIM2_CCR1H,a 
      00979F 9F               [ 1] 4506 	ld a,xl
      00979F CD 91 3E         [ 1] 4507 	ld TIM2_CCR1L,a
      0097A2 A1 02 27 03      [ 1] 4508 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      0097A6 CC 89 66 00      [ 1] 4509 	bset TIM2_CR1,#TIM2_CR1_CEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0097A9 72 10 53 04      [ 1] 4510 	bset TIM2_EGR,#TIM2_EGR_UG
      0097A9 85               [ 2] 4511 	popw x 
      0097AA 9F 85 F7         [ 4] 4512 	call pause02
      0097AD 81 11 53 08      [ 1] 4513 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      0097AE 72 11 53 00      [ 1] 4514 	bres TIM2_CR1,#TIM2_CR1_CEN 
      0097AE CD               [ 4] 4515 	ret 
                                   4516 
                                   4517 ;-------------------------------
                                   4518 ; BASIC: ADCON 0|1 [,divisor]  
                                   4519 ; disable/enanble ADC 
                                   4520 ;-------------------------------
                           000003  4521 	ONOFF=3 
                           000001  4522 	DIVSOR=1
                           000004  4523 	VSIZE=4 
      001939                       4524 power_adc:
      0097AF 91 39 A1         [ 4] 4525 	call arg_list 
      0097B2 01 27            [ 1] 4526 	cp a,#2	
      0097B4 03 CC            [ 1] 4527 	jreq 1$
      0097B6 89 66            [ 1] 4528 	cp a,#1 
      0097B8 85 F6            [ 1] 4529 	jreq 0$ 
      0097BA 5F 97 A6         [ 2] 4530 	jp syntax_error 
      0097BD 84 81 00         [ 2] 4531 0$: ldw x,#0
      0097BF 89               [ 2] 4532 	pushw x  ; divisor 
      0097BF CD 92            [ 2] 4533 1$: ldw x,(ONOFF,sp)
      0097C1 89               [ 2] 4534 	tnzw x 
      0097C2 A1 84            [ 1] 4535 	jreq 2$ 
      0097C4 27 03            [ 2] 4536 	ldw x,(DIVSOR,sp) ; divisor 
      0097C6 CC               [ 1] 4537 	ld a,xl
      0097C7 89 66            [ 1] 4538 	and a,#7
      0097C9 4F               [ 1] 4539 	swap a 
      0097CA 5D 26 05         [ 1] 4540 	ld ADC_CR1,a
      0097CD 55 00 04 00      [ 1] 4541 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0097D1 02 81 54 01      [ 1] 4542 	bset ADC_CR1,#ADC_CR1_ADON 
      0097D3                       4543 	_usec_dly 7 
      0097D3 85 52 0A         [ 2]    1     ldw x,#(16*7-2)/4
      0097D6 89               [ 2]    2     decw x
      0097D7 A6               [ 1]    3     nop 
      0097D8 85 CD            [ 1]    4     jrne .-4
      0097DA 91 2C            [ 2] 4544 	jra 3$
      0097DC 1F 07 CD 93      [ 1] 4545 2$: bres ADC_CR1,#ADC_CR1_ADON
      0097E0 69 72 14 00      [ 1] 4546 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001972                       4547 3$:	_drop VSIZE 
      0097E4 24 5F            [ 2]    1     addw sp,#VSIZE 
      0097E6 1F               [ 4] 4548 	ret
                                   4549 
                                   4550 ;-----------------------------
                                   4551 ; BASIC: ADCREAD (channel)
                                   4552 ; read adc channel {0..5}
                                   4553 ; output:
                                   4554 ;   A 		TK_INTGR 
                                   4555 ;   X 		value 
                                   4556 ;-----------------------------
      001975                       4557 analog_read:
      0097E7 0B 1F 09         [ 4] 4558 	call func_args 
      0097EA CD 8A            [ 1] 4559 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      0097EC 58 A1            [ 1] 4560 	jreq 1$
      0097EE 80 27 03         [ 2] 4561 	jp syntax_error
      0097F1 CC               [ 2] 4562 1$: popw x 
      0097F2 89 66 05         [ 2] 4563 	cpw x,#5 
      0097F4 23 05            [ 2] 4564 	jrule 2$
      0097F4 A3 97            [ 1] 4565 	ld a,#ERR_BAD_VALUE
      0097F6 FC 27 03         [ 2] 4566 	jp tb_error 
      0097F9 CC               [ 1] 4567 2$: ld a,xl
      0097FA 89 66 0D         [ 1] 4568 	ld acc8,a 
      0097FC A6 05            [ 1] 4569 	ld a,#5
      0097FC 72 04 00         [ 1] 4570 	sub a,acc8 
      0097FF 24 03 CC         [ 1] 4571 	ld ADC_CSR,a
      009802 89 66 CD 92      [ 1] 4572 	bset ADC_CR2,#ADC_CR2_ALIGN
      009806 89 A1 84 27      [ 1] 4573 	bset ADC_CR1,#ADC_CR1_ADON
      00980A 03 CC 89 66 1F   [ 2] 4574 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00980F 05 CD 8A         [ 2] 4575 	ldw x,ADC_DRH
      009812 58 A1            [ 1] 4576 	ld a,#TK_INTGR
      009814 00               [ 4] 4577 	ret 
                                   4578 
                                   4579 ;-----------------------
                                   4580 ; BASIC: DREAD(pin)
                                   4581 ; Arduino pins 
                                   4582 ; read state of a digital pin 
                                   4583 ; pin# {0..15}
                                   4584 ; output:
                                   4585 ;    A 		TK_INTGR
                                   4586 ;    X      0|1 
                                   4587 ;-------------------------
                           000001  4588 	PINNO=1
                           000001  4589 	VSIZE=1
      0019A9                       4590 digital_read:
      0019A9                       4591 	_vars VSIZE 
      009815 27 0E            [ 2]    1     sub sp,#VSIZE 
      009817 A1 80 26         [ 4] 4592 	call func_args
      00981A 05 A3            [ 1] 4593 	cp a,#1
      00981C 98 2C            [ 1] 4594 	jreq 1$
      00981E 27 0C E6         [ 2] 4595 	jp syntax_error
      009820 85               [ 2] 4596 1$: popw x 
      009820 55 00 03         [ 2] 4597 	cpw x,#15 
      009823 00 02            [ 2] 4598 	jrule 2$
      009825 A6 0A            [ 1] 4599 	ld a,#ERR_BAD_VALUE
      009825 AE 00 01         [ 2] 4600 	jp tb_error 
      009828 1F 03 20         [ 4] 4601 2$:	call select_pin 
      00982B 14 01            [ 1] 4602 	ld (PINNO,sp),a
      00982C E6 01            [ 1] 4603 	ld a,(GPIO_IDR,x)
      00982C 72 04            [ 1] 4604 	tnz (PINNO,sp)
      00982E 00 24            [ 1] 4605 	jreq 8$
      009830 03               [ 1] 4606 3$: srl a 
      009831 CC 89            [ 1] 4607 	dec (PINNO,sp)
      009833 66 CD            [ 1] 4608 	jrne 3$ 
      009835 92 89            [ 1] 4609 8$: and a,#1 
      009837 A1               [ 1] 4610 	clrw x 
      009838 84               [ 1] 4611 	ld xl,a 
      009839 27 03            [ 1] 4612 	ld a,#TK_INTGR
      0019D6                       4613 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00983B CC 89            [ 2]    1     addw sp,#VSIZE 
      00983D 66               [ 4] 4614 	ret
                                   4615 
                                   4616 ;-----------------------
                                   4617 ; BASIC: DWRITE pin,0|1
                                   4618 ; Arduino pins 
                                   4619 ; write to a digital pin 
                                   4620 ; pin# {0..15}
                                   4621 ; output:
                                   4622 ;    A 		TK_INTGR
                                   4623 ;    X      0|1 
                                   4624 ;-------------------------
                           000001  4625 	PINNO=1
                           000002  4626 	PINVAL=2
                           000002  4627 	VSIZE=2
      0019D9                       4628 digital_write:
      0019D9                       4629 	_vars VSIZE 
      00983E 1F 03            [ 2]    1     sub sp,#VSIZE 
      009840 CD 10 BE         [ 4] 4630 	call arg_list  
      009840 CE 00            [ 1] 4631 	cp a,#2 
      009842 05 1F            [ 1] 4632 	jreq 1$
      009844 0B CE 00         [ 2] 4633 	jp syntax_error
      009847 01               [ 2] 4634 1$: popw x 
      009848 1F               [ 1] 4635 	ld a,xl 
      009849 09 72            [ 1] 4636 	ld (PINVAL,sp),a
      00984B 15               [ 2] 4637 	popw x 
      00984C 00 24 72         [ 2] 4638 	cpw x,#15 
      00984F 5C 00            [ 2] 4639 	jrule 2$
      009851 21 81            [ 1] 4640 	ld a,#ERR_BAD_VALUE
      009853 CC 08 E8         [ 2] 4641 	jp tb_error 
      009853 72 5D 00         [ 4] 4642 2$:	call select_pin 
      009856 21 26            [ 1] 4643 	ld (PINNO,sp),a 
      009858 03 CC            [ 1] 4644 	ld a,#1
      00985A 89 66            [ 1] 4645 	tnz (PINNO,sp)
      00985C 27 05            [ 1] 4646 	jreq 4$
      00985C A6               [ 1] 4647 3$: sll a
      00985D 85 CD            [ 1] 4648 	dec (PINNO,sp)
      00985F 91 2C            [ 1] 4649 	jrne 3$
      009861 13 07            [ 1] 4650 4$: tnz (PINVAL,sp)
      009863 27 03            [ 1] 4651 	jrne 5$
      009865 CC               [ 1] 4652 	cpl a 
      009866 89 66            [ 1] 4653 	and a,(GPIO_ODR,x)
      009868 20 02            [ 2] 4654 	jra 8$
      009868 FE 72            [ 1] 4655 5$: or a,(GPIO_ODR,x)
      00986A FB 03            [ 1] 4656 8$: ld (GPIO_ODR,x),a 
      001A11                       4657 	_drop VSIZE 
      00986C 16 07            [ 2]    1     addw sp,#VSIZE 
      00986E 90               [ 4] 4658 	ret
                                   4659 
                                   4660 
                                   4661 ;-----------------------
                                   4662 ; BASIC: STOP
                                   4663 ; stop progam execution  
                                   4664 ; without resetting pointers 
                                   4665 ; the program is resumed
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4666 ; with RUN 
                                   4667 ;-------------------------
      001A14                       4668 stop:
      00986F FF A6 80 15 03   [ 2] 4669 	btjt flags,#FRUN,2$
      009874 2A               [ 1] 4670 	clr a
      009875 06               [ 4] 4671 	ret 
      001A1B                       4672 2$:	 
                                   4673 ; create space on cstack to save context 
      009876 13 05 2F         [ 2] 4674 	ldw x,#break_point 
      009879 1B 20 04         [ 4] 4675 	call puts 
      00987C                       4676 	_drop 2 ;drop return address 
      00987C 13 05            [ 2]    1     addw sp,#2 
      001A23                       4677 	_vars CTXT_SIZE ; context size 
      00987E 2C 15            [ 2]    1     sub sp,#CTXT_SIZE 
      009880 CD 16 10         [ 4] 4678 	call save_context 
      009880 1E 0B CF         [ 2] 4679 	ldw x,#tib 
      009883 00 05 72         [ 2] 4680 	ldw basicptr,x
      009886 01               [ 1] 4681 	clr (x)
      009887 00 24 05 E6      [ 1] 4682 	clr count  
      00988B 02               [ 1] 4683 	clrw x 
      00988C C7 00 04         [ 2] 4684 	ldw in.w,x
      00988F 1E 09 CF 00      [ 1] 4685 	bres flags,#FRUN 
      009893 01 81 00 23      [ 1] 4686 	bset flags,#FBREAK
      009895 CC 09 8C         [ 2] 4687 	jp interpreter 
      009895 85 5B 0A 72 5A 00 21  4688 break_point: .asciz "\nbreak point, RUN to resume.\n"
             FC 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4689 
                                   4690 ;-----------------------
                                   4691 ; BASIC: NEW
                                   4692 ; from command line only 
                                   4693 ; free program memory
                                   4694 ; and clear variables 
                                   4695 ;------------------------
      00989D                       4696 new: 
      00989D CD 92 89 A1 84   [ 2] 4697 	btjf flags,#FRUN,0$ 
      0098A2 27               [ 4] 4698 	ret 
      001A66                       4699 0$:	
      0098A3 03 CC 89         [ 4] 4700 	call clear_basic 
      0098A6 66               [ 4] 4701 	ret 
                                   4702 	 
                                   4703 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4704 ;  file system routines
                                   4705 ;  MCU flash memory from
                                   4706 ;  0x10000-0x27fff is 
                                   4707 ;  used to store BASIC 
                                   4708 ;  program files. 
                                   4709 ;  use 128 bytes sectors
                                   4710 ;  because this is the MCU 
                                   4711 ;  row size.
                                   4712 ;  file entry aligned to row
                                   4713 ;  	name  variable length
                                   4714 ;  	size  2 bytes  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4715 ; 	data  variable length 
                                   4716 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4717 
                                   4718 ;---------------------------
                                   4719 ; fill pad with zeros 
                                   4720 ;--------------------------
      001A6A                       4721 zero_pad:
      0098A7 CD 84 E6         [ 2] 4722 	ldw x,#pad 
      0098AA 5D 26            [ 1] 4723 	ld a,#PAD_SIZE 
      0098AC 05               [ 1] 4724 1$:	clr (x)
      0098AD A6               [ 1] 4725 	incw x 
      0098AE 05               [ 1] 4726 	dec a 
      0098AF CC 89            [ 1] 4727 	jrne 1$
      0098B1 68               [ 4] 4728 	ret 
                                   4729 
                                   4730 ;--------------------------
                                   4731 ; align farptr to BLOCK_SIZE 
                                   4732 ;---------------------------
      001A75                       4733 row_align:
      0098B2 81 7F            [ 1] 4734 	ld a,#0x7f 
      0098B3 C4 00 18         [ 1] 4735 	and a,farptr+2 
      0098B3 72 00            [ 1] 4736 	jreq 1$ 
      0098B5 00 24 06         [ 2] 4737 	ldw x,farptr+1 
      0098B8 A6 06 CC         [ 2] 4738 	addw x,#BLOCK_SIZE 
      0098BB 89 68            [ 1] 4739 	jrnc 0$
      0098BD 81 CD 98 9D      [ 1] 4740 	inc farptr 
      0098C1 9F               [ 1] 4741 0$: ld a,xl 
      0098C1 CF 00            [ 1] 4742 	and a,#0x80
      0098C3 05               [ 1] 4743 	ld xl,a
      0098C4 E6 02 C7         [ 2] 4744 	ldw farptr+1,x  	
      0098C7 00               [ 4] 4745 1$:	ret
                                   4746 
                                   4747 ;--------------------
                                   4748 ; input:
                                   4749 ;   X     increment 
                                   4750 ; output:
                                   4751 ;   farptr  incremented 
                                   4752 ;---------------------
      001A90                       4753 incr_farptr:
      0098C8 04 35 03 00      [ 2] 4754 	addw x,farptr+1 
      0098CC 02 81            [ 1] 4755 	jrnc 1$
      0098CE 72 5C 00 16      [ 1] 4756 	inc farptr 
      0098CE 72 00 00         [ 2] 4757 1$:	ldw farptr+1,x  
      0098D1 24               [ 4] 4758 	ret 
                                   4759 
                                   4760 ;------------------------------
                                   4761 ; extended flash memory used as FLASH_DRIVE 
                                   4762 ; seek end of used flash drive   
                                   4763 ; starting at 0x10000 address.
                                   4764 ; 4 consecutives 0 bytes signal free space. 
                                   4765 ; input:
                                   4766 ;	none
                                   4767 ; output:
                                   4768 ;   ffree     free_addr| 0 if memory full.
                                   4769 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001A9E                       4770 seek_fdrive:
                                   4771 ; start scan at 0x10000 address 
      0098D2 06 A6            [ 1] 4772 	ld a,#1
      0098D4 06 CC 89         [ 1] 4773 	ld farptr,a 
      0098D7 68               [ 1] 4774 	clrw x 
      0098D8 81 85 52         [ 2] 4775 	ldw farptr+1,x 
      001AA7                       4776 1$:
      0098DB 04 89 CE         [ 2] 4777 	ldw x,#3  
      0098DE 00 05 1F 03      [ 5] 4778 2$:	ldf a,([farptr],x) 
      0098E2 CD 98            [ 1] 4779 	jrne 3$
      0098E4 9D               [ 2] 4780 	decw x
      0098E5 89 CE            [ 1] 4781 	jrpl 2$
      0098E7 00 01            [ 2] 4782 	jra 4$ 
      0098E9 1F 07 85         [ 2] 4783 3$:	ldw x,#BLOCK_SIZE 
      0098EC 20 D3 90         [ 4] 4784 	call incr_farptr
      0098EE AE 02 80         [ 2] 4785 	ldw x,#0x280  
      0098EE 72 00 00         [ 2] 4786 	cpw x,farptr
      0098F1 24 05            [ 1] 4787 	jrmi 1$
      001AC3                       4788 4$: ; copy farptr to ffree	 
      0098F3 A6 06 CC         [ 2] 4789 	ldw x,farptr 
      0098F6 89 68 18         [ 1] 4790 	ld a,farptr+2 
      0098F8 CF 00 19         [ 2] 4791 	ldw ffree,x 
      0098F8 1E 03 CF         [ 1] 4792 	ld ffree+2,a  
      0098FB 00               [ 4] 4793 	ret 
                                   4794 
                                   4795 ;-----------------------
                                   4796 ; return amount of free 
                                   4797 ; space on flash drive
                                   4798 ; input:
                                   4799 ;   none
                                   4800 ; output:
                                   4801 ;   acc24   free space 
                                   4802 ;-----------------------
      001AD0                       4803 disk_free:
      0098FC 05 E6 02         [ 2] 4804 	ldw x,#0x8000
      0098FF C7 00 04 1E      [ 2] 4805 	subw x,ffree+1
      009903 05 CF            [ 1] 4806 	ld a,#2
      009905 00 01 85         [ 1] 4807 	sbc a,ffree 
      009908 5B 04 89         [ 1] 4808 	ld acc24,a 
      00990B 81 00 0C         [ 2] 4809 	ldw acc16,x 
      00990C 81               [ 4] 4810 	ret 
                                   4811 
                                   4812 ;-----------------------
                                   4813 ; compare file name 
                                   4814 ; with name pointed by Y  
                                   4815 ; input:
                                   4816 ;   farptr   file name 
                                   4817 ;   Y        target name 
                                   4818 ; output:
                                   4819 ;   farptr 	 at file_name
                                   4820 ;   X 		 farptr[x] point at size field  
                                   4821 ;   Carry    0|1 no match|match  
                                   4822 ;----------------------
      001AE3                       4823 cmp_name:
      00990C 72               [ 1] 4824 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00990D 01 00 24 02      [ 5] 4825 1$:	ldf a,([farptr],x)
      009911 4F 81            [ 1] 4826 	cp a,(y)
      009913 26 08            [ 1] 4827 	jrne 4$
      009913 72               [ 1] 4828 	tnz a 
      009914 09 00            [ 1] 4829 	jreq 9$ 
      009916 24               [ 1] 4830     incw x 
      009917 12 5B            [ 1] 4831 	incw y 
      009919 02 CD            [ 2] 4832 	jra 1$
      001AF4                       4833 4$: ;no match 
      00991B 96               [ 1] 4834 	tnz a 
      00991C A0 5B            [ 1] 4835 	jreq 5$
      00991E 04               [ 1] 4836 	incw x 
      00991F 72 19 00 24      [ 5] 4837 	ldf a,([farptr],x)
      009923 72 10            [ 2] 4838 	jra 4$  
      009925 00               [ 1] 4839 5$:	incw x ; farptr[x] point at 'size' field 
      009926 24               [ 1] 4840 	rcf 
      009927 CC               [ 4] 4841 	ret
      001B01                       4842 9$: ; match  
      009928 8A               [ 1] 4843 	incw x  ; farptr[x] at 'size' field 
      009929 0C               [ 1] 4844 	scf 
      00992A CE               [ 4] 4845 	ret 
                                   4846 
                                   4847 ;-----------------------
                                   4848 ; search file in 
                                   4849 ; flash memory 
                                   4850 ; input:
                                   4851 ;   Y       file name  
                                   4852 ; output:
                                   4853 ;   farptr  addr at name|0
                                   4854 ;   X       offset to size field
                                   4855 ;-----------------------
                           000001  4856 	FSIZE=1
                           000003  4857 	YSAVE=3
                           000004  4858 	VSIZE=4 
      001B04                       4859 search_file: 
      001B04                       4860 	_vars VSIZE
      00992B 00 1D            [ 2]    1     sub sp,#VSIZE 
      00992D C3 00            [ 2] 4861 	ldw (YSAVE,sp),y  
      00992F 1F               [ 1] 4862 	clrw x 
      009930 2B 0C AE         [ 2] 4863 	ldw farptr+1,x 
      009933 88 FF CD AA      [ 1] 4864 	mov farptr,#1
      001B10                       4865 1$:	
                                   4866 ; check if farptr is after any file 
                                   4867 ; if  0 then so.
      009937 C0 55 00 04      [ 5] 4868 	ldf a,[farptr]
      00993B 00 02            [ 1] 4869 	jreq 6$
      00993D 81               [ 1] 4870 2$: clrw x 	
      00993E 16 03            [ 2] 4871 	ldw y,(YSAVE,sp) 
      00993E CD 93 36         [ 4] 4872 	call cmp_name
      009941 5B 02            [ 1] 4873 	jrc 9$
      009943 5F CF 00 07      [ 5] 4874 	ldf a,([farptr],x)
      009947 72 5F            [ 1] 4875 	ld (FSIZE,sp),a 
      009949 00               [ 1] 4876 	incw x 
      00994A 09 72 5F 00      [ 5] 4877 	ldf a,([farptr],x)
      00994E 0A CE            [ 1] 4878 	ld (FSIZE+1,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009950 00               [ 1] 4879 	incw x 
      009951 1D CF 00         [ 2] 4880 	addw x,(FSIZE,sp) ; skip over file data
      009954 05 E6 02         [ 4] 4881 	call incr_farptr
      009957 C7 00 04         [ 4] 4882 	call row_align  
      00995A 35 03 00         [ 2] 4883 	ldw x,#0x280
      00995D 02 72 10         [ 2] 4884 	cpw x,farptr 
      009960 00 24            [ 1] 4885 	jrpl 1$
      001B3D                       4886 6$: ; file not found 
      009962 CC 8A 0C 16      [ 1] 4887 	clr farptr
      009965 72 5F 00 17      [ 1] 4888 	clr farptr+1 
      009965 AE 17 FF 94      [ 1] 4889 	clr farptr+2 
      001B49                       4890 	_drop VSIZE 
      009969 CC 89            [ 2]    1     addw sp,#VSIZE 
      00996B ED               [ 1] 4891 	rcf
      00996C 81               [ 4] 4892 	ret
      001B4D                       4893 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B4D                       4894 	_drop VSIZE 
      00996C AE 00            [ 2]    1     addw sp,#VSIZE 
      00996E 64               [ 1] 4895 	scf 	
      00996F 90               [ 4] 4896 	ret
                                   4897 
                                   4898 ;--------------------------------
                                   4899 ; BASIC: SAVE "name" 
                                   4900 ; save text program in 
                                   4901 ; flash memory used as permanent
                                   4902 ; storage from address 0x10000-0x27fff 
                                   4903 ;--------------------------------
                           000001  4904 	BSIZE=1
                           000003  4905 	NAMEPTR=3
                           000005  4906 	XSAVE=5
                           000007  4907 	YSAVE=7
                           000008  4908 	VSIZE=8 
      001B51                       4909 save:
      009970 AE 03 E8 20 0D   [ 2] 4910 	btjf flags,#FRUN,0$ 
      009975 A6 07            [ 1] 4911 	ld a,#ERR_CMD_ONLY 
      009975 CD 91 3E         [ 2] 4912 	jp tb_error
      001B5B                       4913 0$:	 
      009978 A1 02 27         [ 2] 4914 	ldw x,txtend 
      00997B 03 CC 89 66      [ 2] 4915 	subw x,txtbgn
      00997F 26 0C            [ 1] 4916 	jrne 1$
                                   4917 ; nothing to save 
      00997F 85 90 85         [ 2] 4918 	ldw x,#err_no_prog 
      009982 CD 00 00         [ 4] 4919 	call puts 
      009982 89 AE F4 24 65   [ 1] 4920 	mov in,count 
      009987 90               [ 4] 4921 	ret  	
      001B70                       4922 1$:	
      001B70                       4923 	_vars VSIZE 
      009988 A3 7A            [ 2]    1     sub sp,#VSIZE 
      00998A 12 2B            [ 2] 4924 	ldw (BSIZE,sp),x 
      00998C 01 5C D8         [ 4] 4925 	call next_token	
      00998E A1 02            [ 1] 4926 	cp a,#TK_QSTR
      00998E 9E C7            [ 1] 4927 	jreq 2$
      009990 53 0D 9F         [ 2] 4928 	jp syntax_error
      001B7E                       4929 2$: 
      009993 C7 53            [ 2] 4930 	ldw (NAMEPTR,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009995 0E 8C 56         [ 4] 4931 	call move_prg_to_ram ; move flashing program to 'tib' buffer 
                                   4932 ; check if enough free space 
      009998 9E C7 53         [ 4] 4933 	call strlen 
      00999B 0F 9F            [ 1] 4934 	add a,#3
      00999D C7               [ 1] 4935 	clrw x 
      00999E 53               [ 1] 4936 	ld xl,a 
      00999F 10 72 10         [ 2] 4937 	addw x,(BSIZE,sp)
      0099A2 53               [ 1] 4938 	clr a 
      0099A3 08 72 10 53      [ 2] 4939 	addw x,ffree+1 
      0099A7 00 72 10         [ 1] 4940 	adc a,ffree 
      0099AA 53 04            [ 1] 4941 	cp a,#2
      0099AC 85 CD            [ 1] 4942 	jrmi 21$
      0099AE 9F 32 72         [ 2] 4943 	cpw x,#0x8000
      0099B1 11 53            [ 1] 4944 	jrmi 21$
      0099B3 08 72            [ 1] 4945 	ld a,#ERR_NO_FSPACE  
      0099B5 11 53 00         [ 2] 4946 	jp tb_error
      001BA3                       4947 21$: 
                                   4948 ; check for existing file of that name 
      0099B8 81 03            [ 2] 4949 	ldw y,(NAMEPTR,sp)	
      0099B9 CD 1B 04         [ 4] 4950 	call search_file 
      0099B9 CD 91            [ 1] 4951 	jrnc 3$ 
      0099BB 3E A1            [ 1] 4952 	ld a,#ERR_DUPLICATE 
      0099BD 02 27 0B         [ 2] 4953 	jp tb_error 
      001BAF                       4954 3$:	; initialize farptr 
      0099C0 A1 01 27         [ 2] 4955 	ldw x,ffree 
      0099C3 03 CC 89         [ 1] 4956 	ld a,ffree+2 
      0099C6 66 AE 00         [ 2] 4957 	ldw farptr,x 
      0099C9 00 89 1E         [ 1] 4958 	ld farptr+2,a 
                                   4959 ;** write file name to row buffer **	
      0099CC 03 5D            [ 2] 4960 	ldw y,(NAMEPTR,sp)  
      0099CE 27 1A 1E         [ 2] 4961 	ldw x,#pad 
      0099D1 01 9F A4         [ 4] 4962 	call strcpy
      0099D4 07 4E C7         [ 4] 4963 	call strlen 
      0099D7 54               [ 1] 4964 	clrw x 
      0099D8 01               [ 1] 4965 	ld xl,a 
      0099D9 72               [ 1] 4966 	incw  x
      0099DA 16 50 CA         [ 2] 4967 	addw x,#pad 
                                   4968 ; ** write file size to row buffer 
      0099DD 72 10            [ 2] 4969 	ldw y,(BSIZE,sp)
      0099DF 54               [ 2] 4970 	ldw (x),y 
      0099E0 01 AE 00         [ 2] 4971 	addw x,#2 
                                   4972 ; ** write file data to row buffer 
      0099E3 1B 5A 9D 26      [ 2] 4973 	ldw y,txtbgn 
      0099E7 FA 20            [ 1] 4974 6$:	ld a,(y)
      0099E9 08 72            [ 1] 4975 	incw y
      0099EB 11               [ 1] 4976 	ld (x),a 
      0099EC 54               [ 1] 4977 	incw x
      0099ED 01 72 17 50      [ 2] 4978 	cpw y,txtend 
      0099F1 CA 5B            [ 1] 4979 	jreq 12$
      0099F3 04 81 60         [ 2] 4980 	cpw x,#stack_full 
      0099F5 2B EF            [ 1] 4981 	jrmi 6$
      001BE7                       4982 12$:
      0099F5 CD 91            [ 2] 4983 	ldw (YSAVE,sp),y 
      001BE9                       4984 14$: ; zero buffer end 
      0099F7 39 A1 01         [ 2] 4985 	cpw x,#stack_full
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099FA 27 03            [ 1] 4986 	jreq 16$
      0099FC CC               [ 1] 4987 	clr (x)
      0099FD 89               [ 1] 4988 	incw x 
      0099FE 66 85            [ 2] 4989 	jra 14$
      001BF2                       4990 16$:
      009A00 A3 00 05         [ 2] 4991 	ldw x,#pad 
      009A03 23 05 A6         [ 4] 4992 	call write_row 
      009A06 0A CC 89         [ 2] 4993 	ldw x,#BLOCK_SIZE 
      009A09 68 9F C7         [ 4] 4994 	call incr_farptr
      009A0C 00 0E A6         [ 2] 4995 	ldw x,#pad 
      009A0F 05 C0            [ 2] 4996 	ldw y,(YSAVE,sp)
      009A11 00 0E C7 54      [ 2] 4997 	cpw y,txtend 
      009A15 00 72            [ 1] 4998 	jrmi 6$
                                   4999 ; save farptr in ffree
      009A17 16 54 02         [ 2] 5000 	ldw x,farptr 
      009A1A 72 10 54         [ 1] 5001 	ld a,farptr+2 
      009A1D 01 72 0F         [ 2] 5002 	ldw ffree,x 
      009A20 54 00 FB         [ 1] 5003 	ld ffree+2,a
                                   5004 ; print file size 	
      009A23 CE 54            [ 2] 5005 	ldw x,(BSIZE,sp) 
      009A25 04 A6 84         [ 4] 5006 	call print_int 
      001C1A                       5007 	_drop VSIZE 
      009A28 81 08            [ 2]    1     addw sp,#VSIZE 
      009A29 81               [ 4] 5008 	ret 
                                   5009 
                                   5010 ;----------------------
                                   5011 ; load file in RAM memory
                                   5012 ; input:
                                   5013 ;    farptr point at file size 
                                   5014 ; output:
                                   5015 ;   y point after BASIC program in RAM.
                                   5016 ;------------------------
      001C1D                       5017 load_file:
      009A29 52 01 CD         [ 4] 5018 	call incr_farptr  
      009A2C 91 39 A1         [ 4] 5019 	call clear_basic  
      009A2F 01               [ 1] 5020 	clrw x
      009A30 27 03 CC 89      [ 5] 5021 	ldf a,([farptr],x)
      009A34 66 85            [ 1] 5022 	ld yh,a 
      009A36 A3               [ 1] 5023 	incw x  
      009A37 00 0F 23 05      [ 5] 5024 	ldf a,([farptr],x)
      009A3B A6               [ 1] 5025 	incw x 
      009A3C 0A CC            [ 1] 5026 	ld yl,a 
      009A3E 89 68 CD A0      [ 2] 5027 	addw y,txtbgn
      009A42 70 6B 01 E6      [ 2] 5028 	ldw txtend,y
      009A46 01 0D 01 27      [ 2] 5029 	ldw y,txtbgn
      001C3E                       5030 3$:	; load BASIC text 	
      009A4A 05 44 0A 01      [ 5] 5031 	ldf a,([farptr],x)
      009A4E 26 FB            [ 1] 5032 	ld (y),a 
      009A50 A4               [ 1] 5033 	incw x 
      009A51 01 5F            [ 1] 5034 	incw y 
      009A53 97 A6 84 5B      [ 2] 5035 	cpw y,txtend 
      009A57 01 81            [ 1] 5036 	jrmi 3$
      009A59 81               [ 4] 5037 	ret 
                                   5038 
                                   5039 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5040 ; BASIC: LOAD "file" 
                                   5041 ; load file to RAM 
                                   5042 ; for execution 
                                   5043 ;------------------------
      001C4E                       5044 load:
      009A59 52 02 CD 91 3E   [ 2] 5045 	btjf flags,#FRUN,0$ 
      009A5E A1 02            [ 1] 5046 	jreq 0$ 
      009A60 27 03            [ 1] 5047 	ld a,#ERR_CMD_ONLY 
      009A62 CC 89 66         [ 2] 5048 	jp tb_error 
      001C5A                       5049 0$:	
      009A65 85 9F 6B         [ 4] 5050 	call next_token 
      009A68 02 85            [ 1] 5051 	cp a,#TK_QSTR
      009A6A A3 00            [ 1] 5052 	jreq 1$
      009A6C 0F 23 05         [ 2] 5053 	jp syntax_error 
      009A6F A6 0A            [ 1] 5054 1$:	ldw y,x 
      009A71 CC 89 68         [ 4] 5055 	call search_file 
      009A74 CD A0            [ 1] 5056 	jrc 2$ 
      009A76 70 6B            [ 1] 5057 	ld a,#ERR_NOT_FILE
      009A78 01 A6 01         [ 2] 5058 	jp tb_error  
      001C70                       5059 2$:
      009A7B 0D 01 27         [ 4] 5060 	call load_file
                                   5061 ; print loaded size 	 
      009A7E 05 48 0A         [ 2] 5062 	ldw x,txtend 
      009A81 01 26 FB 0D      [ 2] 5063 	subw x,txtbgn
      009A85 02 26 05         [ 4] 5064 	call print_int 
      009A88 43               [ 4] 5065 	ret 
                                   5066 
                                   5067 ;-----------------------------------
                                   5068 ; BASIC: FORGET ["file_name"] 
                                   5069 ; erase file_name and all others 
                                   5070 ; after it. 
                                   5071 ; without argument erase all files 
                                   5072 ;-----------------------------------
                           000001  5073 	NEW_FREE=1 
                           000003  5074 	VSIZE=3 
      001C7E                       5075 forget:
      001C7E                       5076 	_vars VSIZE 
      009A89 E4 00            [ 2]    1     sub sp,#VSIZE 
      009A8B 20 02 EA         [ 4] 5077 	call next_token 
      009A8E 00 E7            [ 1] 5078 	cp a,#TK_NONE 
      009A90 00 5B            [ 1] 5079 	jreq 3$ 
      009A92 02 81            [ 1] 5080 	cp a,#TK_QSTR
      009A94 27 03            [ 1] 5081 	jreq 1$
      009A94 72 00 00         [ 2] 5082 	jp syntax_error
      009A97 24 02            [ 1] 5083 1$: ldw y,x 
      009A99 4F 81 03 00 01   [ 1] 5084 	mov in,count 
      009A9B CD 1B 04         [ 4] 5085 	call search_file
      009A9B AE 9A            [ 1] 5086 	jrc 2$
      009A9D C2 CD            [ 1] 5087 	ld a,#ERR_NOT_FILE 
      009A9F AA C0 5B         [ 2] 5088 	jp tb_error 
      001C9F                       5089 2$: 
      009AA2 02 52 04         [ 2] 5090 	ldw x,farptr
      009AA5 CD 96 90         [ 1] 5091 	ld a,farptr+2
      009AA8 AE 16            [ 2] 5092 	jra 4$ 
      001CA7                       5093 3$: ; forget all files 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AAA 90 CF 00         [ 2] 5094 	ldw x,#0x100
      009AAD 05               [ 1] 5095 	clr a 
      009AAE 7F 72 5F         [ 2] 5096 	ldw farptr,x 
      009AB1 00 04 5F         [ 1] 5097 	ld farptr+2,a 
      001CB1                       5098 4$:	; save new free address 
      009AB4 CF 00            [ 2] 5099 	ldw (NEW_FREE,sp),x
      009AB6 01 72            [ 1] 5100 	ld (NEW_FREE+2,sp),a 
      009AB8 11 00 24         [ 4] 5101 	call move_erase_to_ram
      009ABB 72 18 00         [ 4] 5102 5$: call block_erase 
      009ABE 24 CC 8A         [ 2] 5103 	ldw x,#BLOCK_SIZE 
      009AC1 0C 0A 62         [ 4] 5104 	call incr_farptr 
      009AC4 72 65 61         [ 4] 5105 	call row_align 
                                   5106 ; check if all blocks erased
      009AC7 6B 20 70         [ 1] 5107 	ld a,farptr+2  
      009ACA 6F 69 6E         [ 1] 5108 	sub a,ffree+2
      009ACD 74 2C 20         [ 1] 5109 	ld a,farptr+1 
      009AD0 52 55 4E         [ 1] 5110 	sbc a,ffree+1 
      009AD3 20 74 6F         [ 1] 5111 	ld a,farptr 
      009AD6 20 72 65         [ 1] 5112 	sbc a,ffree 
      009AD9 73 75            [ 1] 5113 	jrmi 5$ 
      009ADB 6D 65            [ 1] 5114 	ld a,(NEW_FREE+2,sp)
      009ADD 2E 0A            [ 2] 5115 	ldw x,(NEW_FREE,sp)
      009ADF 00 00 1B         [ 1] 5116 	ld ffree+2,a 
      009AE0 CF 00 19         [ 2] 5117 	ldw ffree,x 
      001CE2                       5118 	_drop VSIZE 
      009AE0 72 01            [ 2]    1     addw sp,#VSIZE 
      009AE2 00               [ 4] 5119 	ret 
                                   5120 
                                   5121 ;----------------------
                                   5122 ; BASIC: DIR 
                                   5123 ; list saved files 
                                   5124 ;----------------------
                           000001  5125 	COUNT=1 ; files counter 
                           000002  5126 	VSIZE=2 
      001CE5                       5127 directory:
      001CE5                       5128 	_vars VSIZE 
      009AE3 24 01            [ 2]    1     sub sp,#VSIZE 
      009AE5 81               [ 1] 5129 	clrw x 
      009AE6 1F 01            [ 2] 5130 	ldw (COUNT,sp),x 
      009AE6 CD 87 D0         [ 2] 5131 	ldw farptr+1,x 
      009AE9 81 01 00 16      [ 1] 5132 	mov farptr,#1 
      009AEA                       5133 dir_loop:
      009AEA AE               [ 1] 5134 	clrw x 
      009AEB 16 E0 A6 80      [ 5] 5135 	ldf a,([farptr],x)
      009AEF 7F 5C            [ 1] 5136 	jreq 8$ 
      001CF8                       5137 1$: ;name loop 	
      009AF1 4A 26 FB 81      [ 5] 5138 	ldf a,([farptr],x)
      009AF5 27 06            [ 1] 5139 	jreq 2$ 
      009AF5 A6 7F C4         [ 4] 5140 	call putc 
      009AF8 00               [ 1] 5141 	incw x 
      009AF9 19 27            [ 2] 5142 	jra 1$
      009AFB 13               [ 1] 5143 2$: incw x ; skip ending 0. 
      009AFC CE 00            [ 1] 5144 	ld a,#SPACE 
      009AFE 18 1C 00         [ 4] 5145 	call putc 
                                   5146 ; get file size 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B01 80 24 04 72      [ 5] 5147 	ldf a,([farptr],x)
      009B05 5C 00            [ 1] 5148 	ld yh,a 
      009B07 17               [ 1] 5149 	incw x 
      009B08 9F A4 80 97      [ 5] 5150 	ldf a,([farptr],x)
      009B0C CF               [ 1] 5151 	incw x 
      009B0D 00 18            [ 1] 5152 	ld yl,a 
      009B0F 81 89            [ 2] 5153 	pushw y 
      009B10 72 FB 01         [ 2] 5154 	addw x,(1,sp)
                                   5155 ; skip to next file 
      009B10 72 BB 00         [ 4] 5156 	call incr_farptr
      009B13 18 24 04         [ 4] 5157 	call row_align
                                   5158 ; print file size 
      009B16 72               [ 2] 5159 	popw x ; file size 
      009B17 5C 00 17         [ 4] 5160 	call print_int 
      009B1A CF 00            [ 1] 5161 	ld a,#CR 
      009B1C 18 81 F8         [ 4] 5162 	call putc
      009B1E 1E 01            [ 2] 5163 	ldw x,(COUNT,sp)
      009B1E A6               [ 1] 5164 	incw x
      009B1F 01 C7            [ 2] 5165 	ldw (COUNT,sp),x  
      009B21 00 17            [ 2] 5166 	jra dir_loop
      001D33                       5167 8$: ; print number of files 
      009B23 5F CF            [ 2] 5168 	ldw x,(COUNT,sp)
      009B25 00 18 39         [ 4] 5169 	call print_int 
      009B27 AE 1D 52         [ 2] 5170 	ldw x,#file_count 
      009B27 AE 00 03         [ 4] 5171 	call puts  
                                   5172 ; print drive free space 	
      009B2A 92 AF 00         [ 4] 5173 	call disk_free
      009B2D 17               [ 1] 5174 	clrw x  
      009B2E 26 05 5A 2A      [ 1] 5175 	mov base,#10 
      009B32 F7 20 0E         [ 4] 5176 	call prti24 
      009B35 AE 00 80         [ 2] 5177 	ldw x,#drive_free
      009B38 CD 9B 10         [ 4] 5178 	call puts 
      001D4F                       5179 	_drop VSIZE 
      009B3B AE 02            [ 2]    1     addw sp,#VSIZE 
      009B3D 80               [ 4] 5180 	ret
      009B3E C3 00 17 2B E4 73 0A  5181 file_count: .asciz " files\n"
             00
      009B43 20 62 79 74 65 73 20  5182 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5183 
                                   5184 ;---------------------
                                   5185 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5186 ; write 1 or more byte to FLASH or EEPROM
                                   5187 ; starting at address  
                                   5188 ; input:
                                   5189 ;   expr1  	is address 
                                   5190 ;   expr2,...,exprn   are bytes to write
                                   5191 ; output:
                                   5192 ;   none 
                                   5193 ;---------------------
                           000001  5194 	ADDR=1
                           000002  5195 	VSIZ=2 
      001D67                       5196 write:
      001D67                       5197 	_vars VSIZE 
      009B43 CE 00            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B45 17 C6 00 19      [ 1] 5198 	clr farptr ; expect 16 bits address 
      009B49 CF 00 1A         [ 4] 5199 	call expression
      009B4C C7 00            [ 1] 5200 	cp a,#TK_INTGR 
      009B4E 1C 81            [ 1] 5201 	jreq 0$
      009B50 CC 08 E6         [ 2] 5202 	jp syntax_error
      009B50 AE 80            [ 2] 5203 0$: ldw (ADDR,sp),x 
      009B52 00 72 B0         [ 4] 5204 	call next_token 
      009B55 00 1B            [ 1] 5205 	cp a,#TK_COMMA 
      009B57 A6 02            [ 1] 5206 	jreq 1$ 
      009B59 C2 00            [ 2] 5207 	jra 9$ 
      009B5B 1A C7 00         [ 4] 5208 1$:	call expression
      009B5E 0C CF            [ 1] 5209 	cp a,#TK_INTGR
      009B60 00 0D            [ 1] 5210 	jreq 2$
      009B62 81 08 E6         [ 2] 5211 	jp syntax_error
      009B63 9F               [ 1] 5212 2$:	ld a,xl 
      009B63 5F 92            [ 2] 5213 	ldw x,(ADDR,sp) 
      009B65 AF 00 17         [ 2] 5214 	ldw farptr+1,x 
      009B68 90               [ 1] 5215 	clrw x 
      009B69 F1 26 08         [ 4] 5216 	call write_byte
      009B6C 4D 27            [ 2] 5217 	ldw x,(ADDR,sp)
      009B6E 12               [ 1] 5218 	incw x 
      009B6F 5C 90            [ 2] 5219 	jra 0$ 
      001D9B                       5220 9$:
      001D9B                       5221 	_drop VSIZE
      009B71 5C 20            [ 2]    1     addw sp,#VSIZE 
      009B73 F0               [ 4] 5222 	ret 
                                   5223 
                                   5224 
                                   5225 ;---------------------
                                   5226 ;BASIC: CHAR(expr)
                                   5227 ; évaluate expression 
                                   5228 ; and take the 7 least 
                                   5229 ; bits as ASCII character
                                   5230 ; return a TK_CHAR 
                                   5231 ;---------------------
      009B74                       5232 char:
      009B74 4D 27 07         [ 4] 5233 	call func_args 
      009B77 5C 92            [ 1] 5234 	cp a,#1
      009B79 AF 00            [ 1] 5235 	jreq 1$
      009B7B 17 20 F6         [ 2] 5236 	jp syntax_error
      009B7E 5C               [ 2] 5237 1$:	popw x 
      009B7F 98               [ 1] 5238 	ld a,xl 
      009B80 81 7F            [ 1] 5239 	and a,#0x7f 
      009B81 97               [ 1] 5240 	ld xl,a
      009B81 5C 99            [ 1] 5241 	ld a,#TK_CHAR
      009B83 81               [ 4] 5242 	ret
                                   5243 
                                   5244 ;---------------------
                                   5245 ; BASIC: ASC(string|char|TK_CFUNC)
                                   5246 ; extract first character 
                                   5247 ; of string argument 
                                   5248 ; return it as TK_INTGR 
                                   5249 ;---------------------
      009B84                       5250 ascii:
      009B84 52 04            [ 1] 5251 	ld a,#TK_LPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009B86 17 03 5F         [ 4] 5252 	call expect 
      009B89 CF 00 18         [ 4] 5253 	call next_token 
      009B8C 35 01            [ 1] 5254 	cp a,#TK_QSTR 
      009B8E 00 17            [ 1] 5255 	jreq 1$
      009B90 A1 03            [ 1] 5256 	cp a,#TK_CHAR 
      009B90 92 BC            [ 1] 5257 	jreq 2$ 
      009B92 00 17            [ 1] 5258 	cp a,#TK_CFUNC 
      009B94 27 27            [ 1] 5259 	jreq 0$
      009B96 5F 16 03         [ 2] 5260 	jp syntax_error
      009B99 CD               [ 4] 5261 0$: call (x)
      009B9A 9B 63            [ 2] 5262 	jra 2$
      001DCA                       5263 1$: 
      009B9C 25               [ 1] 5264 	ld a,(x) 
      009B9D 2F               [ 1] 5265 	clrw x
      009B9E 92               [ 1] 5266 	ld xl,a 
      001DCD                       5267 2$: 
      009B9F AF               [ 2] 5268 	pushw x 
      009BA0 00 17            [ 1] 5269 	ld a,#TK_RPAREN 
      009BA2 6B 01 5C         [ 4] 5270 	call expect
      009BA5 92               [ 2] 5271 	popw x 
      009BA6 AF 00            [ 1] 5272 	ld a,#TK_INTGR 
      009BA8 17               [ 4] 5273 	ret 
                                   5274 
                                   5275 ;---------------------
                                   5276 ;BASIC: KEY
                                   5277 ; wait for a character 
                                   5278 ; received from STDIN 
                                   5279 ; input:
                                   5280 ;	none 
                                   5281 ; output:
                                   5282 ;	X 		ASCII character 
                                   5283 ;---------------------
      001DD7                       5284 key:
      009BA9 6B 02 5C         [ 4] 5285 	call getc 
      009BAC 72               [ 1] 5286 	clrw x 
      009BAD FB               [ 1] 5287 	ld xl,a 
      009BAE 01 CD            [ 1] 5288 	ld a,#TK_INTGR
      009BB0 9B               [ 4] 5289 	ret
                                   5290 
                                   5291 ;----------------------
                                   5292 ; BASIC: QKEY
                                   5293 ; Return true if there 
                                   5294 ; is a character in 
                                   5295 ; waiting in STDIN 
                                   5296 ; input:
                                   5297 ;  none 
                                   5298 ; output:
                                   5299 ;   X 		0|-1 
                                   5300 ;-----------------------
      001DDF                       5301 qkey:: 
      009BB1 10               [ 1] 5302 	clrw x 
      009BB2 CD 9A F5         [ 1] 5303 	ld a,rx_head
      009BB5 AE 02 80         [ 1] 5304 	cp a,rx_tail 
      009BB8 C3 00            [ 1] 5305 	jreq 9$ 
      009BBA 17               [ 2] 5306 	cplw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009BBB 2A D3            [ 1] 5307 9$: ld a,#TK_INTGR
      009BBD 81               [ 4] 5308 	ret 
                                   5309 
                                   5310 ;---------------------
                                   5311 ; BASIC: GPIO(expr,reg)
                                   5312 ; return gpio address 
                                   5313 ; expr {0..8}
                                   5314 ; input:
                                   5315 ;   none 
                                   5316 ; output:
                                   5317 ;   X 		gpio register address
                                   5318 ;----------------------------
                           000003  5319 	PORT=3
                           000001  5320 	REG=1 
                           000004  5321 	VSIZE=4 
      001DEC                       5322 gpio:
      009BBD 72 5F 00         [ 4] 5323 	call func_args 
      009BC0 17 72            [ 1] 5324 	cp a,#2
      009BC2 5F 00            [ 1] 5325 	jreq 1$
      009BC4 18 72 5F         [ 2] 5326 	jp syntax_error  
      001DF6                       5327 1$:	
      009BC7 00 19            [ 2] 5328 	ldw x,(PORT,sp)
      009BC9 5B 04            [ 1] 5329 	jrmi bad_port
      009BCB 98 81 09         [ 2] 5330 	cpw x,#9
      009BCD 2A 12            [ 1] 5331 	jrpl bad_port
      009BCD 5B 04            [ 1] 5332 	ld a,#5
      009BCF 99               [ 4] 5333 	mul x,a
      009BD0 81 50 00         [ 2] 5334 	addw x,#GPIO_BASE 
      009BD1 1F 03            [ 2] 5335 	ldw (PORT,sp),x  
      009BD1 72 01            [ 2] 5336 	ldw x,(REG,sp) 
      009BD3 00 24 05         [ 2] 5337 	addw x,(PORT,sp)
      009BD6 A6 07            [ 1] 5338 	ld a,#TK_INTGR
      001E0E                       5339 	_drop VSIZE 
      009BD8 CC 89            [ 2]    1     addw sp,#VSIZE 
      009BDA 68               [ 4] 5340 	ret
      009BDB                       5341 bad_port:
      009BDB CE 00            [ 1] 5342 	ld a,#ERR_BAD_VALUE
      009BDD 1F 72 B0         [ 2] 5343 	jp tb_error
                                   5344 
                                   5345 
                                   5346 ;-------------------------
                                   5347 ; BASIC: UFLASH 
                                   5348 ; return user flash address
                                   5349 ; input:
                                   5350 ;  none 
                                   5351 ; output:
                                   5352 ;	A		TK_INTGR
                                   5353 ;   X 		user address 
                                   5354 ;---------------------------
      001E16                       5355 uflash:
      009BE0 00 1D 26         [ 2] 5356 	ldw x,#user_space 
      009BE3 0C AE            [ 1] 5357 	ld a,#TK_INTGR 
      009BE5 88               [ 4] 5358 	ret 
                                   5359 
                                   5360 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5361 ;---------------------
                                   5362 ; BASIC: USR(addr[,arg])
                                   5363 ; execute a function written 
                                   5364 ; in binary code.
                                   5365 ; binary fonction should 
                                   5366 ; return token attribute in A 
                                   5367 ; and value in X. 
                                   5368 ; input:
                                   5369 ;   addr	routine address 
                                   5370 ;   arg 	is an optional argument 
                                   5371 ; output:
                                   5372 ;   A 		token attribute 
                                   5373 ;   X       returned value 
                                   5374 ;---------------------
      001E1C                       5375 usr:
      009BE6 FF CD            [ 2] 5376 	pushw y 	
      009BE8 AA C0 55         [ 4] 5377 	call func_args 
      009BEB 00 04            [ 1] 5378 	cp a,#1 
      009BED 00 02            [ 1] 5379 	jreq 2$
      009BEF 81 02            [ 1] 5380 	cp a,#2
      009BF0 27 03            [ 1] 5381 	jreq 2$  
      009BF0 52 08 1F         [ 2] 5382 	jp syntax_error 
      009BF3 01 CD            [ 2] 5383 2$: popw y  ; arg|addr 
      009BF5 8A 58            [ 1] 5384 	cp a,#1
      009BF7 A1 02            [ 1] 5385 	jreq 3$
      009BF9 27               [ 2] 5386 	popw x ; addr
      009BFA 03               [ 1] 5387 	exgw x,y 
      009BFB CC 89            [ 4] 5388 3$: call (y)
      009BFD 66 85            [ 2] 5389 	popw y 
      009BFE 81               [ 4] 5390 	ret 
                                   5391 
                                   5392 ;------------------------------
                                   5393 ; BASIC: BYE 
                                   5394 ; halt mcu in its lowest power mode 
                                   5395 ; wait for reset or external interrupt
                                   5396 ; do a cold start on wakeup.
                                   5397 ;------------------------------
      001E39                       5398 bye:
      009BFE 1F 03 CD 81 F1   [ 2] 5399 	btjf UART1_SR,#UART_SR_TC,.
      009C03 CD               [10] 5400 	halt
      009C04 84 7A AB         [ 2] 5401 	jp cold_start  
                                   5402 
                                   5403 ;----------------------------------
                                   5404 ; BASIC: AUTORUN ["file_name"] 
                                   5405 ; record in eeprom at adrress AUTORUN_NAME
                                   5406 ; the name of file to load and execute
                                   5407 ; at startup. 
                                   5408 ; empty string delete autorun name 
                                   5409 ; no argument display autorun name  
                                   5410 ; input:
                                   5411 ;   file_name   file to execute 
                                   5412 ; output:
                                   5413 ;   none
                                   5414 ;-----------------------------------
      001E42                       5415 autorun: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C07 03 5F 97 72 FB   [ 2] 5416 	btjf flags,#FRUN,0$ 
      009C0C 01 4F            [ 1] 5417 	jreq 0$ 
      009C0E 72 BB            [ 1] 5418 	ld a,#ERR_CMD_ONLY 
      009C10 00 1B C9         [ 2] 5419 	jp tb_error 
      001E4E                       5420 0$:	
      009C13 00 1A A1         [ 4] 5421 	call next_token
      009C16 02               [ 1] 5422 	tnz a 
      009C17 2B 0A            [ 1] 5423 	jrne 1$
      009C19 A3 80 00         [ 2] 5424 	ldw x,#AUTORUN_NAME
      009C1C 2B 05 A6         [ 4] 5425 	call puts 
      009C1F 0E               [ 1] 5426 	clr a 
      009C20 CC               [ 4] 5427 	ret 
      001E5C                       5428 1$:
      009C21 89 68            [ 1] 5429 	cp a,#TK_QSTR
      009C23 27 03            [ 1] 5430 	jreq 2$
      009C23 16 03 CD         [ 2] 5431 	jp syntax_error 
      001E63                       5432 2$:	
      009C26 9B               [ 1] 5433 	tnz (x) 
      009C27 84 24            [ 1] 5434 	jrne 3$
                                   5435 ; empty string, delete autorun 	
      009C29 05 A6 08         [ 4] 5436 	call cancel_autorun
      009C2C CC 89 68 00 01   [ 1] 5437 	mov in,count 
      009C2F 81               [ 4] 5438 	ret 
      009C2F CE               [ 2] 5439 3$:	pushw x 
      009C30 00 1A            [ 1] 5440 	ldw y,x  
      009C32 C6 00 1C         [ 4] 5441 	call search_file 
      009C35 CF 00            [ 1] 5442 	jrc 4$ 
      009C37 17 C7            [ 1] 5443 	ld a,#ERR_NOT_FILE
      009C39 00 19 16         [ 2] 5444 	jp tb_error  
      001E7C                       5445 4$: 
      009C3C 03 AE 16 E0 CD   [ 1] 5446 	mov in,count 
      009C41 84 96 CD 84      [ 1] 5447 	clr farptr 
      009C45 7A 5F 97         [ 2] 5448 	ldw x,#AUTORUN_NAME
      009C48 5C 1C 16         [ 2] 5449 	ldw farptr+1,x 
      009C4B E0 16            [ 2] 5450 	ldw x,(1,sp)  
      009C4D 01 FF 1C         [ 4] 5451 	call strlen  ; return length in A 
      009C50 00               [ 1] 5452 	clrw x 
      009C51 02               [ 1] 5453 	ld xl,a 
      009C52 90               [ 1] 5454 	incw x 
      009C53 CE 00            [ 2] 5455 	popw y 
      009C55 1D               [ 2] 5456 	pushw x 
      009C56 90               [ 1] 5457 	clrw x 
      009C57 F6 90 5C         [ 4] 5458 	call write_block 
      001E9A                       5459 	_drop 2 
      009C5A F7 5C            [ 2]    1     addw sp,#2 
      009C5C 90               [ 4] 5460 	ret 
                                   5461 
                                   5462 ;----------------------------------
                                   5463 ; BASIC: SLEEP 
                                   5464 ; halt mcu until reset or external
                                   5465 ; interrupt.
                                   5466 ; Resume progam after SLEEP command
                                   5467 ;----------------------------------
      001E9D                       5468 sleep:
      009C5D C3 00 1F 27 05   [ 2] 5469 	btjf UART1_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C62 A3 17 60 2B      [ 1] 5470 	bset flags,#FSLEEP
      009C66 EF               [10] 5471 	halt 
      009C67 81               [ 4] 5472 	ret 
                                   5473 
                                   5474 ;-------------------------------
                                   5475 ; BASIC: PAUSE expr 
                                   5476 ; suspend execution for n msec.
                                   5477 ; input:
                                   5478 ;	none
                                   5479 ; output:
                                   5480 ;	none 
                                   5481 ;------------------------------
      001EA8                       5482 pause:
      009C67 17 07 BD         [ 4] 5483 	call expression
      009C69 A1 84            [ 1] 5484 	cp a,#TK_INTGR
      009C69 A3 17            [ 1] 5485 	jreq pause02 
      009C6B 60 27 04         [ 2] 5486 	jp syntax_error
      001EB2                       5487 pause02: 
      009C6E 7F               [ 2] 5488 1$: tnzw x 
      009C6F 5C 20            [ 1] 5489 	jreq 2$
      009C71 F7               [10] 5490 	wfi 
      009C72 5A               [ 2] 5491 	decw x 
      009C72 AE 16            [ 1] 5492 	jrne 1$
      009C74 E0               [ 1] 5493 2$:	clr a 
      009C75 CD               [ 4] 5494 	ret 
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
      001EBB                       5507 awu:
      009C76 82 05 AE         [ 4] 5508   call expression
      009C79 00 80            [ 1] 5509   cp a,#TK_INTGR
      009C7B CD 9B            [ 1] 5510   jreq awu02
      009C7D 10 AE 16         [ 2] 5511   jp syntax_error
      001EC5                       5512 awu02:
      009C80 E0 16 07         [ 2] 5513   cpw x,#5120
      009C83 90 C3            [ 1] 5514   jrmi 1$ 
      009C85 00 1F 2B CD      [ 1] 5515   mov AWU_TBR,#15 
      009C89 CE 00            [ 1] 5516   ld a,#30
      009C8B 17               [ 2] 5517   div x,a
      009C8C C6 00            [ 1] 5518   ld a,#16
      009C8E 19               [ 2] 5519   div x,a 
      009C8F CF 00            [ 2] 5520   jra 4$
      001ED6                       5521 1$: 
      009C91 1A C7 00         [ 2] 5522   cpw x,#2048
      009C94 1C 1E            [ 1] 5523   jrmi 2$ 
      009C96 01 CD 8A B9      [ 1] 5524   mov AWU_TBR,#14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C9A 5B 08            [ 1] 5525   ld a,#80
      009C9C 81               [ 2] 5526   div x,a 
      009C9D 20 10            [ 2] 5527   jra 4$   
      001EE4                       5528 2$:
      009C9D CD 9B 10 CD      [ 1] 5529   mov AWU_TBR,#7
      001EE8                       5530 3$:  
                                   5531 ; while X > 64  divide by 2 and increment AWU_TBR 
      009CA1 87 D0 5F         [ 2] 5532   cpw x,#64 
      009CA4 92 AF            [ 2] 5533   jrule 4$ 
      009CA6 00 17 90 95      [ 1] 5534   inc AWU_TBR 
      009CAA 5C               [ 2] 5535   srlw x 
      009CAB 92 AF            [ 2] 5536   jra 3$ 
      001EF4                       5537 4$:
      009CAD 00               [ 1] 5538   ld a, xl
      009CAE 17               [ 1] 5539   dec a 
      009CAF 5C 90            [ 1] 5540   jreq 5$
      009CB1 97               [ 1] 5541   dec a 	
      001EF9                       5542 5$: 
      009CB2 72 B9            [ 1] 5543   and a,#0x3e 
      009CB4 00 1D 90         [ 1] 5544   ld AWU_APR,a 
      009CB7 CF 00 1F 90      [ 1] 5545   bset AWU_CSR,#AWU_CSR_AWUEN
      009CBB CE               [10] 5546   halt 
                                   5547 
      009CBC 00               [ 4] 5548   ret 
                                   5549 
                                   5550 ;------------------------------
                                   5551 ; BASIC: TICKS
                                   5552 ; return msec ticks counter value 
                                   5553 ; input:
                                   5554 ; 	none 
                                   5555 ; output:
                                   5556 ;	X 		TK_INTGR
                                   5557 ;-------------------------------
      001F04                       5558 get_ticks:
      009CBD 1D 00 0E         [ 2] 5559 	ldw x,ticks 
      009CBE A6 84            [ 1] 5560 	ld a,#TK_INTGR
      009CBE 92               [ 4] 5561 	ret 
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
      001F0A                       5573 abs:
      009CBF AF 00 17         [ 4] 5574 	call func_args 
      009CC2 90 F7            [ 1] 5575 	cp a,#1 
      009CC4 5C 90            [ 1] 5576 	jreq 0$ 
      009CC6 5C 90 C3         [ 2] 5577 	jp syntax_error
      001F14                       5578 0$:  
      009CC9 00               [ 2] 5579     popw x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009CCA 1F               [ 1] 5580 	ld a,xh 
      009CCB 2B F1            [ 1] 5581 	bcp a,#0x80 
      009CCD 81 01            [ 1] 5582 	jreq 2$ 
      009CCE 50               [ 2] 5583 	negw x 
      009CCE 72 01            [ 1] 5584 2$: ld a,#TK_INTGR 
      009CD0 00               [ 4] 5585 	ret 
                                   5586 
                                   5587 ;------------------------------
                                   5588 ; BASIC: AND(expr1,expr2)
                                   5589 ; Apply bit AND relation between
                                   5590 ; the 2 arguments, i.e expr1 & expr2 
                                   5591 ; output:
                                   5592 ; 	A 		TK_INTGR
                                   5593 ;   X 		result 
                                   5594 ;------------------------------
      001F1E                       5595 bit_and:
      009CD1 24 07 27         [ 4] 5596 	call func_args 
      009CD4 05 A6            [ 1] 5597 	cp a,#2
      009CD6 07 CC            [ 1] 5598 	jreq 1$
      009CD8 89 68 E6         [ 2] 5599 	jp syntax_error 
      009CDA 85               [ 2] 5600 1$:	popw x 
      009CDA CD               [ 1] 5601 	ld a,xh 
      009CDB 8A 58            [ 1] 5602 	and a,(1,sp)
      009CDD A1               [ 1] 5603 	ld xh,a 
      009CDE 02               [ 1] 5604 	ld a,xl
      009CDF 27 03            [ 1] 5605 	and a,(2,sp)
      009CE1 CC               [ 1] 5606 	ld xl,a 
      001F31                       5607 	_drop 2 
      009CE2 89 66            [ 2]    1     addw sp,#2 
      009CE4 90 93            [ 1] 5608 	ld a,#TK_INTGR
      009CE6 CD               [ 4] 5609 	ret
                                   5610 
                                   5611 ;------------------------------
                                   5612 ; BASIC: OR(expr1,expr2)
                                   5613 ; Apply bit OR relation between
                                   5614 ; the 2 arguments, i.e expr1 | expr2 
                                   5615 ; output:
                                   5616 ; 	A 		TK_INTGR
                                   5617 ;   X 		result 
                                   5618 ;------------------------------
      001F36                       5619 bit_or:
      009CE7 9B 84 25         [ 4] 5620 	call func_args 
      009CEA 05 A6            [ 1] 5621 	cp a,#2
      009CEC 09 CC            [ 1] 5622 	jreq 1$
      009CEE 89 68 E6         [ 2] 5623 	jp syntax_error 
      009CF0                       5624 1$: 
      009CF0 CD               [ 2] 5625 	popw x 
      009CF1 9C               [ 1] 5626 	ld a,xh 
      009CF2 9D CE            [ 1] 5627 	or a,(1,sp)
      009CF4 00               [ 1] 5628 	ld xh,a 
      009CF5 1F               [ 1] 5629 	ld a,xl 
      009CF6 72 B0            [ 1] 5630 	or a,(2,sp)
      009CF8 00               [ 1] 5631 	ld xl,a 
      001F49                       5632 	_drop 2 
      009CF9 1D CD            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009CFB 8A B9            [ 1] 5633 	ld a,#TK_INTGR 
      009CFD 81               [ 4] 5634 	ret
                                   5635 
                                   5636 ;------------------------------
                                   5637 ; BASIC: XOR(expr1,expr2)
                                   5638 ; Apply bit XOR relation between
                                   5639 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5640 ; output:
                                   5641 ; 	A 		TK_INTGR
                                   5642 ;   X 		result 
                                   5643 ;------------------------------
      009CFE                       5644 bit_xor:
      009CFE 52 03 CD         [ 4] 5645 	call func_args 
      009D01 8A 58            [ 1] 5646 	cp a,#2
      009D03 A1 00            [ 1] 5647 	jreq 1$
      009D05 27 20 A1         [ 2] 5648 	jp syntax_error 
      001F58                       5649 1$: 
      009D08 02               [ 2] 5650 	popw x 
      009D09 27               [ 1] 5651 	ld a,xh 
      009D0A 03 CC            [ 1] 5652 	xor a,(1,sp)
      009D0C 89               [ 1] 5653 	ld xh,a 
      009D0D 66               [ 1] 5654 	ld a,xl 
      009D0E 90 93            [ 1] 5655 	xor a,(2,sp)
      009D10 55               [ 1] 5656 	ld xl,a 
      001F61                       5657 	_drop 2 
      009D11 00 04            [ 2]    1     addw sp,#2 
      009D13 00 02            [ 1] 5658 	ld a,#TK_INTGR 
      009D15 CD               [ 4] 5659 	ret 
                                   5660 
                                   5661 ;------------------------------
                                   5662 ; BASIC: LSHIFT(expr1,expr2)
                                   5663 ; logical shift left expr1 by 
                                   5664 ; expr2 bits 
                                   5665 ; output:
                                   5666 ; 	A 		TK_INTGR
                                   5667 ;   X 		result 
                                   5668 ;------------------------------
      001F66                       5669 lshift:
      009D16 9B 84 25         [ 4] 5670 	call func_args
      009D19 05 A6            [ 1] 5671 	cp a,#2 
      009D1B 09 CC            [ 1] 5672 	jreq 1$
      009D1D 89 68 E6         [ 2] 5673 	jp syntax_error
      009D1F 90 85            [ 2] 5674 1$: popw y   
      009D1F CE               [ 2] 5675 	popw x 
      009D20 00 17            [ 2] 5676 	tnzw y 
      009D22 C6 00            [ 1] 5677 	jreq 4$
      009D24 19               [ 2] 5678 2$:	sllw x 
      009D25 20 0A            [ 2] 5679 	decw y 
      009D27 26 FB            [ 1] 5680 	jrne 2$
      001F7C                       5681 4$:  
      009D27 AE 01            [ 1] 5682 	ld a,#TK_INTGR
      009D29 00               [ 4] 5683 	ret
                                   5684 
                                   5685 ;------------------------------
                                   5686 ; BASIC: RSHIFT(expr1,expr2)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5687 ; logical shift right expr1 by 
                                   5688 ; expr2 bits.
                                   5689 ; output:
                                   5690 ; 	A 		TK_INTGR
                                   5691 ;   X 		result 
                                   5692 ;------------------------------
      001F7F                       5693 rshift:
      009D2A 4F CF 00         [ 4] 5694 	call func_args
      009D2D 17 C7            [ 1] 5695 	cp a,#2 
      009D2F 00 19            [ 1] 5696 	jreq 1$
      009D31 CC 08 E6         [ 2] 5697 	jp syntax_error
      009D31 1F 01            [ 2] 5698 1$: popw y  
      009D33 6B               [ 2] 5699 	popw x
      009D34 03 CD            [ 2] 5700 	tnzw y 
      009D36 81 BD            [ 1] 5701 	jreq 4$
      009D38 CD               [ 2] 5702 2$:	srlw x 
      009D39 82 38            [ 2] 5703 	decw y 
      009D3B AE 00            [ 1] 5704 	jrne 2$
      001F95                       5705 4$:  
      009D3D 80 CD            [ 1] 5706 	ld a,#TK_INTGR
      009D3F 9B               [ 4] 5707 	ret
                                   5708 
                                   5709 ;--------------------------
                                   5710 ; BASIC: FCPU integer
                                   5711 ; set CPU frequency 
                                   5712 ;-------------------------- 
                                   5713 
      001F98                       5714 fcpu:
      009D40 10 CD            [ 1] 5715 	ld a,#TK_INTGR
      009D42 9A F5 C6         [ 4] 5716 	call expect 
      009D45 00               [ 1] 5717 	ld a,xl 
      009D46 19 C0            [ 1] 5718 	and a,#7 
      009D48 00 1C C6         [ 1] 5719 	ld CLK_CKDIVR,a 
      009D4B 00               [ 4] 5720 	ret 
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
      001FA4                       5731 pin_mode:
      001FA4                       5732 	_vars VSIZE 
      009D4C 18 C2            [ 2]    1     sub sp,#VSIZE 
      009D4E 00 1B C6         [ 4] 5733 	call arg_list 
      009D51 00 17            [ 1] 5734 	cp a,#2 
      009D53 C2 00            [ 1] 5735 	jreq 1$
      009D55 1A 2B E0         [ 2] 5736 	jp syntax_error 
      009D58 7B 03            [ 2] 5737 1$: popw y ; mode 
      009D5A 1E               [ 2] 5738 	popw x ; Dx pin 
      009D5B 01 C7 00         [ 4] 5739 	call select_pin 
      009D5E 1C CF            [ 1] 5740 	ld (PINNO,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D60 00 1A            [ 1] 5741 	ld a,#1 
      009D62 5B 03            [ 1] 5742 	tnz (PINNO,sp)
      009D64 81 0D            [ 1] 5743 	jreq 4$
      009D65 48               [ 1] 5744 2$:	sll a 
      009D65 52 02            [ 1] 5745 	dec (PINNO,sp)
      009D67 5F 1F            [ 1] 5746 	jrne 2$ 
      009D69 01 CF            [ 1] 5747 	ld (PINNO,sp),a
      009D6B 00 18            [ 1] 5748 	ld a,(PINNO,sp)
      009D6D 35 01            [ 1] 5749 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D6F 00 17            [ 1] 5750 	ld (GPIO_CR1,x),a 
      009D71 90 A3 00 01      [ 2] 5751 4$:	cpw y,#OUTP 
      009D71 5F 92            [ 1] 5752 	jreq 6$
                                   5753 ; input mode
                                   5754 ; disable external interrupt 
      009D73 AF 00            [ 1] 5755 	ld a,(PINNO,sp)
      009D75 17               [ 1] 5756 	cpl a 
      009D76 27 3B            [ 1] 5757 	and a,(GPIO_CR2,x)
      009D78 E7 04            [ 1] 5758 	ld (GPIO_CR2,x),a 
                                   5759 ;clear bit in DDR for input mode 
      009D78 92 AF            [ 1] 5760 	ld a,(PINNO,sp)
      009D7A 00               [ 1] 5761 	cpl a 
      009D7B 17 27            [ 1] 5762 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009D7D 06 CD            [ 1] 5763 	ld (GPIO_DDR,x),a 
      009D7F 83 78            [ 2] 5764 	jra 9$
      001FE1                       5765 6$: ;output mode  
      009D81 5C 20            [ 1] 5766 	ld a,(PINNO,sp)
      009D83 F4 5C            [ 1] 5767 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D85 A6 20            [ 1] 5768 	ld (GPIO_DDR,x),a 
      009D87 CD 83            [ 1] 5769 	ld a,(PINNO,sp)
      009D89 78 92            [ 1] 5770 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D8B AF 00            [ 1] 5771 	ld (GPIO_CR2,x),a 
      001FED                       5772 9$:	
      001FED                       5773 	_drop VSIZE 
      009D8D 17 90            [ 2]    1     addw sp,#VSIZE 
      009D8F 95               [ 4] 5774 	ret
                                   5775 
                                   5776 ;------------------------
                                   5777 ; select Arduino pin 
                                   5778 ; input:
                                   5779 ;   X 	 {0..15} Arduino Dx 
                                   5780 ; output:
                                   5781 ;   A     stm8s208 pin 
                                   5782 ;   X     base address s208 GPIO port 
                                   5783 ;---------------------------
      001FF0                       5784 select_pin:
      009D90 5C               [ 2] 5785 	sllw x 
      009D91 92 AF 00         [ 2] 5786 	addw x,#arduino_to_8s208 
      009D94 17               [ 2] 5787 	ldw x,(x)
      009D95 5C               [ 1] 5788 	ld a,xl 
      009D96 90               [ 1] 5789 	push a 
      009D97 97               [ 1] 5790 	swapw x 
      009D98 90 89            [ 1] 5791 	ld a,#5 
      009D9A 72               [ 4] 5792 	mul x,a 
      009D9B FB 01 CD         [ 2] 5793 	addw x,#GPIO_BASE 
      009D9E 9B               [ 1] 5794 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D9F 10               [ 4] 5795 	ret 
                                   5796 ; translation from Arduino D0..D15 to stm8s208rb 
      002000                       5797 arduino_to_8s208:
      009DA0 CD 9A                 5798 .byte 3,6 ; D0 
      009DA2 F5 85                 5799 .byte 3,5 ; D1 
      009DA4 CD 8A                 5800 .byte 4,0 ; D2 
      009DA6 B9 A6                 5801 .byte 2,1 ; D3
      009DA8 0D CD                 5802 .byte 6,0 ; D4
      009DAA 83 78                 5803 .byte 2,2 ; D5
      009DAC 1E 01                 5804 .byte 2,3 ; D6
      009DAE 5C 1F                 5805 .byte 3,1 ; D7
      009DB0 01 20                 5806 .byte 3,3 ; D8
      009DB2 BE 04                 5807 .byte 2,4 ; D9
      009DB3 04 05                 5808 .byte 4,5 ; D10
      009DB3 1E 01                 5809 .byte 2,6 ; D11
      009DB5 CD 8A                 5810 .byte 2,7 ; D12
      009DB7 B9 AE                 5811 .byte 2,5 ; D13
      009DB9 9D D2                 5812 .byte 4,2 ; D14
      009DBB CD AA                 5813 .byte 4,1 ; D15
                                   5814 
                                   5815 
                                   5816 ;------------------------------
                                   5817 ; BASIC: RND(expr)
                                   5818 ; return random number 
                                   5819 ; between 1 and expr inclusive
                                   5820 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5821 ; input:
                                   5822 ; 	none 
                                   5823 ; output:
                                   5824 ;	X 		random positive integer 
                                   5825 ;------------------------------
      002020                       5826 random:
      009DBD C0 CD 9B         [ 4] 5827 	call func_args 
      009DC0 50 5F            [ 1] 5828 	cp a,#1
      009DC2 35 0A            [ 1] 5829 	jreq 1$
      009DC4 00 0B CD         [ 2] 5830 	jp syntax_error
      00202A                       5831 1$:  
      009DC7 8A C9            [ 1] 5832 	ld a,#0x80 
      009DC9 AE 9D            [ 1] 5833 	bcp a,(1,sp)
      009DCB DA CD            [ 1] 5834 	jreq 2$
      009DCD AA C0            [ 1] 5835 	ld a,#ERR_BAD_VALUE
      009DCF 5B 02 81         [ 2] 5836 	jp tb_error
      002035                       5837 2$: 
                                   5838 ; acc16=(x<<5)^x 
      009DD2 20 66 69         [ 2] 5839 	ldw x,seedx 
      009DD5 6C               [ 2] 5840 	sllw x 
      009DD6 65               [ 2] 5841 	sllw x 
      009DD7 73               [ 2] 5842 	sllw x 
      009DD8 0A               [ 2] 5843 	sllw x 
      009DD9 00               [ 2] 5844 	sllw x 
      009DDA 20               [ 1] 5845 	ld a,xh 
      009DDB 62 79 74         [ 1] 5846 	xor a,seedx 
      009DDE 65 73 20         [ 1] 5847 	ld acc16,a 
      009DE1 66               [ 1] 5848 	ld a,xl 
      009DE2 72 65 65         [ 1] 5849 	xor a,seedx+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009DE5 0A 00 0D         [ 1] 5850 	ld acc8,a 
                                   5851 ; seedx=seedy 
      009DE7 CE 00 14         [ 2] 5852 	ldw x,seedy 
      009DE7 52 02 72         [ 2] 5853 	ldw seedx,x  
                                   5854 ; seedy=seedy^(seedy>>1)
      009DEA 5F 00            [ 2] 5855 	srlw y 
      009DEC 17 CD            [ 1] 5856 	ld a,yh 
      009DEE 92 3D A1         [ 1] 5857 	xor a,seedy 
      009DF1 84 27 03         [ 1] 5858 	ld seedy,a  
      009DF4 CC 89            [ 1] 5859 	ld a,yl 
      009DF6 66 1F 01         [ 1] 5860 	xor a,seedy+1 
      009DF9 CD 8A 58         [ 1] 5861 	ld seedy+1,a 
                                   5862 ; acc16>>3 
      009DFC A1 09 27         [ 2] 5863 	ldw x,acc16 
      009DFF 02               [ 2] 5864 	srlw x 
      009E00 20               [ 2] 5865 	srlw x 
      009E01 19               [ 2] 5866 	srlw x 
                                   5867 ; x=acc16^x 
      009E02 CD               [ 1] 5868 	ld a,xh 
      009E03 92 3D A1         [ 1] 5869 	xor a,acc16 
      009E06 84               [ 1] 5870 	ld xh,a 
      009E07 27               [ 1] 5871 	ld a,xl 
      009E08 03 CC 89         [ 1] 5872 	xor a,acc8 
      009E0B 66               [ 1] 5873 	ld xl,a 
                                   5874 ; seedy=x^seedy 
      009E0C 9F 1E 01         [ 1] 5875 	xor a,seedy+1
      009E0F CF               [ 1] 5876 	ld xl,a 
      009E10 00               [ 1] 5877 	ld a,xh 
      009E11 18 5F CD         [ 1] 5878 	xor a,seedy
      009E14 82               [ 1] 5879 	ld xh,a 
      009E15 62 1E 01         [ 2] 5880 	ldw seedy,x 
                                   5881 ; return seedy modulo expr + 1 
      009E18 5C 20            [ 2] 5882 	popw y 
      009E1A DC               [ 2] 5883 	divw x,y 
      009E1B 93               [ 1] 5884 	ldw x,y 
      009E1B 5B               [ 1] 5885 	incw x 
      002084                       5886 10$:
      009E1C 02 81            [ 1] 5887 	ld a,#TK_INTGR
      009E1E 81               [ 4] 5888 	ret 
                                   5889 
                                   5890 ;---------------------------------
                                   5891 ; BASIC: WORDS 
                                   5892 ; affiche la listes des mots du
                                   5893 ; dictionnaire ainsi que le nombre
                                   5894 ; de mots.
                                   5895 ;---------------------------------
                           000001  5896 	WLEN=1 ; word length
                           000002  5897 	LLEN=2 ; character sent to console
                           000003  5898 	WCNT=3 ; count words printed 
                           000003  5899 	VSIZE=3 
      002087                       5900 words:
      002087                       5901 	_vars VSIZE
      009E1E CD 91            [ 2]    1     sub sp,#VSIZE 
      009E20 39 A1            [ 1] 5902 	clr (LLEN,sp)
      009E22 01 27            [ 1] 5903 	clr (WCNT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009E24 03 CC 89 66      [ 2] 5904 	ldw y,#kword_dict+2
      009E28 85               [ 1] 5905 0$:	ldw x,y
      009E29 9F               [ 1] 5906 	ld a,(x)
      009E2A A4 7F            [ 1] 5907 	and a,#15 
      009E2C 97 A6            [ 1] 5908 	ld (WLEN,sp),a 
      009E2E 03 81            [ 1] 5909 	inc (WCNT,sp)
      009E30 5C               [ 1] 5910 1$:	incw x 
      009E30 A6               [ 1] 5911 	ld a,(x)
      009E31 07 CD 91         [ 4] 5912 	call putc 
      009E34 2C CD            [ 1] 5913 	inc (LLEN,sp)
      009E36 8A 58            [ 1] 5914 	dec (WLEN,sp)
      009E38 A1 02            [ 1] 5915 	jrne 1$
      009E3A 27 0E            [ 1] 5916 	ld a,#70
      009E3C A1 03            [ 1] 5917 	cp a,(LLEN,sp)
      009E3E 27 0D            [ 1] 5918 	jrmi 2$   
      009E40 A1 82            [ 1] 5919 	ld a,#SPACE 
      009E42 27 03 CC         [ 4] 5920 	call putc 
      009E45 89 66            [ 1] 5921 	inc (LLEN,sp) 
      009E47 FD 20            [ 2] 5922 	jra 3$
      009E49 03 0D            [ 1] 5923 2$: ld a,#CR 
      009E4A CD 02 F8         [ 4] 5924 	call putc 
      009E4A F6 5F            [ 1] 5925 	clr (LLEN,sp)
      009E4C 97 A2 00 02      [ 2] 5926 3$:	subw y,#2 
      009E4D 90 FE            [ 2] 5927 	ldw y,(y)
      009E4D 89 A6            [ 1] 5928 	jrne 0$ 
      009E4F 08 CD            [ 1] 5929 	ld a,#CR 
      009E51 91 2C 85         [ 4] 5930 	call putc  
      009E54 A6               [ 1] 5931 	clrw x 
      009E55 84 81            [ 1] 5932 	ld a,(WCNT,sp)
      009E57 97               [ 1] 5933 	ld xl,a 
      009E57 CD 83 9B         [ 4] 5934 	call print_int 
      009E5A 5F 97 A6         [ 2] 5935 	ldw x,#words_count_msg
      009E5D 84 81 00         [ 4] 5936 	call puts 
      009E5F                       5937 	_drop VSIZE 
      009E5F 5F C6            [ 2]    1     addw sp,#VSIZE 
      009E61 00               [ 4] 5938 	ret 
      009E62 2E C1 00 2F 27 01 53  5939 words_count_msg: .asciz " words in dictionary\n"
             A6 84 81 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   5940 
                                   5941 
                                   5942 ;-----------------------------
                                   5943 ; BASIC: TIMER expr 
                                   5944 ; initialize count down timer 
                                   5945 ;-----------------------------
      009E6C                       5946 set_timer:
      009E6C CD 91 39         [ 4] 5947 	call arg_list
      009E6F A1 02            [ 1] 5948 	cp a,#1 
      009E71 27 03            [ 1] 5949 	jreq 1$
      009E73 CC 89 66         [ 2] 5950 	jp syntax_error
      009E76                       5951 1$: 
      009E76 1E               [ 2] 5952 	popw x 
      009E77 03 2B 17         [ 2] 5953 	ldw timer,x 
      009E7A A3               [ 4] 5954 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5955 
                                   5956 ;------------------------------
                                   5957 ; BASIC: TIMEOUT 
                                   5958 ; return state of timer 
                                   5959 ;------------------------------
      0020FC                       5960 timeout:
      009E7B 00 09 2A         [ 2] 5961 	ldw x,timer 
      0020FF                       5962 logical_complement:
      009E7E 12               [ 2] 5963 	cplw x 
      009E7F A6 05 42         [ 2] 5964 	cpw x,#-1
      009E82 1C 50            [ 1] 5965 	jreq 2$
      009E84 00               [ 1] 5966 	clrw x 
      009E85 1F 03            [ 1] 5967 2$:	ld a,#TK_INTGR
      009E87 1E               [ 4] 5968 	ret 
                                   5969 
                                   5970 ;--------------------------------
                                   5971 ; BASIC NOT(expr) 
                                   5972 ; return logical complement of expr
                                   5973 ;--------------------------------
      002109                       5974 func_not:
      009E88 01 72 FB         [ 4] 5975 	call func_args  
      009E8B 03 A6            [ 1] 5976 	cp a,#1
      009E8D 84 5B            [ 1] 5977 	jreq 1$
      009E8F 04 81 E6         [ 2] 5978 	jp syntax_error
      009E91 85               [ 2] 5979 1$:	popw x 
      009E91 A6 0A            [ 2] 5980 	jra logical_complement
                                   5981 
                                   5982 
                                   5983 
                                   5984 ;-----------------------------------
                                   5985 ; BASIC: IWDGEN expr1 
                                   5986 ; enable independant watchdog timer
                                   5987 ; expr1 is delay in multiple of 62.5µsec
                                   5988 ; expr1 -> {1..16383}
                                   5989 ;-----------------------------------
      002116                       5990 enable_iwdg:
      009E93 CC 89 68         [ 4] 5991 	call arg_list
      009E96 A1 01            [ 1] 5992 	cp a,#1 
      009E96 AE AA            [ 1] 5993 	jreq 1$
      009E98 80 A6 84         [ 2] 5994 	jp syntax_error 
      009E9B 81               [ 2] 5995 1$: popw x 
      009E9C 4B 00            [ 1] 5996 	push #0
      009E9C 90 89 CD 91      [ 1] 5997 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009EA0 39               [ 1] 5998 	ld a,xh 
      009EA1 A1 01            [ 1] 5999 	and a,#0x3f
      009EA3 27               [ 1] 6000 	ld xh,a  
      009EA4 07 A1 02         [ 2] 6001 2$:	cpw x,#255
      009EA7 27 03            [ 2] 6002 	jrule 3$
      009EA9 CC 89            [ 1] 6003 	inc (1,sp)
      009EAB 66               [ 1] 6004 	rcf 
      009EAC 90               [ 2] 6005 	rrcw x 
      009EAD 85 A1            [ 2] 6006 	jra 2$
      009EAF 01 27 02 85      [ 1] 6007 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EB3 51               [ 1] 6008 	pop a  
      009EB4 90 FD 90         [ 1] 6009 	ld IWDG_PR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009EB7 85               [ 1] 6010 	ld a,xl
      009EB8 81               [ 1] 6011 	dec a 
      009EB9 35 55 50 E0      [ 1] 6012 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EB9 72 0D 52         [ 1] 6013 	ld IWDG_RLR,a 
      009EBC 30 FB 8E CC      [ 1] 6014 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009EC0 86               [ 4] 6015 	ret 
                                   6016 
                                   6017 
                                   6018 ;-----------------------------------
                                   6019 ; BASIC: IWDGREF  
                                   6020 ; refresh independant watchdog count down 
                                   6021 ; timer before it reset MCU. 
                                   6022 ;-----------------------------------
      00214C                       6023 refresh_iwdg:
      009EC1 BE AA 50 E0      [ 1] 6024 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009EC2 81               [ 4] 6025 	ret 
                                   6026 
                                   6027 
                                   6028 ;-------------------------------------
                                   6029 ; BASIC: LOG(expr)
                                   6030 ; return logarithm base 2 of expr 
                                   6031 ; this is the position of most significant
                                   6032 ; bit set. 
                                   6033 ; input: 
                                   6034 ; output:
                                   6035 ;   X     log2 
                                   6036 ;   A     TK_INTGR 
                                   6037 ;*********************************
      002151                       6038 log2:
      009EC2 72 01 00         [ 4] 6039 	call func_args 
      009EC5 24 07            [ 1] 6040 	cp a,#1 
      009EC7 27 05            [ 1] 6041 	jreq 1$
      009EC9 A6 07 CC         [ 2] 6042 	jp syntax_error 
      009ECC 89               [ 2] 6043 1$: popw x 
      00215C                       6044 leading_one:
      009ECD 68               [ 2] 6045 	tnzw x 
      009ECE 27 0A            [ 1] 6046 	jreq 4$
      009ECE CD 8A            [ 1] 6047 	ld a,#15 
      009ED0 58               [ 2] 6048 2$: rlcw x 
      009ED1 4D 26            [ 1] 6049     jrc 3$
      009ED3 08               [ 1] 6050 	dec a 
      009ED4 AE 40            [ 2] 6051 	jra 2$
      009ED6 00               [ 1] 6052 3$: clrw x 
      009ED7 CD               [ 1] 6053     ld xl,a
      009ED8 AA C0            [ 1] 6054 4$:	ld a,#TK_INTGR
      009EDA 4F               [ 4] 6055 	ret 
                                   6056 
                                   6057 ;-----------------------------------
                                   6058 ; BASIC: BIT(expr) 
                                   6059 ; expr ->{0..15}
                                   6060 ; return 2^expr 
                                   6061 ; output:
                                   6062 ;    x    2^expr 
                                   6063 ;-----------------------------------
      00216C                       6064 bitmask:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EDB 81 10 B9         [ 4] 6065     call func_args 
      009EDC A1 01            [ 1] 6066 	cp a,#1
      009EDC A1 02            [ 1] 6067 	jreq 1$
      009EDE 27 03 CC         [ 2] 6068 	jp syntax_error 
      009EE1 89               [ 2] 6069 1$: popw x 
      009EE2 66               [ 1] 6070 	ld a,xl 
      009EE3 A4 0F            [ 1] 6071 	and a,#15
      009EE3 7D               [ 1] 6072 	clrw x 
      009EE4 26               [ 1] 6073 	incw x 
      009EE5 09               [ 1] 6074 2$: tnz a 
      009EE6 CD 87            [ 1] 6075 	jreq 3$
      009EE8 83               [ 2] 6076 	slaw x 
      009EE9 55               [ 1] 6077 	dec a 
      009EEA 00 04            [ 2] 6078 	jra 2$ 
      009EEC 00 02            [ 1] 6079 3$: ld a,#TK_INTGR
      009EEE 81               [ 4] 6080 	ret 
                                   6081 
                                   6082 ;------------------------------
                                   6083 ; BASIC: INVERT(expr)
                                   6084 ; 1's complement 
                                   6085 ;--------------------------------
      002186                       6086 invert:
      009EEF 89 90 93         [ 4] 6087 	call func_args
      009EF2 CD 9B            [ 1] 6088 	cp a,#1 
      009EF4 84 25            [ 1] 6089 	jreq 1$
      009EF6 05 A6 09         [ 2] 6090 	jp syntax_error
      009EF9 CC               [ 2] 6091 1$: popw x  
      009EFA 89               [ 2] 6092 	cplw x 
      009EFB 68 84            [ 1] 6093 	ld a,#TK_INTGR 
      009EFC 81               [ 4] 6094 	ret 
                                   6095 
                                   6096 ;------------------------------
                                   6097 ; BASIC: DO 
                                   6098 ; initiate a DO ... UNTIL loop 
                                   6099 ;------------------------------
                           000003  6100 	DOLP_ADR=3 
                           000005  6101 	DOLP_INW=5
                           000004  6102 	VSIZE=4 
      002195                       6103 do_loop:
      009EFC 55               [ 2] 6104 	popw x 
      002196                       6105 	_vars VSIZE 
      009EFD 00 04            [ 2]    1     sub sp,#VSIZE 
      009EFF 00               [ 2] 6106 	pushw x 
      009F00 02 72 5F 00      [ 2] 6107 	ldw y,basicptr 
      009F04 17 AE            [ 2] 6108 	ldw (DOLP_ADR,sp),y
      009F06 40 00 CF 00      [ 2] 6109 	ldw y,in.w 
      009F0A 18 1E            [ 2] 6110 	ldw (DOLP_INW,sp),y
      009F0C 01 CD 84 7A      [ 1] 6111 	inc loop_depth 
      009F10 5F               [ 4] 6112 	ret 
                                   6113 
                                   6114 ;--------------------------------
                                   6115 ; BASIC: UNTIL expr 
                                   6116 ; loop if exprssion is false 
                                   6117 ; else terminate loop
                                   6118 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      0021AA                       6119 until: 
      009F11 97 5C 90 85      [ 1] 6120 	tnz loop_depth 
      009F15 89 5F            [ 1] 6121 	jrne 1$ 
      009F17 CD 82 D7         [ 2] 6122 	jp syntax_error 
      0021B3                       6123 1$: 
      009F1A 5B 02 81         [ 4] 6124 	call relation 
      009F1D A1 84            [ 1] 6125 	cp a,#TK_INTGR
      009F1D 72 0D            [ 1] 6126 	jreq 2$
      009F1F 52 30 FB         [ 2] 6127 	jp syntax_error
      0021BD                       6128 2$: 
      009F22 72               [ 2] 6129 	tnzw x 
      009F23 16 00            [ 1] 6130 	jrne 9$
      009F25 24 8E            [ 2] 6131 	ldw x,(DOLP_ADR,sp)
      009F27 81 00 04         [ 2] 6132 	ldw basicptr,x 
      009F28 E6 02            [ 1] 6133 	ld a,(2,x)
      009F28 CD 92 3D         [ 1] 6134 	ld count,a 
      009F2B A1 84            [ 2] 6135 	ldw x,(DOLP_INW,sp)
      009F2D 27 03 CC         [ 2] 6136 	ldw in.w,x 
      009F30 89               [ 4] 6137 	ret 
      0021D0                       6138 9$:	; remove loop data from stack  
      009F31 66               [ 2] 6139 	popw x
      009F32                       6140 	_drop VSIZE
      009F32 5D 27            [ 2]    1     addw sp,#VSIZE 
      009F34 04 8F 5A 26      [ 1] 6141 	dec loop_depth 
      009F38 F9               [ 2] 6142 	jp (x)
                                   6143 
                                   6144 ;--------------------------
                                   6145 ; BASIC: PRTA...PRTI  
                                   6146 ;  return constant value 
                                   6147 ;  PORT  offset in GPIO
                                   6148 ;  array
                                   6149 ;---------------------------
      0021D8                       6150 const_porta:
      009F39 4F 81 00         [ 2] 6151 	ldw x,#0
      009F3B A6 84            [ 1] 6152 	ld a,#TK_INTGR 
      009F3B CD               [ 4] 6153 	ret 
      0021DE                       6154 const_portb:
      009F3C 92 3D A1         [ 2] 6155 	ldw x,#1
      009F3F 84 27            [ 1] 6156 	ld a,#TK_INTGR 
      009F41 03               [ 4] 6157 	ret 
      0021E4                       6158 const_portc:
      009F42 CC 89 66         [ 2] 6159 	ldw x,#2
      009F45 A6 84            [ 1] 6160 	ld a,#TK_INTGR 
      009F45 A3               [ 4] 6161 	ret 
      0021EA                       6162 const_portd:
      009F46 14 00 2B         [ 2] 6163 	ldw x,#3
      009F49 0C 35            [ 1] 6164 	ld a,#TK_INTGR 
      009F4B 0F               [ 4] 6165 	ret 
      0021F0                       6166 const_porte:
      009F4C 50 F2 A6         [ 2] 6167 	ldw x,#4
      009F4F 1E 62            [ 1] 6168 	ld a,#TK_INTGR 
      009F51 A6               [ 4] 6169 	ret 
      0021F6                       6170 const_portf:
      009F52 10 62 20         [ 2] 6171 	ldw x,#5
      009F55 1E 84            [ 1] 6172 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F56 81               [ 4] 6173 	ret 
      0021FC                       6174 const_portg:
      009F56 A3 08 00         [ 2] 6175 	ldw x,#6
      009F59 2B 09            [ 1] 6176 	ld a,#TK_INTGR 
      009F5B 35               [ 4] 6177 	ret 
      002202                       6178 const_porth:
      009F5C 0E 50 F2         [ 2] 6179 	ldw x,#7
      009F5F A6 50            [ 1] 6180 	ld a,#TK_INTGR 
      009F61 62               [ 4] 6181 	ret 
      002208                       6182 const_porti:
      009F62 20 10 08         [ 2] 6183 	ldw x,#8
      009F64 A6 84            [ 1] 6184 	ld a,#TK_INTGR 
      009F64 35               [ 4] 6185 	ret 
                                   6186 
                                   6187 ;-------------------------------
                                   6188 ; following return constant 
                                   6189 ; related to GPIO register offset 
                                   6190 ;---------------------------------
      00220E                       6191 const_odr:
      009F65 07 50            [ 1] 6192 	ld a,#TK_INTGR 
      009F67 F2 00 00         [ 2] 6193 	ldw x,#GPIO_ODR
      009F68 81               [ 4] 6194 	ret 
      002214                       6195 const_idr:
      009F68 A3 00            [ 1] 6196 	ld a,#TK_INTGR 
      009F6A 40 23 07         [ 2] 6197 	ldw x,#GPIO_IDR
      009F6D 72               [ 4] 6198 	ret 
      00221A                       6199 const_ddr:
      009F6E 5C 50            [ 1] 6200 	ld a,#TK_INTGR 
      009F70 F2 54 20         [ 2] 6201 	ldw x,#GPIO_DDR
      009F73 F4               [ 4] 6202 	ret 
      009F74                       6203 const_cr1:
      009F74 9F 4A            [ 1] 6204 	ld a,#TK_INTGR 
      009F76 27 01 4A         [ 2] 6205 	ldw x,#GPIO_CR1
      009F79 81               [ 4] 6206 	ret 
      002226                       6207 const_cr2:
      009F79 A4 3E            [ 1] 6208 	ld a,#TK_INTGR 
      009F7B C7 50 F1         [ 2] 6209 	ldw x,#GPIO_CR2
      009F7E 72               [ 4] 6210 	ret 
                                   6211 ;-------------------------
                                   6212 ;  constant for port mode
                                   6213 ;  used by PMODE 
                                   6214 ;  input or output
                                   6215 ;------------------------
      00222C                       6216 const_output:
      009F7F 18 50            [ 1] 6217 	ld a,#TK_INTGR 
      009F81 F0 8E 81         [ 2] 6218 	ldw x,#OUTP
      009F84 81               [ 4] 6219 	ret 
      002232                       6220 const_input:
      009F84 CE 00            [ 1] 6221 	ld a,#TK_INTGR 
      009F86 0F A6 84         [ 2] 6222 	ldw x,#INP 
      009F89 81               [ 4] 6223 	ret 
                                   6224 ;-----------------------
                                   6225 ; memory area constants
                                   6226 ;-----------------------
      009F8A                       6227 const_eeprom_base:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      009F8A CD 91            [ 1] 6228 	ld a,#TK_INTGR 
      009F8C 39 A1 01         [ 2] 6229 	ldw x,#EEPROM_BASE 
      009F8F 27               [ 4] 6230 	ret 
                                   6231 
                                   6232 ;---------------------------
                                   6233 ; BASIC: DATA 
                                   6234 ; when the interpreter find 
                                   6235 ; a DATA line it skip it.
                                   6236 ;---------------------------
      00223E                       6237 data:
      009F90 03 CC 89 66 01   [ 1] 6238 	mov in,count 
      009F94 81               [ 4] 6239 	ret 
                                   6240 
                                   6241 ;---------------------------
                                   6242 ; BASIC: DATLN  *expr*
                                   6243 ; set DATA pointer at line# 
                                   6244 ; specified by *expr* 
                                   6245 ;---------------------------
      002244                       6246 data_line:
      009F94 85 9E A5         [ 4] 6247 	call expression
      009F97 80 27            [ 1] 6248 	cp a,#TK_INTGR
      009F99 01 50            [ 1] 6249 	jreq 1$
      009F9B A6 84 81         [ 2] 6250 	jp syntax_error 
      009F9E CD 04 66         [ 4] 6251 1$: call search_lineno
      009F9E CD               [ 2] 6252 	tnzw x 
      009F9F 91 39            [ 1] 6253 	jrne 3$
      009FA1 A1 02            [ 1] 6254 2$:	ld a,#ERR_NO_LINE 
      009FA3 27 03 CC         [ 2] 6255 	jp tb_error
      002259                       6256 3$: ; check if valid data line 
      009FA6 89 66            [ 1] 6257     ldw y,x 
      009FA8 85 9E            [ 2] 6258 	ldw x,(4,x)
      009FAA 14 01 95         [ 2] 6259 	cpw x,#data 
      009FAD 9F 14            [ 1] 6260 	jrne 2$ 
      009FAF 02 97 5B 02      [ 2] 6261 	ldw data_ptr,y
      009FB3 A6 84 81         [ 1] 6262 	ld a,(2,y)
      009FB6 C7 00 09         [ 1] 6263 	ld data_len,a 
      009FB6 CD 91 39 A1      [ 1] 6264 	mov data_ofs,#FIRST_DATA_ITEM 
      009FBA 02               [ 4] 6265 	ret
                                   6266 
                                   6267 ;---------------------------------
                                   6268 ; BASIC: RESTORE 
                                   6269 ; set data_ptr to first data line
                                   6270 ; if not DATA found pointer set to
                                   6271 ; zero 
                                   6272 ;---------------------------------
      002271                       6273 restore:
      009FBB 27 03 CC 89      [ 1] 6274 	clr data_ptr 
      009FBF 66 5F 00 07      [ 1] 6275 	clr data_ptr+1
      009FC0 72 5F 00 08      [ 1] 6276 	clr data_ofs 
      009FC0 85 9E 1A 01      [ 1] 6277 	clr data_len
      009FC4 95 9F 1A         [ 2] 6278 	ldw x,txtbgn
      002284                       6279 data_search_loop: 	
      009FC7 02 97 5B         [ 2] 6280 	cpw x,txtend
      009FCA 02 A6            [ 1] 6281 	jruge 9$
      009FCC 84 81            [ 1] 6282 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009FCE EE 04            [ 2] 6283 	ldw x,(4,x)
      009FCE CD 91 39         [ 2] 6284 	addw x,#code_addr
      009FD1 A1               [ 2] 6285 	ldw x,(x)
      009FD2 02 27 03         [ 2] 6286 	cpw x,#data 
      009FD5 CC 89            [ 1] 6287 	jrne try_next_line 
      009FD7 66 CF 00 06      [ 2] 6288 	ldw data_ptr,y 
      009FD8 90 E6 02         [ 1] 6289 	ld a,(2,y)
      009FD8 85 9E 18         [ 1] 6290 	ld data_len,a 
      009FDB 01 95 9F 18      [ 1] 6291 	mov data_ofs,#FIRST_DATA_ITEM
      009FDF 02 97 5B 02      [ 1] 6292 9$:	tnz data_len 
      009FE3 A6 84            [ 1] 6293     jrne 10$
      009FE5 81 0C            [ 1] 6294 	ld a,#ERR_NO_DATA 
      009FE6 CC 08 E8         [ 2] 6295 	jp tb_error 
      009FE6 CD               [ 4] 6296 10$:ret
      0022B0                       6297 try_next_line:
      009FE7 91               [ 1] 6298 	ldw x,y 
      009FE8 39 A1            [ 1] 6299 	ld a,(2,x)
      009FEA 02 27 03         [ 1] 6300 	ld acc8,a 
      009FED CC 89 66 90      [ 1] 6301 	clr acc16 
      009FF1 85 85 90 5D      [ 2] 6302 	addw x,acc16 
      009FF5 27 05            [ 2] 6303 	jra data_search_loop
                                   6304 
                                   6305 
                                   6306 ;---------------------------------
                                   6307 ; BASIC: READ 
                                   6308 ; return next data item | 0 
                                   6309 ;---------------------------------
                           000001  6310 	CTX_BPTR=1 
                           000003  6311 	CTX_IN=3 
                           000004  6312 	CTX_COUNT=4 
                           000005  6313 	XSAVE=5
                           000006  6314 	VSIZE=6
      0022C0                       6315 read:
      0022C0                       6316 	_vars  VSIZE 
      009FF7 58 90            [ 2]    1     sub sp,#VSIZE 
      0022C2                       6317 read01:	
      009FF9 5A 26 FB         [ 1] 6318 	ld a,data_ofs
      009FFC C1 00 09         [ 1] 6319 	cp a,data_len 
      009FFC A6 84            [ 1] 6320 	jreq 2$ ; end of line  
      009FFE 81 16 10         [ 4] 6321 	call save_context
      009FFF CE 00 06         [ 2] 6322 	ldw x,data_ptr 
      009FFF CD 91 39         [ 2] 6323 	ldw basicptr,x 
      00A002 A1 02 27 03 CC   [ 1] 6324 	mov in,data_ofs 
      00A007 89 66 90 85 85   [ 1] 6325 	mov count,data_len  
      00A00C 90 5D 27         [ 4] 6326 	call expression 
      00A00F 05 54            [ 1] 6327 	cp a,#TK_INTGR 
      00A011 90 5A            [ 1] 6328 	jreq 1$ 
      00A013 26 FB E6         [ 2] 6329 	jp syntax_error 
      00A015                       6330 1$:
      00A015 A6 84            [ 2] 6331 	ldw (XSAVE,SP),x
      00A017 81 09 D8         [ 4] 6332 	call next_token ; skip comma
      00A018 CE 00 04         [ 2] 6333 	ldw x,basicptr 
      00A018 A6 84 CD         [ 2] 6334 	ldw data_ptr,x 
      00A01B 91 2C 9F A4 07   [ 1] 6335 	mov data_ofs,in 
      00A020 C7 50 C6         [ 4] 6336 	call rest_context
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A023 81 05            [ 2] 6337 	ldw x,(XSAVE,sp)
      00A024 A6 84            [ 1] 6338 	ld a,#TK_INTGR
      0022FE                       6339 	_drop VSIZE 
      00A024 52 01            [ 2]    1     addw sp,#VSIZE 
      00A026 CD               [ 4] 6340 	ret 
      002301                       6341 2$: ; end of line reached 
      00A027 91 3E A1 02      [ 2] 6342 	ldw y, data_ptr 
      00A02B 27 03 CC 89      [ 1] 6343 	clr data_ptr
      00A02F 66 90 85 85      [ 1] 6344 	clr data_ptr+1   
      00A033 CD A0 70 6B      [ 1] 6345 	clr data_ofs 
      00A037 01 A6 01 0D      [ 1] 6346 	clr data_len 
      00A03B 01 27 0D         [ 4] 6347 	call try_next_line 
      00A03E 48 0A            [ 2] 6348 	jra read01
                                   6349 
                                   6350 
                                   6351 ;---------------------------------
                                   6352 ; BASIC: SPIEN clkdiv, 0|1  
                                   6353 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6354 ; if clkdiv==-1 disable SPI
                                   6355 ; 0|1 -> disable|enable  
                                   6356 ;--------------------------------- 
                           000005  6357 SPI_CS_BIT=5
      00231A                       6358 spi_enable:
      00A040 01 26 FB         [ 4] 6359 	call arg_list 
      00A043 6B 01            [ 1] 6360 	cp a,#2
      00A045 7B 01            [ 1] 6361 	jreq 1$
      00A047 EA 03 E7         [ 2] 6362 	jp syntax_error 
      002324                       6363 1$: 
      00A04A 03 90 A3 00      [ 1] 6364 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A04E 01               [ 2] 6365 	popw x  
      00A04F 27               [ 2] 6366 	tnzw x 
      00A050 10 7B            [ 1] 6367 	jreq spi_disable 
      00A052 01               [ 2] 6368 	popw x 
      00A053 43 E4            [ 1] 6369 	ld a,#(1<<SPI_CR1_BR)
      00A055 04               [ 4] 6370 	mul x,a 
      00A056 E7               [ 1] 6371 	ld a,xl 
      00A057 04 7B 01         [ 1] 6372 	ld SPI_CR1,a 
                                   6373 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A05A 43 E4 02 E7      [ 1] 6374 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A05E 02 20 0C 16      [ 1] 6375 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6376 ; configure SPI as master mode 0.	
      00A061 72 14 52 00      [ 1] 6377 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6378 ; ~CS line controlled by sofware 	
      00A061 7B 01 EA 02      [ 1] 6379 	bset SPI_CR2,#SPI_CR2_SSM 
      00A065 E7 02 7B 01      [ 1] 6380     bset SPI_CR2,#SPI_CR2_SSI 
                                   6381 ; enable SPI
      00A069 EA 04 E7 04      [ 1] 6382 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A06D 81               [ 4] 6383 	ret 
      00234D                       6384 spi_disable:
      00234D                       6385 	_drop #2; throw first argument.
      00A06D 5B 01            [ 2]    1     addw sp,##2 
                                   6386 ; wait spi idle 
      00A06F 81 82            [ 1] 6387 1$:	ld a,#0x82 
      00A070 C4 52 03         [ 1] 6388 	and a,SPI_SR
      00A070 58 1C            [ 1] 6389 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A072 A0 80            [ 1] 6390 	jrne 1$
      00A074 FE 9F 88 5E      [ 1] 6391 	bres SPI_CR1,#SPI_CR1_SPE
      00A078 A6 05 42 1C      [ 1] 6392 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A07C 50 00 84 81      [ 1] 6393 	bres PE_DDR,#SPI_CS_BIT 
      00A080 81               [ 4] 6394 	ret 
                                   6395 
      002365                       6396 spi_clear_error:
      00A080 03 06            [ 1] 6397 	ld a,#0x78 
      00A082 03 05 04         [ 1] 6398 	bcp a,SPI_SR 
      00A085 00 02            [ 1] 6399 	jreq 1$
      00A087 01 06 00 02      [ 1] 6400 	clr SPI_SR 
      00A08B 02               [ 4] 6401 1$: ret 
                                   6402 
      002371                       6403 spi_send_byte:
      00A08C 02               [ 1] 6404 	push a 
      00A08D 03 03 01         [ 4] 6405 	call spi_clear_error
      00A090 03               [ 1] 6406 	pop a 
      00A091 03 02 04 04 05   [ 2] 6407 	btjf SPI_SR,#SPI_SR_TXE,.
      00A096 02 06 02         [ 1] 6408 	ld SPI_DR,a
      00A099 07 02 05 04 02   [ 2] 6409 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A09E 04 01 04         [ 1] 6410 	ld a,SPI_DR 
      00A0A0 81               [ 4] 6411 	ret 
                                   6412 
      002387                       6413 spi_rcv_byte:
      00A0A0 CD 91            [ 1] 6414 	ld a,#255
      00A0A2 39 A1 01 27 03   [ 2] 6415 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A0A7 CC 89 66         [ 1] 6416 	ld a,SPI_DR 
      00A0AA 81               [ 4] 6417 	ret
                                   6418 
                                   6419 ;------------------------------
                                   6420 ; BASIC: SPIWR byte [,byte]
                                   6421 ; write 1 or more byte
                                   6422 ;------------------------------
      002392                       6423 spi_write:
      00A0AA A6 80 15         [ 4] 6424 	call expression
      00A0AD 01 27            [ 1] 6425 	cp a,#TK_INTGR 
      00A0AF 05 A6            [ 1] 6426 	jreq 1$
      00A0B1 0A CC 89         [ 2] 6427 	jp syntax_error 
      00239C                       6428 1$:	
      00A0B4 68               [ 1] 6429 	ld a,xl 
      00A0B5 CD 23 71         [ 4] 6430 	call spi_send_byte 
      00A0B5 CE 00 13         [ 4] 6431 	call next_token 
      00A0B8 58 58            [ 1] 6432 	cp a,#TK_COMMA 
      00A0BA 58 58            [ 1] 6433 	jrne 2$ 
      00A0BC 58 9E            [ 2] 6434 	jra spi_write 
      00A0BE C8               [ 1] 6435 2$:	tnz a 
      00A0BF 00 13            [ 1] 6436 	jreq 3$
      0023AC                       6437 	_unget_token  
      00A0C1 C7 00 0D 9F C8   [ 1]    1      mov in,in.saved  
      00A0C6 00               [ 4] 6438 3$:	ret 
                                   6439 
                                   6440 
                                   6441 ;-------------------------------
                                   6442 ; BASIC: SPIRD 	
                                   6443 ; read one byte from SPI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



                                   6444 ;-------------------------------
      0023B2                       6445 spi_read:
      00A0C7 14 C7 00         [ 4] 6446 	call spi_rcv_byte 
      00A0CA 0E               [ 1] 6447 	clrw x 
      00A0CB CE               [ 1] 6448 	ld xl,a 
      00A0CC 00 15            [ 1] 6449 	ld a,#TK_INTGR 
      00A0CE CF               [ 4] 6450 	ret 
                                   6451 
                                   6452 ;------------------------------
                                   6453 ; BASIC: SPISEL 0|1 
                                   6454 ; set state of ~CS line
                                   6455 ; 0|1 deselect|select  
                                   6456 ;------------------------------
      0023BA                       6457 spi_select:
      00A0CF 00 13 90         [ 4] 6458 	call next_token 
      00A0D2 54 90            [ 1] 6459 	cp a,#TK_INTGR 
      00A0D4 9E C8            [ 1] 6460 	jreq 1$
      00A0D6 00 15 C7         [ 2] 6461 	jp syntax_error 
      00A0D9 00               [ 2] 6462 1$: tnzw x  
      00A0DA 15 90            [ 1] 6463 	jreq cs_high 
      00A0DC 9F C8 00 16      [ 1] 6464 	bres PE_ODR,#SPI_CS_BIT
      00A0E0 C7               [ 4] 6465 	ret 
      0023CC                       6466 cs_high: 
      00A0E1 00 16 CE 00      [ 1] 6467 	bset PE_ODR,#SPI_CS_BIT
      00A0E5 0D               [ 4] 6468 	ret 
                                   6469 
                                   6470 
                                   6471 
                                   6472 ;-------------------------------
                                   6473 ; BASIC: PAD 
                                   6474 ; Return pad buffer address.
                                   6475 ;------------------------------
      0023D1                       6476 pad_ref:
      00A0E6 54 54 54         [ 2] 6477 	ldw x,#pad 
      00A0E9 9E C8            [ 1] 6478 	ld a,TK_INTGR
      00A0EB 00               [ 4] 6479 	ret 
                                   6480 
                                   6481 ;------------------------------
                                   6482 ; BASIC; XTRMT  
                                   6483 ; transmit file using xmodem protocol
                                   6484 ; via terminal serial port 
                                   6485 ;------------------------------------
                           000001  6486 	SERIAL=1 ;packet serial number
                           000001  6487 	VAR_SIZE=1
      0023D7                       6488 transmit:
      0023D7                       6489 	_vars VAR_SIZE
      00A0EC 0D 95            [ 2]    1     sub sp,#VAR_SIZE 
      00A0EE 9F C8 00         [ 2] 6490 	ldw x,#xtrmt_msg 
      00A0F1 0E 97 C8         [ 4] 6491 	call puts 
                                   6492 ; end of file marker 
      00A0F4 00 16 97         [ 2] 6493 	ldw x,txtend 
      00A0F7 9E C8 00 15      [ 2] 6494 	ldw y,#END_IDX 
      00A0FB 95               [ 2] 6495 	ldw (x),y 
                                   6496 ; zeroes end of file 
      00A0FC CF 00 15         [ 2] 6497 	addw x,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A0FF 90               [ 2] 6498 	pushw x 
      00A100 85 65 93 5C      [ 2] 6499 	subw x,txtbgn 
      00A104 9F               [ 1] 6500 	ld a,xl 
      00A104 A6 84 81         [ 1] 6501 	ld acc8,a 
      00A107 A6 80            [ 1] 6502 	ld a,#128 
      00A107 52 03 0F         [ 1] 6503 	sub a,acc8 
      00A10A 02 0F 03         [ 1] 6504 	ld acc8,a 
      00A10D 90               [ 2] 6505 	popw x 
      00A10E AE               [ 1] 6506 1$:	clr (x)
      00A10F A9               [ 1] 6507 	incw x 
      00A110 7A 93 F6 A4      [ 1] 6508 	dec acc8  
      00A114 0F 6B            [ 1] 6509 	jrne 1$ 
                                   6510 ; transmit on other channel 	
      00A116 01 0C 03         [ 4] 6511 	call console_toggle  
      00A119 5C F6 CD 83      [ 2] 6512 	ldw y,#10000
      00A11D 78 0C 02         [ 4] 6513 	call getc_to ; receiver must send NAK  
      00A120 0A 01            [ 1] 6514 	cp a,#NAK 
      00A122 26 F5            [ 1] 6515 	jrne tx_failed
      00A124 A6 46            [ 1] 6516 	clr (SERIAL,sp)
      00A126 11 02 2B         [ 2] 6517 	ldw x,txtbgn
      002417                       6518 tx_loop:
      00A129 09 A6            [ 1] 6519 	ld a,(SERIAL,sp)
      00A12B 20               [ 1] 6520 	inc a
      00A12C CD 83            [ 1] 6521 	ld (SERIAL,sp),a 
      00A12E 78 0C 02         [ 4] 6522 	call xtrmt_block
      00A131 20 07            [ 1] 6523 	cp a,#NAK 
      00A133 A6 0D            [ 1] 6524 	jreq tx_failed 
      00A135 CD 83 78         [ 2] 6525 	cpw x,txtend
      00A138 0F 02            [ 1] 6526 	jrult tx_loop 
      002428                       6527 tx_success:
      00A13A 72 A2            [ 1] 6528 	ld a,#EOT 
      00A13C 00 02 90         [ 4] 6529 	call putc 
      00A13F FE 26 CF A6      [ 2] 6530 	ldw y,#1000
      00A143 0D CD 83         [ 4] 6531 	call getc_to  
      00A146 78 5F 7B         [ 4] 6532 	call console_toggle
      00A149 03 97 CD         [ 2] 6533 	ldw x,#x_success 
      00A14C 8A B9 AE         [ 4] 6534 	call puts 
      00A14F A1 57            [ 2] 6535 	jra tx_exit
      00243F                       6536 tx_failed:
      00A151 CD AA            [ 1] 6537 	ld a,#CAN 
      00A153 C0 5B 03         [ 4] 6538 	call putc 
      00A156 81 20 77 6F      [ 2] 6539 	ldw y,#1000 
      00A15A 72 64 73         [ 4] 6540 	call drain 
      00A15D 20 69 6E         [ 4] 6541 	call console_toggle 
      00A160 20 64 69         [ 2] 6542 	ldw x,#x_fail 
      00A163 63 74 69         [ 4] 6543 	call puts 
      002454                       6544 tx_exit:
      002454                       6545 	_drop VAR_SIZE 
      00A166 6F 6E            [ 2]    1     addw sp,#VAR_SIZE 
      00A168 61               [ 4] 6546 	ret
      00A169 72 79 0A 00 45 4D 20  6547 xtrmt_msg: .asciz "XMODEM transmit "	 
             74 72 61 6E 73 6D 69
             74 20 00
      00A16D 73 75 63 63 65 65 64  6548 x_success: .asciz "succeeded.\n"
             65 64 2E 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A16D CD 91 3E A1 01 27 03  6549 x_fail: .asciz "failed.\n"
             CC 89
                                   6550 
                                   6551 
                                   6552 ;------------------------------
                                   6553 ; BASIC: XRCV file_name 
                                   6554 ; receive a basic file using
                                   6555 ; xmodem protocol
                                   6556 ; via terminal serial port
                                   6557 ; file is expected to be tokenized 
                                   6558 ; BASIC file and is stored in RAM. 
                                   6559 ;------------------------------
      00247D                       6560 receive: 
      00A176 66 24 C7         [ 2] 6561 	ldw x,#xrcv_msg 
      00A177 CD 00 00         [ 4] 6562 	call puts 
      00A177 85 CF 00         [ 4] 6563 	call console_toggle
      00A17A 11 81            [ 1] 6564 	ld a,#NAK 
      00A17C CD 02 F8         [ 4] 6565 	call putc 
      00A17C CE 00 11         [ 2] 6566 	ldw x,txtbgn
      00A17F                       6567 rx_loop:
      00A17F 53 A3 FF         [ 4] 6568 	call xrcv_block
      00A182 FF 27            [ 1] 6569 	cp a,#ACK 
      00A184 01 5F            [ 1] 6570 	jreq rx_loop 
      00A186 A6 84            [ 1] 6571 	cp a,#EOT
      00A188 81 0F            [ 1] 6572 	jreq rx_success 	
      00A189                       6573 rx_failed:
      00A189 CD 91            [ 1] 6574 	ld a,#ETX 
      00A18B 39 A1 01         [ 4] 6575 	call putc 
      00A18E 27 03 CC         [ 4] 6576 	call console_toggle
      00A191 89 66 85         [ 2] 6577 	ldw x,#x_fail 
      00A194 20 E9 00         [ 4] 6578 	call puts 
      00A196 81               [ 4] 6579 	ret 
      0024A8                       6580 rx_success:
                                   6581 ;back to END_IDX 	
      00A196 CD 91 3E         [ 2] 6582 	cpw x,txtbgn
      00A199 A1 01            [ 1] 6583 	jreq 1$ 
      00A19B 27 03            [ 1] 6584 	ldw y,x 
      00A19D CC 89            [ 2] 6585 	ldw y,(y)
      00A19F 66 85 4B 00      [ 2] 6586 	cpw y,#END_IDX 
      00A1A3 35 CC            [ 1] 6587 	jreq 1$
      00A1A5 50               [ 2] 6588 	decw x 
      00A1A6 E0 9E            [ 2] 6589 	jra rx_success
      00A1A8 A4 3F 95         [ 2] 6590 1$:	ldw txtend,x 
      00A1AB A3 00 FF         [ 4] 6591 	call console_toggle
      00A1AE 23 06 0C         [ 2] 6592 	ldw x,#x_success
      00A1B1 01 98 56         [ 4] 6593 	call puts 
      00A1B4 20               [ 4] 6594 	ret
      00A1B5 F5 35 55 50 E0 84 C7  6595 xrcv_msg: .asciz "XMODEM receive "
             50 E1 9F 4A 35 55 50
             E0 C7
                                   6596 
                                   6597 ;------------------------------
                                   6598 ; BASIC: COMA  
                                   6599 ; return device id of UART1 
                                   6600 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      0024D7                       6601 const_coma:
      00A1C5 50 E2            [ 1] 6602 	ld a,#TK_INTGR
      00A1C7 35 AA 50         [ 2] 6603 	ldw x,#UART1 
      00A1CA E0               [ 4] 6604 	ret
                                   6605 
                                   6606 ;------------------------------
                                   6607 ; BASIC: COMC 
                                   6608 ; return device id of UART3
                                   6609 ;------------------------------
      0024DD                       6610 const_comc:
      00A1CB 81 84            [ 1] 6611 	ld a,#TK_INTGR
      00A1CC AE 00 02         [ 2] 6612 	ldw x,#UART3 
      00A1CC 35               [ 4] 6613 	ret 	 
                                   6614 
                                   6615 ;-------------------------
                                   6616 ; console_toggle
                                   6617 ; switch to other console 
                                   6618 ; channel
                                   6619 ;-------------------------
      0024E3                       6620 console_toggle:
      00A1CD AA 50            [ 1] 6621 	ld a,#UART3 
      00A1CF E0 81 2F         [ 1] 6622 	sub a,comm 
      00A1D1 CC 24 F7         [ 2] 6623 	jp con_sel
                                   6624 
                                   6625 ;------------------------------
                                   6626 ; BASIC: CONSOLE COMA|COMC
                                   6627 ; select communication channel 
                                   6628 ; default is COMA
                                   6629 ;------------------------------
      0024EB                       6630 console_select:
      00A1D1 CD 91 39         [ 4] 6631 	call next_token 
      00A1D4 A1 01            [ 1] 6632 	cp a,#TK_IFUNC
      00A1D6 27 03            [ 1] 6633 	jreq 1$
      00A1D8 CC 89 66         [ 2] 6634 	jp syntax_error
      00A1DB 85               [ 4] 6635 1$: call (x)
      00A1DC 9F               [ 1] 6636 	ld a,xl 
                                   6637 ;-----------------------------
                                   6638 ; comm_sel 
                                   6639 ; input:
                                   6640 ;    A    channel UART1|UART3	
                                   6641 ;----------------------------
      0024F7                       6642 con_sel:: 
      00A1DC 5D 27            [ 1] 6643 	cp a,#UART1 
      00A1DE 0A A6            [ 1] 6644 	jreq 4$
      00A1E0 0F 59            [ 1] 6645 	cp a,#UART3 
      00A1E2 25 03            [ 1] 6646 	jreq 6$
      00A1E4 4A 20 FA         [ 2] 6647 	jp syntax_error 
      00A1E7 5F 97 A6         [ 1] 6648 4$: ld comm,a  
      00A1EA 84 81 52 45      [ 1] 6649 	bres UART3_CR2,#UART_CR2_RIEN
      00A1EC 72 5F 00 2D      [ 1] 6650 	clr rx_head 
      00A1EC CD 91 39 A1      [ 1] 6651 	clr rx_tail  
      00A1F0 01 27            [ 1] 6652 	ld a,#UART1_DR
      00A1F2 03 CC 89 66      [ 1] 6653 	bset UART1_CR2,#UART_CR2_RIEN 
      00A1F6 85               [ 4] 6654 	ret 
      00A1F7 9F A4 0F         [ 1] 6655 6$: ld comm,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00A1FA 5F 5C 4D 27      [ 1] 6656 	bres UART1_CR2,#UART_CR2_RIEN
      00A1FE 04 58 4A 20      [ 1] 6657 	clr rx_head 
      00A202 F9 A6 84 81      [ 1] 6658 	clr rx_tail 
      00A206 A6 41            [ 1] 6659 	ld a,#UART3_DR  
      00A206 CD 91 39 A1      [ 1] 6660 	bset UART3_CR2,#UART_CR2_RIEN 
      00A20A 01               [ 4] 6661 	ret 
                                   6662 
                                   6663 ;------------------------------
                                   6664 ;      dictionary 
                                   6665 ; format:
                                   6666 ;   link:   2 bytes 
                                   6667 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6668 ;   cmd_name: 16 byte max 
                                   6669 ;   cmd_index: 2 bytes 
                                   6670 ;------------------------------
                                   6671 	.macro _dict_entry len,name,cmd_idx 
                                   6672 	.word LINK 
                                   6673 	LINK=.
                                   6674 name:
                                   6675 	.byte len 	
                                   6676 	.ascii "name"
                                   6677 	.word cmd_idx 
                                   6678 	.endm 
                                   6679 
                           000000  6680 	LINK=0
                                   6681 ; respect alphabetic order for BASIC names from Z-A
                                   6682 ; this sort order is for a cleaner WORDS cmd output. 	
      00252E                       6683 kword_end:
      00252E                       6684 	_dict_entry,5,XTRMT,XTRMT_IDX ; xmodem transmit
      00A20B 27 03                    1 	.word LINK 
                           002530     2 	LINK=.
      002530                          3 XTRMT:
      00A20D CC                       4 	.byte 5 	
      00A20E 89 66 85 53 A6           5 	.ascii "XTRMT"
      00A213 84 81                    6 	.word XTRMT_IDX 
      00A215                       6685 	_dict_entry,4,XRCV,XRCV_IDX ; xmodem receive
      00A215 85 52                    1 	.word LINK 
                           00253A     2 	LINK=.
      00253A                          3 XRCV:
      00A217 04                       4 	.byte 4 	
      00A218 89 90 CE 00              5 	.ascii "XRCV"
      00A21C 05 17                    6 	.word XRCV_IDX 
      002541                       6686 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A21E 03 90                    1 	.word LINK 
                           002543     2 	LINK=.
      002543                          3 XOR:
      00A220 CE                       4 	.byte 3+F_IFUNC 	
      00A221 00 01 17                 5 	.ascii "XOR"
      00A224 05 72                    6 	.word XOR_IDX 
      002549                       6687 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A226 5C 00                    1 	.word LINK 
                           00254B     2 	LINK=.
      00254B                          3 WRITE:
      00A228 21                       4 	.byte 5 	
      00A229 81 52 49 54 45           5 	.ascii "WRITE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A22A 00 C4                    6 	.word WRITE_IDX 
      002553                       6688 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A22A 72 5D                    1 	.word LINK 
                           002555     2 	LINK=.
      002555                          3 WORDS:
      00A22C 00                       4 	.byte 5 	
      00A22D 21 26 03 CC 89           5 	.ascii "WORDS"
      00A232 66 C2                    6 	.word WORDS_IDX 
      00A233                       6689 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A233 CD 92                    1 	.word LINK 
                           00255F     2 	LINK=.
      00255F                          3 WAIT:
      00A235 89                       4 	.byte 4 	
      00A236 A1 84 27 03              5 	.ascii "WAIT"
      00A23A CC 89                    6 	.word WAIT_IDX 
      002566                       6690 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A23C 66 5F                    1 	.word LINK 
                           002568     2 	LINK=.
      00A23D                          3 USR:
      00A23D 5D                       4 	.byte 3+F_IFUNC 	
      00A23E 26 10 1E                 5 	.ascii "USR"
      00A241 03 CF                    6 	.word USR_IDX 
      00256E                       6691 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A243 00 05                    1 	.word LINK 
                           002570     2 	LINK=.
      002570                          3 UNTIL:
      00A245 E6                       4 	.byte 5 	
      00A246 02 C7 00 04 1E           5 	.ascii "UNTIL"
      00A24B 05 CF                    6 	.word UNTIL_IDX 
      002578                       6692 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A24D 00 01                    1 	.word LINK 
                           00257A     2 	LINK=.
      00257A                          3 UFLASH:
      00A24F 81                       4 	.byte 6+F_IFUNC 	
      00A250 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A250 85 5B                    6 	.word UFLASH_IDX 
      002583                       6693 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A252 04 72                    1 	.word LINK 
                           002585     2 	LINK=.
      002585                          3 UBOUND:
      00A254 5A                       4 	.byte 6+F_IFUNC 	
      00A255 00 21 FC 55 4E 44        5 	.ascii "UBOUND"
      00A258 00 B8                    6 	.word UBOUND_IDX 
      00258E                       6694 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A258 AE 00                    1 	.word LINK 
                           002590     2 	LINK=.
      002590                          3 TONE:
      00A25A 00                       4 	.byte 4 	
      00A25B A6 84 81 45              5 	.ascii "TONE"
      00A25E 00 B6                    6 	.word TONE_IDX 
      002597                       6695 	_dict_entry,2,TO,TO_IDX;to
      00A25E AE 00                    1 	.word LINK 
                           002599     2 	LINK=.
      002599                          3 TO:
      00A260 01                       4 	.byte 2 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A261 A6 84                    5 	.ascii "TO"
      00A263 81 B4                    6 	.word TO_IDX 
      00A264                       6696 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A264 AE 00                    1 	.word LINK 
                           0025A0     2 	LINK=.
      0025A0                          3 TIMEOUT:
      00A266 02                       4 	.byte 7+F_IFUNC 	
      00A267 A6 84 81 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A26A 00 B2                    6 	.word TMROUT_IDX 
      0025AA                       6697 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A26A AE 00                    1 	.word LINK 
                           0025AC     2 	LINK=.
      0025AC                          3 TIMER:
      00A26C 03                       4 	.byte 5 	
      00A26D A6 84 81 45 52           5 	.ascii "TIMER"
      00A270 00 B0                    6 	.word TIMER_IDX 
      0025B4                       6698 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A270 AE 00                    1 	.word LINK 
                           0025B6     2 	LINK=.
      0025B6                          3 TICKS:
      00A272 04                       4 	.byte 5+F_IFUNC 	
      00A273 A6 84 81 4B 53           5 	.ascii "TICKS"
      00A276 00 AE                    6 	.word TICKS_IDX 
      0025BE                       6699 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A276 AE 00                    1 	.word LINK 
                           0025C0     2 	LINK=.
      0025C0                          3 STOP:
      00A278 05                       4 	.byte 4 	
      00A279 A6 84 81 50              5 	.ascii "STOP"
      00A27C 00 AC                    6 	.word STOP_IDX 
      0025C7                       6700 	_dict_entry,4,STEP,STEP_IDX;step 
      00A27C AE 00                    1 	.word LINK 
                           0025C9     2 	LINK=.
      0025C9                          3 STEP:
      00A27E 06                       4 	.byte 4 	
      00A27F A6 84 81 50              5 	.ascii "STEP"
      00A282 00 AA                    6 	.word STEP_IDX 
      0025D0                       6701 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A282 AE 00                    1 	.word LINK 
                           0025D2     2 	LINK=.
      0025D2                          3 SPIWR:
      00A284 07                       4 	.byte 5 	
      00A285 A6 84 81 57 52           5 	.ascii "SPIWR"
      00A288 00 A8                    6 	.word SPIWR_IDX 
      0025DA                       6702 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A288 AE 00                    1 	.word LINK 
                           0025DC     2 	LINK=.
      0025DC                          3 SPISEL:
      00A28A 08                       4 	.byte 6 	
      00A28B A6 84 81 53 45 4C        5 	.ascii "SPISEL"
      00A28E 00 A6                    6 	.word SPISEL_IDX 
      0025E5                       6703 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A28E A6 84                    1 	.word LINK 
                           0025E7     2 	LINK=.
      0025E7                          3 SPIEN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A290 AE                       4 	.byte 5 	
      00A291 00 00 81 45 4E           5 	.ascii "SPIEN"
      00A294 00 A4                    6 	.word SPIEN_IDX 
      0025EF                       6704 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A294 A6 84                    1 	.word LINK 
                           0025F1     2 	LINK=.
      0025F1                          3 SPIRD:
      00A296 AE                       4 	.byte 5+F_IFUNC 	
      00A297 00 01 81 52 44           5 	.ascii "SPIRD"
      00A29A 00 A2                    6 	.word SPIRD_IDX 
      0025F9                       6705 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A29A A6 84                    1 	.word LINK 
                           0025FB     2 	LINK=.
      0025FB                          3 SLEEP:
      00A29C AE                       4 	.byte 5 	
      00A29D 00 02 81 45 50           5 	.ascii "SLEEP"
      00A2A0 00 A0                    6 	.word SLEEP_IDX 
      002603                       6706 	_dict_entry,4+F_IFUNC,SIZE,SIZE_IDX;size
      00A2A0 A6 84                    1 	.word LINK 
                           002605     2 	LINK=.
      002605                          3 SIZE:
      00A2A2 AE                       4 	.byte 4+F_IFUNC 	
      00A2A3 00 03 81 45              5 	.ascii "SIZE"
      00A2A6 00 9E                    6 	.word SIZE_IDX 
      00260C                       6707     _dict_entry,4,SHOW,SHOW_IDX;show 
      00A2A6 A6 84                    1 	.word LINK 
                           00260E     2 	LINK=.
      00260E                          3 SHOW:
      00A2A8 AE                       4 	.byte 4 	
      00A2A9 00 04 81 57              5 	.ascii "SHOW"
      00A2AC 00 9C                    6 	.word SHOW_IDX 
      002615                       6708 	_dict_entry,4,SAVE,SAVE_IDX;save
      00A2AC A6 84                    1 	.word LINK 
                           002617     2 	LINK=.
      002617                          3 SAVE:
      00A2AE AE                       4 	.byte 4 	
      00A2AF 00 01 81 45              5 	.ascii "SAVE"
      00A2B2 00 9A                    6 	.word SAVE_IDX 
      00261E                       6709 	_dict_entry 3,RUN,RUN_IDX;run
      00A2B2 A6 84                    1 	.word LINK 
                           002620     2 	LINK=.
      002620                          3 RUN:
      00A2B4 AE                       4 	.byte 3 	
      00A2B5 00 00 81                 5 	.ascii "RUN"
      00A2B8 00 98                    6 	.word RUN_IDX 
      002626                       6710 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A2B8 A6 84                    1 	.word LINK 
                           002628     2 	LINK=.
      002628                          3 RSHIFT:
      00A2BA AE                       4 	.byte 6+F_IFUNC 	
      00A2BB 40 00 81 49 46 54        5 	.ascii "RSHIFT"
      00A2BE 00 96                    6 	.word RSHIFT_IDX 
      002631                       6711 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A2BE 55 00                    1 	.word LINK 
                           002633     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      002633                          3 RND:
      00A2C0 04                       4 	.byte 3+F_IFUNC 	
      00A2C1 00 02 81                 5 	.ascii "RND"
      00A2C4 00 94                    6 	.word RND_IDX 
      002639                       6712 	_dict_entry,6,RETURN,RET_IDX;return 
      00A2C4 CD 92                    1 	.word LINK 
                           00263B     2 	LINK=.
      00263B                          3 RETURN:
      00A2C6 3D                       4 	.byte 6 	
      00A2C7 A1 84 27 03 CC 89        5 	.ascii "RETURN"
      00A2CD 66 CD                    6 	.word RET_IDX 
      002644                       6713 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A2CF 84 E6                    1 	.word LINK 
                           002646     2 	LINK=.
      002646                          3 RESTORE:
      00A2D1 5D                       4 	.byte 7 	
      00A2D2 26 05 A6 05 CC 89 68     5 	.ascii "RESTORE"
      00A2D9 00 90                    6 	.word REST_IDX 
      002650                       6714 	_dict_entry 6,REMARK,REM_IDX;remark 
      00A2D9 90 93                    1 	.word LINK 
                           002652     2 	LINK=.
      002652                          3 REMARK:
      00A2DB EE                       4 	.byte 6 	
      00A2DC 04 A3 A2 BE 26 F2        5 	.ascii "REMARK"
      00A2E2 90 CF                    6 	.word REM_IDX 
      00265B                       6715 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A2E4 00 07                    1 	.word LINK 
                           00265D     2 	LINK=.
      00265D                          3 REBOOT:
      00A2E6 90                       4 	.byte 6 	
      00A2E7 E6 02 C7 00 0A 35        5 	.ascii "REBOOT"
      00A2ED 06 00                    6 	.word RBT_IDX 
      002666                       6716 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A2EF 09 81                    1 	.word LINK 
                           002668     2 	LINK=.
      00A2F1                          3 READ:
      00A2F1 72                       4 	.byte 4+F_IFUNC 	
      00A2F2 5F 00 07 72              5 	.ascii "READ"
      00A2F6 5F 00                    6 	.word READ_IDX 
      00266F                       6717 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A2F8 08 72                    1 	.word LINK 
                           002671     2 	LINK=.
      002671                          3 QKEY:
      00A2FA 5F                       4 	.byte 4+F_IFUNC 	
      00A2FB 00 09 72 5F              5 	.ascii "QKEY"
      00A2FF 00 0A                    6 	.word QKEY_IDX 
      002678                       6718 	_dict_entry,4+F_IFUNC,PRTI,PRTI_IDX;const_porti 
      00A301 CE 00                    1 	.word LINK 
                           00267A     2 	LINK=.
      00267A                          3 PRTI:
      00A303 1D                       4 	.byte 4+F_IFUNC 	
      00A304 50 52 54 49              5 	.ascii "PRTI"
      00A304 C3 00                    6 	.word PRTI_IDX 
      002681                       6719 	_dict_entry,4+F_IFUNC,PRTH,PRTH_IDX;const_porth 
      00A306 1F 24                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002683     2 	LINK=.
      002683                          3 PRTH:
      00A308 1B                       4 	.byte 4+F_IFUNC 	
      00A309 90 93 EE 04              5 	.ascii "PRTH"
      00A30D 1C A9                    6 	.word PRTH_IDX 
      00268A                       6720 	_dict_entry,4+F_IFUNC,PRTG,PRTG_IDX;const_portg 
      00A30F 80 FE                    1 	.word LINK 
                           00268C     2 	LINK=.
      00268C                          3 PRTG:
      00A311 A3                       4 	.byte 4+F_IFUNC 	
      00A312 A2 BE 26 1A              5 	.ascii "PRTG"
      00A316 90 CF                    6 	.word PRTG_IDX 
      002693                       6721 	_dict_entry,4+F_IFUNC,PRTF,PRTF_IDX;const_portf
      00A318 00 07                    1 	.word LINK 
                           002695     2 	LINK=.
      002695                          3 PRTF:
      00A31A 90                       4 	.byte 4+F_IFUNC 	
      00A31B E6 02 C7 00              5 	.ascii "PRTF"
      00A31F 0A 35                    6 	.word PRTF_IDX 
      00269C                       6722 	_dict_entry,4+F_IFUNC,PRTE,PRTE_IDX;const_porte
      00A321 06 00                    1 	.word LINK 
                           00269E     2 	LINK=.
      00269E                          3 PRTE:
      00A323 09                       4 	.byte 4+F_IFUNC 	
      00A324 72 5D 00 0A              5 	.ascii "PRTE"
      00A328 26 05                    6 	.word PRTE_IDX 
      0026A5                       6723 	_dict_entry,4+F_IFUNC,PRTD,PRTD_IDX;const_portd
      00A32A A6 0C                    1 	.word LINK 
                           0026A7     2 	LINK=.
      0026A7                          3 PRTD:
      00A32C CC                       4 	.byte 4+F_IFUNC 	
      00A32D 89 68 81 44              5 	.ascii "PRTD"
      00A330 00 7C                    6 	.word PRTD_IDX 
      0026AE                       6724 	_dict_entry,4+F_IFUNC,PRTC,PRTC_IDX;const_portc
      00A330 93 E6                    1 	.word LINK 
                           0026B0     2 	LINK=.
      0026B0                          3 PRTC:
      00A332 02                       4 	.byte 4+F_IFUNC 	
      00A333 C7 00 0E 72              5 	.ascii "PRTC"
      00A337 5F 00                    6 	.word PRTC_IDX 
      0026B7                       6725 	_dict_entry,4+F_IFUNC,PRTB,PRTB_IDX;const_portb
      00A339 0D 72                    1 	.word LINK 
                           0026B9     2 	LINK=.
      0026B9                          3 PRTB:
      00A33B BB                       4 	.byte 4+F_IFUNC 	
      00A33C 00 0D 20 C4              5 	.ascii "PRTB"
      00A340 00 78                    6 	.word PRTB_IDX 
      0026C0                       6726 	_dict_entry,4+F_IFUNC,PRTA,PRTA_IDX;const_porta 
      00A340 52 06                    1 	.word LINK 
                           0026C2     2 	LINK=.
      00A342                          3 PRTA:
      00A342 C6                       4 	.byte 4+F_IFUNC 	
      00A343 00 09 C1 00              5 	.ascii "PRTA"
      00A347 0A 27                    6 	.word PRTA_IDX 
      0026C9                       6727 	_dict_entry 5,PRINT,PRT_IDX;print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A349 37 CD                    1 	.word LINK 
                           0026CB     2 	LINK=.
      0026CB                          3 PRINT:
      00A34B 96                       4 	.byte 5 	
      00A34C 90 CE 00 07 CF           5 	.ascii "PRINT"
      00A351 00 05                    6 	.word PRT_IDX 
      0026D3                       6728 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A353 55 00                    1 	.word LINK 
                           0026D5     2 	LINK=.
      0026D5                          3 POUT:
      00A355 09                       4 	.byte 4+F_IFUNC 	
      00A356 00 02 55 00              5 	.ascii "POUT"
      00A35A 0A 00                    6 	.word POUT_IDX 
      0026DC                       6729 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A35C 04 CD                    1 	.word LINK 
                           0026DE     2 	LINK=.
      0026DE                          3 POKE:
      00A35E 92                       4 	.byte 4 	
      00A35F 3D A1 84 27              5 	.ascii "POKE"
      00A363 03 CC                    6 	.word POKE_IDX 
      0026E5                       6730 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A365 89 66                    1 	.word LINK 
                           0026E7     2 	LINK=.
      00A367                          3 PINP:
      00A367 1F                       4 	.byte 4+F_IFUNC 	
      00A368 05 CD 8A 58              5 	.ascii "PINP"
      00A36C CE 00                    6 	.word PINP_IDX 
      0026EE                       6731 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A36E 05 CF                    1 	.word LINK 
                           0026F0     2 	LINK=.
      0026F0                          3 PEEK:
      00A370 00                       4 	.byte 4+F_IFUNC 	
      00A371 07 55 00 02              5 	.ascii "PEEK"
      00A375 00 09                    6 	.word PEEK_IDX 
      0026F7                       6732 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A377 CD 96                    1 	.word LINK 
                           0026F9     2 	LINK=.
      0026F9                          3 PMODE:
      00A379 A0                       4 	.byte 5 	
      00A37A 1E 05 A6 84 5B           5 	.ascii "PMODE"
      00A37F 06 81                    6 	.word PMODE_IDX 
      00A381                       6733 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A381 90 CE                    1 	.word LINK 
                           002703     2 	LINK=.
      002703                          3 PAUSE:
      00A383 00                       4 	.byte 5 	
      00A384 07 72 5F 00 07           5 	.ascii "PAUSE"
      00A389 72 5F                    6 	.word PAUSE_IDX 
      00270B                       6734 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A38B 00 08                    1 	.word LINK 
                           00270D     2 	LINK=.
      00270D                          3 PAD:
      00A38D 72                       4 	.byte 3+F_IFUNC 	
      00A38E 5F 00 09                 5 	.ascii "PAD"
      00A391 72 5F                    6 	.word PAD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      002713                       6735 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A393 00 0A                    1 	.word LINK 
                           002715     2 	LINK=.
      002715                          3 OR:
      00A395 CD                       4 	.byte 2+F_IFUNC 	
      00A396 A3 30                    5 	.ascii "OR"
      00A398 20 A8                    6 	.word OR_IDX 
      00A39A                       6736 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A39A CD 91                    1 	.word LINK 
                           00271C     2 	LINK=.
      00271C                          3 ODR:
      00A39C 3E                       4 	.byte 3+F_IFUNC 	
      00A39D A1 02 27                 5 	.ascii "ODR"
      00A3A0 03 CC                    6 	.word ODR_IDX 
      002722                       6737 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A3A2 89 66                    1 	.word LINK 
                           002724     2 	LINK=.
      00A3A4                          3 NOT:
      00A3A4 72                       4 	.byte 3+F_IFUNC 	
      00A3A5 12 50 C7                 5 	.ascii "NOT"
      00A3A8 85 5D                    6 	.word NOT_IDX 
      00272A                       6738 	_dict_entry,3,NEW,NEW_IDX;new
      00A3AA 27 21                    1 	.word LINK 
                           00272C     2 	LINK=.
      00272C                          3 NEW:
      00A3AC 85                       4 	.byte 3 	
      00A3AD A6 08 42                 5 	.ascii "NEW"
      00A3B0 9F C7                    6 	.word NEW_IDX 
      002732                       6739 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A3B2 52 00                    1 	.word LINK 
                           002734     2 	LINK=.
      002734                          3 NEXT:
      00A3B4 72                       4 	.byte 4 	
      00A3B5 1A 50 14 72              5 	.ascii "NEXT"
      00A3B9 1A 50                    6 	.word NEXT_IDX 
      00273B                       6740 	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      00A3BB 16 72                    1 	.word LINK 
                           00273D     2 	LINK=.
      00273D                          3 MULDIV:
      00A3BD 14                       4 	.byte 6+F_IFUNC 	
      00A3BE 52 00 72 12 52 01        5 	.ascii "MULDIV"
      00A3C4 72 10                    6 	.word MULDIV_IDX 
      002746                       6741 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00A3C6 52 01                    1 	.word LINK 
                           002748     2 	LINK=.
      002748                          3 LSHIFT:
      00A3C8 72                       4 	.byte 6+F_IFUNC 	
      00A3C9 1C 52 00 81 46 54        5 	.ascii "LSHIFT"
      00A3CD 00 58                    6 	.word LSHIFT_IDX 
      002751                       6742 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00A3CD 5B 02                    1 	.word LINK 
                           002753     2 	LINK=.
      002753                          3 LOG:
      00A3CF A6                       4 	.byte 3+F_IFUNC 	
      00A3D0 82 C4 52                 5 	.ascii "LOG"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A3D3 03 A1                    6 	.word LOG_IDX 
      002759                       6743 	_dict_entry,4,LOAD,LOAD_IDX;load 
      00A3D5 02 26                    1 	.word LINK 
                           00275B     2 	LINK=.
      00275B                          3 LOAD:
      00A3D7 F7                       4 	.byte 4 	
      00A3D8 72 1D 52 00              5 	.ascii "LOAD"
      00A3DC 72 13                    6 	.word LOAD_IDX 
      002762                       6744 	_dict_entry 4,LIST,LIST_IDX;list
      00A3DE 50 C7                    1 	.word LINK 
                           002764     2 	LINK=.
      002764                          3 LIST:
      00A3E0 72                       4 	.byte 4 	
      00A3E1 1B 50 16 81              5 	.ascii "LIST"
      00A3E5 00 52                    6 	.word LIST_IDX 
      00276B                       6745 	_dict_entry 3,LET,LET_IDX;let 
      00A3E5 A6 78                    1 	.word LINK 
                           00276D     2 	LINK=.
      00276D                          3 LET:
      00A3E7 C5                       4 	.byte 3 	
      00A3E8 52 03 27                 5 	.ascii "LET"
      00A3EB 04 72                    6 	.word LET_IDX 
      002773                       6746 	_dict_entry,3+F_IFUNC,KEY,KEY_IDX;key 
      00A3ED 5F 52                    1 	.word LINK 
                           002775     2 	LINK=.
      002775                          3 KEY:
      00A3EF 03                       4 	.byte 3+F_IFUNC 	
      00A3F0 81 45 59                 5 	.ascii "KEY"
      00A3F1 00 4E                    6 	.word KEY_IDX 
      00277B                       6747 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00A3F1 88 CD                    1 	.word LINK 
                           00277D     2 	LINK=.
      00277D                          3 IWDGREF:
      00A3F3 A3                       4 	.byte 7 	
      00A3F4 E5 84 72 03 52 03 FB     5 	.ascii "IWDGREF"
      00A3FB C7 52                    6 	.word IWDGREF_IDX 
      002787                       6748 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00A3FD 04 72                    1 	.word LINK 
                           002789     2 	LINK=.
      002789                          3 IWDGEN:
      00A3FF 01                       4 	.byte 6 	
      00A400 52 03 FB C6 52 04        5 	.ascii "IWDGEN"
      00A406 81 4A                    6 	.word IWDGEN_IDX 
      00A407                       6749 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00A407 A6 FF                    1 	.word LINK 
                           002794     2 	LINK=.
      002794                          3 INVERT:
      00A409 72                       4 	.byte 6+F_IFUNC 	
      00A40A 01 52 03 E3 C6 52        5 	.ascii "INVERT"
      00A410 04 81                    6 	.word INVERT_IDX 
      00A412                       6750 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00A412 CD 92                    1 	.word LINK 
                           00279F     2 	LINK=.
      00279F                          3 INPUT:
      00A414 3D                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A415 A1 84 27 03 CC           5 	.ascii "INPUT"
      00A41A 89 66                    6 	.word INPUT_IDX 
      00A41C                       6751 	_dict_entry,2,IF,IF_IDX;if 
      00A41C 9F CD                    1 	.word LINK 
                           0027A9     2 	LINK=.
      0027A9                          3 IF:
      00A41E A3                       4 	.byte 2 	
      00A41F F1 CD                    5 	.ascii "IF"
      00A421 8A 58                    6 	.word IF_IDX 
      0027AE                       6752 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00A423 A1 09                    1 	.word LINK 
                           0027B0     2 	LINK=.
      0027B0                          3 IDR:
      00A425 26                       4 	.byte 3+F_IFUNC 	
      00A426 02 20 E9                 5 	.ascii "IDR"
      00A429 4D 27                    6 	.word IDR_IDX 
      0027B6                       6753 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00A42B 05 55                    1 	.word LINK 
                           0027B8     2 	LINK=.
      0027B8                          3 HEX:
      00A42D 00                       4 	.byte 3 	
      00A42E 03 00 02                 5 	.ascii "HEX"
      00A431 81 40                    6 	.word HEX_IDX 
      00A432                       6754 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00A432 CD A4                    1 	.word LINK 
                           0027C0     2 	LINK=.
      0027C0                          3 GPIO:
      00A434 07                       4 	.byte 4+F_IFUNC 	
      00A435 5F 97 A6 84              5 	.ascii "GPIO"
      00A439 81 3E                    6 	.word GPIO_IDX 
      00A43A                       6755 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00A43A CD 8A                    1 	.word LINK 
                           0027C9     2 	LINK=.
      0027C9                          3 GOTO:
      00A43C 58                       4 	.byte 4 	
      00A43D A1 84 27 03              5 	.ascii "GOTO"
      00A441 CC 89                    6 	.word GOTO_IDX 
      0027D0                       6756 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00A443 66 5D                    1 	.word LINK 
                           0027D2     2 	LINK=.
      0027D2                          3 GOSUB:
      00A445 27                       4 	.byte 5 	
      00A446 05 72 1B 50 14           5 	.ascii "GOSUB"
      00A44B 81 3A                    6 	.word GOSUB_IDX 
      00A44C                       6757 	_dict_entry,6,FORGET,FORGET_IDX;forget 
      00A44C 72 1A                    1 	.word LINK 
                           0027DC     2 	LINK=.
      0027DC                          3 FORGET:
      00A44E 50                       4 	.byte 6 	
      00A44F 14 81 52 47 45 54        5 	.ascii "FORGET"
      00A451 00 38                    6 	.word FORGET_IDX 
      0027E5                       6758 	_dict_entry,3,FOR,FOR_IDX;for 
      00A451 AE 16                    1 	.word LINK 
                           0027E7     2 	LINK=.
      0027E7                          3 FOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00A453 E0                       4 	.byte 3 	
      00A454 B6 84 81                 5 	.ascii "FOR"
      00A457 00 36                    6 	.word FOR_IDX 
      0027ED                       6759 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00A457 52 01                    1 	.word LINK 
                           0027EF     2 	LINK=.
      0027EF                          3 FCPU:
      00A459 AE                       4 	.byte 4 	
      00A45A A4 D7 CD AA              5 	.ascii "FCPU"
      00A45E C0 CE                    6 	.word FCPU_IDX 
      0027F6                       6760 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00A460 00 1F                    1 	.word LINK 
                           0027F8     2 	LINK=.
      0027F8                          3 EEPROM:
      00A462 90                       4 	.byte 6+F_IFUNC 	
      00A463 AE 00 30 FF 1C 00        5 	.ascii "EEPROM"
      00A469 02 89                    6 	.word EEPROM_IDX 
      002801                       6761 	_dict_entry,3,END,END_IDX;cmd_end  
      00A46B 72 B0                    1 	.word LINK 
                           002803     2 	LINK=.
      002803                          3 END:
      00A46D 00                       4 	.byte 3 	
      00A46E 1D 9F C7                 5 	.ascii "END"
      00A471 00 0E                    6 	.word END_IDX 
      002809                       6762 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00A473 A6 80                    1 	.word LINK 
                           00280B     2 	LINK=.
      00280B                          3 DWRITE:
      00A475 C0                       4 	.byte 6+F_CMD 	
      00A476 00 0E C7 00 0E 85        5 	.ascii "DWRITE"
      00A47C 7F 5C                    6 	.word DWRITE_IDX 
      002814                       6763 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00A47E 72 5A                    1 	.word LINK 
                           002816     2 	LINK=.
      002816                          3 DREAD:
      00A480 00                       4 	.byte 5+F_IFUNC 	
      00A481 0E 26 F8 CD A5           5 	.ascii "DREAD"
      00A486 63 90                    6 	.word DREAD_IDX 
      00281E                       6764 	_dict_entry,2,DO,DO_IDX;do_loop
      00A488 AE 27                    1 	.word LINK 
                           002820     2 	LINK=.
      002820                          3 DO:
      00A48A 10                       4 	.byte 2 	
      00A48B CD AD                    5 	.ascii "DO"
      00A48D B1 A1                    6 	.word DO_IDX 
      002825                       6765 	_dict_entry,3,DIR,DIR_IDX;directory 
      00A48F 15 26                    1 	.word LINK 
                           002827     2 	LINK=.
      002827                          3 DIR:
      00A491 2D                       4 	.byte 3 	
      00A492 0F 01 CE                 5 	.ascii "DIR"
      00A495 00 1D                    6 	.word DIR_IDX 
      00A497                       6766 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00A497 7B 01                    1 	.word LINK 
                           00282F     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      00282F                          3 DEC:
      00A499 4C                       4 	.byte 3 	
      00A49A 6B 01 CD                 5 	.ascii "DEC"
      00A49D AE 61                    6 	.word DEC_IDX 
      002835                       6767 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00A49F A1 15                    1 	.word LINK 
                           002837     2 	LINK=.
      002837                          3 DDR:
      00A4A1 27                       4 	.byte 3+F_IFUNC 	
      00A4A2 1C C3 00                 5 	.ascii "DDR"
      00A4A5 1F 25                    6 	.word DDR_IDX 
      00283D                       6768 	_dict_entry,6,DATALN,DATALN_IDX;data_line  
      00A4A7 EF 37                    1 	.word LINK 
                           00283F     2 	LINK=.
      00A4A8                          3 DATALN:
      00A4A8 A6                       4 	.byte 6 	
      00A4A9 04 CD 83 78 90 AE        5 	.ascii "DATALN"
      00A4AF 03 E8                    6 	.word DATALN_IDX 
      002848                       6769 	_dict_entry,4,DATA,DATA_IDX;data  
      00A4B1 CD AD                    1 	.word LINK 
                           00284A     2 	LINK=.
      00284A                          3 DATA:
      00A4B3 B1                       4 	.byte 4 	
      00A4B4 CD A5 63 AE              5 	.ascii "DATA"
      00A4B8 A4 E8                    6 	.word DATA_IDX 
      002851                       6770 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00A4BA CD AA                    1 	.word LINK 
                           002853     2 	LINK=.
      002853                          3 CRL:
      00A4BC C0                       4 	.byte 3+F_IFUNC 	
      00A4BD 20 15 4C                 5 	.ascii "CRL"
      00A4BF 00 1E                    6 	.word CRL_IDX 
      002859                       6771 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00A4BF A6 18                    1 	.word LINK 
                           00285B     2 	LINK=.
      00285B                          3 CRH:
      00A4C1 CD                       4 	.byte 3+F_IFUNC 	
      00A4C2 83 78 90                 5 	.ascii "CRH"
      00A4C5 AE 03                    6 	.word CRH_IDX 
      002861                       6772 	_dict_entry,7,CONSOLE,CONS_IDX ; console_select
      00A4C7 E8 CD                    1 	.word LINK 
                           002863     2 	LINK=.
      002863                          3 CONSOLE:
      00A4C9 83                       4 	.byte 7 	
      00A4CA BA CD A5 63 AE A4 F4     5 	.ascii "CONSOLE"
      00A4D1 CD AA                    6 	.word CONS_IDX 
      00286D                       6773 	_dict_entry,4+F_IFUNC,COMC,COMC_IDX ; const_uarta
      00A4D3 C0 63                    1 	.word LINK 
                           00286F     2 	LINK=.
      00A4D4                          3 COMC:
      00A4D4 5B                       4 	.byte 4+F_IFUNC 	
      00A4D5 01 81 58 4D              5 	.ascii "COMC"
      00A4D9 4F 44                    6 	.word COMC_IDX 
      002876                       6774 	_dict_entry,4+F_IFUNC,COMA,COMA_IDX ; const_uartc 
      00A4DB 45 4D                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



                           002878     2 	LINK=.
      002878                          3 COMA:
      00A4DD 20                       4 	.byte 4+F_IFUNC 	
      00A4DE 74 72 61 6E              5 	.ascii "COMA"
      00A4E2 73 6D                    6 	.word COMA_IDX 
      00287F                       6775 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00A4E4 69 74                    1 	.word LINK 
                           002881     2 	LINK=.
      002881                          3 CHAR:
      00A4E6 20                       4 	.byte 4+F_CFUNC 	
      00A4E7 00 73 75 63              5 	.ascii "CHAR"
      00A4EB 63 65                    6 	.word CHAR_IDX 
      002888                       6776 	_dict_entry,3,BYE,BYE_IDX;bye 
      00A4ED 65 64                    1 	.word LINK 
                           00288A     2 	LINK=.
      00288A                          3 BYE:
      00A4EF 65                       4 	.byte 3 	
      00A4F0 64 2E 0A                 5 	.ascii "BYE"
      00A4F3 00 66                    6 	.word BYE_IDX 
      002890                       6777 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00A4F5 61 69                    1 	.word LINK 
                           002892     2 	LINK=.
      002892                          3 BTOGL:
      00A4F7 6C                       4 	.byte 5 	
      00A4F8 65 64 2E 0A 00           5 	.ascii "BTOGL"
      00A4FD 00 16                    6 	.word BTOGL_IDX 
      00289A                       6778 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00A4FD AE A5                    1 	.word LINK 
                           00289C     2 	LINK=.
      00289C                          3 BTEST:
      00A4FF 47                       4 	.byte 5+F_IFUNC 	
      00A500 CD AA C0 CD A5           5 	.ascii "BTEST"
      00A505 63 A6                    6 	.word BTEST_IDX 
      0028A4                       6779 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00A507 15 CD                    1 	.word LINK 
                           0028A6     2 	LINK=.
      0028A6                          3 BSET:
      00A509 83                       4 	.byte 4 	
      00A50A 78 CE 00 1D              5 	.ascii "BSET"
      00A50E 00 12                    6 	.word BSET_IDX 
      0028AD                       6780 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00A50E CD AE                    1 	.word LINK 
                           0028AF     2 	LINK=.
      0028AF                          3 BRES:
      00A510 00                       4 	.byte 4 	
      00A511 A1 06 27 F9              5 	.ascii "BRES"
      00A515 A1 04                    6 	.word BRES_IDX 
      0028B6                       6781 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00A517 27 0F                    1 	.word LINK 
                           0028B8     2 	LINK=.
      00A519                          3 BIT:
      00A519 A6                       4 	.byte 3+F_IFUNC 	
      00A51A 03 CD 83                 5 	.ascii "BIT"
      00A51D 78 CD                    6 	.word BIT_IDX 
      0028BE                       6782 	_dict_entry,3,AWU,AWU_IDX;awu 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00A51F A5 63                    1 	.word LINK 
                           0028C0     2 	LINK=.
      0028C0                          3 AWU:
      00A521 AE                       4 	.byte 3 	
      00A522 A4 F4 CD                 5 	.ascii "AWU"
      00A525 AA C0                    6 	.word AWU_IDX 
      0028C6                       6783 	_dict_entry,7,AUTORUN,AUTORUN_IDX;autorun
      00A527 81 C0                    1 	.word LINK 
                           0028C8     2 	LINK=.
      00A528                          3 AUTORUN:
      00A528 C3                       4 	.byte 7 	
      00A529 00 1D 27 0D 90 93 90     5 	.ascii "AUTORUN"
      00A530 FE 90                    6 	.word AUTORUN_IDX 
      0028D2                       6784 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00A532 A3 00                    1 	.word LINK 
                           0028D4     2 	LINK=.
      0028D4                          3 ASC:
      00A534 30                       4 	.byte 3+F_IFUNC 	
      00A535 27 03 5A                 5 	.ascii "ASC"
      00A538 20 EE                    6 	.word ASC_IDX 
      0028DA                       6785 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00A53A CF 00                    1 	.word LINK 
                           0028DC     2 	LINK=.
      0028DC                          3 AND:
      00A53C 1F                       4 	.byte 3+F_IFUNC 	
      00A53D CD A5 63                 5 	.ascii "AND"
      00A540 AE A4                    6 	.word AND_IDX 
      0028E2                       6786 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00A542 E8 CD                    1 	.word LINK 
                           0028E4     2 	LINK=.
      0028E4                          3 ADCREAD:
      00A544 AA                       4 	.byte 7+F_IFUNC 	
      00A545 C0 81 58 4D 4F 44 45     5 	.ascii "ADCREAD"
      00A54C 4D 20                    6 	.word ADCREAD_IDX 
      0028EE                       6787 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00A54E 72 65                    1 	.word LINK 
                           0028F0     2 	LINK=.
      0028F0                          3 ADCON:
      00A550 63                       4 	.byte 5 	
      00A551 65 69 76 65 20           5 	.ascii "ADCON"
      00A556 00 02                    6 	.word ADCON_IDX 
      00A557                       6788 kword_dict:
      0028F8                       6789 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00A557 A6 84                    1 	.word LINK 
                           0028FA     2 	LINK=.
      0028FA                          3 ABS:
      00A559 AE                       4 	.byte 3+F_IFUNC 	
      00A55A 00 00 81                 5 	.ascii "ABS"
      00A55D 00 00                    6 	.word ABS_IDX 
                                   6790 
                                   6791 ;comands and fonctions address table 	
      002900                       6792 code_addr:
      00A55D A6 84 AE 00 02 81 1F  6793 	.word abs,power_adc,analog_read,bit_and,ascii,autorun,awu,bitmask ; 0..7
             1E 1D B0 1E 42 1E BB
             21 6C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00A563 16 D7 16 C7 16 F8 16  6794 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             E8 1E 39 1D 9E 22 26
      00A563 A6 02 C0 00 30 CC A5  6795 	.word const_cr1,data,data_line,const_ddr,dec_base,directory,do_loop,digital_read,digital_write ;16..23 
             77 12 A7 1C E5 21 95
             19 A9 19 D9
      00A56B 18 E5 22 38 1F 98 17  6796 	.word cmd_end,const_eeprom_base,fcpu,for,forget,gosub,goto,gpio ; 24..31 
             53 1C 7E 18 4E 18 33
             1D EC
      00A56B CD 8A 58 A1 81 27 03  6797 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             CC 89 66 FD 9F 21 4C
             1D D7
      00A577 12 D8 13 03 1C 4E 21  6798 	.word let,list,load,log2,lshift,muldiv,next,new ; 40..47
             51 1F 66 10 11 17 D3
             1A 60
      00A577 A1 00 27 07 A1 02 27  6799 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             19 CC 89 66 C7 00 30
             72 1B
      00A587 52 45 72 5F 00 2E 72  6800 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             5F 00 2F A6 31 72 1A
             52 35
      00A597 81 C7 00 30 72 1B 52  6801 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             35 72 5F 00 2E 72 5F
             00 2F
      00A5A7 A6 41 72 1A 52 45 81  6802 	.word restore,return, random,rshift,run,save,show,size ; 72..79
             7F 18 8C 1B 51 12 61
             12 AC
      00A5AE 1E 9D 23 B2 23 1A 23  6803 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             BA 23 92 17 AC 1A 14
             1F 04
      00A5AE 00 00 20 FC 17 7C 18  6804 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             F5 12 B6 1E 16 21 AA
             1E 1C
      00A5B0 16 A2 20 87 1D 67 1F  6805 	.word wait,words,write,bit_xor,transmit,receive,const_coma,const_comc ; 96..103 
             4E 23 D7 24 7D 24 D7
             24 DD
      00A5B0 05 58 54 52           6806 	.word console_select,0 
                                   6807 
      002A00                       6808 	.bndry 128 ; align on FLASH block.
                                   6809 ; free space for user application  
      002A00                       6810 user_space:
                                   6811 ; USR() function test
      00A5B4 4D               [ 2] 6812 	pushw x 
      00A5B5 54 00 C8 A5      [ 1] 6813 	bset PC_ODR,#5 
      00A5B9 B0               [ 2] 6814 	popw x 
      00A5BA CD 1E B2         [ 4] 6815 	call pause02 
      00A5BA 04 58 52 43      [ 1] 6816 	bres PC_ODR,#5 
      00A5BE 56               [ 4] 6817 	ret
                                   6818 
                                   6819 	.area FLASH_DRIVE (ABS)
      010000                       6820 	.org 0x10000
      010000                       6821 fdrive:
                                   6822 ; .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0028FA R   |     ABS_IDX =  000000 
    ACC24   =  000007     |     ACK     =  000006     |   5 ADCON      0028F0 R
    ADCON_ID=  000002     |   5 ADCREAD    0028E4 R   |     ADCREAD_=  000004 
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
  5 AND        0028DC R   |     AND_IDX =  000006     |     AREG    =  000002 
    ARG_OFS =  000002     |   5 ASC        0028D4 R   |     ASC_IDX =  000008 
    ATTRIB  =  000002     |   5 AUTORUN    0028C8 R   |     AUTORUN_=  00000A 
    AUTORUN_=  004000     |   5 AWU        0028C0 R   |   5 AWUHandl   000001 R
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
    BELL    =  000007     |     BINARY  =  000001     |   5 BIT        0028B8 R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000E 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000B     |   5 BRES       0028AF R   |     BRES_IDX=  000010 
    BS      =  000008     |     BSAVE   =  000001     |   5 BSET       0028A6 R
    BSET_IDX=  000012     |     BSIZE   =  000001     |   5 BTEST      00289C R
    BTEST_ID=  000014     |   5 BTOGL      002892 R   |     BTOGL_ID=  000016 
    BTW     =  000001     |   5 BYE        00288A R   |     BYE_IDX =  000018 
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
    CFG_GCR_=  000000     |   5 CHAR       002881 R   |     CHAR_IDX=  00001A 
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
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
    CNTR    =  000003     |   5 COMA       002878 R   |     COMA_IDX=  0000CC 
  5 COMC       00286F R   |     COMC_IDX=  0000CE     |     COMMA   =  000001 
  5 CONSOLE    002863 R   |     CONS_IDX=  0000D0     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        00285B R   |     CRH_IDX =  00001C     |   5 CRL        002853 R
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
  5 DATA       00284A R   |   5 DATALN     00283F R   |     DATALN_I=  000022 
    DATA_IDX=  000020     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |     DBL     =  000003 
    DBLDIVDN=  000006     |     DBLHI   =  000001     |     DBLLO   =  000003 
    DBL_SIZE=  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   5 DDR        002837 R
    DDR_IDX =  000024     |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |     DEBUG_PR=  000001     |   5 DEC        00282F R
    DEC_IDX =  000026     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002827 R   |     DIR_IDX =  000028 
    DIVDNDHI=  00000B     |     DIVDNDLO=  00000D     |     DIVISOR =  000001 
    DIVISR  =  000007     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         002820 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  00002A 
  5 DREAD      002816 R   |     DREAD_ID=  00002C     |   5 DWRITE     00280B R
    DWRITE_I=  00002E     |   5 EEPROM     0027F8 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  000032     |     EEPROM_S=  000800 
    EM      =  000019     |   5 END        002803 R   |     END_IDX =  000030 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FAUTORUN=  000006     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       0027EF R   |     FCPU_IDX=  000034     |     FF      =  00000C 
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
  5 FOR        0027E7 R   |   5 FORGET     0027DC R   |     FORGET_I=  000038 
    FOR_IDX =  000036     |     FRUN    =  000000     |     FS      =  00001C 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      0027D2 R
    GOSUB_ID=  00003A     |   5 GOTO       0027C9 R   |     GOTO_IDX=  00003C 
  5 GPIO       0027C0 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_IDX=  00003E     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   5 HEX        0027B8 R   |     HEX_IDX =  000040 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   5 IDR        0027B0 R   |     IDR_IDX =  000042 
  5 IF         0027A9 R   |     IF_IDX  =  000044     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      00279F R
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
  5 INVERT     002794 R   |     INVERT_I=  000048     |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     002789 R
    IWDGEN_I=  00004A     |   5 IWDGREF    00277D R   |     IWDGREF_=  00004C 
    IWDG_KEY=  000055     |     IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        002775 R   |     KEY_IDX =  00004E     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   5 LET        00276D R
    LET_IDX =  000050     |     LF      =  00000A     |     LIMIT   =  000005 
    LINENO  =  000005     |   5 LINK    =  0028FA R   |   5 LIST       002764 R
    LIST_IDX=  000052     |     LL      =  000001     |     LLEN    =  000002 
    LN_PTR  =  000005     |   5 LOAD       00275B R   |     LOAD_IDX=  000054 
  5 LOG        002753 R   |     LOG_IDX =  000056     |   5 LSHIFT     002748 R
    LSHIFT_I=  000058     |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
  5 MULDIV     00273D R   |     MULDIV_I=  00005A     |     MULOP   =  000003 
    N1      =  000001     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        00272C R   |     NEW_FREE=  000001     |     NEW_IDX =  00005E 
  5 NEXT       002734 R   |     NEXT_IDX=  00005C     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        002724 R   |     NOT_IDX =  000060 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        00271C R   |     ODR_IDX =  000062 
    ONOFF   =  000003     |     OP      =  000003     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002715 R   |     OR_IDX  =  000064     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |   5 PAD        00270D R   |     PAD_IDX =  000066 
    PAD_SIZE=  000080     |   5 PAUSE      002703 R   |     PAUSE_ID=  000068 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       0026F0 R   |     PEEK_IDX=  00006C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       0026E7 R
    PINP_IDX=  00006E     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0026F9 R
    PMODE_ID=  00006A     |   5 POKE       0026DE R   |     POKE_IDX=  000070 
    PORT    =  000003     |   5 POUT       0026D5 R   |     POUT_IDX=  000072 
    PREV    =  000001     |   5 PRINT      0026CB R   |   5 PRTA       0026C2 R
    PRTA_IDX=  000076     |   5 PRTB       0026B9 R   |     PRTB_IDX=  000078 
  5 PRTC       0026B0 R   |     PRTC_IDX=  00007A     |   5 PRTD       0026A7 R
    PRTD_IDX=  00007C     |   5 PRTE       00269E R   |     PRTE_IDX=  00007E 
  5 PRTF       002695 R   |     PRTF_IDX=  000080     |   5 PRTG       00268C R
    PRTG_IDX=  000082     |   5 PRTH       002683 R   |     PRTH_IDX=  000084 
  5 PRTI       00267A R   |     PRTI_IDX=  000086     |     PRT_IDX =  000074 
    PSTR    =  000003     |   5 QKEY       002671 R   |     QKEY_IDX=  000088 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
    RBT_IDX =  00008C     |   5 READ       002668 R   |     READ_IDX=  00008A 
  5 REBOOT     00265D R   |     REG     =  000001     |     REGA    =  000001 
    REGX    =  000003     |     REGY    =  000005     |     RELOP   =  000003 
  5 REMARK     002652 R   |     REM_IDX =  00008E     |   5 RESTORE    002646 R
    REST_IDX=  000090     |     RETL1   =  000001     |   5 RETURN     00263B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

    RET_ADDR=  000003     |     RET_IDX =  000092     |     RET_INW =  000005 
  5 RND        002633 R   |     RND_IDX =  000094     |     ROP     =  004800 
    RS      =  00001E     |   5 RSHIFT     002628 R   |     RSHIFT_I=  000096 
    RST_SR  =  0050B3     |   5 RUN        002620 R   |     RUN_IDX =  000098 
    RX_QUEUE=  000008     |   5 SAVE       002617 R   |     SAVEB   =  000002 
    SAVE_IDX=  00009A     |     SDIVSR  =  000005     |     SERIAL  =  000001 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       00260E R   |     SHOW_IDX=  00009C     |     SI      =  00000F 
    SIGN    =  000001     |   5 SIZE       002605 R   |     SIZE_IDX=  00009E 
    SKIP    =  000005     |   5 SLEEP      0025FB R   |     SLEEP_ID=  0000A0 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  5 SPIEN      0025E7 R   |     SPIEN_ID=  0000A4     |   5 SPIRD      0025F1 R
    SPIRD_ID=  0000A2     |   5 SPISEL     0025DC R   |     SPISEL_I=  0000A6 
  5 SPIWR      0025D2 R   |     SPIWR_ID=  0000A8     |     SPI_CR1 =  005200 
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
    STACK_EM=  0017FF     |     STACK_SI=  0000A0     |   5 STEP       0025C9 R
    STEP_IDX=  0000AA     |   5 STOP       0025C0 R   |     STOP_IDX=  0000AC 
    STR     =  000003     |     STX     =  000002     |     SUB     =  00001A 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     TAB     =  000009 
    TABW    =  000004     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      0025B6 R   |     TICKS_ID=  0000AE     |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]

Symbol Table

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
  5 TIMEOUT    0025A0 R   |   5 TIMER      0025AC R   |     TIMER_ID=  0000B0 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]

Symbol Table

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
    TMROUT_I=  0000B2     |   5 TO         002599 R   |   5 TONE       002590 R
    TONE_IDX=  0000B6     |     TO_IDX  =  0000B4     |   5 Timer4Up   000048 R
    U1      =  000001     |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART2   =  000001     |     UART3   =  000002     |     UART3_BA=  005240 
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
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     002585 R
    UBOUND_I=  0000B8     |   5 UBTN_Han   00008F R   |   5 UFLASH     00257A R
    UFLASH_I=  0000BA     |   5 UNTIL      002570 R   |     UNTIL_ID=  0000BC 
    US      =  00001F     |   5 USER_ABO   000097 R   |   5 USR        002568 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000BE     |   5 UartRxHa   00000F R   |   5 UserButt   00005D R
    VAR_ADDR=  000006     |     VAR_SIZE=  000001     |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       00255F R
    WAIT_IDX=  0000C0     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]

Symbol Table

    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002555 R   |     WORDS_ID=  0000C2     |   5 WRITE      00254B R
    WRITE_ID=  0000C4     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   5 XOR        002543 R   |     XOR_IDX =  0000C6 
  5 XRCV       00253A R   |     XRCV_IDX=  0000CA     |     XREG    =  000003 
    XSAVE   =  000005     |   5 XTRMT      002530 R   |     XTRMT_ID=  0000C8 
    YSAVE   =  000007     |   5 abs        001F0A R   |   1 acc16      00000C GR
  1 acc24      00000B GR  |   1 acc8       00000D GR  |   5 add_char   00156A R
  5 add_spac   001394 R   |   5 analog_r   001975 R   |   5 arduino_   002000 R
  5 arg_list   0010BE R   |   1 array_si   000021 R   |   5 ascii      001DB0 R
  5 at_tst     000D22 R   |   5 atoi24     000E33 GR  |   5 atoi_exi   000E99 R
  5 autorun    001E42 R   |   5 autorun_   00073B R   |   5 awu        001EBB R
  5 awu02      001EC5 R   |   5 bad_port   001E11 R   |   1 base       00000A R
  1 basicptr   000004 GR  |   5 beep       001902 R   |   5 beep_1kh   0018EC GR
  5 bin_exit   000C00 R   |   5 bit_and    001F1E R   |   5 bit_or     001F36 R
  5 bit_rese   0016D7 R   |   5 bit_set    0016C7 R   |   5 bit_test   0016F8 R
  5 bit_togg   0016E8 R   |   5 bit_xor    001F4E R   |   5 bitmask    00216C R
  5 bkslsh_t   000CCF R   |   5 block_er   0001B8 R   |   5 break_po   001A42 R
  5 bye        001E39 R   |   5 cancel_a   000703 R   |   5 char       001D9E R
  5 clear_ba   000750 R   |   5 clear_va   0005C7 R   |   5 clock_in   0000B2 R
  5 cmd_end    0018E5 R   |   5 cmd_line   000970 R   |   5 cmd_name   00102D R
  5 cmp_name   001AE3 R   |   5 code_add   002900 R   |   5 cold_sta   00063E R
  5 colon_ts   000CF6 R   |   1 comm       00002F R   |   5 comma_ts   000D01 R
  5 comp_msg   0008C5 R   |   5 compile    000554 R   |   5 con_sel    0024F7 GR
  5 console_   0024EB R   |   5 console_   0024E3 R   |   5 const_co   0024D7 R
  5 const_co   0024DD R   |   5 const_cr   002220 R   |   5 const_cr   002226 R
  5 const_dd   00221A R   |   5 const_ee   002238 R   |   5 const_id   002214 R
  5 const_in   002232 R   |   5 const_od   00220E R   |   5 const_ou   00222C R
  5 const_po   0021D8 R   |   5 const_po   0021DE R   |   5 const_po   0021E4 R
  5 const_po   0021EA R   |   5 const_po   0021F0 R   |   5 const_po   0021F6 R
  5 const_po   0021FC R   |   5 const_po   002202 R   |   5 const_po   002208 R
  5 convert_   000B77 R   |   5 copy_com   000D57 R   |   1 count      000003 GR
  5 cp_loop    00106D R   |   5 cpy_cmd_   00137F R   |   5 cpy_quot   0013B8 R
  5 create_g   0004B7 R   |   5 cs_high    0023CC R   |   5 cstk_pro   00127B R
  5 dash_tst   000D17 R   |   5 data       00223E R   |   1 data_len   000009 R
  5 data_lin   002244 R   |   1 data_ofs   000008 R   |   1 data_ptr   000006 R
  5 data_sea   002284 R   |   5 dbl_sign   000F95 R   |   5 dec_base   0012A7 R
  5 decomp_l   001469 R   |   5 decompil   001422 GR  |   5 del_line   00048A R
  5 digital_   0019A9 R   |   5 digital_   0019D9 R   |   5 dir_loop   001CF1 R
  5 director   001CE5 R   |   5 disk_fre   001AD0 R   |   5 div32_16   000F9F R
  5 divide     000FF6 R   |   5 divu24_8   000ABA R   |   5 dneg       000F8A R
  5 do_loop    002195 R   |   5 do_progr   0001AB R   |   5 drain      00033A GR
  5 drive_fr   001D5A R   |   5 enable_i   002116 R   |   5 eql_tst    000DAC R
  5 equal      00157D R   |   5 erase_fl   0001D7 R   |   5 err_bad_   000830 R
  5 err_buf_   0008A6 R   |   5 err_cmd_   0007F4 R   |   5 err_div0   0007B9 R
  5 err_dupl   00080E R   |   5 err_math   0007A0 R   |   5 err_mem_   000785 R
  5 err_msg    000765 R   |   5 err_no_a   00083C R   |   5 err_no_d   00086F R
  5 err_no_f   000893 R   |   5 err_no_l   0007C8 R   |   5 err_no_p   00087F R
  5 err_not_   00081F R   |   5 err_run_   0007DE R   |   5 err_synt   000792 R
  5 escaped    000B8C R   |   5 expect     0010AC R   |   5 expr_exi   001206 R
  5 expressi   0011BD R   |   5 factor     00110E R   |   1 farptr     000016 R
  5 fcpu       001F98 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001D52 R   |   5 first_li   00132C R   |   1 flags      000023 R
  5 for        001753 R   |   5 forget     001C7E R   |   1 free_ram   000064 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]

Symbol Table

  5 func_arg   0010B9 R   |   5 func_not   002109 R   |   5 ge         00157F R
  5 get_arra   0010E9 R   |   5 get_cmd_   001401 R   |   5 get_targ   00181D R
  5 get_tick   001F04 R   |   5 get_toke   000C68 R   |   5 getc       00031B GR
    getc_to    ****** GX  |   5 gosub      00184E R   |   5 goto       001833 R
  5 gpio       001DEC R   |   5 gt         00157B R   |   5 gt_tst     000DB7 R
  5 hex_base   0012A2 R   |   5 hex_dump   0003BD R   |   5 if         00173F R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001A90 R   |   5 input_ex   001699 R   |   5 input_lo   001632 R
  5 input_va   001630 R   |   5 insert_l   0004E3 R   |   5 insert_l   000551 R
  5 interp_l   0009B1 R   |   5 interpre   00098C R   |   5 invert     002186 R
  5 is_alnum   0005EF R   |   5 is_alpha   0005D5 R   |   5 is_digit   0005E6 R
  5 itoa       000A55 R   |   5 itoa_loo   000A74 R   |   5 jp_to_ta   001841 R
  5 key        001DD7 R   |   5 kw_loop    000C1C R   |   5 kword_di   0028F8 R
  5 kword_en   00252E R   |   5 le         001584 R   |   5 leading_   00215C R
  5 let        0012D8 R   |   5 let_arra   0012E6 R   |   5 let_var    0012E9 R
  5 lines_sk   00132F R   |   5 list       001303 R   |   5 list_exi   001371 R
  5 list_loo   00134F R   |   5 load       001C4E R   |   5 load_aut   000712 R
  5 load_fil   001C1D R   |   5 log2       002151 R   |   5 logical_   0020FF R
  5 long_div   000F72 R   |   5 loop_bac   001800 R   |   1 loop_dep   000020 R
  5 loop_don   001815 R   |   5 lshift     001F66 R   |   5 lt         001582 R
  5 lt_tst     000DE0 R   |   5 modulo     00100C R   |   5 move       000424 GR
  5 move_dow   000442 R   |   5 move_era   00013D R   |   5 move_exi   000463 R
  5 move_loo   000447 R   |   5 move_prg   000171 R   |   5 move_up    000434 R
  5 mul_char   00156C R   |   5 muldiv     001011 R   |   5 multiply   000F3D R
  5 mulu24_8   000AE2 R   |   5 nbr_tst    000C9B R   |   5 ne         001587 R
  5 neg_acc2   000B1C R   |   5 new        001A60 R   |   5 next       0017D3 R
  5 next_lin   000994 R   |   5 next_tok   0009D8 R   |   5 no_match   00107F R
  5 other      000E09 R   |   3 pad        0016E0 R   |   5 pad_ref    0023D1 R
  5 parse_bi   000BDE R   |   5 parse_in   000B94 R   |   5 parse_ke   000C1B R
  5 parse_qu   000B3F R   |   5 pause      001EA8 R   |   5 pause02    001EB2 R
  5 peek       00172E R   |   5 pin_mode   001FA4 R   |   5 plus_tst   000D80 R
  5 poke       00171F R   |   5 power_ad   001939 R   |   5 prcnt_ts   000DA1 R
  5 print      0015AA R   |   5 print_ex   001604 R   |   5 print_in   000A39 R
  5 printxy    000EB0 R   |   5 program_   000151 R   |   5 program_   000171 R
  5 prt_basi   00158A R   |   5 prt_loop   0015AE R   |   5 prt_tok    00034F R
  5 prti24     000A49 R   |   1 ptr16      000017 R   |   1 ptr8       000018 R
  5 putc       0002F8 GR  |   5 putc1      000300 R   |   5 putc3      00030A R
    puts       ****** GX  |   5 qgetc      000314 GR  |   5 qkey       001DDF GR
  5 qmark_ts   000D2D R   |   5 random     002020 R   |   5 read       0022C0 R
  5 read01     0022C2 R   |     readln     ****** GX  |   5 receive    00247D R
  5 refresh_   00214C R   |   5 rel_exit   00125E R   |   5 relation   001209 R
  5 relop_st   00156F R   |   5 remark     00169C R   |   5 reset_co   0015AC R
  5 rest_con   001620 R   |   5 restore    002271 R   |   5 return     00186E R
  5 right_al   0013A6 R   |   5 row_alig   001A75 R   |   5 row_eras   000116 R
  5 row_eras   00013D R   |   5 row_loop   0003A0 R   |   5 rparnt_t   000CEB R
  5 rshift     001F7F R   |   5 rt_msg     0008B3 R   |   5 run        00188C R
  5 run_it     0018BE R   |   5 rx_faile   002499 R   |   1 rx_head    00002D R
  5 rx_loop    00248E R   |   1 rx_queue   000025 R   |   5 rx_succe   0024A8 R
  1 rx_tail    00002E R   |   5 save       001B51 R   |   5 save_con   001610 R
  5 search_d   00105F R   |   5 search_e   0010A9 R   |   5 search_f   001B04 R
  5 search_l   000466 GR  |   5 search_l   00046E R   |   5 search_n   001063 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   001A9E R
  5 select_p   001FF0 R   |   5 set_time   0020ED R   |   5 sharp_ts   000D0C R
  5 show       001261 R   |   5 show_row   00038E R   |   5 single_c   001565 R
  5 size       0012AC R   |   5 skip       000E9D R   |   5 slash_ts   000D96 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]

Symbol Table

  5 sleep      001E9D R   |   5 software   0005F8 R   |     spaces     ****** GX
  5 spi_clea   002365 R   |   5 spi_disa   00234D R   |   5 spi_enab   00231A R
  5 spi_rcv_   002387 R   |   5 spi_read   0023B2 R   |   5 spi_sele   0023BA R
  5 spi_send   002371 R   |   5 spi_writ   002392 R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000D8B R   |   5 step       0017AC R
  5 stop       001A14 R   |   5 store_lo   0017C0 R   |   5 str_matc   00108C R
  5 str_tst    000C8B R   |   5 strcmp     000405 R   |   5 strcpy     000416 R
  5 strlen     0003FA GR  |   5 syntax_e   0008E6 R   |   1 tab_widt   000024 R
  5 tb_error   0008E8 R   |   5 term       00116B R   |   5 term01     001173 R
  5 term_exi   0011BA R   |   3 tib        001690 GR  |   5 tick_tst   000D45 R
  1 ticks      00000E R   |   5 timeout    0020FC R   |   1 timer      000010 GR
  5 timer2_i   0000C8 R   |   5 timer4_i   0000D5 R   |   5 tk_id      0008D6 R
  5 to         00177C R   |   5 to_eepro   000194 R   |   5 to_flash   0001A8 R
  5 to_upper   000E27 GR  |   5 token_ch   000E20 R   |   5 token_ex   000E24 R
  5 token_ms   000386 R   |   5 tone       0018F5 R   |   5 transmit   0023D7 R
  5 try_next   0022B0 R   |   5 tx_exit    002454 R   |   5 tx_faile   00243F R
  5 tx_loop    002417 R   |   5 tx_succe   002428 R   |   1 txtbgn     00001C R
  1 txtend     00001E R   |   5 uart1_in   0002B5 R   |   5 uart1_se   0002C5 R
  5 uart3_in   00027A R   |   5 uart3_se   00028A R   |   5 ubound     0012B6 R
  5 udiv32_1   000F60 R   |   5 uflash     001E16 R   |   5 umstar     000F03 R
  5 unlock_e   0000EA R   |   5 unlock_f   000100 R   |   5 until      0021AA R
  5 user_int   000070 R   |   5 user_spa   002A00 R   |   5 usr        001E1C R
  5 var_name   0013F9 R   |   1 vars       000030 R   |   5 wait       0016A2 R
  5 warm_ini   0006E5 R   |   5 warm_sta   00096D R   |   5 words      002087 R
  5 words_co   0020D7 R   |   5 write      001D67 R   |   5 write_bl   000257 R
  5 write_by   0001E2 R   |   5 write_ee   00021E R   |   5 write_ex   000252 R
  5 write_fl   000208 R   |   5 write_ro   000185 R   |   5 x_fail     002474 R
  5 x_succes   002468 R   |     xrcv_blo   ****** GX  |   5 xrcv_msg   0024C7 R
    xtrmt_bl   ****** GX  |   5 xtrmt_ms   002457 R   |   5 zero_pad   001A6A R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     64   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    170   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   2A0E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

