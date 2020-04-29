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
                                     26     .module TBI_STM8
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
                                        	.include "pab_macros.inc" 
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
                                     38 	
                                     39 ;--------------------------------------
                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
                           000050    43 	TIB_SIZE=80
                           000028    44     PAD_SIZE=40
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                           0000A0    45 	STACK_SIZE=160
                           0017FF    46 	STACK_EMPTY=RAM_SIZE-1  
                           000000    47 	FRUN=0 ; flags run code in variable flags
                           000001    48 	FTRAP=1 ; inside trap handler 
                           000002    49 	FLOOP=2 ; FOR loop in preparation 
                           000003    50 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    51 	FBREAK=4 ; break point flag 
                           000005    52 	FCOMP=5  ; compiling flags 
                                     53 
                           004000    54 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     55 
                           000006    56     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     57 
                           007FFF    58 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     59 
      000001                         60 in.w:  .blkb 1 ; parser position in text line
      000002                         61 in:    .blkb 1 ; low byte of in.w
      000003                         62 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         63 count: .blkb 1 ; current BASIC line length and tib text length  
      000005                         64 basicptr:  .blkb 2  ; point to current BASIC line address.
      000007                         65 data_ptr:  .blkw 1  ; point to DATA address
      000009                         66 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         67 data_len:  .blkb 1  ; length of data line 
      00000B                         68 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         69 acc24: .blkb 1 ; 24 bit accumulator
      00000D                         70 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000E                         71 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      00000F                         72 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         73 timer: .blkw 1 ;  milliseconds count down timer 
      000013                         74 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         75 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         76 farptr: .blkb 1 ; 24 bits pointer used by file system
      000018                         77 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000019                         78 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      00001A                         79 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         80 dstkptr: .blkw 1  ; data stack pointer 
      00001F                         81 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      000021                         82 txtend: .blkw 1 ; tokenized BASIC text end address 
      000023                         83 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000024                         84 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000026                         85 flags: .blkb 1 ; various boolean flags
      000027                         86 tab_width: .blkb 1 ; print colon width (4)
      000028                         87 rx_char: .blkb 1 ; last received character 
      000029                         88 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     89 ; keep as last variable 
      00005D                         90 free_ram: ; from here RAM free for BASIC text 
                                     91 
                                     92 ;-----------------------------------
                                     93     .area SSEG (ABS)
                                     94 ;-----------------------------------
                                     95 ;;;; working buffers and stacks at end of RAM. 	
      0016E8                         96     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE 
      0016E8                         97 tib: .ds TIB_SIZE             ; transaction input buffer
      001738                         98 pad: .ds PAD_SIZE             ; working buffer
      001760                         99 stack_full: .ds STACK_SIZE   ; control stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      001800                        100 stack_unf: ; stack underflow ; control_stack bottom 
                                    101 
                                    102 ;--------------------------------------
                                    103     .area HOME 
                                    104 ;--------------------------------------
      008000 82 00 85 54            105     int cold_start			; RESET vector 
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
      008024 82 00 80 BC            118 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008064 82 00 80 A6            134 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



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
      00809B 72 5F 00 28      [ 1]  178 	clr rx_char 
      00809F CC 80 CF         [ 2]  179 	jp user_interrupted
      0080A2                        180 1$:
      0080A2 C7 00 28         [ 1]  181 	ld rx_char,a 	
      0080A5 80               [11]  182 	iret 
                                    183 
                                    184 ;------------------------------------
                                    185 ; software interrupt handler  
                                    186 ;------------------------------------
                           000000   187 .if DEBUG 
                                    188 TrapHandler:
                                    189 	bset flags,#FTRAP 
                                    190 	call print_registers
                                    191 	call cmd_itf
                                    192 	bres flags,#FTRAP 	
                                    193 	iret
                                    194 .endif 
                                    195 
                                    196 ;------------------------------
                                    197 ; TIMER 4 is used to maintain 
                                    198 ; a milliseconds 'ticks' counter
                                    199 ; and decrement 'timer' varaiable
                                    200 ;--------------------------------
      0080A6                        201 Timer4UpdateHandler:
      0080A6 72 5F 53 42      [ 1]  202 	clr TIM4_SR 
      0080AA CE 00 0F         [ 2]  203 	ldw x,ticks
      0080AD 5C               [ 2]  204 	incw x
      0080AE CF 00 0F         [ 2]  205 	ldw ticks,x 
      0080B1 CE 00 11         [ 2]  206 	ldw x,timer
      0080B4 5D               [ 2]  207 	tnzw x 
      0080B5 27 04            [ 1]  208 	jreq 1$
      0080B7 5A               [ 2]  209 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080B8 CF 00 11         [ 2]  210 	ldw timer,x 
      0080BB                        211 1$:	
      0080BB 80               [11]  212 	iret 
                                    213 
                                    214 
                                    215 ;------------------------------------
                                    216 ; Triggered by pressing USER UserButton 
                                    217 ; on NUCLEO card.
                                    218 ; This is used to abort a progam lock 
                                    219 ; in infinite loop. 
                                    220 ;------------------------------------
      0080BC                        221 UserButtonHandler:
                                    222 ; wait button release
      0080BC 5F               [ 1]  223 	clrw x
      0080BD 5A               [ 2]  224 1$: decw x 
      0080BE 26 FD            [ 1]  225 	jrne 1$
      0080C0 72 09 50 15 F8   [ 2]  226 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    227 ; if MCU suspended by SLEEP resume program
      0080C5 72 07 00 26 05   [ 2]  228     btjf flags,#FSLEEP,2$
      0080CA 72 17 00 26      [ 1]  229 	bres flags,#FSLEEP 
      0080CE 80               [11]  230 	iret
      0080CF                        231 2$:	
      0080CF                        232 user_interrupted:
      0080CF 72 00 00 26 02   [ 2]  233     btjt flags,#FRUN,4$
      0080D4 20 13            [ 2]  234 	jra UBTN_Handler_exit 
      0080D6                        235 4$:	; program interrupted by user 
      0080D6 72 11 00 26      [ 1]  236 	bres flags,#FRUN 
      0080DA AE 80 F1         [ 2]  237 	ldw x,#USER_ABORT
      0080DD CD 82 46         [ 4]  238 	call puts 
      0080E0 CE 00 05         [ 2]  239 	ldw x,basicptr 
      0080E3 C6 00 02         [ 1]  240 	ld a,in 
      0080E6 CD 92 71         [ 4]  241 	call prt_basic_line
      0080E9                        242 UBTN_Handler_exit:
      0080E9 AE 17 FF         [ 2]  243     ldw x,#STACK_EMPTY 
      0080EC 94               [ 1]  244     ldw sp,x
      0080ED 9A               [ 1]  245 	rim 
      0080EE CC 87 C4         [ 2]  246 	jp warm_start
                                    247 
      0080F1 0A 50 72 6F 67 72 61   248 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    249 
                                    250 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    251 ;    peripherals initialization
                                    252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    253 
                                    254 ;----------------------------------------
                                    255 ; inialize MCU clock 
                                    256 ; input:
                                    257 ;   A 		source  HSI | 1 HSE 
                                    258 ;   XL      CLK_CKDIVR , clock divisor 
                                    259 ; output:
                                    260 ;   none 
                                    261 ;----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00810C                        262 clock_init:	
      00810C C1 50 C3         [ 1]  263 	cp a,CLK_CMSR 
      00810F 27 0C            [ 1]  264 	jreq 2$ ; no switching required 
                                    265 ; select clock source 
      008111 72 12 50 C5      [ 1]  266 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008115 C7 50 C4         [ 1]  267 	ld CLK_SWR,a
      008118 C1 50 C3         [ 1]  268 1$:	cp a,CLK_CMSR
      00811B 26 FB            [ 1]  269 	jrne 1$
      00811D                        270 2$: 	
                                    271 ; HSI and cpu clock divisor 
      00811D 9F               [ 1]  272 	ld a,xl 
      00811E C7 50 C6         [ 1]  273 	ld CLK_CKDIVR,a  
      008121 81               [ 4]  274 	ret
                                    275 
                                    276 ;----------------------------------
                                    277 ; TIMER2 used as audio tone output 
                                    278 ; on port D:5.
                                    279 ; channel 1 configured as PWM mode 1 
                                    280 ;-----------------------------------  
                           00F424   281 TIM2_CLK_FREQ=62500
      008122                        282 timer2_init:
      008122 72 1A 50 C7      [ 1]  283 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008126 35 60 53 05      [ 1]  284  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00812A 35 08 53 0C      [ 1]  285 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00812E 81               [ 4]  286 	ret 
                                    287 
                                    288 ;---------------------------------
                                    289 ; TIM4 is configured to generate an 
                                    290 ; interrupt every millisecond 
                                    291 ;----------------------------------
      00812F                        292 timer4_init:
      00812F 72 18 50 C7      [ 1]  293 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008133 35 07 53 45      [ 1]  294 	mov TIM4_PSCR,#7 ; prescale 128  
      008137 35 7D 53 46      [ 1]  295 	mov TIM4_ARR,#125 ; set for 1msec.
      00813B 35 05 53 40      [ 1]  296 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813F 72 10 53 41      [ 1]  297 	bset TIM4_IER,#TIM4_IER_UIE
      008143 81               [ 4]  298 	ret
                                    299 
                                    300 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    301 ;  routines to write to FLASH, EEPROM 
                                    302 ;  and OPTION 
                                    303 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    304 
                                    305 ;----------------------------------
                                    306 ; unlock EEPROM/OPT for writing/erasing
                                    307 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    308 ; input:
                                    309 ;  none
                                    310 ; output:
                                    311 ;  none 
                                    312 ;----------------------------------
      008144                        313 unlock_eeprom:
      008144 35 AE 50 64      [ 1]  314 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008148 35 56 50 64      [ 1]  315     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814C 72 07 50 5F FB   [ 2]  316 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      008151 81               [ 4]  317 	ret
                                    318 
                                    319 ;----------------------------------
                                    320 ; unlock FLASH for writing/erasing
                                    321 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    322 ; input:
                                    323 ;  none
                                    324 ; output:
                                    325 ;  none
                                    326 ;----------------------------------
      008152                        327 unlock_flash:
      008152 35 56 50 62      [ 1]  328 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008156 35 AE 50 62      [ 1]  329 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815A 72 03 50 5F FB   [ 2]  330 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815F 81               [ 4]  331 	ret
                                    332 
                           000000   333 USE_BLOCK_ERASE=0 
                           000000   334 .if USE_BLOCK_ERASE 
                                    335 ; this code is copied to RAM 
                                    336 
                                    337 ;----------------------------
                                    338 ; erase block code must be 
                                    339 ; executed from RAM
                                    340 ;-----------------------------
                                    341 erase_start:
                                    342 	clr a 
                                    343     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    344     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    345 	ldf [farptr],a
                                    346     inc farptr+2 
                                    347     ldf [farptr],a
                                    348     inc farptr+2 
                                    349     ldf [farptr],a
                                    350     inc farptr+2 
                                    351     ldf [farptr],a
                                    352 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    353 	ret
                                    354 erase_end:
                                    355 
                                    356 ; copy erase_start in RAM 
                                    357 move_code_in_ram:
                                    358 	ldw x,#erase_end 
                                    359 	subw x,#erase_start
                                    360 	ldw acc16,x 
                                    361 	ldw x,#pad 
                                    362 	ldw y,#erase_start 
                                    363 	call move 
                                    364 	ret 
                                    365 
                                    366 ;-----------------------------------
                                    367 ; erase flash or EEPROM block 
                                    368 ; a block is 128 bytes 
                                    369 ; input:
                                    370 ;   farptr  address block begin
                                    371 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    372 ;   none
                                    373 ;--------------------------------------
                                    374 erase_block:
                                    375 	ldw x,farptr+1 
                                    376 	pushw x 
                                    377 	call move_code_in_ram 
                                    378 	popw x 
                                    379 	ldw farptr+1,x 
                                    380 	tnz farptr
                                    381 	jrne erase_flash 
                                    382 	ldw x,#FLASH_BASE 
                                    383 	cpw x,farptr+1 
                                    384 	jrpl erase_flash 
                                    385 ; erase eeprom block
                                    386 	call unlock_eeprom 
                                    387 	sim 
                                    388 	call pad   
                                    389 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    390 	rim 
                                    391 	ret 
                                    392 ; erase flash block:
                                    393 erase_flash:
                                    394 	call unlock_flash 
                                    395 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    396 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    397 	clr a 
                                    398 	sim 
                                    399 	call pad 
                                    400     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    401 	rim 
                                    402 	ret 
                                    403 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    404 
                                    405 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    406 ; write a byte to FLASH or EEPROM/OPTION  
                                    407 ; input:
                                    408 ;    a  		byte to write
                                    409 ;    farptr  	address
                                    410 ;    x          farptr[x]
                                    411 ; output:
                                    412 ;    none
                                    413 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    414 	; variables locales
                           000001   415 	BTW = 1   ; byte to write offset on stack
                           000002   416 	OPT = 2   ; OPTION flag offset on stack
                           000002   417 	VSIZE = 2
      008160                        418 write_byte:
      008160 90 89            [ 2]  419 	pushw y
      0000E2                        420 	_vars VSIZE
      008162 52 02            [ 2]    1     sub sp,#VSIZE 
      008164 6B 01            [ 1]  421 	ld (BTW,sp),a ; byte to write 
      008166 0F 02            [ 1]  422 	clr (OPT,sp)  ; OPTION flag
                                    423 ; put addr[15:0] in Y, for bounds check.
      008168 90 CE 00 18      [ 2]  424 	ldw y,farptr+1   ; Y=addr15:0
                                    425 ; check addr[23:16], if <> 0 then it is extened flash memory
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00816C 72 5D 00 17      [ 1]  426 	tnz farptr 
      008170 26 14            [ 1]  427 	jrne write_flash
      008172 90 A3 A5 80      [ 2]  428     cpw y,#user_space
      008176 24 0E            [ 1]  429     jruge write_flash
      008178 90 A3 40 00      [ 2]  430 	cpw y,#EEPROM_BASE  
      00817C 25 52            [ 1]  431     jrult write_exit
      00817E 90 A3 48 7F      [ 2]  432 	cpw y,#OPTION_END 
      008182 22 4C            [ 1]  433 	jrugt write_exit
      008184 20 16            [ 2]  434 	jra write_eeprom 
                                    435 ; write program memory
      008186                        436 write_flash:
      008186 CD 81 52         [ 4]  437 	call unlock_flash 
      008189 9B               [ 1]  438 1$:	sim 
      00818A 7B 01            [ 1]  439 	ld a,(BTW,sp)
      00818C 92 A7 00 17      [ 4]  440 	ldf ([farptr],x),a ; farptr[x]=A
      008190 72 05 50 5F FB   [ 2]  441 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008195 9A               [ 1]  442     rim 
      008196 72 13 50 5F      [ 1]  443     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00819A 20 34            [ 2]  444     jra write_exit
                                    445 ; write eeprom and option
      00819C                        446 write_eeprom:
      00819C CD 81 44         [ 4]  447 	call unlock_eeprom
                                    448 	; check for data eeprom or option eeprom
      00819F 90 A3 48 00      [ 2]  449 	cpw y,#OPTION_BASE
      0081A3 2B 08            [ 1]  450 	jrmi 1$
      0081A5 90 A3 48 80      [ 2]  451 	cpw y,#OPTION_END+1
      0081A9 2A 02            [ 1]  452 	jrpl 1$
      0081AB 03 02            [ 1]  453 	cpl (OPT,sp)
      0081AD                        454 1$: 
      0081AD 0D 02            [ 1]  455     tnz (OPT,sp)
      0081AF 27 08            [ 1]  456     jreq 2$
                                    457 	; pour modifier une option il faut modifier ces 2 bits
      0081B1 72 1E 50 5B      [ 1]  458     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B5 72 1F 50 5C      [ 1]  459     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B9                        460 2$: 
      0081B9 7B 01            [ 1]  461     ld a,(BTW,sp)
      0081BB 92 A7 00 17      [ 4]  462     ldf ([farptr],x),a
      0081BF 0D 02            [ 1]  463     tnz (OPT,sp)
      0081C1 27 08            [ 1]  464     jreq 3$
      0081C3 5C               [ 2]  465     incw x
      0081C4 7B 01            [ 1]  466     ld a,(BTW,sp)
      0081C6 43               [ 1]  467     cpl a
      0081C7 92 A7 00 17      [ 4]  468     ldf ([farptr],x),a
      0081CB 72 05 50 5F FB   [ 2]  469 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081D0                        470 write_exit:
      000150                        471 	_drop VSIZE 
      0081D0 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081D2 90 85            [ 2]  472 	popw y
      0081D4 81               [ 4]  473     ret
                                    474 
                                    475 ;--------------------------------------------
                                    476 ; write a data block to eeprom or flash 
                                    477 ; input:
                                    478 ;   Y        source address   
                                    479 ;   X        array index  destination  farptr[x]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    480 ;   BSIZE    block size bytes 
                                    481 ;   farptr   write address , byte* 
                                    482 ; output:
                                    483 ;	X 		after last byte written 
                                    484 ;   Y 		after last byte read 
                                    485 ;  farptr   point after block
                                    486 ;---------------------------------------------
      0081D5                        487 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000155                        488 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    489 	; local var 
                           000001   490 	XSAVE=1 
                           000002   491 	VSIZE=2 
      000155                        492 write_block:
      000155                        493 	_vars VSIZE
      0081D5 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D7 1F 01            [ 2]  494 	ldw (XSAVE,sp),x 
      0081D9 1E 05            [ 2]  495 	ldw x,(BSIZE,sp) 
      0081DB 27 13            [ 1]  496 	jreq 9$
      0081DD 1E 01            [ 2]  497 1$:	ldw x,(XSAVE,sp)
      0081DF 90 F6            [ 1]  498 	ld a,(y)
      0081E1 CD 81 60         [ 4]  499 	call write_byte 
      0081E4 5C               [ 2]  500 	incw x 
      0081E5 90 5C            [ 2]  501 	incw y 
      0081E7 1F 01            [ 2]  502 	ldw (XSAVE,sp),x
      0081E9 1E 05            [ 2]  503 	ldw x,(BSIZE,sp)
      0081EB 5A               [ 2]  504 	decw x
      0081EC 1F 05            [ 2]  505 	ldw (BSIZE,sp),x 
      0081EE 26 ED            [ 1]  506 	jrne 1$
      0081F0                        507 9$:
      0081F0 1E 01            [ 2]  508 	ldw x,(XSAVE,sp)
      0081F2 CD 98 AB         [ 4]  509 	call incr_farptr
      000175                        510 	_drop VSIZE
      0081F5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F7 81               [ 4]  511 	ret 
                                    512 
                                    513 
                                    514 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    515 ;;   UART1 subroutines
                                    516 ;;   used for user interface 
                                    517 ;;   communication channel.
                                    518 ;;   settings: 
                                    519 ;;		115200 8N1 no flow control
                                    520 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    521 
                                    522 ;---------------------------------------------
                                    523 ; initialize UART1, 115200 8N1
                                    524 ; input:
                                    525 ;	none
                                    526 ; output:
                                    527 ;   none
                                    528 ;---------------------------------------------
      0081F8                        529 uart1_init:
      0081F8 72 1A 50 02      [ 1]  530     bset PA_DDR,#UART1_TX_PIN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0081FC 72 1A 50 03      [ 1]  531     bset PA_CR1,#UART1_TX_PIN 
      008200 72 1A 50 04      [ 1]  532     bset PA_CR2,#UART1_TX_PIN 
                                    533 ; enable UART1 clock
      008204 72 14 50 C7      [ 1]  534 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008208                        535 uart1_set_baud: 
                                    536 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    537 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008208 A6 E1            [ 1]  538 	ld a,#CLK_SWR_HSI
      00820A C1 50 C3         [ 1]  539 	cp a,CLK_CMSR 
      00820D 27 0A            [ 1]  540 	jreq 2$ 
      00820F                        541 1$: ; 8 Mhz 	
      00820F 35 05 52 33      [ 1]  542 	mov UART1_BRR2,#0x05 ; must be loaded first
      008213 35 04 52 32      [ 1]  543 	mov UART1_BRR1,#0x4
      008217 20 08            [ 2]  544 	jra 3$
      008219                        545 2$: ; 16 Mhz 	
      008219 35 0B 52 33      [ 1]  546 	mov UART1_BRR2,#0x0b ; must be loaded first
      00821D 35 08 52 32      [ 1]  547 	mov UART1_BRR1,#0x08
      008221                        548 3$:
      008221 72 5F 52 31      [ 1]  549     clr UART1_DR
      008225 35 2C 52 35      [ 1]  550 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008229 72 10 52 35      [ 1]  551 	bset UART1_CR2,#UART_CR2_SBK
      00822D 72 0D 52 30 FB   [ 2]  552     btjf UART1_SR,#UART_SR_TC,.
      008232 81               [ 4]  553     ret
                                    554 
                                    555 ;---------------------------------
                                    556 ; send character to UART1 
                                    557 ; input:
                                    558 ;   A 
                                    559 ; output:
                                    560 ;   none 
                                    561 ;--------------------------------	
      008233                        562 putc:
      008233 72 0F 52 30 FB   [ 2]  563 	btjf UART1_SR,#UART_SR_TXE,.
      008238 C7 52 31         [ 1]  564 	ld UART1_DR,a 
      00823B 81               [ 4]  565 	ret 
                                    566 
                                    567 ;---------------------------------
                                    568 ; wait character from UART1 
                                    569 ; input:
                                    570 ;   none
                                    571 ; output:
                                    572 ;   A 			char  
                                    573 ;--------------------------------	
      00823C                        574 getc:
      00823C C6 00 28         [ 1]  575 	ld a,rx_char 
      00823F 27 FB            [ 1]  576 	jreq getc 
      008241 72 5F 00 28      [ 1]  577 	clr rx_char 
      008245 81               [ 4]  578 	ret 
                                    579 
                                    580 ;-----------------------------
                                    581 ; send an ASCIZ string to UART1 
                                    582 ; input: 
                                    583 ;   x 		char * 
                                    584 ; output:
                                    585 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    586 ;-------------------------------
      008246                        587 puts:
      008246 F6               [ 1]  588     ld a,(x)
      008247 27 06            [ 1]  589 	jreq 1$
      008249 CD 82 33         [ 4]  590 	call putc 
      00824C 5C               [ 2]  591 	incw x 
      00824D 20 F7            [ 2]  592 	jra puts 
      00824F 81               [ 4]  593 1$:	ret 
                                    594 
                                    595 
                                    596 ;---------------------------
                                    597 ; delete character at left 
                                    598 ; of cursor on terminal 
                                    599 ; input:
                                    600 ;   none 
                                    601 ; output:
                                    602 ;	none 
                                    603 ;---------------------------
      008250                        604 bksp:
      008250 A6 08            [ 1]  605 	ld a,#BSP 
      008252 CD 82 33         [ 4]  606 	call putc 
      008255 A6 20            [ 1]  607 	ld a,#SPACE 
      008257 CD 82 33         [ 4]  608 	call putc 
      00825A A6 08            [ 1]  609 	ld a,#BSP 
      00825C CD 82 33         [ 4]  610 	call putc 
      00825F 81               [ 4]  611 	ret 
                                    612 ;---------------------------
                                    613 ; delete n character left of cursor 
                                    614 ; at terminal.
                                    615 ; input: 
                                    616 ;   A   number of characters to delete.
                                    617 ; output:
                                    618 ;    none 
                                    619 ;--------------------------	
      008260                        620 delete:
      008260 88               [ 1]  621 	push a 
      008261 0D 01            [ 1]  622 0$:	tnz (1,sp)
      008263 27 07            [ 1]  623 	jreq 1$
      008265 CD 82 50         [ 4]  624 	call bksp 
      008268 0A 01            [ 1]  625 	dec (1,sp)
      00826A 20 F5            [ 2]  626 	jra 0$
      00826C 84               [ 1]  627 1$:	pop a 
      00826D 81               [ 4]  628 	ret
                                    629 
                                    630 ;--------------------------
                                    631 ; print n spaces on terminal
                                    632 ; input:
                                    633 ;  X 		number of spaces 
                                    634 ; output:
                                    635 ;	none 
                                    636 ;---------------------------
      00826E                        637 spaces:
      00826E A6 20            [ 1]  638 	ld a,#SPACE 
      008270 5D               [ 2]  639 1$:	tnzw x
      008271 27 06            [ 1]  640 	jreq 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      008273 CD 82 33         [ 4]  641 	call putc 
      008276 5A               [ 2]  642 	decw x
      008277 20 F7            [ 2]  643 	jra 1$
      008279                        644 9$: 
      008279 81               [ 4]  645 	ret 
                                    646 
                           000000   647 .if DEBUG 
                                    648 ;---------------------------------
                                    649 ;; print actual registers states 
                                    650 ;; as pushed on stack 
                                    651 ;; {Y,X,CC,A}
                                    652 ;---------------------------------
                                    653 	_argofs 0  
                                    654 	_arg R_Y 1 
                                    655 	_arg R_X 3
                                    656 	_arg R_A 5
                                    657 	_arg R_CC 6
                                    658 prt_regs:
                                    659 	ldw x,#regs_state 
                                    660 	call puts
                                    661 ; register PC
                                    662 	ldw y,(1,sp)
                                    663 	ldw x,#REG_EPC 
                                    664 	call prt_reg16 
                                    665 ; register CC 
                                    666 	ld a,(R_CC,sp)
                                    667 	ldw x,#REG_CC 
                                    668 	call prt_reg8 
                                    669 ; register A 
                                    670 	ld a,(R_A,sp)
                                    671 	ldw x,#REG_A 
                                    672 	call prt_reg8 
                                    673 ; register X 
                                    674 	ldw y,(R_X,sp)
                                    675 	ldw x,#REG_X 
                                    676 	call prt_reg16 
                                    677 ; register Y 
                                    678 	ldw y,(R_Y,sp)
                                    679 	ldw x,#REG_Y 
                                    680 	call prt_reg16 
                                    681 ; register SP 
                                    682 	ldw y,sp
                                    683 	addw y,#6+ARG_OFS  
                                    684 	ldw x,#REG_SP
                                    685 	call prt_reg16
                                    686 	ld a,#CR 
                                    687 	call putc
                                    688 	call putc   
                                    689 	ret 
                                    690 
                                    691 regs_state: .asciz "\nregisters state\n--------------------\n"
                                    692 
                                    693 
                                    694 ;--------------------
                                    695 ; print content at address in hex.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    696 ; input:
                                    697 ;   X 	address to peek 
                                    698 ; output:
                                    699 ;	none 
                                    700 ;--------------------	
                                    701 prt_peek:
                                    702 	pushw x 
                                    703 	ldw acc16,x 
                                    704 	clr acc24 
                                    705 	clrw x 
                                    706 	ld a,#16 
                                    707 	call prti24 
                                    708 	ld a,#': 
                                    709 	call putc 
                                    710 	ld a,#SPACE 
                                    711 	call putc 
                                    712 	popw x 
                                    713 	ld a,(x)
                                    714 	ld acc8,a 
                                    715 	clrw x 
                                    716 	ld a,#16 
                                    717 	call prti24
                                    718 	ret 
                                    719 .endif ; DEBUG  
                                    720 
                                    721 ;-------------------------------------
                                    722 ; retrun string length
                                    723 ; input:
                                    724 ;   X         .asciz  pointer 
                                    725 ; output:
                                    726 ;   X         length 
                                    727 ;-------------------------------------
      00827A                        728 strlen:
      00827A 90 93            [ 1]  729 	ldw y,x 
      00827C 5F               [ 1]  730 	clrw x 
      00827D 90 7D            [ 1]  731 1$:	tnz (y) 
      00827F 27 05            [ 1]  732 	jreq 9$ 
      008281 5C               [ 2]  733 	incw x
      008282 90 5C            [ 2]  734 	incw y 
      008284 20 F7            [ 2]  735 	jra 1$ 
      008286 81               [ 4]  736 9$: ret 
                                    737 
                                    738 ;------------------------------------
                                    739 ; compare 2 strings
                                    740 ; input:
                                    741 ;   X 		char* first string 
                                    742 ;   Y       char* second string 
                                    743 ; output:
                                    744 ;   A 		0|1 
                                    745 ;-------------------------------------
      008287                        746 strcmp:
      008287 F6               [ 1]  747 	ld a,(x)
      008288 27 0B            [ 1]  748 	jreq 5$ 
      00828A 90 F1            [ 1]  749 	cp a,(y) 
      00828C 26 05            [ 1]  750 	jrne 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00828E 5C               [ 2]  751 	incw x 
      00828F 90 5C            [ 2]  752 	incw y 
      008291 20 F4            [ 2]  753 	jra strcmp 
      008293                        754 4$: ; not same  
      008293 4F               [ 1]  755 	clr a 
      008294 81               [ 4]  756 	ret 
      008295                        757 5$: ; same 
      008295 A6 01            [ 1]  758 	ld a,#1 
      008297 81               [ 4]  759 	ret 
                                    760 
                                    761 
                                    762 ;---------------------------------------
                                    763 ;  copy src to dest 
                                    764 ; input:
                                    765 ;   X 		dest 
                                    766 ;   Y 		src 
                                    767 ; output: 
                                    768 ;   X 		dest 
                                    769 ;----------------------------------
      008298                        770 strcpy:
      008298 89               [ 2]  771 	pushw x 
      008299 90 F6            [ 1]  772 1$: ld a,(y)
      00829B 27 06            [ 1]  773 	jreq 9$ 
      00829D F7               [ 1]  774 	ld (x),a 
      00829E 5C               [ 2]  775 	incw x 
      00829F 90 5C            [ 2]  776 	incw y 
      0082A1 20 F6            [ 2]  777 	jra 1$ 
      0082A3 7F               [ 1]  778 9$:	clr (x)
      0082A4 85               [ 2]  779 	popw x 
      0082A5 81               [ 4]  780 	ret 
                                    781 
                                    782 ;---------------------------------------
                                    783 ; move memory block 
                                    784 ; input:
                                    785 ;   X 		destination 
                                    786 ;   Y 	    source 
                                    787 ;   acc16	bytes count 
                                    788 ; output:
                                    789 ;   none 
                                    790 ;--------------------------------------
                           000001   791 	INCR=1 ; increament high byte 
                           000002   792 	LB=2 ; increament low byte 
                           000002   793 	VSIZE=2
      0082A6                        794 move:
      000226                        795 	_vars VSIZE 
      0082A6 52 02            [ 2]    1     sub sp,#VSIZE 
      0082A8 0F 01            [ 1]  796 	clr (INCR,sp)
      0082AA 0F 02            [ 1]  797 	clr (LB,sp)
      0082AC 90 89            [ 2]  798 	pushw y 
      0082AE 13 01            [ 2]  799 	cpw x,(1,sp) ; compare DEST to SRC 
      0082B0 90 85            [ 2]  800 	popw y 
      0082B2 27 31            [ 1]  801 	jreq move_exit ; x==y 
      0082B4 2B 0E            [ 1]  802 	jrmi move_down
      0082B6                        803 move_up: ; start from top address with incr=-1
      0082B6 72 BB 00 0D      [ 2]  804 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0082BA 72 B9 00 0D      [ 2]  805 	addw y,acc16
      0082BE 03 01            [ 1]  806 	cpl (INCR,sp)
      0082C0 03 02            [ 1]  807 	cpl (LB,sp)   ; increment = -1 
      0082C2 20 05            [ 2]  808 	jra move_loop  
      0082C4                        809 move_down: ; start from bottom address with incr=1 
      0082C4 5A               [ 2]  810     decw x 
      0082C5 90 5A            [ 2]  811 	decw y
      0082C7 0C 02            [ 1]  812 	inc (LB,sp) ; incr=1 
      0082C9                        813 move_loop:	
      0082C9 C6 00 0D         [ 1]  814     ld a, acc16 
      0082CC CA 00 0E         [ 1]  815 	or a, acc8
      0082CF 27 14            [ 1]  816 	jreq move_exit 
      0082D1 72 FB 01         [ 2]  817 	addw x,(INCR,sp)
      0082D4 72 F9 01         [ 2]  818 	addw y,(INCR,sp) 
      0082D7 90 F6            [ 1]  819 	ld a,(y)
      0082D9 F7               [ 1]  820 	ld (x),a 
      0082DA 89               [ 2]  821 	pushw x 
      0082DB CE 00 0D         [ 2]  822 	ldw x,acc16 
      0082DE 5A               [ 2]  823 	decw x 
      0082DF CF 00 0D         [ 2]  824 	ldw acc16,x 
      0082E2 85               [ 2]  825 	popw x 
      0082E3 20 E4            [ 2]  826 	jra move_loop
      0082E5                        827 move_exit:
      000265                        828 	_drop VSIZE
      0082E5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082E7 81               [ 4]  829 	ret 	
                                    830 
                                    831 ;-------------------------------------
                                    832 ; search text area for a line with 
                                    833 ; same number as line#  
                                    834 ; input:
                                    835 ;	X 			line# 
                                    836 ; output:
                                    837 ;   X 			addr of line | 0 
                                    838 ;   Y           line#|insert address if not found  
                                    839 ;-------------------------------------
                           000001   840 	LL=1 ; line length 
                           000002   841 	LB=2 ; line length low byte 
                           000002   842 	VSIZE=2 
      0082E8                        843 search_lineno:
      000268                        844 	_vars VSIZE
      0082E8 52 02            [ 2]    1     sub sp,#VSIZE 
      0082EA 0F 01            [ 1]  845 	clr (LL,sp)
      0082EC 90 CE 00 1F      [ 2]  846 	ldw y,txtbgn
      0082F0                        847 search_ln_loop:
      0082F0 90 C3 00 21      [ 2]  848 	cpw y,txtend 
      0082F4 2A 10            [ 1]  849 	jrpl 8$
      0082F6 90 F3            [ 1]  850 	cpw x,(y)
      0082F8 27 0E            [ 1]  851 	jreq 9$
      0082FA 2B 0A            [ 1]  852 	jrmi 8$ 
      0082FC 90 E6 02         [ 1]  853 	ld a,(2,y)
      0082FF 6B 02            [ 1]  854 	ld (LB,sp),a 
      008301 72 F9 01         [ 2]  855 	addw y,(LL,sp)
      008304 20 EA            [ 2]  856 	jra search_ln_loop 
      008306                        857 8$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      008306 5F               [ 1]  858 	clrw x 	
      008307 51               [ 1]  859 	exgw x,y 
      000288                        860 9$: _drop VSIZE
      008308 5B 02            [ 2]    1     addw sp,#VSIZE 
      00830A 51               [ 1]  861 	exgw x,y   
      00830B 81               [ 4]  862 	ret 
                                    863 
                                    864 ;-------------------------------------
                                    865 ; delete line at addr
                                    866 ; move new line to insert with end of text 
                                    867 ; otherwise it would be overwritten.
                                    868 ; input:
                                    869 ;   X 		addr of line i.e DEST for move 
                                    870 ;-------------------------------------
                           000001   871 	LLEN=1
                           000003   872 	SRC=3
                           000004   873 	VSIZE=4
      00830C                        874 del_line: 
      00028C                        875 	_vars VSIZE 
      00830C 52 04            [ 2]    1     sub sp,#VSIZE 
      00830E E6 02            [ 1]  876 	ld a,(2,x) ; line length
      008310 6B 02            [ 1]  877 	ld (LLEN+1,sp),a 
      008312 0F 01            [ 1]  878 	clr (LLEN,sp)
      008314 90 93            [ 1]  879 	ldw y,x  
      008316 72 F9 01         [ 2]  880 	addw y,(LLEN,sp) ;SRC  
      008319 17 03            [ 2]  881 	ldw (SRC,sp),y  ;save source 
      00831B 90 CE 00 21      [ 2]  882 	ldw y,txtend 
      00831F 90 E6 02         [ 1]  883 	ld a,(2,y)
      008322 90 5F            [ 1]  884 	clrw y 
      008324 90 97            [ 1]  885 	ld yl,a  
      008326 72 B9 00 21      [ 2]  886 	addw y,txtend
      00832A 72 F2 03         [ 2]  887 	subw y,(SRC,sp) ; y=count 
      00832D 90 CF 00 0D      [ 2]  888 	ldw acc16,y 
      008331 16 03            [ 2]  889 	ldw y,(SRC,sp)    ; source
      008333 CD 82 A6         [ 4]  890 	call move
      008336 90 CE 00 21      [ 2]  891 	ldw y,txtend 
      00833A 72 F2 01         [ 2]  892 	subw y,(LLEN,sp)
      00833D 90 CF 00 21      [ 2]  893 	ldw txtend,y  
      0002C1                        894 	_drop VSIZE     
      008341 5B 04            [ 2]    1     addw sp,#VSIZE 
      008343 81               [ 4]  895 	ret 
                                    896 
                                    897 ;---------------------------------------------
                                    898 ; create a gap in text area 
                                    899 ; move new line to insert in gap with end of text
                                    900 ; otherwise it would be overwritten.
                                    901 ; input:
                                    902 ;    X 			addr gap start 
                                    903 ;    Y 			gap length 
                                    904 ; output:
                                    905 ;    X 			addr gap start 
                                    906 ;--------------------------------------------
                           000001   907 	DEST=1
                           000003   908 	SRC=3
                           000005   909 	LEN=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                           000006   910 	VSIZE=6 
      008344                        911 create_gap:
      0002C4                        912 	_vars VSIZE
      008344 52 06            [ 2]    1     sub sp,#VSIZE 
      008346 1F 03            [ 2]  913 	ldw (SRC,sp),x 
      008348 17 05            [ 2]  914 	ldw (LEN,sp),y 
      00834A 90 CF 00 0D      [ 2]  915 	ldw acc16,y 
      00834E 90 93            [ 1]  916 	ldw y,x ; SRC
      008350 72 BB 00 0D      [ 2]  917 	addw x,acc16  
      008354 1F 01            [ 2]  918 	ldw (DEST,sp),x 
                                    919 ;compute size to move 	
      008356 CE 00 21         [ 2]  920 	ldw x,txtend 
      008359 E6 02            [ 1]  921 	ld a,(2,x) ; pending line length 
      00835B C7 00 0E         [ 1]  922 	ld acc8,a 
      00835E 72 5F 00 0D      [ 1]  923 	clr acc16 
      008362 72 BB 00 0D      [ 2]  924 	addw x,acc16 
      008366 72 F0 03         [ 2]  925 	subw x,(SRC,sp)
      008369 CF 00 0D         [ 2]  926 	ldw acc16,x ; size to move
      00836C 1E 01            [ 2]  927 	ldw x,(DEST,sp) 
      00836E CD 82 A6         [ 4]  928 	call move
      008371 CE 00 21         [ 2]  929 	ldw x,txtend
      008374 72 FB 05         [ 2]  930 	addw x,(LEN,sp)
      008377 CF 00 21         [ 2]  931 	ldw txtend,x
      0002FA                        932 9$:	_drop VSIZE 
      00837A 5B 06            [ 2]    1     addw sp,#VSIZE 
      00837C 81               [ 4]  933 	ret 
                                    934 
                                    935 
                                    936 ;--------------------------------------------
                                    937 ; insert line in tib into text area 
                                    938 ; first search for already existing 
                                    939 ; replace existing 
                                    940 ; if strlen(tib)==0 delete existing line
                                    941 ; input:
                                    942 ;   ptr16 				pointer to tokenized line  
                                    943 ; output:
                                    944 ;   none
                                    945 ;---------------------------------------------
                           000001   946 	DEST=1  ; text area insertion address 
                           000003   947 	SRC=3   ; str to insert address 
                           000005   948 	LINENO=5 ; line number 
                           000007   949 	LLEN=7 ; line length 
                           000008   950 	VSIZE=8  
      00837D                        951 insert_line:
      0002FD                        952 	_vars VSIZE 
      00837D 52 08            [ 2]    1     sub sp,#VSIZE 
      00837F CE 00 18         [ 2]  953 	ldw x,ptr16  
      008382 C3 00 1F         [ 2]  954 	cpw x,txtbgn 
      008385 26 0D            [ 1]  955 	jrne 0$
                                    956 ;first text line 
      008387 AE 00 02         [ 2]  957 	ldw x,#2 
      00838A 72 D6 00 18      [ 4]  958 	ld a,([ptr16],x)
      00838E 5F               [ 1]  959 	clrw x 
      00838F 97               [ 1]  960 	ld xl,a
      008390 1F 07            [ 2]  961 	ldw (LLEN,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008392 20 45            [ 2]  962 	jra 5$
      008394 72 CE 00 18      [ 5]  963 0$:	ldw x,[ptr16]
                                    964 ; new line number
      008398 1F 05            [ 2]  965 	ldw (LINENO,sp),x 
      00839A AE 00 02         [ 2]  966 	ldw x,#2 
      00839D 72 D6 00 18      [ 4]  967 	ld a,([ptr16],x)
      0083A1 97               [ 1]  968 	ld xl,a
                                    969 ; new line length
      0083A2 1F 07            [ 2]  970 	ldw (LLEN,sp),x
                                    971 ; check if that line number already exit 	
      0083A4 1E 05            [ 2]  972 	ldw x,(LINENO,sp)
      0083A6 CD 82 E8         [ 4]  973 	call search_lineno 
      0083A9 5D               [ 2]  974 	tnzw x 
      0083AA 26 04            [ 1]  975 	jrne 2$
                                    976 ; line doesn't exit
                                    977 ; it will be inserted at this point.  	
      0083AC 17 01            [ 2]  978 	ldw (DEST,sp),y 
      0083AE 20 05            [ 2]  979 	jra 3$
                                    980 ; line exit delete it.
                                    981 ; it will be replaced by new one 	
      0083B0 1F 01            [ 2]  982 2$: ldw (DEST,sp),x 
      0083B2 CD 83 0C         [ 4]  983 	call del_line
      0083B5                        984 3$: 
                                    985 ; insert new line or leave if LLEN==3
                                    986 ; LLEN==3 means empty line 
      0083B5 A6 03            [ 1]  987 	ld a,#3
      0083B7 11 08            [ 1]  988 	cp a,(LLEN+1,sp)
      0083B9 27 27            [ 1]  989 	jreq insert_ln_exit ; empty line exit.
                                    990 ; if insertion point at txtend 
                                    991 ; no move required 
      0083BB 1E 01            [ 2]  992 	ldw x,(DEST,sp)
      0083BD C3 00 21         [ 2]  993 	cpw x,txtend 
      0083C0 2A 17            [ 1]  994 	jrpl 5$ 
                                    995 ; must create a gap
                                    996 ; at insertion point  
      0083C2 1E 01            [ 2]  997 	ldw x,(DEST,sp)
      0083C4 16 07            [ 2]  998 	ldw y,(LLEN,sp)
      0083C6 CD 83 44         [ 4]  999 	call create_gap 
                                   1000 ; move new line in gap 
      0083C9 1E 07            [ 2] 1001 	ldw x,(LLEN,sp)
      0083CB CF 00 0D         [ 2] 1002 	ldw acc16,x 
      0083CE 90 CE 00 21      [ 2] 1003 	ldw y,txtend ;SRC 
      0083D2 1E 01            [ 2] 1004 	ldw x,(DEST,sp) ; dest address 
      0083D4 CD 82 A6         [ 4] 1005 	call move 
      0083D7 20 09            [ 2] 1006 	jra insert_ln_exit  
      0083D9                       1007 5$: ; no move required 
      0083D9 1E 07            [ 2] 1008 	ldw x,(LLEN,sp) 
      0083DB 72 BB 00 21      [ 2] 1009 	addw x,txtend 
      0083DF CF 00 21         [ 2] 1010 	ldw txtend,x 
      0083E2                       1011 insert_ln_exit:	
      000362                       1012 	_drop VSIZE
      0083E2 5B 08            [ 2]    1     addw sp,#VSIZE 
      0083E4 81               [ 4] 1013 	ret
                                   1014 
                                   1015 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1016 ;-----------------------------
                                   1017 ; check if text buffer full
                                   1018 ; input:
                                   1019 ;   ptr16     addr start tokenize line 
                                   1020 ;   X         buffer index 
                                   1021 ; output:
                                   1022 ;   none 
                                   1023 ;-----------------------------------
      0083E5                       1024 check_full:
      0083E5 72 BB 00 18      [ 2] 1025 	addw x,ptr16 
      0083E9 A3 16 E8         [ 2] 1026 	cpw x,#tib 
      0083EC 25 05            [ 1] 1027 	jrult 1$
      0083EE A6 01            [ 1] 1028 	ld a,#ERR_MEM_FULL
      0083F0 CC 87 83         [ 2] 1029 	jp tb_error 
      0083F3 81               [ 4] 1030 1$: ret 
                                   1031 
                                   1032 
                                   1033 ;-----------------------------------
                                   1034 ; create token list form text line 
                                   1035 ; save this list in text area
                                   1036 ;  compiled line format: 
                                   1037 ;    line_no  2 bytes {0...32767}
                                   1038 ;    count    1 byte 
                                   1039 ;    tokens   variable 
                                   1040 ;   
                                   1041 ; input:
                                   1042 ;   none
                                   1043 ; output:
                                   1044 ;   basicptr     token list buffer address 
                                   1045 ;   in.w  		 cleared, index in buffer 
                                   1046 ;-----------------------------------
                           000001  1047 	XSAVE=1
                           000003  1048 	BUFIDX=3
                           000004  1049 	VSIZE=4
      0083F4                       1050 compile:
      000374                       1051 	_vars VSIZE 
      0083F4 52 04            [ 2]    1     sub sp,#VSIZE 
      0083F6 72 1A 00 26      [ 1] 1052 	bset flags,#FCOMP 
      0083FA CE 00 21         [ 2] 1053 	ldw x,txtend
      0083FD CF 00 18         [ 2] 1054 	ldw ptr16,x ; code buffer start address 
      008400 5F               [ 1] 1055 	clrw x 
      008401 AE 00 03         [ 2] 1056 	ldw x,#3
      008404 1F 03            [ 2] 1057 	ldw (BUFIDX,sp),X  
      008406 CD 83 E5         [ 4] 1058 	call check_full
      008409 5F               [ 1] 1059 	clrw x 
      00840A 72 CF 00 18      [ 5] 1060 	ldw [ptr16],x ; initialize line# to zero 
      00840E CD 8B 39         [ 4] 1061 	call get_token
      008411 1F 01            [ 2] 1062 	ldw (XSAVE,sp),x 
      008413 A1 04            [ 1] 1063 	cp a,#TK_INTGR 
      008415 26 13            [ 1] 1064 	jrne 3$
      008417 A3 00 00         [ 2] 1065 	cpw x,#0 
      00841A 2C 05            [ 1] 1066 	jrsgt 1$
      00841C A6 0A            [ 1] 1067 	ld a,#ERR_BAD_VALUE 
      00841E CC 87 83         [ 2] 1068 	jp tb_error ; line number must be in range {1..32767}
      008421 72 CF 00 18      [ 5] 1069 1$:	ldw [ptr16],x; line number
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008425 CD 8B 39         [ 4] 1070 2$:	call get_token
      008428 1F 01            [ 2] 1071 	ldw (XSAVE,sp),x 
      00842A A1 00            [ 1] 1072 3$:	cp a,#TK_NONE 
      00842C 26 03            [ 1] 1073 	jrne 30$
      00842E CC 84 BF         [ 2] 1074 	jp 9$ ; end of line. 
      008431                       1075 30$: 	 
      008431 1E 03            [ 2] 1076 	ldw x,(BUFIDX,sp)
      008433 CD 83 E5         [ 4] 1077 	call check_full 
      008436 16 03            [ 2] 1078 	ldw y,(BUFIDX,sp) 
      008438 91 D7 18         [ 4] 1079 	ld ([ptr16],y),a ; token attribute 
      00843B 90 5C            [ 2] 1080 	incw y
      00843D 17 03            [ 2] 1081 	ldw (BUFIDX,sp),y
      00843F A1 01            [ 1] 1082 	cp a,#TK_COLON 
      008441 26 02            [ 1] 1083 	jrne 31$
      008443 20 E0            [ 2] 1084 	jra 2$ ; loop for next token 
      008445                       1085 31$: ; check for token type 
                                   1086 ; character token have 1 byte attribute, i.e. ASCII character 
      008445 A1 03            [ 1] 1087 	cp a,#TK_CHAR
      008447 26 0C            [ 1] 1088 	jrne 32$ 
      008449 1E 01            [ 2] 1089 	ldw x,(XSAVE,sp)
      00844B 9F               [ 1] 1090 	ld a,xl 
      00844C 91 D7 18         [ 4] 1091 	ld ([ptr16],y),a
      00844F 90 5C            [ 2] 1092 	incw y 
      008451 17 03            [ 2] 1093 	ldw (BUFIDX,sp),y 
      008453 20 D0            [ 2] 1094 	jra 2$ 
      008455                       1095 32$:
      008455 A1 02            [ 1] 1096 	cp a,#TK_ARRAY 
                                   1097 ; this token have not attribute. 
      008457 27 CC            [ 1] 1098 	jreq 2$ 
      008459 A1 0A            [ 1] 1099 	cp a,#TK_QSTR 
      00845B 26 25            [ 1] 1100 	jrne 4$
                                   1101 ; copy string as C string.	
      00845D AE 17 38         [ 2] 1102 	ldw x,#pad 
      008460 CD 82 7A         [ 4] 1103 	call strlen
      008463 5C               [ 2] 1104 	incw x  
      008464 CD 83 E5         [ 4] 1105 	call check_full 
      008467 90 AE 17 38      [ 2] 1106 	ldw y,#pad 
      00846B CE 00 18         [ 2] 1107 	ldw x,ptr16
      00846E 72 FB 03         [ 2] 1108 	addw x,(BUFIDX,sp)	
      008471 CD 82 98         [ 4] 1109 	call strcpy 
      008474 AE 17 38         [ 2] 1110 	ldw x,#pad 
      008477 CD 82 7A         [ 4] 1111 	call strlen 
      00847A 5C               [ 2] 1112 	incw x
      00847B 72 FB 03         [ 2] 1113 	addw x,(BUFIDX,sp) 
      00847E 1F 03            [ 2] 1114 	ldw (BUFIDX,sp),x
      008480 20 A3            [ 2] 1115 	jra 2$  
      008482 A1 04            [ 1] 1116 4$: cp a,#TK_INTGR
      008484 25 9F            [ 1] 1117 	jrult 2$ ; 
      008486 A1 08            [ 1] 1118 	cp a,#TK_CFUNC 
      008488 22 9B            [ 1] 1119 	Jrugt 2$ ; those tokens have no attributes 
      00848A 1E 01            [ 2] 1120 	ldw x,(XSAVE,sp) 
      00848C 16 03            [ 2] 1121 	ldw y,(BUFIDX,sp)
      00848E 91 DF 18         [ 5] 1122 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      008491 A3 94 C6         [ 2] 1123 	cpw x,#rem ; is this a comment? 
      008494 27 09            [ 1] 1124 	jreq 5$	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008496 72 A9 00 02      [ 2] 1125 	addw y,#2 
      00849A 17 03            [ 2] 1126 	ldw (BUFIDX,sp),y 
      00849C CC 84 25         [ 2] 1127 	jp 2$
      00849F                       1128 5$:
                                   1129 ; copy commment in code buffer and
                                   1130 ; skip to end of line.  
      00849F 72 A9 00 02      [ 2] 1131 	addw y,#2 ; skip exec address 
      0084A3 17 03            [ 2] 1132 	ldw (BUFIDX,sp),y 
      0084A5 CE 00 18         [ 2] 1133 	ldw x,ptr16 
      0084A8 72 FB 03         [ 2] 1134 	addw x,(BUFIDX,sp)
      0084AB 90 CE 00 01      [ 2] 1135 	ldw y,in.w 
      0084AF 72 A9 16 E8      [ 2] 1136 	addw y,#tib 
      0084B3 CD 82 98         [ 4] 1137 	call strcpy 	
      0084B6 CD 82 7A         [ 4] 1138 	call strlen 
      0084B9 5C               [ 2] 1139 	incw x ; skip string 0. 
      0084BA 72 FB 03         [ 2] 1140 	addw x,(BUFIDX,sp)
      0084BD 1F 03            [ 2] 1141 	ldw (BUFIDX,sp),x 
      0084BF                       1142 9$: 
      0084BF AE 00 02         [ 2] 1143 	ldw x,#2
      0084C2 16 03            [ 2] 1144 	ldw y,(BUFIDX,sp)
      0084C4 90 9F            [ 1] 1145 	ld a,yl 
      0084C6 72 D7 00 18      [ 4] 1146 	ld ([ptr16],x),a ; code byte count   	
      0084CA 72 CE 00 18      [ 5] 1147 	ldw x,[ptr16]
      0084CE 27 09            [ 1] 1148 	jreq 10$
      0084D0 CD 83 7D         [ 4] 1149 	call insert_line
      0084D3 72 5F 00 04      [ 1] 1150 	clr  count 
      0084D7 20 0F            [ 2] 1151 	jra  11$ 
      0084D9                       1152 10$: ; line# is zero 
      0084D9 CE 00 18         [ 2] 1153 	ldw x,ptr16 
      0084DC CF 00 05         [ 2] 1154 	ldw basicptr,x 
      0084DF E6 02            [ 1] 1155 	ld a,(2,x)
      0084E1 C7 00 04         [ 1] 1156 	ld count,a 
      0084E4 35 03 00 02      [ 1] 1157 	mov in,#3 
      0084E8                       1158 11$:
      000468                       1159 	_drop VSIZE 
      0084E8 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084EA 72 1B 00 26      [ 1] 1160 	bres flags,#FCOMP 
      0084EE 81               [ 4] 1161 	ret 
                                   1162 
                                   1163 
                                   1164 ;------------------------------------
                                   1165 ;  set all variables to zero 
                                   1166 ; input:
                                   1167 ;   none 
                                   1168 ; output:
                                   1169 ;	none
                                   1170 ;------------------------------------
      0084EF                       1171 clear_vars:
      0084EF AE 00 29         [ 2] 1172 	ldw x,#vars 
      0084F2 90 AE 00 34      [ 2] 1173 	ldw y,#2*26 
      0084F6 7F               [ 1] 1174 1$:	clr (x)
      0084F7 5C               [ 2] 1175 	incw x 
      0084F8 90 5A            [ 2] 1176 	decw y 
      0084FA 26 FA            [ 1] 1177 	jrne 1$
      0084FC 81               [ 4] 1178 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1179 
                                   1180 ;-------------------------------------
                                   1181 ; check if A is a letter 
                                   1182 ; input:
                                   1183 ;   A 			character to test 
                                   1184 ; output:
                                   1185 ;   C flag      1 true, 0 false 
                                   1186 ;-------------------------------------
      0084FD                       1187 is_alpha:
      0084FD A1 41            [ 1] 1188 	cp a,#'A 
      0084FF 8C               [ 1] 1189 	ccf
      008500 24 0B            [ 1] 1190 	jrnc 9$ 
      008502 A1 5B            [ 1] 1191 	cp a,#'Z+1 
      008504 25 07            [ 1] 1192 	jrc 9$ 
      008506 A1 61            [ 1] 1193 	cp a,#'a 
      008508 8C               [ 1] 1194 	ccf 
      008509 24 02            [ 1] 1195 	jrnc 9$
      00850B A1 7B            [ 1] 1196 	cp a,#'z+1   
      00850D 81               [ 4] 1197 9$: ret 	
                                   1198 
                                   1199 ;-------------------------------------
                                   1200 ;  program initialization entry point 
                                   1201 ;-------------------------------------
                           000001  1202 	MAJOR=1
                           000000  1203 	MINOR=0
      00850E 0A 0A 54 69 6E 79 20  1204 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008554                       1205 cold_start:
                                   1206 ;set stack 
      008554 AE 17 FF         [ 2] 1207 	ldw x,#STACK_EMPTY
      008557 94               [ 1] 1208 	ldw sp,x   
                                   1209 ; clear all ram 
      008558 7F               [ 1] 1210 0$: clr (x)
      008559 5A               [ 2] 1211 	decw x 
      00855A 26 FC            [ 1] 1212 	jrne 0$
                                   1213 ; activate pull up on all inputs 
      00855C A6 FF            [ 1] 1214 	ld a,#255 
      00855E C7 50 03         [ 1] 1215 	ld PA_CR1,a 
      008561 C7 50 08         [ 1] 1216 	ld PB_CR1,a 
      008564 C7 50 0D         [ 1] 1217 	ld PC_CR1,a 
      008567 C7 50 12         [ 1] 1218 	ld PD_CR1,a 
      00856A C7 50 17         [ 1] 1219 	ld PE_CR1,a 
      00856D C7 50 1C         [ 1] 1220 	ld PF_CR1,a 
      008570 C7 50 21         [ 1] 1221 	ld PG_CR1,a 
      008573 C7 50 2B         [ 1] 1222 	ld PI_CR1,a
                                   1223 ; set LD2 pin as output and turn it on
      008576 72 1A 50 0D      [ 1] 1224     bset PC_CR1,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00857A 72 1A 50 0E      [ 1] 1225     bset PC_CR2,#LED2_BIT
      00857E 72 1A 50 0C      [ 1] 1226     bset PC_DDR,#LED2_BIT
      008582 72 1A 50 0A      [ 1] 1227 	bset PC_ODR,#LED2_BIT 
                                   1228 ; disable schmitt triggers on Arduino CN4 analog inputs
      008586 55 00 3F 54 07   [ 1] 1229 	mov ADC_TDRL,0x3f
                                   1230 ; disable peripherals clocks
                                   1231 ;	clr CLK_PCKENR1 
                                   1232 ;	clr CLK_PCKENR2
      00858B 72 5F 50 F2      [ 1] 1233 	clr AWU_TBR 
      00858F 72 14 50 CA      [ 1] 1234 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for AWU 
                                   1235 ; select internal clock no divisor: 16 Mhz 	
      008593 A6 E1            [ 1] 1236 	ld a,#CLK_SWR_HSI 
      008595 5F               [ 1] 1237 	clrw x  
      008596 CD 81 0C         [ 4] 1238     call clock_init 
      008599 CD 81 2F         [ 4] 1239 	call timer4_init
      00859C CD 81 22         [ 4] 1240 	call timer2_init
                                   1241 ; UART1 at 115200 BAUD
      00859F CD 81 F8         [ 4] 1242 	call uart1_init
                                   1243 ; activate PE_4 (user button interrupt)
      0085A2 72 18 50 18      [ 1] 1244     bset PE_CR2,#USR_BTN_BIT 
                                   1245 ; display system information
      0085A6 AE 85 0E         [ 2] 1246 	ldw x,#software 
      0085A9 CD 82 46         [ 4] 1247 	call puts 
      0085AC A6 01            [ 1] 1248 	ld a,#MAJOR 
      0085AE C7 00 0E         [ 1] 1249 	ld acc8,a 
      0085B1 5F               [ 1] 1250 	clrw x 
      0085B2 CF 00 0C         [ 2] 1251 	ldw acc24,x 
      0085B5 A6 0A            [ 1] 1252 	ld a,#10 
      0085B7 CD 88 82         [ 4] 1253 	call prti24 
      0085BA A6 2E            [ 1] 1254 	ld a,#'.
      0085BC CD 82 33         [ 4] 1255 	call putc 
      0085BF A6 00            [ 1] 1256 	ld a,#MINOR 
      0085C1 C7 00 0E         [ 1] 1257 	ld acc8,a 
      0085C4 5F               [ 1] 1258 	clrw x 
      0085C5 CF 00 0C         [ 2] 1259 	ldw acc24,x 
      0085C8 A6 0A            [ 1] 1260 	ld a,#10 
      0085CA CD 88 82         [ 4] 1261 	call prti24 
      0085CD A6 0D            [ 1] 1262 	ld a,#CR 
      0085CF CD 82 33         [ 4] 1263 	call putc 
      0085D2 CD 98 B9         [ 4] 1264 	call seek_fdrive 
      0085D5 9A               [ 1] 1265 	rim 
      0085D6 72 5C 00 16      [ 1] 1266 	inc seedy+1 
      0085DA 72 5C 00 14      [ 1] 1267 	inc seedx+1 
      0085DE CD 86 4B         [ 4] 1268 	call clear_basic
      0085E1 CD 91 61         [ 4] 1269 	call ubound 
                                   1270 ;	jra 2$	
                                   1271 ; 150 msec beep 
      0085E4 AE 00 96         [ 2] 1272 	ldw x,#150 
      0085E7 90 AE 03 E6      [ 2] 1273 	ldw y,#998 
      0085EB CD 97 3D         [ 4] 1274 	call beep  
      0085EE 72 1B 50 0A      [ 1] 1275 2$:	bres PC_ODR,#LED2_BIT	
      0085F2 CD 85 FB         [ 4] 1276 	call warm_init
      0085F5 CD 86 12         [ 4] 1277 	call load_autorun
      0085F8 CC 87 C7         [ 2] 1278     jp interp 
                                   1279 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085FB                       1280 warm_init:
      0085FB 72 5F 00 26      [ 1] 1281 	clr flags 
      0085FF 72 5F 00 23      [ 1] 1282 	clr loop_depth 
      008603 35 04 00 27      [ 1] 1283 	mov tab_width,#TAB_WIDTH 
      008607 35 0A 00 0B      [ 1] 1284 	mov base,#10 
      00860B AE 16 E8         [ 2] 1285 	ldw x,#tib 
      00860E CF 00 05         [ 2] 1286 	ldw basicptr,x 
      008611 81               [ 4] 1287 	ret 
                                   1288 
                                   1289 ;--------------------------
                                   1290 ; if autorun file defined 
                                   1291 ; in eeprom address AUTORUN_NAME 
                                   1292 ; load and run it.
                                   1293 ;-------------------------
      008612                       1294 load_autorun:
      008612 AE 40 00         [ 2] 1295 	ldw x,#AUTORUN_NAME
      008615 F6               [ 1] 1296 	ld a,(x)
      008616 27 1D            [ 1] 1297 	jreq 9$
      008618 90 AE 40 00      [ 2] 1298 	ldw y,#AUTORUN_NAME
      00861C CD 99 17         [ 4] 1299 	call search_file
      00861F 25 02            [ 1] 1300 	jrc 2$ 
      008621 20 12            [ 2] 1301 	jra 9$ 
      008623 CD 9A 26         [ 4] 1302 2$:	call load_file
      008626 AE 40 00         [ 2] 1303 	ldw x,#AUTORUN_NAME 
      008629 CD 82 46         [ 4] 1304 	call puts
      00862C AE 86 36         [ 2] 1305 	ldw x,#autorun_msg 
      00862F CD 82 46         [ 4] 1306 	call puts 
      008632 CC 96 FA         [ 2] 1307 	jp run_it    
      008635 81               [ 4] 1308 9$: ret 	
                                   1309 
      008636 20 6C 6F 61 64 65 64  1310 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1311 ;---------------------------
                                   1312 ; reset BASIC text variables 
                                   1313 ; and clear variables 
                                   1314 ;---------------------------
      00864B                       1315 clear_basic:
      00864B 72 5F 00 04      [ 1] 1316 	clr count 
      00864F AE 00 5D         [ 2] 1317 	ldw x,#free_ram 
      008652 CF 00 1F         [ 2] 1318 	ldw txtbgn,x 
      008655 CF 00 21         [ 2] 1319 	ldw txtend,x 
      008658 CD 84 EF         [ 4] 1320 	call clear_vars 
      00865B 81               [ 4] 1321 	ret 
                                   1322 
                                   1323 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1324 ;;   Tiny BASIC error messages     ;;
                                   1325 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00865C                       1326 err_msg:
      00865C 00 00 86 76 86 84 86  1327 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             93 86 AD 86 BD
      008668 86 D4 86 EB 87 06 87  1328 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             18 87 2A
      008672 87 37 87 6B           1329 	.word err_no_access,err_no_data  
                                   1330 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008676 0A 4D 65 6D 6F 72 79  1331 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008684 0A 73 79 6E 74 61 78  1332 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008693 0A 6D 61 74 68 20 6F  1333 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086AD 0A 64 69 76 69 73 69  1334 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086BD 0A 69 6E 76 61 6C 69  1335 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086D4 0A 72 75 6E 20 74 69  1336 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086EB 0A 63 6F 6D 6D 61 6E  1337 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008706 0A 64 75 70 6C 69 63  1338 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      008718 0A 46 69 6C 65 20 6E  1339 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00872A 0A 62 61 64 20 76 61  1340 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008737 0A 46 69 6C 65 20 69  1341 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
      00876B 0A 4E 6F 20 64 61 74  1342 err_no_data: .asciz "\nNo data line found.\n"
             61 20 6C 69 6E 65 20
             66 6F 75 6E 64 2E 0A
             00
                                   1343 
                                   1344 ;rt_msg: .asciz "last token id: "
                                   1345 
      008781                       1346 syntax_error:
      008781 A6 02            [ 1] 1347 	ld a,#ERR_SYNTAX 
                                   1348 
      008783                       1349 tb_error:
      008783 AE 86 5C         [ 2] 1350 	ldw x, #err_msg 
      008786 72 5F 00 0D      [ 1] 1351 	clr acc16 
      00878A 48               [ 1] 1352 	sll a
      00878B 72 59 00 0D      [ 1] 1353 	rlc acc16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00878F C7 00 0E         [ 1] 1354 	ld acc8, a 
      008792 72 BB 00 0D      [ 2] 1355 	addw x,acc16 
      008796 FE               [ 2] 1356 	ldw x,(x)
      008797 CD 82 46         [ 4] 1357 	call puts
      00879A 72 0B 00 26 18   [ 2] 1358 	btjf flags,#FCOMP, 1$
      00879F AE 16 E8         [ 2] 1359 	ldw x,#tib
      0087A2 CD 82 46         [ 4] 1360 	call puts 
      0087A5 A6 0D            [ 1] 1361 	ld a,#CR 
      0087A7 CD 82 33         [ 4] 1362 	call putc
      0087AA CE 00 01         [ 2] 1363 	ldw x,in.w
      0087AD CD 82 6E         [ 4] 1364 	call spaces
      0087B0 A6 5E            [ 1] 1365 	ld a,#'^
      0087B2 CD 82 33         [ 4] 1366 	call putc 
      0087B5 20 09            [ 2] 1367 	jra 6$
      0087B7 CE 00 05         [ 2] 1368 1$:	ldw x,basicptr
      0087BA C6 00 02         [ 1] 1369 	ld a,in 
      0087BD CD 92 71         [ 4] 1370 	call prt_basic_line
                                   1371 ;	ldw x,#rt_msg 
                                   1372 ;	call puts 
                                   1373 ;	clrw x 
                                   1374 ;	ld a,in.saved 
                                   1375 ;	ld xl,a 
                                   1376 ;	ld a,([basicptr],x)
                                   1377 ;	clrw x 
                                   1378 ;	ld xl,a 
                                   1379 ;	call print_int 
      0087C0 AE 17 FF         [ 2] 1380 6$: ldw x,#STACK_EMPTY 
      0087C3 94               [ 1] 1381     ldw sp,x
      0087C4                       1382 warm_start:
      0087C4 CD 85 FB         [ 4] 1383 	call warm_init
                                   1384 ;----------------------------
                                   1385 ;   BASIC interpreter
                                   1386 ;----------------------------
      0087C7                       1387 interp:
      0087C7 72 5F 00 01      [ 1] 1388 	clr in.w
      0087CB 72 01 00 26 23   [ 2] 1389 	btjf flags,#FRUN,cmd_line
                                   1390 ; flag FRUN is set 
                                   1391 ; running program
                                   1392 ; goto next basic line 
      0087D0 CE 00 05         [ 2] 1393 	ldw x,basicptr
      0087D3 E6 02            [ 1] 1394 	ld a,(2,x) ; line length 
      0087D5 C7 00 0E         [ 1] 1395 	ld acc8,a 
      0087D8 72 5F 00 0D      [ 1] 1396 	clr acc16 
      0087DC 72 BB 00 0D      [ 2] 1397 	addw x,acc16
      0087E0 C3 00 21         [ 2] 1398 	cpw x,txtend 
      0087E3 2A DF            [ 1] 1399 	jrpl warm_start
      0087E5 CF 00 05         [ 2] 1400 	ldw basicptr,x ; start of next line  
      0087E8 E6 02            [ 1] 1401 	ld a,(2,x)
      0087EA C7 00 04         [ 1] 1402 	ld count,a 
      0087ED 35 03 00 02      [ 1] 1403 	mov in,#3 ; skip first 3 bytes of line 
      0087F1 20 14            [ 2] 1404 	jra interp_loop 
      0087F3                       1405 cmd_line: ; commande line interface  	
      0087F3 72 5F 00 02      [ 1] 1406 	clr in
      0087F7 A6 0D            [ 1] 1407 	ld a,#CR 
      0087F9 CD 82 33         [ 4] 1408 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0087FC A6 3E            [ 1] 1409 	ld a,#'> 
      0087FE CD 82 33         [ 4] 1410 	call putc 
      008801 CD 89 BA         [ 4] 1411 	call readln
      008804 CD 83 F4         [ 4] 1412 	call compile
                                   1413 ; if text begin with a line number
                                   1414 ; the compile set count=0   
                                   1415 ; so code is not interpreted
                                   1416 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1417 ;; This is the interpreter loop
                                   1418 ;; for each BASIC code line. 
                                   1419 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      008807                       1420 interp_loop:  
      008807 C6 00 02         [ 1] 1421 	ld a,in 
      00880A C1 00 04         [ 1] 1422 	cp a,count  
      00880D 2A B8            [ 1] 1423 	jrpl interp
      00880F CD 88 35         [ 4] 1424 	call next_token
      008812 A1 01            [ 1] 1425 	cp a,#TK_COLON 
      008814 27 F1            [ 1] 1426 	jreq interp_loop 
      008816                       1427 1$:
      008816 A1 05            [ 1] 1428 	cp a,#TK_VAR
      008818 26 05            [ 1] 1429 	jrne 2$
      00881A CD 91 8D         [ 4] 1430 	call let02  
      00881D 20 E8            [ 2] 1431 	jra interp_loop 
      00881F                       1432 2$:	
      00881F A1 02            [ 1] 1433 	cp a,#TK_ARRAY 
      008821 26 08            [ 1] 1434 	jrne 3$
      008823 CD 8F 42         [ 4] 1435 	call get_array_element
      008826 CD 91 8D         [ 4] 1436 	call let02 
      008829 20 DC            [ 2] 1437 	jra interp_loop 
      00882B                       1438 3$:
      00882B A1 06            [ 1] 1439 	cp a,#TK_CMD
      00882D 26 03            [ 1] 1440 	jrne 4$
      00882F FD               [ 4] 1441 	call (x) 
      008830 20 D5            [ 2] 1442 	jra interp_loop 
      008832                       1443 4$:	
      008832 CC 87 81         [ 2] 1444 	jp syntax_error 
                                   1445 
                                   1446 ;--------------------------
                                   1447 ; extract next token from
                                   1448 ; token list 
                                   1449 ; basicptr -> base address 
                                   1450 ; in  -> offset in list array 
                                   1451 ; output:
                                   1452 ;   A 		token attribute
                                   1453 ;   X 		token value if there is one
                                   1454 ;----------------------------------------
      008835                       1455 next_token:
      008835 C6 00 02         [ 1] 1456 	ld a,in 
      008838 C0 00 04         [ 1] 1457 	sub a,count ; don't replace sub by cp.  
      00883B 27 44            [ 1] 1458 	jreq 10$
      00883D 55 00 02 00 03   [ 1] 1459 	mov in.saved,in 
      008842 90 CE 00 05      [ 2] 1460 	ldw y,basicptr 
      008846 72 B9 00 01      [ 2] 1461 	addw y,in.w 
      00884A 90 F6            [ 1] 1462 	ld a,(y)
      00884C 90 5C            [ 2] 1463 	incw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00884E A1 02            [ 1] 1464 	cp a,#TK_ARRAY  
      008850 23 27            [ 2] 1465 	jrule 9$
      008852 A1 03            [ 1] 1466 	cp a,#TK_CHAR
      008854 26 0A            [ 1] 1467 	jrne 1$
      008856 90 F6            [ 1] 1468 	ld a,(y)
      008858 90 5C            [ 2] 1469 	incw y
      00885A 5F               [ 1] 1470 	clrw x 
      00885B 97               [ 1] 1471 	ld xl,a 
      00885C A6 03            [ 1] 1472 	ld a,#TK_CHAR
      00885E 20 19            [ 2] 1473 	jra 9$ 
      008860 A1 0A            [ 1] 1474 1$:	cp a,#TK_QSTR 
      008862 25 0F            [ 1] 1475 	jrult 4$
      008864 26 13            [ 1] 1476 	jrne 9$
      008866 93               [ 1] 1477 	ldw x,y 
      008867 90 7D            [ 1] 1478 2$:	tnz (y)
      008869 27 04            [ 1] 1479 	jreq 3$
      00886B 90 5C            [ 2] 1480 	incw y
      00886D 20 F8            [ 2] 1481 	jra 2$ 
      00886F 90 5C            [ 2] 1482 3$:	incw y 
      008871 20 06            [ 2] 1483 	jra 9$ 
      008873 93               [ 1] 1484 4$: ldw x,y 
      008874 FE               [ 2] 1485 	ldw x,(x)
      008875 72 A9 00 02      [ 2] 1486 	addw y,#2  
      008879 72 B2 00 05      [ 2] 1487 9$: subw y,basicptr 
      00887D 90 CF 00 01      [ 2] 1488     ldw in.w,y 
      008881                       1489 10$:
      008881 81               [ 4] 1490 	ret	
                                   1491 
                                   1492 
                                   1493 ;----------------------------------------
                                   1494 ;   DEBUG support functions
                                   1495 ;----------------------------------------
                           000000  1496 .if DEBUG 
                                   1497 
                                   1498 ; turn LED on 
                                   1499 ledon:
                                   1500     bset PC_ODR,#LED2_BIT
                                   1501     ret 
                                   1502 
                                   1503 ; turn LED off 
                                   1504 ledoff:
                                   1505     bres PC_ODR,#LED2_BIT 
                                   1506     ret 
                                   1507 
                                   1508 ; invert LED status 
                                   1509 ledtoggle:
                                   1510     ld a,#LED2_MASK
                                   1511     xor a,PC_ODR
                                   1512     ld PC_ODR,a
                                   1513     ret 
                                   1514 
                                   1515 left_paren:
                                   1516 	ld a,#SPACE 
                                   1517 	call putc
                                   1518 	ld a,#'( 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1519 	call putc 	
                                   1520 	ret 
                                   1521 
                                   1522 ;------------------------------
                                   1523 ; print 8 bit register 
                                   1524 ; input:
                                   1525 ;   X  point to register name 
                                   1526 ;   A  register value to print 
                                   1527 ; output:
                                   1528 ;   none
                                   1529 ;------------------------------- 
                                   1530 prt_reg8:
                                   1531 	push a 
                                   1532 	call puts 
                                   1533 	ld a,(1,sp) 
                                   1534 	ld acc8,a 
                                   1535 	clrw x 
                                   1536 	ld xl,a 
                                   1537 	mov base,#16
                                   1538 	call print_int 
                                   1539 	call left_paren 
                                   1540 	pop a 
                                   1541 	clrw x 
                                   1542 	ld xl,a 
                                   1543 	mov base,#10 
                                   1544 	call print_int  
                                   1545 	ld a,#') 
                                   1546 	call putc
                                   1547 	ret
                                   1548 
                                   1549 ;--------------------------------
                                   1550 ; print 16 bits register 
                                   1551 ; input:
                                   1552 ;   X   point register name 
                                   1553 ;   Y   register value to print 
                                   1554 ; output:
                                   1555 ;  none
                                   1556 ;--------------------------------
                                   1557 prt_reg16: 
                                   1558 	pushw y 
                                   1559 	call puts 
                                   1560 	ldw x,(1,sp) 
                                   1561 	mov base,#16 
                                   1562 	call print_int  
                                   1563 	call left_paren 
                                   1564 	popw x 
                                   1565 	mov base,#10 
                                   1566 	call print_int  
                                   1567 	ld a,#') 
                                   1568 	call putc
                                   1569 	ret 
                                   1570 
                                   1571 ;------------------------------------
                                   1572 ; print registers contents saved on
                                   1573 ; stack by trap interrupt.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1574 ;------------------------------------
                                   1575 print_registers:
                                   1576 	ldw x,#STATES
                                   1577 	call puts
                                   1578 ; print EPC 
                                   1579 	ldw x, #REG_EPC
                                   1580 	call puts 
                                   1581 	ld a, (11,sp)
                                   1582 	ld acc8,a 
                                   1583 	ld a, (10,sp) 
                                   1584 	ld acc16,a 
                                   1585 	ld a,(9,sp) 
                                   1586 	ld acc24,a
                                   1587 	clrw x  
                                   1588 	ld a,#16
                                   1589 	call prti24  
                                   1590 ; print X
                                   1591 	ldw x,#REG_X
                                   1592 	ldw y,(5,sp)
                                   1593 	call prt_reg16  
                                   1594 ; print Y 
                                   1595 	ldw x,#REG_Y
                                   1596 	ldw y, (7,sp)
                                   1597 	call prt_reg16  
                                   1598 ; print A 
                                   1599 	ldw x,#REG_A
                                   1600 	ld a, (4,sp) 
                                   1601 	call prt_reg8
                                   1602 ; print CC 
                                   1603 	ldw x,#REG_CC 
                                   1604 	ld a, (3,sp) 
                                   1605 	call prt_reg8 
                                   1606 ; print SP 
                                   1607 	ldw x,#REG_SP
                                   1608 	ldw y,sp 
                                   1609 	addw y,#12
                                   1610 	call prt_reg16  
                                   1611 	ld a,#'\n' 
                                   1612 	call putc
                                   1613 	ret
                                   1614 
                                   1615 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1616 REG_EPC: .asciz "EPC:"
                                   1617 REG_Y:   .asciz "\nY:" 
                                   1618 REG_X:   .asciz "\nX:"
                                   1619 REG_A:   .asciz "\nA:" 
                                   1620 REG_CC:  .asciz "\nCC:"
                                   1621 REG_SP:  .asciz "\nSP:"
                                   1622 
                                   1623 .endif ; DEBUG 
                                   1624 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1625 
                                   1626 
                                   1627 ;------------------------------------
                                   1628 ; print integer in acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1629 ; input:
                                   1630 ;	acc24 		integer to print 
                                   1631 ;	A 			numerical base for conversion 
                                   1632 ;               if bit 7 is set add a space at print end.
                                   1633 ;   XL 			field width, 0 -> no fill.
                                   1634 ;  output:
                                   1635 ;    none 
                                   1636 ;------------------------------------
                           000001  1637 	WIDTH = 1
                           000002  1638 	BASE = 2
                           000003  1639 	ADD_SPACE=3 ; add a space after number 
                           000003  1640 	VSIZE = 3
      008882                       1641 prti24:
      000802                       1642 	_vars VSIZE 
      008882 52 03            [ 2]    1     sub sp,#VSIZE 
      008884 0F 03            [ 1] 1643 	clr (ADD_SPACE,sp)
      008886 A5 80            [ 1] 1644 	bcp a,#0x80 
      008888 27 02            [ 1] 1645 	jreq 0$ 
      00888A 03 03            [ 1] 1646 	cpl (ADD_SPACE,sp)
      00888C A4 1F            [ 1] 1647 0$:	and a,#31 
      00888E 6B 02            [ 1] 1648 	ld (BASE,sp),a
      008890 9F               [ 1] 1649 	ld a,xl
      008891 6B 01            [ 1] 1650 	ld (WIDTH,sp),a 
      008893 7B 02            [ 1] 1651 	ld a, (BASE,sp)  
      008895 CD 89 28         [ 4] 1652     call itoa  ; conversion entier en  .asciz
      008898 7B 01            [ 1] 1653 1$: ld a,(WIDTH,sp)
      00889A 27 1F            [ 1] 1654 	jreq 4$
      00889C C7 00 0E         [ 1] 1655 	ld acc8,a 
      00889F 89               [ 2] 1656 	pushw x 
      0088A0 CD 82 7A         [ 4] 1657 	call strlen 
      0088A3 9F               [ 1] 1658 	ld a,xl 
      0088A4 85               [ 2] 1659 	popw x 
      0088A5 31 00 0E         [ 3] 1660 	exg a,acc8 
      0088A8 C0 00 0E         [ 1] 1661 	sub a,acc8 
      0088AB 2B 0E            [ 1] 1662 	jrmi 4$
      0088AD 6B 01            [ 1] 1663 	ld (WIDTH,sp),a 
      0088AF A6 20            [ 1] 1664 	ld  a,#SPACE
      0088B1 0D 01            [ 1] 1665 3$: tnz (WIDTH,sp)
      0088B3 27 06            [ 1] 1666 	jreq 4$
      0088B5 5A               [ 2] 1667 	decw x 
      0088B6 F7               [ 1] 1668 	ld (x),a 
      0088B7 0A 01            [ 1] 1669 	dec (WIDTH,sp) 
      0088B9 20 F6            [ 2] 1670 	jra 3$
      0088BB                       1671 4$: 
      0088BB CD 82 46         [ 4] 1672 	call puts 
      0088BE 0D 03            [ 1] 1673 	tnz (ADD_SPACE,sp)
      0088C0 27 05            [ 1] 1674 	jreq 5$
      0088C2 A6 20            [ 1] 1675     ld a,#SPACE 
      0088C4 CD 82 33         [ 4] 1676 	call putc 
      000847                       1677 5$: _drop VSIZE 
      0088C7 5B 03            [ 2]    1     addw sp,#VSIZE 
      0088C9 81               [ 4] 1678     ret	
                                   1679 
                                   1680 ;-----------------------------------
                                   1681 ; print a 16 bit integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1682 ; using variable 'base' as conversion
                                   1683 ; format.
                                   1684 ; input:
                                   1685 ;   X       integer to print 
                                   1686 ;   base    conversion base 
                                   1687 ; output:
                                   1688 ;   none 
                                   1689 ;-----------------------------------
                           000001  1690 	SIGN=1
                           000001  1691 	VSIZE=1
      0088CA                       1692 print_int: 
      00084A                       1693 	_vars VSIZE 
      0088CA 52 01            [ 2]    1     sub sp,#VSIZE 
      0088CC 0F 01            [ 1] 1694 	clr (SIGN,sp)
      0088CE 90 AE 17 5F      [ 2] 1695 	ldw y,#pad+PAD_SIZE-1 
      0088D2 90 7F            [ 1] 1696 	clr (y)
      0088D4 C6 00 0B         [ 1] 1697 	ld a,base  
      0088D7 A1 0A            [ 1] 1698 	cp a,#10 
      0088D9 26 06            [ 1] 1699 	jrne 1$ 
      0088DB 5D               [ 2] 1700 	tnzw x 
      0088DC 2A 03            [ 1] 1701 	jrpl 1$ 
      0088DE 03 01            [ 1] 1702 	cpl (SIGN,sp)
      0088E0 50               [ 2] 1703 	negw x 	 
      0088E1                       1704 1$:	
      0088E1 C6 00 0B         [ 1] 1705 	ld a,base 
      0088E4 62               [ 2] 1706 	div x,a 
      0088E5 AB 30            [ 1] 1707 	add a,#'0 
      0088E7 A1 3A            [ 1] 1708 	cp a,#'9+1 
      0088E9 2B 02            [ 1] 1709 	jrmi 2$ 
      0088EB AB 07            [ 1] 1710 	add a,#7 
      0088ED 90 5A            [ 2] 1711 2$: decw y 
      0088EF 90 F7            [ 1] 1712 	ld (y),a 
      0088F1 5D               [ 2] 1713 	tnzw x 
      0088F2 26 ED            [ 1] 1714 	jrne 1$ 
      0088F4 A6 10            [ 1] 1715 	ld a,#16 
      0088F6 C1 00 0B         [ 1] 1716 	cp a,base 
      0088F9 26 08            [ 1] 1717 	jrne 3$
      0088FB A6 24            [ 1] 1718 	ld a,#'$
      0088FD 90 5A            [ 2] 1719 	decw y  
      0088FF 90 F7            [ 1] 1720 	ld (y),a
      008901 20 0A            [ 2] 1721 	jra 9$ 
      008903 0D 01            [ 1] 1722 3$: tnz (SIGN,sp)
      008905 27 06            [ 1] 1723 	jreq 9$ 
      008907 A6 2D            [ 1] 1724 	ld a,#'-
      008909 90 5A            [ 2] 1725 	decw y  
      00890B 90 F7            [ 1] 1726 	ld (y),a
      00890D                       1727 9$:	
      00890D 93               [ 1] 1728 	ldw x,y 
      00890E 1D 17 5F         [ 2] 1729 	subw x,#pad+PAD_SIZE-1 
      008911 50               [ 2] 1730 	negw x  
      008912                       1731 10$:
      008912 9F               [ 1] 1732 	ld a,xl 
      008913 C1 00 27         [ 1] 1733 	cp a,tab_width
      008916 24 09            [ 1] 1734 	jruge 12$
      008918 90 5A            [ 2] 1735 	decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      00891A A6 20            [ 1] 1736 	ld a,#SPACE 
      00891C 90 F7            [ 1] 1737 	ld (y),a
      00891E 5C               [ 2] 1738 	incw x 
      00891F 20 F1            [ 2] 1739 	jra 10$ 
      008921                       1740 12$:
      008921 93               [ 1] 1741     ldw x,y 
      008922 CD 82 46         [ 4] 1742 	call puts  
      0008A5                       1743 	_drop VSIZE 
      008925 5B 01            [ 2]    1     addw sp,#VSIZE 
      008927 81               [ 4] 1744 	ret 
                                   1745 
                                   1746 ;------------------------------------
                                   1747 ; convert integer in acc24 to string
                                   1748 ; input:
                                   1749 ;   A	  	base
                                   1750 ;	acc24	integer to convert
                                   1751 ; output:
                                   1752 ;   X  		pointer to string
                                   1753 ;------------------------------------
                           000001  1754 	SIGN=1  ; integer sign 
                           000002  1755 	BASE=2  ; numeric base 
                           000002  1756 	VSIZE=2  ;locals size
      008928                       1757 itoa:
      008928 52 02            [ 2] 1758 	sub sp,#VSIZE
      00892A 6B 02            [ 1] 1759 	ld (BASE,sp), a  ; base
      00892C 0F 01            [ 1] 1760 	clr (SIGN,sp)    ; sign
      00892E A1 0A            [ 1] 1761 	cp a,#10
      008930 26 0A            [ 1] 1762 	jrne 1$
                                   1763 	; base 10 string display with negative sign if bit 23==1
      008932 72 0F 00 0C 05   [ 2] 1764 	btjf acc24,#7,1$
      008937 03 01            [ 1] 1765 	cpl (SIGN,sp)
      008939 CD 89 97         [ 4] 1766 	call neg_acc24
      00893C                       1767 1$:
                                   1768 ; initialize string pointer 
      00893C AE 17 5F         [ 2] 1769 	ldw x,#pad+PAD_SIZE-1
      00893F 7F               [ 1] 1770 	clr (x)
      008940                       1771 itoa_loop:
      008940 7B 02            [ 1] 1772     ld a,(BASE,sp)
      008942 CD 89 6F         [ 4] 1773     call divu24_8 ; acc24/A 
      008945 AB 30            [ 1] 1774     add a,#'0  ; remainder of division
      008947 A1 3A            [ 1] 1775     cp a,#'9+1
      008949 2B 02            [ 1] 1776     jrmi 2$
      00894B AB 07            [ 1] 1777     add a,#7 
      00894D 5A               [ 2] 1778 2$: decw x
      00894E F7               [ 1] 1779     ld (x),a
                                   1780 	; if acc24==0 conversion done
      00894F C6 00 0C         [ 1] 1781 	ld a,acc24
      008952 CA 00 0D         [ 1] 1782 	or a,acc16
      008955 CA 00 0E         [ 1] 1783 	or a,acc8
      008958 26 E6            [ 1] 1784     jrne itoa_loop
                                   1785 	;conversion done, next add '$' or '-' as required
      00895A 7B 02            [ 1] 1786 	ld a,(BASE,sp)
      00895C A1 10            [ 1] 1787 	cp a,#16
      00895E 27 08            [ 1] 1788 	jreq 8$
      008960 7B 01            [ 1] 1789 	ld a,(SIGN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008962 27 08            [ 1] 1790     jreq 10$
      008964 A6 2D            [ 1] 1791     ld a,#'-
      008966 20 02            [ 2] 1792 	jra 9$ 
      008968 A6 24            [ 1] 1793 8$: ld a,#'$ 
      00896A 5A               [ 2] 1794 9$: decw x
      00896B F7               [ 1] 1795     ld (x),a
      00896C                       1796 10$:
      00896C 5B 02            [ 2] 1797 	addw sp,#VSIZE
      00896E 81               [ 4] 1798 	ret
                                   1799 
                                   1800 ;-------------------------------------
                                   1801 ; divide uint24_t by uint8_t
                                   1802 ; used to convert uint24_t to string
                                   1803 ; input:
                                   1804 ;	acc24	dividend
                                   1805 ;   A 		divisor
                                   1806 ; output:
                                   1807 ;   acc24	quotient
                                   1808 ;   A		remainder
                                   1809 ;------------------------------------- 
                                   1810 ; offset  on sp of arguments and locals
                           000001  1811 	U8   = 1   ; divisor on stack
                           000001  1812 	VSIZE =1
      00896F                       1813 divu24_8:
      00896F 89               [ 2] 1814 	pushw x ; save x
      008970 88               [ 1] 1815 	push a 
                                   1816 	; ld dividend UU:MM bytes in X
      008971 C6 00 0C         [ 1] 1817 	ld a, acc24
      008974 95               [ 1] 1818 	ld xh,a
      008975 C6 00 0D         [ 1] 1819 	ld a,acc24+1
      008978 97               [ 1] 1820 	ld xl,a
      008979 7B 01            [ 1] 1821 	ld a,(U8,SP) ; divisor
      00897B 62               [ 2] 1822 	div x,a ; UU:MM/U8
      00897C 88               [ 1] 1823 	push a  ;save remainder
      00897D 9E               [ 1] 1824 	ld a,xh
      00897E C7 00 0C         [ 1] 1825 	ld acc24,a
      008981 9F               [ 1] 1826 	ld a,xl
      008982 C7 00 0D         [ 1] 1827 	ld acc24+1,a
      008985 84               [ 1] 1828 	pop a
      008986 95               [ 1] 1829 	ld xh,a
      008987 C6 00 0E         [ 1] 1830 	ld a,acc24+2
      00898A 97               [ 1] 1831 	ld xl,a
      00898B 7B 01            [ 1] 1832 	ld a,(U8,sp) ; divisor
      00898D 62               [ 2] 1833 	div x,a  ; R:LL/U8
      00898E 6B 01            [ 1] 1834 	ld (U8,sp),a ; save remainder
      008990 9F               [ 1] 1835 	ld a,xl
      008991 C7 00 0E         [ 1] 1836 	ld acc24+2,a
      008994 84               [ 1] 1837 	pop a
      008995 85               [ 2] 1838 	popw x
      008996 81               [ 4] 1839 	ret
                                   1840 
                                   1841 ;------------------------------------
                                   1842 ;  two's complement acc24
                                   1843 ;  input:
                                   1844 ;		acc24 variable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1845 ;  output:
                                   1846 ;		acc24 variable
                                   1847 ;-------------------------------------
      008997                       1848 neg_acc24:
      008997 72 53 00 0E      [ 1] 1849 	cpl acc24+2
      00899B 72 53 00 0D      [ 1] 1850 	cpl acc24+1
      00899F 72 53 00 0C      [ 1] 1851 	cpl acc24
      0089A3 A6 01            [ 1] 1852 	ld a,#1
      0089A5 CB 00 0E         [ 1] 1853 	add a,acc24+2
      0089A8 C7 00 0E         [ 1] 1854 	ld acc24+2,a
      0089AB 4F               [ 1] 1855 	clr a
      0089AC C9 00 0D         [ 1] 1856 	adc a,acc24+1
      0089AF C7 00 0D         [ 1] 1857 	ld acc24+1,a 
      0089B2 4F               [ 1] 1858 	clr a 
      0089B3 C9 00 0C         [ 1] 1859 	adc a,acc24 
      0089B6 C7 00 0C         [ 1] 1860 	ld acc24,a 
      0089B9 81               [ 4] 1861 	ret
                                   1862 
                                   1863 
                                   1864 ;------------------------------------
                                   1865 ; read a line of text from terminal
                                   1866 ; input:
                                   1867 ;	none
                                   1868 ; local variable on stack:
                                   1869 ;	LL  line length
                                   1870 ;   RXCHAR last received chaaracte 
                                   1871 ; output:
                                   1872 ;   text in tib  buffer
                                   1873 ;------------------------------------
                                   1874 	; local variables
                           000001  1875 	LL_HB=1
                           000001  1876 	RXCHAR = 1 ; last char received
                           000002  1877 	LL = 2  ; accepted line length
                           000002  1878 	VSIZE=2 
      0089BA                       1879 readln:
      0089BA 5F               [ 1] 1880 	clrw x 
      0089BB 89               [ 2] 1881 	pushw x 
      0089BC 90 AE 16 E8      [ 2] 1882  	ldw y,#tib ; input buffer
      0089C0                       1883 readln_loop:
      0089C0 CD 82 3C         [ 4] 1884 	call getc
      0089C3 6B 01            [ 1] 1885 	ld (RXCHAR,sp),a
      0089C5 A1 0D            [ 1] 1886 	cp a,#CR
      0089C7 26 03            [ 1] 1887 	jrne 1$
      0089C9 CC 8A 35         [ 2] 1888 	jp readln_quit
      0089CC A1 0A            [ 1] 1889 1$:	cp a,#NL
      0089CE 27 65            [ 1] 1890 	jreq readln_quit
      0089D0 A1 08            [ 1] 1891 	cp a,#BSP
      0089D2 27 3D            [ 1] 1892 	jreq del_back
      0089D4 A1 04            [ 1] 1893 	cp a,#CTRL_D
      0089D6 27 2A            [ 1] 1894 	jreq del_ln
      0089D8 A1 12            [ 1] 1895 	cp a,#CTRL_R 
      0089DA 27 06            [ 1] 1896 	jreq reprint 
                                   1897 ;	cp a,#'[
                                   1898 ;	jreq ansi_seq
      0089DC                       1899 final_test:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089DC A1 20            [ 1] 1900 	cp a,#SPACE
      0089DE 2A 40            [ 1] 1901 	jrpl accept_char
      0089E0 20 DE            [ 2] 1902 	jra readln_loop
      0089E2                       1903 ansi_seq:
                                   1904 ;	call getc
                                   1905 ;	cp a,#'C 
                                   1906 ;	jreq rigth_arrow
                                   1907 ;	cp a,#'D 
                                   1908 ;	jreq left_arrow 
                                   1909 ;	jra final_test
      0089E2                       1910 right_arrow:
                                   1911 ;	ld a,#BSP 
                                   1912 ;	call putc 
                                   1913 ;	jra realn_loop 
      0089E2                       1914 left_arrow:
                                   1915 
                                   1916 ;	jra readln_loop
      0089E2                       1917 reprint: 
      0089E2 0D 02            [ 1] 1918 	tnz (LL,sp)
      0089E4 26 DA            [ 1] 1919 	jrne readln_loop
      0089E6 AE 16 E8         [ 2] 1920 	ldw x,#tib 
      0089E9 CD 82 7A         [ 4] 1921 	call strlen 
      0089EC 90 AE 16 E8      [ 2] 1922 	ldw y,#tib 
      0089F0 9F               [ 1] 1923 	ld a,xl
      0089F1 27 CD            [ 1] 1924 	jreq readln_loop
      0089F3 6B 02            [ 1] 1925 	ld (LL,sp),a 
      0089F5 AE 16 E8         [ 2] 1926 	ldw x,#tib 
      0089F8 CD 82 46         [ 4] 1927 	call puts
      0089FB 0F 01            [ 1] 1928 	clr (LL_HB,sp)
      0089FD 72 F9 01         [ 2] 1929 	addw y,(LL_HB,sp)
      008A00 20 BE            [ 2] 1930 	jra readln_loop 
      008A02                       1931 del_ln:
      008A02 7B 02            [ 1] 1932 	ld a,(LL,sp)
      008A04 CD 82 60         [ 4] 1933 	call delete
      008A07 90 AE 16 E8      [ 2] 1934 	ldw y,#tib
      008A0B 90 7F            [ 1] 1935 	clr (y)
      008A0D 0F 02            [ 1] 1936 	clr (LL,sp)
      008A0F 20 AF            [ 2] 1937 	jra readln_loop
      008A11                       1938 del_back:
      008A11 0D 02            [ 1] 1939     tnz (LL,sp)
      008A13 27 AB            [ 1] 1940     jreq readln_loop
      008A15 0A 02            [ 1] 1941     dec (LL,sp)
      008A17 90 5A            [ 2] 1942     decw y
      008A19 90 7F            [ 1] 1943     clr  (y)
      008A1B CD 82 50         [ 4] 1944     call bksp 
      008A1E 20 A0            [ 2] 1945     jra readln_loop	
      008A20                       1946 accept_char:
      008A20 A6 4F            [ 1] 1947 	ld a,#TIB_SIZE-1
      008A22 11 02            [ 1] 1948 	cp a, (LL,sp)
      008A24 27 9A            [ 1] 1949 	jreq readln_loop
      008A26 7B 01            [ 1] 1950 	ld a,(RXCHAR,sp)
      008A28 90 F7            [ 1] 1951 	ld (y),a
      008A2A 0C 02            [ 1] 1952 	inc (LL,sp)
      008A2C 90 5C            [ 2] 1953 	incw y
      008A2E 90 7F            [ 1] 1954 	clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A30 CD 82 33         [ 4] 1955 	call putc 
      008A33 20 8B            [ 2] 1956 	jra readln_loop
      008A35                       1957 readln_quit:
      008A35 90 7F            [ 1] 1958 	clr (y)
      008A37 7B 02            [ 1] 1959 	ld a,(LL,sp)
      008A39 C7 00 04         [ 1] 1960 	ld count,a 
      0009BC                       1961 	_drop VSIZE 
      008A3C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A3E A6 0D            [ 1] 1962 	ld a,#CR
      008A40 CD 82 33         [ 4] 1963 	call putc
      008A43 81               [ 4] 1964 	ret
                                   1965 
                           000000  1966 .if DEBUG 	
                                   1967 ;----------------------------
                                   1968 ; command interface
                                   1969 ; only 3 commands:
                                   1970 ;  'q' to resume application
                                   1971 ;  'p [addr]' to print memory values 
                                   1972 ;  's addr' to print string 
                                   1973 ;----------------------------
                                   1974 ;local variable 
                                   1975 	PSIZE=1
                                   1976 	VSIZE=1 
                                   1977 cmd_itf:
                                   1978 	sub sp,#VSIZE 
                                   1979 	clr farptr 
                                   1980 	clr farptr+1 
                                   1981 	clr farptr+2  
                                   1982 repl:
                                   1983 	ld a,#CR 
                                   1984 	call putc 
                                   1985 	ld a,#'? 
                                   1986 	call putc
                                   1987 	clr in.w 
                                   1988 	clr in 
                                   1989 	call readln
                                   1990 	ldw y,#tib  
                                   1991 	ld a,(y)
                                   1992 	jreq repl  
                                   1993 	inc in 
                                   1994 	call to_upper 
                                   1995 	cp a,#'Q 
                                   1996 	jrne test_p
                                   1997 repl_exit:
                                   1998 	clr tib 
                                   1999 	clr count 
                                   2000 	clr in 
                                   2001 	_drop #VSIZE 	
                                   2002 	ret  
                                   2003 invalid:
                                   2004 	ldw x,#invalid_cmd 
                                   2005 	call puts 
                                   2006 	jra repl 
                                   2007 test_p:	
                                   2008     cp a,#'P 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2009 	jreq mem_peek
                                   2010     cp a,#'S 
                                   2011 	jrne invalid 
                                   2012 print_string:	
                                   2013 	call get_token
                                   2014 	cp a,#TK_INTGR 
                                   2015 	jrne invalid 
                                   2016 	call puts
                                   2017 	jp repl 	
                                   2018 mem_peek:
                                   2019 	ld a,#SPACE 
                                   2020 	call skip  	 
                                   2021 	addw y,in.w 
                                   2022 	ldw x,#pad 
                                   2023 	call strcpy
                                   2024 	call atoi24 	
                                   2025 	ld a, acc24 
                                   2026 	or a,acc16 
                                   2027 	or a,acc8 
                                   2028 	jrne 1$ 
                                   2029 	jra peek_byte  
                                   2030 1$:	ldw x,acc24 
                                   2031 	ldw farptr,x 
                                   2032 	ld a,acc8 
                                   2033 	ld farptr+2,a 
                                   2034 peek_byte:
                                   2035 	call print_farptr 
                                   2036 	ld a,#8 
                                   2037 	ld (PSIZE,sp),a 
                                   2038 	clrw x 
                                   2039 1$:	call fetchc  
                                   2040 	pushw x 
                                   2041 	ld acc8,a 
                                   2042 	clrw x 
                                   2043 	ldw acc24,x 
                                   2044 	ld a,#16+128
                                   2045 	call prti24
                                   2046 	popw x 
                                   2047 	dec (PSIZE,sp)
                                   2048 	jrne 1$ 
                                   2049 	ld a,#8 
                                   2050 	add a,farptr+2 
                                   2051 	ld farptr+2,a
                                   2052 	clr a 
                                   2053 	adc a,farptr+1 
                                   2054 	ld farptr+1,a 
                                   2055 	clr a 
                                   2056 	adc a,farptr 
                                   2057 	ld farptr,a 
                                   2058 	jp repl  
                                   2059 
                                   2060 invalid_cmd: .asciz "not a command\n" 
                                   2061 
                                   2062 ;----------------------------
                                   2063 ; display farptr address
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2064 ;----------------------------
                                   2065 print_farptr:
                                   2066 	ld a ,farptr+2 
                                   2067 	ld acc8,a 
                                   2068 	ldw x,farptr 
                                   2069 	ldw acc24,x 
                                   2070 	clrw x 
                                   2071 	ld a,#16 
                                   2072 	call prti24
                                   2073 	ld a,#SPACE 
                                   2074 	call putc 
                                   2075 	call putc 
                                   2076 	ret
                                   2077 
                                   2078 ;------------------------------------
                                   2079 ; get byte at address farptr[X]
                                   2080 ; input:
                                   2081 ;	 farptr   address to peek
                                   2082 ;    X		  farptr index 	
                                   2083 ; output:
                                   2084 ;	 A 		  byte from memory  
                                   2085 ;    x		  incremented by 1
                                   2086 ;------------------------------------
                                   2087 fetchc: ; @C
                                   2088 	ldf a,([farptr],x)
                                   2089 	incw x
                                   2090 	ret
                                   2091 
                                   2092 
                                   2093 ;------------------------------------
                                   2094 ; expect a number from command line 
                                   2095 ; next argument
                                   2096 ;  input:
                                   2097 ;	  none
                                   2098 ;  output:
                                   2099 ;    acc24   int24_t 
                                   2100 ;------------------------------------
                                   2101 number::
                                   2102 	call get_token
                                   2103 	call atoi24
                                   2104 	ret
                                   2105 .endif ; DEBUG 
                                   2106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2107 
                                   2108 
                                   2109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2110 ;; compiler routines        ;;
                                   2111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2112 ;------------------------------------
                                   2113 ; parse quoted string 
                                   2114 ; input:
                                   2115 ;   Y 	pointer to tib 
                                   2116 ;   X   pointer to pad
                                   2117 ; output:
                                   2118 ;	pad   parsed string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2119 ;   TOS  char* to pad  
                                   2120 ;------------------------------------
                           000001  2121 	PREV = 1
                           000002  2122 	CURR =2 
                           000002  2123 	VSIZE=2 
      008A44                       2124 parse_quote: ; { -- addr }
      0009C4                       2125 	_vars VSIZE 
      008A44 52 02            [ 2]    1     sub sp,#VSIZE 
      008A46 4F               [ 1] 2126 	clr a
      008A47 6B 01            [ 1] 2127 1$:	ld (PREV,sp),a 
      008A49 72 5C 00 02      [ 1] 2128 2$:	inc in
      008A4D 91 D6 01         [ 4] 2129 	ld a,([in.w],y)
      008A50 27 24            [ 1] 2130 	jreq 6$
      008A52 6B 02            [ 1] 2131 	ld (CURR,sp),a 
      008A54 A6 5C            [ 1] 2132 	ld a,#'\
      008A56 11 01            [ 1] 2133 	cp a, (PREV,sp)
      008A58 26 0A            [ 1] 2134 	jrne 3$
      008A5A 0F 01            [ 1] 2135 	clr (PREV,sp)
      008A5C 7B 02            [ 1] 2136 	ld a,(CURR,sp)
      008A5E AD 1F            [ 4] 2137 	callr convert_escape
      008A60 F7               [ 1] 2138 	ld (x),a 
      008A61 5C               [ 2] 2139 	incw x 
      008A62 20 E5            [ 2] 2140 	jra 2$
      008A64                       2141 3$:
      008A64 7B 02            [ 1] 2142 	ld a,(CURR,sp)
      008A66 A1 5C            [ 1] 2143 	cp a,#'\'
      008A68 27 DD            [ 1] 2144 	jreq 1$
      008A6A A1 22            [ 1] 2145 	cp a,#'"
      008A6C 27 04            [ 1] 2146 	jreq 5$ 
      008A6E F7               [ 1] 2147 	ld (x),a 
      008A6F 5C               [ 2] 2148 	incw x 
      008A70 20 D7            [ 2] 2149 	jra 2$
      008A72 72 5C 00 02      [ 1] 2150 5$:	inc in 
      008A76 7F               [ 1] 2151 6$: clr (x)
      008A77 AE 17 38         [ 2] 2152 	ldw x,#pad 
      0009FA                       2153 	_drop VSIZE
      008A7A 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A7C A6 0A            [ 1] 2154 	ld a,#TK_QSTR  
      008A7E 81               [ 4] 2155 	ret 
                                   2156 
                                   2157 ;---------------------------------------
                                   2158 ; called by parse_quote
                                   2159 ; subtitute escaped character 
                                   2160 ; by their ASCII value .
                                   2161 ; input:
                                   2162 ;   A  character following '\'
                                   2163 ; output:
                                   2164 ;   A  substitued char or same if not valid.
                                   2165 ;---------------------------------------
      008A7F                       2166 convert_escape:
      008A7F 89               [ 2] 2167 	pushw x 
      008A80 AE 8A 94         [ 2] 2168 	ldw x,#escaped 
      008A83 F1               [ 1] 2169 1$:	cp a,(x)
      008A84 27 06            [ 1] 2170 	jreq 2$
      008A86 7D               [ 1] 2171 	tnz (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008A87 27 09            [ 1] 2172 	jreq 3$
      008A89 5C               [ 2] 2173 	incw x 
      008A8A 20 F7            [ 2] 2174 	jra 1$
      008A8C 1D 8A 94         [ 2] 2175 2$: subw x,#escaped 
      008A8F 9F               [ 1] 2176 	ld a,xl 
      008A90 AB 07            [ 1] 2177 	add a,#7
      008A92 85               [ 2] 2178 3$:	popw x 
      008A93 81               [ 4] 2179 	ret 
                                   2180 
      008A94 61 62 74 6E 76 66 72  2181 escaped: .asciz "abtnvfr"
             00
                                   2182 
                                   2183 ;-------------------------
                                   2184 ; integer parser 
                                   2185 ; input:
                                   2186 ;   X 		point to pad 
                                   2187 ;   Y 		point to tib 
                                   2188 ;   A 	    first digit|'$' 
                                   2189 ; output:  
                                   2190 ;   pad     number string 
                                   2191 ;   X 		integer 
                                   2192 ;   A 		TK_INTGR
                                   2193 ;-------------------------
                           000001  2194 	BASE=1
                           000002  2195 	TCHAR=2 
                           000002  2196 	VSIZE=2 
      008A9C                       2197 parse_integer: ; { -- n }
      008A9C 4B 00            [ 1] 2198 	push #0 ; TCHAR 
      008A9E A1 24            [ 1] 2199 	cp a,#'$
      008AA0 27 04            [ 1] 2200 	jreq 1$ 
      008AA2 4B 0A            [ 1] 2201 	push #10 ; BASE=10 
      008AA4 20 02            [ 2] 2202 	jra 2$ 
      008AA6 4B 10            [ 1] 2203 1$: push #16  ; BASE=16
      008AA8 F7               [ 1] 2204 2$:	ld (x),a 
      008AA9 5C               [ 2] 2205 	incw x 
      008AAA 72 5C 00 02      [ 1] 2206 	inc in 
      008AAE 91 D6 01         [ 4] 2207 	ld a,([in.w],y)
      008AB1 CD 8C FA         [ 4] 2208 	call to_upper 
      008AB4 6B 02            [ 1] 2209 	ld (TCHAR,sp),a 
      008AB6 CD 8C F1         [ 4] 2210 	call is_digit 
      008AB9 25 ED            [ 1] 2211 	jrc 2$
      008ABB A6 10            [ 1] 2212 	ld a,#16 
      008ABD 11 01            [ 1] 2213 	cp a,(BASE,sp)
      008ABF 26 0A            [ 1] 2214 	jrne 3$ 
      008AC1 7B 02            [ 1] 2215 	ld a,(TCHAR,sp)
      008AC3 A1 41            [ 1] 2216 	cp a,#'A 
      008AC5 2B 04            [ 1] 2217 	jrmi 3$ 
      008AC7 A1 47            [ 1] 2218 	cp a,#'G 
      008AC9 2B DD            [ 1] 2219 	jrmi 2$ 
      008ACB 7F               [ 1] 2220 3$:	clr (x)
      008ACC CD 8D 06         [ 4] 2221 	call atoi24
      008ACF CE 00 0D         [ 2] 2222 	ldw x,acc16 
      008AD2 A6 04            [ 1] 2223 	ld a,#TK_INTGR
      000A54                       2224 	_drop VSIZE  
      008AD4 5B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008AD6 81               [ 4] 2225 	ret 	
                                   2226 
                                   2227 ;-------------------------
                                   2228 ; binary integer parser 
                                   2229 ; input:
                                   2230 ;   X 		point to pad 
                                   2231 ;   Y 		point to tib 
                                   2232 ;   A 	    '%' 
                                   2233 ; output:  
                                   2234 ;   pad     number string 
                                   2235 ;   X 		integer 
                                   2236 ;   A 		TK_INTGR
                                   2237 ;   TOS     integer 
                                   2238 ;-------------------------
                           000001  2239 	BINARY=1
                           000002  2240 	VSIZE=2
      008AD7                       2241 parse_binary: ; { -- n }
      008AD7 4B 00            [ 1] 2242 	push #0
      008AD9 4B 00            [ 1] 2243 	push #0
      008ADB F7               [ 1] 2244 1$: ld (x),a 
      008ADC 5C               [ 2] 2245 	incw x 
      008ADD 72 5C 00 02      [ 1] 2246 	inc in 
      008AE1 91 D6 01         [ 4] 2247 	ld a,([in.w],y)
      008AE4 A1 30            [ 1] 2248 	cp a,#'0 
      008AE6 27 06            [ 1] 2249 	jreq 2$
      008AE8 A1 31            [ 1] 2250 	cp a,#'1 
      008AEA 27 02            [ 1] 2251 	jreq 2$ 
      008AEC 20 09            [ 2] 2252 	jra bin_exit 
      008AEE A0 30            [ 1] 2253 2$: sub a,#'0	
      008AF0 46               [ 1] 2254 	rrc a 
      008AF1 09 02            [ 1] 2255 	rlc (BINARY+1,sp)
      008AF3 09 01            [ 1] 2256 	rlc (BINARY,sp)
      008AF5 20 E4            [ 2] 2257 	jra 1$  
      008AF7                       2258 bin_exit:
      008AF7 7F               [ 1] 2259 	clr (x)
      008AF8 1E 01            [ 2] 2260 	ldw x,(BINARY,sp)
      008AFA A6 04            [ 1] 2261 	ld a,#TK_INTGR 	
      000A7C                       2262 	_drop VSIZE 
      008AFC 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AFE 81               [ 4] 2263 	ret
                                   2264 
                                   2265 ;---------------------------
                                   2266 ;  token begin with a letter,
                                   2267 ;  is keyword or variable. 	
                                   2268 ; input:
                                   2269 ;   X 		point to pad 
                                   2270 ;   Y 		point to text
                                   2271 ;   A 	    first letter  
                                   2272 ; output:
                                   2273 ;   X		exec_addr|var_addr 
                                   2274 ;   A 		TK_CMD 
                                   2275 ;   pad 	keyword|var_name  
                                   2276 ;   TOS     exec_addr|var_addr 
                                   2277 ;--------------------------  
      008AFF                       2278 parse_keyword: ; { -- exec_addr|var_addr}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008AFF CD 8C FA         [ 4] 2279 	call to_upper 
      008B02 F7               [ 1] 2280 	ld (x),a 
      008B03 5C               [ 2] 2281 	incw x 
      008B04 72 5C 00 02      [ 1] 2282 	inc in 
      008B08 91 D6 01         [ 4] 2283 	ld a,([in.w],y)
      008B0B CD 84 FD         [ 4] 2284 	call is_alpha 
      008B0E 25 EF            [ 1] 2285 	jrc parse_keyword 
      008B10 7F               [ 1] 2286 1$: clr (x)
      008B11 72 5D 17 39      [ 1] 2287 	tnz pad+1 
      008B15 26 15            [ 1] 2288 	jrne 2$
                                   2289 ; one letter variable name 
      008B17 C6 17 38         [ 1] 2290 	ld a,pad 
      008B1A A0 41            [ 1] 2291 	sub a,#'A 
      008B1C 48               [ 1] 2292 	sll a 
      008B1D 88               [ 1] 2293 	push a 
      008B1E 4B 00            [ 1] 2294 	push #0
      008B20 AE 00 29         [ 2] 2295 	ldw x,#vars 
      008B23 72 FB 01         [ 2] 2296 	addw x,(1,sp) ; X=var address 
      000AA6                       2297 	_drop 2 
      008B26 5B 02            [ 2]    1     addw sp,#2 
      008B28 A6 05            [ 1] 2298 	ld a,#TK_VAR 
      008B2A 20 0C            [ 2] 2299 	jra 4$ 
      008B2C                       2300 2$: ; check for keyword, otherwise syntax error.
      000AAC                       2301 	_ldx_dict kword_dict
      008B2C AE A5 10         [ 2]    1     ldw x,#kword_dict+2
      008B2F CD 8E A2         [ 4] 2302 	call search_dict
      008B32 4D               [ 1] 2303 	tnz a
      008B33 26 03            [ 1] 2304 	jrne 4$ 
      008B35 CC 87 81         [ 2] 2305 	jp syntax_error
      008B38 81               [ 4] 2306 4$:	ret  	
                                   2307 
                                   2308 
                                   2309 ;------------------------------------
                                   2310 ; scan text for next token
                                   2311 ; move token in 'pad'
                                   2312 ; input: 
      008B39                       2313 	none: 
                                   2314 ; use:
                                   2315 ;	Y   pointer to text
                                   2316 ;   X	pointer to pad 
                                   2317 ;   in.w   index in text buffer
                                   2318 ; output:
                                   2319 ;   A       token attribute 
                                   2320 ;   pad 	token as .asciz
                                   2321 ;   X 		token value   
                                   2322 ;------------------------------------
                                   2323 	; use to check special character 
                                   2324 	.macro _case c t  
                                   2325 	ld a,#c 
                                   2326 	cp a,(TCHAR,sp) 
                                   2327 	jrne t
                                   2328 	.endm 
                                   2329 
                           000001  2330 	TCHAR=1
                           000002  2331 	ATTRIB=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                           000002  2332 	VSIZE=2
      008B39                       2333 get_token: 
      008B39 90 AE 16 E8      [ 2] 2334 	ldw y,#tib    	
      008B3D C6 00 02         [ 1] 2335 	ld a,in 
      008B40 C1 00 04         [ 1] 2336 	cp a,count 
      008B43 2B 03            [ 1] 2337 	jrmi 1$
      008B45 A6 00            [ 1] 2338 	ld a,#TK_NONE 
      008B47 81               [ 4] 2339 	ret 
      008B48                       2340 1$:	
      000AC8                       2341 	_vars VSIZE
      008B48 52 02            [ 2]    1     sub sp,#VSIZE 
      008B4A AE 17 38         [ 2] 2342 	ldw x, #pad
      008B4D A6 20            [ 1] 2343 	ld a,#SPACE
      008B4F CD 8D B2         [ 4] 2344 	call skip
      008B52 55 00 02 00 03   [ 1] 2345 	mov in.saved,in 
      008B57 91 D6 01         [ 4] 2346 	ld a,([in.w],y)
      008B5A 26 07            [ 1] 2347 	jrne str_tst
      008B5C 72 5F 17 38      [ 1] 2348 	clr pad 
      008B60 CC 8C EE         [ 2] 2349 	jp token_exit ; end of line 
                                   2350 
      008B63                       2351 str_tst: ; check for quoted string  	
      008B63 CD 8C FA         [ 4] 2352 	call to_upper 
      008B66 6B 01            [ 1] 2353 	ld (TCHAR,sp),a 
      000AE8                       2354 	_case '"' nbr_tst
      008B68 A6 22            [ 1]    1 	ld a,#'"' 
      008B6A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008B6C 26 06            [ 1]    3 	jrne nbr_tst
      008B6E CD 8A 44         [ 4] 2355 	call parse_quote
      008B71 CC 8C EE         [ 2] 2356 	jp token_exit
      008B74                       2357 nbr_tst: ; check for number 
      008B74 A6 24            [ 1] 2358 	ld a,#'$'
      008B76 11 01            [ 1] 2359 	cp a,(TCHAR,sp) 
      008B78 27 13            [ 1] 2360 	jreq 1$
      008B7A A6 26            [ 1] 2361 	ld a,#'&
      008B7C 11 01            [ 1] 2362 	cp a,(TCHAR,sp)
      008B7E 26 06            [ 1] 2363 	jrne 0$
      008B80 CD 8A D7         [ 4] 2364 	call parse_binary ; expect binary integer 
      008B83 CC 8C EE         [ 2] 2365 	jp token_exit 
      008B86 7B 01            [ 1] 2366 0$:	ld a,(TCHAR,sp)
      008B88 CD 8C F1         [ 4] 2367 	call is_digit
      008B8B 24 06            [ 1] 2368 	jrnc 3$
      008B8D CD 8A 9C         [ 4] 2369 1$:	call parse_integer 
      008B90 CC 8C EE         [ 2] 2370 	jp token_exit 
      008B93                       2371 3$: 
      000B13                       2372 	_case '(' bkslsh_tst 
      008B93 A6 28            [ 1]    1 	ld a,#'(' 
      008B95 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008B97 26 05            [ 1]    3 	jrne bkslsh_tst
      008B99 A6 0B            [ 1] 2373 	ld a,#TK_LPAREN
      008B9B CC 8C DE         [ 2] 2374 	jp token_char   	
      008B9E                       2375 bkslsh_tst: ; character token 
      000B1E                       2376 	_case '\',rparnt_tst
      008B9E A6 5C            [ 1]    1 	ld a,#'\' 
      008BA0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BA2 26 18            [ 1]    3 	jrne rparnt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008BA4 7B 01            [ 1] 2377 	ld a,(TCHAR,sp)
      008BA6 F7               [ 1] 2378 	ld (x),a 
      008BA7 5C               [ 2] 2379 	incw x 
      008BA8 72 5C 00 02      [ 1] 2380 	inc in 
      008BAC 91 D6 01         [ 4] 2381 	ld a,([in.w],y)
      008BAF F7               [ 1] 2382 	ld (x),a 
      008BB0 5C               [ 2] 2383 	incw x 
      008BB1 72 5C 00 02      [ 1] 2384 	inc in  
      008BB5 7F               [ 1] 2385 	clr (x) 
      008BB6 97               [ 1] 2386 	ld xl,a 
      008BB7 A6 03            [ 1] 2387 	ld a,#TK_CHAR 
      008BB9 CC 8C EE         [ 2] 2388 	jp token_exit 
      008BBC                       2389 rparnt_tst:		
      000B3C                       2390 	_case ')' colon_tst 
      008BBC A6 29            [ 1]    1 	ld a,#')' 
      008BBE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BC0 26 05            [ 1]    3 	jrne colon_tst
      008BC2 A6 0C            [ 1] 2391 	ld a,#TK_RPAREN 
      008BC4 CC 8C DE         [ 2] 2392 	jp token_char 
      008BC7                       2393 colon_tst:
      000B47                       2394 	_case ':' comma_tst 
      008BC7 A6 3A            [ 1]    1 	ld a,#':' 
      008BC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BCB 26 05            [ 1]    3 	jrne comma_tst
      008BCD A6 01            [ 1] 2395 	ld a,#TK_COLON 
      008BCF CC 8C DE         [ 2] 2396 	jp token_char 
      008BD2                       2397 comma_tst:
      000B52                       2398 	_case COMMA sharp_tst 
      008BD2 A6 2C            [ 1]    1 	ld a,#COMMA 
      008BD4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BD6 26 05            [ 1]    3 	jrne sharp_tst
      008BD8 A6 0D            [ 1] 2399 	ld a,#TK_COMMA
      008BDA CC 8C DE         [ 2] 2400 	jp token_char
      008BDD                       2401 sharp_tst:
      000B5D                       2402 	_case SHARP dash_tst 
      008BDD A6 23            [ 1]    1 	ld a,#SHARP 
      008BDF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BE1 26 05            [ 1]    3 	jrne dash_tst
      008BE3 A6 0E            [ 1] 2403 	ld a,#TK_SHARP
      008BE5 CC 8C DE         [ 2] 2404 	jp token_char  	 	 
      008BE8                       2405 dash_tst: 	
      000B68                       2406 	_case '-' at_tst 
      008BE8 A6 2D            [ 1]    1 	ld a,#'-' 
      008BEA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BEC 26 05            [ 1]    3 	jrne at_tst
      008BEE A6 11            [ 1] 2407 	ld a,#TK_MINUS  
      008BF0 CC 8C DE         [ 2] 2408 	jp token_char 
      008BF3                       2409 at_tst:
      000B73                       2410 	_case '@' qmark_tst 
      008BF3 A6 40            [ 1]    1 	ld a,#'@' 
      008BF5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF7 26 05            [ 1]    3 	jrne qmark_tst
      008BF9 A6 02            [ 1] 2411 	ld a,#TK_ARRAY 
      008BFB CC 8C DE         [ 2] 2412 	jp token_char
      008BFE                       2413 qmark_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      000B7E                       2414 	_case '?' tick_tst 
      008BFE A6 3F            [ 1]    1 	ld a,#'?' 
      008C00 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C02 26 11            [ 1]    3 	jrne tick_tst
      008C04 7B 01            [ 1] 2415 	ld a,(TCHAR,sp)
      008C06 F7               [ 1] 2416 	ld (x),a 
      008C07 5C               [ 2] 2417 	incw x 
      008C08 7F               [ 1] 2418 	clr (x)
      008C09 72 5C 00 02      [ 1] 2419 	inc in 
      008C0D A6 06            [ 1] 2420 	ld a,#TK_CMD 
      008C0F AE 93 D8         [ 2] 2421 	ldw x,#print 
      008C12 CC 8C EE         [ 2] 2422 	jp token_exit
      008C15                       2423 tick_tst: ; ignore comment 
      000B95                       2424 	_case TICK plus_tst 
      008C15 A6 27            [ 1]    1 	ld a,#TICK 
      008C17 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C19 26 0C            [ 1]    3 	jrne plus_tst
      008C1B 72 5C 00 02      [ 1] 2425 	inc in 
      008C1F A6 06            [ 1] 2426 	ld a,#TK_CMD 
      008C21 AE 94 C6         [ 2] 2427 	ldw x,#rem 
      008C24 CC 8C EE         [ 2] 2428 	jp token_exit 
      008C27                       2429 plus_tst:
      000BA7                       2430 	_case '+' star_tst 
      008C27 A6 2B            [ 1]    1 	ld a,#'+' 
      008C29 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C2B 26 05            [ 1]    3 	jrne star_tst
      008C2D A6 10            [ 1] 2431 	ld a,#TK_PLUS  
      008C2F CC 8C DE         [ 2] 2432 	jp token_char 
      008C32                       2433 star_tst:
      000BB2                       2434 	_case '*' slash_tst 
      008C32 A6 2A            [ 1]    1 	ld a,#'*' 
      008C34 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C36 26 05            [ 1]    3 	jrne slash_tst
      008C38 A6 20            [ 1] 2435 	ld a,#TK_MULT 
      008C3A CC 8C DE         [ 2] 2436 	jp token_char 
      008C3D                       2437 slash_tst: 
      000BBD                       2438 	_case '/' prcnt_tst 
      008C3D A6 2F            [ 1]    1 	ld a,#'/' 
      008C3F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C41 26 05            [ 1]    3 	jrne prcnt_tst
      008C43 A6 21            [ 1] 2439 	ld a,#TK_DIV 
      008C45 CC 8C DE         [ 2] 2440 	jp token_char 
      008C48                       2441 prcnt_tst:
      000BC8                       2442 	_case '%' eql_tst 
      008C48 A6 25            [ 1]    1 	ld a,#'%' 
      008C4A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4C 26 05            [ 1]    3 	jrne eql_tst
      008C4E A6 22            [ 1] 2443 	ld a,#TK_MOD
      008C50 CC 8C DE         [ 2] 2444 	jp token_char  
                                   2445 ; 1 or 2 character tokens 	
      008C53                       2446 eql_tst:
      000BD3                       2447 	_case '=' gt_tst 		
      008C53 A6 3D            [ 1]    1 	ld a,#'=' 
      008C55 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C57 26 05            [ 1]    3 	jrne gt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008C59 A6 32            [ 1] 2448 	ld a,#TK_EQUAL
      008C5B CC 8C DE         [ 2] 2449 	jp token_char 
      008C5E                       2450 gt_tst:
      000BDE                       2451 	_case '>' lt_tst 
      008C5E A6 3E            [ 1]    1 	ld a,#'>' 
      008C60 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C62 26 33            [ 1]    3 	jrne lt_tst
      008C64 A6 31            [ 1] 2452 	ld a,#TK_GT 
      008C66 6B 02            [ 1] 2453 	ld (ATTRIB,sp),a 
      008C68 72 5C 00 02      [ 1] 2454 	inc in 
      008C6C 91 D6 01         [ 4] 2455 	ld a,([in.w],y)
      008C6F A1 3D            [ 1] 2456 	cp a,#'=
      008C71 26 0C            [ 1] 2457 	jrne 1$
      008C73 7B 01            [ 1] 2458 	ld a,(TCHAR,sp)
      008C75 F7               [ 1] 2459 	ld (x),a
      008C76 5C               [ 2] 2460 	incw x 
      008C77 A6 3D            [ 1] 2461 	ld a,#'=
      008C79 6B 01            [ 1] 2462 	ld (TCHAR,sp),a 
      008C7B A6 33            [ 1] 2463 	ld a,#TK_GE 
      008C7D 20 5F            [ 2] 2464 	jra token_char  
      008C7F A1 3C            [ 1] 2465 1$: cp a,#'<
      008C81 26 0C            [ 1] 2466 	jrne 2$
      008C83 7B 01            [ 1] 2467 	ld a,(TCHAR,sp)
      008C85 F7               [ 1] 2468 	ld (x),a
      008C86 5C               [ 2] 2469 	incw x 
      008C87 A6 3C            [ 1] 2470 	ld a,#'<	
      008C89 6B 01            [ 1] 2471 	ld (TCHAR,sp),a 
      008C8B A6 35            [ 1] 2472 	ld a,#TK_NE 
      008C8D 20 4F            [ 2] 2473 	jra token_char 
      008C8F 72 5A 00 02      [ 1] 2474 2$: dec in
      008C93 7B 02            [ 1] 2475 	ld a,(ATTRIB,sp)
      008C95 20 47            [ 2] 2476 	jra token_char 
      008C97                       2477 lt_tst:
      000C17                       2478 	_case '<' other
      008C97 A6 3C            [ 1]    1 	ld a,#'<' 
      008C99 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9B 26 32            [ 1]    3 	jrne other
      008C9D A6 34            [ 1] 2479 	ld a,#TK_LT 
      008C9F 6B 02            [ 1] 2480 	ld (ATTRIB,sp),a 
      008CA1 72 5C 00 02      [ 1] 2481 	inc in 
      008CA5 91 D6 01         [ 4] 2482 	ld a,([in.w],y)
      008CA8 A1 3D            [ 1] 2483 	cp a,#'=
      008CAA 26 0B            [ 1] 2484 	jrne 1$
      008CAC 7B 01            [ 1] 2485 	ld a,(TCHAR,sp)
      008CAE F7               [ 1] 2486 	ld (x),a 
      008CAF A6 3D            [ 1] 2487 	ld a,#'=
      008CB1 6B 01            [ 1] 2488 	ld (TCHAR,sp),a 
      008CB3 A6 36            [ 1] 2489 	ld a,#TK_LE 
      008CB5 20 27            [ 2] 2490 	jra token_char 
      008CB7 A1 3E            [ 1] 2491 1$: cp a,#'>
      008CB9 26 0C            [ 1] 2492 	jrne 2$
      008CBB 7B 01            [ 1] 2493 	ld a,(TCHAR,sp)
      008CBD F7               [ 1] 2494 	ld (x),a 
      008CBE 5C               [ 2] 2495 	incw x 
      008CBF A6 3E            [ 1] 2496 	ld a,#'>
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008CC1 6B 01            [ 1] 2497 	ld (TCHAR,sp),a 
      008CC3 A6 35            [ 1] 2498 	ld a,#TK_NE 
      008CC5 20 17            [ 2] 2499 	jra token_char 
      008CC7 72 5A 00 02      [ 1] 2500 2$: dec in 
      008CCB 7B 02            [ 1] 2501 	ld a,(ATTRIB,sp)
      008CCD 20 0F            [ 2] 2502 	jra token_char 	
      008CCF                       2503 other: ; not a special character 	 
      008CCF 7B 01            [ 1] 2504 	ld a,(TCHAR,sp)
      008CD1 CD 84 FD         [ 4] 2505 	call is_alpha 
      008CD4 25 03            [ 1] 2506 	jrc 30$ 
      008CD6 CC 87 81         [ 2] 2507 	jp syntax_error 
      008CD9                       2508 30$: 
      008CD9 CD 8A FF         [ 4] 2509 	call parse_keyword
      008CDC 20 10            [ 2] 2510 	jra token_exit 
      008CDE                       2511 token_char:
      008CDE 6B 02            [ 1] 2512 	ld (ATTRIB,sp),a 
      008CE0 7B 01            [ 1] 2513 	ld a,(TCHAR,sp)
      008CE2 F7               [ 1] 2514 	ld (x),a 
      008CE3 5C               [ 2] 2515 	incw x 
      008CE4 7F               [ 1] 2516 	clr(x)
      008CE5 72 5C 00 02      [ 1] 2517 	inc in 
      008CE9 7B 02            [ 1] 2518 	ld a,(ATTRIB,sp)
      008CEB AE 17 38         [ 2] 2519 	ldw x,#pad 
      008CEE                       2520 token_exit:
      000C6E                       2521 	_drop VSIZE 
      008CEE 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CF0 81               [ 4] 2522 	ret
                                   2523 
                                   2524 ;------------------------------------
                                   2525 ; check if character in {'0'..'9'}
                                   2526 ; input:
                                   2527 ;    A  character to test
                                   2528 ; output:
                                   2529 ;    Carry  0 not digit | 1 digit
                                   2530 ;------------------------------------
      008CF1                       2531 is_digit:
      008CF1 A1 30            [ 1] 2532 	cp a,#'0
      008CF3 25 03            [ 1] 2533 	jrc 1$
      008CF5 A1 3A            [ 1] 2534     cp a,#'9+1
      008CF7 8C               [ 1] 2535 	ccf 
      008CF8 8C               [ 1] 2536 1$:	ccf 
      008CF9 81               [ 4] 2537     ret
                                   2538 
                                   2539 ;------------------------------------
                                   2540 ; convert alpha to uppercase
                                   2541 ; input:
                                   2542 ;    a  character to convert
                                   2543 ; output:
                                   2544 ;    a  uppercase character
                                   2545 ;------------------------------------
      008CFA                       2546 to_upper::
      008CFA A1 61            [ 1] 2547 	cp a,#'a
      008CFC 2A 01            [ 1] 2548 	jrpl 1$
      008CFE 81               [ 4] 2549 0$:	ret
      008CFF A1 7A            [ 1] 2550 1$: cp a,#'z	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008D01 22 FB            [ 1] 2551 	jrugt 0$
      008D03 A0 20            [ 1] 2552 	sub a,#32
      008D05 81               [ 4] 2553 	ret
                                   2554 	
                                   2555 ;------------------------------------
                                   2556 ; convert pad content in integer
                                   2557 ; input:
                                   2558 ;    pad		.asciz to convert
                                   2559 ; output:
                                   2560 ;    acc24      int24_t
                                   2561 ;------------------------------------
                                   2562 	; local variables
                           000001  2563 	SIGN=1 ; 1 byte, 
                           000002  2564 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2565 	TEMP=3 ; 1 byte, temporary storage
                           000003  2566 	VSIZE=3 ; 3 bytes reserved for local storage
      008D06                       2567 atoi24:
      008D06 89               [ 2] 2568 	pushw x ;save x
      008D07 52 03            [ 2] 2569 	sub sp,#VSIZE
                                   2570 	; acc24=0 
      008D09 72 5F 00 0C      [ 1] 2571 	clr acc24    
      008D0D 72 5F 00 0D      [ 1] 2572 	clr acc16
      008D11 72 5F 00 0E      [ 1] 2573 	clr acc8 
      008D15 C6 17 38         [ 1] 2574 	ld a, pad 
      008D18 27 5A            [ 1] 2575 	jreq atoi_exit
      008D1A 0F 01            [ 1] 2576 	clr (SIGN,sp)
      008D1C A6 0A            [ 1] 2577 	ld a,#10
      008D1E 6B 02            [ 1] 2578 	ld (BASE,sp),a ; default base decimal
      008D20 AE 17 38         [ 2] 2579 	ldw x,#pad ; pointer to string to convert
      008D23 F6               [ 1] 2580 	ld a,(x)
      008D24 27 47            [ 1] 2581 	jreq 9$  ; completed if 0
      008D26 A1 2D            [ 1] 2582 	cp a,#'-
      008D28 26 04            [ 1] 2583 	jrne 1$
      008D2A 03 01            [ 1] 2584 	cpl (SIGN,sp)
      008D2C 20 08            [ 2] 2585 	jra 2$
      008D2E A1 24            [ 1] 2586 1$: cp a,#'$
      008D30 26 06            [ 1] 2587 	jrne 3$
      008D32 A6 10            [ 1] 2588 	ld a,#16
      008D34 6B 02            [ 1] 2589 	ld (BASE,sp),a
      008D36 5C               [ 2] 2590 2$:	incw x
      008D37 F6               [ 1] 2591 	ld a,(x)
      008D38                       2592 3$:	
      008D38 A1 61            [ 1] 2593 	cp a,#'a
      008D3A 2B 02            [ 1] 2594 	jrmi 4$
      008D3C A0 20            [ 1] 2595 	sub a,#32
      008D3E A1 30            [ 1] 2596 4$:	cp a,#'0
      008D40 2B 2B            [ 1] 2597 	jrmi 9$
      008D42 A0 30            [ 1] 2598 	sub a,#'0
      008D44 A1 0A            [ 1] 2599 	cp a,#10
      008D46 2B 06            [ 1] 2600 	jrmi 5$
      008D48 A0 07            [ 1] 2601 	sub a,#7
      008D4A 11 02            [ 1] 2602 	cp a,(BASE,sp)
      008D4C 2A 1F            [ 1] 2603 	jrpl 9$
      008D4E 6B 03            [ 1] 2604 5$:	ld (TEMP,sp),a
      008D50 7B 02            [ 1] 2605 	ld a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008D52 CD 8D 78         [ 4] 2606 	call mulu24_8
      008D55 7B 03            [ 1] 2607 	ld a,(TEMP,sp)
      008D57 CB 00 0E         [ 1] 2608 	add a,acc24+2
      008D5A C7 00 0E         [ 1] 2609 	ld acc24+2,a
      008D5D 4F               [ 1] 2610 	clr a
      008D5E C9 00 0D         [ 1] 2611 	adc a,acc24+1
      008D61 C7 00 0D         [ 1] 2612 	ld acc24+1,a
      008D64 4F               [ 1] 2613 	clr a
      008D65 C9 00 0C         [ 1] 2614 	adc a,acc24
      008D68 C7 00 0C         [ 1] 2615 	ld acc24,a
      008D6B 20 C9            [ 2] 2616 	jra 2$
      008D6D 0D 01            [ 1] 2617 9$:	tnz (SIGN,sp)
      008D6F 27 03            [ 1] 2618     jreq atoi_exit
      008D71 CD 89 97         [ 4] 2619     call neg_acc24
      008D74                       2620 atoi_exit: 
      008D74 5B 03            [ 2] 2621 	addw sp,#VSIZE
      008D76 85               [ 2] 2622 	popw x ; restore x
      008D77 81               [ 4] 2623 	ret
                                   2624 
                                   2625 ;--------------------------------------
                                   2626 ; unsigned multiply uint24_t by uint8_t
                                   2627 ; use to convert numerical string to uint24_t
                                   2628 ; input:
                                   2629 ;	acc24	uint24_t 
                                   2630 ;   A		uint8_t
                                   2631 ; output:
                                   2632 ;   acc24   A*acc24
                                   2633 ;-------------------------------------
                                   2634 ; local variables offset  on sp
                           000003  2635 	U8   = 3   ; A pushed on stack
                           000002  2636 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2637 	OVFH = 1  ; multiplication overflow high byte
                           000003  2638 	VSIZE = 3
      008D78                       2639 mulu24_8:
      008D78 89               [ 2] 2640 	pushw x    ; save X
                                   2641 	; local variables
      008D79 88               [ 1] 2642 	push a     ; U8
      008D7A 5F               [ 1] 2643 	clrw x     ; initialize overflow to 0
      008D7B 89               [ 2] 2644 	pushw x    ; multiplication overflow
                                   2645 ; multiply low byte.
      008D7C C6 00 0E         [ 1] 2646 	ld a,acc24+2
      008D7F 97               [ 1] 2647 	ld xl,a
      008D80 7B 03            [ 1] 2648 	ld a,(U8,sp)
      008D82 42               [ 4] 2649 	mul x,a
      008D83 9F               [ 1] 2650 	ld a,xl
      008D84 C7 00 0E         [ 1] 2651 	ld acc24+2,a
      008D87 9E               [ 1] 2652 	ld a, xh
      008D88 6B 02            [ 1] 2653 	ld (OVFL,sp),a
                                   2654 ; multipy middle byte
      008D8A C6 00 0D         [ 1] 2655 	ld a,acc24+1
      008D8D 97               [ 1] 2656 	ld xl,a
      008D8E 7B 03            [ 1] 2657 	ld a, (U8,sp)
      008D90 42               [ 4] 2658 	mul x,a
                                   2659 ; add overflow to this partial product
      008D91 72 FB 01         [ 2] 2660 	addw x,(OVFH,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D94 9F               [ 1] 2661 	ld a,xl
      008D95 C7 00 0D         [ 1] 2662 	ld acc24+1,a
      008D98 4F               [ 1] 2663 	clr a
      008D99 A9 00            [ 1] 2664 	adc a,#0
      008D9B 6B 01            [ 1] 2665 	ld (OVFH,sp),a
      008D9D 9E               [ 1] 2666 	ld a,xh
      008D9E 6B 02            [ 1] 2667 	ld (OVFL,sp),a
                                   2668 ; multiply most signficant byte	
      008DA0 C6 00 0C         [ 1] 2669 	ld a, acc24
      008DA3 97               [ 1] 2670 	ld xl, a
      008DA4 7B 03            [ 1] 2671 	ld a, (U8,sp)
      008DA6 42               [ 4] 2672 	mul x,a
      008DA7 72 FB 01         [ 2] 2673 	addw x, (OVFH,sp)
      008DAA 9F               [ 1] 2674 	ld a, xl
      008DAB C7 00 0C         [ 1] 2675 	ld acc24,a
      008DAE 5B 03            [ 2] 2676     addw sp,#VSIZE
      008DB0 85               [ 2] 2677 	popw x
      008DB1 81               [ 4] 2678 	ret
                                   2679 
                                   2680 ;------------------------------------
                                   2681 ; skip character c in text starting from 'in'
                                   2682 ; input:
                                   2683 ;	 y 		point to text buffer
                                   2684 ;    a 		character to skip
                                   2685 ; output:  
                                   2686 ;	'in' ajusted to new position
                                   2687 ;------------------------------------
                           000001  2688 	C = 1 ; local var
      008DB2                       2689 skip:
      008DB2 88               [ 1] 2690 	push a
      008DB3 91 D6 01         [ 4] 2691 1$:	ld a,([in.w],y)
      008DB6 27 0A            [ 1] 2692 	jreq 2$
      008DB8 11 01            [ 1] 2693 	cp a,(C,sp)
      008DBA 26 06            [ 1] 2694 	jrne 2$
      008DBC 72 5C 00 02      [ 1] 2695 	inc in
      008DC0 20 F1            [ 2] 2696 	jra 1$
      000D42                       2697 2$: _drop 1 
      008DC2 5B 01            [ 2]    1     addw sp,#1 
      008DC4 81               [ 4] 2698 	ret
                                   2699 	
                                   2700 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2701 ;;   TINY BASIC  operators,
                                   2702 ;;   commands and functions 
                                   2703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2704 
                                   2705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2706 ;;  Arithmetic operators
                                   2707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2708 
                                   2709 ;--------------------------------
                                   2710 ;  add 2 integers
                                   2711 ;  input:
                                   2712 ;    N1     on cstack 
                                   2713 ;    N2     on cstack 
                                   2714 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2715 ;    X 		n2+n1 
                                   2716 ;--------------------------------
                                   2717 	;arugments on cstack 
      008DC5                       2718 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000D45                       2719 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000D45                       2720 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000D45                       2721 add:
      008DC5 1E 05            [ 2] 2722 	ldw x ,(N2,sp)
      008DC7 72 FB 03         [ 2] 2723 	addw x,(N1,sp)
      008DCA 1F 03            [ 2] 2724 	ldw (N1,sp),x 
      008DCC 81               [ 4] 2725 	ret 
                                   2726 
                                   2727 ;--------------------------------
                                   2728 ;  substract 2 ntegers
                                   2729 ;  input:
                                   2730 ;    N1     on cstack 
                                   2731 ;    N2     on cstack 
                                   2732 ;  output:
                                   2733 ;    X 		n2+n1 
                                   2734 ;--------------------------------
      008DCD                       2735 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000D4D                       2736 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000D4D                       2737 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000D4D                       2738 substract:
      008DCD 1E 05            [ 2] 2739 	ldw x,(N2,sp)
      008DCF 72 F0 03         [ 2] 2740 	subw x,(N1,sp)
      008DD2 81               [ 4] 2741 	ret 
                                   2742 
                                   2743 ;-------------------------------------
                                   2744 ; multiply 2 integers
                                   2745 ; product overflow is ignored unless
                                   2746 ; MATH_OVF assembler flag is set to 1
                                   2747 ; input:
                                   2748 ;  	N1      on cstack
                                   2749 ;   N2 		on cstack 
                                   2750 ; output:
                                   2751 ;	X        N1*N2 
                                   2752 ;-------------------------------------
                                   2753 	;arguments 
      008DD3                       2754 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000D53                       2755 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000D53                       2756 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000D53                       2757 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000D53                       2758 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2759    ; local variables 
                           000001  2760 	SIGN=1
                           000002  2761 	PROD=2
                           000003  2762 	VSIZE=3
      000D53                       2763 multiply:
      000D53                       2764 	_vars VSIZE 
      008DD3 52 03            [ 2]    1     sub sp,#VSIZE 
      008DD5 0F 01            [ 1] 2765 	clr (SIGN,sp)
      008DD7 1E 06            [ 2] 2766 	ldw x,(N1_HB,sp)
      008DD9 9E               [ 1] 2767 	ld a,xh  
      008DDA A5 80            [ 1] 2768 	bcp a,#0x80 
      008DDC 27 05            [ 1] 2769 	jreq 2$
      008DDE 03 01            [ 1] 2770 	cpl (SIGN,sp)
      008DE0 50               [ 2] 2771 	negw x 
      008DE1 1F 06            [ 2] 2772 	ldw (N1_HB,sp),x 
      008DE3 1E 08            [ 2] 2773 2$: ldw x,(N2_HB,sp)
      008DE5 9E               [ 1] 2774 	ld a,xh  
      008DE6 A5 80            [ 1] 2775 	bcp a,#0x80 
      008DE8 27 05            [ 1] 2776 	jreq 3$
      008DEA 03 01            [ 1] 2777 	cpl (SIGN,sp)
      008DEC 50               [ 2] 2778 	negw x 
      008DED 1F 08            [ 2] 2779 	ldw (N2_HB,sp),x 
                                   2780 ; N1_LB * N2_LB 	
      008DEF 7B 07            [ 1] 2781 3$:	ld a,(N1_LB,sp)
      008DF1 97               [ 1] 2782 	ld xl,a 
      008DF2 7B 09            [ 1] 2783 	ld a,(N2_LB,sp) 
      008DF4 42               [ 4] 2784 	mul x,a 
                           000000  2785 .if MATH_OVF 	
                                   2786 	ld a,xh 
                                   2787 	bcp a,#0x80 
                                   2788 	jreq 4$ 
                                   2789 	ld a,#ERR_MATH_OVF 
                                   2790 	jp tb_error
                                   2791 .endif 	 
      008DF5 1F 02            [ 2] 2792 4$:	ldw (PROD,sp),x
                                   2793 ; N1_LB * N2_HB	 
      008DF7 7B 07            [ 1] 2794 	ld a,(N1_LB,sp) 
      008DF9 97               [ 1] 2795 	ld xl,a 
      008DFA 7B 08            [ 1] 2796 	ld a,(N2_HB,sp)
      008DFC 42               [ 4] 2797 	mul x,a
      008DFD 9F               [ 1] 2798 	ld a,xl 
      008DFE 1B 02            [ 1] 2799 	add a,(PROD,sp)
                           000000  2800 .if MATH_OVF 	
                                   2801 	bcp a,#0x80 
                                   2802 	jreq 5$ 
                                   2803 	ld a,#ERR_MATH_OVF 
                                   2804 	jp tb_error
                                   2805 .endif 	 
      008E00 6B 02            [ 1] 2806 5$:	ld (PROD,sp),a 
                                   2807 ; N1_HB * N2_LB 
      008E02 7B 06            [ 1] 2808 	ld a,(N1_HB,sp)
      008E04 97               [ 1] 2809 	ld xl,a 
      008E05 7B 09            [ 1] 2810 	ld a,(N2_LB,sp)
      008E07 42               [ 4] 2811 	mul x,a 
      008E08 9F               [ 1] 2812 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008E09 1B 02            [ 1] 2813 	add a,(PROD,sp)
                           000000  2814 .if MATH_OVF 	
                                   2815 	bcp a,#0x80 
                                   2816 	jreq 6$ 
                                   2817 	ld a,#ERR_MATH_OVF 
                                   2818 	jp tb_error
                                   2819 .endif 	 
      008E0B 6B 02            [ 1] 2820 6$:	ld (PROD,sp),a 
                                   2821 ; N1_HB * N2_HB 	
                                   2822 ; it is pointless to multiply N1_HB*N2_HB 
                                   2823 ; as this product is over 65535 or 0 
                                   2824 ;
                                   2825 ; sign adjust product
      008E0D 0D 01            [ 1] 2826 	tnz (SIGN,sp)
      008E0F 27 05            [ 1] 2827 	jreq 7$
      008E11 1E 02            [ 2] 2828 	ldw x, (PROD,sp)
      008E13 50               [ 2] 2829 	negw x
      008E14 1F 02            [ 2] 2830 	ldw (PROD,sp),x  
      008E16                       2831 7$: 
      008E16 1E 02            [ 2] 2832 	ldw x,(PROD,sp) 
      000D98                       2833 	_drop VSIZE 
      008E18 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E1A 81               [ 4] 2834 	ret
                                   2835 
                                   2836 ;----------------------------------
                                   2837 ;  euclidian divide n2/n1 
                                   2838 ; input:
                                   2839 ;    N2 	on cstack
                                   2840 ;    N1 	on cstack
                                   2841 ; output:
                                   2842 ;    X      n2/n1 
                                   2843 ;    Y      remainder 
                                   2844 ;----------------------------------
      008E1B                       2845 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000D9B                       2846 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000D9B                       2847 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2848 	; local variables
                           000001  2849 	SQUOT=1 ; sign quotient
                           000002  2850 	SDIVD=2 ; sign dividend  
                           000002  2851 	VSIZE=2
      000D9B                       2852 divide:
      000D9B                       2853 	_vars VSIZE 
      008E1B 52 02            [ 2]    1     sub sp,#VSIZE 
      008E1D 0F 01            [ 1] 2854 	clr (SQUOT,sp)
      008E1F 0F 02            [ 1] 2855 	clr (SDIVD,sp)
                                   2856 ; check for 0 divisor
      008E21 1E 05            [ 2] 2857 	ldw x,(DIVISR,sp)
      008E23 5D               [ 2] 2858 	tnzw x 
      008E24 26 05            [ 1] 2859     jrne 0$
      008E26 A6 04            [ 1] 2860 	ld a,#ERR_DIV0 
      008E28 CC 87 83         [ 2] 2861 	jp tb_error 
                                   2862 ; check divisor sign 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008E2B 9E               [ 1] 2863 0$:	ld a,xh 
      008E2C A5 80            [ 1] 2864 	bcp a,#0x80 
      008E2E 27 03            [ 1] 2865 	jreq 1$
      008E30 03 01            [ 1] 2866 	cpl (SQUOT,sp)
      008E32 50               [ 2] 2867 	negw x 
      008E33 1F 05            [ 2] 2868 1$:	ldw (DIVISR,sp),x
                                   2869 ; check dividend sign 	 
      008E35 1E 07            [ 2] 2870     ldw x,(DIVIDND,sp)
      008E37 9E               [ 1] 2871 	ld a,xh 
      008E38 A5 80            [ 1] 2872 	bcp a,#0x80 
      008E3A 27 05            [ 1] 2873 	jreq 2$ 
      008E3C 03 01            [ 1] 2874 	cpl (SQUOT,sp)
      008E3E 03 02            [ 1] 2875 	cpl (SDIVD,sp)
      008E40 50               [ 2] 2876 	negw x 
      008E41 16 05            [ 2] 2877 2$:	ldw y,(DIVISR,sp)
      008E43 65               [ 2] 2878 	divw x,y
      008E44 90 CF 00 0D      [ 2] 2879 	ldw acc16,y 
                                   2880 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008E48 0D 02            [ 1] 2881 	tnz (SDIVD,sp)
      008E4A 27 0B            [ 1] 2882 	jreq 7$
      008E4C 90 5D            [ 2] 2883 	tnzw y 
      008E4E 27 07            [ 1] 2884 	jreq 7$
      008E50 5C               [ 2] 2885 	incw x
      008E51 16 05            [ 2] 2886 	ldw y,(DIVISR,sp)
      008E53 72 B2 00 0D      [ 2] 2887 	subw y,acc16
      008E57 0D 01            [ 1] 2888 7$: tnz (SQUOT,sp)
      008E59 27 01            [ 1] 2889 	jreq 9$ 	 
      008E5B 50               [ 2] 2890 8$:	negw x 
      008E5C                       2891 9$: 
      000DDC                       2892 	_drop VSIZE 
      008E5C 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E5E 81               [ 4] 2893 	ret 
                                   2894 
                                   2895 
                                   2896 ;----------------------------------
                                   2897 ;  remainder resulting from euclidian 
                                   2898 ;  division of n2/n1 
                                   2899 ; input:
                                   2900 ;   N1 		cstack 
                                   2901 ;   N2      cstack
                                   2902 ; output:
                                   2903 ;   X       N2%N1 
                                   2904 ;----------------------------------
                           000003  2905 	N1=3
                           000005  2906 	N2=5
                           000004  2907 	VSIZE=4
      008E5F                       2908 modulo:
      008E5F 1E 03            [ 2] 2909 	Ldw x,(N1,sp)
      008E61 16 05            [ 2] 2910 	ldw y,(N2,sp)
      000DE3                       2911 	_vars VSIZE 
      008E63 52 04            [ 2]    1     sub sp,#VSIZE 
      008E65 1F 01            [ 2] 2912 	ldw (1,sp),x 
      008E67 17 03            [ 2] 2913 	ldw (3,sp),y 
      008E69 CD 8E 1B         [ 4] 2914 	call divide 
      008E6C 93               [ 1] 2915 	ldw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      000DED                       2916 	_drop VSIZE 
      008E6D 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E6F 81               [ 4] 2917 	ret 
                                   2918 
                                   2919 
                                   2920 ;----------------------------------
                                   2921 ; search in kword_dict name
                                   2922 ; from its execution address 
                                   2923 ; input:
                                   2924 ;   X       	execution address 
                                   2925 ; output:
                                   2926 ;   X 			cstr*  | 0 
                                   2927 ;--------------------------------
                           000001  2928 	XADR=1 
                           000003  2929 	LINK=3 
                           000004  2930 	VSIZE=4
      008E70                       2931 cmd_name:
      000DF0                       2932 	_vars VSIZE 
      008E70 52 04            [ 2]    1     sub sp,#VSIZE 
      008E72 72 5F 00 0D      [ 1] 2933 	clr acc16 
      008E76 1F 01            [ 2] 2934 	ldw (XADR,sp),x  
      008E78 AE A5 0E         [ 2] 2935 	ldw x,#kword_dict	
      008E7B 1F 03            [ 2] 2936 1$:	ldw (LINK,sp),x
      008E7D E6 02            [ 1] 2937 	ld a,(2,x)
      008E7F A4 0F            [ 1] 2938 	and a,#15 
      008E81 C7 00 0E         [ 1] 2939 	ld acc8,a 
      008E84 1C 00 03         [ 2] 2940 	addw x,#3
      008E87 72 BB 00 0D      [ 2] 2941 	addw x,acc16
      008E8B FE               [ 2] 2942 	ldw x,(x) ; execution address 
      008E8C 13 01            [ 2] 2943 	cpw x,(XADR,sp)
      008E8E 27 0A            [ 1] 2944 	jreq 2$
      008E90 1E 03            [ 2] 2945 	ldw x,(LINK,sp)
      008E92 FE               [ 2] 2946 	ldw x,(x) 
      008E93 1D 00 02         [ 2] 2947 	subw x,#2  
      008E96 26 E3            [ 1] 2948 	jrne 1$
      008E98 20 05            [ 2] 2949 	jra 9$
      008E9A 1E 03            [ 2] 2950 2$: ldw x,(LINK,sp)
      008E9C 1C 00 02         [ 2] 2951 	addw x,#2 	
      000E1F                       2952 9$:	_drop VSIZE
      008E9F 5B 04            [ 2]    1     addw sp,#VSIZE 
      008EA1 81               [ 4] 2953 	ret
                                   2954 
                                   2955 
                                   2956 ;---------------------------------
                                   2957 ; dictionary search 
                                   2958 ; input:
                                   2959 ;	X 		dictionary entry point 
                                   2960 ;  pad		.asciz name to search 
                                   2961 ; output:
                                   2962 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2963 ;  X		execution address | 0 
                                   2964 ;---------------------------------
                           000001  2965 	NLEN=1 ; cmd length 
                           000002  2966 	YSAVE=2
                           000003  2967 	VSIZE=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008EA2                       2968 search_dict:
      000E22                       2969 	_vars VSIZE 
      008EA2 52 03            [ 2]    1     sub sp,#VSIZE 
      008EA4 90 93            [ 1] 2970 	ldw y,x 
      008EA6                       2971 search_next:	
      008EA6 90 F6            [ 1] 2972 	ld a,(y)
      008EA8 A4 0F            [ 1] 2973 	and a,#0xf 
      008EAA 6B 01            [ 1] 2974 	ld (NLEN,sp),a  
      008EAC AE 17 38         [ 2] 2975 	ldw x,#pad 
      008EAF 17 02            [ 2] 2976 	ldw (YSAVE,sp),y
      008EB1 90 5C            [ 2] 2977 	incw y  
      008EB3                       2978 cp_loop:
      008EB3 F6               [ 1] 2979 	ld a,(x)
      008EB4 27 1E            [ 1] 2980 	jreq str_match 
      008EB6 0D 01            [ 1] 2981 	tnz (NLEN,sp)
      008EB8 27 0B            [ 1] 2982 	jreq no_match  
      008EBA 90 F1            [ 1] 2983 	cp a,(y)
      008EBC 26 07            [ 1] 2984 	jrne no_match 
      008EBE 90 5C            [ 2] 2985 	incw y 
      008EC0 5C               [ 2] 2986 	incw x
      008EC1 0A 01            [ 1] 2987 	dec (NLEN,sp)
      008EC3 20 EE            [ 2] 2988 	jra cp_loop 
      008EC5                       2989 no_match:
      008EC5 16 02            [ 2] 2990 	ldw y,(YSAVE,sp) 
      008EC7 72 A2 00 02      [ 2] 2991 	subw y,#2 ; move Y to link field
      008ECB 4B 00            [ 1] 2992 	push #TK_NONE 
      008ECD 90 FE            [ 2] 2993 	ldw y,(y) ; next word link 
      008ECF 84               [ 1] 2994 	pop a ; TK_NONE 
      008ED0 27 21            [ 1] 2995 	jreq search_exit  ; not found  
                                   2996 ;try next 
      008ED2 20 D2            [ 2] 2997 	jra search_next
      008ED4                       2998 str_match:
      008ED4 16 02            [ 2] 2999 	ldw y,(YSAVE,sp)
      008ED6 90 F6            [ 1] 3000 	ld a,(y)
      008ED8 6B 01            [ 1] 3001 	ld (NLEN,sp),a ; needed to test keyword type  
      008EDA A4 0F            [ 1] 3002 	and a,#0xf 
                                   3003 ; move y to procedure address field 	
      008EDC 4C               [ 1] 3004 	inc a 
      008EDD C7 00 0E         [ 1] 3005 	ld acc8,a 
      008EE0 72 5F 00 0D      [ 1] 3006 	clr acc16 
      008EE4 72 B9 00 0D      [ 2] 3007 	addw y,acc16 
      008EE8 90 FE            [ 2] 3008 	ldw y,(y) ; routine entry point 
                                   3009 ;determine keyword type bits 7:6 
      008EEA 7B 01            [ 1] 3010 	ld a,(NLEN,sp)
      008EEC 4E               [ 1] 3011 	swap a 
      008EED A4 0C            [ 1] 3012 	and a,#0xc
      008EEF 44               [ 1] 3013 	srl a
      008EF0 44               [ 1] 3014 	srl a 
      008EF1 AB 06            [ 1] 3015 	add a,#6
      008EF3                       3016 search_exit: 
      008EF3 93               [ 1] 3017 	ldw x,y ; x=routine address 
      000E74                       3018 	_drop VSIZE 	 
      008EF4 5B 03            [ 2]    1     addw sp,#VSIZE 
      008EF6 81               [ 4] 3019 	ret 
                                   3020 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3021 ;---------------------
                                   3022 ; check if next token
                                   3023 ;  is of expected type 
                                   3024 ; input:
                                   3025 ;   A 		 expected token attribute
                                   3026 ;  ouput:
                                   3027 ;   none     if fail call syntax_error 
                                   3028 ;--------------------
      008EF7                       3029 expect:
      008EF7 88               [ 1] 3030 	push a 
      008EF8 CD 88 35         [ 4] 3031 	call next_token 
      008EFB 11 01            [ 1] 3032 	cp a,(1,sp)
      008EFD 27 03            [ 1] 3033 	jreq 1$
      008EFF CC 87 81         [ 2] 3034 	jp syntax_error
      008F02 84               [ 1] 3035 1$: pop a 
      008F03 81               [ 4] 3036 	ret 
                                   3037 
                                   3038 
                                   3039 ;-------------------------------
                                   3040 ; parse embedded BASIC routines 
                                   3041 ; arguments list.
                                   3042 ; arg_list::=  rel[','rel]*
                                   3043 ; all arguments are of integer type
                                   3044 ; and pushed on stack 
                                   3045 ; input:
                                   3046 ;   none
                                   3047 ; output:
                                   3048 ;   stack{n}   arguments pushed on stack
                                   3049 ;   A 	number of arguments pushed on stack  
                                   3050 ;--------------------------------
      008F04                       3051 arg_list:
      008F04 4B 00            [ 1] 3052 	push #0  
      008F06 CD 90 54         [ 4] 3053 1$: call relation
      008F09 A1 00            [ 1] 3054 	cp a,#TK_NONE 
      008F0B 27 1C            [ 1] 3055 	jreq 5$
      008F0D A1 04            [ 1] 3056 	cp a,#TK_INTGR
      008F0F 26 13            [ 1] 3057 	jrne 4$
      008F11                       3058 3$: 
                                   3059 ; swap return address with argument
      008F11 84               [ 1] 3060 	pop a 
      008F12 90 85            [ 2] 3061 	popw y 
      008F14 89               [ 2] 3062 	pushw x 
      008F15 90 89            [ 2] 3063 	pushw y 
      008F17 4C               [ 1] 3064     inc a
      008F18 88               [ 1] 3065 	push a 
      008F19 CD 88 35         [ 4] 3066 	call next_token 
      008F1C A1 0D            [ 1] 3067 	cp a,#TK_COMMA 
      008F1E 27 E6            [ 1] 3068 	jreq 1$ 
      008F20 A1 00            [ 1] 3069 	cp a,#TK_NONE 
      008F22 27 05            [ 1] 3070 	jreq 5$ 
      000EA4                       3071 4$:	_unget_token 
      008F24 55 00 03 00 02   [ 1]    1     mov in,in.saved
      008F29 84               [ 1] 3072 5$:	pop a  
      008F2A 81               [ 4] 3073 	ret 
                                   3074 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3075 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3076 ; parse arguments list 
                                   3077 ; between ()
                                   3078 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      008F2B                       3079 func_args:
      008F2B 85               [ 2] 3080 	popw x
      008F2C CF 00 18         [ 2] 3081 	ldw farptr+1,x  
      008F2F A6 0B            [ 1] 3082 	ld a,#TK_LPAREN 
      008F31 CD 8E F7         [ 4] 3083 	call expect 
      008F34 CD 8F 04         [ 4] 3084 	call arg_list 
      008F37 88               [ 1] 3085 	push a 
      008F38 A6 0C            [ 1] 3086 	ld a,#TK_RPAREN 
      008F3A CD 8E F7         [ 4] 3087 	call expect 
      008F3D 84               [ 1] 3088 	pop a 
      008F3E 72 CC 00 18      [ 5] 3089 	jp [farptr+1]
                                   3090 
                                   3091 ;--------------------------------
                                   3092 ;   BASIC commnands 
                                   3093 ;--------------------------------
                                   3094 
                                   3095 ;--------------------------------
                                   3096 ;  arithmetic and relational 
                                   3097 ;  routines
                                   3098 ;  operators precedence
                                   3099 ;  highest to lowest
                                   3100 ;  operators on same row have 
                                   3101 ;  same precedence and are executed
                                   3102 ;  from left to right.
                                   3103 ;	'*','/','%'
                                   3104 ;   '-','+'
                                   3105 ;   '=','>','<','>=','<=','<>','><'
                                   3106 ;   '<>' and '><' are equivalent for not equal.
                                   3107 ;--------------------------------
                                   3108 
                                   3109 ;---------------------
                                   3110 ; return array element
                                   3111 ; address from @(expr)
                                   3112 ; input:
                                   3113 ;   A 		TK_ARRAY
                                   3114 ; output:
                                   3115 ;   A 		TK_INTGR
                                   3116 ;	X 		element address 
                                   3117 ;----------------------
      008F42                       3118 get_array_element:
      008F42 CD 8F 2B         [ 4] 3119 	call func_args 
      008F45 A1 01            [ 1] 3120 	cp a,#1
      008F47 27 03            [ 1] 3121 	jreq 1$
      008F49 CC 87 81         [ 2] 3122 	jp syntax_error
      008F4C 85               [ 2] 3123 1$: popw x 
                                   3124 	; check for bounds 
      008F4D C3 00 24         [ 2] 3125 	cpw x,array_size 
      008F50 23 05            [ 2] 3126 	jrule 3$
                                   3127 ; bounds {1..array_size}	
      008F52 A6 0A            [ 1] 3128 2$: ld a,#ERR_BAD_VALUE 
      008F54 CC 87 83         [ 2] 3129 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008F57 5D               [ 2] 3130 3$: tnzw  x
      008F58 27 F8            [ 1] 3131 	jreq 2$ 
      008F5A 58               [ 2] 3132 	sllw x 
      008F5B 89               [ 2] 3133 	pushw x 
      008F5C AE 16 E8         [ 2] 3134 	ldw x,#tib
      008F5F 72 F0 01         [ 2] 3135 	subw x,(1,sp)
      000EE2                       3136 	_drop 2   
      008F62 5B 02            [ 2]    1     addw sp,#2 
      008F64 A6 04            [ 1] 3137 	ld a,#TK_INTGR
      008F66 81               [ 4] 3138 	ret 
                                   3139 
                                   3140 ;***********************************
                                   3141 ;   expression parse,execute 
                                   3142 ;***********************************
                                   3143 ;-----------------------------------
                                   3144 ; factor ::= ['+'|'-'|e]  var | @ |
                                   3145 ;			 integer | function |
                                   3146 ;			 '('relation')' 
                                   3147 ; output:
                                   3148 ;   A    token attribute 
                                   3149 ;   X 	 integer
                                   3150 ; ---------------------------------
                           000001  3151 	NEG=1
                           000001  3152 	VSIZE=1
      008F67                       3153 factor:
      000EE7                       3154 	_vars VSIZE 
      008F67 52 01            [ 2]    1     sub sp,#VSIZE 
      008F69 CD 88 35         [ 4] 3155 	call next_token
      008F6C A1 02            [ 1] 3156 	cp a,#CMD_END 
      008F6E 2B 4E            [ 1] 3157 	jrmi 20$
      008F70 6B 01            [ 1] 3158 1$:	ld (NEG,sp),a 
      008F72 A4 30            [ 1] 3159 	and a,#TK_GRP_MASK
      008F74 A1 10            [ 1] 3160 	cp a,#TK_GRP_ADD 
      008F76 27 04            [ 1] 3161 	jreq 2$
      008F78 7B 01            [ 1] 3162 	ld a,(NEG,sp)
      008F7A 20 03            [ 2] 3163 	jra 4$  
      008F7C                       3164 2$:	
      008F7C CD 88 35         [ 4] 3165 	call next_token 
      008F7F                       3166 4$:	
      008F7F A1 07            [ 1] 3167 	cp a,#TK_IFUNC 
      008F81 26 03            [ 1] 3168 	jrne 5$ 
      008F83 FD               [ 4] 3169 	call (x) 
      008F84 20 2F            [ 2] 3170 	jra 18$ 
      008F86                       3171 5$:
      008F86 A1 04            [ 1] 3172 	cp a,#TK_INTGR
      008F88 26 02            [ 1] 3173 	jrne 6$
      008F8A 20 29            [ 2] 3174 	jra 18$
      008F8C                       3175 6$:
      008F8C A1 02            [ 1] 3176 	cp a,#TK_ARRAY
      008F8E 26 06            [ 1] 3177 	jrne 10$
      008F90 CD 8F 42         [ 4] 3178 	call get_array_element
      008F93 FE               [ 2] 3179 	ldw x,(x)
      008F94 20 1F            [ 2] 3180 	jra 18$ 
      008F96                       3181 10$:
      008F96 A1 05            [ 1] 3182 	cp a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008F98 26 03            [ 1] 3183 	jrne 12$
      008F9A FE               [ 2] 3184 	ldw x,(x)
      008F9B 20 18            [ 2] 3185 	jra 18$
      008F9D                       3186 12$:			
      008F9D A1 0B            [ 1] 3187 	cp a,#TK_LPAREN
      008F9F 26 0C            [ 1] 3188 	jrne 16$
      008FA1 CD 90 54         [ 4] 3189 	call relation
      008FA4 89               [ 2] 3190 	pushw x 
      008FA5 A6 0C            [ 1] 3191 	ld a,#TK_RPAREN 
      008FA7 CD 8E F7         [ 4] 3192 	call expect
      008FAA 85               [ 2] 3193 	popw x 
      008FAB 20 08            [ 2] 3194 	jra 18$	
      008FAD                       3195 16$:
      000F2D                       3196 	_unget_token
      008FAD 55 00 03 00 02   [ 1]    1     mov in,in.saved
      008FB2 4F               [ 1] 3197 	clr a 
      008FB3 20 09            [ 2] 3198 	jra 20$ 
      008FB5                       3199 18$: 
      008FB5 A6 11            [ 1] 3200 	ld a,#TK_MINUS 
      008FB7 11 01            [ 1] 3201 	cp a,(NEG,sp)
      008FB9 26 01            [ 1] 3202 	jrne 19$
      008FBB 50               [ 2] 3203 	negw x
      008FBC                       3204 19$:
      008FBC A6 04            [ 1] 3205 	ld a,#TK_INTGR
      008FBE                       3206 20$:
      000F3E                       3207 	_drop VSIZE
      008FBE 5B 01            [ 2]    1     addw sp,#VSIZE 
      008FC0 81               [ 4] 3208 	ret
                                   3209 
                                   3210 ;-----------------------------------
                                   3211 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3212 ; output:
                                   3213 ;   A    	token attribute 
                                   3214 ;	X		integer
                                   3215 ;-----------------------------------
                           000001  3216 	N1=1
                           000003  3217 	N2=3
                           000005  3218 	MULOP=5
                           000005  3219 	VSIZE=5
      008FC1                       3220 term:
      000F41                       3221 	_vars VSIZE
      008FC1 52 05            [ 2]    1     sub sp,#VSIZE 
      008FC3 CD 8F 67         [ 4] 3222 	call factor
      008FC6 A1 02            [ 1] 3223 	cp a,#CMD_END
      008FC8 2B 43            [ 1] 3224 	jrmi term_exit
      008FCA                       3225 term01:	 ; check for  operator 
      008FCA 1F 03            [ 2] 3226 	ldw (N2,sp),x  ; save first factor 
      008FCC CD 88 35         [ 4] 3227 	call next_token
      008FCF A1 02            [ 1] 3228 	cp a,#CMD_END
      008FD1 2B 36            [ 1] 3229 	jrmi 9$
      008FD3 6B 05            [ 1] 3230 0$:	ld (MULOP,sp),a
      008FD5 A4 30            [ 1] 3231 	and a,#TK_GRP_MASK
      008FD7 A1 20            [ 1] 3232 	cp a,#TK_GRP_MULT
      008FD9 27 09            [ 1] 3233 	jreq 1$
      008FDB 7B 05            [ 1] 3234 	ld a,(MULOP,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      000F5D                       3235 	_unget_token 
      008FDD 55 00 03 00 02   [ 1]    1     mov in,in.saved
      008FE2 20 25            [ 2] 3236 	jra 9$
      008FE4                       3237 1$:	; got *|/|%
      008FE4 CD 8F 67         [ 4] 3238 	call factor
      008FE7 A1 04            [ 1] 3239 	cp a,#TK_INTGR
      008FE9 27 03            [ 1] 3240 	jreq 2$ 
      008FEB CC 87 81         [ 2] 3241 	jp syntax_error
      008FEE 1F 01            [ 2] 3242 2$:	ldw (N1,sp),x  
      008FF0 7B 05            [ 1] 3243 	ld a,(MULOP,sp) 
      008FF2 A1 20            [ 1] 3244 	cp a,#TK_MULT 
      008FF4 26 05            [ 1] 3245 	jrne 3$
      008FF6 CD 8D D3         [ 4] 3246 	call multiply 
      008FF9 20 CF            [ 2] 3247 	jra term01
      008FFB A1 21            [ 1] 3248 3$: cp a,#TK_DIV 
      008FFD 26 05            [ 1] 3249 	jrne 4$ 
      008FFF CD 8E 1B         [ 4] 3250 	call divide 
      009002 20 C6            [ 2] 3251 	jra term01 
      009004 CD 8E 5F         [ 4] 3252 4$: call modulo
      009007 20 C1            [ 2] 3253 	jra term01 
      009009 1E 03            [ 2] 3254 9$: ldw x,(N2,sp)  
      00900B A6 04            [ 1] 3255 	ld a,#TK_INTGR 	
      00900D                       3256 term_exit:
      000F8D                       3257 	_drop VSIZE 
      00900D 5B 05            [ 2]    1     addw sp,#VSIZE 
      00900F 81               [ 4] 3258 	ret 
                                   3259 
                                   3260 ;-------------------------------
                                   3261 ;  expr ::= term [['+'|'-'] term]*
                                   3262 ;  result range {-32768..32767}
                                   3263 ;  output:
                                   3264 ;   A    token attribute 
                                   3265 ;   X	 integer   
                                   3266 ;-------------------------------
                           000001  3267 	N1=1 
                           000003  3268 	N2=3
                           000005  3269 	OP=5 
                           000005  3270 	VSIZE=5 
      009010                       3271 expression:
      000F90                       3272 	_vars VSIZE 
      009010 52 05            [ 2]    1     sub sp,#VSIZE 
      009012 CD 8F C1         [ 4] 3273 	call term
      009015 A1 02            [ 1] 3274 	cp a,#CMD_END 
      009017 2B 38            [ 1] 3275 	jrmi expr_exit 
      009019 1F 03            [ 2] 3276 0$:	ldw (N2,sp),x 
      00901B CD 88 35         [ 4] 3277 	call next_token
      00901E A1 02            [ 1] 3278 	cp a,#CMD_END 
      009020 2B 2B            [ 1] 3279 	jrmi 9$ 
      009022 6B 05            [ 1] 3280 1$:	ld (OP,sp),a  
      009024 A4 30            [ 1] 3281 	and a,#TK_GRP_MASK
      009026 A1 10            [ 1] 3282 	cp a,#TK_GRP_ADD 
      009028 27 07            [ 1] 3283 	jreq 2$ 
      000FAA                       3284 	_unget_token
      00902A 55 00 03 00 02   [ 1]    1     mov in,in.saved
      00902F 20 1C            [ 2] 3285 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009031                       3286 2$: 
      009031 CD 8F C1         [ 4] 3287 	call term
      009034 A1 04            [ 1] 3288 	cp a,#TK_INTGR 
      009036 27 03            [ 1] 3289 	jreq 3$
      009038 CC 87 81         [ 2] 3290 	jp syntax_error
      00903B 1F 01            [ 2] 3291 3$:	ldw (N1,sp),x 
      00903D 7B 05            [ 1] 3292 	ld a,(OP,sp)
      00903F A1 10            [ 1] 3293 	cp a,#TK_PLUS 
      009041 26 05            [ 1] 3294 	jrne 4$
      009043 CD 8D C5         [ 4] 3295 	call add 
      009046 20 D1            [ 2] 3296 	jra 0$ 
      009048 CD 8D CD         [ 4] 3297 4$:	call substract
      00904B 20 CC            [ 2] 3298 	jra 0$
      00904D 1E 03            [ 2] 3299 9$: ldw x,(N2,sp)
      00904F A6 04            [ 1] 3300 	ld a,#TK_INTGR	
      009051                       3301 expr_exit:
      000FD1                       3302 	_drop VSIZE 
      009051 5B 05            [ 2]    1     addw sp,#VSIZE 
      009053 81               [ 4] 3303 	ret 
                                   3304 
                                   3305 ;---------------------------------------------
                                   3306 ; rel ::= expr rel_op expr
                                   3307 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3308 ;  relation return 1 | 0  for true | false 
                                   3309 ;  output:
                                   3310 ;    A 		token attribute  
                                   3311 ;	 X		1|0
                                   3312 ;---------------------------------------------
                           000001  3313 	N1=1
                           000003  3314 	N2=3
                           000005  3315 	RELOP=5
                           000005  3316 	VSIZE=5 
      009054                       3317 relation: 
      000FD4                       3318 	_vars VSIZE
      009054 52 05            [ 2]    1     sub sp,#VSIZE 
      009056 CD 90 10         [ 4] 3319 	call expression
      009059 A1 02            [ 1] 3320 	cp a,#CMD_END  
      00905B 2B 4B            [ 1] 3321 	jrmi rel_exit 
                                   3322 	; expect rel_op or leave 
      00905D 1F 03            [ 2] 3323 	ldw (N2,sp),x 
      00905F CD 88 35         [ 4] 3324 	call next_token 
      009062 A1 02            [ 1] 3325 	cp a,#CMD_END 
      009064 2B 3E            [ 1] 3326 	jrmi 9$
      009066                       3327 1$:	
      009066 6B 05            [ 1] 3328 	ld (RELOP,sp),a 
      009068 A4 30            [ 1] 3329 	and a,#TK_GRP_MASK
      00906A A1 30            [ 1] 3330 	cp a,#TK_GRP_RELOP 
      00906C 27 07            [ 1] 3331 	jreq 2$
      000FEE                       3332 	_unget_token  
      00906E 55 00 03 00 02   [ 1]    1     mov in,in.saved
      009073 20 2F            [ 2] 3333 	jra 9$
      009075                       3334 2$:	; expect another expression or error 
      009075 CD 90 10         [ 4] 3335 	call expression
      009078 A1 04            [ 1] 3336 	cp a,#TK_INTGR 
      00907A 27 03            [ 1] 3337 	jreq 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00907C CC 87 81         [ 2] 3338 	jp syntax_error 
      00907F 1F 01            [ 2] 3339 3$:	ldw (N1,sp),x 
      009081 CD 8D CD         [ 4] 3340 	call substract
      009084 26 06            [ 1] 3341 	jrne 4$
      009086 35 02 00 0E      [ 1] 3342 	mov acc8,#2 ; n1==n2
      00908A 20 0C            [ 2] 3343 	jra 6$ 
      00908C                       3344 4$: 
      00908C 2C 06            [ 1] 3345 	jrsgt 5$  
      00908E 35 04 00 0E      [ 1] 3346 	mov acc8,#4 ; n1<2 
      009092 20 04            [ 2] 3347 	jra 6$
      009094                       3348 5$:
      009094 35 01 00 0E      [ 1] 3349 	mov acc8,#1 ; n1>n2 
      009098                       3350 6$:
      009098 5F               [ 1] 3351 	clrw x 
      009099 C6 00 0E         [ 1] 3352 	ld a, acc8  
      00909C 14 05            [ 1] 3353 	and a,(RELOP,sp)
      00909E 4D               [ 1] 3354 	tnz a 
      00909F 27 05            [ 1] 3355 	jreq 10$
      0090A1 5C               [ 2] 3356 	incw x 
      0090A2                       3357 7$:	 
      0090A2 20 02            [ 2] 3358 	jra 10$  	
      0090A4 1E 03            [ 2] 3359 9$: ldw x,(N2,sp)
      0090A6                       3360 10$:
      0090A6 A6 04            [ 1] 3361 	ld a,#TK_INTGR
      0090A8                       3362 rel_exit: 	 
      001028                       3363 	_drop VSIZE
      0090A8 5B 05            [ 2]    1     addw sp,#VSIZE 
      0090AA 81               [ 4] 3364 	ret 
                                   3365 
                                   3366 ;--------------------------------
                                   3367 ; BASIC: SHOW 
                                   3368 ; print stack content in hexadecimal bytes 
                                   3369 ; 16 bytes per row 
                                   3370 ;--------------------------------
                           000001  3371 	TWSAVE=1
                           000002  3372 	BSAVE=2
                           000003  3373 	ADDR=3
                           000004  3374 	VSIZE=4 
      0090AB                       3375 show:
      00102B                       3376 	_vars VSIZE
      0090AB 52 04            [ 2]    1     sub sp,#VSIZE 
      0090AD C6 00 0B         [ 1] 3377 	ld a,base 
      0090B0 6B 02            [ 1] 3378 	ld (BSAVE,sp),a
      0090B2 C6 00 27         [ 1] 3379 	ld a,tab_width
      0090B5 6B 01            [ 1] 3380 	ld (TWSAVE,sp),a
      0090B7 35 10 00 0B      [ 1] 3381 	mov base,#16   
      0090BB AE 90 F7         [ 2] 3382 	ldw x,#cstk_prompt
      0090BE CD 82 46         [ 4] 3383 	call puts 
      0090C1 96               [ 1] 3384 	ldw x,sp 
      0090C2 1C 00 05         [ 2] 3385 	addw x,#VSIZE+1 ; ignore local vars and return address
      0090C5 1F 03            [ 2] 3386 	ldw (ADDR,sp),x 
      0090C7                       3387 dotr_loop:
      0090C7 A3 18 00         [ 2] 3388 	cpw x,#RAM_SIZE 
      0090CA 24 18            [ 1] 3389 	jruge 9$
      0090CC A6 10            [ 1] 3390 	ld a,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0090CE 90 AE 18 00      [ 2] 3391 	ldw y,#RAM_SIZE  
      0090D2 72 F2 03         [ 2] 3392 	subw y,(ADDR,sp)
      0090D5 90 A3 00 10      [ 2] 3393 	cpw y,#16 
      0090D9 24 02            [ 1] 3394 	jruge 2$
      0090DB 90 9F            [ 1] 3395 	ld a,yl  
      0090DD                       3396 2$:  
      0090DD CD 91 1E         [ 4] 3397 	call show_row 
      0090E0 1F 03            [ 2] 3398 	ldw (ADDR,sp),x 
      0090E2 20 E3            [ 2] 3399 	jra dotr_loop 
      0090E4 A6 0D            [ 1] 3400 9$:	ld a,#CR 
      0090E6 CD 82 33         [ 4] 3401 	call putc 
      0090E9 7B 02            [ 1] 3402 	ld a,(BSAVE,sp)
      0090EB C7 00 0B         [ 1] 3403 	ld base,a 
      0090EE 7B 01            [ 1] 3404 	ld a,(TWSAVE,sp)
      0090F0 C7 00 27         [ 1] 3405 	ld tab_width,a 
      001073                       3406 	_drop VSIZE 
      0090F3 5B 04            [ 2]    1     addw sp,#VSIZE 
      0090F5 4F               [ 1] 3407 	clr a 
      0090F6 81               [ 4] 3408 	ret
                                   3409 
      0090F7 0A 63 6F 6E 74 65 6E  3410 cstk_prompt: .asciz "\ncontent of stack from top to bottom:\n"
             74 20 6F 66 20 73 74
             61 63 6B 20 66 72 6F
             6D 20 74 6F 70 20 74
             6F 20 62 6F 74 74 6F
             6D 3A 0A 00
                                   3411 
                                   3412 ;---------------------
                                   3413 ; display n bytes row 
                                   3414 ; from memory.
                                   3415 ; input:
                                   3416 ;   A   bytes to print 
                                   3417 ;	X   start address 
                                   3418 ; output:
                                   3419 ;   X   address after last shown  
                                   3420 ;---------------------
                           000001  3421 	CNT=1 
                           000002  3422 	ADR=2 
                           000003  3423 	VSIZE=3 
      00911E                       3424 show_row:
      00911E 4D               [ 1] 3425 	tnz a 
      00911F 26 01            [ 1] 3426 	jrne 1$
      009121 81               [ 4] 3427 	ret 
      009122                       3428 1$:	
      009122 89               [ 2] 3429 	pushw x  
      009123 88               [ 1] 3430 	push a 
      009124 35 04 00 27      [ 1] 3431 	mov tab_width,#4 
      009128 CD 88 CA         [ 4] 3432 	call print_int 
      00912B A6 20            [ 1] 3433 	ld a,#SPACE  
      00912D CD 82 33         [ 4] 3434 	call putc
      009130                       3435 row_loop:
      009130 1E 02            [ 2] 3436 	ldw x,(ADR,sp)
      009132 F6               [ 1] 3437 	ld a,(x)
      009133 5F               [ 1] 3438 	clrw x 
      009134 97               [ 1] 3439 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009135 CD 88 CA         [ 4] 3440 	call print_int 
      009138 1E 02            [ 2] 3441 	ldw x,(ADR,sp)
      00913A 5C               [ 2] 3442 	incw x 
      00913B 1F 02            [ 2] 3443 	ldw (ADR,sp),x 
      00913D 0A 01            [ 1] 3444 	dec (CNT,sp)
      00913F 26 EF            [ 1] 3445 	jrne row_loop
      0010C1                       3446 	_drop VSIZE  		
      009141 5B 03            [ 2]    1     addw sp,#VSIZE 
      009143 35 04 00 27      [ 1] 3447 	mov tab_width,#4
      009147 A6 0D            [ 1] 3448 	ld a,#CR 
      009149 CD 82 33         [ 4] 3449 	call putc 
      00914C 81               [ 4] 3450 	ret 
                                   3451 
                                   3452 ;--------------------------------------------
                                   3453 ; BASIC: HEX 
                                   3454 ; select hexadecimal base for integer print
                                   3455 ;---------------------------------------------
      00914D                       3456 hex_base:
      00914D 35 10 00 0B      [ 1] 3457 	mov base,#16 
      009151 81               [ 4] 3458 	ret 
                                   3459 
                                   3460 ;--------------------------------------------
                                   3461 ; BASIC: DEC 
                                   3462 ; select decimal base for integer print
                                   3463 ;---------------------------------------------
      009152                       3464 dec_base:
      009152 35 0A 00 0B      [ 1] 3465 	mov base,#10
      009156 81               [ 4] 3466 	ret 
                                   3467 
                                   3468 ;------------------------
                                   3469 ; BASIC: SIZE 
                                   3470 ; return free size in text area
                                   3471 ; output:
                                   3472 ;   A 		TK_INTGR
                                   3473 ;   X 	    size integer
                                   3474 ;--------------------------
      009157                       3475 size:
      009157 AE 16 E8         [ 2] 3476 	ldw x,#tib 
      00915A 72 B0 00 21      [ 2] 3477 	subw x,txtend 
      00915E A6 04            [ 1] 3478 	ld a,#TK_INTGR
      009160 81               [ 4] 3479 	ret 
                                   3480 
                                   3481 
                                   3482 ;------------------------
                                   3483 ; BASIC: UBOUND  
                                   3484 ; return array variable size 
                                   3485 ; output:
                                   3486 ;   A 		TK_INTGR
                                   3487 ;   X 	    array size 
                                   3488 ;--------------------------
      009161                       3489 ubound:
      009161 AE 16 E8         [ 2] 3490 	ldw x,#tib
      009164 72 B0 00 21      [ 2] 3491 	subw x,txtend 
      009168 90 CE 00 05      [ 2] 3492 	ldw y,basicptr 
      00916C 90 C3 00 21      [ 2] 3493 	cpw y,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009170 25 0A            [ 1] 3494 	jrult 1$
      009172 3B 00 04         [ 1] 3495 	push count 
      009175 4B 00            [ 1] 3496 	push #0 
      009177 72 F0 01         [ 2] 3497 	subw x,(1,sp)
      0010FA                       3498 	_drop 2 
      00917A 5B 02            [ 2]    1     addw sp,#2 
      00917C 54               [ 2] 3499 1$:	srlw x 
      00917D CF 00 24         [ 2] 3500 	ldw array_size,x
      009180 A6 04            [ 1] 3501 	ld a,#TK_INTGR
      009182 81               [ 4] 3502 	ret 
                                   3503 
                                   3504 ;-----------------------------
                                   3505 ; BASIC: LET var=expr 
                                   3506 ; variable assignement 
                                   3507 ; output:
                                   3508 ;   A 		TK_NONE 
                                   3509 ;-----------------------------
      009183                       3510 let:
      009183 CD 88 35         [ 4] 3511 	call next_token 
      009186 A1 05            [ 1] 3512 	cp a,#TK_VAR 
      009188 27 03            [ 1] 3513 	jreq let02
      00918A CC 87 81         [ 2] 3514 	jp syntax_error
      00918D                       3515 let02:
      00918D 89               [ 2] 3516 	pushw x  
      00918E CD 88 35         [ 4] 3517 	call next_token 
      009191 A1 32            [ 1] 3518 	cp a,#TK_EQUAL
      009193 27 03            [ 1] 3519 	jreq 1$
      009195 CC 87 81         [ 2] 3520 	jp syntax_error
      009198                       3521 1$:	
      009198 CD 90 54         [ 4] 3522 	call relation   
      00919B A1 04            [ 1] 3523 	cp a,#TK_INTGR 
      00919D 27 03            [ 1] 3524 	jreq 2$
      00919F CC 87 81         [ 2] 3525 	jp syntax_error
      0091A2                       3526 2$:	
      0091A2 90 93            [ 1] 3527 	ldw y,x 
      0091A4 85               [ 2] 3528 	popw x   
      0091A5 FF               [ 2] 3529 	ldw (x),y   
      0091A6 81               [ 4] 3530 	ret 
                                   3531 
                                   3532 ;----------------------------
                                   3533 ; BASIC: LIST [[start][,end]]
                                   3534 ; list program lines 
                                   3535 ; form start to end 
                                   3536 ; if empty argument list then 
                                   3537 ; list all.
                                   3538 ;----------------------------
                           000001  3539 	FIRST=1
                           000003  3540 	LAST=3 
                           000005  3541 	LN_PTR=5
                           000006  3542 	VSIZE=6 
      0091A7                       3543 list:
      001127                       3544 	_vars VSIZE
      0091A7 52 06            [ 2]    1     sub sp,#VSIZE 
      0091A9 CE 00 1F         [ 2] 3545 	ldw x,txtbgn 
      0091AC C3 00 21         [ 2] 3546 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0091AF 2B 03            [ 1] 3547 	jrmi 1$
      0091B1 CC 92 1E         [ 2] 3548 	jp list_exit ; nothing to list 
      0091B4 1F 05            [ 2] 3549 1$:	ldw (LN_PTR,sp),x 
      0091B6 FE               [ 2] 3550 	ldw x,(x) 
      0091B7 1F 01            [ 2] 3551 	ldw (FIRST,sp),x ; list from first line 
      0091B9 AE 7F FF         [ 2] 3552 	ldw x,#MAX_LINENO ; biggest line number 
      0091BC 1F 03            [ 2] 3553 	ldw (LAST,sp),x 
      0091BE CD 8F 04         [ 4] 3554 	call arg_list
      0091C1 4D               [ 1] 3555 	tnz a
      0091C2 27 34            [ 1] 3556 	jreq list_start 
      0091C4 A1 02            [ 1] 3557 	cp a,#2 
      0091C6 27 07            [ 1] 3558 	jreq 4$
      0091C8 A1 01            [ 1] 3559 	cp a,#1 
      0091CA 27 06            [ 1] 3560 	jreq first_line 
      0091CC CC 87 81         [ 2] 3561 	jp syntax_error 
      0091CF 85               [ 2] 3562 4$:	popw x 
      0091D0 1F 03            [ 2] 3563 	ldw (LAST,sp),x 
      0091D2                       3564 first_line:
      0091D2 85               [ 2] 3565 	popw x 
      0091D3 1F 01            [ 2] 3566 	ldw (FIRST,sp),x 
      0091D5                       3567 lines_skip:
      0091D5 CE 00 1F         [ 2] 3568 	ldw x,txtbgn
      0091D8 1F 05            [ 2] 3569 2$:	ldw (LN_PTR,sp),x 
      0091DA C3 00 21         [ 2] 3570 	cpw x,txtend 
      0091DD 2A 3F            [ 1] 3571 	jrpl list_exit 
      0091DF FE               [ 2] 3572 	ldw x,(x) ;line# 
      0091E0 13 01            [ 2] 3573 	cpw x,(FIRST,sp)
      0091E2 2A 14            [ 1] 3574 	jrpl list_start 
      0091E4 1E 05            [ 2] 3575 	ldw x,(LN_PTR,sp) 
      0091E6 1C 00 02         [ 2] 3576 	addw x,#2 
      0091E9 F6               [ 1] 3577 	ld a,(x)
      0091EA 5C               [ 2] 3578 	incw x 
      0091EB C7 00 0E         [ 1] 3579 	ld acc8,a 
      0091EE 72 5F 00 0D      [ 1] 3580 	clr acc16 
      0091F2 72 BB 00 0D      [ 2] 3581 	addw x,acc16
      0091F6 20 E0            [ 2] 3582 	jra 2$ 
                                   3583 ; print loop
      0091F8                       3584 list_start:
      0091F8 1E 05            [ 2] 3585 	ldw x,(LN_PTR,sp)
      0091FA E6 02            [ 1] 3586 3$:	ld a,(2,x) 
      0091FC CD 92 71         [ 4] 3587 	call prt_basic_line
      0091FF 1E 05            [ 2] 3588 	ldw x,(LN_PTR,sp)
      009201 E6 02            [ 1] 3589 	ld a,(2,x)
      009203 C7 00 0E         [ 1] 3590 	ld acc8,a 
      009206 72 5F 00 0D      [ 1] 3591 	clr acc16 
      00920A 72 BB 00 0D      [ 2] 3592 	addw x,acc16
      00920E C3 00 21         [ 2] 3593 	cpw x,txtend 
      009211 2A 0B            [ 1] 3594 	jrpl list_exit
      009213 1F 05            [ 2] 3595 	ldw (LN_PTR,sp),x
      009215 FE               [ 2] 3596 	ldw x,(x)
      009216 13 03            [ 2] 3597 	cpw x,(LAST,sp)  
      009218 2C 04            [ 1] 3598 	jrsgt list_exit 
      00921A 1E 05            [ 2] 3599 	ldw x,(LN_PTR,sp)
      00921C 20 DC            [ 2] 3600 	jra 3$
      00921E                       3601 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00119E                       3602 	_drop VSIZE 
      00921E 5B 06            [ 2]    1     addw sp,#VSIZE 
      009220 81               [ 4] 3603 	ret
                                   3604 
                                   3605 ;-------------------------
                                   3606 ; print counted string 
                                   3607 ; input:
                                   3608 ;   X 	address of string
                                   3609 ;--------------------------
      009221                       3610 prt_cmd_name:
      009221 F6               [ 1] 3611 	ld a,(x)
      009222 5C               [ 2] 3612 	incw x
      009223 A4 0F            [ 1] 3613 	and a,#15  
      009225 88               [ 1] 3614 	push a 
      009226 0D 01            [ 1] 3615 1$: tnz (1,sp) 
      009228 27 09            [ 1] 3616 	jreq 9$
      00922A F6               [ 1] 3617 	ld a,(x)
      00922B CD 82 33         [ 4] 3618 	call putc 
      00922E 5C               [ 2] 3619 	incw x
      00922F 0A 01            [ 1] 3620 	dec (1,sp)	 
      009231 20 F3            [ 2] 3621 	jra 1$
      009233 84               [ 1] 3622 9$: pop a 
      009234 81               [ 4] 3623 	ret	
                                   3624 
                                   3625 ;--------------------------
                                   3626 ; print TK_QSTR
                                   3627 ; converting control character
                                   3628 ; to backslash sequence
                                   3629 ; input:
                                   3630 ;   X        char *
                                   3631 ;-----------------------------
      009235                       3632 prt_quote:
      009235 A6 22            [ 1] 3633 	ld a,#'"
      009237 CD 82 33         [ 4] 3634 	call putc 
      00923A F6               [ 1] 3635 1$:	ld a,(x)
      00923B 27 2D            [ 1] 3636 	jreq 9$
      00923D 5C               [ 2] 3637 	incw x 
      00923E A1 20            [ 1] 3638 	cp a,#SPACE 
      009240 25 0C            [ 1] 3639 	jrult 3$
      009242 CD 82 33         [ 4] 3640 	call putc
      009245 A1 5C            [ 1] 3641 	cp a,#'\ 
      009247 26 F1            [ 1] 3642 	jrne 1$ 
      009249                       3643 2$:
      009249 CD 82 33         [ 4] 3644 	call putc 
      00924C 20 EC            [ 2] 3645 	jra 1$
      00924E 88               [ 1] 3646 3$: push a 
      00924F A6 5C            [ 1] 3647 	ld a,#'\
      009251 CD 82 33         [ 4] 3648 	call putc 
      009254 84               [ 1] 3649 	pop a 
      009255 A0 07            [ 1] 3650 	sub a,#7
      009257 C7 00 0E         [ 1] 3651 	ld acc8,a 
      00925A 72 5F 00 0D      [ 1] 3652 	clr acc16
      00925E 90 AE 8A 94      [ 2] 3653 	ldw y,#escaped 
      009262 72 B9 00 0D      [ 2] 3654 	addw y,acc16 
      009266 90 F6            [ 1] 3655 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009268 20 DF            [ 2] 3656 	jra 2$
      00926A A6 22            [ 1] 3657 9$: ld a,#'"
      00926C CD 82 33         [ 4] 3658 	call putc 
      00926F 5C               [ 2] 3659 	incw x 
      009270 81               [ 4] 3660 	ret
                                   3661 
                                   3662 
                                   3663 ;--------------------------
                                   3664 ; decompile line from token list 
                                   3665 ; input:
                                   3666 ;   A       stop at this position 
                                   3667 ;   X 		pointer at line
                                   3668 ; output:
                                   3669 ;   none 
                                   3670 ;--------------------------	
                           000001  3671 	BASE_SAV=1
                           000002  3672 	WIDTH_SAV=2
                           000003  3673 	XSAVE=3
                           000005  3674 	LLEN=5
                           000005  3675 	VSIZE=5 
      009271                       3676 prt_basic_line:
      0011F1                       3677 	_vars VSIZE
      009271 52 05            [ 2]    1     sub sp,#VSIZE 
      009273 6B 05            [ 1] 3678 	ld (LLEN,sp),a  
      009275 C6 00 0B         [ 1] 3679 	ld a,base
      009278 6B 01            [ 1] 3680 	ld (BASE_SAV,sp),a  
      00927A C6 00 27         [ 1] 3681 	ld a,tab_width 
      00927D 6B 02            [ 1] 3682 	ld (WIDTH_SAV,sp),a 
      00927F CF 00 18         [ 2] 3683 	ldw ptr16,x
      009282 FE               [ 2] 3684 	ldw x,(x)
      009283 35 0A 00 0B      [ 1] 3685 	mov base,#10
      009287 35 05 00 27      [ 1] 3686 	mov tab_width,#5
      00928B CD 88 CA         [ 4] 3687 	call print_int ; print line number 
      00928E A6 20            [ 1] 3688 	ld a,#SPACE 
      009290 CD 82 33         [ 4] 3689 	call putc 
      009293 72 5F 00 27      [ 1] 3690 	clr tab_width
      009297 AE 00 03         [ 2] 3691 	ldw x,#3
      00929A 9F               [ 1] 3692 1$:	ld a,xl 
      00929B 11 05            [ 1] 3693 	cp a,(LLEN,sp)
      00929D 2B 03            [ 1] 3694 	jrmi 20$
      00929F CC 93 A4         [ 2] 3695 	jp 90$
      0092A2                       3696 20$:	 
      0092A2 72 D6 00 18      [ 4] 3697 	ld a,([ptr16],x)
      0092A6 5C               [ 2] 3698 	incw x 
      0092A7 1F 03            [ 2] 3699 	ldw (XSAVE,sp),x 
      0092A9 A1 06            [ 1] 3700 	cp a,#TK_CMD 
      0092AB 25 44            [ 1] 3701 	jrult 5$
      0092AD A1 08            [ 1] 3702 	cp a,#TK_CFUNC 
      0092AF 22 2F            [ 1] 3703 	jrugt 4$
      0092B1                       3704 2$:	
      0092B1 72 DE 00 18      [ 5] 3705 	ldw x,([ptr16],x)
      0092B5 A3 94 C6         [ 2] 3706 	cpw x,#rem 
      0092B8 26 14            [ 1] 3707 	jrne 3$
      0092BA A6 27            [ 1] 3708 	ld a,#''
      0092BC CD 82 33         [ 4] 3709 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0092BF 1E 03            [ 2] 3710 	ldw x,(XSAVE,sp)
      0092C1 1C 00 02         [ 2] 3711 	addw x,#2
      0092C4 72 BB 00 18      [ 2] 3712 	addw x,ptr16  
      0092C8 CD 82 46         [ 4] 3713 	call puts 
      0092CB CC 93 A4         [ 2] 3714 	jp 90$ 
      0092CE CD 8E 70         [ 4] 3715 3$:	call cmd_name
      0092D1 CD 92 21         [ 4] 3716 	call prt_cmd_name
      0092D4 A6 20            [ 1] 3717 	ld a,#SPACE 
      0092D6 CD 82 33         [ 4] 3718 	call putc 
      0092D9 1E 03            [ 2] 3719 	ldw x,(XSAVE,sp)
      0092DB 1C 00 02         [ 2] 3720 	addw x,#2
      0092DE 20 BA            [ 2] 3721 	jra 1$
      0092E0 A1 0A            [ 1] 3722 4$: cp a,#TK_QSTR 
      0092E2 26 0D            [ 1] 3723 	jrne 5$
      0092E4 72 BB 00 18      [ 2] 3724 	addw x,ptr16
      0092E8 CD 92 35         [ 4] 3725 	call prt_quote 
      0092EB 72 B0 00 18      [ 2] 3726 	subw x,ptr16  
      0092EF 20 A9            [ 2] 3727 	jra 1$
      0092F1 A1 05            [ 1] 3728 5$:	cp a,#TK_VAR
      0092F3 26 1A            [ 1] 3729 	jrne 6$ 
      0092F5 72 DE 00 18      [ 5] 3730 	ldw x,([ptr16],x)
      0092F9 1D 00 29         [ 2] 3731 	subw x,#vars 
      0092FC 9F               [ 1] 3732 	ld a,xl
      0092FD 44               [ 1] 3733 	srl a 
      0092FE AB 41            [ 1] 3734 	add a,#'A 
      009300 CD 82 33         [ 4] 3735 	call putc 
      009303 A6 20            [ 1] 3736 	ld a,#SPACE 
      009305 CD 82 33         [ 4] 3737 	call putc 
      009308 1E 03            [ 2] 3738 	ldw x,(XSAVE,sp)
      00930A 1C 00 02         [ 2] 3739 	addw x,#2 
      00930D 20 8B            [ 2] 3740 	jra 1$ 
      00930F A1 02            [ 1] 3741 6$: cp a,#TK_ARRAY 
      009311 26 0A            [ 1] 3742 	jrne 7$
      009313 A6 40            [ 1] 3743 	ld a,#'@ 
      009315 CD 82 33         [ 4] 3744 	call putc 
      009318 1E 03            [ 2] 3745 	ldw x,(XSAVE,sp)
      00931A CC 92 9A         [ 2] 3746 	jp 1$ 
      00931D A1 04            [ 1] 3747 7$: cp a,#TK_INTGR 
      00931F 26 0F            [ 1] 3748 	jrne 8$
      009321 72 DE 00 18      [ 5] 3749 	ldw x,([ptr16],x)
      009325 CD 88 CA         [ 4] 3750 	call print_int
                                   3751 ;	ld a,#SPACE 
                                   3752 ;	call putc 
      009328 1E 03            [ 2] 3753 	ldw x,(XSAVE,sp)
      00932A 1C 00 02         [ 2] 3754 	addw x,#2 
      00932D CC 92 9A         [ 2] 3755 	jp 1$
      009330 A1 31            [ 1] 3756 8$: cp a,#TK_GT 
      009332 2B 1A            [ 1] 3757 	jrmi 9$
      009334 A1 35            [ 1] 3758 	cp a,#TK_NE 
      009336 22 16            [ 1] 3759 	jrugt 9$
      009338 A0 31            [ 1] 3760 	sub a,#TK_GT  
      00933A 48               [ 1] 3761 	sll a 
      00933B 90 5F            [ 1] 3762 	clrw y 
      00933D 90 97            [ 1] 3763 	ld yl,a 
      00933F 72 A9 93 BD      [ 2] 3764 	addw y,#relop_str 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009343 90 FE            [ 2] 3765 	ldw y,(y)
      009345 93               [ 1] 3766 	ldw x,y 
      009346 CD 82 46         [ 4] 3767 	call puts 
      009349 1E 03            [ 2] 3768 	ldw x,(XSAVE,sp)
      00934B CC 92 9A         [ 2] 3769 	jp 1$
      00934E A1 10            [ 1] 3770 9$: cp a,#TK_PLUS 
      009350 26 04            [ 1] 3771 	jrne 10$
      009352 A6 2B            [ 1] 3772 	ld a,#'+
      009354 20 46            [ 2] 3773 	jra 80$ 
      009356 A1 11            [ 1] 3774 10$: cp a,#TK_MINUS
      009358 26 04            [ 1] 3775 	jrne 11$
      00935A A6 2D            [ 1] 3776 	ld a,#'-
      00935C 20 3E            [ 2] 3777 	jra 80$
      00935E A1 20            [ 1] 3778 11$: cp a,#TK_MULT 
      009360 2B 0E            [ 1] 3779 	jrmi 12$
      009362 A1 22            [ 1] 3780 	cp a,#TK_MOD 
      009364 22 0A            [ 1] 3781 	jrugt 12$
      009366 A0 20            [ 1] 3782 	sub a,#0x20
      009368 5F               [ 1] 3783 	clrw x 
      009369 97               [ 1] 3784 	ld xl,a 
      00936A 1C 93 BA         [ 2] 3785 	addw x,#mul_char 
      00936D F6               [ 1] 3786 	ld a,(x)
      00936E 20 2C            [ 2] 3787 	jra 80$ 
      009370 A1 0B            [ 1] 3788 12$: cp a,#TK_LPAREN 
      009372 2B 0E            [ 1] 3789 	jrmi 13$
      009374 A1 0E            [ 1] 3790 	cp a,#TK_SHARP 
      009376 22 0A            [ 1] 3791 	jrugt 13$
      009378 A0 0B            [ 1] 3792 	sub a,#TK_LPAREN
      00937A 5F               [ 1] 3793 	clrw x 
      00937B 97               [ 1] 3794 	ld xl,a 
      00937C 1C 93 B6         [ 2] 3795 	addw x,#single_char 
      00937F F6               [ 1] 3796 	ld a,(x)
      009380 20 1A            [ 2] 3797 	jra 80$
      009382 A1 03            [ 1] 3798 13$: cp a,#TK_CHAR 
      009384 26 14            [ 1] 3799 	jrne 14$
      009386 A6 5C            [ 1] 3800 	ld a,#'\
      009388 CD 82 33         [ 4] 3801 	call putc 
      00938B 1E 03            [ 2] 3802 	ldw x,(XSAVE,sp)
      00938D 72 D6 00 18      [ 4] 3803 	ld a,([ptr16],x)
      009391 5C               [ 2] 3804 	incw x 
      009392 1F 03            [ 2] 3805 	ldw (XSAVE,sp),x 
      009394 CD 82 33         [ 4] 3806 	call putc 
      009397 CC 92 9A         [ 2] 3807 	jp 1$ 
      00939A A6 3A            [ 1] 3808 14$: ld a,#':
      00939C CD 82 33         [ 4] 3809 80$: call putc 
      00939F 1E 03            [ 2] 3810 	ldw x,(XSAVE,sp)
      0093A1 CC 92 9A         [ 2] 3811 	jp 1$ 
      0093A4                       3812 90$: 
      0093A4 A6 0D            [ 1] 3813 	ld a,#CR 
      0093A6 CD 82 33         [ 4] 3814 	call putc
      0093A9 7B 02            [ 1] 3815 	ld a,(WIDTH_SAV,sp) 
      0093AB C7 00 27         [ 1] 3816 	ld tab_width,a 
      0093AE 7B 01            [ 1] 3817 	ld a,(BASE_SAV,sp) 
      0093B0 C7 00 0B         [ 1] 3818 	ld base,a
      001333                       3819 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093B3 5B 05            [ 2]    1     addw sp,#VSIZE 
      0093B5 81               [ 4] 3820 	ret 	
      0093B6 28 29 2C 23           3821 single_char: .byte '(',')',',','#'
      0093BA 2A 2F 25              3822 mul_char: .byte '*','/','%'
      0093BD 93 C9 93 CB 93 CD 93  3823 relop_str: .word gt,equal,ge,lt,le,ne 
             D0 93 D2 93 D5
      0093C9 3E 00                 3824 gt: .asciz ">"
      0093CB 3D 00                 3825 equal: .asciz "="
      0093CD 3E 3D 00              3826 ge: .asciz ">="
      0093D0 3C 00                 3827 lt: .asciz "<"
      0093D2 3C 3D 00              3828 le: .asciz "<="
      0093D5 3C 3E 00              3829 ne:  .asciz "<>"
                                   3830 
                                   3831 
                                   3832 ;---------------------------------
                                   3833 ; BASIC: PRINT|? arg_list 
                                   3834 ; print values from argument list
                                   3835 ;----------------------------------
                           000001  3836 	COMMA=1
                           000001  3837 	VSIZE=1
      0093D8                       3838 print:
      0093D8 4B 00            [ 1] 3839 push #0 ; local variable COMMA 
      0093DA                       3840 reset_comma:
      0093DA 0F 01            [ 1] 3841 	clr (COMMA,sp)
      0093DC                       3842 prt_loop:
      0093DC CD 90 54         [ 4] 3843 	call relation 
      0093DF A1 01            [ 1] 3844 	cp a,#TK_COLON 
      0093E1 27 53            [ 1] 3845 	jreq print_exit   
      0093E3 A1 04            [ 1] 3846 	cp a,#TK_INTGR 
      0093E5 26 05            [ 1] 3847 	jrne 0$ 
      0093E7 CD 88 CA         [ 4] 3848 	call print_int 
      0093EA 20 EE            [ 2] 3849 	jra reset_comma
      0093EC                       3850 0$: 	
      0093EC CD 88 35         [ 4] 3851 	call next_token
      0093EF A1 00            [ 1] 3852 	cp a,#TK_NONE 
      0093F1 27 43            [ 1] 3853 	jreq print_exit 
      0093F3 A1 0A            [ 1] 3854 1$:	cp a,#TK_QSTR
      0093F5 26 05            [ 1] 3855 	jrne 2$   
      0093F7 CD 82 46         [ 4] 3856 	call puts
      0093FA 20 DE            [ 2] 3857 	jra reset_comma
      0093FC A1 03            [ 1] 3858 2$: cp a,#TK_CHAR 
      0093FE 26 06            [ 1] 3859 	jrne 3$
      009400 9F               [ 1] 3860 	ld a,xl 
      009401 CD 82 33         [ 4] 3861 	call putc 
      009404 20 D4            [ 2] 3862 	jra reset_comma 
      009406                       3863 3$: 	
      009406 A1 08            [ 1] 3864 	cp a,#TK_CFUNC 
      009408 26 07            [ 1] 3865 	jrne 4$ 
      00940A FD               [ 4] 3866 	call (x)
      00940B 9F               [ 1] 3867 	ld a,xl 
      00940C CD 82 33         [ 4] 3868 	call putc
      00940F 20 C9            [ 2] 3869 	jra reset_comma 
      009411                       3870 4$: 
      009411 A1 0D            [ 1] 3871 	cp a,#TK_COMMA 
      009413 26 05            [ 1] 3872 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009415 03 01            [ 1] 3873 	cpl (COMMA,sp) 
      009417 CC 93 DC         [ 2] 3874 	jp prt_loop   
      00941A                       3875 5$: 
      00941A A1 0E            [ 1] 3876 	cp a,#TK_SHARP
      00941C 26 13            [ 1] 3877 	jrne 7$
      00941E CD 88 35         [ 4] 3878 	call next_token
      009421 A1 04            [ 1] 3879 	cp a,#TK_INTGR 
      009423 27 03            [ 1] 3880 	jreq 6$
      009425 CC 87 81         [ 2] 3881 	jp syntax_error 
      009428                       3882 6$:
      009428 9F               [ 1] 3883 	ld a,xl 
      009429 A4 0F            [ 1] 3884 	and a,#15 
      00942B C7 00 27         [ 1] 3885 	ld tab_width,a 
      00942E CC 93 DA         [ 2] 3886 	jp reset_comma 
      009431                       3887 7$:	
      0013B1                       3888 	_unget_token
      009431 55 00 03 00 02   [ 1]    1     mov in,in.saved
      009436                       3889 print_exit:
      009436 0D 01            [ 1] 3890 	tnz (COMMA,sp)
      009438 26 05            [ 1] 3891 	jrne 9$
      00943A A6 0D            [ 1] 3892 	ld a,#CR 
      00943C CD 82 33         [ 4] 3893     call putc 
      0013BF                       3894 9$:	_drop VSIZE 
      00943F 5B 01            [ 2]    1     addw sp,#VSIZE 
      009441 81               [ 4] 3895 	ret 
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
      009442                       3913 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0013C2                       3914 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0013C2                       3915 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      0013C2                       3916 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      0013C2                       3917 save_context:
      009442 CE 00 05         [ 2] 3918 	ldw x,basicptr 
      009445 1F 03            [ 2] 3919 	ldw (BPTR,sp),x
      009447 C6 00 02         [ 1] 3920 	ld a,in 
      00944A 6B 05            [ 1] 3921 	ld (IN,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00944C C6 00 04         [ 1] 3922 	ld a,count 
      00944F 6B 06            [ 1] 3923 	ld (CNT,sp),a  
      009451 81               [ 4] 3924 	ret
                                   3925 
                                   3926 ;-----------------------
                                   3927 ; restore previously saved 
                                   3928 ; BASIC interpreter context 
                                   3929 ; from stack 
                                   3930 ;-------------------------
      009452                       3931 rest_context:
      009452 1E 03            [ 2] 3932 	ldw x,(BPTR,sp)
      009454 CF 00 05         [ 2] 3933 	ldw basicptr,x 
      009457 7B 05            [ 1] 3934 	ld a,(IN,sp)
      009459 C7 00 02         [ 1] 3935 	ld in,a
      00945C 7B 06            [ 1] 3936 	ld a,(CNT,sp)
      00945E C7 00 04         [ 1] 3937 	ld count,a  
      009461 81               [ 4] 3938 	ret
                                   3939 
                                   3940 ;------------------------------------------
                                   3941 ; BASIC: INPUT [string],var[,[string],var]
                                   3942 ; input value in variables 
                                   3943 ; [string] optionally can be used as prompt 
                                   3944 ;-----------------------------------------
                           000001  3945 	CX_BPTR=1
                           000003  3946 	CX_IN=3
                           000004  3947 	CX_CNT=4
                           000005  3948 	SKIP=5
                           000006  3949 	VAR_ADDR=6 
                           000007  3950 	VSIZE=7
      009462                       3951 input_var:
      0013E2                       3952 	_vars VSIZE 
      009462 52 07            [ 2]    1     sub sp,#VSIZE 
      009464                       3953 input_loop:
      009464 0F 05            [ 1] 3954 	clr (SKIP,sp)
      009466 CD 88 35         [ 4] 3955 	call next_token 
      009469 A1 0A            [ 1] 3956 	cp a,#TK_QSTR 
      00946B 26 08            [ 1] 3957 	jrne 1$ 
      00946D CD 82 46         [ 4] 3958 	call puts 
      009470 03 05            [ 1] 3959 	cpl (SKIP,sp)
      009472 CD 88 35         [ 4] 3960 	call next_token 
      009475 A1 05            [ 1] 3961 1$: cp a,#TK_VAR  
      009477 27 03            [ 1] 3962 	jreq 2$ 
      009479 CC 87 81         [ 2] 3963 	jp syntax_error
      00947C 1F 06            [ 2] 3964 2$:	ldw (VAR_ADDR,sp),x 
      00947E 0D 05            [ 1] 3965 	tnz (SKIP,sp)
      009480 26 06            [ 1] 3966 	jrne 21$ 
                                   3967 ;	clr pad+2
      009482 AE 17 38         [ 2] 3968 	ldw x,#pad 
      009485 CD 82 46         [ 4] 3969 	call puts   
      009488                       3970 21$:
      009488 A6 3A            [ 1] 3971 	ld a,#':
      00948A CD 82 33         [ 4] 3972 	call putc 
      00948D CD 94 42         [ 4] 3973 	call save_context 
      009490 72 5F 00 04      [ 1] 3974 	clr count  
      009494 CD 89 BA         [ 4] 3975 	call readln 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009497 AE 16 E8         [ 2] 3976 	ldw x,#tib 
      00949A CF 00 05         [ 2] 3977 	ldw basicptr,x  
      00949D 72 5F 00 02      [ 1] 3978 	clr in 
      0094A1 CD 8B 39         [ 4] 3979 	call get_token
      0094A4 A1 04            [ 1] 3980 	cp a,#TK_INTGR
      0094A6 27 06            [ 1] 3981 	jreq 3$ 
      0094A8 CD 94 52         [ 4] 3982 	call rest_context 
      0094AB CC 87 81         [ 2] 3983 	jp syntax_error
      0094AE 90 85            [ 2] 3984 3$: popw y 
      0094B0 90 FF            [ 2] 3985 	ldw (y),x 
      0094B2 CD 94 52         [ 4] 3986 	call rest_context
      0094B5 CD 88 35         [ 4] 3987 	call next_token 
      0094B8 A1 0D            [ 1] 3988 	cp a,#TK_COMMA 
      0094BA 27 A8            [ 1] 3989 	jreq input_loop 
      0094BC A1 01            [ 1] 3990 	cp a,#TK_COLON 
      0094BE 23 03            [ 2] 3991     jrule input_exit 
      0094C0 CC 87 81         [ 2] 3992 	jp syntax_error 
      0094C3                       3993 input_exit:
      001443                       3994 	_drop VSIZE 
      0094C3 5B 07            [ 2]    1     addw sp,#VSIZE 
      0094C5 81               [ 4] 3995 	ret 
                                   3996 
                                   3997 
                                   3998 ;---------------------
                                   3999 ; BASIC: REMARK | ' 
                                   4000 ; skip comment to end of line 
                                   4001 ;---------------------- 
      0094C6                       4002 rem:
      0094C6 55 00 02 00 04   [ 1] 4003  	mov count,in 
      0094CB 81               [ 4] 4004 	ret 
                                   4005 
                                   4006 ;---------------------
                                   4007 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4008 ; read in loop 'addr'  
                                   4009 ; apply & 'mask' to value 
                                   4010 ; loop while result==0.  
                                   4011 ; if 'xor_mask' given 
                                   4012 ; apply ^ in second  
                                   4013 ; loop while result==0 
                                   4014 ;---------------------
                           000001  4015 	XMASK=1 
                           000002  4016 	MASK=2
                           000003  4017 	ADDR=3
                           000004  4018 	VSIZE=4
      0094CC                       4019 wait: 
      00144C                       4020 	_vars VSIZE
      0094CC 52 04            [ 2]    1     sub sp,#VSIZE 
      0094CE 0F 01            [ 1] 4021 	clr (XMASK,sp) 
      0094D0 CD 8F 04         [ 4] 4022 	call arg_list 
      0094D3 A1 02            [ 1] 4023 	cp a,#2
      0094D5 24 03            [ 1] 4024 	jruge 0$
      0094D7 CC 87 81         [ 2] 4025 	jp syntax_error 
      0094DA A1 03            [ 1] 4026 0$:	cp a,#3
      0094DC 25 04            [ 1] 4027 	jrult 1$
      0094DE 85               [ 2] 4028 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094DF 9F               [ 1] 4029 	ld a,xl
      0094E0 6B 01            [ 1] 4030 	ld (XMASK,sp),a 
      0094E2 85               [ 2] 4031 1$: popw x ; mask 
      0094E3 9F               [ 1] 4032 	ld a,xl 
      0094E4 6B 02            [ 1] 4033 	ld (MASK,sp),a 
      0094E6 85               [ 2] 4034 	popw x ; address 
      0094E7 F6               [ 1] 4035 2$:	ld a,(x)
      0094E8 14 02            [ 1] 4036 	and a,(MASK,sp)
      0094EA 18 01            [ 1] 4037 	xor a,(XMASK,sp)
      0094EC 27 F9            [ 1] 4038 	jreq 2$ 
      00146E                       4039 	_drop VSIZE 
      0094EE 5B 04            [ 2]    1     addw sp,#VSIZE 
      0094F0 81               [ 4] 4040 	ret 
                                   4041 
                                   4042 ;---------------------
                                   4043 ; BASIC: BSET addr,mask
                                   4044 ; set bits at 'addr' corresponding 
                                   4045 ; to those of 'mask' that are at 1.
                                   4046 ; arguments:
                                   4047 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4048 ;   mask        mask|addr
                                   4049 ; output:
                                   4050 ;	none 
                                   4051 ;--------------------------
      0094F1                       4052 bit_set:
      0094F1 CD 8F 04         [ 4] 4053 	call arg_list 
      0094F4 A1 02            [ 1] 4054 	cp a,#2	 
      0094F6 27 03            [ 1] 4055 	jreq 1$ 
      0094F8 CC 87 81         [ 2] 4056 	jp syntax_error
      0094FB                       4057 1$: 
      0094FB 85               [ 2] 4058 	popw x ; mask 
      0094FC 9F               [ 1] 4059 	ld a,xl 
      0094FD 85               [ 2] 4060 	popw x ; addr  
      0094FE FA               [ 1] 4061 	or a,(x)
      0094FF F7               [ 1] 4062 	ld (x),a
      009500 81               [ 4] 4063 	ret 
                                   4064 
                                   4065 ;---------------------
                                   4066 ; BASIC: BRES addr,mask
                                   4067 ; reset bits at 'addr' corresponding 
                                   4068 ; to those of 'mask' that are at 1.
                                   4069 ; arguments:
                                   4070 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4071 ;   mask	    ~mask&*addr  
                                   4072 ; output:
                                   4073 ;	none 
                                   4074 ;--------------------------
      009501                       4075 bit_reset:
      009501 CD 8F 04         [ 4] 4076 	call arg_list 
      009504 A1 02            [ 1] 4077 	cp a,#2  
      009506 27 03            [ 1] 4078 	jreq 1$ 
      009508 CC 87 81         [ 2] 4079 	jp syntax_error
      00950B                       4080 1$: 
      00950B 85               [ 2] 4081 	popw x ; mask 
      00950C 9F               [ 1] 4082 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00950D 43               [ 1] 4083 	cpl a 
      00950E 85               [ 2] 4084 	popw x ; addr  
      00950F F4               [ 1] 4085 	and a,(x)
      009510 F7               [ 1] 4086 	ld (x),a 
      009511 81               [ 4] 4087 	ret 
                                   4088 
                                   4089 ;---------------------
                                   4090 ; BASIC: BTOGL addr,mask
                                   4091 ; toggle bits at 'addr' corresponding 
                                   4092 ; to those of 'mask' that are at 1.
                                   4093 ; arguments:
                                   4094 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4095 ;   mask	    mask^*addr  
                                   4096 ; output:
                                   4097 ;	none 
                                   4098 ;--------------------------
      009512                       4099 bit_toggle:
      009512 CD 8F 04         [ 4] 4100 	call arg_list 
      009515 A1 02            [ 1] 4101 	cp a,#2 
      009517 27 03            [ 1] 4102 	jreq 1$ 
      009519 CC 87 81         [ 2] 4103 	jp syntax_error
      00951C 85               [ 2] 4104 1$: popw x ; mask 
      00951D 9F               [ 1] 4105 	ld a,xl 
      00951E 85               [ 2] 4106 	popw x ; addr  
      00951F F8               [ 1] 4107 	xor a,(x)
      009520 F7               [ 1] 4108 	ld (x),a 
      009521 81               [ 4] 4109 	ret 
                                   4110 
                                   4111 
                                   4112 ;---------------------
                                   4113 ; BASIC: BTEST(addr,bit)
                                   4114 ; return bit value at 'addr' 
                                   4115 ; bit is in range {0..7}.
                                   4116 ; arguments:
                                   4117 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4118 ;   bit 	    bit position {0..7}  
                                   4119 ; output:
                                   4120 ;	none 
                                   4121 ;--------------------------
      009522                       4122 bit_test:
      009522 CD 8F 2B         [ 4] 4123 	call func_args 
      009525 A1 02            [ 1] 4124 	cp a,#2
      009527 27 03            [ 1] 4125 	jreq 0$
      009529 CC 87 81         [ 2] 4126 	jp syntax_error
      00952C                       4127 0$:	
      00952C 85               [ 2] 4128 	popw x 
      00952D 9F               [ 1] 4129 	ld a,xl 
      00952E A4 07            [ 1] 4130 	and a,#7
      009530 88               [ 1] 4131 	push a   
      009531 A6 01            [ 1] 4132 	ld a,#1 
      009533 0D 01            [ 1] 4133 1$: tnz (1,sp)
      009535 27 05            [ 1] 4134 	jreq 2$
      009537 48               [ 1] 4135 	sll a 
      009538 0A 01            [ 1] 4136 	dec (1,sp)
      00953A 20 F7            [ 2] 4137 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0014BC                       4138 2$: _drop 1 
      00953C 5B 01            [ 2]    1     addw sp,#1 
      00953E 85               [ 2] 4139 	popw x 
      00953F F4               [ 1] 4140 	and a,(x)
      009540 27 02            [ 1] 4141 	jreq 3$
      009542 A6 01            [ 1] 4142 	ld a,#1 
      009544 5F               [ 1] 4143 3$:	clrw x 
      009545 97               [ 1] 4144 	ld xl,a 
      009546 A6 04            [ 1] 4145 	ld a,#TK_INTGR
      009548 81               [ 4] 4146 	ret
                                   4147 
                                   4148 
                                   4149 ;--------------------
                                   4150 ; BASIC: POKE addr,byte
                                   4151 ; put a byte at addr 
                                   4152 ;--------------------
      009549                       4153 poke:
      009549 CD 8F 04         [ 4] 4154 	call arg_list 
      00954C A1 02            [ 1] 4155 	cp a,#2
      00954E 27 03            [ 1] 4156 	jreq 1$
      009550 CC 87 81         [ 2] 4157 	jp syntax_error
      009553                       4158 1$:	
      009553 85               [ 2] 4159 	popw x  
      009554 9F               [ 1] 4160     ld a,xl 
      009555 85               [ 2] 4161 	popw x 
      009556 F7               [ 1] 4162 	ld (x),a 
      009557 81               [ 4] 4163 	ret 
                                   4164 
                                   4165 ;-----------------------
                                   4166 ; BASIC: PEEK(addr)
                                   4167 ; get the byte at addr 
                                   4168 ; input:
                                   4169 ;	none 
                                   4170 ; output:
                                   4171 ;	X 		value 
                                   4172 ;-----------------------
      009558                       4173 peek:
      009558 CD 8F 2B         [ 4] 4174 	call func_args
      00955B A1 01            [ 1] 4175 	cp a,#1
      00955D 27 03            [ 1] 4176 	jreq 1$
      00955F CC 87 81         [ 2] 4177 	jp syntax_error
      009562 85               [ 2] 4178 1$:	popw x 
      009563 F6               [ 1] 4179 	ld a,(x)
      009564 5F               [ 1] 4180 	clrw x 
      009565 97               [ 1] 4181 	ld xl,a 
      009566 A6 04            [ 1] 4182 	ld a,#TK_INTGR
      009568 81               [ 4] 4183 	ret 
                                   4184 
                                   4185 ;----------------------------
                                   4186 ; BASIC: XPEEK(page,addr)
                                   4187 ; read extended memory byte
                                   4188 ; page in range {0,1,2}
                                   4189 ;----------------------------
      009569                       4190 xpeek:
      009569 CD 8F 2B         [ 4] 4191 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00956C A1 02            [ 1] 4192 	cp a,#2 
      00956E 27 03            [ 1] 4193 	jreq 1$
      009570 CC 87 81         [ 2] 4194 	jp syntax_error
      009573                       4195 1$: 
      009573 85               [ 2] 4196 	popw x  
      009574 CF 00 18         [ 2] 4197 	ldw farptr+1,x 
      009577 85               [ 2] 4198 	popw x 
      009578 9F               [ 1] 4199 	ld a,xl 
      009579 C7 00 17         [ 1] 4200 	ld farptr,a 
      00957C 5F               [ 1] 4201 	clrw x
      00957D 92 BC 00 17      [ 5] 4202 	ldf a,[farptr]
      009581 97               [ 1] 4203 	ld xl,a 
      009582 A6 04            [ 1] 4204 	ld a,#TK_INTGR 
      009584 81               [ 4] 4205 	ret 
                                   4206 
                                   4207 ;---------------------------
                                   4208 ; BASIC IF expr : instructions
                                   4209 ; evaluate expr and if true 
                                   4210 ; execute instructions on same line. 
                                   4211 ;----------------------------
      009585                       4212 if: 
      009585 CD 90 54         [ 4] 4213 	call relation 
      009588 A1 04            [ 1] 4214 	cp a,#TK_INTGR
      00958A 27 03            [ 1] 4215 	jreq 1$ 
      00958C CC 87 81         [ 2] 4216 	jp syntax_error
      00958F 4F               [ 1] 4217 1$:	clr a 
      009590 5D               [ 2] 4218 	tnzw x 
      009591 26 05            [ 1] 4219 	jrne 9$  
                                   4220 ;skip to next line
      009593 55 00 04 00 02   [ 1] 4221 	mov in,count
      009598 81               [ 4] 4222 9$:	ret 
                                   4223 
                                   4224 ;------------------------
                                   4225 ; BASIC: FOR var=expr 
                                   4226 ; set variable to expression 
                                   4227 ; leave variable address 
                                   4228 ; on stack and set
                                   4229 ; FLOOP bit in 'flags'
                                   4230 ;-----------------
                           000001  4231 	RETL1=1 ; return address  
                           000003  4232 	FSTEP=3  ; variable increment
                           000005  4233 	LIMIT=5 ; loop limit 
                           000007  4234 	CVAR=7   ; control variable 
                           000009  4235 	INW=9   ;  in.w saved
                           00000B  4236 	BPTR=11 ; baseptr saved
                           00000A  4237 	VSIZE=10  
      009599                       4238 for: ; { -- var_addr }
      009599 85               [ 2] 4239 	popw x ; call return address 
      00151A                       4240 	_vars VSIZE 
      00959A 52 0A            [ 2]    1     sub sp,#VSIZE 
      00959C 89               [ 2] 4241 	pushw x  ; RETL1 
      00959D A6 05            [ 1] 4242 	ld a,#TK_VAR 
      00959F CD 8E F7         [ 4] 4243 	call expect
      0095A2 1F 07            [ 2] 4244 	ldw (CVAR,sp),x  ; control variable 
      0095A4 CD 91 8D         [ 4] 4245 	call let02 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095A7 72 14 00 26      [ 1] 4246 	bset flags,#FLOOP 
                                   4247 ; open space on stack for loop data 
      0095AB 5F               [ 1] 4248 	clrw x 
      0095AC 1F 0B            [ 2] 4249 	ldw (BPTR,sp),x 
      0095AE 1F 09            [ 2] 4250 	ldw (INW,sp),x 
      0095B0 CD 88 35         [ 4] 4251 	call next_token 
      0095B3 A1 06            [ 1] 4252 	cp a,#TK_CMD 
      0095B5 27 03            [ 1] 4253 	jreq 1$
      0095B7 CC 87 81         [ 2] 4254 	jp syntax_error
      0095BA                       4255 1$:  
      0095BA A3 95 C2         [ 2] 4256 	cpw x,#to 
      0095BD 27 03            [ 1] 4257 	jreq to
      0095BF CC 87 81         [ 2] 4258 	jp syntax_error 
                                   4259 
                                   4260 ;-----------------------------------
                                   4261 ; BASIC: TO expr 
                                   4262 ; second part of FOR loop initilization
                                   4263 ; leave limit on stack and set 
                                   4264 ; FTO bit in 'flags'
                                   4265 ;-----------------------------------
      0095C2                       4266 to: ; { var_addr -- var_addr limit step }
      0095C2 72 04 00 26 03   [ 2] 4267 	btjt flags,#FLOOP,1$
      0095C7 CC 87 81         [ 2] 4268 	jp syntax_error
      0095CA CD 90 54         [ 4] 4269 1$: call relation  
      0095CD A1 04            [ 1] 4270 	cp a,#TK_INTGR 
      0095CF 27 03            [ 1] 4271 	jreq 2$ 
      0095D1 CC 87 81         [ 2] 4272 	jp syntax_error
      0095D4 1F 05            [ 2] 4273 2$: ldw (LIMIT,sp),x
                                   4274 ;	ldw x,in.w 
      0095D6 CD 88 35         [ 4] 4275 	call next_token
      0095D9 A1 00            [ 1] 4276 	cp a,#TK_NONE  
      0095DB 27 0E            [ 1] 4277 	jreq 4$ 
      0095DD A1 06            [ 1] 4278 	cp a,#TK_CMD
      0095DF 26 05            [ 1] 4279 	jrne 3$
      0095E1 A3 95 F2         [ 2] 4280 	cpw x,#step 
      0095E4 27 0C            [ 1] 4281 	jreq step
      0095E6                       4282 3$:	
      001566                       4283 	_unget_token   	 
      0095E6 55 00 03 00 02   [ 1]    1     mov in,in.saved
      0095EB                       4284 4$:	
      0095EB AE 00 01         [ 2] 4285 	ldw x,#1   ; default step  
      0095EE 1F 03            [ 2] 4286 	ldw (FSTEP,sp),x 
      0095F0 20 14            [ 2] 4287 	jra store_loop_addr 
                                   4288 
                                   4289 
                                   4290 ;----------------------------------
                                   4291 ; BASIC: STEP expr 
                                   4292 ; optional third par of FOR loop
                                   4293 ; initialization. 	
                                   4294 ;------------------------------------
      0095F2                       4295 step: ; {var limit -- var limit step}
      0095F2 72 04 00 26 03   [ 2] 4296 	btjt flags,#FLOOP,1$
      0095F7 CC 87 81         [ 2] 4297 	jp syntax_error
      0095FA CD 90 54         [ 4] 4298 1$: call relation
      0095FD A1 04            [ 1] 4299 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095FF 27 03            [ 1] 4300 	jreq 2$
      009601 CC 87 81         [ 2] 4301 	jp syntax_error
      009604 1F 03            [ 2] 4302 2$:	ldw (FSTEP,sp),x ; step
                                   4303 ; leave loop back entry point on cstack 
                                   4304 ; cstack is 1 call deep from interp_loop
      009606                       4305 store_loop_addr:
      009606 CE 00 05         [ 2] 4306 	ldw x,basicptr  
      009609 1F 0B            [ 2] 4307 	ldw (BPTR,sp),x 
      00960B CE 00 01         [ 2] 4308 	ldw x,in.w 
      00960E 1F 09            [ 2] 4309 	ldw (INW,sp),x   
      009610 72 15 00 26      [ 1] 4310 	bres flags,#FLOOP 
      009614 72 5C 00 23      [ 1] 4311 	inc loop_depth  
      009618 81               [ 4] 4312 	ret 
                                   4313 
                                   4314 ;--------------------------------
                                   4315 ; BASIC: NEXT var 
                                   4316 ; FOR loop control 
                                   4317 ; increment variable with step 
                                   4318 ; and compare with limit 
                                   4319 ; loop if threshold not crossed.
                                   4320 ; else stack. 
                                   4321 ; and decrement 'loop_depth' 
                                   4322 ;--------------------------------
      009619                       4323 next: ; {var limit step retl1 -- [var limit step ] }
      009619 72 5D 00 23      [ 1] 4324 	tnz loop_depth 
      00961D 26 03            [ 1] 4325 	jrne 1$ 
      00961F CC 87 81         [ 2] 4326 	jp syntax_error 
      009622                       4327 1$: 
      009622 A6 05            [ 1] 4328 	ld a,#TK_VAR 
      009624 CD 8E F7         [ 4] 4329 	call expect
                                   4330 ; check for good variable after NEXT 	 
      009627 13 07            [ 2] 4331 	cpw x,(CVAR,sp)
      009629 27 03            [ 1] 4332 	jreq 2$  
      00962B CC 87 81         [ 2] 4333 	jp syntax_error ; not the good one 
      00962E                       4334 2$: ; increment variable 
      00962E FE               [ 2] 4335 	ldw x,(x)  ; get var value 
      00962F 72 FB 03         [ 2] 4336 	addw x,(FSTEP,sp) ; var+step 
      009632 16 07            [ 2] 4337 	ldw y,(CVAR,sp)
      009634 90 FF            [ 2] 4338 	ldw (y),x ; save var new value 
                                   4339 ; check sign of STEP  
      009636 A6 80            [ 1] 4340 	ld a,#0x80
      009638 15 03            [ 1] 4341 	bcp a,(FSTEP,sp)
      00963A 2A 06            [ 1] 4342 	jrpl 4$
                                   4343 ;negative step 
      00963C 13 05            [ 2] 4344 	cpw x,(LIMIT,sp)
      00963E 2F 1B            [ 1] 4345 	jrslt loop_done
      009640 20 04            [ 2] 4346 	jra loop_back 
      009642                       4347 4$: ; positive step
      009642 13 05            [ 2] 4348 	cpw x,(LIMIT,sp)
      009644 2C 15            [ 1] 4349 	jrsgt loop_done
      009646                       4350 loop_back:
      009646 1E 0B            [ 2] 4351 	ldw x,(BPTR,sp)
      009648 CF 00 05         [ 2] 4352 	ldw basicptr,x 
      00964B 72 01 00 26 05   [ 2] 4353 	btjf flags,#FRUN,1$ 
      009650 E6 02            [ 1] 4354 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009652 C7 00 04         [ 1] 4355 	ld count,a
      009655 1E 09            [ 2] 4356 1$:	ldw x,(INW,sp)
      009657 CF 00 01         [ 2] 4357 	ldw in.w,x 
      00965A 81               [ 4] 4358 	ret 
      00965B                       4359 loop_done:
                                   4360 	; remove loop data from stack  
      00965B 85               [ 2] 4361 	popw x
      0015DC                       4362 	_drop VSIZE 
      00965C 5B 0A            [ 2]    1     addw sp,#VSIZE 
      00965E 72 5A 00 23      [ 1] 4363 	dec loop_depth 
                                   4364 ;	pushw x 
                                   4365 ;	ret 
      009662 FC               [ 2] 4366 	jp (x)
                                   4367 
                                   4368 ;----------------------------
                                   4369 ; called by goto/gosub
                                   4370 ; to get target line number 
                                   4371 ;---------------------------
      009663                       4372 get_target_line:
      009663 CD 90 54         [ 4] 4373 	call relation 
      009666 A1 04            [ 1] 4374 	cp a,#TK_INTGR
      009668 27 03            [ 1] 4375 	jreq 1$
      00966A CC 87 81         [ 2] 4376 	jp syntax_error
      00966D CD 82 E8         [ 4] 4377 1$:	call search_lineno  
      009670 5D               [ 2] 4378 	tnzw x 
      009671 26 05            [ 1] 4379 	jrne 2$ 
      009673 A6 05            [ 1] 4380 	ld a,#ERR_NO_LINE 
      009675 CC 87 83         [ 2] 4381 	jp tb_error 
      009678 81               [ 4] 4382 2$:	ret 
                                   4383 
                                   4384 ;------------------------
                                   4385 ; BASIC: GOTO line# 
                                   4386 ; jump to line# 
                                   4387 ; here cstack is 2 call deep from interp_loop 
                                   4388 ;------------------------
      009679                       4389 goto:
      009679 72 00 00 26 06   [ 2] 4390 	btjt flags,#FRUN,0$ 
      00967E A6 06            [ 1] 4391 	ld a,#ERR_RUN_ONLY
      009680 CC 87 83         [ 2] 4392 	jp tb_error 
      009683 81               [ 4] 4393 	ret 
      009684 CD 96 63         [ 4] 4394 0$:	call get_target_line
      009687                       4395 jp_to_target:
      009687 CF 00 05         [ 2] 4396 	ldw basicptr,x 
      00968A E6 02            [ 1] 4397 	ld a,(2,x)
      00968C C7 00 04         [ 1] 4398 	ld count,a 
      00968F 35 03 00 02      [ 1] 4399 	mov in,#3 
      009693 81               [ 4] 4400 	ret 
                                   4401 
                                   4402 
                                   4403 ;--------------------
                                   4404 ; BASIC: GOSUB line#
                                   4405 ; basic subroutine call
                                   4406 ; actual line# and basicptr 
                                   4407 ; are saved on cstack
                                   4408 ; here cstack is 2 call deep from interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4409 ;--------------------
                           000003  4410 	RET_ADDR=3
                           000005  4411 	RET_INW=5
                           000004  4412 	VSIZE=4  
      009694                       4413 gosub:
      009694 72 00 00 26 06   [ 2] 4414 	btjt flags,#FRUN,0$ 
      009699 A6 06            [ 1] 4415 	ld a,#ERR_RUN_ONLY
      00969B CC 87 83         [ 2] 4416 	jp tb_error 
      00969E 81               [ 4] 4417 	ret 
      00969F 85               [ 2] 4418 0$:	popw x 
      001620                       4419 	_vars VSIZE  
      0096A0 52 04            [ 2]    1     sub sp,#VSIZE 
      0096A2 89               [ 2] 4420 	pushw x 
      0096A3 CE 00 05         [ 2] 4421 	ldw x,basicptr
      0096A6 1F 03            [ 2] 4422 	ldw (RET_ADDR,sp),x 
      0096A8 CD 96 63         [ 4] 4423 	call get_target_line  
      0096AB 89               [ 2] 4424 	pushw x 
      0096AC CE 00 01         [ 2] 4425 	ldw x,in.w 
      0096AF 1F 07            [ 2] 4426 	ldw (RET_INW+2,sp),x
      0096B1 85               [ 2] 4427 	popw x 
      0096B2 20 D3            [ 2] 4428 	jra jp_to_target
                                   4429 
                                   4430 ;------------------------
                                   4431 ; BASIC: RETURN 
                                   4432 ; exit from a subroutine 
                                   4433 ; 
                                   4434 ;------------------------
      0096B4                       4435 return:
      0096B4 72 00 00 26 05   [ 2] 4436 	btjt flags,#FRUN,0$ 
      0096B9 A6 06            [ 1] 4437 	ld a,#ERR_RUN_ONLY
      0096BB CC 87 83         [ 2] 4438 	jp tb_error 
      0096BE                       4439 0$:	
      0096BE 1E 03            [ 2] 4440 	ldw x,(RET_ADDR,sp) 
      0096C0 CF 00 05         [ 2] 4441 	ldw basicptr,x
      0096C3 E6 02            [ 1] 4442 	ld a,(2,x)
      0096C5 C7 00 04         [ 1] 4443 	ld count,a  
      0096C8 1E 05            [ 2] 4444 	ldw x,(RET_INW,sp)
      0096CA CF 00 01         [ 2] 4445 	ldw in.w,x 
      0096CD 85               [ 2] 4446 	popw x 
      00164E                       4447 	_drop VSIZE 
      0096CE 5B 04            [ 2]    1     addw sp,#VSIZE 
      0096D0 89               [ 2] 4448 	pushw x
      0096D1 81               [ 4] 4449 	ret  
                                   4450 
                                   4451 
                                   4452 ;----------------------------------
                                   4453 ; BASIC: RUN
                                   4454 ; run BASIC program in RAM
                                   4455 ;----------------------------------- 
      0096D2                       4456 run: 
      0096D2 72 01 00 26 02   [ 2] 4457 	btjf flags,#FRUN,0$  
      0096D7 4F               [ 1] 4458 	clr a 
      0096D8 81               [ 4] 4459 	ret
      0096D9                       4460 0$: 
      0096D9 72 09 00 26 12   [ 2] 4461 	btjf flags,#FBREAK,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00165E                       4462 	_drop 2 
      0096DE 5B 02            [ 2]    1     addw sp,#2 
      0096E0 CD 94 52         [ 4] 4463 	call rest_context
      001663                       4464 	_drop CTXT_SIZE 
      0096E3 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      0096E5 72 19 00 26      [ 1] 4465 	bres flags,#FBREAK 
      0096E9 72 10 00 26      [ 1] 4466 	bset flags,#FRUN 
      0096ED CC 88 07         [ 2] 4467 	jp interp_loop 
      0096F0 CE 00 1F         [ 2] 4468 1$:	ldw x,txtbgn
      0096F3 C3 00 21         [ 2] 4469 	cpw x,txtend 
      0096F6 2B 02            [ 1] 4470 	jrmi run_it 
      0096F8 4F               [ 1] 4471 	clr a 
      0096F9 81               [ 4] 4472 	ret
                                   4473 
      0096FA                       4474 run_it:	 
      0096FA CD 91 61         [ 4] 4475     call ubound 
      00167D                       4476 	_drop 2 ; drop return address 
      0096FD 5B 02            [ 2]    1     addw sp,#2 
                                   4477 ; clear data pointer 
      0096FF 5F               [ 1] 4478 	clrw x 
      009700 CF 00 07         [ 2] 4479 	ldw data_ptr,x 
      009703 72 5F 00 09      [ 1] 4480 	clr data_ofs 
      009707 72 5F 00 0A      [ 1] 4481 	clr data_len 
                                   4482 ; initialize BASIC pointer 
      00970B CE 00 1F         [ 2] 4483 	ldw x,txtbgn 
      00970E CF 00 05         [ 2] 4484 	ldw basicptr,x 
      009711 E6 02            [ 1] 4485 	ld a,(2,x)
      009713 C7 00 04         [ 1] 4486 	ld count,a
      009716 35 03 00 02      [ 1] 4487 	mov in,#3	
      00971A 72 10 00 26      [ 1] 4488 	bset flags,#FRUN 
      00971E CC 88 07         [ 2] 4489 	jp interp_loop 
                                   4490 
                                   4491 
                                   4492 ;----------------------
                                   4493 ; BASIC: END
                                   4494 ; end running program
                                   4495 ;---------------------- 
      009721                       4496 cmd_end: 
                                   4497 ; clean stack 
      009721 AE 17 FF         [ 2] 4498 	ldw x,#STACK_EMPTY 
      009724 94               [ 1] 4499 	ldw sp,x 
      009725 72 11 00 26      [ 1] 4500 	bres flags,#FRUN 
      009729 72 19 00 26      [ 1] 4501 	bres flags,#FBREAK
      00972D CC 87 C4         [ 2] 4502 	jp warm_start
                                   4503 
                                   4504 
                                   4505 ;-----------------------
                                   4506 ; BASIC: TONE expr1,expr2
                                   4507 ; used TIMER2 channel 1
                                   4508 ; to produce a tone 
                                   4509 ; arguments:
                                   4510 ;    expr1   frequency 
                                   4511 ;    expr2   duration msec.
                                   4512 ;---------------------------
      009730                       4513 tone:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009730 CD 8F 04         [ 4] 4514 	call arg_list 
      009733 A1 02            [ 1] 4515 	cp a,#2 
      009735 27 03            [ 1] 4516 	jreq 1$
      009737 CC 87 81         [ 2] 4517 	jp syntax_error 
      00973A                       4518 1$: 
      00973A 85               [ 2] 4519 	popw x ; duration
      00973B 90 85            [ 2] 4520 	popw y ; frequency 
      00973D                       4521 beep:  
      00973D 89               [ 2] 4522 	pushw x 
      00973E AE F4 24         [ 2] 4523 	ldw x,#TIM2_CLK_FREQ
      009741 65               [ 2] 4524 	divw x,y 
                                   4525 ; round to nearest integer 
      009742 90 A3 7A 12      [ 2] 4526 	cpw y,#TIM2_CLK_FREQ/2
      009746 2B 01            [ 1] 4527 	jrmi 2$
      009748 5C               [ 2] 4528 	incw x 
      009749                       4529 2$:	 
      009749 9E               [ 1] 4530 	ld a,xh 
      00974A C7 53 0D         [ 1] 4531 	ld TIM2_ARRH,a 
      00974D 9F               [ 1] 4532 	ld a,xl 
      00974E C7 53 0E         [ 1] 4533 	ld TIM2_ARRL,a 
                                   4534 ; 50% duty cycle 
      009751 8C               [ 1] 4535 	ccf 
      009752 56               [ 2] 4536 	rrcw x 
      009753 9E               [ 1] 4537 	ld a,xh 
      009754 C7 53 0F         [ 1] 4538 	ld TIM2_CCR1H,a 
      009757 9F               [ 1] 4539 	ld a,xl
      009758 C7 53 10         [ 1] 4540 	ld TIM2_CCR1L,a
      00975B 72 10 53 08      [ 1] 4541 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00975F 72 10 53 00      [ 1] 4542 	bset TIM2_CR1,#TIM2_CR1_CEN
      009763 72 10 53 04      [ 1] 4543 	bset TIM2_EGR,#TIM2_EGR_UG
      009767 85               [ 2] 4544 	popw x 
      009768 CF 00 11         [ 2] 4545 	ldw timer,x 
      00976B CE 00 11         [ 2] 4546 3$: ldw x,timer 	
      00976E 26 FB            [ 1] 4547 	jrne 3$ 
      009770 72 11 53 08      [ 1] 4548 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009774 72 11 53 00      [ 1] 4549 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009778 81               [ 4] 4550 	ret 
                                   4551 
                                   4552 ;-------------------------------
                                   4553 ; BASIC: ADCON 0|1 [,divisor]  
                                   4554 ; disable/enanble ADC 
                                   4555 ;-------------------------------
                           000003  4556 	ONOFF=3 
                           000001  4557 	DIVSOR=1
                           000004  4558 	VSIZE=4 
      009779                       4559 power_adc:
      009779 CD 8F 04         [ 4] 4560 	call arg_list 
      00977C A1 02            [ 1] 4561 	cp a,#2	
      00977E 27 0B            [ 1] 4562 	jreq 1$
      009780 A1 01            [ 1] 4563 	cp a,#1 
      009782 27 03            [ 1] 4564 	jreq 0$ 
      009784 CC 87 81         [ 2] 4565 	jp syntax_error 
      009787 AE 00 00         [ 2] 4566 0$: ldw x,#0
      00978A 89               [ 2] 4567 	pushw x  ; divisor 
      00978B 1E 03            [ 2] 4568 1$: ldw x,(ONOFF,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00978D 5D               [ 2] 4569 	tnzw x 
      00978E 27 1A            [ 1] 4570 	jreq 2$ 
      009790 1E 01            [ 2] 4571 	ldw x,(DIVSOR,sp) ; divisor 
      009792 9F               [ 1] 4572 	ld a,xl
      009793 A4 07            [ 1] 4573 	and a,#7
      009795 4E               [ 1] 4574 	swap a 
      009796 C7 54 01         [ 1] 4575 	ld ADC_CR1,a
      009799 72 16 50 CA      [ 1] 4576 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00979D 72 10 54 01      [ 1] 4577 	bset ADC_CR1,#ADC_CR1_ADON 
      001721                       4578 	_usec_dly 7 
      0097A1 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      0097A4 5A               [ 2]    2     decw x
      0097A5 9D               [ 1]    3     nop 
      0097A6 26 FA            [ 1]    4     jrne .-4
      0097A8 20 08            [ 2] 4579 	jra 3$
      0097AA 72 11 54 01      [ 1] 4580 2$: bres ADC_CR1,#ADC_CR1_ADON
      0097AE 72 17 50 CA      [ 1] 4581 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      001732                       4582 3$:	_drop VSIZE 
      0097B2 5B 04            [ 2]    1     addw sp,#VSIZE 
      0097B4 81               [ 4] 4583 	ret
                                   4584 
                                   4585 ;-----------------------------
                                   4586 ; BASIC: ADCREAD (channel)
                                   4587 ; read adc channel {0..5}
                                   4588 ; output:
                                   4589 ;   A 		TK_INTGR 
                                   4590 ;   X 		value 
                                   4591 ;-----------------------------
      0097B5                       4592 analog_read:
      0097B5 CD 8F 2B         [ 4] 4593 	call func_args 
      0097B8 A1 01            [ 1] 4594 	cp a,#1 
      0097BA 27 03            [ 1] 4595 	jreq 1$
      0097BC CC 87 81         [ 2] 4596 	jp syntax_error
      0097BF 85               [ 2] 4597 1$: popw x 
      0097C0 A3 00 05         [ 2] 4598 	cpw x,#5 
      0097C3 23 05            [ 2] 4599 	jrule 2$
      0097C5 A6 0A            [ 1] 4600 	ld a,#ERR_BAD_VALUE
      0097C7 CC 87 83         [ 2] 4601 	jp tb_error 
      0097CA 9F               [ 1] 4602 2$: ld a,xl
      0097CB C7 00 0E         [ 1] 4603 	ld acc8,a 
      0097CE A6 05            [ 1] 4604 	ld a,#5
      0097D0 C0 00 0E         [ 1] 4605 	sub a,acc8 
      0097D3 C7 54 00         [ 1] 4606 	ld ADC_CSR,a
      0097D6 72 16 54 02      [ 1] 4607 	bset ADC_CR2,#ADC_CR2_ALIGN
      0097DA 72 10 54 01      [ 1] 4608 	bset ADC_CR1,#ADC_CR1_ADON
      0097DE 72 0F 54 00 FB   [ 2] 4609 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0097E3 CE 54 04         [ 2] 4610 	ldw x,ADC_DRH
      0097E6 A6 04            [ 1] 4611 	ld a,#TK_INTGR
      0097E8 81               [ 4] 4612 	ret 
                                   4613 
                                   4614 ;-----------------------
                                   4615 ; BASIC: DREAD(pin)
                                   4616 ; Arduino pins 
                                   4617 ; read state of a digital pin 
                                   4618 ; pin# {0..15}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4619 ; output:
                                   4620 ;    A 		TK_INTGR
                                   4621 ;    X      0|1 
                                   4622 ;-------------------------
                           000001  4623 	PINNO=1
                           000001  4624 	VSIZE=1
      0097E9                       4625 digital_read:
      001769                       4626 	_vars VSIZE 
      0097E9 52 01            [ 2]    1     sub sp,#VSIZE 
      0097EB CD 8F 2B         [ 4] 4627 	call func_args
      0097EE A1 01            [ 1] 4628 	cp a,#1
      0097F0 27 03            [ 1] 4629 	jreq 1$
      0097F2 CC 87 81         [ 2] 4630 	jp syntax_error
      0097F5 85               [ 2] 4631 1$: popw x 
      0097F6 A3 00 0F         [ 2] 4632 	cpw x,#15 
      0097F9 23 05            [ 2] 4633 	jrule 2$
      0097FB A6 0A            [ 1] 4634 	ld a,#ERR_BAD_VALUE
      0097FD CC 87 83         [ 2] 4635 	jp tb_error 
      009800 CD 9D CE         [ 4] 4636 2$:	call select_pin 
      009803 6B 01            [ 1] 4637 	ld (PINNO,sp),a
      009805 E6 01            [ 1] 4638 	ld a,(GPIO_IDR,x)
      009807 0D 01            [ 1] 4639 	tnz (PINNO,sp)
      009809 27 05            [ 1] 4640 	jreq 8$
      00980B 44               [ 1] 4641 3$: srl a 
      00980C 0A 01            [ 1] 4642 	dec (PINNO,sp)
      00980E 26 FB            [ 1] 4643 	jrne 3$ 
      009810 A4 01            [ 1] 4644 8$: and a,#1 
      009812 5F               [ 1] 4645 	clrw x 
      009813 97               [ 1] 4646 	ld xl,a 
      009814 A6 04            [ 1] 4647 	ld a,#TK_INTGR
      001796                       4648 	_drop VSIZE
      009816 5B 01            [ 2]    1     addw sp,#VSIZE 
      009818 81               [ 4] 4649 	ret
                                   4650 
                                   4651 ;-----------------------
                                   4652 ; BASIC: DWRITE pin,0|1
                                   4653 ; Arduino pins 
                                   4654 ; write to a digital pin 
                                   4655 ; pin# {0..15}
                                   4656 ; output:
                                   4657 ;    A 		TK_INTGR
                                   4658 ;    X      0|1 
                                   4659 ;-------------------------
                           000001  4660 	PINNO=1
                           000002  4661 	PINVAL=2
                           000002  4662 	VSIZE=2
      009819                       4663 digital_write:
      001799                       4664 	_vars VSIZE 
      009819 52 02            [ 2]    1     sub sp,#VSIZE 
      00981B CD 8F 04         [ 4] 4665 	call arg_list  
      00981E A1 02            [ 1] 4666 	cp a,#2 
      009820 27 03            [ 1] 4667 	jreq 1$
      009822 CC 87 81         [ 2] 4668 	jp syntax_error
      009825 85               [ 2] 4669 1$: popw x 
      009826 9F               [ 1] 4670 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009827 6B 02            [ 1] 4671 	ld (PINVAL,sp),a
      009829 85               [ 2] 4672 	popw x 
      00982A A3 00 0F         [ 2] 4673 	cpw x,#15 
      00982D 23 05            [ 2] 4674 	jrule 2$
      00982F A6 0A            [ 1] 4675 	ld a,#ERR_BAD_VALUE
      009831 CC 87 83         [ 2] 4676 	jp tb_error 
      009834 CD 9D CE         [ 4] 4677 2$:	call select_pin 
      009837 6B 01            [ 1] 4678 	ld (PINNO,sp),a 
      009839 A6 01            [ 1] 4679 	ld a,#1
      00983B 0D 01            [ 1] 4680 	tnz (PINNO,sp)
      00983D 27 05            [ 1] 4681 	jreq 4$
      00983F 48               [ 1] 4682 3$: sll a
      009840 0A 01            [ 1] 4683 	dec (PINNO,sp)
      009842 26 FB            [ 1] 4684 	jrne 3$
      009844 0D 02            [ 1] 4685 4$: tnz (PINVAL,sp)
      009846 26 05            [ 1] 4686 	jrne 5$
      009848 43               [ 1] 4687 	cpl a 
      009849 E4 00            [ 1] 4688 	and a,(GPIO_ODR,x)
      00984B 20 02            [ 2] 4689 	jra 8$
      00984D EA 00            [ 1] 4690 5$: or a,(GPIO_ODR,x)
      00984F E7 00            [ 1] 4691 8$: ld (GPIO_ODR,x),a 
      0017D1                       4692 	_drop VSIZE 
      009851 5B 02            [ 2]    1     addw sp,#VSIZE 
      009853 81               [ 4] 4693 	ret
                                   4694 
                                   4695 
                                   4696 ;-----------------------
                                   4697 ; BASIC: STOP
                                   4698 ; stop progam execution  
                                   4699 ; without resetting pointers 
                                   4700 ; the program is resumed
                                   4701 ; with RUN 
                                   4702 ;-------------------------
      009854                       4703 stop:
      009854 72 00 00 26 02   [ 2] 4704 	btjt flags,#FRUN,2$
      009859 4F               [ 1] 4705 	clr a
      00985A 81               [ 4] 4706 	ret 
      00985B                       4707 2$:	 
                                   4708 ; create space on cstack to save context 
      00985B AE 98 82         [ 2] 4709 	ldw x,#break_point 
      00985E CD 82 46         [ 4] 4710 	call puts 
      0017E1                       4711 	_drop 2 ;drop return address 
      009861 5B 02            [ 2]    1     addw sp,#2 
      0017E3                       4712 	_vars CTXT_SIZE ; context size 
      009863 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009865 CD 94 42         [ 4] 4713 	call save_context 
      009868 AE 16 E8         [ 2] 4714 	ldw x,#tib 
      00986B CF 00 05         [ 2] 4715 	ldw basicptr,x
      00986E 7F               [ 1] 4716 	clr (x)
      00986F 72 5F 00 04      [ 1] 4717 	clr count  
      009873 5F               [ 1] 4718 	clrw x 
      009874 CF 00 01         [ 2] 4719 	ldw in.w,x
      009877 72 11 00 26      [ 1] 4720 	bres flags,#FRUN 
      00987B 72 18 00 26      [ 1] 4721 	bset flags,#FBREAK
      00987F CC 88 07         [ 2] 4722 	jp interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009882 0A 62 72 65 61 6B 20  4723 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4724 
                                   4725 ;-----------------------
                                   4726 ; BASIC: NEW
                                   4727 ; from command line only 
                                   4728 ; free program memory
                                   4729 ; and clear variables 
                                   4730 ;------------------------
      0098A0                       4731 new: 
      0098A0 72 01 00 26 02   [ 2] 4732 	btjf flags,#FRUN,0$ 
      0098A5 4F               [ 1] 4733 	clr a 
      0098A6 81               [ 4] 4734 	ret 
      0098A7                       4735 0$:	
      0098A7 CD 86 4B         [ 4] 4736 	call clear_basic 
      0098AA 81               [ 4] 4737 	ret 
                                   4738 	 
                                   4739 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4740 ;  file system routines
                                   4741 ;  MCU flash memory from
                                   4742 ;  0x10000-0x27fff is 
                                   4743 ;  used to store BASIC 
                                   4744 ;  program files. 
                                   4745 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4746 
                                   4747 ;--------------------
                                   4748 ; input:
                                   4749 ;   X     increment 
                                   4750 ; output:
                                   4751 ;   farptr  incremented 
                                   4752 ;---------------------
      0098AB                       4753 incr_farptr:
      0098AB 72 BB 00 18      [ 2] 4754 	addw x,farptr+1 
      0098AF 24 04            [ 1] 4755 	jrnc 1$
      0098B1 72 5C 00 17      [ 1] 4756 	inc farptr 
      0098B5 CF 00 18         [ 2] 4757 1$:	ldw farptr+1,x  
      0098B8 81               [ 4] 4758 	ret 
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
      0098B9                       4770 seek_fdrive:
                                   4771 ; start scan at 0x10000 address 
      0098B9 A6 01            [ 1] 4772 	ld a,#1
      0098BB C7 00 17         [ 1] 4773 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098BE 5F               [ 1] 4774 	clrw x 
      0098BF CF 00 18         [ 2] 4775 	ldw farptr+1,x 
      0098C2                       4776 1$:
      0098C2 AE 00 03         [ 2] 4777 	ldw x,#3  
      0098C5 92 AF 00 17      [ 5] 4778 2$:	ldf a,([farptr],x) 
      0098C9 26 05            [ 1] 4779 	jrne 3$
      0098CB 5A               [ 2] 4780 	decw x
      0098CC 2A F7            [ 1] 4781 	jrpl 2$
      0098CE 20 19            [ 2] 4782 	jra 4$ 
      0098D0 5C               [ 2] 4783 3$:	incw x 
      0098D1 CD 98 AB         [ 4] 4784 	call incr_farptr
      0098D4 AE 02 7F         [ 2] 4785 	ldw x,#0x27f 
      0098D7 C3 00 17         [ 2] 4786 	cpw x,farptr
      0098DA 2A E6            [ 1] 4787 	jrpl 1$
                                   4788 ; drive full 
      0098DC 72 5F 00 1A      [ 1] 4789 	clr ffree 
      0098E0 72 5F 00 1B      [ 1] 4790 	clr ffree+1 
      0098E4 72 5F 00 1C      [ 1] 4791 	clr ffree+2 
      0098E8 81               [ 4] 4792 	ret
      0098E9                       4793 4$: ; copy farptr to ffree	 
      0098E9 CE 00 17         [ 2] 4794 	ldw x,farptr 
      0098EC C6 00 19         [ 1] 4795 	ld a,farptr+2 
      0098EF CF 00 1A         [ 2] 4796 	ldw ffree,x 
      0098F2 C7 00 1C         [ 1] 4797 	ld ffree+2,a  
      0098F5 81               [ 4] 4798 	ret 
                                   4799 
                                   4800 ;-----------------------
                                   4801 ; compare file name 
                                   4802 ; with name pointed by Y  
                                   4803 ; input:
                                   4804 ;   farptr   file name 
                                   4805 ;   Y        target name 
                                   4806 ; output:
                                   4807 ;   farptr 	 at file_name
                                   4808 ;   X 		 farptr[x] point at size field  
                                   4809 ;   Carry    0|1 no match|match  
                                   4810 ;----------------------
      0098F6                       4811 cmp_name:
      0098F6 5F               [ 1] 4812 	clrw x
      0098F7 92 AF 00 17      [ 5] 4813 1$:	ldf a,([farptr],x)
      0098FB 90 F1            [ 1] 4814 	cp a,(y)
      0098FD 26 08            [ 1] 4815 	jrne 4$
      0098FF 4D               [ 1] 4816 	tnz a 
      009900 27 12            [ 1] 4817 	jreq 9$ 
      009902 5C               [ 2] 4818     incw x 
      009903 90 5C            [ 2] 4819 	incw y 
      009905 20 F0            [ 2] 4820 	jra 1$
      009907                       4821 4$: ;no match 
      009907 4D               [ 1] 4822 	tnz a 
      009908 27 07            [ 1] 4823 	jreq 5$
      00990A 5C               [ 2] 4824 	incw x 
      00990B 92 AF 00 17      [ 5] 4825 	ldf a,([farptr],x)
      00990F 20 F6            [ 2] 4826 	jra 4$  
      009911 5C               [ 2] 4827 5$:	incw x ; farptr[x] point at 'size' field 
      009912 98               [ 1] 4828 	rcf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009913 81               [ 4] 4829 	ret
      009914                       4830 9$: ; match  
      009914 5C               [ 2] 4831 	incw x  ; farptr[x] at 'size' field 
      009915 99               [ 1] 4832 	scf 
      009916 81               [ 4] 4833 	ret 
                                   4834 
                                   4835 ;-----------------------
                                   4836 ; search file in 
                                   4837 ; flash memory 
                                   4838 ; input:
                                   4839 ;   Y       file name  
                                   4840 ; output:
                                   4841 ;   farptr  addr at name|0
                                   4842 ;-----------------------
                           000001  4843 	FSIZE=1
                           000003  4844 	YSAVE=3
                           000004  4845 	VSIZE=4 
      009917                       4846 search_file: 
      001897                       4847 	_vars VSIZE
      009917 52 04            [ 2]    1     sub sp,#VSIZE 
      009919 17 03            [ 2] 4848 	ldw (YSAVE,sp),y  
      00991B 5F               [ 1] 4849 	clrw x 
      00991C CF 00 18         [ 2] 4850 	ldw farptr+1,x 
      00991F 35 01 00 17      [ 1] 4851 	mov farptr,#1
      009923                       4852 1$:	
                                   4853 ; check if farptr is after any file 
                                   4854 ; if  0 then so.
      009923 92 BC 00 17      [ 5] 4855 	ldf a,[farptr]
      009927 27 25            [ 1] 4856 	jreq 6$
      009929 5F               [ 1] 4857 2$: clrw x 	
      00992A 16 03            [ 2] 4858 	ldw y,(YSAVE,sp) 
      00992C CD 98 F6         [ 4] 4859 	call cmp_name
      00992F 25 2D            [ 1] 4860 	jrc 9$
      009931 92 AF 00 17      [ 5] 4861 	ldf a,([farptr],x)
      009935 6B 01            [ 1] 4862 	ld (FSIZE,sp),a 
      009937 5C               [ 2] 4863 	incw x 
      009938 92 AF 00 17      [ 5] 4864 	ldf a,([farptr],x)
      00993C 6B 02            [ 1] 4865 	ld (FSIZE+1,sp),a 
      00993E 5C               [ 2] 4866 	incw x 
      00993F 72 FB 01         [ 2] 4867 	addw x,(FSIZE,sp) ; count to skip 
      009942 5C               [ 2] 4868 	incw x ; skip over EOF marker 
      009943 CD 98 AB         [ 4] 4869 	call incr_farptr ; now at next file 'name_field'
      009946 AE 02 80         [ 2] 4870 	ldw x,#0x280
      009949 C3 00 17         [ 2] 4871 	cpw x,farptr 
      00994C 2A D5            [ 1] 4872 	jrpl 1$
      00994E                       4873 6$: ; file not found 
      00994E 72 5F 00 17      [ 1] 4874 	clr farptr
      009952 72 5F 00 18      [ 1] 4875 	clr farptr+1 
      009956 72 5F 00 19      [ 1] 4876 	clr farptr+2 
      0018DA                       4877 	_drop VSIZE 
      00995A 5B 04            [ 2]    1     addw sp,#VSIZE 
      00995C 98               [ 1] 4878 	rcf
      00995D 81               [ 4] 4879 	ret
      00995E                       4880 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      0018DE                       4881 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00995E 5B 04            [ 2]    1     addw sp,#VSIZE 
      009960 99               [ 1] 4882 	scf 	
      009961 81               [ 4] 4883 	ret
                                   4884 
                                   4885 ;--------------------------------
                                   4886 ; BASIC: SAVE "name" 
                                   4887 ; save text program in 
                                   4888 ; flash memory used as 
                                   4889 ;--------------------------------
                           000001  4890 	BSIZE=1
                           000003  4891 	NAMEPTR=3
                           000004  4892 	VSIZE=4
      009962                       4893 save:
      009962 72 01 00 26 05   [ 2] 4894 	btjf flags,#FRUN,0$ 
      009967 A6 07            [ 1] 4895 	ld a,#ERR_CMD_ONLY 
      009969 CC 87 83         [ 2] 4896 	jp tb_error
      00996C                       4897 0$:	 
      00996C CE 00 21         [ 2] 4898 	ldw x,txtend 
      00996F 72 B0 00 1F      [ 2] 4899 	subw x,txtbgn
      009973 26 01            [ 1] 4900 	jrne 1$
                                   4901 ; nothing to save 
      009975 81               [ 4] 4902 	ret 
      009976                       4903 1$:	
      0018F6                       4904 	_vars VSIZE 
      009976 52 04            [ 2]    1     sub sp,#VSIZE 
      009978 1F 01            [ 2] 4905 	ldw (BSIZE,sp),x 
      00997A CD 88 35         [ 4] 4906 	call next_token	
      00997D A1 0A            [ 1] 4907 	cp a,#TK_QSTR
      00997F 27 03            [ 1] 4908 	jreq 2$
      009981 CC 87 81         [ 2] 4909 	jp syntax_error
      009984                       4910 2$: 
      009984 90 CE 00 05      [ 2] 4911 	ldw y,basicptr 
      009988 72 B9 00 01      [ 2] 4912 	addw y,in.w
      00998C 17 03            [ 2] 4913 	ldw (NAMEPTR,sp),y  
      00998E 55 00 04 00 02   [ 1] 4914 	mov in,count 
                                   4915 ; check if enough free space 
      009993 93               [ 1] 4916 	ldw x,y 
      009994 CD 82 7A         [ 4] 4917 	call strlen 
      009997 1C 00 03         [ 2] 4918 	addw x,#3 
      00999A 72 FB 01         [ 2] 4919 	addw x,(BSIZE,sp)
      00999D 72 5D 00 1A      [ 1] 4920 	tnz ffree 
      0099A1 26 0B            [ 1] 4921 	jrne 21$
      0099A3 72 B0 00 1B      [ 2] 4922 	subw x,ffree+1 
      0099A7 23 05            [ 2] 4923 	jrule 21$
      0099A9 A6 01            [ 1] 4924 	ld a,#ERR_MEM_FULL 
      0099AB CC 87 83         [ 2] 4925 	jp tb_error
      0099AE                       4926 21$: 
                                   4927 ; check for existing file of that name 
      0099AE 16 03            [ 2] 4928 	ldw y,(NAMEPTR,sp)	
      0099B0 CD 99 17         [ 4] 4929 	call search_file 
      0099B3 24 05            [ 1] 4930 	jrnc 3$ 
      0099B5 A6 08            [ 1] 4931 	ld a,#ERR_DUPLICATE 
      0099B7 CC 87 83         [ 2] 4932 	jp tb_error 
      0099BA                       4933 3$:	;** write file name to flash **
      0099BA CE 00 1A         [ 2] 4934 	ldw x,ffree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099BD C6 00 1C         [ 1] 4935 	ld a,ffree+2 
      0099C0 CF 00 17         [ 2] 4936 	ldw farptr,x 
      0099C3 C7 00 19         [ 1] 4937 	ld farptr+2,a 
      0099C6 1E 03            [ 2] 4938 	ldw x,(NAMEPTR,sp)  
      0099C8 CD 82 7A         [ 4] 4939 	call strlen 
      0099CB 5C               [ 2] 4940 	incw  x
      0099CC 1F 01            [ 2] 4941 	ldw (BSIZE,sp),x  
      0099CE 5F               [ 1] 4942 	clrw x   
      0099CF 16 03            [ 2] 4943 	ldw y,(NAMEPTR,sp)
      0099D1 CD 81 D5         [ 4] 4944 	call write_block  
                                   4945 ;** write file length after name **
      0099D4 CE 00 21         [ 2] 4946 	ldw x,txtend 
      0099D7 72 B0 00 1F      [ 2] 4947 	subw x,txtbgn
      0099DB 1F 01            [ 2] 4948 	ldw (BSIZE,sp),x 
      0099DD 5F               [ 1] 4949 	clrw x 
      0099DE 7B 01            [ 1] 4950 	ld a,(1,sp)
      0099E0 CD 81 60         [ 4] 4951 	call write_byte 
      0099E3 5C               [ 2] 4952 	incw x 
      0099E4 7B 02            [ 1] 4953 	ld a,(2,sp)
      0099E6 CD 81 60         [ 4] 4954 	call write_byte
      0099E9 5C               [ 2] 4955 	incw x  
      0099EA CD 98 AB         [ 4] 4956 	call incr_farptr ; move farptr after SIZE field 
                                   4957 ;** write BASIC text **
                                   4958 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0099ED 1E 01            [ 2] 4959 	ldw x,(BSIZE,sp)
      0099EF 89               [ 2] 4960 	pushw x ; write_block argument 
      0099F0 5F               [ 1] 4961 	clrw x 
      0099F1 90 CE 00 1F      [ 2] 4962 	ldw y,txtbgn  ; BASIC text to save 
      0099F5 CD 81 D5         [ 4] 4963 	call write_block 
      001978                       4964 	_drop 2 ;  drop write_block argument  
      0099F8 5B 02            [ 2]    1     addw sp,#2 
                                   4965 ; write en end of file marker 
      0099FA AE 00 01         [ 2] 4966 	ldw x,#1
      0099FD A6 FF            [ 1] 4967 	ld a,#EOF  
      0099FF CD 81 60         [ 4] 4968 	call write_byte 
      009A02 CD 98 AB         [ 4] 4969 	call incr_farptr
                                   4970 ; save farptr in ffree
      009A05 CE 00 17         [ 2] 4971 	ldw x,farptr 
      009A08 C6 00 19         [ 1] 4972 	ld a,farptr+2 
      009A0B CF 00 1A         [ 2] 4973 	ldw ffree,x 
      009A0E C7 00 1C         [ 1] 4974 	ld ffree+2,a
                                   4975 ;write 4 zero bytes as an end of all files marker 
      009A11 5F               [ 1] 4976     clrw x 
      009A12 4B 04            [ 1] 4977 	push #4 
      009A14                       4978 4$:
      009A14 4F               [ 1] 4979 	clr a 
      009A15 CD 81 60         [ 4] 4980 	call write_byte 
      009A18 5C               [ 2] 4981 	incw x 
      009A19 0A 01            [ 1] 4982 	dec (1,sp)
      009A1B 26 F7            [ 1] 4983 	jrne 4$
      009A1D 84               [ 1] 4984 5$: pop a 
                                   4985 ; display saved size  
      009A1E 1E 01            [ 2] 4986 	ldw x,(BSIZE,sp) 
      009A20 CD 88 CA         [ 4] 4987 	call print_int 
      0019A3                       4988 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A23 5B 04            [ 2]    1     addw sp,#VSIZE 
      009A25 81               [ 4] 4989 	ret 
                                   4990 
                                   4991 ;----------------------
                                   4992 ; load file in RAM memory
                                   4993 ; input:
                                   4994 ;    farptr point at file size 
                                   4995 ; output:
                                   4996 ;   y point after BASIC program in RAM.
                                   4997 ;------------------------
      009A26                       4998 load_file:
      009A26 CD 98 AB         [ 4] 4999 	call incr_farptr  
      009A29 CD 86 4B         [ 4] 5000 	call clear_basic  
      009A2C 5F               [ 1] 5001 	clrw x
      009A2D 92 AF 00 17      [ 5] 5002 	ldf a,([farptr],x)
      009A31 90 95            [ 1] 5003 	ld yh,a 
      009A33 5C               [ 2] 5004 	incw x  
      009A34 92 AF 00 17      [ 5] 5005 	ldf a,([farptr],x)
      009A38 5C               [ 2] 5006 	incw x 
      009A39 90 97            [ 1] 5007 	ld yl,a 
      009A3B 72 B9 00 1F      [ 2] 5008 	addw y,txtbgn
      009A3F 90 CF 00 21      [ 2] 5009 	ldw txtend,y
      009A43 90 CE 00 1F      [ 2] 5010 	ldw y,txtbgn
      009A47                       5011 3$:	; load BASIC text 	
      009A47 92 AF 00 17      [ 5] 5012 	ldf a,([farptr],x)
      009A4B 90 F7            [ 1] 5013 	ld (y),a 
      009A4D 5C               [ 2] 5014 	incw x 
      009A4E 90 5C            [ 2] 5015 	incw y 
      009A50 90 C3 00 21      [ 2] 5016 	cpw y,txtend 
      009A54 2B F1            [ 1] 5017 	jrmi 3$
      009A56 81               [ 4] 5018 	ret 
                                   5019 
                                   5020 ;------------------------
                                   5021 ; BASIC: LOAD "file" 
                                   5022 ; load file to RAM 
                                   5023 ; for execution 
                                   5024 ;------------------------
      009A57                       5025 load:
      009A57 72 01 00 26 07   [ 2] 5026 	btjf flags,#FRUN,0$ 
      009A5C 27 05            [ 1] 5027 	jreq 0$ 
      009A5E A6 07            [ 1] 5028 	ld a,#ERR_CMD_ONLY 
      009A60 CC 87 83         [ 2] 5029 	jp tb_error 
      009A63                       5030 0$:	
      009A63 CD 88 35         [ 4] 5031 	call next_token 
      009A66 A1 0A            [ 1] 5032 	cp a,#TK_QSTR
      009A68 27 03            [ 1] 5033 	jreq 1$
      009A6A CC 87 81         [ 2] 5034 	jp syntax_error 
      009A6D                       5035 1$:	
      009A6D 90 CE 00 05      [ 2] 5036 	ldw y,basicptr
      009A71 72 B9 00 01      [ 2] 5037 	addw y,in.w 
      009A75 55 00 04 00 02   [ 1] 5038 	mov in,count 
      009A7A CD 99 17         [ 4] 5039 	call search_file 
      009A7D 25 05            [ 1] 5040 	jrc 2$ 
      009A7F A6 09            [ 1] 5041 	ld a,#ERR_NOT_FILE
      009A81 CC 87 83         [ 2] 5042 	jp tb_error  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A84                       5043 2$:
      009A84 CD 9A 26         [ 4] 5044 	call load_file
                                   5045 ; print loaded size 	 
      009A87 CE 00 21         [ 2] 5046 	ldw x,txtend 
      009A8A 72 B0 00 1F      [ 2] 5047 	subw x,txtbgn
      009A8E CD 88 CA         [ 4] 5048 	call print_int 
      009A91 81               [ 4] 5049 	ret 
                                   5050 
                                   5051 ;-----------------------------------
                                   5052 ; BASIC: FORGET ["file_name"] 
                                   5053 ; erase file_name and all others 
                                   5054 ; after it. 
                                   5055 ; without argument erase all files 
                                   5056 ;-----------------------------------
      009A92                       5057 forget:
      009A92 CD 88 35         [ 4] 5058 	call next_token 
      009A95 A1 00            [ 1] 5059 	cp a,#TK_NONE 
      009A97 27 26            [ 1] 5060 	jreq 3$ 
      009A99 A1 0A            [ 1] 5061 	cp a,#TK_QSTR
      009A9B 27 03            [ 1] 5062 	jreq 1$
      009A9D CC 87 81         [ 2] 5063 	jp syntax_error
      009AA0 90 CE 00 05      [ 2] 5064 1$: ldw y,basicptr
      009AA4 72 B9 00 01      [ 2] 5065 	addw y,in.w
      009AA8 55 00 04 00 02   [ 1] 5066 	mov in,count 
      009AAD CD 99 17         [ 4] 5067 	call search_file
      009AB0 25 05            [ 1] 5068 	jrc 2$
      009AB2 A6 09            [ 1] 5069 	ld a,#ERR_NOT_FILE 
      009AB4 CC 87 83         [ 2] 5070 	jp tb_error 
      009AB7                       5071 2$: 
      009AB7 CE 00 17         [ 2] 5072 	ldw x,farptr
      009ABA C6 00 19         [ 1] 5073 	ld a,farptr+2
      009ABD 20 0A            [ 2] 5074 	jra 4$ 
      009ABF                       5075 3$: ; forget all files 
      009ABF AE 01 00         [ 2] 5076 	ldw x,#0x100
      009AC2 4F               [ 1] 5077 	clr a 
      009AC3 CF 00 17         [ 2] 5078 	ldw farptr,x 
      009AC6 C7 00 19         [ 1] 5079 	ld farptr+2,a 
      009AC9                       5080 4$:
      009AC9 CF 00 1A         [ 2] 5081 	ldw ffree,x 
      009ACC C7 00 1C         [ 1] 5082 	ld ffree+2,a 
      009ACF 4B 04            [ 1] 5083 	push #4
      009AD1 5F               [ 1] 5084 	clrw x 
      009AD2                       5085 5$: 
      009AD2 4F               [ 1] 5086 	clr a  
      009AD3 CD 81 60         [ 4] 5087 	call write_byte 
      009AD6 5C               [ 2] 5088 	incw x 
      009AD7 0A 01            [ 1] 5089 	dec (1,sp)
      009AD9 26 F7            [ 1] 5090 	jrne 5$	
      009ADB 84               [ 1] 5091 6$: pop a 
      009ADC 81               [ 4] 5092 	ret 
                                   5093 
                                   5094 ;----------------------
                                   5095 ; BASIC: DIR 
                                   5096 ; list saved files 
                                   5097 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                           000001  5098 	COUNT=1 ; files counter 
                           000002  5099 	VSIZE=2 
      009ADD                       5100 directory:
      001A5D                       5101 	_vars VSIZE 
      009ADD 52 02            [ 2]    1     sub sp,#VSIZE 
      009ADF 5F               [ 1] 5102 	clrw x 
      009AE0 1F 01            [ 2] 5103 	ldw (COUNT,sp),x 
      009AE2 CF 00 18         [ 2] 5104 	ldw farptr+1,x 
      009AE5 35 01 00 17      [ 1] 5105 	mov farptr,#1 
      009AE9                       5106 dir_loop:
      009AE9 5F               [ 1] 5107 	clrw x 
      009AEA 92 AF 00 17      [ 5] 5108 	ldf a,([farptr],x)
      009AEE 27 39            [ 1] 5109 	jreq 8$ 
      009AF0                       5110 1$: ;name loop 	
      009AF0 92 AF 00 17      [ 5] 5111 	ldf a,([farptr],x)
      009AF4 27 06            [ 1] 5112 	jreq 2$ 
      009AF6 CD 82 33         [ 4] 5113 	call putc 
      009AF9 5C               [ 2] 5114 	incw x 
      009AFA 20 F4            [ 2] 5115 	jra 1$
      009AFC 5C               [ 2] 5116 2$: incw x ; skip ending 0. 
      009AFD A6 20            [ 1] 5117 	ld a,#SPACE 
      009AFF CD 82 33         [ 4] 5118 	call putc 
                                   5119 ; get file size 	
      009B02 92 AF 00 17      [ 5] 5120 	ldf a,([farptr],x)
      009B06 90 95            [ 1] 5121 	ld yh,a 
      009B08 5C               [ 2] 5122 	incw x 
      009B09 92 AF 00 17      [ 5] 5123 	ldf a,([farptr],x)
      009B0D 5C               [ 2] 5124 	incw x 
      009B0E 90 97            [ 1] 5125 	ld yl,a 
      009B10 90 89            [ 2] 5126 	pushw y 
      009B12 72 FB 01         [ 2] 5127 	addw x,(1,sp)
      009B15 5C               [ 2] 5128 	incw x ; skip EOF marker 
                                   5129 ; skip to next file 
      009B16 CD 98 AB         [ 4] 5130 	call incr_farptr 
                                   5131 ; print file size 
      009B19 85               [ 2] 5132 	popw x ; file size 
      009B1A CD 88 CA         [ 4] 5133 	call print_int 
      009B1D A6 0D            [ 1] 5134 	ld a,#CR 
      009B1F CD 82 33         [ 4] 5135 	call putc
      009B22 1E 01            [ 2] 5136 	ldw x,(COUNT,sp)
      009B24 5C               [ 2] 5137 	incw x
      009B25 1F 01            [ 2] 5138 	ldw (COUNT,sp),x  
      009B27 20 C0            [ 2] 5139 	jra dir_loop 
      009B29                       5140 8$: ; print number of files 
      009B29 1E 01            [ 2] 5141 	ldw x,(COUNT,sp)
      009B2B CD 88 CA         [ 4] 5142 	call print_int 
      009B2E AE 9B 5E         [ 2] 5143 	ldw x,#file_count 
      009B31 CD 82 46         [ 4] 5144 	call puts  
                                   5145 ; print drive free space 	
      009B34 A6 FF            [ 1] 5146 	ld a,#0xff 
      009B36 C0 00 1C         [ 1] 5147 	sub a,ffree+2 
      009B39 C7 00 0E         [ 1] 5148 	ld acc8,a 
      009B3C A6 7F            [ 1] 5149 	ld a,#0x7f 
      009B3E C2 00 1B         [ 1] 5150 	sbc a,ffree+1 
      009B41 C7 00 0D         [ 1] 5151 	ld acc16,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B44 A6 02            [ 1] 5152 	ld a,#2 
      009B46 C2 00 1A         [ 1] 5153 	sbc a,ffree 
      009B49 C7 00 0C         [ 1] 5154 	ld acc24,a 
      009B4C 5F               [ 1] 5155 	clrw x  
      009B4D A6 06            [ 1] 5156 	ld a,#6 
      009B4F 97               [ 1] 5157 	ld xl,a 
      009B50 A6 0A            [ 1] 5158 	ld a,#10 
      009B52 CD 88 82         [ 4] 5159 	call prti24 
      009B55 AE 9B 66         [ 2] 5160 	ldw x,#drive_free
      009B58 CD 82 46         [ 4] 5161 	call puts 
      001ADB                       5162 	_drop VSIZE 
      009B5B 5B 02            [ 2]    1     addw sp,#VSIZE 
      009B5D 81               [ 4] 5163 	ret
      009B5E 20 66 69 6C 65 73 0A  5164 file_count: .asciz " files\n"
             00
      009B66 20 62 79 74 65 73 20  5165 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5166 
                                   5167 ;---------------------
                                   5168 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5169 ; write 1 or more byte to FLASH or EEPROM
                                   5170 ; starting at address  
                                   5171 ; input:
                                   5172 ;   expr1  	is address 
                                   5173 ;   expr2,...,exprn   are bytes to write
                                   5174 ; output:
                                   5175 ;   none 
                                   5176 ;---------------------
                           000001  5177 	ADDR=1
                           000002  5178 	VSIZ=2 
      009B73                       5179 write:
      001AF3                       5180 	_vars VSIZE 
      009B73 52 02            [ 2]    1     sub sp,#VSIZE 
      009B75 72 5F 00 17      [ 1] 5181 	clr farptr ; expect 16 bits address 
      009B79 CD 90 10         [ 4] 5182 	call expression
      009B7C A1 04            [ 1] 5183 	cp a,#TK_INTGR 
      009B7E 27 03            [ 1] 5184 	jreq 0$
      009B80 CC 87 81         [ 2] 5185 	jp syntax_error
      009B83 1F 01            [ 2] 5186 0$: ldw (ADDR,sp),x 
      009B85 CD 88 35         [ 4] 5187 	call next_token 
      009B88 A1 0D            [ 1] 5188 	cp a,#TK_COMMA 
      009B8A 27 02            [ 1] 5189 	jreq 1$ 
      009B8C 20 19            [ 2] 5190 	jra 9$ 
      009B8E CD 90 10         [ 4] 5191 1$:	call expression
      009B91 A1 04            [ 1] 5192 	cp a,#TK_INTGR
      009B93 27 03            [ 1] 5193 	jreq 2$
      009B95 CC 87 81         [ 2] 5194 	jp syntax_error
      009B98 9F               [ 1] 5195 2$:	ld a,xl 
      009B99 1E 01            [ 2] 5196 	ldw x,(ADDR,sp) 
      009B9B CF 00 18         [ 2] 5197 	ldw farptr+1,x 
      009B9E 5F               [ 1] 5198 	clrw x 
      009B9F CD 81 60         [ 4] 5199 	call write_byte
      009BA2 1E 01            [ 2] 5200 	ldw x,(ADDR,sp)
      009BA4 5C               [ 2] 5201 	incw x 
      009BA5 20 DC            [ 2] 5202 	jra 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BA7                       5203 9$:
      001B27                       5204 	_drop VSIZE
      009BA7 5B 02            [ 2]    1     addw sp,#VSIZE 
      009BA9 81               [ 4] 5205 	ret 
                                   5206 
                                   5207 
                                   5208 ;---------------------
                                   5209 ;BASIC: CHAR(expr)
                                   5210 ; évaluate expression 
                                   5211 ; and take the 7 least 
                                   5212 ; bits as ASCII character
                                   5213 ;---------------------
      009BAA                       5214 char:
      009BAA CD 8F 2B         [ 4] 5215 	call func_args 
      009BAD A1 01            [ 1] 5216 	cp a,#1
      009BAF 27 03            [ 1] 5217 	jreq 1$
      009BB1 CC 87 81         [ 2] 5218 	jp syntax_error
      009BB4 85               [ 2] 5219 1$:	popw x 
      009BB5 9F               [ 1] 5220 	ld a,xl 
      009BB6 A4 7F            [ 1] 5221 	and a,#0x7f 
      009BB8 97               [ 1] 5222 	ld xl,a
      009BB9 A6 03            [ 1] 5223 	ld a,#TK_CHAR
      009BBB 81               [ 4] 5224 	ret
                                   5225 
                                   5226 ;---------------------
                                   5227 ; BASIC: ASC(string|char)
                                   5228 ; extract first character 
                                   5229 ; of string argument 
                                   5230 ; return it as TK_INTGR 
                                   5231 ;---------------------
      009BBC                       5232 ascii:
      009BBC A6 0B            [ 1] 5233 	ld a,#TK_LPAREN
      009BBE CD 8E F7         [ 4] 5234 	call expect 
      009BC1 CD 88 35         [ 4] 5235 	call next_token 
      009BC4 A1 0A            [ 1] 5236 	cp a,#TK_QSTR 
      009BC6 27 07            [ 1] 5237 	jreq 1$
      009BC8 A1 03            [ 1] 5238 	cp a,#TK_CHAR 
      009BCA 27 06            [ 1] 5239 	jreq 2$ 
      009BCC CC 87 81         [ 2] 5240 	jp syntax_error
      009BCF                       5241 1$: 
      009BCF F6               [ 1] 5242 	ld a,(x) 
      009BD0 5F               [ 1] 5243 	clrw x
      009BD1 97               [ 1] 5244 	ld xl,a 
      009BD2                       5245 2$: 
      009BD2 89               [ 2] 5246 	pushw x 
      009BD3 A6 0C            [ 1] 5247 	ld a,#TK_RPAREN 
      009BD5 CD 8E F7         [ 4] 5248 	call expect
      009BD8 85               [ 2] 5249 	popw x 
      009BD9 A6 04            [ 1] 5250 	ld a,#TK_INTGR 
      009BDB 81               [ 4] 5251 	ret 
                                   5252 
                                   5253 ;---------------------
                                   5254 ;BASIC: KEY
                                   5255 ; wait for a character 
                                   5256 ; received from STDIN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5257 ; input:
                                   5258 ;	none 
                                   5259 ; output:
                                   5260 ;	X 		ASCII character 
                                   5261 ;---------------------
      009BDC                       5262 key:
      009BDC CD 82 3C         [ 4] 5263 	call getc 
      009BDF 5F               [ 1] 5264 	clrw x 
      009BE0 97               [ 1] 5265 	ld xl,a 
      009BE1 A6 04            [ 1] 5266 	ld a,#TK_INTGR
      009BE3 81               [ 4] 5267 	ret
                                   5268 
                                   5269 ;----------------------
                                   5270 ; BASIC: QKEY
                                   5271 ; Return true if there 
                                   5272 ; is a character in 
                                   5273 ; waiting in STDIN 
                                   5274 ; input:
                                   5275 ;  none 
                                   5276 ; output:
                                   5277 ;   X 		0|-1 
                                   5278 ;-----------------------
      009BE4                       5279 qkey: 
      009BE4 5F               [ 1] 5280 	clrw x 
      009BE5 72 5D 00 28      [ 1] 5281 	tnz rx_char
      009BE9 27 01            [ 1] 5282 	jreq 9$ 
      009BEB 53               [ 2] 5283 	cplw x 
      009BEC A6 04            [ 1] 5284 9$: ld a,#TK_INTGR
      009BEE 81               [ 4] 5285 	ret 
                                   5286 
                                   5287 ;---------------------
                                   5288 ; BASIC: GPIO(expr,reg)
                                   5289 ; return gpio address 
                                   5290 ; expr {0..8}
                                   5291 ; input:
                                   5292 ;   none 
                                   5293 ; output:
                                   5294 ;   X 		gpio register address
                                   5295 ;----------------------------
                           000003  5296 	PORT=3
                           000001  5297 	REG=1 
                           000004  5298 	VSIZE=4 
      009BEF                       5299 gpio:
      009BEF CD 8F 2B         [ 4] 5300 	call func_args 
      009BF2 A1 02            [ 1] 5301 	cp a,#2
      009BF4 27 03            [ 1] 5302 	jreq 1$
      009BF6 CC 87 81         [ 2] 5303 	jp syntax_error  
      009BF9                       5304 1$:	
      009BF9 1E 03            [ 2] 5305 	ldw x,(PORT,sp)
      009BFB 2B 17            [ 1] 5306 	jrmi bad_port
      009BFD A3 00 09         [ 2] 5307 	cpw x,#9
      009C00 2A 12            [ 1] 5308 	jrpl bad_port
      009C02 A6 05            [ 1] 5309 	ld a,#5
      009C04 42               [ 4] 5310 	mul x,a
      009C05 1C 50 00         [ 2] 5311 	addw x,#GPIO_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C08 1F 03            [ 2] 5312 	ldw (PORT,sp),x  
      009C0A 1E 01            [ 2] 5313 	ldw x,(REG,sp) 
      009C0C 72 FB 03         [ 2] 5314 	addw x,(PORT,sp)
      009C0F A6 04            [ 1] 5315 	ld a,#TK_INTGR
      001B91                       5316 	_drop VSIZE 
      009C11 5B 04            [ 2]    1     addw sp,#VSIZE 
      009C13 81               [ 4] 5317 	ret
      009C14                       5318 bad_port:
      009C14 A6 0A            [ 1] 5319 	ld a,#ERR_BAD_VALUE
      009C16 CC 87 83         [ 2] 5320 	jp tb_error
                                   5321 
                                   5322 
                                   5323 ;-------------------------
                                   5324 ; BASIC: UFLASH 
                                   5325 ; return user flash address
                                   5326 ; input:
                                   5327 ;  none 
                                   5328 ; output:
                                   5329 ;	A		TK_INTGR
                                   5330 ;   X 		user address 
                                   5331 ;---------------------------
      009C19                       5332 uflash:
      009C19 AE A5 80         [ 2] 5333 	ldw x,#user_space 
      009C1C A6 04            [ 1] 5334 	ld a,#TK_INTGR 
      009C1E 81               [ 4] 5335 	ret 
                                   5336 
                                   5337 
                                   5338 ;---------------------
                                   5339 ; BASIC: USR(addr[,arg])
                                   5340 ; execute a function written 
                                   5341 ; in binary code.
                                   5342 ; binary fonction should 
                                   5343 ; return token attribute in A 
                                   5344 ; and value in X. 
                                   5345 ; input:
                                   5346 ;   addr	routine address 
                                   5347 ;   arg 	is an optional argument 
                                   5348 ; output:
                                   5349 ;   A 		token attribute 
                                   5350 ;   X       returned value 
                                   5351 ;---------------------
      009C1F                       5352 usr:
      009C1F 90 89            [ 2] 5353 	pushw y 	
      009C21 CD 8F 2B         [ 4] 5354 	call func_args 
      009C24 A1 01            [ 1] 5355 	cp a,#1 
      009C26 27 07            [ 1] 5356 	jreq 2$
      009C28 A1 02            [ 1] 5357 	cp a,#2
      009C2A 27 03            [ 1] 5358 	jreq 2$  
      009C2C CC 87 81         [ 2] 5359 	jp syntax_error 
      009C2F 90 85            [ 2] 5360 2$: popw y  ; arg|addr 
      009C31 A1 01            [ 1] 5361 	cp a,#1
      009C33 27 02            [ 1] 5362 	jreq 3$
      009C35 85               [ 2] 5363 	popw x ; addr
      009C36 51               [ 1] 5364 	exgw x,y 
      009C37 90 FD            [ 4] 5365 3$: call (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C39 90 85            [ 2] 5366 	popw y 
      009C3B 81               [ 4] 5367 	ret 
                                   5368 
                                   5369 ;------------------------------
                                   5370 ; BASIC: BYE 
                                   5371 ; halt mcu in its lowest power mode 
                                   5372 ; wait for reset or external interrupt
                                   5373 ; do a cold start on wakeup.
                                   5374 ;------------------------------
      009C3C                       5375 bye:
      009C3C 72 0D 52 30 FB   [ 2] 5376 	btjf UART1_SR,#UART_SR_TC,.
      009C41 8E               [10] 5377 	halt
      009C42 CC 85 54         [ 2] 5378 	jp cold_start  
                                   5379 
                                   5380 ;----------------------------------
                                   5381 ; BASIC: AUTORUN "file_name" 
                                   5382 ; record in eeprom at adrress AUTORUN_NAME
                                   5383 ; the name of file to load and execute
                                   5384 ; at startup 
                                   5385 ; input:
                                   5386 ;   file_name   file to execute 
                                   5387 ; output:
                                   5388 ;   none
                                   5389 ;-----------------------------------
      009C45                       5390 autorun: 
      009C45 72 01 00 26 07   [ 2] 5391 	btjf flags,#FRUN,0$ 
      009C4A 27 05            [ 1] 5392 	jreq 0$ 
      009C4C A6 07            [ 1] 5393 	ld a,#ERR_CMD_ONLY 
      009C4E CC 87 83         [ 2] 5394 	jp tb_error 
      009C51                       5395 0$:	
      009C51 CD 88 35         [ 4] 5396 	call next_token 
      009C54 A1 0A            [ 1] 5397 	cp a,#TK_QSTR
      009C56 27 03            [ 1] 5398 	jreq 1$
      009C58 CC 87 81         [ 2] 5399 	jp syntax_error 
      009C5B                       5400 1$:	
      009C5B 89               [ 2] 5401 	pushw x ; file name char*
      009C5C 90 93            [ 1] 5402 	ldw y,x  
      009C5E CD 99 17         [ 4] 5403 	call search_file 
      009C61 25 05            [ 1] 5404 	jrc 2$ 
      009C63 A6 09            [ 1] 5405 	ld a,#ERR_NOT_FILE
      009C65 CC 87 83         [ 2] 5406 	jp tb_error  
      009C68                       5407 2$: 
      009C68 55 00 04 00 02   [ 1] 5408 	mov in,count 
      009C6D 72 5F 00 17      [ 1] 5409 	clr farptr 
      009C71 AE 40 00         [ 2] 5410 	ldw x,#AUTORUN_NAME
      009C74 CF 00 18         [ 2] 5411 	ldw farptr+1,x 
      009C77 1E 01            [ 2] 5412 	ldw x,(1,sp)  
      009C79 CD 82 7A         [ 4] 5413 	call strlen  ; return length in X 
      009C7C 90 85            [ 2] 5414 	popw y 
      009C7E 89               [ 2] 5415 	pushw x 
      009C7F 5F               [ 1] 5416 	clrw x 
      009C80 CD 81 D5         [ 4] 5417 	call write_block 
      001C03                       5418 	_drop 2 
      009C83 5B 02            [ 2]    1     addw sp,#2 
      009C85 81               [ 4] 5419 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5420 
                                   5421 ;----------------------------------
                                   5422 ; BASIC: SLEEP 
                                   5423 ; halt mcu until reset or external
                                   5424 ; interrupt.
                                   5425 ; Resume progam after SLEEP command
                                   5426 ;----------------------------------
      009C86                       5427 sleep:
      009C86 72 0D 52 30 FB   [ 2] 5428 	btjf UART1_SR,#UART_SR_TC,.
      009C8B 72 16 00 26      [ 1] 5429 	bset flags,#FSLEEP
      009C8F 8E               [10] 5430 	halt 
      009C90 81               [ 4] 5431 	ret 
                                   5432 
                                   5433 ;-------------------------------
                                   5434 ; BASIC: PAUSE expr 
                                   5435 ; suspend execution for n msec.
                                   5436 ; input:
                                   5437 ;	none
                                   5438 ; output:
                                   5439 ;	none 
                                   5440 ;------------------------------
      009C91                       5441 pause:
      009C91 CD 90 10         [ 4] 5442 	call expression
      009C94 A1 04            [ 1] 5443 	cp a,#TK_INTGR
      009C96 27 03            [ 1] 5444 	jreq pause02 
      009C98 CC 87 81         [ 2] 5445 	jp syntax_error
      009C9B                       5446 pause02: 
      009C9B 5D               [ 2] 5447 1$: tnzw x 
      009C9C 27 04            [ 1] 5448 	jreq 2$
      009C9E 8F               [10] 5449 	wfi 
      009C9F 5A               [ 2] 5450 	decw x 
      009CA0 26 F9            [ 1] 5451 	jrne 1$
      009CA2 4F               [ 1] 5452 2$:	clr a 
      009CA3 81               [ 4] 5453 	ret 
                                   5454 
                                   5455 ;------------------------------
                                   5456 ; BASIC: AWU expr
                                   5457 ; halt mcu for 'expr' milliseconds
                                   5458 ; use Auto wakeup peripheral
                                   5459 ; all oscillators stopped except LSI
                                   5460 ; range: 1ms - 511ms
                                   5461 ; input:
                                   5462 ;  none
                                   5463 ; output:
                                   5464 ;  none:
                                   5465 ;------------------------------
      009CA4                       5466 awu:
      009CA4 CD 90 10         [ 4] 5467   call expression
      009CA7 A1 04            [ 1] 5468   cp a,#TK_INTGR
      009CA9 27 03            [ 1] 5469   jreq awu02
      009CAB CC 87 81         [ 2] 5470   jp syntax_error
      009CAE                       5471 awu02:
      009CAE A3 14 00         [ 2] 5472   cpw x,#5120
      009CB1 2B 0C            [ 1] 5473   jrmi 1$ 
      009CB3 35 0F 50 F2      [ 1] 5474   mov AWU_TBR,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CB7 A6 1E            [ 1] 5475   ld a,#30
      009CB9 62               [ 2] 5476   div x,a
      009CBA A6 10            [ 1] 5477   ld a,#16
      009CBC 62               [ 2] 5478   div x,a 
      009CBD 20 1E            [ 2] 5479   jra 4$
      009CBF                       5480 1$: 
      009CBF A3 08 00         [ 2] 5481   cpw x,#2048
      009CC2 2B 09            [ 1] 5482   jrmi 2$ 
      009CC4 35 0E 50 F2      [ 1] 5483   mov AWU_TBR,#14
      009CC8 A6 50            [ 1] 5484   ld a,#80
      009CCA 62               [ 2] 5485   div x,a 
      009CCB 20 10            [ 2] 5486   jra 4$   
      009CCD                       5487 2$:
      009CCD 35 07 50 F2      [ 1] 5488   mov AWU_TBR,#7
      009CD1                       5489 3$:  
                                   5490 ; while X > 64  divide by 2 and increment AWU_TBR 
      009CD1 A3 00 40         [ 2] 5491   cpw x,#64 
      009CD4 23 07            [ 2] 5492   jrule 4$ 
      009CD6 72 5C 50 F2      [ 1] 5493   inc AWU_TBR 
      009CDA 54               [ 2] 5494   srlw x 
      009CDB 20 F4            [ 2] 5495   jra 3$ 
      009CDD                       5496 4$:
      009CDD 9F               [ 1] 5497   ld a, xl
      009CDE 4A               [ 1] 5498   dec a 
      009CDF 27 01            [ 1] 5499   jreq 5$
      009CE1 4A               [ 1] 5500   dec a 	
      009CE2                       5501 5$: 
      009CE2 A4 3E            [ 1] 5502   and a,#0x3e 
      009CE4 C7 50 F1         [ 1] 5503   ld AWU_APR,a 
      009CE7 72 18 50 F0      [ 1] 5504   bset AWU_CSR,#AWU_CSR_AWUEN
      009CEB 8E               [10] 5505   halt 
                                   5506 
      009CEC 81               [ 4] 5507   ret 
                                   5508 
                                   5509 ;------------------------------
                                   5510 ; BASIC: TICKS
                                   5511 ; return msec ticks counter value 
                                   5512 ; input:
                                   5513 ; 	none 
                                   5514 ; output:
                                   5515 ;	X 		TK_INTGR
                                   5516 ;-------------------------------
      009CED                       5517 get_ticks:
      009CED CE 00 0F         [ 2] 5518 	ldw x,ticks 
      009CF0 A6 04            [ 1] 5519 	ld a,#TK_INTGR
      009CF2 81               [ 4] 5520 	ret 
                                   5521 
                                   5522 
                                   5523 
                                   5524 ;------------------------------
                                   5525 ; BASIC: ABS(expr)
                                   5526 ; return absolute value of expr.
                                   5527 ; input:
                                   5528 ;   none
                                   5529 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                   5530 ;   X     	positive integer
                                   5531 ;-------------------------------
      009CF3                       5532 abs:
      009CF3 CD 8F 2B         [ 4] 5533 	call func_args 
      009CF6 A1 01            [ 1] 5534 	cp a,#1 
      009CF8 27 03            [ 1] 5535 	jreq 0$ 
      009CFA CC 87 81         [ 2] 5536 	jp syntax_error
      009CFD                       5537 0$:  
      009CFD 85               [ 2] 5538     popw x   
      009CFE 9E               [ 1] 5539 	ld a,xh 
      009CFF A5 80            [ 1] 5540 	bcp a,#0x80 
      009D01 27 01            [ 1] 5541 	jreq 2$ 
      009D03 50               [ 2] 5542 	negw x 
      009D04 A6 04            [ 1] 5543 2$: ld a,#TK_INTGR 
      009D06 81               [ 4] 5544 	ret 
                                   5545 
                                   5546 ;------------------------------
                                   5547 ; BASIC: AND(expr1,expr2)
                                   5548 ; Apply bit AND relation between
                                   5549 ; the 2 arguments, i.e expr1 & expr2 
                                   5550 ; output:
                                   5551 ; 	A 		TK_INTGR
                                   5552 ;   X 		result 
                                   5553 ;------------------------------
      009D07                       5554 bit_and:
      009D07 CD 8F 2B         [ 4] 5555 	call func_args 
      009D0A A1 02            [ 1] 5556 	cp a,#2
      009D0C 27 03            [ 1] 5557 	jreq 1$
      009D0E CC 87 81         [ 2] 5558 	jp syntax_error 
      009D11 85               [ 2] 5559 1$:	popw x 
      009D12 9E               [ 1] 5560 	ld a,xh 
      009D13 14 01            [ 1] 5561 	and a,(1,sp)
      009D15 95               [ 1] 5562 	ld xh,a 
      009D16 9F               [ 1] 5563 	ld a,xl
      009D17 14 02            [ 1] 5564 	and a,(2,sp)
      009D19 97               [ 1] 5565 	ld xl,a 
      001C9A                       5566 	_drop 2 
      009D1A 5B 02            [ 2]    1     addw sp,#2 
      009D1C A6 04            [ 1] 5567 	ld a,#TK_INTGR
      009D1E 81               [ 4] 5568 	ret
                                   5569 
                                   5570 ;------------------------------
                                   5571 ; BASIC: OR(expr1,expr2)
                                   5572 ; Apply bit OR relation between
                                   5573 ; the 2 arguments, i.e expr1 | expr2 
                                   5574 ; output:
                                   5575 ; 	A 		TK_INTGR
                                   5576 ;   X 		result 
                                   5577 ;------------------------------
      009D1F                       5578 bit_or:
      009D1F CD 8F 2B         [ 4] 5579 	call func_args 
      009D22 A1 02            [ 1] 5580 	cp a,#2
      009D24 27 03            [ 1] 5581 	jreq 1$
      009D26 CC 87 81         [ 2] 5582 	jp syntax_error 
      009D29                       5583 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D29 85               [ 2] 5584 	popw x 
      009D2A 9E               [ 1] 5585 	ld a,xh 
      009D2B 1A 01            [ 1] 5586 	or a,(1,sp)
      009D2D 95               [ 1] 5587 	ld xh,a 
      009D2E 9F               [ 1] 5588 	ld a,xl 
      009D2F 1A 02            [ 1] 5589 	or a,(2,sp)
      009D31 97               [ 1] 5590 	ld xl,a 
      001CB2                       5591 	_drop 2 
      009D32 5B 02            [ 2]    1     addw sp,#2 
      009D34 A6 04            [ 1] 5592 	ld a,#TK_INTGR 
      009D36 81               [ 4] 5593 	ret
                                   5594 
                                   5595 ;------------------------------
                                   5596 ; BASIC: XOR(expr1,expr2)
                                   5597 ; Apply bit XOR relation between
                                   5598 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5599 ; output:
                                   5600 ; 	A 		TK_INTGR
                                   5601 ;   X 		result 
                                   5602 ;------------------------------
      009D37                       5603 bit_xor:
      009D37 CD 8F 2B         [ 4] 5604 	call func_args 
      009D3A A1 02            [ 1] 5605 	cp a,#2
      009D3C 27 03            [ 1] 5606 	jreq 1$
      009D3E CC 87 81         [ 2] 5607 	jp syntax_error 
      009D41                       5608 1$: 
      009D41 85               [ 2] 5609 	popw x 
      009D42 9E               [ 1] 5610 	ld a,xh 
      009D43 18 01            [ 1] 5611 	xor a,(1,sp)
      009D45 95               [ 1] 5612 	ld xh,a 
      009D46 9F               [ 1] 5613 	ld a,xl 
      009D47 18 02            [ 1] 5614 	xor a,(2,sp)
      009D49 97               [ 1] 5615 	ld xl,a 
      001CCA                       5616 	_drop 2 
      009D4A 5B 02            [ 2]    1     addw sp,#2 
      009D4C A6 04            [ 1] 5617 	ld a,#TK_INTGR 
      009D4E 81               [ 4] 5618 	ret 
                                   5619 
                                   5620 ;------------------------------
                                   5621 ; BASIC: LSHIFT(expr1,expr2)
                                   5622 ; logical shift left expr1 by 
                                   5623 ; expr2 bits 
                                   5624 ; output:
                                   5625 ; 	A 		TK_INTGR
                                   5626 ;   X 		result 
                                   5627 ;------------------------------
      009D4F                       5628 lshift:
      009D4F CD 8F 2B         [ 4] 5629 	call func_args
      009D52 A1 02            [ 1] 5630 	cp a,#2 
      009D54 27 03            [ 1] 5631 	jreq 1$
      009D56 CC 87 81         [ 2] 5632 	jp syntax_error
      009D59 90 85            [ 2] 5633 1$: popw y   
      009D5B 85               [ 2] 5634 	popw x 
      009D5C 90 5D            [ 2] 5635 	tnzw y 
      009D5E 27 05            [ 1] 5636 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009D60 58               [ 2] 5637 2$:	sllw x 
      009D61 90 5A            [ 2] 5638 	decw y 
      009D63 26 FB            [ 1] 5639 	jrne 2$
      009D65                       5640 4$:  
      009D65 A6 04            [ 1] 5641 	ld a,#TK_INTGR
      009D67 81               [ 4] 5642 	ret
                                   5643 
                                   5644 ;------------------------------
                                   5645 ; BASIC: RSHIFT(expr1,expr2)
                                   5646 ; logical shift right expr1 by 
                                   5647 ; expr2 bits.
                                   5648 ; output:
                                   5649 ; 	A 		TK_INTGR
                                   5650 ;   X 		result 
                                   5651 ;------------------------------
      009D68                       5652 rshift:
      009D68 CD 8F 2B         [ 4] 5653 	call func_args
      009D6B A1 02            [ 1] 5654 	cp a,#2 
      009D6D 27 03            [ 1] 5655 	jreq 1$
      009D6F CC 87 81         [ 2] 5656 	jp syntax_error
      009D72 90 85            [ 2] 5657 1$: popw y  
      009D74 85               [ 2] 5658 	popw x
      009D75 90 5D            [ 2] 5659 	tnzw y 
      009D77 27 05            [ 1] 5660 	jreq 4$
      009D79 54               [ 2] 5661 2$:	srlw x 
      009D7A 90 5A            [ 2] 5662 	decw y 
      009D7C 26 FB            [ 1] 5663 	jrne 2$
      009D7E                       5664 4$:  
      009D7E A6 04            [ 1] 5665 	ld a,#TK_INTGR
      009D80 81               [ 4] 5666 	ret
                                   5667 
                                   5668 ;--------------------------
                                   5669 ; BASIC: FCPU integer
                                   5670 ; set CPU frequency 
                                   5671 ;-------------------------- 
                                   5672 
      009D81                       5673 fcpu:
      009D81 A6 04            [ 1] 5674 	ld a,#TK_INTGR
      009D83 CD 8E F7         [ 4] 5675 	call expect 
      009D86 9F               [ 1] 5676 	ld a,xl 
      009D87 A4 07            [ 1] 5677 	and a,#7 
      009D89 C7 50 C6         [ 1] 5678 	ld CLK_CKDIVR,a 
      009D8C 81               [ 4] 5679 	ret 
                                   5680 
                                   5681 ;------------------------------
                                   5682 ; BASIC: PMODE pin#, mode 
                                   5683 ; Arduino pin. 
                                   5684 ; define pin as input or output
                                   5685 ; pin#: {0..15}
                                   5686 ; mode: INPUT|OUTPUT  
                                   5687 ;------------------------------
                           000001  5688 	PINNO=1
                           000001  5689 	VSIZE=1
      009D8D                       5690 pin_mode:
      001D0D                       5691 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009D8D 52 01            [ 2]    1     sub sp,#VSIZE 
      009D8F CD 8F 04         [ 4] 5692 	call arg_list 
      009D92 A1 02            [ 1] 5693 	cp a,#2 
      009D94 27 03            [ 1] 5694 	jreq 1$
      009D96 CC 87 81         [ 2] 5695 	jp syntax_error 
      009D99 90 85            [ 2] 5696 1$: popw y ; mode 
      009D9B 85               [ 2] 5697 	popw x ; Dx pin 
      009D9C CD 9D CE         [ 4] 5698 	call select_pin 
      009D9F 6B 01            [ 1] 5699 	ld (PINNO,sp),a  
      009DA1 A6 01            [ 1] 5700 	ld a,#1 
      009DA3 0D 01            [ 1] 5701 	tnz (PINNO,sp)
      009DA5 27 0B            [ 1] 5702 	jreq 4$
      009DA7 48               [ 1] 5703 2$:	sll a 
      009DA8 0A 01            [ 1] 5704 	dec (PINNO,sp)
      009DAA 26 FB            [ 1] 5705 	jrne 2$ 
      009DAC 6B 01            [ 1] 5706 	ld (PINNO,sp),a
      009DAE EA 03            [ 1] 5707 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009DB0 E7 03            [ 1] 5708 	ld (GPIO_CR1,x),a 
      009DB2 90 A3 00 01      [ 2] 5709 4$:	cpw y,#OUTP 
      009DB6 27 07            [ 1] 5710 	jreq 6$
                                   5711 ; input mode
      009DB8 7B 01            [ 1] 5712 	ld a,(PINNO,sp)
      009DBA 43               [ 1] 5713 	cpl a 
      009DBB E4 02            [ 1] 5714 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009DBD 20 0A            [ 2] 5715 	jra 9$
      009DBF                       5716 6$: ;output mode  
      009DBF 7B 01            [ 1] 5717 	ld a,(PINNO,sp)
      009DC1 EA 04            [ 1] 5718 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009DC3 E7 04            [ 1] 5719 	ld (GPIO_CR2,x),a 
      009DC5 7B 01            [ 1] 5720 	ld a,(PINNO,sp)
      009DC7 EA 02            [ 1] 5721 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009DC9 E7 02            [ 1] 5722 9$:	ld (GPIO_DDR,x),a 
      001D4B                       5723 	_drop VSIZE 
      009DCB 5B 01            [ 2]    1     addw sp,#VSIZE 
      009DCD 81               [ 4] 5724 	ret
                                   5725 
                                   5726 ;------------------------
                                   5727 ; select Arduino pin 
                                   5728 ; input:
                                   5729 ;   X 	 {0..15} Arduino Dx 
                                   5730 ; output:
                                   5731 ;   A     stm8s208 pin 
                                   5732 ;   X     base address s208 GPIO port 
                                   5733 ;---------------------------
      009DCE                       5734 select_pin:
      009DCE 58               [ 2] 5735 	sllw x 
      009DCF 1C 9D DE         [ 2] 5736 	addw x,#arduino_to_8s208 
      009DD2 FE               [ 2] 5737 	ldw x,(x)
      009DD3 9F               [ 1] 5738 	ld a,xl 
      009DD4 88               [ 1] 5739 	push a 
      009DD5 5E               [ 1] 5740 	swapw x 
      009DD6 A6 05            [ 1] 5741 	ld a,#5 
      009DD8 42               [ 4] 5742 	mul x,a 
      009DD9 1C 50 00         [ 2] 5743 	addw x,#GPIO_BASE 
      009DDC 84               [ 1] 5744 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DDD 81               [ 4] 5745 	ret 
                                   5746 ; translation from Arduino D0..D15 to stm8s208rb 
      009DDE                       5747 arduino_to_8s208:
      009DDE 03 06                 5748 .byte 3,6 ; D0 
      009DE0 03 05                 5749 .byte 3,5 ; D1 
      009DE2 04 00                 5750 .byte 4,0 ; D2 
      009DE4 02 01                 5751 .byte 2,1 ; D3
      009DE6 06 00                 5752 .byte 6,0 ; D4
      009DE8 02 02                 5753 .byte 2,2 ; D5
      009DEA 02 03                 5754 .byte 2,3 ; D6
      009DEC 03 01                 5755 .byte 3,1 ; D7
      009DEE 03 03                 5756 .byte 3,3 ; D8
      009DF0 02 04                 5757 .byte 2,4 ; D9
      009DF2 04 05                 5758 .byte 4,5 ; D10
      009DF4 02 06                 5759 .byte 2,6 ; D11
      009DF6 02 07                 5760 .byte 2,7 ; D12
      009DF8 02 05                 5761 .byte 2,5 ; D13
      009DFA 04 02                 5762 .byte 4,2 ; D14
      009DFC 04 01                 5763 .byte 4,1 ; D15
                                   5764 
                                   5765 
                                   5766 ;------------------------------
                                   5767 ; BASIC: RND(expr)
                                   5768 ; return random number 
                                   5769 ; between 1 and expr inclusive
                                   5770 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5771 ; input:
                                   5772 ; 	none 
                                   5773 ; output:
                                   5774 ;	X 		random positive integer 
                                   5775 ;------------------------------
      009DFE                       5776 random:
      009DFE CD 8F 2B         [ 4] 5777 	call func_args 
      009E01 A1 01            [ 1] 5778 	cp a,#1
      009E03 27 03            [ 1] 5779 	jreq 1$
      009E05 CC 87 81         [ 2] 5780 	jp syntax_error
      009E08                       5781 1$:  
      009E08 A6 80            [ 1] 5782 	ld a,#0x80 
      009E0A 15 01            [ 1] 5783 	bcp a,(1,sp)
      009E0C 27 05            [ 1] 5784 	jreq 2$
      009E0E A6 0A            [ 1] 5785 	ld a,#ERR_BAD_VALUE
      009E10 CC 87 83         [ 2] 5786 	jp tb_error
      009E13                       5787 2$: 
                                   5788 ; acc16=(x<<5)^x 
      009E13 CE 00 13         [ 2] 5789 	ldw x,seedx 
      009E16 58               [ 2] 5790 	sllw x 
      009E17 58               [ 2] 5791 	sllw x 
      009E18 58               [ 2] 5792 	sllw x 
      009E19 58               [ 2] 5793 	sllw x 
      009E1A 58               [ 2] 5794 	sllw x 
      009E1B 9E               [ 1] 5795 	ld a,xh 
      009E1C C8 00 13         [ 1] 5796 	xor a,seedx 
      009E1F C7 00 0D         [ 1] 5797 	ld acc16,a 
      009E22 9F               [ 1] 5798 	ld a,xl 
      009E23 C8 00 14         [ 1] 5799 	xor a,seedx+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E26 C7 00 0E         [ 1] 5800 	ld acc8,a 
                                   5801 ; seedx=seedy 
      009E29 CE 00 15         [ 2] 5802 	ldw x,seedy 
      009E2C CF 00 13         [ 2] 5803 	ldw seedx,x  
                                   5804 ; seedy=seedy^(seedy>>1)
      009E2F 90 54            [ 2] 5805 	srlw y 
      009E31 90 9E            [ 1] 5806 	ld a,yh 
      009E33 C8 00 15         [ 1] 5807 	xor a,seedy 
      009E36 C7 00 15         [ 1] 5808 	ld seedy,a  
      009E39 90 9F            [ 1] 5809 	ld a,yl 
      009E3B C8 00 16         [ 1] 5810 	xor a,seedy+1 
      009E3E C7 00 16         [ 1] 5811 	ld seedy+1,a 
                                   5812 ; acc16>>3 
      009E41 CE 00 0D         [ 2] 5813 	ldw x,acc16 
      009E44 54               [ 2] 5814 	srlw x 
      009E45 54               [ 2] 5815 	srlw x 
      009E46 54               [ 2] 5816 	srlw x 
                                   5817 ; x=acc16^x 
      009E47 9E               [ 1] 5818 	ld a,xh 
      009E48 C8 00 0D         [ 1] 5819 	xor a,acc16 
      009E4B 95               [ 1] 5820 	ld xh,a 
      009E4C 9F               [ 1] 5821 	ld a,xl 
      009E4D C8 00 0E         [ 1] 5822 	xor a,acc8 
      009E50 97               [ 1] 5823 	ld xl,a 
                                   5824 ; seedy=x^seedy 
      009E51 C8 00 16         [ 1] 5825 	xor a,seedy+1
      009E54 97               [ 1] 5826 	ld xl,a 
      009E55 9E               [ 1] 5827 	ld a,xh 
      009E56 C8 00 15         [ 1] 5828 	xor a,seedy
      009E59 95               [ 1] 5829 	ld xh,a 
      009E5A CF 00 15         [ 2] 5830 	ldw seedy,x 
                                   5831 ; return seedy modulo expr + 1 
      009E5D 90 85            [ 2] 5832 	popw y 
      009E5F 65               [ 2] 5833 	divw x,y 
      009E60 93               [ 1] 5834 	ldw x,y 
      009E61 5C               [ 2] 5835 	incw x 
      009E62                       5836 10$:
      009E62 A6 04            [ 1] 5837 	ld a,#TK_INTGR
      009E64 81               [ 4] 5838 	ret 
                                   5839 
                                   5840 ;---------------------------------
                                   5841 ; BASIC: WORDS 
                                   5842 ; affiche la listes des mots du
                                   5843 ; dictionnaire.
                                   5844 ;---------------------------------
                           000001  5845 	WLEN=1
                           000002  5846 	LLEN=2  
                           000002  5847 	VSIZE=2 
      009E65                       5848 words:
      001DE5                       5849 	_vars VSIZE
      009E65 52 02            [ 2]    1     sub sp,#VSIZE 
      009E67 0F 02            [ 1] 5850 	clr (LLEN,sp)
      009E69 90 AE A5 10      [ 2] 5851 	ldw y,#kword_dict+2
      009E6D 93               [ 1] 5852 0$:	ldw x,y
      009E6E F6               [ 1] 5853 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E6F A4 0F            [ 1] 5854 	and a,#15 
      009E71 6B 01            [ 1] 5855 	ld (WLEN,sp),a 
      009E73 5C               [ 2] 5856 1$:	incw x 
      009E74 F6               [ 1] 5857 	ld a,(x)
      009E75 CD 82 33         [ 4] 5858 	call putc 
      009E78 0C 02            [ 1] 5859 	inc (LLEN,sp)
      009E7A 0A 01            [ 1] 5860 	dec (WLEN,sp)
      009E7C 26 F5            [ 1] 5861 	jrne 1$
      009E7E A6 46            [ 1] 5862 	ld a,#70
      009E80 11 02            [ 1] 5863 	cp a,(LLEN,sp)
      009E82 2B 09            [ 1] 5864 	jrmi 2$   
      009E84 A6 20            [ 1] 5865 	ld a,#SPACE 
      009E86 CD 82 33         [ 4] 5866 	call putc 
      009E89 0C 02            [ 1] 5867 	inc (LLEN,sp) 
      009E8B 20 07            [ 2] 5868 	jra 3$
      009E8D A6 0D            [ 1] 5869 2$: ld a,#CR 
      009E8F CD 82 33         [ 4] 5870 	call putc 
      009E92 0F 02            [ 1] 5871 	clr (LLEN,sp)
      009E94 72 A2 00 02      [ 2] 5872 3$:	subw y,#2 
      009E98 90 FE            [ 2] 5873 	ldw y,(y)
      009E9A 26 D1            [ 1] 5874 	jrne 0$  
      001E1C                       5875 	_drop VSIZE 
      009E9C 5B 02            [ 2]    1     addw sp,#VSIZE 
      009E9E 81               [ 4] 5876 	ret 
                                   5877 
                                   5878 
                                   5879 ;-----------------------------
                                   5880 ; BASIC: TIMER expr 
                                   5881 ; initialize count down timer 
                                   5882 ;-----------------------------
      009E9F                       5883 set_timer:
      009E9F CD 8F 04         [ 4] 5884 	call arg_list
      009EA2 A1 01            [ 1] 5885 	cp a,#1 
      009EA4 27 03            [ 1] 5886 	jreq 1$
      009EA6 CC 87 81         [ 2] 5887 	jp syntax_error
      009EA9                       5888 1$: 
      009EA9 85               [ 2] 5889 	popw x 
      009EAA CF 00 11         [ 2] 5890 	ldw timer,x 
      009EAD 81               [ 4] 5891 	ret 
                                   5892 
                                   5893 ;------------------------------
                                   5894 ; BASIC: TIMEOUT 
                                   5895 ; return state of timer 
                                   5896 ;------------------------------
      009EAE                       5897 timeout:
      009EAE CE 00 11         [ 2] 5898 	ldw x,timer 
      009EB1                       5899 logical_complement:
      009EB1 53               [ 2] 5900 	cplw x 
      009EB2 A3 FF FF         [ 2] 5901 	cpw x,#-1
      009EB5 27 01            [ 1] 5902 	jreq 2$
      009EB7 5F               [ 1] 5903 	clrw x 
      009EB8 A6 04            [ 1] 5904 2$:	ld a,#TK_INTGR
      009EBA 81               [ 4] 5905 	ret 
                                   5906 
                                   5907 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5908 ; BASIC NOT(expr) 
                                   5909 ; return logical complement of expr
                                   5910 ;--------------------------------
      009EBB                       5911 func_not:
      009EBB CD 8F 2B         [ 4] 5912 	call func_args  
      009EBE A1 01            [ 1] 5913 	cp a,#1
      009EC0 27 03            [ 1] 5914 	jreq 1$
      009EC2 CC 87 81         [ 2] 5915 	jp syntax_error
      009EC5 85               [ 2] 5916 1$:	popw x 
      009EC6 20 E9            [ 2] 5917 	jra logical_complement
                                   5918 
                                   5919 
                                   5920 
                                   5921 ;-----------------------------------
                                   5922 ; BASIC: IWDGEN expr1 
                                   5923 ; enable independant watchdog timer
                                   5924 ; expr1 is delay in multiple of 62.5µsec
                                   5925 ; expr1 -> {1..16383}
                                   5926 ;-----------------------------------
      009EC8                       5927 enable_iwdg:
      009EC8 CD 8F 04         [ 4] 5928 	call arg_list
      009ECB A1 01            [ 1] 5929 	cp a,#1 
      009ECD 27 03            [ 1] 5930 	jreq 1$
      009ECF CC 87 81         [ 2] 5931 	jp syntax_error 
      009ED2 85               [ 2] 5932 1$: popw x 
      009ED3 4B 00            [ 1] 5933 	push #0
      009ED5 35 CC 50 E0      [ 1] 5934 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009ED9 9E               [ 1] 5935 	ld a,xh 
      009EDA A4 3F            [ 1] 5936 	and a,#0x3f
      009EDC 95               [ 1] 5937 	ld xh,a  
      009EDD A3 00 FF         [ 2] 5938 2$:	cpw x,#255
      009EE0 23 06            [ 2] 5939 	jrule 3$
      009EE2 0C 01            [ 1] 5940 	inc (1,sp)
      009EE4 98               [ 1] 5941 	rcf 
      009EE5 56               [ 2] 5942 	rrcw x 
      009EE6 20 F5            [ 2] 5943 	jra 2$
      009EE8 35 55 50 E0      [ 1] 5944 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EEC 84               [ 1] 5945 	pop a  
      009EED C7 50 E1         [ 1] 5946 	ld IWDG_PR,a 
      009EF0 9F               [ 1] 5947 	ld a,xl
      009EF1 4A               [ 1] 5948 	dec a 
      009EF2 35 55 50 E0      [ 1] 5949 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EF6 C7 50 E2         [ 1] 5950 	ld IWDG_RLR,a 
      009EF9 35 AA 50 E0      [ 1] 5951 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009EFD 81               [ 4] 5952 	ret 
                                   5953 
                                   5954 
                                   5955 ;-----------------------------------
                                   5956 ; BASIC: IWDGREF  
                                   5957 ; refresh independant watchdog count down 
                                   5958 ; timer before it reset MCU. 
                                   5959 ;-----------------------------------
      009EFE                       5960 refresh_iwdg:
      009EFE 35 AA 50 E0      [ 1] 5961 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009F02 81               [ 4] 5962 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5963 
                                   5964 
                                   5965 ;-------------------------------------
                                   5966 ; BASIC: LOG(expr)
                                   5967 ; return logarithm base 2 of expr 
                                   5968 ; this is the position of most significant
                                   5969 ; bit set. 
                                   5970 ; input: 
                                   5971 ; output:
                                   5972 ;   X     log2 
                                   5973 ;   A     TK_INTGR 
                                   5974 ;*********************************
      009F03                       5975 log2:
      009F03 CD 8F 2B         [ 4] 5976 	call func_args 
      009F06 A1 01            [ 1] 5977 	cp a,#1 
      009F08 27 03            [ 1] 5978 	jreq 1$
      009F0A CC 87 81         [ 2] 5979 	jp syntax_error 
      009F0D 85               [ 2] 5980 1$: popw x 
      009F0E                       5981 leading_one:
      009F0E 5D               [ 2] 5982 	tnzw x 
      009F0F 27 0A            [ 1] 5983 	jreq 4$
      009F11 A6 0F            [ 1] 5984 	ld a,#15 
      009F13 59               [ 2] 5985 2$: rlcw x 
      009F14 25 03            [ 1] 5986     jrc 3$
      009F16 4A               [ 1] 5987 	dec a 
      009F17 20 FA            [ 2] 5988 	jra 2$
      009F19 5F               [ 1] 5989 3$: clrw x 
      009F1A 97               [ 1] 5990     ld xl,a
      009F1B A6 04            [ 1] 5991 4$:	ld a,#TK_INTGR
      009F1D 81               [ 4] 5992 	ret 
                                   5993 
                                   5994 ;-----------------------------------
                                   5995 ; BASIC: BIT(expr) 
                                   5996 ; expr ->{0..15}
                                   5997 ; return 2^expr 
                                   5998 ; output:
                                   5999 ;    x    2^expr 
                                   6000 ;-----------------------------------
      009F1E                       6001 bitmask:
      009F1E CD 8F 2B         [ 4] 6002     call func_args 
      009F21 A1 01            [ 1] 6003 	cp a,#1
      009F23 27 03            [ 1] 6004 	jreq 1$
      009F25 CC 87 81         [ 2] 6005 	jp syntax_error 
      009F28 85               [ 2] 6006 1$: popw x 
      009F29 9F               [ 1] 6007 	ld a,xl 
      009F2A A4 0F            [ 1] 6008 	and a,#15
      009F2C 5F               [ 1] 6009 	clrw x 
      009F2D 5C               [ 2] 6010 	incw x 
      009F2E 4D               [ 1] 6011 2$: tnz a 
      009F2F 27 04            [ 1] 6012 	jreq 3$
      009F31 58               [ 2] 6013 	slaw x 
      009F32 4A               [ 1] 6014 	dec a 
      009F33 20 F9            [ 2] 6015 	jra 2$ 
      009F35 A6 04            [ 1] 6016 3$: ld a,#TK_INTGR
      009F37 81               [ 4] 6017 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6018 
                                   6019 ;------------------------------
                                   6020 ; BASIC: INVERT(expr)
                                   6021 ; 1's complement 
                                   6022 ;--------------------------------
      009F38                       6023 invert:
      009F38 CD 8F 2B         [ 4] 6024 	call func_args
      009F3B A1 01            [ 1] 6025 	cp a,#1 
      009F3D 27 03            [ 1] 6026 	jreq 1$
      009F3F CC 87 81         [ 2] 6027 	jp syntax_error
      009F42 85               [ 2] 6028 1$: popw x  
      009F43 53               [ 2] 6029 	cplw x 
      009F44 A6 04            [ 1] 6030 	ld a,#TK_INTGR 
      009F46 81               [ 4] 6031 	ret 
                                   6032 
                                   6033 ;------------------------------
                                   6034 ; BASIC: DO 
                                   6035 ; initiate a DO ... UNTIL loop 
                                   6036 ;------------------------------
                           000003  6037 	DOLP_ADR=3 
                           000005  6038 	DOLP_INW=5
                           000004  6039 	VSIZE=4 
      009F47                       6040 do_loop:
      009F47 85               [ 2] 6041 	popw x 
      001EC8                       6042 	_vars VSIZE 
      009F48 52 04            [ 2]    1     sub sp,#VSIZE 
      009F4A 89               [ 2] 6043 	pushw x 
      009F4B 90 CE 00 05      [ 2] 6044 	ldw y,basicptr 
      009F4F 17 03            [ 2] 6045 	ldw (DOLP_ADR,sp),y
      009F51 90 CE 00 01      [ 2] 6046 	ldw y,in.w 
      009F55 17 05            [ 2] 6047 	ldw (DOLP_INW,sp),y
      009F57 72 5C 00 23      [ 1] 6048 	inc loop_depth 
      009F5B 81               [ 4] 6049 	ret 
                                   6050 
                                   6051 ;--------------------------------
                                   6052 ; BASIC: UNTIL expr 
                                   6053 ; loop if exprssion is false 
                                   6054 ; else terminate loop
                                   6055 ;--------------------------------
      009F5C                       6056 until: 
      009F5C 72 5D 00 23      [ 1] 6057 	tnz loop_depth 
      009F60 26 03            [ 1] 6058 	jrne 1$ 
      009F62 CC 87 81         [ 2] 6059 	jp syntax_error 
      009F65                       6060 1$: 
      009F65 CD 90 54         [ 4] 6061 	call relation 
      009F68 A1 04            [ 1] 6062 	cp a,#TK_INTGR
      009F6A 27 03            [ 1] 6063 	jreq 2$
      009F6C CC 87 81         [ 2] 6064 	jp syntax_error
      009F6F                       6065 2$: 
      009F6F 5D               [ 2] 6066 	tnzw x 
      009F70 26 10            [ 1] 6067 	jrne 9$
      009F72 1E 03            [ 2] 6068 	ldw x,(DOLP_ADR,sp)
      009F74 CF 00 05         [ 2] 6069 	ldw basicptr,x 
      009F77 E6 02            [ 1] 6070 	ld a,(2,x)
      009F79 C7 00 04         [ 1] 6071 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F7C 1E 05            [ 2] 6072 	ldw x,(DOLP_INW,sp)
      009F7E CF 00 01         [ 2] 6073 	ldw in.w,x 
      009F81 81               [ 4] 6074 	ret 
      009F82                       6075 9$:	; remove loop data from stack  
      009F82 85               [ 2] 6076 	popw x
      001F03                       6077 	_drop VSIZE
      009F83 5B 04            [ 2]    1     addw sp,#VSIZE 
      009F85 72 5A 00 23      [ 1] 6078 	dec loop_depth 
      009F89 FC               [ 2] 6079 	jp (x)
                                   6080 
                                   6081 ;--------------------------
                                   6082 ; BASIC: PRTA...PRTI  
                                   6083 ;  return constant value 
                                   6084 ;  PORT  offset in GPIO
                                   6085 ;  array
                                   6086 ;---------------------------
      009F8A                       6087 const_porta:
      009F8A AE 00 00         [ 2] 6088 	ldw x,#0
      009F8D A6 04            [ 1] 6089 	ld a,#TK_INTGR 
      009F8F 81               [ 4] 6090 	ret 
      009F90                       6091 const_portb:
      009F90 AE 00 01         [ 2] 6092 	ldw x,#1
      009F93 A6 04            [ 1] 6093 	ld a,#TK_INTGR 
      009F95 81               [ 4] 6094 	ret 
      009F96                       6095 const_portc:
      009F96 AE 00 02         [ 2] 6096 	ldw x,#2
      009F99 A6 04            [ 1] 6097 	ld a,#TK_INTGR 
      009F9B 81               [ 4] 6098 	ret 
      009F9C                       6099 const_portd:
      009F9C AE 00 03         [ 2] 6100 	ldw x,#3
      009F9F A6 04            [ 1] 6101 	ld a,#TK_INTGR 
      009FA1 81               [ 4] 6102 	ret 
      009FA2                       6103 const_porte:
      009FA2 AE 00 04         [ 2] 6104 	ldw x,#4
      009FA5 A6 04            [ 1] 6105 	ld a,#TK_INTGR 
      009FA7 81               [ 4] 6106 	ret 
      009FA8                       6107 const_portf:
      009FA8 AE 00 05         [ 2] 6108 	ldw x,#5
      009FAB A6 04            [ 1] 6109 	ld a,#TK_INTGR 
      009FAD 81               [ 4] 6110 	ret 
      009FAE                       6111 const_portg:
      009FAE AE 00 06         [ 2] 6112 	ldw x,#6
      009FB1 A6 04            [ 1] 6113 	ld a,#TK_INTGR 
      009FB3 81               [ 4] 6114 	ret 
      009FB4                       6115 const_porth:
      009FB4 AE 00 07         [ 2] 6116 	ldw x,#7
      009FB7 A6 04            [ 1] 6117 	ld a,#TK_INTGR 
      009FB9 81               [ 4] 6118 	ret 
      009FBA                       6119 const_porti:
      009FBA AE 00 08         [ 2] 6120 	ldw x,#8
      009FBD A6 04            [ 1] 6121 	ld a,#TK_INTGR 
      009FBF 81               [ 4] 6122 	ret 
                                   6123 
                                   6124 ;-------------------------------
                                   6125 ; following return constant 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                                   6126 ; related to GPIO register offset 
                                   6127 ;---------------------------------
      009FC0                       6128 const_odr:
      009FC0 A6 04            [ 1] 6129 	ld a,#TK_INTGR 
      009FC2 AE 00 00         [ 2] 6130 	ldw x,#GPIO_ODR
      009FC5 81               [ 4] 6131 	ret 
      009FC6                       6132 const_idr:
      009FC6 A6 04            [ 1] 6133 	ld a,#TK_INTGR 
      009FC8 AE 00 01         [ 2] 6134 	ldw x,#GPIO_IDR
      009FCB 81               [ 4] 6135 	ret 
      009FCC                       6136 const_ddr:
      009FCC A6 04            [ 1] 6137 	ld a,#TK_INTGR 
      009FCE AE 00 02         [ 2] 6138 	ldw x,#GPIO_DDR
      009FD1 81               [ 4] 6139 	ret 
      009FD2                       6140 const_cr1:
      009FD2 A6 04            [ 1] 6141 	ld a,#TK_INTGR 
      009FD4 AE 00 03         [ 2] 6142 	ldw x,#GPIO_CR1
      009FD7 81               [ 4] 6143 	ret 
      009FD8                       6144 const_cr2:
      009FD8 A6 04            [ 1] 6145 	ld a,#TK_INTGR 
      009FDA AE 00 04         [ 2] 6146 	ldw x,#GPIO_CR2
      009FDD 81               [ 4] 6147 	ret 
                                   6148 ;-------------------------
                                   6149 ;  constant for port mode
                                   6150 ;  used by PMODE 
                                   6151 ;  input or output
                                   6152 ;------------------------
      009FDE                       6153 const_output:
      009FDE A6 04            [ 1] 6154 	ld a,#TK_INTGR 
      009FE0 AE 00 01         [ 2] 6155 	ldw x,#OUTP
      009FE3 81               [ 4] 6156 	ret 
      009FE4                       6157 const_input:
      009FE4 A6 04            [ 1] 6158 	ld a,#TK_INTGR 
      009FE6 AE 00 00         [ 2] 6159 	ldw x,#INP 
      009FE9 81               [ 4] 6160 	ret 
                                   6161 ;-----------------------
                                   6162 ; memory area constants
                                   6163 ;-----------------------
      009FEA                       6164 const_eeprom_base:
      009FEA A6 04            [ 1] 6165 	ld a,#TK_INTGR 
      009FEC AE 40 00         [ 2] 6166 	ldw x,#EEPROM_BASE 
      009FEF 81               [ 4] 6167 	ret 
                                   6168 
                                   6169 ;---------------------------
                                   6170 ; BASIC: DATA 
                                   6171 ; when the interpreter find 
                                   6172 ; a DATA line it skip it.
                                   6173 ;---------------------------
      009FF0                       6174 data:
      009FF0 55 00 04 00 02   [ 1] 6175 	mov in,count
      009FF5 81               [ 4] 6176 	ret 
                                   6177 
                                   6178 ;---------------------------
                                   6179 ; BASIC: DATLN  *expr*
                                   6180 ; set DATA pointer at line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                                   6181 ; specified by *expr* 
                                   6182 ;---------------------------
      009FF6                       6183 data_line:
      009FF6 CD 90 10         [ 4] 6184 	call expression
      009FF9 A1 04            [ 1] 6185 	cp a,#TK_INTGR
      009FFB 27 03            [ 1] 6186 	jreq 1$
      009FFD CC 87 81         [ 2] 6187 	jp syntax_error 
      00A000 CD 82 E8         [ 4] 6188 1$: call search_lineno
      00A003 5D               [ 2] 6189 	tnzw x 
      00A004 26 05            [ 1] 6190 	jrne 3$
      00A006 A6 05            [ 1] 6191 2$:	ld a,#ERR_NO_LINE 
      00A008 CC 87 83         [ 2] 6192 	jp tb_error
      00A00B                       6193 3$: ; check if valid data line 
      00A00B 90 93            [ 1] 6194     ldw y,x 
      00A00D EE 04            [ 2] 6195 	ldw x,(4,x)
      00A00F A3 9F F0         [ 2] 6196 	cpw x,#data 
      00A012 26 F2            [ 1] 6197 	jrne 2$ 
      00A014 90 CF 00 07      [ 2] 6198 	ldw data_ptr,y
      00A018 90 E6 02         [ 1] 6199 	ld a,(2,y)
      00A01B C7 00 0A         [ 1] 6200 	ld data_len,a 
      00A01E 35 06 00 09      [ 1] 6201 	mov data_ofs,#FIRST_DATA_ITEM 
      00A022 81               [ 4] 6202 	ret
                                   6203 
                                   6204 ;---------------------------------
                                   6205 ; BASIC: RESTORE 
                                   6206 ; set data_ptr to first data line
                                   6207 ; if not DATA found pointer set to
                                   6208 ; zero 
                                   6209 ;---------------------------------
      00A023                       6210 restore:
      00A023 72 5F 00 07      [ 1] 6211 	clr data_ptr 
      00A027 72 5F 00 08      [ 1] 6212 	clr data_ptr+1
      00A02B 72 5F 00 09      [ 1] 6213 	clr data_ofs 
      00A02F 72 5F 00 0A      [ 1] 6214 	clr data_len
      00A033 CE 00 1F         [ 2] 6215 	ldw x,txtbgn
      00A036                       6216 data_search_loop: 	
      00A036 C3 00 21         [ 2] 6217 	cpw x,txtend
      00A039 24 17            [ 1] 6218 	jruge 9$
      00A03B 90 93            [ 1] 6219 	ldw y,x 
      00A03D EE 04            [ 2] 6220 	ldw x,(4,x)
      00A03F A3 9F F0         [ 2] 6221 	cpw x,#data 
      00A042 26 1A            [ 1] 6222 	jrne try_next_line 
      00A044 90 CF 00 07      [ 2] 6223 	ldw data_ptr,y 
      00A048 90 E6 02         [ 1] 6224 	ld a,(2,y)
      00A04B C7 00 0A         [ 1] 6225 	ld data_len,a 
      00A04E 35 06 00 09      [ 1] 6226 	mov data_ofs,#FIRST_DATA_ITEM
      00A052 72 5D 00 0A      [ 1] 6227 9$:	tnz data_len 
      00A056 26 05            [ 1] 6228     jrne 10$
      00A058 A6 0C            [ 1] 6229 	ld a,#ERR_NO_DATA 
      00A05A CC 87 83         [ 2] 6230 	jp tb_error 
      00A05D 81               [ 4] 6231 10$:ret
      00A05E                       6232 try_next_line:
      00A05E 93               [ 1] 6233 	ldw x,y 
      00A05F E6 02            [ 1] 6234 	ld a,(2,x)
      00A061 C7 00 0E         [ 1] 6235 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      00A064 72 5F 00 0D      [ 1] 6236 	clr acc16 
      00A068 72 BB 00 0D      [ 2] 6237 	addw x,acc16 
      00A06C 20 C8            [ 2] 6238 	jra data_search_loop
                                   6239 
                                   6240 
                                   6241 ;---------------------------------
                                   6242 ; BASIC: READ 
                                   6243 ; return next data item | 0 
                                   6244 ;---------------------------------
                           000001  6245 	CTX_BPTR=1 
                           000003  6246 	CTX_IN=3 
                           000004  6247 	CTX_COUNT=4 
                           000005  6248 	XSAVE=5
                           000006  6249 	VSIZE=6
      00A06E                       6250 read:
      001FEE                       6251 	_vars  VSIZE 
      00A06E 52 06            [ 2]    1     sub sp,#VSIZE 
      00A070                       6252 read01:	
      00A070 C6 00 09         [ 1] 6253 	ld a,data_ofs
      00A073 C1 00 0A         [ 1] 6254 	cp a,data_len 
      00A076 27 37            [ 1] 6255 	jreq 2$ ; end of line  
      00A078 CD 94 42         [ 4] 6256 	call save_context
      00A07B CE 00 07         [ 2] 6257 	ldw x,data_ptr 
      00A07E CF 00 05         [ 2] 6258 	ldw basicptr,x 
      00A081 55 00 09 00 02   [ 1] 6259 	mov in,data_ofs 
      00A086 55 00 0A 00 04   [ 1] 6260 	mov count,data_len  
      00A08B CD 90 10         [ 4] 6261 	call expression 
      00A08E A1 04            [ 1] 6262 	cp a,#TK_INTGR 
      00A090 27 03            [ 1] 6263 	jreq 1$ 
      00A092 CC 87 81         [ 2] 6264 	jp syntax_error 
      00A095                       6265 1$:
      00A095 1F 05            [ 2] 6266 	ldw (XSAVE,SP),x
      00A097 CD 88 35         [ 4] 6267 	call next_token ; skip comma
      00A09A CE 00 05         [ 2] 6268 	ldw x,basicptr 
      00A09D CF 00 07         [ 2] 6269 	ldw data_ptr,x 
      00A0A0 55 00 02 00 09   [ 1] 6270 	mov data_ofs,in 
      00A0A5 CD 94 52         [ 4] 6271 	call rest_context
      00A0A8 1E 05            [ 2] 6272 	ldw x,(XSAVE,sp)
      00A0AA A6 04            [ 1] 6273 	ld a,#TK_INTGR
      00202C                       6274 	_drop VSIZE 
      00A0AC 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A0AE 81               [ 4] 6275 	ret 
      00A0AF                       6276 2$: ; end of line reached 
      00A0AF 90 CE 00 07      [ 2] 6277 	ldw y, data_ptr 
      00A0B3 72 5F 00 07      [ 1] 6278 	clr data_ptr
      00A0B7 72 5F 00 08      [ 1] 6279 	clr data_ptr+1   
      00A0BB 72 5F 00 09      [ 1] 6280 	clr data_ofs 
      00A0BF 72 5F 00 0A      [ 1] 6281 	clr data_len 
      00A0C3 CD A0 5E         [ 4] 6282 	call try_next_line 
      00A0C6 20 A8            [ 2] 6283 	jra read01
                                   6284 
                                   6285 
                                   6286 ;---------------------------------
                                   6287 ; BASIC: SPIEN clkdiv, 0|1  
                                   6288 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6289 ; if clkdiv==-1 disable SPI
                                   6290 ; 0|1 -> disable|enable  
                                   6291 ;--------------------------------- 
                           000005  6292 SPI_CS_BIT=5
      00A0C8                       6293 spi_enable:
      00A0C8 CD 8F 04         [ 4] 6294 	call arg_list 
      00A0CB A1 02            [ 1] 6295 	cp a,#2
      00A0CD 27 03            [ 1] 6296 	jreq 1$
      00A0CF CC 87 81         [ 2] 6297 	jp syntax_error 
      00A0D2                       6298 1$: 
      00A0D2 72 12 50 C7      [ 1] 6299 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A0D6 85               [ 2] 6300 	popw x  
      00A0D7 27 21            [ 1] 6301 	jreq spi_disable 
      00A0D9 85               [ 2] 6302 	popw x 
      00A0DA A6 08            [ 1] 6303 	ld a,#(1<<SPI_CR1_BR)
      00A0DC 42               [ 4] 6304 	mul x,a 
      00A0DD 9F               [ 1] 6305 	ld a,xl 
      00A0DE C7 52 00         [ 1] 6306 	ld SPI_CR1,a 
                                   6307 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A0E1 72 1A 50 14      [ 1] 6308 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A0E5 72 1A 50 16      [ 1] 6309 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   6310 ; configure SPI as master mode 0.	
      00A0E9 72 14 52 00      [ 1] 6311 	bset SPI_CR1,#SPI_CR1_MSTR
                                   6312 ; ~CS line controlled by sofware 	
      00A0ED 72 12 52 01      [ 1] 6313 	bset SPI_CR2,#SPI_CR2_SSM 
      00A0F1 72 10 52 01      [ 1] 6314     bset SPI_CR2,#SPI_CR2_SSI 
                                   6315 ; enable SPI
      00A0F5 72 1C 52 00      [ 1] 6316 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A0F9 81               [ 4] 6317 	ret 
      00A0FA                       6318 spi_disable:
      00207A                       6319 	_drop #2; throw first argument.
      00A0FA 5B 02            [ 2]    1     addw sp,##2 
                                   6320 ; wait spi idle 
      00A0FC A6 82            [ 1] 6321 1$:	ld a,#0x82 
      00A0FE C4 52 03         [ 1] 6322 	and a,SPI_SR
      00A101 A1 02            [ 1] 6323 	cp a,#2 
      00A103 26 F7            [ 1] 6324 	jrne 1$
      00A105 72 1D 52 00      [ 1] 6325 	bres SPI_CR1,#SPI_CR1_SPE
      00A109 72 13 50 C7      [ 1] 6326 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A10D 72 1B 50 16      [ 1] 6327 	bres PE_DDR,#SPI_CS_BIT 
      00A111 81               [ 4] 6328 	ret 
                                   6329 
      00A112                       6330 spi_clear_error:
      00A112 A6 78            [ 1] 6331 	ld a,#0x78 
      00A114 C5 52 03         [ 1] 6332 	bcp a,SPI_SR 
      00A117 27 04            [ 1] 6333 	jreq 1$
      00A119 72 5F 52 03      [ 1] 6334 	clr SPI_SR 
      00A11D 81               [ 4] 6335 1$: ret 
                                   6336 
      00A11E                       6337 spi_send_byte:
      00A11E 88               [ 1] 6338 	push a 
      00A11F CD A1 12         [ 4] 6339 	call spi_clear_error
      00A122 84               [ 1] 6340 	pop a 
      00A123 72 03 52 03 FB   [ 2] 6341 	btjf SPI_SR,#SPI_SR_TXE,.
      00A128 C7 52 04         [ 1] 6342 	ld SPI_DR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A12B 72 01 52 03 FB   [ 2] 6343 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A130 C6 52 04         [ 1] 6344 	ld a,SPI_DR 
      00A133 81               [ 4] 6345 	ret 
                                   6346 
      00A134                       6347 spi_rcv_byte:
      00A134 A6 FF            [ 1] 6348 	ld a,#255
      00A136 72 01 52 03 E3   [ 2] 6349 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A13B C6 52 04         [ 1] 6350 	ld a,SPI_DR 
      00A13E 81               [ 4] 6351 	ret
                                   6352 
                                   6353 ;------------------------------
                                   6354 ; BASIC: SPIWR byte [,byte]
                                   6355 ; write 1 or more byte
                                   6356 ;------------------------------
      00A13F                       6357 spi_write:
      00A13F CD 90 10         [ 4] 6358 	call expression
      00A142 A1 04            [ 1] 6359 	cp a,#TK_INTGR 
      00A144 27 03            [ 1] 6360 	jreq 1$
      00A146 CC 87 81         [ 2] 6361 	jp syntax_error 
      00A149                       6362 1$:	
      00A149 9F               [ 1] 6363 	ld a,xl 
      00A14A CD A1 1E         [ 4] 6364 	call spi_send_byte 
      00A14D CD 88 35         [ 4] 6365 	call next_token 
      00A150 A1 0D            [ 1] 6366 	cp a,#TK_COMMA 
      00A152 26 02            [ 1] 6367 	jrne 2$ 
      00A154 20 E9            [ 2] 6368 	jra spi_write 
      00A156 4D               [ 1] 6369 2$:	tnz a 
      00A157 27 05            [ 1] 6370 	jreq 3$
      0020D9                       6371 	_unget_token  
      00A159 55 00 03 00 02   [ 1]    1     mov in,in.saved
      00A15E 81               [ 4] 6372 3$:	ret 
                                   6373 
                                   6374 
                                   6375 ;-------------------------------
                                   6376 ; BASIC: SPIRD 	
                                   6377 ; read one byte from SPI 
                                   6378 ;-------------------------------
      00A15F                       6379 spi_read:
      00A15F CD A1 34         [ 4] 6380 	call spi_rcv_byte 
      00A162 5F               [ 1] 6381 	clrw x 
      00A163 97               [ 1] 6382 	ld xl,a 
      00A164 A6 04            [ 1] 6383 	ld a,#TK_INTGR 
      00A166 81               [ 4] 6384 	ret 
                                   6385 
                                   6386 ;------------------------------
                                   6387 ; BASIC: SPISEL 0|1 
                                   6388 ; set state of ~CS line
                                   6389 ; 0|1 deselect|select  
                                   6390 ;------------------------------
      00A167                       6391 spi_select:
      00A167 CD 88 35         [ 4] 6392 	call next_token 
      00A16A A1 04            [ 1] 6393 	cp a,#TK_INTGR 
      00A16C 27 03            [ 1] 6394 	jreq 1$
      00A16E CC 87 81         [ 2] 6395 	jp syntax_error 
      00A171 5D               [ 2] 6396 1$: tnzw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      00A172 27 05            [ 1] 6397 	jreq cs_high 
      00A174 72 1B 50 14      [ 1] 6398 	bres PE_ODR,#SPI_CS_BIT
      00A178 81               [ 4] 6399 	ret 
      00A179                       6400 cs_high: 
      00A179 72 1A 50 14      [ 1] 6401 	bset PE_ODR,#SPI_CS_BIT
      00A17D 81               [ 4] 6402 	ret 
                                   6403 
                                   6404 ;------------------------------
                                   6405 ;      dictionary 
                                   6406 ; format:
                                   6407 ;   link:   2 bytes 
                                   6408 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6409 ;   cmd_name: 16 byte max 
                                   6410 ;   code_address: 2 bytes 
                                   6411 ;------------------------------
                                   6412 	.macro _dict_entry len,name,cmd 
                                   6413 	.word LINK 
                                   6414 	LINK=.
                                   6415 name:
                                   6416 	.byte len 	
                                   6417 	.ascii "name"
                                   6418 	.word cmd 
                                   6419 	.endm 
                                   6420 
                           000000  6421 	LINK=0
                                   6422 ; respect alphabetic order for BASIC names from Z-A
                                   6423 ; this sort order is for a cleaner WORDS cmd output. 	
      00A17E                       6424 kword_end:
      0020FE                       6425 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A17E 00 00                    1 	.word LINK 
                           002100     2 	LINK=.
      00A180                          3 XPEEK:
      00A180 45                       4 	.byte 5+F_IFUNC 	
      00A181 58 50 45 45 4B           5 	.ascii "XPEEK"
      00A186 95 69                    6 	.word xpeek 
      002108                       6426 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A188 A1 80                    1 	.word LINK 
                           00210A     2 	LINK=.
      00A18A                          3 XOR:
      00A18A 43                       4 	.byte 3+F_IFUNC 	
      00A18B 58 4F 52                 5 	.ascii "XOR"
      00A18E 9D 37                    6 	.word bit_xor 
      002110                       6427 	_dict_entry,5,WRITE,write  
      00A190 A1 8A                    1 	.word LINK 
                           002112     2 	LINK=.
      00A192                          3 WRITE:
      00A192 05                       4 	.byte 5 	
      00A193 57 52 49 54 45           5 	.ascii "WRITE"
      00A198 9B 73                    6 	.word write 
      00211A                       6428 	_dict_entry,5,WORDS,words 
      00A19A A1 92                    1 	.word LINK 
                           00211C     2 	LINK=.
      00A19C                          3 WORDS:
      00A19C 05                       4 	.byte 5 	
      00A19D 57 4F 52 44 53           5 	.ascii "WORDS"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A1A2 9E 65                    6 	.word words 
      002124                       6429 	_dict_entry 4,WAIT,wait 
      00A1A4 A1 9C                    1 	.word LINK 
                           002126     2 	LINK=.
      00A1A6                          3 WAIT:
      00A1A6 04                       4 	.byte 4 	
      00A1A7 57 41 49 54              5 	.ascii "WAIT"
      00A1AB 94 CC                    6 	.word wait 
      00212D                       6430 	_dict_entry,3+F_IFUNC,USR,usr
      00A1AD A1 A6                    1 	.word LINK 
                           00212F     2 	LINK=.
      00A1AF                          3 USR:
      00A1AF 43                       4 	.byte 3+F_IFUNC 	
      00A1B0 55 53 52                 5 	.ascii "USR"
      00A1B3 9C 1F                    6 	.word usr 
      002135                       6431 	_dict_entry,5,UNTIL,until 
      00A1B5 A1 AF                    1 	.word LINK 
                           002137     2 	LINK=.
      00A1B7                          3 UNTIL:
      00A1B7 05                       4 	.byte 5 	
      00A1B8 55 4E 54 49 4C           5 	.ascii "UNTIL"
      00A1BD 9F 5C                    6 	.word until 
      00213F                       6432 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A1BF A1 B7                    1 	.word LINK 
                           002141     2 	LINK=.
      00A1C1                          3 UFLASH:
      00A1C1 46                       4 	.byte 6+F_IFUNC 	
      00A1C2 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A1C8 9C 19                    6 	.word uflash 
      00214A                       6433 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A1CA A1 C1                    1 	.word LINK 
                           00214C     2 	LINK=.
      00A1CC                          3 UBOUND:
      00A1CC 46                       4 	.byte 6+F_IFUNC 	
      00A1CD 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A1D3 91 61                    6 	.word ubound 
      002155                       6434 	_dict_entry,4,TONE,tone  
      00A1D5 A1 CC                    1 	.word LINK 
                           002157     2 	LINK=.
      00A1D7                          3 TONE:
      00A1D7 04                       4 	.byte 4 	
      00A1D8 54 4F 4E 45              5 	.ascii "TONE"
      00A1DC 97 30                    6 	.word tone 
      00215E                       6435 	_dict_entry,2,TO,to
      00A1DE A1 D7                    1 	.word LINK 
                           002160     2 	LINK=.
      00A1E0                          3 TO:
      00A1E0 02                       4 	.byte 2 	
      00A1E1 54 4F                    5 	.ascii "TO"
      00A1E3 95 C2                    6 	.word to 
      002165                       6436 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A1E5 A1 E0                    1 	.word LINK 
                           002167     2 	LINK=.
      00A1E7                          3 TIMEOUT:
      00A1E7 47                       4 	.byte 7+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A1E8 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A1EF 9E AE                    6 	.word timeout 
      002171                       6437 	_dict_entry,5,TIMER,set_timer
      00A1F1 A1 E7                    1 	.word LINK 
                           002173     2 	LINK=.
      00A1F3                          3 TIMER:
      00A1F3 05                       4 	.byte 5 	
      00A1F4 54 49 4D 45 52           5 	.ascii "TIMER"
      00A1F9 9E 9F                    6 	.word set_timer 
      00217B                       6438 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A1FB A1 F3                    1 	.word LINK 
                           00217D     2 	LINK=.
      00A1FD                          3 TICKS:
      00A1FD 45                       4 	.byte 5+F_IFUNC 	
      00A1FE 54 49 43 4B 53           5 	.ascii "TICKS"
      00A203 9C ED                    6 	.word get_ticks 
      002185                       6439 	_dict_entry,4,STOP,stop 
      00A205 A1 FD                    1 	.word LINK 
                           002187     2 	LINK=.
      00A207                          3 STOP:
      00A207 04                       4 	.byte 4 	
      00A208 53 54 4F 50              5 	.ascii "STOP"
      00A20C 98 54                    6 	.word stop 
      00218E                       6440 	_dict_entry,4,STEP,step 
      00A20E A2 07                    1 	.word LINK 
                           002190     2 	LINK=.
      00A210                          3 STEP:
      00A210 04                       4 	.byte 4 	
      00A211 53 54 45 50              5 	.ascii "STEP"
      00A215 95 F2                    6 	.word step 
      002197                       6441 	_dict_entry,5,SPIWR,spi_write
      00A217 A2 10                    1 	.word LINK 
                           002199     2 	LINK=.
      00A219                          3 SPIWR:
      00A219 05                       4 	.byte 5 	
      00A21A 53 50 49 57 52           5 	.ascii "SPIWR"
      00A21F A1 3F                    6 	.word spi_write 
      0021A1                       6442 	_dict_entry,6,SPISEL,spi_select
      00A221 A2 19                    1 	.word LINK 
                           0021A3     2 	LINK=.
      00A223                          3 SPISEL:
      00A223 06                       4 	.byte 6 	
      00A224 53 50 49 53 45 4C        5 	.ascii "SPISEL"
      00A22A A1 67                    6 	.word spi_select 
      0021AC                       6443 	_dict_entry,5,SPIEN,spi_enable 
      00A22C A2 23                    1 	.word LINK 
                           0021AE     2 	LINK=.
      00A22E                          3 SPIEN:
      00A22E 05                       4 	.byte 5 	
      00A22F 53 50 49 45 4E           5 	.ascii "SPIEN"
      00A234 A0 C8                    6 	.word spi_enable 
      0021B6                       6444 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A236 A2 2E                    1 	.word LINK 
                           0021B8     2 	LINK=.
      00A238                          3 SPIRD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      00A238 45                       4 	.byte 5+F_IFUNC 	
      00A239 53 50 49 52 44           5 	.ascii "SPIRD"
      00A23E A1 5F                    6 	.word spi_read 
      0021C0                       6445 	_dict_entry,5,SLEEP,sleep 
      00A240 A2 38                    1 	.word LINK 
                           0021C2     2 	LINK=.
      00A242                          3 SLEEP:
      00A242 05                       4 	.byte 5 	
      00A243 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A248 9C 86                    6 	.word sleep 
      0021CA                       6446 	_dict_entry,4+F_IFUNC,SIZE,size
      00A24A A2 42                    1 	.word LINK 
                           0021CC     2 	LINK=.
      00A24C                          3 SIZE:
      00A24C 44                       4 	.byte 4+F_IFUNC 	
      00A24D 53 49 5A 45              5 	.ascii "SIZE"
      00A251 91 57                    6 	.word size 
      0021D3                       6447     _dict_entry,4,SHOW,show 
      00A253 A2 4C                    1 	.word LINK 
                           0021D5     2 	LINK=.
      00A255                          3 SHOW:
      00A255 04                       4 	.byte 4 	
      00A256 53 48 4F 57              5 	.ascii "SHOW"
      00A25A 90 AB                    6 	.word show 
      0021DC                       6448 	_dict_entry,4,SAVE,save
      00A25C A2 55                    1 	.word LINK 
                           0021DE     2 	LINK=.
      00A25E                          3 SAVE:
      00A25E 04                       4 	.byte 4 	
      00A25F 53 41 56 45              5 	.ascii "SAVE"
      00A263 99 62                    6 	.word save 
      0021E5                       6449 	_dict_entry 3,RUN,run
      00A265 A2 5E                    1 	.word LINK 
                           0021E7     2 	LINK=.
      00A267                          3 RUN:
      00A267 03                       4 	.byte 3 	
      00A268 52 55 4E                 5 	.ascii "RUN"
      00A26B 96 D2                    6 	.word run 
      0021ED                       6450 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A26D A2 67                    1 	.word LINK 
                           0021EF     2 	LINK=.
      00A26F                          3 RSHIFT:
      00A26F 46                       4 	.byte 6+F_IFUNC 	
      00A270 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A276 9D 68                    6 	.word rshift 
      0021F8                       6451 	_dict_entry,3+F_IFUNC,RND,random 
      00A278 A2 6F                    1 	.word LINK 
                           0021FA     2 	LINK=.
      00A27A                          3 RND:
      00A27A 43                       4 	.byte 3+F_IFUNC 	
      00A27B 52 4E 44                 5 	.ascii "RND"
      00A27E 9D FE                    6 	.word random 
      002200                       6452 	_dict_entry,6,RETURN,return 
      00A280 A2 7A                    1 	.word LINK 
                           002202     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A282                          3 RETURN:
      00A282 06                       4 	.byte 6 	
      00A283 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A289 96 B4                    6 	.word return 
      00220B                       6453 	_dict_entry,7,RESTORE,restore 
      00A28B A2 82                    1 	.word LINK 
                           00220D     2 	LINK=.
      00A28D                          3 RESTORE:
      00A28D 07                       4 	.byte 7 	
      00A28E 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A295 A0 23                    6 	.word restore 
      002217                       6454 	_dict_entry 6,REMARK,rem 
      00A297 A2 8D                    1 	.word LINK 
                           002219     2 	LINK=.
      00A299                          3 REMARK:
      00A299 06                       4 	.byte 6 	
      00A29A 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A2A0 94 C6                    6 	.word rem 
      002222                       6455 	_dict_entry,6,REBOOT,cold_start
      00A2A2 A2 99                    1 	.word LINK 
                           002224     2 	LINK=.
      00A2A4                          3 REBOOT:
      00A2A4 06                       4 	.byte 6 	
      00A2A5 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A2AB 85 54                    6 	.word cold_start 
      00222D                       6456 	_dict_entry,4+F_IFUNC,READ,read  
      00A2AD A2 A4                    1 	.word LINK 
                           00222F     2 	LINK=.
      00A2AF                          3 READ:
      00A2AF 44                       4 	.byte 4+F_IFUNC 	
      00A2B0 52 45 41 44              5 	.ascii "READ"
      00A2B4 A0 6E                    6 	.word read 
      002236                       6457 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A2B6 A2 AF                    1 	.word LINK 
                           002238     2 	LINK=.
      00A2B8                          3 QKEY:
      00A2B8 44                       4 	.byte 4+F_IFUNC 	
      00A2B9 51 4B 45 59              5 	.ascii "QKEY"
      00A2BD 9B E4                    6 	.word qkey 
      00223F                       6458 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A2BF A2 B8                    1 	.word LINK 
                           002241     2 	LINK=.
      00A2C1                          3 PRTI:
      00A2C1 44                       4 	.byte 4+F_IFUNC 	
      00A2C2 50 52 54 49              5 	.ascii "PRTI"
      00A2C6 9F BA                    6 	.word const_porti 
      002248                       6459 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A2C8 A2 C1                    1 	.word LINK 
                           00224A     2 	LINK=.
      00A2CA                          3 PRTH:
      00A2CA 44                       4 	.byte 4+F_IFUNC 	
      00A2CB 50 52 54 48              5 	.ascii "PRTH"
      00A2CF 9F B4                    6 	.word const_porth 
      002251                       6460 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A2D1 A2 CA                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



                           002253     2 	LINK=.
      00A2D3                          3 PRTG:
      00A2D3 44                       4 	.byte 4+F_IFUNC 	
      00A2D4 50 52 54 47              5 	.ascii "PRTG"
      00A2D8 9F AE                    6 	.word const_portg 
      00225A                       6461 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A2DA A2 D3                    1 	.word LINK 
                           00225C     2 	LINK=.
      00A2DC                          3 PRTF:
      00A2DC 44                       4 	.byte 4+F_IFUNC 	
      00A2DD 50 52 54 46              5 	.ascii "PRTF"
      00A2E1 9F A8                    6 	.word const_portf 
      002263                       6462 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A2E3 A2 DC                    1 	.word LINK 
                           002265     2 	LINK=.
      00A2E5                          3 PRTE:
      00A2E5 44                       4 	.byte 4+F_IFUNC 	
      00A2E6 50 52 54 45              5 	.ascii "PRTE"
      00A2EA 9F A2                    6 	.word const_porte 
      00226C                       6463 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A2EC A2 E5                    1 	.word LINK 
                           00226E     2 	LINK=.
      00A2EE                          3 PRTD:
      00A2EE 44                       4 	.byte 4+F_IFUNC 	
      00A2EF 50 52 54 44              5 	.ascii "PRTD"
      00A2F3 9F 9C                    6 	.word const_portd 
      002275                       6464 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A2F5 A2 EE                    1 	.word LINK 
                           002277     2 	LINK=.
      00A2F7                          3 PRTC:
      00A2F7 44                       4 	.byte 4+F_IFUNC 	
      00A2F8 50 52 54 43              5 	.ascii "PRTC"
      00A2FC 9F 96                    6 	.word const_portc 
      00227E                       6465 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A2FE A2 F7                    1 	.word LINK 
                           002280     2 	LINK=.
      00A300                          3 PRTB:
      00A300 44                       4 	.byte 4+F_IFUNC 	
      00A301 50 52 54 42              5 	.ascii "PRTB"
      00A305 9F 90                    6 	.word const_portb 
      002287                       6466 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A307 A3 00                    1 	.word LINK 
                           002289     2 	LINK=.
      00A309                          3 PRTA:
      00A309 44                       4 	.byte 4+F_IFUNC 	
      00A30A 50 52 54 41              5 	.ascii "PRTA"
      00A30E 9F 8A                    6 	.word const_porta 
      002290                       6467 	_dict_entry 5,PRINT,print 
      00A310 A3 09                    1 	.word LINK 
                           002292     2 	LINK=.
      00A312                          3 PRINT:
      00A312 05                       4 	.byte 5 	
      00A313 50 52 49 4E 54           5 	.ascii "PRINT"
      00A318 93 D8                    6 	.word print 
      00229A                       6468 	_dict_entry,4+F_IFUNC,POUT,const_output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00A31A A3 12                    1 	.word LINK 
                           00229C     2 	LINK=.
      00A31C                          3 POUT:
      00A31C 44                       4 	.byte 4+F_IFUNC 	
      00A31D 50 4F 55 54              5 	.ascii "POUT"
      00A321 9F DE                    6 	.word const_output 
      0022A3                       6469 	_dict_entry,4,POKE,poke 
      00A323 A3 1C                    1 	.word LINK 
                           0022A5     2 	LINK=.
      00A325                          3 POKE:
      00A325 04                       4 	.byte 4 	
      00A326 50 4F 4B 45              5 	.ascii "POKE"
      00A32A 95 49                    6 	.word poke 
      0022AC                       6470 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A32C A3 25                    1 	.word LINK 
                           0022AE     2 	LINK=.
      00A32E                          3 PINP:
      00A32E 44                       4 	.byte 4+F_IFUNC 	
      00A32F 50 49 4E 50              5 	.ascii "PINP"
      00A333 9F E4                    6 	.word const_input 
      0022B5                       6471 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A335 A3 2E                    1 	.word LINK 
                           0022B7     2 	LINK=.
      00A337                          3 PEEK:
      00A337 44                       4 	.byte 4+F_IFUNC 	
      00A338 50 45 45 4B              5 	.ascii "PEEK"
      00A33C 95 58                    6 	.word peek 
      0022BE                       6472 	_dict_entry,5,PMODE,pin_mode 
      00A33E A3 37                    1 	.word LINK 
                           0022C0     2 	LINK=.
      00A340                          3 PMODE:
      00A340 05                       4 	.byte 5 	
      00A341 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A346 9D 8D                    6 	.word pin_mode 
      0022C8                       6473 	_dict_entry,5,PAUSE,pause 
      00A348 A3 40                    1 	.word LINK 
                           0022CA     2 	LINK=.
      00A34A                          3 PAUSE:
      00A34A 05                       4 	.byte 5 	
      00A34B 50 41 55 53 45           5 	.ascii "PAUSE"
      00A350 9C 91                    6 	.word pause 
      0022D2                       6474 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A352 A3 4A                    1 	.word LINK 
                           0022D4     2 	LINK=.
      00A354                          3 OR:
      00A354 42                       4 	.byte 2+F_IFUNC 	
      00A355 4F 52                    5 	.ascii "OR"
      00A357 9D 1F                    6 	.word bit_or 
      0022D9                       6475 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A359 A3 54                    1 	.word LINK 
                           0022DB     2 	LINK=.
      00A35B                          3 ODR:
      00A35B 43                       4 	.byte 3+F_IFUNC 	
      00A35C 4F 44 52                 5 	.ascii "ODR"
      00A35F 9F C0                    6 	.word const_odr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0022E1                       6476 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A361 A3 5B                    1 	.word LINK 
                           0022E3     2 	LINK=.
      00A363                          3 NOT:
      00A363 43                       4 	.byte 3+F_IFUNC 	
      00A364 4E 4F 54                 5 	.ascii "NOT"
      00A367 9E BB                    6 	.word func_not 
      0022E9                       6477 	_dict_entry,3,NEW,new
      00A369 A3 63                    1 	.word LINK 
                           0022EB     2 	LINK=.
      00A36B                          3 NEW:
      00A36B 03                       4 	.byte 3 	
      00A36C 4E 45 57                 5 	.ascii "NEW"
      00A36F 98 A0                    6 	.word new 
      0022F1                       6478 	_dict_entry,4,NEXT,next 
      00A371 A3 6B                    1 	.word LINK 
                           0022F3     2 	LINK=.
      00A373                          3 NEXT:
      00A373 04                       4 	.byte 4 	
      00A374 4E 45 58 54              5 	.ascii "NEXT"
      00A378 96 19                    6 	.word next 
      0022FA                       6479 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A37A A3 73                    1 	.word LINK 
                           0022FC     2 	LINK=.
      00A37C                          3 LSHIFT:
      00A37C 46                       4 	.byte 6+F_IFUNC 	
      00A37D 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A383 9D 4F                    6 	.word lshift 
      002305                       6480 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A385 A3 7C                    1 	.word LINK 
                           002307     2 	LINK=.
      00A387                          3 LOG:
      00A387 43                       4 	.byte 3+F_IFUNC 	
      00A388 4C 4F 47                 5 	.ascii "LOG"
      00A38B 9F 03                    6 	.word log2 
      00230D                       6481 	_dict_entry,4,LOAD,load 
      00A38D A3 87                    1 	.word LINK 
                           00230F     2 	LINK=.
      00A38F                          3 LOAD:
      00A38F 04                       4 	.byte 4 	
      00A390 4C 4F 41 44              5 	.ascii "LOAD"
      00A394 9A 57                    6 	.word load 
      002316                       6482 	_dict_entry 4,LIST,list
      00A396 A3 8F                    1 	.word LINK 
                           002318     2 	LINK=.
      00A398                          3 LIST:
      00A398 04                       4 	.byte 4 	
      00A399 4C 49 53 54              5 	.ascii "LIST"
      00A39D 91 A7                    6 	.word list 
      00231F                       6483 	_dict_entry 3,LET,let 
      00A39F A3 98                    1 	.word LINK 
                           002321     2 	LINK=.
      00A3A1                          3 LET:
      00A3A1 03                       4 	.byte 3 	
      00A3A2 4C 45 54                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A3A5 91 83                    6 	.word let 
      002327                       6484 	_dict_entry,3+F_IFUNC,KEY,key 
      00A3A7 A3 A1                    1 	.word LINK 
                           002329     2 	LINK=.
      00A3A9                          3 KEY:
      00A3A9 43                       4 	.byte 3+F_IFUNC 	
      00A3AA 4B 45 59                 5 	.ascii "KEY"
      00A3AD 9B DC                    6 	.word key 
      00232F                       6485 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A3AF A3 A9                    1 	.word LINK 
                           002331     2 	LINK=.
      00A3B1                          3 IWDGREF:
      00A3B1 07                       4 	.byte 7 	
      00A3B2 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00A3B9 9E FE                    6 	.word refresh_iwdg 
      00233B                       6486 	_dict_entry,6,IWDGEN,enable_iwdg
      00A3BB A3 B1                    1 	.word LINK 
                           00233D     2 	LINK=.
      00A3BD                          3 IWDGEN:
      00A3BD 06                       4 	.byte 6 	
      00A3BE 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      00A3C4 9E C8                    6 	.word enable_iwdg 
      002346                       6487 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A3C6 A3 BD                    1 	.word LINK 
                           002348     2 	LINK=.
      00A3C8                          3 INVERT:
      00A3C8 46                       4 	.byte 6+F_IFUNC 	
      00A3C9 49 4E 56 45 52 54        5 	.ascii "INVERT"
      00A3CF 9F 38                    6 	.word invert 
      002351                       6488 	_dict_entry,5,INPUT,input_var  
      00A3D1 A3 C8                    1 	.word LINK 
                           002353     2 	LINK=.
      00A3D3                          3 INPUT:
      00A3D3 05                       4 	.byte 5 	
      00A3D4 49 4E 50 55 54           5 	.ascii "INPUT"
      00A3D9 94 62                    6 	.word input_var 
      00235B                       6489 	_dict_entry,2,IF,if 
      00A3DB A3 D3                    1 	.word LINK 
                           00235D     2 	LINK=.
      00A3DD                          3 IF:
      00A3DD 02                       4 	.byte 2 	
      00A3DE 49 46                    5 	.ascii "IF"
      00A3E0 95 85                    6 	.word if 
      002362                       6490 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A3E2 A3 DD                    1 	.word LINK 
                           002364     2 	LINK=.
      00A3E4                          3 IDR:
      00A3E4 43                       4 	.byte 3+F_IFUNC 	
      00A3E5 49 44 52                 5 	.ascii "IDR"
      00A3E8 9F C6                    6 	.word const_idr 
      00236A                       6491 	_dict_entry,3,HEX,hex_base
      00A3EA A3 E4                    1 	.word LINK 
                           00236C     2 	LINK=.
      00A3EC                          3 HEX:
      00A3EC 03                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A3ED 48 45 58                 5 	.ascii "HEX"
      00A3F0 91 4D                    6 	.word hex_base 
      002372                       6492 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A3F2 A3 EC                    1 	.word LINK 
                           002374     2 	LINK=.
      00A3F4                          3 GPIO:
      00A3F4 44                       4 	.byte 4+F_IFUNC 	
      00A3F5 47 50 49 4F              5 	.ascii "GPIO"
      00A3F9 9B EF                    6 	.word gpio 
      00237B                       6493 	_dict_entry,4,GOTO,goto 
      00A3FB A3 F4                    1 	.word LINK 
                           00237D     2 	LINK=.
      00A3FD                          3 GOTO:
      00A3FD 04                       4 	.byte 4 	
      00A3FE 47 4F 54 4F              5 	.ascii "GOTO"
      00A402 96 79                    6 	.word goto 
      002384                       6494 	_dict_entry,5,GOSUB,gosub 
      00A404 A3 FD                    1 	.word LINK 
                           002386     2 	LINK=.
      00A406                          3 GOSUB:
      00A406 05                       4 	.byte 5 	
      00A407 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A40C 96 94                    6 	.word gosub 
      00238E                       6495 	_dict_entry,6,FORGET,forget 
      00A40E A4 06                    1 	.word LINK 
                           002390     2 	LINK=.
      00A410                          3 FORGET:
      00A410 06                       4 	.byte 6 	
      00A411 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A417 9A 92                    6 	.word forget 
      002399                       6496 	_dict_entry,3,FOR,for 
      00A419 A4 10                    1 	.word LINK 
                           00239B     2 	LINK=.
      00A41B                          3 FOR:
      00A41B 03                       4 	.byte 3 	
      00A41C 46 4F 52                 5 	.ascii "FOR"
      00A41F 95 99                    6 	.word for 
      0023A1                       6497 	_dict_entry,4,FCPU,fcpu 
      00A421 A4 1B                    1 	.word LINK 
                           0023A3     2 	LINK=.
      00A423                          3 FCPU:
      00A423 04                       4 	.byte 4 	
      00A424 46 43 50 55              5 	.ascii "FCPU"
      00A428 9D 81                    6 	.word fcpu 
      0023AA                       6498 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A42A A4 23                    1 	.word LINK 
                           0023AC     2 	LINK=.
      00A42C                          3 EEPROM:
      00A42C 46                       4 	.byte 6+F_IFUNC 	
      00A42D 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A433 9F EA                    6 	.word const_eeprom_base 
      0023B5                       6499 	_dict_entry,3,END,cmd_end  
      00A435 A4 2C                    1 	.word LINK 
                           0023B7     2 	LINK=.
      00A437                          3 END:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00A437 03                       4 	.byte 3 	
      00A438 45 4E 44                 5 	.ascii "END"
      00A43B 97 21                    6 	.word cmd_end 
      0023BD                       6500 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A43D A4 37                    1 	.word LINK 
                           0023BF     2 	LINK=.
      00A43F                          3 DWRITE:
      00A43F 06                       4 	.byte 6+F_CMD 	
      00A440 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00A446 98 19                    6 	.word digital_write 
      0023C8                       6501 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A448 A4 3F                    1 	.word LINK 
                           0023CA     2 	LINK=.
      00A44A                          3 DREAD:
      00A44A 45                       4 	.byte 5+F_IFUNC 	
      00A44B 44 52 45 41 44           5 	.ascii "DREAD"
      00A450 97 E9                    6 	.word digital_read 
      0023D2                       6502 	_dict_entry,2,DO,do_loop
      00A452 A4 4A                    1 	.word LINK 
                           0023D4     2 	LINK=.
      00A454                          3 DO:
      00A454 02                       4 	.byte 2 	
      00A455 44 4F                    5 	.ascii "DO"
      00A457 9F 47                    6 	.word do_loop 
      0023D9                       6503 	_dict_entry,3,DIR,directory 
      00A459 A4 54                    1 	.word LINK 
                           0023DB     2 	LINK=.
      00A45B                          3 DIR:
      00A45B 03                       4 	.byte 3 	
      00A45C 44 49 52                 5 	.ascii "DIR"
      00A45F 9A DD                    6 	.word directory 
      0023E1                       6504 	_dict_entry,3,DEC,dec_base
      00A461 A4 5B                    1 	.word LINK 
                           0023E3     2 	LINK=.
      00A463                          3 DEC:
      00A463 03                       4 	.byte 3 	
      00A464 44 45 43                 5 	.ascii "DEC"
      00A467 91 52                    6 	.word dec_base 
      0023E9                       6505 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A469 A4 63                    1 	.word LINK 
                           0023EB     2 	LINK=.
      00A46B                          3 DDR:
      00A46B 43                       4 	.byte 3+F_IFUNC 	
      00A46C 44 44 52                 5 	.ascii "DDR"
      00A46F 9F CC                    6 	.word const_ddr 
      0023F1                       6506 	_dict_entry,6,DATALN,data_line  
      00A471 A4 6B                    1 	.word LINK 
                           0023F3     2 	LINK=.
      00A473                          3 DATALN:
      00A473 06                       4 	.byte 6 	
      00A474 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      00A47A 9F F6                    6 	.word data_line 
      0023FC                       6507 	_dict_entry,4,DATA,data  
      00A47C A4 73                    1 	.word LINK 
                           0023FE     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A47E                          3 DATA:
      00A47E 04                       4 	.byte 4 	
      00A47F 44 41 54 41              5 	.ascii "DATA"
      00A483 9F F0                    6 	.word data 
      002405                       6508 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A485 A4 7E                    1 	.word LINK 
                           002407     2 	LINK=.
      00A487                          3 CRL:
      00A487 43                       4 	.byte 3+F_IFUNC 	
      00A488 43 52 4C                 5 	.ascii "CRL"
      00A48B 9F D2                    6 	.word const_cr1 
      00240D                       6509 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A48D A4 87                    1 	.word LINK 
                           00240F     2 	LINK=.
      00A48F                          3 CRH:
      00A48F 43                       4 	.byte 3+F_IFUNC 	
      00A490 43 52 48                 5 	.ascii "CRH"
      00A493 9F D8                    6 	.word const_cr2 
      002415                       6510 	_dict_entry,4+F_CFUNC,CHAR,char
      00A495 A4 8F                    1 	.word LINK 
                           002417     2 	LINK=.
      00A497                          3 CHAR:
      00A497 84                       4 	.byte 4+F_CFUNC 	
      00A498 43 48 41 52              5 	.ascii "CHAR"
      00A49C 9B AA                    6 	.word char 
      00241E                       6511 	_dict_entry,3,BYE,bye 
      00A49E A4 97                    1 	.word LINK 
                           002420     2 	LINK=.
      00A4A0                          3 BYE:
      00A4A0 03                       4 	.byte 3 	
      00A4A1 42 59 45                 5 	.ascii "BYE"
      00A4A4 9C 3C                    6 	.word bye 
      002426                       6512 	_dict_entry,5,BTOGL,bit_toggle
      00A4A6 A4 A0                    1 	.word LINK 
                           002428     2 	LINK=.
      00A4A8                          3 BTOGL:
      00A4A8 05                       4 	.byte 5 	
      00A4A9 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A4AE 95 12                    6 	.word bit_toggle 
      002430                       6513 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A4B0 A4 A8                    1 	.word LINK 
                           002432     2 	LINK=.
      00A4B2                          3 BTEST:
      00A4B2 45                       4 	.byte 5+F_IFUNC 	
      00A4B3 42 54 45 53 54           5 	.ascii "BTEST"
      00A4B8 95 22                    6 	.word bit_test 
      00243A                       6514 	_dict_entry,4,BSET,bit_set 
      00A4BA A4 B2                    1 	.word LINK 
                           00243C     2 	LINK=.
      00A4BC                          3 BSET:
      00A4BC 04                       4 	.byte 4 	
      00A4BD 42 53 45 54              5 	.ascii "BSET"
      00A4C1 94 F1                    6 	.word bit_set 
      002443                       6515 	_dict_entry,4,BRES,bit_reset
      00A4C3 A4 BC                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                           002445     2 	LINK=.
      00A4C5                          3 BRES:
      00A4C5 04                       4 	.byte 4 	
      00A4C6 42 52 45 53              5 	.ascii "BRES"
      00A4CA 95 01                    6 	.word bit_reset 
      00244C                       6516 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A4CC A4 C5                    1 	.word LINK 
                           00244E     2 	LINK=.
      00A4CE                          3 BIT:
      00A4CE 43                       4 	.byte 3+F_IFUNC 	
      00A4CF 42 49 54                 5 	.ascii "BIT"
      00A4D2 9F 1E                    6 	.word bitmask 
      002454                       6517 	_dict_entry,3,AWU,awu 
      00A4D4 A4 CE                    1 	.word LINK 
                           002456     2 	LINK=.
      00A4D6                          3 AWU:
      00A4D6 03                       4 	.byte 3 	
      00A4D7 41 57 55                 5 	.ascii "AWU"
      00A4DA 9C A4                    6 	.word awu 
      00245C                       6518 	_dict_entry,7,AUTORUN,autorun
      00A4DC A4 D6                    1 	.word LINK 
                           00245E     2 	LINK=.
      00A4DE                          3 AUTORUN:
      00A4DE 07                       4 	.byte 7 	
      00A4DF 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A4E6 9C 45                    6 	.word autorun 
      002468                       6519 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A4E8 A4 DE                    1 	.word LINK 
                           00246A     2 	LINK=.
      00A4EA                          3 ASC:
      00A4EA 43                       4 	.byte 3+F_IFUNC 	
      00A4EB 41 53 43                 5 	.ascii "ASC"
      00A4EE 9B BC                    6 	.word ascii 
      002470                       6520 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A4F0 A4 EA                    1 	.word LINK 
                           002472     2 	LINK=.
      00A4F2                          3 AND:
      00A4F2 43                       4 	.byte 3+F_IFUNC 	
      00A4F3 41 4E 44                 5 	.ascii "AND"
      00A4F6 9D 07                    6 	.word bit_and 
      002478                       6521 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A4F8 A4 F2                    1 	.word LINK 
                           00247A     2 	LINK=.
      00A4FA                          3 ADCREAD:
      00A4FA 47                       4 	.byte 7+F_IFUNC 	
      00A4FB 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A502 97 B5                    6 	.word analog_read 
      002484                       6522 	_dict_entry,5,ADCON,power_adc 
      00A504 A4 FA                    1 	.word LINK 
                           002486     2 	LINK=.
      00A506                          3 ADCON:
      00A506 05                       4 	.byte 5 	
      00A507 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A50C 97 79                    6 	.word power_adc 
      00A50E                       6523 kword_dict:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00248E                       6524 	_dict_entry,3+F_IFUNC,ABS,abs
      00A50E A5 06                    1 	.word LINK 
                           002490     2 	LINK=.
      00A510                          3 ABS:
      00A510 43                       4 	.byte 3+F_IFUNC 	
      00A511 41 42 53                 5 	.ascii "ABS"
      00A514 9C F3                    6 	.word abs 
                                   6525 	
                                   6526 
      00A580                       6527 	.bndry 128 ; align on FLASH block.
                                   6528 ; free space for user application  
      00A580                       6529 user_space:
                                   6530 ; USR() function test
      00A580 89               [ 2] 6531 	pushw x 
      00A581 72 1A 50 0A      [ 1] 6532 	bset PC_ODR,#5 
      00A585 85               [ 2] 6533 	popw x 
      00A586 CD 9C 9B         [ 4] 6534 	call pause02 
      00A589 72 1B 50 0A      [ 1] 6535 	bres PC_ODR,#5 
      00A58D 81               [ 4] 6536 	ret
                                   6537 
                                   6538 	.area FLASH_DRIVE (ABS)
      010000                       6539 	.org 0x10000
      010000                       6540 fdrive:
                                   6541 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002490 R   |   5 ADCON      002486 R
  5 ADCREAD    00247A R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDR    =  000001 
    ADD_SPAC=  000003     |     ADR     =  000002     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002472 R
    ARG_OFS =  000002     |   5 ASC        00246A R   |     ATTRIB  =  000002 
  5 AUTORUN    00245E R   |     AUTORUN_=  004000     |   5 AWU        002456 R
  5 AWUHandl   000001 R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   5 BIT        00244E R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000B     |   5 BRES       002445 R
    BSAVE   =  000002     |   5 BSET       00243C R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      002432 R   |   5 BTOGL      002428 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        002420 R
    C       =  000001     |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
  5 CHAR       002417 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]

Symbol Table

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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        00240F R
  5 CRL        002407 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  5 DATA       0023FE R   |   5 DATALN     0023F3 R   |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
  5 DDR        0023EB R   |     DEBUG   =  000000     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        0023E3 R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0023DB R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DIVSOR  =  000001 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   5 DO         0023D4 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |   5 DREAD      0023CA R
  5 DWRITE     0023BF R   |   5 EEPROM     0023AC R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |   5 END        0023B7 R
    EOF     =  0000FF     |     ERR_BAD_=  00000A     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       0023A3 R   |     FF      =  00000C 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FIRST_DA=  000006     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

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
  5 FOR        00239B R   |   5 FORGET     002390 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   5 GOSUB      002386 R
  5 GOTO       00237D R   |   5 GPIO       002374 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        00236C R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002364 R
  5 IF         00235D R   |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002353 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_PU=  000001 
    INT_ADC2=  000016     |     INT_AUAR=  000012     |     INT_AWU =  000001 
    INT_CAN_=  000008     |     INT_CAN_=  000009     |     INT_CLK =  000002 
    INT_EXTI=  000003     |     INT_EXTI=  000004     |     INT_EXTI=  000005 
    INT_EXTI=  000006     |     INT_EXTI=  000007     |     INT_FLAS=  000018 
    INT_I2C =  000013     |     INT_SPI =  00000A     |     INT_TIM1=  00000C 
    INT_TIM1=  00000B     |     INT_TIM2=  00000E     |     INT_TIM2=  00000D 
    INT_TIM3=  000010     |     INT_TIM3=  00000F     |     INT_TIM4=  000017 
    INT_TLI =  000000     |     INT_UART=  000011     |     INT_UART=  000015 
    INT_UART=  000014     |     INT_VECT=  008060     |     INT_VECT=  00800C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |   5 INVERT     002348 R   |     INW     =  000009 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |   5 IWDGEN     00233D R
  5 IWDGREF    002331 R   |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002329 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002321 R
    LIMIT   =  000005     |     LINENO  =  000005     |   5 LINK    =  002490 R
  5 LIST       002318 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       00230F R
  5 LOG        002307 R   |   5 LSHIFT     0022FC R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0022EB R   |   5 NEXT       0022F3 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   5 NOT        0022E3 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000000 R   |   5 ODR        0022DB R   |     ONOFF   =  000003 
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0022D4 R
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      0022CA R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       0022B7 R
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   5 PINP       0022AE R
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 PMODE      0022C0 R   |   5 POKE       0022A5 R
    PORT    =  000003     |   5 POUT       00229C R   |     PREV    =  000001 
  5 PRINT      002292 R   |     PROD    =  000002     |   5 PRTA       002289 R
  5 PRTB       002280 R   |   5 PRTC       002277 R   |   5 PRTD       00226E R
  5 PRTE       002265 R   |   5 PRTF       00225C R   |   5 PRTG       002253 R
  5 PRTH       00224A R   |   5 PRTI       002241 R   |   5 QKEY       002238 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  5 READ       00222F R   |   5 REBOOT     002224 R   |     REG     =  000001 
    RELOP   =  000005     |   5 REMARK     002219 R   |   5 RESTORE    00220D R
    RETL1   =  000001     |   5 RETURN     002202 R   |     RET_ADDR=  000003 
    RET_INW =  000005     |   5 RND        0021FA R   |     ROP     =  004800 
  5 RSHIFT     0021EF R   |     RST_SR  =  0050B3     |   5 RUN        0021E7 R
    RXCHAR  =  000001     |   5 SAVE       0021DE R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       0021D5 R   |     SIGN    =  000001     |   5 SIZE       0021CC R
    SKIP    =  000005     |   5 SLEEP      0021C2 R   |     SPACE   =  000020 
  5 SPIEN      0021AE R   |   5 SPIRD      0021B8 R   |   5 SPISEL     0021A3 R
  5 SPIWR      002199 R   |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
    STACK_SI=  0000A0     |   5 STEP       002190 R   |   5 STOP       002187 R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      00217D R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_CCE=  000005     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCM=  005325     |     TIM3_CCM=  005326     |     TIM3_CCM=  000000 
    TIM3_CCM=  000004     |     TIM3_CCM=  000003     |     TIM3_CCR=  00532D 
    TIM3_CCR=  00532E     |     TIM3_CCR=  00532F     |     TIM3_CCR=  005330 
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  5 TIMEOUT    002167 R   |   5 TIMER      002173 R   |     TIM_CR1_=  000007 
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
    TK_VAR  =  000005     |   5 TO         002160 R   |   5 TONE       002157 R
    TWSAVE  =  000001     |   5 Timer4Up   000026 R   |     U8      =  000003 
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
    UART_CR5=  000002     |     UART_CR5=  000004     |     UART_CR5=  000005 
    UART_CR6=  000009     |     UART_CR6=  000004     |     UART_CR6=  000007 
    UART_CR6=  000001     |     UART_CR6=  000002     |     UART_CR6=  000000 
    UART_CR6=  000005     |     UART_DR =  000001     |     UART_GTR=  000009 
    UART_PSC=  00000A     |     UART_SR =  000000     |     UART_SR_=  000001 
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00214C R
  5 UBTN_Han   000069 R   |   5 UFLASH     002141 R   |   5 UNTIL      002137 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

  5 USER_ABO   000071 R   |     USE_BLOC=  000000     |   5 USR        00212F R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00003C R   |     VAR_ADDR=  000006 
    VSIZ    =  000002     |     VSIZE   =  000006     |     VT      =  00000B 
  5 WAIT       002126 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      00211C R   |   5 WRITE      002112 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        00210A R   |   5 XPEEK      002100 R   |     XSAVE   =  000005 
    YSAVE   =  000003     |   5 abs        001C73 R   |   1 acc16      00000C R
  1 acc24      00000B R   |   1 acc8       00000D R   |   5 accept_c   0009A0 R
  5 add        000D45 R   |   5 analog_r   001735 R   |   5 ansi_seq   000962 R
  5 arduino_   001D5E R   |   5 arg_list   000E84 R   |   1 array_si   000023 R
  5 ascii      001B3C R   |   5 at_tst     000B73 R   |   5 atoi24     000C86 R
  5 atoi_exi   000CF4 R   |   5 autorun    001BC5 R   |   5 autorun_   0005B6 R
  5 awu        001C24 R   |   5 awu02      001C2E R   |   5 bad_port   001B94 R
  1 base       00000A R   |   1 basicptr   000004 R   |   5 beep       0016BD R
  5 bin_exit   000A77 R   |   5 bit_and    001C87 R   |   5 bit_or     001C9F R
  5 bit_rese   001481 R   |   5 bit_set    001471 R   |   5 bit_test   0014A2 R
  5 bit_togg   001492 R   |   5 bit_xor    001CB7 R   |   5 bitmask    001E9E R
  5 bkslsh_t   000B1E R   |   5 bksp       0001D0 R   |   5 break_po   001802 R
  5 bye        001BBC R   |   5 char       001B2A R   |   5 check_fu   000365 R
  5 clear_ba   0005CB R   |   5 clear_va   00046F R   |   5 clock_in   00008C R
  5 cmd_end    0016A1 R   |   5 cmd_line   000773 R   |   5 cmd_name   000DF0 R
  5 cmp_name   001876 R   |   5 cold_sta   0004D4 R   |   5 colon_ts   000B47 R
  5 comma_ts   000B52 R   |   5 compile    000374 R   |   5 const_cr   001F52 R
  5 const_cr   001F58 R   |   5 const_dd   001F4C R   |   5 const_ee   001F6A R
  5 const_id   001F46 R   |   5 const_in   001F64 R   |   5 const_od   001F40 R
  5 const_ou   001F5E R   |   5 const_po   001F0A R   |   5 const_po   001F10 R
  5 const_po   001F16 R   |   5 const_po   001F1C R   |   5 const_po   001F22 R
  5 const_po   001F28 R   |   5 const_po   001F2E R   |   5 const_po   001F34 R
  5 const_po   001F3A R   |   5 convert_   0009FF R   |   1 count      000003 R
  5 cp_loop    000E33 R   |   5 create_g   0002C4 R   |   5 cs_high    0020F9 R
  5 cstk_pro   001077 R   |   5 dash_tst   000B68 R   |   5 data       001F70 R
  1 data_len   000009 R   |   5 data_lin   001F76 R   |   1 data_ofs   000008 R
  1 data_ptr   000006 R   |   5 data_sea   001FB6 R   |   5 dec_base   0010D2 R
  5 del_back   000991 R   |   5 del_line   00028C R   |   5 del_ln     000982 R
  5 delete     0001E0 R   |   5 digital_   001769 R   |   5 digital_   001799 R
  5 dir_loop   001A69 R   |   5 director   001A5D R   |   5 divide     000D9B R
  5 divu24_8   0008EF R   |   5 do_loop    001EC7 R   |   5 dotr_loo   001047 R
  5 drive_fr   001AE6 R   |   1 dstkptr    00001C R   |   5 enable_i   001E48 R
  5 eql_tst    000BD3 R   |   5 equal      00134B R   |   5 err_bad_   0006AA R
  5 err_cmd_   00066B R   |   5 err_div0   00062D R   |   5 err_dupl   000686 R
  5 err_math   000613 R   |   5 err_mem_   0005F6 R   |   5 err_msg    0005DC R
  5 err_no_a   0006B7 R   |   5 err_no_d   0006EB R   |   5 err_no_l   00063D R
  5 err_not_   000698 R   |   5 err_run_   000654 R   |   5 err_synt   000604 R
  5 escaped    000A14 R   |   5 expect     000E77 R   |   5 expr_exi   000FD1 R
  5 expressi   000F90 R   |   5 factor     000EE7 R   |   1 farptr     000016 R
  5 fcpu       001D01 R   |   7 fdrive     010000 R   |   1 ffree      000019 R
  5 file_cou   001ADE R   |   5 final_te   00095C R   |   5 first_li   001152 R
  1 flags      000025 R   |   5 for        001519 R   |   5 forget     001A12 R
  1 free_ram   00005C R   |   5 func_arg   000EAB R   |   5 func_not   001E3B R
  5 ge         00134D R   |   5 get_arra   000EC2 R   |   5 get_targ   0015E3 R
  5 get_tick   001C6D R   |   5 get_toke   000AB9 R   |   5 getc       0001BC R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

  5 gosub      001614 R   |   5 goto       0015F9 R   |   5 gpio       001B6F R
  5 gt         001349 R   |   5 gt_tst     000BDE R   |   5 hex_base   0010CD R
  5 if         001505 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   00182B R   |   5 input_ex   001443 R
  5 input_lo   0013E4 R   |   5 input_va   0013E2 R   |   5 insert_l   0002FD R
  5 insert_l   000362 R   |   5 interp     000747 R   |   5 interp_l   000787 R
  5 invert     001EB8 R   |   5 is_alpha   00047D R   |   5 is_digit   000C71 R
  5 itoa       0008A8 R   |   5 itoa_loo   0008C0 R   |   5 jp_to_ta   001607 R
  5 key        001B5C R   |   5 kword_di   00248E R   |   5 kword_en   0020FE R
  5 le         001352 R   |   5 leading_   001E8E R   |   5 left_arr   000962 R
  5 let        001103 R   |   5 let02      00110D R   |   5 lines_sk   001155 R
  5 list       001127 R   |   5 list_exi   00119E R   |   5 list_sta   001178 R
  5 load       0019D7 R   |   5 load_aut   000592 R   |   5 load_fil   0019A6 R
  5 log2       001E83 R   |   5 logical_   001E31 R   |   5 loop_bac   0015C6 R
  1 loop_dep   000022 R   |   5 loop_don   0015DB R   |   5 lshift     001CCF R
  5 lt         001350 R   |   5 lt_tst     000C17 R   |   5 modulo     000DDF R
  5 move       000226 R   |   5 move_dow   000244 R   |   5 move_exi   000265 R
  5 move_loo   000249 R   |   5 move_up    000236 R   |   5 mul_char   00133A R
  5 multiply   000D53 R   |   5 mulu24_8   000CF8 R   |   5 nbr_tst    000AF4 R
  5 ne         001355 R   |   5 neg_acc2   000917 R   |   5 new        001820 R
  5 next       001599 R   |   5 next_tok   0007B5 R   |   5 no_match   000E45 R
  5 none       000AB9 R   |   5 other      000C4F R   |   3 pad        001738 R
  5 parse_bi   000A57 R   |   5 parse_in   000A1C R   |   5 parse_ke   000A7F R
  5 parse_qu   0009C4 R   |   5 pause      001C11 R   |   5 pause02    001C1B R
  5 peek       0014D8 R   |   5 pin_mode   001D0D R   |   5 plus_tst   000BA7 R
  5 poke       0014C9 R   |   5 power_ad   0016F9 R   |   5 prcnt_ts   000BC8 R
  5 print      001358 R   |   5 print_ex   0013B6 R   |   5 print_in   00084A R
  5 prt_basi   0011F1 R   |   5 prt_cmd_   0011A1 R   |   5 prt_loop   00135C R
  5 prt_quot   0011B5 R   |   5 prti24     000802 R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0001B3 R   |   5 puts       0001C6 R
  5 qkey       001B64 R   |   5 qmark_ts   000B7E R   |   5 random     001D7E R
  5 read       001FEE R   |   5 read01     001FF0 R   |   5 readln     00093A R
  5 readln_l   000940 R   |   5 readln_q   0009B5 R   |   5 refresh_   001E7E R
  5 rel_exit   001028 R   |   5 relation   000FD4 R   |   5 relop_st   00133D R
  5 rem        001446 R   |   5 reprint    000962 R   |   5 reset_co   00135A R
  5 rest_con   0013D2 R   |   5 restore    001FA3 R   |   5 return     001634 R
  5 right_ar   000962 R   |   5 row_loop   0010B0 R   |   5 rparnt_t   000B3C R
  5 rshift     001CE8 R   |   5 run        001652 R   |   5 run_it     00167A R
  1 rx_char    000027 R   |   5 save       0018E2 R   |   5 save_con   0013C2 R
  5 search_d   000E22 R   |   5 search_e   000E73 R   |   5 search_f   001897 R
  5 search_l   000268 R   |   5 search_l   000270 R   |   5 search_n   000E26 R
  1 seedx      000012 R   |   1 seedy      000014 R   |   5 seek_fdr   001839 R
  5 select_p   001D4E R   |   5 set_time   001E1F R   |   5 sharp_ts   000B5D R
  5 show       00102B R   |   5 show_row   00109E R   |   5 single_c   001336 R
  5 size       0010D7 R   |   5 skip       000D32 R   |   5 slash_ts   000BBD R
  5 sleep      001C06 R   |   5 software   00048E R   |   5 spaces     0001EE R
  5 spi_clea   002092 R   |   5 spi_disa   00207A R   |   5 spi_enab   002048 R
  5 spi_rcv_   0020B4 R   |   5 spi_read   0020DF R   |   5 spi_sele   0020E7 R
  5 spi_send   00209E R   |   5 spi_writ   0020BF R   |   3 stack_fu   001760 R
  3 stack_un   001800 R   |   5 star_tst   000BB2 R   |   5 step       001572 R
  5 stop       0017D4 R   |   5 store_lo   001586 R   |   5 str_matc   000E54 R
  5 str_tst    000AE3 R   |   5 strcmp     000207 R   |   5 strcpy     000218 R
  5 strlen     0001FA R   |   5 substrac   000D4D R   |   5 syntax_e   000701 R
  1 tab_widt   000026 R   |   5 tb_error   000703 R   |   5 term       000F41 R
  5 term01     000F4A R   |   5 term_exi   000F8D R   |   3 tib        0016E8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

  5 tick_tst   000B95 R   |   1 ticks      00000E R   |   5 timeout    001E2E R
  1 timer      000010 R   |   5 timer2_i   0000A2 R   |   5 timer4_i   0000AF R
  5 to         001542 R   |   5 to_upper   000C7A GR  |   5 token_ch   000C5E R
  5 token_ex   000C6E R   |   5 tone       0016B0 R   |   5 try_next   001FDE R
  1 txtbgn     00001E R   |   1 txtend     000020 R   |   5 uart1_in   000178 R
  5 uart1_se   000188 R   |   5 ubound     0010E1 R   |   5 uflash     001B99 R
  5 unlock_e   0000C4 R   |   5 unlock_f   0000D2 R   |   5 until      001EDC R
  5 user_int   00004F R   |   5 user_spa   002500 R   |   5 usr        001B9F R
  1 vars       000028 R   |   5 wait       00144C R   |   5 warm_ini   00057B R
  5 warm_sta   000744 R   |   5 words      001DE5 R   |   5 write      001AF3 R
  5 write_bl   000155 R   |   5 write_by   0000E0 R   |   5 write_ee   00011C R
  5 write_ex   000150 R   |   5 write_fl   000106 R   |   5 xpeek      0014E9 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5C   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    118   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   250E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

